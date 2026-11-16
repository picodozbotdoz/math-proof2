/-
Statement elaboration probe — not a proof artifact.
**STAGED 2026-11-16 (lane R8, iteration-4 review) — run only on orchestrator approval**
(design: research/feasibility/iter4-donor-unblock-plan.md §2; SHELF probe — no iteration-4
consumer of the vendored build exists, so G10 fires only if a donor-proof-import consumer
appears). Elaborated INSIDE the AreaLaw2D lake tree on Modal (app crossmath-gprobe, the
`g5a` remote function, driven by the new `g10` mode of run_gprobe.sh / gprobe.py) after
`lake build OpenAI.Statements`.

Probe G10 (G5a-successor, the physlib refresh shelf-probe): the AreaLaw2D direct-import
route with Physlib REFRESHED past the donor's stale pin a50684a1 (the G5a disposition's
turnkey retry once the mathlib artifact service is healthy — `axiommath-donor-probes.md`
§G5a; viability re-verified 2026-11-16: leanprover-community/physlib @ master still
carries QuantumInfo/ForMathlib/Matrix.lean, repo actively maintained — a correction to
novelty/physlib-surface.md §3.4's "different project" note). Run25 (2026-11-14) was the
first-ever build of (ff2494ea + Physlib a50684a1) and failed with 17 errors in exactly
that one module (logs-g/run25-g5a.log :287–647); G10 asks whether a refreshed rev builds.

What this file checks, in order:
1. The G5a statement surface against the REFRESHED Physlib (import OpenAI.Statements +
   the ten bridge-named #checks + the two proved-subset axiom prints, ProbeG5a surface).
2. The refreshed `QuantumInfo.ForMathlib.Matrix` elaborates on its own and still exposes
   the a50684a1 anchor decls, namespace-resolved (raw-fetch verified 2026-11-16):
   `Matrix.PosSemidef.outer_self_conj` (:181), `Matrix.IsHermitian.sum_eigenvalues_eq_trace`
   (:98), `Matrix.PosSemidef.trace_mono` (:403).
3. Donor hygiene on the refreshed Physlib: `#print axioms` on those anchor theorems —
   the AGENTS.md Cycle-2 gate (triad = [propext, Classical.choice, Quot.sound]; claims
   are never proof).
4. Record correction made checkable: the G4 note's "one Physlib statement-layer
   contribution, posSemidef_vecMulVec_self_star" is actually MATHLIB's own lemma
   (`Mathlib/LinearAlgebra/Matrix/PosDef.lean:453`; Challenge/Basic.lean:234 consumes it
   via `open Matrix` at :63; none of the five Physlib modules @ a50684a1 defines it —
   raw-fetch sweep 2026-11-16). Physlib's own analogue is `Matrix.PosSemidef.outer_self_conj`.

Verdict protocol (one verdict line for the ledger, quoting the physlib rev that lake's
update step resolved — read it off the run log's `info: physlib: checking out revision '…'`):
- PASS  = build OK (0 errors) + all checks resolve + both axiom prints ⊆ triad.
- FAIL-REFRESH-BLOCKED = update step exhausted retries (`mathlib: failed to fetch cache`)
  and the seed fallback pinned the STALE pair — infra, NOT a donor verdict; retry later.
- FAIL-DRIFT = refreshed Physlib breaks vs ff2494ea — record the new error taxonomy; that
  prices the fallback option (pin a50684a1 + patch the 17 errors, S–M per §2b).
All sorries are probe scaffolding per convention — elaboration verdicts, never proof claims.
-/
import OpenAI.Statements
import QuantumInfo.ForMathlib.Matrix

open Arealaw OpenAI

/-! ## 1. The G5a statement surface (direct-import route, refreshed Physlib) -/

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

/-! ## 2. The refreshed Physlib anchor decls (the module that carried all 17 errors
at a50684a1; anchors are a50684a1 line-verified, namespace-resolved names expected to
survive the refresh). -/

#check @Matrix.PosSemidef.outer_self_conj
#check @Matrix.IsHermitian.sum_eigenvalues_eq_trace
#check @Matrix.PosSemidef.trace_mono

/-! ## 3. Donor hygiene on the refreshed Physlib (triad gate; claims are never proof). -/

#print axioms Matrix.PosSemidef.outer_self_conj
#print axioms Matrix.PosSemidef.trace_mono

/-! ## 4. Record-correction check: the statement layer's "Physlib" lemma is mathlib's. -/

#check @Matrix.posSemidef_vecMulVec_self_star

/-! ## Hypothesis-binder consumption (ProbeG5a shape, unchanged) -/

/-- Theorem 1.1 as a hypothesis type: body identical to `OpenAI.AreaLaw 𝕜 q R J Δ`. -/
def HypAreaLaw (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) : Prop := OpenAI.AreaLaw 𝕜 q R J Δ

/-- Corollary 1.2 as a hypothesis type. -/
def HypAreaLawCorollary (𝕜 : Type*) [RCLike 𝕜] (q : ℕ) (J Δ : ℝ) : Prop :=
  OpenAI.AreaLawCorollary 𝕜 q J Δ

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape). -/
theorem conditional_shape (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ)
    (h : HypAreaLaw 𝕜 q R J Δ) : HypAreaLaw 𝕜 q R J Δ := h

/-- The range-`R = 1` conditional at the donor's own statement layer (ProbeG5a's
`areaLaw_to_corollary` shape; validates the pilot-lane consumption shape). -/
theorem areaLaw_to_corollary (𝕜 : Type*) [RCLike 𝕜] (q : ℕ) (J Δ : ℝ)
    (h : HypAreaLaw 𝕜 q 1 J Δ) : HypAreaLawCorollary 𝕜 q J Δ := by
  sorry
