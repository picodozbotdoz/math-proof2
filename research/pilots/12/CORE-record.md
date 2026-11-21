# CORE record — pilot-12 (z4-parametric-savings), Iteration-6 day-1 (D4 drain-activated)

**Day-1 verdict: GREEN baseline at run 3 — `PROBE-OK rc=0 errors=0 sorry=8`**
(sorry 10 → 8 across the day, both drops REAL kernel-checked proofs; 3 fires,
within the single-digit pricing). Lane R3 (worktree agent-07), 2026-11-20. Item-13
was closed/non-live before this fire (run-20 GREEN, reported); all four day-1
pre-fire assertions passed (staged sha re-verified `5a9b19b4563b6612` + guard-line
agreement + no orphan 12core apps + signal in hand).

## Descent (sha-guarded every fire; telemetry OVER-mem = the known mmapped-olean
class on all three runs, cpu ≤ 0.69 within SPEC — investigation per guidelines
concludes known-class, no action)

| run | staged sha | verdict | residue |
|---|---|---|---|
| 1 | `5a9b19b4563b6612` | FAIL rc=1 errors=3 sorry=9 | ALL in Part 4, authoring-class: `theorem epsParam_data : EpsData` — a theorem cannot carry a non-Prop type; :429/:438 are its cascade |
| 2 | `90bbe79dcff53fce` | FAIL rc=1 errors=1 sorry=8 | one error, MINE: argument-order slip in the parametric_main discharge (`h16 h17` vs binder order `h17 h16`) |
| 3 | `9c213eb771efe843` | **PROBE-OK rc=0 errors=0 sorry=8** | the 8 stubs below |

Zero donor-port or P0-surface defects at any run. Log files: `logs/core-run1.log`
`66e0c2ad…`, `logs/core-run2.log` `848d394d…`, `logs/core-run3.log` `a141ca4b…`.

## What landed kernel-clean on day-1 (no sorry)

- `time_le_of_calls` — verbatim port `TimeClaims/Sec3/Theorem19.lean:42`.
- `sq_div_sqrt_le_sq_div_rpow` — verbatim port `TimeClaims/Sec3/Arithmetic.lean:62`.
- `call_cost_corollary_16` — verbatim port `TimeClaims/Sec3/Theorem19.lean:53`
  (route 16's one-call cost; the full donor proof compiled unmodified on v4.36).
- `parametric_main` — DISCHARGED: `route16_MMgeneral M W epsParam_data h17 h16`
  (real reduction; sorryAx still propagates from the route stub, as expected at
  this rung).
- `epsParam_frozen_fiber_claim` — DISCHARGED: `epsParam_data.frozen_fiber` (real
  projection — the fiber match IS the EpsData field; the numeric work moves INTO
  the construction stub).

## The 8 remaining stubs (the S-tranche frontier)

`:190 route15_frozen`, `:198 route16_frozen`, `:233 route15_MMgeneral`,
`:240 route16_MMgeneral`, `:250 route16_symbolic`, `:378 flagship_shape`,
`:400 balancePoint_monotone_shape`, `:471 epsParam_data` (def-stub).

## KEY DAY-1 STRUCTURAL FINDING (pricing-correcting; feeds R9)

The donor's general cost lemma `Theorem19.exists_total_le`
(`Sec3/Theorem19/Choice.lean:245`) is **strassen-FROZEN in its STATEMENT**
(`termPrime strassen n D` hardcoded; the `Choice.strassen_le` field bounds exactly
that term) — the MM abstraction exists ONLY in `Claim.Theorem_17`'s parameter;
every downstream arithmetic lemma re-freezes it. So "route-lemma MM-generalization
= pure re-instantiation" (charter-input §3a) is WRONG at the exists_total_le level:
the generalization must REBUILD the cost analysis with `termPrime MM n D`, where
the demand-side bound `MM n ≤ C·n^{ωb}` turns the strassen-le slot into the
**ω_b-balance inequality `ωb + (3/2)·(1/18) ≤ 3 − η/18`** — exactly where ε(ω_b)
is born (the (b)/(c) components are one construction, not two). The honest pricing
of the route stubs is therefore M-class against the donor's proof (not S-class
re-instantiation) unless the balance input is itself taken as a binder — the
charter-input's rescope-shape decision, now concrete.

## Next batch (priced)

1. `MMgeneral_total_sum`: the generalized exists_total_le with `termPrime W.MM n D`
   and the balance as an explicit hypothesis binder on W (first as a binder —
   statement-level; then the balance's proof is the ε-construction work).
2. `route16_MMgeneral` closes from it + `call_cost_corollary_16` +
   `time_le_of_calls` + h17/h16 destructuring (the donor's :107 proof shape).
3. Then `route16_symbolic` (same, with the Choice-family binder) and the route-15
   pair (needs `sq_div_sqrt_le_thinBound` + its helper chain ported).

## Files (worktree agent-07; H commits at the opening commit)

`CORE.lean` `9c213eb771efe843` at GREEN baseline; `run_core.py` `55e541eafc43a704`;
`stage_and_fire_core.sh` `7546ffd3dfd046e9`; logs as above; this record.

## MILESTONE (D4 continue-order, runs 4–9, 2026-11-20): `MMgeneral_total_sum` PROVED kernel-clean — the 9-fire budget spent GREEN

**Run 9 verdict: `PROBE-OK rc=0 errors=0 sorry=8`** (`logs/core-runs4-9.log`
`63307eda…`; CORE.lean `7e40dff4dc12b6a6` at GREEN). The rebuild the pricing
correction called for is DONE at the total-sum level: the donor's
`Theorem19.exists_total_le` with the strassen slot freed —

- `termPrime W.MM n D` in place of `termPrime strassen n D`;
- the **ω_b-balance `W.ωb + 1/12 ≤ 3 − η/18` as THE explicit binder**, from which
  the MM-term bound is PROVED in-line: `W.MM n ≤ Cb·n^{ωb}` (W.grows) ×
  `D^{3/2} ≤ (n^{1/18})^{3/2} = n^{1/12}` (Choice.le_root) ⇒
  `termPrime ≤ Cb·n^{ωb+1/12} ≤ Cb·n^{3−η/18}` (the balance step — where ε(ω_b)
  is born, now a kernel-checked inequality chain);
- the MM-INDEPENDENT donor-derived inputs (`instances_le`/`scans_le`/`build_le`/
  `one_le_log`) as the explicit `ChoiceSumInputs` interface — the next batch's
  discharge target (porting the donor's `Choice.lean:60–244` rpow calculus at the
  frozen η = 0.0315, c = 2 instance), after which `route16_MMgeneral` closes.

Descent: 11 → 10 → 3 → 2 → 1 → 0 errors over 6 fires (sha chain in the log
header; every fire sha-guarded). Residue classes: v4.33→v4.36 API drift
(`Real.natCast_le_rpow_inv_iff` gone — worked around, not re-derived;
`Real.rpow_le_rpow` 3-arg; `Real.rpow_add` strict-0; `mul_le_mul` arg order;
no root `mul_le_mul_left'`; `zero_rpow` NNReal-only, `Real.zero_rpow_le_one`
the total form — the full ledger is in the log header), ONE real math slip of
mine (run 8's tail: I claimed a direct equality where the donor uses a two-sided
strengthening to the common `(8c^η + Cb + 3)·R` bound — fixed to the donor's
shape, plus the `c^η·R`/`Cb·R` monomial nonnegativity facts the generalized
constant Cb makes necessary; the donor's Cb = 1 case is linarith-linear, the
generalized one is not).

**Budget: 9 of ~9 fires spent, GREEN.** The S-tranche frontier is unchanged
(8 stubs — the 7 P0 statements + the ε construction); the milestone adds ~120
lines of kernel-verified proof and the statement-level seam for the rest.

## TRANCHE CLOSE (Iteration-6 resume closing batch, 2026-11-21): `ChoiceSumInputs` DISCHARGED + `route16_MMgeneral` CLOSED — the 12-core S-tranche closes GREEN

**Run 13 verdict: `PROBE-OK rc=0 errors=0 sorry=7`** (`logs/core-runs10-13.log`
`e499f7e1…`; CORE.lean `940bc9eabe82d5e0` at GREEN, sha-guarded descent
16 → 5 → 2 → 0 errors over runs 10–13, 5-fire budget: 4 descent + 1 axcheck).
**Run 14 (certification, stage-copy `#print axioms`, repo file untouched): all 14
new/re-verified theorems triad-only `[propext, Classical.choice, Quot.sound]`, zero
sorryAx** (`logs/core-run14-axcheck.log` `b8c1c194…`; staged axcheck sha
`58af6ad3…`). `parametric_main` prints with `sorryAx` — the expected honest seam
(it consumes the `epsParam_data` def-stub; the reduction is real).

### What landed kernel-clean (Part 3d/3e, all sorry-free)

- **The donor `Choice.lean:60–244` calculus ported WITH PROOFS** (Part 3d), for
  every η, c — `Theorem19.Choice.{n_pos, pow_eighteen_le, le_n, one_le_D, D_pos,
  one_le_n, one_le_rpow, one_le_ceil, ceil_le, ceil_le_sqrt, one_le_log, log_le_log,
  saving, cube_mul_saving_le, rpow_le_rpow_div, rpow_le_of_le, instances_le,
  scans_le, build_le}` — `strassen_le` intentionally NOT ported (that slot is the
  MM-generalization's ω_b-balance, proved in-line in `MMgeneral_total_sum`).
- `choiceSumInputs_of_choice : ∀ {η c}, ChoiceSumInputs η c` — the ordered
  discharge, general over the frozen instance.
- `Theorem19.sixteen_le_root` + `Theorem19.choice_corollary_26` (donor
  `Sec3/Theorem19.lean:91` — the frozen route-16 Choice instance at η = 0.0315, c = 2).
- `explicit_transfer` — the ε-fiber transfer (δ ≤ 0.0315/18 ∧ e ≥ 1 ⇒ the delivered
  `n^{3−0.00175}·log n` bound implies the `(δ, e)` bound; n ≥ 1, log n ≥ 1).
- `route16_core` — the E-free composition at the frozen fiber for EVERY W in the
  band (donor `:107` with the MM slot freed; balance 2.9 + 1/12 < 3 − 0.00175 free
  from `W.le_band`).
- **`route16_MMgeneral` CLOSED** (with the two ε-fiber binders below).
- `route16_MMgeneral_frozen : Theorem_19_explicit M 0.00175 1` for every W — the
  unconditional fiber.
- `parametric_main` re-discharged through the amended route16 (still sorry-free as a
  reduction; sorryAx rides only via `epsParam_data`).

### THE TWO INTERFACE CORRECTIONS OF RECORD (mathematically forced — H must land the statement changes)

1. **`ChoiceSumInputs.scans_le` gained the donor's `Real.log n ≤ Λ` hypothesis.**
   The v1 field (only `1 ≤ Λ`) was FALSE as stated: at Λ = 1, κ = 1 it demands
   `termScans ≤ c^η·n^{3−η/18}`, i.e. log n ≤ 1. The donor's `scans_le` always took
   `hΛ : Real.log n ≤ Λ`. `MMgeneral_total_sum`'s own statement is UNCHANGED (its
   hlogΛ rides; proof got one extra argument).
2. **`route16_MMgeneral` + `parametric_main` gained the ε-fiber binders**
   `(hδ : E.ε W.ωb ≤ 0.0315 / 18)` and `(he : 1 ≤ E.e W.ωb)`. The P0 stub concluded
   `Theorem_19_explicit M (E.ε W.ωb) (E.e W.ωb)` UNconditionally — FALSE as stated:
   h16's `wantedBound` is frozen at the 0.437/0.063 exponents, so the one-call cost
   n²/D^{0.063} caps deliverable savings at 0.0315/18 = 0.00175 with a log¹ floor;
   a DECREASING ε (the corrected rider `EpsData.strict_anti`) demands MORE exactly
   when W.ωb < log₂ 7, and `E.e = 0` at the exact fiber would drop the log. This is
   the charter-input §2 rescope shape verbatim ("the EpsData-binder statements
   already support exactly that fallback"). `hδ` is dischargeable for W.ωb ≥ log₂ 7
   from `strict_anti` + `frozen_fiber` (numeric gate not yet formalized — M-class).

### Residual drift ledger (v4.33 donor → v4.36 pin; runs 10–12 residue classes)

- `Real.natCast_le_rpow_inv_iff` (le_root_iff route) gone → `pow_eighteen_le` /
  `sixteen_le_root` re-derived via `Real.rpow_le_rpow` + `← Real.rpow_natCast` +
  `Real.rpow_mul` (helpers `natPow_rpow_inv_self` / `rpow_inv_natPow_self`).
- `Real.one_le_log_natCast_of_three_le` gone → `Real.le_log_iff_exp_le` +
  `Real.exp_one_lt_d9`.
- `Nat.le_self_pow` route avoided in `le_n` (all-nat `16^18 ≤ D^18 ≤ n` instead).
- OfScientific-literal trap: `3 - 0.0315 / 18` in a bare-literal exponent needs
  `(0.0315 : ℝ)` (binop% otherwise resolves ℕ); donor-`(by omega)` side-conditions
  over `paramD₂₆ n` fail on v4.36 omega (floor-atom) — explicit projections
  `(1 ≤ 16).trans P.sixteen_le` instead.

### S-tranche state at close

7 stubs remain (route15_frozen :201, route16_frozen :209, route15_MMgeneral :244,
route16_symbolic :259, flagship_shape :387, balancePoint_monotone_shape :409,
epsParam_data :932) — all M-class per the evaluation note
(`M-CLASS-EVALUATION.md`). NOTE for that evaluation: `route16_frozen` is now a FREE
corollary of `route16_MMgeneral_frozen` (a strassen-fiber WordRamMMData instance;
the numeric log₂-7 band facts are the only missing glue).

— lane R3 (A6 lineage, worktree agent-07), 2026-11-21.

## ITER-7 S-RESIDUE SWEEP (granted batch, 2026-11-21): route-15 mirrored, BOTH frozen routes closed, `route16_symbolic` RE-STATED AND PROVED — 5/5 fires, one-token-from-GREEN park on the analytic-ε artifact

**P0.lean GREEN from run 15 (`PROBE-OK rc=0 errors=0 sorry=7`)** — the three
PENDING-OWE binder mirrors (route16_MMgeneral :236 hδ/he; route15_MMgeneral
hδ-at-(1/36)/18/he-2; route16_symbolic minimal hδ/he) elaborate; P0.lean
`ea5285a32db350c4`. **Run 19 (combined GREEN-attempt + full-coverage axcheck,
staged `df280de089a7f2ea`)**: everything EXCEPT `epsAnalytic_data`'s `strict_anti`
field elaborates, and the FULL axiom sweep is TRIAD-ONLY
`[propext, Classical.choice, Quot.sound]` for all 37 printed declarations —
the 13 previously-unprinted + every new theorem:

- **route-15 mirror (Parts 3f)**: `one_le_log_of_three_le` (drift fix),
  `sq_div_rpow_le_sq_mul_log_sq_div`, `sq_div_sqrt_le_thinBound`,
  `call_cost_corollary_15`, `paramD₅_largest_pow_four`,
  `Theorem19.Choice.of_largest_pow_four`, `Theorem19.choice_theorem_5`,
  `explicit_transfer_gen` (the (δ₀, e₀)-general transfer), `route15_core`
  (E-free frozen-fiber composition, every W), **`route15_MMgeneral` CLOSED**
  (hδ/he binders at route 15's own cap (1/36)/18 and floor e ≥ 2),
  `logb_two_seven_mem` (2 < log₂ 7 ≤ 2.9 by the log_pow rational route, 7^10 ≤ 2^29
  exact), `strassenW` (the Strassen fiber as WordRamMMData), **`route15_frozen` and
  `route16_frozen` CLOSED** (the Part-1 stubs, as free corollaries).
- **`route16_symbolic` RE-STATED AND PROVED (Part 3g)** — the γ-freeze-honest form:
  `Corollary_16_split M γ` (the re-split one-call interface, donor's
  `Claim.Corollary_16` = the γ = 0.063 instance), `call_cost_corollary_16_split`,
  `MMgeneral_total_sum_uniform` (the run-9 body with the constant uniformized — for
  c ≥ 1, η ≤ η₀ ⇒ C(η) ≤ C(η₀)), and the theorem: (D, g, η) all ω_b-choice
  functions, one-call through the re-split binder at a uniform γ₀ ≥ 2·η n, `η₀` a
  LOWER bound on the choice (`hηinf` — the deliverable fiber δ = η₀/18; the
  constant uniformizes through the Choice field η ≤ 1/4, so no upper-bound binder),
  ε-fiber binders hδ/he. THE M-class centerpiece is now kernel-clean: the symbolic
  route EXISTS in the honest interface, and the γ-freeze finding is embodied (the
  re-split binder is exactly what the frozen h16 could not provide).
- **`epsAnalytic_data` (Part 3h, the fork-exploration artifact)**: PARKED at
  one token — run 19's two errors are both in its `strict_anti` field
  (`div_lt_div_iff` → `div_lt_div_iff₀` name drift + a mul-div associativity
  restructure); the fix is APPLIED-UNFIRED in the repo file (eta-r4 precedent) —
  CORE.lean `b5e5e1d9bb667597` fire-as-is; expected verdict `PROBE-OK rc=0
  errors=0 sorry=3`. frozen_fiber/limit_three/elaboration are already clean in
  run 19.

### Honest-park accounting (D7)

- Residual class: TWO tokens in one proof field (name drift + assoc shape) — the
  only blockers between this batch and full GREEN.
- Exact next-action: fire CORE.lean `b5e5e1d9bb667597` as-is (1 fire; P0.lean may
  ride — it is GREEN and unchanged). On GREEN: epsAnalytic_data is a CONCRETE
  analytic EpsData (Sec-4-CALIBRATED, not Sec-4-BUILT) — the fork decision's
  existence question is settled YES in closed form; `epsParam_data.ε`'s obligations
  hδ/he become dischargeable on the ω_b ≥ log₂ 7 half-band against epsAnalytic.
- Priced continuation: 1 fire (+ optional re-axcheck of epsAnalytic_data alone).
- Budget: 5/5 spent (runs 15–19), descent 19 → 10 → 4 → 2 → 2 errors.

### Residue classes (runs 15–18)

postponed-metavar chains in `.trans_le (by norm_num)` (fix: explicit have-typed
facts); `lt/le/div_lt_div_iff` → the ₀-suffixed v4.36 names; `Real.log_pow`
backward-rw fails on literal-vs-cast (`↑2 * log 2` pattern — fix: forward haves
`h2log/h10/h29` with push_cast); structure-field `le_rfl` fails when defeq needs
`one_mul` (fix: `rw [strassen, one_mul]`); `StrictAntiOn` on this pin has
INTERLEAVED binders `∀ ⦃a⦄ (_ : a ∈ s) ⦃b⦄ (_ : b ∈ s), a < b → …` (intro
`a _ha b _hb hab`); `nhdsWithin_le_nhds` is implicit-arg `{a} {s}` + needs
named-args or pinning; the SYMBOLIC-block direction lesson: the deliverable fiber
is the INF of η (hηinf), the constant uniformizes via the η ≤ 1/4 field — an
upper-bound η₀-binder would invert the transfer direction (caught pre-fire as the
:1283 linarith failure).

— lane R3 (A6 lineage, worktree agent-07), 2026-11-21.
