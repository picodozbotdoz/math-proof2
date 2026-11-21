# The ETH-Appendix Operators Q_s Are, up to a Kronecker Term, Second Differences of Number Operators: Refutation of a Project-Formulated Parseval Conjecture and a Closed Form at h = 1 — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [The ETH-Appendix Operators Q_s Are, up to a Kronecker Term, Second Differences of Number Operators: Refutation of a Project-Formulated Parseval Conjecture and a Closed Form at h = 1](../30-boson-operators-second-difference-closed-form.md).
> Audience: an undergraduate mathematics background — polynomials and partial derivatives
> assumed; no Lean, no vertex operators, no physics assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state.

## 1. In plain words

Inside the appendix of a sibling formalization corpus (its "half pieces" appendix) lives a
family of operators Q_s acting on polynomials in variables t₁, t₂, …. The appendix proves
they resolve the identity: summed over the right range, they give back the identity
operator, scaled. This project conjectured a spectral strengthening — that the Q_s behave
like orthogonal projections, satisfying a Parseval-type identity. This article tests the
smallest case and finds the conjecture false: five explicit eigenvalues refute it three
ways. Then it determines the operators exactly: up to one Kronecker-delta term, each Q_s
is a second difference of "number operators" — the discrete analogue of a Laplacian, not a
projector. That shape explains everything: summing a second difference over a full window
gives zero (so the resolution of the identity survives), while squares of second
differences are nothing like projections (so every Parseval-type identity fails). The
conjecture refuted was formulated in this project; the discovery billed is the closed form
and the structure it reveals.

## 2. The background, in one page

### 2.1 The polynomial ring and its operators

V = ℚ[t₁, t₂, …] is the ring of polynomials in countably many variables, graded by weight
(wt(t_k) = k). The corpus's appendix builds it from two elementary moves (classical, the
vertex-operator/"boson" layer: Jing 1991; Macdonald; Kac–Raina):

  ∇_{−k} f = t_k·f (multiply by t_k),  ∇_k f = k·∂f/∂t_k (differentiate),  k ≥ 1.

Combining these with binomial weights gives mode operators t_k[r], pairs of them, and
finally the family Q_s(a, b) — an alternating, binomially weighted sum of mode-operator
products (the article's displays (47)–(48)). The **number operator** N_k = t_k ∂/∂t_k acts
on a monomial t^m by its exponent: N_k t^m = m_k·t^m. The **Euler operator**
Eul = Σ_k k·N_k reads the total weight.

### 2.2 Second differences and Kronecker deltas (classical)

For a function u : ℤ → ℝ, (Δ²u)(s) = u(s+1) − 2u(s) + u(s−1) — the discrete second
derivative. Δ² kills linear functions; applied to x ↦ x⁺ = max(x, 0) it gives the
Kronecker delta: (Δ²x⁺)(s) = 1 if s = 0, else 0. (classical)

### 2.3 The Parseval analogy (classical)

Orthogonal projections P_s with Σ_s P_s = Id and P_sP_t = [s = t]·P_s (where [s = t] is 1
if s = t, else 0) satisfy the Parseval identity Σ_s ⟨P_s f, P_s f⟩ = ⟨f, f⟩: the pieces
resolve the identity spectrally. The project's conjecture (B2) asked exactly this shape
for the Q_s; its companion (B1) asked self-adjointness.

### 2.4 What the donor corpus proves

The appendix's LemmaQ has three items: (a) symmetry under exchanging factors, (b) Q_s
vanishes on the weight-E piece V_E for |s| > E + h, and (c) the resolution of the identity
Σ_{|s| ≤ E+h} Q_s = (a[−h]·b)·Id on V_E. Item (c) is the only spectral fact the corpus
proves. The article's core question: is the resolution spectral — do the Q_s also compose
like projections? And, beyond yes/no: what are the Q_s exactly?

## 3. One example, by hand

The article's smallest recorded witness is the five-eigenvalue tuple on the monomial t₁,
at the specialization h = 1, a = b = t₁ (Theorem 1):

  (Q₋₂, Q₋₁, Q₀, Q₁, Q₂) t₁ = (1, −2, 3, −2, 1)·t₁.

Recompute it from the article's closed form (Theorem 3/Corollary 4): on a monomial t^m,
Q_s acts by q_s(m) = δ_{s0} + (Δ²ψ_m)(s), where the occupation profile is
ψ_m(j) = |j|·m_{|j|}. For t₁ (exponent m with m₁ = 1): ψ(±1) = 1 and ψ = 0 elsewhere.
Build the second differences:

| s | ψ(s−1) | −2ψ(s) | ψ(s+1) | (Δ²ψ)(s) | δ_{s0} | q_s |
|---|---|---|---|---|---|---|
| −2 | ψ(−3) = 0 | 0 | ψ(−1) = 1 | 1 | 0 | **1** |
| −1 | ψ(−2) = 0 | −2ψ(−1) = −2 | ψ(0) = 0 | −2 | 0 | **−2** |
| 0 | ψ(−1) = 1 | 0 | ψ(1) = 1 | 2 | 1 | **3** |
| 1 | ψ(0) = 0 | −2ψ(1) = −2 | ψ(2) = 0 | −2 | 0 | **−2** |
| 2 | ψ(1) = 1 | 0 | ψ(3) = 0 | 1 | 0 | **1** |

— the recorded tuple, every entry by hand. All three refutations now follow by arithmetic
on the tuple:

- Σ_s Q_s t₁ = (1 − 2 + 3 − 2 + 1)·t₁ = t₁: the resolution of the identity (LemmaQ (c))
  HOLDS.
- Q₀² t₁ = 3·3·t₁ = 9t₁ ≠ 3t₁ = Q₀ t₁: idempotence FAILS.
- Q₋₂Q₀ t₁ = 3t₁ ≠ 0: mutual annihilation FAILS.
- Σ_s Q_s² t₁ = (1 + 4 + 9 + 4 + 1)·t₁ = 19t₁ ≠ t₁: the Parseval identity FAILS.

A second recorded spot value, same mechanism: Q₀ t₁² = 5t₁². Check: for t₁² (m₁ = 2),
ψ(±1) = 2, so (Δ²ψ)(0) = 2 + 2 = 4, plus δ gives 5 — and the article's formula "Q₀ acts
on t₁^E by 1 + 2E" at E = 2 agrees.

*Provenance:* the eigenvalue tuple (1, −2, 3, −2, 1), the three failures (9 ≠ 3, 3 ≠ 0,
19 ≠ 1), the surviving resolution, and the spot value Q₀ t₁² = 5t₁² are article-recorded
(article §3 Theorem 1 and Corollary 4; kernel declarations `TheoremB2_refuted_h1`,
`Qh1_zero_t1sq`). The Δ²ψ table above is hand-recomputed from the article's §2/§3
definitions (ψ_m, Δ², q_s) and agrees with those recorded values.

## 4. How the proof works, without Lean

The engine is Lemma 2: each product ∇_x∇_{−x} collapses to a scalar plus a number
operator, ∇_x∇_{−x} f = x⁺·f + |x|·N_{|x|} f — proved by the two cases x > 0 (multiply
then differentiate, giving x·f + x·N_x f) and x < 0 (differentiate then multiply, giving
k·N_k f with k = −x). At h = 1 the Q_s are three such products (the article's display
(Q)); substituting Lemma 2, the scalar parts collect into the second difference of
x ↦ x⁺ — which is exactly the Kronecker delta [s = 0] — and the number-operator parts
give the closed form of Theorem 3. Evaluating on monomials turns N_k into the exponent
m_k, giving Corollary 4's q_s(m) = δ_{s0} + (Δ²ψ_m)(s); commutativity follows because the
Q_s are diagonal on monomials, which span V. The refutation (Theorem 1) is the instance
m = e₁ computed in §3 above. Corollary 5's moment identities are discrete summation by
parts: ψ_m has compact support, Σ_s w(s)(Δ²ψ)(s) = Σ_j ψ(j)(Δ²w)(j), and Δ² of a constant
or linear weight is 0 while Δ²(s²) = 2 — giving Σ Q_s = Id, odd moments zero, and
Σ s²Q_s = 4E·Id.

## 5. What the main results say, informally

- **Theorem 1 (`TheoremB2_refuted_h1` + witnesses).** At h = 1, a = b = t₁, on V₁ the
  eigenvalue tuple (1, −2, 3, −2, 1) holds, and all three conjectured B2 properties fail
  (idempotence, mutual annihilation, operator Parseval) while LemmaQ (c) survives.
  PROVED-UNCONDITIONAL. → article §3, Thm 1.
- **Lemma 2 (`nab_nab`).** ∇_x∇_{−x} f = x⁺·f + |x|·N_{|x|} f for every x ∈ ℤ, f ∈ V.
  PROVED-UNCONDITIONAL. → article §3, Lemma 2.
- **Theorem 3 (`Qh1_closed`), the closed form.** For every s ∈ ℤ and f ∈ V:
  Q_s f = [s = 0]·f + |1−s|·N_{|1−s|} f − 2|s|·N_{|s|} f + |s+1|·N_{|s+1|} f — each Q_s
  is, up to the Kronecker term, a second difference of number operators.
  PROVED-UNCONDITIONAL. → article §3, Thm 3.
- **Corollary 4 (spectral form; commutativity).** On monomials, Q_s t^m =
  (δ_{s0} + (Δ²ψ_m)(s))·t^m; hence all Q_s commute, and Q₀ is idempotent on V_E only when
  E = 0. PROVED-UNCONDITIONAL. → article §3, Cor 4.
- **Corollary 5 (moment identities).** On V_E with window M ≥ E + 1:
  Σ_s Q_s = Id, Σ_s s^{2r+1}Q_s = 0, Σ_s s²Q_s = 4E·Id, plus a Laurent-series generating
  form. PAPER-ONLY — the general proof is the article's §5.3, with three instances
  kernel-checked (`moment1_V1`, `moment2_V1`, `moment2_V2_t2`). → article §3, Cor 5.
- **Faithfulness checks.** LemmaQ (a)/(c) for the h = 1 instance on V₀, V₁, the t₂-line
  of V₂, and the pairing value: PROVED-UNCONDITIONAL (support layer confirming the
  specialization is faithful to the donor's definitions). → article §6, faithfulness rows.
- **Whose conjecture.** B2 was formulated in this project (dossier 30); the refutation is
  a disconfirmation of our own conjecture, not of any literature claim. The classical
  boson layer is consumed, not claimed. → article §4, scope statement.
- **What is *not* here:** general h ≥ 2 (no closed form known); self-adjointness (B1) at
  most a paper-level corollary of an unformalized identification; the formalization of
  Corollary 5. → article §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| V = ℚ[t_k] | polynomials in t₁, t₂, …, graded by weight wt(t_k) = k | t₁² has weight 2 |
| V_E | the weight-E piece (finite-dimensional) | V₁ spanned by t₁ |
| ∇_{−k}, ∇_k | multiply by t_k; differentiate with factor k | ∇₁ t₁ = 1 |
| t_k[r], a[r] | mode operators built from the ∇'s with binomial weights | t₁[r] = ∇_{−r} at h = 1 |
| Q_s(a,b) | the appendix's family: alternating binomial sum of mode products (display (48)) | Σ_s Q_s = (a[−h]·b)·Id |
| (Q) | the h = 1 specialization: three ∇-products | Q_s f = ∇_{1−s}∇_{s−1}f − 2∇_{−s}∇_s f + ∇_{−s−1}∇_{s+1}f |
| N_k | number operator t_k∂/∂t_k; acts by the exponent | N₁ t₁² = 2t₁² |
| x⁺ | max(x, 0) | (−3)⁺ = 0 |
| ψ_m(j) | occupation profile \|j\|·m_{\|j\|} of a monomial | ψ(±1) = 1 for t₁ |
| Δ²u | second difference u(s+1) − 2u(s) + u(s−1) | Δ²(x⁺) = δ_{s0} |
| δ_{s0}, [s = 0] | Kronecker delta | [0 = 0] = 1 |
| q_s(m) | eigenvalue of Q_s on t^m: δ_{s0} + (Δ²ψ_m)(s) | (1,−2,3,−2,1) on t₁ |
| Eul, E | Euler operator Σ k·N_k; the total weight | Q₀ on t₁^E acts by 1 + 2E |
| a[−h]·b | the corpus's pairing (here ∇₁t₁ = 1) | the scaling in LemmaQ (c) |
| LemmaQ (a)/(b)/(c) | symmetry; vanishing off-range; resolution of the identity | (c): Σ Q_s = (a[−h]·b)·Id |
| B1, B2 | the conjectured self-adjointness; the refuted Parseval conjecture | B2 false (Thm 1) |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL / PAPER-ONLY | kernel-checked, no hypotheses / proved on paper, instances kernel-checked | Thm 3 / Cor 5 |

## 7. What this is — and what it is not

- "Boson operators", "number operators", "occupation" are Fock-space-flavored names for
  concrete operators on a polynomial ring (multiply by t_k, differentiate by k) — the
  classical vertex-operator layer. No particle physics, no phenomenology, no physical
  claim anywhere.
- "Parseval" borrows Fourier-analysis vocabulary for the projection analogy (§2.3); what
  fails is the operator-algebra identity Σ_s Q_s² = Q_s-type behavior, not anything about
  Fourier transforms.
- "ETH-appendix" names the appendix of the sibling corpus that formalizes the eth
  project's paper (its "half pieces" appendix) — not the Exponential Time Hypothesis that
  article 10's headline discusses, though both draw on the same sibling corpus.
- The refuted conjecture B2 is this project's own; the refutation disconfirms nobody else.
- "Kernel-verified" means every theorem was machine-checked term by term by the Lean type
  checker against fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the
  full set used (the scalar-part lemma uses even fewer); Corollary 5 is PAPER-ONLY and the
  article labels it so.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statements → article §3, with the glossary (§6 here) and article §2 (displays
  (47)–(48)) open.
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (formal record), `research/pilots/30-falsify-TheoremB-h1.lean`,
  `research/pilots/30/ClosedForm.lean`, and the cited logs.
- Novelty and nearest misses → article §4 (the donor row; the Jing/Macdonald/Kac–Raina
  attribution; the VERDICTS record).
- What stays open → article §7 (general h, B1, formalizing Corollary 5).

## 9. What you need going in

- Polynomials in several variables; partial derivatives of monomials
  (∂/∂t_k of t^m gives m_k·t^m/t_k).
- Second differences of integer-indexed sequences and summation by parts.
- Eigenvalue language for diagonal operators ("Q_s acts on t^m by the scalar q_s(m)").
- The Kronecker delta and the max function x⁺.
- What a hypothesis (or its absence) means in a kernel-checked theorem — one sentence.
