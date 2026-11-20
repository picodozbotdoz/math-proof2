#!/bin/bash
# 12-P0 stage+fire script (lane R3, worktree agent-07; 2026-11-20). Clone of the 74-P2
# stage_and_fire_p2.sh discipline (verify-fire BINDING): SHA GUARD prints the staged
# file's sha BEFORE firing; refuses if byte-identical to the last fired run; records
# the fired sha BEFORE the modal call. Runner: run_p0.py (app crossmath-pilot-12p0,
# warm layers — image recipe textually identical to the gprobe/73/74 lineage, FULL
# error output) — globs *.lean in the stage dir. All elaboration Modal (doz CLI; NO
# local lean). No build phase: `lake env lean` only, so the taskset-not-`-j` rule is
# N/A here. SPEC per modal_telemetry (2cpu/4096MB), LEAN_NUM_THREADS=2, telemetry
# every run. PROBE semantics: P0 GREEN shape = `PROBE-OK rc=0 errors=0 sorry=7`
# (statement-shape stubs expected; AGENTS.md probe convention).
set -euo pipefail

SRC=/home/doz/zcode-workdir/worktrees/agent-07/research/pilots/12/P0.lean
HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-12-p0-stage
RUN=${1:-1}
LOGRAW=/tmp/p12-p0-run${RUN}-raw.log

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE/run_p0.py" "$STAGE/"
cp /home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe/modal_telemetry.py "$STAGE/" 2>/dev/null \
  || cp "$HERE"/../../feasibility/probe/modal_telemetry.py "$STAGE/" 2>/dev/null \
  || true
cp "$SRC" "$STAGE/P0.lean"
chmod -R a+rX "$STAGE"

NEWSHA=$(sha256sum "$STAGE/P0.lean" | cut -c1-16)
SIDE=/tmp/crossmath-12-p0-last.sha
LASTSHA=""
[ -f "$SIDE" ] && LASTSHA=$(cat "$SIDE" 2>/dev/null || true)

echo "[sha-guard] staged sha256(16) = $NEWSHA"
echo "[sha-guard] last-fired sha256(16) = ${LASTSHA:-<none>}"
if [ -n "$LASTSHA" ] && [ "$NEWSHA" = "$LASTSHA" ]; then
  echo "[sha-guard] REFUSING: staged file is byte-identical to the last fired run — fix batch did not apply. Diagnose before firing." >&2
  exit 3
fi
echo "$NEWSHA" > "$SIDE"
echo "[sha-guard] OK — firing run $RUN (Modal, app crossmath-pilot-12p0, doz CLI)."
cd "$STAGE" && /home/doz/dozenv/bin/modal run run_p0.py --dir "$STAGE" 2>&1 | tee "$LOGRAW"
