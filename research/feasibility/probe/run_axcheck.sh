#!/bin/bash
# Run the axcheck batch on Modal (R9, 2026-11-09): stages axcheck copies of the
# pilots' green-tranche / unrun M1 files and records #print axioms for every
# top-level theorem. Ephemeral `modal run` on the existing crossmath-probe
# image pattern; no new Modal resources. Usage: research/feasibility/probe/run_axcheck.sh
set -euo pipefail
HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-axcheck-stage
rm -rf "$STAGE"; mkdir -p "$STAGE"
python3 "$HERE/make_axcheck.py" "$STAGE"
cp "$HERE/axcheck_probe.py" "$STAGE/"
chmod -R a+rX "$STAGE"
sudo -n -u xyz bash -lc "cd $(printf '%q' "$STAGE") && $(printf '%q' /home/xyz/xyzenv/bin/modal) run $(printf '%q' "$STAGE")/axcheck_probe.py --dir $(printf '%q' "$STAGE")"
