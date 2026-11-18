/-
Pilot 41 P0 — q-deformed-eight-square, statement rung (CANDIDATE, UNFIRED).

Status: candidate file extracted verbatim from the pre-charter spec
  `research/qa/iter4-review/a6-41-p0-precharter.md` §1 (lane A6, 2026-11-18; committed
  `7fe38e8`). NOT a proof artifact: this is the statement/faithfulness rung for the
  ruled iteration-5 opener (pilot 41 = CHARTER, `research/INDEX.md:290`) — the (M)/(N)
  targets and (H) here are HYPOTHESES until the pilot core lands kernel-clean. No
  `sorry`, no `native_decide`, no external CAS; zero-sorry by construction (Prop-valued
  defs + `#check`; the ONLY proof token is the port's own definitional `rfl` at
  `phi_parts`, eth `SecCrossing_Identity.lean:136` verbatim). Candidate-unfired class:
  nothing in this file has been elaborated on any substrate yet.

Claim discipline (locked, preflight §1 / round-3 `novelty/round-3.md:50–70`): headline
= "first sign-rule/parallelogram-defect deformation"; NEVER "first q-deformation of a
composition algebra" (Benkart–Pérez-Izquierdo 1998, arXiv:math/9801141, owns the
q-composition object level).

Erratum note: the Gq def below is the CORRECTED form (dossier-41's (M)-display carried
two mis-prints — summand q^j positive, and 2k+1 = gapOdd − 2·τmin; dated ERRATUM block
stamped in the dossier 2026-11-18; derivation at the precharter's Gq comment).

FIRING INSTRUCTION (for the chartered lane; NO FIRING from this file's existence):
  one run, expected GREEN; +1 fix-loop budgeted for the two flagged mechanical spots
  (the ℤ→ℤ[X] coefficient coercion in Gq; the aeval ℤ-algebra instance in
  MainIdentity — if either fights at the pin, apply the precharter's §1.8 notes:
  `Polynomial.C`-wrap the scalar, or the map-form restatement; record any named
  pin-adjustment in-file per the D3 precedent). Gates G-P0(a)–(c) per the precharter
  §4; on (a)+(b) GREEN the pilot core (dossier milestones 1–4) charters.

Self-consistency pass (on paper, 2026-11-18, vs the read-verified eth sources):
  Block/bxor/phi/sigma/Signs verbatim vs `proof/statements/EightSquareStatement.lean:37–53`;
  phiQ/phi1/phi2/phi3 + phi_parts verbatim vs `proof/networks/Eight/
  SecCrossing_Identity.lean:126–136`; all new names (tau, sigmaQ, Para, tauSum1/2,
  tauMin, gapOdd, kDef, Gq, MainIdentity, BridgeAxiom, P1, P2, Nondegenerate,
  SigmaQ_Signs_all_q, MainImpliesSigns, bridge_pin, HostTransport) resolve within this
  namespace; ℕ-exponents only (no zpow); no proofs beyond the definitional rfl.
-/
import Mathlib

namespace Pilot41

/-! ## eth port block (verbatim from proof/statements/EightSquareStatement.lean:37–53) -/

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

/-! ## eth component defs (verbatim from proof/networks/Eight/SecCrossing_Identity.lean:126–136) -/

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

/-! ## the deformation (new defs — the P0's own content; precharter §1.3) -/

/-- τ(p,q′) := the three cubic exponents collected. -/
def tau (p q' : Block) : ℕ := phi1 p q' + phi2 p q' + phi3 p q'

variable {R : Type*} [CommRing R]

/-- **σ_q(p,q′) := (−1)^{φQ(p,q′)} · (−q)^{τ(p,q′)}** — the q-deformed Graves sign
(dossier "Definition (the deformation)"). The deformation enters ONLY through the cubic
part; the quadratic part stays the classical sign. -/
def sigmaQ (q : Rˣ) (p q' : Block) : R :=
  (-1 : R) ^ phiQ p q' * (-(q : R)) ^ tau p q'

/-- The parallelogram hypothesis pair as an abbreviation. -/
def Para (p q1 p' q2 : Block) : Prop := bxor p q1 = bxor p' q2 ∧ q1 ≠ q2

/-- τ-min, the gap, and k (dossier G_q display + step-2 algebra). Under (P2),
τ₁+τ₂ = gapOdd is odd, and |τ₁−τ₂| = gapOdd − 2·τmin = 2k+1 defines k. -/
def tauSum1 (p q1 p' q2 : Block) : ℕ := tau p q1 + tau p' q2
def tauSum2 (p q1 p' q2 : Block) : ℕ := tau p q2 + tau p' q1
def tauMin (p q1 p' q2 : Block) : ℕ := min (tauSum1 p q1 p' q2) (tauSum2 p q1 p' q2)
def gapOdd (p q1 p' q2 : Block) : ℕ := tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2  -- P2 says this is Odd; τ₁−τ₂ odd ⟺ τ₁+τ₂ odd
def kDef (p q1 p' q2 : Block) : ℕ := (gapOdd p q1 p' q2 - 2 * tauMin p q1 p' q2 - 1) / 2

open Polynomial

/-- **G_q : Block⁴ → ℤ[X]** — the explicit defect polynomial:
(−1)^{Q₁}·(−X)^{τmin}·Σ_{j=0}^{2k} X^j, geometric-sum shape, ALL exponents nonneg
(the polynomial-home pin: no Laurent needed). NOTE — dossier-display erratum, corrected
here per the dossier's own step-2 algebra ("F_q = (−1)^{Q₁}(−q)^{τmin}·(1+(−q)^{2k+1})
and 1+(−q)^{2k+1} = 1−q^{2k+1} = (1−q)Σ_{j≤2k} q^j"): the geometric factor's summand is
**X^j** (positive), not (−X)^j as the dossier's (M) display line mis-prints; and
2k+1 = |τ₁−τ₂| = gapOdd − 2·τmin (NOT gapOdd − 1). Erratum stamped in the dossier
2026-11-18; this file carries the corrected form. -/
def Gq (p q1 p' q2 : Block) : Polynomial ℤ :=
  ((-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2) : Polynomial ℤ)
    * (-X) ^ tauMin p q1 p' q2
    * ∑ j ∈ Finset.range (2 * kDef p q1 p' q2 + 1), (X : Polynomial ℤ) ^ j

/-! ## the target statements (Prop-valued defs — the zero-sorry rung; precharter §1.4) -/

/-- **(M) the main identity** (evaluated form; quantifier order per the dossier's Lean line).
    Gq is consumed through `aeval q` — valid for every CommRing R and unit q since Gq ∈ ℤ[X]. -/
def MainIdentity (R : Type*) [CommRing R] (q : Rˣ) : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1
      = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

/-- **(B) the bridge axiom** — the q = 1 fiber recovers eth's σ (definition-level fact per
    the dossier; provable from `phi_parts` + `pow_add`, precharter §1.7 — not proved here). -/
def BridgeAxiom : Prop := ∀ p q' : Block, sigmaQ (1 : ℤˣ) p q' = sigma p q'

/-- **(P1)** the quadratic parity fact (decide-able over the 4096 quadruples). -/
def P1 : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    (phiQ p q1 + phiQ p' q2) % 2 = (phiQ p q2 + phiQ p' q1) % 2

/-- **(P2)** the cubic four-sum parity fact (decide-able; eth's four_phi_odd split by parts). -/
def P2 : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 → Odd (gapOdd p q1 p' q2)

/-- **(N) nondegeneracy** — ∃ a parallelogram quadruple with G_q ≠ 0 (equivalently the
    alternation FAILS at, e.g., q = 2; kernel-decidable). -/
def Nondegenerate : Prop :=
  ∃ p q1 p' q2 : Block, Para p q1 p' q2 ∧ Gq p q1 p' q2 ≠ 0

/-- **(N′) the degenerate branch** — every q preserves the alternation (bankable weaker
    outcome if the decide refutes (N); still a corollary-grade finding, dossier F5(ii)). -/
def SigmaQ_Signs_all_q : Prop :=
  ∀ {R : Type*} [CommRing R] (q : Rˣ), ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1 = 0

/-- **(M) ⇒ Signs at q = 1** — the anchor corollary shape (regression: the deformation
    extends eth's theorem, never contradicts it). -/
def MainImpliesSigns : Prop :=
  ∀ {R : Type*} [CommRing R] (q : Rˣ), MainIdentity R q → BridgeAxiom → (q : R) = 1 → Signs

/-! ## regression pin (precharter §1.5) -/

/-- The (B) instance to print in-run: one concrete block pair, evaluated both sides.
    (Statement-tier pin; the concrete check closes by `norm_num [sigmaQ, sigma, tau,
    phiQ, phi1, phi2, phi3, phi]` or kernel `decide` — prove it in-P0 only if free.) -/
def bridge_pin : Prop :=
  sigmaQ (1 : ℤˣ) (true, false, true) (false, true, false)
    = sigma (true, false, true) (false, true, false)

/-! ## (H) at binder tier (EnclOK convention — the ONLY donor-shaped input; precharter §1.6) -/

/-- Abstract 3-strand diagram-algebra evaluation. At binder tier `ev` is an opaque
multiplicative-functional shape on the free braid word monoid; the tauceti-side
dictionary (jones A, jonesDelta A = −(A²+A⁻²), Markov/Hecke trace, UqSl2 normalization)
is the (H) MILESTONE's content, NOT the P0's. If (H) charters, tauceti enters as a
same-toolchain direct dependency and the Cycle-2 donor-hygiene triad runs at statement
level on tauceti's pin FIRST (preflight §4). -/
def HostTransport {R : Type*} [CommRing R] (A : Rˣ) (q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) : Prop :=
  (q : R) = -((A : R) ^ 2) →
    (∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') →
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

#check @MainIdentity
#check @Nondegenerate
#check @HostTransport
#check @bridge_pin

end Pilot41
