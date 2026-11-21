#!/bin/bash
# Pilot 75-N2 P4-V2 fire on Modal (app crossmath-pilot-75-p4v2): the run_n2p3v2 recipe
# (ZetaZerosV2 build) + the pilot-11 chain pattern (N2 chain as oleans on LEAN_PATH
# inside the built tree) so N2-P4V2.lean composes ZetaZeros + the chain. MODAL_USER=doz
# (doz CLI). Estimated wall 10-15 min (< the 40-min --detach threshold; run in a
# background shell). Chain staged under LEGAL module names (byte-identical copies;
# repo files untouched): N2-P0->N2P0, N2-P1->N2P1, N2-P2c->N2P2c, N2-P3->N2P3,
# N2-P2d->N2P2d, N2-P3e->N2P3e, N2-P3V2->N2P3V2, N2-P4->N2P4. The al3d one-liners
# bind (see run_n2p4v2.py).
#
#   research/pilots/75/run_n2p4v2.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-n2p4v2-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_n2p4v2.py "$STAGE"/
cp "$HERE"/Pa.lean "$STAGE"/
cp "$HERE"/N2-P0.lean "$STAGE"/N2P0.lean
cp "$HERE"/N2-P1.lean "$STAGE"/N2P1.lean
cp "$HERE"/N2-P2c.lean "$STAGE"/N2P2c.lean
cp "$HERE"/N2-P3.lean "$STAGE"/N2P3.lean
cp "$HERE"/N2-P2d.lean "$STAGE"/N2P2d.lean
cp "$HERE"/N2-P3e.lean "$STAGE"/N2P3e.lean
cp "$HERE"/N2-P3V2.lean "$STAGE"/N2P3V2.lean
cp "$HERE"/N2-P4.lean "$STAGE"/N2P4.lean
cp "$HERE"/N2-P4V2.lean "$STAGE"/
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_n2p4v2.py --dir "$STAGE" \
  --root /home/doz/zcode-workdir/axiommath
