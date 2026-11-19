# AMENDMENT (2) to the Landau η-port pre-charter — dated 2026-11-19, lane R5 (A3 lineage)

Supersedes the affected clauses of `pilots/zzv2-lam/eta-port-precharter.md` (2026-11-18,
incl. its 2026-11-18 κ=1 AMENDMENT) and the corresponding statement defs of the staged
probe `pilots/zzv2-lam/eta-pin-probe.lean` (elaboration-only artifact — statements, never
proof claims). Grounded in the R1–R3 kernel work of 2026-11-19 (records:
`eta-r1-record.md`, `eta-r2-record.md`; logs `logs/eta-r*-run*.log`). Billing unchanged:
DECISION-2 = Option A, record-billed, quota-free — never discovery-phrased.

## 1. The (ii-c)/(iii) FACTOR FINDING — statements falsified, corrected forms govern

**Falsified (precharter §1.3(ii-c) and the probe's `stmt_cutoffSelfConvLam_eq_dilate`):**
`cutoffSelfConvLam lam psi = dilateTo lam (cutoffSelfConv psi)` is **FALSE** by an
explicit rational factor, and consequently **(precharter §1.3(iii) / probe's
`stmt_scaledConstLam_covariance`)** `c_λ = ρ²·c₀ + (1−ρ²)·Q(0)` is **FALSE**.

*The error:* the precharter's derivation note "Q_λ = a²·ρ·(Q ∘ (·/ρ)) with a²·ρ = 1
forced by fourierC (η_λ²) 0 = 1" bookkept the squared normalisation factor `a² =
A_ψ/A_{ψ,λ} = 1/ρ` as entering the convolution integrand ONCE. It enters TWICE:
`cutoffTestLam² = (A_ψ/A_{ψ,λ}) · (cutoffTestSq ∘ (·/ρ))` (R1's (ii-b), squared), so
`Q_λ = a⁴·ρ·(Q ∘ (·/ρ)) = ρ⁻²·ρ·(Q ∘ (·/ρ)) = (1/ρ) · dilateTo lam Q`.

**Corrected forms (these govern every downstream statement; kernel-checked basis =
`eta-r2.lean` lemma A, `cutoffSelfConvLam_eq_scaled_dilate`):**

- **(ii-c′)** `cutoffSelfConvLam lam psi = (2·λ)⁻¹ • dilateTo lam (cutoffSelfConv psi)`.
- **(iii′)** `pairMainTerm (cutoffSelfConvLam lam psi) = ρ·c₀ + (ρ⁻¹ − ρ)·Q(0)`,
  with ρ = 2λ, `c₀ = pairMainTerm (cutoffSelfConv psi)`, `Q(0) = cutoffSelfConv psi 0`
  (derivation: Q_λ(0) = ρ⁻¹·Q(0); the β-window does not truncate at ρ ≤ 1 since
  supp Q ⊆ [−1,1] — the public `cutoffSelfConv_eq_zero_of_one_le_abs`; kernel target of
  R3 = `pairMainTerm_cutoffSelfConvLam`).
- The λ = 1/2 regression is UNAFFECTED bit-for-bit (ρ = 1 collapses both forms to c₀).

**Consequence for the strict-improvement corollary (§1.4 / R8):** under (iii′),
`scaledConst_λ < c₀ ⟺ ρ·c₀ + (ρ⁻¹−ρ)·Q(0) < c₀ ⟺ (1−ρ)·(Q(0)/ρ − c₀) < 0 ⟺
ρ > Q(0)/c₀` — the honest domain is the **THRESHOLD ρ ∈ (Q(0)/c₀, 1]**, not all
ρ ∈ (0, 1). R8's statement carries the threshold antecedent; the frozen-margin (2/3-class)
transfer needs re-derivation on the corrected form (at ρ near 1 the improvement survives;
at small ρ the scaled constant DEGRADES below c₀ — the informal folklore "narrower is
better" is quantitatively bounded by the threshold, a point the precharter's ρ²-form
missed entirely). The round-5 battery's (iii-b) grading (PARTIALLY-COVERED) is unchanged
— a sign observation on a corrected formula is still corollary-grade.

## 2. The public-layer discovery — the "all private" claim corrected

The precharter §2.2's load-bearing structural constraint ("all but the last two of the
bridge chain are `private`") is **correct only about `Zeta/Kernel.lean`'s LOCAL copies**.
The donor tree carries a PUBLIC frozen-family layer the wave-2 census missed:

- `Zeta/Basic.lean`: `extremalTest_pos`, `cutoffTest_contDiff/eq_zero_of_half_le_abs/
  hasCompactSupport/neg`, `cutoffTestSq_contDiff/eq_zero/hasCompactSupport/neg`,
  `contDiff_cutoffSelfConv`, `cutoffSelfConv_eq_zero_of_one_le_abs`,
  `hasCompactSupport_cutoffSelfConv`, `cutoffSelfConv_neg`,
  `exists_lipschitzOnWith_cutoffSelfConv`, `contDiff_iteratedDeriv_two_cutoffSelfConv`,
  `iteratedDeriv_two_cutoffSelfConv_eq_zero/_neg`,
  `exists_lipschitzOnWith_iteratedDeriv_two_cutoffSelfConv`;
- `Zeta/CutoffSelfConv.lean`: `exists_cutoffSelfConv_eq_zero_of_one_sub_le_abs`,
  `exists_iteratedDeriv_two_cutoffSelfConv_eq_zero_of_one_sub_le_abs`;
- `MontgomeryTaylor/TestFunction.lean`: `extremalTest_even/eq_zero/measurable/
  continuousOn/abs_le/integrableOn`.

Kernel.lean's privates (`integrable_cutoffWeight`, `cutoffTest_isAdmissible`,
`contDiff_cutoffTestSq`, `cutoffSelfConv_isPairTestFunction`, …) are private DUPLICATES
of these public facts. **Consequence:** the transport-clean tier TRANSPORTS from the
frozen family via the corrected (ii-c′) + the publics instead of re-proving at the scaled
family (R2's private-copy set shrank to ONE local mirror). R5–R7 must re-census their
assumed-private lists against this layer before re-proving anything. The ONLY genuinely
private-and-load-bearing content remains the Fourier/identity chain proper
(`fourierC_deriv`, `fourierTwist_convolution`-class bookkeeping, `fourierC_cutoffTestSq
_zero`, `cutoffNormaliser_pos`) — re-proved locally per the P1 private-copy precedent,
cited.

## 3. Re-priced ledger (port budget; supersedes precharter §2.4's composition)

Spent (as of unit 4 close, 2026-11-19): **8 of 6–10 runs** — R1 GREEN (2 fix + 1
confirm); R2 at 4 runs GATED-RED 10-residual (all mechanical; fix-batch-5 parked
`38bb8463fe7af1bc`); R3 first-fired (8 mechanical errors; parked `ed0c061218a2d739`).
The R2/R3 fix loop consumed the band's slack — the honest landing projection is now
runs 11–13 (ceiling), mitigated by the multi-file-per-run pattern (two verdicts per
Modal run). Remaining composition at ≤1 run per
rung average: R3 (corrected (iii′) + λ½-functional regression — 1 run), R4 (folded into
R3's statement — RESORBED), R5+R6 (Fourier/identity layer at κ=1, donor-verbatim
coefficients, re-censused vs the public layer — 1–2), R7 (bridge port — 1, +fix tail),
R8 (full-domain assembly + threshold-form improvement + full-coverage axcheck — 1).
Ceiling 12–13 unchanged; the public-layer discovery keeps the 6–10 band honest for a
GREEN landing around runs 9–11 total.

## 4. Honesty flags

(a) The corrected (iii′) derivation is the R3 rung's TARGET, kernel-checked at firing —
the form above is the paper derivation the run verifies (the ρ-algebra class the
precharter flagged at §1 honesty-flag (a); the falsity finding itself is
kernel-grounded via R2 lemma A's computation). (b) The threshold domain's folklore
status (battery caveat: abstract-level reads only) is unchanged. (c) This amendment is
paperwork only — no Modal runs of its own; its evidentiary basis is the R1–R3 logs.

— lane R5 (A3 lineage), 2026-11-19 (worktree agent-04 @ e3d984b; REPORT ONLY — H
commits post-K)
