#!/bin/bash
# Run pilot 52-M1 on Modal, reusing R9's crossmath-probe infra
# (research/feasibility/probe/lean_probe.py; image: elan v4.2.4 +
# leanprover/lean4:v4.36.0-rc2 + mathlib4 @ ff2494ea with olen cache).
# Staging pattern per math-proof1 tools/modal_tauceti.sh: stage into a
# world-readable temp dir. Ephemeral `modal run` only — no volume, no
# secret, no deploy.
#
# Cycle-2 note (2026-11-13, lane A8): this environment blocks `sudo -n -u
# xyz` (no-new-privileges), so unlike pilots/{20,22}/run_m1.sh the default
# MODAL_USER here is `doz`, whose /home/doz/dozenv/bin/modal is
# authenticated to the same workspace. The stage copy is kept for log-shape
# consistency with the 2026-11-09 runs.
#
#   research/pilots/52/run_m1.sh [extra modal args]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
PROBE_DIR="$(cd "$HERE/../../feasibility/probe" && pwd)"
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-pilot52-stage
MODAL_USER=${MODAL_USER:-doz}

if [ "$MODAL_USER" = doz ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
  RUN=(bash -lc "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")")
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  RUN=(sudo -n -u xyz bash -lc "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run lean_probe.py --dir $(printf '%q' "$STAGE")")
fi

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$PROBE_DIR"/lean_probe.py "$HERE"/M1.lean "$STAGE/"
chmod -R a+rX "$STAGE"

"${RUN[@]}"
