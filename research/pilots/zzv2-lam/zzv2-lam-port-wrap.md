# zzv2-lam LANDAU η-PORT — PILOT-LEVEL WRAP RECORD (the port-arc close; rungs R0–R6 kernel-complete at iter-6, R7 CLOSED GREEN at iter-7 day-1 — see §5 the continuation; R8 firing)

Lane R5 (A3 lineage), 2026-11-21 (worktree agent-04 @ 5c7fac7; REPORT ONLY — H
commits). **Billing: ENGINEERING DELIVERABLE per DECISION-2 = Option A
(record-billed, quota-free)** — infrastructure only, explicitly NOT a discovery;
never article-phrased. All informal mathematics is Lamzouri's (must-cite in full
wherever any part of this pilot is referenced: Lamzouri arXiv:2609.02882;
Montgomery ICF 1974; Baluyot–Goldston–Suriajaya–Turnerbaugh 2024 Lemma 5). This
wrap closes the arc at GREEN run 14 (`eta-r4-record.md` @ `189cd5b0`, log
`cebc4730`; landed at main `25879dd` + the orchestrator's banking ruling folded
in `h-wave4-log.md`).

## 1. The arc narrative

**Origin (iteration 4, 2026-11-17).** The ZZV2-λ ladder (r5-iteration4-backlog
§12a route (a), slot-3 KEEP) ran P0 (statement-facts probe, GREEN run 1,
`ab9974f1`) then P1 (the λ-abstract statement layer, GREEN run 3, `a9a6555c`,
10/10 triad-only) and HARD-STOPPED by its own rule: P0(b) found the donor's
Landau kernel-sum bridge MT-frozen (`unweightedKernelSum_cutoffTest_tendsto`,
`Zeta/Kernel.lean:600`, proved only at frozen `extremalTest`-base kernels) —
discharging P1's `hKS : KSAsymptotic lam c` binders at genuinely λ-scaled
kernels requires re-proving the corrected-test machinery at a scaled family = "a
Landau η-port", ruled a charter decision for iteration 5 (`P1-record.md`
§HARD-STOP — the ask this port answers).

**Charter + gate (iteration 5).** Precharter + κ=1 amendment landed
(`eta-port-precharter.md`, `eta-port-precharter-amendment.md` @ `ca2470c2`); the
pin probe went GREEN run 2 (`cadc838d`, 7/7 donor hygiene triad prints, 19/19
preflight names) — every statement in the plan's ladder STATABLE on-pin. The
execution plan (`eta-port-plan.md`) fixed rungs R0–R8, the sorry-strict rule
(port files are PROOF ARTIFACTS — strict-OK the only GREEN), and the stop rules.

**The rung ledger, runs 1–14** (one line per port fire; per-file run counts ride
the log names; payload shas cited WHERE ON RECORD — the log provenance headers /
records name every fired sha from run 6 onward plus the run-1/2/3 and parked
states; runs 4–5's fired states are identified by their fix-batch labels + log
paths, their shas not sha-cited in the headers):

| # | rung / files | payload shas (fired) | verdict | residue discharged |
|---|---|---|---|---|
| 1 | R1 `eta-r1` | `5807c02b` | FAIL 4 err | smul-lemma class (`Complex.real_smul`) + λ-keyword identifier class (catalogue in `eta-r1-run1.log`) |
| 2 | R1 | `cb10920d` | FAIL 1 err | the unfold-order residual isolated (extremalLam BEFORE dilateTo) |
| 3 | R1 | `5b04304a` (parked fix fired) | **GREEN 6/6 triad** | R1 EXITS (i, ii-a, ii-b + the λ=1/2 checkpoint anchors) |
| 4 | R2 `eta-r2` | fix-batch-1/2 state | FAIL 21 err | full mechanical catalogue (HO-pattern rw, div-iff, API names) |
| 5 | R2 | fix-batch-3 state | FAIL 16 err | the batch converging; `:160` whnf-timeout persists |
| 6 | R2 | parked `36c593f7` | FAIL 15 err | narrow to the `:160` storm + cascade |
| 7 | R2+R3 joint (`eta-r2`+`eta-r3`, first multi-file fire) | fix-batch-4 state + `eta-r3` FIRST fire | FAIL 10 + FAIL 8 | **ROOT DECODED**: the `:160` whnf-timeout was an Eq.symm-direction CASCADE (never a rewrite defect); eta-r3's own 8 = intervalIntegral HO-patterns |
| 8 | R2+R3 (the parked pair) | `38bb8463` + `ed0c0612` | **DEAD FIRE** (wave-4 external termination; transcript unread, nothing re-derived) | — (budget honestly spent; `RESUME-BRIEF-ITER5` §(g)2) |
| 9 | R2+R3 re-fire (same parked pair) | `38bb8463` + `ed0c0612` | FAIL 7 + FAIL 7 — **falsified the expected strict-OK** | the parked batch-5 fixes were UNVERIFIED; the (ii-c) integrand trap named (cutoffTestSq-form calc steps) |
| 10 | R2+R3+R4 first joint three-file | `ed412a03` + `ddf85a41` + `1eead7a4` (fix-batch-6; `eta-r4` FIRST FIRE) | 2+2+23 err | the 3.37M-unfolding whnf bomb NAMED by `set_option diagnostics` (HMul/Mul/Quotient.map₂/Real.rec — the real-mul kernel storm) |
| 11 | three-file (fix-batch-7; 2M heartbeats + diagnostics) | `a92118ff` + `0bd1942d` + `9c2721ca` | 2+2+9 err | timeout dead; the `integral_mul_const` constant-on-the-LEFT metavars trap decoded |
| 12 | three-file (fix-batch-8, syntactic order-agreement) | `1c268f5b` + `3b8813e0` + `a6c24ae4` | 2+2+11 err | r2/r3 down to no-goals-only; the poison rule found ("no goals to be solved" adds sorryAx) |
| 13 | three-file (fix-batch-9) | `a9c6b59f` + `21fb0c4e` + `cf8f6ca3` | **r2 GREEN 4/4 + r3 GREEN 2/2 (RUNGS 2/3 EXIT)**; r4 FAIL 10 | the r4 gate = a `set_option … in`-between-docstring-and-decl SYNTAX SLIP (parser recovery dropped both heartbeat boosts → T2/T3 whnf re-budgets; 8 of 10 pure cascade); fix-batch-10 parked unfired `06ad527f` at the 13-run stop-loss |
| 14 | three-file (GRANT-FIRE 2, fired AS-IS) | `a9c6b59f` + `21fb0c4e` + **`285a411e`** (the D5b resume payload: fix-batch-10 + route (b) explicit `div_const` divisor + cast cleanups + heartbeat insurance, pre-applied-unfired by the off_peak_cancelled batch, landed `0df2546`) | **GREEN ALL THREE: r4 strict-OK 10/10 TRIAD-CLEAN** (`cebc4730`) | route (b) discharged-as-pre-applied; route (c) (donor character-for-character mirror) NEVER triggered; the run-13 error-recovery-axiom cascade GONE |

**The fix-batch lineage (all mechanical, zero math defects across the whole
arc):** batch-1/2 (R1 smul + identifier classes) → parked unfold-order fix (R1
exit) → batch-3/4 (R2 catalogue) → batch-5 (R2+R3, falsified at run 9) →
batch-6 (the diagnostics table naming the whnf bomb) → batch-7 (heartbeats +
the `integral_mul_const` order trap) → batch-8 (syntactic order-agreement —
"never hand `integral_mul_const _ _` a constant-on-the-left goal") → batch-9
(the rung-closing content for r2/r3; the syntax slip) → batch-10 + route (b) +
heartbeat insurance (the landed `285a411e`, first-shot GREEN at run 14).

**The band discipline.** Plan ceiling 12–13 (precharter §2.4); the operative
amended band 11–13 (`RESUME-BRIEF-ITER5` §(g)2, D5b's phrasing). The stop-loss
FIRED at run 13 (fix-batch-10 parked unfired rather than a 14th in-session
fire); run 14 was NOT budget creep but the explicitly-granted D5b one-fire
(iter-6 day-1 grant at `06ad527f`, superseded by the resume payload `285a411e`
after the off-peak reclaim cancelled the applying run) — grant-fire 2 of the
≤3-fire order, record-billed per DECISION-2 = Option A. **The ledger closed at
14-of-12–13** with every fire sha-guarded, every log persisted with provenance
headers, and the honest-park conventions honored at each gate.

**The run-13 cascade root and its run-14 resolution.** Root: `set_option
maxHeartbeats … in` placed BETWEEN a docstring and its declaration is invalid
Lean 4 — parser recovery silently dropped BOTH heartbeat boosts, so the div-lemma
and T3 re-hit their whnf budgets at the 200k default, stub'd T2/T3, and made 8
downstream theorems "depend" on the failed names (error-recovery axioms). Run 14
fired the repositioned options (before the docstrings) plus the pre-applied
route (b); all 10 gated declarations now print the bare triad — the phantom-axiom
cascade is provably gone.

## 2. The engineering deliverable (what the kernel now holds; explicitly NOT a discovery)

**Verified surface, all print-verified triad-clean at the final runs (each
exactly `[propext, Classical.choice, Quot.sound]`, zero sorryAx, rc=0):**

- `eta-r1.lean` @ `5b04304a` — 6/6: `fourierC_dilateTo` (i, junk-value-safe,
  only `0 < lam`), `cutoffNormaliserLam_covariance` (ii-a),
  `cutoffTestLam_eq_dilate` (ii-b), `dilateTo_half`, `extremalLam_half`,
  `cutoffTestLam_half` (the λ=1/2 checkpoint).
- `eta-r2.lean` @ `a9c6b59f` — 4/4: `cutoffSelfConvLam_eq_scaled_dilate`
  (**lemma A — THE (ii-c′) FINDING's theorem**, the six-fire whnf blocker),
  `cutoffTestLam_isAdmissible`, `cutoffSelfConvLam_isPairTestFunction`,
  `iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction`.
- `eta-r3.lean` @ `21fb0c4e` — 2/2: `pairMainTerm_cutoffSelfConvLam` (the
  corrected (iii′) covariance), `scaledConstLam_half` (the λ=1/2 bit-for-bit
  regression anchor).
- `eta-r4.lean` @ `285a411e` — 10/10: `testKernel_cutoffTestLam` (T2),
  `fourierC_cutoffSelfConvLam` (T3),
  `fourierC_iteratedDeriv_two_cutoffSelfConvLam` (R5-1),
  `fourierC_correctedTestLam` (R5-2, κ=1 `1/(4 log²T)` donor-verbatim),
  `correctedTestLam_weight_cancel` (R6-3), 
  `unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum` (R6-4) + the four
  λ=1/2 anchors (`cutoffSelfConvLam_half`, `testKernel_cutoffTestLam_half`,
  `fourierC_correctedTestLam_half`, `unweightedKernelSum_cutoffTestLam_half`).
  (eta-r4 is SELF-CONTAINED: its support layer re-proves the r1/r2 architecture
  in-file — each port file elaborates standalone via `lake env lean`.)

**What it feeds (the consumer chain, all in-pilot):** P1's λ-abstract statement
layer @ `a9a6555c` (10/10 triad, GREEN) — `thm_simple_lam` / `thm_distinct_lam`
/ `thm_average_lam` / `thm_simple_or_critical_lam` (each under the
`hKS : KSAsymptotic P.lam c` binder) + `exists_KSAsymptotic_of_half_le`
(the λ ≥ 1/2 arm, proved) + the two half-regression anchors. The banked R7/R8
rungs (§3) complete the loop: R8's two-arm `exists_KSAsymptotic_of_pos`
assembles P1's λ ≥ 1/2 arm with the ported λ ∈ (0, 1/2] arm, discharging P1's
binders on the honest domain `(0, ∞)` — the P2 the P1 HARD-STOP specified.

**Negative consumer check (recorded for precision):** grep over `research/`
finds NO consumer of the ZZLam/η-port surface outside `pilots/zzv2-lam/` — in
particular the 32-rc-savings family (`articles/32-rc-savings-frontier.md`,
`pilots/32*`, algorithms-formalization lineage) has NO dependency on this port
(the task brief's parenthetical notwithstanding). The port's consumers are P1's
statement ladder and, prospectively, the donor's public
`PairCorrelation.tendsto` endpoint via R7. If an out-of-pilot consumer appears,
it enters through P1's binders or the R7 bridge — never by importing port files
directly (the runner elaborates them inside the built V2 tree, not as modules).

**Statement-tier finding carried (the arc's one mathematical event, recorded
where it belongs — NOT a shipped theorem):** the probe/precharter forms
`Q_λ = dilateTo lam Q` and `c_λ = ρ²c₀ + (1−ρ²)Q(0)` were FALSE as stated;
lemma A proves the true form `Q_λ = (2λ)⁻¹ • dilateTo lam Q` and r3 the
corrected covariance `ρ·c₀ + (1/ρ − ρ)·Q(0)` — with the strict-improvement
domain a THRESHOLD ρ ∈ (Q(0)/c₀, 1] (`eta-r2-record.md` §THE FINDING; the
correction binds R8's statement shape, §3).

## 3. The iter-7 Tier-2 handoff (banked per the orchestrator's ruling at `25879dd`; NO fresh iter-6 grant)

**Banking record:** `h-wave4-log.md` 2026-11-21 fold — the port-plan
Fourier/identity-successor rungs BANK to the iter-7 Tier-2 bench; the census
DRAFT row (`novelty/iter7-seed-census-DRAFT.md` row 4, `422face2`) banks "η
R5+R6 … CONDITIONAL on `285a411e` GREEN" — the condition is now SATISFIED, and
the row's rung label is stale (R5+R6 closed at run 14): **the banked items are
R7 and R8**, flagged for the census owner's iter-7 refresh.

- **R7 — the bridge port (the de-freezing move).** Statement targets
  (probe-stated, statability GREEN at the pin): `stmt_bridge_port_complex`
  (donor `Zeta/Kernel.lean:600` shape, complex division) → derive
  `stmt_scaledBridge` (the `.re / zeroScale` projection, micro-lemma class) →
  `discharge_of_scaledBridge`'s two binders for concrete ψ (elaborates already).
  Consumes the PUBLIC `PairCorrelation.tendsto` at the R2 instance
  `cutoffSelfConvLam` (on-pin signature pinned at the probe, instances
  unreshaped). Substrate: unchanged — warm app `crossmath-pilot-zzv2-lam`
  (doz CLI, semraker), image layers byte-identical to the m4b2 family, donor
  tree 8262-job in-run build. Price (plan §budget-mapping, adjusted by the
  r4-file economics): 1 fire + fix tail; each three-file fire ≈ 10–12 min wall
  at SPEC 2 cpu / 4 GB. If the loop exceeds ~4 runs, the phase-2 bake
  (`g7_layers` pattern, fresh ephemeral app) cuts per-run cost to ~1–2 min —
  the plan's own trigger. **Precondition: a FRESH orchestrator grant (iter-7).**
- **R8 — full-domain assembly + strict improvement + final sweep.** Statement
  targets: `stmt_exists_KSAsymptotic_of_pos` (two-arm: λ ≥ 1/2 = P1's
  `exists_KSAsymptotic_of_half_le` UNCHANGED; λ ∈ (0, 1/2] = the R7 port arm at
  `c = scaledConstLam lam ψ`) and `stmt_scaled_const_improves` — **carrying the
  corrected THRESHOLD antecedent** ρ ∈ (Q(0)/c₀, 1] per the (ii-c)/(iii) finding
  (the frozen 2/3-class margin transfer needs re-derivation under the corrected
  form; positivity from ψ ≥ 0, ψ ≢ 0). Exit includes the FULL-COVERAGE axcheck
  sweep over the port artifact (pilot-10 `axcheck_full.py` pattern: dotted
  names + `@[simp]`, dependency-order oleans — the AGENTS.md standard for
  donor-swap pilots). Price: 1 fire + 1 axcheck run.
- **The rules bank (cite, do not restate):** the seven elaboration-engineering
  rules + the whnf-bomb/order-agreement/poison findings
  (`eta-r4-record.md` §findings), R1's API census (`integral_comp_mul_left`
  engine; iteratedDeriv-under-dilation idiom; `Complex.real_smul` pin,
  `eta-r1-record.md`), and the R2 public-layer re-census discipline
  (`Zeta/Basic.lean` + `Zeta/CutoffSelfConv.lean` carry the frozen-family
  publics; re-census ANY assumed-private list before re-proving).

## 4. Custody / verification pointers for the close act (the G2 batch surface)

- **Verdict-bearing logs (the triad evidence):**
  `logs/eta-r2-run10-eta-r3-run7-eta-r4-run5.log` @ `cebc4730` (run 14 — the
  eta-r4 10/10 gate + r2 4/4 / r3 2/2 anchor holds, 0 errors / 0 sorry
  log-wide, telemetry disposition IN-LOG) and
  `logs/eta-r2-run9-eta-r3-run6-eta-r4-run4.log` @ `5287f92b` (run 13 — the
  r2/r3 GREEN triad prints of record). Earlier rung exits:
  `logs/eta-r1-run3.log` @ `9b2db9ae` (R1), `logs/p1-run3.log` @ `a23b412d`
  (P1), `logs/eta-pin-probe-run2.log` @ `5bbcd840` (the probe hygiene gate).
- **Fired payload shas of record (sha-guard chain):** P0 `ab9974f1`, P1
  `a9a6555c`, probe `cadc838d`, `eta-r1.lean` `5b04304a`, `eta-r2.lean`
  `a9c6b59f`, `eta-r3.lean` `21fb0c4e`, `eta-r4.lean` `285a411e` (all =
  the current worktree/main bytes; the intermediate fired shas from run 6 onward
  ride the per-run log provenance headers — see the §1 ledger's sha-availability
  note).
- **Runner + substrate of record:** `run_zzv2.sh` / `run_zzv2.py` (M4b2 recipe,
  image-layer-sharing family), doz CLI `/home/doz/dozenv/bin/modal`, profile
  semraker, SPEC cpu=2.0 / memory=4096 soft, `LEAN_NUM_THREADS=2`,
  `@telemetered`, `taskset -c 0,1` build.
- **G2 note:** the port files are runner-elaborated with in-file `#print axioms`
  gates — they carry NO `make_axcheck.py` TARGETS entry today. If the close act
  wants axcheck stages over them, extending TARGETS is the verification lane's
  funnel decision (R1); the pointers above are the complete re-verification
  surface. The FULL-COVERAGE axcheck over the whole port artifact is R8's exit
  criterion (§3), banked with it.

— lane R5 (A3 lineage), 2026-11-21 (worktree agent-04 @ 5c7fac7; REPORT ONLY —
H lands: this wrap file + the INDEX row)

## 5. CONTINUATION (iter-7 day-1, 2026-11-21) — RUNG R7 CLOSED GREEN: the hKS discharge, the de-freezing move kernel-complete

Landed at main `d6cd72a` (the D2′(c) fresh grant; grant shape = 1 fire + fix
tail, spent exactly). Record of the rung: `eta-r5-record.md` @ `e712eb82c42fbdd4`.

**The ledger extended** (the port's overall fire history continues; iter-7's
grant accounting is its own cycle — NOT the closed 14-of-12–13 band):

| # | rung / files | payload shas (fired) | verdict | residue discharged |
|---|---|---|---|---|
| 15 | R7 `eta-r5` first fire (+ `eta-r4` anchor, run 6) | `e7234318deb593f4` + `285a411e` | **THE BRIDGE GREEN ON FIRST ELABORATION** (`unweightedKernelSum_cutoffTestLam_tendsto` + B/C/D triad-clean in run 1's own prints); FAIL rc=1 errors=4 sorry=0 — all four in the two NEW projection micro-lemmas | decode: `Complex.im_ofReal` name-drift (pin = `Complex.ofReal_im`, TwoDim.lean:451 idiom) + cascade; `Tendsto.comp` ∘-vs-lambda ascription; `congr'` orientation reversed |
| 16 | R7 fix tail (+ `eta-r4` anchor, run 7) | `061b64f593ef5db3` + `285a411e` | **GREEN strict-OK — 16/16 prints triad-clean** (10 carried base + the 6 R7 decls); anchor holds | residue cleared; zero math defects (the whole port's history: every error class mechanical) |

Logs: `logs/eta-r4-run6-eta-r5-run1.log` `f8c4e152` + `logs/eta-r4-run7-eta-r5-run2.log`
`272bf676` (telemetry dispositions IN-LOG both; the authorized m4b2/G2
build-phase class; walls 639/607 s; mem ≤ 2835 MB anon=0).

**What the kernel now holds, R7 additions** (all print-verified triad-clean in
`eta-r5.lean`, self-contained per the port convention — the eta-r4 base
verbatim + the rung-2 trio (B)/(C)/(D) re-established from eta-r2 + the R7
layer): the **bridge at the scaled family** (the donor `Zeta/Kernel.lean:600`
statement, proved via the PUBLIC `PairCorrelation.tendsto` at the rung-2
instances + the R6-4 identity — the private-chain finding of §1 fully worked
around, nothing private consumed); the **`ScaledBridge` projection**
(`.re / zeroScale` at `scaledConstLam`, probe :159); and the **discharge glue**
— `KSAsymptotic lam (scaledConstLam lam psi)` for every cutoff ψ on the honest
domain `0 < lam ≤ 1/2`, `delta < 1/4`. **P1's `hKS` binder is DISCHARGEABLE —
the de-freezing move is kernel-complete**; the P1 HARD-STOP's P2 ask is
discharged on the `lam ∈ (0, 1/2]` arm (P1's own `exists_KSAsymptotic_of_half_le`
covers `lam ≥ 1/2`).

**The R8 leg (firing):** the two-arm assembly
(`stmt_exists_KSAsymptotic_of_pos` = P1's half-le arm + R7's scaled arm) + the
threshold-form improvement (the (ii-c)/(iii) FINDING's antecedent — the honest
domain is the threshold ρ ∈ (Q(0)/c₀, 1]) + the **full-coverage axcheck sweep
over the whole port artifact** (pilot-10 pattern) — R8's exit criterion, the
port's terminal rung. FRESH grant precondition (D2′(c) — one fire each, per
rung). Residue-class note for R8's own glue: the run-15 projection-micro-lemma
class (lemma-name drift at the pin; `congr'` orientation; comp-ascription) —
mechanical, priced ≈0.

— continuation by lane R5 (A3 lineage), 2026-11-21 (worktree agent-04 @
d6cd72a; REPORT ONLY — H lands this section)
