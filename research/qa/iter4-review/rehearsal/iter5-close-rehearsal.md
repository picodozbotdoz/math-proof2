# ITER-5 CLOSE REHEARSAL — the 13-item checklist walkthrough + blocker-map refresh (lane R2, 2026-11-20; REHEARSAL ONLY)

Purpose: **when the fold-once trio (R6 salvo / R5 eta pair / R8 M3) drains, the
close act is fully mechanical.** This is the walkthrough of the 13-item close-block
checklist against the CURRENT tree, with the dry-run blocker map refreshed to
discharged/parameterized states. Precedent: the iter-4 rehearsal pack in this
directory (`apply_rehearsal.py` — the anchor-asserted staged-copy rehearsal; the
PENDING-token convention below is its direct descendant). Basis bytes: main
`c31c89a` (batches T–X) + R2 worktree agent-03 in-flight deltas (the L3 print-level
re-base: stop-note `db872dc5`, L3-record `b846290e`, REPORT-INPUTS-ITER5
`09c3bcab` — batch-Y pull pending). Instruments: skeleton `883aad67` (13 items),
dry-run v2 `14ee0643` (BLOCKERS 1–7 + addenda), gates `df2e93c2`, stamps-prep
`f4307714`, ledger `stepA-incremental-iter5.log` (ENTRY 13 + ENTRY 13 CORRECTION).
**Nothing executed, nothing fired herein.**

## A. Blocker-map refresh (dry-run v2 BLOCKERS 1–7 → state @ `c31c89a`)

| # | blocker (dry-run v2) | current state | disposition |
|---|---|---|---|
| 1 | R6 salvo verdicts (P2-b run 31 @ `396d8710`; P2-c confirm @ `da4c8d3f`; P3-d) | re-fired, verdicts PENDING | **PARAMETERIZED** (§C-R6) |
| 2 | R5 eta-pair verdict (`eta-r2` `38bb8463` + `eta-r3` `ed0c0612`, worktree-held) | re-fired, verdicts PENDING | **PARAMETERIZED** (§C-R5) |
| 3 | R8 M3 verdict (A2 post-state; main at M2-closed `61af175a`) | re-fired, verdict PENDING | **PARAMETERIZED** (§C-R8) |
| 4 | Landed-but-unfolded R1 folds (41H-T2 / M2-closure / P2-c-final-park) | **DISCHARGED** — ENTRY 13 (the consolidated closing fold @ `a175b1d`: H1 `283503ad` + H2 `3bc81701` + A2 `61af175a` + T3 `aed63101` + P2 final park, five byte states, all 0 REAL-TOKEN, certificate **52+0**) + ENTRY 13 CORRECTION (the L3 narrative re-based print-level) | closed |
| 5 | TARGETS rows owed (M-arc + 41H/H2) | **DISCHARGED** — batch W: `make_axcheck.py` @ `12c05683`, 55 active rows, guards bound (`7addcf00` / `3bc81701`) | closed |
| 6 | G7(a) stamp debts (3 consumed-unstamped families) | **PRE-STAGED, READY-TO-FLIP** — `iter5-g7-stamps-prep.md` `f4307714` on main (7 paste-ready blocks, byte-verified anchors, exclusions documented; the .diff carries the census-exclusion recommendation) | H flips at close |
| 7 | G3/G8 + the G6 §3 fill | **INPUTS LANDED**: G6's ruling input = R9's quota-disposition draft `ddec4089` ([QUOTA-STATE]=UNSPENT / [QUOTA-OUTCOME]=third consecutive unspent recommended); the stock-cell refresh list pre-staged (dry-run addendum: 3 cells 7/15→8/16, refs R7 §A15); G3 = H's close-commit INDEX act by design; G8 fills with the block | close act |

**New/derivative items since the dry-run:** (i) the L3 print-level re-base (the
three R2 files above) — REQUIRED to land (batch-Y) before the close block's
carried-L3 basis; it is also THE Iteration-6 charter input for the
[SCOPE-PARAMETERIZED] census slot per the orchestrator's re-charter ruling
(L3 PARKED for Iter-6, no fire this wave). (ii) `make_axcheck.py` :83 — the
AxPilot72_M1_T3 row comment still carries the retracted triad claims AND the stale
guard `dcda3133` (main T3 bytes = `aed63101`); **R1's fold owes the re-bind +
claim correction** (ENTRY 13 CORRECTION covers R1's own funnel; only this row
remains — flagged, not edited by R2). (iii) 41H article sha moved at batch U
(R7's four wording-class micro-edits dispositioned in-commit): current
`cb4d4fae16bbb6b1`; the close-time G5 drift-scan cites THIS sha (ship anchor
`cc71841` commit-stable).

## B. The 13-item checklist walkthrough (skeleton `883aad67`; execution-ready states)

| # | fill | input state @ today | ready? |
|---|---|---|---|
| 1 | `[DATE-CLOSED]` / `[CLOSE-COMMIT]` | the close commit itself (the commit IS the date) | **READY** |
| 2 | `[N-TABLES-11]` / `[TALLIES-*]` | `tally_section10.py` over R1's §11 — the corrected L3 block is in; the FINAL roll-up lands with R1's post-drain fold (rows parameterized on §C) | machinery READY; rows §C |
| 3 | `[WHOLE-TREE-CENSUS]` / `[MACHINE-PART]` / `[MANUAL-PART]` / `[RESIDUAL-NOTE]` / `[DONOR-ROWS]` | R1's §11 census roll-up; basis CORRECTED print-level (clean set smaller: L3b+eig+edgeBoundary+T1/T2/L3a; the four contested decls re-derivation class) | machinery READY; final basis §C |
| 4 | `[STEPA-COUNT]` | certificate **52+0** stands through ENTRY 13 + correction (dry-run G1 re-confirmed 52 exact @ `a6ad33d`); the sweep-time entry appends the drained landings' declarations | **READY** |
| 5 | `[STEPB-*]` | `run_axcheck.sh` + `make_axcheck.py` @ `12c05683` (55 rows; class map current: donor-pin 77_T1 verdict-of-record `t1t2-run11.log`; [WARM] 77_T2/41_Core/74_P2@`531a9eb7`/MArc/41_H2; GIT_BYTES override N2P1 `ce6719c8`@`ff8b99e`) | machinery READY; 2 guards ride §C (AL3D_A2@M3, N2P1@R6) + the :83 re-bind owed (R1) |
| 6 | `[41H-STATE-SENTENCE]` / `[N2-STATE-SENTENCE]` / `[P3-COMPLETE-STATE]` | 41H = KNOWN-SHIPPED (fill the shipped sentence: splice-2 `cc71841`, post-edit sha `cb4d4fae`, second-discovery NEGATIVE-kind quota-free; the prep-default "tranche-2 active" is superseded); N2/P3 = §C-R6 | 41H READY; N2/P3 §C |
| 7 | `[QUOTA-STATE]` / `[QUOTA-OUTCOME]` | **INPUT LANDED** — R9's quota-disposition draft (`qa/iter4-review/r9-quota-disposition-draft.md` `ddec4089`): UNSPENT / third consecutive unspent cycle recommended; both shipments quota-free on the bytes; FB never chartered/executed | **READY** (orchestrator confirms) |
| 8 | `[KPI-SENTENCE]` / `[STOCK-COUNT]` | refresh list PRE-STAGED (dry-run addendum; 3 cells: gates-G6 basis :119, REPORT-INPUTS §3 :62–63, skeleton fill-note-8 :112 → flow 2/2 + stock 8/16 = 50%); R7 §A15 refs consistent | **READY** |
| 9 | `[SALVO-2-SET]` | mostly KNOWN: the re-based L3 remainder (re-derivation class; `db872dc5` = THE charter input, [SCOPE-PARAMETERIZED] resolves on it; R9 finalizing census v2); the n≥4 TL hunt (H-record scope note; H3 battery `87659f58`); η rung ladder (amended band `ca2470c2`); salvo re-parks; 12-P0 (drain rule); 74-T3 OPEN-GATED; debts f/h/l; stale wrappers; + R9's iter6-seed-census `e202244b` (3 Tier-1 + 2 Tier-2 + 2 Tier-3, charter-ready) | READY; member flips §C |
| 10 | `[CENSUS-SENTENCE]` | G7 machinery READY: stamps `f4307714`; annotation census baseline 1 (dry-run); the EVENT-STANDBY queue drain = §C | machinery READY; drain §C |
| 11 | `[I5-SPLICE-STATE]` | paste-delta = REPORT-INPUTS §4; REFRESH §1/§2/§3 first — the 72-M1 row's print-level correction bracket already rides the worktree copy (`09c3bcab`, batch-Y); wave-close fold per the leaning | **READY** (post-pull) |
| 12 | `[ANY-LATER-RULINGS]` / `[ANY-LATER-CARRIES]` / `[CLOSE-ACT-NOTE]` | compile-from-batch-record: bank-as-negative (`c25bf25`), (H) promotion (`4ef1bad`), pin-stays, BkClass-nonneg adjudication, completion-grant pattern + the NEW ones — the L3 print-level correction + re-charter ruling (L3 PARKED iter-6; `db872dc5` the charter input), quota-disposition (`ddec4089`), WeakPNT-AP watch tick (batch V), liu-bnew OWED-and-DELIVERED (batch U) | **READY** (H compiles) |
| 13 | `[P2-C AUDIT-TAIL]` | R3's prestage **GO 10/11** (`pilots/74/item13-prestage.md` `1294a667`): staged `6c6a251f` = final park `531a9eb7` + exactly the 2-hunk namespace move, zero math; fire = `bash research/pilots/74/stage_and_fire_p2.sh 20` (dry-verified doz-CLI/SPEC 2cpu/4GB/threads-2/telemetry/log-rescue); item 11 = the close-signal HOLD by design | **READY** (first close-act step) |

## C. The parameterized verdict slots (the trio — fill these and the act is mechanical)

**R6 — the salvo.** (a) P2-b run 31 on parked `396d8710d9084388` (expected 17/17):
GREEN → the N2P1 GIT_BYTES override moves/drops per its tracked rule + an §11 row;
NOT-GREEN → honest-partial row + SALVO re-park member. (b) P2-c confirmation on
parked `da4c8d3fed30daac` (expected 11/11): GREEN → the parked-pillar class closes
(guard re-bind `531a9eb7`-family unaffected — main bytes govern); NOT-GREEN → the
audit-pending note stands (item 13's fire still GO — its class is
verification-machinery, independent). (c) P3-d (V2 substrate + `ZetaColumnOfV2Q`
discharge; runner pair `run_n2p3v2.{sh,py}` staged): either-GREEN → the composed
`zetaL_rat_two_thirds_landed` lands → the N2-P3 TARGETS row enters at its GREEN +
skeleton-6 `[N2-STATE]`/`[P3-COMPLETE-STATE]` fill + R9's ship template rides (any
article-75 v2 upgrade = the watchlist surface, a revision not a new ship); the
iter-6 seed "N2/P3-d pre-certified" flips to landed-carried. All three: ENTRY
declarations append (G1 final cert), §11 rows, G7 queue drain.

**R5 — the eta pair.** `eta-r2` `38bb8463fe7af1bc` (expected strict-OK 4/4 →
rung-2 exit) + `eta-r3` `ed0c061218a2d739` (expected 2/2): GREEN → the rung rows
land (LAYERS class — verdict of record = the on-pin run logs, NOT TARGETS stages;
the zzv2-P1 precedent) + ENTRY additions + the η SALVO member updates to the next
rung; NOT-GREEN → honest rows + carried with fixes. The public-layer re-census +
R5/R6 rungs stay next-wave regardless (the amended band).

**R8 — M3.** A2 M3 post-state (entropy identification +
`SlabAreaLawColumnCuts3D` discharge; ≤3 runs): GREEN → the AL3D_A2 guard moves to
the M3-closed bytes + the ladder-final §11 rows + the `set_option linter.all
false` diagnostic LIFTS (in-file cleanup rides the landing) + the iter-6 AL-M3
seed flips to landed; NOT-GREEN → honest row + the seed stands. 

**Shared:** each verdict's landing appends its G1 ENTRY declaration BEFORE the
sweep-time certificate; the G7 census's EVENT-STANDBY queue empties only when all
six slots (R6×3 + R5×2 + R8×1) are folded or declared-dropped.

## D. The close-act sequence (mechanical once §C drains; SESSION END (h)5 order)

1. **Drain check** — the six §C slots folded (or declared-drop rulings recorded).
2. **Item-13 fire** (R3): `bash research/pilots/74/stage_and_fire_p2.sh 20`; log →
   `pilots/74/logs/` with provenance; the audit-pending note releases.
3. **Gates G1–G8** execute on the exact closing tree (`iter5-closeout-gates.md` @
   `df2e93c2`); §G8 persistence table fills.
4. **§I5 splice** — REPORT-INPUTS §4 (refreshed §1/§2/§3 post-pull) → REPORT.md.
5. **Skeleton fill** — the 13 items above, mechanical per B.
6. **H's close commit** — close block + §G8 + the 3 stock-cell refreshes (item-8
   list) + the 7 stamp flips (`f4307714`) + INDEX row + the [SALVO-2-SET] carry.

**GO/NO-GO summary:** the close act is mechanical NOW for items 1, 4, 6-41H, 7, 8,
11, 12, 13 and both G7 censuses; parameterized BY DESIGN on the §C trio (items 2,
3, 5-two-guards, 6-N2/P3, 9-members, 10-drain); owed pre-pull: the L3 re-base
batch-Y (items 3-basis, 9, 12) and R1's :83 row re-bind (item 5). No other open
dependencies.

— rehearsal by lane R2 (close-support), 2026-11-20, main read @ `c31c89a`, worktree
agent-03. REHEARSAL ONLY: no gate executed, nothing fired, no ledger/instrument
writes. H pulls at convenience; no commit (lanes never commit).
