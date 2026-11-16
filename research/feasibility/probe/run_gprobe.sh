#!/bin/bash
# Run the AxiomMath donor probes (ProbeG series) on Modal, app `crossmath-gprobe`.
# Follows run_probe.sh's staging pattern. NOTE (2026-11-13): `sudo -u xyz` is unavailable
# in the lane shells ("no new privileges"), so this runner uses the doz CLI directly —
# the same CLI axiommath-bump's v2 runs used (which can read /home/doz without staging);
# staging is kept anyway so the Modal invocation sees a self-contained world-readable dir.
#
#   research/feasibility/probe/run_gprobe.sh probe          # G1a+G3+G4+G5b+G5c (+G9, mathlib-only) vs /opt/mathlib
#   research/feasibility/probe/run_gprobe.sh g2             # build ZetaZerosV2, then ProbeG2
#   research/feasibility/probe/run_gprobe.sh g1b [secs]     # bounded DZDF build attempt
#   research/feasibility/probe/run_gprobe.sh g5a            # build AreaLaw2D stmt layer (+Physlib), then ProbeG5a
#   research/feasibility/probe/run_gprobe.sh g10            # G5a refresh probe (STAGED — orchestrator approval only)
#
# Env: MODAL_BIN (default /home/doz/dozenv/bin/modal).
# G9 (ProbeG9_StrongPNT.lean, mathlib-only) rides the `probe` auto-glob; G10
# (ProbeG10_PhyslibRefresh.lean, in-tree) is EXCLUDED from it (gprobe.py skip set) and
# runs only via this g10 mode. Both staged 2026-11-16 (lane R8) — approval-gated.
set -euo pipefail

HERE=$(cd "$(dirname "$0")" && pwd)
STAGE=${TAUCETI_STAGE:-/tmp}/crossmath-gprobe-stage
MODAL_BIN=${MODAL_BIN:-/home/doz/dozenv/bin/modal}
MODE=${1:-probe}

rm -rf "$STAGE"; mkdir -p "$STAGE"
cp "$HERE"/gprobe.py "$HERE"/ProbeG*.lean "$STAGE/"
chmod -R a+rX "$STAGE"

case "$MODE" in
  probe)
    "$MODAL_BIN" run "$STAGE/gprobe.py" --dir "$STAGE" --mode probe
    ;;
  g2)
    "$MODAL_BIN" run "$STAGE/gprobe.py" --dir "$STAGE" --mode g2 \
      --root /home/doz/zcode-workdir/axiommath
    ;;
  g5a)
    "$MODAL_BIN" run "$STAGE/gprobe.py" --dir "$STAGE" --mode g5a \
      --root /home/doz/zcode-workdir/axiommath
    ;;
  g10)
    # STAGED 2026-11-16 (lane R8) — run only on orchestrator approval:
    # G5a-successor refresh probe (physlib refreshed past a50684a1 via lake update;
    # verdict line must quote the resolved physlib rev from the update-step log).
    "$MODAL_BIN" run "$STAGE/gprobe.py" --dir "$STAGE" --mode g10 \
      --root /home/doz/zcode-workdir/axiommath
    ;;
  g1b)
    SECS=${2:-2700}
    "$MODAL_BIN" run "$STAGE/gprobe.py" --dir "$STAGE" --mode g1b \
      --members /home/doz/zcode-workdir/axiommath/DedekindZetaZeroFree,/home/doz/zcode-workdir/tauceti \
      --build-timeout "$SECS"
    ;;
  g6a)
    SECS=${2:-2400}
    "$MODAL_BIN" run "$STAGE/gprobe.py" --dir "$STAGE" --mode g6a \
      --root /home/doz/zcode-workdir/axiommath --build-timeout "$SECS"
    ;;
  g7)
    "$MODAL_BIN" run --detach "$STAGE/gprobe.py" --dir "$STAGE" --mode g7
    ;;
  g7elab)
    # re-elaborate files inside the persisted built donor tree: ./run_gprobe.sh g7elab a.lean,b.lean
    "$MODAL_BIN" run --detach "$STAGE/gprobe.py" --dir "$STAGE" --mode g7elab --members "$2"
    ;;
  *)
    echo "usage: $0 probe|g2|g5a|g10|g1b|g6a|g7|g7elab [build-seconds|files]" >&2; exit 2
    ;;
esac
