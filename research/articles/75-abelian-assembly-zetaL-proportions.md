# Abelian Assembly: Zero Proportions for ζ_L Across an Abelian Tower — Two Regimes, Conditional on Component Proportions

*kind: DISCOVERY-CONDITIONAL · date: 2026-11-21 (v5; v4, v3 2026-11-20, v2 2026-11-17,
v1 2026-11-16) · supersedes: the v4 text of this same file (revise-in-place; this
revision STATES the uniform one-application composition — Theorems U/U′, the P4
cards — resolving the §7 item-2 pending; the charter's revise-in-place rule, FOURTH
application, and the LAST in-scope revision of this stem — anything beyond is new
statement territory under a fresh gate; no prior theorem, status, or evidence
change; counts/KPI untouched) · artifacts:
`research/pilots/75/Pa.lean`, `research/pilots/75/Pb.lean`,
`research/pilots/75/logs/run6-final.log`, `research/pilots/75/logs/pb-run11-final.log`,
`research/pilots/75/logs/pb-run12-auditfix.log`, `research/pilots/zeta23e/P0.lean`,
`research/pilots/zeta23e/logs/zeta23e-p0-run1.log` +
`research/pilots/75/N2-P1.lean`, `N2-P2c.lean`, `N2-P2d.lean`, `N2-P3.lean`,
`N2-P3e.lean`, `N2-P3V2.lean`, `N2-P4.lean`, `N2-P4V2.lean` with their logs under
`research/pilots/75/logs/` (n2-p1-run19/26/31, n2-p2c-run8, n2-p2d-run2,
n2-p3-run2/3, n2-p3e-run1, n2-p3v2-run3/4, n2-p4-run1, n2-p4v2-run1..3,
axcheck-n3-run1, axcheck-n3v2-run1)*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm A `zetaL_assembly_landed` (`Pa.lean:1473`) | PROVED-CONDITIONAL | structural: hK/hF (analyticity), hntopK/hntopF (finite order), hAbFac (factorization mirror), hfinK/hfinL/hfinF (window finiteness), hcK/hcF (constants); open core: hAK/hAF (component on-line proportions) | `pilots/75/logs/run6-final.log:31` — triad; re-print `pilots/75/logs/pb-run12-auditfix.log:33` |
| Thm B `zetaL_two_thirds_conditional` (`Pa.lean:1525`) | PROVED-CONDITIONAL | idem + hCert + hK673 (ζ_K column via the Knausgård 1669159/2478195 ≥ 2/3 certificate slot); hAF at 2/3 | `run6-final.log:32` — triad; re-print `pb-run12-auditfix.log:34` |
| Thm B′ `zetaL_two_thirds_landed_of_DZDF` (`N2-P3e.lean:62`; card `ZetaLRatTwoThirdsOfDZDF` at `N2-P3.lean:206`) | PROVED-CONDITIONAL | hnp (DedekindZetaZeroFree nonprincipality, ∀ i), hfac (its abelian-factorization statement, quoted verbatim — the direct build fails at the project pin, probe G1, so never an import), hdic (∀ i, HasQDirichletDictionary — dischargeable per member at the project pin), hK/hL, hntopK/hntopL, hfinK/hfinL/hfinζ, hEχcum (component proportions — dischargeable per member from ThmEDyadic + CountsUnbounded at the primitive associate), hccum/hconcum (fK↔ζ count identifications), hζ (ζ-column at 2/3 — dischargeable on the V2-import substrate) | `pilots/75/logs/n2-p3e-run1.log:314` (repeat `:325`) — both declarations triad |
| Thm B″ (ζ-column endpoint: the degenerate tower L = K = ℚ) `zetaL_two_thirds_landed_ℚ` (`N2-P3V2.lean:298`) | PROVED-CONDITIONAL | hfinζ, hntopζ (classical structural) — no DZDF/family/component premises; the AxiomMath ZetaZerosV2 endpoint `ZetaZeros.simple_proportion_d4` consumed by import and re-printed triad in-log — on the V2-import substrate (ZetaZerosV2 built tree; mathlib `ff2494ea`, Lean v4.36.0-rc2) | `pilots/75/logs/n2-p3v2-run4.log:181` (donor re-print `:182`) — 6/6 prints triad |
| **Thm U** (the uniform ℚ-tower composition; P4-a) `zetaL_two_thirds_uniform_of_thmE` (`N2-P4V2.lean:75`; card `ZetaLUniformOfThmEQ` at `N2-P4.lean:74`, sha256-16 `2210fe6e`) | PROVED-CONDITIONAL | hnp/hdic/hfac (the DZDF statement-binder trio, G1-permanent — quoted, never imported), hKζ/hL, hntopKζ/hntopL, hfinζ/hfinL (structural set), hUnbF (per-primitive CountsUnbounded — classical), hEF (per-primitive ThmEDyadic — the zeta23 donor endpoint, PROVED-UNCONDITIONAL at the donor pin, audited triad), hζ (ζ-column at 2/3 — still a premise on this card); B′'s hEχcum/hccum/hconcum absorbed at the f_K := ζ specialization (count identifications degenerate to rfl; `componentEpsCum_of_thmE` converts the pair) | `pilots/75/logs/n2-p4v2-run3.log:182` — triad; the Pa↔Pilot75N2V2 defeq bridges triad (`:180–:181`) |
| **Thm U′** (uniform with the ζ column grounded — the article's strongest row; P4-b) `zetaL_two_thirds_uniform_ℚ` (`N2-P4V2.lean:91`; card `ZetaLUniformQ` at `N2-P4.lean:109`) | PROVED-CONDITIONAL | as Thm U with hζ REMOVED — discharged from the AxiomMath ZetaZerosV2 endpoint `ZetaZeros.simple_proportion_d4` (consumed by import and re-printed triad in-log, through the triad defeq bridges — on the V2-import substrate, the B″-row precedent); the degenerate n-vacuous instance recovers Thm B″ (noted in-row, no separate row) | `pilots/75/logs/n2-p4v2-run3.log:183` (donor re-print `:184`) — triad |
| Thm C `zetaL_assembly_distinct_defect_landed` (`Pb.lean:2144`) | PROVED-CONDITIONAL | structural set as in Thm A; open core: hAKd/hAFd (component strip-distinct proportions) | `pb-run11-final.log:50` — triad; `pb-run12-auditfix.log:52` |
| Thm D `zetaL_assembly_distinct_landed_of_negligible` (`Pb.lean:2191`) | PROVED-CONDITIONAL | idem + hCZStripFam (summed common-strip-defect negligibility; conjecture-grade binder) | `pb-run11-final.log:51` — triad (wrapped); `pb-run12-auditfix.log:53` |
| Thm E `zetaL_distinct_five_sixths_strip_conditional` (`Pb.lean:2229`) | PROVED-CONDITIONAL | idem + hCert + hK839 (ζ_K column via the Knausgård 1645064/1960733 ≥ 5/6 certificate slot); hAFd at 5/6 | `pb-run11-final.log:52` — triad (wrapped); `pb-run12-auditfix.log:54` |
| Thm E′ `zetaL_distinct_five_sixths_strip_conditional_of_negligible` (`Pb.lean:2255`) | PROVED-CONDITIONAL | idem + hCZStripFam | `pb-run11-final.log:53` — triad (wrapped); `pb-run12-auditfix.log:55` |
| Dirichlet-column input `Zeta23.ThmE.thmE_A₀` (donor; zeta23 `Zeta23/ThmE/Final.lean:93`) | PROVED-UNCONDITIONAL — at donor pin (Lean v4.33.0-rc2, mathlib `51e6992e`) | scope only: `1 < q`, `χ.IsPrimitive` | `pilots/zeta23e/logs/zeta23e-p0-run1.log:190` (repeat `:203`) — triad; transitive Theorem-E chain audit five-of-five triad, 0 sorryAx (`:15–18`) |
| Quadratic instance `zetaK_two_thirds_landed_of_V2` (article 42 v2 Thm 1; `pilots/42/M4b.lean:1479`) | PROVED-CONDITIONAL | structural set H + hEχ (the χ-column 2/3 binder — the one analytic binder; its content is `thmE_A₀` above, now audited) | `pilots/42/logs/m4b2-axcheck-run1.log:139` — triad |

All Lean-backed rows except the donor row elaborate on the project pin (mathlib
`ff2494ea`, Lean v4.36.0-rc2), axioms exactly
`[propext, Classical.choice, Quot.sound]`, zero `sorry`/`sorryAx`, zero donor imports
(`import Mathlib` only, `Pb.lean:51`; `hAbFac` is the statement-quoted mirror of the
factorization, never an import). The V2-substrate rows (B″, U, U′) additionally import
the built `ZetaZeros` module — the endpoint re-printed triad in-log, as noted in-row.

## Abstract

For an abelian extension L/K of number fields, class field theory factors
ζ_L = ζ_K · ∏_χ L(s, χ). We prove in Lean an assembly schema: if ζ_K and every component
L(s, χ_i) have on-line zero proportion at least c₀ and c_i (multiplicity-counted),
then ζ_L has proportion at least min(c₀, min_i c_i) (Theorem A,
PROVED-CONDITIONAL — open component hypotheses); at 2/3,
Theorem B. Theorems C–E′ (PROVED-CONDITIONAL) are the 5/6 strip-distinct regime, up to
an explicit common-zero defect. Over K = ℚ, Theorem B′ is proved conditional on the
quoted abelian factorization, nonprincipality, the ray-class↔Dirichlet dictionary,
per-primitive component proportions, two ζ↔f_K count identifications, the ζ column,
and the structural set; the degenerate tower L = K = ℚ leaves two classical binders
(Theorem B″). Among surveyed corpora and literature these are
the first multiplicity-counted on-line and 5/6-class distinct zero-proportion
statements for ζ_L beyond the quadratic case, and the first with nontrivial base
K; hypotheses are component proportions, not GRH. Nearest prior work:
de Laat–Rolen–Tripp–Wagner's GRH-conditional distinct-zero proportions for abelian
K/ℚ (degrees 2–4); Bansal–Maji's unconditional on-line infinitude for every number
field. The mathematics is corollary-level; the contribution is the statement class,
the hypothesis schema, and the Lean-verified Bonferroni-type defect transport.

## 1. Introduction

**The question.** Lower bounds for the proportion of zeros of ζ(s) on the critical line
go back to Selberg (positive proportion), Levinson (> 1/3) and Conrey (> 2/5). Recent
work pushes past 2/3 for ζ: Lamzouri's theorem, formalized in AxiomMath's ZetaZerosV2,
gives ≥ 0.6725 simple and on the line; Knausgård's certified constants reach
≈ 0.6735 with multiplicity (exactly 1669159/2478195) and ≈ 0.839 distinct (exactly
1645064/1960733). For a Dedekind zeta function the
record is thin. The nearest prior result is de Laat–Rolen–Tripp–Wagner
(DLRT, arXiv:1908.04876): *assuming GRH*, for *every* abelian number field K of degree
n their pair-correlation analysis yields the asymptotic of Thm 1.1 and the multiplicity
bound N*_K(T) ≤ (c_n + o_K(1)) N_K(T) of Thm 1.2, whence Cor 1.3 gives *distinct*-zero
proportions N_{K,d}(T) ≥ (0.4585 + o_K(1)) N_K(T) for n = 2, ≥ (0.2794 + o_K(1)) for
n = 3 and ≥ (0.1127 + o_K(1)) for n = 4. These are distinct-zero statements under GRH:
they give no multiplicity-counted on-line proportion, nothing unconditional, and
nothing for a tower ζ_L over a base ζ_K with K ≠ ℚ. Beyond DLRT, the unconditional
on-line *infinitude* of Bansal–Maji
(arXiv:2507.18121) holds for ζ_F of *any* number field F — infinitude, not proportion.

**The observation.** When ζ_L factors as a product of entire (or, for ζ_K, meromorphic
with a single pole at s = 1) functions, the multiplicity of a zero ρ ≠ 1 of ζ_L is the
sum of the factors' multiplicities. Window zero counts therefore add, and so do on-line
counts. A proportion bound is a linear inequality between the two counts, so it passes
through finite sums when all summands share a constant, and through the minimum of the
constants in general. Pilot 42 (article 42) did this for two factors
(ζ_K = ζ · L(s, χ_D)); the abelian tower needs n + 1 factors, with one factor (ζ_K)
carrying a pole, and — for the distinct regime — a Bonferroni-type control of the
pairwise common-zero defects.

**Honesty.** The two-factor counting engine is article 42's; it is not claimed here.
The new content is:

1. the n-ary statement class over an arbitrary finite index type ι (both regimes);
2. the n-fold multiplicity factorization under per-factor hypotheses only (§5.2) — the
   2-factor engine's partial-product non-degeneracy hypothesis is *derived*, not
   assumed;
3. the distinct regime's n-ary defect transport: the ordered-pair defect inequality closes
   by superadditivity-up-to-overlap (an abstract Finset Bonferroni inequality plus an
   off-diagonal growth lemma), not by monotonicity (§5.3; the design erratum is
   recorded in §7);
4. the instantiation schemas at 2/3 and 5/6, which name exactly which inputs are open;
5. the discharge accounting (§3.3): over K = ℚ, every *analytic* input of the 2/3 statement
   is now kernel-proved somewhere (ζ column at the project pin, Dirichlet column at the zeta23
   donor pin, audited); what remains between the schema and an unconditional ζ_L
   theorem is named glue, not an analytic unknown.

The component inputs at a general base ("each L(s, χ_i) has ≥ 2/3 of its zeros on the
line") remain the open core: no corpus, formal or informal, proves them for Hecke
L-functions of a general base field.

## 2. Setting and notation

All objects live in `research/pilots/75/Pa.lean` (regime 1) and
`research/pilots/75/Pb.lean` (regime 2; carries `Pa.lean` verbatim below its `## P-b
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
  the ZetaZerosV2 import of article 42 v2; see §3.3). The slot is a hypothesis:
  the external theorems behind the numerals are for ζ, and no ζ_K analogue is claimed.
- **Donor statements (never imported; quoted).** The factorization is
  AxiomMath DedekindZetaZeroFree's `abelianFactorization`
  (`AbelianRayCharacterFactorization.lean:62`): for abelian Galois L/K there exist
  moduli and nonprincipal ray-class characters χ_i with
  ζ_L(s) = (∏_i Σ′_I χ_i(I) N(I)^{−s}) · ζ_K(s) for Re s > 1. The Dirichlet-column
  endpoint is zeta23's `thmE_A₀` (quoted verbatim in §3.3).

V2-import substrate = the ZetaZerosV2 built tree on the same mathlib rev — donor
import, not donor pin (the article-42-v2 precedent).

## 3. Main results

Let ι be a finite type. Let f_K, f_L : ℂ → ℂ and F : ι → ℂ → ℂ. Write N_f(T) and
N⁰_f(T) for the cumulative strip and line counts of `multOf f`, D_f(T) for the
cumulative distinct strip count.

### 3.1 Regime 1 — with multiplicity

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

### 3.2 Regime 2 — strip-distinct, 5/6

**Theorem C (`zetaL_assembly_distinct_defect_landed`, n-fold defect form;
`Pb.lean:2144`).** Under the structural set of Theorem A (hK, hF, hntopK, hntopF,
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
as in Theorems C and D at c* = 5/6. These instantiate article 42's two quadratic
distinct-zero theorems one degree up the tower.

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
here. Consequence: the χ-column 2/3 binder of Theorem B (over ℚ) is dischargeable
at the donor pin by name; on the project pin it remains an explicit binder pending a
port — a substrate gap, not an analytic one.

**The ζ columns.** Over ℚ, f_K = ζ: the ζ column is discharged unconditionally on the
project pin by the ZetaZerosV2 import (article 42 v2, Thm 1's `V2d4_endpoint` route).
At a general base K, Theorems B and E use the Knausgård certificate slots (§2) — the
stronger constants, tool-conditional route (the slot is a hypothesis: the external
theorem is for ζ, and no ζ_K analogue is claimed).

**The over-ℚ discharge record.** Two named pieces of the previous version's
remainder are now kernel-proved on this project's pin:
(i) the ℚ dictionary — `hasQDirichletDictionary` with the L-series identification
(`heckeTsum_eq_ratCharOf_LFunction`, `ratCharOf_eq_one_iff`, `chi_span_residue`)
and the imprimitivity immunity `eulerStripImmunity_changeLevel` (an imprimitive L
differs from its primitive associate by finitely many Euler factors off the
critical strip — the previous version narrated this; it is now proved), plus the component window
finiteness `windowFinite_LFunction` for every nontrivial Dirichlet component;
(ii) the factorization-binder bridge — `identity_theorem_extension` /
`factorization_identity_extension` (half-plane → ℂ∖{1} transport) and
`dirichletFactorizationTransfer` (the DZDF→Dirichlet-family transfer, corrected
shape). The two convention deltas between the donor statement and Theorem B's
binder are also now formalized (`thmE_dyadic_to_cumulative` +
`epsLowerCum_of_thmE`/`componentEpsCum_of_thmE`): distinct→with-multiplicity a
fortiori and dyadic→cumulative block-sum, including at imprimitive characters via
the primitive associate.

**What remains (the honest remainder, all named).** The DZDF
abelian-factorization statement-binder `hfac` (its direct build fails at the
project pin — probe G1 — so it enters as a quoted statement, never an import); the
per-primitive classical binders ThmEDyadic (content = `thmE_A₀`,
PROVED-UNCONDITIONAL at the donor pin) and CountsUnbounded (zero infinitude,
Titchmarsh §5.8/Davenport ch. 9); and the structural set (hfinζ/hntopζ at the ℚ
endpoint). On these, the composed card `zetaL_two_thirds_landed_of_DZDF` (Thm B′)
and the ζ-column endpoint `zetaL_two_thirds_landed_ℚ` (Thm B″, the degenerate
tower L = K = ℚ) are theorems; their one-application composition — instantiating
B′ at f_K := riemannZeta, discharging hccum/hconcum by rfl and hζ by the V2
endpoint — is stated at v5, immediately below.

**The uniform composition (Theorems U/U′, stated at v5).** The fresh verified run
has landed: fire file `research/pilots/75/N2-P4V2.lean` @ sha256-16 `2c19084aa7e2f2e9`
(cards at `N2-P4.lean` @ `2210fe6e01f1e095`, unchanged from the grant; run of record
`pilots/75/logs/n2-p4v2-run3.log` @ `f17acc27ee50dd63`, 3 runs of the ≤3 grant,
zero math defects, telemetry in the authorized build-phase class).
`zetaL_two_thirds_uniform_of_thmE` (Thm U) is B′ instantiated at f_K := riemannZeta
— the f_K↔ζ count identifications degenerate to `rfl` at the specialization, and the
per-component premise is absorbed into the per-primitive pair
(`componentEpsCum_of_thmE` converting hUnbF + hEF). `zetaL_two_thirds_uniform_ℚ`
(Thm U′) additionally discharges hζ from the V2 endpoint
(`epsLowerCum_zeta_of_V2d4 hntopζ hfinζ V2d4_endpoint`, through the triad defeq
bridges `windowFinite_v2_of_pa`/`epsLowerCum_pa_of_v2`); both print exactly the
triad, 0 sorryAx, with the donor endpoint re-printed triad on-pin. The degenerate
n-vacuous instance recovers Theorem B″. This closes the honest remainder's last
item: what remains open is exactly the named binder set (the DZDF trio
hnp/hdic/hfac, the per-primitive
classical pair, the structural set) — every proportion input in the chain is now
kernel-verified at its own pin (V2 d4 on-pin; ThmE at the donor pin).

**The quadratic instance.** Article 42 v2's Theorem 1
(`zetaK_two_thirds_landed_of_V2`, `M4b.lean:1479`) is the n = 2 case of the schema with
the ζ column already unconditional at the project pin and `hEχ` — whose content is `thmE_A₀`
above — as its one analytic binder. The donor-pin audit therefore reduces the
quadratic case to *zero analytic open binders*, pending the same port; it is
billed there, not re-proved here.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876, Thm 1.1 / Thm 1.2 / Cor 1.3(i)–(iii) | *under GRH*, for every abelian number field K/ℚ of degree n: the pair-correlation asymptotic (Thm 1.1); N*_K(T) ≤ (c_n + o_K(1)) N_K(T) (Thm 1.2); distinct-zero proportions N_{K,d}(T) ≥ (0.4585 / 0.2794 / 0.1127 + o_K(1)) N_K(T) for n = 2 / 3 / 4 (Cor 1.3, SDP method) | ours: multiplicity-counted on-line proportions (Thm B), which DLRT do not state, and 5/6-class distinct proportions, far above their 0.1127–0.4585 constants, up to an explicit defect (Thm C/E) for *every* abelian tower L/K, including nontrivial base K ≠ ℚ, which their K/ℚ setting does not cover; hypothesis shape is component-proportion binders, not GRH; comparison is hypothesis-shape-to-hypothesis-shape (their GRH binder vs our component binders) |
| Bansal–Maji, arXiv:2507.18121 (v1 2025-07-24) | via a number-field Jacobi-theta relation, *infinitely many* nontrivial zeros of ζ_F on Re s = 1/2 for *any* number field F — Hardy-type, unconditional at abstract level | infinitude, not proportion: an infinitude theorem cannot feed Thm A's component-proportion hypotheses; no multiplicity or distinct statements, no constants |
| Lamzouri arXiv:2609.02882 / AxiomMath ZetaZerosV2 (`ZetaZeros/Main.lean:130,149`) | ζ-only proportions: > 0.6725 simple on-line, > 0.83625 distinct (kernel-verified) | the ζ column only, imported there; no product, no ζ_K or ζ_L statement |
| Knausgård arXiv:2609.33043, arXiv:2610.08965 | ζ constants ≈ 0.6735 with multiplicity (exactly 1669159/2478195) and ≈ 0.839 distinct (exactly 1645064/1960733), behind an externally checked certificate layer (author-disclosed extra axioms, one per inequality) | our ζ_K-column certificate slots quote these constants as binders; stronger constants, tool-conditional route (see §2) |
| article 42 v2 (this project, 2026-11-16) | the n = 2 instances with the ζ column discharged unconditionally (ZetaZerosV2 import) | Thms A–E′ here are the n+1-factor generalization over an arbitrary finite family; 42's Thm 1 is this schema's quadratic instance (§3.3) |

Scope statement. "First multiplicity-counted on-line and 5/6-class distinct
zero-proportion statements for ζ_L beyond the quadratic case" means first among the
corpora surveyed (mathlib, tauceti, the AxiomMath repositories, openai-math,
anthropics/zeta23) and the informal literature searched (arXiv queries recorded in
the project's novelty records; DLRT scope re-checked 2026-11-21 against the arXiv
full text — Thm 1.1 covers abelian K of every degree, Cor 1.3(i)–(iii) give
distinct-zero proportions for n = 2/3/4, all GRH-conditional). The assembly
mathematics is corollary-level; the claim is about the statement class, not the
difficulty.

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

### 5.3 The distinct regime (Bonferroni transport)

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
and absorbs the defect with hCZStripFam (`nlinarith` on the nonnegative count-cast;
the binder is uniform in ε — its T₀ may depend on ε — so each half may take δ/2).
Theorems E/E′ instantiate at 5/6 via `five_sixths_le_839` (`Pb.lean`, carried from
`Pa.lean:904`) and `EpsLowerDistinctStripCum_mono`.

### 5.4 Assembly (regime 1)

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
| Thm B′ | `CrossMath.Pilot75N2.zetaL_two_thirds_landed_of_DZDF` | `research/pilots/75/N2-P3e.lean:62` | ⊆ triad | `pilots/75/logs/n2-p3e-run1.log:314` (repeat `:325`) |
| Thm B″ | `CrossMath.Pilot75N2V2.zetaL_two_thirds_landed_ℚ` | `research/pilots/75/N2-P3V2.lean:298` | ⊆ triad | `pilots/75/logs/n2-p3v2-run4.log:181` (donor re-print `:182`) |
| Thm U | `CrossMath.Pilot75N2.zetaL_two_thirds_uniform_of_thmE` | `research/pilots/75/N2-P4V2.lean:75` (card `N2-P4.lean:74`) | ⊆ triad | `pilots/75/logs/n2-p4v2-run3.log:182` (defeq bridges `:180–:181`) |
| Thm U′ | `CrossMath.Pilot75N2.zetaL_two_thirds_uniform_ℚ` | `research/pilots/75/N2-P4V2.lean:91` (card `N2-P4.lean:109`) | ⊆ triad | `pilots/75/logs/n2-p4v2-run3.log:183` (donor re-print `:184`) |
| Thm C | `CrossMath.Pilot75.zetaL_assembly_distinct_defect_landed` | `research/pilots/75/Pb.lean:2144` | ⊆ triad | `pb-run11-final.log:50`; `pb-run12-auditfix.log:52` |
| Thm D | `CrossMath.Pilot75.zetaL_assembly_distinct_landed_of_negligible` | `Pb.lean:2191` | ⊆ triad | `pb-run11-final.log:51`; `pb-run12-auditfix.log:53` |
| Thm E | `CrossMath.Pilot75.zetaL_distinct_five_sixths_strip_conditional` | `Pb.lean:2229` | ⊆ triad | `pb-run11-final.log:52`; `pb-run12-auditfix.log:54` |
| Thm E′ | `CrossMath.Pilot75.zetaL_distinct_five_sixths_strip_conditional_of_negligible` | `Pb.lean:2255` | ⊆ triad | `pb-run11-final.log:53`; `pb-run12-auditfix.log:55` |
| Dirichlet column (donor) | `Zeta23.ThmE.thmE_A₀` | zeta23 `Zeta23/ThmE/Final.lean:93` | ⊆ triad | `pilots/zeta23e/logs/zeta23e-p0-run1.log:190` (repeat `:203`) |
| Quadratic instance | `CrossMath.Pilot42.zetaK_two_thirds_landed_of_V2` | `research/pilots/42/M4b.lean:1479` | ⊆ triad | `pilots/42/logs/m4b2-axcheck-run1.log:139` |

"⊆ triad" = exactly `[propext, Classical.choice, Quot.sound]` at the cited print.
Substrate for all rows except the donor row: mathlib `ff2494ea` @ Lean v4.36.0-rc2,
zero `sorry`/`sorryAx` (donor row: Lean v4.33.0-rc2, mathlib
`51e6992e`; the V2-substrate rows B″/U/U′ elaborate against the built ZetaZerosV2
tree on the same mathlib rev, endpoint re-printed in-log). Binder inventories are
the status-table rows at the head of this article.
Full-coverage axiom audit of the article's two files `Pa.lean`/`Pb.lean`: all 89
declarations direct-print exactly the triad with 0 `sorryAx`
(`pilots/75/logs/axcheck-full-run1.log`, full-coverage audit of 2026-11-17).

## 7. Limitations and open problems

1. **The component hypotheses are the open core.** At a general base K, "≥ 2/3
   (with multiplicity) / ≥ 5/6 (distinct) of the zeros of L(s, χ) lie on the line" is
   not known for Hecke L-functions in any corpus or paper we surveyed. Theorems B and
   E/E′ are exactly as strong as their inputs. (The nearest formal relative, zeta23's
   `thmE_C₀` — 3/4 distinct for Dirichlet L — is weaker than the 5/6 slot and is not a
   ζ_K-column statement.)
2. **The composed-at-ℚ theorem is proved to its named binders.** The
   previous version's glue — the ℚ dictionary with L-series identification and
   imprimitivity immunity, the dyadic→cumulative and distinct→with-multiplicity
   conversions, the factorization-binder bridge — is now kernel-proved (§3.3). What
   remains is narrower and named: the DZDF factorization statement-binder (quoted,
   never an import — its direct build fails at the project pin, probe G1), the
per-primitive ThmEDyadic/CountsUnbounded binders (classical content), and the
structural set (hfinζ/hntopζ at the ℚ endpoint). Theorem B′ carries the first two
groups and Theorem B″ the structural set; the final one-application composition is
NOW STATED (Theorems U/U′, v5): the uniform, composed on-line zero-proportion
   statement for every abelian L/ℚ — multiplicity-counted, cumulative (0, T], at
   2/3 − ε — kernel-proved relative to exactly the named remainder (the DZDF
   statement-binder trio, the classical structural set, and the per-primitive pair
   hUnbF/hEF; every proportion input kernel-verified at its own pin — V2 d4 on-pin,
   ThmE at the donor pin). This closes the v4 honest-remainder ledger's last item;
   nothing else in this item changes.
3. **hCZStripFam is conjecture-grade** (Theorems D/E′ only). A common zero of two
   components is a zero of ζ_L of multiplicity ≥ 2; no per-function statistic bounds
   the coincidence count (a project-side analysis, `research/pilots/20-hCZ-NOTE.md`,
   records that it would follow from S₁ = o(N) plus density-zero multiplicity, both
   open). The defect forms (Theorems C/E) are free of it. The binder is stated in the
   summed form, discharge-equivalent to the per-pair form (`Pb.lean` file-header
   design remark, `:41–45`).
4. **Design erratum, recorded (dated correction, 2026-11-16).** The 5/6 arm's design
   claimed the cons-step of the defect induction "closes trivially" by monotonicity.
   Wrong: monotonicity alone does not close it. The corrected invariant —
   superadditivity-up-to-overlap via the abstract Finset Bonferroni inequality plus an
   off-diagonal growth lemma — is what `Pb.lean` proves (§5.3). This re-architecture is
   the mathematical content of the n-ary defect lift beyond the 2-factor
   inclusion–exclusion.
5. **Window finiteness.** The Dirichlet component side is discharged at the project
   pin (`windowFinite_LFunction`, every nontrivial Dirichlet component). The ζ-side
   and general-ζ_K/ζ_L finiteness remain assumed (hfinζ/hfinK/hfinL binders) — the
   classical discreteness glue is still not formalized here.
6. **The ζ_K-column certificate slots are tool-conditional.** The Knausgård constants
   are stronger but ride an externally checked certificate layer (author-disclosed
   extra axioms); the unconditional-at-the-project-pin alternative (ZetaZerosV2,
   weaker constants) is the article-42-v2 route and is what §3.3's accounting uses
   over ℚ.
7. **No per-field uniformity:** all statements are asymptotic in T for a fixed tower;
   nothing is uniform over discriminants. The donor's `thmE_A₀` is uniform in q, but
   the assembly's structural set is per-tower.

## 8. Prior work and references

**Literature.** D. de Laat, L. Rolen, Z. Tripp, I. Wagner, arXiv:1908.04876
(GRH-conditional: Thm 1.1 pair correlation for abelian K of any degree n; Thm 1.2
multiplicity bound with explicit c_n; Cor 1.3(i)–(iii) distinct-zero proportions for
n = 2/3/4). D. R.
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
the article-42 verification stack `research/pilots/42/{M1,M2a,M3,M2b,M4a,M4b}.lean` + logs;
`research/pilots/20-seam-analysis.md`, `research/pilots/20-hCZ-NOTE.md` (the hCZ
verdict); AxiomMath DedekindZetaZeroFree
(`AbelianRayCharacterFactorization.lean:62`, `EntireAbelianQuotient.lean:13`);
AxiomMath ZetaZerosV2 (`ZetaZeros/Main.lean:130,149`); zeta23
(`Zeta23/ThmE/Final.lean:93–105`, `Challenge.lean:92–108` counting conventions);
verification tables `research/qa/iter4-review/r3-verification-tables.md` §§6-row-75,
10.4, 10.5.
