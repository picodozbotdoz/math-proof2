# Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower — Two Regimes,
> Conditional on Component Proportions](../75-abelian-assembly-zetaL-proportions.md).
> Audience: an undergraduate mathematics background — modular arithmetic and polynomials
> assumed; no Lean, no analytic number theory, no exposure to this project assumed. Nothing
> here adds, weakens, or replaces any claim of the article: if this file and the article ever
> disagree, the article and its Lean artifacts win. Written 2026-11-21 against the article's
> committed state (v5).

## 1. In plain words

A zeta function of a number field has zeros — complex numbers where the function vanishes —
and a classical theme asks what *fraction* of them sit on a special vertical line (the
"critical line"). This article proves, with full machine verification, a bookkeeping
schema: when a big zeta function factors into simpler ones, and each factor is known to
keep at least some fraction of *its* zeros on the line, then the big function keeps at
least the weakest of those fractions. The setting is a tower of number fields L over K,
where class field theory (classical) factors the zeta function of L into the zeta function
of K times one factor per symmetry of the tower; two regimes are worked out — with
multiplicity at 2/3, and distinct zeros at 5/6 with an explicit correction for shared
zeros. Every conclusion is conditional — the per-factor statements are carried as explicit
named assumptions — and the article says precisely which are proved elsewhere and which
are open. The contribution is the schema and the bookkeeping, not new analysis.

## 2. The background, in one page

### 2.1 Zeta functions and their zeros

For a number field K (a finite extension of the rationals), the **Dedekind zeta function**
ζ_K(s) is built from the sizes of ideals of K the way the Riemann zeta ζ(s) = ζ_ℚ(s) is
built from primes. Its **nontrivial zeros** solve ζ_K(s) = 0 with 0 < Re s < 1; the
**critical line** is Re s = 1/2. For the rationals the on-line fraction record grew past
1/3 and 2/5 to about 0.673; for K ≠ ℚ far less was known. (classical.)

### 2.2 Proportions, the way this article counts them

Fix a height T and count the nontrivial zeros with imaginary part in (0, T], counting a
zero twice if it vanishes doubly ("with multiplicity"). Write N(T) for that count, N⁰(T)
for the same count restricted to the critical line, and D(T) for the *distinct* count.
"At least the fraction c of the zeros lie on the line" becomes a division-free ε-form: for
every ε > 0 there is a T₀ with (c − ε) · N(T) ≤ N⁰(T) for all T ≥ T₀ — beyond T₀ the
on-line count is within relative ε of the fraction c (the same shape with the distinct
count as numerator serves the 5/6 regime).

### 2.3 The abelian factorization (classical)

An abelian extension L/K is one whose symmetry group is commutative. Class field theory
(classical) gives ζ_L(s) = ζ_K(s) · ∏_i L(s, χ_i): the base zeta function times one
**Hecke L-function** per nontrivial character χ_i of the tower; over K = ℚ the χ_i are
ordinary Dirichlet characters and the factors are Dirichlet L-functions. The product's
zeros are the pooled zeros of all the factors.

### 2.4 The article's core question

If each factor keeps at least some fraction of its zeros on the line, what fraction must
the *product* ζ_L keep? The answer needs no analysis — only that counts add — and the
article's theorems are exactly that bookkeeping: first with multiplicities (2/3), then for
distinct counts with an explicit correction for shared zeros (5/6).

## 3. One assembly, by hand

The smallest instance that shows the machinery is the counting step itself, with the
article's own recorded constants; everything below is algebra on its definitions or
arithmetic on its numerals.

**Step 1 — counts add.** The factorization ζ_L = ζ_K · ∏_i F i (F i the Hecke factors)
holds where the factors are analytic, and at any zero point ρ ≠ 1 the multiplicity of ρ as
a zero of the product is the *sum* of its multiplicities per factor (the article's §5.2).
Summing over a window (§5.1):

  N_L(T) = N_K(T) + Σ_i N_{F i}(T), and likewise N⁰_L(T) = N⁰_K(T) + Σ_i N⁰_{F i}(T).

In words: the product's zero counts up to height T are the sums of the factors' counts.

**Step 2 — proportions pool.** Suppose each factor satisfies the ε-form at the same
constant 2/3: (2/3 − ε) · N ≤ N⁰. Fix ε, take T₀ to be the largest of the finitely many
per-factor thresholds; for T ≥ T₀ every factor's inequality holds, and adding them:

  (2/3 − ε) · (N_K + Σ_i N_{F i}) ≤ N⁰_K + Σ_i N⁰_{F i} = N⁰_L.

By Step 1 the bracket is exactly N_L(T): ζ_L satisfies the ε-form at 2/3 — one line of
arithmetic once counts add. If the factors' constants differ, first lower every one to
the weakest, c* = min(c₀, min_i c i) (the ε-form is monotone): that is Theorem A.

**Step 3 — the recorded constants.** Theorem B feeds the ζ_K column through a certificate
slot at Knausgård's 1669159/2478195, Theorem E through 1645064/1960733; both must exceed
their targets, and the cross-multiplications are hand-checkable:

- 3 × 1669159 = 5007477 > 2 × 2478195 = 4956390, so 1669159/2478195 > 2/3 (the article's
  `two_thirds_le_673`, §5.4); and 6 × 1645064 = 9870384 > 5 × 1960733 = 9803665, so
  1645064/1960733 > 5/6 (the article's `five_sixths_le_839`, §5.3).

In words: the slot constants are about 0.6735 and 0.839, safely above 2/3 ≈ 0.667 and
5/6 ≈ 0.833. What is *not* computed here: any actual zero count — the article records
none; the component proportions at a general base are its open core.

*Provenance:* the constants 1669159/2478195 and 1645064/1960733, the slot names, the
min-form of Theorem A, and the ε-sum argument are article-recorded (§2, §3.1–3.2,
§5.3–5.4); the two cross-multiplications above are hand-recomputed and agree with the
article's recorded comparisons; no zero counts are invented anywhere in this file.

## 4. How the proof works, without Lean

The engine has three parts. First, multiplicities add under products: working with the
"order of vanishing" as a value in the extended naturals (infinite for a locally-zero
function), the order of a finite product is the sum of the orders, and only *per-factor*
non-degeneracy is needed — this removes a hypothesis the two-factor predecessor had to
assume (article §5.2). Second, the assembly of §3: lower the constants, take the maximum
of the thresholds, add the ε-inequalities; the distinct-count regime instead iterates an
inclusion–exclusion identity D_{zw} = D_z + D_w − (count of common strip zeros) over the
family. Third, the n-ary defect transport: monotonicity alone does *not* close the
induction when a factor is added (the design erratum, §7 item 4); what closes it is a
Bonferroni-type finite-set inequality plus an off-diagonal growth lemma —
"superadditivity up to overlap" — yielding Theorem C's explicit defect term.

The instantiation side is bookkeeping about *donors*: the Dirichlet-column input (the 2/3
bound for primitive Dirichlet L-functions, uniform in the modulus) is proved in the zeta23
corpus and axiom-audited there — PROVED-UNCONDITIONAL **at donor pin** (proved inside that
corpus's own pinned toolchain, not this project's); the ζ-column endpoint over ℚ is
imported from the kernel-verified ZetaZerosV2 tree. The glue between the donor's window
conventions and this article's is formalized where needed, named where not.

## 5. What the main results say, informally

A **binder** is a hypothesis the formal theorem carries as an explicit assumption; the
kernel proof is complete relative to it; the article names, and does not discharge, it.

- **Theorem A (`zetaL_assembly_landed`, n+1-factor assembly).** If ζ_K has on-line
  proportion ≥ c₀ and every component has ≥ c i (multiplicity-counted, ε-form), under the
  structural set (analyticity off s = 1, finite vanishing order, the factorization stated
  as a hypothesis, window finiteness, constants), then ζ_L has proportion ≥ the weakest
  constant c*; the component proportions are the open binders. PROVED-CONDITIONAL. → §3,
  Thm A.
- **Theorem B (`zetaL_two_thirds_conditional`).** Same structural set; ζ_K column via the
  certificate slot at 1669159/2478195 (> 2/3) and every component at 2/3: at least 2/3 of
  ζ_L's zeros up to height T (with multiplicity) lie on the line, for all large T.
  PROVED-CONDITIONAL. → §3, Thm B.
- **Theorem B′ (`zetaL_two_thirds_landed_of_DZDF`, over ℚ).** For abelian L/ℚ, conditional
  on the quoted abelian factorization statement (verbatim from a donor corpus, never
  imported — its direct build fails at this project's pin), nonprincipality, the
  ray-class↔Dirichlet dictionary, per-primitive component proportions, two ζ↔f_K count
  identifications, the ζ column, and the structural set. PROVED-CONDITIONAL. → §3.3.
- **Theorem B″ (`zetaL_two_thirds_landed_ℚ`, the degenerate tower L = K = ℚ).** The
  ζ-column endpoint, conditional only on two classical structural binders (window
  finiteness, finite order); donor endpoint consumed by import. PROVED-CONDITIONAL. →
  §3.3.
- **Theorem U (the uniform ℚ-tower composition, `zetaL_two_thirds_uniform_of_thmE`).**
  For every abelian L/ℚ: at least (2/3 − ε) of ζ_L's zeros up to T, with multiplicity,
  lie on the critical line — the ONE composed statement (B′ instantiated at the
  Riemann zeta itself), conditional on the DZDF statement-binder trio (quoted, never
  imported), the classical structural set, the ζ-column binder, and the two
  per-primitive binders hUnbF (classical unboundedness of counts) and hEF (the zeta23
  donor endpoint, proved at its own pin). PROVED-CONDITIONAL. → article §3.3, Thm U.
- **Theorem U′ (`zetaL_two_thirds_uniform_ℚ`, the ζ column grounded — the article's
  strongest row).** The same composed statement with the ζ-column binder removed —
  discharged by the imported, kernel-verified ZetaZerosV2 endpoint (re-printed
  machine-checked on the same toolchain); the degenerate no-family instance recovers
  Theorem B″. PROVED-CONDITIONAL. → article §3.3, Thm U′.
- **Theorem C (`zetaL_assembly_distinct_defect_landed`).** The distinct regime with the
  defect carried: the distinct proportion of ζ_L is at least c* up to the explicit
  common-zero defect (base-vs-family plus each ordered component pair, each unordered pair
  counted twice). PROVED-CONDITIONAL. → article §3, Thm C.
- **Theorem D (`…_of_negligible`).** Under the additional binder that the summed defect is
  eventually negligible (conjecture-grade — an honest open hypothesis), the defect drops:
  ζ_L has the distinct proportion c* outright. PROVED-CONDITIONAL. → §3, Thm D.
- **Theorems E and E′.** The 5/6 instantiations: ζ_K column via the slot at
  1645064/1960733 (> 5/6) and components at 5/6; E′ replaces the certificate slot with the
  negligibility binder. PROVED-CONDITIONAL. → article §3, Thms E/E′.
- **Dirichlet-column input (`Zeta23.ThmE.thmE_A₀`, donor).** For every modulus q > 1 and
  every primitive Dirichlet character χ, the ≥ 2/3 on-line proportion holds — no analytic
  hypotheses within the donor. PROVED-UNCONDITIONAL — at donor pin. → §3.3.
- **Quadratic instance (article 42 v2, Thm 1).** The n = 2 case of the same schema, the ζ
  column already unconditional at this project's pin. PROVED-CONDITIONAL. → §3.3.
- **What is *not* here:** any component proportion for Hecke
  L-functions at a general base K — open everywhere the article looked (§7 item 1).

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| ζ_K, ζ_L | Dedekind zeta functions of number fields K, L | ζ_ℚ is the Riemann zeta |
| L(s, χ), F i | Hecke L-function of a character χ; the component indexed by i | the factors of ζ_L |
| abelian tower L/K | extension with commutative symmetry group | cyclotomic fields over ℚ |
| stripWindow, lineWindow | the counted sets: strip 0 < Re < 1 vs line Re = 1/2 | cumulative windows take T₁ = 0 |
| multOf f ρ, WindowFinite | order of vanishing of f at ρ (0 if not a zero); finitely many zeros per window | a double zero has mult 2 |
| N_f(T), N⁰_f(T) | zeros up to height T in the strip / on the line, with multiplicity | the two counts that add |
| D_f(T), commonStripCum | distinct strip zero count; strip points that are zeros of both z and w | the defect term |
| EpsLowerCum z c, EpsLowerDistinctStripCum | the ε-form (c − ε)·N ≤ N⁰ eventually; the same with the distinct count as numerator | the proportion statements |
| c*, ε, T₀ | the weakest component constant; the ε-slack; the height after which the bound holds | 2/3 in Theorem B |
| 1669159/2478195, 1645064/1960733 | certified ζ proportions: ≈ 0.6735 with multiplicity, ≈ 0.839 distinct | > 2/3 and > 5/6 |
| certificate slot, at donor pin | a hypothesis-shaped input quoting an external constant; proved in the donor corpus at its own pinned toolchain, audited there | `K673OfLayers`; the Dirichlet column |
| hUnbF, hEF | the two per-primitive binders of Thm U: classical count-unboundedness; the zeta23 donor endpoint | Thm U's inputs |
| Thm U, U′ | the uniform composition pair (U keeps the ζ-column binder; U′ grounds it via the V2 import) | the one composed statement |
| binder | named hypothesis the theorem carries; proof complete relative to it | hAK, hAF |
| PROVED-CONDITIONAL | kernel-proved relative to named, undischarged binders | Theorems A–E′, U, U′ |

## 7. What this is — and what it is not

- "Proportion" here is a deterministic counting statement about the zero set of one fixed
  function — a limiting fraction of zeros on a line — **not** a random-matrix statistic, a
  probability, or data analysis.
- "On-line" means *on the critical line* Re s = 1/2, not anything about networks or
  computing. A "Hecke L-function" is the factor attached to a character of the tower; over
  ℚ these are the classical Dirichlet L-functions.
- The theorems are conditional on **component proportions, not on GRH**: GRH would imply
  the components' proportions, but the hypothesis shape is deliberately different, and the
  comparison is hypothesis-shape to hypothesis-shape (article §4).
- "Assembly" is corollary-level counting bookkeeping, and the article says so: the claimed
  contribution is the statement class, the hypothesis schema, and the verified defect
  transport — not analytic difficulty.
- "Kernel-verified" means: every theorem was machine-checked by the Lean type checker
  against fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the full set
  used, with zero `sorry` and no donor imports except the two flagged routes.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract and §1.
- Formal statement → the status table at the article's head and §3; glossary (§6) open.
- Proof idea → §4 here, then article §5 (§5.1–§5.4).
- Verification → article §6; `research/pilots/75/{Pa,Pb}.lean` and `logs/`;
  the uniform-composition fire: `research/pilots/75/{N2-P4,N2-P4V2}.lean`,
  `logs/n2-p4v2-run3.log`.
- Novelty → article §4 (the DLRT and Bansal–Maji rows); what stays open → article §7.

## 9. What you need going in

- Complex numbers as points in a plane; a vertical line Re s = 1/2; "zeros of a function".
- Limits in the plain sense of "for every ε > 0 there is a threshold T₀" — no measure
  theory.
- Finite sums and minima; the ε-form is monotone in its constant and adds over sums. A
  "character" is just a symmetry label of the tower; what a Lean kernel check is (§7) and
  what a "binder" is (§5).
