#!/bin/bash
# Run the pilot-40 statement-tier probe on Modal (staging pattern of
# pilots/32/run_pilot.sh; modal_telemetry.py staged alongside from
# feasibility/probe — the shared SPEC/telemetry module).
#
#   research/pilots/40/run_probe40.sh <lean-file> [<lean-file> ...]
# (default: all *.lean in $HERE — pass explicit files to exclude the sorry-bearing
# probe-convention file from a sorry-free kept-artifact run)
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-probe-40-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_probe40.py \
   /home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe/modal_telemetry.py \
   "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

if [ "$#" -eq 0 ]; then set -- "$HERE"/*.lean; fi
for f in "$@"; do cp "$f" "$STAGE/"; done
cd "$STAGE" && "$MODAL_BIN" run run_probe40.py --dir "$STAGE"
