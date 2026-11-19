/-
Pilot ZZV2-λ η-port — RUNG R1 (covariance base layer), PROOF ARTIFACT (lane R5, A3
lineage; fired 2026-11-19 per eta-port-plan.md R1, GREEN-gated on the η-pin-probe).

SORRY-STRICT: zero `sorry` by construction — every declaration below is proved.
Elaborated INSIDE the built ZetaZerosV2 tree on-pin (mathlib ff2494ea, v4.36.0-rc2).

Billing: technical record per DECISION-2 = Option A (record-billed, quota-free;
a6-iter5-charter-draft.md §6 row 2) — pure infrastructure, never discovery-phrased;
informal λ-dependence is Lamzouri's (must-cite: Lamzouri arXiv:2609.02882, Montgomery
ICF 1974, BGS-TB 2024 Lemma 5).

R1 content (plan §R1 + the λ=1/2 checkpoint discipline ordered first-able):
  (i)   fourierC_dilateTo — Fourier covariance along dilation (precharter §1.3(i));
  (ii-a) cutoffNormaliserLam_covariance — A_{ψ,λ} = 2λ·A_ψ (§1.3 ii-a);
  (ii-b) cutoffTestLam_eq_dilate — test-function covariance up to √(A_ψ/A_{ψ,λ});
  (λ½)  dilateTo_half / extremalLam_half / cutoffTestLam_half — the λ = 1/2
        bit-for-bit regression checkpoint at the test-function level (the R3
        functional-level regression's anchor, delivered at the earliest rung).

API CENSUS (the plan's flagged first task; verified statically against the exact
pin — encore-mathlib checkout @ ff2494ea5e438f8a8452db803068acd711fa0059):
  * Whole-line dilation substitution: `MeasureTheory.Measure.integral_comp_mul_left`
    (Mathlib/MeasureTheory/Measure/Haar/NormedSpace.lean:152) — hypothesis-free,
    junk-value-safe. Anchored below by #check (compile-time census evidence).
  * iteratedDeriv-under-dilation (R5's need): the donor's own idiom —
    `iteratedDeriv_eq_iterate` + `Function.iterate_succ_apply` +
    `ContDiff.iterate_deriv` + `HasCompactSupport.deriv`
    (Zeta/Kernel.lean:366±, fourierC_iteratedDeriv_two_cutoffSelfConv proof) — all
    present at the pin; the dilation composition rides `HasDerivAt.div_const` +
    `HasDerivAt.comp` (Mathlib/Analysis/Calculus/Deriv/Mul.lean:496).
    VERDICT: API PRESENT — no finding that reshapes the ladder.

Hypothesis notes (strengthenings vs the probe's statement defs, honest + recorded):
  * cutoffNormaliserLam_covariance and fourierC_dilateTo are proved with ONLY
    `0 < lam` (no `lam ≤ 1/2`, no IsCutoff, no integrability — the substitution
    lemma is junk-value-safe), i.e. STRONGER than the probe's stmt_* forms.
  * cutoffTestLam_eq_dilate takes `0 < cutoffNormaliser psi` (the probe's two
    `≠ 0` hypotheses, merged and oriented): the λ-side follows via the covariance;
    the strictly-positive form is what R2's normaliser-positivity port supplies.
    Downstream rungs consume these stronger forms.

Carried defs (self-contained-convention, VERBATIM from eta-pin-probe.lean — the
staged probe's scaled family; donor vocabulary cited in the probe header):
  dilateTo / extremalLam / cutoffNormaliserLam / cutoffTestLam.

Donor citations (read-only sibling axiommath/ZetaZerosV2/ZetaZeros/): fourierC
(Definitions.lean:74), extremalTest/cutoffNormaliser/cutoffTest (Zeta/Defs.lean:76/
:106/:111). NO donor private lemma is copied in R1 (none needed — the substitution
is mathlib's; R2+ re-prove the private chain per the P1 private-copy precedent).

Runner: research/pilots/zzv2-lam/run_zzv2.sh eta-r1.lean (app
crossmath-pilot-zzv2-lam, doz CLI, SPEC 2cpu/4GB, LEAN_NUM_THREADS=2, taskset).
File name carries no probe prefix ⇒ the runner's SORRY-STRICT verdict branch.
-/

import ZetaZeros
import Mathlib.MeasureTheory.Measure.Haar.NormedSpace

namespace ZZLam.EtaPort

open ZetaZeros Filter Topology MeasureTheory

/-! ## API census anchors (compile-time pin evidence; see header) -/

#check @MeasureTheory.Measure.integral_comp_mul_left
#check @iteratedDeriv_eq_iterate
#check @HasDerivAt.div_const

/-! ## The scaled family (carried VERBATIM from eta-pin-probe.lean) -/

/-- Coordinate dilation to the λ-window (ρ := 2λ). `noncomputable` marker added at
the pin-probe run-1 fix (2026-11-19): `lean.dependsOnNoncomputable` on the
ℝ-division — the P1-run2 friction class, mechanical fix only. -/
noncomputable def dilateTo (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => f (x / (2 * lam))

/-- The λ-scaled extremal base: `extremalTest` re-windowed from [−1/2, 1/2] to
[−λ, λ] (`Zeta/Defs.lean:76` dilated; for `lam = 1/2` literally `extremalTest`). -/
noncomputable def extremalLam (lam : ℝ) : ℝ → ℝ := dilateTo lam extremalTest

/-- The λ-scaled normaliser `A_{ψ,λ}` (`Zeta/Defs.lean:106` shape at the dilated
window; covariance: `A_{ψ,λ} = 2λ · A_ψ` — proved below). -/
noncomputable def cutoffNormaliserLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ :=
  ∫ x : ℝ, dilateTo lam psi x ^ 2 * extremalLam lam x

/-- The λ-scaled cutoff family: `cutoffTest` (`Zeta/Defs.lean:111`) at the dilated
base and window. -/
noncomputable def cutoffTestLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ → ℝ := fun x =>
  dilateTo lam psi x * Real.sqrt (extremalLam lam x)
    / Real.sqrt (cutoffNormaliserLam lam psi)

/-! ## The dilation substitution (local helper on mathlib
`MeasureTheory.Measure.integral_comp_mul_left`, Haar/NormedSpace.lean:152 at the
pin; junk-value-safe like its source) -/

/-- Whole-line dilation substitution: `∫ G (x / ρ) = ρ • ∫ G` for `ρ = 2λ > 0`. -/
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

/-! ## R1 (i): Fourier covariance of `fourierC` along dilation -/

/-- (i) `fourierC (dilateTo lam f) ξ = 2λ · fourierC f (2λ·ξ)` — the Fourier
covariance (precharter §1.3(i)); only `0 < lam` needed (junk-value-safe
substitution, no integrability side condition). -/
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

/-! ## R1 (ii-a): normaliser covariance -/

/-- (ii-a) `A_{ψ,λ} = 2λ · A_ψ` (precharter §1.3(ii-a)); only `0 < lam` needed. -/
theorem cutoffNormaliserLam_covariance {lam : ℝ} (hlam : 0 < lam) (psi : ℝ → ℝ) :
    cutoffNormaliserLam lam psi = 2 * lam * cutoffNormaliser psi := by
  have key := integral_comp_dilateTo (lam := lam) hlam
    (G := fun y : ℝ => psi y ^ 2 * extremalTest y)
  rw [smul_eq_mul] at key
  unfold cutoffNormaliserLam cutoffNormaliser extremalLam dilateTo
  exact key

/-! ## R1 (ii-b): test-function covariance -/

/-- (ii-b) `cutoffTestLam lam psi = √(A_ψ/A_{ψ,λ}) · dilateTo lam (cutoffTest psi)`
(precharter §1.3(ii-b)). Hypothesis `0 < A_ψ` (see header note); the λ-side
positivity follows via the covariance. -/
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
  -- Unfold order (run-2 fix, 2026-11-19, parked unfired per budget discipline):
  -- extremalLam BEFORE dilateTo — else the dilateTo exposed by extremalLam's
  -- unfold stays folded (run 2's one residual error, the eta-r1-run2.log
  -- leftover goal shows it verbatim).
  unfold cutoffTestLam extremalLam dilateTo cutoffTest
  field_simp

/-! ## The λ = 1/2 regression checkpoint (test-function level) -/

/-- `dilateTo (1/2) = id` on the nose (ρ = 2·(1/2) = 1). -/
theorem dilateTo_half (f : ℝ → ℝ) : dilateTo (1 / 2) f = f := by
  funext x
  unfold dilateTo
  norm_num

/-- `extremalLam (1/2) = extremalTest` bit-for-bit (the frozen base recovered). -/
theorem extremalLam_half : extremalLam (1 / 2) = extremalTest :=
  dilateTo_half extremalTest

/-- λ = 1/2 regression, test-function level: the scaled family at the frozen point
IS the frozen family (`cutoffTestLam (1/2) psi = cutoffTest psi`) — the R3
functional-level anchor, delivered at rung 1 per the regression-first discipline. -/
theorem cutoffTestLam_half {psi : ℝ → ℝ} (hA : 0 < cutoffNormaliser psi) :
    cutoffTestLam (1 / 2) psi = cutoffTest psi := by
  have hhalf : (0:ℝ) < 1 / 2 := by norm_num
  have hcov : cutoffNormaliserLam (1 / 2) psi = cutoffNormaliser psi := by
    rw [cutoffNormaliserLam_covariance hhalf psi]
    norm_num
  funext x
  rw [cutoffTestLam_eq_dilate hhalf hA]
  simp only [hcov, dilateTo_half, div_self hA.ne', Real.sqrt_one, one_mul]

/-! ## Triad gate (on-pin #print axioms; expected [propext, Classical.choice,
Quot.sound] per declaration — defs may print "does not depend on any axioms") -/

#print axioms ZZLam.EtaPort.fourierC_dilateTo
#print axioms ZZLam.EtaPort.cutoffNormaliserLam_covariance
#print axioms ZZLam.EtaPort.cutoffTestLam_eq_dilate
#print axioms ZZLam.EtaPort.dilateTo_half
#print axioms ZZLam.EtaPort.extremalLam_half
#print axioms ZZLam.EtaPort.cutoffTestLam_half

end ZZLam.EtaPort
