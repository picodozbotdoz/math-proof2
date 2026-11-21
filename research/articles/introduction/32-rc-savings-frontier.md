# The Exact Savings Frontier of the Thin-Product Certificate Class of the 3SUM/APSP Refutation — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [The Exact Savings Frontier of the Thin-Product Certificate Class of the 3SUM/APSP Refutation](../32-rc-savings-frontier.md).
> Audience: an undergraduate mathematics background — no Lean, no complexity theory, no
> exposure to this project assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state.

## 1. In plain words

The research corpus that formally refutes the 3SUM and APSP benchmark hypotheses includes
a family of certified guarantees — "certificates" — parameterized by two numbers: a width
c and a density θ. Each certificate says: for instances up to a range parameter N, a data
structure of a certain size achieves a savings exponent γ, provided the range exponent ε
sits below an explicit curve R_c(γ). Downstream users had to pick a certificate blindly.
This article answers the natural optimization question exactly: for a given ε, which
savings exponents γ can this certificate family achieve at all? The answer has a sharp
phase transition: below the threshold ε* ≈ 0.1204 there is a unique crossing of two
explicit monotone curves, the achievable set is exactly an open interval, and the best
achievable γ is the explicit frontier function Γ(ε); at and above ε*, nothing is
achievable. All seven theorems are kernel-verified and unconditional; one honesty caveat
is stated in the article itself: the constants are superseded at birth (later work
reaches a larger range), so the discovery is the frontier's exact shape — unique
crossing, exact Γ, non-attainment, threshold — not any record value.

## 2. The background, in one page

### 2.1 The benchmark problems and the savings shape (classical)

3SUM asks: given n integers, do three of them sum to zero? APSP asks: compute all shortest
paths in an n-node graph? Both are conjectured hard (about n², resp. n³ time), and the
donor corpus — the 3SUM/APSP refutation — proves, formally, time bounds that refute those
conjectures in its model. A "savings exponent" γ measures how far below such a baseline a
certified scheme sits, in logarithmic terms. (classical context for the corpus's world)

### 2.2 The certificate family (the donor's Corollary 31, transcribed)

For parameters: width c > 10, density θ ∈ (0, 9/10), savings exponent γ ≥ 0, and range
exponent ε (the data kept is D ≤ N^ε), the corpus certifies a polylog-savings data
structure whenever

  ε < R_c(γ) = ln 4 / ln Λ(c, γ),  where
  ln Λ(c, γ) = c·ln 10 − (c/2)·H(1/c) − (c − 1)·ln 3 + γ·ln 4,

with H(x) = −x·ln x − (1−x)·ln(1−x) the binary entropy function. Two derived quantities:
ρ_c = 9/(c−1) and gammaOf(c, θ) = θ·ln(1/ρ_c)/ln 4 — the largest γ a certificate at width
c and density θ can carry.

### 2.3 The achievable set and its two curves

Fix ε > 0 and define

  Ach(ε) = { γ > 0 : some c > 10 and θ ∈ (0, 9/10) give γ ≤ gammaOf(c, θ) and
             ε < R_c(gammaOf(c, θ)) },  Γ(ε) = sup Ach(ε).

Theorem 4's key equivalence rewrites the second condition as γ < gmax(ε, c), where
gmax(ε, c) = (ln 4/ε − ln Λ(c, 0))/ln 4. So γ is achievable at width c exactly when it
lies under both curves: gammaOf(c, 9/10) (increasing in c) and gmax(ε, c) (decreasing in
c). A **crossing** is a c > 10 where the two curves meet. The article's core question:
is there an exact formula for Γ(ε), and does achievability have a sharp threshold in ε?

## 3. One example, by hand

The article's smallest fully hand-checkable witness is the endpoint evaluation (Theorem 2):
ln Λ(10, 0) = 5·ln 10, hence R_10(0) = ε*. Derivation, term by term:

- H(1/10) = −(1/10)·ln(1/10) − (9/10)·ln(9/10) = (1/10)·ln 10 − (9/10)·ln(9/10), and with
  ln(9/10) = 2·ln 3 − ln 10 this becomes (1/10)·ln 10 − (9/10)·(2 ln 3 − ln 10)
  = ln 10 − (9/5)·ln 3.
- ln Λ(10, 0) = 10·ln 10 − 5·H(1/10) − 9·ln 3 = 10 ln 10 − 5 ln 10 + 9 ln 3 − 9 ln 3
  = **5 ln 10**. ✓
- So ε* = ln 4/(5 ln 10) ≈ 1.38629/11.51293 ≈ **0.1204** — the article-recorded value.

The phase transition (Theorem 7) around it, with gmax(ε, 10) = (ln 4/ε − 5 ln 10)/ln 4
computed by hand at two ε's:

| ε | ln 4/ε | gmax(ε, 10) | verdict (from Theorems 3 and 7) |
|---|---|---|---|
| 0.12 < ε* | ≈ 11.5525 | ≈ +0.0285 > 0 | achievable γ's exist near c = 10: Ach(0.12) = (0, Γ(0.12)), Γ = gammaOf(c*, 9/10) at the unique crossing c* |
| 0.121 > ε* | ≈ 11.4570 | < 0 (and ln Λ(c, 0) only grows with c) | nothing achievable: Ach(0.121) = ∅ |

The exact value Γ(0.12) is not hand-computable in closed form and is recorded nowhere —
the theorem gives the formula Γ(ε) = gammaOf(c*(ε), 9/10) via the unique crossing, not a
decimal; none is invented here.

*Provenance:* the formulas (H, ln Λ, R_c, ε*, ρ_c, gammaOf, gmax) and the value
ε* ≈ 0.1204 are article-recorded (article §2, §3 Theorems 2–4, 7; abstract). The H(1/10)
simplification and ln Λ(10, 0) = 5 ln 10 are the article's own §5 proof, here re-derived
by hand; the gmax evaluations at ε = 0.12 and 0.121 are hand-computed instances of the
recorded formula, consistent with the recorded theorems; no crossing value c*(ε) or Γ
decimal appears in the article and none is asserted here.

## 4. How the proof works, without Lean

The engine is the interplay of two monotone curves. Theorem 1: ln Λ is affine in γ with
positive slope ln 4, so R_c decreases in γ. Theorem 2 is the exact arithmetic above.
Theorem 3: write (c/2)·H(1/c) = −F(c)/2 with F(c) = (c−1)·ln(c−1) − c·ln c; the mean value
theorem on F, plus a purely rational comparison ln(100/9) > ln(10/9), shows ln Λ(c, 0)
strictly increases in c — so R_c(0) strictly decreases, and R_c(γ) < ε* for every c > 10.
Theorem 4 clears denominators in ε < R_c(γ) to get γ < gmax(ε, c). Theorem 5: since
gammaOf(c, 9/10) increases and gmax decreases, two crossings coincide; at a crossing c*,
every achievable γ is < gammaOf(c*, 9/10) (whichever side its width sits on), and every
value below is achieved at c* itself — so Ach(ε) = (0, gammaOf(c*, 9/10)) and the supremum
is not attained. Theorem 6 discharges the crossing's existence for every ε ∈ (0, ε*) by
the intermediate value theorem: near c = 10 the curve difference is negative (an explicit
witness width), far out it is positive (gmax → −∞), so a crossing exists. Theorem 7: below
ε*, an explicit choice c = 10 + Δ makes gmax positive (constructive direction); above ε*,
Theorem 3's ceiling kills everything (contrapositive).

## 5. What the main results say, informally

- **Theorem 1 (`lnΛ_affine`, `Rc_antitone_gamma`).** For c ≥ 10 and 0 ≤ γ < γ′:
  R_c(γ′) < R_c(γ) — larger savings demand a smaller range. PROVED-UNCONDITIONAL. →
  article §3, Thm 1.
- **Theorem 2 (`lnΛ_10_0`, `Rc_10_0`).** ln Λ(10, 0) = 5 ln 10 and R_10(0) = ε* — the
  exact endpoint evaluation, hand-derived in §3 above. PROVED-UNCONDITIONAL. → article
  §3, Thm 2.
- **Theorem 3 (`lnΛ_mono`, `Rc_strictAntiOn_zero`, `Rc_lt_epsStar`).** R_c(0) strictly
  decreases in c on [10, ∞), and R_c(γ) < ε* for all c > 10, γ ≥ 0 — the donor's
  qualitative monotonicity facts, re-proved independently (donor re-proof at the same
  pin). PROVED-UNCONDITIONAL. → article §3, Thm 3.
- **Theorem 4 (`lt_Rc_iff_gmax`).** For 0 < ε, c ≥ 10, γ ≥ 0: ε < R_c(γ) if and only if
  γ < gmax(ε, c) — the certificate condition becomes a two-curve comparison.
  PROVED-UNCONDITIONAL. → article §3, Thm 4.
- **Theorem 5 (`crossing_unique`, `membership_of_lt`, `frontier_upper`,
  `frontier_of_crossing`).** At most one crossing exists; if c* is one, then
  Ach(ε) = (0, gammaOf(c*, 9/10)) and Γ(ε) = gammaOf(c*, 9/10), with the supremum not
  attained. PROVED-UNCONDITIONAL (as a conditional statement; its crossing hypothesis is
  discharged by Theorem 6 on the whole range (0, ε*)). → article §3, Thm 5.
- **Theorem 6 (`crossing_exists`, `frontier_unconditional`,
  `frontier_formula_unconditional`).** For every ε ∈ (0, ε*) a crossing c* > 10 exists;
  it is unique, and the frontier formula holds outright. PROVED-UNCONDITIONAL (the
  formalized forms carry 0 < ε and ε < ε* as explicit hypotheses; the range is sharp). →
  article §3, Thm 6.
- **Theorem 7 (`frontier_nonempty_iff`, `ceiling`).** For ε > 0: Ach(ε) ≠ ∅ if and only
  if ε < ε*; for ε ≥ ε* the achievable set is empty — the sharp phase transition. →
  article §3, Thm 7. PROVED-UNCONDITIONAL.
- **What is *not* here:** the ε-dependence of c*(ε) (continuity, monotonicity,
  Γ(ε) → 0 as ε → ε*⁻); the ceiling of adaptive schedules (the dossier's Theorem C);
  transport to Majdoddin's improved class; the donor's data-structure statement itself. →
  article §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| N, D | instance size; kept data (D ≤ N^ε) | — |
| ε | range exponent: how much data the scheme keeps | 0.12 |
| γ | savings exponent: how far below baseline the scheme sits | ≤ gammaOf(c, θ) |
| c, θ | certificate width and density | c > 10, θ ∈ (0, 9/10) |
| H(x) | binary entropy −x ln x − (1−x) ln(1−x) | H(1/10) = ln 10 − (9/5) ln 3 |
| ln Λ(c, γ) | the certificate's denominator: c ln 10 − (c/2)H(1/c) − (c−1) ln 3 + γ ln 4 | ln Λ(10,0) = 5 ln 10 |
| R_c(γ) | ln 4 / ln Λ(c, γ): the range the certificate tolerates | R_10(0) = ε* |
| ε* | ln 4/(5 ln 10) ≈ 0.1204: the phase-transition point | Ach(ε) = ∅ for ε ≥ ε* |
| ρ_c, gammaOf(c,θ) | ρ_c = 9/(c−1); gammaOf = θ·ln(1/ρ_c)/ln 4 | gammaOf(10, θ) = 0 |
| Ach(ε) | the achievable savings exponents at range ε | (0, Γ(ε)) for ε < ε* |
| Γ(ε) | sup Ach(ε), the frontier function | = gammaOf(c*(ε), 9/10) |
| gmax(ε, c) | (ln 4/ε − ln Λ(c,0))/ln 4: the second curve | ≈ 0.0285 at (0.12, 10) |
| crossing c* | width where gammaOf(c, 9/10) = gmax(ε, c) | unique when it exists |
| sup, non-attainment | least upper bound; Γ(ε) ∉ Ach(ε) | the open interval's right end |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL | kernel-checked with no hypotheses beyond the triad (stated domains only) | all of Thms 1–7 |

## 7. What this is — and what it is not

- "3SUM" and "APSP" are fine-grained-complexity benchmark hypotheses (one line each in
  §2.1); the donor corpus refutes them in its formal model. This article's theorem is
  about the certificate class's achievable frontier — it neither needs nor re-derives the
  refutation.
- "Certificate" here means a member of a proven, parameterized family of guarantees (the
  donor's Corollary 31) — not a proof-assistant certificate and not a cryptographic one.
- "Thin product" is the donor construction's name for products of sparse ("thin")
  matrices; the frontier is about the certified savings, not about matrix algebra.
- "Phase transition" is exact mathematics of the set Ach(ε) at ε* — not physics.
- The constants are superseded at birth (Majdoddin's coordinatewise dichotomy already
  reaches ε < ln 4/(5 ln 5) ≈ 0.172; the article says this in its abstract): the claim is
  the frontier shape — unique crossing, exact Γ, non-attainment, sharp threshold — scoped
  as the first such exact frontier for a data-structure certificate class in the surveyed
  corpora. "Kernel-verified" means every theorem was machine-checked term by term by the
  Lean type checker against fixed axioms — the triad (propext, Classical.choice,
  Quot.sound) is the full set used.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statements → article §3, with the glossary (§6 here) and article §2's formula
  list open.
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (formal record), `research/pilots/32/M1.lean` and `M2.lean`,
  and the cited logs (note the verification-notes paragraph on the consumed lemmas'
  axiom containment).
- Novelty and nearest misses → article §4 (donor row; Majdoddin; Tomar; the scope
  statement on superseded constants).
- What stays open → article §7 (the dossier's Theorem C, the ε-dependence of c*, the
  transport to Majdoddin's class).

## 9. What you need going in

- Natural logarithm; the entropy expression H(x) and simple log identities
  (ln(9/10) = 2 ln 3 − ln 10).
- Monotone functions and where two of them cross; the intermediate value theorem.
- The supremum of a set of reals, and why an open interval's endpoint is not attained.
- Reading inequalities between explicit formulas (no big-O anywhere in this article).
- What a hypothesis (here: only the stated domains) means in a kernel-checked theorem.
