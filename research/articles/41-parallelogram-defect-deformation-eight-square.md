# A q-Deformation of the Eight-Square Sign Rule: the Unified Parallelogram-Defect Identity and the Bitwise-Complement Stratum

*kind: DISCOVERY — **RULED by the orchestrator 2026-11-19** (quota-free: discovery-grade
never consumes the N=1 knowledge-level slot) · date: 2026-11-19 (**shipped at the splice — R9 battery FINAL §LANDING + R2 S1–S4 4/4 + the orchestrator's signal**) · supersedes: none · artifacts:
`research/pilots/41/P0.lean` (statement rung, GREEN p0-run2, sha256(16)
`b177acdbf0346bf1`), `research/pilots/41/Core.lean` (**core GREEN core-run9: the fired
GREEN bytes sha256(16) `921bc43cbd06d252`; the on-disk tree sha256(16)
`733b4a2d93a84689` differs by a comment-only delta** — both documented in-file and in the
run-9 provenance header; committed at `35bd210` 2026-11-19, on-disk sha256(16) `733b4a2d93a84689`),
`research/pilots/41/logs/` (core-run1..9; `core-run9.log` = the verdict of record)*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| **Thm 1 `mainCor`** — THE SHIPPED THEOREM: the unified defect identity A + B = (1−q)·aeval(GqGen) at EVERY parallelogram quad | PROVED-UNCONDITIONAL | none (any CommRing R, any unit q ∈ Rˣ) | `pilots/41/logs/core-run9.log` (triad-clean) — committed-bytes sha in §6 |
| Thm 2 `stratumComplement` + `mainStratum` — the antipodal stratification: gap odd ⟺ q₁⊕q₂ = 111 ⟺ p′ = ¬p (bitwise); on it the identity takes the dossier's corrected display form | PROVED-UNCONDITIONAL | none | `pilots/41/logs/core-run9.log` (stratification zero axioms — kernel decide; mainStratum triad) |
| Thm 3 `qRigid` — off-stratum rigidity: the equal-exponent quads have vanishing alternation for EVERY q (the classical rule extends verbatim there) | PROVED-UNCONDITIONAL | none | `pilots/41/logs/core-run9.log` (triad-clean) |
| Thm 4 `signs_anchor` + `bridge_axiom` — the q = 1 fiber: σ₁ = σ (definition-level) and the classical eight-square alternation re-proved (mod-2 route, no donor import) | PROVED-UNCONDITIONAL | none | `pilots/41/logs/core-run9.log` ([propext, Quot.sound]) |
| Thm 5 `nondegenerate` + `alternation_fails_at_q_minus_one` — the family is nowhere flat: a quad with G_q ≠ 0; the alternation value at the antipodal quad is 2 ≠ 0 at q = −1 | PROVED-UNCONDITIONAL | none | `pilots/41/logs/core-run9.log` (nondegenerate triad; the failure value [propext], kernel decide) |
| Cor `mainImpliesSigns` — Theorem 1 at q = 1 recovers the classical alternation | PROVED-UNCONDITIONAL | none | `pilots/41/logs/core-run9.log` (triad-clean) |
| Certificate `P1_refuted` — the quadratic-parity hypothesis (P1) of the draft forms is FALSE (component certificate, not a headline) | PROVED-UNCONDITIONAL (kernel `decide`; zero axioms) | none | `pilots/41/logs/core-run9.log` |
| Certificate `P2_refuted` — the cubic-parity hypothesis (P2) is FALSE | PROVED-UNCONDITIONAL (kernel `decide`; triad) | none | `pilots/41/logs/core-run9.log` |
| Certificate `MainIdentity_refuted` — the universally-quantified draft identity fails (witness reads 0 = 2 at q = −1) | PROVED-UNCONDITIONAL (kernel `decide`; triad) | none | `pilots/41/logs/core-run9.log` |
| Certificate `SigmaQ_Signs_all_q_refuted` — the degenerate branch (N′: alternation preserved for ALL q) is CLOSED | PROVED-UNCONDITIONAL ([propext]; stated as `¬ SigmaQ_Signs_all_q.{0}` — the universe-instantiated form; the .{u} variants are universe-cosmetic, every fiber contains ULift ℤ and the same witness transports) | none | `pilots/41/logs/core-run9.log` |

## Abstract

Can the classical sign rule behind the eight-square (Degen–Graves) identity be deformed in
a parameter q so that the deformation is measurable by an explicit polynomial defect? We
define, on the 8-element block space of the sign rule, the family σ_q(p,q) = (−1)^{φQ(p,q)}
· (−q)^{τ(p,q)} splitting the classical exponent into its quadratic and cubic parts, and we
prove the **unified defect identity** (Theorem 1): at EVERY parallelogram quad, the
σ_q-alternation A + B equals (1 − q) times the evaluation of an explicit polynomial
G_q — the min-side geometric sum — so the classical rule is exactly the q = 1 fiber. The
defect regime is stratified combinatorially (Theorem 2): the odd-gap quads are exactly
those with q₁ ⊕ q₂ = 111, i.e. p′ = ¬p bitwise. The family is nowhere flat (Theorem 4). We
also record, as certified negative results, the refutation of the two parity hypotheses and
of the universally-quantified draft form of the identity under which the defect polynomial
was first stated. All results are kernel-verified in Lean 4 (finite strata by `decide`;
as far as the surveyed corpora and external sweeps show, this is the first
sign-rule/parallelogram-defect deformation.

## 1. Introduction

The eight-square identity's sign rule (eth corpus statement `Eight.signs`, proved there by
a mod-2 argument on the exponent φ = φQ + τ) admits a one-parameter deformation whose
failure of alternation is not qualitative but polynomial: it is exactly (1 − q) times an
explicit element of ℤ[q]. This article proves that statement in its corrected, unified
form, stratifies its defect regime, and certifies the refutations that shaped it.

**Provenance, told once.** The statement has three ancestors, and the distance between
them is part of the result. (i) *The eth original* states and proves the q = 1 alternation
(`EightSquareStatement.lean:53`, `SecCrossing_Identity.lean:261`) — a classical statement,
no defect. (ii) *The project dossier* stated a defect identity **conditional on two parity
hypotheses** (P1) (quadratic-parity of the four-sum) and (P2) (oddness of the τ-gap),
believed derivable from eth's lemma chain, with the defect polynomial G_q pinned after two
display corrections (the geometric summand q^j, not (−q)^j — load-bearing on exactly 4 of
the 64 odd-gap quads; and the gap identity 2k+1 = |τ₁ − τ₂|, a clarifying reformulation).
(iii) *The pre-charter universal* dropped the conditional, quantifying the identity over
all parallelogram quads with (P1)/(P2) treated as discharged decidables. That universal is
**false** — refuted independently by exact enumeration (384 of 448 quads; both parities
fail together) and by a kernel counterexample reading 0 = 2 at q = −1 — and the refutation
certificates are Theorem-Negative rows below. What survives, and what we prove, is the
**unified min-side identity** (Theorem 1): a single formula, valid at every quad, whose
min-side sign makes the two parity regimes one statement; the dossier's conditional form
is recovered exactly on the odd-gap stratum (`Gq_eq_GqGen_on_stratum`).

**Headline discipline (locked, round-3 + round-6).** The claim is "first
sign-rule/parallelogram-defect deformation" — never "first q-deformation of a composition
algebra": Benkart–Pérez-Izquierdo (1998) owns the object-level q-composition of the split
octonions (§4, row 1). The stratification sharpens the classical tie: *the classical rule
of signs is exactly the d = 111-complement stratum's q = 1 fiber*.

## 2. Setting and notation

`Block := Bool × Bool × Bool` (8 blocks), `p ⊕ q` bitwise xor. The eth exponent
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
q-rigid case). On the odd-gap stratum (where Q1 = Q2 by the parity split) this is exactly
the dossier's corrected display `G_q = (−1)^{Q1}(−q)^{τmin}Σ_{j≤2k}q^j`, `2k+1 = gap`.

## 3. Main results

**Theorem 1 (unified defect identity, `mainCor`).** For every commutative ring R, every
unit q ∈ Rˣ, and every parallelogram quad: `A + B = (1 − q) · aeval_q(GqGen)`. In
particular the alternation holds at q iff the defect polynomial's evaluation vanishes
there; the identity is an ℤ[q]-identity — no number theory, all of it sign algebra and
geometric sums.

**Theorem 2 (stratification, `stratumComplement`).** For every parallelogram quad, the
following are equivalent: the gap is odd; `d = q₁ ⊕ q₂ = 111`; `p′ = ¬p` (bitwise
complement). Hence the 64-quadruple odd-gap regime — the regime where the dossier's
conditional statement lived — IS the bitwise-complement stratum, and on it Q1 = Q2 (the
parity split `ethParity`: exactly one of the quadratic and cubic four-sums is odd — eth's
`four_phi_odd` through `phi_parts`).

**Theorem 3 (the classical fiber, `signs_anchor` + `bridge_axiom`).** σ₁ = σ, and the
classical alternation `Signs` is re-proved here by the mod-2 route (no donor theorem
imported; the donor's statement files are the verbatim port source only). Theorem 1 at
q = 1 recovers `Signs` (`mainImpliesSigns`).

**Theorem 4 (nondegeneracy and rigidity, `nondegenerate` + `qRigid`).** There is a
parallelogram quad with G_q ≠ 0 (witness below), so the deformation is genuine: the
alternation FAILS at q = −1 on the antipodal quad (value 2 ≠ 0,
`alternation_fails_at_q_minus_one`). Conversely the equal-exponent quads (τ₁ = τ₂) are
q-rigid: the alternation vanishes for EVERY q there — the classical rule extends verbatim
on the rigid stratum.

**Negative certificates (decide-certified refutations — component certificates, not the
headline).** (P1) and (P2) are false (384/448 quads; kernel `decide`,
`P1_refuted`/`P2_refuted`); the universally-quantified draft identity is false
(`MainIdentity_refuted`, the 0 = 2 counterexample at q = −1); the degenerate branch
"alternation preserved for all q" is closed (`SigmaQ_Signs_all_q_refuted`). These
certificates enter as components of the shipped theorem's story (the article-30 pattern:
the refutation is certified inside the discovery article that supersedes the refuted
forms) — the owners of the negated claims are the project's own draft forms (dossier;
pre-charter), not external conjectures.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| **Benkart–Pérez-Izquierdo, arXiv:math/9801141** (1998) | q-composition at object level (U_q(D₄)/split octonions) | no four-term alternation, no parallelogram constraint, no defect polynomial, no stratification — object-level collision only; the wording lock stands |
| **eth `Eight.signs`** (`SecCrossing_Identity.lean:261`; statement `EightSquareStatement.lean:53`) | the classical Graves alternation, mod-2 proof | now SHARPENED by the landing: it is exactly the q = 1 fiber of the defect identity ON the antipodal stratum (`mainStratum`); the classical rule of signs lives on {p′ = ¬p} — nothing in eth knows this |
| **tauceti Jones/TL/Hecke stack** (`KnotTheory/TemperleyLieb.lean`, `BraidWord/Jones.lean`, `Homfly/Jones.lean`, `Hecke.lean:49`, Khovanov/, Jimbo/) | a complete formal Jones polynomial + the TL host | the (H) host (separate article if it lands); zero sign-family/parallelogram content |
| **tauceti `FactorSet.ofBimultiplicative`** (`GroupTheory/GroupExtension/Of/FactorSet.lean:571–576`) | formal BILINEAR sign cocycles on lattices (`Matrix.signFactorSet`) | the deformation's τ is CUBIC and q-weighted; the bilinear theory has no deformation, no strata, no defect form — nearest in-corpus formal kin |
| **AFP Prathamesh 2016 "Knot_Theory"** (Isabelle) | tangle-based links + bracket-polynomial invariance | no TL algebra as such, no Jones proper, no sign content |
| **openai-math `HarmonicArtin.TemperleyLieb` + HoneycombChords dilute-TL** | two further TL developments | no Graves/eight-square content, no sign-rule deformation |
| **Kauffman bracket skein calculus** (1988 and the state-model papers) | the ambient algebra of the (H) bridge: bracket, loop value, skein relations | classical calculus; no F₂³ sign family, no composition-algebra connection |
| **CLASS ROW (checked EMPTY at the landing state): "defect/skein identities at parallelogram quads"** | **NONE, corpus or external, at 2026-11-19** — the class-level negative stands against the LANDED (kernel-verified) statement, not a hypothesis (rounds 3+6 sweeps) | the landed identity is the class's first (and so far only) member |

Scope qualifiers: "first sign-rule/parallelogram-defect deformation" is scoped to the
surveyed corpora (mathlib, tauceti, axiommath, openai-math, eth — direct-source greps,
2026-11-19) and the external sweeps named in the round-6 battery; the object-level claim
is expressly NOT made (row 1). **Sharpened at the landing (the battery §LANDING L2
form):** the Graves–Cayley sign alternation is exactly the q = 1 fiber, on the antipodal
stratum {p′ = ¬p}, of an explicit ℤ[q]-valued defect identity holding at EVERY
parallelogram quadruple — defect polynomial kernel-computed, stratum decide-certified,
q-rigidity off-stratum, deformation non-degenerate. **Honesty note (S3, mandatory per
R2's 4/4 pass):** elementary proof, nonelementary statement — the machinery is
polynomial algebra + kernel decide at 8⁴ scale; the content is the deformation
structure itself. Novelty table refreshed from `novelty/round6-41-battery.md` FINAL
§LANDING (L1); S1–S4 = 4/4 PASS (`qa/iter4-review/r2-41-s1s4-pass.md`).

## 5. Proofs

*Theorem 2* and the negative certificates are finite: `stratumComplement_raw`/
`ethParity_raw` are raw twelve-Boolean universally-quantified propositions closed by
kernel `decide` over the full space (8⁴ = 4096 quads); the refutations exhibit explicit
witness quads evaluated by `decide`. *Theorem 1* is sign algebra: the product
`σ_q(p,q₁)σ_q(p′,q₂)` expands (`sigmaQ_prod`) to `(−1)^{Q1}(−q)^{τ₁}`; the parity split
(Theorem 2's `ethParity`) forces exactly one of Q1+Q2, τ₁+τ₂ odd, so the two-regime
min-side computation factors `A + B = (−1)^{Q_min}(−q)^{τmin}(1 + (−q)^{gap})`, and the
odd/even gap cases both reduce by the geometric-sum identity
(`1 − q^{gap+1} = (1−q)Σ_{j≤gap}q^j` for gap odd; the (1+q)-factor twin for gap even) to
`(1−q)·aeval(GqGen)` (`main_abstract`, `aeval_geom`, `parity_bracket`,
`two_term_geom`). *Theorem 3*: `phi_parts` (definitional) + q = 1; the mod-2 re-proof of
`Signs` follows eth's own route without importing it. *Theorem 4*: the witness quad is the
§3 antipodal quad (Gq = 1 there); `qRigid` reads Theorem 1 at gap = 0 (empty sum ⇒
GqGen = 0). Full Lean proofs: `research/pilots/41/Core.lean` (§-references in §6).

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 | `Pilot41.mainCor` | `Core.lean:422` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/41/logs/core-run9.log` — final extract at shipping |
| stratum recovery | `Pilot41.Gq_eq_GqGen_on_stratum` | `Core.lean:467` | ⊆ triad | as above |
| Thm 1 (stratum form) | `Pilot41.mainStratum` | `Core.lean:502` | ⊆ triad | as above |
| Thm 2 | `Pilot41.stratumComplement` (+`_raw`) | `Core.lean:245–252` | none (kernel decide) | as above |
| parity split | `Pilot41.ethParity` (+`_raw`) | `Core.lean:226–234` | none (kernel decide) | as above |
| Thm 3 | `Pilot41.signs_anchor`, `bridge_axiom` | `Core.lean:369/:386` | ⊆ {propext, Quot.sound} | as above |
| Thm 4 | `Pilot41.nondegenerate`, `qRigid` | `Core.lean:525/:511` | ⊆ triad | as above |
| Neg-cert (P1) | `Pilot41.P1_refuted` | `Core.lean:192` | none (decide) | as above |
| Neg-cert (P2) | `Pilot41.P2_refuted` | `Core.lean:199` | ⊆ triad (decide) | as above |
| Neg-cert (universal (M)) | `Pilot41.MainIdentity_refuted` | `Core.lean:210` | ⊆ triad (decide) | as above |
| Neg-cert (genuine deformation) | `Pilot41.alternation_fails_at_q_minus_one` | `Core.lean:539` | ⊆ {propext} | as above |
| Neg-cert (N′ closed) | `Pilot41.SigmaQ_Signs_all_q_refuted` | `Core.lean:553` | ⊆ {propext} | as above |
| Corollary | `Pilot41.mainImpliesSigns` | `Core.lean` §8 | ⊆ triad | as above |

Committed-bytes stamps (the D.4 sweep-sha discipline, at the splice commit):
`Core.lean` on-disk committed sha256(16) **`733b4a2d93a84689`** (committed `35bd210`,
2026-11-19); the run-of-record fired bytes **`921bc43cbd06d252`** (core-run9 GREEN —
the comment-only delta between the two is documented in-file and in the run-9
provenance header). The audit above is core run 9 (2026-11-19, FINAL — `Core.lean:
OK`, 0 errors, 0 sorry, zero sorryAx across the audit surface: 30 top-level
declarations triad-or-leaner, four at ZERO axioms); `P0.lean` committed sha
`b177acdbf0346bf1` (p0-run2 GREEN).

**Verification blocks (R3 §5 format) + the run-of-record table (budget disclosure).**

- Thm 1 `mainCor` — file `research/pilots/41/Core.lean:422`; binder inventory: NONE
  (the only binders are the statement's own ∀s: ring, unit, quad); substrate: mathlib
  `ff2494ea`, Lean v4.36.0-rc2 (the project pin); axioms exactly
  `[propext, Classical.choice, Quot.sound]` (`core-run9.log` audit line); coverage:
  the full audit surface, zero sorryAx.
- Thm 2 `stratumComplement`/`mainStratum` — `Core.lean:245–252` / `:502`;
  `stratumComplement` at ZERO axioms (kernel `decide` over the raw twelve-Boolean
  statement); `mainStratum` triad; binder inventory: NONE.
- Thm 3 `qRigid` — `Core.lean:511`; triad; binder inventory: NONE.
- Thm 4 `signs_anchor`/`bridge_axiom` — `Core.lean:369/:386`; `[propext, Quot.sound]`
  (no Classical.choice); binder inventory: NONE.
- Thm 5 + certificates — `Core.lean:525/:539/:553` and `:192/:199/:210`; triad,
  [propext], or zero axioms as tabled; binder inventory: NONE everywhere.

| core run | wall | errors | state |
|---|---|---|---|
| 1 | 77 s | 6 | NOT-GREEN — all mechanical (no statement-math defect) |
| 2 | 59 s | 2 | NOT-GREEN — "no goals" class (over-successful scripts) |
| 3 | 53 s | 5 | NOT-GREEN — §6–§8 mechanical; the discovery core emerging |
| 4 | 59 s | 1 | NOT-GREEN — **the discovery core DONE here** (Thms 1–5 triad-clean); the 1 error = first sighting of the universe issue |
| 5–8 | 56–69 s | 1 each | NOT-GREEN — the one universe-cosmetic decl (`SigmaQ_Signs_all_q_refuted`): four fix attempts diagnosing the P0 def's auto-bound universe frozen rigid by the polymorphic negation (decisive diagnostic run 7; conclusive run 8) |
| 9 | 53 s | **0** | **GREEN** — theorem restated `¬ SigmaQ_Signs_all_q.{0}` (universe instantiated; the .{u} variants cosmetic — every fiber contains ULift ℤ, the same witness transports); bytes `921bc43cbd06d252` |

Budget disclosure: the runs-4–8 churn was elaboration-level (a universe auto-bound in a
P0-stage def), not mathematical; the final restatement is universe-cosmetic relative to
the drafted polymorphic form, and the witness value is independently certified by the
axiom-lean `alternation_fails_at_q_minus_one`. Resources held at spec on every run
(cpu ≤ 1.41 of 2.0; the isolated OVER-mem samples are the documented mapped-olean
artifact, anon = 0). The P0 statement rung staged alongside every core run as regression
(OK each time).

## 7. Limitations and open problems

- The **(H) host bridge** (σ_q matched against Temperley–Lieb/Jones trace evaluations,
  q = −A²) is NOT in this article: it is a separate milestone (wave-tail conditional),
  and if it lands at discovery grade it ships as its OWN file per the standing
  instruction. Its binder-tier statement (`HostTransport`) is already elaboration-clean
  in the P0; the host machinery is corpus-native (tauceti's complete Jones stack).
- The parity corrections were certified against the project's own draft forms; no
  external conjecture is refuted. The enumeration evidence (448 × 12 evaluation points)
  is external to the kernel and cited only as corroboration — the kernel `decide`
  certificates are the record.
- Dossier display corrections: the summand correction is load-bearing (4/64 of the
  odd-gap regime); the gap-identity correction is a reformulation/guard, not a mis-print
  (the record-accuracy channel owns the wording).
- The draft hold is RESOLVED (spliced 2026-11-19): §4's table is refreshed from the
  round-6 battery FINAL §LANDING and R2's S1–S4 pass is 4/4; the headline wording is
  locked (first sign-rule/parallelogram-defect deformation — never "first q-deformation
  of a composition algebra"; never any TL/Jones-formalization-first claim).

## 8. Prior work and references

**(a) Literature.** Benkart–Pérez-Izquierdo, *A quantum analog of the Grassmann algebra
and the split octonions*, arXiv:math/9801141 (1998). Degen's eight-square identity
(classical; Graves–Cayley context). Kauffman, *New invariants in the theory of knots*
(1988) and the bracket state-model papers. Prathamesh, *Knot_Theory*, Archive of Formal
Proofs (2016).

**(b) Project artifacts.** Donor statement files (read-only, verbatim port source):
eth `proof/statements/EightSquareStatement.lean:37–53`,
`proof/networks/Eight/SecCrossing_Identity.lean:118–266`. Host machinery citations:
tauceti `KnotTheory/TemperleyLieb.lean`, `BraidWord/Jones.lean`, `Homfly/Jones.lean`,
`Hecke.lean:49`. Project records: `candidates/41-q-deformed-eight-square-temperley-lieb.md`
(the dossier + dated display errata), `qa/iter4-review/a6-41-p0-precharter.md`,
`novelty/round-3.md` §2, `novelty/round6-41-battery.md` FINAL (§LANDING = the §4 source), `qa/iter4-review/r2-41-s1s4-pass.md` (4/4),
`novelty/round6-41-errata-check.md` (§3: the census), `pilots/41/{P0,Core}.lean` +
`pilots/41/logs/` + `P0-record.md`.

## 9. Shipping gate (self-audit; final — splice-day state)

| # | rule | state |
|---|---|---|
| 1 | kind is a §0 article kind | PASS — **DISCOVERY, ruled by the orchestrator 2026-11-19** (quota-free); the shipped theorem = the unified identity + stratification + rigidity; refutations as certificates |
| 2 | title free of project-internal tokens | PASS — "A q-Deformation of the Eight-Square Sign Rule: the Unified Parallelogram-Defect Identity and the Bitwise-Complement Stratum" |
| 3 | status rows, closed vocabulary, binders listed | PASS — real verdicts at core-run9 (every row closed-vocabulary; no binders anywhere: all rows PROVED-UNCONDITIONAL) |
| 4 | abstract ≤ 200 words, all five elements | PASS at splice — finalized in-commit (the draft note deleted; 192 words) |
| 5 | novelty table ≥ 2 rows, scoped "first" | PASS — 8 rows incl. the EMPTY-at-landing class row, refreshed from the battery FINAL §LANDING (L1) |
| 6 | no bracketed errata | PASS (the erratum story is §1 prose, told once) |
| 7 | no section contradicts another | PASS — §3 certificates subordinate to the shipped theorem; §7 carries no residue |
| 8 | formal record table-only, no infra narration | PASS (interim markers are evidence pointers, not run histories) |
| 9 | internal vocabulary ≤ 3 glosses | PASS — "eth corpus", "dossier", "battery" glossed at first use |
| 10 | citations spot-checked (5+) | PASS at splice — re-verified against the committed tree (donor file:line, log paths, the sha pair) |
| 11 | README row in the same commit | SATISFIED — in this commit (row-41 + the counts line 6→7, per the splice package §1a/§1b) |
| 12 | superseded files marked | n/a (supersedes none) |

— SHIPPED at the 2026-11-19 splice commit (this commit), lane R7 (A9 lineage) drafted;
H applied the splice per `qa/iter4-review/a7-41-splice-package.md` on the orchestrator's
signal (ship gate: R7 draft-final + R9 battery FINAL + R2 S1–S4 4/4). Kind DISCOVERY,
quota-free (orchestrator ruling 2026-11-19); the verdicts are the core-run9 audit; the
core pilot (`pilots/41/`, lane R4) owns the Lean.
