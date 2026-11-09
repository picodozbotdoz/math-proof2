/-
Pilot 22 / milestone M1 PROOF — the Laurent constant of `riemannZeta` at `1` exists.
Statement: `research/pilots/22-blueprint.md` §M1 (glue G1); probe: ProbeP1_PNT.lean
(`stmt_M1_LaurentConstant`). Full proof, no `sorry`, no `axiom`, no `native_decide`.

Mathematics (one removable singularity + one slope limit):
  F s := (s−1)·ζ s is differentiable on a punctured neighborhood of 1
    (`differentiableAt_riemannZeta`, RiemannZeta.lean:139) and tends to 1 there
    (`riemannZeta_residue_one`, RiemannZeta.lean:242). Hence g := update F 1 1 is
    analytic at 1 (`Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt`,
    RemovableSingularity.lean:36), so it has a derivative at 1, and for s ≠ 1
      ζ s − 1/(s−1) = (g s − g 1)/(s − 1) = slope g 1 s → g' 1
    (`hasDerivAt_iff_tendsto_slope`, Deriv/Slope.lean:73; `slope` unfolds to
    (y−x)⁻¹ • (f y −ᵥ f x), LinearAlgebra/AffineSpace/Slope.lean).
  Note the junk value `riemannZeta 1` is never evaluated: the update replaces it by 1.
-/
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Analysis.Complex.RemovableSingularity
import Mathlib.Analysis.Calculus.Deriv.Slope
import Mathlib.Topology.Piecewise

open Filter Topology

namespace CrossMath.Pilot22

/-- **M1.** The constant term of the Laurent expansion of `riemannZeta` at `1` exists:
`ζ s − 1/(s−1)` has a limit as `s → 1`, `s ≠ 1`. -/
theorem exists_tendsto_riemannZeta_sub_inv :
    ∃ c : ℂ, Tendsto (fun s ↦ riemannZeta s - 1 / (s - 1)) (𝓝[≠] 1) (𝓝 c) := by
  set F : ℂ → ℂ := fun s ↦ (s - 1) * riemannZeta s with hF
  -- eventually s ≠ 1 along the punctured neighborhood
  have hne : ∀ᶠ s in 𝓝[≠] 1, s ≠ (1 : ℂ) := by
    rw [eventually_nhdsWithin_iff]
    exact Filter.Eventually.of_forall fun s hs => hs
  -- F is differentiable away from 1
  have hd : ∀ᶠ s in 𝓝[≠] 1, DifferentiableAt ℂ F s := by
    filter_upwards [hne] with s hs
    have hF1 : DifferentiableAt ℂ (fun s : ℂ => s - 1) s := by fun_prop
    exact hF1.mul (differentiableAt_riemannZeta hs)
  -- g := update F 1 1 is continuous at 1 (residue) …
  have hc : ContinuousAt (Function.update F 1 1) 1 :=
    continuousAt_update_same.2 riemannZeta_residue_one
  -- … and differentiable at every s ≠ 1, since g = F on the neighborhood {s | s ≠ 1} of such s
  have hd' : ∀ᶠ s in 𝓝[≠] 1, DifferentiableAt ℂ (Function.update F 1 1) s := by
    filter_upwards [hd, hne] with s hs hsne
    have hmem : {s : ℂ | s ≠ 1} ∈ 𝓝 s := isOpen_ne.mem_nhds hsne
    have heqF : Function.update F 1 1 =ᶠ[𝓝 s] F := by
      filter_upwards [hmem] with s' hs'
      exact Function.update_of_ne hs' 1 F
    exact hs.congr_of_eventuallyEq heqF
  -- removability: g is analytic at 1, hence differentiable there
  have hg : AnalyticAt ℂ (Function.update F 1 1) 1 :=
    Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt hd' hc
  -- slope identification: for s ≠ 1, ζ s − 1/(s−1) = slope g 1 s
  have heq : (fun s ↦ riemannZeta s - 1 / (s - 1))
      =ᶠ[𝓝[≠] 1] slope (Function.update F 1 1) 1 := by
    filter_upwards [hne] with s hs
    have h1 : Function.update F 1 1 1 = 1 := Function.update_self 1 1 F
    have h2 : Function.update F 1 1 s = F s := Function.update_of_ne hs 1 F
    simp only [slope, vsub_eq_sub, smul_eq_mul, h1, h2]
    field_simp
    ring
  exact ⟨deriv (Function.update F 1 1) 1,
    Tendsto.congr' heq.symm ((hasDerivAt_iff_tendsto_slope).1 hg.differentiableAt.hasDerivAt)⟩

end CrossMath.Pilot22

#print axioms CrossMath.Pilot22.exists_tendsto_riemannZeta_sub_inv
