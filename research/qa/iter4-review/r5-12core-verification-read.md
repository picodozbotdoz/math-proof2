# R5 INDEPENDENT VERIFICATION READ — R3's 12-core closing batch (GREEN @ `223cfa1`)

Lane R5 (worktree agent-04 @ `223cfa1`, ff-refreshed; rubric
`r5-12core-read-rubric.md` `d0616db0`). Fresh-eyes: every check against landed
bytes/logs, not R3's narrative. Scope: the TRANCHE CLOSE (runs 10–13 + run-14
axcheck) + the two forced statement amendments + the 13-vs-14 reconciliation +
the M-class evaluation readiness. **VERDICT: GREEN CONFIRMED — read PASS 6/6 with
ONE low-severity declared finding (P0.lean's stale false stub) + ONE custody item
(13 unprinted Choice lemmas, the full-coverage class). The S-tranche close stands;
V1 = record-billed no-row (G6 cell (b1), 9/17 R-A clean).**

## 1. Regression anchors — PASS

- Disk `CORE.lean` = **`940bc9eabe82d5e0`** (sha256sum verified = H's reported
  `940bc9ea`); staged sha chain in `logs/core-runs10-13.log` header
  (`9e07ed2f`→`cbf8b49f`→…→`940bc9ea`, sha-guarded every fire); the milestone
  link `7e40dff4` in the same chain's lineage (record §descent).
- Day-1 structures survive: `parametric_main` still the real reduction
  (`route16_MMgeneral M W epsParam_data hδ he h17 h16`, CORE.lean :947);
  the frozen-fiber claim and the three verbatim donor ports per the record's
  day-1 table (unchanged regions of the file).
- Milestone content survives: `MMgeneral_total_sum` re-printed **triad-only at
  run 14** (the certification covers the milestone decl); the ω_b-balance binder
  and `ChoiceSumInputs` interface per :480–:492 + the milestone block.

## 2. Triad-print audit — PASS w/ ONE custody item

- `logs/core-run14-axcheck.log` (`b8c1c194`…): parsed 15 unique prints (30 lines
  = 2×15, the axioms section + output tail) = **14 triad-only** (`MMgeneral_total_sum`,
  `choiceSumInputs_of_choice`, `explicit_transfer`, `route16_core`,
  `route16_MMgeneral`, `route16_MMgeneral_frozen`, `Theorem19.sixteen_le_root`,
  `Theorem19.choice_corollary_26`, `Choice.{pow_eighteen_le, le_n, one_le_ceil,
  ceil_le_sqrt, one_le_log, build_le}`) **+ `parametric_main` [propext, sorryAx,
  Classical.choice, Quot.sound]** — the declared honest seam (consumes the
  `epsParam_data` def-stub :932; the reduction itself is real). Zero errors,
  zero other sorryAx. The "14/14" headline is TRUE for the printed set.
- **CUSTODY ITEM (the pilot-10 axcheck_full class):** the Choice lemma namespace
  carries **19 declarations**; only 6 printed. **13 UNPRINTED**: `n_pos`,
  `one_le_D`, `D_pos`, `one_le_n`, `one_le_rpow`, `ceil_le`, `log_le_log`,
  `saving`, `cube_mul_saving_le`, `rpow_le_rpow_div`, `rpow_le_of_le`,
  `instances_le`, `scans_le`. The whole file now carries ~41 theorem declarations
  (namespace-nested + stubs included) vs the 15 printed. Not a greenness
  challenge (run 13 is rc=0 sorry=7 whole-file; every decl elaborated) — but
  per-decl axiom custody is incomplete. Disposition: a full-coverage sweep
  (`axcheck_full.py` pattern) at the next 12-core fire, or the G2 custody row
  names the 13; do NOT restate "14/14" as whole-file coverage anywhere.

## 3. DECREASING-form rider (`EpsData.strict_anti`) — PASS

- Form of record present: `strict_anti : StrictAntiOn ε (Set.Ioc 2 2.9)` (:239).
- The closing batch's new monotonicity claims are ALL StrictAntiOn-form (:411
  `hAnti`, :414 `hκ`, :419 the `εf` conclusion); no mono-on/increasing/reverted
  form anywhere in the new prose; the hδ-discharge story (:838 area + the
  evaluation §0) consumes `strict_anti` + `frozen_fiber` exactly per the rider.

## 4. Sorry-token accounting (Branch A) — PASS

- **8 → 7**: `route16_MMgeneral` DISCHARGED (the named discharge); `sorry=7`
  held verbatim across runs 10–13 (per-run log verdict lines); the 7 warnings at
  run 13/14 = `:201 route15_frozen`, `:209 route16_frozen`, `:244
  route15_MMgeneral`, `:259 route16_symbolic`, `:387 flagship_shape`, `:409
  balancePoint_monotone_shape`, `:932 epsParam_data` — exactly the record's
  7-stub frontier, all M-class per `M-CLASS-EVALUATION.md` §1.
- **No new sorries** beyond the frontier (Branch A arithmetic clean: 8 − 1 = 7,
  each side named). Any G1 fold: the 7 are the declared staged-unfired class.

## 5. Run-ledger reconciliation vs `REPORT-INPUTS-ITER6.md` §2 + grant discipline — PASS

- Runs 10–13 descent **16→5→2→0** (per-run `FAIL rc=1 errors=16/5/2` +
  `PROBE-OK rc=0 errors=0 sorry=7`) + **run 14 axcheck** = **5 fires = the ≤5-fire
  GO exactly** (`259f383`); no off-band fire; both logs persisted with provenance
  headers (app/spec/substrate/sha-chain/runner `run_core.py 55e541ea` w/ the
  sorry-filter fix per the D4 template `a3976f96`).
- Register §2's "12-core closing batch — UNFIRED at compile" row is SUPERSEDED by
  this landing (H/R1's §12 fold; the ledger row should cite `core-runs10-13.log`
  + `core-run14-axcheck.log`).

## 6. M-class evaluation readiness (the G6 V1 gate) — RESOLVED by R3's own note

- `M-CLASS-EVALUATION.md` (71 lines, landed): preparation-only (no M-class fires
  — §3 budget accounting honest); the **central γ-freeze finding** (all in-corpus
  parametric savings capped at 0.00175; η = γ/2 balance; the cap is a
  Corollary-16 literal); `flagship_shape` corpus-blocked as stubbed (the ω_b <
  log₂ 7 regime) with two honest re-scope forms named; `route16_symbolic`'s
  SAME latent defect named (the re-split binder); `balancePoint` = the F5
  question verbatim, honestly carried unpriced and OFF the flagship critical path.
- **V1 cell: (b1) record-billed, NO article row** (the 223cfa1 commit's own
  ruling) ⇒ G6 arithmetic 9/17 ≈ 52.9% PASS, R-A clean. The negative-kind
  re-scope candidacy (the corpus cannot express better-than-Strassen parametric
  savings) is R2/R7's editorial call — correctly NOT decided lane-side.

## SPECIAL ITEM 1 — the two forced statement amendments: both EXACTLY the honest weakening; one stale-probe finding

**(a) `ChoiceSumInputs.scans_le` + `Real.log n ≤ Λ`** (CORE.lean :491–:492).
Verified: the added hypothesis is the DONOR'S OWN (`Choice.lean`'s `scans_le`
always took `hΛ : Real.log n ≤ Λ`); nothing else added (`1 ≤ κ` unchanged; the
`1 ≤ Λ` field is RETAINED and now derived in the construction
`hΛ := (I.one_le_log P).trans hlogΛ`, :515 — the interface is the donor's exact
hypothesis set). Forcing: the v1 field at Λ=1, κ=1 demanded `termScans ≤
c^η·n^{3−η/18}` i.e. log n ≤ 1 — FALSE as stated, confirmed. `MMgeneral_total_sum`'s
statement unchanged (its hlogΛ rides). **Consumer scan (rg corpus-wide, .lean +
.md): NO consumer of the old false field form.** The only other `scans_le` in the
corpus is pilot-11's PRIVATE same-name theorem (`P11T2.lean:180`) — a different
object that already carries the `Real.log n ≤ Λ` hypothesis; not a consumer.

**(b) `route16_MMgeneral` + `parametric_main` ε-fiber binders** (`hδ : E.ε W.ωb ≤
0.0315/18`, `he : 1 ≤ E.e W.ωb`; :892–:896 / :941–:947). Verified: conclusions
UNCHANGED (`Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb)`); exactly the two
binders the γ-freeze analysis forces (hδ = the exact in-corpus cap 0.00175; he =
the log floor); no other weakening. The unconditional content is preserved where
TRUE: `route16_MMgeneral_frozen : Theorem_19_explicit M 0.00175 1` (:911–:914,
triad-clean at run 14) — the frozen fiber is unconditional, the parametric
statement carries its honest hypotheses. The charter-input §2 rescope shape
covers it (the record quotes it: "the EpsData-binder statements already support
exactly that fallback"). **Consumer scan: ONE in-corpus restatement of the old
false form — `pilots/12/P0.lean:236`** (the statement-PROBE stub, header "not a
proof artifact", still the unconditional signature). FINDING (low severity,
declared class): the probe file restates a form now KNOWN FALSE; probe-convention
exempts it from proof standards but the D4 rider binds core prose — annotate or
amend at the next P0.lean touch (a one-line hδ/he binder addition mirrors CORE's
form; NO fire needed). No other code consumer; the prose hits
(RESUME-BRIEF/records/INDEX/charter-input/i6-predraft) cite the arc, they do not
bind the form. `parametric_main` has NO P0.lean restatement (checked).

## SPECIAL ITEM 2 — the 13-vs-14 triad count: reconciled, no contradiction

R1's prestage "13 top-level theorems" and R3's "14/14" measure **different
sets**: 13 = R1's whole-file top-level census at the MILESTONE sha `7e40dff4`;
14 = R3's curated certification print set (new + re-verified) at the CLOSING sha
`940bc9ea` — of a file that now carries ~41 theorem declarations (19 of them in
the Choice lemma namespace). Both counts are true under their definitions. The
read's own enumeration: **15 prints = 14 triad-only + 1 honest-seam
(`parametric_main`)**, and the residual custody gap is §2's 13-unprinted item
above. Recommendation: downstream records say "the certification set 14/14" or
"15 printed (14 triad + 1 declared seam)", never "14/14 of the file".

— lane R5 (A3 lineage), 2026-11-21, worktree agent-04 @ `223cfa1`. REPORT ONLY —
H lands this read; the two flagged items (P0.lean stub annotation; the
full-coverage sweep/custody row) are routed per the funnels (R3 owns P0.lean;
R1 owns the G2 custody row).
