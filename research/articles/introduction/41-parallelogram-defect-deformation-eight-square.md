# A q-Deformation of the Eight-Square Sign Rule — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [A q-Deformation of the Eight-Square Sign Rule: the Unified Parallelogram-Defect Identity
> and the Bitwise-Complement Stratum](../41-parallelogram-defect-deformation-eight-square.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; no Lean, no octonions, no exposure to this project assumed. Nothing here adds,
> weakens, or replaces any claim of the article: if this file and the article ever
> disagree, the article and its Lean artifacts win. Written 2026-11-21 against the
> article's committed state (audit of record `core-run9`).

## 1. In plain words

The eight-square identity (Degen, 1818) says: multiply two numbers that are each sums
of eight squares, and the product is again a sum of eight squares. Its classical proof
runs on a rule of signs — the multiplication table of the octonions in disguise. This
article treats that sign rule as a dial with a setting q; at the classical setting q = 1
the rule holds exactly, on every configuration. Away from q = 1 the cancellation can
fail, and wherever it does the failure is exactly (1 − q) times an explicit polynomial,
one per configuration, which the article writes down and the Lean kernel verifies. Some
configurations never fail at any q, and three earlier draft forms of the statement are
certified false by machine-checked counterexamples; no number theory is used anywhere.

## 2. The background, in one page

### 2.1 The two-square identity you already know

(a² + b²)(c² + d²) = (ac − bd)² + (ad + bc)².

This is complex multiplication: with z = a + bi, w = c + di it reads |z|²·|w|² = |zw|².

### 2.2 Two, four, eight — and why the sign rule matters

The same trick exists for four squares (Euler; quaternions) and eight squares (Degen
1818; Graves 1843, Cayley 1845; the octonions), and Hurwitz proved bilinear identities
exist only in dimensions 1, 2, 4, 8 (all classical). Over the integers the statement is
almost free (Lagrange: every positive integer is a sum of four squares); the real content
is the *uniform* formula and the sign rule that makes it work — the object studied here.

### 2.4 The cube picture (the article's actual subject)

Make the sign rule concrete. A **block** is a 3-bit string; there are eight, `000`
through `111`. To each ordered pair of blocks (a, b) attach a sign

σ(a, b) = (−1)^{φ(a,b)}, where φ(a,b) = a₁b₁ + a₁b₂ + a₁b₃ + a₂b₂ + a₂b₃ + a₃b₃
+ b₁a₂a₃ + a₁b₂a₃ + a₁a₂b₃.

Don't memorize the nine terms — they are fixed and mechanical (the article's §2 defines
them the same way, with a compact notation for the first six). Example: φ(110, 110) = 3,
so σ(110, 110) = −1.

The cleanest form of the classical rule is not the identity itself but its
**alternation**. Call four blocks p, q₁, p′, q₂ a **parallelogram** when p ⊕ q₁ =
p′ ⊕ q₂ and q₁ ≠ q₂ (⊕ = bitwise xor: "differs here"). There are 448 such parallelograms
in the cube — 8 choices for p, 8 for q₁, 7 for a nonzero difference; p′ and q₂ are then
forced. The classical statement is: the two crossing sign products cancel,

σ(p, q₁)·σ(p′, q₂) + σ(p, q₂)·σ(p′, q₁) = 0,

on **every** one of the 448 parallelograms. In words: *around every parallelogram of the
8-point cube, the sign flips cancel.* This is the statement the article deforms (the
article calls it `Signs`, §2; its Theorem 3 re-proves it).

### 2.5 The dial

Split the exponent as φ = φQ + τ into its quadratic part (the six two-block terms) and
its cubic part τ (the three three-block terms). The deformed sign keeps the quadratic
sign and re-weights the cubic part:

σ_q(a, b) = (−1)^{φQ(a,b)} · (−q)^{τ(a,b)},

where q may be any unit of any commutative ring — in particular any nonzero rational,
real, or complex number. At q = 1 we get (−q)^τ = (−1)^τ, so σ₁ = σ: the dial's
classical setting. The question: away from q = 1, what happens to the cancellation? The failure is polynomial.

## 3. One quad, by hand

Take the parallelogram p = `110`, q₁ = `110`, p′ = `001`, q₂ = `001`. Parallelogram
check: 110 ⊕ 110 = 000 = 001 ⊕ 001, and q₁ ≠ q₂. Note p′ = bitwise-not p and q₁ ⊕ q₂ =
`111` — this quad lies on the special stratum the article calls **antipodal**.

Compute the four signs (each pair (a, b) uses the φ formula above; Q is its quadratic
part, τ its cubic part):

| side | block pair | Q | τ | σ_q |
|---|---|---|---|---|
| in A | (p, q₁) = (110, 110) | 3 | 0 | (−1)³(−q)⁰ = −1 |
| in A | (p′, q₂) = (001, 001) | 1 | 0 | (−1)¹(−q)⁰ = −1 |
| in B | (p, q₂) = (110, 001) | 2 | 1 | (−1)²(−q)¹ = −q |
| in B | (p′, q₁) = (001, 110) | 0 | 0 | (−1)⁰(−q)⁰ = +1 |

So A = (−1)(−1) = 1 and B = (−q)(1) = −q, giving

**A + B = 1 − q.**

At q = 1 the sum is 0: the classical cancellation, on display.

The polynomial: define the two sides' cubic totals τ₁ = τ(p,q₁) + τ(p′,q₂) = 0 and
τ₂ = τ(p,q₂) + τ(p′,q₁) = 1; the **gap** is |τ₁ − τ₂| = 1. The identity is stated from
the side with smaller cubic total (the **min-side**, here side 1): its quadratic total is
Q_min = 3 + 1 = 4, and

GqGen = (−1)^{Q_min}·(−X)^{τ_min}·(1 + X + ⋯ + X^{gap−1}) = (−1)⁴·1·(1) = **1**,

an honest polynomial in ℤ[X]. Evaluated at q it gives 1, and indeed (1 − q)·1 = 1 − q —
Theorem 1's shape, with every number computed by hand.

Read off the fibers: at q = 1 the value is 0 (classical holds — killed by the prefactor,
even though GqGen(1) = 1 ≠ 0); at q = −1 the value is 2, a genuine failure; at q = 2 it
is −1. Two neighbors show the other regimes:

| quad | stratum | gap | GqGen | A + B | at q = −1 | at q = 2 |
|---|---|---|---|---|---|---|
| 110/110/001/001 | antipodal | 1 | 1 | 1 − q | **2** (fails) | −1 |
| 000/100/100/000 | off-stratum | 0 | 0 (empty sum) | 0 for every q | 0 | 0 |
| 101/101/011/011 | off-stratum | 2 | 1 + X | 1 − q² | 0 (deceptive!) | **−3** (fails) |

Row two is the **q-rigid** regime (equal cubic totals ⇒ empty sum ⇒ cancellation for every
q; 336 of 448 quads). Row three vanishes at q = −1 yet is not rigid.

*Provenance:* A + B = 1 − q, GqGen = 1, the value 2 at q = −1, the q-rigid quad and the
1 − q² example are recorded in the article (§3 Thm 4; §2 counts). The Q/τ table was
hand-recomputed from the article's §2 definitions and agrees with them.

## 4. How the proof works, without Lean

Each crossing product collects into one old-fashioned sign times one power of −q:
A = (−1)^{Q₁}(−q)^{τ₁} and B = (−1)^{Q₂}(−q)^{τ₂}, with Q₁, Q₂ the sides' quadratic
totals. Factor out the smaller-power side and what remains is 1 ± (−q)^{gap}. The whole
theorem hangs on one parity fact (the engine, the article's parity split `ethParity`): **Q₁ + Q₂ + gap is
odd at every parallelogram quad**, and that forces the bracket to collapse to 1 − q^{gap}
uniformly, whatever the parities. Then the schoolbook factorization
1 − q^{gap} = (1 − q)(1 + q + ⋯ + q^{gap−1}) produces GqGen — the geometric sum wearing
the surviving sign (−1)^{Q_min} and the smaller power (−q)^{τ_min}. That is Theorem 1.

The stratification (Theorem 2: gap odd ⟺ q₁ ⊕ q₂ = `111` ⟺ p′ = ¬p) and the negative
certificates (the draft parity hypotheses P1, P2 and the draft universal identity are
false) are finite statements: the kernel checks them exhaustively over the 4096
bit-tuples, and the refutations exhibit explicit witness quads. Theorem 3 re-proves the
classical cancellation from scratch (mod-2 route), anchoring q = 1. Nothing else is used:
no number theory, no case analysis beyond parity.

## 5. What the main results say, informally

- **Theorem 1 (unified defect identity, `mainCor`).** For *every* commutative ring R,
  every unit q, and every parallelogram quad: A + B = (1 − q)·GqGen(q). Moreover,
  whenever 1 − q is cancellable (any integral domain with q ≠ 1, for instance), the
  cancellation holds at q **if and only if** GqGen vanishes there. At q = 1 the classical
  rule holds by the prefactor alone — on 112 quads the polynomial itself is nonzero
  there. PROVED-UNCONDITIONAL. → formal statement: article §3, Thm 1.
- **Theorem 2 (stratification, `stratumComplement`).** gap odd ⟺ q₁ ⊕ q₂ = `111` ⟺
  p′ = ¬p. The 64-quad odd-gap regime is exactly the antipodal stratum, and only there
  does the article's earlier draft display form hold exactly. PROVED-UNCONDITIONAL. →
  formal statement: article §3, Thm 2.
- **Theorem 3 (the classical fiber, `signs_anchor` + `bridge_axiom`).** σ₁ = σ, and the
  classical cancellation holds on every quad at q = 1 — re-proved without importing the
  donor's proof (recovery from Theorem 1 is over ℤ and uses the bridge axiom). PROVED-UNCONDITIONAL. → formal statement: article §3, Thm 3.
- **Theorem 4 (nondegeneracy and rigidity).** The deformation is genuine: the
  cancellation fails at q = −1 on an antipodal quad (value 2 ≠ 0); the equal-cubic-total
  quads (336 of 448) cancel for *every* q; the remaining 48 off-stratum quads fail
  polynomially (e.g. 1 − q²). PROVED-UNCONDITIONAL. → formal statement: article §3, Thm 4.
- **Negative certificates.** The draft parity hypotheses (P1) and (P2) and the draft
  universally-quantified identity are FALSE — kernel `decide` counterexamples (the last
  reads 0 = 2 at q = −1). These were the project's own draft forms, superseded by
  Theorem 1; no external conjecture is refuted. → formal statement: article §3, negative-certificate rows.
- **What is *not* here:** the Temperley–Lieb/Jones host bridge; the three-strand tier and
  linear hosts of dimension ≤ 7 at the two closed fibers are ruled out by companions
  41H and 41H3, the general bridge stays open. → article §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| block | a 3-bit string; eight exist | `101` |
| a ⊕ b | bitwise xor ("differs here") | `101 ⊕ 011 = 110` |
| parallelogram quad | four blocks p, q₁, p′, q₂ with p⊕q₁ = p′⊕q₂, q₁ ≠ q₂; 448 of them | 110, 110, 001, 001 |
| φ(a,b) | the 9-term sign exponent | φ(110,110) = 3 |
| φQ, τ | its quadratic part; its cubic part | 3 = 3 + 0 |
| σ(a,b) | classical sign (−1)^φ | σ(110,110) = −1 |
| σ_q(a,b) | deformed sign (−1)^φQ·(−q)^τ | σ_q(110,110) = −1 |
| A, B | the two crossing sign products of a quad | A = 1, B = −q on the worked quad |
| τ₁, τ₂, gap | the sides' cubic totals; their absolute difference | 0, 1, gap 1 |
| X, aeval_q | the polynomial variable; "substitute q for X" (evaluation at q) | 1 + X ↦ 1 + q |
| Q₁, Q₂, Q_min, τ_min | the sides' quadratic totals; the quadratic total and cubic total of the min-side | 4, 0 on the worked quad |
| min-side | the side with smaller cubic total; anchors GqGen | side 1 above |
| GqGen | the defect polynomial: geometric sum × surviving sign, in ℤ[X] | = 1 on the worked quad |
| antipodal | q₁ ⊕ q₂ = `111`, i.e. p′ = ¬p; 64 quads, all odd-gap | the worked quad |
| q-rigid | cancellation holds for every q (gap 0); 336 quads | 000/100/100/000 |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL | kernel-checked with no assumed hypotheses beyond the triad | every theorem here |

## 7. What this is — and what it is not

- "Defect" means failure of sign-cancellation at a given q, A + B ≠ 0 (the *defect
  polynomial* is A + B as a polynomial in q) — **not** a crystallographic or
  lattice-physics defect. "Parallelograms" are combinatorial, inside the cube {0,1}³.
- "Eight-square" is Degen's algebraic identity, **not** the eight-vertex model.
- "q-deformation" is a deformation of the *sign rule only*. Object-level q-deformations
  of the split octonions are owned by Benkart–Pérez-Izquierdo (1998) — the article's
  nearest prior work (article §4, row 1) — and no object-level claim is made. The
  article's "first" claim is scoped to sign-rule/parallelogram-defect deformations within
  the corpora it surveyed.
- "Kernel-verified" means: every theorem was machine-checked, term by term, by the Lean
  type checker against fixed axioms — the triad is the full set used by the theorems
  here, and several statements were checked with even fewer.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract. Formal statement → article §3.
- Proof idea → §4 here, then article §5. Novelty → article §4.
- Verification → article §6, `pilots/41/Core.lean`, `pilots/41/logs/core-run9.log`.
- What stays open → article §7 and the companions
  [41H](../41H-tl-realizability-transport.md), [41H3](../41H3-two-fiber-rank-closure.md).

## 9. What you need going in

- Integer polynomials and evaluating them at a number or ring element; parity and
  signs as (−1)^n; bitwise xor on 3-bit strings (write 1 where bits differ).
- "Commutative ring" = a place where +, −, × behave like the integers; "unit" = an
  element you can divide by. Nothing else about formalization (see §7).
