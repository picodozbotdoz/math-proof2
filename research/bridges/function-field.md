# Phase 2 bridge map v1 — Function-field ↔ number-field L-function cluster

Lane A2 ("function-field-bridge"), Cycle 2, 2026-11-13. Scope: the bridge between the
function-field world (axiommath/Weil: all four Weil conjectures over 𝔽_q, incl. RH = Deligne) and
the number-field quasi-RH cluster (axiommath/DedekindZetaZeroFree = Cureton–Thorner 31/32;
axiommath/ZetaZerosV2 = Lamzouri proportions; main-run dossiers 20/21/40/42/50; the E1–E6 zones
of `research/bridges/analytic-nt.md`). Structure mirrors that file (§0 snapshot, §1 intersections,
§2 lifts, §3 quantitative transport, §4 NAMED empty zones, §5 feasibility on our pin).

Corpus roots (read-only, all read this session unless marked): `axiommath/Weil/` (HEAD `c1c8983`,
"Weil" below), `axiommath/DedekindZetaZeroFree/` ("DZZF"), `axiommath/ZetaZerosV2/` ("ZZV2"),
`tauceti/` (rev `d92acc5c`), `encore-mathlib/repo/mathlib4/` ("mathlib", rev `ff2494ea`).
Tags: **[VERIFIED]** = statement read at the cited locator; **[HYPOTHESIS]** = inference needing
confirmation; **[LITERATURE]** = checked against the paper record (arXiv/publisher) this session.
Lane A1's `survey/axiommath.md` did not exist at write time; every load-bearing claim was verified
against primary sources directly. Post-draft (same session): novelty inputs from lane A5's
round-4 §FF pre-check (`research/novelty/round-4.md:81–134`) were folded into §4 FF-EZ2 and §6 —
in particular the Suzuki method-neighbor and the per-curve falsity trap now discipline every
proportion-shaped zone below.

---

## §0 Cluster snapshot

Five columns, two disjoint worlds, one shared substrate (mathlib):

| Capability | mathlib | tauceti | DZZF (number field) | ZZV2 (number field) | Weil (function field) |
|---|---|---|---|---|---|
| Zeta object | ζ, Dirichlet L; `FunctionField F K` def only (`Mathlib/NumberTheory/FunctionField.lean`, no zeta) [V] | ζ_K, Artin, Hecke records; **genus-1 FF zeta** `WeierstrassCurve.zetaFunction` (`…/EllipticCurve/Isogeny/Frobenius/Zeta.lean:153`) [V] | continued ζ_K + ray-class Hecke L (existential continuation `∃f`, `Main.lean:9` shape) [V] | ζ only (consumer) | `zetaSeries` ∈ ℚ⟦t⟧ (`Weil/Definitions.lean:87`), `zetaFunction` ∈ ℚ_ℓ⟦T⟧ Euler product over closed points (`Weil/Defs/…/Trace/LFunctionRationalSheaf.lean:87`) [V] |
| "RH" in force | none | Hasse bound genus 1: `frobeniusTrace_sq_le_four_mul_card` (`…/EllipticCurve/HasseBound.lean:44`); RH for genus 1: `norm_eq_inv_sqrt_card_…` (`Frobenius/Zeta.lean:244`) [V] | **quasi-RH 31/32**: `dedekindZeta_ne_zero` (`DedekindZetaZeroFree/Main.lean:9`), `heckeL_ne_zero` (`HeckeCorollary.lean:12`), every number field, every finite-order ray-class Hecke χ [V] | none (counts zeros, doesn't locate them beyond Lamzouri's proportions) | **exact RH**: `satisfiesWeilEstimate` (`…/Trace/DeligneWeilConjecture.lean:367`) — every eigenvalue λ of F_ν has \|ιλ\| = q^{ν/2} for EVERY complex embedding, all smooth proper X/𝔽_q [V] |
| Simplicity/ proportion of zeros | none | none | none | **Lamzouri**: C₀ = 0.67250… simple-and-on-line, C₁ = 0.83625… distinct, C₂ = 0.88762… simple-or-on-line (`Challenge/Basic.lean:209,217,238`; abstract engine `:146–189`) [V] | none (zeros never counted as a proportion; multiplicities appear only as `rootMultiplicity` in the FE sign, `Definitions.lean:200`) [V] |
| Functional equation | `WeakFEPair` (ζ, Dirichlet, modular) [V] | `mobiusAutOf_zetaRatFunc` Z(1/(qT)) = Z(T) genus 1 (`Frobenius/Zeta.lean:112`) [V] | not stated (implicit in f) | — | `prod_aeval_inv_rationalFrobeniusCharpolyReverse_zpow_eq` (`…/Trace/DeligneFunctionalEquation.lean:341`): Z(1/(qⁿt)) = ε·q^{nχ/2}·t^χ·Z(t) [V] |
| Explicit formula / log-derivative | none for zeros | `coeff_finrank_logOf_zetaFunction` genus 1 (`Frobenius/Zeta.lean:184`) [V] | Mellin/theta machinery (internal) | — | `logDerivative_zetaSeries`: t·Z′/Z = ∑_{m≥1} A_m tᵐ (`Weil/Defs/…/Trace/ZetaSeries.lean:144`); trace formula Z_X = ∏_ν P_ν^{(−1)^{ν+1}} (`…/Trace/LAdicTraceFormulaFinal.lean:173`) [V] |
| Prime/point side | Chebyshev ψ/θ [V] | Chebotarev ψ_C ~ ( \|C\|/\|G\| )x | (CT gives no PNT corollary in repo) | — | point-count formula: #X(E) = ∑(−1)^i Σ_{α∈A i} α^{[E:F]} (`LeanEval/WeilConjectures.lean:185`, ∀ finite E/F) [V] |
| Hecke-type L beyond Dirichlet | none | Hecke records over number fields (`TauCeti/NumberTheory/LFunctions/Hecke/{Basic,Primitive}.lean`) [V] | ray-class Hecke with quasi-RH [V] | — | **L(X, ℱ) of ℓ-adic sheaves**, rationality (`…/Trace/LAdicTraceFormulaFinal.lean:51`, over StacksFrontier's `rationalLFunction`) [V] |

Headline asymmetry [VERIFIED]: **the function-field column proves an exact, uniform RH (all
eigenvalues on the exact weight circle, every X, every q) but has no zero-counting, no simplicity
theory, and not even a name for its zeros as a multiset to count; the number-field columns have
deep multiplicity/proportion machinery (ZZV2) and a 31/32 window (DZZF) but no exact statement of
any kind.** The two worlds share no definition: nobody has written ζ_C(s) with T = q^{−s}
(FF-EZ1), and the two Hecke theories (DZZF ray-class over 𝓞_K vs Weil sheaf-L over 𝔽_q-curves)
have never been placed in one dictionary (FF-EZ3).

Dependency structure (who sits on whom) [VERIFIED]:
- Weil → mathlib `ff2494ea` (lakefile pin, identical to our encore checkout) + **AxiomMath/Stacks
  @ `012108f6`** — and every Weil module reaching the zeta definitions already imports
  `StacksFrontier.*` (`Weil/Definitions.lean:4–6,30`). The RH input itself,
  `isCharpolyPureOfWeight_rationalFrobenius` (`…/Trace/FieldOfConstantsFrobenius.lean:89`),
  comes from `StacksFrontier.…Trace.GeometricComponentsPurityReduction` (import :3) — Deligne's
  purity is *proved in StacksFrontier, not in Weil* (README §3: "obtained from the Stacks
  Project's `LAdicSheaf.weightBound` (Tag 03VH), proved in StacksFrontier along Laumon's
  Fourier-transform route").
- DZZF → mathlib `ff2494ea` + **TauCeti @ `d92acc5c`** (= exactly our local tauceti rev) + vendored
  class field theory (`vendor/class-field-theory`). The TauCeti surface is representation-theoretic:
  85 uses of `TauCeti.SU`, 26 `TauCeti.Sym.ofFn`, 26 `representativeSubmodule`, 18
  `ContRepresentation.matrixCoeff`, 7 `haarProb` (rg over `DedekindZetaZeroFree/`, 35 files) —
  Schur orthogonality / SU(2) symmetric powers, i.e. the metaplectic (Kazhdan–Patterson) layer of
  the CT proof [LITERATURE: hexagonmath.org/2610.00200v1 abstract names Kazhdan–Patterson,
  cubic Gauss sums, Kubota, Weil unitary operators].
- ZZV2 → mathlib `ff2494ea` + PrimeNumberTheoremAnd (`rev v4.34.0-rc2` tag); its
  `Challenge/Basic.lean` (statement file) is **mathlib-only** [V].
- **tauceti is the only corpus touching both worlds**: it is DZZF's dependency (number side) and
  simultaneously carries the genus-1 function-field zeta theory (content side) [V].

---

## §1 Intersection table — shared/analogous objects under different names

| Concept | number-field side (DZZF/ZZV2/tauceti/mathlib) | function-field side (Weil) |
|---|---|---|
| The zeta function | `NumberField.dedekindZeta K` (Re s > 1 series, `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`) + DZZF's existential continuation `∃f, DifferentiableOn ℂ f {1}ᶜ ∧ f = ζ_K on Re>1 ∧ …` (`Main.lean:9–13`) [V] | `zetaSeries f = exp(∑ A_m/m tᵐ) ∈ ℚ⟦t⟧` (`Definitions.lean:87`); rational by `exists_mul_zetaSeries_eq` (`…/Trace/ZetaRationality.lean:170`); ℓ-adic Euler product `zetaFunction = ∏_{x∈\|X\|} det(1 − π_x^* T^{deg x})⁻¹` (`LFunctionRationalSheaf.lean:87`) with ℚ↔ℚ_ℓ bridge `zetaFunction_eq_map_zetaSeries` (`…/Trace/ConnectedComponentsCharpoly.lean:508`) [V] |
| Zeros vs eigenvalues | zeros ρ of ζ_K, multiplicity `(analyticOrderAt L ρ).toNat` (zeta23 convention; ZZV2 `zeroMultiplicity = analyticOrderNatAt riemannZeta ρ`, `Challenge/Basic.lean:49`) [V] | **Frobenius eigenvalues**: multiset `A i ⊂ ℂ` (`LeanEval/WeilConjectures.lean:185`), roots of P_ν = `rationalFrobeniusCharpolyReverse` (`Definitions.lean:154`). Zeros of Z_X ↔ inverse eigenvalues: Z_X(T) = ∏_ν det(1 − T F_ν)^{(−1)^{ν+1}} (`LAdicTraceFormulaFinal.lean:173`) [V] |
| "Critical line"/RH | strip confinement only: Re > 31/32 zero-free (DZZF `Main.lean:13`); openai 7/8 (`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`, cited analytic-nt.md §1); line proportion ≥ 2/3 (ZZV2) | **exact circle**: every ιλ with \|ιλ\| = q^{ν/2} (`Definitions.lean:161–165`); in the T-plane, every nontrivial zero of Z_X on \|T\| = q^{−ν/2} — Weil's original form `exists_zetaSeries_mul_prod_even_eq_prod_odd` (`…/Trace/WeilRiemannHypothesisForm.lean:206`, inverse roots of P_j have \|z\| = q^{j/2} at :213/:218) [V] |
| Degree/genus vs discriminant | conductor/discriminant D, N𝔣(χ) (DZZF ray-class modulus `m : Ideal (𝓞 K)`, `HeckeCorollary.lean:14`); zeta23 μ-density in (κ,q) | dimension `d`, Betti numbers b_ν = dim H^ν (`Definitions.lean:180`), Euler characteristic χ (`:185`); genus g = b_1/2 for curves (b_1 = deg P_1, `natDegree_rationalFrobeniusCharpolyReverse`, `…/Trace/CharpolyDegree.lean:67`) [V] |
| Euler product | ∑ over ideals: `HasSum (fun I ↦ χ I * N(I)^{−s}) (f s)` (DZZF `HeckeCorollary.lean:17–18`) [V] | Euler product over **closed points** with local factor `det(1 − π_x^* T^{deg x})⁻¹` (`LFunctionRationalSheaf.lean:87` docstring; coefficient stability `coeff_zetaFunction_eq` :111; ℚ-side `coeff_zetaSeries_eq_coeff_prod`, `…/Trace/ZetaEulerProduct.lean:216`) [V] |
| Explicit formula shape | analytic: zeta23 `EF_lit` over zero configs (analytic-nt.md §1); log-derivative Euler series OAI `Hecke/PrimeDyadic.lean` | **cohomological**: log-derivative identity t·Z′/Z = ∑ A_m tᵐ (`ZetaSeries.lean:144`) + trace formula (`LAdicTraceFormulaFinal.lean:173`) — the "EF" is Newton's identity connecting power sums (point counts A_m) to zeros (eigenvalues) [V] |
| Power-sum ↔ zero dictionary | zeta23 prime-side Gram/trace machine (Λ-moments, `PrimeSide.thm_traces`) | `coeff_logDerivative_multiset_prod_one_sub_C_mul_X` (`LeanEval/WeilConjectures.lean:85`) — the literal identity −Σ_m (Σ_α αᵐ) tᵐ = t·(∏(1−αT))′/(∏(1−αT)) [V] |
| Functional equation | s ↦ 1−s via `WeakFEPair`/`completedRiemannZeta_one_sub` (mathlib) | T ↦ 1/(qⁿT): `prod_aeval_inv_rationalFrobeniusCharpolyReverse_zpow_eq` (`DeligneFunctionalEquation.lean:341`); genus 1 `mobiusAutOf_zetaRatFunc` Z(1/(qT)) = Z(T) (tauceti `Frobenius/Zeta.lean:112`) [V] |
| Base change / twisting | none formalized | constant-field extension: P_ν(S/k)(T) = P_ν(S/k′)(T^{[k′:k]}) (`rationalFrobeniusCharpolyReverse_eq_comp_of_comp_specAlgebraMap_eq`, `FieldOfConstantsFrobenius.lean:163`) — i.e. eigenvalues raise to the r-th power under base change [V] |
| Multiset/zero bookkeeping | ZZV2 `IsConjInvariant Z m` (finite conjugation-invariant multiset + multiplicity, `Challenge/Basic.lean:114`), `simplePart/simpleRealPart/distinct` (`:123–139`) | LeanEval `A : ℕ → Multiset ℂ` with Galois invariance `(∀ φ : ℂ ≃+* ℂ, (A i).map φ = A i)` and integrality (`WeilConjectures.lean:185` statement, clauses :188–194) — **the same shape, never matched** [V] |
| Hecke L-function | DZZF `RayClassCharacter K m` (def `Challenge/DedekindZetaChallenge.lean:14`, in-repo, on mathlib ideal theory) + `heckeL_ne_zero` | L(X, ℱ) for ℓ-adic sheaves, rationality only (`LAdicTraceFormulaFinal.lean:51`) [V] |
| Trivia-grade shared object | mathlib `Analysis/SpecialFunctions/Gamma/Deligne.lean` (Γ_ℝ/Γ_ℂ, named for Deligne) — needed only on the number side; the FF zeta is rational, no Γ-factors anywhere in Weil [V] | |

Notable duplications / near-misses [VERIFIED]:
1. **Genus-1 zeta proved twice, in disjoint vocabularies**: tauceti
   `WeierstrassCurve.zetaFunction` (via `frobeniusPowTrace`, Silverman V.2.4 route:
   rationality `:201`, FE `:112`, RH `:244`) vs Weil `zetaSeries` at X = an elliptic curve
   (special case of `exists_zetaSeries_mul_prod_even_eq_prod_odd` with d = 1, P_1 =
   1 − a_q T + qT²). No identification lemma exists anywhere (FF-EZ4).
2. **Zero-free window statements in three strengths that no corpus relates**: 7/8 (openai, ζ and
   Dirichlet), 31/32 (DZZF, all ζ_K + Hecke), exact-1/2 (Weil, all X/𝔽_q) — three proof engines
   (zero-density/Deuring–Heilbronn-flavored, metaplectic theta, étale cohomology), zero transport
   between any two.
3. **Point-count vs ψ**: LeanEval's `Nat.card(X(E)) = ∑(−1)^i Σ α^{[E:F]}` (`WeilConjectures.lean:185`
   last clause) is the exact structural twin of a Perron/ψ moment identity; tauceti's
   `frobeniusPsi_asymptotic` (Chebotarev PNT) and zeta23's cheb layer live on the other side; no
   corpus contains a point-count *inequality* (Hasse–Weil-type bound) for dimension > 0 — the
   eigenvalue statement exists, the triangle-inequality consequence does not (FF-EZ1).

---

## §2 Lifts, generalizations, dualizations across the corpora

(a) **What the Weil column has that the number-field cluster lacks** [VERIFIED]:
- An *exact* localization theorem (all eigenvalues exactly on the weight circle) uniform in all
  smooth proper X/𝔽_q — versus best-known uniform windows 31/32 (ζ_K) and 7/8 (ζ). The gap
  1/2 ↔ 31/32 is itself a formalizable contrast statement (FF-EZ1/FF-EZ5).
- Integrality + ℓ-independence of the L-factors: P_ν ∈ ℤ[t] independent of ℓ
  (`exists_map_int_eq_rationalFrobeniusCharpolyReverse`, `…/Trace/CharpolyIntegrality.lean:222`,
  `:260`) — the number-field side never needs this (its L are single complex functions).
- Betti-number comparison (`natDegree_rationalFrobeniusCharpolyReverse_eq_bettiNumber`,
  `…/Trace/BettiNumber.lean:48`) — deg P_ν = b_ν: a *degree formula for the zero count*; the
  analog on the number side is Riemann–von Mangoldt, which zeta23 has for ζ/χ only and DZZF/CT
  side lacks entirely for ζ_K.
- L-functions of sheaves (Tag 03UX world): a Hecke-type L-theory *closed under the six functor
  formalism* — vastly more general objects than ray-class characters, but with only rationality
  proved in-repo.

(b) **What the number-field columns have that Weil lacks** [VERIFIED]:
- A multiplicity-and-proportion engine for zeros: ZZV2's Proposition 2.1
  (`Challenge/Basic.lean:146–189`) is an *abstract* theorem about any finite conjugation-invariant
  multiset Z ⊂ ℂ with multiplicity m — statement file mathlib-only. The Weil side supplies
  exactly such multisets (LeanEval `A i`) and never counts them (FF-EZ2).
- Zero-free *inequality* statements in s; meromorphic-continuation packaging (DZZF's `∃f` shape)
  that FF zetas trivially satisfy after rationality but nobody has stated (no s-plane object).
- The explicit formula as an analytic identity against test functions (zeta23 WeilEF) versus the
  cohomological one; the dictionary between the two shapes is nowhere formalized.

(c) **Dualizations** [VERIFIED shape, HYPOTHESIS mechanism]:
- RH over 𝔽_q dualizes "no zeros off the line" into "all eigenvalues on the circle"; the Lamzouri
  second-moment functional (the `∑_{z,s∈𝒵} K(z−s)²` term of `prop_simple_real_lower`,
  `Challenge/Basic.lean:146`) applied to the eigenvalue multiset {α_i/√q} would need a bilinear
  bound in Frobenius eigenvalues — on the number side this input comes from the explicit formula
  (moments of Λ); on the FF side the same role is played by *monodromy/Katz–Sarnak equidistribution*
  [LITERATURE: the family version is occupied, see §4 FF-EZ2]. For a *fixed* curve the needed
  second-moment bound is FALSE (supersingular curves: all α_i = ±√q, kernel term ~ g²·K(0)²)
  — an honest negative result constraining FF-EZ2 [VERIFIED obstruction].
- Base change duality: `P_ν(T^r)` under 𝔽_{q^r} (FieldOfConstantsFrobenius.lean:163) vs the
  number-field CM/base-change world (tauceti Hecke records) — no corpus states the number-field
  analog of eigenvalue powering.

(d) **The dependency overlap (tasking question)**: DedekindZetaZeroFree depends on TauCeti, Weil
depends on StacksFrontier; the two dependency trees are disjoint [VERIFIED from lakefiles]; the
only content overlap between the two worlds inside one corpus is tauceti's genus-1 layer (§1.1).
So every bridge statement below is by construction multi-corpus: no single corpus can even state
both sides. Also note DZZF and Weil pin the *same* mathlib rev `ff2494ea` as we do, and ZZV2's
toolchain+mathlib match ours after the 2026-11-13 bump (`research/feasibility/axiommath-bump/`,
v2-run9: ZZV2 + PrimeNumberTheoremAnd build OK, 8262 jobs); **Weil was never built in the bump**
(no Stacks clone; see §5).

---

## §3 Quantitative-bound transport (window table)

| Quantity | number field | function field | transport verdict |
|---|---|---|---|
| Zero-free window for the zeta | Re s > 31/32, all K (DZZF `Main.lean:9`) [V] | all nontrivial zeros exactly on \|T\| = q^{−ν/2} ⇔ Re s = ν/2 for ζ_C (from `WeilRiemannHypothesisForm.lean:206`) [V] | FF window = 1/2 *unconditionally*: trivial-from-Weil once the s-plane object exists (FF-EZ1). Uniform in genus/degree is free on the FF side (the eigenvalue statement already quantifies over all X); note CT is *also* uniform in K, so uniformity is NOT the differentiator — the constant is. |
| Same for Hecke-type L | Re s > 31/32, finite-order ray-class χ (DZZF `HeckeCorollary.lean:19`) [V] | nothing stated for L(C,ℱ); purity machinery (StacksFrontier weightBound, Tag 03VH) consumed only at the trivial sheaf (`FieldOfConstantsFrobenius.lean:89` context :108 docstring) [V] | the genuinely open transport (FF-EZ3): a quasi-RH with window 1/2 for function-field Hecke L |
| Counting function analog | RvM N(T) for ζ/χ (zeta23); nothing for ζ_K | deg P_ν = b_ν (`CharpolyDegree.lean:67`) — the count is *finite and exact*: N_ν = b_ν zeros of P_ν, always |V] | FF count exact ⇒ "N(T) asymptotics" degenerate for a fixed curve; the analog lives over families (§4 FF-EZ5) |
| Error term in prime/point counting | none proved from 31/32 in DZZF (no PNT corollary in repo); openai 7/8 → ψ(x) = x + O(x^{7/8+ε}) (analytic-nt.md E3, dossier 22) | point counts: A_m = 1 − Σα^m + q^m (LeanEval :185 at [E:F] = m) ⇒ \|A_m − q^m − 1\| ≤ 2g·q^{m/2} by triangle inequality + \|α\| = √q — **stated nowhere** | the number of the FF side beats x^{1/2+ε}-under-RH *shape* with an explicit uniform constant 2g = b_1; formal-first, glue-grade (FF-EZ1(ii)) |
| Simplicity constants | C₀ = 3/2 − (1/√2)cot(1/√2) > 0.6725, C₁ > 0.83625, C₂ > 0.8876 (ZZV2 `Challenge/Basic.lean:209–243` numeric `:256–278`) [V] | none; on-circle proportion is trivially 1 (Deligne), so the honest FF analog is the *simplicity* proportion, which is family-dependent | see FF-EZ2: fixed-curve version obstructed (supersingular), family version literature-occupied |

---

## §4 Empty zones (candidate discoveries), ranked

Standing design rule (from the A5 §FF falsity trap + this lane's independent obstruction check):
proportion- or zero-statistics-shaped candidates for the function-field side must be
family-averaged, family-quantified, or exclusion-based — per-curve uniform versions are false
(supersingular Jacobians force multiplicities ~ g; §4 FF-EZ2).

### FF-EZ1. The s-plane zeta of a curve: first meromorphic ζ_C(s), the optimal window, and the Hasse–Weil point-count transport

**Candidate statement.** For k = 𝔽_q and X smooth proper geometrically irreducible of dimension d
over k, define ζ_X(s) := Z_X(q^{−s}) — first as the formal substitution into the rational function
delivered by `exists_zetaSeries_mul_prod_even_eq_prod_odd` (`WeilRiemannHypothesisForm.lean:206`:
Z_X · ∏_{j even} P_j = ∏_{j odd} P_j in ℚ⟦t⟧, P_j ∈ ℤ[t]) — and prove:
(i) ζ_X extends to a meromorphic function ℂ → ℂ with poles exactly at s ∈ {0, 1, …, d} (from
rationality of Z_X and nonvanishing of P_j(0) = 1);
(ii) **zero-location / window**: every zero of ζ_X off {0,…,d} satisfies Re s = j/2 for the
relevant j (all inverse roots have \|z\| = q^{j/2}, clause at `WeilRiemannHypothesisForm.lean:212–213`
"∀ z ≠ 0, aeval z⁻¹ (P j) = 0 → ‖z‖ = q^{j/2}"); for a curve (d = 1): *every* nontrivial zero of
ζ_C lies exactly on Re s = 1/2 — the function-field Cureton–Thorner statement with constant
exactly 1/2, for every curve, every q, every genus, unconditionally;
(iii) **point-count transport** (Hasse–Weil bound, all m uniform): for every m ≥ 1,
\|A_m − q^m − 1\| ≤ 2g·q^{m/2}, A_m = #C(𝔽_{q^m}), via the LeanEval point-count formula
(`WeilConjectures.lean:185` last clause, [E:F] = m) + triangle inequality;
(iv) *stretch*: the s-plane functional equation ζ_C(s) = ζ_C(1−s) (transfer
`mobiusAutOf`-type T-invariance / `DeligneFunctionalEquation.lean:341` through T = q^{−s}),
and vertical periodicity: the nontrivial zero set is invariant under s ↦ s + 2πi/log q
[trivial-from-Weil, but nowhere stated; gives the "perfectly periodic zero set" contrast with
the number side].

**Novelty.** As mathematics: (ii)/(iii) are classical (Weil 1948; Hasse genus 1; Silverman V.2.4
for genus 1). As formal statements: [VERIFIED absent] — mathlib has no zeta of any variety over
𝔽_q and no Hasse bound beyond nothing (rg `zetaFunction|zetaSeries` Mathlib/ → 0;
`Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43–84` is the local-Euler-factor/L-series
file for BSD over number fields — different object); tauceti has genus 1 only
(`HasseBound.lean:44`, `Frobenius/Zeta.lean:201,244`); the Weil repo itself never states a
point-count inequality nor an s-plane object (rg over Weil/: pointCount appears in identities
only, e.g. `ZetaSeries.lean:97 coeff_pointCountSeries`). The comparison theorem "(ii) is to CT-31/32
as 1/2 is to 31/32" is new *as a corpus-internal statement* and is the dictionary every other
zone needs.

**Bridge-essentiality.** Three-way: Weil (the only source of (i)'s rationality and (ii)'s
eigenvalue bounds), mathlib (Complex.exp/meromorphic-function API, `Polynomial` ↔
`PowerSeries.eval`), DZZF (the *statement shape* to compare against: `Main.lean:9–13` existential
continuation + window clause — FF-EZ1(ii) should be stated in exactly that shape for the
comparison theorem to typecheck against it). Lane A1's survey should confirm no other AxiomMath
repo (ZetaZeros, PrimeNumberTheoremAnd) snuck in an s-plane FF zeta.

**Contributing named results.** `Weil.exists_zetaSeries_mul_prod_even_eq_prod_odd`
(`WeilRiemannHypothesisForm.lean:206`); `LeanEval…weil_conjectures` (`WeilConjectures.lean:185`);
`AlgebraicGeometry.zetaSeries` (`Definitions.lean:87`); `pointCountOfDegree` (`Definitions.lean:66`);
`logDerivative_zetaSeries` (`ZetaSeries.lean:144`); `coeff_logDerivative_multiset_prod_one_sub_C_mul_X`
(`WeilConjectures.lean:85`) — restatable on mathlib alone; DZZF `dedekindZeta_ne_zero`
(`Main.lean:9`) as the comparison anchor.

**Feasibility.** The mathematical content is triangle-inequality + exp-substitution glue, but see
§5: importing Weil's names requires Stacks. Route: restate the *mathlib-only* `weil_conjectures`
statement as a hypothesis binder (the hQRH/EnclOK precedent, AGENTS.md conventions) and prove
(iii) + the d = 1 specialization of (ii) from it directly; (i)/(iv) additionally need the
power-series ↔ rational-function ↔ meromorphic-function transfer, real but moderate analysis work
on mathlib (`PowerSeries.eval`, `Function.Meromorphic`). Probe-grade: yes.

### FF-EZ2. Lamzouri proportions for ζ_C: a live but trap-ridden zone (A5 verdict WARM), with one cheap surviving statement

**Scoping discipline first (the falsity trap — folds A5 round-4 §FF and matches this lane's
independent finding).** A per-curve uniform "≥ c of the zeros of Z_C are simple" is FALSE as
stated: curves with supersingular-type Jacobians have Frobenius eigenvalues equal up to sign
(tauceti's supersingular layer, `…/Frobenius/Supersingular.lean`, gives the genus-1 instance),
so zeros of multiplicity comparable to g exist and the worst-case simple proportion is 0
[VERIFIED obstruction qualitatively; the quantitative every-genus citation is A5's open item
[A9 verify] — Moret-Bailly/Ibukiyama–Katsura-line, `novelty/round-4.md:116–123`]. Even the
engine preconditions fail per-curve: ZZV2's `prop_simple_or_real_lower` (`Challenge/Basic.lean:182`)
needs the second-moment bound ∑_{z,s} K(z−s)² ≤ A·∑1 with A < 2 — for a supersingular eigenvalue
multiset all points coincide and the K(0)-term is ~ g². **Design rule for this zone: every
candidate must be family-averaged, family-quantified, or exclusion-based — never "every curve";
and "on the line" is free (Deligne), so all content must live in the multiplicity structure.**

**What the literature owns and does not own** [LITERATURE; cross-checked against A5's pre-register
`novelty/round-4.md:96–102`, queries FF-1–FF-7]:
- Occupied (input side): Bui–Florea arXiv:1605.07092 — 1-level density + pair correlation over
  the hyperelliptic ensemble H_{2g+1} (fixed q, g → ∞), with "lower bounds for the proportion of
  simple zeros of this family of L-functions" derived (abstract). So *a* family-average lower
  bound exists informally; what is unclaimed is the **Lamzouri-constant version** — a C₀/C₁/C₂-
  shaped proportion for a function-field family via the exact Hilbert inequalities (2.3)–(2.6),
  which is what a ZZV2 port would deliver. A5's verdict on the statement class: WARM, unclaimed
  (FF-2/FF-5/FF-6 clean).
- Occupied (statistics, not multiplicity): the fixed-q, g → ∞ regime is genuinely studied —
  Faifman–Rudnick arXiv:0803.3534 (CLT for zero counts in angle intervals, large genus),
  Rudnick arXiv:0811.3649 (high-power Frobenius traces vs USp(2g) prediction, moments agreeing
  up to n ≈ 4g) — counts and traces, *not* multiplicity proportions; plus the q → ∞ family
  literature (Entin–Roditty-Gershon–Rudnick 2012; Andrade–Miller–Pratt–Trinh 2014;
  Meisner–Södergren 2021; Çiçek–Darbar–Lumley 2025; Ahlquist 2025), all running on Katz–Sarnak
  monodromy (USp(2g); book-level anchor: Katz–Sarnak 1999, *Random Matrices, Frobenius Eigenvalues,
  and Symmetry* — family limits force simple zeros a.s.; monodromy gives no per-curve statement).
- **Method-neighbor, 2 weeks old**: Suzuki arXiv:2610.41115 (2026-10-30), "A spectral theory of
  zeta functions of function fields" — builds Hilbert spaces from the Weil quadratic form,
  self-adjoint extensions, eigenvalues → zero ordinates; **no proportions proved**. Positioning:
  Suzuki is a *transfer-of-method* play (Hilbert-space methods entering FF zetas) and informal;
  the ZZV2 port would be a *transfer-of-statement* (the exact Proposition 2.1 constants
  instantiated on Frobenius multisets) and formal. Third parties entering this method space now
  puts the zone on a month-scale clock, exactly like the ζ_K cluster (A5 `round-4.md:127–131`);
  the AF-cluster actors (Lamzouri lineage) have not touched function fields as of today.
- Number-side nearest miss for the distinct-proportion analog: DLRT arXiv:1908.04876 (ζ_K
  distinct-zero proportion via SDP — dossier-42 territory, not function fields).

**The surviving cheap statement (base-change simplicity; exclusion-based shape).** For a fixed
curve C/𝔽_q with Frobenius eigenvalues {α_1,…,α_{2g}} and base change C_m := C ×_{𝔽_q} 𝔽_{q^m}:
by `rationalFrobeniusCharpolyReverse_eq_comp_of_comp_specAlgebraMap_eq`
(`FieldOfConstantsFrobenius.lean:163`) the eigenvalues of C_m are {α_i^m}. Candidate theorem:
if no ratio α_i/α_j (i ≠ j) is a root of unity and no α_i repeats, then
lim_{M→∞} #{m ≤ M : all 2g zeros of Z_{C_m} simple}/M = 1 — the zeros of the base-changed zeta
are simple for a density-one set of extension degrees; and unconditionally, the simple proportion
of Z_{C_m} equals (number of distinct values among α_i^m)/2g ≥ (number of distinct α_i)/2g,
computable per curve. Consumes ZZV2's multiset vocabulary (`IsConjInvariant`,
`Challenge/Basic.lean:114`) as bookkeeping but not Proposition 2.1 (the conclusion 1 > C₀ makes
the Hilbert machinery unnecessary). Nearest miss: Rudnick 0811.3649 studies exactly these
power-sums Σ α_i^m (traces, vs my collision question), never multiplicities.

**Novelty.** [HYPOTHESIS] The density-1 statement is elementary (finitely many bad congruence
classes); I found no explicit statement in the literature (arXiv "constant field extension zeta
curve" → nothing on point, this session); plausibly folklore. Value: formal-first, small.
The *family-proportion* statement (the true Lamzouri analog over the hyperelliptic ensemble,
consuming Bui–Florea-grade pair correlation as input) is unclaimed and the real prize of this
zone — but see feasibility.

**Feasibility.** The cheap statement: elementary number theory (root-of-unity ratios, Kronecker)
+ the LeanEval multiset API restated under a binder — low risk, low reward, warm-up grade. The
family-proportion statement: needs a function-field explicit formula with ensemble averages
(pair correlation of Frobenius angles over H_{2g+1}) — nothing of this exists in any corpus
(zero FF explicit-forma infrastructure; Weil's `logDerivative_zetaSeries` is per-variety, not
per-family), so this is a large analytic build, not a transfer. Verdict: **WARM as a statement
class (unclaimed, clock ticking per Suzuki), HARD as feasibility; the base-change density
theorem is the honest cheap deliverable.**

### FF-EZ3. Hecke L-functions over function fields: the Tate-thesis dictionary and the missing quasi-RH-with-1/2

**Candidate statement.** Two layers.
(i) *Dictionary*: for C/𝔽_q a smooth curve with function field K = 𝔽_q(C), and a finite-order
ray-class character χ of K (modulus an effective divisor m — definable on mathlib's
`FunctionField.ringOfIntegers` substrate, `Mathlib/NumberTheory/FunctionField.lean`, + DZZF's
`RayClassCharacter` shape transplanted), define the Hecke series
L(s,χ) := ∏_{v ∤ m} (1 − χ(v) N(v)^{−s})⁻¹ for Re s > 1 and prove it equals, on the nose, the
L-function L(U, ℒ_χ) of the lisse ℓ-adic Kummer sheaf attached to χ on U = C ∖ supp(m) — an
instance of `LAdicSheaf.rationalLFunction` (Euler product over closed points,
`LFunctionRationalSheaf.lean:87` docstring; rationality `exists_rationalLFunction_mul_eq_polynomial`,
`LAdicTraceFormulaFinal.lean:51`). Consequence: L(s,χ) is rational in T = q^{−s}.
(ii) *Payoff*: the quasi-RH for function-field Hecke L: for χ of weight 0, every "nontrivial"
zero of L(s,χ) lies on Re s = 1/2 (equivalently: L(T,χ) ≠ 0 for \|T\| < q^{−1/2} outside the
trivial factors) — the function-field analog of DZZF `heckeL_ne_zero` (`HeckeCorollary.lean:12`)
with window exactly 1/2, via purity of H¹ of the Kummer sheaf (Weil II for curves).

**Novelty.** Classical mathematics (Grothendieck–Laumon route to Deligne's Weil II; the
dictionary is Tag 03UX-adjacent) but [VERIFIED] zero formal presence: no corpus defines a Hecke
character of a function field (mathlib `FunctionField.lean` has only the field/ring definitions;
tauceti's Hecke records are number-field; DZZF's are ray-class over 𝓞_K; arXiv search for Lean
Tate-thesis function-field formalization → nothing; hexagonmath.org sweep (this session, per the
orchestrator's note that those publications are invisible to arXiv): no function-field
L-function work — closest is Boyang Hu's three-part function-field Langlands series, different
layer). Even layer (i) alone — "the Euler product of a function-field ray-class character is
rational" — would be the first formal Tate-thesis-type statement anywhere.

**Bridge-essentiality.** Four-way and irreducible: Weil/StacksFrontier supply L(X,ℱ) and
(eventually) purity; DZZF supplies the ray-class-character statement shape to mirror
(`HeckeCorollary.lean:12–19`: continuation + Euler-series + nonvanishing clauses); mathlib
supplies function fields and divisors; tauceti supplies the only existing ℓ-adic-adjacent
arithmetic. Nobody can state it alone.

**Feasibility.** Blocked at the root: L(X,ℱ) and purity live behind StacksFrontier (§5), and the
Kummer-sheaf construction (χ ↦ ℒ_χ) is *not* in the Weil repo — only the trivial/constant sheaf
is developed (`LAdicSheaf.constantSystem`). This is the highest-ceiling, lowest-probability zone;
probe only after A7 prices a partial Stacks build. A cheap *statement-only* probe: write the
number-field-shaped statement "∃ f meromorphic, f = Euler series on Re>1, f ≠ 0 on Re > 1/2" for
𝔽_q(T) with χ a Dirichlet character of 𝔽_q[T] (no sheaves — this special case is Gauss-sum
theory, closer to mathlib), and treat the sheaf dictionary as the Phase-3 extension.

### FF-EZ4. The genus-1 identification: tauceti's zetaFunction = Weil's zetaSeries at an elliptic curve

**Candidate statement.** For E/𝔽_q an elliptic curve (mathlib `WeierstrassCurve` + tauceti's
isogeny layer), the two zeta constructions agree: `AlgebraicGeometry.zetaSeries` of the scheme of
E equals (as constant-1 power series) tauceti's `WeierstrassCurve.zetaFunction`
(`Frobenius/Zeta.lean:153`); consequently tauceti's FE `mobiusAutOf_zetaRatFunc` (`:112`) and RH
`norm_eq_inv_sqrt_card_…` (`:244`) transfer to Weil's forms and vice versa; and the Hasse bound
`frobeniusTrace_sq_le_four_mul_card` (`HasseBound.lean:44`) becomes the g = 1 case of FF-EZ1(iii).

**Novelty.** None as mathematics (both compute (1 − a_qT + qT²)/((1−T)(1−qT))); formal-first glue
of the cheapest kind, but it is the canonical *pilot* for the whole FF bridge: it exercises the
tauceti↔Weil seam with no analysis beyond power-series algebra.

**Bridge-essentiality.** Strictly two-corpus (tauceti + Weil statement layer); mathlib provides
the common `WeierstrassCurve`/`PowerSeries` ground. Essential because it is the only place the two
worlds share an *explicitly computed* object.

**Feasibility.** The Weil side needs Stacks *unless* the identification is run against the
restated LeanEval form (which needs E as `Over (Spec F)` with the right instances — mathlib
`EllipticCurve`→`Scheme` bridge exists via `AlgebraicGeometry.EllipticCurve` projective models
[needs check — A7]). Medium; good first probe.

### FF-EZ5. Perfect zero-density: N(σ, T) ≡ 0 off the line, for every curve — the anti-CT contrast theorem

**Candidate statement.** In FF-EZ1's s-plane vocabulary: for every smooth projective curve C/𝔽_q
and every ε > 0 with ε ≠ 1/2-interior… precisely: N_C(σ) := #{zeros of ζ_C with Re > σ} = 0 for
every σ > 1/2, and (zero-free on the left half too, from the functional equation) N_C(σ) = full
count for σ < 1/2 — i.e. the zero-density function is a step function at σ = 1/2, for every
curve, unconditionally. Contrast clause (the new-statement part): for ζ_K, the analogous
N_K(σ) = 0 for σ > 31/32 is the best known uniform theorem (DZZF), and closing 31/32 → 1/2 is RH.
A second contrast: the FF zero set is a finite union of arithmetic progressions on the line
(period 2π/log q, FF-EZ1(iv)) whereas the number-side zero set is conjecturally algebraically
independent of everything.

**Novelty.** Corollary-grade from FF-EZ1 [VERIFIED: nothing in any corpus states a zero-density
statement of any kind for FF zetas]; the *pairing* of the two statements in one theorem (importing
DZZF's `dedekindZeta_ne_zero` as the other conjunct) is a legitimate new formal statement and is
the cheapest possible "window comparison theorem" of tasking point (b).

**Feasibility.** Same as FF-EZ1(ii); the pairing needs DZZF's statement elaborable — confirmed
(`axiommath-bump` logs: "challenge DedekindZetaZeroFree/Challenge/DedekindZetaChallenge.lean: OK").

**Zone ranking by discovery potential (novelty × significance ÷ effort), this lane's call:**
1. **FF-EZ3** (Hecke-over-function-fields Tate dictionary + quasi-RH-with-1/2) — highest ceiling,
   first formal Tate-type statement anywhere; hardest feasibility (Stacks-blocked; Kummer sheaves
   not even in Weil). 2. **FF-EZ2-family** (Lamzouri constants C₀/C₁/C₂ for a function-field
   family via ZZV2's exact Hilbert inequalities) — statement class unclaimed (A5 WARM), clock
   ticking (Suzuki 2610.41115 entering the method space), but needs ensemble explicit-formula
   infrastructure that exists nowhere formally. 3. **FF-EZ1** (s-plane ζ_C, optimal window,
   Hasse–Weil point-count transport) — mostly formal-first/classical, but it is the *dictionary*
   every other zone consumes; best value-to-effort. 4. **FF-EZ5** (perfect zero-density contrast
   vs CT) — corollary-grade off FF-EZ1, cheap, sharp. 5. **FF-EZ4** (genus-1 tauceti↔Weil
   identification) — pure glue, canonical pilot. 6. **FF-EZ2-cheap** (base-change density-1
   simplicity) — elementary, formal-first, warm-up.

---

## §5 Feasibility on our pin (v4.36.0-rc2, mathlib ff2494ea) — what we can and cannot import

- **Weil repo**: lakefile pins mathlib `ff2494ea` = our exact rev [V], HEAD `c1c8983` is the
  project's own re-pin ("Pin toolchain v4.36.0-rc2 and mathlib ff2494ea (cross-math-fronttier
  pin)", git log). BUT: (a) every route to the zeta definitions goes through `StacksFrontier.*`
  imports (`Weil/Definitions.lean:4–6,30`; `DeligneWeilConjecture.lean:3–7` likewise); Stacks is
  **not cloned** (AGENTS.md) and publishes **no olean cache** (GitHub README: "a cache service …
  is planned"), full build ~63k modules; (b) the pinned Stacks rev `012108f6` must itself be
  toolchain-checked against v4.36 [HYPOTHESIS: repo HEAD README says v4.34.0-rc2 — the bump
  compatibility of *that* rev is unverified]; (c) `feasibility/axiommath-bump/logs/` contains no
  Weil build [V]. ⇒ **Direct `import Weil.*` is not currently available at any sane cost.**
  Consumption patterns that survive: (1) restate the mathlib-only statements
  (`LeanEval…weil_conjectures` — its statement uses only `Over`, `Multiset`, `Nat.card`,
  `WeierstrassCurve`-free; ZZV2 `Challenge/Basic.lean:98–189` likewise mathlib-only [V]) as
  hypothesis binders (the hQRH/`EnclOK` precedent); (2) cite-only for everything whose statement
  drags Stacks namespaces (`zetaFunction`, `SatisfiesWeilEstimate`); (3) ask A7 to price a
  *partial* StacksFrontier build (only the modules Weil's Trace/ subtree imports) on Modal —
  likely still very large; flag as probably infeasible near-term.
- **ZetaZerosV2**: builds on our pin (axbump v2-run9 OK, 8262 jobs incl. PrimeNumberTheoremAnd
  [V]); `Challenge/Basic.lean` is mathlib-only statement-grade — the abstract multiset lemmas
  `prop_simple_real_lower/distinct_lower/simple_plus_real_lower/simple_or_real_lower`
  (`:146,155,169,182`) are importable *as statements* today; the proofs sit in
  `Solution/Basic.lean:18–112` behind PrimeNumberTheoremAnd (built OK).
- **DedekindZetaZeroFree**: challenge statement elaborates on our pin (axbump log: "challenge
  DedekindZetaZeroFree…: OK" [V]); full build additionally needs TauCeti @ `d92acc5c` — which is
  *exactly* our local tauceti rev [V] — plus vendored class field theory; full-build status
  untested [flag to A7].
- **tauceti**: direct dependency, same toolchain [V]; the elliptic layer is importable as-is.

---

## §6 Sources consulted

**Weil** (`/home/doz/zcode-workdir/axiommath/Weil/`): README.md (all); lean-toolchain, lakefile.toml,
lake-manifest.json; `Weil/Definitions.lean` (all — zetaSeries :87, SatisfiesWeilEstimate :161,
rationalFrobeniusCharpolyReverse :154, FE sign :198, Euler characteristic :185, good reduction
:298); `Weil/AlgebraicGeometry/EtaleCohomology/Trace/`: ZetaRationality.lean (:139,:170),
DeligneFunctionalEquation.lean (:222,:341), DeligneWeilConjecture.lean (:98,:110,:315,:367 + doc
:35), WeilRiemannHypothesisForm.lean (:206–229), BettiNumber.lean (:48), CharpolyDegree.lean (:67),
CharpolyIntegrality.lean (:222,:231,:260), FieldOfConstantsFrobenius.lean (:89,:163,:207,:239),
FieldValuedPointCount.lean (decl index), LAdicTraceFormulaFinal.lean (:51,:173,:212),
ConnectedComponentsCharpoly.lean (:508); `Weil/Defs/AlgebraicGeometry/EtaleCohomology/Trace/`:
LFunctionRationalSheaf.lean (:87,:98,:104,:111), ZetaSeries.lean (:88,:97,:125,:144);
`Weil/AlgebraicGeometry/EtaleCohomology/Trace/ZetaEulerProduct.lean` (:207,:216);
`Weil/LeanEval/WeilConjectures.lean` (:85,:185–329); `Weil/AlgebraicGeometry/EtaleCohomology/Curves/`
(dir listing + module docs — μ_n/𝐆_m cohomology, no zeta content); rg absence checks: point-count
inequalities, genus, Hasse.

**DZZF** (`…/axiommath/DedekindZetaZeroFree/`): README.md; `DedekindZetaZeroFree/Main.lean` (all);
`DedekindZetaZeroFree/HeckeCorollary.lean` (all); `Challenge/DedekindZetaChallenge.lean` (RayClassCharacter :14);
`DedekindZetaZeroFree/Nonvanishing/Mellin/Quantitative/DedekindZetaNonvanishing.lean` (:13);
lakefile.toml; TauCeti-usage rg census (TauCeti.SU ×85 etc., 35 files).

**ZZV2** (`…/axiommath/ZetaZerosV2/`): README.md; `Challenge/Basic.lean` (all 283 lines);
`Solution/Basic.lean` (decl index :18–:112); lakefile.toml (PNT+ rev, mathlib rev), lean-toolchain.

**tauceti** (`/home/doz/zcode-workdir/tauceti/`, rev d92acc5c):
`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Frobenius/Zeta.lean` (:93,:112,:153,:158,:184,:201,
:220,:232,:244); `TauCeti/AlgebraicGeometry/EllipticCurve/HasseBound.lean` (:44);
`TauCeti/NumberTheory/LFunctions/` (dir listing: Data, Dirichlet, DedekindZeta, Grossencharacter,
Hecke, Theta, Zeros); function-field rg census (ring theory only).

**mathlib** (`…/encore-mathlib/repo/mathlib4/`, ff2494ea):
`Mathlib/NumberTheory/FunctionField.lean` (head); `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean`
(:43–:84); rg absence checks (`zetaFunction`, `zetaSeries`, `Hasse`, `frobeniusTrace` → 0 in
relevant dirs).

**Literature** (web, this session): Cureton–Thorner, *A quasi-Riemann hypothesis for Dedekind zeta
functions*, hexagonmath.org/2610.00200v1 (Thm 1.1 = 31/32 all ζ_K; Cor 1.2 finite-order Hecke;
method = Kazhdan–Patterson metaplectic, cubic Gauss sums, Kubota); Lamzouri (via ZZV2 README +
Challenge docstrings: C₀, C₁, C₂ constants); Bui–Florea arXiv:1605.07092 (1-level density + pair
correlation, hyperelliptic ensemble H_{2g+1}, secondary terms q^{−4g/3}/g, "lower bounds for the
proportion of simple zeros" — occupies the input side of FF-EZ2); **Suzuki arXiv:2610.41115
(2026-10-30)**, spectral theory of FF zeta functions via Hilbert spaces from the Weil quadratic
form — the method-neighbor of the ZZV2 port, no proportions (via A5 round-4 FF-6 + positioning
this lane); Faifman–Rudnick arXiv:0803.3534 and Rudnick arXiv:0811.3649 (fixed-q, g → ∞ zero-count
CLT and high-power Frobenius trace statistics — counts/traces, not multiplicities); DLRT
arXiv:1908.04876 (ζ_K distinct-zero proportion via SDP; number-side nearest miss, dossier-42
territory); Katz–Sarnak 1999 (book; monodromy = family limits only); Entin–Roditty-Gershon–Rudnick
2012, Andrade–Miller–Pratt–Trinh 2014, Meisner–Södergren 2021, Darbar–Lumley 2021,
Çiçek–Darbar–Lumley 2025, Ahlquist 2025 (low-lying zeros over function fields — occupies FF
spacing/density as classical); AxiomMath/Stacks GitHub README (StacksCore vs StacksFrontier; no
olean cache, "planned"; ~63k modules; README toolchain v4.34.0-rc2 at HEAD); hexagonmath.org
index sweep (no function-field L-function work; Boyang Hu's function-field Langlands series is
the nearest, different layer); lane A5's pre-registered queries FF-1–FF-7
(`research/novelty/round-4.md:92–102`) cross-checked against this lane's independent searches.

Search patterns used for absence claims: `pointCount.*≤` (Weil — none);
`zetaFunction|zetaSer` (mathlib — none); `hasse|frobeniusTrace` (mathlib NT/AG — none);
`simple zeros function field`, `Tate thesis Lean`, `constant field extension zeta curve`
(arXiv API); `functionfield|function field` (tauceti — ring theory only).

Search patterns used for absence claims: `pointCount.*≤` (Weil — none);
`zetaFunction|zetaSer` (mathlib — none); `hasse|frobeniusTrace` (mathlib NT/AG — none);
`simple zeros function field`, `Tate thesis Lean`, `constant field extension zeta curve`
(arXiv API); `functionfield|function field` (tauceti — ring theory only).
