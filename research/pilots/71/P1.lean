import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Geometrically.Irreducible
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank

/-!
# Pilot 71 / P1 — the dictionary layer (proof artifact: no `sorry`)

`research/pilots/71-prework.md` §2.4: D0 (side-condition plumbing), D1 (the
modulus dictionary `‖q^{-s}‖ = q^{-σ}` in exponential form), D1b (the
L-polynomial evaluation bridge), D2 (multiset norm-sum; absent from mathlib),
D3 (duality extraction `A 2 = {q}`). Mathlib `ff2494ea` only; the `WeilData`
record is the Tier-C transcription of
`axiommath/Weil/LeanEval/WeilConjectures.lean:185-194` (statement layer; no
Weil/Stacks imports). `#print axioms` at the end audits every lemma.
-/

open CategoryTheory AlgebraicGeometry

namespace Pilot71

/-! ## The binder packaging (transcription; see P0.lean for the stubbed targets) -/

/-- Tier-C transcription of the existential content of
`LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures`
(WeilConjectures.lean:185-194), per `(F, X, d)`. -/
structure WeilData (F : Type*) [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] (d : ℕ)
    [SmoothOfRelativeDimension d X.hom] where
  /-- The eigenvalue multisets `A i` (Frobenius on `H^i(X_F̄, ℚ_ℓ)`, sent to `ℂ`). -/
  A : ℕ → Multiset ℂ
  zero : A 0 = {1}
  duality : ∀ i ≤ 2 * d, A (2 * d - i) = (A i).map (Nat.card F ^ d / · : ℂ → ℂ)
  galois : ∀ i ≤ 2 * d, ∀ φ : ℂ ≃+* ℂ, (A i).map φ = A i
  purity : ∀ i ≤ 2 * d, ∀ α ∈ A i, IsIntegral ℤ α ∧ ‖α‖ = √(Nat.card F ^ i)
  pointCount : ∀ (E : Type _) [Field E] [Algebra F E] [FiniteDimensional F E],
    Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) =
      ∑ i ∈ Finset.Iic (2 * d), (-1) ^ i * ((A i).map (· ^ Module.finrank F E)).sum

/-- `T = q^{-s}`, entire in `s` by construction (no `cpow`, no `rpow`). -/
noncomputable def wOf (q : ℕ) (s : ℂ) : ℂ := Complex.exp (-(s * (Real.log (q : ℝ) : ℂ)))

/-- `P₁(T) = ∏_{α ∈ A} (1 − αT)`, the L-polynomial carried by an eigenvalue multiset. -/
noncomputable def lPoly (A : Multiset ℂ) : Polynomial ℂ :=
  (A.map fun α => 1 - Polynomial.C α * Polynomial.X).prod

/-- The s-plane zeta of a curve, from the `d = 1` eigenvalue multiset:
`ζ_C(s) = P₁(q^{-s}) / ((1 − q^{-s})(1 − q·q^{-s}))`. -/
noncomputable def zetaC (A : Multiset ℂ) (q : ℕ) (s : ℂ) : ℂ :=
  (lPoly A).eval (wOf q s) / ((1 - wOf q s) * (1 - (q : ℂ) * wOf q s))

/-! ## D0 — side-condition plumbing -/

/-- A finite field has at least two elements (the `1 < q` side condition of the
P2 theorems, from `Fintype.one_lt_card`). -/
theorem one_lt_card_field (F : Type*) [Field F] [Finite F] : 1 < Nat.card F := by
  haveI := Fintype.ofFinite F
  rw [Nat.card_eq_fintype_card]
  exact Fintype.one_lt_card

/-! ## D1 — the modulus dictionary -/

/-- **D1.** `‖q^{-s}‖ = q^{-σ}` in exponential form: the load-bearing lemma of
the dictionary (`Complex.norm_exp` + `Real.log` landing on the real axis). -/
theorem norm_wOf (q : ℕ) (s : ℂ) :
    ‖wOf q s‖ = Real.exp (-(s.re * Real.log (q : ℝ))) := by
  simp only [wOf, Complex.norm_exp, Complex.neg_re, Complex.mul_re,
    Complex.ofReal_re, Complex.ofReal_im, mul_zero, sub_zero]

/-- `q^{-s}` never vanishes (positivity in exponential form). -/
theorem norm_wOf_pos (q : ℕ) (s : ℂ) : 0 < ‖wOf q s‖ := by
  rw [norm_wOf]
  exact Real.exp_pos _

/-- Strict decay off the boundary line: `0 < σ → ‖q^{-s}‖ < 1`. -/
theorem norm_wOf_lt_one {q : ℕ} (hq : 1 < q) {s : ℂ} (hs : 0 < s.re) :
    ‖wOf q s‖ < 1 := by
  rw [norm_wOf, Real.exp_lt_one_iff, neg_lt_zero]
  exact mul_pos hs (Real.log_pos (by exact_mod_cast hq))

/-! ## D1b — the L-polynomial evaluation bridge -/

/-- **D1b.** Evaluating `P₁` at `w` is the multiset product `∏_{α ∈ A}(1 − αw)`:
the bridge between the polynomial side and the multiset side (consumed by W1/W2). -/
theorem lPoly_eval (A : Multiset ℂ) (w : ℂ) :
    (lPoly A).eval w = (A.map fun α => 1 - α * w).prod := by
  induction A using Multiset.induction_on with
  | empty => simp [lPoly]
  | cons a A ih =>
    simp only [lPoly, Multiset.map_cons, Multiset.prod_cons, Polynomial.eval_mul,
      Polynomial.eval_sub, Polynomial.eval_one, Polynomial.eval_C, Polynomial.eval_X] at ih ⊢
    rw [ih]

/-! ## D2 — multiset norm-sum (absent from mathlib; Finset form exists) -/

/-- **D2.** Triangle inequality for `Multiset.sum`: `‖∑_{x ∈ s} f x‖ ≤ ∑_{x ∈ s} ‖f x‖`. -/
theorem multiset_norm_sum_le (s : Multiset ℂ) (f : ℂ → ℂ) :
    ‖(s.map f).sum‖ ≤ (s.map fun x => ‖f x‖).sum := by
  induction s using Multiset.induction_on with
  | empty => simp
  | cons a s ih =>
    rw [Multiset.map_cons, Multiset.map_cons, Multiset.sum_cons, Multiset.sum_cons]
    exact (norm_add_le _ _).trans (add_le_add (le_refl _) ih)

/-! ## D3 — duality extraction -/

/-- **D3.** From the duality clause at `d = 1`, `i = 0`: `A 2 = {q}` (Poincaré
duality on the multiset: the top eigenvalue is `q`; consumed by HW). -/
theorem a2_eq {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) : W.A 2 = {(Nat.card F : ℂ)} := by
  have h2 := W.duality 0 (by omega)
  rw [W.zero] at h2
  simp only [mul_one, pow_one, Multiset.map_singleton, div_one] at h2
  exact h2

/-! ## Axiom audit (P3 discipline applied early) -/

#print axioms one_lt_card_field
#print axioms norm_wOf
#print axioms norm_wOf_pos
#print axioms norm_wOf_lt_one
#print axioms lPoly_eval
#print axioms multiset_norm_sum_le
#print axioms a2_eq

end Pilot71
