#!/bin/bash
# Run pilot 20-M1 on Modal, reusing R9's crossmath-probe infra
# (research/feasibility/probe/lean_probe.py; image: elan v4.2.4 +
# leanprover/lean4:v4.36.0-rc2 + mathlib4 @ ff2494ea with olen cache).
# Staging pattern per math-proof1 tools/modal_tauceti.sh: stage into a
# world-readable temp dir. Ephemeral `modal run` only — no volume, no
# secret, no deploy.
#
# Cycle-2 update (2026-11-13, lane A8): this environment blocks `sudo -n -u
# xyz` (no-new-privileges), so the default MODAL_USER is now `doz`, whose
# /home/doz/dozenv/bin/modal is authenticated (same image/rev in the app);
# set MODAL_USER=xyz to restore the 2026-11-09 behavior. The stage copy is
# kept for log-shape consistency with the 2026-11-09 runs.
#
#   research/pilots/20/run_m1.sh [extra modal args]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
PROBE_DIR="$(cd "$HERE/../../feasibility/probe" && pwd)"
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-pilot20-stage
MODAL_USER=${MODAL_USER:-doz}

if [ "$MODAL_USER" = doz ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
fi

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$PROBE_DIR"/lean_probe.py "$HERE"/M1.lean "$STAGE/"
chmod -R a+rX "$STAGE"

if [ "$MODAL_USER" = doz ]; then
  bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")"
else
  sudo -n -u xyz bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")"
fi
