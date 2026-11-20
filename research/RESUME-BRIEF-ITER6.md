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

## SESSION END — user-ordered pause (2026-11-21; wrapped orchestrator-direct, no lane spawns)

**CAUSE OF STOP (diagnosed, evidence in h-wave4-log):** the session ran on the offpeak-idle plan; the platform reclaimed off-peak compute at 2026-11-20 ~21:16–21:19, cancelling the only two running lanes (R5, R3 — transcripts end `off_peak_cancelled`, db turn_usage UNKNOWN_ERROR). All other lanes were in designed standby ⇒ zero running tasks ⇒ silence. The session then migrated to zai-individual-coding-plan (instruction-reload banner). **USER DIRECTIVE (2026-11-21): do NOT resume under a different plan — resume only under the same plan family (offpeak-idle), on the user's explicit signal.** The heartbeat automation was deleted at the user's direction; do not re-create it unasked.

### (a) State at pause

Main CLEAN at `8c99166` (all 47 batches + the ship family landed; nothing dirty). **Iteration 6's first ship landed: article-41H3** (NEGATIVE discovery-grade quota-free; splice state 97d550fd; README counts 9 discovery-grade of 17; KPI 9/17 ≈ 52.9% — ABOVE the ≥half bar). **article-75 v3 landed + E9 tail** (cb3da4ae @ 8680edc; splice-time PASS 74ef9e67; revise-in-place, no ship added). **12-core day-1 GREEN + S-tranche milestone** (MMgeneral_total_sum kernel-clean @ CORE.lean 7e40dff4, the strassen-frozen rebuild done, the ω_b-balance kernel-checked). **M3 deep re-scoping park** (8 fires, absolute cap; final root = universe-polymorphic-have escape; variant-1 universe-pinning pre-applied-unfired @ P0 c6752422). **N2P1 override re-bind DISCHARGED** (6303aab). **Item-13 GREEN run 20** (74-P2 fully triad-verified — closed the iter-5 checklist).

### (b) INTERRUPTED UNITS (worktree states preserved; re-fire is sha-guarded-safe)

1. **R5 / agent-04**: `eta-r4.lean` moved post-landing to **`285a411e48c3ad1e`** — the cancelled run APPLIED the pre-decoded residual routes ((b) the explicit `div_const` divisor :616–619, cast cleanups :456/:488/:584, heartbeat insurance :490) **UNFIRED**. Resume first action: fire `285a411e` as-is (this is grant-fire 2 of the ≤3 order); on new residue decode fresh. Expected GREEN closes the port ledger at 14-of-12–13.
2. **R3 / agent-07**: `CORE.lean` unchanged at the landed milestone `7e40dff4dc12b6a6` (the cancelled closing batch never wrote). Standing order stands: ≤5 fires — port donor `Choice.lean:60–244` rpow calculus at η = 0.0315 to discharge `ChoiceSumInputs`, then close `route16_MMgeneral`. On GREEN the 12-core S-tranche closes; then the M-class evaluation (flagship + balancePoint step-2).

### (c) RESTART MAP (fresh session, in order)

1. Read: `AGENTS.md` → `RESEARCH.md` §Iteration 6 → this §SESSION END → `ORCHESTRATION-ITER6.md` → h-wave4-log tail.
2. **PLAN CHECK FIRST (the user's directive):** confirm the session runs under the same plan family (offpeak-idle) BEFORE spawning; if the session is on another plan, do not spawn — report and await the user.
3. Verify main CLEAN at `8c99166`+ (the wrap commit); worktrees persist (agent-01..agent-10) — pull per REPORT, never delete/clean; `modal app list` orphan check.
4. Re-spawn one-by-one (sticky topology; fresh subagents — cancelled agents cannot be SendMessage-resumed): R5 fires `285a411e`; R3 runs the closing batch; then re-task the standby lanes per the tracker (R2 gates, R9 novelty-verification, H commit duty, R1 folds).
5. Wave-2 queue (seeded, unchanged): M3 variant-1 re-scope (P0 c6752422, one scoped fire); L3 re-charter per stop-note db872dc5; FB-2 precharter follow-on (4cf78ce1); the H3.lean custody-rider fire (audit tail → all 16 theorems; binding rider from README row-41H3).
6. Guard rails: lanes never commit; Modal rules (doz CLI, SPEC 2cpu/4GB, LEAN_NUM_THREADS=2, telemetry IN-LOG); assertion-guarded replaces; the loop terminates only externally.

— wrapped by the orchestrator, 2026-11-21. Nothing lost: main CLEAN, all lane states preserved, every landed artifact committed.
