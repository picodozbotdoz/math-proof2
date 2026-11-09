# QA spot-check — research/survey/anthropics.md

Date: 2026-11-09. Checker: lane H. Corpus verified against:
`/home/doz/zcode-workdir/anthropics_formal-math` (READ-ONLY; git `16a5ce4` per survey).
Method: 12 specific citations sampled from the survey for a mix of claim types
(file:line, decl-name, sorry-line, import). All commands run from the corpus root;
`$C` = `/home/doz/zcode-workdir/anthropics_formal-math`.

**Tally: 11 OK, 1 MINOR-ERROR, 0 WRONG.**

## Items

### 1. Rank–trace inequality location — OK
- Claim: "the **rank–trace inequality** (`Zeta23/LinAlg/RankTrace.lean:163 rank_trace_ineq`)"
- Checked: `rg -n "rank_trace_ineq" $C/zeta23/Zeta23/LinAlg/RankTrace.lean`
- Evidence: first hit `163:theorem rank_trace_ineq {P Q : Matrix n n 𝕜}` (also used at :264). Line exact.

### 2. 3sum-apsp EndStatement.lean shape — OK
- Claim: "`EndStatement.lean` 139 lines, imports nothing" and "`Problem.SolvedInTime` … (`EndStatement.lean:67`)"
- Checked: `wc -l $C/3sum-apsp/EndStatement.lean`; `rg -n "^import|^prelude" $C/3sum-apsp/EndStatement.lean` (no match, exit 1); `rg -n "SolvedInTime" …`
- Evidence: 139 lines; zero import/prelude lines; `67:def Problem.SolvedInTime (Q : Problem) (r : Rat) : Prop :=`. All three sub-claims exact.

### 3. Headline theorem line numbers (3sum-apsp) — OK
- Claim: ε_T = 0.0017 (line 82); `Theorem_19` (line 85); `Theorem_22_3SUM` (line 95); `Theorem_22_MinPlus` (line 106); `Theorem_22_APSP` (line 125); `Corollary_39_ZeroWeight` (line 136)
- Checked: `rg -n "Theorem_19|Theorem_22_3SUM|Theorem_22_MinPlus|Theorem_22_APSP|Corollary_39_ZeroWeight|0\.0017" $C/3sum-apsp/EndStatement.lean`
- Evidence: `82:def ε_T : Rat := 0.0017`, `85:def Theorem_19 : Prop :=`, `95:`, `106:`, `125:`, `136:` — all six line numbers exact.

### 4. 3sum-apsp trusted-file sorries — OK
- Claim: "`Challenge/EndStatement.lean:59,64,69,74,80`" (count 5)
- Checked: `rg -n "sorry" $C/3sum-apsp/Challenge/EndStatement.lean`
- Evidence: exactly five hits, at 59, 64, 69, 74, 80. No others.

### 5. eth trusted-file sorries — OK
- Claim: "`eth/Challenge.lean:13,17`" (count 2)
- Checked: `rg -n "sorry" $C/eth/Challenge.lean`
- Evidence: hits at 13 and 17 (plus a comment mention at line 8, not a `sorry` token). Exactly two proof-placeholders, as claimed.

### 6. zeta23 sorry inventory — MINOR-ERROR
- Claim: "`Challenge.lean:133–229`; `Challenge/XiPrime.lean:69–105`" with counts 17 + 6 = 23.
- Checked: `rg -n "sorry" $C/zeta23/Challenge.lean`; `rg -n "theorem|sorry" $C/zeta23/Challenge/XiPrime.lean`
- Evidence:
  - `Challenge.lean`: 17 `sorry` tokens, at 133,138,144,149,154,159,165,171,176,181,186,194,201,208,215,222,229 — all inside 133–229; only comment mentions outside. OK.
  - `XiPrime.lean`: 6 `sorry` tokens, at 69,74,83,90,98,**106**. Count (6) correct, but the span is 69–**106**, not 69–105: the last theorem's `sorry` sits one line past the claimed range end. Range off by one; no substantive impact (all six are the deliberate placeholders of six theorems at 67,72,79,86,94,102).
- Verdict: MINOR-ERROR (range endpoint 105 → should be 106).

### 7. eth MainResults.lean anchors — OK
- Claim: "`ETH` (line 117)", "`ETHIsFalse` (line 122)", "`MainTheorem` (line 177)", "timeMin … (lines 147–154)"
- Checked: `rg -n "^def ETH|^def ETHIsFalse|^def MainTheorem|def timeMin" $C/eth/MainResults.lean`; read lines 147–154.
- Evidence: `117:def ETH : Prop := 0 < s 3`; `122:def ETHIsFalse : Prop := ¬ ETH`; `177:def MainTheorem : Prop :=`; `timeMin` at 153 with `expM`/`expN` at 147/151 (the 147–154 block). All exact.

### 8. eth Solution.lean proofs — OK
- Claim: "Both are proved: `Solution.lean:40–44` (`Wrap.countingBoundImpliesFailureOfETH`, `CountedRoute.mainTheoremHolds`)"
- Checked: `rg -n "countingBoundImpliesFailureOfETH|mainTheoremHolds" $C/eth/Solution.lean`
- Evidence: line 40 `theorem MainResults.ethIsFalse … (Wrap.countingBoundImpliesFailureOfETH …)`; line 44 `theorem MainResults.mainTheorem … := CountedRoute.mainTheoremHolds`. Both names and the 40–44 span exact.

### 9. zeta23 Mathlib import claims — OK
- Claim: library uses `Mathlib.Analysis.Analytic.Order` (`analyticOrderAt`); most frequent `Mathlib.Analysis.SpecialFunctions.Integrals.Basic` (×14), `Mathlib.Analysis.Complex.CauchyIntegral` (×12)
- Checked: `rg -l "import Mathlib.Analysis.Analytic.Order" $C/zeta23/Zeta23/`; `rg -l "analyticOrderAt" $C/zeta23/ChallengeDeps.lean $C/zeta23/Zeta23/`; counts of the two import lines across `zeta23/Zeta23/**/*.lean`.
- Evidence: Analytic.Order imported (e.g. `Zeta23/Statement.lean`, `Zeta23/Analytic/RectangleLogDeriv.lean`, `Zeta23/XiPrime/Defs.lean`); `analyticOrderAt` used in `ChallengeDeps.lean` and library; `Integrals.Basic` imported in exactly 14 files; `CauchyIntegral` import lines exactly 12. All four sub-claims exact, including both frequencies.

### 10. Theorem_4 / Corollary_40_fail anchors — OK
- Claim: "`Items.Theorem_4` (`PaperStatements.lean:4187`)"; "`Corollary_40_fail τ₀` (line 4120)"; "PaperStatements.lean 4194 lines"
- Checked: `rg -n "Corollary_40_fail" $C/3sum-apsp/PaperStatements.lean`; read lines 4184–4194; `wc -l`.
- Evidence: `4120:def Corollary_40_fail (τ₀ : ℝ) : Prop :=`; `4187:def Theorem_4 : Prop :=` with body `4188: Corollary_40_times ∧ Corollary_40_fail (1 / 18) ∧ Corollary_40_fail 0.1204`; file is 4194 lines. All exact. (Note: `Theorem_4` is a `def … : Prop`, consistent with the corpus style; survey does not claim otherwise.)

### 11. Montgomery–Vaughan Hilbert inequality — OK
- Claim: "Montgomery–Vaughan generalized Hilbert inequality (`Zeta23/MV/Final.lean:30 mv_hilbert`, diagonal constant 13)"
- Checked: `rg -n "mv_hilbert" $C/zeta23/Zeta23/MV/Final.lean`; read lines 28–34; `rg -n "EigenBound 13|MVDiag 13" …/MV/*.lean`
- Evidence: `30:theorem mv_hilbert : ∃ C : ℝ, 0 < C ∧ MVHilbert C := mvHilbert_of_eigenBound (by norm_num) eigenBound_thirteen`; `Eigen.lean:23: theorem eigenBound_thirteen : EigenBound 13`. Line and constant exact.

### 12. λ-parameterized families in Zeta23/Final.lean — OK
- Claim: "`thmA_lam`, `thmB_lam`, `thmC_lam` (`Zeta23/Final.lean:79,99,119`, any 0<λ<1)"
- Checked: `rg -n "thmA_lam|thmB_lam|thmC_lam" $C/zeta23/Zeta23/Final.lean`
- Evidence: `79:theorem thmA_lam {lam : ℝ} (h0 : 0 < lam) (h1 : lam < 1)`; same signature at 99 (`thmB_lam`) and 119 (`thmC_lam`). Lines and the 0<λ<1 binder claim exact.

## Bonus observations (not counted in tally)

- §1.3 ξ′ topic lists decl `xiPrime_simple_zeros_on_critical_line(_cumulative,_quartic_std,_quartic_cumulative)`; actual fourth name is `…_quartic` (no `_std` suffix) — cosmetic naming imprecision, same theorem.
- Survey's toolchain table (3sum-apsp v4.33.1; zeta23 v4.33.0-rc2) not re-verified in this pass (out of the 12-item scope); no contradiction seen.

## Conclusion

The survey's citation hygiene is high: 11/12 exact, the single discrepancy is an
off-by-one in a sorry-range endpoint (item 6) with correct counts. No WRONG verdicts;
no fabricated names, lines, or imports detected in the sample.

**Post-check fixes (2026-11-09, H as survey maintainer):** both discrepancies corrected
in `research/survey/anthropics.md` — XiPrime sorry span 69–105 → 69–106 (line 182) and
`_quartic_std` → `_quartic` (line 147), decl name verified against
`zeta23/Challenge/XiPrime.lean:94` before editing. This report retains the original
wording as evidence.
