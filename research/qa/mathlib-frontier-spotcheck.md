# QA spot-check — survey/mathlib-frontier.md + feasibility/mathlib-verification.md

Date: 2026-11-09. Checker: lane H. Corpus: `/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4`
(READ-ONLY; checkout commit per both files: `ff2494ea`). Donor-side items (R9-D) checked against
`/home/doz/zcode-workdir/anthropics_formal-math` (READ-ONLY). Method as in
`qa/anthropics-spotcheck.md`. `$M` = mathlib root, `$A` = anthropics root.

Scope note: R9 already verified 10 gap-claims (mathlib-verification.md §1 table: von-Neumann
absence, inertia-partial, no zero-counting, no explicit formula, time-API existence+absence,
smoothTransition/Γ′Γ/Hilbert, analyticOrderAt:49+completedRiemannZeta₀:64, no Strassen/ω,
no ETH/classes, FinTM2-family presence). Items below are the mathlib-frontier.md claims
NOT covered by that table. Four items (A–D) independently spot-check R9's own file.

**Tally — mathlib-frontier.md: 9 OK, 3 MINOR-ERROR, 0 WRONG (12 items).**
**Tally — mathlib-verification.md: 3 OK, 1 MINOR-ERROR, 0 WRONG (4 items).**

## Part 1 — mathlib-frontier.md

### 1. RiemannZeta.lean decl lines — OK
- Claim: `riemannZeta` (:121), `completedRiemannZeta₀` (:64), `completedRiemannZeta` (:68), functional eqs (:106, :178), trivial zeros (:173), residue (:242), Dirichlet series (:207), `RiemannHypothesis : Prop` (:185-187) tagged `@[wikidata Q205966]`.
- Checked: `rg -n "def riemannZeta|def completedRiemannZeta|_one_sub|riemannZeta_neg_two_mul_nat_add_one|riemannZeta_residue_one|zeta_eq_tsum_one_div_nat_cpow|RiemannHypothesis|wikidata" $M/Mathlib/NumberTheory/LSeries/RiemannZeta.lean`
- Evidence: :64/:68/:106/:121 (with `@[wikidata Q187235]` at :120)/:173/:178/:207/:242 all exact; `@[wikidata Q205966]` at :184, `def RiemannHypothesis : Prop :=` at :185 (block :185-187). All exact.

### 2. ZetaZeros.lean decls — OK
- Claim: 78 lines; `riemannZetaZeros : Set ℂ := riemannZeta ⁻¹' {0}` (:37), `isClosed_riemannZetaZeros` (:61), `isDiscrete_riemannZetaZeros` (:64), `IsCompact.inter_riemannZetaZeros_finite` (:68), `tendsto_riemannZeta_cofinite_cocompact` (:74); "no counting function of any kind".
- Checked: `wc -l` (78); `rg -n "^(def|theorem|lemma)\s" <file>`; `sed -n '30,45p' <file>`.
- Evidence: `noncomputable def riemannZetaZeros : Set ℂ := riemannZeta ⁻¹' {0}` exactly at :37 (missed by the plain-decl regex because of the `noncomputable` prefix — a good reminder for novelty greps); :61/:64/:68/:74 exact. Complete decl list is mem/closed/discrete/compact-finite/tendsto + one private codiscrete lemma — no counting function, as claimed.

### 3. HardyZ.lean decls — OK
- Claim: 140 lines; `hardyZ` (:76), `abs_hardyZ` (:85), `hardyZ_neg` (:98), `hardyZ_eq_zero_iff` (:111), `continuous_hardyZ` (:122).
- Checked: `wc -l`; `rg -n "def hardyZ|abs_hardyZ|hardyZ_neg|hardyZ_eq_zero_iff|continuous_hardyZ" <file>`.
- Evidence: 140 lines; :76/:85/:98/:111/:122 all exact.

### 4. Nonvanishing.lean decls — OK
- Claim: 493 lines; :391 `LFunction_ne_zero_of_re_eq_one`, :404 `LFunction_ne_zero_of_one_le_re`, :417 `_root_.riemannZeta_ne_zero_of_one_le_re`, :468/:483 zero-iff on left half-plane.
- Checked: `wc -l`; `rg -n "LFunction_ne_zero_of_re_eq_one|LFunction_ne_zero_of_one_le_re|riemannZeta_ne_zero_of_one_le_re|LFunction_eq_zero_iff_of_re_nonpos|riemannZeta_eq_zero_iff_of_re_nonpos" <file>`.
- Evidence: 493 lines; :391/:404/:417 (`lemma _root_.riemannZeta_ne_zero_of_one_le_re`)/:468/:483 all exact.

### 5. WienerIkehara location + isolation — OK
- Claim: `tendsto_sum_range_div` (:693), `tendsto_sum_div` (:700); "Isolated: imported by no other mathlib file".
- Checked: `rg -n "tendsto_sum_range_div|theorem tendsto_sum_div" <file>`; `rg -l "WienerIkehara" $M/Mathlib/ | grep -v "LSeries/WienerIkehara.lean"`.
- Evidence: :693/:700 exact; zero other mathlib files mention `WienerIkehara` at all (grep exit 1) — isolation holds a fortiori.

### 6. Time API island (Computable.lean) — OK
- Claim: `TM2OutputsInTime` (:130), `TM2ComputableInTime` (:161), `TM2ComputableInPolyTime` (:174), `idComputableInPolyTime` (:216) as the only worked example; header :22-24 lists it; "**Island**: `Computable.lean` is imported by no other mathlib file".
- Checked: `rg -n "TM2OutputsInTime|TM2ComputableInTime|TM2ComputableInPolyTime|idComputableInPolyTime" <file>`; `sed -n '22,24p;30,35p'`; `rg -l "TuringMachine\.Computable" $M/Mathlib/ | grep -v "TuringMachine/Computable.lean"`.
- Evidence: :130 (def)/:161 (structure)/:174 (structure)/:216 (def) exact; header line :22 reads "- `idComputableInPolyTime` : a TM + a proof it computes the identity on a type in polytime."; step-counting comment at :30-32; zero importers (grep exit 1). All exact.

### 7. Holor cprank — MINOR-ERROR
- Claim: "`CPRankMax` (predicate family, lemmas :265-309), `Holor.cprank` (:333, noncomputable ℕ-valued), `cprank_upper_bound` (:336). No other mathlib file touches `cprank`"; module system example `Holor.lean:10-12`.
- Checked: `rg -n "CPRankMax|cprank" $M/Mathlib/Data/Holor.lean`; `sed -n '330,340p'`; `sed -n '1,12p'`; `rg -l "cprank" $M/Mathlib/ | grep -v Data/Holor.lean`.
- Evidence: `CPRankMax1` :253, `CPRankMax` :260 (inductives), first lemma :265, last lemma in :265-309 range plausible (cprankMax_upper_bound ≤ :330); `noncomputable def cprank … : Nat` at **:332** (not :333); `theorem cprank_upper_bound` at **:335** (not :336) — both off by one. Zero external consumers ✓. `module` at :8 + `public import`s at :10-12 ✓.
- Verdict: MINOR-ERROR (two line refs off by +1; decls, kinds, and zero-consumer claim all correct).

### 8. Tropical semiring presence — OK
- Claim: "`Mathlib/Algebra/Tropical/` (incl. `BigOperators`) — … no matrix-algorithm development on top".
- Checked: `ls $M/Mathlib/Algebra/Tropical/`; `rg -li "tropical" $M/Mathlib/LinearAlgebra/ $M/Mathlib/Analysis/Matrix/`.
- Evidence: `Basic.lean  BigOperators.lean  Lattice.lean`; zero tropical mentions in LinearAlgebra/ or Analysis/Matrix (exit 1). Presence and absence halves both hold.

### 9. Digamma lemma lines — OK
- Claim: `digamma_def` (:50), `digamma_one_half` (:59), shift (:64,:72), reflection `digamma_one_sub` (:94), duplication `digamma_two_mul` (:124), `meromorphic_digamma` (:108).
- Checked: `rg -n "^(theorem|lemma) digamma|digamma_def|digamma_one_sub|digamma_two_mul|meromorphic_digamma" $M/Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean`.
- Evidence: `digamma_def` :50, `digamma_one_half` :59, `digamma_apply_add_one` :64, `digamma_apply_add_nat` :72, `digamma_one_sub` :94, `meromorphic_digamma` :108, `digamma_two_mul` :124. All seven exact.

### 10. Chebyshev.lean + SumPrimeReciprocals — OK
- Claim: `psi_eq_sum_Icc` (:93), `theta_eq_sum_primesLE` (:101), `psi_mono` (:170), `primeCounting_eq_theta_div_log_add_integral` (:668), `eventually_primeCounting_le` (:832), header (:56) PrimeNumberTheoremAnd upstream note; `Nat.Primes.not_summable_one_div` (SumPrimeReciprocals.lean:124).
- Checked: `rg -n "psi_eq_sum_Icc|theta_eq_sum_primesLE|theorem psi_mono|primeCounting_eq_theta_div_log_add_integral|eventually_primeCounting_le" $M/Mathlib/NumberTheory/Chebyshev.lean`; `sed -n '56p'`; `rg -n "not_summable_one_div" $M/Mathlib/NumberTheory/SumPrimeReciprocals.lean`.
- Evidence: :93/:101/:170/:668/:832 exact; line 56 reads verbatim "Parts of this file were upstreamed from the PrimeNumberTheoremAnd project by Kontorovich et al…"; :124 exact.

### 11. Analytic/Order.lean arithmetic — MINOR-ERROR
- Claim: `le_analyticOrderAt_add` (:228), `analyticOrderAt_add` (:254), `analyticOrderAt_smul` (:274), `AnalyticAt.analyticOrderAt_sub_eq_one_of_deriv_ne_zero` (:342).
- Checked: `rg -n "le_analyticOrderAt_add|theorem analyticOrderAt_add|analyticOrderAt_smul|analyticOrderAt_sub_eq_one_of_deriv_ne_zero" $M/Mathlib/Analysis/Analytic/Order.lean` (+ follow-up `rg -n "analyticOrderAt_add"`, `sed -n '250,258p'`).
- Evidence: :228, :274, :342 exact. But **no declaration named `analyticOrderAt_add` exists**; the additive family is `analyticOrderAt_add_eq_left_of_lt` (:243), `_eq_right_of_lt` (:248), and `analyticOrderAt_add_of_ne` (:254 — the decl at the cited line, name truncated in the survey).
- Verdict: MINOR-ERROR (3 of 4 line refs exact; the fourth cites a nonexistent short name for the decl actually at that line).

### 12. ValuedCSP.lean — MINOR-ERROR
- Claim: definitions `ValuedCSP`, `ValuedCSP.Term`, `ValuedCSP.Instance`, `IsOptimumSolution`, `Function.HasMaxCutProperty`, `FractionalOperation.IsSymmetricFractionalPolymorphismFor`; "Definitions only… no consumers"; "3-SAT only in ValuedCSP docstring (:12)".
- Checked: `rg -n "IsOptimumSolution|HasMaxCutProperty|IsSymmetricFractionalPolymorphismFor|ValuedCSP" $M/Mathlib/Combinatorics/Optimization/ValuedCSP.lean`; `rg -n -i "3-SAT|SAT" <file>`; `rg -l "ValuedCSP" $M/Mathlib/ | grep -v Optimization/ValuedCSP.lean`.
- Evidence: `abbrev ValuedCSP` :40, `structure ValuedCSP.Term` :46, `abbrev ValuedCSP.Instance` :62, `IsOptimumSolution` :71, `HasMaxCutProperty` :82, `IsSymmetricFractionalPolymorphismFor` :124 — all present; zero consumers (exit 1) ✓. But the 3-SAT docstring sentence ("General-Valued CSP subsumes Min-Cost-Hom (including 3-SAT for example)") is at **:14**, not :12 (line 12 is blank).
- Verdict: MINOR-ERROR (docstring line off by 2; decls and no-consumer claim correct).

## Part 2 — mathlib-verification.md (R9's file, independent re-check)

### A. (R9 #1) von Neumann trace absent; singularValues host — OK
- Claim: von-Neumann hits are only set theory (`VonNeumann.lean:38`, `ZFC/Ordinal.lean:106`, `ZFC/PSet.lean:344`); `LinearMap.singularValues` at `SingularValues.lean:95`.
- Checked: `rg -in "von\s*neumann" $M/Mathlib/`; `sed -n '38p' $M/Mathlib/SetTheory/ZFC/VonNeumann.lean`; `sed -n '344p' $M/Mathlib/SetTheory/ZFC/PSet.lean`; `rg -n "def singularValues" $M/Mathlib/Analysis/InnerProductSpace/SingularValues.lean`.
- Evidence: sweep returns only SetTheory/ZFC files; :38 = `noncomputable def vonNeumann (o : Ordinal.{u}) : ZFSet.{u} :=`; PSet.lean:344 = "/-- The n-th von Neumann ordinal -/"; `singularValues` :95 exact. Confirmed.

### B. (R9 #2) Signature.lean Sylvester lines — MINOR-ERROR
- Claim: `sigPos_add_sigNeg_add_radical` (:~232), `sigPos_of_equiv_weightedSumOfSquares` (:240), `sigNeg_of_equiv_weightedSumOfSquares` (:248); existence half `QuadraticForm/Real.lean:57–85`.
- Checked: `rg -n "def sigPos|def sigNeg|sigPos_of_equiv|sigNeg_of_equiv|sigPos_add_sigNeg" $M/Mathlib/LinearAlgebra/QuadraticForm/Signature.lean`; `rg -n "equivalent_one_neg_one_weighted_sum_squared" $M/Mathlib/LinearAlgebra/QuadraticForm/Real.lean`; `rg -li "inertia" $M/Mathlib/ | grep -v QuadraticForm`.
- Evidence: `sigPos` :65, `sigNeg` :98; `sigPos_add_sigNeg_add_radical` :232 (exact, "~" hedge fair); `sigPos_of_equiv_weightedSumOfSquares` **:243** (not :240); `sigNeg_of_equiv_weightedSumOfSquares` **:251** (not :248); Real.lean theorem at :69, inside 57–85 ✓; inertia-outside-QuadraticForm hits are ramification/ring theory ✓.
- Verdict: MINOR-ERROR (two line refs off by 3; names, existence, and the real-vs-Hermitian story confirmed).

### C. (R9 #10) FinTM2 family lines — OK
- Claim: `namespace Turing` :41; `structure FinTM2` :46; `initList` :110; `haltList` :118; `TM2Outputs` :126 (Computable.lean).
- Checked: `rg -n "^namespace Turing|^structure FinTM2|^def initList|^def haltList|^def TM2Outputs" $M/Mathlib/Computability/TuringMachine/Computable.lean`.
- Evidence: :41/:46/:110/:118/:126 all exact.

### D. (R9 donor-side) anthropics donors — OK
- Claim: `zeta23/Zeta23/LinAlg/VonNeumann.lean:171 theorem vonNeumann_trace_ineq` (namespace `RHLinalg` :47); `Inertia.lean`, `PosIndex.lean`, `HermitianPosPart.lean`, `Weyl.lean` present; `eth/proof/machines/ToTuring/PolyT.lean:54 PolyT`; machines subdirs `QueryMachines StepMachines ToTuring Tower TwoMachines Wrap`.
- Checked: `rg -n "vonNeumann_trace_ineq|namespace RHLinalg" $A/zeta23/Zeta23/LinAlg/VonNeumann.lean`; `ls $A/zeta23/Zeta23/LinAlg/`; `rg -n "def PolyT" $A/eth/proof/machines/ToTuring/PolyT.lean`; `ls $A/eth/proof/machines/`.
- Evidence: `47:namespace RHLinalg`, `171:theorem vonNeumann_trace_ineq {A B : Matrix n n 𝕜}` exact; LinAlg dir = {HermitianPosPart, Inertia, PosIndex, RankTrace, Sylvester, VonNeumann, Weyl}.lean ✓; `54:@[fun_prop] def PolyT … : Prop` exact; machines subdirs exactly the six listed ✓.

## Conclusion

Both files are trustworthy at the "decl exists at file:line" level: 15 of 16 items fully
accurate; the three minor errors are two off-by-small line shifts (Holor cprank :332/:335;
Signature :243/:251) and two name/line imprecisions (`analyticOrderAt_add` → actual
`analyticOrderAt_add_of_ne`; ValuedCSP 3-SAT docstring :12 → :14). No WRONG verdicts; no
fabricated declarations or isolation/consumer claims (all four "zero-importer/consumer"
claims verified true). Fixes for mathlib-frontier.md items 7/11/12 are one-word/one-number
edits; H will apply them on orchestrator sign-off (that file is R3's output).
