#!/bin/bash
# Run pilot 71 files on Modal (staging pattern of pilots/32/run_pilot.sh, doz
# variant per the axbump practice — MODAL_USER=doz approved for pilot 71).
#
#   research/pilots/71/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-71-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_pilot.py --dir "$STAGE"
