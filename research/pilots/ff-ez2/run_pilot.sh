#!/bin/bash
# Run FF-EZ2 files on Modal (staging pattern of pilots/ff-ez4/run_pilot.sh, doz
# variant per the axbump practice — MODAL_USER=doz approved for pilot 71).
#
#   research/pilots/ff-ez2/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-ffez2-a3
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_pilot.py --dir "$STAGE"
