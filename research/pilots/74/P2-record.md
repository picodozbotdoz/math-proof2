# P2 record — pilot-74 G2 GREEN (sharp constants, route 1.5) + G3 PASS (family statement probe); P2-c chartered-unexecuted

**Verdict: G2 GREEN at run 11, 2026-11-19** (iteration-5 charter debt rung 74-P2,
recharter to R3, orchestrator 2026-11-19: DAY-1-CLASS, hold-all-commits; precharter
`research/pilots/74/P2-precharter.md`). `P2.lean` OK — rc=0, 0 errors, 0
sorry-warnings. Evidence: `research/pilots/74/logs/p2-runs1-11.log` (provenance
header + sha-guard trail + all raw runs; warm walls 40–76 s; telemetry OVER =
mmapped-olean mem class only, max_cpu ≤ 0.94 within SPEC). File:
`research/pilots/74/P2.lean` (sha `49b808f3…`, 1,063 LoC = 56-line header + **P1.lean
verbatim** (770, sha `6ddbda11…`) + Part P2, 237 lines).

## What landed (kernel-verified, triad-only)

| decl | content | axioms |
|---|---|---|
| `mgfBound_var_sharp` | **P2-a**: `varK p ≤ 2 * v` from the CENTERED bound on ANY positive window — the sharp window-free variance constant (the dossier T1(b)'s original `Var ≤ 2σ²`; a 4.5× improvement over P1's window-edge `32(e^{1/4}−1)σ² ≈ 9.06σ²`) | `[propext, Classical.choice, Quot.sound]` |
| `t1c_sharp` | **P2-b**: `varK p ≤ 1024 * e * θ * B` under `InSubGClass p θ B` — the MarginalTails sharp class constant (the dossier's exact `1024 = 2·512`), pure instantiation of P2-a at the class window | `[propext, Classical.choice, Quot.sound]` |
| `famN` + 3 probe Props | **G3 (statement rung, elaboration-only — NOT proof claims)**: the FIND-#1 n-atom family (heavy atom 1/2, n tail atoms 1/(2n)) with `famClassMemProbe` (spectrum ∧ class membership at `B = (log n)²`), `famVarLBProbe` (uniform-κ varLB discharge), `famTailProbe` (W-side bound) — all elaborate on-pin: **G3 PASS** | n/a (Prop defs) |

## G1 outcome (zero-run API pin, read-only in encore-mathlib @ ff2494ea) + the route

**Route 1.5** (the hybrid): the precharter's route 1 (deriv) was blocked at its
dependency — NO directly consumable second-derivative-at-local-min lemma on-pin
(DerivativeTest.lean carries none; SecondDerivative.lean absent) — while route 2's
elementary pair machinery cannot reach the sharp constant (the run-2 mathematical
finding: `(1±t/2)^2` squaring caps at `t²/2`). Route 1.5: the SHARP pair bound
`x² ≤ e^x + e^{−x} − 2` proven by two `monotoneOn_of_deriv_nonneg` layers
(Analysis/Calculus/Deriv/MeanValue.lean:413 — `φ := e^t + e^{−t} − 2 − t²` has
`φ' = ψ`, `ψ' = e^t + e^{−t} − 2 ≥ 0` ELEMENTARILY from `Real.add_one_le_exp` at
`±t`; no second-derivative lemma needed), then P1's pair-variance machinery at the
sharp constant (`u²·varK ≤ 2(e^{vu²}−1)`), the envelope weakening
(`exp_sub_one_le`), and the limit as `ge_of_tendsto` (the `to_dual` of
`le_of_tendsto`, Topology/Order/OrderClosed.lean:133) on the continuous envelope at
`𝓝[>] 0` (`ContinuousAt.continuousWithinAt.tendsto`; `eventually_nhdsWithin_iff`;
`nhdsGT_neBot` instance). API pins in the P2.lean header and the log's residue
taxonomy.

## Descent + budget (honest; sha-guarded at every run)

G2 was chartered ≤5; the descent used **11** (14→12→14→9→9→9→7→6→7→5→0 errors; zero
sorry at every run): runs 1–5 chartered; **run 6 = process-error misfire OWNED here**
(the fix batch's python assert aborted before write; I fired without verifying — the
P1 run-6 precedent class; the sha guard showed a distinct sha only because the header
must-cite block had landed, masking the missing body fixes); runs 7–10 = the residue
fix-loop (4 mechanical classes + the audit-tail qualification; every class named in
the log header; NO math defects — the one real mathematical event, the sharpness
obstruction, is recorded above); run 11 = GREEN. **P2-c's separate ≤5 budget is
UNSPENT.** Verify-fire discipline otherwise held: pre-run sha guard every run, NO
local lean, `maxHeartbeats 8M` carried in the verbatim P1 body.

## Must-cites + wording guard (R9 pre-gate relay 2026-11-19, binding; `research/novelty/round6-74p2-pregate.md`)

- **Must-cites for P2-a's record/article path**: mathlib ON OUR PIN carries
  `Mathlib/Probability/Moments/SubGaussian.lean` (missed by the 2026-11-13 corpus
  grep — no variance-equivalence theorem there; the tilted-variance identity lives
  only inside Hoeffding's proof) + `Mathlib/Probability/MGFAnalytic.lean:279
  exists_cgf_eq_iteratedDeriv_two_cgf_mul` + `Mathlib/Probability/Moments/Tilted.lean:159
  variance_tilted_mul`.
- **Wording guard binding on all P2-a prose**: "mathlib-absent for
  finitely-supported spectra" (TRUE); NEVER "sub-Gaussian absent from mathlib"
  (FALSE — SubGaussian.lean exists). The P2.lean header carries this verbatim.
- **Novelty verdict (R9)**: P2-a bills **formal-new-as-stated /
  mathematically-folklore**; P2-c's class-level tightness set is NEW-statement
  (stated nowhere across 8 nearest-miss rows + sweeps).

## P2-c state: G3 PASS, proof investment UNEXECUTED

The G3 gate PASSED (the probe Props elaborate, run 11) — the P2-c door is open. The
proof investment (`BkClass` class-indexed ceiling def + `t4_floor_achieved` +
`t4_not_littleO`; ≈400–600 LoC, M-class per the precharter) did not start: G2's
descent consumed the session's runs. Per the precharter's descope ladder the state is
NOT a NO-GO (that would require the probe to fail): P2-c stands
**chartered-unexecuted with its ≤5 budget intact** — the natural iter-5 continuation,
with the probe Props already on main-tracked disk (this file), the marginal-θ
membership risk still the known open core, and `IsLittleO`
(Analysis/Asymptotics/Defs.lean:172) pinned for its statements.

## Files (H commits post-K, per the hold-all-commits ruling; A1 folds the §10 row)

`research/pilots/74/P2.lean` (new; sha `49b808f3…`), `stage_and_fire_p2.sh` (new; the
sha-guard stage/fire clone), `logs/p2-runs1-11.log` (new; sha `d061f77c…`), this
record (new). P1.lean and the D/P0 records unchanged from their GREEN states.

## Next pointer

P2-c on its own ≤5 budget (G3 already passed); natural companions: the dossier-74
§Iteration-4 amendment's status-line update for P2-a/b landing (owner's file), and
the R9 pre-gate's nearest-miss table fold at article time.

— lane R3 (A6 lineage, worktree agent-07), 2026-11-19.
