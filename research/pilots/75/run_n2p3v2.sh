#!/bin/bash
# Pilot 75-N2 P3-d V2-substrate build on Modal (app `crossmath-pilot-75-v2`): builds
# ZetaZerosV2 (+ redirected PrimeNumberTheoremAnd) per the m4b2 recipe and elaborates
# the staged smoke file INSIDE the built tree. MODAL_USER=doz (doz CLI). LONG-BUILD
# discipline per AGENTS.md §Modal-5: --detach (the caller wraps in setsid nohup).
#
#   research/pilots/75/run_n2p3v2.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-pilot-75-v2-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_n2p3v2.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run --detach run_n2p3v2.py --dir "$STAGE" \
  --root /home/doz/zcode-workdir/axiommath
