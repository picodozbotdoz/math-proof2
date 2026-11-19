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
                rest = lines[40:-12] if len(lines) > 52 else []
                print(f"(…{len(lines) - 40} more) tail:", flush=True)
                print("\n".join(lines[-12:]), flush=True)
                # close-residue custody upgrade (R1, 2026-11-19; R3 F3b no-excerpt
                # rule for sweep-of-record logs): any "depends on axioms" line that
                # the head/tail excerpt elided is persisted IN FULL below, so a
                # persisted log always contains the lines it tallies.
                elided_ax = [l for l in rest if "depends on axioms" in l]
                if elided_ax:
                    print(f"---- {len(elided_ax)} elided axiom-lines persisted in full "
                          f"(close-residue custody rule, R3 F3b) ----", flush=True)
                    print("\n".join(elided_ax), flush=True)

    print("\n[ax] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[ax]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str):
    from pathlib import Path
    stage = Path(dir)
    files, order = {}, []
    staged = [p.name for p in sorted(stage.glob("*.lean"))]
    # order.txt support (close-residue fix 2, R1 2026-11-19): make_axcheck.py emits a
    # dependency-ordered order.txt (TARGETS list order) alongside the stage copies;
    # cross-stage import chains (AxPilot75_Pa -> AxPilot75_N2P0 -> AxPilot75_N2P1;
    # AxPilotAL3D_P0 -> A1 -> A2) need the olean of every dep BEFORE its consumer,
    # and sorted-name order does NOT give that ('N' < 'P' sorts N2P0 before Pa —
    # run1's failure). Absent order.txt, behavior is unchanged (sorted glob).
    order_file = stage / "order.txt"
    if order_file.exists():
        order = [l.strip() for l in order_file.read_text().splitlines() if l.strip()]
        missing = [f for f in order if f not in staged]
        unlisted = [f for f in staged if f not in order]
        if missing or unlisted:
            raise SystemExit(f"order.txt/stage mismatch: missing={missing} unlisted={unlisted}")
        print(f"[ax] order.txt found: dependency order overrides sorted glob")
    else:
        order = staged
    if not order:
        raise SystemExit(f"no staged axcheck files in {dir}")
    for name in order:
        files[name] = (stage / name).read_text()
    print(f"[ax] staging {len(order)} file(s): {order}")
    probe.remote(files=files, order=order)
