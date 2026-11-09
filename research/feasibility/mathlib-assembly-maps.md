# mathlib assembly maps (lane R3 continuation) — Phase-3 feasibility inputs

Companion to `research/survey/mathlib-frontier.md` (same checkout: mathlib `ff2494ea5e43`,
#45821, 2026-11-09; toolchain `v4.36.0-rc2`; module-era tree). For each bridge direction:
mathlib base (verified decls), donor decls (re-verified by reading the anthropics sources this
session — not from memory), the missing glue as named Lean-style theorem signatures, an effort
rating S(<1k LoC)/M/L(>10k LoC), and risks. All donor paths relative to
`/home/doz/zcode-workdir/anthropics_formal-math/`.

---

## A. PNT-class assembly (WienerIkehara + ζ-nonvanishing + vonMangoldt log-derivative)

### A.0 Re-verification that mathlib lacks the PNT (recorded searches)

Searches over `/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4/Mathlib/`:

1. `grep -rn 'PrimeNumberTheorem' Mathlib/` → exactly 3 hits, all prose, 0 declarations:
   - `Mathlib/NumberTheory/LSeries/WienerIkehara.lean:2` (copyright "The PrimeNumberTheoremAnd
     contributors"), `:52` ("This file is adapted from the `PrimeNumberTheoremAnd` project"),
   - `Mathlib/NumberTheory/Chebyshev.lean:56` ("Parts of this file were upstreamed from the
     PrimeNumberTheoremAnd project by Kontorovich et al").
2. `Mathlib/NumberTheory/PrimeCounting.lean` (the file 3sum-apsp imports for Bertrand-type
   counts): the only `Tendsto` results are `tendsto_primeCounting'` (:98) and
   `tendsto_primeCounting` (:102) — both `π → ∞` (divergence), no `π ~ x/log x`.
3. `Mathlib/NumberTheory/Chebyshev.lean`: `eventually_primeCounting_le` (:832) is the
   asymptotic *upper* bound `∀ε>0, eventually π x ≤ (1+ε)·x/log x`; the file header (:43-45)
   lists only upper bounds + `psi_ge`; **no matching `(1−ε)` lower bound** exists (grep for
   `le_primeCounting`/lower-bound forms: no hits beyond `psi_ge`). Also present:
   `primeCounting_eq_theta_div_log_add_integral` (:668, exact identity),
   `integral_theta_div_log_sq_isBigO` (:791), `isBigO_psi_sub_theta_sqrt` (:639).
4. No `AsymptoticallyEquivalent`/`isTheta` statement about `primeCounting`/`ψ`/`θ` anywhere in
   `Mathlib/NumberTheory/` (grep: 0 hits).

**Conclusion: PNT (in any equivalent form: ψ ~ x, θ ~ x, π·log x / x → 1) is absent.** The
asymptotic upper bound (:832) is the closest existing statement.

### A.1 mathlib base (all verified this session)

| Role | Declaration | file:line |
|---|---|---|
| Tauberian engine | `WienerIkehara.tendsto_sum_range_div` | `Mathlib/NumberTheory/LSeries/WienerIkehara.lean:693` |
| — hypotheses | `bound : ∀ n, ∑ i ∈ .range n, f i ≤ C * n`, `hG : ContinuousOn G {s | 1 ≤ s.re}`, `hG' : EqOn G (fun s ↦ LSeries ↗f s - A / (s - 1)) {s | 1 < s.re}`, `hpos : 0 ≤ f` | same file :105-107 |
| Chebyshev bound (= `bound` for f = Λ) | `Chebyshev.psi_le_const_mul_self` | `Mathlib/NumberTheory/Chebyshev.lean:485` |
| −ζ′/ζ identity (= `hG'` witness on re>1) | `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (`L ↗Λ s = - deriv riemannZeta s / riemannZeta s`, 1 < re s) | `Mathlib/NumberTheory/LSeries/Dirichlet.lean:439-442` |
| input summability | `ArithmeticFunction.LSeriesSummable_vonMangoldt` | Dirichlet.lean:384 |
| nonvanishing (continuity off s=1) | `_root_.riemannZeta_ne_zero_of_one_le_re` | `Mathlib/NumberTheory/LSeries/Nonvanishing.lean:417` |
| differentiability of ζ | `differentiableAt_riemannZeta` (s ≠ 1) | `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:139` |
| residue (= pole constant A = 1) | `riemannZeta_residue_one` | RiemannZeta.lean:242 |
| final assembly identities | `primeCounting_eq_theta_div_log_add_integral` (:668), `integral_theta_div_log_sq_isBigO` (:791), `isBigO_psi_sub_theta_sqrt` (:639) | Chebyshev.lean |

The Wiener–Ikehara file itself is provenance-tagged PrimeNumberTheoremAnd (:2,:52) and is
imported by no other mathlib file — the assembly point is real and intentional.

### A.2 Donor: zeta23's FromPNTPlus port (re-verified)

- `zeta23/Zeta23/FromPNTPlus/Mertens.lean` — port of PrimeNumberTheoremAnd `Mertens.lean`
  (header provenance block lists: `Mertens.integral_log_le`, `Mertens.sum_log_ge`,
  `Mertens.sum_log_eq_log_factorial`, `Mertens.sum_log_eq_sum_mangoldt`, `Mertens.E₁Λ`,
  `Mertens.sum_mangoldt_div_eq`, `Mertens.E₁Λ.ge/.le/.bounded'`), **truncated after
  `E₁Λ.bounded'`**: "everything later — the sorry'd `E₁Λ.bounded`, the prime-form/second/third
  theorems — is not ported; no sorry enters". So the port stops exactly at the PNT doorstep.
- `zeta23/Zeta23/FromPNTPlus/MediumPNT.lean` — port of PrimeNumberTheoremAnd `MediumPNT.lean`
  (provenance header: v4.29.0 port, re-adjusted for v4.33.0-rc2/Mathlib 51e6992e): key decls
  `psi_eq_sum_range` (:42), `LogDerivativeDirichlet` (:51),
  `SmoothedChebyshevDirichlet` (:204), `SmoothedChebyshevClose` (:606),
  `dlog_riemannZeta_bdd_on_vertical_lines` (:764). This is the *smoothed-Chebyshev* alternative
  route to PNT-class results, self-contained on Mathlib + these files.
- Supporting: `FromPNTPlus/ZetaBounds.lean`, `ZetaConj.lean`, `MellinCalculus.lean`,
  `ResidueCalcOnRectangles.lean`, `Sobolev.lean`, `SmoothExistence.lean`, `EulerMaclaurin.lean`
  (file list verified by `ls`).

### A.3 Missing glue (named signatures)

With `Λ := ArithmeticFunction.vonMangoldt`, `ψ := Chebyshev.ψ` (notation as in Chebyshev.lean):

```lean
-- G1. Laurent constant of ζ at 1 (the only genuinely missing analytic fact on mathlib's side).
theorem exists_tendsto_riemannZeta_sub_inv :
    ∃ c : ℂ, Tendsto (fun s ↦ riemannZeta s - 1 / (s - 1)) (𝓝[≠] 1) (𝓝 c)

-- G2. Continuity of the subtracted log-derivative on the closed half-plane (from G1 + chain rule).
theorem continuousOn_riemannZeta_logDeriv_sub :
    ContinuousOn (fun s ↦ -deriv riemannZeta s / riemannZeta s - 1 / (s - 1)) {s : ℂ | 1 ≤ s.re}
    -- understood with the removable value at s = 1; concretely: ∃ G, ContinuousOn G {1 ≤ re ·} ∧
    --                    EqOn G (fun s ↦ -ζ' s / ζ s - 1/(s-1)) {1 < re ·}

-- G3. The Wiener–Ikehara plug for Λ (bound hypothesis, ℕ-range form).
theorem range_sum_vonMangoldt_le (C : ℝ) : ∀ n, ∑ i ∈ Finset.range n, (Λ i : ℝ) ≤ C * n
    -- from Chebyshev.psi_le_const_mul_self (:485) + ψ = ∑ Λ (:93)

-- G4. ψ/x → 1  (the ψ-form PNT).
theorem tendsto_psi_div_atTop : Tendsto (fun x ↦ Chebyshev.ψ x / x) atTop (𝓝 1)
    -- WienerIkehara.tendsto_sum_div (:700) with f := fun n ↦ (Λ n : ℝ), A := 1, G from G2

-- G5. θ/x → 1 (from isBigO_psi_sub_theta_sqrt :639).
theorem tendsto_theta_div_atTop : Tendsto (fun x ↦ Chebyshev.θ x / x) atTop (𝓝 1)

-- G6. The π-form PNT (mathlib's canonical target statement).
theorem tendsto_primeCounting_mul_log_div_atTop :
    Tendsto (fun x ↦ (Nat.primeCounting ⌊x⌋₊ : ℝ) * Real.log x / x) atTop (𝓝 1)
    -- from G5 + primeCounting_eq_theta_div_log_add_integral (:668)
    --                                    + integral_theta_div_log_sq_isBigO (:791)
```

G1 is the only new *theorem with mathematical content*; G2–G6 are adapters over existing mathlib
identities. Donor shortcut for G1/G2: `MediumPNT.lean`'s `LogDerivativeDirichlet` (:51) +
`dlog_riemannZeta_bdd_on_vertical_lines` (:764) already contain the required local analysis for
the vertical-line strip; the residue computation at s=1 is in
`FromPNTPlus/ResidueCalcOnRectangles.lean`.

### A.4 Effort: **S–M** (≈0.5–1.5k LoC)

All ingredients exist in mathlib; the work is (i) G1 (a one-pole Laurent computation from
`riemannZeta_residue_one` :242 + differentiability :139 — or a direct port of the PNTA lemma),
(ii) honest bookkeeping between `Finset.range` sums (WienerIkehara's `bound` form) and
`Chebyshev.ψ` (`Icc 0 ⌊x⌋₊` form, `psi_eq_sum_Icc` :93). The PNTA project itself plus zeta23's
port show the route compiles in this API family. Not S: G1 needs real ε–δ work at the pole.

### A.5 Risks

- **G1 direction subtlety**: continuity on the whole closed half-plane needs uniformity in the
  imaginary direction only through continuity (pointwise suffices — `ContinuousOn` is pointwise);
  no vertical-strip bounds needed for the basic PNT. Lower risk than it looks.
- `LSeries ↗f` (WienerIkehara, ℂ-coercion) vs `fun n ↦ (Λ n : ℝ)` — a `Nat.cast`-shim is needed
  (`LSeries_congr`-style); type-level mismatch ℝ↔ℂ is mechanical but touches every step of G4.
- zeta23's port targets Mathlib 51e6992e (v4.33.0-rc2) — this checkout is v4.36.0-rc2; expect
  `grw`/`fun_prop` attribute drift, not mathematical drift.
- **Novelty note (for Phase 3)**: PNT itself is *not* a new theorem (known math, formalized in
  PNTA/isabelle). Its value here is pipeline validation and completing an intentional mathlib
  assembly point; any *new-theorem* dossier in this zone should go beyond it (e.g.
  Chebyshev–Mertens constants as in `H-cheb` below, or ψ(x) = x + O(√x log²) conditional forms).

---

## B. RvM / N(T) donation (zeta23 `Zeta23/RvM/` → mathlib zeta-zero counting)

### B.1 mathlib base

- `riemannZetaZeros : Set ℂ := riemannZeta ⁻¹' {0}` — `Mathlib/NumberTheory/LSeries/ZetaZeros.lean:37`
- `IsCompact.inter_riemannZetaZeros_finite` (finiteness in any compact window) — ZetaZeros.lean:68
- `analyticOrderNatAt` (multiplicity) — `Mathlib/Analysis/Analytic/Order.lean:63`
- `completedRiemannZeta₀` — `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:64` (the function the
  donor actually integrates); functional equation :106; `hardyZ` (HardyZ.lean:76) for line-side
  statements.
- Contour API: `Mathlib/Analysis/Complex/CauchyIntegral.lean` (1065 lines): Cauchy–Goursat for
  rectangles (:300, :313), circle-integral formula, annulus versions (:369, :396). **No residue
  theorem with poles, no rectangle-argument-principle, no winding-number-valued integral** —
  verified absent (grep `Rouch|argument principle|winding` → 0 relevant hits).

### B.2 Donor (zeta23, re-verified)

- Counting-function framework (abstract, mathlib-independent):
  - `structure ZeroConfig` — `zeta23/Zeta23/Defs.lean:120-134` (carrier, mult, strip, reflection
    symmetry, `finite_window`); `Z.window T₁ T₂` (:140, `{ρ | T₁ < ρ.im ∧ ρ.im ≤ T₂}`),
    `Z.N T₁ T₂ := ∑ᶠ ρ ∈ Z.window T₁ T₂, Z.mult ρ` (:146), plus `Nd`, `N0`, `N0star`, `N0s` (:150-160).
  - `structure RiemannVonMangoldt (Z : ZeroConfig)` — `zeta23/Zeta23/Hypotheses.lean:67-71`:
    `main : ∃ C T₀, ∀ T ≥ T₀, |(Z.N T (2*T) : ℝ) - T/(2π)*ell1 T| ≤ C*log T` (ell1 at
    `Defs.lean:52`), `local_count : ∃ A₀ ≥ 1, ∀ t, (Z.N t (t+1) : ℝ) ≤ A₀*log(|t|+3)`.
  - Instantiation: `def zetaZeros (hs : ZetaSeam) : ZeroConfig` — `Zeta23/Statement.lean:88`;
    `def zetaZeroConfig` — `Zeta23/Statement/SeamClosed.lean:26`.
- The theorem: `Zeta23.RvM.riemannVonMangoldt (hΓ : GammaFacts) : RiemannVonMangoldt
  zetaZeroConfig` — `zeta23/Zeta23/RvM/Statement.lean:20` (conditional on Γ-facts "by design").
- **The Γ-condition is discharged**: `theorem gammaFacts : GammaFacts` —
  `zeta23/Zeta23/GammaFacts/Complete.lean:30` (structure at `Zeta23/Hypotheses.lean:125-132`;
  includes the Stirling-type bound `|μ τ - (1/2π)·log(|τ|/2π)| ≤ C/τ²`). So
  `riemannVonMangoldt gammaFacts` is an unconditional proved statement.
- Contour machinery (the part mathlib lacks): `zeta23/Zeta23/Analytic/RectangleLogDeriv.lean` —
  `residueTheorem_finset` (:31, residue theorem on a rectangle for finitely many simple poles),
  `finite_zeros_rectangle` (:143), `rectangleIntegral'_mul_logDeriv(_')` (:352, :365 — rectangle
  argument principle). Applied at `Zeta23/RvM/CountByIntegral.lean:98
  rectangleIntegral'_logDeriv_completedZeta_eq_Ncount` (imports `Zeta23.Analytic.RectangleLogDeriv`,
  verified). RvM file inventory (14 files, `ls`-verified): `BacklundDefs/Backlund.lean`,
  `CountByIntegral.lean`, `Defs.lean`, `Fold.lean`, `GammaSide.lean`, `Halving.lean`,
  `LocalCount.lean`, `MainTerm.lean`, `NcountWindow.lean`, `ReZeroCount.lean`,
  `Statement.lean`, `ZetaGrowth.lean`.

### B.3 Missing glue (mathlib-native N(T))

```lean
-- B1. mathlib-native counting function (definition, in the ZetaZeros namespace).
noncomputable def riemannZetaZeroCount (T₁ T₂ : ℝ) : ℕ∞ :=
  ∑ᶠ ρ ∈ riemannZetaZeros ∩ {ρ | T₁ < ρ.im ∧ ρ.im ≤ T₂}, (analyticOrderNatAt riemannZeta ρ : ℕ∞)

-- B2. Window finiteness in the ordinate (strip-shaped, not compact — needs the argument
--     principle or Jensen; donor: ZeroConfig.finite_window instance for zetaZeroConfig).
theorem riemannZetaZeroCount_lt_top : ∀ T₁ T₂ : ℝ, riemannZetaZeroCount T₁ T₂ < ⊤

-- B3. Rectangle argument principle (donor RectangleLogDeriv.lean:31/:352, restated for
--     mathlib's `integralBoundaryRect` API of CauchyIntegral.lean).
theorem rectangleIntegral_logDeriv_eq_zeroCount {f : ℂ → ℂ} (hanalytic : ...) {z w : ℂ}
    (hno_zero_on_boundary : ...) :
    (∮ ∂Rectangle z w, f' s / f s) = 2 * π * I * (Σᶠ poles inside, order)

-- B4. Multiplicity agreement: donor `mult` (ZeroConfig) = mathlib `analyticOrderNatAt`.
theorem zetaZeroConfig_mult_eq (ρ : ℂ) (hρ : ρ ∈ zetaZeroConfig.carrier) :
    zetaZeroConfig.mult ρ = analyticOrderNatAt riemannZeta ρ

-- B5. The target: Riemann–von Mangoldt, N(T,2T) form (donor Hypotheses.lean:67 `main`).
theorem riemannVonMangoldt_riemannZetaZeros :
    ∃ C T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      |(riemannZetaZeroCount T (2*T) : ℝ) - T / (2*Real.pi) * (Real.log (T/(2*Real.pi)) + 2*Real.log 2 - 1)|
        ≤ C * Real.log T

-- B6. Local count (donor `local_count`, needed by every density theorem downstream).
theorem riemannZetaZeroCount_window_le :
    ∃ A₀ : ℝ, 1 ≤ A₀ ∧ ∀ t : ℝ, (riemannZetaZeroCount t (t+1) : ℝ) ≤ A₀ * Real.log (|t| + 3)
```

### B.4 Effort: **M–L** (donor-side ~5k LoC of RvM+Analytic to rebase; new mathlib-side content B1–B3 ≈ 1–2k)

The donor proves everything; the cost is (i) rebasing `RectangleLogDeriv` + `RvM/` from the
zeta23 import universe onto mathlib namespaces (`riemannZetaZeros`, `analyticOrderNatAt`,
`completedRiemannZeta₀` — the donor already builds on `completedRiemannZeta₀`, per
`survey/anthropics.md` §3), (ii) B2/B4 seam-matching between donor `ZeroConfig.mult` and mathlib
`analyticOrderNatAt`.

### B.5 Risks

- **`∑ᶠ` over a `Set` vs donor's structure**: donor multiplicities are a function `mult` with
  `finite_window` as a field; mathlib would need the ordinate-finiteness (B2) *before* the count
  is well-behaved — this is exactly what the argument principle provides; ordering of the build
  matters.
- `analyticOrderNatAt` returns `ℕ` with a junk convention (0 when not analytic — Order.lean:70);
  at zeros of the *meromorphic* ζ (s=1 pole) the count must exclude s=1 — definitional care in B1.
- Donor is ℂ-completed-zeta-based (`completedRiemannZeta₀`), mathlib zero set is `riemannZeta`
  (`ZetaZeros.lean:37`) — they differ at s=0,1 (the completed function has poles/zeros there);
  the window convention `0 < Im ρ` makes the seam clean, but each boundary case is a lemma.
- No winding-number API in mathlib means `rectangleIntegral'` conventions (donor) cannot be
  matched to any existing mathlib definition — the donation *defines* the convention (acceptable,
  but reviewers will want it aligned with `CircleIntegral` notation).

---

## C. RHLinalg donation (zeta23 `Zeta23/LinAlg/*` → mathlib Hermitian/spectral API)

### C.1 mathlib base

- `IsHermitian.spectral_theorem` — `Mathlib/Analysis/Matrix/Spectrum.lean:143`;
  `IsHermitian.eigenvalues₀` (:60) + `eigenvalues₀_antitone` (:65); `IsHermitian.eigenvalues`
  (:67); `eigenvectorUnitary` (same file, section below :70); `Matrix.unitaryGroup`.
- `Matrix.PosSemidef` / `Matrix.PosDef` — `Mathlib/Analysis/Matrix/PosDef.lean`
  (`posSemidef_iff_eigenvalues_nonneg` :34, `eigenvalues_pos` :85, `trace_eq_zero_iff` :55);
  Loewner order `Mathlib/Analysis/Matrix/Order.lean` (`instPreOrder`, `le_iff`).
- `Matrix.rank` — `Mathlib/LinearAlgebra/Matrix/Rank.lean:133`; Frobenius norm —
  `Mathlib/Analysis/Matrix/Normed.lean` (scoped `Matrix.Norms.Frobenius`).
- `Mathlib/Analysis/Convex/Birkhoff.lean` (Birkhoff doubly-stochastic theorem) — imported by the
  donor itself (VonNeumann.lean:14), so the convexity side is already shared.
- Inertia landing zone: `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean` (ℝ-forms only; 0
  in-mathlib importers — see §F) and `QuadraticForm/Real.lean:57-85`.

### C.2 Donor inventory (7 files, 1385 LoC total, `wc -l`-verified; all re-read this session)

| Object | Donor declaration | file:line | mathlib deps it already uses |
|---|---|---|---|
| positive index `n₊` | `def posIndex hA := #{i | 0 < hA.eigenvalues i}` | `zeta23/Zeta23/LinAlg/PosIndex.lean:41` | `IsHermitian.eigenvalues` |
| negative index `n₋` | `def negIndex` | PosIndex.lean:45 | idem |
| thresholded index | `def posIndexAbove hA θ := #{i | θ < hA.eigenvalues i}` | PosIndex.lean:50 | idem |
| real trace / Frob. sq. helpers | `def rtrace := RCLike.re A.trace`, `def frobSq := RCLike.re (Aᴴ*A).trace` | PosIndex.lean:70, :73 | `Matrix.trace`, `conjTranspose` |
| spectral parts | `def hermPosPart := specMap hA (·⁺)`, `hermNegPart` | `zeta23/LinAlg/HermitianPosPart.lean:148,:151` | `IsHermitian` spectral API |
| Sylvester (subspace char.) | `finrank_le_posIndex_of_posDefOn`, `posIndex_eq_max_finrank_posDefOn` | `zeta23/LinAlg/Sylvester.lean:82, :304` | submodule finrank |
| inertia monotonicity/additivity | `posIndex_conj_le`, `posIndex_add_le` | `zeta23/LinAlg/Inertia.lean:51, :90` | PosDefOn |
| **von Neumann trace ineq** | `vonNeumann_trace_ineq (hA hB) : RCLike.re (A*B).trace ≤ ∑ i, hA.eigenvalues₀ i * hB.eigenvalues₀ i` | `zeta23/LinAlg/VonNeumann.lean:171-175` | `eigenvalues₀`, `eigenvectorUnitary`, `unitaryGroup`, Birkhoff (:14) |
| **Weyl bound** | `weyl_posIndexAbove_le (hθ : ∀ i, |hE.eigenvalues i| ≤ θ) : posIndexAbove (hA.add hE) θ ≤ posIndex hA` | `zeta23/LinAlg/Weyl.lean:50` | eigenvalues, `specMap` |
| **rank–trace inequality** | `rank_trace_ineq (hP : P.PosSemidef) (hQ : Q.IsHermitian) (hr : P.rank ≤ r) (hb : posIndex hQ ≤ b) (hc : 0 < c) : c*rtrace P - c²/4*r + 2*c*rtrace Q - c²*b ≤ frobSq (P + Q)` | `zeta23/LinAlg/RankTrace.lean:163-170` | `PosSemidef`, `Matrix.rank`, hermPosPart |
| tightness certificate | `lemmaR_tight` | `zeta23/Zeta23/ZeroSide/TightMult.lean` (per anthropics.md §1.3; not re-read this session — re-verify before Phase 3) | rank_trace ingredients |

Namespace: all under `RHLinalg`; files import only Mathlib + each other (VonNeumann.lean:13-15:
`Zeta23.LinAlg.PosIndex`, `Mathlib.Analysis.Convex.Birkhoff`, `Mathlib.Algebra.Order.Rearrangement`).

### C.3 Recommended staging (cheapest first)

1. **First donation: `PosIndex.lean` wholesale** (127 LoC): two definitions + elementary lemmas
   (`posIndex_le_card` :53ish, `posIndex_eq_rank_of_posSemidef`), already stated over mathlib's
   `eigenvalues`. Cost ≈ 150 LoC. It *creates* the inertia landing spot that
   `QuadraticForm/Signature.lean` (ℝ-only, 0 importers) does not provide for matrices.
2. **Second: `VonNeumann.lean`** (204 LoC): `vonNeumann_trace_ineq` is one theorem over
   `eigenvalues₀` + Birkhoff — both already in mathlib; no analysis beyond doubly-stochastic
   rearrangement. Cost ≈ 250 LoC.
3. Third: `Weyl.lean` (136 LoC) — needs `specMap`/`HermitianPosPart.lean` (204 LoC) first.
4. Fourth: `Inertia.lean` + `Sylvester.lean` (138+309 LoC) — Sylvester's law for Hermitian forms.
5. Last: `RankTrace.lean` (267 LoC) — depends on 1–4; adaptation: replace `rtrace`/`frobSq`
   (PosIndex.lean:70,:73) by mathlib canonical spellings (Re trace; Frobenius norm² from
   `Analysis/Matrix/Normed.lean`) — a `local notation` shim makes the port near-mechanical.

Glue signatures (new mathlib decls after donation):

```lean
-- C-G1 (suggested mathlib name, Matrix namespace)
def Matrix.IsHermitian.posIndex {A : Matrix n n 𝕜} (hA : A.IsHermitian) : ℕ :=
  #{i | 0 < hA.eigenvalues i}          -- donor PosIndex.lean:41, verbatim

-- C-G2
theorem Matrix.IsHermitian.posIndex_eq_rank (hA : A.PosSemidef) :
    hA.isHermitian.posIndex = A.rank    -- donor posIndex_eq_rank_of_posSemidef

-- C-G3
theorem Matrix.vonNeumann_trace_ineq {A B : Matrix n n 𝕜} (hA : A.IsHermitian) (hB : B.IsHermitian) :
    RCLike.re (A * B).trace ≤ ∑ i, hA.eigenvalues₀ i * hB.eigenvalues₀ i

-- C-G4 (Sylvester, matrix form — the missing generalization of QuadraticForm/Real.lean:57)
theorem Matrix.IsHermitian.posIndex_eq_max_finrank_posDefOn {A : Matrix n n 𝕜} (hA : A.IsHermitian) :
    hA.posIndex = sSup {d : ℕ | ∃ W ≤ ⊤, Module.finrank 𝕜 W = d ∧ PosDefOn A W}

-- C-G5
theorem Matrix.rank_trace_ineq {P Q : Matrix n n 𝕜} (hP : P.PosSemidef) (hQ : Q.IsHermitian)
    {r b : ℕ} (hr : P.rank ≤ r) (hb : hQ.posIndex ≤ b) {c : ℝ} (hc : 0 < c) :
    c * RCLike.re P.trace - c ^ 2 / 4 * r + 2 * c * RCLike.re Q.trace - c ^ 2 * b
      ≤ ‖P + Q‖_F ^ 2                   -- ‖·‖_F = Frobenius norm, Analysis/Matrix/Normed.lean
```

### C.4 Effort: **S** for stages 1–2 (≈0.4k LoC total), **S–M** for the full 7-file donation (≈1.3k LoC)

The donor files already target mathlib's exact API surface (`eigenvalues₀`, `eigenvectorUnitary`,
`PosSemidef`, `rank`) — this is a re-namespace + helper-rewrite job, not a re-proof.

### C.5 Risks

- `𝕜` is `[RCLike 𝕜]` on the donor; mathlib's spectral files use `[RCLike 𝕜]` too but `Fintype n`
  + `[DecidableEq n]` side-conditions differ per file (Spectrum.lean demands `DecidableEq` in some
  lemmas) — instance-argument churn, not mathematical risk.
- `frobSq` vs mathlib Frobenius norm²: mathlib's is a `Norm` instance in a scoped namespace;
  statements C-G5 must commit to one spelling to avoid a duplicate norm lemma.
- `lemmaR_tight` lives under `ZeroSide/` and mixes the linalg with zero-counting context — do NOT
  donate it with the pure-linalg batch (it needs direction B first); its citation here is from
  `survey/anthropics.md` §1.3, re-verify at `Zeta23/ZeroSide/TightMult.lean` before use.
- Universe/type issues: none (`Matrix n n 𝕜` with `Fintype n` throughout) — the lowest-risk of
  all five directions.

---

## D. Polytime-composition layer (eth `machines/ToTuring/` + mathlib TM time API)

### D.1 mathlib base

- `EvalsToInTime` (+ `refl`, `trans`) — `Mathlib/Computability/StateTransition.lean:266-288`.
- `TM2OutputsInTime` — `Mathlib/Computability/TuringMachine/Computable.lean:130`;
  `TM2ComputableInTime` (:161); `TM2ComputableInPolyTime` (:174); `idComputableInPolyTime`
  (:216) — the only theorem; the file has **zero in-mathlib importers** (verified by import grep;
  the module is imported only by the eth corpus outside mathlib).
- `TM0/TM1/TM2`/`FinTM2` models in `Mathlib/Computability/TuringMachine/{PostTuringMachine,
  StackTuringMachine}.lean`; step-counting convention documented at Computable.lean:30-35.

### D.2 Donor (eth, re-verified)

- `def PolyT {α β} [Enc α] [Enc β] (f : α → β) : Prop` —
  `eth/proof/machines/ToTuring/PolyT.lean:54` (one *fragment* `P : Fr` transforms the word of `x`
  (any configuration beneath) into the word of `f x` within `c·(len x + 1)^c` steps, output
  length ≤ `c·(len x + 1)^c`); introduction `PolyT.of` (:62), elimination `PolyT.elim` (:73),
  well-definedness across encodings `PolyT.of_wd` (:87). `Enc` typeclass in
  `eth/proof/machines/ToTuring/Enc.lean`; `PB` = polynomially-bounded functions (ToTuring/Poly/).
- Closure kit — `eth/proof/machines/ToTuring/Closure/Basic.lean`: `id'` (:53), `const` (:56),
  **`comp` (:61, `PolyT f → PolyT g → PolyT (f ∘ g)`)**, `prodMk` (:69), `fst` (:115), `snd`
  (:117), `some'` (:121), `inl'`/`inr'` (:123/:125), `cons'` (:127); `Closure/Fold.lean`,
  `Closure/Cases.lean` for list-folding/case-split combinators (file existence verified).
- Machine-level bridge to mathlib's model: `outputs_of_within` —
  `eth/proof/machines/ToTuring/Machine/Host.lean:285-295`:
  a fragment run `Frag.Within H … t …` yields `Nonempty (TM2OutputsInTime (tmOf H) x' (some y') t)`
  (i.e. donor fragments *compile* to mathlib `FinTM2`s with a step-for-step bound); supporting
  `initList_tmOf`/`haltList_tmOf` (:277-283 region).
- End-to-end wrapper over mathlib's `TM2ComputableAux`: `DecidesTM` machinery in
  `eth/proof/machines/Wrap/Defs.lean:76-79` (running-time contract stated directly as
  `Nonempty (TM2OutputsInTime M.tm …)`).

### D.3 The merged API (new mathlib statements this enables)

```lean
-- D-G1. Polynomial-time function class, mathlib-native (re-keying PolyT to mathlib encodings).
class TM2PolyTime (f : α → β) : Prop where
  tm : FinTM2 ; c : ℕ
  outputs : ∀ a, ∃ m ≤ c * (encode a).length ^ c,
    TM2OutputsInTime tm (encode a) (some (encode (f a))) m

-- D-G2..D-G9. Closure laws — each is a NEW mathlib theorem (none exist today; the only
--             existing result is idComputableInPolyTime, Computable.lean:216):
theorem TM2PolyTime.id : TM2PolyTime (id : α → α)
theorem TM2PolyTime.comp {f : β → γ} {g : α → β} (hf : TM2PolyTime f) (hg : TM2PolyTime g) :
    TM2PolyTime (f ∘ g)                       -- donor analogue: Closure/Basic.lean:61
theorem TM2PolyTime.const (b : β) : TM2PolyTime (fun _ : α => b)
theorem TM2PolyTime.prodMk {f : α → β} {g : α → γ} (hf) (hg) : TM2PolyTime (fun x => (f x, g x))
theorem TM2PolyTime.fst {f : α → β × γ} (hf) : TM2PolyTime (fun x => (f x).1)
theorem TM2PolyTime.snd {f : α → β × γ} (hf) : TM2PolyTime (fun x => (f x).2)
theorem TM2PolyTime.some {f : α → β} (hf) : TM2PolyTime (fun x => some (f x))
theorem TM2PolyTime.cons {f : α → β} {l : α → List β} (hf) (hl) :
    TM2PolyTime (fun x => f x :: l x)

-- D-G10. Padding/overhead absorption (the step-vs-statement accounting that makes composition
--        work; donor: Host.lean:285 outputs_of_within + PB lemmas in ToTuring/Poly/).
theorem TM2OutputsInTime.pad (h : TM2OutputsInTime tm l l' m) (hm : m ≤ m') :
    TM2OutputsInTime tm l l' m'

-- D-G11. From fragments to bundled machines (donor Host.lean:285 restated in mathlib terms).
theorem tmOf_within_outputs {H : Fr} {x y : List Bool} {t : ℕ}
    (h : Frag.Within H (withIO x …) t (withIO y …)) :
    Nonempty (TM2OutputsInTime (tmOf H) x (some y) t)

-- D-G12. Downgrade to computability (already exists as TM2ComputableInPolyTime.toTM2Computable,
--        Computable.lean:192 — keep; it becomes useful once D-G2 exists).
```

### D.4 Effort: **M** (1–3k LoC for a mathlib-quality layer)

The donor's `ToTuring/` is 46 files, but the *reusable core* is PolyT.lean + Closure/ (3 files) +
Machine/Host.lean bridge ≈ 2k LoC; the rest is eth-specific (KCNF encodings, Wrap/). For mathlib
one should re-key `Enc` (donor) to mathlib's `Encoding`/`encode` conventions
(`Mathlib/Computability/Encoding.lean`) — that re-keying plus `fun_prop`-friendly restatements is
the bulk of the work.

### D.5 Risks

- **Definitional mismatch (main risk)**: donor `Enc`/`wd`/`Fr` are eth-local; mathlib's
  `TM2ComputableInTime` bundles *encodings into arbitrary alphabets* (`ea : α → List αΓ`), while
  donor works with `List Bool` + IO stacks. The merged class (D-G1) must pick one convention;
  every closure proof depends on this choice.
- Step accounting: mathlib counts `step`-applications of the bundled `FinTM2` (Computable.lean:30-35);
  donor fragments count symbol-level ops; `outputs_of_within` is step-for-step, but composition
  needs the *sum* of two bounds re-enclosed as one polynomial — routine but bookkeeping-heavy.
- The donor was checked against Mathlib v4.33.x; `Turing.*` namespace layout in v4.36 may have
  drifted (files moved to `TuringMachine/` folder in #35608, 2026-03-10 — the donor predates or
  straddles this; import paths need a sweep).
- No universe issues (all `Type`, finite alphabets via `Fintype`).

---

## E. Holor/border-rank extension (3sum-apsp trilinear machinery → `Holor.cprank`)

### E.1 mathlib base

- `Holor`, `HolorIndex`, tensor product of holors — `Mathlib/Data/Holor.lean:41-43` (HolorIndex),
  header :14-29 (rank-1 = product of vectors; CP rank = min number of rank-1 summands).
- `CPRankMax` (bounded-rank predicate) lemmas :265-309; **`noncomputable def cprank`** :333;
  `cprank_upper_bound` (:336). Zero in-mathlib consumers beyond the file itself.
- `MvPolynomial` (`Mathlib/Algebra/MvPolynomial/*`), `Matrix` (`Mathlib/LinearAlgebra/Matrix/`),
  `Mathlib/Algebra/Tropical/` (min-plus), `Mathlib/Computability/AkraBazzi/AkraBazzi.lean:654`
  (divide-and-conquer asymptotics; Strassen motivation :21). No border rank anywhere.

### E.2 Donor (3sum-apsp, re-verified)

- Variable types `LeftVar/RightVar/OutVar`, `inductive Term | P (i j : Fin 3) | P0` —
  `3sum-apsp/PaperStatements.lean:~99-110` (OutVar at :98-101, Term at :105-108);
  linear forms `xForm/pForm/yForm/qForm/zForm/z0Form` (:111-124); `pHat`/`qHat` matrices of forms
  (:127-134); polynomial embedding: `abbrev TriPoly := MvPolynomial Var ℤ` (:161),
  `polyL/polyR/polyO` (:164-168), `formL` (:171).
- Evaluation scheme: `Full.run` (:263), `def Full (L) (a b) : OutStr L → ℤ` (:275),
  `Full.multipliedAt` (:278); **`def Mult {L} (a : LeftStr L → ℤ) (b : RightStr L → ℤ) :
  OutStr L → ℤ`** (:302) — the level-L matrix product the recursion computes.
- (The same file also contains the border-rank identity (1) as `Lemma_6` (:618, ten terms over
  defs `G` :178 / `E` :183) and the pruned recursion `Pruned`; `Eq_1` (:603) is Strassen's 2×2
  seven-product identity. [erratum 2026-11-09, H/QA: this note previously attributed the
  border-rank identity to `Eq_1`, per the since-corrected `survey/anthropics.md` §4.])

### E.3 The definitional extension + first connector

```lean
-- E-G1. Border rank of a holor over a topological ring: limit of CP ranks.
noncomputable def Holor.borderCPRank [Ring α] [TopologicalSpace α] (x : Holor α ds) : ℕ :=
  sInf {r | ∃ F : ℕ → Holor α ds, Tendsto F atTop (𝓝 x) ∧ ∀ᵉ k, cprank (F k) ≤ r}
  -- (∀ᵉ = eventually; a filter-liminf formulation may be cleaner: liminf of cprank ∘ F)

-- E-G2. Border rank bounds CP rank from above (definitional monotonicity, first provable).
theorem Holor.borderCPRank_le_cprank [Ring α] [TopologicalSpace α] (x : Holor α ds) :
    borderCPRank x ≤ cprank x

-- E-G3. The matrix-multiplication tensor as a holor (3sum-apsp's 3×3 base case, term-indexed).
def multTensor3 : Holor ℤ [3, 3, 3] :=
  -- coefficients ⟨i, j, k⟩ = 1 iff k = i * j (indices in Fin 3); equivalently the rank-≤ 23
  -- border-rank object of Schönhage's identity (donor Term/P0 at PaperStatements.lean:105)

-- E-G4. First connector: the donor's trilinear evaluation implies a CP-rank upper bound on the
--        *exact* scheme, and a border-rank bound on the limiting scheme.
theorem cprank_multTensor3_le (scheme : Fin 23 → Holor ℤ [3,3,3]) (hscheme : ∑ scheme = multTensor3) :
    cprank multTensor3 ≤ 23

-- E-G5. Submultiplicativity of rank along the donor's level-L recursion (`Pruned`): the natural
--        "tensor-rank → algorithm" lemma mathlib lacks entirely.
theorem cprank_le_of_mul_via (h : ∀ L, Mult L = evalBy (T : Holor ℤ [3,3,3])) :
    cprank (tensorAtLevel L) ≤ (cprank T) ^ L
```

### E.4 Effort: **M** for E-G1..E-G4 (definitions + first connectors ≈ 1–2k LoC), **L** for anything
touching the actual exponent ω (the donor's 426-file library is the scale of that program; and
the running-time half lives over the word-RAM model, not mathlib).

E-G1's definition needs a topology on `Holor α ds` (finite product — trivial but new), and the
*first meaningful theorem* (E-G4) is genuinely new mathlib content: an explicit CP-rank bound for
a 3×3 matrix-multiplication tensor via the donor's Schönhage decomposition.

### E.5 Risks

- **Border rank needs limits of *integral* tensors**: the classical theory takes limits over ℂ;
  over `Holor ℤ` the `𝓝 x` filter is discrete and E-G1 collapses to `cprank`. The definition must
  be typed over `Holor ℂ [3,3,3]` (or a normed ring) — the donor's identity is over ℤ, so a
  base-change lemma (`Holor ℤ → Holor ℂ`) becomes part of the glue (tensor-map functoriality
  exists in `TensorProduct/Map.lean` but not for `Holor` — small new API).
- `cprank` is `noncomputable` and defined via `Nat.find` on an existential (:333) — proving
  concrete bounds (E-G4) means exhibiting the decomposition and applying `Nat.find_le`; the
  donor's `Term`-decomposition must be transcribed as 23 explicit rank-1 holors (mechanical,
  ~23 lines, but every index must line up with Schönhage's).
- `Holor` indexing is `List ℕ`-based, positionally typed — connecting to `Matrix (Fin 3) (Fin 3)`
  notation (`!![...]` as in donor pHat) needs an explicit `Holor ↔ Matrix` bridge (E-G3).
- The donor file `PaperStatements.lean` imports only `Mathlib.Algebra.MvPolynomial.Basic` + a few
  others (module system) — porting is straightforward, but the `Var = LeftVar ⊕ RightVar ⊕ OutVar`
  sum-type must be kept in sync with `Holor`'s flat index tuples.

---

## F. Islands addendum (further unconsumed mathlib islands; importers counted by
`grep -rl 'import Mathlib.<Mod>' Mathlib/ | grep -v <self>`, this session)

1. **`Mathlib/Computability/TuringDegree.lean`** — 0 importers. Contains a full *reduction*
   calculus: `TuringReducible` with `refl` (:73-74), `trans` (:76), and
   `partrec_iff_forall_turingReducible` (:70). Bridge relevance: the only reduction relation in
   mathlib — the natural substrate under any future `≤ₚ` (polytime reduction) once direction D's
   layer exists (a "TM-reduction ⇒ time-bounded reduction" lifting is a plausible new-theorem
   shape combining D + this island).
2. **`Mathlib/NumberTheory/SelbergSieve.lean`** — 0 importers. Sieve-theoretic counting
   machinery. Bridge relevance: any zero-density/prime-density dossier (zeta23-style windows) or
   tauceti/openai sieve content lands here; currently meets nothing.
3. **`Mathlib/LinearAlgebra/QuadraticForm/Signature.lean`** — 0 importers. Uniqueness part of
   Sylvester's law of inertia for ℝ-quadratic forms (:240-248). Bridge relevance: it *is* the
   designated landing zone for direction C stage 4 (donor Sylvester.lean:304 generalizes it from
   forms to Hermitian matrices); today nothing consumes it.
4. **`Mathlib/NumberTheory/Rayleigh.lean`** — 0 importers. Rayleigh's theorem on Beatty
   sequences (`beattySeq` :53, complement partition `compl_beattySeq`). Bridge relevance:
   density/partition combinatorics adjacent to discrepancy and to any floor-sum machinery in
   openai-math/tauceti; unconsumed.
5. **`Mathlib/LinearAlgebra/Matrix/Gershgorin.lean`** — 1 importer
   (`NumberTheory/NumberField/Units/DirichletTheorem.lean` only). `eigenvalue_mem_ball` (:30),
   `det_ne_zero_of_sum_row_lt_diag` (:63). Bridge relevance: the cheapest eigenvalue-localization
   tool below Weyl (direction C stage 3); a "Gershgorin ⇒ Weyl-type coarse bound" connector would
   be immediate and is absent.
6. **`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`** — 1 importer
   (`Analysis/InnerProductSpace/NormDet.lean` only). Operator singular values (:95+). Bridge
   relevance: von Neumann's trace inequality in its *general* (non-Hermitian) form is stated via
   singular values — donor direction C proves only the Hermitian case, and a Phase-3 dossier
   "general von Neumann via SingularValues + Birkhoff" would consume exactly this island.

---

## Method note

Same tools/rules as the frontier survey: rg/grep + targeted region reads; no builds; donor
citations re-verified this session at the cited lines (the two exceptions are explicitly flagged:
`lemmaR_tight` and 3sum-apsp `Pruned`/`Eq_1` line numbers, taken from `survey/anthropics.md` and
marked for re-verification). Importer counts: `grep -rl "import Mathlib.<Module>" Mathlib/`
excluding the module's own file; module-era `public import` matches included. Lean-style glue
signatures are indicative (names/namespaces chosen to match each side's conventions; `…` marks
donor-internal plumbing not reproduced).
