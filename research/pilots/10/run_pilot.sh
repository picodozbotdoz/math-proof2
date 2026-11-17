#!/bin/bash
# Run pilot-10 files on Modal (pilots/32 generic-runner pattern, doz CLI — the
# primary route per the orchestrator ruling 2026-11-17; lane-unique stage per the
# D1 preflight note, replacing the historical shared /tmp/crossmath-pilot-stage).
#
#   research/pilots/10/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-10-d1-a6
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_pilot.py --dir "$STAGE"
