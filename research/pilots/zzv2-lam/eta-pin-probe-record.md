# η-pin-probe — FINAL record (iteration-5 day-1, wave 4)

**Billing: technical record / infrastructure probe — record-billed, quota-free per
DECISION-2 = Option A** (`qa/iter4-review/a6-iter5-charter-draft.md` §6 row 2, ruled
2026-11-18: "Option A — record-billed, quota-free"; the round-5 battery grades every
η-port component below the S1 bar; informal content Lamzouri's — must-cite in full,
never phrase as new mathematics). Elaboration verdicts only, never proof claims.

## Verdict

**GREEN — PROBE COMPLETE** (`logs/eta-pin-probe-run2.log`, 2026-11-19; run
`ap-rMawIAp2A8xPdQhUrs9443`). `build: OK` (ZetaZerosV2 + redirected PNT+ tree,
mathlib `ff2494ea5e438f8a8452db803068acd711fa0059` resolved in-container) and
`eta-pin-probe.lean: OK` under the runner's **sorry-strict** verdict branch (rc=0,
0 errors, 0 sorry — the firing paragraph's intentional strict-OK). Success criterion
met in full: **statement-elaboration of the η-pin lemma chain at κ=1 against the
ZZV2 donor statement classes** — every scaled-family def, the ScaledBridge binder
rung + the trivial `discharge_of_scaledBridge` wrapper, and all 14 Prop-valued
statement defs (covariance ladder (i)/(ii-a)/(ii-b)/(ii-c)/(iii), admissibility,
pair-test analogues, the four donor-mirrored Fourier/identity statements at the
DONOR `1/(4 log²T)` coefficient, the bridge ports, the full-domain target, the λ=1/2
regression, the strict-improvement transfer) elaborate on-pin as statable, meaningful
Props. **Donor-hygiene gate (Cycle-2 convention, on-pin prints): 7/7 triad-only** —
`PairCorrelation.tendsto`, `pairCorrelationSum`, `pairWeight`, `pairCorrelationFormula`,
`simpleOnLineCount_lower`, `distinctZeroCount_lower`,
`unweightedKernelSum_cutoffTest_tendsto` each print exactly
`[propext, Classical.choice, Quot.sound]`; zero sorryAx. This supersedes P0's
4-name claim-level check for the port's consumption set (precharter §3 gate action,
executed). 19/19 donor `#check` preflight names resolved.

Artifact: `research/pilots/zzv2-lam/eta-pin-probe.lean` — 323 LoC as fired
(319 staged + the 4-line dated fix comment), fired sha256(16) **`cadc838d220455a71`**
(staged/unfired sha `afa0c06c514ef74b` = H's `c359f48` re-pull stamp).

## Runs (2 of budget 1–3; 1 fix-loop)

1. `logs/eta-pin-probe-run1.log` — FRICTION (one mechanical error; run
   `ap-v35oNQsyWxcz8Z9lWNPlDn`, wall 633 s): `lean.dependsOnNoncomputable` at
   `:108` — `dilateTo` divides on ℝ (`x / (2 * lam)`) and needs the
   `noncomputable` marker. IDENTICAL to P1-run2's documented friction class
   (C1Lam/C2Lam divide-on-ℝ → `noncomputable def`; `P1-record.md` §Runs). The
   donor-hygiene 7/7 triad gate and the full 19-name preflight ALREADY passed in
   this run (single error = the marker, nothing else). Fired sha `afa0c06c514ef74b`.
2. `logs/eta-pin-probe-run2.log` — **GREEN** (run `ap-rMawIAp2A8xPdQhUrs9443`,
   wall 629 s): one-word fix (`noncomputable def dilateTo` + dated comment; zero
   math changed) → strict-OK, 0 sorry, 7/7 triad, criterion MET. Fired sha
   `cadc838d220455a71`.

Route both runs: doz CLI `/home/doz/dozenv/bin/modal`, profile semraker (PRIMARY per
the 2026-11-17 route ruling). App `crossmath-pilot-zzv2-lam`, the warm lineage per the
probe's own H-stamped firing paragraph + precharter §4 Phase 1 (task-card app-name
discrepancy reconciled in the run-1 log header: the probe `import ZetaZeros` cannot
elaborate on the mathlib-only `crossmath-probe` app; xyz fallback not needed).
SPEC cpu=2.0/memory=4096 soft, LEAN_NUM_THREADS=2 (CAP secret), `@telemetered`,
`taskset -c 0,1 lake build ZetaZeros` (lake v4.36.0-rc2 has no `-j`).

## Telemetry (investigate-not-upgrade, both runs)

Wall 633/629 s (precedent band 582–681 s); max_mem 3340/2683 MB < 4096 (mem =
MemTotal−MemAvailable incl. mathlib-olean mmap pages — the documented G7b-measurement
class); max_cpu 15.35/12.31, OVER=9 samples each run — ALL confined to the documented
pattern (P1-run3 identical): pre-taskset `lake update` git-fetch + `cache get` zstd
phases burst (un-controllable), build phase reads ~2.7–3.6 cpu (taskset-capped lake +
the un-capped telemeter/parent reader), elaboration reads ~4.7 (lean threads capped by
LEAN_NUM_THREADS=2). Investigation conclusion: no unnecessary rebuild, no mis-scoped
import, closure is the donor tree as-is (M4b2 recipe minimum); run correctly sized
(one file, one pass). No resource change warranted; defaults held, nothing escalated.

## Findings

- **Mechanical (fixed in-budget):** the `noncomputable` marker on `dilateTo` — the
  staged file's only defect, the known P1-run2 class. No other friction: every donor
  name, namespace, and statement shape resolved first try (the c359f48 runner-compat
  4/4 pre-flight held).
- **Math defects: NONE found at the statement tier.** All 14 mirrored/statement Props
  elaborate against the donor's actual signatures on-pin — in particular the four
  donor-mirrored statements (`fourierC_iteratedDeriv_two_cutoffSelfConvLam`-shape,
  `fourierC_correctedTestLam`-shape, `correctedTestLam_weight_cancel`-shape,
  `unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum`-shape) typecheck at the
  κ=1 coefficient, confirming the staging amendment's central claim is *statable*
  exactly as donor-verbatim. (Statability ≠ provability — the proofs are the port's
  rungs.)
- **Statement-layer confirmation for the port plan:** `PairCorrelation.tendsto`'s
  on-pin signature (visible in the run-2 output tail) is exactly
  `IsPairTestFunction f → Tendsto (fun T => pairCorrelationSum f T / ↑(zeroScale T))
  atTop (𝓝 ↑(pairMainTerm f))` — the port's bridge-assembly rung consumes it at
  `cutoffSelfConvLam`-class instances with no reshaping.

## Next step

**The η-port execution plan — `pilots/zzv2-lam/eta-port-plan.md` (drafted this
session, GREEN-gated on this probe).** Run budget per the precharter's honest band:
**6–10 runs for the port proper** (the precharter §2.4 composition minus this probe's
1 line item, now spent: 4–8 proof-loop + 1 regression/assembly; ceiling 12–13 if the
covariance/normalisation web needs extra fix-loop; the κ=1 amendment keeps the
identity layer donor-verbatim so the 5–8 plausible sub-band stands). Runner: warm
lineage as-is; staged-image option (precharter §4 Phase 2, `g7_layers` pattern) if
the loop grows past ~4 runs.

— lane R5 (A3 lineage), 2026-11-19 (worktree agent-04 @ 53c1548; REPORT ONLY — H
commits post-K)
