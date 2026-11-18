# Pilot 75-N2 P1 — verification record (COMPLETE: M1+M2+M3 all GREEN-triad)

Lane A5, sessions 2026-11-17 (runs 1–8) + 2026-11-18 wave-3 (runs 9–15, M1+M2)
+ 2026-11-18 re-task (runs 16–19, M3). Charter chain: orchestrator P1 GO ruling
of 2026-11-17 (≤6-run fix-loop); restart charter 2026-11-18 (closure + one
fix+rerun + M2 + M3-if-budget); re-task 2026-11-18 (M3 execution, fresh ≤6-run
budget, verify-fire discipline, hard-stop rule). Dossier:
`research/candidates/75-N2-rayclass-dirichlet-consumer.md` §Pilot spec skeleton
(P1) + §Proof-strategy steps 1–3. A1 folds the §10-format block below into
`qa/iter4-review/r3-verification-tables.md` (one-writer discipline). Evidence
of record: `pilots/75/logs/n2-p1-run{1..19}.log` (per-run provenance headers
with verify-fire shas + error-class analyses; **run 19 = the verified state**,
sha ca1089e2a0c1…).

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
- **P0 amendment owed** (the FIND above): add `hnp` to
  `DirichletFactorizationTransferQ`.

— end record (A5, 2026-11-18; P1 COMPLETE — M1+M2+M3 GREEN-triad at run 19).
