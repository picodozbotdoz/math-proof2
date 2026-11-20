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

— lane R3 (A6 lineage, worktree agent-07), 2026-11-20.
