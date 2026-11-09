# The ξ′-Tuned Quartic Window Does Not Improve the ζ Zero-Proportion Constant: A Certified Comparison

*cross-math-fronttier research article 21 · 2026-11-09 · dossier
`research/candidates/21-quartic-window-zeta-thmD.md` · milestone note
`research/pilots/21-milestoneC.md`*

**Status: CERTIFIED NUMERICALLY, not kernel-verified.** The inequality below is established
by exact rational arithmetic plus rational interval enclosures of √2, sin and cos with
explicit Taylor remainders (a stdlib-only Python script, reproducible from the milestone
note §6). It is a negative result. The in-Lean proof path is specified but not executed.

---

## Abstract

zeta23 obtains its zero-proportion constant for ζ from the scale-free window functional
c(λ, v) = λ(∫v)²/(∫v² + λ²J(v)), J(v) = ∬_{[−1/2,1/2]²}|s − s'| v(s)v(s') ds ds', evaluated at
the cosine window v⋆(s) = cos(√2 s) (λ = 1), giving c⋆(1) ≈ 0.7532961 and the Theorem-D
constant H_D(1) = 2 − 1/c⋆(1) ≈ 0.6725007. For zeros of ξ′ the same corpus uses a different,
quartic window. We ask whether that quartic window, transplanted to ζ, improves Theorem D.
It does not: with exact rational moments, c(1, v_quartic) = 593803133/788678420 ≈ 0.7529091,
and

  c⋆(1) − c(1, v_quartic) ≥ 3.870·10⁻⁴   (certified),

so the transplant would *lower* the constant to H_D ≈ 0.6718184. A grid over the quartic
family, plus the free-frequency cosine family, points the same way.

## 1. Setting

On the unit window, zeta23's quartic (`Zeta23/XiPrime/Defs.lean`) is
v_quartic(s) = 1 − (7/25)s² − (102/25)s⁴ (that is, 1 − (7/100)(2s)² − (51/200)(2s)⁴). With
I_j = ∫_{−1/2}^{1/2} s^{2j} ds = 1/(4^j(2j+1)) and the kernel identity
∫|s − t| t^{2l} dt = α_l s^{2l+2} + β_l, α_l = 2/((2l+1)(2l+2)), β_l = 2^{−(2l+1)}/(2l+2), every
moment M(k, l) = ∬|s − s'| s^{2k}s'^{2l} = α_l I_{k+l+1} + β_l I_k is an explicit rational.

## 2. Result

**Proposition.** For v = v_quartic:

| quantity | exact value | decimal |
|---|---|---|
| ∫v | 2777/3000 | 0.92566667 |
| ∫v² | 518783/600000 | 0.86463833 |
| J(v) | 37896811/138600000 | 0.27342576 |
| c(1, v) | 593803133/788678420 | 0.75290907 |

and c⋆(1) = √2 sin ϑ/(cos ϑ + ϑ sin ϑ), ϑ = 1/√2, lies in an interval of width 1.5·10⁻⁵⁰
around 0.75329606785607072794. Hence c⋆(1) − c(1, v_quartic) ∈ [3.870013·10⁻⁴, 3.870014·10⁻⁴]
and H_D(v_quartic) = 0.671818358… < H_D(1) = 0.672500703….

**Certificate.** All moments are exact rationals. √2 is enclosed by integer square roots
(lo² ≤ 2 ≤ hi² checked); sin and cos by exact rational Taylor sums of order N = 20 widened by
the Lagrange remainder x^{2N+1}/(2N+1)!; the denominator cos ϑ + ϑ sin ϑ is bounded below by
3/4 as in zeta23's `cStar_denom_ge` (`Functional.lean:105`); composition is monotone on [0,1].
Anchors M(0,0) = 1/3, M(1,0) = 1/30, M(1,1), M(2,0), M(2,1), M(2,2) are asserted in the script.
(A hand computation in the dossier's preliminary note had α₂ = 1/30 instead of 1/15; the
erratum is recorded there.)

**Family evidence (not certified).** A grid over the full quartic family
1 + t₁s² + t₂s⁴ peaks at the pure quadratic (t₁ ≈ 0.24138, t₂ = 0), 4.0·10⁻⁷ below c⋆(1); the
free-frequency cosine family cos(ωs) peaks at ω = √2, where it attains c⋆ (zeta23
`cFun_vStar`, `Functional.lean:432`).

## 3. Interpretation

This is consistent with, and quantifies, the literature's view that v⋆ is optimal in this
window class (Carneiro–Chandee–Littmann–Milinovich, CCLM17, Cor. 14, as cited by Alpöge–Furman): improving Theorem D by changing the window would require pair-correlation
information beyond Fourier support 1 (Alpöge–Furman §1.4). The ξ′ quartic was tuned for a
different kernel, and does not transfer.

## 4. What remains open

- **(A1) Formal optimality.** cFun(1, v) ≤ c⋆(1) for every admissible v is not in zeta23
  (only attainment is). A Lean proof would make this article's comparison a corollary.
- **(A2) Class identification.** Alpöge–Furman bound "the broader class of all bandwidth-one
  certificates" by 0.6818287 without asserting that its supremum equals 2 − 1/c₁*; whether
  every bandwidth-one certificate is dominated by a window (certificate ⇒ window) is open, and
  is the dossier's surviving discovery-grade question.
- **Kernel verification of the Proposition.** The proof path (rational moments by `norm_num`;
  sin/cos enclosures via `Real.sin_eq_tsum`/`Real.cos_eq_tsum`,
  `Mathlib/Analysis/SpecialFunctions/Trigonometric/Series.lean:109,112`, with explicit tails)
  is specified in the milestone note §5 and not executed.

## References

- anthropics_formal-math `zeta23/Zeta23/ThmD/Functional.lean` (:35, :40–43, :105, :321, :432),
  `Zeta23/XiPrime/Defs.lean`.
- L. Alpöge, A. Furman, arXiv:2608.13637 (§1.4). E. Carneiro, V. Chandee, F. Littmann,
  M. Milinovich, *Hilbert spaces and the pair correlation of zeros of the Riemann
  zeta-function* (CCLM17), Cor. 14.
