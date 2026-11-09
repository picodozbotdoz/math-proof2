# Pilot 32 — Rc savings frontier Γ(ε): blueprint, run log, outcome

Dossier: `research/candidates/32-rc-savings-frontier.md`. Lane R7 (file landed 20:37) → R7'
(run1) → R7'' (interrupted) → closed in the 2026-11-09 resume session.
**Status: M1 GREEN** — `research/pilots/32/M1.lean` (≈500 LoC), mathlib `ff2494ea`,
Lean v4.36.0-rc2, kernel-only, no `sorry` / `native_decide` / external CAS.

## 1 Scope (M1 = LevelSystem-free core of Theorems A and B)

Definitions transcribed (shapes) from `anthropics_formal-math/3sum-apsp/PaperStatements.lean`:
`entropy` :2006, `lnΛ` :2011, `Rc` :2015, `epsStar` :2018, `rhoC` :2021, `gammaOf` :2024.
Certificate class (dossier §Definition): `AchievableAt ε γ :⇔ ∃ c > 10, ∃ θ ∈ (0, 9/10),
γ ≤ gammaOf c θ ∧ ε < Rc c (gammaOf c θ)`, `FrontierSet ε := {γ > 0 | AchievableAt ε γ}`,
Γ(ε) := sSup (FrontierSet ε). Corollary 31 (`:4014`, the data-structure statement) is NOT
consumed: M1 is the pure order/log content of the frontier.

## 2 Theorem inventory (all `#print axioms` = `[propext, Classical.choice, Quot.sound]`, run3)

| theorem | statement | dossier item |
|---|---|---|
| `lnΛ_10_0` | lnΛ(10, 0) = 5·ln 10 (exact; via H(1/10) = ln 10 − (9/5)·ln 3) | A(ii) |
| `Rc_10_0` | Rc(10, 0) = ε* = ln 4/(5 ln 10) | A(ii) |
| `lnΛ_mono` (+ `lnΛ_decompose`, `Ffun_mvt`, `kappa_pos`) | c ↦ lnΛ(c, 0) strictly increasing on [10, ∞) — MVT on F(c) = (c−1)ln(c−1) − c ln c with the rational margin 2·ln(10/3) > ln(10/9) | re-proof of donor `Sec4_Rc_strictAntiOn` (γ = 0) |
| `Rc_strictAntiOn_zero` | StrictAntiOn (c ↦ Rc c 0) on [10, ∞) | donor :2319–2321 |
| `Rc_antitone_gamma` | γ < γ' ⇒ Rc c γ' < Rc c γ (c ≥ 10, γ ≥ 0) | A(i) |
| `Rc_lt_epsStar` | c > 10, γ ≥ 0 ⇒ Rc c γ < ε* | donor :2334–2335 (re-proved) |
| `ceiling` | ε* ≤ ε ⇒ FrontierSet ε = ∅ | Theorem B (ceiling direction) |
| `crossing_unique` | two crossings c₁, c₂ > 10 of gammaOf(·, 9/10) = gmax(ε, ·) coincide | A(iii) uniqueness |
| `frontier_of_crossing` | if cₓ > 10 is a crossing then sSup (FrontierSet ε) = gammaOf cₓ (9/10) | A(iii) frontier formula |
| `frontier_nonempty_iff` | for ε > 0: FrontierSet ε ≠ ∅ ⇔ ε < ε* | A(iv) phase transition |

Here gmax(ε, c) := (ln 4/ε − lnΛ(c, 0))/ln 4 and `lt_Rc_iff_gmax`: ε < Rc c γ ⇔ γ < gmax(ε, c).
The phase-transition proof is constructive: for ε < ε* it exhibits c = 10 + Δ with
Δ = (ln 4/ε − 5 ln 10)/(2L), L = ln(10/3), using the linear upper bound
lnΛ(c, 0) ≤ 5 ln 10 + (c − 10)·L (`lnΛ_upper`), so no donor `tendsto` is needed.

**Not formalized (recorded honestly):** the *existence* of the crossing point cₓ(ε) for
ε ∈ (0, ε*) — a one-line intermediate-value argument (at c = 10, gammaOf = 0 < gmax; as
c → ∞, gammaOf → ∞ and gmax → −∞; both continuous) — enters `frontier_of_crossing` as the
parameter `e : IsCrossing ε cₓ`; continuity and strict decrease of Γ on (0, ε*) and
Γ(ε) → 0 as ε → ε*⁻ (A(iv) second half); Theorem C (adaptive schedules, [HYPOTHESIS]). This
matches R8's re-scope (`novelty/VERDICTS.md` row 32): *state Γ(ε) parametrically with the
crossing point as a parameter, cite 0.1204 only as the v1 anchor*.

## 3 Run log (Modal app `crossmath-pilot-32`, runner `pilots/32/run_pilot.sh`)

| run | log | result | fixes applied after |
|---|---|---|---|
| 1 (R7') | `logs/run1.log` | FAIL, 22 errors | `HasDerivAt` algebra (`HasDerivAt.sub_const` takes `c` first; `Real.hasDerivAt_log` gives `c⁻¹` not `1/c`; `hasDerivAt_id'` explicit point; finish with `HasDerivAt.congr_deriv`); `Real.log_le_log` positivity argument; `ContinuousOn` by `intro` (no `continuousOn_iff_continuousWithinAt`); `StrictAntiOn` binder order `a ha b hb`; `lnΛ_mono (le_refl 10)` at the base point; affine-in-γ facts fed as explicit equations instead of `rw [lnΛ_affine]` (rewrites `lnΛ c 0` inside its own output); `lt_Rc_iff_gmax` rewritten as an `rw` chain; `div_lt_iff₀` (not `lt_div_iff₀`) for `θ < 9/10`; `csSup_le` needs nonemptiness first; `not_le.mp`; unicode `c*` typo → `cₓ`; `theta_of_recover` via `simp only [theta_of, gammaOf_eq]` + `field_simp` with the two log nonvanishing facts in context |
| 2 | `logs/run2.log` | FAIL, 2 errors | `hy0.le` where `lt_Rc_iff_gmax` needs `0 ≤ y` (two sites) |
| 3 | `logs/run3-green.log` | **OK**, 0 errors, 0 sorry-warnings; 9/9 printed theorems standard axioms | — |

## 4 Novelty and must-cites

Per `novelty/VERDICTS.md` §5.2(a): the frontier **function** with unique crossing and phase
transition is NEW-CLAIM-SUPPORTED (N = 3); constants are **superseded at birth** by
Majdoddin, arXiv:2610.17420 (D ≤ N^0.172, with a coordinatewise dichotomy and his own Lean
formalization `github.com/Majdoddin/formal-math`) and arXiv:2610.20297. Must-cite both; the
v1 anchor ε* = ln 4/(5 ln 10) ≈ 0.1204 is the donor paper's range, not a record.
