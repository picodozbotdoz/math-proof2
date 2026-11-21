/-
Pilot 41-H4 — the n ≥ 4 hunt, run 1: Thm E1 (the d = 8 uniform-diagonal-κ
monomial-host no-go, both fibers) + the statement surface of record for the
open arms (E2/F/G Props).

FIRE PROVENANCE: lane R4 (worktree agent-08), 2026-11-21, under the E1 FIRE
GRANT (orchestrator, conditions as stated: self-contained file — H3.lean
untouched, its 16-helper custody rider stays untriggered; E1 scope only; ≤ 3
fires). Basis: H4-precharter.md §3 run-1 (the probe-certified statements of
H4-probe.lean bef92692230690f5, elaborated GREEN at h4-probe-run1.log). Zero
`sorry`, zero `native_decide`, Mathlib-only imports, decide discipline per the
H2/H3 substrate rules. The open arms (E2/F data, G's L-rung) are Props only —
BANKED to iter-7 per the landing ruling at 5c7fac7.
-/
import Mathlib

namespace Pilot41H4

/-! ## §0. The shared surface (VERBATIM-class from H3.lean §0, itself from H2) -/

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

/-- The q = -1 fiber rows (H2/H3's certified table). -/
def sigmaRow (r : Block) : Block → ℤ := fun p' => sigmaQ (-1 : ℤˣ) r p'

/-- The q = +1 fiber rows (eth's own table; H3's certified table). -/
def sigmaOne (r : Block) : Block → ℤ := fun p' => (-1 : ℤ) ^ (phiQ r p' + tau r p')

/-- The eight blocks as a literal list (the whole finite universe of the problem). -/
def blocks8 : List Block :=
  [(false, false, false), (true, false, false), (false, true, false), (false, false, true),
   (true, true, false), (true, false, true), (false, true, true), (true, true, true)]

/-- Literal-list sums (deliberately Finset-free: kernel `decide` reduces these). -/
def lsum {α : Type*} (L : List α) (F : α → ℤ) : ℤ := L.foldr (fun b acc => F b + acc) 0

/-! ## §1. Thm E1 — the d = 8 uniform-diagonal-κ monomial-host no-go.
A host whose eight word-vectors multiply by uniform left (resp. right)
diagonal structure constants carries no dictionary for a zero-free table
with a nonvanishing 2×2 minor: associativity + the dictionary equations
force the table rank-one; the certified fibers are not. -/

/-- A nonvanishing 2×2 minor: the table is not rank-one (not an outer
    product f ⊗ T). Both certified fibers satisfy this — their certified
    asymmetry pairs are witnesses. -/
def NonRankOne (M : Block → Block → ℤ) : Prop :=
  ∃ a b c d : Block, M a c * M b d - M a d * M b c ≠ 0

/-- E1, left-diagonal form, table-free: for any zero-free, non-rank-one
    table, no ring host with torsion-free word-vectors and uniform left
    structure constants realizes it (hmul: κ = p on every pair).
    The scalar-through-product steps use the canonical ℤ-algebra structure
    of a Ring (Ring.toIntAlgebra): `Algebra.mul_smul_comm` /
    `Algebra.smul_mul_assoc` — the decoded mul ↔ zsmul class. -/
theorem table_diagLeft_nogo {M : Block → Block → ℤ}
    (hnz : ∀ p q, M p q ≠ 0) (hnr : NonRankOne M)
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u p)
    (hdict : ∀ p q, φ (u p * u q) = M p q) :
    False := by
  -- The dictionary equations, scalar form: M p q = S p q * φ (u p); S never 0.
  have fM : ∀ p q : Block, S p q * φ (u p) = M p q := by
    intro p q
    rw [← hdict p q, hmul p q, map_zsmul, smul_eq_mul]
  have Sne : ∀ p q : Block, S p q ≠ 0 := by
    intro p q h
    exact hnz p q (by rw [← fM p q, h, zero_mul])
  -- Associativity forces S's FIRST index irrelevant: S y z = S x z.
  have key : ∀ x y z : Block, S y z = S x z := by
    intro x y z
    have h1 : u x * (u y * u z) = (S y z * S x y) • u x := by
      rw [hmul y z, Algebra.mul_smul_comm, hmul x y, ← mul_smul]
    have h2 : (u x * u y) * u z = (S x y * S x z) • u x := by
      rw [hmul x y, Algebra.smul_mul_assoc, hmul x z, ← mul_smul]
    have hA : (S y z * S x y) • u x = (S x y * S x z) • u x := by
      rw [← h1, ← h2, mul_assoc]
    have hZ : (S y z * S x y - S x y * S x z) • u x = 0 := by
      rw [sub_smul, hA, sub_self]
    have hEq0 : S y z * S x y = S x y * S x z := sub_eq_zero.mp (htf x _ hZ)
    exact Int.eq_of_mul_eq_mul_right (Sne x y) (by rw [mul_comm (S x z) (S x y)]; exact hEq0)
  -- Hence M factors column-wise: M x y = S z y * φ (u x) for ANY z — rank one.
  obtain ⟨a, b, c, d, hne⟩ := hnr
  exact hne (by
    have Mcol : ∀ x y z : Block, M x y = S z y * φ (u x) := by
      intro x y z
      rw [← fM x y, key z x y]
    rw [Mcol a c b, Mcol b d b, Mcol a d b, Mcol b c b]
    ring)

/-- E1, right-diagonal form, table-free: the mirror (κ = q on every pair);
    associativity forces S's SECOND index irrelevant, M factors row-wise —
    rank one — same kill. -/
theorem table_diagRight_nogo {M : Block → Block → ℤ}
    (hnz : ∀ p q, M p q ≠ 0) (hnr : NonRankOne M)
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u q)
    (hdict : ∀ p q, φ (u p * u q) = M p q) :
    False := by
  have fM : ∀ p q : Block, S p q * φ (u q) = M p q := by
    intro p q
    rw [← hdict p q, hmul p q, map_zsmul, smul_eq_mul]
  have Sne : ∀ p q : Block, S p q ≠ 0 := by
    intro p q h
    exact hnz p q (by rw [← fM p q, h, zero_mul])
  -- Associativity forces S's SECOND index irrelevant: S x z = S x y.
  have key : ∀ x y z : Block, S x z = S x y := by
    intro x y z
    have h1 : u x * (u y * u z) = (S y z * S x z) • u z := by
      rw [hmul y z, Algebra.mul_smul_comm, hmul x z, ← mul_smul]
    have h2 : (u x * u y) * u z = (S x y * S y z) • u z := by
      rw [hmul x y, Algebra.smul_mul_assoc, hmul y z, ← mul_smul]
    have hA : (S y z * S x z) • u z = (S x y * S y z) • u z := by
      rw [← h1, ← h2, mul_assoc]
    have hZ : (S y z * S x z - S x y * S y z) • u z = 0 := by
      rw [sub_smul, hA, sub_self]
    have hEq0 : S y z * S x z = S x y * S y z := sub_eq_zero.mp (htf z _ hZ)
    exact Int.eq_of_mul_eq_mul_right (Sne y z) (by rw [mul_comm (S x z) (S y z)]; exact hEq0)
  -- M factors row-wise: M x y = S x z * φ (u y) for ANY z — rank one.
  obtain ⟨a, b, c, d, hne⟩ := hnr
  exact hne (by
    have Mrow : ∀ x y z : Block, M x y = S x z * φ (u y) := by
      intro x y z
      rw [← fM x y, key x z y]
    rw [Mrow a c b, Mrow b d b, Mrow a d b, Mrow b c b]
    ring)

/-- The certified fibers' minor witnesses (kernel decides): rows = the
    certified asymmetry pairs, cols the same pair — the minor is
    σ(a,a)σ(b,b) − σ(a,b)σ(b,a) = 1 − (−1) = 2 ≠ 0. -/
theorem sigmaRow_nonRankOne : NonRankOne sigmaRow :=
  ⟨(true, false, false), (true, true, false),
    (true, false, false), (true, true, false), by decide⟩

theorem sigmaOne_nonRankOne : NonRankOne sigmaOne :=
  ⟨(true, false, false), (false, true, false),
    (true, false, false), (false, true, false), by decide⟩

/-- The certified fibers are zero-free (entries ±1; kernel decides). -/
theorem sigmaRow_zero_free : ∀ p q : Block, sigmaRow p q ≠ 0 := by decide

theorem sigmaOne_zero_free : ∀ p q : Block, sigmaOne p q ≠ 0 := by decide

/-- E1 final form, q = −1 fiber, left-diagonal hosts. -/
theorem no_diagLeft_dim8_sigmaRow
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u p)
    (hdict : ∀ p q, φ (u p * u q) = sigmaRow p q) :
    False :=
  table_diagLeft_nogo sigmaRow_zero_free sigmaRow_nonRankOne φ u S htf hmul hdict

/-- E1 final form, q = −1 fiber, right-diagonal hosts. -/
theorem no_diagRight_dim8_sigmaRow
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u q)
    (hdict : ∀ p q, φ (u p * u q) = sigmaRow p q) :
    False :=
  table_diagRight_nogo sigmaRow_zero_free sigmaRow_nonRankOne φ u S htf hmul hdict

/-- E1 final form, q = +1 fiber, left-diagonal hosts. -/
theorem no_diagLeft_dim8_sigmaOne
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u p)
    (hdict : ∀ p q, φ (u p * u q) = sigmaOne p q) :
    False :=
  table_diagLeft_nogo sigmaOne_zero_free sigmaOne_nonRankOne φ u S htf hmul hdict

/-- E1 final form, q = +1 fiber, right-diagonal hosts. -/
theorem no_diagRight_dim8_sigmaOne
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u q)
    (hdict : ∀ p q, φ (u p * u q) = sigmaOne p q) :
    False :=
  table_diagRight_nogo sigmaOne_zero_free sigmaOne_nonRankOne φ u S htf hmul hdict

/-! ## §2. Thm E2 (OPEN arm; Props only, NO verdict claimed — banked to
iter-7 behind the constraint-propagation pre-solve) — the d = 8
structure-constant tier: is either certified table the φ-Gram table of an
8-dimensional associative multiplication with the words as a basis? The
uniform diagonals die by E1 above; MIXED κ and general structure constants
stay open. The semigroup sub-class (S ≡ 1) is the "evaluation table"
question. -/

/-- The d = 8 basis-tier question: do associative structure constants N and a
    functional f solve Σ_r N(b,c;r)·N(a,r;d) = Σ_r N(a,b;r)·N(r,c;d) (assoc)
    and Σ_r N(p,q;r)·f r = M p q (dictionary) for the certified table M? -/
def StructureConstantDictionary (M : Block → Block → ℤ) : Prop :=
  ∃ (N : Block → Block → Block → ℤ) (f : Block → ℤ),
    (∀ a b c d : Block,
      lsum blocks8 (fun r => N b c r * N a r d)
        = lsum blocks8 (fun r => N a b r * N r c d))
    ∧ (∀ p q : Block, lsum blocks8 (fun r => N p q r * f r) = M p q)

/-- The semigroup-algebra sub-class: M(p,q) = f(κ(p,q)) for an associative
    κ on the eight points (S ≡ 1 monomial hosts: semigroup algebras —
    group algebras included; also the MIXED-κ monomial hosts). -/
def SemigroupEvaluationTable (M : Block → Block → ℤ) : Prop :=
  ∃ (κ : Block → Block → Block) (f : Block → ℤ),
    (∀ a b c : Block, κ a (κ b c) = κ (κ a b) c)
    ∧ (∀ p q : Block, f (κ p q) = M p q)

/-- The open-question instances (deliberately unstated as theorems: no
    verdict is claimed; the iter-7 pre-solve is the gate). -/
def diagonal8_open_questions : Prop :=
  StructureConstantDictionary sigmaRow ∨ StructureConstantDictionary sigmaOne
  ∨ SemigroupEvaluationTable sigmaRow ∨ SemigroupEvaluationTable sigmaOne

#check @StructureConstantDictionary
#check @SemigroupEvaluationTable
#check @diagonal8_open_questions

/-! ## §3. Thm F (POSITIVE arm; the certificate shape + the pullback, both
elaborated; the DATA hunt banked to iter-7) — the d = 14 combination-word
dictionary certificate shape (article-41H3 §7's open core). -/

def idx14 : List (Fin 14) := List.finRange 14

/-- Vector-valued literal sums (the §0 `lsum` lifted to any AddCommGroup;
    same Finset-free foldr shape). -/
def lsumV {α : Type*} {H : Type*} [AddCommGroup H] (L : List α) (F : α → H) : H :=
  L.foldr (fun b acc => F b + acc) 0

/-- The combination-tier certificate shape: M(p,q) = Σ_{k,l} W p k · W q l ·
    (Σ_r T k l r · f r) with T associative. Instantiating T at the spin
    host's word-algebra constants is the iter-7 hunt's first move
    (binder-or-cite for the classical dim-14 fact; the constants themselves
    are mechanical certificate data). -/
def CombinationDictionary (M : Block → Block → ℤ) : Prop :=
  ∃ (T : Fin 14 → Fin 14 → Fin 14 → ℤ) (W : Block → Fin 14 → ℤ) (f : Fin 14 → ℤ),
    (∀ a b c d : Fin 14,
      lsum idx14 (fun r => T b c r * T a r d)
        = lsum idx14 (fun r => T a b r * T r c d))
    ∧ (∀ p q : Block,
      lsum idx14 (fun k => lsum idx14 (fun l =>
        W p k * W q l * lsum idx14 (fun r => T k l r * f r))) = M p q)

/-- The pullback conditional (EnclOK form, abstract host): given a ring host,
    a 14-vector family v multiplying by the structure constants T, and data
    (W, f) certifying the 64 equations, the lsumV-combination words realize
    M through the f-pullback functional. -/
theorem dictionary_of_combination_data
    {M : Block → Block → ℤ} {H : Type} [Ring H]
    (v : Fin 14 → H) (φ : H →ₗ[ℤ] ℤ) (f : Fin 14 → ℤ)
    (_hf : ∀ k, φ (v k) = f k)
    (T : Fin 14 → Fin 14 → Fin 14 → ℤ)
    (_hT : ∀ k l, v k * v l = lsumV idx14 (fun r => T k l r • v r))
    (W : Block → Fin 14 → ℤ)
    (hEq : ∀ p q : Block,
      φ ((lsumV idx14 (fun k => W p k • v k)) * (lsumV idx14 (fun l => W q l • v l)))
        = M p q) :
    ∃ (w : Block → H), ∀ p q : Block, φ (w p * w q) = M p q :=
  ⟨fun p => lsumV idx14 (fun k => W p k • v k), hEq⟩

#check @CombinationDictionary
#check @dictionary_of_combination_data

/-! ## §4. Thm G (the genericity rider's statement surface; the L-rung proof
is OUT OF SCOPE for this fire per grant condition (2) — Prop-only). -/

/-- The σ_q table at an integer parameter (q = 1 recovers sigmaOne, q = −1
    recovers sigmaRow — both by definition unfolding). -/
def sigmaInt (qv : ℤ) (p q' : Block) : ℤ :=
  (-1 : ℤ) ^ (phiQ p q') * (-qv) ^ (tau p q')

/-- The generic no-go shape (statement tier): there is a nonzero integer
    polynomial whose non-roots q all exclude d ≤ 7 realizations of sigmaInt q. -/
def GenericNoDim7 : Prop :=
  ∃ (detMpoly : Polynomial ℤ), detMpoly ≠ 0
    ∧ (∀ qv : ℤ, detMpoly.eval qv ≠ 0 →
      ¬ ∃ (C : Block → Fin 7 → ℤ) (Φ : Fin 7 → Fin 7 → ℤ),
        ∀ p q' : Block,
          sigmaInt qv p q' = lsum (List.finRange 7)
            (fun i => lsum (List.finRange 7) (fun j => C p i * Φ i j * C q' j)))

#check @sigmaInt
#check @GenericNoDim7

/-! ## Audit (every top-level theorem of the fired file). -/

#print axioms sigmaRow_nonRankOne
#print axioms sigmaOne_nonRankOne
#print axioms sigmaRow_zero_free
#print axioms sigmaOne_zero_free
#print axioms table_diagLeft_nogo
#print axioms table_diagRight_nogo
#print axioms no_diagLeft_dim8_sigmaRow
#print axioms no_diagRight_dim8_sigmaRow
#print axioms no_diagLeft_dim8_sigmaOne
#print axioms no_diagRight_dim8_sigmaOne
#print axioms dictionary_of_combination_data

end Pilot41H4
