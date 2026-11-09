# Phase 1 survey — mathlib frontier zones (lane R3, "mathlib-surveyor")

Targeted, non-exhaustive map of the zones of the local mathlib checkout where the other three
corpora (anthropics_formal-math, tauceti, openai-math) could plug in or donate. Focus: zeta/L,
computability/complexity, matrix inequalities, matrix multiplication/tensors, analysis/probability
support, and direct overlap with the anthropics headline results (§4 of `survey/anthropics.md`).

## 0. Checkout snapshot

- Repo: `/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4` (read-only sibling).
- Commit: `ff2494ea5e438f8a8452db803068acd711fa0059` — "chore: remove unnecessary set-option lines
  (#45821)", Mon Nov 9 02:14:19 2026 +0000 (i.e. ~current master at task time).
- Toolchain: `leanprover/lean4:v4.36.0-rc2` (matches tauceti / project convention).
- This is a *module-era* checkout: files use `module` / `public import` (e.g.
  `Mathlib/Data/Holor.lean:10-12`), which matters for donor integration (3sum-apsp already uses
  the same module system).

## 1. Zeta & L-functions

### Exists

`Mathlib/NumberTheory/LSeries/` — 24 files (full list in §8). Key declarations:

- **Riemann zeta**: `riemannZeta` (`RiemannZeta.lean:121`), completed functions
  `completedRiemannZeta₀` (`RiemannZeta.lean:64`) and `completedRiemannZeta` (:68); functional
  equation `completedRiemannZeta_one_sub` (:106), `riemannZeta_one_sub` (:178); trivial zeros
  `riemannZeta_neg_two_mul_nat_add_one` (:173); residue `riemannZeta_residue_one` (:242); Dirichlet
  series forms `zeta_eq_tsum_one_div_nat_cpow` (:207). **`RiemannHypothesis : Prop` is defined**
  (`RiemannZeta.lean:185-187`, tagged `@[wikidata Q205966]`): all nontrivial zeros have `re = 1/2`.
  Logarithmic functional equation: `logDeriv_riemannZeta_one_sub` (`RiemannZetaLogDeriv.lean:35`).
- **Zero set (new, shallow)**: `Mathlib/NumberTheory/LSeries/ZetaZeros.lean` (78 lines, last
  touched 2026-10-31): `riemannZetaZeros : Set ℂ := riemannZeta ⁻¹' {0}` (:37),
  `isClosed_riemannZetaZeros` (:61), `isDiscrete_riemannZetaZeros` (:64),
  `IsCompact.inter_riemannZetaZeros_finite` (:68), `tendsto_riemannZeta_cofinite_cocompact` (:74).
  That is all: discreteness + local finiteness, **no counting function of any kind**.
- **Hardy Z**: `Mathlib/NumberTheory/LSeries/HardyZ.lean` (140 lines): `hardyZ` (:76),
  `abs_hardyZ` (:85), `hardyZ_neg` (:98), `hardyZ_eq_zero_iff` (:111 — zeros of `Z` on ℝ are
  exactly the heights of the critical-line zeros of ζ), `continuous_hardyZ` (:122). Docstrings
  use "critical line"; this is mathlib's only critical-line API.
- **Dirichlet L-functions**: `Mathlib/NumberTheory/LSeries/Dirichlet.lean`
  (`DirichletCharacter.LFunction`), analytic continuation in `DirichletContinuation.lean`
  (`LFunction_eq_LSeries` :74; meromorphic continuation statement :53), `Nonvanishing.lean` (493
  lines): `LFunction_ne_zero_of_re_eq_one` (:391), `LFunction_ne_zero_of_one_le_re` (:404),
  `_root_.riemannZeta_ne_zero_of_one_le_re` (:417), zero-iff on the left half-plane
  `LFunction_eq_zero_iff_of_re_nonpos` (:468), `riemannZeta_eq_zero_iff_of_re_nonpos` (:483),
  root number facts (:434-460). Primes in AP (Dirichlet's theorem): `PrimesInAP.lean`.
- **Abstract functional equation / Mellin machinery**: `AbstractFuncEq.lean` (493 lines) —
  `WeakFEPair`/`IsStrongFEPair`, `functional_equation` (:427), residues of `Λ` (:433,:449);
  `MellinEqDirichlet.lean` — `hasSum_mellin` family (:28,:74,:95,:122).
- **Tauberian**: Wiener–Ikehara theorem `Mathlib/NumberTheory/LSeries/WienerIkehara.lean` —
  `tendsto_sum_range_div` (:693), `tendsto_sum_div` (:700). **Isolated**: imported by no other
  mathlib file (verified: only self-references).
- **Order of zeros**: `Mathlib/Analysis/Analytic/Order.lean` — `analyticOrderAt` (:49),
  `analyticOrderNatAt` (:63), arithmetic (`le_analyticOrderAt_add` :228, `analyticOrderAt_add_of_ne`
  :254, `analyticOrderAt_smul` :274), and a simple-zero test
  `AnalyticAt.analyticOrderAt_sub_eq_one_of_deriv_ne_zero` (:342). [erratum 2026-11-09, H/QA: v1
read "`analyticOrderAt_add` :254"; no decl of that short name exists — the :254 decl is
`analyticOrderAt_add_of_ne` (family: `_eq_left/right_of_lt` :243/:248). Addendum same day (R9):
a multiplicative `analyticOrderAt_mul` exists at :548, alongside `_eq_top_of_left/right`
:540/:543.] Solid local theory, no global
  counting.
- **Chebyshev / PNT strength**: `Mathlib/NumberTheory/Chebyshev.lean` — Chebyshev ψ/θ functions
  (`psi_eq_sum_Icc` :93, `theta_eq_sum_primesLE` :101, `psi_mono` :170, `psi_ge` family, see
  :846-856), `primeCounting_eq_theta_div_log_add_integral` (:668), and the Chebyshev-strength
  upper bound `eventually_primeCounting_le` (:832: ∀ε>0, eventually π x ≤ (1+ε) x/log x). Header
  (:56) states: "Parts of this file were upstreamed from the PrimeNumberTheoremAnd project by
  Kontorovich et al" — PrimeNumberTheoremAnd is thus already a partial bridge node.
  `Mathlib/NumberTheory/SumPrimeReciprocals.lean`: `Nat.Primes.not_summable_one_div` (:124).
  `Mathlib/Analysis/SpecialFunctions/Log/Sum.lean`: raw log-sum bounds (`sum_log_le` :49 etc.);
  its docstring (:18) mentions Mertens' theorems only as motivation — **no Mertens theorem**.
  `Mathlib/NumberTheory/ArithmeticFunction/VonMangoldt.lean:66`: the von Mangoldt *arithmetic
  function*; `Mathlib/NumberTheory/AbelSummation.lean`: Abel/partial summation.

### Missing (verified absent by search)

- Any zero-counting function N(T), Riemann–von Mangoldt asymptotic, Backlund bound.
- Any explicit formula (Weil or classical); searches "explicit formula", "von Mangoldt N(T)",
  "zero-counting" return nothing relevant.
- Zero-free region beyond `re s ≥ 1` (no de la Vallée Poussin region, no Vinogradov–Korobov).
- **The PNT itself**: no `π x ~ x / log x` theorem anywhere (strongest = Chebyshev bounds above).
- Hilbert-type inequalities (classical double-sum or Montgomery–Vaughan): absent.
- Simple zeros, density theorems, pair correlation: absent.
- Argument principle / Rouché / winding number in complex analysis: absent (only
  `Mathlib/Topology/Covering/FundamentalGroupCircle.lean` touches "winding"; nothing in
  `Mathlib/Analysis/Complex/`).
- Mertens constant / ∑_{p≤x} 1/p = log log x + M: absent.

### Nearest API / glue points

- zeta23's RvM (`Zeta23/RvM/`) glues onto: `riemannZetaZeros` +
  `IsCompact.inter_riemannZetaZeros_finite` (finiteness of zeros in the window) +
  `analyticOrderNatAt` (multiplicity) — the *definition* `N(T₁,T₂) = ∑ᶠ ρ ∈ window,
  analyticOrderNatAt riemannZeta ρ` is already half-supported by mathlib; the donor supplies the
  argument-principle asymptotic mathlib cannot state today.
- zeta23's WeilEF glues onto `logDeriv_riemannZeta_one_sub`, `DirichletCharacter.LFunction`,
  `ArithmeticFunction.vonMangoldt`, and the Mellin/`AbstractFuncEq` layer.
- PNT: the two ingredients (Wiener–Ikehara :693; ζ ≠ 0 on `re s ≥ 1` :417) **both exist and are
  both unconsumed** — the missing link is a Mellin-transform/ψ-continuity lemma. This is the
  single most striking "assembled-but-unconnected" configuration found in this survey.

## 2. Computability & complexity

### Exists

- Machine models: `Mathlib/Computability/TuringMachine/` — `Tape.lean`, `Config.lean`,
  `PostTuringMachine.lean` (TM0), `StackTuringMachine.lean` (TM1, TM2 = finitely many stacks,
  `FinTM2`), `Computable.lean`, `ToPartrec.lean`. Plus `Partrec*.lean`, `Primrec/`, `Ackermann`,
  `TuringDegree.lean`, `Halting.lean`, `RecursiveIn.lean` — computability (recursion theory) is
  well covered; **complexity is not**.
- Time API (all of it in `Mathlib/Computability/TuringMachine/Computable.lean`, 236 lines):
  `TM2OutputsInTime` (:130, "halts with output `l'` in ≤ m steps"),
  `TM2ComputableInTime` (:161), `TM2ComputableInPolyTime` (:174),
  `idComputableInPolyTime` (:216) — the identity function is the **only** worked example; header
  (:22-24) lists it as a main theorem. Step-counting semantics documented at :30-35. Supporting
  `EvalsToInTime`/`refl`/`trans` in `Mathlib/Computability/StateTransition.lean:266-288`.
  **Island**: `Computable.lean` is imported by no other mathlib file.
- Divide-and-conquer asymptotics: `Mathlib/Computability/AkraBazzi/AkraBazzi.lean` — the
  Akra–Bazzi theorem `isBigO_asympBound` (:654), with Strassen explicitly the motivating example
  (:21) and TODO "master theorem" specialization (:49-52). Files: `AkraBazzi/`, `GrowsPolynomially.lean`,
  `SumTransform.lean`.
- Definitional optimization theory: `Mathlib/Combinatorics/Optimization/ValuedCSP.lean` (Dvorak,
  2023) — `ValuedCSP`, `ValuedCSP.Term`, `ValuedCSP.Instance`, `IsOptimumSolution`,
  `Function.HasMaxCutProperty`, `FractionalOperation.IsSymmetricFractionalPolymorphismFor`
  (the Kolmogorov–Živný algebraic framework). Definitions only, no complexity theorem, no
  consumers.

### Missing

- Any complexity class (P, NP, PSPACE): absent. Any SAT/CNF/k-SAT definition: absent.
  Any ETH/SETH statement: absent (word-boundary searches over all of `Mathlib/` return only
  "ETH Zürich" university mentions, e.g. `Mathlib/NumberTheory/Padics/MahlerBasis.lean:31`).
- Word-RAM / RAM model: absent.
- Composition/chain lemmas for `TM2ComputableIn(Poly)Time` (run f then g, pay sum): absent —
  this is exactly what eth's `machines/ToPartrec/` (46 files: `PolyT`, `steps_to_time`,
  `exists_tm_padded`) had to build.
- Any reduction theory between problems: absent.

### Nearest API

- eth's machinery is *already keyed* to mathlib's `FinTM2`/`TM2OutputsInTime`/
  `TM2ComputableAux`; donation is a lift into `Mathlib/Computability/` with no definitional
  change on the mathlib side. The `s k`/`InTime` ETH definition (eth `MainResults.lean:117`) has
  no mathlib counterpart at all — it would sit above `TM2ComputableInTime` directly.
- 3sum-apsp's word RAM (`EndStatement.lean`, core-Lean only) has nothing to land on; it would be
  a new `Mathlib/Computability/WordRAM/` and a bridge `FinTM2 ↔ word RAM` (stated as *not proved*
  on the eth side, `MainResults.lean` head comment — a two-sided empty zone).

## 3. Linear algebra inequalities

### Exists

- **Spectral theorem for Hermitian matrices**: `Mathlib/Analysis/Matrix/Spectrum.lean:143
  IsHermitian.spectral_theorem` (unitary diagonalization); `IsHermitian.eigenvalues₀` (:60) with
  `eigenvalues₀_antitone` (:65) — i.e. eigenvalues indexed in *decreasing order*; orthonormal
  eigenbasis follows. Operator version: `Mathlib/Analysis/InnerProductSpace/Spectrum.lean`
  (`LinearMap.IsSymmetric.eigenvalues` :277; spectral theorem :189/:323; the docstring :46
  mentions Schur–Horn as future/conceptual context — not proved there).
- **PSD / Loewner order**: `Mathlib/Analysis/Matrix/PosDef.lean` — `Matrix.PosSemidef`,
  `IsHermitian.posSemidef_iff_eigenvalues_nonneg` (:34), `Matrix.PosDef` with
  `eigenvalues_pos` (:85), `PosSemidef.trace_eq_zero_iff` (:55), `det_nonneg` (:51),
  `toInnerProductSpace` (:125). Order instance: `Mathlib/Analysis/Matrix/Order.lean` —
  `Matrix.instPreOrder` (`A ≤ B ↔ (B - A).PosSemidef`), scoped `MatrixOrder`;
  `nonneg_iff_posSemidef` is the 0-vs-PSD bridge.
- **Sylvester's law of inertia — quadratic forms over ℝ only**:
  `Mathlib/LinearAlgebra/QuadraticForm/Real.lean:19,57-85` (existence:
  weighted ± sums of squares) and `QuadraticForm/Signature.lean` (uniqueness :240-248, `sigPos`
  key lemma :144). No `Matrix.inertia`, no positive-inertia index for Hermitian *matrices*
  (verified absent; `Inertia` hits in mathlib are ramification theory,
  e.g. `Mathlib/RingTheory/Ramification/Inertia.lean` — different notion).
- Singular values of operators: `Mathlib/Analysis/InnerProductSpace/SingularValues.lean:95
  singularValues` (with nonneg :101, pos-iff :105).
- Gram matrices: `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean` (Hermitian, PSD lemmas).
- Gershgorin: `Mathlib/LinearAlgebra/Matrix/Gershgorin.lean:30 eigenvalue_mem_ball`.
- Rank: `Mathlib/LinearAlgebra/Matrix/Rank.lean` — `Matrix.rank` (:133),
  `rank_le_card_width` (:171), `rank_mul_le_left/right` (:179/:184).
- Schur complements: `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:375,386` (block-inverse context).
- Frobenius norm: `Mathlib/Analysis/Matrix/Normed.lean` (scoped `Matrix.Norms.Frobenius`).

### Missing

- **von Neumann trace inequality** (Re tr(AB) ≤ Σ σᵢ(A)σᵢ(B) / eigenvalue pairing): absent.
  Disambiguation: mathlib has von Neumann *minimax* (`Mathlib/Topology/Sion.lean`, Sion's theorem)
  — unrelated.
- **Weyl eigenvalue perturbation bound** (λᵢ(A+B) ≤ λⱼ(A)+λᵢ₋ⱼ₊₁(B)): absent.
- **Cauchy interlacing** (principal submatrices): absent.
- Courant–Fischer min–max characterization, Rayleigh quotient: absent (only the antitone
  indexing :65 above).
- Rank–trace–Frobenius inequality family (tr ≤ rank·λmax, rank·tr P ≤ ... ‖P‖²_F etc.): absent;
  `PosSemidef.trace_eq_zero_iff` (:55) is the only trace-sharpness fact.

### Nearest API

- zeta23's `RHLinalg` (von Neumann trace, Sylvester both directions, Weyl, rank–trace) is stated
  for Hermitian matrices over ℂ with eigenvalue decompositions — it glues *verbatim* onto
  `IsHermitian.spectral_theorem` + `eigenvalues₀_antitone` + `Matrix.PosSemidef`. The zeta23
  files even import Mathlib for `Matrix` basics, so the port is mostly namespace/instance
  alignment. Inertia donates as a `PosSemidef`-relative definition next to
  `QuadraticForm/Signature.lean` (which stays over ℝ).

## 4. Matrix multiplication & tensors

### Exists

- **Tensor rank, one isolated file**: `Mathlib/Data/Holor.lean` (Alexander Bentkamp, ported from
  AFP *Deep_Learning*; header :5, :14-29). Holors = multidimensional arrays; rank ≤ 1 = tensor
  product of vectors; **CP rank defined**: `CPRankMax` (predicate family, lemmas :265-309),
  `Holor.cprank` (:332, noncomputable ℕ-valued), `cprank_upper_bound` (:335). No other mathlib
  file touches `cprank` — a definitionally complete but entirely unconsumed island. [erratum
2026-11-09, H/QA: v1 cited `cprank` :333 / `cprank_upper_bound` :336; actual :332 / :335.]
- Tensor products of modules/algbras: `Mathlib/LinearAlgebra/TensorProduct/` (24 files, incl.
  `Matrix.lean` for matrices over tensor rings; `Vanishing.lean`, `Free.lean`, `Basis.lean`) —
  categorical/module-theoretic, **no rank theory, no complexity content**.
- Tropical (min-plus / max-plus) semirings: `Mathlib/Algebra/Tropical/` (incl. `BigOperators`)
  — the nearest existing algebra for (min,+) products; no matrix-algorithm development on top.
- Strassen: appears exactly once in mathlib, as motivation in `AkraBazzi.lean:21`.

### Missing

- Matrix multiplication exponent ω (as a definition, bound, or open-problem statement —
  nothing). Border rank, trilinear forms, any algebraic complexity theory: absent.
  Fast matrix multiplication algorithms: absent. Rank of the 3×3 matrix-mult tensor: absent.

### Nearest API

- 3sum-apsp's trilinear machinery (`Term`, `phi/psi/chi`, `Full`, `Mult`, `Pruned`,
  `MvPolynomial (LeftVar ⊕ RightVar ⊕ OutVar) ℤ`) lands naturally on `Mathlib/Algebra/MvPolynomial/*`
  (well-developed: Basic, Coeff, Eval, Degrees, Expand, ...) plus `Holor` (a `Mult` tensor is a
  `Holor ℤ [3,3,3]`). The donor's rank notion (border rank via limits) exceeds `cprank`
  (algebraic CP rank) — extending `Holor` with an analytic completion would be the glue work.
- eth's eight-square identity (`Eight.signs`) and Heisenberg-algebra operators (`a[r]`, `Q_s` on
  `ℚ[t₁,…]`) have **no** mathlib neighbor (no creation-operator / Weyl-algebra development found).

## 5. Analysis / probability support the corpora leaned on

All the specific mathlib imports listed in `survey/anthropics.md` §3 exist in this checkout
(verified): `Mathlib.Analysis.SpecialFunctions.Integrals.Basic`, `Analysis.Complex.CauchyIntegral`,
`Analysis.Analytic.Order`, `Gamma.Digamma`, `Gamma.Deligne`, `SpecialFunctions.SmoothTransition`,
`NumberTheory.Chebyshev`, `NumberTheory.AbelSummation`, `Analysis.PSeries`,
`Computability.TuringMachine.Computable`, `Analysis.SpecialFunctions.Pow.Real`, `Log.Base`,
`Data.Nat.Log`, `Data.List.GetD`, `Analysis.Complex.ExponentialBounds`,
`NumberTheory.PrimeCounting`, `Probability.Independence.Basic`, `Algebra.MvPolynomial.*`,
`LinearAlgebra.Matrix.Defs/Notation`, `Combinatorics.SimpleGraph.Basic`.

- **`Real.smoothTransition`**: `Mathlib/Analysis/SpecialFunctions/SmoothTransition.lean:147`;
  `ContDiff` :206, `Continuous` :216, `Monotone` :223, cutoff values :162-176. Used by zeta23 as
  the taper profile; general-purpose and reusable (WienerIkehara's proof also uses smooth
  cutoffs, :48-49).
- **Gamma/digamma**: `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean` — `digamma_def`
  (:50), `digamma_one_half` (:59), shift (:64,:72), reflection `digamma_one_sub` (:94),
  duplication `digamma_two_mul` (:124), `meromorphic_digamma` (:108). Also `Gamma/BohrMollerup`,
  `Gamma/Deriv`, `Gamma/Deligne`, `Gamma/Beta`. **Missing**: Stirling-type *bounds* on
  Γ′/Γ (|digamma bounds|) — only exact identities; zeta23's `GammaFacts/` re-proved them.
- **MvPolynomial**: `Mathlib/Algebra/MvPolynomial/` — large and sufficient (3sum-apsp usage).
- **Probability**: `Mathlib/Probability/Moments/` — `Variance.lean` (incl. Chebyshev-form
  `ProbabilityTheory.meas_ge_le_variance_div_sq`), `Covariance.lean` (`cov[X,Y;μ]` notation,
  `covariance_self`), `SubGaussian.lean`, `Tilted.lean`; `CentralLimitTheorem.lean`;
  `BorelCantelli.lean`; `StrongLaw.lean`. **Missing**: Paley–Zygmund / named second-moment
  method; discrete-variance second-moment toolkits of the kind both eth (`Variance.stVar`) and
  zeta23 (Gram-trace estimates) built by hand.
- **Asymptotics**: `Mathlib/Analysis/Asymptotics/*` (isBigO/isTheta/isLittleO incl.
  `SpecificAsymptotics`), normed-space versions — the standard API both complexity corpora used;
  plus `AkraBazzi/GrowsPolynomially.lean` for polynomial-growth bookkeeping.

## 6. Direct overlap with the three corpora's headline results

Word-boundary sweeps over all of `Mathlib/` (terms: 3SUM, APSP, ETH, SETH, word RAM, exact
triangle, min-plus, Strassen, tensor rank, border rank, matrix multiplication exponent, simple
zeros, critical line, explicit formula, von Mangoldt, trace inequality, inertia, Hilbert
inequality, pair correlation, zero-free, Backlund, NP-complete, SAT/CNF/k-SAT, PSPACE, Courant–Fischer):

- **No substantive overlap.** All hits are incidental: "ETH Zürich" (MahlerBasis.lean:31,
  QuadraticForm/Signature.lean:31), Strassen as motivation (AkraBazzi.lean:21), "critical line"
  only in HardyZ.lean docstrings, von Mangoldt only as the arithmetic function
  (ArithmeticFunction/VonMangoldt.lean:66) and in Chebyshev/PrimesInAP, "inertia" only in
  ramification theory and real quadratic forms, Max-Cut only as `Function.HasMaxCutProperty`
  (ValuedCSP.lean), 3-SAT only in ValuedCSP docstring (:14). [erratum 2026-11-09, H/QA: v1 cited
  :12; the 3-SAT sentence is line 14 of the file.]
- The nearest-to-overlap declarations (things a donor proof would immediately extend) are:
  `ZetaZeros.lean` (zero set, no counting), `HardyZ.lean` (critical-line restatement of zeros),
  `analyticOrderAt` (multiplicity), `RiemannHypothesis` (the target conjecture as a `Prop`),
  `Holor.cprank` (rank notion without border rank), `Tropical` (semiring without algorithms),
  `TM2ComputableInPolyTime` (polytime without a single composed example), `ValuedCSP`
  (optimization templates without complexity).

## 7. Bridging-hooks summary

**Top donation targets into mathlib** (proved in a sibling corpus, absent or definitional in
mathlib, with a named glue point):

1. **Linear inequality layer from zeta23 `Zeta23/LinAlg/`** (`RHLinalg`: von Neumann trace
   inequality, both directions of Sylvester inertia, Weyl bound, `rank_trace_ineq`) → glues onto
   `IsHermitian.spectral_theorem` (Analysis/Matrix/Spectrum.lean:143) + `Matrix.PosSemidef`
   (Analysis/Matrix/PosDef.lean). Everything on the mathlib side exists; nothing on the donor
   side needs the zeta content — cleanest possible donation. Fills a fully empty cell (§3).
2. **Riemann–von Mangoldt / N(T) from zeta23 `Zeta23/RvM/`** → extends `ZetaZeros.lean` (whose
   `IsCompact.inter_riemannZetaZeros_finite` + `analyticOrderNatAt` make the counting-function
   definition nearly forced); the first zero-counting statement in mathlib, directly beneath the
   existing `RiemannHypothesis : Prop`.
3. **Time-complexity composition layer from eth `machines/ToPartrec/`** (`PolyT`,
   `steps_to_time`, `exists_tm_padded`) → extends the isolated `TM2ComputableInTime`/
   `TM2ComputableInPolyTime` (Computable.lean:161/174), which today has one theorem
   (`idComputableInPolyTime`) and zero importers. Prerequisite for *any* complexity statement in
   mathlib (P, and eventually an `s k`/ETH definition).
4. **Word-RAM model from 3sum-apsp `EndStatement.lean`** → nothing to attach to; new
   `Computability/WordRAM/`. Its `BigO`-on-`Rat` trick and self-containment (no imports) make it
   drop-in, and it pairs with an eth-side gap (TM↔word-RAM simulation proved nowhere) — a
   two-corpus bridge that mathlib would anchor.
5. **Mertens/Chebyshev–Mertens constants + Γ′/Γ Stirling bounds** (zeta23 `FromPNTPlus/`,
   `GammaFacts/`) → extend `NumberTheory/Chebyshev.lean` (already a PrimeNumberTheoremAnd
   partial port per its header :56) and `Gamma/Digamma.lean` respectively.

**Top consumption gaps** (what the corpora had to build themselves; mathlib is the consumer):

1. **PNT assembly point**: Wiener–Ikehara (:693) + `riemannZeta_ne_zero_of_one_le_re` (:417)
   both exist, unconsumed; π(x) ~ x/log x does not. A Phase-2/3 candidate that is *not* novel
   mathematics but is the cheapest proof-of-life for the verification pipeline.
2. No explicit formula / zero-sum machinery (zeta23 `WeilEF` is the only formal instance in the
   ecosystem).
3. No Hilbert-type inequality (zeta23 `MV/Final.lean` is the donor).
4. No second-moment/Paley–Zygmund toolkit for discrete probability (both eth and zeta23 rolled
   their own; a shared donation would serve both).
5. `Holor.cprank` is a definitionally rich but unused tensor-rank API — the natural mathlib
   landing zone for any tensor-decomposition content from 3sum-apsp/tauceti/openai-math, and the
   base from which border rank (needed for ω-type results) is a definitional extension.

**Flagged isolated/underused mathlib declarations** (sorry-free, zero or near-zero internal
consumers, natural bridge sites): `ZetaZeros.lean` (all decls), `WienerIkehara.lean`
(theorem), `TuringMachine/Computable.lean` (whole time API), `Data/Holor.lean` (`cprank`),
`Combinatorics/Optimization/ValuedCSP.lean` (whole file), `AbstractFuncEq.lean`
(`WeakFEPair`, beyond its LSeries use), `AkraBazzi.lean` (theorem has no algorithm to analyze).

## 8. Sources & method

- Commands: `git -C … log -1 --format='%H %ad %s'`; `cat lean-toolchain`; `rg -n
  '^(theorem|lemma|def|…)' <file>` for declaration inventories; targeted `rg -rn -w -i`
  keyword sweeps (§6); `git log --follow` for file ages; reads of file headers/regions
  (ZetaZeros, HardyZ, RiemannZeta, Nonvanishing, WienerIkehara, Chebyshev, PrimesInAP,
  TuringMachine/Computable, AkraBazzi, ValuedCSP, PosDef, Matrix/Order, Matrix/Spectrum,
  QuadraticForm/Real+Signature, Holor, Gamma/Digamma, SmoothTransition, Analysis/Analytic/Order).
- Cross-referenced: `research/RESEARCH.md` (phase charter), `research/survey/anthropics.md`
  (§4 gap claims — all independently confirmed: von Neumann trace / inertia-partial / no
  zero-counting / no explicit formula / no time API beyond `TM2OutputsInTime` / no word-RAM /
  no Hilbert inequality / no Γ′/Γ bounds / no Mertens constants).
- Caveat: rg output elided matched substrings on some console renders; every declaration name
  cited above was confirmed by a direct read of the cited file:line region.
- Assumption: "imported by nothing" claims mean no `Mathlib/` file lists the module in a
  `public import`/`import` line other than the file itself (checked by `rg -rln` on the module
  name); downstream consumers outside mathlib (the sibling corpora) are of course the exception.
- Sibling repos were only read (`anthropics_formal-math` via the R1 report and prior lane notes);
  no writes outside `research/survey/mathlib-frontier.md`; no `lake`/`lean` invocations.
