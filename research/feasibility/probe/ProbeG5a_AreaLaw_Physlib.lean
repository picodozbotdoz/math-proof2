/-
Statement elaboration probe — not a proof artifact.
Probe G5a (axiommath donor round, 2026-11-13; bridge research/bridges/area-law.md §6 item 1):
direct-import check of AreaLaw2D's STATEMENT layer with Physlib staged. This file is
elaborated INSIDE the AreaLaw2D lake tree on Modal (app crossmath-gprobe, function g5a)
after `lake build OpenAI.Statements` — which fetches Physlib from the donor's own pinned
git rev (leanprover-community/physlib @ a50684a1) and builds the vendored region core
(AreaLawForMathlib.QuantumInfo.*) against mathlib ff2494ea / v4.36.0-rc2 (the donor lakefile
pin; its stale manifest db584cd6 is refreshed by `lake update`).
The probe checks the bridge's named statement surface: OpenAI.HasGlobalGap, pureState,
SubState.regionEntropy, AreaLaw, AreaLawCorollary, and the PEPS-side UniformAreaLaw
consumption shape (restated here as a hypothesis binder since openai-math pins v4.34.1).
Elaboration verdicts only, never proof claims.
-/
import OpenAI.Statements

open Arealaw OpenAI

/-! ## The bridge's named statement surface (direct-import route) -/

#check @OpenAI.HasGlobalGap
#check @OpenAI.pureState
#check @Arealaw.SubState.regionEntropy
#check @OpenAI.AreaLaw
#check @OpenAI.AreaLawCorollary
#check @OpenAI.VertexAreaLaw
#check @OpenAI.IsAdmissible
#check @OpenAI.hamiltonian
#check @OpenAI.domainEDist
#check @OpenAI.edgeBoundary

/-! ## Statement-layer axiom hygiene (the two proved subset facts + structure eta). -/

#print axioms OpenAI.graphNbhd_subset
#print axioms OpenAI.domainComponent_subset

/-! ## Hypothesis-binder consumption (the pilot-lane shape; EnclOK / ProbeE precedent):
Theorem 1.1's Prop directly as a hypothesis, and the PEPS interface conditional
(bridge AL-EZ3(iii)) with the dictionary carried as binders. -/

/-- Theorem 1.1 as a hypothesis type: body identical to `OpenAI.AreaLaw 𝕜 q R J Δ`. -/
def HypAreaLaw (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) : Prop := OpenAI.AreaLaw 𝕜 q R J Δ

/-- Corollary 1.2 as a hypothesis type. -/
def HypAreaLawCorollary (𝕜 : Type*) [RCLike 𝕜] (q : ℕ) (J Δ : ℝ) : Prop :=
  OpenAI.AreaLawCorollary 𝕜 q J Δ

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape). -/
theorem conditional_shape (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ)
    (h : HypAreaLaw 𝕜 q R J Δ) : HypAreaLaw 𝕜 q R J Δ := h

/-- The range-`R = 1` conditional at the donor's own statement layer (the donor proves
this as `areaLawCorollary`; here it validates the pilot-lane consumption shape: Theorem 1.1
at `R = 1` as hypothesis ⇒ Corollary 1.2's vertex-boundary forms). The grid-box /
`boundaryCard` dictionary for the PEPS interface is carried by ProbeG5b (openai-math's
`UniformAreaLaw` pins v4.34.1 and is transcribed there). -/
theorem areaLaw_to_corollary (𝕜 : Type*) [RCLike 𝕜] (q : ℕ) (J Δ : ℝ)
    (h : HypAreaLaw 𝕜 q 1 J Δ) : HypAreaLawCorollary 𝕜 q J Δ := by
  sorry
