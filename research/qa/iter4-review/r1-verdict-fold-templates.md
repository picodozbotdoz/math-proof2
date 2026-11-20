# R1 VERDICT FOLD TEMPLATES — the six pending slots (lane R1, 2026-11-20; PRE-STAGE, worktree-side)

Purpose: on each verdict arrival the fold becomes **fill-in + byte-verify only**.
Parameterization mirrors R2's instrument-slot style (`[P3-COMPLETE-STATE]`-class named
slots with prep defaults), in `<ANGLE>` form here to keep template params visually
distinct from instrument brackets. Every slot: GREEN variant given in full; NOT-GREEN
delta given as the changed cells. **Binding procedure per fold (all six):** (1)
byte-verify the landed/landed-pending bytes vs the report's sha (`sha256sum | cut
-c1-16`); (2) re-derive verdict + census from the PERSISTED LOG (multiline-aware axiom
parse — the single-line grep misses wrapped prints, the L3 lesson); (3) dates from
`git show -s --format=%cs`, never memory; (4) assertion-guarded anchors (count == 1)
for every programmatic edit; (5) fold ONCE at the true closing state.

**DRIFT TABLE (observed 2026-11-20, worktree-of-record states — ALL SIX slots' parked
shas have moved or will move; the parked sha of record stays cited in §11 and the TRUE
closing sha is byte-derived at the verdict):**

| slot | parked sha of record (tracker/§11) | worktree state 2026-11-20 | note |
|---|---|---|---|
| R6 P2-b confirm | `N2-P1.lean` `396d8710d9084388` | agent-06 = `396d8710` (UNMOVED) | expected 17/17 (only `eulerStripImmunity_changeLevel` open; `lFunction_not_eventually_zero` already VERIFIED) |
| R6 P2-c confirm | `N2-P2c.lean` `da4c8d3fed30daac` | agent-06 = **`2cca447d7c2a29c8` (DRIFTED)** | pillar triad parked; expected 11/11 — re-derive sha at verdict |
| R6 P3-d + N3-axcheck | `N2-P3.lean` `f9bd28c5` (3/3 state) | agent-06 = GROWING (`N2-P3V2.lean` + `run_n2p3{,e,v2}.{py,sh}` staged) | headline `zetaL_rat_two_thirds_landed` + `ZetaColumnOfV2Q` discharge on the V2 substrate |
| R5 eta-r2 | `eta-r2.lean` `38bb8463fe7af1bc` | agent-04 = **`ed412a03fec748ee` (DRIFTED, 666 LoC)** | expected strict-OK 4/4 → rung-2 exit |
| R5 eta-r3 | `eta-r3.lean` `ed0c061218a2d739` | agent-04 = **`ddf85a41dbe00019` (DRIFTED, 308 LoC)** | expected strict-OK 2/2; an `eta-r4.lean` `1eead7a48e585faa` (808 LoC) ALSO exists — rung 4 in flight; the r2/r3 folds are fold-once at their CONFIRMED states regardless |
| R8 M3 | A2 post-state UNKNOWN | agent-05 = `a9e19f54353d6054` (1,994 LoC; **`set_option linter.all false` STILL PRESENT = M3 open**) | entropy identification + `SlabAreaLawColumnCuts3D` discharge; ≤3 runs chartered |

---

**EXECUTED-STAMPS (R1):** SLOT 1 (P2-b) + SLOT 2 (P2-c) + SLOT 3 (P3-d/e + N3) EXECUTED 2026-11-20 as R1 unit 16 — rows of record in r3-tables §11's "75-N2 SLOT-1 SALVO" block; the P3-COMPLETE skeleton slot [P3-COMPLETE-STATE] fills from the P3-e row. SLOT 6 (M3) EXECUTED 2026-11-20 as R1 unit 17 (NOT-GREEN variant — honest-partial park at A2 221eb30b / P0 33c75942). Remaining templates: SLOT 4/5 (eta pair) — the close's last pending verdicts.

## SLOT 1 — R6 P2-b confirm (`N2-P1.lean`, wave-close charter item 1)

Params: `<R31-LOG>` (expected run 31), `<WALL>` `<TELE>` (expect OVER=0-class),
`<N2P1-CLOSING-SHA>` (= `396d8710` if unmoved at fire), `<DATE>` (landing commit),
`<P2B-DECLS>` (expected 17/17 audit surface — derive, never assume).

**TABLES §11 row (GREEN):**

```
**75-N2 P2-b — CONFIRMED GREEN run 31 (R6, landed <DATE>; folded R1 unit <N>,
2026-11-<D>, byte-verified on main; the §11.2 P2-a row EXTENDS — P2 COMPLETE at the
parked-charter level; N2-P1 guard/GIT_BYTES → <N2P1-CLOSING-SHA>, <LoC> LoC,
<P2B-DECLS> audit surface):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 75-N2 P2-b (R6) | `pilots/75/N2-P1.lean` `<N2P1-CLOSING-SHA>` | `logs/n2-p1-run31.log` (single confirmation run per the wave-close charter item 1; wall <WALL>, <TELE>) | **CLOSED GREEN 17/17 — `eulerStripImmunity_changeLevel` triad, the last open P2-b decl; P2-b COMPLETE (16/17 → 17/17); the run-26 core regression re-verified in-run (byte-identical through the parked growth)** | `<per-run notes: descent mechanics if any; the parked-hoist resolution — the two fixed-on-disk-unfired residuals of the 16/17 state>` |
```

- **§11.CENSUS delta:** N2-P1 row moves 15/15 → `<17/17-state census>` at
  `<N2P1-CLOSING-SHA>`; GIT_BYTES_OVERRIDES cell: the pin MOVES to the closing sha
  (or DROPS if HEAD = the verified bytes — state which).
- **Tally:** the N2-P1 family stays GREEN-triad (row 6 extends; no class change).
- **Guard/TARGETS:** `AxPilot75_N2P1` GIT_BYTES pin move (make_axcheck); ledger §11
  75-N2 row's [AT-CLOSE] cell gains the run-31 cite.
- **NOT-GREEN variant:** verdict cell → **"honest-partial per D7 — P2-b parked at
  <K>/17 at the charter's single confirmation run; `<the residual decl(s)> named;
  fixes-on-disk-unfired if applicable; no live claim"**; tally: the family row SPLIT
  — P2-a/P2-b-unconfirmed noted (class stays GREEN for the file's verified surface,
  the unconfirmed decls named in the residual note — the §10.22/§10.29 checkpoint
  precedent); GIT_BYTES stays at `ce6719c8` (unverified bytes never pinned); CENSUS
  row unchanged + a parked note.

## SLOT 2 — R6 P2-c confirm (`N2-P2c.lean`, charter item 2b-successor)

Params: `<P2C-RUN-LOG>`, `<N2P2C-CLOSING-SHA>` (byte-derived — drifted past
`da4c8d3f` already), `<DECLS-N2P2C>` (expected 11/11), `<DATE>`.

**TABLES §11 row (GREEN):** convert the parked row (tally row 18):

```
| 75-N2 P2-c confirm (R6) | `pilots/75/N2-P2c.lean` `<N2P2C-CLOSING-SHA>` | `logs/<P2C-RUN-LOG>` (the confirmation fire; wall <WALL>, <TELE>) | **GREEN — 11/11 triad incl. the pillar set; the parked-unfired state CONVERTS; `<the drift note: fired bytes vs the da4c8d3f park — what moved and why, from the log header>`** | `<pillar-trad content; N2-P2c's role in the family; Step-B activation below>` |
```

- **§11.CENSUS delta:** new (b) row `<N2P2C-CLOSING-SHA>` — `<DECLS-N2P2C>/<DECLS-N2P2C> printed` + gap class.
- **Tally:** row 18 NOT-GREEN-honest → **GREEN-triad** (count 12→13 of 16 → refresh
  the sum line).
- **Guard/TARGETS:** NEW row `("AxPilot75_N2P2c", PILOTS / "75/N2-P2c.lean")` — guard
  `<N2P2C-CLOSING-SHA>`, [WARM] class + import-chain note if it imports N2P0/N2P1
  (hyphenless → stage-scoped rewrites, the N2P1 pattern).
- **NOT-GREEN variant:** stays parked-unfired class at the NEW sha (update the parked
  sha + the residual names; tally row 18 unchanged class; NO TARGETS row until GREEN
  — the skeleton rule).

## SLOT 3 — R6 P3-d + N3-axcheck (P3-COMPLETE; the [P3-COMPLETE-STATE] filler)

Params: `<P3D-LOG>` (+ the N3-axcheck fire log if separate), `<N2P3-CLOSING-SHA>`,
`<P3-COMPLETE-STATE>` sentence (skeleton Instrument A slot), `<DATE>`.

**TABLES §11 row (GREEN):**

```
**75-N2 P3-COMPLETE — the composed headline landed (R6, landed <DATE>; folded R1
unit <N>; `N2-P3.lean` `<N2P3-CLOSING-SHA>`, <LoC> LoC, <P3D-DECLS> decls; the
three-theorem GREEN row EXTENDS):** **`zetaL_rat_two_thirds_landed` triad — the
composed ζ(2/3)-rationality statement kernel-proved over the V2 substrate
(`ZetaColumnOfV2Q` discharged; `simple_proportion_d4` d4-triad banked); the P3
charter COMPLETE.** Step-B: `AxPilot75_N2P3` row ACTIVE — chain wiring per the
§11.2 stub note (import N2P0 + N2P1 hyphenless → stage-scoped rewrites to
AxPilot75_N2P0/AxPilot75_N2P1, order Pa→N2P0→N2P1→P3); N3-axcheck verdict
`<the R9-ship-template 686f237d consumption state>`.
```

- **§11.CENSUS delta:** N2-P3 row 3/3 → `<full surface>` at `<N2P3-CLOSING-SHA>`;
  the V2 donor-build row (c) already quoted stays.
- **Tally:** row 14 stays GREEN (extends; no class change).
- **Ledger §11:** the 75-N2 [AT-CLOSE] cell + **skeleton Instrument A
  `[N2-STATE-SENTENCE]`/`[P3-COMPLETE-STATE]` fill** (the templates file is NOT the
  instrument — H fills the skeleton from this fold's row).
- **NOT-GREEN variant:** P3-d honest stop — verdict cell names the residual
  (`<the failing decls>`), the three-theorem bank STANDS (P3-a/b/c unaffected);
  tally row 14 class → honest-partial (the banked surface named); NO P3-COMPLETE
  skeleton fill (slot stays [AT-CLOSE]/next-wave).

## SLOT 4 — R5 eta-r2 (`eta-r2.lean`, rung-2 exit)

Params: `<R2-CONFIRM-LOG>`, `<ETA-R2-CLOSING-SHA>` (byte-derived — drifted past
`38bb8463`), `<R2-DECLS>` (expected strict-OK 4/4), `<DATE>`.

**TABLES §11 row (GREEN):**

```
| zzv2-λ η-port rung 2 (R5) | `pilots/zzv2-lam/eta-r2.lean` `<ETA-R2-CLOSING-SHA>` | `logs/<R2-CONFIRM-LOG>` (wall <WALL>, <TELE>) | **GREEN — strict-OK 4/4 triad: `<the four decl names, derived from the log>` — the rung-2 exit; `<the drift note vs the 38bb8463 park>`** | DONOR-TREE class ([LAYERS] — verdict of record = the run log, the zzv2-P1/eta-r1 precedent; NEVER a plain TARGETS stage). Port ledger: `<8+k>` of the amended 11–13. `<rung-2 record cross-ref>` |
```

- **§11.CENSUS delta:** new (b) row (donor-tree class noted in the gap column:
  verdict-of-record = run log).
- **Tally:** NEW GREEN row (the eta-r2 file's own row; count +1).
- **NOT-GREEN variant:** honest stop at the confirm — the four named with
  `<k>`-of-4 clean, residuals named; class honest-partial; ledger 8-of-band stays;
  next-fix note from the log header.

## SLOT 5 — R5 eta-r3 (`eta-r3.lean`)

Identical shape to SLOT 4 with: `<ETA-R3-CLOSING-SHA>` (drifted past `ed0c0612`),
expected strict-OK **2/2**, params `<R3-CONFIRM-LOG>`, `<R3-DECLS>`. Extra cell line:
**the rung ladder state after r3 (the observed `eta-r4.lean` `1eead7a4` in-flight —
the r4 fold is NEXT-WAVE/live, never folded from this pair's report).** NOT-GREEN
variant as SLOT 4.

## SLOT 6 — R8 M3 (the AL ladder's final rung)

Params: `<M3-SHA>` (UNKNOWN until close — worktree in-flight `a9e19f54` at
pre-stage, WILL have moved), `<M3-LOGS>` (≤3 runs), `<M3-DECLS>`, `<LINTER-LIFT>`
(verify `grep -c "set_option linter.all false" == 0` on the closing bytes — the
diagnostic LIFTS at M3's close per record note i), `<DATE>`.

**TABLES §11 row (GREEN):**

```
**AL M3 — the ladder COMPLETE (R8, landed <DATE>; folded R1 unit <N>; A2 guard
`61af175a` → `<M3-SHA>`, <LoC> LoC, `<M3-DECLS>` audit surface):**
**`SlabAreaLawColumnCuts3D` DISCHARGED from the `PlanarAreaLawVar` binder — the
entropy identification + the final assembly triad; the M0→M3 ladder kernel-verified
END-TO-END; the precharter's P2-e target PROVED.** `<LINTER-LIFT verified: the
unit-8 diagnostic is GONE from the closing bytes>` — the record-note-i discharge.
Runs `<the ≤3 ledger>`; walls + telemetry `<per-run>`; regression gate: the M2 core
byte-identical `<verify vs 61af175a core span or cite the in-run gate>`.
```

- **§11.CENSUS delta:** A2 row 89/89 → `<M3 surface>` at `<M3-SHA>`.
- **Tally:** the A2 family row extends GREEN (no class change).
- **Guard/TARGETS:** `AxPilotAL3D_A2` guard → `<M3-SHA>`; ledger §11 al3d cell.
- **NOT-GREEN variant (honest stop at the ≤3 cap):** verdict cell → the entropy
  identification's residual named (`<the failing decl(s)>` + error class from the
  log), **the M0→M2 ladder stands** (the §11 block unchanged), A2 class →
  honest-partial at `<M3-SHA>` (tally row 12 splits: the M0→M2 verified surface
  stays GREEN-named, M3 residuals in the note — the L3-corrected-block precedent:
  certified vs narrative separated); linter-lift cell reports the actual grep state
  (lifted or carried with the stop-note); guard moves ONLY if the closing bytes are
  committed (fold-once — else stays `61af175a` with the in-flight sha recorded).

---

**Ledger-side note (the §C mirror):** each slot's fill lands in VERIFICATION-LEDGER
§11's per-pilot [AT-CLOSE] cells (75-N2, zzv2-lam, al3d rows) — one line each, citing
this file's executed fold + the run log; the ledger never re-derives.

— pre-staged lane R1 (verification-integrity), 2026-11-20, worktree agent-02. This
file is a TEMPLATE SET, never a row of record; executed folds land in
`r3-verification-tables.md` §11 + the companions per the per-slot deltas above.
