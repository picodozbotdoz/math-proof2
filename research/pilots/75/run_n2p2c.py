"""cross-math-fronttier pilot 75-N2 P2-c primitive-core runner (app `crossmath-pilot-75`).

Lane R6, 2026-11-19 (unit-8 P2-c authorization). Same image recipe as `run_n2p1.py`
(warm, shared layers); dependency-order olean elaboration (pilot-11 pattern):
    Pa.lean -> Pa.olean ; N2-P0.lean (staged as module `N2P0`) -> N2P0.olean ;
    N2-P1.lean (staged as module `N2P1`, byte-identical copy) -> N2P1.olean ;
    N2-P2c.lean (staged as module `N2P2c`; imports N2P1)
Both staged copies (`N2P0.lean`, `N2P1.lean`, `N2P2c.lean`) are module-NAME workarounds for the
hyphenated filenames (`import N2-P0`/`import N2-P1` are not legal module paths);
the repo files are untouched — the copies are byte-identical.
Ephemeral `modal run` only — NO volume, NO secret, NO deploy. Telemetry per AGENTS.md
§Modal usage guidelines (2 cpu / 4 GB soft, LEAN_NUM_THREADS=2).

Usage (via run_n2p2c.sh):  modal run run_n2p2c.py --dir <stage-files-dir>
"""

import modal

import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

app = modal.App("crossmath-pilot-75")  # same app name: shares the image bake

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        "curl -sSfL https://github.com/leanprover/elan/releases/download/v4.2.4/elan-x86_64-unknown-linux-gnu.tar.gz | tar xz -C /tmp",
        "mkdir -p /opt/elan",
        "ELAN_HOME=/opt/elan /tmp/elan-init -y --default-toolchain none",
        f"ELAN_HOME=/opt/elan /opt/elan/bin/elan toolchain install {TOOLCHAIN}",
    )
    .run_commands(
        "git init /opt/mathlib",
        f"cd /opt/mathlib && git remote add origin {MATHLIB_URL}",
        f"cd /opt/mathlib && git fetch --depth 1 origin {MATHLIB_REV} && git checkout -q FETCH_HEAD",
        "cd /opt/mathlib && ELAN_HOME=/opt/elan /opt/elan/bin/lake exe cache get",
    )
    .env({"ELAN_HOME": "/opt/elan", "PATH": "/opt/elan/bin:/usr/local/bin:/usr/bin:/bin"})
)

image = image.add_local_python_source("modal_telemetry")

ORDER = ["Pa.lean", "N2P0.lean", "N2P1.lean", "N2P2c.lean"]  # dependency order (engine, P0 quotes, P1, P2-c core)


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def run(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")
    stage = repo / "n2p2c"
    stage.mkdir(parents=True, exist_ok=True)

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[n2p2c] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[n2p2c] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[n2p2c] CACHE-MISS abort", flush=True)
        return {rel: "CACHE-MISS" for rel in order}

    r = sh("cd /opt/mathlib && lake env printenv LEAN_PATH")
    lp = r.stdout.strip()
    print(f"[n2p2c] mathlib LEAN_PATH: {lp}", flush=True)
    if not lp:
        return {rel: "NO-LEAN-PATH" for rel in order}

    for name, content in files.items():
        (stage / name).write_text(content)

    env = f'ELAN_HOME=/opt/elan PATH=/opt/elan/bin:/usr/local/bin:/usr/bin:/bin LEAN_PATH="{stage}:{lp}"'
    results = {}
    for name in order:
        stem = name[:-len(".lean")] if name.endswith(".lean") else name
        print(f"\n=== {name}", flush=True)
        cmd = f'cd {stage} && {env} lean -o {stem}.olean {name}'
        try:
            r = sh(cmd, timeout=2100)
        except subprocess.TimeoutExpired:
            print(f"[n2p2c] TIMEOUT (2100s) compiling {name}", flush=True)
            results[name] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if ": error" in l or l.startswith("error")]
        sorryw = [l for l in out.splitlines() if "sorry" in l.lower()]
        axioms = [l for l in out.splitlines() if "does not depend on any" in l
                  or "depends on axioms" in l]
        verdict = "OK" if (r.returncode == 0 and not errors and not sorryw) else \
            f"FAIL rc={r.returncode} errors={len(errors)} sorry={len(sorryw)}"
        results[name] = verdict
        print(f"[n2p2c] {name}: {verdict}", flush=True)
        if axioms:
            print("---- axioms ----", flush=True)
            print("\n".join(axioms), flush=True)
        lines = out.splitlines()
        err_lines = [i for i, l in enumerate(lines) if ": error" in l]
        if err_lines:
            print("---- error contexts ----", flush=True)
            shown = 0
            for i in err_lines:
                if shown >= 80:
                    break
                print("\n".join(lines[max(0, i - 1):i + 25]), flush=True)
                print("···", flush=True)
                shown += 1
        if out.strip():
            print("---- full output (first 200) ----", flush=True)
            print("\n".join(lines[:200]), flush=True)
            if len(lines) > 200:
                print(f"---- (…{len(lines) - 200} more lines) tail ----", flush=True)
                print("\n".join(lines[-50:]), flush=True)

    print("\n[n2p2c] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[n2p2c]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str):
    from pathlib import Path
    files, order = {}, []
    for name in ORDER:
        p = Path(dir) / name
        files[name] = p.read_text()
        order.append(name)
    run.remote(files, order)
