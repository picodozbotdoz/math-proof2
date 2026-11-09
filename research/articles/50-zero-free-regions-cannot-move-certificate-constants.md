# Zero-Free Regions Cannot Improve Window-Certificate Zero-Proportion Constants; Formal Strip Confinement from Quasi-RH

*cross-math-fronttier research article 50 · 2026-11-09 · dossier
`research/candidates/50-quasi-rh-truncated-window-constants.md` · Lean pilot
`research/pilots/50/` · blueprint `research/pilots/50-blueprint.md`*

**Status:** Part I (structural negative result) is a source-verified mathematical argument,
not a Lean theorem. Part II is **PROVED, binder-conditional, kernel-verified** (mathlib
`ff2494ea`, Lean `v4.36.0-rc2`; `[propext, Classical.choice, Quot.sound]`; no `sorry`, no
`native_decide`).

---

## Abstract

openai-math proves a quasi-Riemann hypothesis: ζ(s) ≠ 0 and L(s, χ) ≠ 0 for Re s > 7/8
(primitive χ). zeta23 proves Alpöge–Furman zero proportions whose constants (2 − 1/c₁* ≈
0.6725 on-line, (3 − 1/c₁*)/2 ≈ 0.8363 distinct, in the Montgomery–Taylor window) come from
a variational problem. A tempting bridge — "truncate the zero support at 7/8 and
re-optimize the constant" — is **impossible**: the variational variable of the certificate
functional is the scale-free *height* offset inside the detection window, and the engine's
zero classification is binary (on the line / off it), so no zero-free region enters the
functional or any engine input. What the two corpora do combine to give is the
**confinement of all nontrivial zeros of ζ and of primitive Dirichlet L-functions to the
strip 1/8 ≤ Re ρ ≤ 7/8**, which we formalize with the quasi-RH statement as an explicit
hypothesis, discharging the reflection step from mathlib's product-form functional
equation. We also record a gap in mathlib: the product-form Dirichlet functional equation
`DirichletCharacter.LFunction_one_sub` is missing, although its completed form exists.

## Part I — the structural negative result

**Setting.** zeta23's ThmD functional (`Zeta23/ThmD/Functional.lean:40–43`) is

  c(λ, v) = λ·(∫v)² / (∫v² + λ²∬|s − s'| v(s)v(s') ds ds'),  s, s' ∈ [−1/2, 1/2],

maximized by v⋆(s) = cos(√2 λ s) with c⋆(λ) = √2 sin ϑ/(cos ϑ + ϑ sin ϑ), ϑ = λ/√2 (:32, :35);
the constants are H_D(λ) = 2 − 1/c⋆(λ) and its distinct analogue (`Functional.lean:53`,
`ChallengeDeps.lean:107`).

**Proposition 1.** No statement of the form "c₁* improves to c₁*(σ₀) under a zero-free
half-plane Re s > σ₀" exists within the engine.

*Argument (source-verified).* (i) The variable s is the height offset inside the window
(T, 2T]: the concrete window is φ_D(u) = √(v⋆(u/L))·taper(u), u ∈ [−L/2, L/2]
(`ThmD/Window.lean`, above `phiD_even` :45). (ii) The engine's `ZeroConfig`
(`Defs.lean:120`) and `PaperInputs` (`Zeta23/Hypotheses.lean:147`) expose carrier,
multiplicity and window data and the analytic card (EF, RvM, Chebyshev, Γ-facts); the only
location predicate is `onLine := {ρ | Re ρ = 1/2}` (`Defs.lean:140`). The on-line count is
bounded below through the rank–trace certificate and the total count comes from
Riemann–von Mangoldt; neither changes when a region containing no zeros is excised.
(iii) Hence the constants are functions of the window shape λ alone; the real
improvement axes are internal (λ-families `thmA_lam`/`thmB_lam`/`thmC_lam`,
`Zeta23/Final.lean:79,99,119`, and the quartic-window variant for ξ′; see article 21). ∎

The value of Part I is negative but useful: it kills a natural, wrong bridge before any
formal effort is spent on it, and it pins down *why* — horizontal zero information is
invisible to height-window certificates.

## Part II — formal strip confinement

**Theorem 2 (ζ).** Assume hQRH: ζ(s) ≠ 0 for Re s > 7/8. Then every zero ρ of ζ with
0 < Re ρ < 1 satisfies 1/8 ≤ Re ρ ≤ 7/8. Equivalent forms: for z ∈ `riemannZetaZeros` in the
open strip; and riemannZetaZeros ∩ {0 < Re < 1} ⊆ {1/8 ≤ Re ≤ 7/8}.

**Theorem 3 (primitive Dirichlet L).** Assume hQRHχ (quasi-RH for primitive χ and for χ⁻¹)
and hFEχ (the product-form functional equation for L(s, χ)). Then the nontrivial zeros of
L(s, χ) lie in 1/8 ≤ Re ρ ≤ 7/8.

*Proof.* The upper bound is hQRH. For the lower bound, if Re ρ < 1/8 then Re(1 − ρ) > 7/8.
The product-form functional equation ζ(1 − s) = 2(2π)^{−s} cos(πs/2) Γ(s) ζ(s)
(mathlib `riemannZeta_one_sub`, `RiemannZeta.lean:178`) at s = 1 − ρ — valid since ρ ≠ 1 and
ρ is not a negative integer (Re ρ > 0) — shows ζ(1 − ρ) = 0 would follow from ζ(ρ) = 0 unless
a Γ- or cosine factor vanishes, which it does not in the strip; contradiction with hQRH.
The Dirichlet case is identical with hFEχ and hQRHχ for χ⁻¹. ∎

Notably the completed-ξ route (pole bookkeeping, conjugation symmetry) is not needed; the
product form discharges the reflection inline, and no hypothesis on trivial zeros is used.

## Formal verification

| statement | Lean (`CrossMath.Pilot50`) |
|---|---|
| Theorem 2 | `strip_confinement`, `strip_confinement_mem`, `strip_confinement_set` (`research/pilots/50/M1.lean`, 94 LoC) |
| Theorem 3 | `Dirichlet.strip_confinement_dirichlet` (`research/pilots/50/Dirichlet.lean`, 73 LoC) |
| axioms | `[propext, Classical.choice, Quot.sound]` (`research/pilots/50/logs/axcheck-final.log`, `combined-run14-green.log`) |

The binder `hQRH` quotes openai-math's challenge-form statement verbatim
(`riemannZeta_ne_zero_of_seven_eighths_lt_re`); that statement elaborates standalone on
v4.36 (probe `ProbeC1`), but its proof's library closure is 2,924 files
(`research/feasibility/port-probe.md` §7.2), so discharging it is the remaining work.

**mathlib gap (donation opportunity).** mathlib has
`DirichletCharacter.IsPrimitive.completedLFunction_one_sub`
(`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`) but no product-form
`DirichletCharacter.LFunction_one_sub` analogous to `riemannZeta_one_sub`. With it, hFEχ
would be discharged inline and Theorem 3 would be single-binder. Two v4.36 elaboration
facts were found on the way: instance binders nested inside a hypothesis's ∀-type are not
used for synthesis while elaborating that type (workaround: explicit `(inst : NeZero q)`),
and `DirichletCharacter.LFunction` requires `[NeZero N]` at the binder level.

## Relation to prior work

- The strip corollary is printed in the openai preprint itself (*The Quasi-Riemann
  Hypothesis*, 2026-09-30, proof of Cor. 1.2: "the nontrivial zeros of every primitive
  Dirichlet L-function lie in 1/8 ≤ ℜs ≤ 7/8"). Our contribution there is formal, not
  mathematical.
- Part I is, to our knowledge, not stated anywhere; it is implicit in the structure of
  Alpöge–Furman (arXiv:2608.13637) and of Montgomery–Taylor-type window arguments.

## Open directions

- Discharge hQRH/hQRHχ by porting the openai statement layer (blocked on library closure).
- Extend zeta23's `xiPrime_over_xi_re_pos` band from Re s ≥ 1 towards 7/8 ([HYPOTHESIS] S3 of
  the dossier; the obstruction is named there).
- A composite location + proportion theorem in zeta23's vocabulary (S2), built on article
  42's `ZeroMult`/`EpsLower` layer.

## References

- openai-math `lean/ComparatorChallenges/DirichletSevenEighths.lean:8`,
  `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`; preprint *The Quasi-Riemann Hypothesis*.
- anthropics_formal-math `zeta23/Zeta23/ThmD/{Functional,Window}.lean`, `Defs.lean:120,140`,
  `Hypotheses.lean:147`, `Final.lean:79–119`, `ChallengeDeps.lean:107`.
- mathlib `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:178`,
  `DirichletContinuation.lean:291`. L. Alpöge, A. Furman, arXiv:2608.13637.
