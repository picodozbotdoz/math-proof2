#!/bin/bash
# Iteration-4 LP pilot on Modal (app `crossmath-pilot-lp`): elaborates the staged .lean
# file(s) against mathlib ff2494ea (v4.36.0-rc2). STAGED-NO-RUN (R5, 2026-11-16) —
# first execution at charter typeset (r5 backlog §14 runs 1/4/11: LP-P0 probe, LP-P1
# layer, LP-P2 consumer). MODAL_USER=doz (doz CLI, the post-2026-11-13 canonical
# pattern; the xyz path is blocked in this environment — deliberately NO xyz branch
# here, unlike the older 75/32 wrappers). Stage pattern: world-readable /tmp copy.
# Logs → research/pilots/lp/logs/ with provenance headers.
#
#   research/pilots/lp/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-lp-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_pilot.py --dir "$STAGE"
