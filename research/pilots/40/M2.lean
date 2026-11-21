/-
PILOT 40 M2 — the Ξ_K′ Stage-1 tranche CONTINUATION (iter-7 day-1, D2′(a); fires 11+
of the 6–14 grant). Lane R9 (worktree agent-09), 2026-11-21. Self-contained: M1's
GREEN content (tranche 1, `71922301cbb0761d`, landed `120b6d0`) carried verbatim
below, PLUS the priced continuations (corrected scope): the Λ-form nonvanishing
(S-class, mathlib-direct) + the bridge identity `s(s−1)Λ₀ + 1 = s(s−1)Λ` (which
corrects the M1-record's "s(s−1)Λ₀ = s(s−1)Λ" mispricing — the offset is 1, so
the Λ₀-binder is ξ ≠ ½, non-elementary, named residual) + the step-3 device's
first real slice (the Λ̃ log-derivative decomposition + the composed conditional).

KEPT ARTIFACT — SORRY-FREE (zero `sorry`, zero `native_decide`, kernel-only;
mathlib-only substrate at `ff2494ea`, toolchain v4.36.0-rc2). The gated content
(T3's WindowCalculus discharge, the step-3 χ-device) appears ONLY as statement
surfaces (Prop-defs) and named hypotheses — never as a claimed proof.

The Stage-1 finding baked into the object (see M1-record.md): mathlib's FE
normalization `Λ_χ(1−s) = N^(s−1/2)·rootNumber χ·Λ_χ⁻¹(s)` makes the RAW product
`s(s−1)·Λ₀·Λ_χ` NON-reflective; the correct Stage-1 object carries the symmetrizer
`Λ̃_χ(s) := exp((s/2)·log N)·Λ_χ(s)`, for which the FE reads
`Λ̃_χ(1−s) = rootNumber χ · Λ̃_χ⁻¹(s)` — quadratic + root number 1 gives the T1
reflection. The probe file (`XiKPrime-stmt-probe.lean`) keeps the historical
Layer-A form; this file is the corrected object of record.
-/
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.Calculus.LogDeriv

open scoped BigOperators Filter
open Complex Set Filter

namespace XiKPrime

variable {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)

/-! ## Layer A — the object (corrected: the N^(s/2) symmetrizer) -/

/-- The symmetrizing factor `exp((s/2)·log N)` (equals `N ^ (s/2)`; `cpow_exp` below
is the bridge). -/
noncomputable def symFactor (N : ℕ) (s : ℂ) : ℂ :=
  Complex.exp (s / 2 * Complex.ofReal (Real.log (N : ℝ)))

/-- The symmetrized Dirichlet completion `Λ̃_χ(s) := exp((s/2)·log N) · Λ_χ(s)`. -/
noncomputable def symCompleted (s : ℂ) : ℂ :=
  symFactor N s * DirichletCharacter.completedLFunction χ s

/-- `Ξ_χ(s) := s(s−1)·Λ₀(s)·Λ̃_χ(s) + 1` — the Stage-1 object of record. -/
noncomputable def XiChi (s : ℂ) : ℂ :=
  s * (s - 1) * completedRiemannZeta₀ s * symCompleted χ s + 1

/-- `g := Ξ − 1` (the product part; `deriv Ξ = deriv g` identically). -/
noncomputable def gProd (s : ℂ) : ℂ :=
  s * (s - 1) * completedRiemannZeta₀ s * symCompleted χ s

/-- `Ξ_χ′ := deriv Ξ_χ` (mirrors `Zeta23.XiPrime.xiDeriv`). -/
noncomputable def XiChiDeriv : ℂ → ℂ := deriv (XiChi χ)

/-! ## T1 — the structure slice -/

theorem xiChi_zero : XiChi χ 0 = 1 := by
  simp [XiChi]

theorem xiChi_one : XiChi χ 1 = 1 := by
  simp [XiChi]

theorem differentiable_symFactor (N : ℕ) : Differentiable ℂ (symFactor N) := by
  have h1 : Differentiable ℂ (fun s : ℂ => s / 2) := differentiable_id.div_const 2
  have h2 : Differentiable ℂ (fun _ : ℂ => Complex.ofReal (Real.log (N : ℝ))) :=
    differentiable_const _
  exact Complex.differentiable_exp.comp (h1.mul h2)

theorem differentiable_symCompleted (hχ : χ ≠ 1) : Differentiable ℂ (symCompleted χ) :=
  (differentiable_symFactor N).mul <| DirichletCharacter.differentiable_completedLFunction hχ

theorem differentiable_gProd (hχ : χ ≠ 1) : Differentiable ℂ (gProd χ) := by
  have h1 : Differentiable ℂ (fun s : ℂ => s) := differentiable_id
  have h2 : Differentiable ℂ (fun s : ℂ => s - 1) := differentiable_id.sub_const 1
  exact (((h1.mul h2).mul differentiable_completedZeta₀).mul (differentiable_symCompleted χ hχ))

theorem differentiable_xiChi (hχ : χ ≠ 1) : Differentiable ℂ (XiChi χ) := by
  have hg := differentiable_gProd χ hχ
  have h1 : Differentiable ℂ (fun _ : ℂ => (1 : ℂ)) := differentiable_const 1
  have : XiChi χ = fun s : ℂ => gProd χ s + 1 := rfl
  rw [this]
  exact hg.add h1

/-- mathlib's cpow at the positive-real base `N` is the exp form (the symmetrizer
bridge). -/
lemma cpow_exp {N : ℕ} [NeZero N] (x : ℂ) :
    (N : ℂ) ^ x = Complex.exp (x * Complex.ofReal (Real.log (N : ℝ))) := by
  have hlogN : Complex.log ((N : ℂ)) = Complex.ofReal (Real.log (N : ℝ)) := by
    have h1 := Complex.log_ofReal_mul (r := (N : ℝ)) (x := 1) (by exact_mod_cast Nat.pos_of_neZero N)
      (one_ne_zero)
    rw [mul_one, Complex.log_one, add_zero] at h1
    exact h1
  rw [Complex.cpow_def_of_ne_zero (by exact_mod_cast (NeZero.ne N)), hlogN]
  congr 1
  ring

/-- **T1 (reflection), binder form.** For a quadratic primitive χ (χ⁻¹ = χ) with root
number 1, the completed assembly is symmetric about the critical line. The two
hypotheses are classical (the quadratic Gauss-sum evaluation); discharging them is
named glue for a later tranche. -/
theorem xiChi_one_sub (hprim : DirichletCharacter.IsPrimitive χ) (hinv : χ⁻¹ = χ)
    (hε : DirichletCharacter.rootNumber χ = 1)
    (s : ℂ) : XiChi χ (1 - s) = XiChi χ s := by
  have hquad : (1 - s : ℂ) * ((1 - s) - 1) = s * (s - 1) := by ring
  have hz : completedRiemannZeta₀ (1 - s) = completedRiemannZeta₀ s :=
    completedRiemannZeta₀_one_sub s
  have hsF : symFactor N (1 - s) * (N : ℂ) ^ (s - 1 / 2) = symFactor N s := by
    rw [cpow_exp, symFactor, symFactor, ← Complex.exp_add]
    congr 1
    field_simp
    ring
  have hFE := hprim.completedLFunction_one_sub s
  have hsym : symCompleted χ (1 - s) = symCompleted χ s := by
    unfold symCompleted
    rw [hFE, hε, hinv, mul_one, ← mul_assoc, hsF]
  simp only [XiChi]
  rw [hquad, hz, hsym]

/-! ## T2 — the reduction layer (the Σ identity + the confinement composition) -/

theorem symCompleted_ne_zero (hχs : χ ≠ 1 ∨ s ≠ 1) (hs : 1 ≤ s.re) :
    symCompleted χ s ≠ 0 :=
  mul_ne_zero (Complex.exp_ne_zero _)
    (DirichletCharacter.completedLFunction_ne_zero_of_one_le_re χ hχs hs)

theorem gProd_ne_zero (hχ : χ ≠ 1) {s : ℂ} (hs : 1 ≤ s.re) (hs1 : s ≠ 1)
    (hζ : completedRiemannZeta₀ s ≠ 0) : gProd χ s ≠ 0 := by
  have hs0 : s ≠ 0 := fun h => by
    simp only [h, Complex.zero_re] at hs
    linarith
  have hs10 : s - 1 ≠ 0 := fun h => hs1 (sub_eq_zero.1 h)
  exact mul_ne_zero (mul_ne_zero (mul_ne_zero hs0 hs10) hζ)
    (symCompleted_ne_zero (χ := χ) (.inl hχ) hs)

/-- The two-factor log-derivative identity (raw form). -/
lemma deriv_div_mul {f g : ℂ → ℂ} {s : ℂ} (hf : DifferentiableAt ℂ f s)
    (hg : DifferentiableAt ℂ g s) (hfn : f s ≠ 0) (hgn : g s ≠ 0) :
    deriv (f * g) s / (f * g) s = deriv f s / f s + deriv g s / g s := by
  rw [deriv_mul hf hg]
  have hfg : (f * g) s = f s * g s := rfl
  rw [hfg]
  field_simp

/-- **The Σ identity (dossier-40 step 2, corrected for the +1 assembly).** On the
closed half-plane (s ≠ 1, Λ₀ s ≠ 0), the logarithmic derivative of the product part
`g = Ξ − 1` is the four-term sum — the identity the step-3 χ-device plugs into. (The
dossier's step-2 sketch mislabeled this as `Ξ′/Ξ`; the `+1` assembly makes the
correct intermediate `g′/g` — recorded in M1-record.md.) -/
theorem deriv_div_gProd_eq_sum (hχ : χ ≠ 1) {s : ℂ} (hs : 1 ≤ s.re) (hs1 : s ≠ 1)
    (hζ : completedRiemannZeta₀ s ≠ 0) :
    deriv (gProd χ) s / gProd χ s = 1 / s + 1 / (s - 1) +
      deriv (completedRiemannZeta₀ : ℂ → ℂ) s / completedRiemannZeta₀ s +
      deriv (symCompleted χ) s / symCompleted χ s := by
  have hs0 : s ≠ 0 := fun h => by
    simp only [h, Complex.zero_re] at hs
    linarith
  have hs10 : s - 1 ≠ 0 := fun h => hs1 (sub_eq_zero.1 h)
  have hsc := symCompleted_ne_zero (χ := χ) (.inl hχ) hs
  have hid : DifferentiableAt ℂ (fun s : ℂ => s) s := differentiable_id s
  have hAB : DifferentiableAt ℂ (fun s : ℂ => s * (s - 1)) s :=
    hid.mul (hid.sub_const 1)
  have hA : DifferentiableAt ℂ ((fun s : ℂ => s * (s - 1)) * completedRiemannZeta₀) s :=
    hAB.mul (differentiable_completedZeta₀ s)
  have hAne : (fun s : ℂ => s * (s - 1)) s * completedRiemannZeta₀ s ≠ 0 :=
    mul_ne_zero (mul_ne_zero hs0 hs10) hζ
  have hpg : gProd χ = ((fun s : ℂ => s * (s - 1)) * completedRiemannZeta₀) * symCompleted χ :=
    rfl
  have hdAB : deriv (fun s : ℂ => s * (s - 1)) s = 1 * (s - 1) + s * 1 := by
    have h := deriv_mul hid (hid.sub_const 1)
    rw [deriv_sub_const, show (fun s : ℂ => s) = (id : ℂ → ℂ) from rfl, deriv_id] at h
    exact h
  rw [hpg, deriv_div_mul hA ((differentiable_symCompleted χ hχ) s) hAne hsc,
    deriv_div_mul hAB (differentiable_completedZeta₀ s) (mul_ne_zero hs0 hs10) hζ,
    hdAB]
  field_simp

/-- **T2(ii)-form confinement.** A positivity device on the product log-derivative
kills the zeros of `Ξ′` on the closed half-plane — with no nonvanishing side
condition (at a zero of `deriv g`, the quotient is literally `0`, and `0 < re 0`
is false). The device itself (`hdev`) is the step-3 χ-bound, the named open core of
the tranche. -/
theorem xiChiDeriv_ne_zero_of_re_pos (hχ : χ ≠ 1)
    (hdev : ∀ s : ℂ, 1 ≤ s.re → s ≠ 1 →
      0 < Complex.re (deriv (gProd χ) s / gProd χ s)) :
    ∀ s : ℂ, 1 ≤ s.re → s ≠ 1 → deriv (XiChi χ) s ≠ 0 := by
  intro s hs hs1 hcon
  have hd : deriv (XiChi χ) s = deriv (gProd χ) s := by
    change deriv (gProd χ + fun _ => (1 : ℂ)) s = deriv (gProd χ) s
    rw [deriv_add ((differentiable_gProd χ hχ) s) ((differentiable_const 1) s)]
    simp
  have h0 := hdev s hs hs1
  rw [hd] at hcon
  rw [hcon, zero_div, Complex.zero_re] at h0
  exact lt_irrefl 0 h0

/-! ## The d = −3 bite, elementary slice (the two positive terms of the Σ) -/

theorem re_inv_pos {s : ℂ} (hs : 0 < s.re) : 0 < Complex.re (s⁻¹) := by
  rw [Complex.inv_re]
  exact div_pos hs <| (Complex.normSq_pos).2 (fun h => by simp [h] at hs)

theorem re_sub_one_inv_nonneg {s : ℂ} (hs : 1 ≤ s.re) (hs1 : s ≠ 1) :
    0 ≤ Complex.re ((s - 1)⁻¹) := by
  rw [Complex.inv_re]
  refine div_nonneg (by rw [Complex.sub_re]; exact sub_nonneg.2 hs) ?_
  exact le_of_lt (Complex.normSq_pos.2 (fun h => hs1 (sub_eq_zero.1 h)))

/-! ## Layer B — the counting idiom (mirror of Zeta23/XiPrime/Defs.lean:40–62) -/

def IsXiChiDerivZero (ρ : ℂ) : Prop := XiChiDeriv χ ρ = 0

noncomputable def xiChiDerivMult (ρ : ℂ) : ℕ := (analyticOrderAt (XiChiDeriv χ) ρ).toNat

def zerosIn (T₁ T₂ : ℝ) : Set ℂ :=
  {ρ | IsXiChiDerivZero χ ρ ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

/-- Denominator: zeros of `Ξ_χ′` in the window, counted with multiplicity. -/
noncomputable def Ncount (T₁ T₂ : ℝ) : ℕ := ∑ᶠ ρ ∈ zerosIn χ T₁ T₂, xiChiDerivMult χ ρ

/-- Distinct count. -/
noncomputable def Ndist (T₁ T₂ : ℝ) : ℕ := (zerosIn χ T₁ T₂).ncard

/-- Simple zeros on the critical line. -/
noncomputable def N0simple (T₁ T₂ : ℝ) : ℕ :=
  (zerosIn χ T₁ T₂ ∩ {ρ | ρ.re = 1 / 2 ∧ xiChiDerivMult χ ρ = 1}).ncard

/-! ## Layer C — the window-calculus binder schema (the GATE's statement form) -/

structure WindowCalculus (χ : DirichletCharacter ℂ N) where
  /-- T1: the completed assembly is symmetric about the critical line. -/
  hSymm : ∀ s : ℂ, XiChi χ (1 - s) = XiChi χ s
  /-- Denominator asymptotic: N_Ξχ′(T,2T) ~ c·T·log T with c > 0. -/
  hRVM : ∃ c : ℝ, 0 < c ∧
    Tendsto (fun T : ℝ ↦ (Ncount χ T (2 * T) : ℝ) / (T * Real.log T)) atTop (nhds c)
  /-- Windowed explicit formula at the κ-profile (the engine's Thm-8.2-at-λ shape). -/
  hEF : ∃ kappa : ℝ → ℝ, ∀ lam : ℝ, 0 < lam → lam < 1 →
    ∃ T₀ : ℝ, ∀ T ≥ T₀, ∀ ε > 0,
      (2 - kappa lam - ε) * (Ncount χ T (2 * T) : ℝ) ≤ (N0simple χ T (2 * T) : ℝ) ∧
      (3 / 2 - kappa lam / 2 - ε) * (Ncount χ T (2 * T) : ℝ) ≤ (Ndist χ T (2 * T) : ℝ)
  /-- Seam control: the off-diagonal window term is o(N). -/
  hSeam : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀,
    (Ncount χ T (2 * T) : ℝ) - (N0simple χ T (2 * T) : ℝ)
      + ((Ncount χ T (2 * T) : ℝ) - (Ndist χ T (2 * T) : ℝ)) ≤ ε * (Ncount χ T (2 * T) : ℝ)

/-! ## Layer D — the T3 statement surfaces (Props; no proof claimed) -/

/-- T3-flat statement surface (the gated target). -/
def XiKPrimeFlatProp : Prop :=
  ∃ T₀ : ℝ, ∀ T ≥ T₀,
    (0.85838 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (N0simple χ T (2 * T) : ℝ) ∧
    (0.92919 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (Ndist χ T (2 * T) : ℝ)

/-- T3-quartic statement surface (the gated target). -/
def XiKPrimeQuarticProp : Prop :=
  ∃ T₀ : ℝ, ∀ T ≥ T₀,
    (0.86864 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (N0simple χ T (2 * T) : ℝ) ∧
    (0.93432 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (Ndist χ T (2 * T) : ℝ)

/-! ## The bridge identity + the Λ-form nonvanishing (the corrected continuation 1) -/

/-- **The zeta23-doc identity, proved** (for s ∉ {0,1}): `s(s−1)·Λ₀ + 1 = s(s−1)·Λ`,
from mathlib's `completedRiemannZeta_eq : Λ = Λ₀ − 1/s − 1/(1−s)`. CORRECTS the
M1-record's "s(s−1)Λ₀ = s(s−1)Λ" slip: the offset is 1 (and the identity FAILS at
s ∈ {0,1} — both sides differ there), so Λ₀'s half-plane nonvanishing is equivalent
to `s(s−1)·Λ ≠ 1` (ξ ≠ ½ there) — non-elementary; named residual. -/
theorem smul_la₀_add_one {s : ℂ} (hs0 : s ≠ 0) (hs1 : s ≠ 1) :
    s * (s - 1) * completedRiemannZeta₀ s + 1 = s * (s - 1) * completedRiemannZeta s := by
  rw [completedRiemannZeta_eq s]
  field_simp
  ring

/-- The g-product in Λ-form: `g = (s(s−1)·Λ − 1)·Λ̃` (s ∉ {0,1}). -/
theorem gProd_eq {s : ℂ} (hs0 : s ≠ 0) (hs1 : s ≠ 1) :
    gProd χ s = (s * (s - 1) * completedRiemannZeta s - 1) * symCompleted χ s := by
  rw [← smul_la₀_add_one hs0 hs1]
  unfold gProd
  ring

/-- **The Λ-form nonvanishing (S-class, mathlib-direct)**: on the closed half-plane
(Re s ≥ 1, s ≠ 0), Λ = ζ·Γℝ ≠ 0 — routed through `riemannZeta_def_of_ne_zero` so the
Γℝ-notation never surfaces. -/
theorem completedRiemannZeta_ne_zero {s : ℂ} (hs0 : s ≠ 0) (hs : 1 ≤ s.re) :
    completedRiemannZeta s ≠ 0 := by
  intro h
  have hz := riemannZeta_ne_zero_of_one_le_re hs
  rw [riemannZeta_def_of_ne_zero hs0, h, zero_div] at hz
  exact hz rfl

/-! ## The step-3 device's first real slice (continuation 3) -/

/-- The symmetrizer factor's derivative: `SF′ = (log N / 2) · SF`. -/
theorem deriv_symFactor (N : ℕ) (s : ℂ) : deriv (symFactor N) s
    = Complex.ofReal (Real.log (N : ℝ)) / 2 * symFactor N s := by
  unfold symFactor
  exact (((hasDerivAt_exp
        (s / 2 * Complex.ofReal (Real.log (N : ℝ)))).comp s
      (((hasDerivAt_id s).div_const 2).mul (hasDerivAt_const s _)))).deriv.trans (by
    simp only [mul_zero, add_zero]
    exact mul_comm _ _)

/-- The Λ̃ log-derivative decomposition: `Λ̃′/Λ̃ = (log N)/2 + Λ_χ′/Λ_χ` — the
symmetrizer contributes exactly the real positive constant `½·log N`. -/
theorem deriv_div_symCompleted_eq (hχ : χ ≠ 1)
    (hL : DirichletCharacter.completedLFunction χ s ≠ 0) :
    deriv (symCompleted χ) s / symCompleted χ s =
      Complex.ofReal (Real.log (N : ℝ)) / 2 +
        deriv (DirichletCharacter.completedLFunction χ) s /
          DirichletCharacter.completedLFunction χ s := by
  have hSFne : symFactor N s ≠ 0 := Complex.exp_ne_zero _
  have hder : deriv (symCompleted χ) s
      = deriv (symFactor N) s * DirichletCharacter.completedLFunction χ s
        + symFactor N s * deriv (DirichletCharacter.completedLFunction χ) s :=
    deriv_mul ((differentiable_symFactor N) s)
      ((DirichletCharacter.differentiable_completedLFunction hχ) s)
  rw [hder, deriv_symFactor]
  unfold symCompleted
  field_simp

/-- **The composed device conditional (the step-3 reduction)**: if the factor bound
holds on the closed half-plane — `Re(1/s + 1/(s−1) + Λ₀′/Λ₀ + Λ_χ′/Λ_χ) + ½·log N > 0`
— then the product device `hdev` holds (and with it, by `xiChiDeriv_ne_zero_of_re_pos`,
the strip confinement of Ξ′-zeros). The factor bound is the tranche's named open core
(the χ-device); everything from it downward is now proved. -/
theorem re_pos_of_factor_bound (hχ : χ ≠ 1)
    (hζne : ∀ s : ℂ, 1 ≤ s.re → s ≠ 1 → completedRiemannZeta₀ s ≠ 0)
    (hfb : ∀ s : ℂ, 1 ≤ s.re → s ≠ 1 →
      0 < Complex.re (1 / s + 1 / (s - 1) +
        deriv (completedRiemannZeta₀ : ℂ → ℂ) s / completedRiemannZeta₀ s +
        deriv (DirichletCharacter.completedLFunction χ) s /
          DirichletCharacter.completedLFunction χ s) + Real.log (N : ℝ) / 2) :
    ∀ s : ℂ, 1 ≤ s.re → s ≠ 1 → 0 < Complex.re (deriv (gProd χ) s / gProd χ s) := by
  intro s hs hs1
  have hs0 : s ≠ 0 := fun h => by
    simp only [h, Complex.zero_re] at hs
    linarith
  have hL := DirichletCharacter.completedLFunction_ne_zero_of_one_le_re χ (.inl hχ) hs
  have hζ := hζne s hs hs1
  rw [deriv_div_gProd_eq_sum χ hχ hs hs1 hζ, deriv_div_symCompleted_eq χ hχ hL]
  have hre : Complex.re (1 / s + 1 / (s - 1) +
      deriv (completedRiemannZeta₀ : ℂ → ℂ) s / completedRiemannZeta₀ s +
      (Complex.ofReal (Real.log (N : ℝ)) / 2 +
        deriv (DirichletCharacter.completedLFunction χ) s /
          DirichletCharacter.completedLFunction χ s))
      = Complex.re (1 / s + 1 / (s - 1) +
        deriv (completedRiemannZeta₀ : ℂ → ℂ) s / completedRiemannZeta₀ s +
        deriv (DirichletCharacter.completedLFunction χ) s /
          DirichletCharacter.completedLFunction χ s) + Real.log (N : ℝ) / 2 := by
    simp only [Complex.add_re, Complex.ofReal_re]
    ring
  rw [hre]
  exact hfb s hs hs1

end XiKPrime

/-! ## Axiom audit (elaboration commands; captured in the run log) -/

#print axioms XiKPrime.smul_la₀_add_one
#print axioms XiKPrime.gProd_eq
#print axioms XiKPrime.completedRiemannZeta_ne_zero
#print axioms XiKPrime.deriv_symFactor
#print axioms XiKPrime.deriv_div_symCompleted_eq
#print axioms XiKPrime.re_pos_of_factor_bound
