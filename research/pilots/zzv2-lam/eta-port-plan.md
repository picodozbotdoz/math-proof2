# Landau η-port — EXECUTION PLAN (skeleton, GREEN-gated on the η-pin-probe)

Lane R5 (A3 lineage), 2026-11-19. Gate: **η-pin-probe GREEN** (`eta-pin-probe-record.md`,
run 2, sha `cadc838d220455a71`) — every statement in this plan's ladder is proved
STATABLE on-pin; this plan turns them into proofs. Billing: **record-billed,
quota-free per DECISION-2 = Option A**; informal content Lamzouri's (must-cite in
full: Lamzouri arXiv:2609.02882 + Montgomery ICF 1974 + BGS-TB 2024 Lemma 5); never
phrase as new mathematics. Load-bearing inputs: `eta-port-precharter.md` (§1 sketches,
§2 decomposition, κ=1 amendment), the probe's statement ladder
(`eta-pin-probe.lean`, identifiers verbatim), `P1-record.md` §HARD-STOP (the ask).

## The private-chain finding this plan is mapped to (precharter §2.2, load-bearing)

The donor bridge `unweightedKernelSum_cutoffTest_tendsto` (`Zeta/Kernel.lean:600`)
depends on a 14-lemma chain (`Kernel.lean:191–:599`) that is **ENTIRELY `private`
except the last two** — module-local, inaccessible to any consumer file even inside
the built tree. Sibling-read-only forecloses donor patching. Therefore **every rung
below re-proves its slice locally at the scaled family** (the P1 precedent
`P1.lean:95/:109` — two private bookkeeping lemmas copied with citations — writ
large); no rung transports a donor proof by invocation. What IS consumable as-is:
the η-generic input layer (`PairCorrelation.tendsto` public, hygiene-gate 7/7
triad-only at the pin probe; `pairCorrelationFormula`; the four λ-generic transfer
endpoints + P1's consumer ladder `thm_*_lam`, all GREEN triad 10/10).

## Runner + guards (unchanged from the pin probe)

Warm app `crossmath-pilot-zzv2-lam` via doz CLI `/home/doz/dozenv/bin/modal`
(semraker), `run_zzv2.sh <files>`; SPEC cpu=2.0/memory=4096 soft, LEAN_NUM_THREADS=2,
`@telemetered`, `taskset -c 0,1` on lake build (no `-j` on v4.36.0-rc2); logs with
provenance headers to `pilots/zzv2-lam/logs/eta-r<n>-run<m>.log`. Port files are
PROOF ARTIFACTS: names carry NO `P0`/probe prefix ⇒ the runner's sorry-strict branch
applies (strict-OK is the only GREEN; any sorry = FAIL, correctly). Phase-2 bake
trigger (precharter §4): if the loop passes ~4 runs, bake the built V2 tree into
image layers (`g7_layers` pattern, fresh ephemeral app) to cut loop runs to ~1–2 min.
Stop-loss: precharter §2.4 ceiling 12–13 runs total for the port.

## Milestone rungs R0–R8 (each exit KERNEL-CHECKABLE: zero sorry, zero errors,
## in-container elaboration, triad-only `#print axioms` for the rung's new theorems)

- **R0 — pin probe. DONE** (this session): statement statability + hygiene gate
  7/7 + 19-name preflight. Exit was `eta-pin-probe-record.md` GREEN. Spend: 2 of
  the probe's 1–3 budget (separate ledger from the port's 6–10).

- **R1 — covariance base layer. GATED-RED at 5/6** (2026-11-19, 2 runs — the
  rung's whole ≤2 budget; port ledger 2 of 6–10): `eta-r1.lean` proves
  `fourierC_dilateTo` (i), `cutoffNormaliserLam_covariance` (ii-a),
  `cutoffTestLam_eq_dilate` (ii-b) + the λ=1/2 test-function checkpoint
  (`dilateTo_half`/`extremalLam_half`/`cutoffTestLam_half`). TRIAD-CLEAN on-pin:
  i, ii-a, dilateTo_half, extremalLam_half. ONE mechanical residual (unfold
  order in ii-b: extremalLam before dilateTo), fix parked on disk UNFIRED per
  budget discipline (N2-P2 precedent), parked sha256(16) `5b04304a53a5b849`;
  eq_dilate + cutoffTestLam_half sorryAx only via that residual. Full state +
  the API-census verdict (PRESENT — `MeasureTheory.Measure.integral_comp_mul_left`
  is the engine; risk 3 downgraded) in `eta-r1-record.md`. **Next unit's first
  action: the confirmation run** (expected strict-OK 6/6 triad → R1 exits GREEN,
  R2 proceeds).

- **R2 — admissibility + pair-test tier. GATED-RED at the unit-3 budget** (2 runs,
  21→16 errors, ALL mechanical — full catalogues in `logs/eta-r2-run{1,2}.log`;
  lemma C's body validated the transport architecture). Fix batch parked UNFIRED,
  parked sha256(16) `36c593f7d9cff455` — **next unit's first action: its
  confirmation run** (expected strict-OK 4/4 triad). TWO SESSION FINDINGS folded
  (full statement in `eta-r2-record.md`): (1) **the (ii-c)/(iii) factor FINDING**
  — the probe's `Q_λ = dilateTo lam Q` and `c_λ = ρ²c₀ + (1−ρ²)Q(0)` are FALSE as
  stated; true forms `Q_λ = (2λ)⁻¹ • dilateTo lam Q` and (at supp Q ⊆ [−1,1],
  ρ ≤ 1) `pairMainTerm Q_λ = ρ·c₀ + (1/ρ − ρ)·Q(0)`; the strict-improvement
  domain becomes the THRESHOLD ρ ∈ (Q(0)/c₀, 1] — R3/R4/R8 statements amended
  accordingly. (2) **the public-layer discovery** — the donor's frozen-family
  facts are PUBLIC in `Zeta/Basic.lean` + `Zeta/CutoffSelfConv.lean` (the
  Kernel.lean privates are duplicates); the pair-test tier transports via lemma A
  + publics, and R5–R7 must re-census their assumed-private lists against that
  layer before re-proving anything.

- **R3 — λ = 1/2 regression FIRST (precharter risk-2 mitigation).** Prove
  `stmt_cutoffSelfConvLam_eq_dilate` (ii-c) and `stmt_eta_regression_half`
  (`dilateTo (1/2) = id` on the nose; scaled family at the frozen point IS the
  frozen family bit-for-bit). Exit: both proved, triad-only; the mid-ladder
  checkpoint that catches a wrong normalisation constant EARLY (before the
  identity layer builds on it).

- **R4 — the scaled closed form (the one covariance-identity lemma).** Prove
  `stmt_scaledConstLam_covariance` (iii): `pairMainTerm Q_λ = ρ²·c₀ + (1−ρ²)·Q 0`
  with ρ = 2λ — the ρ-algebra derivation the precharter §1.3 sketches
  (Q_λ = a²·ρ·(Q ∘ (·/ρ)), `a²·ρ = 1` forced by the Fourier normalisation,
  ∫-window not truncating since 1/ρ ≥ 1). Exit: proved, triad-only. (Battery
  verdict PARTIALLY-COVERED exercise-grade — record-billed infrastructure.)

- **R5 — Fourier layer at κ=1 (donor-verbatim mirror proofs).** Prove
  `stmt_fourierC_iteratedDeriv_two_cutoffSelfConvLam` and
  `stmt_fourierC_correctedTestLam` (mirrors of the private
  `fourierC_iteratedDeriv_two_cutoffSelfConv` / `fourierC_correctedTest`,
  `Kernel.lean:540±`-area) at the scaled family — the coefficient stays
  `1/(4 log²T)` (κ=1 amendment; `fourierC(Q'') = (2πiz)²·fourierC(Q)`,
  `fourierC(f⋆f) = fourierC(f)²` family-free modulo regularity). Exit: both
  proved, triad-only.

- **R6 — weight cancellation + exact identity.** Prove
  `stmt_correctedTestLam_weight_cancel` (the pairWeight `4/(4−z²)` cancellation at
  `z = rescaledDiff`, family-independent at κ=1) and
  `stmt_unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum` (the exact
  identity, donor `:575±`-area shape: kernel sum = pairCorrelationSum at Q_λ minus
  the `1/(4 log²T)` second-derivative correction). Exit: both proved, triad-only.

- **R7 — the bridge port (the de-freezing move).** Prove
  `stmt_bridge_port_complex` (donor `:600` shape, complex division) and derive
  `stmt_scaledBridge` (the `.re / zeroScale` projection — micro-lemma class),
  consuming the PUBLIC `PairCorrelation.tendsto` at the R2 instance
  `cutoffSelfConvLam` (its on-pin signature, pinned at the probe, takes the
  instances unreshaped). Then the discharge glue: `discharge_of_scaledBridge`
  already elaborates (probe) — R7 supplies its two binders for concrete ψ. Exit:
  bridge proved, triad-only.

- **R8 — full-domain assembly + strict improvement + final sweep.** Prove
  `stmt_exists_KSAsymptotic_of_pos` (two-arm: λ ≥ 1/2 = P1's
  `exists_KSAsymptotic_of_half_le` UNCHANGED; λ ∈ (0, 1/2] = the R7 port arm at
  `c = scaledConstLam lam ψ`) and `stmt_scaled_const_improves` (positivity
  discharged from ψ ≥ 0, ψ ≢ 0 ⇒ `Q 0 < pairMainTerm Q`; frozen 2/3-class margins
  transfer to every λ ∈ (0, 1/2)). Exit: the headline proved + a FULL-COVERAGE
  axcheck sweep over the port artifact (pilot-10 `axcheck_full.py` pattern — dotted
  names + `@[simp]`, dependency-order oleans; the AGENTS.md standard for
  donor-swap pilots), file-wide triad-only, zero sorryAx.

## Run-budget mapping (precharter §2.4: 6–10 port runs, ceiling 12–13)

R1 → **GREEN at 3 runs** (2 fix + 1 confirm; exit met 6/6 triad) · R2 → **2 fix
runs spent, GATED-RED, confirmation parked** (`36c593f7d9cff455`; next unit's
first action) · R3 → 1 · R4 → 1 (possibly +1 fix) · R5+R6 → 1–2 (κ=1 keeps the
identity layer donor-verbatim; re-census vs the public layer first) · R7 → 1
(+fix tail) · R8 → 1. Port ledger: **6 of 6–10 spent**; the ceiling (12–13)
absorbs the R2 confirmation; the public-layer discovery keeps the band honest.
Each run persists `logs/eta-r<n>-run<m>.log` with provenance header + criterion
quote + verdict (the pin-probe log convention).

## Risk register (carried; precharter §2.3, post-amendment states)

1. ~~coefficient-sensitivity~~ DISSOLVED by κ=1 (amendment; battery component (ii)
   → COVERED). Residual: inline `1/(4 log²T)` constants in the donor's private
   proofs still need re-derivation at the scaled family, but verbatim-shaped.
2. Normalisation web — mitigated by R3-first ordering (wrong ρ-power surfaces at
   the regression, not at R7).
3. `iteratedDeriv`-under-dilation API on mathlib @ `ff2494ea` — RESOLVED at R1
   (census verdict PRESENT: the donor's own `iteratedDeriv_eq_iterate` idiom +
   `HasDerivAt.div_const`/`.comp`, #check-anchored on-pin in `eta-r1.lean`; see
   `eta-r1-record.md` §API census). Downgraded to expected friction, not a
   lemma's worth.
4. Budget-class: 0.8–1.5k LoC, class L (unchanged).

## Descope/stop rules

Sorry-strict on every port file; any math defect = finding + record, never an
in-artifact sorry; two consecutive no-progress runs ⇒ stop, record, re-charter the
residual; ceiling 12–13 runs hard. On completion: the port artifact is the P2 the
P1 hard-stop specified — `∃ c, KSAsymptotic lam c` discharged on the honest
domain `(0, ∞)` — and the record closes Option A's technical-record continuation.

— lane R5 (A3 lineage), 2026-11-19 (worktree agent-04 @ 53c1548; REPORT ONLY — H
commits post-K)
