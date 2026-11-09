/-
Pilot 30 — closed form of the eth operators Q_s(t_1, t_1) at h = 1 (the statement that
replaces dossier-30 Theorem B after its refutation in `pilots/30-falsify-TheoremB-h1.lean`).
Target mathlib ff2494ea (v4.36.0-rc2). Kernel-only: no `sorry`, no `native_decide`,
no external CAS.

Model (faithful for ALL labels, unlike the Fin-7 falsification model): V = ℚ[t_1, t_2, …]
realized as `MvPolynomial ℕ ℚ` with t_k = `X k` (k ≥ 1; `X 0` is never touched, so this is
eth's `MvPolynomial ℕ+ ℚ` (`AppHalfPiecesStatement.lean:73`) up to the embedding ℕ+ ↪ ℕ).
  ∇_{-k} f = t_k·f, ∇_k f = k·∂f/∂t_k (k ≥ 1), ∇_0 = 0          (eth :89–90)
  Q_s f = ∇_{1-s}∇_{s-1} f − 2·∇_{-s}∇_s f + ∇_{-s-1}∇_{s+1} f   (eth display (48), :149–151,
          at h = 1, a = b = t_1: angle 1 i t_1 = C(2,i)·t_1 and op t_1 [r] = ∇_{-r}; derivation
          in the header of the falsification file)
  N_k f = t_k·∂f/∂t_k                                            (number operator)

Results (all proved below):
  `nab_nab`              ∇_x ∇_{-x} = x⁺·Id + |x|·N_{|x|}            (every x ∈ ℤ)
  `scalar_second_diff`   (1−s)⁺ − 2(−s)⁺ + (−s−1)⁺ = [s = 0]
  `Qh1_closed_form`      Q_s = [s=0]·Id + |1−s|·N_{|1−s|} − 2|s|·N_{|s|} + |s+1|·N_{|s+1|}
  `Qh1_monomial`         Q_s t^m = q_s(m)·t^m with q_s(m) = [s=0] + |1−s|m_{|1−s|}
                           − 2|s|m_{|s|} + |s+1|m_{|s+1|}  — Q_s is diagonal on monomials,
                           so the Q_s commute, and their eigenvalues are a discrete second
                           difference; they are idempotent only in degenerate cases.
-/

import Mathlib

open MvPolynomial

noncomputable section

namespace Pilot30

abbrev W := MvPolynomial ℕ ℚ

/-- ∇_k (eth `AppHalfPiecesStatement.lean:89–90`; ∇_0 := 0 as there), t_k = `X k`. -/
def nab (k : ℤ) (f : W) : W :=
  if k < 0 then X k.natAbs * f else if 0 < k then (k : ℚ) • pderiv k.natAbs f else 0

/-- The number operator N_k = t_k ∂/∂t_k. -/
def Num (k : ℕ) (f : W) : W := X k * pderiv k f

/-- Display (48) at h = 1, a = b = t_1. -/
def Qh1 (s : ℤ) (f : W) : W :=
  nab (1 - s) (nab (s - 1) f) + (-2 : ℚ) • nab (-s) (nab s f) + nab (-s - 1) (nab (s + 1) f)

lemma pderiv_X_self_W (i : ℕ) : pderiv i (X i : W) = 1 := by
  rw [MvPolynomial.pderiv_X]
  simp

lemma natAbs_cast_of_pos {x : ℤ} (hx : 0 < x) : ((x.natAbs : ℕ) : ℚ) = (x : ℚ) := by
  first
  | (rw [← Int.cast_natCast, Int.natAbs_of_nonneg hx.le])
  | exact_mod_cast Int.natAbs_of_nonneg hx.le

lemma natAbs_cast_of_neg {x : ℤ} (hx : x < 0) : ((x.natAbs : ℕ) : ℚ) = ((-x : ℤ) : ℚ) := by
  rw [← Int.natAbs_neg]
  exact natAbs_cast_of_pos (by omega)

/-- **Key operator identity.** ∇_x ∇_{-x} = x⁺·Id + |x|·N_{|x|} for every integer x. -/
theorem nab_nab (x : ℤ) (f : W) :
    nab x (nab (-x) f) = ((max x 0 : ℤ) : ℚ) • f + ((x.natAbs : ℕ) : ℚ) • Num x.natAbs f := by
  rcases lt_trichotomy x 0 with hx | hx | hx
  · have h1 : ¬ (-x < 0) := by omega
    have h2 : 0 < -x := by omega
    have hmax : max x 0 = 0 := max_eq_right hx.le
    unfold nab Num
    simp only [hx, h1, h2, ↓reduceIte, Int.natAbs_neg, hmax, Int.cast_zero, zero_smul,
      zero_add]
    rw [natAbs_cast_of_neg hx, mul_smul_comm]
  · subst hx
    simp [nab, Num]
  · have h1 : ¬ (x < 0) := by omega
    have h2 : -x < 0 := by omega
    have hmax : max x 0 = x := max_eq_left hx.le
    unfold nab Num
    simp only [hx, h1, h2, ↓reduceIte, Int.natAbs_neg, hmax]
    rw [MvPolynomial.pderiv_mul, pderiv_X_self_W, one_mul, smul_add, natAbs_cast_of_pos hx]

/-- The scalar part: the second difference of the positive part is the Kronecker delta. -/
theorem scalar_second_diff (s : ℤ) :
    max (1 - s) 0 - 2 * max (-s) 0 + max (-s - 1) 0 = if s = 0 then 1 else 0 := by
  split_ifs with h
  · subst h; first | decide | norm_num | simp
  · rcases lt_or_gt_of_ne h with h' | h'
    · rw [max_eq_left (show (0:ℤ) ≤ 1 - s by omega), max_eq_left (show (0:ℤ) ≤ -s by omega),
        max_eq_left (show (0:ℤ) ≤ -s - 1 by omega)]
      ring
    · rw [max_eq_right (show 1 - s ≤ (0:ℤ) by omega), max_eq_right (show -s ≤ (0:ℤ) by omega),
        max_eq_right (show -s - 1 ≤ (0:ℤ) by omega)]
      ring

/-- Q_s with the scalar part still written as a second difference of positive parts. -/
theorem Qh1_closed (s : ℤ) (f : W) :
    Qh1 s f = (((max (1 - s) 0 - 2 * max (-s) 0 + max (-s - 1) 0 : ℤ)) : ℚ) • f
      + (((1 - s).natAbs : ℕ) : ℚ) • Num (1 - s).natAbs f
      + (-2 : ℚ) • ((((-s).natAbs : ℕ) : ℚ) • Num (-s).natAbs f)
      + (((-s - 1).natAbs : ℕ) : ℚ) • Num (-s - 1).natAbs f := by
  have e1 : nab (1 - s) (nab (s - 1) f) = nab (1 - s) (nab (-(1 - s)) f) := by
    rw [show s - 1 = -(1 - s) by ring]
  have e2 : nab (-s) (nab s f) = nab (-s) (nab (-(-s)) f) := by
    rw [neg_neg]
  have e3 : nab (-s - 1) (nab (s + 1) f) = nab (-s - 1) (nab (-(-s - 1)) f) := by
    rw [show s + 1 = -(-s - 1) by ring]
  unfold Qh1
  rw [e1, e2, e3, nab_nab, nab_nab, nab_nab]
  push_cast
  module

/-- **Theorem B′ (closed form at h = 1).** For every s ∈ ℤ and every f:
`Q_s(t_1,t_1) f = [s = 0]·f + |1−s|·N_{|1−s|} f − 2|s|·N_{|s|} f + |s+1|·N_{|s+1|} f`. -/
theorem Qh1_closed_form (s : ℤ) (f : W) :
    Qh1 s f = (if s = 0 then f else 0)
      + (((1 - s).natAbs : ℕ) : ℚ) • Num (1 - s).natAbs f
      + (-2 : ℚ) • ((((-s).natAbs : ℕ) : ℚ) • Num (-s).natAbs f)
      + (((-s - 1).natAbs : ℕ) : ℚ) • Num (-s - 1).natAbs f := by
  rw [Qh1_closed, scalar_second_diff]
  split_ifs <;> simp only [Int.cast_one, Int.cast_zero, one_smul, zero_smul] <;> module

/-- The number operator is diagonal on monomials: N_k t^m = m_k·t^m. -/
theorem Num_monomial (k : ℕ) (m : ℕ →₀ ℕ) (c : ℚ) :
    Num k (monomial m c) = ((m k : ℕ) : ℚ) • monomial m c := by
  unfold Num
  rw [MvPolynomial.X_mul_pderiv_monomial, Nat.cast_smul_eq_nsmul]

/-- **Spectral form.** Q_s(t_1,t_1) acts on each monomial t^m by the scalar
q_s(m) = [s=0] + |1−s|·m_{|1−s|} − 2|s|·m_{|s|} + |s+1|·m_{|s+1|}. -/
theorem Qh1_monomial (s : ℤ) (m : ℕ →₀ ℕ) (c : ℚ) :
    Qh1 s (monomial m c) =
      ((if s = 0 then (1:ℚ) else 0)
        + (((1 - s).natAbs : ℕ) : ℚ) * ((m (1 - s).natAbs : ℕ) : ℚ)
        - 2 * ((((-s).natAbs : ℕ) : ℚ) * ((m (-s).natAbs : ℕ) : ℚ))
        + (((-s - 1).natAbs : ℕ) : ℚ) * ((m (-s - 1).natAbs : ℕ) : ℚ)) • monomial m c := by
  rw [Qh1_closed_form, Num_monomial, Num_monomial, Num_monomial]
  split_ifs <;> module

/-- Consequence: any two Q_s commute (both are diagonal in the monomial basis), checked here
on monomials, which span V. -/
theorem Qh1_comm_monomial (s t : ℤ) (m : ℕ →₀ ℕ) (c : ℚ) :
    Qh1 s (Qh1 t (monomial m c)) = Qh1 t (Qh1 s (monomial m c)) := by
  have hlin : ∀ (u : ℤ) (a : ℚ) (g : W), Qh1 u (a • g) = a • Qh1 u g := by
    intro u a g
    have hn : ∀ (k : ℤ) (g : W), nab k (a • g) = a • nab k g := by
      intro k g
      unfold nab
      split_ifs
      · exact mul_smul_comm a _ g
      · rw [Derivation.map_smul, smul_comm]
      · simp
    unfold Qh1
    simp only [hn]
    module
  rw [Qh1_monomial t, hlin, Qh1_monomial s, hlin, Qh1_monomial t]
  module

/-- Spot value (cross-check of the spectral form against hand computation): on
t_1² (m = 2·e_1) the operator Q_0 acts by 5 = [0=0] + 1·2 − 0 + 1·2. -/
theorem Qh1_zero_t1sq (c : ℚ) :
    Qh1 0 (monomial (Finsupp.single 1 2) c) = (5:ℚ) • monomial (Finsupp.single 1 2) c := by
  rw [Qh1_monomial]
  congr 1
  norm_num [Finsupp.single_apply]

end Pilot30

#print axioms Pilot30.nab_nab
#print axioms Pilot30.scalar_second_diff
#print axioms Pilot30.Qh1_closed
#print axioms Pilot30.Qh1_closed_form
#print axioms Pilot30.Num_monomial
#print axioms Pilot30.Qh1_monomial
#print axioms Pilot30.Qh1_comm_monomial
#print axioms Pilot30.Qh1_zero_t1sq
