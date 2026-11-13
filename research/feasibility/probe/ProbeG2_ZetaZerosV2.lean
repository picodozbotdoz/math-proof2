/-
Statement elaboration probe — not a proof artifact.
Probe G2 (axiommath donor round, 2026-11-13): ZetaZerosV2 (Lamzouri) donor hygiene and
direct-import check. This file is elaborated INSIDE the built ZetaZerosV2 lake tree on Modal
(app crossmath-gprobe, function g2 — same build as axiommath-bump v2-run9: mathlib ff2494ea,
toolchain v4.36.0-rc2, PrimeNumberTheoremAnd redirected to the bumped local clone), so the
donor's own imports resolve and `#print axioms` reports on the real donor environment.
Sources (read-only donor, /home/doz/zcode-workdir/axiommath/ZetaZerosV2 @ dev/claude):
- ZetaZeros/Main.lean:47 simple_proportion_lower, :88 distinct_proportion_lower,
  :130 simple_proportion_d4, :149 distinct_proportion_d5.
- ZetaZeros/NumericProportions.lean:29 average_proportion_d5, :47 simpleOrOnLine_proportion_d4.
- ZetaZeros/Numeric/SimpleOrOnLine.lean:38 sqrt_two_gt, :44 cos_inv_sqrt_two_gt,
  :81 montgomeryTaylorConst_gt, :101 simpleOrOnLineProportion_gt.
- ZetaZeros/ZeroCount/RiemannVonMangoldt.lean (riemannVonMangoldt.tendsto et al.).
- Challenge/Basic.lean counting defs (nontrivialZeros, zeroMultiplicity, zeroCount, …).
The `sorry` in the wrapper is probe scaffolding; the `#print axioms` lines are donor hygiene
(triad-only = consumable; anything beyond propext/Quot.sound/Classical.choice = bind-to-clean-
layer-only). Results are elaboration verdicts, never proof claims.
-/
import ZetaZeros.Main
import ZetaZeros.NumericProportions
import ZetaZeros.Numeric.SimpleOrOnLine

open ZetaZeros

/-! ## Donor hygiene: axiom audit of the headline theorems -/

#print axioms ZetaZeros.simple_proportion_lower
#print axioms ZetaZeros.distinct_proportion_lower
#print axioms ZetaZeros.simple_proportion_d4
#print axioms ZetaZeros.distinct_proportion_d5
#print axioms ZetaZeros.average_proportion_d5
#print axioms ZetaZeros.simpleOrOnLine_proportion_d4
#print axioms ZetaZeros.simpleOrOnLineProportion_gt

/- The numeric input layer (norm_num/nlinarith, no native_decide expected). -/
#print axioms ZetaZeros.sqrt_two_gt
#print axioms ZetaZeros.cos_inv_sqrt_two_gt
#print axioms ZetaZeros.montgomeryTaylorConst_gt

/- The Riemann–von Mangoldt main term (the heavy analytic input): the bundled statement
`ZetaZeros.riemannVonMangoldt` (ZeroCount/RiemannVonMangoldt.lean:465) and its derived
forms (Zeta/Asymptotics.lean:61, :96). -/ (run-3 lesson: doc-comments cannot attach to #print commands)
#print axioms ZetaZeros.riemannVonMangoldt
#print axioms ZetaZeros.RiemannVonMangoldt.tendsto
#print axioms ZetaZeros.RiemannVonMangoldt.zeroCount_pos_eventually

/-! ## Direct-import signature checks (the pilot's consumption surface) -/

#check @ZetaZeros.simple_proportion_lower
#check @ZetaZeros.distinct_proportion_lower
#check @ZetaZeros.simple_proportion_d4
#check @ZetaZeros.distinct_proportion_d5
#check @ZetaZeros.montgomeryTaylorConst
#check @ZetaZeros.nontrivialZeros
#check @ZetaZeros.zeroCount
#check @ZetaZeros.simpleOnLineCount
#check @ZetaZeros.distinctZeroCount

/-! ## Hypothesis-binder forms (pilot-consumption shape; EnclOK / ProbeE precedent),
using the DONOR's own counting defs (direct-import route validated end-to-end). -/

/-- Lamzouri Theorem 1.1 (i): > 2/3 of ζ zeros simple and on the line — statement body
verbatim from ZetaZeros/Main.lean:47-50. -/
def HypLamzouriSimple : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ T₀ : ℝ, ∀ T ≥ T₀,
      3 / 2 - (1 / Real.sqrt 2) * Real.cot (1 / Real.sqrt 2) - ε <
        (simpleOnLineCount T : ℝ) / (zeroCount T : ℝ)

/-- Lamzouri Theorem 1.1 (ii): > 83.6% distinct — statement body verbatim from
ZetaZeros/Main.lean:88-91. -/
def HypLamzouriDistinct : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ T₀ : ℝ, ∀ T ≥ T₀,
      5 / 4 - (1 / (2 * Real.sqrt 2)) * Real.cot (1 / Real.sqrt 2) - ε <
        (distinctZeroCount T : ℝ) / (zeroCount T : ℝ)

/-- Numeric decimal forms (Main.lean:130 / :149 bodies). -/
def HypLamzouriSimpleNumeric : Prop :=
  ∃ T₀ : ℝ, ∀ T ≥ T₀, 0.6725 < (simpleOnLineCount T : ℝ) / (zeroCount T : ℝ)

def HypLamzouriDistinctNumeric : Prop :=
  ∃ T₀ : ℝ, ∀ T ≥ T₀, 0.83625 < (distinctZeroCount T : ℝ) / (zeroCount T : ℝ)

/-- Binder-consumption pattern (trivial; validates the conditional-theorem shape). -/
theorem conditional_shape (h₁ : HypLamzouriSimple) (h₂ : HypLamzouriDistinct) :
    HypLamzouriSimple ∧ HypLamzouriDistinct := ⟨h₁, h₂⟩

/-- The hypothesis-binder bridge: from the donor's own theorem to the hypothesis type —
trivial here (same shapes), but exercises the exact consumption a pilot lane performs.
Proof is sorry'd probe scaffolding; NOT a proof artifact. -/
theorem hyp_of_donor : HypLamzouriSimple := by
  sorry
