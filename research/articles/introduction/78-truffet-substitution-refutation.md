# Truffet's Tropical Substitution Procedure Terminates Suboptimally — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [Truffet's Tropical Substitution Procedure (arXiv:2603.26423 v4) Terminates Suboptimally on a
> Bounded Two-Row Instance: a Kernel-Verified Refutation](../78-truffet-substitution-refutation.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; no Lean, no optimization theory, no exposure to this project assumed. Nothing here
> adds, weakens, or replaces any claim of the article: if this file and the article ever
> disagree, the article and its Lean artifacts win. Written 2026-11-21 against the article's
> committed state.

## 1. In plain words

A recently posted paper proposes a "substitution procedure" for solving linear programs in an
exotic number system where addition is replaced by taking the maximum and multiplication by
ordinary addition. The paper claims its procedure, when it stops, delivers the minimum it
promises. This article shows the claim is false by exhibiting one small legal instance on
which the procedure runs to completion, announces a minimum of 1, and is wrong: a feasible
point of the same instance has cost 0. The instance and the run are checked term by term by a
proof assistant — no calculation is trusted by hand. One honest caveat is carried throughout:
the identification of the transcribed machine with the paper's own selection rule is a
careful source reading, not a machine-checked fact, and the article states it as an explicit
assumption. A third statement that an earlier draft claimed is retracted in the current
version, and this file reports that retraction rather than burying it.

## 2. The background, in one page

### 2.1 Tropical arithmetic: a number system with two new operations

"Max-plus" (tropical) arithmetic replaces the two usual operations:

  a ⊕ b = max(a, b)   ("addition" is taking the larger),   a ⊗ b = a + b   ("multiplication" is ordinary addition).

So 3 ⊕ 5 = 5 and 3 ⊗ 5 = 8. Repeated ⊗ multiplies out like ordinary algebra: 1 ⊗ x means
x + 1, (−2) ⊗ h means h − 2. The additive identity is −∞ (max with −∞ changes nothing), and
the multiplicative identity is 0. Polynomials in this arithmetic become piecewise-linear
functions: x ⊕ 1 = max(x, 1). "Tropical" is a branch of mathematics, not a climate; the name
is a tribute to the Brazilian school that pioneered it. (classical.)

### 2.2 Linear programming, tropical edition

Classical linear programming: minimize a linear cost subject to linear inequalities. The
tropical edition replaces + and × by ⊕ and ⊗, so both the cost and the constraints become
max-plus expressions. There is a genuine, sound theory of tropical linear programming with
duality theorems (classical, the Butkovič line). The paper under study proposes a
*substitution procedure* — repeatedly pick a variable, solve for it, substitute it out — and
claims (its §2.3) that a Theorem 4.2 "ensures the optimality of the result"; a v4 erratum
note asserts its correction "does not question the general principle".

### 2.3 What a refutation needs

To refute an optimality claim it suffices to exhibit one instance in the procedure's own
admissible class, run the procedure *exactly as written*, and check that its announced
answer is worse than a feasible point's true cost. Two levels of care are needed: the run
must be verified (this is what the kernel does), and the machine being run must be *the
paper's* machine (this is what the article's source-level assumption, called Assumption F,
addresses).

## 3. One run, by hand

The article's instance (its §2, transcribed from the paper verbatim) has three variables
x₀, x₁, h and two constraint rows plus the cost:

- row 0: h ≤ x₀ ⊕ x₁ — in words: h is at most the larger of x₀ and x₁;
- row 1: 1⊗x₁ ⊕ (−2)⊗h ≤ x₀ — in words: both x₁ + 1 and h − 2 must fit under x₀;
- cost: minimize z = x₀.

The procedure's terminal cost form is 1⊗h (the paper's normalization reads the coefficient
of h at h := 𝟙, which in the model is h = 0), so its success branch announces min z = 1.

**The better point.** Take (x₀, x₁, h) = (0, −1, 0) and check both rows in ⊕/⊗ arithmetic:

- row 0: h = 0 ≤ max(x₀, x₁) = max(0, −1) = 0. Holds.
- row 1: max(x₁ + 1, h − 2) = max(−1 + 1, 0 − 2) = max(0, −2) = 0 ≤ x₀ = 0. Holds.

Cost z = x₀ = 0 — a full unit below the announced minimum of 1.

**Why the true minimum is 0 (the article's three-line reading, here hand-recomputed).** Fix
h. Row 0 says max(x₀, x₁) ≥ h, so either x₀ ≥ h or x₁ ≥ h. If x₀ ≥ h, the cost x₀ is already
at least h, and equality is attainable: the point (h, h−1, h) satisfies row 1 because
max(h−1+1, h−2) = max(h, h−2) = h ≤ x₀ = h. If instead x₁ ≥ h, row 1 forces
x₀ ≥ x₁ + 1 ≥ h + 1, strictly worse. So the true optimum is x₀ = h — the "value function"
0⊗h — and at the normalization h = 0 the true minimum is 0, attained by (0, −1, 0).

**Why the procedure says 1.** The run (kernel-checked, article §3 Theorem A2) takes two
steps, each a forced choice among exactly one legal candidate (Theorem A1), and on the first
step the criteria commit to the wrong branch of row 0: they substitute x₁ := 0⊗h (that is,
x₁ := h), which makes row 0 hold with equality. With x₁ = h, row 1 reads
max(h + 1, h − 2) ≤ x₀, forcing x₀ ≥ h + 1 — one unit above the true optimum. The terminal
cost form 1⊗h encodes exactly that unit error: 1 + h > h at every h. So the procedure is not
making an arithmetic slip in its bookkeeping (the bookkeeping checks out); it loses the
optimum by committing to one branch of a disjunction and never looking at the other.

*Provenance:* the instance, the two witness points (1, 0, 0) and (0, −1, 0), the terminal
cost form 1⊗h, the two forced selections, and the coefficient reading above are all
article-recorded (§2, §3, §5); every ⊕/⊗ evaluation shown is hand-recomputed from the
article's §2 transcription and agrees with those recorded values. The internal bookkeeping
of the intermediate run states is kernel-checked in the artifact and is not reproduced here.

## 4. How the proof works, without Lean

The article separates three layers so that each carries only the weight it can bear. The
model lemma A1 is definitional: on a state whose legal-candidate set has exactly one
element, the transcribed selection returns that element — its proof is a one-line
unfolding, and its brevity is deliberate, because nothing paper-side is allowed to enter
the kernel. The run A2 is a finite check: the article's transcription of the paper's
procedure (candidate set (53b), selection (47), the §4.2.4 substitution and update) is
executed symbolically on the two-row instance, and the twelve checked facts — the instance
is in the paper's bounded class, both selections are forced, the run terminates in its
success branch, the witnesses are feasible with costs 1 and 0, and 0 < 1 — are all
decided by computation over a tiny state space. The third layer is Assumption F: the
eq-by-eq dictionary identifying the transcription with the paper's Theorem-4.3 selection,
worked out against the paper's source text and carried as an explicit PAPER-ONLY
assumption. Under F, A2 is the paper's own procedure losing the optimum; if F failed,
the refutation would narrow to the transcribed criteria family — and the article says
exactly that.

## 5. What the main results say, informally

- **Theorem A1 (`paperSelect_forced_singleton`), the model lemma.** For every model state
  whose legal-candidate set is a single pair, the transcribed selection returns that pair.
  This is a property of the transcription (the model's selection is *defined* to do that);
  it is not by itself a statement about the paper. PROVED-UNCONDITIONAL. → article §3,
  A1.
- **Assumption F, the fidelity dictionary.** The transcription's predicates match the
  paper's equations one for one, and on the forced-singleton states of the run the paper's
  own selection (its T-filter and argMin) returns the same pair — the tie-break machinery
  is never reached. This is a source-level reading of the paper, not a Lean statement.
  PAPER-ONLY. → article §3, Assumption F.
- **Theorem A2 (`paper_run_not_optimal`), the refutation run.** No hypotheses. On the
  bounded two-row instance: the procedure takes two forced singleton steps, terminates in
  its success branch with terminal cost form 1⊗h (announcing min z = 1 at the paper's
  normalization), while the feasible point (0, −1, 0) has cost 0, and 0 < 1. The failure is
  optimality, not bookkeeping. PROVED-UNCONDITIONAL. → article §3, A2.
- **The negative statement, assembled.** Under Assumption F: the v4 substitution procedure
  of arXiv:2603.26423, transcribed verbatim, terminates suboptimally on an instance of its
  own bounded class; the v4 erratum note's "does not question the general principle" is
  false at the selection level, and the §2.3 optimality claim fails on this instance. →
  article §3.
- **The retracted third statement — reported, not claimed.** The artifact also proves
  `instance_unbounded_below` (for every r there is a feasible point of cost below r). The
  current article *retracts it as a claim*: it is a translation-homogeneity artifact of the
  encoding (shifting all three coordinates by a constant preserves feasibility and shifts
  every cost), and the paper's own semantics already treat that direction — its Theorem 4.2
  is explicitly titled about minimality and reachability at −∞. So "a finite minimum
  asserted on an unbounded-below problem" is *not* a failure mode of the paper; the failure
  A2 exhibits is the unit coefficient gap (asserted 1, true 0). The Lean statement remains
  on disk, axiom-audited, and is deliberately absent from the article's claims. → article
  §7 item 1.
- **What is *not* refuted:** tropical LP duality (the Butkovič line — sound), tropical
  simplex pivoting (Allamigeon–Benchimol–Gaubert–Joswig), and the classical sibling paper's
  strongly-polynomial/Smale claims (unexamined here, out of scope). The refuted object is
  one substitution rule on one exhibited run. → article §7 item 6.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| a ⊕ b | tropical addition: max(a, b) | 3 ⊕ 5 = 5 |
| a ⊗ b | tropical multiplication: a + b | 3 ⊗ 5 = 8 |
| 1⊗x, (−2)⊗h | shifted variables: x + 1 and h − 2 | row 1's two terms |
| ⊥ | the additive identity −∞ | max(−∞, a) = a |
| x₀, x₁, h | the instance's variables; h is the homogenization column | the two-row instance |
| row 0, row 1 | the two constraints of the instance | h ≤ x₀ ⊕ x₁; max(x₁+1, h−2) ≤ x₀ |
| cost z | the quantity minimized: z = x₀ | better has z = 0 |
| bounded (Def 4.2) | the paper's own admissibility class for instances | the instance is in it |
| (53b), (47), (27), (29) | the paper's equation numbers, transcribed verbatim | candidate set, selection, substitution, cost update |
| paperSelect | the transcribed selection rule (singleton branch only) | returns (0, 1), then (1, 0) |
| initial, middle, finalState | the three run states | finalState's cost form is 1⊗h |
| output = (1, 0, 0) | fixed witness for the asserted value and bookkeeping | cost 1 there |
| better = (0, −1, 0) | the feasible point of cost 0 | beats the announced minimum |
| Assumption F | the source-level dictionary: transcription ⟷ the paper's machine | PAPER-ONLY |
| Case 2.1 | the procedure's success branch | asserts min z = c_h = 1 |
| PAPER-ONLY | a claim verified against sources, not kernel-checked | Assumption F |
| triad | the routine Lean axioms: propext, Classical.choice, Quot.sound | A1 and A2 |

## 7. What this is — and what it is not

- "Tropical" here means the max-plus number system (§2.1) — **not** climate science, and
  not tropical geometry of varieties at large. The whole subject is one small max-plus
  optimization procedure.
- The refutation targets **one substitution rule on one exhibited instance**. Tropical
  linear programming itself has a sound core (duality, no gap), and the article is careful
  not to touch it; the classical (de-tropicalized) sibling paper's claims are not refuted
  here either.
- The kernel proves the **run on the transcribed machine**. The link "this machine is the
  paper's machine" is Assumption F — a documented source reading, billed PAPER-ONLY and
  never counted among the proved statements. This separation is the article's honesty
  backbone, not a weakness hidden in a footnote.
- The retracted `instance_unbounded_below` is **proved but not claimed**: retraction here
  means the article no longer asserts it as a criticism of the paper, because the paper's
  own semantics already account for that direction. The article's criticism is the
  coefficient gap, which survives.
- "Kernel-verified" means: every checked fact was decided by the Lean type checker against
  fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the full set used,
  with no `sorry`, no `native_decide`, no external computer-algebra system. Attribution:
  the model-level predecessor theorem is the openai-math corpus's; the instance, the model
  lemma, and the run are this article's.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statement → article §3 (A1, Assumption F, A2) with the glossary (§6 here) open.
- Proof idea → §4 here, then article §5.
- Verification → article §6, `research/pilots/78/P0.lean`,
  `research/pilots/78/logs/p0-run4.log`.
- Novelty and nearest misses → article §4 (the openai-math predecessor row and the
  empty-critique-space evidence).
- Scope, the retraction, and attribution → article §7 (items 1, 2, 6, 7).

## 9. What you need going in

- Only the two operations of §2.1 — max and plus — plus comfort reading inequalities
  between them; everything in §3 is checkable with those.
- The idea of an algorithm as a state machine: states, one rule to pick the next move, a
  stopping condition, and a declared answer at the end.
- What a counterexample is: one instance in the admissible class where the claimed
  guarantee fails.
- The distinction between a machine-checked statement and a source-checked reading
  (PROVED-UNCONDITIONAL vs PAPER-ONLY), one sentence each (§7 above).
