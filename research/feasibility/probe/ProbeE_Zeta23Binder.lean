/-
Statement elaboration probe — not a proof artifact.
Probe E (round 4): zeta23 submitted A–D theorem statements restated as HYPOTHESIS-BINDER
TYPES — the conditional-theorem shape lane R1's pilot-42 M1 consumes (hA : HypA etc.).
Definitions copied verbatim from the donor's trusted statement layer (read-only):
ChallengeDeps.lean:36-87 (IsNontrivialZero/zeroMult/zerosIn/Ncount/Ndist/N0star/N0simple,
wholesale `import Mathlib` as there) and :106 (cMT). Statement bodies verbatim from
Challenge.lean:131 (A), :145 (B mult), :157 (C), :163 (D). Types only — no sorries needed;
the two wrapper theorems validate the binder-consuming pattern trivially (not results).
-/
import Mathlib

noncomputable section

open scoped BigOperators ComplexConjugate
open Complex Set

namespace ProbeZeta23

def IsNontrivialZero (ρ : ℂ) : Prop := riemannZeta ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1

def zeroMult (ρ : ℂ) : ℕ := (analyticOrderAt riemannZeta ρ).toNat

def zerosIn (T₁ T₂ : ℝ) : Set ℂ := {ρ | IsNontrivialZero ρ ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

def Ncount (T₁ T₂ : ℝ) : ℕ := ∑ᶠ ρ ∈ zerosIn T₁ T₂, zeroMult ρ

def Ndist (T₁ T₂ : ℝ) : ℕ := (zerosIn T₁ T₂).ncard

def N0star (T₁ T₂ : ℝ) : ℕ := (zerosIn T₁ T₂ ∩ {ρ | ρ.re = 1 / 2}).ncard

def N0simple (T₁ T₂ : ℝ) : ℕ :=
  (zerosIn T₁ T₂ ∩ {ρ | ρ.re = 1 / 2} ∩ {ρ | zeroMult ρ = 1}).ncard

/-- The Montgomery–Taylor constant c₁* — ChallengeDeps.lean:106. -/
def cMT : ℝ :=
  Real.sqrt 2 * Real.tan (1 / Real.sqrt 2) / (1 + 1 / Real.sqrt 2 * Real.tan (1 / Real.sqrt 2))

/-- Theorem A as a hypothesis type (Challenge.lean:131 / Zeta23.Final.thmA shape). -/
def HypA : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀, (2 / 3 - ε) * (Ncount T (2 * T) : ℝ) ≤ N0star T (2 * T)

/-- Theorem B (simple + on line, with multiplicity numerator) — Challenge.lean:145 shape. -/
def HypB_mult : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀, (2 / 3 - ε) * (Ncount T (2 * T) : ℝ) ≤ N0simple T (2 * T)

/-- Theorem C (distinct) — Challenge.lean:157 shape. -/
def HypC_mult : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀, (5 / 6 - ε) * (Ncount T (2 * T) : ℝ) ≤ Ndist T (2 * T)

/-- Theorem D (optimal Montgomery–Taylor window) — Challenge.lean:163 shape. -/
def HypD : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀, (2 - 1 / cMT - ε) * (Ncount T (2 * T) : ℝ) ≤ N0star T (2 * T)

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape). -/
theorem conditional_shape (hA : HypA) (hD : HypD) : HypA ∧ HypD := ⟨hA, hD⟩

end ProbeZeta23
