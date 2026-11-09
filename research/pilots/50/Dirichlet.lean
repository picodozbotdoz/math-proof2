/-
Pilot 50, M2a addendum — Dirichlet binder shell for strip confinement.

Extends research/pilots/50/ (blueprint §1 M2, Dirichlet-family bullet). Same conditional
posture as M1: the openai Dirichlet quasi-RH statement enters as binder `hQRHχ`; the FE
reflection is NOT available at the LFunction level in mathlib, so it enters as the explicit
binder `hFEχ`.

Binder deltas from the openai challenge form (recorded honestly):
  * openai `DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`
    (openai-math lean/ComparatorChallenges/DirichletSevenEighths.lean:8–13) is
    `{q : ℕ} [NeZero q] (χ : DirichletCharacter ℂ q) {s : ℂ}
     (hs : (7 / 8 : ℝ) < s.re) (hpole : ¬ (χ = 1 ∧ s = 1)) : LFunction χ s ≠ 0`.
    The binders below carry the instance explicitly (`inst : NeZero q`) and apply
    `DirichletCharacter.LFunction` via `@` — nested instance binders in hypothesis ∀-types
    are not consulted for class synthesis during binder-type elaboration (pilot runs 2–3),
    and `LFunction` lives under `variable {N : ℕ} [NeZero N]`
    (Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:50,60), so the explicit route
    is the deterministic one. Logically inert.
  * `hFEχ` ~ the reflection the missing product-form Dirichlet FE would prove: zeros
    propagate ρ ↦ 1 − ρ across χ → χ⁻¹ (the inverse character — the FE's natural partner,
    cf. `DirichletCharacter.IsPrimitive.completedLFunction_one_sub`,
    DirichletContinuation.lean:291, which relates χ at 1−s to χ⁻¹ at s).
-/
import Mathlib

namespace CrossMath.Pilot50.Dirichlet

open DirichletCharacter

/-- **M2a shell.** Strip confinement for primitive Dirichlet L-functions, conditional on
(i) the openai Dirichlet quasi-RH half-plane and (ii) the FE reflection ρ ↦ 1 − ρ across
characters χ → χ⁻¹ (binder; the missing mathlib decl is `DirichletCharacter.
LFunction_one_sub`, a product-form analogue of `riemannZeta_one_sub`,
RiemannZeta.lean:178 — see blueprint §M2a addendum).
Right half: the `hQRHχ` binder at `ρ` (pole excluded by `ρ ≠ 1`, from `ρ.re < 1`).
Left half: `hFEχ` makes `1 − ρ` a zero of `L(·, χ⁻¹)`; `(1 - ρ).re = 1 - ρ.re > 7/8`, so the
binder at `χ⁻¹` (pole excluded since `(1 - ρ).re < 1`, i.e. `ρ ≠ 0`, from `0 < ρ.re`)
contradicts it. -/
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
    push Not at h
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
    push Not at h
    exact hQRHχ q inferInstance χ ρ (by linarith) (fun hp => hρne1 hp.2) hzero

#print axioms strip_confinement_dirichlet

end CrossMath.Pilot50.Dirichlet
