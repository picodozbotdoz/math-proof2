"""axb_close_iter4 — close-act Step-B(ii) FULL-COVERAGE CUSTODY batch runner
(lane R1, verification-integrity, 2026-11-19; close-act runbook §3 Step 9).

Fuses the two established runner classes:
  - axcheck_probe.py's dependency-ordered OLEAN EMISSION (`lake env lean -o
    /tmp/axstage/<mod>.olean` + LEAN_PATH, order.txt override of the sorted glob —
    the close-residue fix-2 mechanism), so cross-stage import chains
    (AxDep_75Pa -> AxDep_75N2P0 -> AxFC_75_N2P1run19; AL3D P0 -> A1 -> A2;
    73_C -> Q4) resolve inside one batch;
  - pilots/75/axcheck_run75.py's CUSTODY rules (complete-output dump with NO
    excerpting — R3 F1/F3b; in-run wrapped-record joining + triad classification;
    scan-compatible verdict line `[ax] <file>: OK; axiom-lines=N, sorryAx-lines=M`;
    per-stage sha256 stamps = bytes of record, FINAL-SWEEP-PLAN-ITER4 §2.4).

Stage-name classes (by prefix, set by the staging side):
  AxFC_*  full-coverage custody stage (axcheck_iter4.py gen output — #print axioms
          tail on EVERY theorem/lemma decl, private included);
  AxDep_* compile-only dependency stage (verbatim copy + block-comment header, no
          appended prints; verdict = compile check only, never an audit row).

Ephemeral `modal run` on the crossmath-probe app/image family (no volume, no
secret beyond the LEAN_NUM_THREADS cap, no deploy). Telemetry per AGENTS.md
§Modal (2 cpu / 4 GB soft, LEAN_NUM_THREADS=2).

Usage (stages + order.txt prepared by the wrapper):
    modal run axb_close_iter4.py --dir <stage-dir>
"""

import modal

import re

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on every
# run, LEAN_NUM_THREADS capped to the spec (Modal containers report nproc >> cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

app = modal.App("crossmath-probe")

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

TRIAD = {"propext", "Classical.choice", "Quot.sound"}


def join_records(lines):
    """axcheck_iter4.join_records logic (verbatim class, T9-fixed): join a wrapped
    `'name' depends on axioms: […` record until brackets balance; primed names
    pair via greedy backtracking to the last quote."""
    records, cur = [], None

    def complete(rest):
        return "[" in rest and rest.count("[") - rest.count("]") <= 0

    for line in lines:
        s = line.strip()
        m = re.match(r"^'(.*)'\s+depends on axioms:\s*(.*)$", s)
        noax = re.match(r"^'(.*)'\s+does not depend on any axioms", s)
        if m or noax:
            if cur:
                records.append(cur)
                cur = None
            if noax:
                records.append([noax.group(1), ""])
            elif complete(m.group(2)):
                records.append([m.group(1), m.group(2)])
            else:
                cur = [m.group(1), m.group(2)]
            continue
        if cur is not None:
            cur[1] = (cur[1] + " " + s).strip()
            if complete(cur[1]):
                records.append(cur)
                cur = None
    if cur:
        records.append(cur)
    out = []
    for name, rest in records:
        rest = rest.strip()
        if "]" in rest:
            rest = rest[: rest.rindex("]") + 1]
        ax = [t.strip() for t in rest.strip("[]").split(",") if t.strip()]
        out.append((name, ax, "sorryAx" in rest))
    return out


@app.function(image=image, **SPEC, secrets=CAP, timeout=3 * 60 * 60)
@telemetered
def run(files: dict, order: list):
    import hashlib
    import pathlib
    import subprocess

    repo = pathlib.Path("/opt/mathlib")
    stage_ol = pathlib.Path("/tmp/axstage")
    stage_ol.mkdir(exist_ok=True)

    print(f"[axb] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[axb] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[axb] CACHE-MISS abort", flush=True)
        return {rel: "CACHE-MISS" for rel in order}

    for rel, content in files.items():
        (repo / rel).write_text(content)
        print(f"[axb] staged {rel}: sha256 {hashlib.sha256(content.encode()).hexdigest()}",
              flush=True)

    r = subprocess.run(["bash", "-c", "cd /opt/mathlib && lake env printenv LEAN_PATH"],
                       capture_output=True, text=True)
    base_lp = r.stdout.strip()

    results = {}
    for rel in order:
        mod = rel[:-5]
        is_dep = mod.startswith("AxDep_")
        print(f"\n=== {rel}", flush=True)
        cmd = (f"cd /opt/mathlib && LEAN_PATH=/tmp/axstage:{base_lp} "
               f"lake env lean -o /tmp/axstage/{mod}.olean {rel}")
        try:
            r = subprocess.run(["bash", "-c", cmd], capture_output=True, text=True,
                               timeout=2400)
        except subprocess.TimeoutExpired:
            print(f"[ax] {rel}: FAIL timeout after 2400s; axiom-lines=0, sorryAx-lines=0",
                  flush=True)
            results[rel] = "FAIL timeout"
            continue
        out = r.stdout + r.stderr
        # F1/F3b custody: the COMPLETE output persists — no excerpting, no filtering.
        print(out, flush=True)
        lines = out.splitlines()
        # widened error counters (R3 F3a): ': error:' + error(<code>) forms
        errors = [l for l in lines if ": error:" in l or l.startswith("error")
                  or re.search(r"error\([A-Za-z0-9_.]+\)", l)]
        sorry_warnings = [l for l in lines if "declaration uses 'sorry'" in l
                          or "declaration uses `sorry`" in l]
        recs = join_records(lines)
        n_openers = sum(1 for l in lines
                        if re.match(r"^'.*'\s+(depends on axioms|does not depend on any axioms)",
                                    l.strip()))
        sorry_ax = [x for x in recs if x[2]]
        non_triad = [x for x in recs if not set(x[1]) <= TRIAD]
        if is_dep:
            ok = (r.returncode == 0 and not errors and not sorry_warnings)
            verdict = ("OK (compile-only dep)" if ok else
                       f"FAIL rc={r.returncode} errors={len(errors)} "
                       f"sorry-warnings={len(sorry_warnings)}")
            print(f"[ax] {rel}: {verdict}; axiom-lines={n_openers} (dep stage: no appended prints)",
                  flush=True)
        else:
            ok = (r.returncode == 0 and not errors and not sorry_warnings
                  and not sorry_ax and not non_triad)
            verdict = ("OK" if ok else
                       f"FAIL rc={r.returncode} errors={len(errors)} "
                       f"sorry-warnings={len(sorry_warnings)} "
                       f"sorryAx-records={len(sorry_ax)} non-triad-records={len(non_triad)}")
            print(f"[ax] {rel}: {verdict}; axiom-lines={n_openers}, sorryAx-lines={len(sorry_ax)}",
                  flush=True)
            if non_triad:
                for name, ax, _ in non_triad:
                    print(f"[ax] NON-TRIAD {name}: {ax}", flush=True)
        results[rel] = verdict

    print("\n[axb] SUMMARY", flush=True)
    for rel, v in results.items():
        print(f"[axb]   {rel}: {v}", flush=True)
    return results


@app.local_entrypoint()
def main(dir: str):
    from pathlib import Path
    stage = Path(dir)
    staged = [p.name for p in sorted(stage.glob("*.lean"))]
    order_file = stage / "order.txt"
    if order_file.exists():
        order = [l.strip() for l in order_file.read_text().splitlines() if l.strip()]
        missing = [f for f in order if f not in staged]
        unlisted = [f for f in staged if f not in order]
        if missing or unlisted:
            raise SystemExit(f"order.txt/stage mismatch: missing={missing} unlisted={unlisted}")
    else:
        order = staged
    if not order:
        raise SystemExit(f"no staged files in {dir}")
    files = {name: (stage / name).read_text() for name in order}
    print(f"[axb] staging {len(order)} file(s): {order}")
    run.remote(files=files, order=order)
