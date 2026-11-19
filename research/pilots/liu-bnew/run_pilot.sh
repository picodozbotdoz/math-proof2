#!/bin/bash
# Run pilot liu-bnew P0 on Modal via the EXISTING `crossmath-probe` app
# (lean_probe.py elaborates every staged *.lean with `lake env lean` against
# mathlib ff2494ea / Lean v4.36.0-rc2; warm image layers shared with the
# probe/axbump/pilot runs). doz CLI route (substrate note 2026-11-13;
# RESUME-BRIEF-C2 §Protocol 3). SPEC 2cpu/4GB + LEAN_NUM_THREADS=2 + telemetry
# ride lean_probe.py's modal_telemetry wiring (AGENTS.md § Modal usage
# guidelines — no resource override, nothing to investigate beyond defaults).
#
#   research/pilots/liu-bnew/run_pilot.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-liu-bnew-stage
MODAL_BIN=/home/doz/dozenv/bin/modal
PROBE_DIR=/home/doz/zcode-workdir/cross-math-fronttier/research/feasibility/probe

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$PROBE_DIR"/lean_probe.py "$STAGE/"
cp "$HERE"/P0.lean "$STAGE/"
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run lean_probe.py --dir "$STAGE"
