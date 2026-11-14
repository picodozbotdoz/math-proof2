"""cross-math-fronttier pilot-11 Modal runner (app `crossmath-probe` image reuse).

Mirrors research/feasibility/probe/lean_probe.py (R9): same image bake (elan v4.2.4 +
leanprover/lean4:v4.36.0-rc2 + mathlib4 clone at MATHLIB_REV + `lake exe cache get`
oleans), so the image layer cache is shared. Ephemeral `modal run` only — no volumes,
no secrets, no deploy. Difference from R9's probe: compiles the pilot's tranche files
in dependency order, producing .olean files so later tranches can import earlier ones
(LEAN_PATH = pilot dir : mathlib build path), and reports per-file verdicts including
`#print axioms` output from the tail of each compile.

Usage (via research/pilots/11/run_pilot11.sh):
    sudo -u xyz .../modal run pilot11_probe.py
Files are read from the staged directory embedded by the local entrypoint.
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

import os

app = modal.App("crossmath-probe")  # same app name as R9's probe: reuses the image

MATHLIB_REV = os.environ.get(
    "MATHLIB_REV", "ff2494ea5e438f8a8452db803068acd711fa0059")

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        "curl -sSfL https://github.com/leanprover/elan/releases/download/v4.2.4/elan-x86_64-unknown-linux-gnu.tar.gz | tar xz -C /tmp",
        "mkdir -p /opt/elan",
        "ELAN_HOME=/opt/elan /tmp/elan-init -y --default-toolchain none",
        f"ELAN_HOME=/opt/elan /opt/elan/bin/elan toolchain install leanprover/lean4:v4.36.0-rc2",
    )
    .run_commands(
        "git init /opt/mathlib",
        f"cd /opt/mathlib && git remote add origin https://github.com/leanprover-community/mathlib4.git",
        f"cd /opt/mathlib && git fetch --depth 1 origin {MATHLIB_REV} && git checkout -q FETCH_HEAD",
        "cd /opt/mathlib && ELAN_HOME=/opt/elan /opt/elan/bin/lake exe cache get",
    )
    .env({"ELAN_HOME": "/opt/elan", "PATH": "/opt/elan/bin:/usr/local/bin:/usr/bin:/bin"})
)


image = image.add_local_python_source("modal_telemetry")


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def pilot(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")
    p11 = repo / "p11"
    p11.mkdir(parents=True, exist_ok=True)

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[p11] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[p11] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[p11] CACHE-MISS — aborting (retry with MATHLIB_REV=master-2026-11-08)",
              flush=True)
        return {"P11": "CACHE-MISS"}

    r = sh("cd /opt/mathlib && lake env printenv LEAN_PATH")
    lp = r.stdout.strip()
    print(f"[p11] mathlib LEAN_PATH: {lp}", flush=True)
    if not lp:
        return {"P11": "NO-LEAN-PATH"}

    for name, content in files.items():
        (p11 / name).write_text(content)

    env = f'ELAN_HOME=/opt/elan PATH=/opt/elan/bin:/usr/local/bin:/usr/bin:/bin LEAN_PATH="{p11}:{lp}"'
    results = {}
    for name in order:
        stem = name[:-len(".lean")] if name.endswith(".lean") else name
        print(f"\n=== {name}", flush=True)
        cmd = f'cd {p11} && {env} lean -o {stem}.olean {name}'
        try:
            r = sh(cmd, timeout=2100)
        except subprocess.TimeoutExpired:
            print(f"[p11] TIMEOUT (2100s) compiling {name}", flush=True)
            results[name] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if ": error:" in l or l.startswith("error:")]
        sorryw = [l for l in out.splitlines() if "declaration uses 'sorry'" in l]
        axioms = [l for l in out.splitlines()
                  if l.startswith("'") and "does not depend on any" in l or
                     l.startswith("'") and "depends on axioms" in l]
        verdict = "OK" if r.returncode == 0 else f"FAIL rc={r.returncode}"
        results[name] = f"{verdict}" if not errors else f"FAIL ({len(errors)} errors)"
        print(f"[p11] {name}: {verdict}; errors={len(errors)}, sorry-warnings={len(sorryw)}",
              flush=True)
        for a in axioms:
            print(f"[p11] AXIOMS {a}", flush=True)
        if out.strip():
            lines = out.splitlines()
            print("---- output head ----", flush=True)
            print("\n".join(lines[:40]), flush=True)
            if len(lines) > 40:
                print(f"---- (…{len(lines) - 40} more lines) tail ----", flush=True)
                print("\n".join(lines[-25:]), flush=True)

    print("\n[p11] SUMMARY", flush=True)
    for name, v in results.items():
        print(f"[p11]   {name}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str = "./pilot11"):
    from pathlib import Path
    files, order = {}, []
    for p in sorted(Path(dir).glob("*.lean")):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no .lean files found in {dir}")
    print(f"[p11] staging {len(order)} file(s): {order}")
    pilot.remote(files=files, order=order)
