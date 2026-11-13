#!/bin/bash
# Pilot 50 R1 runs on Modal (app `crossmath-pilot-50-r1`): builds the pruned openai
# Nonvanishing closure at the DONOR pin (v4.34.1 / mathlib d13f23b7 — the gprobe g7
# pattern) and elaborates the staged .lean file(s) INSIDE that tree. STAGED 2026-11-14,
# NOT YET RUN — gated on A7's G7b verdict (see R1-prework.md §5 for the protocol).
# MODAL_USER=doz (doz CLI); staging pattern of pilots/42/run_m4.sh.
#
#   research/pilots/50/run_r1.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-pilot-50-r1-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_r1.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_r1.py --dir "$STAGE"
