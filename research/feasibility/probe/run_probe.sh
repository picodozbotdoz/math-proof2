#!/bin/bash
# Run the cross-math-fronttier port-probe on Modal, following math-proof1's
# tools/modal_tauceti.sh staging pattern: the probe script + .lean files are
# staged into a world-readable temp dir. Ephemeral run only.
#
# Substrate update (2026-11-16, lane R8): xyz route viable again 2026-11-16 but
# lands on donniexyz888 — cache-less; doz/semraker is the continuity default
# (run_axcheck.sh pattern; RESUME-BRIEF-C2 §Protocol 3).
#
#   research/feasibility/probe/run_probe.sh [extra modal args]
#
# Env: MATHLIB_REV (default ff2494ea…, the encore checkout; fallback
# master-2026-11-08 when CI artifacts for the tip are not up yet).
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-probe-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/lean_probe.py "$HERE"/Probe*.lean "$STAGE/"
chmod -R a+rX "$STAGE"

REVENV=""
[ -n "${MATHLIB_REV:-}" ] && REVENV="MATHLIB_REV=${MATHLIB_REV}"
if [ "$MODAL_USER" = doz ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
  bash -lc "cd $(printf '%q' "$STAGE") && $REVENV $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -n -u "$MODAL_USER" bash -lc \
    "cd $(printf '%q' "$STAGE") && $REVENV $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")"
fi
