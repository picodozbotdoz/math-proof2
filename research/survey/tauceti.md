# Phase 1 survey — tauceti (Tau Ceti)

Corpus root: `/home/doz/zcode-workdir/tauceti` (git `d92acc5c0`, 2026-11-09, read-only). Not a
paper formalization: an **open-ended, AI-authored, mathlib-downstream library of record scale**,
directed by human roadmaps in the external `TauCetiRoadmap` repo and reviewed by AI agents against
human rubrics (`TauCetiReview`) (`README.md:7–16`, `AGENTS.md:42–110`). Current roadmap areas
(`README.md:249–254`): universal covers, the Jacobian challenge, reductive algebraic groups, PDEs,
Heegaard Floer and knot Floer homology, multiquadratic fields and genus theory. Its
`formalization.yaml` self-describes: sources = the roadmaps ("blueprint"), `sorry_count: 0`,
axioms allowlist `propext, Classical.choice, Quot.sound`, `main_results: []` "none yet, since the
library is bootstrapping" — understated: the library is far past bootstrapping (see §1).

## 0. Corpus snapshot

| Axis | Value |
|---|---|
| What it is | AI-written general mathematics library ("reusable, at scale"), Apache-2.0, incubated by the Lean FRO / Mathlib Initiative (`README.md:10–16`) |
| Toolchain / pin | Lean `v4.36.0-rc2` (`lean-toolchain`); Mathlib `master` pinned at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` (`lake-manifest.json`) — same toolchain family as encore-mathlib and this project's convention |
| Scale | 27,934 `.lean` files under `TauCeti/` (34 top-level areas), ~5.92M lines; 218,614 `theorem`s + ~13k `lemma`s, ~35,940 `def/abbrev`s (rg census) |
| Statement/proof split | None: statements live with proofs; big unproved theorems are recorded as named `Prop` defs (§2b) — the inverse of anthropics' trusted-statement pattern |
| `sorry` policy | CI forbids `sorry`/extra axioms/`native_decide`/meta imports (`AGENTS.md:44–46`); `scripts/Axioms.lean` runs declaration-ownership + transitive axiom audits; **library contains zero `sorry` tokens** (§2a) |
| Module system | Lean 4 `module`/`public import` (per-file `module` headers; cf. 3sum-apsp, the only anthropics project using it) |
| Build hygiene | `lakefile.toml` globs `TauCeti.*`; bors merge train (`bors.toml`); hourly Mathlib bump bot with bump-guard; hourly→3-hourly docgen at taucetiproject.org/docs |
| Largest areas (files) | Algebra 4,324; Analysis 3,543; NumberTheory 2,388; Geometry 2,281; RingTheory 2,089; AlgebraicGeometry 1,890; LinearAlgebra 1,700; RepresentationTheory 1,650; Topology 1,474; Probability 1,111; AlgebraicTopology 868; MeasureTheory 755 |
| Distinctive small areas | Computability 66 (priority method); QuantumGroups 54; InformationTheory 76; NoncommutativeGeometry 13; Condensed 1 (nascent); ModelTheory 134; LowDimTopology 100 |

## 1. Mathematical territory

Everything below is proved unless flagged "recorded, not proved" (§2b). Names/paths exact;
`TauCeti/` prefix omitted in citations.

### 1.1 Analytic number theory and L-functions (NumberTheory/, ~2.4k files)

The deepest distinctive development, organized around Mathlib's `LSeries` and Loeffler's
`WeakFEPair` (itself credited, `LSeries/AbstractFuncEq.lean` header):

- **Landau's theorem**: `TauCeti.LSeries.landau` (`NumberTheory/LSeries/Landau.lean:296`) — a
  Dirichlet series with nonnegative coefficients is singular at the real point of its abscissa of
  absolute convergence; plus pole-not-removable (`meromorphicOrderAt_lt_zero_of_eq_LSeries`) and
  half-plane forms.
- **Prime ideal theorem**: `primeIdealTheorem`
  (`NumberTheory/ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean:39`) — PNT for the prime
  ideals of any number field; mathlib has PNT only over ℚ. Consumed by **Mertens' three theorems
  for a number field** (`NumberTheory/LFunctions/Mertens.lean`: first theorem
  `∑_{N𝔭≤x} log N𝔭/N𝔭 = log x + O(1)`, second with constant `B_K`, Mertens product
  `∏(1−N𝔭⁻¹)⁻¹ ~ e^γ κ_K log x` with `κ_K = dedekindZeta_residue K`).
- **3-4-1 nonvanishing**: `NumberTheory/LSeries/Nonvanishing.lean` — the
  Hadamard–de la Vallée-Poussin trigonometric-inequality argument that L-series of characters do
  not vanish on `Re s = 1`, split into arithmetic (Euler product, positivity of 3+4cosθ+cos2θ) and
  analytic halves.
- **Tauberian theory**: Wiener–Ikehara (`NumberTheory/LSeries/WienerIkehara/` — 10 files:
  Approximation, BoundaryGrowth, Fourier, SharpCutoff, Variants) and **Newman's Tauberian theorem**
  (`NumberTheory/LSeries/Newman/Tauberian.lean`).
- **Zeros/completions** (`NumberTheory/LFunctions/Zeros/Completion/`): a general
  `AnalyticLFunctionData.entireCompletion` (pole-clearing via Mathlib's `toMeromorphicNFOn`,
  exact `meromorphicOrderAt` preserved, `Basic.lean`); `zetaEntireCompletion = s(s−1)·ξ₀(s) + 1`
  ("twice Riemann's ξ", nonzero at 0 and 1, reflection-symmetric,
  `Zeros/Completion/RiemannZeta.lean:27`); for primitive nonprincipal χ, entire completions equal
  canonical completions with `analyticOrderAt` multiplicities matching
  `χ.completedLFunction` (`Zeros/Completion/Dirichlet.lean`).
- **Quadratic factorization**: `ζ_K(s) = ζ(s)·L(s,χ_D)` for quadratic K
  (`TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`,
  `NumberTheory/LFunctions/DedekindZeta/Quadratic.lean`), residue formula
  `dedekindZeta_residue_eq_LFunction_one`
  (`NumberTheory/NumberField/Quadratic/DedekindZeta.lean:225`); **four-factor L-function
  products** with computed Laurent coefficients/residues at s=1 including the double-pole case
  (`NumberTheory/LSeries/Quadratic/Pair/Residue.lean`).
- **Chebotarev (abelian)**: `NumberField.Chebotarev.hasDirichletDensity_abelianFrobenius`
  (`NumberTheory/Chebotarev/Density/Abelian.lean:24`) and the effective form
  `primeCount_primesCongruent_sub_mul_logIntegral_isLittleO` (φ(m)⁻¹Li(x) + o(x/log x),
  `Density/PrimesCongruent.lean:29`).
- Neighbors: `LSeries/MeanSquare.lean` (abscissa (r+1)/2 from O(n^r) mean-square coefficient
  bounds — cusp-form weights), `LSeries/Theta/` (theta kernels, Mellin inversion, Gaussian),
  `NumberTheory/ModularForms/` (Atkin–Lehner, cusps, Dedekind η, Hecke), `EllipticDivisibility`,
  `PrimitivePrimeDivisors`, `SmoothNumbers`, `SumTwoSquares`, `HurwitzClassNumber`,
  `GeometryOfNumbers`, `SiegelsLemma.lean`, `DiophantineApproximation/`, `Markoff`, `Pisot`,
  `Padics`, `NewtonPolygon`, `LocalField/` (Herbrand, étale mass formula), `Transcendental/`.

### 1.2 Arithmetic geometry and the abc/Frey axis (AlgebraicGeometry/, 1.9k files)

- **Elliptic curves**: `AlgebraicGeometry/EllipticCurve/` — Tate's algorithm materialized as
  `WeierstrassCurve.algorithmicConductor`; minimal models (`GlobalMinimalModel`, `MinimalModel`),
  `HasseBound.lean`, canonical height (`CanonicalHeight/`), Mordell–Weil with regulator
  (`MordellWeil/Regulator/`), division polynomials, formal group, isogenies with Frobenius and
  the **finite-field zeta function** `W.zetaFunction : ℚ⟦X⟧`
  (`EllipticCurve/Isogeny/Frobenius/Zeta.lean:153`), Deuring normal form, Montgomery models,
  Galois cohomology descent.
- **BSD**: `WeierstrassCurve.BirchSwinnertonDyer E` and `TauCeti.BirchSwinnertonDyerConjecture`
  (`EllipticCurve/BirchSwinnertonDyer/Statement.lean:128`) — recorded, not proved (§2b), stated
  against arbitrary continuations `LSeries.IsContinuationOn` with proved analytic-order finiteness.
- **abc/Szpiro/Fermat axis** (proved implications between recorded conjectures):
  `TauCeti.AbcConjecture` (`NumberTheory/AbcConjecture.lean:98`) with proved equivalence of the
  sign-free, ℕ-only, and formal-conjectures-project (`ABC.abc`) formulations
  (`abcConjecture_iff_nat`, `abcConjecture_iff_forall_finite`); **abc ⇒ modified Szpiro ⇒ Szpiro**
  ratio bounds (`EllipticCurve/Szpiro.lean`, `AlgorithmicSzpiroConjecture:175` recorded);
  `FermatLastTheorem.asymptoticFermat` (`NumberTheory/AsymptoticFermat.lean:48`) — Mathlib's FLT
  statement (`Mathlib.NumberTheory.FLT.Basic`, itself unproved in Mathlib) implies asymptotic
  Fermat with `N = 3`; Frey curve machinery in `EllipticCurve/FreyCurve/`, `AbcQuality.lean`.
- **Beyond curves**: `AbelianVariety/` (Albanese, isogenies, End), `Curves/` (stable maps, nodal
  gluing, dual graphs, stable reduction — the Jacobian-challenge substrate), `PicardFunctor/`,
  `ModularCurve/`, adic spaces (`AdicSpace/` + `RingTheory/Huber/`), formal schemes, algebraic
  spaces, stacks, Chow groups, intersection numbers, finite étale Galois categories, blowups,
  `Sites/`, `Stack/`.
- **Class field theory**: `NumberTheory/ClassFieldTheory/` — class formations, Weil groups,
  Kummer and units layers, local/global existence, Brauer groups, `tateTheorem`
  (`ClassFieldTheory/Formation/Tate/Theorem.lean:122`).
- **Multiquadratic fields & genus theory** (roadmap): `NumberTheory/Multiquadratic/` — genus
  fields, candidate genus fields, square classes, ramification in towers, discriminant
  bookkeeping; the infinite-place/real-genus edge is future work (§2b).

### 1.3 Representation theory, Lie theory, quantum groups (1.7k + 0.05k files)

- **Burnside's p^a q^b theorem**: `isSololvable_of_card_eq_prime_pow_mul_prime_pow`
  (`RepresentationTheory/CharacterTable/Solvable.lean:220`) — via character tables, on top of
  `CharacterTable/` including **Dixon's algorithm** (`CharacterTable/Dixon/`, with explicit
  `Prime.lean` root selection, noncomputable by design).
- **Schur–Weyl duality** (double centralizer form):
  `centralizer_range_tensorPowerRep_asAlgebraHom_eq_range_permTensorActionAlgHom` and its swap
  (`RepresentationTheory/Symmetric/TensorAction/GeneralLinear.lean:67`).
- Neighbors: LS paths (`LSPath/` with subdivision theory), crystals (`Crystal/`), Harish-Chandra
  modules (`HarishChandra/`), representation rings, induction (Brauer), Frobenius groups,
  pseudoreflection groups, spin and SU₂ representations, projective reps, quiver reps, Galois
  descent/lattice, group cohomology incl. `Homological/GroupCohomology/DegreeThree.lean`.
- **Lie theory** (`Algebra/Lie/`, `RingTheory/`): PBW (`UniversalEnveloping/PBW/`, weighted
  variants for Heisenberg), Kostant isotypy, **the fermionic Fock/CAR module**: the trace-form
  Clifford algebra of `gl n` as a left-regular `gl n`-module
  (`Algebra/Lie/GeneralLinear/Fock.lean`: `TauCeti.glCliffordHom`, `carLieModule`, faithful when
  `#n ≠ 0` in K), its Casimir scalar `N(2N²−1)/4`
  (`CAR/Casimir.lean: representation_glCasimir_car_apply`), occupation spectrum, weight
  multiplicity/uniqueness; Heisenberg orbit methods (`Lie/Heisenberg/Orbit.lean`), divided-powers
  Heisenberg (`RingTheory/DividedPowers/Heisenberg.lean`), A-infinity algebras and transfer,
  DG categories, root systems incl. simply-connected D-type, Coxeter groups, Bruhat/Tits for SL₂.
- **Quantum groups**: `QuantumGroups/UqSl2/` — U_q(sl₂) Hopf algebra, PBW basis, Ore tower,
  complete reducibility over ℂ via Casimir (`CompleteReducibility.lean:146
  isSemisimpleModule_of_finiteDimensional`), representation ring, center, quantum trace, pivotal/
  triangular structures, classical specialization; `QuantumInteger/` (q-integers, q-binomial,
  q-Vandermonde, Chebyshev).
- **NoncommutativeGeometry/**: Fredholm modules, smooth torus algebra, universal differential
  calculus — Connes-style spectral triples scaffolding.

### 1.4 Topology, knots, low-dimensional topology (Topology 1.5k, AlgebraicTopology 868, KnotTheory 504, LowDimTopology 100)

- **Singular homology with Eilenberg–Steenrod axioms**
  (`AlgebraicTopology/Singular/HomologyPretheory.lean`, `EilenbergSteenrod.lean`,
  `Singular/Additivity.lean`) — homotopy, dimension, additivity, exactness verified; plus Dold–Kan,
  Eilenberg–Mac Lane, classifying spaces, Čech nerve, Serre classes, local coefficients, twisted
  cohomology with Lefschetz-style pairings (`Cohomology/Twisted/Relative.lean`), quasicategories,
  simplicial complexes.
- **KnotTheory/**: **Khovanov homology** end-to-end (`Khovanov/` 22 files: Frobenius algebra,
  normalized complex, quantum grading, TQFT-style merge/split, invariance transport, graded
  Euler characteristic = Jones polynomial `Khovanov/EulerCharacteristic.lean`,
  `EnhancedState.lean`); **HOMFLY existence and its Jones/Alexander specializations**
  (`Homfly/Existence.lean`, `Jones.lean`, `Alexander.lean`); skein-characterized **Hecke traces**
  (`Hecke.lean`); **Temperley–Lieb / Jones representation of the braid group**
  (`TemperleyLieb.lean`); Burau representation and its Alexander specialization
  (`Burau/`), Seifert matrices/surfaces, knot group, signature, Tristram–Levine, grid and PD
  codes, Gauss codes, mutation, slicing, cobordism, Markov theory.
- **LowDimTopology/** (Heegaard Floer roadmap): Heegaard splittings and genus, Maslov index,
  admissibility (weak/strong/Spin^c), hat differential on nice diagrams
  (`d² = 0` not yet proved there — §2b), bordered HF strands algebras and Type-D structures
  (`Bordered/`), Dehn surgery incl. cosmetic surgery statements, lens spaces, plumbing/
  lattice homology with Neumann moves, Seifert fibered spaces, JSJ/prime decomposition/
  geometrization **recorded as Props** (§2b), solid torus neighborhoods.
- **Geometry/**: hyperbolic 3-manifolds (virtual Haken/fibering recorded, Weeks manifold data),
  foliations and the Mizutani–Yazdi Euler-class-one line (`Manifold/Foliation/EulerClass.lean`),
  Cerf/Smale/Watanabe diffeomorphism statements (4D), Hodge theory directory, symplectic/
  contact/toric/diffeology/neuromanifolds, Riemannian geometry.

### 1.5 Analysis, PDE, matrix analysis (Analysis/, 3.5k files)

- **Complex function theory**: Riemann mapping existence (coordinated with mathlib PR #33505 via
  `mathlib-shims.json`; `Analysis/Complex/Conformal/RiemannMapping/Existence.lean`), **Carathéodory
  extension to Jordan boundaries**
  (`exists_homeomorph_closedBall_closure_of_isJordanCurve_frontier`,
  `Analysis/Complex/Conformal/Jordan/Approach.lean:217`), Koebe, Schwarz–Pick, hyperbolic
  geometry of the disc, Montel/normal families, Hurwitz, Rouché, reflection principle,
  removability; **the argument principle in winding-number form**
  (`TauCeti.Contour.argumentPrinciple_nullHomologous` + geometric reading
  `argumentPrinciple_windingNumber`, `Analysis/Complex/Conformal/ArgumentPrinciple.lean:89`) atop
  a 40-file contour-integration suite (`Analysis/Contour/`: homology Cauchy, residues, winding,
  sector cancellation, per-window splitting).
- **Matrix analysis / quantum information**: Sylvester's law of inertia for Hermitian matrices
  over any `RCLike` field (`Matrix.IsHermitian.signature_congr`,
  `Analysis/Matrix/HermitianSignature/Basic.lean:147`); continuity of eigenvalues
  (`Analysis/Matrix/Eigenvalues/`); **von Neumann entropy and Umegaki relative entropy** with
  Klein's inequality and **subadditivity** (`Matrix.vonNeumannEntropy`, `Matrix.relativeEntropy`,
  `Analysis/Matrix/Entropy.lean`); **Jensen's operator inequality for isometries**
  (Hansen–Pedersen compression inequality `Matrix.conjTranspose_mul_cfc_mul_le_cfc_...`,
  `Analysis/Matrix/OperatorJensen.lean` — proved *behind* strong subadditivity, which itself is
  not yet stated); C*-algebras (GNS, character-space measures, conditional expectations,
  multiplier algebras, exponential/functional calculus), von Neumann bicommutant/density
  (`Analysis/VonNeumannAlgebra/`).
- **PDE/ODE**: Yamabe program (`Analysis/PDE/Yamabe/` incl. bubble analysis), **Seiberg–Witten
  equations** (`Analysis/PDE/SeibergWitten/` 15 files: Dirac symbols, charge conjugation,
  curvature comparison, zero-set localization, deformation symbols), heat kernels, Harnack,
  maximum principles, Fredholm alternative, Green functions, Schrödinger, vortex, Hopf–Lax;
  ODE: Lyapunov–Perron, exponential dichotomy, Gronwall, Dyson series, Carathéodory;
  Sobolev (`Sobolev/D1p0/`), distributions, hyperfunctions, pseudodifferential operators,
  Fourier analysis incl. Hardy spaces and Hankel operators (`Analysis/Fourier/Hardy/`:
  Brown–Halmos, Coburn, boundary uniqueness), Mellin transform/inversion.
- **Optimal transport** (`MeasureTheory/OptimalTransport/`, ~30 subdirs): Brenier
  (`Brenier.lean`), Monge/Kantorovich duality, cyclic monotonicity (CTransform), disintegration,
  **Gromov–Wasserstein** and Gromov–Prokhorov, entropic regularization, multi-marginal,
  polar factorization, Benamou-style continuity equations, Wasserstein spaces.
- Neighbors: Hofer's lemma generalized (`Analysis/Hofer.lean` extends `hofer` in Mathlib),
  convex analysis, quaternion/Cayley–Dickson, completely monotone functions, semigroups,
  gradient flows, Fredholm theory, Green's identities.

### 1.6 Computability (66 files — a whole recursion-theory island)

**Friedberg–Muchnik theorem** verified by an explicit finite-injury construction:
`friedberg_muchnik` (`Computability/FriedbergMuchnik/Basic.lean:364`) exhibits RE sets A, B of
incomparable Turing degree, with `degree_friedbergMuchnikSetA_mem_Ioo` placing the degree strictly
between `0` and `0'`; a general **priority-method framework** underneath (`Computability/Priority/`:
injury monitoring, preservation, initialization, records) plus Sacks splitting, single-oracle/
staged constructions, Turing degrees/jump (`TuringDegree.lean`), Friedberg enumerations,
inseparability, automatic sequences (DFAO), `FriedbergMuchnik` example files under `Examples/`.
Mathlib has bare Turing machines; **nothing of priority-argument recursion theory exists in
mathlib** — this is the single most distinctive donor area w.r.t. mathlib.

### 1.7 Logic, models, sets, order

ModelTheory: Scott sentences/isomorphism, back-and-forth, model existence, interpolation,
infinitary logic, **counting theory** (`Counting/`: Morley, Vaught — with `VaughtConjecture`
recorded `Counting/Vaught.lean:156`), algebraic model theory (groups, rings, ordered rings),
relational configurations, complexity of structures. SetTheory/Descriptive: Borel colorings of
graphs on Cantor space, smoothness of closed equivalence relations, analytic normal forms,
well-founded trees. Logic: basic equivalence/function/relation infrastructure.

### 1.8 Probability, dynamics, information

- Probability (1,111 files): Brownian motion, De Finetti/exchangeability, concentration,
  Markov chains, large deviations, kernels, finance, ergodic theory — and a full **free
  probability** development (`Probability/FreeProbability/`: semicircular and circular elements,
  free cumulants, free central limit theorem, free Poisson, free products, star-independence,
  laws/weak closure).
- Dynamics: **Arnold's cat map** with its full characteristic-polynomial data
  (`Dynamics/CatMap.lean: catMap`, `det_one_sub_catMap_pow_neg`), feeding **orbit zeta functions
  over Novikov series** (`RingTheory/NovikovSeries/OrbitZeta/Basic.lean`:
  `orbitLog`, `orbitZeta`, Euler product identity `exp L = ∏ (1 − r e^γ)^m` with Lefschetz signs
  — a dynamical/Lefschetz zeta calculus), Birkhoff sums, flows (Lyapunov functions, closed
  orbits, variational), ergodic actions.
- InformationTheory: **Kullback–Leibler divergence** (`KullbackLeibler/`: Pinsker, chain rule,
  variational, convexity, projection); **coding theory** (`Coding/`: MacWilliams identities,
  Krawtchouk polynomials, weight enumerators, hexacode/tetracode, ternary Golay, Type II codes
  `TwoPowTypeII.lean`, parity/generator structures).

## 2. Depth & terminal points

### (a) `sorry` inventory

`rg -n "sorry"` over `TauCeti/` finds **zero proof `sorry`s**. All eight files with matches contain
the word only inside docstrings — and instructively, three document *other* projects' gaps:
`RingTheory/Huber/RingOfDefinition.lean:110` ("AINTLIB's proof is a `sorry`, whose note blames
missing…"), `RingTheory/Huber/ClosedSubmodule.lean:81` (a lemma "whose body in that development
is `sorry`"), `AlgebraicGeometry/AdicSpace/SpvOfIdeal/Spectral.lean:118` ("which is a `sorry`
there"). CI enforces the zero: `AGENTS.md:44–46` (no `sorry`, no axioms beyond
propext/Classical.choice/Quot.sound, no `native_decide`), audited by `scripts/Axioms.lean`
(declaration-ownership + transitive axiom scan) and `lake test`; `formalization.yaml:55–58`
records `sorry_count: 0`.

### (b) Stated-not-proved / conjectural (the recorded-Prop practice)

36 named `Prop`s record big theorems/conjectures without proof (pattern: `def X : Prop := …` with
docstring "recorded, not proved"); 16 further disclosures of the shape "not proved here" appear in
docstrings. Complete list of recorded Props with locators (grouped):

- 3-manifold topology: `GeometrizationConjecture` (`LowDimTopology/Geometrization.lean:144`),
  `JSJTheorem` (`LowDimTopology/JSJDecomposition.lean:248`), `KneserPrimeDecompositionTheorem:79`
  and `MilnorPrimeDecompositionTheorem:91` (`LowDimTopology/PrimeDecomposition.lean`),
  `RankGenusConjecture:84`, `LiRankGenusTheorem:138` (`LowDimTopology/Heegaard/RankGenus.lean`),
  `CosmeticSurgeryConjecture:250`, `NiWuCosmeticSurgeryTheorem:267`,
  `HanselmanCosmeticSurgeryTheorem:290`, `MathieuChirallyCosmeticTheorem:316`
  (`LowDimTopology/DehnSurgery/Cosmetic.lean`), `KronheimerMrowkaPropertyPTheorem:211`,
  `GabaiPropertyRTheorem:223` (`DehnSurgery/NontrivialKnot.lean`), `GabaiZeroSurgeryGenusTheorem`
  (`DehnSurgery/ZeroSurgeryGenus.lean:80`), `AkbulutKirbyConjecture:89`, `YasuiTheorem:115`
  (`DehnSurgery/AkbulutKirby.lean`).
- Knots/slicing: `LevineHomologyConcordanceTheorem` (`KnotTheory/HomologyConcordance.lean:74`),
  `KirkLivingstonMutationTheorem` (`KnotTheory/Mutation.lean:698`), `FreedmanSliceTheorem`
  (`KnotTheory/Slice/Freedman.lean:66`), `PiccirilloShakeGenusTheorem`
  (`KnotTheory/Slice/ShakeGenus.lean:604`).
- 4D/geometric group phenomena: `AnnulusConjecture` (`Geometry/Manifold/LocallyFlat/Annulus.lean:105`),
  `RubermanSternTheorem` (`Geometry/Manifold/ConnectedSum/FakeProjective.lean:85`),
  `EulerClassOneConjecture:346`, `YazdiEulerClassOneTheorem:387`
  (`Geometry/Manifold/Foliation/EulerClass.lean`), `VirtualHakenConjecture:65`,
  `VirtualFiberingConjecture:62`, `GabaiMeyerhoffMilleyTheorem:77`
  (`Geometry/Manifold/Riemannian/Hyperbolic/`), `CerfTheorem` (`Geometry/Diffeomorphism/Cerf.lean:77`),
  `SmaleConjecture` (`Geometry/Diffeomorphism/Smale.lean:46`), `WatanabeTheorem`
  (`Geometry/Diffeomorphism/Disc.lean:77`), Zeeman's theorem
  (`AlgebraicTopology/SimplicialComplex/Zeeman.lean`), triangulation
  (`Topology/TriangulationConjecture.lean`).
- Number theory/arithmetic geometry: `TauCeti.AbcConjecture` (`NumberTheory/AbcConjecture.lean:98`),
  `WeierstrassCurve.BirchSwinnertonDyerConjecture`
  (`AlgebraicGeometry/EllipticCurve/BirchSwinnertonDyer/Statement.lean:128`),
  `AlgorithmicSzpiroConjecture:155` / `AlgorithmicModifiedSzpiroConjecture:175`
  (`EllipticCurve/Szpiro.lean`), `LittlewoodConjecture`
  (`NumberTheory/DiophantineApproximation/BadlyApproximable.lean:248`), asymptotic Fermat as a
  def (`NumberTheory/AsymptoticFermat.lean`).
- Logic: `VaughtConjecture:156`, `CardinalVaughtConjecture:168` (`ModelTheory/Counting/Vaught.lean`).

Partial-disclosure hotspots (proved around, missing core step): Heegaard `d ∘ d = 0` on nice
diagrams (`LowDimTopology/Heegaard/HatDifferential.lean:44`); lattice homology invariance under
Neumann moves (`LowDimTopology/Plumbing/BlowUp.lean:56`); Herbrand's theorem upper/lower
compatibility (`NumberTheory/LocalField/Herbrand/Basic.lean:43`); p-adic logarithm homomorphism
property (`NumberTheory/LocalField/ExpLog.lean:29`); étale mass formula identification
(`NumberTheory/LocalField/EtaleMassFormula/Mass.lean:22`); genus theory at the infinite place
(`NumberTheory/Multiquadratic/GenusField.lean:58`, `CandidateGenusField/Degree.lean:28`,
`GaloisGroup.lean:28`, `Relative/Degree.lean:31` — "identification with Cl/Cl² remains future
work"); quadratic ramified-prime lower bound
(`Multiquadratic/Quadratic/RamifiedPrime/Product.lean:31`).

**Proved implications between recorded Props** (the corpus' conditional layer):
abc ⇒ modified Szpiro (`EllipticCurve/Szpiro.lean`), FLT (Mathlib's recorded statement) ⇒
asymptotic Fermat, BSD-fragment equivalences in rank 0/leading-coefficient forms
(`BirchSwinnertonDyer/Statement.lean:38–46`), abc formulation equivalences
(`AbcConjecture.lean:98–110`).

### (c) Proved-but-not-generalized (frozen choices that could be parameters)

- `Dynamics/CatMap.lean`: everything frozen at `P = !![2,1;1,1]` (genus 1) although the engine
  (`LinearAlgebra/Matrix/Charpoly/Symplectic.lean`) is general in genus — the Lefschetz-zeta data
  of higher-genus or other hyperbolic toral automorphisms is not extracted.
- `Algebra/Lie/GeneralLinear/CAR/`: faithfulness of the CAR module carries the frozen hypothesis
  `(Fintype.card n : K) ≠ 0` (`Fock.lean`, `glCliffordHom_injective`); Casimir scalar frozen at
  the trace form (Killing-form sibling handled separately); only `gl n`, not reductive
  generalizations.
- `Analysis/Matrix/OperatorJensen.lean`: compression inequality proved for isometries V
  (rectangular, `VᴴV = 1`) and operator-concave f — coisometries, general contractions, and the
  SSA corollary itself are not extracted.
- `Analysis/Matrix/Entropy.lean`: bipartite subadditivity only; n-partite/strong subadditivity
  not stated (the machinery — Klein + partial trace + regularization t → 0 — is in place).
- `NumberTheory/LSeries/Nonvanishing.lean`: the 3-4-1 scheme with the frozen trigonometric
  polynomial 3+4cosθ+cos2θ and Dirichlet-character series; not parametrized over the general
  Landau-style nonvanishing lemmas zeta23-type zero-density arguments would want.
- `LSeries/Quadratic/Pair/`: exactly two nonprincipal characters χ, ψ — no k-factor products.
- `RepresentationTheory/Symmetric/TensorAction/GeneralLinear.lean:35`: Schur–Weyl with
  hypothesis `(d! : k) ≠ 0` — positive-characteristic Schur–Weyl (modular) absent.
- `NumberTheory/NumberField/Quadratic/DedekindZeta.lean`: residue computed in the quadratic
  tower only; general number-field residue appears only as `dedekindZeta_residue K` fact passed
  through Mertens.
- `Geometry/Manifold/Riemannian/Hyperbolic/Weeks.lean`: one manifold's data frozen.

### (d) Isolated results with no neighbors (or none outside their roadmap)

- **Computability island**: Friedberg–Muchnik + Sacks + priority framework + Turing degrees form
  a self-contained recursion-theory library; nothing else in TauCeti consumes it (no complexity
  theory, no Turing-machine *time* analysis); mathlib's `Computability` is untouched by it.
- **Novikov orbit zeta** (`RingTheory/NovikovSeries/OrbitZeta/`): a general dynamical-zeta/Euler-
  product calculus whose only in-library customer is the genus-1 cat map file.
- **CAR/Fock/Kostant isotypy stack**: deep, internally coherent, no downstream consumer (no
  mathematical-physics or QFT development yet in the library).
- **InformationTheory/Coding** (MacWilliams/Krawtchouk/Type II codes) sits next to
  `NumberTheory/ModularForms` + theta functions with **no lattice/theta-series bridge** — the
  classic Eichler-type-II-codes ↔ modular forms connection is an in-corpus empty zone.
- `ModelTheory/Counting/` (Morley/Vaught): bounded-rank counting levels are developed, but no
  model-theoretic → group-theoretic applications (e.g. to the finite group theory area
  `GroupTheory/SpecificGroups/CFSG/`, which itself records sporadic-group data).
- `Analysis/Matrix/HermitianSignature/Basic.lean`: proven for its own quadratic-form purposes;
  no spectral zero-density or variational consumer yet (the zeta23-style use of inertia has no
  analogue here).
- `Condensed/` (one file, `Light`): a stub; `CategoryTheory/` (675 files) has no condensed-
  mathematics consumer despite both existing.

## 3. External dependencies

### mathlib (the only real dependency)

34,726 `import Mathlib.*` lines (rg census), 0 non-Mathlib/non-Init external imports beyond
`Batteries`/`Std` (3+2+2 lines) and the doc-only `SubVerso` in `web/examples/`. Top imports:
tactics (`Mathlib.Tactic.LinearCombination` ×300, `Ring` ×173, `Linarith` ×167, `FinCases` ×93,
`Module` ×77) then `Mathlib.Analysis.Complex.Basic` ×139, `Mathlib.Analysis.InnerProductSpace.PiL2`
×109, `Mathlib.LinearAlgebra.Dual.Lemmas` ×93, `Mathlib.Analysis.Normed.Module.FiniteDimension`
×88, `Mathlib.Algebra.Homology.ShortComplex.ModuleCat` ×74. Heavy reuse of Mathlib's homological
algebra (`ShortComplex`), L-series (`Mathlib.NumberTheory.LSeries.*`: `WeakFEPair.Λ` residues are
explicitly Loeffler's, credited in `LSeries/AbstractFuncEq.lean`), FLT statement
(`Mathlib.NumberTheory.FLT.Basic`), `hofer` lemma (`Analysis/Hofer.lean` generalizes it).

### Vendored/coordinated content (shims)

`TauCeti/mathlib-shims.json` + `docs/mathlib-shim-registry.md`: 16 shim entries where TauCeti
holds material that mathlib is simultaneously landing (e.g. Riemann-mapping existence coordinated
with mathlib4#33505: `Complex.exists_bijOn_unitBall_map_eq_zero`, with a `landing_sentinel`), or
where TauCeti vendors open-mathlib-PR content with attribution rather than waiting — the registry
is the exact forward-interface for any mathlib↔tauceti bridge planning.

### Classical sources cited (module docstrings, "References" fields)

Davenport *MT* §11–12 (L-function completions), Montgomery–Vaughan §10.2 (Dirichlet completions),
Neukirch VII (Mellin principle, Chebotarev), Sharifi 7.2.2 (Chebotarev), Rosen (Mertens over
number fields), Friedberg (1957)/Muchnik (1956) (priority theorem), Hansen–Pedersen (operator
Jensen), Ebeling *Lattices and Codes* (signature/inertia), Oesterlé Bourbaki 694 (asymptotic
Fermat), plus per-roadmap literature. **Nothing mathematical is assumed from outside**: every
cited classical theorem is either re-proved or explicitly recorded as an unproved `Prop` (§2b).

## 4. Bridging hooks

Donors = proved here, absent/weaker elsewhere; consumers = what TauCeti leans on. Counterpart
locators for the other corpora are from `research/survey/anthropics.md` (same workspace).

### To zeta23 (anthropics) — the densest bidirectional zone

- **Overlapping, independently built machinery** (Phase-2 unification targets):
  TauCeti `zetaEntireCompletion` (`Zeros/Completion/RiemannZeta.lean:27`, = 2ξ on Mathlib's
  `completedRiemannZeta₀`) vs zeta23's ξ/ξ′ stack (`ChallengeDeps/XiPrime.lean:16`); TauCeti's
  `analyticOrderAt` multiplicity comparisons for primitive Dirichlet completions
  (`Zeros/Completion/Dirichlet.lean`) vs zeta23's `zeroMult` counting machinery; TauCeti's
  `TauCeti.LSeries.landau` (`LSeries/Landau.lean:296`) vs zeta23's `Zeta23/WeilEF/Landau.lean`;
  TauCeti's `Matrix.IsHermitian.signature_congr` (Sylvester inertia, RCLike;
  `Analysis/Matrix/HermitianSignature/Basic.lean:147`) vs zeta23's
  `RHLinalg.Sylvester`/`Inertia`/`PosIndex` — four near-duplicate developments across the two
  corpora, each pair stated over slightly different bases (Mathlib quadratic forms vs from-scratch
  Hermitian forms). A shared "zeros of completed L-functions with multiplicities" API is the
  obvious first bridge.
- **TauCeti donors zeta23 lacks**: Riemann–von Mangoldt is absent here too, but TauCeti has the
  **argument principle in homology/winding form**
  (`TauCeti.Contour.argumentPrinciple_nullHomologous`, `ArgumentPrinciple.lean`) — exactly the
  entry tool zeta23 had to build privately for its RvM; 3-4-1 nonvanishing on Re s = 1
  (`LSeries/Nonvanishing.lean`) — the classical precursor to zero-density, absent from zeta23;
  Wiener–Ikehara and Newman Tauberian (`LSeries/WienerIkehara/`, `LSeries/Newman/`);
  Mertens/Chebyshev for number fields (`LFunctions/Mertens.lean`) vs zeta23's ℚ-only
  `FromPNTPlus` port; Chebotarev density.
- **zeta23 donors TauCeti lacks**: the Montgomery–Vaughan Hilbert inequality, rank–trace
  inequality (`Zeta23/LinAlg/RankTrace.lean:163`), von Neumann trace inequality, zero-density
  statements themselves (TauCeti has zero *multiplicity* bookkeeping but no N(T,2T) counting and
  no density theorem), the PairCeiling optimality barrier. Conversely TauCeti's inertia/signature
  and continuous eigenvalue calculus (`Analysis/Matrix/Eigenvalues/`) could restate
  `rank_trace_ineq` over `RCLike`.
- **Candidate empty zone (Phase 3 fodder)**: a *zero-density theorem for ζ_K/Dirichlet L* combining
  zeta23's rank–trace + Gram-matrix method with TauCeti's completions/`analyticOrderAt` +
  argument principle + Landau — neither side alone has both halves (zeta23: no argument principle/
  contour suite; TauCeti: no density method).

### To eth (anthropics)

- **Representation-theoretic engine match**: eth's paper Appendix B operators `a[r]`, `Q_s(a,b)`
  on ℚ[t₁,t₂,…] ("Boson"/Heisenberg algebra; zeta23 survey §4) vs TauCeti's Heisenberg apparatus:
  `Algebra/Lie/Heisenberg/Orbit.lean`, `RingTheory/DividedPowers/Heisenberg.lean`,
  `UniversalEnveloping/PBW/Weighted/Heisenberg.lean`, and the **fermionic** counterpart
  (`Algebra/Lie/GeneralLinear/Fock.lean`, CAR modules with occupation spectrum and Casimir
  `N(2N²−1)/4`). eth proves its lemmaQ/lemmaDual (`AppHalfPieces`) identities from scratch; a
  bridge could re-derive the σ(p,q) eight-square identity (`Eight.signs`) as a statement about
  TauCeti's Clifford/exterior-algebra models (CAR ↔ exterior algebra via
  `CliffordAlgebra.equivExterior`), giving the first complexity-theory ↔ representation-theory
  link.
- **Machine models**: TauCeti's Computability area is *degree-theoretic* (Turing reducibility,
  `TuringReducible`, jump) with no time bounds; eth is purely *time*-theoretic (`TM2OutputsInTime`).
  A "time-bounded degrees" statement (e.g. if 3-SAT ∈ DTIME(2^{o(n)}) then specific degree
  collapses) needs both sides and exists in neither — a genuine empty zone, though high-effort.
- **Second-moment/variance**: eth's `stVar` (Var ≤ 4PU over random groupings) vs TauCeti
  `Probability/Concentration`, `LargeDeviations` — shared probabilistic lemma layer possible.

### To 3sum-apsp (anthropics)

- Both formalize matrix-multiplication-adjacent algebra: 3sum-apsp's trilinear `Term`/`Full`/
  `Pruned` machinery and `Lemma_6` (border-rank identity (1), `PaperStatements.lean:618`;
  `Eq_1` :603 is Strassen's 2×2 seven-product identity) [erratum 2026-11-09, H/QA per the
  anthropics.md Eq_1→Lemma_6 correction] vs TauCeti's `Multilinear/`,
  `PiTensorProduct/`, `CategoryTheory/Monoidal/TensorAlgebra/`. TauCeti has **no tensor-rank /
  matrix-multiplication-exponent theory** (no Strassen, no rank) — it is a consumer, not a
  donor. Conversely TauCeti's `NumberTheory/PrimeCounting`/Bertrand-free prime bounds could
  replace 3sum-apsp's bespoke `exists_le_card_primesInRange`.
- `InformationTheory/KullbackLeibler` + `Analysis/Matrix/Entropy` (Klein, subadditivity) vs
  3sum-apsp's entropy-style pruning (`Sec1.MonoConvolution`, thin-product data structures):
  an entropy-lower-bound hook for the thin-product problem exists in neither corpus.

### To mathlib (via encore-mathlib checkout)

- **Donors (TauCeti-only at mathlib scale)**: the whole Computability/priority island
  (`friedberg_muchnik`); prime ideal theorem + number-field Mertens (`primeIdealTheorem`,
  `LFunctions/Mertens.lean`); Chebotarev (abelian + effective); Landau's theorem for Dirichlet
  series; Wiener–Ikehara/Newman Tauberian; four-factor L-product residues; Khovanov homology;
  HOMFLY/Hecke/Temperley–Lieb; bordered strands algebras; Seiberg–Witten symbols; Yamabe; Brenier/
  optimal transport incl. Gromov–Wasserstein; von Neumann entropy + Klein + operator Jensen
  (mathlib's `Analysis.Matrix` order/CFC exists but no quantum entropy); U_q(sl₂); PBW/Kostant/
  CAR; Burnside p^a q^b via character tables; Schur–Weyl; Dixon's algorithm; free probability;
  KL divergence; MacWilliams/Krawtchouk coding theory; model theory (Scott, Vaught, counting);
  descriptive set theory; Eilenberg–Steenrod singular homology verification. The
  `mathlib-shims.json` registry marks which of these are already in coordination.
- **Consumers**: Mathlib's `LSeries`/`WeakFEPair`, `NumberTheory.FLT.Basic` (statement-only),
  `hofer`, `ShortComplex` homological algebra, CFC (`ContinuousFunctionalCalculus`) for operator
  Jensen — TauCeti tracks mathlib `master` hourly, so these are moving targets by design.

### To openai-math (the discovery catalog)

- **BSD/Selmer**: openai-math results 002 ff. prove full BSD from Selmer corank hypotheses;
  TauCeti holds the formal BSD statement layer (`BirchSwinnertonDyer/Statement.lean`), Galois
  cohomology (`EllipticCurve/GaloisCohomology/`), Mordell–Weil/regulator. Any formalization-
  feeding bridge would run TauCeti's statement + openai-math's new theorems.
- **C*-counterexamples** (openai-math: Kaplansky direct finiteness/quasitrace, Naimark) meet
  TauCeti's `Analysis/CStarAlgebra/` + `Analysis/VonNeumannAlgebra/` (bicommutant, GNS,
  conditional expectation) — the formal substrate for those discoveries exists here.
- **Free probability / random matrices** (openai-math has Anderson-model/spin-chain physics
  results) meets `Probability/FreeProbability/` (semicircular, circular, free CLT).
- **Euler-class-one / Yazdi** (openai-math-adjacent hyperbolic geometry) is *already recorded*
  as a Prop in TauCeti (`Geometry/Manifold/Foliation/EulerClass.lean:387`) — an explicit
  statement-level handshake.
- Caveat: openai-math is a paper catalog (PDFs), not Lean; bridges are content-level, not API-level.

### Within-corpus empty zones worth noting for Phase 2

Type-II codes ↔ theta series/modular forms (both sides present, no bridge); orbit zeta ↔
Lefschetz fixed-point theory (Novikov machinery present, topological Lefschetz absent);
CAR/Fock ↔ no QFT; free probability ↔ random matrix eigenvalue flow (eigenvalue continuity
present, no random-matrix ensembles); Vaught counting ↔ descriptive set theory (both present,
no Morley–Vaught bridge).

## 5. Sources consulted

- `AGENTS.md` (rules: no-sorry/axiom CI, roadmap gating, module guards, bump policy)
- `README.md` (three-repo structure, roadmaps list, mathlib relationship, build/review process)
- `COORDINATION.md` (agent contract; no mathematical content)
- `formalization.yaml` (self-description, sorry_count 0, axiom allowlist, sources = roadmaps)
- `lean-toolchain`, `lake-manifest.json`, `lakefile.toml` (pins), `bors.toml`, `TauCeti.lean`
- `docs/mathlib-shim-registry.md`, `TauCeti/mathlib-shims.json` (16 shim entries, PR #33505)
- `web/examples/Examples.lean` (curated showcase: burnside, caratheodory, schur_weyl)
- Source tree censuses: per-area `find` file counts; `rg` theorem/def counts; import census
  (34,726 Mathlib imports); `rg "sorry"` full-library; `rg "recorded, not proved|stated, not
  proved"`; `def .*Conjecture|Theorem : Prop` enumeration (36)
- Files read in full or in header/docstring depth:
  `NumberTheory/`: `LSeries/Landau.lean`, `LSeries/MeanSquare.lean`, `LSeries/AbstractFuncEq.lean`,
  `LSeries/Nonvanishing.lean`, `LFunctions/Mertens.lean`,
  `LFunctions/Zeros/Completion/{Basic,RiemannZeta,Dirichlet}.lean`,
  `LFunctions/DedekindZeta/Quadratic.lean` (header), `LSeries/Quadratic/Pair/Residue.lean`
  (header), `ArithmeticDirichletSeries/Prime/PrimeIdealTheorem.lean` (locator),
  `AbcConjecture.lean`, `AsymptoticFermat.lean`, `Chebotarev/Density/{Abelian,PrimesCongruent,ZetaSum}.lean`
  (headers/locators)
  `AlgebraicGeometry/EllipticCurve/`: `BirchSwinnertonDyer/Statement.lean`, `Szpiro.lean`,
  `Isogeny/Frobenius/Zeta.lean` (locator)
  `Analysis/`: `Matrix/HermitianSignature/Basic.lean`, `Matrix/Entropy.lean`,
  `Matrix/OperatorJensen.lean`, `Complex/Conformal/ArgumentPrinciple.lean`, `Hofer.lean`
  `Algebra/Lie/`: `GeneralLinear/Fock.lean`, `GeneralLinear/CAR/Casimir.lean`
  `Computability/FriedbergMuchnik/Basic.lean` (lines 1–45, 360–380)
  `Dynamics/CatMap.lean`, `RingTheory/NovikovSeries/OrbitZeta/Basic.lean`
  `RepresentationTheory/CharacterTable/Solvable.lean:220`,
  `RepresentationTheory/Symmetric/TensorAction/GeneralLinear.lean:35–67`,
  `QuantumGroups/UqSl2/CompleteReducibility.lean` (locators)
  Directory listings for all 34 areas (selection documented above)
- `scripts/Axioms.lean` (audit mechanism), `scripts/` listing
