"""cross-math-fronttier port-probe on Modal (app `crossmath-probe`).

Created under the task-level authorization (2026-11-09, lane R9 round 2: "a
one-time v4.36 Modal build is authorized — report its cost") following the
`lean_tauceti.py` precedent (user-authorized 2026-10-30): ephemeral `modal
run` only — NO volume, NO secret, NO `modal deploy`, NO persistent resources.

Purpose: elaborate donor STATEMENT files (zeta23 RHLinalg, eth time machinery,
3sum-apsp EndStatement) and mathlib-v4.36 declaration smoke probes against the
encore-mathlib checkout's exact revision. Image bakes: elan v4.2.4 + toolchain
leanprover/lean4:v4.36.0-rc2 + a clone of mathlib4 at MATHLIB_REV + the mathlib
olean cache via `lake exe cache get` (artifacts from mathlib CI).

If `lake exe cache get` yields no artifacts for a too-fresh master commit, set
MATHLIB_REV=master-2026-11-08 (the nightly tag 14 commits behind the checkout;
per local `git diff` the only probe-relevant file it lacks changes in is
HurwitzZetaValues.lean, which no probe touches).

Usage (via research/feasibility/probe/run_probe.sh, which stages files):
    modal run lean_probe.py --dir <stage-dir>
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

import os

app = modal.App("crossmath-probe")

MATHLIB_REV = os.environ.get(
    "MATHLIB_REV", "ff2494ea5e438f8a8452db803068acd711fa0059")
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # Textually identical to lean_check.py / lean_tauceti.py so the elan
        # layer cache is shared with the existing math-proof1 images.
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


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def probe(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")

    def sh(cmd, timeout=1800):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[probe] mathlib rev {MATHLIB_REV[:12]} ({MATHLIB_REV})", flush=True)
    r = sh(["git", "rev-parse", "HEAD"])
    print(f"[probe] HEAD in container: {r.stdout.strip()}", flush=True)
    r = sh(["cat", "lean-toolchain"])
    print(f"[probe] toolchain: {r.stdout.strip()}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[probe] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[probe] CACHE-MISS: olean cache incomplete — aborting before any "
              "module rebuilds. Retry with MATHLIB_REV=master-2026-11-08.", flush=True)
        return {"ProbeSmoke": "CACHE-MISS"}

    for rel, content in files.items():
        p = repo / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(content)

    results = {}
    for rel in order:
        print(f"\n=== {rel}", flush=True)
        try:
            r = sh(["lake", "env", "lean", rel], timeout=1500)
        except subprocess.TimeoutExpired:
            print(f"[probe] TIMEOUT (1500s) elaborating {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines()
                  if ": error:" in l or l.startswith("error:")]
        warnings = [l for l in out.splitlines()
                    if ": warning:" in l and "declaration uses 'sorry'" in l]
        other_warn = [l for l in out.splitlines()
                      if ": warning:" in l and "declaration uses 'sorry'" not in l]
        verdict = "OK" if r.returncode == 0 else f"FAIL rc={r.returncode}"
        results[rel] = verdict if not errors else f"FAIL ({len(errors)} errors)"
        print(f"[probe] {rel}: {verdict}; errors={len(errors)}, "
              f"sorry-warnings={len(warnings)}, other-warnings={len(other_warn)}",
              flush=True)
        if out.strip():
            lines = out.splitlines()
            # errors first (they sit at the top), then tail for summary lines
            head = lines[:60]
            print("---- output head ----", flush=True)
            print("\n".join(head), flush=True)
            if len(lines) > 60:
                print(f"---- (…{len(lines) - 60} more lines) tail ----", flush=True)
                print("\n".join(lines[-15:]), flush=True)

    print("\n[probe] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[probe]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str = "./probes"):
    from pathlib import Path
    files, order = {}, []
    for p in sorted(Path(dir).glob("*.lean")):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no .lean probe files found in {dir}")
    print(f"[probe] staging {len(order)} probe file(s): {order}")
    probe.remote(files=files, order=order)
