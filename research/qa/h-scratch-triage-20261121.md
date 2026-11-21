# H carry-scratch triage — 2026-11-21 (post-resume)

Author: the general helper lane (worktree agent-01, carry-20261121-agent-01, clean @
`ef1e7bd`). Input: the pre-resume untracked backup at
`/home/doz/zcode-workdir/worktrees/agent-01.carry/2026-11-21-resume/untracked/`
(read-only; nothing copied back). Context at triage: referee pass landed (`2bfe771`),
41H3 custody settled (`2ea25a9`), eta-r4 payload (`0df2546`) + introduction draft set
(`ef1e7bd`) landed, resume executed; main has since moved to `0a15ec0` (resume records
`d694a45` + R4's L3 re-charter landing) — none of the triaged items is affected by that
delta (verified: the only research/ delta `ef1e7bd..0a15ec0` = INDEX row +
`pilots/72-M1/L3-recharter.md` + tracker/wave-log edits).

Verdict classes: (a) still actionable — update to current state; (b) superseded by
landed history (landing commits named); (c) dead.

## 1. `wave2-commit-runbook.md` — VERDICT (b), superseded; archive-only

Iteration-4 wave-2 H commit runbook (A1–A9 lane charters, the check-before-verbatim-copy
list @ base `53c1548`, the 2026-11-17 path-decision reminders).

- The H-commit procedure (hardened gate, exact-file batches, INDEX-row-same-commit,
  concurrency probe) is now protocol, carried verbatim in `RESUME-BRIEF-ITER6.md` §(b)2
  — landed with the iter-5 launch brief `6f25933`, carried at the iter-6 wrap `0676ba0`.
- The per-lane deliverables charters were consumed by the iteration-4 close: close
  family `070c2bb`/`ce26b5c`/`0d33cd0`/`3bd8a19`/`b2f2c18` (CLOSE-COMPLETION K, INDEX
  fills included), iter-5 open `e309edd`, `ORCHESTRATION-ITER5.md` opened `ff8b99e`.
- The CHECK-BEFORE-VERBATIM-COPY list (base `53c1548`) is stale twice over: iter-5/6
  lanes run on carry branches with sha-guards, and its core lesson (worktree-verified ≠
  landed) was institutionalized as the N2P1/SLOT-1 incident — fixed `7caddb3`, re-bind
  discharged `6303aab`, recorded in h-wave4-log 2026-11-20.
- Durable residues all live in the standing protocol (never `git add -A`; funnel rules;
  date discipline). No update is worth making: (b), keep in backup as the iteration-4
  provenance record.

## 2. `r5-14-runqueue-sweep.md` — VERDICT (b), fully discharged; no residue

The 2026-11-17 first-48h sweep of `r5-iteration4-backlog.md` §14 (12 rows + 3
supplements). Every row has since landed with evidence on disk + an INDEX/r3-tables
row:

- Rows 1–8, 11 (already DONE-GREEN at sweep time): unchanged verdicts, rows of record
  at `r3-verification-tables.md` §10.1–10.8.
- Row 9 ZZV2-λ P0 [A3]: GREEN — P0+P1 rows in INDEX (P1 GREEN FINAL run 3 + the
  HARD-STOP per r5 §12a, which set up the eta-port arc that iter-6's eta-r4 continues).
- Row 10 G9 (UNSTARTED-conditional): fired and GREEN — `r3-verification-tables.md`
  §10.24 (runs 36/37 + G13 38/39, 2026-11-17; ProbeG9 re-hash `c1f93388`).
- Row 12 32-crossing run 12 [A6]: GREEN — `research/pilots/32/logs/run12-crossing-existence.log`
  + `run12-discharge-note.md` on disk; INDEX row 218 stamps "32-crossing run-12 GREEN
  `887ffd1`" (11 §14 rows DONE-GREEN at the F8 refresh).
- Supplements: 73-Q4 GREEN FINAL 15-run descent (INDEX row, landed 2026-11-17); AL-P2
  c/d/e continued into the M0-rebuild/M1/M2 GREEN-triad + M3 park arc (rows at INDEX
  `332`-family and `437`).

## 3. `index-drift-listing.md` — VERDICT (b), executed at the iteration-4 close; succeeded by a fresh listing

The 2026-11-17 drift listing (9 missing rows / 8 prefix fixes / 5 dead rows / 1
filename fix) was fully reconciled:

- A-items backfilled with explicit stamps: rows for `REPORT-INPUTS-ITER4.md`,
  `week1-agenda.md`, `closeout-gate-run-C2-reconstructed.md`, `RESUME-BRIEF-C2.md`,
  `cycle2-qa-plan.md` (all "[backfilled]"), `pilots/32/run_pilot.py` row ("[INDEX G3
  both-directions close rode the same K commit]"), 72-runner fold (row 146
  "[runners folded into the row 2026-11-17, H reconciliation]"), zzv2-lam P0.lean and
  al3d A2.lean covered by widened rows. Landing: the K commit `b2f2c18` family
  (2026-11-19).
- B-items fixed: prefix fixes (row 94 "[prefix fixed 2026-11-17]"), the m4b filename
  corrected (row 165 "[filename corrected 2026-11-17, H reconciliation]"), dead rows
  stamped/retired (the decl-index v1/v2 rows now carry RETIRED 2026-11-20 notes).

The same chore has been re-run for the current state: see the companion output
`research/qa/h-index-drift-20261121.md` (28 files in 4 groups — the introduction set,
two 2026-11-21 landings that rode without rows, one decl-index fold-in).

## 4. `agents-substrate-note-correction.patch` — VERDICT (c) dead as a patch; content absorbed by the new draft

- Never applied: AGENTS.md still carries only the 2026-11-13 "sudo -n -u xyz blocked"
  note; the patch's context chunk no longer applies cleanly and its routing ruling
  ("xyz primary for brand-new apps") was superseded by the reconciled dual-primary →
  doz-PRIMARY chain (a8-midwave-audit F1; `RESUME-BRIEF-ITER6.md` §(b)3: doz CLI
  PRIMARY).
- Do NOT apply it now: today's state (xyz live again, probe passed 2026-11-21) needs a
  different amendment. Its durable observations (xyz workspace `donniexyz888`, client
  1.6.3, no crossmath warm layers, concurrent foreign workloads — all 2026-11-17
  observations) are folded into `research/qa/h-substrate-note-draft-20261121.md`,
  which supersedes this patch as the substrate-note amendment of record (user-gated).
- Keep the patch in the backup as the provenance middle point of the xyz oscillation
  (blocked 2026-11-13 → live 2026-11-17 → live 2026-11-21; no probe record in between).

## Health snapshot (2026-11-21, ~12:2x +08 probing window)

- **Modal apps (doz CLI `app list`):** 2 apps, both current-session, **no orphans** —
  `crossmath-pilot-zzv2-lam` (ephemeral, 1 task, created 12:18; consistent with R5's
  eta-r4 grant-fire-2 in flight) and `crossmath-pilot-al3d` (stopped 12:21, 0 tasks).
  All earlier ephemeral apps have expired as designed.
- **Worktrees:** 10/10 on `carry-20261121-agent-NN` @ `ef1e7bd`. Clean: agent-01/02/03/
  04/05/07/09. Dirty = active lane work, expected: agent-06 (4 modified introduction
  companions — R6 verification pass), agent-08 (untracked `pilots/72-M1/L3-recharter.md`
  — **since landed on main at `0a15ec0`**, worktree residue only), agent-10 (1 modified
  introduction companion — R7 pass).
- **Main checkout:** branch `dev/zai` @ `0a15ec0` (2 commits past `ef1e7bd`:
  `d694a45` resume records, `0a15ec0` R4 L3 re-charter + INDEX row + tracker re-task —
  both consistent with the resume map). **One uncommitted modified file on main:
  `research/articles/introduction/42-quadratic-dedekind-zeta-zero-proportions.md`** —
  flagged for H awareness (mid-batch edit or an accidental main-side touch; the
  introduction set is R6/R7-owned per the landing note, so if this is not H's own
  in-progress fix batch it should be reconciled against agent-06's dirty set, which
  also touches the 42 companion).
- **Disk:** `/` 326G total, 159G used, **164G available (50%)**; `worktrees/` footprint
  221M. No pressure.
