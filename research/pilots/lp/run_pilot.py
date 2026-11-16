"""cross-math-fronttier iteration-4 LP pilot on Modal (app `crossmath-pilot-lp`).

STAGED-NO-RUN (lane R5, 2026-11-16, launch-prep queue item 1). Executes at charter
typeset per qa/iter4-review/r5-iteration4-backlog.md §9/§14 run 1 (LP-P0 probe) and
run 4/11 (LP-P1 layer / LP-P2 consumer). Logs → research/pilots/lp/logs/ with
provenance headers.

Clone of pilots/75/run_pilot.py with ONE functional fix: the 73-style probe-convention
check is RESTORED (75's clone had dropped it) — LP-P0 is a statement probe whose sorry
stubs are probe-convention-only ("not a proof artifact" header per AGENTS.md); L1/L2
stay sorry-strict. Sorted elaboration order L1 < L2 < P0 respects the L1→L2 import
direction (lake env lean resolves the same-directory import; pilot-11 precedent).

Layer-sharing diff-check (recorded 2026-11-16): the image block — apt_install list,
both .run_commands chunks (elan v4.2.4 URL / ELAN_HOME setup / toolchain
v4.36.0-rc2 / mathlib ff2494ea fetch + `lake exe cache get`) and .env — is
BYTE-IDENTICAL to pilots/75/run_pilot.py and pilots/73/run_pilot.py (verified by diff
this session; only app name, docstring, print tags differ). The expensive image layers
are therefore shared with the probe/axbump/71/73/75 family. Ephemeral `modal run` only
— NO volume, NO secret, NO deploy.

AGENTS.md § Modal usage guidelines compliance: SPEC 2 cpu / 4 GB (soft) + @telemetered
+ LEAN_NUM_THREADS=2 — all present in this clone (verified against the source; nothing
was missing, nothing was dropped in the clone).

Usage (via run_pilot.sh, which stages world-readable copies):
    modal run run_pilot.py --dir <stage-dir>
Each `<name>.lean` in the stage dir is elaborated by `lake env lean`; sorry-warnings
are FAIL for kept artifacts (L1.lean, L2.lean) and ALLOWED, by probe convention, for
files whose name starts with `P0` (statement probes).
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]


app = modal.App("crossmath-pilot-lp")

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


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def run(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[lp] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[lp] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[lp] CACHE-MISS abort", flush=True)
        return {rel: "CACHE-MISS" for rel in order}

    for rel, content in files.items():
        p = repo / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(content)

    results = {}
    for rel in order:
        print(f"\n=== {rel}", flush=True)
        # Sibling imports (e.g. `import L1` from L2.lean) do NOT resolve under bare
        # `lake env lean` (no search-path entry covers the staging root — L2 run-1
        # finding, 2026-11-16). Fix: dependency-order olean emission into the
        # LEAN_PATH-visible build dir (the pilots/10/axcheck_full.py pattern); the
        # sorted order (L1 < L2 < P0) is the dependency order for this pilot.
        stem = rel[:-len(".lean")] if rel.endswith(".lean") else rel
        try:
            r = sh(["lake", "env", "lean", "-o",
                    f".lake/build/lib/lean/{stem}.olean", rel], timeout=2400)
        except subprocess.TimeoutExpired:
            print(f"[lp] TIMEOUT elaborating {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if ": error" in l or l.startswith("error")]  # R8-d2: widened to error(<code>) forms (m4b2 debt-(b) fix)
        sorry = [l for l in out.splitlines() if "declaration uses 'sorry'" in l]
        axioms = [l for l in out.splitlines() if "'does not depend on any axioms'" in l
                  or "depends on axioms:" in l]
        # probe convention: P0* files are statement probes (sorry allowed)
        probe = rel.startswith("P0")
        if probe:
            verdict = "OK (probe, sorry allowed)" if (r.returncode == 0 and not errors) \
                else f"FAIL rc={r.returncode} errors={len(errors)}"
            if sorry:
                verdict += f" [sorry x{len(sorry)}, expected for probe]"
        else:
            verdict = "OK" if (r.returncode == 0 and not errors and not sorry) else \
                f"FAIL rc={r.returncode} errors={len(errors)} sorry={len(sorry)}"
        results[rel] = verdict
        print(f"[lp] {rel}: {verdict}", flush=True)
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

    print("\n[lp] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[lp]   {rel}: {v}", flush=True)
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
    print(f"[lp] staging {order}")
    run.remote(files=files, order=order)
