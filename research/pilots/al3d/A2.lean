/-
PROOF ARTIFACT — AL-P2, the B.2 rung-stone (card per approval 2026-11-16: GO at P1-b
ratified; AL-P2 APPROVED at SPEC on crossmath-pilot-al3d). MILESTONE 1 of the P2
decomposition: the COLUMN REGROUPING equivalence — the variable-height generalization
of the donor's uniform-`h` `(Fin h → Fin q) ≃ Fin (q ^ h)` map (`Cylinder3D.lean`
architecture, pattern-only, mathlib-only).

P2 decomposition (this file grows by milestones; each elaborates sorry-strict):
- P2-a (DONE, recorded): statement amendments — find #3: the planar binder is
  instantiated at `groupStrength h R J := 2 ^ (h * (2*R+1)^2) * max J 1` (P0.lean, new
  def + header note; frozen layer untouched). Range R preserved by P1-a contraction.
- P2-b (DONE, m1 GREEN): `colSigmaEquiv` + `regReindexEquiv` + `colCard_le_h`.
- P2-c (CLOSED 100%, 2026-11-18, runs 9–13 — A2.lean OK, full-coverage audit triad-clean;
  run 13 `logs/alp2-run13-p2c-closureverify.log`): the
  projected interaction `Ψ := projInteraction` (grouping Φ-terms by exact projection via
  `projFib`; support clause via the P1-a diameter contraction `image_projF_mem_supportsG`;
  strength via the fibre bound `card_projFib_le` + the planar packing
  `card_le_of_mem_supportsG` at any `G ≤ planarLattice`) and `IsAdmissibleVar` at
  `(R, groupStrength h R J)`. Four mathlib-only support layers (glue/extendId calculus;
  L2-operator-norm relabelling/padding; spectral entropy relabelling; planar support
  packing — `A2-gaps.md`). PARK RESOLUTION (`A2-gaps.md` §4 — neither pre-written path
  a/b but a third, EQUIV-COMPOSITION): `colEquivVar` is defined as
  `heightCasts ∘ (regEquivOfEq (projF_fibre)).symm ∘ (regReindexEquiv (fibre Λ X')).symm`
  — every component is an Equiv by construction, so BOTH roundtrips are inherited and the
  per-index choice transport (`Fintype.equivFin` along `proj site = u`) never has to be
  proved; the pointwise-action defs `colEquivVarToFun/InvFun` are kept as documentation
  of the donor's entrywise action only (NOT the composite's underlying functions). The
  `Eq.rec`-motive motif of run 23's park is gone from the proof obligations entirely.
  CLOSURE TAIL (runs 10–13): runs 10/12 reported `errors=0` through a RUNNER-FILTER BLIND
  SPOT (`error(lean.synthInstanceFailed)` lines do not match the `": error:"` filter —
  recorded in A2-gaps §6); the real residual was `l2_opNorm_extendId_le`'s statement
  failing to synthesize `Norm (Matrix (Reg loc T) (Reg loc T) 𝕜)` — the previous session's
  post-park rewrite had dropped `[∀ i, Fintype (loc i)]` from the section variables (that
  decl was NEVER green: absent from runs 7/23/9–12 audits), cascading `sorryAx` into
  `projInteraction_norm_le`/`isAdmissible_projInteraction` via `unknown identifier`. The
  one-line fix (the binder, restored at the L2OpNorm section's `variable` line) was
  VERIFIED by run 13 (`logs/alp2-run13-p2c-closureverify.log`, verify-fire sha-guard
  509f2368… pre = post): A2.lean OK, rc=0, 0 errors (open or hidden), 0 sorry, and the
  FULL-COVERAGE inline audit is triad-only (propext/Classical.choice/Quot.sound) — every
  audited decl including `l2_opNorm_extendId_le`, `projInteraction_norm_le`,
  `isAdmissible_projInteraction`. P2-c is closed at 100%.
- P2-d (PARTIAL, PARKED 2026-11-18 with a PRECISE BLOCKER — statement-level find #5): the
  generic submatrix-conjugation transports (eigenvector `mulVec_eq_smul_submatrix`, gap
  `hasGlobalGap_submatrix`, unit norm `star_dotProduct_comp`, projector `vecMulVec_submatrix`)
  and the entrywise/plumbing layer (`regReindexEquiv_apply` — the `toFun` side is
  rfl-transparent; `regReindexEquiv_comp_colEquivVar` — the roundtrip collapse;
  `fibre_subset`, `sdiff_fibre_eq`) are GREEN-triad (runs 10–12). THE EXTEND-RELABEL SWAP
  AND THE `hamiltonianVar Λ' (colCard·) Ψ = H.submatrix e e` IDENTIFICATION ARE NOT
  PROVABLE AS SCOPED with the current regrouping: their workhorse (the restriction-compat
  lemma `colEquivVar (restr hX' (e x)) = restr hbig x`) reduces per-site to comparing
  `colRegEquiv`-encodings of the SAME column enumerated through DIFFERENT classical
  `Fintype.equivFin` instances (`col Λ u` vs `col (fibre Λ X') u` — propositionally equal
  Finsets, `col_fibre_eq`, but not definitionally equal terms, hence distinct instance
  arguments and unrelated classical enumeration values) — every rewriting route dies on
  dependent motives (the same family as the P2-c park, now at the Λ-vs-fibre level), and
  mathlib provides no `equivFin`-congruence lemma to discharge the residual. THE DONOR'S
  OWN ROUTE is
  the choice-free CANONICAL column enumeration (A2-gaps §4(b): z-rank via A1's
  `col_inj_on_z`/`col_heights`, the donor's `⟨x.2.2⟩` height index) — under canonical
  enumerations the two columns' encodings agree BY CONSTRUCTION and the swap goes through.
  That requires rebuilding P2-b's `colRegEquiv`/`regReindexEquiv` (and re-verifying P2-b/c
  against them) — sized and chartered as the NEXT unit (find #5 recorded in A2-gaps §5).
- P2-e: the entropy identification for column-closed cuts (whole columns = single
  sites) + the final assembly of `SlabAreaLawColumnCuts3D` via P1-b's boundary lift.

STATEMENT-LEVEL FIND #4 (at P2-e assembly planning, 2026-11-17; amended P0, re-GREEN as
probe in `logs/alp2-run8-substrate.log`): the landed `PlanarAreaLawVar` quantified
`∃ C` inside `∀ Λ' hU` (per-domain constant) while `SlabAreaLawColumnCuts3D` asserts a
uniform `∃ C` before `∀ Λ`, and it prefixed `∀ G ≤ planarLattice` OUTSIDE the
hypothesis with a G-independent conclusion (the empty-graph instantiation trivializes
the hypothesis class). Both are unprovable-as-landed scoping defects; P0's amended
binder is `∃ C, ∀ G ≤ planarLattice, ∀ Λ' hU, …` (one constant, every subgraph) and the
rung-stone consumes it directly — the prework §2.3's outer shape. The proof
instantiates `G := projLattice Λ` per Λ (find #1's honest boundary-lift graph).

SUBSTRATE RESTRUCTURE (same touch, recorded in run8's log): A1 dropped its textual
duplicates of P0's encoding defs and imports P0 (theorem texts unchanged, 22/22 triad);
the runner elaborates P0 → A1 → A2.

FENCES: no `AreaLaw3D` content (NOT A TARGET, Targets.md §A :23; C.1 :103, C.2 :111,
C.3 :117, C.4 :123); B.1 donor-owned (cite, never re-prove); full `SlabAreaLaw3D`
HARD-STOPPED (prework stop-gate ii). `PlanarAreaLawVar` binder NOT discharged here
(honesty ledger, prework §2.4; AAG 2103.02492 frustration-free 2D only; uniform
donor `area_law` rests on unrefereed [OAI265]).

Imports `A1` + `P0` (siblings; pilot-11 pattern; P0 first in the run order — it owns
the encoding defs since the A1 dedup). R3 fold applied at the m1 touch: A1's audit
tail carries all 22 theorems.
-/

import A1
import P0
import Mathlib.Algebra.Order.SuccPred
import Mathlib.Order.Cover
import Mathlib.Analysis.CStarAlgebra.Matrix
import Mathlib.Analysis.Matrix.Order
import Mathlib.LinearAlgebra.Matrix.Kronecker

namespace OpenAI.AL3D

open SimpleGraph

/-- Every site of `ℤ³` carries `Fin q` (donor spelling; needed here for the target
type of the regrouping). -/
abbrev Qudits3D (q : ℕ) : ℤ × ℤ × ℤ → Type := fun _ => Fin q

/-- The height of column `u` in `Λ` (the local planar dimension is `q ^ colCard`);
spelled via `Fintype.card` so the per-column reindexing typechecks definitionally. -/
def colCard (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) : ℕ :=
  Fintype.card ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ))

theorem colCard_eq_card (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) :
    colCard Λ u = (col Λ u).card := Fintype.card_coe _

/-! ## P2-b — the column regrouping equivalence -/

/-- Sigma decomposition of a 3D domain into its columns (the fibres of `proj`;
classical bijection, proof by `Subtype.ext`/column-membership). -/
def colSigmaEquiv (Λ : Finset (ℤ × ℤ × ℤ)) :
    ↥((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) ≃
      Σ u : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
        ↥((col Λ (u : ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) where
  toFun x := ⟨⟨proj (x : ℤ × ℤ × ℤ), Finset.mem_image_of_mem proj x.2⟩,
    ⟨(x : ℤ × ℤ × ℤ), mem_col_of_proj Λ _ x.2 rfl⟩⟩
  invFun p := ⟨(p.2 : ℤ × ℤ × ℤ), col_subset Λ _ p.2.2⟩
  left_inv _ := rfl
  right_inv p := by
    obtain ⟨⟨u, -⟩, x, hxcol⟩ := p
    have hxu : proj (x : ℤ × ℤ × ℤ) = u := (Finset.mem_filter.1 hxcol).2
    subst hxu
    rfl

/-- The per-column configuration equivalence: a column of height `n` carrying `Fin q`
per site ≃ one site carrying `Fin (q ^ n)` (the donor's `finFunctionFinEquiv` map,
generalized from uniform `h` to the column height; pin anchor
`Mathlib/Algebra/BigOperators/Fin.lean:577`). -/
noncomputable def colRegEquiv {Λ : Finset (ℤ × ℤ × ℤ)} {q : ℕ} (u : ℤ × ℤ) :
    (∀ x : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) ≃
      Fin (q ^ colCard Λ u) :=
  (Equiv.piCongrLeft' (fun _ : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) =>
      Fin q) (Fintype.equivFin _)).trans
    (finFunctionFinEquiv (m := q) (n := colCard Λ u))

/-- P2-b MAIN: the column regrouping — 3D configurations over `Λ` (each site `Fin q`)
≃ planar variable-height configurations over `proj '' Λ` (column `u` one site of
`Fin (q ^ colCard Λ u)`). This is the reindexing the rung-stone's Hamiltonian
comparison and the entropy identification ride on (donor `Cylinder3D` architecture,
variable-height generalization). -/
noncomputable def regReindexEquiv {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) :
    (∀ x : ↥((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Qudits3D q (x : ℤ × ℤ × ℤ)) ≃
      ∀ u : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
        Fin (q ^ colCard Λ (u : ℤ × ℤ)) :=
  (Equiv.piCongrLeft' (fun _ => Fin q) (colSigmaEquiv Λ)).trans
    ((Equiv.piCurry (fun _ _ => Fin q)).trans
      (Equiv.piCongrRight (fun u => colRegEquiv (u : ℤ × ℤ))))

/-! ## Slab heights feed the planar binder's `hU ≤ h` side condition -/

/-- `colCard` is exactly the height profile the projected system carries, and slab
domains bound it by `h` (consumes A1's `col_card_le`; the `∀ u ∈ Λ'`-side of the
`PlanarAreaLawVar` application). -/
theorem colCard_le_h (h : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)} (hΛ : IsSlabDomain3D h Λ) :
    ∀ u ∈ projF Λ, colCard Λ u ≤ h := fun u _ =>
  colCard_eq_card Λ u ▸ col_card_le h hΛ u

/-! ## Inline full-coverage axiom audit (71/73 convention; every top-level decl). -/

#print axioms colCard_eq_card
#print axioms colCard_le_h

end OpenAI.AL3D

/-! ## P2 support layer I — region calculus (`glue`/`extendId`)

Mathlib-only re-proofs of the vendored `AreaLawForMathlib` patterns (the donor tree's
mathlib-extension files — `AreaLawForMathlib/QuantumInfo/Region/{Basic,PartialTrace}.lean`;
per the G5a boundary nothing is imported: each lemma is re-proved here at the generality
this pilot needs, source noted per lemma; the underlying mathlib gaps are recorded in
`A2-gaps.md`). -/

namespace Arealaw

section Region

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*} {S T U : Finset σ}

/-- Gluing then restricting to the subregion returns the subregion part
(pattern: vendored `Region/Basic.lean:51`). -/
@[simp] theorem restr_glue (h : S ⊆ T) (x : Reg loc S) (z : Reg loc (T \ S)) :
    restr h (glue x z) = x :=
  funext fun i => dif_pos i.2

/-- Gluing then restricting to the complement returns the complement part
(pattern: vendored `Region/Basic.lean:60`). -/
@[simp] theorem restr_glue_compl (x : Reg loc S) (z : Reg loc (T \ S)) :
    restr (S := T \ S) (T := T) Finset.sdiff_subset (glue x z) = z :=
  funext fun i => dif_neg (Finset.mem_sdiff.1 i.2).2

/-- A configuration is recovered from its two restrictions
(pattern: vendored `Region/Basic.lean:65`). -/
@[simp] theorem glue_restr (h : S ⊆ T) (w : Reg loc T) :
    glue (restr h w) (restr (S := T \ S) (T := T) Finset.sdiff_subset w) = w :=
  funext fun j => by simp [restr, glue]

/-- `glue` and the two restrictions assemble to an equivalence
`Reg S × Reg (T \ S) ≃ Reg T` (pattern: vendored `Region/Basic.lean:86`). -/
def glueEquiv (h : S ⊆ T) : Reg loc S × Reg loc (T \ S) ≃ Reg loc T where
  toFun p := glue p.1 p.2
  invFun w := (restr h w, restr (S := T \ S) (T := T) Finset.sdiff_subset w)
  left_inv p := Prod.ext (restr_glue h p.1 p.2) (restr_glue_compl p.1 p.2)
  right_inv := glue_restr h

@[simp] theorem glueEquiv_apply (h : S ⊆ T) (p : Reg loc S × Reg loc (T \ S)) :
    glueEquiv h p = glue p.1 p.2 := rfl

@[simp] theorem glueEquiv_symm_apply (h : S ⊆ T) (w : Reg loc T) :
    (glueEquiv h).symm w =
      (restr h w, restr (S := T \ S) (T := T) Finset.sdiff_subset w) := rfl

/-- Transport of configurations along an equality of regions
(pattern: vendored `Region/Basic.lean:127`, verbatim). -/
def regEquivOfEq (hst : S = T) : Reg loc S ≃ Reg loc T where
  toFun := restr (le_of_eq hst.symm)
  invFun := restr (le_of_eq hst)
  left_inv _ := rfl
  right_inv _ := rfl

@[simp] theorem regEquivOfEq_apply (hst : S = T) (z : Reg loc S) :
    regEquivOfEq hst z = restr (le_of_eq hst.symm) z := rfl

@[simp] theorem regEquivOfEq_symm_apply (hst : S = T) (w : Reg loc T) :
    (regEquivOfEq (loc := loc) hst).symm w = restr (le_of_eq hst) w := rfl

section DecEqLoc

variable [DecidableEq σ] [∀ i, DecidableEq (loc i)] {𝕜 : Type*} [RCLike 𝕜]

/-- Extension by the identity kills zero (pattern: vendored
`Region/PartialTrace.lean:205`). -/
@[simp] theorem extendId_zero (h : S ⊆ T) :
    extendId h (0 : Matrix (Reg loc S) (Reg loc S) 𝕜) = 0 := by
  ext w w'
  simp [extendId]

/-- Extension by the identity is additive (pattern: vendored
`Region/PartialTrace.lean:211`). -/
@[simp] theorem extendId_add (h : S ⊆ T) (A B : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId h (A + B) = extendId h A + extendId h B := by
  ext w w'
  simp [extendId, apply_ite₂]

/-- Extension by the identity commutes with finite sums (pattern: vendored
`Region/PartialTrace.lean:267`). -/
theorem extendId_sum {κ : Type*} (h : S ⊆ T) (s : Finset κ)
    (f : κ → Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId h (∑ k ∈ s, f k) = ∑ k ∈ s, extendId h (f k) :=
  map_sum (AddMonoidHom.mk' (extendId h) (extendId_add h)) f s

/-- How `extendId` acts on glued configurations: diagonal on the added region, `A` on
the subregion (pattern: vendored `Region/PartialTrace.lean:224`). -/
@[simp] theorem extendId_apply_glue (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜)
    (u u' : Reg loc S) (z z' : Reg loc (T \ S)) :
    extendId h A (glue u z) (glue u' z') = if z = z' then A u u' else 0 := by
  simp only [extendId, Matrix.of_apply]
  rw [restr_glue_compl, restr_glue_compl, restr_glue, restr_glue]

/-- Extension by the identity is transitive: `(A ⊗ 1_{T∖S}) ⊗ 1_{V∖T} = A ⊗ 1_{V∖S}`
(pattern: vendored `Region.lean:404`). -/
theorem extendId_extendId {V : Finset σ} (hST : S ⊆ T) (hTV : T ⊆ V)
    (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId hTV (extendId hST A) = extendId (hST.trans hTV) A := by
  ext w w'
  have hiff : (restr (S := V \ T) (T := V) Finset.sdiff_subset w =
        restr (S := V \ T) (T := V) Finset.sdiff_subset w' ∧
      restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w) =
        restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w')) ↔
      restr (S := V \ S) (T := V) Finset.sdiff_subset w =
        restr (S := V \ S) (T := V) Finset.sdiff_subset w' := by
    simp only [restr, Finset.restrict₂, funext_iff, Subtype.forall, Finset.mem_sdiff]
    constructor
    · rintro ⟨h1, h2⟩ i ⟨hiV, hiS⟩
      by_cases hiT : (i : σ) ∈ T
      · exact h2 i ⟨hiT, hiS⟩
      · exact h1 i ⟨hiV, hiT⟩
    · intro h
      exact ⟨fun i hi ↦ h i ⟨hi.1, fun hS ↦ hi.2 (hST hS)⟩, fun i hi ↦ h i ⟨hTV hi.1, hi.2⟩⟩
  simp only [extendId, Matrix.of_apply]
  by_cases hc1 : restr (S := V \ T) (T := V) Finset.sdiff_subset w =
      restr (S := V \ T) (T := V) Finset.sdiff_subset w'
  · by_cases hc2 : restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w) =
        restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w')
    · rw [if_pos hc1, if_pos hc2, if_pos (hiff.1 ⟨hc1, hc2⟩)]
      rfl
    · rw [if_pos hc1, if_neg hc2, if_neg (fun hc3 => hc2 (hiff.2 hc3).2)]
  · rw [if_neg hc1, if_neg (fun hc3 => hc1 (hiff.2 hc3).1)]

/-- Extension by the identity preserves Hermitianness (pattern: vendored
`Region/PartialTrace.lean:248`; proved entrywise here). -/
theorem isHermitian_extendId (h : S ⊆ T) {A : Matrix (Reg loc S) (Reg loc S) 𝕜}
    (hA : A.IsHermitian) : (extendId h A).IsHermitian := by
  rw [Matrix.IsHermitian]
  ext w w'
  simp only [Matrix.conjTranspose_apply, extendId, Matrix.of_apply]
  by_cases hc : restr (S := T \ S) (T := T) Finset.sdiff_subset w =
      restr (S := T \ S) (T := T) Finset.sdiff_subset w'
  · rw [if_pos hc.symm, if_pos hc, ← Matrix.conjTranspose_apply, hA]
  · rw [if_neg (fun hh => hc hh.symm), if_neg hc, star_zero]

end DecEqLoc

end Region

/-! ## P2 support layer II — the L2 operator norm under relabelling and identity padding

Mathlib (pin `ff2494ea`) carries the L2-operator-norm C*-structure on matrices
(`Mathlib/Analysis/CStarAlgebra/Matrix.lean`) but has no submatrix/reindexing bound and
no identity-Kronecker padding bound; both are re-proved here at the needed generality
(patterns: the donor tree's mathlib-extension file
`AreaLawForMathlib/Analysis/CStarAlgebra/Matrix.lean:60–104`, mathlib-only in content).
Recorded in `A2-gaps.md`. -/

section L2OpNorm

open scoped Matrix.Norms.L2Operator Kronecker
open Matrix

variable {𝕜 : Type*} [RCLike 𝕜] {m n p q ι : Type*}
  [Fintype m] [Fintype n] [Fintype p] [Fintype q]
  [DecidableEq m] [DecidableEq n] [DecidableEq p] [DecidableEq q]

/-- The Euclidean norm of a subvector along an injection: injectivity keeps a
coordinate from being counted twice. -/
theorem euclidean_norm_comp_le (y : n → 𝕜) {f : p → n} (hf : Function.Injective f) :
    ‖(EuclideanSpace.equiv p 𝕜).symm (y ∘ f)‖ ≤ ‖(EuclideanSpace.equiv n 𝕜).symm y‖ := by
  rw [EuclideanSpace.norm_eq, EuclideanSpace.norm_eq]
  gcongr
  exact (Finset.sum_map _ ⟨f, hf⟩ fun j => ‖y j‖ ^ 2).symm.trans_le
    (Finset.sum_le_univ_sum_of_nonneg fun _ => by positivity)

/-- Upper-bound criterion for the L2 operator norm; the converse direction is
`Matrix.l2_opNorm_mulVec`. -/
theorem l2_opNorm_le_bound (A : Matrix m n 𝕜) {c : ℝ} (hc : 0 ≤ c)
    (h : ∀ x : EuclideanSpace 𝕜 n,
      ‖(EuclideanSpace.equiv m 𝕜).symm (A *ᵥ WithLp.ofLp x)‖ ≤ c * ‖x‖) : ‖A‖ ≤ c :=
  ContinuousLinearMap.opNorm_le_bound _ hc h

/-- Selecting rows along an injection cannot increase the norm. -/
theorem l2_opNorm_submatrix_id_le (A : Matrix m n 𝕜) {f : p → m}
    (hf : Function.Injective f) : ‖A.submatrix f id‖ ≤ ‖A‖ :=
  l2_opNorm_le_bound _ (norm_nonneg _) fun x =>
    (euclidean_norm_comp_le (A *ᵥ WithLp.ofLp x) hf).trans (Matrix.l2_opNorm_mulVec A x)

/-- Taking a submatrix along injections does not increase the L2 operator norm.
Injectivity is necessary: duplicating the row of `(1 : Matrix Unit Unit ℝ)` gives norm
`√2`. -/
theorem l2_opNorm_submatrix_le (A : Matrix m n 𝕜)
    {f : p → m} {g : q → n} (hf : Function.Injective f) (hg : Function.Injective g) :
    ‖A.submatrix f g‖ ≤ ‖A‖ := by
  classical
  refine le_trans ?_ (l2_opNorm_submatrix_id_le A hf)
  rw [← Matrix.l2_opNorm_conjTranspose (A.submatrix f id), ← Matrix.l2_opNorm_conjTranspose]
  exact l2_opNorm_submatrix_id_le (A.submatrix f id)ᴴ hg

/-- The L2 operator norm is invariant under reindexing along equivalences. -/
@[simp] theorem l2_opNorm_submatrix (A : Matrix m n 𝕜) (e : p ≃ m) (f : q ≃ n) :
    ‖A.submatrix e f‖ = ‖A‖ :=
  le_antisymm (l2_opNorm_submatrix_le A e.injective f.injective)
    (by simpa using l2_opNorm_submatrix_le (A.submatrix e f) e.symm.injective f.symm.injective)

/-- Pythagoras over a product index. -/
theorem euclidean_norm_sq_prod (v : EuclideanSpace 𝕜 (m × p)) :
    ‖v‖ ^ 2 = ∑ b : p, ‖(EuclideanSpace.equiv m 𝕜).symm fun i => v.ofLp (i, b)‖ ^ 2 := by
  simp [EuclideanSpace.norm_sq_eq, Fintype.sum_prod_type_right]

/-- `A ⊗ₖ 1` acts fibrewise: on the fibre over `b` of the second factor it is `A`. -/
theorem kronecker_one_mulVec_apply [DecidableEq p] [Fintype ι] (A : Matrix ι n 𝕜)
    (v : n × p → 𝕜) (i : ι) (b : p) :
    ((A ⊗ₖ (1 : Matrix p p 𝕜)) *ᵥ v) (i, b) = (A *ᵥ fun j => v (j, b)) i := by
  simp only [mulVec, dotProduct, Matrix.kroneckerMap_apply, Fintype.sum_prod_type,
    Matrix.one_apply, Prod.mk.injEq, mul_ite, mul_zero, mul_one, Finset.sum_ite_eq,
    Finset.sum_ite_eq']
  simp

/-- Padding on the right by an identity factor does not increase the L2 operator norm. -/
theorem l2_opNorm_kronecker_one_le [DecidableEq p] (A : Matrix m n 𝕜) :
    ‖A ⊗ₖ (1 : Matrix p p 𝕜)‖ ≤ ‖A‖ := by
  refine l2_opNorm_le_bound _ (norm_nonneg _) fun x => ?_
  refine (sq_le_sq₀ (norm_nonneg _) (by positivity)).mp ?_
  rw [euclidean_norm_sq_prod, mul_pow, euclidean_norm_sq_prod, Finset.mul_sum]
  simp_rw [← mul_pow]
  gcongr with b _
  simpa [kronecker_one_mulVec_apply] using
    Matrix.l2_opNorm_mulVec A ((EuclideanSpace.equiv n 𝕜).symm fun j => x.ofLp (j, b))

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*} [∀ i, Fintype (loc i)]
  [∀ i, DecidableEq (loc i)] {S T : Finset σ}

/-- `extendId` is the Kronecker product with the identity, transported along `glueEquiv`
(pattern: vendored `Region/PartialTrace.lean:230`). -/
theorem extendId_eq_kronecker (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId h A = (Matrix.kroneckerMap (· * ·) A
        (1 : Matrix (Reg loc (T \ S)) (Reg loc (T \ S)) 𝕜)).submatrix
      (glueEquiv h).symm (glueEquiv h).symm := by
  ext w w'
  simp [extendId, Matrix.one_apply, Matrix.kroneckerMap_apply, Matrix.submatrix_apply]

/-- Extension by the identity does not increase the L2 operator norm
(pattern: vendored `Region/PartialTrace.lean:274`). -/
theorem l2_opNorm_extendId_le (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    ‖extendId h A‖ ≤ ‖A‖ := by
  rw [extendId_eq_kronecker, l2_opNorm_submatrix]
  exact l2_opNorm_kronecker_one_le A

end L2OpNorm

/-! ## P2 support layer III — the spectral entropy under relabelling

`Arealaw.vonNeumann` (P0) equals the Shannon entropy of the eigenvalue family, and
relabeling the index preserves it. Mathlib has the pieces (`IsHermitian.cfc`,
`IsHermitian.eigenvalues`, `charpoly_reindex`) but neither the trace-of-cfc bridge nor
the invariance; re-proved here (patterns: the donor tree's mathlib-extension files
`QuantumInfo/ClassicalInfo/Entropy.lean` and `QuantumInfo/Entropy/VonNeumann.lean`,
mathlib-only in content). Recorded in `A2-gaps.md`. -/

section Entropy

open Matrix

variable {𝕜 : Type*} [RCLike 𝕜] {n : Type*} [Fintype n] [DecidableEq n]

/-- Shannon entropy of a finite real family `p : ι → ℝ`, `H p = ∑ i, -p i · log (p i)`. -/
noncomputable def H {ι : Type*} [Fintype ι] (p : ι → ℝ) : ℝ := ∑ i, Real.negMulLog (p i)

/-- `H p` is the sum of `Real.negMulLog` over the multiset of values of `p`. -/
theorem H_eq_multiset_sum {ι : Type*} [Fintype ι] (p : ι → ℝ) :
    H p = (Multiset.map (fun x => Real.negMulLog x) (Finset.univ.val.map p)).sum := by
  rw [H, Finset.sum_eq_multiset_sum, Multiset.map_map, Function.comp_def]

/-- `H` depends only on the multiset of values. -/
theorem H_eq_of_multiset_eq {ι κ : Type*} [Fintype ι] [Fintype κ] {p : ι → ℝ} {q : κ → ℝ}
    (h : Finset.univ.val.map p = Finset.univ.val.map q) : H p = H q := by
  rw [H_eq_multiset_sum, H_eq_multiset_sum, h]

/-- Trace-spectrum bridge: for Hermitian `A` and real `f`, the trace of `f(A)` is
`∑ f(eigenvalueᵢ)`. -/
theorem trace_cfc {A : Matrix n n 𝕜} (hA : A.IsHermitian) (f : ℝ → ℝ) :
    (hA.cfc f).trace = ∑ i, ((f (hA.eigenvalues i) : ℝ) : 𝕜) := by
  simp [IsHermitian.cfc, trace_mul_cycle]

/-- The operator definition `-tr(ρ log ρ)` equals the Shannon entropy of the
eigenvalues. -/
theorem vonNeumann_eq_H {ρ : Matrix n n 𝕜} (hρ : ρ.IsHermitian) :
    vonNeumann hρ = H hρ.eigenvalues := by
  simp [vonNeumann, trace_cfc, H, Real.negMulLog]

/-- Reindexing a Hermitian matrix leaves its eigenvalue multiset unchanged. -/
theorem eigenvalues_multiset_submatrix_equiv {m : Type*} [Fintype m] [DecidableEq m]
    {A : Matrix n n 𝕜} (hA : A.IsHermitian) (e : m ≃ n) :
    Finset.univ.val.map (hA.submatrix e).eigenvalues = Finset.univ.val.map hA.eigenvalues := by
  refine Multiset.map_injective (RCLike.ofReal_injective (K := 𝕜)) ?_
  rw [Multiset.map_map, Multiset.map_map, ← (hA.submatrix e).roots_charpoly_eq_eigenvalues,
    ← hA.roots_charpoly_eq_eigenvalues]
  exact congrArg Polynomial.roots (charpoly_reindex e.symm A)

/-- The von Neumann entropy does not see a relabelling of the index. -/
theorem vonNeumann_submatrix_equiv {m : Type*} [Fintype m] [DecidableEq m]
    {A : Matrix n n 𝕜} (hA : A.IsHermitian) (e : m ≃ n) :
    vonNeumann (hA.submatrix e) = vonNeumann hA := by
  simpa [vonNeumann_eq_H] using H_eq_of_multiset_eq (eigenvalues_multiset_submatrix_equiv hA e)

end Entropy

end Arealaw

namespace OpenAI.AL3D

open Arealaw
open scoped Matrix.Norms.L2Operator
open Matrix SimpleGraph

/-! ## P2 support layer IV — planar boxes (support packing at `G ≤ planarLattice`)

The donor's `card_le_of_mem_supports` chain (`Cylinder3DSupport.lean:150–261`), ported
to the ambient-graph `supportsG` at any `G ≤ planarLattice`: subgraphs have larger
distances, so a `G`-admissible support is a planar admissible support, of size at most
`(2R+1)²`. -/

/-- Distances shrink when the graph grows: `G ≤ H` gives `H.edist ≤ (G.induce s).edist`
on `s` (mathlib's `SimpleGraph.Hom.edist_le` along the coe-hom). -/
theorem edist_induce_le_of_adj_le {V : Type*} {G H : SimpleGraph V} (h : G ≤ H) (s : Set V)
    (u v : s) : (H.induce s).edist u v ≤ (G.induce s).edist u v := by
  exact SimpleGraph.Hom.edist_le
    (RelHom.mk (fun x : s => x) fun hadj => h hadj) u v

/-- The ambient distance on `ℤ × ℤ` is the sup-distance of the coordinates
(donor `Cylinder3DSupport.lean:186`). -/
theorem planar_dist_eq_max_abs (x y : ℤ × ℤ) :
    dist x y = ((max |x.1 - y.1| |x.2 - y.2| : ℤ) : ℝ) := by
  rw [Prod.dist_eq, Int.dist_eq, Int.dist_eq]
  push_cast
  rfl

theorem planar_dist_le_iff {x y : ℤ × ℤ} {k : ℕ} :
    dist x y ≤ k ↔ |x.1 - y.1| ≤ k ∧ |x.2 - y.2| ≤ k := by
  rw [planar_dist_eq_max_abs, ← Int.cast_natCast (R := ℝ), Int.cast_le, max_le_iff]

/-- Adjacent sites of the square lattice are at sup-distance one (donor
`Cylinder3DSupport.lean:194`, via A1's `planar_adj_iff`). -/
theorem planar_dist_eq_one_of_adj {x y : ℤ × ℤ} (h : planarLattice.Adj x y) :
    dist x y = 1 := by
  rw [planar_adj_iff] at h
  rw [planar_dist_eq_max_abs, Int.cast_eq_one]
  rcases h with ⟨h1 | h1, h2⟩ | ⟨h1 | h1, h2⟩ <;> simp [h2, ← h1]

/-- A walk of length `k` in an induced subgraph of the square lattice moves the
sup-distance by at most `k` (donor `Cylinder3DSupport.lean:198`). -/
theorem planar_dist_le_length_of_walk {s : Set (ℤ × ℤ)} {u v : s}
    (p : (planarLattice.induce s).Walk u v) : dist (u : ℤ × ℤ) v ≤ p.length := by
  induction p with
  | nil => simp
  | cons h p ih =>
      rw [Walk.length_cons, Nat.cast_add_one, add_comm]
      exact (dist_triangle _ _ _).trans
        (add_le_add (planar_dist_eq_one_of_adj (SimpleGraph.induce_adj.1 h)).le ih)

/-- A walk of length at most `n` exists iff the graph distance is at most `n`
(donor `Cylinder3DSupport.lean:203`). -/
theorem exists_walk_length_le_iff_edist_le {V : Type*} (G : SimpleGraph V) {u v : V} {n : ℕ} :
    (∃ p : G.Walk u v, p.length ≤ n) ↔ G.edist u v ≤ n := by
  constructor
  · rintro ⟨p, hp⟩
    exact p.edist_le.trans (by exact_mod_cast hp)
  · intro h
    obtain ⟨p, hp⟩ := SimpleGraph.exists_walk_of_edist_ne_top (ne_top_of_le_ne_top (by simp) h)
    exact ⟨p, by exact_mod_cast hp ▸ h⟩

/-- The ambient planar distance is bounded by the `G`-domain distance at any
`G ≤ planarLattice`. -/
theorem planar_dist_le_of_domainEDistG_le {G : SimpleGraph (ℤ × ℤ)} {Λ' : Finset (ℤ × ℤ)}
    {x y : ℤ × ℤ} {k : ℕ} (hG : G ≤ planarLattice) (h : domainEDistG G Λ' x y ≤ k) :
    dist x y ≤ k := by
  by_cases hxy : x ∈ Λ' ∧ y ∈ Λ'
  · have hmono : (planarLattice.induce (Λ' : Set (ℤ × ℤ))).edist ⟨x, hxy.1⟩ ⟨y, hxy.2⟩ ≤
        (G.induce (Λ' : Set (ℤ × ℤ))).edist ⟨x, hxy.1⟩ ⟨y, hxy.2⟩ :=
      edist_induce_le_of_adj_le hG (Λ' : Set (ℤ × ℤ)) ⟨x, hxy.1⟩ ⟨y, hxy.2⟩
    rw [domainEDistG_of_mem hxy.1 hxy.2] at h
    obtain ⟨p, hp⟩ := (exists_walk_length_le_iff_edist_le _).2 (hmono.trans h)
    exact (planar_dist_le_length_of_walk p).trans (by exact_mod_cast hp)
  · rw [domainEDistG, dif_neg hxy] at h
    exact absurd h (by simp)

theorem domainEDiamG_le_iff {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)} {r : ℕ∞} :
    domainEDiamG G Λ' X' ≤ r ↔ ∀ x ∈ X', ∀ y ∈ X', domainEDistG G Λ' x y ≤ r := by
  simp only [domainEDiamG, iSup₂_le_iff]

theorem mem_supportsG_iff {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)} {R : ℕ} :
    X' ∈ supportsG G Λ' R ↔ X' ⊆ Λ' ∧ X'.Nonempty ∧ domainEDiamG G Λ' X' ≤ R := by
  simp only [supportsG, Finset.mem_filter, Finset.mem_powerset]

/-- A `G`-admissible support of range `R` containing `a` lies in the planar box
`[a - (R, R), a + (R, R)]` (donor `Cylinder3DSupport.lean:226`, at ambient `G`). -/
theorem subset_Icc_of_mem_supportsG {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)}
    {R : ℕ} (hG : G ≤ planarLattice) (hX' : X' ∈ supportsG G Λ' R) {a : ℤ × ℤ}
    (ha : a ∈ X') :
    X' ⊆ Finset.Icc (a - ((R : ℤ), (R : ℤ))) (a + ((R : ℤ), (R : ℤ))) := by
  intro x hx
  obtain ⟨h1, h2⟩ := planar_dist_le_iff.1 <|
    planar_dist_le_of_domainEDistG_le hG
      (domainEDiamG_le_iff.1 ((mem_supportsG_iff.1 hX').2.2) x hx a ha)
  rw [abs_le] at h1 h2
  rw [Finset.mem_Icc, Prod.le_def, Prod.le_def]
  simp only [Prod.fst_sub, Prod.snd_sub, Prod.fst_add, Prod.snd_add]
  omega

theorem card_Icc_eq_mul (a b : ℤ × ℤ) :
    (Finset.Icc a b).card = (b.1 + 1 - a.1).toNat * (b.2 + 1 - a.2).toNat := by
  rw [Finset.card_Icc_prod, Int.card_Icc, Int.card_Icc]

theorem card_Icc_sub_add (a : ℤ × ℤ) (R : ℕ) :
    (Finset.Icc (a - ((R : ℤ), (R : ℤ))) (a + ((R : ℤ), (R : ℤ)))).card = (2 * R + 1) ^ 2 := by
  rw [card_Icc_eq_mul, sq]
  simp only [Prod.fst_sub, Prod.snd_sub, Prod.fst_add, Prod.snd_add]
  congr 1 <;> omega

/-- A `G`-admissible support of range `R` has at most `(2R + 1)²` sites, at any ambient
`G ≤ planarLattice` (donor `Cylinder3DSupport.lean:247`, at ambient `G`). -/
theorem card_le_of_mem_supportsG {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)} {R : ℕ}
    (hG : G ≤ planarLattice) (hX' : X' ∈ supportsG G Λ' R) : X'.card ≤ (2 * R + 1) ^ 2 := by
  obtain ⟨a, ha⟩ := (mem_supportsG_iff.1 hX').2.1
  exact (Finset.card_le_card (subset_Icc_of_mem_supportsG hG hX' ha)).trans
    (card_Icc_sub_add a R).le

/-! ## P2-c — the projected interaction `Ψ` and its admissibility -/

/-- The supports of the 3D interaction that group onto the planar support `X'`: subsets
`X ⊆ Λ` whose column projection is exactly `X'` (the donor's `fibre h X'`
(`Cylinder3D.lean:249`) at variable heights — no cylinder, so defined directly as a
filter of the powerset). -/
def projFib (Λ : Finset (ℤ × ℤ × ℤ)) (X' : Finset (ℤ × ℤ)) :
    Finset (Finset (ℤ × ℤ × ℤ)) :=
  Λ.powerset.filter fun X => X.image proj = X'

theorem mem_projFib {Λ : Finset (ℤ × ℤ × ℤ)} {X : Finset (ℤ × ℤ × ℤ)}
    {X' : Finset (ℤ × ℤ)} : X ∈ projFib Λ X' ↔ X ⊆ Λ ∧ X.image proj = X' := by
  simp only [projFib, Finset.mem_filter, Finset.mem_powerset]

theorem subset_fibre_of_mem_projFib {Λ : Finset (ℤ × ℤ × ℤ)} {X : Finset (ℤ × ℤ × ℤ)}
    {X' : Finset (ℤ × ℤ)} (hX : X ∈ projFib Λ X') : X ⊆ fibre Λ X' := by
  intro x hx
  refine Finset.mem_filter.2 ⟨(mem_projFib.1 hX).1 hx, ?_⟩
  rw [← (mem_projFib.1 hX).2]
  exact Finset.mem_image_of_mem proj hx

/-- The grouping fibre over `X'` has at most `2 ^ (h * |X'|)` members (donor
`card_fibre_le`, `Cylinder3D.lean:264`; consumes A1's `fibre_card_le`). -/
theorem card_projFib_le (h : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)} (hΛ : IsSlabDomain3D h Λ)
    {X' : Finset (ℤ × ℤ)} : (projFib Λ X').card ≤ 2 ^ (h * X'.card) := by
  refine le_trans (Finset.card_le_card fun X hX =>
    Finset.mem_powerset.2 (subset_fibre_of_mem_projFib hX)) ?_
  rw [Finset.card_powerset]
  exact Nat.pow_le_pow_right two_pos (fibre_card_le h hΛ X')

/-- The column enumeration used by the relabelling: `col Λ u` indexed as
`Fin (colCard Λ u)` (the variable-height replacement of the donor's `⟨x.2.2.toNat⟩`
height index; REGION-INDEPENDENT — this is what the P2-d transport rides on). -/
noncomputable def colToFin (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) :
    ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) ≃ Fin (colCard Λ u) :=
  Fintype.equivFin _

/-- The 3D site of column `u` at enumeration index `i`, as an element of the fibre
(the membership proof: a column site is in `Λ` and projects to `u ∈ X'`). -/
noncomputable def colSiteOf (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} (u : ℤ × ℤ)
    (hu : u ∈ X') (i : Fin (colCard Λ u)) :
    ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) :=
  ⟨((colToFin Λ u).symm i : ℤ × ℤ × ℤ), by
    have hx := Finset.mem_filter.1 ((colToFin Λ u).symm i).2
    exact Finset.mem_filter.2 ⟨hx.1, by rw [hx.2]; exact hu⟩⟩

/-- The enumeration index of a fibre site in its own column. -/
noncomputable def colIdxOf (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)}
    (x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ))) :
    Fin (colCard Λ (proj (x : ℤ × ℤ × ℤ))) :=
  colToFin Λ (proj (x : ℤ × ℤ × ℤ))
    ⟨(x : ℤ × ℤ × ℤ), mem_col_of_proj Λ _ (Finset.mem_filter.1 x.2).1 rfl⟩

noncomputable def colEquivVarToFun (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) (X' : Finset (ℤ × ℤ)) :
    (∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) →
      (∀ x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) :=
  fun f x =>
    (finFunctionFinEquiv (m := q) (n := colCard Λ (proj (x : ℤ × ℤ × ℤ))).symm
        (f ⟨proj (x : ℤ × ℤ × ℤ), (Finset.mem_filter.1 x.2).2⟩))
      (colIdxOf Λ x)

noncomputable def colEquivVarInvFun (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) (X' : Finset (ℤ × ℤ)) :
    (∀ x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) →
      (∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) :=
  fun g u =>
    finFunctionFinEquiv (m := q) (n := colCard Λ (u : ℤ × ℤ))
      fun i => g (colSiteOf Λ (u : ℤ × ℤ) u.2 i)

theorem projF_fibre (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ) :
    projF (fibre Λ X') = X' := by
  ext u
  simp only [projF, Finset.mem_image, fibre, Finset.mem_filter]
  constructor
  · rintro ⟨y, ⟨-, hy⟩, rfl⟩
    exact hy
  · intro hu
    obtain ⟨y, hyΛ, rfl⟩ := mem_projF (hX' hu)
    exact ⟨y, ⟨hyΛ, hu⟩, rfl⟩

/-- The fibre's columns are `Λ`'s columns (`u ∈ X'` suffices; no `X' ⊆ projF Λ` needed). -/
theorem col_fibre_eq (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} {u : ℤ × ℤ}
    (hu : u ∈ X') : col (fibre Λ X') u = col Λ u := by
  ext y
  simp only [col, fibre, Finset.mem_filter]
  constructor
  · rintro ⟨⟨hyΛ, -⟩, hyu⟩
    exact ⟨hyΛ, hyu⟩
  · rintro ⟨hyΛ, hyu⟩
    exact ⟨⟨hyΛ, by rw [hyu]; exact hu⟩, hyu⟩

theorem colCard_fibre_eq (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} {u : ℤ × ℤ}
    (hu : u ∈ X') : colCard (fibre Λ X') u = colCard Λ u := by
  rw [colCard_eq_card, colCard_eq_card]
  exact congrArg Finset.card (col_fibre_eq Λ hu)

/-- Height-cast along a column-cardinality equality (roundtrips free: `Equiv.cast`). -/
noncomputable def heightCastEquiv (q : ℕ) {a b : ℕ} (h : a = b) : Fin (q ^ a) ≃ Fin (q ^ b) :=
  Equiv.cast (congrArg (fun n => Fin (q ^ n)) h)

/-- **The per-region regrouping equivalence** (the donor's `colEquiv`, `Cylinder3D.lean:78`,
at variable heights), built as an EQUIV-COMPOSITION — P2-b's `regReindexEquiv` instantiated
at the fibre region, transported along `projF_fibre` (index, via `regEquivOfEq` whose
`restr`-based action is proof-irrelevant-transparent) and `colCard_fibre_eq` (heights,
via `heightCastEquiv`) — so both roundtrips are INHERITED from the components and no
per-index choice transport is ever owed (run 23's park, `A2-gaps.md` §4, resolved
2026-11-18: the earlier draft's `Equiv.piCongrLeft'` misapplied `regEquivOfEq` at base
level; the `.symm` of this composite is what P2-d's relabelling consumes). The
pointwise-action functions `colEquivVarToFun`/`colEquivVarInvFun` above document the
donor's entrywise action and are NOT this composite's underlying functions. -/
noncomputable def colEquivVar (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) (X' : Finset (ℤ × ℤ))
    (hX' : X' ⊆ projF Λ) :
    (∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) ≃
      (∀ x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) :=
  ((Equiv.piCongrRight fun u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)) =>
        heightCastEquiv q (colCard_fibre_eq Λ u.2).symm).trans
      (regEquivOfEq (loc := fun u : ℤ × ℤ => Fin (q ^ colCard (fibre Λ X') u))
          (projF_fibre Λ hX')).symm).trans
    (regReindexEquiv (Λ := fibre Λ X') q).symm

/-- The projected (grouped) interaction: on the planar support `X'`, the `Φ`-terms with
column set `X'`, extended to the fibre region and relabelled to variable-height planar
sites (the donor's `colInteraction`, `Cylinder3D.lean:299`, at variable heights). -/
noncomputable def projInteraction (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (X' : Finset (ℤ × ℤ)) :
    Matrix (Reg (fun u => Fin (q ^ colCard Λ u)) X') (Reg (fun u => Fin (q ^ colCard Λ u)) X') 𝕜 :=
  if hX' : X' ⊆ projF Λ then
    (∑ X ∈ projFib Λ X',
        if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0).submatrix
      (colEquivVar Λ q X' hX') (colEquivVar Λ q X' hX')
  else 0

/-- The projected interaction is Hermitian. -/
theorem projInteraction_isHermitian {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    {J : ℝ} {R : ℕ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ) :
    (projInteraction Λ q Φ X').IsHermitian := by
  rw [projInteraction, dif_pos hX']
  have hsum : (∑ X ∈ projFib Λ X',
      if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0).IsHermitian :=
    (isSelfAdjoint_sum _ fun X hX => by
      by_cases hXf : X ⊆ fibre Λ X'
      · rw [dif_pos hXf]
        exact (isHermitian_extendId _ (hΦ X (mem_projFib.1 hX).1).1).isSelfAdjoint
      · rw [dif_neg hXf]
        exact IsSelfAdjoint.zero _).isHermitian
  exact Matrix.IsHermitian.submatrix hsum _

/-- 3D admissible supports project to `G`-admissible supports (P1-a's diameter
contraction, membership form; feeds the zero clause). -/
theorem image_projF_mem_supportsG {Λ X : Finset (ℤ × ℤ × ℤ)} {R : ℕ} (hXΛ : X ⊆ Λ)
    (hX : X ∈ supports3D Λ R) : X.image proj ∈ supportsG (projLattice Λ) (projF Λ) R := by
  rw [supports3D, Finset.mem_filter, Finset.mem_powerset] at hX
  obtain ⟨-, hne, hdiam⟩ := hX
  rw [supportsG, Finset.mem_filter, Finset.mem_powerset]
  refine ⟨?_, hne.image _, ?_⟩
  · exact Finset.image_subset_image hXΛ
  · exact (proj_diam_le Λ X hXΛ).trans hdiam

/-- The projected interaction vanishes off the `G`-admissible planar supports. -/
theorem projInteraction_eq_zero {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    {J : ℝ} {R : ℕ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) {X' : Finset (ℤ × ℤ)}
    (hX' : X' ⊆ projF Λ) (hs : X' ∉ supportsG (projLattice Λ) (projF Λ) R) :
    projInteraction Λ q Φ X' = 0 := by
  rw [projInteraction, dif_pos hX']
  have hzero : ∀ X ∈ projFib Λ X',
      (if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0) = 0 := by
    intro X hX
    have hXΛ : X ⊆ Λ := (mem_projFib.1 hX).1
    have hΦ0 : Φ X = 0 := (hΦ X hXΛ).2.2 fun hXs =>
      hs (by rw [← (mem_projFib.1 hX).2]; exact image_projF_mem_supportsG hXΛ hXs)
    rw [dif_pos (subset_fibre_of_mem_projFib hX), hΦ0, extendId_zero]
  rw [Finset.sum_congr rfl hzero, Finset.sum_const_zero]
  rfl

/-- The projected interaction's strength is the grouped bound `2 ^ (h (2R+1)²) max J 1`
(find #3's `groupStrength`; donor `isAdmissible_colInteraction`, `Cylinder3D.lean:333`). -/
theorem projInteraction_norm_le (h R : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)}
    (hΛ : IsSlabDomain3D h Λ) (q : ℕ) {𝕜 : Type*} [RCLike 𝕜] {J : ℝ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ) :
    ‖projInteraction Λ q Φ X'‖ ≤ groupStrength h R J := by
  have hJ : 0 ≤ J := (norm_nonneg _).trans (hΦ ∅ (Finset.empty_subset _)).2.1
  by_cases hs : X' ∈ supportsG (projLattice Λ) (projF Λ) R
  · rw [projInteraction, dif_pos hX', l2_opNorm_submatrix]
    have hterm : ∀ X ∈ projFib Λ X',
        ‖(if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0)‖ ≤ J := by
      intro X hX
      by_cases hXf : X ⊆ fibre Λ X'
      · rw [dif_pos hXf]
        exact (l2_opNorm_extendId_le _ _).trans (hΦ X (mem_projFib.1 hX).1).2.1
      · rw [dif_neg hXf, norm_zero]
        exact hJ
    have hcard : ((projFib Λ X').card : ℝ) ≤ 2 ^ (h * (2 * R + 1) ^ 2) := by
      have h2 : h * X'.card ≤ h * (2 * R + 1) ^ 2 :=
        Nat.mul_le_mul_left h (card_le_of_mem_supportsG (projLattice_le_plan Λ) hs)
      exact_mod_cast (card_projFib_le h hΛ).trans (Nat.pow_le_pow_right two_pos h2)
    calc ‖∑ X ∈ projFib Λ X', if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0‖
          ≤ ∑ X ∈ projFib Λ X', ‖(if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0)‖ :=
        norm_sum_le _ _
      _ ≤ ∑ _X ∈ projFib Λ X', J := Finset.sum_le_sum hterm
      _ = (projFib Λ X').card * J := by rw [Finset.sum_const, nsmul_eq_mul]
      _ ≤ 2 ^ (h * (2 * R + 1) ^ 2) * max J 1 :=
        mul_le_mul hcard (le_max_left J 1) hJ (by positivity)
      _ = groupStrength h R J := by rw [groupStrength, mul_comm]
  · rw [projInteraction_eq_zero q Φ hΦ hX' hs, norm_zero, groupStrength]
    exact mul_nonneg (pow_nonneg (by norm_num) _) (le_trans zero_le_one (le_max_right J 1))

/-- **P2-c MAIN**: the projected interaction is `(R, groupStrength h R J)`-admissible at
`G := projLattice Λ`, heights `colCard Λ ·` — the planar binder's admissibility side. -/
theorem isAdmissible_projInteraction (h R : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)}
    (hΛ : IsSlabDomain3D h Λ) (q : ℕ) {𝕜 : Type*} [RCLike 𝕜] {J : ℝ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) :
    IsAdmissibleVar (projLattice Λ) (projF Λ) R (groupStrength h R J) (colCard Λ)
      (projInteraction Λ q Φ) :=
  fun X' hX' => ⟨projInteraction_isHermitian q Φ hΦ hX',
    projInteraction_norm_le h R hΛ q Φ hΦ hX',
    fun hs => projInteraction_eq_zero q Φ hΦ hX' hs⟩

/-! ## P2-d — transport through the reindexing (generic layer + entrywise API)

The donor's relabelling step, part 1: eigenvector, spectral gap and unit norm transport
along submatrix-conjugation by an equivalence (donor `Cylinder3D.lean` relabelling
chapter; mathlib-only). Entrywise API discipline: everything reducible is stated on the
`toFun` side of `regReindexEquiv` (rfl-transparent); the `Fintype.equivFin` choice
transports that parked P2-c (run 23) live only on the `.symm` side, which is NEVER
unwrapped — `.symm` values are pinned by roundtrips (`Equiv.symm_apply_apply`). -/

section P2d

open scoped MatrixOrder

variable {𝕜 : Type*} [RCLike 𝕜] {ι ι' : Type*} [Fintype ι] [Fintype ι']
  [DecidableEq ι] [DecidableEq ι']

/-- Submatrix-conjugation of a pure projector is the projector of the relabelled
factors (entrywise). -/
theorem vecMulVec_submatrix (v w : ι → 𝕜) (e : ι' ≃ ι) :
    (vecMulVec v w).submatrix e e = vecMulVec (v ∘ e) (w ∘ e) := by
  ext i j
  rfl

/-- The spectral-gap inequality transports along submatrix-conjugation (the donor's
relabelling step, gap side; the Loewner difference conjugates entrywise). -/
theorem hasGlobalGap_submatrix {H : Matrix ι ι 𝕜} {Ω : ι → 𝕜} {E₀ Δ : ℝ}
    (h : HasGlobalGap H Ω E₀ Δ) (e : ι' ≃ ι) :
    HasGlobalGap (H.submatrix e e) (Ω ∘ e) E₀ Δ := by
  unfold HasGlobalGap at h ⊢
  rw [Matrix.le_iff] at h ⊢
  have key : (H.submatrix e e - (E₀ : 𝕜) • 1 - (Δ : 𝕜) • (1 - vecMulVec (Ω ∘ e) (star (Ω ∘ e)))) =
      (H - (E₀ : 𝕜) • 1 - (Δ : 𝕜) • (1 - vecMulVec Ω (star Ω))).submatrix e e := by
    ext i j
    simp [Matrix.submatrix_apply, Matrix.one_apply, Matrix.smul_apply,
      Matrix.sub_apply, Pi.star_apply, Matrix.vecMulVec_apply, e.apply_eq_iff_eq]
  rw [key]
  -- the conjugated Loewner difference is PosSemidef because the original is. Stated via
  -- the anonymous constructor against the (already-elaborated) goal — the
  -- `Matrix.PosSemidef.submatrix` shortcut failed `PartialOrder 𝕜` instance synthesis
  -- in this RCLike-section context (run 9, A2.lean:827), so mathlib's own proof shape is
  -- re-derived inline (PosDef.lean:83–86: `mapDomain` of the quadratic form).
  exact ⟨h.1.submatrix e, fun x => by
    simpa [Finsupp.sum_mapDomain_index, add_mul, mul_add] using h.2 (x.mapDomain e)⟩

/-- The eigen-equation transports along submatrix-conjugation (the donor's relabelling
step, eigenvector side). -/
theorem mulVec_eq_smul_submatrix {H : Matrix ι ι 𝕜} {Ω : ι → 𝕜} {E₀ : ℝ}
    (h : H *ᵥ Ω = (E₀ : 𝕜) • Ω) (e : ι' ≃ ι) :
    H.submatrix e e *ᵥ (Ω ∘ e) = (E₀ : 𝕜) • (Ω ∘ e) := by
  have hcomp : (Ω ∘ e) ∘ e.symm = Ω := funext fun i => by simp
  rw [Matrix.submatrix_mulVec_equiv H (Ω ∘ e) e e, hcomp, h]
  funext i
  simp [Algebra.smul_def, smul_eq_mul]

/-- Unit norm transports along a reindexing (dot-product side; the dotProduct
reindex lemmas live at ROOT namespace on this pin, not under `Matrix`). -/
theorem star_dotProduct_comp {Ω : ι → 𝕜} (hΩ : star Ω ⬝ᵥ Ω = 1) (e : ι' ≃ ι) :
    star (Ω ∘ e) ⬝ᵥ (Ω ∘ e) = 1 := by
  have hstar : star (Ω ∘ e) = (star Ω) ∘ e := funext fun _ => rfl
  have hcomp : (Ω ∘ e) ∘ e.symm = Ω := funext fun i => by simp
  rw [hstar, ← dotProduct_comp_equiv_symm (u := star Ω) (x := Ω ∘ e) e, hcomp, hΩ]

end P2d

/-! ### P2-d entrywise API (toFun side) and fibre/complement plumbing -/

/-- The regrouping's action on a configuration, column by column — the `toFun` side is
rfl-transparent (every component application reduces: `Equiv.trans`, `piCongrLeft'`,
`piCurry`, `piCongrRight`, `colSigmaEquiv.invFun` all whnf-reduce on application). -/
theorem regReindexEquiv_apply (Λ : Finset (ℤ × ℤ × ℤ)) {q : ℕ}
    (w : ∀ a : ↥((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q)
    (u : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ))) :
    regReindexEquiv (Λ := Λ) q w u =
      colRegEquiv (u : ℤ × ℤ)
        (fun s : ↥((col Λ (u : ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) =>
          w ⟨(s : ℤ × ℤ × ℤ), col_subset Λ (u : ℤ × ℤ) s.2⟩) := rfl

/-- Conjugating the fibre regrouping by the whole-domain regrouping collapses to the
height/index casts (roundtrip form: the `.symm` choice transports cancel against
`regReindexEquiv`, leaving the cast/`regEquivOfEq` tail — the P2-d swap's key). -/
theorem regReindexEquiv_comp_colEquivVar (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ)
    {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ)
    (v : ∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) :
    regReindexEquiv (Λ := fibre Λ X') q (colEquivVar Λ q X' hX' v) =
      (regEquivOfEq (loc := fun u : ℤ × ℤ => Fin (q ^ colCard (fibre Λ X') u))
          (projF_fibre Λ hX')).symm
        ((Equiv.piCongrRight fun u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)) =>
            heightCastEquiv q (colCard_fibre_eq Λ u.2).symm) v) := by
  simp [colEquivVar, Equiv.trans_apply, Equiv.apply_symm_apply]

/-- The fibre is a subregion of the domain. -/
theorem fibre_subset (Λ : Finset (ℤ × ℤ × ℤ)) (S : Finset (ℤ × ℤ)) :
    fibre Λ S ⊆ Λ :=
  Finset.filter_subset _ _

/-- Off a planar region, the complement of the fibre is the fibre of the complement
(the complement's column decomposition; feeds the P2-d swap's off-region clause —
every `Λ`-site's projection is in `projF Λ`, so the two filters agree). -/
theorem sdiff_fibre_eq (Λ : Finset (ℤ × ℤ × ℤ)) (X' : Finset (ℤ × ℤ)) :
    Λ \ fibre Λ X' = fibre Λ (projF Λ \ X') := by
  ext x
  by_cases hxΛ : x ∈ Λ
  · have hP : proj x ∈ projF Λ := Finset.mem_image_of_mem proj hxΛ
    by_cases hxX : proj x ∈ X'
    · simp [Finset.mem_sdiff, fibre, Finset.mem_filter, hxΛ, hP, hxX]
    · simp [Finset.mem_sdiff, fibre, Finset.mem_filter, hxΛ, hP, hxX]
  · simp [Finset.mem_sdiff, fibre, Finset.mem_filter, hxΛ]

/-! ## P2-c audit (inline full-coverage; every new top-level theorem). -/

#print axioms Arealaw.restr_glue
#print axioms Arealaw.restr_glue_compl
#print axioms Arealaw.glue_restr
#print axioms Arealaw.glueEquiv_apply
#print axioms Arealaw.glueEquiv_symm_apply
#print axioms Arealaw.regEquivOfEq_apply
#print axioms Arealaw.regEquivOfEq_symm_apply
#print axioms Arealaw.extendId_zero
#print axioms Arealaw.extendId_add
#print axioms Arealaw.extendId_sum
#print axioms Arealaw.extendId_apply_glue
#print axioms Arealaw.extendId_extendId
#print axioms Arealaw.isHermitian_extendId
#print axioms Arealaw.euclidean_norm_comp_le
#print axioms Arealaw.l2_opNorm_le_bound
#print axioms Arealaw.l2_opNorm_submatrix_id_le
#print axioms Arealaw.l2_opNorm_submatrix_le
#print axioms Arealaw.l2_opNorm_submatrix
#print axioms Arealaw.euclidean_norm_sq_prod
#print axioms Arealaw.kronecker_one_mulVec_apply
#print axioms Arealaw.l2_opNorm_kronecker_one_le
#print axioms Arealaw.extendId_eq_kronecker
#print axioms Arealaw.l2_opNorm_extendId_le
#print axioms Arealaw.H_eq_multiset_sum
#print axioms Arealaw.H_eq_of_multiset_eq
#print axioms Arealaw.trace_cfc
#print axioms Arealaw.vonNeumann_eq_H
#print axioms Arealaw.eigenvalues_multiset_submatrix_equiv
#print axioms Arealaw.vonNeumann_submatrix_equiv
#print axioms OpenAI.AL3D.edist_induce_le_of_adj_le
#print axioms OpenAI.AL3D.planar_dist_eq_max_abs
#print axioms OpenAI.AL3D.planar_dist_le_iff
#print axioms OpenAI.AL3D.planar_dist_eq_one_of_adj
#print axioms OpenAI.AL3D.planar_dist_le_length_of_walk
#print axioms OpenAI.AL3D.exists_walk_length_le_iff_edist_le
#print axioms OpenAI.AL3D.planar_dist_le_of_domainEDistG_le
#print axioms OpenAI.AL3D.domainEDiamG_le_iff
#print axioms OpenAI.AL3D.mem_supportsG_iff
#print axioms OpenAI.AL3D.subset_Icc_of_mem_supportsG
#print axioms OpenAI.AL3D.card_Icc_eq_mul
#print axioms OpenAI.AL3D.card_Icc_sub_add
#print axioms OpenAI.AL3D.card_le_of_mem_supportsG
#print axioms OpenAI.AL3D.mem_projFib
#print axioms OpenAI.AL3D.subset_fibre_of_mem_projFib
#print axioms OpenAI.AL3D.card_projFib_le
#print axioms OpenAI.AL3D.projF_fibre
#print axioms OpenAI.AL3D.col_fibre_eq
#print axioms OpenAI.AL3D.colCard_fibre_eq
#print axioms OpenAI.AL3D.projInteraction_isHermitian
#print axioms OpenAI.AL3D.image_projF_mem_supportsG
#print axioms OpenAI.AL3D.projInteraction_eq_zero
#print axioms OpenAI.AL3D.projInteraction_norm_le
#print axioms OpenAI.AL3D.isAdmissible_projInteraction
#print axioms OpenAI.AL3D.vecMulVec_submatrix
#print axioms OpenAI.AL3D.hasGlobalGap_submatrix
#print axioms OpenAI.AL3D.mulVec_eq_smul_submatrix
#print axioms OpenAI.AL3D.star_dotProduct_comp
#print axioms OpenAI.AL3D.regReindexEquiv_apply
#print axioms OpenAI.AL3D.regReindexEquiv_comp_colEquivVar
#print axioms OpenAI.AL3D.fibre_subset
#print axioms OpenAI.AL3D.sdiff_fibre_eq

end OpenAI.AL3D
