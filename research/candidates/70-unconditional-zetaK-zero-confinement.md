# Candidate dossier 70 — unconditional-zetaK-zero-confinement

Lane A9 (dossier-writer), Cycle 2, 2026-11-13; corrected same day per (i) the orchestrator's
relay + lane A1's survey (`research/survey/axiommath.md` §4 H1 "Correction to the working
premise"), (ii) lane A5's round-4 pre-check (`research/novelty/round-4.md` §3, zone QR-D)
and its **§5 precision pass** (per-class 7/8-crossing resolution — folded into the novelty
section below), (iii) lane A3's donor remap (`research/novelty/axiommath-as-donor.md`
§(a)/(f) — the precise part-(a) formulation below is A3's), (iv) lane A5's **clock sweep
(round-4 §8, swept 2026-11-13; folded 2026-11-14 post-outage relaunch)** — Chang–Wang +
Ji cluster addenda, the 13-repo QR-D Lean ecosystem landscape, and the pending
QuasiRiemannTracker audit, recorded as the standing-notes block at the end of § Novelty
below (they sharpen, none overturns). Grows from dossiers 50
(`research/candidates/50-quasi-rh-truncated-window-constants.md`) and 20
(`research/candidates/20-hecke-zetaK-zero-density.md`) and their pilots. Tags: [VERIFIED] =
read in source this lane; [HYPOTHESIS] = proposed/reasoned, flagged.

**Honesty header (read first).** Two parts, honestly categorized.

- **Part A (primary; A3 §(a)) = ECOSYSTEM/GLUE-grade posture upgrade — not DISCOVERY.** A1/A3's
  correction is baked in: DZDF's Cureton–Thorner region Re s > 31/32 = 0.96875 is *strictly
  smaller* than openai's 7/8 = 0.875, so it **does not discharge pilot 50's `hQRH` binder as
  written** (`pilots/50/M1.lean:45`, `pilots/50/Dirichlet.lean:41`). What is true and is the
  deliverable: the **weakened 31/32 binders discharge unconditionally**, upgrading pilot 50's
  conditional landing theorems to unconditional ones at degraded constants — strip
  **[1/32, 31/32]** for ζ (K = ℚ route, three named glue lemmas) and, conditionally only on
  `hFEχ` (which **stays a binder**), the same strip for every Dirichlet L. Novelty class 2
  (formal-new, math-known: the classical Hadamard–de la Vallée Poussin regions are the
  nearest-miss class — they confine ζ zeros left of any fixed 31/32-type line for large |t|,
  and Landau-type regions do the d_K-dependent ζ_K analogue). The value is the **posture
  upgrade**: pilot 50's conditional core becomes unconditional and OAI-port-free on our own
  pin, exercising the first cross-package AxiomMath donor consumption.
  **Per-class novelty split (A5 round-4 §5.2–5.3, binding):** (α) for the ζ/Dirichlet class,
  **no "first" is claimed** — Liu-1 (arXiv:2610.12234, B_new = 0.8749570 ⊋ 7/8, Cor 14.1
  transferring to every Dirichlet L incl. ζ) is **already Lean-formalized in a public
  external repo** (github.com/liubaiying101/Slightly-improved-zero-free-half-planes-for-
  the-quasi-Riemann-hypothesis): pilot 50's `hQRH` is TRUE informally, and Part A's ζ/
  Dirichlet statements are concurrent formal work's weaker in-corpus siblings (the
  openai tree itself proves 7/8 ζ/Dirichlet NOW — `Nonvanishing.lean:19/:29`, A5 row 70;
  the port cost, not existence, was always the blocker);
  (β) for the ζ_K / Hecke-all-K class, "first unconditional ζ_K zero-confinement strip in
  Lean" **survives today only because Liu-2's Lean is unfinished** (B♭ = 0.8748866 uniform
  over every K, informal, v2 four days old, Lean in progress) — the strip widens to
  [1−B♭, B♭] ≈ [0.1251, 0.8749] the day it lands. Hence **all strip constants below are
  stated parametrically** (θ-binder; 31/32 = the DZDF instantiation).
- **Part B (secondary; A3 §(f) + A1 hook H1(a)) = the DISCOVERY-grade content.** DZDF's
  `dedekindAbelianQuotient` / `abelianFactorization` ([VERIFIED],
  `LFunctions/Dedekind/EntireAbelianQuotient.lean:13`, `AbelianRayCharacterFactorization.lean:62`)
  factor ζ_L = (∏ nonprincipal ray-class Hecke L-series of K) · ζ_K for **every** abelian
  Galois L/K — the general-abelian upgrade of tauceti's quadratic identity behind dossier
  42/pilot 42's `hfac` binder. Combined with zeta23's (or V2's) ζ-column proportions and
  Dirichlet-side inputs, the 42 assembly generalizes to **"on-line zero density of ζ_L ≥ 2/3
  given the g-factor's proportion hypothesis"** for every abelian extension (A3 §(f)'s exact
  shape), and — at base K = ℚ, where the g-factor splits into Dirichlet-type L's — plausibly
  unconditional. No corpus has any proportion statement for any ζ_L. A3 confirms this as a
  70-series feeder; flag for promotion to its own dossier after A5's dossier-level check.

Primary/secondary judgment (A9): Part A is primary because it is the deliverable that can land
(S effort, unblocked mathematics, the filename's mandate, A3 milestone 2); Part B is the
stronger theorem but M-effort with named open obligations (window-finiteness for ζ_L has no
on-pin donor — A3 §(f) caveat — and the Dirichlet↔ray-class-of-ℚ bridge must be built).

---

## Name

unconditional-zetaK-zero-confinement

## One-line pitch

With AxiomMath's DedekindZetaZeroFree on our exact mathlib pin, the pilot-50 binder pattern
re-based at the weakened 31/32 constant becomes unconditional: CT's ζ_K ≠ 0 (Re s > 31/32,
every K) + DZDF's Hecke FE + the pilots' reflection machinery give the first formal
zero-confinement strips for ζ and Dirichlet L at [1/32, 31/32] with no quasi-RH binder (and,
via DZDF's FE, ζ_K itself for totally complex K); and the same donor's general-abelian
factorization ζ_L = (∏ Hecke L)·ζ_K upgrades the 42 assembly to every abelian field (Part B).

## Precise mathematical statement

**Objects (all [VERIFIED]).** `NumberField.dedekindZeta` (mathlib `Mathlib/NumberTheory/
NumberField/DedekindZeta.lean:50` — the raw LSeries over ideal counts; mathlib has no
continuation/FE/zero theory for it). The CT statements: `DedekindZetaZeroFree.main`
(`Challenge/DedekindZetaChallenge.lean:30`, `Solution/DedekindZetaSolution.lean:9`, library
`dedekindZeta_ne_zero` `DedekindZetaZeroFree/Main.lean:9` ← `Quantitative.dedekindZeta_ne_zero`
`Nonvanishing/Mellin/Quantitative/DedekindZetaNonvanishing.lean:13`): for every `K [Field K]
[NumberField K]` there is `f : ℂ → ℂ` with (a) `DifferentiableOn ℂ f {1}ᶜ`, (b) `∀ s, 1 < s.re →
f s = NumberField.dedekindZeta K s`, (c) `∀ s, 31/32 < s.re → s ≠ 1 → f s ≠ 0`. Hecke form
`heckeCorollary` (`Challenge/…:34`, `heckeL_ne_zero` `HeckeCorollary.lean:12` ←
`HeckeCorollary.principalRayCharacter_ne_zero` `Nonvanishing/Hecke/PrincipalCharacter.lean:14` /
`nonprincipalRayCharacter_ne_zero` `NonprincipalCharacter.lean:15`): for `m : Ideal (𝓞 K) ≠ ⊥`,
`χ : RayClassCharacter K m` (structure `Arithmetic/RayClasses/Character.lean:12` — library copy; the Challenge copy sits at `DedekindZetaChallenge.lean:14`; locator fixed per A2's prework §b; IsPrincipal
:26; IsPrimitive :24), an `f` differentiable off {1} (entire if `¬χ.IsPrincipal`) with the
ideal-Dirichlet `HasSum` for ℜs > 1 and `∀ s, 31/32 < s.re → (s ≠ 1 ∨ ¬χ.IsPrincipal) → f s ≠ 0`.
DZDF's FE: `Hecke.heckeFunctionalEquation` (`LFunctions/Hecke/FunctionalEquation.lean:12`;
principal branch `FunctionalEquation/Principal.lean:14`): for **totally complex** F
(`NumberField.IsTotallyComplex`, mathlib `InfinitePlace/TotallyRealComplex.lean:210`), `m ≠ ⊥`,
primitive η: ∃ Λ holomorphic off {0,1}, completed-series agreement for ℜs > 1, and
`Λ s = Λ (1 − s)` (principal) resp. `Λ s = W · Λ' (1 − s)`, `‖W‖ = 1`, Λ' the conjugate
character's completion (nonprincipal, `FunctionalEquation/Nonprincipal.lean:15`). Trivial
character: `AbelianQuotient.trivialRayCharacter : RayClassCharacter K ⊤`
(`Arithmetic/RayClasses/Characters/TrivialCharacter.lean:14`, apply :27) — IsPrincipal by
computation, IsPrimitive vacuously (nothing is > ⊤). ζ_K ↔ ideal series:
`Odlyzko.hasSum_idealInverseNormPower` (`LFunctions/Dedekind/IdealNormSeries.lean:130`).
A **nontrivial zero** of a continuation f: `f ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1` (zeta23
`IsNontrivialZero` shape; pilot 50 `IsNontrivialZeroP50`, `pilots/50/M1.lean:33`).

### Part A — the weakened-binder discharge (A3 §(a) formulation; constants parametric)

**Parametric form (the A5 §5.3 re-scope, adopted):** every statement below is the
θ-instantiation of a parametric theorem — *for any θ ∈ (1/2, 1) and any continuation input
"zero-free for θ < Re s" (s ≠ 1 exclusions as stated), the nontrivial-zero strip is
[1 − θ, θ]* — with **θ := 31/32** the DZDF instantiation. The parametric shape is what
survives the QR-D cluster clock: the day a stronger formal zero-free input lands (Liu-2's
B♭-grade Lean, or the external liubaiying101 repo extended), the same pilot theorems
re-instantiate at the better constant with zero new proofs.

**(P) M2-31/32 landing theorem, ζ (primary).** Every nontrivial zero ρ of `riemannZeta`
(0 < Re ρ < 1) satisfies **1/32 ≤ Re ρ ≤ 31/32** — *unconditionally*: no `hQRH`-family binder.
The three glue lemmas discharging `hQRH₃₂ : ∀ s, 31/32 < s.re → riemannZeta s ≠ 0` from
`dedekindZeta_ne_zero` at **K = ℚ** (A3 §(a), each S-sized with a named anchor):

  (i) *ideals of ℤ collapse*: `Nat.card {I : Ideal (𝓞 ℚ) // absNorm I = n} = 1` for n ≥ 1, so
  `NumberField.dedekindZeta ℚ s = LSeries (fun _ => 1) s` (def `DedekindZeta.lean:50`; DZDF's
  own `hasSum_idealInverseNormPower` is the in-donor model of the fiber-by-norm collapse);
  (ii) *identification with the continued zeta on the half-plane*: `zeta_eq_tsum_one_div_
  nat_cpow` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:207`, 1 < re s);
  (iii) *identity-theorem transfer off the half-plane*: f and `riemannZeta` are both analytic
  on the connected `{1}ᶜ` and agree on a nonempty open subset — the exact route DZDF itself
  uses in `dedekindAbelianQuotient`'s proof (`AnalyticOnNhd.eqOn_of_preconnected_of_
  eventuallyEq`, z₀ = 2, `EntireAbelianQuotient.lean:35`).

With `hQRH₃₂` in place of `hQRH`, pilot 50's proved `strip_confinement`
(`pilots/50/M1.lean:44`), `strip_confinement_mem` (:75) and `strip_confinement_set` (:85) —
which are parameterized in the binder's constant — yield P and its set/window forms **verbatim
at the new constants** (the left half is *proved* from `riemannZeta_one_sub`
(`RiemannZeta.lean:178`), never a binder).

**(C1) Dirichlet shell at 31/32 (A3 §(a) continuation).** For every Dirichlet character χ mod q
(read as `RayClassCharacter ℚ (q)` — the narrow ray class group of ℚ mod q is `(ℤ/q)ˆ`; total
positivity kills the sign, matching `map_mul'`/`eq_zero_iff'`/`map_span'` against the Dirichlet
axioms; the HasSum-over-ideals is the Dirichlet series by the same ℤ-ideal dictionary), every
non-pole zero ρ of `LFunction χ` in the open strip satisfies **1/32 ≤ Re ρ ≤ 31/32**,
conditional **only on `hFEχ`** (which stays a binder: mathlib still lacks the product-form
Dirichlet FE — pilot 50's M2a finding — and DZDF's `heckeFunctionalEquation` covers only
totally complex fields, ℚ excluded). Right half: `heckeL_ne_zero` at K = ℚ discharges
`hQRHχ₃₂`; left half: `hFEχ` exactly as in `pilots/50/Dirichlet.lean:44–46`.

**(C2) ζ_K for totally complex K (the genuinely new family, via DZDF's FE).** For every
totally complex K, every CT continuation f of ζ_K, every nontrivial zero ρ: **1/32 ≤ ρ.re ≤
31/32**, unconditional (zero binders). Right half: CT (c) at ρ. Left half: the Λ ↔ f
identification (proof step A-2 below) + the principal FE's `Λ s = Λ (1 − s)` at
`η := trivialRayCharacter K ⊤` + CT (c) at 1 − ρ. Window forms in pilot-20's `stripWindow`
vocabulary (`pilots/20/M1.lean:34`) with window-finiteness from discreteness
(`IsCompact.inter_riemannZetaZeros_finite` pattern, `ZetaZeros.lean:68`).

**(C3) Hecke family (totally complex K, primitive finite-order χ).** All open-strip zeros of
the `heckeCorollary` continuation `f_χ` lie in [1/32, 31/32]: right half CT-Corollary at χ;
left half the nonprincipal FE (`Λ s = W Λ' (1 − s)`, `‖W‖ = 1`) reflecting to the conjugate
character χ̄ := conj ∘ χ (again a `RayClassCharacter K m`; primitivity/principality transfer
since `conj z = 1 ↔ z = 1`) + CT-Corollary at χ̄.

**(C4) All-K one-sided floor.** Every number field K, every CT continuation f: nontrivial
zeros satisfy `ρ.re ≤ 31/32` (CT alone — the statement that holds with no FE input at all).

**(Open seam — flagged, not claimed.)** The two-sided strip for K with real places (outside
ℚ): no ζ_K FE with Γℝ-factors in any corpus (DZDF's FE totally-complex-only [VERIFIED];
mathlib/tauceti/zeta23 none); DZDF's ray classes are *narrow* (`narrowIdealModulus`,
`PrincipalCharacter.lean:22`) — exactly why C2 restricts to totally complex. Donation-grade
extension, F3.f.

### Part B — 42-for-abelian-extensions (A3 §(f); the DISCOVERY-grade content)

**(B) Primary statement of Part B (A3 §(f) shape).** For every abelian Galois extension L/K,
with `f_K`, `f_L`, g from `dedekindAbelianQuotient` (`EntireAbelianQuotient.lean:13`) and
window-finiteness assumed for the factors (hypothesis; see risks): if each factor's zero data
carries the 2/3 on-line proportion (zeta23 `two_thirds_on_critical_line` for the ζ_K factor at
K = ℚ; ThmE-shaped hypotheses for the Hecke factors), then ζ_L's window zeros
(with multiplicity) satisfy

  N₀^{ζ_L}(T, 2T) ≥ (2/3 − ε) · N^{ζ_L}(T, 2T) for all T ≥ T₀(ε),

via `multOf f_L = multOf f_K + multOf multOf g` (order-additivity over products, pilot-42 M1's
`analyticOrderNatAt` glue) + the min-of-fractions merge (pilot-20's proved `family_merge`/
`two_thirds_of_components`; hCZ not needed for the with-multiplicity shape). Donor identity
[VERIFIED]: `abelianFactorization` (`AbelianRayCharacterFactorization.lean:62`) gives, for
ℜs > 1, ζ_L(s) = (∏_i Σ'_I χ_i I · N(I)^{−s}) · ζ_K(s) with **nonprincipal** (hence entire,
CT-covered) χ_i.

**(B-cor) Corollaries.** (i) At base K = ℚ the g-factor splits into Dirichlet-type L's, where
zeta23's Dirichlet 2/3 theorems apply — the *unconditional* version, every abelian L/ℚ
(cyclotomic fields and subfields): blocked only on the Dirichlet↔`RayClassCharacter ℚ`
bridge (C1's dictionary, to be proved once) + imprimitive-factor Euler immunity (the Euler
correction `(1 − χ*(p)p^{−s})` has all zeros on ℜs = 0, hence none in the open strip — a small
lemma `Complex.abs`-level). (ii) V2 as the ζ-column donor at C₀ = 0.6725 > 2/3
(`ZetaZeros.simple_proportion_lower`, `ZetaZerosV2/ZetaZeros/Main.lean:47`; A3 §(c) M4
architecture) and the V2-only shapes (average ≥ C₁, simple-or-on-line ≥ C₂) as the first
ζ_L-analogue candidates (A3 §(c) feeder note). (iii) [blocked] Distinct/simple 5/6-shapes:
need hCZ (`pilots/20-hCZ-NOTE.md` verdict: not provable today) — out of scope, stated to
bound the claim.

## Novelty check

Corpus side (rg, this session, exact patterns and counts; per `research/qa/decl-index.tsv`
caveats the OAI tree vendors mathlib-like content, so openai-math searched directly; the
v2-index caveats for the axiommath labels are round-4 §0 items 1–3):

- **Part A (strip confinement), formal absence:**
  - mathlib (`ff2494ea`): `rg -c '31 / 32' Mathlib/` → **0**; `rg -c '1 / 32' Mathlib/` → 2
    hits, both `Tactic/Inclusion/Extension/IntervalDyadicReal/Exp.lean` (unrelated);
    `rg -i -c 'zero.?confinement|strip.*zero|zero.*strip' Mathlib/` → hits only in
    Eisenstein-boundedness/Hadamard/Phragmén–Lindelöf (inspected, unrelated);
    `rg -c 'dedekindZeta.*zero|zero.*dedekindZeta' Mathlib/` → 1 hit =
    `dedekindZeta_residue_ne_zero` (`DedekindZeta.lean:72` — the residue, not zeros). mathlib
    has no interior zero-free region for ζ and no ζ_K zero theory at all. [VERIFIED]
  - zeta23: `rg -i -c 'dedekind' zeta23/Zeta23/` → **0**; `rg -c '31 / 32' zeta23/` → 0;
    `rg -c '1 / 32' zeta23/Zeta23/` → 0. [VERIFIED]
  - openai-math: `rg -c '31 / 32' lean/OAI/NumberTheory/` → **0** (the 31/32 matches in
    `lean/` are PCP/BinPacking constants); `rg -i -c 'zero.?confinement' lean/OAI/
    lean/ComparatorChallenges/` → 0; `rg -n '1 / 8' lean/ComparatorChallenges/
    HeckeSevenEighths.lean` → 0 (right half-plane only). The quasi-RH preprint (pdftotext,
    this session) treats number fields only historically (p.~1) and prints the ζ/Dirichlet
    1/8–7/8 strip as a proof step inside its Cor 1.2 — the nearest printed relative of Part A,
    at a different constant and family. [VERIFIED]
  - tauceti: `rg -c '31 / 32' TauCeti/` → **0**; "strip" hits are strip-convexity
    (`LFunctions/Zeros/Completion/FiniteOrder.lean:17` — inspected, unrelated). [VERIFIED]
  - axiommath: `rg -c '31 / 32'` → **0 hits in ZetaZerosV2 / ZetaZeros /
    PrimeNumberTheoremAnd / Weil / AreaLaw2D**; in DZDF, `31 / 32` occurs only in the
    zero-free statements and `1 / 32`/confinement occur **nowhere** — the donor states the
    half-plane, never the reflected strip. [VERIFIED]
  - Verdict, **per class** (A3 §(a) + A5 round-4 §5.2–5.3, the latter binding):
    **formal-new in-corpus** — no corpus theorem locates ζ or Dirichlet-L zeros in a proper
    closed substrip except through the `hQRH` binders — but **math-known** (strictly weaker
    than the classical Hadamard–de la Vallée Poussin region: σ ≥ 1 − c/log|t| confines zeros
    left of 31/32 for all large |t|; Broughan 2009 for ζ; Landau/Lee-type d_K-dependent
    regions for ζ_K), and now **per-class split against the external formal frontier**:
    - *ζ + every Dirichlet L (classes P and C1):* **no "first" claim.** The informal frontier
      is already below 7/8 (Liu-1 B_new = 0.8749570, arXiv:2610.12234, Cor 14.1 transferring
      to every Dirichlet L incl. ζ; Xu–Sang 0.8748867 conditional on Ope26a inputs,
      arXiv:2610.15291; Liu-2 B♭ uniform; and conditionally to 0.8744620 via Chang–Wang
      2611.00924, round-4 §8.1 — standing note 1), **and Liu-1's result is Lean-formalized
      in a public external repo** (github.com/liubaiying101/Slightly-improved-zero-free-half-
      planes-for-the-quasi-Riemann-hypothesis — Lean 4 + exact-arithmetic certificates,
      covering the Hecke family over ℚ(√−3) "and its Dirichlet and zeta consequences",
      round-4 §5.1 row 1) — with the ζ/Dirichlet *formal* side now counting **≥3 artifacts**
      (openai tree 7/8 in-corpus; Liu-1 external 34999/40000; Kontorovich/quasi-rh 11/12
      external, README-claimed — round-4 §8.3, standing note 3). Part A's ζ/Dirichlet
      statements are therefore the weaker,
      in-corpus, on-pin siblings of concurrent external formal work — value = posture
      upgrade + donor hygiene, and the external repo is a NEW discharge option for pilot 50's
      literal 7/8 binder (Knausgård-style external donor; statement portability unprobed —
      worth a probe alongside the 31/32 swap).
    - *ζ_K and finite-order Hecke L, all K (classes C2–C4):* "first unconditional ζ_K
      zero-confinement strip in Lean" **holds today** — confirmed by the 2026-11-13 GitHub
      sweep of the QR-D Lean ecosystem (13 repos, round-4 §8.3): **no ζ_K formal artifact
      anywhere** (tracker audit pending — standing note 4); the best *formal* exponent for
      these classes is the in-corpus 31/32 (DZDF); Liu-2 v2's B♭ = 0.8748866 (uniform,
      every K) is informal with Lean in progress, and Chang–Wang's conditional sub-B♭
      (§8.1) moves the *informal conditional* column only — but it is **on a clock**: the
      strip widens to
      [1−B♭, B♭] ≈ [0.1251, 0.8749] the day Liu-2's formalization lands (round-4 §5.3
      consequence (ii)). Hence the parametric θ-statement above.
- **Part B (abelian proportions), formal absence:** zeta23 proportions are ζ + Dirichlet only
  (`Challenge.lean:131–229`); tauceti's factorization is quadratic-only with no counting
  (dossier 20 §Novelty); DZDF has the factorization but no counting (A1 §2b); V2 is ζ-only;
  openai has no proportions for any L. **"≥ 2/3 on-line for ζ_L" appears in no corpus.**
- **Literature — round-4 §3 + §5 (zone QR-D) nearest-miss set, mandatory (A5 PART-2 will
  re-run dossier-level queries):**
  - §5.2 decision (the 7/8 crossing): **crossed twice, and not ζ-only** — Liu-1
    (2610.12234) gives Re s > 0.8749570 for every Dirichlet L incl. ζ (Lean-formalized,
    public repo); Liu-2 v2 (2610.26835) gives Re s > B♭ = 0.8748866 uniformly for every
    finite-order Hecke L and every ζ_K over every number field (informal, Lean in progress);
    nothing as of 2026-11-13 goes below B♭ **unconditionally** — Chang–Wang (2611.00924,
    2026-10-31; round-4 §8.1) reach B_* − 1/160000 = 0.8744620… < B♭ **conditionally only**
    (XS26-style conditionality on cited uniform input theorems; standing note 1 below).
    Cluster picture: **six papers in six weeks** (Ope26a 7/8 → Ope26b 11/12 + Landau–Siegel
    corollary → Liu-1 → Xu–Sang → CT 31/32 → Liu-2; clock-sweep addenda 2026-11-13:
    Chang–Wang conditional sub-B♭, Ji 2611.16665 quartic 599/600 — §8.1–8.2), **external
    Lean artifacts now ≥3** (liubaiying101 complete; Liu-2 in progress on top of
    [Liu26b]+[CTLean]; AlexKontorovich/quasi-rh README-claimed 11/12 ζ+Dirichlet with NO
    ζ_K content — §8.3, standing note 3) — the informal frontier is already below 7/8
    *uniformly*, so
    pilot 50's `hQRH` is TRUE informally and the only formal discharge paths today are the
    external Liu repo (unprobed) or the weakened 31/32 binder in-corpus (this dossier).
    **[Revision 2026-11-13, per A5's PART-2 row 70 + `pilots/50-M2-31-32-spec.md` (which
    supersedes round-4 §5.2's two-path framing): THREE routes — R1 (preferred): openai
    in-corpus at FULL 7/8 (the tree proves it NOW, `OAI/NumberTheory/DirichletL/
    Nonvanishing.lean:19/:29` — the blocker was always the 2,924-file port, never
    existence; A5/liu1-as-donor §4); R2: DZDF in-corpus at 31/32 (this dossier, gated
    G1); R3: Liu-1 external at 34999/40000 ≈ 0.874975, statement-binder only (gated G7).]**
  - QR-2: **the CT paper is hexagonmath.org-only** (`hexagonmath.org/2610.00200`, v1
    2026-10-12 / v2 2026-10-14; NOT on arXiv — `au:Cureton` finds nothing mathematical).
    Method item 14: **arXiv sweeps are unsound for this cluster**; CT is treated here as a
    kernel-verified in-corpus donor, never as established informal literature. Round-4 could
    not rule out that CT's paper prints the reflected strip in passing — if it does, Part A's
    novelty caps at formalization-only.
  - QR-1: Lee arXiv:2002.05456 (explicit ζ_K zero-free regions, trig-polynomial + annealing);
    Das–Gaba–Lee–Savalia–Wong arXiv:2506.19319 (2025, new explicit regions, extends Kadiri to
    all number fields); Das–Kadiri–Ng arXiv:2508.09480 (effective Chebotarev from them) — the
    classical-informal equivalents class for Part A's content.
  - QR-3: **Liu arXiv:2610.12234** (B = 0.8749570…, finite-order Hecke L over ℚ(√−3) +
    Dirichlet) and **Liu arXiv:2610.26835** (v1 2026-10-19 / v2 10-29; per the §5 close-read:
    **B♭ = 0.8748866 uniform over every finite-order Hecke L and every ζ_K over every number
    field**, Lean in progress) — the live quasi-RH cluster; these are *half-plane* results
    (Liu-1's optimality framing is "within the specified exponent-comparison system only",
    round-4 §5.1), never strips — the reflected-strip packaging is what Part A adds.
  - QR-5: **Trudgian–Zuniga Alterman arXiv:2610.16010** (2026-10-12, "Low Lying Zeros of
    Dedekind Zeta Functions", h(K) < 0.58 + a ≥ c·n_K zero-count clause).
  - QR-4: Thorner arXiv:2608.12257 (power-sums, GL(n)/Rankin–Selberg zero-free, ineffective
    constants — the machinery family CT builds on).
  - QR-6: Broughan 2009 (*Equivalents of the RH I*), Trudgian 2012, Lagarias–Odlyzko 1977 —
    the classical anchors. A UNIFORM 1−δ strip for all K is stronger than anything classical
    (it kills exceptional/Siegel-type zeros for ζ_K) — which is exactly why Part A's honesty
    rests on the *donor's* kernel verification, not on informal literature status.
  - **Cluster depreciation clock (round-4 §3; addenda §8, 2026-11-13):** five-plus papers
    in six weeks (openai 7/8 + 11/12 preprints → CT 31/32 every K → Liu abelian half-planes
    → Trudgian–ZA low-lying zeros; sweep addenda: Chang–Wang 2611.00924 conditional below
    B♭, Ji 2611.16665 quartic 599/600 — §8.1–8.2), three-plus formal components in the
    ecosystem (openai in-corpus challenge, liubaiying101, Kontorovich/quasi-rh — §8.3),
    one our own donor. **Any novelty claim of the form
    "first quasi-RH for ζ_K" or "improved zero-free half-plane" is DEAD** — taken by the
    cluster. What remains ours, per round-4: (i) weakened-binder discharge exercises
    (verification/ecosystem value — Part A); (ii) consequence statements nobody has formalized
    (unconditional strip-confinement in the zeta23 window machinery, Part A); (iii) the
    genuinely open cross-statements feeding dossiers 20/40/42's ζ_K-proportion line with
    theorem-grade inputs (Part B — H1(b)'s "conjecture-grade → theorem-grade" upgrade).
  - Part B literature: dossier 20's R8 round-1/2 evidence (AF 2608.13637, Lamzouri 2609.02882,
    2608.16034, 2609.27808 — all ζ/Dirichlet; DLRT 1908.04876 = the ζ_K-distinct nearest miss)
    found no Hecke/ζ_K/ζ_L proportions. **[A5 PART-2 confirmation pending for both parts.]**
- Nearest misses (summary): DZDF CT (right half-plane only); openai Cor 1.2 proof (ζ/Dirichlet
  strip, printed not stated); A3 §(a)'s HdV/Broughan class (math-known equivalents);
  Liu 2610.26835 (abelian Hecke half-planes — overlaps Part B's *family* but proves
  nonvanishing, not proportions or strips); DZDF `abelianFactorization` (identity, no consumer);
  dossier 20's engine route (the sibling path to non-Dirichlet proportions, L-effort).

### Standing notes — clock sweep 2026-11-13 (round-4 §8; folded by A9 2026-11-14)

Folded from A5's §8 clock sweep (the orchestrator's relay was sent pre-outage and executed
post-relaunch). Every item below **sharpens, none overturns**, a claim of this dossier.
Exact citations:

1. **Chang–Wang, arXiv:2611.00924** (2026-10-31; missed by A5's earlier sweep via a
   truncated results head — lesson recorded in round-4): "exhaustion-aware product moment"
   obtains **B_* − 1/160000 = 0.87446205769…, below Liu-2's B♭ = 0.8748866** — the
   informal frontier moves below B♭ **conditionally only** (conditional "on the cited
   general-field theta, detector, prior-bound and Mellin input theorems in their stated
   uniform forms" — XS26-style conditionality). **Unconditional record unchanged
   (Liu-2 B♭)** ⇒ the §5.2 line above carries the conditional/unconditional split, and
   the θ-parametric re-scope absorbs even a validated Chang–Wang (re-instantiation,
   zero new proofs).
2. **Ji, arXiv:2611.16665** (2026-11-12, "Proof of the Quasi Riemann Hypothesis using
   Q[i]"): quartic Gauss sums replace cubic (new theta-kernel: quartic Kubota; new base
   field ℚ(i)); ζ_{ℚ(i)} + ζ zero-free Re s > **599/600** = 0.99833 — a **weaker**
   constant than both B♭ and 31/32 (and field-specific, not uniform); title over-claims
   vs the cluster's sense of "QRH"; **no frontier move**; must-cite list grows (cluster
   now: Ope26a → Ope26b → Liu-1 → Xu–Sang → CT → Liu-2 → Chang–Wang (cond.) → Ji).
3. **QR-D Lean ecosystem = 13 repos, not 2** (GitHub `"quasi-Riemann" language:Lean`,
   swept 2026-11-13): beyond liubaiying101 ×2 and the audited Zhang-Liao/CoolRmal 7/8
   extractions — **AlexKontorovich/quasi-rh** (10-26; README-claimed complete
   formalization of `riemannZeta_ne_zero_of_re_gt_elevenTwelfths` = 11/12 for ζ +
   Dirichlet, v4.34.1, reuses OpenAI's analytic core; **NO ζ_K content**);
   GTimG/QuasiRiemannTracker (note 4); LUOLINGc325/quasi-rh-lean ("main results of the
   Quasi-Riemann…", 10-28); LW56e2/quasi-riemann-improved; a CrossNoX extension;
   akashlevy/qrh (obstructions notes); jacobalansussman/qrh-zero-free-bounds ("a map of
   66 dead ends", 11-04); **DrMurphyIsIn/qrh-debruijn-newman** (kernel-checked Λ ≤ 9/32
   for de Bruijn–Newman — the main-run round-1 §12 "Λ absent everywhere" gap is TAKEN by
   a third party; no Cycle-2 dossier affected; main-run donation-surface note only);
   randogelist (unaudited). **No new ζ_K formal artifact found ⇒ this dossier's
   per-class split (ζ_K/all-K strip ours alone, class β above) SURVIVES the sweep**; the
   ζ/Dirichlet formal side now has ≥3 artifacts (openai tree 7/8 in-corpus; Liu-1
   34999/40000; Kontorovich 11/12) — class (α)'s "no first claimed" posture unchanged,
   now with a third confirmation.
4. **GTimG/QuasiRiemannTracker** (created 10-09, 389 commits, pushed 2026-11-13 08:28;
   README: "Every result on the website is verified"; tracks "bounds on the real parts
   of zeros of Dirichlet L-functions"): the site is JS-rendered — NOT sweepable by
   WebFetch; **[pending A5 tracker audit]** (browser pass or clone, in flight at
   relaunch) to determine kernel-vs-certificate verification and any ζ_K/Hecke entries.
   The per-class split in note 3 assumes no ζ_K entry — revisit standing note 3/β above
   when A5's audit lands (orchestrator to relay).

## Bridge analysis

- Corpora bridged: **Part A: axiommath/DZDF (CT + Hecke FE) × pilot-50 machinery (confinement
  shell, binder discipline) × mathlib (`riemannZeta_one_sub`, `zeta_eq_tsum_one_div_nat_cpow`,
  identity-theorem layer, discreteness patterns). Part B: DZDF (`dedekindAbelianQuotient`) ×
  zeta23 (ζ + Dirichlet 2/3 proportions — the zeta23-constants leg) / ZetaZerosV2 (C₀-column,
  A3 §(c)) × pilot-42/20 assembly machinery × mathlib (`analyticOrderNat`).**
- Why essential (no single side states or proves either part): DZDF has CT and the FE but
  states no consequence joining them, its FE is totally complex + primitive only, and it has
  no counting (A1 §2b); mathlib has no interior zero-free region for ζ and no ζ_K analytic
  theory; tauceti factors ζ_K (quadratic only) with no zero-free input and no counting;
  zeta23/V2 have proportions but no ζ_K object and no factorization; the pilots' shells are
  binder-conditional by construction and their literal 7/8 discharge needs the openai port
  (2,924 files); the glues (ℤ-ideal collapse, Dirichlet↔ray-class-of-ℚ, Λ ↔ f transfer,
  Euler-immunity) exist in no corpus.
- Empty-zone fit: Part A realizes the "Dualities" row of `research/bridges/analytic-nt.md` §2
  at the Dedekind-ζ level and is the location-side input to E1 (dossier 20); Part B realizes
  E1's product-assembly route generalized (A1 §4 H1, A3 §(f)). Round-4 §3 records the zone as
  QR-D (verdict: HOT for constant-shaped claims — not ours; WARM formalization-first for
  consequence statements — ours).

## Proof-strategy sketch

**Part A.**

1. (S, A3's three lemmas) Discharge `hQRH₃₂` at K = ℚ: (i) ℤ-ideal collapse →
   `dedekindZeta ℚ s = LSeries (fun _ => 1) s`; (ii) `zeta_eq_tsum_one_div_nat_cpow`
   (`RiemannZeta.lean:207`); (iii) identity-theorem transfer (`AnalyticOnNhd.
   eqOn_of_preconnected_of_eventuallyEq`, the DZDF-internal route). Then P is pilot 50's
   `strip_confinement` (`M1.lean:48–71`) with the constant substituted — left half from
   `riemannZeta_one_sub` verbatim.
2. (S) C1: the Dirichlet↔`RayClassCharacter ℚ (q)` dictionary (fields checked axiom-by-axiom
   against `Character.lean:12–18`; total positivity kills the sign); `hQRHχ₃₂` :=
   `heckeL_ne_zero` at K = ℚ; `strip_confinement_dirichlet` (`Dirichlet.lean:40`) re-based,
   `hFEχ` untouched.
3. (The honest glue of C2) Λ ↔ f identification: with Λ from the principal FE at
   `trivialRayCharacter K ⊤` (`absNorm ⊤ = 1`), both Λ and `|discr K|^{s/2}·Γℂ(s)^{n_c}·f s`
   are holomorphic on the connected `D := {0 < s.re} ∖ {1}` (Γ poles at nonpositive integers
   only) and agree on `{ℜs > 1}` (FE-HasSum × `hasSum_idealInverseNormPower` × CT (b), HasSum
   algebra); identity theorem ⇒ equality on D. (~40 LoC; the one new proof object.)
4. (Routine) C2's halves: right = CT (c); left = step 3 + `Λ ρ = Λ (1 − ρ)` + `Γℂ(1−ρ) ≠ 0`
   (mathlib `Gamma_ne_zero`, `Gamma/Basic.lean:492`/`:523`) + CT (c) at 1−ρ. C3: the same per
   character on the nonprincipal branch (`Λ s = W Λ' (1 − s)`, `‖W‖ = 1`; conjugate character;
   primitivity transfer `conj z = 1 ↔ z = 1`).
5. (Routine) Packaging: set/window forms + finiteness (discreteness; `ZetaZeros.lean:68`
   pattern; pilot-20 `WindowFinite`).

**Part B.**

6. (S–M) Build the count-level factorization transfer: `multOf f_L ρ = multOf f_K ρ +
   multOf g ρ` from `f_L = g · f_K` off {1} (order-additivity over products of holomorphic
   factors; pilot-42 M1's `analyticOrderAt` glue iterated over the `Fin n` product from
   `abelianFactorization`'s proof shape — g is literally `∏ i, F i`,
   `EntireAbelianQuotient.lean:28`).
7. (Routine) Min-of-fractions merge over n+1 factors (`family_merge`/
   `two_thirds_of_components`, pilot 20 M1 GREEN; hCZ not invoked) ⇒ (B) under the
   factor-proportion hypotheses.
8. (S–M, the ℚ route) B-cor (i): the C1 dictionary + the Euler-immunity lemma (correction
   factors' zeros lie on ℜs = 0) + zeta23 Dirichlet statement ports ⇒ the unconditional
   abelian-L/ℚ version.
9. (Packaging) B-cor (ii): V2 ζ-column swap per A3 §(c) M4 (count-identification glue,
   `2/3 ≤ C₀` numeral lemma).

**Hardest steps:** A-3 (identity-theorem transfer) and B-8's dictionary; B's
window-finiteness obligation (below) is the structural risk.

## Feasibility

Preliminary, R9's F0–F6 shape. **Gating fact (A3 §0, adopted): DZDF on-pin status is
STATEMENT-LEVEL ONLY** — the Challenge file elaborated clean against the cached pin
(`axiommath-bump/logs/run1.log`: "challenge DedekindZetaZeroFree/Challenge/
DedekindZetaChallenge.lean: OK"); **the full library build was never run** (`axbump.py:44–45`
`BUILDS` lists only ZetaZeros/ZetaZerosV2). Expected blockers, read off the clone: lakefile
requires TauCeti @ `d92acc5c` (= exactly our `tauceti` sibling HEAD, v4.36.0-rc2 — fine) and
the **vendored FiniteAbelianGlobalReciprocityv2 at `vendor/class-field-theory` pinned to Lean
v4.35.0-rc2 / mathlib `06535612`** — a second-mathlib + old-toolchain subtree, the same class
of job as the V2/PNT+ redirect-and-fix loop (9 fix rounds); stale manifest besides (resolves
mathlib `0493595e`, needs `lake update`). A3's recommendation 3: extend `axbump.py` `BUILDS`
with DedekindZetaZeroFree + a vendor-CFT mathlib-redirect patch. Until green, every
unconditional label below is statement-level (fallback: `hDZ : ∀ K, ∃ f, …` binder quoting
the Challenge form, already elaboration-validated by run 1 — the pilot-50 interface-binder
pattern one level up). **A7's ProbeG1 verdict pending.**

- F0: Part A = P + C1 + C2 + C4 (A3 milestone 2 "Pilot 50 M2-31/32"); Part B = statement (B)
  + B-cor (i)/(ii).
- F1 mathlib entry points (on `ff2494ea`): `NumberField.dedekindZeta` (`DedekindZeta.lean:50`),
  `zeta_eq_tsum_one_div_nat_cpow` (`RiemannZeta.lean:207`), `riemannZeta_one_sub`
  (`:178`), `NumberField.IsTotallyComplex` (`TotallyRealComplex.lean:210`), `NumberField.discr`,
  `Ideal.absNorm`, `Complex.Gammaℂ` (`Gamma/Deligne.lean:54`), `Complex.Gamma_ne_zero`
  (`Gamma/Basic.lean:492`, complex form doc `Gamma/Beta.lean:30`), the identity-theorem layer
  (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq_…`), `analyticOrderNatAt`
  (`Analytic/Order.lean:63`), `le_analyticOrderAt_add` (:228),
  `IsCompact.inter_riemannZetaZeros_finite` (`ZetaZeros.lean:68`),
  `completedLFunction_one_sub` (`DirichletContinuation.lean:291`).
- F2 donor lemmas ([VERIFIED] in-repo this session unless noted): as listed in § Precise
  statement, plus pilot donors: 50 `M1.lean`/`Dirichlet.lean` (the two confinement shells,
  constant-parameterized); 20 `M1.lean` (`stripWindow` :34, `multOf` :50, `WindowFinite` :68,
  `family_merge`); 42-M1/M2a (factorization consumption; A3 §(c): V2's
  `simple_proportion_lower`/`distinct_proportion_lower` `ZetaZerosV2/ZetaZeros/Main.lean:47,88`
  discharge the ζ-side binders unconditionally — B-cor (ii) rides on this). Axiom hygiene:
  standard triad only (DZDF `formalization.yaml` status; A3 §0 grep: zero `native_decide`,
  zero active sorry in `DedekindZetaZeroFree/{DedekindZetaZeroFree,Solution}/`); on-pin
  `#print axioms` of the two DZDF headlines still to run (A3 recommendation 4).
- F3 missing glue: (a) A3's three K = ℚ lemmas (i)–(iii) — new, S each; (b)
  Dirichlet↔RayClassCharacter-of-ℚ dictionary — new, S–M (needed by C1 and B-cor (i); prove
  once, share); (c) Λ ↔ f identity transfer (C2) — new, S; (d) conjugate character +
  primitivity transfer (C3) — new, S; (e) Euler-correction strip-immunity (B-cor (i)) — new,
  S; (f) product-form `DirichletCharacter.LFunction_one_sub` donation (the `hFEχ` killer —
  pilot 50 M2a's one-decl note; would upgrade C1 to zero binders); (g) [flagged] ζ_K FE with
  Γℝ factors for general K — L-grade, out of scope.
- F4 Effort: **Part A: S** (A3 §(a): "all glue S-sized"; the landing theorems are pilot-50's
  proved shells re-based). **Part B: M** (dictionary + n-factor bookkeeping + zeta23/V2 ports;
  plus the window-finiteness obligation below).
- F5 Risks: (i) the DZDF on-pin build (gate above) — binder fallback keeps the pilot landable;
  (i-bis) **the QR-D cluster clock** (round-4 §5.3): Liu-2's Lean-in-progress would widen
  the ζ_K strip to [1−B♭, B♭] on landing — mitigated by the parametric θ-statement (re-
  instantiation is zero new proofs); the external liubaiying101 repo is simultaneously an
  opportunity (a literal-7/8 discharge donor for pilot 50, portability unprobed) and a
  novelty competitor for the ζ/Dirichlet class — probe recommended (Knausgård-style external
  donor handling);
  (ii) Part B's **window-finiteness for ζ_L** has no on-pin donor (V2 is ζ-only; A3 §(f)
  caveat) — carry `WindowFinite (multOf f_L)` as an explicit hypothesis (the pilot-20
  `zeroMultOf hfin` pattern) or derive from discreteness (f_L analytic off {1} — the C2
  pattern, likely fine but a real obligation); (iii) narrow-ray-class caveat (C2/C3's
  total-complexity restriction is a feature — document, don't fight); (iv) `nrComplexPlaces`/
  `absNorm ⊤ = 1` bookkeeping; (v) V2-vs-zeta23 window conventions (cumulative vs dyadic —
  A3 §(c) glue assumes shape-matching; B-cor (ii) needs the translation); (vi) novelty
  depreciation clock (round-4 §3) — if Liu-type results add strips or proportions for abelian
  fields, Part B's claim erodes; A5 PART-2 must sweep hexagonmath.org directly.
- F6: kernel-only, math-proof1 standard; Modal probe infra for the binder shells
  (`research/pilots/32/run_pilot.sh` pattern); the discharge build is A7/G1 territory (A3
  recommendation 3), not a probe.

## Significance

Part A: an honest posture upgrade — pilot 50's conditional confinement core lands
unconditionally on our own pin with zero quasi-RH binders (Dirichlet shell: one binder left,
`hFEχ`), at degraded constants the geometry forces (right edge 7/8 → 31/32, left 1/8 → 1/32);
the first formal zero-location statements for ζ_K itself (totally complex K, via DZDF's FE)
and the first exercise of the Cycle-2 donor-swap machinery on a statement-level-only donor.
Part B: if A5 PART-2 confirms, the first critical-line proportion theorem for an L-function
family beyond ζ/Dirichlet/quadratic — the cheap sibling of dossier 20's engine route, and the
H1(b) "conjecture-grade → theorem-grade" upgrade the round-4 pre-check names as the zone's
genuinely open content.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (A9, non-binding):** Part A: Novelty **2** (A3's class: formal-new,
math-known, HdV/Broughan nearest-miss; **per-class split per A5 §5.3**: the ζ/Dirichlet
statements carry NO first-claim — the openai tree (7/8, proved) and Liu-1's external repo
(34999/40000) own that class — and the ζ_K/Hecke-all-K first-claim holds on the Liu-2
clock; caps at 1 if CT's paper prints the strip),
Significance **3**, Effort **1–2 (S)** — rank ≈ 3–4; pilot as A3 milestone 2 (M2-31/32),
spec'd with routes R1 (openai 7/8) / R2 (DZDF 31/32, G1) / R3 (Liu-1 external, G7),
with the liubaiying101 portability probe as the optional companion.
Part B: Novelty **3–4** (no corpus, and no literature trace in round-4's §1/§3 sweeps, states
ζ_L proportions; DLRT 1908.04876 and Liu 2610.26835 are the flanks — pending A5 PART-2),
Significance **4**, Effort **2–3 (M)** — rank ≈ 4–8; recommend promotion to its own dossier
once A5 weighs in. Honest categories: **Part A = ECOSYSTEM/GLUE-grade posture upgrade** (the
conditional core it upgrades was pilot 50's, already done); **Part B = DISCOVERY-grade
content, CONDITIONAL-CORE today** (conditional on the factor-proportion inputs +
window-finiteness; the ℚ-route discharge is named).
**[A5 PART-2 LANDED 2026-11-13 (row 70): N-adjust "artifact-grade (no discovery N)";
tier HOT-cluster / WARM-artifact; per-class split CONFIRMED — "ζ_K-strip (all K) is OURS";
Part B's queries resolved in row 75 (see dossier 75's revision).]**
**[Clock-sweep must-cites FOLDED 2026-11-14 (round-4 §8 → standing notes in § Novelty):
Chang–Wang 2611.00924 — conditional-only frontier 0.87446205 < B♭, unconditional record
(Liu-2 B♭) unchanged; Ji 2611.16665 — 599/600 ζ_{ℚ(i)}+ζ, weaker constant, no frontier
move; 13-repo QR-D Lean landscape incl. Kontorovich/quasi-rh (README-claimed 11/12
ζ+Dirichlet, NO ζ_K) — the ζ_K-strip per-class split SURVIVES; GTimG/QuasiRiemannTracker
[pending A5 tracker audit].]**
