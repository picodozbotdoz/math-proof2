# A6 — Pilot-41 P0 PRE-CHARTER spec (copy-paste-ready; the orchestrator typesets the charter at iter-5 open)

Lane A6 (worktree agent-07), 2026-11-18, wave-3 re-task. Pilot 41 = **q-deformed-eight-square**,
ruled **CHARTER — the iteration-5 opener** (`research/INDEX.md:290`; preflight
`research/pilots/41/preflight.md:85`). This document is the ready-to-fire P0: statement set,
donor/binder inventory, runner plan, budget, gates, descope ladder. It is a CANDIDATE spec —
the executing lane owns `pilots/41/` once chartered. Everything below was drafted from
at-source reads (eth files re-read this session, line numbers verified 2026-11-18); no Modal
runs were needed (statement-port class, ≈ 0 expected per the B1–F corpus finding).

## 0. Scope + claim discipline (locked, carried from the preflight/dossier)

- Core = **(M) parallelogram defect identity + (N) nondegeneracy + (B) the q = 1 fiber**
  over the q-deformed Graves sign family σ_q. **(H)** (the octonion–Temperley–Lieb host
  theorem) is a SEPARATE second-phase milestone with its own gate — NOT in P0 scope beyond
  the binder-tier statement skeleton (§1.6).
- Headline wording LOCKED by R8 round-3 (`novelty/round-3.md:50–70`): "first
  **sign-rule/parallelogram-defect** deformation". NEVER "first q-deformation of a
  composition algebra" — Benkart–Pérez-Izquierdo 1998 (arXiv:math/9801141) owns the
  q-composition object level. Nearest-miss citations mandatory in any article:
  eth `Eight.signs` (q = 1, mod-2 proof), R7's q = 1 cocycle reading
  (`bridges/tensor-algebra.md` §2a), tauceti `CayleyDickson/Quaternion.lean` "Degen's
  eight-square identity", Kauffman bracket skein calculus, fermionic ordering signs
  (bilinear only) — the dossier's five (`candidates/41-…-temperley-lieb.md:155–160`).
- Billing class: DISCOVERY-grade pilot ((M)+(N) plausibly new; (H) NEW — no octonion–TL
  connection in any sweep, dossier Novelty §corpus + round-3). Kernel-only: no `sorry`,
  no `native_decide` (finite checks are kernel `decide` at 8⁴ = 4096 over ℕ/ℤ), no
  external CAS.

## 1. The P0 statement set (`pilots/41/P0.lean`, full draft — copy-paste)

Design pin (the preflight's §5 item 2, pinned here in the header as instructed): **the
polynomial home is `Polynomial ℤ` with evaluation via `Polynomial.aeval` — NO Laurent
polynomials are needed**, because every exponent that appears is nonneg: τ, τmin, the
geometric-sum index j ≤ 2k, and the defect factor is (1 − q). The P0 exists to prove this
pin typechecks. Zero-sorry statement rung per the wave-2 probe-class ruling: every target
lives as a Prop-valued `def` (elaboration check, always Step-A-safe); the three cheap
proofs ((B), P1/P2-discharge options) are listed in §1.7 as optional in-P0 theorems.

```lean
/-
Pilot 41 P0 — q-deformed-eight-square, statement rung (zero-sorry: Prop defs + #check only).
Provenance: drafted 2026-11-18 (lane A6, pre-charter spec a6-41-p0-precharter.md);
  substrate mathlib ff2494ea5e43…, Lean v4.36.0-rc2, warm crossmath-probe.
Conventions: eth defs below are VERBATIM-marked probe copies (anthropics_formal-math/eth,
  read-only sibling) — statement-port scaffold per the port-probe corpus finding
  (FEASIBILITY-SUMMARY B1–F: statement-port cost ≈ 0 corpus-wide). No eth THEOREM is
  imported at core scope; the parity chain is transcribed at pilot-core time (D-tranche
  pattern). This file is not a proof artifact for (M)/(N)/(H): those are pilot-core
  milestones. Claim discipline per preflight §1 / round-3 (defect-deformation headline).
-/
import Mathlib

namespace Pilot41

/-! ## §1.1 eth port block (verbatim from proof/statements/EightSquareStatement.lean:37–53) -/

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

/-! ## §1.2 eth component defs (verbatim from proof/networks/Eight/SecCrossing_Identity.lean:126–133) -/

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

/-! ## §1.3 the deformation (new defs — the P0's own content) -/

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
2k+1 = |τ₁−τ₂| = gapOdd − 2·τmin (NOT gapOdd − 1). Erratum report-only (the dossier is
R1's file); this spec + the P0 carry the corrected form. -/
def Gq (p q1 p' q2 : Block) : Polynomial ℤ :=
  ((-1 : ℤ) ^ (phiQ p q1 + phiQ p' q2) : Polynomial ℤ)
    * (-X) ^ tauMin p q1 p' q2
    * ∑ j ∈ Finset.range (2 * kDef p q1 p' q2 + 1), (X : Polynomial ℤ) ^ j

/-! ## §1.4 the target statements (Prop-valued defs — the zero-sorry rung) -/

/-- **(M) the main identity** (evaluated form; quantifier order per the dossier's Lean line).
    Gq is consumed through `aeval q` — valid for every CommRing R and unit q since Gq ∈ ℤ[X]. -/
def MainIdentity (R : Type*) [CommRing R] (q : Rˣ) : Prop :=
  ∀ p q1 p' q2 : Block, Para p q1 p' q2 →
    sigmaQ q p q1 * sigmaQ q p' q2 + sigmaQ q p q2 * sigmaQ q p' q1
      = (1 - (q : R)) * Polynomial.aeval (q : R) (Gq p q1 p' q2)

/-- **(B) the bridge axiom** — the q = 1 fiber recovers eth's σ (definition-level fact per
    the dossier; provable in-P0 from `phi_parts` + `pow_add`, §1.7). -/
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

/-! ## §1.5 regression pins (q = 1 + the eth anchor) -/

/-- The (B) instance to print in-run: one concrete block pair, evaluated both sides.
    (Statement-tier pin; the concrete check closes by `norm_num [sigmaQ, sigma, tau,
    phiQ, phi1, phi2, phi3, phi]` or kernel `decide` — prove it in-P0 only if free.) -/
def bridge_pin : Prop :=
  sigmaQ (1 : ℤˣ) (true, false, true) (false, true, false)
    = sigma (true, false, true) (false, true, false)

/-! ## §1.6 (H) at binder tier (EnclOK convention — the ONLY donor-shaped input) -/

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

/-! ## §1.7 in-P0 proofs (optional, cheap; all kernel-safe) -/

/- (B) full proof, ~4 lines: units one + pow_add + phi_parts. Pattern:
   theorem bridge_axiom : BridgeAxiom := fun p q' => by
     simp [sigmaQ, sigma]; rw [← zpow'_…] -- exact shape fixed at pilot time
   (P1)/(P2): kernel `decide` over the 8⁴ space — `by decide` if the kernel check is
   fast enough at this size, else explicit enumeration over the three Bool coordinates
   (the toNat_xor / exists_bit pattern from eth's own decide lemmas). NOT required for
   P0 GREEN; required before the core's step-2 ring computation. -/

#check @MainIdentity
#check @Nondegenerate
#check @HostTransport
#check @bridge_pin

end Pilot41
```

Notes for the executing lane (drafting decisions, all reversible at pilot time):
- `aeval` needs the canonical `Algebra ℤ R` (available for `CommRing R`); if the
  implicit-instance elaboration fights at the pin, swap to
  `(Gq …).eval ((algebraMap ℤ R) ((q : R) : ℤ… ))`-shaped `map` — same content. One
  mechanical fix-loop is budgeted for exactly this class (the m4b2-run1 precedent).
- `(-1 : R) ^ phiQ p q'` vs `zpow`: ℕ-exponents only — `pow` is correct everywhere; no
  `zpow` in the surface (this is why the port is S-class).
- The Gq transcription follows the dossier's step-2 algebra, NOT its (M)-display line
  (two display errata, corrected + documented at the Gq def above: summand X^j; and
  2k+1 = gapOdd − 2·tauMin). If the executing lane prefers the dossier's |τ₁−τ₂|
  encoding, `Nat.abs_sub`-form is equivalent — pick one and keep (M)'s factorization
  consistent with the `1 + (−q)^{2k+1} = 1 − q^{2k+1} = (1−q)Σ_{j≤2k} q^j` step.
- The eth `chg1/2/3`/`lin1/2/3` chain defs are NOT needed at P0 (they are core step-1
  transcription inputs); the P0 ports only the statement surface + the parts that
  appear in σ_q/Gq.

## 2. Donor / binder inventory (exact citations; who is consumed and how)

| input | source (read-verified 2026-11-18) | consumption class |
|---|---|---|
| `Block`, `bxor`, `phi`, `sigma`, `Signs` | eth `proof/statements/EightSquareStatement.lean:37–53` | **verbatim-marked probe copies** (statement-port scaffold; ≈ 0 port cost — ProbeB2/B3 + corpus finding B1–F; the file's own imports are core + `Mathlib.Data.Nat.ModEq` + tactics) |
| `phiQ`, `phi1/2/3` (+ `phi_parts : rfl`) | eth `SecCrossing_Identity.lean:126–136` (`@[expose]` defs) | same verbatim-copy class |
| parity chain (`four_phi → … → four_phi_odd`, `p'_eq`, `chg1/2/3`, `toNat_xor`) | eth `SecCrossing_Identity.lean:76–256` | **transcribed at pilot-core** (D-tranche pattern; named pin-adjustments expected per the D3 `pow_le_pow_right'` precedent) — NOT in P0 |
| `Eight.signs : Signs` | eth `SecCrossing_Identity.lean:261` | regression ANCHOR only (core milestone 1 re-proves it) — no eth theorem imported |
| TL/Jones/Hecke/UqSl2 (for (H)) | tauceti `KnotTheory/TemperleyLieb.lean:87,146,157`, `KnotTheory/Hecke.lean:49`, `QuantumGroups/UqSl2/QuantumTrace.lean:41`; octonions `Algebra/CayleyDickson/{Artin,Imaginary}.lean` | **(H) milestone only**: same-toolchain direct dep (v4.36.0-rc2 = our pin, zero port friction); Cycle-2 donor-hygiene triad at statement level on tauceti's pin BEFORE any consumption; at P0 = the EnclOK `HostTransport` binder (§1.6) |
| OAI donors (SiegelZeros/PiExponent, G11/G12-RELEASED) | `novelty/oai-siegelzeros-piexponent-as-donor.md` §G11/G12 verdict | **NONE CONSUMED** — 41 has no OAI input; the released statement-binder class is the *pattern* precedent (binders-where-a-donor-is-consumed), not a donor source here |

## 3. Runner plan + budget

- **App**: warm ephemeral `crossmath-probe` (the established probe app; no volume, no
  secret; mathlib `ff2494ea…` CI oleans cached in-image, AGENTS §Lean verification).
  Stage pattern: copy `P0.lean` to a world-readable `/tmp/crossmath-41-stage/`,
  `chmod -R a+rX`, run, discard; log persisted to `research/pilots/41/logs/p0-runN.log`
  with the provenance header (the log-rescue lesson). A `pilots/41/run_pilot.sh`
  cloning the pilot-32 wrapper (doz-CLI branch, lane-unique stage dir) is a 10-line
  H-committable addition when the charter fires.
- **Route**: doz CLI `/home/doz/dozenv/bin/modal` (warm semraker lineage — PRIMARY per
  the 2026-11-17 route ruling; xyz verified-LIVE fallback, unused).
- **SPEC**: cpu=2.0, memory=4096, telemetry in the run log, `LEAN_NUM_THREADS=2`;
  single-file elaboration, minutes-scale (statement class — no build phase, so the
  taskset/`-j` lake caveat does not arise).
- **Budget**: **P0 = 1–2 warm runs** (1 expected; +1 for the `aeval`-class mechanical
  fix-loop). **Core (post-GO): S–M, ≈ 0.5–1k LoC, 3–5 runs** (definition ~50; parity
  split ~200 — eth chain transcription with both parts tracked; step-2 polynomial
  algebra ~100; (N) decide driver ~50; packaging ~100 — dossier F4). **(H) phase:
  +1–3k LoC, own budget, own gate** (Q6 of the charter candidate).

## 4. GO/NO-GO gates + descope ladder

- **G-P0(a) faithfulness**: all §1.1–1.2 verbatim defs elaborate 0-errors on-pin.
  Expected outcome ≈ 0 churn (the corpus record); named pin-adjustments are acceptable
  and must be recorded in-file (D3 precedent).
- **G-P0(b) shape**: `sigmaQ`/`Gq`/`MainIdentity`/`Nondegenerate`/`HostTransport`
  typecheck — this IS the polynomial-home pin (no Laurent) and the quantifier-order
  check against the dossier's Lean line.
- **G-P0(c) anchors**: the §1.5 `bridge_pin` elaborates (or the fix-loop resolves
  it mechanically).
- **GO to core** = (a)+(b) GREEN (c included or fix-looped); the core then executes
  dossier milestone ladder 1–4 (re-prove `Eight.signs` → parity split (P1)(P2) →
  (M)+(B) → (N) decide).
- **Descopes (pre-negotiated, preflight §1/§6 + dossier F5):**
  1. (N) fails ⇒ ship `SigmaQ_Signs_all_q` ("every q preserves the alternation") —
     bankable, corollary-grade, weaker; the decide settles it either way.
  2. (H) finite search no-match ⇒ (M)+(N) + the Cayley–Dickson q = 1 anchor
     (`CayleyDickson ℍ[ℤ]` structure constants = σ), (H) restated open.
  3. Kernel-`decide` at 4096 too slow ⇒ explicit Bool-coordinate enumeration lemmas
     (eth's own `toNat_xor` decide pattern) — statement unchanged.
  4. `aeval`-instance friction ⇒ `map`-form restatement (same content, one fix-loop).
- **NO-GO (unexpected)**: verbatim eth defs fail elaboration beyond pin-adjustments —
  contradicts the measured record (would be recorded as a finding, not silently
  patched); or `Gq`'s exponents turn out to need Laurent (they cannot: τ, τmin, j are
  ℕ-valued by construction — if the drafted `Gq` mis-transcribed an exponent, that is a
  spec bug to fix, not a rescope).

## 5. What P0 does NOT claim

P0 GREEN is an elaboration verdict, never a proof claim (probe conventions). The
discovery claims ((M)+(N) new as ℤ[q]-identities; (H) NEW) remain dossier hypotheses
until the core milestones land kernel-clean; article-eligibility per the iter-4 quality
gate (kind DISCOVERY, nearest-miss table ≥ 2 rows, verification blocks) is decided at
iter-5 charter, not here.

— lane A6 (worktree agent-07), 2026-11-18. Sources read at-repo this session: eth
`proof/statements/EightSquareStatement.lean` (defs :37–58 verified),
`proof/networks/Eight/SecCrossing_Identity.lean` (:36–267 verified); dossier
`research/candidates/41-q-deformed-eight-square-temperley-lieb.md`; preflight
`research/pilots/41/preflight.md`; round-3 `research/novelty/round-3.md:50–70`.
