# The Prime Number Theorem in ψ-Form, Assembled from Mathlib's Own Wiener–Ikehara Theorem

*cross-math-fronttier research article 22 · 2026-11-09 · dossier
`research/candidates/22-quasi-rh-pnt-effective.md` · Lean pilot `research/pilots/22/` ·
blueprint `research/pilots/22-blueprint.md`*

**Status: PROVED, unconditional, kernel-verified** (mathlib `ff2494ea`, Lean `v4.36.0-rc2`;
`[propext, Classical.choice, Quot.sound]`; no `sorry`, no `native_decide`). **This is a
formalization result, not new mathematics**: ψ(x) ~ x is the classical Prime Number Theorem.
The article records how it falls out of pieces already in mathlib, which had not been
connected.

---

## Abstract

mathlib (checkout `ff2494ea`) contains a Wiener–Ikehara Tauberian theorem
(`Mathlib/NumberTheory/LSeries/WienerIkehara.lean`), the identity
L(Λ, s) = −ζ'(s)/ζ(s) on Re s > 1, non-vanishing of ζ on Re s ≥ 1, and Chebyshev's bounds —
but no Prime Number Theorem, and the Wiener–Ikehara theorem has no consumer. We supply the
three missing links: (M1) existence of the constant term of the Laurent expansion of ζ at
s = 1; (M2) a continuous extension of −ζ'/ζ − 1/(s − 1) to the closed half-plane Re s ≥ 1;
(M3) the Chebyshev-form bound Σ_{n<N} Λ(n) ≤ (log 4 + 4)·N. Feeding them to
`WienerIkehara.tendsto_sum_range_div` gives (M4) ψ(x)/x → 1. Total new code: 358 lines, 51
minutes wall time over 12 Modal runs.

## 1. Statements

Let Λ be the von Mangoldt function and ψ(x) = Σ_{n ≤ x} Λ(n) (mathlib `Chebyshev.psi`).

**M1.** ∃ c ∈ ℂ, ζ(s) − 1/(s − 1) → c as s → 1, s ≠ 1.

**M2.** ∃ G : ℂ → ℂ continuous on {Re s ≥ 1} with G(s) = −ζ'(s)/ζ(s) − 1/(s − 1) for Re s > 1.

**M3.** ∃ C, ∀ N ∈ ℕ, Σ_{i<N} Λ(i) ≤ C·N (with C = log 4 + 4).

**M4 (PNT, ψ-form).** ψ(x)/x → 1 as x → ∞.

## 2. Proofs (outline, as formalized)

**M1.** F(s) = (s − 1)ζ(s) is differentiable on a punctured neighbourhood of 1 and tends to
the residue 1 (mathlib `riemannZeta_residue_one`, `RiemannZeta.lean:242`), so it extends analytically
across s = 1 by the removable-singularity theorem; the constant term is F'(1).

**M2.** Let h be the analytic extension of F with h(1) = 1. On Re s ≥ 1, s ≠ 1, ζ(s) ≠ 0
(mathlib `riemannZeta_ne_zero_of_one_le_re`), so h has no zeros on the closed half-plane and
−ζ'/ζ − 1/(s − 1) = −h'(s)/h(s), which is continuous on Re s ≥ 1, including s = 1.

**M3.** ψ(N) ≤ (log 4 + 4)·N from `Chebyshev.psi_le_const_mul_self` (`Chebyshev.lean:485`),
transported to range-sums by `psi_eq_sum_Icc` (`Chebyshev.lean:93`).

**M4.** `WienerIkehara.tendsto_sum_range_div` (`WienerIkehara.lean:693`) applies to a
nonnegative arithmetic function f whose L-series equals A/(s − 1) + G(s) on Re s > 1 with G
continuous on Re s ≥ 1 and whose partial sums are O(N); with f = Λ, A = 1,
`LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (`Dirichlet.lean:439`), M2 and M3 it gives
(1/N)Σ_{n<N} Λ(n) → 1, and the passage to real x is a floor argument. ∎

## 3. Formal verification

| statement | Lean (`CrossMath.Pilot22`) |
|---|---|
| M1 | `exists_tendsto_riemannZeta_sub_inv` (`research/pilots/22/M1.lean`, 68 LoC; restated in Tier1) |
| M2 | `exists_logDerivExtension` |
| M3 | `exists_range_sum_vonMangoldt_le` |
| M4 | `tendsto_psi_div_atTop` (`research/pilots/22/Tier1.lean`) |
| axioms | all `[propext, Classical.choice, Quot.sound]` (`research/pilots/22/logs/axcheck-final.log`) |

Run trail: `research/pilots/22/run1..12.log`; the worst milestone (M2) took six fix cycles.
The Tier-2 statement (|ψ(x) − x| ≤ C·x^{7/8+ε}, conditional on openai's quasi-RH band and a
Perron formula) elaborates as a statement only.

## 4. Relation to prior work

The Prime Number Theorem is due to Hadamard and de la Vallée Poussin (1896); the
Wiener–Ikehara route is classical (Ikehara 1931). Formal proofs exist in other systems
(Isabelle: Eberl–Paulson; HOL Light: Harrison) and in Lean projects outside mathlib (the
PrimeNumberTheoremAnd project; the IEANTN effort); mathlib PRs on Mertens' theorems and weak
PNT (#41394, #44062, #43238) were open at survey time. Our contribution is narrow: the first
consumer of mathlib's own Wiener–Ikehara, at 358 lines, establishing that mathlib at this
revision already contains every hard ingredient of PNT. We claim no priority over the
upstream efforts, which were converging when this pilot ran; the dossier was deliberately
stopped at M4 for that reason.

## 5. Open directions (resume kit, recorded in the dossier)

- M5 θ(x)/x → 1 from M4 and `isBigO_psi_sub_theta_sqrt` (`Chebyshev.lean:639`).
- M6 π(x)·log x / x → 1 via `primeCounting_eq_theta_div_log_add_integral` (:668) and
  `integral_theta_div_log_sq_isBigO` (:791).
- Tier 2: effective PNT from openai-math's 7/8 quasi-RH band.

## References

- mathlib `Mathlib/NumberTheory/LSeries/{WienerIkehara,Dirichlet,Nonvanishing,RiemannZeta}.lean`,
  `Mathlib/NumberTheory/Chebyshev.lean`.
- S. Ikehara, J. Math. Phys. 10 (1931); N. Wiener, Ann. of Math. 33 (1932).

---

## Cycle-2 closure note (2026-11-14, knowledge-level): dossier 22 T2b CLOSED BY UPSTREAM

Dossier 22's Tier-2 extension target T2b — the classical-strength effective PNT
|ψ(x) − x| ≤ C·x·exp(−c·√(log x)) from openai's classical zero-free region, whose
hardest step (the Borel–Carathéodory log-derivative bootstrap "no corpus has in Lean")
made it the dossier's named M-effort frontier — is now **proved by a third party**.
A1's Cycle-2 survey find (`research/survey/axiommath-pntplus.md` §1): the upstream
`AlexKontorovich/PrimeNumberTheoremAnd` repo @ `938912bb` proves, at upstream
`StrongPNT.lean:2900–2905`,

    theorem StrongPNT : ∃ c > 0, (ψ - id) =O[atTop] fun x ↦ x * Real.exp (-c * (Real.log x) ^ ((1:ℝ)/2))

from `GenStrengthPNT LogDerivZetaBoundedAndHolo12` (the n₁ = 1 instance of a
Borel–Carathéodory / Blaschke / Jensen chain: `ZerosBound :874`, `JBlaschkeDerivBound
:951`, `FinalBound :1029`, `GlobalBound :1400`, `LogDerivZetaFinalBound :1536`), with
the axiom check posted inline (`:2906–2908`): exactly `[propext, choice, Quot.sound]`.
The AxiomMath fork of that repo — the corpus this project surveyed — **amputated**
StrongPNT (commented placeholder at fork `StrongPNT.lean:1883–1885`), which is why the
main-run survey recorded the statement as an open terminal point. Neither the theorem
nor the claim is ours: this note records the closure (T2b = closed-by-upstream, cite
upstream not us), updates the survey's terminal-point record, and retires the T2b pilot
option. No new article is warranted — the statement was never our result.
