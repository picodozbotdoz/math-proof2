# Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower — Two Tiers, Conditional on Component Proportions

*kind: DISCOVERY-CONDITIONAL · date: 2026-11-17 (v2; v1 2026-11-16, Cycle-2 original
2026-11-14) · supersedes: the v1 text of this same file (in-place revision; change log
in §0) · artifacts: `research/pilots/75/Pa.lean`, `research/pilots/75/Pb.lean`,
`research/pilots/75/logs/run6-final.log`, `research/pilots/75/logs/pb-run11-final.log`,
`research/pilots/75/logs/pb-run12-auditfix.log`, `research/pilots/zeta23e/P0.lean`,
`research/pilots/zeta23e/logs/zeta23e-p0-run1.log`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm A `zetaL_assembly_landed` (`Pa.lean:1473`) | PROVED-CONDITIONAL | structural: hK/hF (analyticity), hntopK/hntopF (finite order), hAbFac (factorization mirror), hfinK/hfinL/hfinF (window finiteness), hcK/hcF (constants); open core: hAK/hAF (component on-line proportions) | `pilots/75/logs/run6-final.log:31` — triad; re-print `pilots/75/logs/pb-run12-auditfix.log:33` |
| Thm B `zetaL_two_thirds_conditional` (`Pa.lean:1525`) | PROVED-CONDITIONAL | idem + hCert + hK673 (ζ_K column via the Knausgård 1669159/2478195 ≥ 2/3 certificate slot); hAF at 2/3 | `run6-final.log:32` — triad; re-print `pb-run12-auditfix.log:34` |
| Thm C `zetaL_assembly_distinct_defect_landed` (`Pb.lean:2144`) | PROVED-CONDITIONAL | structural tier as Thm A; open core: hAKd/hAFd (component strip-distinct proportions) | `pb-run11-final.log:50` — triad; `pb-run12-auditfix.log:52` |
| Thm D `zetaL_assembly_distinct_landed_of_negligible` (`Pb.lean:2191`) | PROVED-CONDITIONAL | idem + hCZStripFam (summed common-strip-defect negligibility; conjecture-grade binder) | `pb-run11-final.log:51` — triad (wrapped); `pb-run12-auditfix.log:53` |
| Thm E `zetaL_distinct_five_sixths_strip_conditional` (`Pb.lean:2229`) | PROVED-CONDITIONAL | idem + hCert + hK839 (ζ_K column via the Knausgård 1645064/1960733 ≥ 5/6 certificate slot); hAFd at 5/6 | `pb-run11-final.log:52` — triad (wrapped); `pb-run12-auditfix.log:54` |
| Thm E′ `zetaL_distinct_five_sixths_strip_conditional_of_negligible` (`Pb.lean:2255`) | PROVED-CONDITIONAL | idem + hCZStripFam | `pb-run11-final.log:53` — triad (wrapped); `pb-run12-auditfix.log:55` |
| Dirichlet-column input `Zeta23.ThmE.thmE_A₀` (donor; zeta23 `Zeta23/ThmE/Final.lean:93`) | PROVED-UNCONDITIONAL — at donor pin (Lean v4.33.0-rc2, mathlib `51e6992e`) | scope only: `1 < q`, `χ.IsPrimitive` | `pilots/zeta23e/logs/zeta23e-p0-run1.log:190` (repeat `:203`) — triad; transitive Theorem-E chain audit five-of-five triad, 0 sorryAx (`:15–18`) |
| Quadratic instance `zetaK_two_thirds_landed_of_V2` (article 42 v2 Thm 1; `pilots/42/M4b.lean:1479`) | PROVED-CONDITIONAL | structural set H + hEχ (the χ-column 2/3 binder — the one analytic binder; its content is `thmE_A₀` above, now audited) | `pilots/42/logs/m4b2-axcheck-run1.log:139` — triad |

All Lean-backed rows except the donor row elaborate on the project pin (mathlib
`ff2494ea`, Lean v4.36.0-rc2), axioms exactly
`[propext, Classical.choice, Quot.sound]`, zero `sorry`/`sorryAx`, zero donor imports
(`import Mathlib` only, `Pb.lean:51`; `hAbFac` is the statement-quoted mirror of the
factorization, never an import).

## 0. Change log (v2, 2026-11-17)

v1 (2026-11-16; Cycle-2 original 2026-11-14) stated the with-multiplicity tier only and
listed the 5/6 arm as "carried". This revision, in place:

1. **Two-tier structure per the iteration-4 charter.** Tier 1 (with multiplicity, 2/3:
   Theorems A–B); tier 2 (strip-distinct, 5/6: Theorems C–E′, landed 2026-11-16); the
   quadratic-ζ_K instance with its zero-analytic-binders accounting as the third tier
   (§3.3).
2. **Dirichlet-column discharge audited (tier-1 news).** zeta23's Theorem E endpoint
   `thmE_A₀` built and transitively axiom-audited at the donor pin; the χ-column 2/3
   binder of Theorem B over K = ℚ is dischargeable by donor name; the binder-port shape
   elaborates in the donor tree (`zeta23e-p0-run1.log`). The unconditional-at-ℚ theorem
   itself is **not yet proved** — the remaining glue is named in §3.3 and §7.
3. Status rows rewritten in the closed four-string vocabulary with verbatim binder
   lists; v1's house-dialect status lines ("PROVED (entry milestone)") removed.
4. Per-theorem verification blocks (§6) replace v1's run-history narration; counts are
   extractor-generated where the record chain provides them, and not-yet-computed
   fields are marked PENDING-CLOSE with an owner.
5. Nearest-miss table (§4, 5 rows) replaces v1's prose-only comparison; the DLRT
   citation carries the corrected scope qualifiers (GRH-conditional, fixed quadratic).
6. The 5/6 arm's design erratum (E4) and the first final log's print-coverage gap are
   recorded in §7 with their dated corrections.
7. Section order fixed to the template skeleton.

## Abstract

Let L/K be an abelian extension of number fields; class field theory factors
ζ_L = ζ_K · ∏_χ L(s, χ). We prove in Lean an assembly schema: if ζ_K and every component
L(s, χ_i) have on-line zero proportion at least c₀ and c_i (multiplicity-counted,
cumulative windows), then ζ_L has proportion at least min(c₀, min_i c_i) (Theorem A,
PROVED-CONDITIONAL — the component proportions are named open hypotheses); at 2/3,
Theorem B. Tier two (Theorems C–E′, PROVED-CONDITIONAL) is the 5/6 strip-distinct arm
with an explicit common-zero defect. Over K = ℚ, tier one's analytic core is discharged
on the Dirichlet side: zeta23's audited Theorem E gives 2/3 for every primitive
Dirichlet L-function (PROVED-UNCONDITIONAL at the donor pin); named glue remains before
ζ_L itself is unconditional at ℚ. Within the corpora and literature surveyed, these are
the first zero-proportion statements for ζ_L outside the quadratic case; the nearest
informal results are de Laat–Rolen–Tripp–Wagner's GRH-conditional distinct-zero
proportion for a fixed quadratic field and Bansal–Maji's Hardy-type on-line infinitude
for every number field. The mathematics is corollary-level; the contribution is the
statement class, the hypothesis schema, and its verified closure — including a
Bonferroni-type defect transport for the distinct tier.

## 1. Introduction

**The question.** Lower bounds for the proportion of zeros of ζ(s) on the critical line
go back to Selberg (positive proportion), Levinson (> 1/3) and Conrey (> 2/5). Recent
work pushes past 2/3 for ζ: Lamzouri's theorem, formalized in AxiomMath's ZetaZerosV2,
gives ≥ 0.6725 simple and on the line; Knausgård's certified constants reach
≈ 0.6735 with multiplicity (exactly 1669159/2478195) and ≈ 0.839 distinct (exactly
1645064/1960733). For a Dedekind zeta function the
record is thin. The nearest prior result we found is de Laat–Rolen–Tripp–Wagner
(DLRT, arXiv:1908.04876): for a *fixed quadratic* K, *assuming GRH*, asymptotically in
T, more than 45% of zeros are *distinct* (Thm 1.1 is the fixed-abelian-K, GRH-conditional
o_K(1) statement; Cor 1.3(i) the fixed-quadratic one). They state nothing for
critical-line proportions of ζ_L with [L : ℚ] > 2, nothing unconditional, and nothing
uniform in K. Beyond DLRT, the unconditional on-line *infinitude* of Bansal–Maji
(arXiv:2507.18121) holds for ζ_F of *any* number field F — infinitude, not proportion.

**The observation.** When ζ_L factors as a product of entire (or, for ζ_K, meromorphic
with a single pole at s = 1) functions, the multiplicity of a zero ρ ≠ 1 of ζ_L is the
sum of the factors' multiplicities. Window zero counts therefore add, and so do on-line
counts. A proportion bound is a linear inequality between the two counts, so it passes
through finite sums when all summands share a constant, and through the minimum of the
constants in general. Pilot 42 (article 42) did this for two factors
(ζ_K = ζ · L(s, χ_D)); the abelian tower needs n + 1 factors, with one factor (ζ_K)
carrying a pole, and — for the distinct tier — a Bonferroni-type control of the
pairwise common-zero defects.

**Honesty.** The two-factor counting engine is article 42's; it is not claimed here.
The new content is:

1. the n-ary statement class over an arbitrary finite index type ι (both tiers);
2. the n-fold multiplicity factorization under per-factor hypotheses only (§5.2) — the
   2-factor engine's partial-product non-degeneracy hypothesis is *derived*, not
   assumed;
3. the distinct tier's n-ary defect transport: the ordered-pair defect inequality closes
   by superadditivity-up-to-overlap (an abstract Finset Bonferroni inequality plus an
   off-diagonal growth lemma), not by monotonicity (§5.3; the design erratum is
   recorded in §7);
4. the instantiation schemas at 2/3 and 5/6, which name exactly which inputs are open;
5. the discharge accounting (§3.3): over K = ℚ, every *analytic* input of the 2/3 tier
   is now kernel-proved somewhere (ζ column on our pin, Dirichlet column at the zeta23
   donor pin, audited); what remains between the schema and an unconditional ζ_L
   theorem is named glue, not an analytic unknown.

The component inputs at a general base ("each L(s, χ_i) has ≥ 2/3 of its zeros on the
line") remain the open core: no corpus, formal or informal, proves them for Hecke
L-functions of a general base field.

## 2. Setting and notation

All objects live in `research/pilots/75/Pa.lean` (tier 1) and
`research/pilots/75/Pb.lean` (tier 2; carries `Pa.lean` verbatim below its `## P-b
layer` banner — the self-contained-file convention; `import Mathlib` only, `Pb.lean:51`).

- **Windows.** `stripWindow T₁ T₂ = {ρ | 0 < Re ρ < 1, T₁ < Im ρ ≤ T₂}` and
  `lineWindow T₁ T₂ = {ρ | Re ρ = 1/2, T₁ < Im ρ ≤ T₂}`; cumulative windows take T₁ = 0.
- **Multiplicity.** `multOf f ρ := analyticOrderNatAt f ρ` (mathlib's order of
  vanishing, as a natural number).
- **Zero data.** `ZeroMult` packages a multiplicity function m : ℂ → ℕ with window
  finiteness (`WindowFinite`: the support meets every strip window in a finite set).
  `countCum z T` sums `z.mult` over the strip window (0, T]; `countOnCum z T` over the
  line window; `distinctCountCum z T` counts *distinct* strip zeros up to T;
  `commonStripCum z w T` counts strip points that are zeros of both z and w.
- **Proportion statements.** `EpsLowerCum z c` :⟺ ∀ ε > 0, ∃ T₀, ∀ T ≥ T₀,
  (c − ε) · countCum z T ≤ countOnCum z T — the ε-form of
  liminf_{T→∞} N⁰(T)/N(T) ≥ c with multiplicities. `EpsLowerDistinctStripCum z c` is
  the analogous form with the distinct count as numerator.
- **n-ary sum.** `ZeroMult.addFin z` for z : ι → ZeroMult is the pointwise sum
  Σ_i (z i).mult; `ZeroMult.addFinOver` (`Pb.lean`) restricts to a Finset of indices.
- **Certificate slots.** `K673OfLayers hyps z := hyps → EpsLowerCum z (1669159/2478195)`
  (`Pa.lean:911`); `K839OfLocalStrip hyps z := hyps → EpsLowerDistinctStripCum z
  (1645064/1960733)` (`Pb.lean:935`). The numerals are Knausgård's certified constants
  (exactly the rationals shown, ≈ 0.6735 and ≈ 0.839); the slot's `hyps` is an opaque
  certificate proposition, exactly
  as in article 42 v1 — a *conditional* ζ_K-column route (the unconditional route is
  the ZetaZerosV2 import of article 42 v2; see §3.3).
- **Donor statements (never imported; quoted).** The factorization is
  AxiomMath DedekindZetaZeroFree's `abelianFactorization`
  (`AbelianRayCharacterFactorization.lean:62`): for abelian Galois L/K there exist
  moduli and nonprincipal ray-class characters χ_i with
  ζ_L(s) = (∏_i Σ′_I χ_i(I) N(I)^{−s}) · ζ_K(s) for Re s > 1. The Dirichlet-column
  endpoint is zeta23's `thmE_A₀` (quoted verbatim in §3.3).

## 3. Main results

Let ι be a finite type. Let f_K, f_L : ℂ → ℂ and F : ι → ℂ → ℂ. Write N_f(T) and
N⁰_f(T) for the cumulative strip and line counts of `multOf f`, D_f(T) for the
cumulative distinct strip count.

### 3.1 Tier 1 — with multiplicity

**Theorem A (`zetaL_assembly_landed`, n+1-factor assembly; `Pa.lean:1473`).** Assume:

- (analyticity) `hK`: f_K analytic at every ρ ≠ 1; `hF`: each F i analytic everywhere;
- (finite order) `hntopK`/`hntopF`: `analyticOrderAt f_K ρ ≠ ⊤` for ρ ≠ 1 and
  `analyticOrderAt (F i) ρ ≠ ⊤` for all i, ρ;
- (factorization) `hAbFac`: f_L(s) = (∏_i F i s) · f_K(s) for all s ≠ 1;
- (window finiteness) `hfinK`/`hfinL`/`hfinF` for f_K, f_L and every F i;
- (constants) `hcK`: c* ≤ c₀ and `hcF`: c* ≤ c i for all i;
- (component proportions) `hAK`: `EpsLowerCum ⟨multOf f_K, hfinK⟩ c₀` and
  `hAF`: `EpsLowerCum ⟨multOf (F i), hfinF i⟩ (c i)` for every i.

Then `EpsLowerCum ⟨multOf f_L, hfinL⟩ c*`: for every ε > 0, for all large T,
(c* − ε) N_{f_L}(T) ≤ N⁰_{f_L}(T).

**Theorem B (`zetaL_two_thirds_conditional`, the 2/3 landing; `Pa.lean:1525`).** Under
the same analyticity, finite-order, factorization and finiteness hypotheses, assume
also `hCert : cert` and `hK673 : K673OfLayers cert ⟨multOf f_K, hfinK⟩` (the ζ_K column
at Knausgård's 1669159/2478195 > 2/3), and `hAF`: for every i,
`EpsLowerCum ⟨multOf (F i), hfinF i⟩ (2/3)`. Then
`EpsLowerCum ⟨multOf f_L, hfinL⟩ (2/3)`: at least two thirds of ζ_L's nontrivial zeros
up to height T (with multiplicity) lie on the critical line, for all large T.

### 3.2 Tier 2 — strip-distinct, 5/6

**Theorem C (`zetaL_assembly_distinct_defect_landed`, n-fold defect form;
`Pb.lean:2144`).** Under the structural tier of Theorem A (hK, hF, hntopK, hntopF,
hAbFac, hfinK, hfinL, hfinF, hcK, hcF) assume the component *strip-distinct*
proportions `hAKd : EpsLowerDistinctStripCum ⟨multOf f_K, hfinK⟩ c₀` and
`hAFd : ∀ i, EpsLowerDistinctStripCum ⟨multOf (F i), hfinF i⟩ (c i)`. Then for every
ε > 0, for all large T,

  (c* − ε) · N_{f_L}(T) ≤ D_{f_L}(T) + commonStrip(f_K, ∐_i F i)(T)
    + Σ_{p ∈ offDiag} commonStrip(F p.1, F p.2)(T),

the defect being the ζ_K-vs-family common-strip count plus the ordered-pair family
defect (each unordered pair counted twice).

**Theorem D (`zetaL_assembly_distinct_landed_of_negligible`; `Pb.lean:2191`).** Assume
Theorem C's hypotheses and additionally `hCZStripFam`: for every ε > 0, eventually the
summed defect of Theorem C is ≤ ε · N_{f_L}(T). Then
`EpsLowerDistinctStripCum ⟨multOf f_L, hfinL⟩ c*`.

**Theorem E (`zetaL_distinct_five_sixths_strip_conditional`; `Pb.lean:2229`) and
E′ (`…_of_negligible`; `Pb.lean:2255`).** The 5/6 instantiations: ζ_K column via
`hCert` + `hK839 : K839OfLocalStrip cert ⟨multOf f_K, hfinK⟩` (Knausgård
1645064/1960733 > 5/6), family components at 5/6 binders (`hAFd` at 5/6); conclusions
as in Theorems C and D at c* = 5/6. These are article 42's two quadratic distinct
landings one degree up the tower.

**Reading the theorems.** Take L/K abelian. Put f_K = ζ_K, f_L = ζ_L and F i = L(s, χ_i)
for the nontrivial ray-class characters of the factorization; each F i is entire by
nonprincipality. Theorem B then says: *2/3 for ζ_K plus 2/3 for each Hecke component
gives 2/3 for ζ_L*; Theorem E′ says the 5/6 distinct analogue under the negligibility
binder. For K = ℚ this covers every abelian number field, including all cyclotomic
fields and their subfields.

### 3.3 Discharge accounting — what is open and what is not

**The Dirichlet column over K = ℚ (audited this cycle).** For abelian L/ℚ the
components F i are Dirichlet L-functions. zeta23's Theorem E endpoint, verbatim
(`Zeta23/ThmE/Final.lean:93`):

```
theorem thmE_A₀ (hq : 1 < q) (hprim : χ.IsPrimitive) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (2 / 3 - ε) * (NcountL χ T (2 * T) : ℝ) ≤ N0starL χ T (2 * T)
```

— uniform over every primitive Dirichlet character χ mod q > 1, unconditional within
the donor. The 144-file pruned `Zeta23.ThmE.Final` closure was built at the donor pin
(Lean v4.33.0-rc2, mathlib `51e6992e`); the transitive audit prints the full chain
(`thmE_A₀`, `thmE_B₀`, `thmE_C₀`, `paperInputsChi_L`, `thmE_A`) all exactly
`[propext, Classical.choice, Quot.sound]`, with 0 `sorryAx` in the built closure
(`zeta23e-p0-run1.log:15–18`, prints `:190–194`). The binder-port shape — the donor's
conclusion quoted verbatim as an explicit hypothesis — elaborates in the donor tree
(`hex_two_thirds_binder_port`, `pilots/zeta23e/P0.lean:54`; a probe-convention
declaration, never cited as a result). Two convention deltas separate the donor
statement from Theorem B's `hAF` binder, both in the safe direction or routine:
(a) the donor's numerator counts *distinct* on-line zeros, the binder's
with-multiplicity — distinct ≤ with-multiplicity, so the donor bound implies the binder
a fortiori; (b) the donor window is dyadic (T, 2T], the binder's cumulative (0, T] —
conversion sums the inequality over the O(log T) dyadic blocks and absorbs the initial
segment (the pattern zeta23 itself uses for ζ). Neither piece of glue is formalized
here. Consequence, in the record's words: the χ-column 2/3 binder of Theorem B (over
ℚ) *is dischargeable at the donor pin by donor name*; on-pin consumers keep the binder
until an on-pin port, then gain supersession rows, not edits.

**The ζ columns.** Over ℚ, f_K = ζ: the ζ column is discharged unconditionally on the
project pin by the ZetaZerosV2 import (article 42 v2, Thm 1's `V2d4_endpoint` route).
At a general base K, Theorems B and E use the Knausgård certificate slots (§2) — the
stronger constants, tool-conditional route.

**What remains for an unconditional ζ_L ≥ 2/3 at ℚ (not proved here).** Two named
pieces: (i) the ℚ ray-class ↔ Dirichlet-character dictionary with L-series
identification (including imprimitivity: an imprimitive L differs from its primitive
associate by finitely many Euler factors whose zeros lie on Re s = 0, outside the
critical strip, so window counts are unaffected) — absent from every surveyed corpus;
(ii) the factorization binder `hAbFac` for K = ℚ, to be consumed as a statement-binder
from DedekindZetaZeroFree's `abelianFactorization` (its direct build is dead at our
pin). With (i)–(ii) and the audited Dirichlet column, Theorem B instantiated over ℚ
would be unconditional except for its structural set (window finiteness, analyticity) —
each a named classical fact. This is the article's carried completion, not a claim.

**The quadratic instance (third tier).** Article 42 v2's Theorem 1
(`zetaK_two_thirds_landed_of_V2`, `M4b.lean:1479`) is the n = 2 case of the schema with
the ζ column already unconditional on our pin and `hEχ` — whose content is `thmE_A₀`
above — as its one analytic binder. The donor-pin audit therefore reduces the
quadratic case to *zero analytic open binders*, pending the same port glue; it is
billed there, not re-proved here.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876, Thm 1.1 / Cor 1.3(i) | for a *fixed* (quadratic) K, *under GRH*, as T → ∞: > 45% of zeros are *distinct* (SDP method) | ours: on-line proportions with multiplicity (Thm B) and 5/6-class distinct up to an explicit defect (Thm E) for *every* abelian L/K; hypothesis shape is component-proportion binders, not GRH; comparison is hypothesis-shape-to-hypothesis-shape (their GRH binder vs our component binders) |
| Bansal–Maji, arXiv:2507.18121 (v1 2025-07-24) | via a number-field Jacobi-theta relation, *infinitely many* nontrivial zeros of ζ_F on Re s = 1/2 for *any* number field F — Hardy-type, unconditional at abstract level | infinitude, not proportion: an infinitude theorem cannot feed Thm A's component-proportion hypotheses; no multiplicity or distinct statements, no constants |
| Lamzouri arXiv:2609.02882 / AxiomMath ZetaZerosV2 (`ZetaZeros/Main.lean:130,149`) | ζ-only proportions: > 0.6725 simple on-line, > 0.83625 distinct (kernel-verified) | the ζ column only, imported there; no product, no ζ_K or ζ_L statement |
| Knausgård arXiv:2609.33043, arXiv:2610.08965 | ζ constants ≈ 0.6735 with multiplicity (exactly 1669159/2478195) and ≈ 0.839 distinct (exactly 1645064/1960733), behind an externally checked certificate layer (author-disclosed extra axioms, one per inequality) | our ζ_K-column certificate slots quote these constants as binders; stronger constants, tool-conditional route (see §2) |
| article 42 v2 (this project, 2026-11-16) | the n = 2 instances with the ζ column discharged unconditionally (ZetaZerosV2 import) | Thms A–E′ here are the n+1-factor generalization over an arbitrary finite family; 42's Thm 1 is this schema's quadratic instance (§3.3) |

Scope statement. "First zero-proportion statements for ζ_L outside the quadratic case"
means first among the corpora surveyed (mathlib, tauceti, the AxiomMath repositories,
openai-math, anthropics/zeta23) and the informal literature searched (arXiv queries
recorded in the project's novelty records; DLRT scope re-confirmed 2026-11-16). The
assembly mathematics is corollary-level; the claim is about the statement class, not
the difficulty.

## 5. Proofs

### 5.1 Counting

Let S be a window and suppose c(ρ) = a(ρ) + Σ_i m_i(ρ) on S, with all supports finite
in S. A point of supp c ∩ S where a and every m_i vanish would give c(ρ) = 0; hence
supp c ∩ S ⊆ (supp a ∩ S) ∪ ⋃_i (supp m_i ∩ S), and
Σ_{supp c∩S} c = Σ a + Σ_i Σ m_i, each inner sum shrinking to its own support
(`sum_inter_distrib_fin_mem`). With a ≡ 0 this gives
countCum(addFin z) = Σ_i countCum(z i), and likewise for the line counts.

### 5.2 Multiplicities of a finite product (the ℕ∞ route)

Work with `analyticOrderAt : ℂ → ℕ∞`, which takes the value ⊤ for a locally-zero
function. Induct on the finset with mathlib's unconditional `analyticOrderAt_mul`
(analytic factors): ord_ρ(∏_{i∈s} g_i) = Σ_{i∈s} ord_ρ(g_i) in ℕ∞, no finiteness
hypothesis. Assuming every ord_ρ(g_i) ≠ ⊤, a second induction shows the ℕ∞-sum is ≠ ⊤
and that `toNat` commutes with it; taking `toNat` once at the end gives
`multOf_finprod` and `analyticOrderAt_finprod_ne_top`. The 2-factor engine converts to
ℕ after every multiplication; iterating it would need each *partial product*
non-degenerate. Doing the arithmetic in ℕ∞ removes that hypothesis: per-factor
non-degeneracy suffices — Theorem A's binder list is one hypothesis shorter than
designed. For ρ ≠ 1 the factorization holds on a neighbourhood ({s ≠ 1} is open),
`multOf` depends only on the germ, and `multOf_mul` applied to (∏_i F i) · f_K gives
`multOf_of_abelFac`: multOf f_L ρ = multOf f_K ρ + Σ_i multOf (F i) ρ.

### 5.3 The distinct tier (Bonferroni transport)

Distinct strip counts satisfy, for two factors, the inclusion–exclusion identity
D_{zw} = D_z + D_w − commonStrip(z, w) (article 42's M4a engine, carried). For a
family, the defect of an n-ary sum is controlled by iterating: sub-family aggregation
(`ZeroMult.addFinOver`), monotonicity and binary sub-additivity of `commonStripCum`,
and the union–intersection bound give the growth of the defect when a factor is added.
The load-bearing step is *superadditivity-up-to-overlap*, realized as the abstract
two-level Finset Bonferroni inequality (`bonferroni_union_le`, `Pb.lean:1873`;
exposed public at the audit fix) plus an off-diagonal growth lemma (`offDiag_cons_ge`,
`Pb.lean:1797`): monotonicity alone does **not** close the cons-step (the design
erratum, §7). The ordered-pair `Finset.offDiag` convention needs no linear order on ι;
the factor 2 is absorbed at the negligibility stage. Combining with the n-ary distinct
identification `distinctCountCum_of_abelFac` and the ε-wiring
`assemble_eps_defect_strip_cum_fin` proves Theorem C; Theorem D splits δ = δ/2 + δ/2
and absorbs the defect with hCZStripFam (`nlinarith` on the nonnegative count-cast).
Theorems E/E′ instantiate at 5/6 via `five_sixths_le_839` (`Pb.lean`, carried from
`Pa.lean:904`) and `EpsLowerDistinctStripCum_mono`.

### 5.4 Assembly (tier 1)

Every point of a strip or line window has Re ρ ∈ (0, 1), so ρ ≠ 1 and §5.2 applies
throughout; §5.1 gives N_{f_L} = N_{f_K} + Σ_i N_{F i} and the same for N⁰. Lower every
constant to c* (monotonicity), fix ε > 0, take T₀ the maximum of the component
thresholds (finite sup over ι), and sum the component inequalities. In Lean the
comparison runs through `EpsLowerCum_congr` against
`ZeroMult.add ⟨multOf f_K, …⟩ (addFin …)`; the empty family is trivial. Theorem B is
Theorem A with c* = c₀′ = c_i = 2/3, the ζ_K input lowered from 1669159/2478195 by
`two_thirds_le_673` (`Pa.lean:902`, `norm_num`). ∎

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm A | `CrossMath.Pilot75.zetaL_assembly_landed` | `research/pilots/75/Pa.lean:1473` | ⊆ triad | `pilots/75/logs/run6-final.log:31`; re-print `pb-run12-auditfix.log:33` |
| Thm B | `CrossMath.Pilot75.zetaL_two_thirds_conditional` | `Pa.lean:1525` | ⊆ triad | `run6-final.log:32`; re-print `pb-run12-auditfix.log:34` |
| Thm C | `CrossMath.Pilot75.zetaL_assembly_distinct_defect_landed` | `research/pilots/75/Pb.lean:2144` | ⊆ triad | `pb-run11-final.log:50`; `pb-run12-auditfix.log:52` |
| Thm D | `CrossMath.Pilot75.zetaL_assembly_distinct_landed_of_negligible` | `Pb.lean:2191` | ⊆ triad | `pb-run11-final.log:51`; `pb-run12-auditfix.log:53` |
| Thm E | `CrossMath.Pilot75.zetaL_distinct_five_sixths_strip_conditional` | `Pb.lean:2229` | ⊆ triad | `pb-run11-final.log:52`; `pb-run12-auditfix.log:54` |
| Thm E′ | `CrossMath.Pilot75.zetaL_distinct_five_sixths_strip_conditional_of_negligible` | `Pb.lean:2255` | ⊆ triad | `pb-run11-final.log:53`; `pb-run12-auditfix.log:55` |
| Dirichlet column (donor) | `Zeta23.ThmE.thmE_A₀` | zeta23 `Zeta23/ThmE/Final.lean:93` | ⊆ triad | `pilots/zeta23e/logs/zeta23e-p0-run1.log:190` (repeat `:203`) |
| Quadratic instance | `CrossMath.Pilot42.zetaK_two_thirds_landed_of_V2` | `research/pilots/42/M4b.lean:1479` | ⊆ triad | `pilots/42/logs/m4b2-axcheck-run1.log:139` |

"⊆ triad" = exactly `[propext, Classical.choice, Quot.sound]` at the cited print.
Per-theorem verification blocks (binder inventories, coverage, substrate) follow.

Substrate for all rows except the donor row: mathlib `ff2494ea` @ Lean v4.36.0-rc2,
`import Mathlib` only. Extractor-generated counts per the verification-tables census
(`qa/iter4-review/r3-verification-tables.md` §10.4): `Pb.lean` 89 declarations (79
public + 10 private at the audited bytes; the three named helpers of §5.3 were exposed
public at the 2026-11-17 audit fix, count unchanged), `Pa.lean` carried verbatim inside
it (1,557 lines; 68 declarations = 65 public + 3 private, per the same census);
`Pb.lean` 2,302 LoC at the audit-fix run header (2,303 lines by `wc -l` on the
2026-11-17 tree — final-newline convention). sha256 of the audited `Pb.lean` bytes:
`b9ad881689927936…` (16-hex prefix, census §10.4); **sha256 at the final sweep [the
close-out re-verification pass that hash-stamps the staged files] of the current
bytes: PENDING-CLOSE — owner H**; `Pa.lean`/`P0.lean` likewise.

### Verification: Theorem A — `CrossMath.Pilot75.zetaL_assembly_landed`
- file: `research/pilots/75/Pa.lean:1473–1518` (carried verbatim in `Pb.lean`)
- exact statement form: binders verbatim as listed in §3.1
- binder inventory: hK/hF/hntopK/hntopF structural (well-formedness); hAbFac = the
  statement-quoted mirror of DZDF `abelianFactorization`
  (`AbelianRayCharacterFactorization.lean:62` — donor statement, never imported);
  hfinK/hfinL/hfinF structural (window finiteness); hcK/hcF parameters of the statement
  class; hAK/hAF the open core (component proportions — parameters no donor supplies at
  general base)
- substrate: mathlib `ff2494ea` / Lean v4.36.0-rc2
- evidence: elaboration `run6-final.log:6` (GREEN rc=0, 0 errors, 0 sorry); axioms
  `run6-final.log:31` — `[propext, Classical.choice, Quot.sound]`; re-print
  `pb-run12-auditfix.log:33`; coverage: 17 of 17 in-file audit declarations printed
  (heritage 3 + public 11 + private 3), `run6-final.log:6`
- honest label: PROVED-conditional(hK, hF, hntopK, hntopF, hAbFac, hfinK, hfinL, hfinF,
  hcK, hcF, hAK, hAF)

### Verification: Theorem B — `CrossMath.Pilot75.zetaL_two_thirds_conditional`
- file: `research/pilots/75/Pa.lean:1525–1539`
- binder inventory: as Theorem A, plus hCert (opaque certificate proposition) + hK673 =
  the Knausgård 1669159/2478195 slot (`Pa.lean:911`, donor constants
  arXiv:2609.33043/2610.08965); hAF at 2/3 — over K = ℚ its content is discharged at
  the donor pin (see the Dirichlet-column row below), kept as a binder on our pin
- evidence: elaboration `run6-final.log:6`; axioms `run6-final.log:32` — triad;
  re-print `pb-run12-auditfix.log:34`; coverage as Theorem A
- honest label: PROVED-conditional(structural set + hCert + hK673 + hAF)

### Verification: Theorem C — `CrossMath.Pilot75.zetaL_assembly_distinct_defect_landed`
- file: `research/pilots/75/Pb.lean:2144–2186`
- binder inventory: structural tier as Theorem A; hAKd/hAFd the open core (component
  strip-distinct proportions — no donor at any base; over ℚ the distinct form is *not*
  supplied by thmE_C₀, whose 3/4 is weaker than the 5/6 slot)
- evidence: elaboration `pb-run11-final.log:4` (GREEN rc=0, 0 errors, 0 sorry) with the
  complete direct-print re-record `pb-run12-auditfix.log:2` (GREEN re-confirmed);
  axioms `pb-run11-final.log:50` and `pb-run12-auditfix.log:52` — triad
- honest label: PROVED-conditional(structural set + hAKd + hAFd)

### Verification: Theorem D — `CrossMath.Pilot75.zetaL_assembly_distinct_landed_of_negligible`
- file: `research/pilots/75/Pb.lean:2191–2223`
- binder inventory: as Theorem C + hCZStripFam — binder by design: the summed
  common-strip-defect negligibility, conjecture-grade (the project's seam note records
  it not provable today); stated in the summed form, discharge-equivalent to the per-pair
  form (`Pb.lean` file-header design remark, `:41–45`)
- evidence: axioms `pb-run11-final.log:51` (wrapped) and `pb-run12-auditfix.log:53` —
  triad; elaboration as Theorem C
- honest label: PROVED-conditional(structural set + hAKd + hAFd + hCZStripFam)

### Verification: Theorems E/E′ — `CrossMath.Pilot75.zetaL_distinct_five_sixths_strip_conditional(_of_negligible)`
- file: `research/pilots/75/Pb.lean:2229–2277`
- binder inventory: as Theorems C/D with hCert + hK839 (Knausgård 1645064/1960733 slot,
  `Pb.lean:935`) for the ζ_K column; hAFd at 5/6; hCZStripFam in E′ only
- evidence: axioms `pb-run11-final.log:52–53` (wrapped) and `pb-run12-auditfix.log:54–55`
  — triad; elaboration as Theorem C
- honest label: PROVED-conditional(structural set + hCert + hK839 + hAFd(+hCZStripFam))

### Verification: Dirichlet-column input — `Zeta23.ThmE.thmE_A₀` (donor)
- file: zeta23 `Zeta23/ThmE/Final.lean:93–96` (donor tree, read-only sibling); donor
  pin Lean v4.33.0-rc2 / mathlib `51e6992e`; the 144-file pruned closure built in-tree
- exact statement form: quoted verbatim in §3.3; hypothesis binders are scope only
  (`1 < q`, `χ.IsPrimitive`)
- binder inventory: none (no donor statement as binder; no open problem assumed)
- evidence: build + transitive chain audit `zeta23e-p0-run1.log` — hygiene gate PASS
  `:15–18`; `thmE_A₀` print `:190` (repeat `:203`) —
  `[propext, Classical.choice, Quot.sound]`; chain prints `:190–194` (repeats
  `:203–207`); 0 sorryAx in the closure; binder-port elaboration `P0.lean` OK
  (`pilots/zeta23e/P0.lean:54`, probe-convention file — the elaboration is the
  evidence, never cited as a result)
- honest label: PROVED-UNCONDITIONAL — at donor pin (Lean v4.33.0-rc2, mathlib
  `51e6992e`)

### Verification: Quadratic instance — `CrossMath.Pilot42.zetaK_two_thirds_landed_of_V2`
- file: `research/pilots/42/M4b.lean:1479–1492` (article 42 v2 Thm 1; billed there)
- binder inventory: structural set H + hEχ (the χ-column 2/3 binder; content =
  `thmE_A₀`, now audited at the donor pin — discharge pending the port glue)
- evidence: axioms `pilots/42/logs/m4b2-axcheck-run1.log:139` — triad; substrate
  mathlib `ff2494ea` / v4.36.0-rc2
- honest label: PROVED-conditional(H + hEχ)

## 7. Limitations and open problems

1. **The component hypotheses are the open core.** At a general base K, "≥ 2/3
   (with multiplicity) / ≥ 5/6 (distinct) of the zeros of L(s, χ) lie on the line" is
   not known for Hecke L-functions in any corpus or paper we surveyed. Theorems B and
   E/E′ are exactly as strong as their inputs.
2. **The unconditional-at-ℚ theorem is not proved here.** §3.3 records what is audited
   (the Dirichlet column at the donor pin) and what remains: the ℚ ray-class ↔
   Dirichlet dictionary with L-series identification and imprimitivity handling
   (absent from every surveyed corpus), and the factorization binder for K = ℚ. Until
   that glue lands, Theorem B over ℚ keeps its binders; the audited discharge is
   available by donor name, nothing more.
3. **hCZStripFam is conjecture-grade** (Theorems D/E′ only). A common zero of two
   components is a zero of ζ_L of multiplicity ≥ 2; no per-function statistic bounds
   the coincidence count (the seam analysis shows it would follow from S₁ = o(N) plus
   density-zero multiplicity, both open). The defect forms (Theorems C/E) are free of
   it.
4. **Design erratum, recorded (dated correction, 2026-11-16).** The 5/6 arm's design
   claimed the cons-step of the defect induction "closes trivially" by monotonicity.
   Wrong: monotonicity alone does not close it. The corrected invariant —
   superadditivity-up-to-overlap via the abstract Finset Bonferroni inequality plus an
   off-diagonal growth lemma — is what `Pb.lean` proves (§5.3). This re-architecture is
   the mathematical content of the n-ary defect lift beyond the 2-factor
   inclusion–exclusion.
5. **Print-coverage gap, remediated (dated correction, 2026-11-17).** The 5/6 arm's
   first final log was head/tail-excerpted: its hand-written audit tails printed 32 of
   89 declarations, the persisted log body recorded only ≈ 40 of the file's prints,
   and 57 of 89 declarations — including three private helpers — had no direct axiom
   print in the persisted evidence; the header's "every declaration prints triad" was
   tally-only-broad (true for everything printed). The remediation exposed the three
   helpers and re-ran with every P-b-layer declaration printed directly
   (`pb-run12-auditfix.log`, GREEN re-confirmed); the verdicts were unchanged. Coverage
   above cites the complete record.
6. **Window finiteness** of ζ_L, ζ_K and each L(s, χ) is assumed, not derived. It
   follows classically from discreteness of zeros of a nonvanishing meromorphic
   function; that glue is not formalized here.
7. **The ζ_K-column certificate slots are tool-conditional.** The Knausgård constants
   are stronger but ride an externally checked certificate layer (author-disclosed
   extra axioms); the unconditional-on-our-pin alternative (ZetaZerosV2, weaker
   constants) is the article-42-v2 route and is what §3.3's accounting uses over ℚ.
8. **No per-field uniformity:** all statements are asymptotic in T for a fixed tower;
   nothing is uniform over discriminants. The donor's `thmE_A₀` is uniform in q, but
   the assembly's structural set is per-tower.

## 8. Prior work and references

**Literature.** D. de Laat, L. Rolen, Z. Tripp, I. Wagner, arXiv:1908.04876 (scope as
in §4: GRH-conditional, fixed quadratic/abelian K, T → ∞, distinct zeros). D. R.
Bansal, B. Maji, *Number Field Analogue of Jacobi Theta Relation And Zeros of Dedekind
zeta function on Re(s)=1/2*, arXiv:2507.18121. Y. Lamzouri, arXiv:2609.02882.
K. Knausgård, arXiv:2609.33043, arXiv:2610.08965. L. Alpöge, A. Furman,
arXiv:2608.13637 (the method zeta23 formalizes). Liu, arXiv:2610.26835 (half-plane
nonvanishing for Hecke L — location results, not proportions; they do not compete with
Theorems A–E′).

**Project artifacts.** `research/pilots/75/{Pa,Pb}.lean`; logs
`research/pilots/75/logs/{run6-final,pb-run11-final,pb-run12-auditfix}.log`;
`research/pilots/75-prework.md`, `research/pilots/75/Pb-design.md`;
`research/pilots/zeta23e/P0.lean` + `research/pilots/zeta23e/logs/zeta23e-p0-run1.log`;
article 42 v2 (`research/articles/42-quadratic-dedekind-zeta-zero-proportions.md`) and
the pilot-42 stack `research/pilots/42/{M1,M2a,M3,M2b,M4a,M4b}.lean` + logs;
`research/pilots/20-seam-analysis.md`, `research/pilots/20-hCZ-NOTE.md` (the hCZ
verdict); AxiomMath DedekindZetaZeroFree
(`AbelianRayCharacterFactorization.lean:62`, `EntireAbelianQuotient.lean:13`);
AxiomMath ZetaZerosV2 (`ZetaZeros/Main.lean:130,149`); zeta23
(`Zeta23/ThmE/Final.lean:93–105`, `Challenge.lean:92–108` counting conventions);
verification tables `research/qa/iter4-review/r3-verification-tables.md` §§6-row-75,
10.4, 10.5.

---

## Shipping-gate self-audit (TEMPLATE-iter4 §9) — lane A9, 2026-11-17

| # | hard rule | result |
|---|---|---|
| 1 | kind is a §0 article kind; not donor-swap/tranche/addendum clothing | PASS — `DISCOVERY-CONDITIONAL` (statement class, S4(b) title); the hEχ discharge content is a *section* of the one statement-class article (companion billing), not a separate article |
| 2 | title free of project-internal tokens | PASS — no dossier/pilot/probe/run tokens; conditionality carried in the title |
| 3 | status row per theorem, closed vocabulary, every binder listed | PASS — 8 rows; all conditional rows carry verbatim binder lists; the single unconditional row is the donor-pin input, flagged "at donor pin" in the status cell |
| 4 | abstract ≤ 200 words, theorem + hypotheses + status + scoped novelty + nearest prior | PASS — 194 words; both tiers' statuses in the closed vocabulary; scope qualifier in the novelty sentence; DLRT + Bansal–Maji named |
| 5 | novelty table ≥ 2 rows; "first" scoped in-sentence | PASS — 5 rows; scope paragraph below the table |
| 6 | no bracketed errata | PASS — the DLRT comparison and the design erratum are written correctly once |
| 7 | no section contradicts another; no addendum | PASS — one versioned v2; §0 change log records history; §3.3/§7 agree on what is not proved |
| 8 | formal record table-only; no infrastructure narration | PASS — §6 opens with the §6-format table and adds the per-theorem verification blocks (R3 §5 format; charter-mandated); the coverage corrections in §7.5 are stated as record facts, not run histories; error-descent numbers of v1 removed |
| 9 | internal vocabulary ≤ 3 glosses | PASS — "donor" appears only as the substrate qualifier sanctioned by the template; no dossier/pilot IDs in body prose (paths only in §6/§8 evidence cells, where they are citations) |
| 10 | citations spot-checked (5+) | PASS this draft — checked against disk/sibling trees this session: `Pa.lean:1473/:1525/:902/:911`, `Pb.lean:51/:935/:1678/:1797/:1873/:1910/:2144/:2191/:2229/:2255`, `run6-final.log:6/:31–32`, `pb-run11-final.log:4/:50–53`, `pb-run12-auditfix.log:2/:52–55`, zeta23 `Final.lean:93` (sibling, verbatim), `zeta23e-p0-run1.log:15–18/:190/:203`, `P0.lean:54`, `m4b2-axcheck-run1.log:139`; re-verify at splice |
| 11 | README row updated in the same commit | **PENDING — owner H**: the `articles/README.md` row 75 must move to the v2 wording (two tiers; Dirichlet-column discharge audited; N2 still carried) in the splice commit |
| 12 | superseded files marked; edit-state claims git-checked | PASS — v1 superseded in place by this file (§0); no claim about another article's edit state is made beyond cited record paths |

PENDING-CLOSE fields (owner named per the task convention): sha256-at-sweep and final
LoC re-measure of `Pa.lean`/`Pb.lean`/`P0.lean` (§6 preamble) — **owner H** at the
final sweep; any G-class evidence beyond the recorded zeta23e audit (none needed by
this draft's claims) — **owner A1** for ledger rows. Rubric floor: (a) precision 2,
(b) status honesty 2, (d) citations 2 — self-assessed; R1/gate re-check at splice.
