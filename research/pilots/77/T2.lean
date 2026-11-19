import Mathlib

/-!
# Pilot 77, T2 — the grading ↔ blocks layer (parity/card-block delivery)

**Charter** (dossier 77 §"Precise mathematical statement" T2, as re-chartered at the
T1 amendment 2026-11-17: T1(iii) — the card-grading statement re-deriving the donor's
`hamiltonian_entry_eq_zero` — moved to T2's parity/card-block delivery; executed with
T1-completion as ONE unit, ≤4 + ≤4 run budgets). Billing C+ substrate-bridge.

**Scope honesty (the corrected T2).** The dossier's drafted T2 — "stated and proved
once over tauceti's `SetLike`-graded discipline, then instantiated at Φ (T1)" — is
DELIVERED HERE at the entry-level form: the `⨁_n`-grading decomposition
(`isDegreeBlock_iff_sum_blockProj`), the mod-2 regrading decomposition
(`isParityBlock_iff_sum_parityProj`), and the coarsening
(`isParityBlock_of_isDegreeBlock`), instantiated at the Laughlin pair-Hamiltonian
(abstract coefficient shape) to re-derive the donor's `hamiltonian_entry_eq_zero`
(OAI `Model.lean:138`) and its parity coarsening. The FULL tauceti-SetLike
instantiation through the T1 dictionary `Φ` (transport of the grading along the
hom) is recorded as the T2-extension condition, not claimed here: it needs the
image-grading of `Φ`, which the T1 amendment already showed is dimension-delicate.

**What this file proves.**
- §1 (abstract, any `κ` with a degree map `deg : κ → ℕ`): the homogeneous-component
  decomposition `isDegreeBlock_iff_sum_blockProj` (degree-block-diagonal ↔ sum of
  the `blockProj` components over the degree spectrum), the mod-2 regrading
  `isParityBlock_iff_sum_parityProj` (equal-parity ↔ sum of the even/odd
  components), the coarsening `isParityBlock_of_isDegreeBlock`, and closure of
  both conditions under finite sums (`isDegreeBlock_sum`, `isParityBlock_sum`).
- §2 (the Laughlin instance, abstract coefficients): `pairOp` is the donor's
  `pairAnnihilator` (OAI `Model.lean:35`) at an abstract coefficient function
  `c : Orbital Q → Orbital Q → ℂ` (the donor instantiates `c := ↑(pairCoefficient Q p)`;
  the block structure proved here is independent of the coefficients);
  `gramPair`/`pairHamiltonian` mirror the donor's `hamiltonian` Gram shape
  (`Model.lean:43`). Main results: `pairHamiltonian_isDegreeBlock` — the pair
  Hamiltonian is card-block-diagonal; `pairHamiltonian_entry_eq_zero` — the
  donor's `Model.lean:138` statement re-derived at the abstract shape;
  `pairHamiltonian_isParityBlock` — the parity-sector corollary (the pair
  Hamiltonian connects only particle-number sectors of equal parity).

**Fences** (battery conditions (i)–(iv), carried from T1): no Casimir content; no
injectivity claim; physlib clock — see the run log header for the end-tick; billing
C+. OAI LaughlinFock content is statement-level ported from the v4.34.1 donor
(read-only, no OAI build). PROOF artifact: zero `sorry`, kernel-verified. Binder
inventory: NONE.
-/

namespace CrossMath.Pilot77T2

noncomputable section

open scoped BigOperators Matrix

/-! ## §1 The abstract degree/parity block structure -/

section Abstract

-- `[Fintype κ]` (follow-up unit, run-10 finding): `isDegreeBlock_iff_sum_blockProj`'s
-- degree-spectrum sum runs over `Finset.image deg Finset.univ`, which needs the index
-- type finite — the drafted statement was ill-typed without it (the run-9 "filter-blind
-- spot" gremlin: `error(lean.synthInstanceFailed)` at :77/:90, invisible to the old
-- runner filter, hence the sorryAx). The parity twin needs no Fintype (its spectrum is
-- `Finset.range 2`), which is why it verified cleanly. Section-variable auto-inclusion
-- is use-based: only the iff gains the binder.
variable {κ : Type*} [DecidableEq κ] [Fintype κ]

/-- `M` is block-diagonal w.r.t. the degree map `deg` (the `⨁_n`-grading condition,
entry form): entries between different degrees vanish. -/
def IsDegreeBlock (deg : κ → ℕ) (M : Matrix κ κ ℂ) : Prop :=
  ∀ a b, deg a ≠ deg b → M a b = 0

/-- `M` connects only degrees of equal parity (the mod-2 regrading condition). -/
def IsParityBlock (deg : κ → ℕ) (M : Matrix κ κ ℂ) : Prop :=
  ∀ a b, deg a % 2 ≠ deg b % 2 → M a b = 0

/-- The `n`-th homogeneous-component projector. -/
def blockProj (deg : κ → ℕ) (n : ℕ) (M : Matrix κ κ ℂ) : Matrix κ κ ℂ := fun a b =>
  if deg a = n ∧ deg b = n then M a b else 0

/-- T2(a) — the `⨁_n`-grading decomposition: `M` is degree-block-diagonal iff it is
the sum of its homogeneous components over the degree spectrum. -/
theorem isDegreeBlock_iff_sum_blockProj (deg : κ → ℕ) (M : Matrix κ κ ℂ) :
    IsDegreeBlock deg M ↔
      ∑ n ∈ Finset.image deg Finset.univ, blockProj deg n M = M := by
  constructor
  · intro h
    ext a b
    rw [Matrix.sum_apply, Finset.sum_eq_single (deg a)]
    · show (if deg a = deg a ∧ deg b = deg a then M a b else 0) = M a b
      by_cases hab : deg a = deg b
      · rw [if_pos ⟨rfl, hab.symm⟩]
      · rw [if_neg (fun hc => hab hc.2.symm), h a b hab]
    · intro n _ hn
      show (if deg a = n ∧ deg b = n then M a b else 0) = 0
      rw [if_neg (fun hc => hn hc.1.symm)]
    · intro hn
      -- pin signature (run-11 finding): `Finset.mem_image_of_mem` takes `f` EXPLICIT
      -- first on this mathlib (1b1ccf4b), not implicit-position as drafted.
      exact absurd (Finset.mem_image_of_mem deg (Finset.mem_univ a)) hn
  · intro h a b hab
    rw [← h, Matrix.sum_apply]
    refine Finset.sum_eq_zero fun n _ => ?_
    show (if deg a = n ∧ deg b = n then M a b else 0) = 0
    rw [if_neg (fun hc => hab (hc.1.trans hc.2.symm))]

/-- The parity-`b` component projector (`b = 0` even, `b = 1` odd). -/
def parityProj (deg : κ → ℕ) (b : ℕ) (M : Matrix κ κ ℂ) : Matrix κ κ ℂ := fun a c =>
  if deg a % 2 = b ∧ deg c % 2 = b then M a c else 0

/-- T2(b) — the mod-2 regrading decomposition: `M` connects only equal-parity degrees
iff it is the sum of its even and odd components. -/
theorem isParityBlock_iff_sum_parityProj (deg : κ → ℕ) (M : Matrix κ κ ℂ) :
    IsParityBlock deg M ↔ ∑ b ∈ Finset.range 2, parityProj deg b M = M := by
  constructor
  · intro h
    ext a c
    rw [Matrix.sum_apply, Finset.sum_eq_single (deg a % 2)]
    · show (if deg a % 2 = deg a % 2 ∧ deg c % 2 = deg a % 2 then M a c else 0) = M a c
      by_cases hab : deg a % 2 = deg c % 2
      · rw [if_pos ⟨rfl, hab.symm⟩]
      · rw [if_neg (fun hc => hab hc.2.symm), h a c hab]
    · intro b _ hb
      show (if deg a % 2 = b ∧ deg c % 2 = b then M a c else 0) = 0
      rw [if_neg (fun hc => hb hc.1.symm)]
    · intro hn
      exact absurd (Finset.mem_range.mpr (Nat.mod_lt _ two_pos)) hn
  · intro h a c hab
    rw [← h, Matrix.sum_apply]
    refine Finset.sum_eq_zero fun b _ => ?_
    show (if deg a % 2 = b ∧ deg c % 2 = b then M a c else 0) = 0
    rw [if_neg (fun hc => hab (hc.1.trans hc.2.symm))]

/-- T2(c) — the coarsening: the exact-degree grading refines to the parity grading. -/
theorem isParityBlock_of_isDegreeBlock (deg : κ → ℕ) (M : Matrix κ κ ℂ)
    (h : IsDegreeBlock deg M) : IsParityBlock deg M :=
  fun a b hab => h a b (fun he => hab (by rw [he]))

/-- Degree-block-diagonality is closed under finite sums. -/
theorem isDegreeBlock_sum {ι' : Type*} (deg : κ → ℕ) (t : Finset ι')
    (f : ι' → Matrix κ κ ℂ) (h : ∀ k ∈ t, IsDegreeBlock deg (f k)) :
    IsDegreeBlock deg (∑ k ∈ t, f k) := by
  intro a b hab
  rw [Matrix.sum_apply]
  exact Finset.sum_eq_zero fun k hk => h k hk a b hab

/-- Parity-block-diagonality is closed under finite sums. -/
theorem isParityBlock_sum {ι' : Type*} (deg : κ → ℕ) (t : Finset ι')
    (f : ι' → Matrix κ κ ℂ) (h : ∀ k ∈ t, IsParityBlock deg (f k)) :
    IsParityBlock deg (∑ k ∈ t, f k) := by
  intro a b hab
  rw [Matrix.sum_apply]
  exact Finset.sum_eq_zero fun k hk => h k hk a b hab

end Abstract

/-! ## §2 The Fock side (OAI LaughlinFock, statement-level port) -/

abbrev Orbital (Q : ℕ) := Fin (Q + 1)

abbrev Occupation (Q : ℕ) := Finset (Orbital Q)

abbrev FockMatrix (Q : ℕ) := Matrix (Occupation Q) (Occupation Q) ℂ

def fermionSign {Q : ℕ} (j : Orbital Q) (B : Occupation Q) : ℂ :=
  (-1 : ℂ) ^ (B.filter (fun i => i < j)).card

/-- OAI `LaughlinFock.annihilator` (`Model.lean:28`), verbatim. -/
def annihilator (Q : ℕ) (j : Orbital Q) : FockMatrix Q := fun A B =>
  if j ∈ B ∧ A = B.erase j then fermionSign j B else 0

private theorem annihilator_entry_eq_zero {Q : ℕ} (j : Orbital Q) (X Y : Occupation Q)
    (hXY : X.card + 1 ≠ Y.card) : annihilator Q j X Y = 0 := by
  classical
  show (if j ∈ Y ∧ X = Y.erase j then fermionSign j Y else 0) = 0
  by_cases hc : j ∈ Y ∧ X = Y.erase j
  · rw [if_pos hc]
    have hy1 : 0 < Y.card := Finset.card_pos.mpr ⟨j, hc.1⟩
    have hcard : X.card = Y.card - 1 := by
      rw [hc.2]
      exact Finset.card_erase_of_mem hc.1
    exact absurd (by omega) hXY
  · rw [if_neg hc]

/-! ### The pair operators with abstract coefficients -/

/-- The pair-annihilation operator at an abstract coefficient function — the donor's
`pairAnnihilator` (OAI `Model.lean:35`) is this at `c := ↑(pairCoefficient Q p)`;
the block structure below is independent of the coefficients. -/
def pairOp (Q : ℕ) (c : Orbital Q → Orbital Q → ℂ) : FockMatrix Q :=
  ∑ i, ∑ j, if i < j then c i j • (annihilator Q j * annihilator Q i) else 0

/-- A pair product never raises the entry card by other than 2. -/
private theorem pairProd_entry_eq_zero (Q : ℕ) (i j : Orbital Q) (X Y : Occupation Q)
    (h : X.card + 2 ≠ Y.card) : (annihilator Q j * annihilator Q i) X Y = 0 := by
  classical
  rw [Matrix.mul_apply]
  refine Finset.sum_eq_zero fun D _ => ?_
  by_cases h1 : X.card + 1 = D.card
  · have h2 : D.card + 1 ≠ Y.card := by omega
    rw [annihilator_entry_eq_zero i D Y h2, mul_zero]
  · rw [annihilator_entry_eq_zero j X D h1, zero_mul]

private theorem pairOp_entry_eq_zero (Q : ℕ) (c : Orbital Q → Orbital Q → ℂ)
    (X Y : Occupation Q) (h : X.card + 2 ≠ Y.card) : pairOp Q c X Y = 0 := by
  classical
  simp only [pairOp, Matrix.sum_apply]
  refine Finset.sum_eq_zero fun i _ => ?_
  refine Finset.sum_eq_zero fun j _ => ?_
  by_cases hij : i < j
  · show (if i < j then c i j • (annihilator Q j * annihilator Q i) else (0 : FockMatrix Q)) X Y = 0
    rw [if_pos hij, Matrix.smul_apply, smul_eq_mul,
      pairProd_entry_eq_zero Q i j X Y h, mul_zero]
  · show (if i < j then c i j • (annihilator Q j * annihilator Q i) else (0 : FockMatrix Q)) X Y = 0
    rw [if_neg hij]
    rfl

/-- The Gram term of the pair Hamiltonian. -/
def gramPair (Q : ℕ) (c : Orbital Q → Orbital Q → ℂ) : FockMatrix Q :=
  (pairOp Q c)ᴴ * pairOp Q c

/-- The pair Hamiltonian at an abstract finite family of coefficient functions —
the donor's `hamiltonian Q` (OAI `Model.lean:43`) is
`∑ p ∈ range (2 * Q - 1), gramPair Q (↑pairCoefficient Q p)`. -/
def pairHamiltonian (Q : ℕ) (cs : ℕ → Orbital Q → Orbital Q → ℂ) (t : Finset ℕ) :
    FockMatrix Q :=
  ∑ p ∈ t, gramPair Q (cs p)

private theorem gramPair_isDegreeBlock (Q : ℕ) (c : Orbital Q → Orbital Q → ℂ) :
    IsDegreeBlock (fun A : Occupation Q => A.card) (gramPair Q c) := by
  intro A B hAB
  have hAB' : A.card ≠ B.card := hAB
  classical
  rw [gramPair, Matrix.mul_apply]
  have hC : ∀ C : Occupation Q, (pairOp Q c)ᴴ A C = star (pairOp Q c C A) :=
    fun C => Matrix.conjTranspose_apply _ _ _
  calc ∑ C, (pairOp Q c)ᴴ A C * pairOp Q c C B
      = ∑ C, star (pairOp Q c C A) * pairOp Q c C B :=
        Finset.sum_congr rfl fun C _ => by rw [hC C]
    _ = 0 := by
        refine Finset.sum_eq_zero fun C _ => ?_
        by_cases hCA : C.card + 2 = A.card
        · have hCB : C.card + 2 ≠ B.card := by omega
          rw [pairOp_entry_eq_zero Q c C B hCB, mul_zero]
        · rw [pairOp_entry_eq_zero Q c C A hCA, star_zero, zero_mul]

/-- T2 instance (i): the pair Hamiltonian is card-block-diagonal — the `⨁_n`-graded
element condition of T2(a) at the Laughlin card grading. -/
theorem pairHamiltonian_isDegreeBlock (Q : ℕ) (cs : ℕ → Orbital Q → Orbital Q → ℂ)
    (t : Finset ℕ) :
    IsDegreeBlock (fun A : Occupation Q => A.card) (pairHamiltonian Q cs t) :=
  isDegreeBlock_sum _ _ _ fun p _ => gramPair_isDegreeBlock Q (cs p)

/-- The donor's `hamiltonian_entry_eq_zero` (OAI `Model.lean:138`), re-derived at the
abstract coefficient shape: the pair Hamiltonian has zero entries between
occupations of different particle number. -/
theorem pairHamiltonian_entry_eq_zero (Q : ℕ) (cs : ℕ → Orbital Q → Orbital Q → ℂ)
    (t : Finset ℕ) (A B : Occupation Q) (h : A.card ≠ B.card) :
    pairHamiltonian Q cs t A B = 0 :=
  pairHamiltonian_isDegreeBlock Q cs t A B h

/-- T2 instance (ii) — the parity coarsening at the Laughlin instance: the pair
Hamiltonian connects only particle-number sectors of equal parity (the mod-2
corollary of the donor's exact-card `sectorHamiltonian` decomposition). -/
theorem pairHamiltonian_isParityBlock (Q : ℕ) (cs : ℕ → Orbital Q → Orbital Q → ℂ)
    (t : Finset ℕ) :
    IsParityBlock (fun A : Occupation Q => A.card) (pairHamiltonian Q cs t) :=
  isParityBlock_of_isDegreeBlock _ _ (pairHamiltonian_isDegreeBlock Q cs t)

end
end CrossMath.Pilot77T2

/-! ## Audit surface (charter: every top-level theorem, triad-only expected) -/

#print axioms CrossMath.Pilot77T2.isDegreeBlock_iff_sum_blockProj
#print axioms CrossMath.Pilot77T2.isParityBlock_iff_sum_parityProj
#print axioms CrossMath.Pilot77T2.isParityBlock_of_isDegreeBlock
#print axioms CrossMath.Pilot77T2.isDegreeBlock_sum
#print axioms CrossMath.Pilot77T2.isParityBlock_sum
#print axioms CrossMath.Pilot77T2.pairHamiltonian_isDegreeBlock
#print axioms CrossMath.Pilot77T2.pairHamiltonian_entry_eq_zero
#print axioms CrossMath.Pilot77T2.pairHamiltonian_isParityBlock
