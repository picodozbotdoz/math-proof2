#!/bin/bash
# Run the R7 pilot files on Modal (math-proof1 staging pattern, cf.
# research/feasibility/probe/run_probe.sh): stage script + .lean files into a
# world-readable temp dir. Ephemeral.
#
# Substrate update (2026-11-16, lane R8): xyz route viable again 2026-11-16 but
# lands on donniexyz888 — cache-less; doz/semraker is the continuity default
# (run_axcheck.sh / pilots-71-runner pattern; RESUME-BRIEF-C2 §Protocol 3).
#
#   research/pilots/32/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-pilot-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

if [ "$MODAL_USER" = doz ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
  bash -lc "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run run_pilot.py --dir $(printf '%q' "$STAGE")"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -n -u "$MODAL_USER" bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run run_pilot.py --dir $(printf '%q' "$STAGE")"
fi
