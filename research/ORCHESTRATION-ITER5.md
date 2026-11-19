# ORCHESTRATION-ITER5 — Iteration 5 lane tracker

Iteration 5 opened 2026-11-19 (opening commit `e309edd`, post-K `b2f2c18`); charter
`RESEARCH.md` § Iteration 5 + `STATUS.md` § Iteration 5; launch brief
`RESUME-BRIEF-ITER5.md`. **Predecessor: `research/ORCHESTRATION-ITER4.md` (frozen
at the Iteration-4 close — wave history, close-act record).** Maintained by H on
orchestrator signal. Worktree assignments are NON-SEQUENTIAL vs lane numbers —
**pull per REPORT, never by lane number**; lanes never commit (H commits exact-file
batches, hardened gate); file funnels + Modal rules per the launch brief §(b).

| Lane | Worktree | Role | Current unit | Status | Last update |
|---|---|---|---|---|---|
| H | (main) | helper/infra (sole committer) | steady-state pull-per-REPORT batches + INDEX rows; standby to confirm R2's G8 cell flips when they land; telemetry watch | active | 2026-11-19 |
| R1 | agent-02 | iter-5 verification | **unit-12 LANDED (batch-J: the P2-c parked row — tightness 3-of-4, both fixes stated, FINDINGS #5/#6 + the adjudicated def; guard → `4425be89`; ENTRY 12)** → **LIVE-EVENTS STANDBY (6 pending: M2-b · P3-complete · 41H-T2 · eta-r2/3 · P2-c-close · L3-final)** | standby | 2026-11-19 |
| R2 | agent-03 | 72-M1 + gates tail | gates COMPLETE (8/8) + the L3 FINAL fold-once + the REPORT delta landed + **the iter-5 gates skeleton landed (batch-J: `qa/iter5-closeout-gates.md` `5672b30d` — PREP-ONLY; executes at iter-5 close on the orchestrator's signal)** | active | 2026-11-19 |
| R3 | agent-07 | 74 + wave-close | **RUN-18 RE-PARKED (batch-K)**: `P2.lean` `7393c98d` (the new park, superseding `4425be89`) — NOT-GREEN re-parked per no-loop terms; **prediction = one-word GREEN at the next salvo**; the charter updated by R3 (item 2: 2 fixes DONE, one word named; `a9b295ad`). **ORCHESTRATOR NOTE: the next salvo = item 1 (N2 P2-b, on R6's drain) + item 2b (P2-c one-word, same firing round); R1's P2-c §11 fold HOLDS until the salvo's outcome (fold once at the TRUE closing state — avoid double-fold)** → **SALVO STANDBY** | standby | 2026-11-19 |
| R4 | agent-08 | 41 (H) tranches | **TRANCHE-2 CAP-STOP landed (batch-L; `H2.lean` `ab8da9e1` HELD — drifted to `b2f90045`, the completion executing live)**: certificates GREEN (`sigmaOrth` + `sigmaExpand_basis`, both [propext]; the σ-table full-rank 8 = the 3-strand death knell); derivation open on ~4 word-fixes at the 10/10 cap; **re-charter GRANTED — R4 executing the completion + a tranche-3 scope note**; the 41H stub grew its plan section (traciality + rank obstructions; still zero claims) | active | 2026-11-19 |
| R5 | agent-04 | η-port | **rung-1 FINAL-GREEN landed** (record + run3 confirmation 6/6 triad; the eta-r1 fold queues at R1) + rung-2 records + the AMENDED port plan landed (the **FINDING: probe (ii-c)/(iii) false-as-stated → corrected forms + threshold domain; the donor public-layer discovery**) — `eta-r2.lean` `36c593f7…` HELD (fold-once; the confirmation fire in flight) → **confirmation + rung 3 + the precharter amendment** (rides the next report) | active | 2026-11-19 |
| R6 | agent-06 | 75-N2 | **SALVO FIRED** (items 1 + 2b + the P2-c confirm live on R6/R3): unit-8 landed (batch-L: `N2-P2c.lean` `da4c8d3f` parked w/ pillar triad — R1's fold at the salvo; `N2-P3V2-smoke.lean` `fa3704b1` + **the V2 build GREEN** — `simple_proportion_d4` ON-PIN TRIAD; the OVER-cpu samples dispositioned as the authorized lake-build subprocess class, the m4b2/G2 precedent; runner pairs + 4 logs + record/dossier deltas) → **P3-d unblocked, firing on either GREEN** | active | 2026-11-19 |
| R7 | agent-10 | 77 unit + editorial | **STANDBY-FOR-SPLICE-SIGNAL** — article-41 draft-final delivered (`f068d9ae`, held worktree-side) + the splice PACKAGE landed (`a7-41-splice-package.md`, paste-ready); the splice executes ONLY on the orchestrator's signal after R2's S1–S4 pass (ship-gate: R7 ✅ R9 ✅ — only R2 remains) | standby | 2026-11-19 |
| R8 | agent-05 | AL rebuild | unit-8 landed (batch-L: record `3808ef96` + 3 m2c logs) — **honest stop at cap; the guard/swap invisible-sorryAx ISOLATED (bisect designed, not guessed); M2-c at 2 one-liners, the keystone expected GREEN**; `A2.lean` `b186f960` HELD (fold-once, unit 9 live) → **M2-c close + the guard bisect** | active | 2026-11-19 |
| R9 | agent-09 | novelty | **TRUE GATE-STANDBY** (delivered: 41 battery FINAL + all round-6 + amendments + the N2 ship template — see R6's row); queued events: the N2 ship refresh (rides R6's P3 fire) + the article-41 challenge-only | standby | 2026-11-19 |

Standing: R9's erratum-2 divergence record + the dependsOnNoncomputable substrate
rule + the telemetry-watch notes live in `qa/iter4-review/h-wave4-log.md` (H's
running log — lineage continues there until an iter-5 log opens on volume).
