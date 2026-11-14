/-
R1 — dossier 50 (quasi-rh-truncated-window-constants), route R1: the openai in-corpus 7/8
discharge. **PROOF ARTIFACT — GREEN 2026-11-14** (`research/feasibility/probe/logs-g/
run32-g7-elab.log`: R1.lean OK, 0 errors, 0 sorry; all four landings + both donor theorems
`#print axioms` = [propext, Classical.choice, Quot.sound]). Elaborated inside the donor's
pruned Nonvanishing closure built at the donor pin (v4.34.1 / mathlib d13f23b7) as cached
Modal image layers (`feasibility/probe/g7_layers.py`); G7b donor audit PASS in the same run.

Posture: pilot 50's M1/M2a binders (`hQRH`, `hQRHχ`) were transcribed from the openai
challenge forms; R1 DISCHARGES both from the donor's own proved theorems, imported
directly — the 2,924-file Nonvanishing closure built at the DONOR pin (toolchain
v4.34.1, mathlib d13f23b7), per the G7/g7 substrate pattern. This file therefore
elaborates inside the donor workspace (run_r1.sh), NOT against our v4.36 pin.

Donor statements (read-only, /home/doz/zcode-workdir/openai-math/lean):
  * `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
    (OAI/NumberTheory/DirichletL/Nonvanishing.lean:29) — the ζ side.
  * `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`
    (Nonvanishing.lean:19) — the Dirichlet side.
Both delegate to `SevenEighths.ProbeFinalAssemblyUnconditional.{zeta,dirichlet}_nonzero`;
G7b (PASS pending) certifies the whole delegation closure = [propext, Classical.choice,
Quot.sound] only.

What lands (this file): `strip_confinement_seven_eighths` — UNCONDITIONAL: every
nontrivial zero ρ of the Riemann zeta function satisfies 1/8 ≤ Re ρ ≤ 7/8, no
hypotheses; the `_mem_seven_eighths`/`_set_seven_eighths` vocabulary forms; and
`strip_confinement_dirichlet_seven_eighths_of_FE` — the Dirichlet strip at full 7/8,
conditional ONLY on `hFEχ` (the missing product-form Dirichlet FE reflection χ → χ⁻¹;
mathlib gap, unchanged by R1 — DZDF's `heckeFunctionalEquation` is totally-complex-only,
ℚ excluded).

Port notes vs the GREEN v4.36 files (M1.lean / Dirichlet.lean, frozen):
  * the two `push Not at h` sites per file are re-cored as `not_le.mp h` (the v4.36
    tactic name is not assumed present at the donor pin; `not_le` is ancient/stable);
  * `riemannZeta_one_sub` is EXPECTED present at the donor pin (pre-v4.34 API) — first
    probe item (R1probe.lean); fallbacks listed in R1-prework.md §4;
  * everything else carried verbatim.
No sorry, no native_decide, no external CAS.
-/
import OAI.NumberTheory.DirichletL.Nonvanishing
import Mathlib

namespace CrossMath.Pilot50

open Complex

/-- Nontrivial zero of ζ, in the exact shape of zeta23's `IsNontrivialZero` (M1). -/
def IsNontrivialZeroP50 (ρ : ℂ) : Prop :=
  riemannZeta ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1

/-- **M1 core, ported** (proof verbatim from `M1.lean:44` at v4.36 GREEN except the
`push Not` → `not_le.mp` re-core): strip confinement at 7/8 from the quasi-RH binder.
Right half: the binder at `ρ` (contrapositive). Left half: mathlib's functional
equation at `ρ` gives `riemannZeta (1 - ρ) = 0`; since `(1 - ρ).re = 1 - ρ.re > 7/8`
when `ρ.re < 1/8`, the binder at `1 - ρ` contradicts that zero. -/
theorem strip_confinement
    (hQRH : ∀ s : ℂ, (7 / 8 : ℝ) < s.re → riemannZeta s ≠ 0)
    {ρ : ℂ} (hρ : IsNontrivialZeroP50 ρ) :
    1 / 8 ≤ ρ.re ∧ ρ.re ≤ 7 / 8 := by
  obtain ⟨hzero, hpos, hlt⟩ := hρ
  -- `ρ ≠ 1` and `ρ ≠ -n` for every `n : ℕ`, from `0 < ρ.re`
  have hρne1 : ρ ≠ 1 := by
    intro h
    rw [h] at hlt
    exact absurd hlt (by simp)
  have hρneneg : ∀ n : ℕ, ρ ≠ -(n : ℂ) := by
    intro n h
    have hre : ρ.re = -((n : ℕ) : ℝ) := by rw [h]; simp
    linarith
  -- the functional equation at `ρ`, with the zero factored out
  have hFE := riemannZeta_one_sub hρneneg hρne1
  rw [hzero, mul_zero] at hFE
  refine ⟨?_, ?_⟩
  · by_contra h
    have h' : ρ.re < 1 / 8 := not_le.mp h
    have hre : (7 / 8 : ℝ) < (1 - ρ).re := by
      have h1 : (1 - ρ).re = 1 - ρ.re := by simp
      rw [h1]
      linarith
    exact hQRH (1 - ρ) hre hFE
  · by_contra h
    have h' : (7 / 8 : ℝ) < ρ.re := not_le.mp h
    exact hQRH ρ h' hzero

/-- **The R1 ζ-side discharge**: the openai donor theorem in M1's binder shape
(definitional — the binder was transcribed from this very statement). -/
theorem hQRH_seven_eighths (s : ℂ) (hs : (7 / 8 : ℝ) < s.re) : riemannZeta s ≠ 0 :=
  OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re hs

/-- **R1 LANDING (ζ, UNCONDITIONAL)** — every nontrivial zero of the Riemann zeta
function lies in the closed strip `1/8 ≤ Re ρ ≤ 7/8`; the M1 binder is discharged by
the imported donor theorem (constants at full conditional strength; no hypotheses). -/
theorem strip_confinement_seven_eighths
    {ρ : ℂ} (hρ : IsNontrivialZeroP50 ρ) :
    1 / 8 ≤ ρ.re ∧ ρ.re ≤ 7 / 8 :=
  strip_confinement hQRH_seven_eighths hρ

/-- Mathlib-vocabulary form (M1 `strip_confinement_mem` shape), unconditional. -/
theorem strip_confinement_mem_seven_eighths
    {z : ℂ} (hz : z ∈ riemannZetaZeros) (hpos : 0 < z.re) (hlt : z.re < 1) :
    1 / 8 ≤ z.re ∧ z.re ≤ 7 / 8 :=
  strip_confinement hQRH_seven_eighths ⟨mem_riemannZetaZeros.mp hz, hpos, hlt⟩

/-- zeta23-window form (M1 `strip_confinement_set` shape), unconditional. -/
theorem strip_confinement_set_seven_eighths :
    riemannZetaZeros ∩ {z : ℂ | 0 < z.re ∧ z.re < 1} ⊆
      {z : ℂ | 1 / 8 ≤ z.re ∧ z.re ≤ 7 / 8} := by
  intro z hz
  obtain ⟨hz', hpos, hlt⟩ := hz
  exact strip_confinement_mem_seven_eighths hz' hpos hlt

namespace Dirichlet

open DirichletCharacter

/-- **M2a core, ported** (proof verbatim from `Dirichlet.lean:40` at v4.36 GREEN except
the `push Not` → `not_le.mp` re-core): strip confinement for primitive Dirichlet
L-functions at 7/8, conditional on the Dirichlet quasi-RH binder and the FE reflection
binder `hFEχ` (χ → χ⁻¹, ρ ↦ 1 − ρ — the missing product-form Dirichlet FE). -/
theorem strip_confinement_dirichlet
    (hQRHχ : ∀ (q : ℕ) (inst : NeZero q) (χ : DirichletCharacter ℂ q) (s : ℂ),
      (7 / 8 : ℝ) < s.re → ¬ (χ = 1 ∧ s = 1) →
      @DirichletCharacter.LFunction q inst χ s ≠ 0)
    (hFEχ : ∀ (q : ℕ) (inst : NeZero q) (χ : DirichletCharacter ℂ q), χ.IsPrimitive →
      ∀ ρ : ℂ, @DirichletCharacter.LFunction q inst χ ρ = 0 → 0 < ρ.re → ρ.re < 1 →
        @DirichletCharacter.LFunction q inst χ⁻¹ (1 - ρ) = 0)
    (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
    {ρ : ℂ} (hzero : LFunction χ ρ = 0) (hpos : 0 < ρ.re) (hlt : ρ.re < 1) :
    1 / 8 ≤ ρ.re ∧ ρ.re ≤ 7 / 8 := by
  have hρne1 : ρ ≠ 1 := by
    intro h
    rw [h] at hlt
    exact absurd hlt (by simp)
  refine ⟨?_, ?_⟩
  · by_contra h
    have h' : ρ.re < 1 / 8 := not_le.mp h
    have hzero' := hFEχ q inferInstance χ hχ ρ hzero hpos hlt
    have hre : (7 / 8 : ℝ) < (1 - ρ).re := by
      have h1 : (1 - ρ).re = 1 - ρ.re := by simp
      rw [h1]
      linarith
    refine hQRHχ q inferInstance χ⁻¹ (1 - ρ) hre ?_ hzero'
    rintro ⟨_, h1ρ⟩
    have hre1 : (1 - ρ).re = (1 : ℂ).re := congrArg Complex.re h1ρ
    simp at hre1
    linarith
  · by_contra h
    have h' : (7 / 8 : ℝ) < ρ.re := not_le.mp h
    exact hQRHχ q inferInstance χ ρ h' (fun hp => hρne1 hp.2) hzero

/-- **The R1 χ-side discharge**: the openai donor theorem (Dirichlet form) in M2a's
explicit-instance binder shape (definitional; instance bookkeeping per
`Dirichlet.lean:9–19`, logically inert). -/
theorem hQRHχ_seven_eighths (q : ℕ) (inst : NeZero q) (χ : DirichletCharacter ℂ q)
    (s : ℂ) (hs : (7 / 8 : ℝ) < s.re) (hpole : ¬ (χ = 1 ∧ s = 1)) :
    @DirichletCharacter.LFunction q inst χ s ≠ 0 :=
  @OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re q inst χ s hs hpole

/-- **R1 LANDING (Dirichlet, single binder)** — the Dirichlet strip at FULL 7/8,
conditional only on `hFEχ` (the honest mathlib gap; unchanged by R1). -/
theorem strip_confinement_dirichlet_seven_eighths_of_FE
    (hFEχ : ∀ (q : ℕ) (inst : NeZero q) (χ : DirichletCharacter ℂ q), χ.IsPrimitive →
      ∀ ρ : ℂ, @DirichletCharacter.LFunction q inst χ ρ = 0 → 0 < ρ.re → ρ.re < 1 →
        @DirichletCharacter.LFunction q inst χ⁻¹ (1 - ρ) = 0)
    (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) (hχ : χ.IsPrimitive)
    {ρ : ℂ} (hzero : LFunction χ ρ = 0) (hpos : 0 < ρ.re) (hlt : ρ.re < 1) :
    1 / 8 ≤ ρ.re ∧ ρ.re ≤ 7 / 8 :=
  strip_confinement_dirichlet hQRHχ_seven_eighths hFEχ q χ hχ hzero hpos hlt

end Dirichlet

#print axioms strip_confinement_seven_eighths
#print axioms strip_confinement_mem_seven_eighths
#print axioms strip_confinement_set_seven_eighths
#print axioms Dirichlet.strip_confinement_dirichlet_seven_eighths_of_FE
-- donor hygiene re-confirmed from the consumer side (complements A7's G7b):
#print axioms OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re
#print axioms OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re

end CrossMath.Pilot50
