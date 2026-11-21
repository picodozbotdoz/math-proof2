/-
Pilot ZZV2-λ η-port — RUNG R7 (the bridge port — the de-freezing move), PROOF
ARTIFACT (lane R5, A3 lineage; fired 2026-11-21 per eta-port-plan.md §R7, on the
iter-7 day-1 grant D2′(c), RESEARCH.md §Iteration 7; the wrap
`pilots/zzv2-lam/zzv2-lam-port-wrap.md` §3 the pricing record).

SORRY-STRICT: zero `sorry` by construction. Elaborated INSIDE the built
ZetaZerosV2 tree on-pin (mathlib ff2494ea, toolchain v4.36.0-rc2).

Billing: technical record per DECISION-2 = Option A (record-billed, quota-free) —
infrastructure, never discovery-phrased; informal λ-dependence is Lamzouri's
(must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

SELF-CONTAINED CONVENTION (the eta-r4 pattern): the base below is eta-r4.lean
@ `285a411e48c3ad1e` VERBATIM (defs + lemma A + the R5/R6 Fourier-identity layer
+ its 10-print triad gate — all GREEN at port run 14, log
`logs/eta-r2-run10-eta-r3-run7-eta-r4-run5.log` `cebc4730`), with the rung-2 trio
(admissibility (B) + the pair-test tier (C)+(D)) re-established from eta-r2.lean
@ `a9c6b59f8a769335` (GREEN at port runs 9/13) — everything the bridge consumes.
The R7 layer (this file's addition): the donor's PUBLIC-statement-shape bridge
`unweightedKernelSum_cutoffTest_tendsto` (Zeta/Kernel.lean:600) proved AT THE
SCALED FAMILY via the PUBLIC `PairCorrelation.tendsto` (Kernel.lean:567) at the
rung-2 instances + the R6-4 identity; the `.re / zeroScale` projection (the
probe's `ScaledBridge`, eta-pin-probe.lean:159) at `scaledConstLam`
(probe :144 def); and the discharge glue — the probe's
`discharge_of_scaledBridge` (:165) with BOTH binders supplied ⇒
`KSAsymptotic lam (scaledConstLam lam psi)` (P1.lean:54 def, carried verbatim),
the de-freezing move: P1's `hKS` binder is now DISCHARGEABLE on the honest
domain 0 < lam ≤ 1/2 for every cutoff ψ.

Donor citations (read-only sibling, ZetaZerosV2 @ our pin): the bridge statement
+ proof skeleton (Zeta/Kernel.lean:600–:652, public — mirrored at the scaled
family; the donor's own is at the frozen family); `PairCorrelation.tendsto`
(Kernel.lean:567, PUBLIC, consumed as-is — no re-proof); `zeroScale`
(Zeta/Asymptotics.lean:29); `IsAdmissible` (Definitions.lean:92); the PUBLIC
frozen layer (Zeta/Basic.lean + Zeta/CutoffSelfConv.lean — the r2 public-layer
re-census list) consumed by (C)/(D); the local mirrors are marked in-line
(`integrable_cutoffWeightLam` the ONE private-copy, Kernel.lean:204).

Runner: research/pilots/zzv2-lam/run_zzv2.sh eta-r4.lean eta-r5.lean (app
crossmath-pilot-zzv2-lam, doz CLI, SPEC 2cpu/4GB, LEAN_NUM_THREADS=2, taskset
build; eta-r4 the regression anchor); sorry-strict verdict branch; verdicts
parsed for BOTH sorry message forms per the D5′ runner one-liners.
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
      = ((2 * lam : ℝ) : ℂ) * (fourierC f ((2 * lam) * z) / ((d : ℝ) : ℂ)) := by
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

set_option maxHeartbeats 1000000 in
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
  push_cast
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
  rw [integral_sub hI1 (hI2.div_const ((4 * Real.log T ^ 2 : ℝ) : ℂ)),
    integral_div]

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

/-! ## R7 — the bridge port (the de-freezing move; D2′(c) grant, 2026-11-21)

Carried rung-2 layer (VERBATIM from eta-r2.lean @ `a9c6b59f`, GREEN at port runs
9/13 — re-established in-file per the self-contained convention; the base file
already carries lemma A and the support layer these consume): (B) admissibility,
(C)+(D) the pair-test tier. NEW: the donor's bridge
`unweightedKernel_cutoffTest_tendsto` (`Zeta/Kernel.lean:600`, public statement
SHAPE; the donor proves it at the frozen family — this file proves it AT THE
SCALED FAMILY) via the PUBLIC `PairCorrelation.tendsto` (Kernel.lean:567) at the
rung-2 instances + the R6-4 identity above; then the `.re / zeroScale` projection
(the probe's `ScaledBridge`, eta-pin-probe.lean:159) and the discharge glue
(`discharge_of_scaledBridge`'s two binders supplied — probe :165). -/

/-- The frozen extremal base is nonnegative everywhere (piecemeal from the PUBLIC
`extremalTest_pos` on the window and the definition outside). -/
private theorem extremalTest_nonneg' (y : ℝ) : 0 ≤ extremalTest y := by
  by_cases h : |y| ≤ 1 / 2
  · exact le_of_lt (extremalTest_pos h)
  · unfold extremalTest
    rw [if_neg h]

/-- The scaled weight is integrable — LOCAL MIRROR of the donor's PRIVATE
`integrable_cutoffWeight` (Zeta/Kernel.lean:204; P1 private-copy precedent,
cited): support-off-window zero + ContinuousOn + compactness, at the λ-window
`[−λ, λ]` (the dilated ψ-support). -/
private theorem integrable_cutoffWeightLam {lam : ℝ} (hlam : 0 < lam)
    {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi) :
    Integrable (fun x : ℝ => dilateTo lam psi x ^ 2 * extremalLam lam x) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hzero : ∀ x ∉ Set.Icc (-lam) lam,
      dilateTo lam psi x ^ 2 * extremalLam lam x = 0 := by
    intro x hx
    have habs : lam ≤ |x| := by
      by_contra hc
      have hx2 : |x| < lam := by linarith
      have hx3 := abs_lt.mp hx2
      exact hx (Set.mem_Icc.mpr ⟨le_of_lt hx3.1, le_of_lt hx3.2⟩)
    have harg : 1 / 2 ≤ |x / (2 * lam)| := by
      have h1 : |x / (2 * lam)| = |x| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      exact (le_div_iff₀ hρ).mpr (by
        rw [show (1 / 2) * (2 * lam) = lam by ring]
        exact habs)
    unfold dilateTo extremalLam dilateTo
    rw [hpsi.support _ harg]
    simp
  have hcont : ContinuousOn (fun x : ℝ => dilateTo lam psi x ^ 2 * extremalLam lam x)
      (Set.Icc (-lam) lam) := by
    have hDiv : Continuous fun x : ℝ => x / (2 * lam) := by continuity
    have hmaps : Set.MapsTo (fun x : ℝ => x / (2 * lam)) (Set.Icc (-lam) lam)
        (Set.Icc (-(1 / 2 : ℝ)) (1 / 2)) := by
      intro x hx
      have hx' : |x| ≤ lam := abs_le.mpr (Set.mem_Icc.mp hx)
      have hxe : |x / (2 * lam)| ≤ 1 / 2 := by
        have h1 : |x / (2 * lam)| = |x| / (2 * lam) := by
          rw [abs_div, abs_of_pos hρ]
        rw [h1]
        exact (div_le_iff₀ hρ).mpr (by
          rw [show (1 / 2) * (2 * lam) = lam by ring]
          exact hx')
      exact Set.mem_Icc.mpr (abs_le.mp hxe)
    have hG : ContinuousOn (fun y : ℝ => psi y ^ 2 *
        (Real.cos (Real.sqrt 2 * y)
          / (Real.sqrt 2 * Real.sin (1 / Real.sqrt 2))))
        (Set.Icc (-(1 / 2 : ℝ)) (1 / 2)) :=
        ((hpsi.smooth.continuous.pow 2).mul
          ((Real.continuous_cos.comp (continuous_const.mul continuous_id)).div_const _)).continuousOn
    have hcomp : ContinuousOn (fun x : ℝ =>
        psi (x / (2 * lam)) ^ 2 *
          (Real.cos (Real.sqrt 2 * (x / (2 * lam)))
            / (Real.sqrt 2 * Real.sin (1 / Real.sqrt 2))))
        (Set.Icc (-lam) lam) := hG.comp hDiv.continuousOn hmaps
    refine hcomp.congr ?_
    intro x hx
    have hx' : |x| ≤ lam := abs_le.mpr (Set.mem_Icc.mp hx)
    have hxe : |x / (2 * lam)| ≤ 1 / 2 := by
      have h1 : |x / (2 * lam)| = |x| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      exact (div_le_iff₀ hρ).mpr (by
        rw [show (1 / 2) * (2 * lam) = lam by ring]
        exact hx')
    have hETeq : extremalTest (x / (2 * lam))
        = Real.cos (Real.sqrt 2 * (x / (2 * lam)))
            / (Real.sqrt 2 * Real.sin (1 / Real.sqrt 2)) := by
      unfold extremalTest
      rw [if_pos hxe]
    unfold dilateTo extremalLam dilateTo
    show psi (x / (2 * lam)) ^ 2 * extremalTest (x / (2 * lam))
        = psi (x / (2 * lam)) ^ 2
          * (Real.cos (Real.sqrt 2 * (x / (2 * lam)))
            / (Real.sqrt 2 * Real.sin (1 / Real.sqrt 2)))
    rw [hETeq]
  exact hcont.integrableOn_Icc.integrable_of_forall_notMem_eq_zero hzero

/-- The scaled test function vanishes at the window edge (IsAdmissible's support
clause). -/
private theorem cutoffTestLam_eq_zero_of_lam_le_abs {lam : ℝ} (hlam : 0 < lam)
    {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi) (x : ℝ) (hx : lam ≤ |x|) :
    cutoffTestLam lam psi x = 0 := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have harg : 1 / 2 ≤ |x / (2 * lam)| := by
    have h1 : |x / (2 * lam)| = |x| / (2 * lam) := by
      rw [abs_div, abs_of_pos hρ]
    rw [h1]
    exact (le_div_iff₀ hρ).mpr (by
      rw [show (1 / 2) * (2 * lam) = lam by ring]
      exact hx)
  unfold cutoffTestLam dilateTo extremalLam dilateTo
  rw [hpsi.support _ harg]
  simp

/-- The pointwise square of the scaled test function, directly (feeds memLp and
the Fourier normalisation). -/
private theorem cutoffTestLamSq_eq' {lam : ℝ} (hlam : 0 < lam)
    {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) (x : ℝ) :
    (cutoffTestLam lam psi x)^2
      = dilateTo lam psi x ^ 2 * extremalLam lam x
          / cutoffNormaliserLam lam psi := by
  have hAlam : 0 < cutoffNormaliserLam lam psi := by
    rw [cutoffNormaliserLam_covariance hlam psi]
    exact mul_pos (mul_pos two_pos hlam) hA
  have hET : 0 ≤ extremalTest (x / (2 * lam)) := extremalTest_nonneg' _
  unfold cutoffTestLam dilateTo extremalLam dilateTo
  rw [div_pow, mul_pow, Real.sq_sqrt hET, Real.sq_sqrt (le_of_lt hAlam)]

/-- **(B) The admissibility port**: `IsAdmissible lam (cutoffTestLam lam psi)` —
port of the donor's private `cutoffTest_isAdmissible` (Kernel.lean:237) at the
scaled family. -/
theorem cutoffTestLam_isAdmissible {lam : ℝ} (hlam : 0 < lam) {delta : ℝ}
    {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) :
    IsAdmissible lam (cutoffTestLam lam psi) := by
  have hAlam : 0 < cutoffNormaliserLam lam psi := by
    rw [cutoffNormaliserLam_covariance hlam psi]
    exact mul_pos (mul_pos two_pos hlam) hA
  have hInt : Integrable (fun x : ℝ =>
      dilateTo lam psi x ^ 2 * extremalLam lam x / cutoffNormaliserLam lam psi) :=
    (integrable_cutoffWeightLam hlam hpsi).div_const _
  refine ⟨?_, ?_, ?_, ?_⟩
  · refine (memLp_two_iff_integrable_sq ?_).2 ?_
    · apply Measurable.aestronglyMeasurable
      have hDiv : Continuous fun x : ℝ => x / (2 * lam) := by continuity
      unfold cutoffTestLam dilateTo extremalLam
      exact (((hpsi.smooth.continuous.comp hDiv).measurable).mul
        (Real.continuous_sqrt.measurable.comp
          (extremalTest_measurable.comp hDiv.measurable))).div_const _
    · refine hInt.congr ?_
      filter_upwards with x
      exact (cutoffTestLamSq_eq' hlam hpsi hA x).symm
  · intro x
    have hρ : 0 < 2 * lam := mul_pos two_pos hlam
    unfold cutoffTestLam dilateTo extremalLam dilateTo
    rw [neg_div, hpsi.even (x / (2 * lam)),
      extremalTest_even (x / (2 * lam))]
  · intro x hx
    exact cutoffTestLam_eq_zero_of_lam_le_abs hlam hpsi x hx
  · have hexp : ∀ x : ℝ, Complex.exp
        (-(2 * (Real.pi : ℂ)) * Complex.I * (0:ℂ) * (x : ℂ)) = 1 := by
      intro x
      rw [show -(2 * (Real.pi : ℂ)) * Complex.I * (0:ℂ) * (x : ℂ) = 0 by ring,
        Complex.exp_zero]
    unfold fourierC
    have hstep : (∫ u : ℝ, (((cutoffTestLam lam psi ^ 2) u : ℝ) : ℂ)
          * Complex.exp (-(2 * (Real.pi : ℂ)) * Complex.I * (0:ℂ) * (u : ℂ)))
        = (((∫ x : ℝ, dilateTo lam psi x ^ 2 * extremalLam lam x
            / cutoffNormaliserLam lam psi : ℝ)) : ℂ) := by
      rw [← integral_complex_ofReal]
      apply integral_congr_ae
      filter_upwards with x
      rw [hexp x, mul_one]
      exact congrArg (fun r : ℝ => ((r : ℂ)))
        (cutoffTestLamSq_eq' hlam hpsi hA x)
    have hpc : ∀ x : ℝ, dilateTo lam psi x ^ 2 * extremalLam lam x
        / cutoffNormaliserLam lam psi
        = (cutoffNormaliserLam lam psi)⁻¹
            * (dilateTo lam psi x ^ 2 * extremalLam lam x) := by
      intro x
      rw [div_eq_inv_mul]
    have hmul : (∫ a : ℝ, (cutoffNormaliserLam lam psi)⁻¹
          * (dilateTo lam psi a ^ 2 * extremalLam lam a))
        = (cutoffNormaliserLam lam psi)⁻¹
            * (∫ a : ℝ, dilateTo lam psi a ^ 2 * extremalLam lam a) :=
      integral_smul (cutoffNormaliserLam lam psi)⁻¹
        (fun a => dilateTo lam psi a ^ 2 * extremalLam lam a)
    rw [hstep, integral_congr_ae (by
        filter_upwards with x
        exact hpc x), hmul]
    show (((cutoffNormaliserLam lam psi)⁻¹
      * cutoffNormaliserLam lam psi : ℝ) : ℂ) = (1:ℂ)
    rw [inv_mul_cancel₀ (ne_of_gt hAlam)]
    exact Complex.ofReal_one

/-- **(C)** `IsPairTestFunction Q_λ` — port of the private
`cutoffSelfConv_isPairTestFunction` (Kernel.lean:481), transported via lemma A +
the donor's PUBLIC frozen layer. -/
theorem cutoffSelfConvLam_isPairTestFunction {lam : ℝ} (hlam : 0 < lam)
    (hle : lam ≤ 1 / 2) {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) :
    IsPairTestFunction (cutoffSelfConvLam lam psi) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hρ1 : 2 * lam ≤ 1 := by linarith
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  -- evenness
  have heven : ∀ x, cutoffSelfConvLam lam psi (-x) = cutoffSelfConvLam lam psi x := by
    intro x
    rw [hQ, Pi.smul_apply, Pi.smul_apply, dilateTo, dilateTo, neg_div,
      cutoffSelfConv_neg hpsi]
  -- continuity + compact support of the dilated frozen Q (public inputs)
  have hDiv : Continuous fun x : ℝ => x / (2 * lam) := by continuity
  have hQc : Continuous (dilateTo lam (cutoffSelfConv psi)) :=
    (contDiff_cutoffSelfConv hpsi).continuous.comp hDiv
  have hQdilzero : ∀ x : ℝ, 1 ≤ |x| → dilateTo lam (cutoffSelfConv psi) x = 0 := by
    intro x hx
    have harg : 1 ≤ |x / (2 * lam)| := by
      have h1 : |x / (2 * lam)| = |x| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      exact (le_div_iff₀ hρ).mpr (by linarith)
    unfold dilateTo
    rw [cutoffSelfConv_eq_zero_of_one_le_abs hpsi harg]
  have hQsupp : HasCompactSupport (dilateTo lam (cutoffSelfConv psi)) := by
    refine HasCompactSupport.of_support_subset_isCompact
      (K := Set.Icc (-(1:ℝ)) 1) isCompact_Icc ?_
    intro x hx
    by_contra hmem
    have habs : 1 ≤ |x| := by
      by_contra hc
      have h1 : |x| < 1 := by linarith
      have h2 := abs_lt.mp h1
      exact hmem (Set.mem_Icc.mpr ⟨le_of_lt h2.1, le_of_lt h2.2⟩)
    exact absurd (hQdilzero x habs) hx
  -- the strict-margin ε-window from the frozen public exists-lemma
  obtain ⟨eps0, heps0, hzero0⟩ := exists_cutoffSelfConv_eq_zero_of_one_sub_le_abs hpsi
  have heps1 : min eps0 (1 / 2) < 1 := by
    have := min_le_right eps0 (1 / 2)
    linarith
  have hmpos : 0 < min eps0 (1 / 2) := lt_min heps0 (by norm_num)
  have hc1 : 2 * lam * (1 - min eps0 (1 / 2)) < 1 := by
    have h1 : 2 * lam * (1 - min eps0 (1 / 2)) ≤ 1 - min eps0 (1 / 2) := by
      calc 2 * lam * (1 - min eps0 (1 / 2)) ≤ 1 * (1 - min eps0 (1 / 2)) :=
            mul_le_mul_of_nonneg_right hρ1 (sub_nonneg.mpr (by linarith))
        _ = 1 - min eps0 (1 / 2) := by ring
    have h2 : 1 - min eps0 (1 / 2) < 1 := by linarith
    linarith
  have hcpos : 0 < 2 * lam * (1 - min eps0 (1 / 2)) :=
    mul_pos hρ (sub_pos.mpr (by linarith))
  have hzero : ∀ y : ℝ, 2 * lam * (1 - min eps0 (1 / 2)) ≤ |y| →
      dilateTo lam (cutoffSelfConv psi) y = 0 := by
    intro y hy
    have harg : 1 - eps0 ≤ |y / (2 * lam)| := by
      have h1 : |y / (2 * lam)| = |y| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      refine (le_div_iff₀ hρ).mpr ?_
      have h2 : (1 - eps0) * (2 * lam) ≤ (1 - min eps0 (1 / 2)) * (2 * lam) := by
        apply mul_le_mul_of_nonneg_right _ (le_of_lt hρ)
        have := min_le_left eps0 (1 / 2)
        linarith
      have h3 : (1 - min eps0 (1 / 2)) * (2 * lam)
          = 2 * lam * (1 - min eps0 (1 / 2)) := by ring
      have h4 : 2 * lam * (1 - min eps0 (1 / 2)) ≤ |y| := hy
      linarith
    unfold dilateTo
    exact hzero0 _ harg
  refine ⟨heven, ?_, ?_, ?_⟩
  · rw [hQ]
    exact (hQc.integrable_of_hasCompactSupport hQsupp).const_mul _
  · refine ⟨1 - 2 * lam * (1 - min eps0 (1 / 2)), by linarith, by linarith, ?_⟩
    intro x hx
    rw [hQ, Pi.smul_apply, hzero x (by linarith), smul_eq_mul, mul_zero]
    -- ε-window arithmetic discharged by hc1/hcpos (hoisted)
  · obtain ⟨C, hC⟩ := (contDiff_cutoffSelfConv hpsi).lipschitzWith_of_hasCompactSupport
      (hasCompactSupport_cutoffSelfConv hpsi) (by simp)
    refine ⟨C / (2 * lam) / (2 * lam), fun x => ?_⟩
    have hlip := hC.norm_sub_le (x / (2 * lam)) 0
    simp only [Real.norm_eq_abs, sub_zero] at hlip
    rw [hQ, Pi.smul_apply, Pi.smul_apply, dilateTo, dilateTo, zero_div,
      smul_eq_mul, smul_eq_mul]
    have hring : (2 * lam)⁻¹ * cutoffSelfConv psi (x / (2 * lam))
        - (2 * lam)⁻¹ * cutoffSelfConv psi 0
        = (2 * lam)⁻¹ * (cutoffSelfConv psi (x / (2 * lam))
            - cutoffSelfConv psi 0) := by ring
    rw [hring]
    have hnn : 0 ≤ (2 * lam)⁻¹ := by positivity
    have habsx : |x / (2 * lam)| = |x| / (2 * lam) := by
      rw [abs_div, abs_of_pos hρ]
    calc |(2 * lam)⁻¹ * (cutoffSelfConv psi (x / (2 * lam))
          - cutoffSelfConv psi 0)|
        = (2 * lam)⁻¹ * |cutoffSelfConv psi (x / (2 * lam))
          - cutoffSelfConv psi 0| := by
          rw [abs_mul, abs_of_nonneg hnn]
      _ ≤ (2 * lam)⁻¹ * (C * |x / (2 * lam)|) :=
          mul_le_mul_of_nonneg_left hlip hnn
      _ = C / (2 * lam) / (2 * lam) * |x| := by
          rw [habsx]
          field_simp

/-- **(D)** `IsPairTestFunction Q_λ''` — port of the private
`iteratedDeriv_two_cutoffSelfConv_isPairTestFunction` (Kernel.lean:496), via (A)
for the vanishing regions, the frozen public margin lemmas, and
`ContDiff.iterate_deriv` for smoothness. -/
theorem iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction {lam : ℝ}
    (hlam : 0 < lam) (hle : lam ≤ 1 / 2) {delta : ℝ} {psi : ℝ → ℝ}
    (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) :
    IsPairTestFunction (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hρ1 : 2 * lam ≤ 1 := by linarith
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  have heven : ∀ x, cutoffSelfConvLam lam psi (-x) = cutoffSelfConvLam lam psi x := by
    intro x
    rw [hQ, Pi.smul_apply, Pi.smul_apply, dilateTo, dilateTo, neg_div,
      cutoffSelfConv_neg hpsi]
  -- smoothness of Q_λ and of its second iterate-derivative
  have hQlamcd : ContDiff ℝ (⊤ : ℕ∞) (cutoffSelfConvLam lam psi) := by
    rw [hQ]
    exact contDiff_const.mul
      ((contDiff_cutoffSelfConv hpsi).comp (contDiff_id.div_const _))
  have h2cd : ContDiff ℝ (⊤ : ℕ∞) (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) := by
    rw [iteratedDeriv_eq_iterate]
    exact ContDiff.iterate_deriv 2 hQlamcd
  -- Q_λ vanishes on the closed window |x| ≥ 2λ
  have hQlamzero1 : ∀ y : ℝ, 2 * lam ≤ |y| → cutoffSelfConvLam lam psi y = 0 := by
    intro y hy
    rw [hQ, Pi.smul_apply, dilateTo]
    have harg : 1 ≤ |y / (2 * lam)| := by
      have h1 : |y / (2 * lam)| = |y| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      exact (le_div_iff₀ hρ).mpr (by linarith)
    rw [cutoffSelfConv_eq_zero_of_one_le_abs hpsi harg]
    simp
  -- the strict-margin ε-window (frozen public exists-lemma, min-trick)
  obtain ⟨eps0, heps0, hzero0⟩ := exists_cutoffSelfConv_eq_zero_of_one_sub_le_abs hpsi
  have hm1 : min eps0 (1 / 2) < 1 := by
    have := min_le_right eps0 (1 / 2)
    linarith
  have hmpos : 0 < min eps0 (1 / 2) := lt_min heps0 (by norm_num)
  have hc1 : 2 * lam * (1 - min eps0 (1 / 2)) < 1 := by
    have h2 : 2 * lam * (1 - min eps0 (1 / 2)) ≤ 1 - min eps0 (1 / 2) := by
      calc 2 * lam * (1 - min eps0 (1 / 2)) ≤ 1 * (1 - min eps0 (1 / 2)) :=
            mul_le_mul_of_nonneg_right hρ1 (sub_nonneg.mpr (by linarith))
        _ = 1 - min eps0 (1 / 2) := by ring
    have h3 : 1 - min eps0 (1 / 2) < 1 := by linarith
    linarith
  have hcpos : 0 < 2 * lam * (1 - min eps0 (1 / 2)) :=
    mul_pos hρ (sub_pos.mpr (by linarith))
  -- Q_λ vanishes on the closed window 2λ·(1−min eps0 (1 / 2)) ≤ |y|
  have hQlamzero2 : ∀ y : ℝ, 2 * lam * (1 - min eps0 (1 / 2)) ≤ |y| →
      cutoffSelfConvLam lam psi y = 0 := by
    intro y hy
    rw [hQ, Pi.smul_apply, dilateTo]
    have harg : 1 - eps0 ≤ |y / (2 * lam)| := by
      have h1 : |y / (2 * lam)| = |y| / (2 * lam) := by
        rw [abs_div, abs_of_pos hρ]
      rw [h1]
      refine (le_div_iff₀ hρ).mpr ?_
      have h2 : (1 - eps0) * (2 * lam) ≤ (1 - min eps0 (1 / 2)) * (2 * lam) := by
        apply mul_le_mul_of_nonneg_right _ (le_of_lt hρ)
        have := min_le_left eps0 (1 / 2)
        linarith
      have h3 : (1 - min eps0 (1 / 2)) * (2 * lam)
          = 2 * lam * (1 - min eps0 (1 / 2)) := by ring
      have h4 : 2 * lam * (1 - min eps0 (1 / 2)) ≤ |y| := hy
      linarith
    rw [hzero0 _ harg]
    simp
  -- vanishing of Q_λ'' off the open window (EventuallyEq route, Kernel.lean:471 mirror)
  have h2zero_open : ∀ x : ℝ, 2 * lam * (1 - min eps0 (1 / 2)) < |x| →
      iteratedDeriv 2 (cutoffSelfConvLam lam psi) x = 0 := by
    intro x hx
    have hevent : cutoffSelfConvLam lam psi =ᶠ[nhds x] (0 : ℝ → ℝ) := by
      filter_upwards
        [(isOpen_lt continuous_const continuous_abs).eventually_mem hx] with y hy
      exact hQlamzero2 y (le_of_lt hy)
    rw [hevent.iteratedDeriv_eq 2]
    exact iteratedDeriv_const_zero
  have h2supp : HasCompactSupport (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) := by
    refine HasCompactSupport.of_support_subset_isCompact
      (K := Set.Icc (-(1:ℝ)) 1) isCompact_Icc ?_
    intro x hx
    by_contra hmem
    have habs : 1 < |x| := by
      by_contra hc
      have h1 : |x| ≤ 1 := by linarith
      have h2 := abs_le.mp h1
      exact hmem (Set.mem_Icc.mpr h2)
    have hlt : 2 * lam * (1 - min eps0 (1 / 2)) < |x| := by
      have h1 : 2 * lam * (1 - min eps0 (1 / 2)) ≤ 2 * lam := by
        apply mul_le_of_le_one_right (le_of_lt hρ) (by linarith)
      have h2 : 2 * lam ≤ 1 := hρ1
      have h3 : 1 < |x| := habs
      linarith
    exact absurd (h2zero_open x hlt) hx
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro x
    have hfun : (fun y : ℝ => cutoffSelfConvLam lam psi (-y)) = cutoffSelfConvLam lam psi :=
      funext heven
    have hcn := iteratedDeriv_comp_neg 2 (cutoffSelfConvLam lam psi) x
    rw [hfun] at hcn
    simpa using hcn.symm
  · exact h2cd.continuous.integrable_of_hasCompactSupport h2supp
  · refine ⟨(1 - 2 * lam * (1 - min eps0 (1 / 2))) / 2, ?_, ?_, ?_⟩
    · have h1 : 2 * lam * (1 - min eps0 (1 / 2)) < 1 := hc1
      linarith
    · have h1 : 0 < 1 - 2 * lam * (1 - min eps0 (1 / 2)) := by linarith
      linarith
    · intro x hx
      have hcpos : 0 < 2 * lam * (1 - min eps0 (1 / 2)) := by
        apply mul_pos hρ (by
          have := hm1
          linarith)
      have hkey : (1 + 2 * lam * (1 - min eps0 (1 / 2))) / 2 ≤ |x| := by
        have h3 : 1 - (1 - 2 * lam * (1 - min eps0 (1 / 2))) / 2
            = (1 + 2 * lam * (1 - min eps0 (1 / 2))) / 2 := by ring
        linarith
      exact h2zero_open x (by linarith)
  · obtain ⟨C, hC⟩ := h2cd.lipschitzWith_of_hasCompactSupport h2supp (by simp)
    refine ⟨C, fun x => ?_⟩
    simpa only [Real.norm_eq_abs, sub_zero] using hC.norm_sub_le x 0

/-! ### The R7 bridge proper -/

/-- `scaledConstLam` — VERBATIM from eta-pin-probe.lean:144 (the bridge's limit
constant = `pairMainTerm` of the scaled self-convolution). -/
noncomputable def scaledConstLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ :=
  pairMainTerm (cutoffSelfConvLam lam psi)

/-- `KSAsymptotic`, carried VERBATIM from P1.lean:54 (the ONE P1 binder;
self-contained-convention carry — the discharge target). -/
def KSAsymptotic (lam c : ℝ) : Prop :=
  ∃ eta : ℝ → ℝ,
    IsAdmissible lam eta ∧
      Filter.Tendsto (fun T => (unweightedKernelSum eta T).re / zeroScale T)
        Filter.atTop (nhds c)

/-- The projection identity (junk-safe, all real s): the real part of a quotient
by a coerced real is the quotient of real parts. (Run-1 fix: the pin's lemma is
`Complex.ofReal_im` — the TwoDim.lean:451 idiom; `Complex.im_ofReal` has drifted
out.) -/
private theorem complex_div_re_ofReal (z : ℂ) (s : ℝ) :
    (z / ((s : ℝ) : ℂ)).re = z.re / s := by
  rw [div_eq_mul_inv, div_eq_mul_inv, ← Complex.ofReal_inv, Complex.mul_re,
    Complex.ofReal_im, Complex.ofReal_re, mul_zero, sub_zero]

set_option maxHeartbeats 1000000 in
/-- **(R7-a) The bridge, complex form** — the donor's
`unweightedKernelSum_cutoffTest_tendsto` (Zeta/Kernel.lean:600) AT THE SCALED
FAMILY: the normalized unweighted cutoff-kernel sum converges to the
pair-correlation functional of the scaled self-convolution. Proof = the donor's
skeleton verbatim (the PUBLIC `PairCorrelation.tendsto` at the rung-2 instances
(B)/(C)+(D) + the R6-4 identity + log-growth + `field_simp`). -/
theorem unweightedKernelSum_cutoffTestLam_tendsto {lam : ℝ} (hlam : 0 < lam)
    (hle : lam ≤ 1 / 2) {delta : ℝ} (hd : 0 < delta) (hd4 : delta < 1 / 4)
    {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) :
    Filter.Tendsto
      (fun T => unweightedKernelSum (cutoffTestLam lam psi) T
        / ((zeroScale T : ℝ) : ℂ))
      Filter.atTop (nhds ((pairMainTerm (cutoffSelfConvLam lam psi) : ℝ) : ℂ)) := by
  have hQ := PairCorrelation.tendsto
    (cutoffSelfConvLam_isPairTestFunction hlam hle hpsi hA)
  have hQ2 := PairCorrelation.tendsto
    (iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction hlam hle hpsi hA)
  have hlog_sq : Filter.Tendsto (fun T : ℝ => Real.log T ^ 2)
      Filter.atTop Filter.atTop :=
    (Filter.tendsto_pow_atTop (α := ℝ) (n := 2) (by norm_num)).comp
      Real.tendsto_log_atTop
  have hden : Filter.Tendsto (fun T : ℝ => 4 * Real.log T ^ 2)
      Filter.atTop Filter.atTop :=
    hlog_sq.const_mul_atTop' (by norm_num)
  have hinv_real : Filter.Tendsto (fun T : ℝ => (4 * Real.log T ^ 2)⁻¹)
      Filter.atTop (nhds 0) :=
    tendsto_inv_atTop_zero.comp hden
  have hinv_complex : Filter.Tendsto
      (fun T : ℝ => ((((4 * Real.log T ^ 2 : ℝ) : ℂ)))⁻¹)
      Filter.atTop (nhds 0) := by
    convert (Complex.continuous_ofReal.tendsto 0).comp hinv_real using 1
    · funext T
      exact (Complex.ofReal_inv _).symm
  have hQ2_small : Filter.Tendsto
      (fun T =>
        (pairCorrelationSum (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) T /
          ((zeroScale T : ℝ) : ℂ)) / (((4 * Real.log T ^ 2 : ℝ) : ℂ)))
      Filter.atTop (nhds 0) := by
    simpa only [div_eq_mul_inv, mul_zero] using hQ2.mul hinv_complex
  have hdiff : Filter.Tendsto
      (fun T =>
        pairCorrelationSum (cutoffSelfConvLam lam psi) T / ((zeroScale T : ℝ) : ℂ) -
          (pairCorrelationSum (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) T /
            ((zeroScale T : ℝ) : ℂ)) / (((4 * Real.log T ^ 2 : ℝ) : ℂ)))
      Filter.atTop (nhds ((pairMainTerm (cutoffSelfConvLam lam psi) : ℝ) : ℂ)) := by
    simpa only [sub_zero] using hQ.sub hQ2_small
  apply hdiff.congr'
  filter_upwards [Filter.eventually_gt_atTop (1 : ℝ)] with T hT
  rw [unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum hlam hle hd hd4 hpsi hA hT]
  have hlog : Real.log T ≠ 0 := ne_of_gt (Real.log_pos hT)
  have hdenR : (4 * Real.log T ^ 2 : ℝ) ≠ 0 :=
    mul_ne_zero (by norm_num) (pow_ne_zero 2 hlog)
  have hdenC : (((4 * Real.log T ^ 2 : ℝ) : ℂ)) ≠ 0 := by
    exact_mod_cast hdenR
  have hscaleR : zeroScale T ≠ 0 := by
    unfold zeroScale
    exact mul_ne_zero
      (div_ne_zero (ne_of_gt (lt_trans zero_lt_one hT))
        (mul_ne_zero (by norm_num) Real.pi_ne_zero)) hlog
  have hscaleC : ((zeroScale T : ℝ) : ℂ) ≠ 0 := by
    exact_mod_cast hscaleR
  field_simp [hdenC, hscaleC]

/-- **(R7-b) The scaled bridge** — the probe's `ScaledBridge` prop
(eta-pin-probe.lean:159): the `.re / zeroScale` projection of R7-a in
`KSAsymptotic`'s normalization, at `scaledConstLam`. -/
theorem scaledBridge {lam : ℝ} (hlam : 0 < lam) (hle : lam ≤ 1 / 2)
    {delta : ℝ} (hd : 0 < delta) (hd4 : delta < 1 / 4) {psi : ℝ → ℝ}
    (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) :
    Filter.Tendsto (fun T => (unweightedKernelSum (cutoffTestLam lam psi) T).re
      / zeroScale T) Filter.atTop (nhds (scaledConstLam lam psi)) := by
  have hcomplex := unweightedKernelSum_cutoffTestLam_tendsto hlam hle hd hd4 hpsi hA
  have hmap : Filter.Tendsto
      (fun T => (unweightedKernelSum (cutoffTestLam lam psi) T
        / ((zeroScale T : ℝ) : ℂ)).re)
      Filter.atTop (nhds (scaledConstLam lam psi)) := by
    -- run-1 fix: type-ascribe the comp (the ∘-display vs lambda goal), then simpa
    have hc := Complex.continuous_re.tendsto (((scaledConstLam lam psi : ℝ) : ℂ))
    have hc2 : Filter.Tendsto
        (fun T => (unweightedKernelSum (cutoffTestLam lam psi) T
          / ((zeroScale T : ℝ) : ℂ)).re)
        Filter.atTop (nhds (((scaledConstLam lam psi : ℝ) : ℂ).re)) :=
      hc.comp hcomplex
    simpa [Complex.ofReal_re] using hc2
  refine hmap.congr' ?_
  filter_upwards with T
  exact complex_div_re_ofReal _ _

/-- **(R7-c) The discharge glue** — the probe's `discharge_of_scaledBridge`
(eta-pin-probe.lean:165) with BOTH binders supplied at the concrete scaled
family: `KSAsymptotic lam (scaledConstLam lam psi)` for every cutoff ψ on the
honest domain `0 < lam ≤ 1/2`, `delta < 1/4`. -/
theorem KSAsymptotic_of_scaled {lam : ℝ} (hlam : 0 < lam) (hle : lam ≤ 1 / 2)
    {delta : ℝ} (hd : 0 < delta) (hd4 : delta < 1 / 4) {psi : ℝ → ℝ}
    (hpsi : IsCutoff delta psi) (hA : 0 < cutoffNormaliser psi) :
    KSAsymptotic lam (scaledConstLam lam psi) :=
  ⟨cutoffTestLam lam psi,
    cutoffTestLam_isAdmissible hlam hpsi hA,
    scaledBridge hlam hle hd hd4 hpsi hA⟩

/-! ## R7 triad gate -/

#print axioms ZZLam.EtaPort.cutoffTestLam_isAdmissible
#print axioms ZZLam.EtaPort.cutoffSelfConvLam_isPairTestFunction
#print axioms ZZLam.EtaPort.iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction
#print axioms ZZLam.EtaPort.unweightedKernelSum_cutoffTestLam_tendsto
#print axioms ZZLam.EtaPort.scaledBridge
#print axioms ZZLam.EtaPort.KSAsymptotic_of_scaled

end ZZLam.EtaPort
