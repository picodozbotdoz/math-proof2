# An Exact Five-Defect Identity for the Rank–Trace Inequality — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [An Exact Five-Defect Identity for the Rank–Trace Inequality](../01-inertial-defect-master-identity.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; matrices with real and complex entries are introduced as needed; no Lean, no
> operator theory, no exposure to this project assumed. Nothing here adds, weakens, or
> replaces any claim of the article: if this file and the article ever disagree, the article
> and its Lean artifacts win. Written 2026-11-21 against the article's committed state.

## 1. In plain words

Somewhere inside a machine-checked proof about prime numbers sits a small piece of linear
algebra: an inequality bounding one computable quantity by another. It was proved as a
one-sided estimate, so it said nothing about *where the slack comes from* — how much room
the inequality leaves and which mechanisms create it. This article finds the exact
structure underneath: the slack decomposes into five named quantities, each of which is
individually nonnegative, each the leftover of a classical matrix inequality. Turning each
nonnegative quantity into an exact correction converts the inequality into an **identity**
— an equality that holds always, with the five leftovers visible. On the configuration
known to make the original inequality tight, all five leftovers vanish at once. Everything
is machine-checked; the whole result is linear algebra over the real and complex numbers,
with no number theory inside.

## 2. The background, in one page

### 2.1 Matrices, traces, and the two norms in play

An n-by-n matrix A with complex entries is **Hermitian** if it equals its conjugate
transpose — such matrices have all real eigenvalues, the numbers λ with Ax = λx for some
nonzero vector x. The **trace** tr A is the sum of the diagonal entries, equal to the sum
of the eigenvalues. The **Frobenius norm** ‖A‖²_F is the sum of the squared magnitudes of
all entries, equal here to Σ (eigenvalue)². Write rtr A = Re tr A (the real part of the
trace). For a Hermitian matrix, decompose the eigenvalues into positive and negative
parts: A = A₊ − A₋ with A₊, A₋ having only nonnegative eigenvalues and A₊A₋ = 0 (they
live on orthogonal coordinate blocks — the "spectral decomposition"). Write n₊(A) for the
number of strictly positive eigenvalues, and λ↓(A) for the eigenvalues sorted decreasing.
(classical.)

### 2.2 Positive semidefinite matrices and the input data

A Hermitian matrix is **positive semidefinite** (PSD) if all eigenvalues are ≥ 0. The
article's input is: nonnegative weights m_j and vectors v_j, from which one builds

  P = Σ_j m_j · v_j v_jᴴ,

a PSD matrix (each term is PSD), plus an arbitrary Hermitian perturbation Q. From a PSD
matrix like P, the "square roots" of its eigenvalues let one factor P = W Wᴴ; the numbers
m_j·‖v_j‖² are then the squared lengths of W's columns. Two classical facts about such
families are used: the nonzero eigenvalues of W Wᴴ and WᴴW coincide, and a diagonal
(sorted) can only be more spread out than the sorted spectrum it comes from (Schur–Horn
majorization); plus von Neumann's trace inequality bounding the pairing of two matrices'
eigenvalues. (All classical.)

### 2.3 The inequality (the donor's Lemma R)

For a fixed positive constant c, define the convex function g_c(x) = x² − c·x − ((x−c)₊)²,
where (y)₊ means "y if positive, else 0", and the penalty k_c(x) = c·x − g_c(x). The
donor's theorem — used deep inside a machine-checked prime-number result — bounds a
certificate built from P and Q:

  2c·rtr(P+Q) − ‖P+Q‖²_F ≤ Σ_j k_c(m_j‖v_j‖²) + c²·n₊(Q).

In words: the certificate on the left is at most the penalty of the input lengths plus a
charge of c² per positive eigenvalue of Q. It was proved as a sum of four separate
inequalities, so nothing recorded *where the slack sits*.

### 2.4 The article's core question

The donor proof is four nonnegativities in disguise, so an exact identity must exist
beneath the bound. What are the leftover quantities, are they each nonnegative, and does
the known tight configuration switch them all off at once?

## 3. One configuration, by hand

The article's own extremal configuration is the **TightMult** family: on-line atoms of
integer multiplicity m_j placed on orthonormal basis vectors, plus b diagonal "pair-block"
entries all equal to c. The smallest instance: r = 1 atom with m₁ = 1, b = 1 block, and
c = 1 (the hypothesis (m j : ℝ) ≤ c reads 1 ≤ 1, and 0 < c holds). Take dimension n = 2:

  P = diag(1, 0)   (one atom of weight 1 on the first coordinate vector),   Q = diag(0, 1).

Eigenvalues: p = (1, 0) for P; Q is PSD, so Q₋ = 0, μ = (0, 0), and π = n₊(Q) = 1. Now
compute the five defects from the article's §3 definitions (g_c(x) = x² − c·x − ((x−c)₊)²
with c = 1, and Δ_c(p,m) = m(m + 2(c − p)) for p ≤ c, (p − c − m)² for p ≥ c):

| defect | definition (article §3) | here |
|---|---|---|
| Δ_pt (pairing) | Σ_k Δ_c(p_k, μ_k) | Δ_1(1,0) + Δ_1(0,0) = 0 + 0 = **0** |
| Δ_SJ (Schur–Jensen) | Σ_k g_c(p_k) − Σ_j g_c(m_j x_j) | (g_1(1)+g_1(0)) − g_1(1·1) = 0 − 0 = **0** |
| Δ_vN (rearrangement) | Σ_k p_k μ_k − Re tr(P Q₋) | 0 − 0 = **0** |
| Δ₊ (positive coupling) | 2·Re tr(P Q₊) | 2·tr(diag(1,0)·diag(0,1)) = 2·0 = **0** |
| Δ_Q+ (pair block) | Σ over positive eigenvalues q of Q of (q − c)² | (1 − 1)² = **0** |

All five vanish — Theorem 3, on display by hand. The identity itself (Theorem 1) checks:
‖P+Q‖²_F = ‖diag(1,1)‖²_F = 1 + 1 = 2, and the right side reads
c·rtr P + Σ_j g_c(m_j x_j) + 2c·rtr Q − c²π + (five defects) = 1 + 0 + 2 − 1 + 0 = 2.
The donor inequality is tight here: the left side 2c·rtr(P+Q) − ‖P+Q‖²_F = 2·2 − 2 = 2
equals Σ_j k_c(m_j x_j) + c²π = k_1(1) + 1 = 1 + 1 = 2 — the donor's equality lemma,
explained by five simultaneous zeros.

**One non-tight instance, to see a defect at work.** Take dimension 1, c = 1, a single
atom m₁ = 2 with v₁ = 1, and Q = [0]: then P = [2], and Δ_pt = Δ_1(2, 0) = (2−1−0)² = 1,
while every other defect is 0 (Δ_SJ = g_1(2) − g_1(2) = 0; Δ_vN = Δ₊ = Δ_Q+ = 0). The
identity reads 4 = 2 + 1 + 0 + 1 (‖P+Q‖²_F = 4; right side c·rtr P + g_1(2) + Δ_pt = 2 +
1 + 1). The donor inequality now has slack exactly 1: the left side is 0 while the right
side is k_1(2) + 0 = 1, and the missing unit is precisely Δ_pt — the pairing defect,
quantifying how far the atom's weight 2 sits above the budget c = 1.

*Provenance:* the TightMult configuration, the five defect definitions, and the
Δ_c/g_c/k_c formulas are article-recorded (§2, §3, §5). The two numeric instantiations
above are hand-computed from those definitions; they agree with the kernel-proved theorems
(all five defects vanish on TightMult; the identity holds; the donor inequality holds with
equality on TightMult). The article itself records no numeric witnesses, and none are
invented here beyond these two worked instances of its own proved statements.

## 4. How the proof works, without Lean

The identity is proved in four classical moves, each recorded as one defect. First split
the Frobenius norm using Q = Q₊ − Q₋ and Q₊Q₋ = 0: ‖P+Q‖² = ‖P‖² + 2Re tr(PQ₊) − 2Re
tr(PQ₋) + ‖Q₊‖² + ‖Q₋‖². Second, the cross term with Q₋ is compared with the ideal pairing
Σ p_k μ_k of the sorted eigenvalues — the shortfall is *defined* to be Δ_vN, which is von
Neumann's trace inequality worn as an equality-plus-slack. Third, the diagonal square
Σ (p_k − μ_k)² is unpacked by the definition of Δ_c, and the difference between the
eigenvalue-side sum of g_c and the input-side sum of g_c — the shortfall of majorization —
is *defined* to be Δ_SJ. Fourth, the Q₊ block is expanded around c, producing the
sum-of-squares Δ_Q+. The pairing defect Δ_pt collects the Δ_c terms. Adding the four
lines gives Theorem 1; Theorem 2 observes each defect is ≥ 0 by its classical parent
inequality (PSD pairing, Schur–Horn with g_c convex and g_c(0) = 0, von Neumann, PSD trace,
and a square), which recovers the donor bound; Theorem 3 compares the donor's equality
configuration with the identity — the weighted defect sum is zero, and nonnegative
summands must each be zero. The content is not the mechanics but the *naming*: five
independent mechanisms (spectral pairing, majorization, rearrangement, cross-coupling,
block deviation), together accounting for all the slack.

## 5. What the main results say, informally

- **Theorem 1 (the master identity, `master_identity`).** For all data m, v, Q as in §2
  and every c > 0: ‖P+Q‖²_F equals the certificate expression c·rtr P + Σ_j g_c(m_j x_j) +
  2c·rtr Q − c²π **plus** the five defects Δ_pt + Δ_SJ + 2·Δ_vN + Δ₊ + Δ_Q+. In words: the
  norm is the bound's pieces plus exactly five named leftovers, no more, no less. No
  mathematical hypotheses (the Lean form carries only definitional regularity: Hermitian
  parts and semidefiniteness). PROVED-UNCONDITIONAL. → article §3, Thm 1.
- **Theorem 2 (nonnegativity; the donor inequality recovered).** If all weights m_j ≥ 0,
  every defect is nonnegative; consequently the donor's bound
  2c·rtr(P+Q) − ‖P+Q‖²_F ≤ Σ_j k_c(m_j x_j) + c²·b holds for every budget b ≥ n₊(Q). The
  anchor re-derives the donor theorem *from* the identity — a faithfulness check that the
  identity is not a different statement in disguise. PROVED-UNCONDITIONAL. → article §3,
  Thm 2.
- **Theorem 3 (simultaneous tightness, `tightness_of_master`).** On the TightMult
  configuration (on-line atoms of integer multiplicity m_j ≤ c on orthonormal vectors,
  Q = diag(0_r, c·I_b)) all five defects vanish simultaneously. In words: not merely
  equality in the bound — each of the five loss mechanisms is individually switched off, a
  strictly finer statement than the previously known equality case. PROVED-UNCONDITIONAL.
  → article §3, Thm 3.
- **What is *not* here:** improved zero-density constants. The article states plainly that
  it claims none (the donor's constants stand); the identity is standalone linear algebra.
  Also not formalized: three stated corollaries (a diagonal-dominance gain, a tail-mass
  refinement, the polarized form) and the converse direction — these live in the article's
  §7 as open, and the converse is deliberately not claimed because the nearest prior work
  partially contests it.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| 𝕜 ∈ {ℝ, ℂ} | the entry field: real or complex numbers | both allowed |
| Hermitian A | equals its conjugate transpose; real eigenvalues | diag(1, 0) |
| PSD (⪰ 0) | all eigenvalues ≥ 0 | P = Σ m_j v_j v_jᴴ |
| tr A, rtr A | trace (sum of diagonal entries); its real part | tr diag(1,1) = 2 |
| ‖A‖²_F | Frobenius norm squared: sum of squared entry magnitudes | 2 for diag(1,1) |
| λ↓(A) | eigenvalues in decreasing order | (1, 0) |
| A₊, A₋ | positive / negative spectral parts, A = A₊ − A₋ | Q₋ = 0 when Q is PSD |
| n₊(A), π | number of strictly positive eigenvalues | 1 for diag(0,1) |
| c | the fixed positive budget constant | c = 1 in §3 |
| g_c(x) | convex helper: x² − c·x − ((x−c)₊)² | g_1(2) = 1 |
| k_c(x) | the penalty: c·x − g_c(x) | k_1(2) = 1 |
| Δ_c(p, m) | scalar pairing slack: m(m+2(c−p)) for p ≤ c, (p−c−m)² for p ≥ c | Δ_1(2,0) = 1 |
| m_j, v_j, x_j | atom weights, vectors, squared lengths m_j‖v_j‖² | m₁ = 2, v₁ = 1, x₁ = 1 |
| P | the PSD input Σ_j m_j v_j v_jᴴ | diag(1, 0) |
| Q, Q₊, Q₋ | the Hermitian perturbation and its spectral parts | diag(0, 1) |
| Δ_pt, Δ_SJ, Δ_vN, Δ₊, Δ_Q+ | the five defects: pairing, majorization, rearrangement, coupling, block | all 0 on TightMult |
| TightMult | the extremal configuration: atoms of weight ≤ c on orthonormal vectors + c-blocks | r = b = 1, c = 1 in §3 |
| triad | the routine Lean axioms: propext, Classical.choice, Quot.sound | every theorem here |
| PROVED-UNCONDITIONAL | kernel-checked with no assumed mathematical hypotheses | all three theorems |

## 7. What this is — and what it is not

- "Defect" here means the nonnegative slack of a matrix inequality — the amount by which
  one side of an exact identity exceeds another — **not** a crystallographic defect, a
  defect in software, or any physics object. There are five of them, each owned by a
  classical inequality.
- "Rank–trace inequality" is the donor corpus's name for one specific certificate bound;
  the article's content is **pure linear algebra** — no number theory is used anywhere,
  even though the inequality's original home is a proof about prime numbers.
- "Inertia" language (n₊, positive/negative parts) is Sylvester's inertia from linear
  algebra — the count of positive eigenvalues — not mechanics or inertia tensors.
- No improved constants are claimed for the surrounding prime-number program (the article's
  own verdict: that race is lost); the deliverable is the exact structure beneath one
  one-sided bound, plus the faithfulness anchor re-deriving the donor theorem from it.
- "Kernel-verified" means: every theorem was machine-checked by the Lean type checker
  against fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the full set
  used, with zero `sorry` and no external computer algebra; the donor files consumed were
  ported verbatim between toolchains.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statement → article §3 (the defect table and Theorems 1–3) with §2 open for the
  notation.
- Proof idea → §4 here, then article §5 (the four-line split, then the three theorems).
- Verification → article §6 (formal record), `research/pilots/01/port/09_MasterIdentity.lean`,
  `research/pilots/01/port/10_TightMult.lean`,
  `research/pilots/01/logs/axcheck-final.log`.
- Novelty and nearest misses → article §4 (the donor row, the Alpöge–Furman equality case,
  and the companion-PDF row recording that this decomposition was sought and not found).
- What stays open → article §7 (the corollaries, the converse, the operator-level
  refinement).

## 9. What you need going in

- Matrices, eigenvalues, and diagonal matrices; the trace as the sum of diagonal entries.
- Comfort with "sum of squares of entries" (the Frobenius norm) and with sums over index
  sets.
- The vocabulary of nonnegativity: "PSD", "each summand of a nonnegative sum is
  nonnegative" — the engine of Theorem 3.
- One convexity slogan: a convex function's diagonal average cannot undercut its
  eigenvalue average (majorization), stated in §2.2 and used in §4.
- What a Lean kernel check is (one sentence, §7 above) — nothing else about
  formalization.
