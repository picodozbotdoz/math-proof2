# Candidate 20 — hecke-zetaK-zero-density

Owner: lane R5 (ant-bridge). Realizes empty zone E1 of
`research/bridges/analytic-nt.md` §4; companion record-side dossiers are owned by
lane R1 (cross-reference: `research/bridges/tauceti-contributions.md` §2 C1–C3 —
R1's C3 converged on this candidate from the tauceti-record side; per the
orchestrator's split, R5 owns THIS engine-instantiation dossier, R1 owns
companion dossiers from the record side). Created 2026-11-09.
Tags: [VERIFIED]/[HYPOTHESIS] per claim.

## Name

hecke-zetaK-zero-density

## One-line pitch

zeta23's density engine is already generic in a zero-configuration plus
coefficient data (`PaperInputsChi (κ q : ℕ) (c : ℕ → ℂ) (Z : ZeroConfig)`,
`Zeta23/ThmE/Hypotheses.lean:127`), so Alpöge–Furman-type zero-density
proportions (≥ 2/3 of zeros simple and on the critical line, ≥ 5/6 distinct,
Montgomery–Taylor-window constants 2−1/c₁* ≈ 0.6725 / (3−1/c₁*)/2 ≈ 0.8363)
can be produced for **L-function families no single corpus can even state**:
the finite-order Hecke L-functions of ℚ(√−3) (openai-math's
`SevenEighths.HeckeFamily`) and the Dedekind zeta functions of quadratic
fields (tauceti's factorization record) — as two instances of one
instantiation theorem.

## Precise mathematical statement

**Shared vocabulary** (copy `ChallengeDeps.lean:41–95` shapes). For a
meromorphic-continuable L : ℂ → ℂ with no pole in the open strip: a nontrivial
zero is `L ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1`; `zeroMultL L ρ :=
(analyticOrderAt L ρ).toNat`; `zerosInL L T₁ T₂ := {ρ | nontrivial ∧ T₁ <
ρ.im ∧ ρ.im ≤ T₂}`; `NcountL L T₁ T₂ := ∑ᶠ ρ ∈ zerosInL L T₁ T₂, zeroMultL L ρ`;
`N0starL`, `N0simpleL`, `NdistL` as in `ChallengeDeps.lean:63–67` with `L` in
place of `riemannZeta`.

**(I) Instantiation theorem (the engine restated at its true generality).**
For all κ q : ℕ, c : ℕ → ℂ, Z : ZeroConfig satisfying
`Zeta23.ThmE.PaperInputsChi κ q c Z` (`ThmE/Hypotheses.lean:127`; fields below
in § Feasibility F2), the conclusions of Theorems A/B/C/D hold verbatim for
Z's counting functions:
`∀ε>0, ∃T₀, ∀T≥T₀, (2/3 − ε)·Z.N T (2*T) ≤ Z.N0star T (2*T)` — and the 1/2
(simple), 3/4, and c₁*-window analogues.
[VERIFIED as latent]: this is literally `Zeta23.ThmE.thmE_A_lam` … `thmE_C₀`
assembled over `PaperInputsChi` (`ThmE/Final.lean:29–105`), i.e. zero new
mathematics — it exists to be *instantiated*.

**(II) Hecke instance (the new theorem, family 1).** K := ℚ(√−3). For every
χ in openai-math's `SevenEighths.HeckeFamily.Character` (finite-order Hecke
character of 𝓞_K: `Character.modulus : Ideal O`, `modulus_ne_bot`,
`residue : MulChar (O ⧸ modulus) ℂ`, `unit_trivial`, `period`,
`SevenEighths.HeckeFamily.LFunction χ s = continuedLattice χ s / 6` with
`continuedLattice = HeckeTheta.latticeL (coefficients χ)` —
`lean/ComparatorChallenges/HeckeSevenEighths.lean`, "Character" structure and
`LFunction_ne_zero_of_seven_eighths_lt_re` at file end), with q_χ := the
conductor datum (Norm of modulus × archimedean factor), κ_χ the parity
determined by χ on the archimedean place:

  liminf_{T→∞} N0starL(L_χ, T, 2T) / NcountL(L_χ, T, 2T) ≥ 2/3,
  liminf N0simpleL/NcountL ≥ 1/2,
  liminf NdistL/NcountL ≥ 5/6,
  and the Montgomery–Taylor upgrades ≥ 2 − 1/c₁*, ≥ (3 − 1/c₁*)/2 (c₁* =
  `ChallengeDeps.cMT`, `ChallengeDeps.lean:107`).

**(III) Dedekind instance (family 2, quadratic).** For K = ℚ(√d) with
fundamental discriminant D and primitive quadratic χ_D: the same four
proportions for `L := NumberField.dedekindZeta K`, i.e. for the zeros of ζ_K.
Via tauceti's `NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`
(`TauCeti/NumberTheory/LFunctions/DedekindZeta/Quadratic.lean:19` cites;
identity at `:100 dedekindZetaC_eq_riemannZeta_mul_LFunction`).

## Novelty check

Corpus-side (rg, this session; patterns given so Phase 4 can re-run):

- **mathlib** (`encore-mathlib/repo/mathlib4`, rev `ff2494ea`):
  `rg -i -c 'zero.?density|N0star|proportion.*zeros' Mathlib/NumberTheory/` →
  0 hits in LSeries/ModularForms (only the ZetaZeros discreteness file exists).
  No Hecke L, no Dedekind zeta object at all
  (`rg -i 'dedekindZeta' Mathlib/NumberTheory/` → 0). [VERIFIED]
- **anthropics_formal-math (zeta23)**: density machinery exists ONLY for ζ and
  primitive Dirichlet L: `rg -rn 'hecke' anthropics_formal-math/zeta23/Zeta23/`
  → 0 content hits (27 filename/comment matches are Mathlib-attribution
  strings); `rg 'NcountL' Challenge.lean` → only Dirichlet binders
  (`Challenge.lean:131–229`). [VERIFIED]
- **openai-math**: has the Hecke family and a full **log-free zero-density +
  zero-counting theory for Dirichlet L** — `OAI/NumberTheory/Ostmann/
  ZeroDensity/` (~370 files): `PrimitiveComplexCharacter.full_zero_sum_rate`
  (`CharacterFullZeroCount.lean:12`: ∑_{z∈S} ord ≤ (32/log(14/13))·(T+1)·
  log(q(T+2))), `regularizedZeta_zero_free_region`
  (`ZetaZeroFreeRegion.lean:43`: 1 − Re ρ ≥ c/(log(|Im ρ|+2)+1)),
  `PublishedComplexZeroDensity.lean`, `CharacterZeroMultiplicity.lean`,
  smoothed explicit formula (`SmoothExplicitFormulaCore.lean`,
  `Ostmann/Dirichlet/SmoothedExplicitFormula.lean:34
  exists_smoothed_explicit_formula`). **None of it states critical-line
  proportions or simplicity proportions for any L**, and none covers Hecke L
  (`rg -i -c 'hecke.*analyticOrderAt|N0star|critical.?line.*proportion'
  lean/OAI/NumberTheory/` → 0). [VERIFIED]
- **tauceti**: no counting functions anywhere
  (`rg -i -c 'Ncount|zerosIn' TauCeti/NumberTheory/LFunctions/` → 0); has the
  ζ_K factorization and completion/order-transfer layer
  (`LFunctions/Zeros/Completion/`), i.e. structure, not density. [VERIFIED]

Literature (searches via lane R8's round-1 evidence + queries queued for
round 2): the AF method (arXiv:2608.13637v2) covers ζ and Dirichlet L only;
R8 round-1 (`research/novelty/round-1.md` §4) found the follow-up ecosystem —
Lamzouri arXiv:2609.02882 (independent reproof, same constants, plus
simple-OR-on-line ≥ 88.76%), arXiv:2608.16034 and arXiv:2609.27808
(prime-modulus Dirichlet families, near-microscopic heights; Gevrey
localization) — **all Dirichlet-family**; no Hecke-L or ζ_K critical-line
proportion found. `[R8 confirmation pending — round 2]`. Queued queries:
- `all:"simple zeros" AND all:"Hecke L-function"`; `all:"critical line" AND
  all:"Dedekind zeta" AND all:proportion`;
- citation graph of arXiv:2608.13637 (Semantic Scholar / Google Scholar
  "cited by") for any GL(2)/number-field extension;
- Iwaniec–Kowalski, *Analytic Number Theory*, ch. 10 (zero-density: N(σ,T)
  bounds) and ch. 5 (explicit formulas 5.12 for general L) — to confirm the
  *method* transfers classically while the *proportion statement* for Hecke
  L/ζ_K is unstated;
- R8 round-1 §4 note: "No paper found improving 0.6725 for ζ itself" — so the
  Hecke/ζ_K constants would match, not beat, the ζ record.

Nearest misses: (a) openai's `full_zero_sum_rate` — counts zeros (with
multiplicity, Linnik-grade constant) but says nothing about the critical line
or simplicity; (b) tauceti's `dedekindZeta_eq_riemannZeta_mul_LFunction` —
factorization without any counting; (c) R1's C1(ii) draft (same ζ_K statement
via min-of-fractions — see § Proof-strategy variant V1); (d) classical
zero-density theorems N(σ, T, χ) ≪ T^{A(1−σ)} (Huxley/Montgomery, IK04
ch. 18) — strip-counts, not line-proportions.

## Bridge analysis

- Corpora bridged: **all four** — zeta23 (engine), openai-math (Hecke family +
  its log-free zero-counting donors), tauceti (ζ_K factorization, completion
  record, ray-class Hecke L), mathlib (substrate: `analyticOrderAt`,
  `WeakFEPair`, `hurwitzEvenFEPair` on which openai's `SevenEighths.ThetaProduct`
  combinators are built).
- Why the bridge is essential:
  - zeta23 can state (I) but has no Hecke/ζ_K objects;
  - openai-math has the Hecke L (`HeckeFamily.LFunction`) and proves it
    zero-free for Re > 7/8 — but zero-free ≠ zero-density: no proportions, no
    counting of strip zeros, and their `full_zero_sum_rate` is Dirichlet-only;
  - tauceti can factor ζ_K and transfer multiplicities through completions but
    has no counting functions and no density method;
  - mathlib has neither the L-functions beyond ζ/Dirichlet/modular nor any
    zero theory beyond discreteness (`ZetaZeros.lean`) and the Re ≥ 1
    nonvanishing (`Nonvanishing.lean:417`).
- Empty-zone fit: `research/bridges/analytic-nt.md` §4 E1 (this dossier
  realizes it); R1's `research/bridges/tauceti-contributions.md` §2 C1–C3
  (C3 is the record-level view of the same instantiation; C1 is variant V1
  below).

## Proof-strategy sketch

**Variant V1 (ζ_K only; R1's assembly — cheapest, pilot-grade).**
1. Transport tauceti's identity `ζ_K = ζ · L(·,χ_D)` off s = 1
   (`DedekindZeta/Quadratic.lean:88,100`) into zero sets: zeros of ζ_K in the
   open strip = union of zeros of ζ and L(s,χ_D), multiplicities adding
   (`analyticOrderAt_mul`-shaped lemma over mathlib
   `Mathlib/Analysis/Analytic/Order.lean`; R1 confirms `analyticOrderAt_add`
   at `:254`). Hence N_{ζ_K} = N_ζ + N_{χ_D} and likewise N0star, N0simple,
   Ndist per window. [Routine, but the window bookkeeping is real glue —
   zeta23's ζ and Dirichlet windows share shape (`ChallengeDeps.lean:50,85`).]
2. Min-of-fractions: if a/A ≥ c and b/B ≥ c then (a+b)/(A+B) ≥ c; apply with
   zeta23's SUBMITTED theorems `two_thirds_on_critical_line` (ζ) and
   `dirichlet_*` (χ_D primitive, |D| > 1) from `Challenge.lean:131–229`. [Routine.]
3. Named gap (R1's C1(b), confirmed [VERIFIED]): a *stated* N(T)-asymptotic
   for L(s,χ) is not among the submitted theorems; it exists internally
   (`ThmE/RvMChi.lean`, engine form). For V1 it is not needed — the
   min-of-fractions only consumes the two submitted proportion theorems.
**Variant V1 outcome is (III) only, with constants 2/3, 1/2, 5/6 and the
c₁*-window versions by the same argument with `montgomery_taylor_*` +
`dirichlet_montgomery_taylor_*` (`Challenge.lean:163–226`).**

**Variant V2 (engine instantiation — both families, the real dossier).**
1. Build the `ZeroConfig` for the Hecke L: carrier := nontrivial zeros of
   `HeckeFamily.LFunction χ` (openai's `SevenEighths.HeckeTheta.pair w` is
   already a `WeakFEPair ℂ` with `ε = 1`, `k = 1`; its `functional_equation`
   (`Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean:427`) gives the
   reflection ρ ↦ 1−ρ̄ symmetry exactly as zeta23 derives
   `ZetaSeam.reflect_zero` from `completedRiemannZeta_one_sub`
   (`Zeta23/Statement.lean:79–81`); finiteness from discreteness of zeros of
   a nonzero meromorphic function on compacts — openai proves
   `MeromorphicNFOn (heckeLFunctionC χ) univ` for the tauceti-side
   presentation (`LFunctions/Hecke/Basic.lean:88`), mathlib-style; mirror with
   `IsCompact.inter_..._finite` à la `ZetaZeros.lean:68`). [Moderate.]
2. Discharge `PaperInputsChi` fields — the four real obligations (field list
   [VERIFIED] from `ThmE/Hypotheses.lean:127` + fields):
   - `EF : ExplicitFormulaPaperChi κ q c Z` (`ThmE/Hypotheses.lean:80`) —
     Weil EF with density ν_{X,χ} = `nuXc κ q c` = μ_χ + P_{X,χ}
     (`ThmE/Hypotheses.lean:60`, with `muq :48`, `PXc :55`), where now the
     prime sum runs over prime ideals. Templates exist twice: ζ version
     (`Zeta23/WeilEF/`: `Contour.lean`, `VerticalLine.lean`, `FullLine.lean`,
     `Landau.lean`, `ZeroSumLimit.lean` — consumed at
     `WeilEF/Main.lean:270 EF_lit_zetaZeroConfig`) and Dirichlet version
     (`Zeta23/ThmE/{EFLitChi,ContourChi,VerticalLineChi,FullLineChi,LandauChi,
     HorizontalChi}.lean`). **This is the hardest step** — the contour
     integration must run over openai's theta-lattice pair instead of
     Mathlib's `completedRiemannZeta₀`; donors from openai's side:
     `Hecke/PrimeDyadic.lean:22–24` (`series χ s = −deriv (LFunction χ) s /
     LFunction χ s`, `series_eq_tsum` = ideal-von-Mangoldt Euler expansion),
     `Hecke/{IdealLogDerivative,IdealEuler,PrimeDyadicEuler,PrimePowers}.lean`,
     and the Ostmann smoothed-EF template
     (`Ostmann/ZeroDensity/SmoothExplicitFormulaCore.lean`).
   - `RvM : RiemannVonMangoldtChi q Z` (`ThmE/Hypotheses.lean:90`: main
     count vs (T/2π)·`ell1q` + O(log T), local count ≪ log(|t|+3)). Templates:
     ζ (`Zeta23/RvM/`: `CountByIntegral.lean`, `Fold.lean`, `MainTerm.lean`,
     `LocalCount.lean`; statement `RvM/Statement.lean:20`), χ
     (`ThmE/{RvMChi,BacklundChi,LocalCountChi,CountByIntegralChi,FoldChi,
     GammaSideChi,MainTermChi}.lean`); the Backlund horizontal-variation
     bound template is `RvM/Backlund.lean:12 backlund_horizontal` +
     `ThmE/BacklundChi.lean`. Donor from openai:
     `PrimitiveComplexCharacter.full_zero_sum_rate`
     (`CharacterFullZeroCount.lean:12`) shows the zero-count-at-height game is
     already played there (Dirichlet; adaptable shape).
   - `chebq : ChebyshevMertensCoprime q` (`ThmE/Hypotheses.lean:117`) — the
     Λ²-moment bounds for the coefficient sequence (Dirichlet proof in
     `ThmE/ChebCoprime.lean`). For Hecke L the coefficients live on *ideals*;
     the honest route is an ideal-indexed analogue built from openai's
     `IdealMangoldt.value` + `Hecke/PrimeDyadic*` estimates, then an
     enumeration transport (ideals of norm ≤ x ↔ natural numbers) into the
     ℕ-indexed engine field. [HYPOTHESIS: the engine field as stated is
     ℕ-indexed; either restate the engine over a general monoid index (small,
     mechanical — the field only enters through `PXc`, `ThmE/Hypotheses.lean:56`)
     or transport. This is a real design decision, flagged in F3.]
   - `cheb`, `MV`, `Gamma` — **reusable verbatim** [VERIFIED]:
     `Zeta23.Cheb.chebyshevMertens` (coefficient-free Λ moments),
     `Zeta23.MV.mv_hilbert` (`MV/Final.lean:30`), and
     `GammaFactsChi κ q` is proved for ALL (κ, q) in
     `ThmE/GammaFactsChiProof.lean` (the density `muq κ q`,
     `ThmE/Hypotheses.lean:48`, is already (κ,q)-explicit digamma).
3. Conclude (I) → (II) by `thmE_A_lam`/`thmE_B`/`thmE_C`/
   `thmE_*₀` assembly (`ThmE/Final.lean:29–105`), and (I) → (III) either
   directly (same obligations for ζ_K; the quadratic functional equation
     comes from tauceti's completion layer) or via variant V1.

**Hardest step** (flagged): step 2 `EF` — a Weil-type explicit formula for
Hecke L in test-function form. Everything else is template-following.

## Feasibility

(Per `research/feasibility/mathlib-verification.md` §3; port-probe evidence
from `research/feasibility/port-probe.md` — round-2 landed 2026-11-09, so
"port-probe pending" is resolved: see toolchain note.)

F0. Target statement: (I)+(II)+(III) above; mathlib-ready phrasing given in
    § Precise statement (all objects defined or cited to exact decls).

F1. Mathlib entry points (verified against `ff2494ea`):
    - `analyticOrderAt` (`Mathlib/Analysis/Analytic/Order.lean:49`),
      `analyticOrderAt_add :254` [VERIFIED via R1 §1b];
    - `WeakFEPair`/`IsStrongFEPair` + `functional_equation`
      (`Mathlib/NumberTheory/LSeries/AbstractFuncEq.lean:427`),
      `hurwitzEvenFEPair` (`LSeries/HurwitzZetaEven.lean:256`);
    - `riemannZetaZeros`, `IsCompact.inter_riemannZetaZeros_finite`
      (`LSeries/ZetaZeros.lean:33–68`) as the finiteness-pattern donor;
    - `Complex.digamma` (`Analysis/SpecialFunctions/Gamma/Digamma.lean:45`,
      namespace `Complex` — port-probe §5.1 correction);
    - Deligne Γ-factors Γℝ/Γℂ (`Analysis/SpecialFunctions/Gamma/Deligne.lean`).

F2. Donor lemmas (exact decls, verified in donor repos this session):
    - zeta23 engine: `PaperInputsChi` (`ThmE/Hypotheses.lean:127`), `thmE_A_lam`
      … `thmE_C₀` (`ThmE/Final.lean:29–105`), `thmD_lam_abstract`
      (`ThmD/Final.lean:45`) for the c₁*-window constants;
    - zeta23 templates: `WeilEF/Main.lean:270` (ζ EF),
      `ThmE/EFLitChi.lean` (χ EF), `RvM/Statement.lean:20` +
      `RvM/Backlund.lean:12` (count), `ThmE/{RvMChi,BacklundChi,LocalCountChi,
      ChebCoprime,GammaFactsChiProof}.lean`;
    - openai-math: `SevenEighths.HeckeFamily.Character/LFunction`
      (`lean/ComparatorChallenges/HeckeSevenEighths.lean` — trusted-layer defs,
      proofs in `lean/OAI/NumberTheory/DirichletL/Hecke/`, 182 files incl.
      `PrimeDyadic.lean:22–24`, `IdealMangoldt`, `IdealLogDerivative`);
      `SevenEighths.ThetaProduct.product/rescale`, `HeckeTheta.finitePair/
      latticeL` (WeakFEPair calculus — NOT in mathlib, donation candidate);
      Ostmann zero-count/zero-free donors: `full_zero_sum_rate`
      (`CharacterFullZeroCount.lean:12`), `regularizedZeta_zero_free_region`
      (`ZetaZeroFreeRegion.lean:43`);
    - tauceti: `heckeLFunctionC` + `meromorphicNFOn_heckeLFunctionC`
      (`LFunctions/Hecke/Basic.lean:74,88`), `dedekindZetaC_eq_riemannZeta_
      mul_LFunction` (`LFunctions/DedekindZeta/Quadratic.lean:100`),
      `AnalyticLFunctionData` (`LFunctions/Data/Basic.lean:82`, fields coeff/
      conductor/gammaR/gammaC/rootNumber/completed/polarOrder; **cards exist
      only for ζ (`Data/RiemannZeta.lean:51 riemannZetaData`) and primitive
      Dirichlet (`Dirichlet/Basic.lean dirichletData`) — no Hecke/ζ_K card
      yet** [VERIFIED: `rg 'AnalyticLFunctionData where' TauCeti/` → 3 hits,
      all as listed]); `TauCeti.Contour.argumentPrinciple_nullHomologous`
      (`Analysis/Contour/Argument/Cycle.lean:110` — the winding argument
      principle, absent from mathlib, the alternative RvM route per R1 §2).

F3. Missing glue (new mathematics or new formalization, not in any corpus):
    a. definitional bridges: ZeroConfig for `HeckeFamily.LFunction χ`
       (reflection symmetry via the FE pair; window bookkeeping) — S/M;
       ζ_K windows from the factorization — S (V1);
    b. genuinely absent mathematics: (i) Weil EF for Hecke L over ℚ(√−3) in
       test-function form — **the driver**, M–L depth; (ii) RvM count +
       Backlund-type bound for the Hecke L — M; (iii) ideal-indexed
       ChebyshevMertensCoprime analogue (or engine re-indexing) — M;
    c. porting debt: zeta23 built against Mathlib `51e6992e` (v4.33.0-rc2),
       openai against v4.34.1, target checkout v4.36.0-rc2 — port-probe §3
       showed donor *statements* elaborate with 0 errors (B1 pattern) but
       donor *proofs* need re-fixing (probe §3 caveat); the zeta23 EF/RvM
       files are the large proof bodies at risk — M.

F4. Effort: **L** overall for (II) via V2 (driver: F3.b.i, comparable in scale
    to zeta23's own WeilEF + ThmE trees, which are 10+ files each); **M** for
    (III) via V1 (F3.a + step 2 assembly only); S for statement (I) (pure
    restatement).

F5. Risk factors:
    - dependency-chain: `PaperInputsChi`'s `EF` field internally needs
      `nuXc`-summability assertions — the Hecke density must be shown
      integrable against the test transforms (zeta23 needed
      `ZeroSummability*.lean` + `Landau.lean` for this; expect the same);
    - index mismatch: ℕ-indexed engine vs ideal-indexed Hecke coefficients
      (F3.b.iii) — design risk, medium;
    - the openai Hecke L is presented via a theta *lattice sum* (`latticeL`),
      not a Dirichlet series over ℕ: the `HasDirichletAgreement`-shaped bridge
      (Euler product ↔ lattice sum, openai's `Hecke/{Euler,IdealBridge}.lean`)
      must compose with zeta23's `PXc` shape;
    - constants: `full_zero_sum_rate`'s explicit 32/log(14/13) is for
      Dirichlet; Hecke analogues may need new effective constants;
    - churn: mathlib LSeries files are 2026-fresh (ZetaZeros, Nonvanishing);
      upstream PNT/Mertens PRs in flight (R8 round-1: #41394, #44062, #43238).

F6. Verification plan: kernel-only (math-proof1 standard: no sorry, no
    native_decide, no external CAS); Modal build via lean_build.py/
    lean_check.py per `math-proof1/AGENTS.md` once lake scaffolding exists in
    this repo. V1's min-of-fractions assembly is the natural first
    sorry-free milestone.

Toolchain split note [VERIFIED]: zeta23 `lean-toolchain` =
`leanprover/lean4:v4.33.0-rc2` (Mathlib `51e6992e`); openai-math =
`v4.34.1`; tauceti and the encore checkout = `v4.36.0-rc2` (`ff2494ea`).
R9's port-probe (round-2, DONE — `research/feasibility/port-probe.md`):
statement elaboration of zeta23 donors against v4.36 is clean (0 errors,
B1), full-proof porting is the cost center; ζ-side consumer API
(`riemannZeta`, `analyticOrderAt`, `hardyZ`, `ZetaZeros`) all probe OK.

## Significance

Would establish the first zero-density (critical-line simplicity proportion)
theorem for an L-function family outside ζ/Dirichlet — in any formal system —
and demonstrate that zeta23's engine, generic by construction, is a
reusable density machine: every future L-function with (EF, RvM, cheb) gets
the 2/3–5/6–c₁* package for free. The ζ_K instance alone (V1) already
crosses the "number-field zeta" boundary that no corpus's zero theory
reaches. Downstream: any Hecke/ζ_K statement (R1's C1(iii) Λ_K′ zeros;
uniform-in-conductor variants, bridges/analytic-nt.md §4 E4) builds on the
same instantiation.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank (novelty × significance ÷ effort): —

**Lane proposal (R5, non-binding)**: Novelty 4 (statement absent from all
corpora; AF/Lamzouri ecosystem is Dirichlet-only — pending R8 round-2 on
Hecke/ζ_K literature), Significance 5 (first non-Dirichlet density theorem +
engine reusability), Effort 5 (L: the Hecke EF is a sub-library); proposed
rank 4.0. Pilot entry = variant V1 (ζ_K via factorization): M effort,
delivers (III) standalone and exercises the three-corpus seam
(tauceti factorization × zeta23 submitted theorems × mathlib
`analyticOrderAt_add`).

## F4 grade by lane R9

2026-11-09, round 5. Evidence: Modal port-probe runs 1–10 incl. `ProbeF_MathlibBatch.lean`
(`research/feasibility/port-probe.md`).

- **Grade: M–L — confirmed** (engine = zeta23 ThmE χ-family, M; Hecke-side assembly, the L).
  **F1 corrections (three, all probe-settled, run 9→10):** (1) `hurwitzEvenFEPair` →
  **`HurwitzZeta.hurwitzEvenFEPair`** (namespace HurwitzZeta, :256); (2) there is no plain
  `analyticOrderAt_add` at :254 — the add-family is `le_analyticOrderAt_add` (:228) and
  `analyticOrderAt_add_of_ne` (:254 region), both probe-verified; (3) Deligne factors are
  **`Complex.Gammaℝ`/`Complex.Gammaℂ`** (Deligne.lean:46/:54). All other F1 items
  (`WeakFEPair`, `analyticOrderAt`, `riemannZetaZeros` family, `Complex.digamma`) already
  probe-verified (runs 1–2).
- **Toolchain picture**: zeta23 statements ≈ 0 cost (NT-cluster binder types clean, ProbeE);
  tauceti zero friction (same toolchain, verified); openai Hecke-family closure is the
  priced item — the DirichletL tree measured 2924 files/486k LoC for the quasi-RH sibling;
  the Hecke subtree (182 files per F2) is the analogous import decision — binder posture
  recommended as in dossiers 22/50.
- Verdict: keep M–L; F1 now fully verified with three name fixes.

## Pilot outcome (R5, 2026-11-09, append-only)

**M1 GREEN** — `research/pilots/20/M1.lean` elaborates against mathlib
v4.36.0-rc2 (`ff2494ea`) in Modal (R9's crossmath-probe infra, warm runs
~1–2 min): `errors=0, sorry-warnings=0`; run log + 6 formalization deltas at
`research/pilots/20-blueprint.md` §6 (cycle count 9 exceeded the 5-cycle
budget, no cycle blocked >1h — disclosed).

- **Theorem inventory** (all `#print axioms` = `[propext, Classical.choice,
  Quot.sound]`, M1.lean §8): the `Card20` transcription of
  `Zeta23.PaperInputs` (fields ef/rvm/cheb/mv/gamma at the
  `Hypotheses.lean:48,67,83,107,125` shapes); the swap-friendly engine seam
  (`EngineStep Traces z`, `TracesFamily Traces z` between SWAP-START/END
  markers); the instantiation theorems `instantiate_family_A/B/C` (hCard ∧
  hTraces ∧ hStep ⇒ ∀ λ ∈ (1/2,1), EpsLower at `Hfun λ` / `2 Ffun λ − 1` /
  `Ffun λ`, division-free ε-forms per 42's delta-3 convention); the λ→1
  upgrades `family_to_two_thirds/half/three_quarters` (explicit-δ, pure
  linarith); the merge comparison `family_merge`/`two_thirds_of_components`
  (V1-route at family level, NO hCZ); the hCZ seam `CommonZeroControl` +
  `SharedMass`, with sanity `merged_mult_of_common` (a simple common zero is
  a merged multiplicity-2 atom) and `sharedMass_eq_zero_of_disjoint`.
- **Effort revision**: E4 → E3.5 with evidence — the engine-side assembly
  layer is now DONE conditionally (this M1) and the failure modes are named
  (`λ` keyword, `ComplexConjugate` scope, section-variable non-insertion,
  δ ≤ 1/2): the remaining cost is concentrated in the two analytic drivers
  already sized in F3.b (Weil EF for the target L; RvM/Backlund), unchanged.
- **Novelty note**: the engine route now has a proved conditional core and a
  NAMED seam — hCZ (`CommonZeroControl`: shared-multiplicity mass is a
  density-zero fraction of the merged count) — which the M1 proofs show is
  exactly what separates the engine route from the count-level assembly:
  `family_merge` proves the with-multiplicity-on-line proportions merge for
  free, while every distinct-count or simple-count statement (C-shape 5/6,
  B-shape, A-distinct-shape) subtracts shared points and needs hCZ. Provability
  assessment of hCZ: `research/pilots/20-hCZ-NOTE.md` (verdict there: not
  provable today; conjecture-grade weakest form S₁ = o(N)).
- **Lane proposal update**: Novelty 4.5 stands (the hCZ mechanistic finding —
  common zero = merged multiplicity-2 atom degrading the c-device — is a
  discovery-grade formalization of why ζ_K proportions beyond the
  with-multiplicity 2/3 do not exist yet); Significance 5 stands; Effort
  E4 → E3.5 (conditional core done, deltas priced). Proposed rank ≈ 4.5 × 5
  ÷ 3.5 ≈ 6.4 conditional on the M2 discharge programme; the
  provable-today part (V1: N0^{ζ_K} ≥ (2/3−ε)·N^{ζ_K} with-multiplicity,
  via `thmA₀_N0` (`Zeta23/Final.lean:356`) + the Dirichlet analogue from
  `thmE_A` + `trivial_chain` (`Zeta23/Statement.lean:157`)) ships with
  pilot 42.
