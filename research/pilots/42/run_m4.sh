#!/bin/bash
# M4a/M4b pilot runs on Modal (app `crossmath-pilot-42-m4`), MODAL_USER=doz
# (approved 2026-11-13; the axbump runs already used the doz CLI — see
# research/feasibility/axiommath-bump/logs/ provenance headers). Stage pattern:
# world-readable /tmp copy (Modal cannot read /home/doz), run, discard.
#
#   research/pilots/42/run_m4.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-pilot-42-m4-stage
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_m4.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_m4.py --dir "$STAGE"
