/-
Pilot ZZV2-λ η-port — RUNGS R5+R6 (Fourier/identity layer at κ=1), PROOF ARTIFACT
(lane R5, A3 lineage; fired 2026-11-20 per eta-port-plan.md §R5/§R6 as amended by
eta-port-precharter-amendment.md, jointly with the R2/R3 fix-batch-6 confirmation).

SORRY-STRICT: zero `sorry` by construction. Elaborated INSIDE the built
ZetaZerosV2 tree on-pin (mathlib ff2494ea, toolchain v4.36.0-rc2).

Billing: technical record per DECISION-2 = Option A (record-billed, quota-free) —
pure infrastructure, never discovery-phrased; the informal λ-dependence is
Lamzouri's (must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974,
Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh 2024 Lemma 5).

PUBLIC-LAYER RE-CENSUS (amendment (2) directive — executed 2026-11-20 BEFORE any
re-proving; it reduces this rung's private-copy set to ZERO donor-proof mirrors):
  * `fourierC_cutoffSelfConv` — PUBLIC, Hilbert/AlphaExpansion/KernelBessel.lean:512
    (built on the public family-free `fourierC_selfConv`);
  * `fourierC_iteratedDeriv_two_cutoffSelfConv` — PUBLIC, Zeta/Kernel.lean:356;
  * `fourierC_correctedTest` — PUBLIC, Zeta/Kernel.lean:375;
  * `correctedTest_weight_cancel` — PUBLIC, Zeta/Kernel.lean:412;
  * `unweightedKernelSum_cutoffTest_eq_pairCorrelationSum` — PUBLIC,
    Zeta/Kernel.lean:515;
  * `cutoffNormaliser_pos` — PUBLIC, Hilbert/AlphaExpansion/CoefficientSums.lean:212;
  * `fourierC_cutoffTestSq_zero` — PUBLIC, Hilbert/AlphaExpansion/RescaledZeros.lean:217;
  * frozen support/smoothness layer — PUBLIC, Zeta/Basic.lean:207/:218/:232/:258/:265
    and Zeta/CutoffSelfConv.lean:71.
The amendment's "genuinely private" list (fourierC_deriv, fourierTwist_convolution,
fourierC_cutoffTestSq_zero, cutoffNormaliser_pos) was right only about the LAST two
names' Zeta/Kernel.lean SITES — both are public ELSEWHERE in the donor, and the
Fourier VALUE lemmas themselves (the R5 mirror targets) are public in Zeta/Kernel.lean.
Consequently NO donor private proof is mirrored here except the tiny integrability
helper `integrable_fourierC_integrand'` (Kernel.lean:88, 8 lines, cited — the P1
private-copy precedent) and the R1/R2 carries (this file's own prior rungs).

ARCHITECTURE (TRANSPORT, not mirror): every R5/R6 statement is derived from the
donor's PUBLIC frozen-family lemmas via lemma A (`Q_λ = (2λ)⁻¹ • dilateTo lam Q`,
fix-batch-6 form) + R1's `fourierC_dilateTo`. The κ=1 coefficient discipline: the
`1/(4 log²T)` correction and the pairWeight cancellation `4/(4−z²)` are the donor's
VERBATIM (family-independent at κ=1; the `(2πiz)²` multiplier and the rescaledDiff
algebra carry the scaling). Donor statements need `(hd : 0 < delta) (hd4 : delta <
1/4)` binders (unused inside their proofs but required by their signatures); the
probe's stmt_* forms omitted them — carried here explicitly (the R2/R3
hypothesis-binder addendum discipline, recorded in eta-r2-record.md).

λ = 1/2 REGRESSION-FIRST (mid-ladder checkpoint, bit-for-bit): the anchors at the
bottom reduce each R5/R6 instance at lam = 1/2 to the donor's public lemma VERBATIM
(`dilateTo (1/2) = id`, R1), so any wrong normalisation surfaces HERE, before R7/R8.

Runner: research/pilots/zzv2-lam/run_zzv2.sh eta-r2.lean eta-r3.lean eta-r4.lean
(app crossmath-pilot-zzv2-lam, doz CLI, SPEC 2cpu/4GB, LEAN_NUM_THREADS=2, taskset);
sorry-strict verdict branch.
-/

import ZetaZeros
import Mathlib.MeasureTheory.Measure.Haar.NormedSpace

namespace ZZLam.EtaPort

open ZetaZeros Filter Topology MeasureTheory

/-! ## Carried defs (VERBATIM from eta-pin-probe.lean / eta-r2.lean) -/

/-- Coordinate dilation to the λ-window (ρ := 2λ). -/
noncomputable def dilateTo (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => f (x / (2 * lam))

/-- The λ-scaled extremal base (`Zeta/Defs.lean:76` dilated). -/
noncomputable def extremalLam (lam : ℝ) : ℝ → ℝ := dilateTo lam extremalTest

/-- The λ-scaled normaliser `A_{ψ,λ}` (`Zeta/Defs.lean:106` shape). -/
noncomputable def cutoffNormaliserLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ :=
  ∫ x : ℝ, dilateTo lam psi x ^ 2 * extremalLam lam x

/-- The λ-scaled cutoff family (`Zeta/Defs.lean:111` shape). -/
noncomputable def cutoffTestLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ → ℝ := fun x =>
  dilateTo lam psi x * Real.sqrt (extremalLam lam x)
    / Real.sqrt (cutoffNormaliserLam lam psi)

/-- The scaled self-convolution `Q_λ` (`Zeta/Defs.lean:120` shape at
`cutoffTestLam`). -/
noncomputable def cutoffSelfConvLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ → ℝ := fun x =>
  ∫ t : ℝ, (cutoffTestLam lam psi t)^2 * (cutoffTestLam lam psi (x - t))^2

/-- The scaled corrected test — DONOR COEFFICIENT KEPT VERBATIM (κ = 1; the
pairWeight cancellation `4/(4−z²)` pins the family-independence): the correction
stays `Q_λ''/(4 log²T)` (`Zeta/Defs.lean:126` shape at `Q_λ`). -/
noncomputable def correctedTestLam (lam : ℝ) (psi : ℝ → ℝ) (T : ℝ) : ℝ → ℝ := fun x =>
  cutoffSelfConvLam lam psi x
    - iteratedDeriv 2 (cutoffSelfConvLam lam psi) x / (4 * Real.log T ^ 2)

/-! ## Carried R1 results (VERBATIM from eta-r1.lean, GREEN @ 5b04304a53a5b849) -/

/-- Whole-line dilation substitution (R1 helper; mathlib
`MeasureTheory.Measure.integral_comp_mul_left` at the pin; junk-value-safe). -/
private theorem integral_comp_dilateTo {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] (G : ℝ → E) {lam : ℝ} (hlam : 0 < lam) :
    ∫ x : ℝ, G (x / (2 * lam)) = (2 * lam) • ∫ y : ℝ, G y := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hn : (2 * lam : ℝ) ≠ 0 := ne_of_gt hρ
  have h := MeasureTheory.Measure.integral_comp_mul_left (g := G) (a := (2 * lam)⁻¹)
  rw [inv_inv, abs_of_pos hρ] at h
  rw [← h]
  exact integral_congr_ae (by
    filter_upwards with x
    rw [div_eq_mul_inv, mul_comm x ((2 * lam)⁻¹)])

/-- (i) `fourierC (dilateTo lam f) ξ = 2λ · fourierC f (2λ·ξ)` (R1 GREEN). -/
theorem fourierC_dilateTo {lam : ℝ} (hlam : 0 < lam) (f : ℝ → ℝ) (ξ : ℂ) :
    fourierC (dilateTo lam f) ξ = (2 * lam) * fourierC f ((2 * lam) * ξ) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hn : (2 * lam : ℝ) ≠ 0 := ne_of_gt hρ
  have key := integral_comp_dilateTo (lam := lam) hlam
    (G := fun y : ℝ => ((f y : ℝ) : ℂ) *
      Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * ξ * ((2 * lam * y : ℝ) : ℂ)))
  have hL : fourierC (dilateTo lam f) ξ = ∫ x : ℝ,
      ((f (x / (2 * lam)) : ℝ) : ℂ) *
        Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * ξ *
          ((2 * lam * (x / (2 * lam)) : ℝ) : ℂ)) := by
    unfold fourierC dilateTo
    apply integral_congr_ae
    filter_upwards with x
    have hx : 2 * lam * (x / (2 * lam)) = x := by field_simp
    rw [hx]
  have hR : (∫ y : ℝ,
      ((f y : ℝ) : ℂ) *
        Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * ξ *
          ((2 * lam * y : ℝ) : ℂ))) = fourierC f ((2 * lam) * ξ) := by
    unfold fourierC
    apply integral_congr_ae
    filter_upwards with y
    have hy : (-(2 * (Real.pi : ℂ)) * Complex.I * ξ * ((2 * lam * y : ℝ) : ℂ))
        = -(2 * (Real.pi : ℂ)) * Complex.I * ((2 * lam) * ξ) * (y : ℂ) := by
      push_cast
      ring
    rw [hy]
  rw [hL, key, hR, Complex.real_smul]
  push_cast
  ring

/-- (ii-a) `A_{ψ,λ} = 2λ · A_ψ` (R1 GREEN; only `0 < lam` needed). -/
theorem cutoffNormaliserLam_covariance {lam : ℝ} (hlam : 0 < lam) (psi : ℝ → ℝ) :
    cutoffNormaliserLam lam psi = 2 * lam * cutoffNormaliser psi := by
  have key := integral_comp_dilateTo (lam := lam) hlam
    (G := fun y : ℝ => psi y ^ 2 * extremalTest y)
  rw [smul_eq_mul] at key
  unfold cutoffNormaliserLam cutoffNormaliser extremalLam dilateTo
  exact key

/-- (ii-b) `cutoffTestLam lam psi = √(A_ψ/A_{ψ,λ}) · dilateTo lam (cutoffTest psi)`
(R1 GREEN; `0 < A_ψ` hypothesis per the R1 header note). -/
theorem cutoffTestLam_eq_dilate {lam : ℝ} (hlam : 0 < lam) {psi : ℝ → ℝ}
    (hA : 0 < cutoffNormaliser psi) :
    cutoffTestLam lam psi = fun x =>
      Real.sqrt (cutoffNormaliser psi / cutoffNormaliserLam lam psi)
        * dilateTo lam (cutoffTest psi) x := by
  have hAlam : 0 < cutoffNormaliserLam lam psi := by
    rw [cutoffNormaliserLam_covariance hlam psi]
    exact mul_pos (mul_pos two_pos hlam) hA
  have hpsi0 : Real.sqrt (cutoffNormaliser psi) ≠ 0 := Real.sqrt_ne_zero'.mpr hA
  have hlam0 : Real.sqrt (cutoffNormaliserLam lam psi) ≠ 0 :=
    Real.sqrt_ne_zero'.mpr hAlam
  funext x
  rw [Real.sqrt_div (le_of_lt hA)]
  unfold cutoffTestLam extremalLam dilateTo cutoffTest
  field_simp

/-- `dilateTo (1/2) = id` on the nose (ρ = 2·(1/2) = 1; R1 GREEN). -/
theorem dilateTo_half (f : ℝ → ℝ) : dilateTo (1 / 2) f = f := by
  funext x
  unfold dilateTo
  norm_num

/-- λ = 1/2 regression, test-function level (R1 GREEN). -/
theorem cutoffTestLam_half {psi : ℝ → ℝ} (hA : 0 < cutoffNormaliser psi) :
    cutoffTestLam (1 / 2) psi = cutoffTest psi := by
  have hhalf : (0:ℝ) < 1 / 2 := by norm_num
  have hcov : cutoffNormaliserLam (1 / 2) psi = cutoffNormaliser psi := by
    rw [cutoffNormaliserLam_covariance hhalf psi]
    norm_num
  funext x
  rw [cutoffTestLam_eq_dilate hhalf hA]
  simp only [hcov, dilateTo_half, div_self hA.ne', Real.sqrt_one, one_mul]

/-! ## Carried R2 results (fix-batch-6 forms, eta-r2.lean @ ed412a03fec748ee) -/

/-- Pointwise square relation (R2; APPLIED form — the Pi-power defeq of
`cutoffTestSq` is the run-1..5 whnf-timeout source). -/
private theorem cutoffTestLamSq_eq {lam : ℝ} (hlam : 0 < lam) {psi : ℝ → ℝ}
    (hA : 0 < cutoffNormaliser psi) (x : ℝ) :
    (cutoffTestLam lam psi x)^2
      = (cutoffNormaliser psi / cutoffNormaliserLam lam psi)
          * (cutoffTest psi (x / (2 * lam)))^2 := by
  have h := cutoffTestLam_eq_dilate hlam hA
  have hAlam : 0 < cutoffNormaliserLam lam psi := by
    rw [cutoffNormaliserLam_covariance hlam psi]
    exact mul_pos (mul_pos two_pos hlam) hA
  have hpos : 0 ≤ cutoffNormaliser psi / cutoffNormaliserLam lam psi :=
    div_nonneg (le_of_lt hA) (le_of_lt hAlam)
  have hbeta : cutoffTestLam lam psi x
      = Real.sqrt (cutoffNormaliser psi / cutoffNormaliserLam lam psi)
          * cutoffTest psi (x / (2 * lam)) := by
    have h2 := congrFun h x
    simp only [dilateTo] at h2
    exact h2
  rw [hbeta, mul_pow, Real.sq_sqrt hpos]

set_option maxHeartbeats 1000000 in
/-- **(A) The corrected convolution covariance** (R2, fix-batch-6). -/
theorem cutoffSelfConvLam_eq_scaled_dilate {lam : ℝ} (hlam : 0 < lam)
    {psi : ℝ → ℝ} (hA : 0 < cutoffNormaliser psi) :
    cutoffSelfConvLam lam psi
      = (2 * lam)⁻¹ • dilateTo lam (cutoffSelfConv psi) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hn : (2 * lam : ℝ) ≠ 0 := ne_of_gt hρ
  have hAne : cutoffNormaliser psi ≠ 0 := ne_of_gt hA
  have hAlam : cutoffNormaliserLam lam psi = 2 * lam * cutoffNormaliser psi :=
    cutoffNormaliserLam_covariance hlam psi
  funext x
  have hint : ∀ t : ℝ,
      (cutoffTestLam lam psi t)^2 * (cutoffTestLam lam psi (x - t))^2
        = ((cutoffTest psi (t / (2 * lam)))^2
            * (cutoffTest psi ((x - t) / (2 * lam)))^2)
          * (cutoffNormaliser psi / cutoffNormaliserLam lam psi)^2 := by
    intro t
    rw [cutoffTestLamSq_eq hlam hA t, cutoffTestLamSq_eq hlam hA (x - t)]
    ring
  have hsub : ∀ t : ℝ, (x - t) / (2 * lam)
      = x / (2 * lam) - t / (2 * lam) := by
    intro t
    rw [sub_div, div_sub_div_same]
  have hstep2 := integral_comp_dilateTo (lam := lam) hlam
    (G := fun s : ℝ => (cutoffTest psi s)^2
      * (cutoffTest psi (x / (2 * lam) - s))^2)
  have hchange : ∫ t : ℝ, (cutoffTest psi (t / (2 * lam)))^2
          * (cutoffTest psi ((x - t) / (2 * lam)))^2
      = (2 * lam) • ∫ s : ℝ, (cutoffTest psi s)^2
          * (cutoffTest psi (x / (2 * lam) - s))^2 := by
    rw [← hstep2]
    refine integral_congr_ae ?_
    filter_upwards with t
    rw [hsub t]
  calc cutoffSelfConvLam lam psi x
      = ∫ t : ℝ, ((cutoffTest psi (t / (2 * lam)))^2
              * (cutoffTest psi ((x - t) / (2 * lam)))^2)
          * (cutoffNormaliser psi / cutoffNormaliserLam lam psi)^2 := by
        unfold cutoffSelfConvLam
        exact integral_congr_ae (by
          filter_upwards with t
          exact hint t)
    _ = (∫ t : ℝ, (cutoffTest psi (t / (2 * lam)))^2
              * (cutoffTest psi ((x - t) / (2 * lam)))^2)
          * (cutoffNormaliser psi / cutoffNormaliserLam lam psi)^2 :=
        integral_mul_const _ _
    _ = ((2 * lam) • ∫ s : ℝ, (cutoffTest psi s)^2
          * (cutoffTest psi (x / (2 * lam) - s))^2)
          * (cutoffNormaliser psi / cutoffNormaliserLam lam psi)^2 := by
        rw [hchange]
    _ = (2 * lam)⁻¹ * cutoffSelfConv psi (x / (2 * lam)) := by
        have hfac : (cutoffNormaliser psi / cutoffNormaliserLam lam psi)^2
            * (2 * lam) = (2 * lam)⁻¹ := by
          rw [hAlam]
          field_simp [hAne]
        have hQap : cutoffSelfConv psi (x / (2 * lam))
            = ∫ t : ℝ, (cutoffTest psi t)^2
                * (cutoffTest psi (x / (2 * lam) - t))^2 := by
          unfold cutoffSelfConv
          refine integral_congr_ae ?_
          filter_upwards with t
          simp only [cutoffTestSq, Pi.pow_apply]
        rw [smul_eq_mul, hQap, ← hfac]
        ring

/-! ## The R5 calculus layer: second-derivative transport along the dilation -/

/-- First derivative of the dilation (`HasDerivAt.div_const` composition). -/
private theorem hasDerivAt_dilateTo {lam : ℝ} (hlam : 0 < lam) {f : ℝ → ℝ}
    (hf : ContDiff ℝ (⊤ : ℕ∞) f) (y : ℝ) :
    HasDerivAt (fun x : ℝ => f (x / (2 * lam)))
      (deriv f (y / (2 * lam)) * (2 * lam)⁻¹) y := by
  have hga : HasDerivAt (fun x : ℝ => x / (2 * lam)) ((2 * lam)⁻¹) y := by
    simpa using (hasDerivAt_id y).div_const (2 * lam)
  have hfa : HasDerivAt f (deriv f (y / (2 * lam))) (y / (2 * lam)) :=
    ((hf.differentiable (by simp)) (y / (2 * lam))).hasDerivAt
  have hcomp : HasDerivAt (f ∘ (fun x : ℝ => x / (2 * lam)))
      (deriv f (y / (2 * lam)) * (2 * lam)⁻¹) y :=
    HasDerivAt.comp y hfa hga
  simpa only [Function.comp_def] using hcomp

/-- **Second-derivative transport** (the R5 engine): for ContDiff `f`,
`iteratedDeriv 2 ((2λ)⁻¹ • dilateTo lam f) x = (2λ)⁻³ * f''(x/(2λ))`
(the donor's `iteratedDeriv_eq_iterate` + `ContDiff.iterate_deriv` idiom,
Zeta/Kernel.lean:361). -/
private theorem iteratedDeriv_two_const_smul_dilate {lam : ℝ} (hlam : 0 < lam)
    {f : ℝ → ℝ} (hf : ContDiff ℝ (⊤ : ℕ∞) f) :
    ∀ x : ℝ, iteratedDeriv 2 ((2 * lam)⁻¹ • dilateTo lam f) x
      = (2 * lam)⁻¹ * ((2 * lam)⁻¹ * ((2 * lam)⁻¹
          * iteratedDeriv 2 f (x / (2 * lam)))) := by
  have hf' : ContDiff ℝ (⊤ : ℕ∞) (deriv f) := by
    simpa only [Function.iterate_one] using hf.iterate_deriv 1
  have hd1 : ∀ y : ℝ, HasDerivAt (fun x => (2 * lam)⁻¹ * f (x / (2 * lam)))
      ((2 * lam)⁻¹ * (deriv f (y / (2 * lam)) * (2 * lam)⁻¹)) y := by
    intro y
    have hbase := hasDerivAt_dilateTo hlam hf y
    have h2 := hbase.const_mul ((2 * lam)⁻¹)
    simpa only [mul_assoc] using h2
  have hder1 : deriv (fun x => (2 * lam)⁻¹ * f (x / (2 * lam)))
      = fun y => ((2 * lam)⁻¹ * (2 * lam)⁻¹)
          * deriv f (y / (2 * lam)) := by
    funext y
    have hval := (hd1 y).deriv
    rw [hval]
    ring
  have hd2 : ∀ y : ℝ, HasDerivAt
      (fun x => ((2 * lam)⁻¹ * (2 * lam)⁻¹)
          * deriv f (x / (2 * lam)))
      (((2 * lam)⁻¹ * (2 * lam)⁻¹)
        * (iteratedDeriv 2 f (y / (2 * lam)) * (2 * lam)⁻¹)) y := by
    intro y
    have hbase := hasDerivAt_dilateTo hlam hf' y
    have heq : deriv (deriv f) (y / (2 * lam))
        = iteratedDeriv 2 f (y / (2 * lam)) := by
      rw [iteratedDeriv_eq_iterate]
      simp only [Function.iterate_succ_apply, Function.iterate_zero_apply]
    rw [heq] at hbase
    exact hbase.const_mul ((2 * lam)⁻¹ * (2 * lam)⁻¹)
  intro x
  have hfun : (2 * lam)⁻¹ • dilateTo lam f
      = fun x => (2 * lam)⁻¹ * f (x / (2 * lam)) := by
    funext y
    simp only [dilateTo, Pi.smul_apply, smul_eq_mul]
  rw [hfun, iteratedDeriv_eq_iterate]
  simp only [Function.iterate_succ_apply, Function.iterate_zero_apply]
  rw [hder1, (hd2 x).deriv]
  ring

/-! ## R5 support layer: scaled regularity + the donor integrability mirror -/

/-- Smoothness of `Q_λ` (transport of the PUBLIC `contDiff_cutoffSelfConv`,
Zeta/Basic.lean:207, through lemma A; the R2 (C)-proof block). -/
private theorem contDiff_cutoffSelfConvLam {lam : ℝ} (hlam : 0 < lam)
    {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) :
    ContDiff ℝ (⊤ : ℕ∞) (cutoffSelfConvLam lam psi) := by
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  rw [hQ]
  exact contDiff_const.mul
    ((contDiff_cutoffSelfConv hpsi).comp (contDiff_id.div_const _))

/-- Compact support of `Q_λ` (transport of the PUBLIC
`cutoffSelfConv_eq_zero_of_one_le_abs`, Zeta/Basic.lean:218; the R2 (C)-block). -/
private theorem hasCompactSupport_cutoffSelfConvLam {lam : ℝ} (hlam : 0 < lam)
    (hle : lam ≤ 1 / 2) {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) :
    HasCompactSupport (cutoffSelfConvLam lam psi) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hρ1 : 2 * lam ≤ 1 := by linarith
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  have hQdilzero : ∀ x : ℝ, 1 ≤ |x| → dilateTo lam (cutoffSelfConv psi) x = 0 := by
    intro x hx
    have harg : 1 ≤ |x / (2 * lam)| := by
      have h1 : |x / (2 * lam)| = |x| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      exact (le_div_iff₀ hρ).mpr (by linarith)
    unfold dilateTo
    rw [cutoffSelfConv_eq_zero_of_one_le_abs hpsi harg]
  have hQlamzero : ∀ x : ℝ, 1 ≤ |x| → cutoffSelfConvLam lam psi x = 0 := by
    intro x hx
    rw [hQ, Pi.smul_apply, hQdilzero x hx, smul_eq_mul, mul_zero]
  refine HasCompactSupport.of_support_subset_isCompact
    (K := Set.Icc (-(1 : ℝ)) 1) isCompact_Icc ?_
  intro x hx
  by_contra hmem
  have habs : 1 ≤ |x| := by
    by_contra hc
    have h1 : |x| < 1 := by linarith
    have h2 := abs_lt.mp h1
    exact hmem (Set.mem_Icc.mpr ⟨le_of_lt h2.1, le_of_lt h2.2⟩)
  exact absurd (hQlamzero x habs) hx

/-- Smoothness of `Q_λ''` (the R2 (D)-block; `ContDiff.iterate_deriv`). -/
private theorem contDiff_iteratedDeriv_two_cutoffSelfConvLam {lam : ℝ}
    (hlam : 0 < lam) {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) :
    ContDiff ℝ (⊤ : ℕ∞) (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) := by
  rw [iteratedDeriv_eq_iterate]
  exact ContDiff.iterate_deriv 2 (contDiff_cutoffSelfConvLam hlam hpsi hA)

/-- Compact support of `Q_λ''` (transport of the PUBLIC
`iteratedDeriv_two_cutoffSelfConv_eq_zero`, Zeta/Basic.lean:265 — STRICT window —
through the second-derivative dilation transport; needs ρ ≤ 1). -/
private theorem hasCompactSupport_iteratedDeriv_two_cutoffSelfConvLam {lam : ℝ}
    (hlam : 0 < lam) (hle : lam ≤ 1 / 2) {delta : ℝ} {psi : ℝ → ℝ}
    (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) :
    HasCompactSupport (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  have hQcd : ContDiff ℝ (⊤ : ℕ∞) (cutoffSelfConv psi) := contDiff_cutoffSelfConv hpsi
  have hiter := iteratedDeriv_two_const_smul_dilate hlam hQcd
  have hQlamzero : ∀ x : ℝ, 1 < |x| →
      iteratedDeriv 2 (cutoffSelfConvLam lam psi) x = 0 := by
    intro x hx
    rw [hQ]
    have harg : 1 < |x / (2 * lam)| := by
      have h1 : |x / (2 * lam)| = |x| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      rw [lt_div_iff₀ hρ]
      linarith
    rw [hiter x, iteratedDeriv_two_cutoffSelfConv_eq_zero hpsi harg]
    simp
  refine HasCompactSupport.of_support_subset_isCompact
    (K := Set.Icc (-(1 : ℝ)) 1) isCompact_Icc ?_
  intro x hx
  by_contra hmem
  have habs : 1 < |x| := by
    by_contra hc
    have h1 : |x| ≤ 1 := by linarith
    have h2 := abs_le.mp h1
    exact hmem (Set.mem_Icc.mpr h2)
  exact absurd (hQlamzero x habs) hx

/-- Mirror of the donor's PRIVATE `integrable_fourierC_integrand`
(Zeta/Kernel.lean:88; the P1 private-copy precedent — local re-proof, cited,
never transported-by-invocation). -/
private theorem integrable_fourierC_integrand' {f : ℝ → ℝ} (hf : Continuous f)
    (hfc : HasCompactSupport f) (z : ℂ) :
    Integrable (fun x : ℝ => (f x : ℂ)
      * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z * (x : ℂ))) := by
  have hc : HasCompactSupport (fun x : ℝ => (f x : ℂ)) := by
    change HasCompactSupport ((fun x : ℝ => (x : ℂ)) ∘ f)
    exact hfc.comp_left (g := fun x : ℝ => (x : ℂ)) (by norm_num)
  apply Continuous.integrable_of_hasCompactSupport
  · fun_prop
  · exact hc.mul_right

/-! ## R5 Fourier layer at κ = 1 -/

/-- `testKernel` in applied form (avoids the Pi-power defeq at the definitional
unfolding site; the donor's own `Pi.pow_apply` idiom). -/
private theorem testKernel_eq (eta : ℝ → ℝ) (z : ℂ) :
    testKernel eta z = fourierC (fun x => eta x * eta x) z := by
  unfold testKernel
  congr 1
  funext x
  simp only [Pi.pow_apply]
  ring

set_option maxHeartbeats 1000000 in
/-- Combined dilation-division covariance: R1's `fourierC_dilateTo` mechanics with
a constant DIVISOR (the div-route — `integral_div` is the donor's own split
engine, Zeta/Kernel.lean:399). Heartbeat insurance: the hR pointwise congr
runs field_simp near the default budget (runs 12-13 finding). -/
private theorem fourierC_dilateTo_div {lam : ℝ} (hlam : 0 < lam) {f : ℝ → ℝ}
    (hf : Continuous f) (hfs : HasCompactSupport f) (d : ℝ) (z : ℂ) :
    fourierC (fun x => f (x / (2 * lam)) / d) z
      = (2 * lam) * (fourierC f ((2 * lam) * z) / ((d : ℝ) : ℂ)) := by
  have hint := integrable_fourierC_integrand' hf hfs ((2 * lam) * z)
  have key := integral_comp_dilateTo (lam := lam) hlam
    (G := fun y : ℝ => ((f y / d : ℝ) : ℂ)
      * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z
        * ((2 * lam * y : ℝ) : ℂ)))
  have hL : fourierC (fun x => f (x / (2 * lam)) / d) z = ∫ x : ℝ,
      ((f (x / (2 * lam)) / d : ℝ) : ℂ) *
        Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z
          * ((2 * lam * (x / (2 * lam)) : ℝ) : ℂ)) := by
    unfold fourierC
    apply integral_congr_ae
    filter_upwards with x
    have hx : 2 * lam * (x / (2 * lam)) = x := by field_simp
    rw [hx]
  have hR : (∫ y : ℝ, ((f y / d : ℝ) : ℂ)
      * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z
        * ((2 * lam * y : ℝ) : ℂ)))
      = fourierC f ((2 * lam) * z) / ((d : ℝ) : ℂ) := by
    unfold fourierC
    rw [show (∫ y : ℝ, ((f y / d : ℝ) : ℂ)
          * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z
            * ((2 * lam * y : ℝ) : ℂ)))
        = ∫ y : ℝ, (((f y : ℝ) : ℂ)
            * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * ((2 * lam) * z)
              * ((y : ℝ) : ℂ))) / ((d : ℝ) : ℂ) from by
        refine integral_congr_ae ?_
        filter_upwards with y
        push_cast
        field_simp]
    rw [integral_div]
  rw [hL, key, hR, Complex.real_smul]
  push_cast
  ring

/-- **(T2) Kernel covariance**: `testKernel κ_λ z = testKernel κ (ρ·z)` — the
square-level transport (R1 (i) + R2's applied-form square relation). -/
theorem testKernel_cutoffTestLam {lam : ℝ} (hlam : 0 < lam) {delta : ℝ}
    {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi)
    (z : ℂ) :
    testKernel (cutoffTestLam lam psi) z
      = testKernel (cutoffTest psi) ((2 * lam) * z) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hc : ((2 * lam : ℝ) : ℂ) ≠ 0 := by exact_mod_cast (ne_of_gt hρ)
  have hAlam : cutoffNormaliserLam lam psi = 2 * lam * cutoffNormaliser psi :=
    cutoffNormaliserLam_covariance hlam psi
  have hAne : cutoffNormaliser psi ≠ 0 := ne_of_gt hA
  have hκ2cont : Continuous (fun y : ℝ => cutoffTest psi y * cutoffTest psi y) :=
    ((cutoffTest_contDiff hpsi).continuous).mul (cutoffTest_contDiff hpsi).continuous
  have hκ2supp : HasCompactSupport
      (fun y : ℝ => cutoffTest psi y * cutoffTest psi y) :=
    (cutoffTest_hasCompactSupport hpsi).mul_right
  have hfund : (fun x : ℝ => cutoffTestLam lam psi x * cutoffTestLam lam psi x)
      = fun x => (cutoffTest psi (x / (2 * lam))
          * cutoffTest psi (x / (2 * lam))) / (2 * lam) := by
    funext x
    have h2 := cutoffTestLamSq_eq hlam hA x
    rw [hAlam] at h2
    rw [show cutoffTestLam lam psi x * cutoffTestLam lam psi x
          = (cutoffTestLam lam psi x)^2 from by ring,
      show cutoffTest psi (x / (2 * lam)) * cutoffTest psi (x / (2 * lam))
          = (cutoffTest psi (x / (2 * lam)))^2 from by ring,
      h2]
    field_simp [hAne]
  rw [testKernel_eq (cutoffTestLam lam psi) z,
    testKernel_eq (cutoffTest psi) ((2 * lam) * z), hfund,
    fourierC_dilateTo_div hlam hκ2cont hκ2supp (2 * lam) z]
  exact mul_div_cancel₀ _ hc

set_option maxHeartbeats 1000000 in
/-- **(T3) The scaled convolution-product identity** — `fourierC Q_λ =
testKernel κ_λ²`, TRANSPORTED from the donor's PUBLIC
`fourierC_cutoffSelfConv` (KernelBessel.lean:512) via lemma A + R1 (i). -/
theorem fourierC_cutoffSelfConvLam {lam : ℝ} (hlam : 0 < lam) {delta : ℝ}
    {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi)
    (z : ℂ) :
    fourierC (cutoffSelfConvLam lam psi) z
      = testKernel (cutoffTestLam lam psi) z ^ 2 := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hc : ((2 * lam : ℝ) : ℂ) ≠ 0 := by exact_mod_cast (ne_of_gt hρ)
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  have hQcont : Continuous (cutoffSelfConv psi) :=
    (contDiff_cutoffSelfConv hpsi).continuous
  have hQsupp : HasCompactSupport (cutoffSelfConv psi) :=
    hasCompactSupport_cutoffSelfConv hpsi
  have hfn : (2 * lam)⁻¹ • dilateTo lam (cutoffSelfConv psi)
      = fun x => cutoffSelfConv psi (x / (2 * lam)) / (2 * lam) := by
    funext x
    simp only [Pi.smul_apply, smul_eq_mul, dilateTo]
    field_simp
  rw [hQ, hfn, fourierC_dilateTo_div hlam hQcont hQsupp (2 * lam) z,
    fourierC_cutoffSelfConv hpsi, ← testKernel_cutoffTestLam hlam hpsi hA z]
  exact mul_div_cancel₀ _ hc

/-- **(R5-1) Fourier value of the scaled second derivative** — mirror-statement of
the donor's PUBLIC `fourierC_iteratedDeriv_two_cutoffSelfConv`
(Zeta/Kernel.lean:356) at `Q_λ`, derived by transport (the κ=1 `(2πiz)²`
multiplier; coefficient −4π² VERBATIM). -/
theorem fourierC_iteratedDeriv_two_cutoffSelfConvLam {lam : ℝ} (hlam : 0 < lam)
    {delta : ℝ} (hd : 0 < delta) (hd4 : delta < 1 / 4) {psi : ℝ → ℝ}
    (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) (z : ℂ) :
    fourierC (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) z
      = -4 * (Real.pi : ℂ)^2 * z^2 * testKernel (cutoffTestLam lam psi) z ^ 2 := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hc : ((2 * lam : ℝ) : ℂ) ≠ 0 := by exact_mod_cast (ne_of_gt hρ)
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  have hQcd : ContDiff ℝ (⊤ : ℕ∞) (cutoffSelfConv psi) := contDiff_cutoffSelfConv hpsi
  have hQ2cd : ContDiff ℝ (⊤ : ℕ∞) (iteratedDeriv 2 (cutoffSelfConv psi)) :=
    contDiff_iteratedDeriv_two_cutoffSelfConv hpsi
  have hQ2supp : HasCompactSupport (iteratedDeriv 2 (cutoffSelfConv psi)) := by
    rw [iteratedDeriv_eq_iterate]
    simpa only [Function.iterate_succ_apply, Function.iterate_zero_apply] using
      (hasCompactSupport_cutoffSelfConv hpsi).deriv.deriv
  have hiterf : iteratedDeriv 2 ((2 * lam)⁻¹ • dilateTo lam (cutoffSelfConv psi))
      = fun x => iteratedDeriv 2 (cutoffSelfConv psi) (x / (2 * lam))
          / ((2 * lam) * (2 * lam) * (2 * lam)) := by
    have h0 := iteratedDeriv_two_const_smul_dilate hlam hQcd
    funext x
    rw [h0 x]
    field_simp
  rw [hQ, hiterf]
  rw [fourierC_dilateTo_div hlam hQ2cd.continuous hQ2supp
    ((2 * lam) * (2 * lam) * (2 * lam)) z]
  rw [fourierC_iteratedDeriv_two_cutoffSelfConv hd hd4 hpsi]
  rw [← testKernel_cutoffTestLam hlam hpsi hA z]
  rw [show (((2 * lam) * (2 * lam) * (2 * lam) : ℝ) : ℂ)
      = ((2 * lam : ℝ) : ℂ) * (((2 * lam : ℝ) : ℂ)
          * ((2 * lam : ℝ) : ℂ)) from by push_cast; ring]
  field_simp [hc]
  ring

/-- The integrand-level split of the scaled corrected test (the donor's
`fourierC_correctedTest` engine, Zeta/Kernel.lean:377–:401, at `correctedTestLam`;
the div/`integral_sub` route with integrability from the scaled support layer). -/
private theorem fourierC_correctedTestLam_split {lam : ℝ} (hlam : 0 < lam)
    (hle : lam ≤ 1 / 2) {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) {T : ℝ} (hT : 1 < T) (z : ℂ) :
    fourierC (correctedTestLam lam psi T) z
      = fourierC (cutoffSelfConvLam lam psi) z
          - fourierC (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) z
              / (((4 * Real.log T ^ 2 : ℝ) : ℂ)) := by
  have hI1 := integrable_fourierC_integrand'
    (contDiff_cutoffSelfConvLam hlam hpsi hA).continuous
    (hasCompactSupport_cutoffSelfConvLam hlam hle hpsi hA) z
  have hI2 := integrable_fourierC_integrand'
    (contDiff_iteratedDeriv_two_cutoffSelfConvLam hlam hpsi hA).continuous
    (hasCompactSupport_iteratedDeriv_two_cutoffSelfConvLam hlam hle hpsi hA) z
  unfold correctedTestLam fourierC
  rw [show (fun x : ℝ =>
      (((cutoffSelfConvLam lam psi x
          - iteratedDeriv 2 (cutoffSelfConvLam lam psi) x / (4 * Real.log T ^ 2) : ℝ) : ℂ)
        * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z * ((x : ℝ) : ℂ))))
      = (fun x : ℝ => ((cutoffSelfConvLam lam psi x : ℝ) : ℂ)
          * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z * ((x : ℝ) : ℂ))
          - (((iteratedDeriv 2 (cutoffSelfConvLam lam psi) x : ℝ) : ℂ)
            * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * z * ((x : ℝ) : ℂ)))
            / (((4 * Real.log T ^ 2 : ℝ) : ℂ))) by
      funext x
      push_cast
      ring]
  rw [integral_sub hI1 hI2.div_const _, integral_div]
  change fourierC (cutoffSelfConvLam lam psi) z
      - fourierC (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) z
          / (((4 * Real.log T ^ 2 : ℝ) : ℂ)) = _

/-- **(R5-2) Fourier value of the scaled corrected test** — mirror-statement of
the donor's PUBLIC `fourierC_correctedTest` (Zeta/Kernel.lean:375) at
`correctedTestLam`; the κ=1 factor `1 + π²z²/log²T` VERBATIM. -/
theorem fourierC_correctedTestLam {lam : ℝ} (hlam : 0 < lam) (hle : lam ≤ 1 / 2)
    {delta : ℝ} (hd : 0 < delta) (hd4 : delta < 1 / 4) {psi : ℝ → ℝ}
    (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi)
    {T : ℝ} (hT : 1 < T) (z : ℂ) :
    fourierC (correctedTestLam lam psi T) z
      = (1 + (Real.pi : ℂ)^2 * z^2 / (Real.log T : ℂ)^2)
          * testKernel (cutoffTestLam lam psi) z ^ 2 := by
  have hlog : Real.log T ≠ 0 := ne_of_gt (Real.log_pos hT)
  have hden : ((4 * Real.log T ^ 2 : ℝ) : ℂ) ≠ 0 := by
    exact_mod_cast (mul_ne_zero (by norm_num) (pow_ne_zero 2 hlog))
  rw [fourierC_correctedTestLam_split hlam hle hpsi hA hT z,
    fourierC_cutoffSelfConvLam hlam hpsi hA z,
    fourierC_iteratedDeriv_two_cutoffSelfConvLam hlam hd hd4 hpsi hA z]
  push_cast
  field_simp [hlog, hden]
  ring

/-! ## R6: weight cancellation + the exact identity -/

/-- **(R6-3) Weight cancellation at the scaled family** — mirror-statement of the
donor's PUBLIC `correctedTest_weight_cancel` (Zeta/Kernel.lean:412); the
`rescaledDiff`/`pairWeight` algebra is family-free (donor-verbatim). -/
theorem correctedTestLam_weight_cancel {lam : ℝ} (hlam : 0 < lam)
    (hle : lam ≤ 1 / 2) {delta : ℝ} (hd : 0 < delta) (hd4 : delta < 1 / 4)
    {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi)
    {T : ℝ} (hT : 1 < T) {rho rho' : ℂ} (hrho0 : 0 < rho.re) (hrho1 : rho.re < 1)
    (hrho0' : 0 < rho'.re) (hrho1' : rho'.re < 1) :
    fourierC (correctedTestLam lam psi T) (rescaledDiff T rho rho')
        * pairWeight (rho - rho')
      = testKernel (cutoffTestLam lam psi) (rescaledDiff T rho rho') ^ 2 := by
  let d : ℂ := rho - rho'
  have hdre0 : -1 < d.re := by
    dsimp [d]
    linarith
  have hdre1 : d.re < 1 := by
    dsimp [d]
    linarith
  have hdne_two : d ≠ (2 : ℂ) := by
    intro h
    have hre := congrArg Complex.re h
    norm_num at hre
    linarith
  have hdne_neg_two : d ≠ -(2 : ℂ) := by
    intro h
    have hre := congrArg Complex.re h
    norm_num at hre
    linarith
  have hden : 4 - d ^ 2 ≠ 0 := by
    rw [show 4 - d ^ 2 = -(d - 2) * (d + 2) by ring]
    exact mul_ne_zero (neg_ne_zero.mpr (sub_ne_zero.mpr hdne_two)) (by
      intro h
      apply hdne_neg_two
      linear_combination h)
  have hlog : Real.log T ≠ 0 := ne_of_gt (Real.log_pos hT)
  have hfactor :
      1 + (Real.pi : ℂ)^2 * (rescaledDiff T rho rho') ^ 2
          / (Real.log T : ℂ) ^ 2 = (4 - d ^ 2) / 4 := by
    unfold rescaledDiff
    dsimp [d]
    push_cast
    field_simp [hlog, Real.pi_ne_zero]
    ring_nf
    rw [show Complex.I ^ 2 = -(1 : ℂ) by norm_num]
    ring
  rw [fourierC_correctedTestLam hlam hle hd hd4 hpsi hA hT, hfactor]
  unfold pairWeight
  change ((4 - d ^ 2) / 4 * testKernel (cutoffTestLam lam psi)
      (rescaledDiff T rho rho') ^ 2) * (4 / (4 - d ^ 2)) = _
  field_simp [hden]

/-- **(R6-4) The exact identity at the scaled family** — mirror-statement of the
donor's PUBLIC `unweightedKernelSum_cutoffTest_eq_pairCorrelationSum`
(Zeta/Kernel.lean:515): the kernel sum equals the pair-correlation sum at `Q_λ`
minus the `1/(4 log²T)` second-derivative correction — the donor's coefficient
VERBATIM (κ=1; the Finset algebra is family-free, donor-verbatim). -/
theorem unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum {lam : ℝ}
    (hlam : 0 < lam) (hle : lam ≤ 1 / 2) {delta : ℝ} (hd : 0 < delta)
    (hd4 : delta < 1 / 4) {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) {T : ℝ} (hT : 1 < T) :
    unweightedKernelSum (cutoffTestLam lam psi) T
      = pairCorrelationSum (cutoffSelfConvLam lam psi) T
          - pairCorrelationSum (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) T
              / (((4 * Real.log T ^ 2 : ℝ) : ℂ)) := by
  let s := (nontrivialZeros_finite T).toFinset
  have hlog : Real.log T ≠ 0 := ne_of_gt (Real.log_pos hT)
  have hlinear (z : ℂ) :
      fourierC (correctedTestLam lam psi T) z
        = fourierC (cutoffSelfConvLam lam psi) z
          - fourierC (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) z
              / (((4 * Real.log T ^ 2 : ℝ) : ℂ)) :=
    fourierC_correctedTestLam_split hlam hle hpsi hA hT z
  rw [unweightedKernelSum, pairCorrelationSum, pairCorrelationSum]
  rw [finsum_mem_eq_finite_toFinset_sum _ (nontrivialZeros_finite T)]
  simp_rw [finsum_mem_eq_finite_toFinset_sum _ (nontrivialZeros_finite T)]
  change (∑ rho ∈ s, ∑ rho' ∈ s,
      ((zeroMultiplicity rho * zeroMultiplicity rho' : ℕ) : ℂ)
        * testKernel (cutoffTestLam lam psi) (rescaledDiff T rho rho') ^ 2) =
    (∑ rho ∈ s, ∑ rho' ∈ s,
      ((zeroMultiplicity rho * zeroMultiplicity rho' : ℕ) : ℂ)
        * fourierC (cutoffSelfConvLam lam psi) (rescaledDiff T rho rho')
          * pairWeight (rho - rho')) -
      (∑ rho ∈ s, ∑ rho' ∈ s,
      ((zeroMultiplicity rho * zeroMultiplicity rho' : ℕ) : ℂ)
          * fourierC (iteratedDeriv 2 (cutoffSelfConvLam lam psi))
              (rescaledDiff T rho rho') *
            pairWeight (rho - rho')) / (((4 * Real.log T ^ 2 : ℝ) : ℂ))
  rw [Finset.sum_div]
  simp_rw [Finset.sum_div]
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro rho hrho
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro rho' hrho'
  have hrho_mem : rho ∈ nontrivialZeros T := by
    simpa [s] using hrho
  have hrho'_mem : rho' ∈ nontrivialZeros T := by
    simpa [s] using hrho'
  have hcancel := correctedTestLam_weight_cancel hlam hle hd hd4 hpsi hA hT
    hrho_mem.2.1 hrho_mem.2.2.1 hrho'_mem.2.1 hrho'_mem.2.2.1
  rw [← hcancel, hlinear]
  ring

/-! ## The λ = 1/2 regression anchors (bit-for-bit; at ρ = 1 every scaled form
collapses to the donor's public form) -/

/-- λ = 1/2: `Q_{1/2} = Q` (lemma A at ρ = 1 — the function-level anchor). -/
theorem cutoffSelfConvLam_half {psi : ℝ → ℝ} (hA : 0 < cutoffNormaliser psi) :
    cutoffSelfConvLam (1 / 2) psi = cutoffSelfConv psi := by
  have hhalf : (0 : ℝ) < 1 / 2 := by norm_num
  rw [cutoffSelfConvLam_eq_scaled_dilate hhalf hA]
  have hr : ((2 * (1 / 2 : ℝ))⁻¹ : ℝ) = 1 := by norm_num
  have hd : dilateTo (1 / 2) (cutoffSelfConv psi) = cutoffSelfConv psi :=
    dilateTo_half _
  show ((2 * (1 / 2 : ℝ))⁻¹ • dilateTo (1 / 2) (cutoffSelfConv psi)) = _
  rw [hr, hd]
  exact one_smul _ _

/-- λ = 1/2 kernel anchor: `testKernel κ_{1/2} = testKernel κ` (T2 at ρ = 1). -/
theorem testKernel_cutoffTestLam_half {delta : ℝ} {psi : ℝ → ℝ}
    (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) (z : ℂ) :
    testKernel (cutoffTestLam (1 / 2) psi) z = testKernel (cutoffTest psi) z := by
  have hhalf : (0 : ℝ) < 1 / 2 := by norm_num
  rw [testKernel_cutoffTestLam hhalf hpsi hA z]
  norm_num

/-- λ = 1/2 Fourier anchor: the R5-2 instance at `lam = 1/2` IS the donor's
public `fourierC_correctedTest` RHS, bit-for-bit (= Zeta/Kernel.lean:375's RHS). -/
theorem fourierC_correctedTestLam_half {delta : ℝ} (hd : 0 < delta)
    (hd4 : delta < 1 / 4) {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) {T : ℝ} (hT : 1 < T) (z : ℂ) :
    fourierC (correctedTestLam (1 / 2) psi T) z
      = (1 + (Real.pi : ℂ)^2 * z^2 / (Real.log T : ℂ)^2)
          * testKernel (cutoffTest psi) z ^ 2 := by
  rw [fourierC_correctedTestLam (by norm_num : (0 : ℝ) < 1 / 2) (by norm_num)
    hd hd4 hpsi hA hT z, testKernel_cutoffTestLam_half hpsi hA z]

/-- λ = 1/2 identity anchor: the R6-4 instance at `lam = 1/2` IS the donor's
public identity RHS, bit-for-bit (= Zeta/Kernel.lean:515's RHS). -/
theorem unweightedKernelSum_cutoffTestLam_half {delta : ℝ} (hd : 0 < delta)
    (hd4 : delta < 1 / 4) {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) {T : ℝ} (hT : 1 < T) :
    unweightedKernelSum (cutoffTestLam (1 / 2) psi) T
      = pairCorrelationSum (cutoffSelfConv psi) T
          - pairCorrelationSum (iteratedDeriv 2 (cutoffSelfConv psi)) T
              / (((4 * Real.log T ^ 2 : ℝ) : ℂ)) := by
  rw [unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum
    (by norm_num : (0 : ℝ) < 1 / 2) (by norm_num) hd hd4 hpsi hA hT,
    cutoffSelfConvLam_half hA]

/-! ## Triad gate (on-pin #print axioms; expected [propext, Classical.choice,
Quot.sound] per declaration) -/

#print axioms ZZLam.EtaPort.testKernel_cutoffTestLam
#print axioms ZZLam.EtaPort.fourierC_cutoffSelfConvLam
#print axioms ZZLam.EtaPort.fourierC_iteratedDeriv_two_cutoffSelfConvLam
#print axioms ZZLam.EtaPort.fourierC_correctedTestLam
#print axioms ZZLam.EtaPort.correctedTestLam_weight_cancel
#print axioms ZZLam.EtaPort.unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum
#print axioms ZZLam.EtaPort.cutoffSelfConvLam_half
#print axioms ZZLam.EtaPort.testKernel_cutoffTestLam_half
#print axioms ZZLam.EtaPort.fourierC_correctedTestLam_half
#print axioms ZZLam.EtaPort.unweightedKernelSum_cutoffTestLam_half

end ZZLam.EtaPort
