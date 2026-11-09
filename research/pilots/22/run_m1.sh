#!/bin/bash
# Pilot 22 (PNT M1/M2) Modal runner — mirrors research/feasibility/probe/run_probe.sh
# (R9's crossmath-probe app, ephemeral run only; authorization recorded in
# research/feasibility/probe/lean_probe.py's header). Stages R9's lean_probe.py plus this
# pilot's .lean files and runs `modal run lean_probe.py --dir <stage>` as the xyz user.
#
#   research/pilots/22/run_m1.sh [extra modal args]
#
# Env: MATHLIB_REV (default ff2494ea…, the encore checkout; fallback
# master-2026-11-08 per lean_probe.py's cache-miss note).
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
PROBE=/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-pilot22-stage
MODAL_USER=${MODAL_USER:-xyz}
MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$PROBE"/lean_probe.py "$HERE"/*.lean "$STAGE/"
chmod -R a+rX "$STAGE"

REVENV=""
[ -n "${MATHLIB_REV:-}" ] && REVENV="MATHLIB_REV=${MATHLIB_REV}"
sudo -n -u xyz bash -lc \
  "cd $(printf '%q' "$STAGE") && $REVENV $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")"
