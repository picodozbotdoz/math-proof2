#!/bin/bash
# Run the cross-math-fronttier port-probe on Modal, following math-proof1's
# tools/modal_tauceti.sh staging pattern: the Modal user (xyz) cannot read
# /home/doz, so the probe script + .lean files are staged into a world-readable
# temp dir and `modal run` executes as xyz. Ephemeral run only.
#
#   research/feasibility/probe/run_probe.sh [extra modal args]
#
# Env: MATHLIB_REV (default ff2494ea…, the encore checkout; fallback
# master-2026-11-08 when CI artifacts for the tip are not up yet).
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-probe-stage
MODAL_USER=${MODAL_USER:-xyz}
MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/lean_probe.py "$HERE"/Probe*.lean "$STAGE/"
chmod -R a+rX "$STAGE"

REVENV=""
[ -n "${MATHLIB_REV:-}" ] && REVENV="MATHLIB_REV=${MATHLIB_REV}"
sudo -n -u xyz bash -lc \
  "cd $(printf '%q' "$STAGE") && $REVENV $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")"
