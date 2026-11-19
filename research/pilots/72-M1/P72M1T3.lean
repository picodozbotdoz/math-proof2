/-
  Pilot 72-M1, tranche T3 (iteration 4, W2-4 continuation) — L3 complete: L3a
  (per-term Hermiticity by symmetrization), L3b (state conventions), the reverse
  boundary bound, L3c (form → Loewner gap transfer), L3d (Hamiltonian transport,
  injection-compression shape) and the interface theorem.

  Spec: `pilots/72-M1/L3-spec.md` §2–§6 (L3a landed 2026-11-16; L3b–d + interface per
  the W2-4 re-task, 2026-11-19); companion `72-prework.md` §2.2–2.3. Guards: ≤ 8 runs
  for the L3 continuation with enforced descent (L3a's own descent logged in
  `logs/l3a-run{1..3}*.log`).

  Two statement-shape notes vs the spec sketch (recorded for the tranche report):

  1. `hermPart` is IMPLEMENTED as `(2⁻¹ : ℂ) • (a + aᴴ)`, not the sketched
     `(a + aᴴ) / 2`: at `Operator = Matrix` the ring-division `/ 2` routes through
     junk `Ring.inverse (2 : Matrix)` (Matrix is not a division ring), so the
     componentwise reading of the sketch is the scalar smul (the W1-correction
     precedent: formalization forces a shape fix). `hermPart_smul` is then `rfl`.

  2. `hamiltonian_hermPart` carries the hypothesis `hH : (Hamiltonian hv he).IsHermitian`.
     map_sum over the linear symmetrization gives
     `Hamiltonian (hermPart ∘ hv) (hermPart ∘ he) = hermPart (Hamiltonian hv he)`, which
     equals `Hamiltonian hv he` exactly when the sum is Hermitian — the case
     `IsGridHamiltonian` supplies and prework §2.2(v) presumes ("Hamiltonian hv' he' = H").
     Without hH the sketched equality is false (anti-Hermitian parts would cancel).

  Proof artifact: no `sorry`, no `native_decide`, no external CAS.
-/
import P72M1T2

namespace CrossMath.Pilot72.M1

open Arealaw OpenAI OAI PolynomialPEPS.PinnedEntropy
open Matrix SimpleGraph
open scoped ComplexOrder MatrixOrder Matrix.Norms.L2Operator

/-! ## L3a spine -/

/-- The Hermitian part of an operator (L3-spec §2; see header note 1 for the smul form). -/
noncomputable def hermPart {L q : ℕ} (a : Operator L q) : Operator L q := (2⁻¹ : ℂ) • (a + aᴴ)

theorem hermPart_smul {L q : ℕ} (a : Operator L q) :
    hermPart a = (2⁻¹ : ℂ) • (a + aᴴ) := rfl

theorem hermPart_eq_self {L q : ℕ} {a : Operator L q} (ha : a.IsHermitian) :
    hermPart a = a := by
  have h : aᴴ = a := ha
  rw [hermPart_smul, h]
  ext x y
  show (2⁻¹ : ℂ) * (a x y + a x y) = a x y
  ring

theorem hermPart_add {L q : ℕ} (a b : Operator L q) :
    hermPart (a + b) = hermPart a + hermPart b := by
  rw [hermPart_smul, hermPart_smul, hermPart_smul, Matrix.conjTranspose_add, ← smul_add]
  congr 1
  abel

theorem hermPart_zero {L q : ℕ} : hermPart (0 : Operator L q) = 0 := by
  simp [hermPart]

theorem hermPart_sum {ι : Type*} [DecidableEq ι] {L q : ℕ} (s : Finset ι)
    (f : ι → Operator L q) :
    ∑ i ∈ s, hermPart (f i) = hermPart (∑ i ∈ s, f i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simp [hermPart_zero]
  | insert x s hxs ih => rw [Finset.sum_insert hxs, Finset.sum_insert hxs, ih, hermPart_add]

/-! ## L3a declarations (L3-spec §2, names verbatim) -/

theorem hermPart_isHermitian {L q : ℕ} (a : Operator L q) : (hermPart a).IsHermitian := by
  have hs : star ((2⁻¹ : ℂ)) = 2⁻¹ := by rw [star_inv₀, star_ofNat]
  show (hermPart a)ᴴ = hermPart a
  rw [hermPart_smul, Matrix.conjTranspose_smul, Matrix.conjTranspose_add,
      Matrix.conjTranspose_conjTranspose, hs]
  congr 1
  abel

theorem opNorm_hermPart_le {L q : ℕ} (a : Operator L q) : opNorm (hermPart a) ≤ opNorm a := by
  have hN : ∀ b : Operator L q, opNorm b = ‖b‖ := fun _ => rfl
  calc opNorm (hermPart a) = ‖(2⁻¹ : ℂ) • (a + aᴴ)‖ := hN _
    _ ≤ ‖(2⁻¹ : ℂ)‖ * ‖a + aᴴ‖ := norm_smul_le _ _
    _ ≤ ‖(2⁻¹ : ℂ)‖ * (‖a‖ + ‖aᴴ‖) :=
        mul_le_mul_of_nonneg_left (norm_add_le a aᴴ) (norm_nonneg _)
    _ = ‖a‖ := by
        rw [Matrix.l2_opNorm_conjTranspose]
        have h2 : ‖(2⁻¹ : ℂ)‖ = 2⁻¹ := by
          rw [norm_inv]; norm_num
        rw [h2]
        ring

theorem supportedOn_hermPart {L q : ℕ} {S : Finset (Vertex L)} {a : Operator L q}
    (h : SupportedOn a S) : SupportedOn (hermPart a) S := by
  obtain ⟨aS, rfl⟩ := h
  refine ⟨(2⁻¹ : ℂ) • (aS + aSᴴ), ?_⟩
  have h1 : ∀ (A : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ),
      (liftLocal S A)ᴴ = liftLocal S (Aᴴ) := by
    intro A
    ext x y
    by_cases hx : ∀ v, v ∉ S → x v = y v
    · have hy : ∀ v, v ∉ S → y v = x v := fun v hv => (hx v hv).symm
      rw [Matrix.conjTranspose_apply]
      simp only [liftLocal]
      rw [if_pos hy, if_pos hx, Matrix.conjTranspose_apply]
    · have hy : ¬(∀ v, v ∉ S → y v = x v) := fun hh => hx fun v hv => (hh v hv).symm
      rw [Matrix.conjTranspose_apply]
      simp only [liftLocal]
      rw [if_neg hy, if_neg hx, star_zero]
  have h2 : ∀ (A B : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ),
      liftLocal S (A + B) = liftLocal S A + liftLocal S B := by
    intro A B
    ext x y
    by_cases hx : ∀ v, v ∉ S → x v = y v
    · simp only [liftLocal, Matrix.add_apply]
      rw [if_pos hx, if_pos hx, if_pos hx]
    · simp only [liftLocal, Matrix.add_apply]
      rw [if_neg hx, if_neg hx, if_neg hx, zero_add]
  have h3 : ∀ (c : ℂ) (A : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ),
      liftLocal S (c • A) = c • liftLocal S A := by
    intro c A
    ext x y
    by_cases hx : ∀ v, v ∉ S → x v = y v
    · simp only [liftLocal, Matrix.smul_apply, smul_eq_mul]
      rw [if_pos hx, if_pos hx]
    · simp only [liftLocal, Matrix.smul_apply, smul_eq_mul]
      rw [if_neg hx, if_neg hx, mul_zero]
  rw [hermPart_smul, h1 aS, ← h2, ← h3]

theorem hamiltonian_hermPart {L q : ℕ} (hv : Vertex L → Operator L q)
    (he : Edge L → Operator L q) (hH : (Hamiltonian hv he).IsHermitian) :
    Hamiltonian (fun v => hermPart (hv v)) (fun e => hermPart (he e))
      = Hamiltonian hv he := by
  have e1 : ∑ v, hermPart (hv v) = hermPart (∑ v, hv v) := hermPart_sum _ _
  have e2 : ∑ e, hermPart (he e) = hermPart (∑ e, he e) := hermPart_sum _ _
  show (∑ v, hermPart (hv v)) + ∑ e, hermPart (he e) = (∑ v, hv v) + ∑ e, he e
  rw [e1, e2, ← hermPart_add]
  exact hermPart_eq_self hH

/-! ## L3b — state conventions (spec §3): the hΩ discharge -/

theorem fin_eq_of_val_eq {n : ℕ} {a b : Fin n} (h : a.val = b.val) : a = b :=
  Fin.val_injective h

/-- **L3b.** The transported state is unit-norm in the dotProduct sense, discharging the
`hΩ` binder of `pureState` from `UniqueGround`'s `‖Ω‖ = 1`. -/
theorem toGrid_eq_ofLp {L q : ℕ} (Ω : State L q) (c : Reg (Qudits q) (gridDom L)) :
    toGrid L q Ω c = WithLp.ofLp Ω (configEquiv L q c) := rfl

theorem toGrid_star_dotProduct_self {L q : ℕ} (Ω : State L q) (hΩn : ‖Ω‖ = 1) :
    star (toGrid L q Ω) ⬝ᵥ (toGrid L q Ω) = 1 := by
  have hz : ∀ z : ℂ, star z * z = ((‖z‖ ^ 2 : ℝ) : ℂ) := fun z => by
    rw [RCLike.star_def, ← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq]
  have h1 : star (toGrid L q Ω) ⬝ᵥ toGrid L q Ω
      = ∑ c : Reg (Qudits q) (gridDom L), ((‖toGrid L q Ω c‖ ^ 2 : ℝ) : ℂ) := by
    rw [show star (toGrid L q Ω) ⬝ᵥ toGrid L q Ω
        = ∑ c : Reg (Qudits q) (gridDom L), star (toGrid L q Ω c) * toGrid L q Ω c from rfl]
    exact Finset.sum_congr rfl fun c _ => hz _
  have h2 : ∑ c : Reg (Qudits q) (gridDom L), ((‖toGrid L q Ω c‖ ^ 2 : ℝ) : ℂ)
      = ∑ g : Configuration L q, ((‖WithLp.ofLp Ω g‖ ^ 2 : ℝ) : ℂ) :=
    Fintype.sum_equiv (configEquiv L q)
      (fun c => ((‖toGrid L q Ω c‖ ^ 2 : ℝ) : ℂ))
      (fun g => ((‖WithLp.ofLp Ω g‖ ^ 2 : ℝ) : ℂ)) fun c => by
      rw [toGrid_eq_ofLp]
  have h3 : ∑ g : Configuration L q, ((‖WithLp.ofLp Ω g‖ ^ 2 : ℝ) : ℂ)
      = ((‖Ω‖ ^ 2 : ℝ) : ℂ) := by
    rw [← Complex.ofReal_sum, ← EuclideanSpace.norm_sq_eq Ω]
  rw [h1, h2, h3, hΩn]
  push_cast
  ring

/-! ## The reverse boundary bound (interface step viii's missing half) -/

/-- Square-lattice adjacency of two grid points splits into forward adjacency one way
or the other. -/
theorem adj_split {L : ℕ} {v w : Vertex L}
    (h : (hasse ℤ □ hasse ℤ).Adj (iotaL v) (iotaL w)) :
    ForwardAdjacent v w ∨ ForwardAdjacent w v := by
  rw [adj_squareLattice] at h
  rcases h with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · simp only [iotaL] at h1 h2
    rcases h1 with h1 | h1
    · exact Or.inl (show (v.1.val + 1 = w.1.val ∧ v.2 = w.2)
          ∨ (v.1 = w.1 ∧ v.2.val + 1 = w.2.val) from
        Or.inl (And.intro (by omega) (fin_eq_of_val_eq (by omega))))
    · exact Or.inl (show (w.1.val + 1 = v.1.val ∧ w.2 = v.2)
          ∨ (w.1 = v.1 ∧ w.2.val + 1 = v.2.val) from
        Or.inl (And.intro (by omega) (fin_eq_of_val_eq (by omega))))
  · simp only [iotaL] at h1 h2
    rcases h1 with h1 | h1
    · exact Or.inr (show (w.1.val + 1 = v.1.val ∧ w.2 = v.2)
          ∨ (w.1 = v.1 ∧ w.2.val + 1 = v.2.val) from
        Or.inr (And.intro (fin_eq_of_val_eq (by omega)) (by omega)))
    · exact Or.inr (show (v.1.val + 1 = w.1.val ∧ v.2 = w.2)
          ∨ (v.1 = w.1 ∧ v.2.val + 1 = w.2.val) from
        Or.inr (And.intro (fin_eq_of_val_eq (by omega)) (by omega)))

/-- Every lattice boundary edge of the grid image comes from a crossing grid edge —
the reverse of T2's `orientPair` embedding. With `boundaryCard_le_edgeBoundary` (T2)
this pins the two boundary counts equal; only this direction is what the interface's
final chain consumes. -/
theorem edgeBoundary_le_boundaryCard {L : ℕ} (A : Finset (Vertex L)) :
    (edgeBoundary (gridDom L) (iotaLimg A)).card ≤ boundaryCard A := by
  classical
  have hsub : edgeBoundary (gridDom L) (iotaLimg A) ⊆
      (Finset.univ : Finset {e : Edge L // crosses A e}).image (fun e => orientPair A e.val) := by
    intro p hp
    simp only [edgeBoundary, SimpleGraph.interedges, Rel.interedges, Finset.mem_filter,
      Finset.mem_product] at hp
    obtain ⟨⟨h1, h2⟩, h3⟩ := hp
    obtain ⟨v, hvA, hvx⟩ := Finset.mem_image.1 h1
    have hyD : p.2 ∈ gridDom L := (Finset.mem_sdiff.1 h2).1
    have hyA : p.2 ∉ iotaLimg A := (Finset.mem_sdiff.1 h2).2
    set w : Vertex L := gridVertex (L := L) ⟨p.2, hyD⟩ with hwdef
    have hw2 : iotaL w = p.2 := iotaL_gridVertex _
    have hwA : w ∉ A := by
      intro hc
      exact hyA (by rw [← hw2]; exact iotaL_mem_image hc)
    rw [← hvx, ← hw2] at h3
    rcases adj_split h3 with hFA | hFA
    · refine Finset.mem_image.2 ⟨(⟨⟨(v, w), hFA⟩, Or.inl ⟨hvA, hwA⟩⟩ :
          {e : Edge L // crosses A e}), Finset.mem_univ _, ?_⟩
      rw [orientPair_of_mem hvA]
      exact Prod.ext hvx hw2
    · refine Finset.mem_image.2 ⟨(⟨⟨(w, v), hFA⟩, Or.inr ⟨hwA, hvA⟩⟩ :
          {e : Edge L // crosses A e}), Finset.mem_univ _, ?_⟩
      rw [orientPair_of_not_mem hwA]
      exact Prod.ext hvx hw2
  have hb : boundaryCard A
      = ((Finset.univ : Finset {e : Edge L // crosses A e}).image
          (fun e => orientPair A e.val)).card := by
    rw [Finset.card_image_of_injOn (fun a _ b _ h => orientPair_injective A h)]
    rw [Finset.card_univ]
    exact Fintype.card_congr' (α := {e : Edge L //
      (e.val.1 ∈ A ∧ e.val.2 ∉ A) ∨ (e.val.1 ∉ A ∧ e.val.2 ∈ A)}) rfl
  calc (edgeBoundary (gridDom L) (iotaLimg A)).card
      ≤ ((Finset.univ : Finset {e : Edge L // crosses A e}).image
          (fun e => orientPair A e.val)).card := Finset.card_le_card hsub
    _ = boundaryCard A := hb.symm

/-! ## L3c — form → Loewner (gap transfer, interface step vi) -/

set_option maxHeartbeats 1000000 in
/-- **L3c.** The consumer's quadratic-form gap transfers to the producer's Loewner-form
gap on the reindexed Hamiltonian. (Statement-shape note vs the spec sketch: the
Hermiticity of `H` enters as an explicit binder — the Loewner form is only defined on
the Hermitian difference; `IsGridHamiltonian` supplies it in the interface.) -/
theorem hasGlobalGap_of_fullSystemGap {L q : ℕ} (H : Operator L q) (Ω : State L q)
    (E₀ Δ : ℝ) (hH : H.IsHermitian) (hΩn : ‖Ω‖ = 1)
    (hGap : FullSystemGap H Ω E₀ Δ) :
    HasGlobalGap (H.submatrix (configEquiv L q) (configEquiv L q)) (toGrid L q Ω) E₀ Δ := by
  classical
  set ec := configEquiv L q with hec
  set Ω' := toGrid L q Ω with hΩ'
  show ((H.submatrix ec ec - (E₀ : ℂ) • 1
      - (Δ : ℂ) • (1 - vecMulVec Ω' (star Ω'))).PosSemidef)
  have hHerm : (H.submatrix ec ec - (E₀ : ℂ) • 1
      - (Δ : ℂ) • (1 - vecMulVec Ω' (star Ω'))).IsHermitian := by
    have hH' : (H.submatrix ec ec).IsHermitian := by
      show (H.submatrix ec ec)ᴴ = H.submatrix ec ec
      rw [Matrix.conjTranspose_submatrix, hH]
    have hvv : (vecMulVec Ω' (star Ω')).IsHermitian :=
      (Matrix.posSemidef_vecMulVec_self_star Ω').isHermitian
    have hE : star ((E₀ : ℂ)) = (E₀ : ℂ) := by rw [RCLike.star_def, Complex.conj_ofReal]
    have hD : star ((Δ : ℂ)) = (Δ : ℂ) := by rw [RCLike.star_def, Complex.conj_ofReal]
    show (H.submatrix ec ec - (E₀ : ℂ) • 1
        - (Δ : ℂ) • (1 - vecMulVec Ω' (star Ω')))ᴴ = _
    have hb : ((E₀ : ℂ) • (1 : Matrix (Reg (Qudits q) (gridDom L))
        (Reg (Qudits q) (gridDom L)) ℂ))ᴴ = (E₀ : ℂ) • 1 := by
      rw [Matrix.conjTranspose_smul, Matrix.conjTranspose_one, hE]
    have hc : ((Δ : ℂ) • (1 - vecMulVec Ω' (star Ω')))ᴴ
        = (Δ : ℂ) • (1 - vecMulVec Ω' (star Ω')) := by
      rw [Matrix.conjTranspose_smul, Matrix.conjTranspose_sub, Matrix.conjTranspose_one,
        hD, hvv]
    have ha : (H.submatrix ec ec)ᴴ = H.submatrix ec ec := by
      rw [Matrix.conjTranspose_submatrix, hH]
    rw [Matrix.conjTranspose_sub, Matrix.conjTranspose_sub, ha, hb, hc]
  refine Matrix.posSemidef_iff_dotProduct_mulVec.mpr ⟨hHerm, ?_⟩
  intro x
  set u : Configuration L q → ℂ := fun g => x (ec.symm g) with hu
  set ψ : State L q := WithLp.toLp 2 u with hψ
  -- the three transports
  have hz2 : ∀ z : ℂ, star z * z = ((‖z‖ ^ 2 : ℝ) : ℂ) := fun z => by
    rw [RCLike.star_def, ← Complex.normSq_eq_conj_mul_self, Complex.normSq_eq_norm_sq]
  have hSx : star x ⬝ᵥ x = ((‖ψ‖ ^ 2 : ℝ) : ℂ) := by
    calc star x ⬝ᵥ x = ∑ c : Reg (Qudits q) (gridDom L), star (x c) * x c := rfl
      _ = ∑ g : Configuration L q, star (u g) * u g :=
          Fintype.sum_equiv ec (fun c => star (x c) * x c)
            (fun g => star (u g) * u g) fun c => by rw [hu]; simp [Equiv.symm_apply_apply]
      _ = ∑ g : Configuration L q, ((‖WithLp.ofLp ψ g‖ ^ 2 : ℝ) : ℂ) :=
          Finset.sum_congr rfl fun g _ => hz2 _
      _ = ((∑ g : Configuration L q, ‖WithLp.ofLp ψ g‖ ^ 2 : ℝ) : ℂ) := by
          rw [← Complex.ofReal_sum]
      _ = ((‖ψ‖ ^ 2 : ℝ) : ℂ) := by rw [← EuclideanSpace.norm_sq_eq ψ]
  have hQ : star x ⬝ᵥ ((H.submatrix ec ec) *ᵥ x) = (inner ℂ ψ (asMap H ψ) : ℂ) := by
    have hR : (inner ℂ ψ (asMap H ψ) : ℂ)
        = ∑ c : Reg (Qudits q) (gridDom L), ∑ d : Reg (Qudits q) (gridDom L),
            star (x c) * (H (ec c) (ec d) * x d) := by
      rw [show (inner ℂ ψ (asMap H ψ) : ℂ) = WithLp.ofLp (asMap H ψ) ⬝ᵥ star (WithLp.ofLp ψ) from
          EuclideanSpace.inner_eq_star_dotProduct ψ (asMap H ψ)]
      rw [show WithLp.ofLp (asMap H ψ) = H *ᵥ u from ofLp_toEuclideanCLM H ψ]
      have h4 : ∀ g : Configuration L q, u g = x (ec.symm g) := fun g => rfl
      calc (H *ᵥ u) ⬝ᵥ star u
          = ∑ g : Configuration L q, ∑ g' : Configuration L q, H g g' * u g' * star (u g) := by
            simp [Matrix.mulVec, dotProduct]
        _ = ∑ c : Reg (Qudits q) (gridDom L), ∑ d : Reg (Qudits q) (gridDom L),
              H (ec c) (ec d) * x d * star (x c) := by
            refine Fintype.sum_equiv ec _ _ fun c => ?_
            refine Fintype.sum_equiv ec _ _ fun d => ?_
            rw [h4, h4]
            simp only [Equiv.symm_apply_apply]
        _ = ∑ c : Reg (Qudits q) (gridDom L), ∑ d : Reg (Qudits q) (gridDom L),
              star (x c) * (H (ec c) (ec d) * x d) :=
            Finset.sum_congr rfl fun c _ => Finset.sum_congr rfl fun d _ => by ring
    rw [hR]
    simp only [dotProduct, Matrix.mulVec, Matrix.submatrix_apply]
  have hN : star x ⬝ᵥ (vecMulVec Ω' (star Ω') *ᵥ x)
      = ((‖(inner ℂ Ω ψ : ℂ)‖ ^ 2 : ℝ) : ℂ) := by
    have hmul : ∀ c : Reg (Qudits q) (gridDom L),
        (vecMulVec Ω' (star Ω') *ᵥ x) c = Ω' c * (star Ω' ⬝ᵥ x) := by
      intro c
      simp [Matrix.mulVec, Matrix.dotProduct, Matrix.vecMulVec_apply, mul_assoc]
    have hin : (inner ℂ Ω ψ : ℂ) = star Ω' ⬝ᵥ x := by
      rw [show (inner ℂ Ω ψ : ℂ) = WithLp.ofLp ψ ⬝ᵥ star (WithLp.ofLp Ω) from EuclideanSpace.inner_eq_star_dotProduct Ω ψ]
      have h4 : ∀ g : Configuration L q, u g = x (ec.symm g) := fun g => rfl
      calc WithLp.ofLp ψ ⬝ᵥ star (WithLp.ofLp Ω)
          = ∑ g : Configuration L q, u g * star (WithLp.ofLp Ω g) := rfl
        _ = ∑ c : Reg (Qudits q) (gridDom L), x c * star (Ω' c) :=
            Fintype.sum_equiv ec (fun g => u g * star (WithLp.ofLp Ω g))
              (fun c => x c * star (Ω' c)) fun c => by
              rw [h4, toGrid_eq_ofLp]
        _ = star Ω' ⬝ᵥ x := by
            simp only [dotProduct]
            exact Finset.sum_congr rfl fun c _ => mul_comm _ _
    calc star x ⬝ᵥ (vecMulVec Ω' (star Ω') *ᵥ x)
        = (∑ c : Reg (Qudits q) (gridDom L), star (x c) * Ω' c) * (star Ω' ⬝ᵥ x) := by
          show ∑ c : Reg (Qudits q) (gridDom L), star (x c) * (vecMulVec Ω' (star Ω') *ᵥ x) c = _
          rw [Finset.sum_congr rfl fun c _ => hmul c, ← Finset.sum_mul]
      _ = star (star Ω' ⬝ᵥ x) * (star Ω' ⬝ᵥ x) := by
          congr 1
          simp only [dotProduct, star_sum]
          exact Finset.sum_congr rfl fun c _ => by rw [star_mul, star_star]
      _ = ↑(Complex.normSq (star Ω' ⬝ᵥ x)) := by
          rw [RCLike.star_def, Complex.normSq_eq_conj_mul_self]
      _ = ((‖(inner ℂ Ω ψ : ℂ)‖ ^ 2 : ℝ) : ℂ) := by
          rw [← hin, Complex.normSq_eq_norm_sq]
  -- reality of the Hermitian form
  have hstarH : ∀ i j : Configuration L q, star (H i j) = H j i := by
    intro i j
    rw [← hH, Matrix.conjTranspose_apply, star_star]
  have hreal : (inner ℂ ψ (asMap H ψ) : ℂ).im = 0 := by
    have hform : (inner ℂ ψ (asMap H ψ) : ℂ)
        = ∑ g : Configuration L q, ∑ g' : Configuration L q, H g g' * u g' * star (u g) := by
      rw [show (inner ℂ ψ (asMap H ψ) : ℂ) = WithLp.ofLp (asMap H ψ) ⬝ᵥ star (WithLp.ofLp ψ) from
          EuclideanSpace.inner_eq_star_dotProduct ψ (asMap H ψ)]
      rw [show WithLp.ofLp (asMap H ψ) = H *ᵥ u from ofLp_toEuclideanCLM H ψ]
      rfl
    have hz : (inner ℂ ψ (asMap H ψ) : ℂ) = Complex.conj (inner ℂ ψ (asMap H ψ) : ℂ) := by
      rw [hform]
      have h1 : star (∑ g : Configuration L q, ∑ g' : Configuration L q,
          H g g' * u g' * star (u g))
          = ∑ p : Configuration L q × Configuration L q,
              star (H p.1 p.2 * u p.2 * star (u p.1)) := by
        simp [Fintype.sum_prod_type', star_sum]
      have h2 : ∑ p : Configuration L q × Configuration L q,
              star (H p.1 p.2 * u p.2 * star (u p.1))
          = ∑ p : Configuration L q × Configuration L q,
              H p.1 p.2 * u p.2 * star (u p.1) := by
        refine Fintype.sum_equiv (Equiv.prodComm (Configuration L q) (Configuration L q))
          _ _ fun p => ?_
        rw [star_mul, star_mul, star_star, hstarH]
        ring
      have h3 : ∑ p : Configuration L q × Configuration L q,
              H p.1 p.2 * u p.2 * star (u p.1)
          = ∑ g : Configuration L q, ∑ g' : Configuration L q,
              H g g' * u g' * star (u g) := by
        simp [Fintype.sum_prod_type']
      rw [h1, h2, h3]
    have hcontra : (inner ℂ ψ (asMap H ψ) : ℂ).im = -((inner ℂ ψ (asMap H ψ) : ℂ).im) := by
      rw [← hz]
      simp [Complex.im_conj]
    linarith
  -- assemble
  have hexp : star x ⬝ᵥ ((H.submatrix ec ec - (E₀ : ℂ) • 1
        - (Δ : ℂ) • (1 - vecMulVec Ω' (star Ω'))) *ᵥ x)
      = (inner ℂ ψ (asMap H ψ) : ℂ) - (E₀ : ℂ) * ((‖ψ‖ ^ 2 : ℝ) : ℂ)
        - (Δ : ℂ) * (((‖ψ‖ ^ 2 : ℝ) : ℂ) - ((‖(inner ℂ Ω ψ : ℂ)‖ ^ 2 : ℝ) : ℂ)) := by
    have hv : (H.submatrix ec ec - (E₀ : ℂ) • 1
        - (Δ : ℂ) • (1 - vecMulVec Ω' (star Ω'))) *ᵥ x
        = (H.submatrix ec ec) *ᵥ x - (E₀ : ℂ) • x
          - (Δ : ℂ) • (x - vecMulVec Ω' (star Ω') *ᵥ x) := by
      rw [← sub_mulVec, ← sub_mulVec, Matrix.mulVec_smul, Matrix.mulVec_smul,
        Matrix.one_mulVec, ← sub_mulVec, Matrix.mulVec_one, ← Matrix.mulVec_smul,
        Matrix.mulVec_smul]
    rw [hv, dotProduct_sub, dotProduct_sub, dotProduct_smul, dotProduct_smul,
      dotProduct_sub, dotProduct_smul, hQ, hSx, hN]
    ring
  rw [hexp, RCLike.nonneg_iff]
  refine ⟨?_, ?_⟩
  · have h1 : ((E₀ : ℂ) * ((‖ψ‖ ^ 2 : ℝ) : ℂ)).re = E₀ * ‖ψ‖ ^ 2 := by
      rw [Complex.mul_re, Complex.ofReal_re, Complex.ofReal_re, Complex.ofReal_im]
      ring
    have h2 : ((Δ : ℂ) * (((‖ψ‖ ^ 2 : ℝ) : ℂ)
        - ((‖(inner ℂ Ω ψ : ℂ)‖ ^ 2 : ℝ) : ℂ))).re
        = Δ * (‖ψ‖ ^ 2 - ‖(inner ℂ Ω ψ : ℂ)‖ ^ 2) := by
      rw [Complex.mul_re, Complex.sub_re, Complex.sub_im, Complex.ofReal_re,
        Complex.ofReal_im, Complex.ofReal_im, Complex.ofReal_re]
      ring
    rw [Complex.sub_re, Complex.sub_re, h1, h2]
    have hG := hGap ψ
    linarith
  · have h1 : ((E₀ : ℂ) * ((‖ψ‖ ^ 2 : ℝ) : ℂ)).im = 0 := by
      rw [Complex.mul_im, Complex.ofReal_im, Complex.ofReal_im]; ring
    have h2 : ((Δ : ℂ) * (((‖ψ‖ ^ 2 : ℝ) : ℂ)
        - ((‖(inner ℂ Ω ψ : ℂ)‖ ^ 2 : ℝ) : ℂ))).im = 0 := by
      rw [Complex.mul_im, Complex.sub_im, Complex.ofReal_im, Complex.ofReal_im]; ring
    rw [Complex.sub_im, Complex.sub_im, h1, h2, hreal]; ring

/-! ## L3d — Hamiltonian transport (spec §5; injection-compression shape) -/

/-- The zero-extension of a partial lattice configuration to the full grid domain. -/
def padConfig {L q : ℕ} [NeZero q] (X : Finset (ℤ × ℤ)) (c : Reg (Qudits q) X) :
    Configuration L q :=
  fun g => if h : iotaL g ∈ X then c ⟨iotaL g, h⟩ else 0

theorem padConfig_of_mem {L q : ℕ} [NeZero q] {S : Finset (Vertex L)} (c : Reg (Qudits q) (iotaLimg S))
    (g : Vertex L) (hg : g ∈ S) :
    padConfig (iotaLimg S) c g = c ⟨iotaL g, iotaL_mem_image hg⟩ := by
  simp only [padConfig]
  rw [dif_pos (iotaL_mem_image hg)]

theorem padConfig_of_not_mem {L q : ℕ} [NeZero q] {S : Finset (Vertex L)} (c : Reg (Qudits q) (iotaLimg S))
    (g : Vertex L) (hg : g ∉ S) : padConfig (iotaLimg S) c g = 0 := by
  simp only [padConfig]
  rw [dif_neg (iotaL_not_mem_image hg)]

theorem padConfig_injective {L q : ℕ} [NeZero q] (S : Finset (Vertex L)) :
    Function.Injective (padConfig (L := L) (q := q) (iotaLimg S)) := by
  intro a b h
  funext i
  set g : Vertex L := gridVertex (L := L) ⟨(i : ℤ × ℤ), image_subset_gridDomain i.2⟩ with hgdef
  have hig : iotaL g = (i : ℤ × ℤ) := iotaL_gridVertex _
  have hmem : iotaL g ∈ iotaLimg S := by rw [hig]; exact i.2
  have hpt : (⟨iotaL g, hmem⟩ : {x : ℤ × ℤ // x ∈ iotaLimg S}) = i :=
    Subtype.ext hig.symm
  have hp : ∀ f : Reg (Qudits q) (iotaLimg S),
      padConfig (iotaLimg S) f g = f ⟨iotaL g, hmem⟩ := by
    intro f
    simp only [padConfig]
    rw [dif_pos hmem]
  rw [hpt, ← hp a, ← hp b]
  exact congrFun h g

/-- `padConfig` on an image region is the configEquiv-transport of the raw extension. -/
theorem padConfig_eq {L q : ℕ} [NeZero q] (S : Finset (Vertex L)) (c : Reg (Qudits q) (iotaLimg S)) :
    padConfig (iotaLimg S) c = configEquiv L q (fun w => if h : (w : ℤ × ℤ) ∈ iotaLimg S
      then c ⟨w, h⟩ else 0) := rfl

/-- The injection-indicator matrix: columns are standard basis vectors at the injected
points. `Eᴴ * E = 1` for an injective `ι`, and `Eᴴ * A * E = A.submatrix ι ι`. -/
def injMat {m n : Type*} [Fintype m] [DecidableEq m] [Fintype n] [DecidableEq n]
    (ι : m → n) : Matrix n m ℂ :=
  Matrix.of fun k j => if k = ι j then (1 : ℂ) else 0

theorem injMat_conjTranspose_mul_self {m n : Type*} [Fintype m] [DecidableEq m] [Fintype n]
    [DecidableEq n] (ι : m → n) (hι : Function.Injective ι) :
    (injMat ι)ᴴ * (injMat ι) = 1 := by
  ext j j'
  by_cases hj : j = j'
  · subst hj; simp [injMat]
  · simp [injMat, hι.eq_iff, hj]

theorem injMat_mul_eq_submatrix {m n : Type*} [Fintype m] [DecidableEq m] [Fintype n]
    [DecidableEq n] (A : Matrix n n ℂ) (ι : m → n) :
    (injMat ι)ᴴ * A * (injMat ι) = A.submatrix ι ι := by
  ext j j'
  simp only [Matrix.mul_apply, injMat, Matrix.conjTranspose_apply, Matrix.of_apply,
    Matrix.submatrix_apply]
  simp

/-- **Compression contractivity** (the L2 operator norm): a submatrix along an injection
is a corner `Eᴴ A E` of `A`, hence norm-decreasing. -/
theorem opNorm_submatrix_le {m n : Type*} [Fintype m] [DecidableEq m] [Fintype n]
    [DecidableEq n] {A : Matrix n n ℂ} {ι : m → n} (hι : Function.Injective ι) :
    ‖A.submatrix ι ι‖ ≤ ‖A‖ := by
  have hE1 : ‖injMat ι‖ = 1 := by
    have h2 := Matrix.l2_opNorm_conjTranspose_mul_self (injMat ι)
    rw [injMat_conjTranspose_mul_self ι hι, norm_one] at h2
    have hn : (0 : ℝ) ≤ ‖injMat ι‖ := norm_nonneg _
    nlinarith
  rw [← injMat_mul_eq_submatrix A ι]
  calc ‖(injMat ι)ᴴ * A * (injMat ι)‖ ≤ ‖(injMat ι)ᴴ‖ * ‖A * (injMat ι)‖ :=
      Matrix.l2_opNorm_mul _ _
    _ ≤ ‖(injMat ι)ᴴ‖ * (‖A‖ * ‖(injMat ι)‖) :=
      mul_le_mul_of_nonneg_left (Matrix.l2_opNorm_mul _ _) (norm_nonneg _)
    _ = ‖A‖ := by
        rw [Matrix.l2_opNorm_conjTranspose, hE1, one_mul, one_mul]

/-- Agreement off a lattice region ↔ agreement of the grid readings off the vertex set
(the site↔vertex dictionary for `extendId` vs `liftLocal` conditions). -/
theorem agreeSites_iff {L q : ℕ} [NeZero q] (S : Finset (Vertex L)) (x y : Reg (Qudits q) (gridDom L)) :
    (restr (Finset.sdiff_subset (S := gridDom L) (iotaLimg S)) x
        = restr (Finset.sdiff_subset (S := gridDom L) (iotaLimg S)) y)
    ↔ ∀ g : Vertex L, g ∉ S →
        configEquiv L q x g = configEquiv L q y g := by
  constructor
  · intro h g hg
    have := congrFun h ⟨iotaL g, Finset.mem_sdiff.2
      ⟨iotaL_mem_gridDom g, iotaL_not_mem_image hg⟩⟩
    simpa using this
  · intro h
    funext k
    have hk : (k : ℤ × ℤ) ∈ gridDom L \ iotaLimg S := k.2
    set g : Vertex L := gridVertex (L := L) ⟨(k : ℤ × ℤ), (Finset.mem_sdiff.1 hk).1⟩ with hgdef
    have hkg : iotaL g = (k : ℤ × ℤ) := iotaL_gridVertex _
    have hgS : g ∉ S := by
      intro hc
      exact (Finset.mem_sdiff.1 hk).2 (by rw [← hkg]; exact iotaL_mem_image hc)
    have hk' : k = ⟨iotaL g, Finset.mem_sdiff.2 ⟨iotaL_mem_gridDom g, iotaL_not_mem_image hgS⟩⟩ :=
      Subtype.ext hkg.symm
    rw [hk']
    have := h g hgS
    simpa using this

/-- **The per-term transport identity** (L3d's engine): extending the compression of a
local operator to the lattice domain is reindexing the local operator to the full grid. -/
theorem extendId_comp_eq {L q : ℕ} [NeZero q] (S : Finset (Vertex L))
    (a : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ) :
    extendId (image_subset_gridDom (L := L) (A := S))
        ((liftLocal S a).submatrix (padConfig (iotaLimg S)) (padConfig (iotaLimg S)))
      = (liftLocal S a).submatrix (configEquiv L q) (configEquiv L q) := by
  classical
  ext w w'
  by_cases hw : restr (Finset.sdiff_subset (S := gridDom L) (iotaLimg S)) w
      = restr (Finset.sdiff_subset (S := gridDom L) (iotaLimg S)) w'
  · simp only [extendId, Matrix.of_apply, if_pos hw, Matrix.submatrix_apply, liftLocal]
    have hLagree : ∀ g : Vertex L, g ∉ S →
        padConfig (iotaLimg S) (restr (image_subset_gridDom (L := L) (A := S)) w) g
          = padConfig (iotaLimg S) (restr (image_subset_gridDom (L := L) (A := S)) w') g := by
      intro g hg
      rw [padConfig_of_not_mem _ g hg, padConfig_of_not_mem _ g hg]
    have hRagree : ∀ g : Vertex L, g ∉ S →
        configEquiv L q w g = configEquiv L q w' g := (agreeSites_iff S w w').mp hw
    rw [if_pos hLagree, if_pos hRagree]
    have hfun1 : (fun v : {v : Vertex L // v ∈ S} =>
          padConfig (iotaLimg S) (restr (image_subset_gridDom (L := L) (A := S)) w) v.1)
        = fun v : {v : Vertex L // v ∈ S} => configEquiv L q w v.1 := by
      funext v
      rw [padConfig_of_mem _ v.1 v.2, configEquiv_apply]
      rfl
    have hfun2 : (fun v : {v : Vertex L // v ∈ S} =>
          padConfig (iotaLimg S) (restr (image_subset_gridDom (L := L) (A := S)) w') v.1)
        = fun v : {v : Vertex L // v ∈ S} => configEquiv L q w' v.1 := by
      funext v
      rw [padConfig_of_mem _ v.1 v.2, configEquiv_apply]
      rfl
    rw [hfun1, hfun2]
  · simp only [extendId, Matrix.of_apply, if_neg hw]
    rw [liftLocal, if_neg]
    intro hc
    exact hw ((agreeSites_iff S w w').mpr hc)

/-- The shape-matched producer interaction: singleton images get the compressed
Hermitian vertex term, edge images the compressed Hermitian edge term, everything else
vanishes. (Landed shape: injection-compression of the full symmetrized terms — see the
tranche header note 3.) -/
open Classical in
noncomputable def ΦL {L q : ℕ} [NeZero q] (hv : Vertex L → Operator L q) (he : Edge L → Operator L q) :
    (X : Finset (ℤ × ℤ)) → Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) ℂ := fun X =>
  if hV : ∃ v : Vertex L, X = iotaLimg ({v} : Finset (Vertex L)) then
    (hermPart (hv hV.choose)).submatrix (padConfig X) (padConfig X)
  else if hE : ∃ e : Edge L, X = iotaLimg (EdgeSites e) then
    (hermPart (he hE.choose)).submatrix (padConfig X) (padConfig X)
  else 0

theorem iotaLimg_singleton_injective {L : ℕ} :
    Function.Injective (fun (v : Vertex L) => iotaLimg ({v} : Finset (Vertex L))) := by
  intro v w h
  have hv : v ∈ iotaLimg ({v} : Finset (Vertex L)) := iotaL_mem_image (Finset.mem_singleton_self v)
  have hw := Finset.mem_image.1 (h ▸ hv)
  obtain ⟨w', _, heq⟩ := hw
  exact iotaL_injective heq

theorem iotaLimg_EdgeSites_injective {L : ℕ} :
    Function.Injective (fun (e : Edge L) => iotaLimg (EdgeSites e)) := by
  rintro ⟨⟨v, w⟩, hFA⟩ ⟨⟨v', w'⟩, hFA'⟩ h
  show Subtype.mk (v, w) hFA = Subtype.mk (v', w') hFA'
  have hv : v ∈ iotaLimg (EdgeSites ⟨(v, w), hFA⟩) :=
    iotaL_mem_image (Finset.mem_insert_self _ _)
  have hv' : v ∈ iotaLimg (EdgeSites ⟨(v', w'), hFA'⟩) := by rw [← h]; exact hv
  have hv1 : v = v' ∨ v = w' := by
    simpa [EdgeSites] using (v_mem_of_mem_image hv')
  have hw1 : w = v' ∨ w = w' := by
    have hw' : w ∈ iotaLimg (EdgeSites ⟨(v, w), hFA⟩) :=
      iotaL_mem_image (Finset.mem_insert_of_mem (Finset.mem_singleton_self _))
    have hw2 : w ∈ iotaLimg (EdgeSites ⟨(v', w'), hFA'⟩) := by rw [← h]; exact hw'
    simpa [EdgeSites] using (v_mem_of_mem_image hw2)
  rcases hv1 with hv1 | hv1
  · have hw2 : w = w' := by
      rcases hw1 with hw1 | hw1
      · exfalso
        have hself : ForwardAdjacent v v := by
          have : ForwardAdjacent v w := hFA
          rw [hw1, hv1] at this
          exact this
        rcases hself with ⟨h1, -⟩ | ⟨-, h1⟩ <;> omega
      · exact hw1
    exact congrArg Subtype.mk (Prod.ext hv1 hw2)
  · exfalso
    rcases hw1 with hw1 | hw1
    · have h2 : ForwardAdjacent w v := by
        have := hFA'
        rw [← hv1, ← hw1] at this
        exact this
      exact ForwardAdjacent.asymm hFA h2
    · have hself : ForwardAdjacent v v := by
        have : ForwardAdjacent v w := hFA
        rw [hw1, ← hv1] at this
        exact this
      rcases hself with ⟨h1, -⟩ | ⟨-, h1⟩ <;> omega

theorem card_iotaLimg_singleton {L : ℕ} (v : Vertex L) :
    (iotaLimg ({v} : Finset (Vertex L))).card = 1 := by
  rw [Finset.card_image_of_injOn (fun a _ b _ h => iotaL_injective h), Finset.card_singleton]

theorem ForwardAdjacent.ne {L : ℕ} {v w : Vertex L} (h : ForwardAdjacent v w) : v ≠ w := by
  intro he
  rw [he] at h
  rcases h with ⟨h1, -⟩ | ⟨-, h1⟩ <;> omega

theorem card_EdgeSites {L : ℕ} (e : Edge L) : (EdgeSites e).card = 2 := by
  rw [EdgeSites, Finset.card_insert_eq_card_add_one, Finset.card_singleton]
  simp [e.property.ne]

theorem card_iotaLimg_EdgeSites {L : ℕ} (e : Edge L) :
    (iotaLimg (EdgeSites e)).card = 2 := by
  rw [Finset.card_image_of_injOn (fun a _ b _ h => iotaL_injective h), card_EdgeSites]

theorem ΦL_vertex {L q : ℕ} [NeZero q] (hv : Vertex L → Operator L q) (he : Edge L → Operator L q)
    (v : Vertex L) :
    ΦL hv he (iotaLimg ({v} : Finset (Vertex L)))
      = (hermPart (hv v)).submatrix (padConfig (iotaLimg ({v} : Finset (Vertex L))))
          (padConfig (iotaLimg ({v} : Finset (Vertex L)))) := by
  have hEx : ∃ v' : Vertex L,
      (iotaLimg ({v} : Finset (Vertex L)) : Finset (ℤ × ℤ)) = iotaLimg ({v'} : Finset (Vertex L)) :=
    ⟨v, rfl⟩
  rw [ΦL, dif_pos hEx]
  have hvc : hEx.choose = v := iotaLimg_singleton_injective hEx.choose_spec
  rw [hvc]

theorem ΦL_edge {L q : ℕ} [NeZero q] (hv : Vertex L → Operator L q) (he : Edge L → Operator L q)
    (e : Edge L) :
    ΦL hv he (iotaLimg (EdgeSites e))
      = (hermPart (he e)).submatrix (padConfig (iotaLimg (EdgeSites e)))
          (padConfig (iotaLimg (EdgeSites e))) := by
  have hNoV : ¬ ∃ v : Vertex L,
      (iotaLimg (EdgeSites e) : Finset (ℤ × ℤ)) = iotaLimg ({v} : Finset (Vertex L)) := by
    rintro ⟨v, hv⟩
    have h1 := congrArg Finset.card hv
    rw [card_iotaLimg_EdgeSites e, card_iotaLimg_singleton v] at h1
    omega
  have hEx : ∃ e' : Edge L,
      (iotaLimg (EdgeSites e) : Finset (ℤ × ℤ)) = iotaLimg (EdgeSites e') := ⟨e, rfl⟩
  rw [ΦL, dif_neg hNoV, dif_pos hEx]
  have hec : hEx.choose = e := iotaLimg_EdgeSites_injective hEx.choose_spec
  rw [hec]

/-! ### Diameter bounds for the admissible shapes -/

theorem domEDist_self {L : ℕ} {x : ℤ × ℤ} (hx : x ∈ gridDom L) :
    domainEDist (gridDom L) x x = 0 := by
  simp only [domainEDist, hx, true_and]
  exact edist_self _

theorem domEDist_adj {L : ℕ} {x y : ℤ × ℤ} (hx : x ∈ gridDom L) (hy : y ∈ gridDom L)
    (hadj : (hasse ℤ □ hasse ℤ).Adj x y) :
    domainEDist (gridDom L) x y ≤ 1 := by
  simp only [domainEDist, hx, hy, true_and]
  have h1 : ((hasse ℤ □ hasse ℤ).induce ((gridDom L : Finset (ℤ × ℤ)) : Set (ℤ × ℤ))).edist
      (⟨x, hx⟩ : ((gridDom L : Finset (ℤ × ℤ)) : Set (ℤ × ℤ))) (⟨y, hy⟩ : _) = 1 :=
    SimpleGraph.edist_eq_one_iff_adj.mpr hadj
  exact h1.le

theorem domEDiam_le_of_le {L : ℕ} {X : Finset (ℤ × ℤ)}
    (h : ∀ x ∈ X, ∀ y ∈ X, domainEDist (gridDom L) x y ≤ 1) :
    domainEDiam (gridDom L) X ≤ 1 := by
  unfold domainEDiam
  exact iSup₂_le fun x hx => iSup₂_le fun y hy => h x hx y hy

theorem iotaLimg_singleton_mem_supports {L : ℕ} (v : Vertex L) :
    iotaLimg ({v} : Finset (Vertex L)) ∈ supports (gridDom L) 1 := by
  refine Finset.mem_filter.2 ⟨Finset.mem_powerset.2 image_subset_gridDom, ?_, ?_⟩
  · exact ⟨iotaL v, iotaL_mem_image (Finset.mem_singleton_self v)⟩
  · refine domEDiam_le_of_le fun x hx y hy => ?_
    simp only [iotaLimg, Finset.mem_image] at hx hy
    obtain ⟨v1, hv1, hx1⟩ := hx
    obtain ⟨v2, hv2, hx2⟩ := hy
    rw [Finset.mem_singleton] at hv1 hv2
    rw [← hx1, ← hx2, hv1, hv2]
    exact (domEDist_self (iotaL_mem_gridDom _)).le.trans zero_le

theorem iotaLimg_EdgeSites_mem_supports {L : ℕ} (e : Edge L) :
    iotaLimg (EdgeSites e) ∈ supports (gridDom L) 1 := by
  refine Finset.mem_filter.2 ⟨Finset.mem_powerset.2 image_subset_gridDom, ?_, ?_⟩
  · exact ⟨iotaL e.val.1, iotaL_mem_image (Finset.mem_insert_self _ _)⟩
  · refine domEDiam_le_of_le fun x hx y hy => ?_
    simp only [iotaLimg, Finset.mem_image] at hx hy
    obtain ⟨v1, hv1, hx1⟩ := hx
    obtain ⟨v2, hv2, hx2⟩ := hy
    rw [← hx1, ← hx2]
    rw [EdgeSites, Finset.mem_insert, Finset.mem_singleton] at hv1 hv2
    rcases hv1 with hv1 | hv1 <;> rcases hv2 with hv2 | hv2
    · rw [hv1, hv2]; exact (domEDist_self (iotaL_mem_gridDom _)).le.trans zero_le
    · rw [hv1, hv2]
      exact domEDist_adj (iotaL_mem_gridDom _) (iotaL_mem_gridDom _)
        (adj_of_forwardAdjacent e.property)
    · rw [hv1, hv2]
      exact domEDist_adj (iotaL_mem_gridDom _) (iotaL_mem_gridDom _)
        (adj_of_forwardAdjacent e.property).symm
    · rw [hv1, hv2]; exact (domEDist_self (iotaL_mem_gridDom _)).le.trans zero_le

/-! ### Admissibility -/

theorem isAdmissible_ΦL {L q : ℕ} [NeZero q] {J : ℝ} (hJ : (0 : ℝ) ≤ J)
    (hv : Vertex L → Operator L q) (he : Edge L → Operator L q)
    (hGrid : IsGridHamiltonian J hv he) :
    IsAdmissible (gridDom L) 1 J (ΦL hv he) := by
  classical
  intro X _
  by_cases hV : ∃ v : Vertex L, X = iotaLimg ({v} : Finset (Vertex L))
  · obtain ⟨v, rfl⟩ := hV
    rw [ΦL_vertex]
    refine ⟨?_, ?_, ?_⟩
    · show ((hermPart (hv v)).submatrix (padConfig _) (padConfig _))ᴴ = _
      rw [Matrix.conjTranspose_submatrix, hermPart_isHermitian]
    · calc ‖(hermPart (hv v)).submatrix (padConfig _) (padConfig _)‖
          ≤ ‖hermPart (hv v)‖ := opNorm_submatrix_le (padConfig_injective _)
      _ = opNorm (hermPart (hv v)) := rfl
      _ ≤ opNorm (hv v) := opNorm_hermPart_le _
      _ ≤ J := (hGrid.1 v).2
    · intro hSup
      exact absurd (iotaLimg_singleton_mem_supports v) hSup
  · by_cases hE : ∃ e : Edge L, X = iotaLimg (EdgeSites e)
    · obtain ⟨e, rfl⟩ := hE
      rw [ΦL_edge]
      refine ⟨?_, ?_, ?_⟩
      · show ((hermPart (he e)).submatrix (padConfig _) (padConfig _))ᴴ = _
        rw [Matrix.conjTranspose_submatrix, hermPart_isHermitian]
      · calc ‖(hermPart (he e)).submatrix (padConfig _) (padConfig _)‖
            ≤ ‖hermPart (he e)‖ := opNorm_submatrix_le (padConfig_injective _)
        _ = opNorm (hermPart (he e)) := rfl
        _ ≤ opNorm (he e) := opNorm_hermPart_le _
        _ ≤ J := (hGrid.2.1 e).2
      · intro hSup
        exact absurd (iotaLimg_EdgeSites_mem_supports e) hSup
    · rw [ΦL, dif_neg hV, dif_neg hE]
      refine ⟨Matrix.isHermitian_zero, ?_, fun _ => rfl⟩
      calc ‖(0 : Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) ℂ)‖ = 0 := norm_zero
        _ ≤ J := hJ

/-! ### The transport identity (L3d main) -/

theorem sum_submatrix {ι m n : Type*} [Fintype ι] [DecidableEq m] (s : Finset ι)
    (A : ι → Matrix n n ℂ) (r c : m → n) :
    (∑ i ∈ s, (A i).submatrix r c) = (∑ i ∈ s, A i).submatrix r c := by
  ext a b
  simp [Matrix.sum_apply]

theorem extendId_zero {L q : ℕ} {X : Finset (ℤ × ℤ)} (h : X ⊆ gridDom L) :
    extendId h (0 : Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) ℂ) = 0 := by
  ext w w'
  simp [extendId]

/-- **L3d main theorem (the Hamiltonian transport).** The producer's powerset Hamiltonian
of the manufactured interaction is exactly the grid Hamiltonian, symmetrized per L3a and
reindexed to the lattice domain. (Statement-shape notes: the per-term locality enters as
`SupportedOn`-style witness binders `hV`/`hE` — supplied by `supportedOn_hermPart` from
`IsGridHamiltonian` in the interface.) -/
theorem hamiltonian_gridDom_eq {L q : ℕ} [NeZero q] (hv : Vertex L → Operator L q)
    (he : Edge L → Operator L q)
    (hV : ∀ v : Vertex L, ∃ a : Matrix (RegionConfiguration q ({v} : Finset (Vertex L)))
        (RegionConfiguration q ({v} : Finset (Vertex L))) ℂ,
      hermPart (hv v) = liftLocal {v} a)
    (hE : ∀ e : Edge L, ∃ a : Matrix (RegionConfiguration q (EdgeSites e))
        (RegionConfiguration q (EdgeSites e)) ℂ,
      hermPart (he e) = liftLocal (EdgeSites e) a) :
    OpenAI.hamiltonian (gridDom L) (ΦL hv he)
      = (Hamiltonian (fun v => hermPart (hv v)) (fun e => hermPart (he e))).submatrix
          (configEquiv L q) (configEquiv L q) := by
  classical
  set ps : Finset (Finset (ℤ × ℤ)) := (gridDom L).powerset with hps
  set Vimg : Finset (Finset (ℤ × ℤ)) :=
    Finset.univ.image (fun v : Vertex L => iotaLimg ({v} : Finset (Vertex L))) with hVimg
  set Eimg : Finset (Finset (ℤ × ℤ)) :=
    Finset.univ.image (fun e : Edge L => iotaLimg (EdgeSites e)) with hEimg
  set U : Finset {X : Finset (ℤ × ℤ) // X ∈ ps} := Finset.univ with hU
  set F : {X : Finset (ℤ × ℤ) // X ∈ ps} →
      Matrix (Reg (Qudits q) (gridDom L)) (Reg (Qudits q) (gridDom L)) ℂ :=
    fun X => extendId (Finset.mem_powerset.1 X.2) (ΦL hv he X) with hF
  -- per-element classification
  have hPV : ∀ X ∈ U, ((X : Finset (ℤ × ℤ)) ∈ Vimg →
      ∃ v : Vertex L, (X : Finset (ℤ × ℤ)) = iotaLimg ({v} : Finset (Vertex L))) := by
    intro X _ hX
    obtain ⟨v, -, hv⟩ := Finset.mem_image.1 hX
    exact ⟨v, hv.symm⟩
  have hPE : ∀ X ∈ U, ((X : Finset (ℤ × ℤ)) ∈ Eimg →
      ∃ e : Edge L, (X : Finset (ℤ × ℤ)) = iotaLimg (EdgeSites e)) := by
    intro X _ hX
    obtain ⟨e, -, heq⟩ := Finset.mem_image.1 hX
    exact ⟨e, heq.symm⟩
  have hF0 : ∀ X ∈ U, (X : Finset (ℤ × ℤ)) ∉ Vimg → (X : Finset (ℤ × ℤ)) ∉ Eimg → F X = 0 := by
    intro X _ h1 h2
    have hNV : ¬ ∃ v : Vertex L, (X : Finset (ℤ × ℤ)) = iotaLimg ({v} : Finset (Vertex L)) := by
      rintro ⟨v, hv⟩
      exact h1 (Finset.mem_image.2 ⟨v, Finset.mem_univ _, hv.symm⟩)
    have hNE : ¬ ∃ e : Edge L, (X : Finset (ℤ × ℤ)) = iotaLimg (EdgeSites e) := by
      rintro ⟨e, heq⟩
      exact h2 (Finset.mem_image.2 ⟨e, Finset.mem_univ _, heq.symm⟩)
    show extendId (Finset.mem_powerset.1 X.2) (ΦL hv he X) = 0
    rw [ΦL, dif_neg hNV, dif_neg hNE, extendId_zero]
  -- F at the shapes
  have hFv : ∀ v : Vertex L, F ⟨iotaLimg ({v} : Finset (Vertex L)),
      Finset.mem_powerset.2 image_subset_gridDom⟩
      = (hermPart (hv v)).submatrix (configEquiv L q) (configEquiv L q) := by
    intro v
    obtain ⟨a, ha⟩ := hV v
    have e1 : (Finset.mem_powerset.1 (Finset.mem_powerset.2 image_subset_gridDom :
        iotaLimg ({v} : Finset (Vertex L)) ∈ ps))
        = image_subset_gridDom (L := L) (A := ({v} : Finset (Vertex L))) :=
      proof_irrel _ _
    show extendId (Finset.mem_powerset.1 _) (ΦL hv he _) = _
    rw [e1, ΦL_vertex, ← ha, extendId_comp_eq]
  have hFe : ∀ e : Edge L, F ⟨iotaLimg (EdgeSites e),
      Finset.mem_powerset.2 image_subset_gridDom⟩
      = (hermPart (he e)).submatrix (configEquiv L q) (configEquiv L q) := by
    intro e
    obtain ⟨a, ha⟩ := hE e
    have e1 : (Finset.mem_powerset.1 (Finset.mem_powerset.2 image_subset_gridDom :
        iotaLimg (EdgeSites e) ∈ ps))
        = image_subset_gridDom (L := L) (A := EdgeSites e) :=
      proof_irrel _ _
    show extendId (Finset.mem_powerset.1 _) (ΦL hv he _) = _
    rw [e1, ΦL_edge, ← ha, extendId_comp_eq]
  -- disjointness of the two image families
  have hdisj : ∀ X : {X : Finset (ℤ × ℤ) // X ∈ ps}, (X : Finset (ℤ × ℤ)) ∈ Vimg →
      (X : Finset (ℤ × ℤ)) ∈ Eimg → False := by
    intro X h1 h2
    obtain ⟨v, -, hv⟩ := Finset.mem_image.1 h1
    obtain ⟨e, -, heq⟩ := Finset.mem_image.1 h2
    have hc : (iotaLimg ({v} : Finset (Vertex L)) : Finset (ℤ × ℤ)).card
        = (iotaLimg (EdgeSites e) : Finset (ℤ × ℤ)).card := by
      rw [hv, heq]
    rw [card_iotaLimg_singleton v, card_iotaLimg_EdgeSites e] at hc
    omega
  -- the three-way split
  have key : ∑ X ∈ U, F X
      = (∑ v : Vertex L, (hermPart (hv v)).submatrix (configEquiv L q) (configEquiv L q))
      + ∑ e : Edge L, (hermPart (he e)).submatrix (configEquiv L q) (configEquiv L q) := by
    classical
    rw [← Finset.sum_filter_add_sum_filter_not U (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} =>
      (X : Finset (ℤ × ℤ)) ∈ Vimg)]
    · -- second split: inside the ¬V-part
      have h2split := Finset.sum_filter_add_sum_filter_not
        (U.filter (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} => (X : Finset (ℤ × ℤ)) ∉ Vimg))
        (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} => (X : Finset (ℤ × ℤ)) ∈ Eimg)
      rw [← h2split]
      have hD : ∑ X ∈ (U.filter (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} =>
          (X : Finset (ℤ × ℤ)) ∉ Vimg)).filter
          (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} => (X : Finset (ℤ × ℤ)) ∉ Eimg), F X = 0 := by
        refine Finset.sum_eq_zero fun X hX => ?_
        have h1 : (X : Finset (ℤ × ℤ)) ∉ Vimg := (Finset.mem_filter.1 hX).1
        have h2 : (X : Finset (ℤ × ℤ)) ∉ Eimg := (Finset.mem_filter.1 hX).2
        exact hF0 X (Finset.mem_of_mem_filter (Finset.mem_of_mem_filter hX)) h1 h2
      rw [hD, add_zero]
      -- the V-image piece:
      have hVset : U.filter (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} =>
          (X : Finset (ℤ × ℤ)) ∈ Vimg)
          = Finset.univ.image (fun v : Vertex L =>
              (⟨iotaLimg ({v} : Finset (Vertex L)),
                Finset.mem_powerset.2 image_subset_gridDom⟩ :
                {X : Finset (ℤ × ℤ) // X ∈ ps})) := by
        ext X
        simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_image]
        constructor
        · intro h
          obtain ⟨v, hv⟩ := hPV X (Finset.mem_univ _) h
          exact ⟨v, Finset.mem_univ _, Subtype.ext hv.symm⟩
        · rintro ⟨v, -, rfl⟩
          exact Finset.mem_image.2 ⟨v, Finset.mem_univ _, rfl⟩
      -- the E-image piece:
      have hEset : (U.filter (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} =>
          (X : Finset (ℤ × ℤ)) ∉ Vimg)).filter
          (fun X : {X : Finset (ℤ × ℤ) // X ∈ ps} => (X : Finset (ℤ × ℤ)) ∈ Eimg)
          = Finset.univ.image (fun e : Edge L =>
              (⟨iotaLimg (EdgeSites e),
                Finset.mem_powerset.2 image_subset_gridDom⟩ :
                {X : Finset (ℤ × ℤ) // X ∈ ps})) := by
        ext X
        simp only [Finset.mem_filter, Finset.mem_image]
        constructor
        · rintro ⟨h1, h2⟩
          obtain ⟨e, heq⟩ := hPE X (by simp) h2
          exact ⟨e, Finset.mem_univ _, Subtype.ext heq.symm⟩
        · rintro ⟨e, -, rfl⟩
          refine ⟨?_, Finset.mem_image.2 ⟨e, Finset.mem_univ _, rfl⟩⟩
          intro hcontra
          exact hdisj X hcontra (Finset.mem_image.2 ⟨e, Finset.mem_univ _, rfl⟩)
      rw [hVset, hEset,
        Finset.sum_image (fun a _ b _ hab => iotaLimg_singleton_injective
          (congrArg (fun Z : {X : Finset (ℤ × ℤ) // X ∈ ps} => (Z : Finset (ℤ × ℤ))) hab)),
        Finset.sum_image (fun a _ b _ hab => iotaLimg_EdgeSites_injective
          (congrArg (fun Z : {X : Finset (ℤ × ℤ) // X ∈ ps} => (Z : Finset (ℤ × ℤ))) hab))]
      rw [Finset.sum_congr rfl fun v _ => hFv v,
        Finset.sum_congr rfl fun e _ => hFe e]
  calc OpenAI.hamiltonian (gridDom L) (ΦL hv he)
      = ∑ X ∈ U, F X := by rw [OpenAI.hamiltonian, Finset.sum_attach]
    _ = (∑ v : Vertex L, (hermPart (hv v)).submatrix (configEquiv L q) (configEquiv L q))
        + ∑ e : Edge L, (hermPart (he e)).submatrix (configEquiv L q) (configEquiv L q) :=
        key
    _ = ((∑ v : Vertex L, hermPart (hv v)) + ∑ e : Edge L, hermPart (he e)).submatrix
          (configEquiv L q) (configEquiv L q) := by
        have e1 := sum_submatrix (m := Reg (Qudits q) (gridDom L)) Finset.univ
          (fun v => hermPart (hv v)) (configEquiv L q) (configEquiv L q)
        have e2 := sum_submatrix (m := Reg (Qudits q) (gridDom L)) Finset.univ
          (fun e => hermPart (he e)) (configEquiv L q) (configEquiv L q)
        rw [e1, e2, Matrix.submatrix_add]
    _ = (Hamiltonian (fun v => hermPart (hv v)) (fun e => hermPart (he e))).submatrix
          (configEquiv L q) (configEquiv L q) := rfl

/-! ### The eig-equation transfer -/

theorem submatrix_mulVec_ec {L q : ℕ} (M : Operator L q) (x : Reg (Qudits q) (gridDom L) → ℂ)
    (c : Reg (Qudits q) (gridDom L)) :
    (M.submatrix (configEquiv L q) (configEquiv L q) *ᵥ x) c
      = ∑ g : Configuration L q, M (configEquiv L q c) g * x ((configEquiv L q).symm g) := by
  simp only [Matrix.mulVec, dotProduct, Matrix.submatrix_apply]
  exact Fintype.sum_equiv (configEquiv L q) _ _ fun d => by
    rw [Equiv.symm_apply_apply]

theorem eig_toGrid {L q : ℕ} (M : Operator L q) (Ω : State L q) (E₀ : ℝ)
    (hE : asMap M Ω = (E₀ : ℂ) • Ω) (c : Reg (Qudits q) (gridDom L)) :
    (M.submatrix (configEquiv L q) (configEquiv L q) *ᵥ toGrid L q Ω) c
      = E₀ * toGrid L q Ω c := by
  rw [submatrix_mulVec_ec]
  have h2 : M *ᵥ WithLp.ofLp Ω = WithLp.ofLp ((E₀ : ℂ) • Ω) := by
    rw [← ofLp_toEuclideanCLM]
    exact congrArg WithLp.ofLp hE
  have h3 : ∑ g : Configuration L q, M (configEquiv L q c) g * WithLp.ofLp Ω g
      = E₀ * WithLp.ofLp Ω (configEquiv L q c) := by
    have h4 := congrFun h2 (configEquiv L q c)
    simpa [Matrix.mulVec, dotProduct, WithLp.ofLp_smul, PiLp.smul_apply] using h4
  have h5 : ∀ g : Configuration L q,
      toGrid L q Ω ((configEquiv L q).symm g) = WithLp.ofLp Ω g := fun g => by
    rw [toGrid_eq_ofLp, Equiv.apply_symm_apply]
  calc ∑ g : Configuration L q, M (configEquiv L q c) g * toGrid L q Ω
          ((configEquiv L q).symm g)
      = ∑ g : Configuration L q, M (configEquiv L q c) g * WithLp.ofLp Ω g :=
        Finset.sum_congr rfl fun g _ => by rw [h5]
    _ = E₀ * WithLp.ofLp Ω (configEquiv L q c) := h3
    _ = E₀ * toGrid L q Ω c := by rw [← toGrid_eq_ofLp]

/-! ## The interface theorem (spec §6; acceptance target, Tier C) -/

/-- **The interface theorem.** The producer's area-law hypothesis (at range 1, over the
transcribed `OpenAI.AreaLaw` statement) implies the consumer's `UniformAreaLaw` for the
grid Hamiltonians. Statement-exactness anchor: the conclusion is the vendored
`UniformAreaLaw` verbatim (T1 `#check`, run output). -/
theorem interface_areaLaw_uniformAreaLaw
    (hAreaLaw : ∀ (q : ℕ) (J Δ : ℝ), 1 ≤ q → 0 < J → 0 < Δ → OpenAI.AreaLaw ℂ q 1 J Δ) :
    PolynomialPEPS.PinnedEntropy.UniformAreaLaw := by
  intro q hq J Δ hJ hΔ
  haveI : NeZero q := ⟨by omega⟩
  obtain ⟨C, hC⟩ := hAreaLaw q J Δ (by omega) hJ hΔ
  refine ⟨max C 1, lt_of_lt_of_le zero_lt_one (le_max_right C 1), ?_⟩
  intro L hL hv he Ω E₀ hGrid hUG hGap A
  classical
  -- the symmetrized family and its grid properties
  have hV : ∀ v : Vertex L, ∃ a : Matrix (RegionConfiguration q ({v} : Finset (Vertex L)))
      (RegionConfiguration q ({v} : Finset (Vertex L))) ℂ,
    hermPart (hv v) = liftLocal {v} a :=
    fun v => supportedOn_hermPart (hGrid.1 v).1
  have hE : ∀ e : Edge L, ∃ a : Matrix (RegionConfiguration q (EdgeSites e))
      (RegionConfiguration q (EdgeSites e)) ℂ,
    hermPart (he e) = liftLocal (EdgeSites e) a :=
    fun e => supportedOn_hermPart (hGrid.2.1 e).1
  have hHamEq : Hamiltonian (fun v => hermPart (hv v)) (fun e => hermPart (he e))
      = Hamiltonian hv he := hamiltonian_hermPart hv he hGrid.2.2
  have hUG' : UniqueGround (Hamiltonian (fun v => hermPart (hv v))
      (fun e => hermPart (he e))) Ω E₀ := by rw [hHamEq]; exact hUG
  have hGap' : FullSystemGap (Hamiltonian (fun v => hermPart (hv v))
      (fun e => hermPart (he e))) Ω E₀ Δ := by rw [hHamEq]; exact hGap
  -- the three producer-side inputs
  have hAdm : IsAdmissible (gridDom L) 1 J (ΦL hv he) :=
    isAdmissible_ΦL (le_of_lt hJ) hv he hGrid
  have hIdent := hamiltonian_gridDom_eq hv he hV hE
  have hΩ' := toGrid_star_dotProduct_self Ω hUG.1
  have hEig : OpenAI.hamiltonian (gridDom L) (ΦL hv he) *ᵥ toGrid L q Ω
      = (E₀ : ℂ) • toGrid L q Ω := by
    funext c
    rw [hIdent, eig_toGrid _ _ _ hUG'.2.1 c]
    simp
  have hGapL : HasGlobalGap (OpenAI.hamiltonian (gridDom L) (ΦL hv he)) (toGrid L q Ω)
      E₀ Δ := by
    rw [hIdent]
    exact hasGlobalGap_of_fullSystemGap _ Ω E₀ Δ (by
      show (Hamiltonian (fun v => hermPart (hv v)) (fun e => hermPart (he e)))ᴴ = _
      rw [hHamEq]; exact hGrid.2.2) hUG.1 hGap'
  -- apply the producer
  have hBound := hC (gridDom L) (ΦL hv he) hAdm (toGrid L q Ω) hΩ' E₀ hEig hGapL
    (iotaLimg A) (image_subset_gridDom (L := L) (A := A))
  rw [regionEntropy_eq_vonNeumannEntropy Ω hΩ' A] at hBound
  -- the boundary chain
  have hEB : ((edgeBoundary (gridDom L) (iotaLimg A)).card : ℝ)
      ≤ ((boundaryCard A : ℕ) : ℝ) := by exact_mod_cast edgeBoundary_le_boundaryCard A
  calc vonNeumannEntropy Ω A ≤ C * ((edgeBoundary (gridDom L) (iotaLimg A)).card : ℝ) :=
        hBound
    _ ≤ max C 1 * ((edgeBoundary (gridDom L) (iotaLimg A)).card : ℝ) :=
        mul_le_mul_of_nonneg_right (le_max_left C 1) (Nat.cast_nonneg _)
    _ ≤ max C 1 * ((boundaryCard A : ℕ) : ℝ) :=
        mul_le_mul_of_nonneg_left hEB (by linarith [le_max_right C 1])

#print axioms toGrid_star_dotProduct_self
#print axioms edgeBoundary_le_boundaryCard
#print axioms hasGlobalGap_of_fullSystemGap
#print axioms isAdmissible_ΦL
#print axioms hamiltonian_gridDom_eq
#print axioms eig_toGrid
#print axioms interface_areaLaw_uniformAreaLaw

end CrossMath.Pilot72.M1
