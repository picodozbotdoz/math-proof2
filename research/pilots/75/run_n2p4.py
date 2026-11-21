"""Pilot 75-N2 P4 statement rung on Modal (app `crossmath-pilot-75-p4`), 2026-11-21.

Lane R8 (worktree agent-05, iter-6 seed-1 re-task). Statement-elaboration PROBE of
`N2-P4.lean` (the uniform composed card pair — seed 1's target shape) on the plain
substrate: dependency-order olean elaboration of the GREEN chain
[Pa, N2P0, N2P1, N2P2c, N2P3, N2-P2d, N2-P3e] + the new statement file (the
run_n2p2d/run_n2p3e pattern verbatim; image recipe byte-shared with the 75-family
runners — elan v4.2.4, toolchain v4.36.0-rc2, mathlib ff2494ea + `lake exe cache get`).
Ephemeral `modal run` only — NO volume, NO secret, NO deploy.

RUNNER ONE-LINERS (binding, per the al3d run-9 record — M0-record.md 2026-11-21 + the
D4 ruling's backtick-form fix, template run_p0.py a3976f96): (1) the sorry filter
matches BOTH quote forms (`declaration uses 'sorry'` and ``declaration uses `sorry```)
via an anchored regex; (2) the error filter is the anchored `(?:^|: )error[:(]` regex
(catches the `error(lean.*)` code form); (3) the error-CONTEXT display uses the SAME
anchored regex as the count (the al3d display-path blind spot — old ": error:"
substring — closed here). A statement rung expects: 0 errors, 0 sorry (any form).

Usage (via run_n2p4.sh, which stages world-readable copies):
    modal run run_n2p4.py --dir <stage-dir>
"""

import modal
import re

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

# al3d one-liner (1)+(2): anchored error regex — `file:line:col: error:` AND the
# parenthesized code form `error(lean.synthInstanceFailed)`, plus position-less
# `error:` lines; prose inside hints does not match.
_LEAN_ERROR_RE = re.compile(r"(?:^|: )error[:(]")
# al3d one-liner (3) sibling: sorry warnings in BOTH quote forms (backtick form is
# what Lean 4 emits; the straight-quote-only filter was the run-9 false negative).
_LEAN_SORRY_RE = re.compile(r"declaration uses ['`]sorry['`]")

app = modal.App("crossmath-pilot-75-p4")

MATHLIB_REV = "ff2494ea5e438f8a8452db803068acd711fa0059"
MATHLIB_URL = "https://github.com/leanprover-community/mathlib4.git"
TOOLCHAIN = "leanprover/lean4:v4.36.0-rc2"

image = (
    modal.Image.debian_slim(python_version="3.12")
    .apt_install("curl", "git", "ca-certificates", "build-essential", "xz-utils")
    .run_commands(
        # Textually identical to run_n2p2d.py / run_n2p3e.py (shared layer cache).
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

ORDER = ["Pa.lean", "N2P0.lean", "N2P1.lean", "N2P2c.lean", "N2P3.lean", "N2P2d.lean",
         "N2P3e.lean", "N2-P4.lean"]  # STAGED names (hyphen->camel renames per run_n2p4.sh;
#  the last entry is the statement rung, staged under its repo name — nothing imports it)


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def run(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")
    stage = repo / "n2p4"
    stage.mkdir(parents=True, exist_ok=True)

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[n2p4] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[n2p4] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[n2p4] CACHE-MISS abort", flush=True)
        return {rel: "CACHE-MISS" for rel in order}

    r = sh("cd /opt/mathlib && lake env printenv LEAN_PATH")
    lp = r.stdout.strip()
    print(f"[n2p4] mathlib LEAN_PATH: {lp}", flush=True)
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
            print(f"[n2p4] TIMEOUT (2100s) compiling {name}", flush=True)
            results[name] = "TIMEOUT"
            continue
        out = r.stdout + r.stderr
        errors = [l for l in out.splitlines() if _LEAN_ERROR_RE.search(l)]
        sorryw = [l for l in out.splitlines() if _LEAN_SORRY_RE.search(l)]
        axioms = [l for l in out.splitlines() if "does not depend on any" in l
                  or "depends on axioms" in l]
        verdict = "OK" if (r.returncode == 0 and not errors and not sorryw) else \
            f"FAIL rc={r.returncode} errors={len(errors)} sorry={len(sorryw)}"
        results[name] = verdict
        print(f"[n2p4] {name}: {verdict}", flush=True)
        if axioms:
            print("---- axioms ----", flush=True)
            print("\n".join(axioms), flush=True)
        lines = out.splitlines()
        # al3d one-liner (3): the DISPLAY path uses the SAME anchored regex as the
        # count (no ": error:"-substring-only blind spot for the error(lean.*) form).
        err_lines = [i for i, l in enumerate(lines) if _LEAN_ERROR_RE.search(l)]
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
            print("---- full output (COMPLETE; F1/F3b custody) ----", flush=True)
            print(out, flush=True)

    print("\n[n2p4] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[n2p4]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str):
    from pathlib import Path
    files, order = [], []
    for name in ORDER:
        p = Path(dir) / name
        files.append((name, p.read_text()))
        order.append(name)
    run.remote(files=dict(files), order=order)
