/-
N2-WITNESS — the γ-freeze blockade witness (the PROVABLE half of
`flagship_shape`'s conclusion, CORE.lean :392 first conjunct, at hF3b's
W-class). Pilot-12 family, Iteration-7 day-1 (D4′; grant 2026-11-21, R2 fire).

PROOF ARTIFACT (zero sorry expected — NOT a probe file). Self-contained by
design (the H3-from-H2 precedent): `EpsData` restated VERBATIM-MARKED from
`CORE.lean:235–241` (byte-checked at stage time); `BandWord` = the minimal
mirror of `WordRamMMData`'s ωb projection + band fields (the splice composes
over the landed 14/14 file; no CORE.lean import — the hyphen→camel trap).

The statement: any band W with ωb ≤ 9/4 + 1/4 sits strictly below the frozen
fiber, where the DECREASING ε EXCEEDS the frozen cap 0.00175. The second
conjunct of the flagship's conclusion (`Theorem_19_explicit` at the larger ε)
is the γ-freeze's BLOCKED half — never claimed here.

RUN HISTORY: run 1 RED (12 errors, all API-name class — the pin's
`Real.log_pow` takes the value explicitly; `Real.logb_def` does not exist
here; the v4.33→v4.36 drift the corpus itself documents at CORE.lean:477).
Run 2 = the budgeted mechanical fix round: every lemma below verified against
the LOCAL pin checkout (encore mathlib4 ff2494ea) before firing —
`Real.lt_logb_iff_rpow_lt` + `Real.logb_le_iff_le_rpow` (Log/Base.lean:219/:210,
section OneLtB, hb explicit), `Real.rpow_mul`/`rpow_natCast`/`rpow_one`/
`rpow_lt_rpow_iff`/`rpow_le_rpow_iff` (Pow/Real.lean:414/:61/:148/:571/:574);
integer cores by `norm_num`.

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

/-- Minimal mirror of `WordRamMMData`'s ωb projection + its structural band
    (`CORE.lean:227–228`-class: ωb ∈ (2, 2.9]); the full WordRamMMData
    composes at the article splice. -/
structure BandWord where
  ωb : ℝ
  gt_two : 2 < ωb
  le_band : ωb ≤ 2.9

/-! ## The numeric band for the frozen fiber (the 2 < · < 2.9 sandwich) -/

private theorem logb_two_seven_gt_two : 2 < Real.logb 2 7 := by
  have h : (2:ℝ) < Real.logb 2 7 ↔ ((2:ℝ) ^ (2:ℝ)) < 7 :=
    Real.lt_logb_iff_rpow_lt one_lt_two (by norm_num : (0:ℝ) < 7)
  exact h.mpr (by rw [Real.rpow_two]; norm_num)

private theorem five_halves_lt_logb_two_seven : (5:ℝ) / 2 < Real.logb 2 7 := by
  have h : ((5:ℝ) / 2) < Real.logb 2 7 ↔ ((2:ℝ) ^ ((5:ℝ) / 2)) < 7 :=
    Real.lt_logb_iff_rpow_lt one_lt_two (by norm_num : (0:ℝ) < 7)
  refine h.mpr ?_
  -- split 2 ^ (5/2) = (2^5)^(1/2) and 7 = (7^2)^(1/2), compare the squares
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
  -- split 2 ^ 2.9 = (2^29)^(1/10) and 7 = (7^10)^(1/10); 7^10 ≤ 2^29 decides
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

/-! ## The witness -/

/-- The blockade witness — any band W with `ωb ≤ 9/4 + 1/4` (a member of
    hF3b's ∀ε′>0 class, fixed ε′ = 1/4) sits strictly below the frozen fiber,
    where the DECREASING ε EXCEEDS the frozen cap. -/
theorem fiber_cap_blocked_regime (E : EpsData) (W : BandWord)
    (hW : W.ωb ≤ 9 / 4 + 1 / 4) :
    0.00175 < E.ε W.ωb := by
  have h52 : W.ωb ≤ (5:ℝ) / 2 := by
    have hfive : ((9:ℝ) / 4 + 1 / 4) = 5 / 2 := by ring
    linarith [hW, hfive]
  have hlt : W.ωb < Real.logb 2 7 := lt_of_le_of_lt h52 five_halves_lt_logb_two_seven
  have hmemW : W.ωb ∈ Set.Ioc 2 2.9 := ⟨W.gt_two, W.le_band⟩
  have hmemF : Real.logb 2 7 ∈ Set.Ioc 2 2.9 :=
    ⟨logb_two_seven_gt_two, logb_two_seven_le_band⟩
  have hanti := E.strict_anti hmemW hmemF hlt
  -- StrictAntiOn on Ioc: a < b ⇒ f b < f a — here ε (logb 2 7) < ε W.ωb
  rw [E.frozen_fiber] at hanti
  exact hanti

#print axioms fiber_cap_blocked_regime
