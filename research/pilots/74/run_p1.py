"""cross-math-fronttier pilot 74 P1-completion runner (app `crossmath-pilot-74p1`).
Lane A8, 2026-11-18 (the re-chartered P1-completion: verify-fire discipline, fresh
<=5-run budget, sha guard enforced by stage_and_fire.sh).

Clone of pilot 73's runner (same image recipe: elan v4.2.4 + toolchain v4.36.0-rc2 +
mathlib4 clone at ff2494ea + `lake exe cache get`, textually identical run_commands so
the expensive image layers are shared/cached with the gprobe/pilot-73 lineage — the
RESEARCH.md ground rule). Ephemeral `modal run` only — NO volume, NO secret (beyond the
LEAN_NUM_THREADS cap), NO deploy. Route: doz CLI `/home/doz/dozenv/bin/modal` (the
2026-11-17 route ruling — this app has no prior lineage, doz-side keeps the layer cache).

Difference vs pilot-73's runner (the P1 fix-loop need): FULL error output — every error
line gets its 25-line context printed (no 12k-char cap; the 74-P1 runs 1-6 descent was
partially blind because the probe route printed only the first ~12k chars). Error
counter widened to `": error"` + `error(...)` forms (gprobe 2026-11-17 lesson).

Usage (via stage_and_fire.sh, which enforces the sha guard):
    modal run run_p1.py --dir <stage-dir>
Each `<name>.lean` in the stage dir is elaborated by `lake env lean`. `sorry`-warnings
are FAIL for P1.lean (proof artifact); the trailing `#print axioms` block prints the
triad report.
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]


app = modal.App("crossmath-pilot-74p1")

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # Textually identical to lean_probe.py / gprobe.py / run_pilot.py so the layer
        # cache is shared.
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
def run(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[p74p1] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[p74p1] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[p74p1] CACHE-MISS abort", flush=True)
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
            print(f"[p74p1] TIMEOUT elaborating {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if ": error" in l or l.startswith("error")]
        sorry = [l for l in out.splitlines() if "declaration uses 'sorry'" in l]
        axioms = [l for l in out.splitlines() if "'does not depend on any axioms'" in l
                  or "depends on axioms:" in l]
        verdict = "OK" if (r.returncode == 0 and not errors and not sorry) else \
            f"FAIL rc={r.returncode} errors={len(errors)} sorry={len(sorry)}"
        results[rel] = verdict
        print(f"[p74p1] {rel}: {verdict}", flush=True)
        if axioms:
            print("---- axioms ----", flush=True)
            print("\n".join(axioms), flush=True)
        lines = out.splitlines()
        err_lines = [i for i, l in enumerate(lines) if ": error" in l]
        if err_lines:
            print(f"---- error contexts ({len(err_lines)} errors, all shown) ----", flush=True)
            shown = 0
            for i in err_lines:
                if shown >= 120:
                    print(f"··· {len(err_lines) - shown} more errors truncated", flush=True)
                    break
                print("\n".join(lines[max(0, i - 1):i + 25]), flush=True)
                print("···", flush=True)
                shown += 1
        elif out.strip():
            print("---- output tail ----", flush=True)
            print("\n".join(lines[-30:]), flush=True)

    print("\n[p74p1] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[p74p1]   {rel}: {v}", flush=True)
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
    print(f"[p74p1] staging {order}")
    print(run.remote(files=files, order=order))
