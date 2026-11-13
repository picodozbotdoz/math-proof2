/-
  Pilot 72, tranche T1 — the family-265 interface, TIER-C VENDOR LAYER (72-prework §2.4):
  both endpoint statement layers transcribed verbatim, with the AreaLaw2D side re-based
  onto Mathlib alone (the Physlib lemmas the donor files import are NOT in this tranche's
  closure; every declaration below is donor-verbatim from a Mathlib-only context).

  Donors (read-only):
    * axiommath/AreaLaw2D/AreaLawForMathlib/QuantumInfo/Region/Basic.lean   (whole file)
    * …/QuantumInfo/ClassicalInfo/Entropy.lean   (H + the Mathlib-only lemmas; the
      Physlib `Hₛ` correspondence lemmas dropped — not in the AreaLaw statement's closure)
    * …/QuantumInfo/Entropy/VonNeumann.lean      (whole file)
    * …/QuantumInfo/Region/PartialTrace.lean     (ptrace core: def, self/functoriality,
      sliceIsometry + the two isometry lemmas, eq_sum_conj, posSemidef/trace preservation;
      extendId def. The traceRight/traceLeft section (Physlib) dropped)
    * …/QuantumInfo/Region/State.lean            (SubState/MState/restrict/entropy/
      entropy_eq_H/regionEntropy; submatrix/mutualInfo/entropy_le_log_card dropped —
      the last needs Physlib's Hₛ)
    * …/../../OpenAI/Statements.lean             (the Theorem 1.1 statement layer:
      lattice, domainEDist/Diam, edgeBoundary, Qudits, supports, hamiltonian,
      IsAdmissible, HasGlobalGap, pureState, AreaLaw; graphNbhd/domainComponent/
      ambient*/innerBoundary/cutEndpoints/VertexAreaLaw/AreaLawCorollary dropped)
    * openai-math/lean/OAI/MathematicalPhysics/PEPSFilters/Basic.lean
      (the consumer preamble :10–147 through `UniformAreaLaw`; contractPEPS/
      HasPEPSApproximation/MainStatement/NestedFilter dropped — outside dossier 72 M1)

  Conventions (P11T1 header): donor `module`/import headers dropped (single `import
  Mathlib` — both donors' statement layers import only Mathlib or subsets thereof);
  namespaces kept verbatim (`Arealaw`, `OpenAI`, `OAI.PolynomialPEPS.PinnedEntropy`) so
  the endpoint statements are character-identical to their donors. No `sorry`, no
  `native_decide`, no external CAS. Tier C = zero import gates (72-prework §2.4): the
  producer side enters as a hypothesis binder over the TRANSCRIBED statement.
-/
import Mathlib

/-! ## AreaLawForMathlib/QuantumInfo/Region/Basic.lean (verbatim) -/

namespace Arealaw

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*}

/-- The Hilbert-space index of the region `S`: a configuration assigns to every site of `S`
a basis label of its local space. -/
abbrev Reg (loc : σ → Type*) (S : Finset σ) := ∀ i : S, loc i

variable {S T U : Finset σ}

/-- Restrict a configuration on `T` to a subregion `S ⊆ T`: Mathlib's `Finset.restrict₂`
under a region-language name. -/
def restr (h : S ⊆ T) (z : Reg loc T) : Reg loc S := Finset.restrict₂ h z

/-- Glue a configuration on `S` with one on `T \ S` to a configuration on `T`. -/
def glue (x : Reg loc S) (z : Reg loc (T \ S)) : Reg loc T :=
  fun j => if hj : (j : σ) ∈ S then x ⟨j, hj⟩ else z ⟨j, Finset.mem_sdiff.2 ⟨j.2, hj⟩⟩

section
omit [DecidableEq σ]

/-- Restricting to the same region does nothing. -/
@[simp] theorem restr_refl (z : Reg loc S) : restr (Finset.Subset.refl S) z = z := rfl

/-- Restriction is transitive. -/
@[simp] theorem restr_restr (hST : S ⊆ T) (hTU : T ⊆ U) (w : Reg loc U) :
    restr hST (restr hTU w) = restr (hST.trans hTU) w := rfl

end

/-- Gluing then restricting to the subregion returns the subregion part. -/
@[simp] theorem restr_glue (h : S ⊆ T) (x : Reg loc S) (z : Reg loc (T \ S)) :
    restr h (glue x z) = x :=
  funext fun i => dif_pos i.2

/-- Gluing with the empty complement changes nothing. -/
@[simp] theorem glue_sdiff_self (x : Reg loc T) (z : Reg loc (T \ T)) : glue x z = x :=
  restr_glue Finset.Subset.rfl x z

/-- Gluing then restricting to the complement returns the complement part. -/
@[simp] theorem restr_glue_compl (x : Reg loc S) (z : Reg loc (T \ S)) :
    restr Finset.sdiff_subset (glue x z) = z :=
  funext fun i => dif_neg (Finset.mem_sdiff.1 i.2).2

/-- A configuration is recovered from its two restrictions. -/
@[simp] theorem glue_restr (h : S ⊆ T) (w : Reg loc T) :
    glue (restr h w) (restr Finset.sdiff_subset w) = w :=
  funext fun j => by simp [restr, glue]

/-- With `S ⊆ T`, `glue` reads all of `x`, hence is injective in the subregion argument.
The hypothesis is necessary: without it `glue` ignores `x` on `S \ T`, and injectivity
fails already for `σ = Unit`, `loc _ = Bool`, `S = {()}`, `T = ∅`. -/
theorem glue_left_injective (h : S ⊆ T) (z : Reg loc (T \ S)) :
    Function.Injective fun x : Reg loc S => glue (T := T) x z :=
  Function.LeftInverse.injective fun x => restr_glue h x z

/-- `glue` reads all of its complement argument, so it is injective there unconditionally,
unlike `glue_left_injective`, which needs `S ⊆ T`. -/
theorem glue_right_injective (x : Reg loc S) :
    Function.Injective fun z : Reg loc (T \ S) => glue (T := T) x z :=
  Function.LeftInverse.injective (restr_glue_compl x)

/-! ### Equivalences between region index types -/

/-- `glue` and the two restrictions assemble to an equivalence
`Reg S × Reg (T \ S) ≃ Reg T`. -/
def glueEquiv (h : S ⊆ T) : Reg loc S × Reg loc (T \ S) ≃ Reg loc T where
  toFun p := glue p.1 p.2
  invFun w := (restr h w, restr Finset.sdiff_subset w)
  left_inv p := Prod.ext (restr_glue h p.1 p.2) (restr_glue_compl p.1 p.2)
  right_inv := glue_restr h

@[simp] theorem glueEquiv_apply (h : S ⊆ T) (p : Reg loc S × Reg loc (T \ S)) :
    glueEquiv h p = glue p.1 p.2 := rfl

@[simp] theorem glueEquiv_symm_apply (h : S ⊆ T) (w : Reg loc T) :
    (glueEquiv h).symm w = (restr h w, restr Finset.sdiff_subset w) := rfl

/-- For `S ⊆ T ⊆ U`, the two-step complement `(T \ S) × (U \ T)` regroups to the one-step
complement `U \ S`. -/
def splitEquiv (hST : S ⊆ T) (hTU : T ⊆ U) :
    Reg loc (T \ S) × Reg loc (U \ T) ≃ Reg loc (U \ S) where
  toFun p := fun j =>
    if hj : (j : σ) ∈ T then p.1 ⟨j, by grind⟩ else p.2 ⟨j, by grind⟩
  invFun v :=
    (restr (Finset.sdiff_subset_sdiff hTU le_rfl) v, restr (Finset.sdiff_subset_sdiff le_rfl hST) v)
  left_inv p := by ext1 <;> funext i <;> simp [restr, Finset.mem_sdiff.1 i.2]
  right_inv v := funext fun j => by by_cases hj : (j : σ) ∈ T <;> simp [restr, hj]

theorem splitEquiv_apply_fst (hST : S ⊆ T) (hTU : T ⊆ U) (p : Reg loc (T \ S) × Reg loc (U \ T))
    (j : ↥(U \ S)) (hj : (j : σ) ∈ T \ S) :
    splitEquiv hST hTU p j = p.1 ⟨j, hj⟩ := dif_pos (Finset.mem_sdiff.1 hj).1

theorem splitEquiv_apply_snd (hST : S ⊆ T) (hTU : T ⊆ U) (p : Reg loc (T \ S) × Reg loc (U \ T))
    (j : ↥(U \ S)) (hj : (j : σ) ∈ U \ T) :
    splitEquiv hST hTU p j = p.2 ⟨j, hj⟩ := dif_neg (Finset.mem_sdiff.1 hj).2

/-- Gluing in two steps agrees with gluing once, along `splitEquiv`. -/
theorem glue_splitEquiv (hST : S ⊆ T) (hTU : T ⊆ U) (x : Reg loc S) (z : Reg loc (T \ S))
    (w : Reg loc (U \ T)) :
    glue x (splitEquiv hST hTU (z, w)) = glue (T := U) (glue (T := T) x z) w := by
  grind [glue, splitEquiv]

section
omit [DecidableEq σ]

/-- Equal regions have equivalent index types. -/
def regEquivOfEq (hst : S = T) : Reg loc S ≃ Reg loc T where
  toFun := restr (le_of_eq hst.symm)
  invFun := restr (le_of_eq hst)
  left_inv _ := rfl
  right_inv _ := rfl

@[simp] theorem regEquivOfEq_apply (hst : S = T) (z : Reg loc S) :
    regEquivOfEq hst z = restr (le_of_eq hst.symm) z := rfl

@[simp] theorem regEquivOfEq_symm_apply (hst : S = T) (w : Reg loc T) :
    (regEquivOfEq (loc := loc) hst).symm w = restr (le_of_eq hst) w := rfl

end

/-- The complement of `A` inside `A ∪ B` is `B`, as index types. -/
def sdiffEquiv {A B : Finset σ} (hd : Disjoint A B) : Reg loc B ≃ Reg loc ((A ∪ B) \ A) where
  toFun y j := y ⟨j, (Finset.union_sdiff_cancel_left hd).subset j.2⟩
  invFun v i := v ⟨i, (Finset.union_sdiff_cancel_left hd).symm.subset i.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- A configuration on a disjoint union is a pair of configurations. -/
def unionEquiv {A B : Finset σ} (hd : Disjoint A B) :
    Reg loc (A ∪ B) ≃ Reg loc A × Reg loc B where
  toFun z := (restr Finset.subset_union_left z, restr Finset.subset_union_right z)
  invFun p := glue p.1 (sdiffEquiv hd p.2)
  left_inv := glue_restr Finset.subset_union_left
  right_inv _ :=
    Prod.ext (restr_glue Finset.subset_union_left _ _)
      ((sdiffEquiv hd).injective (restr_glue_compl _ _))

@[simp] theorem unionEquiv_apply {A B : Finset σ} (hd : Disjoint A B) (z : Reg loc (A ∪ B)) :
    unionEquiv hd z = (restr Finset.subset_union_left z, restr Finset.subset_union_right z) :=
  rfl

/-- `unionEquiv.symm` glues on the left factor, whose complement in `A ∪ B` is `B`. -/
@[simp] theorem unionEquiv_symm_apply {A B : Finset σ} (hd : Disjoint A B) (x : Reg loc A)
    (y : Reg loc B) : (unionEquiv hd).symm (x, y) = glue x (sdiffEquiv hd y) := rfl

/-- Configurations on the full chain are exactly the sections of the local family. -/
def univEquiv [Fintype σ] : Reg loc (Finset.univ : Finset σ) ≃ (∀ i, loc i) where
  toFun z i := z ⟨i, Finset.mem_univ i⟩
  invFun f i := f i.1
  left_inv _ := rfl
  right_inv _ := rfl

section
omit [DecidableEq σ]

@[simp] theorem univEquiv_apply [Fintype σ] (z : Reg loc (Finset.univ : Finset σ)) (i : σ) :
    univEquiv z i = z ⟨i, Finset.mem_univ i⟩ := rfl

@[simp] theorem univEquiv_symm_apply [Fintype σ] (f : ∀ i, loc i) (i : (Finset.univ : Finset σ)) :
    (univEquiv (loc := loc)).symm f i = f i.1 := rfl

end

/-! ## Cardinality -/

/-- The empty region has exactly one configuration. -/
instance : Unique (Reg loc (∅ : Finset σ)) := Pi.uniqueOfIsEmpty _

variable [∀ i, Fintype (loc i)]

/-- The dimension of a region is the product of the local dimensions. -/
theorem card_reg (S : Finset σ) : Fintype.card (Reg loc S) = ∏ i ∈ S, Fintype.card (loc i) :=
  Fintype.card_pi.trans (Finset.prod_coe_sort S fun i => Fintype.card (loc i))

/-- With constant local dimension `d`, a region of `k` sites has dimension `d ^ k`. -/
theorem card_reg_const {d : ℕ} (hd : ∀ i, Fintype.card (loc i) = d) (S : Finset σ) :
    Fintype.card (Reg loc S) = d ^ S.card := by
  simp [hd]

/-! ## QuantumInfo/ClassicalInfo/Entropy.lean (verbatim subset: the Mathlib-only layer) -/

/-- Shannon entropy of a finite real family `p : ι → ℝ`, `H p = ∑ i, -p i · log (p i)`. -/
noncomputable def H {ι : Type*} [Fintype ι] (p : ι → ℝ) : ℝ := ∑ i, Real.negMulLog (p i)

/-- `H p` is the sum of `Real.negMulLog` over the multiset of values of `p`. -/
theorem H_eq_multiset_sum {ι : Type*} [Fintype ι] (p : ι → ℝ) :
    H p = (Multiset.map (fun x => Real.negMulLog x) (Finset.univ.val.map p)).sum := by
  rw [H, Finset.sum_eq_multiset_sum, Multiset.map_map, Function.comp_def]

/-- `H` depends only on the multiset of values: if two families have equal value
multisets, their entropies agree. -/
theorem H_eq_of_multiset_eq {ι κ : Type*} [Fintype ι] [Fintype κ] {p : ι → ℝ} {q : κ → ℝ}
    (h : Finset.univ.val.map p = Finset.univ.val.map q) : H p = H q := by
  rw [H_eq_multiset_sum, H_eq_multiset_sum, h]

variable {ι : Type*} [Fintype ι] [DecidableEq ι] {𝕜 : Type*} [RCLike 𝕜]

open scoped ComplexOrder
open Matrix

/-- The real part of the trace equals the sum of eigenvalues. (v4.36 deviation:
the donor's one-line `simp [trace_eq_sum_eigenvalues]` closure no longer fires;
`RCLike.re` is now a bundled `K →+ ℝ`, so the sum exchange is `map_sum`.) -/
theorem re_trace_eq_sum_eigenvalues {M : Matrix ι ι 𝕜} (hM : M.PosSemidef) :
    RCLike.re M.trace = ∑ i, hM.isHermitian.eigenvalues i := by
  rw [hM.isHermitian.trace_eq_sum_eigenvalues, map_sum]
  exact Finset.sum_congr rfl fun i _ => RCLike.ofReal_re _

/-- Each eigenvalue of a PSD matrix is at most its real trace: the others are nonnegative,
so they can only add. -/
theorem eigenvalues_le_re_trace {M : Matrix ι ι 𝕜} (hM : M.PosSemidef) (i : ι) :
    hM.isHermitian.eigenvalues i ≤ RCLike.re M.trace :=
  (Finset.single_le_sum (fun j _ => hM.eigenvalues_nonneg j) (Finset.mem_univ i)).trans
    (re_trace_eq_sum_eigenvalues hM).ge

/-- Each eigenvalue of a PSD matrix with real trace at most one is at most one. -/
theorem eigenvalues_le_one {M : Matrix ι ι 𝕜} (hM : M.PosSemidef) (htr : RCLike.re M.trace ≤ 1)
    (i : ι) : hM.isHermitian.eigenvalues i ≤ 1 :=
  (eigenvalues_le_re_trace hM i).trans htr

/-- The eigenvalue entropy of a subnormalized PSD matrix is nonnegative. -/
theorem entropy_nonneg {M : Matrix ι ι 𝕜} (hM : M.PosSemidef) (htr : RCLike.re M.trace ≤ 1) :
    0 ≤ H hM.isHermitian.eigenvalues :=
  Finset.sum_nonneg fun i _ =>
    Real.negMulLog_nonneg (hM.eigenvalues_nonneg i) (eigenvalues_le_one hM htr i)

/-! ## QuantumInfo/Entropy/VonNeumann.lean (verbatim) -/

/-- **Trace-spectrum bridge**: for Hermitian `A` and real `f`, the trace of `f(A)` is
`∑ f(eigenvalueᵢ)`. Mathlib has `IsHermitian.cfc` and `trace_eq_sum_eigenvalues`, not the
combination. -/
theorem trace_cfc {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (f : ℝ → ℝ) :
    (hA.cfc f).trace = ∑ i, ((f (hA.eigenvalues i) : ℝ) : 𝕜) := by
  simp [IsHermitian.cfc, trace_mul_cycle]

/-- The von Neumann entropy `-tr(ρ log ρ)` of a Hermitian matrix, the operator form of
Brandão–Horodecki Eq. (3).  Here `ρ log ρ` is the spectral-decomposition matrix
`cfc (x ↦ x·log x) ρ`, whose trace is real, so the real part loses nothing. -/
noncomputable def vonNeumann {ρ : Matrix ι ι 𝕜} (hρ : ρ.IsHermitian) : ℝ :=
  RCLike.re (-(hρ.cfc (fun x => x * Real.log x)).trace)

/-- The operator definition `-tr(ρ log ρ)` equals the Shannon entropy of the eigenvalues:
`vonNeumann ρ = ∑ negMulLog(eigenvalueᵢ) = H (eigenvalues ρ)`. -/
theorem vonNeumann_eq_H {ρ : Matrix ι ι 𝕜} (hρ : ρ.IsHermitian) :
    vonNeumann hρ = H hρ.eigenvalues := by
  simp [vonNeumann, trace_cfc, H, Real.negMulLog]

/-- Reindexing a Hermitian matrix leaves its eigenvalue multiset unchanged. -/
theorem eigenvalues_multiset_submatrix_equiv {m : Type*} [Fintype m] [DecidableEq m]
    {A : Matrix ι ι 𝕜} (hA : A.IsHermitian) (e : m ≃ ι) :
    Finset.univ.val.map (hA.submatrix e).eigenvalues = Finset.univ.val.map hA.eigenvalues := by
  refine Multiset.map_injective (RCLike.ofReal_injective (K := 𝕜)) ?_
  rw [Multiset.map_map, Multiset.map_map, ← (hA.submatrix e).roots_charpoly_eq_eigenvalues,
    ← hA.roots_charpoly_eq_eigenvalues]
  exact congrArg Polynomial.roots (charpoly_reindex e.symm A)

/-- **The von Neumann entropy does not see a relabeling of the index.** -/
theorem vonNeumann_submatrix_equiv {m : Type*} [Fintype m] [DecidableEq m] {A : Matrix ι ι 𝕜}
    (hA : A.IsHermitian) (e : m ≃ ι) : vonNeumann (hA.submatrix e) = vonNeumann hA := by
  -- reindexing fixes the characteristic polynomial, hence the eigenvalue multiset
  simpa [vonNeumann_eq_H] using H_eq_of_multiset_eq (eigenvalues_multiset_submatrix_equiv hA e)

/-! ## QuantumInfo/Region/PartialTrace.lean (verbatim subset) -/

open scoped ComplexOrder Matrix.Norms.L2Operator
open Matrix

/-- The partial trace from region `T` down to `S ⊆ T`: sum over configurations of the
complement `T \ S`. -/
noncomputable def ptrace (_h : S ⊆ T) (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    Matrix (Reg loc S) (Reg loc S) 𝕜 :=
  Matrix.of fun x y => ∑ z : Reg loc (T \ S), M (glue x z) (glue y z)

/-- **Identity law**: tracing a region down to itself changes nothing.  Together with
`ptrace_ptrace` this says the partial trace is functorial on the inclusion order. -/
@[simp] theorem ptrace_self (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    ptrace (Finset.Subset.refl T) M = M := by
  ext x y
  simp [ptrace]

/-- **Functoriality**: tracing `U → T → S` equals tracing `U → S`. -/
theorem ptrace_ptrace (hST : S ⊆ T) (hTU : T ⊆ U) (M : Matrix (Reg loc U) (Reg loc U) 𝕜) :
    ptrace hST (ptrace hTU M) = ptrace (hST.trans hTU) M := by
  ext x y
  simp only [ptrace, Matrix.of_apply]
  rw [← Fintype.sum_prod_type']
  exact Fintype.sum_equiv (splitEquiv (loc := loc) hST hTU) _ _ fun (z, w) => by
    rw [glue_splitEquiv, glue_splitEquiv]

section DecEqLoc
variable [∀ i, DecidableEq (loc i)]

/-- The `z`-slice isometry `Reg S → Reg T`: the column-selection matrix of `glue · z`. -/
noncomputable def sliceIsometry (𝕜 : Type*) [RCLike 𝕜] (z : Reg loc (T \ S)) :
    Matrix (Reg loc T) (Reg loc S) 𝕜 :=
  Matrix.of fun w x => if w = glue x z then 1 else 0

omit [∀ i, Fintype (loc i)] in
/-- `sliceIsometry` selects columns of the identity: it is `1` reindexed along `glue · z`. -/
theorem sliceIsometry_eq_submatrix_one (z : Reg loc (T \ S)) :
    sliceIsometry 𝕜 z =
      (1 : Matrix (Reg loc T) (Reg loc T) 𝕜).submatrix id (fun x => glue x z) := by
  ext w x
  simp [sliceIsometry, Matrix.one_apply]

/-- `sliceIsometry` is an isometry: its columns are distinct standard basis vectors.  This is
`Matrix.submatrix_one`, whose injectivity hypothesis is exactly `glue_left_injective`. -/
theorem sliceIsometry_conjTranspose_mul_self (h : S ⊆ T) (z : Reg loc (T \ S)) :
    (sliceIsometry 𝕜 z)ᴴ * (sliceIsometry 𝕜 z) = 1 := by
  simp [sliceIsometry_eq_submatrix_one, ← Matrix.submatrix_mul _ _ _ id _ Function.bijective_id,
    Matrix.submatrix_one _ (glue_left_injective h z)]

/-- The partial trace as a sum of isometry conjugations. (v4.36 deviation: the donor's
one-line `simp [ptrace, Matrix.sum_apply, mul_apply, sliceIsometry]` no longer closes the
entry collapse; the collapse is done by hand below.) -/
theorem ptrace_eq_sum_conj (h : S ⊆ T) (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    ptrace h M = ∑ z : Reg loc (T \ S),
      ((sliceIsometry 𝕜 z)ᴴ * M * (sliceIsometry 𝕜 z) : Matrix (Reg loc S) (Reg loc S) 𝕜) := by
  ext x y
  simp only [ptrace, Matrix.of_apply]
  rw [Matrix.sum_apply]
  refine Finset.sum_congr rfl fun z _ => ?_
  simp only [Matrix.mul_apply, sliceIsometry, Matrix.of_apply, conjTranspose_apply]
  simp

/-- The partial trace of a positive semidefinite matrix is positive semidefinite. -/
theorem posSemidef_ptrace (h : S ⊆ T) {M : Matrix (Reg loc T) (Reg loc T) 𝕜} (hM : M.PosSemidef) :
    (ptrace h M).PosSemidef := by
  classical
  rw [ptrace_eq_sum_conj]
  exact Matrix.posSemidef_sum _ fun z _ => hM.conjTranspose_mul_mul_same _

end DecEqLoc

/-- The partial trace preserves the trace. -/
theorem trace_ptrace (h : S ⊆ T) (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    (ptrace h M).trace = M.trace := by
  simp [trace, ptrace, ← Fintype.sum_prod_type', ← (glueEquiv h).sum_comp]

variable [∀ i, DecidableEq (loc i)]

/-- Extend a matrix on the subregion `S` to `T` by tensoring with the identity on
`T \ S` (entrywise form). -/
noncomputable def extendId (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    Matrix (Reg loc T) (Reg loc T) 𝕜 :=
  Matrix.of fun w w' =>
    if restr (S := T \ S) (T := T) Finset.sdiff_subset w
        = restr (S := T \ S) (T := T) Finset.sdiff_subset w'
    then A (restr h w) (restr h w') else 0

/-! ## QuantumInfo/Region/State.lean (verbatim subset) -/

open scoped ComplexOrder

/-- A subnormalized state: positive semidefinite with real trace at most one. -/
@[ext] structure SubState (ι : Type*) [Fintype ι] (𝕜 : Type*) [RCLike 𝕜] where
  /-- the (sub)density matrix -/
  M : Matrix ι ι 𝕜
  /-- positive semidefiniteness -/
  psd : M.PosSemidef
  /-- subnormalization: real trace at most one -/
  tr_le_one : RCLike.re M.trace ≤ 1

/-- A (normalized) state: a subnormalized state of unit trace. -/
structure MState (ι : Type*) [Fintype ι] (𝕜 : Type*) [RCLike 𝕜] extends SubState ι 𝕜 where
  /-- normalization: unit trace -/
  tr_eq_one : RCLike.re M.trace = 1

/-- A normalized state is determined by its density matrix. -/
@[ext] theorem MState.ext {ι : Type*} [Fintype ι] {ρ τ : MState ι 𝕜} (h : ρ.M = τ.M) : ρ = τ := by
  rwa [MState.mk.injEq, SubState.ext_iff]

namespace SubState

/-- Restrict a state on the region `T` to a subregion `S ⊆ T` by the partial trace. -/
noncomputable def restrict (h : S ⊆ T) (ρ : SubState (Reg loc T) 𝕜) : SubState (Reg loc S) 𝕜 where
  M := ptrace h ρ.M
  psd := posSemidef_ptrace h ρ.psd
  tr_le_one := trace_ptrace h ρ.M ▸ ρ.tr_le_one

/-- The density matrix of a restricted subnormalized state is the partial trace. -/
@[simp] theorem restrict_M (h : S ⊆ T) (ρ : SubState (Reg loc T) 𝕜) :
    (ρ.restrict h).M = ptrace h ρ.M := rfl

/-- **Identity law** for restriction: the state-level counterpart of `ptrace_self`. -/
@[simp] theorem restrict_self (ρ : SubState (Reg loc U) 𝕜) :
    ρ.restrict (Finset.Subset.refl U) = ρ :=
  SubState.ext (ptrace_self _)

/-- The von Neumann entropy of a subnormalized state (natural-log convention). -/
noncomputable def entropy {ι : Type*} [Fintype ι] [DecidableEq ι] (ρ : SubState ι 𝕜) : ℝ :=
  vonNeumann ρ.psd.isHermitian

/-- The entropy of a state is the Shannon entropy of its spectrum. -/
theorem entropy_eq_H (ρ : SubState ι 𝕜) : ρ.entropy = H ρ.psd.isHermitian.eigenvalues :=
  vonNeumann_eq_H _

end SubState

namespace MState

/-- Alternative constructor: one does not need to check subnormalization, since unit trace
implies it.  This discharges the inherited `tr_le_one` field. -/
@[simps] def mk' {ι : Type*} [Fintype ι] {M : Matrix ι ι 𝕜} (psd : M.PosSemidef)
    (tr_eq_one : RCLike.re M.trace = 1) : MState ι 𝕜 where
  M := M
  psd := psd
  tr_le_one := tr_eq_one.le
  tr_eq_one := tr_eq_one

/-- Restriction of a normalized state to a subregion.  The partial trace preserves the
trace, so the result is again normalized. -/
noncomputable def restrict (h : S ⊆ T) (ρ : MState (Reg loc T) 𝕜) : MState (Reg loc S) 𝕜 :=
  ⟨ρ.toSubState.restrict h, trace_ptrace h ρ.M ▸ ρ.tr_eq_one⟩

/-- The density matrix of a restricted normalized state is the partial trace. -/
@[simp] theorem restrict_M (h : S ⊆ T) (ρ : MState (Reg loc T) 𝕜) :
    (ρ.restrict h).M = ptrace h ρ.M := rfl

/-- **Identity law** for restriction of a normalized state. -/
@[simp] theorem restrict_self (ρ : MState (Reg loc U) 𝕜) :
    ρ.restrict (Finset.Subset.refl U) = ρ :=
  MState.ext (ptrace_self _)

/-- Restricting a normalized state agrees with restricting it as a subnormalized one. -/
@[simp] theorem toSubState_restrict (h : S ⊆ T) (ρ : MState (Reg loc T) 𝕜) :
    (ρ.restrict h).toSubState = ρ.toSubState.restrict h := rfl

end MState

/-! ## Region entropies of a global state -/

-- `entropy` needs a decidable index, so decidability enters with the region entropies; the
-- restriction layer above is free of it.
variable {X : Finset σ}

namespace SubState

/-- Entropy of the region `X` of a global (sub)state on `U`. -/
noncomputable def regionEntropy (ρ : SubState (Reg loc U) 𝕜) (h : X ⊆ U) : ℝ :=
  (ρ.restrict h).entropy

/-- `regionEntropy` unfolds to the entropy of the restricted state. -/
theorem regionEntropy_def (ρ : SubState (Reg loc U) 𝕜) (h : X ⊆ U) :
    ρ.regionEntropy h = (ρ.restrict h).entropy := rfl

end SubState
end Arealaw

/-! ## OpenAI/Statements.lean (verbatim subset: the Theorem 1.1 statement layer) -/

namespace OpenAI

open Arealaw
open scoped ComplexOrder MatrixOrder Matrix.Norms.L2Operator Pointwise
open Matrix SimpleGraph

/-- Adjacency in the square lattice `hasse ℤ □ hasse ℤ` is decidable: one coordinate agrees and
the other changes by one. -/
instance instDecidableRelAdjSquareLattice : DecidableRel (hasse ℤ □ hasse ℤ).Adj :=
  fun x y => decidable_of_iff ((x.1 + 1 = y.1 ∨ y.1 + 1 = x.1) ∧ x.2 = y.2 ∨
      (x.2 + 1 = y.2 ∨ y.2 + 1 = x.2) ∧ x.1 = y.1)
    (by simp only [boxProd_adj, hasse_adj, Order.covBy_iff_add_one_eq])

/-- The graph distance `d_Λ` of the square-lattice graph induced on a finite domain
`Λ ⊂ ℤ²` [OAI265, §1.1]: `⊤` between different components of `Λ`, and `⊤` when either point
lies outside `Λ`. -/
noncomputable def domainEDist (Λ : Finset (ℤ × ℤ)) (x y : ℤ × ℤ) : ℕ∞ :=
  if h : x ∈ Λ ∧ y ∈ Λ then
    ((hasse ℤ □ hasse ℤ).induce (Λ : Set (ℤ × ℤ))).edist ⟨x, h.1⟩ ⟨y, h.2⟩
  else ⊤

/-- The diameter `diam_{d_Λ} X` of a set of sites in the induced-graph distance
[OAI265, eq. (1.1)]. -/
noncomputable def domainEDiam (Λ X : Finset (ℤ × ℤ)) : ℕ∞ :=
  ⨆ x ∈ X, ⨆ y ∈ X, domainEDist Λ x y

/-- The edge boundary `∂_Λ A` [OAI265, §1.1]: nearest-neighbour pairs `(x, y)` with `x ∈ A`
and `y ∈ Λ \ A`.  Each crossing edge `{x, y}` of the paper appears once, oriented out of `A`,
so the cardinality is the paper's `|∂_Λ A|`. -/
noncomputable def edgeBoundary (Λ A : Finset (ℤ × ℤ)) : Finset ((ℤ × ℤ) × (ℤ × ℤ)) :=
  (hasse ℤ □ hasse ℤ).interedges A (Λ \ A)

/-- The local family of the square lattice: every site carries `Fin q`, the basis of `ℂ^q`
[OAI265, §1.1]. -/
abbrev Qudits (q : ℕ) : ℤ × ℤ → Type := fun _ => Fin q

/-- The admissible supports of eq. (1.1): nonempty `X ⊆ Λ` with `diam_{d_Λ} X ≤ R`
[OAI265, eq. (1.1)]. -/
noncomputable def supports (Λ : Finset (ℤ × ℤ)) (R : ℕ) : Finset (Finset (ℤ × ℤ)) :=
  Λ.powerset.filter fun X => X.Nonempty ∧ domainEDiam Λ X ≤ R

variable {𝕜 : Type*} [RCLike 𝕜] {q : ℕ}

/-- The Hamiltonian `H = ∑_X h_X` of [OAI265, eq. (1.1)]: each term acts on its support
`X ⊆ Λ` and as the identity elsewhere. -/
noncomputable def hamiltonian (Λ : Finset (ℤ × ℤ))
    (Φ : (X : Finset (ℤ × ℤ)) → Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) 𝕜) :
    Matrix (Reg (Qudits q) Λ) (Reg (Qudits q) Λ) 𝕜 :=
  ∑ X ∈ Λ.powerset.attach, extendId (Finset.mem_powerset.1 X.2) (Φ X.1)

/-- An admissible interaction of range `R` and strength `J` [OAI265, eq. (1.1)]: every term
is Hermitian with operator norm at most `J`, and a term vanishes unless its support is
nonempty with `d_Λ`-diameter at most `R`. -/
def IsAdmissible (Λ : Finset (ℤ × ℤ)) (R : ℕ) (J : ℝ)
    (Φ : (X : Finset (ℤ × ℤ)) → Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) 𝕜) : Prop :=
  ∀ X ⊆ Λ, (Φ X).IsHermitian ∧ ‖Φ X‖ ≤ J ∧ (X ∉ supports Λ R → Φ X = 0)

/-- The global gap of Theorem 1.1 in Loewner form, `H - E₀ ≥ Δ (1 - |Ω⟩⟨Ω|)`
[OAI265, Theorem 1.1 (§1.1) and Proposition 4.3 (§4.2)]. -/
def HasGlobalGap {ι : Type*} [Fintype ι] [DecidableEq ι] (H : Matrix ι ι 𝕜) (Ω : ι → 𝕜)
    (E₀ Δ : ℝ) : Prop :=
  (Δ : 𝕜) • (1 - vecMulVec Ω (star Ω)) ≤ H - (E₀ : 𝕜) • 1

/-- The pure state `|Ω⟩⟨Ω|` of a unit vector.  The normalization is the field `MState`
needs. -/
noncomputable def pureState {ι : Type*} [Fintype ι] (Ω : ι → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) :
    MState ι 𝕜 :=
  MState.mk' (posSemidef_vecMulVec_self_star Ω)
    (by rw [trace_vecMulVec, dotProduct_comm, hΩ, RCLike.one_re])

/-- **Theorem 1.1** [OAI265, §1.1, eq. (1.2)], for fixed `q`, `R`, `J` and `Δ`: one constant
`C` bounds `S_Ω(A) ≤ C |∂_Λ A|` for every finite domain `Λ ⊂ ℤ²`, every admissible
Hamiltonian (eq. (1.1)) with a normalized eigenvector `Ω` of eigenvalue `E₀` and global gap
`H - E₀ ≥ Δ (1 - |Ω⟩⟨Ω|)`, and every `A ⊆ Λ`. -/
def AreaLaw (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) : Prop :=
  ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ),
    ∀ Φ : (X : Finset (ℤ × ℤ)) → Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) 𝕜,
      IsAdmissible Λ R J Φ →
    ∀ (Ω : Reg (Qudits q) Λ → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
      hamiltonian Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω → HasGlobalGap (hamiltonian Λ Φ) Ω E₀ Δ →
    ∀ (A : Finset (ℤ × ℤ)) (hA : A ⊆ Λ),
      (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary Λ A).card

end OpenAI

/-! ## openai-math PEPSFilters/Basic.lean :10–147 (verbatim preamble subset) -/

namespace OAI

noncomputable section
open scoped BigOperators ComplexOrder
namespace PolynomialPEPS.PinnedEntropy

abbrev Vertex (L : ℕ) := Fin L × Fin L

def ForwardAdjacent {L : ℕ} (v w : Vertex L) : Prop :=
  (v.1.val + 1 = w.1.val ∧ v.2 = w.2) ∨
  (v.1 = w.1 ∧ v.2.val + 1 = w.2.val)

abbrev Edge (L : ℕ) := {e : Vertex L × Vertex L // ForwardAdjacent e.1 e.2}

instance edgeFintype (L : ℕ) : Fintype (Edge L) := Fintype.ofFinite _

def Incident {L : ℕ} (v : Vertex L) (e : Edge L) : Prop :=
  v = e.val.1 ∨ v = e.val.2

abbrev IncidentEdge {L : ℕ} (v : Vertex L) := {e : Edge L // Incident v e}
instance incidentFintype {L : ℕ} (v : Vertex L) : Fintype (IncidentEdge v) :=
  Fintype.ofFinite _

abbrev Configuration (L q : ℕ) := Vertex L → Fin q
abbrev State (L q : ℕ) := EuclideanSpace ℂ (Configuration L q)
abbrev Operator (L q : ℕ) := Matrix (Configuration L q) (Configuration L q) ℂ
abbrev RegionConfiguration {L : ℕ} (q : ℕ) (S : Finset (Vertex L)) :=
  {v : Vertex L // v ∈ S} → Fin q

def liftLocal {L q : ℕ} (S : Finset (Vertex L))
    (a : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ) :
    Operator L q := fun x y =>
  if ∀ v, v ∉ S → x v = y v then
    a (fun v => x v.val) (fun v => y v.val)
  else 0

def SupportedOn {L q : ℕ} (a : Operator L q) (S : Finset (Vertex L)) : Prop :=
  ∃ aS : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ,
    a = liftLocal S aS

def EdgeSites {L : ℕ} (e : Edge L) : Finset (Vertex L) := {e.val.1, e.val.2}

def Hamiltonian {L q : ℕ} (hv : Vertex L → Operator L q)
    (he : Edge L → Operator L q) : Operator L q :=
  (∑ v, hv v) + ∑ e, he e

def asMap {L q : ℕ} (a : Operator L q) : State L q →L[ℂ] State L q :=
  Matrix.toEuclideanCLM (n := Configuration L q) (𝕜 := ℂ) a

def opNorm {L q : ℕ} (a : Operator L q) : ℝ := ‖asMap a‖

def IsGridHamiltonian {L q : ℕ} (J : ℝ)
    (hv : Vertex L → Operator L q) (he : Edge L → Operator L q) : Prop :=
  (∀ v, SupportedOn (hv v) {v} ∧ opNorm (hv v) ≤ J) ∧
  (∀ e, SupportedOn (he e) (EdgeSites e) ∧ opNorm (he e) ≤ J) ∧
  (Hamiltonian hv he).IsHermitian

def phase (θ : ℝ) : ℂ := Complex.exp ((θ : ℂ) * Complex.I)

def UniqueGround {L q : ℕ} (H : Operator L q) (Ω : State L q) (E₀ : ℝ) : Prop :=
  ‖Ω‖ = 1 ∧
  asMap H Ω = (E₀ : ℂ) • Ω ∧
  (∀ ψ : State L q,
    E₀ * ‖ψ‖ ^ 2 ≤ (inner ℂ ψ (asMap H ψ)).re) ∧
  (∀ ψ : State L q, ‖ψ‖ = 1 →
    asMap H ψ = (E₀ : ℂ) • ψ →
    ∃ θ : ℝ, ψ = phase θ • Ω)

def FullSystemGap {L q : ℕ} (H : Operator L q) (Ω : State L q)
    (E₀ Δ : ℝ) : Prop :=
  ∀ ψ : State L q,
    Δ * (‖ψ‖ ^ 2 - ‖inner ℂ Ω ψ‖ ^ 2) ≤
      (inner ℂ ψ (asMap H ψ)).re - E₀ * ‖ψ‖ ^ 2

def joinConfigurations {L q : ℕ} (A : Finset (Vertex L))
    (x : RegionConfiguration q A) (z : RegionConfiguration q Aᶜ) :
    Configuration L q := by
  classical
  exact fun v => if h : v ∈ A then x ⟨v, h⟩ else z ⟨v, Finset.mem_compl.mpr h⟩

def coefficientMatrix {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    Matrix (RegionConfiguration q A) (RegionConfiguration q Aᶜ) ℂ :=
  fun x z => Ω (joinConfigurations A x z)

def reducedDensity {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    Matrix (RegionConfiguration q A) (RegionConfiguration q A) ℂ :=
  coefficientMatrix Ω A * (coefficientMatrix Ω A).conjTranspose

theorem reducedDensity_isHermitian {L q : ℕ} (Ω : State L q)
    (A : Finset (Vertex L)) : (reducedDensity Ω A).IsHermitian := by
  exact Matrix.isHermitian_mul_conjTranspose_self _

def vonNeumannEntropy {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) : ℝ :=
  ∑ i, Real.negMulLog ((reducedDensity_isHermitian Ω A).eigenvalues i)

def boundaryCard {L : ℕ} (A : Finset (Vertex L)) : ℕ := by
  classical
  exact Fintype.card {e : Edge L //
    (e.val.1 ∈ A ∧ e.val.2 ∉ A) ∨ (e.val.1 ∉ A ∧ e.val.2 ∈ A)}

def UniformAreaLaw : Prop :=
  ∀ (q : ℕ), 2 ≤ q → ∀ (J Δ : ℝ), 0 < J → 0 < Δ →
    ∃ C_A : ℝ, 0 < C_A ∧
      ∀ (L : ℕ), 2 ≤ L →
      ∀ (hv : Vertex L → Operator L q) (he : Edge L → Operator L q)
        (Ω : State L q) (E₀ : ℝ),
        IsGridHamiltonian J hv he →
        UniqueGround (Hamiltonian hv he) Ω E₀ →
        FullSystemGap (Hamiltonian hv he) Ω E₀ Δ →
        ∀ A : Finset (Vertex L),
          vonNeumannEntropy Ω A ≤ C_A * (boundaryCard A : ℝ)

end PolynomialPEPS.PinnedEntropy
end
end OAI

/-! ## Binding-surface anchors (BindingSurface pattern: the two endpoints, exact types) -/

#check @OpenAI.AreaLaw
#check @OAI.PolynomialPEPS.PinnedEntropy.UniformAreaLaw

#print axioms Arealaw.trace_ptrace
#print axioms Arealaw.posSemidef_ptrace
#print axioms Arealaw.vonNeumann_eq_H
#print axioms Arealaw.eigenvalues_multiset_submatrix_equiv
#print axioms OAI.PolynomialPEPS.PinnedEntropy.reducedDensity_isHermitian

