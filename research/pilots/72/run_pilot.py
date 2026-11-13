"""cross-math-fronttier Phase-3 pilots on Modal (app `crossmath-pilot-72`).

Lane A4, 2026-11-13. Same image recipe as R9's `crossmath-probe`
(research/feasibility/probe/lean_probe.py — elan v4.2.4 + toolchain
v4.36.0-rc2 + mathlib4 clone at ff2494ea + `lake exe cache get`), so the
expensive image layers are shared/cached with the probe runs. Ephemeral
`modal run` only — NO volume, NO secret, NO deploy.

Usage (via run_pilot.sh, which stages world-readable copies):
    modal run run_pilot.py --dir <stage-dir>
Each `<name>.lean` in the stage dir is elaborated by `lake env lean`;
`sorry`-warnings are treated as FAIL (kept artifacts must be sorry-free).
"""

import modal

app = modal.App("crossmath-pilot-72")

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


@app.function(image=image, cpu=4.0, memory=32768, timeout=2 * 60 * 60)
def run(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[pilot] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[pilot] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[pilot] CACHE-MISS abort", flush=True)
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
            print(f"[pilot] TIMEOUT elaborating {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if ": error:" in l or l.startswith("error:")]
        sorry = [l for l in out.splitlines() if "declaration uses 'sorry'" in l]
        axioms = [l for l in out.splitlines() if "'does not depend on any axioms'" in l
                  or "depends on axioms:" in l]
        verdict = "OK" if (r.returncode == 0 and not errors and not sorry) else \
            f"FAIL rc={r.returncode} errors={len(errors)} sorry={len(sorry)}"
        results[rel] = verdict
        print(f"[pilot] {rel}: {verdict}", flush=True)
        if axioms:
            print("---- axioms ----", flush=True)
            print("\n".join(axioms), flush=True)
        lines = out.splitlines()
        err_lines = [i for i, l in enumerate(lines) if ": error:" in l]
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
            print("\n".join(lines[-30:]), flush=True)

    print("\n[pilot] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[pilot]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str = "./stage"):
    from pathlib import Path
    files, order = {}, []
    for p in sorted(Path(dir).glob("*.lean")):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no .lean files found in {dir}")
    print(f"[pilot] staging {order}")
    run.remote(files=files, order=order)
