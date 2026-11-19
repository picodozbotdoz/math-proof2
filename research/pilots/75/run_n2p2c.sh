#!/bin/bash
# Run pilot 75-N2 P3 statement rung on Modal (pilot-11 dependency-order pattern; app
# crossmath-pilot-75, image layers shared with run_n2p1.py's bake). Stage per the
# N2-P3.lean in-header staging notes: /tmp/crossmath-n2p2c-stage/. doz CLI primary;
# xyz fallback. Resources: AGENTS.md defaults (SPEC soft 2 cpu / 4 GB; LEAN_NUM_THREADS=2).
# Both hyphenated repo files are staged under legal module names, byte-identical copies
# (`import N2-P0`/`import N2-P1` are not legal module paths; the repo files are untouched):
#   N2-P0.lean -> files/N2P0.lean ; N2-P1.lean -> files/N2P1.lean
#
#   research/pilots/75/run_n2p2c.sh
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=/tmp/crossmath-n2p2c-stage
MODAL_USER=${MODAL_USER:-doz}

rm -rf "$STAGE"; mkdir -p "$STAGE/files"
cp "$HERE"/run_n2p2c.py "$STAGE"/
cp "$HERE"/Pa.lean "$STAGE"/files/
cp "$HERE"/N2-P0.lean "$STAGE"/files/N2P0.lean
cp "$HERE"/N2-P1.lean "$STAGE"/files/N2P1.lean
cp "$HERE"/N2-P2c.lean "$STAGE"/files/N2P2c.lean
chmod -R a+rX "$STAGE"

if [ "$MODAL_USER" = doz ]; then
  cd "$STAGE" && /home/doz/dozenv/bin/modal run run_n2p2c.py --dir ./files "$@"
else
  MODAL_BIN=$(getent passwd "$MODAL_USER" | cut -d: -f6)/xyzenv/bin/modal
  sudo -n -u "$MODAL_USER" bash -lc \
    "cd $(printf '%q' "$STAGE") && $(printf '%q' "$MODAL_BIN") run run_n2p2c.py --dir $(printf '%q' "$STAGE/files")"
fi
