# RESUME BRIEF — Iteration 5 (launch window 2026-11-19, pre-K insurance; kept current by H)

## (a) Session context

- Iteration 5 opens 2026-11-19, post-close: Iteration-4 close-completion commit
  **K = `b2f2c18`, 2026-11-19** (fired on the orchestrator's signal; post-K
  re-greps G4/G7(a)/G7(b) all PASS — h-wave4-log). The splice + §STATUS block +
  day-1 records landed in the opening commit (this brief's placeholders filled
  there; K execution record: h-wave4-log.md).
- Charter = `RESEARCH.md` § Iteration 5: R3's typeset (`a6-iter5-charter-typeset.md`)
  spliced VERBATIM per the orchestrator's 2026-11-19 approval (machine diff
  `a6-iter5-research-splice.diff`, `git apply`); the §STATUS block appends after
  the Iteration-4 CLOSED block. DECISION-1 ruled 2026-11-19 (quota
  spend-only-if-executed); DECISION-2 = Option A; DECISION-5 resolved-by-battery.
  Iteration-4 final basis (carried): §10 N=32 (26/3/3); whole-tree 385/386; 18/18
  donor rows; quota N=1 UNSPENT; census 40/46 / 6 / 0.

## (b) Protocol (carried from Iteration 4, unchanged)

1. 10 lanes: H (sticky; sole committer; owns this brief + the tracker) + R1–R9.
   One writer per file; lanes never commit; queue-loaded re-tasks (2–3 items,
   bottom-up, report on drain); spawn one-by-one; concurrency probe at close
   (`ps -eo comm --no-headers | grep -cx zcode-cli`).
2. H commits exact-file batches — hardened gate EVERY commit: `git status
   --porcelain` + `git diff --cached --stat`; any foreign staged line ⇒ `git
   restore --staged`; NEVER `git add -A`. Prefixes `Iter5:` / `Iter4 close:`.
3. File funnels: `qa/iter4-review/r3-verification-tables.md` → R1 only;
   `qa/REPORT-INPUTS-ITER4.md` → H-shepherded surgical edits. INDEX row rides
   every new `research/` file, same commit; tracker + briefs refresh per batch.
4. Modal (MANDATORY, AGENTS.md § Modal): doz CLI `/home/doz/dozenv/bin/modal`
   PRIMARY for warm-layer apps (semraker); xyz (`sudo -n -u xyz
   /home/xyz/xyzenv/bin/modal`) brand-new + fallback (donniexyz888; foreign rows
   expected); SPEC cpu=2.0/mem=4096; telemetry every run; `LEAN_NUM_THREADS=2`;
   taskset not -j; overrun ⇒ investigate-not-upgrade.

## (c) Per-lane table (mirrors the tracker wave-4 map; pull per REPORT)

| Lane | Worktree | Assignment |
|---|---|---|
| H | (main) | commits; K + opening mechanics; tracker/briefs; telemetry watch |
| R1 | agent-02 | close residue (the K gate); verification-integrity successor |
| R2 | agent-03 | gates G1–G8 DONE; 72-M1 L3b–d; K-time G4/G8 interrupt duty |
| R3 | agent-07 | charter DELIVERED+approved; 10-D4 M-arc GREEN; 74-P2 |
| R4 | agent-08 | 41-P0 GREEN; core S–M |
| R5 | agent-04 | η-pin-probe (run 2 + OVER-cpu investigation owed) |
| R6 | agent-06 | 75-N2 P2 (run 22+; the iter-5 lead-1 resume note) |
| R7 | agent-10 | close-support DONE; Liu B_new statement-port |
| R8 | agent-05 | wave-2 queue; AL M0-rebuild |
| R9 | agent-09 | round-6 novelty batteries |

## (d) Restart instructions (fresh instance)

1. Read order: `AGENTS.md` → `research/RESEARCH.md` (§ Iteration 5 + the
   Iteration-4 close-out record) → this brief → `ORCHESTRATION-ITER4.md` →
   `qa/iter4-review/h-wave4-log.md` (K script, manifests, standing notes).
2. `git status --porcelain` on main — reconcile against the lane table BEFORE any
   commit. Worktrees persist at `/home/doz/zcode-workdir/worktrees/agent-01…10`
   (base e3d984b+, forwarded 2026-11-19; `.carry` manifests in h-wave4-log.md).
   **Lane numbering is NON-SEQUENTIAL vs worktrees (see table) — pull per REPORT,
   never by lane number**; never delete/clean lane files; siblings read-only.
3. Modal relaunch per (b)4. Substrate rule: data-level defs touching `Polynomial
   ℤ` / monoid-algebra mul get `noncomputable` UP-FRONT (the
   `dependsOnNoncomputable` class; h-wave4-log standing note). Dates: decision
   rows or `git show -s --format=%cs`, never memory.

## (e) K + opening-commit state (the immediate sequence)

1. **K** (orchestrator signal; only R1 gates it): execute the 14-step script in
   h-wave4-log.md — R2 pair + R1 residue pulls → 6 stamps (§K-STAMPS 0–5) → 2
   [DATE-CLOSED] patches → 6 D.4 text-match stamps → STATUS closed block →
   REPORT-INPUTS §3 → REPORT §I4+KPI → INDEX G3+(A1)/(B1) → README verify-only →
   tracker/brief/log → hardened gate → exact-file commit + post-K G4/G7(a)
   re-greps; [DATE-CLOSED] = K's actual date everywhere.
2. **Opening commit** (post-K, one commit): the 8-step checklist in
   h-wave4-log.md — pull R3's typeset + diff (hash→copy→cmp) → `git apply --check`
   (conflict ⇒ STOP, route to R3; never hand-merge) → apply → §STATUS block
   verbatim → pull reported day-1 records (η-pin, N2-P2 run 22+, 41 S–M, M-arc,
   AL-M0, watchlist sha `2408da6e667ec6ca`, round-6) → INDEX rows → tracker/brief
   refresh → `Iter5:` commit — day-1 records worktree-side until then, **no splice
   before K**.
