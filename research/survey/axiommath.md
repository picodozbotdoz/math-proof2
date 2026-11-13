# Phase 1 survey — axiommath (Cycle 2, fifth corpus)

Corpus root: `/home/doz/zcode-workdir/axiommath/` (six shallow clones of
`github.com/AxiomMath/<name>`, read-only). Surveyed 2026-11-13 (lane A1) after the on-our-pin
bump: every repo's `lean-toolchain` is now `leanprover/lean4:v4.36.0-rc2` and every lakefile
pins mathlib `ff2494ea5e438f8a8452db803068acd711fa0059` — the exact encore pin — which is what
makes this corpus *consumable donor* territory rather than reference-only (Cycle-2 charter,
`research/RESEARCH.md:25–39`). Structure follows `survey/anthropics.md`; every claim carries a
file:line locator verified by reading the source this session; upstream git revs from
`git log -1` (read-only).

Provenance pattern shared by five of the six repos (all but PrimeNumberTheoremAnd): the Palomar
**comparator** template — a trusted statement file (`Challenge/`) with `sorry` by design +
an untrusted proof library + `Comparator/comparator.json` fixing `permitted_axioms =
[propext, Quot.sound, Classical.choice]` (e.g. `DedekindZetaZeroFree/comparator.json`,
`ZetaZerosV2/Comparator/comparator.json`, `AreaLaw2D/Comparator/comparator.json`; the last two
also set `enable_nanoda: true`). PrimeNumberTheoremAnd instead uses the Kontorovich-style
**LeanArchitect blueprint** (`blueprint_comment` blocks; `lakefile.toml` requires
`LeanArchitect`). Two repos additionally **vendor/adapt source from our other corpora**:
DedekindZetaZeroFree adapts LeanPool/lean-pool and openai/math source (`formalization.yaml:63–79`)
and pins TauCeti as a Lake dependency; AreaLaw2D formalizes an *openai-math preprint* (OAI265)
and adapts LionSR/TNLean + LionSR/QICLean (`README.md:109–112`, `NOTICE`).

## 0. Corpus snapshot

| | DedekindZetaZeroFree | ZetaZerosV2 | ZetaZeros (V1) | PrimeNumberTheoremAnd | Weil | AreaLaw2D |
|---|---|---|---|---|---|---|
| Result, one sentence | For every number field K, ζ_K ≠ 0 for Re s > 31/32 (s ≠ 1); same for every finite-order Hecke L-function of every ray class character, s = 1 included when nonprincipal | Unconditionally: beyond some height > 67.25% of ζ-zeros are simple AND on the line, > 83.625% distinct, > 88.76% simple-or-on-line, and avg(simple, on-line) > 83.625% | Same first two proportions, but as theorems *from hypotheses* (Riemann–von Mangoldt + Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh pair correlation as Prop binders) | Kontorovich et al. PNT+ fork, sorry-stripped: ψ(x) = x + O(x·exp(−c(log x)^{1/10})) (MediumPNT), Wiener-Ikehara route, plus the analytic toolbox (Perron, zeta bounds, Hadamard, Backlund crude, Kadiri layer) | All four Weil conjectures for smooth proper varieties over finite fields: rationality, functional equation, RH (Deligne), Betti numbers; plus the LeanEval `weil_conjectures` statement verbatim | OAI265 "A two-dimensional area law from a global spectral gap": entanglement entropy S_Ω(A) ≤ C·\|∂_Λ A\| for every 2D lattice domain, admissible Hamiltonian with global spectral gap; + a 3D cylinder corollary |
| Source paper | Cureton–Thorner, *A quasi-Riemann hypothesis for Dedekind zeta functions*, hexagonmath.org/2610.00200v1, Thm 1.1 + Cor 1.2 (`README.md:5–6`, `formalization.yaml:24–33`) | Lamzouri, *A new proof that more than 2/3 of the zeros…*, Thm 1.1 (`README.md:5`, `Challenge/Basic.lean:24–25`) | same | Kontorovich et al. PNT+ (upstream AlexKontorovich/PrimeNumberTheoremAnd; this is Axiom's fork, `README.md:3`) | Freitag–Kiehl, *Étale Cohomology and the Weil Conjecture* (1988) (`README.md:3`) | OpenAI, *A two-dimensional area law from a global spectral gap*, 2026-09-24, openai/math preprints [OAI265] (`OpenAI/Statements.lean:20–22`) |
| Upstream HEAD (pre-bump) | `09afbb4` "add Hecke zero-free corollary" | `1d7edeb` "make main theorem unconditional (#2)" | `4bcaf70` "remove an assumption (#1)" | `d71f7b4` "upgrade mathlib (v4.35.0-rc2)" | `27cdb20` "One library: WeilFrontier renamed to Weil" | `7768136` "Merge PR #1 ruiz/v2-merge" |
| Bump commit (2026-11-13) | `4f6208b` | `a86af1a` (port: KernelBessel MemLp, typed binder, noncomputable landauBad) | `c0b585e` (port: MemLp def, Sqrt import, prod_prod_le) | `d82cfae` (port: explicit imports, linear_combination (norm := module), isBigO_iff) | `c1c8983` | `c0f6d96` |
| Toolchain (all six) | v4.36.0-rc2 (`lean-toolchain`) — note Weil's `README.md:3` still says v4.34.0-rc2 and AreaLaw2D's `README.md:51` says v4.33.0: prose is stale, files are authoritative | | | | | |
| Scale (own .lean, excl. vendor/.lake) | 3870 files / 757,274 lines; 17 top dirs (Eisenstein 693 files, Theta 510, RepresentationTheory 441, Metaplectic 427, Arithmetic 354…) | 96 files / 28,383 lines | 37 files / 7,842 lines | 135 files / 78,946 lines (+ blueprint/, errata/, examples/, home_page/) | 980 files / 213,159 lines (AlgebraicGeometry 477, Defs 241, CategoryTheory 102…) | 335 files / 104,328 lines (AreaLaw/ 11 section trees, AreaLawForMathlib/, OpenAI/, paper/, digest/, blueprint/) |
| Comparator pair | `main`, `heckeCorollary` (`comparator.json:4–8`) | 12 theorems: 4 Hilbert-space props (2.3)–(2.6) + 4 closed-form + 4 numeric (`Comparator/comparator.json:4–19`) | 6 theorems (2 props + 4 thms) (`Challenge/Basic.lean:149–193`) | none (blueprint discipline instead) | none (README-asserted; `#print axioms` recipe `README.md:120–125`) | `OpenAI.Challenge.area_law`, `Arealaw.posSemidef_ptrace`, `Arealaw.trace_ptrace` (`Comparator/comparator.json`) |
| sorry outside Challenge | 0 | 0 | 0 | 0 (all sorry tokens are commented-out code or docstrings; see §2a) | 0 | 0 |

## 1. Mathematical territory

### 1.1 DedekindZetaZeroFree — quasi-RH for ζ_K and finite-order Hecke L

**Headline statements** (Challenge layer, mathlib-only imports:
`Challenge/DedekindZetaChallenge.lean:3–5`):

- `DedekindZetaZeroFree.main` (`Challenge/DedekindZetaChallenge.lean:30`): for every `[Field K]
  [NumberField K]` there is `f : ℂ → ℂ`, differentiable off {1}, equal to
  `NumberField.dedekindZeta K s` for Re s > 1, with `f s ≠ 0` for `31/32 < s.re`, `s ≠ 1`.
  The meromorphic-continuation-as-existential pattern: what is proved is "ζ_K continues and is
  zero-free in Re > 31/32", stated without naming a continuation functor.
- `DedekindZetaZeroFree.heckeCorollary` (`Challenge/DedekindZetaChallenge.lean:34`): the same
  for the L-series of every ray class character `χ : RayClassCharacter K m` (`m ≠ ⊥`;
  structure at `:14–20`: multiplicative, vanishes exactly on non-coprime-or-zero ideals,
  trivial on totally positive α ≡ 1 mod m), entire when χ nonprincipal, `f s ≠ 0` for
  Re s > 31/32 with `s ≠ 1 ∨ ¬χ.IsPrincipal`.

**Proof architecture** (library layer, `DedekindZetaZeroFree/`):

1. `Quantitative.dedekindZeta_ne_zero` (`Nonvanishing/Mellin/Quantitative/DedekindZetaNonvanishing.lean:13`)
   composes two theorems: `cyclotomic12_context` (`Arithmetic/Kummer/TwelfthCyclotomicExtension.lean:10`:
   K(ζ₁₂)/K is Galois abelian, totally complex, with a primitive 12th root) →
   `mu12_continuation_ne_zero` (`Nonvanishing/Mellin/Quantitative/TwelfthRootNonvanishing.lean:13`:
   the seed — quasi-RH 31/32 for totally complex fields containing a primitive 12th root of
   unity) → `dedekindZeta_zeroFree_of_abelian_extension`
   (`Nonvanishing/Descent/AbelianZeroTransfer.lean:20`: zero-freeness transfers from L to K
   whenever ζ_L = g·ζ_K with g entire on ℂ, via `product_nonvanishing_transfer` at `:9` and
   continuation uniqueness `continuation_unique_off_one`).
2. The seed's analytic engine is a **quantitative Mellin-transform comparison**:
   `comparisonPrincipalIncompleteL_ne_zero`
   (`Nonvanishing/Mellin/Quantitative/PrincipalNonvanishing.lean:13`; variant
   `comparisonPrincipalIncompleteL_ne_zero_of_L_ne_zero`,
   `LFunctions/Hecke/PrincipalIncompleteEulerNonvanishing.lean:49`) — the principal-character
   incomplete L-function is pinned against an explicitly constructed model with Gaussian
   factors (`Nonvanishing/Mellin/ArchimedeanGaussianFactors.lean` et al.).
3. The Hecke corollary splits by principality: principal χ reduces to `dedekindZeta_ne_zero`
   times a finite Euler correction (`finiteEulerCorrection` chain, end of
   `Nonvanishing/Hecke/PrincipalCharacter.lean`); nonprincipal χ realizes χ as an Artin
   Galois character via class field theory (`exists_rayCharacter_galoisRealization`,
   `Arithmetic/RayClasses/Reciprocity/RayCharacterGaloisRealization.lean:73`) and applies
   `galoisCharacter_ne_zero` (`Nonvanishing/Hecke/GaloisCharacter.lean:17`: for abelian Galis
   L/K and ρ ≠ 1 on the character dual, the ray-class L-function of the associated character
   is entire and nonvanishing for Re > 31/32, with `χ p = primeArtinValue ρ W` at primes).

**Supporting machinery worth naming as donors** (all proved, sorry-free):

- `dedekindAbelianQuotient` (`LFunctions/Dedekind/EntireAbelianQuotient.lean:13`): for abelian
  Galois L/K there are continuations f_K, f_L of both Dedekind zetas and an **entire** g with
  `fL s = g s * fK s` off {1} — the general-abelian analogue of the quadratic factorization
  ζ_K = ζ·L(s,χ_D) that tauceti's `Quadratic.lean` provides (§4 hook to dossier 42).
- `hasSum_idealInverseNormPower` (`LFunctions/Dedekind/IdealNormSeries.lean:130`):
  `HasSum (idealInverseNormPower K s) (dedekindZeta K s)` for Re s > 1 — the ideal-indexed
  Dirichlet series identity for mathlib's `NumberField.dedekindZeta`.
- `Odlyzko.hasSum_idealInverseNormPower` is consumed in the principal-character reduction
  (namespace `Odlyzko`, `Nonvanishing/Hecke/PrincipalCharacter.lean` proof body) — an Odlyzko-
  style ideal-inverse-norm layer.
- A 12,000-line `LargeSieve/` tree (Bilinear, CharacterBounds, Exponents subdirs; e.g.
  `LargeSieve/Bilinear/CoprimePoissonExpansion.lean`), a 130,728-line `Eisenstein/` tree and a
  108,766-line `Metaplectic/` tree — Kazhdan–Patterson *Metaplectic forms* (IHES 59 (1984))
  is the declared background for the Eisenstein/exceptional-representation/Whittaker machinery
  (`formalization.yaml:35–45`). This is by far the corpus' largest and most structurally
  distinctive block (spectral decomposition on the metaplectic cover of GL₂ over the adeles).

### 1.2 ZetaZerosV2 — Lamzouri proportions, unconditional

**Counting vocabulary** (Challenge layer, mathlib-only: `Challenge/Basic.lean:8–13`):
`nontrivialZeros T` = zeros in the open strip with 0 < Im ρ ≤ T as a *set* (`:44`),
`zeroMultiplicity = analyticOrderNatAt riemannZeta` (`:49`), and six counts — `zeroCount`
(N, with multiplicity, `∑ᶠ` over the set, `:53`), `simpleOnLineCount` (N₀ˢ, set-card,
`:57`), `distinctZeroCount` (N_d, `:62`), `onLineCount` (N₀, with multiplicity, `:66`),
`simpleZeroCount` (N_s, `:71`), `simpleOrOnLineCount` (N_{s∪0}, with multiplicity, `:76`).
Windows are **cumulative** (0, T], not dyadic — a phrasing delta vs zeta23 that matters for
donor swaps (§4).

**The four Hilbert-space inequalities** (Lamzouri Prop 2.1, eqs (2.3)–(2.6); statements
`Challenge/Basic.lean:146–189`, proofs `Hilbert/Propositions.lean`): for a finite
conjugation-invariant multiset (Z, m) and an admissible test function η (L², even, supported
in (−λ, λ), normalized by `fourierC (η^2) 0 = 1`, `IsAdmissible` at `:98`), with kernel
`testKernel η = fourierC (η^2)` (`:110`):

- (2.3) `prop_simple_real_lower`: #real-simple ≥ 2Σm − ΣK(z−s)² (`:146`);
- (2.4) `prop_distinct_lower`: #distinct ≥ (3/2)Σm − (1/2)ΣK² (`:155`);
- (2.5) `prop_simple_plus_real_lower`: #simple + real-mass ≥ 3Σm − ΣK² (`:169`) — proved as
  `card_simplePart_add_realMass_lower` (`Hilbert/Propositions.lean:221`);
- (2.6) `prop_simple_or_real_lower`: if ΣK² ≤ A·Σm with 1 ≤ A < 2 then simple-or-real mass ≥
  (5+2√2−2A)/(3+2√2)·Σm (`:182`) — proved as `simpleOrRealMass_lower`
  (`Hilbert/Propositions.lean:265`). The α-expansion behind them is
  `Hilbert/AlphaExpansion/` (AdaptedBasis, Coefficients, KernelBessel, RescaledZeros,
  SecondMoment; entry doc `Hilbert/AlphaExpansion.lean:36–37` naming `card_simpleRealPart_lower`,
  `card_lower`).

**The eight proportion theorems** (constants C₀ = 3/2 − (1/√2)cot(1/√2) = 0.6725007037…,
C₁ = 5/4 − (1/(2√2))cot(1/√2) = 0.8362503518…, C₂ = (4+2√2−√2·cot(1/√2))/(3+2√2) =
0.8876200082…; `Challenge/Basic.lean:197–203`):

- `thm_simple` (:209) / `thm_distinct` (:217) — liminf proportions ≥ C₀ − ε / C₁ − ε, proved
  unconditionally as `simple_proportion_lower` (`ZetaZeros/Main.lean:47`) and
  `distinct_proportion_lower` (`Main.lean:88`);
- `thm_average` (:229) — (N_s + N₀)/(2N) ≥ C₁ − ε (so max ≥ 83.625%), proved as
  `average_proportion_d5` (`NumericProportions.lean:29`);
- `thm_simple_or_critical` (:238) — N_{s∪0}/N ≥ C₂ − ε, proved as
  `simpleOrOnLine_proportion_d4` (`NumericProportions.lean:47`);
- numeric forms `*_numeric` (:256–278) = `simple_proportion_d4` / `distinct_proportion_d5`
  (`Main.lean:130,149`) and the two in `NumericProportions.lean`, all from the single numeric
  input `montgomeryTaylorConst_lt : C_MT < 1.3275` (`Numeric/MontgomeryTaylor.lean:172`,
  itself `linarith` from a proved cot bound `inv_sqrt_two_mul_cot_lt`; `C_MT` def `:39`).

**The two classical inputs, now theorems** (this is the V2 delta over V1): the Props
`RiemannVonMangoldt` (`Zeta/Inputs.lean:46`: |N(T) − M(T)| ≤ C log T for T ≥ 4, M the main
term) and `PairCorrelation` (`Zeta/Inputs.lean:55`: BGST Acta Arith. 214 (2024) Lemma 5,
error O(1/√log T)) are **proved**: `ZetaZeros.riemannVonMangoldt`
(`ZeroCount/RiemannVonMangoldt.lean:465`, from the folded-path argument principle:
`pi_mul_zeroCount_eq_im_foldedPathIntegral` at `:260`, Backlund at `ZeroCount/Backlund.lean`)
and `ZetaZeros.pairCorrelationFormula` (`PairCorrelation/FromLandau.lean:52`). The
pair-correlation route runs through a **Landau explicit formula**
(`Landau/Formula.lean:170 exists_logDeriv_riemannZeta_eq_add_tsum_allZeros`,
`:143` for ξ) and Perron (`Landau/Perron.lean`, `TruncatedPerron.lean`). The transfer from
abstract multisets to ζ-zeros is `Zeta/Transfer.lean:126 simpleOnLineCount_lower` and
`:151 distinctZeroCount_lower`; the window construction is `kernelConstruction`
(`Zeta/Kernel.lean:995`).

### 1.3 ZetaZeros (V1) — the hypothesis-binder edition

Identical vocabulary and identical constants, but the library *assumes* the two classical
inputs as explicit Prop binders — exactly our pilots' hypothesis-binder convention:
`def RiemannVonMangoldt : Prop` (`ZetaZeros/Defs.lean:133`, N T ∼ (T/2π)log T ε-form) and
`def PairCorrelation : Prop` (`Defs.lean:143`, BGST Lemma 5). Headlines:
`simple_proportion_lower (hRvM : RiemannVonMangoldt) (hPC : PairCorrelation) (ε) …`
(`ZetaZeros/Main.lean:33`), `distinct_proportion_lower` (`:72`), numeric forms
`simple_proportion_d4`/`distinct_proportion_d5` (`:113,132`); Challenge layer carries the
same six statements with `sorry` (`Challenge/Basic.lean:149–193`). V1 has no
average/simple-or-critical theorems and no ZeroCount/Landau/PairCorrelation trees — it is the
minimal kernel-construction + transfer + assembly skeleton (37 files). Upstream history:
`4bcaf70` "remove an assumption (#1)" (the commit that made V1 two-assumption rather than
three).

### 1.4 PrimeNumberTheoremAnd — the analytic toolbox fork

Axiom's fork of `AlexKontorovich/PrimeNumberTheoremAnd` with three declared purposes
(`README.md:3–8`): version bump, module-system upgrade (LeanCert/PrimeCert deps cut),
**sorry removal while keeping the PNT**. Layout under `PrimeNumberTheoremAnd/`:

- **The PNT ladder** (what survives the sorry-strip): `WeakPNT`
  (`Wiener.lean:2352`, ψ-average → 1 via Wiener–Ikehara; `Consequences.lean:88 WeakPNT'`,
  `:108 WeakPNT''` ψ ~ x) and **`MediumPNT`** (`MediumPNT.lean:3714`:
  ψ(x) = x + O(x·exp(−c(log x)^{1/10})) — the smoothing-kernel Mellin route, I1–I9 bound
  decomposition visible in the proof body). The blueprint's **StrongPNT**
  (ψ = x + O(x·exp(−c√log x))) is stated only in `blueprint_comment` text and the theorem
  itself is **commented out with its sorry** (`StrongPNT.lean:1883–1885`) — removed, not
  proved (§2b).
- **The toolbox** (all proved): `PerronFormula.lean` (1181 lines), `ZetaBounds.lean` (3673
  lines; convexity-type bounds, `ZetaLowerBound1_aux1` at `:2317`),
  `HadamardFactorization.lean` (13-line stub header) with the real content in the mathlib-
  shaped subtree `Mathlib/`: `Mathlib/NumberTheory/LSeries/RiemannZetaHadamard.lean`
  (canonical Weierstrass product for `completedRiemannZeta₀` and `riemannXi` at genus 1;
  main-results list in its module docstring, header cites Tao's finite-order Hadamard Thm 22),
  `ZetaFunctionalEquation.lean`, `RiemannZetaConvexity.lean`, `Sieve/Selberg.lean`,
  `Sieve/SelbergBounds.lean` — this subtree is the mathlib-PR-facing layer (TRIAGE row 22
  notes "3 mathlib PRs open; PNTAnd + IEANTN converging").
- **`IEANTN/`** — the explicit-methods layer named after the eponymous project: `Kadiri*`
  (KadiriEq11–14, `KadiriZeroCounting.lean` — zero-density/Kadiri-type zero counting),
  `HadamardLogDerivative.lean`, `Mertens.lean`, `LiSeries.lean` (li as a series,
  `li_eq_eulerMascheroni_add_log_log_add_tsum` `:875`), `MobiusLemma.lean`, `BKLNW/`,
  `RosserSchoenfeld/` (prime-table data as `List (ℕ × ℕ)`, e.g.
  `RosserSchoenfeldPrime_tables.lean`), `eSHP/` (+ tables), `CH2/`.
- **`Backlund/ZeroCountCrude.lean:1105 zetaCounting_crude_majorant`** — a crude zero-count
  majorant (the third formal Backlund-flavoured zero count in the ecosystem after zeta23's
  `RvM/Backlund.lean` and ZetaZerosV2's `ZeroCount/Backlund.lean`; §4 duplication audit).
- `Tactic/AdditiveCombination.lean` — a `linear_combination`-style tactic (upstream of the
  port note "linear_combination (norm := module) replaces additive_combination" in the bump
  commit).

### 1.5 Weil — all four Weil conjectures

Headline theorems (all under `Weil/AlgebraicGeometry/EtaleCohomology/Trace/` except the
LeanEval form; statements quoted in `README.md:19–108` with locators):

1. **Rationality**: `AlgebraicGeometry.exists_mul_zetaSeries_eq`
   (`ZetaRationality.lean:170`; compactifiable case `:139`) — Z_X(t) ∈ ℚ(t) for every
   finite-type X over 𝔽_q; Grothendieck trace formula product and ℓ-independence of the
   integer-coefficient P_ν (`Weil.exists_map_int_eq_rationalFrobeniusCharpolyReverse*`,
   README §1).
2. **Functional equation**:
   `Weil.prod_aeval_inv_rationalFrobeniusCharpolyReverse_zpow_eq`
   (`DeligneFunctionalEquation.lean:341`; dual-charpoly case `:222`) — Z_X(1/(qⁿt)) =
   ±q^{nχ/2}t^χ Z_X(t) for smooth projective pure-dimension X, from Poincaré duality.
3. **RH (Deligne)**: `Weil.satisfiesWeilEstimate`
   (`DeligneWeilConjecture.lean:367`; component structure `:98 iff`, `:110 of_connectedSpace`,
   `:315 of_connectedComponents`) — every Frobenius eigenvalue on H^ν is an algebraic number
   with |ι(λ)| = q^{ν/2} under every embedding. Weil's original zeta-fraction form:
   `Weil.exists_zetaSeries_mul_prod_even_eq_prod_odd` (`WeilRiemannHypothesisForm.lean:206`).
   Deligne's theorem itself is imported from the Stacks dependency
   (`LAdicSheaf.weightBound`, Stacks Tag 03VH; `README.md:74`).
4. **Betti numbers**: `Weil.natDegree_rationalFrobeniusCharpolyReverse_eq_bettiNumber`
   (`BettiNumber.lean:48`; input-abstracted `BettiNumberGoodReduction.lean:215`) — deg P_ν =
   b_ν(Y(ℂ)) for good reduction of a smooth projective complex Y, via a formalized Artin
   comparison theorem (`Weil/AlgebraicGeometry/ComplexPoints/Betti/`,
   `Scheme.finiteDimensional_complexCohomology`).

Plus a **mathlib-only restatement of the whole package**: the LeanEval problem
`weil_conjectures` proved verbatim as
`LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures`
(`Weil/LeanEval/WeilConjectures.lean:185`) — multiset-of-eigenvalues form bundling trace
formula, Poincaré duality, Galois stability, integrality and Deligne in one statement.

Scale note: 980 AI-written modules ("has not yet been reviewed by humans", `README.md:112`);
477 files of AlgebraicGeometry, 241 of Defs, 102 CategoryTheory, 68 RingTheory. `@[weil
"label"]` attribute maps declarations to Freitag–Kiehl items (`Weil/Attr.lean`,
`README.md:113–116`).

### 1.6 AreaLaw2D — OAI265 formalized

**Statement layer** (`OpenAI/Statements.lean`, frozen 2026-10-13, imports only Mathlib +
Physlib + AreaLawForMathlib; every result a `def … : Prop`): the objects are lattice domains
`Λ ⊂ ℤ×ℤ`, qudit registers `Reg (Qudits q) X`, admissible interaction Hamiltonians
(`IsAdmissible`/`hamiltonian`, eq (1.1)), the Loewner-order global gap
`HasGlobalGap H Ω E₀ Δ : H − E₀ ≥ Δ(1 − |Ω⟩⟨Ω|)` (`Statements.lean:185`), boundaries
`edgeBoundary/innerBoundary/cutEndpoints` (`:135` ff.), and the region entropy of the pure
state (`(pureState Ω hΩ).regionEntropy`). Theorem 1.1 = `OpenAI.AreaLaw`
(`Statements.lean:202`): ∃C ∀Λ ∀Φ admissible ∀Ω (normalized eigenvector, gap) ∀A ⊆ Λ:
S_Ω(A) ≤ C·|∂_Λ A|. Corollary 1.2 = `AreaLawCorollary` (`:228`, R = 1 case + vertex forms
`VertexAreaLaw` `:212`). Eleven paper items are statement-`def`'d and proved (table
`README.md:11–23`): area law, corollary, ConditionalContinuity (L2.1), MarginalTails (L3.1),
BufferDiscount (L3.2), InitialBoxEstimate (P3.3), PositiveReplacement (P4.3, the conditional
expectation `condExpect` at `Statements.lean:250`-region), CollarBound (P9.6),
Amplification (P10.2), TwoFamilyCancellation (L11.1), TwoFamilyDecomposition (P11.2).

**Proof layer**: `AreaLaw/S01…S11` one module tree per paper section; development over ℂ,
transferred to every `RCLike 𝕜` in `AreaLaw/Transfer.lean` (`areaLaw` at `:361`,
`areaLawCorollary` at `:367`, hypothesis side-conditions `1 ≤ q`, `0 < J`, `0 < Δ`).
**3D continuation**: statements fixed in `OpenAI/Statements3D.lean`; one proved — the
cylinder area law `OpenAI.cylinderAreaLaw3D` / `cylinderAreaLawOfPlanar3D`
(`OpenAI/Cylinder3D.lean:574,526`) as a corollary of Theorem 1.1 (`README.md:28–31`).

**Donor layer** `AreaLawForMathlib/` — "results Mathlib and Physlib lack, in Mathlib's
layout" (`README.md:39`): a 51-file `Analysis/Matrix/` tree (operator Jensen
`OperatorJensen.lean`, operator convexity, geometric-mean calculus
`GeometricMeanCongruence/Derivative/PathDerivative.lean`, CFC = continuous functional
calculus conjugation `CfcConjugation.lean`/`OrthogonalResolutionCfc.lean`, positive/N-positive
maps `PositiveMap.lean`/`NPositiveMap.lean`, compressed inverses, projection products),
`Analysis/CStarAlgebra/` (matrix C*-structure `Matrix.lean`, `SqrtHolder.lean`),
`Analysis/Fourier/GevreyBump*.lean`, `RepresentationTheory/SchurWeyl/`, and the
`QuantumInfo/Region/` substrate (`Reg`, partial trace `ptrace`, `SubState`/`MState`,
`regionEntropy`, `mutualInfo`, trace distance; `README.md:39`). Provenance: v1 proofs
(2026-10-12..16, Ruiz Chen, agent tooling + OpenAI Codex, statement layer frozen and audited),
v2 restructuring (2026-10-19..21, Mogielnicki) — `README.md:99–107`; adapted sources
LionSR/TNLean + LionSR/QICLean (`README.md:109–112`, `NOTICE`).

## 2. Depth & terminal points

### (a) `sorry` / `native_decide` / `axiom` inventory (verified by grep this session)

| Repo | sorry tokens (excl. vendor/.lake) | Where | native_decide | `axiom` declarations | verdict |
|---|---|---|---|---|---|
| DedekindZetaZeroFree | 2 | `Challenge/DedekindZetaChallenge.lean:32,41` (the two comparator placeholders) | 0 | 0 | clean |
| ZetaZerosV2 | 12 | `Challenge/Basic.lean` only (the 12 comparator placeholders) | 0 | 0 | clean |
| ZetaZeros | 6 | `Challenge/Basic.lean:154,164,173,181,187,193` | 0 | 0 | clean |
| PrimeNumberTheoremAnd | 14 | ALL in comments/docstrings: `GeneralMeromorphic.lean:37,123,149` (`-- sorry_using […]`), `PerronFormula.lean:376` (`-- sorry`), `StrongPNT.lean:1885` (commented-out theorem), `IEANTN/Kadiri.lean:84,127,2170` + `FKS2*TrustedNumerics.lean` docstrings (prose about upstream's sorries) | 0 | 0 in real code (`Tactic/AdditiveCombination.lean:176–177` `axiom qc` is inside a docstring example block) | clean — but the sorry-*removal* deleted content (see (b)) |
| Weil | 0 | — | 0 | 0 (one prose hit in a docstring) | clean |
| AreaLaw2D | 5 | real: `Challenge/Basic.lean:77,82,259` (3 comparator placeholders); prose: `OpenAI/Statements.lean:23–24` | 0 | 0 | clean |

**Axiom claims per headline theorem** (donor-hygiene triad check): all six repos assert the
standard triad only. Evidence: `DedekindZetaZeroFree/formalization.yaml:92–110`
(`status.axioms: [propext, Quot.sound, Classical.choice]`, per-result `sorry_count: 0`,
"full default build passes … admitting only the three standard axioms");
`comparator.json` `permitted_axioms` lists (DZZF, ZetaZerosV2, AreaLaw2D);
`Weil/README.md:118–125` (#print axioms recipe + example output);
`AreaLaw2D/README.md:25–26,63–64` + `OpenAI/Audit.lean` (`#print axioms` for every frozen
statement, `:22` ff.); ZetaZeros(V2) have no in-repo audit file (README's comparator claim
only). None of the six uses `native_decide` anywhere. Caveat: these are README/config claims;
independent kernel `#print axioms` runs on our Modal substrate exist only for the pieces
axbump built (§5).

### (b) Stated-not-proved / removed / conditional

- **PNT+ StrongPNT is gone, not proved**: the ψ = x + O(x exp(−c√log x)) theorem exists only
  as blueprint text and a commented-out declaration with `sorry`
  (`StrongPNT.lean:1883–1885`). The strongest *proved* PNT in the fork is MediumPNT
  (`MediumPNT.lean:3714`, exponent 1/10). Upstream's FKS2 Corollaries 23/24 (explicit π(x)
  bounds) survive only as empty stubs — `IEANTN/FKS2Cor24TrustedNumerics.lean` documents 22
  "trusted numerical sorry" windows (rows 1–11 headers at `:73–93` with **no** lemmas under
  them; the declarations `corollary_23_all`/`corollary_24_all` no longer exist in the tree,
  docstring-only references). Any donor plan touching StrongPNT/FKS2 content must treat it as
  absent. (The `Mathlib/` subtree's 75 files, §1.4, are the mathlib-facing remainder of that
  program.)
- **ZetaZeros V1 is permanently hypothesis-conditional by design**: RvM + BGST as Prop
  binders (`Defs.lean:133,143`) — V2 is the unconditional completion; V1 remains useful
  exactly as a *binder-form donor* matching our pilot convention (§4).
- **DedekindZetaZeroFree is ζ_K/Hecke only**: no zero-density, no zero counting, no
  proportions — a pure zero-free-region theorem (plus its enormous supporting machinery).
  The stated-but-unproved frontier (paper-level): region 31/32 is not improved; the paper's
  own potential refinements are outside the repo.
- **AreaLaw2D 3D continuation is mostly open**: `Statements3D.lean` fixes statements, only
  the cylinder corollary is proved (`README.md:28–31`) — a ready-made terminal point with the
  next milestones pre-specified (`docs/3D/Targets.md`).
- **Weil**: nothing stated-not-proved; the README's only caveat is human review pending
  (`README.md:112`).

### (c) Proved-but-not-generalized (fixed constants that could be parameters)

- ZetaZerosV2 constants are frozen at the Montgomery–Taylor window λ = 1 (C₀, C₁, C₂ closed
  forms; `Numeric/MontgomeryTaylor.lean:39–49`): no λ-family statement is exposed at the
  challenge layer (unlike zeta23's `thmA/B/C_lam` families). The α-expansion machinery is
  general; the parametrized layer is internal.
- The Hilbert-space inequalities (2.3)–(2.6) are stated for a *fixed* admissible η per
  application; the A-parameter in (2.6) is generalized (`1 ≤ A < 2`) but the test-function
  optimization is resolved only at the MT kernel.
- DZZF's 31/32: the descent theorem `dedekindZeta_zeroFree_of_abelian_extension` is fully
  parametric in α (`AbelianZeroTransfer.lean:20`, `α : ℝ` binder) — only the seed pins
  31/32. A parametric seed would lift the whole tower; the seed's constant is where the
  Gaussian-kernel estimates are tuned.
- Weil: per-ν eigenvalue statements are uniform, but no "family of varieties" or
  relative-version packaging exists; the LeanEval form fixes geometrically irreducible +
  smooth of relative dimension d.
- PNT+ MediumPNT: c is an anonymous existential (∃c > 0), never tracked through the I-bounds.

### (d) Isolated results with no neighbors

- DZZF `Metaplectic/` (427 files) and `Eisenstein/` (693 files): the Kazhdan–Patterson
  layer feeds the seed theorem; nothing else in the *ecosystem* consumes metaplectic
  machinery — the only formal metaplectic-representation development we know of in any
  corpus (novelty input, not just a gap).
- DZZF `LargeSieve/` (140 files): a bilinear/character-sum large-sieve engine whose only
  consumer is the μ₁₂ seed; no connections to PNT+'s `Sieve/Selberg` (a *different* sieve,
  same word).
- ZetaZerosV2 `Landau/` (13 files incl. `ZeroOrdinateGaps.lean`, `HeightWindowJump.lean`):
  Landau's formula + zero-ordinate spacing, consumed only by pair correlation.
- Weil `LeanEval/WeilConjectures.lean`: a one-file consumer bundling everything; nothing
  downstream.
- AreaLaw2D `Analysis/Fourier/GevreyBump*.lean`: Gevrey bump functions — a self-contained
  analysis island (potential mathlib donor) unrelated to the quantum core.

## 3. External dependencies

Per lakefile.toml (all six pin mathlib `ff2494ea` post-bump):

- **DedekindZetaZeroFree** (`lakefile.toml`): mathlib ff2494ea; **TauCeti**
  `TauCetiProject/TauCeti @ d92acc5c…` (lakefile) — manifest resolves `c197d7bd…`
  (`lake-manifest.json`), and `formalization.yaml:66–72` records the adapted-source revision
  `66f3330c` supplying representative-density/Borel/torus/local-field pieces — i.e. three
  TauCeti touchpoints to track; **FiniteAbelianGlobalReciprocityv2** (PalomarArchive
  n-yamaguchi-0729, rev 58370e62 upstream), **vendored** at `vendor/class-field-theory`
  (1658 .lean files; supplies global class field theory — ray class characters ↔ Galois
  characters). Also source-reuse (not Lake deps): LeanPool/lean-pool @ 68aa6ee6 (Dedekind
  zeta + ANT), **openai/math @ adc7f124** (analytic number theory) —
  `formalization.yaml:52–79`, `README.md:39–44`.
- **ZetaZerosV2**: mathlib ff2494ea + **PrimeNumberTheoremAnd @ tag `v4.34.0-rc2`**
  (`lakefile.toml`, with the comment that PNT+ supplies "the rectangle argument principle,
  the Hadamard product for riemannXi, bounds for zeta in and around the critical strip, the
  Perron formula, and the prime number theorem with a remainder"). Note: the tag name is
  stale relative to the bumped content; axbump redirected this require to the local bumped
  clone (§5).
- **ZetaZeros**: mathlib only.
- **PrimeNumberTheoremAnd**: mathlib ff2494ea + LeanArchitect (blueprint tooling) +
  checkdecls (dev tooling) (`lakefile.toml`).
- **Weil**: mathlib ff2494ea ("Same Mathlib commit as the Stacks project") +
  **AxiomMath/Stacks @ 012108f6** (`lakefile.toml`) — Stacks is NOT cloned locally
  (AGENTS.md); consult on GitHub only. Deligne's theorem is *consumed from* Stacks
  (`LAdicSheaf.weightBound`, Tag 03VH; `README.md:74`).
- **AreaLaw2D**: mathlib ff2494ea + **Physlib** @ a50684a1 (`lakefile.toml`) + local
  `lintall` lint driver. Source adaptations: LionSR/TNLean, LionSR/QICLean (`NOTICE`).

Staleness caveats found: DZZF `lake-manifest.json` still resolves mathlib `0493595e`
(pre-bump) — a `lake update` is required on first build; Weil/AreaLaw2D READMEs quote old
toolchains (v4.34/v4.33) in prose.

## 4. Bridging hooks (ranked by discovery potential)

Cross-references: dossier files `research/candidates/NN-*.md`; bridge maps
`research/bridges/{analytic-nt,complexity,linear-algebra,tauceti-contributions,tensor-algebra}.md`;
TRIAGE `research/TRIAGE.md:65–86`. Cycle-2 planned bridge files: `bridges/function-field.md`,
`bridges/area-law.md`, donor remap `novelty/axiommath-as-donor.md` (STATUS.md lane board).

**H1 (top). DedekindZetaZeroFree × dossier 42/20 — the general-abelian factorization and the
first ζ_K/Hecke zero-free region on our pin.** Two independent hooks:
(a) `dedekindAbelianQuotient` (`LFunctions/Dedekind/EntireAbelianQuotient.lean:13`) proves
ζ_L = g·ζ_K with g entire for **every abelian** Galois L/K — the exact `hfac`-binder shape
pilot 42-M2a used (`hfac : ∀ ρ, multOf fK ρ = multOf fζ ρ + multOf fχ ρ`,
`pilots/20-blueprint.md` §1) but beyond quadratic: it generalizes dossier 42's
product-assembly route from K = ℚ(√d) to every abelian extension, with `analyticOrderAt_mul`
glue on our pin. (b) `main`/`heckeL_ne_zero` give the first formal zero-free half-plane for
ζ_K (any K) and Hecke L (any K, any modulus, finite order) — feeding dossiers 20/22/40/42/50's
"no corpus has ζ_K statements" premise and upgrading them from conjecture-grade to
theorem-grade inputs where only *existence of continuation* is needed.
**Correction to the working premise (important for A3)**: DZZF does **not** discharge pilot
50's `hQRH` binder as written — `pilots/50/M1.lean:45` requires `∀ s, (7/8:ℝ) < s.re →
riemannZeta s ≠ 0` and openai's 7/8 region strictly contains DZZF's 31/32 (= 0.96875 > 0.875);
the same holds for the Dirichlet binder `hQRHχ` (`pilots/50/Dirichlet.lean:41`). DZZF can
discharge only *weakened* (31/32) binders; its real value is where the openai corpus has
nothing: ζ_K for general K and Hecke L beyond ℚ(√−3). Feeds: `bridges/analytic-nt.md`
(zero-free row), `novelty/axiommath-as-donor.md`.

**H2. ZetaZerosV2 × dossiers 42/01/02/21 — second zero-proportion donor with two new
statement shapes.** V2's `thm_simple`/`thm_distinct` constants equal zeta23's Theorem-D
optimal constants (C₀ = 2 − C_MT = 2 − 1/c₁*; C₁ = (3 − C_MT)/2; same
`C_MT = 1/2 + 2^{-1/2}cot(2^{-1/2})` — compare `survey/anthropics.md:131–132`), so for
dossier 42's donor swap V2 substitutes for the zeta23 ζ-column *at equal strength* (and with
cumulative-window phrasing matching TRIAGE row 42's caveat). What V2 adds that zeta23 lacks:
`thm_average` (avg of simple and on-line proportions ≥ 5/6-ish 0.83625) and
`thm_simple_or_critical` (0.8876) — neither proportion has a ζ_K, Dirichlet, or ξ′ analogue
anywhere (candidate 70-series statements via the 42 assembly or the 20 engine). V2's Hilbert
inequalities (2.5)/(2.6) (`Challenge/Basic.lean:169,182`) are asymmetric defect-form bounds —
direct comparison material for dossier 01's master identity (novelty check vs
Knausgård's clip-trace, `novelty/knausgaard-as-donor.md`) and dossier 02's bandwidth-k
ceiling laws. V2 also proves RvM for ζ unconditionally (`ZeroCount/RiemannVonMangoldt.lean:465`)
— the **third** independent formal RvM (zeta23 `RvM/Statement.lean:20`, PNT+
`Backlund/ZeroCountCrude.lean:1105` crude) — a three-way duplication-audit item for
`bridges/analytic-nt.md`'s zero-counting row and a donor choice for pilot 20's `rvm` Card20
field.

**H3. Weil × the quasi-RH cluster — the function-field bridge (Cycle-2
`bridges/function-field.md`).** Weil's `satisfiesWeilEstimate`
(`DeligneWeilConjecture.lean:367`) is RH over 𝔽_q *exactly* (|ι(λ)| = q^{ν/2}, i.e. all
zeta-zeros of smooth proper X on the line), against the number-field side's partial regions
(31/32 DZZF, 7/8 openai, proportions 2/3 zeta23/V2). This makes precise a uniform statement
shape — "zero-free half-plane Re s > θ for the zeta of every [global field / …]" — where θ =
1/2 is a theorem on the function-field side and θ < 1 on the number-field side; candidate
discovery territory: function-field analogues of the zero-density/proportion statements
(simple zeros of Z_X? distinct Frobenius eigenvalues — cf. V2's (2.3)–(2.6) which are
statements about *arbitrary* conjugation-invariant multisets, hence apply verbatim to
Frobenius eigenvalue multisets), and Deligne-bound-driven versions of the DLRT/SDP
distinctness proportions. Also `zetaSeries` (`AlgebraicGeometry.zetaSeries`, `README.md:11`)
is a third formal "zeta" object beside mathlib's `riemannZeta` and `NumberField.dedekindZeta`
— the rationality/FE pair is the function-field row of the analytic-nt capability table.

**H4. AreaLaw2D × openai-math ↔ linear-algebra dossiers 01–03 (Cycle-2
`bridges/area-law.md`).** AreaLaw2D *is* the openai-math family-265 formalization, so it
completes the openai column of our corpus matrix: OAI265's matrix-analysis content is now
Lean with exact names — operator Jensen (`AreaLawForMathlib/Analysis/Matrix/OperatorJensen.lean`),
geometric-mean calculus, CFC machinery, Schur-Weyl (`RepresentationTheory/SchurWeyl/`), and
the `QuantumInfo/Region` entropy substrate. For dossiers 01–03 (zeta23 `RHLinalg` cluster:
von Neumann/Sylvester/rank-trace), the natural junctions are: matrix inequalities of the
compression/projection type on both sides (zeta23's `RankTrace.lean:163` vs AreaLaw2D's
`CompressedInverse`/`ProjectionCompressionCfc`), and positivity-monotonicity lemmas
(`PositiveMap`/`NPositiveMap` vs PSD-hereditary arguments in `ZeroSide/`). Dossier 52
(unified CCR/Fock layer) also points here: `Analysis/CStarAlgebra/` + Schur-Weyl is the
closest existing "representation-theoretic matrix analysis" library to the CAR/Fock layer of
openai's `Analysis/Naimark/CAR.lean`. Caveat: AreaLaw2D leans on Physlib — consuming its
statement layer requires Physlib on our pin (not yet probed).

**H5. PNT+ × dossier 22 and the mathlib-convergence cluster.** The fork's `Mathlib/` subtree
(RiemannZetaHadamard, ZetaFunctionalEquation, RiemannZetaConvexity, Sieve/Selberg) is
mathlib-shaped and PR-facing (TRIAGE row 22: "3 mathlib PRs open; PNTAnd + IEANTN
converging"); its Perron (`PerronFormula.lean`) overlaps tauceti's Perron layer (AGENTS.md
DedekindZetaZeroFree note; dossier 22's Tier-2). For donor plans: `MediumPNT` is the proved
headline; StrongPNT absent (§2b). The Kadiri/IEANTN zero-counting files are the
explicit-constants complement to zeta23/V2's asymptotic proportions — a "explicit vs
asymptotic" bridge row absent from the main-run bridge map.

**H6. DZZF's adeles/metaplectic layer × tauceti.** DZZF pins TauCeti as a hard dependency
(lakefile) and adapts its compact-group density machinery — the first *consumption* of
tauceti by another corpus project we have surveyed (tauceti-contributions.md documented
zeta23↔tauceti duplication; here it is downstream use). Consequence: any donor statement
pulled from DZZF potentially drags TauCeti + vendored class field theory into the transitive
trust base — fine for axioms (audited triad) but heavy for our Modal staging; statement-level
re-statement (the pilots' binder pattern) avoids the drag.

**H7. V1's hypothesis-binder pattern × our pilot convention.** ZetaZeros V1's
`(hRvM : RiemannVonMangoldt) (hPC : PairCorrelation)` binders (`ZetaZeros/Main.lean:33`)
match our `hQRH`/`Hypζ`/`EnclOK` convention exactly; V1's theorems are drop-in conditional
donors whose hypotheses V2 has now discharged — a ready-made "conditional theorem +
discharged hypotheses" pair for exercises in dossier 50-style binder hygiene (and a check
that our convention independently arose at Axiom too).

## 5. The on-our-pin bump — what is proven consumable

`research/feasibility/axiommath-bump/axbump.py` (Modal app `crossmath-axbump`, 2026-11-13):
image with elan v4.2.4 + toolchain v4.36.0-rc2 + `/opt/mathlib` at ff2494ea with
`lake exe cache get`; `REPOS = [ZetaZeros, ZetaZerosV2, PrimeNumberTheoremAnd,
DedekindZetaZeroFree]` (Weil and AreaLaw2D never staged); `CHALLENGES` = the three
mathlib-only statement files; `BUILDS = [(ZetaZeros …), (ZetaZerosV2 …)]` with ZetaZerosV2's
PNT+ require rewritten to the local bumped clone (`axbump.py:100–104`).

Outcome (logs in `axiommath-bump/logs/`):

- **Statement elaboration against mathlib ff2494ea / v4.36.0-rc2 — all three OK from run 1**
  (`run1.log`): `ZetaZeros/Challenge/Basic.lean`, `ZetaZerosV2/Challenge/Basic.lean`,
  `DedekindZetaZeroFree/Challenge/DedekindZetaChallenge.lean`. Every comparator statement of
  all three repos elaborates on our pin — donor statements are consumable verbatim
  (consistent with the corpus-wide statement-port-cost-≈0 finding,
  `FEASIBILITY-SUMMARY.md` probes B/C/D/E/F).
- **Full build ZetaZeros: OK** (`run5.log`), after the two port commits (MemLp def change,
  Sqrt import, `prod_prod_le` visibility — bump commits c1c52a7/c0b585e).
- **Full build ZetaZerosV2: OK** (`v2-run9.log`, "Build completed successfully (8262 jobs)"),
  after nine iterations (183→38→10→11→3→2→0 errors; v2-run2..9) fixing KernelBessel MemLp,
  typed binder in LocalCount, noncomputable landauBad (commit a86af1a) **and, transitively,
  PrimeNumberTheoremAnd's full library on ff2494ea** (the path-redirected dependency built as
  part of the 8262 jobs; port commit d82cfae: explicit imports, renamed/moved mathlib lemmas,
  `linear_combination (norm := module)` replacing `additive_combination`, `isBigO_iff`,
  `Nat.strong_induction_on`). So ZetaZerosV2 + PrimeNumberTheoremAnd are *fully built*
  donors on our pin.
- **NOT exercised**: DedekindZetaZeroFree full build (only its Challenge elaborated; the
  TauCeti + vendored-CFT dependency chain was never compiled on ff2494ea — and DZZF's stale
  manifest needs `lake update` first, §3); **Weil and AreaLaw2D entirely** (not in REPOS;
  Weil additionally needs the uncloned Stacks dependency, AreaLaw2D needs Physlib). These
  three are lakefile-pinned to our mathlib rev but *unverified* on it — any pilot consuming
  them beyond statement re-statement needs a build probe first (lane A7's
  `axiommath-donor-probes.md` is the natural home).

## 6. Sources consulted

- AGENTS.md (conventions, sibling inventory), `research/RESEARCH.md` (charter + Cycle-2
  addendum), `research/survey/anthropics.md` (model), `research/TRIAGE.md` (rows 01–03,
  20–22, 40–42, 50–52), `research/STATUS.md:101–119` (Cycle-2 lane board),
  `research/bridges/*.md` (headers + analytic-nt capability table),
  `research/pilots/20-blueprint.md`, `research/pilots/50/{M1,Dirichlet}.lean` (binder forms),
  `research/candidates/42-*.md` (head), `research/feasibility/axiommath-bump/{axbump.py,
  logs/run1–5, v2-run1–9}`.
- DedekindZetaZeroFree: `README.md`, `formalization.yaml` (all), `lakefile.toml`,
  `lake-manifest.json`, `comparator.json`, `Challenge/DedekindZetaChallenge.lean` (all),
  `Solution/DedekindZetaSolution.lean` (all), `DedekindZetaZeroFree/{Main,HeckeCorollary}.lean`
  (all), `Nonvanishing/Mellin/Quantitative/{DedekindZetaNonvanishing,TwelfthRootNonvanishing,
  PrincipalNonvanishing}.lean`, `Nonvanishing/Descent/AbelianZeroTransfer.lean` (all),
  `Nonvanishing/Hecke/{GaloisCharacter,PrincipalCharacter,NonprincipalCharacter}.lean`,
  `LFunctions/Dedekind/{EntireAbelianQuotient,IdealNormSeries}.lean`,
  `Arithmetic/Kummer/TwelfthCyclotomicExtension.lean`,
  `Arithmetic/RayClasses/Reciprocity/RayCharacterGaloisRealization.lean`,
  `LFunctions/Hecke/PrincipalRayContinuation.lean`; dir listings + per-dir line counts;
  sorry/native_decide/axiom greps.
- ZetaZerosV2: `README.md`, `Challenge/Basic.lean` (all 283 lines), `ZetaZeros/Main.lean`
  (all), `ZetaZeros/{Defs,Inputs via Zeta/Inputs}.lean`, `NumericProportions.lean`,
  `Numeric/MontgomeryTaylor.lean`, `ZeroCount/RiemannVonMangoldt.lean`,
  `PairCorrelation/FromLandau.lean`, `Landau/Formula.lean`, `Hilbert/Propositions.lean`,
  `ZetaZeros/{Kernel,Transfer}.lean` (locator greps), `lakefile.toml`,
  `Comparator/comparator.json`; sorry grep.
- ZetaZeros: `README.md`, `Challenge/Basic.lean` (theorem/sorry map), `ZetaZeros/Defs.lean`
  (:120–165), `ZetaZeros/Main.lean` (all), `Numeric/MontgomeryTaylor.lean` (locators),
  file listing.
- PrimeNumberTheoremAnd: `README.md` (all), `lakefile.toml`, `PrimeNumberTheoremAnd/`
  listing, `StrongPNT.lean:1820–1885`, `MediumPNT.lean:3700–3760`, `Wiener.lean` +
  `Consequences.lean` (PNT locators), `IEANTN/FKS2Cor24TrustedNumerics.lean` (all),
  `IEANTN/{LiSeries,Mertens}.lean` locators, `IEANTN/eSHP/eSHP_tables.lean` (head),
  `Backlund/ZeroCountCrude.lean` locator, `Mathlib/` subtree listing +
  `Mathlib/NumberTheory/LSeries/RiemannZetaHadamard.lean` (head docstring),
  `Tactic/AdditiveCombination.lean:165–185`; full sorry/axiom grep.
- Weil: `README.md` (all 138 lines), `lakefile.toml`, theorem locator greps over
  `Weil/AlgebraicGeometry/EtaleCohomology/Trace/{ZetaRationality,DeligneFunctionalEquation,
  DeligneWeilConjecture,WeilRiemannHypothesisForm,BettiNumber,BettiNumberGoodReduction}.lean`
  and `Weil/LeanEval/WeilConjectures.lean`; sorry/native_decide/axiom greps; subdir counts.
- AreaLaw2D: `README.md` (all 116 lines), `lakefile.toml`, `OpenAI/Statements.lean`
  (:1–45, :195–260), `OpenAI/Audit.lean` (head), `AreaLaw/Transfer.lean` +
  `OpenAI/Cylinder3D.lean` locators, `Challenge/Basic.lean` + `Solution/Basic.lean` +
  `Comparator/comparator.json`, `AreaLawForMathlib/` listing, `paper/main.tex:43–46`;
  sorry/native_decide greps.
