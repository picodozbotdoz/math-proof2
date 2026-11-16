/-
Statement elaboration probe — not a proof artifact.
**STAGED 2026-11-16 (lane R6, iteration-4 fresh-bridge scan) — run only on orchestrator
approval.** Numbering: G9/G10 are lane R8's (StrongPNT / Physlib-refresh;
`ProbeG9_StrongPNT.lean` on disk, G10 reserved in `gprobe.py`'s probe-mode skip-set) —
this lane takes G11/G12.

Probe G11 (OAI-SiegelZeros donor registration): openai-math's uniform Landau–Siegel zero
exclusion, elaborated and axiom-audited INSIDE the donor's own tree at the DONOR's pin
(v4.34.1 / mathlib d13f23b7) — the exact G7b precedent (donor-pin audit; axiom verdicts are
pin-independent, they report the proof tree, not the mathlib revision). Full-tree sweep ONLY
if a consumer lands (G7b scope convention).

Discovered by the R6 re-scan (`research/novelty/iter4-fresh-bridges.md` §0.1): the tree is
proved sorry-free (rg over `OAI/NumberTheory/SiegelZeros/` = 0 proof sorries) and is
UNREGISTERED in the Cycle-2 clocks (`ITERATION4-SCAN.md` §1c) and donor maps. Companion
preprint: `preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf`
(OpenAI, Oct 1 2026), Theorem 1: "There is an absolute constant c > 0 such that every real
zero β ∈ (0,1) of every primitive nonprincipal real Dirichlet L-function of conductor q ≥ 3
satisfies (1−β) log q ≥ c" [read, p.1–2]. Sibling preprint QRH paper2 (Oct 5 2026,
`The-Quasi-Riemann-Hypothesis-October-5-2026/paper2.pdf` Theorem 1.1: zero-free Re s > 11/12
for every finite-order Hecke L over ℚ(√−3)) is self-described as WEAKER than the
G7b-audited 7/8 tree (paper2 p.2: "natural intermediate step toward the stronger zero-free
region Re s > 7/8 established in [36]" = the OAI 7/8 tree) — no Dirichlet-class frontier
change; logged here because it is the same registration batch.

Donor statement shape (read-only donor, /home/doz/zcode-workdir/openai-math/lean):
`OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11–21` —
`OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap`:
    ∃ c : ℝ, 0 < c ∧ ∀ (q : ℕ) [NeZero q], 3 ≤ q →
      ∀ χ : DirichletCharacter ℂ q,
        χ.IsPrimitive → χ ≠ 1 → (∀ a : ZMod q, (χ a).im = 0) →
        ∀ β : ℝ, 0 < β → β < 1 → χ.LFunction (β : ℂ) = 0 →
          c ≤ (1 - β) * Real.log (q : ℝ)
Proof delegation (audit targets, G7b delegation-root convention):
`Intersection/BezoutBoundary.lean:13` — `OAI.SiegelZeros.SiegelZerosAwei.W50.
uniform_exclusion_of_local_isolated_bezout`;
`Intersection/IsolatedBezoutFromRegularSelection.lean:346` — `OAI.SiegelZeros.
WeightedTorusJets.W22.localIsolatedBezout_of_actual_regular_selection`.

Consumption class (pre-registration ruling, G7b/Liu-1 convention): donor is v4.34.1 —
**DO-NOT-CONSUME as a build dependency until a G-probe verdict lands; statement-binder
class only** (the audited statement above IS the binder hypothesis surface — consumers
bind `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap` verbatim as a Prop
binder, the G12 convention; the our-pin mathlib-only transcription is consumer-pilot work,
the G7 Liu pattern — OAI's `DirichletCharacter.LFunction` is the donor's own def, not
mathlib's).

Execution (orchestrator-gated): the dedicated **g11 mode** of app `crossmath-gprobe` —
`research/feasibility/probe/run_gprobe.sh g11` (added 2026-11-16, same lane; R8 had already
excluded this file from the `probe` auto-glob skip set). g7's donor-pin tarball pattern on
its OWN volume `crossmath-g11-tree` (snapshot `/vol/oai-lean-g11.tar`; the g7 resume tree is
untouched): import-BFS closure from BOTH G11/G12 seed targets → tarball (+ lakefile,
manifest, lean-toolchain, patches/) → `lake exe cache get` → the donor's own 12-dep
post_update patch tier (g7's run19 lesson) → `lake build OAI.NumberTheory.SiegelZeros.
Conclusions.Theory OAI.NumberTheory.PiExponent.Main` → snapshot-save → elaborate this file
(`#check`/`#print axioms` only). NOT the plain `probe` auto-glob (this file imports donor
modules and cannot elaborate mathlib-only on our pin). No run staged this cycle.

Expected verdict (one line, for the probes ledger): OK + headline & both delegation roots
triad-clean `[propext, Classical.choice, Quot.sound]`, or FAIL with the stray-axiom list.
All sorries (none expected — this file is #check/#print only) would be probe scaffolding
per convention; verdicts are STATEMENT-elaboration/axiom-audit results, never proof claims.
-/
import OAI.NumberTheory.SiegelZeros.Conclusions.Theorem

/-! ## Direct-import signature checks -/

#check @OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap

/-! ## Donor hygiene: axiom audit of the headline -/

#print axioms OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap

/-! ## The delegation roots (the assembly layer the proof sits on). -/

#print axioms OAI.SiegelZeros.SiegelZerosAwei.W50.uniform_exclusion_of_local_isolated_bezout
#print axioms OAI.SiegelZeros.WeightedTorusJets.W22.localIsolatedBezout_of_actual_regular_selection
