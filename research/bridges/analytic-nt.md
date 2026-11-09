# Phase 2 bridge map v1 — Analytic number theory cluster

Lane R5 ("ant-bridge"). Scope: zeta and L-function theory — zero counting, explicit formulas,
zero-free regions, zero-density, prime-counting consequences. Inputs: Phase-1 survey
`research/survey/anthropics.md` (verified), primary-source reads in all four sibling corpora
(paths below; all rg/read, no builds). Other lanes' surveys (`tauceti.md`, `openai-math.md`,
`mathlib-frontier.md`) were not present at time of writing; every load-bearing claim below was
verified against the primary sources directly and is marked **[VERIFIED]** or **[HYPOTHESIS]**.

Corpus roots (read-only): `anthropics_formal-math/` (zeta23), `encore-mathlib/repo/mathlib4/`
("mathlib"), `tauceti/`, `openai-math/`.

---

## §0 Cluster snapshot

Four corpora, four disjoint zero/prime-side specializations of the same classical L-function
machine, all ultimately sitting on mathlib:

| Capability | mathlib | zeta23 (anthropics) | openai-math | tauceti |
|---|---|---|---|---|
| ζ / L(s,χ) API | `riemannZeta`, `DirichletCharacter.LFunction`, `completedRiemannZeta₀`, `completedLFunction` [V] | consumer | consumer | consumer (own `LSeries` layer) |
| Abstract functional equation | `WeakFEPair` / `IsStrongFEPair` (`Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean`); instances for Hurwitz (`HurwitzZetaEven.lean:256 hurwitzEvenFEPair`), Dirichlet, modular forms [V] | — | **extends** it: `SevenEighths.ThetaProduct.product/rescale`, `HeckeTheta.finitePair` (in `lean/ComparatorChallenges/HeckeSevenEighths.lean`) [V] | **extends** it: `TauCeti/NumberTheory/LSeries/FEPairWithLevel.lean` (`toFEPairWithLevel`/`toWeakFEPair`) [V] |
| Zero-set infrastructure | `riemannZetaZeros` discrete/closed, compact ⇒ finite (`Mathlib/NumberTheory/LSeries/ZetaZeros.lean:33–68`); no counting function [V] | `ZeroConfig` (carrier, mult, window, N/Nd/N0/N0star/N0s), `zerosIn`, `analyticOrderAt` multiplicities [V] | — | — |
| Zero-free results | ζ, L ≠ 0 on Re ≥ 1 (`LSeries/Nonvanishing.lean:391,404,417` — Hadamard–de la Vallée Poussin) [V] | none needed/none proved | **quasi-RH**: ζ, all Dirichlet L ≠ 0 for Re > 7/8; finite-order Hecke L over ℚ(√−3) same; uniform Siegel exclusion (1−β)·log q ≥ c (`lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:7`, `DirichletSevenEighths.lean:9`, `HeckeSevenEighths.lean`, `SiegelZeros.lean:8 exists_absolute_real_zero_gap`) [erratum 2026-11-09, H/QA: v1 cited :6, which is the `namespace WeightedTorusJets` line; the theorem is at :8] [V] | Artin L-series ≠ 0 on Re s = 1 via 3-4-1 criterion (`Chebotarev/GaloisCharacter/Nonvanishing.lean`, `MonoidHom.LSeries_galoisCharacterWeight_ne_zero`) [V] |
| Zero counting N(T) | none [V] | RvM + Backlund for ζ (`Zeta23/RvM/Statement.lean:20`, `RvM/Backlund.lean:12 backlund_horizontal`), χ-versions (`ThmE/RvMChi.lean`, `BacklundChi.lean`), ξ′ (`XiPrime/Final.lean:90 xiDerivZeros₀_rvm`) [V] | none | none |
| Explicit formula | none | Weil EF for ζ (`Zeta23/WeilEF/Main.lean:270 EF_lit_zetaZeroConfig`), for L(s,χ) (`ThmE/EFLitChi.lean`), for ξ′/ξ (`XiPrime/ExplicitFormula/`) [V] | log-derivative Euler series for Hecke L (`OAI/NumberTheory/DirichletL/Hecke/PrimeDyadic.lean:22–24 series, series_eq_tsum`) [V] | log-derivative boundary continuity (`LSeries/WienerIkehara/BoundaryGrowth.lean`) [V] |
| Zero-density / proportions | none | Theorems A–D for ζ, E for every primitive χ (2/3, 1/2, 3/4, 2−1/c₁*≈0.6725, (3−1/c₁*)/2≈0.83625); ξ′: 85.838%/92.919% flat, 86.864%/93.432% quartic (`Challenge.lean:131–229`, `Challenge/XiPrime.lean:67–105`) [V] | none | none |
| Prime-counting / Tauberian | `WienerIkehara.lean:693,700 tendsto_sum_range_div/tendsto_sum_div` (**no consumer**); Chebyshev ψ/θ bounds (`Mathlib/NumberTheory/Chebyshev.lean`) [V] | Chebyshev–Mertens incl. Λ² moments (`Zeta23.Cheb.chebyshevMertens`, `cheb2a/cheb2b`) [V] | Jacobsthal/Erdős-970 chain consuming Siegel bound (`OAI/NumberTheory/Jacobsthal/Estimates/PrimitiveTransfer.lean` obtains `ln.dirichletRealZeroBound_proof`) [V] | **Chebotarev PNT**: ψ_C ~ (|C|/|G|)x (`Chebotarev/PrimeCounting/Chebotarev.lean:210 frobeniusPsi_asymptotic`); own Wiener–Ikehara/Wiener–ln/Newman (`LSeries/WienerIkehara/Variants.lean:60,120,135`) [V] |
| L-functions beyond Dirichlet | `ModularForm.L` / `CuspForm.L`, entire, FE via `CuspForm.isStrongFEPair` (`Mathlib/NumberTheory/ModularForms/LFunction.lean`) [V] | — | finite-order Hecke L over ℚ(√−3) (`SevenEighths.HeckeFamily.LFunction`; 182-file proof tree `OAI/NumberTheory/DirichletL/Hecke/`) [V] | Dedekind zeta + Artin/Galois-character L-series (`NumberTheory/NumberField/DedekindZeta.lean`, `galoisCharacterWeight`) [V] |

Headline asymmetry [VERIFIED]: **zeta23 owns the zero side (counting, EF, density), openai-math
owns the zero-free side (quasi-RH, Siegel), tauceti owns the prime side for number fields
(Chebotarev), mathlib owns the shared substrate but has neither PNT nor zero counting.** No
corpus has more than one of the three sides in strength.

---

## §1 Intersection table — shared/analogous objects under different names

| Concept | mathlib | zeta23 | openai-math | tauceti |
|---|---|---|---|---|
| Nontrivial zeros, windowed | `riemannZetaZeros` (= all zeros, incl. trivial); `IsCompact.inter_riemannZetaZeros_finite` | `zerosIn T₁ T₂` (strip + window); `ZeroConfig.finite_window` | — | — |
| Multiplicity | `analyticOrderAt` (`Analysis/Analytic/Order`) used raw | `zeroMult := (analyticOrderAt riemannZeta ρ).toNat` (`ChallengeDeps.lean:46`); `ZeroConfig.mult` | — | — |
| Completed L | `completedRiemannZeta₀`, `completedLFunction χ` (`LSeries/DirichletContinuation.lean:231`), `ModularForm.Λ hk f` | `xi s := s(s−1)/2·completedRiemannZeta₀ s + 1/2` (`Challenge/XiPrime.lean:31`) | `(WeakFEPair).Λ` of theta pairs (`latticeL`) | `LSeries/CompletedRiemannZeta.lean` |
| FE-pair abstraction | `WeakFEPair`/`IsStrongFEPair` | — (own concrete FE) | same names (built on mathlib's) + combinators | `FEPairWithLevel` (on mathlib's `WeakFEPair`) |
| von Mangoldt | `ArithmeticFunction.vonMangoldt` (Λ), `Chebyshev.psi/theta` | consumes Λ in `PX`, `literatureRHS` (`Zeta23/ExplicitFormula.lean:69–79`) | `IdealMangoldt.value` (ideal-theoretic) + `frobeniusVonMangoldt`-analogues | `frobeniusVonMangoldtCoeff` (Chebotarev-weighted) |
| Chebyshev/Mertens moments | ψ/θ two-sided bounds; **no Λ² moments** | `cheb1a–cheb2b` incl. `∑Λ²/n = (log x)²/2 + O(log x)` (`Hypotheses.lean:83–94`) | dyadic prime-ideal estimates (`Hecke/PrimeDyadic*.lean`) | `DirichletDensityBounds`, `FibreBounds` |
| Tauberian theorem | `WienerIkehara.tendsto_sum_div` (unconsumed) | — (uses EF directly) | — (uses log-derivative comparisons) | `wienerIkehara_nat/rpow`, Wiener–ln, Newman Tauberian — three parallel developments |
| Hardy/line-side API | `hardyZ` (`abs_hardyZ`, `hardyZ_eq_zero_iff`, `HardyZ.lean:85,111`) | on-line counts via `ZeroConfig.onLine` | — | — |
| Archimedean Γ-factors | Deligne's Γℝ/Γℂ (`Analysis/SpecialFunctions/Gamma/Deligne.lean`), `Complex.digamma` | `mu τ := (1/2π)(log(τ/2π)+Re digamma(1/4+iτ/2))`; χ-version `muq κ q` already (κ,q)-explicit (`ThmE/Hypotheses.lean:48`) [erratum 2026-11-09, H/QA: v1 cited :44; `def muq` is at :48] | Γ-detector machinery (`DirichletL/GammaDetectorExpansion.lean`) | — |
| Taper/test windows | `Real.smoothTransition` | `TaperProfile ϱ`, `Params`, quartic windows (`XiPrime/QuarticWindow/`), Gevrey ramps | CubicMoment theta windows (`CubicMoment/Estimates/WideGramMellin.lean`) | — |
| "Zeta" of a variety | — | — | — | elliptic curve Z(W/F,T) rational + Hasse bound (`AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Zeta.lean`) |

Notable duplications (each pair proved twice, no shared API) [VERIFIED]:
1. **Zero-set finiteness**: mathlib `IsCompact.inter_riemannZetaZeros_finite` vs zeta23
   `ZetaSeam.finite_window` (`Zeta23/Statement.lean:83`) — same statement, different names; zeta23
   re-proves it because mathlib's version carries no multiplicity/strip information.
2. **Wiener–Ikehara**: mathlib `WienerIkehara.lean` vs tauceti `LSeries/WienerIkehara/` (3
   variants + Wiener–ln + Newman) — parallel formalizations of the same Tauberian family.
3. **Completed zeta**: mathlib `completedRiemannZeta₀` vs tauceti `LSeries/CompletedRiemannZeta.lean`.
4. **Nonvanishing on Re = 1**: mathlib `Nonvanishing.lean` (ζ, Dirichlet) vs tauceti's Artin
   3-4-1 (`Nonvanishing.lean` there proves nonvanishing for **Galois-character** series, strictly
   more general objects) — different generality, same statement shape.

---

## §2 Lifts, dualities, and the genericity audit of zeta23

The structural fact dominating this cluster [VERIFIED]: **zeta23's entire engine is already
abstract**. `PaperInputs Z` (`Zeta23/Hypotheses.lean:147`) and even
`PaperInputsChi (κ q : ℕ) (c : ℕ → ℂ) (Z : ZeroConfig)` (`ThmE/Hypotheses.lean:127`) are stated for
an abstract zero configuration + abstract coefficient sequence; `thmD_lam_abstract (Z : ZeroConfig)
(H : PaperInputs Z) (P : Params)` (`ThmD/Final.lean:45`) and `thmA_of_traces`-family
(`Zeta23/Main.lean:176–208`) are generic. The only ζ- or χ-specific work is discharging the fields:
`EF` (Weil explicit formula), `RvM` (count + local count), `cheb` (prime-side moments), `GammaFacts`.
Chebyshev–Mertens, the MV Hilbert inequality (constant 13, `MV/Final.lean:27 mvDiag_thirteen`),
the rank–trace inequality (`LinAlg/RankTrace.lean:163`), and the λ-families
(`Final.lean:79 thmA_lam`, `:99 thmB_lam`, `:119 thmC_lam`) are coefficient-data once and for all.

(a) **Mechanically available now** (engine accepts them without new mathematics):
- Evaluating Theorem D's `cStar λ` (`ThmD/Functional.lean:35`) at λ ≠ 1 — the λ-family is proved;
  only the packaging at λ = 1 (`cMT`, `ChallengeDeps.lean:107`) is frozen. Produces the intermediate
  constants 2−1/c(λ); no new theorem, but the *function* λ ↦ best proportion is the object the
  PairCeiling caps.
- **Quartic window for ζ itself**: the quartic-window analysis exists only for ξ′
  (`XiPrime/QuarticWindow/`, constants 86.864%/93.432% vs flat 85.838%/92.919%
  `Challenge/XiPrime.lean:94–105`). The A–D engine consumes any `TaperProfile`; rerunning the
  ThmD variational problem (`ThmD/Functional.lean`, `ThmD/Window.lean`) with the quartic family is a
  mechanical variation. Whether it beats 2−1/c₁* = 0.67250 for ζ is a **computable open constant**
  [HYPOTHESIS: it improved ξ′ by ~1.0 percentage point, so likely yes for ζ; but the PairCeiling
  caps all bandwidth-one certificates at 0.6818287 (`PairCeiling/Signed.lean:94
  ceiling_law256_signed`, hypothesis `EnclOK`)].
- **Rank–trace at general c**: `rank_trace_ineq` is general in c; applied at c = 2 and c = 3 only
  (`ZeroSide/Mult.lean`). The exact tightness identity `lemmaR_tight` (`ZeroSide/TightMult.lean`)
  gives k_c(m) explicitly, so the c-continuum of proportion inequalities is derivable — new formal
  statements, low mathematical novelty (they interpolate the proved endpoints).

(b) **Genuinely new mathematics from lifting** (each requires new input, not just instantiation):
- Instantiating the engine at L-functions no corpus has zero theory for: openai-math's Hecke
  L over ℚ(√−3), mathlib's `CuspForm.L`, tauceti's Artin L-series. See §4 E1/E2.
- **Donor direction, zeta23 → mathlib** (glued statements): (i) RvM as a mathlib theorem:
  `N(T) = (T/2π)(log(T/2π)+2log 2−1) + O(log T)` for `riemannZetaZeros`-counted zeros — needs the
  definitional bridge identifying zeta23's strip-conditioned zeros with mathlib's zero set; (ii) the
  *identification lemma itself* is missing in mathlib and is a real (small) theorem:
  **every zero of `riemannZeta` outside the open strip is trivial**, i.e.
  `riemannZetaZeros ∩ {z | z.re ≤ 0 ∨ 1 ≤ z.re} ⊆ {−2(n+1)}` — gluing mathlib's
  `riemannZeta_ne_zero_of_one_le_re` (right half) with `completedRiemannZeta_one_sub` + Γ-nonvanishing
  (left half). Nothing in any corpus states it [VERIFIED: `ChallengeDeps.lean:36–41` explicitly says
  the converse is "classical and is not needed"]. It is the type-checking layer for every future
  zeta23↔mathlib zero-side transfer.
- **Donor direction, openai-math → mathlib**: the `WeakFEPair` combinators
  (`SevenEighths.ThetaProduct.product`, `rescale`, `HeckeTheta.finitePair`) are exactly the
  "calculus of FE pairs" mathlib lacks (mathlib has only `WeakFEPair.symm`,
  `AbstractFuncEq.lean:118`). Donating them makes every product/rescaled L (Dirichlet × Dirichlet,
  Hecke theta lattices) a mathlib citizen — the substrate both E1 and any GL(2) work needs.
- **Dualities**: zeta23 counts zeros (N large ⇒ density), openai excludes zeros (strip empty);
  tauceti counts primes (ψ asymptotics). The explicit formula is the dictionary turning one into
  the other: `frobeniusPsi_asymptotic` (tauceti) is the Tauberian shadow of a Weil EF that nobody
  has formalized for Artin L; `exists_absolute_real_zero_gap` (openai) is the log-free shadow of the
  same EF. A formal "EF ⇒ Tauberian ⇒ PNT-with-error" pipeline exists in no corpus.

---

## §3 Quantitative-transfer opportunities

1. **MV diagonal constant 13 → 3π/2** [VERIFIED not load-bearing]: zeta23 proves `MVDiag 13`
   (`MV/Final.lean:27`) with the literature constant 3π/2 ≈ 4.71 in the paper's bilinear form
   (`Hypotheses.lean:100–102`: "Any absolute constant in place of 3π/2 would suffice"). Improving 13
   is formalization quality, not discovery. No downstream constant moves.
2. **Backlund bound transfer to Hecke L** [VERIFIED gap]: zeta23's `backlund_horizontal`
   (`RvM/Backlund.lean:12`, Titchmarsh §9.4) + χ-variant (`ThmE/BacklundChi.lean`) is exactly the
   missing input for a Hecke-L RvM (E1's local-count field). The transfer is a real proof (new
   contour for theta-lattice functions) with a template already written twice.
3. **PairCeiling 0.6818287 vs Montgomery–Taylor 2−1/c₁* = 0.67250** [VERIFIED constants]: a gap of
   ~0.0093 provable-bandwidth headroom. Open variational question (see §2a): is the supremum of the
   ThmD functional over *all* bandwidth-one windows equal to c₁*-form or higher? The ceiling is the
   only formal optimality statement in the ecosystem (`PairCeiling/Ceiling.lean:28
   ceiling_of_valid_at`); closing either direction is new mathematics. Caveat: ceiling carries the
   external `EnclOK` interval-arithmetic hypothesis (256 near-CUE enclosures, sha256-stamped,
   outside the repo).
4. **Effective Siegel constant** [HYPOTHESIS, hard]: openai's `exists_absolute_real_zero_gap` gives
   an inexplicit c ("No explicit value of c is given", `lean/docs/003.md`). zeta23-style effective
   computation (interval arithmetic à la PairCeiling, but internal) could in principle make c
   explicit — but the underlying method (log-free density) makes this a research project, not a
   transfer.
5. **Chebyshev–Mertens Λ²-moments → mathlib** [VERIFIED gap]: mathlib's `Chebyshev.lean` stops at
   ψ/θ bounds; `cheb2a/cheb2b` (`∑Λ²/n = (log x)²/2 + O(log x)`, `∑Λ²/n·log(x/n) = (log x)³/6 + O(log x)²`)
   exist only inside zeta23 and are consumed by its PrimeSide Gram estimates. Donating them to
   mathlib is the concrete prerequisite for any future second-moment prime-side work (and the
   natural meeting point with openai's `CubicMoment` and eth's variance layer, §4 E6).
6. **Chebotarev error terms** [VERIFIED gap, classical]: tauceti's `frobeniusPsi_asymptotic` is a
   pure limit statement (no rate). Combining openai's quasi-RH-type zero-free band for the
   abelian/Dirichlet factors with zeta23's effective EF machinery would yield the classical
   effective error O(x exp(−c√log x))-shape bounds — classical mathematics, formalization-empty.

---

## §4 Empty zones (candidate discoveries)

### E1. Theorem E beyond Dirichlet: zero-density proportions for Hecke L-functions over ℚ(√−3)

**Candidate statement.** For every finite-order Hecke character χ of 𝓞_K, K = ℚ(√−3)
(openai-math's `SevenEighths.HeckeFamily.Character`: modulus, unit-trivial residue, period), with
N_χ(T₁,T₂) the count of nontrivial zeros of its L-function in the strip with T₁ < Im ρ ≤ T₂ with
multiplicity (via `analyticOrderAt`, mirroring `ChallengeDeps.lean:41–95`):

  liminf_{T→∞} N⁰*_χ(T,2T)/N_χ(T,2T) ≥ 2/3   and   N_d,χ(T,2T)/N_χ(T,2T) ≥ 5/6 − o(1),

with the μ-density (1/2π)[log(D·N𝔣(χ)/π) + Re Γ′/Γ(·)] of weight (κ + 1)/2-shifted digamma — the
exact shape of zeta23's already-generic `muq κ q` (`ThmE/Hypotheses.lean:44`).

**Novelty.** [HYPOTHESIS, strong] The Alpöge–Furman proportion method (arXiv:2608.13637) is days
old and its published Theorem E covers Dirichlet L-functions only; no Levinson/AF-type
simplicity-proportion theorem for Hecke L-functions of an imaginary quadratic field appears in any
corpus (verified: zeta23 stops at Dirichlet; openai-math's Hecke development is purely zero-free)
and I know of none in the literature. The statement is new; the constants 2/3, 5/6 would match E.

**Bridge-essentiality.** Essential and three-way: zeta23's engine is generic but has only
ζ/Dirichlet instantiations; openai-math has the L-function (`SevenEighths.HeckeFamily.LFunction` =
`continuedLattice χ / 6`), its FE-pair, AND the prime side (`Hecke/PrimeDyadic.lean:22–24`: log
-derivative equals the ideal-von-Mangoldt Euler series; `IdealMangoldt.value`), but zero-free only;
mathlib supplies `WeakFEPair`, `analyticOrderAt`, digamma. No corpus can state and prove it alone.

**Contributing named results.** `Zeta23.ThmE.thmE_A_lam` assembly over `PaperInputsChi`
(`ThmE/Final.lean:29`), `Zeta23.RvM` contour pattern (`RvM/CountByIntegral.lean`,
`RvM/Fold.lean`), `SevenEighths.HeckeTheta.pair/latticeL`, `Hecke/PrimeDyadic.lean series_eq_tsum`,
`ThmE/BacklundChi.lean` as the Backlund-transfer template, `Zeta23.mvDiag_thirteen`,
`rank_trace_ineq`.

**First proof step.** Define the `ZeroConfig` for `HeckeFamily.LFunction χ`: carrier := its strip
zeros, mult := `analyticOrderAt`; prove the reflection symmetry ρ ↦ 1−ρ̄ (from
`(pair w).functional_equation` + `TraceCharacter`/`Conjugation.lean` in the Hecke tree), mirroring
`ZetaSeam.reflect_zero` (`Zeta23/Statement.lean:79`) which zeta23 derives from
`completedRiemannZeta_one_sub`. Then the two big obligations: Weil-type EF (test-function form) for
`latticeL` — the contour-integration template is `Zeta23/WeilEF/Contour.lean` + `VerticalLine.lean`
run over openai's already-`WeakFEPair`-packaged theta pair — and RvM with Backlund-χ bound.

**Feasibility.** Hard (the EF and RvM for GL(2)-over-K are the whole classical content), but every
architectural seam exists; this is the highest-novelty item in the cluster.

### E2. Weil's explicit formula for modular L-functions + the missing Rankin–Selberg moment

**Candidate statement.** (i) Infrastructure: for f a level-one cusp form of weight k
(mathlib `CuspFormClass F Γ k`), for every k ∈ C_c²(ℝ) test function with h = paperFT k:
  ∑_ρ m_ρ h(γ_ρ) = arch-Γ-term((k±1)/4-shifts) − ∑_{n≥1} Λ(n)a_n n^{−1/2}(k(log n)+k(−log n)),
the [IK04, Thm 5.12] form for GL(2), as an `EF_lit`-style statement over the zero config of
`CuspForm.L hk f`. (ii) Payoff (the actually-new theorem): positive proportions of zeros of L(s,f)
simple and on the critical line, engine-consume form of (i).

**Novelty.** [HYPOTHESIS] (i) is classical-but-unformalized everywhere; (ii) — AF-method
simplicity proportions for modular L-functions — I know of no literature precedent (Levinson-method
line-density results are concentrated on ζ and Dirichlet L; GL(2) results are zero-density
estimates of Huxley type, a different quantity). Requires the §4 Phase-3 literature check to
confirm; flag as the riskiest novelty claim.

**Bridge-essentiality.** mathlib alone has the object (`ModularForm.L`, `CuspForm.isStrongFEPair`
`ModularForms/LFunction.lean:216`, `CuspForm.hasSum_L :243` giving ∑a_n/n^s for Re s > k/2+1);
zeta23 alone has the EF pipeline (`WeilEF/Contour.lean` → `EF_lit`); the prime-side cheb analogue —
∑_{n≤x} Λ(n)|a_n|²/n ≪_f (log x)², the Rankin–Selberg local bound — is in NO corpus
[VERIFIED: mathlib's `ModularForms/NormTrace.lean` is level restriction/trace maps, not
Rankin–Selberg]. That gap is the honest content of E2.

**Contributing named results.** `Zeta23.EF.EF_lit` + `Zeta23/WeilEF/{Contour,VerticalLine,
ZeroSumLimit,Landau}.lean`; `CuspForm.isStrongFEPair`, `CuspForm.differentiable_L`
(`LFunction.lean:221,236`); `Zeta23.ThmE.ChebCoprime.lean` (coefficient-restricted cheb) as the
template for |a_n|-weighted moments.

**First proof step.** State and prove the Rankin–Selberg input in the weakest engine-usable form:
`∑_{n≤x} Λ(n)² |a_n|²/n = O_f((log x)²·x⁰)`-type moment bounds (needs: Euler product of
L(s,f,sym²) — absent everywhere; this is where E2's difficulty is concentrated and where a
decomposition into an EngineInput-hypothesis keeps the theorem honest).

### E3. Effective PNT from quasi-RH: the first ψ(x) = x + O(x^{7/8+ε}) — and mathlib's first PNT

**Candidate statement.** (i) ψ(x) ∼ x for mathlib's `Chebyshev.psi` (i.e., the PNT in von Mangoldt
form) via `WienerIkehara.tendsto_sum_div` + `riemannZeta_ne_zero_of_one_le_re`; (ii) the strictly
stronger effective form from openai-math's zero-free half-plane:
  ∀ε>0 ∃C ∀x≥2: |ψ(x) − x| ≤ C_ε·x^{7/8+ε}.

**Novelty.** Low as mathematics (classical deduction), but [VERIFIED] openai-math explicitly
excluded applications: "The paper's later applications are not included" (`lean/docs/003.md`), and
**mathlib has no PNT asymptotic at all** — only `tendsto_primeCounting` divergence
(`NumberTheory/PrimeCounting.lean:98,102`) and Chebyshev-type bounds. The ecosystem value is first
order: it is the pilot theorem gluing all three corpora (mathlib ψ + Wiener–Ikehara; openai 7/8;
zeta23 growth lemmas `RvM/ZetaGrowth.lean` and EF machinery for the contour bounds on σ = 7/8+ε).

**Bridge-essentiality.** (ii) is essential: needs openai's zero-free band (nobody else has any),
zeta23's ζ-growth/log-derivative estimates (`RvM/ZetaGrowth.lean`, `WeilEF/XiLogDeriv.lean`), and
mathlib's ψ/Perron-free Tauberian route. (i) is mathlib-internal but unbuilt.

**Contributing named results.** `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`;
`WienerIkehara.tendsto_sum_div` (`WienerIkehara.lean:700`); `Chebyshev.psi_eq_sum_Icc`;
`Zeta23/RvM/ZetaGrowth.lean`; `Mathlib/NumberTheory/AbelSummation.lean`.

**First proof step.** (i) alone: show `f := Λ` satisfies the Wiener–Ikehara hypotheses using
`riemannZeta_ne_zero_of_one_le_re` on the line Re = 1 plus the Euler product
(`EulerProduct/DirichletLSeries.lean:104 riemannZeta_eulerProduct`) to identify the pole at s = 1
with residue 1 — this is a self-contained, high-value, kernel-only theorem not present anywhere.

### E4. Uniform-in-conductor Theorem E

**Candidate statement.** There exist absolute T₀(ε) and A such that for every q and every
primitive χ mod q (real or complex) and every T ≥ max(q^A, T₀(ε)):
  (2/3 − ε)·N_χ(T,2T) ≤ N⁰*_χ(T,2T)  (and the 1/2, 3/4 analogues).

**Novelty.** [HYPOTHESIS] AF prove fixed-q (the Lean `thmE_A` takes χ fixed; constants via
`ℓ_{1,χ}` with "λ₁ → λ as q is fixed", `ThmE/Hypotheses.lean` header quote). A uniform version in
the range q ≤ T^A should be provable classically but is not stated in any corpus nor, to my
knowledge, in the paper. Whether openai's `exists_absolute_real_zero_gap` is *needed* is itself the
research question: the engine's fields are per-χ; the real-character exceptional zero threatens
only the RvM local count and the μ_χ/digamma uniformity — both of which `muq` handles explicitly
in (κ,q). So E4's genuine content is a uniformity audit + a possible genuine dependence on the
Siegel exclusion for real χ — exactly the kind of question only answerable with both corpora
formalized.

**Bridge-essentiality.** zeta23 supplies the engine and the per-χ obligations' templates;
openai-math supplies the uniform Siegel-zero exclusion that may (or may not) be required — either
answer is a finding. mathlib supplies the character API (`DirichletCharacter.IsPrimitive`,
`rootNumber`).

**Contributing named results.** `ThmE/Final.lean:29–105` (`thmE_A_lam`, `thmE_A₀` etc.),
`ThmE/{RvMChi,BacklundChi,ChebCoprime,GammaFactsChiProof,LocalCountChi}.lean`,
`OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap` (`SiegelZeros.lean:6`).

**First proof step.** Extract every q-dependence in the ThmE proof: (a) `ell1q q T` vs `l T`
ratio control for q ≤ T^A; (b) `ChebCoprime` constants (removed primes ≤ log q); (c) the local
count `LocalCountChi` uniformity. Write the engine's first theorem with T₀ = T₀(ε, A) and attempt
to discharge q-dependence with and without the Siegel exclusion.

### E5. The De Bruijn–Newman gap: no corpus defines Ξ_t; zeta23's XiPrime is the t = 0 anchor

**Candidate statement (gateway, deliberately modest).** The heat-flow family via Poisson summation:
Ξ_t(s) := the entire function obtained by convolving the Riemann ξ-integrand with the Gaussian
kernel of variance 2t (equivalently `completedRiemannZeta₀`'s θ-integral against the heat kernel),
with: (i) Ξ_0 = ξ; (ii) Ξ_t → ξ locally uniformly; (iii) **Re(Ξ_t′/Ξ_t)(s) > 0 for Re s ≥ 1, for
all t ≥ 0** — the t-uniform upgrade of zeta23's `xiPrime_over_xi_re_pos`
(`Challenge/XiPrime.lean:72`, proved only at t = 0).

**Novelty.** (iii) as stated is not in the literature I can verify [HYPOTHESIS]; it is the first
formalizable monotonicity-flavored statement of De Bruijn–Newman type: it would say the right
half-plane behavior of ξ′/ξ — the same positivity that Ki–Kim–Lee-type Speiser arguments exploit —
persists under the heat flow, a necessary condition for Λ ≤ 0-type conclusions. Even (i)+(ii) are
in no corpus [VERIFIED: `rg "Xi_t|de Bruijn|Newman"` over all four corpora returns only tauceti's
`Newman/Tauberian.lean` — Donald Newman's PNT proof, an unrelated Newman].

**Bridge-essentiality.** mathlib has the Gaussian/Poisson machinery
(`Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean`: `Complex.tsum_exp_neg_quadratic`,
heat-kernel integrals) and `completedRiemannZeta₀`; zeta23 has ξ (`ChallengeDeps/XiPrime.lean:16`),
its symmetry calculus (`XiPrime/ExplicitFormula/ZeroFree.lean:292 logDeriv_xi_one_sub`,
`:306 logDeriv_xi_conj`), and the ξ′/ξ explicit formula. Neither alone can define and analyze Ξ_t:
zeta23 has no heat kernels; mathlib has no ξ.

**Contributing named results.** `XiPrime.xiPrime_over_xi_re_pos`; `logDeriv_xi_one_sub`;
`XiPrime/ExplicitFormula/` (the ξ′/ξ EF); mathlib `Complex.tsum_exp_neg_quadratic`
(`PoissonSummation.lean:84`), `Real.tsum_eq_tsum_fourier_of_rpow_decay_of_summable` (already
consumed by `Zeta23/Poisson.lean:22`); `completedRiemannZeta₀`-as-θ-integral
(`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:64`).

**First proof step.** Prove the representation ξ(s) = ∫_{0}^{∞} Θ(u)u^{s/2}(du/u)-type Mellin
identity from mathlib's `hurwitzEvenFEPair`/PoissonSummation, then define Ξ_t by replacing Θ with
its t-heat transform; (i)–(ii) follow from Gaussian semigroup convergence in mathlib
(`Analysis/SpecialFunctions/Gaussian/*`). (iii) then reduces to a Gaussian-weighted version of the
zeta23 positivity proof — the genuinely open part.

### E6. (Cross-cluster note — lane R4 owns the complexity side) Shared second-moment layer

zeta23's prime-side Gram-trace machine (`PrimeSide.thm_traces`, consuming `cheb2a/cheb2b`),
openai-math's `CubicMoment` Gram/Mellin windows (`CubicMoment/Estimates/WideGramMellin.lean
wide_radial_mellin_separated`, `WidePoissonRecurrence.lean`), and eth's variance layer
(`proof/networks/Variance/`, `stVar`: Var Y ≤ 4PU) all formalize "second moment of a quadratic form
with diagonal dominance + Hilbert-inequality cross terms". A shared lemma layer (one statement:
quadratic-form second moments from diagonal bounds + off-diagonal MV-type control) would serve all
three. [HYPOTHESIS that openai's CubicMoment re-proves an MV-type inequality internally; verified
only that it has Gram-matrix/Mellin machinery with weighted prime inputs.] Not developed further
here; flagged for R4's complexity-side map and for the Λ²-moment donation of §3.5.

---

## §5 Sources consulted

**zeta23** (`/home/doz/zcode-workdir/anthropics_formal-math/zeta23/`): `ChallengeDeps.lean` (all);
`Challenge/XiPrime.lean` (all); `Zeta23/Statement.lean` (all); `Zeta23/Hypotheses.lean` (all);
`Zeta23/Final.lean` (all); `Zeta23/ThmE/Hypotheses.lean` (head: ell1q/muq/PXc/nuXc,
PaperInputsChi); `Zeta23/ThmE/Final.lean` (thmE_A/B/C, thmE_*₀); `Zeta23/ThmE/Statement.lean`
(LZeros seam); `Zeta23/ThmE/` dir listing (RvMChi, BacklundChi, ChebCoprime, EFLitChi, …);
`Zeta23/ExplicitFormula.lean` (EF_lit, literatureRHS, gammaBracket); `Zeta23/WeilEF/Main.lean`
(EF_lit_zetaZeroConfig); `Zeta23/RvM/Statement.lean`; `Zeta23/RvM/Backlund.lean` (head);
`Zeta23/RvM/` dir listing (ZetaGrowth, LocalCount, CountByIntegral, Fold); `Zeta23/MV/Final.lean`
(mvDiag_thirteen, mv_hilbert); `Zeta23/LinAlg/RankTrace.lean` (rank_trace_ineq);
`Zeta23/ThmD/Functional.lean` (cStar, HD); `Zeta23/ThmD/Final.lean` (thmD_lam_abstract, thmD₀*);
`Zeta23/PairCeiling/` (Signed.lean, Ceiling.lean, NumericCert.lean EnclOK, LawN256 dir);
`Zeta23/XiPrime/Final.lean` (xiDerivZeros₀_rvm, flat/quartic statements);
`Zeta23/XiPrime/ExplicitFormula/{Main,ZeroFree,TestWeight}.lean`; `Zeta23/XiPrime/FamilyHyps.lean`
(head); `Zeta23/Defs.lean` (ZeroConfig, Params, nuX); `Zeta23/Poisson.lean` (head); plus
`research/survey/anthropics.md` (Phase 1, cross-checked).

**mathlib** (`/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4/`):
`Mathlib/NumberTheory/LSeries/` — `ZetaZeros.lean` (all), `Nonvanishing.lean` (decl index),
`RiemannZeta.lean` (decl index), `WienerIkehara.lean` (head + tail theorems), `HardyZ.lean` (decl
index), `AbstractFuncEq.lean` (decl index), `MellinEqDirichlet.lean` (decl index),
`DirichletContinuation.lean:231`, `EulerProduct/DirichletLSeries.lean` (decl index);
`Mathlib/NumberTheory/ModularForms/LFunction.lean` (weakFEPair, Λ, L, CuspForm section);
`ModularForms/NormTrace.lean` + `RamanujanFormula.lean` (heads — confirmed NOT Rankin–Selberg);
`Mathlib/NumberTheory/Chebyshev.lean` (decl index); `NumberTheory/PrimeCounting.lean` (decl
index); `Analysis/SpecialFunctions/Gamma/` (dir; `Deligne.lean` head);
`Analysis/SpecialFunctions/Gaussian/PoissonSummation.lean` (decl index).

**openai-math** (`/home/doz/zcode-workdir/openai-math/`): `lean/docs/003.md` (all);
`lean/ComparatorChallenges/QuasiRiemannHypothesis.lean`, `DirichletSevenEighths.lean`,
`HeckeSevenEighths.lean` (all — includes the WeakFEPair combinators and HeckeFamily defs),
`SiegelZeros.lean` (all), `Jacobsthal.lean`, `JacobsthalImproved.lean` (all);
`lean/OAI/NumberTheory/` dir listings; `OAI/NumberTheory/DirichletL/Hecke/` (dir listing, 182
files; `PrimeDyadic.lean:15–30` coefficient/series/series_eq_tsum; `PrimePowers.lean` head);
`OAI/NumberTheory/Jacobsthal/Estimates/PrimitiveTransfer.lean` (rg hit consuming
`dirichletRealZeroBound_proof`); `CubicMoment/Estimates/` (rg decl index); `ZetaFive/Identities/`
(spot-check); `CONTENTS.md` (results 001–013 region).

**tauceti** (`/home/doz/zcode-workdir/tauceti/`): `TauCeti/NumberTheory/Chebotarev/Density/
ZetaSum.lean` (head); `Chebotarev/PrimeCounting/Chebotarev.lean` (frobeniusPsi_asymptotic);
`Chebotarev/GaloisCharacter/Nonvanishing.lean` (head); `NumberTheory/NumberField/DedekindZeta.lean`
(decl index); `NumberTheory/LSeries/` (dir listing; `WienerIkehara/Variants.lean`,
`FEPairWithLevel.lean`, `MeanSquare.lean` decl indices); `LSeries/Quadratic/Character.lean`
(LFunction_pos_of_one_le); `LSeries/Quadratic/Pair/` (Residue decls);
`AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Zeta.lean` (head); `AGENTS.md` (head).

Search patterns used for absence claims: `vonMangoldt`, `zeta|Zeta|LFunction|Dirichlet|LSeries`
(tauceti root); `zeta|dirichlet|number theory|L-function|prime number` (openai-math, minus PDFs);
`primeNumberTheorem|ψ x / x|tendsto.*psi` (mathlib, exhaustive over `Mathlib/`); `Xi_t|de Bruijn|
Newman` (all corpora).
