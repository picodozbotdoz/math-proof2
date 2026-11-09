# Round-1 mathlib feasibility verification

Lane R9 ("feasibility"), 2026-11-09. Independent verification, against the local mathlib
checkout, of the mathlib-gap/donor claims in `research/survey/anthropics.md` §4, plus the
Phase-3 feasibility-assessment method. All verdicts derive from my own `rg` evidence produced
for this document (commands + file:line cited per claim); nothing is taken from lane R3 or any
other survey output.

## §0 Checkout snapshot

- Repo: `/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4` (read-only).
- Commit: `ff2494ea5e438f8a8452db803068acd711fa0059` — `Mon Nov 9 02:14:19 2026 +0000`,
  "chore: remove unnecessary set_option lines (#45821)".
- `lean-toolchain`: `leanprover/lean4:v4.36.0-rc2`.
- Local modifications: `git status --porcelain` empty (clean tree).
- Note for triangulation: the anthropics projects were built against Mathlib v4.33.x
  (zeta23 pins `51e6992e`); this checkout is ~3 minor versions newer, which is exactly where
  several §2 surprises come from.

## §1 Verification table

Legend: verdicts are CONFIRMED / REFUTED / NUANCED relative to the survey claim as written.
All commands were run from the mathlib root.

| # | Claim (survey §4) | Verdict | Evidence (command → hits) | Notes |
|---|---|---|---|---|
| 1 | mathlib lacks von Neumann's trace inequality as a standalone API | **CONFIRMED** | `rg -in "von\s*neumann" Mathlib/` → only set theory: `Mathlib/SetTheory/ZFC/VonNeumann.lean:38` (`vonNeumann` hierarchy), `…/ZFC/Ordinal.lean:106`, `…/ZFC/PSet.lean:344`. `rg -in "trace.{0,30}inequal\|inequal.{0,30}trace" Mathlib/` → only bibliography citations of Carlen 2010 (`Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/IntegralRepresentation.lean:51`, `Rpow/Order.lean:34`). | No `tr (AB) ≤ Σ sᵢ(A)sᵢ(B)` anywhere under any name. Mitigating fact: `LinearMap.singularValues` exists (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean:95`, antitone :142, `support = rank` :174), so the zeta23 donation (`RHLinalg.vonNeumann_trace_ineq`, `zeta23/Zeta23/LinAlg/VonNeumann.lean:171`) has a natural mathlib host; no KyFan/Schur–Horn either (only a docstring mention, `Analysis/InnerProductSpace/Spectrum.lean:46`). |
| 2 | mathlib has inertia only partially | **NUANCED** (real case now full; complex-Hermitian case absent) | `rg -in "inertia\|sylvester" Mathlib/LinearAlgebra` → `QuadraticForm/Signature.lean` (2026, D. Loeffler): root-level `sigPos`/`sigNeg` defs (`def sigPos` :65, `def sigNeg` :98 — both outside the file's `namespace QuadraticForm` at :139–256, hence importable unqualified; no visibility gap) [erratum 2026-11-09, H/QA + R9 retraction: v1 wrote "`QuadraticForm.sigPos`/`sigNeg` defs (header lines 10–11)" — both the namespace qualifier and the locator were wrong], `sigPos_add_sigNeg_add_radical` (:~232), `sigPos_of_equiv_weightedSumSquares` (:243), `sigNeg_of_equiv_weightedSumSquares` (:251) = uniqueness half of Sylvester's law; [erratum 2026-11-09, H/QA: v1 cited :240/:248; actual lines :243/:251, and the full mathlib names are `sigPos_of_equiv_weightedSumOfSquares`/`sigNeg_of_equiv_weightedSumOfSquares` ("Of" dropped here)] existence half in `QuadraticForm/Real.lean:57–85` (`equivalent_one_neg_one_weighted_sum_squared`). `rg -in "\binertia\b" Mathlib/` outside QuadraticForm → only number-theoretic ramification inertia (`NumberField/Completion/Ramification.lean:99 inertiaDeg` etc.). Hermitian side: `SesquilinearForm/Star.lean:63` has only `IsPosSemidef ↔ Matrix.PosSemidef`; no `Matrix.posInertia`/signature for ℂ-Hermitian matrices. | Mathlib's signature development is over `[CommRing R] [LinearOrder R]` — ordered fields, i.e. real quadratic forms. zeta23's donor (`Zeta23/LinAlg/{Sylvester,Inertia,PosIndex,HermitianPosPart}.lean`, namespace `RHLinalg` — all four files verified present) is stated for Hermitian matrices over 𝕜 = ℂ, which mathlib still cannot express. So the gap persists but is narrower than "partial": real Sylvester is done, Hermitian inertia is the donation target. |
| 3 | No zero-counting / Riemann–von Mangoldt N(T) in mathlib | **CONFIRMED** (with new 2026 primitives — see §2) | `rg -in "von\s*Mangoldt\|zero.?count\|zerosUpTo\|numberZero" Mathlib/` → all von Mangoldt hits are the Λ-function (`NumberTheory/ArithmeticFunction/Misc.lean:15`, `LSeries/Dirichlet.lean:363–410`, `LSeries/PrimesInAP.lean:74+`); **zero hits** for zero-counting/N(T). LSeries surface enumerated: `Basic.lean` (`LSeries` :164, `LSeriesSummable` :178, `LSeriesHasSum` :217), `RiemannZeta.lean` (`riemannZeta`, `completedRiemannZeta₀` :64, `completedRiemannZeta` :68, functional equation `*_one_sub`), `RiemannZetaLogDeriv.lean` (`logDeriv_riemannZeta_one_sub` :35), `HurwitzZeta{,Even,Odd,Values}.lean`, `Dirichlet.lean`/`DirichletContinuation.lean`/`PrimesInAP.lean`, `Nonvanishing.lean` (`LFunction_ne_zero_of_re_eq_one` :391, `rootNumber` :434, `norm_rootNumber` :453), `WienerIkehara.lean` (`tendsto_sum_div` :700), `ZetaZeros.lean` (`riemannZetaZeros` discreteness), `HardyZ.lean` (`hardyZ` :76), `MellinEqDirichlet.lean`, `AbstractFuncEq`, `Convergence`, `Convolution`, `Deriv`, `Injectivity`, `Linearity`, `Positivity`, `SumCoeff`, `ZMod`. | No counting function, no argument-principle zero count, no Backlund bound. zeta23's donor `Zeta23.RvM.Statement.lean:20 riemannVonMangoldt (hΓ : GammaFacts) : RiemannVonMangoldt zetaZeroConfig` (verified present) remains the first formal RvM. |
| 4 | No explicit formula / Weil explicit formula in mathlib | **CONFIRMED** | `rg -in "explicit formula" Mathlib/` → 15 hits, all unrelated: DFT L-functions (`LSeries/ZMod.lean:207,270`), ζ(2k) Bernoulli values (`HurwitzZetaValues.lean:198,212`), Γ′ at integers (`Harmonic/GammaDeriv.lean:30,184`), group exponent, modular group, Fourier derivatives, Beta at integers. No prime–zero transfer of any shape. | zeta23's `WeilEF/` (with `ZeroSumLimit.lean`, `Landau.lean`) is a genuine donor; the receiving side (zeros + Λ-twists) partially exists (§2 #3, #5). |
| 5 | mathlib has machines, almost no time-complexity API | **NUANCED** (right conclusion, understated premise) | `ls Mathlib/Computability/` → `Ackermann`, `AkraBazzi/` (`AkraBazzi.lean`, `GrowsPolynomially.lean`, `SumTransform.lean`), `ContextFreeGrammar`, `DFA`, `Encoding`, `EpsilonNFA`, `Halting` (`rice` :32, `halting_problem` :64), `Language`, `MyhillNerode`, `NFA`, `PartrecBasis`, `PartrecCode`, `Partrec`, `Primrec/`, `RecursiveIn`, `Reduce`, `RegularExpressions`, `RE`, `StateTransition`, `TuringDegree`, `TuringMachine/` (`Computable`, `Config`, `PostTuringMachine`, `StackTuringMachine`, `Tape`, `ToPartrec`). Time API that DOES exist: `EvalsToInTime` (`StateTransition.lean:266` + refl :281/trans :286), `Turing.TM2OutputsInTime` (`TuringMachine/Computable.lean:130`), `TM2ComputableInTime` (:161), `TM2ComputableInPolyTime` (:174), `idComputableInPolyTime` (:216). Absent: any `IsBigO` abstraction over machine time, composition/padding lemmas, word-RAM, clocks, complexity classes — nothing beyond the single `Computable.lean` file, whose only polytime instance is the identity machine. | eth's donor layer (`eth/proof/machines/ToTuring/PolyT.lean:54 PolyT`, plus `steps_to_time`, `exists_tm_padded` — dir verified, 46 files) fills a real gap, but a Phase-3 dossier must engage with `TM2ComputableInPolyTime` as the existing mathlib anchor, not claim the ground is empty. |
| 6 | Real.smoothTransition exists; Γ′/Γ Stirling bounds and Hilbert-type inequalities absent | **CONFIRMED** (all three sub-claims, with one precision) | `Real.smoothTransition` exists: `Analysis/SpecialFunctions/SmoothTransition.lean:147`, full API (`contDiff` :206, `le_one` :188, `nonneg` :191, `eq_one_iff_one_le` :200). Γ′/Γ: `digamma` EXISTS (`Analysis/SpecialFunctions/Gamma/Digamma.lean:48` `digamma := logDeriv Gamma`; functional equations :64, :94, :124; `meromorphic_digamma` :108) but `rg -n "tendsto\|IsBigO\|IsLittleO\|IsTheta" Digamma.lean` → **no hits**: no asymptotic bounds of any kind. `Stirling.lean` covers only real factorial (`stirlingSeq` :56, `stirlingSeq_has_pos_limit_a` :158) — no complex-Γ Stirling with error terms. Hilbert: `rg -in "hilbert.{0,40}inequal\|inequal.{0,40}hilbert" Mathlib/` → only C*-Cauchy–Schwarz (`CStarAlgebra/Module/Defs.lean:202,232`) and Sobolev/GNS (`SobolevInequality.lean:607`). | Precision: the survey's phrasing "Γ′/Γ … absent" could be misread as "digamma absent" — the *function* exists, its *Stirling-type estimates* do not. zeta23's `GammaFacts/` and `MV/Final.lean:30 mv_hilbert` remain donors. |
| 7 | analyticOrderAt exists (Mathlib.Analysis.Analytic.Order) and completedRiemannZeta₀ exists | **CONFIRMED** | `rg -n "analyticOrderAt" Mathlib/Analysis/Analytic/Order.lean` → `analyticOrderAt` :49 (`: ℕ∞`, junk 0 when not analytic :66), `analyticOrderNatAt` :63. `completedRiemannZeta₀`: `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:64` (and `completedRiemannZeta` :68). | zeta23's consumer surface (`zeroMult` via `analyticOrderAt`; ξ built on `completedRiemannZeta₀`) is intact in this checkout. |
| 8 | No matrix-multiplication-exponent / tensor-rank / Strassen API in mathlib | **CONFIRMED** | `rg -in "strassen\|tensor.?rank\|border.?rank\|matrix.?mult.{0,20}exponent\|exponent.{0,20}matrix" Mathlib/` → Strassen only as motivation prose in `Computability/AkraBazzi/AkraBazzi.lean:21`; "tensor_rank_decomposition" only a Wikipedia link in `Data/Holor.lean:33`. `Data/Holor.lean` is index-plumbing for multidimensional arrays (`HolorIndex` :45, take/drop/assoc) with no rank algebra. | No ω, no rectangular exponents, no trilinear forms, no border rank — consistent with 3sum-apsp's remark that it had to use log₂ 7 in place of ω. |
| 9 | No ETH/SETH/complexity-class statements in mathlib | **CONFIRMED** | `rg -in "\bETH\b\|SETH\|NP.?complete\|PSPACE\|complexity class\|NEXP" Mathlib/` → all hits are false positives (Cantor-set topology, Urysohn metrization `l^∞`, Kuratowski, pretty-printer comments). `rg -in "nondeterministic" Mathlib/` → only NFA/εNFA docs (`Computability/NFA.lean:12`, `EpsilonNFA.lean:13`) and `Data/WSeq/Defs.lean:125`. `TuringDegree.lean` = degrees of *unsolvability* (recursion theory), not time. | No NP, no P, no hardness, anywhere. Any complexity-theoretic bridge candidate must define its classes from scratch or consume a donor (eth's `InTime`/`s k` in `MainResults.lean`). |
| 10 | Mathlib.Computability.TuringMachine provides Turing.FinTM2, TM2ComputableAux | **CONFIRMED** | `Mathlib/Computability/TuringMachine/Computable.lean`: `namespace Turing` :41; `structure FinTM2` :46 (= `Turing.FinTM2`); `initList` :110, `haltList` :118, `TM2Outputs` :126, `TM2OutputsInTime` :130, `TM2ComputableAux` :142, `TM2ComputableInTime` :161, `TM2ComputableInPolyTime` :174, `idComputableInPolyTime` :216. | Every eth-used name exists verbatim in this checkout; eth's mathlib dependency surface is stable across v4.33 → v4.36. |

### Donor-side spot checks (anthropics corpus, for §3 template accuracy)

Verified present by `rg` this round: `zeta23/Zeta23/LinAlg/VonNeumann.lean:171
theorem vonNeumann_trace_ineq` (namespace `RHLinalg` :47); `RankTrace.lean:163
rank_trace_ineq` (+ `:260 rank_trace_ineq_two`); `Sylvester.lean:37` (namespace), plus
`Inertia.lean`, `PosIndex.lean`, `HermitianPosPart.lean`, `Weyl.lean` in the same dir;
`zeta23/Zeta23/RvM/Statement.lean:20 riemannVonMangoldt` (note: conditional on a `GammaFacts`
hypothesis — the Γ-facts are a donor hypothesis, not a mathlib import);
`eth/proof/machines/ToTuring/PolyT.lean:54 PolyT`; `eth/proof/machines/` contains
`QueryMachines`, `StepMachines`, `ToTuring`, `Tower`, `TwoMachines`, `Wrap`.

## §2 Surprises (material for feasibility, missed or understated by the survey)

1. **`Mathlib/NumberTheory/LSeries/ZetaZeros.lean`** (2026, Huanyu Zheng): `riemannZetaZeros`
   is closed, discrete, and `IsCompact.inter_riemannZetaZeros_finite` — any compact contains
   finitely many zeros. This is the natural primitive a mathlib N(T) would be built on, and it
   postdates zeta23's mathlib pin. Feasibility consequence: an RvM donation can lean on this
   instead of re-proving discreteness.
2. **`Mathlib/NumberTheory/LSeries/HardyZ.lean`**: `hardyZ` :76 with `hardyZ_eq_zero_iff`
   :111 and `continuous_hardyZ` :122. On-line zeros of ζ are exactly real zeros of `hardyZ`
   (via `completedRiemannZeta_half_add_mul_I`); zeta23's N₀*/N₀ˢ counting on the critical line
   could be phrased over ℝ through this API, avoiding complex contour machinery on the consumer
   side. Big lever for any zero-density bridge.
3. **`Nonvanishing.lean` has the functional-equation cast**: `completedLFunction`
   (`completedLFunction_ne_zero_of_one_le_re` :425), `rootNumber` with `norm_rootNumber = 1`
   :453, `gaussSum` norm :460 for primitive characters. Half of what a Weil-explicit-formula
   donation needs on the L(s,χ) side already exists in usable form.
4. **`WienerIkehara.lean` is in mathlib** (`tendsto_sum_div` :700): the Tauberian step behind
   PNT-type corollaries of explicit formulas no longer needs porting.
5. **Real Sylvester law of inertia landed 2026** (`QuadraticForm/Signature.lean`,
   `QuadraticForm/Real.lean`): narrows zeta23's Sylvester donor to the ℂ-Hermitian case; a
   Phase-3 dossier should check whether `sigPos/sigNeg` can be pulled back along
   `IsHermitian → real quadratic form on ℂ^n` (2 Re of the form) instead of donating wholesale.
6. **`LinearMap.singularValues`** (`Analysis/InnerProductSpace/SingularValues.lean:95`) with
   antitone ordering and rank = support-card: the correct host for a von Neumann trace
   inequality donation; feasibility of that donation is higher than the survey implies.
7. **`Computability/AkraBazzi/`**: full divide-and-conquer recurrence asymptotics (Strassen
   cited as motivation, `AkraBazzi.lean:21`). Relevant glue for transplanting 3sum-apsp's
   `Pruned` recursion analysis onto mathlib-native recurrence machinery.
8. **`Turing.TM2ComputableInPolyTime` already exists** (claim 5): the "mathlib has no time
   API" gap is narrower than stated; the empty zone is the *derived* layer (BigO of time,
   composition, padding), which is precisely what eth's `ToTuring/` provides — a port would be
   an incremental extension, not greenfield.
9. **`LSeries/PrimesInAP.lean`**: L-series of von Mangoldt restricted to residue classes and
   their character twists (:217, :235) — the analytic input side of an explicit formula for
   primes in AP is partially assembled.

## §3 Phase-3 feasibility template

Every Phase-3 dossier must fill the following template; verdicts must cite exact declarations
verified against this checkout (`ff2494ea`) or the donor repo. Worked example included
(candidate C-1, von Neumann trace inequality donation) to fix the granularity.

```markdown
### Feasibility dossier — <candidate id>: <statement>
F0. Target statement (one sentence, mathlib-ready phrasing).
F1. Mathlib entry points (exact decls + file:line, verified against the pinned checkout):
    - objects:        e.g. LinearMap.singularValues (Analysis/InnerProductSpace/SingularValues.lean:95)
    - ambient API:    e.g. Matrix.IsHermitian (LinearAlgebra/Matrix/Hermitian.lean),
                      Matrix.PosSemidef (LinearAlgebra/Matrix/PosDef.lean)
    - endpoints the   e.g. the target namespace/construction the new theorem must compose with
      proof must end in
F2. Donor lemmas (exact decls + file:line, verified in donor repo):
    e.g. RHLinalg.vonNeumann_trace_ineq (zeta23/Zeta23/LinAlg/VonNeumann.lean:171),
         hypotheses it carries (field 𝕜 = IsROrC? matrix indexing type? Hermitian side conditions?)
F3. Missing glue (must be proved new; each item one bullet, estimate its depth):
    a. definitional bridge donor-def → mathlib-def (state the definitional unfolding needed)
    b. genuinely absent mathematics (not in either corpus)
    c. porting debt (donor lemma proved over a stronger/different hypothesis than mathlib gives)
F4. Effort: S (<1k LoC) / M (1–10k) / L (>10k), with justification by F3 item:
    each glue bullet tagged (a=usually S, b=driver of the estimate, c=S–M).
F5. Risk factors:
    - definitional mismatch (ordered-field vs ℂ-Hermitian; Matrix vs LinearMap;
      Set-vs-Finset counting; ∑ᶠ vs ∫; ℕ∞ junk values)
    - universe/index issues (Fintype vs Infinite indexing, DecidableEq instances)
    - analytic vs algebraic content split (which half is the real work)
    - dependency-chain risk (donor theorem conditional on donor-internal hypotheses, e.g.
      RvM's `GammaFacts` — such hypotheses must themselves be donated or discharged)
    - churn risk (target API is recent/active: Signature.lean 2026, ZetaZeros.lean 2026)
F6. Verification plan: kernel-only (math-proof1 standard), Modal build via lean_build.py/
    lean_check.py once lake scaffolding exists; no sorry, no native_decide, no external CAS.
```

Worked example (C-1, `vonNeumann_trace_ineq` → mathlib over `LinearMap.singularValues`):
F1 `LinearMap.singularValues` (:95, antitone :142), `Matrix.IsHermitian`, `Matrix.toLin`’s
bilinear pairing; F2 `RHLinalg.vonNeumann_trace_ineq` (VonNeumann.lean:171); F3 (a) matrix ↔
LinearMap transport of trace and singular values — singularValues is `Finsupp`-valued on a
finite-dim inner-product space, donor states matrices over a star field: transport S; (b) none
(the inequality is the donor); (c) donor hypothesis shape (Hermitian both sides vs general A,B)
must be checked against the donor statement — S; F4 **S** (<1k LoC: transport + statement
transcription); F5 risks: definitional mismatch (Finsupp singular values vs sorted-list
convention), possible `IsROrC` vs `ℂ` gap, churn risk low. This is the calibration point: a
pure-transport donation is S; anything with F3(b) content in analysis (e.g. RvM: needs
argument principle + GammaFacts + contour integration) jumps to M–L.

## §4 Method note

- Verdicts above are grep-verifiable claims about *presence/absence of declarations*, not about
  mathematical equivalence: "mathlib lacks X" was tested by name-pattern search over
  `Mathlib/` plus manual review of every hit (and of the neighboring files where a result could
  live under a different name — e.g. singular values for claim 1, signature for claim 2).
  Absence-of-equivalent claims are inherently weaker than presence claims; where an equivalent
  could hide, §1 says so explicitly.
- Presence claims cite `file:line` in the pinned checkout `ff2494ea`; because mathlib moves
  fast (three of the §2 surprises landed within months), every Phase-3 dossier must re-pin its
  F1/F2 evidence at writing time and the checkout commit recorded in §0 must accompany any
  build.
- Effort buckets S/M/L are Lean-LoC proxies, not calendar estimates; they assume the
  math-proof1 toolchain (Modal builds, kernel-only). No builds were run in this round (rg/read
  only, per lane rules); the first `lake` verification belongs to Phase 3 pilot work.
- Independence: this file was produced without reading any R3/mathlib-frontier output; overlap
  with that lane, when it appears, is cross-validation material.
