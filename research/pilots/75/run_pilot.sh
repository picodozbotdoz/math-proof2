#!/bin/bash
# Run pilot-75 files on Modal (clone of research/pilots/32/run_pilot.sh pattern).
# Substrate note: MODAL_USER=doz approved for this pilot (axbump/72 precedent);
# the doz CLI runs without sudo.
#
#   research/pilots/75/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-75-stage
MODAL_USER=${MODAL_USER:-doz}
if [ "$MODAL_USER" = "doz" ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
fi

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

if [ "$MODAL_USER" = "doz" ]; then
  cd "$STAGE" && "$MODAL_BIN" run run_pilot.py --dir "$STAGE"
else
  sudo -n -u "$MODAL_USER" bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run run_pilot.py --dir $(printf '%q' "$STAGE")"
fi
