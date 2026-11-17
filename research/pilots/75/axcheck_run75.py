"""crossmath-pilot-75-axb — Step-B full-coverage axcheck runner for pilot 75 (lane A1).

2026-11-17. Clone of pilots/75/run_pilot.py (same image recipe — elan v4.2.4 +
v4.36.0-rc2 + mathlib4 @ ff2494ea + `lake exe cache get`; layers shared with the
crossmath-pilot-75 / probe families). Ephemeral `modal run` only — NO volume, NO
secret (beyond the LEAN_NUM_THREADS CAP dict), NO deploy.

Differences from run_pilot.py (the F1/F3b custody rules, axcheck_iter4.py §7):
  - dumps the COMPLETE elaboration output (no 30-line tails, no axioms-line
    filtering — every `#print axioms` record persists un-elided);
  - joins wrapped records in-run and classifies against the triad
    {propext, Classical.choice, Quot.sound};
  - emits the axcheck_iter4 `scan`-compatible stage separator + verdict line
    (`[ax] <file>: OK; axiom-lines=N, sorryAx-lines=M`) so the persisted log is
    self-custodying;
  - stamps the staged file's sha256 (bytes of record per FINAL-SWEEP-PLAN-ITER4 §2.4).

Usage (via run_axcheck75.sh, which stages to /tmp/crossmath-axb75-stage/):
    modal run axcheck_run75.py --dir <stage-dir>
"""

import modal

import re

# AGENTS.md § Modal usage guidelines: default spec 2 cpu / 4 GB (soft), telemetry on
# every run, LEAN_NUM_THREADS capped to the spec (containers report nproc >> cpu).
import sys as _sys
_sys.path.insert(0, "/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe")
from modal_telemetry import SPEC, telemetered  # noqa: E402
CAP = [modal.Secret.from_dict({"LEAN_NUM_THREADS": "2"})]

app = modal.App("crossmath-pilot-75-axb")

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
    """axcheck_iter4.join_records logic (verbatim class): join a wrapped
    `'name' depends on axioms: […` record until brackets balance."""
    records, cur = [], None

    def complete(rest):
        return "[" in rest and rest.count("[") - rest.count("]") <= 0

    for line in lines:
        s = line.strip()
        # primed-name-safe openers (axcheck_iter4 T9 fix, 2026-11-17): greedy name
        # capture backtracks to the last quote so `name'` records pair correctly.
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


@app.function(image=image, **SPEC, secrets=CAP, timeout=2 * 60 * 60)
@telemetered
def run(files: dict, order: list):
    import hashlib
    import pathlib
    import re
    import subprocess

    repo = pathlib.Path("/opt/mathlib")

    def sh(cmd, timeout=2400):
        return subprocess.run(cmd, cwd=repo, shell=isinstance(cmd, str),
                              capture_output=True, text=True, timeout=timeout)

    print(f"[axb] mathlib rev {MATHLIB_REV[:12]}", flush=True)
    n_olean = sum(1 for _ in (repo / ".lake/build/lib/lean").rglob("*.olean")) \
        if (repo / ".lake/build/lib/lean").exists() else 0
    print(f"[axb] oleans present: {n_olean}", flush=True)
    if n_olean < 1000:
        print("[axb] CACHE-MISS abort", flush=True)
        return {rel: "CACHE-MISS" for rel in order}

    for rel, content in files.items():
        p = repo / rel
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(content)
        print(f"[axb] staged {rel}: sha256 {hashlib.sha256(content.encode()).hexdigest()}", flush=True)

    for rel in order:
        print(f"\n=== {rel}", flush=True)
        try:
            r = sh(["lake", "env", "lean", rel], timeout=2400)
        except subprocess.TimeoutExpired:
            print(f"[ax] {rel}: FAIL timeout after 2400s; axiom-lines=0, sorryAx-lines=0", flush=True)
            continue
        out = r.stdout + r.stderr
        # F1/F3b custody: the COMPLETE output persists — no excerpting, no filtering.
        print(out, flush=True)
        lines = out.splitlines()
        errors = [l for l in lines if ": error:" in l or l.startswith("error:")]
        sorry_warnings = [l for l in lines if "declaration uses 'sorry'" in l]
        recs = join_records(lines)
        n_openers = sum(1 for l in lines
                        if re.match(r"^'.*'\s+(depends on axioms|does not depend on any axioms)", l.strip()))
        sorry_ax = [x for x in recs if x[2]]
        non_triad = [x for x in recs if not set(x[1]) <= TRIAD]
        ok = (r.returncode == 0 and not errors and not sorry_warnings
              and not sorry_ax and not non_triad)
        verdict = "OK" if ok else (
            f"FAIL rc={r.returncode} errors={len(errors)} sorry-warnings={len(sorry_warnings)} "
            f"sorryAx-records={len(sorry_ax)} non-triad-records={len(non_triad)}")
        print(f"[ax] {rel}: {verdict}; axiom-lines={n_openers}, sorryAx-lines={len(sorry_ax)}", flush=True)
        if non_triad:
            for name, ax, _ in non_triad:
                print(f"[ax] NON-TRIAD {name}: {ax}", flush=True)

    print("\n[axb] done", flush=True)


@app.local_entrypoint()
def main(dir: str = "./stage"):
    from pathlib import Path
    files, order = {}, []
    for p in sorted(Path(dir).glob("*.lean")):
        files[p.name] = p.read_text()
        order.append(p.name)
    if not order:
        raise SystemExit(f"no .lean files found in {dir}")
    print(f"[axb] staging {order}")
    run.remote(files=files, order=order)
