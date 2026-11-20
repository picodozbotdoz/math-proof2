# ITER-5 CLOSE-OUT GATES — DRY-RUN against main @ `a6ad33d` (lane R2, 2026-11-20; EVALUATION-ONLY)

Scope discipline (the tasking verbatim): **no gate executed, nothing fired.** Every
command below that overlaps a gate form (the sorry-token classifier, the date greps,
the annotation census) was run **read-only as a dry-run assessment against the landed
bytes** — its outputs here are NOT the sweep-time certificate, NOT the §G8
persistence rows, and NOTHING was appended to `stepA-incremental-iter5.log` or any
other instrument. Formal execution remains exactly per `qa/iter5-closeout-gates.md`
(only on the orchestrator's close signal, on the exact closing tree). Read basis:
main `a6ad33d` (read-only); all shas = sha256(16) of the named bytes unless prefixed
by a commit sha. Fold-once pendings named per `RESUME-BRIEF-ITER5.md` §SESSION END
(g): **R6 salvo** (P2-b run 31 @ parked `396d8710` / P2-c confirm @ `da4c8d3f` /
P3-d), **R5 eta pair** (`eta-r2.lean` `38bb8463` + `eta-r3.lean` `ed0c0612`,
worktree-held), **R8 M3** (A2 post-state worktree-side; main holds the M2-closed
`61af175a`) — all re-fired, verdicts PENDING.

## Summary table (verdict if evaluated TODAY, 2026-11-20, main @ `a6ad33d`)

| gate | verdict today | one-line basis | gated-by (fold-once pendings) |
|---|---|---|---|
| G1 sorry-token | **PASS-today / formal BLOCKED** | dry-run classifier = **52 exact**, composition = the ENTRY-1 certificate (52+0 through ENTRY 12); zero tokens in any iter-5 file | R6+R5+R8 (any GREEN landing changes the tree → the certificate run must be the closing tree; each landing appends its ENTRY declaration) |
| G2 axcheck | **BLOCKED** | TARGETS incomplete for the closing set: rows OWED (M-arc single-anchor, 41H/H2, N2-P3@P3-complete) + 3 guard re-binds behind un-executed R1 folds | R6 (P3-complete row + N2P1 override disposition + P2c confirmation class), R5 (eta-confirm rung rows), R8 (AL3D_A2 final guard); + the 3 landed-but-unfolded folds |
| G3 INDEX | **BLOCKED-on-close (by design)** | H owns INDEX + executes on the exact closing tree; INDEX current through batch-S `3b12eb4`, late instruments covered 5/5 on spot-check | none directly (their landings merely join the closing tree) |
| G4 dates | **PASS-today** | dry-run greps: 0 future-date hits, 0 unresolved compound ranges (whitelist = the two gates files' self-cites) | none (runs at close-commit time by construction) |
| G5 template | **PASS-today (both shipped articles)** | 41 @ `cb87a67` §9 12/12 undrifted since splice; 41H @ `cc71841` (file `fcbcd812`) §9 12/12 in-commit incl. box-11 + R2's riders in-text | none — no pending item can ship an article (N2/η/M3 are engineering/technical-record class) |
| G6 two-strike | **PASS-frame / BLOCKED-on-mechanics** | cells FINAL: 2 shipped, both discovery-grade; flow 2/2; stock 8/16 = 50% (≥half PASSES at equality); quota N=1 UNSPENT | none for the ratio; blocked only on the close-time §3 fill + quota-ruling record (H/orchestrator, mechanical) |
| G7 stamps+annotations | **BLOCKED** | 3 consumed instruments UNSTAMPED (a6 draft family, a7-41 package, a7-41h package); EVENT-STANDBY queue = 3 verdict-pending + 3 landed-unfolded | R6+R5+R8 (queue must drain or take declared-drop rulings) + the 3 landed-but-unfolded folds |
| G8 persistence | **BLOCKED-by-construction** | empty by design; fills as G1–G7 execute; committed WITH the close block | inherits all of the above |

## Per-gate evidence trails (what the formal run would cite)

**G1 — sorry-token.** Evidence: `feasibility/probe/logs/stepA-incremental-iter5.log`
(ENTRY 1 = post-opening re-baseline @ `e309edd`, 52 over 110 files; ENTRIES 2–12 each
"certificate UNCHANGED 52+0"; last = ENTRY 12, P2.lean → `4425be89`, H batch-H).
Dry-run classifier (iter-4 gates §G1 :33–56 script, verbatim logic) over
`research/pilots/**/*.lean` + `research/feasibility/probe/**/*.lean` @ `a6ad33d`:
**52 REAL-TOKEN hits**, composition identical to the declared basis — 43 C2
carry-forward (ProbeB1 ×3 :51/:60/:67, B2 :26, C1 :14, D ×4 :57/:70/:78/:92,
G1 ×4, G2 :92, G3 :47, G4 ×4 :53/:94/:99/:281, G5a :59, G5b ×6, G5c ×4, G7 ×2
:37/:47, 71/P0 ×4 :65/:90/:97/:110, 73/P0 ×7 :40/:45/:53/:79/:87/:121/:143) +
3 `al3d/P0` :106/:144/:149 + 3 `lp/P0` :44/:55/:97 + 2 ProbeG9 :51/:67 + 1 ProbeG10
:96. Zero tokens in ANY iteration-5 artifact (41/{P0,Core,H2}, 74/P2, 75/N2-*, 77/*,
al3d/*, 10/M-arc, 72-M1, zzv2-lam/*, liu-bnew). If evaluated today: **PASS**. The
formal gate is BLOCKED-on: R6/R5/R8 verdicts — a GREEN R6 salvo moves N2 bytes
(N2-P1 past the parked override, N2-P3 growth at P3-d), a GREEN R5 pair LANDS
eta-r2/r3 (currently ABSENT from main — verified), a GREEN R8 M3 lands the A2
post-state; the certificate must then be the closing tree's count with the new
ENTRY declarations appended by R1 first.

**G2 — axcheck two-part Step B.** Evidence base:
`feasibility/probe/make_axcheck.py` @ `00236246` (last touched batch-J `1553998`;
**53 active TARGETS tuple rows** — note vs the gates file's "63 rows at `1d0927df`"
basis; the gates file's own rule "the count at close governs" applies, but R1 should
reconcile the counting method at fold time). Class-map facts verified on the tree:
77_T1 donor-pin (verdict of record `logs/t1t2-run11.log`); 77_T2 [WARM]; 41_Core
[WARM] no-override (on-disk `733b4a2d` = fired `921bc43c` + inert header — held);
74_P2 guard **stale in three layers** (gates text `49b808f3` → ENTRY 12
`4425be89` → batch-O final park **`531a9eb7` = bytes on main today**; the P2-c-close
fold owes the re-bind); AL3D_A2 guard stale (gates text `9706196c` @ batch-B →
**`61af175a` = M2-closed bytes on main**; M3's landing moves it again);
75_N2P1 GIT_BYTES override `ce6719c8` @ `ff8b99e` (drops iff HEAD==verified at
sweep — the R6 P2-b verdict decides); N2-P2c parked `da4c8d3f` on main (salvo item
b); N2-P3 `f9bd28c5` (row deferred to P3-complete = salvo item c); **rows OWED for
the closing set**: `AxPilot10_MArc` (single-anchor per §0; M-arc.lean @ `7addcf00`,
L5/`exists_tm_padded_space` content present — the embed condition checks out at
grep level), `AxPilot41_H2`-class row for `H2.lean` `3bc81701` (= fired `95343839` +
comment-only; landed batch-P `c25bf25`; NO TARGETS row exists — the on-landing duty
is R1's, riding the un-executed 41H-T2 fold), N2-P3's row at P3-complete. NEVER
Step-B classes re-confirmed: eta-pin-probe / liu-bnew P0 / 41 P0 statement rung;
eta-r1 = LAYERS class (verdict of record `eta-r1-run3.log`, ENTRY 11). Part (ii)
custody debts unchanged (74_P2 28 priv, 77_T1 40 + T2 4, AL3D_A2 1, N2P1 13 at
sweep-time shas; AxFC optional-confirm 41_Core). BLOCKED-on: R6/R5/R8 verdicts +
the three landed-but-unfolded R1 folds (41H-T2, M2-closure, P2-c-final-park).

**G3 — INDEX reconciliation.** INDEX.md last touched `3b12eb4` (batch-S); the late
instrument family (iter5-closeout-gates / iter5-close-block-skeleton /
REPORT-INPUTS-ITER5 / a7-41h-splice-package / r2-41h-s1s4-pass) indexed 5/5 on
spot-check; row-41H present (:352, batch-P). The gate is BLOCKED-on the exact
closing tree **by design** — H's fresh drift list + H's INDEX commit; this gate
names, H executes. No fold-once verdict gates it directly; the R6/R5/R8 landings
simply enlarge the closing tree the drift list must cover.

**G4 — date discipline.** Dry-run greps @ `a6ad33d`: future-literal scan
(tomorrow-and-later date literals, the §G4 pattern run with `date -d '+1 day'`)
over `research/` = **0 hits** outside the two gates files' self-cite whitelist
class; compound `YYYY-MM-DD/DD-MM` scan = **0 hits**. PASS if
evaluated today; the formal run is at close-commit time by construction. Gated-by:
nothing.

**G5 — template compliance (per shipped article).** Shipped set = **2**, both
verified on the landed bytes:
- **article-41** @ splice `cb87a67` (last-touch commit = the splice itself — no
  drift since): §9 box at :272, 12 PASS/SATISFIED rows incl. box-11 SATISFIED
  in-commit; the close-time re-check is a drift-scan vs this state (basis holds).
- **article-41H** @ splice-2 `cc71841`, file sha256(16) **`fcbcd812`** (last-touch
  = the splice commit): kind declaration :3 (NEGATIVE, discovery-grade,
  BANK-AS-NEGATIVE, quota-free); novelty/nearest-miss §4 :134 (6 base rows + the
  five N1 negative-class rows); formal record §6 :172; Limitations §7 :216; §9 :267
  **12/12 PASS/SATISFIED incl. row-11 README-same-commit SATISFIED** (:281) and
  row-8's register carrying the S3 lock "elementary certificates, nonelementary
  closure" (:278; also the in-text scope fence :236 "stay OPEN and UNCLAIMED", the
  n≥4 re-scope :41/:53/:132/:218 — R2's riders (i)–(iv) from
  `qa/iter4-review/r2-41h-s1s4-pass.md` @ `ace8bd28` all applied).
Ship-chain citations of record: battery §NEGATIVE `17970d4b` (FINAL v2), splice
package `ac7a5da7`, draft base `2923f188`, watchlist
`qa/iter4-review/a9-iter5-article-watchlist.md` @ `2408da6e` (the standing review
surface, consumed at close). PASS if evaluated today. Gated-by: NOTHING pending —
no member of the re-fired set can produce an article (75-N2/η/M3 are
engineering/technical-record class per the charter; an article-75 v2 upgrade would
be a revision of an existing row, not a new ship; the FB quota contest is
unexecuted and outside the re-fired set).

**G6 — two-strike ratio (KPI cells — byte-verified, see next section).** Basis:
`articles/README.md` :3–6 (counts line) + rows :24 (41) / :25 (41H);
`RESEARCH.md` :272–:285 (DECISION-1/3) + :296–:297 (the two-strike FINAL text).
Cells FINAL today: shipped set 2, flow 2/2 = 100% discovery-grade, stock 8/16 = 50%
(≥half bar passes at equality), quota N=1 UNSPENT. PASS-frame; the gate's close
form = §3 of `REPORT-INPUTS-ITER5.md` REFRESHED (its mid-wave state still reads
"1 shipped / 7/15" — the refresh + quota-ruling record + KPI line are mechanical
close acts). Gated-by: nothing pending.

**G7 — dangling annotations + staging stamps.**
(a) Stamps OWED today (grep `SUPERSEDED|SELECTED|APPLIED|EXECUTED|RECORDED|CONSUMED`):
`a6-iter5-charter-draft.md` — **unstamped** (its lone "APPLIED" hit :335 is the
N2-P0 hnp-erratum prose, NOT a staging stamp), consumed by the `e309edd` splice;
`a7-41-splice-package.md` — **unstamped**, consumed by `cb87a67`;
`a7-41h-splice-package.md` — **unstamped**, consumed by `cc71841`. Close-time
stampers (per the gate's own list): watchlist, the gates file (EXECUTED),
REPORT-INPUTS-ITER5 (CONSUMED by the REPORT fold), the skeleton.
(b) Annotation census dry-run: `TRIAGE-DECISION|A5-triage-pending|NOVELTY-CHECK-NEEDED`
over `qa/iter4-review/a6-iter5-*.md` + `novelty/round6-*.md` = **1 hit** (low
baseline). PLUS the fold-once EVENT-STANDBY queue, which today holds **3
verdict-pending** (R6 salvo ×3 items, R5 pair, R8 M3) **+ 3 landed-but-unfolded**
(41H-T2 @ H2 `3bc81701`/`h2-run11.log`; M2-closure @ A2 `61af175a`; P2-c-final-park
@ P2 `531a9eb7` — each needs its R1 fold or a declared-drop ruling). BLOCKED-on all
six.

**G8 — persistence table.** Empty by design; fills as G1–G7 execute on the closing
tree; committed WITH the close block. Inherits every blocker above.

## KPI sanity-check (the cells the close will report — verified against bytes, not memory)

1. **Discovery share 8/16 = exactly 50%; the ≥half bar PASSES at equality.**
   Numerator: README.md :3–6 enumerates the discovery-grade set — 01, 30, 32, 41,
   41H, 42, 75, 78 = **8** (75 conditional; 78 and 41H NEGATIVE-kind quota-free; 41
   DISCOVERY quota-free). Denominator: `research/articles/` contains 18 .md files =
   README + TEMPLATE-iter4 + **16 article files**; cross-check 8 (§A rows) + 7 (§B
   technical records) + 1 (§C item 10, "KEEPS article status") = 16 — consistent
   with the README's own "7 technical records" and "4 notes/certificates" (only
   item 10 of §C is an article). Bar text: `RESEARCH.md` §Iteration 5 quality gate
   (:296–:297) "≥ half of shipped articles discovery-grade" → 8/16 = 50% ≥ 50%
   **PASSES at equality**. Mid-wave stock was 7/15 ≈ 47% — the 41H splice moved
   both numerator and denominator by 1, exactly as the splice-2 commit message
   records.
2. **Quota N=1 UNSPENT.** DECISION-1 (`RESEARCH.md` :272–:274): "opens UNSPENT by
   default — spend-only-if-executed; the contest is FB-2 vs FB-4 vs unspent." No FB
   article file exists (articles/ has no FB-2/FB-4 row or file); both iter-5
   shipments are quota-free ON THE BYTES (README row 41 "quota-free"; row 41H
   "quota NOT consumed"; article-41H §9 row-1 + the BANK-AS-NEGATIVE ruling
   2026-11-19, the 78 precedent); `REPORT-INPUTS-ITER5.md` §1 FB row = UNCHARTERED
   (contest standing). UNSPENT confirmed.
3. **Two shipments this cycle: article-41 (DISCOVERY) + article-41H (NEGATIVE-kind).**
   README row 41: "first iteration-5 shipment — kind DISCOVERY per the orchestrator
   ruling 2026-11-19, quota-free" (splice `cb87a67`); README row 41H:
   "second-discovery of the 41 program, BANK-AS-NEGATIVE ruling 2026-11-19 … quota
   NOT consumed; own file" (splice-2 `cc71841`). Article bytes corroborate:
   article-41's §9 is the splice-day state with box-11 SATISFIED in-commit;
   article-41H's §9 names the ship chain (R7 draft + R9 §NEGATIVE + R2 S1–S4 4/4)
   and ships in-commit. Both last-touch commits are their splices (no post-splice
   drift). No third shipment is reachable from the pending set (see G5).

## BLOCKERS (each pending item × the gates it blocks)

1. **R6 salvo verdicts** (P2-b run 31 @ `396d8710` / P2-c confirm @ `da4c8d3f` /
   P3-d) — blocks **G1** (closing-tree certificate + ENTRY declarations), **G2**
   (N2P1 override drop/move; N2-P3 P3-complete row; P2c class), **G7** (queue
   drain). Owner R6/agent-06; re-fired, verdict pending.
2. **R5 eta-pair verdict** (`eta-r2` `38bb8463` + `eta-r3` `ed0c0612`, worktree-held,
   ABSENT from main — verified) — blocks **G1** (landing changes the tree), **G2**
   (eta-confirm rung-row class), **G7** (queue drain). Owner R5/agent-04.
3. **R8 M3 verdict** (A2 post-state worktree-side; main at M2-closed `61af175a`;
   the `set_option linter.all false` diagnostic lifts at M3 close) — blocks **G1**
   (landing changes A2), **G2** (AL3D_A2 final guard + ladder-final state), **G7**
   (queue drain). Owner R8/agent-05.
4. **Landed-but-unfolded R1 folds (no verdict pending — fold execution owed)**:
   41H-T2 (H2.lean `3bc81701` + `h2-run11.log` + H-record `f21b07f3`, batch-P),
   M2-closure (A2.lean `61af175a`, batch-Q), P2-c-final-park (P2.lean `531a9eb7`,
   batch-O; releases the ENTRY-12 guard `4425be89`) — block **G2** (guard re-binds +
   the H2 TARGETS row) and **G7** (EVENT-STANDBY). Owner R1/agent-02.
5. **TARGETS rows owed regardless of verdicts**: `AxPilot10_MArc` (M-arc @
   `7addcf00`, day-1 GREEN, single-anchor; L5-embed present) + the 41H/H2 row —
   block **G2(i)** completeness. Owner R1 (on-landing duties, FINAL-SWEEP-PLAN-ITER5
   §0).
6. **G7(a) stamp debts** (3 consumed-but-unstamped instruments: a6 draft family,
   a7-41 package, a7-41h package) — block **G7**; H stamps in the same commit as
   the consuming decision per the gate (the splice commits already landed — stamp
   at close or by ruling).
7. **G3/G8 + the G6 §3 fill** — blocked only on the close act itself (H's INDEX
   drift list + close commit; the REPORT-INPUTS §3 refresh + quota-ruling record).
   Not gated by any fold-once verdict.

## Numeric-consistency notes for R1's fold (non-blocking, flag-only)

- Gates file says "make_axcheck **63 rows** at `1d0927df`"; the file today (@
  `00236246`, unchanged since batch-J `1553998`) carries **53 active tuple rows**
  (`^\s+\("Ax` count; 0 commented-out). Counting-method delta — "the count at close
  governs" stands, but reconcile at fold time.
- Gates-file stale guard cells to refresh at execution (the file is PREP-ONLY; H
  edits on signal): 74_P2 `49b808f3` → `531a9eb7` (via ENTRY-12 `4425be89`);
  AL3D_A2 `9706196c` → `61af175a` → (M3 state at its verdict); the "five fold-once
  events (22d688b tracker)" list is now 3 verdict-pending + 3 landed-unfolded
  (L3-final was folded at ENTRY 10; P2-c-close was added at batch-O).

— dry-run by lane R2 (gates-owner), 2026-11-20, main read @ `a6ad33d`, worktree
agent-03 (base `e3d984b`). Evaluation-only: no gate executed, nothing fired, no
ledger/instrument writes. H pulls at convenience; no commit (lanes never commit).

## ADDENDUM 2026-11-20 (post-dry-run close-prep, same session; coordinator-note items + the OWED-list discharge)

### G6/G8 close-time stock-cell refresh list (coordinator note 2026-11-20; basis = R7's post-splice audit `bad61a2c`, 16/16 PASS)

The close instruments still carry the PRE-splice stock cells **by design** (splice-2
flipped the article and the README, not the instrument cells). At the close summary:
**one assertion-guarded replace per cell** — anchors verified against main `a6ad33d`;
the already-consistent references need NO touch (R7 §A15: README:3–6, INDEX:377,
RESUME-BRIEF-ITER5:95–96, h-wave4-log:1020):

1. `qa/iter5-closeout-gates.md` G6 basis (:119 at dry-run read): `flow 100%
   discovery-grade; stock 7/15 ≈ 47%.**` → `flow 100% discovery-grade (2/2);
   stock 8/16 = 50%.**` (the same close act updates the sentence's "1 shipped"
   frame to the close-time shipped set per G6's own PASS form).
2. `qa/REPORT-INPUTS-ITER5.md` §3 (:62–63): `100% discovery-grade on the cycle's
   shipped set (1/1); stock 7/15 ≈ 47%.` → `100% discovery-grade on the cycle's
   shipped set (2/2); stock 8/16 = 50%.` (this IS the "§3 refresh" G6's close form
   already names).
3. `qa/iter5-close-block-skeleton.md` fill-note 8 (:112 at dry-run read):
   `(prep: flow 100%, stock 7/15 ≈ 47%)` → `(prep: flow 100%; final at close:
   flow 2/2, stock 8/16 = 50%)`.

### 41H-sha rider (note-and-follow, does not block)

H applies R7's 4 wording-class micro-edits to the landed article-41H
(:69/:134/:263/:257) — the article file sha `fcbcd812` cited in this dry-run's G5
evidence moves ONE commit at that application; the ship anchor (splice-2 `cc71841`)
is commit-stable and the §9 box stands. The close-time G5 drift-scan re-cites the
post-edit sha. (The gates file and skeleton cite NO 41H file sha — verified, nothing
to follow there.)

### OWED-list discharge record (this session, worktree agent-03; no fires, no gate execution)

1. **TARGETS rows ADDED** to `feasibility/probe/make_axcheck.py` (edit base = main
   @ `a6ad33d` bytes `00236246`, synced into the worktree first — the worktree copy
   was base-`e3d984b`-stale): `AxPilot10_MArc` (`10/M-arc.lean`, single-anchor
   class, guard `7addcf0029ea06e7`) + `AxPilot41_H2` (`41/H2.lean`, inert-delta
   class, guard `3bc8170121492d18`). Post-edit asserts: py_compile rc=0; 55 active
   rows (53+2); 0 duplicate names; each new name exactly once.
2. **Guard cells REFRESHED** in `qa/iter5-closeout-gates.md`: 74_P2 →
   `531a9eb70f9871ba` @ batch-O final park; AL3D_A2 → `61af175a` @ batch-Q
   M2-closed (lineage trails kept; dated 2026-11-20, main `a6ad33d`).
3. **G7(a) stamps PRE-STAGED** at `qa/iter5-g7-stamps-prep.md` — paste-ready
   blocks for the a6 charter family + the two splice packages; H flips at close
   (nothing executed herein).
4. The dry-run's BLOCKERS #5 (TARGETS rows owed) is DISCHARGED; the "63 vs 53"
   count reconciliation and the remaining guard re-binds stay with R1's folds.

— addendum by lane R2, 2026-11-20, worktree agent-03. H pulls at convenience; no
commit (lanes never commit).
