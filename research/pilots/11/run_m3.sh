#!/bin/bash
# Run pilot 11 M3 (RedM3.lean) on Modal — the lean 4-file chain only
# (P11T1 -> P11T2 -> RedCompB -> RedM3; compile order = sorted names).
# Mirrors run_pilot11.sh (app crossmath-probe, image layers shared with the
# probe bake; doz CLI per the 2026-11-13 substrate note; SPEC 2cpu/4GB +
# LEAN_NUM_THREADS=2 + telemetry ride pilot11_probe.py unchanged).
#
#   research/pilots/11/run_m3.sh [extra modal args]
#
# Env: MATHLIB_REV (default ff2494ea…).
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-p11m3-stage

rm -rf "$STAGE"; mkdir -p "$STAGE/pilot11"
cp "$HERE"/pilot11_probe.py "$STAGE"/
cp "$HERE"/P11T1.lean "$HERE"/P11T2.lean "$HERE"/RedCompB.lean "$HERE"/RedM3.lean \
   "$STAGE"/pilot11/
chmod -R a+rX "$STAGE"

cd "$STAGE"
/home/doz/dozenv/bin/modal run pilot11_probe.py --dir ./pilot11 "$@"
