#!/bin/bash
# Iteration-4 hEχ runs on Modal (app `crossmath-pilot-zeta23E`): builds the pruned
# zeta23 ThmE.Final closure at the DONOR pin (v4.33.0-rc2 / mathlib 51e6992e — the
# run_r1.py g7 pattern, donor constants re-pointed) and elaborates the staged .lean
# file(s) INSIDE that tree, incl. the transitive Theorem-E `#print axioms` audit.
# STAGED-NO-RUN (R5, 2026-11-16); first execution at charter typeset (r5 backlog
# §14 run 8). MODAL_USER=doz (doz CLI). Stage pattern: world-readable /tmp copy.
# Logs → research/pilots/zeta23e/logs/ with provenance headers.
#
#   research/pilots/zeta23e/run_zeta23e.sh <lean-file> [<lean-file> ...]
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-zeta23e-stage
MODAL_USER=${MODAL_USER:-doz}
MODAL_BIN=/home/doz/dozenv/bin/modal

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/run_zeta23e.py "$STAGE/"
for f in "$@"; do cp "$f" "$STAGE/"; done
chmod -R a+rX "$STAGE"

cd "$STAGE" && "$MODAL_BIN" run run_zeta23e.py --dir "$STAGE"
