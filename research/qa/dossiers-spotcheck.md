# QA spot-check — Phase-3 candidate dossiers 01–03, 10–12

Date: 2026-11-09. Checker: lane H. Scope: **citations only** (decl names, file:line, quoted
claims, counted-negation claims); content/math soundness is R8 (novelty) / R9 (feasibility)
territory and is NOT assessed. 8 items per dossier, ≥2 negations re-run by H per dossier.
Roots: `$A` anthropics, `$O` openai-math, `$T` tauceti, `$M` mathlib (read-only).

**Tallies (OK / MINOR-ERROR / WRONG):**
- 01-ez1: **7 / 1 / 0** — 02-ez5: **7 / 1 / 0** — 03-ez3: **8 / 0 / 0**
- 10-z3: **6 / 2 / 0** — 11-z1: **7 / 1 / 0** — 12-z4: **6 / 2 / 0**
- **Aggregate: 41 OK, 7 MINOR-ERROR, 0 WRONG.** All minors are locator/count slips; every
  load-bearing negation re-run by H came back as the dossier claims.

## 01-ez1-inertial-defect-master-identity (R6)

1. mathlib Spectrum anchors — OK: `eigenvalues₀` :60, `eigenvalues₀_antitone` **:63** (dossier right; note R3's survey/bridge wrote :65), `spectral_theorem` :143, `rank_eq_card_non_zero_eigs` :202, `trace_eq_sum_eigenvalues` :240 (rg -n, all exact).
2. zeta23 PosIndex/RankTraceMult scalar layer — OK: `posIndex` :41, `rtrace` :70, `frobSq` :73; `gc` :30, `rtrace_Pmat` :261, `kc_eq` :353 (sed; exact).
3. Proof-spine locators — OK: RankTraceMult.lean `hexpand` :314, `hPQp` :323, `hvN` :325, `hstep4` :326, `hstep5` :334, `hstep6` :339, `htraceQ` :345, final `linarith` :346; RankTrace.lean `sum_sq_lower_of_card_pos_le` :87, `trace_mul_nonneg_of_posSemidef` :114; HermitianPosPart.lean `rtrace_sub_decomp` :192. (Dossier writes `hstep5'` for the :334 `hstep5` — cosmetic.)
4. NEGATION mathlib — OK: `rg -l -i 'rank.?trace' $M/Mathlib/` → **0 files**, as claimed.
5. NEGATION openai — MINOR-ERROR: counts exact (`rg -i -c` → 78 hits / 31 files ✓) and `MachineCloudRank.lean:176 theorem rankTrace` (+ `cloudRankTrace` :282) ✓, but "**all** … IndependentSets" is false: `central_rank_trace` in `OAI/Analysis/TracialCohomology/CenterTrace.lean` (and Laughlin files) also match — an algebra lemma, still unrelated to matrix trace inequalities, so the conclusion stands.
6. mathlib 'defect' count — OK: 4 hits / 4 files, exactly as claimed.
7. tauceti anchors — OK: `frobenius_inner_eq_trace_conjTranspose_mul` at `Frobenius.lean:106` exact; `eigenvalues₀_nonpos_of_rank_le` at `Eigenvalues/Basic.lean:235` exact; zeta23 `Weyl.lean:111` is the Cauchy–Schwarz `hCS` line, as described.
8. zeta23 defect-source claims — OK: `gc_ge`/`affine_le_gc` minorant cites (:41/:49), `Wmat` :220/`Pmat` :223, `xsq` :226, `kc` :351 all present (rg).

## 02-ez5-bandwidth-k-ceiling-laws (R6)

1. PairCeiling defs — OK: `Defs.lean` header :7 "the bandwidth-1 pair-correlation CEILING theorem" verbatim; `Csum/Cstep/Dfun/Efun` across :27–36 with `Dfun := Cstep − x²/2`, `Efun := ∫₀ˣ D`.
2. NearCUE identities — OK: `N·T_m = m(m+1)/2` docstring :36, `N·U_m = (m³−m)/6` :54 (cited range :38–60; both inside up to 2 lines).
3. Ceiling/Law256 lines — OK: `ceiling_numeric` `Ceiling.lean:44` exact; `ceiling_law256_decimal` `CeilingLaw256.lean:53` exact; `ceiling_of_valid_at` :28 and `ceiling_stability` `Stability.lean:305` (verified in bridges Part 2).
4. NEGATION mathlib — OK: `pair.?ceiling|ceiling.?law`, `bandwidth`, `near.?CUE` over `Mathlib/` → 0 / 0 / 0 files, as claimed.
5. NEGATION anthropics — MINOR-ERROR: claim "86 hits, all inside `Zeta23/PairCeiling/`". Actual: **65** hits, and **1** file outside (the umbrella `Zeta23.lean`, an import/listing mention); `bandwidth` **11** hits (claim 15), all bandwidth-one self-references as claimed. Direction and conclusion hold; counts off.
6. openai character — OK: `supersolution_lower_ceiling` occurs at `MeanPayoff/Tightening.lean:196` (def at :192, payoff games — false positive as claimed); `bandwidth` 143 hits exact (graph/circuit senses); `nearCUE` 0.
7. PairCeiling inventory — OK: directory = exactly the 11 files listed (Bridge, CeilingLaw256, Ceiling, Defs, Grid, LawN256, NearCUE, NumericCert, RowCert, Signed, Stability).
8. mathlib LP negative — OK: `rg -i 'farkas|strong duality|linear program'` hits only `Tactic/Linarith/Oracle/SimplexAlgorithm/*` and `Analysis/Convex/Cone/{Dual,InnerDual}.lean` — exactly the claimed "linarith simplex oracle + cone duality", no LP duality theorem.

## 03-ez3-compression-rank-trace (R6)

1. NEGATION zeta23 — OK: `rg -rn 'posIndex_conj_le' $A/zeta23/Zeta23/` → only `Inertia.lean` (definition site :51); zero consumers, as claimed ("never consumed").
2. mathlib LinearMap anchor — OK: `LinearMap.IsSymmetric.eigenvalues` at `Analysis/InnerProductSpace/Spectrum.lean:277` exact.
3. mathlib transport anchor — OK: `isSymmetric_toLin_iff` at `Analysis/Matrix/Hermitian.lean:46` exact.
4. tauceti alternative route — OK: `Crossing.lean` :28/:66/:257 are the path-crossing index-jumping statements; `eigenvalues₀_submatrix_le` at `Interlacing.lean:58` exact (+ `eigenvalues₀_le_eigenvalues₀_submatrix` present, docstring :36).
5. tauceti equality/projection layer — OK: `eigenvalues_congr` at `CourantFischer.lean:510` exact; `FanDominance.lean:39` docstring "orthogonal projections do not increase `N`" verbatim.
6. NEGATION mathlib — OK: `rg -c -i 'compressed.{0,15}(index|inertia)' $M/Mathlib/` → 0 files.
7. NEGATION zeta23 ZeroSide — OK: `rg -i -c 'compress|subspace|restriction' zeta23/Zeta23/ZeroSide/*.lean` → no matching files (0 hits), as claimed.
8. LoC inventory — OK: `wc -l LinAlg/*.lean` → HermitianPosPart 204, PosIndex 127, RankTrace 267, Sylvester 309, VonNeumann 204 — every quoted figure exact; total 1385 = the bridge's figure.

## 10-z3-uniform-poly-space-eth-refutation (R4)

1. eth statement anchors — OK: `CountsWithin` at `MainResults.lean:158–160` exact (verbatim `TM2OutputsInTime M.tm … (some (binary n (numSat φ)…))`); encClauses/encInput length drivers at :85–88 (cited :85–87) with the `⌊log₂(2n)⌋+1` slots.
2. openai per-prefix form — OK: `Final.lean:122–128` = `∀ prefixSteps ≤ time → Trace … intermediate → visitedSpace intermediate ≤ S·(n+F.card+1)^e`, exactly the cited per-prefix monitor shape.
3. NEGATION eth space — MINOR-ERROR (count only): `rg -i 'polynomial space|poly.?space|visitedSpace|visited space' $A/eth/` → **0 hits** ✓ (the load-bearing claim), and 3sum-apsp statements → 0 ✓; but the sub-claim "`rg -i space` 13 hits" is wrong at repo scope — **1354** hits across eth .lean files (13 is plausible only for a single file). Conclusion unaffected: no space predicate exists.
4. PolyT layer — OK: `class IsPolyT` at `PolyT.lean:104` exact, `Carried` :106 (region :104–112 as cited), `PolyT.elim` :73 exact.
5. Wrap layer — MINOR-ERROR: `everyMachineCanBeWrapped` at `Wrap/Main.lean:`**39** (cited :34) and `decidesTM_of_wraps_counter` at **:57** (cited :54; the ":54–60" range does contain it). Names and roles correct; line pins off by 5/3.
6. Interfaces pad discipline — OK: `run : U × Idx × PInst → ℤ` field at :128 exact; `2 ^ enumBits g F c ≤ pad.length` at :32 exact — the "pad used only through length bounds" evidence.
7. Pad facts — OK: `pad = List.replicate (2^k) ()` :30, `padM_runs` size `2|x|+2·2^{ex}+3` :93–94, `exists_tm_padded` :116 (verified fresh in bridges Part 2; range :116–125 consistent).
8. mathlib anchors — OK: `TM2ComputableAux` :142, `TM2OutputsInTime` :130, `StateTransition.lean:266–288` `EvalsToInTime`+refl/trans (verified in earlier rounds; consistent with R9 §1 #10).

## 11-z1-composable-reduction-theory (R4)

1. Closure-axiom instances — OK: `Closure.MonoExactTriangle` at `Definitions.lean:120–122`, `Closure.ChooseBySize` :127–130 (sed; exact shapes as generalized).
2. Call-charging quote — OK: `Definitions.lean:54–58` contains verbatim "a transfer claim charges a call of an algorithm exactly its running time, and everything else to the extra time".
3. Twin models — OK: `DetTimeModel` :75 (verified Part 2) and `ConditionalTimes/Definitions.lean:105 structure TimeModel` exact.
4. Light-language call rule — MINOR-ERROR: `Ends.callTo/callToThen/callLast/callThen` documented at `Calls.lean:26–27` and the charging theorems sit inside the cited :93–124 region (Ends.callThen verified there); but `Meets.mono` is at **:56**, not the cited :52 (off by 4).
5. Parameter-instantiation sites — OK: `claim_theorem_17₅` at `ClaimAtParameters.lean:204`, `claim_theorem_17₂₆` at :214, both `… lightModel strassen …` — inside the cited :204–218.
6. NEGATION composition vocabulary — OK: `rg -i 'calls multiply|composition.{0,20}running time|compos.{0,8}time bound'` over anthropics + `OAI/` + `TauCeti/` → **0 hits**, as claimed.
7. REMARKS obstruction quote — OK: the "cannot simply be called as a subroutine … does not say which cells a program reads or writes" quote is in `docs/REMARKS.md` "Theorems 17 and 21 in their printed form" (verified in the Phase-1 survey sources; re-confirmed by the survey's §2 listing).
8. mathlib/eth anchors — OK: `TM2ComputableInTime/InPolyTime` :161/:174 (R9-confirmed), `Solver` layer `Interfaces.lean:126–181` (Part 2), `ETHIsFalse` `MainResults.lean:122` (Task-2 QA).

## 12-z4-parametric-savings-function-in-matrix-exponent (R4)

1. Claim target shape — OK: `Theorem_19_explicit` at `Definitions.lean:305–308` exact (`K·κ·n^{3−δ}·(log n)^e`, threshold `16^18 ≤ n`).
2. Parameter file — OK: `termPrime (MM) := MM n * D^{3/2}` at `Sec3/Parameters.lean:66` and `strassen n := n^{logb 2 7}` at :73, both exact.
3. openai supply side — OK: `matrix_multiplication_cost_le` at `AuxiliarySeparation/Main.lean:19` (cited :16–21; docstring :17–18, `cost ≤ C·n^{9/4+ε}` verbatim); **509 files / 0 sorry** in the MatrixMultiplication tree — both figures exact (find | wc -l; rg -c).
4. omega bound locator — MINOR-ERROR: `theorem omega_le_nine_quarters` at `AuxiliarySeparation/Main.lean:`**28** (cited :23–25; the public `complex_omega_le_nine_quarters` wrapper is at :13). Name and statement exact.
5. NEGATION 3sum-apsp — OK: the parametric-dependence patterns ("as a function of the assumed/matrix …", "epsilon … function of … omega/MM/exponent") over ThreeSumApsp + statement files → **0 hits**, as claimed.
6. NEGATION openai — OK: `rg 'Claim\.|DetTimeModel|Theorem_17' $O/lean/OAI/LinearAlgebra/MatrixMultiplication/` → **0 hits** — the exponent infrastructure is unconsumed, as claimed.
7. Double instantiation — MINOR-ERROR: MM is indeed instantiated exactly twice, both at `strassen`, but at `ClaimAtParameters.lean:`**204 and 214** (cited ":204,216"; off by 2 on the second).
8. Model defs — OK: `def omega` at `Model.lean:93` (inside cited :88–101, with `AdmissibleExponent`/`innerSize` in range), `RectangularAdmissibleExponent` verified earlier (ComparatorChallenges form :100–107).

## Conclusion

Citation hygiene across the six dossiers is high: 41/48 items fully exact, 7 minors (three
count slips — openai "all IndependentSets", anthropics 86→65, eth "13 space hits"; four line
pins off by ≤5 — Wrap :39/:57, Meets.mono :56, omega_le_nine_quarters :28, ClaimAtParameters
:214). Every re-run negation (12 of them) confirmed the dossier's absence claim — no
fabricated evidence found. Fixes are one-edit changes for R4/R6 pending orchestrator
sign-off; H has not edited the dossiers.

---

# Part 2 (2026-11-09, evening pass) — dossiers 20/21/22/40/41/42/50/60

Citations only, READ-ONLY (R9 was appending F4 sections to 40/42/60 concurrently — verdicts
reflect file state at read time, 19:0x–19:1x mtimes). Same roots. ≥2 negations re-run per
dossier where claimed. Re-used verified locators are marked "(prior pass)".

**Tallies (OK / MINOR / WRONG):** 20: **8/0/0** · 21: **6/2/0** · 22: **6/2/0** · 40: **7/1/0**
· 41: **6/2/0** · 42: **7/1/0** · 50: **7/1/0** · 60: **8/0/0** — **aggregate 55 OK, 9 MINOR,
0 WRONG.** Frozen-file minors (R9 collision) listed as deferred, not fixed.

## 20-hecke-zetaK-zero-density (R5) — 8/0/0
1. `full_zero_sum_rate` at `CharacterFullZeroCount.lean:12` (namespace `PrimitiveComplexCharacter`) exact. 2. `regularizedZeta_zero_free_region` `ZetaZeroFreeRegion.lean:43` exact (c ≤ 1/4 in statement). 3. `dedekindZetaC_eq_riemannZeta_mul_LFunction` at `Quadratic.lean:100` exact (+ the `:19` cross-cite line present). 4. `heckeLFunctionC` present in `LFunctions/Hecke/Basic.lean`. 5. `AnalyticLFunctionData where` → exactly 3 structure sites (Data/Basic, Data/Normalization, Dirichlet/Basic); `riemannZetaData` card present. 6. mathlib `dedekindZeta` only in `NumberField/DedekindZeta.lean` (:50 def, :57 residue — exact). 7. NEG zeta23 `dedekind` → 0 files ✓. 8. NEG openai proportion-patterns → 0 and tauceti `Ncount|zerosIn` → 0 ✓.

## 21-quartic-window-zeta-thmD (R5) — 6/2/0
1. `Functional.lean` defs `vStar` :32, `cStar` :35, `cFun` :40–43, `aStar` :47, `HD` :53 — all exact. 2. closed forms `aStar_eq` :259, `bStar_eq` :273, `jStar_eq` :385, `cFun_vStar` :432, `HD_one` :464, `jStar_closed` :483 — all exact. 3. `phiD_even` :45 / `phiD_nonneg` :50 exact. 4. `kernel_eq` :321 exact. 5. NEG `quartic` in `Zeta23/ThmD/` → 0 files ✓. 6. MINOR: "quartic lives only in XiPrime, **10 files**" — actual **23** .lean files in XiPrime match (ThmD=0 half holds). 7. MINOR-ERROR: "`cFun` is consumed nowhere outside `Functional.lean`" — the token `cFun` appears in ~80 zeta23 files (ThmD/{Concrete,Limit,PP}, XiPrime Coeff, WeilEF, PrimeSide…); no `∀v ≤ cStar`-optimality theorem among them (A1-absence consistent), but the consumption claim as written is false. 8. `cMT` `ChallengeDeps.lean:107` (prior pass).

## 22-quasi-rh-pnt-effective (R5) — 6/2/0
1. Chebyshev `psi_le_const_mul_self` :485, `psi_ge` :510, `psi_sub_theta_le` :526 (with `2√x·log x` verbatim), `theta_eq_primeCounting_mul_log_sub_integral` :705, `psi_eq_sum_Icc` :93 (prior) — exact. 2. `LSeries_vonMangoldt_eq_deriv_riemannZeta_div` `Dirichlet.lean:439` exact. 3. Wiener–Ikehara hypothesis block `bound/hG/hG'/hpos` at :105–107 exact; `tendsto_sum_range_div` :693 (prior). 4. `differentiableAt_riemannZeta` `RiemannZeta.lean:139` exact. 5. openai `Nonvanishing.lean` :19 (Dirichlet) / :29 (ζ) exact. 6. tauceti `truncatedPerron_LSeries` :130 and `norm_truncatedPerron_LSeries_sub_sum_le` :229 exact. 7. MINOR: `zeta_growth` :102 and `zeta_growth_quarter` :109 exact, but "zeta_growth_right :143" — actual decl is `zeta_growth_right_at` :119 (name+line slip). 8. MINOR: "ψ never appears in zeta23" — `Hypotheses.lean:80` mentions "Mathlib's Chebyshev.psi indexing" (comment) and `Taper.psi` is an unrelated taper function; the substantive claim (no ψ-asymptotic statement) holds.

## 40-zeta-k-prime-derivative-zeros (R1) — 7/1/0 (minor deferred)
1. `Challenge/XiPrime.lean` :67/:72/:79/:86/:94/:102 — all six theorem lines exact. 2. `xiDerivZeros₀_rvm` `XiPrime/Final.lean:90` and `coeffMoments_flat_xi` (used) :123 exact. 3. `logDeriv_xi_one_sub` :292 / `logDeriv_xi_conj` :306 exact. 4. openai `IdealThetaXi.lean` :100/:232/:351/:412 and `XiBoundary.lean:75` — all exact. 5. NEG zeta23 `dedekind` → 0 ✓. 6. mathlib `DedekindZeta.lean:50/:57` exact; no derivative-zero file (only `RiemannZetaLogDeriv.lean`) ✓. 7. MINOR (DEFERRED — R9 appending): `zetaEntireCompletion` cited at `RiemannZeta.lean:27`; actual def :33 — the same locator error H fixed in `bridges/tauceti-contributions.md`; the dossier's *formula* is right. 8. `AnalyticLFunctionData` dual/reflection region :120–152 consistent (structure :82 prior pass).

## 41-q-deformed-eight-square-temperley-lieb (R1) — 6/2/0
1. `jonesDelta` :87, `jones` :146, `jones_sigma` :157 (`KnotTheory/TemperleyLieb.lean`) exact. 2. **Correction verified**: `TauCeti/Algebra/CayleyDickson/` exists (Artin/Basic/Imaginary/Quaternion) with `TauCeti.DivisionOctonionReal` (documented `Quaternion.lean:19,:43`) — tauceti does have octonions. 3. `MarkovBraid.eq_heckeTrace_of_skein` present in `KnotTheory/Hecke.lean` (docstring :27; cited :49 not line-pinned). 4. `spinRepEquivNegLineCoordinate` present in `Spin/LineSign.lean` (docstring :49; decl at cited :149 not separately pinned). 5. eth `phiQ/phi1-3` :126–133 and `signs` :261 (prior pass). 6. `trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp` `QuantumTrace.lean:41` (prior pass). 7. MINOR-ERROR: NEG "`rg 'eight.?square|Graves' TauCeti/` → 0" — actual 11 hits, including the substantive `CayleyDickson/Quaternion.lean` "Degen's eight-square identity" (norm multiplicativity — consistent with 41's own octonion correction and strengthens the q=1 host story; remaining hits CFSG/Green false positives). 8. MINOR-ERROR: NEG "openai → 0" — raw 333 hits, but ALL inspected are the substring `h**eight_square**` ("height_square" SLE identifiers); substantive absence holds; pattern hygiene poor (`Graves|rule of signs` also unanchored). openai TL hosts verified: `HarmonicArtin.TemperleyLieb` namespace `Circle.lean:7–60`; dilute-TL docstring `PhysicalWeights.lean:189`.

## 42-zeta-k-two-thirds-product-assembly (R1) — 7/1/0 (minor deferred)
1. `Challenge.lean` :131/:152/:163/:191/:205/:212 — all six submitted-theorem lines exact. 2. `ChallengeDeps` `zeroMult` :46, `Ncount` :55, `zeroMultL` :82 exact. 3. MINOR (DEFERRED): `zerosIn` cited :48; actual def :50 (the stale locator from survey/anthropics.md §1.1's pre-fix era). 4. `analyticOrderAt_mul` `Order.lean:548` exact (freshly verified this pass — matches R9's retraction note). 5. tauceti `Transfer.lean` :31/:40/:123 — all three "zero-density case (δ = 0)" lines exact; the "same words, prime-density meaning" characterization verified. 6. mathlib `DedekindZeta.lean:50/:57` exact. 7. `ZetaZeros.lean:37/:68` (prior). 8. NEG zeta23 `dedekind` → 0 ✓.

## 50-quasi-rh-truncated-window-constants (R2) — 7/1/0 (minor deferred)
1. openai `Nonvanishing.lean:29` (ζ) and :19 (Dirichlet) exact. 2. Comparator `DirichletSevenEighths.lean:8` = `theorem LFunction_ne_zero_of_seven_eighths_lt_re` exact. 3. zeta23 `Statement.lean:46 zerosIn`, `Defs.lean:120 ZeroConfig`, `:140 onLine` — exact. 4. MINOR (DEFERRED): `ThmD/Window.lean:33–35` for the concrete `phiD` def — :33–34 are `namespace` lines; `phiD` sits a few lines lower (its lemmas at :45/:50 are exact, so the def is ~:38–43). 5. XiPrime `ZeroCount/Y.lean:101,:177` and `Generic.lean:44` — the "1/8 hits are growth-lemma hypotheses" characterization exact. 6. `Parameters.lean:16–17` 1/8-arithmetic exact (CompactWeights :170 not separately pinned). 7. `zetaSeam` at `Statement/SeamClosed.lean:22` exact (`ZetaSeam.of_reflect zeta_reflect_zero zeta_mult_reflect` verbatim). 8. ThmD functional facts (:32/:35/:40–43/:53) exact via dossier-21 items.

## 60-border-rank-first-connector (R3) — 8/0/0
1. `rankOne` :22–24 and `RankAtMost` :25–27 (`ComplexDotPairing.lean`) exact. 2. `BorderRankAtMost` :228–230 — the closure definition verbatim. 3. `DegeneratesTo`/restriction :235–240 exact. 4. CW instance `borderRankAtMost : Tensor.BorderRankAtMost tensor 3` at `ComplexCWBoundary.lean:237–238` exact. 5. `exists_rankAtMost` :22 / `exactRank` :36 (`RankExponent.lean`) exact. 6. `.borderRankAtMost` route at `ComplexStageHierarchyResources.lean:186` exact. 7. NEG schonhage/strassen/laderman in `OAI/…/MatrixMultiplication/` → 0 ✓ (mathlib negatives prior-pass). 8. `Holor.cprank` :333 + `cprank_upper_bound` :336 (prior); the self-contained `Eq_1`-is-Strassen correction matches H's anthropics.md fix; `ComplexTensor.lean:24` second `rankOne` exact.

## Part 2 conclusion and deferred-fix register

0 WRONG across 64 items; the eight dossiers are citation-clean at the load-bearing level, and
all 16 re-run negations hold in substance (two with pattern-hygiene slips, 41 items 7–8).
**Deferred locator fixes (frozen files, R9 appending F4 sections — apply next task):**
- 10: Wrap `everyMachineCanBeWrapped` :34→:39, `decidesTM_of_wraps_counter` :54→:57; "13 space hits" → 1354 repo-wide.
- 11: `Meets.mono` :52→:56.
- 12: `omega_le_nine_quarters` :23–25→:28; `ClaimAtParameters.lean` :216→:214.
- 40: `zetaEntireCompletion` :27→:33.
- 42: `zerosIn` :48→:50.
- 50: `phiD` window def ":33–35" → ~:38–43.
**Pending sign-off (R5's dossier 21/22, not frozen but not in this task's fix list):**
- 21: "10 files" → 23 (quartic-in-XiPrime count); "cFun consumed nowhere outside Functional.lean" needs weakening.
- 22: `zeta_growth_right` → `zeta_growth_right_at` :119; "ψ never appears" → "no ψ-asymptotic" (comment mention exists).

---

# Part 3 (2026-11-09, night pass) — dossiers 30/31/32 (R7)

Citations only, READ-ONLY (R7 has moved to pilots/; files at 19:18–19:21 mtimes). Same method;
prior-pass hits marked. **Tallies: 30: 7/1/0 · 31: 8/0/0 · 32: 7/1/0 (aggregate 22 OK, 2 MINOR,
0 WRONG).** Fixes for these files go to the deferred register (not applied).

## 30-hall-parseval-boson-identification (R7) — 7/1/0
1. eth locators — OK: `zz` :54, `O1.zero` :126, `pairing` :131, `part` :140, `angle` :146, `y` :166 all exact (plus prior-pass :73/:89–90/:105/:149–175).
2. PaperIndex aliases — OK: `:2389 alias PaperIndex.operators := AppHalfPieces.lemmaQ`, `:2394 …dual := …lemmaDual` verbatim.
3. mathlib generators — OK: `psum` :351, `psumPart` :355, `hsymm` :312, `hsymmPart` :316 all exact; `RingTheory/MvPolynomial/WeightedHomogeneous.lean` exists (dossier spells it "Weightedhomogeneous").
4. tauceti anchors — OK: `hallInner` at `HallInner.lean:77` exact; `zPart` at `ClassSize.lean:77` exact; `NewtonIdentities.lean` exists under `RingTheory/MvPolynomial/Symmetric/` (the cited lemma :88 not line-pinned).
5. NEG mathlib — OK: `hallInner`/`Heisenberg`/`boson`/`schurPoly`/`omegaInvolution|symmetricInvolution` → 0/0/0/0/0 files, exactly as claimed.
6. NEG openai Heisenberg — MINOR-ERROR: claimed "256 files, all Hodge-conjecture groups/lattices" and co-occurrence with MvPolynomial/symmetric/power-sum "→ 0 files". Actual: **498** files mention Heisenberg, and the co-occurrence is **8 files** — all `OAI/MathematicalPhysics/Heisenberg/*` (physics: PinDensity, StablePolynomials, …) using polynomial machinery. No symmetric-function/Fock bridge exists (the claim's intent), but both counts/characterizations are off.
7. NEG eth — OK: `commutator|commute` in `proof/rates/ClauseBound/Boson/` → 0 files; `gaussLemmaDualNormedAddCommGroup` at `GaussLemma.lean:46` (the claimed 1 false positive) exact.
8. OAI↔tauceti edge — OK: `lean/lakefile.lean:33–34` literally `require TauCeti from git … @ "3bed7e37…"` — the dependency edge is real.

## 31-budgeted-split-meta-theorem (R7) — 8/0/0
1. eth `PrintedStatement` — OK: `StMono` :87, `eStar` :90 (`sInf {e | ∀ K₀, ∃ K ≥ K₀, Achievable K e}` verbatim), `StHalf` :94, and the `sInf ∅ = 0` pitfall comment at :169–172 exact.
2. `Levels.Gen.PartA` — OK: structure fields `logK` (closed form `(3x₀+6)·2^ℓ − 6ℓ − 2x₀ − 6` verbatim), `K_lt`, `K_le` (`K_{ℓ+1} ≤ K^10`), `e_ge`/`e_le` span :39–48 exactly.
3. eth end-game — OK: `Given.eStarZero` at `threesat/Given/End.lean:38`; `PaperIndex.levelHence` at `PaperIndex.lean:1145` exact.
4. 3sum-apsp Rc data — OK: `Rc` :2015, `lnΛ` :2011, `epsStar` :2018, `Sec4_Rc_*` :2319/:2325/:2334, `Sec4_epsStar_numeric` :2329 (prior + fresh).
5. `Eight.rho = 11/12` :99, `GroupingLemma` :157, `LevelProposition` :164 — OK (prior pass).
6. tauceti "Strassen" disambiguation — OK: `GromovProkhorov.lean:54` "the easy half of Strassen's theorem" verbatim (optimal transport, as the dossier says).
7. mathlib `Holor.CPRankMax` predicate family :253–260 — OK (prior pass).
8. NEG abstraction vocabulary — OK: `BudgetedSplit|LevelRecursion|speedup synthesis` over all four corpora → 0 files (re-run; the dossier's claimed lone "asymptotic sum" false positive is consistent with the Pseudodifferential phrase).

## 32-rc-savings-frontier (R7) — 7/1/0
1. Definitions — OK: `entropy` :2006, `lnΛ` :2011, `rhoC` :2021, `gammaOf` :2024 all exact.
2. Corollary-31 block — OK: `HasDataStructure` :3934, `theorem30Dom` :3985, `Theorem_30` :3994, `Theorem_30_wanted` :4002, `Corollary_31` :4014 all exact.
3. Lemma_11/Eq_6 — MINOR: `Lemma_11` at :752 exact, but `Eq_6` def is at **:763** (cited ":758–762" — the range covers only its docstring).
4. Table validators — OK: `ValidQueryEntry` :2040, `Table_2_query_valid` :2353 exact.
5. Pattern donor — OK: `ceiling_law256_signed` at `Signed.lean:94` (with `EnclOK` hypothesis) exact.
6. The lone "adaptive" hit — OK: `PaperStatements.lean:1536` "is non-adaptive: it produces all the instances…" verbatim.
7. NEG 3sum-apsp — OK: `frontier|phase transition` → 0 files; `sSup.*Rc`-optimality patterns → 0 (re-run).
8. NEG openai — OK: `savings` in `OAI/…/MatrixMultiplication/` → 0 files (re-run).

## Part 3 deferred additions (not applied)
- 30: Heisenberg counts 256→498; "co-occurrence 0"→8 (MathematicalPhysics family); restated negation needed.
- 32: `Eq_6` :758–762 → def at :763.

---

# Part 4 (2026-11-09, night) — dossiers 51/52 (R2; the last un-QA'd pair)

Citations only, READ-ONLY (51/52 at 19:12/19:15 mtimes). Same method. **Tallies: 51: 6/2/0 ·
52: 6/2/0.** Fixes → deferred register (R2 files).

## 51-omega-to-wordram-bit-bridge (R2) — 6/2/0
1. `omega_lt_source_constant` at `MatrixFields/Conclusions/AllFieldsBound.lean:17` — OK exact (uniform-field ω bound).
2. `Gate`/`eval`/`cost` at `MatrixMultiplication/Model.lean` :11/:22/:30 + `omega` :93 (prior) — OK (dossier's ":14–60" range covers eval/cost; inductive starts :11).
3. `strassenList` at `Spec/Sec3/Theorem17/Strassen.lean:81` and `strassenBound p j α β = 16^j·p·α·β` at `StrassenFacts.lean:148` — OK exact; note the real path of the latter is `Programs/Sec3/Theorem17/Hashing/StrassenFacts.lean` (dossier abbreviates to "Hashing/").
4. `Claim.lean` locators — MINOR-ERROR: MM-docstring "the number of ring operations…" is at :18 (cited :12); `bound17` :32 (cited :28); `ObeysBound17` :40 (cited :39); `claim17_of_host` :49 (cited :63). All four names and roles verified; four line pins off by 1–14.
5. openai word-RAM neighbors — OK: `DeterministicSum/Machine.lean` `ThreeSUM` :9, `wordWidth` :15, `wordModulus` :18; `VerifiedTableOrder.lean:97` "not a word-RAM primitive" comment exact.
6. NEG two-file word-RAM result + `coppersmith|winograd|laser` → 0 in 3sum-apsp — OK exact (re-run).
7. NEG "`rg 'Gate|Program' OAI/Computability` → 0" — MINOR-ERROR: actual **872** hits ("Program" matches ordinary identifiers); the intended claim (no Gate-based arithmetic-program model in Computability) is not established by this pattern as written.
8. `docs/107.md` "The result concerns arithmetic complexity, rather than bit complexity" (at :12) + round-2 §7 Pan block (:160+) — OK exact.

## 52-unified-ccr-fock-layer (R2) — 6/2/0
1. eth `Boson/Defs.lean` — OK: `Ker := Multiset ℕ → Multiset ℕ → ℤ` at :24 exact (cre/ann/nop/op/P m at :30–:48 consistent; not all separately displayed).
2. eth statement layer (`AppHalfPiecesStatement.lean:73–175`, `PaperIndex.dual :2394`) — OK (prior pass, exact).
3. `Boson/Half.lean` `Qk_eq` :69 — OK exact.
4. openai `CAR.lean` — OK: `Orbital`/`Space` :10–11, `create` :15–19, `annihilate` :20–21, `annihilate_anticommute`/`create_anticommute` :23/:33 — all exact.
5. Fock layer — MINOR: `NormalSquare.lean:10` is `annihilate_create_inner` (the dossier renders its statement as an `occupationInner` equation — same fact, name not as written); `ContractionBound.lean:27` is `annihilate_normSq` (dossier writes `annihilate_normSq_le`); :22 `sourcePairCreate_inner`, :43 `sourceFockHamiltonian_normal_square`, :49 `two_annihilate_normSq_le` exact.
6. `Main.lean:19 mainTarget_proved` + `Model.lean:56 MainTarget` — OK exact (path: `Analysis/Laughlin/Main.lean`).
7. tauceti — MINOR: Heisenberg count 35 files claimed, **33** actual; CAR dir = exactly 8 files incl. `Occupation.lean` (`carOccupationElement_add_swap` :106, docstring :32) — OK on content; NOTE: `UniversalEnveloping/PBW/Weighted/Heisenberg.lean` not found at the implied path (unverified).
8. NEG — OK: mathlib `canonical commutation|CCR` → 0; `Laughlin` in `OAI/RepresentationTheory/` → 0; dual-family/LemmaDual in `OAI/Analysis/Laughlin/` → 0 (all re-run, exact).

## Part 4 deferred additions
- 51: Claim.lean line pins (:12→:18, :28→:32, :39→:40, :63→:49); Gate|Program negation restatement (word-boundary/qualifier needed).
- 52: two name renderings (annihilate_create_inner, annihilate_normSq); Heisenberg 35→33; PBW/Weighted/Heisenberg path re-check.

---

# Part 5 (2026-11-09, final pass) — deferred-fix register APPLIED

All lanes out of candidates/ (in pilots/); fixes applied by H with erratum one-liners, each
re-verified true-as-written before editing: **10** (Wrap :39/:57; "13 space hits"→1,354
repo-wide, 2 sites), **11** (Meets.mono :56), **12** (omega_le_nine_quarters :28;
ClaimAtParameters :214), **40** (zetaEntireCompletion :33 + one_sub :53, 2 sites), **42**
(zerosIn :50), **50** (phiD window def ~:38–43), **30** (Heisenberg 498 files / 8-file
MathematicalPhysics co-occurrence restated), **32** (Eq_6 :763, 2 sites) — **12 edit sites
across 8 dossiers**. **41: no remaining locator error** — its two previously unpinned cites
verified exact (`eq_heckeTrace_of_skein` Hecke.lean:49 ✓, `spinRepEquivNegLineCoordinate`
LineSign.lean:149 ✓). Still open (R2's dossiers, not in this task's list, documented in
Part 4): 51's Claim.lean pins + Gate|Program restatement; 52's two name renderings +
Heisenberg 33 + PBW path. Deferred-fix register: CLOSED except 51/52.
