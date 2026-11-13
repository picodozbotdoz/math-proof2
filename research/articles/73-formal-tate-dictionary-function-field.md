# A Formal Tate Dictionary for Function-Field Hecke L-Series, I: Statement Layer

*cross-math-fronttier research article 73 (Cycle 2) · DRAFT 2026-11-14 · dossier
`research/candidates/73-function-field-hecke-tate.md` · prework `research/pilots/
73-prework.md` (pilot 73-C queued after 71-P2, lane A2) · bridge `research/bridges/
function-field.md` §4 FF-EZ3*

**Status: DRAFT — statement-layer pilot queued, not started.** All verdict slots
([VERDICT:73-C] stages Q0–Q3 below) are empty by construction: no run has landed at draft
time. The article's body states the mathematical content (classical, 75 years old), the
statement class (formally new everywhere, audited), and the binder architecture, so that
the pilot's landing is a fill-in. "First formal Tate-thesis-type statement" is claimed
**in the function-field/rationality-dictionary scope only**, per A5's P2-13 audit, with
the WenrongZou nearest-neighbor clock attached.

---

## Abstract

Tate's 1950 thesis (function-field case) and Weil's *Basic Number Theory* ch. VII prove
that the L-series of a Hecke character (grössencharakter) of a global function field
K = 𝔽_q(C) are rational functions of T = q^{−s} — entire for nontrivial characters, off
the trivial factors, with a functional equation and all nontrivial inverse roots of
modulus √q. No formal system carries any of this: the Hecke class over function fields
does not exist in mathlib, tauceti, the AxiomMath family, or the vendored class-field-
theory tree (1,658 files, number-field-only by construction — every `Tate` hit is
Lubin–Tate). We state the dictionary formally for the first time, in three layers:
(P)(i) rationality ⟹ meromorphic continuation of L(s,χ) with the T-form pole/period
bookkeeping (proved at Tier C from dossier 71's t ↔ s transfer, under the rationality
binder hRat); (P)(ii) the RH-form with **window exactly 1/2** — every nontrivial zero of
the continued L(s,χ) lies on Re s = 1/2 (under the purity binder hPur: the function-field
analogue of DZDF's `heckeL_ne_zero` at 31/32, sharp); (C1) the 𝔽_q(T) probe class where
hRat is discharged *unconditionally* by elementary periodicity bookkeeping (χ mod m ⇒
residue-class decomposition), while hPur — the RH for Kummer covers of ℙ¹ — honestly
remains a binder; and (C2) the three-column window-comparison theorem: FF Hecke 1/2
(binder) vs ζ_K/Hecke-all-K 31/32 (DZDF, in-corpus) vs ζ/Dirichlet B_new = 0.8749570
(Liu-1, external). Part I is the statement layer; the dictionary itself (Kummer sheaves,
purity) is the Stacks-gated Part II ceiling.

## 1. Introduction

The number side of the L-function world gained, in six weeks of 2026, formal zero-free
half-planes at 7/8, 11/12, 31/32 and informal ones below B♭ (dossier 70's clock-sweep
standing notes). The function-field side has had, for 75 years, the complete answer —
every nontrivial zero exactly on the line — and exactly zero formal presence. The gap is
not analytic difficulty (there is none at the statement layer) but vocabulary: no formal
corpus defines a Hecke character of a function field, its divisor-modulus ray class, or
its L-series. This article builds that vocabulary as a transplant of DZDF's
`RayClassCharacter` structure (`Arithmetic/RayClasses/Character.lean:12`) onto mathlib's
function-field substrate, with one named delta: the archimedean "totally positive" clause
is vacuous over 𝔽_q(C) (no order), which is exactly what makes the transplant a
transplant rather than a re-derivation.

**Honesty.** Formalization-first, conditional-core, Stacks-blocked at the ceiling: the
mathematics is Tate/Weil/Rosen textbook material (round-4 §6.2's executed verdict:
KNOWN-INFORMAL-ONLY); the claim is the statement class + the shape discipline (binders a
future Stacks-priced build discharges wholesale). The falsity trap (maximal curves,
multiplicity 2g) kills multiplicity *proportions* — checked and scoped out (C3): it does
not touch rationality/entireness/nonvanishing statements, where eigenvalue coincidences
make zeros multiple, never absent or spurious.

## 2. Setting

k = 𝔽_q; C/k smooth projective geometrically irreducible; K := 𝔽_q(C). The Hecke class
`FFRayClassCharacter K m` for an effective divisor m: completely multiplicative χ on the
nonzero fractional ideals (finitely-supported divisors) of K, χ ⊤ = 1, vanishing off the
coprime-to-m cone, trivial on principals α ≡ 1 mod m. The L-series, for ℜs > 1:
L(s,χ) = ∏_{v ∤ supp m} (1 − χ(v) N(v)^{−s})⁻¹, N(v) = q^{deg v}; the T-form
L(T,χ) = ∏_{v∤m} (1 − χ(v) T^{deg v})⁻¹, T = q^{−s}. Weil-side binders (all Tier C):
`hRat` (∃ P₀ P₁ : ℂ[T], series·P₀ = P₁ — the shape of
`exists_rationalLFunction_mul_eq_polynomial`, `LAdicTraceFormulaFinal.lean:51`);
`hPur` (off trivial factors, L(T,χ) = ε(χ)·∏_j (1 − α_j T), ‖α_j‖ = √q — purity of H¹ of
the Kummer sheaf, Weil II for curves); `hTate` (the dictionary clause identifying the
Euler product with `LAdicSheaf.rationalLFunction` of ℒ_χ, `LFunctionRationalSheaf.lean:87`).

## 3. Main results

**(P)(i) Rationality ⟹ continuation (Tier C, under hRat).** There is f : ℂ → ℂ,
meromorphic, with f s = L(s,χ) for ℜs > 1, the T-form identity local L(T,χ) ∈ ℂ(T), and
the q-periodicity bookkeeping; χ nontrivial ⟹ f entire off the trivial factors. Proof:
dossier 71's t ↔ s transfer (rational ∘ q^{−s} ⟹ meromorphic; poles/periods transported)
— reuse, not reproof.

**(P)(ii) RH-form, window exactly 1/2 (Tier C, under hPur + (i)).** Every zero of f off
the trivial locus satisfies Re s = 1/2; DZDF-shaped clause `∀ s, 1/2 < s.re → (trivial
exclusions) → f s ≠ 0`. Proof: |T| = q^{−ℜs}, roots at |α_j|⁻¹ = q^{−1/2} ⟹ ℜs = 1/2
(71's modulus arithmetic, one more factor level).

**(C1) The 𝔽_q(T) probe (with the honesty correction).** For K = 𝔽_q(T), m a polynomial
modulus, χ finite-order on (𝔽_q[T]/m)-type data: **(P)(i) lands unconditionally** — hRat
is elementary here (χ periodic mod m ⇒ residue-class decomposition of Σ_{f monic} χ(f)
T^{deg f}; ≈0.3–0.6k LoC of bookkeeping, Rosen GTM 210 ch. 8 territory) — while **hPur
stays a binder**: "all inverse roots √q for Dirichlet L over 𝔽_q[T]" IS the RH for the
Kummer covers of ℙ¹ (Weil's theorem, deep). The probe therefore lands as (i)
unconditional + (ii) conditional — the correction recorded 2026-11-13 (A2's
FF-sequencing memo; dossier 73 §C1), superseding an earlier "P outright" draft.

**(C2) Three-column window comparison.** One theorem: FF Hecke L window 1/2 (binder-
purity) vs ζ_K/finite-order Hecke L 31/32 (DZDF `heckeL_ne_zero`, in-corpus) vs
ζ/Dirichlet B_new = 0.8749570 (Liu-1 external repo) — extends article 71's comparison
corollary and dossier 70's §5.3 per-class table to the Hecke row.

**(C3, scope note).** No simple-zero *proportion* statement is claimed or implied — the
maximal-curve trap (round-4 §6.3) fences exactly those shapes.

## 4. Proofs (Tier C architecture)

Q0 probe → Q1 the class definition (transplant + vacuous-positivity discharge) + the
Euler-series↔T-form dictionary + the 71-glue → Q2 = (P)(i) → Q3 = (P)(ii). Hard STOP
before Q4 (the Kummer-sheaf dictionary — Stacks-gated Tier A, Part II). The priced
provable item is Q1's periodicity layer for C1; everything else is template-following on
71's landed transfer pattern. Zero import gates at Tier C (mathlib + binders only).

## 5. Formal verification (all slots empty)

- Q0 (statement probe): [VERDICT:73-C]
- Q1 (class + series + 71-glue): [VERDICT:73-C]
- Q2 ((P)(i)): [VERDICT:73-C]
- Q3 ((P)(ii)): [VERDICT:73-C]
- Final LoC / theorem count / axcheck: [VERDICT:73-C]

Pilot dir/logs to be created at execution (`research/pilots/73/`); not present at draft
time. Elaboration de-risking: A7's G3 verdict (the LeanEval `weil_conjectures` statement
elaborates verbatim mathlib-only, 0 errors) and the A1-4 CFT-vendor survey (nothing
borrowable, nothing competing — the vendor is number-field-only) both stand as landed
evidence for the binder posture.

## 6. Relation to prior work

- **Tate's 1950 thesis; Weil, *Basic Number Theory*, ch. VII; Rosen, GTM 210, ch. 8–9**
  (incl. the grössencharakter case): the entire informal content.
- **A5 PART-2 P2-13 (executed)**: "first formal Tate-thesis-type statement anywhere" is
  SUPPORTED in the function-field/rationality-dictionary scope — arXiv 8+2 entries all
  irrelevant, AFP none, GitHub exactly 2 repos both audited and both number-field-only
  (DawidLipin dissertation stub; **WenrongZou/TateThesis** PhD project — Nuccio/Brasca,
  ANR FALSE, CI — the nearest formal neighbor and the standing clock on the "anywhere"
  phrasing; <2 weeks old at sweep, keep the clock).
- **Suzuki arXiv:2610.41115**: method-neighbor for ζ_C only (no Hecke content); Boyang
  Hu's function-field Langlands trilogy (hexagonmath): different layer.
- **DZDF**: the transplanted structure and statement shape; the C2 comparison column.
- **dossier 71 / article 71**: the t ↔ s dictionary this builds on (χ trivial reduces
  (P) to 71's (P)(i)/(ii)).

## 7. Limitations and open problems

- Tier A (the dictionary itself: Kummer sheaves, trace formula, purity) is Stacks-blocked
  (G6a pricing pending; "probably infeasible near-term").
- hPur is not dischargeable at any tier short of Weil II — the article's (ii) columns are
  honestly binder-conditional forever at Tier C.
- The WenrongZou clock: a number-field Tate thesis landing there would NOT preempt the
  function-field scope claim, but would retire the "anywhere" phrasing.
- Proportion extensions (Lamzouri-for-FF-family) remain trapped (C3) — a separate,
  flagged dossier-71 (S)-objective.

## References

- J. Tate, PhD thesis (1950); A. Weil, *Basic Number Theory*, ch. VII; M. Rosen,
  *Number Theory in Function Fields*, GTM 210, ch. 8–9. J. Suzuki, arXiv:2610.41115.
  axiommath `Weil` (`LAdicTraceFormulaFinal.lean:51`, `LFunctionRationalSheaf.lean:87`)
  and `DedekindZetaZeroFree` (`Arithmetic/RayClasses/Character.lean:12`,
  `HeckeCorollary.lean:12`, `Challenge/DedekindZetaChallenge.lean:34`).
  `research/survey/axiommath-cft-vendor.md` (A1-4). Dossier 73; pilots/73-prework;
  `research/novelty/round-4.md` §6.2–6.3, PART-2 P2-13.
