#!/bin/bash
# 12-core iter-7 S-residue sweep stage+fire (lane R3, worktree agent-07; 2026-11-21).
# Two-file variant of stage_and_fire_core.sh (same verify-fire discipline, same
# runner run_core.py — it globs *.lean and elaborates each independently):
# stages CORE.lean AND P0.lean (the P0 binder mirrors ride the same elaboration
# fire per the relayed PENDING OWE). SHA GUARD on both staged files.
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
SRC_CORE=$HERE/CORE.lean
SRC_P0=$HERE/P0.lean
STAGE=/tmp/crossmath-12-sresidue-stage
RUN=${1:-15}
LOGRAW=/tmp/p12-sresidue-run${RUN}-raw.log

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE/run_core.py" "$STAGE/"
cp /home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe/modal_telemetry.py "$STAGE/" 2>/dev/null \
  || cp "$HERE"/../../feasibility/probe/modal_telemetry.py "$STAGE/" 2>/dev/null \
  || true
cp "$SRC_CORE" "$STAGE/CORE.lean"
cp "$SRC_P0" "$STAGE/P0.lean"
chmod -R a+rX "$STAGE"

NEWSHA_CORE=$(sha256sum "$STAGE/CORE.lean" | cut -c1-16)
NEWSHA_P0=$(sha256sum "$STAGE/P0.lean" | cut -c1-16)
SIDE=/tmp/crossmath-12-sresidue-last.sha
LAST=""
[ -f "$SIDE" ] && LAST=$(cat "$SIDE" 2>/dev/null || true)

echo "[sha-guard] staged CORE.lean sha256(16) = $NEWSHA_CORE"
echo "[sha-guard] staged P0.lean   sha256(16) = $NEWSHA_P0"
echo "[sha-guard] last-fired pair            = ${LAST:-<none>}"
NOW="$NEWSHA_CORE $NEWSHA_P0"
if [ -n "$LAST" ] && [ "$NOW" = "$LAST" ]; then
  echo "[sha-guard] REFUSING: staged pair byte-identical to the last fired run — fix batch did not apply. Diagnose before firing." >&2
  exit 3
fi
echo "$NOW" > "$SIDE"
echo "[sha-guard] OK — firing run $RUN (Modal, app crossmath-pilot-12core, doz CLI)."
cd "$STAGE" && /home/doz/dozenv/bin/modal run run_core.py --dir "$STAGE" 2>&1 | tee "$LOGRAW"
