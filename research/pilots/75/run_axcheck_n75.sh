#!/bin/bash
# N3 full-coverage axcheck for pilot 75-N2 (lane R6 unit 10, 2026-11-20):
# dependency-order olean elaboration of the axcheck_iter4 gen Ax-stages
# (Pa + N2P0 + N2P1 + N2P3 + N2P2c + N2P3e; sibling-import rewrites).
# Stage dir /tmp/crossmath-axn75-stage (regenerate with axcheck_iter4.py
# gen before firing if sources moved). App crossmath-pilot-75 (warm layers).
# doz CLI; SPEC cpu=2.0/mem=4096 soft; LEAN_NUM_THREADS=2; telemetry.
#
#   research/pilots/75/run_axcheck_n75.sh
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-axn75-stage
rm -f "$STAGE"/axcheck_n75.py
cp "$HERE"/axcheck_n75.py "$STAGE/"
chmod -R a+rX "$STAGE"
cd "$STAGE" && /home/doz/dozenv/bin/modal run axcheck_n75.py --dir "$STAGE"
