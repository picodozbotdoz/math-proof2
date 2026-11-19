# η-port R1 (covariance base layer) — record: FINAL GREEN (confirmed at run 3)

**Billing: technical record per DECISION-2 = Option A (record-billed, quota-free)**
— infrastructure only, never discovery-phrased; informal λ-dependence Lamzouri's
(must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

## Verdict

**GREEN — R1 FINAL** (confirmation run 3, `logs/eta-r1-run3.log`, 2026-11-19,
run `ap-TTR9EyqWxUDvcaaGiYhafb`, sha-guarded on the parked `5b04304a53a5b849`):
`eta-r1.lean: OK` strict (rc=0, 0 errors, 0 sorry) and **6/6 triad-clean** — the
unfold-order fix closed the last residual exactly as diagnosed. History: 2 fix-loop
runs GATED-RED at 5/6 within the rung's ≤2 budget, fix parked unfired (N2-P2
precedent), confirmed GREEN the next unit (the resume pattern working as designed).
Runs: `logs/eta-r1-run1.log` (`ap-PD5LK4v6enKIWHZicfeOaz`, 4 errors: smul-lemma
class + λ-keyword identifier class), `logs/eta-r1-run2.log`
(`ap-VKXhR8AeOQwbxKimbIn6nZ`, 1 error: unfold order). build OK both runs
(mathlib `ff2494ea…` resolved in-container, ZetaZerosV2 + redirected PNT+).

**On-pin triad state after run 2** (`#print axioms`, on-pin prints):
`fourierC_dilateTo` ✓ · `cutoffNormaliserLam_covariance` ✓ · `dilateTo_half` ✓ ·
`extremalLam_half` ✓ — exactly `[propext, Classical.choice, Quot.sound]`;
`cutoffTestLam_eq_dilate` carries sorryAx via the unfold-order residual ONLY
(its `field_simp` reduced the goal to the pure `√(dilateTo lam extremalTest x)`
vs `√(extremalTest (x/(2*lam)))` mismatch — the run-2 error context shows it
verbatim); `cutoffTestLam_half`'s sorryAx propagates from consuming eq_dilate
(its own chain — covariance-at-half, `dilateTo_half`, `div_self`, `sqrt_one` —
is independently clean).

**The parked fix** (dated comment at the site, :160±): unfold order
`cutoffTestLam extremalLam dilateTo cutoffTest` (extremalLam BEFORE dilateTo —
else the dilateTo occurrence exposed by extremalLam's unfold stays folded).
Post-fix parked sha256(16) **`5b04304a53a5b849`**; fired shas: run 1
`5807c02bf761a36a`, run 2 `cb10920da6a6aade`. No math content in the fix.

## What R1 established (on-pin, kernel-checked where triad-clean)

- **(i) `fourierC_dilateTo`** — `fourierC (dilateTo lam f) ξ = 2λ · fourierC f
  (2λ·ξ)`, ONLY `0 < lam` (stronger than the probe's stmt: no integrability side
  condition — the substitution is junk-value-safe). The precharter §1.3(i)
  ladder base is now KERNEL-CHECKED.
- **(ii-a) `cutoffNormaliserLam_covariance`** — `A_{ψ,λ} = 2λ·A_ψ`, only
  `0 < lam` (no IsCutoff, no window bound). KERNEL-CHECKED.
- **(ii-b) `cutoffTestLam_eq_dilate`** — pointwise `cutoffTestLam = √(A_ψ/A_{ψ,λ})
  · dilateTo (cutoffTest psi)`, hypothesis `0 < A_ψ` (the probe's two `≠ 0`s
  merged and oriented; R2's normaliser-positivity port supplies it). Proof
  complete modulo the parked unfold fix.
- **λ=1/2 checkpoint** — `dilateTo_half` (`dilateTo (1/2) = id`) and
  `extremalLam_half` KERNEL-CHECKED; `cutoffTestLam_half`
  (`cutoffTestLam (1/2) psi = cutoffTest psi` bit-for-bit) gated only via
  eq_dilate. The regression-first discipline is delivered at the earliest rung.

## API census (the plan's flagged first task — the reshaping check)

**VERDICT: API PRESENT at the pin; no finding that reshapes the ladder.**
- Whole-line dilation substitution: `MeasureTheory.Measure.integral_comp_mul_left`
  (Haar/NormedSpace.lean:152 @ ff2494ea) — hypothesis-free, junk-value-safe;
  #check-anchored in-file (elaborated on-pin, both runs). R1's engine.
- iteratedDeriv-under-dilation (R5's need): the donor's own idiom
  (`iteratedDeriv_eq_iterate` + `Function.iterate_succ_apply` +
  `ContDiff.iterate_deriv` + `HasCompactSupport.deriv`, Zeta/Kernel.lean:366±)
  plus `HasDerivAt.div_const`/`.comp` (Deriv/Mul.lean:496) — all present;
  #check-anchored. The plan's risk 3 downgrades to "expected friction, not a
  lemma's worth".
- NEW pin discovered during the loop (mechanical, recorded for R5+):
  ℝ•ℂ module smul converts via `Complex.real_smul` (Basic/Complex/Basic.lean:321),
  NOT `smul_eq_mul` (wrong instance — run-1 class A).

## Telemetry (both runs; investigate-not-upgrade)

Run 1: wall 566 s, max_mem 3272 MB < 4096, OVER=8 (pre-taskset fetch phases only).
Run 2: wall 385 s (warm image reuse), max_mem 2842 MB < 4096, OVER=6 (same
confined pattern). Build/elaboration phases capped (taskset + LEAN_NUM_THREADS=2).
No code-level waste: single-file elaboration, donor closure as-is. No escalation.

## Budget ledger + next step

Port budget 6–10 runs: **3 spent** (2 fix-loop + 1 confirmation; the confirmation
was unit-3 spend per the re-task). R1's exit (plan §R1: three lemmas proved,
triad-only) is MET — 6/6 including the λ=1/2 checkpoint anchors. **Next: R2**
(admissibility + pair-test tier) — note the R2 public-layer discovery
(Zeta/Basic.lean + CutoffSelfConv.lean carry PUBLIC frozen-family facts) and the
session's (ii-c)/(iii) factor FINDING, both recorded in eta-r2-record.md.

— lane R5 (A3 lineage), 2026-11-19 (worktree agent-04 @ e3d984b; REPORT ONLY — H
commits post-K)
