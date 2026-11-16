/-
  Pilot 72-M1, tranche T3 (iteration 4) — L3a: per-term Hermiticity by symmetrization.

  Spec: `pilots/72-M1/L3-spec.md` §2 (L3a), elaborating the continuation note in
  `logs/m1-run8-GREEN.log`'s header; companion `72-prework.md` §2.2–2.3. This tranche
  lands the four L3a declarations only (L3b–L3d and the interface theorem stay in
  later tranches per the spec's ordering; guards: ≤ 8 runs for L3 total; L3a ran
  3 FAIL iterations before this form — descent logged in `logs/l3a-run{1..3}*.log`).

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
open Matrix
open scoped ComplexOrder Matrix.Norms.L2Operator

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

#print axioms hermPart_isHermitian
#print axioms opNorm_hermPart_le
#print axioms supportedOn_hermPart
#print axioms hamiltonian_hermPart

end CrossMath.Pilot72.M1
