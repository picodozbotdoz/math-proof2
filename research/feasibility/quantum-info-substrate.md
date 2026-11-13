# Quantum-info substrate gap map (lane A4) — Phase-3 feasibility input

Companion to `research/bridges/area-law.md` (zone map), `research/pilots/72-prework.md` (pilot-72
import tiers §2.4, inventory §4), `research/feasibility/mathlib-assembly-maps.md` (the model;
same checkout mathlib `ff2494ea`, toolchain `v4.36.0-rc2`, module-era tree). Scope: the
quantum-information object layer that pilot 72 and any AL-zone dossier sit on — partial traces,
entropies, reduced density matrices, Schur–Weyl, QI norms. Effort anchors per the assembly-maps
convention: **S < 1k LoC, M 1–10k, L > 10k**. All file:line citations read this session unless
marked otherwise; negative results carry the recorded searches.

---

## §A What mathlib `ff2494ea` lacks — recorded searches

Searches over `/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4/Mathlib/`:

| # | Object | Search | Verdict |
|---|---|---|---|
| A1 | **Partial trace** | `rg -i 'partial.?trace\|ptrace' Mathlib/` | **ABSENT** — only `Tactic/Linter/FlexibleLinter.lean:126,557` (`simpTrace` tactic tokens, false positives). No `ptrace`, no `traceRight/Left`, no tracing-out of tensor/Kronecker factors. |
| A2 | **Von Neumann / quantum entropy** | `rg -i -l 'von.?neumann'` minus `SetTheory/` | **ABSENT** — remaining hits are unrelated (Sion's theorem, uniform convergence, `Algebra/Star/CHSH.lean` prose). The only "quantum entropies" text in mathlib is the *bibliography* citation of Carlen 2010 at `Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/IntegralRepresentation.lean:51` (already tracked in dossier 01's novelty round). |
| A3 | **Schur–Weyl / Specht / hook formula** | `rg -i 'schur.?weyl\|specht\|weyl.?character\|hook.?length\|hook.?formula'` | **ABSENT** — 0 hits. (Confirms AreaLaw2D's own finding, RefactoringResult.md §3: "none found in Mathlib (no Schur–Weyl, Specht module, Weyl character or hook formula)".) |
| A4 | **Density matrix/operator** | `rg -i 'density.?matrix\|density.?operator'` | **ABSENT** — 0 hits. |
| A5 | **Schmidt decomposition** | `rg -i 'schmidt'` | **ABSENT** — hits are author names (Neukirch–Schmidt–Wingberg, `RepresentationTheory/Homological/ContCohomology/Sha.lean:39,54`) and `GramSchmidt`. |
| A6 | **Shannon entropy `H`** | `rg 'def entropy\|Shannon' Mathlib/InformationTheory/ Mathlib/Probability/` | **ABSENT as a functional** — `Real.binEntropy` (`Analysis/SpecialFunctions/BinaryEntropy.lean:64`) and `negMulLog` (`Analysis/SpecialFunctions/Log/NegMulLog.lean:164`) exist; `Mathlib/InformationTheory/` = Kullback–Leibler (`KLFun`, `KullbackLeibler/{Basic,ChainRule,DataProcessing,KLFun}.lean`) + Coding (`Coding/{Kraft,KraftMcMillan,PrefixFree,UniquelyDecodable}.lean`) + `Hamming.lean`; `Probability/ProbabilityMassFunction/` defines `PMF` with **no entropy attached**. No Shannon `H` on vectors, pmfs, or spectra. |
| A7 | **Trace/nuclear norm, Schatten p-norms (matrix side)** | `rg -i 'trace.?norm\|schatten\|nuclear.?norm' Mathlib/` | **ABSENT** — 0 hits. Frobenius + L2-operator norms exist (`Analysis/Matrix/Normed.lean` scoped `Matrix.Norms.Frobenius`/`.L2Operator`, engine `Analysis/CStarAlgebra/Matrix.lean`); the Schatten ladder between them does not. |

**What exists instead — the substrate the missing layer would sit on [VERIFIED]:**

- **mathlib's lone quantum theorem**: the CHSH/Tsirelson inequalities over ordered *-rings —
  `CHSH_id` (`Algebra/Star/CHSH.lean:105`), `CHSH_inequality_of_comm` (:116),
  `tsirelson_inequality` (:165); header: "implies that quantum mechanics is not a local hidden
  variable theory", stated "purely about ordered \*-algebras", "a strict generalization of the
  usual statement". So mathlib's QI surface is one foundational nonlocality theorem and zero
  states/channels/entropies.
- **Completely positive maps**: `Analysis/CStarAlgebra/CompletelyPositiveMap.lean` (CP maps via
  `CStarMatrix`, docstring :12–22) — the abstract home for conditional expectations
  (`condExpect`-class objects, pilot-72 M2c / AreaLaw2D `PositiveReplacement`).
- **Symmetric tensors**: `LinearAlgebra/TensorPower/Symmetric.lean:53 def SymmetricPower`
  (the `Sym[R] ι M` quotient of `⨂ M`) — the natural habitat Schur–Weyl duality would occupy;
  plus `PiTensorProduct/`, `TensorPower/`, `TensorAlgebra/`.
- Matrix substrate: `LinearAlgebra/Matrix/Kronecker.lean`, `LinearAlgebra/UnitaryGroup.lean`,
  `Analysis/Matrix/Spectrum.lean` (`spectral_theorem` :143, `eigenvalues₀` :60),
  `Analysis/Matrix/PosDef.lean` + `Analysis/Matrix/Order.lean` (Loewner),
  `Analysis/Matrix/HermitianFunctionalCalculus.lean` (CFC — the von-Neumann-entropy engine),
  `Matrix.rank` (`LinearAlgebra/Matrix/Rank.lean`).

**Conclusion.** The gap is not substrate (CP maps, symmetric powers, CFC, Loewner, Kronecker all
present) but the **object layer**: no partial trace, no density matrix, no spectral entropy
functional, no Schur–Weyl, no Schatten ladder. Every AL-zone statement (area law, purity
certificate, RDM bounds) must vendor or import this layer from the corpora below.

---

## §B Where each missing piece exists (donor map)

### B.1 Physlib (`leanprover-community/physlib` @ `a50684a1`) — the ecosystem's QI library, NOT a sibling

Fourth-party (not in `/home/doz/zcode-workdir/`); pinned by AreaLaw2D's lakefile; **its own
toolchain pin is `v4.33.0`** [VERIFIED via raw.githubusercontent fetch of its `lean-toolchain` at
that rev] — two minor versions behind our `ff2494ea`/v4.36.0-rc2 pin. Contents, as consumed and
cited by AreaLaw2D (via import lines + RefactoringResult.md §3 replacements table — the only
local window onto Physlib): classical Shannon `H` (`QuantumInfo.ClassicalInfo.Entropy`,
imported at AreaLaw2D `QuantumInfo/ClassicalInfo/Entropy.lean:4`), von Neumann entropy `Sᵥₙ` with
strong subadditivity (`Sᵥₙ_strong_subadditivity`, consumed at `Region/Region.lean:180`),
Araki–Lieb (`Sᵥₙ_triangle_subaddivity` → AreaLaw2D `abs_regionEntropy_sub_regionEntropy_le`,
`Entropy/Subadditivity.lean:58`), pure-complement, `qMutualInfo`/`qConditionalEnt`/`TrDistance`
(§10 of the paper's proofs), bipartite partial traces `traceRight`/`traceLeft`,
`PosSemidef.traceRight`, `trace_mul_kron_one_right`, `HermitianMat.{PosPart,NegPart,Proj,Inner}`,
matrix trace norm (`Matrix.traceNorm_Hermitian_eq_sum_abs_eigenvalues`,
`traceNorm_conjTranspose`), SVD-of-sqrt (`Matrix.exists_svd_sqrt_eigenvalues`),
`Matrix.IsHermitian.eigenvalues_eq_of_unitary_similarity_diagonal`. Physlib's ℂ-only, normalized-
states conventions are the reason AreaLaw2D's entropy-inequality layer is ℂ-only
(RefactoringResult §2, decision 1).

### B.2 AreaLaw2D region layer (`AreaLawForMathlib/QuantumInfo/`) — the direct donor, Apache-2.0

`Region/Basic.lean` (211 LoC, **Mathlib-only imports** :1–4): `Reg` :20, `glue` :29, `glueEquiv`
:86 — the dependent product over a Finset of sites; this file is Physlib-free. `Region/
PartialTrace.lean`: `ptrace` :25 (5-line def) — but imports Physlib (`QuantumInfo.ForMathlib.
Matrix` :3) for its positivity/trace lemmas. `Region/State.lean`: `SubState` :28, `MState` :37,
`restrict` :48, `entropy` :69, `entropy_eq_H` :75, `eigenvalues_le_one` :84,
`regionEntropy` :198, `mutualInfo` :203. `Entropy/VonNeumann.lean`: `trace_cfc` :25 (the
trace-spectrum bridge mathlib lacks), `vonNeumann` :26, `vonNeumann_eq_H` :31 — but `H` itself
arrives from Physlib (B.1). `Region/TraceDistance.lean`: `D₁` :145 (Physlib-heavy imports :2–4).
`Entropy/Subadditivity.lean:25–74` (ℂ-only, via Physlib). License: Apache 2.0 (`LICENSE`,
"oai-arealaw", Copyright 2026 Axiom Math); region-layer provenance partly third-party
(LionSR/QICLean, Apache — `Region/State.lean:13–14` header + `NOTICE`).

### B.3 AreaLaw2D Schur–Weyl library (`AreaLawForMathlib/RepresentationTheory/SchurWeyl/` + `PermutationRepresentation.lean`)

**49 files, 10,678 LoC** [VERIFIED: ls + wc]. Full module list: Alternant, Branching,
BranchingPieri, BranchProbability, Casimir, CentralLabelFunction, CoherentMeasure,
CoherentResolution, ColumnAntisymmetrizer, CommutantDimension, CopySplit, ExteriorPieri,
GroupedCopies, HermitianCfcSpectral, HighestWeight, HookDimension, **HookFormula**, HookRecursion,
HusimiIdentity, IrrepLabelCount, IsotypicDimension, JointIsotypic, JointResolution,
JucysRecursion, LabelObservableCalculus, MergeDimensions, MergeMoment, OrthogonalResolution,
PartitionCount, ProductVectorMarginal, RegularTrace, SchurLabelCommutation, SchurLabelEstimates,
SchurWeylCommutant, SchurWeylLabels, SchurWeylLift, SiteOp, SplitCopies, StarOperator,
SubsystemTransport, TensorPowerAction, TensorPowerRpow, TrivialLabel, UnitaryCommutant,
**UnitaryHaar**, UnitaryTwirl, WeylCharacter, WeylDimension, WeylRecursion. Entry points
[VERIFIED]: `IrrepLabel` (`PermutationRepresentation.lean:187`, Wedderburn labels of `ℂ[G]`),
`IrrepLabel.dim_eq_one` (:562), `fixSum_eq_sum` / `fixSum_mul_centralIdem` (WeylDimension.lean:32,
:36), **`multiplicity_eq_weylFormula`** (WeylDimension.lean:73 — the dimension formula),
`copyPerm` / `subsystemPerm` (TensorPowerAction.lean:30, :47 — the replica machinery's group
action). Note for the linalg bridge (§3 Q4 there: "no random-matrix content anywhere"):
`UnitaryHaar`/`UnitaryTwirl` are the *deterministic* twirl calculus (Haar *averaging identities*
for the commutant), not an ensemble theory — the RMT absence finding stands. Provenance:
"ported unchanged… Apache/QICLean provenance headers kept (licence)" (RefactoringResult §3,
Schur-Weyl row) — dual-lineage Apache.

### B.4 openai-math family 265 — the vendorable-for-free side (prework §4, spelled out)

`lean/OAI/MathematicalPhysics/PEPSFilters/Basic.lean:10–147` defines the entire grid-Hamiltonian
preamble (`Vertex` :12 … `UniformAreaLaw` :135, inventory in prework §2.1) importing **only
`Mathlib`** (:1). **What vendoring means here, exactly:**
- **License**: openai-math is Apache 2.0 (`/home/doz/zcode-workdir/openai-math/LICENSE`) —
  same license as this repo's donors; copying with attribution is permitted; keep the namespace
  `PolynomialPEPS.PinnedEntropy` verbatim so statement identity with their project is checkable.
- **Path**: single file; vendor as one file into the pilot stage (or re-transcribe the ≈150 LoC
  preamble). No transitive deps beyond Mathlib.
- **Toolchain deltas**: the openai-math *project* pins `v4.34.1` (`lean/lean-toolchain`)
  [VERIFIED], but `Basic.lean` is definition-level over stable Mathlib API (matrices, Finset,
  EuclideanSpace, `Matrix.toEuclideanCLM`) — expected statement-port cost ≈ 0 on our v4.36 pin
  per the corpus-wide probe finding (FEASIBILITY-SUMMARY; A7's G5c confirms at elaboration).
  If the CLM-norm route is used, also vendor `asMap_norm` from `PEPSFilters/PinnedEntropy.lean`
  (~5 LoC proof over `StarAlgEquiv.norm_map`).
- Reference-only beyond that (NOT vendored): `PEPSMove/`, `PEPSSubvolume/` (entropy-moment
  machinery — `EntropyMoments.lean`, `FilterEntropy.lean`, `PureEntropy.lean`), `TensorNetwork/`.

### B.5 tauceti — the norm ladder QI statements need, no quantum objects

`TauCeti/Analysis/InnerProductSpace/UnitarilyInvariantSeminorm/`: `Schatten.lean`
(`schatten` :75, `schatten_apply_of_ne_top` :81, **`schatten_one : schatten 1 = nuclear`** :112 —
the nuclear/trace norm mathlib lacks, at LinearMap level), `Frobenius.lean`
(`frobenius_inner_eq_trace_conjTranspose_mul` :106), `KyFan.lean`, `OpNorm.lean`, `Projection.lean`.
Negative: no entropy, no partial trace, no density-matrix content (`rg -i 'entropy|partial.?trace'
TauCeti/` → Temperley-Lieb/knot + matrix-scaling false positives only). tauceti is therefore the
donor for the *norm* half of any QI statement (purity/Schatten duality) and nothing else.

### B.6 zeta23 / main-run — nothing quantum

`rg` negative for all A1–A7 objects; the relevant main-run donor is the matrix-inertia
certificate layer already mapped in `mathlib-assembly-maps.md` §C (`posIndex`, Sylvester,
rank–trace) — cross-reference, not duplicated here.

---

## §C Per-item port-cost table (onto our pin; tiers per prework §2.4)

| Item | Best donor | Cost | Caveats |
|---|---|---|---|
| `Reg`/`glue`/`glueEquiv` region skeleton | AreaLaw2D `Region/Basic.lean` (211 LoC, Mathlib-only) | **S** (≈0.2k; near-verbatim) | none — no Physlib, no drift |
| `ptrace` def + facts | AreaLaw2D `PartialTrace.lean:25` def; facts re-provable (`posSemidef_ptrace`, `trace_ptrace`, `ptrace_ptrace`, dual-to-`extendId`) | **S** (≈0.3–0.5k: def is 5 lines; the four facts ≈ 300 LoC re-proofs without Physlib) | their proofs lean on Physlib (`QuantumInfo.ForMathlib.Matrix` :3) — tier-C re-proof or G5a import |
| von Neumann entropy + elementary bounds | AreaLaw2D `VonNeumann.lean` (`trace_cfc` :25, `vonNeumann` :26, `vonNeumann_eq_H` :31) + State.lean bounds (:75–90) | **S** (≈0.3k) | needs a native Shannon `H` (mathlib A6 gap) — define over `negMulLog` sums ≈ 50 LoC; or import Physlib's (G5a) |
| SSA / Araki–Lieb / continuity layer | Physlib (B.1), or AreaLaw2D `Subadditivity.lean` re-derivations | **M–L, NOT recommended** | the theorems are Physlib's core IP; re-deriving SSA in Lean is L-grade mathematics; pilot 72 needs none of it (statements only reference entropy, not its inequalities) |
| `pureState`/RDM/`coefficientMatrix` | AreaLaw2D `Statements.lean:191` + openai `Basic.lean:115,119` | **S** (≈0.2k; the ptrace-Gram identity is pilot-72 M1's L1, ≈0.2k of the pilot) | conventions (inner-product conjugation sides) per prework §5 R2 |
| Schur–Weyl basics (`IrrepLabel`, central idempotents, `multiplicity_eq_weylFormula`) | AreaLaw2D `PermutationRepresentation.lean` (578 LoC) + `SchurWeylLabels.lean` + `WeylDimension.lean` | **M** (≈1.5–2k rebased onto mathlib `RepresentationTheory/` + `SymmetricPower`) | dual Apache lineage (B.3); v4.33-era proof tactics may churn (axbump precedent: 2 build FAILs in zeta repos, `feasibility/axiommath-bump/logs/run1.log`) |
| Full Schur–Weyl library (49 files) | AreaLaw2D `SchurWeyl/` | **L** (10.7k LoC) | only needed by a replica/AL-EZ4 dossier, not by pilot 72 |
| Schatten/nuclear norms (matrix level) | tauceti `Schatten.lean` (LinearMap level) | **S–M** (matrix↔LinearMap transport ≈ 0.5–1k; cf. dossier 03's transport experience) | competes with Physlib's matrix-level `Matrix.traceNorm` — coordination question, see §E |
| CHSH/QI foundations | already in mathlib (CHSH.lean) | 0 | no action |

**Toolchain caveats, consolidated:** (i) Physlib pins `v4.33.0` [verified B.1] — elaborating it
against `ff2494ea` is exactly G5a's question, unmeasured (Physlib is not among the corpora the
FEASIBILITY-SUMMARY statement-port-cost≈0 finding covered); (ii) AreaLaw2D's lakefile pins our
exact rev but its manifest is stale (`db584cd6`, bridges §0.1) — resolve mathlib explicitly, do
not trust the donor manifest; (iii) openai-math project pins v4.34.1 — vendoring sidesteps it
(B.4).

---

## §D Pilot-72 gating matrix

| Pilot-72 need | Tier C (transcribe, default) | Tier B (import AreaLaw2D statements) | Tier A (import theorem) |
|---|---|---|---|
| openai preamble (Basic.lean) | vendored (S, always) | vendored (unchanged) | vendored |
| `Reg`/`ptrace`/entropy defs | transcribed ≈0.35k (S) | imported via `OpenAI.Statements` | idem |
| Physlib | **not needed** | **needed — G5a gates** (`QuantumInfo.ClassicalInfo.Entropy` + `QuantumInfo.ForMathlib.Matrix` transitively, via `ClassicalInfo/Entropy.lean:4` and `PartialTrace.lean:3`) | needed + full donor build |
| `AreaLaw.areaLaw` proof | Prop binder (`hAreaLaw`) | Prop binder over imported statement | discharged by theorem |
| AreaLaw2D full build (SchurWeyl 10.7k + Physlib + lintall) | not needed | not needed (statements only) | needed; donor build health unprobed (R6, prework §5) |
| Pilot-01 machinery (M2) | in-repo, no quantum layer at all — M2a/M2b are pure matrix algebra | idem | idem |

Reading: **no §A gap is pilot-blocking at Tier C** — the entire quantum layer pilot 72 touches
reduces to ≈0.35k LoC of transcribable definitions plus pilot-01. G5a upgrades provenance only.
The genuinely expensive items (Schur–Weyl library, SSA layer) gate *other* potential dossiers
(AL-EZ4 replica work; any conditional-entropy continuity statement), not pilot 72.

---

## §E mathlib-PR candidates (record-only)

This project does not do upstream PRs (ground rules; feasibility summary records candidates for
the ecosystem). Ranked by mathlib-readiness:

1. **Hermitian-matrix von Neumann entropy** — donor AreaLaw2D `Entropy/VonNeumann.lean`
   (`trace_cfc`, `vonNeumann`, `vonNeumann_eq_H`, ≈100 LoC core) + the elementary bounds
   (`ClassicalInfo/Entropy.lean:84` `entropy_nonneg`, `eigenvalues_le_one`,
   `entropy_le_log_card` State.lean:160). The file's own header pattern is "Extends
   `Mathlib/Analysis/Matrix/HermitianFunctionalCalculus.lean`". Blocker to resolve first: a
   native Shannon `H` (§A6) — itself a small candidate (`PMF` exists, entropy does not).
   License: Apache (AxiomMath/QICLean lineage — attribution per NOTICE).
2. **Bipartite partial trace for matrices** — donor AreaLaw2D `Region/PartialTrace.lean:25`
   (region-generic) or Physlib `traceRight/traceLeft` (Kronecker-factor). Coordination hazard:
   Physlib is the community's designated QI home; a mathlib PR should either come *from* Physlib
   or be coordinated to avoid divergence — record, don't push.
3. **Schur–Weyl basics / hook-length formula** — donor `SchurWeyl/{HookFormula,PartitionCount,
   WeylDimension}.lean`; mathlib has the `SymmetricPower` substrate (§A) and zero symmetric-group
   irrep content (§A3). M-size PR; the hook formula alone is a well-scoped first tranche.
4. **Matrix trace norm / Schatten-1** — three-way overlap (tauceti LinearMap-level `nuclear`,
   Physlib `Matrix.traceNorm`, mathlib nothing); ecosystem-coordination item, listed for the
   feasibility summary's "duplicate effort" watch-list.

---

## §F physlib (leanprover-community) cross-reference — first-contact record (2026-11-14)

Prompted by A5's survey `research/novelty/physlib-surface.md` §4(ii): the fresh corpus
`leanprover-community/physlib` (HEPLean successor, toolchain `v4.35.0`, pushed daily)
has **no quantum-information surface at all** — no entropy, no density matrices, no
partial trace; `Mathematics/` is bare of them at directory level (physlib-surface §2);
`CondensedMatter`/`LatticeQFT` are stubs (§2, §3.3). This section records the contact
facts for iteration 4; it is not a survey.

**Name disambiguation (binding — physlib-surface §3.4):** three "Physlib"s exist in our
record. This map's §B.1/§C/§E "Physlib" is the **vendored `Physlib` package inside
AxiomMath/AreaLaw2D** (`QuantumInfo.*`, pin `v4.33.0`) — a DIFFERENT project from
`leanprover-community/physlib` (`v4.35.0`, QFT/perturbation-theory focus). Nothing in
§B/§D changes meaning; every iteration-4 note must say which one it means. Side datum:
the community physlib being QI-empty means the vendored layer (§B.1) is the only
Physlib-named QI content in the ecosystem — whether the community library *intends* a
QI wing is unknown (open question, one line in any charter that touches this).

**What our substrate offers that physlib (community) lacks** — i.e., the ready outward-
donation surface, per this map plus what has landed since §A–§E were written:
- The tier-C **QI object layer** this map priced at ≈0.35k LoC (§C rows 1–2, §D): `Reg`/
  `glue` region skeleton, `ptrace` + facts, `pureState`/RDM/`coefficientMatrix`,
  von-Neumann-entropy-via-CFC (`trace_cfc` route, §B.2) — all Mathlib-only-rebasable.
- **Landed, kernel-verified entropy statements with zero quantum imports**: pilot-72
  P4.5 `research/pilots/72/C-neg.lean` (GREEN, triad-only) proves Rényi anti-monotonicity
  `renyi_antiMono`, the support/rank bridges `renyi_le_log_card`/`renyi_le_log_rank`
  (eigenvalues of PSD Hermitian ↔ `Matrix.rank` via mathlib `Spectrum.lean`), and the
  α<1 area-law no-go gates — spectral entropy as pure finite algebra (the §A6 `H`-gap
  route that avoids the vendored-Physlib dependency entirely). Pilot-01's inertia layer
  (`posIndex`, purity = Frobenius energy) is the adjacent proved machinery.
- The consumers that would give the donation a theorem to carry: openai `Basic.lean`
  grid preamble + `EntropyMoments.lean` moment calculus (§B.4), AreaLaw2D `MarginalTails`.

**First-contact bridge candidates for iteration 4 (two, tightly scoped):**
1. **Spectral-entropy layer for physlib's `QuantumMechanics`/`HilbertSpaces` wing.**
   physlib's QM wing is single-particle/qubit-scale with thin tensor infrastructure
   (physlib-surface §2); our C-neg layer states and proves entanglement-entropy facts
   over probability vectors and Hermitian spectra with no physics API. Bridge shape:
   re-instantiate `renyi`/`renyi_le_log_rank` over physlib's finite-dimensional
   Hilbert-space tensors (eigenvalues are pin-stable mathlib objects on both sides) —
   giving physlib its first entropy statements while stress-testing C-neg's tier-C
   independence claim against a foreign substrate. Pointers: this map §A/§C rows 2–4;
   `pilots/72/C-neg.lean` + `pilots/72/logs/run8-final.log`; physlib-surface §2, §4(ii),
   §5.1 (pin probe first — v4.35→v4.36 statement-port ≈ 0 expected).
2. **The ptrace/RDM interface package aimed outward** — the §C row-2/§D tier-C tranche
   (`Reg`/`glue`, `ptrace` def + four facts, `pureState`/RDM) restated over physlib's
   `HilbertSpaces/TensorProducts` instead of AreaLaw2D's region sets: the pilot-72-M1
   L1 (ptrace-Gram identity, 72-prework §2.3) is the load-bearing new lemma and is
   donor-agnostic. This is the 71/73 dictionary pattern aimed at a live external corpus
   — the same shape A5 ranked as physlib-surface §4's sharpest zone (i) for article 52's
   relation layer, here for the QI object layer (their zone (ii)). Pointers: this map
   §B.2/§C/§D; `pilots/72-prework.md` §2.3–2.4; physlib-surface §4(ii).

Collision status: none — A5 §3.2/§3.3 record NO physlib content touching 72/74-family
objects, so both bridges are first-contact by construction (clocks clean at 2026-11-14).
Gate before any execution: the physlib-surface §5 probe list (pin elaboration first).

---

## Method note

Same tools/rules as `mathlib-assembly-maps.md`: rg/grep + targeted region reads over the encore
checkout (`ff2494ea`); donor citations re-verified this session at the cited lines; Physlib
contents cited *through* AreaLaw2D's imports and RefactoringResult (Physlib not cloned locally);
its toolchain verified by fetching its `lean-toolchain` at the pinned rev from GitHub.
Importer/negative claims carry the recorded searches (§A). Cross-refs: prework §2.4/§4 (tiers,
inventory), bridges/area-law.md §0.1 (pin reality), assembly-maps §C (inertia donation,
disjoint), axiommath-bump logs (donor build precedent).
