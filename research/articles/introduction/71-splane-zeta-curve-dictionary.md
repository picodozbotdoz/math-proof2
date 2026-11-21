# The s-Plane Zeta of a Curve over 𝔽_q — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [The s-Plane Zeta of a Curve over 𝔽_q: Formal Dictionary, Exact Window, Hasse–Weil
> Transport](../71-splane-zeta-curve-dictionary.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; no Lean, no algebraic geometry, no exposure to this project assumed. Nothing here
> adds, weakens, or replaces any claim of the article: if this file and the article ever
> disagree, the article and its Lean artifacts win. Written 2026-11-21 against the article's
> committed state (v3).

## 1. In plain words

Counting solutions of polynomial equations over small finite fields is a classical game: a
curve over the field with q elements has finitely many points over it and over every bigger
field built from it, and those counts are packaged into one generating function, the
curve's zeta function. Weil proved in 1948 that this function is controlled by a short list
of complex numbers (the "Frobenius eigenvalues"), each of absolute value exactly √q — a
function-field analogue of the Riemann hypothesis that is actually a theorem. Formal
mathematics libraries state all of this using one variable (T); none contained the version
where the variable is the complex number s from the classical zeta picture. This article
builds that s-variable version in Lean and proves its first three consequences: a zero-free
half-plane, the exact location of all zeros, and the Hasse–Weil point-count bound — each
conditional on the Weil data, which the article carries as an explicit hypothesis structure
rather than importing its proof. Formalizing the first statement forced a correction: the
number-field-style exclusion "s ≠ 1" is genuinely false here, and the right exclusion is
the pole factor itself. The mathematics is classical; the contribution is the formal
dictionary.

## 2. The background, in one page

### 2.1 Finite fields and counting points

𝔽_q is the field with q elements (q a prime power); arithmetic in it is mod-q arithmetic
with multiplicative inverses added. A curve C over 𝔽_q (here: smooth, proper, geometrically
irreducible — read: no singular points, no boundary, one piece even after enlarging the
field) has finitely many points over 𝔽_q and over each extension 𝔽_{q^m} (m = 1, 2, 3, …);
write #C(𝔽_{q^m}) for those counts — for instance, all 25 pairs (x, y) for a curve like
y² = x³ − x over 𝔽₅. (classical.)

### 2.2 The zeta function of a curve and the Weil facts

The curve's zeta function packages the counts into one object:
Z_C(T) = P₁(T) / ((1 − T)(1 − q·T)), a rational function of one variable T, where
P₁(T) = ∏ over a multiset A₁ of complex numbers α of (1 − αT). The α's are the **Frobenius
eigenvalues**; the **Weil conjectures** (as proved by Weil for curves, 1948) say, among
other things, that |α| = √q for every α ∈ A₁ — the Riemann hypothesis for curves — and
that #C(𝔽_{q^m}) = q^m + 1 − Σ_{α∈A₁} α^m. The Hasse bound for genus 1 and Weil's bound in
general follow from the last formula by the triangle inequality. (All classical; Weil 1948,
Rosen GTM 210 ch. 5, Stichtenoth Thm 5.1.1.)

### 2.3 The s-plane dictionary

Number-field zeta functions are functions of a complex variable s; formal libraries had
the curve side only in the T-variable. The dictionary substitutes T = q^{−s}, where
q^{−s} means exp(−s·log q) with log q the real logarithm, making ζ_C(s) := Z_C(q^{−s}) a
function of s. Because exp is periodic in the imaginary direction (e^{2πi} = 1), the
substitution is not quite one-to-one: the value of q^{−s} repeats when s moves by
2πi/log q. That small fact is exactly where the article's forced correction comes from.

### 2.4 The article's core question

Does the s-plane object exist in any formal corpus (no), and what are its first three
basic facts — zero-freeness in Re s > 1/2 away from the poles, zeros exactly on the line
Re s = 1/2, and the Hasse–Weil count bound — as formal theorems? And what does the
formalization itself force you to fix about the statements?

## 3. One eigenvalue, by hand

The Weil data is hypothetical (it is the article's assumption W), so the smallest honest
instance is the arithmetic itself, instantiated at q = 4 (so √q = 2, log q = log 4).
Everything below is the article's Core lemmas with numbers.

**A zero lands exactly on the line.** Let α ∈ A₁ be an eigenvalue with |α| = 2 (purity
says all of them have this). Suppose P₁(q^{−s}) = 0. The polynomial is a product of
factors (1 − α q^{−s}), so some factor vanishes: α·q^{−s} = 1. Take absolute values:
|α| · |q^{−s}| = 1, so |q^{−s}| = 1/2. But |q^{−s}| = q^{−Re s} = 4^{−Re s} = 2^{−2·Re s},
so 2^{1−2·Re s} = 1, and since the real exponential is one-to-one, Re s = 1/2 exactly.
In words: every zero of the numerator sits precisely on the critical line — Theorem W2,
via Core 1.

**The poles the naive statement missed.** When does the denominator factor 1 − q·q^{−s}
vanish? We need q^{−s} = q^{−1}, i.e. exp(−s·log q) = exp(−log q). Because exp is
2πi-periodic, this happens not only at s = 1 but at the whole family
s = 1 + (2πi/log q)·k for every integer k — points with real part exactly 1, hence inside
the window Re s > 1/2. For q = 4 these sit at s = 1 + (2π/log 4)·i·k, spaced 2π/log 4 ≈
4.53 apart vertically. At those points the Lean function ζ_C(s), being defined by
division, evaluates to 0 (division by zero) — so the draft statement "ζ_C(s) ≠ 0 for
Re s > 1/2 and s ≠ 1" was *false in Lean*, and the corrected hypothesis excludes the pole
factor itself: 1 − q·q^{−s} ≠ 0. Core 2 shows this exclusion only ever bites on the line
Re s = 1. In words: the classical family of poles survives the dictionary, and the
formalization caught the draft's wrong exclusion at proof time, not at compile time.

**The count bound's shape.** At m = 1 (the field 𝔽₄ itself), Theorem HW reads
‖ #C(𝔽₄) − (4 + 1) ‖ ≤ |A₁| · 2: the number of points differs from 5 by at most
(cardinality of the eigenvalue multiset) times √q. The cardinality is left symbolic — the
classical value 2g (twice the genus) is true but is not derived in the article (§7 item 3).

*Provenance:* the pole-progression form 1 + (2πi/log q)ℤ and the forced correction are
article-recorded (§3 Remark); Core 1 and Core 2 are kernel-proved (article §6); the
q = 4 instantiation, the spacing 2π/log 4 ≈ 4.53, and the arithmetic above are
hand-computed from the article's §2–§3 definitions and agree with those recorded
statements. |A₁| = 2g is classical but explicitly not derived in the article, so it is
reported here only as classical context, not as an article claim.

## 4. How the proof works, without Lean

The whole article rests on one dictionary fact: |q^{−s}| = q^{−Re s} (the imaginary part
has modulus 1 in the exponential, so it drops out of absolute values). With that,
everything is short. Core 1: from √q · q^{−Re s} = 1, square and compare real exponentials
(the real exponential is injective) to force Re s = 1/2. Core 2: from q·q^{−s} = 1 the
same argument forces Re s = 1 — and the *complex* equation has the extra periodic
solutions, which is precisely the pole family the Remark handles. W2: a product vanishes
only if a factor vanishes, so α q^{−s} = 1 for some α ∈ A₁; purity gives |α| = √q, and
Core 1 finishes. W1: suppose ζ_C(s) = 0 with Re s > 1/2; a quotient is zero only if
numerator or denominator is; the numerator case contradicts W2, the factor 1 − q^{−s}
cannot vanish when Re s > 1/2 > 0 (its absolute value would be 1), and the factor
1 − q·q^{−s} is excluded by hypothesis. HW: substitute the eigenvalue formula for the
point count; the two boundary terms (from the multisets A₀ = {1} and A₂ = {q}) produce the
q^m + 1, and the triangle inequality plus purity bound the middle sum by |A₁|·(√q)^m. The
hypothesis structure W — the Weil conjectures transcribed as one assumption — is never
discharged here: the corpus that proves it sits behind a dependency wall whose import was
measured and priced out.

## 5. What the main results say, informally

A **binder** is a hypothesis the formal theorem carries as an explicit assumption; the
kernel proof is complete relative to it; the article names and does not discharge it. Here
the master binder is `W : WeilData F X 1` — the Weil conjectures for the curve, packaged
as one structure (eigenvalue multisets with purity |α| = √q, duality, Galois stability,
and the point-count formula). W is a true classical theorem (Weil 1948), so
conditional-on-W is conditional on established mathematics, not on a conjecture.

- **Theorem W1 (`curve_zeta_ne_zero`).** For Re s > 1/2 and 1 − q·q^{−s} ≠ 0: ζ_C(s) ≠ 0.
  In words: the s-plane curve zeta has no zeros in the right half of the critical strip,
  except on the line Re s = 1 where its poles live. PROVED-CONDITIONAL. → article §3, W1.
- **Theorem W2 (`curve_zero_re_eq_half`).** If P₁(q^{−s}) = 0 (numerator zero), then
  Re s = 1/2. In words: every zero of the interesting part sits exactly on the critical
  line — the function-field RH read in the s-plane. PROVED-CONDITIONAL. → article §3, W2.
- **Theorem HW (`hasse_weil_point_count`).** For every m ≥ 1 and every extension E/F of
  degree m: ‖#X(E) − (q^m + 1)‖ ≤ |A₁|·(√q)^m. In words: the point count deviates from
  the expected q^m + 1 by at most one √q-scale per eigenvalue — Weil's bound, in the
  s-plane article's vocabulary. PROVED-CONDITIONAL. → article §3, HW.
- **Core lemmas (`re_eq_half_of_norm_mul`, `re_eq_one_of_card_mul_wOf`).** The two
  exponent arithmetic facts above, unconditionally proved: the dictionary's engine, no
  Weil data needed. PROVED-UNCONDITIONAL. → article §3, Core 1–2.
- **The pole-exclusion correction (the formalization's forced fix).** The draft W1
  hypothesis "s ≠ 1" is false for the Lean-defined function (the periodic pole family);
  the faithful exclusion is 1 − q·q^{−s} ≠ 0. This is recorded as a *result of the
  formalization* — the draft elaborated fine and the falsity surfaced at the proof
  attempt. → article §3, Remark.
- **What is *not* here:** a proved meromorphic continuation (ζ_C is a Lean function defined
  by division; meromorphy and the exp-log point-count series are not formalized); the
  derived cardinality |A₁| = 2g; the exact zero-set description (one discrete family per
  eigenvalue); and any statement about *families* of curves or proportions of simple zeros
  — deliberately absent, because those are false per curve (a maximal curve can have a
  single zero of multiplicity 2g; article §1).

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| 𝔽_q | the field with q elements (q a prime power) | 𝔽₄ |
| C, X | the curve: smooth, proper, geometrically irreducible over 𝔽_q | y² = x³ − x over 𝔽₅ |
| #C(𝔽_{q^m}) | number of solutions over the degree-m extension | counted by trying all tuples |
| Z_C(T) | the curve's zeta function, a rational function of T | P₁(T)/((1−T)(1−qT)) |
| P₁(T), A₁ | the numerator polynomial; the Frobenius eigenvalue multiset | ∏_{α∈A₁}(1 − αT) |
| α (eigenvalue) | complex number with |α| = √q (purity) | |α| = 2 for q = 4 |
| W : WeilData F X 1 | the Weil conjectures as one hypothesis structure | the master binder |
| purity, pointCount | fields of W: |α| = √(q^i); #X(E) = Σ (−1)^i Σ α^{[E:F]} | the RH part; count formula |
| q^{−s} (`wOf`) | exp(−s·log q): the T = q^{−s} substitution | \|q^{−s}\| = q^{−Re s} |
| ζ_C(s) (`zetaC`) | the s-plane zeta: P₁(q^{−s})/((1−q^{−s})(1−q·q^{−s})) | the article's new object |
| pole progression | 1 + (2πi/log q)ℤ: where 1 − q·q^{−s} = 0 | s = 1 + 4.53·i·k for q = 4 |
| Re s, Im s | real and imaginary parts of s | Re s = 1/2 is the critical line |
| [E:F] = m | the extension degree in HW | m = 1 gives the q + 1 baseline |
| binder | named hypothesis the theorem carries; proof complete relative to it | W |
| triad | the routine Lean axioms: propext, Classical.choice, Quot.sound | every theorem here |
| PROVED-CONDITIONAL | kernel-proved relative to W (not discharged) | W1, W2, HW |

## 7. What this is — and what it is not

- The "zeta function of a curve" is a generating function built from *point counts over
  finite fields* — a different object from the Riemann zeta ζ(s), which is built from
  primes of ℚ. The article builds the curve object's s-plane version, which mirrors the
  number-field shape.
- "Weil conjectures" here are a **hypothesis structure** (the binder W), transcribed from
  a corpus that proves them in the T-variable. Conditional-on-W means conditional on
  classical mathematics, not doubtful. The proving corpus was not imported for measured
  infrastructure reasons (a 59,222-job dependency closure with thousands of drift errors
  on this project's pin).
- "Curve" means an algebraic curve — a solution set of polynomial equations over 𝔽_q with
  smoothness/properness/irreducibility conditions — **not** a graph-theoretic curve.
- This is a FORMALIZATION-FIRST record: the mathematics is classical (Weil 1948), and the
  claimed contribution is the first formal s-plane dictionary in the surveyed corpora plus
  the forced pole-exclusion correction. No new theorem about curves is asserted.
- "Kernel-verified" means: every theorem was machine-checked by the Lean type checker
  against fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the full set
  used, with no `sorry` and no imports beyond mathlib.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statement → article §3 with §2 (the WeilData structure) and the glossary (§6
  here) open; the Remark in §3 is the forced correction.
- Proof idea → §4 here, then article §5 (Core 1–2, W2, W1, HW in order).
- Verification → article §6; `research/pilots/71/P2.lean`;
  `research/pilots/71/logs/p2-run6.log`.
- Novelty → article §4 (the AxiomMath Weil row and the surveyed-corpus absence claim);
  what stays open → article §7 (RH as hypothesis; meromorphy; |A₁| = 2g; the exact zero
  set; family statements).

## 9. What you need going in

- Modular arithmetic and finite fields in the plain sense: 𝔽_q has q elements, and curves
  over it have finitely many points to count.
- Absolute values and one exponent rule: |q^{−s}| = q^{−Re s} (the imaginary part drops
  out of absolute values).
- One-to-one-ness of the real exponential, and periodicity of the complex one — the two
  facts the whole dictionary runs on.
- Polynomials as products: a product is zero exactly when a factor is zero. What a Lean
  kernel check is (§7 above) and what a packaged hypothesis ("binder", here W) is (§5).
