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
| ζ (over ℚ) | B_new = 0.8749570 (≡ XS26's 0.8748867 conditional on Ope26a inputs; B♭ uniform below); **conditional-only frontier below that: Chang–Wang 2611.00924 (10-31) B_*−1/160000 = 0.87446205, conditional on cited uniform inputs (§8.1)** | Liu-1 / XS26 / Liu-2 / Chang–Wang (cond.) | 7/8 = 0.875 ζ-statement, **sorry** (openai challenge); **0.8749570 incl. ζ-corollary formalized in the external Liu repo**; **tracker 0.8733458 (11-13, tri-kernel-verified incl. principal character — §9.3)** | OAI challenge / liubaiying101 repo / QuasiRiemannTracker |
| Dirichlet L (all) | B_new (transfer Cor 14.1); B♭ uniform; Chang–Wang 0.87446205 **conditional** | Liu-1, Liu-2, Chang–Wang (cond.) | as ζ (external Liu repo covers "Dirichlet and zeta consequences"); **tracker 0.8733458 — formal Dirichlet frontier, below the conditional informal one since 10-26 (§9.3)** | — / QuasiRiemannTracker |
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
**(2026-11-14 addendum, §8.1 + §9): the informal-conditional frontier is now Chang–Wang
0.87446205, and the FORMAL Dirichlet frontier is the QuasiRiemannTracker chain at
0.8733458 — the tracker-verified class (all Dirichlet incl. principal ζ; no ζ_K) both
leapfrogs the conditional informal claim and leaves the constants race with a live
leaderboard; ζ_K row untouched by both.**

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
verify to theorem-number precision before dossier text: ~~HKT ch./Thm for Hermitian
maximality + genus~~ (**RESOLVED-PARTIAL 2026-11-14: cite HKT at Part-3 level or the
four pinned papers — P2-11/§10; bare chapter number NOT citable**); vdG–vdV exact
paper/theorem (**paper pinned Zbl 0729.11066; theorem number still open**).

## §7. Liu-1 external-donor audit (pointer)

Housed as **`research/novelty/liu1-as-donor.md`** (this round's §Liu1-audit, chosen
location — repo-shaped, pattern `knausgaard-as-donor.md`). Headline: public entry
theorems `hecke_nonzero`/`dirichlet_nonzero`/`zeta_nonzero`/`beta_star_le` all at the
**exact rational 34999/40000 = 0.874975** (weaker than both the paper's
B_new = 0.8749570 and the README's 0.874957069799; all < 7/8), unconditional,
triad-axioms-claimed, built on the pinned openai/math tree at **v4.34.1**;
0 sorry/native_decide/axiom at grep level in all fetched files; certificates are
proved in Lean (V2Optimization exact rationals) and verify.py is a replay harness
(hash pinning + `--trust=0` kernel replay + axioms whitelist + 22 EXPECTED names).
**Ecosystem fact surfaced: openai-math's own tree already PROVES the 7/8 ζ statement**
(`OAI/NumberTheory/DirichletL/Nonvanishing.lean:29 riemannZeta_ne_zero_of_seven_eighths_
lt_re`, DirichletL subtree 77 files / 0 sorry) — the ComparatorChallenges sorry-file is
only the challenge restatement. Recommendation: **DO-NOT-CONSUME as dependency;
statement-level only**; the cheapest hQRH discharge is the in-corpus openai tree, not
Liu's repo. G7 targets in the donor file §6.

## PART 2 — dossier-level runs (kickoff, 2026-11-13 same lane)

Scope per coordinator mapping: FINAL = 70 (QR-D), 71 (FF, renamed
splane-dictionary), 72 (AL, Kuwahara-corrected); [incoming] = 73 (FF-EZ3
hecke-tate, pre-registered 26 ln), 74 (AL-EZ2 surprisal, A4), 75 (abelian assembly,
A3-H1/42-for-abelian). Verdict table = `VERDICTS.md` Cycle-2 addendum (reconciled to
these files; the zone-guessed skeleton rows were re-mapped — reconciliation note
there). Query record for this part:

| # | Query | Source | Verdict |
|---|---|---|---|
| P2-1 | hexagonmath.org listing sweep (method item 14, for 71) | WebFetch | NO function-field-zeta / zero-multiplicity / Weil content; FF zone clean at the CT venue. Only FF-adjacent items = **Boyang Hu's trilogy "Automorphic realization of Langlands parameters for split groups over global function fields I–III"** (hexagonmath, listed 2026-11-12) — Langlands-parameters/shtukas layer, NOT zeta formalization → confirms 71's "different layer" label (71:132). CT itself not on the front listing anymore (deeper archive; its /2610.00200 pages still resolve) |
| P2-2 | `au:"Boyang Hu" AND abs:"function field"` | arXiv API | 0 entries (trilogy is hexagonmath-hosted) — recorded so 71's citation points at hexagonmath, not arXiv |
| P2-3 | DLRT 1908.04876 close-read (gating item for 75) | WebFetch fulltext | **SCOPED, not uniform**: Thm 1.1 pair correlation for a FIXED abelian K under **GRH**, o_K(1) as T→∞ (nothing uniform over discriminants); Cor 1.3(i) the >45%-distinct bound is **fixed quadratic K + GRH-conditional**, asymptotic in T; no non-abelian K, no Hecke L anywhere; SDP = minimization of Z_n(f) over the Cohn–Elkies/Montgomery class, rigorized by interval arithmetic (c₂ = 2.3226 + CGG N_{K,s} ≥ N_K/27 → 45.85%). **Flip answer for 75: SCOPED ⇒ primary NOT math-known ⇒ N stays 4.** ERRATUM vs main-run VERDICTS §5.2(c): DLRT was recorded there as "unconditional 45% distinct" — it is **GRH-conditional** (flag for H + CLAIMS-REGISTER row 42 wording) |
| P2-4 | `abs:"Rényi entropy" AND abs:"area law"` (+ au:Kuwahara entanglement) | arXiv API | No α ≥ 1 Rényi area law for 2D gapped general systems in the hits — only Kuwahara's own refutation (2610.15199, α<1 false) + nonstabilizerness/tensor-network context (2609.31459 etc.). 72's P2 purity-route (α=2, linear-in-boundary-budget shape) NOT contradicted; the full α>1 status question remains the PART-2 residual to re-check at pilot time |
| P2-5 | 71's `[A9 verify]` every-genus citation (FF falsity trap) | §6.3 above | ANSWERED at the mechanism level: maximal curves over 𝔽_{q²} force ALL 2g Frobenius eigenvalues to −q (elementary from Hasse–Weil equality), giving Z_C(t) = (1+qt)^{2g}/((1−t)(1−qt)) — a single zero of multiplicity 2g, simple-proportion exactly 0; Hermitian family y^q+y = x^{q+1} realizes it in infinitely many genera; van der Geer–van der Vlugt Artin–Schreier families extend the genus coverage. Chapter/theorem-number citation (HKT 2008 maximal-curves chapter; vdG–vdV exact paper) still to pin against a printing before dossier-final text — carries to A9's revision pass |

**PART-2 verdicts**: 70/71/72 filled in `VERDICTS.md` (DOSSIER-CHECKED); 73/74/75
marked [incoming] (75's N-question already answered by P2-3: N 4). Remaining PART-2
work when 73/74/75 land: their pre-registered queries (73's Tate-dictionary
literature re-verification incl. Rosen ch. numbers — §6.2 stub flags; 74's surprisal/
moment-hierarchy sweeps; 75's abelian-assembly nearest-miss runs).

### PART-2 continuation (same lane, 2026-11-13 later — dossiers 74/75 FINAL on disk)

| # | Query | Source | Verdict |
|---|---|---|---|
| P2-6 | `abs:"moment problem" AND abs:entanglement` (74's pre-registered #1) | arXiv API | Moments appear only to QUANTIFY entanglement: 2610.36156 (partial-transpose moments, many-body quantification), 2609.29471 (optimal criteria from trace invariants) — no class-barrier/ceiling theory for entropy functionals anywhere. CLEAN for 74's shapes; 2610.36156 joins nearest misses as the "moments-as-data, no ceilings" genre anchor |
| P2-7 | `abs:"moment hierarchy" AND abs:entropy` (74's #2) | arXiv API | All hydrodynamics/thermodynamics (2607.09463, 2307.10769, …) — zero entanglement content. CLEAN |
| P2-8 | `abs:"certified bound" AND abs:"spectral"` (74's #3) | arXiv API | Noise + **2605.20509 "The Causal Bootstrap: Bounding Smeared Spectral Functions from Non-Perturbative Euclidean Data"** — method-adjacent (certified/optimization bounds on smeared spectral data, QFT domain); add as T3's method-neighbor nearest miss |
| P2-9 | citations of AHS arXiv:2004.15009 proving LOWER bounds on achievable windows (74's #4) | Semantic Scholar | 23 citers (first page; **citer #1 is Kuwahara 2610.15199** — the cluster is connected). Keyword scan: only complexity-lower-bound papers (2020 circuit lower bounds for code-Hamiltonian low-energy states; 2022 quantum-proof complexity) — **NO citer proves class-side lower bounds on achievable entanglement windows**. 74's T1-floor / "class-side dual of AHS" positioning SURVIVES |
| P2-10 | 74's load-bearing `EntropyMoments.lean:93` moment-object identification (coordinator-requested verification) | local read, openai-math `OAI/MathematicalPhysics/PEPSSubvolume/EntropyMoments.lean:85–132` + AreaLaw2D `OpenAI/Statements.lean:460–490` | **VERIFIED with one glue note.** :93 `def moment (p : ι → ℝ) (u : ℝ) : ℝ := ∑ i, (p i)^(1-u)` (namespace `PolynomialPEPS.Subvolume.MGFScalar`), :94 `entropy`, :95 `logMoment`, :128 `logMoment_derivative : HasDerivAt (logMoment p) (entropy p) 0` — all verbatim as 74 cites. AreaLaw2D `MarginalTails`' first clause bounds exactly `Real.log (∑_{0 < p j}, p j * Real.exp (-u * Real.log (p j)))` = `logMoment p u` (p j · e^{−u log p j} = (p j)^{1−u} on `0 < p j`) — the "two halves of family 265 each formalize one face of m_u" claim is CORRECT. Glue note: at **u = 1** the `Real.rpow` convention contributes 1 per zero eigenvalue (`Real.zero_rpow`: 0^b = 0 for b ≠ 0 but 0^0 = 1), so `moment p 1 = card ι` vs the filtered sum `#{j | 0 < p j}` — irrelevant inside MarginalTails' window \|u\| ≤ (32√((1+ϑ)𝓑))⁻¹, but 74's T3 LP layer should state u ≠ 1 explicitly |
| P2-11 | 71 falsity-trap chapter/theorem pin (item 2; trail: §6.3 + bridge §168's standing design rule) | zbMATH API + WebFetch | Mechanism elementary (Hasse–Weil equality over 𝔽_{q²} + \|αᵢ\| = q ⟹ ALL αᵢ = −q ⟹ Z_C(t) = (1+qt)^{2g}/((1−t)(1−qt)), zero of multiplicity 2g). **Paper-granular pins, zbMATH-verified**: van der Geer–van der Vlugt, *Artin-Schreier curves and codes* (**Zbl 0729.11066, 1991** — Jac ≅ E^g constructions, supersingular; corrects my §6.3 "2002-era" guess); Cossidente–Hirschfeld–Korchmaros–Torres, *On plane maximal curves* (Zbl 0958.11048, 2000); Hirschfeld–Korchmaros, *Caps on Hermitian varieties and maximal curves* (Zbl 1043.51007, 2003); Giulietti–Hirschfeld–Korchmaros–Torres, *Curves covered by the Hermitian curve* (Zbl 1218.11064, 2006). Book-level: HKT, *Algebraic Curves over a Finite Field* (PUP 2008) — **[TBD resolved 2026-11-14, PARTIAL-PIN + title-level UNPINNABLE-BY-OPEN-WEB; evidence trail in §10]**: book = **Zbl 1200.11042** (xx+696 pp., ISBN 978-0-691-09679-7; review M. Zieve); zbMATH-verified structure: chs. 1–7 background, **chs. 8–10 = Stöhr–Voloch theory of curves with many rational points** ("in great detail"), chs. 11–12 = automorphism groups (first valid proof of Henn's classification); Google Books (print TOC, numerals+pages): ch. X pp. 203–274 ends Part 1, **PART 2 "Curves over a finite field" from p. 275 (chs. XI–XIII), PART 3 "Further developments" from p. 393 (chs. XIV–XVIII, pp. 393–626)** — maximal-curve content ("state-of-the-art introduction to maximal curves"; common terms "Fq2-maximal curve", "Hermitian curve") sits in Part 3, i.e. AFTER chs. 8–10, by both sources. Exact chapter number+title for maximal curves NOT verifiable from open web this session (JSTOR/Google Scholar/LOC/Schweitzer/DNB/SearchWorks all bot-challenged/429/404; PUP pages carry no TOC). **Recommended dossier citation: the four zbMATH-pinned papers above at paper granularity, or the book at Part-3 level ("HKT 2008, Part 3 (chs. XIV–XVIII, pp. 393–626)") — do NOT cite a bare chapter number.** In-corpus half unchanged: Weil `satisfiesWeilEstimate` supplies \|αᵢ\| = q^{1/2} (bridge:73) — the trap's Lean glue is equality-case + AM–GM |
| P2-12 | 75's mandatory hexagonmath.org sweep, archive depth | WebFetch | Front listing swept clean (P2-1); **the archive page is ORCID-authenticated** ("Sign in … ORCID") — a method limitation to record: direct archive sweep requires an ORCID (flag to H). Indirect negative evidence: Liu-2's bibliography cites only CT from hexagonmath (a ζ_L-proportion paper central enough to cite would surface there); P2-1's front page has none. Verdict: 75's hexagonmath gate = PASS-conditional (front page + indirect channels clean; archive-direct check outstanding) |

**Updated PART-2 verdicts**: 74 and 75 now DOSSIER-CHECKED (rows filled in `VERDICTS.md`);
73 stays `[incoming]` (dossier not on disk; §6.2 stub carries its literature baseline).

### PART-2 second continuation (same lane, 2026-11-13 latest — dossier 73 landed FINAL)

| # | Query | Source | Verdict |
|---|---|---|---|
| P2-13 | 73's gating claim "first formal Tate-thesis-type statement anywhere" — function-field scope | arXiv API ×2, GitHub repo search + audit ×2, AFP (round-1 base) | **SUPPORTED in the function-field scope.** arXiv `abs:"Tate thesis"` → 8 entries, ALL math-physics/trace-theory/model theory — zero formalization; `abs:"function field" AND abs:"Hecke" AND abs:formalization` → 2 irrelevant (geometric Langlands commutators; abelian varieties over global fields). GitHub `"Tate thesis" language:Lean` → exactly **2 repos, both audited**: (a) `DawidLipin/Project_Tate_Thesis` — dissertation project, IsoAdeleDual/MainTheorem "not finished yet", zeta defined + FE stated-not-proved, number-field adeles, no Hecke rationality — not a competitor; (b) `WenrongZou/TateThesis` — **serious PhD project (supervisors Nuccio & Brasca, ANR FALSE), Lean 4 + Mathlib + CI**, goals = meromorphic continuation + FE + pole structure + completed Hecke-L FE **over NUMBER FIELDS only**; README frames results as goals, 4 commits, proved-status unconfirmed — no function-field content, no rationality-in-T dictionary. AFP: none (round-1's 1044-entry scan). Verdict: no formal Tate dictionary for function fields anywhere; **but the "anywhere" phrasing must cite WenrongZou as the nearest formal neighbor + clock** (a mathlib-adjacent group; the number-side statements may land within months — soften "first formal Tate-thesis-type statement anywhere" to the function-field/rationality-dictionary scope). Hexagonmath gate: P2-1 front page + P2-12 archive-ORCID status carry over (PASS-conditional) |

**Final PART-2 state**: 70–75 ALL DOSSIER-CHECKED (rows in `VERDICTS.md`); no
`[incoming]` markers remain. Residuals for the record: hexagonmath archive-direct sweep
(ORCID), ~~HKT book chapter number (P2-11)~~ (**closed 2026-11-14 as PARTIAL-PIN,
title-level unpinnable from open web — see P2-11 update + §10**), Rosen ch.-number
spot-check when 73's pilot near, 72's α>1 Rényi re-check at pilot time.

## §8. Clocks (swept 2026-11-13; window = since 2026-11-06 unless noted)

**MATERIAL (reported to orchestrator as item (0) this sweep):**

1. **QR-D informal frontier moved BELOW B♭ — conditionally.** Chang–Wang,
   arXiv:2611.00924 (2026-10-31; missed by my earlier sweep via a truncated results
   head — lesson recorded): "exhaustion-aware product moment" obtains **B_* −
   1/160000 = 0.87446205769…**, below Liu-2's B♭ = 0.8748866 — but **conditional on
   "the cited general-field theta, detector, prior-bound and Mellin input theorems in
   their stated uniform forms"** (XS26-style conditionality). Unconditional record
   unchanged (Liu-2 B♭). Hits: VERDICTS row 70 + round-4 §5.3 table (conditional
   column), CLAIMS-REGISTER row 70 clock line.
2. **QR-D cluster grows: Ji, arXiv:2611.16665 (2026-11-12): "Proof of the Quasi
   Riemann Hypothesis using Q[i]"** — quartic Gauss sums replace cubic; ζ_{Q(i)}
   + ζ zero-free Re s > **599/600** (= 0.99833, weaker constant, new base field and
   new theta-kernel: quartic Kubota). Title over-claims vs the cluster's sense of
   "QRH"; no frontier move; row-70 must-cite list grows.
3. **QR-D Lean ecosystem is 13 repos, not 2** (GitHub `"quasi-Riemann" language:Lean`,
   swept today): beyond liubaiying101 ×2 and the audited Zhang-Liao/CoolRmal 7/8
   extractions — **AlexKontorovich/quasi-rh** (10-26; README-claimed complete
   formalization of `riemannZeta_ne_zero_of_re_gt_elevenTwelfths` = 11/12 for ζ +
   Dirichlet, v4.34.1, reuses OpenAI's analytic core; NO ζ_K content),
   **GTimG/QuasiRiemannTracker** (created 10-09, 389 commits, **pushed today
   08:28**; README: "Every result on the website is verified", tracks "bounds on the
   real parts of zeros of Dirichlet L-functions"; site is JS-rendered — NOT sweepable
   by WebFetch; browser pass or clone is needed to rule out ζ_K entries),
   LUOLINGc325/quasi-rh-lean ("main results of the Quasi-Riemann…", 10-28),
   LW56e2/quasi-riemann-improved, CrossNox extension, akashlevy/qrh (obstructions
   notes), jacobalansussman/qrh-zero-free-bounds ("a map of 66 dead ends", 11-04),
   DrMurphyIsIn/qrh-debruijn-newman (**kernel-checked Λ ≤ 9/32 for de Bruijn–Newman**
   — the main-run round-1 §12 "Λ absent everywhere" gap is now TAKEN by a third
   party; no Cycle-2 dossier is affected; main-run donation-surface note only),
   randogelist (unaudited). **No new ζ_K formal artifact found** — row 70's per-class
   split (ζ_K/all-K strip ours alone) SURVIVES this sweep; the ζ/Dirichlet formal
   side now has ≥3 artifacts (openai tree 7/8 in-corpus; Liu 34999/40000;
   Kontorovich 11/12).

**QUIET:** Suzuki/FF (no function-field zeta followups since 2610.41115; newest FF-adjacent
items are unrelated — Carlitz polylogs 2610.25063, Cohen–Lenstra vanishing heuristics
2610.16112); Kuwahara/AL (recent quant-ph area-law items are physics applications — free-
fermion time-direction entropy 2611.13085 etc.; no barrier-theory followup); AF-cluster
(newest ζ-proportion paper still Knausgård 2610.08965 of 10-06; nothing in-window);
WenrongZou/TateThesis (4 commits, no new push in window — but repo <2 weeks old; keep
clock); liubaiying101 main repo (11 commits, unchanged in window).

**Sweep limitations:** QuasiRiemannTracker site JS-rendered (static HTML = title only) —
needs a browser pass (browser-use skill) or clone; hexagonmath archive still ORCID-gated;
arXiv API intermittently returns empty bodies (retry before believing a 0).

**Post-outage note (2026-11-14):** the §8.1 propagation listed under "Hits" died in the
network outage — none of the three downstream updates landed at the time (VERDICTS row-70
clock line, §5.3 table conditional column below, CLAIMS-REGISTER row-70 clock line). All
three are executed today in the same pass as §9, reconciled against A9's dossier-70
"Standing notes — clock sweep" (candidates/70-*.md:334 ff., which leads the record).

## §9. GTimG/QuasiRiemannTracker audit (executed 2026-11-14; clone + browser pass)

Executes §8 item 3's outstanding browser-or-clone task. **URL correction first:** the live
site is **https://gtimg.github.io/QuasiRiemannTracker/** (GitHub repo `homepage` field;
also the README badge target) — the relaunch briefing's "quasiriemann.org" is WRONG, and
my own §8 note correctly recorded the repo but no URL; the audit therefore pinned the URL
from the repo metadata before browsing. Repo facts (GitHub API): created
2026-10-09T12:36:10Z, pushed **2026-11-13T08:28:53Z** (= §8's "pushed today 08:28"),
description "Quasi-Riemann bounds, Lean formalizations, and independent proof
verification." Method: `--depth 1` clone (626 MB incl. vendored proof trees, staged at
/tmp, read-only) + deployed `catalogue.json` fetch + browser-use pass on the JS site
(main, protocol tabs).

### §9.1 (a) Verification mode — kernel-grade, TRI-kernel, per entry

Protocol page (`?tab=protocol`, browser-passed 2026-11-14), verbatim: "Every result on
the website has passed **Comparator's statement, definition and axiom checks, followed by
proof replay in Lean, NanoDa and con-ron**." Permitted axioms: **propext,
Classical.choice, Quot.sound** — the same triad as our axcheck standard. The pipeline
uses Palomar's open-source proof checker (`PalomarRegistry/PalomarSubmission` @
`d4e41c1d`). Canonical statement (protocol page): ∀ q ∈ ℕ>0, χ ∈ (ℤ/qℤ)^×, s ∈ ℂ with
(χ,s) ≠ (1,1): Re(s) > θ ⟹ L(χ,s) ≠ 0 — displayed as a Lean `quasi_riemann_bound`
template with an **intentional `sorry`** ("a statement template, never the accepted
proof"; upstream = openai/math `ComparatorChallenges/DirichletSevenEighths.lean` @
`fd4aeeb2`). Receipt sample (verifier/standard/receipts/`pr71-17d05f9a-20261024/README.md`,
the slayer-recost 0.87477290596 entry): fresh compile of **all 7,391 modules**, no
candidate cache; adversarial controls (mismatched statement, ill-typed proof, hidden
assumptions, `sorryAx`) explicitly rejected; baseline replay rerun; source Lean
**4.34.1**, Comparator runtime 4.35.0-rc2, **NanoDa 0.4.26** = `github.com/ammkrn/
nanoda_lib` @ `998e0a84` (an independent Lean-export checker) + **con-ron** as third
kernel; ETH-run outside-sandbox evidence over authenticated SSH; hash-bound receipt
(`result.json` + contract/controls/dependency-pins). Status taxonomy
(`core/catalogue.mjs:57-66`): `accepted`/`framework-verified`/`verified` = "Verified in
our framework" vs `verification-pending` vs `historical-baseline` (θ = 1, no local
verification claim). In-tree `metadata.json` carries a `status` field on only 11/56
entries (the 2026-10-06..10-13 cohort); the **deployed catalogue normalizes all 55
records to `framework-verified`** (`as_of` 2026-11-13; one early entry demoted to
`historical_records`), i.e. admission status is computed from admission records, not
submission metadata — mid-PR "pending" states exist (Lewko's metadata: "Official
Comparator/Lean/NanoDa/con-ron admission remains pending", later admitted). **Verdict:
kernel-verified** (Lean kernel replay + two independent kernels over exported proofs,
triad-axiom-restricted), with the receipt/certificate layer as provenance ON TOP — not
certificate/symbolic-only. Caveat for consumption: verification runs on THEIR
infrastructure against per-entry vendored trees on Lean-4.34.1-family pins.

### §9.2 (b) ζ_K / Hecke entries — NO; the per-class split SURVIVES

Scope is Dirichlet-only at every layer: README ("bounds on the real parts of zeros of
Dirichlet L-functions"), protocol canonical statement (all moduli, pole excluded; ζ only
as the principal character), site headline ("All nontrivial zeros of Dirichlet
L-functions lie in the strip Re(s) ∈ [1−θ, θ]"). Whole-repo greps (clone): **zero**
`DedekindZeta`/`zeta_K`/`ζ_K` statements outside the vendored openai-baseline OAI tree —
and there the only hit is `fullIdealZeta_eq_dedekindZeta`
(`OAI/NumberTheory/DirichletL/QuadraticSieve/DyadicColumns.lean:245`), an
**Euler-product-region identity (Re s > 1) for the FIXED field
`ActualEisensteinCubic.K`** — sieve machinery of the openai proof, not a zero-free
theorem, not uniform over K. "Number field" appears exactly once in submissions prose:
"Finite-order Hecke L-functions over the **Eisenstein number field** are nonzero to the
right of seven eighths" (`Hecke/Nonvanishing.lean:7` docstring). Entry texts confirm the
class never widens: baseline/liu/argonaut verification notes cover "the all-Dirichlet,
zeta and finite-order Eisenstein Hecke statements" (= the openai companion statement
set, Comparator-verified alongside); later entries refine the Dirichlet statement only.
**Conclusion: the tracker does NOT contradict §8 item 3 — no ζ_K formal artifact exists
anywhere in it; row 70's per-class split (ζ_K/all-K strip ours alone) SURVIVES the
audit.** (Precision footnote: finite-order Hecke over ℚ(√−3) IS in the verified
statement set of the baseline entries — exactly the class row §5.3 already tracks; no
Hecke-over-general-K anywhere.)

### §9.3 (c) Conditional results — not tracked at all; formal Dirichlet frontier now BELOW Chang–Wang's conditional frontier

No Chang–Wang / 2611.00924 / 0.87446205 anywhere in the repo (grep, all file types); no
Liu-2 B♭ entry (informal, Lean in progress); no CT 31/32 (weaker constant, ζ_K class
outside scope). The tracker has **no "conditional" status class** — its taxonomy is
verified-here vs pending vs historical — and HOSTING.md's rule ("Imported results use
the same presentation and verification status as other submissions") means a result
appears only after passing the full §9.1 pipeline: XS26-style conditional-on-inputs
claims are structurally unlistable. **Liu B_new IS tracked at the exact algebraic
bound**: entry `liu-20261008`, theta = 874957069799168740018340006959/10³² with
`exact_bound "(1507 − 2√921) / 1653"`, "ranked by a rational upper bound less than 10⁻³⁰
above it, proved in Lean" — which REFINES liu1-as-donor §1 (the public repo's own entry
theorems sit at 34999/40000; the tracker independently replayed the exact algebraic
bound on its own vendored tree). The verified frontier (deployed catalogue + badge
"best verified bound θ ≤ 0.873345856106…"): 7/8 openai-baseline (10-06) → Liu exact
B_new 0.8749570 (10-08) → cycle25-quartic 0.8748866 (10-10) → sil-density-split
0.8739950 (**10-26 — the day the verified frontier crossed below Chang–Wang's
conditional 0.87446205**) → arvi-selected-leaf 0.8734120 (10-30) →
marked-anchor-induction 0.8733468 (11-12) → **continuum-anchor 0.8733458561 (11-13,
Joseph Bebel)** — ≈ 0.0012 below Chang–Wang-conditional and ≈ 0.0016 below B_new. I.e.
for the Dirichlet class the FORMAL side has leapfrogged both the conditional informal
frontier and every informal uniform claim. Site milestones project the method's limit
at **13/15 ≈ 0.8667** ("Limit of OpenAI's method") between "Classical result" (1),
"three-quarter barrier" (3/4) and GRH (1/2).

### §9.4 Consequences (novelty impact — row 70 / dossier 50 / 20-cluster)

1. **Per-class split unchanged on the ζ_K side** (§9.2) — dossier 70's headline class
   survives; A9's standing-note 3/β assumption confirmed.
2. **MATERIAL for the ζ/Dirichlet class column:** the best formal Dirichlet/ζ strip
   constant is now the tracker's **0.8733458 (2026-11-13)**, moving at ~1 entry/day —
   "7/8-or-better is concurrent" phrasing is stale; §5.3's ζ/Dirichlet "Best FORMAL"
   cells updated below. The in-corpus openai 7/8 tree remains the only CONSUME-able
   artifact on our pin; Liu 34999/40000, Kontorovich 11/12, and the tracker chain are
   all external (the tracker: Lean 4.34.1-family, per-entry vendored trees, their
   infrastructure — DO-NOT-CONSUME, liu1-as-donor precedent; statement-level only).
   Constants-stale-on-arrival for 70/50: confirmed, and now with a live leaderboard
   attached.
3. **Dossier 70's parametric-θ design absorbs the movement** (re-instantiation, zero new
   proofs — A9 standing note 1's Chang–Wang logic extends verbatim to every tracker
   step).
4. **Ecosystem note (RELATED-WORK):** the QR-D cluster now includes a self-verifying
   leaderboard — 19 contributors (OpenAI, Baiying Liu, Mark Lewko, Joseph Bebel,
   Zhongpai Gao, Akash Levy, Hailey Collet + pseudonymous/AI-agent handles Sil,
   ArviFoxy, Slayer, timbalud, DaysSky, xenoproof, nielstron, LW56e2 (Leo Wei),
   SovereignSteak, Rohan Arun, Kari Roegnvaldsson, Argonaut Math, Tim Gehrunger ·
   ProofCouncil, Jacob Sussman), agent-trajectory-native submission format
   (SUBMITTING.md references ATIF; metadata `agent_traces`), 29-submission/171-edge
   dependency graph; Collet's formalization lives at `github.com/rohanarun/
   quasi-rh-hillclimb` (PR #69/#70 trail). A new genre neighbor for the
   Knausgård-clock culture: month-scale depreciation is now measurable DAILY on the
   Dirichlet class.

### §9.5 Tracker clock protocol (standing re-check recipe — NO browser needed)

The §9 audit needed a browser only for the HTML shell; the tracker's DATA is served as
static JSON assets. Any future lane can refresh the clock with two curls:

```
curl -sL https://gtimg.github.io/QuasiRiemannTracker/catalogue.json   # full entry set
curl -sL https://gtimg.github.io/QuasiRiemannTracker/bound-badge.json # headline only
```

Fields to read (schema validated by `core/catalogue.mjs:78-130`, semantics §9.1):
- `catalogue.json`: `as_of` (build date ≈ last push); `records[]` with per-entry
  `id`, `status` (expect `framework-verified`; `verification-pending` would be a
  first — flag it), `theta` {numerator, denominator} (smaller = stronger),
  `exact_bound` (algebraic form when present), `timeline_at` (announcement date),
  `title`, `authors`, `builds_on`; `historical_records[]` (demotions);
  `events[]` (withdraw/supersede — expect []).
- `bound-badge.json`: `message` = "θ ≤ <best verified bound>" — the one-line refresh.
- Re-check questions, in priority order: (1) best verified `theta` vs the §9.3
  baseline below and vs the 13/15 ≈ 0.8667 method-limit milestone; (2) any entry
  whose `title`/`method`/`description` mentions Dedekind zeta / number fields /
  Hecke beyond "Eisenstein" (would falsify the row-70 per-class split — §9.2);
  (3) any new status class (conditional entries would be an ecosystem change);
  (4) whether `liu-20261008` remains the only exact-algebraic entry.
- Cheap one-liner for the frontier:
  `python3 -c "import json;d=json.load(open('catalogue.json'));r=[x for x in d['records'] if x['status']=='framework-verified'];print(d['as_of'],min((int(x['theta']['numerator'])/int(x['theta']['denominator']),x['id']) for x in r))"`

**Baseline 2026-11-14 (this audit):** `as_of` 2026-11-13; 55 records, all
`framework-verified`; best verified bound **θ ≤ 0.8733458561067185** (id
`continuum-anchor`, timeline 2026-11-13, "Continuum marked-anchor Dirichlet
nonvanishing at the closest supported rational", Joseph Bebel); second-best
`marked-anchor-induction` 0.8733468 (2026-11-12); `liu-20261008` = the only
`exact_bound` entry ("(1507 − 2√921) / 1653"); badge message "θ ≤ 0.873345856106…";
`events` [] ; no ζ_K/Hecke-beyond-Eisenstein content (§9.2). Repo facts for dating:
pushed_at via `https://api.github.com/repos/GTimG/QuasiRiemannTracker` (also
WebFetch-able). Caveat: the deployed catalogue lags `main` by the Pages deployment
step; if `as_of` looks stale, check pushed_at before concluding "no movement".

## §10. HKT chapter-pin close-out (2026-11-14; bounded 30-min pass — PARTIAL-PIN)

Resolves the `[TBD]` from P2-11 (row 71's falsity-trap citation: "HKT ch./Thm for
Hermitian maximality + genus"). Verdict up front: **PARTIALLY PINNED — book ID +
part/chapter structure verified via zbMATH + Google Books; the maximal-curves
chapter's number+title NOT verifiable from the open web this session. Recommended
citation: the four zbMATH-pinned papers (P2-11) at paper granularity, or HKT at
Part-3 level; never a bare chapter number.**

Evidence trail (all fetched 2026-11-14):

1. **zbMATH API** (`api.zbmath.org`, an:1200.11042): Hirschfeld, Korchmáros,
   Torres, *Algebraic Curves over a Finite Field*, Princeton Series in Applied
   Mathematics, PUP 2008, xx+696 pp., ISBN 978-0-691-09679-7; review **M. Zieve**
   (zbmath.org/5265453). Review (full text pulled; quote-capped by the fetcher):
   chs. 1–7 = background for the Stöhr–Voloch theory; **chs. 8–10 treat curves with
   many rational points "in great detail"** via Stöhr–Voloch projective embeddings
   (canonical embedding recovers "the classical Weil bound"); **chs. 11–12** =
   curves with large automorphism groups, incl. "the first valid proof of the
   classification announced by Henn" (> 8g³ automorphisms, g ≥ 2). The review does
   NOT mention maximal or Hermitian curves by name — hence the zbMATH-fallback
   cannot complete the pin alone.
2. **Google Books, print edition** (`books?vid=ISBN9780691096797`, via the .com.my
   redirect): partial Contents strip — chapter numerals with start pages only (no
   titles): VIII p. 161, IX p. 199, **X p. 203**, XI p. 275, XII p. 277, XIII
   p. 332, XIV p. 393, XV p. 395, XVI p. 458, XVII p. 546, XVIII p. 590, then
   p. 627/650/655/689 (appendices + bibliography + index — the 22 front entries
   are 18 chapters + back matter). Common-terms panel: "Fq2-maximal curve",
   "Hermitian curve", "Frobenius non-classical", "Fermat curve".
3. **Google Books, ebook edition** (`books?vid=ISBN9781400847419`): Contents shows
   **PART 2 "CURVES OVER A FINITE FIELD" p. 275** (= ch. XI) and **PART 3 "FURTHER
   DEVELOPMENTS" p. 393** (= ch. XIV); publisher description: "a state-of-the-art
   introduction to maximal curves over finite fields". Part 1 therefore = chs.
   I–X (pp. 3–274, ending with the Zieve-verified chs. 8–10 many-points block),
   Part 2 = chs. XI–XIII (275–392), **Part 3 = chs. XIV–XVIII (393–626) — where the
   maximal-curves material must live** (after Stöhr–Voloch and the automorphism
   chapters, by both sources; the long chapters XV pp. 395–457 and XVI pp. 458–545
   are the plausible hosts, but which carries the title "maximal curves" is
   exactly what no open source exposes). Note the internal-numbering ambiguity:
   Zieve's "chapters 11 and 12" vs the GBooks XI (2 pp., likely a Part-2
   prologue)/XII mapping — one more reason a bare-number citation is unsafe.
4. **Blocked/empty sources this session** (evidence of due diligence): PUP catalog
   pages (both editions resolve but carry NO TOC); LOC catalog (HTTP 403); DNB
   portal (title query misses the record; no TOC); Stanford SearchWorks
   (ECONNRESET via both sandbox and browser); Google Scholar (bot-blocked);
   DuckDuckGo HTML (CAPTCHA); Bing (two queries — retailers only; site: filter
   dropped); JSTOR search (client challenge in both routes); Schweitzer ebook page
   (HTTP 429, Retry-After 7200); dokumen.pub (404 both slug variants);
   Google Books API (429); zai-search MCP (429, quota — standing since round-4 §0).

**Status of the [TBD] markers (all in this file + VERDICTS row 71, updated
2026-11-14):** P2-11 book-level cell → PARTIAL-PIN text; §6.3 tail → RESOLVED-PARTIAL
(vdG–vdV theorem number still open, paper pinned); PART-2 residuals line → closed;
VERDICTS row 71 → "[TBD vs printing]" replaced. Dossier 71's own text is A9's file —
relay owed (same channel as the §9 outcome relay).
