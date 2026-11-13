#!/bin/bash
# Run pilot 73 files on Modal (clone of pilots/71/run_pilot.sh; doz variant per
# the relaunch protocol — MODAL_USER=doz approved for the pilot family).
#
#   research/pilots/73/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-73-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_pilot.py --dir "$STAGE"
