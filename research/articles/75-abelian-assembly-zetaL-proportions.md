# Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower

*cross-math-fronttier research article 75 (Cycle 2) · FINAL (Cycle-2 scope; entry
milestone proved; the strip-distinct arm and the ℚ-instantiation carried to Iteration 4) ·
dossier `research/candidates/75-abelian-assembly-zetaL-proportions.md` (split out of
dossier 70, Part B) · spec `research/pilots/75-prework.md` · Lean `research/pilots/75/Pa.lean` ·
sibling articles `42-quadratic-dedekind-zeta-zero-proportions.md`,
`42M4-zetaK-proportions-unconditional-zeta-column.md`*

**Status: PROVED (entry milestone), FINAL for Cycle 2.** The n+1-factor assembly theorem
`zetaL_assembly_landed` and its 2/3 instantiation `zetaL_two_thirds_conditional` are
kernel-verified (run6-final: 0 errors, 0 sorry; every declaration's axioms are exactly
`[propext, Classical.choice, Quot.sound]`). The results are **conditional**: the
component zero-proportion inputs and the abelian factorization enter as named hypotheses.
Two planned extensions are not proved here and carry to Iteration 4: the 5/6
strip-distinct arm (P-b) and the partly unconditional instantiation over ℚ (N2).

---

## Abstract

Let L/K be an abelian extension of number fields. Class field theory factors the
Dedekind zeta function as ζ_L = ζ_K · ∏_χ L(s, χ), where χ runs over the nontrivial
characters of the relevant ray class group. AxiomMath's DedekindZetaZeroFree states this
factorization in Lean. Nothing uses it for zero counting. Pilot 42 (main run) showed that
critical-line zero proportions for a quadratic ζ_K follow from proportions for its two
factors ζ and L(s, χ_D) by an exact counting argument. We generalize that argument to any
finite number of factors and prove it in Lean. **Theorem A:** if ζ_K's zeros in the
critical strip have on-line proportion ≥ c₀ asymptotically, and each component L(s, χ_i)
has proportion ≥ c_i, then ζ_L has proportion ≥ min(c₀, min_i c_i). Here "proportion"
counts zeros with multiplicity in the cumulative window 0 < Im ρ ≤ T, as T → ∞. **Theorem
B** instantiates this at the classical constant 2/3. It takes the ζ_K input from
Knausgård's certified 0.6735… layer (a certificate hypothesis, as in article 42) and each
component input at 2/3 as a hypothesis. As far as we know, these are the first
zero-proportion statements for ζ_L, formal or informal, outside the quadratic case. The
mathematics is deliberately corollary-level: the analytic content sits entirely in the
component hypotheses. What the article contributes is the statement class, the
hypothesis schema, and a machine-checked proof that the schema closes. One hypothesis of
the 2-factor engine also disappears: the per-partial-product non-degeneracy condition
becomes derivable once order additivity is done in ℕ∞.

## 1. Introduction

**The question.** Lower bounds for the proportion of zeros of ζ(s) on the critical line
go back to Selberg (positive proportion), Levinson (> 1/3) and Conrey (> 2/5). Recent
work pushes past 2/3 for ζ: Lamzouri's theorem, formalized in AxiomMath's ZetaZerosV2,
gives ≥ 0.6725 simple and on the line. For a Dedekind zeta function the record is thin.
The nearest prior result we found is de Laat–Rolen–Tripp–Wagner (DLRT, arXiv:1908.04876, "Pair correlation for Dedekind zeta functions").
For a *fixed quadratic* K, assuming GRH, asymptotically in T, they show > 45% of zeros
are distinct, via semidefinite programming. They state nothing for critical-line
proportions of ζ_L with [L : ℚ] > 2, nothing unconditional, and nothing uniform in K
(novelty close-read: `novelty/round-4.md` P2-3).

**The observation.** When ζ_L factors as a product of entire (or, for ζ_K, meromorphic
with a single pole at s = 1) functions, the multiplicity of a zero ρ ≠ 1 of ζ_L is the sum
of the factors' multiplicities. Window zero counts therefore add, and so do on-line
counts. A proportion bound is a linear inequality between the two counts. So it passes
through finite sums when all summands share a constant, and through the minimum of the
constants in general. Pilot 42 did this for two factors (ζ_K = ζ · L(s, χ_D)). The
abelian tower needs it for n + 1 factors, with one factor (ζ_K) carrying a pole.

**Honesty.** The counting engine is pilot 42's (article 42). The new content is:

1. the n-ary statement class over an arbitrary finite index type ι;
2. the n-fold multiplicity factorization under per-factor hypotheses only (§4.2). Here
   the 2-factor engine's partial-product hypothesis is *derived*, not assumed;
3. the instantiation schema at 2/3, which names exactly which inputs are open.

The component inputs ("each L(s, χ_i) has ≥ 2/3 of its zeros on the line") are the open
core. No corpus, formal or informal, proves them for Hecke L-functions of a general base
field today.

## 2. Setting

All objects live in `research/pilots/75/Pa.lean`, which carries the full pilot-42 stack
(M1–M4a, 1,194 lines) followed by the new P-a layer (lines 1202–1541, about 363 new
lines).

- **Windows.** `stripWindow T₁ T₂ = {ρ | 0 < Re ρ < 1, T₁ < Im ρ ≤ T₂}` and
  `lineWindow T₁ T₂ = {ρ | Re ρ = 1/2, T₁ < Im ρ ≤ T₂}`. The cumulative windows take
  T₁ = 0.
- **Multiplicity.** `multOf f ρ := analyticOrderNatAt f ρ` (mathlib's order of
  vanishing, as a natural number).
- **Zero data.** `ZeroMult` packages a multiplicity function m : ℂ → ℕ with window
  finiteness: the support of m meets every `stripWindow` in a finite set.
  `countCum z T` = Σ of `z.mult` over the strip window (0, T]; `countOnCum z T` = the same
  sum over the line window.
- **Proportion statement.** `EpsLowerCum z c` :⟺ ∀ ε > 0, ∃ T₀, ∀ T ≥ T₀,
  (c − ε) · countCum z T ≤ countOnCum z T. This is the ε-form of
  liminf_{T→∞} N₀(T)/N(T) ≥ c with multiplicities.
- **n-ary sum.** `ZeroMult.addFin z` for z : ι → ZeroMult is the pointwise sum
  Σ_i (z i).mult. Its window finiteness follows from a finite union.

## 3. Main results

Let ι be a finite type. Let f_K, f_L : ℂ → ℂ and F : ι → ℂ → ℂ. Write N_f(T) and
N⁰_f(T) for the cumulative strip and line counts of `multOf f`.

**Theorem A (`zetaL_assembly_landed`, n+1-factor assembly).** Assume:

- (analyticity) f_K is analytic at every ρ ≠ 1; each F i is analytic everywhere;
- (non-degeneracy) `analyticOrderAt f_K ρ ≠ ⊤` for ρ ≠ 1, and `analyticOrderAt (F i) ρ ≠ ⊤`
  for all i, ρ (no factor vanishes identically near any point);
- (factorization) f_L(s) = (∏_i F i s) · f_K(s) for all s ≠ 1;
- (window finiteness) for f_K, f_L and every F i;
- (constants) c* ≤ c₀ and c* ≤ c i for all i;
- (component proportions) `EpsLowerCum (multOf f_K) c₀` and
  `EpsLowerCum (multOf (F i)) (c i)` for every i.

Then `EpsLowerCum (multOf f_L) c*`. That is, for every ε > 0, for all large T,
(c* − ε) N_{f_L}(T) ≤ N⁰_{f_L}(T).

**Theorem B (`zetaL_two_thirds_conditional`, the 2/3 landing).** Under the same
analyticity, non-degeneracy, factorization and finiteness hypotheses, assume also:

- a certificate proposition `cert`, together with `hK673 : cert → EpsLowerCum (multOf f_K)
  (1669159/2478195)`. This is Knausgård's certified constant 0.67355… > 2/3, carried as a
  certificate slot exactly as in article 42;
- for every i, `EpsLowerCum (multOf (F i)) (2/3)`.

Then `EpsLowerCum (multOf f_L) (2/3)`. At least two thirds of ζ_L's nontrivial zeros up
to height T (with multiplicity) lie on the critical line, for all large T.

**Supporting results (all proved).**
- `multOf_finprod`: multOf (∏_i g i) ρ = Σ_i multOf (g i) ρ, assuming each g i is
  analytic at ρ with `analyticOrderAt (g i) ρ ≠ ⊤`.
- `analyticOrderAt_finprod_ne_top`: the product is then non-degenerate at ρ as well.
- `multOf_of_abelFac`: the factorization hypothesis gives multOf f_L ρ = multOf f_K ρ +
  Σ_i multOf (F i) ρ for all ρ ≠ 1.
- `countCumOf_add_of_abFac`, `countOnCumOf_add_of_abFac`: N_{f_L} = N_{f_K} + Σ_i N_{F i},
  and the same for N⁰.
- `assemble_eps_cum_fin`: a shared constant c passes through `addFin`, including the
  empty family.
- `sum_inter_distrib_fin_mem`: the n-ary finite-sum splitting lemma underneath all of
  the above.

**Reading the theorems.** Take L/K abelian. Put f_K = ζ_K, f_L = ζ_L and F i = L(s, χ_i)
for the nontrivial ray-class characters χ_i. The factorization is the class-field-theory
identity, which DedekindZetaZeroFree states as `abelianFactorization`
(`AbelianRayCharacterFactorization.lean:62`). Each F i is entire because χ_i is
nontrivial. Theorem B then says: *2/3 for ζ_K plus 2/3 for each Hecke component gives
2/3 for ζ_L.* For K = ℚ this covers every abelian number field, including all cyclotomic
fields and their subfields.

## 4. Proofs

### 4.1 Counting

Let S be a window, and suppose c(ρ) = a(ρ) + Σ_i m_i(ρ) for ρ ∈ S, with supp a ∩ S,
supp m_i ∩ S and supp c ∩ S all finite. Let U = (supp a ∩ S) ∪ ⋃_i (supp m_i ∩ S), a
finite set. A point of supp c ∩ S where a and every m_i vanish would give c(ρ) = 0, a
contradiction, so supp c ∩ S ⊆ U. Hence Σ_{supp c∩S} c = Σ_U c = Σ_U a + Σ_i Σ_U m_i.
Each inner sum shrinks back to its own support, because the summand vanishes off the
support. This is `sum_inter_distrib_fin_mem`. With a ≡ 0 it gives
countCum(addFin z) = Σ_i countCum(z i), and likewise for the line counts.

### 4.2 Multiplicities of a finite product (the ℕ∞ route)

Work with `analyticOrderAt : ℂ → ℕ∞`, which allows the value ⊤ for a locally-zero
function. Induct on the finset, using mathlib's unconditional
`analyticOrderAt_mul` (analytic factors). This gives
ord_ρ(∏_{i∈s} g_i) = Σ_{i∈s} ord_ρ(g_i) in ℕ∞, with no finiteness hypothesis. Now assume
every ord_ρ(g_i) ≠ ⊤. A second induction shows the ℕ∞-sum is ≠ ⊤ and that `toNat`
commutes with it. Taking `toNat` once at the end gives `multOf_finprod`, and
`analyticOrderAt_finprod_ne_top` falls out of the same induction.

The 2-factor engine converts to ℕ after every multiplication. Iterating it would need a
hypothesis that each *partial product* is non-degenerate. Doing the arithmetic in ℕ∞
removes that hypothesis: per-factor non-degeneracy is enough.

For ρ ≠ 1, the factorization holds on a neighbourhood of ρ, since {s ≠ 1} is open.
`multOf` depends only on the germ (`multOf_congr`). Applying `multOf_mul` to
(∏_i F i) · f_K then gives `multOf_of_abelFac`.

### 4.3 Assembly

Every point of a strip or line window has 0 < Re ρ < 1, so ρ ≠ 1, and §4.2 applies
throughout the window. §4.1 gives N_{f_L}(T) = N_{f_K}(T) + Σ_i N_{F i}(T), and the same
for N⁰. Lower every constant to c* (monotonicity, `EpsLowerCum_mono`). Fix ε > 0 and take
T₀ = max of the component thresholds (a finite sup over ι, plus the f_K threshold). For
T ≥ T₀, sum the component inequalities (c* − ε) N_x(T) ≤ N⁰_x(T). This gives
(c* − ε) N_{f_L}(T) ≤ N⁰_{f_L}(T). If ι is empty, the family contributes zero counts and
the bound is trivial. In Lean the comparison runs through `EpsLowerCum_congr` against the
explicit `ZeroMult.add ⟨multOf f_K⟩ (addFin …)`. This proves Theorem A.

Theorem B is Theorem A with c* = c₀' = c_i = 2/3. The ζ_K input is lowered from
1669159/2478195 by `two_thirds_le_673`, a `norm_num` fact. ∎

## 5. Formal verification

- **File:** `research/pilots/75/Pa.lean`, 1,557 lines, 66 theorems in total: the carried
  pilot-42 stack plus 14 new P-a declarations, 11 public and 3 private. It imports only
  Mathlib, on mathlib `ff2494ea` with Lean v4.36.0-rc2. Every donor fact is a hypothesis
  binder. No DedekindZetaZeroFree, class field theory, zeta23 or ZetaZerosV2 import is
  needed.
- **Run:** `pilots/75/logs/run6-final.log`: rc = 0, 0 errors, 0 `sorry`. Error counts over
  six runs went 26 → 7 → 1 → 2 → 2 → 0.
- **Axioms:** the in-file `#print axioms` covers 17 declarations: the 14 P-a declarations
  plus 3 inherited M4a landings. Each reports exactly `[propext, Classical.choice,
  Quot.sound]`; no `sorryAx` appears. The file is also a target of the Cycle-2 final sweep
  (`AxPilot75_Pa`, `feasibility/VERIFICATION-LEDGER.md` §9).
- **Hypothesis inventory as landed:** it matches the design (prework §(b)) with one
  improvement. The partial-product non-degeneracy hypothesis of the design is gone,
  derived by §4.2.

## 6. Relation to prior work

- **Article 42 / 42-M4** (this project): the n = 1 case (ζ_K = ζ · L(s, χ_D)). Article
  42-M4 replaces the ζ-column certificate by ZetaZerosV2's unconditional Lamzouri
  endpoints. That replacement is what N2 would carry over to ζ_L for base K = ℚ.
- **DLRT (arXiv:1908.04876):** distinct zeros (> 45%) for a fixed quadratic K, under
  GRH, asymptotic in T. It is the nearest neighbour in statement shape, but different in
  kind: distinctness rather than on-line, a fixed quadratic field, and GRH-conditional.
- **DedekindZetaZeroFree (AxiomMath):** supplies the abelian factorization and
  zero-free regions. It has no counting results.
- **Liu (arXiv:2610.26835) and Cureton–Thorner:** half-plane nonvanishing for Hecke
  L-functions. These are location results, not proportions, and they do not compete with
  Theorems A–B.
- **Dossier 20** (this project): the "engine" route toward proving the component
  proportion hypotheses themselves. It is open.

## 7. Limitations and open problems

1. **The component hypotheses are the open core.** "≥ 2/3 of the zeros of L(s, χ) lie on
   the line" is not known for Hecke L-functions of a general base field. Theorem B is
   exactly as strong as its inputs.
2. **Window finiteness** of ζ_L, ζ_K and L(s, χ) is assumed, not derived. It follows
   classically from discreteness of zeros of a non-zero meromorphic function, but that
   glue is not formalized here.
3. **The ζ_K input** is certificate-conditional, through Knausgård's 0.6735 layer as in
   article 42. Over K = ℚ it can be discharged unconditionally from ZetaZerosV2. That is
   the N2 milestone, carried to Iteration 4 together with the Dirichlet ↔ ray-class
   dictionary it needs.
4. **Strip-distinct 5/6 (P-b):** the defect-form and negligibility-form distinctness
   statements over the tower. They are designed in `pilots/75/Pb-design.md` (about
   +0.2–0.3k lines) and not proved here. The negligibility form inherits the
   conjecture-grade status of the common-zero hypothesis (`pilots/20-hCZ-NOTE.md`).
5. **No per-field uniformity:** all statements are asymptotic in T for a fixed tower.
   Nothing is uniform over discriminants.

## References

- Pilot files: `research/pilots/75/Pa.lean` (lines 1202–1541 new; the declarations
  named in §3), `pilots/75/logs/run6-final.log`, `pilots/75-prework.md`,
  `pilots/75/Pb-design.md`.
- Pilot-42 stack: `research/pilots/42/{M1,M2a,M3,M2b,M4a,M4b}.lean`; articles 42 and 42-M4.
- AxiomMath DedekindZetaZeroFree: `EntireAbelianQuotient.lean:13`
  (`dedekindAbelianQuotient`), `AbelianRayCharacterFactorization.lean:62`
  (`abelianFactorization`). AxiomMath ZetaZerosV2: `ZetaZeros/Main.lean:47,88`.
- D. de Laat, L. Rolen, Z. Tripp, I. Wagner, arXiv:1908.04876 (scope as corrected in `novelty/round-4.md` P2-3); Y. Lamzouri,
  arXiv:2609.02882; Liu, arXiv:2610.26835.
- Novelty: `research/novelty/VERDICTS.md` (Cycle-2 row 75),
  `research/novelty/axiommath-as-donor.md` §(f).
