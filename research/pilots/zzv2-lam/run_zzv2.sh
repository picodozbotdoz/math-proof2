#!/bin/bash
# Iteration-4 ZZV2-lambda runs on Modal (app `crossmath-pilot-zzv2-lam`): builds
# ZetaZerosV2 (+ redirected PrimeNumberTheoremAnd, the M4b2 recipe) and elaborates the
# staged .lean file(s) INSIDE the built tree — zzv2-lambda-prework.md §3. STAGED-NO-RUN
# (R5, 2026-11-16); first execution at charter typeset (r5 backlog §14 run 9).
# MODAL_USER=doz (doz CLI). Stage pattern: world-readable /tmp copy.
#
#   research/pilots/zzv2-lam/run_zzv2.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-zzv2-lam-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_zzv2.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_zzv2.py --dir "$STAGE" \
  --root /home/doz/zcode-workdir/axiommath
