# No Linear Host of Dimension at Most 7 for the q-Deformed Eight-Square Sign Rule — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [No Linear Host of Dimension at Most 7 for the q-Deformed Eight-Square Sign Rule at Either
> Closed Fiber: Certified Walsh Rank and the Empty Monomial-Word Search](../41H3-two-fiber-rank-closure.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; no Lean, no algebra beyond matrices, no exposure to this project assumed. Nothing
> here adds, weakens, or replaces any claim of the article: if this file and the article ever
> disagree, the article and its Lean artifacts win. Written 2026-11-21 against the article's
> committed state (external-referee revision).

## 1. In plain words

A companion article studies a one-parameter deformation of the eight-square sign rule — the
8-by-8 table of plus and minus signs that makes the classical eight-squares identity work.
A natural question is whether some algebraic structure ("host") can *produce* this table, in
the precise sense that its entries arise as products of short words evaluated in that
structure. This article proves that no host of dimension 7 or smaller can do it, at either
of the two special parameter values, by a machine-checked matrix-rank argument. It also
checks, by a validated computer search, that the standard 14-dimensional host's obvious
candidate dictionaries (single words up to length 3, sampled words of length 4) contain
none either — labeled honestly as computation, not proof. What remains open is the
"combination words" tier, where the counting no longer forbids success.

## 2. The background, in one page

### 2.1 The eight-square sign table

The classical eight-squares identity (Degen, 1818) says the product of two sums of eight
squares is again a sum of eight squares; the signs that make it work are the octonions'
multiplication table in disguise. The companion article's compressed surface (quoted
verbatim by this article's §2) is: a **block** is a 3-bit string (eight exist), and to an
ordered pair (a, b) of blocks attach the sign σ(a, b) = (−1)^{φQ(a,b) + τ(a,b)}, where φQ
is a fixed six-term quadratic expression in the six bits of a and b and τ a fixed
three-term cubic expression. (The full formula is in the companion article's §2;
orientation: φQ(110,110) = 3, τ(110,110) = 0.) The 8-by-8 grid of ±1 values is the
**sign table**.

### 2.2 The dial and its two closed fibers

The deformation re-weights the cubic part: σ_q(a, b) = (−1)^{φQ(a,b)} · (−q)^{τ(a,b)},
with q a dial setting. At q = 1 the dial reads the classical table; at q = −1 it reads a
second, also highly structured table (a Walsh table — see §3). These two values are the
article's **closed fibers**: the settings where the table is rigidly structured, and hence
where a realization is most plausible.

### 2.3 What "realization" means

A **linear-functional realization of dimension d** is: a way to attach to each block p an
integer vector word C(p) of length d, and an integer d-by-d matrix Φ, such that for every
pair of blocks σ(p, p′) = Σ_{i,j} C(p)_i · Φ_{ij} · C(p′)_j — the table factors as
C·Φ·Cᵀ, a "Gram-type" factorization. Every reasonable notion of evaluating words in an
algebra and pairing the results has this form after bookkeeping, which is why the article
can exclude *all* hosts of dimension ≤ 7 at once, whatever the host algebra. The
**dimension** d is the length of the word vectors — how much room the host gives. The
**Walsh property** is: every row of the table is a ±1 vector and any two distinct rows are
orthogonal (inner product 0), so the rows are 8 mutually orthogonal vectors in 8 dimensions
— the table is full rank.

### 2.4 The article's core question

Can the sign table, at either closed fiber, be produced by a host of dimension at most 7?
The pigeonhole principle suggests no — 8 mutually orthogonal rows cannot live in 7
dimensions — but the factorization form needs care: the rows of the *table* need not be
the rows of C. Turning that intuition into a proof for the factorization form is the
headline theorem.

## 3. One row pair, by hand

The smallest kernel-certified witness is the asymmetry witness σ₊(100,010) = −σ₊(010,100)
at the q = +1 fiber (σ₊ means the undeformed table). We recompute the two full rows
involved, using the companion article's nine-term formula; a and b are the row and column
blocks, with bits (a₁,a₂,a₃), (b₁,b₂,b₃).

For the row a = `100`: the six quadratic terms reduce to b₁ + b₂ + b₃ (only a₁ is 1), and
each cubic term contains a factor a₂ or a₃, so τ = 0. Hence σ₊(100, b) = (−1)^{b₁+b₂+b₃}:
the row reads +, −, −, +, −, +, +, − across b = `000`, `100`, `010`, `110`, `001`, `101`,
`011`, `111`.

For the row a = `010`: only a₂ is 1, so the quadratic part is b₂ and again τ = 0. Hence
σ₊(010, b) = (−1)^{b₂}: the row reads +, +, −, −, +, +, −, −.

Now hand-check the Walsh certificate (Theorem C1) on this pair:

- Diagonal: ⟨r₁₀₀, r₁₀₀⟩ = Σ (±1)² over the 8 columns = 8, because every entry is ±1 and
  squaring erases the sign.
- Off-diagonal: multiply the two rows column by column, getting +1, −1, +1, −1, −1, +1,
  −1, +1, whose sum is 0. So ⟨r₁₀₀, r₀₁₀⟩ = 0.

And the asymmetry witness is read straight off the two rows: σ₊(100, 010) = −1 while
σ₊(010, 100) = +1, so indeed σ₊(100,010) = −σ₊(010,100). The witness matters because
traciality (a symmetry of the standard trace functional on host algebras) would force the
table to be symmetric — and this pair breaks symmetry, killing every tracial dictionary at
both fibers.

*Provenance:* the witness σ₊(100,010) = −σ₊(010,100) is article-recorded (§3, the kernel
declaration `sigmaOne_asym_witness`); the Walsh orthogonality ⟨r_p, r_{p′}⟩ = 8·δ for all
pairs is Theorem C1, kernel-decided over the raw table. The two row tables above are
hand-recomputed from the companion article's §2 phase formula and agree with both the
witness and Theorem C1's certificate on this pair; no other pair's rows are claimed here.

## 4. How the proof works, without Lean

Theorem C1 is a finite certificate: the 8-by-8 integer table is evaluated completely and a
single kernel decision checks the orthogonality and the 8-scaled basis expansion over the
raw Boolean data — no rational arithmetic, no external tool. Theorem C2 is bookkeeping
with a message: the companion's expansion lifting (any row family carrying the 8-scaled
basis certificate expands to all integer function vectors) is re-proved once for an
arbitrary family, so the obstruction proofs never mention a specific table. Theorem C3 is
the engine: suppose a factorization C·Φ·Cᵀ exists with d ≤ 7. The 8 word vectors C(p) live
in a space of dimension d ≤ 7, so they are linearly dependent (pigeonhole). Contracting
the factorization against a nontrivial dependence kills every row contraction, while the
lifted expansion forces the dependence's coefficient vector to be 0 — a nontrivial
dependence cannot be 0. Contradiction. The same argument runs at both fibers because both
tables carry the certificate.

The monomial-word search is *not* a theorem: it is an exact-integer construction of the
standard 14-dimensional spin host plus a scan of candidate dictionaries, validated by
planted solutions (controls detected at residual ~10⁻¹³) and archived with its
generator/checker. Its structural explanation: word products span at most 14 of the 64
table dimensions, so membership of the Walsh table is a codimension-≥50 condition.

## 5. What the main results say, informally

- **Theorem C1 (both closed fibers are certified Walsh tables).** At q = +1 the eight rows
  satisfy the 8-scaled orthogonality and basis-expansion certificates (kernel-decided over
  the raw forms); the q = −1 certificates are re-proved verbatim. Reading: both fibers are
  nonsingular — full rank is the deformation's standing feature, not one fiber's accident.
  PROVED-UNCONDITIONAL. → article §3, Thm C1.
- **Theorem C2 (the strand-free lifting).** Any row family carrying the 8-scaled basis
  certificate expands to all integer function vectors; the certificate enters as a proved
  property of the family, not an open hypothesis. PROVED-UNCONDITIONAL. → article §3,
  Thm C2.
- **Theorem C3 (the two-fiber rank no-go — the headline).** No linear-functional
  realization of dimension ≤ 7 exists for *either* certified table: given any factorization,
  the pigeonhole dependence (8 word vectors in dimension ≤ 7) contradicts the lifted
  expansion. Scope: this excludes every abstract host of dimension ≤ 7 at both fibers; any
  dictionary needs dimension ≥ 8. PROVED-UNCONDITIONAL. → article §3, Thm C3.
- **The asymmetry witness.** σ₊(100,010) = −σ₊(010,100): any tracial dictionary is
  impossible at the q = +1 fiber, extending the companion's q = −1 exclusion to any strand
  count. PROVED-UNCONDITIONAL. → article §3, witness row.
- **The pre-solve (the empty monomial-word search).** Over the standard 14-dimensional
  spin host: no monomial-word dictionary at either fiber — 0 survivors across ~3×10⁸
  scanned systems (exhaustive at word length ≤ 3, random-sampled at length ≤ 4), with
  planted controls validating the machinery. This is machinery-validated **computation**,
  never a kernel theorem, and is never counted among the proved artifacts.
  CERTIFIED-NUMERIC. → article §3 (pre-solve) and the archived scan of record.
- **Corollary (the search's state).** At both closed fibers: no dictionary through tracial
  evaluations, none through any host of dimension ≤ 7, none through monomial words on the
  standard host at length ≤ 3 (with the same signal sampled at length ≤ 4). What remains is
  the **combination-word tier** — general integer combinations of words — where dimension
  counting does *not* preclude success (182 unknowns vs 64 equations); this is the open
  core, not a negative. → article §3 (corollary), §7.
- **What is *not* here:** any claim of the form "no TL₄ dictionary". The article's wording
  locks are explicit: host-scoped negatives only; the generator-word exclusion transfers
  only at the two fibers δ = ±2 and never to combination words. → article §1, §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| block | a 3-bit string; eight exist | `101` |
| σ_q(a,b) | deformed sign (−1)^{φQ}·(−q)^τ | σ₊(100,010) = −1 |
| φQ, τ | the quadratic / cubic phases of the pair (a,b) | φQ(110,110) = 3, τ(110,110) = 0 |
| q = −1, q = +1 | the two closed fibers of the dial | σ₋, σ₊ |
| Walsh table | an 8×8 ±1 table with mutually orthogonal rows | both fibers, per Thm C1 |
| realization of dim d | factorization σ(p,p′) = Σ C(p)_i Φ_{ij} C(p′)_j | the form every host yields |
| C, Φ | the word vectors (Block → length-d integers) and the d×d integer matrix | the hypothetical d ≤ 7 factorization |
| dimension d | the length of the word vectors; "host size" | 8 > 7 forces dependence |
| word (monomial) | a product of host generators, evaluated at a block | monomial words of length ≤ 3 |
| tracial | invariant under the host's standard trace; forces table symmetry | excluded by the witness |
| pigeonhole dependence | 8 vectors in dimension ≤ 7 cannot be independent | the engine of Thm C3 |
| spin host, TL₄ | the standard 16-dimensional matrix representation (n = 4 strands); the 4-strand Temperley–Lieb algebra, classical dimension 14 | the searched host; the minimal TL host |
| pre-solve | the machinery-validated candidate scan (never kernel) | 0 survivors, ~3×10⁸ systems |
| CERTIFIED-NUMERIC | computation validated by planted controls; not a proof | the pre-solve rows |
| triad | the routine Lean axioms: propext, Classical.choice, Quot.sound | the no-go rows |

## 7. What this is — and what it is not

- "Host" and "realization" are algebra bookkeeping: an algebra whose word products could
  reproduce the sign table via the C·Φ·Cᵀ factorization — **not** physics claims; nothing
  here asserts anything about physical systems.
- "Fiber" means a fixed setting of the deformation dial q (here q = ±1) — **not** a fiber
  bundle. "Walsh rank" is matrix rank of the ±1 table (Walsh–Hadamard orthogonality), and
  the no-go is a pigeonhole argument — not signal processing.
- Scope of the negative, fully: dimension ≤ 7 excluded at both fibers (proved); monomial
  words on the standard 14-dimensional host excluded at length ≤ 3 exhaustively and length
  ≤ 4 by sampling (computation); tracial dictionaries excluded at any strand count (proved,
  via the witness). **Combination words remain open** — dimension counting does not
  preclude them, and §7 records what a structured attack would need.
- The negated claim is the project's own host hypothesis (the (H3) program), not an
  external conjecture — the article's attribution discipline.
- "Kernel-verified" means: every theorem was machine-checked by the Lean type checker
  against fixed axioms; the triad (propext, Classical.choice, Quot.sound) is the full set
  used, with five kernel declarations (the four Walsh certificates of Theorem C1 and
  the asymmetry witness) needing only [propext].

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statement → article §3 with §2's surface and the glossary (§6 here) open.
- Proof idea → §4 here, then article §5 (register: elementary certificates,
  nonelementary closure).
- Verification → article §6; `research/pilots/41/H3.lean`,
  `research/pilots/41/logs/h3-s-run1.log`; archived pre-solve at
  `research/pilots/41/presolve/`.
- Novelty → article §4 (the tauceti spin-host row is the sharpest neighbor).
- What stays open → article §7 (combination words; the scan's coverage; the dimension-14
  classical fact).

## 9. What you need going in

- Vectors, dot products, linear dependence, and the pigeonhole principle: 8 vectors in
  dimension ≤ 7 must be dependent.
- Matrix multiplication and the C·Φ·Cᵀ factorization shape; "rank" as the number of
  independent rows.
- ±1 signs as (−1)^n; inner products of sign vectors (multiply entrywise, sum).
- Reading a 3-bit string as a point of the cube; the dial metaphor for a one-parameter
  family of tables.
- Kernel theorem vs validated computation (CERTIFIED-NUMERIC): §5 and §7 above, one
  sentence each.
