/-
Pilot 41 H3 — the n ≥ 4 TL hunt, S-RUNG: the two-fiber strand-free rank closure
(Theorem C of the precharter): the q = +1 certificates (eth's own table is a permuted
Walsh matrix) + the d ≤ 7 no-go ported to BOTH closed fibers.

Provenance: lane R4 (worktree agent-08), 2026-11-20, under the S-RUNG FIRE ORDER
(coordinator, 2026-11-20; novelty cleared per R9 round-7 `87659f58`). Precharter:
`research/pilots/41/H3-precharter.md` sha256(16) `60278bd4b6e824bf`, §4 §1–§2.
Budget: 3–5 runs at SPEC (hard cap 5). Route: doz CLI, warm app `crossmath-probe`,
mathlib `ff2494ea…` / v4.36.0-rc2.

THE CONTENT (Theorem C, S-part). H2 (tranche 2) proved the σ_q-table at q = −1 to be
the full-rank Walsh table of the invertible form phiQ mod 2 (rows = characters indexed
by the cumsum bijection b(p) = pᵀL), killing every 5-dimensional — TL₃(δ) —
linear-functional realization. This file extends the closure along both axes the
precharter drew:

(1) THE q = +1 FIBER (§2): eth's own σ = the q = +1 fiber of σ_q (phi = phiQ + tau) is
    ALSO a permuted Walsh matrix — rows = characters indexed by a₊(p) = b(p) + c(p)
    over 𝔽₂, c(p) = (p₂p₃, p₁p₃, p₁p₂) the cubic row-gradient (precharter P1; the
    a₊-bijection mechanically cross-checked over all 64 pairs before firing). The
    certificates are the same two raw six-Bool kernel decides as H2's B1/B2 —
    orthogonality ⟨r_p, r_p'⟩ = 8·δ and the 8·-scaled basis expansion — now at
    q = +1, plus the traciality witness σ(100,010) = −σ(010,100) (q = −1's witness
    pair was (100,110), H1). So BOTH closed fibers (δ = −2 and δ = +2) are certified
    nonsingular, |det| = 8⁴ each.

(2) THE STRAND-FREE NO-GO AT d ≤ 7 (§3–§4): the H2 rank obstruction is generalized
    over the factorization index list L (the proof never used d = 5 beyond the EnclOK
    dependence binder) and instantiated at Fin 7 on both fibers: no d ≤ 7-dimensional
    linear-functional realization of EITHER certified table exists. Reading: every
    abstract host of dim ≤ 7 is excluded at both fibers; any TL dictionary needs
    d ≥ 8 — TL₄ (dim 14) is the minimal TL host, with words spanning ≥ 8 dims, outside
    every two-generator subalgebra (dims 4 and 5), under a non-tracial functional
    (the tracial exclusion at q = +1 rides the §2 witness: traciality forces table
    symmetry, the witness breaks it — H1's argument verbatim).

MACHINERY: §0 is the H2 §0 surface VERBATIM (source of record `pilots/41/H2.lean`,
on-disk sha16 `3bc8170121492d18`, fired `9534383949a6ac0c`); §1 re-proves H2's q = −1
certificates verbatim (self-containment + this file's own audit); §3–§4 generalize
H2's lifting and no-go over the row family (pure renames, `sigmaRow` → `row`,
`idx5` → `L`, `sigmaExpand` → the `hexp` binder — each a verified reading of the
GREEN h2-run11 proof).

SUBSTRATE RULES (H2's durable lessons, all honored): kernel decides use INTEGER
arithmetic only (Rat.add/Rat.div extern-opaque on v4.36.0-rc2); no Matrix.mul /
Finset.sum / Matrix.det under decide (literal-list lsum foldrs); 8·-scaled
division-free certificates; EnclOK hypothesis binders carry the pigeonhole
dependence (8 > d ⇒ hdep satisfiable — the note, not the proof obligation).

Kernel-only: no `sorry`, no `native_decide`, no external CAS. This file is a PROOF
artifact (no probe-class markers). Tauceti gate discipline unchanged: statement-binder
class only, NO consumption — imports Mathlib only.

STATUS (2026-11-20, lane R4): fired under the S-rung order; see H3-record + the
h3-s-run* logs for the verdict of record.
-/
import Mathlib

namespace Pilot41H3

/-! ## §0. The shared surface (VERBATIM from H2.lean §0) + literal-list infrastructure -/

abbrev Block : Type := Bool × Bool × Bool

def phiQ (p q : Block) : ℕ :=
  p.1.toNat * q.1.toNat + p.1.toNat * q.2.1.toNat + p.1.toNat * q.2.2.toNat
    + p.2.1.toNat * q.2.1.toNat + p.2.1.toNat * q.2.2.toNat + p.2.2.toNat * q.2.2.toNat

def phi1 (p q : Block) : ℕ := q.1.toNat * p.2.1.toNat * p.2.2.toNat
def phi2 (p q : Block) : ℕ := p.1.toNat * q.2.1.toNat * p.2.2.toNat
def phi3 (p q : Block) : ℕ := p.1.toNat * p.2.1.toNat * q.2.2.toNat

def tau (p q' : Block) : ℕ := phi1 p q' + phi2 p q' + phi3 p q'

def sigmaQ {R : Type*} [CommRing R] (q : Rˣ) (p q' : Block) : R :=
  (-1 : R) ^ phiQ p q' * (-(q : R)) ^ tau p q'

/-- The eight blocks as a literal list (the whole finite universe of the problem). -/
def blocks8 : List Block :=
  [(false, false, false), (true, false, false), (false, true, false), (false, false, true),
   (true, true, false), (true, false, true), (false, true, true), (true, true, true)]

/-- Literal-list sums (deliberately Finset-free: kernel `decide` reduces these). -/
def lsum {α : Type*} (L : List α) (F : α → ℤ) : ℤ := L.foldr (fun b acc => F b + acc) 0

theorem lsum_cons {α : Type*} (b : α) (L : List α) (F : α → ℤ) :
    lsum (b :: L) F = F b + lsum L F := rfl

theorem lsum_congr {α : Type*} (L : List α) (F G : α → ℤ) (h : ∀ b, F b = G b) :
    lsum L F = lsum L G := by
  induction L with
  | nil => rfl
  | cons b t ih => rw [lsum_cons, lsum_cons, h b, ih]

theorem lsum_add {α : Type*} (L : List α) (F G : α → ℤ) :
    lsum L F + lsum L G = lsum L (fun b => F b + G b) := by
  induction L with
  | nil => rfl
  | cons b t ih =>
    rw [lsum_cons, lsum_cons, lsum_cons]
    rw [show F b + lsum t F + (G b + lsum t G) = (F b + G b) + (lsum t F + lsum t G) from by ring, ih]

theorem lsum_smul {α : Type*} (c : ℤ) (L : List α) (F : α → ℤ) :
    c * lsum L F = lsum L (fun b => c * F b) := by
  induction L with
  | nil => exact mul_zero c
  | cons b t ih => rw [lsum_cons, lsum_cons, mul_add, ih]

theorem lsum_zero {α : Type*} (L : List α) : lsum L (fun _ => (0 : ℤ)) = 0 := by
  induction L with
  | nil => rfl
  | cons _ t ih => rw [lsum_cons, ih]; ring

/-- Plain double-sum interchange. -/
theorem lsum_swap {α β : Type*} (L : List α) (M : List β) (F : α → β → ℤ) :
    lsum M (fun b => lsum L (fun a => F a b)) = lsum L (fun a => lsum M (fun b => F a b)) := by
  induction L with
  | nil =>
    rw [lsum_congr M (fun b => lsum ([] : List α) (fun a => F a b)) (fun _ => (0 : ℤ))
      (fun _ => rfl), lsum_zero]
    rfl
  | cons a t ih =>
    rw [lsum_congr M (fun b => lsum (a :: t) (fun a' => F a' b))
      (fun b => F a b + lsum t (fun a' => F a' b)) (fun b => rfl),
      ← lsum_add, ih, lsum_cons]

/-- Weighted interchange: Σ_b (Σ_a F a b) • v b = Σ_a Σ_b (F a b * v b). -/
theorem lsum_right_distrib {α β : Type*} (L : List α) (M : List β)
    (F : α → β → ℤ) (v : β → ℤ) :
    lsum M (fun b => lsum L (fun a => F a b) * v b)
      = lsum L (fun a => lsum M (fun b => F a b * v b)) := by
  induction L with
  | nil =>
    rw [lsum_congr M (fun b => lsum ([] : List α) (fun a => F a b) * v b) (fun _ => (0 : ℤ))
      (fun b => by rw [show lsum ([] : List α) (fun a => F a b) = 0 from rfl, zero_mul]),
      lsum_zero]
    rfl
  | cons a t ih =>
    rw [lsum_congr M (fun b => lsum (a :: t) (fun a' => F a' b) * v b)
      (fun b => F a b * v b + lsum t (fun a' => F a' b) * v b)
      (fun b => by rw [lsum_cons]; ring),
      ← lsum_add, ih, lsum_cons]

/-- The standard basis vectors. -/
def evec (b : Block) : Block → ℤ := fun x => if x = b then (1 : ℤ) else 0

/-! ## §1. The q = −1 fiber certificates (VERBATIM from H2.lean §1) -/

/-- The σ_q table over ℚ specialized at q = −1, as rows (every entry ±1). -/
def sigmaRow (r : Block) : Block → ℤ := fun p' => sigmaQ (-1 : ℤˣ) r p'

/-- Certificate (q = −1 orthogonality), raw form: the eight rows are pairwise
orthogonal 8-vectors of ±1 — ⟨r_p, r_p'⟩ = 8·δ. -/
theorem sigmaOrth_raw : ∀ (a b c d e f : Bool),
    lsum blocks8 (fun x => sigmaRow (a, b, c) x * sigmaRow (d, e, f) x)
      = if (a, b, c) = (d, e, f) then (8 : ℤ) else 0 := by
  decide

theorem sigmaOrth (p q : Block) :
    lsum blocks8 (fun x => sigmaRow p x * sigmaRow q x) = if p = q then (8 : ℤ) else 0 := by
  rcases p with ⟨a, ⟨b, c⟩⟩
  rcases q with ⟨d, ⟨e, f⟩⟩
  exact sigmaOrth_raw a b c d e f

/-- Certificate (q = −1 basis expansion at basis vectors), raw form. -/
theorem sigmaExpand_basis_raw : ∀ (a b c d e f : Bool),
    (8 : ℤ) * evec (a, b, c) (d, e, f)
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaRow p p' * evec (a, b, c) p') * sigmaRow p (d, e, f)) := by
  decide

theorem sigmaExpand_basis (b0 b : Block) :
    (8 : ℤ) * evec b0 b
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p') * sigmaRow p b) := by
  rcases b0 with ⟨a1, ⟨b1, c1⟩⟩
  rcases b with ⟨d1, ⟨e1, f1⟩⟩
  exact sigmaExpand_basis_raw a1 b1 c1 d1 e1 f1

/-! ## §2. The q = +1 fiber certificates (NEW — Theorem C part 1: eth's own table) -/

/-- eth's σ = the q = +1 fiber of σ_q: σ(p,p′) = (−1)^{phi(p,p′)} with
phi = phiQ + tau (`phi_parts : rfl` in the eth/P0 surface). Rows are the characters
of the affine forms a₊(p)·p′ with a₊ = b + c over 𝔽₂ (precharter P1) — a permuted
Walsh matrix. -/
def sigmaOne (p q : Block) : ℤ := (-1 : ℤ) ^ (phiQ p q + tau p q)

/-- **Certificate C1 (q = +1 orthogonality)**, raw form: eth's σ-rows are pairwise
orthogonal 8-vectors of ±1 — the a₊-indexed character table. -/
theorem sigmaOneOrth_raw : ∀ (a b c d e f : Bool),
    lsum blocks8 (fun x => sigmaOne (a, b, c) x * sigmaOne (d, e, f) x)
      = if (a, b, c) = (d, e, f) then (8 : ℤ) else 0 := by
  decide

theorem sigmaOneOrth (p q : Block) :
    lsum blocks8 (fun x => sigmaOne p x * sigmaOne q x) = if p = q then (8 : ℤ) else 0 := by
  rcases p with ⟨a, ⟨b, c⟩⟩
  rcases q with ⟨d, ⟨e, f⟩⟩
  exact sigmaOneOrth_raw a b c d e f

/-- **Certificate C2 (q = +1 basis expansion at basis vectors)**, raw form. -/
theorem sigmaOneExpand_basis_raw : ∀ (a b c d e f : Bool),
    (8 : ℤ) * evec (a, b, c) (d, e, f)
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaOne p p' * evec (a, b, c) p') * sigmaOne p (d, e, f)) := by
  decide

theorem sigmaOneExpand_basis (b0 b : Block) :
    (8 : ℤ) * evec b0 b
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaOne p p' * evec b0 p') * sigmaOne p b) := by
  rcases b0 with ⟨a1, ⟨b1, c1⟩⟩
  rcases b with ⟨d1, ⟨e1, f1⟩⟩
  exact sigmaOneExpand_basis_raw a1 b1 c1 d1 e1 f1

/-- **The q = +1 traciality witness**: the eth table is asymmetric on the pair
((1,0,0),(0,1,0)) — the Thm-A extension witness at this fiber (q = −1's witness pair
was (100,110), H1). Traciality forces table symmetry; the witness breaks it, so any
q = +1 dictionary is necessarily non-tracial, at ANY strand count. -/
theorem sigmaOne_asym_witness :
    sigmaOne (true, false, false) (false, true, false)
      = -sigmaOne (false, true, false) (true, false, false) := by
  decide

/-! ## §3. The evec infrastructure (VERBATIM from H2.lean §2) + the generalized lifting -/

theorem blocks8_mem_raw : ∀ (a b c : Bool), (a, b, c) ∈ blocks8 := by decide

theorem blocks8_mem (b : Block) : b ∈ blocks8 := by
  rcases b with ⟨a1, ⟨b1, c1⟩⟩
  exact blocks8_mem_raw a1 b1 c1

theorem blocks8_nodup : blocks8.Nodup := by decide

theorem lsum_evec_not_mem (v : Block → ℤ) {L : List Block} {b : Block} (hnot : b ∉ L) :
    lsum L (fun b0 => v b0 * evec b0 b) = 0 := by
  induction L with
  | nil => rfl
  | cons h t ih =>
    have hh : h ≠ b := fun hc => hnot (by rw [hc]; exact List.mem_cons_self)
    rw [lsum_cons]
    show v h * (if b = h then (1 : ℤ) else 0) + lsum t (fun b0 => v b0 * evec b0 b) = 0
    rw [if_neg (fun hc => hh hc.symm), mul_zero, zero_add,
      ih (fun hc => hnot (List.mem_cons_of_mem _ hc))]

theorem lsum_evec_eq (v : Block → ℤ) (b : Block) :
    lsum blocks8 (fun b0 => v b0 * evec b0 b) = v b := by
  have key : ∀ (L : List Block), b ∈ L → L.Nodup → lsum L (fun b0 => v b0 * evec b0 b) = v b := by
    intro L
    induction L with
    | nil => intro hmem _; nomatch hmem
    | cons h t ih =>
      intro hmem hnd
      rw [List.nodup_cons] at hnd
      obtain ⟨hnotin, hndt⟩ := hnd
      by_cases hh : h = b
      · subst hh
        rw [lsum_cons]
        show v h * (if h = h then (1 : ℤ) else 0) + lsum t (fun b0 => v b0 * evec b0 h) = v h
        rw [if_pos rfl, mul_one, lsum_evec_not_mem v hnotin]
        ring
      · rw [lsum_cons]
        show v h * (if b = h then (1 : ℤ) else 0) + lsum t (fun b0 => v b0 * evec b0 b) = v b
        rw [if_neg (fun hc => hh hc.symm), mul_zero, zero_add]
        refine ih ?_ hndt
        rw [List.mem_cons] at hmem
        rcases hmem with he | hm
        · exact absurd (he.symm) hh
        · exact hm
  exact key blocks8 (blocks8_mem b) blocks8_nodup

/-- **The expansion theorem, GENERALIZED over the row family** (H2's sigmaExpand with
`sigmaRow` → `row`, `sigmaExpand_basis` → the `hbasis` binder; a verified reading of
the GREEN h2-run11 proof): any certified row family — orthogonal-free, only the
basis-expansion certificate is needed — lifts the 8·-scaled expansion to ALL function
vectors. -/
theorem tableExpand {row : Block → Block → ℤ}
    (hbasis : ∀ b0 b : Block,
      (8 : ℤ) * evec b0 b
        = lsum blocks8 (fun p =>
            lsum blocks8 (fun p' => row p p' * evec b0 p') * row p b))
    (v : Block → ℤ) (b : Block) :
    (8 : ℤ) * v b
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => row p p' * v p') * row p b) := by
  -- Step 1: expand v pointwise under the inner sum; scale out; swap; scale out.
  have hinner : ∀ p : Block,
      lsum blocks8 (fun p' => row p p' * v p')
        = lsum blocks8 (fun b0 => v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p')) := by
    intro p
    have e1 : lsum blocks8 (fun p' => row p p' * v p')
        = lsum blocks8 (fun p' =>
            lsum blocks8 (fun b0 => row p p' * (v b0 * evec b0 p'))) := by
      apply lsum_congr
      intro p'
      rw [← lsum_smul (row p p') blocks8 (fun b0 => v b0 * evec b0 p'),
        lsum_evec_eq v p']
    rw [e1, lsum_swap blocks8 blocks8 (fun a b0 => row p b0 * (v a * evec a b0)),
      lsum_congr blocks8 _ _ (fun a =>
        (lsum_congr blocks8 (fun b => row p b * (v a * evec a b))
          (fun b => v a * (row p b * evec a b)) (fun b => by ring)).trans
        (lsum_smul (v a) blocks8 (fun p' => row p p' * evec a p')).symm)]
  -- Step 2: rewrite every inner sum, regroup, swap the outer pair, scale out, certify.
  rw [lsum_congr blocks8
    (fun p => lsum blocks8 (fun p' => row p p' * v p') * row p b)
    (fun p => lsum blocks8 (fun b0 =>
        v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p')) * row p b)
    (fun p => by rw [hinner p])]
  rw [lsum_congr blocks8
    (fun p => lsum blocks8 (fun b0 =>
        v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p')) * row p b)
    (fun p => lsum blocks8 (fun b0 =>
        (v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p')) * row p b))
    (fun p => by
      rw [mul_comm, lsum_smul (row p b) blocks8
        (fun b0 => v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p'))]
      exact lsum_congr blocks8 _ _ (fun b0 => mul_comm _ _))]
  rw [lsum_swap blocks8 blocks8
    (fun b0 p => (v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p')) * row p b)]
  rw [lsum_congr blocks8
    (fun b0 => lsum blocks8 (fun p =>
        (v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p')) * row p b))
    (fun b0 => v b0 * lsum blocks8 (fun p =>
        lsum blocks8 (fun p' => row p p' * evec b0 p') * row p b))
    (fun b0 => (lsum_congr blocks8
      (fun p => (v b0 * lsum blocks8 (fun p' => row p p' * evec b0 p')) * row p b)
      (fun p => v b0 * (lsum blocks8 (fun p' => row p p' * evec b0 p') * row p b))
      (fun p => by ring)).trans
      (lsum_smul (v b0) blocks8
        (fun p => lsum blocks8 (fun p' => row p p' * evec b0 p') * row p b)).symm)]
  rw [lsum_congr blocks8
    (fun b0 => v b0 * lsum blocks8 (fun p =>
        lsum blocks8 (fun p' => row p p' * evec b0 p') * row p b))
    (fun b0 => v b0 * ((8 : ℤ) * evec b0 b))
    (fun b0 => by rw [hbasis b0 b])]
  rw [lsum_congr blocks8
    (fun b0 => v b0 * ((8 : ℤ) * evec b0 b))
    (fun b0 => (8 : ℤ) * (v b0 * evec b0 b))
    (fun b0 => by ring),
    ← lsum_smul (8 : ℤ) blocks8 (fun b0 => v b0 * evec b0 b), lsum_evec_eq v b]

/-- The q = −1 expansion instance (H2's sigmaExpand, via the general theorem). -/
theorem sigmaExpand (v : Block → ℤ) (b : Block) :
    (8 : ℤ) * v b
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaRow p p' * v p') * sigmaRow p b) :=
  tableExpand sigmaExpand_basis v b

/-- The q = +1 expansion instance (NEW). -/
theorem sigmaOneExpand (v : Block → ℤ) (b : Block) :
    (8 : ℤ) * v b
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaOne p p' * v p') * sigmaOne p b) :=
  tableExpand sigmaOneExpand_basis v b

/-! ## §4. The strand-free rank no-go (H2's Thm B generalized over the index list,
     instantiated at Fin 7 on BOTH closed fibers) -/

/-- A literal index list for the 7-dimensional side. -/
def idx7 : List (Fin 7) := [0, 1, 2, 3, 4, 5, 6]

/-- **THE GENERALIZED RANK OBSTRUCTION** (H2's rank_obstruction_nogo with `idx5` → `L`,
`sigmaRow` → `row`, `sigmaExpand` → the `hexp` binder; a verified reading of the GREEN
h2-run11 proof): no linear-functional realization of a full-rank-8 table through a
factorization whose word-coefficient columns are annihilated by a nonzero v (the EnclOK
`hdep` binder — satisfiable whenever 8 > d word vectors live in dimension d, by
pigeonhole; carried explicit per the statement-binder discipline). -/
theorem table_rank_nogo {α : Type*} (L : List α) (row : Block → Block → ℤ)
    (C : Block → α → ℤ) (Φ : α → α → ℤ) (v : Block → ℤ) (hv : v ≠ 0)
    (hdep : ∀ j, lsum blocks8 (fun p => C p j * v p) = 0)
    (hreal : ∀ p p' : Block,
      row p p' = lsum L (fun i => lsum L (fun j => C p i * Φ i j * C p' j)))
    (hexp : ∀ (w : Block → ℤ) (b : Block),
      (8 : ℤ) * w b
        = lsum blocks8 (fun p => lsum blocks8 (fun p' => row p p' * w p') * row p b)) :
    False := by
  -- Every row contraction with v vanishes:
  have hcon : ∀ p, lsum blocks8 (fun p' => row p p' * v p') = 0 := by
    intro p
    rw [lsum_congr blocks8 (fun p' => row p p' * v p')
      (fun p' => lsum L (fun i => lsum L (fun j => C p i * Φ i j * C p' j)) * v p')
      (fun p' => by rw [hreal p p'])]
    rw [lsum_right_distrib L blocks8 (fun i p' => lsum L (fun j => C p i * Φ i j * C p' j)) v]
    rw [lsum_congr L
      (fun i => lsum blocks8 (fun p' => lsum L (fun j => C p i * Φ i j * C p' j) * v p'))
      (fun i => lsum L (fun j => lsum blocks8 (fun p' => C p i * Φ i j * C p' j * v p')))
      (fun i => lsum_right_distrib L blocks8 (fun j p' => C p i * Φ i j * C p' j) v)]
    rw [lsum_congr L
      (fun i => lsum L (fun j => lsum blocks8 (fun p' => C p i * Φ i j * C p' j * v p')))
      (fun i => lsum L (fun j => C p i * Φ i j * lsum blocks8 (fun p' => C p' j * v p')))
      (fun i => lsum_congr L _ _ (fun j =>
        (lsum_congr blocks8 (fun p' => C p i * Φ i j * C p' j * v p')
          (fun p' => C p i * Φ i j * (C p' j * v p')) (fun p' => by ring)).trans
        (lsum_smul (C p i * Φ i j) blocks8 (fun p' => C p' j * v p')).symm))]
    rw [lsum_congr L
      (fun i => lsum L (fun j => C p i * Φ i j * lsum blocks8 (fun p' => C p' j * v p')))
      (fun i => lsum L (fun j => C p i * Φ i j * 0))
      (fun i => lsum_congr L _ _ (fun j => by rw [hdep j]))]
    rw [lsum_congr L _ (fun _ => (0 : ℤ))
      (fun i => by rw [lsum_congr L _ (fun _ => (0 : ℤ))
          (fun j => mul_zero (C p i * Φ i j)),
        lsum_zero]),
      lsum_zero]
  -- ... but the expansion theorem then forces v = 0:
  have hvb : ∀ b, v b = 0 := by
    intro b
    have h := hexp v b
    rw [lsum_congr blocks8
      (fun p => lsum blocks8 (fun p' => row p p' * v p') * row p b)
      (fun _ => (0 : ℤ))
      (fun p => by rw [hcon p, zero_mul]),
      lsum_zero] at h
    rcases mul_eq_zero.mp h with h1 | h2
    · exact absurd h1 (by norm_num : ¬(8 : ℤ) = 0)
    · exact h2
  exact hv (funext hvb)

/-- **Theorem C, q = −1 instance**: no 7-dimensional linear-functional realization of
the specialized σ-table. (d ≤ 7 covers every abstract host below the rank-8 threshold;
TL₃(δ) at d = 5 was H2's Theorem B.) -/
theorem no_realization_dim7 (C : Block → Fin 7 → ℤ) (Φ : Fin 7 → Fin 7 → ℤ)
    (v : Block → ℤ) (hv : v ≠ 0)
    (hdep : ∀ j, lsum blocks8 (fun p => C p j * v p) = 0)
    (hreal : ∀ p p' : Block,
      sigmaRow p p' = lsum idx7 (fun i => lsum idx7 (fun j => C p i * Φ i j * C p' j))) :
    False :=
  table_rank_nogo idx7 sigmaRow C Φ v hv hdep hreal sigmaExpand

/-- **Theorem C, q = +1 instance**: no 7-dimensional linear-functional realization of
eth's own σ-table — the eth-side closure (the deformation's classical fiber is exactly
as Walsh-rigid as the deformed one). -/
theorem no_realization_dim7_one (C : Block → Fin 7 → ℤ) (Φ : Fin 7 → Fin 7 → ℤ)
    (v : Block → ℤ) (hv : v ≠ 0)
    (hdep : ∀ j, lsum blocks8 (fun p => C p j * v p) = 0)
    (hreal : ∀ p p' : Block,
      sigmaOne p p' = lsum idx7 (fun i => lsum idx7 (fun j => C p i * Φ i j * C p' j))) :
    False :=
  table_rank_nogo idx7 sigmaOne C Φ v hv hdep hreal sigmaOneExpand

/-! ## §5. Statement skeleton (precharter §4 §3 tier — abstract host form; the
     literal hosts A14 / spin are the M-rung). A dictionary on ANY host: words + a
     ℤ-linear functional hitting the table on all 64 pairs. -/

def DictionaryOn (H : Type*) [Mul H] [AddCommGroup H] [Module ℤ H]
    (M : Block → Block → ℤ) : Prop :=
  ∃ (w : Block → H) (φ : H →ₗ[ℤ] ℤ), ∀ p p' : Block, φ (w p * w p') = M p p'

#check @DictionaryOn

/-! ## Audit -/

#print axioms sigmaOrth
#print axioms sigmaExpand_basis
#print axioms sigmaOneOrth
#print axioms sigmaOneExpand_basis
#print axioms sigmaOne_asym_witness
#print axioms tableExpand
#print axioms sigmaExpand
#print axioms sigmaOneExpand
#print axioms table_rank_nogo
#print axioms no_realization_dim7
#print axioms no_realization_dim7_one

end Pilot41H3
