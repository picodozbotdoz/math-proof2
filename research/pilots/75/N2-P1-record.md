# Pilot 75-N2 P1 — verification record (COMPLETE: M1+M2+M3 all GREEN-triad)

Lane A5, sessions 2026-11-17 (runs 1–8) + 2026-11-18 wave-3 (runs 9–15, M1+M2)
+ 2026-11-18 re-task (runs 16–19, M3) + 2026-11-18 close-act (runs 20–21, P2-a
open) + **2026-11-19 wave-4 R6 (runs 22–23, P2-a fix-loop to budget
exhaustion — see §P2 state)**. Charter chain: orchestrator P1 GO ruling
of 2026-11-17 (≤6-run fix-loop); restart charter 2026-11-18 (closure + one
fix+rerun + M2 + M3-if-budget); re-task 2026-11-18 (M3 execution, fresh ≤6-run
budget, verify-fire discipline, hard-stop rule); wave-4 task 2026-11-19 (R6:
P2-a continuation, 2-run remnant of the P2 ≤6 budget). Dossier:
`research/candidates/75-N2-rayclass-dirichlet-consumer.md` §Pilot spec skeleton
(P1) + §Proof-strategy steps 1–3. A1 folds the §10-format block below into
`qa/iter4-review/r3-verification-tables.md` (one-writer discipline). Evidence
of record: `pilots/75/logs/n2-p1-run{1..25}.log` (per-run provenance headers
with verify-fire shas + error-class analyses; **run 19 = the verified P1
state**, sha ca1089e2a0c1…).

## Milestone verdicts (verified state = run 19)

| milestone | content | verdict |
|---|---|---|
| M1-core (P1-a) | `chi_span_eq_one`, `chi_span_mul`, `chi_span_ne_zero`, **`chi_span_residue` (the c-trick)** | **GREEN-triad** (since run 7) |
| M1-packaging | `exists_nat_span`, `chiUnitHom`/`ratCharOf`, `ratCharOf_apply` | **GREEN-triad** (7/7 since run 10) |
| M2 (P1-b) | `heckeTsum_eq_ratCharOf_LFunction` — the L-series identification | **GREEN-triad** (run 15) |
| **M3 (P1-c/d)** | `ratCharOf_eq_one_iff` (principality transfer), `isPrincipal_of_modulus_one` (q = 1 degeneracy), `identity_theorem_extension` (the donor's EntireAbelianQuotient pattern on our pin), `hasQDirichletDictionary` (**N2-a DISCHARGED**), `factorization_identity_extension` (the hAbFacQ bridge), `dirichletFactorizationTransfer` (the corrected composed transfer) | **GREEN-triad (run 19)** — 6/6 |

**P1 is COMPLETE: the ℚ dictionary (N2-a), its L-series identification (N2-a(ii)),
principality transfer (N2-a(iii)), the identity-theorem extension, and the
factorization transfer are all kernel-verified, 14/14 file declarations triad-clean,
0 sorry.** What remains of the N2 pilot is P2 (the hEχ port) and P3 (the V2 ζ-column
landing) — the assembly-engine side; the dictionary layer is done.

## §10-format row block (verified state = run 19; axioms source `logs/n2-p1-run19.log`)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `chi_span_eq_one` | `pilots/75/N2-P1.lean:215` | PROVED-UNCONDITIONAL | run 19 — triad | DZDF `map_span'` over ℚ |
| `chi_span_mul` | `N2-P1.lean:244` | PROVED-UNCONDITIONAL | idem — triad | DZDF `map_mul'` on principal spans |
| `chi_span_ne_zero` | `N2-P1.lean:316` | PROVED-UNCONDITIONAL | idem — triad | DZDF `eq_zero_iff'` forward; `1 < q` scope |
| `chi_span_residue` | `N2-P1.lean:348` | PROVED-UNCONDITIONAL | idem — triad | **the c-trick** — the dictionary's mathematical core |
| `exists_nat_span` | `N2-P1.lean:161` | PROVED-UNCONDITIONAL | idem — triad | ℚ ideal classification |
| `ratCharOf` | `N2-P1.lean:404` | PROVED-UNCONDITIONAL | idem — triad | dictionary character via `MulChar.ofUnitHom` |
| `ratCharOf_apply` | `N2-P1.lean:411` | PROVED-UNCONDITIONAL | idem — triad | value dictionary, ALL k at 1 < q |
| `heckeTsum_eq_ratCharOf_LFunction` | `N2-P1.lean:473` | PROVED-UNCONDITIONAL | idem — triad | **M2**: Hecke tsum = mathlib L-function on ℜs > 1 |
| `ratCharOf_eq_one_iff` | `N2-P1.lean:537` | PROVED-UNCONDITIONAL | idem — triad | **M3-a**: principality transfer (`MulChar.ext` + `one_apply_coe`; sup-bridge + `Units.ne_zero`) |
| `isPrincipal_of_modulus_one` | `N2-P1.lean:576` | PROVED-UNCONDITIONAL | idem — triad | **M3-b**: q = 1 degeneracy (`Unique (ZMod 1)` instance) |
| `identity_theorem_extension` | `N2-P1.lean:590` | PROVED-UNCONDITIONAL | idem — triad | **M3-c**: half-plane → ℂ∖{1} (donor's verbatim pattern: `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` + `isConnected_compl_singleton_of_one_lt_rank`, seed z₀ = 2) |
| `hasQDirichletDictionary` | `N2-P1.lean:610` | PROVED-UNCONDITIONAL | idem — triad | **M3-d**: `HasQDirichletDictionary` discharged (N2-a complete) |
| `factorization_identity_extension` | `N2-P1.lean:621` | PROVED-UNCONDITIONAL | idem — triad | **M3-c2**: the hAbFacQ bridge (products of entire LFunctions) |
| `dirichletFactorizationTransfer` | `N2-P1.lean:651` | PROVED-UNCONDITIONAL | idem — triad | **M3-e**: the composed transfer (corrected shape, `hnp` explicit — see the FIND) |
| (engine, frozen) | `Pa.lean` | PROVED-HERITAGE | run 19 Pa block — triad | recompiled clean each run |
| (P0 quotes, frozen) | `N2-P0.lean` (staged `N2P0`) | PROVED-HERITAGE | run 19 — triad | 15/15 per P0 record |

Zero sorry tokens written at any point (classifier: all grep hits are
header/audit prose); all intermediate sorryAx prints were elaboration-error
cascades, eliminated as fixes landed.

## STATEMENT FIND (find-#4 precedent class; recorded in-decl at `N2-P1.lean:641`
## + dossier + here; P0 amendment owed)

**`N2-P0.lean:166`'s `DirichletFactorizationTransferQ` as literally stated is
NOT provable.** Its hypothesis list omits the nonprincipality input
(`∀ i, ¬ IsDZDFPrincipalQ (m i) (χ i)`), yet its conclusion asserts `ψ i ≠ 1`.
Counterexample class: a principal family (e.g. the trivial character at
modulus (2), fK the ζ-side continuation, fL := Hecke·fK — all hypotheses hold)
would force `LFunction (ψ ≠ 1) = principal-Hecke` on ℜs > 1, refuted by
coefficient comparison (the L-series of a nontrivial character cannot equal
that of the principal character on the whole half-plane); the degenerate
fK = 0 case shows the shape is not uniformly refutable either — it is simply
wrong as a target. The DZDF factorization's own `∀ i, ¬IsDZDFPrincipalQ` is
the intended input; M3-e (`dirichletFactorizationTransfer`) carries it as the
explicit hypothesis `hnp` and discharges the corrected shape GREEN-triad.
**Owed:** the N2-P0 amendment (add `hnp` to the Prop, one-line + record note;
P0's 15/15 elaboration ledger unaffected — statement elaboration does not
certify provability), for the P0 owner (this lane) at the next P0-touching
commit; flagged for A1's verification-tables fold.

## Run ledger (19 runs; walls 66–190 s; telemetry per log; route: doz CLI,
`crossmath-pilot-75` warm lineage on semraker throughout; 2 cpu / 4 GB soft,
LEAN_NUM_THREADS=2; mem OVER flags on runs 11–19 are the AGENTS.md §Modal-5
mapped-olean artifact — M2/M3's statements pull the hurwitzZeta/LSeries
analysis closure; cpu stayed ≤ 1.02/2.0 in every run)

- Runs 1–8 (2026-11-17): descent 37→26→12→8→5; M1-core GREEN-triad at run 7;
  run 8 = the authorized closure run (fired at 21:09 just before the network
  termination; the wrap-up's "never verified" was a visibility gap, corrected
  at restart).
- Run 9: the one post-closure fix+rerun — 5→1 errors; `ratCharOf` GREEN-triad.
- Runs 10–15 (M2): run 10 confirmed M1 7/7 (the v10 conv_lhs fix) + M2 first
  elaboration; four mechanical classes (brace typo; `.mp`/`.mpr`; set_option
  placement; **the `have`-opacity trap** — tactic-`have` admits no zeta-unfold,
  retroactive root cause of the show-defeq failures; fix `let`); the F5(ii)
  fallback (LSeries-bridge restructure) executed; **run 15: M2 GREEN-triad**.
- Runs 16–19 (M3, fresh ≤6 budget): run 16 first elaboration (6 errors: missing
  Fact/Nontrivial instances; the donor's `(z₀ := 2)` named arg dropped;
  `Differentiable.differentiableAt`'s implicit point; omega's ∀-instantiation
  limit); run 17 (1 error: unit-vs-element metavariable rw in hvne); run 18
  (1 error: `.symm` direction); **run 19: OK — 14/14 triad-clean**. Four M3
  runs (2 under budget).
- Runs 22–23 (2026-11-19, R6 wave-4, the 2-run remnant of the P2 ≤6 budget;
  input shas 4839521c… (r22, from parked ecd44c6a + 4 pin-verified fixes) →
  r23): **r22 8→3 errors** — the four R6 fixes all landed (isDiscrete_zeroSet
  block fully green: `DifferentiableOn.analyticAt` + `.analyticOnNhd`
  (CauchyIntegral.lean:721/:729 — the REAL complex bridges; neither
  `DifferentiableAt.analyticAt` nor `Differentiable.analyticOnNhd` exists on
  the pin), the `.frequently` append (mathlib's own
  `frequently_zero_iff_eventually_zero` idiom), the verified 5-tuple
  `Filter.disjoint_iff` shape, the missing-`have` on `him`); residue = hBeq
  and_assoc + IsBounded shadowing. **r23 3→4 errors — NOT descent: the r22
  count was masking** (a failed have-type suppresses its whole tactic block;
  hBbd's `rw` had never elaborated at r21/r22). Residue all name-resolution:
  the pin's set-boundedness API is namespaced (`Bornology.IsBounded`,
  `Metric.isBounded_iff_subset_closedBall`, `Metric.isCompact_iff_isClosed
  _bounded`) while the file's `open Filter` shadows bare `IsBounded`; plus the
  A5 tail-tuple shape (wrong all along, masked — Real's `≤` whnfs to lt-or-eq,
  the r23 "more than one constructor" error). All four fixes applied on disk
  post-r23 (parked, unfired, sha cf6d293f…); budget EXHAUSTED at 6/6 there.
  Walls 66/59 s; r22 telemetry OVER-mem = the §Modal-5 mapped-olean artifact;
  r23 finished under the first sample.
- Runs 24–25 (2026-11-19, R6 unit 2, fresh ≤2-run grant on the diagnosis
  class; input shas 68a73689… (r24) → ce6719c8… (post-r25 park)): **r24 11
  errors — ALL inside the never-elaborated hBbd body, every other fix held**
  (the Pa-idiom tail, hBeq, hBbd's have-type + rw, hBcp/hfin all green; the
  masking lesson vindicated). Classes: bare `|ρ|` for ρ : ℂ is a lattice-abs
  parse error on the pin ("failed to synthesize Lattice ℂ" — write `‖ρ‖`;
  the ℂ norm instance is √(normSq), Analysis/Complex/Norm.lean:28–33);
  `Complex.sq_abs` unknown (A5's guess — the bridge is
  `Complex.norm_mul_self_eq_normSq` + `Complex.normSq_apply`, Norm.lean:33 +
  Basic/Complex/Basic.lean:516); the folded-hρ linarith blindness (unfold via
  the Pa simp-only idiom + obtain); `Metric.mem_closedBall` +
  root `dist_zero_right` + `abs_le_of_sq_le_sq` for the finish. Full hBbd
  rewrite in ‖·‖ form applied. **r25 11→1 — the whole rewrite landed; the
  single residual (:772) was R6's own `abs_le.mp (le_abs_self T₁)`
  construction unifying to the trivial `|T₁| ≤ |T₁|`; the intended
  `-|T₁| ≤ T₁` is one line (`le_abs_self (-T₁)` + `rw [abs_neg] at h` +
  linarith). Applied on disk, parked unfired (grant 2/2 SPENT; anything
  beyond = STOP + findings per the ruling). Expected: the next run on the
  parked sha ce6719c8… is P2-a GREEN (15/15, 0 sorry).** Walls 63/81 s;
  r25 telemetry OVER-mem = the §Modal-5 mapped-olean artifact (cpu 0.67/2.0).
  **Zero math defects across the entire grant; the P2-a argument is
  unchanged since run 22.**

## Engineering record (reusable friction ledger; supplements the M2 note)

New M3 classes (all one-fix-each): `Units.ne_zero` needs `Nontrivial (ZMod q)`
= the Fact-governed `ZMod.nontrivial` instance — establish `haveI iF : Fact
(1 < q)` first; donor-pattern term applications must carry the `(z₀ := 2)`
named argument or the seed stays a metavariable through both point-proofs;
`Differentiable.differentiableAt`'s point is an implicit section variable —
`hg.differentiableAt (x := ρ)`; `omega` does not instantiate ∀-hypotheses —
`have hqi := hq i` first; a rw whose lemma-argument is a coerced UNIT
(`ZMod.natCast_zmod_val u`) leaves the pattern's `a` a metavariable — state
the equation explicitly with the coerced argument and rw the equation. The
identity-theorem extension is now a one-shot reusable pattern
(`identity_theorem_extension`: DifferentiableOn-on-{1}ᶜ + half-plane agreement
⇒ everywhere-off-{1}); the punctured-plane connectedness comes free from
`isConnected_compl_singleton_of_one_lt_rank` + `Complex.rank_real_complex`.

P2-a classes (runs 22–23, R6; all name-resolution/shape — zero math defects):

- **The complex bridges are `DifferentiableOn.analyticAt` /
  `DifferentiableOn.analyticOnNhd`** (Analysis/Complex/CauchyIntegral.lean:721/
  :729) — `DifferentiableAt.analyticAt` and `Differentiable.analyticOnNhd` do
  NOT exist on the pin; feed `hd.differentiableOn` + `isOpen_univ` /
  `isOpen_univ.mem_nhds (mem_univ x)`.
- **`AnalyticOnNhd.eqOn_zero_of_preconnected_of_frequently_eq_zero` takes ∃ᶠ
  (∃ᶠ z in 𝓝[≠] z₀)**, not ∀ᶠ — from an ∀ᶠ-in-𝓝 branch use
  `(h.filter_mono nhdsWithin_le_nhds).frequently` (mathlib's own
  `AnalyticAt.frequently_zero_iff_eventually_zero` idiom; NeBot for 𝓝[≠] is
  free over ℂ).
- **`Filter.disjoint_iff` (Order/Filter/Basic.lean:420) is the 5-component
  ∃** (`∃ s ∈ f, ∃ t ∈ g, Disjoint s t`); with `Filter.mem_principal_self`
  (:152) + `Set.disjoint_iff_inter_eq_empty` under `_root_.disjoint_iff.mp`
  (Order/Disjoint.lean:162) it discharges the `isDiscrete_iff_nhdsNE` goal
  `𝓝[≠] x ⊓ 𝓟 S = ⊥` (note the pin's RHS is the inf-equation, not NeBot).
- **Set-boundedness API is NAMESPACED on this pin**: `Bornology.IsBounded`
  (Topology/Bornology/Basic.lean:101), `Metric.isBounded_iff_subset_closedBall
  ` and `Metric.isCompact_iff_isClosed_bounded` (inside `namespace Metric`,
  MetricSpace/Bounded.lean:65/:97) — Bounded.lean reads them bare only via its
  own `open Bornology`; a consuming file with `open Filter` gets `IsBounded`
  SHADOWED by `Filter.IsBounded` (Order/Filter/Defs.lean:491) and
  `_root_.IsBounded` is a resolution error. `IsCompact.finite` (Compactness/
  Compact.lean:1054, takes `(hs : IsCompact s) (hs' : IsDiscrete s)`) and
  `IsDiscrete.mono` (Constructions.lean:636, `(hs : IsDiscrete s) (hst : t ⊆
  s)`) ARE root and fine.
- **THE MASKING LESSON (runs 21–23)**: under a failed `have`-TYPE, the
  block's tactic lines are suppressed — absence of per-line errors inside a
  masked block is NOT evidence of correctness (A5's r21 "hBbd fixed" note and
  R6's r22 "hBbd body clean" reading were both this artifact; it also hid the
  tail-tuple shape error). Budget discipline consequence: error-COUNT
  non-descent (3→4 at r23) can be an unmasking, not a regression — read the
  positions, not the count.
- **Real's `≤` whnfs to `a < b ∨ a = b`** (the LE instance is literally
  lt-or-eq): an anonymous-constructor leaf mismatch against a Real inequality
  surfaces as the confusing "expected type `0 < ρ.re ∨ 0 = ρ.re` has more
  than one constructor". The fix is the tuple SHAPE (`rintro ⟨hρs, hρ2, hρ3,
  hρ4, hρ5⟩` flattening supp ∩ stripWindow, then `⟨⟨le_of_lt hρ2, le_of_lt
  hρ3, le_of_lt hρ4, hρ5⟩, hzero⟩` flat-4-in-pair against B ∩ zeros).

P2-a classes (runs 24–25, R6 unit 2; all tactic-field — zero math defects):

- **Bare `|z|` for z : ℂ does NOT elaborate on this pin** — the `| |`
  notation attempts a lattice-flavored abs and fails with "failed to
  synthesize instance Lattice ℂ". Write `‖z‖` (the ℂ norm instance is
  √(normSq), Analysis/Complex/Norm.lean:28–33; `Complex.norm_nonneg` is
  protected — call it by full name).
- **The |z|² = re²+im² bridge**: `Complex.sq_abs` does NOT exist; use
  `‖z‖ ^ 2 = ‖z‖ * ‖z‖ (by ring)` → `Complex.norm_mul_self_eq_normSq`
  (Norm.lean:33) → `Complex.normSq_apply` (Basic/Complex/Basic.lean:516),
  finished with `ring`.
- **linarith cannot see through folded set-membership hypotheses** — unfold
  first with the Pa idiom (`simp only [hBdef, Set.mem_ofPred_eq] at hρ`)
  then `obtain` the bounds; |T|-atom connections need explicit facts
  (`T₂ ≤ |T₂|` via `le_abs_self`; `-|T₁| ≤ T₁` via
  `le_abs_self (-T₁)` + `rw [abs_neg] at h` + linarith).
- **The `abs_le.mp (le_abs_self a)` TRAP** (r25's single error): the
  application unifies to the trivial `|a| ≤ |a|` and fails — expected-type
  propagation sets the iff's `b` from the projection, not from the argument.
  Construct negated-abs facts via the `le_abs_self (-a)` + `abs_neg` route.
- **The closedBall finish**: `Metric.mem_closedBall` (Pseudo/Defs.lean:423,
  namespaced — NOT bare) + root `dist_zero_right` (bare; precedent
  Normed/Module/Convex.lean:119) + `abs_le_of_sq_le_sq`
  (Algebra/Order/Ring/Abs.lean:134) with a final `rwa [abs_of_nonneg hn] at
  hle` (the lemma concludes `|a| ≤ b`, the goal is `a ≤ b` for `a := ‖ρ‖`).

## P2/P3 recommendation (updated 2026-11-18, post-M3)

- **P2 (the hEχ port): GO** — every dictionary-level input it needs is now a
  kernel-verified theorem (`ratCharOf_apply`, `heckeTsum…`, the transfer's
  `1 < q i ∧ ψ i ≠ 1` scope); `ThmEDyadicToCumulative`'s proof is independent
  of P1's friction classes; `HasEulerStripImmunity`/`CountsUnbounded` shapes
  unchanged.
- **P3 (V2 ζ-column + the composed landing): GO** — the M4b import pattern is
  settled; `factorization_identity_extension` now supplies the exact
  `hAbFacQ : ∀ s ≠ 1` bridge the engine consumes, so P3's composition is a
  direct application chain (transfer → identity-extension →
  `zetaL_rat_two_thirds_landed`).
- **P0 amendment owed** (the FIND above): ~~add `hnp` to
  `DirichletFactorizationTransferQ`~~ — **APPLIED by A5 2026-11-18** (dated
  erratum block at `N2-P0.lean:161`; elaborates OK runs 20–23).

— end record (A5, 2026-11-18; P1 COMPLETE — M1+M2+M3 GREEN-triad at run 19).


## P2 state at the close-act hard stop (A5, 2026-11-18) — superseded by §below (R6)

- **Riding item DONE**: the N2-P0 erratum applied (`DirichletFactorizationTransferQ` + the `hnp` antecedent, dated erratum block at `N2-P0.lean:161`; P0-record note added; the amended file elaborates OK in runs 20–21; ledger 15/15 stands as history).
- **P2-a (windowFinite_LFunction) IN FLIGHT**: first elaborations runs 20–21 (10 → 8 errors, all in the P2-a block; the 14/14 triad state below line 720 is untouched and error-free). Four name-resolution classes fixed at run 21 (namespace AnalyticAt; Continuous.preimage_isClosed; IsBounded/isBounded_iff_subset_closedBall; two-preimage closedness). Remaining 8 errors: see `logs/n2-p1-run21.log` header + error list. 4 of the ≤6 P2 runs spent; parked at sha d4efc4ff… per the hard-stop rule.
- **P2-b (strip immunity) / P2-c (port) NOT STARTED** — spec current in the dossier §Proof-strategy steps 4–5; the P2-b API facts pinned this session: `DirichletCharacter.LSeries_changeLevel` (EulerProduct/DirichletLSeries.lean:173, exact form recorded above), `changeLevel_injective` (Basic.lean:79), `LSeries_ne_zero_of_one_lt_re` (Dirichlet.lean:233). P3 readiness: `factorization_identity_extension` (run 19) supplies the engine-input bridge; P3 is blocked only on P2-c.


## P2 state after runs 22–25 (R6, 2026-11-19) — grant 2/2 spent, ONE fixed-on-disk residual, parked

- **Riding item DONE (carried from A5)**: the N2-P0 erratum applied; the
  amended P0 file elaborates OK in runs 20–25.
- **P2-a (windowFinite_LFunction) STILL IN FLIGHT — not green, but at
  11→1 descent with the single residual FIXED ON DISK.** Error history:
  10 (r20) → 8 (r21) → 3 (r22) → 4-unmasked (r23) → 11-unmasked (r24,
  all in the never-elaborated hBbd body) → **1 (r25 — R6's own bad
  `abs_le.mp (le_abs_self T₁)` construction, one-line-fixed post-r25)**.
  Every residual across ALL of runs 20–25 is name-resolution/shape/tactic-
  field class — **zero math defects; the P2-a argument is unchanged since
  run 22** (entireness ⇒ isolated zeros ⇒ discrete ⇒ closed ⇒ compact-box
  finite; `isDiscrete_zeroSet` core GREEN since r22; hBcl/hBeq/hBbd/hBcp/
  hfin/tail all validated at r25). The 14/14 M1+M2+M3 triad core stayed
  error-free in every run; `windowFinite_LFunction`'s sorryAx is the
  failed-decl artifact only.
- **Budget: wave-4 ≤6 spent, then grant ≤2 spent (runs 24–25). Lane STOPPED
  per the ruling ("anything beyond = STOP + findings").** The next firing
  needs a new budget ruling; expected outcome GREEN (see resume note).
- **P2-b (strip immunity) / P2-c (port) NOT STARTED** — spec current in the
  dossier §Proof-strategy steps 4–5; the P2-b API facts stand as recorded
  above. P3 readiness: `factorization_identity_extension` (run 19) supplies
  the engine-input bridge; P3 is blocked only on P2-c. **P3 skeleton NOT
  drafted (both taskings conditioned it on P2-a GREEN — unmet at 1-residual
  depth).**


## NEXT-INSTANCE RESUME NOTE (R6 unit-2 close, parked disk sha ce6719c8af450eaa…)

EXACTLY ONE fix applied on disk AFTER run 25 (no run fired — grant 2/2
spent): the :772 `hnTa1 : -|T₁| ≤ T₁` construction replaced by the verified
one-liner `have h := le_abs_self (-T₁); rw [abs_neg] at h; linarith`
(le_abs_self confirmed Abs.lean:120; abs_neg in-scope by usage Abs.lean:35/
:75; the r25 error text showed the old form unifying to the trivial
`|T₁| ≤ |T₁|`). NOTHING else changed from the r25 input. **Expected: the
next run on sha ce6719c8… is P2-a GREEN — 15/15 file decls triad-clean
including `windowFinite_LFunction`, 0 sorry.** Fire it as the next
instance's first action after a budget ruling; verify-fire discipline
unchanged (pre-run sha guard in the log header). On GREEN: proceed to
P2-b (strip immunity — dossier step 4; API facts in the §P2 state above)
and then the P3 skeleton (V2 ζ-column + composed landing statements,
zero-sorry rung, hypothesis-binder pattern). On any residual: read the
:context (the only remaining never-green-path text is the nlinarith slack
hunk — if IT is the residual, try `nlinarith [hsre, hsim, hT1, hT2, hb1,
hb2]` or split the (2+A)² expansion into explicit pow-mono steps).
