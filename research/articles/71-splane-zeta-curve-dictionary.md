# The s-Plane Zeta of a Curve over 𝔽_q: Formal Dictionary, Exact Window, Hasse–Weil Transport

*cross-math-fronttier research article 71 (Cycle 2) · FINAL · dossier
`research/candidates/71-function-field-splane-dictionary.md` · prework
`research/pilots/71-prework.md` · Lean `research/pilots/71/{P0,P1,P2}.lean` · bridge
`research/bridges/function-field.md` §4 (FF-EZ1)*

**Status: PROVED, FINAL.** The three landing theorems W1, W2 and HW, together with the
dictionary layer, are kernel-verified. P2.lean has 279 lines and 11 theorems, each with
axioms exactly `[propext, Classical.choice, Quot.sound]`. They are conditional on a
hypothesis structure (`WeilData`) that transcribes the Weil conjectures as stated in
AxiomMath's `Weil` repository. The mathematics is classical (Weil 1948). The
contribution is the first formal s-plane statement of it, plus one statement correction
that formalization forced (§3, Remark).

---

## Abstract

Let C be a smooth, proper, geometrically irreducible curve over a finite field F with q
elements. Its zeta function Z_C(T) is the rational function
P₁(T)/((1 − T)(1 − qT)), where P₁(T) = ∏_{α∈A₁} (1 − αT) and A₁ is the multiset of
Frobenius eigenvalues on H¹. The Riemann hypothesis for C (Weil) says |α| = √q for every
α ∈ A₁. Formal libraries state these facts in the T-variable, as identities of power
series and polynomials. None of them states the s-plane function ζ_C(s) = Z_C(q^{−s}).
That is the object with the critical line Re s = 1/2, and the one that can be compared
with number-field zeta functions. We define ζ_C(s) in Lean via
q^{−s} := exp(−s log q) and prove, from the Weil-conjecture data:

- **(W1)** ζ_C(s) ≠ 0 whenever Re s > 1/2 and s is not a pole. This is a zero-free
  half-plane with the optimal constant 1/2.
- **(W2)** every zero of the numerator P₁(q^{−s}) has real part exactly 1/2.
- **(HW)** |#C(𝔽_{q^m}) − (q^m + 1)| ≤ |A₁| · q^{m/2} for every m ≥ 1. This is the
  Hasse–Weil bound, with |A₁| = 2g.

Formalizing W1 exposed a pitfall. The natural number-field-style hypothesis "s ≠ 1" is
not the right pole exclusion. The pole factor 1 − q·q^{−s} vanishes on the whole
vertical progression 1 + (2πi/log q)ℤ, and Lean's convention x/0 = 0 makes ζ_C vanish
there. The correct hypothesis is the factor exclusion itself. We prove that the excluded
set lies on the line Re s = 1.

## 1. Introduction

Number-field zero-free regions have recently been formalized in a strong form.
AxiomMath's DedekindZetaZeroFree proves ζ_K(s) ≠ 0 for Re s > 31/32 and every number
field K (Cureton–Thorner), and the openai-math corpus contains 7/8-type statements for ζ
and Dirichlet L-functions. The function-field analogue is sharper. By Weil's theorem the
zeros of a curve's zeta function lie exactly on Re s = 1/2, for every curve, every q and
every genus. Yet no formal corpus we surveyed (mathlib, tauceti, the six AxiomMath
repositories, openai-math) contains the s-plane function at all. The function-field side
stops at the T-variable. This article supplies the dictionary from T to s and proves the
three basic s-plane consequences. Dossiers 73 (Tate-type statements) and 74 build on it.

**Honesty.** All the mathematics is classical: Weil 1948, Hasse for genus 1, and
textbook accounts such as Rosen GTM 210 ch. 5 and Stichtenoth Thm 5.1.1. The novelty is
formalization-first (novelty check: `novelty/round-4.md` §1 and the Part-2 row 71).
Statements about uniform *proportions* of simple zeros per curve are deliberately
absent, because they are false. A maximal curve, for example the Hermitian curve
y^q + y = x^{q+1} over 𝔽_{q²}, has P₁(T) = (1 + qT)^{2g}: a single zero of multiplicity
2g (`novelty/round-4.md` §6.3).

## 2. Setting

Everything is in `research/pilots/71/P2.lean`. It imports only Mathlib, on mathlib
`ff2494ea` with Lean v4.36.0-rc2, and has no Weil or Stacks imports.

- **Curves.** `X : Over (Spec F)` with `[GeometricallyIrreducible X.hom]`,
  `[IsProper X.hom]` and `[SmoothOfRelativeDimension 1 X.hom]`. These are mathlib's
  scheme-theoretic notions.
- **Weil data.** `WeilData F X d` is a structure transcribing the existential content of
  `LeanEval.AlgebraicGeometry.WeilConjectures.weil_conjectures`
  (`axiommath/Weil/LeanEval/WeilConjectures.lean:185–194`). It has eigenvalue multisets
  A i ⊆ ℂ (i ≤ 2d), with fields:
  - `zero`: A 0 = {1};
  - `duality`: A(2d − i) = q^d / A i;
  - `galois`: Galois stability;
  - `purity`: every α ∈ A i is an algebraic integer with |α| = √(q^i). This is the
    Riemann hypothesis;
  - `pointCount`: for every finite extension E/F,
    #X(E) = Σ_{i≤2d} (−1)^i Σ_{α∈A i} α^{[E:F]}.

  A term of `WeilData` *is* the Weil conjectures for X. Every theorem below takes one as
  a hypothesis. AxiomMath's `Weil` proves the existence of such data, but importing it
  requires the StacksFrontier tree (about 63k modules). Probe G6a priced that import out
  (`feasibility/axiommath-donor-probes.md`).
- **s-plane variable.** `wOf q s := exp(−s · log q)`, i.e. q^{−s}. It is entire, with
  |q^{−s}| = q^{−Re s} (`norm_wOf`).
- **L-polynomial.** `lPoly A := ∏_{α∈A} (1 − αX)`.
- **Zeta.** `zetaC A q s := P_A(q^{−s}) / ((1 − q^{−s})(1 − q·q^{−s}))`.

## 3. Main results

Throughout, `W : WeilData F X 1` and q = #F > 1.

**Theorem W1 (`curve_zeta_ne_zero`).** If Re s > 1/2 and 1 − q·q^{−s} ≠ 0, then
ζ_C(s) := `zetaC (W.A 1) q s` ≠ 0.

**Theorem W2 (`curve_zero_re_eq_half`).** If P₁(q^{−s}) = 0, then Re s = 1/2.

**Theorem HW (`hasse_weil_point_count`).** For every m ≥ 1 and every field extension
E/F of degree m,
  ‖#X(E) − (q^m + 1)‖ ≤ |A₁| · (√q)^m.

**Core lemmas.**
- `re_eq_half_of_norm_mul` (Core 1): if |α| = √q and |α|·|q^{−s}| = 1, then Re s = 1/2.
- `re_eq_one_of_card_mul_wOf` (Core 2): if q·q^{−s} = 1, then Re s = 1.
- Dictionary layer (P1, carried verbatim):
  - `norm_wOf`, `norm_wOf_lt_one` (|q^{−s}| < 1 for Re s > 0);
  - `lPoly_eval` (evaluation of the product);
  - `multiset_norm_sum_le` (the triangle inequality over a multiset);
  - `a2_eq` (A₂ = {q}, from duality and A₀ = {1});
  - `multiset_sum_map_const` (Σ over a multiset of a constant = card · c; a small
    mathlib gap).

**Remark (the pole-exclusion correction).** The design draft stated W1 with the
hypothesis s ≠ 1, mirroring DedekindZetaZeroFree's `dedekindZeta_ne_zero` shape. That
statement is **false** in Lean. q·q^{−s} = 1 holds for every s ∈ 1 + (2πi/log q)ℤ,
because exp is 2πi-periodic. At those points the denominator vanishes and `zetaC`
evaluates to 0 (division by zero). These points have Re s = 1 > 1/2, so they lie inside
the window. In the classical s-plane picture they are the periodic family of poles of
ζ_C coming from 1/(1 − qT). The faithful function-field translation of "s ≠ 1" is the
hypothesis 1 − q·q^{−s} ≠ 0. Core 2 shows that this excludes only points of the line
Re s = 1. The other pole factor, 1 − q^{−s}, needs no hypothesis: it is nonzero for
Re s > 0. The error was caught by the proof attempt (p2-run1/2), not by elaboration.
The draft statement elaborated fine.

## 4. Proofs

**Core 1.** |q^{−s}| = exp(−σ log q) with σ = Re s. From √q · exp(−σ log q) = 1, squaring
gives q · exp(−2σ log q) = 1, i.e. exp(log q) = exp(2σ log q). Since log q > 0 and
Real.exp is injective, σ = 1/2. The Lean proof derives the two inequalities from strict
monotonicity of Real.exp.

**Core 2.** q · exp(−σ log q) = |q · q^{−s}| = 1 gives exp((1 − σ) log q) = 1, so
σ = 1. This uses the *real* exponential's kernel (`Real.exp_eq_one_iff`). The complex
statement fails, which is the point of the Remark.

**W2.** By `lPoly_eval`, P₁(q^{−s}) = ∏_{α∈A₁}(1 − α q^{−s}). A product over a multiset
vanishes iff some factor does, so α q^{−s} = 1 for some α ∈ A₁. Then
|α|·|q^{−s}| = 1, and `purity` gives |α| = √q. Core 1 yields Re s = 1/2.

**W1.** Suppose ζ_C(s) = 0 with Re s > 1/2. Then either the numerator vanishes or the
denominator does (Lean's `div_eq_zero_iff`). A vanishing numerator gives Re s = 1/2 by
the W2 argument, contradicting Re s > 1/2. If 1 − q^{−s} = 0 then |q^{−s}| = 1,
contradicting `norm_wOf_lt_one` (Re s > 0). If 1 − q·q^{−s} = 0, this contradicts the
hypothesis.

**HW.** Apply `pointCount` with [E:F] = m. Use A₀ = {1} and A₂ = {q} (`a2_eq`). This
gives #X(E) = 1 − Σ_{α∈A₁} α^m + q^m, so #X(E) − (q^m + 1) = −Σ α^m. The triangle
inequality over the multiset (`multiset_norm_sum_le`) and |α^m| = (√q)^m from `purity`
give the bound Σ_{α∈A₁} (√q)^m. This equals |A₁| · (√q)^m by
`multiset_sum_map_const`. ∎

## 5. Formal verification

| file | role | size | verdict |
|---|---|---|---|
| `pilots/71/P0.lean` | statement probe (header: "not a proof artifact"; 4 stubs) | — | elaborates (runs 1–4) |
| `pilots/71/P1.lean` | dictionary layer | 7 lemmas | GREEN, all triad (runs 3–4) |
| `pilots/71/P2.lean` | landing theorems (P1 carried verbatim) | 279 lines, 11 theorems | GREEN `p2-run6.log`; all triad |

The error count went 6 → 4 → 2 → 1 → 0 over p2-run1…6. The in-file `#print axioms`
covers all 11 theorems, and every one reports exactly
`[propext, Classical.choice, Quot.sound]`. Both files are Cycle-2 final-sweep targets
(`AxPilot71_P1`, `AxPilot71_P2`; `feasibility/VERIFICATION-LEDGER.md` §9). P0's four
stubs are certified probe-convention tokens and are never cited as results. Logs with
provenance headers are under `research/pilots/71/logs/`.

## 6. Relation to prior work

- **Mathematics:** A. Weil (1948) for rationality and RH for curves; H. Hasse for
  genus 1; F. K. Schmidt (1931) for rationality. Textbook form: Rosen, *Number Theory
  in Function Fields* (GTM 210), ch. 5; Stichtenoth, *Algebraic Function Fields and
  Codes*, Thm 5.1.1.
- **Formal:** AxiomMath `Weil` proves all four Weil conjectures in the T-variable
  (`WeilRiemannHypothesisForm.lean:206,212–213`; `LeanEval/WeilConjectures.lean:185`).
  tauceti has the genus-1 Hasse bound (`HasseBound.lean:44`) and a zeta function for
  elliptic curves (`Frobenius/Zeta.lean`). We found no s-plane function-field zeta in
  any formal corpus.
- **Number-field comparison:** DedekindZetaZeroFree's `dedekindZeta_ne_zero`
  (`Main.lean:9`, Re s > 31/32). W1 is its function-field analogue with constant 1/2,
  stated in the same shape apart from the corrected pole clause.
- **Recent informal:** J. Suzuki, arXiv:2610.41115 (2026-10-30), Hilbert-space methods
  for function-field zetas. It is a method neighbour, without the s-plane dictionary or
  proportions.
- **Maximal curves** (why per-curve proportions are absent): van der Geer–van der
  Vlugt (Zbl 0729.11066); Cossidente–Hirschfeld–Korchmáros–Torres (Zbl 0958.11048);
  Giulietti–Hirschfeld–Korchmáros–Torres (Zbl 1218.11064); Hirschfeld–Korchmáros–Torres,
  *Algebraic Curves over a Finite Field* (2008), Part 3.

## 7. Limitations and open problems

1. **RH is a hypothesis.** Discharging `WeilData` needs AxiomMath's proof, which sits
   behind the StacksFrontier dependency wall. Probe G6a measured the direct import at a
   59,222-job closure with 7,493 drift errors on our pin.
2. **ζ_C is a Lean function with division, not a proved meromorphic function.** W1/W2
   are statements about that function and its numerator. Meromorphy and the identity
   Z_C(q^{−s}) = Σ #C(𝔽_{q^m}) q^{−ms}/m (as exp-log) are not formalized here.
3. **|A₁| = 2g** is not derived: HW is stated with the multiset cardinality.
4. **Not formalized:** the "exact zero set" form (the zeros form exactly the vertical
   progressions above each α), and the conjunction of W1 with the number-field 31/32
   statement (planned optional P2c). Both are short corollaries of W2 and of the
   DedekindZetaZeroFree statement; neither is claimed.
5. **Family statements** (proportions over families of curves, e.g. via Bui–Florea pair
   correlation) are a separate, L-effort objective (dossier 71 [S]).

## References

A. Weil, *Sur les courbes algébriques et les variétés qui s'en déduisent* (1948).
M. Rosen, *Number Theory in Function Fields*, GTM 210, ch. 5. H. Stichtenoth, *Algebraic
Function Fields and Codes*, Thm 5.1.1. J. Suzuki, arXiv:2610.41115. AxiomMath `Weil`
(`WeilRiemannHypothesisForm.lean:206,212–213`, `LeanEval/WeilConjectures.lean:185–194`);
AxiomMath DedekindZetaZeroFree `Main.lean:9`; tauceti `Frobenius/Zeta.lean`,
`HasseBound.lean:44`. Project: dossier 71; `pilots/71-prework.md` §2–§5;
`novelty/round-4.md` §1, §6.1, §6.3; `feasibility/axiommath-donor-probes.md` (G3, G6a/b).
