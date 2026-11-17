#!/bin/bash
# Run pilot-78 files on Modal (pilot-32 runner pattern, cf.
# research/pilots/32/run_pilot.sh): stage script + .lean files into a
# world-readable temp dir. Ephemeral. Default MODAL_USER=doz (the continuity
# default since 2026-11-13; RESUME-BRIEF-C2 §Protocol 3).
#
#   research/pilots/78/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-78-stage
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
