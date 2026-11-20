# η-port R4-file (R5+R6 Fourier/identity layer at κ=1) — record: rung-2/3 GREEN EXIT + R5/R6 GATED at T2/T3 by a syntax slip, fix parked at ceiling

**Billing: technical record per DECISION-2 = Option A (record-billed, quota-free)**
— infrastructure only, never discovery-phrased; informal λ-dependence Lamzouri's
(must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

## Headline verdicts (port runs 9–13, this session; logs in `logs/`)

- **RUNG 2 EXITS GREEN** — `eta-r2.lean` strict-OK **4/4, all TRIAD-CLEAN**
  ([propext, Classical.choice, Quot.sound] per declaration; run 13, log
  `eta-r2-run9-eta-r3-run6-eta-r4-run4.log`): `cutoffSelfConvLam_eq_scaled_dilate`
  (lemma A — THE (ii-c′) FINDING's theorem, the six-fire whnf blocker, now
  kernel-proved), `cutoffTestLam_isAdmissible`, `cutoffSelfConvLam_isPairTestFunction`,
  `iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction`.
- **RUNG 3 EXITS GREEN** — `eta-r3.lean` strict-OK **2/2, all TRIAD-CLEAN**:
  `pairMainTerm_cutoffSelfConvLam` (the corrected (iii′) covariance of the
  amendment) + `scaledConstLam_half` (the λ = 1/2 bit-for-bit regression anchor).
  **The parked-pair confirmation objective of this unit is DISCHARGED** (the
  re-fire falsified the "expected strict-OK" prediction — the parked batch-5 was
  unverified; five fix-batches later the rungs are genuinely closed).
- **R5+R6 (eta-r4.lean) GATED-RED at T2/T3** after 4 fires (23→10→11→10 errors,
  all mechanical): the FINAL blocker is a fix-batch-9 SYNTAX SLIP —
  `set_option … in` placed between a docstring and its declaration is invalid
  Lean 4 (`unexpected token 'set_option'; expected 'lemma'`), so parser-recovery
  dropped BOTH heartbeat boosts and the div-lemma/T3 re-hit their whnf budgets.
  Fix-batch-10 PARKED UNFIRED at the 13-run ceiling: `eta-r4.lean` @
  `06ad527f00d3a30c` (options repositioned before the docstrings; verified
  placement :206/:448/:525). Next-unit residual list (decoded, mechanical):
  (a) fire `06ad527f00d3a30c`; (b) if the hsplit :615 app-mismatch persists, spell
  the div_const divisor explicitly (`rw [integral_sub hI1 (hI2.div_const
  ((4 * Real.log T ^ 2 : ℝ) : ℂ)), integral_div]` — the `_` elaborates to a
  metavar before goal-matching); (c) if the show-block ring still fails, mirror
  the donor's `Zeta/Kernel.lean:383-397` text character-for-character. R5-1's
  :557 residual is pure T2-cascade.

## The session's elaboration-engineering findings (record-grade, reusable)

1. **The lemma-A whnf bomb, DIAGNOSED AND KILLED** (the six-fire blocker). The
   `set_option diagnostics true` table (run 11, in-log) named it: `HMul.hMul`
   3,374,473 / `Mul.mul` 3,333,908 / `Quotient.map₂` 2,369,789 / `Real.rec`
   1,463,868 unfoldings — a REAL-MULTIPLICATION KERNEL whnf storm. Mechanism:
   `integral_mul_const _ _`'s metavars `∫ a, ?f a * ?c` unified against a
   constant-on-the-LEFT integrand — the elaborator explored the wrong
   (?f := const) decomposition through Quotient-Cauchy real mul (mul-comm on ℝ
   is NOT whnf-trivial). Fix = SYNTACTIC ORDER-AGREEMENT: state hint and calc
   steps 1–3 with the constant on the RIGHT (`integrand * c`), making the
   `integral_mul_const` pattern match syntactically. **Rule for the port: never
   hand `integral_mul_const _ _` a constant-on-the-left goal.**
2. **"No goals to be solved" POISONS with sorryAx** — a tactic firing on an
   already-closed goal is a RECOVERABLE error, and error-recovery adds the
   declaration with sorryAx (the axioms print showed `[propext, sorryAx, …]`
   while the mathematics was complete). lemma A's calc closes the whole theorem
   EARLY (the goal-RHS `((2λ)⁻¹ • dilateTo lam Q) x` is defeq-cheap to the
   calc's end form) — the trailing show+rw had to be DELETED, not fixed.
3. `iteratedDeriv` at the pin is DEFINED via `iteratedFDeriv` (multilinear) —
   `rfl` cannot bridge `iteratedDeriv 2 f x ↔ deriv (deriv f) x`; the bridge is
   the THEOREM `iteratedDeriv_eq_iterate` + the iterate-simp set (mathlib
   `Analysis/Calculus/IteratedDeriv/Defs.lean:55/:312`).
4. Pi-MUL defeq is cheap, Pi-POW is the bomb class (`Continuous.pow` gives
   `f ^ 2`; `Continuous.mul` gives the lambda — always take the lambda).
5. `HasDerivAt.comp` at the pin takes `(x, OUTER, INNER)` — 3 args, point first
   (donor idiom `LogDerivEstimates.lean:190`).
6. `mul_div_cancel₀ (a) (hb : b ≠ 0) : b * (a / b) = a` —
   `GroupWithZero/Units/Basic.lean:460` — the clean scalar-cancel (field_simp
   MANGLES cast-atoms: `↑(2 * lam)` vs `2 * ↑lam` become different ring-atoms).
7. `set_option … in` must PRECEDE the docstring (this cost run 13 its T2/T3).

## The PUBLIC-LAYER RE-CENSUS (amendment (2) directive — EXECUTED, outcome recorded)

Executed 2026-11-20 BEFORE any re-proving. Outcome — the R5/R6 mirror targets
are ALL PUBLIC in the donor (the precharter §2.2 "entirely private except the
last two" was wrong in BOTH directions):
- `fourierC_cutoffSelfConv` — PUBLIC `Hilbert/AlphaExpansion/KernelBessel.lean:512`
  (via the public family-free `fourierC_selfConv`);
- `fourierC_iteratedDeriv_two_cutoffSelfConv` — PUBLIC `Zeta/Kernel.lean:356`;
- `fourierC_correctedTest` — PUBLIC `Zeta/Kernel.lean:375`;
- `correctedTest_weight_cancel` — PUBLIC `Zeta/Kernel.lean:412`;
- `unweightedKernelSum_cutoffTest_eq_pairCorrelationSum` — PUBLIC `Zeta/Kernel.lean:515`;
- `cutoffNormaliser_pos` — PUBLIC `Hilbert/AlphaExpansion/CoefficientSums.lean:212`;
- `fourierC_cutoffTestSq_zero` — PUBLIC `Hilbert/AlphaExpansion/RescaledZeros.lean:217`.
The amendment's "genuinely private" list was right only about the last two names'
Zeta/Kernel.lean SITES — both are public ELSEWHERE (the root `ZetaZeros.lean`
import list covers them). **Consequence:** eta-r4.lean's architecture is pure
TRANSPORT (lemma A + R1's fourierC_dilateTo + the publics) — the donor-private
mirror set is ZERO except the 8-line integrability helper
(`integrable_fourierC_integrand'`, Kernel.lean:88, cited, P1 precedent) and the
R1/R2 carries. The κ=1 discipline holds: `correctedTestLam`'s `1/(4 log²T)`
coefficient and the `4/(4−z²)` pairWeight cancellation are donor-VERBATIM
(`Zeta/Defs.lean:126` shape at `Q_λ`).

## eta-r4.lean contents (sha `06ad527f00d3a30c`, parked unfired)

R5: `testKernel_cutoffTestLam` (T2), `fourierC_cutoffSelfConvLam` (T3),
`fourierC_iteratedDeriv_two_cutoffSelfConvLam` (R5-1),
`fourierC_correctedTestLam` (R5-2); R6: `correctedTestLam_weight_cancel` (R6-3),
`unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum` (R6-4); the λ = 1/2
regression anchors (cutoffSelfConvLam_half, testKernel_cutoffTestLam_half,
fourierC_correctedTestLam_half, unweightedKernelSum_cutoffTestLam_half — each
reduces to the donor's public lemma bit-for-bit); triad gate 10 declarations.
State at run 13: the anchors `cutoffSelfConvLam_half` + (via lemma A, now GREEN
in-tree) the support layer elaborated; T2/T3 gated by the syntax slip; the rest
cascade. Every error in the 4-fire history is mechanical (zero math defects).

## Run ledger (port; amended ceiling 12–13 — REACHED)

Runs 9–13 this session: 9 = the parked-pair re-fire (7+7, falsified the
prediction); 10 = fix-batch-6 + eta-r4 first fire (4+4+23, the diagnostics table
named the real-mul whnf bomb); 11 = 2M heartbeats + fix-batch-7 (2+2+9, timeout
dead, integral_mul_const trap decoded); 12 = order-agreement fix-batch-8 (2+2+11,
r2/r3 down to no-goals-only); 13 = fix-batch-9 (**r2 OK, r3 OK**, r4 syntax-slip
gated). Telemetry all runs: max_mem ≤ 3.3 GB < 4096, wall 421–725 s, OVER counts
= the standing pre-taskset burst class (investigate-not-upgrade; no finding
beyond the g7-documented pattern). Stop-loss honored at 13.

## Next unit (one fire expected)

Fire `eta-r4.lean` @ `06ad527f00d3a30c` (expected: T2/T3 elaborate under their
heartbeat boosts → R5-1/R5-2/R6-3/R6-4 + anchors follow; apply residuals (b)/(c)
only if their named errors appear). On strict-OK: R5+R6 exit → R7 (bridge port,
the de-freezing move) → R8 (full-domain assembly + threshold-form improvement +
full-coverage axcheck per the pilot-10 pattern).

— lane R5 (A3 lineage), 2026-11-20 (worktree agent-04 @ e3d984b; REPORT ONLY — H
commits)

## ADDENDUM (2026-11-20, post-landing) — TELEMETRY DISPOSITION for the session's
## five Modal runs, per AGENTS.md §Modal guideline 3 (H flag on batch-AAA)

Disposition for the sustained build-phase OVER-cpu readings in ALL FIVE session
logs — recorded HERE because the logs themselves lack disposition lines (the
precedent m4b2/G2 runs carried them in-log; this delta records the equivalent
per guideline 3; the landed logs are NOT edited):

- **Class citation — AUTHORIZED lake-build subprocess family (the m4b2/G2
  class).** The OVER-cpu samples are the ZetaZerosV2 donor-tree build phase
  (8262-job `lake build`, fired inside the ephemeral container). The runner
  caps the lake-build command itself via `taskset -c 0,1` (the v4.36 no `-j`
  finding), but the container-wide CPU aggregate during the build/update/cache
  phases reads above the 2.0 spec because transient compile/elan/git/artifact
  subprocesses run before affinity settles — the same signature the m4b2 and G2
  precedent runs carried and had dispositioned (investigate-not-upgrade, no
  code defect; the g7-documented nproc=18-at-cpu=2 container behavior).
- **Memory evidence — in-SPEC throughout:** max_mem 3302 / 3297 / 2742 / 3050 /
  2903 MB across the five runs (all < 4096 soft), `anon=0` in every sample (the
  g7-documented MemTotal−MemAvailable artifact: memory-mapped olean pages, not
  anonymous growth). No memory overrun at any point; no resource change
  requested or warranted.
- **Per-run lines (log → wall / max_cpu / max_mem / OVER):**
  `eta-r2-run5-eta-r3-run2.log` → 634 s / 11.18 / 3302 MB / 8;
  `eta-r2-run6-eta-r3-run3-eta-r4-run1.log` → 725 s / 15.26 / 3297 MB / 9;
  `eta-r2-run7-eta-r3-run4-eta-r4-run2.log` → 593 s / 12.13 / 2742 MB / 6;
  `eta-r2-run8-eta-r3-run5-eta-r4-run3.log` → 421 s / 12.22 / 3050 MB / 6;
  `eta-r2-run9-eta-r3-run6-eta-r4-run4.log` → 626 s / 12.63 / 2903 MB / 8.
- **Action:** none (authorized class; the four-file-stage pattern of the runner
  plus the taskset build cap are already the g7/m4b2-mitigated form). Elaboration
  phases proper (post-build, the verdict-bearing segments) read cpu ≤ 5,
  procs 2–4 — confined.

— lane R5 (A3 lineage), 2026-11-20 addendum (worktree agent-04 @ e3d984b;
REPORT ONLY — H lands the delta)
