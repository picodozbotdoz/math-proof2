"""cross-math-fronttier iteration-4 AL-3D pilot on Modal (app `crossmath-pilot-al3d`).

STAGED-NO-RUN (lane R5, 2026-11-16, launch-prep queue item 2). Executes at charter
typeset per qa/iter4-review/r5-iteration4-backlog.md §11/§14 run 3 (AL-P0 statement
probe) and run 7 (AL-P1 fibre core). Logs → research/pilots/al3d/logs/ with provenance
headers.

Clone of pilots/73/run_pilot.py per al-3d-prework.md §4 (the probe-convention check is
native to the 73 source and kept: AL-P0 is a statement probe whose sorry stubs are
probe-convention-only; A1/A2 stay sorry-strict). Elaboration order P0 < A1 < A2 (A4
restructure 2026-11-17: P0 first — the statement layer owns the encoding defs since the
A1 R4-style dedup; A1 imports P0, A2 imports A1 + P0 — same-directory import resolution,
pilot-11 precedent; P0* first also keeps the probe-convention file's verdict visible).
Expected class: [WARM] C1/C2 heavy-import
(G4-style entropy core; mmapped-olean RSS ≈5–6 GB is inherent, not a breach).

Layer-sharing diff-check (recorded 2026-11-16): the image block — apt_install list,
both .run_commands chunks (elan v4.2.4 URL / ELAN_HOME setup / toolchain
v4.36.0-rc2 / mathlib ff2494ea fetch + `lake exe cache get`) and .env — is
BYTE-IDENTICAL to pilots/73/run_pilot.py and pilots/75/run_pilot.py (verified by diff
this session; only app name, docstring, print tags differ). The expensive image layers
are therefore shared with the probe/axbump/71/73/75 family. Ephemeral `modal run` only
— NO volume, NO secret, NO deploy.

AGENTS.md § Modal usage guidelines compliance: SPEC 2 cpu / 4 GB (soft) + @telemetered
+ LEAN_NUM_THREADS=2 — all present (verified against the source; nothing missing).

Usage (via run_pilot.sh, which stages world-readable copies):
    modal run run_pilot.py --dir <stage-dir>
Each `<name>.lean` in the stage dir is elaborated by `lake env lean`; sorry-warnings
are FAIL for kept artifacts (A1.lean, A2.lean) and ALLOWED, by probe convention, for
files whose name starts with `P0` (statement probes).
"""

import modal
import re

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

# Lean-4 error-line matcher (filter fix, 2026-11-18 — lane A4 process find from the
# runs 10/12 "errors=0" false-negatives): Lean emits BOTH `file:line:col: error: msg`
# and the parenthesized-code form `file:line:col: error(lean.synthInstanceFailed): msg`
# (also error(lean.unknownIdentifier), error(lean.maxRecDepth), …), plus rare
# position-less `error: msg` lines. The old substring filter `": error:" in l` missed
# the paren form entirely — two runs read errors=0 while carrying real errors. The
# anchored pattern below requires `error` preceded by line-start or ": " and followed
# by ":" or "(", so prose inside warning hints (e.g. "Hint: … error …") does not match.
_LEAN_ERROR_RE = re.compile(r"(?:^|: )error[:(]")


app = modal.App("crossmath-pilot-al3d")

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

    print(f"[al3d] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[al3d] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[al3d] CACHE-MISS abort", flush=True)
        return {rel: "CACHE-MISS" for rel in order}

    # Sibling-import mechanism (pilot-11 precedent): multi-file batches are staged in
    # a SEPARATE dir (repo/AL3D — never the repo root: a root LEAN_PATH entry lets the
    # Mathlib SOURCE tree hijack olean resolution) and compiled to .olean in dependency
    # order with that dir prepended to LEAN_PATH, so later files `import` earlier ones
    # (A2 imports A1). Single-file batches keep the plain `lake env lean` path.
    multi = len(order) > 1
    stage = repo / "AL3D"
    if multi:
        stage.mkdir(parents=True, exist_ok=True)
        for rel, content in files.items():
            (stage / rel).write_text(content)
    else:
        for rel, content in files.items():
            p = repo / rel
            p.parent.mkdir(parents=True, exist_ok=True)
            p.write_text(content)
    lp = sh("cd /opt/mathlib && lake env printenv LEAN_PATH").stdout.strip()
    if not lp:
        lp = str(repo / ".lake/build/lib/lean")
    print(f"[al3d] LEAN_PATH base: {lp}", flush=True)
    env = (f'ELAN_HOME=/opt/elan PATH=/opt/elan/bin:/usr/local/bin:/usr/bin:/bin '
           f'LEAN_PATH="{stage}:{lp}"') if multi else None

    results = {}
    for rel in order:
        print(f"\n=== {rel}", flush=True)
        try:
            if multi and env:
                stem = rel[:-len(".lean")] if rel.endswith(".lean") else rel
                r = sh(f"cd {stage} && {env} lean -o {stem}.olean {rel} && "
                       f"{env} lean {rel}", timeout=2400)
            else:
                r = sh(["lake", "env", "lean", rel], timeout=2400)
        except subprocess.TimeoutExpired:
            print(f"[al3d] TIMEOUT elaborating {rel}", flush=True)
            results[rel] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if _LEAN_ERROR_RE.search(l)]
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
        print(f"[al3d] {rel}: {verdict}", flush=True)
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
            print("\n".join(lines[-200:]), flush=True)

    print("\n[al3d] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[al3d]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str = "./stage"):
    from pathlib import Path
    files, order = {}, []
    # A4 restructure: P0* first (statement layer; owns the encoding defs), then the rest
    # alphabetically — respects P0 → A1 → A2 (A1 imports P0; A2 imports A1 + P0).
    for p in sorted(Path(dir).glob("*.lean"),
                    key=lambda p: (0 if p.name.startswith("P0") else 1, p.name)):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no .lean files found in {dir}")
    print(f"[al3d] staging {order}")
    run.remote(files=files, order=order)
