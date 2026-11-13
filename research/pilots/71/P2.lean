import Mathlib.AlgebraicGeometry.Morphisms.Smooth
import Mathlib.AlgebraicGeometry.Morphisms.Proper
import Mathlib.AlgebraicGeometry.Geometrically.Irreducible
import Mathlib.CategoryTheory.Comma.Over.Basic
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.LinearAlgebra.Dimension.Finrank

/-!
# Pilot 71 / P2 — the landing theorems (proof artifact: no `sorry`)

`research/pilots/71-prework.md` §2.5, executed after P1 (dictionary green,
`research/pilots/71/logs/run3.log`–`run4.log`): W1 the optimal window (the FF
Cureton–Thorner with constant exactly 1/2, DZDF-shaped pole exclusion), W2 exact
zero location (perfect zero-density), HW the Hasse–Weil point-count transport.
Self-contained (pilot-01 convention): the P1 dictionary layer is carried
verbatim. Mathlib `ff2494ea` only; the `WeilData` record is the Tier-C
transcription of `axiommath/Weil/LeanEval/WeilConjectures.lean:185-194`.
-/

open CategoryTheory AlgebraicGeometry

namespace Pilot71

/-! ## Carried definitions (P1, verbatim) -/

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

/-! ## Carried dictionary lemmas (P1, verbatim) -/

/-- **D1.** `‖q^{-s}‖ = q^{-σ}` in exponential form. -/
theorem norm_wOf (q : ℕ) (s : ℂ) :
    ‖wOf q s‖ = Real.exp (-(s.re * Real.log (q : ℝ))) := by
  simp only [wOf, Complex.norm_exp, Complex.neg_re, Complex.mul_re,
    Complex.ofReal_re, Complex.ofReal_im, mul_zero, sub_zero]

/-- Strict decay off the boundary line: `0 < σ → ‖q^{-s}‖ < 1`. -/
theorem norm_wOf_lt_one {q : ℕ} (hq : 1 < q) {s : ℂ} (hs : 0 < s.re) :
    ‖wOf q s‖ < 1 := by
  rw [norm_wOf, Real.exp_lt_one_iff, neg_lt_zero]
  exact mul_pos hs (Real.log_pos (by exact_mod_cast hq))

/-- **D1b.** Evaluating `P₁` at `w` is the multiset product `∏_{α ∈ A}(1 − αw)`. -/
theorem lPoly_eval (A : Multiset ℂ) (w : ℂ) :
    (lPoly A).eval w = (A.map fun α => 1 - α * w).prod := by
  induction A using Multiset.induction_on with
  | empty => simp [lPoly]
  | cons a A ih =>
    simp only [lPoly, Multiset.map_cons, Multiset.prod_cons, Polynomial.eval_mul,
      Polynomial.eval_sub, Polynomial.eval_one, Polynomial.eval_C, Polynomial.eval_X] at ih ⊢
    rw [ih]

/-- **D2.** Triangle inequality for `Multiset.sum`. -/
theorem multiset_norm_sum_le (s : Multiset ℂ) (f : ℂ → ℂ) :
    ‖(s.map f).sum‖ ≤ (s.map fun x => ‖f x‖).sum := by
  induction s using Multiset.induction_on with
  | empty => simp
  | cons a s ih =>
    rw [Multiset.map_cons, Multiset.map_cons, Multiset.sum_cons, Multiset.sum_cons]
    exact (norm_add_le _ _).trans (add_le_add (le_refl _) ih)

/-- **D3.** Duality extraction at `d = 1`: `A 2 = {q}`. -/
theorem a2_eq {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) : W.A 2 = {(Nat.card F : ℂ)} := by
  have h2 := W.duality 0 (by omega)
  rw [W.zero] at h2
  simp only [mul_one, pow_one, Multiset.map_singleton, div_one] at h2
  exact h2

/-! ## P2 new: the two core analytic lemmas -/

/-- **Core 1.** If `‖α‖ = √q` and `‖α‖·‖q^{-s}‖ = 1` then `σ = 1/2`: the modulus
arithmetic shared by W1 (numerator) and W2, via `‖wOf‖ = exp(−σ·log q)`,
`√q² = q`, and strict monotonicity of `Real.exp`. -/
theorem re_eq_half_of_norm_mul {q : ℕ} (hq : 1 < q) {α s : ℂ}
    (hα : ‖α‖ = √((q : ℝ))) (h : ‖α‖ * ‖wOf q s‖ = 1) : s.re = 1 / 2 := by
  have hqpos : 0 < (q : ℝ) := by exact_mod_cast (by omega : 0 < q)
  have hL : 0 < Real.log (q : ℝ) := Real.log_pos (by exact_mod_cast hq)
  have hqexp : Real.exp (Real.log (q : ℝ)) = (q : ℝ) := Real.exp_log hqpos
  have hw : ‖wOf q s‖ = Real.exp (-(s.re * Real.log (q : ℝ))) := norm_wOf q s
  have hsq : ‖α‖ ^ 2 = (q : ℝ) := by rw [hα, Real.sq_sqrt hqpos.le]
  have he2 : (Real.exp (-(s.re * Real.log (q : ℝ)))) ^ 2
      = Real.exp (-(2 * s.re * Real.log (q : ℝ))) := by
    rw [pow_two, ← Real.exp_add]
    exact congrArg _ (by ring)
  have hh : ‖α‖ * Real.exp (-(s.re * Real.log (q : ℝ))) = ‖α‖ * ‖wOf q s‖ := by rw [hw]
  have hkey : (‖α‖ * Real.exp (-(s.re * Real.log (q : ℝ)))) ^ 2 = 1 := by
    rw [hh, h, one_pow]
  have h1 : (q : ℝ) * Real.exp (-(2 * s.re * Real.log (q : ℝ))) = 1 := by
    have := hkey
    rw [mul_pow, hsq, he2] at this
    exact this
  have hneg : Real.exp (2 * s.re * Real.log (q : ℝ)) = (q : ℝ) := by
    have hinv : (Real.exp (2 * s.re * Real.log (q : ℝ)))⁻¹ = (q : ℝ)⁻¹ := by
      rw [← Real.exp_neg, eq_inv_of_mul_eq_one_right h1]
    exact inv_injective hinv
  have hle1 : 2 * s.re * Real.log (q : ℝ) ≤ Real.log (q : ℝ) :=
    Real.exp_le_exp.mp (by rw [hneg, hqexp])
  have hle2 : Real.log (q : ℝ) ≤ 2 * s.re * Real.log (q : ℝ) :=
    Real.exp_le_exp.mp (by rw [hqexp, hneg])
  have heq : 2 * s.re * Real.log (q : ℝ) = Real.log (q : ℝ) := le_antisymm hle1 hle2
  have hLne : Real.log (q : ℝ) ≠ 0 := hL.ne'
  field_simp at heq
  linarith

/-- **Core 2** (W1's pole exclusion, the DZDF `s ≠ 1` clause): `1 − q·q^{-s} ≠ 0`
for `s ≠ 1` — via `(q:ℂ) = exp(log q)`, `exp_add`, and `Complex.exp_eq_one_iff`. -/
theorem one_sub_card_mul_wOf_ne_zero {q : ℕ} (hq : 1 < q) {s : ℂ} (hs : s ≠ 1) :
    1 - (q : ℂ) * wOf q s ≠ 0 := by
  intro h0
  apply hs
  have hqpos : 0 < (q : ℝ) := by exact_mod_cast (by omega : 0 < q)
  have hL : 0 < Real.log (q : ℝ) := Real.log_pos (by exact_mod_cast hq)
  have hqc : ((q : ℕ) : ℂ) = Complex.exp ((Real.log (q : ℝ) : ℝ) : ℂ) := by
    rw [Complex.ofReal_exp, ← Real.exp_log hqpos]
    push_cast
  have h1 : (q : ℂ) * wOf q s = 1 := (sub_eq_zero.mp h0).symm
  rw [hqc, wOf, ← Complex.exp_add] at h1
  have h3 : ((Real.log (q : ℝ) : ℝ) : ℂ) * (1 - s)
      = ((Real.log (q : ℝ) : ℝ) : ℂ) + -(s * ((Real.log (q : ℝ) : ℝ) : ℂ)) := by
    push_cast
    ring
  rw [h3] at h1
  rcases mul_eq_zero.mp (Complex.exp_eq_one_iff.mp h1) with hL0 | h1s
  · exact absurd (Complex.ofReal_eq_zero.mp hL0) hL.ne'
  · exact (sub_eq_zero.mp h1s).symm

/-! ## W1 — the optimal window (FF-EZ1(ii)) -/

/-- **W1.** The function-field Cureton–Thorner statement with constant exactly
`1/2`: `ζ_C(s) ≠ 0` for `Re s > 1/2` (pole excluded), every curve, every `q`,
every genus — in the DZDF `Main.lean:9` statement shape. -/
theorem curve_zeta_ne_zero {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) (hq : 1 < Nat.card F) (s : ℂ) (hs : (1 / 2 : ℝ) < s.re) (hs1 : s ≠ 1) :
    zetaC (W.A 1) (Nat.card F) s ≠ 0 := by
  intro h0
  rw [zetaC, div_eq_zero_iff] at h0
  rcases h0 with hnum | hden
  · rw [lPoly_eval] at hnum
    obtain ⟨α, hαm, -⟩ := Multiset.prod_eq_zero_iff.mp hnum
    obtain ⟨a, haA, haeq⟩ := Multiset.mem_map.mp hαm
    have hαn : ‖a‖ = √((Nat.card F : ℝ)) := by
      simpa using (W.purity 1 (by omega) a haA).2
    have haw : a * wOf (Nat.card F) s = 1 := (sub_eq_zero.mp haeq).symm
    exact absurd (re_eq_half_of_norm_mul hq hαn
      (by rw [norm_mul, haw, norm_one])) (ne_of_gt hs)
  · rcases mul_eq_zero.mp hden with hd | hd
    · have hw1 : wOf (Nat.card F) s = 1 := (sub_eq_zero.mp hd).symm
      exact absurd (norm_wOf_lt_one hq (by linarith)) (by rw [hw1]; simp)
    · exact one_sub_card_mul_wOf_ne_zero hq hs1 hd

/-! ## W2 — exact zero location = perfect zero-density (FF-EZ5) -/

/-- **W2.** Every zero of the numerator `P₁(q^{-s})` lies exactly on `Re s = 1/2`
— the perfect zero-density theorem (the zero set is *on* the critical line, not
merely confined to a window). -/
theorem curve_zero_re_eq_half {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) (hq : 1 < Nat.card F) (s : ℂ)
    (h : (lPoly (W.A 1)).eval (wOf (Nat.card F) s) = 0) : s.re = 1 / 2 := by
  rw [lPoly_eval] at h
  obtain ⟨α, hαm, -⟩ := Multiset.prod_eq_zero_iff.mp h
  obtain ⟨a, haA, haeq⟩ := Multiset.mem_map.mp hαm
  have hαn : ‖a‖ = √((Nat.card F : ℝ)) := by
    simpa using (W.purity 1 (by omega) a haA).2
  have haw : a * wOf (Nat.card F) s = 1 := (sub_eq_zero.mp haeq).symm
  exact re_eq_half_of_norm_mul hq hαn (by rw [norm_mul, haw, norm_one])

/-! ## HW — the Hasse–Weil point-count transport (FF-EZ1(iii)) -/

/-- **HW.** `|#X(E) − (q^m + 1)| ≤ card(A 1) · (√q)^m` for every degree-`m`
extension `E`/`F` — uniform in the curve, `q`, genus and `m` (trap-free
magnitude statement; `card (A 1) = 2g` at Tier A). -/
theorem hasse_weil_point_count {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) (hq : 1 < Nat.card F) (m : ℕ) (hm : 0 < m)
    (E : Type _) [Field E] [Algebra F E] [FiniteDimensional F E]
    (hfrank : Module.finrank F E = m) :
    ‖(Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) : ℂ)
        - ((Nat.card F : ℂ) ^ m + 1)‖
      ≤ (W.A 1).card * (Real.sqrt (Nat.card F : ℝ)) ^ m := by
  have hpc : (Nat.card (Over.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) : ℂ)
      = 1 + (Nat.card F : ℂ) ^ m - ((W.A 1).map (· ^ m)).sum := by
    rw [W.pointCount E, hfrank]
    have hIic : (Finset.Iic 2 : Finset ℕ) = {0, 1, 2} := by decide
    rw [hIic, W.zero, a2_eq X W]
    simp
  have hdiff : ((Nat.card (Over.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) : ℂ)
      - ((Nat.card F : ℂ) ^ m + 1)) = -((W.A 1).map (· ^ m)).sum := by
    rw [hpc]
    ring
  rw [hdiff, norm_neg]
  calc ‖((W.A 1).map (· ^ m)).sum‖ ≤ ((W.A 1).map fun x => ‖x ^ m‖).sum :=
        multiset_norm_sum_le _ _
    _ = ((W.A 1).map fun _ => (Real.sqrt (Nat.card F : ℝ)) ^ m).sum := by
        refine Multiset.map_congr rfl ?_
        intro a ha
        have h1 := (W.purity 1 (by omega) a ha).2
        rw [norm_pow, h1]
        simp
    _ = (W.A 1).card * (Real.sqrt (Nat.card F : ℝ)) ^ m := by
        simp

/-! ## Axiom audit -/

#print axioms re_eq_half_of_norm_mul
#print axioms one_sub_card_mul_wOf_ne_zero
#print axioms curve_zeta_ne_zero
#print axioms curve_zero_re_eq_half
#print axioms hasse_weil_point_count
-- carried P1 layer (re-audited in this elaboration unit):
#print axioms norm_wOf
#print axioms norm_wOf_lt_one
#print axioms lPoly_eval
#print axioms multiset_norm_sum_le
#print axioms a2_eq

end Pilot71
