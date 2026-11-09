
/-! ## Milestone (d) companion: tightness of the master identity (dossier 01, A4 core)

On the TightMult extremal configuration — on-line atoms with integer multiplicities
`m_j ≤ c` on orthonormal vectors, plus `b` pair-blocks `Q = c·Π` (donor
`Zeta23/ZeroSide/TightMult.lean`) — all five named defects of the master identity
vanish simultaneously. Combined with donor `lemmaR_tight` (equality in the k-form) this
completes the structural pair: exact identity + exact tightness, each defect separately.
(No `set`/`have`-aliasing of the configuration terms: linarith needs syntactic atom
identity with the donor statement.) -/

namespace CrossMath.RankTraceDefect

open Matrix Finset Unitary
open scoped ComplexOrder
open RHLinalg Zeta23.ZeroSide.RankTraceMult Zeta23.ZeroSide.TightMult

variable {𝕜 : Type*} [RCLike 𝕜]

/-- **Tightness companion** (dossier 01, A4 core; R8 round-2 §1 re-scope: this is the
*finer five-defect simultaneous* characterization — AF v2 Lemma 3.2 states the base-lemma
equality case `P = Π₁, Q = 2Π₂` only). On the TightMult configuration with `m_j ≤ c`,
every defect of `master_identity` is exactly zero. -/
theorem tightness_of_master (r b : ℕ) (m : Fin r → ℕ) {c : ℝ} (hc : 0 < c)
    (hm : ∀ j, (m j : ℝ) ≤ c)
    (hPm : (Pmat (mR r m) (v r b)).IsHermitian)
    (hQmm : (hermNegPart (Q_isHermitian r b c hc.le)).IsHermitian) :
    pairingDefect c hPm hQmm = 0 ∧
    schurJensenDefect c (mR r m) (v r b) hPm = 0 ∧
    rearrangementDefect hPm hQmm = 0 ∧
    posCouplingDefect (Pmat (mR r m) (v r b)) (hermPosPart (Q_isHermitian r b c hc.le)) = 0 ∧
    pairBlockDefect c (Q_isHermitian r b c hc.le) = 0 := by
  have hQ : (Q r b c).IsHermitian := Q_isHermitian r b c hc.le
  have hmR : ∀ j, 0 ≤ mR r m j := fun j => by unfold mR; positivity
  -- donor tightness (equality in the k-form) and its index identification
  have hdonor := lemmaR_tight r b m c hc hm
  have hpi : posIndex hQ = b := posIndex_Q r b c hc
  -- master identity on the same configuration
  have hmid := master_identity (mR r m) (v r b) (Q r b c) hQ hPm hQmm hc
  -- the linear bridges (linarith is linear; pre-scale the variable coefficients)
  have hsplit2 : 2 * c * rtrace (Pmat (mR r m) (v r b) + Q r b c)
      = 2 * c * rtrace (Pmat (mR r m) (v r b)) + 2 * c * rtrace (Q r b c) := by
    rw [rtrace_add]; ring
  have hctrP : c * rtrace (Pmat (mR r m) (v r b))
      = c * ∑ j, mR r m j * xsq (v r b) j := by
    rw [rtrace_Pmat hmR (v r b)]
  have hkc : ∑ j, kc c (mR r m j * xsq (v r b) j)
      = c * ∑ j, mR r m j * xsq (v r b) j
        - ∑ j, gc c (mR r m j * xsq (v r b) j) := by
    rw [Finset.mul_sum, ← Finset.sum_sub_distrib]
    exact Finset.sum_congr rfl fun j _ => kc_eq c _
  have hc2 : c ^ 2 * (posIndex hQ : ℝ) = c ^ 2 * (b : ℝ) := by rw [hpi]
  -- defect nonnegativity on this configuration (all PSD instances available)
  have hnPt : 0 ≤ pairingDefect c hPm hQmm :=
    pairingDefect_nonneg (Pmat_posSemidef (mR r m) (v r b)) (hermNegPart_posSemidef hQ) hc.le
  have hnSJ : 0 ≤ schurJensenDefect c (mR r m) (v r b) hPm :=
    schurJensenDefect_nonneg (mR r m) hmR (v r b) hc.le
  have hnVn : 0 ≤ rearrangementDefect hPm hQmm := rearrangementDefect_nonneg hPm hQmm
  have hnCp : 0 ≤ posCouplingDefect (Pmat (mR r m) (v r b)) (hermPosPart hQ) :=
    posCouplingDefect_nonneg (Pmat_posSemidef (mR r m) (v r b)) (hermPosPart_posSemidef hQ)
  have hnQp : 0 ≤ pairBlockDefect c hQ := pairBlockDefect_nonneg c hQ
  unfold posCouplingDefect at hmid hnCp ⊢
  -- the sum of the five defects is zero (donor equality vs master identity)
  have hD : pairingDefect c hPm hQmm + schurJensenDefect c (mR r m) (v r b) hPm
      + 2 * rearrangementDefect hPm hQmm
      + 2 * RCLike.re (Pmat (mR r m) (v r b) * hermPosPart hQ).trace
      + pairBlockDefect c hQ = 0 := by
    linarith [hdonor, hmid, hsplit2, hctrP, hkc, hc2]
  refine ⟨?_, ?_, ?_, ?_, ?_⟩ <;> linarith [hD, hnPt, hnSJ, hnVn, hnCp, hnQp]

end CrossMath.RankTraceDefect

#print axioms CrossMath.RankTraceDefect.master_identity
#print axioms CrossMath.RankTraceDefect.rank_trace_mult_k_of_master
#print axioms Zeta23.ZeroSide.TightMult.lemmaR_tight
#print axioms CrossMath.RankTraceDefect.tightness_of_master
