# ITERATION4-FRESH-BRIDGES — lane R6 corpus bridge re-scan (2026-11-16)

Fresh-ground scan per the R6 queue: territory (a) anthropics eth/3sum-apsp ↔ openai
complexity/arithmetic-programming; (b) tauceti terminal points vs mathlib frontier; (c)
openai reasoning_traces + preprints vs the Cycle-2 zeta/zero-density cluster; (d) axiommath
Weil/AreaLaw2D statement surfaces vs mathlib. Everything here is ground the ITERATION4-SCAN
13-seed inventory and the existing `bridges/` maps do NOT cover (checked against
`feasibility/ITERATION4-SCAN.md`, `bridges/{complexity,area-law,function-field,analytic-nt,
linear-algebra,tensor-algebra,tauceti-contributions}.md`, `survey/*.md`). Markers:
**[V]** = read at the cited locator this session; **[H]** = inference flagged for confirmation;
**[LIT]** = literature knowledge, un-checkable this session (web-search quota exhausted — the
two mandatory LIT sweeps for FB-1 are marked inline). Siblings read-only; no builds run.

## §0 Headline findings (read this first)

1. **The openai-math Lean tree contains TWO proved, sorry-free developments the Cycle-2
   clocks and inventories do not record** (territory c): `OAI.SiegelZeros.exists_absolute_
   real_zero_gap` — the uniform Landau–Siegel zero exclusion `(1−β) log q ≥ c`, all primitive
   real Dirichlet characters (`OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11–21`,
   0 sorries by rg over the directory) — and `OAI.PiExponent.main` / `pi_irrationalityExponent_
   eq_two` / `flint_hills_summable` — **μ(π) = 2** and the Flint–Hills convergence
   (`OAI/NumberTheory/PiExponent/Main.lean:9–31`; `Statement.lean:10–29` defines
   `irrationalityExponent`/`EventualLowerBound`; 0 sorries). Both have companion preprints
   (`preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf`, Theorem 1
   [V]; `preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/paper2.pdf`, Theorem 1.1 [V])
   and companion reasoning traces (`reasoning_traces/irrationality-exponent-of-pi.pdf`,
   `basic-semidefinite-threshold-np-hardness.pdf` et al.). Consumption class: same as Liu-1
   (v4.34.1 pin — statement-binder only), but these are **in-corpus, proved, and unregistered**.
2. **The QRH paper2 (Oct 5) is NOT a new frontier for the Dirichlet class**: its own text says
   Theorem 1.1 (zero-free Re s > 11/12 for every finite-order Hecke L over ℚ(√−3), hence every
   Dirichlet L incl. ζ) is "a natural intermediate step toward the stronger zero-free region
   Re s > 7/8 established in [36]" [V, paper2 p.2], where [36] = the already-G7b-audited OAI 7/8
   tree. Its residual value: a *simpler* proof and the Hecke-over-imaginary-quadratic class
   (where the only formal artifacts remain Liu-1, statement-citation-only).
3. **A three-way tropical junction no map records** (territories a+b): mathlib has the
   `Algebra/Tropical` semiring layer (`Mathlib/Algebra/Tropical/{Basic,Lattice,BigOperators}.lean`
   [V via ls/rg]); tauceti has a complete optimal-transport stack including **entropic duality
   with no-gap attainment** (`TauCeti/MeasureTheory/OptimalTransport/Entropic/Duality.lean`,
   docstring: dual attained, maximisers unique up to constant [V]) and the **zero-temperature
   limit** (`Entropic/ZeroTemperature.lean` — ε→0⁺ cost convergence + optimizer limits [V]);
   openai has a proved **tropical-LP counterexample** (`OAI/Optimization/Tropical/TruffetModel.lean`
   + `TruffetCounterexample.lean` — a forced tropical-substitution step with a strictly better
   feasible point [V]); 3sum-apsp's whole Sec-5 machinery is (min,+) products
   (`EndStatement.lean` APSP statements [V via bridges/complexity.md §0]). mathlib has **zero**
   optimal transport (rg `kantorovich|wasserstein|optimal.?transport` over `Mathlib/` = 0 hits
   [V]) — tauceti is the only built OT donor on our pin.
4. **OAI's MathematicalPhysics wing is proved, large, and unconsumed** (territory d adjacency):
   `OAI/Analysis/{Laughlin,LaughlinFock,LaughlinGap}` (Fock inequality with explicit
   γ* = 4616733319001/10¹⁴, certificate files Certificate01–10, 0 sorries [V]),
   `OAI/MathematicalPhysics/{Fock,Heisenberg,CriticalSK,Anderson,Boltzmann,ContinuumCoulomb,
   Coulomb,HardSphere,DefocusingNLS,...}`. tauceti's graded CAR/Fock stack
   (`TauCeti/Algebra/Lie/GeneralLinear/CAR/Casimir.lean:186` uses `SetLike.mul_mem_graded` on
   the even part [V]) is the only same-toolchain counterpart — the survey's "CAR/Fock ↔ no QFT"
   within-corpus zone now has an external consumer corpus.

## §1 Scan map per territory (queries + yield verdict)

### (a) anthropics eth + 3sum-apsp ↔ openai lean + preprints — complexity/arithmetic-programming interface

R4's `bridges/complexity.md` (Z1–Z5) already owns eth↔3sum↔SubexponentialSAT↔MatrixMult.
Fresh queries this session: listed the full 418-name comparator surface
(`ls ComparatorChallenges/*.lean`), read statement heads of `PermanentCubic`, `MatchingPSD`,
`TwoWayComplementation`, `OneWayLiveness`, `HeilbronnTriangle`, `SATSharpness`,
`LogBrunnMinkowski`, `CriticalStripMass`, `LaughlinFock`, `QuasiRiemannHypothesis` [all V];
`find OAI/Optimization OAI/Algorithms`; rg `sorry` over `OAI/` (8 total, none in the files
cited below).

New observations:
- **Tropical junction** (headline 3). `TruffetModel.lean` fixes a tropical-LP state machine
  (forms over `WithBot ℝ`, `eval = max` — max-plus [V:20–31]) whose `ForcedSingletonStep`
  relation + `initial/middle/finalState` witness the failure of a natural tropical
  substitution rule (`TruffetCounterexample.lean`: `advance_first/advance_second`,
  `better : Fin 3 → ℝ := ![0, -1, 0]` beats `output` [V]).
- **`CriticalStripMass.lean`** is a self-contained combinatorial model: path masses ρ^|p| with
  ρ = 1/√(2+√2) on a triangle lattice, `c·archMass + bridgeMass = 1`, moment ≍ N^{3/4},
  bridgeMass ≍ N^{−1/4}, monotone [V:13–76]. No zeta objects appear — it is the discrete
  "critical-strip mass" toy theorem; nobody in any corpus consumes it. Bridge potential
  (vs ZZV2 zero-counting / tauceti orbit zeta) noted, not dossiered — the model's link to
  actual L-functions exists only in the (unfound) source paper.
- **`PermanentCubic.lean`**: border-determinantal complexity bound m³/(5529600·e) ≤ n for
  `perm_m` (`HasBorderDeterminant` = coefficient-wise limit of affine det polynomials [V:29–
  40]) — a coefficient-limit notion *formally analogous* to 3sum-apsp's border-rank machinery
  (`Lemma_6`/Strassen `Eq_1`, per bridges/complexity.md §1 row 7). No common abstraction in
  either corpus; the honest grade for a "border-determinantal ↔ border-rank" unification is
  C (hard math, weak two-sided Lean machinery: tauceti Multilinear has no tensor-rank theory —
  survey §4 [V]).
- **`MatchingPSD.lean`**: superpolynomial PSD rank of the perfect-matching slack matrix
  (`psdRank`, `MainClaim` [V:48–63]). Natural third consumer of the seed-9 LP-duality layer
  (nonneg-rank ≥ psd-rank ladder) — noted, not dossiered (weaker, FORMALIZATION-OF-RECENT
  shape).
- **`QuasiRiemannHypothesis.lean` comparator** = `riemannZeta_ne_zero_of_seven_eighths_lt_re`
  [V:5–8] — i.e. the comparator surface *mirrors* the proved 7/8 tree; confirms headline 2.

**Yield: MEDIUM.** One B-grade seed (FB-1), two notes (PSD ladder, CriticalStripMass).

### (b) tauceti vs mathlib frontier

Queries: read `COORDINATION.md` (git-contract only, no math [V]) and `formalization.yaml`
(sorry_count 0, roadmap-gated, no fixed target [V]); the survey §2c/2d/§4 hooks are
pre-existing. Fresh: `ls` of `MeasureTheory/OptimalTransport/` (42 entries incl.
`MultiMarginal/`, `Twist/`, `CTransform/`, `GromovWasserstein/` [V]); read heads of
`Entropic/Duality.lean`, `Entropic/ZeroTemperature.lean` [V]; `Dynamics/CatMap.lean` theorem
list (frozen genus-1, confirms survey §2c [V]); `WienerIkehara/Asymptotic.lean` main theorems
(`tendsto_tsum_term_mul_fourier_atTop_of_nonneg` — a general nonneg-coefficient Tauberian
asymptotic [V:243]); rg `talagrand|transport.?entropy` over TauCeti (1 irrelevant hit [V]);
rg `tropical|minplus` (only Entropic OT files [V]); rg mathlib OT (0 [V]).

New observations:
- **Wiener–Ikehara is a *general Dirichlet-series* Tauberian in tauceti** — nothing ties it to
  ℚ-only series. Combined with Weil's Fatou rationality layer (`Weil/RingTheory/PowerSeries/
  Fatou.lean:24–27` `exists_int_coprime_mul_eq_of_rat` [V] Freitag–Kiehl IV §1) and the Weil
  log-derivative/trace formula (per bridges/function-field.md §0 [V]), the function-field PNT
  is a two-donor assembly absent from every corpus (rg `PrimeNumberTheorem|prime_number` over
  `Weil/` = 0 [V]; mathlib has no FF PNT — its `FunctionField.lean` is a def only, per
  function-field bridge §0 [V]). Seed FB-4 (grade C+: the math is Schmidt-1931-class classical;
  value = NEW-LEAN + first WienerIkehara consumer outside ℚ).
- **Entropic OT duality has no zero-temperature dual statement**: `entropicDualValue` appears
  0 times in `ZeroTemperature.lean` [V rg]. The primal limit is proved; the dual limit and
  potential convergence are not. This is the fresh half of FB-1.
- `Data/Matrix/EntropicTransport.lean` and `GromovWasserstein/Entropic.lean` exist (ls [V]) —
  the entropic layer has matrix-level and GW-level wings; un-mined beyond this note.

**Yield: MEDIUM-HIGH** (two dossiers ride tauceti donors: FB-1, FB-4; FB-3 uses its
WienerIkehara-adjacent badly-approximable layer).

### (c) reasoning_traces + preprints vs the zeta/zero-density cluster

Queries: extracted all 11 traces to text (pdftotext, /tmp scratch); `ls preprints | grep -iE
"zeta|zero|prime|…"` over the 751 preprints; read `Uniform-exclusion-of-Landau-Siegel-zeros`
pp.1–2 + intro [V]; `The-Quasi-Riemann-Hypothesis` paper2 pp.1–2 + refs [V]; confirmed both
have proved Lean trees (§0 headline 1). rg `landau|siegel` over `OAI/` (hits point to the
SiegelZeros tree + unrelated Siegel-modal-form files); rg `elevenTwelf|11/12` (no Lean
statement found for paper2's 11/12 — the 11/12 result appears unformalized; the *stronger*
7/8 is formalized). `ls OAI/NumberTheory/` (39 areas: `DirichletL` = the 7/8 tree's Dirichlet
wing, `PrimeGaps`, `DuffinSchaeffer`, `TwoPointCorrelations`, `OrdinaryCorrelations`,
`GaussianMoat`, `CubicGauss`, `CubicMoment`, `ZetaFive`, `PiExponent`, `SiegelZeros` [V]).

New observations:
- **Headline 1 donors + one clock correction**: the ITERATION4-SCAN §1c clock list (Liu-2,
  Chang–Wang, Ji, TateThesis, QuasiRiemannTracker) misses the two OAI artifacts. For the
  Dirichlet class the tracker's "formal frontier 0.8733458561 (Bebel)" sits *below* the
  G7b-audited in-corpus 7/8 = 0.875 — worth one re-check of what class the tracker counts
  (flagged [H]; do not let it silently contradict pilot-50 R1's landed route).
- **The traces are OAI's *attempted-proof* records** (the π trace reads as method-exploration
  with a claimed 62/25 bound then exponent 2 [V pp.1–2]); the Lean trees are the settled
  residue. Trace shapes with NO proved tree and no consumer: `mezard-parisi-formula` (diluted
  spin-glass Parisi functional, finite-level trial functional over nested measure spaces
  [V p.1]); `symmetric-and-general-mahler-conjectures`; `free-group-factor-isomorphism`;
  `relativistic-vlasov-maxwell`. All are open-problem territory (grade C long shots; the
  Mahler trace pairs with the `SymmetricMahlerEquality`/`GeneralMahler`/`MahlerConjecture`
  comparators [V via name list]).
- **μ(π) = 2 machinery is π-specific only at the analytic-aggregate leaf**:
  `PiExponent/Approximation/InterpolationConsequence.lean:11–14` takes the *generic* hypothesis
  `DeterminantContradiction.GlobalInterpolationStatement` and returns `PiEventualLowerBound`
  [V] — a ready-made hypothesis-binder interface for any future `GlobalInterpolationStatement`
  witness at another constant. Object-layer gap: mathlib's only irrationality-measure-shaped
  object is `LiouvilleWith` (`Mathlib/NumberTheory/Transcendental/Liouville/{LiouvilleWith,
  Measure}.lean` [V rg]); the quantitative exponent functional exists only in OAI. Seed FB-3.
- **mathlib already has `NumberTheory/LSeries/PrimesInAP.lean`** (Dirichlet AP theorem [V ls])
  — the landing substrate for any QRH-quality PNT-AP corollary (FB-2's feasibility note).

**Yield: HIGH** (two registrations + two seeds; the strongest operational finds of the scan).

### (d) axiommath Weil/AreaLaw2D statement surfaces vs mathlib

Queries: `find axiommath/Weil -name '*.lean'` (75 files); read heads of
`RingTheory/PowerSeries/{Fatou,LogDerivative}.lean` [V] and `LeanEval/WeilConjectures.lean`
locator (per G3 [V via AGENTS.md]). AreaLaw2D side: the 3D statement layer + Targets.md are
already seed 1; fresh queries looked *outside* that: OAI's physics comparators + proved trees
(headline 4), `MatchingPSD` (above), `LaughlinFock` comparator read in full [V] —
`FockMatrix Q := Matrix (Finset (Orbital Q)) (Finset (Orbital Q)) ℂ` with the fermionic sign
`(-1) ^ (B.filter (· < j)).card` in `annihilator` [V:56–60] and `FockInequality Q γ :=
(hamiltonian Q * hamiltonian Q - γ • hamiltonian Q).PosSemidef`, `thm_fock` eventually-in-Q
with explicit γ* [V:70–77].

New observations:
- **The fermionic-sign occupation-matrix substrate appears in TWO corpora at once**: tauceti's
  graded CAR (`Casimir.lean:186`; survey §2c faithfulness, occupation spectrum, Casimir
  N(2N²−1)/4) and OAI's `LaughlinFock.annihilator`. Neither cites the other's shape; no bridge
  exists. Seed FB-5.
- Weil's statement surface beyond the FF-EZ zones = exactly the Fatou/log-derivative
  rationality layer (FB-4's second donor); nothing else new at statement level (G6a still
  prices the Stacks closure out).

**Yield: MEDIUM** (FB-5; FB-4 straddles b/d).

## §2 Novelty pre-filter (direct-source evidence per candidate)

| Candidate | rg / read evidence | Nearest existing statement | Verdict |
|---|---|---|---|
| FB-1 zero-temp dual + substitution-rule | `entropicDualValue` × `ZeroTemperature.lean` = 0 [V]; mathlib OT = 0 [V]; OAI Tropical = Truffet model+counterexample only [V] | tauceti `tendsto_entropicTransportCost_transportCost*` (primal only); Carlier–Duval–Peyré–Schmitzer 2017 (cited *inside* ZeroTemperature's own header [V]) proves ε→0 convergence of entropic schemes — **[LIT]** dual/potential statements likely there too | keep, grade B, scope to what the cited paper does NOT do (rule characterization) |
| FB-2 SiegelZeros/QRH corollaries | `exists_absolute_real_zero_gap` read [V]; comparator `QuasiRiemannHypothesis` = 7/8 shape [V]; mathlib `PrimesInAP.lean` exists [V] | the donors themselves; PNT-AP with power error stated nowhere in-corpus | keep, FORMALIZATION-OF-RECENT |
| FB-3 irrationality-exponent layer | mathlib `LiouvilleWith` only [V]; OAI `irrationalityExponent`/`EventualLowerBound` [V]; tauceti `BadlyApproximable.lean:248` Littlewood recorded [V via survey §2b] | OAI defs are the layer; mathlib Liouville is qualitative | keep, glue-grade |
| FB-4 FF-PNT | Weil PNT-content = 0 [V]; mathlib FF = def only [V]; tauceti `WienerIkehara/Asymptotic.lean` general [V] | Schmidt 1931 / Weil's own thesis (classical) | keep, NEW-LEAN only |
| FB-5 Laughlin/CAR | OAI `LaughlinFock` proved tree + comparator [V]; tauceti CAR graded [V]; quantum-info-substrate.md A3: no Schur–Weyl/Specht in mathlib [V] | the OAI preprint (Sept 24, 2026) + its own proved tree | keep, FORMALIZATION-OF-RECENT + substrate bridge |
| PSD-rank ladder (note) | `MatchingPSD` comparator [V]; mathlib PosSemidef exists (`Analysis/Matrix/PosDef.lean` [V via substrate map]) | OAI preprint behind comparator | note only |
| CriticalStripMass (note) | comparator read [V]; no consumer corpus-wide | source paper (unlocated) | note only |

## §3 Seed dossiers (pre-dossier form)

### FB-1 — Zero-temperature Schrödinger duality on finite supports, and the tropical substitution-rule question
**Territory (a)+(b). Strength: B** (A if the rule-characterization statement is open in the
tropical-Sinkhorn literature — **[LIT]**, must be checked before chartering; web quota
exhausted this session).

**Statement (two rungs).**
(R1, glue) For finite `X Y`, real cost `c`, marginals `μ ν`, and `ε > 0`, let `Dε := sup_{φ,ψ}
entropicDualValue c ε μ ν φ ψ` (tauceti's dual). Then (i) `ε⁻¹·(Dε − entropicTransportCost c
ε μ ν) → 0` as ε→0⁺ is exactly tauceti's no-gap theorem at fixed ε (`Entropic/Duality.lean`
[V]); and (ii) **new**: `lim_{ε→0⁺} Dε = sup {∑φ dμ + ∑ψ dν − ε·…-form → Kantorovich value}`,
i.e. the zero-temperature *dual* limit equals the discrete OT value
`inf_{π coupling} ∫c dπ`, with rescaled potentials converging (along a subsequence) to a
Kantorovich-dual optimal pair — the dual counterpart of `ZeroTemperature.lean`'s primal
theorems.
(R2, discovery shot) Rule characterization: call a tropical substitution rule *sound* if every
`ForcedSingletonStep`-style forced step preserves feasibility and cannot strictly decrease the
optimal cost. `TruffetCounterexample` exhibits an unsound rule [V]. **Theorem target**: a
soundness criterion in terms of the dominating/eligibility ordering (`dominating`,
`eligible`, `TruffetModel.lean:44–56` [V]) — e.g. "every rule whose chosen pivot is
simultaneously lower- and upper-dominated is sound; the V4 rule fails exactly when a
remaining variable is dominated on one side only."

**Why-new / nearest misses.** In-corpus: nothing states (R1-ii) — `entropicDualValue` never
meets the ε→0 limit [V rg]; (R2) is raised *by* the in-corpus counterexample and answered
nowhere. Informal: Carlier–Duval–Peyré–Schmitzer 2017 (ZeroTemperature's own reference) treats
ε→0 convergence of values and (probably) potentials — **[LIT] mandatory differentiation
sweep**; tropical Sinkhorn exists as a topic (max-plus entropy optimization). The
differentiator is R2 + the finite-support explicit-dual form.
**Bridge-essentiality.** tauceti owns the ε-side (built, our pin, direct dep); OAI owns the
tropical-side objects and the failure witness (v4.34.1, statement-port≈0); mathlib owns
`Algebra/Tropical` + would host the finite LP-duality step (seed-9 layer). No one side can
state R2 at all (tauceti has no tropical substitution; OAI has no entropic machinery).
**Proof sketch.** R1: tauceti's `Duality` attainment theorem gives exact dual optimizers
`(φε, ψε)` for bounded cost [V]; precompose with the block-approximation coupling from
`ZeroTemperature.lean` [V] to sandwich `Dε` between the primal cost and `OTε + o(1)`; extract
limiting potentials by compactness of normalized potentials on finite supports (finite-dim
compactness, mathlib trivial). R2: pure tropical algebra over `WithBot ℝ` — attempt first at
the 2-row, 3-column shape of `initial/middle/finalState` (all data is explicit numerals [V]).
**Feasibility.** R1 = M (rides a tauceti direct dep — the first non-OT consumer of the Entropic
stack); R2 first instance = S (decide-on-numerals + a general statement over the
`TruffetModel` structures restated mathlib-only). Substrate: crossmath-probe class, no donor
builds.
**Fast kill/confirm.** Confirm: one arXiv search "tropical Sinkhorn / entropic transport
ε→0 dual" (2 min) — if Carlier et al. state R1-ii verbatim, drop R1 to citation-grade and keep
R2. Kill R2: find any soundness theorem for tropical pivot rules in the (unlocated) Truffet
literature.

### FB-2 — Register + consume the two unregistered OAI zero-free donors: effective corollaries of 7/8 / Landau–Siegel exclusion
**Territory (c). Strength: B− as discovery (FORMALIZATION-OF-RECENT; the math is
paper-corollary-grade), HIGH operational value (clocks + binder classes).**

**Statement (pilot shape).** (a) *Registration*: add to the §1c clocks `OAI.SiegelZeros.
exists_absolute_real_zero_gap` (proved, v4.34.1) and QRH-paper2 Theorem 1.1 (11/12, Hecke over
ℚ(√−3), unformalized) — with the note that for the Dirichlet class the G7b-audited 7/8 tree
dominates both. (b) *Pilot*: with hypothesis binders `hQRHχ : ∀ q χ, … 7/8 < s.re → L(s,χ) ≠ 0`
(statement-port≈0 from the OAI tree) and mathlib's `PrimesInAP` layer [V], state and prove the
PNT-in-AP corollary at error grade x^{7/8+δ}: `∀ δ>0, ∃C, |π(x;q,a) − li(x)/φ(q)| ≤ C·x^{7/8+δ}`
uniformly in q ≤ x^{1/8−δ'} — the explicit-formula shape of QRH-paper2 Corollary 1.2 [V].
(c) Optional headline corollary (paper2 §1 [V]): effective class number `h(D) ≫ √|D|/log log|D|`
conditional on the binder.
**Why-new.** PNT-AP with power-saving error is in no corpus (mathlib `PrimesInAP` is the
qualitative Dirichlet theorem [V]; tauceti's Chebotarev/Mertens are ℚ-side without QRH-grade
error; nothing in openai beyond the unformalized corollary).
**Bridge-essentiality.** OAI donor supplies the zero-free binder; mathlib supplies AP-prime
infrastructure; the explicit formula for `ψ(x;χ)` exists in neither at usable grade — that is
the build (the honest cost).
**Feasibility.** M-to-L (explicit formula with von Mangoldt sums per character class — this is
the PNT+-watchlist T2 trigger firing). Substrate: statement-binder class (donor statements
elaborate verbatim; proofs never cross the pin).
**Fast kill/confirm.** Confirm: check whether `OAI/NumberTheory/DirichletL` already proves a
PNT-AP corollary internally (one rg `PrimeNumberTheorem|pi_` over that tree); if yes, this
becomes donor-swap-grade S/M. Kill: none — worst case it re-scopes to the registration note.

### FB-3 — An irrationality-exponent object layer: OAI's functional × mathlib Liouville × tauceti badly-approximable
**Territory (c). Strength: C+ (glue/infrastructure, formalization-first), one B-grade shot
inside it.**

**Statement.** Port `irrationalityExponent` / `EventualLowerBound` / `ApproximationExponents`
(`PiExponent/Statement.lean:10–29` [V]) to mathlib-only; prove the layer's first structural
theorems: (i) `irrationalityExponent x = ∞ ↔ LiouvilleWith x`-equivalence (connects mathlib's
`LiouvilleWith` [V]); (ii) `2 ≤ irrationalityExponent x` for irrational x (Dirichlet
pigeonhole — mathlib-adjacent via `Approximation` machinery); (iii) monotone/comparison
lemmas. **B-grade shot inside**: (iv) a badly-approximable ↔ exponent-2 interface theorem in
the *pair* setting: `EventualLowerBound`-type control for `‖n·π‖` from tauceti's
`BadlyApproximable` layer — i.e., quantitative one-dimensional feeders for the recorded
Littlewood Prop (`BadlyApproximable.lean:248` [V via survey]) using OAI's π bound as the
first concrete constant with *full* exponent control (μ(π)=2 [V]) — statement: for every
ν>2, `liminf n^{ν−1}·‖nπ‖ > 0`-grade corollaries of `EventualLowerBound Real.pi`.
**Why-new.** The functional exists only in OAI; mathlib's Liouville is qualitative; tauceti's
badly-approximable layer has no exponent calculus. No corpus states (i)–(iv).
**Bridge-essentiality.** OAI owns the functional and the one instantiation (π); mathlib owns
Liouville; tauceti owns the approximability-structure consumer. Only the combination yields a
reusable layer.
**Feasibility.** (i)–(iii) S-class glue (statement-port≈0 + pigeonhole); (iv) M (needs
`EventualLowerBound` unpacked into `‖nπ‖` bounds — the OAI tree's `FlintConsequence` files
already do `sin`-versions for Flint–Hills [V] — port pattern exists).
**Fast kill/confirm.** Confirm: rg OAI tree for an existing `LiouvilleWith` link (one rg);
kill (iii→iv) only if the Flint–Hills route already exposes `‖nπ‖` directly (then it's a
citation, not a theorem).

### FB-4 — Function-field prime number theorem: Wiener–Ikehara (tauceti) × Weil rationality/RH (axiommath, statement-binder)
**Territory (b)+(d). Strength: C+** (classical math — Schmidt 1931-class; value = NEW-LEAN
statement with two genuine donors and the first non-ℚ consumer of tauceti's Tauberian layer).

**Statement.** For a smooth projective curve `C/𝔽_q` with Weil zeta `Z_C(T)` (consumed as
statement binders per G3: rationality + functional equation + RH `satisfiesWeilEstimate`
[bridges/function-field.md §0 locators, V]), the norm-graded prime (closed-point) counting
function `θ_C(n) := ∑_{deg v ≤ n} (deg v)·q^{deg v}` satisfies `θ_C(n) ~ q^n`, equivalently
`ψ_C(x) ~ x` over the divisor norm grading; prime-orbit form: number of closed points of
degree ≤ n is `Li(q^n) + O(q^{n·(1/2+ε)})`.
**Why-new.** No corpus has any FF PNT: Weil tree rg `PrimeNumberTheorem` = 0 [V]; mathlib
`FunctionField.lean` is a def (function-field bridge §0 [V]); tauceti's PNT corollaries are
ℚ/number-field side.
**Bridge-essentiality.** Weil supplies zeta + RH (the analytic input: nonvanishing on
`|T| = q^{−1/2+ε}`-circle arc, i.e. Re s > 1/2+ε); tauceti supplies the Tauberian engine
(`WienerIkehara/Asymptotic.lean` nonneg-coefficient asymptotics [V]); neither side alone has
both (Weil has no Tauberian layer; tauceti has no FF zeta). The assembly is exactly the
classical proof — honest cap: no new mathematics, a new formal artifact.
**Feasibility.** M: the grading bridge (power series in T ↔ Dirichlet series in q^{−s} via
`T = q^{−s}`) is the FF-EZ1 dictionary restated; Weil's own `logDerivative_zetaSeries`
(function-field bridge §0 [V]) provides the von Mangoldt function; statement-binder class
(no Stacks build needed — G3's Tier-B route).
**Fast kill/confirm.** Confirm: one rg for "ψ"/"Mertens" inside `Weil/Defs` (if the repo
already has graded point-sum lemmas, effort drops); kill: none (worst case L-effort
re-grade).

### FB-5 — The Fock-space inequality on tauceti's graded CAR substrate: occupation-sector reduction for two-body pair Hamiltonians
**Territory (d). Strength: B** (recent-paper statement + genuinely two-sided machinery; the
sector-reduction layer is new-in-corpus structural glue).

**Statement.** (a) Restate OAI's `Laughlin.FockInequality Q γ` (`hamiltonian Q * hamiltonian Q
− γ • hamiltonian Q).PosSemidef`, `LaughlinFock` comparator [V]) mathlib-only on tauceti's
occupation-number indexing (`Finset (Orbital Q)` basis, fermionic sign cocycle — comparator's
`annihilator` [V] vs tauceti CAR even-grading, `Casimir.lean:186` [V]); consume OAI's *proved*
`OAI/Analysis/LaughlinFock` tree (0 sorries [V]) as the statement-binder donor for the
inequality itself. (b) **New structural layer**: `pairAnnihilator`-type Hamiltonians preserve
particle-number parity; hence `FockMatrix` decomposes as a block-diagonal sum over parity
sectors, and `FockInequality Q γ ↔ FockInequality-sectorwise` — proved once, generically, on
tauceti's graded CAR; (c) first corollary: the parity-0 vs parity-1 ground-state energy split
as an explicit finite computation at small Q (the OAI certificates `Certificate01–10` [V]
become sector-local).
**[CORRECTED AT HARDENING, 2026-11-16 — the paragraph above is the ORIGINAL scan claim and
is PARTLY FALSE: the OAI proved tree already owns the CAR relations (`annihilator_square`/
`annihilator_anticommute`/`annihilator_creator_anticommute`/`annihilator_adjoint_anticommute`,
`Analysis/LaughlinFock/FermionOperators.lean:95,102,156,190`) and the sector decomposition in
the STRONGER exact-card form (`sectorHamiltonian` family, `Model.lean:51,138,150,167,197` —
(b) as stated is donor-owned, not new). What survives as fresh is the tauceti-side algebraic
substrate bridge: the CAR dictionary, the graded-algebra↔block-structure equivalence, and
transported occupation-spectral identities. Full corrected Phase-3 dossier:
`candidates/77-car-occupation-dictionary-laughlin.md` (honesty header carries this
correction; grade adjusted B → B−).]**
**Why-new (as corrected).** No graded-algebra lemma, no Clifford/CAR identification, no
occupation-spectral/trace identity exists in either corpus (rg evidence in dossier 77);
tauceti's CAR stack has no consumer anywhere (survey §2(d)); the OAI tree has the model but
no representation theory. The substrate bridge itself (same occupation/sign calculus, two
corpora, zero citations across) remains the Phase-1 "shared object under different names"
finding.
**Bridge-essentiality.** tauceti supplies the graded CAR algebra + sign discipline on our pin
(direct dep); OAI supplies the statement + proved inequality + certificate structure
(statement-port≈0). Neither alone yields the dictionary or the identity layer.
**Feasibility.** Dictionary T1 S–M; grading lemma T2 S; identity layer T3 M. Substrate:
crossmath-probe; tauceti import is legal (same pin).
**Fast kill/confirm.** (executed at hardening): the sector-decomposition pre-check
("read SquareSplitting/Assembly") returned DONOR-OWNS — folded into dossier 77's honesty
header. Remaining batteries: the donor's `Assembly/AveragedOperators` trace-identity
pre-check + the physlib (seed-13) differentiation + the companion-preprint theorem list.

## §4 Not dossiered (one line each, for the next scan)

- PSD-rank/nonneg-rank ladder as a third seed-9 consumer (`MatchingPSD` binder) — C,
  FORMALIZATION-OF-RECENT.
- `CriticalStripMass` path-mass model vs zero-counting corpora — needs its source paper
  located before any bridge claim.
- Mézard–Parisi / SK trace × tauceti free probability × `OAI/Probability/SKRatio` proved tree
  (exists [V ls]) — a real cluster, needs its own scan.
- `TwoPointCorrelations` (Halász-machinery tree [V ls]) vs tauceti L-series moment files —
  plausible analytic-NT bridge, unexplored.
- Tauceti `GromovWasserstein/Entropic.lean` + `Data/Matrix/EntropicTransport.lean` vs
  `MetricEntropyDuality` comparator — noted in (b), un-mined.
- Mahler-conjecture traces × `LogBrunnMinkowski`/`SymmetricMahlerEquality` comparators ×
  tauceti OT duality (Brunn–Minkowski is Minkowski-sum geometry) — long-shot C.
- eth↔tauceti Heisenberg/Clifford re-derivation of the eight-square identity (survey §4
  hook) — still open, still C.

## §5 Verdicts (per queue)

- **(a) complexity interface: MEDIUM.** R4's Z1–Z5 took the deep eth↔3sum↔SAT junctions; the
  fresh yield is the tropical three-way junction (FB-1) plus two comparator notes. The
  418-comparator surface remains mostly unmapped — the physics wing (see (d)) is its best
  remaining seam.
- **(b) tauceti vs mathlib: MEDIUM-HIGH.** Wiener–Ikehara's generality (FB-4), the entropic
  dual gap in ZeroTemperature (FB-1 R1), and the graded-CAR substrate (FB-5) are all fresh;
  mathlib's OT absence makes every tauceti OT file a donor surface nobody has priced.
- **(c) traces/preprints vs zeta cluster: HIGH.** Two proved unregistered donors (SiegelZeros,
  PiExponent) + one clock correction + a clean binder interface (`GlobalInterpolationStatement`)
  + FB-2/FB-3. This is the territory that most changes the next cycle's donor registry.
- **(d) Weil/AreaLaw2D vs mathlib: MEDIUM.** Weil's fresh surface is exactly FB-4's Fatou/
  log-derivative layer; AreaLaw2D's fresh seam runs through OAI's proved physics trees
  (Laughlin/Fock/Heisenberg) rather than the (already-seeded) 3D ladder.

Files written: this file only. Siblings untouched; no builds; no Modal usage.

## §6 Follow-ups landed in the hardening batch (same lane, 2026-11-16, later session)

- **Probes G11/G12 staged** (no runs): `feasibility/probe/ProbeG11_OAI_SiegelZeros.lean`
  (donor-pin signature + axiom audit of `exists_absolute_real_zero_gap` + both delegation
  roots), `feasibility/probe/ProbeG12_OAI_PiExponent.lean` (headline quartet + the
  `GlobalInterpolationStatement` binder surface + `analyticAggregate`). Runner mode
  **g11** added to `feasibility/probe/gprobe.py` (own volume `crossmath-g11-tree`, g7's
  donor-pin tarball pattern, import-BFS closure from both seed targets) + case in
  `run_gprobe.sh`; both syntax-checked locally. G9/G10 numbering confirmed R8's.
- **Donor registration record**: `novelty/oai-siegelzeros-piexponent-as-donor.md`
  (axiommath-as-donor format; DO-NOT-CONSUME-until-probe gating; both preprint citations
  with the weaker-than-7/8 note; binder forms for consumers).
- **Dossier hardening**: FB-1 → `candidates/76-zero-temperature-schrodinger-duality.md`
  (R7-delegated Carlier/tropical-Sinkhorn novelty sweep flagged inline); FB-5 →
  `candidates/77-car-occupation-dictionary-laughlin.md` — **re-scoped after the donor
  read** (OAI tree owns CAR relations + exact-card sectors + `thm_fock` proved;
  corrections recorded in §3 FB-5 above and the dossier's honesty header; grade B → B−).

— lane R6, 2026-11-16
