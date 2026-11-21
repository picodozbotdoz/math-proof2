# No Linear Host of Dimension at Most 7 for the q-Deformed Eight-Square Sign Rule at Either Closed Fiber: Certified Walsh Rank and the Empty Monomial-Word Search

*kind: NEGATIVE — no-go (ruled discovery-grade at the 2026-11-20 ship gate, on the
precedent of the two earlier NEGATIVE articles, 78 and 41H) · date: 2026-11-20
(shipped 2026-11-20, commit `e4ac8dd` — the index row and discovery counts landed in
the same commit) · supersedes: none (own file; the companion article
`41H-tl-realizability-transport.md` — the 3-strand closure — stands unchanged; this
is the n ≥ 4 continuation the 41H §7 remainder named) · artifacts:
`research/pilots/41/H3.lean` (verification run `h3-s-run1`, passed — 0 errors, 0
`sorry`; on-disk sha256(16) `833dcff84309c986`),
`research/pilots/41/logs/h3-s-run1.log` (`6dc794e7a27d8565`),
`research/pilots/41/H3-M-candidates.md` (`7647a1f9859764bc` — the pre-solve record
[the mechanical candidate scan of record], CERTIFIED-NUMERIC class),
`research/novelty/round7-h3-battery.md` (`5f0b57cc99556d4d` — the novelty survey),
`research/pilots/41/H3-precharter.md` (`60278bd4b6e824bf`)*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| **Thm C1** — both closed fibers are certified Walsh tables: `sigmaOneOrth`/`sigmaOneExpand_basis` (q = +1, the eth table) beside `sigmaOrth`/`sigmaExpand_basis` (q = −1, re-proved verbatim) | PROVED-UNCONDITIONAL | none (kernel decides over the raw six-Boolean forms) | `H3.lean:196/:209/:160/:173`, audit [propext] ×4 (`h3-s-run1.log:53–56`) |
| **Thm C2 — the generalized lifting** `tableExpand`: any row family with the 8·-scaled basis certificate expands to ALL integer function vectors (H2's lifting exists once, over an arbitrary family) | PROVED-UNCONDITIONAL | none as content — the certificate enters as the `hbasis` binder, a property of the row family proved for both fibers by C1's expansion theorems, not an open hypothesis | `H3.lean:278`, audit triad (`h3-s-run1.log:58`); instances `sigmaExpand`/`sigmaOneExpand` triad (`:59–60`) |
| **Thm C3 — the two-fiber rank no-go** `no_realization_dim7` + `no_realization_dim7_one` (via `table_rank_nogo`, the strand-free generalization over an arbitrary index list): NO d ≤ 7-dimensional linear-functional realization of EITHER certified table | PROVED-UNCONDITIONAL | none as mathematical content — the (C, Φ, v, hv, hdep) binders unfold "given any d ≤ 7 realization" (pigeonhole 8 > 7) | `H3.lean:422/:433` (general :369), audit triad ×3 (`h3-s-run1.log:61–63`) |
| Witness `sigmaOne_asym_witness`: σ₊(100,010) = −σ₊(010,100) | PROVED-UNCONDITIONAL | none | `H3.lean:221`, audit [propext] (`h3-s-run1.log:57`) |
| The pre-solve scans (the empty monomial-word candidate list + planted-solution controls + the record note's structural findings) | **CERTIFIED-NUMERIC** — machinery-validated computation (exact-integer host construction; the scanner's rank/QR path is float-validated by planted controls at residual ~10⁻¹³), NOT kernel theorem (the 41H §N3 convention; 2026-11-20 ruling); **generator/checker + outputs ARCHIVED 2026-11-21** at `pilots/41/presolve/` (the custody-settlement re-run of record: per-fiber counts, S1 census and controls reproduced, 0 survivors) — never in the proved-artifact counts | n/a (computation class) | `H3-M-candidates.md` §1–§2 (`7647a1f9`) + `pilots/41/presolve/` (the archive) |

All kernel rows: mathlib `ff2494ea`, Lean v4.36.0-rc2, `import Mathlib` only, zero
`sorry`, zero `native_decide`, no tauceti import at any point (statement-binder
class only — the spin-host construction is the independent-literals route).

## Abstract

The q-deformed eight-square sign rule σ_q asks which algebra hosts realize its
8×8 table as evaluations of word products. The companion article closed the 3-strand
tier (no 5-dimensional Temperley–Lieb₃ realization at q = −1). We close the
small-host tier at BOTH closed fibers. First, four kernel certificates, two per
fiber (Theorem C1, PROVED-UNCONDITIONAL): the q = +1 fiber, the undeformed table,
is a permuted Walsh matrix (rows = characters of the affine forms a₊(p)·p′), and
an asymmetry witness: any q = +1 dictionary is
non-tracial at every strand count. Second (Theorem C3, PROVED-UNCONDITIONAL): the
strand-free rank obstruction excludes every host of dimension at most 7 at both
fibers; Temperley–Lieb₄ (dimension 14) is the minimal Temperley–Lieb host. Third, a
machinery-validated search over the spin host (16-dimensional) finds NO
monomial-word dictionary at either fiber (CERTIFIED-NUMERIC: computation evidence,
never kernel; 0 survivors in ~3×10⁸ systems in the archived per-fiber re-scan,
controls at residual ~10⁻¹³);
the structural obstruction: realizable tables span at most 14 of the 64 table
dimensions. Nearest prior work: the corpus's spin-host Markov-trace machinery,
which builds the searched host but never poses the prescribed-table realizability
question. Combination words remain open; dimension counting does not preclude
them.

## 1. Introduction

The companion article (41H) proved the program's 3-strand hypothesis false
and re-scoped the host search to n ≥ 4 strands, non-tracial. This article is that
program's first step: the small-host closure at both closed fibers, and the first
structured search of the standard n = 4 host.

**Provenance, told once.** The (H3) program passed through: the companion's no-go
escalation; the precharter (`60278bd4`, the small/medium/large work ladder); the
kernel verification of 2026-11-20 (passed first shot, novelty cleared by the round-7
survey); the pre-solve (the mechanical candidate scan of record; the candidate list
EMPTY in every scanned class); and the 2026-11-20 ruling — no medium-stage search;
the outcome stands as the proved no-go, the pre-solve, and the open combination
tier. The negated claim family is again the project's own hypothesis (the (H)/(H3)
host hope); no external conjecture is refuted.

**The kind call.** Kind NEGATIVE, the 41H family form, ruled discovery-grade at the
2026-11-20 ship gate. The shipped mathematical content is a PROVED no-go (Theorems
C1–C3, kernel, unconditional); the pre-solve is evidence RAISING the negative's
prior, billed CERTIFIED-NUMERIC per the ruling's own class (never kernel theorem);
and the open combination tier is an honest remainder in the 41H §7 pattern — not a
conditional discovery schema whose hypothesis-structure would be the deliverable
(article 75's conditional shape).

**Headline discipline (inherited, locked).** Sign-rule/parallelogram-defect-shaped
claims only; NEVER "first q-deformation of a composition algebra" (Benkart–Pérez-
Izquierdo 1998 owns the object level). Novelty wording per the round-7 novelty
survey's locks: **host-scoped negatives only — never "no TL₄ dictionary"** (the spin host is
one host, the kernel may hide others); and the fiber-scoped sharpening rides every
transfer sentence: the negative transfers to TL₄ GENERATOR-WORD dictionaries AT
δ = ±2, never to combination words.

## 2. Setting and notation

The companion article's surface, verbatim: blocks `Block = Bool³`, the quadratic
phase φQ, the cubic phase τ = φ₁+φ₂+φ₃, and the deformed sign
`σ_q(p,p′) = (−1)^{φQ(p,p′)}·(−q)^{τ(p,p′)}`. The two closed fibers are q = −1
(δ = −2; the Walsh table of the cumsum bijection b(p) = pᵀL, companion Thm B) and
q = +1 (δ = +2; the UNDEFORMED table σ = (−1)^{φQ+τ} — eth's own `Eight.signs`
alternation). A LINEAR-FUNCTIONAL REALIZATION of dimension d is a word family
`C : Block → Fin d → ℤ` and matrix `Φ : Fin d → Fin d → ℤ` with
`σ(p,p′) = Σ_{i,j} C p i · Φ i j · C p′ j` — the C·Φ·Cᵀ factorization every
linear-functional realization yields, whatever the host algebra. The certificates
are 8·-scaled, division-free, over literal-list integer foldrs (the substrate
rules; no ℚ-arithmetic under decide).

## 3. Main results

**Theorem C1 (both closed fibers are certified Walsh tables).** At q = +1 the eight
rows satisfy ⟨r_p, r_{p′}⟩ = 8·δ_{p,p′} and the 8·-scaled basis expansion at every
basis vector — kernel decides over the raw six-Boolean forms, [propext] each. The
row characters are the affine forms a₊(p)·p′ with a₊(p) = b(p) + c(p), c(p) =
(p₂p₃, p₁p₃, p₁p₂) the cubic row-gradient (the precharter's mechanically
cross-checked hand table, now kernel-certified; the a₊-bijection over all 64 pairs
was machine-checked before the verification run). The q = −1 certificates are re-proved verbatim
(self-containment). Reading: BOTH closed fibers are nonsingular, |det| = 8⁴ each —
the full-rank phenomenon is the deformation's, not one fiber's accident.

**Theorem C2 (the strand-free lifting).** H2's expansion lifting is generalized
over an arbitrary row family: any family carrying the 8·-scaled basis certificate
expands to all integer function vectors. The delicate rewriting chain exists ONCE
(`tableExpand`); the two fiber instances are corollaries. This is the article's
machinery contribution beyond the companion: the obstruction proofs now never
mention a specific table.

**Theorem C3 (the two-fiber rank no-go — the headline).** No d ≤ 7-dimensional
linear-functional realization of either certified table exists: given any (C, Φ)
factorization, the pigeonhole dependence witness (8 word vectors in dimension ≤ 7)
kills every row contraction while the lifted expansion forces v = 0 — contradiction
(`table_rank_nogo` over an arbitrary index list; instances at Fin 7 on both
fibers). **Corollary (the reading).** Every abstract host of dimension ≤ 7 is
excluded at both closed fibers; any dictionary needs d ≥ 8. TL₄ (dimension 14 =
Catalan₄, the classical dimension fact — not corpus-formal, §7) is the minimal
Temperley–Lieb host, with words spanning at least 8 dimensions, outside every
two-generator subalgebra (dimensions 4 and 5), and NON-TRACIAL at any strand count
at both closed fibers — at q = −1 by the companion's Theorem A
(`tracial_realizability_refuted`, `pilots/41/H1.lean:436`, with its own asymmetry
witness), at q = +1 by the new witness (the same argument: traciality forces table
symmetry, and σ₊(100,010) = −σ₊(010,100) breaks it).

**The pre-solve (CERTIFIED-NUMERIC, the raised negative).** Over the tauceti spin
host at n = 4 (the 16-dimensional representation, exact-integer construction from
the recorded cup/cap/parallel formulas), with the functional ranging over the FULL
K class: the monomial-word candidate list is EMPTY — 0 survivors. The scan of
record is the 2026-11-21 archived re-run (`pilots/41/presolve/`, generator/checker
persisted, per-fiber counts; ~3×10⁸ systems): canonical-13 C(13,8) subsets,
51.9M systems per fiber; natural-monomial 16×128 variants, 82.6M per fiber;
random L ≤ 4 subsets, 14.1M (m₊, 350 independent of 2500 sampled) and 14.0M
(m₋, 346 of 2500). The record note's combined counts (103.2M / 82.6M / 13.9M)
reconcile as its rows 2–3 being one-fiber figures and row 1 short by 7 of the
1287 subsets per fiber — the re-run covers the full space at both fibers, 0
survivors everywhere, with planted-solution controls detected at residual ~10⁻¹³
and far-table residuals at ~7.1 as in the record. The structural root: word
products live in the 14-dimensional word algebra, so realizable tables span
≤ 14 dimensions inside the 64-dimensional table space — membership of the Walsh
table is a codimension-≥50 condition (the scan's minimum distance to any scanned
monomial subspace is 4.8–5.6). The spin host at these fibers spans the FULL 14
dimensions (the faithfulness datum) — so the spin-host negative IS a TL₄
generator-word negative at δ = ±2 (the fiber-scoped transfer of §1's wording
lock).

**Corollary (the search's state).** At both closed fibers: no dictionary through
tracial evaluations (companion Thm A, extended by the new witness); none through
any host of dimension ≤ 7 (Thm C3); none through monomial words on the standard
14-dimensional host at length ≤ 3, exhaustively, with the same signal at L ≤ 4
random-sampled (the pre-solve). What remains is the COMBINATION-word tier:
dimension counting does not preclude it (the unknowns exceed the 64 equations) —
§7's open problem.

## 4. Novelty and nearest misses (source: the round-7 novelty survey `novelty/round7-h3-battery.md` @ `5f0b57cc`, §§1–2 + its pre-solve section M1/M2)

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| **tauceti MarkovTrace/Spin tree** (44 decls: `spinRep :300`, `markovTrace :460`, `markovTrace_mul_comm :476` TRACIAL, `IsMarkovTrace.eq_markovTrace :518` uniqueness; `Spin/Positive.lean:110/:117` faithful on the image, diagonal-K = the commutant class) | the complete spin-model machinery: the algebra map TL_n → M(2ⁿ), the unique Markov trace, positivity | the novelty survey's sharpest nearest-narrow row and this article's SHARPEST neighbor: the host machinery exists in full on a corpus-native substrate — and NOTHING in it poses a prescribed-table realizability question; non-commutant K's appear nowhere as objects. Our negative lands ON that machinery's doorstep: the K-class search over its generator words is empty, and the trace family it does prove (the tracial class) is Theorem-A-excluded at both fibers |
| Morin-Duchesne, *Dimer representations of the TL algebra* (2015) | dimension-2ⁿ⁻¹ dimer representations (d = 8 at n = 4, loop value 0) + structure analysis | dimension kin only (the d = 8 boundary host class); no realizability question, not at the δ = ±2 fibers |
| Avan et al., arXiv:1306.2927 (TMP 178 (2014) 223) | rank-n TL_N(q) reps from generalized-Hadamard pairs | auxiliary spaces n-dimensional, not 2ⁿ spin chains; no prescribed-table question; the Butson/Hadamard kinship stays an unconsumed pointer |
| the XXZ/two-boundary-TL correlation genre (SciPost Phys. 16.1.003 (2024); arXiv:1003.1932; Chernyak 2023 — where tr(K·)-type functionals are standard machinery) | spectra and correlation functions of TL-type spin chains | the genre computes with the host we search; no member poses a prescribed sign/Gram-table realizability question in any functional class — the class row stays EMPTY |
| Eisermann, Pacific J. Math. 231 (2007) 305–336; Pourkia, arXiv:2611.10850 | braid-rep constructions from colouring data / strand-label tracking | representation-construction content; no TL-algebra functional class, no no-go |
| the 78 + 41H precedents (in-repo, governing; row provenance: `novelty/round6-41-battery.md` §NEGATIVE N1 rows P1/P2 — carried, not re-derived) | kernel-verified refutations, kind NEGATIVE, discovery-grade by ruling | the class template this article follows; our negative again refutes a program-internal hypothesis (the (H3) host hope), attributed to our own pre-registered program — the honest analogue of 78's external-owner discipline |

Scope statement. "First" claims, where made, are scoped in-sentence: within the
corpora surveyed (mathlib, tauceti, the AxiomMath repositories, openai-math,
anthropics) and the informal literature searched (the novelty survey's two sweep
batches, 2026-11-20), no source poses — let alone answers — a prescribed-table realizability
or small-host exclusion question for a deformed sign rule at either fiber. The
obstruction certificates are elementary; the closure is not (§5's register).

## 5. Proofs

Theorem C1's four certificates are single kernel decides over raw six-Boolean
statements (the 8×8 integer table fully evaluated; no ℚ-arithmetic — decide's
integer-arithmetic requirement). Theorem C2 is the companion's list-algebra lifting
with the specific table abstracted away (pure renames, each a verified reading of
the companion's passing proof). Theorem C3 is the companion's factorization
substitution — row contraction, triple-sum rearrangement, the hdep contraction, the
lifted expansion at v — generalized over the index list and instantiated at Fin 7
twice. No new mathematics in the machinery steps, which is the point: **elementary
certificates, nonelementary closure** (the family's locked negative reading, the
companion's §N3 convention; also §9 gate 8's register).
Full Lean: `pilots/41/H3.lean` (§0 = the companion surface verbatim, source of
record `H2.lean` on-disk `3bc8170121492d18`).

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Cert +1 (orth) | `Pilot41H3.sigmaOneOrth` (+`_raw :191`) | `H3.lean:196` | [propext] | `pilots/41/logs/h3-s-run1.log:55` |
| Cert +1 (expansion) | `Pilot41H3.sigmaOneExpand_basis` (+`_raw :203`) | `H3.lean:209` | [propext] | `:56` |
| Witness +1 | `Pilot41H3.sigmaOne_asym_witness` | `H3.lean:221` | [propext] | `:57` |
| Lifting | `Pilot41H3.tableExpand` | `H3.lean:278` | ⊆ triad | `:58` |
| Lifting instances | `sigmaExpand` / `sigmaOneExpand` | `H3.lean:344/:351` | ⊆ triad | `:59–60` |
| No-go (general) | `Pilot41H3.table_rank_nogo` | `H3.lean:369` | ⊆ triad | `:61` |
| **No-go d ≤ 7 (q = −1)** | `Pilot41H3.no_realization_dim7` | `H3.lean:422` | ⊆ triad | `:62` |
| **No-go d ≤ 7 (q = +1)** | `Pilot41H3.no_realization_dim7_one` | `H3.lean:433` | ⊆ triad | `:63` |
| Cert −1 (re-proved) | `sigmaOrth` / `sigmaExpand_basis` | `H3.lean:160/:173` | [propext] | `:53–54` |

"⊆ triad" = exactly `[propext, Classical.choice, Quot.sound]` at the cited print.
Evidence pointer: run of record `pilots/41/logs/h3-s-run1.log` (on-disk
sha256(16) `6dc794e7a27d8565` — passed, 0 errors, 0 `sorry`; elaborated bytes =
on-disk `833dcff84309c986`; run narration, telemetry, and budget live in
`pilots/41/H3-record.md` §Runs). Custody disclosure: the run's audit tail prints 11
of the file's 27 theorems — the 16 unprinted are public helpers of the printed
spine (lsum infrastructure, raw forms, membership lemmas, the dotted-name/`@[simp]`
class a regex sweep misses) — and the standing commitment extends the audit tail to
all 16 at the next H3.lean edit's verification run, with no dedicated run. The pre-solve
rows cite `H3-M-candidates.md` as their certificate artifact; since the 2026-11-21
custody settlement the persisted generator/checker + outputs live at
`pilots/41/presolve/` (the re-run of record, per-fiber counts; controls reproduced;
never kernel-verified, never in the proved-artifact counts).

## 7. Limitations and open problems

- **The combination-word tier (the open core).** Theorem C3 excludes hosts by
  dimension; the pre-solve excludes monomial (generator-product) words at length
  ≤ 3 exhaustively and L ≤ 4 random-sampled. General TL₄ elements are
  ℤ-combinations of words; at the combination tier the unknowns — 8 word
  coefficient vectors in the 14-dimensional word algebra (112), plus the 70 free
  entries of a functional K in the host's weight-block-diagonal class (sector dims
  (1,4,6,4,1), so 1²+4²+6²+4²+1² = 70; the reduction to this class is exact per
  the record note's §2) — total 182, exceed the 64 equations: dimension counting
  does NOT preclude a dictionary. Random search cannot see it (probability ≈ 0);
  progress needs a structured ansatz (the sector decomposition lead: realize the
  Walsh table as a sum of rank-(4,6,4) Gram tables aligned with the host's weight
  sectors — sector dims (1,4,6,4,1), no single sector suffices) or a theoretical
  membership obstruction for ≤ 14-dimensional product spans. Recorded as the
  program's next step (`H3-M-candidates.md` §5).
- **The monomial scan's coverage.** Exhaustive at canonical-13/natural-monomial
  classes L ≤ 3 over ALL subset/assignment/scalar variants at both fibers; L ≤ 4
  is random-sampled (37 distinct images), not exhaustive. Machinery-validated
  (planted controls ~10⁻¹⁴), not kernel.
- **The dimension-14 classical fact.** "dim TL₄ = Catalan₄ = 14" is classical, not
  corpus-formal (the novelty survey's §3-row-1 caveat); the sharp "≤ 14" constant
  of the span bound is therefore certificate-class in our record, and the
  faithfulness reading is conditioned on the classical dimension fact (the algebra
  map's image spans 14 at these fibers — the span datum itself IS mechanical,
  re-derived).
- **Wording fences (locked, ride every transfer sentence).** Host-scoped negatives
  only — never "no TL₄ dictionary"; the generator-word transfer holds AT δ = ±2
  (the faithfulness datum above); the tracial exclusion holds at any strand count;
  no claim about combination words beyond openness.
- The pre-solve's spin-host construction is the independent-literals route from
  the recorded formulas — NOT a tauceti import; an actual tauceti import would
  need the tauceti olean image and an on-pin axiom audit FIRST (the record note's
  §4 hygiene prerequisite); spinRep citations remain statement-level only until
  then.

## 8. Prior work and references

**(a) Literature.** Morin-Duchesne, *Dimer representations of the Temperley–Lieb
algebra* (2015). Avan–Fonseca–Frappat–Kulsh–Ragoucy–Rollet, arXiv:1306.2927 =
Theor. Math. Phys. 178 (2014) 223–238. Eisermann, *Knot colouring polynomials*,
Pacific J. Math. 231 (2007) 305–336. Pourkia, arXiv:2611.10850 (2026). The
XXZ/two-boundary TL genre: SciPost Phys. 16.1.003 (2024); arXiv:1003.1932
(periodic TL spectra); Chernyak (2023), two-boundary TL in U_q(sl₂)-invariant
chains. Jones's index theory and the TL literature (classical; the dim-Catalan
facts). Benkart–Pérez-Izquierdo, arXiv:math/9801141 (the object-level ownership
fence).

**(b) Project artifacts.** Companion: `articles/41H-tl-realizability-transport.md`
+ `pilots/41/{H1,H2}.lean` with logs; `pilots/41/H3-precharter.md` (`60278bd4`);
`pilots/41/H3-record.md` (the kernel run's close and the 2026-11-20 ruling);
`pilots/41/H3-M-candidates.md` (`7647a1f9`); `novelty/round7-h3-battery.md`
(`5f0b57cc`, §§1–4 and the pre-solve novelty section); the core deformation article
`articles/41-…eight-square.md`
(the σ_q surface's home); tauceti `MarkovTrace.lean` / `Spin/Positive.lean`
(read-only sibling, statement-level citations only).

## 9. Shipping gate (self-audit; re-run 2026-11-21 at the external-referee revision)

| # | rule | state |
|---|---|---|
| 1 | kind is a §0 article kind | PASS — NEGATIVE (the 41H family form); the kind call was ruled discovery-grade at the 2026-11-20 ship gate, on the precedent of the two earlier NEGATIVE articles (78, 41H); the no-gos are unconditional kernel theorems; the pre-solve is billed CERTIFIED-NUMERIC (never kernel, never in the proved counts) |
| 2 | title free of project-internal tokens | PASS — mathematical content only ("dimension at most 7", "either closed fiber", "monomial-word search") |
| 3 | status rows, closed vocabulary, binders listed | PASS — 5 rows; C2's row names the `hbasis` certificate binder and C3's row states the pigeonhole unfolding; the pre-solve row bills CERTIFIED-NUMERIC with the never-kernel and no-archived-scripts disclosure |
| 4 | abstract ≤ 200 words, all five elements | PASS — 197 words, re-counted at this revision; the closed status strings appear in-sentence (C1/C3 PROVED-UNCONDITIONAL, pre-solve CERTIFIED-NUMERIC) |
| 5 | novelty table ≥ 2 rows, scoped "first" | PASS — 6 rows + the EMPTY class row carried in §4's scope statement; the tauceti row is the sharpest |
| 6 | no bracketed errata | PASS — provenance is §1 prose, told once |
| 7 | no section contradicts another | PASS — the byline, gate rows, and footer all state the shipped state; §3's search-state corollary matches §7's open tier; the CERTIFIED-NUMERIC billing is consistent in the table, §3, §6 |
| 8 | formal record table-only, no infra narration | PASS — the §6 table, the axiom gloss, a one-line evidence pointer, and the one-sentence custody disclosure; run narration, telemetry, and budget live in `pilots/41/H3-record.md` §Runs (register: "elementary certificates, nonelementary closure") |
| 9 | internal vocabulary ≤ 3 glosses | PASS — one glossed internal term ("pre-solve", glossed at first use); workflow labels (S-rung, BANK, splice, wave, quota, run IDs as status nouns) removed at this revision |
| 10 | citations spot-checked (5+) | PASS — re-verified 2026-11-21 against the tree: every §6 decl:line cite resolves (`H3.lean` declarations; audit tail `h3-s-run1.log:53–63`); the §4 tauceti cites resolve (`spinRep :300`, `markovTrace :460`, `markovTrace_mul_comm :476`, `IsMarkovTrace.eq_markovTrace :518`, `Spin/Positive.lean:110/:117`); the companion's Thm A is at `pilots/41/H1.lean:436`; artifact sha256 prefixes re-measured (H3.lean `833dcff84309c986`, log `6dc794e7a27d8565`, pre-solve note `7647a1f9859764bc`, survey `5f0b57cc99556d4d`, precharter `60278bd4b6e824bf`, `H2.lean` `3bc8170121492d18`); the evidence-chain review record `research/qa/iter4-review/r2-41h3-s1s4-pass.md` (sha16 `14c86d28ee4b5e9e`) |
| 11 | README row updated in the same commit | SATISFIED at the ship commit `e4ac8dd` — the row and the discovery counts landed with the article; the external review then flagged the row's TITLE as stating a stronger claim than the article's wording lock allows (it names a TL₄ generator-word exclusion, while the combination-word tier is open); the corrected row text is queued for the index's next revision |
| 12 | superseded files marked | PASS — supersedes none; the companion stands unchanged |

— Shipped 2026-11-20 at commit `e4ac8dd` (the kernel run `833dcff84309c986`, the
pre-solve record `7647a1f9859764bc`, the novelty survey `5f0b57cc99556d4d`).
Revised 2026-11-21 applying the external referee report: shipped-state seam,
register, status vocabulary, and citation fixes; Theorems C1–C3 and the pre-solve
unchanged.
