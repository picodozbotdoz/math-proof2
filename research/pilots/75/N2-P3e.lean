/-
Pilot 75-N2 P3-e — the composed assembly (`zetaL_two_thirds_landed_of_DZDF`),
plain substrate (R6 unit 10, session 2026-11-20).

CHARTER: Iteration-5 lead-1 continuation per N2-P3-plan.md rung P3-e, with the
plan's substrate split made explicit: the card `ZetaLRatTwoThirdsOfDZDF`
(N2-P3.lean) takes the ζ-column proportion `hζ` and the per-family `hEχcum` as
PREMISES, so the composed theorem itself needs NO V2 import — it is a pure
application chain over GREEN pieces:
  P3-b  `abFacQ_of_factorization`      (n2-p3-run3 GREEN — the two-theorem P1 chain)
  P3-c  `analyticOrderAt_lFunction_ne_top` (n2-p3-run3 GREEN)
  P2-a  `windowFinite_family`          (n2-p3-run2 GREEN)
  P0    `zetaL_rat_two_thirds_landed`  (n2-p0-run4 GREEN — the engine landing)
plus the inline count-identification transfer (the `ZetaColumnOfV2Q` card's
content at plain substrate: hccum/hconcum move the ζ-column EpsLowerCum to fK —
the same 6 lines as N2-P3V2.lean's `epsLowerCum_transfer`, cited).

The hζ premise is discharged V2-side (N2-P3V2.lean: epsLowerCum_zeta_of_V2d4 +
V2d4_endpoint = ZetaZeros.simple_proportion_d4); the hEχcum premise is the P2-c
port output (primitive members: `thmE_dyadic_to_cumulative`, N2-P2c.lean;
imprimitive via `eulerStripImmunity_changeLevel`, run 31 GREEN). Both stay
premises HERE — the composed statement is conditional exactly on the dossier's
honest binder set (S4(a) billing).

HYGIENE: proof artifact — 0 sorry; #print axioms at file end. Staging: this
module imports `N2P3` — the repo file N2-P3.lean staged under the legal module
name N2P3.lean (byte-identical copy, the N2P0/N2P1 precedent). Runner pair
run_n2p3e.{sh,py} (a copy of run_n2p3 with ORDER extended).
-/
import Mathlib
import N2P3

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-- The plain-substrate ζ-column transfer (N2-P3V2.lean's `epsLowerCum_transfer`,
same 6 lines; `ZetaColumnOfV2Q`'s inner implication at the Pa shapes). -/
theorem epsLowerCum_transfer_plain {fK : ℂ → ℂ} {hfinK : WindowFinite (multOf fK)}
    {hfinζ : WindowFinite (multOf riemannZeta)}
    (hccum : ∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T)
    (hconcum : ∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countOnCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T)
    (hζ : EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3)) :
    EpsLowerCum ⟨multOf fK, hfinK⟩ (2 / 3) := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := hζ ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  rw [hccum T, hconcum T]
  exact hT₀ T hT

/-- **P3-e (the composed N2-d assembly)**: DZDF-quoted factorization data over ℚ +
the dictionary + the structural set + every Dirichlet component at cumulative 2/3
(hEχ, the P2-c port output in ∀-candidate-family form) + the ζ-column at 2/3 (hζ,
discharged V2-side from `ZetaZeros.simple_proportion_d4`) ⇒ the with-multiplicity
cumulative on-line proportion of ζ_L is ≥ 2/3. Pure application chain over the
GREEN stack (P3-b + P3-c + P2-a + the P0 engine landing) — no new mathematics. -/
theorem zetaL_two_thirds_landed_of_DZDF (fK fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinζ : WindowFinite (multOf riemannZeta)) :
    ZetaLRatTwoThirdsOfDZDF fK fL n m χ hfinK hfinL hfinζ := by
  intro hnp hdic hfac hK hL hntopK hntopL hEχcum hccum hconcum hζ
  -- P3-b: the Dirichlet family + the ℂ∖{1} identity (the GREEN P1 chain)
  obtain ⟨q, hN, ψ, hscope, hid⟩ := abFacQ_of_factorization fK fL n m χ hnp hdic hfac hK hL
  -- the ζ-column transfer (P3-d's plain-side content)
  have hK23 : EpsLowerCum ⟨multOf fK, hfinK⟩ (2 / 3) :=
    epsLowerCum_transfer_plain hccum hconcum hζ
  -- the engine landing (P0 GREEN) with every slot discharged
  exact zetaL_rat_two_thirds_landed ψ (fun i => @DirichletCharacter.LFunction (q i) (hN i) (ψ i))
    hN hscope (fun i => rfl) hK hL hntopK hntopL
    (fun i ρ => by
      haveI : NeZero (q i) := hN i
      exact analyticOrderAt_lFunction_ne_top (hscope i).2 ρ)
    hid hfinK hfinL (windowFinite_family hN ψ (fun i => (hscope i).2)) hK23
    (hEχcum q hN ψ hscope)

end CrossMath.Pilot75N2

-- audit (expect triad only, 0 sorryAx)
#print axioms CrossMath.Pilot75N2.epsLowerCum_transfer_plain
#print axioms CrossMath.Pilot75N2.zetaL_two_thirds_landed_of_DZDF
