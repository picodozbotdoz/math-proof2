# TALLY §11 — MANUAL PROCEDURE + PRE-STAGED WORKING TALLY (lane R1, 2026-11-20; the close-block's `[N-TABLES-11]`/`[TALLIES-*]` source)

**ROUTE CALL: MANUAL (documented here), NOT a `tally_section10.py` §11 mode.** Reasons,
recorded per the pre-stage task:

1. **Grammar mismatch is structural, not cosmetic.** The §10 tool keys on `### 10.N`
   subsection HEADINGS written to a strict verdict grammar ("LANDED GREEN" /
   "NOT-GREEN" / "PARTIAL GREEN" / "M1 CHECKPOINT"). §11's verdicts live in table
   VERDICT CELLS and bolded block headers with a wider vocabulary (GREEN-triad /
   CLOSED GREEN / GREEN PROBE COMPLETE / honest-partial / honest-partial-FINAL /
   NOT-GREEN / elaboration-COMPLETE — NOT-GREEN / SKELETON / PARKED), across three
   `### 11.N` headers plus free-standing bolded blocks.
2. **Supersession semantics.** §11 records CONVERSION CHAINS (unit-8 honest-partial →
   unit-9 CLOSED; ENTRY-12 parked → final-park; v13 row → v16 corrected block). A
   parser cannot know which row of a chain is current without a supersession rule —
   exactly the heuristic that silently miscounts at close-time. The §10 tool never
   faced this (its subsections were one-per-lifecycle-stage by construction).
3. **N is small and fully owned.** ~20 rows at close, every one an R1 fold with a
   known verdict and byte-verified provenance; a manual tally re-derived from the
   rows of record is auditable and fails visibly; a retrofit parser's failure mode is
   a silent miss (the class this lane exists to guard against).
4. The §10 tool stays UNTOUCHED for §10 (closed history — its geometry guarantee is
   load-bearing there; extending it risks the closed parse).

## PROCEDURE (the close-time execution — R1 runs, H cites)

1. **Enumerate rows of record** in `r3-verification-tables.md` §11 from the fold
   blocks ONLY (bolded block headers + the three `### 11.N` tables), never from
   prose mentions. One row per PILOT FILE at its CURRENT guard sha.
2. **Resolve conversion chains to their terminal state** (the block that declares
   "CONVERTS"/"supersedes" wins; the predecessor stays visible as history and is NOT
   counted twice). Double-count guard: 74-P2 counts ONCE (final park `531a9eb7` class
   until item 13 fires, then its GREEN/otherwise state); A2.lean counts ONCE at
   `61af175a`; L3 counts ONCE at the corrected v16 block.
3. **Classify per D7** into exactly: GREEN-triad / honest-partial / NOT-GREEN-honest.
   SKELETON/PARKED-unfired rows (N2-P2c before the salvo) are NOT-GREEN-honest class
   with a parked note (the D7 vocabulary has no fourth class; the note carries the
   state). Probe/statement rows (§11.1's rungs) are counted in N-TABLES with their
   billing note but NEVER as proof-surface rows (§10.CENSUS (d) convention).
4. **Cross-check the sum** = N (every enumerated row classified exactly once; any
   remainder = a missed block — STOP and find it, never force-classify).
5. **Emit** the three `[TALLIES-*]` numbers + `[N-TABLES-11]` into the close-block
   instruments (skeleton items 2), citing this file + the §11 fold blocks.

## WORKING TALLY — CURRENT STATE (2026-11-20, main @ `37cb520`; refresh per landing)

Rows of record and their D7 classes as of this pre-stage (chains resolved):

| # | row of record (§11 block) | pilot file @ guard | class | note |
|---|---|---|---|---|
| 1 | 11.1 M-arc (R3) | `10/M-arc.lean` @ 7addcf00 | GREEN-triad | plumbing billing, never novelty |
| 2 | 11.1 41-P0 (R4) | `41/P0.lean` @ b177acdb | GREEN-triad (probe class) | statement rung; supersession pointers post-Core |
| 3 | 11.1 AL M0-rebuild (R8) | — CHAIN: superseded by the M0→M2 rows | — (history) | counted once at row 12 |
| 4 | 11.1 eta-pin-probe (R5) | `zzv2-lam/eta-pin-probe.lean` @ cadc838d | GREEN-triad (probe class) | donor-tree; Step-A only |
| 5 | 11.1 Liu-B_new (R7) | `liu-bnew/P0.lean` @ 20ac6671 | GREEN-triad (probe class) | statement-layer citation class |
| 6 | 11.2 N2-P2-a (R6) | `75/N2-P1.lean` @ ce6719c8 | GREEN-triad | CLOSED run 26 |
| 7 | 11.2 N2-P3 skeleton — CHAIN: superseded by the three-theorem GREEN row | — | — (history) | counted once at row 14 |
| 8 | 77 follow-up completion (R7) | `77/T1.lean` + `T2.lean` | GREEN-triad | 8/8 + 8/8; the iter-4 residual discharged |
| 9 | 41-CORE (R4) | `41/Core.lean` @ 733b4a2d | GREEN-triad | 4 refutations ⊆ + 26 corrected |
| 10 | 74-P2 G2+G3 (R3) — CHAIN: extended by rows 15/16 | `74/P2.lean` | — (history at 49b808f3) | counted once at row 16 |
| 11 | AL-M1 + M2-a — CHAINS: superseded by the M2-closure rows | `al3d/A2.lean` | — (history) | counted once at row 12 |
| 12 | AL M2-b CLOSURE + M2-c KEYSTONE (R8) | `al3d/A2.lean` @ 61af175a | GREEN-triad | 89/89 triad; M0→M2 ladder |
| 13 | 72-M1 L3 — v16 CORRECTED block (R2) | `72-M1/P72M1T3.lean` @ aed63101 | honest-partial | the certified clean set = 3 + T1/T2/L3a; 4 contaminated named |
| 14 | N2-P3 three-theorem GREEN (R6) | `75/N2-P3.lean` @ f9bd28c5 | GREEN-triad | P3-complete [PENDING the salvo fold — class may move] |
| 15 | eta-rung-1 GREEN EXIT (R5) | `zzv2-lam/eta-r1.lean` @ 5b04304a | GREEN-triad | donor-tree class |
| 16 | 74-P2-c FINAL PARK (R3) | `74/P2.lean` @ 531a9eb7 | honest-partial | elaboration-COMPLETE, triad PENDING item 13 |
| 17 | 41-H tranches 1+2 (R4) | `41/H1.lean` + `H2.lean` | GREEN-triad | BANK-AS-NEGATIVE; article SHIPPED cc71841 |
| 18 | N2-P2c parked (R6) — **CONVERTED 2026-11-20 (R1 unit 16): P2-c GREEN 11/11 @ `2cca447d` (runs 4–8)** | `75/N2-P2c.lean` @ 2cca447d | GREEN-triad | `thmE_dyadic_to_cumulative` closes; the hUnb binder named-honest |
| 19 | eta-r2/r3 pair — [PENDING R5's re-fire] | `eta-r{2,3}.lean` @ 38bb8463/ed0c0612 | NOT-GREEN-honest (parked-unfired) | fold-once at the confirmation |
| 20 | 41-H3 S-rung (R4, added 2026-11-20 — postdates the live-events list; worktree-of-record, main-side at H's landing) | `41/H3.lean` @ 833dcff8 | GREEN-triad | 11/11 printed; 16-helper custody gap at sweep |
| 21 | 75-N2 P3-d/e — P3-COMPLETE (R6, added 2026-11-20, R1 unit 16; worktree-of-record, main-side at H's landing) | `75/N2-P3V2.lean` @ 2613cfd2 (donor-tree, cited) + `75/N2-P3e.lean` @ 6f6beb20 (plain, 2/2) | GREEN-triad | the composed N2-d card `zetaL_two_thirds_landed_of_DZDF` + the ℚ endpoint; iter-6 seed #1 CLOSED; rows 6/14 extended (P2-b 17/17 @ 396d8710; N2-P3 gap DISCHARGED) |

**CURRENT COUNT (refreshed 2026-11-20, R1 unit 16 — the SLOT-1 salvo folds; step 4's
sum check applied):** GREEN-triad = rows 1, 2, 4, 5, 6, 8, 9, 12, 14, 15, 17, 20, 18,
21 = **14**; honest-partial = rows 13, 16 = **2**; NOT-GREEN-honest (parked-unfired) =
row 19 = **1**; total classified 14+2+1 = **17 ✓** (+4 chain-history rows excluded by
step 2: rows 3, 7, 10, 11). At close: refresh row 19 (R5's pair) to its landing
verdict; item 13's audit fire may move row 16; the sum check must then close again.

— pre-staged lane R1 (verification-integrity), 2026-11-20, worktree agent-02. The
`[TALLIES-*]` numbers H cites at close come from the refreshed run of THIS procedure
(step 5), never from this frozen working state.
