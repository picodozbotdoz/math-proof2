# Pilot pre-work — dossier 20 (hecke-zetaK-zero-density): scoping the E5 cost driver

Lane R5 (ant-bridge), 2026-11-09. Scopes the Weil-explicit-formula-for-
theta-lattice-L obligation that dominates dossier 20's Effort-5 grade
(`research/candidates/20-hecke-zetaK-zero-density.md` § Feasibility F3.b).
Coordination: **do not duplicate pilot 22-M1 (R3) or pilot 42 (= 20-V1, R1)**;
this prework covers what those pilots do NOT: the V2 engine instantiation for
the Hecke family. Cross-refs: `research/pilots/42-blueprint.md` (R1's
conditional core), `research/pilots/42/M1.lean`, `research/bridges/
tauceti-contributions.md` §2 (R1's C1–C3), `research/bridges/analytic-nt.md`
§4 E1. Tags: [VERIFIED]/[HYPOTHESIS].

## (a) Statement inventory — what exactly must be proved for the Hecke instance

Engine interface [VERIFIED, `Zeta23/ThmE/Hypotheses.lean:127`]: the target is
`PaperInputsChi κ q c Z` for `Z` = the zero config of the Hecke L. Its six
fields decompose into four obligations (three new, three verbatim — see (b)):

**O1. `EF : ExplicitFormulaPaperChi κ q c Z`** (`ThmE/Hypotheses.lean:80`).
For all L > 0 and f, g ∈ C²_c with support in [−L/2, L/2]:
`Z.W f g = ∫_ℝ paperFT f · conj(paperFT g) · nuXc κ q c (e^L)`,
with the two absolute-convergence assertions (W-summability over Z.carrier;
integrability of the density), where `nuXc κ q c = muq κ q + PXc c`
(`:60`, `muq :48`, `PXc :55`). For the Hecke instance:
- `muq κ q` is consumed **verbatim** (digamma at shifted arguments; already
  (κ,q)-generic, `GammaFactsChiProof.lean` proves its fields for all κ, q).
- `PXc c X τ = −(1/π) Re ∑_{n≤X} Λ(n)·c(n)·n^{−1/2−iτ}` must be replaced by
  the ideal sum `−(1/π) Re ∑_{N(𝔞)≤X} Λ_𝔞·χ(𝔞)·N(𝔞)^{−1/2−iτ}` with
  Λ_𝔞 := openai's `IdealMangoldt.value` — **this re-indexing is a design
  decision**: either (i) restate `PXc`/the engine over `ℕ → ℂ` coefficient
  data attached to ideals-by-norm (enumerating ideals by norm into ℕ —
  keeps the engine untouched, adds a bookkeeping layer), or (ii) generalize
  the engine's index type once (the field enters only through `PXc`, so the
  surgery is localized to `ThmE/Hypotheses.lean:55–60` + the PrimeSide
  consumers `ThmE/{PrimeSideChi,PPChi,CrossMuPChi}.lean`). [HYPOTHESIS:
  (ii) is cleaner; estimate M either way.]
- The contour proof of O1 for ζ is `Zeta23/WeilEF/{Contour,VerticalLine,
  FullLine,GammaRBracket,Horizontal,Landau,Effective,ZeroSumLimit,
  ZeroSummability,ZeroSummabilityGen}.lean`; for Dirichlet the same skeleton
  re-run at `ThmE/{ContourChi,VerticalLineChi,FullLineChi*,HorizontalChi,
  LandauChi,EFLitChi}.lean`. The Hecke version must run the same skeleton
  over openai's theta-lattice presentation (`SevenEighths.HeckeTheta.pair`
  is already a `WeakFEPair ℂ`; `latticeL w s = π^s·Γ(s)⁻¹·(pair w).Λ s`,
  `HeckeSevenEighths.lean`).

**O2. `RvM : RiemannVonMangoldtChi q Z`** (`ThmE/Hypotheses.lean:90`):
- `main`: `|Z.N T (2T) − (T/2π)·ell1q q T| ≤ C·log T` (count asymptotic);
- `local_count`: `Z.N t (t+1) ≤ A₀·log(|t|+3)` — Backlund-type.
Templates: ζ `Zeta23/RvM/{CountByIntegral,Fold,MainTerm,LocalCount}.lean`
(+ `RvM/Backlund.lean:12 backlund_horizontal`); χ `ThmE/{RvMChi,BacklundChi,
LocalCountChi,CountByIntegralChi,FoldChi,GammaSideChi,MainTermChi}.lean`.

**O3. `chebq : ChebyshevMertensCoprime q`-analogue** (`:117`): the Λ²
moment asymptotics for the (ideal-)restricted coefficients; Dirichlet
template `ThmE/ChebCoprime.lean`; Hecke raw material: openai's
`IdealMangoldt.value` + `Hecke/PrimeDyadic*.lean` estimates
(`PrimeDyadic.lean:22–24 series/series_eq_tsum` is the log-derivative Euler
expansion over ideals).

**Zero-config seam (O0, prerequisite)**: carrier/mult/strip/reflection/
finite-window for the Hecke L (`ZeroConfig`, `Zeta23/Defs.lean:120`;
template `ZetaSeam` + `zetaZeros`, `Zeta23/Statement.lean:75–95`).
Reflection ρ ↦ 1−ρ̄ from the FE pair (`functional_equation`,
`Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean:427`); finiteness from
openai's `meromorphicNFOn`-style presentation for the tauceti-side Hecke
(`TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:88`) or from
mathlib's `ZetaZeros.lean:68` pattern.

## (b) Donor substitution map — openai Ostmann/ZeroDensity & Hecke trees replacing zeta23 template pieces

| zeta23 template piece | openai donor (file:decl) [VERIFIED] | substitution mode |
|---|---|---|
| `WeilEF/ZeroSummability*.lean` (zero-sum absolute convergence) | `Ostmann/ZeroDensity/SmoothExplicitFormulaCore.lean:75 SmoothExplicitFormulaCore.absolute_summability`; `:53 smoothZeroTerm_bound_of_mellin` | partial replace: statement shapes differ (their enumeration `ComplexZeroEnumeration χ` vs zeta23's `Z.Wsummand`); proof technique (Mellin-side bounds) ports |
| `WeilEF/Contour.lean` + `VerticalLine.lean` (contour → EF, ζ-specific) | **no Hecke-side equivalent — this is the E5 driver and must be written new**; nearest: `Hecke/BoundaryIntegration.lean:58 LFunction_ne_zero_of_re_eq_one`, `:69 LFunction_ne_zero_of_one_le_re` (nonvanishing inputs the contour argument needs), `Hecke/{Conjugation,Coordinates,IdealBridge}.lean` (presentation plumbing) | NEW (write) consuming donors |
| `RvM/LocalCount.lean` + `Backlund.lean:12` (local count ≪ log) | `Ostmann/ZeroDensity/CharacterLocalZeroCount.lean:62 PrimitiveComplexCharacter.local_zero_mass_bound`: local disk zero mass (with multiplicity, via `divisor`) ≤ log(48·q·(|t|+2))/log(14/13) — **same shape as zeta23's local_count, Jensen-based instead of Backlund-based, with an explicit constant** | strong replace for the χ-side; must be re-derived for the Hecke lattice (their `χ.L` is Dirichlet; the Jensen argument runs on any L with their `L_disk_bound` input, `:43`) |
| `RvM/MainTerm.lean` (N(T,2T) main term) | `Ostmann/ZeroDensity/CharacterFullZeroCount.lean:12 PrimitiveComplexCharacter.full_zero_sum_rate`: ∑_{z∈S} ord ≤ (32/log(14/13))·(T+1)·log(q(T+2)) | partial replace: gives the ORDER of the count (enough for RvM `main` up to constants? — it bounds finite subsets S, so taking S = window gives an upper bound only; the main term with (T/2π)ℓ₁ coefficient still needs the argument-principle computation — template `RvM/CountByIntegral.lean` + tauceti `argumentPrinciple_nullHomologous`, `Analysis/Contour/Argument/Cycle.lean:110`) |
| `ThmE/BacklundChi.lean` (horizontal variation bound) | `Ostmann/ZeroDensity/CharacterContourGrowth/CharacterContourLogGrowth.lean` + `DirichletLogDerivativeBound.lean` (log-derivative growth on contours) | replace (theirs is uniform-in-q; ours needs fixed-K only) |
| `ThmE/ChebCoprime.lean` (Λ² moments, coprime-restricted) | `Hecke/PrimeDyadic*.lean` (dyadic prime-ideal estimates), `Hecke/PrimePowers.lean`, `Ostmann/ZeroDensity/PrimeLogDensityBounds.lean` | partial: the moment ASYMPTOTICS (cheb2a/cheb2b two-sided forms) are not stated in openai — must be derived from their one-sided dyadic bounds + partial summation [HYPOTHESIS: M] |
| `Cheb.chebyshevMertens` (plain Λ moments) | — | **verbatim reuse** (coefficient-free) |
| `MV/Final.lean:30 mv_hilbert` (Hilbert inequality, ∃C form) | — | **verbatim reuse** |
| `GammaFactsChiProof.lean` (all (κ,q)) | — | **verbatim reuse** |
| `WeilEF/Landau.lean` (log-derivative partial fractions: `:299 logDeriv_partial_fraction_unit`, `:348 _disk`, `:512 zeta_logDeriv_partial_fraction`) | `Ostmann/ZeroDensity/{CompletedPartialFractionLimit,CompletedFiniteLogDerivative}.lean` | dual donors; zeta23's shape is what the engine consumes — prefer porting zeta23's and re-proving over the Hecke L |

Bottom line: openai's tree substitutes for the **local count** (O2.local,
strongly — with a better constant method), the **zero-sum summability**
(partially), and provides the **nonvanishing boundary inputs**
(`LFunction_ne_zero_of_re_eq_one`) and the **ideal prime-side raw material**
(O3); the **contour→EF assembly itself (O1) has no Hecke-side donor and is
the genuinely new work** — precisely the E5 driver.

## (c) Two-assembly comparison (V1 vs V2), per-piece effort

V1 = R1's min-of-fractions (ζ_K only); V2 = engine instantiation (both
families). Pilot 42-M1 [VERIFIED, `research/pilots/42-blueprint.md` §1]
already builds the conditional core: `ZeroMult`/`EpsLower`/`assemble_eps`/
`zetaK_two_thirds`/`zetaK_count_of_factorization` (~300–360 LoC, sorry-free,
zero ports) — i.e. V1's *assembly* layer exists as soon as M1 lands.

| piece | V1 (ζ_K) | V2-ζ_K | V2-Hecke |
|---|---|---|---|
| window/counting defs (O0-lite) | **done by 42-M1** | same | S (restate for Hecke L; `analyticOrderNatAt`, mathlib `Order.lean:63`) |
| multiplicity glue (factorization) | S (42-M1 item 3 proves it from `analyticOrderNatAt_mul`, `Order.lean:565`; M2 discharges via tauceti) | — (not needed; engine counts directly) | — |
| density inputs | binders = zeta23 submitted A/E (M2 port, S–M per 42-blueprint) | O1+O2+O3 for ζ_K | O1+O2+O3 for Hecke L |
| O1 EF | not needed | M–L | **L (the driver)** |
| O2 RvM | not needed | M (templates complete) | M–L (main term via argument principle + `local_zero_mass_bound`-style Jensen) |
| O3 chebq | not needed | S–M (`ChebCoprime` template ≈ verbatim: quadratic χ is Dirichlet) | M (ideal-indexed; openai raw material) |
| engine assembly | 42-M1 `assemble_eps` | **verbatim** (`ThmE/Final.lean:29–105`) | verbatim + index-generalization if route (ii) |
| **total** | **S–M** (mostly done by 42-M1/M2) | **M–L** | **L** (> 10k LoC) |

**Recommendation**: ship **V1 first — it is already pilot 42**; after M2
discharges the factorization binder, nothing of V1 remains. For V2, sequence
**V2-ζ_K before V2-Hecke**: it exercises the identical engine path (O1–O3
discharge → `thmE_A_lam`-assembly) with every template already in-repo
(zeta23's own ThmE files), producing the first *engine-instantiated*
number-field density theorem as the stepping stone; V2-Hecke then swaps the
Dirichlet templates for the openai donors per the (b) map, with the new
contour-assembly (O1-Hecke) as the only L-grade piece. Estimate to
V2-ζ_K: ~3–6k LoC (M–L); to V2-Hecke: > 10k additional (L).

## (d) Risks

- **Toolchain**: target v4.36.0-rc2 (`ff2494ea`). zeta23 (v4.33.0-rc2,
  Mathlib `51e6992e`) statement-ports ≈ 0 breakage per R9 probe §3-B1, but
  the engine files to be *consumed* (ThmE tree) are large proof bodies —
  re-fix cost M (probe caveat: statements ≠ proofs). openai-math (v4.34.1)
  statement-ports clean per R9 §7 [task brief; consistent with probe B
  pattern]; its proof trees are NOT ported — cite-as-donor + restate.
  tauceti is native v4.36 (no port). **Combining rule**: build V2 in a fresh
  v4.36 package; port zeta23 *statements* (engine interface + submitted
  theorem shapes) immediately; port proofs only file-by-file as consumed;
  restate openai donor lemmas as hypothesis-props first (pilot-42 posture),
  discharge later — this keeps every milestone sorry-free-checkable.
- **Index mismatch** (ℕ-engine vs ideal coefficients): decide route (i)
  enumerate-by-norm vs (ii) engine re-index early — it touches `PXc`
  (`ThmE/Hypotheses.lean:55–60`) and three PrimeSide consumers.
- **Presentation mismatch**: openai's Hecke L is theta-lattice (`latticeL`,
  `pair w` FE), zeta23's engine is Dirichlet-series-shaped; the
  `HasDirichletAgreement`-style bridge (Euler product ↔ lattice sum,
  openai `Hecke/{Euler,IdealBridge}.lean` + tauceti
  `heckeLFunctionC`-normal-form route, `LFunctions/Hecke/Basic.lean:74`)
  must compose — two independent presentations of the same objects exist
  (openai's and tauceti's); pick ONE as the interface (recommend tauceti's
  `MeromorphicNFOn` normal form for the seam, openai's for the estimates).
- **`ell1q` constant**: the engine's `main` field is stated with `ell1q q T`
  (`log(qT/2π)+2log2−1`, `ThmE/Hypotheses.lean:43`) — for the Hecke family
  q means the analytic conductor (D_K·N𝔣); definitional care, not math.
- **Analytic-estimate gaps**: openai's dyadic bounds are one-sided; cheb2a/
  cheb2b need two-sided asymptotics [HYPOTHESIS M — derivable, unverified].
- **Novelty dependency**: V2-Hecke's value rides on R8 round-2 confirming
  no Hecke-L proportion result in the literature (dossier 20 novelty §).
