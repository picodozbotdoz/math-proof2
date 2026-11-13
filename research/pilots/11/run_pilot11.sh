#!/bin/bash
# Run pilot 11 on Modal, mirroring research/feasibility/probe/run_probe.sh:
# stage script + .lean files into a world-readable temp dir, then `modal run`
# executes ephemeral, app `crossmath-probe` (image layers shared with R9's probe
# bake). Ephemeral run only — no volume/secret/deploy.
#
# Cycle-2 update (2026-11-13, lane A8): this environment blocks `sudo -n -u xyz`
# (no-new-privileges), so the default MODAL_USER is now `doz`
# (/home/doz/dozenv/bin/modal, same image/rev in the app); set MODAL_USER=xyz to
# restore the 2026-11-09 behavior. M2 files (P11T3, RedTm2) join the stage; compile
# order = sorted names = dependency order (P11T1 -> P11T2 -> P11T3 -> RedCompA/B ->
# RedTm2).
#
#   research/pilots/11/run_pilot11.sh [extra modal args]
#
# Env: MATHLIB_REV (default ff2494ea…; fallback master-2026-11-08 per lean_probe.py).
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-pilot11-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE/pilot11"
cp "$HERE"/pilot11_probe.py "$STAGE"/
cp "$HERE"/P11T1.lean "$HERE"/P11T2.lean "$HERE"/P11T3.lean \
   "$HERE"/RedCompA.lean "$HERE"/RedCompB.lean "$HERE"/RedTm2.lean \
   "$STAGE"/pilot11/
chmod -R a+rX "$STAGE"

cd "$STAGE"
if [ "$MODAL_USER" = doz ]; then
  /home/doz/dozenv/bin/modal run pilot11_probe.py --dir ./pilot11 "$@"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -u xyz "$MODAL_BIN" run pilot11_probe.py --dir ./pilot11 "$@"
fi
