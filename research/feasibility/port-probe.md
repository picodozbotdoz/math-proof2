# Round-2 empirical port-probe — donor statements vs mathlib v4.36.0-rc2

Lane R9 ("feasibility"), 2026-11-09. Empirical answer to the open feasibility
question: how much breaks when anthropics-corpus donor STATEMENTS (built against
Mathlib v4.33.x) are elaborated against our checkout (`ff2494ea`, toolchain
`v4.36.0-rc2`)? Method: Modal-hosted elaboration probes — statement elaboration
only, never proofs. All probe sorries are scaffolding and are not results.

Companion to `research/feasibility/mathlib-verification.md` (round 1, rg-based);
§5 below records the corrections round 2 forces on round 1's file.

## 1 Modal setup

Established math-proof1 workflow (`math-proof1/AGENTS.md`), reused — nothing new
invented except the probe script itself, which follows the `lean_tauceti.py`
precedent (ephemeral `modal run`, own image, no volume/secret/deploy) under the
explicit round-2 task authorization ("a one-time v4.36 Modal build is
authorized — report its cost").

- **Account/CLI**: user `xyz`, `/home/xyz/xyzenv/bin/modal` via passwordless
  `sudo -u xyz` (the doz workspace CLI is disabled; `modal app list` on the doz
  CLI works but shows nothing; xyz owns the shared `lean-cache` volume — not
  used by this probe).
- **Files**: `research/feasibility/probe/lean_probe.py` (app `crossmath-probe`,
  ephemeral) + `research/feasibility/probe/run_probe.sh` (stages
  script + probes into world-readable `/tmp/crossmath-probe-stage`, mirroring
  `tools/modal_tauceti.sh`). Probe `.lean` files live alongside.
- **Image** (`lean_probe.py`): Debian slim py3.12 + apt set + elan v4.2.4 +
  toolchain `leanprover/lean4:v4.36.0-rc2` + `git clone` of
  `leanprover-community/mathlib4` at `ff2494ea` (exact encore checkout rev) +
  `lake exe cache get`. The elan layer commands are textually identical to
  `lean_check.py`/`lean_tauceti.py`, so base layers are shared with the
  existing math-proof1 images; only the toolchain/mathlib layers are new.
- **Cost (reported as required)**: cold run 1, image build **+ probes ≈ 3 min
  45 s wall** (18:40:15→18:44:01) — `cache get` fetched **9096 olen artifacts
  for the exact rev ff2494ea** (CI artifacts were already up; no fallback to
  the `master-2026-11-08` nightly tag was needed, though the script supports
  `MATHLIB_REV=` for it). Container: 4 CPU / 32 GiB (never stressed; probes are
  elaborations). Warm run 2 (image cached): **≈ 68 s** end-to-end. 8710 mathlib
  olens present at runtime.
- **Method inside the container**: each probe file written into `/opt/mathlib/`
  root, elaborated by `lake env lean <file>` (no `lake build`, no module
  rebuilds; imports resolve against the cached olens — the smoke probe
  `import Mathlib.Tactic` guards a cache miss and would abort cleanly).

## 2 Probe A — mathlib v4.36 declaration smoke (22 #checks, 2 runs)

Verdict per declaration (evidence: elaboration output of `ProbeA.lean` /
`ProbeA2.lean`, runs 1–2; full transcripts in
`/tmp/crossmath-probe-run{1,2}.log`):

| Declaration (as probed) | Verdict | Note |
|---|---|---|
| `Turing.FinTM2` | OK | `Type 1` |
| `Turing.TM2ComputableAux` | OK | fields `tm`/`inputAlphabet`/`outputAlphabet` intact (see B2) |
| `Turing.TM2OutputsInTime` | OK | signature exactly `FinTM2 → List Γ₀ → Option (List Γ₁) → ℕ → Type` — the shape eth's statements use |
| `Turing.TM2ComputableInPolyTime` | OK | structure over encoder pairs |
| `WienerIkehara.tendsto_sum_div` | OK* | *probe-1 miss: lives in namespace `WienerIkehara` (`LSeries/WienerIkehara.lean:84`), not root; confirmed with full signature in run 2 |
| `WienerIkehara.tendsto_sum_range_div` | OK | run 2 |
| `riemannZetaZeros`, `isDiscrete_riemannZetaZeros`, `IsCompact.inter_riemannZetaZeros_finite` | OK | the 2026 zero-discreteness API |
| `analyticOrderAt` | OK | `NontriviallyNormedField 𝕜`, `ℕ∞`-valued |
| `completedRiemannZeta₀` | OK | `ℂ → ℂ` |
| `hardyZ` | OK | `ℝ → ℝ` |
| `Matrix.IsHermitian.eigenvalues` / `.eigenvalues₀` | OK | spectral-theorem surface the donor consumes; `eigenvalues₀ : Fin (card n) → ℝ` |
| `Matrix.PosSemidef`, `Matrix.rank` | OK | |
| `QuadraticForm.sigPos` / `sigNeg` | **FAIL — genuinely not API** | "Unknown constant" in both runs. Cause (local source check): `LinearAlgebra/QuadraticForm/Signature.lean` is a `module` file **without** `@[expose] public section` — `sigPos` (:65) / `sigNeg` (:98) are **module-private**, invisible to importers. The 2026 real-Sylvester development exists in-tree but is currently mathlib-internal only. |
| `LinearMap.singularValues` | OK | `Finsupp ℝ`-valued |
| `Real.smoothTransition` | OK | |
| `Complex.digamma` (+ `digamma_apply_add_one`) | OK* | *probe-1 miss: namespace `Complex` (`Gamma/Digamma.lean:45`) |
| `Holor.CPRankMax`, `Holor.CPRankMax1` | OK | CP-rank-at-most inductives (`Data/Holor.lean:253,260`); the real spelling of R3's "Holor.cprank" |

**Counts**: 22 checks → 18 OK, 4 FAIL; of the failures, 2 were my name errors
(namespace misses, resolved OK in run 2) and 2 one real gap (`sigPos`/`sigNeg`
module-private — one root cause).

## 3 Probe B — donor statement port test (statement elaboration only)

| Probe | Source (donor, read-only) | Result | Breakage detail |
|---|---|---|---|
| `ProbeB1_RHLinalg.lean` | zeta23 `Zeta23/LinAlg/PosIndex.lean` (defs `posIndex`, `negIndex`, `posIndexAbove`, `rtrace`, `frobSq`), `VonNeumann.lean:171 vonNeumann_trace_ineq`, `RankTrace.lean:163 rank_trace_ineq`, `Weyl.lean:50 weyl_posIndexAbove_le` — defs + theorem statements copied verbatim, proofs `sorry` | **OK — 0 errors** (3 sorry-warnings only) | **None.** Donor's own import line (`Mathlib.Analysis.Matrix.PosDef` + `Analysis.Convex.Birkhoff` + `Algebra.Order.Rearrangement` + `Algebra.Order.Chebyshev`) all still exist; `#{i \| …}` Finset-card notation, `eigenvalues₀`, `IsHermitian.add`, `Aᴴ`, `RCLike.re`, `ComplexOrder` opens — every statement constituent elaborates unchanged. |
| `ProbeB2_EthTime.lean` | eth `MainResults.lean:91–99/:158–161` shape: `Nonempty (TM2OutputsInTime M.tm (x.map M.inputAlphabet.invFun) (some (y.map M.outputAlphabet.invFun)) t)` with `M : Turing.TM2ComputableAux Bool Bool` | **OK — 0 errors** (1 sorry-warning) | **None.** `TM2ComputableAux` field names and the `TM2OutputsInTime` argument list are identical to what eth was built against. |
| `ProbeB3_3sumEnd.lean` | 3sum-apsp `EndStatement.lean` **copied verbatim** (139 lines: `Instr`, `exec`, `loadWords`, `BigO`, `Problem`, `SolvedBy`, `Problem.SolvedInTime`), incl. its `module` + `@[expose] public section` headers | **OK — 0 errors, 0 warnings** | **None.** Mathlib-free as claimed; elaborates against the v4.36.0-rc2 toolchain's core Lean unchanged. |

Breakage categories observed: notation drift — **0**; API rename — **0**;
missing lemma — **0** (at statement level); namespace/location drift — 2
(`Complex.digamma`, `WienerIkehara.tendsto_sum_div`, my probe-side, not
donor-side); visibility gap — 1 (`QuadraticForm.sigPos/sigNeg` module-private).

Caveat (scope): statement elaboration is the cheap half. Donor PROOFS
(tactic-level: `simp` lemma churn, `omega`/`ring` normalization, matrix simp
sets) were v4.33-era and will need real re-fixing effort; that is not measured
here and must not be inferred from these OKs.

## 4 Porting-cost table

Grades use the round-1 S(<1k LoC)/M(1–10k)/L(>10k) buckets; evidence = this
round's elaboration results + round-1 rg evidence.

| Donor module | Statement port | Full port estimate | Evidence & justification |
|---|---|---|---|
| **Zeta23/LinAlg (whole: VonNeumann, Sylvester, Inertia, PosIndex, HermitianPosPart, RankTrace, Weyl)** | **S** — verbatim, 0 errors (B1) | **M** | Statements + all defs elaborate unchanged; the work is re-proving/re-fixing ~2–3k LoC of proofs. No conflict on the mathlib side: `sigPos/sigNeg` are module-private, so donating `posIndex`/`negIndex` (Hermitian case) collides with nothing public. |
| **Zeta23/RvM statements** (`RvM/Statement.lean:20 riemannVonMangoldt`, conditional on donor `GammaFacts`) | not directly probed; **S–M** | **M–L** | Consumer-side mathlib surface probed clean (`riemannZeta`, `completedRiemannZeta₀`, `analyticOrderAt`, `hardyZ`, `ZetaZeros` all OK), but the statement carries the donor-internal `GammaFacts` hypothesis — the Γ′/Γ Stirling machinery must come along or be re-proved (round 1: no asymptotic digamma bounds in mathlib), and that is analytic content, the expensive half. |
| **eth ToTuring interface** (`PolyT`, `steps_to_time`, `exists_tm_padded` over `TM2OutputsInTime`) | **S** — shape probed clean (B2) | **M** | The mathlib anchor (`Turing.TM2OutputsInTime`, `TM2ComputableAux`, `FinTM2`) is signature-identical; interface restatement is trivial. Full port of `machines/ToTuring/` (46 files of padding/composition proofs) is proof-driven M; no mathlib-side drift was observed at the interface level. |
| **3sum-apsp EndStatement** (word-RAM model) | **S — confirmed trivial** (B3 verbatim, 0 warnings) | **S** | Imports nothing; the only port work is placing it in a package (its `module` header already matches mathlib-style layout). |

## 5 Corrections to round-1 `mathlib-verification.md` (from empirical evidence)

1. Claim 6 note: the digamma entry should read **`Complex.digamma`**
   (`namespace Complex` at `Gamma/Digamma.lean:45`), not bare `digamma`; still
   no asymptotic bounds.
2. Claim 2 note: "real Sylvester landed 2026" needs the asterisk **"but
   `sigPos`/`sigNeg` are module-private — not importable API"** (probe-verified
   twice). Consequence: zeta23's inertia donation has no public-API conflict;
   feasibility of a *consumer* of mathlib signature is zero until mathlib
   exposes it.
3. Claim 3 note: Wiener–Ikehara is namespaced: `WienerIkehara.tendsto_sum_div`
   (hypotheses verified by `#check`: partial-sum bound, continuity on Re ≥ 1,
   agreement with `LSeries − A/(s−1)` on Re > 1, `0 ≤ f`).
4. Claim 8 nuance: `Holor.CPRankMax` / `CPRankMax1` (CP-rank-at-most
   predicates) **exist** (`Data/Holor.lean:253,260`) — "no tensor-rank API"
   should be weakened to "no tensor-rank *algebra* (no rank function, no
   exponent, no Strassen-type results); only rank-at-most predicates".

## 6 Artifacts

- Probe files: `research/feasibility/probe/{Probe0_Smoke,ProbeA,ProbeA2,ProbeB1_RHLinalg,ProbeB2_EthTime,ProbeB3_3sumEnd}.lean`
  (all header-commented "statement elaboration probe — not a proof artifact";
  nothing deleted, all sorries confined to these files).
- Runner: `research/feasibility/probe/lean_probe.py` + `run_probe.sh`.
- Raw transcripts: `/tmp/crossmath-probe-run1.log` (cold, incl. image build),
  `/tmp/crossmath-probe-run2.log` (warm).
- Modal run URLs (ephemeral apps, already stopped):
  `modal.com/apps/donniexyz888/main/ap-PUlXy5WhqiKpcPvxi0Aepw` (run 1),
  `…/ap-cs1fBKNhWrDP7BWF1Gu2vD` (run 2).

## 7 OAI probe (round 3, 2026-11-09) — openai-math statement portability

Corpus: `/home/doz/zcode-workdir/openai-math/lean` (Lean v4.34.1, Mathlib `d13f23b7` pinned;
`TauCeti@3bed7e37` in lake-manifest.json:194–199 — no target below imports it). Probes: runs 3–4
(app `crossmath-probe`, same image/rev as §1; transcripts `/tmp/crossmath-probe-run{3,4}.log`).

### 7.1 Target statements located (exact names)

- (a) quasi-RH: `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re {s : ℂ} (hs : (7/8:ℝ) < s.re) :
  riemannZeta s ≠ 0` — statement layer `ComparatorChallenges/QuasiRiemannHypothesis.lean:5`
  (imports only `Mathlib`); library layer `OAI/NumberTheory/DirichletL/Nonvanishing.lean:29`
  (identical signature, proof delegates to `SevenEighths.ProbeFinalAssemblyUnconditional`).
- (b) omega bound decls: defs `OAI.MatrixMultiplication.Arithmetic.omega` (Model.lean:91) and
  `rectangularOmega` (:103) (+ `AdmissibleExponent` :88, `RectangularAdmissibleExponent` :98,
  `complexAlpha` :107 — the whole ontology in one 114-LoC defs-only file importing `Mathlib`
  wholesale); bound theorem `omega_lt_of_balanced_family` (… `Arithmetic.rectangularOmega ℂ k <
  target`) at `Rectangular/Witness.lean:51`; also `rectangular_rpow_omega_le_of_rankAtMost`
  (`Rectangular/ASI.lean:40`).
- (c) SubexponentialSAT space-monitor: `exact_count_and_sat` at
  `OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean:74` — the space clause is
  `∀ (prefixSteps : ℕ) (intermediate : LocatedCfg machine), prefixSteps ≤ time → Trace … →
  (visitedSpace intermediate : ℝ) ≤ S * ((Encoding.formulaBitLength F : ℝ) + 1) ^ e`;
  siblings `exact_count_eth` (:104) and `sat_polynomial_space` (:~149).

### 7.2 Def-chain closure (`research/feasibility/probe/oai_closure.py`, text-level BFS over
`import` lines; OAI/TauCeti files counted, Mathlib/core are leaves)

| Target | OAI closure | TauCeti closure | max depth | level 1 |
|---|---|---|---|---|
| (a) Nonvanishing.lean | **2924 files / 486,490 LoC** | 0 | 44 | `Detector/FinalAssemblyUnconditional`, `Foundation` (Foundation fans out to 289 files at level 2) |
| (b) Model.lean (defs) | **1 file / 114 LoC** | 0 | 0 | — (imports only `Mathlib`) |
| (b) Witness.lean (bound thm) | **78 files / 13,697 LoC** | 0 | 8 | `Numerical/ComplexCertificates`, `Rectangular/ASI`, `Rectangular/RateLimit`, `Tensor/ComplexWitness`; level 2 adds 10 (CoppersmithWinograd, Entropy, Arithmetic/…); level 3 adds 15 |
| (c) SqrtLogSpace/Final.lean | **2569 files / 484,267 LoC** | 0 | 30 | `SqrtLog/StatementCanonical`, `SqrtLogSpace/{NativeLargeEntry,Statement}` |

Reading: the omega **ontology** is fully self-contained; the omega **bound theorem** needs a
78-file sub-library; quasi-RH and SubexponentialSAT library statements sit on effectively the
whole corpus (~0.5M LoC each) — their statement ports standalone exist only in the
challenge-file form (imports `Mathlib` only).

### 7.3 Elaboration of the smallest (Model.lean, closure 1 file)

- `ProbeC2_OAI_Model.lean` = Model.lean **verbatim** (defs only, no proofs, 114 LoC, header
  prepended): **OK — 0 errors, 0 warnings** against v4.36.0-rc2 @ ff2494ea (run 3). The entire
  exponent ontology (`omega`, `rectangularOmega`, `complexAlpha`, `MatrixAlgorithm`, …)
  ports with zero drift despite the v4.34.1→v4.36 gap and the wholesale `import Mathlib`.
- `ProbeC1_OAI_QuasiRH.lean` = challenge statement verbatim (sorry'd placeholder as in the
  donor's own challenge file): **OK** (run 3) — statement is mathlib-only and ports standalone.
- Not elaborated (per task scope, smallest only): Witness.lean's bound statement — its first
  blocking OAI-internal defs would be, per level-1 of the chain: `ComplexWitness.
  FiniteRectangularWitness` (Tensor/ComplexWitness.lean), `RectangularRateLimit.
  exponent_le_of_finite_asi` (Rectangular/RateLimit.lean), and `Arithmetic.
  equalRectangular_log_inequality_of_polynomialApproximation` (via Rectangular/ASI.lean) —
  i.e. a statement port needs the witness/certificate sub-library, not just Model.lean.

### 7.4 F1-batch and the sigPos correction (ProbeA3/A4, runs 3–4)

- ProbeA3 (dossier-cited F1 decls): 9/9 OK after one namespace fix — `spectral_theorem`,
  `trace_eq_sum_eigenvalues`, `sq_sum_le_card_mul_sum_sq`,
  `Monovary.sum_mul_comp_perm_le_sum_mul`, `Matrix.isSymmetric_toLin_iff` (correct full name;
  bare `isSymmetric_toLin_iff` is NOT root), `LinearMap.IsSymmetric.eigenvalues` (takes an
  explicit `finrank 𝕜 E = n`), `Matrix.rank_mul_le{,_left,_right}`.
- **Correction to §2 and §5.2 of this file** (and to my round-2 reply): `QuadraticForm.sigPos/
  sigNeg` are **NOT module-private**. `Signature.lean` opens `namespace QuadraticForm` only at
  line 139, *after* `def sigPos` (:65) / `def sigNeg` (:98) — the defs are root-named
  **`sigPos` / `sigNeg`** and fully importable: ProbeA4 (run 4) checks `@sigPos`, `@sigNeg`,
  `@QuadraticForm.sigPos_of_equiv_weightedSumSquares`, `@QuadraticForm.sigNeg_of_equiv_
  weightedSumSquares`, `@QuadraticForm.sigPos_add_sigNeg_add_radical` — all OK. The file's own
  docstring ("`QuadraticForm.sigPos`") is misleading; the real defect was my probe's name.
  Consequences: no visibility gap exists; no re-export needed (`Mathlib.lean:5462` already
  carries the module via `public import`; no other mathlib file imports Signature.lean — the
  decls' only consumers are external). Round-1 `mathlib-verification.md` claim-2 note stands
  (real-Sylvester public API exists) with the name spelled `sigPos`/`sigNeg`.

## 8 Round-4 probe extensions (2026-11-09)

Runs 5–6 (warm; transcripts `/tmp/crossmath-probe-run{5,6}.log`). Two extensions ordered by
round 3: (a) the dossier-02 pre-condition (PairCeiling statement chain — the one unprobed
drift zone), (b) zeta23 A–D statements as hypothesis-binder types (pilot-42 M1's shape;
`research/pilots/42/` checked — M1 not yet landed, no duplication).

### 8.1 Probe D — PairCeiling statement chain (dossier-02 pre-condition) — CLEAN

`ProbeD_PairCeiling.lean`: donor's own Mathlib import line (`MeasureTheory.Integral.
IntervalIntegral.FundThmCalculus` + `IntegrationByParts` + `Analysis.SpecialFunctions.
Integrals.Basic` — all three paths exist at v4.36), the four `Defs.lean` defs + `NearCUE`
(:34) + `massOf` (Bridge.lean:31) + `EnclOK` (NumericCert.lean:72) verbatim, and the
statements of `ceiling_stability` (Stability.lean:305), `ceiling_nearCUE_signed`
(Signed.lean:54), `lawN256_rows` (CeilingLaw256.lean:30) and `ceiling_law256`
(CeilingLaw256.lean:38) with only the `LawN256` data instance abstracted to `(K, encl)`
parameters. Result: **OK — 0 errors** (4 sorry-warnings, run 6; run 5's 2 errors were my
abstraction typing `encl : ℕ → List …` instead of `List …` — probe-side, not drift; the
interval-integral statements themselves were clean already in run 5). The dossier-02 M-grade
pre-condition is discharged: **no drift in the one unprobed zone** — `intervalIntegral`
notation, `volume`, `IntervalIntegrable`, `HasDerivAt`-chain hypotheses, decimals, and the
`Finset.Icc 1 256` numerals all elaborate unchanged.

### 8.2 Probe E — zeta23 A–D as hypothesis-binder types — CLEAN

`ProbeE_Zeta23Binder.lean`: `ChallengeDeps.lean` counting defs (`IsNontrivialZero`,
`zeroMult` via `analyticOrderAt`, `zerosIn`, `Ncount` (∑ᶠ), `Ndist`, `N0star`, `N0simple`,
`cMT` :106) + the four submitted statement shapes as `def HypA / HypB_mult / HypC_mult /
HypD : Prop` (bodies verbatim from `Challenge.lean:131/145/157/163`) + one trivial
binder-consuming wrapper, wholesale `import Mathlib` exactly as the donor's trusted layer.
Result: **OK — 0 errors, 0 warnings** (runs 5–6). The conditional-theorem pattern
(dossier 42 F5(iii), pilot-42 M1, and every NT-cluster dossier consuming zeta23 statements
as hypotheses) is elaboration-validated against v4.36 @ ff2494ea.

### 8.3 Small corrections and additions from round-4 grading

- `Holor.cprank` **exists** (`Mathlib/Data/Holor.lean:333`, `noncomputable def cprank … :=
  @Nat.find (fun n => CPRankMax n x) …`, with `cprank_upper_bound` :336): further corrects
  §5.4 — mathlib has the CP-rank *function*, not only the rank-at-most predicates. Relevant
  to dossier 60 (F3(c) Holor mirror cheaper than assumed).
- OAI `exists_rankAtMost`/`exactRank` verified at
  `OAI/LinearAlgebra/MatrixMultiplication/AuxiliarySeparation/Arithmetic/RankExponent.lean:22,36`
  (dossier 60 cited the file without path). `ComplexDotPairing.lean` def-chain closure =
  **1 file / 778 LoC / depth 0** (self-contained); `AuxiliarySeparation/Main.lean`
  (`omega_le_nine_quarters` :28, `matrix_multiplication_cost_le` :16) closure =
  **129 files / 20,694 LoC / depth 12** — the priced cost of importing the omega bound
  itself (dossier 12 F3b-adjacent).
- tauceti `lean-toolchain` = `leanprover/lean4:v4.36.0-rc2` — identical to the encore
  checkout and to this project's target: tauceti donors are same-toolchain lake
  dependencies with zero port friction (dossiers 40/41/42 exploit this in their F4 notes).
