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

Statement delta (2026-11-14, lane A2-relaunch, runs p2-run1/p2-run2): W1's
prework-draft hypothesis `hs1 : s ≠ 1` was UNSOUND — complex `exp` is
`2πi`-periodic (no `Complex.exp_eq_one_iff` exists), so `q·q^{-s} = 1` holds on
the whole family `s ∈ 1 + (2πi/log q)·ℤ` (inside the window, `Re s = 1`), where
Lean's field division makes `zetaC = 0`. W1 therefore carries the honest
pole-family exclusion `1 − q·q^{-s} ≠ 0`, and Core 2 (`re_eq_one_of_card_mul_wOf`)
locates that family on `Re s = 1`. Same fix pattern as the P0 probe's role
dictates: elaboration green ≠ truth; recorded for the dossier addendum.
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

/-- **Core 2.** Every solution of `q · q^{-s} = 1` lies on the line `Re s = 1`:
the pole family is `s ∈ 1 + (2πi/log q)·ℤ` (period `2πi/log q`), so *within the
window* `Re s > 1/2` the denominator factor `1 − q·q^{-s}` vanishes exactly on
that line. Proof by modulus: `‖q · q^{-s}‖ = q · q^{-σ} = 1` forces `σ = 1`
via the REAL exponential kernel (`Real.exp_eq_one_iff`; complex `exp` is not
injective — `2πi`-periodic — so no `Complex.exp_eq_one_iff` exists). -/
theorem re_eq_one_of_card_mul_wOf {q : ℕ} (hq : 1 < q) {s : ℂ}
    (h : (q : ℂ) * wOf q s = 1) : s.re = 1 := by
  have hqpos : 0 < (q : ℝ) := by exact_mod_cast (by omega : 0 < q)
  have hL : 0 < Real.log (q : ℝ) := Real.log_pos (by exact_mod_cast hq)
  have hn : ‖(q : ℂ) * wOf q s‖ = 1 := by rw [h, norm_one]
  rw [norm_mul, Complex.norm_natCast, norm_wOf] at hn
  have h2 : Real.exp (Real.log (q : ℝ) + -(s.re * Real.log (q : ℝ))) = 1 := by
    rw [Real.exp_add, Real.exp_log hqpos]
    exact_mod_cast hn
  have h3 : Real.log (q : ℝ) + -(s.re * Real.log (q : ℝ)) = 0 := by
    refine Real.exp_eq_exp.mp ?_
    rw [h2, Real.exp_zero]
  have h4 : Real.log (q : ℝ) * (1 - s.re) = 0 := by linear_combination h3
  rcases mul_eq_zero.mp h4 with h | h
  · exact absurd h hL.ne'
  · linarith

/-- Sum of a constant map: the Multiset twin of `Finset.sum_const` (used by HW). -/
theorem multiset_sum_map_const {α : Type*} (s : Multiset α) (c : ℝ) :
    (s.map fun _ => c).sum = s.card * c := by
  induction s using Multiset.induction_on with
  | empty => simp
  | cons a s ih =>
    rw [Multiset.map_cons, Multiset.sum_cons, Multiset.card_cons, ih]
    push_cast
    ring

/-! ## W1 — the optimal window (FF-EZ1(ii)) -/

/-- **W1.** The function-field Cureton–Thorner statement with constant exactly
`1/2`: `ζ_C(s) ≠ 0` for `Re s > 1/2` off the pole family, every curve, every
`q`, every genus — in the DZDF `Main.lean:9` statement shape. Statement delta
vs the prework §2.5 draft (its `hs1 : s ≠ 1`): complex `exp` is `2πi`-periodic,
so `q · q^{-s} = 1` has the full family `s ∈ 1 + (2πi/log q)·ℤ` of solutions
(`Re s = 1`, inside the window — Core 2), at which the Lean-division `zetaC`
would be `0`. The honest FF translation of DZDF's single-pole `s ≠ 1` clause is
the pole-factor exclusion `1 − q·q^{-s} ≠ 0` carried here. -/
theorem curve_zeta_ne_zero {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) (hq : 1 < Nat.card F) (s : ℂ) (hs : (1 / 2 : ℝ) < s.re)
    (hs1 : 1 - (Nat.card F : ℂ) * wOf (Nat.card F) s ≠ 0) :
    zetaC (W.A 1) (Nat.card F) s ≠ 0 := by
  intro h0
  rw [zetaC, div_eq_zero_iff] at h0
  rcases h0 with hnum | hden
  · rw [lPoly_eval] at hnum
    obtain ⟨a, haA, haeq⟩ := Multiset.mem_map.mp (Multiset.prod_eq_zero_iff.mp hnum)
    have hαn : ‖a‖ = √((Nat.card F : ℝ)) := by
      simpa using (W.purity 1 (by omega) a haA).2
    have haw : a * wOf (Nat.card F) s = 1 := (sub_eq_zero.mp haeq).symm
    exact absurd (re_eq_half_of_norm_mul hq hαn
      (by rw [← norm_mul, haw, norm_one])) (ne_of_gt hs)
  · rcases mul_eq_zero.mp hden with hd | hd
    · have hw1 : wOf (Nat.card F) s = 1 := (sub_eq_zero.mp hd).symm
      have hlt := norm_wOf_lt_one hq (by linarith)
      rw [hw1, norm_one] at hlt
      exact lt_irrefl _ hlt
    · exact hs1 hd

/-! ## W2 — exact zero location = perfect zero-density (FF-EZ5) -/

/-- **W2.** Every zero of the numerator `P₁(q^{-s})` lies exactly on `Re s = 1/2`
— the perfect zero-density theorem (the zero set is *on* the critical line, not
merely confined to a window). -/
theorem curve_zero_re_eq_half {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) (hq : 1 < Nat.card F) (s : ℂ)
    (h : (lPoly (W.A 1)).eval (wOf (Nat.card F) s) = 0) : s.re = 1 / 2 := by
  rw [lPoly_eval] at h
  obtain ⟨a, haA, haeq⟩ := Multiset.mem_map.mp (Multiset.prod_eq_zero_iff.mp h)
  have hαn : ‖a‖ = √((Nat.card F : ℝ)) := by
    simpa using (W.purity 1 (by omega) a haA).2
  have haw : a * wOf (Nat.card F) s = 1 := (sub_eq_zero.mp haeq).symm
  exact re_eq_half_of_norm_mul hq hαn (by rw [← norm_mul, haw, norm_one])

/-! ## HW — the Hasse–Weil point-count transport (FF-EZ1(iii)) -/

/-- **HW.** `|#X(E) − (q^m + 1)| ≤ card(A 1) · (√q)^m` for every degree-`m`
extension `E`/`F` — uniform in the curve, `q`, genus and `m` (trap-free
magnitude statement; `card (A 1) = 2g` at Tier A). -/
theorem hasse_weil_point_count {F : Type*} [Finite F] [Field F] (X : Over (Spec (.of F)))
    [GeometricallyIrreducible X.hom] [IsProper X.hom] [SmoothOfRelativeDimension 1 X.hom]
    (W : WeilData F X 1) (_hq : 1 < Nat.card F) (m : ℕ) (_hm : 0 < m)
    (E : Type _) [Field E] [Algebra F E] [FiniteDimensional F E]
    (hfrank : Module.finrank F E = m) :
    ‖(Nat.card (.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) : ℂ)
        - ((Nat.card F : ℂ) ^ m + 1)‖
      ≤ (W.A 1).card * (Real.sqrt (Nat.card F : ℝ)) ^ m := by
  have hpc : (Nat.card (Over.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) : ℂ)
      = 1 + (Nat.card F : ℂ) ^ m - ((W.A 1).map (· ^ m)).sum := by
    rw [W.pointCount E, hfrank]
    have hIic : (Finset.Iic 2 : Finset ℕ) = {0, 1, 2} := by decide
    have m02 : (0 : ℕ) ∉ ({1, 2} : Finset ℕ) := by decide
    have m12 : (1 : ℕ) ∉ ({2} : Finset ℕ) := by decide
    have e0 : ((W.A 0).map (fun x : ℂ => x ^ m)).sum = 1 := by
      rw [W.zero]; simp
    have e2 : ((W.A 2).map (fun x : ℂ => x ^ m)).sum = (Nat.card F : ℂ) ^ m := by
      rw [a2_eq X W]; simp
    have p2 : (-1 : ℂ) ^ 2 = 1 := by simp [sq]
    rw [hIic, Finset.sum_insert m02, Finset.sum_insert m12, Finset.sum_singleton,
      e0, e2, pow_zero, pow_one, p2]
    ring
  have hdiff : ((Nat.card (Over.mk (Spec.map <| CommRingCat.ofHom <| algebraMap F E) ⟶ X) : ℂ)
      - ((Nat.card F : ℂ) ^ m + 1)) = -((W.A 1).map (· ^ m)).sum := by
    rw [hpc]
    ring
  rw [hdiff, norm_neg]
  calc ‖((W.A 1).map (· ^ m)).sum‖ ≤ ((W.A 1).map fun x => ‖x ^ m‖).sum :=
        multiset_norm_sum_le _ _
    _ = ((W.A 1).map fun _ => (Real.sqrt (Nat.card F : ℝ)) ^ m).sum := by
        refine congrArg Multiset.sum (Multiset.map_congr rfl ?_)
        intro a ha
        have h1 := (W.purity 1 (by omega) a ha).2
        rw [norm_pow, h1]
        simp
    _ = (W.A 1).card * (Real.sqrt (Nat.card F : ℝ)) ^ m :=
        multiset_sum_map_const _ _

/-! ## Axiom audit -/

#print axioms re_eq_half_of_norm_mul
#print axioms re_eq_one_of_card_mul_wOf
#print axioms multiset_sum_map_const
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
