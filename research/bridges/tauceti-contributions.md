# Bridge contributions — tauceti column (lane R1, for bridge lanes R4–R7)

Companion files: `research/survey/tauceti.md` (full survey), `research/survey/anthropics.md`
(zeta23/eth/3sum-apsp locators), `research/survey/mathlib-frontier.md` (R3; mathlib locators,
cited as "R3 §1"). All paths absolute-relative to their corpus roots: `TauCeti/…` =
`/home/doz/zcode-workdir/tauceti/TauCeti/…`; `Zeta23/…` = `/home/doz/zcode-workdir/anthropics_formal-math/zeta23/…`;
`eth/…` = `/home/doz/zcode-workdir/anthropics_formal-math/eth/…`; `Mathlib/…` =
`/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4/…`. Every locator below was re-verified by
rg/read this session unless marked otherwise. Tags: [VERIFIED] = statement read at the cited
locator; [HYPOTHESIS] = my inference, needs confirmation.

**Correction to my survey** (`survey/tauceti.md` §4): I called the Landau pair a "near-duplicate";
the audit below shows it is a namesake collision between *different* theorems (§1c). The other
three pairs are genuine duplications. R5 should read this section together with the survey.

## 1. Zeta23 ↔ TauCeti duplication audit

### (a) ξ-completions — genuine duplication, literally identical up to a factor 2 [VERIFIED]

| | zeta23 | TauCeti | mathlib (base) |
|---|---|---|---|
| Decl | `XiPrime.xi : ℂ → ℂ := s*(s−1)/2 * completedRiemannZeta₀ s + 1/2` (`ChallengeDeps/XiPrime.lean:16`) | `TauCeti.LFunctions.zetaEntireCompletion : s*(s−1)*completedRiemannZeta₀ s + 1` (`NumberTheory/LFunctions/Zeros/Completion/RiemannZeta.lean:33`) [erratum 2026-11-09, H/QA: v1 cited :27, an `open` line; `def zetaEntireCompletion` is at :33] | `completedRiemannZeta₀` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:64`, R3 §1) |
| Normalization | ξ(0)=ξ(1)=1/2 | takes value 1 at both poles (ξ-entireCompletion(0)=1) | — |
| Proved around it | `xiDeriv`, `IsXiDerivZero`, `xiDerivMult` (`ChallengeDeps/XiPrime.lean:18–24`); the whole ξ′ topic: all zeros of ξ′ in open strip, Re ξ′/ξ > 0 on Re s ≥ 1, ≥ 85.838% simple-and-on-line (`Challenge/XiPrime.lean`, `Zeta23/XiPrime/` ~20 dirs) | reflection symmetry `zetaEntireCompletion_one_sub`, entireness, agrees with `s(s−1)·completedRiemannZeta` off poles (`Zeros/Completion/RiemannZeta.lean:32–60`) | `completedRiemannZeta_one_sub` (`RiemannZeta.lean:106`, R3 §1) |

Arithmetic check: `2 * XiPrime.xi s = s*(s−1)*Λ₀(s) + 1 = zetaEntireCompletion s` — **the two
definitions are definitionally the same function up to the constant 2** [VERIFIED by inspection of
both defs].

- *Generality*: TauCeti wins by construction — `zetaEntireCompletion` is a one-line instance of
  the record-level `AnalyticLFunctionData.entireCompletion` (pole-clearing via Mathlib's
  `toMeromorphicNFOn`; "the resulting function is entire, has the expected orders and divisor, and
  is nonzero at every cleared pole", `NumberTheory/LFunctions/Zeros/Completion/Basic.lean`
  docstring), with instances for Riemann ζ, Dirichlet L, Dedekind ζ_K, Grössencharacter and Hecke
  L (`NumberTheory/LFunctions/{Data,Dirichlet,DedekindZeta,Grossencharacter,Hecke}/`). zeta23's ξ
  is a one-off for ζ only, but carries **downstream analysis TauCeti has none of** (ξ′ zero
  location; the entire `Zeta23/XiPrime/` machine).
- *Proof approach worth stealing (both directions)*: zeta23's identification of a *unique entire
  representative* via order/divisor data matches TauCeti's `toMeromorphicNFOn` normal form — the
  two normal-form disciplines are interchangeable; TauCeti's record would let zeta23 state its
  ξ′-topic theorems for any `AnalyticLFunctionData`, not just ζ.
- *Combining yields*: candidate "zeros of Λ_K′" (derivative of the completed Dedekind zeta /
  Grossencharacter completion) statements — see §2 C1(iii).

### (b) `analyticOrderAt` multiplicity bookkeeping — different shapes, same substrate [VERIFIED]

| | zeta23 | TauCeti | mathlib |
|---|---|---|---|
| Decl | `zeroMult ρ = (analyticOrderAt riemannZeta ρ).toNat` (`ChallengeDeps.lean:46`); window sets `zerosIn :48`; counting `Ncount T₁ T₂ = ∑ᶠ …` with multiplicity `:55`, distinct `N_d :57`; Dirichlet `zeroMultL :82`, `N_χ :87` | no counting function anywhere [VERIFIED by survey]; instead **multiplicity transfer**: conductor/archimedean factors change no orders — `analyticOrderAt_dirichletData_entireCompletion` (`Zeros/Completion/Dirichlet.lean`, nonprincipal primitive χ, all s) and the order/divisor preservation of `entireCompletion` (`Zeros/Completion/Basic.lean`) | `analyticOrderAt` (`Mathlib/Analysis/Analytic/Order.lean:49`), arithmetic incl. `analyticOrderAt_add :254` (R3 §1) |

- zeta23 = *counting-shaped* (windows, ∑ᶠ, liminf proportions); TauCeti = *structure-shaped*
  (orders survive completion, dualization `dual_polarOrder_apply`, and quadratic factorization:
  zeros of ζ_K = union of zeros of ζ and L(s,χ_D) at order level via `dedekindZeta_eq_riemannZeta_mul_LFunction`,
  `NumberTheory/LFunctions/DedekindZeta/Quadratic.lean`).
- *Steal from zeta23*: the `Ncount`/window API design — it is the missing half of TauCeti's
  `LFunctions/Zeros/` directory (the dir name promises counting; it contains only completions).
- *Steal from TauCeti*: the factorization-at-orders theorems — zeta23 has no product-of-L-functions
  zero-set calculus (its Dirichlet results are per-character).
- *Combining yields*: zero statements for products/factors of L-functions with exact
  multiplicities — the entry wedge of §2 C1.

### (c) "Landau" — namesake collision, NOT a duplicate (correcting survey/tauceti.md §4) [VERIFIED]

| | zeta23 `Zeta23/WeilEF/Landau.lean` | TauCeti `NumberTheory/LSeries/Landau.lean` |
|---|---|---|
| Content | log-derivative partial-fraction estimates: `logDeriv_partial_fraction_unit :299`, `logDeriv_partial_fraction_disk :348`, `zeta_logDeriv_partial_fraction :512` (the "Landau-type" contour estimate feeding the explicit formula) | **Landau's theorem** on Dirichlet series with nonnegative coefficients: `theorem landau (ha : 0 ≤ a) (habs : abscissaOfAbsConv a = σ) : ¬ HasAnalyticExtensionAt a σ` (`Landau.lean:296`), plus `meromorphicOrderAt_lt_zero_of_eq_LSeries` (the singularity is a pole) and `abscissaOfAbsConv_eq_bot_of_hasEntireExtension` |

Different theorems, complementary content, **zero statement overlap**. The pairing is nevertheless
the strongest donor pair of the four: TauCeti's Landau theorem + `LSeries.HasEntireExtension`
(`NumberTheory/LSeries/EntireExtension.lean:57`) is precisely the shape of the nonvanishing/
barrier arguments zeta23 had to re-implement privately (its own docstring on
`abscissaOfAbsConv_eq_bot_of_hasEntireExtension`: "which is what a nonvanishing argument applies
once a positive combination of L-series has been shown entire"). zeta23's `ZeroSumLimit.lean` /
`ZeroSummability.lean` (`Zeta23/WeilEF/`) supply the zero-sum limits TauCeti's Landau lacks.

### (d) Sylvester inertia — same base field, different theorems, both incomplete [VERIFIED]

| | zeta23 (namespace `RHLinalg`, `variable {𝕜} [RCLike 𝕜]`, `Zeta23/LinAlg/Inertia.lean:43–45`) | TauCeti | mathlib |
|---|---|---|---|
| Decls | `posIndex_conj_le` (`Inertia.lean:51`), `posIndex_add_le` (`:90`) — *inequality bounds* on the positive index; `finrank_le_posIndex_of_posDefOn` (`Sylvester.lean:82`), `posDefOn_range_hermPosPart` (`:123`) | **the inertia law itself**: `Matrix.IsHermitian.signature_congr` (`Analysis/Matrix/HermitianSignature/Basic.lean:147`, signature invariant under `A ↦ P*A*Pᴴ`, P invertible, any RCLike 𝕜), `signature_realify :122` (realification doubles signature), block additivity `signature_fromBlocks_zero :203`; real base `Matrix.signature_congr` (`LinearAlgebra/Matrix/Signature.lean`, linearly ordered field, via Mathlib `sigPos/sigNeg` on `toQuadraticForm'`) | Mathlib has `sigPos/sigNeg` for quadratic forms only; no Hermitian inertia law [R3: no standalone inertia API; consistent with anthropics.md §4] |

- Neither side proves the other's statement: zeta23 needs (and proves) *sub-additivity bounds*
  feeding `rank_trace_ineq` (`Zeta23/LinAlg/RankTrace.lean:163`); TauCeti proves *exact
  congruence invariance* feeding quadratic-form/lattice work. The full Sylvester package =
  exact law (TauCeti) + the two ≤ bounds (zeta23) over the same `RCLike` base — a clean merged
  `RHLinalg′` module, first candidate for the shared linear-algebra layer R6 is building
  (`research/bridges/linear-algebra.md`).
- *Steal from TauCeti*: `signature_realify` — the 2×-rank reduction is the reason TauCeti can
  derive the Hermitian law from the real one; zeta23's development is direct and could drop its
  hand-rolled HermitianPosPart plumbing for congruence steps.

## 2. The zero-density empty zone (candidate development)

**Inventory.** What each side brings:

- TauCeti (all [VERIFIED]): the **argument principle in winding form** —
  `TauCeti.Contour.argumentPrinciple_nullHomologous`
  (`Analysis/Contour/Argument/Cycle.lean:110`): for f meromorphic on U with prescribed integer
  orders `ord : ℂ → ℤ` on a finite set S, and any piecewise-C¹ closed null-homologous curve γ in
  U avoiding S, `∫ γ logDeriv f = 2πi · ∑_{z∈S} windingNumber γ z · ord z` (plus a local form
  `:150` and a geometric reading `Analysis/Complex/Conformal/ArgumentPrinciple.lean:89`
  `argumentPrinciple_windingNumber`); a 40-file contour suite under `Analysis/Contour/`
  (residues, homology Cauchy, winding) — mathlib has **no** argument principle at all [R3 §1
  "Missing"]; **Landau** (§1c) with `HasEntireExtension` (`EntireExtension.lean:57`); the
  **completion/order-transfer layer** (§1a–b) incl. quadratic factorization
  `dedekindZeta_eq_riemannZeta_mul_LFunction` (`LFunctions/DedekindZeta/Quadratic.lean`) and
  four-factor product residues (`LSeries/Quadratic/Pair/Residue.lean`); **3-4-1 nonvanishing**
  `TauCeti.LSeries.ne_zero_of_threeFourOne` (`LSeries/Nonvanishing.lean:69` [erratum 2026-11-09,
  H/QA: v1 cited :37, a docstring bullet; the theorem is at :69]); Wiener–Ikehara
  `TauCeti.LSeries.wienerIkehara` (consumed at `NumberTheory/Chebotarev/PrimeCounting/Cyclotomic.lean:28`;
  variants `WienerIkehara/Variants.lean:60,120,135`); inertia (§1d).
- zeta23 (all [VERIFIED] except where tagged): RvM with Backlund — `riemannVonMangoldt
  (hΓ : GammaFacts) : RiemannVonMangoldt zetaZeroConfig` (`Zeta23/RvM/Statement.lean:20`; the
  hypothesis is discharged: `gammaFacts : GammaFacts`, `Zeta23/GammaFacts/Complete.lean:30`);
the λ-parameterized density family `thmA_lam`, `thmB_lam`, `thmC_lam`
(`Zeta23/Final.lean:79,99,119`, any 0<λ<1, instantiated at λ=1 for the submitted 2/3, 5/6 [erratum 2026-11-09, H/QA: v1 cited ":79,99,103"; :103 is a proof line inside `thmB_lam`; `thmC_lam` is at :119]
  constants, and Dirichlet analogues `dirichlet_*` per anthropics.md §1.3); Weil explicit formula
  (`Zeta23/WeilEF/`, incl. the Landau-type log-deriv estimates §1c); Montgomery–Vaughan Hilbert
  inequality `mv_hilbert` (`Zeta23/MV/Final.lean:30`, `MVDiag 13`); the rank–trace inequality
  `rank_trace_ineq` (`Zeta23/LinAlg/RankTrace.lean:163`).
- mathlib (third leg, [VERIFIED] via R3 §1): `riemannZetaZeros` (`Mathlib/NumberTheory/LSeries/
  ZetaZeros.lean:37`), `IsCompact.inter_riemannZetaZeros_finite` (`:68`) — finiteness of zeros in
  compact windows; `analyticOrderAt` + `analyticOrderAt_add` (`Mathlib/Analysis/Analytic/Order.lean:49,254`)
  — multiplicity arithmetic; `WeakFEPair` residues (`LSeries/AbstractFuncEq.lean:433,449`); **no
  N(T), no explicit formula, no density, no argument principle, not even PNT** [R3 §1 "Missing"].

**Why neither side alone**: zeta23 can count and bound but only for ζ and primitive Dirichlet L —
no products, no number-field zetas, no general record; TauCeti can factor, complete, transfer
multiplicities and integrate along contours but has no counting function, no explicit formula,
and no density method. The intersection (statements about zero sets of *factored* L-functions
with *quantitative proportions*) is empty in all three corpora.

### C1. Zero-density for the Dedekind zeta function of a quadratic field [strongest, feasible]

*Statement draft.* Let K = ℚ(√d) with fundamental discriminant D, χ_D the primitive quadratic
character of conductor |D| (TauCeti: `TauCeti.Multiquadratic.fundamentalDiscriminantChar`). Define
`N_{ζ_K}(T₁,T₂) := ∑ᶠ ρ ∈ window, mult ρ` with `mult ρ = analyticOrderAt (dedekindZeta K) ρ` and
`N₀*_{ζ_K}` the distinct-on-critical-line count (copy zeta23's `ChallengeDeps.lean:46–57` shapes,
replacing `riemannZeta` by the continued ζ_K available on ℂ \ {1} per TauCeti's meromorphic
quadratic factorization). Then:

  (i) `N_{ζ_K}(T,2T) = N_ζ(T,2T) + N_{L(χ_D)}(T,2T)` and likewise for distinct/on-line counts —
      the zero sets (with multiplicity) of ζ_K on ℂ \ {1} are the disjoint-union-with-sum of the
      zero sets of ζ and L(s,χ_D);
  (ii) `liminf N₀*_{ζ_K}(T,2T) / N_{ζ_K}(T,2T) ≥ 2/3` (and the 5/6-distinct and
      Montgomery–Taylor-window analogues with constants 2−1/c₁* ≈ 0.6725, (3−1/c₁*)/2 ≈ 0.8363);
  (iii) *stretch*: the same proportion bounds for zeros of Λ_K′ (see §1a).

*Contributions.* (i) is TauCeti × mathlib: `dedekindZeta_eq_riemannZeta_mul_LFunction` +
`analyticOrderAt_add` (mathlib `Order.lean:254`) + the continuation/meromorphicity of the RHS
(TauCeti `LFunctions/DedekindZeta/Quadratic.lean` + `LSeries/Continuation.lean`). (ii) is a
min-of-fractions assembly over zeta23's submitted dyadic theorems for ζ and for primitive
Dirichlet L (`two_thirds_on_critical_line`, `dirichlet_*` families in `Challenge.lean:131–229`):
if a/A ≥ c and b/B ≥ c then (a+b)/(A+B) ≥ c; apply per window.

*Missing (named).* (a) zeta23's Dirichlet statements are over `DirichletCharacter.LFunction`
with conductor-level windows — need the window bookkeeping unified with ζ's windows [HYPOTHESIS:
zeta23's `N_χ` (`ChallengeDeps.lean:87`) already shares the window shape, so this is glue, not
math]. (b) A named `N(T)`-asymptotic for L(s,χ) is *not* stated as a submitted theorem
[VERIFIED absent from `Challenge.lean`]; if C1(ii)'s denominator needs N_{L(χ_D)}(T,2T) only
through zeta23's internal counting lemmas, R5 must locate them (likely `Zeta23/RvM/NcountWindow.lean`
or the Dirichlet ZeroSide port — [HYPOTHESIS] on the exact file). (c) τ transfer: the trivial
zeros of L(χ_D) vs ζ must be excluded — both corpora have trivial-zero APIs (mathlib
`riemannZeta_neg_two_mul_nat_add_one`, `RiemannZeta.lean:173` per R3; TauCeti Dirichlet
trivial-zero corrections are referenced in `Zeros/Completion/Dirichlet.lean`'s "trivial-zero
corrections needed in other cases").

*Why essential from both sides.* Without TauCeti there is no ζ_K object, no factorization-with-
multiplicities, no continuation to factor; without zeta23 there is no density theorem to
assemble; without mathlib's `analyticOrderAt_add` the multiplicity bookkeeping is manual.

*Novelty note.* Statement (ii) for ζ_K is classical-adjacent (zero-density for ζ_K follows from
factorization + known results informally), so as *mathematics* it is an assembly, not a discovery;
its value is as the **first formal zero-density theorem for a number-field zeta** and the
template for C3. Mark: classical informally, new formally. C1(iii) (Λ_K′) is not classical to my
knowledge [HYPOTHESIS — novelty check against Farmer–Gonek-type literature needed].

### C2. Riemann–von Mangoldt for quadratic ζ_K [prerequisite-grade, high certainty]

*Statement draft.* With C1's `N_{ζ_K}`: `N_{ζ_K}(T) = 2·(T/2π)·log(T/2πe) + O(log T)` — concretely,
`RiemannVonMangoldt (quadraticZetaZeroConfig K)` in zeta23's own `RiemannVonMangoldt` interface
(`Zeta23/RvM/Statement.lean:20` — a config-record target, so a new config instance is the
natural port shape). Contributions: C1(i) + zeta23's `riemannVonMangoldt` for ζ + the
Dirichlet-L counting input [named gap as in C1(b)]; TauCeti's `argumentPrinciple_nullHomologous`
is the alternative route if the L(χ) count must be rebuilt rather than ported. Novelty: none
expected as mathematics (classical, e.g. Davenport §5–16); value = formal-first + the port
exercises the whole bridge.

### C3. Record-level density theorem (the unification target) [highest effort, the real prize]

*Statement draft.* Parameterize zeta23's Theorem A over TauCeti's record: for
`d : TauCeti.LFunctions.AnalyticLFunctionData` (`NumberTheory/LFunctions/Data/Basic.lean:82`)
satisfying hypothesis-props `WEF d` (explicit formula à la `Zeta23/WeilEF/`), `MVH d c`
(Montgomery–Vaughan Hilbert inequality à la `Zeta23/MV/Final.lean:30`) and `GAM d` (Γ-facts à la
`GammaFacts`, discharged in zeta23 at `GammaFacts/Complete.lean:30`):
`liminf N₀*_d(T,2T)/N_d(T,2T) ≥ 2/3`. zeta23's λ-parameterized `thmA_lam` (`Final.lean:79`) shows
the internal theorem is already window-parametric — the port is to swap its ζ/χ-specific
definitions (ChallengeDeps-level) for the record's `completed`, `polarOrder`, `conductor`,
`gammaFactor` fields, which exist (`Data/Basic.lean:82–106`, `HasDirichletAgreement :174`).
Instances then fall out for Dedekind zeta, Grössencharacter, and Hecke L — **zero-density for
Hecke/Grossencharacter L-functions is not in zeta23, TauCeti, mathlib, and (as far as we can
check without the paper corpus) is exactly the "new theorem" class the charter wants** —
classical informally in special cases only [HYPOTHESIS on literature status; R2/R5 should check].
Missing: everything zeta23 proves per-function must be restated as record hypotheses; the WeilEF
port is the bulk (its `Contour.lean`, `Effective.lean`, `FullLine.lean` are ζ-specific).

## 3. eth ↔ TauCeti

### (a) Hosting eth's eight-square identity in TauCeti's representation theory

*What eth has* [VERIFIED]: `Eight.signs : Eight.Signs`
(`eth/proof/networks/Eight/SecCrossing_Identity.lean:261`) — for `Block = Bool × Bool × Bool`,
with `sigma p q = (−1) ^ phi p q` where `phi p q = phiQ p q + phi1 + phi2 + phi3` (quadratic
Σ_{i≤j} p_i q_j plus the three trilinear terms; defs at `:126–133`), the rule of signs
`σ(p,q)σ(p′,q′) + σ(p,q′)σ(p′,q) = 0` whenever `p⊕q = p′⊕q′`, `q ≠ q′` — the sign core of the
Degen (1818)/Graves (1843) eight-square identity, i.e. the octonion norm's composition rule. The
statement is self-contained (only `Mathlib.Data.Nat.ModEq` + ring tactics); the proof is a long
hand parity computation (`four_phi_odd :240` chain [erratum 2026-11-09, H/QA: v1 cited :247; the
lemma is at :240]).

*What TauCeti has to host it* [VERIFIED decls]: a Clifford development of 56 top-level entries
(198 .lean files recursive) [erratum 2026-11-09, H/QA: v1 said "70-file"]
`TauCeti/LinearAlgebra/CliffordAlgebra/` — including `EightPeriodicity.lean`, `BottPeriodicity.lean`,
`QuaternionPlane.lean`, `Chirality.lean`, `SignSwitch.lean`, `VolumeElement/`; the fermionic Fock
module `TauCeti.glCliffordHom` with `E_ij ↦ ½ Σ_k d_ik d_kj` on the exterior algebra via
`CliffordAlgebra.equivExterior` (`Algebra/Lie/GeneralLinear/Fock.lean`); Schur–Weyl
(`RepresentationTheory/Symmetric/TensorAction/GeneralLinear.lean:67`); the Jones/Temperley–Lieb
representation `jones (a : Rˣ) : BraidGroup n →* (TemperleyLieb R (jonesDelta a) n)ˣ`
(`KnotTheory/TemperleyLieb.lean:146`); U_q(sl₂) with quantum trace
(`QuantumGroups/UqSl2/QuantumTrace.lean:41 trace_lsmul_k_comp_eq_trace_lsmul_kInv_comp`), pivotal
and classical-specialization modules.

*Re-derivation path* [HYPOTHESIS, mechanism clear]: identify `σ(p, ·)` as the action of the
chirality/volume-element grading of `Cl(0,3)` on `⋀(ℂ³)`-indexed basis blocks; the four-term
identity is then the statement that the σ-twisted pairing is symplectic on each
`p⊕q = const` affine subspace, i.e. an anticommutation of Clifford units of opposite parity —
the same phenomenon as the CAR operators d_ik of `glCliffordHom`. Payoff (i): eth's 30-lemma
parity proof collapses to a Clifford computation; payoff (ii): eth's Lemma-2 "pieces factoring
through ≤ 11t bits" (`Eight.lemPieces` per anthropics.md §1.2) gets a representation-theoretic
explanation (spin/ exterior-algebra filtration), which is how new statements in the eth style
would be *found*, not just verified.

*Generalization candidates*:
1. *Clifford family, n bits* [HYPOTHESIS]: the n-square rule of signs lives in `Cl(0,n−1)`; Hurwitz's
   theorem (1898) says norm-composition exists only for n ∈ {1,2,4,8} — so a TauCeti theorem
   "the four-term sign identity holds for the n-bit cocycle iff n ∈ {1,2,4,8}" would be
   **classical** (Hurwitz) — good formal target, zero novelty; flag for triage as baseline.
   The *new* twist available: eth needs the identity only as a **cancellation mechanism for its
   tensor-network pieces**; a theorem "every cancellation pattern of Lemma 2 factors through a
   Clifford chirality action" has no classical analogue [HYPOTHESIS, novelty check needed].
2. *q-deformation* [HYPOTHESIS]: replace signs by Temperley–Lieb value — a "q-eight-square
   identity" inside `TemperleyLieb R δ n` / U_q(sl₂) tensorands, with `jones` as the
   braid-group carrier and the quantum trace replacing the matrix trace. Nothing in the four
   corpora or (to our knowledge) the literature states a four-term TL-algebra identity of
   Graves type; at roots of unity this would connect to the eth paper's finite-piece splittings.
   Novelty check against Kauffman–Lomonaco / quaternionic TL literature required before Phase 3.

### (b) Degree-theoretic vs time-theoretic computability — mutual empty zone

*TauCeti* [VERIFIED]: `friedberg_muchnik` (`Computability/FriedbergMuchnik/Basic.lean:364`) — RE
sets A, B of incomparable Turing degree; `degree_friedbergMuchnikSetA_mem_Ioo` (degree strictly
between `0` and `0′`); priority framework `Computability/Priority/` (monitored injury,
preservation); Turing reducibility/jump (`TuringDegree.lean`, `Jump/`). *eth* [VERIFIED via
anthropics.md]: one fixed `TM2ComputableAux` machine counts every k-CNF in
`⌊2^{C·min(km/√log m, k²n·loglog n/√log n)}⌋` steps (`MainResults.lean:177`); SETH/NSETH
refutations. *mathlib* [R3 §2]: `TM2ComputableInTime`/`InPolyTime`
(`Mathlib/Computability/TuringMachine/Computable.lean:161,174`) — an isolated island, and
mathlib's recursion-theory files are untouched by TauCeti's priority work.

*Candidate sketches* (novelty risk flagged honestly):
1. **Ladner-inside-the-counted-class** [HYPOTHESIS; LOW novelty risk is the problem]: using
   TauCeti's finite-injury scheduling to diagonalize against eth's certified counting machines,
   produce a decidable set L with `SAT ≤ₘ L` (many-one via eth's program composition) but L not
   decidable in `2^{δn}` for any δ — a Ladner (1975) theorem instantiated to the *specific proved*
   time class `⋂_δ DTIME(2^{δn})` that eth's MainTheorem places k-SAT in. Classical Ladner covers
   the abstract shape; the genuinely new formal content is only that the diagonalization runs
   against *one concrete, kernel-certified machine family* rather than an enumeration — thin.
   Recommendation: treat as warm-up, not a candidate.
2. **Priority at proved density** [HYPOTHESIS; MODERATE novelty]: TauCeti's construction
   enumerates witnesses at computably bounded stages (`attentionStages`, `2^k` bounds,
   `FriedbergMuchnik/Basic.lean` docstring items 1–2). eth's theorem supplies something classical
   computability never had: a *single machine whose runtime exponent is known on every input*.
   Candidate: a fixed-degree (0′-free) oracle bound for "the least stage by which the FM
   requirements stabilize against the eth machine" — i.e., compute the use function of the
   diagonalization against the certified counter explicitly in terms of eth's constant C.
   If the bound beats the classical one, that is a new theorem; if not, it is a formalization
   exercise [HYPOTHESIS; needs one week of scoping by the complexity bridge lane (R4) before
   Phase 3].
3. What would be *genuinely new* here: any statement mixing a **counting** output (eth's
   `numSat`, not just decision) with a **priority-produced set** — e.g. immunity of a
   FM-produced set against *counting* reductions at bounded multiplicative error. No classical
   theory of "counting-immunity at 2^{o(n)} counting time" exists to my knowledge
   [HYPOTHESIS; strongest novelty in this cluster, highest risk].

## 4. OpenAI-facing hooks (substrate list)

`research/survey/openai-math.md` (R2) did not exist at write time (survey/ contained
anthropics, mathlib-frontier, tauceti only) — worked from the tauceti side plus openai-math's
`CONTENTS.md` titles. Specific TauCeti decls a bridge would import:

- **BSD / Selmer** (openai-math results 002 ff., "full BSD from low Selmer corank"):
  statement layer `WeierstrassCurve.BirchSwinnertonDyer E` +
  `TauCeti.BirchSwinnertonDyerConjecture` (`AlgebraicGeometry/EllipticCurve/BirchSwinnertonDyer/Statement.lean:128`);
  continuation discipline `LSeries.IsContinuationOn` (`NumberTheory/LSeries/Continuation.lean:60`
  structure) and `LSeries.HasEntireExtension` (`EntireExtension.lean:57`) — the exact API the BSD
  statement is quantified over; Galois cohomology `EllipticCurve/GaloisCohomology/` (incl.
  `EtaleTwoDescent/`, `EmbeddingIndependence.lean`, `Finiteness.lean`); Mordell–Weil +
  `MordellWeil/Regulator/`; `WeierstrassCurve.LSeries/LFunction` + `algorithmicConductor`.
  **Named gap**: no Selmer-structure/corank machinery anywhere in TauCeti [VERIFIED absent by
  directory survey] — that is the piece openai-math's result 002 would have to build.
- **Kaplansky / Naimark / quasitrace** (openai-math counterexample preprints): C*-substrate
  `Analysis/CStarAlgebra/` — `GNS.lean` (`toGNS`, `gnsStarAlgHom`, `gnsVector` family :43–99),
  `CharacterSpaceMeasure.lean`, `Multiplier.lean`, `Ideal.lean`, `SelfAdjointGapInverse.lean`,
  `ConditionalExpectation/`; von Neumann layer `Analysis/VonNeumannAlgebra/`
  (`Bicommitant.lean`, `Density.lean`, `Adjoin.lean`). Kaplansky direct finiteness lives
  naturally on `GroupAlgebra`-meets-C* ground both dirs provide.
- **Free probability / spin-chain physics**: `Probability/FreeProbability/` — `IsSemicircular`
  characterisation (`Semicircular/Basic.lean:78 isSemicircular_iff_apply_pow`), circular, free
  Poisson, free CLT (`CentralLimit.lean`), free cumulants.
- **Statement-level handshake already in place**: `YazdiEulerClassOneTheorem`
  (`Geometry/Manifold/Foliation/EulerClass.lean:387`, recorded Prop) matches openai-math's
  Yazdi-type preprint territory — the cheapest possible bridge is *proving a recorded Prop*,
  i.e. exactly what openai-math claims to have done on paper.

## 5. 3sum-apsp consumer gaps (brief)

TauCeti layers that algorithmic questions could consume [VERIFIED decls]:
`Matrix.relativeEntropy`/`Matrix.vonNeumannEntropy` + Klein's inequality
(`Analysis/Matrix/Entropy.lean`); the compression inequality
`Matrix.conjTranspose_mul_cfc_mul_le_cfc_...` (`Analysis/Matrix/OperatorJensen.lean`) — relative
entropy is monotone under isometric compression; Pinsker + chain rule
(`InformationTheory/KullbackLeibler/Pinsker.lean`, `ChainRule.lean`). 3sum-apsp's thin-product
data-structure problems (`thinProduct`, `IsDataStructure`, `PaperStatements.lean`) are abstract
existence predicates with no probability, so any entropy bound needs a distribution semantics
first. *One candidate sketch (max)* [HYPOTHESIS, long-shot]: an information-theoretic lower
bound on the update/query trade-off of `thinProduct` instances — state the data-structure state
as a density matrix ρ on the query universe, apply operator-Jensen monotonicity to the
query-compression isometry, and conclude `D(ρ ‖ ρ₀) ≥ log(rank)`-type storage lower bounds; the
bridge is essential because 3sum-apsp owns the problem definition and TauCeti owns the entropy
calculus. Feasibility: low (needs a quantum/semantic encoding of `IsDataStructure`); flag for
triage only if the tensor-algebra lane (R7) finds a shared object first.
