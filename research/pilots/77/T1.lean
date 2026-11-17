import Mathlib
import TauCeti.Algebra.Lie.GeneralLinear.TraceForm
import TauCeti.Algebra.Lie.GeneralLinear.CAR.Occupation

/-!
# Pilot 77, T1 — the CAR occupation ↔ Laughlin/Fock substrate-bridge dictionary

**Charter** (orchestrator ruling, 2026-11-17, on `research/candidates/
77-car-occupation-dictionary-laughlin.md` §"Battery (2026-11-17)"): FB-5 T1 is GO,
executed by lane A7. **Billing: C+ substrate-bridge class — never a discovery
headline.** PROOF artifact: zero `sorry`, kernel-verified. Binder inventory: NONE.

**Corrections to the dossier's T1 as drafted** (forced by the battery's census; also
recorded in T1-record.md):
1. *No algebra hom `CliffordAlgebra (TauCeti.traceQuadraticForm ℂ N) →ₐ FockMatrix Q`*
   exists at general `N`: the trace form is nondegenerate
   (`TauCeti.traceQuadraticForm_nondegenerate`), so over ℂ the Clifford algebra of
   `gl_N` is a simple algebra of dimension `2 ^ (N * N)`, and a unital hom into a
   `2 ^ (Q+1)`-square matrix algebra is dimensionally impossible once
   `N * N > 2 * (Q + 1)`. The drafted T1(ii) (injectivity of Φ on the even
   subalgebra, via a dimension count) is unsound for `Q ≥ 2` and is DROPPED. The
   dictionary below lives on a hyperbolic submodel `V` of rank `2 * (Q + 1)`, where
   the dimension count does go through.
2. *The drafted T1(i) intertwining is algebraically ill-typed*: tauceti's
   `carOccupationElement i j` are idempotent (off-diagonal) and mutually commuting
   (`CAR/Occupation.lean:121/:138`), while the drafted images
   `annihilator† * annihilator` are neither. The corrected dictionary intertwines
   the hyperbolic occupation elements with the **number operators**
   `creator * annihilator`, which do carry the idempotent/commuting algebra.

**What this file proves.** On the hyperbolic model `V := (Orbital Q → ℂ) × (Orbital Q
→ ℂ)` with `qV (c, d) := ∑ i, c i * d i` (the restriction shape of tauceti's trace
form along the isotropic-pair embedding `isoV`, `traceQuadraticForm_isoV`):
- `toFock_mul_self` — the Clifford condition for `toFock v * toFock v = qV v • 1`;
  the four ported CAR theorems of the OAI LaughlinFock donor
  (`FermionOperators.lean`, verified pins :94/:102/:156/:190) are exactly its
  basis-pair instances.
- `fockDictionary` — `Φ := CliffordAlgebra.lift ⟨toFock, …⟩` with
  `Φ (ι (hypE i)) = annihilator Q i`, `Φ (ι (hypE' i)) = creator Q i`.
- `occupationElem_mul_self`, `commute_occupationElem` — the abstract occupation
  elements `o i := ι (hypE' i) * ι (hypE i)` carry the tauceti-shaped algebra
  (idempotent, pairwise commuting), from `CliffordAlgebra.ι_mul_ι_add_swap` alone
  (the `CAR/Occupation.lean:121/:138` proof shapes).
- `dictionary_numberOp` / `dictionary_idempotent` / `dictionary_commute` — the
  transports through Φ: `Φ (o i) = creator Q i * annihilator Q i` (the diagonal
  number operator of `creator_mul_annihilator`), idempotent and commuting through
  the hom.
- `map_iso_occupationElem` — `CliffordAlgebra.map isoQ (o i) = TauCeti.
  carOccupationElement ℂ (.inl i) (.inr i)`: the element-level dictionary to
  tauceti's own declaration at the hyperbolic matrix-unit pairs. (Theorem-level
  transport of tauceti's :121/:138 along `map` would need injectivity of
  `CliffordAlgebra.map` on the generated subalgebra — absent from mathlib; recorded
  as the T1-extension condition, not claimed here.)

**Fences** (battery conditions (i)–(iv)): no Casimir content (the layer is private
in tauceti, `CAR/Casimir.lean:63` et seq. — dead-as-import); no injectivity claim;
physlib clock start-tick `pushed_at = 2026-11-17T09:42:38Z`, unchanged since the
battery's CAR-relations re-grep (no physlib CAR anywhere); billing C+. OAI
LaughlinFock content is statement-level ported from the v4.34.1 donor (read-only,
no OAI build): `Model.lean:14–33` defs, `FermionOperators.lean` CAR block. tauceti
imports: the public census layer (`TraceForm.lean:177`, `CAR/Occupation.lean:70/
:121/:138`) at tauceti's own pin d92acc5c (mathlib 1b1ccf4b, toolchain
v4.36.0-rc2) — the zeta23E own-lineage pattern.
-/

namespace CrossMath.Pilot77

noncomputable section

open scoped BigOperators Matrix
open CliffordAlgebra

/-! ## §1 The Fock side (OAI LaughlinFock, statement-level port) -/

abbrev Orbital (Q : ℕ) := Fin (Q + 1)

abbrev Occupation (Q : ℕ) := Finset (Orbital Q)

abbrev FockMatrix (Q : ℕ) := Matrix (Occupation Q) (Occupation Q) ℂ

def fermionSign {Q : ℕ} (j : Orbital Q) (B : Occupation Q) : ℂ :=
  (-1 : ℂ) ^ (B.filter (fun i => i < j)).card

/-- OAI `LaughlinFock.annihilator` (`Model.lean:28`), verbatim. -/
def annihilator (Q : ℕ) (j : Orbital Q) : FockMatrix Q := fun A B =>
  if j ∈ B ∧ A = B.erase j then fermionSign j B else 0

/-- OAI `LaughlinFock.creator` (`FermionOperators.lean:54`), verbatim. -/
def creator (Q : ℕ) (j : Orbital Q) : FockMatrix Q := fun A B =>
  if j ∉ B ∧ A = insert j B then fermionSign j B else 0

private theorem annihilator_apply {Q : ℕ} (j : Orbital Q) (A B : Occupation Q) :
    annihilator Q j A B =
      if j ∈ B ∧ A = B.erase j then fermionSign j B else 0 := rfl

@[simp]
private theorem fermionSign_star {Q : ℕ} (j : Orbital Q) (B : Occupation Q) :
    star (fermionSign j B) = fermionSign j B := by simp [fermionSign]

@[simp]
private theorem fermionSign_mul_self {Q : ℕ} (j : Orbital Q) (B : Occupation Q) :
    fermionSign j B * fermionSign j B = 1 := by
  unfold fermionSign
  rw [← mul_pow]
  simp

private theorem sign_insert_lt {Q : ℕ} (i j : Orbital Q) (B : Occupation Q)
    (hi : i ∉ B) (hij : i < j) :
    fermionSign j (insert i B) = -fermionSign j B := by
  simp [fermionSign, Finset.filter_insert, hi, hij, pow_succ]

private theorem sign_insert_not_lt {Q : ℕ} (i j : Orbital Q) (B : Occupation Q)
    (hij : ¬ i < j) : fermionSign j (insert i B) = fermionSign j B := by
  simp [fermionSign, Finset.filter_insert, hij]

private theorem sign_erase_lt {Q : ℕ} (i j : Orbital Q) (B : Occupation Q)
    (hi : i ∈ B) (hij : i < j) :
    fermionSign j (B.erase i) = -fermionSign j B := by
  have h := sign_insert_lt i j (B.erase i) (Finset.notMem_erase i B) hij
  rw [Finset.insert_erase hi] at h
  rw [h]
  simp

private theorem sign_erase_not_lt {Q : ℕ} (i j : Orbital Q) (B : Occupation Q)
    (hij : ¬ i < j) : fermionSign j (B.erase i) = fermionSign j B := by
  by_cases hi : i ∈ B
  · have h := sign_insert_not_lt i j (B.erase i) hij
    rw [Finset.insert_erase hi] at h
    exact h.symm
  · rw [Finset.erase_eq_of_notMem hi]

private theorem mul_annihilator_apply {Q : ℕ} (M : FockMatrix Q) (j : Orbital Q)
    (A B : Occupation Q) :
    (M * annihilator Q j) A B =
      if j ∈ B then M A (B.erase j) * fermionSign j B else 0 := by
  classical
  rw [Matrix.mul_apply]
  by_cases hj : j ∈ B
  · simp [annihilator, hj, mul_ite, fermionSign]
  · simp [annihilator, hj]

private theorem mul_creator_apply {Q : ℕ} (M : FockMatrix Q) (j : Orbital Q)
    (A B : Occupation Q) :
    (M * creator Q j) A B =
      if j ∉ B then M A (insert j B) * fermionSign j B else 0 := by
  classical
  rw [Matrix.mul_apply]
  by_cases hj : j ∈ B
  · simp [creator, hj]
  · simp [creator, hj, mul_ite]

private theorem creator_eq_adjoint (Q : ℕ) (j : Orbital Q) :
    creator Q j = (annihilator Q j)ᴴ := by
  classical
  ext A B
  by_cases hc : j ∉ B ∧ A = insert j B
  · rcases hc with ⟨hj, rfl⟩
    simp [creator, annihilator_apply, Matrix.conjTranspose_apply, hj,
      sign_insert_not_lt j j B (lt_irrefl j), fermionSign_mul_self,
      fermionSign_star, starRingEnd_apply]
  · have hd : ¬ (j ∈ A ∧ B = A.erase j) := by
      rintro ⟨hj, rfl⟩
      apply hc
      exact ⟨Finset.notMem_erase _ _, (Finset.insert_erase hj).symm⟩
    simp [creator, annihilator, Matrix.conjTranspose_apply, hc, hd,
      fermionSign_mul_self]

/-- OAI `annihilator_square` (`FermionOperators.lean:94`), ported (private: donor content). -/
private theorem annihilator_square (Q : ℕ) (j : Orbital Q) :
    annihilator Q j * annihilator Q j = 0 := by
  classical
  ext A B
  rw [mul_annihilator_apply]
  by_cases hj : j ∈ B <;> simp [annihilator, hj]

/-- OAI `annihilator_anticommute` (`FermionOperators.lean:102`), ported. -/
private theorem annihilator_anticommute (Q : ℕ) (i j : Orbital Q) :
    annihilator Q i * annihilator Q j + annihilator Q j * annihilator Q i = 0 := by
  classical
  by_cases hij : i = j
  · subst j; rw [annihilator_square]; simp
  ext A B
  simp only [Matrix.add_apply, Matrix.zero_apply, mul_annihilator_apply]
  by_cases hi : i ∈ B
  · by_cases hj : j ∈ B
    · simp only [hi, hj, ite_true, annihilator_apply, Finset.mem_erase, ne_eq, hij,
        Ne.symm hij, not_false_eq_true, true_and, and_true]
      rw [Finset.erase_right_comm]
      by_cases hab : A = (B.erase i).erase j
      · simp only [hab, ite_true]
        rcases lt_or_gt_of_ne hij with hlt | hgt
        · rw [sign_erase_lt i j B hi hlt,
            sign_erase_not_lt j i B (not_lt.mpr hlt.le)]
          ring
        · rw [sign_erase_lt j i B hj hgt,
            sign_erase_not_lt i j B (not_lt.mpr hgt.le)]
          ring
      · simp [hab]
    · simp [hi, hj, annihilator, Finset.mem_erase]
  · simp [hi, annihilator, Finset.mem_erase]

private theorem creator_mul_annihilator (Q : ℕ) (j : Orbital Q) :
    creator Q j * annihilator Q j =
      Matrix.diagonal (fun B : Occupation Q => if j ∈ B then (1 : ℂ) else 0) := by
  classical
  ext A B
  rw [mul_annihilator_apply]
  by_cases hAB : A = B
  · subst A
    by_cases hj : j ∈ B <;>
      simp [hj, creator, sign_erase_not_lt j j B (lt_irrefl j), fermionSign_mul_self]
  · by_cases hj : j ∈ B <;> simp [creator, hj, hAB]

private theorem annihilator_mul_creator (Q : ℕ) (j : Orbital Q) :
    annihilator Q j * creator Q j =
      Matrix.diagonal (fun B : Occupation Q => if j ∈ B then (0 : ℂ) else 1) := by
  classical
  ext A B
  rw [mul_creator_apply]
  by_cases hAB : A = B
  · subst A
    by_cases hj : j ∈ B <;>
      simp [hj, annihilator_apply, sign_insert_not_lt j j B (lt_irrefl j),
        fermionSign_mul_self]
  · by_cases hj : j ∈ B <;> simp [annihilator_apply, hj, hAB]

/-- OAI `annihilator_creator_anticommute` (`FermionOperators.lean:156`), ported —
the CAR `{a_i, a_j†} = δ_ij`. -/
private theorem annihilator_creator_anticommute (Q : ℕ) (i j : Orbital Q) :
    annihilator Q i * creator Q j + creator Q j * annihilator Q i =
      if i = j then 1 else 0 := by
  classical
  by_cases hij : i = j
  · subst j
    rw [if_pos rfl, annihilator_mul_creator, creator_mul_annihilator]
    ext A B
    by_cases hi : i ∈ A <;> simp [Matrix.diagonal_apply, Matrix.one_apply, hi]
  rw [if_neg hij]
  ext A B
  simp only [Matrix.add_apply, Matrix.zero_apply, mul_annihilator_apply,
    mul_creator_apply]
  by_cases hi : i ∈ B
  · by_cases hj : j ∈ B
    · simp [hi, hj, creator, Finset.mem_erase, Ne.symm hij]
    · simp only [hi, hj, not_false_eq_true, ite_true, annihilator_apply, creator,
        Finset.mem_insert, Finset.mem_erase, hij, Ne.symm hij, false_or, ne_eq,
        not_false_eq_true, true_and]
      have he : (insert j B).erase i = insert j (B.erase i) := by
        ext k
        simp only [Finset.mem_erase, Finset.mem_insert]
        by_cases hki : k = i <;> by_cases hkj : k = j <;> simp_all
      rw [he]
      by_cases hAB : A = insert j (B.erase i)
      · simp only [hAB, ite_true]
        rcases lt_or_gt_of_ne hij with hlt | hgt
        · rw [sign_insert_not_lt j i B (not_lt.mpr hlt.le),
            sign_erase_lt i j B hi hlt]
          ring
        · rw [sign_insert_lt j i B hj hgt,
            sign_erase_not_lt i j B (not_lt.mpr hgt.le)]
          ring
      · simp [hAB]
  · by_cases hj : j ∈ B <;> simp [hi, hj, annihilator_apply, hij]

/-- OAI `annihilator_adjoint_anticommute` (`FermionOperators.lean:190`), ported. -/
private theorem annihilator_adjoint_anticommute (Q : ℕ) (i j : Orbital Q) :
    annihilator Q i * (annihilator Q j)ᴴ + (annihilator Q j)ᴴ * annihilator Q i =
      if i = j then 1 else 0 := by
  rw [← creator_eq_adjoint]
  exact annihilator_creator_anticommute Q i j

private theorem creator_anticommute (Q : ℕ) (i j : Orbital Q) :
    creator Q i * creator Q j + creator Q j * creator Q i = 0 := by
  have h1 : creator Q i * creator Q j = (annihilator Q j * annihilator Q i)ᴴ := by
    rw [creator_eq_adjoint, creator_eq_adjoint, Matrix.mul_conjTranspose]
  have h2 : creator Q j * creator Q i = (annihilator Q i * annihilator Q j)ᴴ := by
    rw [creator_eq_adjoint, creator_eq_adjoint, Matrix.mul_conjTranspose]
  rw [h1, h2, ← Matrix.conjTranspose_add, annihilator_anticommute Q j i,
    Matrix.conjTranspose_zero]

/-! ## §2 The hyperbolic model `V` and its form -/

/-- The hyperbolic model: mode functions paired with dual mode functions. -/
abbrev Hyperbolic (Q : ℕ) := (Orbital Q → ℂ) × (Orbital Q → ℂ)

/-- The pairing bilinear form `B ((c, d), (c', d')) = ∑ i, c i * d' i`. -/
def pairBilin (Q : ℕ) : Hyperbolic Q →ₗ[ℂ] Hyperbolic Q →ₗ[ℂ] ℂ where
  toFun v := { toFun := fun w => ∑ i, v.1 i * w.2 i
               map_add' := by
                 intros a b
                 simp only [Prod.snd_add, Pi.add_apply]
                 rw [← Finset.sum_add_distrib]
                 exact congrArg _ (Finset.sum_congr rfl fun i _ => by ring)
               map_smul' := by
                 intros a b
                 simp only [Prod.snd_smul, Pi.smul_apply, RingHom.id_apply, smul_eq_mul]
                 rw [← Finset.mul_sum]
                 exact congrArg _ (Finset.sum_congr rfl fun i _ => by ring) }
  map_add' := by
    intros v w
    simp only [Prod.snd_add, Pi.add_apply, LinearMap.coe_mk, AddHom.coe_mk]
    rw [← Finset.sum_add_distrib]
    exact congrArg _ (Finset.sum_congr rfl fun i _ => by ring)
  map_smul' := by
    intros r v
    simp only [Prod.snd_smul, Pi.smul_apply, RingHom.id_apply, smul_eq_mul,
      LinearMap.coe_mk, AddHom.coe_mk]
    rw [← Finset.mul_sum]
    exact congrArg _ (Finset.sum_congr rfl fun i _ => by ring)

/-- The hyperbolic quadratic form `qV (c, d) = ∑ i, c i * d i` — the restriction
shape of `TauCeti.traceQuadraticForm` along `isoV` (`traceQuadraticForm_isoV`). -/
def hyperbolicForm (Q : ℕ) : QuadraticForm ℂ (Hyperbolic Q) :=
  LinearMap.BilinMap.toQuadraticMap (pairBilin Q)

theorem hyperbolicForm_apply (Q : ℕ) (v : Hyperbolic Q) :
    hyperbolicForm Q v = ∑ i, v.1 i * v.2 i :=
  LinearMap.BilinMap.toQuadraticMap_apply _ v

theorem polar_hyperbolicForm (Q : ℕ) (x y : Hyperbolic Q) :
    QuadraticMap.polar (hyperbolicForm Q) x y =
      (∑ i, x.1 i * y.2 i) + ∑ i, y.1 i * x.2 i := by
  show hyperbolicForm Q (x + y) - hyperbolicForm Q x - hyperbolicForm Q y = _
  rw [hyperbolicForm_apply, hyperbolicForm_apply, hyperbolicForm_apply,
    show (x + y).1 = fun k => x.1 k + y.1 k from rfl,
    show (x + y).2 = fun k => x.2 k + y.2 k from rfl]
  simp only [Pi.add_apply]
  rw [← Finset.sum_add_distrib, ← Finset.sum_sub_distrib, ← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i _
  ring

/-! ## §3 The dictionary hom `Φ` -/

/-- Scalar cross-multiplication in the Fock matrix algebra (entrywise, robust). -/
private theorem fock_smul_cross {Q : ℕ} (x y : ℂ) (A B : FockMatrix Q) :
    (x • A) * (y • B) = (x * y) • (A * B) := by
  ext a b
  have h : ∀ k : Occupation Q,
      (x * A a k) * (y * B k b) = (x * y) * (A a k * B k b) := fun k => by ring
  simp only [Matrix.mul_apply, Matrix.smul_apply, smul_eq_mul]
  rw [Finset.sum_congr rfl (fun k _ => h k), ← Finset.mul_sum]
  rfl

/-- Sum-antisymmetrization over the Fock matrix ring. -/
private theorem sum_pair_antisymm (Q : ℕ) {ι : Type*} [Fintype ι] [DecidableEq ι]
    (f : ι → ι → FockMatrix Q) (h : ∀ i j, f i j + f j i = 0) :
    ∑ i, ∑ j, f i j = 0 := by
  have h2 : (∑ i, ∑ j, f i j) + (∑ i, ∑ j, f j i) = 0 := by
    have re : ∀ i : ι, (∑ j, f i j) + (∑ j, f j i) = ∑ j, (f i j + f j i) := fun i => by
      rw [← Finset.sum_add_distrib]
    rw [← Finset.sum_add_distrib,
      Finset.sum_congr rfl (fun i _ => re i),
      Finset.sum_congr rfl (fun i _ => Finset.sum_congr rfl (fun j _ => h i j))]
    simp
  have h1 : ∑ i, ∑ j, f i j = ∑ i, ∑ j, f j i := Finset.sum_comm
  exact add_self_eq_zero.mp (h1.symm ▸ h2)

/-- The Fock-side linearization of the hyperbolic basis. -/
def toFock (Q : ℕ) : Hyperbolic Q →ₗ[ℂ] FockMatrix Q where
  toFun v := ∑ i, v.1 i • annihilator Q i + ∑ i, v.2 i • creator Q i
  map_add' := by
    intros v w
    simp only [Prod.fst_add, Prod.snd_add, Pi.add_apply, Finset.sum_add_distrib,
      add_smul, LinearMap.coe_mk, AddHom.coe_mk]
    rw [add_add_add_comm]
  map_smul' := by
    intros r v
    simp only [RingHom.id_apply, Prod.fst_smul, Prod.snd_smul, Pi.smul_apply,
      Finset.sum_smul, smul_smul, smul_eq_mul, mul_smul, smul_add,
      LinearMap.coe_mk, AddHom.coe_mk]

/-- The Clifford condition on `toFock` — the ported CAR in quadratic form. -/
theorem toFock_mul_self (Q : ℕ) (v : Hyperbolic Q) :
    toFock Q v * toFock Q v = (hyperbolicForm Q v) • (1 : FockMatrix Q) := by
  classical
  have eAA : (∑ i, v.1 i • annihilator Q i) * (∑ j, v.1 j • annihilator Q j) = 0 := by
    rw [Finset.sum_mul_sum]
    refine sum_pair_antisymm Q
      (fun i j => (v.1 i • annihilator Q i) * (v.1 j • annihilator Q j)) (fun i j => ?_)
    rw [fock_smul_cross, fock_smul_cross, mul_comm (v.1 j : ℂ) (v.1 i),
      ← smul_add, annihilator_anticommute, smul_zero]
  have eBB : (∑ i, v.2 i • creator Q i) * (∑ j, v.2 j • creator Q j) = 0 := by
    rw [Finset.sum_mul_sum]
    refine sum_pair_antisymm Q
      (fun i j => (v.2 i • creator Q i) * (v.2 j • creator Q j)) (fun i j => ?_)
    rw [fock_smul_cross, fock_smul_cross, mul_comm (v.2 j : ℂ) (v.2 i),
      ← smul_add, creator_anticommute, smul_zero]
  have eAB : (∑ i, v.1 i • annihilator Q i) * (∑ j, v.2 j • creator Q j)
      + (∑ j, v.2 j • creator Q j) * (∑ i, v.1 i • annihilator Q i)
      = (∑ i, v.1 i * v.2 i) • (1 : FockMatrix Q) := by
    have expand1 : (∑ i, v.1 i • annihilator Q i) * (∑ j, v.2 j • creator Q j)
        = ∑ i, ∑ j, (v.1 i * v.2 j) • (annihilator Q i * creator Q j) := by
      rw [Finset.sum_mul_sum]
      exact Finset.sum_congr rfl fun i _ =>
        Finset.sum_congr rfl fun j _ => fock_smul_cross _ _ _ _
    have expand2 : (∑ j, v.2 j • creator Q j) * (∑ i, v.1 i • annihilator Q i)
        = ∑ i, ∑ j, (v.1 i * v.2 j) • (creator Q j * annihilator Q i) := by
      rw [Finset.sum_mul_sum, Finset.sum_comm]
      exact Finset.sum_congr rfl fun i _ =>
        Finset.sum_congr rfl fun j _ => by
          rw [fock_smul_cross, mul_comm (v.2 j : ℂ) (v.1 i)]
    have car : ∀ i j : Orbital Q, (v.1 i * v.2 j) • (annihilator Q i * creator Q j)
        + (v.1 i * v.2 j) • (creator Q j * annihilator Q i)
        = (v.1 i * v.2 j) • (if i = j then 1 else 0) := by
      intro i j
      rw [← smul_add, annihilator_creator_anticommute]
    have step : ∀ i : Orbital Q,
        ∑ j, (v.1 i * v.2 j) • (if i = j then (1 : FockMatrix Q) else 0)
          = (v.1 i * v.2 i) • 1 := by
      intro i
      have : ∀ j : Orbital Q, (v.1 i * v.2 j) • (if i = j then (1 : FockMatrix Q) else 0)
          = if i = j then (v.1 i * v.2 j) • 1 else 0 := by
        intro j; by_cases h : i = j <;> simp [h]
      rw [Finset.sum_congr rfl (fun j _ => this j), Finset.sum_ite_eq',
        if_pos (Finset.mem_univ i), smul_one]
    have merged : ∀ i : Orbital Q,
        ∑ j, (v.1 i * v.2 j) • (annihilator Q i * creator Q j)
          + ∑ j, (v.1 i * v.2 j) • (creator Q j * annihilator Q i)
          = ∑ j, (v.1 i * v.2 j) • (if i = j then 1 else 0) := fun i => by
      rw [← Finset.sum_add_distrib]
      exact Finset.sum_congr rfl fun j _ => car i j
    rw [expand1, expand2, ← Finset.sum_add_distrib, ← Finset.sum_add_distrib,
      Finset.sum_congr rfl (fun i _ => merged i),
      Finset.sum_congr rfl (fun i _ => step i), Finset.sum_smul]
  simp only [toFock, LinearMap.coe_mk, AddHom.coe_mk]
  rw [mul_add, add_mul, add_mul, eAA, eBB, zero_add, add_zero, add_comm, eAB,
    hyperbolicForm_apply]

/-- The dictionary homomorphism. -/
private theorem toFock_cond (Q : ℕ) (v : Hyperbolic Q) :
    toFock Q v * toFock Q v = algebraMap ℂ (FockMatrix Q) (hyperbolicForm Q v) := by
  rw [toFock_mul_self, Algebra.algebraMap_eq_smul_one]

/-- The dictionary homomorphism. -/
def fockDictionary (Q : ℕ) : CliffordAlgebra (hyperbolicForm Q) →ₐ[ℂ] FockMatrix Q :=
  CliffordAlgebra.lift (hyperbolicForm Q)
    (⟨toFock Q, toFock_cond Q⟩ :
      { f : Hyperbolic Q →ₗ[ℂ] FockMatrix Q //
          ∀ v, f v * f v = algebraMap ℂ (FockMatrix Q) (hyperbolicForm Q v) })

/-! ## §4 The hyperbolic basis and the occupation elements -/

/-- Hyperbolic basis: the annihilator mode `i`. -/
def hypE (Q : ℕ) (i : Orbital Q) : Hyperbolic Q := (fun k => if k = i then 1 else 0, 0)

/-- Hyperbolic basis: the creator mode `i`. -/
def hypE' (Q : ℕ) (i : Orbital Q) : Hyperbolic Q := (0, fun k => if k = i then 1 else 0)

private theorem hypE_fst (Q : ℕ) (i : Orbital Q) :
    (hypE Q i).1 = fun k => if k = i then (1 : ℂ) else 0 := rfl

private theorem hypE_snd (Q : ℕ) (i : Orbital Q) : (hypE Q i).2 = 0 := rfl

private theorem hypE'_fst (Q : ℕ) (i : Orbital Q) : (hypE' Q i).1 = 0 := rfl

private theorem hypE'_snd (Q : ℕ) (i : Orbital Q) :
    (hypE' Q i).2 = fun k => if k = i then (1 : ℂ) else 0 := rfl

private theorem hyperbolicForm_hypE (Q : ℕ) (i : Orbital Q) :
    hyperbolicForm Q (hypE Q i) = 0 := by
  rw [hyperbolicForm_apply, hypE_fst, hypE_snd]; simp

private theorem hyperbolicForm_hypE' (Q : ℕ) (i : Orbital Q) :
    hyperbolicForm Q (hypE' Q i) = 0 := by
  rw [hyperbolicForm_apply, hypE'_fst, hypE'_snd]; simp

private theorem sum_diag_delta (Q : ℕ) (i j : Orbital Q) :
    (∑ k, (if k = i then (1 : ℂ) else 0) * (if k = j then (1 : ℂ) else 0))
      = if i = j then 1 else 0 := by
  by_cases hij : i = j
  · subst j
    rw [Finset.sum_eq_single i]
    · simp
    · intro k _ hki; simp [hki]
    · intro hi; exact absurd (Finset.mem_univ i) hi
  · have : ∀ k : Orbital Q,
        (if k = i then (1 : ℂ) else 0) * (if k = j then (1 : ℂ) else 0) = 0 := by
      intro k; by_cases hki : k = i <;> by_cases hkj : k = j <;> simp [hki, hkj, hij, Ne.symm hij]
    rw [Finset.sum_congr rfl (fun k _ => this k), Finset.sum_const_zero]
    rw [if_neg hij]

private theorem polar_hypE (Q : ℕ) (i j : Orbital Q) :
    QuadraticMap.polar (hyperbolicForm Q) (hypE Q i) (hypE' Q j)
      = if i = j then (1 : ℂ) else 0 := by
  rw [polar_hyperbolicForm, hypE_fst, hypE_snd, hypE'_fst, hypE'_snd, sum_diag_delta]
  simp

private theorem polar_hypE'_hypE' (Q : ℕ) (i j : Orbital Q) (hij : i ≠ j) :
    QuadraticMap.polar (hyperbolicForm Q) (hypE' Q i) (hypE' Q j) = 0 := by
  rw [polar_hyperbolicForm, hypE'_fst, hypE'_snd]
  simp

private theorem polar_hypE_hypE (Q : ℕ) (i j : Orbital Q) (hij : i ≠ j) :
    QuadraticMap.polar (hyperbolicForm Q) (hypE Q i) (hypE Q j) = 0 := by
  rw [polar_hyperbolicForm, hypE_fst, hypE_snd]
  simp

/-- The abstract occupation element at mode `i` — tauceti's
`carOccupationElement` shape at a hyperbolic pair. -/
def occupationElem (Q : ℕ) (i : Orbital Q) :
    CliffordAlgebra (hyperbolicForm Q) :=
  ι (hyperbolicForm Q) (hypE' Q i) * ι (hyperbolicForm Q) (hypE Q i)

private theorem iota_anti_comm {Q : ℕ} (x y : Hyperbolic Q)
    (h : QuadraticMap.polar (hyperbolicForm Q) x y = 0) :
    ι (hyperbolicForm Q) x * ι (hyperbolicForm Q) y
      = -(ι (hyperbolicForm Q) y * ι (hyperbolicForm Q) x) := by
  have h2 := CliffordAlgebra.ι_mul_ι_add_swap (hyperbolicForm Q) x y
  rw [h, map_zero, add_zero] at h2
  exact (eq_of_add_eq_zero_left h2).symm

/-- The occupation elements are idempotent — the `CAR/Occupation.lean:121` shape,
proved from the Clifford relation alone. -/
theorem occupationElem_mul_self (Q : ℕ) (i : Orbital Q) :
    occupationElem Q i * occupationElem Q i = occupationElem Q i := by
  have hs := CliffordAlgebra.ι_mul_ι_add_swap (hyperbolicForm Q) (hypE Q i) (hypE' Q i)
  rw [polar_hypE Q i i, if_pos rfl, map_one] at hs
  have hswap : ι (hyperbolicForm Q) (hypE Q i) * ι (hyperbolicForm Q) (hypE' Q i)
      = 1 - occupationElem Q i := by
    rw [occupationElem, eq_sub_iff_add_eq, ← hs]
  calc occupationElem Q i * occupationElem Q i
      = ι (hyperbolicForm Q) (hypE' Q i)
          * (ι (hyperbolicForm Q) (hypE Q i) * ι (hyperbolicForm Q) (hypE' Q i))
          * ι (hyperbolicForm Q) (hypE Q i) := by
        rw [← mul_assoc, ← mul_assoc]
    _ = ι (hyperbolicForm Q) (hypE' Q i) * (1 - occupationElem Q i)
          * ι (hyperbolicForm Q) (hypE Q i) := by rw [hswap]
    _ = occupationElem Q i
          - ι (hyperbolicForm Q) (hypE' Q i) * (ι (hyperbolicForm Q) (hypE' Q i)
              * (ι (hyperbolicForm Q) (hypE Q i) * ι (hyperbolicForm Q) (hypE Q i))) := by
        rw [sub_mul, sub_mul, mul_sub, occupationElem]
    _ = occupationElem Q i - 0 := by
        congr 1
        rw [← mul_assoc, ← mul_assoc, ← mul_assoc,
          ← CliffordAlgebra.ι_sq_scalar (hyperbolicForm Q) (hypE' Q i),
          ← CliffordAlgebra.ι_sq_scalar (hyperbolicForm Q) (hypE Q i),
          hyperbolicForm_hypE', hyperbolicForm_hypE, map_zero, zero_mul, mul_zero]
    _ = occupationElem Q i := sub_zero

/-- The occupation elements pairwise commute — the `CAR/Occupation.lean:138` shape. -/
theorem commute_occupationElem (Q : ℕ) (i j : Orbital Q) :
    Commute (occupationElem Q i) (occupationElem Q j) := by
  by_cases hij : i = j
  · subst j; exact Commute.refl _
  have f1 : ι (hyperbolicForm Q) (hypE Q i) * ι (hyperbolicForm Q) (hypE' Q j)
      = -(ι (hyperbolicForm Q) (hypE' Q j) * ι (hyperbolicForm Q) (hypE Q i)) :=
    iota_anti_comm _ _ (by rw [polar_hypE Q i j, if_neg hij])
  have f2 : ι (hyperbolicForm Q) (hypE' Q i) * ι (hyperbolicForm Q) (hypE' Q j)
      = -(ι (hyperbolicForm Q) (hypE' Q j) * ι (hyperbolicForm Q) (hypE' Q i)) :=
    iota_anti_comm _ _ (polar_hypE'_hypE' Q i j hij)
  have f3 : ι (hyperbolicForm Q) (hypE Q i) * ι (hyperbolicForm Q) (hypE Q j)
      = -(ι (hyperbolicForm Q) (hypE Q j) * ι (hyperbolicForm Q) (hypE Q i)) :=
    iota_anti_comm _ _ (polar_hypE_hypE Q i j hij)
  show occupationElem Q i * occupationElem Q j = occupationElem Q j * occupationElem Q i
  calc occupationElem Q i * occupationElem Q j
      = ι (hyperbolicForm Q) (hypE' Q i)
          * (ι (hyperbolicForm Q) (hypE Q i) * ι (hyperbolicForm Q) (hypE' Q j))
          * ι (hyperbolicForm Q) (hypE Q j) := by
        rw [occupationElem, occupationElem, ← mul_assoc, ← mul_assoc]
    _ = -(ι (hyperbolicForm Q) (hypE' Q i) * ι (hyperbolicForm Q) (hypE' Q j))
          * (ι (hyperbolicForm Q) (hypE Q i) * ι (hyperbolicForm Q) (hypE Q j)) := by
        rw [f1, ← mul_assoc, ← mul_assoc, ← neg_mul]
    _ = (ι (hyperbolicForm Q) (hypE' Q j) * ι (hyperbolicForm Q) (hypE' Q i))
          * (ι (hyperbolicForm Q) (hypE Q j) * ι (hyperbolicForm Q) (hypE Q i)) := by
        rw [f2, f3, neg_mul_neg]
    _ = ι (hyperbolicForm Q) (hypE' Q j)
          * (ι (hyperbolicForm Q) (hypE Q j) * ι (hyperbolicForm Q) (hypE' Q i))
          * ι (hyperbolicForm Q) (hypE Q i) := by
        rw [mul_assoc, mul_assoc, ← mul_assoc, ← mul_assoc]
    _ = occupationElem Q j * occupationElem Q i := by
        rw [occupationElem, occupationElem, ← mul_assoc, ← mul_assoc]

/-! ## §5 The transports to the Fock side -/

theorem fockDictionary_apply_hypE (Q : ℕ) (i : Orbital Q) :
    fockDictionary Q (ι (hyperbolicForm Q) (hypE Q i)) = annihilator Q i := by
  rw [fockDictionary, CliffordAlgebra.lift_ι_apply]
  simp only [toFock, LinearMap.coe_mk, AddHom.coe_mk, hypE_fst, hypE_snd,
    Pi.zero_apply, smul_zero, Finset.sum_const_zero, add_zero]
  rw [Finset.sum_ite_eq' (Finset.univ) i (fun k => (if k = i then (1 : ℂ) else 0)
      • annihilator Q k), if_pos (Finset.mem_univ i), one_smul]

theorem fockDictionary_apply_hypE' (Q : ℕ) (i : Orbital Q) :
    fockDictionary Q (ι (hyperbolicForm Q) (hypE' Q i)) = creator Q i := by
  rw [fockDictionary, CliffordAlgebra.lift_ι_apply]
  simp only [toFock, LinearMap.coe_mk, AddHom.coe_mk, hypE'_fst, hypE'_snd,
    Pi.zero_apply, smul_zero, Finset.sum_const_zero, zero_add]
  rw [Finset.sum_ite_eq' (Finset.univ) i (fun k => (if k = i then (1 : ℂ) else 0)
      • creator Q k), if_pos (Finset.mem_univ i), one_smul]

/-- The transported number operator: the dictionary intertwines the abstract
occupation elements with `creator * annihilator` (the diagonal number operator of
`creator_mul_annihilator`). -/
theorem dictionary_numberOp (Q : ℕ) (i : Orbital Q) :
    fockDictionary Q (occupationElem Q i) = creator Q i * annihilator Q i := by
  rw [occupationElem, map_mul, fockDictionary_apply_hypE', fockDictionary_apply_hypE]

theorem dictionary_idempotent (Q : ℕ) (i : Orbital Q) :
    IsIdempotentElem (fockDictionary Q (occupationElem Q i)) :=
  ⟨by rw [← map_mul, occupationElem_mul_self]⟩

theorem dictionary_commute (Q : ℕ) (i j : Orbital Q) :
    Commute (fockDictionary Q (occupationElem Q i))
      (fockDictionary Q (occupationElem Q j)) :=
  ⟨by rw [← map_mul, ← map_mul, commute_occupationElem]⟩

/-! ## §6 The element-level dictionary to tauceti's declaration -/

/-- The isotropic-pair embedding of the hyperbolic model into
`Matrix (Sum (Orbital Q) (Orbital Q))`. -/
def isoV (Q : ℕ) :
    Hyperbolic Q →ₗ[ℂ] Matrix (Orbital Q ⊕ Orbital Q) (Orbital Q ⊕ Orbital Q) ℂ where
  toFun v := Matrix.of fun a b =>
    match a, b with
    | Sum.inl x, Sum.inr y => if x = y then v.2 y / 2 else 0
    | Sum.inr x, Sum.inl y => if x = y then v.1 y else 0
    | _, _ => 0
  map_add' := by
    intros v w
    ext a b
    cases a <;> cases b
    · simp [isoV, Matrix.of_apply, Matrix.add_apply]
    · by_cases h : _ = _
      · simp only [isoV, Matrix.of_apply, Matrix.add_apply, h, Prod.snd_add]
        field_simp
      · simp [isoV, Matrix.of_apply, Matrix.add_apply, h]
    · by_cases h : _ = _
      · simp only [isoV, Matrix.of_apply, Matrix.add_apply, h, Prod.fst_add]
        field_simp
      · simp [isoV, Matrix.of_apply, Matrix.add_apply, h]
    · simp [isoV, Matrix.of_apply, Matrix.add_apply]
  map_smul' := by
    intros r v
    ext a b
    cases a <;> cases b
    · simp [isoV, Matrix.of_apply, Matrix.smul_apply]
    · by_cases h : _ = _
      · simp only [isoV, Matrix.of_apply, Matrix.smul_apply, h, Prod.snd_smul,
          RingHom.id_apply, smul_eq_mul]
        field_simp
      · simp [isoV, Matrix.of_apply, Matrix.smul_apply, h]
    · by_cases h : _ = _
      · simp only [isoV, Matrix.of_apply, Matrix.smul_apply, h, Prod.fst_smul,
          RingHom.id_apply, smul_eq_mul]
        field_simp
      · simp [isoV, Matrix.of_apply, Matrix.smul_apply, h]
    · simp [isoV, Matrix.of_apply, Matrix.smul_apply]

private theorem isoV_inl_inr (Q : ℕ) (v : Hyperbolic Q) (x y : Orbital Q) :
    isoV Q v (Sum.inl x) (Sum.inr y) = if x = y then v.2 y / 2 else 0 := rfl

private theorem isoV_inr_inl (Q : ℕ) (v : Hyperbolic Q) (x y : Orbital Q) :
    isoV Q v (Sum.inr x) (Sum.inl y) = if x = y then v.1 y else 0 := rfl

private theorem isoV_zero_inl_inl (Q : ℕ) (v : Hyperbolic Q) (x y : Orbital Q) :
    isoV Q v (Sum.inl x) (Sum.inl y) = 0 := rfl

private theorem isoV_zero_inr_inr (Q : ℕ) (v : Hyperbolic Q) (x y : Orbital Q) :
    isoV Q v (Sum.inr x) (Sum.inr y) = 0 := rfl

/-- The form match: `qV` is the restriction shape of tauceti's trace form along
`isoV` — the bridge at the level of the census form
(`TauCeti.traceQuadraticForm`, `TraceForm.lean:177`). -/
theorem traceQuadraticForm_isoV (Q : ℕ) (v : Hyperbolic Q) :
    TauCeti.traceQuadraticForm ℂ (Orbital Q ⊕ Orbital Q) (isoV Q v)
      = hyperbolicForm Q v := by
  classical
  have einl : ∀ x : Orbital Q, (isoV Q v * isoV Q v) (Sum.inl x) (Sum.inl x)
      = v.1 x * v.2 x / 2 := by
    intro x
    rw [Matrix.mul_apply, Fintype.sum_sum_type]
    have hL : ∑ z : Orbital Q, isoV Q v (Sum.inl x) (Sum.inl z)
        * isoV Q v (Sum.inl z) (Sum.inl x) = 0 := by
      refine Finset.sum_eq_zero fun z _ => ?_
      rw [isoV_zero_inl_inl, zero_mul]
    rw [hL, zero_add]
    have inner : ∀ z : Orbital Q, isoV Q v (Sum.inl x) (Sum.inr z)
        * isoV Q v (Sum.inr z) (Sum.inl x)
        = if z = x then v.2 x * v.1 x / 2 else 0 := by
      intro z
      rw [isoV_inl_inr, isoV_inr_inl]
      by_cases hxz : x = z <;> by_cases hzx : z = x <;>
        simp [hxz, hzx] <;> ring
    have hsum : ∑ z : Orbital Q, isoV Q v (Sum.inl x) (Sum.inr z)
        * isoV Q v (Sum.inr z) (Sum.inl x)
        = ∑ z : Orbital Q, if z = x then v.2 x * v.1 x / 2 else 0 :=
      Finset.sum_congr rfl fun z _ => inner z
    rw [hsum, Finset.sum_ite_eq' (Finset.univ) x (fun _ => v.2 x * v.1 x / 2),
      if_pos (Finset.mem_univ x)]
    ring
  have einr : ∀ x : Orbital Q, (isoV Q v * isoV Q v) (Sum.inr x) (Sum.inr x)
      = v.1 x * v.2 x / 2 := by
    intro x
    rw [Matrix.mul_apply, Fintype.sum_sum_type]
    have hR : ∑ z : Orbital Q, isoV Q v (Sum.inr x) (Sum.inr z)
        * isoV Q v (Sum.inr z) (Sum.inr x) = 0 := by
      refine Finset.sum_eq_zero fun z _ => ?_
      rw [isoV_zero_inr_inr, zero_mul]
    rw [hR, zero_add]
    have inner : ∀ z : Orbital Q, isoV Q v (Sum.inr x) (Sum.inl z)
        * isoV Q v (Sum.inl z) (Sum.inr x)
        = if z = x then v.1 x * v.2 x / 2 else 0 := by
      intro z
      rw [isoV_inr_inl, isoV_inl_inr]
      by_cases hxz : x = z <;> by_cases hzx : z = x <;>
        simp [hxz, hzx] <;> ring
    have hsum : ∑ z : Orbital Q, isoV Q v (Sum.inr x) (Sum.inl z)
        * isoV Q v (Sum.inl z) (Sum.inr x)
        = ∑ z : Orbital Q, if z = x then v.1 x * v.2 x / 2 else 0 :=
      Finset.sum_congr rfl fun z _ => inner z
    rw [hsum, Finset.sum_ite_eq' (Finset.univ) x (fun _ => v.1 x * v.2 x / 2),
      if_pos (Finset.mem_univ x)]
  rw [TauCeti.traceQuadraticForm_apply]
  show (∑ a : Orbital Q ⊕ Orbital Q, (isoV Q v * isoV Q v) a a) = _
  rw [Fintype.sum_sum_type, einl, einr, Finset.sum_add_distrib, hyperbolicForm_apply]
  apply congrArg _ (Finset.sum_congr rfl)
  intro x _
  ring

/-- The isometry into tauceti's form. -/
def isoQ (Q : ℕ) :
    QuadraticMap.Isometry (hyperbolicForm Q)
      (TauCeti.traceQuadraticForm ℂ (Orbital Q ⊕ Orbital Q)) :=
  ⟨isoV Q, traceQuadraticForm_isoV Q⟩

private theorem isoV_hypE (Q : ℕ) (i : Orbital Q) :
    isoV Q (hypE Q i) = Matrix.single (Sum.inr i) (Sum.inl i) 1 := by
  ext a b
  cases a <;> cases b
  · simp [isoV, Matrix.of_apply, hypE_snd, Matrix.single_apply]
  · simp [isoV, Matrix.of_apply, hypE_snd, hypE_fst, Matrix.single_apply]
  · by_cases h : _ = _
    · simp [isoV, Matrix.of_apply, hypE_snd, hypE_fst, Matrix.single_apply, h]
    · simp [isoV, Matrix.of_apply, hypE_snd, hypE_fst, Matrix.single_apply, h]
  · simp [isoV, Matrix.of_apply, hypE_snd, Matrix.single_apply]

private theorem isoV_hypE' (Q : ℕ) (i : Orbital Q) :
    isoV Q (hypE' Q i) = (2 : ℂ)⁻¹ • Matrix.single (Sum.inl i) (Sum.inr i) 1 := by
  ext a b
  cases a <;> cases b
  · by_cases h : _ = _
    · simp only [isoV, Matrix.of_apply, hypE'_fst, hypE'_snd, Matrix.smul_apply,
        smul_eq_mul, Matrix.single_apply, h, Pi.zero_apply, zero_mul, mul_zero]
      field_simp
    · simp [isoV, Matrix.of_apply, hypE'_fst, hypE'_snd, Matrix.smul_apply,
        Matrix.single_apply, h]
  · by_cases h : _ = _
    · simp only [isoV, Matrix.of_apply, hypE'_fst, hypE'_snd, Matrix.smul_apply,
        smul_eq_mul, Matrix.single_apply, h, Pi.zero_apply, zero_mul, mul_zero]
      field_simp
    · simp [isoV, Matrix.of_apply, hypE'_fst, hypE'_snd, Matrix.smul_apply,
        Matrix.single_apply, h]
  · simp [isoV, Matrix.of_apply, hypE'_fst, hypE'_snd, Matrix.smul_apply,
      Matrix.single_apply]
  · simp [isoV, Matrix.of_apply, hypE'_fst, hypE'_snd, Matrix.smul_apply,
      Matrix.single_apply]

/-- The element-level dictionary: the abstract occupation elements ARE tauceti's
`carOccupationElement` at the hyperbolic matrix-unit pairs, along `isoV`. -/
theorem map_iso_occupationElem (Q : ℕ) (i : Orbital Q) :
    CliffordAlgebra.map (isoQ Q) (occupationElem Q i)
      = TauCeti.carOccupationElement ℂ (Sum.inl i) (Sum.inr i) := by
  rw [occupationElem, map_mul, CliffordAlgebra.map_apply_ι,
    CliffordAlgebra.map_apply_ι, isoV_hypE, isoV_hypE', LinearMap.map_smul]
  unfold TauCeti.carOccupationElement TauCeti.carGenerator
  rw [smul_mul_assoc]

end
end CrossMath.Pilot77

/-! ## Audit surface (charter: every top-level theorem, triad-only expected) -/

#print axioms CrossMath.Pilot77.toFock_mul_self
#print axioms CrossMath.Pilot77.occupationElem_mul_self
#print axioms CrossMath.Pilot77.commute_occupationElem
#print axioms CrossMath.Pilot77.dictionary_numberOp
#print axioms CrossMath.Pilot77.dictionary_idempotent
#print axioms CrossMath.Pilot77.dictionary_commute
#print axioms CrossMath.Pilot77.traceQuadraticForm_isoV
#print axioms CrossMath.Pilot77.map_iso_occupationElem
