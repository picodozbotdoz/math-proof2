/-
Pilot 75-N2 P4 — the UNIFORM composed card (iter6-seed-census seed 1's target shape;
the round-6 prior-art pack's landing statement, `novelty/round6-n2-p3-priorart.md`).
STATEMENTS-ONLY rung: cards + #check pins, ZERO sorry, no proofs (the N2-P3
statement-rung pattern; elaboration is a statement probe, never a proof claim).
Lane R8 (worktree agent-05, re-tasked seed-1 owner), 2026-11-21.

WHAT IS NEW HERE (vs the landed B′/B″ of article-75 v4):
  B′ `zetaL_two_thirds_landed_of_DZDF` (N2-P3e.lean:62, triad n2-p3e-run1) carries the
    per-family component proportion `hEχcum` and the ζ-column `hζ` as PREMISES at an
    ABSTRACT fK;
  B″ `zetaL_two_thirds_landed_ℚ` (N2-P3V2.lean:298, triad n2-p3v2-run4) is the
    degenerate no-family tower (L = K = ℚ, no DZDF/family premises at all).
The P4 cards are the missing UNIFORM composition — the K = ℚ tower with fK :=
riemannZeta (the fK↔ζ count identifications become `rfl` at the specialization) and
the hEχcum premise ABSORBED into the per-primitive binder pair exactly at
`componentEpsCum_of_thmE`'s consumption shape (N2-P2d.lean:166, GREEN n2-p2d-run2):
  card 1 `ZetaLUniformOfThmEQ` (plain substrate): B′-at-fK=ζ + the pair absorption,
    hζ still a premise (mirrors B′ exactly);
  card 2 `ZetaLUniformQ` (V2-substrate target): card 1 with hζ REMOVED (discharged
    V2-side from `ZetaZeros.simple_proportion_d4` via `epsLowerCum_zeta_of_V2d4`,
    N2-P3V2.lean, GREEN n2-p3v2-run3) and hntop strengthened to B″'s ∀ρ FOREVER form.
Card 2's degenerate n-vacuous instance recovers B″; card 2 at the B′ family data IS
the census seed-1 headline: EVERY abelian L/ℚ, ≥ 2/3 − ε of the window zeros
(cumulative (0,T], with multiplicity) on the critical line — conditional exactly on
the DZDF statement-binder trio (hnp/hdic/hfac — G1-permanent, never an import), the
classical structural set, and the two per-primitive binders (ThmEDyadic = the zeta23
donor endpoint, PROVED at the donor pin v4.33, audited triad zeta23e-p0-run1;
CountsUnbounded = the classical zero-infinitude, Titchmarsh §5.8 / Davenport ch. 9).
Every proportion input is a kernel-verified theorem at its own pin (V2 d4 on-pin
ff2494ea; ThmE donor-pin). NOVELTY: `novelty/round6-n2-p3-priorart.md` (NOVEL-AS-
STATED, 8-row nearest-miss table) + the round-2 re-confirmation
(`novelty/r9-novelty-verification-iter6-round2.md` §seed 1 — absence re-confirmed
2026-11-21; the XiPrime caveat noted there binds any phrasing).

SUBSTRATE SPLIT (the family precedent): THIS file is the PLAIN substrate (import
Mathlib + the GREEN chain N2P2c/N2P3/N2P2d/N2P3e — every consumed proof module; NO
ZetaZeros import) — it elaborates on the run_n2p2d module chain extended with the two
GREEN proof modules (N2-P2d, N2-P3e). Card 2's hζ DISCHARGE is V2-side and lives in
the fire file
(N2-P4V2.lean, to be staged at the V2 workspace root per the run_n2p3v2 recipe). The
proof obligations are pure application chains over GREEN pieces (B′ +
`componentEpsCum_of_thmE` + the V2 discharge + rfl specializations) — no new
mathematics; the statement is the contribution.

HYGIENE: statement rung — zero sorry. The #check pins below elaborate the binder
inventory. On landing the card names enter the article-75 statement table by
revise-in-place (the D3/v3 naming caution; no new ship without R2's S1–S4).
-/
import Mathlib
import N2P2c
import N2P3
import N2P2d
import N2P3e

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-- **P4-a — the uniform composed N2-d card at K = ℚ (plain substrate; hζ stays a
premise)**: `ZetaLRatTwoThirdsOfDZDF` (N2-P3.lean:206) specialized to fK :=
riemannZeta — the fK↔ζ count-identification premises become `rfl` at the
specialization — with the per-family `hEχcum` premise ABSORBED into the two
per-primitive ∀-candidate-family binders (hUnbF = the classical zero-infinitude
`CountsUnbounded` at each primitive associate; hEF = the zeta23 donor endpoint
`ThmEDyadic` at each primitive associate), exactly the two inputs of
`componentEpsCum_of_thmE` (N2-P2d.lean:166, GREEN). Binder ledger: hnp/hdic/hfac =
the DZDF trio (donor statement-binders, G1-permanent); hKζ/hL/hntopKζ/hntopL =
the structural set at the ζ/fL sides; hfinζ/hfinL = window finiteness; hζ = the
ζ-column 2/3 proportion (V2-dischargeable; card 2 removes it). -/
def ZetaLUniformOfThmEQ (fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ)
    (hfinζ : WindowFinite (multOf riemannZeta)) (hfinL : WindowFinite (multOf fL)) :
    Prop :=
  (∀ i, ¬ IsDZDFPrincipalQ (m i) (χ i)) →
  (∀ i, HasQDirichletDictionary (m i) (χ i)) →
  (∀ s : ℂ, 1 < s.re →
    fL s = (∏ i : Fin n, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s)) *
      riemannZeta s) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ riemannZeta ρ) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fL ρ) →
  (∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt riemannZeta ρ ≠ ⊤) →
  (∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fL ρ ≠ ⊤) →
  (∀ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i))
      (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)) (hneF : ∀ i, 1 < q i ∧ ψ i ≠ 1),
      ∀ i, @CountsUnbounded ((ψ i).conductor)
        (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩) (ψ i).primitiveCharacter
        (@windowFinite_LFunction ((ψ i).conductor)
          (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩) (ψ i).primitiveCharacter
          (primitiveCharacter_ne_one ((hneF i).2)))) →
  (∀ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i))
      (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)) (hneF : ∀ i, 1 < q i ∧ ψ i ≠ 1),
      ∀ i, @ThmEDyadic ((ψ i).conductor)
        (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩) (ψ i).primitiveCharacter) →
  EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3) →
    EpsLowerCum ⟨multOf fL, hfinL⟩ (2 / 3)

/-- **P4-b — the ℚ-uniform endpoint card (V2-substrate fire target; hζ DISCHARGED)**:
P4-a with the ζ-column premise removed and the ζ-side nontop binder strengthened to
B″'s ∀ρ FOREVER form (`∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤`, exactly
`zetaL_two_thirds_landed_ℚ`'s surviving binder). The fire file (V2 substrate)
discharges the ζ column from `ZetaZeros.simple_proportion_d4` via
`epsLowerCum_zeta_of_V2d4 hntopζ hfinζ V2d4_endpoint`. The degenerate n-vacuous
instance recovers B″; at the B′ family data this card is the census seed-1 headline
(every abelian L/ℚ, cumulative with-multiplicity on-line proportion ≥ 2/3 − ε). -/
def ZetaLUniformQ (fL : ℂ → ℂ) (n : ℕ)
    (m : Fin n → Ideal (𝓞 ℚ)) (χ : (i : Fin n) → Ideal (𝓞 ℚ) → ℂ)
    (hfinζ : WindowFinite (multOf riemannZeta)) (hfinL : WindowFinite (multOf fL)) :
    Prop :=
  (∀ i, ¬ IsDZDFPrincipalQ (m i) (χ i)) →
  (∀ i, HasQDirichletDictionary (m i) (χ i)) →
  (∀ s : ℂ, 1 < s.re →
    fL s = (∏ i : Fin n, ∑' I : Ideal (𝓞 ℚ), χ i I * (Ideal.absNorm I : ℂ) ^ (-s)) *
      riemannZeta s) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ riemannZeta ρ) →
  (∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fL ρ) →
  (∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤) →
  (∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fL ρ ≠ ⊤) →
  (∀ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i))
      (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)) (hneF : ∀ i, 1 < q i ∧ ψ i ≠ 1),
      ∀ i, @CountsUnbounded ((ψ i).conductor)
        (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩) (ψ i).primitiveCharacter
        (@windowFinite_LFunction ((ψ i).conductor)
          (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩) (ψ i).primitiveCharacter
          (primitiveCharacter_ne_one ((hneF i).2)))) →
  (∀ (q : Fin n → ℕ) (hN : ∀ i, NeZero (q i))
      (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)) (hneF : ∀ i, 1 < q i ∧ ψ i ≠ 1),
      ∀ i, @ThmEDyadic ((ψ i).conductor)
        (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩) (ψ i).primitiveCharacter) →
    EpsLowerCum ⟨multOf fL, hfinL⟩ (2 / 3)

-- Statement-layer name/shape pins (elaborated at this rung; expect `def` cards only,
-- 0 sorry; the two P4 cards + the consumed GREEN pieces they quantify over).
#check @CrossMath.Pilot75N2.ZetaLUniformOfThmEQ
#check @CrossMath.Pilot75N2.ZetaLUniformQ
#check @CrossMath.Pilot75N2.ZetaLRatTwoThirdsOfDZDF
#check @CrossMath.Pilot75N2.ComponentEpsCum
#check @CrossMath.Pilot75N2.CountsUnbounded
#check @CrossMath.Pilot75N2.ThmEDyadic
#check @CrossMath.Pilot75N2.componentEpsCum_of_thmE
#check @CrossMath.Pilot75N2.zetaL_two_thirds_landed_of_DZDF

end CrossMath.Pilot75N2
