/-
Statement elaboration probe — not a proof artifact.
**STAGED 2026-11-16 (lane R8, iteration-4 review) — run only on orchestrator approval**
(design: research/feasibility/iter4-donor-unblock-plan.md §3; this file rides the
`run_gprobe.sh probe` auto-glob exactly like G1/G3/G4/G7 did — it will elaborate on the
next approved probe-mode run).

Probe G9 (PNT+ upstream route): transcribe upstream Kontorovich PrimeNumberTheoremAnd's
`StrongPNT` conclusion onto OUR pin, mathlib-only — the 22-T2a carried slot's donor-binder
preflight (`feasibility/ITERATION4-CHARTER-DRAFT.md` slot table: "22-T2a | small task-slot,
upstream PNT+ statement as binder"). Triggers T1/T2/T3 all unfired 2026-11-16
(iter4-donor-unblock-plan.md §3), so upstream stays UNREGISTERED — this is the Liu-1
external-formal-prior-art convention: statement citation, zero upstream imports.

Source (read-only raw fetch 2026-11-16, repo NOT cloned; upstream @ `main`, post-`938912bb`):
`PrimeNumberTheoremAnd/StrongPNT.lean`, final theorem (statement; proof delegates to
GenStrengthPNT), followed in-file by `#print axioms StrongPNT` (record cite:
`novelty/pntplus-glue-as-donor.md` §(d) — triad `[propext, choice, Quot.sound]`):

    theorem StrongPNT : ∃ c > 0,
        (ψ - id) =O[atTop]
          fun (x : ℝ) ↦ x * Real.exp (-c * (Real.log x) ^ ((1 : ℝ) / 2))

with upstream's `local notation "ψ" => ChebyshevPsi`.

Name mapping (the ONLY delta): upstream `ChebyshevPsi` ↦ mathlib's own `Chebyshev.psi`
(`Mathlib/NumberTheory/Chebyshev.lean:70`, scoped `ψ` notation :74; Λ =
`ArithmeticFunction.vonMangoldt`, `Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean:66`
— both IN mathlib on our pin ff2494ea, verified in the encore checkout 2026-11-16).
`Pow ℝ ℝ` (rpow) is a global instance (`Mathlib/Analysis/SpecialFunctions/Pow/Real.lean:37`)
— no open needed for `^ ((1 : ℝ) / 2)`.

Expected verdict (corpus-wide statement-port ≈ 0, FEASIBILITY-SUMMARY): OK, 0 errors;
one verdict line for the probes ledger. All sorries are probe scaffolding per convention —
verdicts here are STATEMENT-elaboration results, never proof claims.
-/
import Mathlib

-- A8 fix (2026-11-17, run36→run37): `atTop` lives in the Filter namespace; without
-- `open Filter` the =O[...] filter slot fails elaboration (run36-g9.log: unknown
-- identifier at :51). The mapping-table fix anticipated by the §14 row-10 card.
open Filter

namespace ProbeStrongPNT

/-! ## Upstream statement, transcribed (ψ ↦ Chebyshev.psi), mathlib-only -/

theorem strongPNT_upstream_shape : ∃ c > 0,
    (Chebyshev.psi - id) =O[atTop]
      fun (x : ℝ) ↦ x * Real.exp (-c * (Real.log x) ^ ((1 : ℝ) / 2)) := by
  sorry

/-- The donor statement as a hypothesis type (the 22-T2a binder; EnclOK / ProbeE /
G1a `HypDZDF` precedent). -/
def HypStrongPNT : Prop :=
  ∃ c > 0, (Chebyshev.psi - id) =O[atTop]
    fun (x : ℝ) ↦ x * Real.exp (-c * (Real.log x) ^ ((1 : ℝ) / 2))

/-! ## Binder-consuming wrapper: the eventually-explicit form a T2a proof surface wants
(`IsBigO` at `atTop` unfolded to an explicit threshold; the multiplicative `M` stays
honest — `=O` only ever bounds up to a constant factor). -/

theorem asymp_bound_of_HypStrongPNT (h : HypStrongPNT) :
    ∃ c > 0, ∃ M > 0, ∃ C : ℝ, ∀ x : ℝ, C ≤ x →
      |Chebyshev.psi x - x| ≤
        M * x * Real.exp (-c * (Real.log x) ^ ((1 : ℝ) / 2)) := by
  sorry

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape). -/
theorem conditional_shape (h : HypStrongPNT) : HypStrongPNT := h

end ProbeStrongPNT
