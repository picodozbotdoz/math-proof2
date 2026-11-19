#!/bin/bash
# run_axb_close_iter4.sh — close-act Step-B(ii) full-coverage CUSTODY batch
# (lane R1, verification-integrity, 2026-11-19; close-act runbook §3 Step 9).
#
# Deterministically (re)generates every close-residue custody stage from the
# closing-tree bytes (plus the ONE git-bytes source of record: 75/N2-P1.lean @
# 3ad896b run-19 FINAL, sha-guarded ca1089e2a0c122c4 — HEAD carries the paused
# P2-a block and is NEVER staged, §10.29 addendum), stages runner + stages to
# /tmp, fires one ephemeral Modal run (app crossmath-probe family, doz CLI),
# and persists the log with a provenance header.
#
#   research/feasibility/probe/run_axb_close_iter4.sh <log-name>
set -euo pipefail
HERE=$(cd "$(dirname "$0")"; pwd)
STAGE=/tmp/crossmath-axb-close-stage
MODAL_USER=${MODAL_USER:-doz}
if [ "$MODAL_USER" = "doz" ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
fi
LOG_NAME=${1:?usage: run_axb_close_iter4.sh <log-name>}
LOG="$HERE/logs/$LOG_NAME"
REPO=$(git -C "$HERE" rev-parse --show-toplevel 2>/dev/null || echo /home/doz/zcode-workdir/cross-math-fronttier)

rm -rf "$STAGE"; mkdir -p "$STAGE"

python3 - "$HERE" "$STAGE" <<'PYEOF'
import hashlib, re, subprocess, sys
from pathlib import Path
probe, stage = Path(sys.argv[1]), Path(sys.argv[2])
pilots = Path("/home/doz/zcode-workdir/cross-math-fronttier/research/pilots")

def sha16(b): return hashlib.sha256(b.encode()).hexdigest()[:16]

def dep_stage(name, src_path, rewrites):
    src = Path(src_path).read_text()
    for stem, target in rewrites.items():
        src = re.sub(rf"^import {re.escape(stem)}$", f"import {target}", src, flags=re.M)
    header = (f"/- axb_close_iter4 compile-only DEP stage (close-act Step 9, 2026-11-19): verbatim copy of\n"
              f"   {src_path}{'' if not rewrites else ' (sibling-import rewrites: ' + ', '.join(f'{k}->{v}' for k, v in rewrites.items()) + ')'};\n"
              f"   NO #print axioms appended — staged so the engine's olean emission feeds its\n"
              f"   consumer; compile-check verdict only, never an audit row. Repo file untouched. -/\n")
    (stage / f"{name}.lean").write_text(header + src + "\n")
    print(f"{name}: dep stage <- {src_path} (source sha256(16) {sha16(Path(src_path).read_text())})")

def fc_stage(name, src_path, arg_rewrite):
    out = stage / f"{name}.lean"
    argv = ["python3", "-I", str(probe / "axcheck_iter4.py"), "gen", str(src_path), str(out)]
    if arg_rewrite:
        argv += ["--rewrite", arg_rewrite]
    subprocess.run(argv, check=True)

# --- dependency order (order.txt consumed by axb_close_iter4.py) ---
dep_stage("AxDep_75Pa",   pilots / "75/Pa.lean",     {})
dep_stage("AxDep_75N2P0", pilots / "75/N2-P0.lean",  {"Pa": "AxDep_75Pa"})
# N2-P1 custody stage = RUN-19 COMMITTED BYTES (git bytes, sha-guarded)
rev, rel, want = "3ad896b", "research/pilots/75/N2-P1.lean", "ca1089e2a0c122c4"
r = subprocess.run(["git", "-C", "/home/doz/zcode-workdir/cross-math-fronttier", "show", f"{rev}:{rel}"],
                   capture_output=True, text=True, check=True)
got = sha16(r.stdout)
assert got == want, f"N2-P1 git-bytes sha guard FAILED: {got} != {want}"
tmp = stage / "_n2p1_run19.lean"
tmp.write_text(r.stdout)
fc_stage("AxFC_75_N2P1run19", tmp, "N2P0=AxDep_75N2P0")
tmp.unlink()
print(f"AxFC_75_N2P1run19: staged from git bytes {rev}:{rel} (sha256(16) {got} verified)")
dep_stage("AxDep_73C",     pilots / "73/C.lean",     {})
fc_stage("AxFC_73_Q4",     pilots / "73/Q4.lean",    "C=AxDep_73C")
dep_stage("AxDep_AL3DP0",  pilots / "al3d/P0.lean",  {})
dep_stage("AxDep_AL3DA1",  pilots / "al3d/A1.lean",  {"P0": "AxDep_AL3DP0"})
fc_stage("AxFC_AL3D_A2",   pilots / "al3d/A2.lean",  "A1=AxDep_AL3DA1,P0=AxDep_AL3DP0")
fc_stage("AxFC_10_L5",     pilots / "10/L5.lean",    "")
fc_stage("AxFC_32_M1",     pilots / "32/M1.lean",    "")
fc_stage("AxFC_32_M2",     pilots / "32/M2.lean",    "")
fc_stage("AxFC_FFEZ2_P2",  pilots / "ff-ez2/P2.lean", "")
fc_stage("AxFC_74_P1",     pilots / "74/P1.lean",    "")
fc_stage("AxFC_78_P0",     pilots / "78/P0.lean",    "")

order = ["AxDep_75Pa.lean", "AxDep_75N2P0.lean", "AxFC_75_N2P1run19.lean",
         "AxDep_73C.lean", "AxFC_73_Q4.lean",
         "AxDep_AL3DP0.lean", "AxDep_AL3DA1.lean", "AxFC_AL3D_A2.lean",
         "AxFC_10_L5.lean", "AxFC_32_M1.lean", "AxFC_32_M2.lean",
         "AxFC_FFEZ2_P2.lean", "AxFC_74_P1.lean", "AxFC_78_P0.lean"]
present = sorted(p.name for p in stage.glob("*.lean"))
assert sorted(order) == present, f"stage/order mismatch: {sorted(order)} vs {present}"
(stage / "order.txt").write_text("\n".join(order) + "\n")
print(f"order.txt: {len(order)} stages (dependency order)")
PYEOF

cp "$HERE/axb_close_iter4.py" "$STAGE/"
chmod -R a+rX "$STAGE"

{
  echo "# PROVENANCE — $LOG_NAME (lane R1, verification-integrity; close-act Step 9 = Step-B(ii)"
  echo "#   full-coverage CUSTODY batch, $(date -u +%Y-%m-%d)). One ephemeral Modal run over 14 stages:"
  echo "#   9 AxFC_* full-coverage custody stages (axcheck_iter4.py gen — #print axioms tail on EVERY"
  echo "#   theorem/lemma decl incl. privates) + 5 AxDep_* compile-only dep stages (verbatim, olean feed,"
  echo "#   never audit rows). Dependency order via order.txt: 75Pa->75N2P0->N2P1run19; 73C->Q4;"
  echo "#   AL3DP0->AL3DA1->A2; then the dep-free stages."
  echo "# bytes of record: closing tree @ $(git -C "$REPO" rev-parse --short HEAD) ($(git -C "$REPO" show -s --format=%cs HEAD)) EXCEPT"
  echo "#   AxFC_75_N2P1run19 = RUN-19 COMMITTED BYTES git show 3ad896b:research/pilots/75/N2-P1.lean,"
  echo "#   sha-guarded ca1089e2a0c122c4 (HEAD bytes carry the paused P2-a block — never staged; §10.29 addendum)."
  echo "# sources: Pa d61eb0485a6ff672; N2-P0 1cf5cbe217c68564 (post-erratum 02a5d71); 73_C 4ed649217f754e8f;"
  echo "#   al3d/P0 52c5b9f77344e0ed; al3d/A1 a8feb25bcd60722f; al3d/A2 6a5ed5553bb62c55; 10/L5 da398f2170288acb;"
  echo "#   32/M1 5aad3ffa54be4679; 32/M2 9c10fcf5d209407b; ff-ez2/P2 24926ac4cbbcdd50; 74/P1 6ddbda11d5da4f35;"
  echo "#   78/P0 d94d115e3d8d08d7 (all sha256(16), measured at staging)."
  echo "# tool: axb_close_iter4.py (this dir) = axcheck_probe olean-emission class + axb75 complete-output"
  echo "#   custody class (no excerpting, R3 F1/F3b; widened error counters incl. error(<code>); backtick"
  echo "#   sorry-warning forms; in-run T9-fixed record join + triad classification)."
  echo "# cmd: run_axb_close_iter4.sh $LOG_NAME — app crossmath-probe ephemeral modal run, doz CLI"
  echo "#   /home/doz/dozenv/bin/modal (semraker, warm layers), SPEC cpu=2.0/mem=4096 soft,"
  echo "#   LEAN_NUM_THREADS=2, telemetry every run; mathlib ff2494ea / v4.36.0-rc2; taskset not -j (n/a)."
  echo "# expected: 9/9 AxFC OK with 0 sorryAx and every record <= [propext, Classical.choice, Quot.sound];"
  echo "#   5/5 AxDep compile-OK. CITED (NOT re-run this batch, bytes unchanged): 75_Pb axcheck-full-run1.log"
  echo "#   89/89 @ da05c60ceb78755b; 72-M1 T1/T2/T3 axcheck-l3a-run1.log @ fe57d30b19d9a836; zzv2 P1"
  echo "#   p1-run3.log donor-tree 10/10 triad @ a9a6555cadcd604c; 42_M4b stepB-c2-m4b-donor.log @ 4499e790e54398c9."
} > "$LOG"

set +e
(cd "$STAGE" && "$MODAL_BIN" run axb_close_iter4.py --dir "$STAGE") 2>&1 | tee -a "$LOG"
RC=${PIPESTATUS[0]}
set -e
echo "# rc=$RC (axb_close wrapper)" >> "$LOG"
exit "$RC"
