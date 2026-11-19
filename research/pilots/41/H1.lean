/-
Pilot 41 H1 — (H) tranche 1 (CHARTERED unit, orchestrator promotion ruling 2026-11-19;
DECISION-4 gate conditions met: core S–M GREEN + preflight CONDITIONAL-GO).

Binding conditions (verbatim from the ruling): corrected statements ONLY (the P0
HostTransport wording is F1-defective and BARRED); tauceti donor-hygiene triad FIRST
(statement-binder class, no-consumption rule); first-tranche cap ≤ 1.5k LoC / ≤ 9 runs
(this file ≈ 0.7k LoC); decide-only search (no native_decide ever); own-file
bookkeeping from tranche 1 (second-discovery-own-file adjudication stands); re-price
checkpoint at tranche close.

Structure:
  §T  tauceti donor-hygiene — statement-binder class, FIRST in file and fired FIRST
      (logs/h1-run1.log): verbatim quotes of the five named donor decls (file:line)
      + on-pin binder-tier shape-analogs + #print axioms at statement level. NO
      tauceti module is imported or consumed; the on-tauceti-pin `#print axioms`
      (Cycle-2 gold standard) is DEFERRED to actual-import time (tranche 2+, if ever)
      per the no-consumption rule.
  §0  surface copies (verbatim from Core.lean §0/§6 — the corrected GqGen surface).
  §1  the corrected (H) statement surface (H-preflight GREEN shapes).
  §2  the transport direction, banked: the core's step-2 machinery (copied verbatim
      from the GREEN Core.lean — same proofs, same names, primed where needed) +
      `hostTransportCor` / `hostTransportStratum` (realizability hypothesis × mainCor
      composition). The q = −A² fiber is dictionary-side; it is carried as a
      hypothesis and not used by the transport algebra.
  §3  the TL_3(δ) search's FIRST decide-encoding milestone — the TRACIALITY
      OBSTRUCTION: any TRACIAL evaluation realizing σ_q on w-word products forces
      σ_q symmetric, but σ_q is NOT symmetric (witness (p,p′) = (100,110): values
      1 vs −1 at q = −1, kernel decide). Consequence (recorded, gates the (H)
      charter's dictionary): Markov/Hecke-TRACE-per-word realizations of σ_q are
      IMPOSSIBLE; the (H) dictionary must be NON-tracial (tangle/Kauffman-bracket
      evaluations, as the dossier's skein phrasing already reads). The bare binder
      `TLRealizability` (arbitrary ev) is thereby known to carry no content — its
      constructive triviality is noted, not built here (tranche-2 decision).

Kernel-only: no `sorry`, no `native_decide`, no external CAS; statements Prop-valued;
`noncomputable` pre-marked (P0 finding 1). Universe lesson (core runs 4–8) applied:
refutations are stated at FIXED ℤ, never over auto-bound `Type*`.
-/
import Mathlib

namespace Pilot41H1

/-! ## §T. Tauceti donor-hygiene — statement-binder class (fired FIRST; no consumption)

Donor decls (read-verified at the local tauceti checkout, same toolchain
v4.36.0-rc2, 2026-11-19); NOTHING below imports tauceti — these are quotes plus
mathlib-elaborable shape-analogs, per the corpus statement-port finding (B1–F) and
the EnclOK/ProbeE hypothesis-binder precedent:

1. `TauCeti/KnotTheory/TemperleyLieb.lean:87` —
     `def jonesDelta (a : Rˣ) : R := -((a : R) ^ 2 + ((a⁻¹ : Rˣ) : R) ^ 2)`
   (verbatim below — it is mathlib-only, so this copy IS verbatim).
2. `TemperleyLieb.lean:146` — `def jones (a : Rˣ) : BraidGroup n →*
   (TemperleyLieb R (jonesDelta a) n)ˣ` — the Jones representation (braid lift with
   Kauffman crossing expansion). Shape-analog below (`JonesHomShape`).
3. `TemperleyLieb.lean:157` — the crossing-expansion unit `jonesUnit`/
   `jones_sigma` simp form — folded into `JonesHomShape`.
4. `TauCeti/KnotTheory/Hecke.lean:49` — `theorem MarkovBraid.eq_heckeTrace_of_skein`
   (the skein characterization of the normalized Hecke/Oceneanu trace). Shape-analog
   below (`SkeinRelationShape`).
5. `TauCeti/QuantumGroups/UqSl2/QuantumTrace.lean:41` —
     `theorem trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` (the two quantum traces
   agree: tr(K∘φ) = tr(K⁻¹∘φ)). Shape-analog below (`QuantumTraceShape`). -/

/-- VERBATIM tauceti TemperleyLieb.lean:87 (mathlib-only def — a true verbatim copy).
The loop value δ = −(a² + a⁻²) at which the Jones representation is defined. -/
def jonesDelta {R : Type*} [CommRing R] (a : Rˣ) : R :=
  -((a : R) ^ 2 + ((a⁻¹ : Rˣ) : R) ^ 2)

/-- Shape-analog of tauceti `jones`/`jonesUnit`/`jones_sigma` (:146/:157): a braid
lift into units whose elementary-crossing values have the Kauffman expansion
a • 1 + a⁻¹ • eᵢ. Binder tier — the braid group and TL algebra are opaque. -/
def JonesHomShape {R : Type*} [CommRing R] {M : Type*} [Semiring M] [Algebra R M]
    {n : ℕ} {G : Type*} [Group G] (a : Rˣ) (e : Fin (n - 1) → M)
    (lift : G →* Mˣ) (braidSigma : Fin (n - 1) → G) : Prop :=
  ∀ i : Fin (n - 1), ((lift (braidSigma i) : Mˣ) : M) = (a : R) • 1 + ((a⁻¹ : Rˣ) : R) • e i

/-- Shape-analog of tauceti `MarkovBraid.eq_heckeTrace_of_skein` (Hecke.lean:49):
the skein relation l⁻¹·F(cross c) − l·F(uncross c) = (q − q⁻¹)·F(c). Binder tier. -/
def SkeinRelationShape {R : Type*} [CommRing R] (q l : Rˣ) {β : Type*}
    (cross uncross : β → β) (F : β → R) : Prop :=
  ∀ c : β, ((l⁻¹ : Rˣ) : R) * F (cross c) - (l : R) * F (uncross c)
    = ((q : R) - ((q⁻¹ : Rˣ) : R)) * F c

/-- Shape-analog of tauceti `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp`
(QuantumTrace.lean:41): the two quantum traces agree, tr(k·φ) = tr(k⁻¹·φ). Binder
tier (the UqSl2 dressing is opaque; k/kInv abstract the K/K⁻¹ scalars). -/
def QuantumTraceShape {V : Type*} [AddCommGroup V] [Module ℂ V] [FiniteDimensional ℂ V]
    (k kInv : ℂ) (φ : V →ₗ[ℂ] V) : Prop :=
  LinearMap.trace ℂ V ((k • (LinearMap.id : V →ₗ[ℂ] V)) ∘ₗ φ)
    = LinearMap.trace ℂ V ((kInv • (LinearMap.id : V →ₗ[ℂ] V)) ∘ₗ φ)

#print axioms jonesDelta
#print axioms JonesHomShape
#print axioms SkeinRelationShape
#print axioms QuantumTraceShape

/-! ## §0. Surface copies (verbatim from Core.lean §0/§6 — the corrected surface) -/

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

/-! ## §1. The corrected (H) statement surface (H-preflight GREEN shapes) -/

/-- (H-corrected, unified form): if ev realizes σ_q on the w-word products and
q = −A², the evaluation identity holds with the CORRECTED defect GqGen at every
parallelogram quad. Discharged in §2 (`hostTransportCor`). -/
def HostTransportCor (A : Rˣ) (q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) : Prop :=
  (q : R) = -((A : R) ^ 2) →
    (∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') →
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (GqGen p q1 p' q2)

/-- (H-corrected, stratum form): same with the dossier's original G_q on the
antipodal stratum. Discharged in §2 (`hostTransportStratum`). -/
def HostTransportStratum (A : Rˣ) (q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) : Prop :=
  (q : R) = -((A : R) ^ 2) →
    (∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') →
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2) % 2 = 1 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

/-- The (H) realizability ∃-shape over ℂ. KNOWN to carry no content at binder tier
(arbitrary ev): code-word w + table-defined ev satisfies it constructively. The
content-bearing variants are the CONSTRAINED ones — see §3's traciality obstruction
(traces are impossible) and the tranche-2 tangle/Kauffman-bracket dictionary. -/
def TLRealizability : Prop :=
  ∃ (A q : ℂˣ) (ev : FreeMonoid (Fin 2) → ℂ) (w : Block → FreeMonoid (Fin 2)),
    (q : ℂ) = -((A : ℂ) ^ 2) ∧
      ∀ p p' : Block, ev (w p * w p') = sigmaQ q p p'

/-! ## §2. The transport direction (banked): core step-2 machinery copied VERBATIM
from the GREEN Core.lean (runs 1–9, logs/core-run*.log) + the two transports. -/

/-- The engine (Core.lean §2, decide-certified). -/
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

theorem one_sub_mul_geom {R : Type*} [CommRing R] (x : R) (n : ℕ) :
    (1 - x) * ∑ j ∈ Finset.range n, x ^ j = 1 - x ^ n := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ, mul_add, ih, pow_succ]
    ring

theorem intCast_eq_C (c : ℤ) : ((c : ℤ) : Polynomial ℤ) = Polynomial.C c := by
  rw [← Polynomial.C_eq_intCast, Int.cast_id]

theorem parity_bracket {R : Type*} [CommRing R] (x : R) (a b g : ℕ)
    (h : (a + b + g) % 2 = 1) :
    (-1 : R) ^ a + (-1 : R) ^ b * (-x) ^ g = (-1 : R) ^ a * (1 - x ^ g) := by
  rw [neg_pow x g, ← mul_assoc, ← pow_add]
  have hbg : (b + g) % 2 = (a + 1) % 2 := by omega
  rw [neg_one_pow_congr hbg, pow_add, pow_one]
  ring

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

theorem sigmaQ_prod {R : Type*} [CommRing R] (q : Rˣ) (a b c d : Block) :
    sigmaQ q a b * sigmaQ q c d
      = (-1 : R) ^ (phiQ a b + phiQ c d) * (-(q : R)) ^ (tau a b + tau c d) := by
  have key : (-1 : R) ^ (phiQ a b + phiQ c d) * (-(q : R)) ^ (tau a b + tau c d)
      = (-1 : R) ^ phiQ a b * (-(q : R)) ^ tau a b
        * ((-1 : R) ^ phiQ c d * (-(q : R)) ^ tau c d) := by
    rw [pow_add, pow_add]; ring
  simp only [sigmaQ]
  rw [← key]

noncomputable def DefPoly (c : ℤ) (s n : ℕ) : Polynomial ℤ :=
  Polynomial.C c * (-(Polynomial.X : ℤ[X])) ^ s
    * ∑ j ∈ Finset.range n, (Polynomial.X : ℤ[X]) ^ j

theorem aeval_geom {R : Type*} [CommRing R] (x : R) (c : ℤ) (s n : ℕ) :
    Polynomial.aeval x (DefPoly c s n)
      = algebraMap ℤ R c * (-x) ^ s * ∑ j ∈ Finset.range n, x ^ j := by
  simp only [DefPoly, map_mul, map_sum, map_pow, map_neg, Polynomial.aeval_C,
    Polynomial.aeval_X]

theorem main_abstract {R : Type*} [CommRing R] (x : R) (a b s t : ℕ) (hle : s ≤ t)
    (h : (a + b + (t - s)) % 2 = 1) :
    (-1 : R) ^ a * (-x) ^ s + (-1 : R) ^ b * (-x) ^ t
      = (1 - x) * Polynomial.aeval x (DefPoly ((-1 : ℤ) ^ a) s (t - s)) := by
  rw [two_term_geom x a b s t hle h, aeval_geom, map_pow, map_neg, map_one]
  -- (the rw chain closes by rfl: both sides land on the same normal form)

/-- (M-corrected), per-quad form (Core.lean's mainCor). -/
theorem mainCor' {R : Type*} [CommRing R] (q : Rˣ) (p q1 p' q2 : Block)
    (hpara : Para p q1 p' q2) :
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1
      = (1 - (q : R)) * Polynomial.aeval (q : R) (GqGen p q1 p' q2) := by
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

/-- On the antipodal stratum the unified defect IS the dossier's G_q (Core.lean). -/
theorem Gq_eq_GqGen_on_stratum' {p q1 p' q2 : Block} (hpara : Para p q1 p' q2)
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

/-- (M-stratum), per-quad form (Core.lean's mainStratum). -/
theorem mainStratum' {R : Type*} [CommRing R] (q : Rˣ) (p q1 p' q2 : Block)
    (hpara : Para p q1 p' q2) (hT : (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2) % 2 = 1) :
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1
      = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2) := by
  rw [Gq_eq_GqGen_on_stratum' hpara hT]
  exact mainCor' q p q1 p' q2 hpara

/-- **The transport direction, unified form** (banked via mainCor): any (ev, w)
realizing σ_q on word products satisfies the corrected defect identity at every
parallelogram quad. The q = −A² fiber is dictionary-side (carried, not used here). -/
theorem hostTransportCor {R : Type*} [CommRing R] (A q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2))
    (hq : (q : R) = -((A : R) ^ 2))
    (hreal : ∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') :
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (GqGen p q1 p' q2) := by
  intro p q1 p' q2 hpara
  rw [hreal p q1, hreal p' q2, hreal p q2, hreal p' q1]
  exact mainCor' q p q1 p' q2 hpara

theorem hostTransportCor_full {R : Type*} [CommRing R] (A q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) :
    HostTransportCor A q ev w := by
  intro _hq hreal
  exact hostTransportCor A q ev w _hq hreal

/-- **The transport direction, stratum form.** -/
theorem hostTransportStratum {R : Type*} [CommRing R] (A q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2))
    (hq : (q : R) = -((A : R) ^ 2))
    (hreal : ∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') :
    ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
      (tauSum1 p q1 p' q2 + tauSum2 p q1 p' q2) % 2 = 1 →
      ev (w p * w q1) * ev (w p' * w q2) + ev (w p * w q2) * ev (w p' * w q1)
        = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2) := by
  intro p q1 p' q2 hpara hT
  rw [hreal p q1, hreal p' q2, hreal p q2, hreal p' q1]
  exact mainStratum' q p q1 p' q2 hpara hT

theorem hostTransportStratum_full {R : Type*} [CommRing R] (A q : Rˣ)
    (ev : FreeMonoid (Fin 2) → R) (w : Block → FreeMonoid (Fin 2)) :
    HostTransportStratum A q ev w := by
  intro _hq hreal p q1 p' q2 hpara hT
  exact hostTransportStratum A q ev w _hq hreal p q1 p' q2 hpara hT

/-! ## §3. The TL_3(δ) search's FIRST decide-encoding milestone: the TRACIALITY
OBSTRUCTION. Any tracial evaluation realizing σ_q forces σ_q symmetric; σ_q is not
symmetric (kernel decide at the witness pair). Hence Markov/Hecke-TRACE-per-word
realizations are IMPOSSIBLE, and the (H) dictionary must be non-tracial
(tangle/Kauffman-bracket evaluations — the dossier's own skein phrasing). -/

/-- σ_q is NOT symmetric — kernel decide at q = −1, pair (100, 110): values 1, −1. -/
theorem sigmaQ_asym_witness :
    sigmaQ (-1 : ℤˣ) (true, false, false) (true, true, false) = 1
      ∧ sigmaQ (-1 : ℤˣ) (true, true, false) (true, false, false) = -1 := by
  constructor <;> decide

/-- Tracial realizability (per-word, at fixed ℤ — universe lesson applied). -/
def TracialRealizability (q : ℤˣ) : Prop :=
  ∃ (ev : FreeMonoid (Fin 2) → ℤ) (w : Block → FreeMonoid (Fin 2)),
    (∀ p p' : Block, ev (w p * w p') = sigmaQ q p p') ∧
      (∀ u v : FreeMonoid (Fin 2), ev (u * v) = ev (v * u))

/-- **The traciality obstruction** (tranche-1 milestone, decide-encoded): NO tracial
evaluation realizes σ_q on word products at q = −1. Proof: traciality applied at the
witness words gives σ_q(100,110) = σ_q(110,100), i.e. 1 = −1. -/
theorem tracial_realizability_refuted : ¬ TracialRealizability (-1 : ℤˣ) := by
  rintro ⟨ev, w, hreal, htr⟩
  have h1 := htr (w (true, false, false)) (w (true, true, false))
  rw [hreal (true, false, false) (true, true, false),
    hreal (true, true, false) (true, false, false)] at h1
  rw [sigmaQ_asym_witness.1, sigmaQ_asym_witness.2] at h1
  exact absurd h1 (by decide)

#print axioms ethParity
#print axioms mainCor'
#print axioms Gq_eq_GqGen_on_stratum'
#print axioms mainStratum'
#print axioms hostTransportCor
#print axioms hostTransportCor_full
#print axioms hostTransportStratum
#print axioms hostTransportStratum_full
#print axioms sigmaQ_asym_witness
#print axioms tracial_realizability_refuted

end Pilot41H1
