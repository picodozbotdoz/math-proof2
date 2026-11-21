# Iteration-7 open — worktree-forward runbook (parameterized; 2026-11-21)

Author: the general helper lane (worktree agent-01). Codifies the carry pattern H
executed at the 2026-11-21 resume, with this session's traps baked in. Companion
script: `research/qa/forward_worktrees.sh` (DRY by default; `--go` to execute;
env-parameterized). H runs it at the iteration-7 open, after the opening commit
exists on main.

## 1. The procedure (per worktree agent-01…10)

1. **Validate BASE** (the iteration-7 opening commit on main): must resolve to a
   commit AND be an ancestor of main HEAD — refuse anything else (no speculative
   forwards).
2. **Capture state**: `git status --porcelain -z` (robust to spaces; dir entries).
3. **Backup if dirty** → `$WT.carry/<tag>/` with the landed format (verified against
   `agent-01.carry/2026-11-21-resume/`): `STATE.txt` (line 1 = pre-forward HEAD sha,
   then the porcelain lines) + `tracked/` (`state.diff` = `git diff HEAD`, plus
   per-file copies) + `untracked/` (path-preserving copies). **Verify the backup
   byte-matches (`cmp`/`diff -r`) before any cleaning — a failed verify leaves the
   worktree untouched.**
4. **Clean**: `git restore --staged --worktree .` (both index and tree) + remove the
   backed-up untracked paths; assert no tracked dirt survived.
5. **Forward**: MODE=`cut` — `git switch -c carry-<yyyymmdd>-agent-NN <BASE>` (the
   iteration-6-open pattern, branches `carry-20261121-*`); MODE=`ff` —
   `git merge --ff-only <BASE>` on an existing carry branch (the mid-iteration
   refresh pattern; refuses non-carry branches).
6. Report per-worktree result + the restore point.

Never done by this procedure: touching main (read-only: BASE validation), any
`git stash drop`, any `git pull`/fetch, any push.

## 2. The traps (each one bit this session or its predecessor)

- **T1 — the SHARED stash stack.** Empirically verified 2026-11-21: `git stash list`
  shows the SAME 10 entries (`stash@{0..9}: On carry-20261120-agent-NN:
  carry-20261121-resume`) from main AND every worktree — `refs/stash` is one stack
  for the whole linked-worktree repo. Consequences: (a) lanes NEVER stash (the
  standing rule); (b) the legacy `stash push -u` step is H-only, one worktree at a
  time, with an empty-stack assert at entry and the created `stash@{0}` recorded into
  the backup STATE.txt; (c) **pop only in the worktree that pushed, only after
  re-reading `stash list` and verifying `stash@{0}`'s message is yours** — the index
  reshuffles as siblings push; (d) **never drop** — the 10 live resume entries are
  themselves the rescue record of the last session's dirty state. The script's
  default (`STASH=0`) avoids the stack entirely: backup + `restore` + clean is
  equivalent for preservation and touches nothing shared.
- **T2 — intro-set visibility (post-base files are invisible worktree-side).** Files
  that landed on main after a lane's base do not exist in that lane's checkout:
  `ls`/`rg` in the worktree is NOT evidence of repo state — use `git show
  HEAD:<path>` / `git log [--oneline] -- <path>`. Both directions bit this session:
  the introduction set was main-only until ff'd (lanes re-derived instead of reading
  it), and lane-side "my file is new" claims must be checked against main history
  before landing (the a9-iter6 splice-diff near-miss class). After a forward, re-diff
  expectations: new files APPEAR in the worktree at BASE.
- **T3 — ff needs an explicit target; never pull.** A bare `git pull` in these
  worktrees would contact `origin` — which points at **`github.com/picodozbotdoz/
  math-proof2.git`, a different repo family** (the math-proof1 lineage), not this
  project's history. Forward ONLY via the explicit local sha (`merge --ff-only
  <BASE>` / `switch -c … <BASE>`); a ff-only failure = divergence signal, stop and
  reconcile, never merge-commit through it.
- **T4 — the ghost (if still alive).** The prior-session host writes to MAIN's working
  tree (never to lane worktrees). The forward script never writes main, but the
  open-commit staging must keep the restore-at-gates discipline: snapshot
  (`ghost_snapshot.sh` pattern — generalize the watched dir as needed), restore any
  DIRTY-VS-HEAD bytes, then stage exact files. If the ghost died over the pause,
  drop this trap from the checklist with a dated note.

## 3. Invocation cookbook (H at the iter-7 open)

```bash
# Full forward, fresh carry branches, dry first:
BASE=<open-commit> research/qa/forward_worktrees.sh            # DRY — read the plan
BASE=<open-commit> research/qa/forward_worktrees.sh --go       # execute
# Selective (one lane), mid-iteration refresh on the existing branch:
BASE=<sha> MODE=ff AGENTS="04" research/qa/forward_worktrees.sh --go
# Legacy stash variant (H-only, empty-stack asserted, never drop):
BASE=<open-commit> STASH=1 TAG="$(date +%F)-iter7-open" BRANCH_TAG=$(date +%Y%m%d) \
  research/qa/forward_worktrees.sh --go
```

Notes: the DRY pass doubles as the pre-open census (mixed HEADs are NORMAL — at
draft time agent-01/05/07 sat at `ef1e7bd`, others at `7d7fcdd`/`3a752cf`/`15bf11a`;
H ff's selectively per lane need). Restore = copy back from `$WT.carry/<tag>/`
(STATE.txt line 1 = the pre-forward HEAD to return to if needed).

## 4. DRY test record (2026-11-21, BASE=`1c10bc4`)

10/10 worktrees traversed clean; per-worktree state + backup plans correct
(agent-01: 8 untracked paths incl. this runbook; agent-03/05/09/10: tracked dirt
detected and planned; agent-06 clean at `15bf11a`); invalid-BASE assert fires
(`deadbeef` → hard error); MODE=ff emits `merge --ff-only` on the carry branch.
No execution performed (DRY only, per the unit order). Script sha at test:
see the landing commit.

## 5. Addendum (2026-11-21, the actual iter-7 open): the mass-forward was SKIPPED

At the real iteration-7 open (`4906376` opening commit → `d429d19` tracker), the
en-masse forward was deliberately NOT run: the lanes **self-ff per task** — the
established same-session pattern (each lane ff's its own worktree to the commit its
task brief names; the mixed-HEAD state is normal mid-session). The mass-forward
(`forward_worktrees.sh --go`) remains the **fresh-session path** (post-pause/resume,
new spawn wave, or any state where lane self-ff cannot be assumed). No safety
consequence: the skip only affects when worktrees reach the open commit, not whether
backups/asserts apply — lanes still never stash, and dirty-forward still requires
the carry-backup discipline (this lane's own iter-7-open refresh executed the
residue-backup + `merge --ff-only` path: 10 untracked files all byte-identical to
their landed blobs → carry-copied to `agent-01.carry/2026-11-21-iter7open/`, removed,
ff'd clean to `d429d19`).
