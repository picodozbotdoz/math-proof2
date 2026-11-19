# Dossier-74 amendment block — DRAFT for H (owner's file: `research/candidates/74-surprisal-moment-hierarchy-ceilings.md`)

Lane R3 (A6 lineage, worktree agent-07), 2026-11-19. Dated block, drafted for H to
splice into the dossier's §Iteration-4 amendment (below the FINDS #1–#4 record);
adjudication relayed by the orchestrator 2026-11-19. Prose only — the Lean-side
state of record is `research/pilots/74/P2.lean` (sha `4425be89…` at the park) +
`research/pilots/74/P2-record.md` + the three run logs.

---

**Amendment (2026-11-19) — P2 landings + two new findings + one adjudicated
correction.**

1. **P2-a/P2-b landed GREEN (2026-11-19, `pilots/74/P2.lean`, G2 series runs 1–11,
   triad-only, 0 sorry):** the sharp window-free variance constant
   `mgfBound_var_sharp` (`varK ≤ 2v` from the centered bound on ANY positive window
   — T1(b)'s original `Var ≤ 2σ²`, a 4.5× improvement over the window-edge
   `32(e^{1/4}−1)σ²`) and the MarginalTails sharp class constant `t1c_sharp`
   (`varK ≤ 1024·e·θ·B`, the dossier's exact `2·512`). Route: the sharp pair bound
   `x² ≤ e^x + e^{−x} − 2` by two `monotoneOn_of_deriv_nonneg` layers (the
   elementary route provably caps at constant 1/2 — the squaring obstruction is
   real), then the `ge_of_tendsto` squeeze at `𝓝[>] 0`. Billing per the R9 pre-gate:
   **formal-new-as-stated / mathematically-folklore**; must-cites:
   `Mathlib/Probability/Moments/SubGaussian.lean` (on-pin; the 2026-11-13 corpus
   grep missed it), `Mathlib/Probability/MGFAnalytic.lean:279
   exists_cgf_eq_iteratedDeriv_two_cgf_mul`, `Mathlib/Probability/Moments/Tilted.lean:159
   variance_tilted_mul`. Wording guard binding: "mathlib-absent for
   finitely-supported spectra" (TRUE); never "sub-Gaussian absent from mathlib".

2. **FINDING #5 (BkClass degeneracy) + ADJUDICATED CORRECTION (2026-11-19):** the
   precharter's class-indexed ceiling with FLOOR `BkClass W_ε 1 𝒞 ≥ √((1−ε)/ε·κ·B)`
   is degenerate BOTH ways under the literal definition: (i) every point mass is a
   class member (trivial MGF) with `W_ε = 0` and all moments `0`, forcing
   `BkClass ≤ 0`; (ii) with unrestricted certificate coefficients, negative `a`
   makes the sup unbounded on hVarLB-restricted classes (`S ≥ log 2 > 0` pays for
   any `c₀`). **Adjudication: the NONNEG-coefficient variant is the corrected
   definition of record** (`CertValidClass := (∀ j, 0 ≤ a j) ∧ …`, in `P2.lean`),
   the 78-class correction pattern. The T4 tightness content lives in the
   discharged-family theorems (next item), not in a literal BkClass floor.

3. **FINDING #6 (the explicit membership threshold):** the FIND-#1 n-atom family
   (heavy atom 1/2, n tail atoms 1/(2n) — deviations exactly two-valued ±(log n)/2,
   `varK = (log n)²/4` EXACTLY, `Mdev = W_ε = (log n)/2`: the family sits ON the
   marking parabola with equality) enters the centered class at scale `B = (log n)²`
   iff **θ ≥ θ₀ := 1/(1024·e)** — the precharter's "marginal at small θ" caveat made
   precise: membership FAILS as θ → 0 (the window geometry `|u|·L/2 ≤ 1/64` against
   the MGF budget `512eθB·u²` is the binding constraint). The two-atom
   insufficiency's constructive counterpart is thus threshold-qualified.

4. **T4's shape-(i) tightness set (statement status: NEW per the R9 pre-gate's 8
   nearest-miss rows + sweeps):** `t4_floor_achieved` (κ = 1/8 floor achieved with
   EXACT parabola tightness `varK = (1−ε)W² + ε·Mdev²`) and `t4_not_littleO`
   (`W_ε(P·) ≠ o(√B)`, `W/√B = 1/2` exactly) — both stated and proof-complete in
   the P2-c line; at the 2026-11-19 park, `t4_not_littleO` and all but two
   mechanical sites of `famN_inClass` elaborate (the two parked sites + fixes are in
   `logs/p2c-run17.log`'s header; the tightness set is NOT yet a proof claim until
   the wave-close run lands it GREEN).

— end draft block —
