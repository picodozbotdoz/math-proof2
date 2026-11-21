# η-port R5-file (R7 bridge port — the de-freezing move) — record: RUNG R7 GREEN at the fix tail (iter-7 day-1, D2′(c))

**Billing: technical record per DECISION-2 = Option A (record-billed, quota-free)**
— infrastructure only, never discovery-phrased; informal λ-dependence Lamzouri's
(must-cite: Lamzouri arXiv:2609.02882, Montgomery ICF 1974, BGS-TB 2024 Lemma 5).

## Headline verdict (runs 1–2, 2026-11-21; logs in `logs/`)

- **RUNG R7 EXITS GREEN** — `eta-r5.lean` @ `061b64f593ef5db3` strict-OK
  (rc=0, **errors=0, sorry=0** — parsed for BOTH sorry message forms per the
  D5′ runner one-liners) — **16/16 prints TRIAD-CLEAN** `[propext,
  Classical.choice, Quot.sound]` and nothing else: the 10 carried base prints
  (the eta-r4 @ `285a411e` gate re-verified as the in-file regression anchor)
  **+ the 6 R7 declarations** —
  `cutoffTestLam_isAdmissible` (B, carried from eta-r2 @ `a9c6b59f`),
  `cutoffSelfConvLam_isPairTestFunction` (C), 
  `iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction` (D),
  **`unweightedKernelSum_cutoffTestLam_tendsto` (R7-a — THE BRIDGE, the donor's
  `Zeta/Kernel.lean:600` statement AT THE SCALED FAMILY, via the PUBLIC
  `PairCorrelation.tendsto` at the rung-2 instances + the R6-4 identity)**,
  **`scaledBridge`** (R7-b — the probe's `ScaledBridge` `.re / zeroScale`
  projection at `scaledConstLam`), and
  **`KSAsymptotic_of_scaled`** (R7-c — the probe's `discharge_of_scaledBridge`
  with BOTH binders supplied).
- **THE DE-FREEZING MOVE IS KERNEL-COMPLETE:** for every cutoff ψ on the honest
  domain `0 < lam ≤ 1/2`, `delta < 1/4`, `0 < A_ψ` —
  **`KSAsymptotic lam (scaledConstLam lam psi)`** — P1's `hKS` binder is now
  DISCHARGEABLE at the scaled family; the P1 HARD-STOP's P2 ask is discharged
  on `lam ∈ (0, 1/2]` (the `lam ≥ 1/2` arm was P1's own
  `exists_KSAsymptotic_of_half_le` — R8's two-arm assembly unifies them).
- Fire discipline: the D2′(c) grant = **1 fire + fix tail** — SPENT EXACTLY
  (run 1 first proof; run 2 the fix tail; no third fire). Logs:
  `logs/eta-r4-run6-eta-r5-run1.log` `f8c4e152` (run 1, gated) +
  `logs/eta-r4-run7-eta-r5-run2.log` `272bf676` (run 2, GREEN).

## Run 1 residue decode (all mechanical, zero math defects — the fix tail)

Run 1 (`eta-r5` @ `e7234318deb593f4`, FAIL rc=1 errors=4 sorry=0): **the bridge
proved GREEN on its FIRST elaboration** (R7-a + B/C/D all triad-clean in run 1's
own prints; only the two NEW projection micro-lemmas failed):
1. `:1240` `Complex.im_ofReal` — **UNKNOWN at the pin** (name drift; the pin's
   lemma is `Complex.ofReal_im`, the `TwoDim.lean:451` idiom — verified in the
   encore checkout before the fix);
2. `:1238` unsolved-goals = (1)'s cascade inside `complex_div_re_ofReal`;
3. `:1320` `Tendsto.comp` presented `Complex.re ∘ f` against a lambda-form goal —
   fixed by the type-ascribed `have hc2 : Tendsto (fun T => …).re … := hc.comp
   hcomplex`;
4. `:1323` `congr'` orientation REVERSED vs drafted — the eventual goal is
   `(z / ↑s).re = z.re / s` (the identity's own orientation; dropped the `.symm`).
`scaledBridge`/`KSAsymptotic_of_scaled`'s run-1 sorryAx = pure cascade of 1–4
(the mathematics was complete — the iter-5 "poison" pattern, again confined to
interface glue).

## Architecture of eta-r5.lean (self-contained convention, the eta-r4 pattern)

The base is **eta-r4.lean @ `285a411e` VERBATIM** (defs + lemma A + the R5/R6
Fourier-identity layer + its 10-print gate — GREEN at port run 14); the rung-2
trio (B)/(C)/(D) re-established from **eta-r2.lean @ `a9c6b59f`** (GREEN at
runs 9/13) with its private support (`extremalTest_nonneg'`,
`integrable_cutoffWeightLam` — the ONE donor-private local mirror, cited —
`cutoffTestLam_eq_zero_of_lam_le_abs`, `cutoffTestLamSq_eq'`); then the R7 layer:
`scaledConstLam` (probe :144 def verbatim), `KSAsymptotic` (P1.lean :54 def
carried verbatim), the projection identity (private, junk-safe), the bridge
(the donor's proof SKELETON mirrored: hQ/hQ2 → log-growth → the R6-4 rewrite →
`field_simp [hdenC, hscaleC]`), the projection, the discharge triple-angle.
File: 1354 LoC, 47 declarations, zero duplicate names, 17 in-file axiom gates
(16 unique decls + the base gate).

## Telemetry disposition (both runs; investigate-not-upgrade)

Run 1: wall 639 s, max_cpu 15.37, max_mem 2796 MB < 4096, anon=0, OVER=9. Run
2: wall 607 s, max_cpu 11.80, max_mem 2835 MB < 4096, anon=0, OVER=8. ALL
OVER samples in the AUTHORIZED m4b2/G2 donor-tree build-phase class (peaks at
the `lake exe cache get` artifact phase; elaboration phases confined; anon=0 =
the olean-mmap artifact). Disposition IN-LOG (both headers). Action NONE.

## What R7 feeds (next rung, FRESH grant per D2′(c))

**R8 — the two-arm assembly** (`stmt_exists_KSAsymptotic_of_pos`: the
`lam ≥ 1/2` arm = P1's `exists_KSAsymptotic_of_half_le` UNCHANGED + the
`lam ∈ (0, 1/2]` arm = R7's `KSAsymptotic_of_scaled`) + the
threshold-form improvement (`scaled_const_improves` carrying the (ii-c)/(iii)
FINDING's antecedent ρ ∈ (Q(0)/c₀, 1]) + the FULL-COVERAGE axcheck sweep over
the whole port artifact (pilot-10 pattern) — the wrap `zzv2-lam-port-wrap.md`
§3 the pricing record. No fire taken without a fresh grant.

— lane R5 (A3 lineage), 2026-11-21 (worktree agent-04 @ d429d19; REPORT ONLY —
H lands: eta-r5.lean `061b64f593ef5db3` + the two logs + this record)
