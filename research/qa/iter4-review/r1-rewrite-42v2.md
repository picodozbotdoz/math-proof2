# PROPOSAL (R1, iteration-4 review) — Article 42 v2: merged 42 + 42-M4

**This is a proposal file, not a live article.** Target path at swap time:
`research/articles/42-quadratic-dedekind-zeta-zero-proportions.md` (replaces v1 in place;
`42M4-zetaK-proportions-unconditional-zeta-column.md` is retired and its pointer row
removed from the README). Built on `research/articles/TEMPLATE-iter4.md`. Evidence cells
were filled 2026-11-16 from R3's landed verification-integrity audit
(`r3-verification-integrity.md` §1.2, §2, §4 — cites of the form "[R3 §x]" below); the
three remaining per-declaration print-line slots are marked **[R3-TABLES]** and get
filled from R3's `r3-verification-tables.md` when it lands. Every other claim is carried
from the v1/42-M4 articles and was citation-verified in
`research/qa/iter4-review/r1-articles-editorial.md` §4 (2026-11-16).

Editorial deltas vs v1 + 42-M4 (all traceable to the R1 audit):
- one article instead of three overlapping files (42 v1, 42-M4, and 75 §6's pointer web);
- the false freeze claim (42-M4:5–6 "kept frozen … and is cited, not edited") replaced by
  the true edit history (§0 below, commits `c540682` vs `4e19304`);
- the two bracketed errata (42 v1 :29–31 and :152–157) eliminated — the DLRT comparison is
  written correctly once, in §4;
- per-theorem status rows in the closed TEMPLATE-iter4 vocabulary; the ζ-column
  discharge is PROVED-UNCONDITIONAL and the χ-column conditionality is in the status row,
  not buried (fixes 42-M4:11's "Status: PROVED, FINAL." over conditional theorems);
- §6 is a table-only formal record; the G2 build story, diffstats and sweep narration
  move out of the article (pointers only);
- terminology: "zero proportions", never "zero-density" (R2 fix,
  `r2-discovery-strength.md` §3 item 6 — "zero-density" denotes N(σ,T)-bounds in the
  literature; these are on-line proportion lower bounds).

---

# Critical-Line Zero Proportions for Quadratic Dedekind Zeta Functions: a Two-Column Assembly, Unconditional in the ζ Column

*kind: DISCOVERY-CONDITIONAL · date: 2026-11-16 (v2; v1 2026-11-09) · supersedes:
`42-quadratic-dedekind-zeta-zero-proportions.md` (v1 + its 2026-11-14 erratum patch) and
`42M4-zetaK-proportions-unconditional-zeta-column.md` (2026-11-14) · artifacts:
`research/pilots/42/{M1,M2a,M3,M2b,M4a,M4b}.lean`,
`research/pilots/42/logs/` (runs + axchecks),
`research/pilots/42/logs/M4b-fallback-GREEN.lean`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| ζ-column input `EpsLowerCum (multOf riemannZeta) (2/3)` and distinct analogue | PROVED-UNCONDITIONAL | none (imported donor theorems) | `m4b2-axcheck-run1.log:139–145` — both donor endpoint prints (`ZetaZeros.simple_proportion_d4`, `distinct_proportion_d5`) triad; header verdict `:2` GREEN, triad-only, 98 prints / 72 names [R3 §1.2] |
| Thm 1 `zetaK_two_thirds_landed_of_V2` | PROVED-CONDITIONAL | H (§3 structural list) + hEχ : `EpsLowerCum (multOf fχ) (2/3)` | `m4b2-axcheck-run1.log:139–145`; statement form `M4b.lean:1479–1492` — no hCert/hK673/hK839/hV2 binder, ζ column fed `V2d4_endpoint` inline at `:1492` [R3 §1.2] |
| Thm 2 `zetaK_distinct_five_sixths_strip_landed_of_V2` | PROVED-CONDITIONAL | H + hEχdStrip : `EpsLowerDistinctStripCum (multOf fχ) (5/6)` | statement form `M4b.lean:1497–1511` (fed `V2d5_endpoint` at `:1513`); verdict of record `42/logs/axcheck-c2-final.log:8` — donor-tree run OK, 80 axiom-lines, 74 print-sets all triad, 0 sorryAx [R3 §1.2]; exact print line [R3-TABLES] |
| Thm 3 `zetaK_distinct_five_sixths_strip_landed_of_V2_of_negligible` | PROVED-CONDITIONAL | H + hEχdStrip + hCZStrip (common-strip-zeros negligible; conjecture-grade) | statement form `M4b.lean:1535–1549` (adds `hCZStrip`, disclosed); same donor-tree verdict of record [R3 §1.2]; exact print line [R3-TABLES] |
| binder-only fallback of Thms 1–3 | PROVED-CONDITIONAL | H + hV2d4 + hV2d5 (donor endpoints as hypotheses) | `m4b-run2.log` GREEN + `m4b-axcheck-run1.log` 68/68 triad; fallback file byte-exact on disk (85,641 bytes) [R3 §1.2] |

## Abstract

For a quadratic field K, ζ_K(s) = ζ(s)·L(s, χ_D). We prove in Lean (mathlib `ff2494ea`,
Lean v4.36.0-rc2; axioms ⊆ {propext, Classical.choice, Quot.sound}) that if the Dirichlet
column satisfies the on-line proportion bound `EpsLowerCum (multOf L(·,χ_D)) (2/3)` —
zeta23's Theorem E, carried as an explicit hypothesis, not proved here — then at least
2/3 of the nontrivial zeros of ζ_K up to height T, counted with multiplicity, lie on the
critical line (Theorem 1); the analogous 5/6 statements for distinct zeros hold with an
explicit common-zero defect (Theorem 2) and, under a negligibility hypothesis on common
zeros, without it (Theorem 3). The ζ-column input is not a hypothesis: it is imported
unconditionally from AxiomMath ZetaZerosV2 (Lamzouri endpoints 0.6725 / 0.83625,
axiom-audited on our pin). These are the first on-line zero-proportion statements for a
number-field zeta function in any formal corpus we surveyed; the nearest informal
result (de Laat–Rolen–Tripp–Wagner) is GRH-conditional, fixed quadratic, and about
distinct zeros. The mathematics is corollary-level assembly; the contribution is the
statement class, the exact defect vocabulary, and the verified two-column schema.

## 0. Version history (replaces the v1/42-M4 record)

v1 (2026-11-09) stated the assembly with both columns as binders, the ζ column taken
from Knausgård's certified constants through a certificate binder. On 2026-11-14,
commit `c540682` (02:31) patched v1's DLRT comparison with inline errata (the
main-run reading of DLRT as unconditional was wrong: DLRT is GRH-conditional, fixed
quadratic K, T→∞ asymptotic). Later that morning, commit `4e19304` (09:19) finalized
42-M4, whose byline claimed v1 "is kept frozen … and is cited, not edited" — already
false when written. This v2 merges both articles, removes the errata brackets by
stating the comparison correctly once (§4), and records that the Knausgård constants
remain the stronger *conditional* ζ-side route (0.67354 / 0.83900), superseded only as
a consumption route.

## 1. Introduction

Lower bounds for the proportion of zeros of ζ on the critical line go back to Selberg,
Levinson (> 1/3) and Conrey (> 2/5); Lamzouri's theorem, formalized in AxiomMath's
ZetaZerosV2, gives > 0.6725 simple-and-on-line and > 0.83625 distinct. For Dedekind zeta
functions of K ≠ ℚ nothing formal existed before this programme, and informally the
nearest result is DLRT's > 45% *distinct* zeros for a *fixed quadratic* K *under GRH*.
The zeta23 corpus proves the Alpöge–Furman-type proportion theorems for ζ and for
primitive Dirichlet L-functions; tauceti provides the continuation and the
factorization ζ_K = ζ·L(·,χ_D) on Re s > 1 for quadratic K. Multiplicities add under
products, so window counts add and proportions assemble: that is the whole mechanism,
and this article assembles it once, with both columns accounted for honestly.

**What is new here.** (a) The statement class: first on-line zero-proportion statements
for a number-field zeta function (formal or informal, within the corpora and literature
surveyed — R2 re-ran the absence queries 2026-11-16, `r2-discovery-strength.md` §5 q1–q2).
(b) The defect vocabulary: the distinct-count statement carries an explicit common-zero
defect, a quantity no corpus or paper studies. (c) The ζ-column discharge: the first
ζ_K proportion statements whose ζ column is unconditional *inside Lean*, via the
audited ZetaZerosV2 import. **What is not new:** any analytic mathematics — the assembly
is corollary-level, and we say so; the χ column remains exactly as open as zeta23's
Theorem E.

## 2. Setting

Fix fK, fχ : ℂ → ℂ (intended: fK = ζ_K, fχ = L(·, χ_D)). `multOf f ρ := analyticOrderNatAt
f ρ`. Windows are cumulative: `stripWindow 0 T = {ρ | 0 < Re ρ < 1, 0 < Im ρ ≤ T}`,
`lineWindow 0 T = {ρ | Re ρ = 1/2, 0 < Im ρ ≤ T}`. `countCum z T` and `countOnCum z T`
sum a multiplicity function z over the two windows. `EpsLowerCum z c` :⟺ ∀ ε > 0, ∃ T₀,
∀ T ≥ T₀, (c − ε)·countCum z T ≤ countOnCum z T (the division-free liminf form of
"≥ c of the zeros lie on the line"). `FactorizationOnHalfPlane fK fζ fχ` :⟺ ∀ s,
Re s > 1 → fK s = fζ s · fχ s.

M4a's distinct-count vocabulary: `distinctCountCum z T` (number of distinct strip zeros
up to T), `EpsLowerDistinctStripCum z c` (ε-form ratio bound with the distinct count as
numerator), `commonStripCum z w T` (strip points that are zeros of both factors).

Donor endpoints (imported, `axiommath/ZetaZerosV2/ZetaZeros/Main.lean:130` and `:149`;
statements re-verified line-exact 2026-11-16, R1 audit §4):
`ZetaZeros.simple_proportion_d4` : ∃ T₀, ∀ T ≥ T₀, 0.6725 < simpleOnLineCount T /
zeroCount T; `ZetaZeros.distinct_proportion_d5` : the same with 0.83625 <
distinctZeroCount T / zeroCount T.

## 3. Main results

Structural hypothesis set **H** (all classical, none discharged except where noted):
- window finiteness of `multOf fK`, `multOf riemannZeta`, `multOf fχ`;
- fK and fχ analytic at every s ≠ 1; (s − 1)·fK(s) and (s − 1)·ζ(s)·fχ(s) analytic at 1;
- `analyticOrderAt fχ ρ ≠ ⊤` for all ρ (fχ not locally zero); the same for ζ is
  discharged inline (`analyticAt_riemannZeta`);
- `FactorizationOnHalfPlane fK riemannZeta fχ`.

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

**ζ-column discharge (unconditional).** `epsLowerCum_zeta_of_V2d4` derives
`EpsLowerCum (multOf riemannZeta) (2/3)` from `simple_proportion_d4` (every simple
on-line zero is a strip zero of multiplicity one; V2's `zeroCount` is the pilot's
`countCum` under the identification glue; 2/3 ≤ 0.6725 by `norm_num`), and the distinct
analogue from `distinct_proportion_d5` (5/6 ≤ 0.83625). No certificate binder and no
`native_decide` appears anywhere in the dependency tree of Theorems 1–3.

**Remark (v1's certificate route).** v1 obtained the same shape with the ζ column from
Knausgård's certified 0.67354 / 0.83900 constants behind an opaque `LocalInequality`
certificate checked by external C++/Python tooling. Those constants are *stronger* but
the route is tool-conditional; the donor import is weaker per constant but unconditional.
The binder-only fallback (donor endpoints as hypotheses hV2d4/hV2d5) is preserved and
verified (`M4b-fallback-GREEN.lean`) so the pure-hypothesis form remains available
off-pin.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876, Thm 1.1 / Cor 1.3 | for a *fixed quadratic* K, *under GRH*, as T → ∞: > 45% of zeros are *distinct* (SDP method) | ours: on-line proportions with multiplicity (Thm 1) and 5/6-class distinct up to an explicit defect (Thm 2); hypothesis shape is certificate-conditional (χ column), not GRH; not comparable as unconditional-vs-unconditional |
| Lamzouri arXiv:2609.02882 / AxiomMath ZetaZerosV2 `Main.lean:130,149` | ζ-only proportions: > 0.6725 simple on-line, > 0.83625 distinct (kernel-verified) | the ζ column of our assembly, imported; no ζ_K or product statement there |
| Knausgård arXiv:2609.33043, arXiv:2610.08965 | ζ constants 0.67354 / 0.83900, formal, behind an externally checked certificate layer | stronger constants, tool-conditional route; superseded here as consumption route, retained as v1 record |
| Bansal–Maji arXiv:2507.18121 (found in R2's 2026-11-16 arXiv sweep, `r2-discovery-strength.md` §5 q2) | Hardy-type *infinitude* of on-line zeros for zeta functions of any number field | infinitude, not positive proportion; no multiplicity/distinct statements |
| article 75 (this project) | the n+1-factor generalization of Thms 1–2 to abelian towers | Thms 1–3 here are its n = 2 instances with the ζ column discharged |

Scope statement: "first on-line zero-proportion statements for a number-field zeta
function" means first among the corpora surveyed (mathlib, tauceti, the six AxiomMath
repositories, openai-math, anthropics) and the informal literature searched (arXiv
full-text queries recorded in R2 §5 q1–q2). The assembly mathematics itself is
corollary-level; the claim is about the statement class, not the difficulty.

## 5. Proofs

**ζ column.** See §3, ζ-column discharge. The denominators are eventually positive
(0.6725 < 0 is false, so the ratio is defined for large T).

**Multiplicities add.** The factorization holds on Re s > 1; multiplying by (s − 1)
removes the common pole and the identity principle extends it to ℂ \ {1}
(`funEq_of_factorization`). At every strip point ρ ≠ 1, `multOf_mul` gives
mult fK ρ = mult ζ ρ + mult fχ ρ; window counts are finite sums over finite supports,
so N_K = N_ζ + N_χ and N⁰_K = N⁰_ζ + N⁰_χ.

**Theorem 1.** Both summands satisfy `EpsLowerCum · (2/3)` (ζ by the discharge, fχ by
hEχ); take T₀ = max of the two thresholds and add (ε is shared):
(2/3 − ε)·N_K = (2/3 − ε)·N_ζ + (2/3 − ε)·N_χ ≤ N⁰_ζ + N⁰_χ = N⁰_K.

**Theorem 2.** Distinct counts satisfy inclusion–exclusion
D_K = D_ζ + D_χ − commonStrip; assembling the distinct bounds for the two factors gives
the inequality with the defect carried (`assemble_eps_defect_strip_cum`, M4a).

**Theorem 3.** Split ε = ε/2 + ε/2 and absorb the defect with hCZStrip. ∎

**Why hCZStrip is the honest frontier.** A common zero of ζ and L(·,χ_D) is a zero of
ζ_K of multiplicity ≥ 2; no per-function statistic of ζ or of L(·,χ_D) can bound the
coincidence count (article 20 analyzes this seam: hCZ follows from S₁ = o(N) plus
density-zero multiplicity for each factor — both open). hCZStrip is conjecture-grade
(`research/pilots/20-hCZ-NOTE.md`).

## 6. Formal record

| theorem / artifact | declaration | file | axioms | evidence |
|---|---|---|---|---|
| strip-distinct vocabulary | `distinctCountCum`, `EpsLowerDistinctStripCum`, `commonStripCum`, `assemble_eps_defect_strip_cum` | `research/pilots/42/M4a.lean` (1,194 lines, 54 public theorems) | ⊆ triad | `m4-run2.log:2` GREEN; sweep `42/logs/axcheck-c2-final.log:7` — AxPilot42_M4a OK, 57 axiom-lines, 0 sorryAx [R3 §1.2] |
| ζ-column discharge | `epsLowerCum_zeta_of_V2d4` (+ distinct analogue) | `research/pilots/42/M4b.lean` | ⊆ triad | covered by the 98-print full axcheck (`m4b2-axcheck-run1.log`, header `:2`); per-decl print line [R3-TABLES] |
| Thm 1 | `zetaK_two_thirds_landed_of_V2` | `research/pilots/42/M4b.lean` (1,571 lines; 70 theorem declarations on disk — the v1 articles' "68" was an undercount, R3 §4 F4) | ⊆ triad | `m4b2-axcheck-run1.log:139–145` [R3 §1.2] |
| Thm 2 | `zetaK_distinct_five_sixths_strip_landed_of_V2` | idem | ⊆ triad | donor-tree verdict of record `axcheck-c2-final.log:8`; exact print line [R3-TABLES] |
| Thm 3 | `zetaK_distinct_five_sixths_strip_landed_of_V2_of_negligible` | idem | ⊆ triad | donor-tree verdict of record `axcheck-c2-final.log:8`; exact print line [R3-TABLES] |
| donor endpoints | `ZetaZeros.simple_proportion_d4`, `distinct_proportion_d5` | `axiommath/ZetaZerosV2/ZetaZeros/Main.lean:130,149` | ⊆ triad (printed from the consumer side) | `m4b2-axcheck-run1.log:139–145` [R3 §1.2] |
| binder-only fallback | Thms 1–3 with hV2d4/hV2d5 | `research/pilots/42/logs/M4b-fallback-GREEN.lean` (1,560 lines; byte-exact, 85,641 bytes) | ⊆ triad | `m4b-run2.log` GREEN + `m4b-axcheck-run1.log` 68/68 triad [R3 §1.2] |
| v1 certificate route | `zetaK_two_thirds_landed` etc. | `research/pilots/42/{M1,M2a,M3,M2b}.lean` | ⊆ triad | `42/logs/axcheck-final.log:731,772` (M2b landings triad); LoC table 337/612/453/1150 matches disk exactly [R3 §2] |

Donor build and hygiene audit (G2: full ZetaZerosV2 rebuild on our pin, 13 audited
theorems triad-clean) and the M4b donor-tree sweep run are recorded in
`research/feasibility/axiommath-donor-probes.md` §G2 and
`research/feasibility/VERIFICATION-LEDGER.md` §9.F — not narrated here.

## 7. Limitations and open problems

1. **The χ column is the open core.** hEχ / hEχdStrip transcribe zeta23's Theorem E;
   they are hypotheses, not proved. Discharging them needs zeta23's proofs ported from
   Lean v4.33 (statement port measured at ≈ 0 cost; proof port is the cost).
2. **hCZStrip is conjecture-grade** (see §5). Only Theorem 2 is free of it.
3. Window finiteness and the ⊤-order exclusions are carried in H; classically true,
   not formalized here.
4. The unconditional constants' margins over 2/3 and 5/6 (≈ 0.0058, ≈ 0.0029) come from
   the donor; improvements are the donor's to make.
5. Beyond quadratic K: the Artin/abelian factorization and per-factor Theorem E — that
   is article 75's schema; its ℚ-instantiation of this very discharge (N2) is the
   carried next step.

## 8. Prior work and references

**Literature.** Y. Lamzouri, arXiv:2609.02882. K. Knausgård, arXiv:2609.33043,
arXiv:2610.08965. L. Alpöge, A. Furman, arXiv:2608.13637 (the method zeta23
formalizes). D. de Laat, L. Rolen, Z. Tripp, I. Wagner, arXiv:1908.04876 (scope as in
§4 — GRH, fixed quadratic, asymptotic, distinct). Bansal–Maji, arXiv:2507.18121.
R. Majdoddin, arXiv:2610.17420 (independent build-out; the certificate-binder template
applies to it).

**Project artifacts.** `research/pilots/42/` (six Lean files + fallback), logs under
`research/pilots/42/logs/`; v1 article and 42-M4 (superseded by this file; edit history
in §0); article 75 (n+1-factor schema); article 20 (the common-zero seam);
`research/candidates/42-zeta-k-two-thirds-product-assembly.md`;
`research/feasibility/axiommath-donor-probes.md` §G2;
`research/feasibility/VERIFICATION-LEDGER.md` §9.F;
zeta23 `Challenge.lean:131–229` (Theorem E source); tauceti
`TauCeti/NumberTheory/LFunctions/DedekindZeta/` (factorization source);
AxiomMath ZetaZerosV2 `ZetaZeros/Main.lean:130,149`.
