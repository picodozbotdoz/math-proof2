#!/bin/bash
# STAGED at launch by H — R8 runner-kit review done 2026-11-16 (jointly owned H+R8):
# VERDICT PASS after one fix — MODAL_BIN is now env-overridable (doz/dozenv default kept,
# the continuity choice; xyz/donniexyz888 viable but cache-less). Log persistence is the
# executing lane's duty: tee the run to research/pilots/*/logs/ with a provenance header
# (log-rescue lesson). Doz workspace (semraker) per continuity decision.
#
# Run iteration-4 pilot/probe files on Modal (staging pattern of pilots/71/run_pilot.sh).
#
#   research/feasibility/probe/run_iter4_probe.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-iter4-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=${MODAL_BIN:-/home/doz/dozenv/bin/modal}

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/iter4_probe.py "$HERE"/modal_telemetry.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run iter4_probe.py --dir "$STAGE"
