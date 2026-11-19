/-
Pilot 41 H2 — (H) tranche 2: the RANK OBSTRUCTION — the 3-strand Temperley–Lieb
dictionary is IMPOSSIBLE for ANY linear functional (not just traces).

Provenance: lane R4, unit 5, 2026-11-19, under the (H) promotion ruling (tranche-2 GO).
Tranche 1 (H1.lean, GREEN, sha 283503ada8f5571e) killed the TRACIAL dictionaries
(`tracial_realizability_refuted`). This tranche kills the rest of the 3-strand tier.

THE OBSTRUCTION. At q = −1 the σ_q-table specializes to M₀[p][p′] = (−1)^{phiQ(p,p′)}
(since (−q)^τ = 1), the character table of the ℤ₂-bilinear form phiQ mod 2 — whose
matrix L = [[1,1,1],[0,1,1],[0,0,1]] is invertible over 𝔽₂. Walsh orthogonality on
(ℤ₂)³ makes the eight rows an orthogonal basis: ⟨r_p, r_p'⟩ = 8·δ (§1 Certificate 1,
kernel decide, division-free) and 8·e_{b₀} = Σ_p ⟨r_p, e_{b₀}⟩ r_p (§1 Certificate 2),
lifted to all vectors by linearity (§2). But ANY realization σ(p,p′) = ϕ(w_p · w_p′)
in a 5-dimensional algebra (TL₃(δ) has dimension Catalan₃ = 5) with ϕ linear factors
the table through an 8×5 word-coefficient matrix C in the C·Φ·Cᵀ form (§3) — and any
8 > 5 word family is linearly dependent (the EnclOK binder `hdep`: a nonzero v with
Σ_p C p j • v p = 0 ∀ j), which kills every row contraction — while the expansion
theorem forces v = 0. Contradiction (`rank_obstruction_nogo`).

CONSEQUENCE (the (H) dictionary revision): a Temperley–Lieb realization of the
q-deformed Graves sign needs dim ≥ 8, i.e. n ≥ 4 strands (TL₄ has dimension
Catalan₄ = 14 ≥ 8); the dossier's 3-strand scope ([HYPOTHESIS], "dimension of
TL_3(δ) = 5") is closed NEGATIVE. Genericity (prose, tranche 3): det M(q) ∈ ℤ[q] is
nonzero (its q = −1 value is §1's), so the obstruction holds at every q₀ with
det M(q₀) ≠ 0 — all but finitely many q.

Tauceti gate discipline (unchanged): statement-binder class only, NO consumption —
this file imports Mathlib only and builds its finite data itself. The five donors
cited verbatim as before: TauCeti/KnotTheory/TemperleyLieb.lean:87 (jonesDelta),
:146 (jones), :157 (jonesUnit/jones_sigma), KnotTheory/Hecke.lean:49
(MarkovBraid.eq_heckeTrace_of_skein), QuantumGroups/UqSl2/QuantumTrace.lean:41
(trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp). On-tauceti-pin `#print axioms` stays
deferred to any actual-import tranche.

Elaboration notes (this file's runs 1–4, recorded for future lanes): kernel `decide`
does NOT whnf through Matrix.mul / Finset.sum / determinant machinery on this setup
(reproducible stalls, runs 2 and 4), and `Rat.div` is extern-opaque to the kernel, so
decide-checked propositions must avoid ℚ arithmetic (Rat ops are extern-opaque to the
kernel on this toolchain — `Rat.add` included, run 5's lesson: even `0 + 0` at ℚ stalls). Hence the fully self-contained
design below: literal-list `lsum` foldrs (no Finset, no Matrix namespace), ±1 entries,
division-free certificates (the 8· forms); all field arithmetic outside decides.

Kernel-only: no `sorry`, no `native_decide`, no external CAS. The 8 > 5 linear
dependence is carried as the EnclOK binder `hdep` (hypothesis-binder convention).

STATUS (2026-11-19, lane R4): **GREEN at h2-run 11** (the unit-7 granted confirm;
these bytes, sha256-16 9534383949a6ac0c): 0 errors, 0 sorry. TRANCHE-2 COMPLETE —
the full obstruction theorem is kernel-proved: sigmaOrth / sigmaExpand_basis
[propext], sigmaExpand / rank_obstruction_nogo [propext, Classical.choice,
Quot.sound]. Run history: h2-1..8 (design iterations — see the elaboration notes),
h2-9 (sigmaExpand GREEN), h2-10 (2 congr-errors from GREEN), h2-11 (GREEN).
Per the tranche-3 BANK-AS-NEGATIVE ruling (orchestrator, 2026-11-19): the (H)
program ships as the second-discovery NEGATIVE-kind result — traciality obstruction
(H1.lean) + rank obstruction (this file) + the corrected-surface transports
(H1.lean) close the dossier's 3-strand hypothesis NEGATIVE; the n≥4 (TL₄, dim 14)
non-tracial hunt is DEFERRED to the next-wave charter as a named candidate
(scope seed in H-record.md).
-/
import Mathlib

namespace Pilot41H2

/-! ## §0. Minimal surface (verbatim from Core.lean §0) + literal-list infrastructure -/

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

/-- A literal index list for the 5-dimensional side. -/
def idx5 : List (Fin 5) := [0, 1, 2, 3, 4]

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

/-! ## §1. The specialized table: Walsh certificates (kernel decide, division-free) -/

/-- The σ_q table over ℚ specialized at q = −1, as rows (every entry ±1). -/
def sigmaRow (r : Block) : Block → ℤ := fun p' => sigmaQ (-1 : ℤˣ) r p'

/-- The standard basis vectors. -/
def evec (b : Block) : Block → ℤ := fun x => if x = b then (1 : ℤ) else 0

/-- **Certificate 1 (orthogonality)**, raw form: the eight rows are pairwise
orthogonal 8-vectors of ±1 — ⟨r_p, r_{p'}⟩ = 8·δ. -/
theorem sigmaOrth_raw : ∀ (a b c d e f : Bool),
    lsum blocks8 (fun x => sigmaRow (a, b, c) x * sigmaRow (d, e, f) x)
      = if (a, b, c) = (d, e, f) then (8 : ℤ) else 0 := by
  decide

theorem sigmaOrth (p q : Block) :
    lsum blocks8 (fun x => sigmaRow p x * sigmaRow q x) = if p = q then (8 : ℤ) else 0 := by
  rcases p with ⟨a, ⟨b, c⟩⟩
  rcases q with ⟨d, ⟨e, f⟩⟩
  exact sigmaOrth_raw a b c d e f

/-- **Certificate 2 (basis expansion at basis vectors)**, raw form: on each standard
basis vector e_{b₀}, 8 • e_{b₀} = Σ_p ⟨r_p, e_{b₀}⟩ r_p. -/
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

/-! ## §2. Lifting the expansion to all function vectors (linearity) -/

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

/-- **The expansion theorem** (lifted): every function vector satisfies
8 • v = Σ_p ⟨r_p, v⟩ r_p — the rows form an orthogonal basis of the function space. -/
theorem sigmaExpand (v : Block → ℤ) (b : Block) :
    (8 : ℤ) * v b
      = lsum blocks8 (fun p =>
          lsum blocks8 (fun p' => sigmaRow p p' * v p') * sigmaRow p b) := by
  -- Step 1: expand v pointwise under the inner sum; scale out; swap; scale out.
  have hinner : ∀ p : Block,
      lsum blocks8 (fun p' => sigmaRow p p' * v p')
        = lsum blocks8 (fun b0 => v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p')) := by
    intro p
    have e1 : lsum blocks8 (fun p' => sigmaRow p p' * v p')
        = lsum blocks8 (fun p' =>
            lsum blocks8 (fun b0 => sigmaRow p p' * (v b0 * evec b0 p'))) := by
      apply lsum_congr
      intro p'
      rw [← lsum_smul (sigmaRow p p') blocks8 (fun b0 => v b0 * evec b0 p'),
        lsum_evec_eq v p']
    rw [e1, lsum_swap blocks8 blocks8 (fun a b0 => sigmaRow p b0 * (v a * evec a b0)),
      lsum_congr blocks8 _ _ (fun a =>
        (lsum_congr blocks8 (fun b => sigmaRow p b * (v a * evec a b))
          (fun b => v a * (sigmaRow p b * evec a b)) (fun b => by ring)).trans
        (lsum_smul (v a) blocks8 (fun p' => sigmaRow p p' * evec a p')).symm)]
  -- Step 2: rewrite every inner sum, regroup, swap the outer pair, scale out, certify.
  rw [lsum_congr blocks8
    (fun p => lsum blocks8 (fun p' => sigmaRow p p' * v p') * sigmaRow p b)
    (fun p => lsum blocks8 (fun b0 =>
        v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p')) * sigmaRow p b)
    (fun p => by rw [hinner p])]
  rw [lsum_congr blocks8
    (fun p => lsum blocks8 (fun b0 =>
        v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p')) * sigmaRow p b)
    (fun p => lsum blocks8 (fun b0 =>
        (v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p')) * sigmaRow p b))
    (fun p => by
      rw [mul_comm, lsum_smul (sigmaRow p b) blocks8
        (fun b0 => v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p'))]
      exact lsum_congr blocks8 _ _ (fun b0 => mul_comm _ _))]
  rw [lsum_swap blocks8 blocks8
    (fun b0 p => (v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p')) * sigmaRow p b)]
  rw [lsum_congr blocks8
    (fun b0 => lsum blocks8 (fun p =>
        (v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p')) * sigmaRow p b))
    (fun b0 => v b0 * lsum blocks8 (fun p =>
        lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p') * sigmaRow p b))
    (fun b0 => (lsum_congr blocks8
      (fun p => (v b0 * lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p')) * sigmaRow p b)
      (fun p => v b0 * (lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p') * sigmaRow p b))
      (fun p => by ring)).trans
      (lsum_smul (v b0) blocks8
        (fun p => lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p') * sigmaRow p b)).symm)]
  rw [lsum_congr blocks8
    (fun b0 => v b0 * lsum blocks8 (fun p =>
        lsum blocks8 (fun p' => sigmaRow p p' * evec b0 p') * sigmaRow p b))
    (fun b0 => v b0 * ((8 : ℤ) * evec b0 b))
    (fun b0 => by rw [sigmaExpand_basis b0 b])]
  rw [lsum_congr blocks8
    (fun b0 => v b0 * ((8 : ℤ) * evec b0 b))
    (fun b0 => (8 : ℤ) * (v b0 * evec b0 b))
    (fun b0 => by ring),
    ← lsum_smul (8 : ℤ) blocks8 (fun b0 => v b0 * evec b0 b), lsum_evec_eq v b]

/-! ## §3. THE RANK OBSTRUCTION: no 5-dimensional realization of the table -/

/-- **THE RANK OBSTRUCTION.** No linear-functional realization of the specialized
σ-table through a 5-dimensional algebra: if σ(p,p′) = ϕ(w_p · w_p′) with words in a
5-dim space (word coefficients C p i, evaluation matrix Φ i j — the C·Φ·Cᵀ factor-
ization every linear-functional realization yields), and the 8 > 5 word family is
linearly dependent (the EnclOK binder `hdep`: a nonzero v with Σ_p C p j • v p = 0
for all j), then every row contraction Σ_{p'} σ(p,p′) v p' vanishes — while §2's
expansion theorem forces v = 0. Contradiction.

Reading: TL₃(δ) has dimension 5 (Catalan₃), so EVERY 3-strand Temperley–Lieb
dictionary for σ_q — tracial or not, any functional, any words — collapses to a
singular table, while the σ-table has full rank 8. The 3-strand tier of the (H)
hypothesis is IMPOSSIBLE. -/
theorem rank_obstruction_nogo (C : Block → Fin 5 → ℤ) (Φ : Fin 5 → Fin 5 → ℤ)
    (v : Block → ℤ) (hv : v ≠ 0)
    (hdep : ∀ j, lsum blocks8 (fun p => C p j * v p) = 0)
    (hreal : ∀ p p' : Block,
      sigmaRow p p' = lsum idx5 (fun i => lsum idx5 (fun j => C p i * Φ i j * C p' j))) :
    False := by
  -- Every row contraction with v vanishes:
  have hcon : ∀ p, lsum blocks8 (fun p' => sigmaRow p p' * v p') = 0 := by
    intro p
    rw [lsum_congr blocks8 (fun p' => sigmaRow p p' * v p')
      (fun p' => lsum idx5 (fun i => lsum idx5 (fun j => C p i * Φ i j * C p' j)) * v p')
      (fun p' => by rw [hreal p p'])]
    rw [lsum_right_distrib idx5 blocks8 (fun i p' => lsum idx5 (fun j => C p i * Φ i j * C p' j)) v]
    rw [lsum_congr idx5
      (fun i => lsum blocks8 (fun p' => lsum idx5 (fun j => C p i * Φ i j * C p' j) * v p'))
      (fun i => lsum idx5 (fun j => lsum blocks8 (fun p' => C p i * Φ i j * C p' j * v p')))
      (fun i => lsum_right_distrib idx5 blocks8 (fun j p' => C p i * Φ i j * C p' j) v)]
    rw [lsum_congr idx5
      (fun i => lsum idx5 (fun j => lsum blocks8 (fun p' => C p i * Φ i j * C p' j * v p')))
      (fun i => lsum idx5 (fun j => C p i * Φ i j * lsum blocks8 (fun p' => C p' j * v p')))
      (fun i => lsum_congr idx5 _ _ (fun j =>
        (lsum_congr blocks8 (fun p' => C p i * Φ i j * C p' j * v p')
          (fun p' => C p i * Φ i j * (C p' j * v p')) (fun p' => by ring)).trans
        (lsum_smul (C p i * Φ i j) blocks8 (fun p' => C p' j * v p')).symm))]
    rw [lsum_congr idx5
      (fun i => lsum idx5 (fun j => C p i * Φ i j * lsum blocks8 (fun p' => C p' j * v p')))
      (fun i => lsum idx5 (fun j => C p i * Φ i j * 0))
      (fun i => lsum_congr idx5 _ _ (fun j => by rw [hdep j]))]
    rw [lsum_congr idx5 _ (fun _ => (0 : ℤ))
      (fun i => by rw [lsum_congr idx5 _ (fun _ => (0 : ℤ))
          (fun j => mul_zero (C p i * Φ i j)),
        lsum_zero]),
      lsum_zero]
  -- ... but the expansion theorem then forces v = 0:
  have hvb : ∀ b, v b = 0 := by
    intro b
    have h := sigmaExpand v b
    rw [lsum_congr blocks8
      (fun p => lsum blocks8 (fun p' => sigmaRow p p' * v p') * sigmaRow p b)
      (fun _ => (0 : ℤ))
      (fun p => by rw [hcon p, zero_mul]),
      lsum_zero] at h
    rcases mul_eq_zero.mp h with h1 | h2
    · exact absurd h1 (by norm_num : ¬(8 : ℤ) = 0)
    · exact h2
  exact hv (funext hvb)

/-! ## §4. Consequences (comment tier)

1. STRAND REVISION: any TL-dictionary for σ_q needs dim ≥ 8 ⟹ n ≥ 4 strands
   (Catalan₄ = 14). The dossier's 3-strand [HYPOTHESIS] is closed NEGATIVE.
2. GENERICITY: det M(q) ∈ ℤ[q] is nonzero (its q = −1 value follows from §1), so the
   obstruction holds at every q₀ with det M(q₀) ≠ 0 — all but finitely many q;
   certifying further explicit fibers (e.g. q = 1) is one decide each.
3. The tranche-1 traciality obstruction (H1.lean) is a COROLLARY-CLASS special case
   of the dimension story — kept separate since its statement form differs.
-/

#print axioms sigmaOrth
#print axioms sigmaExpand_basis
#print axioms sigmaExpand
#print axioms rank_obstruction_nogo

end Pilot41H2
