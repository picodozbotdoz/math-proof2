"""cross-math-fronttier pilot 77 (FB-5 T1) on Modal (app `crossmath-pilot-77`).

Lane A7, 2026-11-17. Cloned from the pilot-32/78 runner pattern, with the SUBSTRATE
SWAPPED to tauceti's own pin (the zeta23E own-lineage pattern): the pilot imports
TauCeti.Algebra.Lie.GeneralLinear.{TraceForm,CAR.Occupation}, which resolve against
tauceti's own lake-manifest mathlib (1b1ccf4b) — NOT our ff2494ea substrate. Image:
elan v4.2.4 + toolchain v4.36.0-rc2 + tauceti clone at d92acc5c + `lake exe cache get`
+ `lake build` of the two imported modules (and their tauceti dep closure).
Ephemeral `modal run` only — NO volume, NO secret, NO deploy.
Follow-up unit (lane R7, 2026-11-19): amended (a) modal_telemetry path → the main
checkout's probe dir, (b) FULL RAW OUTPUT dump on any non-clean verdict (the run-9
filter-blind-spot fix — rc=1/errors=0/sorryAx must never hide its error text again).

Usage (via run_pilot.sh, staging into /tmp/crossmath-77-t1-stage):
    modal run run_pilot.py --dir <stage-dir>
Each `<name>.lean` in the stage dir is elaborated by `lake env lean` inside the
tauceti checkout; sorry-warnings are FAIL; `#print axioms` output is echoed in full.
"""

import modal

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report more nproc than cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]


app = modal.App("crossmath-pilot-77")

TAUCETI_URL = "https://github.com/TauCetiProject/TauCeti.git"
TAUCETI_REV = "d92acc5c0393646e14960dfd4972fc836aad3ebe"
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
        "git init /opt/tauceti",
        f"cd /opt/tauceti && git remote add origin {TAUCETI_URL}",
        f"cd /opt/tauceti && git fetch --depth 1 origin {TAUCETI_REV} && git checkout -q FETCH_HEAD",
        # mathlib per tauceti's own manifest (1b1ccf4b), oleans from CI cache
        "cd /opt/tauceti && ELAN_HOME=/opt/elan /opt/elan/bin/lake exe cache get",
    )
    .run_commands(
        # the imported module closure only (not all of tauceti)
        "cd /opt/tauceti && ELAN_HOME=/opt/elan /opt/elan/bin/lake build TauCeti.Algebra.Lie.GeneralLinear.TraceForm TauCeti.Algebra.Lie.GeneralLinear.CAR.Occupation",
    )
    .env({"ELAN_HOME": "/opt/elan", "PATH": "/opt/elan/bin:/usr/local/bin:/usr/bin:/bin"})
)


image = image.add_local_python_source("modal_telemetry")


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def run(files: dict, order: list):
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/tauceti")

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[pilot] tauceti rev {TAUCETI_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in repo.joinpath(".lake", "packages", "mathlib",
                  ".lake", "build", "lib", "lean").rglob("*.olean")) \
        if repo.joinpath(".lake", "packages", "mathlib", ".lake", "build",
                         "lib", "lean").exists() else 0
    print(f"[pilot] mathlib oleans present: {n_olean}", flush=True)
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
        errors = [l for l in out.splitlines() if ": error:" in l or ": error(" in l
                  or l.startswith("error:")]
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
        tainted = "sorryAx" in out
        err_lines = [i for i, l in enumerate(lines) if ": error:" in l or ": error(" in l]
        # follow-up-unit upgrade (R7, 2026-11-19): the run-9 gremlin (rc=1 with
        # errors=0 and a sorryAx decl — the error text sat in the unprinted
        # region) gets full visibility: dump the COMPLETE raw output whenever the
        # run is not clean (rc != 0, any error line, any sorry-warning, or any
        # sorryAx in the axioms report). head/tail excerpts are no longer trusted
        # as the only evidence.
        if r.returncode != 0 or err_lines or sorry or tainted:
            print("---- FULL RAW OUTPUT (follow-up-unit runner: no truncation) ----",
                  flush=True)
            print(out, flush=True)
            print("---- END FULL RAW OUTPUT ----", flush=True)
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
