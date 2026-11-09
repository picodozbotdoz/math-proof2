#!/bin/bash
# Run pilot 11 milestone 1 on Modal, mirroring research/feasibility/probe/run_probe.sh:
# stage script + .lean files into a world-readable temp dir (the Modal user xyz cannot
# read /home/doz), then `modal run` executes ephemeral, app `crossmath-probe` (image
# layers shared with R9's probe bake). Ephemeral run only — no volume/secret/deploy.
#
#   research/pilots/11/run_pilot11.sh [extra modal args]
#
# Env: MATHLIB_REV (default ff2494ea…; fallback master-2026-11-08 per lean_probe.py).
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-pilot11-stage
MODAL_USER=${MODAL_USER:-xyz}
MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE/pilot11"
cp "$HERE"/pilot11_probe.py "$STAGE"/
cp "$HERE"/P11T1.lean "$HERE"/P11T2.lean "$HERE"/RedCompA.lean "$HERE"/RedCompB.lean \
   "$STAGE"/pilot11/
chmod -R a+rX "$STAGE"

# Compile order = dependency order (T1 -> T2 -> both designs).
cd "$STAGE"
sudo -u xyz "$MODAL_BIN" run pilot11_probe.py --dir ./pilot11 "$@"
