/-
Pilot 30 — falsification milestone for dossier 30 Theorem B, at h = 1.
Lane R7, 2026-11-09. Target mathlib ff2494ea (v4.36.0-rc2). Kernel-only:
no `sorry`, no `native_decide`, no external CAS.

Constructions transcribed from the read-only sibling
`anthropics_formal-math/eth/proof/statements/AppHalfPiecesStatement.lean`
(numbers = that paper's Appendix B):
  nabla (∇)  lines 89–90: ∇_{-k} f = t_k·f, ∇_k f = k·∂f/∂t_k (k ≥ 1), ∇_0 = 0.
    Here variables t_i = `MvPolynomial.X i`, i : Fin 7 (t_1 = X 0, t_2 = X 1, …).
  binom     line 39: eth uses `Ring.choose`; here the identical falling-factorial
    quotient `binomZ` (only C(x,0) = 1 and C(-3,1) = -3 are needed below).
  op on a length-1 monomial t_n (display (47), lines 93–105): the choice list
    ks is FORCED to [k], k = -r (Choices: |ks| = 1, k ≠ 0, Σk = -r), hence
    t_n [r] f = C(-k-1, n-1)·∇_k f = C(r-1, n-1)·∇_{-r} f — that is `op1n`.
  angle     line 146, at h = 1 for a = t_1: the weight parts of t_1 are
    (0, t_1) (weight grading, `part` line 140), so angle 1 i t_1 = C(2,i)·t_1,
    C(2,·) = (1, 2, 1).
  Q, Q'     display (48), lines 149–154, at h = 1, a = b = t_1, with the three
    coefficients (−1)^i·C(2,i) = (1, −2, 1) evaluated:
    Q_s f  = ∇_{1-s}(∇_{s-1} f) − 2·∇_{-s}(∇_{s} f) + ∇_{-s-1}(∇_{s+1} f)  = `Q1`
    Q'_s f = ∇_{s-1}(∇_{1-s} f) − 2·∇_{s}(∇_{-s} f) + ∇_{s+1}(∇_{-s-1} f)  = `Q1'`
  pairing   line 131: pairing h a b = coeff 0 (a[-h] b).

FAITHFULNESS IS CHECKED, NOT ASSUMED: the file verifies computationally that
this instantiation satisfies the corpus's own LemmaQ (a) and (c) shapes at
h = 1 on V_0, V_1 and the t_2-line of V_2 (`LemmaQc_V0/V1/V2_t2`, `LemmaQa_V1`), with
pairing 1 t_1 t_1 = 1 — three/five/seven-term integer identities all holding. The general
faithful-model closed form (all weights, all monomials) is `pilots/30/ClosedForm.lean`.
It also spot-checks the h = 2 pairing mechanism (the generalized binomial
C(-3,1) = -3 sign cancellation behind dossier-30 Theorem A).

OUTCOME — dossier-30 Theorem B is REFUTED at h = 1 (weight space V_1):
the scalar values of Q_s on t_1 for s = -2..2 are (1, -2, 3, -2, 1); they sum
to 1 (LemmaQ (c) holds) but are not {0,1}-valued, so idempotence, mutual
annihilation and Parseval all FAIL (`B2_idempotence_fails`,
`B2_annihilation_fails`, `B2_parseval_fails`).
-/

import Mathlib

open MvPolynomial

noncomputable section

abbrev V := MvPolynomial (Fin 7) ℚ

/-- Index of t_k (k = |label|) in `Fin 7`. -/
def vidx (k : ℤ) : Fin 7 :=
  if k = 0 then 0 else ⟨(k.natAbs - 1) % 7, by omega⟩

/-- ∇_k (eth AppHalfPiecesStatement.lean:89–90; ∇_0 := 0 as there). -/
noncomputable def nabla (k : ℤ) (f : V) : V :=
  if k < 0 then MvPolynomial.X (vidx k) * f
  else if 0 < k then (k : ℚ) • MvPolynomial.pderiv (vidx k) f
  else 0

/-- eth `binom` (line 39; there `Ring.choose`) as the falling-factorial quotient. -/
def binomZ (k j : ℤ) : ℤ :=
  if 0 ≤ j then (∏ i ∈ Finset.range j.toNat, (k - i)) / (Nat.factorial j.toNat : ℤ) else 0

/-- Display (47) for the length-1 monomial t_n (choice list forced; see header). -/
noncomputable def op1n (n : ℕ) (r : ℤ) (f : V) : V :=
  ((binomZ (r - 1) (n - 1) : ℤ) : ℚ) • nabla (-r) f

/-- Display (48) at h = 1, a = b = t_1 (coefficients (1, -2, 1); see header). -/
noncomputable def Q1 (s : ℤ) (f : V) : V :=
  (1:ℚ) • nabla (1 - s) (nabla (s - 1) f)
  + (-2:ℚ) • nabla (-s) (nabla (s + 0) f)
  + (1:ℚ) • nabla (-s - 1) (nabla (s + 1) f)

/-- Factors-exchanged version (eth lines 153–154), for the LemmaQ (a) check. -/
noncomputable def Q1' (s : ℤ) (f : V) : V :=
  (1:ℚ) • nabla (s - 1) (nabla (1 - s) f)
  + (-2:ℚ) • nabla (s + 0) (nabla (-s) f)
  + (1:ℚ) • nabla (s + 1) (nabla (-s - 1) f)

/-! ## Evaluation lemmas (numeral labels |k| ≤ 4 suffice for all tests) -/

@[simp] lemma vidx_neg1 : vidx (-(1:ℤ)) = 0 := by unfold vidx; simp
@[simp] lemma vidx_1 : vidx (1:ℤ) = 0 := by unfold vidx; simp
@[simp] lemma vidx_neg2 : vidx (-(2:ℤ)) = 1 := by unfold vidx; simp
@[simp] lemma vidx_2 : vidx (2:ℤ) = 1 := by unfold vidx; simp
@[simp] lemma vidx_neg3 : vidx (-(3:ℤ)) = 2 := by unfold vidx; simp
@[simp] lemma vidx_3 : vidx (3:ℤ) = 2 := by unfold vidx; simp
@[simp] lemma vidx_neg4 : vidx (-(4:ℤ)) = 3 := by unfold vidx; simp
@[simp] lemma vidx_4 : vidx (4:ℤ) = 3 := by unfold vidx; simp

lemma nabla_neg1 (f : V) : nabla (-(1:ℤ)) f = MvPolynomial.X 0 * f := by
  unfold nabla; simp
lemma nabla_1 (f : V) : nabla (1:ℤ) f = (1:ℚ) • MvPolynomial.pderiv 0 f := by
  unfold nabla; simp
lemma nabla_0 (f : V) : nabla (0:ℤ) f = 0 := by
  unfold nabla; simp
lemma nabla_neg2 (f : V) : nabla (-(2:ℤ)) f = MvPolynomial.X 1 * f := by
  unfold nabla; simp
lemma nabla_2 (f : V) : nabla (2:ℤ) f = (2:ℚ) • MvPolynomial.pderiv 1 f := by
  unfold nabla; simp
lemma nabla_neg3 (f : V) : nabla (-(3:ℤ)) f = MvPolynomial.X 2 * f := by
  unfold nabla; simp
lemma nabla_3 (f : V) : nabla (3:ℤ) f = (3:ℚ) • MvPolynomial.pderiv 2 f := by
  unfold nabla; simp
lemma nabla_neg4 (f : V) : nabla (-(4:ℤ)) f = MvPolynomial.X 3 * f := by
  unfold nabla; simp
lemma nabla_4 (f : V) : nabla (4:ℤ) f = (4:ℚ) • MvPolynomial.pderiv 3 f := by
  unfold nabla; simp

lemma pderiv_X_self' (i : Fin 7) :
    MvPolynomial.pderiv i (MvPolynomial.X i : V) = 1 := by
  rw [MvPolynomial.pderiv_X]
  simp

lemma pderiv_X_ne' {i j : Fin 7} (h : i ≠ j) :
    MvPolynomial.pderiv i (MvPolynomial.X j : V) = 0 := by
  rw [MvPolynomial.pderiv_X]
  simp [h]

/-- Closes a concrete evaluation of `Q1`/`Q1'` on an explicit polynomial: unfold the
operators, differentiate, normalize (three strategies, first that closes wins). -/
macro "qcalc" : tactic => `(tactic| first
  | (norm_num [Q1, Q1', nabla_neg4, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1,
        nabla_2, nabla_3, nabla_4, pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul,
        MvPolynomial.pderiv_C, MvPolynomial.one_def, MvPolynomial.C_mul, smul_eq_mul]
      <;> (try module) <;> done)
  | (norm_num [Q1, Q1', nabla_neg4, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1,
        nabla_2, nabla_3, nabla_4, pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul,
        MvPolynomial.pderiv_C, MvPolynomial.smul_eq_C_mul, Derivation.map_one_eq_zero]
      <;> (try ring_nf) <;> done)
  | (norm_num [Q1, Q1', nabla_neg4, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1,
        nabla_2, nabla_3, nabla_4, pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul,
        MvPolynomial.pderiv_C, Algebra.smul_def, Derivation.map_one_eq_zero]
      <;> (try ring_nf) <;> done))

/-! ## The five scalar values on V_1 (basis t_1 = X 0) -/

lemma q1_m2 : Q1 (-2) (MvPolynomial.X 0) = (1:ℚ) • ((MvPolynomial.X 0 : V)) := by
  norm_num [Q1, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1, nabla_2, nabla_3,
    pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul, MvPolynomial.pderiv_C,
    MvPolynomial.one_def, MvPolynomial.C_mul, smul_eq_mul]
  try module

lemma q1_m1 : Q1 (-1) (MvPolynomial.X 0) = (-2:ℚ) • ((MvPolynomial.X 0 : V)) := by
  norm_num [Q1, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1, nabla_2, nabla_3,
    pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul, MvPolynomial.pderiv_C,
    MvPolynomial.one_def, MvPolynomial.C_mul, smul_eq_mul]
  try module

lemma q1_0 : Q1 0 (MvPolynomial.X 0) = (3:ℚ) • ((MvPolynomial.X 0 : V)) := by
  norm_num [Q1, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1, nabla_2, nabla_3,
    pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul, MvPolynomial.pderiv_C,
    MvPolynomial.one_def, MvPolynomial.C_mul, smul_eq_mul]
  try module

lemma q1_1 : Q1 1 (MvPolynomial.X 0) = (-2:ℚ) • ((MvPolynomial.X 0 : V)) := by
  norm_num [Q1, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1, nabla_2, nabla_3,
    pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul, MvPolynomial.pderiv_C,
    MvPolynomial.one_def, MvPolynomial.C_mul, smul_eq_mul]
  try module

lemma q1_2 : Q1 2 (MvPolynomial.X 0) = (1:ℚ) • ((MvPolynomial.X 0 : V)) := by
  norm_num [Q1, nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1, nabla_2, nabla_3,
    pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul, MvPolynomial.pderiv_C,
    MvPolynomial.one_def, MvPolynomial.C_mul, smul_eq_mul]
  try module

/-! ## Finite-window sums -/

lemma hset3 : (Finset.Icc (-1:ℤ) 1) = {-1, 0, 1} := by
  ext x
  simp only [Finset.mem_Icc, Finset.mem_insert, Finset.mem_singleton]
  omega

lemma hset5 : (Finset.Icc (-2:ℤ) 2) = {-2, -1, 0, 1, 2} := by
  ext x
  simp only [Finset.mem_Icc, Finset.mem_insert, Finset.mem_singleton]
  omega

lemma hset7 : (Finset.Icc (-3:ℤ) 3) = {-3, -2, -1, 0, 1, 2, 3} := by
  ext x
  simp only [Finset.mem_Icc, Finset.mem_insert, Finset.mem_singleton]
  omega

lemma sum3 (F : ℤ → V) : ∑ s ∈ Finset.Icc (-1:ℤ) 1, F s = F (-1) + (F 0 + F 1) := by
  rw [hset3, Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num), Finset.sum_singleton]

lemma sum5 (F : ℤ → V) :
    ∑ s ∈ Finset.Icc (-2:ℤ) 2, F s = F (-2) + (F (-1) + (F 0 + (F 1 + F 2))) := by
  rw [hset5, Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num), Finset.sum_singleton]

lemma sum7 (F : ℤ → V) :
    ∑ s ∈ Finset.Icc (-3:ℤ) 3, F s
      = F (-3) + (F (-2) + (F (-1) + (F 0 + (F 1 + (F 2 + F 3))))) := by
  rw [hset7, Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num),
    Finset.sum_insert (by first | decide | simp | norm_num), Finset.sum_singleton]

/-! ## Scalar values on V_0 (basis 1) and V_2 (basis t_2 = X 1; the t_1² basis vector of V_2 is
covered for all weights by the general spectral theorem `Pilot30.Qh1_monomial`, pilots/30/ClosedForm.lean)

Each `Q1 s` acts diagonally here (every term is ∇_{-k}∇_k or ∇_k∇_{-k}, a multiple of a
number operator); the values are recorded so the LemmaQ checks below are pure arithmetic. -/

lemma q0_m1 : Q1 (-1) (1 : V) = 0 := by qcalc
lemma q0_0 : Q1 0 (1 : V) = (1:ℚ) • (1 : V) := by qcalc
lemma q0_1 : Q1 1 (1 : V) = 0 := by qcalc

lemma q2_m3 : Q1 (-3) (MvPolynomial.X 1 : V) = (2:ℚ) • (MvPolynomial.X 1 : V) := by qcalc
lemma q2_m2 : Q1 (-2) (MvPolynomial.X 1 : V) = (-4:ℚ) • (MvPolynomial.X 1 : V) := by qcalc
lemma q2_m1 : Q1 (-1) (MvPolynomial.X 1 : V) = (2:ℚ) • (MvPolynomial.X 1 : V) := by qcalc
lemma q2_0 : Q1 0 (MvPolynomial.X 1 : V) = (1:ℚ) • (MvPolynomial.X 1 : V) := by qcalc
lemma q2_1 : Q1 1 (MvPolynomial.X 1 : V) = (2:ℚ) • (MvPolynomial.X 1 : V) := by qcalc
lemma q2_2 : Q1 2 (MvPolynomial.X 1 : V) = (-4:ℚ) • (MvPolynomial.X 1 : V) := by qcalc
lemma q2_3 : Q1 3 (MvPolynomial.X 1 : V) = (2:ℚ) • (MvPolynomial.X 1 : V) := by qcalc

/-! ## Faithfulness checks (corpus LemmaQ shapes at h = 1) -/

lemma binomZ_zero_right (k : ℤ) : binomZ k 0 = 1 := by
  unfold binomZ; simp

lemma binomZ_one_right (k : ℤ) : binomZ k 1 = k := by
  unfold binomZ; norm_num

/-- pairing 1 t_1 t_1 = coeff 0 (op t_1 (-1) t_1) = 1 (eth line 131). -/
lemma pairing_h1 :
    ((op1n 1 (-1) (MvPolynomial.X 0 : V)).coeff (0 : Fin 7 →₀ ℕ) : ℚ) = 1 := by
  have h : op1n 1 (-1) (MvPolynomial.X 0) = (1:ℚ) • ((1 : V)) := by
    simp only [op1n]
    norm_num [binomZ_zero_right, nabla_1, pderiv_X_self']
    try module
  rw [h]
  simp [MvPolynomial.coeff_one, smul_eq_mul]

/-- LemmaQ (c) shape on V_0 (|s| ≤ E+h = 1): the sum resolves to pairing·Id = Id. -/
theorem LemmaQc_V0 :
    ∑ s ∈ Finset.Icc (-1:ℤ) 1, Q1 s 1 = (1:ℚ) • ((1 : V)) := by
  rw [sum3, q0_m1, q0_0, q0_1]
  module

/-- LemmaQ (c) shape on V_1 (|s| ≤ 2): Σ Q_s t_1 = t_1 (pairing = 1). -/
theorem LemmaQc_V1 :
    ∑ s ∈ Finset.Icc (-2:ℤ) 2, Q1 s (MvPolynomial.X 0) = (1:ℚ) • ((MvPolynomial.X 0 : V)) := by
  rw [sum5, q1_m2, q1_m1, q1_0, q1_1, q1_2]
  module

/-- LemmaQ (a) shape on V_1: Q_s = Q'_s (factors exchanged) for all five s. -/
theorem LemmaQa_V1 (s : ℤ) (hs : s ∈ Finset.Icc (-2:ℤ) 2) :
    Q1 s (MvPolynomial.X 0) = Q1' s (MvPolynomial.X 0) := by
  rw [hset5] at hs
  simp only [Finset.mem_insert, Finset.mem_singleton] at hs
  rcases hs with h | h | h | h | h <;> subst h <;>
    norm_num [Q1, Q1', nabla_neg3, nabla_neg2, nabla_neg1, nabla_0, nabla_1, nabla_2,
      nabla_3, pderiv_X_self', pderiv_X_ne', MvPolynomial.pderiv_mul, MvPolynomial.pderiv_C,
      MvPolynomial.one_def, MvPolynomial.C_mul, smul_eq_mul] <;>
    try module

/-- LemmaQ (c) shape on V_2, basis t_2 = X 1 (|s| ≤ 3). -/
theorem LemmaQc_V2_t2 :
    ∑ s ∈ Finset.Icc (-3:ℤ) 3, Q1 s (MvPolynomial.X 1) = (1:ℚ) • ((MvPolynomial.X 1 : V)) := by
  rw [sum7, q2_m3, q2_m2, q2_m1, q2_0, q2_1, q2_2, q2_3]
  module

/-! ## h = 2 pairing spot-check (Theorem A mechanism: generalized binomials)

pairing 2 a^{(2)} b^{(2)} with a^{(2)} = -(2·t_1 + t_2) and b^{(2)} = t_2 equals
2 = 2! (eth LemmaDual at h = 2, μ = ν = (2)); the crux is C(-3,1) = -3 inside
op t_2 [-2] t_2, whose sign cancellation is exactly the mechanism identified in
dossier 30 Theorem A (naive sign transport fails, the binomial twist saves it).
Linearity in `a` is eth's OpFacts add_left/smul_left (lines 116–118). -/

lemma op_t2_check : op1n 2 (-2) (MvPolynomial.X 1) = (-6:ℚ) • ((1 : V)) := by
  simp only [op1n]
  norm_num [binomZ_one_right, nabla_2, pderiv_X_self']
  try module

lemma op_t1_check : op1n 1 (-2) (MvPolynomial.X 1) = (2:ℚ) • ((1 : V)) := by
  simp only [op1n]
  norm_num [binomZ_zero_right, nabla_2, pderiv_X_self']
  try module

theorem pairing_h2_check :
    ((-(2:ℚ) • op1n 1 (-2) (MvPolynomial.X 1 : V)
      - op1n 2 (-2) (MvPolynomial.X 1 : V) : V)).coeff (0 : Fin 7 →₀ ℕ) = 2 := by
  rw [op_t1_check, op_t2_check]
  have hc : ((1 : V)).coeff (0 : Fin 7 →₀ ℕ) = (1 : ℚ) := by
    simp [MvPolynomial.coeff_one]
  simp only [smul_sub, sub_smul, coeff_sub, coeff_smul, hc, smul_eq_mul]
  norm_num

/-! ## Theorem B (B2) — REFUTATION on V_1

Scalar values of Q_s on t_1 (s = -2..2): (1, -2, 3, -2, 1). Sum = 1 (LemmaQ (c)
holds) but not {0,1}-valued ⇒ idempotence, mutual annihilation, Parseval FAIL. -/

lemma pos_smul_X_ne_zero (a : ℚ) (ha : a ≠ 0) : a • ((MvPolynomial.X 0 : V)) ≠ 0 := by
  intro h
  rcases eq_zero_or_eq_zero_of_smul_eq_zero h with h' | h'
  · exact ha h'
  · exact (MvPolynomial.X_ne_zero 0) h'

lemma smul_X_inj {a b : ℚ} (h : a • ((MvPolynomial.X 0 : V)) = b • ((MvPolynomial.X 0 : V)))
    (hne : a ≠ b) : False := by
  have h6 : (a - b) • ((MvPolynomial.X 0 : V)) = 0 := by
    rw [sub_smul, h, sub_self]
  rcases eq_zero_or_eq_zero_of_smul_eq_zero h6 with h' | h'
  · exact hne (by linarith [sub_eq_zero.mp h'])
  · exact (MvPolynomial.X_ne_zero 0) h'

/-- `Q1 s` is ℚ-linear (each ∇_k is); used to evaluate the squares. -/
lemma Q1_smul (s : ℤ) (a : ℚ) (f : V) : Q1 s (a • f) = a • Q1 s f := by
  have hn : ∀ (k : ℤ) (g : V), nabla k (a • g) = a • nabla k g := by
    intro k g
    unfold nabla
    split_ifs
    · exact mul_smul_comm a _ g
    · rw [Derivation.map_smul, smul_comm]
    · simp
  unfold Q1
  simp only [hn]
  module

lemma sq_m2 : Q1 (-2) (Q1 (-2) (MvPolynomial.X 0)) = (1:ℚ) • ((MvPolynomial.X 0 : V)) := by
  rw [q1_m2, Q1_smul, q1_m2]; module
lemma sq_m1 : Q1 (-1) (Q1 (-1) (MvPolynomial.X 0)) = (4:ℚ) • ((MvPolynomial.X 0 : V)) := by
  rw [q1_m1, Q1_smul, q1_m1]; module
lemma sq_0 : Q1 0 (Q1 0 (MvPolynomial.X 0)) = (9:ℚ) • ((MvPolynomial.X 0 : V)) := by
  rw [q1_0, Q1_smul, q1_0]; module
lemma sq_1 : Q1 1 (Q1 1 (MvPolynomial.X 0)) = (4:ℚ) • ((MvPolynomial.X 0 : V)) := by
  rw [q1_1, Q1_smul, q1_1]; module
lemma sq_2 : Q1 2 (Q1 2 (MvPolynomial.X 0)) = (1:ℚ) • ((MvPolynomial.X 0 : V)) := by
  rw [q1_2, Q1_smul, q1_2]; module

theorem B2_idempotence_fails :
    Q1 0 (Q1 0 (MvPolynomial.X 0)) ≠ Q1 0 (MvPolynomial.X 0) := by
  rw [sq_0, q1_0]
  intro heq
  exact smul_X_inj heq (by norm_num)

theorem B2_annihilation_fails : Q1 (-2) (Q1 0 (MvPolynomial.X 0)) ≠ 0 := by
  rw [q1_0, Q1_smul, q1_m2, smul_smul]
  exact pos_smul_X_ne_zero _ (by norm_num)

/-- Parseval-style sum Σ_s Q_s∘Q_s (t_1) = 19·t_1 ≠ pairing²·t_1 = t_1. -/
theorem B2_parseval_fails :
    ∑ s ∈ Finset.Icc (-2:ℤ) 2, Q1 s (Q1 s (MvPolynomial.X 0))
      ≠ (1:ℚ) • ((MvPolynomial.X 0 : V)) := by
  have hsum : ∑ s ∈ Finset.Icc (-2:ℤ) 2, Q1 s (Q1 s (MvPolynomial.X 0))
      = (19:ℚ) • ((MvPolynomial.X 0 : V)) := by
    rw [sum5, sq_m2, sq_m1, sq_0, sq_1, sq_2]
    module
  rw [hsum]
  intro heq
  exact smul_X_inj heq (by norm_num)

/-- **Headline (dossier 30, Theorem B2 at h = 1, a = b = t_1, on V_1): REFUTED.**
B2 asserts `Q_s ∘ Q_t = [s = t]·pairing·Q_s`; here pairing 1 t_1 t_1 = 1 (`pairing_h1`),
and the instance s = t = 0 already fails. -/
theorem TheoremB2_refuted_h1 :
    ¬ (∀ s t : ℤ, s ∈ Finset.Icc (-2:ℤ) 2 → t ∈ Finset.Icc (-2:ℤ) 2 →
        Q1 s (Q1 t (MvPolynomial.X 0)) =
          if s = t then (1:ℚ) • Q1 s (MvPolynomial.X 0) else 0) := by
  intro h
  have h00 := h 0 0 (Finset.mem_Icc.mpr ⟨by norm_num, by norm_num⟩)
    (Finset.mem_Icc.mpr ⟨by norm_num, by norm_num⟩)
  rw [if_pos rfl, one_smul] at h00
  exact B2_idempotence_fails h00

/-! ## What survives: moment identities (instances; general proof in `pilots/30/ClosedForm.lean`
and `pilots/30-note.md`). Σ_s Q_s = Id, Σ_s s·Q_s = 0, Σ_s s²·Q_s = 4·E·Id on V_E. -/

theorem moment1_V1 :
    ∑ s ∈ Finset.Icc (-2:ℤ) 2, (s:ℚ) • Q1 s (MvPolynomial.X 0) = 0 := by
  rw [sum5, q1_m2, q1_m1, q1_0, q1_1, q1_2]
  push_cast
  module

theorem moment2_V1 :
    ∑ s ∈ Finset.Icc (-2:ℤ) 2, ((s:ℚ) ^ 2) • Q1 s (MvPolynomial.X 0)
      = (4:ℚ) • ((MvPolynomial.X 0 : V)) := by
  rw [sum5, q1_m2, q1_m1, q1_0, q1_1, q1_2]
  push_cast
  module

theorem moment2_V2_t2 :
    ∑ s ∈ Finset.Icc (-3:ℤ) 3, ((s:ℚ) ^ 2) • Q1 s (MvPolynomial.X 1)
      = (8:ℚ) • ((MvPolynomial.X 1 : V)) := by
  rw [sum7, q2_m3, q2_m2, q2_m1, q2_0, q2_1, q2_2, q2_3]
  push_cast
  module


#print axioms LemmaQc_V0
#print axioms LemmaQc_V1
#print axioms LemmaQa_V1
#print axioms LemmaQc_V2_t2
#print axioms pairing_h1
#print axioms pairing_h2_check
#print axioms B2_idempotence_fails
#print axioms B2_annihilation_fails
#print axioms B2_parseval_fails
#print axioms TheoremB2_refuted_h1
#print axioms moment1_V1
#print axioms moment2_V1
#print axioms moment2_V2_t2
