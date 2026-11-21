# No Three-Strand Temperley–Lieb Dictionary for the Eight-Square Sign Rule at the q = −1 Fiber: Certified Traciality and Rank Obstructions

*kind: NEGATIVE · date: 2026-11-19 · supersedes: none ·
artifacts: `research/pilots/41/H1.lean`, `research/pilots/41/H2.lean`,
`research/pilots/41/logs/h1-run2.log` (audit of record for `H1.lean`),
`research/pilots/41/logs/h2-run11.log` (audit of record for `H2.lean`)*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| **Thm A — the traciality obstruction** (`tracial_realizability_refuted`): NO tracial evaluation realizes σ_{−1} on word products | PROVED-UNCONDITIONAL | none (the refuted class: any evaluation `ev : FreeMonoid (Fin 2) → ℤ` and word family `w : Block → FreeMonoid (Fin 2)` with per-word realizability `ev(w_p · w_p′) = σ_{−1}(p,p′)` and traciality, at q = −1, over ℤ) | `pilots/41/H1.lean:436`, audit [propext, Quot.sound] (`pilots/41/logs/h1-run2.log:59`); the breaking witness `sigmaQ_asym_witness` [propext], kernel decide (`H1.lean:422`, `h1-run2.log:58`) |
| **Thm B — the rank obstruction** (`rank_obstruction_nogo`): NO realization of the specialized σ-table through C·Φ·Cᵀ with a dependent word-row family | PROVED-CONDITIONAL | the realization data `C : Block → Fin 5 → ℤ` and `Φ : Fin 5 → Fin 5 → ℤ`; the dependence witness `v : Block → ℤ` with `hv : v ≠ 0` and `hdep : Σ_p C p j · v p = 0` for all j; the realization equations `hreal`. The witness binders are discharged for every C by the classical dimension argument (8 word-coefficient vectors in a 5-dimensional space are ℚ-dependent, cleared to ℤ) — that step is NOT formalized in the artifact | `pilots/41/H2.lean:310`, audit [propext, Classical.choice, Quot.sound] (`h2-run11.log:48`) |
| Certificate B1 (`sigmaOrth`): the σ-rows are pairwise orthogonal, ⟨r_p, r_p′⟩ = 8·δ_{p,p′} | PROVED-UNCONDITIONAL (kernel decide over the raw twelve-Boolean form) | none | `H2.lean:165` (raw `:160`), audit [propext] (`h2-run11.log:45`) |
| Certificate B2 (`sigmaExpand_basis`): 8·e_{b₀} = Σ_p ⟨r_p, e_{b₀}⟩ r_p at every basis vector | PROVED-UNCONDITIONAL (kernel decide) | none | `H2.lean:179` (raw `:173`), audit [propext] (`h2-run11.log:46`) |
| Lifting (`sigmaExpand`): the basis expansion holds for ALL integer function vectors | PROVED-UNCONDITIONAL | none | `H2.lean:236`, audit ⊆ {propext, Classical.choice, Quot.sound} (`h2-run11.log:47`) |
| Transport (`hostTransportCor` / `hostTransportStratum`): any fixed realizability datum transports the unified defect identity / its stratum form | PROVED-CONDITIONAL | binders: the units A, q of a commutative ring R, the evaluation datum `ev`, the word family `w`, the fiber equation `hq : q = −A²`, and the per-word realizability hypothesis `hreal` (hq is carried but unused by the transport algebra: the identity holds at every q) | `pilots/41/H1.lean:379/:397`, audits ⊆ {propext, Classical.choice, Quot.sound} (`h1-run2.log:54–57`) |

## Abstract

The q-deformed eight-square sign rule σ_q(p,p′) = (−1)^{φQ(p,p′)}(−q)^{τ(p,p′)}
asks for a Temperley–Lieb/Jones dictionary realizing its 8×8 table by three-strand
word evaluations ϕ(w_p·w_p′) (TL₃: dimension 5). Both obstructions are proved
at q = −1, where (−q)^τ = 1 and the certified table is the quadratic
specialization (−1)^{φQ} — neither sees the cubic factor. Theorem A
(traciality, PROVED-UNCONDITIONAL): no evaluation ev and word family w over ℤ
with ev(w_p·w_p′) = σ_{−1}(p,p′) for all pairs is tracial — the witness pair
(100,110) breaks it, 1 ≠ −1. Theorem B (rank, PROVED-CONDITIONAL on the
witness binders v, hv : v ≠ 0, hdep): no factorization σ_{−1}(p,p′) =
Σ C p i Φ i j C p′ j admits a nonzero integer relation Σ_p C p j·v p = 0
in its rows; the classical dimension step (8 vectors in dimension 5),
unformalized, extends it to every 5-dim linear-functional
— hence every three-strand TL — realization. At other q-fibers nothing is proved;
a host at n ≥ 4 strands, non-tracial, remains open. In the round-6 novelty
survey's corpora (§8) this is the first incompatibility between this
family and TL/Jones trace evaluations. Nearest prior work: tauceti's complete
formal Jones polynomial (the would-be host); Benkart–Pérez-Izquierdo 1998.

## 1. Introduction

The companion article (`articles/41-parallelogram-defect-deformation-eight-square.md`)
deforms the eight-square sign rule by σ_q(p,q′) = (−1)^{φQ(p,q′)}(−q)^{τ(p,q′)} and
proves the unified parallelogram-defect identity. The project's problem file for
this candidate (the **dossier** — the per-candidate hypothesis record) additionally
hypothesized a HOST theorem (H): a Temperley–Lieb/Jones dictionary realizing σ_q
through braid-word evaluations, at 3 strands with the Jones/Kauffman normalization
q = −A². This article proves that hypothesis false at the q = −1 fiber in every
dictionary class considered, by two independent obstructions. Whether a host exists
at other q-fibers, or at n ≥ 4 strands, is open (§7).

**Provenance, told once.** The (H) statement passed through three stages before
this refutation: the dossier's original hypothesis form (3-strand TL, eight words
w_p, a Markov-trace-flavored reading); a statement-level restatement (`HostTransport`
in the first probe file of **pilot** 41 — the verification unit — whose wording
was found defective and set aside); and the corrected surface used here
(`hostTransportCor`/`hostTransportStratum` over the corrected defect polynomial
GqGen, with the realizability datum as explicit binders — the transports themselves
are proved and kept as the conditional direction). The obstructions then apply to
the corrected surface: traciality kills all trace dictionaries at q = −1; the rank
obstruction kills the 5-dimensional linear-functional dictionaries there. The
negated claim and its owner are the project's own hypothesis — no external
conjecture is refuted.

**Headline discipline.** Sign-rule/parallelogram-defect-shaped claims only; never
"first q-deformation of a composition algebra" (Benkart–Pérez-Izquierdo 1998 owns
the object level).

## 2. Setting and notation

Blocks `Block = Bool × Bool × Bool`; for p = (p₁,p₂,p₃), p′ = (p′₁,p′₂,p′₃) (bits
read as 0/1), φQ(p,p′) = p₁p′₁ + p₁p′₂ + p₁p′₃ + p₂p′₂ + p₂p′₃ + p₃p′₃ (a quadratic
form, read mod 2 by the sign) and τ(p,p′) = p′₁p₂p₃ + p₁p′₂p₃ + p₁p₂p′₃ (the cubic
part); the deformed rule is σ_q(p,p′) = (−1)^{φQ(p,p′)}(−q)^{τ(p,p′)}. At q = −1
the deformation factor is (−q)^τ = 1 for every pair, so the specialized table
`sigmaRow p p′ := σ_{−1}(p,p′)` (integer-valued) is the quadratic specialization
(−1)^{φQ} — both obstructions below are statements about this specialized table.
`blocks8` the eight blocks; `lsum` a literal-list integer foldr (the
decide-friendly finite-sum form; the certificates are 8·-scaled so every decide
stays in integer arithmetic). A LINEAR-FUNCTIONAL REALIZATION of dimension d is a
word family `C : Block → Fin d → ℤ` (coefficients of the eight words w_p in a
d-dimensional space) and an evaluation matrix `Φ : Fin d → Fin d → ℤ`, with
σ(p,p′) = Σ_i Σ_j C p i · Φ i j · C p′ j — the C·Φ·Cᵀ factorization every
linear-functional (in particular every TL₃(δ)-functional) realization yields. A
TRACIAL evaluation satisfies `ev(uv) = ev(vu)` for all word pairs. TL₃(δ) has
dimension 5 (Catalan₃); the tauceti Jones/TL/Hecke results enter only as
statement-level quotes under the donor-hygiene gate (**donors** = the external
formalization repositories cited as prior work; a quotation check — their results
are cited, never imported; §6).

## 3. Main results

**Theorem A (traciality obstruction, `tracial_realizability_refuted`).** At
q = −1, no evaluation-with-words (ev, w) with per-word realizability
`ev(w_p · w_p′) = σ_{−1}(p,p′)` has ev tracial. Proof: traciality forces
`ev(w_u w_v) = ev(w_v w_u)`, hence σ_{−1}(u,v) = σ_{−1}(v,u) for all pairs; the
witness pair (100, 110) breaks it — σ_{−1}(100,110) = 1 ≠ −1 = σ_{−1}(110,100),
kernel decide (`sigmaQ_asym_witness`, [propext]). (Remark, not a theorem on disk:
both witness orders have τ = 0, with φQ = 2 versus 1, so the two breaking values
are the pure quadratic ones.) Consequence: every Markov/Hecke-trace-per-word
reading of the dictionary — the naive closure-trace form of the hypothesis — is
impossible at q = −1; any host for this table must be non-tracial
(tangle/Kauffman-bracket evaluations).

**Certificate B1 (orthogonality, `sigmaOrth`).** The specialized rows satisfy
`Σ_x σ_{−1}(p,x) σ_{−1}(p′,x) = 8·δ_{p,p′}` — the eight rows are pairwise
orthogonal integer vectors: the table is the Walsh/character table of the
quadratic form φQ mod 2. Kernel decide over the raw twelve-Boolean statement;
[propext].

**Certificate B2 (basis expansion at basis vectors, `sigmaExpand_basis`).** For
every basis vector e_{b₀}: `8·e_{b₀}(b) = Σ_p (Σ_{p′} σ_{−1}(p,p′) e_{b₀}(p′))
σ_{−1}(p,B)`. Kernel decide; [propext].

**Lifting (`sigmaExpand`).** By linearity (pointwise expansion of v under the
inner sum, scaling, swapping, scaling), the basis expansion holds for ALL integer
function vectors v. Axioms ⊆ {propext, Classical.choice, Quot.sound}.

**Theorem B (rank obstruction, `rank_obstruction_nogo`).** The kernel theorem is
conditional: for any C : Block → Fin 5 → ℤ and Φ : Fin 5 → Fin 5 → ℤ, if
v : Block → ℤ is a nonzero integer vector (hv) with `Σ_p C p j · v p = 0` for all
j (hdep — the eight word-coefficient rows are dependent), and the realization
equations `σ_{−1}(p,p′) = Σ_{i,j} C p i Φ i j C p′ j` (hreal) hold, then False.
Proof: every row contraction `Σ_{p′} σ_{−1}(p,p′) v p′` vanishes (substitute the
factorization, distribute, contract by hdep) — while the lifted expansion theorem
forces `8·v = 0`, i.e. v = 0: contradiction with hv. The witness binders are not
open conditions: for every C, the classical dimension argument (eight
word-coefficient vectors in a 5-dimensional space are ℚ-linearly dependent;
clearing denominators gives an integer relation) produces such a v. That argument
is NOT formalized in the artifact; modulo it, no 5-dimensional linear-functional
realization of the specialized table exists — and since TL₃(δ) has dimension 5,
EVERY 3-strand Temperley–Lieb dictionary — tracial or not, any functional, any
words — is so excluded at q = −1, while the table has full rank 8 (B1).

**The transports (the kept conditional direction, `hostTransportCor`/`hostTransportStratum`).**
For any fixed realizability datum (ev, w) over a commutative ring R with units
A, q — the Jones normalization enters as the binder `hq : q = −A²`, carried but
unused (the identity holds at every q) — the unified defect identity of the
companion article transports verbatim:
`ev(w_p w_{q₁})ev(w_{p′} w_{q₂}) + ev(w_p w_{q₂})ev(w_{p′} w_{q₁}) = (1−q)·aeval(GqGen)`
at every parallelogram quad (and its stratum form) — composition of the
realization hypothesis with the core identity. These are the surviving positive
halves of the (H) program: IF a dictionary is ever found (the q = −1, 3-strand
class is closed by Theorems A/B; every other territory is open), the defect
identity rides along.

**Corollary (the q = −1 closure).** At the q = −1 fiber, the dossier's 3-strand
TL hypothesis is false in every dictionary class considered: tracial dictionaries
by Theorem A (unconditional); 5-dimensional linear-functional dictionaries by
Theorem B completed by the classical dimension step (disclosed above). Whether a
host exists at all — at n ≥ 4 strands (TL₄, dimension 14 ≥ 8: necessary, not
sufficient), at other q-fibers, or in non-functional (e.g. nonlinear/
tangle-evaluation) classes — remains open (§7).

## 4. Novelty and nearest misses

Surveyed in the round-6 novelty survey `novelty/round6-41-battery.md` (§8b); the
rows below are its nearest-miss set for this negative.

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| tauceti Jones/TL/Hecke stack (`KnotTheory/TemperleyLieb.lean:87/:146`, `Hecke.lean:49`, `QuantumTrace.lean:41`, `BraidWord/Jones.lean`, `Homfly/Jones.lean`) | a complete formal Jones polynomial (Markov trace + invariance + HOMFLY specialization) — the would-be host | the host machinery exists and is quoted at statement level under the hygiene gate; NOTHING in it states or precludes a sign-rule dictionary — the obstructions are about the σ-table, proved here |
| Benkart–Pérez-Izquierdo, arXiv:math/9801141 (1998) | the q-composition object level (split octonions via U_q(D₄)) | no realization/host question posed there; no Walsh-rank or traciality content |
| eth `Eight.signs` (`SecCrossing_Identity.lean:261`) | the q = 1 alternation (mod-2) | the fiber being deformed; no host hypothesis, no obstruction |
| Kauffman bracket skein calculus (Kauffman 1988) | the ambient algebra of the intended non-tracial dictionaries | classical calculus; no certified non-realizability of any sign family |
| openai-math `HarmonicArtin.TemperleyLieb` + HoneycombChords dilute-TL | two further TL developments | Artin/loop-model shaped; no sign content, no obstruction class |
| tauceti `FactorSet.ofBimultiplicative` (`FactorSet.lean:571–576`) | formal bilinear sign cocycles | the bilinear cousin of the sign rule; no deformation, no host tier |

**Negative-class rows (same survey):**

| # | source | what it has | delta vs the REFUTED (H) |
|---|---|---|---|
| 3 | **tauceti Jones/TL/Hecke stack** (`jonesTrace`, `MarkovEquiv.jonesTrace_eq`, `BraidWord/Jones.lean`, `Homfly/Jones.lean`, `Hecke.lean:49`, Khovanov/Jimbo) | a COMPLETE formal Jones polynomial — the host machinery the (H) hope targeted | the negative's SHARPEST row: the complete host machinery exists in formal form, and the obstructions say it provably cannot carry this family's table at three strands at the q = −1 fiber — in the round-6 survey's corpora (§8b), the first incompatibility statement between a member of the deformed eight-square sign family and TL/Jones trace evaluations |
| 5 | **AFP Prathamesh 2016 "Knot_Theory"** (Isabelle) | tangle-based links + bracket-polynomial invariance | the bracket/skein calculus; no realization question of this shape, no obstruction content |
| 7 | **Kauffman bracket skein calculus** (classical) | the ambient algebra | no source poses, let alone answers, a sign-family ↔ trace-evaluation dictionary question |
| P1 | **the in-repo precedent (article 78: `articles/78-truffet-substitution-refutation.md`)** — a kernel-verified refutation article, the class template this article follows | the NEGATIVE billing class with owner attribution | identical billing class; our negative refutes the PROJECT'S OWN pre-registered hypothesis (the (H) host hope), not an external paper's claim — the honest analogue of 78's external-owner attribution |
| P2 | **the limitation-question genre** — e.g. Bigelow 2002, "Does the Jones polynomial detect the unknot?" | the genre's respectability: TL/Jones limitation statements are valued open problems | marker only, cited as genre: ours is a PROVED no-go in that genre's neighborhood; no claimed relation to the open questions |

The defect/skein-identity class "identities at parallelogram quads" stays EMPTY
beyond the companion article's proved identity and is untouched by the negative.

## 5. Proofs

Theorem A is two decides and one algebra step (traciality ⇒ symmetry; the witness
pair breaks symmetry). Certificates B1/B2 are single kernel decides over raw
twelve-Boolean statements — the 8×8 integer table is fully evaluated by the
kernel, no ℚ-arithmetic anywhere (the certificates are 8·-scaled; §2). The
lifting is explicit list-algebra (congruence, right-distributivity, swap) — no
new mathematics, which is the point: the certificates carry the content. Theorem
B is the factorization substitution: row contraction → triple-sum rearrangement →
the hdep contraction kills the inner sums → all contractions zero; the lifted
expansion at v forces 8v = 0, and v is an integer vector, so v = 0 against hv.
The kernel statement takes (v, hv, hdep) as explicit binders; that every
realization C admits such a nonzero v is the classical dimension argument
(disclosed at §3), not formalized here. The transports compose hreal with the
core identity (machinery copied from the verified core file,
`pilots/41/Core.lean`). Full Lean: `pilots/41/H1.lean`, `pilots/41/H2.lean`.

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm A | `Pilot41H1.tracial_realizability_refuted` | `H1.lean:436` | [propext, Quot.sound] | `pilots/41/logs/h1-run2.log:59` |
| Witness A | `Pilot41H1.sigmaQ_asym_witness` | `H1.lean:422` | [propext] (decide) | `h1-run2.log:58` |
| Transport | `Pilot41H1.hostTransportCor` (+`_full` :390, `_Stratum` :397/:409) | `H1.lean:379` | ⊆ {propext, Classical.choice, Quot.sound} | `h1-run2.log:54–57` |
| Statement-quote hygiene check (provenance, not a theorem) | `Pilot41H1.jonesDelta` (verbatim copy) + `JonesHomShape`/`SkeinRelationShape`/`QuantumTraceShape` (shape-analogs of the other four donors) | `H1.lean:68/:74/:81/:89` | [propext] / none / none / ⊆ {propext, Classical.choice, Quot.sound} | `h1-run2.log:34–37` |
| Cert B1 | `Pilot41H2.sigmaOrth` (+`_raw` :160) | `H2.lean:165` | [propext] (decide) | `h2-run11.log:45` |
| Cert B2 | `Pilot41H2.sigmaExpand_basis` (+`_raw` :173) | `H2.lean:179` | [propext] (decide) | `h2-run11.log:46` |
| Lifting | `Pilot41H2.sigmaExpand` | `H2.lean:236` | ⊆ {propext, Classical.choice, Quot.sound} | `h2-run11.log:47` |
| Thm B | `Pilot41H2.rank_obstruction_nogo` | `H2.lean:310` | ⊆ {propext, Classical.choice, Quot.sound} | `h2-run11.log:48` |

## 7. Limitations and open problems

- **The q ≠ −1 fibers and the n ≥ 4 remainder.** The two obstructions close only
  the q = −1 fiber. Theorem A is the q = −1 statement (the witness remark above
  suggests the same two values break symmetry at every q, since the witness pair
  has τ = 0 in both orders — unformalized); the rank obstruction is proved only
  at q = −1 (at other fibers the σ_q-table itself changes). The host search thus
  remains open: n ≥ 4 strands (TL₄, dim 14 ≥ 8, necessary not sufficient),
  non-tracial at q = −1 by force. The obstructions RAISE the prior that no
  dictionary exists at any strand count (the σ-table's structure is Walsh-rigid
  at the closed fiber). A future verification unit, if opened, would be a bounded
  TL₄-generator-word enumeration with the 64 σ_q-equations decide-checked per
  candidate — the negative outcome itself reportable as a third obstruction
  finding — and a q-genericity rider (det M(q) ≠ 0 as a polynomial in ℤ[q],
  checked at integer points) is the natural cheap companion; no fiber other than
  −1 is certified here.
- **The dictionary classes covered.** Theorem A covers all tracial evaluations at
  q = −1; Theorem B covers all 5-dimensional linear-functional realizations at
  q = −1 (every TL₃ functional), modulo the classical dimension step disclosed at
  the theorem. NOT covered: q ≠ −1 fibers (as kernel statements, for both
  mechanisms), n ≥ 4 linear-functional dictionaries, non-functional (e.g.
  nonlinear/tangle-evaluation) dictionaries at any strand count.
- **The scope fence.** If the host search fails everywhere, the dossier's
  declared fallback is the classical q = 1 octonion (Cayley–Dickson) anchor. The
  remaining host options (n ≥ 4 strands, non-trace evaluation shapes, other
  fibers) stay OPEN and UNCLAIMED: this article words (H) as a proved no-go at
  the q = −1, 3-strand class (both mechanisms) plus an open-problem restatement —
  no claim beyond the refuted dictionary class.
- **Honesty of method.** The proofs are elementary — kernel decides over an 8×8
  integer table plus list algebra; the nonelementary part is the STATEMENT: a
  certified non-realizability theorem for a deformed classical sign rule's
  quadratic specialization. **Elementary certificates, nonelementary closure.**
- The transports are conditional on a realization datum that Theorems A/B make
  impossible in the q = −1, 3-strand class (the rank half modulo the disclosed
  classical step); they are the kept direction for any future dictionary, not
  evidence one exists.

## 8. Prior work and references

**(a) Literature.** Benkart–Pérez-Izquierdo, arXiv:math/9801141 (1998). Kauffman,
*New invariants in the theory of knots* (1988) and the bracket state-model papers.
Jones's index-subfactor machinery and the Temperley–Lieb algebra literature
(classical; the dim-5 = Catalan₃ fact). Walsh/Hadamard character-orthogonality
(classical, the §3 table's shape).

**(b) Project artifacts.** Companion article: `articles/41-parallelogram-defect-
deformation-eight-square.md`. Pilot records: `pilots/41/H-record.md` (the
verification history), `pilots/41/H-preflight.md`, `pilots/41/H1.lean`,
`pilots/41/H2.lean` with `pilots/41/logs/h1-run{1,2}.log` and
`pilots/41/logs/h2-run{1..11}.log` (the audits of record are runs 2 and 11).
Novelty survey: `novelty/round6-41-battery.md`. Dossier: `candidates/41-q-deformed-
eight-square-temperley-lieb.md` (the refuted (H) hypothesis's home). Donor sources
(read-only, quoted at statement level): tauceti
`KnotTheory/TemperleyLieb.lean:87/:146/:157`, `Hecke.lean:49`,
`UqSl2/QuantumTrace.lean:41`.
