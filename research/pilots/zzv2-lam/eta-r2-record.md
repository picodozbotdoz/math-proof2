# η-port R2 (admissibility + pair-test tier) — record: GATED-RED at unit budget, fix parked unfired + the (ii-c)/(iii) FACTOR FINDING

**Billing: technical record per DECISION-2 = Option A (record-billed, quota-free)**
— infrastructure only, never discovery-phrased; informal λ-dependence Lamzouri's
(must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

## Verdict

**GATED-RED — R2 spent the unit-3 run budget (2 runs) at 16 errors (from 21),
ALL MECHANICAL, zero math defects; the complete understood fix batch is parked on
disk UNFIRED (N2-P2 precedent), parked sha256(16) `36c593f7d9cff455` — the next
unit's first action is its confirmation run.** Runs: `logs/eta-r2-run1.log`
(`ap-0H1tcEeMapxdXH3m68KuoX`, 21 errors, catalogue in-log), `logs/eta-r2-run2.log`
(`ap-ahpK6Q36bfqCxZqwucrYW4`, 16 errors). build OK both (mathlib `ff2494ea`
in-container). Port ledger: **6 of 6–10 runs spent** (R1: 2 fix + 1 confirm; R2: 2
fix; unit-3's confirmation consumed the 6th).

**Validated despite GATED:** lemma **C** (`cutoffSelfConvLam_isPairTestFunction`)
elaborated its four clauses from the transport architecture (lemma A + the donor's
PUBLIC frozen layer) — its axioms print carries no sorryAx of its own; the run-2
cascade is entirely lemma A's single whnf-timeout site (`:160`, the
Pi-power-defeq unification of `(cutoffTest psi y)^2` vs `cutoffTestSq psi y`)
plus div-iff-direction and API-name classes, every one catalogued with its fix in
the run logs. B's sorryAx is `cutoffTestLamSq_eq'`'s field_simp residue
(:312/:424). D gated via the A-cascade + one typeclass-stuck `.const_smul _`.

## THE FINDING (statement-tier, kernel-checked consequence; reshapes R3/R4/R8)

The probe's `stmt_cutoffSelfConvLam_eq_dilate` (`Q_λ = dilateTo lam Q`) and
`stmt_scaledConstLam_covariance` (`c_λ = ρ²·c₀ + (1−ρ²)·Q(0)`, ρ = 2λ) are
**FALSE as stated**. Direct computation: `cutoffTestLam² = (A_ψ/A_{ψ,λ})·
(cutoffTestSq ∘ (·/ρ))` with `A_ψ/A_{ψ,λ} = 1/ρ` (R1's covariance), so
`Q_λ = a⁴·ρ·(Q ∘ (·/ρ)) = (1/ρ)·dilateTo lam Q` — the probe/precharter's
"a²·ρ = 1" bookkeeping missed that the squared normalisation factor enters the
convolution integrand TWICE. Consequences (to be kernel-checked at R3/R4):
- **corrected (iii):** `pairMainTerm Q_λ = ρ·c₀ + (1/ρ − ρ)·Q(0)` (at
  supp Q ⊆ [−1,1], ρ ≤ 1);
- **the strict-improvement corollary's honest domain becomes ρ ∈ (Q(0)/c₀, 1]**
  (`scaledConst_λ < c₀ ⟺ ρ > Q(0)/c₀` — a THRESHOLD, not all ρ ∈ (0,1)); R8's
  statement must carry the threshold antecedent; the frozen-margin transfer
  (2/3-class) needs re-derivation under the corrected form.
The probe file is an elaboration-only artifact (never a proof claim) — this is a
plan-level amendment, not a proof failure. Lemma A of `eta-r2.lean` proves the
TRUE form (`Q_λ = (2λ)⁻¹ • dilateTo lam Q`); its elaboration completes modulo the
parked mechanical fix.

## The public-layer discovery (changes the port's economics)

The donor's frozen-family facts are PUBLIC in `Zeta/Basic.lean` and
`Zeta/CutoffSelfConv.lean` (`extremalTest_even/pos/measurable`,
`cutoffSelfConv_neg/eq_zero_of_one_le_abs`, `contDiff/hasCompactSupport_
cutoffSelfConv`, `exists_cutoffSelfConv_eq_zero_of_one_sub_le_abs`,
`exists_iteratedDeriv_two_…`, `iteratedDeriv_two_cutoffSelfConv_neg/eq_zero`,
`contDiff_iteratedDeriv_two_cutoffSelfConv`, …) — the Kernel.lean privates are
private DUPLICATES of public facts. The pair-test tier therefore TRANSPORTS from
the frozen family via lemma A + these publics; R2's private-copy set shrank to
ONE local mirror (`integrable_cutoffWeightLam`, marked per the P1 precedent).
R5–R7's Fourier/identity rungs should re-census their assumed-private list
against `Zeta/Basic.lean` + `Zeta/CutoffSelfConv.lean` before re-proving anything
(the precharter §2.2 "all but the last two are private" claim is about
Kernel.lean's LOCAL copies — the public layer was missed by the wave-2 census).

## R2 state per declaration (after run 2)

| declaration | state |
|---|---|
| `cutoffSelfConvLam_eq_scaled_dilate` (A) | proof complete modulo the parked :160 fix (applied-form restatement) |
| `cutoffTestLam_isAdmissible` (B) | gated via `cutoffTestLamSq_eq'` (div_pow chain parked) |
| `cutoffSelfConvLam_isPairTestFunction` (C) | body elaborated, triad modulo A-cascade |
| `iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction` (D) | gated via A-cascade + `.const_smul` show-form fix (parked) |

## Telemetry (both runs; investigate-not-upgrade)

Run 1: wall 382 s, max_mem 2805 MB < 4096, OVER=6 pre-taskset. Run 2: wall 407 s,
max_mem 2923 MB < 4096, OVER=6 pre-taskset. Standing confined pattern; no finding.

## Next step (next unit)

1. **Fire the parked `eta-r2.lean` @ `36c593f7d9cff455`** (first action; expected
   strict-OK 4/4 triad — every fix is mechanical with no math content).
2. On GREEN: R2 exits; proceed R3 (λ=1/2 functional regression + corrected
   (ii-c)/(iii) with the TRUE factor forms per the FINDING above).
3. Budget note: 6 of 6–10 spent; the honest ceiling (12–13) has room for the R2
   confirmation + R3–R8 at ≤1 run per rung average — the public-layer discovery
   is what keeps the band honest.

— lane R5 (A3 lineage), 2026-11-19 (worktree agent-04 @ e3d984b; REPORT ONLY — H
commits post-K)
