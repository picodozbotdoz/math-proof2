# Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions: a Two-Column Assembly

*kind: DISCOVERY-CONDITIONAL · date: 2026-11-21 (v3; v2 2026-11-16) · supersedes: the v2
text of this file (revised in place: the ζ-column and χ-column status billing and the
corresponding framing are corrected per external review — no theorem, statement, or
evidence change), `42M4-zetaK-proportions-unconditional-zeta-column.md` (2026-11-14),
and this file's v1 (2026-11-09) · artifacts:
`research/pilots/42/{M1,M2a,M3,M2b,M4a,M4b}.lean`,
`research/pilots/42/logs/`, `research/pilots/zeta23e/logs/zeta23e-p0-run1.log`,
`research/pilots/42/logs/M4b-fallback-GREEN.lean`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 `zetaK_two_thirds_landed_of_V2` | PROVED-CONDITIONAL | H (§3: hfinK, hfinζ, hfinχ — window finiteness; hK, hχ — analyticity off s = 1; hK1, hP1 — pole removal at 1; hntopζ, hntopχ — zero order ≠ ⊤; hfac — factorization) + hEχ : `EpsLowerCum (multOf fχ) (2/3)` (cumulative-window transcription of zeta23's Theorem E, which is proved at the donor pin; see §7.1) | statement `research/pilots/42/M4b.lean:1479–1492`, ζ column fed `V2d4_endpoint` inline at `:1492`; axiom print `research/pilots/42/logs/m4b2-axcheck-run1.log:139` ⊆ {propext, Classical.choice, Quot.sound} |
| Thm 2 `zetaK_distinct_five_sixths_strip_landed_of_V2` | PROVED-CONDITIONAL | H + hEχdStrip : `EpsLowerDistinctStripCum (multOf fχ) (5/6)` (stated ε-explicitly: additional binders ε, hε) | statement `research/pilots/42/M4b.lean:1497–1511` (fed `V2d5_endpoint` at `:1513`); axiom print `research/pilots/42/logs/m4b2-axcheck-run1.log:140` (declaration name wraps over two log lines); sweep-of-record extract `research/pilots/42/logs/axcheck-c2-final.log:8` |
| Thm 3 `zetaK_distinct_five_sixths_strip_landed_of_V2_of_negligible` | PROVED-CONDITIONAL | H + hEχdStrip + hCZStrip (common-strip zeros negligible; the one genuinely open hypothesis) | statement `research/pilots/42/M4b.lean:1535–1549`; axiom print `research/pilots/42/logs/m4b2-axcheck-run1.log:141` (wrapped); `research/pilots/42/logs/axcheck-c2-final.log:8` |
| ζ-column inputs `EpsLowerCum (multOf riemannZeta) (2/3)` and distinct analogue | PROVED-CONDITIONAL | hntopζ : `∀ ρ, analyticOrderAt riemannZeta ρ ≠ ⊤` and hfinζ : `WindowFinite (multOf riemannZeta)` — classical structural conditions, carried, not discharged; the proportion-endpoint premise is filled at the landing theorems by the imported, kernel-verified donor theorems (next row) | transfer lemmas `epsLowerCum_zeta_of_V2d4` (`research/pilots/42/M4b.lean:1404–1407`), `epsLowerDistinctStripCum_zeta_of_V2d5` (`:1439–1442`); axiom prints `research/pilots/42/logs/m4b2-axcheck-run1.log:211–212` ⊆ {propext, Classical.choice, Quot.sound} |
| imported endpoints `ZetaZeros.simple_proportion_d4`, `ZetaZeros.distinct_proportion_d5` | PROVED-UNCONDITIONAL | none | donor tree `axiommath/ZetaZerosV2/ZetaZeros/Main.lean:130`, `:149`; rebuilt on this project's pin and printed from the consumer side through the wrappers `V2d4_endpoint`/`V2d5_endpoint` (`research/pilots/42/M4b.lean:1390/:1396`), prints `research/pilots/42/logs/m4b2-axcheck-run1.log:142–145`; donor-tree sweep `research/pilots/42/logs/axcheck-c2-final.log:8`; build audit `research/feasibility/axiommath-donor-probes.md` §G2 and `research/feasibility/VERIFICATION-LEDGER.md` §9.F |
| hypothesis form of Thms 1–3 (endpoints as premises hV2d4/hV2d5) | PROVED-CONDITIONAL | H + hV2d4 + hV2d5 | `research/pilots/42/logs/M4b-fallback-GREEN.lean` (1,560 lines; on disk unchanged, 85,641 bytes); full-coverage axiom check `research/pilots/42/logs/m4b-axcheck-run1.log:2` — 68 distinct theorems (66 + 2 `@[simp]`), every axiom list exactly [propext, Classical.choice, Quot.sound], 0 sorryAx; prints `:20–21`; build `research/pilots/42/logs/m4b-run2.log:2` |

## Abstract

For a quadratic field K, ζ_K(s) = ζ(s)·L(s, χ_D) — the two columns ζ and L(·, χ_D).
We prove in Lean (mathlib `ff2494ea`, v4.36.0-rc2; axioms ⊆ {propext,
Classical.choice, Quot.sound}): under structural hypotheses H — window finiteness for
the three factors, analyticity off s = 1 (pole removed at 1), zero order ≠ ⊤, and the
factorization on Re s > 1 — plus hEχ : `EpsLowerCum (multOf L(·,χ_D)) (2/3)`, at least
2/3 of the zeros of ζ_K up to height T, with multiplicity, lie on the critical line
(Theorem 1). Theorems 1–3 are PROVED-CONDITIONAL: Theorem 2 adds the 5/6
distinct-strip bound hEχdStrip for the distinct analogue with an explicit common-zero
defect; Theorem 3 adds hCZStrip, the genuinely open negligibility hypothesis, removing
the defect. The ζ column comes from AxiomMath ZetaZerosV2's endpoints (0.6725 /
0.83625; kernel-verified here) via transfer lemmas conditional only on hntopζ, hfinζ;
the χ-column binder transcribes zeta23's Theorem E, proved there with no analytic
hypotheses, so the residual gap is a proof port, not open analysis. These are the
first on-line zero-proportion statements for a number-field zeta function in the
surveyed corpora and literature; the nearest informal result
(de Laat–Rolen–Tripp–Wagner) is GRH-conditional, fixed quadratic, and about distinct
zeros.

## 1. Introduction

Lower bounds for the proportion of zeros of ζ on the critical line go back to Selberg,
Levinson (> 1/3) and Conrey (> 2/5); Lamzouri's theorem, formalized in AxiomMath's
ZetaZerosV2, gives > 0.6725 simple-and-on-line and > 0.83625 distinct. For Dedekind zeta
functions of K ≠ ℚ nothing formal existed before this project, and informally the
nearest result is DLRT's > 45% *distinct* zeros for a *fixed quadratic* K *under GRH*.
The zeta23 corpus proves the Alpöge–Furman-type proportion theorems for ζ and for
primitive Dirichlet L-functions; tauceti provides the continuation and the
factorization ζ_K = ζ·L(·,χ_D) on Re s > 1 for quadratic K. Multiplicities add under
products, so window counts add and proportions assemble: that is the whole mechanism,
and this article assembles it once, with both columns accounted for honestly.

**Provenance.** This file merges the project's two earlier records of the same
assembly: v1 (2026-11-09), which carried both columns as hypotheses with the ζ column
taken from Knausgård's certified constants behind a certificate binder, and a companion
file (2026-11-14) stating the imported-endpoint variant; v2 (2026-11-16) merged them
and rewrote the early DLRT comparison — which had read DLRT's distinct-zero proportion
as unconditional — as the GRH-conditional comparison now stated once in §4.

**What is new here.** (a) The statement class: the first on-line zero-proportion
statements for a number-field zeta function (formal or informal, within the corpora and
literature surveyed — the corpus and arXiv absence queries are recorded in
`research/qa/iter4-review/r2-discovery-strength.md` §5, queries 1–2, re-run
2026-11-16). (b) The defect vocabulary: the distinct-count statement carries an
explicit common-zero defect term, D_K + commonStrip(ζ, fχ); the same survey found no
corpus or paper studying this quantity as a named statistic. (c) The ζ-column endpoint
import: the first ζ_K proportion statements whose ζ column rests on a kernel-verified
proportion endpoint (AxiomMath ZetaZerosV2, rebuilt and axiom-audited on this project's
pin), leaving only two classical structural conditions on the ζ side.
**What is not new:** any analytic mathematics — the assembly is corollary-level, and we
say so. The χ column is carried as a transcription of zeta23's Theorem E, which is
itself proved at zeta23's pin with no analytic hypotheses (§7.1); what separates
Theorems 1–2 from unconditional theorems is that proof port plus the carried classical
structural conditions, and Theorem 3 additionally needs the genuinely open negligibility
hypothesis hCZStrip.

## 2. Setting

Fix fK, fχ : ℂ → ℂ (intended: fK = ζ_K, fχ = L(·, χ_D)). `multOf f ρ := analyticOrderNatAt
f ρ`. Windows are cumulative: `stripWindow 0 T = {ρ | 0 < Re ρ < 1, 0 < Im ρ ≤ T}`,
`lineWindow 0 T = {ρ | Re ρ = 1/2, 0 < Im ρ ≤ T}`. `countCum z T` and `countOnCum z T`
sum a multiplicity function z over the two windows. `EpsLowerCum z c` :⟺ ∀ ε > 0, ∃ T₀,
∀ T ≥ T₀, (c − ε)·countCum z T ≤ countOnCum z T (the division-free liminf form of
"≥ c of the zeros lie on the line"). `FactorizationOnHalfPlane fK fζ fχ` :⟺ ∀ s,
Re s > 1 → fK s = fζ s · fχ s.

The distinct-count vocabulary (`research/pilots/42/M4a.lean`): `distinctCountCum z T`
(number of distinct strip zeros up to T), `EpsLowerDistinctStripCum z c` (ε-form ratio
bound with the distinct count as numerator), `commonStripCum z w T` (strip points that
are zeros of both factors).

Donor endpoints (imported, `axiommath/ZetaZerosV2/ZetaZeros/Main.lean:130` and `:149`;
statements re-verified line-exact 2026-11-21):
`ZetaZeros.simple_proportion_d4` : ∃ T₀, ∀ T ≥ T₀, 0.6725 < simpleOnLineCount T /
zeroCount T; `ZetaZeros.distinct_proportion_d5` : the same with 0.83625 <
distinctZeroCount T / zeroCount T.

## 3. Main results

Structural hypothesis set **H** (all classical, carried as binders):
- window finiteness of `multOf fK`, `multOf riemannZeta`, `multOf fχ` (hfinK, hfinζ,
  hfinχ);
- fK and fχ analytic at every s ≠ 1 (hK, hχ); (s − 1)·fK(s) and (s − 1)·ζ(s)·fχ(s)
  analytic at 1 (hK1, hP1);
- `analyticOrderAt fχ ρ ≠ ⊤` for all ρ, i.e. fχ not locally zero (hntopχ); the same
  condition for ζ is the binder hntopζ — ζ's *analyticity* off s = 1 is discharged
  inline by the lemma `analyticAt_riemannZeta` (`research/pilots/42/M4b.lean:563`),
  but its ⊤-order exclusion is carried, not discharged;
- `FactorizationOnHalfPlane fK riemannZeta fχ` (hfac).

**Theorem 1 (with multiplicity, 2/3).** Assume H and hEχ : `EpsLowerCum (multOf fχ)
(2/3)`. Then `EpsLowerCum (multOf fK) (2/3)`: for every ε > 0, for all large T,
(2/3 − ε)·N_K(T) ≤ N⁰_K(T), where N_K, N⁰_K are ζ_K's strip and on-line counts with
multiplicity.

**Theorem 2 (distinct, 5/6, with defect).** Assume H and hEχdStrip :
`EpsLowerDistinctStripCum (multOf fχ) (5/6)`. Then for every ε > 0, for all large T,
(5/6 − ε)·N_K(T) ≤ D_K(T) + commonStrip(ζ, fχ)(T), with D_K the distinct strip count.

**Theorem 3 (distinct, 5/6, negligible common zeros).** Assume further hCZStrip: for
every ε > 0, eventually commonStrip(ζ, fχ)(T) ≤ ε·N_K(T). Then
`EpsLowerDistinctStripCum (multOf fK) (5/6)`.

**The ζ-column inputs and their premises.** The two transfer lemmas
`epsLowerCum_zeta_of_V2d4` and `epsLowerDistinctStripCum_zeta_of_V2d5` derive
`EpsLowerCum (multOf riemannZeta) (2/3)` from `simple_proportion_d4` (every simple
on-line zero is a strip zero of multiplicity one; V2's `zeroCount` coincides with this
article's `countCum` under the count identification; 2/3 ≤ 0.6725 by `norm_num`), and
the distinct analogue from `distinct_proportion_d5` (5/6 ≤ 0.83625). Their premises are
the proportion endpoint plus two classical structural conditions on ζ — hntopζ (zero
order ≠ ⊤) and hfinζ (window finiteness) — which the landing theorems carry explicitly
as binders; the endpoint premise itself is filled there by the imported, kernel-verified
theorems `V2d4_endpoint`/`V2d5_endpoint`. No certificate binder and no `native_decide`
appears anywhere in the dependency tree of Theorems 1–3.

**Remark (v1's certificate route).** v1 obtained the same shape with the ζ column from
Knausgård's certified 0.67353… / 0.83900 constants behind an opaque `LocalInequality`
certificate checked by external C++/Python tooling. Those constants are *stronger* but
the route is tool-conditional; the imported endpoints are weaker per constant but rest
only on kernel-verified theorems plus the two structural conditions. The v1 landing
theorems `zetaK_two_thirds_landed`, `zetaK_distinct_five_sixths_landed`,
`…_of_negligible` (`research/pilots/42/M2b.lean:1062`, `:1081`, `:1121`, with the
hCert/hK673/hK839 binders) remain on disk, all axiom lists within
{propext, Classical.choice, Quot.sound} (prints
`research/pilots/42/logs/axcheck-final.log:731–733`; build
`research/pilots/42/logs/m2b_run6.log:13`). The hypothesis form (donor endpoints as
premises hV2d4/hV2d5) is preserved and verified
(`research/pilots/42/logs/M4b-fallback-GREEN.lean`) so the pure-hypothesis statement
remains available wherever the donor build is not.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876, Thm 1.1 / Cor 1.3 | for a *fixed quadratic* K, *under GRH*, as T → ∞: > 45% of zeros are *distinct* (SDP method) | ours: on-line proportions with multiplicity (Thm 1) and 5/6-class distinct up to an explicit defect (Thm 2); hypothesis shape is the χ-column transcription binder plus classical structural conditions (§3), not GRH; not comparable as unconditional-vs-unconditional |
| Lamzouri arXiv:2609.02882 / AxiomMath ZetaZerosV2 `Main.lean:130,149` | ζ-only proportions: > 0.6725 simple on-line, > 0.83625 distinct (kernel-verified) | the ζ column of our assembly, imported; no ζ_K or product statement there |
| Knausgård arXiv:2609.33043, arXiv:2610.08965 | ζ constants 0.67353… / 0.83900 (distinct = 1645064/1960733), formal, behind an externally checked certificate layer (author-disclosed: three axioms beyond Mathlib, one per inequality, native_decide-class — bibliography card C.4, `research/qa/iter4-review/r7-bib-cards.md`) | stronger constants, tool-conditional route; superseded here as consumption route, retained as v1 record |
| Bansal–Maji arXiv:2507.18121 (found in the 2026-11-16 arXiv sweep, `research/qa/iter4-review/r2-discovery-strength.md` §5, query 2) | Hardy-type *infinitude* of on-line zeros for zeta functions of any number field | infinitude, not positive proportion; no multiplicity/distinct statements |
| article 75 (this project) | the n+1-factor generalization of Thms 1–2 to abelian towers | Thms 1–3 here are its n = 2 instances, with the ζ column fed by the same imported endpoints |

Scope statement: "first on-line zero-proportion statements for a number-field zeta
function" means first among the corpora surveyed (mathlib, tauceti, the six AxiomMath
repositories, openai-math, anthropics) and the informal literature searched (arXiv
full-text queries recorded in `research/qa/iter4-review/r2-discovery-strength.md` §5,
queries 1–2). The assembly mathematics itself is corollary-level; the claim is about
the statement class, not the difficulty.

## 5. Proofs

**ζ column.** See §3, the ζ-column inputs and their premises. The denominators are
eventually positive (0.6725 < 0 is false, so the ratio is defined for large T).

**Multiplicities add.** The factorization holds on Re s > 1; multiplying by (s − 1)
removes the common pole and the identity principle extends it to ℂ \ {1}
(`funEq_of_factorization`). At every strip point ρ ≠ 1, `multOf_mul` gives
mult fK ρ = mult ζ ρ + mult fχ ρ; window counts are finite sums over finite supports,
so N_K = N_ζ + N_χ and N⁰_K = N⁰_ζ + N⁰_χ.

**Theorem 1.** Both summands satisfy `EpsLowerCum · (2/3)` (ζ by the transfer lemma,
fχ by hEχ); take T₀ = max of the two thresholds and add (ε is shared):
(2/3 − ε)·N_K = (2/3 − ε)·N_ζ + (2/3 − ε)·N_χ ≤ N⁰_ζ + N⁰_χ = N⁰_K.

**Theorem 2.** Distinct counts satisfy inclusion–exclusion
D_K = D_ζ + D_χ − commonStrip; assembling the distinct bounds for the two factors gives
the inequality with the defect carried (`assemble_eps_defect_strip_cum`,
`research/pilots/42/M4a.lean:1023`).

**Theorem 3.** Split ε = ε/2 + ε/2 and absorb the defect with hCZStrip. ∎

**Why hCZStrip is the honest open frontier.** A common zero of ζ and L(·,χ_D) is a zero
of ζ_K of multiplicity ≥ 2; no per-function statistic of ζ or of L(·,χ_D) can bound the
coincidence count (the seam analysis — `research/pilots/20-seam-analysis.md`, the
companion note of article 20 v2 — shows hCZ follows from S₁ = o(N) plus density-zero
multiplicity for each factor, both open). hCZStrip is conjecture-grade
(`research/pilots/20-hCZ-NOTE.md`).

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 | `zetaK_two_thirds_landed_of_V2` | `research/pilots/42/M4b.lean:1479` (file 1,571 lines; 70 theorem declarations on disk, re-measured) | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/42/logs/m4b2-axcheck-run1.log:139` |
| Thm 2 | `zetaK_distinct_five_sixths_strip_landed_of_V2` | `research/pilots/42/M4b.lean:1497` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/42/logs/m4b2-axcheck-run1.log:140` (name wraps over two lines); sweep-of-record extract `research/pilots/42/logs/axcheck-c2-final.log:8` |
| Thm 3 | `zetaK_distinct_five_sixths_strip_landed_of_V2_of_negligible` | `research/pilots/42/M4b.lean:1535` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/42/logs/m4b2-axcheck-run1.log:141` (wrapped); `research/pilots/42/logs/axcheck-c2-final.log:8` |
| ζ-column inputs | `epsLowerCum_zeta_of_V2d4`, `epsLowerDistinctStripCum_zeta_of_V2d5` | `research/pilots/42/M4b.lean:1404`, `:1439` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/42/logs/m4b2-axcheck-run1.log:211`, `:212` |
| imported endpoints | `ZetaZeros.simple_proportion_d4`, `ZetaZeros.distinct_proportion_d5` | `axiommath/ZetaZerosV2/ZetaZeros/Main.lean:130`, `:149` | ⊆ {propext, Classical.choice, Quot.sound} (printed from the consumer side via `V2d4_endpoint`/`V2d5_endpoint`, `M4b.lean:1390`, `:1396`) | `research/pilots/42/logs/m4b2-axcheck-run1.log:144–145`; donor-tree sweep `research/pilots/42/logs/axcheck-c2-final.log:8` and `research/feasibility/probe/logs/stepB-c2-m4b-donor.log:131–132`; build audit `research/feasibility/axiommath-donor-probes.md` §G2, `research/feasibility/VERIFICATION-LEDGER.md` §9.F |
| strip-distinct vocabulary | `distinctCountCum`, `EpsLowerDistinctStripCum`, `commonStripCum`, `assemble_eps_defect_strip_cum` | `research/pilots/42/M4a.lean:820`, `:837`, `:826`, `:1023` (file 1,194 lines, 54 public theorems, re-measured) | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/42/logs/m4-axcheck-run1.log:58–68` (`assemble_eps_defect_strip_cum` at `:68`); build `research/pilots/42/logs/m4-run2.log:2`; sweep `research/pilots/42/logs/axcheck-c2-final.log:7` — 57 axiom-lines, 0 sorryAx |
| hypothesis form of Thms 1–3 | Thms 1–3 with hV2d4/hV2d5 as premises | `research/pilots/42/logs/M4b-fallback-GREEN.lean` (1,560 lines; on disk unchanged, 85,641 bytes) | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/42/logs/m4b-axcheck-run1.log:2` — 68 distinct theorems (66 + 2 `@[simp]`), 0 sorryAx; prints `:20–21`; build `research/pilots/42/logs/m4b-run2.log:2` |

## 7. Limitations and open problems

1. **The χ column: a proof port, not an open analytic problem.** hEχ / hEχdStrip
   transcribe zeta23's Theorem E in cumulative-window form. In zeta23 the theorem is
   proved with no analytic hypotheses: the 2/3 bound `thmE_A₀`
   (`Zeta23/ThmE/Final.lean:93`; its right-hand side counts *distinct* critical-line
   points, which undercounts the with-multiplicity on-line count, so it dominates
   hEχ's content), the 2/3 simple-and-on-line multiplicity form `thmE_B₀_mult`
   (`Zeta23/ThmE/Mult.lean:324`), and the 5/6 distinct bound `thmE_C₀_mult`
   (`Zeta23/ThmE/Mult.lean:333`). An axiom audit of the transitive Theorem-E chain at
   the donor pin (Lean v4.33.0-rc2, mathlib `51e6992e`) printed all five links within
   {propext, Classical.choice, Quot.sound}, 0 sorryAx
   (`research/pilots/zeta23e/logs/zeta23e-p0-run1.log:190–194`; hygiene verdict
   `:14–18`). What separates Theorems 1–2 from unconditional theorems is therefore a
   substrate gap, not analytic mathematics: port the zeta23 proofs from Lean
   v4.33.0-rc2 / mathlib `51e6992e` to this project's pin (mathlib `ff2494ea`, Lean
   v4.36.0-rc2) and adapt the dyadic windows (T, 2T] of the donor statements to the
   cumulative windows (0, T] used here. (zeta23's `Challenge.lean:131–229` restates
   these theorems as challenge targets with deliberate `sorry` proofs; the proved
   declarations above are the citation of record.)
2. **hCZStrip is the one genuinely open hypothesis** (see §5); it is conjecture-grade.
   Only Theorem 2 is free of it.
3. Window finiteness (hfinK, hfinζ, hfinχ) and the ⊤-order exclusions (hntopζ,
   hntopχ) are carried as binders in H and in the ζ-column transfer lemmas; classically
   true, not formalized here.
4. The imported constants' margins over 2/3 and 5/6 (≈ 0.0058, ≈ 0.0029) come from the
   donor; improvements are the donor's to make. Lamzouri's paper also proves a
   **simple-or-on-line ≥ 0.8876** endpoint that ZetaZerosV2 does not export
   (bibliography card C.3, `research/qa/iter4-review/r7-bib-cards.md`) — a future
   endpoint shape for this assembly, not consumable today.
5. Beyond quadratic K: the Artin/abelian factorization and per-component Theorem E
   bounds are article 75's schema; its ℚ-instantiation of this same ζ-column import is
   the next step.

## 8. Prior work and references

**Literature.** Y. Lamzouri, arXiv:2609.02882. K. Knausgård, arXiv:2609.33043,
arXiv:2610.08965. L. Alpöge, A. Furman, arXiv:2608.13637 (the method zeta23
formalizes). D. de Laat, L. Rolen, Z. Tripp, I. Wagner, arXiv:1908.04876 (scope as in
§4 — GRH, fixed quadratic, asymptotic, distinct). Bansal–Maji, arXiv:2507.18121.
R. Majdoddin, arXiv:2610.17420 (independent build-out; the certificate-binder template
applies to it).

**Project artifacts.** `research/pilots/42/` (six Lean files plus the hypothesis-form
copy), logs under `research/pilots/42/logs/`; v1 article and 42-M4 (superseded by this
file); article 75 (n+1-factor schema); article 20 v2 (the interface) and its companion
seam note `research/pilots/20-seam-analysis.md`;
`research/candidates/42-zeta-k-two-thirds-product-assembly.md`;
`research/feasibility/axiommath-donor-probes.md` §G2;
`research/feasibility/VERIFICATION-LEDGER.md` §9.F; the absence-survey record
`research/qa/iter4-review/r2-discovery-strength.md` §5 and bibliography cards
`research/qa/iter4-review/r7-bib-cards.md` (C.3, C.4); zeta23 (sibling checkout,
read-only): proved Theorem E at `Zeta23/ThmE/Final.lean:93` (`thmE_A₀`) and
`Zeta23/ThmE/Mult.lean:324/:333` (`thmE_B₀_mult`/`thmE_C₀_mult`), donor-pin axiom audit
`research/pilots/zeta23e/logs/zeta23e-p0-run1.log` — `Challenge.lean:131–229` is the
challenge-statement file (deliberate `sorry` proofs), not a proof source; tauceti
`TauCeti/NumberTheory/LFunctions/DedekindZeta/` (factorization source);
AxiomMath ZetaZerosV2 `ZetaZeros/Main.lean:130,149`.
