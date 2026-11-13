#!/bin/bash
# Run the axcheck batch on Modal (R9, 2026-11-09): stages axcheck copies of the
# pilots' green-tranche / final files and records #print axioms for every
# top-level theorem. Ephemeral `modal run` on the existing crossmath-probe
# image pattern; no new Modal resources.
#
# Cycle-2 substrate update (2026-11-14, lane A1): this environment blocks
# `sudo -n -u xyz` (no-new-privileges), so the default MODAL_USER is `doz`
# (/home/doz/dozenv/bin/modal — same image and mathlib pin in the app), per
# the relaunch protocol (RESUME-BRIEF-C2 §Protocol 3) and the runner pattern
# of pilots/71/run_pilot.sh:11 and pilots/20/run_m1.sh. Set MODAL_USER=xyz to
# restore the 2026-11-09 behavior.
#
# Usage: research/feasibility/probe/run_axcheck.sh [stage-name ...]
#   no args            = all make_axcheck.py TARGETS
#   stage-name args    = subset re-check (forwarded to make_axcheck.py),
#                        e.g. run_axcheck.sh AxPilot10_L1
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-axcheck-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE"
python3 "$HERE/make_axcheck.py" "$STAGE" "$@"
cp "$HERE/axcheck_probe.py" "$STAGE/"
chmod -R a+rX "$STAGE"

if [ "$MODAL_USER" = doz ]; then
  MODAL_BIN=/home/doz/dozenv/bin/modal
  bash -lc "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run $(printf '%q' "$STAGE")/axcheck_probe.py --dir $(printf '%q' "$STAGE")"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -n -u "$MODAL_USER" bash -lc "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run $(printf '%q' "$STAGE")/axcheck_probe.py --dir $(printf '%q' "$STAGE")"
fi
