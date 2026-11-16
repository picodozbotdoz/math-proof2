#!/bin/bash
# STAGED at launch by H — pending R8 runner-kit review before first use; doz workspace
# (semraker) per continuity decision (xyz/donniexyz888 viable but cache-less).
#
# Run iteration-4 pilot/probe files on Modal (staging pattern of pilots/71/run_pilot.sh).
#
#   research/feasibility/probe/run_iter4_probe.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-iter4-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/iter4_probe.py "$HERE"/modal_telemetry.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run iter4_probe.py --dir "$STAGE"
