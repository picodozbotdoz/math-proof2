#!/bin/bash
# Run pilot 72-M1 on Modal (Tier C, 72-prework §2.4): stage script + .lean files into a
# world-readable temp dir, then `modal run` executes ephemeral, app `crossmath-probe`
# (image layers shared with the R9/11 probe bake). Compile order = sorted names =
# dependency order (72M1T1 -> 72M1T2). MODAL_USER=doz default (relaunch protocol;
# this environment blocks sudo -n -u xyz). Ephemeral run only — no volume/secret/deploy.
#
#   research/pilots/72-M1/run_pilot72m1.sh [extra modal args]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-pilot72m1-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE/pilot72m1"
cp "$HERE"/pilot72m1_probe.py "$STAGE"/
cp "$HERE"/*.lean "$STAGE"/pilot72m1/
chmod -R a+rX "$STAGE"

cd "$STAGE"
if [ "$MODAL_USER" = doz ]; then
  /home/doz/dozenv/bin/modal run pilot72m1_probe.py --dir ./pilot72m1 "$@"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -u xyz "$MODAL_BIN" run pilot72m1_probe.py --dir ./pilot72m1 "$@"
fi
