#!/bin/bash
# Run pilot 75-N2 P0 on Modal (pilot-11 dependency-order pattern; app crossmath-pilot-75,
# image layers shared with run_pilot.py's bake). Stage per the P0 GO ruling of 2026-11-17:
# /tmp/crossmath-n2p0-stage/. doz CLI primary (substrate note, RESUME-BRIEF-C2 §Protocol 3);
# xyz fallback. Resources: AGENTS.md defaults (soft 2 cpu / 4 GB via SPEC; LEAN_NUM_THREADS=2).
#
#   research/pilots/75/run_n2p0.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-n2p0-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE/files"
cp "$HERE"/run_n2p0.py "$STAGE"/
cp "$HERE"/Pa.lean "$HERE"/N2-P0.lean "$STAGE"/files/
chmod -R a+rX "$STAGE"

if [ "$MODAL_USER" = doz ]; then
  cd "$STAGE" && /home/doz/dozenv/bin/modal run run_n2p0.py --dir ./files "$@"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -n -u "$MODAL_USER" bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run run_n2p0.py --dir $(printf '%q' "$STAGE/files")"
fi
