#!/bin/bash
# Iteration-4 AL-3D pilot on Modal (app `crossmath-pilot-al3d`): elaborates the staged .lean
# file(s) against mathlib ff2494ea (v4.36.0-rc2). STAGED-NO-RUN (R5, 2026-11-16) —
# first execution at charter typeset (r5 backlog §14 runs 1/4/11: LP-P0 probe, LP-P1
# layer, LP-P2 consumer). MODAL_USER=doz (doz CLI, the post-2026-11-13 canonical
# pattern; the xyz path is blocked in this environment — deliberately NO xyz branch
# here, unlike the older 75/32 wrappers). Stage pattern: world-readable /tmp copy.
# Logs → research/pilots/al3d/logs/ with provenance headers.
#
#   research/pilots/al3d/run_pilot.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-al3d-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_pilot.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_pilot.py --dir "$STAGE"
