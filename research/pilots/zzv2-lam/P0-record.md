# ZZV2-λ P0 — statement-facts probe record (technical record; engineering billing)

**Billing: this is NOT a discovery and never an article.** P0 is the statement-level first
rung of the ZZV2-λ formalization-first technical record (r5-iteration4-backlog §12a route
(a), slot-3 KEEP): a `#check`/`#print axioms` probe elaborated INSIDE the built ZetaZerosV2
tree, rung 1 of the L0–L4 ladder. All informal mathematics herein is **Lamzouri's** (the
donor's cited source for the >2/3 and three further proportion theorems; Montgomery's ICF
1974 pair-correlation framework; Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh 2024 Lemma
5 for the unconditional pair-correlation input) — must-cited wherever any part of this
pilot is referenced. The Lean λ-layer is the deliverable, per `pilots/zzv2-lambda-prework.md`
§4 (A5's triage row 2, binding: KNOWN-INFORMAL, corpus-collision NONE).

## The paragraph (P0 verdict + P1 decision)

P0 ran GREEN on run 1 of ≤2 (`logs/p0-run1.log`, 2026-11-17, doz CLI / workspace semraker,
app `crossmath-pilot-zzv2-lam`, wall 681 s at SPEC 2 cpu/4 GB soft): the donor tree built
clean on-pin (mathlib resolved `ff2494ea…`, PNT+ path-redirect green) and `P0.lean`
elaborated with **0 errors and 0 sorry** — all 16 `#check`s of the λ-generic surface
resolve verbatim against `import ZetaZeros`, and the donor hygiene gate passed on-pin from
the consumer side: `simpleOnLineCount_lower`, `distinctZeroCount_lower`,
`unweightedKernelSum_cutoffTest_tendsto`, `pairCorrelationFormula` each print exactly
`[propext, Classical.choice, Quot.sound]` (4/4 triad-only, 0 sorryAx — G2 precedent
re-executed at the consumption site). The three pins: **(a)** the four transfer endpoints
are fully λ-generic with NO numeric λ-range in their binders — `hT : 1 < T`,
`hzeros : (nontrivialZeros T).Nonempty`, `hη : IsAdmissible lam eta` (plus, for
`simpleOrOnLineCount_lower`, `hA1 : 1 ≤ Ac`, `hA2 : Ac < 2`, `hbnd : Re
(unweightedKernelSum eta T) ≤ Ac * zeroCount T`), so λ enters mathematics ONLY through
`IsAdmissible`'s support clause (`∀ x, lam ≤ |x| → eta x = 0`) — the family domain is
"every λ admitting an admissible η", not a guessed interval; **(b)** the Landau side is
two-layered: the pair-correlation INPUT is η-generic and unconditional
(`PairCorrelation` quantifies `∀ f, IsPairTestFunction f`, `Inputs.lean:55`, PROVED as
`pairCorrelationFormula`, `FromLandau.lean:52`, from Landau's explicit formula — no
hypothesis binders), but the BRIDGE from that formula to the kernel-sum asymptotic the
transfer layer consumes — `unweightedKernelSum_cutoffTest_tendsto` (`Kernel.lean:600`) —
is **MT-frozen**: it is proved only at `η = cutoffTest ψ` (`Defs.lean:111`, i.e.
`ψ · √f₀ / √A_ψ`) with `ψ : IsCutoff delta`, `0 < delta < 1/4` — ψ-generic but with the
Montgomery–Taylor extremal `f₀ = extremalTest` (`Defs.lean:76`, `cos(√2 x)/(√2 sin
(1/√2))` on `[−1/2, 1/2]`) hard-coded into the construction, and **no scaling-covariance
lemma exists anywhere in the tree** (tree-wide grep for scal/dilat/covariance: zero
relevant hits), so every η for which the kernel-sum asymptotic is provable has support
⊆ (−1/2, 1/2) and the λ=1 terminal constants (`montgomeryTaylorConst`/`simpleProportion`/
`distinctProportion`, `Numeric/MontgomeryTaylor.lean:39/45/50`) are frozen closed forms;
**(c)** the functional's definition sites for L1 are `unweightedKernelSum`
(`Zeta/Kernel.lean:191`), the transfer functionals inline in the endpoints
(`Zeta/Transfer.lean:126` `2 − Re(KS)/N`-shape, `:151` `3/2 − Re(KS)/2N`-shape,
`Zeta/TransferBounds.lean:63` the A-form), and the asymptotic value functional
`pairMainTerm f = f 0 + 2∫₀¹ α f α` (`Zeta/Defs.lean:48`) evaluated at
`cutoffSelfConv ψ` (`Zeta/Defs.lean:120`). **P1 decision per the r5 §12 rule: GO, then
hard STOP after P1 GREEN.** P0(b) is UNFAVORABLE in the prework's sense ("the
kernel-sum bound scales to λ-perturbed kernels, at least via a scaling-covariance lemma")
— it does not scale; therefore the P2 binder discharge for λ near 1 is NOT available, and
per §12a/prework §5 the ladder stops after P1 GREEN with this diagnose-note: discharging
`hKS_lam` at λ ≠ 1 requires a **Landau η-port** (re-proving the corrected-test machinery
`correctedTest`/`r_{ψ,T}` at `Zeta/Defs.lean:126`+ for λ-scaled base kernels), which is a
charter decision, not scope creep. P1 itself is unaffected and GO: the four endpoint
signatures elaborate verbatim on-pin (this run), they consume only `IsAdmissible` +
`unweightedKernelSum`, so `ZZLam.lean` with `hKS_lam : <the kernel-sum bound at kernelLam
lam>` as ONE explicit binder lands GREEN on donor+mathlib statements alone (the zeta23
`thmA/B/C_lam` binder precedent; L4 regression at binder level included).

## Pin table (donor citations, all read this session in the read-only sibling)

| Pin | Fact | Donor citation |
|---|---|---|
| (a) endpoints | `{lam T : ℝ} {eta : ℝ → ℝ}` + `hT/hzeros/hη` (+ `hA1/hA2/hbnd` on the 4th); no numeric λ-range anywhere in the transfer layer | `ZetaZeros/Zeta/Transfer.lean:126,151`; `ZetaZeros/Zeta/TransferBounds.lean:35,63` |
| (a) admissibility | `IsAdmissible lam eta` = MemLp 2, even, supp ⊆ (−λ,λ), `fourierC (η^2) 0 = 1` — λ is ONLY the support window | `ZetaZeros/Definitions.lean:92` (fields :93–:102); `testKernel :104` |
| (b) input layer | `PairCorrelation : ∀ f, IsPairTestFunction f → ∃ C T₀, ‖Σ_f/(T/2π·log T) − pairMainTerm f‖ ≤ C/√log T` — η-generic, UNCONDITIONAL | `ZetaZeros/Zeta/Inputs.lean:55` (Prop), `:37` (`IsPairTestFunction`); `ZetaZeros/PairCorrelation/FromLandau.lean:52` (proof, from `landauTruncatedLimit`) |
| (b) bridge (the freeze) | `unweightedKernelSum (cutoffTest ψ) T / zeroScale T → pairMainTerm (cutoffSelfConv ψ)` only for `ψ : IsCutoff delta`, `0 < delta < 1/4`; `cutoffTest ψ = ψ·√f₀/√A_ψ` with `f₀ = extremalTest` hard-coded; no scaling-covariance lemma in-tree | `ZetaZeros/Zeta/Kernel.lean:600`; `ZetaZeros/Zeta/Defs.lean:111` (`cutoffTest`), `:76` (`extremalTest`), `:88` (`IsCutoff`), `:126` (`correctedTest` = `r_{ψ,T}`) |
| (b) terminal constants | closed forms frozen at the λ=1 kernel | `ZetaZeros/Numeric/MontgomeryTaylor.lean:39,45,50` |
| (c) functional sites | `unweightedKernelSum` :191; transfer functionals inline at the endpoints; asymptotic value `pairMainTerm` :48 at `cutoffSelfConv` :120 | `ZetaZeros/Zeta/Kernel.lean:191`; `Zeta/Transfer.lean:126,151`; `ZetaZeros/Zeta/Defs.lean:48,120` |

## Run facts

- GREEN run 1/≤2; `build: OK`, `P0.lean: OK (probe, sorry allowed)` with no sorry suffix
  (= 0 sorry; the probe exemption was never needed — P0 is `#check`/`#print axioms` only).
- Route: doz CLI `/home/doz/dozenv/bin/modal` (workspace semraker), primary per the
  2026-11-17 orchestrator ruling + H relay (warm m4b2-family layers on semraker); xyz
  route verified live same session as fallback, not used. Log:
  `research/pilots/zzv2-lam/logs/p0-run1.log` (provenance header + transcript + closing
  block; Modal run `ap-gFFjnsXAabKffx6ZscolXn`). Telemetry: wall 681 s, max_cpu 11.14
  (soft-burst, OVER=8 cpu-only; mem max 2960 MB < 4096 MB, never over) — investigation
  note in the log's closing block (lake -j width vs nproc=18; m4b2 precedent; `-j 2`
  noted for future build runs).
- Honest note on audit coverage: the runner has no dedicated full-coverage axcheck mode;
  P0's audit surface is the 4 consumed donor names, all printed on-pin triad by this run
  (the P0 spec's exact requirement). The full-coverage axcheck (pilot-10
  `axcheck_full.py` pattern) attaches to P1's `ZZLam.lean` proof artifact at P3.

## P1 GO/STOP (the r5 §12 rule, applied)

**GO for P1** (≤300 LoC, binder-shaped, ≤~2 runs of the warm app): L0 `LamParams` with
`lam : ℝ`, `hpos : 0 < lam` (minimal honest range — the transfer binders impose nothing
narrower; do NOT guess an interval), L1 `kernelLam`/`C0Lam`-shape defs at the donor
vocabulary above, L2 the four family statements with `hKS_lam` as one explicit binder,
L4 λ=1 regression at binder level. **Hard STOP after P1 GREEN**: P0(b) MT-frozen ⇒ no P2
binder discharge for λ near 1; the η-port (`correctedTest` machinery at scaled kernels)
is a charter decision. This file is the diagnose-note the STOP rule requires.

— lane A3, 2026-11-17 (worktree agent-04 @ 53c1548)
