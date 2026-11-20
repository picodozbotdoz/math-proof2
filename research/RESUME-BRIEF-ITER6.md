# RESUME BRIEF — Iteration 6 (opened 2026-11-20 post-close; kept current by H)

## (a) Session context

- Iteration 6 opened 2026-11-20 at the iter-5 close commit **`6306dbe`** (the §D
  choreography executed single-commit: gates G1–G8 all PASS — G2 w/ 9 declared-class
  exceptions + ONE OVERRIDDEN carry, the N2P1 override re-bind; the §I5 splice;
  Instruments A+B; §G8 committed in-block). **Iteration-5 final basis (carried):**
  tables 22 rows = 15 GREEN / 2 honest-partial / 1 parked-unfired (18 ✓); whole-tree
  605 print-verified triad-clean decls (386-equiv + 219 growth) + 18 donor rows;
  Step-A certificate 66 = 52 − 3 + 17 (ENTRY 14, zero unexplained); Step-B 61/70 OK
  all-0-sorryAx ⊆ triad; **two discovery shipments** (article-41 DISCOVERY +
  article-41H NEGATIVE-kind, both quota-free); **KPI: discovery share 8/16 = exactly
  50% — the ≥half bar PASSES at equality; quota N=1 UNSPENT, the SECOND consecutive
  unspent cycle** (the F5 minting correction: the two-strike rule was minted at
  Iteration 4; an iter-6 unspent would be the THIRD).
- Charter = the §Iteration 6 splice from R9's typeset of charter v6 `f0565371` WITH
  the orchestrator's rulings folded — executes on R9's report + the orchestrator's
  approval; H splices VERBATIM (`git apply --check` first; conflict ⇒ STOP, route to
  R9) + the STATUS.md "Iteration 6" block + day-1 records + INDEX rows in the
  `Iter6:` opening commit.

## (b) Protocol (carried from Iterations 4/5, unchanged)

1. 10 lanes: H (sticky; sole committer; owns this brief + the tracker) + R1–R9.
   One writer per file; lanes never commit; queue-loaded re-tasks (2–3 items,
   bottom-up, report on drain); spawn one-by-one; concurrency probe at close.
2. H commits exact-file batches — hardened gate EVERY commit: `git status
   --porcelain` + `git diff --cached --stat`; any foreign staged line ⇒ `git
   restore --staged`; NEVER `git add -A`. Prefixes `Iter6:` / `Iter5 close:`.
3. File funnels: `qa/iter4-review/r3-verification-tables.md` (or its iter-6
   successor) → the verification lane only; H-shepherded surgical edits for
   shared instruments. INDEX row rides every new `research/` file, same commit;
   tracker + briefs refresh per batch.
4. Modal (MANDATORY, AGENTS.md): doz CLI `/home/doz/dozenv/bin/modal` PRIMARY;
   SPEC cpu=2.0/mem=4096; telemetry every run; `LEAN_NUM_THREADS=2`; taskset not
   -j; overrun ⇒ investigate-not-upgrade; long runs (> ~40 min) `modal run
   --detach` from a `setsid nohup` wrapper. Standing lessons bind (the
   runner-hygiene family: the `: error(` filter class, fused-iff suppression,
   assertion-guarded replaces, the parse-trap class, the echo-backtick trap;
   site-closure ≠ certification).

## (c) Per-lane table (mirrors the tracker; pull per REPORT)

| Lane | Worktree | Assignment |
|---|---|---|
| H | (main) | commits; the iter-6 opening mechanics; tracker/briefs; telemetry watch |
| R1 | agent-02 | verification-integrity — the N2P1 override re-bind FIRST, then iter-6 duty |
| R2 | agent-03 | close→article-75-v3 S1–S4 eval |
| R3 | agent-07 | 12-core day-1 fire (STAGED-UNFIRED set; the day-1 signal) |
| R4 | agent-08 | H3 standby (evidence complete; article decision + M-GO at open) |
| R5 | agent-04 | η-r4 one-fire (T2/T3; fix-batch-10 applied-unfired) |
| R6 | agent-06 | article-75-v3 dossier owner / standby |
| R7 | agent-10 | H3 draft + article-75-v3 editorial read |
| R8 | agent-05 | M3 one-fire (P0 `33c75942` + A1 `a8feb25b` + A2 `221eb30b`) |
| R9 | agent-09 | charter/typeset (the §Iteration 6 typeset + diff) |

## (d) Restart instructions (fresh instance)

1. Read order: `AGENTS.md` → `research/RESEARCH.md` (§Iteration 6 + the §Iteration 5
   close-out record) → this brief → `ORCHESTRATION-ITER6.md` (the live tracker) →
   `qa/iter4-review/h-wave4-log.md` (standing notes + the close-act record).
2. `git status --porcelain` on main — reconcile against the tracker BEFORE any
   commit. Worktrees persist at `/home/doz/zcode-workdir/worktrees/agent-01…10`
   (six on carry-branches `carry-20261120-agent-{04,05,06,08,09,10}` @ e3d984b;
   agent-02 @ a175b1d, agent-03/07 @ e3d984b — the 2026-11-20 forward manifest in
   h-wave4-log; forward to the opening commit at spawn per the same stash-carry
   pattern). **Lane numbering is NON-SEQUENTIAL vs worktrees — pull per REPORT.**
   Never delete/clean lane files; siblings read-only.
3. **The N2P1 override re-bind (the close's one OVERRIDDEN carry)**: R1's first
   unit — make_axcheck's `AxPilot75_N2P1` GIT_BYTES override still stages the
   run-26 bytes `ce6719c8`@`ff8b99e` vs HEAD `396d8710` (run-31 GREEN); move/drop
   per the tracked rule (drops iff HEAD == verified), then re-verify the
   75_N2P3/N2P3e/N2P2c stages.
4. Day-1 fire records land worktree-side until the opening commit. Dates from
   decision rows or `git show -s --format=%cs`, never memory.
