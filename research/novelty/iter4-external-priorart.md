# Iteration-4 external prior-art review + world scan (lane R7)

*Compiled 2026-11-16 by lane R7 of the Cycle-2 review (10-lane). Scope: independent
EXTERNAL evidence for the Cycle-2 headline claims (web tools only — arXiv API
`export.arxiv.org` with abstract-page follow-ups, OpenAlex `api.openalex.org`, Isabelle
AFP entry pages `isa-afp.org`, GitHub API/raw, the QuasiRiemannTracker live badge, and
the local encore mathlib checkout as the on-pin formal ground truth). Every verdict
cites a source actually consulted this session; fetch date 2026-11-16 unless noted.
zbMATH Open was HTTP-403-blocked from this environment — zbMATH-grade coverage was NOT
available; OpenAlex was used as the bibliographic fallback.*

---

## 1. Verdict table

| claim | verdict | nearest prior art | citation (consulted 2026-11-16) | impact-on-article |
|---|---|---|---|---|
| **75** ζ_L zero proportions, n+1-factor abelian assembly | **NOVEL** (statement class, informal + formal) | DLRT >45% distinct for *quadratic* abelian ζ_K (GRH-cond.); Bansal–Maji infinitely many on-line zeros for ζ_F of *any* number field (uncond., no proportion); off-line zero-density (Thorner–Zaman et al.) | arXiv:1908.04876 (abs fetched); arXiv:2507.18121 (abs fetched); arXiv:1510.08086, 1604.01750, 1502.05679, 1804.06402 (API listing) | **none** — recommend adding Bansal–Maji to §6 (relabel-grade) |
| **42 / 42-M4** quadratic ζ_K critical-line proportions; ζ-column via ZetaZerosV2 | **NOVEL** formally; informal content corollary-grade (as the article says) | DLRT (as above); Lamzouri >2/3 simple+on-line for ζ *only* (confirmed; the donor V2 formalizes); Knausgård stronger constants but 3 search-program axioms (native_decide-class) | arXiv:2609.02882, arXiv:2610.08965, arXiv:2609.33043 (abs fetched); arXiv:1908.04876 | **none** |
| **50-M2** unconditional ζ strip confinement 1/8 ≤ Re ρ ≤ 7/8 | **KNOWN** informally (trivial corollary of the 7/8 half-plane + functional equation; classical region σ ≥ 1 − c/log t is stronger); formal statement a first-of-kind *consequence*, and the article already disclaims priority | OpenAI 7/8 [OpenAI26] (Lean, donor tree); Liu B_new = 0.8749570 (Lean, [Liu26]); uniform informal frontier 0.8748866 (Liu 2610.26835); formal Dirichlet frontier θ ≤ 0.873345856106 (tracker badge) | arXiv:2610.12234 v2 (abs fetched: "formalized by Lean"); arXiv:2610.26835, 2610.15291, 2611.16665 (API listing); `gtimg.github.io/QuasiRiemannTracker/bound-badge.json` (fetched); mathlib `ff2494ea` `Nonvanishing.lean:404,417` (Re ≥ 1 only) | **none** (honesty header already correct) |
| **72** Rényi monotonicity no-go gate | mathematics **KNOWN** (textbook); no-go *packaging* + Kuwahara hook a novel formal fence | Rényi (1961); H_α non-increasing in α and H_0 = log‖supp‖ are textbook (Beck–Schlögl 1993 derivation); Kuwahara refutes Rényi-α<1 area laws in **every dimension ≥ 2** (not just 2D) and adds a rank–error trade-off | en.wikipedia.org/wiki/Rényi_entropy (monotonicity + H₀=log n, refs Rényi 1961 / Beck–Schlögl 1993); arXiv:2610.15199 (abs fetched: "every spatial dimension two and higher"; trade-off exp[Õ((A log ε⁻¹)^{2/3})]) | **relabel** — add textbook cites; correct/strengthen "2D" to "all D ≥ 2" (Kuwahara is dimension-general; strengthens the gate) |
| **71** s-plane ζ of a curve over 𝔽_q (Weil 1948) | **NOVEL** formalization-first (s-plane dictionary); no competing formalization found anywhere | mathlib (no curve zeta / Hasse–Weil at all on pin); AFP has only ζ(3)/ζ(5) irrationality; AxiomMath `Weil` owns the T-variable (sibling corpus); GitHub/arXiv nulls | mathlib `ff2494ea` grep (no Hasse–Weil/curve-zeta hits); isa-afp.org landing scan (fetched); GitHub API searches = 0 results; arXiv API nulls | **none** |
| **73** Hecke L over 𝔽_q[T], Tier C | **NOVEL** formalization-first in function-field scope; number-field nearest formal neighbor confirmed early-stage | WenrongZou/TateThesis: Lean 4 + Mathlib, **number-field** Tate thesis (adelic zeta integrals, functional equation), 4 commits, PhD project (ANR FALSE) — in progress | github.com/WenrongZou/TateThesis (fetched); arXiv API "Tate's thesis + formalization" = 0; GitHub API nulls | **none** (keep the WenrongZou clock; "anywhere" stays softened) |
| **11 (+M2)** call-charged reduction calculus + TM2 realization | **NOVEL** as a formal framework; informal accounting folklore (Williams–Williams 2010, cited in-article) | no formal call-charged reduction type found (arXiv null sweeps; AFP topics scan); the 3SUM refutation itself is externally corroborated and has **no** other formal verification | arXiv API nulls ("fine-grained+formalization", "Isabelle+running time+algorithm", "NREST"); isa-afp.org/topics (fetched); arXiv:2610.32162 (Fischer: "since the 3SUM Hypothesis was recently refuted") | **none** |

Verdict scale: NOVEL / NEAREST-MISS (cite) / KNOWN (cite) / INSUFFICIENT-INFO. All seven
claims get full external evidence; none needs INSUFFICIENT-INFO, none RETRACT, none
REWRITE.

---

## 2. Per-claim evidence notes

### 2.1 Claim (a) — article 75 (ζ_L proportions across an abelian tower)

Positive-proportion-on-the-critical-line statements for Dedekind zeta or Hecke
L-functions **do not exist in the arXiv-visible literature** (sweeps: "Dedekind zeta" +
"critical line"; "positive proportion" + ("Dedekind zeta"/"Hecke L"); "Levinson" +
("Hecke L"/"Dedekind"); "critical line" + "Hecke L-functions" + "zeros" — all
2026-11-16). What exists:

- **DLRT, arXiv:1908.04876** (abstract fetched): Montgomery-style pair correlation for
  Dedekind zeta of abelian extensions; headline "**for quadratic number fields, more
  than 45% of the zeros are distinct**" — distinctness (not on-line proportion),
  quadratic scope, asymptotic in T. This is the article's own nearest-miss and the
  identification survives external reading.
- **Bansal–Maji, arXiv:2507.18121** (24 Jul 2025, abstract fetched): number-field
  Jacobi-theta analogue ⟹ **infinitely many nontrivial zeros of ζ_F on Re s = 1/2 for
  any number field F**; unconditional (no hypothesis stated in the abstract), **no
  proportion claimed**. This is the closest "on-line zeros of ζ_L for general L"
  statement in the world and is NOT currently cited in article 75 §6 — recommend
  adding (it strengthens the "proportion statements are new" contrast).
- **Off-line zero-density** (different in kind — upper bounds for zeros in Re s > σ):
  Thorner–Zaman arXiv:1510.08086 (log-free zero-density, Hecke L), arXiv:1604.01750
  (least prime ideal), Zaman arXiv:1502.05679 (explicit), Thorner–Zaman arXiv:1906.07717
  (GL(n) log-free), Brumley–Thorner–Zaman arXiv:1804.06402 (Rankin–Selberg). The
  queue's "Linnik-style uniformity / tenths-of-log bounds" resolves to exactly this
  family; none is an on-line proportion.
- The n+1-factor min-assembly arithmetic (multiplicities add over the CFT
  factorization, so proportions pass to min over factors): no explicit statement of
  this form found anywhere — consistent with "corollary-level but unstated" folklore.

Net: the Cycle-2 claim "first ζ_L proportion statements outside the quadratic case"
stands, conditional hypotheses and all.

### 2.2 Claim (b) — articles 42 / 42-M4 (quadratic ζ_K proportions)

- **Lamzouri, arXiv:2609.02882** (abstract fetched): ">2/3 of the zeros … simple and on
  the critical line" = **>67.25%**, distinct ≥ **83.62%**; also NEW endpoints (simple
  OR on-line ≥ 88.76%; average of simple/on-line ≥ 83.62%); ζ only, no Dedekind/Hecke.
  Notable provenance (abstract): it *improves* "a recent proof by Claude (Anthropic's
  AI), verified by Levent Alpöge and Ralph Furman". The donor constants 0.6725/0.83625
  that ZetaZerosV2 formalizes are exactly these.
- **Knausgård, arXiv:2610.08965** (abstract fetched): simple+on-line ≥ **0.67353**,
  distinct ≥ **0.83900** — the world's best informal constants, Lean 4 with
  "analytic inputs included" BUT "relying on **three axioms beyond Mathlib** — one per
  inequality — each recording that a search program returned true". This externally
  confirms the in-repo hygiene narrative (native_decide-class certificate fronting) and
  validates the 42-M4 design choice of the slightly weaker, triad-clean ZetaZerosV2
  endpoints. Companion **arXiv:2609.33043**: distinct ≥ 0.8369928814, Lean components +
  unrefereed computer-assisted final step.
- **Özlük–Snyder** (queue's comparison point): the OpenAlex-confirmed Özlük–Snyder
  paper is "On the distribution of the nontrivial zeros of quadratic L-functions of
  imaginary quadratic number fields close to the real axis", Acta Arithmetica
  **124**(3):205–233, 2006, DOI 10.4064/aa124-3-2 — zero *spacing/location*, not
  proportions. (Their better-known distribution work sits in the Halberstam volume,
  not arXiv-visible; not needed as a proportion competitor.)
- No formal ζ_K proportion statement exists outside this project: the
  QuasiRiemannTracker tracks zero-free constants only; GitHub API searches
  ("zeta function finite field lean", "Tate thesis theorem prover",
  "fine-grained complexity formalization") return 0; arXiv nulls as in §2.1.

### 2.3 Claim (c) — article 50-M2 (strip confinement via the 7/8 donor)

The mathematics is a two-line consequence of the half-plane + the functional equation;
classically dominated by de la Vallée Poussin. The externally-verified state of the
formal race (all fetched 2026-11-16):

- **OpenAI**: [OpenAI26] "The Quasi-Riemann Hypothesis: A Zero-Free Half-Plane
  Re(s) > 7/8" — cited by Liu's arXiv:2610.12234 abstract ("a recent result by OpenAI
  giving a uniform 7/8 zero-free half-plane") and by Frei–Sofos–Widmer
  (arXiv:2610.18491, "breakthroughs of OpenAI and Cureton–Thorner"). A companion
  preprint in the openai-math corpus (build/paper2.tex, Oct 5 2026) isolates the
  weaker 11/12 step for Dirichlet L + Hecke L over ℚ(√−3) — consistent with the
  in-repo record ("several groups proved such half-planes (7/8, 11/12, …)").
- **Liu, arXiv:2610.12234 v2** (abstract fetched): B_new = 0.8749570194… =
  (18ξ+7)/(18ξ+9), ξ the cubic root — matches the liu-zerofree README constant family
  exactly; abstract states "**This result has been formalized by Lean [Liu26]**".
- **Liu, arXiv:2610.26835 v2**: uniform B♭ = 0.8748866470 for finite-order Hecke L
  over **every** number field (informal). **Xu–Sang, arXiv:2610.15291**: 7/8 →
  0.8748867 (Hecke over ℚ(√−3) + Dirichlet). **Ji, arXiv:2611.16665** (2026-11-12):
  Re s > 599/600 for ζ_ℚ(i) (weaker constant, number-field ζ_K scope).
- **QuasiRiemannTracker** (`gtimg.github.io/QuasiRiemannTracker/bound-badge.json`,
  fetched 2026-11-16): "best verified bound θ ≤ 0.873345856106…" — **unchanged** from
  the 2026-11-13 in-repo reading. So the formal Dirichlet frontier still trails the
  informal Hecke frontier (0.8748866–0.8749570) — an iteration-4 gap-closing target.
- **mathlib @ ff2494ea (on-pin ground truth)**: `Nonvanishing.lean:404,417` gives
  `LFunction_ne_zero_of_one_le_re` / `riemannZeta_ne_zero_of_one_le_re` — the Re s ≥ 1
  line ONLY; no half-plane with θ < 1 anywhere in Mathlib (LSeries/ directory read).
  No formal corpus states strip confinement as a headline; nobody external claims
  more than the half-planes above.
- **Cureton–Thorner 31/32**: hexagonmath.org/2610.00200 remains ORCID-gated from this
  environment (PASS-conditional class — see §4); its existence and Dedekind-zeta scope
  are corroborated only indirectly (Bhargava–Vemulapalli arXiv:2611.09031 "assumes the
  quasi-RH for Dedekind zeta functions as recently announced by Cureton and Thorner";
  Cao–Gao–Huang–Nie arXiv:2610.37179 cite "the quasi-Riemann hypothesis result of
  Cureton–Thorner"; Grobner arXiv:2610.24900 cites "an announced uniform zero-free
  half-plane for general Dedekind zeta functions").

Verdict: KNOWN (informal) with the formal consequence a defensible first-of-kind; the
article's own honesty header ("for ζ and Dirichlet L at 7/8 or better we claim no
first") is exactly right. No action.

### 2.4 Claim (d) — article 72 (Rényi no-go gate)

- N1/N2 are textbook: H_α non-increasing in α and H_α ≤ H_0 = log #supp (Rényi 1961,
  Berkeley Symp.; derivative proof per Beck–Schlögl 1993 — statement confirmed on the
  Rényi-entropy reference page). The article itself says "elementary"; the verdict
  codifies it.
- **Kuwahara, arXiv:2610.15199** (abstract fetched, 2026-10-10): title "The Rényi area
  law conjecture is false below α = 1 in **high dimensions**" — constructions in
  **every spatial dimension ≥ 2** (fixed local dimension, bounded interactions,
  uniform gap, unique ground state, adiabatically connected to product states),
  volume-law Rényi-α for all 0 < α < 1, **von Neumann (α = 1) area law still holds**
  in the examples, plus a worst-case **rank–error trade-off** for approximate
  ground-state projectors: optimal Schmidt rank at error ε across a cut of area A
  scales as exp[Õ((A log ε⁻¹)^{2/3})] for log ε⁻¹ ≳ A.
  Two consequences for the article: (i) the abstract's "2D finite-range … Hamiltonians"
  understates the donor theorem (all D ≥ 2 — the gate covers the whole class, a free
  strengthening, relabel); (ii) Kuwahara's own trade-off is about *approximate
  projectors* (sub-boundary log-rank upper bounds), NOT the log-rank ≤ C·|∂A| no-go —
  so article 72's claim that the rank consequence "is never stated in the corpora we
  surveyed" survives this external read (the S₀ ≥ S_α step remains the only bridge,
  and it is ours).
- Formal prior art for entropy: AFP landing/topics scan surfaces quantum entries
  (Quantum Fourier Transform 2025, Kraus Maps, Isabelle Marries Dirac, Compressed
  Oracles, registers, CHSH) but **no entropy entry** (no Rényi/von Neumann/Shannon
  formalization found); mathlib has none (article's claim verified on pin). So
  "mathlib's first quantum entropy definitions" stands; Coq QWIRE/SQIR-class libraries
  are circuit-level and were not found to define Rényi entropies either (search-null;
  no deep audit).

### 2.5 Claim (e) — articles 71/73 (function-field s-plane)

- **mathlib @ ff2494ea**: no zeta function of a curve, no Hasse–Weil, no Weil
  conjectures (greps over Mathlib/ for `hasse_weil`, `WeilConjecture`, curve zeta:
  zero hits; `NumberTheory/FunctionField.lean` + `ClassNumber/FunctionField.lean` are
  function-field class number/valuation material).
- **Isabelle AFP** (landing scan): number-theory entries are ζ(3) (Eberl 2019) and
  ζ(5) (Hyman 2026) irrationality, Chebyshev, Gauss sums, Rademacher, etc. — nothing
  on curves over finite fields or function-field L-functions.
- **GitHub API** searches (0 results each): "zeta function finite field lean";
  "Tate thesis theorem prover"; "fine-grained complexity formalization". (The in-repo
  round-4 sweep additionally found DawidLipin/Project_Tate_Thesis — not re-verified
  externally this session; cite per its in-repo audit trail.)
- **WenrongZou/TateThesis** (fetched): exists, Lean 4 + Mathlib, README = Tate's thesis
  (1950) over **number fields** (global zeta integral Z(f, χ, s), meromorphic
  continuation, functional equation of completed Hecke L), 4 commits on main, "we aim
  to prove" = in progress, PhD project under ANR FALSE. The 73 §6 characterization
  ("number-field, in progress — nearest formal neighbor + clock") is exactly right.
- **AxiomMath `Weil`** (sibling corpus; in-repo G3/G6a): owns the T-variable Weil
  conjectures; no s-plane dictionary anywhere — article 71's "first formal s-plane
  statement" survives every external probe.

### 2.6 Claim (f) — article 11 (+ Cycle-2 M2 TM2 realization)

- **External corroboration of the refutation**: Fischer, arXiv:2610.32162 (2026-10-23):
  "since the 3SUM Hypothesis was recently refuted" — and it rebuilds geometric
  quadratic lower bounds under a "k-AP Hypothesis" instead. No paper in the sweep
  refutes APSP; none formalizes the refutation.
- **No formal reduction-calculus competitor**: arXiv nulls for "fine-grained +
  formalization" (15 hits, all irrelevant — listed), "Isabelle + running time +
  algorithm", "NREST/monadic refinement + time"; AFP topics index (56 Algorithms
  entries) lists no time-complexity/reduction-calculus entry on the scan; the
  in-article §6 characterization (mathlib's TM2 island; Coq/Isabelle complexity
  libraries; corpora Z1) stands.
- Sparsification / forbidden-pair technique papers: no formalization encountered in
  any sweep (negative result, recorded as such).

---

## 3. World scan 2025–2026 (consumables for Iteration 4)

### 3.1 Zeta / zero-free regions / QR-D race — items **[CONSUME]**

1. **QR-D frontier, informal**: Liu arXiv:2610.26835 v2 B♭ = 0.8748866 (uniform,
   finite-order Hecke L, every number field); Xu–Sang arXiv:2610.15291 0.8748867;
   Liu arXiv:2610.12234 v2 B_new = 0.8749570 (Lean, [Liu26]). **Formal** Dirichlet
   frontier (tracker badge, 2026-11-16): θ ≤ 0.873345856106, unchanged since 11-13.
   → Iteration-4 gap: the in-corpus 7/8 donor is now beaten informally by ≈ 0.0001;
   any statement-level port of Liu's B_new (already Lean, external pin) is the cheap
   upgrade path for 50-M2-class strips.
2. **New QR-D consumers** (the race is load-bearing elsewhere — cite-cluster for
   dossiers 70/50): Bhargava–Vemulapalli arXiv:2611.09031 (small defining
   polynomials II, assumes CT quasi-RH); Baldwin–Sivek arXiv:2611.06705 (3-sphere
   recognition in coNP via QRH); Cao–Gao–Huang–Nie arXiv:2610.37179 (sparse poly
   irreducibility: NP-hard + PPT under CT); Frei–Sofos–Widmer arXiv:2610.18491
   (class groups / small generators via OpenAI + CT); Grobner arXiv:2610.24900
   (Euclidean totally real abelian fields); Banks–Shparlinski arXiv:2610.19597;
   Visser arXiv:2610.20058 (primes between 8th powers under the 7/8-QRH);
   Hakimoglu-Brown arXiv:2610.12803 (Λ ≤ 0.13963 **conditional on the 7/8 strip**).
3. **ζ-side proportion constants** (dossiers 42/75 upgrade budget): Lamzouri
   arXiv:2609.02882 (0.6725/0.83625 + NEW 88.76% simple-or-on-line — a NEW donor
   endpoint shape ZetaZerosV2 does not yet export); Knausgård arXiv:2610.08965
   (0.67353/0.83900, 3 search-axioms — never consume at headline level); 2609.33043
   (0.83699).
4. **De Bruijn–Newman**: published record remains Polymath15 (Λ ≤ 0.22, not in the
   arXiv sweep). 2026 preprint burst, ALL preprint-grade (several explicitly
   unrefereed/conditional — do not cite as established): Planat–Raymond arXiv:2611.06245
   (Λ ≤ 0.156821 "certified collision exclusion"), Planat 2610.32694 (0.1732),
   Planat 2610.18214 (0.1486, conditional), Hakimoglu-Brown 2610.12803 (0.13963,
   conditional on 7/8), Freire–González-Riquelme–Muñoz–Poblete–Salinas arXiv:2610.27343
   (generalized Λ_L ≤ 0.2978125 for real primitive Dirichlet characters, conductors
   3–400 — a Dirichlet-class extension worth watching for the QR-D cluster);
   Michalowski 2602.20313 v2 WITHDREW v1 claims (cautionary tale for self-certified
   bounds). No 9/32-class milestone found; the queue's "beyond 9/32" target is
   currently dominated by unrefereed claims only.
5. **Bansal–Maji arXiv:2507.18121**: Hardy-type on-line zeros for ζ_F, any F — cite
   in 75 §6 (and as motivation for the proportion program).

### 3.2 Fine-grained ETH / complexity — items **[CONSUME]**

1. Fischer, arXiv:2610.32162 (post-refutation hypothesis landscape: "k-AP
   Hypothesis") — relevant to dossier 11's M3 instantiation choice (the world is
   already rebuilding lower bounds on replacement hypotheses).
2. Kirkpatrick–Kuszmaul–Mathialagan–Vassilevska Williams, arXiv:2602.11363
   (preprocessed 3SUM, subquadratic space) — 3sum-apsp-adjacent.
3. Space-for-SAT movement is streaming-side only: Sharma–Velusamy arXiv:2604.21922
   (CSP streaming space characterized by non-redundancy; cites Vu TCS 2024 Ω(n^k)
   for k-SAT); Wang–Yang arXiv:2606.05366 (quantum streaming Max-kSAT space
   advantage). **No proof-complexity space-bound (resolution/PCR total space)
   movement found 2025–2026** — dossier 10's uniform poly-space ETH lane stays
   uncontested externally.
4. No formal verification of any fine-grained headline exists outside
   anthropics_formal-math — article 11's lane remains open.

### 3.3 Function-field L-functions

No movement beyond what articles 71/73 already track: no formalization found (nulls in
§2.5); Suzuki arXiv:2610.41115 remains the method neighbour. IEANTN's claim-graph does
not yet have function-field nodes (README fetched — vocabulary + 3 proof-of-concept
nodes only).

### 3.4 LP duality — mandatory nearest-miss cites **CONFIRMED** (exact entries)

| cite | exact AFP entry (isa-afp.org, fetched 2026-11-16) | authors / date | content | maintenance |
|---|---|---|---|---|
| AFP `Farkas` | "Farkas' Lemma and Motzkin's Transposition Theorem" | Bottesch, Haslbeck, Thiemann; Jan 2019 | Farkas (vector/rational), Matrix_Farkas, Motzkin, on a formalized simplex | Isabelle2026 (2026-10-26) |
| AFP `Linear_Programming` | "Linear Programming" | Parsert, Kaliszyk; Aug 2019 | LP via simplex; **weak duality** proved; depends on Farkas + linear-inequalities entries | Isabelle2026 |
| AFP `LP_Duality` | "Duality of Linear Programming" | Thiemann; Feb 2022 | **weak + strong duality** (three sufficient conditions), built on Farkas | Isabelle2026 |
| Coq | arXiv:1706.10269 "A formalization of convex polyhedra based on the simplex method" | Allamigeon, Katz; 2017 (v2 2018) | simplex + correctness/termination, **Farkas, LP duality**, Minkowski | arXiv |

All three AFP entries are alive through Isabelle2026 — the theorem class is owned
outside Lean, exactly as ITERATION4-CHARTER-SPLICE.md §(LP) states; any Lean layer
cites all four and claims ecosystem-first only. (In-repo association of
`Linear_Programming` with arXiv:2403.19639 not re-verified externally; the AFP page
itself dates the entry 2019.)

### 3.5 Quantum area laws — AL-3D B.2/B.3 input

- **Kuwahara arXiv:2610.15199** (see §2.4): Rényi-α<1 area laws FALSE in every D ≥ 2;
  the counterexamples still obey a **von Neumann** area law; α = 1 is the sharp
  threshold in that class. Consequence for AL-3D: the frozen `SlabAreaLaw3D` statement
  bounds `regionEntropy` (von Neumann) — **not** refuted by Kuwahara; any rank-based
  or Rényi-α<1 restatement would be refuted. This is an argument FOR the B.2 statement
  as frozen (α = 1 only), and it independently justifies the article-72 fence.
- **No positive 3D / general-D area law theorem exists informally** (Kuwahara author
  sweep 2012–2026 fetched: 1D long-range, fully-connected, Kac, thermal results; the
  general-D local-gapped positive case is untouched). Related consumables: Kuwahara
  arXiv:2609.36113 (collectivity limits entanglement: Kac-normalized power-law
  log/polylog bounds), arXiv:2609.27497 (optimal low-rank compression of dynamics,
  Rényi growth laws), Kim et al. arXiv:2509.12014 (spectral SIE, 1D long-range).
  The donor's own "AreaLaw3D not a target" verdict (Targets.md §A, in-repo) is
  consistent with the informal frontier; B.2 vs B.3 remains a Lean-internal choice —
  world evidence is neutral.

### 3.6 PrimeNumberTheoremAnd / IEANTN — register-and-port triggers

- **T3 NOT triggered** (fetched 2026-11-16): upstream `AlexKontorovich/
  PrimeNumberTheoremAnd` master `lean-toolchain` = `leanprover/lean4:v4.35.0` (raw
  file fetched); README shows an active repo (3,524 commits, 27 issues, 29 PRs), no
  mathlib-landing note. The register-and-port triggers in
  `novelty/pntplus-glue-as-donor.md` §c remain as written.
- **teorth/IEANTN** (fetched): "Integrated Explicit Analytic Number Theory Network" —
  a claim-graph (nodes = claims with declared assumptions + evidence: Lean-via-
  Comparator / numerical / citation; proofs live in separate Solutions projects; one
  intentional 'sorry' per challenge node), early-stage-but-functional (651 commits,
  verification receipts, CI), grew out of PNT+'s IEANTN subproject (move notice
  2026-08). **[WATCH]**: its evidence-metadata pattern is the ecosystem-facing
  version of our donor-hygiene gates — potential consumer/producer of statement
  fingerprints for the qa/decl-index workstream.

### 3.7 Cross-cutting formal-math world items

- **Lamzouri 2609.02882 improving a Claude/Anthropic proof verified by
  Alpöge–Furman** (abstract): documents an Anthropic→community improvement chain for
  the ζ proportion constants — context for the zeta23 lineage and for how quickly
  formal-adjacent constants move.
- **AFP quantum entries** (Quantum Fourier Transform, Kraus Maps, 2025) — no entropy;
  if article 72's interface work ever needs a cross-library bridge, none exists yet.

---

## 4. Citation-convention notes (evidence conditionality class)

1. **hexagonmath.org ORCID-gate class (PASS-conditional)**: Cureton–Thorner,
   *A quasi-Riemann hypothesis for Dedekind zeta functions*,
   hexagonmath.org/2610.00200 — NOT directly readable from this environment; every
   citation of the 31/32 constant must carry the gate marker. Its existence/scope is
   corroborated only via secondary arXiv citations (Bhargava–Vemulapalli 2611.09031;
   Cao et al. 2610.37179; Grobner 2610.24900; Frei–Sofos–Widmer 2610.18491) —
   secondary corroboration is itself citable, and this session adds four such cites.
2. **Preprint-grade numerics (never cite as established)**: all de Bruijn–Newman
   sub-0.2 upper bounds (§3.1.4) — several self-described unrefereed/conditional; one
   (Michalowski 2602.20313) already retracted v1 claims. Knausgård's 0.67353/0.83900
   carry three non-triad axioms in their own Lean (author-disclosed).
3. **Live-badge cites**: QuasiRiemannTracker `bound-badge.json` read 2026-11-16
   (θ ≤ 0.873345856106) — cite with read date; the catalogue asset exists for detail.
4. **Tool-conditioned nulls**: zbMATH 403-blocked (no zbMATH evidence this session);
   DuckDuckGo HTML CAPTCHA-blocked; GitHub API unauthenticated search has strict AND
   semantics — a 0-result GitHub query is weak-negative evidence, recorded as such.
   OpenAlex used as bibliographic fallback (Özlük–Snyder DOI 10.4064/aa124-3-2).
5. **arXiv API** (`export.arxiv.org/api/query`) was rate-flaky (two 503/timeouts);
   listings that succeeded are the citable ones; every abstract-level claim above
   comes from a direct abs-page fetch, not from listing snippets alone.

---

## 5. Bottom line

- **No Cycle-2 headline is killed by external prior art.** Two claims are textbook in
  their internal mathematics (72's N1/N2; 50-M2's confinement) and both articles
  already say so; one (75) gains a missing nearest-miss citation (Bansal–Maji); one
  (72) should be relabelled to Kuwahara's actual scope (all D ≥ 2, not 2D) and pick
  up the textbook cites; the formalization-first claims (71/73) and the framework
  claim (11) survive every external probe with margin.
- **Strongest iteration-4 consumables**: (i) the informal–formal QR-D constant gap
  (0.8748866–0.8749570 informal vs 0.8733458 formal-Dirichlet / 7/8 in-corpus donor);
  (ii) Lamzouri's NEW 88.76% simple-or-on-line endpoint as a future donor shape;
  (iii) Kuwahara's rank–error trade-off as the positive counterpart to the 72 fence;
  (iv) the confirmed AFP/Coq LP-duality cite set; (v) IEANTN's claim-graph as a
  watch item. PNT+ T3 remains untriggered (v4.35.0).
