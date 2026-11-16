# Close-out commit & branch plan — Iteration 4 (R4-authored skeleton, H executes)

Staged 2026-11-16 by lane R4 (`qa/iter4-review/r4-process-completeness.md` author), on
the C2 plan (`qa/closeout-commit-plan.md`) as model — read that first; deltas below are
(b) new preconditions from R5's queue, (c) the NAMED pass-2 step, (d) gate-run
persistence as a hard step, per the C2 close audit. Worked example for every gate:
`qa/closeout-gate-run-C2-reconstructed.md` (the reconstructed C2 run — 11/11 with the
corrected greps; the close-day run had never been persisted, which is the gap this plan
exists not to repeat).

**Branch rule: every commit on `dev/iteration4`; never push.** The next-branch cut is
STEP 10 — orchestrator trigger only (H verifies immediately before executing).

## Preconditions (all must be true before STEP 2)

- **Verdict slots** — one per R5 queue item (`r5-iteration4-backlog.md` §2), each
  terminal (GREEN + axcheck / declared-drop) and relayed by its lane (R5 §5 table):
  LP-P1 layer + LP-P2 02-core consumer (rank 1, L1); 75 P-b E1–E6 + optional N2
  (ranks 2/10, L4); AL-P0 statement layer + rungs (rank 3, L2); ZZV2-λ P0 probe verdict
  + P1 (+P2 iff P0(b) favorable, else stop-and-report) (rank 4, L3); 72-M1 L3 +
  `interface_areaLaw_uniformAreaLaw` (rank 5, L5); 73-Q4 gate recommendation and, if
  open, Q4 execution (rank 6, L8); 74 T1+T2+T4 pilot iff chartered (rank 7); 10 tranche
  D1–D4 iff chartered (rank 8); FF-EZ4 probe + 22-T2a task (rank 9, L8); 11 M3 iff
  chartered (rank 11).
- **Records preconditions:** A9's REPORT-INPUTS-ITER4 ledger on disk (per R9 §2 lane
  table) with every slot row FILLED or explicitly deferred-with-owner; TRIAGE-ITER4
  rows landed (L9); novelty battery discharges landed (L6: debts f/g/h/l lines + Rosen
  spot-check if Q4 ran + α>1 Rényi re-check if 74 ran + standing-clock curls).
- **R2 restructuring decision LANDED and pass 2 executed** (STEP 5 below) BEFORE any
  article/INDEX status is treated as frozen — the relabels, folds, and count fixes are
  one sequence, never interleaved with the sweep steps.
- Known-debts closure at their step: mid-iteration log headers owed at close (C2
  debt-k precedent — green/final successors must all carry headers); untracked-file
  policy declared (only the declared exceptions stay untracked).

## STEP 1 — final lane provenance commits (H, rolling; already in cadence)

One commit per lane drain as before ("Iter4: <lane> — …"), incl. every pilot's final
run logs with provenance headers + sha256 (FINAL-SWEEP-PLAN-ITER4 §2 default 4).

## STEP 2 — final sweep + ledger finalization

Trigger: the standby signal (all FINAL-SWEEP-PLAN-ITER4 §0 rows final-or-declared-drop).
Execute that plan's Steps A–D exactly (R3 defaults are NOT optional). Commit:
`Iter4: final sweep Steps A–D + ledger §<iter4> FINAL`. H QA: sweep tally vs ledger rows
(0 sorryAx expected on all staged finals; full-length print persistence verified — no
"(…N more)" excerpts in any close-sweep log).

## STEP 3 — TRIAGE-ITER4 §decision typeset (orchestrator; H commits)

From L9's staging rows + the orchestrator's decision; scoped-grep discipline for the
banner-retirement check (FINAL-SWEEP-PLAN-ITER4 §5 rule 1 — never a whole-file grep over
frozen main-run/C2 text). Commit: `Iter4: TRIAGE-ITER4 §decision typeset`.

## STEP 4 — REPORT §Iter4 final fills (H owns)

Replace the pre-staged verdict/chain markers with verdict text; zero-placeholder check
is a gate (scoped where the file carries frozen earlier-cycle text); re-pull §-class
counts from A9's ledger — extractor-generated only. Commit:
`Iter4: H — REPORT §Iter4 final fills`.

## STEP 5 — NAMED: pass-2 coordinated records pass (the count-fix + relabel sequence)

The single sequence derived in `qa/iter4-review/r4-process-completeness.md` §7+§9 —
**no piecemeal count fixes at any other step.** Order inside the step is load-bearing:

1. Adopt R3's extractor-count rule FIRST: the extractor (private+lemma-aware per
   FINAL-SWEEP-PLAN-ITER4 §2 default 1) generates LoC/thm/axiom-line counts; hand-
   written counts are retired.
2. Then fix counts everywhere in ONE pass: articles + VERIFICATION-LEDGER + INDEX rows
   (incl. the C2-undercount set R3 F4 enumerated: 75 66→68; 42-M4b 68→70; P11T3
   88→110; 10-L1 25→27; 20 27→28; ledger M4a 52→54; 71-P2 279→282-disk + the
   TRIAGE.md:259 direction fix = r4 batch C4).
3. Then R2's relabel/fold edits (README kinds, article folds/renames — filename churn
   updates every cite of the old name in the same pass) + the coupled INDEX row updates
   (r4 §7 table).
4. Frozen records take **dated correction markers** ("corrected 2026-11-xx, was X")
   rather than silent rewrites (the R2-relabel convention H applies; verified by R4).

Commit: `Iter4: pass-2 records pass (extractor counts + R2 relabels + INDEX), one sequence`.

## STEP 6 — articles (one per surviving discovery, per the iteration-4 article gate)

Only items passing the strength bar (R9 §3b/§3c two-strike gate; template
`articles/TEMPLATE-iter4.md`) get articles — dossier/pilot records otherwise. Every
article carries R3's verification-block format (`r3-verification-integrity.md` §5).
Commit: `Iter4: A9 — article set per the gate`.

## STEP 7 — AGENTS/conventions apply (if any Iteration-4 addendum was drafted)

Same pattern as AGENTS-C2: draft marked APPLIED, kept for provenance; apply per a
pre-resolved edit plan.

## STEP 8 — STATUS cycle-close block + gate-run persistence (H owns)

Fill the close block (pilot outcomes, sweep sign-off, TRIAGE pointer, articles pointer,
debts-register link, next-iteration handoff) AND commit the final gate-run results table
in the SAME commit (protocol rule 2 — the C2 gap, closed retroactively at
`qa/closeout-gate-run-C2-reconstructed.md`, must never recur).

## STEP 9 — stop-point check (H reports to orchestrator)

Gates = the C2 eleven, Iteration-4-adjusted, ALL with corrected scoped greps: 1
all-final signal; 2a/b sweep logs (incl. donor-tree/heavy stages); 3 ledger no-[pending
+ sign-off; 4 slot-ledger zero-OPEN (row-anchored; every residual row
deferred-with-owner + cross-listed in the debts register); 5 TRIAGE banner-retired
(scoped); 6 REPORT placeholders zero (scoped); 7 articles Status FINAL (glob excludes
README); 8 conventions-draft APPLIED; 9 debts register linked from STATUS; 10 tree
clean (declared exceptions only); 11 close sequence verified (STEP 2–8 commits in
order; deviations recorded with rationale). Plus the two NEW gates: **12 INDEX-refresh
two-direction reconciliation** (r4 §6 rule 3) and **13 date-discipline grep** (r4 §6
rule 4). Every gate's command + raw result + verdict lands in the STEP-8 table.

## STEP 10 — next-branch cut (ORCHESTRATOR ONLY — H verifies and confirms immediately
before executing; branch name per orchestrator)

    git checkout dev/iteration4 && git status --short        # verify clean
    git checkout -b <next-branch>                            # cut at the close commit
    git checkout dev/iteration4                              # return

Then the next-iteration charter typeset per its own splice plan. Never push.

## Appendix — log-header convention (unchanged, restated)

Every run log persisted at close carries a provenance header (time, substrate, app id,
invoker); mid-iteration logs without headers are acceptable only pre-close and must be
headered or superseded before STEP 2 (C2 debt-k frozen-history class is NOT available
to Iteration-4 logs — the discipline now predates them).
