/-
PROBE FILE — statement-elaboration tier only; NOT A PROOF ARTIFACT.
Lane R4 (worktree agent-08), 2026-11-21, iter6-seed-census Tier-1 seed 2 (the
H3 n>=4 TL hunt, combination-tier unit). Every `sorry` below is a PROBE-CLASS
MARKER: it exists so the full binder structure of each NEW statement elaborates
on-pin (mathlib ff2494ea, v4.36.0-rc2); the fired successor file (H4.lean)
replaces them per the fire plan. The micro-decides (witness + zero-free rows)
are real content and stay. This file never lands as a proof artifact and its
elaboration verdict is never a proof claim (the H-probe/run_p0 conventions).

Statement set (all NEW vs the shipped article-41H3 two-fiber closure — see
H4-precharter.md for novelty rows):
  §1 Thm E1 — the d = 8 uniform-diagonal-κ monomial-host no-go (P6(b) made
     kernel; rank-one kill via a nonvanishing 2x2 minor; both fibers).
  §2 Thm E2 (OPEN arm) — the d = 8 structure-constant tier (the full
     basis-shaped question at the Morin-Duchesne boundary) + the semigroup-
     algebra sub-class. Stated as Props; NO verdict claimed.
  §3 Thm F (POSITIVE arm schema) — the d = 14 combination-word dictionary
     certificate shape (the article-41H3 §7 open core; T instantiated at the
     spin host's word-algebra constants when the hunt fires).
  §4 Thm G — the genericity rider (P4): det M(q) ≠ 0 as a polynomial kills
     every d ≤ 7 realization at all but finitely many q-fibers (statement
     shape; EnclOK binder for the det identity).
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
The first extension of the shipped two-fiber d ≤ 7 closure into the d = 8
boundary band: a host whose eight word-vectors multiply by DIAGONAL structure
constants (u p * u q = S p q • u p, resp. • u q) carries no dictionary for a
zero-free table with a nonvanishing 2×2 minor. Associativity + the dictionary
equations force the table rank-one; the certified fibers are not. -/

/-- A nonvanishing 2×2 minor: the table is not rank-one (not an outer product
    f ⊗ T). Both certified fibers satisfy this (the asymmetry witnesses). -/
def NonRankOne (M : Block → Block → ℤ) : Prop :=
  ∃ a b c d : Block, M a c * M b d - M a d * M b c ≠ 0

/-- E1, left-diagonal form, table-free: given any zero-free, non-rank-one
    table, no ring host with torsion-free word-vectors and uniform left
    structure constants realizes it. (hmul: κ = p on every pair.) -/
theorem table_diagLeft_nogo {M : Block → Block → ℤ}
    (hnz : ∀ p q, M p q ≠ 0) (hnr : NonRankOne M)
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u p)
    (hdict : ∀ p q, φ (u p * u q) = M p q) :
    False := by
  sorry  -- PROBE-CLASS MARKER (statement tier only): run-1 proves the
         -- associativity-cancellation chain: S(b,c)·S(a,b) = S(a,b)·S(a,c)
         -- (htf cancels), so S's columns are constant; M = f ⊗ T rank-one;
         -- the 2×2 minor vanishes — contradicting hnr.

/-- E1, right-diagonal form: the mirror (κ = q on every pair; S's rows
    constant; M = R ⊗ f rank-one; same kill). -/
theorem table_diagRight_nogo {M : Block → Block → ℤ}
    (hnz : ∀ p q, M p q ≠ 0) (hnr : NonRankOne M)
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u q)
    (hdict : ∀ p q, φ (u p * u q) = M p q) :
    False := by
  sorry  -- PROBE-CLASS MARKER (mirror chain).

/-- The certified fibers' minor witnesses (REAL CONTENT, kernel decides):
    rows = the certified asymmetry pairs, cols the same pair — the minor is
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
    False := by
  sorry  -- PROBE-CLASS MARKER: table_diagLeft_nogo + the two decides above.

/-- E1 final form, q = −1 fiber, right-diagonal hosts. -/
theorem no_diagRight_dim8_sigmaRow
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u q)
    (hdict : ∀ p q, φ (u p * u q) = sigmaRow p q) :
    False := by sorry  -- PROBE-CLASS MARKER.

/-- E1 final form, q = +1 fiber, left-diagonal hosts. -/
theorem no_diagLeft_dim8_sigmaOne
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u p)
    (hdict : ∀ p q, φ (u p * u q) = sigmaOne p q) :
    False := by sorry  -- PROBE-CLASS MARKER.

/-- E1 final form, q = +1 fiber, right-diagonal hosts. -/
theorem no_diagRight_dim8_sigmaOne
    {H : Type} [Ring H] (φ : H →ₗ[ℤ] ℤ)
    (u : Block → H) (S : Block → Block → ℤ)
    (htf : ∀ p (n : ℤ), n • u p = 0 → n = 0)
    (hmul : ∀ p q, u p * u q = S p q • u q)
    (hdict : ∀ p q, φ (u p * u q) = sigmaOne p q) :
    False := by sorry  -- PROBE-CLASS MARKER.

/-! ## §2. Thm E2 (OPEN arm; Props only, NO verdict claimed) — the d = 8
structure-constant tier: is either certified table the φ-Gram table of an
8-dimensional associative multiplication with the words as a basis? This is
the full basis-shaped question at the Morin–Duchesne boundary band the d ≤ 7
closure leaves open; the uniform diagonals die by E1, MIXED κ and general
structure constants stay open. The semigroup sub-class (u p * u q = u (κ p q))
is the "evaluation table" question. Pre-solve material (exact-integer,
constraint propagation / labeled-Cayley enumeration); NOT claimed here. -/

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
    verdict is claimed at statement tier). -/
def diagonal8_open_questions : Prop :=
  StructureConstantDictionary sigmaRow ∨ StructureConstantDictionary sigmaOne
  ∨ SemigroupEvaluationTable sigmaRow ∨ SemigroupEvaluationTable sigmaOne

#check @StructureConstantDictionary
#check @SemigroupEvaluationTable
#check @diagonal8_open_questions

/-! ## §3. Thm F (POSITIVE arm schema) — the d = 14 combination-word
dictionary certificate shape (article-41H3 §7's open core). A positive must
exhibit: associative structure constants T on ℤ¹⁴ (in the hunt: the spin
host's word-algebra constants, certificate data from the archived pre-solve
machinery), combination-word coefficients W, and a functional f, satisfying
the 64 equations. The schema is the certificate shape; the DATA is the hunt. -/

def idx14 : List (Fin 14) := List.finRange 14

/-- Vector-valued literal sums (the §0 `lsum` lifted to any AddCommGroup;
    same Finset-free foldr shape). -/
def lsumV {α : Type*} {H : Type*} [AddCommGroup H] (L : List α) (F : α → H) : H :=
  L.foldr (fun b acc => F b + acc) 0

/-- The combination-tier certificate shape: M(p,q) = Σ_{k,l} W p k · W q l ·
    (Σ_r T k l r · f r) with T associative. Instantiating T at the spin host's
    word-algebra constants is the fired hunt's first move (binder-or-cite for
    the classical dim-14 fact; the constants themselves are mechanical
    certificate data). -/
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
    (W, f) certifying `CombinationDictionary M` at T, the combination words
    w_p := Σ_k W p k • v k realize M through the functional φ := f-pullback.
    The fired successor proves this and instantiates v at the spin host. -/
theorem dictionary_of_combination_data
    {M : Block → Block → ℤ} {H : Type} [Ring H]
    (v : Fin 14 → H) (φ : H →ₗ[ℤ] ℤ) (f : Fin 14 → ℤ)
    (hf : ∀ k, φ (v k) = f k)
    (T : Fin 14 → Fin 14 → Fin 14 → ℤ)
    (hT : ∀ k l, v k * v l = lsumV idx14 (fun r => T k l r • v r))
    (W : Block → Fin 14 → ℤ)
    (hEq : ∀ p q : Block,
      φ ((lsumV idx14 (fun k => W p k • v k)) * (lsumV idx14 (fun l => W q l • v l)))
        = M p q) :
    ∃ (w : Block → H), ∀ p q : Block, φ (w p * w q) = M p q := by
  sorry  -- PROBE-CLASS MARKER: the words are the lsum-combinations; hEq IS
         -- the dictionary condition restated (run-1 discharges the witness).

#check @CombinationDictionary
#check @dictionary_of_combination_data

/-! ## §4. Thm G — the genericity rider (P4, method-grade): the σ_q table at
INTEGER q, and the statement shape "det M(q) ≠ 0 as a polynomial ⇒ no d ≤ 7
realization at every q-fiber outside the (≤ 24) roots". L-rung: the eval/det
commutation (Polynomial.map / Matrix.det ring-hom) is the fire-time cost; at
statement tier the determinant identity enters as an EnclOK binder. -/

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

/-- The EnclOK binder form of the determinant identity (the L-rung's proof
    obligation: eval ∘ det = det of the entrywise-evaluated table, and the
    polynomial is nonzero because det M(−1) = ±8⁴ by H2/H3's certificates). -/
theorem no_realization_dim7_generic
    (detMpoly : Polynomial ℤ) (hne : detMpoly ≠ 0)
    (hMpoly : ∀ qv : ℤ,
      detMpoly.eval qv = (Matrix.det fun (p q' : Block) => sigmaInt qv p q'))
    (qv : ℤ) (hdet : detMpoly.eval qv ≠ 0)
    (C : Block → Fin 7 → ℤ) (Φ : Fin 7 → Fin 7 → ℤ)
    (hreal : ∀ p q' : Block,
      sigmaInt qv p q' = lsum (List.finRange 7)
        (fun i => lsum (List.finRange 7) (fun j => C p i * Φ i j * C q' j))) :
    False := by
  sorry  -- PROBE-CLASS MARKER: L-rung — det ≠ 0 ⇒ nonsingular ⇒ the H3
         -- table_rank_nogo binder (8 > 7 pigeonhole over the integer
         -- adjugate expansion). Statement tier only.

#check @sigmaInt
#check @GenericNoDim7
#check @no_realization_dim7_generic

/-! ## Audit (the decided micro-theorems only; the sorry-marked statements
print sorryAx by design — probe class, not proof artifacts). -/

#print axioms sigmaRow_nonRankOne
#print axioms sigmaOne_nonRankOne
#print axioms sigmaRow_zero_free
#print axioms sigmaOne_zero_free

end Pilot41H4
