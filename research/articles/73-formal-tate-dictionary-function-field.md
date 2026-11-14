# Hecke L-Series over 𝔽_q[T] in Lean, I: Character Class, Series, Continuation and the 1/2 Window

*cross-math-fronttier research article 73 (Cycle 2) · FINAL (Tier C; the rationality
discharge Q4 carried to Iteration 4) · dossier
`research/candidates/73-function-field-hecke-tate.md` · prework `research/pilots/73-prework.md`
· Lean `research/pilots/73/{P0,C}.lean` · builds on article 71*

**Status: PROVED at Tier C, FINAL.** `pilots/73/C.lean` has 236 lines and 7 theorems,
each with axioms exactly `[propext, Classical.choice, Quot.sound]` (run6-c-green). This is
the *statement layer* of a function-field Tate dictionary, for the rational function
field 𝔽_q(T). It contains the character class, the L-series as a formal power series, the
continuation statement under a rationality hypothesis, and the 1/2 zero-free window under
a purity hypothesis. Rationality (`hRat`) and purity (`hPur`, the Riemann hypothesis for
the associated Kummer covers) are hypotheses throughout. The planned unconditional
discharge of `hRat` for this class (milestone Q4) was not attempted. It sits behind a
separate gate and carries to Iteration 4.

---

## Abstract

For a finite field k with q elements and a nonzero ideal m ⊆ k[X], a ray-class character
mod m is a completely multiplicative function χ on the ideals of k[X]. It vanishes exactly
off the coprime-to-m cone and is 1 on principal ideals (f) with f ≡ 1 mod m. Its L-series
is L(T, χ) = Σ_{f monic} χ((f)) T^{deg f}. Classically (Weil; Rosen GTM 210 ch. 4 and
9), L(T, χ) is a polynomial for nontrivial χ, and its inverse roots have absolute value √q.
That is the Riemann hypothesis for the corresponding Kummer cover of ℙ¹. None of this
exists in any formal library we surveyed. The class-field-theory material in our corpora
is number-field-only.

We give the first formal statement layer:

1. a character structure `FFRayClassCharacter` transplanted field-by-field from
   AxiomMath DedekindZetaZeroFree's number-field `RayClassCharacter`. The only change is
   the archimedean positivity clause, which we prove vacuous (k has no ring maps to ℝ);
2. the L-series `heckeSeriesT χ ∈ ℂ⟦T⟧`, well defined by construction;
3. a continuation theorem: under a rationality identity L(T, χ)·P₀ = P₁, the
   s-plane function s ↦ P₁(q^{−s})/P₀(q^{−s}) is complex-differentiable wherever
   P₀(q^{−s}) ≠ 0;
4. the window theorem: under purity of P₁, that function has no zeros with Re s > 1/2,
   away from the zeros of P₀.

The window constant 1/2 is optimal. Compare 31/32 for Hecke L-functions of number
fields in DedekindZetaZeroFree, and 0.8733458561 for ζ and Dirichlet L in the best formal
result we know of (§6).

## 1. Introduction

Over number fields, formal zero-free regions for Hecke L-functions now exist:
DedekindZetaZeroFree proves L(s, χ) ≠ 0 for Re s > 31/32, for every number field and
every finite-order Hecke character. Over function fields the classical answer is
complete: every nontrivial zero lies on Re s = 1/2. Yet no formal system defines a
function-field Hecke character, a ray class over k[X], or its L-series. The gap is
vocabulary, not analysis. This article supplies the vocabulary for the rational function
field. It proves the two s-plane statements that follow directly from rationality and
purity, using the T ↔ s dictionary of article 71.

**Honesty.**
1. The mathematics is textbook: Tate's thesis (1950), Weil, *Basic Number Theory*
   ch. VII, and Rosen GTM 210. Novelty is formalization-first. The novelty audit
   (`novelty/round-4.md` PART-2 P2-13) supports "first formal Tate-type statement"
   *in the function-field scope*. The nearest formal neighbour is
   WenrongZou/TateThesis, a number-field project in progress, which would retire any
   "anywhere" phrasing if it lands.
2. At this tier the two analytic theorems are statements about the quotient
   P₁(q^{−s})/P₀(q^{−s}). The rationality hypothesis is what *identifies* that quotient
   with L(·, χ). The proofs do not otherwise use it, and the agreement of the quotient
   with the series on Re s > 1 (power-series evaluation) is not formalized here (§7).
3. `hPur` is deep (Weil). It is not elementary via Gauss sums, and it is never
   discharged.

## 2. Setting

All in `research/pilots/73/C.lean`. It imports only Mathlib, on mathlib `ff2494ea` with
Lean v4.36.0-rc2. Article 71's glue (`wOf`, `norm_wOf`, `lPoly`, `lPoly_eval`, Core 1) is
carried verbatim.

- **Character class.** `FFRayClassCharacter k m` is a structure with
  `toFun : Ideal k[X] → ℂ` and the following fields:
  - `map_mul'`: χ(IJ) = χ(I)χ(J);
  - `map_top'`: χ(⊤) = 1;
  - `eq_zero_iff'`: χ(I) = 0 ⟺ I = ⊥ ∨ I ⊔ m ≠ ⊤;
  - `map_span'`: f ≠ 0 and f − 1 ∈ m imply χ((f)) = 1.

  This matches DedekindZetaZeroFree's `RayClassCharacter`
  (`Challenge/DedekindZetaChallenge.lean:14–20`) field for field. The donor's
  `map_span'` additionally requires α to be totally positive (∀ φ : F →+* ℝ, 0 < φ α).
  Over k that clause is vacuous: the theorem `no_real_homs` shows there is no ring
  homomorphism k → ℝ.
- **Monic polynomials of degree n.** `monicDegreeN k n` is the image of the coefficient
  vectors v : Fin n → k under v ↦ Xⁿ + Σ v_i X^i. It is a `Finset` because k is finite.
- **L-series.** `heckeSeriesT χ := PowerSeries.mk (n ↦ Σ_{f ∈ monicDegreeN k n} χ((f)))`.
  The series is the *defined* object. An Euler-product expansion would be a theorem, and
  is not used.
- **Purity.** `HeckePurity χ q P₀ P₁ hRat` :⟺ P₁ = ε · ∏_{a∈α}(1 − aT) with |ε| = 1 and
  |a| = √q for every a ∈ α. This is the shape of the purity clause in AxiomMath's
  `LeanEval.WeilConjectures`.

## 3. Main results

Let χ : `FFRayClassCharacter k m`, q > 1, P₀, P₁ ∈ ℂ[T], and
hRat : `heckeSeriesT χ * P₀ = P₁` in ℂ⟦T⟧.

**Theorem 1 (`hecke_continuation`).** There is f : ℂ → ℂ with
f(s) = P₁(q^{−s}) / P₀(q^{−s}) for all s, and f complex-differentiable at every z with
P₀(q^{−z}) ≠ 0.

**Theorem 2 (`hecke_window`).** Assume `HeckePurity χ q P₀ P₁ hRat`. If Re s > 1/2 and
P₀(q^{−s}) ≠ 0, then P₁(q^{−s}) / P₀(q^{−s}) ≠ 0.

**Structural lemmas.**
- `no_real_homs`: `IsEmpty (k →+* ℝ)`, for every finite field k.
- `apply_span_singleton_eq_zero_iff`: for f ≠ 0, χ((f)) = 0 ⟺ (f) ⊔ m ≠ ⊤. So χ
  vanishes exactly at the polynomials not coprime to m.

**Reading.** For nontrivial χ, the classical theory gives hRat with P₀ = 1 and P₁ a
polynomial of degree < deg m. Theorem 1 then says L(q^{−s}, χ) extends to an entire
function. Theorem 2, given RH for the Kummer cover (purity), says it has no zeros in
Re s > 1/2. Combined with the functional equation (not formalized), all nontrivial zeros
would then lie on Re s = 1/2.

## 4. Proofs

**`no_real_homs`.** A finite field has characteristic p ≠ 0, so (p : k) = 0. A ring map
φ : k → ℝ would send this to (p : ℝ) = 0, which is false.

**Theorem 1.** s ↦ −s log q is entire, so s ↦ q^{−s} = exp(−s log q) is entire. Hence
s ↦ P_i(q^{−s}) is entire for each polynomial P_i (`Polynomial.differentiable`
composed with `wOf`). A quotient of differentiable functions is differentiable where
the denominator does not vanish (`DifferentiableAt.div`).

**Theorem 2.** Suppose the quotient vanishes. Since the denominator is nonzero by
hypothesis, P₁(q^{−s}) = 0, i.e. ε · ∏_{a∈α}(1 − a q^{−s}) = 0. Now ε ≠ 0 because
|ε| = 1, so some factor vanishes: a q^{−s} = 1 with |a| = √q. Article 71's Core 1 (from
|a| · |q^{−s}| = 1 and |q^{−s}| = q^{−Re s}) gives Re s = 1/2, contradicting
Re s > 1/2. ∎

## 5. Formal verification

| file | role | size | verdict |
|---|---|---|---|
| `pilots/73/P0.lean` | Q0 statement probe (7 header-justified stubs; "not a proof artifact") | 143 lines | GREEN first try (`run1-q0.log`, re-confirmed `run7-p0-final.log`) |
| `pilots/73/C.lean` | Q1–Q3 (class, series, Theorems 1–2, 71-glue) | 236 lines, 7 theorems | GREEN `run6-c-green.log`; 7/7 triad |

The error count went 2 → 4 → 4 → 2 → 0 over runs 1–6. C.lean is a Cycle-2 final-sweep
target (`AxPilot73_C`: OK, 14 axiom lines, 0 sorryAx,
`pilots/73/logs/axcheck-c2-final.log`). P0's seven stubs are certified probe-convention
tokens and are never cited as results.

## 6. Relation to prior work

- **Mathematics:** J. Tate, thesis (1950); A. Weil, *Basic Number Theory*, ch. VII;
  M. Rosen, *Number Theory in Function Fields* (GTM 210), chs. 4 and 9 (Dirichlet
  L-series over 𝔽_q[T]; RH via Weil).
- **Formal:** AxiomMath DedekindZetaZeroFree supplies the transplanted structure and the
  number-field comparison point (31/32). AxiomMath `Weil` has rationality of L-functions
  of ℓ-adic sheaves (`LAdicTraceFormulaFinal.lean:51`, `LFunctionRationalSheaf.lean:87`),
  but no Hecke characters and no s-plane. The best formal ζ/Dirichlet zero-free
  half-plane we know of is Re s > 0.8733458561 (the QuasiRiemannTracker entry, as of
  2026-11-14; dossier 70 standing notes). The vendored class-field-theory tree in the
  corpus is number-field-only: every "Tate" hit is Lubin–Tate
  (`survey/axiommath-cft-vendor.md`). WenrongZou/TateThesis is a number-field Tate
  thesis in progress.
- **Article 71:** the T ↔ s dictionary. The trivial-character case is article 71's
  setting for ℙ¹.

## 7. Limitations and open problems

1. **Q4, the rationality discharge for 𝔽_q[T]** (carried to Iteration 4). For χ mod m
   nontrivial, the coefficient of Tⁿ vanishes once n ≥ deg m, by equidistribution of
   monic polynomials over residue classes. This makes hRat elementary with P₀ = 1,
   estimated at 0.3–0.6k lines of bookkeeping. `monicDegreeN` is the substrate for it.
2. **Series agreement.** f(s) = Σ_n a_n q^{−ns} for Re s > 1 needs power-series
   evaluation at q^{−s}. It is not formalized, so Theorem 1 is "continuation" only
   through hRat's identification.
3. **Purity is a hypothesis** (Weil II for the Kummer covers). Discharging it requires
   AxiomMath's `Weil`, behind the Stacks wall (probe G6a priced it out).
4. **Scope:** only the rational function field, and only finite moduli. The
   infinite-place (sign/degree) data of a full Hecke character and general curves are
   not covered, nor is the functional equation / root number.
5. **No proportion statements.** Maximal curves (article 71 §1) make multiplicity
   proportions false; none are claimed.

## References

J. Tate, *Fourier analysis in number fields and Hecke's zeta-functions* (thesis, 1950).
A. Weil, *Basic Number Theory*, ch. VII. M. Rosen, *Number Theory in Function Fields*,
GTM 210. AxiomMath DedekindZetaZeroFree (`Challenge/DedekindZetaChallenge.lean:14–20`,
`HeckeCorollary.lean:12`); AxiomMath `Weil` (`LAdicTraceFormulaFinal.lean:51`,
`LFunctionRationalSheaf.lean:87`, `LeanEval/WeilConjectures.lean:191`). Project: dossier
73; `pilots/73-prework.md`; article 71; `novelty/round-4.md` §6.2–6.3 and PART-2 P2-13;
`survey/axiommath-cft-vendor.md`.
