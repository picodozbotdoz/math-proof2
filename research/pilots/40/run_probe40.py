"""crossmath-probe-40 — statement-tier checkpoint probe for the Ξ_K′ family (dossier-40).

Lane R9, 2026-11-21. Same image recipe as `crossmath-probe` /
`crossmath-pilot-32` (elan v4.2.4 + toolchain v4.36.0-rc2 + mathlib4 @
ff2494ea + `lake exe cache get`) — image layers shared/cached with the other
apps. Ephemeral `modal run` only: NO volume, NO secret store, NO deploy (the
LEAN_NUM_THREADS cap is an inline Secret.from_dict, the pilot-32 CAP pattern).

Usage (via run_probe40.sh, which stages world-readable copies):
    modal run run_probe40.py --dir <stage-dir>

Each `<name>.lean` in the stage dir is elaborated by `lake env lean`.
PROBE verdict convention: SUCCESS = rc 0 AND zero `: error:` lines; `sorry`
warnings are EXPECTED (probe files carry the not-a-proof-artifact header) and
are counted in BOTH message forms (plain + backtick, the D4 runner-hygiene fix,
template `run_p0.py` `a3976f96`) so the expected-sorry count can be audited.
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
from modal_telemetry import SPEC, telemetered  # noqa: E402  (staged alongside this file)
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

app = modal.App("crossmath-probe-40")

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
    .add_local_python_source("modal_telemetry")
)


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def run(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[probe40] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[probe40] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[probe40] CACHE-MISS abort", flush=True)
        return {rel: "CACHE-MISS" for rel in order}

    for rel, content in files.items():
        p = repo / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(content)

    results = {}
    for rel in order:
        print(f"\n=== {rel}", flush=True)
        try:
            r = sh(["lake", "env", "lean", rel], timeout=2400)
        except subprocess.TimeoutExpired:
            print(f"[probe40] TIMEOUT elaborating {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if ": error:" in l or l.startswith("error:")]
        # D4 runner-hygiene fix: count BOTH sorry message forms.
        sorry = [l for l in out.splitlines()
                 if "declaration uses 'sorry'" in l or "declaration uses `sorry`" in l]
        verdict = "PROBE-OK" if not errors else \
            f"PROBE-FAIL rc={r.returncode} errors={len(errors)}"
        results[rel] = f"{verdict} sorry={len(sorry)}"
        print(f"[probe40] {rel}: {results[rel]}", flush=True)
        lines = out.splitlines()
        err_lines = [i for i, l in enumerate(lines) if ": error:" in l or l.startswith("error:")]
        if err_lines:
            print("---- error contexts ----", flush=True)
            shown = 0
            for i in err_lines:
                if shown >= 80:
                    break
                print("\n".join(lines[max(0, i - 1):i + 25]), flush=True)
                print("···", flush=True)
                shown += 1
        elif out.strip():
            print("---- output tail ----", flush=True)
            print("\n".join(lines[-40:]), flush=True)

    print("\n[probe40] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[probe40]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str):
    import pathlib
    stage = pathlib.Path(dir)
    files = {}
    order = []
    for f in sorted(stage.glob("*.lean")):
        files[f.name] = f.read_text()
        order.append(f.name)
    print(f"[probe40] staging {len(order)} file(s): {order}", flush=True)
    return run.remote(files, order)
