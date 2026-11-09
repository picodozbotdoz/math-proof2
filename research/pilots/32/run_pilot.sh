#!/bin/bash
# Run the R7 pilot files on Modal (math-proof1 staging pattern, cf.
# research/feasibility/probe/run_probe.sh): stage script + .lean files into a
# world-readable temp dir; `modal run` executes as user xyz. Ephemeral.
#
#   research/pilots/32/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-pilot-stage
MODAL_USER=${MODAL_USER:-xyz}
MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

sudo -n -u xyz bash -lc \
  "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run run_pilot.py --dir $(printf '%q' "$STAGE")"
