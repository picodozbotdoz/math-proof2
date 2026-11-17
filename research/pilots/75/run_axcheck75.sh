#!/bin/bash
# Step-B full-coverage axcheck for pilot 75 Pb.lean (lane A1, 2026-11-17).
# Generates NOTHING itself — the stage file must already exist (axcheck_iter4.py gen,
# run locally first); this script stages runner + stage and persists the log.
# Clone of run_pilot.sh pattern; MODAL_USER=doz default (doz CLI, no sudo).
#
#   research/pilots/75/run_axcheck75.sh <stage-file.lean> <log-name>
set -euo pipefail

HERE=$(cd "$(dirname "$0")"; pwd)
STAGE=/tmp/crossmath-axb75-stage
MODAL_USER=${MODAL_USER:-doz}
if [ "$MODAL_USER" = "doz" ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
fi

STAGE_FILE=${1:?usage: run_axcheck75.sh <stage-file.lean> <log-name>}
LOG_NAME=${2:?usage: run_axcheck75.sh <stage-file.lean> <log-name>}
LOG="$HERE/logs/$LOG_NAME"

SRC_SHA=$(sha256sum "$HERE/Pb.lean" | cut -c1-16)
STG_SHA=$(sha256sum "$STAGE_FILE" | cut -c1-16)

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/axcheck_run75.py "$STAGE/"
cp "$STAGE_FILE" "$STAGE/"
chmod -R a+rX "$STAGE"

{
  echo "# PROVENANCE — $LOG_NAME (lane A1 = R3-role successor, pilot 75 Step-B full-coverage axcheck, $(date -u +%Y-%m-%d))"
  echo "# source of record: research/pilots/75/Pb.lean (2,303 lines; sha256(16) $SRC_SHA)"
  echo "# stage: $(basename "$STAGE_FILE") = axcheck_iter4.py gen output (verbatim copy + #print axioms tail on ALL 89 decls"
  echo "#   = 82 public + 7 private, census 2026-11-17; appended-tail-in-same-file pattern, private names resolve in-file);"
  echo "#   sha256(16) $STG_SHA; forbidden-token gate: OK, 0 hits (axcheck_iter4.py gate)."
  echo "# tool: research/feasibility/probe/axcheck_iter4.py (Iteration-4 sweep default, R3 audit §7; closes F1/F2/F3)."
  echo "# cmd: run_axcheck75.sh $(basename "$STAGE_FILE") $LOG_NAME — app crossmath-pilot-75-axb, doz Modal CLI,"
  echo "#   SPEC cpu=2.0/mem=4096 (soft) + LEAN_NUM_THREADS=2, telemetry on; mathlib ff2494ea / v4.36.0-rc2."
  echo "# expected: 89 appended + 35 in-file ride-along = 124 records, all exactly [propext, Classical.choice, Quot.sound], 0 sorryAx."
  echo "# custody: runner dumps COMPLETE elaboration output (no excerpting); verdict line is axcheck_iter4 scan-compatible."
} > "$LOG"

if [ "$MODAL_USER" = "doz" ]; then
  set +e
  (cd "$STAGE" && "$MODAL_BIN" run axcheck_run75.py --dir "$STAGE") 2>&1 | tee -a "$LOG"
  RC=${PIPESTATUS[0]}
  set -e
else
  set +e
  sudo -n -u "$MODAL_USER" bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run axcheck_run75.py --dir $(printf '%q' "$STAGE")" 2>&1 | tee -a "$LOG"
  RC=${PIPESTATUS[0]}
  set -e
fi

echo "# rc=$RC (axcheck-full wrapper)" >> "$LOG"
exit "$RC"
