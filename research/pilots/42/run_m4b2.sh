#!/bin/bash
# M4b PRIMARY-route runs on Modal (app `crossmath-pilot-42-m4b2`): builds ZetaZerosV2
# (+ redirected PrimeNumberTheoremAnd) and elaborates the staged .lean file(s) INSIDE
# the built tree — 42-M4-blueprint.md §(c) primary route. MODAL_USER=doz (doz CLI),
# staging pattern of run_m4.sh. Stage pattern: world-readable /tmp copy.
#
#   research/pilots/42/run_m4b2.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-pilot-42-m4b2-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_m4b2.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_m4b2.py --dir "$STAGE" \
  --root /home/doz/zcode-workdir/axiommath
