/-
M1 pilot — dossier 50 (quasi-rh-truncated-window-constants), survivor S1a:
the conditional strip-confinement theorem, sorry-free, zero ports.

Posture (research/pilots/50-blueprint.md §1): the openai quasi-RH statement enters as ONE
explicit hypothesis binder (hQRH, the verbatim challenge form, which elaborates standalone
against v4.36 per research/feasibility/port-probe.md §7.3 run 3); the functional-equation
reflection is PROVED here from mathlib's `riemannZeta_one_sub` — mathlib's FE is sufficient
(blueprint §1 inventory), so no `hFE` binder is needed and no conjugation symmetry is used:
zeros propagate ρ ↦ 1 − ρ, and only real parts enter.

Provenance of mirrored shapes (read-only donors):
  * `IsNontrivialZeroP50` ~ zeta23 `IsNontrivialZero`
    (riemannZeta ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1; anthropics_formal-math/zeta23/Zeta23/Defs.lean,
    per research/survey/anthropics.md §1.3; defined locally — zeta23 is v4.33, unportable here)
  * `hQRH` binder      ~ openai `riemannZeta_ne_zero_of_seven_eighths_lt_re`, challenge form
    (openai-math lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:5–7, imports only
    Mathlib; library proof at OAI/NumberTheory/DirichletL/Nonvanishing.lean:29)
  * mathlib zero vocabulary: `riemannZetaZeros` (Mathlib/NumberTheory/LSeries/ZetaZeros.lean:33),
    `mem_riemannZetaZeros` (:37)
  * FE (proved ingredient): `riemannZeta_one_sub`
    (Mathlib/NumberTheory/LSeries/RiemannZeta.lean:178–180:
      riemannZeta (1 - s) = 2 * (2*π)^(-s) * Gamma s * cos (π*s/2) * riemannZeta s
    with hypotheses `∀ n : ℕ, s ≠ -n`, `s ≠ 1`; both discharged here from `0 < ρ.re`).
-/
import Mathlib

namespace CrossMath.Pilot50

open Complex

/-- Nontrivial zero of ζ, in the exact shape of zeta23's `IsNontrivialZero`. -/
def IsNontrivialZeroP50 (ρ : ℂ) : Prop :=
  riemannZeta ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1

/-- **M1 headline (S1a).** Strip confinement: assuming the openai quasi-RH half-plane
(binder `hQRH`, verbatim challenge form), every nontrivial zero `ρ` of the Riemann zeta
function satisfies `1/8 ≤ Re ρ ≤ 7/8`.

Right half: the binder itself (contrapositive at `ρ`).
Left half: mathlib's functional equation at `ρ` gives `riemannZeta (1 - ρ) = 0` (the RHS
carries the factor `riemannZeta ρ = 0`); since `(1 - ρ).re = 1 - ρ.re > 7/8` when
`ρ.re < 1/8`, the binder at `1 - ρ` contradicts that zero. -/
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
    push Not at h
    have hre : (7 / 8 : ℝ) < (1 - ρ).re := by
      have h1 : (1 - ρ).re = 1 - ρ.re := by simp
      rw [h1]
      linarith
    exact hQRH (1 - ρ) hre hFE
  · by_contra h
    push Not at h
    exact hQRH ρ (by linarith) hzero

/-- Mathlib-vocabulary form: every member of `riemannZetaZeros` inside the open strip
lies in the closed box `[1/8, 7/8]` of the real axis. -/
theorem strip_confinement_mem
    (hQRH : ∀ s : ℂ, (7 / 8 : ℝ) < s.re → riemannZeta s ≠ 0)
    {z : ℂ} (hz : z ∈ riemannZetaZeros) (hpos : 0 < z.re) (hlt : z.re < 1) :
    1 / 8 ≤ z.re ∧ z.re ≤ 7 / 8 :=
  strip_confinement hQRH ⟨mem_riemannZetaZeros.mp hz, hpos, hlt⟩

/-- zeta23-window form (S1a "box confinement"): the strip-restricted zero set is contained
in the closed box — the statement the zeta23 `ZeroConfig`/`zerosIn` vocabulary would consume
(`zerosIn T₁ T₂`, zeta23 Zeta23/Statement.lean:46, is this set further cut by a height
window). -/
theorem strip_confinement_set
    (hQRH : ∀ s : ℂ, (7 / 8 : ℝ) < s.re → riemannZeta s ≠ 0) :
    riemannZetaZeros ∩ {z : ℂ | 0 < z.re ∧ z.re < 1} ⊆ {z : ℂ | 1 / 8 ≤ z.re ∧ z.re ≤ 7 / 8} := by
  intro z hz
  obtain ⟨hz', hpos, hlt⟩ := hz
  exact strip_confinement_mem hQRH hz' hpos hlt

#print axioms strip_confinement

end CrossMath.Pilot50
