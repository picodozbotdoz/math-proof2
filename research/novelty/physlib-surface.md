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

## §6. DATED CORRECTION (2026-11-16, A5 battery lane, Phase B) — the QuantumInfo wing landed and §2/§3 aged

R8's G10 record correction said the QuantumInfo/ForMathlib wing survives on modern
master; the full-tree check (gh API, master `pushed_at` 2026-11-16T09:37:19Z, 2,284
paths) confirms and extends it. **§2's "no entropy, no density matrices … at directory
level" and §3's NO-COLLISION verdicts are STALE for these surfaces:**

- Root-level `QuantumInfo/` wing (parallel to `Physlib/`): `{Capacity, Channels,
  ClassicalInfo, Entropy, ForMathlib, Measurements, Operators, ResourceTheory, States}`
  — entropy, states, channels, and resource theory now EXIST as directories. Any
  quantum-info-substrate/dossier-74 claim resting on physlib's emptiness must re-run
  against this wing before chartering.
- `QuantumInfo/ForMathlib/HayataGroup/TraceInequality/` = a full operator-inequality
  stack: `JensenOperatorInequality(+IImpIV/+IVtoV)`, `LownerHeinzCore/Theorem`,
  `LiebAndoTrace`, `OperatorGeometricMean`, `HilbertSchmidtOperatorSpace`,
  `BlockDiagonal`, `GeneralizedPerspectiveFunction` (+ PORTING_NOTES.txt) — directly
  adjacent to tauceti's `Analysis/Matrix/OperatorJensen.lean` (survey §2c) and to any
  trace-inequality-shaped dossier; collision check REQUIRED before citing tauceti's
  operator-Jensen layer as physlib-absent.
- `Physlib/QuantumMechanics/HarmonicOscillator/NumberOperator.lean` (Kevorkian 2026):
  bosonic number-operator commutation calculus on Schwartz maps (`[Nᵢ,aⱼ]=−δᵢⱼaⱼ`,
  `aᵢaᵢ†=Nᵢ+𝟙`, `[H_N,Nᵢ]=0`, symmetric unbounded lifts) — CCR, analytic setting.
- `PhyslibAlpha/Mathematics/LadderSystem/OccupationBasis.lean` (Diem 2026):
  `LadderSystem.finrank_vacuumSpan_eq_choose` — the bosonic occupation-number basis,
  dimension `(d+n-1).choose n`, independence via a diagonal number-operator's distinct
  eigenvalues. **The occupation-spectrum theorem class now EXISTS here** (consumed by
  dossier 77's battery as T3's nearest miss; bosonic — the fermionic CAR side remains
  absent, see next).
- Still TRUE on master (2026-11-16): **no CAR/CCR *relation* layer for fermions
  anywhere** (`CreateAnnihilate`/`CrAnFieldOp` impose no relations; §1 verdict stands);
  `QuantumInfo/ForMathlib/ExchangeRelations.lean` is a rank-one-tensor/Segre
  characterization (border-rank cluster note, not physics).

Tree snapshot of record: `/tmp/r6-traces/physlib-tree.txt` (ephemeral — re-fetch per §5.5
if needed). Files read in full via API this session: NumberOperator.lean (header+key
results), ExchangeRelations.lean, OccupationBasis.lean (header+key results).

### Wing check (2026-11-16, A5 battery lane, Phase B — append-only continuation of §6)

Re-running differentiation for every charter that rested on physlib emptiness, against the
live master surface (same tree snapshot as §6; file contents read via gh API). Verdicts are
grade-agnostic.

**(1) Seed 13 (occupation-pair semantics for `CrAnFieldOp`) — SURVIVES as
tauceti→physlib; does NOT fold into dossier 77.** Evidence: `QuantumInfo/Operators/` =
`Unitary.lean` only — no creation/annihilation algebra there; `States/{Mixed,Pure}` =
fidelity/trace-distance/MState/Bloch/qubit objects, no occupation algebra; the relation
gap on `CreateAnnihilate`/`CrAnFieldOp` (§1) is UNCHANGED on master 2026-11-16. The new
bosonic `PhyslibAlpha/Mathematics/LadderSystem/` wing (Vacuum/Basic/Irreducibility/
OccupationBasis/SymmetricPower) is the nearest structural neighbor — vacuum, creation
words, n-particle sector `vacuumSpan` as a **gl(d) Lie submodule**, occupation basis —
but it is **bosonic and sign-free by design** (`word_perm`: words depend only on the
color multiset; `SymmetricPower.lean`) so article 52's ε-sign axioms have no home there.
Consequences: (a) seed-13's bridge target stands; (b) NEW MUST-CITES for its dossier
round: LadderSystem (the parallel bosonic occupation development — also evidence physlib
builds occupation semantics DAILY; the relation-layer gap could close any day ⇒ standing
clock, §5.5), `HarmonicOscillator/NumberOperator.lean` (§6, CCR commutation precedent);
(c) a tauceti-collision note: LadderSystem's gl(d)-Lie-submodule occupation story is the
bosonic sibling of tauceti's gl n CAR/Kostant stack (exterior/fermionic) — two parallel
developments, neither cites the other; any "first occupation-semantics layer" phrasing is
dead, occupation-PAIR semantics with the ε-cocycle remain unclaimed.
Fold-vs-77 verdict: distinct source (article 52's axioms vs tauceti's CAR algebra) and
distinct target (`CrAnFieldOp` vs OAI Laughlin matrices); 77's C+ remainder does not
absorb it.

**(2) Dossier 74 (surprisal-moment ceilings, carried) — NO KILL; three nearest-miss rows
added to its Novelty check (rows f–h, this date).** Summary: the entropy OBJECT layer now
exists on physlib (`QuantumInfo/Entropy/VonNeumann.lean`: `Sᵥₙ` over `MState d`,
`Sᵥₙ_eq_trace_cfc_negMulLog`, `Sᵥₙ_le_log_d`, pure-zero, relabel/SWAP/assoc invariances)
— 74 must say "mathlib-absent", never "Lean-ecosystem-absent", for the entropy object;
`sandwichedRelRentropy`/`sandwichedTraceFunctional` (DPI.lean, with Frank–Lieb
convexity notes) is the nearest trace-power functional family — MUST-CITE if `m_u` is
ever phrased as trace functionals; `SSA.lean` (isometry machinery toward SSA, PosDef
states) and `States/Entanglement.lean` (convex-roof constructions) adjacent-but-distinct;
`HayataGroup/TraceInequality/` (below) is a proof-engine alternative, not a pre-emption.
NO surprisal moments, ceiling classes, LP forms, or MGF windows anywhere on master.

**(3) tauceti OperatorJensen adjacency — COLLISION NOTE (record; no charter affected
today).** physlib `QuantumInfo/ForMathlib/HayataGroup/TraceInequality/` is a broader,
independent operator-inequality development than tauceti's single compression form:
`JensenOperatorInequality.lean` (numbered chain `theorem_2_5_2_i_all_imp_v`,
`theorem_2_5_2_iv_imp_v`, `CondIAll/CondIVAll` condition classes; plus
`JensenOperatorInequalityIImpIV/IVtoV` steps), `LownerHeinzCore/Theorem`,
`LiebAndoTrace`, `OperatorGeometricMean`, `HilbertSchmidtOperatorSpace`, `BlockDiagonal`,
`GeneralizedPerspectiveFunction`. tauceti's `TauCeti/Analysis/Matrix/OperatorJensen.lean`
(compression Jensen for isometries + operator-concave f; coisometries/contractions not
extracted — survey §2c) is the SMALLER of the two. Any charter that consumes tauceti's
operator-Jensen layer as ecosystem-unique must cite HayataGroup; conversely the wing is a
donor candidate for the SSA-extraction gap on tauceti's side. Same-day note:
physlib's entropy wing (vN family + SSA-in-progress) is AHEAD of tauceti's
`Analysis/Matrix/Entropy.lean` (bipartite subadditivity only) — the survey's §2c
"SSA not stated" gap now has an external fill candidate.

**Lineage correction (supersedes §3.4's trap (b)):** AreaLaw2D's vendored `Physlib`
@ `a50684a1` IS this repository — `axiommath/AreaLaw2D/lake-manifest.json` pins
`url: github.com/leanprover-community/physlib, rev: a50684a1…` [read 2026-11-16]. The
"three distinct Physlibs" note collapses to TWO NAMES, ONE REPO at different revs
(community-master vs the a50684a1 pin AreaLaw2D vendors); the vendored
`QuantumInfo.ForMathlib.*`/`MState` layer and master's `QuantumInfo/` wing are the same
lineage. Downstream: G5a's incompatibility finding ("Physlib a50684a1 not
ff2494ea-compatible") is a statement about THIS repo's old rev vs our mathlib pin — and
master's daily motion means a refresh probe (G10-class) is the only honest way to price
modern consumption.
