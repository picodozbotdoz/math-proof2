/-
Statement elaboration probe — NOT A PROOF ARTIFACT.
R1 first-run probe (dossier 50, route R1 pre-staged 2026-11-14, NOT RUN — executed first
on G7b PASS per R1-prework.md §5). Elaborates inside the donor workspace built by
run_r1.sh (pruned OAI Nonvanishing closure at the donor pin v4.34.1 / mathlib d13f23b7).
Three jobs, in order of what can kill R1:
  (1) donor hygiene from the consumer side — `#print axioms` of both 7/8 headlines and
      both delegation roots (re-confirms A7's G7b in the exact tree R1 consumes);
  (2) the donor-pin API friction checks for the ported M1/M2a core — `riemannZeta_one_sub`
      presence/shape (expected present, pre-v4.34 API), `riemannZetaZeros` vocabulary,
      `not_le.mp`, Dirichlet `LFunction`/`IsPrimitive`/`χ⁻¹` — each as `#check`/`example`;
  (3) the two R1 discharges as anonymous-constructor `example`s — the definitional
      binder-to-donor step, independent of the rest of R1.lean.
Results are elaboration verdicts, never proof claims. No sorry needed.
-/
import OAI.NumberTheory.DirichletL.Nonvanishing
import Mathlib

/-! ## (1) Donor hygiene (consumer side) -/

#print axioms OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re
#print axioms OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re
#print axioms OAI.SevenEighths.ProbeFinalAssemblyUnconditional.zeta_nonzero
#print axioms OAI.SevenEighths.ProbeFinalAssemblyUnconditional.dirichlet_nonzero

#check @OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re
#check @OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re

/-! ## (2) Donor-pin API friction checks for the ported core -/

-- FE lemma presence + shape (R1-prework.md §4 friction-2; fallbacks listed there)
#check @riemannZeta_one_sub

example (s : ℂ) (h : ∀ n : ℕ, s ≠ -(n : ℂ)) (h' : s ≠ 1)
    (hz : riemannZeta s = 0) : riemannZeta (1 - s) = 0 := by
  have hFE := riemannZeta_one_sub h h'
  rw [hz, mul_zero] at hFE
  exact hFE

-- the `push Not` → `not_le.mp` re-core
example (a b : ℝ) (h : ¬ a ≤ b) : b < a := not_le.mp h

-- mathlib zero vocabulary (M1 `_mem`/`_set` forms)
#check @mem_riemannZetaZeros
example (z : ℂ) (hz : z ∈ riemannZetaZeros) : riemannZeta z = 0 :=
  mem_riemannZetaZeros.mp hz

-- Dirichlet vocabulary at the donor pin
#check @DirichletCharacter.LFunction
#check @DirichletCharacter.IsPrimitive
noncomputable example (q : ℕ) [NeZero q] (χ : DirichletCharacter ℂ q) : DirichletCharacter ℂ q := χ⁻¹

/-! ## (3) The two R1 discharges, standalone -/

example : ∀ s : ℂ, (7 / 8 : ℝ) < s.re → riemannZeta s ≠ 0 :=
  fun s hs => OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re hs

example (q : ℕ) (inst : NeZero q) (χ : DirichletCharacter ℂ q) (s : ℂ)
    (hs : (7 / 8 : ℝ) < s.re) (hpole : ¬ (χ = 1 ∧ s = 1)) :
    @DirichletCharacter.LFunction q inst χ s ≠ 0 :=
  @OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re q inst χ s hs hpole
