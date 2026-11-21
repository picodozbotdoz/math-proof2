/-
STATEMENT-TIER CHECKPOINT PROBE — the Ξ_K′ proportion family
(dossier-40 T3 = candidates/40-zeta-k-prime-derivative-zeros.md; iter-7 census
Tier-1 #1 = novelty/iter7-seed-census-DRAFT.md).

NOT A PROOF ARTIFACT (probe convention, research/AGENTS.md): every proof body
below is `sorry`; this file prices STATEMENT elaboration only. Nothing here is
a proof claim; results are elaboration verdicts.

The gate being priced (the census's own wording): "the ζ_K functional-equation
analog of the window calculus is the unknown". Layers:

  A (object)  the assembly Ξ_χ(s) = s(s−1)·Λ₀(s)·Λ_χ(s) + 1 over MATHLIB'S OWN
              completed L-functions (completedRiemannZeta₀,
              DirichletCharacter.completedLFunction) — zero donor imports; the
              K-instantiation (tauceti fundamentalDiscriminantChar completion)
              is the dossier's glue item, NOT part of this probe.
  B (counts)  the zeta23 XiPrime counting idiom mirrored for Ξ_χ′:
              analyticOrderAt multiplicity, ∑ᶠ over window zero-sets, ncard
              distinct (Zeta23/XiPrime/Defs.lean:40–62 idiom).
  C (binders) the engine consumables as explicit Prop binders — the schema the
              K-window-calculus must eventually discharge: hSymm (the T1
              reflection / root-number-+1 symmetry), hRVM (the RvM-class
              denominator asymptotic), hEF (the windowed explicit formula at a
              κ-profile, flat + quartic shapes), hSeam (off-diagonal control).
  D (targets) the two headline proportion statements at the proved ζ-side
              constants (0.85838/0.92919 flat; 0.86864/0.93432 quartic), plus
              the T1/T2 statements from the dossier.

Expected sorry count: 6 (t1_assembly, t2_speiser, headline_flat, headline_flat_
cumulative, headline_quartic, headline_quartic_cumulative). Elaboration SUCCESS
= errors 0 with exactly the expected sorries.

RUN HISTORY (2026-11-21, 6 runs, logs/probe40-run{1..6}.log; run6 = FINAL,
errors=0 sorry=6-expected): the four fix classes that took the file to
GREEN-shape are gate-pricing data — (1) `completedLFunction` lives in namespace
`DirichletCharacter` (root-name resolution fails); (2) it needs `[NeZero N]` in
scope (the missing instance silently drops the auto-bound χ); (3) the counting
trio is NONCOMPUTABLE at statement tier (`analyticOrderAt`, the membership-∑ᶠ =
`finsum`, `Set.ncard`); (4) scoped-notation gaps (`𝓝`, `Filter.Tendsto`) under
the minimal import set.
-/
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.DirichletContinuation
import Mathlib.Analysis.Analytic.Order
import Mathlib.Analysis.Calculus.LogDeriv

open scoped BigOperators Filter
open Complex Set Filter

namespace XiKPrimeProbe

variable {N : ℕ} [NeZero N] (χ : DirichletCharacter ℂ N)

/-! ## Layer A — the object (dossier-40's assembly, mathlib-only instantiation) -/

/-- `Ξ_χ(s) := s(s−1)·Λ₀(s)·Λ_χ(s) + 1` — the K-assembly of dossier-40 with mathlib's
own Dirichlet completion standing in for tauceti's quadratic one. Entire-ness,
value-at-0/1, and symmetry are NOT assumed here; they are the binders below. -/
noncomputable def XiChi (s : ℂ) : ℂ :=
  s * (s - 1) * completedRiemannZeta₀ s * DirichletCharacter.completedLFunction χ s + 1

/-- `Ξ_χ′ := deriv Ξ_χ` (mirrors `Zeta23.XiPrime.xiDeriv`, Defs.lean:32). -/
noncomputable def XiChiDeriv : ℂ → ℂ := deriv (XiChi χ)

/-! ## Layer B — the counting idiom (mirror of Zeta23/XiPrime/Defs.lean:40–62) -/

def IsXiChiDerivZero (ρ : ℂ) : Prop := XiChiDeriv χ ρ = 0

noncomputable def xiChiDerivMult (ρ : ℂ) : ℕ := (analyticOrderAt (XiChiDeriv χ) ρ).toNat

def zerosIn (T₁ T₂ : ℝ) : Set ℂ :=
  {ρ | IsXiChiDerivZero χ ρ ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

/-- Denominator: zeros of `Ξ_χ′` in the window, counted with multiplicity. -/
noncomputable def Ncount (T₁ T₂ : ℝ) : ℕ := ∑ᶠ ρ ∈ zerosIn χ T₁ T₂, xiChiDerivMult χ ρ

/-- Distinct count. -/
noncomputable def Ndist (T₁ T₂ : ℝ) : ℕ := (zerosIn χ T₁ T₂).ncard

/-- Simple zeros on the critical line. -/
noncomputable def N0simple (T₁ T₂ : ℝ) : ℕ :=
  (zerosIn χ T₁ T₂ ∩ {ρ | ρ.re = 1 / 2 ∧ xiChiDerivMult χ ρ = 1}).ncard

/-! ## Layer C — the window-calculus binder schema (the GATE, as explicit Props) -/

/-- The engine consumables as binders. `hSymm` = the T1 reflection (root number +1);
`hRVM` = the denominator asymptotic (mirror of `xiDerivZeros₀_rvm`);
`hEF` = the windowed explicit formula at a κ-profile (mirror of the engine's
`XiEF` + `Final.lean` Thm-8.2-at-λ shape); `hSeam` = off-diagonal control
(mirror of the engine's seam term). -/
structure WindowCalculus (χ : DirichletCharacter ℂ N) where
  /-- T1: the completed assembly is symmetric about the critical line. -/
  hSymm : ∀ s : ℂ, XiChi χ (1 - s) = XiChi χ s
  /-- Denominator asymptotic: N_Ξχ′(T,2T) ~ c·T·log T with c > 0. -/
  hRVM : ∃ c : ℝ, 0 < c ∧
    Tendsto (fun T : ℝ ↦ (Ncount χ T (2 * T) : ℝ) / (T * Real.log T)) atTop (Filter.nhds c)
  /-- Windowed explicit formula at the κ-profile: the flat-family Thm-8.2-at-λ shape
  (2 − κ(λ) − ε)·N ≤ N⁰ˢ and (3/2 − κ(λ)/2 − ε)·N ≤ N_d for all large T. -/
  hEF : ∃ kappa : ℝ → ℝ, ∀ lam : ℝ, 0 < lam → lam < 1 →
    ∃ T₀ : ℝ, ∀ T ≥ T₀, ∀ ε > 0,
      (2 - kappa lam - ε) * (Ncount χ T (2 * T) : ℝ) ≤ (N0simple χ T (2 * T) : ℝ) ∧
      (3 / 2 - kappa lam / 2 - ε) * (Ncount χ T (2 * T) : ℝ) ≤ (Ndist χ T (2 * T) : ℝ)
  /-- Seam control: the off-diagonal window term is o(N). -/
  hSeam : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀,
    (Ncount χ T (2 * T) : ℝ) - (N0simple χ T (2 * T) : ℝ)
      + ((Ncount χ T (2 * T) : ℝ) - (Ndist χ T (2 * T) : ℝ)) ≤ ε * (Ncount χ T (2 * T) : ℝ)

/-! ## Layer D — the target statements (dossier-40 T1/T2/T3 shapes) -/

/-- T1 structure slice (assembly endpoints). -/
theorem t1_assembly : XiChi χ 0 = 1 ∧ XiChi χ 1 = 1 := by
  sorry -- PROBE

/-- T2 (Speiser-type, provable core): Re(Ξ_χ′/Ξ_χ) > 0 on Re s ≥ 1, s ≠ 1. -/
theorem t2_speiser : ∀ s : ℂ, 1 ≤ s.re → s ≠ 1 → 0 < Complex.re (XiChiDeriv χ s / XiChi χ s) := by
  sorry -- PROBE

/-- T3 headline, flat window: ≥ 85.838 % simple-and-on-line, ≥ 92.919 % distinct —
the composition consuming the binder schema. -/
theorem xiKprime_flat (W : WindowCalculus χ) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (0.85838 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (N0simple χ T (2 * T) : ℝ) ∧
      (0.92919 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (Ndist χ T (2 * T) : ℝ) := by
  sorry -- PROBE

theorem xiKprime_flat_cumulative (W : WindowCalculus χ) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (0.85838 : ℝ) * (Ncount χ 0 T : ℝ) ≤ (N0simple χ 0 T : ℝ) ∧
      (0.92919 : ℝ) * (Ncount χ 0 T : ℝ) ≤ (Ndist χ 0 T : ℝ) := by
  sorry -- PROBE

/-- T3 headline, quartic window: ≥ 86.864 % / ≥ 93.432 %. -/
theorem xiKprime_quartic (W : WindowCalculus χ) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (0.86864 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (N0simple χ T (2 * T) : ℝ) ∧
      (0.93432 : ℝ) * (Ncount χ T (2 * T) : ℝ) ≤ (Ndist χ T (2 * T) : ℝ) := by
  sorry -- PROBE

theorem xiKprime_quartic_cumulative (W : WindowCalculus χ) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (0.86864 : ℝ) * (Ncount χ 0 T : ℝ) ≤ (N0simple χ 0 T : ℝ) ∧
      (0.93432 : ℝ) * (Ncount χ 0 T : ℝ) ≤ (Ndist χ 0 T : ℝ) := by
  sorry -- PROBE

end XiKPrimeProbe
