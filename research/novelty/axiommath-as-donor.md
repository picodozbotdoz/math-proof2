# AxiomMath as donor — remap of the analytic-NT dossiers onto the on-pin AxiomMath corpus

Lane A3 (donor-remap), Cycle 2, 2026-11-13. Companion to `research/survey/axiommath.md`
(A1; cited below as "survey §…"), `research/novelty/knausgaard-as-donor.md` (R8; the
template for this file), `research/feasibility/axiommath-bump/` (build evidence), and the
main-run dossiers/pilots 20/21/22/40/42/50. All donor evidence read directly in
`/home/doz/zcode-workdir/axiommath/` at branch `dev/claude` (toolchain v4.36.0-rc2, mathlib
`ff2494ea` — our pin); every theorem citation below was verified file:line in the clone this
session. Consumers cited by pilot file and binder name.

## 0. Donor status on our pin (read this first — it gates every verdict)

| Repo | On-pin status | Evidence |
|---|---|---|
| `ZetaZeros` (V1) | **BUILDS** (full lib, 7,472 jobs) | `axiommath-bump/logs/run5.log`: `build ZetaZeros: OK` |
| `ZetaZerosV2` | **BUILDS** (ZetaZeros lib, 8,262 jobs, incl. its PrimeNumberTheoremAnd dependency path redirected to the bumped local clone) | `axiommath-bump/logs/v2-run9.log`: `build ZetaZerosV2: OK` |
| `PrimeNumberTheoremAnd` | **PARTIAL** — only the modules on ZetaZerosV2's path were ported (commit `d82cfae`) and compiled green as V2's dependency; the rest of the fork is unported at our pin | `v2-run9.log`; PNT+ git log |
| `DedekindZetaZeroFree` | **STATEMENT-LEVEL ONLY** — its Challenge file (mathlib-only imports) elaborated clean against the cached pin (`run1.log`: `challenge …/DedekindZetaChallenge.lean: OK`); the **full library build was NEVER RUN** (`axbump.py:44–45` `BUILDS` lists only ZetaZeros/ZetaZerosV2). Expected blockers, read off the clone: lakefile requires TauCeti @ `d92acc5c` (= exactly our `tauceti` sibling HEAD, v4.36.0-rc2 — fine) and the **vendored `FiniteAbelianGlobalReciprocityv2` at `vendor/class-field-theory` pinned to Lean v4.35.0-rc2 / mathlib `06535612`** (its own lakefile) — a second-mathlib + old-toolchain subtree, i.e. the same class of job as the V2/PNT+ redirect-and-fix loop (5 fix rounds). Stale manifest besides (survey §"Staleness caveats": `lake-manifest.json` still resolves mathlib `0493595e`). | `run1.log`; `DedekindZetaZeroFree/lakefile.toml`; `vendor/class-field-theory/{lean-toolchain,lakefile.toml}`; `git -C tauceti rev-parse HEAD` = `d92acc5c` |

**Axiom hygiene.** Grep-verified this session: **zero `native_decide` and zero active
`sorry`** in `ZetaZerosV2/{ZetaZeros,Solution}/`, `ZetaZeros/` (V1 lib), and
`DedekindZetaZeroFree/{DedekindZetaZeroFree,Solution}/`. (PNT+ carries only *commented*
sorries plus stale "trusted numerics" docstrings on modules off V2's path; its StrongPNT
classical-remainder headline is literally commented out — see §d.) The repos' own
comparator configs permit only `[propext, Quot.sound, Classical.choice]` (survey §audit,
`comparator.json` `permitted_axioms`). **Consequence: unlike Knausgård, the AxiomMath
headline theorems are consumable directly** — no `*_of_local` certificate layer needed, no
`hCert` binder. One residual: `#print axioms` of the donor headlines has not been run *on
our pin* (axbump builds but does not print axioms) — cheap follow-up, see §6.

**Constant geometry that drives everything below.** DZDF's zero-free half-plane is
Re s > **31/32** = 0.96875; openai's quasi-RH (the hQRH donors of pilots 50/20) is Re s >
**7/8** = 0.875. The openai region **strictly contains** DZDF's, so *DZDF never discharges
a 7/8-shaped binder* — only weakened 31/32 binders (survey §H1 correction, confirmed here
against `pilots/50/M1.lean:45`). Conversely ZetaZerosV2's Lamzouri constants C₀ =
3/2 − (1/√2)cot(1/√2) = 0.6725007… and C₁ = 5/4 − (1/(2√2))cot(1/√2) = 0.8362504… sit
*above* our landing constants 2/3 and 5/6 but *below* Knausgård's 0.6735382 / 0.8390045 —
V2 substitutes for the ζ-column **at our constants, unconditionally**, at the cost of
losing a constant race we already conceded (dossier 42 "constant race caveat").

## (a) Dossier 50 / pilot 50 — hQRH: **DISCHARGES-WEAKENED-BINDERS-ONLY → unconditional landing theorem at degraded constants [1/32, 31/32]**

Donor theorems (exact):

- `DedekindZetaZeroFree.dedekindZeta_ne_zero` — `DedekindZetaZeroFree/Main.lean:9`
  (wrapper of `DedekindZetaZeroFree.Quantitative.dedekindZeta_ne_zero`,
  `Nonvanishing/Mellin/Quantitative/DedekindZetaNonvanishing.lean:11`): for every `[Field K]
  [NumberField K]`, ∃ f : ℂ → ℂ, DifferentiableOn f {1}ᶜ ∧ (∀ s, 1 < s.re → f s =
  `NumberField.dedekindZeta K s`) ∧ ∀ s, 31/32 < s.re → s ≠ 1 → f s ≠ 0. Axioms: standard
  triad (comparator-permitted; on-pin `#print axioms` pending, §6). Paper: Cureton–Thorner,
  hexagonmath.org/2610.00200v1 Thm 1.1 (`formalization.yaml:24–33`).
- `DedekindZetaZeroFree.heckeL_ne_zero` — `DedekindZetaZeroFree/HeckeCorollary.lean:12`
  (principal branch `Nonvanishing/Hecke/PrincipalCharacter.lean:14`, nonprincipal
  `NonprincipalCharacter.lean:15`): same shape for every `χ : RayClassCharacter K m`
  (structure at `Arithmetic/RayClasses/Character.lean:12` = the library copy of the
  Challenge def), entire when χ nonprincipal, nonvanishing for Re > 31/32 with the
  `(s ≠ 1 ∨ ¬χ.IsPrincipal)` exclusion. Cor 1.2 of the same paper.

Consumer: `research/pilots/50/M1.lean:45` — `hQRH : ∀ s : ℂ, (7/8:ℝ) < s.re →
riemannZeta s ≠ 0` (ζ), and `research/pilots/50/Dirichlet.lean:41` — `hQRHχ` (same shape
for `DirichletCharacter.LFunction`, pole-excluded), plus `hFEχ` (`Dirichlet.lean:44`).

**Verdict: hQRH / hQRHχ as written — NO** (7/8 ⊋ 31/32; a fortiori impossible). **Weakened
binders — YES**, and that is the milestone: set

- `hQRH₃₂ : ∀ s : ℂ, (31/32:ℝ) < s.re → riemannZeta s ≠ 0`, discharged by
  `dedekindZeta_ne_zero` at **K = ℚ** via three glue lemmas (all S-sized, each with a named
  mathlib anchor): (i) ideals of ℤ collapse — `Nat.card {I : Ideal (𝓞 ℚ) // absNorm I = n}
  = 1` for every n ≥ 1, so `NumberField.dedekindZeta ℚ s = LSeries (fun _ => 1) s`
  (`DedekindZeta.lean:50` def; DZDF's own `hasSum_idealInverseNormPower`,
  `LFunctions/Dedekind/IdealNormSeries.lean:130`, is the in-donor model of the
  fiber-by-norm collapse); (ii) identification with the continued zeta on the half-plane —
  `zeta_eq_tsum_one_div_nat_cpow` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:207`,
  1 < re s); (iii) identity-theorem transfer off the half-plane — f and `riemannZeta` are
  both analytic on the connected set {1}ᶜ and agree on a nonempty open subset; the exact
  route DZDF itself uses in `dedekindAbelianQuotient`'s proof
  (`AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq`, z₀ = 2).
- `hQRHχ₃₂` (31/32 form of the Dirichlet binder) discharged by `heckeL_ne_zero` at K = ℚ:
  every Dirichlet character mod q *is* a `RayClassCharacter ℚ (q)` — the narrow ray class
  group of ℚ mod q is `(ℤ/q)×` (class number 1; units ±1; DZDF's total-positivity field is
  α > 0, killing sign — exact match with `map_mul'`/`eq_zero_iff'`/`map_span'` read off
  against the Dirichlet axioms), and the HasSum-over-ideals is the Dirichlet series by the
  same ℤ-ideal dictionary. `hFEχ` **stays a binder**: mathlib still lacks the product-form
  Dirichlet FE (`pilots/50/Dirichlet.lean:20–23` finding, unchanged), and DZDF's own
  `heckeFunctionalEquation` (`LFunctions/Hecke/FunctionalEquation.lean:12`) covers only
  **totally complex** fields (Γ^r_C factors only) — ℚ is not covered.

**What changes in the landed statement.** `strip_confinement` (`M1.lean:44`) and
`strip_confinement_dirichlet` (`Dirichlet.lean:40`) are parameterized in the binder's
constant, so the *same proofs* yield, unconditionally (no hQRH-family binder at all):

> **M2-31/32 (proposed).** Every nontrivial zero ρ of `riemannZeta` (0 < Re ρ < 1)
> satisfies **1/32 ≤ Re ρ ≤ 31/32**; and for every primitive Dirichlet χ, every non-pole
> zero ρ of `LFunction χ` in the open strip satisfies the same, conditional only on
> `hFEχ`. Set forms over `riemannZetaZeros` and the zeta23 window vocabulary
> (`strip_confinement_mem`/`_set`, `M1.lean:75,85`) carry over verbatim at the new
> constants.

Constants degrade exactly as the geometry forces: right edge 7/8 → 31/32, left edge 1/8 →
1/32 (= 1 − 31/32; the left half is *proved* from `riemannZeta_one_sub`, never a binder).
The 7/8 forms remain available as the strictly stronger *conditional* pair (openai port
still pending, 2,924-file closure per `port-probe.md` §7) — the honest deliverable is the
corollary pair, not a replacement.

**Novelty of the unconditional strip.** *Formal:* new — mathlib has no interior zero-free
region for ζ (dossier 50 §novelty, [VERIFIED]: "no zero-free region beyond Re s ≥ 1"), and
no corpus theorem locates ζ or Dirichlet-L zeros in a proper closed substrip except through
the hQRH binders. *Mathematical:* not new — strictly weaker than the classical
Hadamard–de la Vallée Poussin region (σ ≥ 1 − c/log|t| confines zeros left of 31/32 for
all large |t|; recorded in Broughan 2009 for ζ and, for ζ_K, via the classical Landau-type
regions). *vs Knausgård:* no overlap — his tree has no zero-free/confinement content
(`knausgaard-as-donor.md` §2b: NO). Net: same novelty class as dossier-50 S1a (novelty 2:
formalization + packaging of a math-known statement), but with a **posture upgrade — the
pilot's landing theorem becomes unconditional and OAI-port-free**. For *general* ζ_K the
right edge 31/32 is DZDF's own theorem restated; the left edge for general K has no mathlib
FE and stays a binder (only totally complex K could use DZDF's principal-case
`heckeFunctionalEquation`, and only after glue) — recommend K = ℚ as the M2 target.

**Erratum (2026-11-13, A5 QR-D precision pass): split the formal-novelty claim by class.**
For the ζ/Dirichlet strip, A5 registered a concurrent *external* formal donor — Liu-1's
public Lean repo proves zero-free Re s > 0.8749570 for every Dirichlet L including ζ,
formally containing the hQRH/hQRH-class regions — so for ζ/Dirichlet the "first formal
zero-confinement" is *concurrent external work: cite, don't claim* (probe queued as A7/G7).
The claim survives unchanged where Liu-1 has nothing: the **ζ_K and general-Hecke strip**
(every number field, ray-class characters) remains ours-in-corpus via DZDF on our pin; see
`pilots/50-M2-31-32-spec.md` §3 third route for the pilot consequence (three routes now;
parametric θ-binder unchanged).

**Gate:** everything in this section is conditional on the DZDF on-pin build (§0). The
K = ℚ consumption chain touches only `Main.lean` + `IdealNormSeries.lean`-style glue — if
the full build stalls, a fallback is elaborating `Main.lean`'s *statement* + the Challenge
form as a binder (`hDZ : ∀ K, ∃ f, …`) exactly as run1 already validated.

## (b) Dossier 20 / pilot 20 — hCZ seam and the Hecke family: **NO discharge of hCZ or Card20; the Hecke-L *object layer* switches donors (openai → DZDF), same 31/32 ceiling**

Character-class match (the question asked): dossier 20's family (II) is openai's
`SevenEighths.HeckeFamily.Character` for K = ℚ(√−3) — finite-order Hecke characters with an
ideal modulus (`dossier 20 §(II)`). DZDF's `RayClassCharacter K m`
(`Arithmetic/RayClasses/Character.lean:12`) is *exactly* this class — ideal-indexed,
completely multiplicative, vanishing precisely off the coprime-to-m cone, trivial on
totally-positive principals ≡ 1 mod m — proved for **every number field and every modulus**
(finite order is automatic: the character factors through the ray class group). For the
imaginary-quadratic K of dossier 20 there are no real places, so the positivity condition
is vacuous and the match with openai's residue-ring presentation is exact. **Class needed =
class covered; the only degradation is the constant (7/8 → 31/32) — same verdict shape as
(a).**

Binder-by-binder map against `research/pilots/20/M1.lean`:

| Binder (pilot 20) | Donor | Verdict |
|---|---|---|
| `Card20` fields `ef`/`rvm`/`cheb`/`mv`/`gamma` (`M1.lean:383`, shapes at `:307,333,341,369`) | DZDF has no zero-*counting*, no explicit-formula-in-zeta23-shape, no Chebyshev/MV content (survey §326: "ζ_K/Hecke only: no zero-density, no zero counting") | **NO** (all five stay; zeta23-port route unchanged) |
| `hTraces`/`hStep` engine seam (`M1.lean:419,427`) | no AxiomMath analogue | **NO** (stays) |
| **hCZ** (`CommonZeroControl`, `M1.lean` §6; `20-hCZ-NOTE.md`: "not provable today", necessary weak form S₁ = o(N)) | orthogonal content: hCZ is an on-line *coincidence* statement about ζ ∩ L(χ_D); DZDF is a right-half-plane *nonvanishing* theorem. A zero-free half-plane says nothing about shared zeros on the critical line (Route B of the NOTE already exploits the only place density theorems bite, Re > 7/12; 31/32 > 7/12 changes nothing there) | **NO** — and no partial |
| Hecke-L object + zero-free input for family (II) (openai `HeckeSevenEighths`, 182-file subtree, v4.34.1) | `heckeL_ne_zero` + `RayCharacterEntireContinuation.lean` + `heckeFunctionalEquation` (K totally complex ✓ for ℚ(√−3)) + `exists_rayCharacter_galoisRealization` (`Arithmetic/RayClasses/Reciprocity/RayCharacterGaloisRealization.lean:73`) | **PARTIAL** — object layer replaceable, constant 7/8 → 31/32 |

Net for dossier 20: the *seam* (hCZ) is untouched — the note's verdict stands. The real
delta is infrastructural: family (II) no longer needs the openai Hecke subtree port; its
objects, entire continuation, FE (totally complex), and zero-free region come from one
on-pin donor at the cost of the weaker strip constant. If dossier 20's M2 programme ever
resumes, instantiate family (II) over `RayClassCharacter` and keep openai only as the
stronger-constant *alternative*. Also relevant: V2's now-theorem
`ZetaZeros.riemannVonMangoldt` (`ZeroCount/RiemannVonMangoldt.lean:465`) is a candidate
donor for the ζ-side `rvm` Card20 field in the V1-track instantiation (survey §H2 lists it
as "a donor choice for pilot 20's rvm field") — but for the Hecke/ζ_K instances the RvM
obligation is for the *Hecke* L, which no corpus supplies; unchanged.

## (c) Dossier 42 / pilot 42 — ZetaZerosV2 donor swap: **ζ-side binders discharge UNCONDITIONALLY; propose milestone M4**

Donor theorems (exact; all unconditional, cumulative (0,T], eventual ε-forms — the same
quantifier shape as pilot 42's `EpsLowerCum`/`EpsLowerDistinctCum`, `M2b.lean` defs):

- `ZetaZeros.simple_proportion_lower` — `ZetaZerosV2/ZetaZeros/Main.lean:47`:
  ∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, C₀ − ε < `simpleOnLineCount T / zeroCount T` (C₀ = 0.6725007…).
- `ZetaZeros.distinct_proportion_lower` — `Main.lean:88`: same at C₁ = 0.8362504… for
  `distinctZeroCount T / zeroCount T`.
- Numeric endpoints `simple_proportion_d4` (`Main.lean:130`, 0.6725) /
  `distinct_proportion_d5` (`Main.lean:149`, 0.83625); further shapes
  `average_proportion_lower` (`Proportions.lean:61`, C₁ for (N_s+N₀)/(2N)) and
  `simpleOrOnLine_proportion_lower` (`Proportions.lean:153`, C₂ = 0.8876200… for
  N_{s∪0}/N) — **new statement shapes vs every corpus** (survey §H2), see the 70-series
  note below.
- Counting vocabulary: `Definitions.lean:38,43,47,51,56,60,65,70` — `nontrivialZeros`,
  `zeroMultiplicity = analyticOrderNatAt riemannZeta` (identical underlying mult function
  to pilot 42's `multOf riemannZeta`), `zeroCount` (N, with mult), `simpleOnLineCount`
  (N₀ˢ, set-card), `distinctZeroCount` (N_d, set-card, **strip-wide**), `onLineCount`
  (N₀, with mult), `simpleZeroCount`, `simpleOrOnLineCount`. Restated in Challenge form at
  `Challenge/Basic.lean:209–278`, discharged by `Solution/Basic.lean:58–114`.

Consumers: `research/pilots/42/M2b.lean` — binders `hCert : cert` (:1065 etc.),
`hK673 : K673OfLayers cert ⟨multOf fζ, hfinζ⟩` (:1066), `hK839 : K839OfLocal cert ⟨multOf
fζ, hfinζ⟩` (:1084), `hEχ`/`hEχd` (zeta23 ThmE χ-side), the M2a structural set
(`hζ`…`hfin*`, `hfac`, `hntopζ`), and `hCZ` (:1125).

**Verdicts.**

1. **hK673 (ζ-side 2/3, on-line-with-multiplicity numerator): DISCHARGED
   unconditionally.** C₀ = 0.6725007 > 2/3; `simpleOnLineCount ≤ onLineCount` (points vs
   mass) a fortiori lifts the bound onto pilot 42's `countOnCum` numerator; window and
   quantifier shapes match exactly. Glue = two count-identification lemmas (V2
   `zeroCount`/`onLineCount` ≡ `ZeroMult.countCum`/`countOnCum` over `multOf riemannZeta`:
   `∑ᶠ`-over-set vs `Finite.toFinset` sum, plus `mult ≠ 0 ↔ riemannZeta ρ = 0` at points of
   analyticity — mathlib `Analytic/Order` API), plus `zeroCount`-eventually-positive (V2
   has it: `riemannVonMangoldt.zeroCount_pos_eventually`, used at `Main.lean:60`). S−.
2. **hK839 (ζ-side 5/6-distinct): DISCHARGED unconditionally after a one-line vocabulary
   correction — QA flag.** V2's `distinctZeroCount` is **strip-wide distinct** (=
   zeta23's `Ndist`, `ChallengeDeps.lean:59`, = Knausgård's `Ndist`); pilot 42's
   `ZeroMult.countDistinctOnCum` (`M2b.lean`) is **on-line distinct** — *stronger than any
   donor proves* (no corpus bounds on-line distinct by 5/6·N; on-line ≤ strip distinct).
   The M2b docstring "his `Ndist 0 T` shape" is a mislabel: his/zeta23's Ndist is
   strip-wide. Nothing false is *proved* (the transcription is only ever a hypothesis), but
   the binder is undischargeable by the named donor — and by V2 — in its current shape.
   Fix: re-vocabulary `EpsLowerDistinctCum`'s numerator to a strip-window distinct count
   (`supp ∩ stripWindow 0 T` card), faithful to all three donors at once; then C₁ =
   0.8362504 > 5/6 discharges it, same glue as (1). The defect term becomes
   common-strip-zeros (inclusion–exclusion over `stripWindow`, the identical
   `countDistinctOnCum_add` proof at window level), and `hCZ` correspondingly becomes the
   strip-common negligibility binder.
3. **hCert + the Knausgård certificate machinery on the ζ side: DROPPED.** V2's theorems
   carry no `native_decide`, no sorry (§0) — the entire reason for the `cert` binder
   (Knausgård's native_decide headlines, `knausgaard-as-donor.md` §1b) evaporates. This is
   the axiom-hygiene *upgrade*: pilot 42's clean-axioms landing theorems lose their last
   external-certificate dependency on the ζ side.
4. **hEχ / hEχd (χ-side): STAY.** V2/PNT+/DZDF have no Dirichlet-L proportion content
   (DZDF Hecke ≠ 0 gives no zero counting; V2 is ζ-only). Discharge path remains the zeta23
   ThmE port (v4.33 tree) — unchanged from the main run.
5. **Structural set (`hζ`/`hχ`/`hK`/`hK1`/`hP1`/`hfac`/`hfin*`) and `hntopζ`: STAY**, with
   two on-pin softeners: `hfinζ` (window-finiteness for `multOf riemannZeta`) is implicit
   in V2's well-defined counts (`ZeroCount/Backlund.lean`, `Window.lean`) and can be
   discharged from V2's machinery; `hntopζ` (analyticOrderAt ≠ ⊤ for ζ everywhere) is
   mathlib-dischargeable in principle (ζ meromorphic, only pole at 1) — both remain pilot
   42 line items, not donor blockers.

**Does a "partially unconditional" landing theorem make mathematical sense? Yes.** The
assembly (`epsLowerCum_of_factorization`) is *additive over the factorization* ζ_K = ζ·L(χ):
it consumes the two factor-proportion hypotheses separately. Discharging the ζ factor from
a theorem yields a statement with strictly fewer hypotheses — the standard
conditional-on-one-factor pattern (as GRH-conditional results are conditional per L). The
resulting object is honest and strictly stronger than the M2b landing: *the on-line zero
density of ζ_K is ≥ 2/3 provided only that the Dirichlet factor satisfies the ThmE-shaped
2/3 density* — unconditional in the ζ factor, no external certificates anywhere.

**Proposed M4 (donor swap, exact statements, Lean-adjacent prose):**

> **M4 glue.** `countCum_eq_zeroCount : (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T
> = ZetaZeros.zeroCount T` and `countOnCum_eq_onLineCount : … = ZetaZeros.onLineCount T`
> (plus the strip-distinct analogue after the (2) fix).
>
> **M4 discharge.** `epsLowerCum_zeta : EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2/3)` —
> from `simple_proportion_lower` + `simpleOnLineCount ≤ onLineCount` +
> `EpsLowerCum_mono two_thirds_le_C₀` (new numeral lemma, `2/3 ≤ 3/2 − (1/√2)cot(1/√2)`,
> `norm_num` + the cot bound `inv_sqrt_two_mul_cot_lt` route V2 itself uses); and
> `epsLowerDistinctCum_zeta : EpsLowerDistinctCumStrip ⟨multOf riemannZeta, hfinζ⟩ (5/6)`
> — from `distinct_proportion_lower` (C₁ > 5/6).
>
> **M4 LANDED (2/3, unconditional ζ-side).** `zetaK_two_thirds_landed_of_V2 {fK fχ : ℂ →
> ℂ}` with exactly the M2b hypothesis list of `zetaK_two_thirds_landed` (`M2b.lean:1063`)
> **minus `hCert` and `hK673`** (the `fζ` argument is now literally `riemannZeta`), i.e.
> concluding `EpsLowerCum ⟨multOf fK, hfinK⟩ (2/3)` — the liminf of on-line-with-multiplicity
> zeros of ζ_K over total zeros ≥ 2/3, conditional only on `hEχ` + the structural set +
> `hntopζ`.
>
> **M4 LANDED (distinct 5/6 + strip defect, unconditional ζ-side).** the
> `zetaK_distinct_five_sixths_landed` analogue at the strip-distinct vocabulary, minus
> `hCert`/`hK839`; `_of_negligible` variant with the strip-common hCZ binder unchanged.

Feeder note for the 70-series (not 42's scope): with the ζ-side unconditional, V2's two
*new* shapes (average ≥ C₁, simple-or-on-line ≥ C₂) become the first candidates for
ζ_K-analogues via the same assembly — `max(N₀^{ζ_K}, N_s^{ζ_K})` and union-shape
numerators — neither of which any corpus states for any L beyond ζ (survey §H2).

## (d) Dossier 22 + PrimeNumberTheoremAnd: **NO Tier-2 acceleration; stop-at-M4 stands**

PNT+ on our pin is exactly "the modules ZetaZerosV2 needs" (`d82cfae`): Perron
(`PerronFormula.lean`), MediumPNT, ZetaBounds, the Hadamard product for ξ
(`Mathlib.NumberTheory.LSeries.RiemannZetaHadamard`), rectangle argument principle,
Backlund-crude — built green inside v2-run9. For Tier-2 (ψ(x) = x + O(x^{7/8+ε}), "the
real content per TRIAGE" row 22) the missing input is a *fixed-exponent* zero-free band;
PNT+ has none, and its classical-remainder endpoint is literally commented out
(`StrongPNT.lean` tail: `-- theorem PrimeNumberTheorem … -- sorry`; the proved headline is
little-o, `Consequences.lean` `R_isLittleO`). So PNT+ neither supplies the band nor
shortens the band→ψ transfer: tauceti's `truncatedPerron_LSeries`
(`TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Formula.lean:130`, same toolchain,
sorry-free) remains the cheapest Perron input, and the only new option the AxiomMath corpus
opens is an *all-AxiomMath* Tier-2 variant — DZDF's 31/32 band at K = ℚ (§a glue) through
PNT+'s Perron stack would give ψ(x) = x + O(x^{31/32+ε}) with no openai port — strictly
weaker than T2a's 7/8 and still a power-saving PNT no classical theorem provides; worth a
one-line record, not a slot. Strategic call unchanged: STRATEGICALLY DEAD, stop-at-M4
(TRIAGE row 22; three mathlib PRs + PNTAnd + IEANTN converging).

## (e) Dossiers 21 / 40: **NO deltas (two marginal alternates, cite-don't-swap)**

- **21** (quartic-window ThmD transplant, demoted): V2's constants are frozen at the
  Montgomery–Taylor window λ = 1 (survey §"terminal points"), i.e. the same family 21
  tries to re-optimize, with no window parameter exposed — nothing to transplant, nothing
  to beat. No delta.
- **40** (ζ_K′ prime-derivative zeros): the seams are zeta23's XiPrime EF proof stack and
  tauceti's completion layer; no AxiomMath donor touches ζ′. Marginal: PNT+'s
  `RiemannZetaHadamard` (Hadamard product for ξ, on V2's built path) and V2's
  `ZeroCount/Backlund.lean` are *alternate* ζ-side analytic-input donors if 40's port of
  zeta23's Hadamard/zero-count layers ever stalls — convenience alternates in different
  conventions, not accelerations. No delta on the critical path.

## (f) Cross-cutting donor: `dedekindAbelianQuotient` — the general-abelian factorization (feeds 42/20 generalizations)

`DedekindZetaZeroFree.dedekindAbelianQuotient`
(`LFunctions/Dedekind/EntireAbelianQuotient.lean:13`): for every **abelian** Galois L/K
(plus number-field instances), there exist continuations f_K, f_L of both Dedekind zetas
(differentiable off {1}, agreeing with `NumberField.dedekindZeta` on Re > 1) and an
**entire** g with f_L s = g s · f_K s for all s ≠ 1. This is exactly pilot 42's
`hfac : FactorizationOnHalfPlane fK fζ fχ` shape (`M2b.lean` binder; `M2a`'s
`funEq_of_factorization` consumes it) — but *beyond quadratic*: it upgrades the 42 assembly
from ζ_K = ζ·L(χ_D) (tauceti `Quadratic.lean`) to **ζ_L = g·ζ_K for every abelian
extension L/K**, with the order-additivity glue (`analyticOrderNatAt_mul`) already proved
in pilot 42 M1. Combined with §(c): the M4 architecture generalizes verbatim to
"on-line zero density of ζ_L ≥ 2/3 given the g-factor's proportion hypothesis" — a
70-series candidate statement no corpus has (survey §H1(a) concurs). Caveats: entire g ⇒
`multOf f_L = multOf f_K + multOf g` off {1} needs the same analyticity bookkeeping as
M2a; and `hfin` window-finiteness for general ζ_L has no on-pin donor (V2 is ζ-only) — the
generalization inherits pilot 20's RvM-type obstruction for the new factor.

## Verdict summary

| Dossier / pilot | Binder | Donor theorem (file:line) | Verdict |
|---|---|---|---|
| 50 / M1+M2a | `hQRH` (7/8, ζ) | `dedekindZeta_ne_zero` (`Main.lean:9` = `Quantitative…:11`) at K = ℚ | **PARTIAL** — discharges weakened 31/32 binder only; landing degrades to [1/32, 31/32], *unconditional* (OAI-port-free). hQRH@7/8 still openai-only |
| 50 / M2a | `hQRHχ` (7/8, Dirichlet) | `heckeL_ne_zero` (`HeckeCorollary.lean:12`) at K = ℚ, χ read as `RayClassCharacter ℚ (q)` | **PARTIAL** — same 31/32 weakening; `hFEχ` stays (mathlib gap; DZDF FE is totally-complex-only, ℚ excluded) |
| 20 / M1 | `hCZ`, Card20 fields, engine seam | — (DZDF: no counting/EF/engine content) | **NO** — hCZ untouched (`20-hCZ-NOTE.md` verdict stands) |
| 20 / (II) | Hecke-L object + zero-free | `RayClassCharacter` (`RayClasses/Character.lean:12`) + `heckeL_ne_zero` | **PARTIAL** — object layer switches openai→DZDF (every field, every modulus, on pin); constant 7/8 → 31/32 |
| 42 / M2b | `hCert` + `hK673` (ζ 2/3) | `simple_proportion_lower` (`V2 Main.lean:47`; C₀ = 0.6725 > 2/3) | **DISCHARGES** — unconditional; certificate machinery dropped (no native_decide in donor) |
| 42 / M2b | `hCert` + `hK839` (ζ 5/6 distinct) | `distinct_proportion_lower` (`V2 Main.lean:88`; C₁ = 0.83625 > 5/6) | **DISCHARGES after QA fix** — pilot's `countDistinctOnCum` is on-line-distinct, stronger than any donor; re-vocab to strip-distinct (faithful to zeta23 `Ndist`/Knausgård/V2) |
| 42 / M2b | `hEχ`, `hEχd` (χ-side) | — (V2 ζ-only) | **NO** — zeta23 ThmE port remains the only route |
| 22 | Tier-2 band + Perron | PNT+ Perron/Hadamard OK on pin; no fixed-exponent band; StrongPNT endpoint commented out | **NO acceleration** — stop-at-M4 stands; all-AxiomMath 31/32 variant recorded, not slotted |
| 21, 40 | — | — | **NO deltas** (two convenience alternates noted) |
| 42/20 gen. | `hfac` (factorization) | `dedekindAbelianQuotient` (`EntireAbelianQuotient.lean:13`) | **NEW DONOR** — general-abelian factorization; 70-series feeder |

## Recommended new milestones (for the pilot lanes)

1. **Pilot 42 M4 (donor swap to V2)** — top pick: all glue is S− count-identification; lands
   the first ζ-side-unconditional ζ_K proportion theorems (2/3 clean; 5/6 + defect after
   the strip-distinct QA fix); kills `hCert` on the ζ side entirely. Add the on-pin
   `#print axioms` of the two V2 endpoints to the run.
2. **Pilot 50 M2-31/32** — unconditional strip confinement [1/32, 31/32] for ζ (and the
   Dirichlet shell at 31/32, `hFEχ`-only), gated on the DZDF build probe; statement-level
   fallback (hDZ binder) available today.
3. **A7/G1 prerequisite (DZDF build)** — extend `axbump.py` `BUILDS` with
   `("DedekindZetaZeroFree", ["DedekindZetaZeroFree", "DedekindZetaSolution"])` + a
   vendor-CFT mathlib-redirect patch (the V2/PNT+ pattern); expect fix rounds from the
   v4.35 vendor subtree. Until green, every DZDF verdict above is statement-level only.
4. **axcheck sweep of the AxiomMath headlines on pin** (V2's eight proportion theorems;
   DZDF's two after (3)) — extends `feasibility/probe/make_axcheck.py` staging; closes the
   last axiom-hygiene gap (donor comparator configs are good evidence, on-pin prints are
   proof).
