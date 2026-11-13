# Survey — the vendored class-field-theory tree inside DedekindZetaZeroFree

Lane A1 (axiommath-surveyor), Cycle 2, 2026-11-13 (task A1-4). Object:
`/home/doz/zcode-workdir/axiommath/DedekindZetaZeroFree/vendor/class-field-theory/`
(read-only), the Lake **path dependency** `FiniteAbelianGlobalReciprocityv2` of DZZF's
lakefile; 1,658 retained .lean files (`formalization.yaml:69–72`), indexed by A5 as
`axiommath-vendor-cft` (13,114 decls). Subtree sizes (counted this session):
`Lean4/ClassFieldTheory/` 1,247 files / 361,836 lines; `Lean4/ValuedFieldTheory/` 329 /
143,991; `Lean4/GaloisCohomology/` 81 / 26,214; `Lean4/ProCGroups/` 1 / 127. Companion to
`research/survey/axiommath.md` §1.1/§3 and `research/novelty/axiommath-as-donor.md` §0 (the
build-gate row). Every claim carries a file:line locator verified this session.

## (a) What the vendor actually proves

**Ultimate source and self-description.** The vendored tree is the **complete production
library of `github.com/n-yamaguchi-0729/ClassFieldTheory` @ `77137952`**, as bundled by the
Palomar-Archive presentation repo `PalomarArchive/n-yamaguchi-0729--FiniteAbelianGlobalReciprocityv2--ccc6f4bb14f4`
(see §(e)); DZZF retains 1,658 of its modules at upstream revision `58370e62`
(`formalization.yaml:68–72`). Its own entry point describes the scope
(`Lean4/ClassFieldTheory/All.lean:42–54`): "local class field theory and global class field
theory for number fields, including the Hilbert product formula, general power-residue
reciprocity, and Gauss quadratic reciprocity, together with the Hasse–Arf and
Kronecker–Weber theorems", plus shared valuation/ramification/cohomology/Kummer/local-field/
Lubin–Tate infrastructure.

**Statement classes, with entry points** (reader-facing layer under
`ClassFieldTheory/Theorems/`, production layer under `ClassFieldTheory/…`; all paths below
relative to `vendor/class-field-theory/Lean4/`):

1. **Global Artin reciprocity, ideal-theoretic (the vendor's named headline).**
   `ClassFieldTheory.finiteAbelianGlobalReciprocity` —
   `ClassFieldTheory/Theorems/GlobalClassFieldTheory/FiniteAbelianGlobalReciprocity.lean:41`:
   for every finite abelian `L/K` (number fields, `[IsAbelianGalois K L]`),
   `Nonempty (FiniteAbelianReciprocityData K L)` — the data structure
   (`Definitions/GlobalClassFieldTheory/FiniteAbelianReciprocityData.lean:36–48`) being a
   modulus `m : RayClassModulus K`, `IsUnramifiedOutsideModulus K L m`, and a **surjective**
   Artin hom `RayClassGroup m →* (L ≃ₐ[K] L)` sending prime classes to mathlib's arithmetic
   Frobenius. Docstring (:19–24): "The statement is ideal-theoretic; its proof transports the
   existing idelic reciprocity construction through the ray class comparison."
2. **Global reciprocity, idelic/topological.**
   `topologicalGlobalReciprocity` —
   `Theorems/GlobalClassFieldTheory/TopologicalGlobalReciprocity.lean:46`; the Palomar
   compared declaration is the norm-quotient form **C_K/N_{L/K}(C_L) ≃ₜ* Gal(L/K)**
   (`finiteAbelianGlobalReciprocity_relativeNormQuotient`; upstream README, §(e)). Supporting
   production layer: `Reciprocity/MaximalAbelianGlobalArtin.lean:48,59,74` (maximal abelian
   Artin map: `_mk`, `_finiteProjection`, `_surjective`), kernel
   `Reciprocity/MaximalAbelianKernel.lean:140`, the idele-class direct-limit tower
   (`Reciprocity/IdeleClassDirectLimit*.lean`, ~15 files), local–global Artin compatibility
   (`Reciprocity/LocalGlobalArtinCompatibility/`), Hilbert product formula
   (`Reciprocity/HilbertProductFormula.lean`, `MathlibHilbertProductFormula.lean`), power- and
   quadratic-residue reciprocity (`Reciprocity/PowerResidueReciprocity.lean`,
   `RationalQuadraticPowerResidueReciprocity.lean`).
3. **Ray class fields — existence side.**
   `ClassFieldTheory.rayClassField_reciprocity` —
   `Theorems/ConductorsAndRayClassFields/RayClassFieldReciprocity.lean:34`: for every modulus
   `m`, `Nonempty (RayClassFieldRealization K m)` — a finite abelian extension whose Galois
   group *is* the ray class group mod m, compatibly with finite global reciprocity
   (docstring :20–25: "No global choice of ray class field is exposed"). Conductor theory
   around it: `Theorems/ConductorsAndRayClassFields/` — `ExistsUniqueAbelianConductor.lean`,
   `IsAbelianConductorUnique.lean`, `EmbedsInRayClassFieldIffConductorLe.lean`,
   `RayClassFieldDegree/ModulusMonotone/PrimeSplitting.lean`; production
   `GlobalClassFieldTheory/GlobalClassFields/` (~75 files) carries the correspondence
   machinery: `FiniteAbelianClassFieldCorrespondence.lean`, `ClassFieldRealization.lean`,
   `RayClassFieldRealization.lean:147 rayClassField_ideleClassNorm_range` (norm-range
   identification), `NormLimitation.lean:147 normLimitation`, Hilbert class field family
   (`BigHilbertClassField*.lean`, `SmallHilbertClassField*.lean`,
   `HilbertClassFieldMaximality.lean`), norm groups
   (`FiniteIndexNormClassField.lean`, `OrdinaryNormClassField.lean`,
   `HilbertNormCharacterization.lean`).
4. **Ideal-theoretic classics.** Principal ideal theorem:
   `GlobalClassFieldTheory/IdealClassFieldTheory/PrincipalIdealTheorem.lean:40
   principalIdealTheoremClassGroupIsMulCommutative` (+ capitulation/tower
   `PrincipalIdealTower.lean`, `AbstractCapitulation.lean`); ideal Artin map and decomposition
   law (`IdealArtinMap.lean`, `IdealDecompositionLaw.lean`, `IdealFrobenius.lean`).
5. **Kronecker–Weber.** `Theorems/KroneckerWeber.lean:38 kroneckerWeber`: every finite
   abelian `L/ℚ` embeds in `CyclotomicField n ℚ` for some n > 0.
6. **Local CFT (full).** `LocalClassFieldTheory/Finite/LocalReciprocity/MathlibInterface.lean:62
   finiteAbelianLocalExistence` (+ `:72 _orderIso`): local existence/reciprocity; Lubin–Tate
   (`ClassFieldTheory/LubinTate/`), local norm index
   (`Theorems/LocalClassFieldTheory/`: `fieldNormSubgroup_finiteIndex`,
   `mem_fieldNormSubgroup_iff_ringEquiv`); **Hasse–Arf**:
   `ClassFieldTheory/HasseArf.lean:859 hasseArf_canonical`.
7. **Infrastructure subtrees.** `ValuedFieldTheory/` (329 files: local fields, discrete
   valuation, log/exp series — `LocalField/Analytic/LogExpSeries/*`),
   `GaloisCohomology/` (81 files), `ProCGroups/`, `RamificationTheory/`, `KummerTheory/`,
   `AbstractClassFieldTheory/` (class field axiom:
   `GlobalClassFieldTheory/ClassFieldAxiom/`).

**How far does it go — completeness verdict.** This is **substantially complete global CFT
for number fields**: reciprocity in ideal-theoretic AND idelic forms, the existence theorem
(ray class field realizations for every modulus), the conductor calculus, norm limitation,
principal ideal theorem, plus local CFT with Lubin–Tate and Hasse–Arf and Kronecker–Weber.
What is *not* claimed: no global *functorial* choice of class field (deliberately — "No
global choice of ray class field is exposed", `RayClassFieldReciprocity.lean` docstring), no
idele-class-field topological isomorphism of the *maximal* abelian extension beyond the
assembled pieces, no function-field/geometric CFT (see (d)), no explicit class field
*construction* (complex multiplication etc.). Relative to the classical corpus this is the
Neukirch–Chébotarev-era core, not the geometric/unramified-cohomological periphery.

## (b) Relation to DZZF's `EntireAbelianQuotient` layer

DZZF's ζ_L = g·ζ_K factorization
(`DedekindZetaZeroFree/LFunctions/Dedekind/EntireAbelianQuotient.lean:13
dedekindAbelianQuotient`) is proved from `AbelianQuotient.abelianFactorization K L hcomm`
(`LFunctions/Dedekind/AbelianRayCharacterFactorization.lean`; statement consumes
`conductorRayRealization K L` at `:79`) times entire Hecke continuations
(`LFunctions/Hecke/RayCharacterEntireContinuation.lean`).
`conductorRayRealization` (`Arithmetic/RayClasses/Reciprocity/ConductorRealization.lean:13`)
realizes every character of Gal(L/K) as a ray class character of conductor `m ρ ≠ ⊥` with
`χ ρ p = primeArtinValue ρ W` — built from `singleCharacterExactRayRealization`
(`Arithmetic/RayClasses/Reciprocity/GaloisCharacterRealization.lean:75`), i.e. exactly the
conductor-exact form of vendor reciprocity.

**Closure measurement (computed this session, BFS over `public import` edges):** the import
closure of `dedekindAbelianQuotient` spans **136 DZZF files**, of which **12 import vendor
modules directly** — `Arithmetic/RayClasses/Representatives/{IntegralIdealClasses,
CosetIdealCorrespondence,IntegralRepresentatives,PrimeClassFactorization}.lean`,
`Arithmetic/RayClasses/Characters/{PrincipalCriterion,CharacterDescent,
FractionalIdealCharacterKernel,PrimeDetermination}.lean`,
`Arithmetic/RayClasses/Conductors/NormConductorFiniteSupport.lean`,
`Arithmetic/LocalFields/IntegralRayCongruence.lean`,
`Arithmetic/Ideals/WeightedFractionalCharacter.lean`, and
`LFunctions/Hecke/PrimeArtinValues.lean`. Those 12 use a **10-module vendor surface**:
`Definitions.ConductorsAndRayClassFields.{IsRayCongruent, RayClassOfFinitePrime}`,
`Definitions.FrobeniusAndHilbertClassFields.{ArithmeticFrobeniusAt,
FinitePrimeFractionalIdeal, NumberFieldFractionalIdealFactorization}`,
`GlobalClassFieldTheory.GlobalClassFields.MathlibGlobalReciprocity`,
`Theorems.ConductorsAndRayClassFields.{RayClassGroupFinite, RayClassGroupHomExtFinitePrime,
RayLocalHigherUnitOneAdd, RayPrincipalIdealMembership}`.

So: what the vendor supplies that ζ_L = g·ζ_K needs is the **ray-class-group layer** —
finiteness of ray class groups (`RayClassGroupFinite`), ray congruence/principal-ideal
membership tests (`IsRayCongruent`, `RayPrincipalIdealMembership`), Frobenius-at-a-prime
values (`ArithmeticFrobeniusAt`), the local higher-unit congruence
(`RayLocalHigherUnitOneAdd`), and the reciprocity-backed identification of ray classes with
Galois groups (`MathlibGlobalReciprocity`) that lets DZZF descend Galois characters to ray
characters with exact conductor. The *deep* CFT (existence of class fields, Lubin–Tate,
Hasse–Arf, principal ideal theorem, Kronecker–Weber) is **not** on the quotient chain — it
sits behind the reciprocity identifications only. DZZF-wide, 67 library files import vendor
modules (18 of them `ClassFieldTheory.All` wholesale — the heavy pattern; the 12 quotient
files above use narrow imports).

## (c) Toolchain/pin facts — precisely what breaks

- Vendor `lean-toolchain`: **`leanprover/lean4:v4.35.0-rc2`** (file read this session) —
  one toolchain *generation* below our v4.36.0-rc2, and even below DZZF's own pre-bump
  v4.35.0-rc3. Vendor lakefile pins mathlib **`065356127b1dc0016f66b7283ce0ce2c4055aa55`**
  (also its manifest) — again not DZZF's pre-bump `0493595e` (`git show 09afbb4:lakefile.toml`)
  and not our `ff2494ea`.
- **What the pins mean inside the workspace.** As a Lake *path dependency*, the vendor is
  built by DZZF's workspace under the **root's** toolchain and mathlib — its own
  `lean-toolchain`/mathlib pin are inert there. Hence the operative risk is not the toolchain
  *file* but **1,658 files of v4.35-era source elaborating against mathlib `ff2494ea` under
  v4.36.0-rc2**: the adaptation DZZF performed ("Adapted for Lean's module system and the
  pinned Lean/Mathlib versions", `formalization.yaml:71–72`) targeted the pre-bump pair
  (v4.35.0-rc3 / mathlib `0493595e`), and **the bump commit `4f6208b` changed the pins
  without any recorded full rebuild** — axbump never built DZZF (`axbump.py:44–45` `BUILDS`
  lists only ZetaZeros/ZetaZerosV2; `axiommath-as-donor.md` §0). The drift window
  `0493595e → ff2494ea` is exactly the v4.35→v4.36 API-churn window that cost ZetaZerosV2
  nine Modal iterations on a *28k-line* library (`axiommath-bump/logs/v2-run1..9`); scaled
  to 1,658 files the expected fix surface is proportional, plus:
- **Build-economics friction, read off the vendor lakefile:** `weakLeanArgs = ["-j1"]`
  (serialized elaboration), `enableArtifactCache = false`, `restoreAllArtifacts = false`
  (no olean sharing — forced local recompilation), `linter.missingDocs = true` on
  `ClassFieldTheory.All`. Standalone (outside DZZF) the vendor would fetch mathlib
  `06535612` under v4.35.0-rc2 and build in its own right; inside our Modal staging it has
  no independent existence.
- **Net for A7/G1 pricing:** the vendor is the single largest risk item of the DZZF
  full-build probe (A3 §0 recommendation 3): expect (i) v4.36-API fixes across the drifted
  fraction of 1,658 files, (ii) `-j1` serialization inflating wall-clock (relaxing
  `weakLeanArgs` is a one-line candidate mitigation worth pricing), (iii) the stale DZZF
  manifest (`0493595e`, survey §3) forcing a `lake update` first.

## (d) Consumers

**Dossier 75 (A9's abelian-assembly candidate, in flight).** What a ζ_L-proportions-for-
abelian-L/K pilot needs from this vendor tree, by route:

- **Binder route (recommended, zero vendor dependency):** consume only the *statement*
  `dedekindAbelianQuotient` (`EntireAbelianQuotient.lean:13`) as an explicit hypothesis —
  the exact `hfac` shape pilot 42-M2a already proved consumable
  (`axiommath-as-donor.md` §(f)). The pilot then needs **no DZZF and no vendor imports
  whatsoever**; discharge is deferred to whenever the G1 DZZF build lands. This mirrors
  42-M2a's tauceti-quadratic discharge and the `EnclOK`/`hQRH` precedents.
- **Import route (blocked today):** direct import of `DedekindZetaZeroFree.…EntireAbelianQuotient`
  drags the 136-file DZZF closure incl. the 12 vendor-importing files and the 10-module
  vendor surface (§(b)) — i.e. the full DZZF+vendor+TauCeti build on our pin, currently
  unbuilt/unmeasured (§(c)). If A7 prices a *staging shortcut*, the minimal vendor cut is
  those 10 modules + their own import closures (all under `Definitions/` and
  `Theorems/ConductorsAndRayClassFields/` + `MathlibGlobalReciprocity`), not
  `ClassFieldTheory.All` — but note `MathlibGlobalReciprocity.lean` itself sits on the
  idelic reciprocity stack, so the shortcut may not stay small; measure before relying on it.
- **Statement donors for the dossier's binder block:** the vendor decls whose *shapes* 75's
  hypothesis layer will echo: `finiteAbelianGlobalReciprocity` (surjective ray-class Artin
  map), `rayClassField_reciprocity` (existence per modulus), `FiniteAbelianReciprocityData`
  (the data structure 75 can quote verbatim as its CFT binder), and DZZF-side
  `conductorRayRealization` (character-level conductor-exact realization,
  `ConductorRealization.lean:13`) — the last is the precise bridge between "abelian
  extension" and "products of ray-class Hecke L-functions" that 75's assembly consumes.

**A2's FF-EZ3 Tate-dictionary: ABSENT, verified.** Word-boundary sweep over the vendor tree
(`\bTate\b|FunctionField|GlobalField\b|functionField`, grep -rE, this session): all
Tate-branded content is **number-field-side** — Lubin–Tate theory (`HasseArf.lean:68`,
`All.lean:51`, the `LubinTate/` dir; identifiers `TateLevelField`/`TateSeries`/…) and Tate
**cohomology** (`tateCohomology` in `AlgebraicNumberTheory/Idele/Cohomology/Decomposition.lean`,
`GlobalClassFieldTheory/ClassFieldAxiom/IdeleClassFormation.lean`) [erratum 2026-11-13, A1
per H Q5d: v1 said "every `Tate` hit is Lubin–Tate" — overstated, the Tate-cohomology
objects were missed; load-bearing sweep unchanged] — and the **FunctionField/GlobalField
sweep returns 0 hits**: zero function-field / global-field / geometric-class-field
declarations — the vendor is number-field-only by construction (its product formula,
ideles, and ray classes all live over `[NumberField K]`, e.g.
`FiniteAbelianReciprocityData.lean:38–39`). A2's
Tate-dictionary empty-zone finding extends to this tree: no s-plane, no 𝔽_q, no geometric
reciprocity (consistent with my §FF double-cover in `survey/axiommath-pntplus.md`).

## (e) Provenance

Chain of custody, fully cited:

1. **Original:** `github.com/n-yamaguchi-0729/ClassFieldTheory` @ `7713795234690681b4406ae198b07aa95e82716a`
   — author **Naganori Yamaguchi**, "assisted by OpenAI Codex" (copyright header in every
   module, e.g. `Lean4/ClassFieldTheory/All.lean:11–13`,
   `Theorems/GlobalClassFieldTheory/FiniteAbelianGlobalReciprocity.lean:10–12`), Apache-2.0.
2. **Palomar presentation:** `PalomarArchive/n-yamaguchi-0729--FiniteAbelianGlobalReciprocityv2--ccc6f4bb14f4`
   @ `58370e62` — self-described as "Global class field theory in Lean 4.35.0-rc2", bundling
   the complete ClassFieldTheory source tree and "presenting its finite norm-quotient form",
   with the comparator declaration
   `ClassFieldTheory.GlobalClassFieldComparison.finiteAbelianGlobalReciprocity_relativeNormQuotient`
   (C_K/N_{L/K}(C_L) ≃ₜ* Gal(L/K)) against a mathlib-only Challenge that constructs the
   relative idèle-class norm as a determinant norm on `𝔸_K ⊗[K] L` (upstream README, fetched
   2026-11-13). I.e. the same Palomar trusted-challenge/comparator template as the
   anthropics corpus (`survey/anthropics.md` header).
3. **DZZF vendor copy:** 1,658 modules retained from that revision, "Adapted for Lean's
   module system and the pinned Lean/Mathlib versions", original Apache-2.0 license kept
   (`vendor/class-field-theory/LICENSE`; `formalization.yaml:58–72`) — source *reuse* inside
   DZZF, and DZZF's own comparator permits only the standard triad
   (`DedekindZetaZeroFree/comparator.json`).

**Axiom-hygiene note:** the vendored tree is inside DZZF's audited build ("full default
build passes … admitting only the three standard axioms", `formalization.yaml:104–107`) — but
that claim predates the ff2494ea bump (§(c)); no on-pin `#print axioms` exists for any vendor
or DZZF decl (axbump builds nothing of DZZF).

## One-line answer (per the task)

**Can pilot 75 consume the vendor without full DZZF on our pin? NO for imports (nothing of
DZZF — vendor included — builds on ff2494ea today, and the vendor is a v4.35.0-rc2/mathlib-06535612
tree inside DZZF's workspace); YES for statements (75 takes `dedekindAbelianQuotient` /
`FiniteAbelianReciprocityData`-shaped facts as hypothesis binders, exactly the 42-M2a
`hfac` pattern, with discharge deferred to a G1-cleared DZZF build).**

## Sources consulted

- Vendor tree: `lean-toolchain`, `lakefile.toml`, `lake-manifest.json`, `LICENSE`;
  `Lean4/ClassFieldTheory/All.lean` (scope docstring + copyright),
  `Theorems/GlobalClassFieldTheory/{FiniteAbelianGlobalReciprocity,TopologicalGlobalReciprocity}.lean`,
  `Definitions/GlobalClassFieldTheory/FiniteAbelianReciprocityData.lean`,
  `Theorems/ConductorsAndRayClassFields/RayClassFieldReciprocity.lean` +
  dir listing, `Theorems/KroneckerWeber.lean`,
  `LocalClassFieldTheory/Finite/LocalReciprocity/MathlibInterface.lean`,
  `HasseArf.lean`, `GlobalClassFieldTheory/{GlobalClassFields,IdealClassFieldTheory,Reciprocity}/`
  listings + headline greps; subtree file/line counts; FF/Tate word-boundary sweep.
- DZZF side: `DedekindZetaZeroFree/LFunctions/Dedekind/{EntireAbelianQuotient,AbelianRayCharacterFactorization}.lean`
  (paths as cited), `Arithmetic/RayClasses/Reciprocity/{ConductorRealization,GaloisCharacterRealization}.lean`,
  `LFunctions/Hecke/PrimeArtinValues.lean`; BFS import-closure computation (136 files /
  12 vendor-importers / 10 vendor modules); 67-file vendor-import grep with per-module counts;
  `git show 09afbb4:lakefile.toml` (pre-bump mathlib `0493595e`).
- External: `PalomarArchive/n-yamaguchi-0729--FiniteAbelianGlobalReciprocityv2--ccc6f4bb14f4`
  README (raw.githubusercontent, fetched 2026-11-13) — upstream chain, compared declaration,
  determinant-norm challenge.
- Project: `research/survey/axiommath.md` §1.1/§3/§5, `research/novelty/axiommath-as-donor.md`
  §0/§(a)/§(f), `research/survey/axiommath-pntplus.md` §FF, `research/feasibility/axiommath-bump/`
  (axbump.py:44–45, logs), A5's decl-index name `axiommath-vendor-cft` (13,114 decls, as
  given in the task).
