# Novelty verification — round 1

Lane R8 ("novelty"), 2026-11-09. Scope: the donor/gap claims of
`research/survey/anthropics.md` §4 (bridging hooks) checked against the outside
world — mathlib upstream, the wider Lean ecosystem, other proof assistants
(Isabelle AFP, Coq/mathcomp, Agda), and the informal literature (arXiv).
Ground truth for "absent from mathlib" is the **local checkout
`encore-mathlib/repo/mathlib4` at commit `ff2494ea`, dated 2026-11-09** (i.e.
today; greps are current, not stale-snapshot claims).

## Method note (search drills for later rounds)

1. **mathlib absence**: `rg` the local checkout (verify freshness first:
   `git log -1 --format='%H %ad'`). Declarations-level grep beats every web
   search. Then GitHub for *intent*:
   `api.github.com/search/issues?q=repo:leanprover-community/mathlib4+"<phrase>"`
   (unauthenticated curl works; 60 req/h). Code search API needs auth — don't
   bother, local grep is authoritative.
2. **Ecosystem**: `api.github.com/search/repositories?q="<phrase>"+language:Lean`
   for competing formalizations; `raw.githubusercontent.com/<repo>/HEAD/<file>`
   to audit a hit cheaply (always audit "formalization" repos for stubs/sorry —
   see item 2's cautionary tale); `<repo>/git/trees/<branch>?recursive=1` for
   full file inventories.
3. **arXiv**: use **https** (the http endpoint fails silently!):
   `https://export.arxiv.org/api/query?id_list=<id>` or
   `?search_query=all:%22<phrase>%22&max_results=N`. Good for follow-up scans;
   returns full abstract + authors.
4. **AFP**: website is blocked/broken from this sandbox; use the GitHub mirror
   `isabelle-prover/mirror-afp-devel`: full 1044-entry list =
   git-trees API on `thys/`; per-entry audit via raw file fetch.
5. **General web**: DuckDuckGo html endpoint is bot-blocked; Bing mangles
   quoted phrases (returns garbage for "von …"). Reliable substitute: WebFetch
   on known URLs, esp. **`arxiv.org/html/<id><version>`** — fulltext Q&A against
   a paper (where the Montgomery–Taylor and bandwidth-one answers below came
   from). zai-search MCP quota was exhausted this round — plan around it.
6. **Cross-corpus absence** (Phase-3 requirement "absent from all four
   corpora"): `rg` sweeps over `openai-math/lean`, `tauceti/`, plus mathlib.
   NB: the Bash output filter garbles certain keywords in *displayed* output
   (e.g. "von Mangoldt", "zero", "ETH", "RAM", "Newman" all rendered as "il") —
   infer from file paths and structure, re-run with different phrasing if in
   doubt.

---

## 1. von Neumann trace inequality (Hermitian)

**Claim (anthropics.md §4)**: "`Zeta23/LinAlg/VonNeumann.lean` — von Neumann's
trace inequality for Hermitian matrices … mathlib lacks it as a standalone API.
Donable."

**Searches**: local mathlib rg (`von_neumann`, `trace.*inequal`,
SingularValues.lean); mathlib4 issue/PR API search "von Neumann trace",
"trace inequality"; arXiv `all:"von Neumann trace inequality" AND all:formal`;
AFP full entry scan; mathcomp issue search; Coq repo search (`spectral theorem
Coq` → CohenCyril/spectral).

**Evidence**:
- mathlib (2026-11-09): only `SetTheory/ZFC/VonNeumann.lean` (ordinals). No
  trace inequality anywhere; `Analysis/InnerProductSpace/SingularValues.lean`
  stops at antitone/support basics; `Analysis/InnerProductSpace/NormDet.lean`
  no help. Issues/PRs: 0 hits ("von Neumann trace"), 2 irrelevant ("trace
  inequality").
- Other provers: AFP (1044 entries) — none; math-comp — 0 issues;
  `CohenCyril/spectral` (Coq spectral theorem, draft, superseded by mathcomp
  `forms` branch) — no von Neumann trace; no Agda hits. arXiv — 0.
- Classical: von Neumann 1937; the zeta23 proof (Birkhoff–von Neumann +
  rearrangement) is the textbook one (Horn–Johnson, *Matrix Analysis*) — and
  mathlib already has both ingredients (`exists_eq_sum_perm_of_mem_doublyStochastic`,
  `Monovary.sum_mul_comp_perm_le_sum_mul`), so donation is genuinely cheap.

**Verdict**: (a) absence from mathlib **correct**; no formalization found in
any other prover. (b) Statement classical (1937). (c) **KNOWN-INFORMAL-ONLY**
— donor claim NEW-CLAIM-SUPPORTED. Confidence: high (mathlib), medium-high
(other provers, keyword-based).

## 2. Riemann–von Mangoldt zero counting N(T)

**Claim**: "mathlib's zeta development has no zero-counting; this is the first
formal RvM."

**Searches**: mathlib rg (`von Mangoldt`, `zeroCounting`, `numberOfZeros`,
`criticalLine`, argument principle); GitHub repo search
`"Riemann-von Mangoldt" language:Lean` → exactly one hit, audited; IEANTN
(`teorth/IEANTN`) tree + node files; openai-math sweep; AFP `Zeta_Function`
audit.

**Evidence**:
- mathlib: `NumberTheory/LSeries/ZetaZeros.lean` (new, Huanyu Zheng, 2026)
  proves only **discreteness** of the zero set; `HardyZ.lean` gives
  `hardyZ_eq_zero_iff`; `RiemannHypothesis : Prop` defined
  (`RiemannZeta.lean:185`) but no counting function, no argument principle.
  Zero counting: 0 hits in issues/PRs (the 11 "von Mangoldt" hits are the
  arithmetic function + in-flight PNT/Mertens PRs #41394, #44062, #43238,
  #43233 Wiener–Ikehara merged).
- `e-271828/riemann-von-mangoldt-formalized` (2026-04-12, Lean, the only
  "Riemann-von Mangoldt" repo): **audited and rejected** — single 2909-line
  file whose main formula is a stub ("Stubs for RiemannVonMangoldtFormula
  (assumed proven in a separate V7 library)" — no such library in the repo);
  the θ-asymptotic lemma is proved from a *definitionally identical* main
  term (tautology); AI-coauthored README. Not a formalization.
- **`teorth/IEANTN` (Terence Tao's Integrated Explicit Analytic Number Theory
  network, 1244 files)**: `Vocabulary/Zeta.lean` defines `zetaZeroes`,
  `zetaZeroesSum`, `zetaN (T)` and `HasRvMBound b₁ b₂ b₃` — the counting API
  exists. Node `ZeroCount.v1` (Rosser's explicit |Q(t)| ≤ (1/5)log t + 2 via
  Chirre–Helfgott, arXiv:2512.15709 Lemma B.1) has **`status: stub`**
  (challenge-only, sorry-by-design). `Solutions/RosserSchoenfeld.v2/` contains
  Backlund/argument machinery (`BacklundAnchor`, `ExactArgument`, `LegsArg`,
  `HardyFirstZero`, `HardyTenZeros`, `RHHeight100/TwentyNineZeros`) — RvM
  components under construction, headline count not yet proved.
- openai-math: `ModFiveZeroCount.lean` proves a Jensen-type *local* multiplicity
  bound in a fixed disk for mod-5 L-functions — not an N(T) asymptotic.
- AFP `Zeta_Function` (Eberl): nonvanishing Re ≥ 1, functional equation;
  no counting. Coq/Agda: nothing.

**Verdict**: (a) absent from mathlib **correct**; no completed formalization
elsewhere (one fake, one stub). (b) classical (Riemann 1859; von Mangoldt
1895/1905; Backlund 1918). (c) **NEW-CLAIM-SUPPORTED** ("first formal RvM"
stands as of 2026-11-09) — **but flag high collision risk**: Tao's IEANTN has
the vocabulary and is actively building the proof; expect a second formal RvM
within months. Any candidate dossier leaning on RvM-donation should say so.
Confidence: medium-high.

## 3. Weil's explicit formula (ζ, L-functions)

**Claim**: "`Zeta23/WeilEF/` … the entry API for any future explicit-formula
work in mathlib."

**Searches**: mathlib rg ("explicit formula", Weil); IEANTN tree
(`[Ee]xplicit` — 0 file hits); AFP scan; arXiv.

**Evidence**: mathlib "explicit formula" hits are all unrelated (explicit
*values*). No prover found with Weil's EF: AFP has no entry; Coq/Agda nothing;
IEANTN has the *zero-sum* vocabulary (`zetaZeroesSum`) and an **active**
`PlattZeroSum.v1` node (`inv_ordinate_sum_le`, Platt's zero-sum bound) plus
`CH2.v1/Section6Zeros+7Zeros` (Chirre–Helfgott ladder) — explicit-formula
*adjacent* machinery exists there, but no Weil EF statement. openai-math's
TwoPointCorrelations builds Perron/Halász/MRT machinery — von Mangoldt-weighted
sums, not a zero-side explicit formula.

**Verdict**: (a) formal absence **correct** (with the IEANTN caveat: zero-sum
API exists, a future Weil-EF node is likely there). (b) classical (Weil 1940s;
[IK04, Thm 5.12]). (c) **KNOWN-INFORMAL-ONLY**; donor claim SUPPORTED.
Confidence: medium.

## 4. Zero-density (≥2/3 simple on line); Alpöge–Furman record status

**Claim**: zeta23 formalizes "≥ 2/3 simple+on-line, 5/6 distinct; MT-window
0.6725/0.8363" — is arXiv:2608.13637 the current record; updates?

**Searches**: arXiv API (id_list 2608.13637; `all:"rank-trace inequality"`;
title searches); authors extracted; follow-ups via `all:"thin matrix"`-style
scans and citation chases.

**Evidence**:
- arXiv:2608.13637 (Levent Alpöge, Ralph Furman): v1 2026-08-13, **v2
  2026-08-19 is the latest version**. Abstract: unconditional ≥ 2/3 simple
  on-line, ≥ 5/6 distinct; "the previous unconditional records are 5/12 and
  0.6603"; MT-window gives 0.6725 / 0.8362; "formally verified in Lean 4";
  "Proof discovered autonomously by Claude (Anthropic); verified a[udit…]".
  Analytic inputs "of Aryan and of Baluyot, Goldston, Suriajaya and
  Turnage-Butterbaugh".
- **Independent new proof**: arXiv:2609.02882 (**Youness Lamzouri**), v2
  2026-09-08: "new, conceptually simpler, unconditional proof" of the same
  67.25% / 83.62% constants, **plus two new estimates** (proportion simple-OR-
  on-line ≥ 88.76%; average of the two proportions ≥ 83.62%). Its abstract
  explicitly describes the AF paper as "produced by an internal research
  version of Claude … subsequently verified by … Alpöge and Furman".
- Extensions in the same ecosystem: arXiv:2608.16034 (prime-modulus Dirichlet
  family, near-microscopic to polylog heights), arXiv:2609.27808 (Gevrey
  localization, same family). No paper found improving 0.6725 for ζ itself.
- Formalizations: only zeta23 (paper says so; no other prover found).

**Verdict**: (a) formal-first **correct** (only zeta23). (b) **KNOWN-INFORMAL**
— multiply established (AF + Lamzouri + family extensions); AF 2608.13637v2
remains the current record for ζ (tied by Lamzouri's reproof; Lamzouri adds
new qualitative constants but no better on-line proportion). (c)
**NEW-CLAIM-SUPPORTED** for "first formal"; the *statement* is
KNOWN-INFORMAL-ONLY. Confidence: high.

## 5. Word-RAM machine model formalizations

**Claim**: "`3sum-apsp/EndStatement.lean` — a 139-line self-contained word-RAM
… could be lifted into mathlib … as the reference word-RAM model."

**Searches**: mathlib rg ("word RAM"); GitHub repo searches (`"word RAM"`
+language:Lean; `"word RAM" formalization`); arXiv `all:"word RAM" AND
all:formal`; AFP scan; **local sweep of openai-math/lean**.

**Evidence**:
- mathlib: absent (0 hits). AFP: no RAM entry (`Cook_Levin` is TM-based;
  `Octonions`… irrelevant here). Coq/Agda: nothing found. arXiv: 0.
- **openai-math has a second, independent RAM formalization**:
  `lean/OAI/Computability/WeisfeilerLeman/{RAMMemory,RAMInstruction,RAMBounds,
  RAMSimulation}.lean` (word operations, bounded runs, simulation-to-cost),
  plus `FourierTransform/RAM.lean`; used for the Weisfeiler–Leman lower bound
  result ("n^{Ω(k)} … on multitape Turing machines and sequential
  logarithmic-RAMs with fixed polynomial-bit-time instructions",
  openai-math CONTENTS.md). A third cost layer exists there too
  (`MatchingCount/Complexity/StackCompilerCost.lean` over `Turing.lto1`).

**Verdict**: (a) absent from mathlib **correct**, but 3sum-apsp's model is
**not the only Lean RAM formalization** — openai-math's log-RAM (and its
TM-cost layer) is a sibling. (b) classical model (standard algorithms
literature). (c) **NEW-CLAIM-CONTESTED** as a uniqueness-style claim; the
*mathlib donation* claim survives. Phase-2 consequence: three incompatible
machine-model/cost formalizations now exist across corpora (3sum-apsp
word-RAM, eth TM2, openai-math log-RAM + lto1) — a confirmed empty zone and a
prime unification target. Confidence: high.

## 6. Time-complexity API over Turing machines in mathlib

**Claim**: "eth's `machines/ToTuring/` … a reusable complexity layer over
`Mathlib.Computability.TuringMachine` that mathlib itself lacks (mathlib has
machines, almost no time-complexity API)."

**Searches**: mathlib rg (`TM2OutputsInTime`, `ComputableInTime`,
`PolyTime`); file read of `Computability/TuringMachine/Computable.lean`.

**Evidence**: mathlib **has** the base predicates:
`Mathlib/Computability/TuringMachine/Computable.lean:130 TM2OutputsInTime`,
`:161 TM2ComputableInTime`, `:174 TM2ComputableInPolyTime`,
`:216 idComputableInPolyTime` (eth itself imports `TM2OutputsInTime` — survey
§3). What mathlib lacks is the *derivation* machinery: step-cost → TM2-time
certificates (`PolyT`, `steps_to_time`, `exists_tm_padded` have no upstream
counterpart), and any subexponential-time API. Also new upstream:
`Mathlib/Computability/AkraBazzi/` (asymptotic recursion), Wiener–Ikehara,
in-flight Mertens/PNT PRs — adjacent layers are landing.

**Verdict**: (a) "mathlib lacks a time-complexity API" is **overstated** —
the base API exists upstream; the *derivation framework* is genuinely absent.
(b) n/a. (c) **NEW-CLAIM-CONTESTED** as phrased; narrower claim (certificate
layer absent) SUPPORTED. Confidence: high.

## 7. Rank–trace inequality c·trP − (c²/4)r + 2c·trQ − c²b ≤ ‖P+Q‖²_F

**Claim**: "a new elementary matrix inequality, mathlib-ready" (paper appendix).

**Searches**: arXiv `all:"rank-trace inequality"`; classical-neighborhood
reasoning (Ky Fan, Wielandt–Hoffman, Fejér, inertia theory — no exact-match
literature search possible this round: general engines blocked; noted below);
mathlib rg.

**Evidence**: arXiv "rank-trace inequality" → only the AF paper and its
follow-up cluster. The statement combines Cauchy–Schwarz-type trace/rank
control with a positive-inertia term; tight at P = (c/2)·(rank-r projection).
The AF abstract names "a rank-trace inequality" as the paper's new device
(making Montgomery's 1973 deduction unconditional); Lamzouri 2609.02882
advertises a route without it. No classical antecedent located in the
literature reachable this round (Carlen's trace-inequality survey and Bhatia's
books should be checked by hand in round 2 — they are not machine-searchable
here).

**Verdict**: (a) absent from mathlib (trivially — nothing comparable exists
there). (b) **plausibly NEW**; no counterexample found. (c)
**NEW-CLAIM-SUPPORTED** at medium confidence — keyword-based absence only;
schedule a round-2 manual check vs Carlen 2010 / Bhatia (e.g., the
tr ≤ √r·‖·‖_F primitive is classical, but the inertial combination appears
unpublished pre-AF). Same status for the tightness statement
`lemmaR_tight`. Confidence: medium.

## 8. ETH/SETH/NSETH formalized

**Claim**: "eth refutes ETH unconditionally — check whether any other formal
statement of ETH exists anywhere."

**Searches**: GitHub repo search `"exponential time hypothesis" language:Lean`;
repo audits (README + metadata via API); openai-math local sweep; arXiv title
search.

**Evidence**:
- **OpenAI**: preprint *"The Exponential Time Hypothesis is False"* (17 Oct
  2026, rev. 25 Oct 2026), in-repo at `openai-math/preprints/...October-25-2026/`
  with Lean formalization `lean/ComparatorChallenges/SubexponentialSAT.lean` +
  `lean/OAI/Algorithms/SubexponentialSAT/` (source repo `openai/math`, commit
  `7ef5c0cc…`). openai-math `history.md`: an independent working group led by
  **Impagliazzo, Paturi, Williams** is examining the proof. Not on arXiv.
- **Independent verification**: `unaltuzun/exponential-time-hypothesis-verify`
  (27 Oct 2026) — kernel-level reproduction ("Verdict: KERNEL-VERIFIED"),
  statement-fidelity audit, independent mechanism test; references the OpenAI
  materials by path+hash.
- **Independent simplifications**: `suquark/NotETHSimplified` (31 Oct 2026) —
  two *new* proofs ("One Pigeonhole…", "Uncrossing Wires…"), each formalized in
  Lean "down to a primitive multitape machine".
- Both anthropics-eth and OpenAI refute SETH; anthropics-eth also refutes
  NSETH (`PaperIndex.nsethFails`); no other prover (AFP/Coq/Agda) has any ETH
  formalization found.

**Verdict**: (a) **other formal ETH statements exist** — at least two more
Lean formalizations besides anthropics-eth. (b) KNOWN-INFORMAL (multi-paper,
with a named external examination panel). (c) **NEW-CLAIM-CONTESTED** if read
as unique; the genuinely open object is cross-corpus (three Lean formalizations
of "subexponential k-SAT", three machine models — unifying them is a natural
discovery-shaped bridge). Confidence: high.

## 9. 3SUM/APSP truly-subquadratic (arXiv:2610.06783)

**Claim**: formalization status elsewhere; updates/follow-ups.

**Searches**: arXiv id_list + authors; `all:"thin matrix" AND cat:cs.DS`
recent-sort; follow-up abstracts.

**Evidence**:
- arXiv:2610.06783v1 (2026-10-05; **Josh Alman, Virginia Vassilevska
  Williams**): first poly improvements — 3SUM O(n^1.9992), APSP
  O(n^2.9995 abstract; 2.99942 as quoted precisely in the follow-up and in
  the Lean statements), Exact Triangle 2.9983; thin-matrix theorem (D ≤ N^ε,
  ε < 0.1204); refutes 3SUM/APSP hypotheses + real versions + Exact Triangle +
  Zero-Weight k-Clique + three rectangular hinted OMv conjectures of
  van den Brand–Nanongkai–Saranurak.
- **Follow-ups already**: arXiv:2610.17420 (2026-10-12) — thin products to
  D ≤ N^0.172, lossless reductions, 3SUM over abelian groups, dichotomy;
  arXiv:2610.20297 (2026-10-14) — simpler/faster (min,+) product and APSP.
- Formalizations: only 3sum-apsp found (no other prover).

**Verdict**: (a) formal-first stands. (b) **KNOWN-INFORMAL** with an active
two-week follow-up literature (exponents already being improved). (c)
**KNOWN-INFORMAL-ONLY** (informal side), first formal = corpus. Confidence:
high.

## 10. Montgomery–Taylor constants (2−1/c₁* ≈ 0.6725) and 0.6818 ceiling

**Claim**: "with the Montgomery–Taylor optimal window the constants improve to
2−1/c₁* ≈ 0.6725 and (3−1/c₁*)/2 ≈ 0.8363"; bandwidth-one ceiling 0.6818 —
known?

**Searches**: WebFetch fulltext Q&A on `arxiv.org/html/2608.13637v2`
(definition/attribution of the window; presence of the ceiling).

**Evidence**:
- The window ψMT(s) = cos(2s)·1[−1/2,1/2](s) is defined in AF §2.2 eq. (2.6);
  Lemma 5.6 computes cMT⁻¹ = 1/2 + (1/√2)cot(1/√2), giving 2−cMT⁻¹ = 0.67250…;
  **optimality among windows is cited to prior work [CCLM17, Cor. 14]**
  (Carneiro–Chandee–Littmann–Milinovich); 2/3 is Montgomery 1973, 5/6
  Conrey–Ghosh–Gonek (both classical, conditional on RH). New in AF:
  *unconditionality* (rank–trace replacing RH), not the constants.
- **Bandwidth-one ceiling is in the paper**: §7.2 "The bandwidth-one ceiling"
  (2/3 is "within 0.016 of the ceiling of its own method"; p₀ ≤ 0.6818287
  exact rational optimum of the 256-periodic law; below 0.6819 for both §2.6
  windows; §1.1: "≈ 0.682"), citing the Lean `Zeta23.PairCeiling.ceiling_law256`
  and the interval-arithmetic `EnclOK` enclosures ("255 near-CUE row
  inequalities"). So it is a paper-level result (not merely repo-internal),
  and as an optimality barrier it appears **new** (introduced by AF);
  near-CUE form-factor context is classical.

**Verdict**: (a) first formal: zeta23 only. (b) constants **KNOWN-INFORMAL**
(classical window + CCLM17 optimality; classical conditional proportions);
ceiling **new** (AF paper). (c) constants: KNOWN-INFORMAL-ONLY; ceiling:
NEW-CLAIM-SUPPORTED. Confidence: high.

## 11. Eight-square sign identity σ(p,q)σ(p′,q′)+σ(p,q′)σ(p′,q)=0

**Claim**: `eth` `Eight.signs` — "the eight-square identity", classical form?
formalization status?

**Searches**: read `eth/proof/statements/EightSquareStatement.lean`; mathlib
octonion/quaternion/Cayley–Dickson hunt; AFP `Octonions` entry audit; arXiv
`abs:"eight-square identity"`.

**Evidence**:
- The Lean statement: σ(p,q) = (−1)^{φ(p,q)} with φ a specific quadratic+
  trilinear form on two 3-bit blocks; identity holds whenever p⊕q = p′⊕q′
  (q≠q′). The paper's own §4 header: "starts from the eight-square identity
  of **Degen and Graves**" — the paper itself attributes it to the classical
  identity (Degen 1822; Graves 1843/Cayley 1845 = octonion norm
  multiplicativity).
- mathlib: **no octonions at all** (quaternions only:
  `Mathlib/Algebra/Quaternion.lean`; no Cayley–Dickson construction). So the
  8-square content is absent from mathlib in *every* form.
- Isabelle: AFP entry **`Octonions`** contains
  `multiplicative_norm_octo: "norm (x * y) = norm x * norm y"` (Octonions.thy:363)
  — Degen's identity formalized in norm form. The specific *sign/indicator*
  form of eth is found nowhere else (arXiv: only an octonion-history survey,
  0803.0119).

**Verdict**: (a) the identity's classical content **is formalized in
Isabelle** (norm form); the eth sign-form is a corpus-internal repackaging.
(b) classical (Degen–Graves). (c) **KNOWN-INFORMAL-ONLY** — low mathematical
novelty as a statement; the *donor* insight it exposes is different and real:
**mathlib lacks octonions entirely**, so "8-square identity / octonion norm
multiplicativity for mathlib" is a valid, cheap donation (via AFP's proof or
eth's sign identity). Confidence: medium-high.

## 12. De Bruijn–Newman constant Λ

**Claim**: relevance — zeta23 XiPrime proved Re ξ′/ξ > 0 on Re s ≥ 1;
formalization status of Λ anywhere?

**Searches**: GitHub repo search `"de Bruijn-Newman" zeta` (+ audits); arXiv
`abs:"de Bruijn-Newman" AND abs:formal`; AFP full scan (Newman etc.);
mathlib rg; classical anchor check (Farmer–Gonek).

**Evidence**:
- No formalization found anywhere: mathlib nothing (only `RiemannHypothesis`
  Prop); AFP 1044 entries — none (only `Neumann_Morgenstuen_Utility`,
  game theory); GitHub hits are **Python** labs (`caramaschiHG/riemann-debruijn-lab`;
  `Hashirama1337s/debruijn-newman-degree-two`, Python, 2026-10-30); arXiv 0.
- Classical: De Bruijn 1950; Newman 1976 (Λ ≥ 0 ⟺ RH); Ki–Kim–Lee DPF work;
  Rodgers–Tao 2018 (Λ = 0). ξ′ neighbors: Farmer–Gonek arXiv:0803.0425
  (pair correlation of ξ′ zeros, **RH-conditional**, proportions of simple
  ξ′ zeros conditional); Bui arXiv:0903.4006 (gaps between ξ′ zeros,
  RH-conditional). The zeta23 XiPrime results are **unconditional**
  (per anthropics.md: "#print axioms-audited", "beyond the paper's
  statements") — the ξ′ percentages (≥ 85.838% simple+on-line) would then be
  new-math claims at the repo level, not checked by the AF paper text.
  Note: anthropics.md's citation "arXiv:0803.025/J.LMS 2014" is a garbled
  reference — the actual papers are 0803.0425 (Farmer–Gonek, 2008) and
  0903.4006 (Bui, 2009, JTNB 2010).

**Verdict**: (a) Λ **absent everywhere** (all assistants) — gap confirmed.
(b) Λ-theory classical. (c) formal-Λ gap: **NEW-CLAIM-SUPPORTED**; the
unconditional ξ′ proportion statements: plausibly NEW mathematics (round-2
deep check needed — not covered by the AF paper's own text). Confidence:
medium-high (absence), medium (ξ′ novelty).

---

## Summary table

| # | Topic | (a) absence claim | (b) classical status | (c) verdict | Conf. |
|---|---|---|---|---|---|
| 1 | von Neumann trace ineq | mathlib: YES; all provers: yes | classical (1937) | KNOWN-INFORMAL-ONLY; donor SUPPORTED | high |
| 2 | RvM N(T) | mathlib: YES; elsewhere: 1 fake + IEANTN stub | classical | NEW-CLAIM-SUPPORTED (first formal), IEANTN collision risk | med-high |
| 3 | Weil explicit formula | YES (IEANTN zero-sum caveat) | classical | KNOWN-INFORMAL-ONLY; donor SUPPORTED | medium |
| 4 | ≥2/3 zero-density | formal: only zeta23 | AF 2608.13637v2 = record; Lamzouri 2609.02882 independent reproof + new constants | KNOWN-INFORMAL; first-formal SUPPORTED | high |
| 5 | word-RAM model | mathlib: YES, **but openai-math has its own RAM/log-RAM** | classical | NEW-CLAIM-CONTESTED (uniqueness); donation OK | high |
| 6 | TM time API | **CONTESTED**: mathlib has TM2OutputsInTime/InPolyTime; lacks derivation layer | n/a | NEW-CLAIM-CONTESTED as phrased | high |
| 7 | rank–trace inequality | mathlib trivially | no antecedent found | NEW-CLAIM-SUPPORTED (plausible new; round-2 manual check) | medium |
| 8 | ETH formalized | **NO — OpenAI + suquark + verifier exist** | KNOWN-INFORMAL (multi-paper, panel) | NEW-CLAIM-CONTESTED (uniqueness) | high |
| 9 | 3SUM/APSP | formal: only corpus | KNOWN-INFORMAL + fast follow-ups (2610.17420, 2610.20297) | KNOWN-INFORMAL-ONLY; first formal stands | high |
| 10 | MT constants / 0.6818 ceiling | formal: only zeta23 | constants classical (+CCLM17 Cor. 14); ceiling new-in-AF (§7.2) | constants KNOWN-INFORMAL-ONLY; ceiling NEW-CLAIM-SUPPORTED | high |
| 11 | eight-square sign identity | octonion norm form IN AFP; mathlib has no octonions | classical (Degen–Graves) | KNOWN-INFORMAL-ONLY; exposes "octonions for mathlib" donation | med-high |
| 12 | De Bruijn–Newman Λ | absent everywhere | classical | NEW-CLAIM-SUPPORTED (Λ gap); ξ′ unconditional % plausibly new | med-high |

## Surprises worth carrying to Phase 2/3

1. **openai-math also refutes ETH** (preprint 17/25 Oct 2026, Lean-comparator
   formalization) — the anthropics `eth` project is one of *three* Lean
   formalizations (plus unaltuzun's kernel-verified reproduction and suquark's
   simplified proofs). No survey lane should treat "ETH is false" as
   single-source.
2. **teorth/IEANTN** (Tao) is the densest collision field: zero-count
   vocabulary + RvM stub node + Rosser–Schoenfeld/Backlund solutions +
   PlattZeroSum. RvM/Weil-EF-related donations have a shelf life.
3. **openai-math has a second RAM formalization** (WeisfeilerLeman log-RAM) —
   machine-model unification is now a *three-way* empty zone.
4. **mathlib's zeta area is moving fast**: new 2026 files HardyZ, ZetaZeros
   (discreteness), WienerIkehara, plus in-flight Mertens/PNT PRs (#41394,
   #44062, #43238) — the FromPNTPlus port's target gap is closing upstream.
5. **mathlib has no octonions** (only quaternions) — an unexpected cheap
   donation surface surfaced by item 11.
6. The AF attribution nuance: per Lamzouri's abstract, the AF proof was
   "produced by an internal research version of Claude … and subsequently
   verified by Alpöge and Furman" — relevant when citing provenance.
