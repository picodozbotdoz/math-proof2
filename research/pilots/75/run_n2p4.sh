#!/bin/bash
# Run pilot 75-N2 P4 statement rung (plain substrate, the uniform composed card pair)
# on Modal (pilot-11 dependency-order pattern; app crossmath-pilot-75-p4, image layers
# shared with the 75-family runners). Stage per the N2-P3.lean in-header staging notes:
# /tmp/crossmath-n2p4-stage/. doz CLI primary; xyz fallback. Resources: AGENTS.md
# defaults (SPEC soft 2 cpu / 4 GB; LEAN_NUM_THREADS=2). Statement rung: expect
# 0 errors 0 sorry on every file (the al3d one-liner filters bind — see run_n2p4.py).
# Hyphenated repo files staged under legal module names, byte-identical copies
# (`import N2-P0` etc. are not legal module paths; the repo files are untouched):
#   N2-P0.lean -> N2P0.lean ; N2-P1.lean -> N2P1.lean ; N2-P2c.lean -> N2P2c.lean
#   N2-P3.lean -> N2P3.lean ; N2-P2d.lean -> N2P2d.lean ; N2-P3e.lean -> N2P3e.lean
#
#   research/pilots/75/run_n2p4.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-n2p4-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE/files"
cp "$HERE"/run_n2p4.py "$STAGE"/
cp "$HERE"/Pa.lean "$STAGE"/files/
cp "$HERE"/N2-P0.lean "$STAGE"/files/N2P0.lean
cp "$HERE"/N2-P1.lean "$STAGE"/files/N2P1.lean
cp "$HERE"/N2-P2c.lean "$STAGE"/files/N2P2c.lean
cp "$HERE"/N2-P3.lean "$STAGE"/files/N2P3.lean
cp "$HERE"/N2-P2d.lean "$STAGE"/files/N2P2d.lean
cp "$HERE"/N2-P3e.lean "$STAGE"/files/N2P3e.lean
cp "$HERE"/N2-P4.lean "$STAGE"/files/
chmod -R a+rX "$STAGE"

if [ "$MODAL_USER" = doz ]; then
  cd "$STAGE" && /home/doz/dozenv/bin/modal run run_n2p4.py --dir ./files "$@"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -n -u "$MODAL_USER" bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run run_n2p4.py --dir $(printf '%q' "$STAGE/files")"
fi
