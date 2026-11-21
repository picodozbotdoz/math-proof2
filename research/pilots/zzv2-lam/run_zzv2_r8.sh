#!/bin/bash
# zzv2-lam eta-R8 TWO-ARM fire on Modal (app crossmath-pilot-zzv2-lam-r8): the
# run_zzv2.py/m4b2 recipe + the pilot-11/n2p4v2 chain pattern (P1.lean staged as
# ZZLamP1.lean, eta-r3.lean as EtaR3.lean — namespaces disjoint, no collision; the
# consumer eta-r8.lean composes them + ZetaZeros on one LEAN_PATH). MODAL_USER=doz
# (doz CLI). Estimated wall 10-15 min (< the 40-min --detach threshold; background
# shell). The al3d runner one-liners bind (see run_zzv2_r8.py). Staged copies are
# byte-identical; the repo files are untouched.
#
#   research/pilots/zzv2-lam/run_zzv2_r8.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-zzv2-r8-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_zzv2_r8.py "$STAGE"/
cp "$HERE"/P1.lean "$STAGE"/ZZLamP1.lean
cp "$HERE"/eta-r3.lean "$STAGE"/EtaR3.lean
cp "$HERE"/eta-r8.lean "$STAGE"/
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_zzv2_r8.py --dir "$STAGE" \
  --root /home/doz/zcode-workdir/axiommath
