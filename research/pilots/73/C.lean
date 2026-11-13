import Mathlib.RingTheory.PowerSeries.Basic
import Mathlib.RingTheory.Ideal.Basic
import Mathlib.Algebra.CharP.CharAndCard
import Mathlib.Algebra.Polynomial.Eval.SMul
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Analysis.Real.Sqrt
import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Analysis.Calculus.Deriv.Polynomial
import Mathlib.Analysis.Calculus.Deriv.Inv
import Mathlib.Analysis.SpecialFunctions.ExpDeriv
import Mathlib.Data.Fintype.Pi

/-!
# Pilot 73 / C — the Tier-C binder layer (proof artifact: no `sorry`)

`research/pilots/73-prework.md` §2, executed after Q0 (statement probe green,
`research/pilots/73/logs/run1-q0.log`): Q1 the DZDF `RayClassCharacter`
transplant onto k[X] + its Hecke series `L(T,χ) = Σ_{f monic} χ(span f) T^{deg f}`
over `PowerSeries ℂ` + the 71-glue dictionary (duplicated per the pilot-01
self-contained convention) + the vanishing/coprime-cone and vacuity lemmas;
Q2 (P)(i) meromorphic continuation from rationality; Q3 (P)(ii) the sharp
1/2 window under the purity binder (71's W2 numerator step one factor level
up). Scope fence (prework §1): Q4 — the `hRat` discharge for the 𝔽_q[T] probe
class — is a SEPARATE orchestrator gate and is NOT attempted here; the
FE/root-number layer and general curves are out of Tier-C scope.

Honesty note (prework §2.4, correcting dossier 73 step 5): `hPur` is the RH
for the Kummer covers of ℙ¹ (Weil II) — never discharged in this pilot, not
Gauss-sum-elementary. Mathlib `ff2494ea` only; zero import gates.
-/

open Polynomial

namespace Pilot73

/-! ## 71-glue (carried verbatim from `research/pilots/71/P1.lean`+`P2.lean`,
green there; ~55 LoC duplication per the pilot-01 convention) -/

/-- `T = q^{-s}`, entire in `s` by construction (no `cpow`, no `rpow`). -/
noncomputable def wOf (q : ℕ) (s : ℂ) : ℂ := Complex.exp (-(s * (Real.log (q : ℝ) : ℂ)))

/-- **D1.** `‖q^{-s}‖ = q^{-σ}` in exponential form. -/
theorem norm_wOf (q : ℕ) (s : ℂ) :
    ‖wOf q s‖ = Real.exp (-(s.re * Real.log (q : ℝ))) := by
  simp only [wOf, Complex.norm_exp, Complex.neg_re, Complex.mul_re,
    Complex.ofReal_re, Complex.ofReal_im, mul_zero, sub_zero]

/-- `P(T) = ∏_{a ∈ A}(1 − aT)`, the L-polynomial carried by a multiset. -/
noncomputable def lPoly (A : Multiset ℂ) : Polynomial ℂ :=
  (A.map fun α => 1 - Polynomial.C α * Polynomial.X).prod

/-- **D1b.** `P(w) = ∏_{a ∈ A}(1 − a·w)`. -/
theorem lPoly_eval (A : Multiset ℂ) (w : ℂ) :
    (lPoly A).eval w = (A.map fun α => 1 - α * w).prod := by
  induction A using Multiset.induction_on with
  | empty => simp [lPoly]
  | cons a A ih =>
    simp only [lPoly, Multiset.map_cons, Multiset.prod_cons, Polynomial.eval_mul,
      Polynomial.eval_sub, Polynomial.eval_one, Polynomial.eval_C, Polynomial.eval_X] at ih ⊢
    rw [ih]

/-- **Core 1.** If `‖a‖ = √q` and `‖a‖·‖q^{-s}‖ = 1` then `σ = 1/2`. -/
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

/-! ## Q1 — the FF ray-class character and its Hecke series -/

/-- The 𝔽_q[T] ray-class characters: DZDF's `RayClassCharacter`
(`Challenge/DedekindZetaChallenge.lean:14-20`) transplanted onto the
function-field PID k[X] (k finite), modulus the ideal `m ⊆ k[X]`.
Field-by-field parity with the donor; the single transplant delta is
`map_span'` losing DZDF's archimedean conjunct `(∀ φ : F →+* ℝ, 0 < φ α)` —
vacuous per `no_real_homs` below. -/
structure FFRayClassCharacter (k : Type*) [Field k] [Fintype k]
    (m : Ideal (Polynomial k)) where
  /-- The character, as a function on the ideals of k[X]. -/
  toFun : Ideal (Polynomial k) → ℂ
  map_mul' : ∀ I J, toFun (I * J) = toFun I * toFun J
  map_top' : toFun ⊤ = 1
  eq_zero_iff' : ∀ I, toFun I = 0 ↔ (I = ⊥ ∨ I ⊔ m ≠ ⊤)
  map_span' : ∀ f : Polynomial k, f ≠ 0 → f - 1 ∈ m → toFun (Ideal.span {f}) = 1

instance (k : Type*) [Field k] [Fintype k] (m : Ideal (Polynomial k)) :
    CoeFun (FFRayClassCharacter k m) (fun _ => Ideal (Polynomial k) → ℂ) :=
  ⟨FFRayClassCharacter.toFun⟩

/-- The transplant's vacuity clause: no unital ring homomorphisms 𝔽_q →+* ℝ
(char p, p ≠ 0 by finiteness, vs char 0). -/
theorem no_real_homs (k : Type*) [Field k] [Fintype k] : IsEmpty (k →+* ℝ) := by
  refine ⟨fun φ => ?_⟩
  have h0 : (ringChar k : k) = 0 := CharP.cast_eq_zero k (ringChar k)
  have hne : ringChar k ≠ 0 := CharP.char_ne_zero_of_finite k (ringChar k)
  apply hne
  apply_fun φ at h0
  simp only [map_natCast, map_zero] at h0
  exact Nat.cast_eq_zero.mp h0

/-- χ vanishes off the coprime cone, in the donor's own ideal vocabulary
(the `eq_zero_iff'` reading on principal ideals; `span {f} ⊔ m = ⊤` is
coprimality of `f` from `m` in the PID k[X]). -/
theorem apply_span_singleton_eq_zero_iff {k : Type*} [Field k] [Fintype k]
    {m : Ideal (Polynomial k)} (χ : FFRayClassCharacter k m) {f : Polynomial k}
    (hf : f ≠ 0) :
    χ.toFun (Ideal.span {f}) = 0 ↔ (Ideal.span {f}) ⊔ m ≠ ⊤ := by
  rw [χ.eq_zero_iff', Ideal.span_singleton_eq_bot]
  simp [hf]

/-- Monic polynomials of degree `n`, as a Finset: parametrized by the
coefficient vectors `(c_0, …, c_{n−1})` (`f = X^n + Σ c_i X^i`); finitely many
by `[Fintype k]`. Substrate for the Q4 residue-class decomposition. -/
noncomputable def monicDegreeN (k : Type*) [Field k] [Fintype k] [DecidableEq k]
    (n : ℕ) : Finset (Polynomial k) :=
  Finset.image
    (fun v : Fin n → k =>
      (Polynomial.X : Polynomial k) ^ n + ∑ i : Fin n, Polynomial.monomial i (v i))
    Finset.univ

/-- `L(T,χ) = Σ_{f monic} χ(span f) · T^{deg f}` — a well-defined element of
ℂ⟦T⟧ by construction (each coefficient a finite sum). Series-over-product as
the DEFINED object; the Euler-product expansion is a theorem/binder, not the
definition (prework §2.3 decision (a)). -/
noncomputable def heckeSeriesT {k : Type*} [Field k] [Fintype k] [DecidableEq k]
    {m : Ideal (Polynomial k)} (χ : FFRayClassCharacter k m) : PowerSeries ℂ :=
  PowerSeries.mk fun n => ∑ f ∈ monicDegreeN k n, χ.toFun (Ideal.span {f})

/-! ## Q2 — (P)(i) continuation from rationality -/

/-- **(P)(i).** From the rationality identity `L(T,χ) · P₀ = P₁` (the Tier-C
form of Weil's `exists_rationalLFunction_mul_eq_polynomial`,
`LAdicTraceFormulaFinal.lean:51`), the s-plane function
`s ↦ P₁(q^{-s}) / P₀(q^{-s})` — an explicit quotient of entire functions — is
differentiable at every `z` with `P₀(q^{-z}) ≠ 0`: meromorphic continuation
with poles among `{z | P₀(q^{-z}) = 0}`, the DZDF `DifferentiableOn ℂ f {1}ᶜ`
clause one factor level up. (The series-agreement clause on `Re s > 1` is the
PowerSeries-eval layer — Q4/Tier A, out of scope here; the 71 pattern,
`Polynomial.differentiable` ∘ `wOf`.) -/
theorem hecke_continuation {k : Type*} [Field k] [Fintype k] [DecidableEq k]
    {m : Ideal (Polynomial k)} (χ : FFRayClassCharacter k m) (q : ℕ)
    (P₀ P₁ : Polynomial ℂ)
    (hRat : heckeSeriesT χ * (P₀ : PowerSeries ℂ) = (P₁ : PowerSeries ℂ)) :
    ∃ f : ℂ → ℂ,
      (∀ z : ℂ, P₀.eval (wOf q z) ≠ 0 → DifferentiableAt ℂ f z) ∧
      (∀ s : ℂ, f s = P₁.eval (wOf q s) / P₀.eval (wOf q s)) := by
  -- `hRat` is the anchor that identifies the quotient as the continuation OF
  -- L(·,χ); the differentiability content at this tier is factor-level reuse.
  have _hanchor := hRat
  refine ⟨fun s => P₁.eval (wOf q s) / P₀.eval (wOf q s), fun z hz => ?_, fun _ => rfl⟩
  have hinner : Differentiable ℂ fun s : ℂ => -(s * ((Real.log (q : ℝ) : ℝ) : ℂ)) :=
    Differentiable.neg (Differentiable.mul differentiable_id (differentiable_const _))
  have hw : Differentiable ℂ (wOf q) := by
    unfold wOf
    exact Differentiable.fun_comp Complex.differentiable_exp hinner
  have hP₀ : Differentiable ℂ ((fun x => P₀.eval x) ∘ wOf q) :=
    Differentiable.comp (Polynomial.differentiable P₀) hw
  have hP₁ : Differentiable ℂ ((fun x => P₁.eval x) ∘ wOf q) :=
    Differentiable.comp (Polynomial.differentiable P₁) hw
  exact DifferentiableAt.div (hP₁ z) (hP₀ z) hz

/-! ## Q3 — (P)(ii) the sharp 1/2 window under purity -/

/-- Purity binder, LeanEval-purity shape (`WeilConjectures.lean:191`): the
nontrivial T-factorization of the rationality numerator has all inverse roots
on the `√q` circle. `hPur` is the RH for the Kummer covers of ℙ¹ (Weil II) —
a HYPOTHESIS at Tier C (prework §2.4 honesty correction to dossier 73
step 5: not Gauss-sum-elementary, never discharged in this pilot). -/
def HeckePurity {k : Type*} [Field k] [Fintype k] [DecidableEq k]
    {m : Ideal (Polynomial k)} (χ : FFRayClassCharacter k m) (q : ℕ)
    (P₀ P₁ : Polynomial ℂ)
    (_hRat : heckeSeriesT χ * (P₀ : PowerSeries ℂ) = (P₁ : PowerSeries ℂ)) : Prop :=
  ∃ ε : ℂ, ∃ α : Multiset ℂ, ‖ε‖ = 1 ∧ P₁ = ε • lPoly α ∧ ∀ a ∈ α, ‖a‖ = √((q : ℝ))

/-- **(P)(ii).** Under the purity binder, `s ↦ P₁(q^{-s}) / P₀(q^{-s})` is
nonzero throughout the window `Re s > 1/2`, off the trivial locus
(`P₀(q^{-s}) ≠ 0`): exactly 71's W2 numerator argument one factor level up
(`lPoly_eval` + `Multiset.prod_eq_zero_iff` + Core 1), with the unit-norm
prefactor `ε` split off by `mul_eq_zero`. -/
theorem hecke_window {k : Type*} [Field k] [Fintype k] [DecidableEq k]
    {m : Ideal (Polynomial k)} (χ : FFRayClassCharacter k m) {q : ℕ} (hq : 1 < q)
    {P₀ P₁ : Polynomial ℂ}
    {_hRat : heckeSeriesT χ * (P₀ : PowerSeries ℂ) = (P₁ : PowerSeries ℂ)}
    (hPur : HeckePurity χ q P₀ P₁ _hRat) (s : ℂ) (hs : (1 / 2 : ℝ) < s.re)
    (hd : P₀.eval (wOf q s) ≠ 0) :
    P₁.eval (wOf q s) / P₀.eval (wOf q s) ≠ 0 := by
  intro h0
  obtain ⟨ε, α, hε, hfac, hpur⟩ := hPur
  rcases div_eq_zero_iff.mp h0 with hn | hd0
  · rw [hfac, Polynomial.eval_smul] at hn
    rcases mul_eq_zero.mp hn with hε0 | hQ
    · exact absurd hε (by rw [hε0]; simp)
    · rw [lPoly_eval] at hQ
      obtain ⟨a, haA, haeq⟩ := Multiset.mem_map.mp (Multiset.prod_eq_zero_iff.mp hQ)
      have han : ‖a‖ = √((q : ℝ)) := hpur a haA
      have haw : a * wOf q s = 1 := (sub_eq_zero.mp haeq).symm
      exact absurd (re_eq_half_of_norm_mul hq han
        (by rw [← norm_mul, haw, norm_one])) (ne_of_gt hs)
  · exact hd hd0

/-! ## Axiom audit -/

#print axioms norm_wOf
#print axioms lPoly_eval
#print axioms re_eq_half_of_norm_mul
#print axioms no_real_homs
#print axioms apply_span_singleton_eq_zero_iff
#print axioms hecke_continuation
#print axioms hecke_window

end Pilot73
