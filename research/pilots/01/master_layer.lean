
/-! ## Milestone (c) layer: the master identity and its proof (dossier 01, Theorem A)

Appended after the full ported bundle (prefix 08). Proof obligations map to donor steps
(blueprint §2): S1 ← `hstep4` (RankTraceMult.lean:326); S2 ← `hstep5'` (:334) +
`sq_sub_ge_gc` (:81); S2' ← `sum_gc_eigenvalues_ge` (:270); S3 ← `hstep6` (:339) at
`b := posIndex hQ`; `frobSq_add_eq` ← `hexpand` (:314) promoted; MAIN replaces the
`linarith` at RankTraceMult.lean:346; the ACCEPTANCE TEST re-derives `rank_trace_mult_k`
(:369) by dropping the five defects. -/

namespace CrossMath.RankTraceDefect

open Matrix Finset Unitary
open scoped ComplexOrder
open RHLinalg Zeta23.ZeroSide.RankTraceMult

variable {𝕜 : Type*} [RCLike 𝕜]
variable {n : Type*} [Fintype n] [DecidableEq n]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-! ### The five defects -/

/-- Scalar defect `Δ_c(p,m) := (p−m)² − c·p − g_c(p) + 2c·m`. -/
def deltaC (c p m : ℝ) : ℝ := (p - m) ^ 2 - c * p - gc c p + 2 * c * m

/-- Δ_pt — pairing defect over the decreasingly sorted spectra of `P`, `Q₋`. -/
def pairingDefect (c : ℝ) {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) : ℝ :=
  ∑ k, deltaC c (hP.eigenvalues₀ k) (hQm.eigenvalues₀ k)

/-- Δ_SJ — Schur–Jensen defect. -/
def schurJensenDefect (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜) {P : Matrix n n 𝕜}
    (hP : P.IsHermitian) : ℝ :=
  ∑ k, gc c (hP.eigenvalues₀ k) - ∑ j, gc c (m j * xsq v j)

/-- Δ_vN — rearrangement defect. -/
def rearrangementDefect {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) : ℝ :=
  ∑ k, hP.eigenvalues₀ k * hQm.eigenvalues₀ k - RCLike.re (P * Qm).trace

/-- Δ₊ — positive-coupling defect. -/
def posCouplingDefect (P Qp : Matrix n n 𝕜) : ℝ :=
  2 * RCLike.re (P * Qp).trace

/-- Δ_Q+ — pair-block defect (spectral sum-of-squares form over the positive spectrum). -/
def pairBlockDefect (c : ℝ) {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) : ℝ :=
  ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), (hQ.eigenvalues i - c) ^ 2

/-! ### Nonnegativity of each defect -/

theorem deltaC_nonneg {c p m : ℝ} (hp : 0 ≤ p) (hm : 0 ≤ m) (hc : 0 ≤ c) :
    0 ≤ deltaC c p m := by
  unfold deltaC
  linarith [sq_sub_ge_gc hp hm hc]

/-- Sorted eigenvalues of a PSD matrix are nonnegative (donor idiom :298). -/
lemma eigenvalues₀_nonneg {P : Matrix n n 𝕜} (hP : P.PosSemidef)
    (k : Fin (Fintype.card n)) : 0 ≤ hP.isHermitian.eigenvalues₀ k := by
  rw [show hP.isHermitian.eigenvalues₀ k
      = hP.isHermitian.eigenvalues (eigEquiv k) from
    (eigenvalues_eigEquiv hP.isHermitian k).symm]
  exact hP.eigenvalues_nonneg _

theorem pairingDefect_nonneg {c : ℝ} {P Qm : Matrix n n 𝕜} (hP : P.PosSemidef)
    (hQm : Qm.PosSemidef) (hc : 0 ≤ c) :
    0 ≤ pairingDefect c hP.isHermitian hQm.isHermitian := by
  unfold pairingDefect
  exact Finset.sum_nonneg fun k _ => deltaC_nonneg (eigenvalues₀_nonneg hP k)
    (eigenvalues₀_nonneg hQm k) hc

theorem schurJensenDefect_nonneg {c : ℝ} (m : ι → ℝ) (hm : ∀ j, 0 ≤ m j)
    (v : ι → n → 𝕜) (hc : 0 ≤ c) :
    0 ≤ schurJensenDefect c m v (Pmat_posSemidef m v).1 := by
  have h := sum_gc_eigenvalues_ge hm v hc
  have e : ∑ i, gc c ((Pmat_posSemidef m v).1.eigenvalues i)
      = ∑ k, gc c ((Pmat_posSemidef m v).1.eigenvalues₀ k) :=
    sum_eigenvalues_reindex _ (gc c)
  unfold schurJensenDefect
  rw [← e]
  linarith

theorem rearrangementDefect_nonneg {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) :
    0 ≤ rearrangementDefect hP hQm := by
  unfold rearrangementDefect
  linarith [vonNeumann_trace_ineq hP hQm]

theorem posCouplingDefect_nonneg {P Qp : Matrix n n 𝕜}
    (hP : P.PosSemidef) (hQp : Qp.PosSemidef) :
    0 ≤ posCouplingDefect P Qp := by
  unfold posCouplingDefect
  linarith [trace_mul_nonneg_of_posSemidef hP hQp]

theorem pairBlockDefect_nonneg (c : ℝ) {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) :
    0 ≤ pairBlockDefect c hQ :=
  Finset.sum_nonneg fun i _ => sq_nonneg _

/-! ### S1: the rearrangement-defect equality (donor `hstep4` promoted) -/

theorem frob_split_rearrangement {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) :
    frobSq P - 2 * RCLike.re (P * Qm).trace + frobSq Qm
      = ∑ k, (hP.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
        + 2 * rearrangementDefect hP hQm := by
  have hfrobP : frobSq P = ∑ k, (hP.eigenvalues₀ k) ^ 2 := by
    rw [frobSq_hermitian_eq_sum_sq_eigenvalues hP]
    exact sum_eigenvalues_reindex hP (· ^ 2)
  have hfrobQm : frobSq Qm = ∑ k, (hQm.eigenvalues₀ k) ^ 2 := by
    rw [frobSq_hermitian_eq_sum_sq_eigenvalues hQm]
    exact sum_eigenvalues_reindex hQm (· ^ 2)
  have hsplit : ∑ k, (hP.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
      = ∑ k, (hP.eigenvalues₀ k) ^ 2 - 2 * ∑ k, hP.eigenvalues₀ k * hQm.eigenvalues₀ k
        + ∑ k, (hQm.eigenvalues₀ k) ^ 2 := by
    simp only [sub_sq, Finset.sum_add_distrib, Finset.sum_sub_distrib,
      Finset.mul_sum, mul_assoc]
  unfold rearrangementDefect
  linarith [hsplit, hfrobP, hfrobQm]

/-! ### S2: the pairing-defect equality (donor `hstep5'` promoted) -/

theorem pairing_split (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜) (Qm : Matrix n n 𝕜)
    (hPm : (Pmat m v).IsHermitian) (hQm : Qm.IsHermitian) :
    ∑ k, (hPm.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
      = c * rtrace (Pmat m v) + (∑ k, gc c (hPm.eigenvalues₀ k))
          - 2 * c * rtrace Qm
        + pairingDefect c hPm hQm := by
  have hterm : ∀ k : Fin (Fintype.card n),
      (hPm.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
        = c * hPm.eigenvalues₀ k + gc c (hPm.eigenvalues₀ k)
            - 2 * c * hQm.eigenvalues₀ k
            + deltaC c (hPm.eigenvalues₀ k) (hQm.eigenvalues₀ k) := by
    intro k; unfold deltaC; ring
  have hsum : ∑ k, (hPm.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
      = (c * ∑ k, hPm.eigenvalues₀ k + ∑ k, gc c (hPm.eigenvalues₀ k)
            - 2 * c * ∑ k, hQm.eigenvalues₀ k)
        + ∑ k, deltaC c (hPm.eigenvalues₀ k) (hQm.eigenvalues₀ k) := by
    rw [Finset.sum_congr rfl (fun k _ => hterm k), Finset.sum_add_distrib,
      Finset.sum_sub_distrib, Finset.sum_add_distrib, Finset.mul_sum, Finset.mul_sum]
  have htrP : rtrace (Pmat m v) = ∑ k, hPm.eigenvalues₀ k := by
    rw [rtrace_eq_sum_eigenvalues hPm]
    exact sum_eigenvalues_reindex hPm id
  have htrQm : rtrace Qm = ∑ k, hQm.eigenvalues₀ k := by
    rw [rtrace_eq_sum_eigenvalues hQm]
    exact sum_eigenvalues_reindex hQm id
  -- linarith is linear: pre-scale the trace↔sum bridges by c and 2c
  have hctrP : c * rtrace (Pmat m v) = c * ∑ k, hPm.eigenvalues₀ k := by rw [htrP]
  have hctrQm : 2 * c * rtrace Qm = 2 * c * ∑ k, hQm.eigenvalues₀ k := by rw [htrQm]
  unfold pairingDefect
  linarith [hsum, hctrP, hctrQm]

/-! ### S2': the Schur–Jensen split (definitional) -/

theorem schurJensenSplit (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜)
    {P : Matrix n n 𝕜} (hP : P.IsHermitian) :
    ∑ k, gc c (hP.eigenvalues₀ k)
      = ∑ j, gc c (m j * xsq v j) + schurJensenDefect c m v hP := by
  unfold schurJensenDefect; ring

/-! ### S3: the pair-block equality (donor `hstep6` at b := posIndex hQ) -/

/-- Filter idiom: positive-part sums restrict to the positive spectrum (f 0 = 0). -/
lemma sum_posPart_restrict {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) (f : ℝ → ℝ)
    (hf0 : f 0 = 0) :
    ∑ i, f ((hQ.eigenvalues i)⁺)
      = ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), f (hQ.eigenvalues i) := by
  calc ∑ i, f ((hQ.eigenvalues i)⁺)
      = ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i),
          f ((hQ.eigenvalues i)⁺) :=
        (Finset.sum_filter_of_ne
          (fun i _ hi => by
            by_contra h
            push_neg at h
            rw [posPart_eq_zero.mpr h] at hi
            exact hi hf0)).symm
    _ = ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), f (hQ.eigenvalues i) :=
        Finset.sum_congr rfl fun i hi => by
          rw [posPart_eq_self.mpr ((Finset.mem_filter.mp hi).2).le]

theorem pairBlock_split (c : ℝ) {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) :
    frobSq (hermPosPart hQ)
      = 2 * c * rtrace (hermPosPart hQ) - c ^ 2 * (posIndex hQ : ℝ)
        + pairBlockDefect c hQ := by
  have hfilt2' := sum_posPart_restrict hQ (fun x => x ^ 2) (by norm_num)
  have hfilt2 : ∑ i, ((hQ.eigenvalues i)⁺) ^ 2
      = ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i),
          (hQ.eigenvalues i) ^ 2 := hfilt2'
  have hfilt1' := sum_posPart_restrict hQ (fun x => x) (rfl)
  have hfilt1 : ∑ i, (hQ.eigenvalues i)⁺
      = ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), hQ.eigenvalues i :=
    hfilt1' 
  have hfrob : frobSq (hermPosPart hQ) = ∑ i, ((hQ.eigenvalues i)⁺) ^ 2 :=
    frobSq_hermPosPart hQ
  have htr : rtrace (hermPosPart hQ) = ∑ i, (hQ.eigenvalues i)⁺ := rtrace_hermPosPart hQ
  -- expand the defect on the filtered support: Σ (q−c)² = Σq² − 2c·Σq + c²·#filter
  have hexp : pairBlockDefect c hQ
      = (∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i),
            (hQ.eigenvalues i) ^ 2)
        - 2 * c * (∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i),
            hQ.eigenvalues i)
        + c ^ 2 * ((Finset.univ.filter (fun i => 0 < hQ.eigenvalues i)).card : ℝ) := by
    have hterm : ∀ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i),
        (hQ.eigenvalues i - c) ^ 2
          = (hQ.eigenvalues i) ^ 2 - 2 * c * hQ.eigenvalues i + c ^ 2 :=
      fun i _ => by ring
    have hcs : ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), c ^ 2
        = ((Finset.univ.filter (fun i => 0 < hQ.eigenvalues i)).card : ℝ) * c ^ 2 := by
      rw [Finset.sum_const, nsmul_eq_mul]
    calc pairBlockDefect c hQ
        = ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i),
              ((hQ.eigenvalues i) ^ 2 - 2 * c * hQ.eigenvalues i + c ^ 2) := by
          unfold pairBlockDefect
          exact Finset.sum_congr rfl (fun i hi => hterm i hi)
      _ = (∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), (hQ.eigenvalues i) ^ 2)
            - 2 * c * (∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i),
                hQ.eigenvalues i)
            + c ^ 2 * ((Finset.univ.filter (fun i => 0 < hQ.eigenvalues i)).card : ℝ) := by
          rw [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.mul_sum, hcs]
          ring
  -- #(positive spectrum) = posIndex by definition
  have hcard : ((Finset.univ.filter (fun i => 0 < hQ.eigenvalues i)).card : ℝ)
      = (posIndex hQ : ℝ) := by
    unfold posIndex
    rfl
  rw [hfrob, htr, hfilt2, hfilt1, hexp, hcard]
  linarith

/-! ### `hexpand` promoted -/

theorem frobSq_add_eq {P Qp Qm Q : Matrix n n 𝕜} (hP : P.IsHermitian)
    (hQp : Qp.PosSemidef) (hQm : Qm.PosSemidef) (hQpQm : Qp * Qm = 0)
    (hQdec : Q = Qp - Qm) :
    frobSq (P + Q)
      = frobSq P + 2 * RCLike.re (P * Qp).trace - 2 * RCLike.re (P * Qm).trace
        + frobSq Qp + frobSq Qm := by
  have h1 : frobSq (-Qm) = frobSq Qm := by
    unfold frobSq; rw [conjTranspose_neg, neg_mul_neg]
  have h2 : RCLike.re (Qp * -Qm).trace = 0 := by
    rw [mul_neg, hQpQm]; simp
  rw [hQdec, frobSq_add_hermitian hP (hQp.isHermitian.sub hQm.isHermitian),
    sub_eq_add_neg Qp Qm,
    frobSq_add_hermitian hQp.isHermitian hQm.isHermitian.neg,
    h1, h2, mul_add, mul_neg, trace_add, trace_neg, map_add, map_neg]
  ring

/-! ### MAIN — the master identity -/

/-- **Master identity** (dossier 01, Theorem A): Frobenius energy = rank–trace certificate
(at the sharp budget `b = n₊(Q)`) + the five named defects, exactly. The Hermitian-proof
binders `hPm`, `hQmm` are discharged by `(Pmat_posSemidef m v).1` and
`specMap_isHermitian hQ _` at call sites. Replaces the `linarith` at
`RankTraceMult.lean:346`. -/
theorem master_identity (m : ι → ℝ) (v : ι → n → 𝕜) (Q : Matrix n n 𝕜)
    (hQ : Q.IsHermitian) (hPm : (Pmat m v).IsHermitian)
    (hQmm : (hermNegPart hQ).IsHermitian) {c : ℝ} (hc : 0 < c) :
    frobSq (Pmat m v + Q)
      = c * rtrace (Pmat m v) + (∑ j, gc c (m j * xsq v j)) + 2 * c * rtrace Q
          - c ^ 2 * (posIndex hQ : ℝ)
        + pairingDefect c hPm hQmm
        + schurJensenDefect c m v hPm
        + 2 * rearrangementDefect hPm hQmm
        + posCouplingDefect (Pmat m v) (hermPosPart hQ)
        + pairBlockDefect c hQ := by
  have hexp := frobSq_add_eq hPm (hermPosPart_posSemidef hQ)
    (hermNegPart_posSemidef hQ) (hermPosPart_mul_hermNegPart hQ)
    (hermPosPart_sub_hermNegPart hQ).symm
  have h1 := frob_split_rearrangement hPm hQmm
  have h2 := pairing_split c m v (hermNegPart hQ) hPm hQmm
  have h2' := schurJensenSplit c m v hPm
  have h3 := pairBlock_split c hQ
  have htrQ : 2 * c * rtrace Q
      = 2 * c * rtrace (hermPosPart hQ) - 2 * c * rtrace (hermNegPart hQ) := by
    have hrt : rtrace Q = rtrace (hermPosPart hQ) - rtrace (hermNegPart hQ) := by
      have h := rtrace_sub (hermPosPart hQ) (hermNegPart hQ)
      rw [hermPosPart_sub_hermNegPart hQ] at h
      exact h
    rw [hrt]; ring
  unfold pairingDefect at h2 ⊢
  unfold schurJensenDefect at h2' ⊢
  unfold rearrangementDefect at h1 ⊢
  unfold posCouplingDefect at ⊢
  linarith [hexp, h1, h2, h2', h3, htrQ]

/-! ### ACCEPTANCE TEST: re-derive the donor theorem by dropping the defects -/

/-- Donor `rank_trace_mult_k` (RankTraceMult.lean:369) re-derived from `master_identity`
by dropping the five nonnegative defects — the regression anchor proving the port and the
identity faithful. -/
theorem rank_trace_mult_k_of_master {m : ι → ℝ} (hm : ∀ j, 0 ≤ m j) (v : ι → n → 𝕜)
    {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) {b : ℕ} (hb : posIndex hQ ≤ b)
    {c : ℝ} (hc : 0 < c) :
    2 * c * rtrace (Pmat m v + Q) - frobSq (Pmat m v + Q)
      ≤ (∑ j, kc c (m j * xsq v j)) + c ^ 2 * b := by
  have hPm : (Pmat m v).IsHermitian := (Pmat_posSemidef m v).1
  have hQmm : (hermNegPart hQ).IsHermitian := specMap_isHermitian hQ _
  have hmid := master_identity m v Q hQ hPm hQmm hc
  have hnPt : 0 ≤ pairingDefect c hPm hQmm :=
    pairingDefect_nonneg (Pmat_posSemidef m v) (hermNegPart_posSemidef hQ) hc.le
  have hnSJ : 0 ≤ schurJensenDefect c m v hPm :=
    schurJensenDefect_nonneg m hm v hc.le
  have hnVn : 0 ≤ rearrangementDefect hPm hQmm := rearrangementDefect_nonneg hPm hQmm
  have hnCp : 0 ≤ posCouplingDefect (Pmat m v) (hermPosPart hQ) :=
    posCouplingDefect_nonneg (Pmat_posSemidef m v) (hermPosPart_posSemidef hQ)
  have hnQp : 0 ≤ pairBlockDefect c hQ := pairBlockDefect_nonneg c hQ
  have htrP : rtrace (Pmat m v) = ∑ j, m j * xsq v j := rtrace_Pmat hm v
  have hkc : ∑ j, kc c (m j * xsq v j)
      = c * ∑ j, m j * xsq v j - ∑ j, gc c (m j * xsq v j) := by
    rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl fun j _ => kc_eq c _
  -- linarith is linear: pre-scale the two variable-coefficient bridges (2·c and c²)
  have hsplit2 : 2 * c * rtrace (Pmat m v + Q)
      = 2 * c * rtrace (Pmat m v) + 2 * c * rtrace Q := by
    rw [rtrace_add]; ring
  have hctrP : c * rtrace (Pmat m v) = c * ∑ j, m j * xsq v j := by rw [htrP]
  have hc2 : c ^ 2 * (posIndex hQ : ℝ) ≤ c ^ 2 * (b : ℝ) :=
    mul_le_mul_of_nonneg_left (by exact_mod_cast hb) (sq_nonneg c)
  unfold posCouplingDefect at hmid hnCp
  linarith [hmid, hnPt, hnSJ, hnVn, hnCp, hnQp, hkc, hsplit2, hctrP, hc2]

#print axioms master_identity
#print axioms rank_trace_mult_k_of_master
#print axioms rank_trace_ineq
#print axioms rank_trace_mult
#print axioms rank_trace_mult_k
#print axioms vonNeumann_trace_ineq
#print axioms posIndex_conj_le
#print axioms weyl_posIndexAbove_le
#print axioms rank_trace_mult_k_le

end CrossMath.RankTraceDefect
