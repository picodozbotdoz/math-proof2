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

## 4. equivFin-choice transport (RESOLVED 2026-11-18, run 9 — neither path a/b; see below)

Not a mathlib gap but the pilot's own transport obstruction — the P2-d "reindex-conjugation"
risk materializing at P2-c (recorded per the r5 §11d overrun rule). **RESOLVED by
restructuring, not by proving**: `colEquivVar` is now an EQUIV-COMPOSITION
`heightCasts ∘ (regEquivOfEq (projF_fibre Λ hX')).symm ∘ (regReindexEquiv (fibre Λ X') q).symm`
(A2.lean, run 9) — every component is an Equiv by construction, so both roundtrips are
inherited and the per-index choice transport (`Fintype.equivFin` along `proj site = u`) is
never owed; `colEquivVar_left`/`colEquivVar_right` are deleted outright. The previous
session's on-disk draft (piCongrLeft' applied to `regEquivOfEq`) was a type error —
`Equiv.piCongrLeft'` wants a BASE-space equiv, `regEquivOfEq` is a pi-type equiv — never
elaborated (termination hit before any run). The pointwise defs `colEquivVarToFun`/
`colEquivVarInvFun` remain as documentation of the donor's entrywise action only.
Discipline for P2-d: the `.symm` side (where the equivFin choice transports live) is never
unwrapped; values are pinned by roundtrips (`Equiv.apply_symm_apply`) and the `toFun` side
is rfl-transparent (`regReindexEquiv_apply`).

Historical record of the park (2026-11-17, run 23, `logs/alp2c-run23-parked.log`): the
per-region regrouping used the column enumeration `colToFin Λ u := Fintype.equivFin ↥(col Λ u)`,
whose value depends on the (classical) `Fintype` instance, so `colToFin Λ (proj site)` and
`colToFin Λ u` were only propositionally equal along `proj site = u`; the failing goal was
the per-index composite transport
`colEquivVarToFun f (colSiteOf Λ u hu i) = finFunctionFinEquiv.symm (f u) i`, whose index
side lived at `Fin (colCard Λ (proj site))` and target at `Fin (colCard Λ u)`. Every direct
`rw`/`simp only [hcol]` failed on motive-incorrectness. Pre-written paths (a) `Fin.cast` +
Subtype-cast plumbing and (b) choice-free height-rank enumeration were both superseded by
the composition fix (which is strictly cheaper: zero transport lemmas).

## 5. P2-d PARK (2026-11-18, runs 10–12): equivFin choice-dependence at the Λ-vs-fibre level — STATEMENT-LEVEL FIND #5

*(Iter-5 front-load: this section is consolidated, with scope/re-verify plan/budget/
fences, into `research/pilots/al3d/rebuild-precharter.md` — copy-paste-ready for the
iter-5 typeset; the section below remains the in-situ record.)*

**Landed (GREEN-triad, runs 10–12):** the P2-d generic layer — `vecMulVec_submatrix`,
`hasGlobalGap_submatrix` (note: `Matrix.PosSemidef.submatrix` fails `PartialOrder 𝕜`
synthesis in an `[RCLike 𝕜]` section on this pin — mathlib's own anonymous-constructor
proof shape is inlined instead), `mulVec_eq_smul_submatrix`, `star_dotProduct_comp`
(the dotProduct reindex lemmas are ROOT-namespace on this pin, not `Matrix.`), the
`toFun`-side entrywise API `regReindexEquiv_apply` (rfl — every component application
reduces), the roundtrip collapse `regReindexEquiv_comp_colEquivVar`, `fibre_subset`,
`sdiff_fibre_eq`.

**Parked with precise blocker:** the extend-relabel swap and the Hamiltonian
identification `hamiltonianVar (projF Λ) (colCard Λ) Ψ = (hamiltonian3D Λ Φ).submatrix ē ē`
(ē := `(regReindexEquiv Λ q).symm`). Their workhorse is the restriction-compat lemma

    colEquivVar Λ q X' hX' (restr hX' (regReindexEquiv Λ q x)) = restr (fibre_subset Λ X') x

which reduces (via `regReindexEquiv_comp_colEquivVar` + `regReindexEquiv_apply`, both
GREEN) per-site `u` to comparing

    heightCast (colRegEquiv (Λ := Λ) ū (x |col Λ ū))  =  colRegEquiv (Λ := fibre Λ X') ū (x |col (fibre Λ X') ū)

The two columns are propositionally equal (`col_fibre_eq`, GREEN) but distinct TERMS, so
the two `colRegEquiv`s carry distinct `Fintype ↥(col · ū)`-instance arguments and hence
unrelated `Fintype.equivFin`-enumeration values. The height cast bridges the card
(defeq-transparently eliminated by `cases` at variable cardinalities), but NOTHING
bridges the enumeration values: every `rw`/`simp` route into the goal dies on dependent
motives (the cast's opaque proof obstructs `kabstract` — same family as the §4 park),
and mathlib has no `Fintype.equivFin`-congruence lemma
(`Fintype.equivFin`-of-instance-prop-equal-types) to discharge the residual. The
comparison is not provable by the available rewriting techniques; its provability in
principle would require an equivFin-congruence property mathlib does not provide.

**The donor's own route (and the re-charter):** the donor never faces this because its
column enumeration is the CANONICAL z-index (`⟨x.2.2⟩`-height, `Cylinder3D.lean`
architecture) — choice-free. Under canonical enumerations (A2-gaps §4(b): rank
`x ↦ (col Λ u).filter (·.2.2 < x.2.2) |>.card`, bijection inverses via A1's
`col_inj_on_z` + `col_heights`), `col Λ u` and `col (fibre Λ X') u` enumerate IDENTICALLY
(both by z-rank) and the swap's per-site comparison closes by construction. Cost: rebuild
P2-b's `colRegEquiv`/`regReindexEquiv`/`colToFin` on the canonical enumeration and
re-verify the P2-b/P2-c layers against them (the GREEN statements are unchanged; only
the equiv-bodies move) — sized as the next unit's first milestone. P2-e (entropy
identification for column-closed cuts + final `SlabAreaLawColumnCuts3D` assembly) rides
the same rebuild (its partial-trace commutation has the identical per-column structure).

## 6. Minor pin-level API notes (for the record)

- **Runner-filter blind spot (found 2026-11-18, runs 10/12):** `run_pilot.py`'s error
  filter (`": error:" in l or l.startswith("error:")`) does NOT match Lean's
  `error(lean.synthInstanceFailed)` / `error(lean.unknownIdentifier)` line format
  (`": error("` — paren, not colon) — two runs read `errors=0` while carrying real
  errors; the run-11 addition of tail-200 output printing is the compensating
  diagnostic. Fix the filter when the runner is next touched.
- **`l2_opNorm_extendId_le` instance-plumbing (the P2-c closer — VERIFIED, run 13):** the
  L2-operator-Norm scoped instance for `Matrix (Reg loc T) (Reg loc T) 𝕜` needs the
  pi-Fintype `[∀ i, Fintype (loc i)]` in scope; the post-park rewrite had dropped it from
  the section variables — restored 2026-11-18 and VERIFIED by run 13
  (`logs/alp2-run13-p2c-closureverify.log`, verify-fire sha-guard 509f2368… pre = post):
  A2.lean OK, rc=0, 0 errors (open or hidden), 0 sorry, full-coverage audit triad-only —
  `l2_opNorm_extendId_le`, `projInteraction_norm_le`, `isAdmissible_projInteraction` all
  flipped to triad. P2-c closed at 100%.
- `Matrix.PosSemidef.submatrix` fails `PartialOrder 𝕜` instance synthesis in an
  `[RCLike 𝕜]` section on this pin — inline mathlib's own anonymous-constructor proof
  shape (`mapDomain` of the Finsupp quadratic form) instead (hasGlobalGap_submatrix).
- The dotProduct reindex lemmas (`dotProduct_comp_equiv_symm`,
  `comp_equiv_symm_dotProduct`) are ROOT-namespace on this pin, not `Matrix.`.
- `regReindexEquiv`'s `Λ` is implicit and `q` the first EXPLICIT argument — write
  `regReindexEquiv (Λ := …) q`; the positional `regReindexEquiv (fibre Λ X') q` puts the
  Finset in `q`'s slot (two sessions' drafts died on this).
- `regEquivOfEq` applied against a spelled pi-type needs `loc` EXPLICIT (e.g.
  `regEquivOfEq (loc := fun u => Fin (q ^ colCard (fibre Λ X') u)) …`) — leaving `loc`
  implicit makes Lean try higher-order pattern unification of `Reg ?loc X'` against
  the spelled type and fail (run 9, A2.lean:679).
- `Finset.sum_eq_zero` on this pin is a plain implication (not an iff) — use
  `Finset.sum_congr rfl h` + `Finset.sum_const_zero`.
- `SimpleGraph.Hom` is an abbreviation for `RelHom` (`Maps.lean:291`), whose second
  constructor field is `map_rel'`; `SimpleGraph.induce_adj` is an `rfl`-iff
  (`Maps.lean:229`), so induced-adjacency maps compose without case analysis.
- `Matrix.one_apply` must be fully qualified in `simp` sets here (bare `one_apply`
  resolves elsewhere and is reported "unused").
- P0's `Arealaw` defs live under `[DecidableEq σ]`; consumers must re-declare it.

## 7. §10-READY VERDICT BLOCK (for the r3-verification-tables funnel — A1 lifts; lane A4 does not edit r3-tables per the file-funnel ruling)

**Pilot:** AL-P2 (app `crossmath-pilot-al3d`, mathlib `ff2494ea`, v4.36.0-rc2, doz route).
**Milestone P2-c — GREEN (closed 100%):** the column regrouping chapter of the B.2
rung-stone. Content: the variable-height per-region regrouping `colEquivVar` (equiv-
composition: `heightCasts ∘ (regEquivOfEq (projF_fibre)).symm ∘ (regReindexEquiv
(fibre Λ X')).symm` — the run-23 choice-transport park discharged by construction,
neither pre-written path a/b), the projected interaction `projInteraction` with all three
admissibility clauses (`projInteraction_isHermitian`, `projInteraction_eq_zero`,
`projInteraction_norm_le` at `groupStrength h R J`), and the P2-c MAIN
`isAdmissible_projInteraction : IsAdmissibleVar (projLattice Λ) (projF Λ) R
(groupStrength h R J) (colCard Λ) (projInteraction Λ q Φ)` — over the four mathlib-only
support layers I–IV. **Evidence:** run 13 (`research/pilots/al3d/logs/
alp2-run13-p2c-closureverify.log`, verify-fire sha-guard 509f2368… pre = post):
P0.lean OK (probe, sorry ×3 probe-convention), A1.lean OK, **A2.lean OK rc=0** —
0 errors (open or hidden), 0 sorry, full-coverage inline `#print axioms` audit
TRIAD-ONLY (propext/Classical.choice/Quot.sound), every audited decl including the
former stragglers `l2_opNorm_extendId_le`/`projInteraction_norm_le`/
`isAdmissible_projInteraction`. Descent runs 9–12 logged same directory (run 12
isolated the one-line instance fix; runs 10/12 exposed the runner's
`error(lean.synthInstanceFailed)` filter blind spot — §6).
**Milestone P2-d — PARTIAL GREEN + honest park (statement-level find #5):** GREEN-triad
generic submatrix-conjugation transports (`vecMulVec_submatrix`, `hasGlobalGap_submatrix`,
`mulVec_eq_smul_submatrix`, `star_dotProduct_comp`) + entrywise/plumbing layer
(`regReindexEquiv_apply` rfl, `regReindexEquiv_comp_colEquivVar`, `fibre_subset`,
`sdiff_fibre_eq`). The extend-relabel swap and the Hamiltonian identification are NOT
provable as scoped: the restriction-compat workhorse reduces to comparing equivFin-
encodings of the same column through different classical Fintype instances (Λ vs fibre
level) — every rewrite route dies on dependent motives, no mathlib equivFin-congruence;
the donor's canonical z-rank enumeration is the re-charter (§5) — **iter-5 material**.
**Milestone P2-e — NOT attempted** (rides the same rebuild; §5).
**Suggested axcheck TARGETS row (H applies; placeholder name per re-task):**
`AxPilotAL3D_A2` → stage `research/pilots/al3d/` files `P0.lean A1.lean A2.lean`
(P0 first — probe; full-coverage inline audit already triad-only in run 13).
