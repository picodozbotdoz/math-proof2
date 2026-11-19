/-
Pilot 41 (H)-preflight probe — statement-rung ONLY (probe conventions: NOT a proof
artifact; Prop-valued defs + #check; zero sorry; not part of the core record).

Purpose (DECISION-4 promotion input, lane R4 unit 3, 2026-11-19): elaborate the
CORRECTED (H) binder-tier statements. The P0's HostTransport (precharter §1.6,
EnclOK convention — NOT an eth statement; eth's surface is the Signs/phi block)
inherits FINDING F1: its realizability hypothesis
  (∀ p p', ev (w p * w p') = sigmaQ q p p')
plus its conclusion is EXACTLY MainIdentity-as-a-Para-universal, machine-refuted in
Core.lean §1 (off-stratum quads: witness p=000,q1=100,p′=100,q2=000 reads 0=2 at
ℤ, q=−1). The two corrected forms below swap in the corrected defect (GqGen /
stratum-conditional Gq) and are the (H) charter's statement surface candidates.

Universe lesson applied (Core runs 4–8): statement defs with `Type*` elaborate fine;
any future lemma/refutation must instantiate universes deliberately.

The REAL (H) content is the realizability side (the dossier's finite TL search):
`TLRealizability` below is its statement shape — ∃ A, q = −A², ev, w realizing σ_q
on word products. At binder tier it is only ELABORATED, not claimed.
-/
import Mathlib

namespace Pilot41H

/-! ## §0 surface copies (verbatim from Core.lean §0/§6; statement-tier only) -/

abbrev Block : Type := Bool × Bool × Bool

def bxor (p q : Block) : Block := (p.1 ^^ q.1, p.2.1 ^^ q.2.1, p.2.2 ^^ q.2.2)

def phiQ (p q : Block) : ℕ :=
  p.1.toNat * q.1.toNat + p.1.toNat * q.2.1.toNat + p.1.toNat * q.2.2.toNat
    + p.2.1.toNat * q.2.1.toNat + p.2.1.toNat * q.2.2.toNat + p.2.2.toNat * q.2.2.toNat

def phi1 (p q : Block) : ℕ := q.1.toNat * p.2.1.toNat * p.2.2.toNat
def phi2 (p q : Block) : ℕ := p.1.toNat * q.2.1.toNat * p.2.2.toNat
def phi3 (p q : Block) : ℕ := p.1.toNat * p.2.1.toNat * q.2.2.toNat

def tau (p q' : Block) : ℕ := phi1 p q' + phi2 p q' + phi3 p q'

variable {R : Type*} [CommRing R]

def sigmaQ (q : Rˣ) (p q' : Block) : R :=
  (-1 : R) ^ phiQ p q' * (-(q : R)) ^ tau p q'

def Para (p q1 p' q2 : Block) : Prop := bxor p q1 = bxor p' q2 ∧ q1 ≠ q2

def tauSum1 (p q1 p' q2 : Block) : ℕ := tau p q1 + tau p' q2
def tauSum2 (p q1 p' q2 : Block) : ℕ := tau p q2 + tau p' q1
def tauMin (p q1 p' q2 : Block) : ℕ := min (tauSum1 p q1 p' q2) (tauSum2 p q1 p' q2)
def gapOdd (p q1 p' q2 : Block) : ℕ := tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2
def kDef (p q1 p' q2 : Block) : ℕ := (gapOdd p q1 p' q2 - 2 * tauMin p q1 p' q2 - 1) / 2

open Polynomial

noncomputable def Gq (p q1 p' q2 : Block) : Polynomial ℤ :=
  ((-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2) : Polynomial ℤ)
    * (-X) ^ tauMin p q1 p' q2
    * ∑ j ∈ Finset.range (2 * kDef p q1 p' q2 + 1), (X : Polynomial ℤ) ^ j

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

/-! ## (H) binder statements, CORRECTED (the charter's candidates) -/

/-- (H-corrected, unified form): if ev realizes σ_q on the w-word products and
q = −A², the TL-evaluation identity holds with the CORRECTED defect GqGen at every
parallelogram quad. (Propositionally derivable from the core's mainCor by composing
the realizability hypothesis — the (H) milestone's own content is the ∃-side.) -/
def HostTransportCor {R : Type*} [CommRing R] (A : Rˣ) (q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) : Prop :=
  (q : R) = -((A : R) ^ 2) →
    (∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') →
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (GqGen p q1 p' q2)

/-- (H-corrected, stratum form): same, with the dossier's original G_q on the
antipodal stratum (mirrors the core's MainIdentityStratum). -/
def HostTransportStratum {R : Type*} [CommRing R] (A : Rˣ) (q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) : Prop :=
  (q : R) = -((A : R) ^ 2) →
    (∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') →
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2) % 2 = 1 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

/-- The (H) REALIZABILITY target (the finite-search assertion's shape): there exist
A, q = −A², an evaluation, and eight 3-strand words w_p realizing σ_q on word
products over ℂ. Statement shape only at binder tier — the tauceti dictionary
(jones, jonesDelta, Markov/Hecke trace) and the TL_3(δ) search are the (H)
milestone's content, NOT this preflight's. -/
def TLRealizability : Prop :=
  ∃ (A q : ℂˣ) (ev : FreeMonoid (Fin 2) → ℂ) (w : Block → FreeMonoid (Fin 2)),
    (q : ℂ) = -((A : ℂ) ^ 2) ∧
      ∀ p p' : Block, ev (w p * w p') = sigmaQ q p p'

#check @HostTransportCor
#check @HostTransportStratum
#check @TLRealizability

end Pilot41H
