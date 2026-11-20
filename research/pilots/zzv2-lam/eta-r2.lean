/-
Pilot ZZV2-λ η-port — RUNG R2 (admissibility + pair-test tier), PROOF ARTIFACT
(lane R5, A3 lineage; fired 2026-11-19 per eta-port-plan.md §R2, on R1 GREEN).

SORRY-STRICT: zero `sorry` by construction. Elaborated INSIDE the built
ZetaZerosV2 tree on-pin (mathlib ff2494ea, toolchain v4.36.0-rc2).

Billing: technical record per DECISION-2 = Option A (record-billed, quota-free;
a6-iter5-charter-draft.md §6 row 2) — pure infrastructure, never discovery-phrased;
informal λ-dependence is Lamzouri's (must-cite: Lamzouri arXiv:2609.02882,
Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

R2 content (plan §R2):
  (B) cutoffTestLam_isAdmissible — `IsAdmissible lam (cutoffTestLam lam psi)`:
      port of the donor's PRIVATE `cutoffTest_isAdmissible` (Zeta/Kernel.lean:237,
      window 1/2) at the scaled family and its own window `lam`.
  (A) cutoffSelfConvLam_eq_scaled_dilate — the CORRECTED convolution covariance
      (see the FINDING below): `Q_λ = (2λ)⁻¹ • dilateTo lam Q` — the transport
      engine for the pair-test tier.
  (C) cutoffSelfConvLam_isPairTestFunction — `IsPairTestFunction Q_λ` (port of the
      private `cutoffSelfConv_isPairTestFunction`, Kernel.lean:481).
  (D) iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction — `IsPairTestFunction
      Q_λ''` (port of the private `iteratedDeriv_two_...`, Kernel.lean:496).

FINDING (session 2026-11-19, recorded; reshapes R3/R4 statements + the R8
improvement domain): the probe's stmt_cutoffSelfConvLam_eq_dilate
(`Q_λ = dilateTo lam Q`) and stmt_scaledConstLam_covariance (`c_λ = ρ²c₀ +
(1−ρ²)Q(0)`, ρ = 2λ) are FALSE as stated. Direct computation (kernel-checked
below as lemma A): cutoffTestLam² = (A_ψ/A_{ψ,λ})·(cutoffTestSq ∘ (·/ρ)) with
A_ψ/A_{ψ,λ} = 1/ρ, so Q_λ = a⁴·ρ·Q∘(·/ρ) = (1/ρ)·dilateTo lam Q (the probe's
"a²·ρ = 1" bookkeeping missed that the square enters twice). Consequences:
  * corrected (iii): pairMainTerm Q_λ = ρ·c₀ + (1/ρ − ρ)·Q(0) (at supp Q ⊆ [−1,1],
    ρ ≤ 1) — to be kernel-checked at R3/R4 with the corrected factor;
  * the strict-improvement corollary's honest domain becomes ρ ∈ (Q0/c₀, 1]
    (scaledConst_λ < c₀ ⟺ ρ > Q(0)/c₀) — a threshold, not all ρ ∈ (0,1);
    R8's statement must carry the threshold antecedent.
The probe file is an elaboration-only artifact (never a proof claim), so this is a
plan-level amendment, recorded here + in eta-r2-record.md; the TRUE forms are what
this rung and R3+ prove.

PUBLIC-layer discovery (this session): the donor's frozen-family facts are PUBLIC
in Zeta/Basic.lean and Zeta/CutoffSelfConv.lean (extremalTest_even/pos/measurable,
cutoffSelfConv_neg/eq_zero, contDiff/hasCompactSupport_cutoffSelfConv,
exists_cutoffSelfConv_eq_zero_of_one_sub_le_abs, exists_iteratedDeriv_two_…,
iteratedDeriv_two_cutoffSelfConv_neg/eq_zero, contDiff_iteratedDeriv_two_…) — the
Kernel.lean privates are private DUPLICATES. The pair-test tier therefore TRANSPORTS
from the frozen family via lemma A + these publics instead of re-proving the chain
at the scaled family (the private-copy set for R2 shrinks to ONE local mirror:
integrable_cutoffWeightLam, marked below).

Carried from eta-r1.lean (GREEN @ 5b04304a53a5b849, self-contained convention):
integral_comp_dilateTo, cutoffNormaliserLam_covariance, cutoffTestLam_eq_dilate,
plus the scaled-family defs (VERBATIM from eta-pin-probe.lean).

Donor citations (read-only sibling): IsAdmissible + fourierC (Definitions.lean:92/
:74); cutoffTest/cutoffTestSq/cutoffSelfConv (Zeta/Defs.lean:111/:115/:120);
IsPairTestFunction (Zeta/Inputs.lean:40); the public frozen layer
(Zeta/Basic.lean:39/:123/:139/:147/:155/:161/:171/:207/:218/:232/:239/:258/:265/:279,
Zeta/CutoffSelfConv.lean:60/:71, MontgomeryTaylor/TestFunction.lean:25/:103);
the private originals this rung ports (Zeta/Kernel.lean:204/:237/:481/:496 —
P1 private-copy precedent: local re-proof, cited, never transported-by-invocation).

Runner: research/pilots/zzv2-lam/run_zzv2.sh eta-r2.lean (app
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

/-! ## R2 (B): admissibility of the scaled family -/

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
scaled family; hypotheses `0 < lam`, `IsCutoff delta psi`, `0 < A_ψ` (the
delta-bound discharge of `0 < A_ψ` is the donor's private `cutoffNormaliser_pos`,
not needed under this orientation). -/
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

/-! ## R2 (C)+(D): the pair-test tier (transport via (A) + the donor's PUBLIC
frozen layer) -/

/-- **(C)** `IsPairTestFunction Q_λ` — port of the private
`cutoffSelfConv_isPairTestFunction` (Kernel.lean:481), transported via (A). -/
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

/-! ## Triad gate -/

#print axioms ZZLam.EtaPort.cutoffSelfConvLam_eq_scaled_dilate
#print axioms ZZLam.EtaPort.cutoffTestLam_isAdmissible
#print axioms ZZLam.EtaPort.cutoffSelfConvLam_isPairTestFunction
#print axioms ZZLam.EtaPort.iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction

end ZZLam.EtaPort
