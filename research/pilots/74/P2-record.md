# P2 record — pilot-74: G2 GREEN (sharp constants) + G3 PASS + P2-c at the unit-5 PARK (adjudicated nonneg BkClass applied; FIRE-ONCE run cleared t4_not_littleO + the arg-shape/neg_neg classes; 2 mechanical sites remain — the wave-close set)

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

## P2-c state: EXECUTED to a 5/5-budget honest stop (NOT-GREEN, 18 mechanical residuals; re-task R3→unit 4, 2026-11-19)

The G3 gate PASSED (run 11); the P2-c proof investment then executed on its own ≤5
budget (runs 12–16, all sha-guarded, zero sorry at every run): the FULL statement set
is in `P2.lean` — `famN_spectrum/varK/W/Mdev` (the family's EXACT spec: deviations
two-valued ±(log n)/2, `varK = (log n)²/4` exactly, `Mdev = log n / 2`, `W_ε =
log n / 2` for all 0 < ε < 1 — the marking parabola attained with EQUALITY),
`famN_inClass` (membership at the EXPLICIT threshold θ₀ = 1/(1024·e) — the
precharter's marginal-θ caveat made precise; membership fails as θ → 0, the window
geometry y = |u|·L/2 ≤ 1/64 against the MGF budget being the binding constraint),
`t4_floor_achieved` (κ = 1/8 floor + exact parabola tightness), `t4_not_littleO`
(`Asymptotics.IsLittleO` negation via `Filter.eventually_atTop`), `exp_pair_upper`
(the elementary reciprocal bound e^y + e^{−y} ≤ 2 + 4y² on y² ≤ 1/2), and the
`CertValidClass`/`BkClass` definitions carrying the DEGENERACY FINDING in-file:

**FINDING (BkClass degeneracy, owner to fold):** the precharter's literal
`BkClass W_ε 1 𝒞 ≥ √(…κ·B)` floor statement is degenerate BOTH ways — (i) every
point mass is a class member (trivial MGF) with W_ε = 0 and all moments 0, forcing
`BkClass ≤ 0` on the full class; (ii) with unrestricted certificate coefficients,
negative `a` makes the sup unbounded on hVarLB-restricted classes (S ≥ log 2 > 0
pays for any c₀). The honest tightness content of T4 lives in the discharged-family
theorems; the bounded class-indexed ceiling needs the nonneg-coefficient variant
(proposed repair, owner's adjudication).

**Residue at the stop: 18 errors, four mechanical classes, each with the fix in
hand** (the full taxonomy with fix lines is in `logs/p2c-runs12-16.log`'s provenance
header): (1) `one_div_le_one_div_of_le` argument shape at two sites; (2) `neg_neg`
vs `inv_inv` in one rw chain; (3) one nlinarith mul-hint; (4) one REDUNDANT trailing
rewrite in `t4_not_littleO` — whose context in run 16 already displays `hthis` in
the final form `log m / 2 ≤ (1/4)·log m` (the theorem is one `linarith` from
closed). **Zero math defects**; the descent 58→41→30→25→18 was pure API-shape. A
re-charter with ONE run is the predicted close (H's calibration note stands).

Descent discipline note: one mis-batched fire was REFUSED by the sha guard (run-15
attempt: the fix batch's python assert aborted before write; the guard detected the
byte-identical staged file and refused — no Modal run wasted; the batch was
re-applied with corrected anchors and fired). Budget integrity held: P2-c used
exactly 5 of 5.

## Files (H commits post-K, per the hold-all-commits ruling; A1 folds the §10 row)

`research/pilots/74/P2.lean` (sha `199f06ba…` at the 5/5 stop — G2's GREEN theorems
+ the G3 probes + the full P2-c statement set and proofs-in-descent), 
`stage_and_fire_p2.sh`, `logs/p2-runs1-11.log` (G2 series; sha `d061f77c…`),
`logs/p2c-runs12-16.log` (P2-c series + residue taxonomy; sha `d4be9a19…`), this
record. P1.lean and the D/P0 records unchanged from their GREEN states. NOTE for H:
the G2-GREEN artifact of record is the run-11 file state (sha `49b808f3…`, preserved
in the run-11 raw log); the current P2.lean carries it plus the in-descent P2-c —
at commit time H may prefer to record both shas in the §10 row.

## Unit-5 addendum (adjudication + FIRE-ONCE completion run, 2026-11-19)

**ADJUDICATION APPLIED:** `CertValidClass`/`BkClass` in P2.lean now carry the
NONNEG-coefficient variant `(∀ j, 0 ≤ a j) ∧ …` — the corrected definition of
record (the 78-class correction pattern), with the degeneracy finding + adjudication
recorded in-file. The dated dossier-74 amendment block is drafted for H at
`research/pilots/74/dossier-74-amendment-p2c.md` (P2-a/b GREEN status lines, FINDING
#5 = the BkClass degeneracy + adjudicated correction, FINDING #6 = the explicit
membership threshold θ₀ = 1/(1024·e), and the T4 shape-(i) tightness set at its
honest proof-status).

**Run 17 (FIRE-ONCE grant): NOT-GREEN — PARKED with the wave-close set per the
grant's terms.** 15 errors = 2 real sites + 13 print-cascade (descent 18 → 15;
zero sorry). CLEARED at run 17: `t4_not_littleO` (fully closed — the redundant-
rewrite class), both `one_div_le_one_div_of_le` arg-shape sites, the `neg_neg`
class; the adjudicated `BkClass` def elaborates. The TWO parked sites (both in
`famN_inClass`'s final chain, fixes in hand — full statement in
`logs/p2c-run17.log`'s provenance header): (1) `hy2`'s nlinarith (atom-shape
`y^2` vs `y*y` — restate `hyy` in `y ^ 2 ≤ (1/64)^2` form or feed the `show`); (2)
`hmul`'s type ascription (drop it — the lemma's own output shape
`u^2*L^2*(1/2) ≤ u^2*L^2*(512*e*θ)` needs no flip). PREDICTION: the wave-close
run's residue is exactly these two lines.

**Discipline exemplar (noted per the grant):** the run-15 sha-guard REFUSAL — a
mis-batched fix (python assert aborted pre-write) produced a byte-identical staged
file and the guard refused the fire, wasting no Modal run; the batch was re-applied
with verified anchors before firing. This is the verify-fire discipline working as
designed.

## Files at the park (H commits post-K)

`research/pilots/74/P2.lean` (sha `4425be89…` at the park — supersedes the unit-4
`199f06ba…`; the G2-GREEN state of record `49b808f3…` remains preserved in the
run-11 raw log), `logs/p2-runs1-11.log` (G2 series, sha `d061f77c…`),
`logs/p2c-runs12-16.log` (sha `d4be9a19…`), `logs/p2c-run17.log` (the FIRE-ONCE
run + park-state header, sha `de047c7a…`), `dossier-74-amendment-p2c.md` (the dated
amendment draft for H), `stage_and_fire_p2.sh`, this record. P1.lean unchanged.

## Next pointer (wave-close set)

ONE wave-close run applying the two parked fixes closes `famN_inClass` and with it
the full P2-c tightness set GREEN (family-on-parabola + θ₀ membership +
floor-achieved + not-littleO + the adjudicated BkClass). Then: the dossier-74
amendment fold (draft ready), the §10 row, and the R9 nearest-miss table at article
time.

— lane R3 (A6 lineage, worktree agent-07), 2026-11-19.
