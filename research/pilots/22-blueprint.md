# Pilot 22 blueprint — PNT assembly (Wiener–Ikehara route)

Created by lane R3, 2026-11-09. Statement doc: R5's dossier `research/candidates/22-*.md`
**[expected — not on disk at writing time; statement worked from
`research/feasibility/mathlib-assembly-maps.md` §A (R3), which this blueprint decomposes]**.
Checkout: mathlib `ff2494ea5e43` (v4.36.0-rc2). Standard: math-proof1 (kernel-only, no `sorry`,
no `native_decide`, no external CAS).

Goal (six milestones): `Tendsto (fun x ↦ Chebyshev.ψ x / x) atTop (𝓝 1)` and the π-form
`Tendsto (fun x ↦ (Nat.primeCounting ⌊x⌋₊ : ℝ) * Real.log x / x) atTop (𝓝 1)` — the first PNT in
mathlib, assembled entirely from existing mathlib decls plus one new analytic lemma (M1) and
adapters (M2–M6). PNT-absence in mathlib is re-verified evidence in
`research/feasibility/mathlib-assembly-maps.md` §A.0 (searches + hits recorded there).

---

## Milestone 1 (G1) — the Laurent constant of ζ at s = 1

**Exact Lean shape:**

```lean
/-- The constant term of the Laurent expansion of `riemannZeta` at `1` exists. -/
theorem exists_tendsto_riemannZeta_sub_inv :
    ∃ c : ℂ, Tendsto (fun s ↦ riemannZeta s - 1 / (s - 1)) (𝓝[≠] 1) (𝓝 c)
```

(We do NOT need `c = γ` (Euler–Mascheroni) for the pilot — only existence. Identifying `c =
Real.eulerMascheroniConstant` is an optional M1b stretch: [HYPOTHESIS] mathlib has no
`ζ = 1/(s-1) + γ + O(s-1)` statement — `Real.eulerMascheroniConstant` exists, used at
`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:56-59` for digamma values, a plausible
route since `meromorphic_digamma` (:108) is mathlib's only meromorphic special function.)

**What pins the Laurent expansion today (survey results, all [VERIFIED]):**

- `riemannZeta_residue_one : Tendsto (fun s ↦ (s - 1) * riemannZeta s) (𝓝[≠] 1) (𝓝 1)` —
  `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:242` [VERIFIED statement read].
- `differentiableAt_riemannZeta` (s ≠ 1) — RiemannZeta.lean:139; `analyticOn_riemannZeta` :146.
- The Laurent *normal-form API* exists but has **no ζ instance** — mathlib's only meromorphic
  special-function instance is `meromorphic_digamma`
  (`Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:108`):
  - `MeromorphicNFAt f x : f =ᶠ[𝓝 x] 0 ∨ ∃ n : ℤ g, AnalyticAt 𝕜 g x ∧ g x ≠ 0 ∧
    f =ᶠ[𝓝 x] (· - x) ^ n • g` — `Mathlib/Analysis/Meromorphic/NormalForm.lean:51-53` [VERIFIED
    definition read]. This is the decl that "is" the Laurent expansion.
  - `meromorphicOrderAt : 𝕜 → E → WithTop ℤ` — `Mathlib/Analysis/Meromorphic/Order.lean:50`, with
    order-characterization theorems (:129, :140, :152).
  - `LaurentMeager` does **not** exist (grep: 0 hits); no `Residue`-for-contour-integral API in
    `Mathlib/Analysis/Meromorphic/` (grep `residue|Residue` → 0).

**Derivation plan (M1):**

1. Prove `MeromorphicAt riemannZeta 1` (equivalently `MeromorphicNFAt riemannZeta 1` with
   n = −1): h := (s − 1) • riemannZeta is holomorphic on a punctured neighborhood of 1
   (`differentiableAt_riemannZeta` :139), bounded near 1 (`riemannZeta_residue_one` :242), hence
   extends analytically (removable singularity — via the `Meromorphic` API; locate the exact
   removability lemma at pilot time: candidate shapes in `Meromorphic/NormalForm.lean` +
   `meromorphicOrderAt`-nonneg characterizations, Order.lean:315-320 [HYPOTHESIS on lemma name]).
2. c := `deriv (fun s ↦ (s - 1) * riemannZeta s) 1` (of the extended h), and
   `riemannZeta s − 1/(s−1) = (h s − h 1)/(s − 1)` → `deriv` as a limit (mathlib
   `HasDerivAt`-iff-tendsto form; exact lemma located at pilot time [HYPOTHESIS on name]).

**Donor shortcut (if step 1 fights back):** zeta23 already ported the pole analysis:
`ResidueOfTendsTo` (`zeta23/Zeta23/FromPNTPlus/ZetaBounds.lean:50`), `analyticAt_riemannZeta`
(:156, s ≠ 1), `riemannZetaResidue` (:165, neighborhood form of the residue — built at :170 from
`riemannZeta_residue_one` + `zeta_holc`), `riemannZetaLogDerivResidue` (:476: ‖−ζ′/ζ − (s−1)⁻¹‖
bounded near 1) and `riemannZetaLogDerivResidueBigO` (:514) [all VERIFIED statements read].
These give boundedness; M1 needs the *limit*, which follows from analyticity of h at 1 (step 1)
— so port :50/:165 mechanics, add the derivative step.

**LoC estimate M1: 300–500.**

## Milestone 2 (G2) — the continuous extension G on re s ≥ 1

```lean
theorem exists_logDeriv_extension :
    ∃ G : ℂ → ℂ, ContinuousOn G {s | 1 ≤ s.re} ∧
      EqOn G (fun s ↦ -deriv riemannZeta s / riemannZeta s - 1 / (s - 1)) {s | 1 < s.re}
```

Ingredients: `LSeries_vonMangoldt_eq_deriv_riemannZeta_div`
(`Mathlib/NumberTheory/LSeries/Dirichlet.lean:439-442`: `L ↗Λ s = -deriv riemannZeta s /
riemannZeta s` for 1 < re s [VERIFIED]) — this is what makes G the LSeries-side extension
WienerIkehara's `hG'` wants; `riemannZeta_ne_zero_of_one_le_re`
(`Mathlib/NumberTheory/LSeries/Nonvanishing.lean:417` [VERIFIED]) keeps the quotient defined on
the whole closed half-plane except the pole, where M1's c is the removable value. Continuity at
every point ≠ 1 is `DifferentiableAt.continuousAt` + division. **LoC: 200–350.**

## Milestone 3 (G3) — the Chebyshev bound hypothesis

```lean
theorem range_sum_vonMangoldt_le : ∃ C : ℝ, ∀ n : ℕ,
    ∑ i ∈ Finset.range n, (ArithmeticFunction.vonMangoldt i : ℝ) ≤ C * n
```

From `Chebyshev.psi_le_const_mul_self` (`Mathlib/NumberTheory/Chebyshev.lean:485`, ψ x ≤ C·x for
0 ≤ x [VERIFIED]) + the ψ/sum dictionary `psi_eq_sum_Icc` (:93). Pure indexing adapter
(`Finset.range` vs `Icc 0 ⌊x⌋₊`, ℕ-vs-ℝ casts). **LoC: ~100.**

## Milestone 4 (G4) — ψ(x)/x → 1

```lean
theorem tendsto_psi_div : Tendsto (fun x ↦ Chebyshev.ψ x / x) atTop (𝓝 1)
```

Wiener–Ikehara application: hypotheses `bound : ∀ n, ∑ i ∈ .range n, f i ≤ C * n`,
`hG : ContinuousOn G {s | 1 ≤ s.re}`, `hG' : EqOn G (fun s ↦ LSeries ↗f s - A / (s - 1))
{s | 1 < s.re}`, `hpos : 0 ≤ f` (`Mathlib/NumberTheory/LSeries/WienerIkehara.lean:105-107`
[VERIFIED variable block]); conclusion `tendsto_sum_range_div` (:693) / `tendsto_sum_div`
(:700), with f := fun n ↦ (Λ n : ℝ), A := 1, G from M2 (via the `LSeries` congruence shim —
see risk R3). Note WienerIkehara.lean:28-29: the `bound` hypothesis is a mathlib-added
simplification (classical W–I needs only convergence for re>1) — M3 supplies it anyway.
**LoC: 150–250.**

## Milestone 5 (G5) — θ(x)/x → 1

From `Chebyshev.isBigO_psi_sub_theta_sqrt` (:639, ψ − θ = O(√x) [VERIFIED name/location]) +
M4. **LoC: ~100.**

## Milestone 6 (G6) — π-form PNT

```lean
theorem tendsto_primeCounting_mul_log_div :
    Tendsto (fun x ↦ (Nat.primeCounting ⌊x⌋₊ : ℝ) * Real.log x / x) atTop (𝓝 1)
```

From M5 + `Chebyshev.primeCounting_eq_theta_div_log_add_integral` (:668, exact identity) +
`Chebyshev.integral_theta_div_log_sq_isBigO` (:791) [both VERIFIED names/locations]. This is the
statement to hand to mathlib upstream as the headline; G4/G5 as the analytic cores.
**LoC: 150–250.**

**Total: ≈ 1.0–1.6k LoC — the S–M band of assembly-map §A.4.**

---

## Alternative route (donor): FromPNTPlus/MediumPNT smoothed-Chebyshev

zeta23's port (of PrimeNumberTheoremAnd) contains a second, self-contained route:
`Zeta23/FromPNTPlus/MediumPNT.lean` — `psi_eq_sum_range` (:42), `LogDerivativeDirichlet` (:51),
`SmoothedChebyshevDirichlet` (:204), `SmoothedChebyshevClose` (:606),
`dlog_riemannZeta_bdd_on_vertical_lines` (:764), on top of `MellinCalculus/ZetaBounds/ZetaConj/
SmoothExistence/Sobolev/ResidueCalcOnRectangles` (file list [VERIFIED by ls]; provenance header:
PNTA v4.29.0 port re-adjusted to Mathlib 51e6992e / v4.33.0-rc2).

**Tradeoffs:**
- W–I route (M1–M6): consumes two *existing mathlib* theorems that are currently unconsumed
  (WienerIkehara.lean has zero importers — the assembly is mathlib-chartered and upstreamable);
  new content is only M1 + adapters. Downside: the Wiener–Ikehara hypothesis bundle (`hG'` +
  `LSeries ↗f` congruence) is cast-heavy.
- MediumPNT route: proves smoothed-Chebyshev asymptotics *directly* (Mellin calculus), avoiding
  the Tauberian hypothesis wrangling, and its files are already Lean-4-current; downside: ~2.6k
  donor LoC to rebase (PNTA conventions, v4.33→v4.36 drift), and it leaves mathlib's
  WienerIkehara still unconsumed (fails the assembly objective).
- **Recommendation: primary = W–I route; MediumPNT kept as fallback for M1 specifically**
  (`ZetaBounds.lean:50/:165/:476` are drop-in for the pole analysis if the `Meromorphic`-API
  removability step stalls).

## Modal run plan

Consume R9's probe infra (landed): `research/feasibility/probe/` — `run_probe.sh` (staging
pattern: copies `lean_probe.py` + `Probe*.lean` to a world-readable temp dir, runs
`modal run lean_probe.py` as user `xyz`, `MATHLIB_REV` defaults to this checkout's
`ff2494ea…` with master fallback), `lean_probe.py`, probe Lean files
(`Probe0_Smoke.lean`, `ProbeA/A2` (analytic-NT), `ProbeB1_RHLinalg`, `ProbeB2_EthTime`,
`ProbeB3_3sumEnd`). Per math-proof1 patterns (per project `AGENTS.md`): Modal-based
`lean_build.py` / `lean_check.py`, `tools/modal_run.sh`; check-standard = no `sorry`, kernel-only.

1. **P0 (probe extension):** add `ProbeP1_PNT.lean` asserting the six milestone statements as
   `sorry`-free *typechecks* against the pinned checkout — verifies every cited decl name,
   signature, and implicit-argument shape compiles at `ff2494ea` before any proof is written.
   (~0.5 day; extends `run_probe.sh` unchanged.)
2. **M1 spike:** `MeromorphicNFAt riemannZeta 1` via removable-singularity; if the `Meromorphic`
   API lacks the needed lemma, pivot to donor `ZetaBounds.lean:50/:165` port (tracked decision).
3. **M2–M6 in order**, each behind the P0 typecheck; per-milestone `lake env lean` checks on
   Modal via the probe harness, full `lake build` at pilot end; `#print axioms` on the two final
   theorems (M4, M6) — expect `[propext, Classical.choice, Quot.sound]` only.
4. **Exit criteria:** M4 + M6 kernel-checked; a single upstreamable PR-shaped diff (new file
   `Mathlib/NumberTheory/LSeries/PrimeNumberTheorem.lean` + import edges from `WienerIkehara`,
   `Dirichlet`, `Nonvanishing`, `Chebyshev`).

## Risk register (top 5)

1. **Removable-singularity glue (M1)** — mathlib's `Meromorphic` API has exactly one special-
   function instance (`meromorphic_digamma`); the needed "bounded near pole ⇒ h analytic" lemma
   may need assembling from `MeromorphicNFAt`/`meromorphicOrderAt` primitives or porting donor
   `ZetaBounds.lean:50 ResidueOfTendsTo`. Highest single-lemma risk. Mitigation: P0 typecheck +
   MediumPNT fallback.
2. **Indexing/casting mismatch** — WienerIkehara's `bound` is `Finset.range`-form over `f : ℕ → ℝ`
   with `LSeries ↗f` (ℂ-coercion); Chebyshev.ψ is `Icc 0 ⌊x⌋₊`-form; `Λ : ArithmeticFunction ℝ`.
   Expect ~100 LoC of `Nat.cast`/`Finset.range_eq_Ico` shims spread across M3/M4 (routine but
   every step of G4's plug depends on it).
3. **`hG'` congruence** — must show `LSeries ↗(Λ-as-ℝ) s` (the coerced-to-ℂ LSeries) equals the
   ℝ-L-series of Λ pointwise for 1 < re s (`LSeries_congr`-style); a definitional-unfolding step
   with junk-value edge cases at n = 0 (Λ 0 = 0 — [VERIFIED via `vonMangoldt_apply_zero`-type
   lemma existing in `ArithmeticFunction/VonMangoldt.lean`; exact name located at pilot time).
4. **Toolchain drift** — donor files target v4.33.x; checkout is v4.36.0-rc2 (`grw`, `fun_prop`,
   `module`/`public import` changes). Affects the MediumPNT fallback much more than the primary
   route (which is pure mathlib-at-checkout).
5. **Upstream-shape risk (non-blocking)** — mathlib may prefer the `∼`/`IsTheta` formulation or a
   `PrimeNumberTheoremAnd`-style namespace for the final statements; keep M4/M6 statements
   minimal and the assembly-map §A.3 signatures authoritative for internal tracking.

## Method note

All mathlib citations re-verified this session against `ff2494ea` (read at cited lines); donor
citations re-read in `anthropics_formal-math/zeta23` (ZetaBounds.lean lines 50/156/161/165/476/
514; MediumPNT.lean lines 42/51/204/606/764; Mertens.lean provenance header). `[HYPOTHESIS]`
marks lemma *names* expected to exist but not yet pinned (removability lemma; HasDerivAt-tendsto
form; `vonMangoldt_apply_zero`) — P0 resolves each. No builds run (rules).

---

## §7 M1 run log (executed 2026-11-09, lane R3)

**Invocation.** `research/pilots/22/run_m1.sh` — mirrors `research/feasibility/probe/run_probe.sh`:
stages R9's `lean_probe.py` + this pilot's `ProbeP1_PNT.lean` / `M1.lean` to
`/tmp/crossmath-pilot22-stage`, then `sudo -n -u xyz … modal run lean_probe.py --dir <stage>`
(app `crossmath-probe` reused, ephemeral; `MATHLIB_REV` default `ff2494ea…`). Container:
mathlib `ff2494ea`, toolchain `v4.36.0-rc2`, olenas present (cache hit, no CACHE-MISS).
Artifacts: `research/pilots/22/{ProbeP1_PNT.lean, M1.lean, run_m1.sh, run1..4.log}`.

**Iterations** (Modal app warm each run, ~68 s image + 2 file elaborations):

| run | wall | ProbeP1_PNT.lean | M1.lean | errors |
|---|---|---|---|---|
| 1 | ~4 min | FAIL | FAIL | Probe: `𝓝[≠]` needs `open Topology` (2 parse); `EqOn` → `Set.EqOn` (v4.36 moved). M1: root cause `eventually_ne` unknown identifier (cascade of 6). All 8 `#check` pins GREEN incl. full `WienerIkehara.tendsto_sum_range_div` signature. |
| 2 | ~2.5 min | **OK** | FAIL | M1: `eventually_ne` absent in v4.36; `Function.update_self/update_of_ne` need explicit `(a v f)` args; `Tendsto.congr'` orientation `(hl : f₁ =ᶠ f₂) (h : Tendsto f₁) : Tendsto f₂` (Filter/Tendsto.lean:107). |
| 3 | ~2.5 min | **OK** | FAIL (2) | `eventually_of_forall` → namespaced `Filter.Eventually.of_forall`; `differentiableAt_id` won't unify with `fun s => s - 1` (used `by fun_prop`); `congr_of_eventuallyEq` wants the *updated* function on the left of `=ᶠ`. |
| 4 | ~2 min | **OK** | **OK — errors=0, sorry-warnings=0** | — |

**Verdicts.**
- `ProbeP1_PNT.lean` (M1+M2 statement layer): **GREEN** (run 2, stays green through run 4). All
  statements elaborate: `stmt_M1_LaurentConstant`, `stmt_M1_MeromorphicNFAt`, `stmt_M1_order`,
  `stmt_M1_removable`, `stmt_M2_logDerivExtension` (with `Set.EqOn`), plus 8 `#check` decl pins —
  the blueprint's `[HYPOTHESIS]` on every cited decl name/signature is now `[VERIFIED]`.
- `M1.lean` (full M1 proof): **GREEN** (run 4). Kernel-clean:
  `#print axioms CrossMath.Pilot22.exists_tendsto_riemannZeta_sub_inv` →
  `[propext, Classical.choice, Quot.sound]` — no `sorryAx`, no extra axioms. File 68 LoC, proof
  body ≈ 35 lines (under the 80-line stop threshold). Proof = blueprint M1 plan verbatim:
  `differentiableAt_riemannZeta` (RiemannZeta.lean:139) + `riemannZeta_residue_one` (:242) →
  `continuousAt_update_same` (Topology/Piecewise.lean:35) →
  `Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt`
  (RemovableSingularity.lean:36) → `hasDerivAt_iff_tendsto_slope` (Deriv/Slope.lean:73).
  The blueprint's M1 risk ("removability lemma may need assembling") resolved: the weak
  removable-singularity theorem + `Function.update` transfer suffices — **no MediumPNT fallback
  needed**; the zeta23 `ZetaBounds.lean` donor route is retired for M1. The proof never
  evaluates the junk value `riemannZeta 1` (the update replaces it).

**v4.36 API notes for M2–M6** (from the four runs): `Set.EqOn` (not root `EqOn`);
`eventually_ne` absent — use `eventually_nhdsWithin_iff` + `Filter.Eventually.of_forall`;
`slope` is `(y−x)⁻¹ • (f y −ᵥ f x)` (LinearAlgebra/AffineSpace/Slope.lean) — needs
`vsub_eq_sub, smul_eq_mul` before `field_simp`; `DifferentiableAt.congr_of_eventuallyEq` takes
the target function on the left of `=ᶠ`.

**Cross-check vs dossier 22** (`research/candidates/22-quasi-rh-pnt-effective.md`, R5 — landed
mid-execution): **consistent, no contradictions.** M4 ≡ T1a and M6 ≡ T1b *verbatim*
(dossier :39-41). M5/dossier-step-6 differ only in dictionary lemmas (`isBigO_psi_sub_theta_sqrt`
:639 vs `psi_sub_theta_le` :526; `primeCounting_eq_theta_div_log_add_integral` :668 vs
`theta_eq_primeCounting_mul_log_sub_integral` :705 — all four exist in Chebyshev.lean; both
routes valid). M1–M3 are exactly the dossier's flagged "two limit processes at s = 1" step 4 —
now discharged kernel-clean by `M1.lean`. One blueprint omission to fix at M3/M4 time: the
`hpos` hypothesis (`0 ≤ Λ`, via `vonMangoldt_nonneg`, ArithmeticFunction/VonMangoldt.lean:81)
— dossier F1 has it, blueprint M3 statement omitted it. Dossier Tier 2 (T2a/T2b effective
forms) is beyond blueprint scope by design (Tier 1 = pilot). NEW risk adopted from dossier F5:
upstream PNT/Mertens PRs are in flight (#41394, #44062, #43238) — Tier-1 upstreamability is
time-sensitive; reinforces "M2–M6 next, quickly".

---

## §8 M2–M6 run log (executed 2026-11-09, lane R3; same runner/app/checkout as §7)

**File plan note.** Milestones were accumulated in ONE growing file `research/pilots/22/Tier1.lean`
(probe files cannot import each other without building modules — per-milestone files would have
forced proof duplication). `M1.lean` remains the standalone M1 record; Tier1.lean restates M1's
proof unchanged as the M2 engine. Logs: `run5.log` … `run12.log`.

**Verdicts (all kernel-clean: `#print axioms` → `[propext, Classical.choice, Quot.sound]`,
0 sorry-warnings, at mathlib `ff2494ea`):**

| milestone | theorem (CrossMath.Pilot22) | status | notes |
|---|---|---|---|
| M2 | `exists_logDerivExtension` | **GREEN** (run 12) | proof via M1's h := update((s−1)ζ): identity `−ζ'/ζ − 1/(s−1) = −h'/h` near 1 (product rule on h = (s−1)ζ, no Laurent-coefficient computation needed); continuity at s₀ ≠ 1 via `analyticOn_riemannZeta` + `AnalyticAt.deriv` + `ContinuousAt.inv₀`; at 1 via h-analyticity. |
| M3 | `exists_range_sum_vonMangoldt_le` | **GREEN** (run 5, stable) | C = log 4 + 4 from `psi_le_const_mul_self` (:485) through `psi_eq_sum_Icc` (:93) + `Nat.range_succ_eq_Icc_zero` + `Nat.floor_natCast`. Dictionary choice: range↔Icc route (the four coexisting Chebyshev lemmas noted in §7 cross-check; this route needs no ψ−θ input). `hpos` carried via `ArithmeticFunction.vonMangoldt_nonneg` (VonMangoldt.lean:81) as the dossier requires. |
| M4 | `tendsto_psi_div_atTop` (≡ dossier Tier-1a) | **GREEN** (run 12) | Wiener–Ikehara application: `WienerIkehara.tendsto_sum_range_div` (:693) with hC/hGcont/hG'/hpos; `hG'` from M2's EqOn + `LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (Dirichlet.lean:439); ψ-index transport via `tendsto_nat_floor_atTop`, `tendsto_add_atTop_nat`, `tendsto_nat_floor_div_atTop` (SpecificLimits/Basic.lean:738). **The pilot's acceptance bar is met.** |
| M5 | — | **SKIPPED by coordinator instruction** (see below) | (θ/x → 1 would follow from M4 + `isBigO_psi_sub_theta_sqrt` :639 as planned.) |
| M6 | — | **SKIPPED by coordinator instruction** | (π·log x/x → 1 from M5 + `primeCounting_eq_theta_div_log_add_integral` :668 + `integral_theta_div_log_sq_isBigO` :791 as planned.) |
| Tier 2 | `stmt_Tier2` (Prop-def, statement-only) | GREEN (elaborates, unproved by design) | exact remaining target: ∀ ε>0, ∃C, ∀x≥2, `|ψ x − x| ≤ C·x^(7/8+ε)` (dossier T2a; openai-math quasi-RH band as input). |

**Iterations (M2–M4 campaign, runs 5–12, ≈21 min wall total; ~2.5 min/run):** run5 10 errors
(ContinuousAt.inv → **inv₀** for ℂ; field_simp missing nonzero facts; HasDerivAt.inv id-shape);
run6 9 (bullet order in refine — ContinuousOn is the FIRST conjunct; filter_upwards needs
same-filter membership); run7 1 (Eventually.mono misuse → eventually_nhdsWithin_iff transfer);
run8 8 (strict-implicit `Set.EqOn` application `hGeq hs`; `ArithmeticFunction.vonMangoldt_nonneg`
namespace; paren typo); run9 10→4 sites (Set.mem_compl_iff is ∀-shaped; beta-redexes from
inferred HasDerivAt values; `1+0`/`1*1` not auto-normalized in Tendsto limit points);
run10 4; run11 4 (`set`-local F vs Pi-mul form → defeq-`exact`; `Nat.cast_succ` superfluous);
run12 **OK, errors=0, 4 other-warnings** (deprecated `if_neg` rename — cosmetic). Max fix-cycles
per milestone stayed ≤6 (M2); stop-condition (5 cycles/1h) never hit — no milestone blocked.

**Strategic stop (coordinator instruction, received mid-task):** pilot stops at M4 — the
acceptance bar and proof-of-record — rather than gold-plating M5/M6, because the upstream
convergence documented by R8 (PNTAnd MediumPNT/StrongPNT in-tree; IEANTN's PntSmooth; PR
authors converging) makes Tier-1 a race, not a research asset. M5/M6 remain spec'd above with
their exact dictionary lemmas; the live content going forward is Tier 2 (`stmt_Tier2` in
Tier1.lean), whose zero-free-band input (`riemannZeta_ne_zero_of_seven_eighths_lt_re`,
openai-math `lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:7`) and Perron machinery
(tauceti `truncatedPerron_LSeries`, Perron/Formula.lean:130) are cited in dossier 22 §F2.

## §9 Tier-1 status

**PROVED-TO-M4.** M1, M2, M3, M4 all GREEN, sorry-free, kernel-clean at mathlib `ff2494ea`
(`research/pilots/22/{M1.lean, Tier1.lean}`; 68 + 290 LoC). M5/M6 spec'd but unproved (skipped
by coordinator instruction — upstream race); Tier-2 statement-only (`stmt_Tier2`). Total pilot
wall-time ≈51 min over 12 Modal runs.

## §10 Upstreaming note (no action; if the user ever PRs this chain to mathlib)

**Decomposition (in dependency order; LoC = our proved bodies, to be restyled mathlib-side):**

1. **PR-A — Laurent constant at s = 1** (M1, ~70 LoC): `exists_tendsto_riemannZeta_sub_inv` →
   an extension of `Mathlib/NumberTheory/LSeries/RiemannZeta.lean`. 100% mathlib-native inputs
   (`RemovableSingularity.lean:36`, `Topology/Piecewise.lean:35`, `Deriv/Slope.lean:73`);
   the only glue is the `Function.update` removable-extension assembly.
2. **PR-B — log-derivative extension** (M2, ~120 LoC): `exists_logDerivExtension` → new
   `Mathlib/NumberTheory/LSeries/` file; depends on PR-A. Inputs: `analyticOn_riemannZeta`
   (:146), `riemannZeta_ne_zero_of_one_le_re` (:417), `AnalyticAt.deriv`
   (FDeriv/Analytic.lean:477), `ContinuousAt.inv₀` (GroupWithZero.lean:119).
3. **PR-C — Chebyshev dictionary corollary** (M3, ~25 LoC): range-sum form of
   `psi_le_const_mul_self` (:485) via `psi_eq_sum_Icc` (:93). Independently mergeable.
4. **PR-D — PNT** (M4, ~80 LoC): `Mathlib/NumberTheory/LSeries/PrimeNumberTheorem.lean`;
   the assembly (Wiener–Ikehara + PR-A/B/C). M5/M6 θ/π forms optional follow-ups (§8's
   dictionary lemmas).

**What ours adds vs the racing PRs** (#41394/#44062/#43238, per dossier 22 §F5 / R8): those
port the PrimeNumberTheoremAnd route (MediumPNT smoothed-Chebyshev / in-tree StrongPNT);
ours instead **consumes mathlib's own, currently zero-consumer Wiener–Ikehara** — i.e., it
completes an intentional mathlib assembly point rather than adding a parallel proof. If a
racing PR merges first, PR-A/B remain independently valuable (they are WienerIkehara-generic
Tauberian inputs, not PNT-specific), and PR-C stands alone; only PR-D becomes redundant.
Practical order: A → B → C in parallel, check mathlib master before D.

**License/provenance: clean.** All Lean this campaign (M1.lean, Tier1.lean, 358 LoC) written
from scratch this session; no donor lines (the zeta23 `FromPNTPlus/ZetaBounds` fallback was
retired unused, §7); sole dependency mathlib at `ff2494ea` (Apache-2.0). The pilot files are
project-internal records — an upstream PR would restate the four theorems in mathlib style
(namespace `WienerIkehara`/`Chebyshev` conventions) rather than lift the files verbatim.
