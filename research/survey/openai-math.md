# Phase 1 survey — openai-math

Corpus root: `/home/doz/zcode-workdir/openai-math` (git `4eaee8754`, "Merge pull request #4 …
update-10-29", read-only). Manuscripts produced by an unnamed internal OpenAI model ("raw research
data, rather than polished academic papers", `README.md:12`); Lean formalizations accompanying
~42% of top-line results. This is by far the largest of the four corpora (721 manuscripts in 373
families; Lean library ≈ 29.7M lines) — this survey maps the whole territory at family granularity
and goes deep on the results most relevant to the charter's bridging targets (complexity,
analytic number theory, linear algebra/tensors, Fock-space operators).

## 0. Corpus snapshot

| | manuscripts | Lean library | verification |
|---|---|---|---|
| Scale | 373 result families, 721 manuscripts (`overview.tex:49`; `README.md:16`); `preprints/` holds 751 version-dated dirs (editions preserved across revisions); `reasoning_traces/` = 10 abridged chain-of-thought PDFs for families 007, 017, 087, 102, 159, 197, 221, 271, 287, 362 | one monolithic library `lean/OAI/`: 27 subject dirs (Algebra … Topology), **162,417 `.lean` files, 29,694,194 lines**; root module `lean/OAI.lean`; largest subdirs: `OAI/Probability` 12,971 files, `OAI/Computability` 5,213, `OAI/NumberTheory/DirichletL` 2,926 (486,558 lines), `OAI/Algorithms` 3,977 (710,320 lines) | Palomar-style Comparator: 418 trusted statement files `lean/ComparatorChallenges/*.lean` (sorry by design) + 418 JSON configs (`challenge_module`/`solution_module`/`permitted_axioms = {propext, Quot.sound, Classical.choice}`; nanoda enabled in only 2/418); catalog `lean/formalization.yaml` (v0.4) with 208 `status.main_results` entries; scope notes `lean/docs/*.md` (245 files) |
| Result type | open-problem solutions across all of pure math: NT (001–031), AG (032–070), analysis (071–086), convex/metric (087–101), TCS (102–142, 378), dynamics (143–154), combinatorics (155–192), algebra (193–210), prob/SM (211–239), logic (240–245), groups (246–259), physics (260–284), operator algebras (285–303), topology (304–321), functional analysis (322–332), diff. geometry (333–360), PDE (361–377) | formalizations per family under matching `OAI/<Subject>/<Family>/`; examples: `OAI/NumberTheory/DirichletL/` (quasi-RH), `OAI/LinearAlgebra/MatrixMultiplication/` (ω ≤ 9/4, incl. a `CoppersmithWinograd/` subdir), `OAI/Algorithms/SubexponentialSAT/` (ETH), `OAI/Analysis/Laughlin/` (Fock space), `OAI/Probability/SLE/` (imports TauCeti) | toolchain Lean `v4.34.1` (`lean/lean-toolchain`), Mathlib via lake; **no in-repo build CI** (`.github/workflows/lock-prs.yml` only locks PRs); checking is delegated to Comparator/landrun/nanoda per `lean/ComparatorChallenges/README.md` |
| Provenance caveats | `README.md:8–9`: "Not all have accompanying Lean formalizations … Some of the unformalized results could have issues"; `history.md` records 3 withdrawals (Oct 7) and 14 repair revisions; priority credit given to concurrent work (family 235 credits Carenini's ECCC TR26-229) | library contains **zero real `sorry`** (see §2a); 8 comment-only mentions | `history.md:56`: "300 / 719 = ~42%" of top-line results formalized (Oct 7 count; README repeats ~42%) |

## 1. Mathematical territory

Family numbers below are the catalog ids of `overview.tex` (each family = one result entry with
links to its manuscripts). Lean names are exact declarations, mostly from
`lean/formalization.yaml status.main_results`.

### 1.1 Number theory (001–031)

- **003 Quasi-Riemann hypothesis** (flagship; formalized). Paper: *The Quasi-Riemann
  Hypothesis: A Zero-Free Half-Plane Re(s) > 7/8* (`preprints/The-Quasi-Riemann-Hypothesis-
  September-30-2026/paper.pdf`), Theorem 1.1: every finite-order Hecke L-function over
  ℚ(√−3) and every Dirichlet L-function (incl. ζ) is zero-free in ℜs > 7/8 (pole at s = 1
  allowed). Lean: `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
  (`OAI/NumberTheory/DirichletL/Nonvanishing.lean:29`), `OAI.DirichletCharacter.
  LFunction_ne_zero_of_seven_eighths_lt_re` (same file :19), Hecke variant
  `OAI/NumberTheory/DirichletL/Hecke/Nonvanishing.lean:13,35`. Technique: completed cubic
  reflection, Poisson representation with Euler factors, zero detector with saturated
  witnesses, sextic large sieve (paper §5–§10); two-stage continuation proving first ℜs > 11/12
  (paper Theorem 3.1) then 7/8. Companion family: **uniform Landau–Siegel zero exclusion**
  (`OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap`,
  `OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11`): ∃c>0 with 1−β ≥ c/log q for
  every primitive real χ (both parities; no explicit c; `docs/003.md`).
- **002/006 BSD and Goldfeld** (not formalized): full BSD leading-term formula for elliptic
  curves over ℚ with Selmer corank ≤ 1 incl. X-finiteness; Goldfeld density-1/2 for analytic
  ranks 0/1 of quadratic twists (families 002, 006).
- **007 Two-point Chowla / corrected binary Elliott** (formalized, 217 Lean files in
  `OAI/NumberTheory/TwoPointCorrelations/`): ordinary two-point Chowla with
  O(X/(log X)^c) saving along nonproportional affine forms; binary corrected Elliott
  conjecture. Uses `StrongPNT` (math-inc) and `PrimeNumberTheoremAnd` imports.
- **005 Catalan's constant irrational** (formalized): `catalan_irrational`
  (`OAI/NumberTheory/Catalan/Results/Conclusions.lean:11`: `Irrational (∑' j, (-1)^j/(2j+1)^2)`)
  via palindromic determinants and 50-digit precision estimates
  (`OAI/NumberTheory/Catalan/Estimates/` — per-point rounding/substitution-error files).
- **017 Irrationality exponent of π is 2** (formalized; `docs/017.md`): ∀ν>2, |π − p/q| ≥ q^−ν
  for large q. Flint–Hills corollary deliberately outside the Lean statement (`docs/017.md`).
- Other formalized NT: **028 Gaussian moat** (`OAI.GaussianMoat.fullMain`), **021 Jacobsthal
  quadratic bound** (`OAI.Erdos970.Erdos970Final.erdos_970_quadratic`), **022 weak inhomogeneous
  Duffin–Schaeffer** (`OAI.Problem337.*`), **020 squarefree quartics**
  (`OAI.QuarticPowerFree.allDegrees`), **025 short Egyptian fractions** (`OAI.ShortEgyptian`),
  **024 totient asymptotic** (`OAI.TotientAsymptotic`), **012 joint Dickman law**
  (`OAI/NumberTheory/JointDickman/`), **023 Patterson first moment** (`OAI/CubicMoment`),
  **027 character-variety integral points** (`OAI.IntegralCharacterVarieties…`).
- Unformalized NT flagships: 004 H10 over ℚ, 008 Deligne–Drinfeld (formalized:
  `OAI.DeligneDrinfeld.main` — GT Lie algebra freely generated in odd weights), 010
  Fontaine–Mazur at 2, 014 geometric Langlands, 030 modularity over imaginary quadratics,
  011 Ford–Konyagin–Luca PD(1) law, 019 p-adic section conjecture.

### 1.2 TCS (102–142, 378) — the charter's main complexity bridge

- **378 Disproof of ETH** (formalized; added Oct 26). Paper *The Exponential Time Hypothesis is
  False* (`preprints/The-Exponential-Time-Hypothesis-is-False-October-25-2026/paper.pdf`),
  Theorem 1.1: for fixed k ≥ 2 a deterministic algorithm computes #F of a k-CNF in
  (n+m)^{O_k(1)} · 2^{n/(log n)^{1/2+o(1)}} bit operations and polynomial space; for m ≤ Dn the
  exponent improves to O_{k,D}(n/√log n). Appendix D: both bounds "by tensor contraction"
  (Boolean tensor networks, Theorem D.1). Corollary C.1: E^NP ⊄ SIZE(O(n)) via Williams
  [Wil13, Thm 6.1] (cited, not re-proved in the paper). Lean: `OAI.Algorithms.
  SubexponentialSAT.SqrtLogSpace.exact_count_and_sat` (trusted statement
  `lean/ComparatorChallenges/SubexponentialSAT.lean`; solution module
  `OAI.Algorithms.SubexponentialSAT.Main`): one fixed multi-tape `PrimitiveMachine` (built on
  `Turing.TM0.Stmt`) exactly counts every width-≤k CNF in time
  C(L+1)^d·2^{A·n(log log n)²/√log n} with (L+1)^e visited cells — i.e. the weaker but fully
  explicit ρ(n) exponent (paper §6.4 route); `docs/378.md` states the sharper paper bounds are
  not in Lean. Library: `OAI/Algorithms/` 3,977 files / 710k lines.
- **107 Matrix multiplication ω ≤ 9/4** (formalized). Paper *An Upper Bound of 9/4 for the
  Matrix Multiplication Exponent* (Oct 2): Theorem 1.1 ω(ℂ) ≤ 9/4 via Strassen's asymptotic
  spectrum — detecting characters (Lemma 2.2, proved in Appendix A), separation inequality
  (Prop 3.1), polynomial-multiplication profile P(a,b) with discrete concavity (Lemma 4.1),
  shifted tripling (Lemma 4.2), diagonal growth (Lemma 5.1) ⇒ t ≤ 3/4. Lean:
  `OAI.MatrixMultiplication.complex_omega_le_nine_quarters`,
  `complex_alpha_gt_93_div_200` (dual exponent α > 0.465),
  `complex_rectangular_omega_lt_523_div_250` (ω(1, 0.709, 1) < 2.092)
  (`OAI/LinearAlgebra/MatrixMultiplication/Main.lean:14–31`); plus every-field bound
  `OAI.MatrixAllFields.MatrixMultiplication.AllFieldMain.omega_lt_source_constant`:
  ω(F) < 2.371054886006746 for **every** field
  (`OAI/LinearAlgebra/MatrixFields/Conclusions/AllFieldsBound.lean:17`). Arithmetic model:
  division-free straight-line programs (`Model.lean` Gate/Program/MatrixAlgorithm);
  `docs/107.md`: "No numerical inequalities remain as hypotheses… arithmetic complexity,
  rather than bit complexity".
- **109 Integer multiplication below n log n** (NOT formalized): one fixed multitape TM
  multiplies n-bit integers in O(n (lg n)^{1−κ}), κ = 2^{−182} (paper Theorem 1) — refutes the
  Schönhage–Strassen n log n optimality conjecture in the multitape bit model. Companion
  **130 DFT below n log n** IS formalized: `OAI.ExactFourier.transform_main` /
  `convolution_main` (`OAI/Computability/FourierTransform/Main.lean`, DFT and convolution goals
  with explicit `TimeBounds`; δ = 10^{−13} in the paper).
- **102 Unique Games Conjecture — proved TRUE** (formalized): `OAI.UniqueGamesTheorem.theorem11`
  = `Nonempty (Explicit.MachineOutputContract.BinaryGapReduction ε δ)` (trusted file
  `ComparatorChallenges/UniqueGamesTheorem.lean`); companions: optimal Max-Cut hardness
  (`OAI.OptimalMaxCut.main`), Vertex-Cover factor-2 (`OAI.VertexCover.every_fixed_factor_below_two`),
  105 2-to-1 games perfect completeness (`OAI.PerfectCompleteness.Theorem11.exists_reduction`),
  117 sparsest cut (`OAI.UniformSparsestCut.mainGap`).
- **103 L = RL = BPL** (formalized, `OAI.ExactDerandomization.exact_logarithmic_space_
  derandomization`); **104 quasipolynomial mean-payoff/stochastic/parity games**
  (`OAI.randomized_quasipolynomial_mean_payoff`); **106 3-colorable hardness**
  (`OAI.LargeIndependentSets.mainTheoremReal`); **108 Ω(n³) border-determinantal lower bound for
  the permanent** (not formalized); **112 depth-3 2^{ω(√n)} lower bound**
  (`OAI.DepthThreeLowerBound.exists_polynomial_time_language_depth_three_lower_bound`);
  **113/114 FPRAS counting matchings/matroid-polymatroid bases** (`OAI.BinaryMatching…`,
  `OAI.common_bases_fpras`); **119 Courtade–Kumar + Hellinger** (`OAI.LeanBlast.CourtadeKumar…`);
  **126 exponential PSD rank of perfect matching** (`OAI.Paper256.main_result`); **127
  Gotsman–Linial** (`OAI.LeanBlast.GotsmanLinial.gotsmanLinialStatement`); **129 two-way
  automata** (`OAI.OneWayLiveness.main_theorem`, `OAI.TwoWayComplementation…`); **132
  superquadratic sensitivity separation** (`OAI.CPTSeparation.main`); **133 Weisfeiler–Leman
  EXPTIME-completeness** (`OAI/Computability/WeisfeilerLeman/`, `WLIdentification/`); **135
  depth-5 iterated-matrix-multiplication n^{Θ(√n)}**; **137 one-tape time in T^{2/5} space**
  (`OAI.OneTapeSpace`); **138 Subset Sum O(2^{0.49n})**; **141 ∃ℝ ⊆ counting hierarchy**; **142
  deterministic poly factorization over 𝔽_p (no GRH)**. **235 random k-SAT thresholds**
  (formalized): `OAI.RandomKSAT.sharpness`, `OAI.RandomKSAT.variance_main`
  (`OAI/Probability/SATVariance/`), `OAI.FixedClauseThreshold.main` (limiting threshold exists
  for k ≥ 3; sharpness; computability of the 3-SAT threshold; concurrent-work credit to
  Carenini, `overview.tex` entry 235).

### 1.3 Analysis, convex geometry (071–101) — formalization-dense

- **079 Local smoothing for the wave equation** (formized Oct 26; the largest analysis entry):
  `OAI.Analysis.Fourier.LocalSmoothing.Comparator.{euclidean_local_smoothing, kakeya,
  kakeya_maximal, bochner_riesz, spherical_restriction, stein_square}` — Sogge's local smoothing
  in all dimensions n ≥ 2, implying Kakeya maximal/Nikodym, Bochner–Riesz, Stein square function,
  and spherical restriction throughout the interior of the conjectured range. Families 073
  (Falconer in all dimensions, `OAI.PlanarFalconer.mainTarget_proved` /
  `OAI.Falconer`), 074 (3D Kakeya maximal + 4D full Hausdorff dimension), 078 (3D
  Bochner–Riesz), 080 (Carleson endpoint), 082/086 (triangular/trilinear Hilbert transforms,
  `OAI.TriangularHilbert.main_estimate`), 075 (L log L a.e. Fourier convergence,
  `OAI.FourierLLogL.paperMain`), 072 (Brennan, `OAI.Brennan.main_theorem`), 071 (Koebe circle
  domains — uses `schoenflies-lean` dep), 076 (ultraflat Littlewood).
- Convex/metric: **087 Mahler conjectures (symmetric + general) with equality cases**
  (`OAI.SymmetricMahler.symmetric_mahler(_equality)`), 088 Petty, 090 triangular-lattice
  universal optimality, 091 log Brunn–Minkowski (`OAI.LogBrunnMinkowski.main`), 095 hyperbolicity
  cones without semidefinite lifts (disproves Projected Lax), 097 Steinitz–Bergström
  (`OAI.EuclideanSteinitzBergstrom.main`), 094 subpolynomial L_p dimension reduction.

### 1.4 Combinatorics, algebra, probability, and the rest (143–377) — selected

- Combinatorics: **161 Sidorenko counterexample** (35-vertex bipartite pattern; also disproves
  the forcing conjecture); **159 Erdős AP conjecture with quasipolynomial bounds**
  (N exp[−c(log N)^ε]); **160 superexponential van der Waerden numbers**
  (`OAI.QuantitativeVanDerWaerden.uniform_lower_bound`); **168 combinatorial invariance of KL
  polynomials**; **170 sharp off-diagonal Ramsey log exponents r(s,t) = t^{s−1}/(log t)^{s−2+o(1)}**;
  **178 deterministic nonbipartite Ramanujan graphs in every degree**; **157 Hadwiger/CdV
  counterexamples** (`OAI.HadwigerCounterexample.not_hadwiger_conjecture`); 165 crossing numbers
  (`OAI.Paper170.complete_graph_crossing_number`), 172 Euclidean Ramsey classification
  (`OAI.EuclideanRamsey.classification`), 175/176 Talagrand/Kahn–Kalai
  (`OAI.TalagrandThreshold…`, `OAI.LeanBlast.SecondKahnKalai…`).
- Algebra: **205 Saxl's conjecture / universal tensor squares** (formalized
  `OAI.Saxl.saxl_conjecture`); **210 Foulkes for 6th powers + quadratic stabilization**
  (`OAI.Problem346.canonical_foulkes_howe_surjective`); 197 Kaplansky direct-finiteness
  counterexamples in char 2 and odd char (`OAI.KaplanskyCounterexample.finitelyPresented_
  counterexample`, `OAI.OddKaplansky.main_theorem`); 195 small Cohen–Macaulay counterexample
  (`OAI.SmallCM.candidate_ring_properties`); 201 Kurosh; 193/194 Serre/Lech.
- Probability/SM: 221 Mézard–Parisi, 211–237 planar percolation/SLE universality (Lean under
  `OAI/Probability/SLE/`, **imports TauCeti**), 238 Thorp shuffle, 234/237/227 spin glasses.
- Math physics: **269 Laughlin gap + disorder stability** (formalized; see §4); 261 Anderson
  localization/delocalization; 262 sharp 1D Lieb–Thirring (`OAI.SharpLiebThirring.
  sharp_lieb_thirring`); 265 2D gapped area law; 266 exactly 3 MUBs in dimension 6 (restored
  C++ + Python checker, `history.md:27`); 268 Haldane gap; 279 exact quantum factoring.
- Operator algebras: **287 all free group factors isomorphic** (L(𝔽₂) ≅ L(𝔽₃); reasoning trace
  released); 285 Baum–Connes/Kadison–Kaplansky counterexamples; 288 Kadison similarity; 294
  Kaplansky quasitrace counterexample (`OAI.Kaplansky.kaplansky_quasitrace_counterexample`);
  297 Naimark in ZFC; 298 free-entropy inequality counterexample.
- Topology/geometry/PDE (selected formalized): 304 Hilbert–Smith; 312 homotopy hypothesis
  (`OAI.Grothendieck.elementary_expansion`); 309 Kervaire at p = 3; 320 Borel rigidity
  counterexample; 325 complete Crouzeix (`OAI.CompleteCrouzeix.main`); 327 Markov type ⇔
  superreflexivity (`OAI.MarkovSuperreflexivity…`); 337 CAT(0) isoperimetry; 345 closed geodesics
  on spheres; 362 Vlasov–Maxwell global smoothness (`OAI.RVM.global_classical_solution`);
  375 De Giorgi dim 8; 376 universal computation in forced Navier–Stokes.

## 2. Depth & terminal points

### (a) `sorry` inventory

`rg -n "sorry"` across the corpus:

| Where | Count | Nature |
|---|---|---|
| `lean/OAI/` (the 29.7M-line proof library) | **8 tokens, all in comments/docstrings** — `OAI/AlgebraicGeometry/SheafCohomology/Projective/{PullbackTensorMonoidal.lean:30,38,58, Monoidal.lean:27, Invertible.lean:36, PullbackTensorGeneral.lean:40,42}` and `OAI/RepresentationTheory/Theta/Definitions.lean:15` | zero proof sorries; the mentions are phrases like "proved sorry-free", "both remain `sorry`" (documentation of an earlier state; no `sorryAx`-producing token exists in the library) |
| `lean/ComparatorChallenges/` (418 trusted statement files) | **548 tokens in 419 files** | the deliberate trusted-side placeholders (theorem … := by sorry), one per comparator statement, exactly the anthropics `Challenge.lean` pattern; `formalization.yaml status.main_results` maps each to its identically-named proved theorem in `OAI/` |

Axiom discipline: no `axiom`/`native_decide` declarations in `OAI/` (only prose mentions of the
word "axiom" in 5 comments); comparator configs permit only `propext, Quot.sound,
Classical.choice` (e.g. `ComparatorChallenges/SubexponentialSAT.json`). Unlike anthropics, there
is **no in-repo CI** that rebuilds the library or enforces the sorry policy — verification is
external (Comparator + landrun; nanoda for 2/418 configs).

### (b) Stated-not-proved / unformalized / withdrawn

- ~58% of top-line results have **no Lean formalization** (`README.md:21` ~42% formalized;
  `docs/` covers 245 of 373 families). Notable unformalized flagships: **109 integer
  multiplication below n log n** (no `docs/109.md`, no formalization.yaml entry), **002/006
  BSD + Goldfeld**, **004 H10 over ℚ**, **014 restricted geometric Langlands**, **108
  permanent determinantal bound**, **141 ∃ℝ in CH**, **142 deterministic factoring of 𝔽_p
  polynomials**, 087/088/090 convex geometry (087 IS formalized — symmetric Mahler is
  formalized; 088, 090 are not), 168 KL invariance, 178 Ramanujan graphs.
- Formalization scope gaps (documented in `lean/docs/`): `docs/378.md` — Lean proves only the
  ρ(n) = n(log log n)²/√log n runtime, not the paper's sharper n/(log n)^{1/2+o(1)} or the
  m ≤ Dn case, and the E^NP circuit corollary is paper-only (Cor C.1 cites [Wil13 Thm 6.1];
  not a comparator statement); `docs/017.md` — Flint–Hills series convergence is "outside this
  selected statement"; `docs/003.md` — "The paper's later applications are not included"; no
  explicit value of the Landau–Siegel constant c.
- **Withdrawn manuscripts** (`history.md:34–40`): *Algebraicity of Weil classes on split abelian
  eightfolds* (sign error in the stabilization-trace cancellation; the withdrawal notice in
  `preprints/Algebraicity-of-Weil-classes-on-split-abelian-eightfolds-September-18-2026/README.md`
  pinpoints I_new = I(f₁) − m = −2m ≠ 0 breaking the Eliashberg–Murphy cancellation hypothesis),
  plus two dependents (Kuga–Satake for K3, rational Hodge for K3 products). 14 further
  manuscripts repaired Oct 7.
- Conjectural labels: the catalog itself is assertion-heavy; where a statement is conditional it
  says so in the entry (e.g. 034 conditional Kähler good minimal models; 032's dependent
  manuscripts were withdrawn while the CM Hodge main result stands with a formalization,
  `HodgeCM.hodge_conjecture_for_cm_abelian_varieties`).

### (c) Proved-but-not-generalized (frozen constants, weaker-captured statements)

- **ω bounds**: 9/4, α > 93/200, ω(1,0.709,1) < 523/250, and ω(F) < 2.371054886006746 are each
  frozen numerals; `docs/107.md` notes the square 9/4 "implies the paper's weaker 2.258
  headline bound". The Lean exponent is arithmetic (division-free program cost), not bit
  complexity; no API connects it to word-RAM or Turing-machine time.
- **ETH runtime**: Lean captures ρ(n) = n(log log n)²/√log n with constants C, A, d, e left
  existential (`runtimeBound C A d e`, `ComparatorChallenges/SubexponentialSAT.lean`); the
  paper's sharper exponents and the dependence on k are not extracted.
- **Quasi-RH**: 7/8 frozen; the paper's Part I gives 11/12 by a shorter route (Theorem 3.1) —
  not a separate Lean statement; Hecke case restricted to ℚ(√−3) finite-order characters only.
- **Laughlin gap**: γ* = 4616733319001/10¹⁴ in the paper; Lean `MainTarget` freezes the
  cruder 1/100 (`OAI/Analysis/Laughlin/Model.lean:56–59`: (1/100)·distanceToLaughlinSq ψ ≤
  energy ψ, for N ≥ N₀ at filling 1/3, i.e. Q = 3(N−1)).
- Integer multiplication: κ = 2^{−182} and DFT δ = 10^{−13} frozen at negligible values; no
  parametrized "saving exponent" theorem.
- Random-SAT: thresholds proved for k ≥ 3 with Θ_k(n) variance; no uniformity in k.

### (d) Isolated results with no neighbors

- Each family's Lean development is a silo: `OAI/Algorithms/SubexponentialSAT` (Boolean tensor
  contraction, 710k lines) and `OAI/Computability/FourierTransform` (exact DFT power saving,
  `ConvGoal`/`DFTGoal`) both compile recursive "linear network/tensor circuit" algorithms with
  zero shared API; likewise two eth-relevant machine models coexist (`PrimitiveMachine` on
  `Turing.TM0.Stmt` in SubexponentialSAT; the `TM2`-style machines elsewhere in
  `OAI/Computability/`).
- `OAI/LinearAlgebra/MatrixMultiplication/` is a self-contained asymptotic-spectrum
  implementation (characters, entropy, separation, `CoppersmithWinograd/` subdir) with no other
  consumer in the library — mathlib has no exponent API to donate into (see §4).
- `OAI.Laughlin` Fock-space layer (`OAI/Analysis/Laughlin/Fock/`) is used only by the Laughlin
  family; the operator-algebraic identities (CCR, number operator) have no second consumer.
- Paper-only islands: family 266 (MUBs in dimension 6) is verified by external C++/Python
  computation (`history.md:27`) — the only external computational artifact in the corpus
  (cf. zeta23's `EnclOK` enclosures).

## 3. External dependencies

### Lake-level deps (`lean/lakefile.lean`, pinned commits) and actual use in `OAI/`

- **Mathlib**: 68,589 `import Mathlib*` lines in `OAI/` (31,197 wholesale `import Mathlib`);
  top narrow imports: `Mathlib.Tactic` ×869, `Tactic.Linarith` ×782, `Tactic.Ring` ×761,
  `Analysis.Complex.Basic` ×267, `Analysis.SpecialFunctions.Pow.Real` ×225,
  `Algebra.BigOperators…`, `MeasureTheory.Integral.*`, `Analysis.Normed.Module.
  FiniteDimension` ×174.
- **PrimeNumberTheoremAnd** (Kontorovich et al.): imported by 244 OAI files (quasi-RH/Catalan/
  TwoPointCorrelations/Jacobsthal) — the same upstream project anthropics zeta23 ported as
  `FromPNTPlus/`; **StrongPNT** (math-inc): 12 files (TwoPointCorrelations, Jacobsthal);
  **ClassFieldTheory**: 4 files (DukePrimeDegree); **TauCeti**: 5 files (see §4);
  **schoenflies-lean**: 9 files (CircleDomains, SLE); **oka**: 6; **heights**: 99 (AG/PadicHodge);
  **genl**: 22; SphereEversion/PrimeCert/AbsorptionCutoff: 1 each. Declared but with **zero
  imports from `OAI/`**: Zeta3Irrational, AINTLIB, carleson, rellich-kondrachov, gromov, belyi,
  elliptic-curves, formal-schemes, iut, pi1, tate-curves-theta, tempered-fundamental-points,
  fixed-point-theorems, LeanArchitect, leancert, orbicurve-cores (transitive-only or vestigial).
- `formalization.yaml related_formalizations` additionally credits
  google-deepmind/formal-conjectures (builds-on).

### Classical results cited vs re-proved

- **Quasi-RH paper** re-proves its large-sieve input chain inside the manuscript: builds on
  Goldmakher–Louvel's quadratic Hecke-family sieve [13, Def 1/Thm 1.1], Blomer–Goldmakher–
  Louvel norm recursion [4], Heath-Brown's cubic estimate [17, Thm 2], proving the sextic
  specialization as its Lemma 9.1; uses Dunn–Radziwiłł cusp expansions [8] "unconditional
  explicit" record; Dunn–Radziwiłł prime asymptotic and the companion Patterson-moment
  manuscript [23] are explicitly NOT inputs (paper §1). In Lean everything is proved from
  Mathlib+PNTA (statement layer: `OAI/NumberTheory/DirichletL/Nonvanishing.lean` has no
  hypotheses beyond 7/8 < ℜs and the pole exclusion).
- **ETH paper** cites Williams [Wil13, Thm 6.1] for E^NP ⊄ SIZE(O(n)) (Cor C.1/C.4 prove the
  implication, not Williams's theorem); cites JVV86 self-reduction, Bar23 circuit-to-CNF,
  Žák83 hierarchy, JMV13 local reduction — all classical, none formalized; the Lean comparator
  covers only the counting algorithm.
- **ω ≤ 9/4 paper** is self-contained: character-existence (the asymptotic spectrum point)
  proved in its Appendix A (Lemma A.1, Lemma 2.2) — i.e., Strassen's spectral theory is
  re-proved rather than cited; Lean formalizes the whole route (no hypotheses; `docs/107.md`:
  "No numerical inequalities remain as hypotheses").
- **Integer multiplication** inherits the Gauss/FFT method chain explicitly (paper §1.5
  "Historical context and inherited methods": Schönhage–Strassen, Fürer, Harvey–van der Hoeven)
  but the κ-saving networks are new; no Lean formalization exists.
- Reasoning traces (`reasoning_traces/*.pdf`) record the original open-problem prompts (e.g.
  `ordinary-two-point-correlations.pdf` shows the Elliott/Halász-style prompt with the
  pretentiousness distance definition) — provenance data, not proofs.

## 4. Bridging hooks

Names/paths exact. The openai corpus is mostly a **donor** corpus (its formalized theorems are
unusually strong statements absent everywhere else), with three literal code-level bridges
already present (TauCeti import; PrimeNumberTheoremAnd shared with zeta23; Mathlib base).

**To anthropics zeta23 (analytic NT):**
- Shared substrate: both formalizations are built on Mathlib's `riemannZeta` /
  `DirichletCharacter.LFunction` (zeta23 `ChallengeDeps.lean`; openai
  `OAI/NumberTheory/DirichletL/Nonvanishing.lean:19–33`) and both import/ported
  PrimeNumberTheoremAnd. The two developments prove *complementary* facts about the same zeros:
  zeta23 = zero-density (≥ 2/3 simple+on-line; ThmD optimal window), openai = zero-free region
  (ℜs > 7/8) + uniform Landau–Siegel exclusion. Neither proves the other's statement.
- Donors: `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`,
  `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`,
  `OAI.SevenEighths.HeckeFamily.LFunction_ne_zero_of_seven_eighths_lt_re`,
  `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap`.
- Concrete bridge candidates (Phase 2): (i) inject the 7/8 zero-free half-plane as a *proved,
  hypothesis-free* truncation of the zero support into zeta23's Theorem-D variational problem
  (`Zeta23/ThmD/Functional.lean` optimizes over windows on the full strip) — a new variational
  problem "Montgomery–Taylor constants with support truncated at ℜs = 7/8" with potentially
  better constants than 0.6725/0.8363; (ii) compare/unify the two explicit-formula
  implementations (zeta23 `Zeta23/WeilEF/` vs the openai zero-detector contour machinery in
  `OAI/NumberTheory/DirichletL/`) into one Mathlib-ready zero-sum API; (iii) zeta23's
  `Zeta23/XiPrime/` (zeros of ξ′) meets openai's zero-free half-plane at the de
  Bruijn–Newman-type boundary — "all zeros of ξ′ in ℜs ≤ 7/8" is stated in neither corpus.
- Also note: zeta23's rank–trace linear algebra (`RHLinalg`: von Neumann trace, Sylvester
  inertia) has **no counterpart in openai** (`OAI/LinearAlgebra/` has Schur/Moore/tensor
  developments but no trace inequality of that shape) — a one-way donation opportunity into
  mathlib, where both projects could converge.

**To anthropics eth + 3sum-apsp (complexity):**
- **Two independent formal refutations of ETH now exist**: anthropics `MainResults.lean:177
  mainTheorem` (one FinTM2 machine, 2^{C·min{km/√log m, k²n log log n/√log n}} steps, tensor
  networks + eight-square identity + Boson operators) and openai
  `OAI.Algorithms.SubexponentialSAT.SqrtLogSpace.exact_count_and_sat` (PrimitiveMachine on
  TM0, 2^{A·n(log log n)²/√log n}, polynomial space, "shared linear summaries" + Appendix D
  tensor contraction). Same conclusion, different algorithms, different machine models, zero
  shared Lean API. Bridge candidates: (i) a parameter-matched comparison/closure theorem (min
  of the two bounds as a single machine statement — new, purely Lean-level, feasible); (ii)
  both papers lean on Williams's E^NP argument — anthropics re-proves it in Lean
  (`PaperIndex.circuits`), openai does not formalize it at all: porting anthropics' re-proof
  next to openai's counting theorem would give the *first formalized* "ETH false ⇒ E^NP ⊄
  SIZE(O(n))" chain fed by an explicitly-bounded algorithm; (iii) a shared "Boolean tensor
  network contraction ⇒ deterministic counting" lemma layer (anthropics' `networks/` +
  `Eight.signs` vs openai's Appendix D/Theorem D.1 machinery) is a natural empty zone.
- **ω into 3sum-apsp**: anthropics 3sum-apsp explicitly freezes Strassen's log₂ 7 and states
  "ω is not defined" (`docs/REMARKS.md`); openai formalizes `omega(F) <
  2.371054886006746` for every field, ω(ℂ) ≤ 9/4, and rectangular ω(1, 0.709, 1) < 2.092
  (`OAI/LinearAlgebra/MatrixMultiplication/Main.lean`). The missing link — arithmetic-program
  exponent ⇒ word-RAM integer-program steps (bit complexity) — is proved in neither corpus
  (openai's `docs/107.md` disclaims bit complexity; the "Staggered extraction over every
  field" paper is the paper-side bridge). A candidate new theorem: re-derive 3sum-apsp's
  savings curve `Rc` (its `Sec4_Rc_*` statements) with a 9/4-exponent scheme replacing
  Strassen, i.e. quantitatively new O(n^{2−ε}) bounds for Exact Triangle/3SUM/APSP — needs
  both corpora (3sum-apsp's word-RAM compiler + openai's exponent), squarely a Phase-3
  dossier.
- Random-SAT: openai's formalized k-SAT threshold existence/sharpness
  (`OAI.RandomKSAT.sharpness`) + ETH refutation form a self-contained pair that meets
  anthropics eth's `rates/` clique-counting at the "#SAT → counting cliques" reductions
  (eth's Corollary 7 vs openai Cor 1.3 — same reduction, proved twice in papers, once in
  Lean on each side with different encodings).

**To anthropics eth via Fock/Boson operators (mathematical physics):**
- openai `OAI/Analysis/Laughlin/` formalizes a genuine fermionic Fock space over U_Q
  (spin-Q/2 irreps; `Fock/`, `State N Q`, `laughlinVector`, kernel-distance
  `distanceToLaughlinSq`) and proves the spectral-gap inequality
  `OAI.Laughlin.mainTarget_proved` (`OAI/Analysis/Laughlin/Main.lean:19`, from
  `physical_fock_kernel_distance_uniform`: HQ² ≥ γHQ on all of F_Q for Q large, γ* >
  1/25). anthropics eth formalizes creation/annihilation operators a[r], Q_s(a,b) on
  ℚ[t₁,t₂,…] (`ClauseBound.Boson`, "Boson" per `proof/README.md:174`) with duality Lemma 10
  (`AppHalfPieces.lemmaDual`). Two formal CCR-algebras with disjoint purposes and no shared
  API; a unified Heisenberg-algebra layer (commutation relations, number-operator quadratic
  forms) with two instantiations is a clean donor/empty-zone bridge; a substantive candidate
  is transporting eth's positivity piece-construction (Lemma 9 `lemmaQ`) as an inequality
  between quadratic forms on truncated Fock sectors, connecting complexity exponent e* = 0
  with spectral-gap lower bounds — speculative, flagged as such (conjecture-shaped, not a
  stated theorem in either corpus).

**To tauceti (direct code bridge — already exists):**
- `lean/lakefile.lean` requires `TauCeti` @ `3bed7e37f3c504a99e8c07e9f309540812a7aa90`, and
  five OAI files import
  `TauCeti.Analysis.Complex.Conformal.{Montel.Basic, Hurwitz, NormalFamilies, SimplyConnected,
  Inverse.Function}` — all inside `OAI/Probability/SLE/Loewner/` and `OAI/Probability/SLE/
  Geometry/SimpleSlitRiemann.lean`. So openai's SLE/random-cluster developments (families 223,
  226, 230, 232) are *built on* tauceti's conformal-analysis API. Any tauceti-side extension
  of `TauCeti.Analysis.Complex.Conformal.*` flows directly into these results; conversely the
  OAI Loewner-development (trace theorems, inverse limits) is a downstream consumer tauceti
  itself lacks. This is the only place in the four corpora where two of our targets are
  literally linked by an import edge — mine it first for Phase 2.

**To mathlib (donors/consumers):**
- Consumers: 68,589 import lines; heavy Analysis/MeasureTheory usage.
- Donor candidates (proved here, absent in mathlib): the whole matrix-multiplication exponent
  framework (`Arithmetic.omega`, `complexAlpha`, `rectangularOmega`,
  `OAI/LinearAlgebra/MatrixMultiplication/Model.lean` — mathlib has no ω API at all); the
  zero-free half-plane ℜs > 7/8 for `riemannZeta` and `DirichletCharacter.LFunction` (mathlib's
  zeta files stop far short of any zero-free region); the deterministic-subexponential #SAT
  layer (beyond `Mathlib.Computability.TuringMachine`'s no-time-complexity API, cf. anthropics
  eth's `machines/ToTuring/` as the competing in-house solution); local-smoothing/Kakeya
  estimates (`OAI.Analysis.Fourier.LocalSmoothing.Comparator.*`).
- Watch the toolchain gap: openai is on Lean/Mathlib **v4.34.1** while encore-mathlib and
  tauceti are on **v4.36.0-rc2** and anthropics on v4.33.x — porting any donor theorem across
  corpora requires a toolchain reconciliation step (feasibility input for
  `research/feasibility/mathlib-verification.md`).

## 5. Sources consulted

- `README.md` (all); `history.md` (all: Oct 29 fix, Oct 26 additions incl. ETH + local
  smoothing, Oct 7 withdrawals/fixes, 300/719 formalized); `CONTENTS.md` (structure: per-family
  result descriptions + per-manuscript abstracts); `overview.tex` (read in full: header/TOC,
  families 001–062, TCS section 102–142 + 378 verbatim, analysis/convex 071–101 verbatim,
  selected entries 007, 012, 159, 161, 168, 170, 178, 205, 210, 235, 269, 287; full family
  index extracted to /tmp/families.txt).
- `lean/README.md`; `lean/formalization.yaml` (sources list, 208 main_results, 32
  related_formalizations); `lean/lakefile.lean` (dep pins incl. TauCeti);
  `lean/lean-toolchain`; `lean/ComparatorChallenges/README.md`, `SubexponentialSAT.{lean,json}`,
  `UniqueGamesTheorem.lean`, SAT-family configs; `lean/docs/{003,017,107,378}.md` (+ dir
  listing of all 245).
- Lean library greps: sorry inventory over `OAI/` and `ComparatorChallenges/`; Mathlib/TauCeti/
  dep import counts; theorem locations: `OAI/NumberTheory/DirichletL/Nonvanishing.lean`,
  `…/Hecke/Nonvanishing.lean`, `OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean`,
  `OAI/NumberTheory/Catalan/Results/Conclusions.lean`, `OAI/LinearAlgebra/MatrixMultiplication/
  Main.lean` + `Model.lean`, `OAI/LinearAlgebra/MatrixFields/Conclusions/AllFieldsBound.lean`,
  `OAI/Computability/FourierTransform/{Goal,Main}.lean`, `OAI/Analysis/Laughlin/{Model,Main}.lean`,
  `OAI/Probability/{SATVariance,RandomSAT}/`.
- Preprint PDFs (pdftotext): The-Exponential-Time-Hypothesis-is-False (abstract, §1–2,
  Appendix C, tensor-contraction hits); Matrix-Multiplication-Nine-Fourths (abstract, §1,
  theorem/lemma index); The-Quasi-Riemann-Hypothesis (abstract, §1, theorem index around
  Theorem 1.1); Integer-multiplication-below-n-log-n (abstract, Theorem 1); A-Fock-space-
  inequality-and-the-Laughlin-spectral-gap (§1.1, Theorem 1.1, γ*); Ordinary-two-point-
  correlations (abstract); withdrawal notice README of Algebraicity-of-Weil-classes; reasoning
  trace `ordinary-two-point-correlations.pdf` (head).
- `.github/workflows/lock-prs.yml` (CI = PR locking only).
