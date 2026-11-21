# ITER-6 CLOSE-BLOCK SKELETON (lane R7, close-prep, 2026-11-21; PREP ONLY — NO EXECUTION)

Successor of `qa/iter5-close-block-skeleton.md` (CONSUMED 2026-11-20) + the executed
`qa/iter5-closeout-gates.md` lineage. Every slot is marked **[PENDING-INPUT]** unless the
fact is fixed at prep (landed shas through main `9cadcbe`). H fills brackets mechanically
at the close commit, never re-derives; facts fixed here are byte-cited. Iteration-6
close-out protocol = the adopted five-rule set (scoped final gates, gate-run persistence,
INDEX reconciliation as a gate, date discipline, staging supersession stamps), executed
per §Iteration 6 "Close-out" line (`RESEARCH.md`).

## 0. The close instrument set (what exists, what is owed)

| instrument | state at prep (2026-11-21, main `9cadcbe`) |
|---|---|
| this skeleton | PREP-ONLY (stamps CONSUMED at close) |
| gates file (`qa/iter6-closeout-gates.md`, the R2 lineage) | **[PENDING-INPUT — not minted; R2 is the gates-owner lineage. Until minted, the G1–G8 slot list below is the working table]** |
| REPORT-INPUTS-ITER6 §4 paste-ready §I6 delta | **[PENDING-INPUT — not opened; the §I6 splice targets live in §5 below]** |
| Step-A ENTRY ledger | `stepA-incremental-iter5.log` (ENTRY 14 = the iter-5 close certificate 66 = 52 − 3 + 17). **[PENDING-INPUT: R1's iter-6 continuation — extend the -iter5 log or open `stepA-incremental-iter6.log`; the sweep-plan companion `FINAL-SWEEP-PLAN-ITER6.md` likewise]** |
| close rehearsal | **[PENDING-INPUT — optional; the iter-5 precedent `rehearsal/iter5-close-rehearsal.md`]** |
| quota disposition | LANDED: `qa/iter4-review/r2-iter6-quota-disposition.md` `356cff31` (§1 facts byte-verified at `ef1e7bd`; must be re-current at close — its own §ruling-request) |

## 1. Gates G1–G8 — slot list with THIS iteration's consumption

- **G1 — sorry-token (Step-A certificate).** Basis: 66 = 52 − 3 + 17 (iter-5 close, ENTRY
  14). Iter-6 declared-delta candidates the close certificate must account for:
  **[PENDING-INPUT]** — (a) the post-referee integrity sweep (R1; the `2bfe771` revision
  touched article `.md` only — the sorry-free `.lean` diff is the expected zero-delta
  class); (b) the 12-core fire family (`pilots/12/CORE.lean` `7e40dff4` core-runs 4–9 +
  the closing batch: the Choice.lean:60–244 rpow port + `route16_MMgeneral`, ≤5 fires);
  (c) the eta-r4 grant-fire-2 at `285a411e` (landed PRE-APPLIED-UNFIRED at `0df2546`;
  outcome **[PENDING-INPUT]**); (d) M3 run-9 (`alp2-m3-run9-variant1fire.log` `f3d6a0d2`;
  split verdict = PERMANENT PARK); (e) any seed-prep statement sets (R4's H3 seed-2 + R8's
  N2-completion/P3-d seed-1 — the staged-unfired statement-stub class, the +17 precedent)
  **[PENDING-INPUT]**. Note for the record: `pilots/41/presolve/` (custody settle
  `2ea25a9`) is numpy-only — outside the `.lean` classifier scope by construction.
- **G2 — axcheck full-coverage (two-part Step B).** Batch scope THIS iteration = the
  iter-6 fire set: **eta-r4 runs (`pilots/zzv2-lam/`) + the 12-core runs (`pilots/12/`) +
  M3 run-9 (`pilots/al3d/`) + any seed-prep probes**, over make_axcheck TARGETS
  (**58 rows at prep @ main; the count at close governs**). Class map updates
  **[PENDING-INPUT at close]**: `AxPilotAL3D_A2` guard MOVES to the run-9 permanent-park
  state (P0+A1 kernel-GREEN, A2 first-sight mechanical — the split-verdict honesty rides
  the row comment); `AxPilot75_N2P1` override re-bound day-1 (R1 `55f7b197`, trio ALL OK —
  the iter-5 close's ONE OVERRIDDEN carry is CLOSED; verify override==HEAD==verified still
  holds at close); donor-pin declared-FAIL classes stay (77_T1 tauceti, 42_M4b
  ZetaZerosV2; the 50/22 openai-pin G7b class); new full-coverage custody owed for every
  new GREEN landing (12-core CORE.lean set; M3's P0/A1 pair; eta-r4 on strict-OK).
  Part (ii) custody per-row; PASS per stage = `OK; axiom-lines=N, sorryAx-lines=0`,
  records ⊆ triad.
- **G3 — INDEX reconciliation.** Input = H's fresh drift list on the EXACT closing tree
  **[PENDING-INPUT]**. Known iter-6 growth classes to cover or group: `articles/
  introduction/` (17 companions + `_SPEC.md` + `README.md` registry; marker file deleted
  at `9cadcbe`), `qa/article-revisions-2026-11-21.md`, `pilots/41/presolve/`,
  `pilots/72-M1/L3-recharter.md`, `pilots/al3d/` run-9 set, `pilots/12/` fire family,
  `novelty/r9-novelty-verification-iter6-round2.md`,
  `candidates/fb2-followon-evaluation.md`, `qa/iter4-review/r2-iter6-quota-disposition.md`,
  the `qa/h-*-20261121.md` helper notes (INDEX-drift prep already on file at
  `qa/h-index-drift-20261121.md`), this skeleton. INDEX.md is H's file.
- **G4 — date discipline.** Runs at close-commit time by construction (tomorrow-literal
  scan EMPTY; compound ranges resolve; the gates-file self-cite whitelist class carried).
- **G5 — template compliance (per shipped article).** Shipped set THIS cycle: article-41H3
  (splice `e4ac8dd`; R2 eligibility `14c86d28`; §9/box-11 in-commit) — close-time check =
  drift-scan vs the shipped state, INCLUDING the `2ea25a9` custody-settle edits and the
  `2bfe771` referee revision (all 17 articles revised in place 2026-11-21 — the close-time
  G5 must confirm the revised surfaces still carry the template bones; R1's post-revision
  integrity sweep is the evidence base) **[PENDING-INPUT]**. Later ships to cover if they
  land: an FB-2 article under R-B; any seed-prep M-class article **[PENDING-INPUT]**.
- **G6 — two-strike ratio (KPI binding).** Arithmetic at prep: shipped set 17 article
  rows (README §A 9 + §B 7 + §C row 10); **discovery share 9/17 ≈ 52.9% — ABOVE the
  ≥half bar** (the 41H3 ship moved 8/16 → 9/17). Flow this cycle: 41H3 NEGATIVE-kind
  discovery-grade quota-free = 1/1 = 100% **[confirm at close]**; the 75-v3 revision is
  NOT-A-SHIP by D3 (revise-in-place, no count change). Contingencies (R2 disposition §1.4):
  FB-2 ship ⇒ 9/18 = 50.0% AT equality (margin consumed); a discovery-grade seed ship ⇒
  ≥10/18 headroom; a second unmatched non-discovery ship ⇒ 9/19 BELOW the bar. Stamps:
  **[QUOTA-STATE]** / **[QUOTA-OUTCOME]** per `r2-iter6-quota-disposition.md` §2 —
  **R-A (default)**: UNSPENT confirms, expected THIRD consecutive unspent cycle
  (iter-4/5/6), no quota arithmetic carries into Iteration 7; **R-B (override)**:
  SPEND-ON-FB-2 only, both conditions (b1) M-class evaluation resolved + non-breaking
  share arithmetic AND (b2) ≥2 drained-lane sessions (or accepted descope tier); never
  FB-4 this cycle. Fires only on explicit orchestrator ruling.
- **G7 — dangling annotations + staging supersession.** Stamping candidates at close
  **[PENDING-INPUT — re-derive from what actually landed, the ff-ez2 label-drift
  lesson]**: `a9-iter6-charter-typeset.md` + `a9-iter6-research-splice.diff` (CONSUMED at
  open `458dce3` — verify stamped), `r2-iter6-quota-disposition.md` (CONSUMED by the
  quota ruling), `candidates/fb2-followon-evaluation.md` (CONSUMED likewise),
  `pilots/72-M1/L3-recharter.md` (CONSUMED by R4's BANK verdict `460a04bc`),
  `r9-novelty-verification-iter6-round2.md` (RECORDED), this skeleton (CONSUMED).
  Annotation census over the iter-6-active files (quota/precharter/seed-prep/INPUTS
  surfaces + HELD-state markers: eta-r4 park, M3 permanent park, L3 PARKED D6) — every
  token CLOSED-by-cycle or retargeted with owner **[PENDING-INPUT]**.
- **G8 — gate-run persistence table.** Fills as G1–G7 execute; committed WITH the close
  block. OVERRIDDEN convention unchanged; no "passed by inspection".

## 2. INSTRUMENT A — RESEARCH.md §Iteration 6 close-out record (paragraph, appended at the section's end)

```markdown
**Close-out record ([DATE-CLOSED]).** Iteration 6 closed [DATE-CLOSED] (orchestrator;
close-completion commit [CLOSE-COMMIT]). Final pilot outcomes ([§12-BASIS] tables,
machine-computed, D7 vocabulary): [TALLIES-SENTENCE]; every landed row triad-only, 0
sorryAx; whole-tree [WHOLE-TREE-CENSUS] triad-clean decls ([CENSUS-PARTS]; [RESIDUAL-NOTE])
+ [DONOR-ROWS] donor rows triad at their donor pins. Sweep: Steps A–B executed at close —
Step-A certificate [STEPA-COUNT] exact ([STEPA-ENTRY]); Step-B [STEPB-RESULT] over the
iter-6 fire set (eta-r4 / 12-core / M3 run-9 / seed-prep probes; [STEPB-STAGES] stages,
0 sorryAx on OK stages). Gates G1–G8 executed on the exact closing tree ([GATES-FILE]
§G8, committed with this close block). **The 2026-11-21 external referee set was applied
in place mid-iteration (`2bfe771`: all 17 articles revised, README synced, the refute1
pair written, `qa/article-revisions-2026-11-21.md` the record; NO kernel-proved theorem
found false — prose-layer scope/retractions only), followed by the introduction
companions pass (17 stems + registry `9cadcbe`, post-review generation per the folded
policy line).** Discovery ledger: article-41H3 SHIPPED (splice `e4ac8dd`; NEGATIVE-kind
discovery-grade quota-free; the no-gos unconditional kernel + the pre-solve
CERTIFIED-NUMERIC never-in-proved-counts)[NEW-SHIPS-SENTENCE]. Quota cap-N = 1
**[QUOTA-STATE]** (D1 spend-only-if-executed; the FB-2 vs FB-4 vs unspent contest
**[QUOTA-OUTCOME]** — R-A/R-B per `r2-iter6-quota-disposition.md` §2). KPI: [KPI-SENTENCE
— basis 9/17 ≈ 52.9% + any close-time ship arithmetic]. Carried to Iteration 7 (owners
recorded): [CARRIED-SET]. Token/annotation census: [CENSUS-SENTENCE].
```

Fill notes: `[NEW-SHIPS-SENTENCE]` — from the seed-prep editorial gates (R7's item-3
standby: the discovery-grade case + template-kind fit per stem) and/or an R-B FB-2 ship;
empty sentence if none. `[CARRIED-SET]` prep-default members (H prunes/adds): the FB-2
contest if unexecuted (the disposition §2 structural finding — the iter-7 day-1-placement
option rides); L3 PARKED under D6 (the re-charter triggers T1–T4 named at `460a04bc`);
eta remaining rungs (on strict-OK; else the routes-(b)/(c) ledger); the 12-core remainder
(route16_MMgeneral et al. if unfinished); the H3.lean print-coverage rider (16 unprinted
helpers at the next H3.lean edit — binding, the `2ea25a9` custody settle); 72-M1 link 4 +
interface theorem; debts f/h/l; stale wrappers **[PENDING-INPUT each]**.

## 3. INSTRUMENT B — STATUS.md "Iteration 6 CLOSED" block

```markdown
## Iteration 6 CLOSED — [DATE-CLOSED]

Charter: `RESEARCH.md` § Iteration 6 (+ close-out record, same date). Session maps:
`RESUME-BRIEF-ITER6.md` (incl. the §SESSION END pause/resume record — the off-peak
reclaim + the plan-check rule); lane tracker `ORCHESTRATION-ITER6.md`. Close-completion
commit: [CLOSE-COMMIT] ([CLOSE-ACT-NOTE] — single-commit convention unless interrupted).

**Final pilot outcomes ([§12-BASIS]):** [TALLIES-SENTENCE]; whole-tree
[WHOLE-TREE-CENSUS] + [DONOR-ROWS] donor rows at their donor pins. Evidence:
`qa/iter4-review/r3-verification-tables.md` §12 (R1's iter-6 chapter, opened at the
41H3 ship; the fire folds landed there).

**Sweep:** Steps A–B: Step-A [STEPA-COUNT] exact; Step-B [STEPB-RESULT] over the iter-6
fire set. Ledger: `feasibility/VERIFICATION-LEDGER.md` [LEDGER-SECTION] + Step D.

**Gates G1–G8:** executed on the exact closing tree; persistence table =
[GATES-FILE] §G8 (committed with this close block). The §I6 REPORT splice:
[I6-SPLICE-STATE] (paste source [REPORT-INPUTS-ITER6 §4 or H-shepherded fill]).

**Articles:** article-41H3 SHIPPED (`e4ac8dd`; NEGATIVE-kind quota-free; ship gate R7 ✅
R2 ✅; README counts 8→9 discovery-grade; KPI cell 9/17 above-bar recorded at `e4ac8dd`)
[NEW-SHIPS-SENTENCE]. The 2026-11-21 referee revision set + the introduction companions
pass: recorded above and in `qa/article-revisions-2026-11-21.md` +
`articles/introduction/README.md`. Knowledge-level quota cap-N = 1 **[QUOTA-STATE]**.
KPI: [KPI-SENTENCE]. Token/annotation census: [CENSUS-SENTENCE]. Index:
`articles/README.md`.

**Rulings ledger (this iteration):** D1–D7 at open (`RESEARCH.md` §Iteration 6); the
41H3 custody settled option-a (`2ea25a9`: pre-solve generator/checker archived + re-run,
0 survivors / ~2.97×10⁸ systems); the M3 run-9 split verdict ⇒ PERMANENT PARK (P0+A1
kernel-GREEN, A2 mechanical-first-sight); the L3 re-charter verdict BANK (`460a04bc`,
triggers T1–T4 named); the 2026-11-21 external referee disposition (`2bfe771`; the
refute1 pair; VERIFICATION-LEDGER §12 carries the five dispositions); the introduction
post-review policy (marker folded into the registry `9cadcbe`); R9's post-referee
novelty verification 16/17 SURVIVED (article-72's entropy-absence line scoped in-commit,
`bbda51d`); the SESSION PAUSE + plan-check resume rule (user-ordered, 2026-11-21).
[ANY-LATER-RULINGS].

**Carried to Iteration 7 (owners recorded): [CARRIED-SET]** — prep-default members per
Instrument A's fill notes; [ANY-LATER-CARRIES].
```

## 4. §I6-analog splice targets (REPORT.md)

Target: `## Iteration 6 addendum (opened 2026-11-20; closed [DATE-CLOSED] — this
commit)` mirroring §I5.1–I5.7: I6.1 charter/session (D1–D7 + the pause/resume record);
I6.2 pilot outcomes (the fire-set roll-up: 12-core S-tranche milestone `259f383` +
closing batch, eta-r4 grant-fire-2, M3 run-9 split-park, seed-prep outcomes, the
75-v3 editorial arc, the H3 draft chain); I6.3 discovery ledger (41H3 + any new);
I6.4 engineering-billed; I6.5 rulings ledger (Instrument B's list verbatim-in-substance);
I6.6 KPI (G6's filled arithmetic + the R-A/R-B quota outcome); I6.7 verification/close
cross-references. Paste source **[PENDING-INPUT: REPORT-INPUTS-ITER6 §4 if R2 mints it;
else H-shepherded from this skeleton's instruments]**.

## 5. Fill checklist for H (mechanical; every item names its source)

1. `[DATE-CLOSED]` / `[CLOSE-COMMIT]` / `[CLOSE-ACT-NOTE]` — the close commit's actual
   date + sha ("this commit" convention); the commit IS the date.
2. `[§12-BASIS]` / `[TALLIES-SENTENCE]` — `tally_section10.py` over r3-tables §12
   (adapt the section arg; D7 vocabulary) **[PENDING-INPUT: R1's §12 closing state]**.
3. `[WHOLE-TREE-CENSUS]` / `[CENSUS-PARTS]` / `[RESIDUAL-NOTE]` / `[DONOR-ROWS]` — R1's
   §12 census roll-up (prep basis: 605 print-verified at the iter-5 close = 386-equiv +
   219 growth; iter-6 growth = the fire-set landings) **[PENDING-INPUT]**.
4. `[STEPA-COUNT]` / `[STEPA-ENTRY]` — the sweep-time Step-A entry **[PENDING-INPUT:
   the -iter5 log extended or the -iter6 log opened]**.
5. `[STEPB-*]` — the close-run logs (`axcheck-iter6-close-run1.log` naming precedent);
   donor-pin classes cite verdicts-of-record.
6. `[GATES-FILE]` — `qa/iter6-closeout-gates.md` if R2 mints it, else THIS file's §1
   table transposed into the close block **[PENDING-INPUT]**.
7. `[QUOTA-STATE]` / `[QUOTA-OUTCOME]` — the orchestrator's R-A/R-B stamp per
   `r2-iter6-quota-disposition.md` §2 (re-verify its §1.3 upstream facts if the close
   slips past ~2026-11-28 — the disposition's own rider).
8. `[KPI-SENTENCE]` / `[NEW-SHIPS-SENTENCE]` — G6's close-time arithmetic; the
   seed-prep/FB-2 ship outcomes.
9. `[CARRIED-SET]` / `[ANY-LATER-CARRIES]` — Instrument A's prep-defaults, pruned.
10. `[CENSUS-SENTENCE]` — the G7 annotation/stamp census result.
11. `[I6-SPLICE-STATE]` — the §I6 fold's commit + paste source.
12. `[ANY-LATER-RULINGS]` — the wave's final batches (any post-`9cadcbe` rulings).
13. **[SEED-PREP EDITORIAL GATES]** — R7's item-3 standby verdicts (discovery-grade
    case; DISCOVERY vs DISCOVERY-CONDITIONAL kind fit; nearest-miss rows article-grade)
    feed `[NEW-SHIPS-SENTENCE]` and the I6.3 ledger — relay-gated, **[PENDING-INPUT]**.

— drafted by lane R7 (worktree agent-10, branch `carry-20261121-agent-10`), 2026-11-21,
main @ `9cadcbe`. PREP ONLY; no gate or instrument executed herein; no commits (H lands).
