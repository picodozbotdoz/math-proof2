# ZZV2-λ P1 — `ZZLam` λ-abstract statement layer: FINAL record + HARD STOP

**Billing: technical record / engineering — NOT a discovery, never an article.** The
λ-family statements proved here are Lean-side extensions of the donor ZetaZerosV2
library's λ-generic transfer layer; the informal λ-dependence is **Lamzouri's** content
(must-cite: the donor's cited source for "more than 2/3 simple-and-on-line plus the
three further proportions"; Montgomery ICF 1974 for the pair-correlation framework;
Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh 2024, Lemma 5, for the unconditional
pair-correlation input). Novelty = the Lean λ-layer only (novelty/iter4-seed-triage row
2: KNOWN-INFORMAL, corpus-collision NONE).

## Verdict

**GREEN — P1 FINAL** (`logs/p1-run3.log`, 2026-11-17; run `ap-jbP40WH2qhN13JgmtyBaWn`).
`build: OK` (8262 jobs) and `P1.lean: OK` under the runner's **sorry-strict** verdict
(rc=0, 0 errors, 0 sorry; the P0-probe exemption does not apply). Artifact:
`research/pilots/zzv2-lam/P1.lean` — 290 LoC (≤300 guard), 10 theorems + 5 defs,
sha256 `a9a6555cadcd604c…`. **Full print surface, 10/10 triad-only**: every top-level
theorem including both private bookkeeping copies prints exactly
`[propext, Classical.choice, Quot.sound]`; token-level sweep of the whole log finds no
other axiom identifier (zero sorryAx, zero native_decide). Elaborated INSIDE the built
ZetaZerosV2 tree on-pin (mathlib `ff2494ea…`, toolchain v4.36.0-rc2) per the M4b2
recipe — donor consumed as a BUILT library, per G2/P0 hygiene precedent.

## What was proved (the ladder as landed)

- **L0** `LamParams` (lam, hpos : 0 < lam) — the P0(a)-pinned minimal range; no guessed
  interval.
- **L1** `KSAsymptotic lam c` — **the ONE explicit binder**: `∃ eta, IsAdmissible lam
  eta ∧ Tendsto (fun T => Re (unweightedKernelSum eta T) / zeroScale T) atTop (nhds c)`
  — exactly `kernelConstruction`'s output tuple (`Zeta/Kernel.lean:995`) minus its
  frozen λ=1/2 constant identification; that subtraction IS the P0(b) MT-frozen seam.
  Constants `C0Lam c = 2 − c`, `C1Lam c = 3/2 − c/2`, `C2Lam c d = (5+2√2−2(c+d))/(3+2√2)`
  — the donor's transfer-functional shapes inline at the endpoints, NO closed form in
  `lam` guessed (a cot-substitution at general λ would be informal content = P2 lemma;
  P2 is stopped, below).
- **L2** the four λ-family theorems: `thm_simple_lam`, `thm_distinct_lam`,
  `thm_average_lam`, `thm_simple_or_critical_lam` (the fourth carries the A-window
  hypotheses `1 ≤ c + ε/2 < 2` that the donor derives from its frozen constant bounds) —
  the donor's four proved-endpoint shapes (Main.lean/Proportions.lean) with the
  constants generalized through the binder.
- **Domain pins**: `KSAsymptotic_mono` (admissibility windows widen; the same witness
  serves every `lam' ≥ lam`) and `exists_KSAsymptotic_of_half_le` (the family domain
  contains `[1/2, ∞)`, realized by the FROZEN kernels re-windowed — not new λ-kernels).
- **L4 at binder level**: `thm_simple_lam_half_regression` and
  `thm_distinct_lam_half_regression` — instantiating the family at the donor's own
  frozen point (`lam = 1/2`; note: the prework's "λ = 1" was the informal paper's
  parameterization — the donor's admissibility point is `1/2`) and discharging the
  binder with `kernelConstruction` re-derives the donor's headline constants
  (`3/2 − (1/√2)cot(1/√2)`, `5/4 − (1/(2√2))cot(1/√2)`) bit-for-bit: the family
  EXTENDS the frozen layer. (The fourth endpoint's numeric regression is the identical
  pattern with the ε ≤ 1/8 wrapper; covered by construction, not separately stated.)
- Two local copies of the donor's private λ-free bookkeeping lemmas
  (`eventually_average_proportion`, `eventually_le_mul_of_tendsto_ratio`,
  Proportions.lean:32/:47 — private, inaccessible cross-module), cited in-file.

## Runs (3 total; fix-loop 2 of ≤4 after the run-1 wiring fix)

1. `p1-run1.log` — FRICTION (no elaboration): `lake build -j 2` → "unknown short option
   '-j'": **lake v4.36.0-rc2 has no -j/--jobs flag** (verified against the toolchain's
   own `lake build --help`). Fix: `taskset -c 0,1 lake build ZetaZeros` hard-caps the
   build phase at the SPEC's 2 CPUs (function-body change only; image run_commands
   textually identical — family layer sharing preserved). Wall 134 s.
2. `p1-run2.log` — 3 mechanical errors (the exact m4b2-run1 friction class): 2×
   `lean.dependsOnNoncomputable` (`C1Lam`, `C2Lam` divide on ℝ → `noncomputable def`)
   and 1 `rcases` flattening failure in `KSAsymptotic_mono` (fixed to projection form).
   8/10 theorems were already triad in this run. Wall 657 s.
3. `p1-run3.log` — GREEN, wall 582 s. Route all runs: doz CLI / semraker (primary per
   the 2026-11-17 ruling + H relay; xyz verified live as fallback, unused). Telemetry:
   mem never over (max 2949 MB < 4096); OVER-cpu flags confined to the pre-taskset
   update/cache phases (git fetch + zstd) plus python-side overhead; the build phase
   itself ran capped (~3.2–3.8 cores total reading incl. the un-capped function
   process). All investigation notes in the log closing blocks.

## HARD-STOP declaration (r5 §12a STOP rule, executed)

**The ZZV2-λ ladder ENDS at P1 GREEN for iteration 4.** P0(b) found the Landau
kernel-sum bridge MT-frozen (`unweightedKernelSum_cutoffTest_tendsto` is proved only at
`cutoffTest ψ` kernels — frozen `extremalTest` base, no scaling-covariance lemma
in-tree; `P0-record.md` pin table), so the r5 §12a rule applies verbatim: *"if P0(b)
finds the Landau layer MT-frozen, stop after P1 GREEN + diagnose-note."* P1 is GREEN;
this file is the diagnose-note. **P2 (glue + continuity + margin, and any λ ≠ frozen
binder discharge) is NOT executed this cycle**: discharging `hKS : KSAsymptotic lam c`
at genuinely λ-scaled kernels requires re-proving the corrected-test machinery
(`correctedTest`/`r_{ψ,T}`, `Zeta/Defs.lean:126`+) for scaled base kernels — a **Landau
η-port**, which is a charter decision for iteration 5, not scope creep. Everything P2
would have needed is now precisely specified by the `KSAsymptotic` binder: the
iteration-5 ask is exactly "prove `∃ c, KSAsymptotic lam c` (with `c` near the scaled
functional) for λ-kernels at λ beyond the frozen witness's re-windowing". P3's
full-coverage axcheck sweep over the P1 artifact remains available to the close-out
audit on demand (the in-file 10/10 triad print surface is the standing evidence; the
artifact has no dotted-name or `@[simp]` theorems, so the in-file enumeration is
exhaustive — the axcheck_full regex gaps documented in AGENTS.md do not arise).

— lane A3, 2026-11-17 (worktree agent-04 @ 53c1548; REPORT ONLY — H commits)
