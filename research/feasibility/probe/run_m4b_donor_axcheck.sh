#!/bin/bash
# M4b DONOR-TREE axcheck dry-run (lane A1 sweep machinery, 2026-11-14) — proves the
# FINAL-SWEEP-PLAN-C2.md §0a Step-B caveat pattern for AxPilot42_M4b: the final M4b
# imports the BUILT donor ZetaZeros, so its axcheck must elaborate INSIDE the built
# ZetaZerosV2 tree (donor-tree pattern of pilots/42/run_m4b2.sh, which this does NOT
# modify — separate probe app file, shared image recipe). MODAL_USER=doz default.
#
#   research/feasibility/probe/run_m4b_donor_axcheck.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-m4b-donor-ax-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
# axcheck stage copy = verbatim M4b + appended #print axioms (all theorems); repo untouched
python3 "$HERE/make_axcheck.py" "$STAGE" AxPilot42_M4b
cp "$HERE/m4b_donor_axcheck.py" "$STAGE/"
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run m4b_donor_axcheck.py --dir "$STAGE" \
  --root /home/doz/zcode-workdir/axiommath
