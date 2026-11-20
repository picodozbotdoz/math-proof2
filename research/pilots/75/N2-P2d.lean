/-
Pilot 75-N2 P2-d — the IMPRIMITIVE hEχ composition rung (R6 unit 11, 2026-11-20).

CHARTER: orchestrator ruling of 2026-11-20 — the OPTIONAL final rung: compose the
two GREEN theorems
  P2-c core `thmE_dyadic_to_cumulative` (n2-p2c-run8: primitive χ + hUnb + ThmEDyadic
    ⇒ EpsLowerCum at 2/3) and
  P2-b `eulerStripImmunity_changeLevel` (n2-p1-run31: the changeLevel lift agrees
    with its base character's multiplicities on the open strip)
into the per-member discharge for EVERY (possibly imprimitive) ψ ≠ 1 via the pin's
primitive-associate API (DirichletCharacter.primitiveCharacter /
changeLevel_primitiveCharacter / primitiveCharacter_isPrimitive — Basic.lean:306–315).
With this, SLOT-1's hEχ premise is dischargeable for any family presented with the
two named per-primitive binders (ThmEDyadic = the audited zeta23 donor endpoint;
CountsUnbounded = the classical zero-infinitude, Titchmarsh §5.8/Davenport ch. 9) —
no new mathematics anywhere: two applications + the count-agreement transfer.

CONTENT (three layers, all pure glue):
  (1) `countCum_congr` / `countOnCum_congr`: strip-agreement of multiplicity
      functions ⇒ countCum/countOnCum agreement (the Finset.ext toFinset idiom —
      Set.Finite.toFinset is proof-dependent on this pin, Data/Set/Finite/Basic.lean:75);
  (2) `epsLowerCum_congr`: the EpsLowerCum transfer along (1);
  (3) `epsLowerCum_of_thmE` (per member, any ψ ≠ 1, via the primitive associate) +
      `componentEpsCum_of_thmE` (the P3-e `ComponentEpsCum` card shape).

HYGIENE: proof artifact — 0 sorry; #print axioms at file end. Staging: imports
N2P2c + N2P3 (transitively Pa/N2P0/N2P1); runner pair run_n2p2d.{sh,py} (the
run_n2p3e pattern with ORDER = [Pa, N2P0, N2P1, N2P2c, N2P3, N2-P2d.lean]).
-/
import Mathlib
import N2P2c
import N2P3

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-! ### (1) Count agreement under strip-agreement of multiplicities -/

/-- Strip-agreement of multiplicity functions gives equal cumulative counts (the
window `stripWindow 0 T` lies inside the agreement region `0 < Re ρ < 1`). -/
theorem countCum_congr {m₁ m₂ : ℂ → ℕ} {hfin₁ : WindowFinite m₁} {hfin₂ : WindowFinite m₂}
    (h : ∀ ρ : ℂ, 0 < ρ.re → ρ.re < 1 → m₁ ρ = m₂ ρ) (T : ℝ) :
    (⟨m₁, hfin₁⟩ : ZeroMult).countCum T = (⟨m₂, hfin₂⟩ : ZeroMult).countCum T := by
  classical
  have hset : supp m₁ ∩ stripWindow 0 T = supp m₂ ∩ stripWindow 0 T := by
    ext ρ
    simp only [Set.mem_inter_iff, mem_supp_iff, stripWindow, Set.mem_ofPred_eq]
    constructor
    · rintro ⟨hne1, hre1, hre2, him1, him2⟩
      have heq := h ρ hre1 hre2
      refine ⟨(mem_supp_iff).mpr (fun h0 => hne1 ?_), hre1, hre2, him1, him2⟩
      rw [heq]; exact h0
    · rintro ⟨hne2, hre1, hre2, him1, him2⟩
      have heq := h ρ hre1 hre2
      refine ⟨(mem_supp_iff).mpr (fun h0 => hne2 ?_), hre1, hre2, him1, him2⟩
      rw [← heq]; exact h0
  have hf1 : (supp m₁ ∩ stripWindow 0 T).Finite := hfin₁ 0 T
  have hf2 : (supp m₂ ∩ stripWindow 0 T).Finite := hfin₂ 0 T
  have hfe : hf1.toFinset = hf2.toFinset := by
    ext ρ
    simp only [Set.Finite.mem_toFinset, hset]
  unfold ZeroMult.countCum
  rw [hfe]
  refine Finset.sum_congr rfl fun ρ hρ => ?_
  have hmem := (Set.Finite.mem_toFinset hf2).mp hρ
  simp only [Set.mem_inter_iff, stripWindow, Set.mem_ofPred_eq] at hmem
  exact h ρ hmem.2.1 hmem.2.2.1

/-- Strip-agreement of multiplicity functions gives equal cumulative critical-line
counts (the line window `lineWindow 0 T` lies on `Re ρ = 1/2` ⊂ the agreement region). -/
theorem countOnCum_congr {m₁ m₂ : ℂ → ℕ} {hfin₁ : WindowFinite m₁} {hfin₂ : WindowFinite m₂}
    (h : ∀ ρ : ℂ, 0 < ρ.re → ρ.re < 1 → m₁ ρ = m₂ ρ) (T : ℝ) :
    (⟨m₁, hfin₁⟩ : ZeroMult).countOnCum T = (⟨m₂, hfin₂⟩ : ZeroMult).countOnCum T := by
  classical
  have hset : supp m₁ ∩ lineWindow 0 T = supp m₂ ∩ lineWindow 0 T := by
    ext ρ
    simp only [Set.mem_inter_iff, mem_supp_iff, lineWindow, Set.mem_ofPred_eq]
    constructor
    · rintro ⟨hne1, hreeq, him1, him2⟩
      have heq := h ρ (by linarith [hreeq]) (by linarith [hreeq])
      refine ⟨(mem_supp_iff).mpr (fun h0 => hne1 ?_), hreeq, him1, him2⟩
      rw [heq]; exact h0
    · rintro ⟨hne2, hreeq, him1, him2⟩
      have heq := h ρ (by linarith [hreeq]) (by linarith [hreeq])
      refine ⟨(mem_supp_iff).mpr (fun h0 => hne2 ?_), hreeq, him1, him2⟩
      rw [← heq]; exact h0
  have hf1 : (supp m₁ ∩ lineWindow 0 T).Finite := lineFiniteCum hfin₁ T
  have hf2 : (supp m₂ ∩ lineWindow 0 T).Finite := lineFiniteCum hfin₂ T
  have hfe : hf1.toFinset = hf2.toFinset := by
    ext ρ
    simp only [Set.Finite.mem_toFinset, hset]
  unfold ZeroMult.countOnCum
  rw [hfe]
  refine Finset.sum_congr rfl fun ρ hρ => ?_
  have hmem := (Set.Finite.mem_toFinset hf2).mp hρ
  simp only [Set.mem_inter_iff, lineWindow, Set.mem_ofPred_eq] at hmem
  exact h ρ (by linarith [hmem.2.1]) (by linarith [hmem.2.1])

/-! ### (2) The EpsLowerCum transfer -/

/-- The EpsLowerCum statement transfers across strip-agreement of multiplicity
functions (both counts agree by (1); the ε/T₀ witnesses are shared). -/
theorem epsLowerCum_congr {m₁ m₂ : ℂ → ℕ} {hfin₁ : WindowFinite m₁} {hfin₂ : WindowFinite m₂}
    (h : ∀ ρ : ℂ, 0 < ρ.re → ρ.re < 1 → m₁ ρ = m₂ ρ) {c : ℝ}
    (hE : EpsLowerCum ⟨m₂, hfin₂⟩ c) : EpsLowerCum ⟨m₁, hfin₁⟩ c := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := hE ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  rw [countCum_congr h T, countOnCum_congr h T]
  exact hT₀ T hT

/-! ### (3) The imprimitive composition (per member + family) -/

/-- Nontriviality transfers to the primitive associate (`changeLevel_one` +
`changeLevel_primitiveCharacter`). -/
theorem primitiveCharacter_ne_one {N : ℕ} [NeZero N] {ψ : DirichletCharacter ℂ N}
    (hψ : ψ ≠ 1) : ψ.primitiveCharacter ≠ 1 := by
  intro h
  refine hψ ?_
  rw [← DirichletCharacter.changeLevel_primitiveCharacter (χ := ψ), h,
    DirichletCharacter.changeLevel_one]

/-- **The hEχ discharge, per member, ANY level structure**: for every nontrivial
(possibly imprimitive) ψ, the primitive-associate inputs — the audited zeta23 donor
endpoint `ThmEDyadic` and the classical zero-infinitude binder `CountsUnbounded`,
both at `ψ.primitiveCharacter` — give `EpsLowerCum` at 2/3 for ψ itself. Pure
composition: `thmE_dyadic_to_cumulative` (P2-c core, n2-p2c-run8) at the associate +
`eulerStripImmunity_changeLevel` (P2-b, n2-p1-run31) + the transfer (2); the
window-finiteness of ψ is P2-a (`windowFinite_LFunction`, run 26). -/
theorem epsLowerCum_of_thmE {N : ℕ} [NeZero N] {ψ : DirichletCharacter ℂ N}
    (hψ : ψ ≠ 1)
    (hUnb : @CountsUnbounded (ψ.conductor) (⟨DirichletCharacter.conductor_ne_zero ψ⟩)
      ψ.primitiveCharacter (@windowFinite_LFunction (ψ.conductor)
        (⟨DirichletCharacter.conductor_ne_zero ψ⟩) ψ.primitiveCharacter
        (primitiveCharacter_ne_one hψ)))
    (hE : @ThmEDyadic (ψ.conductor) (⟨DirichletCharacter.conductor_ne_zero ψ⟩) ψ.primitiveCharacter) :
    EpsLowerCum ⟨multOf ψ.LFunction, windowFinite_LFunction hψ⟩ (2 / 3) := by
  haveI : NeZero (ψ.conductor) := ⟨DirichletCharacter.conductor_ne_zero ψ⟩
  have hprimne : ψ.primitiveCharacter ≠ 1 := primitiveCharacter_ne_one hψ
  have hcond : 1 < ψ.conductor := by
    have hc0 : ψ.conductor ≠ 0 := DirichletCharacter.conductor_ne_zero ψ
    have hc1 : ψ.conductor ≠ 1 := fun hc =>
      hψ (DirichletCharacter.eq_one_iff_conductor_eq_one.mpr hc)
    omega
  have himm : ∀ ρ : ℂ, 0 < ρ.re → ρ.re < 1 →
      multOf ψ.LFunction ρ = multOf (ψ.primitiveCharacter).LFunction ρ := by
    have h0 := eulerStripImmunity_changeLevel (ψ.conductor_dvd_level)
      ψ.primitiveCharacter hprimne
    rw [DirichletCharacter.changeLevel_primitiveCharacter (χ := ψ)] at h0
    exact h0
  exact epsLowerCum_congr himm
    (thmE_dyadic_to_cumulative hprimne hcond
      (DirichletCharacter.primitiveCharacter_isPrimitive (χ := ψ))
      (windowFinite_LFunction hprimne) hUnb hE)

/-- **The P3-e hEχ slot discharge, family form**: every nontrivial family member's
cumulative 2/3 proportion follows from the per-primitive-associate inputs — exactly
the `ComponentEpsCum` card `ZetaLRatTwoThirdsOfDZDF` consumes as its hEχ premise.
With this, SLOT-1's hEχ premise is dischargeable outright; the remaining named
binders per member are the donor endpoint (ThmEDyadic, zeta23) and the classical
zero-infinitude (CountsUnbounded, Titchmarsh §5.8/Davenport ch. 9). -/
theorem componentEpsCum_of_thmE {n : ℕ} {q : Fin n → ℕ} (hN : ∀ i, NeZero (q i))
    (ψ : (i : Fin n) → DirichletCharacter ℂ (q i)) (hne : ∀ i, ψ i ≠ 1)
    (hUnb : ∀ i, @CountsUnbounded ((ψ i).conductor) (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩)
      (ψ i).primitiveCharacter (@windowFinite_LFunction ((ψ i).conductor)
        (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩) (ψ i).primitiveCharacter
        (primitiveCharacter_ne_one (hne i))))
    (hE : ∀ i, @ThmEDyadic ((ψ i).conductor) (⟨DirichletCharacter.conductor_ne_zero (ψ i)⟩)
      (ψ i).primitiveCharacter) :
    ComponentEpsCum hN ψ hne := fun i => epsLowerCum_of_thmE (hne i) (hUnb i) (hE i)

end CrossMath.Pilot75N2

-- audit (expect triad only, 0 sorryAx)
#print axioms CrossMath.Pilot75N2.countCum_congr
#print axioms CrossMath.Pilot75N2.countOnCum_congr
#print axioms CrossMath.Pilot75N2.epsLowerCum_congr
#print axioms CrossMath.Pilot75N2.primitiveCharacter_ne_one
#print axioms CrossMath.Pilot75N2.epsLowerCum_of_thmE
#print axioms CrossMath.Pilot75N2.componentEpsCum_of_thmE
