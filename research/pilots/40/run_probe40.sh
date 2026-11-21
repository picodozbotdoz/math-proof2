#!/bin/bash
# Run the pilot-40 statement-tier probe on Modal (staging pattern of
# pilots/32/run_pilot.sh; modal_telemetry.py staged alongside from
# feasibility/probe — the shared SPEC/telemetry module).
#
#   research/pilots/40/run_probe40.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-probe-40-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_probe40.py "$HERE"/XiKPrime-stmt-probe.lean \
   /home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe/modal_telemetry.py \
   "$STAGE/"
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_probe40.py --dir "$STAGE"
