#!/usr/bin/env bash
# forward_worktrees.sh — the iteration-open worktree-forward procedure (parameterized).
#
# Implements the carry pattern used at the 2026-11-21 resume (H-executed):
#   per worktree: .carry/<tag> backup (STATE.txt + tracked/ + untracked/)
#   -> clean the tree (backup-verified) -> cut carry-<branchtag>-agent-NN at BASE
#      (MODE=cut)  —or—  ff the existing carry branch to BASE (MODE=ff)
#
# SAFETY MODEL (read before real use):
#   * DRY by default. Real execution REQUIRES the literal argument `--go`.
#   * A dirty worktree is NEVER cleaned without a completed+verified backup.
#   * NEVER `git stash drop` — anywhere, any mode. The stash stack is SHARED
#     across all linked worktrees (empirically verified 2026-11-21: the 10
#     `carry-20261121-resume` entries are visible identically from main and
#     every worktree). STASH=1 (legacy mode) further refuses to run if the
#     shared stack is non-empty at entry, and records stash@{0}'s sha into
#     the backup STATE.txt. Default STASH=0 avoids the stack entirely.
#   * The script never writes MAIN (reads it only to validate BASE).
#   * MODE=ff refuses a non-carry branch and uses --ff-only (no merge commits,
#     no pull — origin points at a DIFFERENT repo family, math-proof2).
#
# Usage:
#   BASE=<open-commit-sha> ./forward_worktrees.sh [--go]
# Env overrides: MODE=cut|ff  STASH=0|1  AGENTS="01 02 …"  TAG=<carry dir name>
#                BRANCH_TAG=<date> WTROOT=… MAIN=…
set -uo pipefail

BASE="${BASE:-}"
MODE="${MODE:-cut}"                 # cut = new carry branch at BASE; ff = ff existing
STASH="${STASH:-0}"                 # 0 = backup+restore+clean (stash-free, default)
AGENTS="${AGENTS:-01 02 03 04 05 06 07 08 09 10}"
WTROOT="${WTROOT:-/home/doz/zcode-workdir/worktrees}"
MAIN="${MAIN:-/home/doz/zcode-workdir/cross-math-fronttier}"
TAG="${TAG:-$(date +%F)-forward}"
BRANCH_TAG="${BRANCH_TAG:-$(date +%Y%m%d)}"
GO=0; [ "${1:-}" = "--go" ] && GO=1

fail=0
say()  { printf '%s\n' "$*"; }
err()  { printf 'ERROR: %s\n' "$*" >&2; fail=$((fail+1)); }

# ---- global asserts ---------------------------------------------------------
[ -n "$BASE" ] || { err "BASE env is required (the iteration-open commit sha)"; exit 1; }
git -C "$MAIN" cat-file -e "${BASE}^{commit}" 2>/dev/null || { err "BASE $BASE is not a commit in $MAIN"; exit 1; }
git -C "$MAIN" merge-base --is-ancestor "$BASE" HEAD 2>/dev/null || \
  { err "BASE $BASE is not an ancestor of main HEAD — refuse to forward to it"; exit 1; }
case "$MODE" in cut|ff) ;; *) err "MODE must be cut or ff"; exit 1;; esac
if [ "$STASH" = "1" ] && [ "$GO" = 1 ]; then
  n=$(git -C "$MAIN" stash list | wc -l)
  [ "$n" -eq 0 ] || { err "STASH=1 but the SHARED stash stack has $n entries — aborting (never mix lanes' stashes)"; exit 1; }
fi
say "# forward_worktrees BASE=$BASE MODE=$MODE STASH=$STASH TAG=$TAG BRANCH_TAG=$BRANCH_TAG GO=$GO"
[ "$GO" = 1 ] || say "# DRY RUN — nothing executes; pass --go to execute."

# ---- per-worktree procedure -------------------------------------------------
for nn in $AGENTS; do
  wt="$WTROOT/agent-$nn"
  say ""
  say "== agent-$nn ($wt)"
  if [ ! -d "$wt/.git" ] && [ ! -f "$wt/.git" ]; then err "agent-$nn: not a worktree"; continue; fi

  cur=$(git -C "$wt" rev-parse HEAD)
  br=$(git -C "$wt" branch --show-current)
  say "   state: branch=$br HEAD=$(git -C "$wt" rev-parse --short HEAD)"

  if [ "$cur" = "$BASE" ]; then say "   already at BASE — nothing to do"; continue; fi

  # 1) capture status (-z, robust to spaces)
  mapfile -d '' -t lines < <(git -C "$wt" status --porcelain -z)
  dirty=0; untracked=(); modified=()
  for ent in "${lines[@]}"; do
    [ -n "$ent" ] || continue
    st="${ent:0:2}"; p="${ent:3}"
    case "$st" in
      '??') untracked+=("${p%/}"); dirty=1;;   # dir entries lose trailing /
      *)    modified+=("$p"); dirty=1;;
    esac
  done

  # 2) backup (dirty worktrees ONLY; clean ones skip)
  if [ "$dirty" = 1 ]; then
    bk="$wt.carry/$TAG"
    say "   DIRTY (${#untracked[@]} untracked paths, ${#modified[@]} tracked) -> backup $bk"
    if [ "$GO" = 1 ]; then
      mkdir -p "$bk/tracked" "$bk/untracked"
      { git -C "$wt" rev-parse HEAD; git -C "$wt" status --porcelain; } > "$bk/STATE.txt"
      git -C "$wt" diff HEAD > "$bk/tracked/state.diff" 2>/dev/null || true
      for p in "${modified[@]}"; do
        mkdir -p "$bk/tracked/$(dirname "$p")"
        cp "$wt/$p" "$bk/tracked/$p" 2>/dev/null || err "agent-$nn: backup copy failed: $p"
      done
      for p in "${untracked[@]}"; do
        mkdir -p "$bk/untracked/$(dirname "$p")"
        cp -r "$wt/$p" "$bk/untracked/$p" 2>/dev/null || err "agent-$nn: backup copy failed: $p"
      done
      # verify: every backed-up path byte-matches the source
      vbad=0
      for p in "${modified[@]}"; do
        cmp -s "$wt/$p" "$bk/tracked/$p" || { vbad=1; err "agent-$nn: backup verify FAILED (tracked): $p"; }
      done
      for p in "${untracked[@]}"; do
        if [ -f "$bk/untracked/$p" ]; then
          cmp -s "$wt/$p" "$bk/untracked/$p" || { vbad=1; err "agent-$nn: backup verify FAILED: $p"; }
        elif [ -d "$wt/$p" ]; then
          diff -r "$wt/$p" "$bk/untracked/$p" >/dev/null 2>&1 || { vbad=1; err "agent-$nn: backup verify FAILED (dir): $p"; }
        else
          vbad=1; err "agent-$nn: backup verify FAILED (missing): $p"
        fi
      done
      [ "$vbad" = 0 ] || { err "agent-$nn: backup incomplete — NOT cleaning this worktree"; continue; }
      say "   backup verified"
    else
      say "   [dry] would: STATE.txt + tracked/{state.diff + ${#modified[@]} file copies} + untracked/{${#untracked[@]} paths}"
    fi
  else
    say "   clean — no backup needed"
  fi

  # 3) clean the tree (backup-verified dirty ones; asserts above guarantee order)
  if [ "$GO" = 1 ]; then
    if [ "$dirty" = 1 ]; then
      git -C "$wt" restore --staged --worktree . || { err "agent-$nn: restore failed"; continue; }
      git -C "$wt" status --porcelain | grep -qv '^??' && { err "agent-$nn: tracked dirt survived restore — aborting this worktree"; continue; }
      fi_x=0; for p in "${untracked[@]}"; do rm -rf "$wt/$p" || fi_x=1; done
      [ "$fi_x" = 0 ] || { err "agent-$nn: untracked removal failed"; continue; }
    fi
    if [ "$STASH" = "1" ] && [ "$dirty" = 1 ]; then
      # legacy variant, post-backup: push onto the SHARED stack, record, never drop
      git -C "$wt" stash push -u -m "carry-$TAG-agent-$nn" >/dev/null || { err "agent-$nn: stash push failed"; continue; }
      s0=$(git -C "$wt" stash list | head -1)
      echo "stash: $s0" >> "$wt.carry/$TAG/STATE.txt"
      say "   stashed (SHARED stack; NEVER drop; pop ONLY here after verifying stash@{0})"
    fi
    # 4) forward
    if [ "$MODE" = cut ]; then
      git -C "$wt" switch -c "carry-$BRANCH_TAG-agent-$nn" "$BASE" || { err "agent-$nn: switch -c failed"; continue; }
    else
      case "$br" in carry-*) ;; *) err "agent-$nn: MODE=ff refuses non-carry branch '$br'"; continue;; esac
      git -C "$wt" merge --ff-only "$BASE" || { err "agent-$nn: ff-only failed (diverged?)"; continue; }
    fi
    say "   DONE: $(git -C "$wt" branch --show-current) @ $(git -C "$wt" rev-parse --short HEAD)"
  else
    say "   [dry] would: $( [ "$dirty" = 1 ] && echo 'backup+clean; ' )$([ "$STASH" = 1 ] && [ "$dirty" = 1 ] && echo 'stash push -u (record, never drop); ' )\
$([ "$MODE" = cut ] && echo "switch -c carry-$BRANCH_TAG-agent-$nn $BASE" || echo "merge --ff-only $BASE (branch $br)")"
  fi
done

say ""
if [ "$fail" -gt 0 ]; then say "# COMPLETE WITH $fail ERROR(S)"; exit 1; fi
say "# COMPLETE — restore point: \$WT.carry/$TAG/ (STATE.txt first line = pre-forward HEAD)"
