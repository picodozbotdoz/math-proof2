# A Call-Charged Reduction Calculus for Fine-Grained Complexity, with Theorem 19 of the 3SUM/APSP Refutation as One Composition — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [A Call-Charged Reduction Calculus for Fine-Grained Complexity, with Theorem 19 of the 3SUM/APSP Refutation as One Composition](../11-call-charged-reduction-calculus.md).
> Audience: an undergraduate mathematics background — no Lean, no complexity theory, no
> exposure to this project assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state.

## 1. In plain words

Complexity results are usually chains: an algorithm for problem C gives one for problem B,
which gives one for problem A, each step adding a controlled overhead. In formal
mathematics libraries such chains are usually re-derived by hand at every use. This article
introduces a small typed object — a "reduction" record bundling which problem maps to
which, how many subroutine calls each run makes, and what fixed overhead is charged — and
proves the one law that makes chains mechanical: compose two reductions and the call counts
multiply while the overheads add. As an acceptance test, one composition of the donor
corpus's Theorem-17 reduction with its Corollary-16 solver reproduces, exactly, the type of
the corpus's Theorem 19 — previously derived by hand. This is a technical record: the
accounting rule itself is folklore; what is new (within the surveyed corpora) is the typed
interface, and the deliverable is the acceptance test showing folklore composition can be
kernel-checked end to end.

## 2. The background, in one page

### 2.1 Reductions and the call-charging convention (classical)

A reduction from problem A to problem B is a recipe: to solve A on input p, make some
number of calls to a solver of B (on related inputs) and combine the answers. If B is
solvable in time T, then A is solvable in time (fixed overhead) + (number of calls) × T.
The folklore convention — adopted by the donor corpus formally — is that a call is charged
exactly the running time it causes. Chaining two such steps, the counts of calls multiply
and the overheads add. (classical, folklore)

### 2.2 Fine-grained complexity, 3SUM, APSP, word-RAM (classical)

Fine-grained complexity cares about the exact running-time shape (n² versus n^{2.5}),
not just "polynomial or not". Two benchmark hypotheses anchor it: 3SUM — given n integers,
decide whether three of them sum to zero — conjectured to need about n² time; APSP —
all-pairs shortest paths in an n-node graph — conjectured to need about n³ time. The
word-RAM is the standard idealized computer: memory words of logarithmic size, arithmetic
on a word in constant time. (classical)

### 2.3 The donor corpus and its gap

The formal corpus `anthropics_formal-math/3sum-apsp` proves a refutation of the strong
3SUM and APSP hypotheses in its formal model, through a chain: Strassen-based matrix
multiplication → Lop-AE-SparseTri detection (Corollary 16) → Exact Triangle (Theorem 17 +
Theorem 19) → onward. Each link is a standalone transfer claim in an abstract record
("problem P is solved in time T"), with the call-charging convention documented — but the
claims are not composable objects, so composed bounds are re-derived by hand. The
complexity bridge map of this project records that none of the four surveyed corpora has a
composition calculus.

### 2.4 The article's question

Can transfer claims be first-class typed objects — with the composed time bound assembled
mechanically, by a proved composition law — so that a chain like Theorem 17 ∘ Corollary 16
becomes one term in a calculus? And can this be acceptance-tested against a donor theorem
of independent origin, matching its type exactly?

## 3. One example, by hand

The smallest instance that shows the machinery is a two-reducer composition. Imagine three
problems A, B, C and two reductions, with all numbers concrete:

- r₁ : A ← B with parameter map β₁(n) = 2n (A's instance n leads to B's instance 2n),
  calls c₁(n) = 2, extra e₁(n) = 10, guard H₁;
- r₂ : B ← C with β₂(m) = m + 1, calls c₂(m) = 3, extra e₂(m) = 5, guard H₂.

Suppose C is solved in time T. Chaining the bounds directly: a C-solver gives a B-solver in
time T₂(m) ≤ 5 + 3·T(m + 1); the B-solver gives an A-solver in time

  T₁(n) ≤ 10 + 2·T₂(2n) ≤ 10 + 2·(5 + 3·T(2n + 1)) = **20 + 6·T(2n + 1)**.

Now Theorem 1's composition law, applied blind: composed calls = c₁·(c₂∘β₁) = 2·3 = **6**;
composed extra = e₁ + c₁·(e₂∘β₁) = 10 + 2·5 = **20**; composed parameter map = β₂∘β₁:
n ↦ 2n + 1; composed guard = "H₁ holds and H₂ holds at 2n". The assembled bound is
T₁(n) ≤ 20 + 6·T(β₂β₁ n) — the same inequality, derived with no case analysis. The two
guards matter: the composed guard checks H₂ at the intermediate parameter 2n, exactly where
r₂ is applied.

That is the entire content of the composition law: **calls multiply, extras add, guards
conjoin, parameter maps compose.** The article's acceptance tests run the same shape at the
donor corpus's real bounds, where the "numbers" are functions like 4·n·g(n).

*Provenance:* the definition of `Red` and the composed bound's shape (calls
c₁·(c₂∘β₁), extra e₁ + c₁·(e₂∘β₁), guard H₁ ∧ H₂∘β₁) are article-recorded (article §2,
§3 Theorem 1, with the proof in §5). The concrete reducers, the chained inequality, and the
composed values 6, 20, n ↦ 2n+1 are hand-computed instances of those recorded formulas; the
article records no such toy numbers, and none is presented as its own.

## 4. How the proof works, without Lean

Theorem 1 is one substitution: from a C-solver in time T, r₂ yields a B-solver with
T₂(q) ≤ e₂(q) + c₂(q)·T(β₂ q) on H₂; feeding that solver to r₁ gives
T₁(p) ≤ e₁(p) + c₁(p)·T₂(β₁ p) on H₁; since c₁ ≥ 0, multiplying the inner bound at
q = β₁ p by c₁(p) and adding gives the composed inequality — the proof is three lines of
algebra over nonnegative reals. Theorem 2 repackages the donor's Theorem 17 claim as a
`Red`: peel the claim's existential packaging, re-pad its curried time types into product
parameter types, and match the bound term by term. Theorem 3 then composes that `Red` with
Corollary 16's zero-calls reduction (a solver is a reduction making no calls) and discharges
the remaining inequality with the donor's own arithmetic lemmas; the donor's reference
theorem is compiled alongside as the faithfulness check — the composed type matches it
exactly. Theorem 4 repeats the pattern for two cited-literature claims, reading the composed
bound off the composition law as a black box. Theorem 5 builds an actual machine: a loop
over the query list, calling the callee once per query and folding the answers, compiled to
mathlib's TM2 model with time c·(calls·(Tn + 1) + 1)·(|x| + 1)^c.

## 5. What the main results say, informally

- **Theorem 1 (`Red.comp`), composition.** From `Red A B β₁ c₁ e₁ H₁` and
  `Red B C β₂ c₂ e₂ H₂` you get `Red A C` with composed calls, extras, guard and parameter
  map as in §3 above: calls multiply, extras add. PROVED-UNCONDITIONAL. → article §3,
  Thm 1.
- **Theorem 2 (`red_of_theorem_17`).** The donor's Theorem-17 transfer claim, with its
  packaging peeled, is a `Red` from Exact Triangle to Lop-AE-SparseTri with calls
  4·n·g(n) and the claim's additive terms as extras. PROVED-CONDITIONAL on the binders
  hC : 0 ≤ C and h17 (the peeled transfer clause of the donor claim) — hypotheses the
  formal theorem carries as explicit assumptions; the kernel proof is complete relative to
  them; the article names the donor claims and does not discharge them. → article §3,
  Thm 2.
- **Theorem 3 (`theorem19_of_red`), the acceptance test.** From the Theorem-17 reduction
  and the Corollary-16 solver, one application of Theorem 1 plus the donor's own parameter
  arithmetic yields the explicit bound — exactly the type of the donor's Theorem 19.
  PROVED-CONDITIONAL on `Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆` and
  `Claim.Corollary_16 M` as hypothesis binders. → article §3, Thm 3.
- **Theorem 4 (`composed_21a_of_ch20_vw13`), second acceptance.** From the two
  cited-literature claims (3SUM → Convolution-3SUM; Convolution-3SUM → Exact Triangle) as
  binders, every Exact-Triangle time T yields an explicit 3SUM time T₃ with
  T₃ n (n^κ) ≤ E₁ n + Num₁ n·(E₂ (N n)·(1 + logU (mag n)) + Num₂ (N n)·T (size (N n))
  (c·mag n)) on the guard 1 ≤ n, 0 ≤ Num₁ n, 0 ≤ Num₂ (N n) — the composition the donor
  carries by hand becomes a calculus instance (calls Num₁·(Num₂∘N) multiply, extras
  E₁ + Num₁·(E₂∘N) add). PROVED-CONDITIONAL on the two donor binders. The n^{3/2+o(1)}
  classification of the bound is NOT derived here (open port). → article §3, Thm 4.
- **Theorem 5 (`tm2_realized_composed`), machine realization.** Every derivation of the
  calculus is realized by a single TM2 machine with time
  c·(calls x·(Tn x + 1) + 1)·(|x| + 1)^c. PROVED-CONDITIONAL on the three eth interface
  binders EthExistsTm, EthPoly, EthIsPoly (eth's machine-model statements, taken as
  hypotheses) **and** on the machine/size binders (per-query time, state size, the loop
  parameters, with their polynomiality and size hypotheses — the article's status table
  names them all). → article §3, Thm 5.
- **What is *not* here:** the word-RAM half of the realization; the asymptotic
  classification port; asymptotic (=O) and randomized cost models. → article §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| A T | predicate "problem A is solvable in time T" | — |
| Red A B β calls extra H | reducer: every B-solver yields an A-solver in time ≤ extra + calls·T∘β, on guard H | §3's r₁, r₂ |
| β | parameter map: where to send the instance | β₁ n = 2n |
| calls, extra | per-run call count; fixed overhead | 2 and 10 |
| guard H | side condition the bound holds under | 1 ≤ n |
| Red.comp | the composition law (Thm 1) | calls 2·3 = 6 |
| 3SUM / APSP | three-sums-to-zero; all-pairs shortest paths (benchmark hypotheses) | conjectured n² / n³ |
| word-RAM | idealized computer with word-arithmetic in constant time | the donor's model |
| DetTimeModel | the donor corpus's abstract record of time claims | — |
| Claim.Theorem_17, Claim.Corollary_16 | the donor's transfer claims, taken as hypothesis binders | Thms 2–3 |
| EthExistsTm, EthPoly, EthIsPoly | eth's machine-model interface statements, as binders | Theorem 5 |
| TM2, Tm2Sol | mathlib's stack-machine model; "computed within time T" | Theorem 5 |
| Stepped | eth's packaged stepped-machine calculus used to build the loop | — |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL / -CONDITIONAL | kernel-checked beyond the triad only / relative to named binders | Thm 1 / Thm 3 |

## 7. What this is — and what it is not

- "3SUM" and "APSP" are fine-grained-complexity benchmark problems (defined in §2 above);
  the donor corpus formally refutes the corresponding hypotheses in its model — the
  calculus itself takes no position on them, it only typesets the chain's time transfers.
- "Reduction" here is a typed time-transfer object between solvers — not logic's proof
  reduction and not a reduction of one theory to another.
- "Call-charged" is the folklore convention that a subroutine call costs exactly its
  running time (Vassilevska Williams; Williams–Williams 2010); the accounting rule is
  folklore, and the article's claim is the typed interface, scoped to the four surveyed
  corpora.
- "Calculus" means a small algebra with one composition law and its consequences — not
  lambda calculus.
- The donor's theorems enter only as hypothesis binders: the article does not prove the
  3SUM/APSP refutation or any donor claim. "Kernel-verified" means every theorem was
  machine-checked term by term by the Lean type checker against fixed axioms — the triad
  (propext, Classical.choice, Quot.sound) is the full set used.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- The formalized object and its definition → article §2 (the `Red` definition, Design B)
  with the glossary (§6 here) open.
- Formal statements → article §3.
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (formal record), `research/pilots/11/*.lean`, and the cited
  logs.
- Novelty and nearest misses → article §4 (folklore row; the AFP Cook–Levin comparator).
- What stays open → article §7 (word-RAM realization, the asymptotic classification port).

## 9. What you need going in

- Functions and composition (f∘g), and nonnegative-integer arithmetic over bounds.
- Reading "≤ e(p) + c(p)·T(β p)" as: overhead plus per-call cost times call count.
- The idea of a solver as a black box with a time guarantee.
- What a type/structure is, in one sentence: a bundle of named fields.
- What a hypothesis binder is (one sentence, §5 above) — nothing else about Lean.
