"""Axcheck batch on Modal (app `crossmath-probe`, same image as lean_probe.py —
no new Modal resources; ephemeral run only).

Elaborates the staged axcheck copies (pilot files + appended #print axioms) in
dependency order, compiling each to an .olean in /tmp/axstage so sibling imports
(P11T2 imports P11T1) resolve. One `lean -o` invocation per file both compiles
and prints the #print axioms report.

Usage (via research/feasibility/probe/run_axcheck.sh):
    modal run axcheck_probe.py --dir <stage-dir>
"""

import modal
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
def probe(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")
    stage = pathlib.Path("/tmp/axstage")
    stage.mkdir(exist_ok=True)
    for rel, content in files.items():
        (repo / rel).write_text(content)

    print(f"[ax] mathlib {MATHLIB_REV[:12]}, toolchain {TOOLCHAIN}", flush=True)
    r = subprocess.run(["bash", "-c", "cd /opt/mathlib && lake env printenv LEAN_PATH"],
                       capture_output=True, text=True)
    base_lp = r.stdout.strip()
    print(f"[ax] base LEAN_PATH: {base_lp}", flush=True)

    results = {}
    for rel in order:
        mod = rel[:-5]
        cmd = (f"cd /opt/mathlib && LEAN_PATH=/tmp/axstage:{base_lp} "
               f"lake env lean -o /tmp/axstage/{mod}.olean {rel}")
        print(f"\n=== {rel}", flush=True)
        try:
            r = subprocess.run(["bash", "-c", cmd], capture_output=True, text=True,
                               timeout=1500)
        except subprocess.TimeoutExpired:
            print(f"[ax] TIMEOUT on {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        ax = [l for l in out.splitlines() if "depends on axioms" in l]
        errs = [l for l in out.splitlines() if ": error" in l]
        bad = [l for l in ax if "sorryAx" in l or "sorry" in l]
        verdict = "OK" if r.returncode == 0 else f"FAIL rc={r.returncode} ({len(errs)} errors)"
        results[rel] = verdict + (f" | {len(ax)} axiom-lines, {len(bad)} with sorryAx"
                                  if ax else " | no axiom-lines")
        print(f"[ax] {rel}: {verdict}; axiom-lines={len(ax)}, sorryAx-lines={len(bad)}",
              flush=True)
        if out.strip():
            lines = out.splitlines()
            print("\n".join(lines[:40]), flush=True)
            if len(lines) > 40:
                print(f"(…{len(lines) - 40} more) tail:", flush=True)
                print("\n".join(lines[-12:]), flush=True)

    print("\n[ax] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[ax]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str):
    from pathlib import Path
    files, order = {}, []
    for p in sorted(Path(dir).glob("*.lean")):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no staged axcheck files in {dir}")
    print(f"[ax] staging {len(order)} file(s): {order}")
    probe.remote(files=files, order=order)
