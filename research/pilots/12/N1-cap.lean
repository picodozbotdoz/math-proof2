/-
N1-CAP — the γ-freeze cap theorem trio (the NEGATIVE-kind re-scope's headline
evidence; precharter §2 N1, grant 2026-11-21 revived on N2-GREEN). Pilot-12
family, Iteration-7 (D4′; R2 fire, runs granted 2–3).

PROOF ARTIFACT (zero sorry expected). Self-contained (the N2 precedent):
`EpsData`/`BandWord` restated verbatim/mirror; no CORE.lean import (module
`CORE` composes at the article splice). Component map per the precharter §3:

1. `savings_cap_frozen` (the headline): the ε-fiber cap 0.00175 IS the
   interface's discharge boundary — `E.ε W.ωb ≤ 0.00175 ↔ log₂ 7 ≤ W.ωb`
   (the evaluation §0's "dischargeable iff W.ωb ≥ log₂ 7", now kernel; with
   N2's witness this says the interface EXCLUDES exactly the better-MM
   regime hF3b produces).
2. `two_term_balance`: the η-tradeoff uniqueness — for every η,
   `max (D^(η−γ)) (D^(−η)) ≥ D^(−γ/2)`, the balanced point's value (the
   instances/scans balance at η = γ/2; corpus-verified API
   `Real.rpow_le_rpow_of_exponent_le`).
3. `cap_constant_exact`: the frozen constant's arithmetic —
   `0.063 / (2*18) = 0.00175` and `0.0315/18 = 0.00175` (the landed
   `route16_MMgeneral_frozen`'s own hnum identity), i.e. the cap IS
   γ/(2·18) at the Corollary-16 literal γ = 0.063.

The deep /18 transfer (D-exponent → n-exponent) is NOT re-proved — it is the
landed `route16_MMgeneral_frozen`'s content (CORE.lean @ 940bc9ea, 14/14
triad), consumed by citation at the article splice.

API note: every lemma verified against the local pin checkout
(encore ff2494ea) — `Real.lt_logb_iff_rpow_lt`/`logb_le_iff_le_rpow`
(Log/Base.lean :219/:210), the rpow family (Pow/Real.lean), and
`Real.rpow_le_rpow_of_exponent_le` (used by the landed CORE.lean :440 itself).

Kernel-only: no sorry, no native_decide, no external CAS. Elaborated against
mathlib v4.36.0-rc2 @ ff2494ea via Modal only (never locally).
-/
import Mathlib

noncomputable section

/-- VERBATIM-MARKED restate of `CORE.lean:235–241` (byte-checked at stage):
    ε as DATA over the band, frozen at the log₂-7 fiber. -/
structure EpsData where
  ε : ℝ → ℝ
  e : ℝ → ℕ
  frozen_fiber : ε (Real.logb 2 7) = 0.00175
  strict_anti : StrictAntiOn ε (Set.Ioc 2 2.9)
  limit_three : Filter.Tendsto ε (nhdsWithin 3 (Set.Iio 3)) (nhds 0)

/-- Minimal mirror of `WordRamMMData`'s ωb projection + band (the N2 pattern). -/
structure BandWord where
  ωb : ℝ
  gt_two : 2 < ωb
  le_band : ωb ≤ 2.9

/-! ## The numeric band for the frozen fiber (the N2-run-4-proven trio, verbatim) -/

private theorem logb_two_seven_gt_two : 2 < Real.logb 2 7 := by
  have h : (2:ℝ) < Real.logb 2 7 ↔ ((2:ℝ) ^ (2:ℝ)) < 7 :=
    Real.lt_logb_iff_rpow_lt one_lt_two (by norm_num : (0:ℝ) < 7)
  exact h.mpr (by rw [Real.rpow_two]; norm_num)

private theorem five_halves_lt_logb_two_seven : (5:ℝ) / 2 < Real.logb 2 7 := by
  have h : ((5:ℝ) / 2) < Real.logb 2 7 ↔ ((2:ℝ) ^ ((5:ℝ) / 2)) < 7 :=
    Real.lt_logb_iff_rpow_lt one_lt_two (by norm_num : (0:ℝ) < 7)
  refine h.mpr ?_
  have hL : ((2:ℝ) ^ ((5:ℝ) / 2)) = ((2:ℝ) ^ (((5:ℕ) : ℝ))) ^ ((1:ℝ) / 2) := by
    rw [show ((5:ℝ) / 2) = ((5:ℕ) : ℝ) * ((1:ℝ) / 2) from by norm_num,
      Real.rpow_mul (by norm_num : (0:ℝ) ≤ 2)]
  have hR : ((7:ℝ)) = ((7:ℝ) ^ (((2:ℕ) : ℝ))) ^ ((1:ℝ) / 2) := by
    rw [← Real.rpow_mul (by norm_num : (0:ℝ) ≤ 7),
      show (((2:ℕ) : ℝ) * ((1:ℝ) / 2)) = 1 from by norm_num, Real.rpow_one]
  rw [hL, hR,
    Real.rpow_lt_rpow_iff (show (0:ℝ) ≤ ((2:ℝ) ^ (((5:ℕ) : ℝ))) from by norm_num)
      (show (0:ℝ) ≤ ((7:ℝ) ^ (((2:ℕ) : ℝ))) from by norm_num)
      (by norm_num : (0:ℝ) < 1 / 2),
    Real.rpow_natCast, Real.rpow_natCast]
  norm_num

private theorem logb_two_seven_le_band : Real.logb 2 7 ≤ 2.9 := by
  have h : Real.logb 2 7 ≤ (2.9 : ℝ) ↔ ((7:ℝ)) ≤ ((2:ℝ) ^ (2.9 : ℝ)) :=
    Real.logb_le_iff_le_rpow one_lt_two (by norm_num : (0:ℝ) < 7)
  refine h.mpr ?_
  have hL : ((2:ℝ) ^ (2.9 : ℝ)) = ((2:ℝ) ^ (((29:ℕ) : ℝ))) ^ ((1:ℝ) / 10) := by
    rw [show (2.9 : ℝ) = ((29:ℕ) : ℝ) * ((1:ℝ) / 10) from by norm_num,
      Real.rpow_mul (by norm_num : (0:ℝ) ≤ 2)]
  have hR : ((7:ℝ)) = ((7:ℝ) ^ (((10:ℕ) : ℝ))) ^ ((1:ℝ) / 10) := by
    rw [← Real.rpow_mul (by norm_num : (0:ℝ) ≤ 7),
      show (((10:ℕ) : ℝ) * ((1:ℝ) / 10)) = 1 from by norm_num, Real.rpow_one]
  rw [hR, hL,
    Real.rpow_le_rpow_iff (show (0:ℝ) ≤ ((7:ℝ) ^ (((10:ℕ) : ℝ))) from by norm_num)
      (show (0:ℝ) ≤ ((2:ℝ) ^ (((29:ℕ) : ℝ))) from by norm_num)
      (by norm_num : (0:ℝ) < 1 / 10),
    Real.rpow_natCast, Real.rpow_natCast]
  norm_num

private theorem fiber_mem_band : Real.logb 2 7 ∈ Set.Ioc 2 2.9 :=
  ⟨logb_two_seven_gt_two, logb_two_seven_le_band⟩

/-! ## 1. The headline — the cap as the interface's discharge boundary -/

/-- The ε-fiber cap 0.00175 is EXACTLY the interface's discharge boundary:
    within the band, `E.ε W.ωb ≤ 0.00175 ↔ log₂ 7 ≤ W.ωb` (the evaluation
    §0's dischargeability characterization, kernel). With N2's witness: the
    interface admits exactly the ω_b ≥ log₂ 7 half-band and EXCLUDES exactly
    the hF3b better-MM regime. -/
theorem savings_cap_frozen (E : EpsData) (W : BandWord) :
    (E.ε W.ωb ≤ 0.00175 ↔ Real.logb 2 7 ≤ W.ωb) := by
  have hmemW : W.ωb ∈ Set.Ioc 2 2.9 := ⟨W.gt_two, W.le_band⟩
  constructor
  · intro hcap
    by_contra hcon
    have hlt := not_le.mp hcon
    -- W.ωb < logb 2 7 ⇒ ε (logb 2 7) < ε W.ωb ⇒ 0.00175 < ε W.ωb, contradiction
    have hanti := E.strict_anti hmemW fiber_mem_band hlt
    rw [E.frozen_fiber] at hanti
    linarith
  · intro hge
    by_cases hlt : Real.logb 2 7 < W.ωb
    · have hanti := E.strict_anti fiber_mem_band hmemW hlt
      rw [E.frozen_fiber] at hanti
      exact hanti.le
    · have heq : Real.logb 2 7 = W.ωb := le_antisymm hge (by linarith)
      rw [← heq, E.frozen_fiber]

/-! ## 2. The η-tradeoff — the two-term balance minimum -/

/-- The instances/scans balance: for every η, `max (D^(η−γ)) (D^(−η)) ≥
    D^(−γ/2)` — the balanced point η = γ/2 is the global minimum of the
    two-term D-profile (the corpus's cost model: instances `n³·D^(η−γ)`,
    scans `n³·D^(−η)`; γ = the Corollary-16 frozen literal). -/
theorem two_term_balance (D : ℕ) (hD : 2 ≤ D) (γ η : ℝ) :
    ((D:ℝ) ^ (-(γ / 2))) ≤ max ((D:ℝ) ^ (η - γ)) ((D:ℝ) ^ (-η)) := by
  have hb : (1:ℝ) ≤ (D:ℝ) := le_trans (by norm_num : (1:ℝ) ≤ 2) (by exact_mod_cast hD)
  by_cases h : η < γ / 2
  · -- η < γ/2: the scan term dominates — −η > −γ/2 ⇒ D^(−η) ≥ D^(−γ/2)
    refine le_trans (Real.rpow_le_rpow_of_exponent_le hb ?_) (le_max_right _ _)
    linarith
  · -- η ≥ γ/2: the instance term — η − γ ≥ −γ/2 ⇒ D^(η−γ) ≥ D^(−γ/2)
    refine le_trans (Real.rpow_le_rpow_of_exponent_le hb ?_) (le_max_left _ _)
    linarith

/-! ## 3. The cap constant — the frozen arithmetic -/

/-- The frozen constant IS γ/(2·18) at the Corollary-16 literal γ = 0.063:
    `0.063 / (2*18) = 0.00175` (and the landed route's own `0.0315/18`
    identity, `route16_MMgeneral_frozen`'s hnum). -/
theorem cap_constant_exact :
    ((0.063:ℝ) / (2 * 18) = 0.00175) ∧ ((0.0315:ℝ) / 18 = 0.00175) ∧ ((0.063:ℝ) = 2 * 0.0315) := by
  norm_num

#print axioms savings_cap_frozen
#print axioms two_term_balance
#print axioms cap_constant_exact
