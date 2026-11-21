# η-port R4-file (R5+R6 Fourier/identity layer at κ=1) — record: FULL GREEN EXIT (run-14 grant-fire; rungs 2/3 at runs 9–13, R5+R6 at run 14) — THE PORT LEDGER CLOSES 14-OF-12–13

**Billing: technical record per DECISION-2 = Option A (record-billed, quota-free)**
— infrastructure only, never discovery-phrased; informal λ-dependence Lamzouri's
(must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

## Headline verdicts (port runs 9–14; logs in `logs/`)

- **RUN 14 (grant-fire 2, 2026-11-21): R5+R6 EXIT GREEN — THE PORT LEDGER CLOSES
  14-OF-12–13.** `eta-r4.lean` @ `285a411e48c3ad1e` fired AS-IS (the
  off_peak_cancelled batch's pre-applied-unfired routes landed at main `0df2546`;
  D5b resume grant, ONE fire, no residue): strict-OK rc=0 **errors=0 sorry=0**,
  **ALL 10 GATED DECLARATIONS TRIAD-CLEAN** `[propext, Classical.choice,
  Quot.sound]` and nothing else (no sorryAx, no error-recovery phantom axioms —
  contrast run 13's cascade): `testKernel_cutoffTestLam` (T2),
  `fourierC_cutoffSelfConvLam` (T3), `fourierC_iteratedDeriv_two_cutoffSelfConvLam`
  (R5-1), `fourierC_correctedTestLam` (R5-2), `correctedTestLam_weight_cancel`
  (R6-3), `unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum` (R6-4) + the
  four λ=1/2 anchors. Regression anchors HOLD (r2 4/4, r3 2/2, triad). Log
  `logs/eta-r2-run10-eta-r3-run7-eta-r4-run5.log` @ `cebc4730f888a7f4`
  (telemetry disposition IN-LOG this time — the task-3 required form). The
  run-13 residuals DISCHARGED: route (b)'s explicit `div_const` divisor + the
  heartbeat insurance carried the :590 split clean; residual (c) (donor
  character-for-character mirror) NEVER triggered. Fourier/identity rungs now
  queue per D5b: R7 bridge port → R8 full-domain assembly (fresh grants).
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

## eta-r4.lean contents (parked sha `06ad527f00d3a30c` → fired at run 14 as the routes-(b)-applied `285a411e48c3ad1e`, GREEN)

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
gated). **Run 14 (2026-11-21, grant-fire 2 of the ≤3-fire order at the resumed
payload `285a411e48c3ad1e`): r4 OK — ALL THREE FILES strict-OK in one run**
(build OK / r2 OK / r3 OK / r4 OK; log
`eta-r2-run10-eta-r3-run7-eta-r4-run5.log`). Telemetry all runs: max_mem ≤ 3.3 GB
< 4096, wall 421–725 s, OVER counts = the standing pre-taskset burst class
(investigate-not-upgrade; no finding beyond the g7-documented pattern). Stop-loss
honored at 13; run 14 was the D5b-resumed grant fire (one over the 12–13 band,
explicitly granted), and it closed the port.

## Next unit (one fire expected) — EXECUTED 2026-11-21 as grant-fire 2, GREEN

Fire `eta-r4.lean` @ `06ad527f00d3a30c` (expected: T2/T3 elaborate under their
heartbeat boosts → R5-1/R5-2/R6-3/R6-4 + anchors follow; apply residuals (b)/(c)
only if their named errors appear). **EXECUTED** at the RESUMED payload
`285a411e48c3ad1e` (the off_peak_cancelled batch applied route (b) + cast
cleanups + heartbeat insurance to the parked file; landed unfired at `0df2546`)
— **strict-OK GREEN, see the run-14 headline + addendum 2.** On strict-OK:
R5+R6 exit → R7 (bridge port, the de-freezing move) → R8 (full-domain assembly +
threshold-form improvement + full-coverage axcheck per the pilot-10 pattern) —
**R7/R8 now queue for fresh grants per D5b.**

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

## ADDENDUM 2 (2026-11-21) — RUN 14 RECORD: grant-fire 2 GREEN, the port CLOSES

- **Fire:** grant-fire 2 of the ≤3-fire order (D5b resume grant; ONE fire, no
  residue, no re-fire). Payload `eta-r4.lean` @ `285a411e48c3ad1e` VERIFIED
  against sha256sum BEFORE firing (the landed state at HEAD, main `0df2546`);
  regression anchors `eta-r2.lean` @ `a9c6b59f8a769335`, `eta-r3.lean` @
  `21fb0c4e45f88b92` (unchanged GREEN shas) staged in the same run per the
  runs-4-onward multi-file pattern. Invocation (provenance line, log head):
  `bash research/pilots/zzv2-lam/run_zzv2.sh research/pilots/zzv2-lam/eta-r2.lean
  research/pilots/zzv2-lam/eta-r3.lean research/pilots/zzv2-lam/eta-r4.lean`.
- **Route:** doz CLI `/home/doz/dozenv/bin/modal` (PRIMARY, warm), profile
  semraker, ephemeral app `crossmath-pilot-zzv2-lam`, no volume/secret; SPEC
  cpu=2.0 / memory=4096 soft, `LEAN_NUM_THREADS=2` (CAP secret), `@telemetered`
  60 s interval, `taskset -c 0,1` on the build command. Modal run
  `ap-pHsSK9bf305goL7i0zljF2`.
- **Verdict (parsed from the log, site-closure-is-not-certification rule):**
  SUMMARY `build: OK / eta-r2.lean: OK / eta-r3.lean: OK / eta-r4.lean: OK`,
  container EXIT=0; `": error"` lines = **0**, `"declaration uses 'sorry'"`
  lines = **0** across the whole log; remaining diagnostics are benign linter
  warnings only (deprecated `if_neg`/`if_pos` hints in r2; unused-variable ×2,
  unused-tactic ×3). **eta-r4 strict-OK, 10/10 TRIAD-CLEAN** — every gated
  declaration prints exactly `[propext, Classical.choice, Quot.sound]`: T2
  `testKernel_cutoffTestLam`, T3 `fourierC_cutoffSelfConvLam`, R5-1
  `fourierC_iteratedDeriv_two_cutoffSelfConvLam`, R5-2
  `fourierC_correctedTestLam`, R6-3 `correctedTestLam_weight_cancel`, R6-4
  `unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum`, anchors
  `cutoffSelfConvLam_half`, `testKernel_cutoffTestLam_half`,
  `fourierC_correctedTestLam_half`, `unweightedKernelSum_cutoffTestLam_half`.
  No sorryAx anywhere; no error-recovery phantom-axiom deps (run 13's
  `fourierC_correctedTestLam`-as-axiom cascade is GONE).
- **Residual routes:** (b) DISCHARGED as pre-applied (the explicit
  `hI2.div_const ((4 * Real.log T ^ 2 : ℝ) : ℂ)` divisor, :616–:619, is IN the
  fired bytes and the :590 split elaborated clean); heartbeat insurance :490
  held T2 under budget; **(c) never triggered** (the show-block ring went
  through without the donor mirror). No new residue. Zero math defects across
  the whole 6-fire eta-r4 history — every error class was mechanical.
- **Telemetry disposition (also IN-LOG this time, the task-3 required form):**
  wall=649 s, max_cpu=12.78, max_mem=2757 MB (< 4096 soft), max_anon=0 MB,
  samples=10, OVER=9 — ALL in the AUTHORIZED build-phase class (m4b2/G2
  signature: donor-tree build/update/cache subprocess family; build command
  taskset-capped; peak 12.78 at t=180 s = the `lake exe cache get` artifact
  phase; elaboration phases proper cpu ≤ 4.21, procs 3–4, the standing confined
  class; anon=0 every sample = the olean-mmap MemTotal−MemAvailable artifact).
  Action: NONE — investigate-not-upgrade satisfied by class citation; no
  resource change requested or warranted.
- **Ledger:** the η-port ledger CLOSES at **14-of-12–13** (the one-over-band
  resumed-grant fire). Per D5b, on strict-OK the Fourier/identity rungs queue
  with a FRESH grant: R7 (bridge port) → R8 (full-domain assembly +
  threshold-form improvement + full-coverage axcheck per the pilot-10 pattern).
  Billing: technical record per DECISION-2 = Option A (record-billed,
  quota-free) — the port is infrastructure, never discovery-phrased.

— lane R5 (A3 lineage), 2026-11-21 (worktree agent-04 @ ef1e7bd; REPORT ONLY —
H lands: the run-14 log + this record update + the title/headline/ledger/next-unit
amendments above)
