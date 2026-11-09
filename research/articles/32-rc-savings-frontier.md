# The Exact Savings Frontier of the Corollary-31 Certificate Class for Thin Matrix Products

*cross-math-fronttier research article 32 · 2026-11-09 · dossier
`research/candidates/32-rc-savings-frontier.md` · Lean pilot `research/pilots/32/M1.lean` ·
blueprint `research/pilots/32-blueprint.md`*

**Status: PROVED (frontier formula, uniqueness, phase transition, ceiling), kernel-verified**
(mathlib `ff2494ea`, Lean `v4.36.0-rc2`; `[propext, Classical.choice, Quot.sound]`; no `sorry`,
no `native_decide`, no external CAS). The existence of the crossing point (an
intermediate-value argument) enters as a parameter; see §5.

---

## Abstract

The anthropics `3sum-apsp` corpus formalizes a data-structure theorem (Corollary 31): for a
width parameter c > 10 and a density parameter θ ∈ (0, 0.9), products of thin matrices with
D ≤ N^ε admit polylog-savings data structures with savings exponent γ = gammaOf(c, θ),
valid whenever ε < R_c(γ) = ln 4 / ln Λ(c, γ). The paper records the threshold
ε* = ln 4/(5 ln 10) ≈ 0.1204 and the qualitative facts that R_c decreases in c and stays
below ε*. We determine the **entire achievable region** of this certificate class. With
Γ(ε) := sup{γ > 0 achievable at range ε}, we prove: (i) R_c is strictly decreasing in γ;
(ii) ln Λ(10, 0) = 5 ln 10 exactly, so R_10(0) = ε*; (iii) the frontier is given by a unique
crossing point c*(ε) of two explicit monotone curves, Γ(ε) = gammaOf(c*(ε), 0.9), and the
supremum is not attained; (iv) a sharp phase transition: the achievable set is nonempty iff
ε < ε*. Everything is verified in Lean 4 against current mathlib, independently of the
corpus's own proofs.

## 1. Introduction

Corollary 31 of the 3sum-apsp paper (`PaperStatements.lean:4014`) is stated as a family of
certificates indexed by (c, θ). Downstream uses pick one certificate. The natural question
— *what is the best savings exponent this family can certify at a given range D ≤ N^ε, and
for which ε does it certify anything at all?* — is answered nowhere in the corpus or the
follow-up literature, which states frozen constants and dichotomies
(`research/novelty/VERDICTS.md` §5.2(a)). We answer it exactly for the certificate class as
stated.

## 2. Definitions (transcribed from `3sum-apsp/PaperStatements.lean`)

  H(x) = −x ln x − (1−x) ln(1−x)                          (:2006)
  ln Λ(c, γ) = c ln 10 − (c/2)·H(1/c) − (c − 1) ln 3 + γ ln 4     (:2011)
  R_c(γ) = ln 4 / ln Λ(c, γ)                               (:2015)
  ε* = ln 4 / (5 ln 10)                                    (:2018)
  ρ_c = 9/(c − 1),  gammaOf(c, θ) = θ·ln(1/ρ_c) / ln 4           (:2021, :2024)

**Certificate class.** For ε > 0,

  Ach(ε) = { γ > 0 : ∃ c > 10, ∃ θ ∈ (0, 9/10), γ ≤ gammaOf(c, θ) and ε < R_c(gammaOf(c, θ)) },

and Γ(ε) = sup Ach(ε). Put gmax(ε, c) = (ln 4/ε − ln Λ(c, 0)) / ln 4 and call c > 10 a
*crossing* for ε if gammaOf(c, 9/10) = gmax(ε, c).

## 3. Main results

**Theorem 1 (monotonicity in γ).** For c ≥ 10, ln Λ(c, ·) is affine with slope ln 4 > 0 and
positive on γ ≥ 0; hence γ < γ' implies R_c(γ') < R_c(γ).

**Theorem 2 (exact evaluation).** ln Λ(10, 0) = 5 ln 10, hence R_10(0) = ε*.

**Theorem 3 (monotonicity in c; donor re-proved).** c ↦ ln Λ(c, 0) is strictly increasing on
[10, ∞); consequently c ↦ R_c(0) is strictly decreasing there, and R_c(γ) < ε* for all
c > 10, γ ≥ 0.

**Theorem 4 (key equivalence).** For ε > 0, c ≥ 10, γ ≥ 0: ε < R_c(γ) ⇔ γ < gmax(ε, c).

**Theorem 5 (unique crossing and frontier formula).** For ε > 0 there is at most one
crossing c > 10. If c* is a crossing, then Ach(ε) = (0, gammaOf(c*, 9/10)) and

  Γ(ε) = gammaOf(c*, 9/10),

with the supremum not attained.

**Theorem 6 (phase transition and ceiling).** For ε > 0: Ach(ε) ≠ ∅ ⇔ ε < ε*. For ε ≥ ε*,
Ach(ε) = ∅.

## 4. Proofs

**Theorem 2.** H(1/10) = (1/10) ln 10 − (9/10) ln(9/10) = ln 10 − (9/5) ln 3, using
ln(9/10) = 2 ln 3 − ln 10. Then ln Λ(10,0) = 10 ln 10 − 5 H(1/10) − 9 ln 3 = 5 ln 10. ∎

**Theorem 3.** For c > 1 one checks (c/2)·H(1/c) = −F(c)/2 with
F(c) = (c−1) ln(c−1) − c ln c, so ln Λ(c, 0) = c·L + ln 3 + F(c)/2 with L = ln(10/3).
F'(ξ) = ln((ξ−1)/ξ) ≥ −ln(10/9) for ξ ≥ 10. By the mean value theorem, for 10 ≤ c₁ < c₂,
ln Λ(c₂,0) − ln Λ(c₁,0) ≥ (c₂ − c₁)(L − ½ ln(10/9)) > 0, because
2L = ln(100/9) > ln(10/9) — a purely rational comparison, no bounds on e or π needed.
The statements about R_c follow since ln 4 > 0 and ln Λ > 0 on the domain; and
R_c(γ) ≤ R_c(0) < R_10(0) = ε* for c > 10. ∎

**Theorem 4.** Clearing the positive denominators ln Λ(c, γ) = ln Λ(c,0) + γ ln 4, ε and
ln 4, both sides are equivalent to (γ ln 4 + ln Λ(c, 0))·ε < ln 4. ∎

**Theorem 5.** gammaOf(·, 9/10) is strictly increasing on (10, ∞) (ln((c−1)/9) increases)
and gmax(ε, ·) strictly decreasing (Theorem 3), so two crossings coincide. Given a
crossing c*: if γ ∈ Ach(ε) via (c, θ), then γ ≤ g := gammaOf(c, θ) < gammaOf(c, 9/10) and,
by Theorem 4, g < gmax(ε, c). If c ≤ c* then gammaOf(c, 9/10) ≤ gammaOf(c*, 9/10); if c > c*
then gmax(ε, c) < gmax(ε, c*) = gammaOf(c*, 9/10). Either way γ < gammaOf(c*, 9/10).
Conversely every 0 < y < gammaOf(c*, 9/10) is achieved at c = c* with
θ = (9/10)·y / gammaOf(c*, 9/10) ∈ (0, 9/10), because gammaOf(c*, θ) = y < gmax(ε, c*). So
Ach(ε) is the open interval and Γ(ε) its right end; it is not attained. ∎

**Theorem 6.** (⇐, constructive) Let ε < ε*, so ln 4/ε > 5 ln 10. Since F is decreasing on
[10, ∞), ln Λ(c, 0) ≤ 5 ln 10 + (c − 10)L. Choose c = 10 + Δ with
Δ = (ln 4/ε − 5 ln 10)/(2L); then ln Λ(c, 0) < ln 4/ε, so gmax(ε, c) > 0, and any
0 < y < min(gmax(ε,c), gammaOf(c, 9/10)) is achieved (as in Theorem 5). (⇒) If γ ∈ Ach(ε)
via (c, θ), then ε < R_c(gammaOf(c, θ)) < ε* by Theorem 3. The ceiling is the contrapositive. ∎

## 5. Formal verification

| statement | Lean declaration (`research/pilots/32/M1.lean`) |
|---|---|
| Theorem 1 | `lnΛ_affine`, `lnΛ_pos_gamma`, `Rc_antitone_gamma` |
| Theorem 2 | `lnΛ_10_0`, `Rc_10_0` |
| Theorem 3 | `lnΛ_decompose`, `hasDerivAt_Ffun`, `Ffun_mvt`, `kappa_pos`, `lnΛ_mono`, `lnΛ_upper`, `Rc_strictAntiOn_zero`, `Rc_lt_epsStar` |
| Theorem 4 | `lt_Rc_iff_gmax` |
| Theorem 5 | `crossing_unique`, `membership_of_lt`, `frontier_upper`, `frontier_of_crossing` |
| Theorem 6 | `frontier_nonempty_iff`, `ceiling` |

Axioms of every printed theorem: `[propext, Classical.choice, Quot.sound]`
(`research/pilots/32/logs/run3-green.log`; final-sweep `logs/axcheck-final.log`). Three
Modal runs (22 → 2 → 0 errors); run log in the blueprint.

**What is not formalized.** The existence of the crossing c*(ε) for ε ∈ (0, ε*) is the
intermediate value theorem applied to the continuous, strictly increasing function
c ↦ gammaOf(c, 9/10) − gmax(ε, c) on (10, ∞), which is negative as c → 10⁺ (gammaOf → 0,
gmax(ε, 10) > 0 because ε < ε*) and tends to +∞. In Lean the crossing is a parameter of
`frontier_of_crossing`. Continuity and strict decrease of Γ and Γ(ε) → 0 as ε → ε*⁻
follow from the implicit-function picture and are likewise paper-level. The donor's
Corollary 31 itself (the data-structure statement) is not consumed: the pilot is the order
and logarithm content of the frontier.

## 6. Relation to prior work

- **Donor:** 3sum-apsp `Sec4_Rc_strictAntiOn` (:2319), `Sec4_Rc_zero_tendsto` (:2325),
  `Sec4_Rc_lt_epsStar` (:2334), `Corollary_31` (:4014). We re-prove the first and third
  independently and replace the second by the exact Theorem 2.
- **Superseding constants.** R. Majdoddin, arXiv:2610.17420 (with its own Lean development,
  `github.com/Majdoddin/formal-math`), extends the thin-product range to D ≤ N^0.172 with a
  coordinatewise dichotomy; arXiv:2610.20297 improves exponents further. Our ε* ≈ 0.1204 is
  the donor paper's anchor, not a record. Neither work states the frontier as a function of
  ε for a certificate class.

## 7. Limitations and open problems

- The frontier is that of *this* certificate class. Theorem C of the dossier — the ceiling of
  adaptive per-level schedules (free (m, L, t) per level, `Theorem_30` shape) — is open and
  would be the research-grade extension.
- Transporting the frontier to Majdoddin's improved class (its own (c, θ)-type
  parameterization) is the natural next instance of the same argument.

## References

- anthropics_formal-math, `3sum-apsp/PaperStatements.lean` (lines cited above).
- R. Majdoddin, arXiv:2610.17420 (2026) and `github.com/Majdoddin/formal-math`; arXiv:2610.20297.
