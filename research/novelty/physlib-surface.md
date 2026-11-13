# physlib — novelty-surface map (iteration-4 Phase-1 input)

Lane A5 (novelty), 2026-11-14. **Object:** `leanprover-community/physlib` — the
Lean-4 physics digitalization library, HEPLean's successor home (Tooby-Smith et al.,
Apache 2.0; 834 stars; **pushed 2026-11-13T16:16:11Z at scan** — active daily). **Why
this file exists:** physlib post-dates ALL five corpus surveys (mathlib/tauceti/
openai-math/anthropics/axiommath, surveyed 2026-11-05..13); it is the fresh run's
first new-corpus input and it already fired one novelty clock (the exchange-sign
layer vs dossier/article 52 — VERDICTS §5.1 staleness note, iter4-seed-triage
seed-11). **Method + limits:** directory-level scans of all 21 top-level wings +
verbatim reads of four load-bearing PerturbationTheory files
(`FieldStatistics/ExchangeSign.lean`, `CreateAnnihilate.lean`,
`FieldSpecification/CrAnFieldOp.lean`, `WickContraction/Sign/Basic.lean`) +
`lean-toolchain` (the `FieldStatistic` type and its `bosonic`/`fermionic`
constructors are evidenced from ExchangeSign's own content; `FieldStatistics/
Basic.lean` itself was NOT read — probe item §5). This is SURVEY-GRADE, not a
declaration index (no v3-index build; sizes given where they carry signal). Repo
facts: **toolchain `leanprover/lean4:v4.35.0`** — one minor behind our `v4.36.0-rc2`
(the DZDF-class gap: statement-port ≈ 0 expected per FEASIBILITY-SUMMARY, proofs are
the cost; a pin probe is a G-series item before any consumption).

## §1. The one mature wing: `Physlib/QFT/PerturbationTheory/`

The only theorem-dense part of the library; everything else is early-stage (§2).
Structure (directory listing 2026-11-14):

- `FieldStatistics/` — `Basic.lean` (the `FieldStatistic` bosonic/fermionic type),
  **`ExchangeSign.lean`**: `exchangeSign : FieldStatistic →* FieldStatistic →* ℂ`
  (notation `𝓢(a,b)`), −1 iff both fermionic; lemmas `exchangeSign_symm`,
  `exchangeSign_bosonic`/`bosonic_exchangeSign`, `fermionic_exchangeSign_fermionic`,
  `exchangeSign_eq_if`, `exchangeSign_mul_self(_swap)`, `exchangeSign_ofList_cons`,
  **`exchangeSign_cocycle`** — the statistics-universal ε = ±1 exchange-sign
  calculus, BOTH statistics.
- `CreateAnnihilate.lean` (root, 2.4 KB) — the two-element tag type
  (`create`/`annihilate`) + `normalOrder : CreateAnnihilate → CreateAnnihilate →
  Prop` (total, transitive; false only for (annihilate, create)). **No exchange
  relations.**
- `FieldSpecification/` — `Basic.lean` (the `FieldSpecification` of a theory),
  **`CrAnFieldOp.lean`**: `CrAnFieldOp := Σ (s : 𝓕.FieldOp), 𝓕.fieldOpToCrAnType s`
  (tagged operators; `crAnStatistics`, `crAnFieldOpToFieldOp`,
  `crAnFieldOpToCreateAnnihilate`; "no algebra structure is imposed"), plus
  `CrAnSection` (18.1 KB), `NormalOrder` (19.9 KB), `TimeOrder` (21.2 KB),
  `Filters` — the ordering infrastructure.
- `WickContraction/` (18 files) — involutive pairings of `Fin n` (`Involutions`,
  `Join` 25.9 KB, `InsertAndContract(Nat)` 18.7/22.5 KB, `TimeContract`,
  `StaticContract`, `SubContraction`, `Uncontracted(List)`, …) and **`Sign/`**:
  `Basic.lean` defines `signFinset` and **`sign (φs) (φsΛ) : ℂ := ∏ (a : φsΛ.1),
  𝓢(statistic of the pair's second field, statistic of the filtered in-between
  set)`** (`sign_empty`, `sign_congr`); `InsertNone` (11.8 KB) / `InsertSome`
  (38.9 KB) / `Join` (21.5 KB) develop the sign's insertion/join algebra — the
  engine for the both-statistics Wick theorems (Tooby-Smith, *Digitalizing Wick's
  theorem*, arXiv:2505.07939; the paper proves static AND normal-ordered Wick).
- `WickAlgebra/`, `FieldOpFreeAlgebra/`, `Koszul/`, `FeynmanDiagrams/`,
  `QED/`, `AnomalyCancellation/`, `TopologicalFieldTheory/` (under `QFT/`) —
  the surrounding stack (theorem inventory NOT read — probe item §5).

**Reading:** physlib's perturbation-theory wing is a statistics-graded
operator-and-contraction calculus — operators are FREE/tagged, the ε = ±1 structure
lives in (i) the exchangeSign cocycle on the statistics type and (ii) its lift to
contraction signs. There is NO CAR/CCR relation layer anywhere at file level.

## §2. Everything else is early-stage (collision checks, 2026-11-14)

- `CondensedMatter/ManyBody/Basic.lean` = **358 bytes (stub)**;
  `CondensedMatter/LatticeModels/Basic.lean` = **445 bytes (stub)** — no
  entanglement/entropy/area-law/Hamiltonian/PEPS content.
- `LatticeQFT/` = `API-map.md` (5.2 KB intent map) + 397-B stub — no fermions/CAR/
  lattice Hamiltonians (read the API-map before ever chartering lattice work —
  the AreaLaw2D `docs/3D/Targets.md` pattern).
- `QuantumMechanics/` = intro-QM scale (single-particle systems, qubits);
  `HilbertSpaces/{FiniteTarget,OneDimension,SpaceD,TensorProducts}` thin
  (FiniteTarget = one 6-KB Basic).
- `Mathematics/` = {Calculus, Distribution, ForMathlib, Groups,
  InnerProductSpace, KroneckerDelta, LeviCivita, Modules, SpecialFunctions,
  Tensors, VariationalCalculus} — **no entropy, no density matrices, no complex
  analysis, no symmetric functions, no number theory at directory level**
  (SpecialFunctions unread — probe item §5).
- Remaining wings (ClassicalMechanics, Electromagnetism, FluidDynamics, Cosmology,
  Optics, Particles, ProbabilisticTheory, Relativity, StatisticalMechanics,
  StringTheory, Thermodynamics, Units, SpaceAndTime, Meta): not scanned — no
  intersection with our corpus topics is plausible at our zones; a full v3-index
  build would settle it mechanically.

## §3. Collisions vs our record (the triage-relevant verdicts)

1. **Dossier/article 52 (occupation calculus) — LAYER-DISTINCT, precision-corrected
   [VERDICTS §5.1 note + seed-11 closure]:** physlib TAKES the exchange-sign layer
   (exchangeSign cocycle + contraction-sign lift — any NEW "statistics-universal
   ε-sign calculus" framing without differentiation is dead). physlib does NOT
   touch the occupation-pair layer: `CreateAnnihilate`/`CrAnFieldOp` impose no
   relations; article 52's axioms (c_ic_j = ε c_jc_i; a_ic_i = 1 + ε c_ia_i;
   vacuum; dual-family; Pauli boundary) remain ours-and-unclaimed-by-others.
2. **Dossier 74 / quantum-info-substrate — NO COLLISION.** No entropy/density
   matrix/partial-trace content anywhere (§2); the EntropyMoments/MarginalTails
   layers are untouched externally. 74's clocks remain internal (Physlib-on-our-pin
   for AreaLaw2D is a DIFFERENT Physlib — the AxiomMath vendored one; do not
   confuse the two names).
3. **Family-265 / AL zone (72/74/seed-1) — NO COLLISION.** No local Hamiltonians,
   spectral gaps, ground states, PEPS, or area laws anywhere; CondensedMatter and
   LatticeQFT are stubs.
4. **Name-collision trap (record):** THREE distinct "Physlib"s now exist in our
   record — (a) THIS leanprover-community/physlib (HEPLean successor), (b) the
   `Physlib` Lean package VENDORED inside AxiomMath/AreaLaw2D (the 5
   `QuantumInfo.*` imports of G4/G5a — a different project), and (c) the
   PhysLean/Tooby-Smith precedent name used in round-5 §5.1 (= this physlib's
   ancestor). Every future note must disambiguate.

## §4. Donor potential + empty zones it opens (iteration-4 candidates)

- **Donor, statement-level (v4.35 gap):** the `exchangeSign` cocycle +
  `WickContraction.sign` as cited statements for any sign-combinatorics of ours
  (52's `sign_transposition` family, seed-11 bridge glue). Cheap, but only after a
  G-probe pins elaboration on v4.36 (expect ≈ 0 for statements).
- **Empty zone (i), the sharpest — the RELATION layer donation is OURS to give:**
  physlib has statistics-graded operators WITHOUT (anti)commutation semantics;
  article 52's ε-uniform occupation-pair axioms are exactly the missing relation
  layer. A dossier "occupation-pair semantics for `CrAnFieldOp`" = a genuine
  cross-project donation (instantiating 52's axioms on physlib's tagged ops +
  proving the dual-family transport) — the 71/73 dictionary pattern aimed
  OUTWARD at a live external corpus.
- **Empty zone (ii):** quantum information (density matrices, entropy, partial
  trace) absent in physlib while AreaLaw2D + openai-math carry it — a
  physlib↔our-AL-corpus bridge would be first-contact material.
- **Empty zone (iii):** `normalOrder`-relation ↔ normal-ordering-algebra
  dictionary (physlib's Prop-valued two-point order vs 52's vacuum/normal-order
  story) — small, foldable into (i).
- **Seed-11 bridge unchanged:** tauceti `carLieModule`/Casimir ↔ physlib
  statistics-graded Wick stack — the original empty-zone pair, now with a
  surveyed target surface.
- **NOT opened:** anything ζ/L-function/analytic-NT (no content), anything
  complexity-theoretic.

## §5. Probe items if physlib is charted (G-series style, before consumption)

1. Toolchain/Mathlib pin: repo says v4.35.0; elaboration check of the five §1
   statements on OUR pin (expect ≈ 0; DZDF-precedent).
2. `WickAlgebra/` + `FieldOpFreeAlgebra/` theorem inventory (are the Wick
   theorems PROVED in-repo or paper-only? — the 2505.07939 claim needs its in-repo
   anchors before we cite the stack as theorem-grade).
3. `Mathematics/SpecialFunctions` content (γ/ζ-adjacent?).
4. `LatticeQFT/API-map.md` intent read (pre-charter for any lattice idea).
5. Standing clock: re-check `pushed_at` via `https://api.github.com/repos/
   leanprover-community/physlib` (one fetch; the tracker §9.5 pattern) — the
   library moves daily and fired once already.
