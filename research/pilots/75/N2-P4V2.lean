/-
Pilot 75-N2 P4-V2 — the uniform card PROOFS (the iter6 seed-1 fire rung; lane R8,
worktree agent-05, 2026-11-21; grant = 1 fire + <=2 fix rounds).

WHAT THIS PROVES (the P4 card pair of N2-P4.lean @ 2210fe6e — the seed-1 headline
at its strongest composed form, the round-6 prior-art pack's landing statement):
  * `zetaL_two_thirds_uniform_of_thmE` (P4-a / `ZetaLUniformOfThmEQ`): B′
    (`zetaL_two_thirds_landed_of_DZDF`, n2-p3e-run1 triad) specialized to the
    K = ℚ tower — fK := riemannZeta, the fK↔ζ count identifications `rfl` at the
    specialization — with the hEχcum premise ABSORBED via
    `componentEpsCum_of_thmE` (n2-p2d-run2 triad) from the two per-primitive
    ∀-candidate-family binders (hUnbF/hEF, exactly its inputs).
  * `zetaL_two_thirds_uniform_ℚ` (P4-b / `ZetaLUniformQ`): P4-a + the ζ-column
    DISCHARGED from the AxiomMath ZetaZerosV2 endpoint `ZetaZeros.simple_proportion_d4`
    (on-pin triad; via `epsLowerCum_zeta_of_V2d4` + `V2d4_endpoint`,
    N2-P3V2.lean, n2-p3v2-run3/4 triad) — leaving only the DZDF trio (G1-permanent
    statement-binders), the classical structural set, and hUnbF/hEF. The degenerate
    n-vacuous instance recovers B″.

ARCHITECTURE (NEW mechanism this run — the cross-substrate composition): this file
lives at the ZetaZerosV2 workspace root with the N2 chain staged as oleans on
LEAN_PATH (`run_n2p4v2.py` = the run_n2p3v2 recipe + the pilot-11 chain pattern), so
`import ZetaZeros` AND the chain imports coexist. The Pa ↔ Pilot75N2V2 vocabulary
bridge (the duplication convention's cost): N2-P3V2.lean carries the Pa vocabulary
VERBATIM (N2-P3V2.lean:40-100, per-file citations), so the bridge is defeq —
proof-irrelevant at the window proofs (Pa's `lineFiniteCum h T` and V2's are proofs
of the same Prop) and delta-identical at the carries — the two bridge theorems below
are pure coercions (`:= h`), no mathematical content.

HYGIENE: proof artifact — 0 sorry; #print axioms at file end (expect triad only on
both uniform theorems + the bridge; the d4 donor re-print rides per the A3 class).
Pure application chain over GREEN pieces — no new mathematics; the statement is the
contribution (NOVEL-AS-STATED, novelty/round6-n2-p3-priorart.md + the round-2
re-confirmation).
-/
import Mathlib
import ZetaZeros
import N2P4
import N2P3V2

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-! ## The Pa ↔ Pilot75N2V2 vocabulary bridge (defeq; the duplication convention) -/

/-- `WindowFinite` transports Pa → V2 across the verbatim carry (delta-defeq Prop). -/
theorem windowFinite_v2_of_pa {m : ℂ → ℕ}
    (h : CrossMath.Pilot75.WindowFinite m) :
    CrossMath.Pilot75N2V2.WindowFinite m := h

/-- `EpsLowerCum` transports V2 → Pa across the verbatim carry: both unfold
(structure-eta + delta) to the same ε-statement over sums of `m` on
`(h 0 T).toFinset` / the line windows, with the Finset proofs of the SAME Prop —
defeq by proof irrelevance. No mathematical content. -/
theorem epsLowerCum_pa_of_v2 {m : ℂ → ℕ}
    {h : CrossMath.Pilot75.WindowFinite m}
    {h' : CrossMath.Pilot75N2V2.WindowFinite m} {c : ℝ}
    (hv : CrossMath.Pilot75N2V2.EpsLowerCum ⟨m, h'⟩ c) :
    CrossMath.Pilot75.EpsLowerCum ⟨m, h⟩ c := hv

/-! ## P4-a — the uniform composed card at K = ℚ (plain composition) -/

-- maxHeartbeats insurance for the two application theorems below (run-1's whnf
-- timeout was the shifted-application cascade; raised for the rfl-specialization
-- goals regardless; file-scope for the remainder of this section).
set_option maxHeartbeats 1000000

/-- **P4-a proof**: B′ at fK := riemannZeta (count identifications `rfl` at the
specialization) + the hEχcum absorption via `componentEpsCum_of_thmE`. Pure
application chain over the GREEN stack — no new mathematics. -/
theorem zetaL_two_thirds_uniform_of_thmE (fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ)
    (hfinζ : WindowFinite (multOf riemannZeta)) (hfinL : WindowFinite (multOf fL)) :
    ZetaLUniformOfThmEQ fL n m χ hfinζ hfinL := by
  intro hnp hdic hfac hKζ hL hntopKζ hntopL hUnbF hEF hζ
  exact zetaL_two_thirds_landed_of_DZDF riemannZeta fL n m χ hfinζ hfinL hfinζ
    hnp hdic hfac hKζ hL hntopKζ hntopL
    (fun q hN ψ hneF => componentEpsCum_of_thmE hN ψ (fun i => (hneF i).2)
      (hUnbF q hN ψ hneF) (hEF q hN ψ hneF))
    (fun _ => rfl) (fun _ => rfl) hζ

/-! ## P4-b — the ℚ-uniform endpoint (the ζ-column discharged V2-side) -/

/-- **P4-b proof**: P4-a with the ζ-column premise discharged from the V2 d4
endpoint (`ZetaZeros.simple_proportion_d4`, imported on the V2 substrate), through
the defeq bridge. The degenerate n-vacuous instance recovers B″. -/
theorem zetaL_two_thirds_uniform_ℚ (fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ)
    (hfinζ : WindowFinite (multOf riemannZeta)) (hfinL : WindowFinite (multOf fL)) :
    ZetaLUniformQ fL n m χ hfinζ hfinL := by
  intro hnp hdic hfac hKζ hL hntopζ hntopL hUnbF hEF
  have hfinζ' : CrossMath.Pilot75N2V2.WindowFinite (CrossMath.Pilot75N2V2.multOf riemannZeta) :=
    windowFinite_v2_of_pa hfinζ
  have hζv2 : CrossMath.Pilot75N2V2.EpsLowerCum
      ⟨CrossMath.Pilot75N2V2.multOf riemannZeta, hfinζ'⟩ (2 / 3) :=
    CrossMath.Pilot75N2V2.epsLowerCum_zeta_of_V2d4 hntopζ hfinζ'
      CrossMath.Pilot75N2V2.V2d4_endpoint
  have hζ : EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3) :=
    epsLowerCum_pa_of_v2 (m := multOf riemannZeta) (h := hfinζ) (h' := hfinζ') hζv2
  exact zetaL_two_thirds_uniform_of_thmE fL n m χ hfinζ hfinL
    hnp hdic hfac hKζ hL (fun ρ _ => hntopζ ρ) hntopL hUnbF hEF hζ

end CrossMath.Pilot75N2

-- audit (expect triad only, 0 sorryAx)
#print axioms CrossMath.Pilot75N2.windowFinite_v2_of_pa
#print axioms CrossMath.Pilot75N2.epsLowerCum_pa_of_v2
#print axioms CrossMath.Pilot75N2.zetaL_two_thirds_uniform_of_thmE
#print axioms CrossMath.Pilot75N2.zetaL_two_thirds_uniform_ℚ
-- donor endpoint on-pin re-print (the A3 class; banked n2-p3v2-build1/run3)
#print axioms ZetaZeros.simple_proportion_d4
