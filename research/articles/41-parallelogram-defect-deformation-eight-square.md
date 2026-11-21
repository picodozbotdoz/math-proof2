# A q-Deformation of the Eight-Square Sign Rule: the Unified Parallelogram-Defect Identity and the Bitwise-Complement Stratum

*kind: DISCOVERY · date: 2026-11-19 · supersedes: none · artifacts:
`research/pilots/41/P0.lean` (statement rung; audit p0-run2: 0 errors, 0 sorry; sha256(16)
`b177acdbf0346bf1`), `research/pilots/41/Core.lean` (committed at `35bd210` 2026-11-19;
committed tree sha256(16) `733b4a2d93a84689`, 627 lines — **all §6 line references are
measured on this committed tree**; the audit-of-record log was produced from the fired
bytes sha256(16) `921bc43cbd06d252`, which differ from the committed tree by a
comment-only delta of +18 lines, documented in the `Core.lean` provenance header),
`research/pilots/41/logs/` (core-run1..9; `core-run9.log` = the audit of record)*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| **Thm 1 `mainCor`** — THE SHIPPED THEOREM: the unified defect identity A + B = (1−q)·aeval(GqGen) at EVERY parallelogram quad | PROVED-UNCONDITIONAL | none (any CommRing R, any unit q ∈ Rˣ) | `research/pilots/41/logs/core-run9.log:65` (triad) — committed-bytes sha in §6 |
| Thm 2 `stratumComplement` + `mainStratum` — the antipodal stratification: gap odd ⟺ q₁⊕q₂ = 111 ⟺ p′ = ¬p (bitwise); on it the identity takes the dossier's corrected display form | PROVED-UNCONDITIONAL | none | `core-run9.log:47/:67` (`stratumComplement` at zero axioms; `mainStratum` triad) |
| Thm 3 `signs_anchor` + `bridge_axiom` — the classical fiber: σ₁ = σ (definition-level) and the classical eight-square alternation re-proved (mod-2 route, no donor import) | PROVED-UNCONDITIONAL | none | `core-run9.log:62–63` ([propext, Quot.sound]) |
| Thm 4 `nondegenerate` + `qRigid` + `alternation_fails_at_q_minus_one` — nondegeneracy and rigidity: the alternation FAILS at q = −1 on an antipodal quad (witness value 2 ≠ 0); the equal-exponent quads have vanishing alternation for EVERY q | PROVED-UNCONDITIONAL | none | `core-run9.log:69/:68/:70` (`nondegenerate` triad; the failure value [propext]) |
| Cor `mainCor_one_implies_signs` — the corrected Theorem 1 at the ℤ fiber q = 1, together with the bridge axiom, recovers the classical alternation (the implication is proved unconditionally; its antecedents are `MainIdentityCor` at q = 1 and `BridgeAxiom`) | PROVED-UNCONDITIONAL | none | `core-run9.log:72` (triad) |
| Certificate `P1_refuted` — the quadratic-parity hypothesis (P1) of the draft forms is FALSE (component certificate, not a headline) | PROVED-UNCONDITIONAL (kernel `decide`; zero axioms) | none | `core-run9.log:48` |
| Certificate `P2_refuted` — the cubic-parity hypothesis (P2) is FALSE | PROVED-UNCONDITIONAL (kernel `decide`; triad) | none | `core-run9.log:49` |
| Certificate `MainIdentity_refuted` — the universally-quantified draft identity fails (witness reads 0 = 2 at q = −1) | PROVED-UNCONDITIONAL (kernel `decide`; triad) | none | `core-run9.log:50` |
| Certificate `SigmaQ_Signs_all_q_refuted` — the degenerate branch (N′: alternation preserved for ALL q) is CLOSED | PROVED-UNCONDITIONAL ([propext]; stated as `¬ SigmaQ_Signs_all_q.{0}` — the universe-instantiated form; the .{u} variants are universe-cosmetic, every fiber contains ULift ℤ and the same witness transports) | none | `core-run9.log:71` |

## Abstract

Can the classical sign rule behind the eight-square (Degen–Graves) identity be deformed
in a parameter q so that its alternation's failure becomes an explicit polynomial? We
prove, for every commutative ring R, every unit q ∈ Rˣ, and every parallelogram quad
(p⊕q₁ = p′⊕q₂, q₁ ≠ q₂), the unified defect identity A + B = (1 − q)·aeval_q(GqGen),
where σ_q(p,q) = (−1)^{φQ(p,q)}·(−q)^{τ(p,q)} splits the classical exponent into
quadratic and cubic parts and GqGen = (−1)^{Q_min}(−X)^{τ_min}·Σ_{j<gap}X^j is the
min-side geometric sum, an explicit ℤ[X]-polynomial; the classical rule is the q = 1
fiber. Status: PROVED-UNCONDITIONAL (Lean 4 kernel). The defect regime is stratified
(Theorem 2): the odd-gap quads are exactly those with q₁⊕q₂ = 111, i.e. p′ = ¬p bitwise.
The family is nowhere flat (Theorem 4): the alternation fails at q = −1 on an antipodal
quad. Certified negative results: the draft parity hypotheses and the draft
universal identity are refuted. Nearest prior work: Benkart–Pérez-Izquierdo
(arXiv:math/9801141, 1998) deform the split octonions at object level — no alternation,
no defect polynomial, no stratification; the q = 1 fiber is the classical Graves–Cayley
alternation. As far as the surveyed corpora and external sweeps show, this is the first
sign-rule/parallelogram-defect deformation.

## 1. Introduction

The eight-square identity's sign rule (the classical Graves–Cayley alternation,
formalized in the project's donor corpus `eth` — the external Lean formalization whose
statement files are the verbatim port source; proved there by a mod-2 argument on the
exponent φ = φQ + τ) admits a one-parameter deformation whose failure of alternation is
not qualitative but polynomial: it is exactly (1 − q) times an explicit element of ℤ[q].
This article proves that statement in its corrected, unified form, stratifies its defect
regime, and certifies the refutations that shaped it.

**Provenance, told once.** The statement has three ancestors, and the distance between
them is part of the result. (i) *The classical original* states and proves the q = 1
alternation (`EightSquareStatement.lean:53`, `SecCrossing_Identity.lean:261`) — a
classical statement, no defect. (ii) *The project dossier* (the discovery's internal
draft record, `candidates/41-q-deformed-eight-square-temperley-lieb.md`) stated a defect
identity **conditional on two parity hypotheses** (P1) (quadratic-parity of the four-sum)
and (P2) (oddness of the τ-gap), believed derivable from the donor's lemma chain, with
the defect polynomial G_q pinned after two display corrections (the geometric summand
q^j, not (−q)^j — load-bearing on exactly 4 of the 64 odd-gap quads; and the gap identity
2k+1 = |τ₁ − τ₂|, a clarifying reformulation). (iii) *The pre-charter universal* dropped
the conditional, quantifying the identity over all parallelogram quads with (P1)/(P2)
treated as discharged decidables. That universal is **false** — refuted independently by
exact enumeration (384 of 448 quads; both parities fail together) and by a kernel
counterexample reading 0 = 2 at q = −1 — and the refutation certificates are the
Theorem-Negative rows below. What survives, and what we prove, is the **unified
min-side identity** (Theorem 1): a single formula, valid at every quad, whose min-side
sign makes the two parity regimes one statement; the dossier's conditional form is
recovered exactly on the odd-gap stratum (`Gq_eq_GqGen_on_stratum`).

**Headline discipline.** The claim is "first sign-rule/parallelogram-defect
deformation" — never "first q-deformation of a composition algebra":
Benkart–Pérez-Izquierdo (1998) own the object-level q-composition of the split octonions
(§4, row 1). The stratification sharpens the classical picture in a precise sense: the
defect regime — the quads where the deformation's failure is governed by the dossier's
corrected display form — is exactly the antipodal stratum {p′ = ¬p} (Theorem 2), while
the classical alternation itself holds at q = 1 on every parallelogram quad (Theorem 3).
What the stratification localizes is the display form of the defect identity, not the
rule of signs.

## 2. Setting and notation

`Block := Bool × Bool × Bool` (8 blocks), `p ⊕ q` bitwise xor. The donor exponent
`φ(p,q) = Σ_{1≤i≤j≤3} p_i q_j + q₁p₂p₃ + p₁q₂p₃ + p₁p₂q₃` splits as `φ = φQ + τ` with φQ
the quadratic part and τ the cubic three-sum (`phi_parts` is a definitional `rfl`, verbatim
from the donor statement files). `σ(p,q) = (−1)^{φ(p,q)}`; the classical alternation
`Signs` is the four-term statement on parallelogram quads `Para(p,q₁,p′,q₂) : p⊕q₁ =
p′⊕q₂ ∧ q₁ ≠ q₂` (exactly 448 quads: p, q₁ free, d := q₁⊕q₂ ≠ 0 determines p′ = p⊕d,
q₂ = q₁⊕d).

**The deformation.** For a commutative ring R and unit q ∈ Rˣ:
`σ_q(p,q) := (−1)^{φQ(p,q)} · (−q)^{τ(p,q)}` — the quadratic sign kept, the cubic weight
q-deformed. At q = 1 this is σ (Theorem 3, definition-level). Write
`A + B := σ_q(p,q₁)σ_q(p′,q₂) + σ_q(p,q₂)σ_q(p′,q₁)`, τ₁ := τ(p,q₁)+τ(p′,q₂), τ₂ :=
τ(p,q₂)+τ(p′,q₁), gap := |τ₁ − τ₂|, τmin := min(τ₁,τ₂), and Q_min := φQ of the
τ-minimizing side (Q1 if τ₁ ≤ τ₂, else Q2).

**The unified defect polynomial** `GqGen : Block⁴ → ℤ[X]`:
`GqGen := (−1)^{Q_min} · (−X)^{τmin} · Σ_{j<gap} X^j` (empty sum at gap = 0 — the
q-rigid case). On the odd-gap stratum — where the parity split gives **Q1 ≡ Q2 (mod 2)**
(τ₁ + τ₂ odd forces Q1 + Q2 even; as integers Q1 ≠ Q2 on 40 of the 64 stratum quads,
e.g. the antipodal quad 000/000/111/111 has Q1 = 6, Q2 = 0, so the recovery goes through
`neg_one_pow_congr`, parity equality) — this is exactly the dossier's corrected display
`G_q = (−1)^{Q1}(−q)^{τmin}Σ_{j≤2k}q^j`, `2k+1 = gap`.

## 3. Main results

**Theorem 1 (unified defect identity, `mainCor`).** For every commutative ring R, every
unit q ∈ Rˣ, and every parallelogram quad: `A + B = (1 − q) · aeval_q(GqGen)`. In
particular the alternation holds at q whenever the defect polynomial's evaluation
vanishes there; conversely, whenever `1 − q` is cancellable in R (in particular over an
integral domain with q ≠ 1), the alternation holds at q **iff** the evaluation vanishes.
At q = 1 the prefactor vanishes identically, so the alternation holds on every quad by
the prefactor alone — the classical fiber is recovered by the prefactor, not by the
defect polynomial's vanishing (at q = 1 the evaluation is `GqGen(1) = ±gap`, nonzero on
the 112 quads with gap ≠ 0). The identity is an ℤ[q]-identity — no number theory, all of
it sign algebra and geometric sums.

**Theorem 2 (stratification, `stratumComplement`).** For every parallelogram quad, the
following are equivalent: the gap is odd; `d = q₁ ⊕ q₂ = 111`; `p′ = ¬p` (bitwise
complement). Hence the 64-quad odd-gap regime — the regime where the dossier's
conditional statement lived — IS the bitwise-complement stratum, and on it **Q1 ≡ Q2
(mod 2)** (the parity split `ethParity`: exactly one of the quadratic and cubic four-sums
is odd — the donor's `four_phi_odd` through `phi_parts`).

**Theorem 3 (the classical fiber, `signs_anchor` + `bridge_axiom`).** σ₁ = σ, and the
classical alternation `Signs` is re-proved here by the mod-2 route (no donor theorem
imported; the donor's statement files are the verbatim port source only). Theorem 1 at
q = 1 recovers `Signs` (`mainCor_one_implies_signs`).

**Theorem 4 (nondegeneracy and rigidity, `alternation_fails_at_q_minus_one` +
`qRigid` + `nondegenerate`).** The deformation is genuine: at the antipodal quad
p = 110, q₁ = 110, p′ = 001, q₂ = 001 the unified defect is GqGen = 1, A + B = 1 − q,
and the alternation FAILS at q = −1 with value 2 ≠ 0 (`alternation_fails_at_q_minus_one`;
of the 64 antipodal quads, 32 give +2 and 32 give −2 at q = −1 — all nonzero), and the
degenerate branch "alternation preserved for ALL q" is closed
(`SigmaQ_Signs_all_q_refuted`). The separate declaration `nondegenerate` certifies the
P0-stage statement ∃ quad, Gq ≠ 0 for the dossier polynomial `Gq`, witnessed at the
counter-quad p = 000, q₁ = 100, p′ = 100, q₂ = 000 (there Gq = 1; that quad is q-rigid —
gap = 0, GqGen = 0 — so `Gq ≠ 0` there witnesses the dossier display's nonvanishing, not
by itself the nondegeneracy of the deformation; the alternation-failure witness above is
the genuine certificate). Conversely the equal-exponent quads (τ₁ = τ₂; 336 of the 448)
are q-rigid: the alternation vanishes for EVERY q there (`qRigid` reads Theorem 1 at
gap = 0: empty sum ⇒ GqGen = 0). Rigidity is the equal-exponent case only — the 48
remaining off-stratum quads (even gap ≥ 2) have NONZERO defect (e.g. p = 101, q₁ = 101,
p′ = 011, q₂ = 011: A + B = 1 − q²).

**Negative certificates (decide-certified refutations — component certificates, not the
headline).** (P1) and (P2) are false (384/448 quads; kernel `decide`,
`P1_refuted`/`P2_refuted`); the universally-quantified draft identity is false
(`MainIdentity_refuted`, the 0 = 2 counterexample at q = −1). These certificates enter
as components of the shipped theorem's story — the project's standing pattern is that
the refutation is certified inside the discovery article that supersedes the refuted
forms; the owners of the negated claims are the project's own draft forms (dossier;
pre-charter), not external conjectures.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| **Benkart–Pérez-Izquierdo, arXiv:math/9801141** (1998) | q-composition at object level (U_q(D₄)/split octonions) | no four-term alternation, no parallelogram constraint, no defect polynomial, no stratification — object-level collision only; the wording lock stands |
| **classical `Eight.signs`** (donor statement `EightSquareStatement.lean:53`; proof `SecCrossing_Identity.lean:261`) | the classical Graves alternation, mod-2 proof | now SHARPENED: the classical alternation is the q = 1 fiber of Theorem 1 on every quad (Theorem 3), and the dossier's display form of the defect identity is exact exactly on the antipodal stratum (`mainStratum`); which quads form the defect regime was not known there |
| **tauceti Jones/TL/Hecke stack** (`TauCeti/KnotTheory/TemperleyLieb.lean`, `TauCeti/KnotTheory/BraidWord/Jones.lean`, `TauCeti/KnotTheory/Homfly/Jones.lean`, `TauCeti/KnotTheory/Hecke.lean:49`, `TauCeti/KnotTheory/Khovanov/`, `TauCeti/KnotTheory/Jimbo/`) | a complete formal Jones polynomial + the TL host | the (H) host (see §7: the three-strand tier is closed by article 41H, linear hosts of dimension ≤ 7 by article 41H3, at the two closed fibers; the general bridge remains open); zero sign-family/parallelogram content |
| **tauceti `FactorSet.ofBimultiplicative`** (`TauCeti/GroupTheory/GroupExtension/Of/FactorSet.lean:571–576`) | formal BILINEAR sign cocycles on lattices (`Matrix.signFactorSet`) | the deformation's τ is CUBIC and q-weighted; the bilinear theory has no deformation, no strata, no defect form — nearest in-corpus formal kin |
| **AFP Prathamesh 2016 "Knot_Theory"** (Isabelle) | tangle-based links + bracket-polynomial invariance | no TL algebra as such, no Jones proper, no sign content |
| **openai-math `HarmonicArtin.TemperleyLieb` + HoneycombChords dilute-TL** | two further TL developments | no Graves/eight-square content, no sign-rule deformation |
| **Kauffman bracket skein calculus** (1988 and the state-model papers) | the ambient algebra of the (H) bridge: bracket, loop value, skein relations | classical calculus; no F₂³ sign family, no composition-algebra connection |
| **CLASS ROW (checked EMPTY at ship: "defect/skein identities at parallelogram quads")** | **NONE found, corpus or external, at 2026-11-19** — a survey-scope negative: corpus greps plus the external sweeps recorded in the project's novelty records; no prior instance found in the surveyed scope | the shipped identity is the first member found by that survey |

Scope qualifiers: "first sign-rule/parallelogram-defect deformation" is scoped to the
surveyed corpora (mathlib, tauceti, axiommath, openai-math, eth — direct-source greps,
2026-11-19) and the external sweeps recorded in the project's novelty records
(`novelty/round6-41-battery.md`); the object-level claim is expressly NOT made (row 1).
**Sharpened statement:** the Graves–Cayley sign alternation is exactly the q = 1 fiber,
on every parallelogram quad, of an explicit ℤ[q]-valued defect identity holding at EVERY
parallelogram quadruple; the identity's dossier display form is exact exactly on the
antipodal stratum {p′ = ¬p} (`mainStratum`) — defect polynomial kernel-computed, stratum
decide-certified, equal-exponent rigidity off-stratum, deformation non-degenerate.
**Honesty note:** elementary proof, nonelementary statement — the machinery is
polynomial algebra + kernel decide at 8⁴ scale; the content is the deformation structure
itself. Novelty records: `novelty/round6-41-battery.md`; the project's
discovery-strength review passed all four checks (`qa/iter4-review/r2-41-s1s4-pass.md`).

## 5. Proofs

*Theorem 2* and the negative certificates are finite: `stratumComplement_raw`/
`ethParity_raw` are raw twelve-Boolean universally-quantified propositions closed by
kernel `decide` over the full 8⁴ space (4096 Boolean tuples; the parallelogram quads are
the 448 satisfying `Para`); the refutations exhibit explicit witness quads evaluated by
`decide`. *Theorem 1* is sign algebra. The product `σ_q(p,q₁)σ_q(p′,q₂)` expands
(`sigmaQ_prod`) to `(−1)^{Q1}(−q)^{τ₁}`, and symmetrically for the crossed term, so for
τ₁ ≤ τ₂

`A + B = (−1)^{Q_min}(−q)^{τ_min} · [1 + (−1)^{Q1+Q2}(−q)^{gap}]`.

The engine is the parity split (Theorem 2's `ethParity`): Q1 + Q2 + τ1 + τ2 is odd at
every quad, and gap ≡ τ1 + τ2 (mod 2), so Q1 + Q2 + gap is odd and the bracket collapses
UNIFORMLY, for both parities:

`A + B = (−1)^{Q_min}(−q)^{τ_min} · (1 − q^{gap})`

(`parity_bracket`: `(−1)^a + (−1)^b(−x)^g = (−1)^a(1 − x^g)` whenever `a + b + g` is
odd). On the odd-gap stratum the bracket reads `1 + (−q)^{gap} = 1 − q^{gap}`; for even
gap it reads `1 − (−q)^{gap} = 1 − q^{gap}`. One geometric identity (`one_sub_mul_geom`:
`1 − x^n = (1−x)·Σ_{j<n}x^j`, empty sum at n = 0) then gives

`A + B = (1 − q)·(−1)^{Q_min}(−q)^{τ_min}·Σ_{j<gap}q^j = (1 − q)·aeval_q(GqGen)`,

via the aeval machinery (`aeval_geom`, `main_abstract` → `mainCor`). The empty-sum case
gap = 0 is `qRigid`. *Theorem 3*: `phi_parts` (definitional) + q = 1; the mod-2 re-proof
of `Signs` follows the donor's own route without importing it. *Theorem 4*: the
antipodal witness quad is evaluated at q = −1 by `decide`
(`alternation_fails_at_q_minus_one`); `qRigid` reads Theorem 1 at gap = 0. Full Lean
proofs: `research/pilots/41/Core.lean` (§-references in §6).

## 6. Formal record

Line references are measured on the committed `Core.lean` tree (sha256(16)
`733b4a2d93a84689`, 627 lines, commit `35bd210`, 2026-11-19). The audit of record
`core-run9.log` was produced from the fired bytes (sha256(16) `921bc43cbd06d252`), which
differ from the committed tree by a comment-only +18-line delta, documented in the
`Core.lean` provenance header; the log's axiom reports are the verdicts of record for
both byte sets. "Triad" = `{propext, Classical.choice, Quot.sound}`.

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 | `Pilot41.mainCor` | `Core.lean:440` | ⊆ triad | `research/pilots/41/logs/core-run9.log:65` |
| stratum recovery | `Pilot41.Gq_eq_GqGen_on_stratum` | `Core.lean:485` | ⊆ triad | `core-run9.log:66` |
| Thm 1 (stratum form) | `Pilot41.mainStratum` | `Core.lean:520` | ⊆ triad | `core-run9.log:67` |
| Thm 2 | `Pilot41.stratumComplement` (+`_raw`) | `Core.lean:270` (raw `:263`) | none (wrapper printed at zero axioms; raw unprinted) | `core-run9.log:47` |
| parity split | `Pilot41.ethParity` (+`_raw`) | `Core.lean:252` (raw `:244`) | none (wrapper printed at zero axioms; raw unprinted) | `core-run9.log:46` |
| Thm 3 | `Pilot41.signs_anchor` / `bridge_axiom` | `Core.lean:387` / `:404` | ⊆ {propext, Quot.sound} | `core-run9.log:62–63` |
| Thm 4 | `Pilot41.nondegenerate` / `qRigid` / `alternation_fails_at_q_minus_one` | `Core.lean:543` / `:529` / `:557` | ⊆ triad / ⊆ triad / ⊆ {propext} | `core-run9.log:69/:68/:70` |
| Corollary | `Pilot41.mainCor_one_implies_signs` | `Core.lean:582` | ⊆ triad | `core-run9.log:72` |
| P0-shape remark | `Pilot41.mainImpliesSigns` | `Core.lean:593` | ⊆ triad | `core-run9.log:73` |
| Neg-cert (P1) | `Pilot41.P1_refuted` | `Core.lean:210` | none (decide) | `core-run9.log:48` |
| Neg-cert (P2) | `Pilot41.P2_refuted` | `Core.lean:217` | ⊆ triad (decide) | `core-run9.log:49` |
| Neg-cert (universal (M)) | `Pilot41.MainIdentity_refuted` | `Core.lean:228` | ⊆ triad (decide) | `core-run9.log:50` |
| Neg-cert (N′ closed) | `Pilot41.SigmaQ_Signs_all_q_refuted` | `Core.lean:571` | ⊆ {propext} | `core-run9.log:71` |

Audit of record (core-run9, 2026-11-19): 0 errors, 0 sorry, zero sorryAx across the
audit surface — 29 axiom prints (`core-run9.log:45–73`), four declarations at zero
axioms (`phi_parts`, `ethParity`, `stratumComplement`, `P1_refuted`), every audited
declaration triad-or-leaner. The run directory `pilots/41/logs/` (core-run1..9) records
the full run history; the intermediate runs' defects were elaboration-level (a universe
auto-bound in a P0-stage definition, runs 4–8) and the final restatement is
universe-cosmetic relative to the drafted polymorphic form — every fiber contains
ULift ℤ, and the witness value is independently certified by the axiom-lean
`alternation_fails_at_q_minus_one`. `P0.lean` committed sha256(16)
`b177acdbf0346bf1` (audit p0-run2: 0 errors, 0 sorry).

## 7. Limitations and open problems

- The **(H) host bridge** (σ_q matched against Temperley–Lieb/Jones trace evaluations,
  q = −A²) is NOT in this article. The three-strand tier is closed by the companion
  article 41H (no three-strand TL dictionary at the q = −1 fiber; other q-fibres remain
  open there), and linear hosts of dimension ≤ 7 are excluded at the two closed fibers
  by article 41H3; the general bridge (any host at n ≥ 4, other q-fibres) remains open.
  Its binder-tier statement (`HostTransport`) is already elaboration-clean in the P0;
  the host machinery is corpus-native (tauceti's complete Jones stack).
- The parity corrections were certified against the project's own draft forms; no
  external conjecture is refuted. The enumeration evidence (448 × 12 evaluation points)
  is external to the kernel and cited only as corroboration — the kernel `decide`
  certificates are the record.
- Dossier display corrections: the summand correction is load-bearing (4/64 of the
  odd-gap regime); the gap-identity correction is a reformulation/guard, not a mis-print
  (the project's record-accuracy documentation owns the wording).

## 8. Prior work and references

**(a) Literature.** Benkart–Pérez-Izquierdo, *A quantum octonion algebra*,
arXiv:math/9801141 (1998). Degen's eight-square identity (classical; Graves–Cayley
context). Kauffman, *New invariants in the theory of knots* (1988) and the bracket
state-model papers. Prathamesh, *Knot_Theory*, Archive of Formal Proofs (2016).

**(b) Project artifacts.** Donor statement files (read-only, verbatim port source):
eth `proof/statements/EightSquareStatement.lean:37–53`,
`proof/networks/Eight/SecCrossing_Identity.lean:118–266`. Host machinery citations:
tauceti `TauCeti/KnotTheory/TemperleyLieb.lean`, `TauCeti/KnotTheory/BraidWord/Jones.lean`,
`TauCeti/KnotTheory/Homfly/Jones.lean`, `TauCeti/KnotTheory/Hecke.lean:49`. Companion
articles: `research/articles/41H-tl-realizability-transport.md`,
`research/articles/41H3-two-fiber-rank-closure.md`. Project records:
`candidates/41-q-deformed-eight-square-temperley-lieb.md` (the dossier + dated display
errata), `qa/iter4-review/a6-41-p0-precharter.md`, `novelty/round6-41-battery.md`,
`novelty/round6-41-errata-check.md`, `pilots/41/{P0,Core}.lean` + `pilots/41/logs/` +
`P0-record.md`.
