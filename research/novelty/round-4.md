# Novelty verification — round 4 (Cycle 2) — SKELETON, PART 1

Lane A5 ("novelty", Cycle 2), 2026-11-13. Scope of PART 1: (a) the Cycle-2 novelty
protocol (same discipline as rounds 1–3, extended to the AxiomMath corpus), and
(b) PRE-REGISTERED nearest-miss searches for the three zones already visible from
`survey/axiommath.md` §4 hooks H1–H4 and the Cycle-2 addendum — run today, results
recorded, so the 70-series dossiers (lanes A2/A4 zoning, A9 writing) inherit a
documented prior-art baseline instead of a blank page. PART 2 (when the 70-series
dossiers land): DOSSIER-CHECKED per-dossier query runs, N-adjusts, and the
consolidated verdict table feeding the Cycle-2 TRIAGE addendum. Labels carried
over: **DOSSIER-CHECKED / PRE-CHECK / NOT-YET-LANDED**; tiers **HOT / WARM / COLD**
as in `VERDICTS.md`.

## §0. Cycle-2 protocol (method additions on top of rounds 1–3)

Same discipline as rounds 1–3 (`round-1.md` method note, `round-2.md` items 7–10,
`round-3.md` items 11–12): every claim gets documented searches (query + source +
verdict), nearest misses cited exactly, absence is only weak evidence, hot clusters
get depreciation clocks. Sources this round: **arXiv export API over https**
(`export.arxiv.org/api/query?…`), **WebFetch** (incl. non-arXiv venues),
**Semantic Scholar / zbMATH APIs** (round-2/3 recipes, still available), local
corpora via `rg` + the new v2 declaration index. zai-search MCP: **quota
exhausted again** (429 on both Pro and Std, 2026-11-13) — plan around it as in
round 1.

13. **v2 declaration index (new substrate, built this round)**:
    `research/qa/make-decl-index-v2.sh` → `research/qa/decl-index-v2.tsv`
    (2,940,110 rows, 13 corpora; zip alongside; gitignored like the v1 tsv).
    Same rg header pattern and therefore the same spec limits as v1 (ASCII names,
    prefixed headers excluded — see the v1 header caveats). Recipes:
    `cut -f4 research/qa/decl-index-v2.tsv | grep -xF 'NAME'` etc.
14. **hexagonmath.org is a new source venue** (the Cureton–Thorner paper lives
    there, NOT on arXiv — `au:Cureton` on arXiv finds nothing mathematical).
    For the quasi-RH cluster, sweep hexagonmath.org listings directly, not just
    arXiv; arXiv-only absence claims are unsound for that cluster.

### Carried-over caveat (openai-math vendored mathlib)

Unchanged from `INDEX.md:82` / v1 header: the OAI tree vendors mathlib-like
content (2.44M decls), so a TSV miss is NOT evidence of absence in openai-math —
always also `rg` `openai-math/lean/OAI/`, `openai-math/lean/ComparatorChallenges/`,
and `openai-math/preprints/` (manuscripts are not indexed at all).

### NEW caveats (AxiomMath corpus, v2 index)

1. **AxiomMath repos DEPEND on mathlib and on each other.** A name hit under an
   axiommath label may be a re-export, a re-namespaced port of a dependency, or an
   original theorem — the index does not distinguish. Before calling anything
   "axiommath-original", check (i) the enclosing `namespace` (e.g. everything under
   `DedekindZetaZeroFree.*`), (ii) the file's `import`s, (iii) whether the statement
   also appears under another corpus label. Conversely, a miss under axiommath
   labels is weak: these repos `import Mathlib` wholesale.
2. **DedekindZetaZeroFree depends on TauCeti → tauceti content appears TWICE**: once
   under `tauceti` and once re-namespaced inside dzzf's own tree (`namespace
   DedekindZetaZeroFree.TauCeti` — 56 files; `…LargeSieve.Vendor`). Its
   `vendor/class-field-theory` tree (FiniteAbelianGlobalReciprocityv2,
   upstream n-yamaguchi rev 58370e62 per `survey/axiommath.md:379`) is indexed as a
   SEPARATE corpus (`axiommath-vendor-cft`, 13,114 rows) and excluded from
   `axiommath-dzzf` rows, so dzzf's 22,662 rows are its own-tree declarations.
3. **ZetaZerosV2 vendors a divergent fork of ZetaZeros** (`ZetaZerosV2/ZetaZeros/` —
   same file names, many files edited, plus new `Analytic/`, `Landau/`): ZetaZeros
   names appear under BOTH labels with drift between them. Its manifest also pins
   PrimeNumberTheoremAnd, and PNT+ modules were ported onto its path during the
   bump (`feasibility/axiommath-bump/`).
4. **PrimeNumberTheoremAnd embeds an `IEANTN/` subtree** (Kadiri, BKLNW, CH2, eSHP,
   FKS2 trusted numerics — Tao-IEANTN-derived content indexed as `axiommath-pnt`)
   plus local `Mathlib/` override files (RiemannZetaHadamard, ZetaFunctionalEquation,
   …). IEANTN depreciation risk from round-2 §9(i) therefore ALSO attaches to the
   axiommath-pnt label.
5. **AreaLaw2D embeds `OpenAI/`** — restatements/3D-cylinder audit of the openai
   family-265 statements — so the openai-family-265 corpus bridge is already inside
   the axiommath corpus too (same-name rows under both labels are expected).

Per-corpus v2 counts (rows; builder ≈ 25 s wall): openai-math 2,439,960 · tauceti
242,275 · mathlib 184,207 · **axiommath-dzzf 22,662 · axiommath-vendor-cft 13,114 ·
axiommath-weil 8,625 · axiommath-arealaw2d 4,379 · axiommath-pnt 2,346 ·
axiommath-zetazeros-v2 435 · axiommath-zetazeros 276** · eth 10,148 · 3sum-apsp
6,795 · zeta23 4,888 — total 2,940,110. The six v1 corpora reproduce their v1
counts exactly (reproducibility check).

## §1. PRE-CHECK — Zone FF: Lamzouri-style simple-zero proportions for function-field zeta

**Zone statement shape** (from `survey/axiommath.md` H3, `bridges/function-field.md`
 forthcoming): proportion statements for the zeros of Z_X (zeta of curves/varieties
over 𝔽_q) — simple / distinct / simple-or-on-line — where "on the line" is FREE
(Weil RH is a theorem in-corpus: `Weil/DeligneWeilConjecture.lean:367
satisfiesWeilEstimate`), so the entire content is multiplicity structure
(distinctness of Frobenius eigenvalues). V2's Hilbert inequalities (2.3)–(2.6) are
statements about arbitrary conjugation-invariant multisets, hence a priori
applicable to Frobenius eigenvalue multisets (H3's observation).

**Pre-registered searches (run 2026-11-13):**

| # | Query | Source | Verdict |
|---|---|---|---|
| FF-1 | `all:"zeros of zeta functions of curves over finite fields"` | arXiv API | 0 entries (phrase too specific) |
| FF-2 | `abs:"simple zeros" AND abs:"function field"` | arXiv API | Only Bui–Florea 1605.07092 (hyperelliptic ensemble, 1-level density + pair correlation) + noise; NO proportion-of-simple-zeros theorem |
| FF-3 | `au:Rudnick AND abs:curve AND cat:math.NT` | arXiv API | Faifman–Rudnick 0803.3534 (CLT for zero counts in angle intervals, large genus); Rudnick 0811.3649 (high-power Frobenius traces vs USp(2g)) — statistics of counts/traces, NOT multiplicity proportions |
| FF-4 | `au:Waxman AND cat:math.NT` | arXiv API | No multiplicity paper; Rudnick–Waxman = primes in short intervals over function fields (confirmed via Perret-Gentil 1903.05491 abstract citing them); wrong quantity for this zone |
| FF-5 | `abs:"proportion of zeros" AND abs:simple` | arXiv API | ζ-side only: Lamzouri 2609.02882, DLRT 1908.04876 (ζ_K distinct via SDP, the dossier-42 nearest miss), 2105.07422 (Dirichlet critical-line zeros) — nothing function-field |
| FF-6 | `abs:"zeta function of a curve" AND abs:multiplicity` | arXiv API | **Suzuki 2610.41115 (2026-10-30), "A spectral theory of zeta functions of function fields"** — Hilbert spaces from the Weil quadratic form, self-adjoint extensions, eigenvalues → zero ordinates; NO proportions, but the method-neighbor of exactly the V2-port play, three weeks old |
| FF-7 | `abs:entropy/entropic AND function field / zeta zeros` | arXiv API | Nothing on zero multiplicities; nearest oddity: Salami–Shaska 2609.33162 (stacky heights "entropy" of weighted hypersurface zetas — a different quantity, weighted-projective factorization; cite only to close the "entropic" hint) |

**Classical anchors (from the searches + Katz–Sarnak, book-level):**
- **Katz–Sarnak 1999** (*Random Matrices, Frobenius Eigenvalues, and Symmetry*):
  in q→∞ family limits, monodromy forces USp/GOE-type zero statistics — simple
  zeros a.s. in the *limit*; a family-average proportion statement is classical in
  spirit, a *per-curve uniform* statement is not available from monodromy.
- **Faifman–Rudnick 0803.3534** and **Rudnick 0811.3649**: the fixed-q,
  genus→∞ regime is genuinely studied (variance/CLT of zero counts; trace moments
  agree with USp(2g) up to n ≈ 4g) — but no multiplicity proportions anywhere.
- **Bui–Florea 1605.07092**: 1-level density + pair correlation in the
  hyperelliptic ensemble — the pair-correlation input V2-style arguments would
  need on the function-field side EXISTS in ensemble form.

**Falsity trap (scoping discipline for A9):** a per-curve uniform "≥ c of the
zeros of Z_C are simple" is FALSE as stated — curves with supersingular-type
Jacobians (Frobenius eigenvalues equal up to sign, Jacobian ≅ E^g) have zeros of
multiplicity comparable to g, so the worst-case simple proportion is 0. Genus-2
supersingular Jacobians are classical; the "every genus" version of the example
needs an exact citation before any dossier asserts the trap quantitatively
[A9: verify — Moret-Bailly/Ibukiyama–Katsura-line]. Family-indexed or
trace-formula-bounded statements are the safe shapes.

**Preliminary verdict: WARM.** The proportion statements themselves are
unclaimed anywhere found (FF-2/FF-5/FF-6 all clean), and the on-line half being
free makes the zone genuinely different from the ζ-side race — but (i) Suzuki
2610.41115 shows third parties entering function-field zeta Hilbert-space methods
NOW; (ii) the falsity trap can silently produce a false candidate; (iii) the
AF-cluster actors (Lamzouri/Knausgård lineage) have not touched function fields
as of today — a month-scale clock like the ζ_K one is plausible. PART-2 runs the
dossier-level queries; mandatory nearest misses to cite: Suzuki 2610.41115,
Faifman–Rudnick 0803.3534, Rudnick 0811.3649, Bui–Florea 1605.07092,
Katz–Sarnak (book), and (distinct-proportion analogue) DLRT 1908.04876.

## §2. PRE-CHECK — Zone AL: area-law / inertia statements (rank concentration from spectral gap)

**Zone statement shape** (from H4, `bridges/area-law.md` forthcoming): bridge the
AreaLaw2D/openai family-265 area-law machinery to the matrix-inertia cluster
(dossiers 01–03: rank–trace, compression, inertia budgets) — e.g. eigenvalue-count
(inertia) concentration for gapped local Hamiltonians, defect-identity statements
for reduced density matrices / AGSP certificates, compression-stability of the
area law.

**Pre-registered searches (run 2026-11-13):**

| # | Query | Source | Verdict |
|---|---|---|---|
| AL-1 | `abs:"area law" AND abs:"spectral gap" AND abs:entanglement` | arXiv API | **Kuwahara 2610.15199 (2026-10-10): "The Rényi area law conjecture is false below α=1 in high dimensions"** + Anshu–Arad–Gosset-line cluster; Kuwahara's construction: finite-range, fixed local dimension, bounded interactions, UNIQUE ground state, UNIFORM gap, volume-law Rényi-α entanglement for all 0<α<1 |
| AL-2 | `au:Anshu AND au:Arad AND au:Harrow` | arXiv API | 0 entries under these tokens (FOCS-level 2D area law; the arXiv-present cousin is **Anshu–Arad–Gosset 2103.02492** "An area law for 2D frustration-free spin systems" + 1905.11337 subvolume law) |
| AL-3 | `abs:"Schmidt rank" AND abs:"spectral gap"` | arXiv API | No rank-concentration theorem; only Kuwahara 2610.15199 again (+noise) — i.e., the only arXiv literature at this intersection REFUTES the naive rank statement |
| AL-4 | `abs:"area law" AND abs:entanglement AND abs:"proof assistant"` | arXiv API | 0 — no formalization of any area law on arXiv (AreaLaw2D is the formal-first artifact, already an axiommath repo) |
| AL-5 | `abs:"approximate ground state projector"` | arXiv API | Abrahamsen–Tong–Bao–Su–Wiebe 2203.16012 (1D gauge/boson area law via AGSP) — AGSP framework is the classical technique nearest to "rank certificates from a gap" |
| AL-6 | `abs:"effective rank" AND abs:"ground state"` | arXiv API | 0 relevant — no effective-rank concentration statements found |
| AL-7 | local corpus | preprints tree | In-corpus anchors: **OAI265 "A-two-dimensional-area-law-from-a-global-spectral-gap" (2026-09-24)** = S_Ω(A) ≤ C·|∂_Λ A| for unique gapped ground states, general finite-range 2D; companion **"Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states" (2026-09-24)** = the REPRESENTATION conclusion (poly-bond PEPS) already derived from it "always with their full-system hypotheses" |

**Decisive negative datum (de-risks the zone):** by monotonicity S₀ ≥ S_α,
Kuwahara's volume-law Rényi-α (α<1) examples have log Schmidt rank = S₀ =
Ω(volume): **literal Schmidt-rank concentration from a 2D gap is FALSE** in the
general class (unique ground state + uniform gap included). The only surviving
concentration shape is effective rank w.r.t. von Neumann entropy (e^S ≤
e^{C·|∂A|}) — which is precisely the area law itself — and the PEPS companion
already converts it to an approximate-representation statement. Therefore any
70-series dossier here MUST be framed as: (a) effective-rank/inertia-of-ρ_A
statements (entropic, not literal rank), or (b) matrix-inequality cross-bridge
content (compression/projection/defect identities applied to the AGSP /
reduced-density-matrix layer — H4's junctions: `RankTrace.lean:163` vs
`CompressedInverse`/`ProjectionCompressionCfc`), NOT "rank concentration from
spectral gap" as a headline. A certified-negative dossier (à la 50: "the naive
statement is refuted by Kuwahara's class; the surviving effective statement is
OAI265") is also a legitimate outcome.

**Preliminary verdict: WARM.** The naive headline is REFUTED in the literature
(must not be proposed as-is — that is the main de-risk delivered by this
pre-check); the surviving cross-bridge statements (inertia/defect identities on
the AGSP–ρ_A layer; effective-rank forms) are unclaimed in every search and
un-formalized everywhere (AL-4: 0); but the informal ground is active (Kuwahara
2026-10-10, one month old) and the formal side's first mover (AreaLaw2D) is our
own donor corpus, so "first formal area law" framings are DEAD ON ARRIVAL —
novelty must be cross-bridge, not first-formal. Physlib dependency risk on our
pin (H4 caveat) constrains pilot feasibility. Mandatory nearest misses: Kuwahara
2610.15199, Anshu–Arad–Gosset 2103.02492 + 1905.11337, Abrahamsen et al 2203.16012,
OAI265 + PEPS companion (in-corpus), AAH (FOCS 2022, cite directly).

## §3. PRE-CHECK — Zone QR-D: quasi-RH discharge consequences (unconditional zero-confinement strips for ζ_K)

**Zone statement shape** (from H1 + the Cycle-2 addendum's donor-swap pilots):
use DedekindZetaZeroFree's Cureton–Thorner theorem (ζ_K ≠ 0 for Re s > 31/32,
every K; same for finite-order Hecke L) to discharge quasi-RH-shaped binders
unconditionally — strip-confinement transfers (pilots 20/50 lineage), effective
PNT-class consequences for number fields, zero-confinement windows. NOTE the
survey's working-premise correction (`survey/axiommath.md:422–428`): DZZF does
**not** discharge pilot 50's `hQRH` as written (openai's 7/8 = Re s > 0.875
half-plane strictly CONTAINS DZZF's 31/32 = Re s > 0.96875 one; the binder asks
for the bigger region). DZZF discharges only weakened (31/32) binders; its unique
value is ζ_K for general K and Hecke L beyond ℚ(√−3) — where openai has nothing.

**Pre-registered searches (run 2026-11-13):**

| # | Query | Source | Verdict |
|---|---|---|---|
| QR-1 | `abs:"Dedekind zeta" AND abs:"zero-free"` | arXiv API | Lee 2002.05456 (explicit zero-free region ζ_K, trig-polynomial + annealing); **Das–Gaba–Lee–Savalia–Wong 2506.19319 (2025)** (new explicit regions, small/large ordinates, refine Ahn–Kwon/Kadiri/Lee, extend Kadiri to all number fields); Das–Kadiri–Ng 2508.09480 (effective Chebotarev from them) |
| QR-2 | Cureton–Thorner source hunt (`au:Cureton`, README) | arXiv + repo | **Not on arXiv**: hexagonmath.org/2610.00200 (v1 2026-10-12, v2 2026-10-14), "A quasi-Riemann hypothesis for Dedekind zeta functions" — ζ_K zero-free Re s > 31/32 for ANY K, corollary for finite-order Hecke L "wherever holomorphic"; "proved and formalized in Lean using AxiomProver" (= the DedekindZetaZeroFree repo); strategy follows the Artin-primitive-root line (Re s > 1−10⁻⁶ over cyclotomic fields with μ₁₂), hardest part Kazhdan–Patterson metaplectic; **cites the OpenAI quasi-RH preprints (7/8 and 11/12) directly** |
| QR-3 | `abs:"quasi-Riemann"` | arXiv API | **Liu 2610.26835 (v1 2026-10-19, v2 2026-10-29)**: extends [Liu26a] (= 2610.12234, B_new = 0.8749570… for finite-order Hecke L over ℚ(√−3) + Dirichlet) by class-field descent to every (K,η) with metabelian normal closure — incl. every finite-order character over every abelian field; boundary B♭ = 0.8748866…; the "optimality in the specified exponent comparison system" framing is contested-constants territory, not a uniform 31/32 |
| QR-4 | `au:Thorner AND abs:zeros` | arXiv API | Thorner 2608.12257 (2026-08-12): power-sums approach, GL(n) standard AND Rankin–Selberg L zero-free σ ≥ 1 − c·C^{−ε} (ineffective constants) — the machinery family CT builds on |
| QR-5 | `au:Trudgian AND abs:Dedekind` | arXiv API | Trudgian 2012 (RvM-formula error bounds for Dirichlet L AND ζ_K); **Trudgian–Zuniga Alterman 2610.16010 (2026-10-12): "Low Lying Zeros of Dedekind Zeta Functions"** — h(K) < 0.58 (first published improvement over Hoffstein 1979 / Odlyzko-announced 0.54), plus a ≥ c·n_K zero-count clause — ζ_K-zero papers are landing monthly |
| QR-6 | classical anchors | books | Broughan, *Equivalents of the Riemann Hypothesis I* (2009) — zero-free-region chapters for ζ (the round-3 §5 anchor); Trudgian's ζ-region updates; Lagarias–Odlyzko 1977 / Das–Kadiri–Ng 2025 for effective consequences. A UNIFORM 1−δ strip for all K is stronger than anything classical (it kills exceptional/Siegel-type zeros for ζ_K); the informal side's best uniform-ish objects are the explicit d_K-dependent regions (QR-1) and the metabelian 0.8749 half-planes (QR-3) |

**Cluster picture (the depreciation clock):** OpenAI preprints (7/8, 11/12,
September) → Cureton–Thorner 31/32 for every K (2026-10-12/14, Lean-formalized by
AxiomMath — our donor) → Liu abelian-field half-planes (10-08, 10-19/29) →
Trudgian–ZA low-lying zeros (10-12). Five-plus papers in six weeks, two of them
with formal components, one of them our own donor. Any 70-series novelty claim of
the form "first quasi-RH for ζ_K" or "improved zero-free half-plane" is DEAD —
taken by the cluster itself. What remains ours: (i) the WEAKENED-BINDER discharge
exercises (hQRH → 31/32 binder) — verification/ecosystem value, not novelty; (ii)
consequence statements nobody has formalized anywhere: unconditional
strip-confinement in the zeta23 window machinery for ζ_K, effective ψ_K-type
error terms in Lean (classical informal equivalents exist — QR-1/QR-6 — so these
are formalization-first); (iii) the genuinely open cross-statement: uniform
zero-free strip conclusions for objects the cluster has NOT covered (e.g. combined
statements feeding dossiers 20/40/42's ζ_K-proportion line with theorem-grade
inputs — H1(b)'s "conjecture-grade → theorem-grade" upgrade).

**Landed mid-round: dossier 70** (`research/candidates/70-unconditional-zetaK-
zero-confinement.md`, lane A9, 2026-11-13) already instantiates this zone — and its
own honesty header ("GLUE with an ECOSYSTEM payoff, not DISCOVERY"; "first
unconditional ζ_K zero-confinement strip constants in Lean") is CONSISTENT with the
preliminary verdict below. PART-2 runs its dossier-level queries; the QR-1/QR-5
records above are its mandatory nearest-miss set.

**Preliminary verdict: HOT for anything constant-shaped or first-quasi-RH-shaped
(cluster owns it, is four weeks old, and includes the formal-first mover);
WARM-and-formalization-first for the discharge-consequence statements (classical
informal equivalents exist per QR-1/QR-6); the 31/32-vs-7/8 binder mismatch
(survey H1 correction) means the Cycle-2 donor-swap pilots must restate their
binders, and their value is binder hygiene + first unconditional Lean
instantiations, NOT novelty claims.** PART-2 must sweep hexagonmath.org
(method item 14) before finalizing any verdict in this zone.

## §4. Summary table (PART 1 — preliminary)

| § | Zone | Check type | Verdict (preliminary) | Confidence |
|---|---|---|---|---|
| 1 | FF function-field proportions | PRE-CHECK | WARM — statements unclaimed (FF-2/5/6); Suzuki 2610.41115 shows method-neighbors entering; per-curve uniform shape FALSE (supersingular trap, [A9 verify]) | medium-high |
| 2 | AL area-law/inertia | PRE-CHECK | WARM — naive rank concentration REFUTED (Kuwahara 2610.15199); surviving effective-rank/cross-bridge shapes unclaimed + un-formalized; "first formal area law" dead (AreaLaw2D is ours) | high (refutation), medium (bridge shapes) |
| 3 | QR-D quasi-RH discharge | PRE-CHECK | HOT (constant/first-quasi-RH framings — cluster owns, incl. our donor) / WARM formalization-first (consequence statements; classical informal equivalents exist) | high |

**Standing alarms for lanes A2/A4/A9 (from this pre-work):**
1. Zone AL: do NOT write "rank concentration from spectral gap" as a candidate
   statement — Kuwahara 2610.15199 refutes it in the unique-gapped class; use
   effective-rank (von Neumann) or matrix-inequality cross-bridge framings, or
   make the refutation itself a certified-negative dossier.
2. Zone QR-D: restate pilot binders to 31/32 (or keep 7/8 and find another
   discharge); never let a 70-series dossier claim a zero-free-half-plane
   improvement — that race has five papers and a formal-first mover in the last
   six weeks, one of them our own donor corpus.
3. Zone FF: the on-line proportion component is free (Weil RH) — proportion
   claims must isolate multiplicity content; verify the supersingular
   multiplicity example's exact citation before using it as a scoping bound.
4. hexagonmath.org is not on arXiv — absence claims for the quasi-RH cluster
   require sweeping it directly (method item 14).
5. zai-search MCP quota exhausted (again) — this round ran on arXiv API +
   WebFetch; PART-2 should budget the same.

## §5. QR-D precision pass (2026-11-13, same lane; abstract+intro close-reads)

Requested by the coordinator; supersedes PART-1 row **QR-3** in one respect: that row
was written from the *truncated* arXiv abstract of 2610.26835, which cut off before
the final sentence — the full abstract and an HTML close-read show Liu-2's headline
theorem is **uniform over every number field**, not abelian-class-only. PART-1 rows
are otherwise intact; the corrected reading is recorded here.

### §5.1 Per-paper (a)–(d) table

| Paper | (a) L-function class | (b) Exponent + quantifiers | (c) Method class | (d) Formalization |
|---|---|---|---|---|
| **Liu 2610.12234** v1 2026-10-08, v2 10-12 | Finite-order Hecke L over ℚ(√−3) (primitive, all conductors); Cor. 14.1 transfers to **every Dirichlet L incl. ζ** (principal character) | β* ≤ **B_new = (18ξ_new+7)/(18ξ_new+9) = 0.874957019420098946…**, ξ_new = unique root in (0.38858, 0.38859) of 1188ξ³−2160ξ²+171ξ+190 (explicit trig closed form). Poles excluded from the zero set; boundary itself not claimed. Optimality **within the explicitly specified exponent-comparison system only** ("does not exclude improvements from stronger analytic estimates") | Smoothed cubic-theta (metaplectic) average with selected-prime modifications, two-sided: Cauchy–Schwarz mean-square + theta FE + quadratic/cubic sieves vs Poisson summation whose Mellin principal term is 1/L_F(s,η); continuation criterion (Prop 3.1). Contribution = parameter reoptimization: b, ℓ free, moment κ down to 13/18, fixed point κ_new = 2B_new−1 | **YES, public**: "formalized by Lean [Liu26]" = github.com/liubaiying101/Slightly-improved-zero-free-half-planes-for-the-quasi-Riemann-hypothesis (Lean 4 + exact-arithmetic certificates + verification instructions; covers the Hecke family over F and its Dirichlet and ζ consequences) |
| **Liu 2610.26835** v1 2026-10-19, **v2 2026-10-29** | **Every number field K, every finite-order Hecke character χ of K incl. the principal character** ⇒ ζ_K itself ("In particular ζ_K(s)≠0 for Re s > B♭, s≠1"). Intermediate: cyclotomic ⊇ μ₁₂, then every (K,η) with metabelian normal closure, then all K | **B♭ = 0.874886647039964…** = root near 0.8749 of 133488B⁴−376596B³+384534B²−167541B+26231; "the numerical boundary and the scalar admissibility inequalities are independent of K and η" — a **uniform Quasi-Riemann Hypothesis over number fields**; pole at s=1 permitted; exact infimum of the refined comparison system, "unattained by finite chains" | Kazhdan–Patterson **exceptional theta** over F ⊇ μ₁₂ (local Whittaker factors, radial FE, constructions of [Ope26b]); inverse + unweighted product moments (13/18 ≤ κ ≤ 1); pointwise comparison recovers B_new; then Xu–Sang averaged-numerator extension + **limiting contradiction** (κ = 2β*(F)−1) → quartic root B♭; **class-field descent following Cureton–Thorner** over K(ζ₁₂); light SymPy symbolic checks + exact rational 4-stage chain B♯ = 874886647041/10¹², B♯−B♭ < 1.04×10⁻¹² | **IN PROGRESS** (acknowledgments): "The Lean formalization is in progress," based on Lean files [Liu26b] and [CTLean] |
| **Trudgian–Zuniga Alterman 2610.16010** v1 2026-10-12, v2 2026-11-08 | ζ_K, **all number fields** (no signature restriction) — but this is a LOW-LYING-ZERO paper, not a zero-free half-plane: h(K) := min \|Im ρ\| over nontrivial zeros | Thm 1.1: **h(K) < 0.58** for all sufficiently large n_K (threshold not effective; needs r₁Δ_ℝ+r₂Δ_ℂ to dominate Δ_O = −598.23… > −599); 0.825 with Hoffstein's original parameters; first published improvement over Hoffstein 1979 (0.87+o(1)); Odlyzko's announced 0.54 unreached. Thm 1.2: N_K(0.58) ≥ c·n_K zeros counted with multiplicity, **effective** c ≈ (10/96)(3.395×10⁻¹⁶) once n_K large | Hoffstein's method generalized: comparison kernel from **three identities** — Landau–Stark log-derivative (Lem 3.1), Hadamard product ratio ξ_K(σ₁)/ξ_K(σ₀) (Lem 3.2), differentiated Landau–Stark (Lem 3.3) — combined as (σ₁−σ₀)𝓕₁+𝓕₂+½(σ₁−σ₀)²𝓕₃ so the 1/γ² terms cancel, kernel Ω ≈ −J₄/γ⁴; **Stechkin's trick**; rigorous interval arithmetic (SageMath 10.9, box subdivision; code in arXiv ancillary files) | **NONE** — no Lean/prover mention anywhere; verification is Sage interval arithmetic |
| **Cureton–Thorner hexagonmath 2610.00200** v1 2026-10-12, v2 10-14 | Thm 1.1: **ζ_K, any number field K** (s ≠ 1 pole); Cor 1.2: finite-order Hecke L over any K — trivial character included, zero-free "wherever it is holomorphic" (holomorphicity phrasing plays the pole-exclusion role) | **Re s > 31/32**, uniform over all number fields; effectivity NOT stated (no Landau–Siegel discussion on the page; Stark 1974 effective Brauer–Siegel and Sokolovskiĭ's zero theorem sit in the background references) | Strategy of the OpenAI quasi-RH / Artin-primitive-root line (the Oct-4 primitive-roots preprint gave Re s > 1−10⁻⁶ for finite-order Hecke L over cyclotomic fields containing e^{2πi/12}); hardest part = formalizing **Kazhdan–Patterson metaplectic forms** to accommodate all K; class-field descent | **YES — our donor**: "proved and formalized in Lean using AxiomProver" = the `DedekindZetaZeroFree` repo (sorry-free, standard axioms; Challenge `main`/`heckeCorollary` kernel-verified on our pin per survey §5). NOTE: CT v2 (10-14) predates and does not mention Liu |

**Cluster satellites pinned during the pass** (needed for the constant table): [Ope26a]
= openai preprint *The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane Re(s)>7/8*
(2026-09-30, in `openai-math/preprints/…September-30-2026/`, not on arXiv): finite-order
Hecke L over ℚ(√−3) + **all Dirichlet L incl. ζ** ("principal pole at s=1 allowed");
its Lean counterpart is the **sorry-challenge** `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
(ζ-only statement) — the hQRH binder's verbatim source. [Ope26b] = the October-5
companion (paper2.pdf): **Re s > 11/12** for the same classes via a shorter proof, with
the explicit corollary "this rules out the existence of Landau–Siegel zeros". [XS26] =
Xu–Sang **2610.15291** (v1 10-11, v2 10-15): **conditional on Ope26a's analytic
inputs**, improves 7/8 → 8748867/10⁷ = 0.8748867 for the same families (relaxed direct
estimate + amplified first moment of the reflected numerator from the existing fourth
moment; no formalization mentioned). Liu-2 also records a "Newton certificate"
B_N = 0.87488664962 with barrier B_lim inside its comparison system.

### §5.2 DECISION ANSWER — the 7/8 crossing (one line)

**YES, crossed twice — and NOT ζ-only: Liu 2610.12234 gives Re s > 0.8749570 for every
Dirichlet L incl. ζ (Lean-formalized, public repo), and Liu 2610.26835 v2 gives
Re s > B♭ = 0.8748866 uniformly for every finite-order Hecke L and every ζ_K over every
number field (informal, v2 four days old, Lean in progress); nothing as of 2026-11-13
goes below B♭ (arXiv sweep of the zero-free/Hecke line since 10-29 returns only
irrelevant hits).** Consequently pilot 50's `hQRH` binder
(`∀ s, (7/8:ℝ) < s.re → riemannZeta s ≠ 0`) is TRUE in the informal literature (Liu-1
Cor 14.1 already implies it for ζ); the only *formal* discharge paths today are
(a) Liu-1's external Lean repo (a Knausgård-style external donor — statement
portability unprobed) or (b) the weakened 31/32 binder via in-corpus DZDF; openai's own
7/8 challenge remains sorry.

### §5.3 Strongest available exponent per class (dossier 70's weakened-binder constant table)

| Class | Best informal exponent | Source | Best FORMAL exponent | Source |
|---|---|---|---|---|
| ζ (over ℚ) | B_new = 0.8749570 (≡ XS26's 0.8748867 conditional on Ope26a inputs; B♭ uniform below) | Liu-1 / XS26 / Liu-2 | 7/8 = 0.875 ζ-statement, **sorry** (openai challenge); **0.8749570 incl. ζ-corollary formalized in the external Liu repo** | OAI challenge / liubaiying101 repo |
| Dirichlet L (all) | B_new (transfer Cor 14.1); B♭ uniform | Liu-1, Liu-2 | as ζ (external Liu repo covers "Dirichlet and zeta consequences") | — |
| ζ_K, all number fields K | **B♭ = 0.8748866**, s ≠ 1, uniform | Liu-2 v2 | **31/32 = 0.96875**, s ≠ 1, every K | CT via DZDF (in-corpus, sorry-free) |
| Finite-order Hecke L, all K | B♭ (pole at 1 permitted) | Liu-2 v2 | 31/32 "wherever holomorphic" | CT via DZDF |
| Finite-order Hecke L over ℚ(√−3) specifically | B_new / XS26 0.8748867 (cond.) / B♭ | Liu-1, XS26, Liu-2 | B_new | external Liu repo |
| GL(n) automorphic L (context) | σ ≥ 1 − c(F,n,ε)·(𝔠(|t|+3))^{−ε}, **ineffective**, per-L not a uniform strip | Thorner 2608.12257 | none | — |
| ζ_K low-lying zeros (different quantity: h(K), not a strip) | h(K) < 0.58 (n_K → ∞, threshold ineffective); N_K(0.58) ≥ c·n_K, c effective ≈ (10/96)(3.395×10⁻¹⁶) | Trudgian–ZA | none | — |

**Consequences for the zone verdict (refines §3, no tier change):** the constant race
now has SIX papers in six weeks (Ope26a → Ope26b → Liu-1 → XS26 → CT → Liu-2), two
external Lean artifacts (liubaiying101 complete; Liu-2 in progress on top of
[CTLean]), and the informal frontier is already BELOW 7/8 uniformly — so (i) HOT
confirmed for any constant-shaped claim, now with a second formal actor beyond our
donor; (ii) dossier 70's "first unconditional ζ_K zero-confinement strip constants in
Lean" survives as stated only because Liu-2's Lean is unfinished — its two-sided strip
1/32 ≤ Re s ≤ 31/32 would become 1−B♭-sided (≈ [0.1251, 0.8749]) the day Liu-2's
formalization lands; dossier 70 should record B♭ and the liubaiying101 repo as
first-tier nearest misses and state its constants parametrically; (iii) the hQRH
discharge play gains a NEW external-donor option (Liu-1's repo) that did not exist in
the main run's option space — worth a feasibility probe alongside the 31/32 swap.

## §6. FF-part-2-stub (queued by orchestrator for A2's bridge; parked 2026-11-13, executed below)

- (a) ζ_C(q^{-s}) meromorphic continuation as an informal object — trivial classically via rationality? pin the textbook statement/number. **[EXECUTED §6.1]**
- (b) function-field Hecke L rational/entire informal status (FF-EZ3's Tate dictionary). **[EXECUTED §6.2]**
- (c) FF-EZ2-family Lamzouri-constants-for-FF-family statement — re-verify at dossier level when A9's 71 lands. **[RE-QUEUED — PART 2]**
- (d) every/infinite-genus supersingular-Jacobian multiplicity-~g citation for the falsity-trap design rule (Hall? Katz? trace to a theorem number). **[EXECUTED §6.3]**

### §6.1 (a) ζ_C(q^{-s}) as an informal object — KNOWN-INFORMAL, textbook-standard (rationality)

Z_C(t) := exp(Σ_{r≥1} N_r t^r/r) is a RATIONAL function of t ∈ Q(t) for every smooth
projective curve over 𝔽_q — **F. K. Schmidt 1931** (pre-Weil; the curve case of
rationality, 28 years before Dwork's general proof). Consequently ζ_C(s) := Z_C(q^{-s})
is a meromorphic function on ALL of ℂ (t = q^{-s} is entire; composition of rational
with entire is meromorphic), with poles exactly at the t-poles t = 1, t = q^{-1}
transported by s ↦ q^{-s}, i.e. s = 1 + 2πik/ln q and s = 2πik/ln q, k ∈ ℤ. Textbook
statements (verified via Rosen GTM 210 front-matter/TOC + standard surveys): **M.
Rosen, *Number Theory in Function Fields*, GTM 210 (Springer 2002), ch. 5 "The zeta
function of a function field" — rationality, functional equation, degree
(Thm 5.1/5.3 level [chapter verified; theorem numbers from the ch.-5 spine])**; same
statement in **Stichtenoth, *Algebraic Function Fields and Codes* (1993/2009),
Thm 5.1.1 [number carried from the standard edition — verify against the printing
before citing in a dossier]**. Verdict: **KNOWN-INFORMAL-ONLY and elementary-to-classical** —
A2's finding (no `zetaFunction`-of-curve meromorphic-continuation API in mathlib) is a
formalization absence, NOT an informal-literature gap; any FF dossier must label it
formalization-first. (In-corpus, Weil's `zetaSeries` rationality for smooth proper
varieties covers far more; the per-curve t-substitution dictionary is the glue.)

### §6.2 (b) function-field Hecke L rational/entire — KNOWN-INFORMAL (Tate/Weil method)

The FF-EZ3 Tate dictionary (Hecke/grössencharakter L-functions over global function
fields are rational — in fact entire for nontrivial characters, with functional
equation) is classical, via the Riemann–Roch/Poisson-summation method: **Tate's 1950
thesis** (function-field case included); **Weil, *Basic Number Theory*, ch. VII
(Tate's method over A/𝔽_q)**; exposition in **Rosen GTM 210 ch. 8–9 (L-functions
over 𝔽_q[T]; Dirichlet-and-beyond, including the grössencharakter/Hecke case)**.
Verdict: **KNOWN-INFORMAL-ONLY**; the formal absence (mathlib has no function-field
Hecke L at all) is again formalization-first material. Search run: arXiv
`abs:"Hecke L" AND abs:"function field" AND abs:rational` → no post-2000 claim of the
dictionary as new (textbook-only territory); nearest formal: nothing (mathlib/TauCeti/
openai sweeps of round-1 + v2 index agree — no `HeckeL` over function fields).

### §6.3 (d) the multiplicity-~g falsity-trap example — pinned: MAXIMAL CURVES over 𝔽_{q²}

The clean citation is not "Hall" or "Katz" but the **maximal-curve** literature, and
the mechanism is elementary (three lines from Hasse–Weil): if C/𝔽_{q²} attains the
Hasse–Weil bound, #C(𝔽_{q²}) = q² + 1 + 2gq, then Σαᵢ = −2gq with |αᵢ| = q forces
**all 2g Frobenius eigenvalues equal to −q**, so
Z_C(t) = (1 + qt)^{2g}/((1−t)(1−qt)): **ALL nontrivial zeros of ζ_C coincide — one
zero of multiplicity 2g, simple-zero proportion exactly 0**. Existence in infinitely
many genera: the **Hermitian curve** y^q + y = x^{q+1} over 𝔽_{q²}, genus
g = q(q−1)/2, is maximal for every prime power q (classical; e.g. **Hirschfeld–
Korchmaros–Torres, *Algebraic Curves over a Finite Field* (Princeton 2008),
maximal-curve chapter** [chapter-level citation; theorem number to verify against the
printing]; survey alternative: Garcia–Özbudak–et al. maximal-curves surveys in
*Finite Fields Appl.*). Additional genera (Artin–Schreier families with Jacobian
isogenous to E^g, E supersingular): **van der Geer–van der Vlugt, "Artin–Schreier
curves and codes" (manuscripta math. / J. reine angew. Math. line, 2002-era)**.
**Design rule for A9 (final form): a uniform per-curve simple-zero proportion
statement for ζ_C is FALSE — the Hermitian family drives it to 0 along infinitely
many genera; FF statements must be family-averaged (Katz–Sarnak monodromy) or
trace-formula-bounded.** [In-corpus note: the eigenvalue half of the trap is
formally available — Weil's `satisfiesWeilEstimate` gives |αᵢ| = q^{1/2} per
eigenvalue; the equality-forcing step is AM–GM, glueable in Lean.] Citations to
verify to theorem-number precision before dossier text: HKT ch./Thm for Hermitian
maximality + genus; vdG–vdV exact paper/theorem.


when A9 lands them; N-adjusts; consolidation into the Cycle-2 TRIAGE addendum;
re-queue any queries the dossiers pre-register that PART 1 did not anticipate.]
