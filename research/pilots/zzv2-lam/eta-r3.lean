/-
Pilot ZZV2-λ η-port — RUNG R3 (corrected functional covariance + the λ = 1/2
functional regression), PROOF ARTIFACT (lane R5, A3 lineage; fired 2026-11-19 per
eta-port-plan.md §R3 AS AMENDED by the (ii-c)/(iii) FINDING, on R2 GREEN).

SORRY-STRICT: zero `sorry` by construction. Elaborated INSIDE the built
ZetaZerosV2 tree on-pin (mathlib ff2494ea, toolchain v4.36.0-rc2).

Billing: technical record per DECISION-2 = Option A (record-billed, quota-free) —
pure infrastructure, never discovery-phrased; informal λ-dependence is
Lamzouri's (must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB
2024 Lemma 5).

R3 content (the CORRECTED forms govern — eta-r2-record.md §FINDING):
  (iii-corrected) pairMainTerm_cutoffSelfConvLam — `pairMainTerm Q_λ = ρ·c₀ +
    (ρ⁻¹ − ρ)·Q(0)` with ρ = 2λ (NOT the precharter's ρ²c₀ + (1−ρ²)Q(0), which is
    FALSE — the probe's "a²·ρ = 1" bookkeeping missed that the squared
    normalisation enters the convolution integrand twice; kernel-checked basis:
    R2's cutoffSelfConvLam_eq_scaled_dilate, carried below VERBATIM).
  (λ½-functional) scaledConstLam_half — `scaledConstLam (1/2) psi = pairMainTerm
    (cutoffSelfConv psi)` bit-for-bit (ρ = 1 collapses the corrected form to c₀);
    the R3 functional-level anchor of the regression-first discipline (the
    test-function-level anchors landed GREEN at R1).

Proof engine: the interval-integral substitution `intervalIntegral.
integral_comp_div` (Mathlib/MeasureTheory/Integral/IntervalIntegral/Basic.lean:949
at the pin), window non-truncation via the PUBLIC `cutoffSelfConv_eq_zero_of_
one_le_abs` (Zeta/Basic.lean:218) + `integral_add_adjacent_intervals` (:1100),
integrands pointwise via field_simp; the frozen Q's continuity/interval-
integrability from the PUBLIC `contDiff_cutoffSelfConv` (Zeta/Basic.lean:207).

Carried VERBATIM from eta-r2.lean @ b52111c7240a6d69 (fix-batch-4;
self-contained convention — this file re-elaborates the carries): the scaled
family defs (from eta-pin-probe.lean), R1's integral_comp_dilateTo /
cutoffNormaliserLam_covariance / cutoffTestLam_eq_dilate, R2's
cutoffTestLamSq_eq / cutoffSelfConvLam_eq_scaled_dilate (lemma A, the corrected
(ii-c)). Plus scaledConstLam (def carried VERBATIM from eta-pin-probe.lean).

Runner: research/pilots/zzv2-lam/run_zzv2.sh eta-r3.lean (app
crossmath-pilot-zzv2-lam, doz CLI, SPEC 2cpu/4GB, LEAN_NUM_THREADS=2, taskset);
sorry-strict verdict branch.
-/

import ZetaZeros
import Mathlib.MeasureTheory.Measure.Haar.NormedSpace

namespace ZZLam.EtaPort

open ZetaZeros Filter Topology MeasureTheory

/-! ## Carried defs (VERBATIM from eta-pin-probe.lean) -/

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

/-! ## Carried R1 results (VERBATIM from eta-r1.lean, GREEN @ 5b04304a53a5b849) -/

/-- Whole-line dilation substitution (R1 helper; mathlib
`MeasureTheory.Measure.integral_comp_mul_left` at the pin; junk-value-safe). -/
private theorem integral_comp_dilateTo {E : Type*} [NormedAddCommGroup E]
    [NormedSpace ℝ E] (G : ℝ → E) {lam : ℝ} (hlam : 0 < lam) :
    ∫ x : ℝ, G (x / (2 * lam)) = (2 * lam) • ∫ y : ℝ, G y := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have h := MeasureTheory.Measure.integral_comp_mul_left (g := G) (a := (2 * lam)⁻¹)
  rw [inv_inv, abs_of_pos hρ] at h
  rw [← h]
  exact integral_congr_ae (by
    filter_upwards with x
    rw [div_eq_mul_inv, mul_comm x ((2 * lam)⁻¹)])

/-- (R1 ii-a) `A_{ψ,λ} = 2λ · A_ψ`; only `0 < lam` needed. -/
theorem cutoffNormaliserLam_covariance {lam : ℝ} (hlam : 0 < lam) (psi : ℝ → ℝ) :
    cutoffNormaliserLam lam psi = 2 * lam * cutoffNormaliser psi := by
  have key := integral_comp_dilateTo (lam := lam) hlam
    (G := fun y : ℝ => psi y ^ 2 * extremalTest y)
  rw [smul_eq_mul] at key
  unfold cutoffNormaliserLam cutoffNormaliser extremalLam dilateTo
  exact key

/-- (R1 ii-b) `cutoffTestLam lam psi = √(A_ψ/A_{ψ,λ}) · dilateTo lam (cutoffTest psi)`
(unfold order: extremalLam BEFORE dilateTo — the R1 run-2 fix). -/
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

/-! ## R2 (A): the corrected convolution covariance (the FINDING's theorem) -/

/-- Pointwise square relation (from R1 ii-b); feeds lemma A. Stated in the
APPLIED form (no `cutoffTestSq` — its Pi-power defeq was the run-2 whnf-timeout
source at :160). -/
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
/-- **(A) The corrected convolution covariance** (the FINDING's theorem; see the
header): `Q_λ = (2λ)⁻¹ • dilateTo lam (cutoffSelfConv psi)`. The probe's
stmt (ii-c) missed the `(2λ)⁻¹` factor; THIS is the true form, kernel-checked.
Fix-batch-6 (2026-11-20, run-5 re-fire decoding): the whnf-timeout PERSISTED at
this declaration because calc steps 1/4 still carried `cutoffTestSq`-form
integrands against `hint`'s applied form (the Pi-power defeq of
`Zeta/Defs.lean:115`). This version keeps EVERY integrand in applied form, routes
the dilation substitution through the standalone equation `hchange` (no
higher-order `rw`), and bridges the frozen convolution via a pointwise
`simp only [cutoffTestSq, Pi.pow_apply]` congr (the donor's own idiom,
RescaledZeros.lean:207). Heartbeat insurance 400000, elaboration budget only. -/
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


/-- The scaled asymptotic functional (carried VERBATIM from eta-pin-probe.lean;
with R3's corrected covariance its closed form is ρ·c₀ + (ρ⁻¹ − ρ)·Q(0)). -/
noncomputable def scaledConstLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ :=
  pairMainTerm (cutoffSelfConvLam lam psi)
/-! ## R3: the corrected functional covariance (iii′) -/

/-- **(iii′ CORRECTED)** The scaled closed form with the TRUE factor (the
FINDING's form; replaces the precharter §1.3(iii) statement, which is false as
stated): `pairMainTerm Q_λ = ρ·c₀ + (ρ⁻¹ − ρ)·Q(0)`, ρ = 2λ. The ρ ≤ 1 window
bound keeps the β-integration un-truncated (supp Q ⊆ [−1,1] via the PUBLIC
`cutoffSelfConv_eq_zero_of_one_le_abs`). -/
theorem pairMainTerm_cutoffSelfConvLam {lam : ℝ} (hlam : 0 < lam)
    (hle : lam ≤ 1 / 2) {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) :
    pairMainTerm (cutoffSelfConvLam lam psi)
      = (2 * lam) * pairMainTerm (cutoffSelfConv psi)
        + ((2 * lam)⁻¹ - 2 * lam) * cutoffSelfConv psi 0 := by
  have hρ : 0 < 2 * lam := mul_pos two_pos hlam
  have hn : (2 * lam : ℝ) ≠ 0 := ne_of_gt hρ
  have hρ1 : 2 * lam ≤ 1 := by linarith
  have hQ := cutoffSelfConvLam_eq_scaled_dilate hlam hA
  have hQ0 : cutoffSelfConvLam lam psi 0
      = (2 * lam)⁻¹ * cutoffSelfConv psi 0 := by
    rw [hQ, Pi.smul_apply, dilateTo, zero_div, smul_eq_mul]
  -- integrability of the frozen comparison integrand (public continuity)
  have hQcont : Continuous (cutoffSelfConv psi) := (contDiff_cutoffSelfConv hpsi).continuous
  have hcontI : Continuous fun u => u * cutoffSelfConv psi u := by continuity
  have hintI1 : IntervalIntegrable (fun u => u * cutoffSelfConv psi u) volume 0 1 :=
    hcontI.intervalIntegrable 0 1
  have hintI2 : IntervalIntegrable (fun u => u * cutoffSelfConv psi u) volume 1
      (1 / (2 * lam)) :=
    hcontI.intervalIntegrable 1 (1 / (2 * lam))
  -- the pointwise dilation identity for the integrand (α·Q_λ(α) = G(α/ρ))
  have hpt : ∀ α : ℝ, α * cutoffSelfConvLam lam psi α
      = (fun u => u * cutoffSelfConv psi u) (α / (2 * lam)) := by
    intro α
    rw [hQ, Pi.smul_apply, dilateTo, smul_eq_mul]
    field_simp <;> ring
  -- the interval substitution + window non-truncation
  have hwin : (1:ℝ) ≤ 1 / (2 * lam) := (one_le_div (by linarith)).mpr hρ1
  have htail : ∫ u in (1:ℝ)..1 / (2 * lam),
      (fun u => u * cutoffSelfConv psi u) u = 0 := by
    have hzero : Set.EqOn (fun u => u * cutoffSelfConv psi u) (fun _ => (0:ℝ))
        (Set.uIcc 1 (1 / (2 * lam))) := by
      intro u hu
      have hu1 : 1 ≤ u := by
        have h2 : u ∈ Set.Icc (1:ℝ) (1 / (2 * lam)) := by
          rw [Set.uIcc_of_le hwin] at hu
          exact hu
        exact h2.1
      have habs : 1 ≤ |u| := by
        rw [abs_of_nonneg (by linarith)]
        exact hu1
      show u * cutoffSelfConv psi u = (0:ℝ)
      rw [cutoffSelfConv_eq_zero_of_one_le_abs hpsi habs]
      ring
    rw [intervalIntegral.integral_congr hzero]
    simp
  have hint : ∫ α in (0:ℝ)..1, α * cutoffSelfConvLam lam psi α
      = (2 * lam) * ∫ α in (0:ℝ)..1, α * cutoffSelfConv psi α := by
    have h1 : ∫ α in (0:ℝ)..1, α * cutoffSelfConvLam lam psi α
        = ∫ α in (0:ℝ)..1,
            (fun u => u * cutoffSelfConv psi u) (α / (2 * lam)) :=
      intervalIntegral.integral_congr (fun α _ => hpt α)
    rw [h1, intervalIntegral.integral_comp_div
        (fun u => u * cutoffSelfConv psi u) hn, zero_div, smul_eq_mul,
      ← intervalIntegral.integral_add_adjacent_intervals hintI1 hintI2, htail]
    ring
  unfold pairMainTerm
  rw [hQ0, hint]
  ring

/-! ## R3: the λ = 1/2 functional regression (bit-for-bit anchor) -/

/-- λ = 1/2 regression, FUNCTIONAL level: `scaledConstLam (1/2) psi = pairMainTerm
(cutoffSelfConv psi)` — at ρ = 1 the corrected covariance collapses to c₀
bit-for-bit. With R1's test-function-level anchors, the regression-first
discipline is complete at rung 3. -/
theorem scaledConstLam_half {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi) :
    scaledConstLam (1 / 2) psi = pairMainTerm (cutoffSelfConv psi) := by
  have hhalf : (0:ℝ) < 1 / 2 := by norm_num
  unfold scaledConstLam
  rw [pairMainTerm_cutoffSelfConvLam hhalf (le_refl _) hpsi hA]
  norm_num

/-! ## Triad gate -/

#print axioms ZZLam.EtaPort.pairMainTerm_cutoffSelfConvLam
#print axioms ZZLam.EtaPort.scaledConstLam_half

end ZZLam.EtaPort
