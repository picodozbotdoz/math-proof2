# η-port R2 (admissibility + pair-test tier) — record: GATED-RED at unit budget, fix parked unfired + the (ii-c)/(iii) FACTOR FINDING

**Billing: technical record per DECISION-2 = Option A (record-billed, quota-free)**
— infrastructure only, never discovery-phrased; informal λ-dependence Lamzouri's
(must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

## Verdict

**GATED-RED after FOUR runs (21 → 16 → 15 → 10 errors; unit-3's 2 + unit-4's
confirmation attempt + the unit-4 joint fire with eta-r3) — every error across the
whole history is MECHANICAL, zero math defects; fix-batch-5 parked on disk
UNFIRED (assertion-guarded), parked sha256(16) `38bb8463fe7af1bc`.** Runs:
`logs/eta-r2-run1.log` (21), `logs/eta-r2-run2.log` (16), `logs/eta-r2-run3.log`
(15), `logs/eta-r2-run4-eta-r3-run1.log` (10, jointly with eta-r3). The run-4
decoding: the recurring :160 whnf-timeout was a CASCADE of a backwards `Eq.symm`
(congrFun puts h's LHS first) — never a rewrite defect; the remaining classes are
HO-pattern rw (provide f explicitly), one paren, and cascade residuals — all in
the parked batch. Port ledger: **8 of 6–10 runs spent** (ceiling 12–13; the
multi-file-per-run pattern — two verdicts per Modal run, first executed at run 4 —
improves the loop economics for the remaining rungs).

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

1. **Fire the parked pair TOGETHER** (one Modal run, two verdicts): `eta-r2.lean`
   @ `38bb8463fe7af1bc` + `eta-r3.lean` @ `ed0c061218a2d739` — expected R2
   strict-OK 4/4 triad and R3 strict-OK 2/2 (every parked fix is mechanical; the
   eta-r3 first-fire catalogue is in the run-4 log).
2. On GREEN: R2 + R3 exit; proceed R5+R6 (Fourier/identity layer, κ=1
   donor-verbatim, re-censused vs the public layer), then R7/R8.
3. Budget note: 8 of 6–10 spent (ceiling 12–13); the multi-file pattern halves the
   per-verdict cost from here.

— lane R5 (A3 lineage), 2026-11-19 (worktree agent-04 @ e3d984b; REPORT ONLY — H
commits post-K)
