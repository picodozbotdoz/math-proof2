/-
  Pilot 11, tranche T1 — statement transcript (defs only, no proofs).
  Verbatim from 3sum-apsp (donor /home/doz/zcode-workdir/anthropics_formal-math/3sum-apsp,
  read-only; Lean v4.33.1 original), transcribed for mathlib v4.36.0-rc2 elaboration:
    * DetTimeModel            ThreeSumApsp/TimeClaims/Sec3/Definitions.lean:75–101
    * thinBound/wantedBound   same file :106–115 (only these two of the three bounds)
    * Claim.Theorem_17        same file :192–199
    * Claim.Corollary_16      same file :295–298
    * Claim.Theorem_19_explicit  same file :305–308
    * queryCap                PaperStatements.lean (def queryCap, ⌊n²/√D⌋₊)
    * termScans/termPrime/termBuild/strassen/paramD₂₆/paramG₂₆
                              ThreeSumApsp/Sec3/Parameters.lean:61,66,70,73,86,89
  Donor `module`/`public import` headers dropped (standalone elaboration); namespaces
  kept verbatim so the transcribed claims are character-identical statements.
-/
import Mathlib.Analysis.SpecialFunctions.Log.Base
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Order.Floor.Semifield
import Mathlib.Tactic

namespace ThreeSumApsp

/-! ### Parameters (Sec3/Parameters.lean, verbatim) -/

/-- **Theorem 17**, the first term of the additional time, "ν n³ log n/g". -/
noncomputable def termScans (n g : ℕ) (κ : ℝ) : ℝ := κ * (n : ℝ) ^ 3 * Real.log n / (g : ℝ)

/-- **Theorem 17**, the second term of the additional time, "n^{ω+o(1)} D^{3/2}". -/
noncomputable def termPrime (MM : ℕ → ℝ) (n D : ℕ) : ℝ := MM n * (D : ℝ) ^ (3 / 2 : ℝ)

/-- **Theorem 17**, the third term of the additional time, "n² D g". -/
noncomputable def termBuild (n D g : ℕ) : ℝ := (n : ℝ) ^ 2 * (D : ℝ) * (g : ℝ)

/-- Strassen's number of ring operations, up to a constant: `n^{log₂ 7}`. -/
noncomputable def strassen (n : ℕ) : ℝ := (n : ℝ) ^ Real.logb 2 7

/-- Proof of Theorem 19, by Corollary 26: "Let D := ⌊n^{1/18}⌋". -/
noncomputable def paramD₂₆ (n : ℕ) : ℕ := ⌊(n : ℝ) ^ (1 / 18 : ℝ)⌋₊

/-- Proof of Theorem 19, by Corollary 26: "and g := ⌈D^{0.0315}⌉". -/
noncomputable def paramG₂₆ (n : ℕ) : ℕ := ⌈(paramD₂₆ n : ℝ) ^ (0.0315 : ℝ)⌉₊

/-- The query pairs "n²/√D", floored (PaperStatements.lean). -/
noncomputable def queryCap (n D : ℕ) : ℕ := ⌊(n : ℝ) ^ 2 / Real.sqrt D⌋₊

/-! ### The abstract time model (TimeClaims/Sec3/Definitions.lean:75–101, verbatim) -/

/-- An interpretation of "a deterministic algorithm solves the problem in time T", for each
problem of Sections 2 to 4. Each field is a predicate on running times. -/
structure DetTimeModel where
  thinProduct : (ℕ → ℕ → ℕ → ℝ → ℝ) → Prop
  lopCount : (ℕ → ℕ → ℕ → ℝ) → Prop
  lopDetect : (ℕ → ℕ → ℕ → ℝ) → Prop
  exactTriangle : (ℕ → ℝ → ℝ) → Prop
  negativeTriangle : (ℕ → ℝ → ℝ) → Prop
  convolution3SUM : (ℕ → ℝ → ℝ) → Prop
  threeSum : (ℕ → ℝ → ℝ) → Prop
  minPlusProduct : (ℕ → ℝ → ℝ) → Prop
  apsp : (ℕ → ℝ → ℝ) → Prop

/-- The bound of Theorem 5 and of the first case of Corollary 15: `n² log² D / D^{1/18}`. -/
noncomputable abbrev thinBound (n D : ℕ) : ℝ :=
  (n : ℝ) ^ 2 * Real.log D ^ 2 / (D : ℝ) ^ (1 / 18 : ℝ)

/-- The bound of Corollaries 16 and 26: `w D^{0.437} + n² / D^{0.063}`. -/
noncomputable abbrev wantedBound (n D w : ℕ) : ℝ :=
  (w : ℝ) * (D : ℝ) ^ (0.437 : ℝ) + (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)

namespace Claim

/-- **Theorem 17** (TimeClaims/Sec3/Definitions.lean:192–199, verbatim). -/
def Theorem_17 (M : DetTimeModel) (MM : ℕ → ℝ) (D g : ℕ → ℕ) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ T : ℕ → ℕ → ℕ → ℝ, M.lopDetect T →
    ∃ T' : ℕ → ℝ → ℝ, M.exactTriangle T' ∧
      ∀ (n : ℕ) (κ u : ℝ), 16 ≤ D n → D n ≤ n → 1 ≤ g n → (g n : ℝ) ≤ Real.sqrt (D n) → 1 ≤ κ →
        u ≤ (n : ℝ) ^ κ →
        T' n u ≤ 4 * (n : ℝ) * (g n : ℝ) *
            (T n (D n) (queryCap n (D n)) + C * ((n : ℝ) ^ 2 / Real.sqrt (D n))) +
          C * (termScans n (g n) κ + termPrime MM n (D n) + termBuild n (D n) (g n))

/-- **Corollary 16** (TimeClaims/Sec3/Definitions.lean:295–298, verbatim). -/
def Corollary_16 (M : DetTimeModel) : Prop :=
  ∃ (C : ℝ) (Tc Td : ℕ → ℕ → ℕ → ℝ), 0 ≤ C ∧ M.lopCount Tc ∧ M.lopDetect Td ∧
    ∀ n D w : ℕ, 1 ≤ D → D ^ 18 ≤ n →
      Tc n D w ≤ C * wantedBound n D w ∧ Td n D w ≤ C * wantedBound n D w

/-- **Theorem 19, explicit form** (TimeClaims/Sec3/Definitions.lean:305–308, verbatim). -/
def Theorem_19_explicit (M : DetTimeModel) (δ : ℝ) (e : ℕ) : Prop :=
  ∃ (K : ℝ) (T : ℕ → ℝ → ℝ), M.exactTriangle T ∧
    ∀ (n : ℕ) (κ u : ℝ), 16 ^ 18 ≤ n → 1 ≤ κ → u ≤ (n : ℝ) ^ κ →
      T n u ≤ K * (κ * ((n : ℝ) ^ (3 - δ) * Real.log n ^ e))

end Claim

end ThreeSumApsp
