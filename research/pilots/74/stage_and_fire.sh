#!/bin/bash
# 74-P1-completion stage+fire script (lane A8; re-charter 2026-11-17, batch v2 2026-11-18)
# Enforces the orchestrator's fix-batch -> verify-applied -> fire discipline:
#   SHA GUARD: prints the staged file's sha BEFORE firing; refuses to fire if it equals
#   the last-fired sha (kept at /tmp/crossmath-74-p1-last.sha); prints the diff-vs-last
#   line count so the batch is visible before elaboration.
# Runner: run_p1.py (app crossmath-pilot-74p1, pilot-73 clone with FULL error output) —
# replaces the gprobe auto-glob route (runs 1-6 were partially blind at its 12k cap).
# All elaboration stays Modal (doz CLI; NO local lean — binding rule). No build phase:
# `lake env lean` elaboration only, so the taskset-not-`-j` rule is N/A here.
set -euo pipefail

SRC=/home/doz/zcode-workdir/worktrees/agent-09/research/pilots/74/P1.lean
HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-74-p1-stage
RUN=${1:-1}
LOGRAW=/tmp/p1-completion-run${RUN}-raw.log

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE/run_p1.py" "$STAGE/"
cp /home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe/modal_telemetry.py "$STAGE/" 2>/dev/null \
  || cp /home/doz/zcode-workdir/worktrees/agent-09/research/feasibility/probe/modal_telemetry.py "$STAGE/"
cp "$SRC" "$STAGE/P1.lean"
chmod -R a+rX "$STAGE"

NEWSHA=$(sha256sum "$STAGE/P1.lean" | cut -c1-16)
SIDE=/tmp/crossmath-74-p1-last.sha
LASTSHA=""
[ -f "$SIDE" ] && LASTSHA=$(cat "$SIDE" 2>/dev/null || true)

echo "[sha-guard] staged sha256(16) = $NEWSHA"
echo "[sha-guard] last-fired sha256(16) = ${LASTSHA:-<none>}"
if [ -n "$LASTSHA" ] && [ "$NEWSHA" = "$LASTSHA" ]; then
  echo "[sha-guard] REFUSING: staged file is byte-identical to the last fired run — fix batch did not apply. Diagnose before firing." >&2
  exit 3
fi
# record the fired sha BEFORE the modal call (never edit between this line and fire)
echo "$NEWSHA" > "$SIDE"
echo "[sha-guard] OK — firing run $RUN (Modal, app crossmath-pilot-74p1, doz CLI)."
cd "$STAGE" && /home/doz/dozenv/bin/modal run run_p1.py --dir "$STAGE" 2>&1 | tee "$LOGRAW"
