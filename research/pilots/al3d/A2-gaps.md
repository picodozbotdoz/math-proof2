# A2-gaps — mathlib gaps and transport obstructions (lane A4, AL-P2, 2026-11-17)

Mathlib pin `ff2494ea` (v4.36.0-rc2). Each item: what is missing, file:line evidence of the
near-miss API, and how A2 bridges it in-file (all bridges are mathlib-only re-proofs at the
needed generality — per the G5a boundary nothing is imported from the donor tree; patterns
follow the donor's mathlib-extension files, cited per lemma in A2.lean).

## 1. L2-operator-norm relabelling bound — MISSING in mathlib

`Mathlib/Analysis/CStarAlgebra/Matrix.lean` carries the L2-operator C*-structure
(`l2_opNorm_def` :196, `l2_opNorm_mulVec` :220, `l2_opNorm_conjTranspose` :202,
`l2_opNorm_conjTranspose_mul_self` :210) but NO submatrix/reindexing bound
(`grep -rn "submatrix" Mathlib/Analysis/ | grep -i norm` — empty). Near-miss API:
`Matrix.l2_opNorm_mulVec` + `ContinuousLinearMap.opNorm_le_bound` make the port short.
A2 bridge: `Arealaw.l2_opNorm_submatrix_le` / `l2_opNorm_submatrix` (A2.lean,
support layer II; pattern `AreaLawForMathlib/Analysis/CStarAlgebra/Matrix.lean:71–96`).

## 2. Identity-Kronecker padding bound — MISSING in mathlib

`‖A ⊗ₖ (1 : Matrix p p)‖ ≤ ‖A‖` — no kronecker-norm lemma exists in
`Mathlib/Analysis/` (`grep -rn "kronecker" Mathlib/Analysis/` finds only
`PosSemidef.kronecker` in `Mathlib/Analysis/Matrix/Order.lean:188`, which is order-theoretic).
Near-miss API: `EuclideanSpace.norm_sq_eq` + `Fintype.sum_prod_type` + `gcongr`.
A2 bridge: `Arealaw.l2_opNorm_kronecker_one_le` and, via the kronecker factorization
`extendId_eq_kronecker`, `Arealaw.l2_opNorm_extendId_le` (support layer II; pattern
`AreaLawForMathlib/Analysis/CStarAlgebra/Matrix.lean:93–104`, `Region/PartialTrace.lean:274`).

## 3. Trace-of-cfc bridge and von-Neumann reindex-invariance — MISSING in mathlib

`Tr f(A) = ∑ f(eigenvalueᵢ)` for Hermitian `A` and real `f`: mathlib has
`Matrix.IsHermitian.cfc` (`Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean:133`)
and `Matrix.IsHermitian.eigenvalues` (`Mathlib/Analysis/Matrix/Spectrum.lean:67`) but not the
combination (the donor's own extension file says exactly this, vendored
`QuantumInfo/Entropy/VonNeumann.lean:29–31`). Consequently the von-Neumann entropy's
invariance under reindex-conjugation is also absent. Near-miss API: `IsHermitian.cfc`
(spectral-theorem form) + `Matrix.trace_mul_cycle` close it by `simp`.
A2 bridge: `Arealaw.trace_cfc`, `vonNeumann_eq_H`, `eigenvalues_multiset_submatrix_equiv`
(via `Matrix.charpoly_reindex`, `Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:176`),
`vonNeumann_submatrix_equiv` (support layer III; patterns
`QuantumInfo/ClassicalInfo/Entropy.lean:21–33`, `QuantumInfo/Entropy/VonNeumann.lean:31–49`).

NOT a gap (present in mathlib, cited): Loewner-transport — `Matrix.le_iff`
(`Mathlib/Analysis/Matrix/Order.lean:54`), `Matrix.PosSemidef.submatrix`
(`Mathlib/LinearAlgebra/Matrix/PosDef.lean:83`), `Matrix.IsHermitian.submatrix`
(`Mathlib/LinearAlgebra/Matrix/Hermitian.lean:102`) — the P2-d gap-transport rides these
directly (donor `Cylinder3D.lean:415` pattern).

## 4. equivFin-choice transport (PARKED obstruction at `colEquivVar_left`, 2026-11-17)

Not a mathlib gap but the pilot's own transport obstruction — the P2-d "reindex-conjugation"
risk materializing at P2-c (recorded per the r5 §11d overrun rule).

The per-region regrouping `colEquivVar` uses the column enumeration
`colToFin Λ u := Fintype.equivFin ↥(col Λ u)`, whose value depends on the (classical)
`Fintype` instance, so `colToFin Λ (proj site)` and `colToFin Λ u` are only propositionally
equal along `proj site = u` (site-membership in the column filter). The remaining P2-c goal
(`A2.lean:628`, run 23) is the per-index composite transport

    colEquivVarToFun f (colSiteOf Λ u hu i) = finFunctionFinEquiv.symm (f u) i

whose index side lives at `Fin (colCard Λ (proj site))` and target at `Fin (colCard Λ u)`.
Every direct `rw`/`simp only [hcol]` fails on motive-incorrectness (the membership proofs'
types mention `proj site`; `simp` silently skips the lemma — "unused simp argument" in
`alp2c-run23-parked.log`). `right_inv` (the other roundtrip) is GREEN via
`Equiv.symm_apply_apply`.

Candidate resolutions (next session):
(a) explicit `Fin.cast` + Subtype-cast plumbing — state `hc : colCard Λ (proj site) =
colCard Λ u` (provable: `colCard_eq_card` + `Finset.filter_congr'`), cast `i`, and close
with `Equiv.apply_symm_apply` modulo a `Subtype.ext rfl` argument-cast — ~30–60 lines of
`Eq.rec`-level care;
(b) a choice-free height-rank enumeration (donor-style canonical index): rank
`x ↦ (col Λ u).filter (·.2.2 < x.2.2) |>.card` with inverses via `Finset.min'` — heavier
(needs A1's `col_inj_on_z` order facts) but definitional-transparent.

## 5. Minor pin-level API notes (for the record)

- `Finset.sum_eq_zero` on this pin is a plain implication (not an iff) — use
  `Finset.sum_congr rfl h` + `Finset.sum_const_zero`.
- `SimpleGraph.Hom` is an abbreviation for `RelHom` (`Maps.lean:291`), whose second
  constructor field is `map_rel'`; `SimpleGraph.induce_adj` is an `rfl`-iff
  (`Maps.lean:229`), so induced-adjacency maps compose without case analysis.
- `Matrix.one_apply` must be fully qualified in `simp` sets here (bare `one_apply`
  resolves elsewhere and is reported "unused").
- P0's `Arealaw` defs live under `[DecidableEq σ]`; consumers must re-declare it.
