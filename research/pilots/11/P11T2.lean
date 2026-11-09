/-
  Pilot 11, tranche T2 — arithmetic port (with proofs) + donor reference theorem.
  Sources (3sum-apsp, verbatim unless noted):
    * Real.logb_two_seven_lt, Real.one_le_log_natCast_of_three_le
                              ThreeSumApsp/Util/Log.lean:70–76, 56–59 (+one_le_log_of_three_le :49–51)
    * Real.natCast_le_rpow_inv_iff
                              ThreeSumApsp/Util/Ceil.lean:86–90
    * Theorem19.Choice + lemmas
                              ThreeSumApsp/Sec3/Theorem19/Choice.lean:38–276
                                (dropped, not on the corollary-26 route: of_largest_pow_four,
                                 log_le_log; kept everything exists_total_le needs)
    * Theorem19.choice_corollary_26, Theorem19.total_corollary_26
                              ThreeSumApsp/Sec3/Theorem19.lean:91–99, 130–145
    * sq_div_sqrt_le_sq_div_rpow
                              ThreeSumApsp/TimeClaims/Sec3/Arithmetic.lean (thin-instance block)
    * time_le_of_calls, call_cost_corollary_16
                              ThreeSumApsp/TimeClaims/Sec3/Theorem19.lean:40–43, 47–71
    * Theorem19.explicit_of_theorem_17_corollary_16  (the donor reference / acceptance type)
                              ThreeSumApsp/TimeClaims/Sec3/Theorem19.lean:107–125 — ported
                              verbatim as a FAITHFULNESS CHECK: if the donor's own proof
                              compiles against the T1 transcript, the port is faithful.
-/
import P11T1
import Mathlib.Analysis.Complex.ExponentialBounds

namespace Real

/-- `1 ≤ log x` for `x ≥ 3` (Util/Log.lean:49–51, verbatim). -/
theorem one_le_log_of_three_le {x : ℝ} (hx : 3 ≤ x) : 1 ≤ log x :=
  (le_log_iff_exp_le (by linarith)).2 (exp_one_lt_three.le.trans hx)

/-- `1 ≤ log n` for a natural number `n ≥ 3` (Util/Log.lean:56–59, verbatim). -/
theorem one_le_log_natCast_of_three_le {n : ℕ} (hn : 3 ≤ n) : 1 ≤ log n :=
  one_le_log_of_three_le (by exact_mod_cast hn)

/-- The exponent of Strassen's algorithm: `log₂ 7 < 59 / 21 < 2.81` (Util/Log.lean:70–76, verbatim). -/
theorem logb_two_seven_lt : logb 2 7 < 2.81 := by
  have hpow : ((2 : ℝ) ^ (59 / 21 : ℝ)) ^ 21 = 2 ^ 59 := by
    rw [← rpow_natCast, ← rpow_mul two_pos.le, ← rpow_natCast]
    norm_num
  have hlt : (7 : ℝ) < 2 ^ (59 / 21 : ℝ) :=
    lt_of_pow_lt_pow_left₀ 21 (rpow_nonneg two_pos.le _) (by rw [hpow]; norm_num)
  exact ((logb_lt_iff_lt_rpow one_lt_two (by norm_num)).2 hlt).trans (by norm_num)

/-- `x ≤ n^{1/e}` says that `x^e ≤ n` (Util/Ceil.lean:86–90, verbatim). -/
theorem natCast_le_rpow_inv_iff {e : ℕ} (he : e ≠ 0) (x t : ℕ) :
    (x : ℝ) ≤ (t : ℝ) ^ ((e : ℝ)⁻¹) ↔ x ^ e ≤ t := by
  rw [Real.le_rpow_inv_iff_of_pos x.cast_nonneg t.cast_nonneg
    (Nat.cast_pos.2 (Nat.pos_of_ne_zero he)), Real.rpow_natCast]
  exact_mod_cast Iff.rfl

end Real

namespace ThreeSumApsp

namespace Theorem19

/-- A choice of the parameters of Theorem 17 (Sec3/Theorem19/Choice.lean:38–50, verbatim). -/
structure Choice (n D : ℕ) (η c : ℝ) : Prop where
  sixteen_le : 16 ≤ D
  le_root : (D : ℝ) ≤ (n : ℝ) ^ (1 / 18 : ℝ)
  root_div_le : (n : ℝ) ^ (1 / 18 : ℝ) / c ≤ (D : ℝ)
  c_pos : 0 < c
  η_nonneg : 0 ≤ η
  η_le : η ≤ 1 / 4

/-- `x ≤ n^{1/18}` says that `x^18 ≤ n` (Choice.lean:53–55, verbatim). -/
theorem le_root_iff (x n : ℕ) : (x : ℝ) ≤ (n : ℝ) ^ (1 / 18 : ℝ) ↔ x ^ 18 ≤ n := by
  have h := Real.natCast_le_rpow_inv_iff (e := 18) (by norm_num) x n
  rwa [show ((18 : ℕ) : ℝ)⁻¹ = 1 / 18 by norm_num] at h

/-- `n^{1/18} ≥ 16` for `n ≥ 16^18` (Choice.lean:58–59, verbatim). -/
theorem sixteen_le_root {n : ℕ} (hn : 16 ^ 18 ≤ n) : (16 : ℝ) ≤ (n : ℝ) ^ (1 / 18 : ℝ) := by
  exact_mod_cast (le_root_iff 16 n).mpr hn

namespace Choice

variable {n D : ℕ} {η c : ℝ} (P : Choice n D η c)
include P

/-- "Corollary 15 [...] applies because D^{18} ≤ n" (Choice.lean:69–70, verbatim). -/
theorem pow_eighteen_le : D ^ 18 ≤ n :=
  (le_root_iff D n).mp P.le_root

/-- `D ≤ n`, as Theorem 17 asks (Choice.lean:73–74, verbatim). -/
theorem le_n : D ≤ n :=
  (Nat.le_self_pow (by norm_num) D).trans P.pow_eighteen_le

private theorem one_le_D : (1 : ℝ) ≤ D :=
  Nat.one_le_cast.mpr (le_trans (by norm_num) P.sixteen_le)

private theorem D_pos : (0 : ℝ) < D :=
  zero_lt_one.trans_le P.one_le_D

private theorem one_le_n : (1 : ℝ) ≤ n :=
  P.one_le_D.trans (Nat.cast_le.mpr P.le_n)

private theorem n_pos : (0 : ℝ) < n :=
  zero_lt_one.trans_le P.one_le_n

private theorem one_le_rpow : 1 ≤ (D : ℝ) ^ η :=
  Real.one_le_rpow P.one_le_D P.η_nonneg

/-- `g ≥ 1`, as Theorem 17 asks (Choice.lean:92–93, verbatim). -/
theorem one_le_ceil : 1 ≤ ⌈(D : ℝ) ^ η⌉₊ :=
  Nat.ceil_pos.mpr (zero_lt_one.trans_le P.one_le_rpow)

private theorem ceil_le : (⌈(D : ℝ) ^ η⌉₊ : ℝ) ≤ 2 * (D : ℝ) ^ η :=
  Nat.ceil_le_two_mul ((by norm_num : (2 : ℝ)⁻¹ ≤ 1).trans P.one_le_rpow)

/-- `g ≤ √D`, as Theorem 17 asks (Choice.lean:100–114, verbatim). -/
theorem ceil_le_sqrt : (⌈(D : ℝ) ^ η⌉₊ : ℝ) ≤ √(D : ℝ) := by
  have htwo : (2 : ℝ) ≤ (D : ℝ) ^ (1 / 4 : ℝ) :=
    calc (2 : ℝ) = (16 : ℝ) ^ (1 / 4 : ℝ) := by
          rw [show (16 : ℝ) = 2 ^ (4 : ℝ) by norm_num, ← Real.rpow_mul (by norm_num)]
          norm_num
      _ ≤ (D : ℝ) ^ (1 / 4 : ℝ) :=
          Real.rpow_le_rpow (by norm_num) (by exact_mod_cast P.sixteen_le) (by norm_num)
  calc (⌈(D : ℝ) ^ η⌉₊ : ℝ) ≤ 2 * (D : ℝ) ^ η := P.ceil_le
    _ ≤ 2 * (D : ℝ) ^ (1 / 4 : ℝ) := by
        gcongr
        exacts [P.one_le_D, P.η_le]
    _ ≤ (D : ℝ) ^ (1 / 4 : ℝ) * (D : ℝ) ^ (1 / 4 : ℝ) := by gcongr
    _ = √(D : ℝ) := by
        rw [Real.sqrt_eq_rpow, ← Real.rpow_add P.D_pos]
        norm_num

/-- `log n ≥ 1`, because `n ≥ D ≥ 16` (Choice.lean:119–120, verbatim). -/
theorem one_le_log : 1 ≤ Real.log n :=
  Real.one_le_log_natCast_of_three_le ((by norm_num : 3 ≤ 16).trans (P.sixteen_le.trans P.le_n))

/-! ### Powers of `D` in terms of `n` -/

private theorem saving : (D : ℝ) ^ (-η) ≤ c ^ η * (n : ℝ) ^ (-(η / 18)) := by
  have hroot : 0 < (n : ℝ) ^ (1 / 18 : ℝ) := Real.rpow_pos_of_pos P.n_pos _
  calc (D : ℝ) ^ (-η) ≤ ((n : ℝ) ^ (1 / 18 : ℝ) / c) ^ (-η) :=
        Real.rpow_le_rpow_of_nonpos (div_pos hroot P.c_pos) P.root_div_le
          (neg_nonpos.mpr P.η_nonneg)
    _ = ((n : ℝ) ^ (1 / 18 : ℝ)) ^ (-η) / c ^ (-η) := Real.div_rpow hroot.le P.c_pos.le _
    _ = c ^ η * (n : ℝ) ^ (-(η / 18)) := by
        rw [← Real.rpow_mul P.n_pos.le, Real.rpow_neg P.c_pos.le, div_inv_eq_mul, mul_comm,
          show 1 / 18 * -η = -(η / 18) by ring]

private theorem cube_mul_saving_le :
    (n : ℝ) ^ 3 * (D : ℝ) ^ (-η) ≤ c ^ η * (n : ℝ) ^ (3 - η / 18) :=
  calc (n : ℝ) ^ 3 * (D : ℝ) ^ (-η) ≤ (n : ℝ) ^ 3 * (c ^ η * (n : ℝ) ^ (-(η / 18))) := by
        gcongr
        exact P.saving
    _ = c ^ η * (n : ℝ) ^ (3 - η / 18) := by
        rw [sub_eq_add_neg, Real.rpow_add P.n_pos, Real.rpow_ofNat]
        ring

private theorem rpow_le_rpow_div {a : ℝ} (ha : 0 ≤ a) : (D : ℝ) ^ a ≤ (n : ℝ) ^ (a / 18) :=
  calc (D : ℝ) ^ a ≤ ((n : ℝ) ^ (1 / 18 : ℝ)) ^ a := Real.rpow_le_rpow D.cast_nonneg P.le_root ha
    _ = (n : ℝ) ^ (a / 18) := by
        rw [← Real.rpow_mul n.cast_nonneg, show 1 / 18 * a = a / 18 by ring]

private theorem rpow_le_of_le {b Λ : ℝ} (hb : b ≤ 2.9) (hΛ : 1 ≤ Λ) :
    (n : ℝ) ^ b ≤ (n : ℝ) ^ (3 - η / 18) * Λ :=
  (Real.rpow_le_rpow_of_exponent_le P.one_le_n (by linarith [P.η_le])).trans
    (le_mul_of_one_le_right (Real.rpow_nonneg n.cast_nonneg _) hΛ)

private theorem instances_le {X Λ : ℝ} (hX : 0 ≤ X) (hXΛ : X ≤ Λ) :
    4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η))
      ≤ 8 * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by
  have hΛ : 0 ≤ Λ := hX.trans hXΛ
  have hdiv : (D : ℝ) ^ η / (D : ℝ) ^ (2 * η) = (D : ℝ) ^ (-η) := by
    rw [← Real.rpow_sub P.D_pos, show η - 2 * η = -η by ring]
  calc 4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η))
      ≤ 4 * (n : ℝ) * (2 * (D : ℝ) ^ η) * ((n : ℝ) ^ 2 * Λ / (D : ℝ) ^ (2 * η)) := by
        gcongr
        exact P.ceil_le
    _ = 8 * ((n : ℝ) ^ 3 * ((D : ℝ) ^ η / (D : ℝ) ^ (2 * η)) * Λ) := by ring
    _ ≤ 8 * (c ^ η * (n : ℝ) ^ (3 - η / 18) * Λ) := by
        rw [hdiv]
        gcongr 8 * (?_ * Λ)
        exact P.cube_mul_saving_le
    _ = 8 * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by ring

private theorem scans_le {κ Λ : ℝ} (hκ : 0 ≤ κ) (hΛ : Real.log n ≤ Λ) :
    termScans n ⌈(D : ℝ) ^ η⌉₊ κ ≤ κ * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by
  have hpos : 0 < (D : ℝ) ^ η := Real.rpow_pos_of_pos P.D_pos η
  have hΛ0 : 0 ≤ Λ := (Real.log_natCast_nonneg n).trans hΛ
  calc κ * (n : ℝ) ^ 3 * Real.log n / (⌈(D : ℝ) ^ η⌉₊ : ℝ)
      ≤ κ * (n : ℝ) ^ 3 * Λ / (D : ℝ) ^ η := by
        gcongr
        exact Nat.le_ceil _
    _ = κ * ((n : ℝ) ^ 3 * (D : ℝ) ^ (-η) * Λ) := by
        rw [Real.rpow_neg P.D_pos.le]
        ring
    _ ≤ κ * (c ^ η * (n : ℝ) ^ (3 - η / 18) * Λ) := by
        gcongr κ * (?_ * Λ)
        exact P.cube_mul_saving_le
    _ = κ * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) := by ring

private theorem strassen_le {Λ : ℝ} (hΛ : 1 ≤ Λ) :
    termPrime strassen n D ≤ (n : ℝ) ^ (3 - η / 18) * Λ :=
  calc (n : ℝ) ^ (Real.logb 2 7) * (D : ℝ) ^ (3 / 2 : ℝ)
      ≤ (n : ℝ) ^ (Real.logb 2 7) * (n : ℝ) ^ (3 / 2 / 18 : ℝ) := by
        gcongr
        exact P.rpow_le_rpow_div (by norm_num)
    _ = (n : ℝ) ^ (Real.logb 2 7 + 3 / 2 / 18) := (Real.rpow_add P.n_pos _ _).symm
    _ ≤ (n : ℝ) ^ (3 - η / 18) * Λ := P.rpow_le_of_le (by linarith [Real.logb_two_seven_lt]) hΛ

private theorem build_le {Λ : ℝ} (hΛ : 1 ≤ Λ) :
    termBuild n D ⌈(D : ℝ) ^ η⌉₊ ≤ 2 * ((n : ℝ) ^ (3 - η / 18) * Λ) :=
  calc (n : ℝ) ^ 2 * (D : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ)
      ≤ (n : ℝ) ^ 2 * (D : ℝ) * (2 * (D : ℝ) ^ η) := by
        gcongr
        exact P.ceil_le
    _ = 2 * ((n : ℝ) ^ 2 * (D : ℝ) ^ (1 + η)) := by
        rw [Real.rpow_add P.D_pos, Real.rpow_one]
        ring
    _ ≤ 2 * ((n : ℝ) ^ 2 * (n : ℝ) ^ ((1 + η) / 18)) := by
        gcongr
        exact P.rpow_le_rpow_div (by linarith [P.η_nonneg])
    _ = 2 * (n : ℝ) ^ (2 + (1 + η) / 18) := by rw [Real.rpow_add P.n_pos, Real.rpow_ofNat]
    _ ≤ 2 * ((n : ℝ) ^ (3 - η / 18) * Λ) := by
        gcongr
        exact P.rpow_le_of_le (by linarith [P.η_le]) hΛ

end Choice

/-- **The cost analysis of Theorem 19**, for every choice (Choice.lean:245–276, verbatim). -/
theorem exists_total_le {c : ℝ} (hc : 0 ≤ c) (η : ℝ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ {n D : ℕ}, Choice n D η c → ∀ {a b κ X Λ : ℝ}, 0 ≤ a → 0 ≤ b → 1 ≤ κ →
      0 ≤ X → X ≤ Λ → Real.log n ≤ Λ →
      4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * (a * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η)))
        + b * (termScans n ⌈(D : ℝ) ^ η⌉₊ κ + termPrime strassen n D + termBuild n D ⌈(D : ℝ) ^ η⌉₊)
        ≤ C * ((a + b) * (κ * ((n : ℝ) ^ (3 - η / 18) * Λ))) := by
  have hcη : 0 ≤ c ^ η := Real.rpow_nonneg hc η
  refine ⟨8 * c ^ η + 3, by positivity, fun {n D} P {a b κ X Λ} ha hb hκ hX hXΛ hlogΛ => ?_⟩
  have hΛ : 1 ≤ Λ := P.one_le_log.trans hlogΛ
  have hΛκ : Λ ≤ κ * Λ := le_mul_of_one_le_left (zero_le_one.trans hΛ) hκ
  have hinstances := P.instances_le hX (hXΛ.trans hΛκ)
  have hscans := P.scans_le (zero_le_one.trans hκ) hlogΛ
  have hstrassen := P.strassen_le (hΛ.trans hΛκ)
  have hbuild := P.build_le (hΛ.trans hΛκ)
  set R := (n : ℝ) ^ (3 - η / 18) * (κ * Λ) with hR
  have hR0 : 0 ≤ R := by positivity
  have hcηR : 0 ≤ c ^ η * R := mul_nonneg hcη hR0
  rw [show κ * (c ^ η * ((n : ℝ) ^ (3 - η / 18) * Λ)) = c ^ η * R by rw [hR]; ring] at hscans
  calc _ = a * (4 * (n : ℝ) * (⌈(D : ℝ) ^ η⌉₊ : ℝ) * ((n : ℝ) ^ 2 * X / (D : ℝ) ^ (2 * η)))
        + b * (termScans n ⌈(D : ℝ) ^ η⌉₊ κ + termPrime strassen n D
          + termBuild n D ⌈(D : ℝ) ^ η⌉₊) := by ring
    _ ≤ a * ((8 * c ^ η + 3) * R) + b * ((8 * c ^ η + 3) * R) := by
        gcongr a * ?_ + b * ?_
        · linarith [hinstances, hR0]
        · linarith [hscans, hstrassen, hbuild, hcηR]
    _ = (8 * c ^ η + 3) * ((a + b) * (κ * ((n : ℝ) ^ (3 - η / 18) * Λ))) := by
        rw [hR]
        ring

/-- Proof of Theorem 19, by Corollary 26 (Sec3/Theorem19.lean:91–99, verbatim). -/
theorem choice_corollary_26 {n : ℕ} (hn : 16 ^ 18 ≤ n) :
    Theorem19.Choice n (paramD₂₆ n) 0.0315 2 where
  sixteen_le := Nat.le_floor (by exact_mod_cast Theorem19.sixteen_le_root hn)
  le_root := Nat.floor_le (by positivity)
  root_div_le := by
    have hlt : (n : ℝ) ^ (1 / 18 : ℝ) < (paramD₂₆ n : ℝ) + 1 := Nat.lt_floor_add_one _
    linarith [Theorem19.sixteen_le_root hn, hlt]
  c_pos := by norm_num
  η_nonneg := by norm_num
  η_le := by norm_num

/-- **Theorem 19, second bound**, the costs added up (Sec3/Theorem19.lean:130–145, verbatim). -/
theorem total_corollary_26 :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ {n : ℕ}, 16 ^ 18 ≤ n → ∀ {a b κ : ℝ}, 0 ≤ a → 0 ≤ b → 1 ≤ κ →
      4 * (n : ℝ) * (paramG₂₆ n : ℝ) * (a * ((n : ℝ) ^ 2 / (paramD₂₆ n : ℝ) ^ (0.063 : ℝ)))
        + b * (termScans n (paramG₂₆ n) κ + termPrime strassen n (paramD₂₆ n)
          + termBuild n (paramD₂₆ n) (paramG₂₆ n))
        ≤ C * ((a + b) * (κ * ((n : ℝ) ^ (3 - 0.00175 : ℝ) * Real.log n))) := by
  obtain ⟨C, hC, htotal⟩ := Theorem19.exists_total_le (c := 2) (by norm_num) 0.0315
  refine ⟨C, hC, fun {n} hn {a b κ} ha hb hκ => ?_⟩
  have P := Theorem19.choice_corollary_26 hn
  have h := htotal P ha hb hκ zero_le_one P.one_le_log le_rfl
  rwa [mul_one, show (2 * 0.0315 : ℝ) = 0.063 by norm_num,
    show (3 - 0.0315 / 18 : ℝ) = 3 - 0.00175 by norm_num] at h

/-! ### The call-cost glue (TimeClaims/Sec3/{Theorem19,Arithmetic}.lean) -/

/-- `n² / √D ≤ n² / D^a` for `a ≤ 1/2` (TimeClaims/Sec3/Arithmetic.lean, verbatim). -/
theorem sq_div_sqrt_le_sq_div_rpow (n : ℕ) {D : ℕ} {a : ℝ} (hD : 1 ≤ D) (ha : a ≤ 1 / 2) :
    (n : ℝ) ^ 2 / Real.sqrt D ≤ (n : ℝ) ^ 2 / (D : ℝ) ^ a := by
  rw [Real.sqrt_eq_rpow]
  exact div_le_div_of_nonneg_left (by positivity) (Real.rpow_pos_of_pos (Nat.cast_pos.2 hD) a)
    (Real.rpow_le_rpow_of_exponent_le (Nat.one_le_cast.2 hD) ha)

/-- **How both routes of Theorem 19 end** (TimeClaims/Sec3/Theorem19.lean:40–43, verbatim). -/
theorem time_le_of_calls {T calls call I extra B C c : ℝ}
    (h17 : T ≤ calls * call + C * extra) (hcall : call ≤ c * I)
    (hsum : calls * (c * I) + C * extra ≤ B) (hcalls : 0 ≤ calls) : T ≤ B :=
  (h17.trans (add_le_add (mul_le_mul_of_nonneg_left hcall hcalls) le_rfl)).trans hsum

/-- One call on the route through Corollary 16 (TimeClaims/Sec3/Theorem19.lean:47–71, verbatim). -/
theorem call_cost_corollary_16 {n D : ℕ} {t C C₁₆ : ℝ} (hD : 1 ≤ D) (hC : 0 ≤ C) (hC₁₆ : 0 ≤ C₁₆)
    (ht : t ≤ C₁₆ * wantedBound n D (queryCap n D)) :
    t + C * ((n : ℝ) ^ 2 / Real.sqrt D)
      ≤ (2 * C₁₆ + C) * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)) := by
  have hD0 : (0 : ℝ) < D := by exact_mod_cast hD
  have hpos₁ : 0 < (D : ℝ) ^ (0.437 : ℝ) := Real.rpow_pos_of_pos hD0 _
  have hpos₂ : 0 < (D : ℝ) ^ (0.063 : ℝ) := Real.rpow_pos_of_pos hD0 _
  have hsqrt : Real.sqrt D = (D : ℝ) ^ (0.437 : ℝ) * (D : ℝ) ^ (0.063 : ℝ) := by
    rw [Real.sqrt_eq_rpow, ← Real.rpow_add hD0]
    norm_num
  have hquery : (queryCap n D : ℝ) * (D : ℝ) ^ (0.437 : ℝ)
      ≤ (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ) :=
    calc (queryCap n D : ℝ) * (D : ℝ) ^ (0.437 : ℝ)
        ≤ (n : ℝ) ^ 2 / Real.sqrt D * (D : ℝ) ^ (0.437 : ℝ) :=
          mul_le_mul_of_nonneg_right (Nat.floor_le (by positivity)) hpos₁.le
      _ = (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ) := by
          rw [hsqrt]
          field_simp
  have hread := sq_div_sqrt_le_sq_div_rpow n hD (a := 0.063) (by norm_num)
  calc t + C * ((n : ℝ) ^ 2 / Real.sqrt D)
      ≤ C₁₆ * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ) + (n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ))
          + C * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)) :=
        add_le_add (ht.trans (mul_le_mul_of_nonneg_left (add_le_add hquery le_rfl) hC₁₆))
          (mul_le_mul_of_nonneg_left hread hC)
    _ = (2 * C₁₆ + C) * ((n : ℝ) ^ 2 / (D : ℝ) ^ (0.063 : ℝ)) := by ring

/-! ### The donor reference theorem (FAITHFULNESS CHECK) -/

/-- DONOR REFERENCE (TimeClaims/Sec3/Theorem19.lean:107–125, verbatim; namespace `ThreeSumApsp`
not `ThreeSumApsp.Theorem19`-prefixed statement aside, statement and proof identical). If this
compiles, the T1 transcript + T2 port are faithful. It is also the exact type the calculus
instance must re-derive (pilot acceptance test). -/
theorem explicit_of_theorem_17_corollary_16 (M : DetTimeModel)
    (h17 : Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) : Claim.Theorem_19_explicit M 0.00175 1 := by
  obtain ⟨C, hC, h17⟩ := h17
  obtain ⟨C₁₆, _, Td, hC₁₆, -, hTd, h16⟩ := h16
  obtain ⟨T, hT, h17⟩ := h17 Td hTd
  obtain ⟨C₀, -, htotal⟩ := Theorem19.total_corollary_26
  refine ⟨C₀ * (2 * C₁₆ + C + C), T, hT, fun n κ u hn hκ hu => ?_⟩
  have P := Theorem19.choice_corollary_26 hn
  have hD16 := P.sixteen_le
  have h17 := h17 n κ u hD16 P.le_n P.one_le_ceil P.ceil_le_sqrt hκ hu
  have hcall := call_cost_corollary_16 (by omega) hC hC₁₆
    (h16 n _ (queryCap n (paramD₂₆ n)) (by omega) P.pow_eighteen_le).2
  have hsum := htotal hn (a := 2 * C₁₆ + C) (b := C) (by positivity) hC hκ
  rw [pow_one]
  exact (time_le_of_calls h17 hcall hsum (by positivity)).trans_eq (by ring)

end Theorem19

end ThreeSumApsp

#print axioms ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16
