# Iteration-6 close-commit staging checklist (REPORT ONLY — 2026-11-21)

Author: the general helper lane (worktree agent-01). Refresh point: main @ `e61201b`
(12:36:28 +08). Template = the executed iter-5 close `6306dbe` (21 files, single
commit) + the §D choreography (gates G1–G8 → §I-splice → Instruments A+B → close
commit; the wrap commit follows separately). Nothing here is executed.

## A. The two-act shape (iter-5 precedent, expect same)

1. **THE CLOSE COMMIT (single)** — gates + splice + Instruments A+B + riding folds +
   close INDEX rows.
2. **THE WRAP COMMIT** — `ORCHESTRATION-ITER6.md` freeze header, `ORCHESTRATION-ITER7.md`
   opened, `RESUME-BRIEF-ITER7.md` written, `h-wave4-log.md` wrap entry. (At iter-5:
   close `6306dbe` → wrap "Iteration 5 frozen, Iteration 6 opened" immediately after.)

## B. File enumeration — close commit (iter-5 counterpart → iter-6 file; shas @ e61201b)

| # | File (iter-6) | Iter-5 counterpart | sha16 @ e61201b | Written by | Notes |
|---|---|---|---|---|---|
| 1 | `research/REPORT.md` | +124 §I5 splice | `ca8e79dc568b9cdd` | H (paste from REPORT-INPUTS-ITER6 §4) | §I6 delta; anchor-verified at iter-5 (`ebaa3df9` precedent) |
| 2 | `research/RESEARCH.md` | +47 close-out record | `d9d1b7e275cb433a` | H (Instrument A paste) | appended at §Iteration 6 end; quota stamps land here (see E) |
| 3 | `research/STATUS.md` | +63 CLOSED block | `70e837e3d719491c` | H (Instrument B paste) | census computed from rows of record |
| 4 | `research/INDEX.md` | +2 close rows | `a9a6dbfd3cfe879f` | H | final reconciliation row + any still-unrowed close-prep files |
| 5 | `research/qa/iter4-review/r3-verification-tables.md` | +20 §11→§12 | `148b8080c30400c5` | R1 folds, H lands | §12 final tallies + whole-tree census rows |
| 6 | `research/feasibility/VERIFICATION-LEDGER.md` | +2 | `cbf84118065e139d` | verification lane | §-tail close updates |
| 7 | `research/feasibility/probe/make_axcheck.py` | TARGETS refresh | `206b0840eb3f9d21` | R1 | final TARGETS for the G2 batch |
| 8 | `research/feasibility/probe/logs/stepA-incremental-iter6.log` | stepA-incremental-iter5.log | — NEW | R1 fires; H lands | G1 classifier evidence |
| 9 | `research/feasibility/probe/logs/axcheck-iter6-close-run1.log` | axcheck-iter5-close-run1.log (3,804 ln) | — NEW | R1 fires; H lands | G2 Step-B transcript w/ provenance header |
| 10 | `research/qa/REPORT-INPUTS-ITER6.md` | REPORT-INPUTS-ITER5.md (§4 paste-ready) | — **DOES NOT EXIST — R6 OWES** | R6 | the §I6 delta + close inputs; feeds #1 |
| 11 | `research/qa/iter6-close-block-skeleton.md` | iter5-close-block-skeleton.md (R2 close-prep) | — **DOES NOT EXIST — R7 OWES (per the re-task)** | R7 | all [PLACEHOLDER]s named; quota-stamp host (see E) |
| 12 | `research/qa/iter6-closeout-gates.md` (+ optional `-dryrun`) | iter5-closeout-gates{,-dryrun}.md (R2 PREP-ONLY lineage) | — DOES NOT EXIST | R2-precedent owner, H assigns | pre-staged G1–G8 command table; §G8 committed in-block |
| 13 | arc-record stamps (iter-6 charter/typeset/queue/splice-package/watchlist family) | a6/a7/a9 files +3/+4 each | per-file at close | H | "CONSUMED @ close" stamps, iter-5 pattern |
| 14 | `research/qa/iter4-review/h-wave4-log.md` | +26 close-act entry | `1a240dc23360542c` | H | the iter-6 close act record |
| 15 | tally/manual census companion | tally-section11-manual.md | — successor TBD | R1 | §12-era tally if the convention repeats |

## C. File enumeration — wrap commit

| # | File | sha16 @ e61201b | Written by | Notes |
|---|---|---|---|---|
| 16 | `research/ORCHESTRATION-ITER6.md` | `5f560f2e7b10faae` | H | FROZEN header (CLOSED-at-<close-sha>) |
| 17 | `research/ORCHESTRATION-ITER7.md` | — NEW | H | the iter-7 lane map (from the orchestrator's spawn plan) |
| 18 | `research/RESUME-BRIEF-ITER7.md` | — NEW | H | §a close record / §b protocol verbatim / §c lane table / §d restart + any carry map |
| 19 | `research/qa/iter4-review/h-wave4-log.md` | (post-#14 sha) | H | wrap entry; standing-notes lineage continues |

## D. Dependency-ordered staging (what must exist BEFORE the close commit)

1. **R1 verification duty drains**: r3-tables §12 final tallies (#5) + Step-A/B runs
   (#8, #9) + make_axcheck final (#7) — these populate G1/G2 and the skeleton's
   census brackets. (Includes the whole-tree print-verified census + donor rows.)
2. **Pending verdicts resolve** (orchestrator): the 12-core M-class evaluation
   (quota-disposition §1.4 contingent co-consumer); the quota R-A/R-B test executes
   ONLY on explicit orchestrator ruling (disposition §2 pre-registration).
3. **R6 delivers** `REPORT-INPUTS-ITER6.md` (#10) — the §I6 paste-ready delta.
4. **R7 delivers** `iter6-close-block-skeleton.md` (#11) — Instruments A+B text with
   named brackets; quota-stamp slots per E.
5. **Gates doc** (#12) pre-staged + dryrun (R2-precedent owner).
6. **H's single close commit**, staging order (mechanical, top of index → evidence):
   new evidence logs first (#8, #9), then code/table folds (#5–#7, #13, #15), then
   the instruments pasted from the skeleton (#1–#3), then INDEX row (#4) + wave-log
   entry (#14) — exact-file staging, hardened gate each step; ghost Snapshot BEFORE
   `git add` (the ghost's writes are now NEW content, not idempotent mirrors — see the
   ghost note §7; the close batch touches no intro files, but the gate discipline
   stands).
7. **Wrap commit** (#16–#19) on the orchestrator's spawn plan for Iteration 7.

## E. The quota stamps' host file (per disposition §2)

`r2-iter6-quota-disposition.md` (`356cff317dcbb666`) is the citation-exact input for
the close-block items **[QUOTA-STATE] / [QUOTA-OUTCOME]** — at iter-5 these slots
lived in the **close-block skeleton's Instrument A paragraph** (spliced into
`RESEARCH.md`'s close-out record at the close commit; grep-verified: the stamps'
hosts at HEAD = INDEX.md, fb2-followon-evaluation.md, iter5-close-block-skeleton.md,
the disposition files, the iter-5 rehearsal). So: **host = #11's Instrument A text →
lands in #2 (RESEARCH.md §Iteration 6 close-out record)**. Expected fill per §2:
[QUOTA-STATE]=UNSPENT default / [QUOTA-OUTCOME]=THIRD consecutive unspent + the
structural finding (wave-tail placement biases unspent; the iter-7 charter decision —
day-1 vs opportunistic — per `r2-iter7-quota-structural-draft.md` `4955ac9167e04204`,
Option A recommended). Overrides only via the pre-registered R-B test on explicit
orchestrator ruling.

## F. Iteration-7 section skeleton inputs (feed #2's tail + the wrap)

- `research/novelty/iter7-seed-census-DRAFT.md` `422face28cde1d56` (R9, landed
  `c56c7aa`): bench 2 Tier-1 / 2 Tier-2 / 2 Tier-3 — the §Iteration 7 seed list.
- `research/qa/iter4-review/r2-iter7-quota-structural-draft.md` `4955ac9167e04204`
  (R2, landed `221ae37`): the quota placement decision the new charter must rule.
- `research/candidates/fb2-pntap-precharter.md` `eba7e9b2075bfb5a` +
  `fb2-followon-evaluation.md` `3f850a1dad799738`: the FB-2 contest materials (age
  well per the disposition — re-usable at a day-1 iter-7 decision).
- `research/qa/iter4-review/r2-watchtick-20261121.md` `59f6a021d95551ca`: the
  watch-tick pass state.

## G. Open flags for H

1. #10, #11, #12 do not exist yet — the close is NOT stageable until R6/R7/R2-precedent
   deliver; this checklist's re-task named R7 (skeleton) + R6 (report-inputs)
   explicitly.
2. The G2 Step-B batch (a Modal run, ~15 min at iter-5 scale) must be scheduled BEFORE
   the close commit, transcript rescued w/ provenance (the log-rescue lesson).
3. Post-close INDEX reconciliation: one final drift pass at the close gate (iter-5 G3
   precedent: 299→7); the close rows ride the same commit.
