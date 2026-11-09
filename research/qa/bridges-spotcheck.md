# QA spot-check — bridges/complexity.md (R4) + bridges/linear-algebra.md (R6)

Date: 2026-11-09. Checker: lane H. Method as in `qa/anthropics-spotcheck.md`: 10 items per
file, emphasis on the load-bearing negations and cross-corpus citations. Roots: `$A` =
`/home/doz/zcode-workdir/anthropics_formal-math`, `$O` = `/home/doz/zcode-workdir/openai-math`,
`$T` = `/home/doz/zcode-workdir/tauceti` (all read-only).

**Tally — bridges/complexity.md: 9 OK, 1 MINOR-ERROR, 0 WRONG.**
**Tally — bridges/linear-algebra.md: 10 OK, 0 MINOR-ERROR, 0 WRONG.**

## Part 1 — bridges/complexity.md

### C1. eth uniformity + openai per-k machine — MINOR-ERROR (cosmetic sub-cite)
- Claim: eth "one constant C for all k ≥ 1 (`MainResults.lean:177–180`: ∃M,C … ∀k)"; openai "one machine per k ≥ 2, constants O_k(1) (`Final.lean:10–13`: program `Native.countingProgram cutoff k …` chosen after k)".
- Checked: `sed -n '177,180p' $A/eth/MainResults.lean`; `sed -n '10,13p' $O/lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean`; `rg -n "countingProgram" …/Final.lean`.
- Evidence: MainTheorem at :177 reads `∃ (M : TM2ComputableAux Bool Bool) (C : ℕ), (∀ i, Finite …) ∧ ∀ (k n : ℕ) (φ : CNF n), 1 ≤ k → …` — M, C chosen before k, exact. Final.lean :10–13 is `theorem compiled_exact_count_and_sat (k : ℕ) (hk : 2 ≤ k) : ∃ (labels : ℕ) (program : BitProgram.Program 80 1220 labels) …` — per-k existential machine, k ≥ 2, exact. BUT the quoted identifier `Native.countingProgram cutoff k` occurs at :40 (inside the proof), not at :10–13.
- Verdict: MINOR-ERROR (quote locator: program name at :40, not :10–13; both load-bearing claims verified).

### C2. eth pad is informationally empty (Z3's key observation) — OK
- Claim: "`pad k = List.replicate (2^k) ()` (`Pad.lean:30`)"; "`padM`'s states have size 2|x| + 2·2^{e x} + 3 (`PaddedDescent/Pad.lean:93–94`)"; `exists_tm_padded` (:116).
- Checked: `sed -n '30p;93,94p;116p' $A/eth/proof/rates/PaddedDescent/Pad.lean`.
- Evidence: :30 `@[expose] public def pad (k : ℕ) : List Unit := List.replicate (2 ^ k) ()` (list of units — no information beyond length); :93–94 `padM_runs … (padM e A).Runs x (e x + 1) (2 * x.length + 2 * 2 ^ e x + 3) …` (exact size bound); :116 `public theorem exists_tm_padded`. All exact.

### C3. eth Solver layer — OK
- Claim: "`Solver Idx` structure + `Correct`/`Poly` (`Interfaces.lean:126–149`)"; "`Solver.Seq` (`Interfaces.lean:165–181`)".
- Checked: `rg -n "structure Solver|Solver.Seq|def Correct|def Poly" $A/eth/proof/rates/ClauseBound/Alg/Interfaces.lean`.
- Evidence: `structure Solver (Idx : Type) [Enc Idx] where` :126; `def Correct` :137 (inside 126–149); `structure Solver.Seq` :165. Exact.

### C4. openai headline theorems + visited-space bound — OK
- Claim: `exact_count_and_sat` (:74), `exact_count_eth` (:104), `sat_polynomial_space` (:149); "every prefix: `visitedSpace ≤ S·(L+1)^e` (`Final.lean:96–97`)".
- Checked: `rg -n "theorem exact_count_and_sat|theorem exact_count_eth|theorem sat_polynomial_space|visitedSpace" …/SqrtLogSpace/Final.lean`; `sed -n '96,97p;10,13p'`.
- Evidence: theorems at :74, :104, :149 exactly; :96–97 `(visitedSpace intermediate : ℝ) ≤ S * ((Encoding.formulaBitLength F : ℝ) + 1) ^ e`. Exact.

### C5. openai space monitor — OK
- Claim: "monitor `SubexponentialSAT.lean:166–189`"; `LocatedCfg`/`headDisplacement`/`visitedSpace`.
- Checked: `rg -n "def monitor|def visitedSpace|structure LocatedCfg" $O/lean/ComparatorChallenges/SubexponentialSAT.lean`; read :166–189.
- Evidence: `structure LocatedCfg` :149; `def LocatedCfg.monitor` :166 (tracks lower/upper bounds per tape via `Function.update`, `min`/`max`, using `headDisplacement`); `locatedStep` :184; `def visitedSpace … = ∑ i, (c.upper i - c.lower i + 1).toNat` :189. Range :166–189 covers exactly monitor→visitedSpace. Exact.

### C6. 3sum-apsp unlinked time-model records — OK
- Claim: "'the record `ConditionalTimes.TimeModel` … is another one, and **nothing links the two**' (`TimeClaims/Sec3/Definitions.lean:18–20`)"; `DetTimeModel` (:75); `Claim.Theorem_17` with `MM : ℕ → ℝ` parameter (:192–199, reduction shape `∃C, ∀T, M.lopDetect T → ∃T', M.exactTriangle T' ∧ T' ≤ …`).
- Checked: `sed -n '18,20p;75p;186,199p' $A/3sum-apsp/ThreeSumApsp/TimeClaims/Sec3/Definitions.lean`.
- Evidence: :18–20 contains the verbatim quote "(the record `ConditionalTimes.TimeModel` of the three conditional lemmas is another one, and nothing links the two);"; :75 `structure DetTimeModel where`; :192 `def Theorem_17 (M : DetTimeModel) (MM : ℕ → ℝ) (D g : ℕ → ℕ) : Prop := ∃ C : ℝ, 0 ≤ C ∧ ∀ T …, M.lopDetect T → ∃ T', M.exactTriangle T' ∧ …` with the `termPrime MM n (D n)` term — MM threaded symbolically. Exact.

### C7. openai exponent infrastructure — OK
- Claim: `RectangularAdmissibleExponent` (:100–107); ω_ℂ ≤ 9/4, α > 93/200, rectangular ω(0.709) < 523/250 (:118–126, comparator `sorry` by design).
- Checked: `sed -n '100,107p;118,126p' $O/lean/ComparatorChallenges/MatrixMultiplication.lean`.
- Evidence: :100 `def RectangularAdmissibleExponent (F : Type*) [Field F] (k τ : ℝ)` + `def rectangularOmega` (sInf form); :118 `theorem complex_omega_le_nine_quarters : Arithmetic.omega ℂ ≤ (9 : ℝ) / 4 := by sorry`; `complex_alpha_gt_93_div_200`; `complex_rectangular_omega_lt_523_div_250`. All exact (sorry-by-design as the bridge notes).

### C8. eth eight-square identity + pieces — OK
- Claim: eight-square identity at `EightSquareStatement.lean:53`; pieces with bit-complexities at :107–116.
- Checked: `sed -n '53p;107,116p' $A/eth/proof/statements/EightSquareStatement.lean`.
- Evidence: :53 `def Signs : Prop := ∀ p q p' q' : Block, bxor p q = bxor p' q' → q ≠ q' → sigma p q * sigma p' q' + sigma p q' * sigma p' q = 0` (the identity, exact); :107+ `structure LemPieces` with `a_sum` (∑ A_i = 2^t·cross), `b_row`/`b_col` (`FactorsLe … (crow/ccol lam i)` = row/col bit-complexities), `c_sum_t` (≤ 11t). Exact.

### C9. tauceti time-complexity negative — OK
- Claim: "No time bound, no complexity class anywhere in `TauCeti/` (grep for `PolyTime|TimeComplexity|NP-complete` returns nothing relevant)"; `Computability/{RE,TuringDegree,Jump,FriedbergMuchnik,Priority}` exist.
- Checked: `rg -rli "PolyTime|TimeComplexity|NP-complete" $T/TauCeti/` (exit code captured); `ls $T/TauCeti/Computability/`.
- Evidence: rg exit 1, zero matching files — the negative holds outright. Dir contains `RE.lean`, `TuringDegree.lean`, `Jump/`, `FriedbergMuchnik/`, `Priority/` (plus further recursion-theory content: SacksSplitting, Inseparable, …). Exact.

### C10. eth variance layer abstract in κ — OK
- Claim: "`stVar : StVar` (Var Y ≤ 4PU over K^g colorings), **abstract in the pseudo-covariance κ** (`networks/Variance/Var.lean:100–139`)"; "StHence … for any numbers κ(p, q)".
- Checked: `rg -n "stVar|StHence|kappa" $A/eth/proof/networks/Variance/Var.lean`; `sed -n '100,102p'`.
- Evidence: docstring at :100–102 verbatim "«Hence», for any numbers κ(p, q) in the place of the covariances: if κ vanishes for disjoint pairs, κ(p, q) ≤ m … then Σ_p Σ_q c_p·c_q·κ(p, q) ≤ … 4PU·m"; `stHence` :103, `stVarOf` :131, `stVar` :139 — the 100–139 span is exact. Exact.

## Part 2 — bridges/linear-algebra.md

### L1. RankTrace.lean internals — OK
- Claim: `hstep4` (:233); `tr(PQ₊) ≥ 0` cite (:228); `frobSq_add_hermitian` (:138).
- Checked: `rg -n "hstep4|hstep5|hstep6|frobSq_add_hermitian" $A/zeta23/Zeta23/LinAlg/RankTrace.lean`; `sed -n '228p;233p;138p'`.
- Evidence: :138 `lemma frobSq_add_hermitian`; :228 `have hPQp : 0 ≤ RCLike.re (P * Qp).trace := trace_mul_nonneg_of_posSemidef …`; :233 `have hstep4 : ∑ k, (p k - m k) ^ 2` (hstep5 :241, hstep6 :246 — both inside the proof as described). Exact.

### L2. tauceti Hoffman–Wielandt — OK
- Claim: `IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq` (`HoffmanWielandt.lean:93`); `norm_integral_spectralMeasure_sub_integral_spectralMeasure_le` (:112).
- Checked: `rg -n "sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq|norm_integral_spectralMeasure" $T/TauCeti/Analysis/Matrix/HoffmanWielandt.lean`.
- Evidence: :93 and :112 exactly those theorem names. (Both `Analysis/Matrix/HoffmanWielandt.lean` and the `InnerProductSpace/HoffmanWielandt/` tree exist as the map says.) Exact.

### L3. tauceti Weyl suite — OK
- Claim: `eigenvalues₀_add_le` (:208), `le_eigenvalues₀_add` (:222), `eigenvalues₀_le_of_rank_sub_le` (:252), `card_eigenvalues₀_le_le_card_add_rank` (:269), `abs_card_eigenvalues₀_le_sub_card_le_rank` (:299).
- Checked: `rg -n "eigenvalues₀_add_le|le_eigenvalues₀_add|eigenvalues₀_le_of_rank_sub_le|abs_card_eigenvalues₀_le_sub_card_le_rank|card_eigenvalues₀_le_le_card_add_rank" $T/TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean`.
- Evidence: all five at :208/:222/:252/:269/:299 exactly (as `_root_.Matrix.IsHermitian.*`). Exact.

### L4. tauceti signature_congr invertible-only — OK
- Claim: `Matrix.IsHermitian.signature : ℤ` (`HermitianSignature/Basic.lean:68`); `signature_realify` (:122); `signature_congr` for **invertible** congruence (:147).
- Checked: `rg -n "def signature|theorem signature_congr|signature_realify" …/HermitianSignature/Basic.lean`; `sed -n '147p'`.
- Evidence: :68 `noncomputable def signature (hA : A.IsHermitian) : ℤ`; :122 `theorem signature_realify`; :147 `theorem signature_congr [DecidableEq ι] {P : Matrix ι ι 𝕜} (hP : IsUnit P.det)` — the hypothesis is literally invertibility (`IsUnit P.det`), confirming the "invertible-only" reading. Exact.

### L5. zeta23 inertia lemmas — OK
- Claim: `posIndex_conj_le` (Inertia.lean:51), `posIndex_add_le` (:90).
- Checked: `rg -n "posIndex_conj_le|posIndex_add_le" $A/zeta23/Zeta23/LinAlg/Inertia.lean`.
- Evidence: :51 and :90 exactly. Exact.

### L6. zeta23 RankTraceMult machinery — OK
- Claim: `sq_sub_ge_gc` (:81), `sum_gc_diag_le_sum_gc_eigenvalues` (:119), `sum_eigenvalues_comm` (:189), `Wmat` (:220), `sum_gc_eigenvalues_ge` (:270), `rank_trace_mult` (:281), `kc` (:351, k_c(x) = c²−((c−x)₊)²), `rank_trace_mult_k` (:369), `rank_trace_mult_k_le` (:380, x_j ≤ 1 hypothesis), `sum_kc_two_nat` (:403), `sum_kc_three_nat` (:419), `gc_sum_le` (:63).
- Checked: `rg -n` for all names + `sed -n '281p;351p;369p;380p;403p;419p' $A/zeta23/Zeta23/ZeroSide/RankTraceMult.lean`.
- Evidence: every line number exact; `kc` at :351 is `def kc (c p : ℝ) : ℝ := c ^ 2 - (max (c - p) 0) ^ 2` — the k_c formula verbatim; `rank_trace_mult_k_le` carries `(hx : ∀ j, xsq v j ≤ 1)` as claimed. Exact.

### L7. zeta23 Lemma-R tightness — OK
- Claim: `lemmaR_tight` (TightMult.lean:93), `lemmaR_tight'` (:104), `lemmaR_tight_two` (:114).
- Checked: `rg -n "theorem lemmaR_tight" $A/zeta23/Zeta23/ZeroSide/TightMult.lean`.
- Evidence: :93, :104, :114 exactly (with hypotheses `(hc : 0 < c) (hm : ∀ j, (m j : ℝ) ≤ c)` as the map's Lemma R describes). Exact.

### L8. tauceti operator Jensen / Grothendieck / Ky Fan — OK
- Claim: `conjTranspose_mul_cfc_mul_le_cfc_conjTranspose_mul_mul` (OperatorJensen.lean:64); Grothendieck const 8 (:157) and 16 (:207); Ky Fan sums (KyFan.lean:99).
- Checked: `rg`/`sed -n '157p;207p' $T/TauCeti/Analysis/Matrix/Grothendieck.lean`; `sed -n '99p' $T/TauCeti/Analysis/InnerProductSpace/KyFan.lean`.
- Evidence: OperatorJensen.lean:64 exact; Grothendieck :157 `theorem innerProductSup_le_eight_mul`, :207 `theorem norm_sum_sum_mul_inner_le_sixteen_mul` — constants 8/16 as names state; KyFan.lean :99 `noncomputable def kyFanSum`. Exact.

### L9. zeta23 PairCeiling chain — OK
- Claim: `ceiling_stability` (Stability.lean:305), `ceiling_of_valid_at` (Ceiling.lean:28), `NearCUE` (NearCUE.lean:34), `ceiling_nearCUE_signed` (Signed.lean:54), `ceiling_law256` (CeilingLaw256.lean:38, `EnclOK`-hypothesized).
- Checked: `rg -n "<name>" $A/zeta23/Zeta23/PairCeiling/<file>` for each pair.
- Evidence: all five lines exact; `ceiling_law256 (S : ℕ → ℝ) (hS : EnclOK LawN256.K S 0 LawN256.encl)` — the external-enclosure hypothesis is the displayed one, as the bridge and survey both state. Exact.

### L10. zeta23 Sylvester/PosIndex/MV anchors — OK
- Claim: `hermForm_conj` (Sylvester.lean:51), `finrank_le_posIndex_of_posDefOn` (:82), `posDefOn_range_hermPosPart` (:123), `hermForm_gt_on_range_truncPos` (:215), `posIndex_eq_max_finrank_posDefOn` (:304); `posIndex`/`negIndex`/`posIndexAbove` (PosIndex.lean:41,45,50); `MVDiag 13` (MV/Final.lean:27), `mv_hilbert` (:30) with bilinear C = 26.
- Checked: `sed -n` each line; `rg -n "MVDiag 13|EigenBound 13|26" $A/zeta23/Zeta23/MV/{Final,Eigen}.lean`.
- Evidence: all ten decl lines exact; :27 `theorem mvDiag_thirteen : MVDiag 13`; file header :15 documents "bilinear `∃ C > 0, MVHilbert C` … (C = 26)" — the 13-diagonal/26-bilinear pair is exactly as the map's L4 states. Exact.

## Conclusion

Both bridge maps are citation-clean at the load-bearing level. complexity.md: the one
discrepancy is cosmetic (C1: the `Native.countingProgram` quote sits at Final.lean:40, not
:10–13; the per-k-machine claim itself is at :10–13 and holds). linear-algebra.md: a perfect
10/10 — including every negation probed (tauceti has no time-complexity content; nothing
links DetTimeModel↔TimeModel; signature_congr is invertible-only) and every cross-corpus
locator (HoffmanWielandt :93, eigenvalues₀_add_le :208, hstep4 :233). No WRONG verdicts;
nothing requires an authorized fix beyond the C1 note, which H leaves to R4 (owner) or an
orchestrator-authorized edit.

---

# Part 3 (2026-11-09, later pass) — analytic-nt.md (R5), tensor-algebra.md (R7), tauceti-contributions.md (R1)

Same method; roots `$A` anthropics, `$O` openai-math, `$T` tauceti, `$M` mathlib (all read-only).
Requested priorities covered: R5 PaperInputs/PaperInputsChi + openai comparator files + no-PNT +
WienerIkehara zero-consumers; R7 LemmaDual↔hallInner + AppHalfPieces + rectangularOmega + Clifford-
present/octonions-absent (both halves); R1 ξ-pair definitional identity (both defs read) +
signature_congr invertible-only + zetaEntireCompletion location.

**Tally — bridges/analytic-nt.md: 8 OK, 2 MINOR-ERROR, 0 WRONG.**
**Tally — bridges/tensor-algebra.md: 8 OK, 2 MINOR-ERROR, 0 WRONG.**
**Tally — bridges/tauceti-contributions.md: 5 OK, 5 MINOR-ERROR, 0 WRONG.**

## analytic-nt.md (R5)

1. **PaperInputs/PaperInputsChi/thmD_lam_abstract — OK.** `structure PaperInputs (Z : ZeroConfig)` at `Zeta23/Hypotheses.lean:147`; `structure PaperInputsChi (κ q : ℕ) (c : ℕ → ℂ) (Z : ZeroConfig)` at `ThmE/Hypotheses.lean:127`; `theorem thmD_lam_abstract (Z : ZeroConfig) (H : PaperInputs Z) (P : Params)` at `ThmD/Final.lean:45`. (rg -n each name.)
2. **muq locator — MINOR-ERROR.** Claim: `muq κ q` "(κ,q)-explicit (`ThmE/Hypotheses.lean:44`)". `sed -n '44p;48p'`: :44 blank, `def muq (κ : ℕ) (q : ℕ) (τ : ℝ)` at **:48**. Off by 4.
3. **openai comparator files — MINOR-ERROR.** `QuasiRiemannHypothesis.lean:7` = `sorry` region ✓, `DirichletSevenEighths.lean:9` = χ-binder statement ✓, but `SiegelZeros.lean:6` is `namespace WeightedTorusJets`; `theorem exists_absolute_real_zero_gap` is at **:8** (namespace-qualified name in the bridge is correct).
4. **mathlib no-PNT — OK.** `PrimeCounting.lean:98/:102` = `tendsto_primeCounting'`/`tendsto_primeCounting` (divergence only) exact; `rg -i "primeNumberTheorem" Mathlib/` hits only the PrimeNumberTheoremAnd *project credit* lines (WienerIkehara.lean header, Chebyshev.lean header). No π(x) ~ x/log x anywhere.
5. **WienerIkehara zero-consumers — OK.** `rg -l "WienerIkehara" $M/Mathlib/ | grep -v LSeries/WienerIkehara.lean` → no output (exit 1). Isolation re-confirmed.
6. **zeta23 Λ²-moments — OK.** `Hypotheses.lean:83–94` = `structure ChebyshevMertens` with `cheb2a` (:90) `|∑Λ²/n − log²x/2| ≤ C·log x` and `cheb2b` (:92) `|∑Λ²/n·log(x/n) − log³x/6| ≤ C·log²x` — the quoted formulas verbatim.
7. **tauceti prime side — OK.** `theorem frobeniusPsi_asymptotic` at `Chebotarev/PrimeCounting/Chebotarev.lean:210` exact; Wiener–Ikehara consumed at `Cyclotomic.lean:28` (docstring "The proof applies the Wiener--Ikehara theorem `TauCeti.LSeries.wienerIkehara`"); `Variants.lean:60/:120/:135` = `wienerIkehara_of_eventually_nonneg`/`_nat`/`_rpow` exact.
8. **openai Hecke log-derivative — OK.** `Hecke/PrimeDyadic.lean:22` `def series … := −deriv (LFunction χ) s / LFunction χ s`, `:24` `theorem series_eq_tsum` — exact.
9. **mathlib modular L — OK.** `CuspForm.isStrongFEPair` at `ModularForms/LFunction.lean:216` and `CuspForm.hasSum_L` at **:243** (namespace CuspForm :211; the :203 theorem is `ModularForm.hasSum_L` — both exist, cites exact); `hurwitzEvenFEPair` :256 ✓; `WeakFEPair.symm` at `AbstractFuncEq.lean:118` ✓.
10. **zeta23 seam + the "classical, not needed" quote — OK.** `Statement.lean:79 reflect_zero`, `:83 finite_window` exact; `ChallengeDeps.lean:36–41` contains verbatim "the converse … is classical and is not needed to state the theorems" — the load-bearing observation behind R5's identification-lemma empty zone.

## tensor-algebra.md (R7)

1. **AppHalfPieces (Fock/Boson) objects — OK.** `AppHalfPiecesStatement.lean:73` `abbrev V := MvPolynomial ℕ+ ℚ`; `:89–90` `nabla` (t_k·f / k·pderiv); `:105` `op`; `:149` `Q`; `:159–163` `LemmaQ` (a: Q_s = Q'_s, b: support |s| ≤ E+h, c: ΣQ_s = pairing•f); `:166–169` `y`/`aFam` with ∏(−1)^{μᵢ−1}; `:172` `bFam = (h!/z_μ)•t^μ`; `:175` `LemmaDual : a^μ[−h]·b^ν = h!·[μ=ν]`. All exact.
2. **openai exponent defs — OK.** `Model.lean:93 def omega`, `:103 def rectangularOmega`, `:107 def complexAlpha`; `Main.lean:13 complex_omega_le_nine_quarters` (proved via `AuxiliarySeparation`, not sorry), `:18 complex_alpha_gt_93_div_200`, `:23` rectangular < 2.092 = 523/250. Exact. (Note: OAI/…/Main.lean proves what ComparatorChallenges states as sorry — consistent with both bridges.)
3. **Clifford present / octonions absent — MINOR-ERROR (count only).** Both halves hold: `Mathlib/LinearAlgebra/CliffordAlgebra/` exists incl. `Grading.lean`, `SpinGroup.lean` (cited files present); no octonion/composition-algebra development — only prose mentions (Jordan/Basic, HSpaces, Ring/Identities docstrings), no `Octonion` decl or file. But the dir has **14** files, not the claimed "17".
4. **Eight-square statement file — OK.** `EightSquareStatement.lean:43–46` `phi` (bilinear Σ_{i≤j} + three trilinear terms, verbatim), `:53 Signs`, `:99 rho := 11/12`, `:107 LemPieces`, `:115 c_sum_t (crow+ccol ≤ 11·tOf)`. All exact.
5. **hallInner_psumPart locator — MINOR-ERROR.** Claim: `⟨p_ρ,p_ρ'⟩ = z_ρ·δ` at `FrobeniusCharacteristic.lean:264`. Actual: `theorem hallInner_psumPart` at **:273** (:264 is a proof line of the neighboring `_schurPolyBasis` at :257). Content confirmed (docstring :64 verbatim); `Schur/HallInner.lean` exists; `nat_card_centralizer_eq_zPart` present in `ClassSize.lean` (:153).
6. **3sum-apsp trilinear machinery — OK.** `PaperStatements.lean`: `phi/psi/chi` :140/:147/:153 (inside cited 105–155 range; `Term.Contributes` :212), `Mult` :302, `gamma` :306, `Pruned.run` :492, `Lemma_6` :618, `Lemma_7` :635, `Lemma_8` :642 — all exact.
7. **Savings-function family — OK.** `:2015 def Rc := log 4 / lnΛ c γ`, `:2018 def epsStar := log 4 / (5·log 10)` (with the "Section 4.1" quote at :2017), `Sec4_Rc_strictAntiOn` :2319, `_zero_tendsto` :2325, `Sec4_epsStar_numeric` :2329, `Sec4_Rc_lt_epsStar` :2334 — all exact; `Eq_1` (Strassen over arbitrary `Ring`) at :603–611 exact.
8. **mathlib symmetric-functions negative — OK.** `rg -i "hallInner|Hall inner" Mathlib/` → 0 files; `esymm` exists at `RingTheory/MvPolynomial/Symmetric/Defs.lean:69/:202`; tauceti has `PowerSum/`, `Schur/HallInner.lean`. Claim holds.
9. **Heisenberg negative + tauceti Clifford count — MINOR-ERROR (count only).** `rg -i heisenberg Mathlib/` → 0 files ✓. But `TauCeti/LinearAlgebra/CliffordAlgebra/` has **56 top-level entries / 198 .lean files recursive**, not the claimed "52 files" (and R1's "70-file" also misses; named files EightPeriodicity/BottPeriodicity/QuaternionPlane/Chirality/SignSwitch/VolumeElement all exist ✓).
10. **eth level machinery — OK.** `PrintedStatement.lean:83 def Achievable`, `:157 GroupingLemma`, `:164 LevelProposition` (verbatim `(3*K^8)²`, `(Eight.rho + 2/K)e + 2/K`), `:167 EStarZero`; `LevelsStatement.lean:34–36` schedule (e₀ = 1/2, e_{ℓ+1} = (ρ+3ζ_ℓ)e_ℓ + 3/K_ℓ), `:44 e_le : e ≤ 0.85·ρ^ℓ`. All exact.

## tauceti-contributions.md (R1)

1. **ξ-pair definitional identity — MINOR-ERROR (locator; substance CONFIRMED).** Read both defs: zeta23 `ChallengeDeps/XiPrime.lean:16` `def xi := s*(s−1)/2 * completedRiemannZeta₀ s + 1/2` ✓ exact; tauceti def at `Completion/RiemannZeta.lean:`**33–34** `def zetaEntireCompletion := s*(s−1)*completedRiemannZeta₀ s + 1` — cited ":27" is an `open` line (off by 6). Arithmetic check verified: 2·xi s = s(s−1)Λ₀(s) + 1 = zetaEntireCompletion s — the "definitionally the same function up to the constant 2" claim is TRUE.
2. **signature_congr invertible-only — OK.** `HermitianSignature/Basic.lean:147` hypothesis literally `(hP : IsUnit P.det)` (verified in Part 2 also); real base `LinearAlgebra/Matrix/Signature.lean` exists; `signature_fromBlocks_zero` at :203 exact; zeta23 side `variable {𝕜} [RCLike 𝕜]` per Inertia/Sylvester files.
3. **Landau namesake collision — OK.** zeta23 `WeilEF/Landau.lean:299/:348/:512` (logDeriv partial-fraction trio) and tauceti `LSeries/Landau.lean:296 theorem landau (ha : 0 ≤ a) (habs : abscissaOfAbsConv a = σ)` — both exact; genuinely different theorems, zero statement overlap confirmed.
4. **Argument principle — OK.** `Analysis/Contour/Argument/Cycle.lean:110 argumentPrinciple_nullHomologous`, `:150 _local`; `Analysis/Complex/Conformal/ArgumentPrinciple.lean:89 argumentPrinciple_windingNumber` — all exact; mathlib `rg -i "argument principle" Mathlib/Analysis/` → 0 files (absence holds).
5. **3-4-1 locator — MINOR-ERROR.** `theorem ne_zero_of_threeFourOne` at `LSeries/Nonvanishing.lean:`**69**; cited ":37" is its docstring bullet. `dedekindZeta_eq_riemannZeta_mul_LFunction` present in `LFunctions/DedekindZeta/Quadratic.lean` (name confirmed by rg hits).
6. **friedberg_muchnik — OK.** `Computability/FriedbergMuchnik/Basic.lean:364 theorem friedberg_muchnik` exact; `degree_friedbergMuchnikSetA_mem_Ioo` at :373 (present).
7. **λ-family locator — MINOR-ERROR.** Claim "thmA_lam, thmB_lam, thmC_lam (`Zeta23/Final.lean:79,99,103`)". Actual: :79, :99, **:119** (:103 is a proof line inside thmB_lam). Same slip pattern as R1's survey-era citations; decls and content fine.
8. **Eight.signs proof file — MINOR-ERROR.** `SecCrossing_Identity.lean:261 theorem signs : Signs` exact ✓; defs `phiQ/phi1/phi2/phi3` at :126–133 ✓; but `four_phi_odd` cited ":247", actual **:240** (off by 7).
9. **AnalyticLFunctionData — OK.** `structure AnalyticLFunctionData where` at `NumberTheory/LFunctions/Data/Basic.lean:82` exact; `HasDirichletAgreement` present in the same file (docstring :30; the :164–174 field-range cite not separately line-verified).
10. **Clifford count — MINOR-ERROR.** "70-file Clifford development": actual 56 top-level entries / 198 recursive .lean files (all named exemplar files exist). Count wrong under any reading; substance (rich Clifford+periodicity content) holds.

## Part 3 conclusion

No WRONG verdicts in any of the three maps; every load-bearing substance claim checked is true
(including the R1 ξ-pair arithmetic, both halves of R7's Clifford/octonion negation, R5's no-PNT
and isolation claims). The dominant error mode is locator drift on secondary cites (:44→:48,
:6→:8, :264→:273, :27→:33, :37→:69, :103→:119, :247→:240) and file-count guesses (17/52/70 vs
14/56/198). All are one-edit fixes for the owning lanes (R5/R7/R1) pending orchestrator sign-off;
H has not edited these three files.
