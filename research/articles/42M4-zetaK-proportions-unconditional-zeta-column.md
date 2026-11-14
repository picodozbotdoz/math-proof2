# ζ_K Zero Proportions with an Unconditional ζ-Column: the ZetaZerosV2 Donor Swap

*cross-math-fronttier research article 42-M4 (Cycle 2) · FINAL · standalone article for
the Cycle-2 donor-swap result (the main-run article
`42-quadratic-dedekind-zeta-zero-proportions.md` is kept frozen as the
certificate-conditional record and is cited, not edited) · dossier
`research/candidates/42-zeta-k-two-thirds-product-assembly.md` · blueprint
`research/pilots/42-M4-blueprint.md` · Lean `research/pilots/42/{M4a,M4b}.lean` · note
`research/pilots/42/M4-note.md`*

**Status: PROVED, FINAL.** `M4b.lean` (1,571 lines, 68 theorems) imports AxiomMath's
ZetaZerosV2, built on our exact mathlib pin, and proves the three upgraded landing
theorems. Every theorem, including the imported donor endpoints, has axioms exactly
`[propext, Classical.choice, Quot.sound]`. On the ζ side there is no certificate
hypothesis and no `native_decide` anywhere in the dependency tree. A binder-only fallback
version (1,560 lines, 66 theorems) is preserved byte-exact and also verified.

---

## Abstract

Let K be a quadratic field with Dedekind zeta function ζ_K = ζ · L(s, χ_D). Article 42
proved, kernel-checked, that ≥ 2/3 of ζ_K's nontrivial zeros up to height T lie on the
critical line (counted with multiplicity, for all large T). It also proved ≥ 5/6 distinct
modulo a common-zero defect. Both results took the ζ-side input from Knausgård's
certified constants (0.6735…, 0.8390…), which entered as an opaque certificate
hypothesis checked by external C++/Python tooling. ZetaZerosV2 (AxiomMath) proves
Lamzouri's theorem in Lean: eventually more than 0.6725 of ζ's zeros are simple and on
the line, and more than 0.83625 are distinct. We replace the certificate by these imported
theorems. The resulting landing theorems are the first ζ_K zero-proportion statements
whose ζ-column is unconditional *inside Lean*. The remaining hypotheses are the
Dirichlet-column proportion (zeta23's Theorem E, still a hypothesis), the factorization
and analyticity data, and window finiteness. A new strip-distinct vocabulary layer (M4a)
restates the distinctness assembly for zeros in the critical strip rather than on the
line, matching the donor's counting convention exactly.

## 1. Introduction

Article 42's discipline consumed external results only as hypotheses. That made the
theorems provable, but it left the ζ column of every assembly theorem conditional on a
non-Lean artifact. Cycle 2 registered ZetaZerosV2. Probe G2 reproduced its full build on
our pin (`ff2494ea`, v4.36.0-rc2; 8,262 jobs) and audited 13 of its theorems as
triad-clean. That changed what could be consumed. The donor's constants, 0.6725 > 2/3
and 0.83625 > 5/6, clear the round constants the assembly needs by margins ≈ 0.0058 and
≈ 0.0029. A corpus result becomes a consumable, and a proved theorem gets strictly better
hypothesis hygiene with no new analysis.

**Honesty.** There is no new analytic mathematics. Article 42's assembly is itself
corollary-level. The new parts are:
- (a) the strip-distinct vocabulary (M4a);
- (b) the identification glue between the pilot's cumulative counts and V2's counting
  functions;
- (c) the landing theorems with the ζ-side discharged.

Knausgård's constants are *stronger* but conditional. V2's are slightly weaker but
unconditional. We record the trade, not a strict improvement in constants.

## 2. Setting

As in article 42 (and article 75 §2): `multOf f ρ = analyticOrderNatAt f ρ`, windows
(0, T] in the strip 0 < Re ρ < 1, the cumulative counts `countCum` and `countOnCum`, and
`EpsLowerCum z c` :⟺ ∀ε>0 ∃T₀ ∀T≥T₀, (c − ε)·countCum z T ≤ countOnCum z T.

M4a adds three things:
- `distinctCountCum z T`, the number of distinct strip zeros up to height T (`M4a.lean:821`);
- `EpsLowerDistinctStripCum z c`, the ε-form of the same ratio bound with the distinct
  count as numerator (:833);
- `commonStripCum z w T`, the number of strip points that are zeros of both factors.

`FactorizationOnHalfPlane fK fζ fχ` :⟺ ∀ s, Re s > 1 → fK s = fζ s · fχ s. The identity
theorem extends this to the punctured plane (`funEq_of_factorization`).

**Donor endpoints** (imported, `ZetaZerosV2/ZetaZeros/Main.lean:130,149`):
- `V2d4_endpoint := ZetaZeros.simple_proportion_d4`: ∃ T₀, ∀ T ≥ T₀,
  0.6725 < simpleOnLineCount(T)/zeroCount(T);
- `V2d5_endpoint := ZetaZeros.distinct_proportion_d5`: ∃ T₀, ∀ T ≥ T₀,
  0.83625 < distinctZeroCount(T)/zeroCount(T).

## 3. Main results

Fix fK, fχ : ℂ → ℂ (intended: fK = ζ_K, fχ = L(s, χ_D)). Common hypotheses (H):
- window finiteness of `multOf fK`, `multOf riemannZeta` and `multOf fχ`;
- fχ and fK analytic at every s ≠ 1;
- (s − 1)·fK(s) and (s − 1)·ζ(s)fχ(s) analytic at 1;
- `analyticOrderAt riemannZeta ρ ≠ ⊤` and `analyticOrderAt fχ ρ ≠ ⊤` for all ρ;
- `FactorizationOnHalfPlane fK riemannZeta fχ`.

Analyticity of ζ off s = 1 is *discharged* inline (`analyticAt_riemannZeta`).

**Theorem 1 (`zetaK_two_thirds_landed_of_V2`).** Assume (H) and
hEχ : `EpsLowerCum (multOf fχ) (2/3)`. Then `EpsLowerCum (multOf fK) (2/3)`.
In words: ≥ 2/3 of ζ_K's strip zeros up to T, with multiplicity, lie on the line, for all
large T.

**Theorem 2 (`zetaK_distinct_five_sixths_strip_landed_of_V2`).** Assume (H) and
hEχdStrip : `EpsLowerDistinctStripCum (multOf fχ) (5/6)`. Then for every ε > 0, for all
large T,
  (5/6 − ε)·N_K(T) ≤ D_K(T) + commonStrip(ζ, fχ)(T),
where N_K and D_K are ζ_K's strip count and distinct strip count.

**Theorem 3 (`…_of_V2_of_negligible`).** If in addition the common strip zeros are
negligible (`hCZStrip`: for every ε, eventually commonStrip ≤ ε·N_K), then
`EpsLowerDistinctStripCum (multOf fK) (5/6)`.

Compared with article 42's landings, Theorems 1–3 drop `hCert`, `hK673` and `hK839`
entirely. The ζ-side inputs are the imported donor theorems. The χ-side inputs
(`hEχ`/`hEχdStrip`, transcribed from zeta23's Theorem E) and the structural set are
unchanged.

## 4. Proofs

**ζ-column discharge (`epsLowerCum_zeta_of_V2d4`).** Every simple on-line zero is a
strip zero counted with multiplicity one. So V2's simple-on-line count is ≤ the pilot's
`countOnCum` for `multOf ζ`. V2's `zeroCount` equals the pilot's `countCum` under the
identification glue: the same window, and multiplicities equal to `analyticOrderNatAt`.
The endpoint gives 0.6725·countCum < countOnCum eventually. The denominator is positive
here, because division by zero yields 0 in ℝ, which would contradict 0.6725 < 0. Since
2/3 ≤ 0.6725 (`norm_num`), monotonicity gives `EpsLowerCum (multOf ζ) (2/3)`. The
distinct endpoint is handled the same way, with 5/6 ≤ 0.83625.

**Assembly (article 42's engine).** The factorization holds on Re s > 1. The identity
theorem extends it to s ≠ 1 (`funEq_of_factorization`). Multiplicities then add at every
strip point (`multOf_mul`), so window counts add. Both summands satisfy the ratio bound
at 2/3, so the sum does (`epsLowerCum_of_factorization`). This proves Theorem 1.

For Theorem 2, distinct counts satisfy inclusion–exclusion:
D_K = D_ζ + D_χ − commonStrip. So the distinct bound for ζ_K holds up to the common-zero
defect (`assemble_eps_defect_strip_cum`, M4a). Theorem 3 absorbs the defect with
`hCZStrip`, using ε/2 + ε/2. ∎

## 5. Formal verification

| artifact | run | size | axioms |
|---|---|---|---|
| `pilots/42/M4a.lean` | `m4-run2.log` OK, 0 err / 0 sorry | 1,194 lines, 54 thms | `m4-axcheck-run1.log`: all triad |
| `pilots/42/M4b.lean` (final, `import ZetaZeros`) | `m4b2-run2.log` OK, 0 / 0, elaborated inside the built V2 tree | 1,571 lines, 68 thms | `m4b2-axcheck-run1.log`: 70 theorems + 2 donor prints, triad-only |
| `pilots/42/logs/M4b-fallback-GREEN.lean` (V2 endpoints as hypotheses `hV2d4`/`hV2d5`) | `m4b-run2.log` OK, 0 / 0 | 1,560 lines, 66 thms | `m4b-axcheck-run1.log`: 68/68 triad |

**Cycle-2 final sweep** (`feasibility/VERIFICATION-LEDGER.md` §9.F): `AxPilot42_M4a` is
OK (57 axiom lines). `AxPilot42_M4b` is OK in its donor-tree run (80 axiom lines,
triad-only, 0 sorryAx; `feasibility/probe/logs/stepB-c2-m4b-donor.log`).

**Donor hygiene:** the imported endpoints `ZetaZeros.simple_proportion_d4` and
`distinct_proportion_d5` print triad-only from the consumer side. Probe G2 (run3)
printed 13 donor theorems, including `simple_proportion_lower` and
`distinct_proportion_lower`, all triad-only on our pin. The donor's ζ-side argument
passes through the PrimeNumberTheoremAnd fork's pair-correlation glue
(`PairCorrelation/FromLandau.lean:52` ← Landau's log-derivative formula ←
`RiemannZetaHadamard`; `novelty/pntplus-glue-as-donor.md`). The upgrade from fallback to
final is a net change of +11 lines: −3 hypotheses and +2 endpoint bridges. Every proof
except two lines is unchanged.

## 6. Relation to prior work

- **Article 42** (main run): the assembly being upgraded. Its certificate-conditional
  results stand, and its Knausgård constants remain the stronger conditional ones.
- **Y. Lamzouri, arXiv:2609.02882; AxiomMath ZetaZerosV2:** > 2/3 of ζ's zeros simple
  and on the line, > 83.6% distinct. This is the first on-pin, kernel-verified source for
  these constants.
- **Knausgård (arXiv:2609.33043, arXiv:2610.08965):** the superseded ζ-side route
  (0.67354 / 0.83900, with a `native_decide`-fronted certificate layer). It was never
  consumed at the headline theorems.
- **de Laat–Rolen–Tripp–Wagner, arXiv:1908.04876:** > 45% distinct zeros for a *fixed
  quadratic K*, GRH-conditional, asymptotic in T. This is the nearest literature
  statement for ζ_K.
- **Article 75:** the n+1-factor generalization to abelian towers. Theorems 1–3 are its
  n = 2 instances.

## 7. Limitations and open problems

1. The Dirichlet column (zeta23 Theorem E) is still a hypothesis. Discharging it needs
   zeta23's proofs ported from v4.33 (statement port cost ≈ 0; proof port is the cost).
2. `hCZStrip` (negligible common zeros) is conjecture-grade (`pilots/20-hCZ-NOTE.md`).
   Only the defect-form Theorem 2 is free of it.
3. Window finiteness and the ⊤-order exclusions for ζ and L(s, χ) are carried as
   hypotheses. They are classically true and formalizable, but not done here.
4. The unconditional constants have small margins over 2/3 and 5/6. Any improvement
   would come from the donor, not from this assembly.

## References

AxiomMath ZetaZerosV2 (`ZetaZeros/Main.lean:47,88,130,149`);
`feasibility/axiommath-donor-probes.md` §G2; `research/pilots/42/{M4a,M4b}.lean`, logs
`m4-run2`, `m4-axcheck-run1`, `m4b-run2`, `m4b2-run2`, `m4b2-axcheck-run1`,
`pilots/42/M4-note.md`; article 42 and `pilots/42/{M1,M2a,M3,M2b}.lean`; zeta23
`Challenge.lean:131–229`; Y. Lamzouri, arXiv:2609.02882; Knausgård, arXiv:2609.33043,
arXiv:2610.08965; D. de Laat, L. Rolen, Z. Tripp, I. Wagner, arXiv:1908.04876; article 75.
