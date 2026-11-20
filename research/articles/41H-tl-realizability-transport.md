# No Three-Strand Temperley–Lieb Dictionary for the q-Deformed Eight-Square Sign Rule: Certified Traciality and Rank Obstructions

*kind: NEGATIVE — refutation/no-go (discovery-grade per the orchestrator's BANK-AS-NEGATIVE
ruling 2026-11-19: second-discovery of the pilot-41 program, the article-78 precedent —
quota NOT consumed; own file per the standing instruction, never combined with the
41-core identity article) · date: 2026-11-19 (**shipped at the splice — R9's §NEGATIVE (battery FINAL v2
`17970d4b`) + R2's S1–S4 4/4 (`ace8bd28`) + the orchestrator's signal**) ·
supersedes: the content-free stub of this same file (R4's LANDED-FACTS state,
committed batch P; superseded in-place at this splice — the stub made no content claims) · artifacts:
`research/pilots/41/H1.lean` (GREEN h1-run2, fired = on-disk sha256(16)
`283503ada8f5571e`), `research/pilots/41/H2.lean` (GREEN h2-run11: fired bytes
sha256(16) `9534383949a6ac0c`; on-disk `3bc8170121492d18` = fired + a comment-only
status note, both documented in-file and in the run-11 provenance header),
`research/pilots/41/logs/h1-run{1,2}.log`, `logs/h2-run{1..11}.log` (H2's runs 9–11 =
the re-charter confirm sequence; the verdict of record is h2-run11)*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| **Thm A — the traciality obstruction** (`tracial_realizability_refuted`): NO tracial evaluation realizes σ_q on word products | PROVED-UNCONDITIONAL | none (the refuted class: any evaluation + word family with per-word realizability and traciality, at q = −1, over ℤ) | `pilots/41/H1.lean`, audit [propext, Quot.sound] (`h1-run2.log`); the breaking witness `sigmaQ_asym_witness` [propext] by kernel decide |
| **Thm B — the rank obstruction** (`rank_obstruction_nogo`): NO 5-dimensional linear-functional realization of the specialized σ-table | PROVED-UNCONDITIONAL | none as mathematical content — the (C, Φ, v, hv, hdep) binders are the unfolding of "given any 5-dimensional realization" (the dependence witness v exists by pigeonhole: 8 word vectors in dimension 5; carried explicit per the statement-binder discipline) | `pilots/41/H2.lean:306`, audit [propext, Classical.choice, Quot.sound] (`h2-run11.log`) |
| Certificate B1 (`sigmaOrth`): the σ-rows are pairwise orthogonal, ⟨r_p, r_p′⟩ = 8·δ_{p,p′} | PROVED-UNCONDITIONAL (kernel decide over the raw twelve-Boolean form) | none | `H2.lean:165` (raw `:160`), audit [propext] |
| Certificate B2 (`sigmaExpand_basis`): 8·e_{b₀} = Σ_p ⟨r_p, e_{b₀}⟩ r_p at every basis vector | PROVED-UNCONDITIONAL (kernel decide) | none | `H2.lean:179` (raw `:173`), audit [propext] |
| Lifting (`sigmaExpand`): the basis expansion holds for ALL integer function vectors | PROVED-UNCONDITIONAL | none | `H2.lean:236`, audit triad |
| Transport (`hostTransportCor` / `hostTransportStratum`): any fixed realizability datum transports the unified defect identity / its stratum form | PROVED-CONDITIONAL | binders: the evaluation datum `ev`, the word family `w`, the fiber equation `hq : q = −A²`, and the per-word realizability hypothesis `hreal` | `pilots/41/H1.lean`, audits triad (`h1-run2.log`) |
| Donor-hygiene gate (§T): verbatim quotes of the five named tauceti donors + on-pin shape-analogs | PROVED-UNCONDITIONAL (statement-binder class; NOTHING imported or consumed) | none | `H1.lean` §T, `h1-run1.log` gate output (jonesDelta verbatim [propext]; JonesHomShape/SkeinRelationShape zero axioms; QuantumTraceShape triad) |

## Abstract

The q-deformed eight-square sign rule σ_q (companion article) asks for a host in the
Temperley–Lieb/Jones world: a dictionary reading σ_q(p,p′) as evaluations ϕ(w_p · w_p′)
of words in a TL algebra. We prove TWO certified obstructions that together close the
3-strand tier of that hypothesis. Theorem A (traciality): no tracial evaluation — in
particular no Markov/Hecke-trace-per-word reading — can realize σ_q, since σ_q is
asymmetric on a witness pair (kernel-decided). Theorem B (rank): at q = −1 the
σ-table is the full-rank Walsh table of the invertible form φQ mod 2 — orthogonal rows
plus a basis expansion, both kernel-decided over ℤ, lifted by linearity — while every
5-dimensional (TL₃(δ), Catalan₃) linear-functional realization factors as C·Φ·Cᵀ with
rank ≤ 5: contradiction. Both obstructions are unconditional kernel proofs (Lean 4,
decide-certificates over ℤ); the 3-strand Temperley–Lieb hypothesis is therefore FALSE
in every dictionary class considered, and the deformation's host, if any, lives at
n ≥ 4 strands, non-tracial. As far as the surveyed corpora show, this is the first
incompatibility statement between a cubic-corrected sign family and TL/Jones
trace evaluations.

## 1. Introduction

The companion article (the 41-core identity) deforms the eight-square sign rule by
σ_q(p,q) = (−1)^{φQ(p,q)}(−q)^{τ(p,q)} and proves the unified parallelogram-defect
identity. The project dossier additionally hypothesized a HOST theorem (H): a
Temperley–Lieb/Jones dictionary realizing σ_q through braid-word evaluations, at
3 strands with the Jones/Kauffman normalization q = −A². This article proves that
hypothesis FALSE in every dictionary class considered, by two independent obstructions,
and re-scopes the host search to n ≥ 4 strands, non-tracial.

**Provenance, told once.** The (H) statement passed through three project stages before
this refutation: the dossier's [HYPOTHESIS] form (3-strand TL, eight words w_p, a
Markov-trace-flavored reading); the statement-rung binder (`HostTransport` in the P0 —
barred from consumption by the promotion ruling); and the corrected surface used here
(`HostTransportCor`/`HostTransportStratum` over the corrected GqGen defect polynomial,
with the realizability datum as explicit binders — the transports themselves are proved
and banked as the conditional direction). The obstructions then land ON the corrected
surface: traciality (tranche 1) kills all trace dictionaries; the rank obstruction
(tranche 2) kills all 5-dimensional linear-functional dictionaries. The negated claim
and its owner are the project's own hypothesis — no external conjecture is refuted.

**Headline discipline (inherited, locked).** Sign-rule/parallelogram-defect-shaped
claims only; NEVER "first q-deformation of a composition algebra" (Benkart–Pérez-
Izquierdo 1998 owns the object level). The negative-class novelty row refresh (R9's
§NEGATIVE appendix) landed — battery FINAL v2 `17970d4b`.

## 2. Setting and notation

Blocks `Block = Bool³` with the companion article's σ_q; the specialized table
`sigmaRow p p′ := σ_{−1}(p, p′)` (the q = −1 fiber, integer-valued); `blocks8` the eight
blocks; `lsum` a literal-list integer foldr (the decide-friendly finite-sum form — see
§6's substrate notes). A LINEAR-FUNCTIONAL REALIZATION of dimension d is a word family
`C : Block → Fin d → ℤ` (coefficients of the eight words w_p in a d-dimensional space)
and an evaluation matrix `Φ : Fin d → Fin d → ℤ`, with
`σ(p,p′) = Σ_i Σ_j C p i · Φ i j · C p′ j` — the C·Φ·Cᵀ factorization every
linear-functional (in particular every TL₃(δ)-functional) realization yields. A TRACIAL
evaluation satisfies `ev(uv) = ev(vu)` for all word pairs. TL₃(δ) has dimension 5
(Catalan₃); the tauceti donors (jonesDelta, the Jones hom, the skein-characterized
Hecke trace, the quantum trace) enter only as verbatim statement-level quotes under the
donor-hygiene gate — nothing is imported (§6).

## 3. Main results

**Theorem A (traciality obstruction, `tracial_realizability_refuted`).** At q = −1,
no evaluation-with-words (ev, w) with per-word realizability `ev(w_p · w_p′) = σ(p,p′)`
has ev tracial. Proof: traciality forces `ev(w_u w_v) = ev(w_v w_u)`, hence
σ(u,v) = σ(v,u) for all pairs; the witness pair (100, 110) breaks it —
σ(100,110) = 1 ≠ −1 = σ(110,100), kernel decide (`sigmaQ_asym_witness`, [propext]).
Consequence: every Markov/Hecke-trace-per-word reading of the dictionary — the naive
closure-trace form of the hypothesis — is impossible; any host must be non-tracial
(tangle/Kauffman-bracket evaluations).

**Certificate B1 (orthogonality, `sigmaOrth`).** The specialized rows satisfy
`Σ_x σ(p,x) σ(p′,x) = 8·δ_{p,p′}` — the eight rows are pairwise orthogonal
integer vectors: the table is the Walsh/character table of the invertible form φQ
mod 2. Kernel decide over the raw twelve-Boolean statement; [propext].

**Certificate B2 (basis expansion at basis vectors, `sigmaExpand_basis`).** For every
basis vector e_{b₀}: `8·e_{b₀}(b) = Σ_p (Σ_{p′} σ(p,p′) e_{b₀}(p′)) σ(p,B)`. Kernel
decide; [propext].

**Lifting (`sigmaExpand`).** By linearity (pointwise expansion of v under the inner
sum, scaling, swapping, scaling), the basis expansion holds for ALL integer function
vectors v. Triad-clean.

**Theorem B (rank obstruction, `rank_obstruction_nogo`).** No 5-dimensional
linear-functional realization of the specialized table exists. Given any (C, Φ)
with `σ(p,p′) = Σ_{i,j} C p i Φ i j C p′ j`, take the pigeonhole dependence witness
v ≠ 0 with `Σ_p C p j · v p = 0` for all j (8 word vectors in dimension 5); then every
row contraction `Σ_{p′} σ(p,p′) v p′` vanishes (substitute the factorization,
distribute, contract) — while the lifted expansion theorem forces `8·v = 0`, i.e.
v = 0: contradiction. Since TL₃(δ) has dimension 5, EVERY 3-strand Temperley–Lieb
dictionary — tracial or not, any functional, any words — collapses to a singular
table, while the table has full rank 8.

**The transports (banked conditional direction, `hostTransportCor`/`hostTransportStratum`).**
For any fixed realizability datum (ev, w) at the Jones fiber `q = −A²`, the unified
defect identity of the companion article transports verbatim:
`ev(w_p w_{q₁})ev(w_{p′} w_{q₂}) + ev(w_p w_{q₂})ev(w_{p′} w_{q₁}) = (1−q)·aeval(GqGen)`
at every parallelogram quad (and its stratum form) — composition of the realization
hypothesis with the core identity. These are the surviving positive halves of the (H)
program: IF a (necessarily ≥ 4-strand, non-tracial) dictionary is ever found, the
defect identity rides along.

**Corollary (the closure).** The dossier's 3-strand TL hypothesis is FALSE in every
dictionary class considered: tracial dictionaries by Theorem A; arbitrary
5-dimensional linear-functional dictionaries by Theorem B. The host, if any, lives at
n ≥ 4 strands (TL₄, dimension 14 ≥ 8 — necessary, not sufficient), non-tracial.

## 4. Novelty and nearest misses (seeded from R9's §NEGATIVE appendix, landed `17970d4b`)

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| tauceti Jones/TL/Hecke stack (`KnotTheory/TemperleyLieb.lean:87/:146`, `Hecke.lean:49`, `QuantumTrace.lean:41`, `BraidWord/Jones.lean`, `Homfly/Jones.lean`) | a complete formal Jones polynomial (Markov trace + invariance + HOMFLY specialization) — the would-be host | the host machinery exists and is cited verbatim under the hygiene gate; NOTHING in it states or precludes a sign-rule dictionary — the obstructions are about the σ-table, proved here |
| Benkart–Pérez-Izquierdo, arXiv:math/9801141 (1998) | the q-composition object level (split octonions via U_q(D₄)) | no realization/host question posed there; no Walsh-rank or traciality content |
| eth `Eight.signs` (`SecCrossing_Identity.lean:261`) | the q = 1 alternation (mod-2) | the fiber being deformed; no host hypothesis, no obstruction |
| Kauffman bracket skein calculus (Kauffman 1988) | the ambient algebra of the intended non-tracial dictionaries | classical calculus; no certified non-realizability of any sign family |
| openai-math `HarmonicArtin.TemperleyLieb` + HoneycombChords dilute-TL | two further TL developments | Artin/loop-model shaped; no sign content, no obstruction class |
| tauceti `FactorSet.ofBimultiplicative` (`FactorSet.lean:571–576`) | formal bilinear sign cocycles | the bilinear cousin of the sign rule; no deformation, no host tier |

**Negative-class rows (refreshed from R9's §NEGATIVE appendix N1, the gate landed):**

| # | source | what it has | delta vs the REFUTED (H) |
|---|---|---|---|
| 3 | **tauceti Jones/TL/Hecke stack** (`jonesTrace`, `MarkovEquiv.jonesTrace_eq`, `BraidWord/Jones.lean`, `Homfly/Jones.lean`, `Hecke.lean:49`, Khovanov/Jimbo) | a COMPLETE formal Jones polynomial — the host machinery the (H) hope targeted | the negative's SHARPEST row: the complete host exists, and the obstruction says it PROVABLY cannot carry this family at 3 strands — to our knowledge the first incompatibility statement between an eth-type cubic-corrected sign family and TL/Jones trace evaluations anywhere |
| 5 | **AFP Prathamesh 2016 "Knot_Theory"** (Isabelle) | tangle-based links + bracket-polynomial invariance | the bracket/skein calculus; no realization question of this shape, no obstruction content |
| 7 | **Kauffman bracket skein calculus** (classical) | the ambient algebra | no source poses, let alone answers, a sign-family ↔ trace-evaluation dictionary question |
| P1 | **the 78 precedent (in-repo, governing)** — `articles/78-truffet-substitution-refutation.md`: kernel-verified refutation, kind NEGATIVE, discovery-grade (ruling 2026-11-17), owner-attribution discipline | the class template this article follows | identical billing class; our negative refutes a DOSSIER-INTERNAL hypothesis (the (H) banked hope), not an external paper's claim — attribution to our own pre-registered conjecture (the honest analogue of 78's external-owner discipline) |
| P2 | **the limitation-question genre (external marker)** — e.g. Bigelow 2002, "Does the Jones polynomial detect the unknot?" | the genre's respectability: TL/Jones limitation statements are valued open problems | marker only, cited as genre: ours is a PROVED no-go in that genre's neighborhood; no claimed relation to the open questions |

The L1 class row "defect/skein identities at parallelogram quads" stays EMPTY and is
untouched by the negative — the landed identity remains the class's only member.

## 5. Proofs

Theorem A is two decides and one algebra step (traciality ⇒ symmetry; the witness pair
breaks symmetry). Certificates B1/B2 are single kernel decides over raw
twelve-Boolean statements — the 8×8 integer table is fully evaluated by the kernel,
no ℚ-arithmetic anywhere (the substrate rule of §6). The lifting is explicit
list-algebra (congruence, right-distributivity, swap) — no new mathematics, which is
the point: the certificates carry the content. Theorem B is the factorization
substitution: row contraction → triple-sum rearrangement → the hdep contraction kills
the inner sums → all contractions zero; the lifted expansion at v forces 8v = 0, and v
is an integer vector, so v = 0 against hv. The transports compose hreal with the core
identity (machinery copied verbatim from the GREEN core file). Full Lean:
`pilots/41/H1.lean`, `pilots/41/H2.lean`.

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm A | `Pilot41H1.tracial_realizability_refuted` | `H1.lean` §3 | [propext, Quot.sound] | `pilots/41/logs/h1-run2.log` (audit block) |
| witness | `Pilot41H1.sigmaQ_asym_witness` | `H1.lean` §3 | [propext] (decide) | as above |
| Transport | `Pilot41H1.hostTransportCor` (+`_full`, `_Stratum`) | `H1.lean` §2 | ⊆ triad | as above |
| Hygiene gate | `Pilot41H1.jonesDelta` + `JonesHomShape`/`SkeinRelationShape`/`QuantumTraceShape` | `H1.lean` §T | [propext] / zero axioms / triad | `h1-run1.log` (gate output) |
| Cert B1 | `Pilot41H2.sigmaOrth` (+`_raw`) | `H2.lean:165/:160` | [propext] (decide) | `pilots/41/logs/h2-run11.log` |
| Cert B2 | `Pilot41H2.sigmaExpand_basis` (+`_raw`) | `H2.lean:179/:173` | [propext] (decide) | as above |
| Lifting | `Pilot41H2.sigmaExpand` | `H2.lean:236` | ⊆ triad | as above |
| Thm B | `Pilot41H2.rank_obstruction_nogo` | `H2.lean:306` | ⊆ triad | as above |

**Run-of-record tables + the bytes story (told once).**

| H1 run | bytes sha256(16) | verdict | wall |
|---|---|---|---|
| 1 (§T gate) | `471575520b29fc32` | NOT-GREEN 2 err (named-arg syntax); GATE OUTPUT printed — the five donors quoted, shapes zero-axiom/triad | 55 s |
| 2 (full file) | `283503ada8f5571e` | **GREEN** (0/0; fired = on-disk, no post-green edits) | 41 s |

| H2 run | bytes sha256(16) | verdict |
|---|---|---|
| 1–4 | (design iterations) | NOT-GREEN — v1 det-decide stuck, v2 ℚ-division stall, v3/v4 isolated non-whnf classes |
| 5 | — | NOT-GREEN — **the `Rat.add` extern-opacity discovery**: even 0+0 at ℚ fails to whnf under decide on v4.36.0-rc2; retro-explains all stalls |
| 5b–8 | (`ab8da9e12feb44c7` at 8) | certificates GREEN ([propext]); lifting + no-go open at cap — STOP-at-cap invoked (10/10 cumulative) |
| 9 | — | sigmaExpand GREEN (triad) — the re-charter's run 1 |
| 10 | `06431ff427bcdfcd` | NOT-GREEN 2 err — both the SAME final congr-step, fully diagnosed; the one-line closed-shape fix applied in-file as a DOCUMENTED UNFIRED amendment (bytes `9534383949a6ac0c`) |
| 11 | `9534383949a6ac0c` | **GREEN — 0 errors, 0 sorry**; full audit as tabled (wall 63 s). The verdict of record. On-disk `3bc8170121492d18` = fired bytes + comment-only status note; both shas documented |

**Substrate notes (durable, for every future decide file):** kernel-decided
propositions on this toolchain use INTEGER arithmetic only (`Rat.add`/`Rat.div` are
extern-opaque — the 8·-scaled certificate pattern carries all denominators outside the
decides); `Matrix.mul`/`Finset.sum`/`Matrix.det` do not whnf under decide at this
scale (literal-list foldrs do); the ᵀ postfix attaches only to bare identifiers. The
donor-hygiene gate quotes the five tauceti donors verbatim at statement level with
on-pin shape-analogs; NO tauceti module is imported or consumed — the on-tauceti-pin
`#print axioms` stays deferred to actual-import time per the no-consumption rule.

**Committed-bytes stamps (the D.4 discipline, at this splice commit):** `H1.lean`
fired = on-disk committed sha256(16) `283503ada8f5571e` (h1-run2 GREEN); `H2.lean`
fired `9534383949a6ac0c` (h2-run11 GREEN, the verdict of record) / on-disk committed
`3bc8170121492d18` = fired + a comment-only status note (both documented in-file);
this article's own committed bytes carry "this commit" (the splice-2 commit).

## 7. Limitations and open problems

- **The n ≥ 4 remainder, with its raised prior.** The two obstructions leave open —
  and re-scope — the host search: n ≥ 4 strands (TL₄, dim 14 ≥ 8, necessary not
  sufficient), non-tracial by force. The honesty note the next charter carries: the
  obstructions RAISE the prior that no dictionary exists at any strand count (the
  σ-table's structure is Walsh-rigid); tranche 3, if chartered, is priced as
  SEARCH-WITH-NO-GO-ESCALATION — a bounded TL₄-generator-word enumeration with the
  64 σ_q-equations decide-checked per candidate, the negative outcome itself
  reportable as a third obstruction finding. A q-genericity rider (det M(q) ≠ 0 as a
  polynomial, checked at integer points) is the cheap companion.
- **The dictionary classes covered.** Theorem A covers all tracial evaluations;
  Theorem B covers all 5-dimensional linear-functional realizations (every TL₃
  functional). NOT covered: n ≥ 4 linear-functional dictionaries, non-functional
  (e.g. nonlinear/tangle-evaluation) dictionaries at any strand count, and q-fibers
  other than −1 for the rank argument (the traciality obstruction is q-generic in
  shape but stated at the witness fiber).
- **The scope fence (N2).** (H) is restated as the dossier's own pre-negotiated
  descope branch — "(H) no-match ⇒ Cayley–Dickson anchor": the q = 1 octonion host
  remains the classical anchor; the remaining host options (n ≥ 4 strands, non-trace
  evaluation shapes) stay OPEN and UNCLAIMED. This article words (H) as a proved no-go
  at 3 strands (both mechanisms) plus an open-problem restatement — no claim beyond
  the refuted dictionary.
- **Honesty of method (the S3 analog, locked).** The proofs are elementary — kernel decides
  over an 8×8 integer table plus list algebra; the nonelementary part is the
  STATEMENT: a certified non-realizability theorem for a deformed classical sign
  rule. **Elementary certificates, nonelementary closure** (the locked negative
  reading, R9's §N3).
- The transports are conditional on a realization datum that Theorems A/B make
  3-strand-impossible; they are the banked direction for any future ≥ 4-strand
  dictionary, not evidence one exists.

## 8. Prior work and references

**(a) Literature.** Benkart–Pérez-Izquierdo, arXiv:math/9801141 (1998). Kauffman,
*New invariants in the theory of knots* (1988) and the bracket state-model papers.
Jones's index-subfactor machinery and the Temperley–Lieb algebra literature
(classical; the dim-5 = Catalan₃ fact). Walsh/Hadamard character-orthogonality
(classical, the §3 table's shape).

**(b) Project artifacts.** Companion article: `articles/41-parallelogram-defect-
deformation-eight-square.md` (shipped at splice `cb87a67`; the iteration's
first DISCOVERY). Pilot records:
`pilots/41/H-record.md` (the tranche history + the bank ruling + the tranche-3 seed),
`pilots/41/H-preflight.md`, `H1.lean`/`H2.lean` + `logs/h1-run{1,2}.log`,
`logs/h2-run{1..11}.log`. Donor sources (read-only, verbatim-quoted under the gate):
tauceti `KnotTheory/TemperleyLieb.lean:87/:146/:157`, `Hecke.lean:49`,
`UqSl2/QuantumTrace.lean:41`. Novelty: `novelty/round6-41-battery.md` (FINAL +
§LANDING; the §NEGATIVE appendix landed `17970d4b`). Dossier:
`candidates/41-q-deformed-eight-square-temperley-lieb.md` (the negated (H)
hypothesis's home; its correction fold landed at batch 6).

## 9. Shipping gate (self-audit; final — splice-day state)

| # | rule | state |
|---|---|---|
| 1 | kind is a §0 article kind | PASS — NEGATIVE (refutation/no-go; the negated claim and its owner — the project's own (H) hypothesis — attributed in title/§1/§3); discovery-grade per the BANK-AS-NEGATIVE ruling, quota-free |
| 2 | title free of project-internal tokens | PASS — the negated claim + the mathematical content stated |
| 3 | status rows, closed vocabulary, binders listed | PASS — Thm B's binder column states the unfolding explicitly; the transports list their realization binders |
| 4 | abstract ≤ 200 words, all five elements | PASS at splice — 179 words, finalized in-commit |
| 5 | novelty table ≥ 2 rows, scoped "first" | PASS — 6 base rows + the five N1 negative-class rows (3/5/7/P1/P2); the scope qualifier in-sentence (§NEGATIVE landed, `17970d4b`) |
| 6 | no bracketed errata | PASS — the three-stage provenance is §1 prose, told once |
| 7 | no section contradicts another | PASS — §3's closure matches §7's remainder; the transports' conditionality is stated in both |
| 8 | formal record table-only, no infra narration | PASS (register: "elementary certificates, nonelementary closure") |
| 9 | internal vocabulary ≤ 3 glosses | PASS — "dossier", "battery", "tranche" glossed at first use |
| 10 | citations spot-checked (5+) | PASS at splice — donor file:line re-verified via the hygiene gate's at-source quotes against the committed tree |
| 11 | README row updated in the same commit | SATISFIED — in this commit (row-41H + the counts 7→8, per the package §1a/§1b) |
| 12 | superseded files marked | PASS — supersedes the content-free stub of this same file (noted in the front matter) |

— SHIPPED at the 2026-11-19 splice-2 commit (this commit): R7 (A9 lineage) drafted
(the fill of R4's content-free stub); H applied the splice per
`qa/iter4-review/a7-41h-splice-package.md` on the orchestrator's signal. Ship chain:
R7 draft + R9's §NEGATIVE (battery FINAL v2 `17970d4b`) + R2's S1–S4 4/4
(`ace8bd28`, locked wording + scope-fence riders applied). Kind NEGATIVE,
discovery-grade, quota NOT consumed (the BANK-AS-NEGATIVE ruling 2026-11-19, the 78
precedent).
