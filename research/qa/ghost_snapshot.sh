#!/usr/bin/env bash
# ghost_snapshot.sh — main-side introduction-set watcher (ghost-writer containment, 2026-11-21)
#
# Appends one line per file in research/articles/introduction/ on MAIN:
#   timestamp  mtime  sha16(disk)  sha16(HEAD bytes)  basename
# sha16 != head  =>  the file deviates from HEAD (ghost write or H mid-batch staging).
#
# READ-ONLY against main. Usage:
#   ghost_snapshot.sh [logfile]
# Defaults: logfile = $GHOST_LOG or /tmp/crossmath-ghost-snapshot.log
#           main    = $MAIN_REPO or /home/doz/zcode-workdir/cross-math-fronttier
# H runs this at every commit gate while the containment is active (see
# research/qa/h-ghost-writer-20261121.md §4).
set -euo pipefail

MAIN="${MAIN_REPO:-/home/doz/zcode-workdir/cross-math-fronttier}"
DIR="$MAIN/research/articles/introduction"
LOG="${1:-${GHOST_LOG:-/tmp/crossmath-ghost-snapshot.log}}"

[ -d "$DIR" ] || { echo "ERROR: $DIR not found" >&2; exit 1; }

ts=$(date +%F_%T%z)
n=0
{
  printf '# snapshot %s\n' "$ts"
  for f in "$DIR"/*; do
    b=$(basename "$f")
    m=$(stat -c %y "$f" | cut -c1-23)
    s=$(sha256sum "$f" | cut -c1-16)
    h=$(git -C "$MAIN" show "HEAD:research/articles/introduction/$b" 2>/dev/null | sha256sum | cut -c1-16 || printf '%s' '-')
    mark='ok'
    [ "$s" = "$h" ] || mark='DIRTY-VS-HEAD'
    printf '%s  mtime=%s  sha16=%s  head=%s  [%s]  %s\n' "$ts" "$m" "$s" "$h" "$mark" "$b"
    n=$((n+1))
  done
} >> "$LOG"
echo "appended $n lines to $LOG"
