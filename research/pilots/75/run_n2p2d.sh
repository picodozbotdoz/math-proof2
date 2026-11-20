#!/bin/bash
# Run pilot 75-N2 P2-d (imprimitive hEχ composition, plain substrate) on Modal
# (pilot-11 dependency-order pattern; app crossmath-pilot-75, warm layers).
# Stage per N2-P2d.lean's staging note: /tmp/crossmath-n2p2d-stage/. doz CLI;
# SPEC cpu=2.0/mem=4096 soft; LEAN_NUM_THREADS=2; telemetry.
#   N2-P0.lean -> files/N2P0.lean ; N2-P1.lean -> files/N2P1.lean ;
#   N2-P2c.lean -> files/N2P2c.lean ; N2-P3.lean -> files/N2P3.lean
#   research/pilots/75/run_n2p2d.sh
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-n2p2d-stage
rm -rf "$STAGE"; mkdir -p "$STAGE/files"
cp "$HERE"/run_n2p2d.py "$STAGE/"
cp "$HERE"/Pa.lean "$STAGE"/files/
cp "$HERE"/N2-P0.lean "$STAGE"/files/N2P0.lean
cp "$HERE"/N2-P1.lean "$STAGE"/files/N2P1.lean
cp "$HERE"/N2-P2c.lean "$STAGE"/files/N2P2c.lean
cp "$HERE"/N2-P3.lean "$STAGE"/files/N2P3.lean
cp "$HERE"/N2-P2d.lean "$STAGE"/files/
chmod -R a+rX "$STAGE"
cd "$STAGE" && /home/doz/dozenv/bin/modal run run_n2p2d.py --dir ./files "$@"
