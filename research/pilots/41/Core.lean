/-
Pilot 41 Core — q-deformed-eight-square, core S–M rung (M1 skeleton + milestones 1–4).

Provenance: lane R4, 2026-11-19 (unit 2, per S-M-plan.md). Substrate mathlib
  ff2494ea5e438f…, Lean v4.36.0-rc2, warm app crossmath-probe (doz CLI/semraker).
  §0 below is the P0 statement surface VERBATIM from pilots/41/P0.lean run-2 bytes
  (sha256-16 b177acdbf0346bf1, GREEN 2026-11-19, logs/p0-run2.log).

KERNEL-ONLY: no `sorry`, no `native_decide`, no external CAS. Finite checks are
  kernel `decide` over Bool-tuple spaces (8⁴ = 4096 parallelogram quads). All
  statements Prop-valued; `noncomputable` marks data defs touching Polynomial ℤ mul
  (P0 finding 1, applied up-front).

================================================================================
FINDINGS (statement-math, machine-certified in §1 — for the dossier, R9's file;
the P0 defs stay UNTOUCHED below as the record of what was stated):
================================================================================
F1. The P0's `P1`, `P2` — and hence `MainIdentity` quantified over ALL parallelogram
    quads — are FALSE. Witness (§1): p = 000, q1 = 100, p′ = 100, q2 = 000 (a valid
    parallelogram): Q1 = 0 vs Q2 = 1 mod 2 (P1 fails), gapOdd = 0 even (P2 fails),
    and at R = ℤ, q = −1 the (M) equation reads 0 = 2 (MainIdentity fails). The
    dossier's own conditional ("provided (P1)(P2)") was the right instinct: the P0
    precharter over-strengthened it to a Para-universal.
F2. CORRECTED THEOREM (proved in §6, `mainCor`): the defect identity holds at EVERY
    parallelogram quad with the UNIFIED defect polynomial
      GqGen := (−1)^{Q_small} · (−X)^{τmin} · Σ_{j<|τ1−τ2|} X^j,
    where τmin = min(τ1,τ2), |τ1−τ2| = τ1+τ2−2·τmin, Q_small = the quadratic
    exponent-sum of the smaller-τ side. On the odd-gap stratum GqGen = the P0's Gq
    (`Gq_eq_GqGen_on_stratum`), so the dossier's (M) holds there in exactly its
    stated form (`MainIdentityStratum`). The empty-sum case |τ1−τ2| = 0 gives
    GqGen = 0: the alternation is q-RIGID there (`qRigid`).
F3. STRATUM CHARACTERIZATION (`stratumComplement`, decide-certified): the odd-gap
    stratum — where the P0's Gq is exactly right — is {p′ = ¬p bitwise}
    (bxor p p′ = 111): "the geometric defect lives exactly on antipodal
    parallelograms". Off it, τ1 ≡ τ2 mod 2 and the defect is either 0 (τ1 = τ2) or
    the even-length geometric sum (|τ1−τ2| ≥ 2 even; e.g. p = 101, q1 = 101,
    p′ = 011, q2 = 011 gives A + B = 1 − q²).
F4. `SigmaQ_Signs_all_q` (N′, the F5(ii) degenerate branch) is REFUTED (§6): the
    family is NONdegenerate — the alternation fails at q = −1 already (value 2) on
    the antipodal quad p = 110, q1 = 110, p′ = 001, q2 = 001. The P0's
    `Nondegenerate` (∃ quad with Gq ≠ 0) is TRUE (trivially: Gq's geometric factor
    is never empty).

CLAIM DISCIPLINE (locked, preflight §1 / round-3 novelty/round-3.md:50–70): headline
  = "first sign-rule/parallelogram-defect deformation"; NEVER "first q-deformation of
  a composition algebra" (Benkart–Pérez-Izquierdo 1998, arXiv:math/9801141, owns the
  q-composition object level). Nearest-miss cites (any article): eth Eight.signs
  (q = 1, mod-2 proof), R7's q = 1 cocycle reading (bridges/tensor-algebra.md §2a),
  tauceti CayleyDickson/Quaternion.lean "Degen's eight-square identity", Kauffman
  bracket skein calculus, fermionic ordering signs (dossier :155–160).

(H) WAVE-TAIL CONDITIONAL per orchestrator DECISION-4 (2026-11-19): NOT started here;
  the P0's HostTransport binder def is carried in §0 for the record only.

Deviation from S-M-plan §1 (recorded): the eth chain TRANSCRIPTION (chg/lin/four_phi,
  D-tranche) is REPLACED by decide-verified finite lemmas (ethParity etc.) — the same
  mathematical content, kernel-checked, zero pin-adjustment churn. §5's algebra is the
  precharter's step-2, with the F2 correction.

FIRED 2026-11-19 (lane R4, unit 2): **GREEN at run 9** (`logs/core-run9.log`,
  modal.com/apps/semraker/main/ap-1Nwga8w9Z6PdxubdY5bWGW): 0 errors, 0 sorry, P0.lean
  green alongside; full in-file `#print axioms` audit triad-or-leaner for all 30
  top-level theorems (decide-certified lemmas at ZERO axioms: phi_parts, ethParity,
  stratumComplement, P1_refuted). Fired sha256-16 history: c582eb90b59182fb (run 1,
  §0–§4 truncation), 7a5fb6d1315f36d5 (run 2), 27b005da0a93e3ff (run 3, first full
  file), c525de8915d9b713 (4), bb338fb4992fc097 (5), 428bbd8dbb1c22dc (6),
  ed38ec77697bdda9 (7), 77ff652439aa63f2 (8), 921bc43cbd06d252 (9 = this file's bytes,
  GREEN). Runs 4–8 chased ONE elaboration issue (the P0 def SigmaQ_Signs_all_q's
  auto-bound `Type*` universe, frozen rigid by a polymorphic negation — resolved by
  instantiating `.{0}` at the refutation, universe-cosmetic per the in-file note);
  everything else was green from run 4 on. Elaboration facts recorded for the future:
  kernel `decide` does not whnf `aeval` through Classical decidability instances
  (witness computations use norm_num instead); `if_pos`/`if_neg` do not fire as simp
  arguments on this pin (use `split`); the P0 `Gq` ascription elaborates with the
  ℤ→ℤ[X] coercion on the pow-BASE, so C-conversions need
  intCast_eq_C then `← Polynomial.C_pow`.
-/
import Mathlib

namespace Pilot41

/-! ## §0. P0 statement surface (VERBATIM from P0.lean run-2; see file header) -/

/-- VERBATIM eth :37. A block of three bits, p = (p₁, p₂, p₃). -/
abbrev Block : Type := Bool × Bool × Bool

/-- VERBATIM eth :40. p ⊕ q, bit by bit. -/
def bxor (p q : Block) : Block := (p.1 ^^ q.1, p.2.1 ^^ q.2.1, p.2.2 ^^ q.2.2)

/-- VERBATIM eth :43–48. φ(p,q) = Σ_{1 ≤ i ≤ j ≤ 3} p_i q_j + q₁p₂p₃ + p₁q₂p₃ + p₁p₂q₃. -/
def phi (p q : Block) : ℕ :=
  p.1.toNat * q.1.toNat + p.1.toNat * q.2.1.toNat + p.1.toNat * q.2.2.toNat
    + p.2.1.toNat * q.2.1.toNat + p.2.1.toNat * q.2.2.toNat + p.2.2.toNat * q.2.2.toNat
    + q.1.toNat * p.2.1.toNat * p.2.2.toNat + p.1.toNat * q.2.1.toNat * p.2.2.toNat
    + p.1.toNat * p.2.1.toNat * q.2.2.toNat

/-- VERBATIM eth :49. The sign σ(p,q) = (−1)^{φ(p,q)}. -/
def sigma (p q : Block) : ℤ := (-1) ^ phi p q

/-- VERBATIM eth :53. The eight-square identity, first form (the q = 1 target). -/
def Signs : Prop :=
  ∀ p q p' q' : Block, bxor p q = bxor p' q' → q ≠ q' →
    sigma p q * sigma p' q' + sigma p q' * sigma p' q = 0

/-- VERBATIM eth :126–128. The quadratic part Σ_{1 ≤ i ≤ j ≤ 3} p_i q_j. -/
def phiQ (p q : Block) : ℕ :=
  p.1.toNat * q.1.toNat + p.1.toNat * q.2.1.toNat + p.1.toNat * q.2.2.toNat
    + p.2.1.toNat * q.2.1.toNat + p.2.1.toNat * q.2.2.toNat + p.2.2.toNat * q.2.2.toNat

/-- VERBATIM eth :131. The cubic term q₁p₂p₃. -/
def phi1 (p q : Block) : ℕ := q.1.toNat * p.2.1.toNat * p.2.2.toNat
/-- VERBATIM eth :132. The cubic term p₁q₂p₃. -/
def phi2 (p q : Block) : ℕ := p.1.toNat * q.2.1.toNat * p.2.2.toNat
/-- VERBATIM eth :133. The cubic term p₁p₂q₃. -/
def phi3 (p q : Block) : ℕ := p.1.toNat * p.2.1.toNat * q.2.2.toNat

/-- eth :136 (rfl there; here re-proved by rfl over the verbatim parts). -/
theorem phi_parts (p q : Block) : phi p q = phiQ p q + phi1 p q + phi2 p q + phi3 p q := rfl

/-- τ(p,q′) := the three cubic exponents collected. -/
def tau (p q' : Block) : ℕ := phi1 p q' + phi2 p q' + phi3 p q'

variable {R : Type*} [CommRing R]

/-- **σ_q(p,q′) := (−1)^{φQ(p,q′)} · (−q)^{τ(p,q′)}** — the q-deformed Graves sign. -/
def sigmaQ (q : Rˣ) (p q' : Block) : R :=
  (-1 : R) ^ phiQ p q' * (-(q : R)) ^ tau p q'

/-- The parallelogram hypothesis pair as an abbreviation. -/
def Para (p q1 p' q2 : Block) : Prop := bxor p q1 = bxor p' q2 ∧ q1 ≠ q2

/-- τ-sums, min, gap (P0 naming). -/
def tauSum1 (p q1 p' q2 : Block) : ℕ := tau p q1 + tau p' q2
def tauSum2 (p q1 p' q2 : Block) : ℕ := tau p q2 + tau p' q1
def tauMin (p q1 p' q2 : Block) : ℕ := min (tauSum1 p q1 p' q2) (tauSum2 p q1 p' q2)
def gapOdd (p q1 p' q2 : Block) : ℕ := tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2
def kDef (p q1 p' q2 : Block) : ℕ := (gapOdd p q1 p' q2 - 2 * tauMin p q1 p' q2 - 1) / 2

open Polynomial

/-- The P0's G_q (errata-corrected form; see P0.lean header). NONCOMPUTABLE (P0
pin-adjustment: Polynomial ℤ mul is noncomputable). -/
noncomputable def Gq (p q1 p' q2 : Block) : Polynomial ℤ :=
  ((-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2) : Polynomial ℤ)
    * (-X) ^ tauMin p q1 p' q2
    * ∑ j ∈ Finset.range (2 * kDef p q1 p' q2 + 1), (X : Polynomial ℤ) ^ j

/-- **(M) the P0 main identity** (REFUTED as a Para-universal, §1; TRUE on the odd-gap
stratum, §6 `MainIdentityStratum`). -/
def MainIdentity (R : Type*) [CommRing R] (q : Rˣ) : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1
      = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

/-- **(B) the bridge axiom** — the q = 1 fiber recovers eth's σ. -/
def BridgeAxiom : Prop := ∀ p q' : Block, sigmaQ (1 : ℤˣ) p q' = sigma p q'

/-- **(P1)** quadratic parity (REFUTED as a Para-universal, §1; TRUE on the stratum —
    implied by ethParity + odd gap). -/
def P1 : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    (phiQ p q1 + phiQ p' q2) % 2 = (phiQ p q2 + phiQ p' q1) % 2

/-- **(P2)** cubic four-sum parity (REFUTED as a Para-universal, §1; on the stratum it
    is the defining condition itself). -/
def P2 : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 → Odd (gapOdd p q1 p' q2)

/-- **(N) nondegeneracy** (∃ parallelogram quad with Gq ≠ 0) — TRUE, §7. -/
def Nondegenerate : Prop :=
  ∃ p q1 p' q2 : Block, Para p q1 p' q2 ∧ Gq p q1 p' q2 ≠ 0

/-- **(N′) the degenerate branch** — REFUTED, §7 (the family is nondegenerate). -/
def SigmaQ_Signs_all_q : Prop :=
  ∀ {R : Type*} [CommRing R] (q : Rˣ), ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1 = 0

/-- **(M) ⇒ Signs at q = 1** — the P0 anchor-corollary SHAPE (as a material implication
    it is TRUE via the anchor; the content-bearing version at the ℤ fiber is
    `mainCor_one_implies_signs`, §8). -/
def MainImpliesSigns : Prop :=
  ∀ {R : Type*} [CommRing R] (q : Rˣ), MainIdentity R q → BridgeAxiom → (q : R) = 1 → Signs

/-- The (B) instance to print in-run (P0 §1.5 regression pin). -/
def bridge_pin : Prop :=
  sigmaQ (1 : ℤˣ) (true, false, true) (false, true, false)
    = sigma (true, false, true) (false, true, false)

/-- (H) at binder tier (EnclOK convention) — WAVE-TAIL CONDITIONAL, NOT STARTED. -/
def HostTransport {R : Type*} [CommRing R] (A : Rˣ) (q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) : Prop :=
  (q : R) = -((A : R) ^ 2) →
    (∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') →
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

/-- The ℤ → ℤ[X] coercion is `Polynomial.C` (isolated so any pin-adjustment is
one-line; D3 precedent). Needed as early as §1 (witness computations). -/
theorem intCast_eq_C (c : ℤ) : ((c : ℤ) : Polynomial ℤ) = Polynomial.C c := by
  rw [← Polynomial.C_eq_intCast, Int.cast_id]

/-! ## §1. FINDING F1 — machine-certified refutations of the P0's over-strengthened
universals (witness: p = 000, q1 = 100, p′ = 100, q2 = 000; a valid parallelogram).
FIRST in the file and in core-1 by the orchestrator's ORDER ruling (2026-11-19): the
kernel decide on the counter-quad is the arbiter; the hand analysis only motivated it. -/

/-- P1 (quadratic parity for ALL parallelograms) is FALSE: at the witness quad
Q1 = 0 but Q2 = 1 (mod 2). -/
theorem P1_refuted : ¬ P1 := by
  intro h
  have h0 := h (false, false, false) (true, false, false) (true, false, false)
    (false, false, false) ⟨rfl, by decide⟩
  exact absurd h0 (by decide)

/-- P2 (gapOdd odd for ALL parallelograms) is FALSE: at the witness quad gapOdd = 0. -/
theorem P2_refuted : ¬ P2 := by
  intro h
  have h0 := h (false, false, false) (true, false, false) (true, false, false)
    (false, false, false) ⟨rfl, by decide⟩
  rw [Nat.odd_iff] at h0
  exact absurd h0 (by decide)

/-- MainIdentity quantified over ALL parallelograms is FALSE: at the witness quad the
LHS is 0 for every q, while at R = ℤ, q = −1 the RHS is (1 − (−1)) · aeval (−1) (Gq …)
= 2 · 1 = 2. (Computed by norm_num over the unfolded witness — the raw kernel `decide`
gets stuck reducing aeval through Classical decidability instances, run 1.) -/
theorem MainIdentity_refuted : ¬ MainIdentity ℤ (-1 : ℤˣ) := by
  intro h
  have h0 := h (false, false, false) (true, false, false) (true, false, false)
    (false, false, false) ⟨rfl, by decide⟩
  have hu : ((-1 : ℤˣ) : ℤ) = -1 := rfl
  rw [hu] at h0
  norm_num [sigmaQ, phiQ, tau, phi1, phi2, phi3, Gq, tauSum1, tauSum2, tauMin, gapOdd,
    kDef, intCast_eq_C, Polynomial.aeval_C, Finset.sum_range_one, map_one] at h0
  -- (norm_num closes the goal: h0 normalizes to the numeral-false `0 = 2`)

/-! ## §2. Finite facts (kernel `decide` over the 4096-quadruple space; the eth
parity content, replacing the chg/lin chain transcription — see file header). -/

/-- The engine: at every parallelogram quad the TOTAL parity is odd — the quadratic
four-sum plus the cubic four-sum is ≡ 1 mod 2. This is eth's `Signs` content in
parity form (Signs ⟺ opposite parities ⟺ odd total), decide-certified. -/
theorem ethParity_raw : ∀ (a b c d e f g i j k l m : Bool),
    (bxor (a, b, c) (d, e, f) = bxor (g, i, j) (k, l, m) ∧ (d, e, f) ≠ (k, l, m)) →
    ((phiQ (a, b, c) (d, e, f) + phiQ (g, i, j) (k, l, m))
      + (phiQ (a, b, c) (k, l, m) + phiQ (g, i, j) (d, e, f))
      + (tauSum1 (a, b, c) (d, e, f) (g, i, j) (k, l, m)
        + tauSum2 (a, b, c) (d, e, f) (g, i, j) (k, l, m))) % 2 = 1 := by
  decide

theorem ethParity (p q1 p' q2 : Block) (hpara : Para p q1 p' q2) :
    ((phiQ p q1 + phiQ p' q2) + (phiQ p q2 + phiQ p' q1)
      + (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2)) % 2 = 1 := by
  rcases p with ⟨a, ⟨b, c⟩⟩
  rcases q1 with ⟨d, ⟨e, f⟩⟩
  rcases p' with ⟨g, ⟨i, j⟩⟩
  rcases q2 with ⟨k, ⟨l, m⟩⟩
  exact ethParity_raw a b c d e f g i j k l m hpara

/-- FINDING F3: the odd-gap stratum (where the P0's Gq is exactly the defect) is
precisely the ANTIPODAL parallelograms — p′ = ¬p bitwise. Decide-certified. -/
theorem stratumComplement_raw : ∀ (a b c d e f g i j k l m : Bool),
    (bxor (a, b, c) (d, e, f) = bxor (g, i, j) (k, l, m) ∧ (d, e, f) ≠ (k, l, m)) →
    ((tauSum1 (a, b, c) (d, e, f) (g, i, j) (k, l, m)
        + tauSum2 (a, b, c) (d, e, f) (g, i, j) (k, l, m)) % 2 = 1
      ↔ bxor (a, b, c) (g, i, j) = (true, true, true)) := by
  decide

theorem stratumComplement (p q1 p' q2 : Block) (hpara : Para p q1 p' q2) :
    (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2) % 2 = 1
      ↔ bxor p p' = (true, true, true) := by
  rcases p with ⟨a, ⟨b, c⟩⟩
  rcases q1 with ⟨d, ⟨e, f⟩⟩
  rcases p' with ⟨g, ⟨i, j⟩⟩
  rcases q2 with ⟨k, ⟨l, m⟩⟩
  exact stratumComplement_raw a b c d e f g i j k l m hpara

/-! ## §3. Ring-level helpers (the step-2 algebra toolkit; all kernel-safe). -/

theorem neg_one_pow_two_mul {R : Type*} [CommRing R] (m : ℕ) : (-1 : R) ^ (2 * m) = 1 := by
  rw [pow_mul, show (-1 : R) ^ 2 = 1 by norm_num, one_pow]

theorem neg_one_pow_two_mul_succ {R : Type*} [CommRing R] (m : ℕ) :
    (-1 : R) ^ (2 * m + 1) = -1 := by
  rw [pow_add, neg_one_pow_two_mul, pow_one, one_mul]

theorem neg_one_pow_congr {R : Type*} [CommRing R] {m n : ℕ} (h : m % 2 = n % 2) :
    (-1 : R) ^ m = (-1 : R) ^ n := by
  by_cases h0 : m % 2 = 0
  · have h0' : n % 2 = 0 := by omega
    obtain ⟨i, hi⟩ : ∃ i, m = 2 * i := ⟨m / 2, by omega⟩
    obtain ⟨j, hj⟩ : ∃ j, n = 2 * j := ⟨n / 2, by omega⟩
    rw [hi, hj, neg_one_pow_two_mul, neg_one_pow_two_mul]
  · have h1' : m % 2 = 1 := by omega
    have h1'' : n % 2 = 1 := by omega
    obtain ⟨i, hi⟩ : ∃ i, m = 2 * i + 1 := ⟨m / 2, by omega⟩
    obtain ⟨j, hj⟩ : ∃ j, n = 2 * j + 1 := ⟨n / 2, by omega⟩
    rw [hi, hj, neg_one_pow_two_mul_succ, neg_one_pow_two_mul_succ]

theorem neg_one_pow_add_eq_zero {R : Type*} [CommRing R] (a b : ℕ) (h : (a + b) % 2 = 1) :
    (-1 : R) ^ a + (-1 : R) ^ b = 0 := by
  by_cases ha : a % 2 = 0
  · have hb : b % 2 = 1 := by omega
    obtain ⟨i, hi⟩ : ∃ i, a = 2 * i := ⟨a / 2, by omega⟩
    obtain ⟨j, hj⟩ : ∃ j, b = 2 * j + 1 := ⟨b / 2, by omega⟩
    rw [hi, hj, neg_one_pow_two_mul, neg_one_pow_two_mul_succ]
    norm_num
  · have ha' : a % 2 = 1 := by omega
    have hb : b % 2 = 0 := by omega
    obtain ⟨i, hi⟩ : ∃ i, a = 2 * i + 1 := ⟨a / 2, by omega⟩
    obtain ⟨j, hj⟩ : ∃ j, b = 2 * j := ⟨b / 2, by omega⟩
    rw [hi, hj, neg_one_pow_two_mul_succ, neg_one_pow_two_mul]
    norm_num

/-- Geometric-sum factorization: (1 − x) · Σ_{j<n} x^j = 1 − x^n. -/
theorem one_sub_mul_geom {R : Type*} [CommRing R] (x : R) (n : ℕ) :
    (1 - x) * ∑ j ∈ Finset.range n, x ^ j = 1 - x ^ n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ, mul_add, ih, pow_succ]
    ring

/-- Parity bracket: if a + b + g is odd then (−1)^a + (−1)^b·(−x)^g = (−1)^a·(1 − x^g).
This is where the eth parity (total odd) enters the defect algebra — in BOTH parity
patterns of (g, a+b): odd gap with a ≡ b, or even gap with a ≢ b, the same collapse. -/
theorem parity_bracket {R : Type*} [CommRing R] (x : R) (a b g : ℕ)
    (h : (a + b + g) % 2 = 1) :
    (-1 : R) ^ a + (-1 : R) ^ b * (-x) ^ g = (-1 : R) ^ a * (1 - x ^ g) := by
  rw [neg_pow x g, ← mul_assoc, ← pow_add]
  have hbg : (b + g) % 2 = (a + 1) % 2 := by omega
  rw [neg_one_pow_congr hbg, pow_add, pow_one]
  ring

/-- The two-term defect factorization (abstract step-2): for s ≤ t with the total
parity odd, (−1)^a(−x)^s + (−1)^b(−x)^t = (1−x)·(−1)^a(−x)^s·Σ_{j<t−s} x^j. -/
theorem two_term_geom {R : Type*} [CommRing R] (x : R) (a b s t : ℕ) (hle : s ≤ t)
    (h : (a + b + (t - s)) % 2 = 1) :
    (-1 : R) ^ a * (-x) ^ s + (-1 : R) ^ b * (-x) ^ t
      = (1 - x) * ((-1 : R) ^ a * (-x) ^ s * ∑ j ∈ Finset.range (t - s), x ^ j) := by
  conv_lhs => rw [show t = s + (t - s) from by omega, pow_add]
  rw [show (-1 : R) ^ b * ((-x) ^ s * (-x) ^ (t - s))
        = (-x) ^ s * ((-1 : R) ^ b * (-x) ^ (t - s)) from by ring,
    show (-1 : R) ^ a * (-x) ^ s + (-x) ^ s * ((-1 : R) ^ b * (-x) ^ (t - s))
        = (-x) ^ s * ((-1 : R) ^ a + (-1 : R) ^ b * (-x) ^ (t - s)) from by ring,
    parity_bracket x a b (t - s) h, ← one_sub_mul_geom]
  ring

/-- Recombining a σ_q-product: the sign factors and unit factors merge by pow_add. -/
theorem sigmaQ_prod {R : Type*} [CommRing R] (q : Rˣ) (a b c d : Block) :
    sigmaQ q a b * sigmaQ q c d
      = (-1 : R) ^ (phiQ a b + phiQ c d) * (-(q : R)) ^ (tau a b + tau c d) := by
  have key : (-1 : R) ^ (phiQ a b + phiQ c d) * (-(q : R)) ^ (tau a b + tau c d)
      = (-1 : R) ^ phiQ a b * (-(q : R)) ^ tau a b
        * ((-1 : R) ^ phiQ c d * (-(q : R)) ^ tau c d) := by
    rw [pow_add, pow_add]; ring
  simp only [sigmaQ]
  rw [← key]

/-- The abstract defect polynomial shape (the GqGen building block). -/
noncomputable def DefPoly (c : ℤ) (s n : ℕ) : Polynomial ℤ :=
  Polynomial.C c * (-(Polynomial.X : ℤ[X])) ^ s
    * ∑ j ∈ Finset.range n, (Polynomial.X : ℤ[X]) ^ j

/-- aeval of the defect shape: the constant flows through algebraMap, (−X) ↦ (−x),
the geometric sum maps termwise. -/
theorem aeval_geom {R : Type*} [CommRing R] (x : R) (c : ℤ) (s n : ℕ) :
    Polynomial.aeval x (DefPoly c s n)
      = algebraMap ℤ R c * (-x) ^ s * ∑ j ∈ Finset.range n, x ^ j := by
  simp only [DefPoly, map_mul, map_sum, map_pow, map_neg, Polynomial.aeval_C,
    Polynomial.aeval_X]

/-- The abstract main identity: two-term factorization × aeval of the defect shape.
This is the complete step-2 algebra, ring-independent. -/
theorem main_abstract {R : Type*} [CommRing R] (x : R) (a b s t : ℕ) (hle : s ≤ t)
    (h : (a + b + (t - s)) % 2 = 1) :
    (-1 : R) ^ a * (-x) ^ s + (-1 : R) ^ b * (-x) ^ t
      = (1 - x) * Polynomial.aeval x (DefPoly ((-1 : ℤ) ^ a) s (t - s)) := by
  rw [two_term_geom x a b s t hle h, aeval_geom, map_pow, map_neg, map_one]
  -- (the rw chain closes by rfl: both sides land on the same normal form)

/-! ## §4. Milestone 1 — the anchor: eth's Signs re-proved in-pilot (parity route). -/

/-- The anchor: the classical Graves alternation, proved from `ethParity` (the
mod-2 route, as in eth's own proof strategy). No eth theorem imported. -/
theorem signs_anchor : Signs := by
  intro p q1 p' q2 h1 h2
  have hpar := ethParity p q1 p' q2 ⟨h1, h2⟩
  have hphi1 : phi p q1 + phi p' q2
      = (phiQ p q1 + phiQ p' q2) + tauSum1 p q1 p' q2 := by
    rw [phi_parts, phi_parts, tauSum1, tau, tau]; omega
  have hphi2 : phi p q2 + phi p' q1
      = (phiQ p q2 + phiQ p' q1) + tauSum2 p q1 p' q2 := by
    rw [phi_parts, phi_parts, tauSum2, tau, tau]; omega
  have htot : ((phi p q1 + phi p' q2) + (phi p q2 + phi p' q1)) % 2 = 1 := by omega
  simp only [sigma]
  rw [← pow_add, ← pow_add]
  exact neg_one_pow_add_eq_zero _ _ htot

/-! ## §5. Milestone 3a — the bridge (B). -/

/-- (B): at q = 1 the deformed sign IS eth's σ (the q = 1 fiber is classical). -/
theorem bridge_axiom : BridgeAxiom := by
  intro p q'
  have h1 : ((1 : ℤˣ) : ℤ) = 1 := rfl
  simp only [sigmaQ, sigma, tau]
  rw [h1, show (-(1 : ℤ)) = (-1 : ℤ) from rfl, ← pow_add, phi_parts]
  congr 1
  omega

/-- The P0 §1.5 regression pin, discharged. -/
theorem bridge_pin_proof : bridge_pin := bridge_axiom (true, false, true) (false, true, false)

/-! ## §6. Milestones 2+3 — FINDING F2: the CORRECTED defect identity (unified over
ALL parallelogram quads), and the dossier's (M) recovered on the antipodal stratum. -/

/-- The unified defect polynomial GqGen := (−1)^{Q_small}·(−X)^{τmin}·Σ_{j<|τ1−τ2|}X^j.
Branch τ1 ≤ τ2: smaller side is the A-side (coefficient (−1)^{Q1}); else the B-side.
Empty geometric sum when τ1 = τ2 (defect 0: q-rigidity). -/
noncomputable def GqGen (p q1 p' q2 : Block) : Polynomial ℤ :=
  if tauSum1 p q1 p' q2 ≤ tauSum2 p q1 p' q2 then
    Polynomial.C ((-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2))
      * (-(Polynomial.X : ℤ[X])) ^ tauSum1 p q1 p' q2
      * ∑ j ∈ Finset.range (tauSum2 p q1 p' q2 - tauSum1 p q1 p' q2),
          (Polynomial.X : ℤ[X]) ^ j
  else
    Polynomial.C ((-1 : ℤ) ^ (phiQ p q2 + phiQ p' q1))
      * (-(Polynomial.X : ℤ[X])) ^ tauSum2 p q1 p' q2
      * ∑ j ∈ Finset.range (tauSum1 p q1 p' q2 - tauSum2 p q1 p' q2),
          (Polynomial.X : ℤ[X]) ^ j

/-- **(M-corrected)**: for EVERY parallelogram quad, the σ_q-alternation equals
(1 − q) times the aeval of the unified defect polynomial. The discovery statement. -/
def MainIdentityCor {R : Type*} [CommRing R] (q : Rˣ) : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1
      = (1 - (q : R)) * Polynomial.aeval (q : R) (GqGen p q1 p' q2)

theorem mainCor {R : Type*} [CommRing R] (q : Rˣ) : MainIdentityCor q := by
  intro p q1 p' q2 hpara
  have hpar := ethParity p q1 p' q2 hpara
  rw [sigmaQ_prod, sigmaQ_prod,
    show tau p q1 + tau p' q2 = tauSum1 p q1 p' q2 from rfl,
    show tau p q2 + tau p' q1 = tauSum2 p q1 p' q2 from rfl]
  rcases Nat.le_total (tauSum1 p q1 p' q2) (tauSum2 p q1 p' q2) with hle | hle
  · have hp : ((phiQ p q1 + phiQ p' q2) + (phiQ p q2 + phiQ p' q1)
        + (tauSum2 p q1 p' q2 - tauSum1 p q1 p' q2)) % 2 = 1 := by omega
    have hG : GqGen p q1 p' q2
        = DefPoly ((-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2)) (tauSum1 p q1 p' q2)
            (tauSum2 p q1 p' q2 - tauSum1 p q1 p' q2) := by
      simp only [GqGen, DefPoly]
      split
      · rfl
      · next h => exact absurd h (by omega)
    rw [hG, main_abstract (q : R) (phiQ p q1 + phiQ p' q2) (phiQ p q2 + phiQ p' q1)
      (tauSum1 p q1 p' q2) (tauSum2 p q1 p' q2) hle hp]
  · by_cases hE : tauSum1 p q1 p' q2 = tauSum2 p q1 p' q2
    · have hle' : tauSum1 p q1 p' q2 ≤ tauSum2 p q1 p' q2 := by omega
      have hp : ((phiQ p q1 + phiQ p' q2) + (phiQ p q2 + phiQ p' q1)
          + (tauSum2 p q1 p' q2 - tauSum1 p q1 p' q2)) % 2 = 1 := by omega
      have hG : GqGen p q1 p' q2
          = DefPoly ((-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2)) (tauSum1 p q1 p' q2)
              (tauSum2 p q1 p' q2 - tauSum1 p q1 p' q2) := by
        simp only [GqGen, DefPoly]
        split
        · rfl
        · next h => exact absurd h (by omega)
      rw [hG, main_abstract (q : R) (phiQ p q1 + phiQ p' q2) (phiQ p q2 + phiQ p' q1)
        (tauSum1 p q1 p' q2) (tauSum2 p q1 p' q2) hle' hp]
    · have hp : ((phiQ p q2 + phiQ p' q1) + (phiQ p q1 + phiQ p' q2)
          + (tauSum1 p q1 p' q2 - tauSum2 p q1 p' q2)) % 2 = 1 := by omega
      have hG : GqGen p q1 p' q2
          = DefPoly ((-1 : ℤ) ^ (phiQ p q2 + phiQ p' q1)) (tauSum2 p q1 p' q2)
              (tauSum1 p q1 p' q2 - tauSum2 p q1 p' q2) := by
        simp only [GqGen, DefPoly]
        split
        · next h => exact absurd h (by omega)
        · rfl
      rw [add_comm, hG, main_abstract (q : R) (phiQ p q2 + phiQ p' q1) (phiQ p q1 + phiQ p' q2)
        (tauSum2 p q1 p' q2) (tauSum1 p q1 p' q2) hle hp]

/-- On the odd-gap (antipodal) stratum, the unified defect polynomial IS the P0's Gq
(up to the parity-equal Q-choice): the dossier's G_q display is exactly right there. -/
theorem Gq_eq_GqGen_on_stratum {p q1 p' q2 : Block} (hpara : Para p q1 p' q2)
    (hT : (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2) % 2 = 1) :
    Gq p q1 p' q2 = GqGen p q1 p' q2 := by
  have hpar := ethParity p q1 p' q2 hpara
  rcases Nat.le_total (tauSum1 p q1 p' q2) (tauSum2 p q1 p' q2) with hle | hle
  · have hmin : tauMin p q1 p' q2 = tauSum1 p q1 p' q2 := by
      simp only [tauMin]; exact Nat.min_eq_left hle
    have hlen : 2 * kDef p q1 p' q2 + 1
        = tauSum2 p q1 p' q2 - tauSum1 p q1 p' q2 := by
      simp only [kDef, gapOdd, tauMin, Nat.min_eq_left hle]; omega
    rw [Gq, GqGen]
    split
    · rw [intCast_eq_C, ← Polynomial.C_pow, hmin, hlen]
    · next h => exact absurd h (by omega)
  · have hmin : tauMin p q1 p' q2 = tauSum2 p q1 p' q2 := by
      simp only [tauMin]; exact Nat.min_eq_right hle
    have hlen : 2 * kDef p q1 p' q2 + 1
        = tauSum1 p q1 p' q2 - tauSum2 p q1 p' q2 := by
      simp only [kDef, gapOdd, tauMin, Nat.min_eq_right hle]; omega
    have hQ : (-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2)
        = (-1 : ℤ) ^ (phiQ p q2 + phiQ p' q1) :=
      neg_one_pow_congr (by omega)
    rw [Gq, GqGen]
    split
    · next h => exact absurd h (by omega)
    · rw [intCast_eq_C, ← Polynomial.C_pow, hQ, hmin, hlen]

/-- **(M-stratum)**: the dossier's (M), restated with the honest hypothesis — the
odd-gap (antipodal) stratum. There it holds in exactly the P0/dossier form. -/
def MainIdentityStratum {R : Type*} [CommRing R] (q : Rˣ) : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2) % 2 = 1 →
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1
      = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

theorem mainStratum {R : Type*} [CommRing R] (q : Rˣ) : MainIdentityStratum q := by
  intro p q1 p' q2 hpara hT
  rw [Gq_eq_GqGen_on_stratum hpara hT]
  exact mainCor q p q1 p' q2 hpara

/-! ## §7. Milestone 4 — nondegeneracy; the degenerate branch closed. -/

/-- Off-stratum rigidity, equal-exponent case: when τ1 = τ2 the defect polynomial is 0
and the alternation survives EVERY q — the classical rule extends verbatim there. -/
theorem qRigid {R : Type*} [CommRing R] (q : Rˣ) {p q1 p' q2 : Block}
    (hpara : Para p q1 p' q2) (hE : tauSum1 p q1 p' q2 = tauSum2 p q1 p' q2) :
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1 = 0 := by
  have h0 := mainCor q p q1 p' q2 hpara
  have hG : GqGen p q1 p' q2 = 0 := by
    simp only [GqGen]
    rw [hE]
    split
    · rw [Nat.sub_self, Finset.sum_range_zero, mul_zero]
    · rw [Nat.sub_self, Finset.sum_range_zero, mul_zero]
  rw [hG, map_zero, mul_zero] at h0
  exact h0

/-- The P0's (N): TRUE (the witness quad is the §1 counter-quad; its Gq = 1 ≠ 0). -/
theorem nondegenerate : Nondegenerate := by
  refine ⟨(false, false, false), (true, false, false), (true, false, false),
    (false, false, false), ⟨rfl, by decide⟩, ?_⟩
  intro h0
  have h1 := congrArg (Polynomial.eval 1) h0
  simp only [Gq, tauSum1, tauSum2, tauMin, gapOdd, kDef, phiQ, tau, phi1, phi2, phi3,
    intCast_eq_C, ← Polynomial.C_pow, Polynomial.eval_mul, Polynomial.eval_pow,
    Polynomial.eval_X, Polynomial.eval_C, Polynomial.eval_zero,
    Finset.sum_range_one] at h1
  norm_num at h1

/-- FINDING F4, positive form: the deformation is NONDEGENERATE — on the antipodal
quad p = 110, q1 = 110, p′ = 001, q2 = 001 the alternation value at q = −1 is 2 ≠ 0.
(The unified defect there is GqGen = 1, so A + B = 1 − q.) -/
theorem alternation_fails_at_q_minus_one :
    sigmaQ (-1 : ℤˣ) (true, true, false) (true, true, false)
      * sigmaQ (-1 : ℤˣ) (false, false, true) (false, false, true)
      + sigmaQ (-1 : ℤˣ) (true, true, false) (false, false, true)
      * sigmaQ (-1 : ℤˣ) (false, false, true) (true, true, false)
      = 2 := by
  decide

/-- The degenerate branch (N′) is CLOSED: the alternation is NOT preserved for all q.
(The P0 def's `Type*` auto-bounds a universe that a polymorphic ¬ would freeze rigid —
runs 4–8 of the log — so the refutation instantiates it at universe 0; the .{u}
variants are universe-cosmetic: every fiber contains ULift ℤ and the same witness
transports. The witness value 2 ≠ 0 is separately certified by
`alternation_fails_at_q_minus_one`, which is axiom-lean [propext].) -/
theorem SigmaQ_Signs_all_q_refuted : ¬ SigmaQ_Signs_all_q.{0} := by
  intro h
  have h0 := @h ℤ _ (-1 : ℤˣ) (true, true, false) (true, true, false)
    (false, false, true) (false, false, true) ⟨rfl, by decide⟩
  rw [alternation_fails_at_q_minus_one] at h0
  norm_num at h0

/-! ## §8. Packaging + the in-file axiom-audit surface. -/

/-- The content-bearing regression: at the ℤ fiber q = 1, the CORRECTED main identity
plus the bridge recover eth's Signs (the deformation extends, never contradicts). -/
theorem mainCor_one_implies_signs (hM : MainIdentityCor (1 : ℤˣ)) (hB : BridgeAxiom) :
    Signs := by
  intro p q1 p' q2 h1 h2
  have h0 := hM p q1 p' q2 ⟨h1, h2⟩
  rw [show ((1 : ℤˣ) : ℤ) = 1 from rfl, sub_self, zero_mul,
    hB p q1, hB p' q2, hB p q2, hB p' q1] at h0
  exact h0

/-- The P0's anchor-corollary SHAPE. True — but (per §1) its `MainIdentity` hypothesis
is refuted at ℤ, q = −1, so the implication only holds through the unconditional
anchor; the honest version is `mainCor_one_implies_signs` above. -/
theorem mainImpliesSigns : MainImpliesSigns := by
  intro R _inst q hM hB hq
  exact signs_anchor

#print axioms phi_parts
#print axioms ethParity
#print axioms stratumComplement
#print axioms P1_refuted
#print axioms P2_refuted
#print axioms MainIdentity_refuted
#print axioms neg_one_pow_two_mul
#print axioms neg_one_pow_two_mul_succ
#print axioms neg_one_pow_congr
#print axioms neg_one_pow_add_eq_zero
#print axioms one_sub_mul_geom
#print axioms intCast_eq_C
#print axioms parity_bracket
#print axioms two_term_geom
#print axioms sigmaQ_prod
#print axioms aeval_geom
#print axioms main_abstract
#print axioms signs_anchor
#print axioms bridge_axiom
#print axioms bridge_pin_proof
#print axioms mainCor
#print axioms Gq_eq_GqGen_on_stratum
#print axioms mainStratum
#print axioms qRigid
#print axioms nondegenerate
#print axioms alternation_fails_at_q_minus_one
#print axioms SigmaQ_Signs_all_q_refuted
#print axioms mainCor_one_implies_signs
#print axioms mainImpliesSigns

end Pilot41
