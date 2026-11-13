# Phase 2 bridge map — AREA LAW / ENTANGLEMENT-ENTROPY cluster (lane A4, Cycle 2)

Corpora (all read-only):
**AreaLaw2D** `/home/doz/zcode-workdir/axiommath/AreaLaw2D` (AxiomMath's formalization of openai-math
family 265, *A two-dimensional area law from a global spectral gap*), **openai-math**
`/home/doz/zcode-workdir/openai-math` (family 265's two preprints + its own PEPS Lean development),
**main-run linalg cluster** (zeta23 `RHLinalg` + the PROVED pilot-01 machinery in this repo), **tauceti**
(`/home/doz/zcode-workdir/tauceti`), **mathlib** (`/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4`,
`ff2494ea`, v4.36.0-rc2). Lean declarations cited as `file:line`; every claim below was checked by
reading the cited lines. Markers: **[VERIFIED]** = read and confirmed in source; **[HYPOTHESIS]** =
proposed, not present in any corpus (novelty vs literature argued, flagged for the novelty lane).
Companion dossiers: `research/candidates/01-ez1-inertial-defect-master-identity.md` (Theorem A
PROVED, kernel-verified), `02-ez5-bandwidth-k-ceiling-laws.md`, `03-ez3-compression-rank-trace.md`;
bridge map `research/bridges/linear-algebra.md` (zones EZ1–EZ6).

---

## §0 Cluster snapshot

### 0.1 Toolchain reality (overrides AGENTS.md's "v4.33.0" note)

AreaLaw2D HEAD is `c0f6d96` "Pin toolchain v4.36.0-rc2 and mathlib ff2494ea (cross-math-fronttier
pin)" on top of `7768136` (the v4.33.0 merge AGENTS.md records) [VERIFIED: `git log`; `lean-toolchain`
= `leanprover/lean4:v4.36.0-rc2`; `lakefile.toml [[require]] mathlib rev =
ff2494ea5e438f8a8452db803068acd711fa0059`]. The README's "Lean v4.33.0, Mathlib v4.33.0" is stale.
Two caveats for consumption:

- `lake-manifest.json` still resolves mathlib at `db584cd6…`, not `ff2494ea` [VERIFIED: manifest
  parse] — the manifest predates the re-pin; a donor build needs a manifest refresh on their side,
  and our probes should trust the lakefile, not the manifest.
- AreaLaw2D additionally requires **Physlib** (`leanprover-community/physlib` @ `a50684a1`)
  [VERIFIED: lakefile + manifest]. Physlib is NOT among the sibling checkouts, and the region layer
  imports it directly (`AreaLawForMathlib/QuantumInfo/Region/PartialTrace.lean:3` imports
  `QuantumInfo.ForMathlib.Matrix`; SSA/Araki–Lieb come through `Region/Physlib.lean:67`). So
  "same mathlib pin" does not mean "importable for free": staging Physlib is the extra cost item
  (lane A7; see §6).

### 0.2 What IS proved in AreaLaw2D

Statement layer frozen in `OpenAI/Statements.lean` (imports only Mathlib, Physlib,
AreaLawForMathlib); every paper result is a `def … : Prop` proved elsewhere; no `sorry` outside
`Challenge/`; every audited proof depends only on `propext, Classical.choice, Quot.sound`
[VERIFIED: README + `OpenAI/Audit.lean:22–38`].

| Paper result | Statement (def) | Proof (theorem) |
|---|---|---|
| Thm 1.1 area law | `OpenAI.AreaLaw` (Statements.lean:202) | `AreaLaw.areaLaw` (Transfer.lean:361; RCLike-generic, `1 ≤ q`, `0 < J`, `0 < Δ`) |
| Cor 1.2 vertex forms | `OpenAI.AreaLawCorollary` (:228), `VertexAreaLaw` (:214) | `areaLawCorollary` (Transfer.lean:367) |
| Lemma 2.1 conditional-entropy continuity | `ConditionalContinuity` (:436) | `conditionalContinuity` (Transfer.lean, audit :31) |
| Lemma 3.1 marginal tails | `MarginalTails` (:469) | `marginalTails` (Transfer.lean:228) |
| Lemma 3.2 buffer discount | `BufferDiscount` (:514) | `bufferDiscount` (audit :32) |
| Prop 3.3 initial box estimate | `InitialBoxEstimate` (:539) | `initialBoxEstimate` (audit :33) |
| Prop 4.3 positive replacement | `PositiveReplacement` (:259) | `positiveReplacement` (Transfer.lean:136) |
| Prop 9.6 collar bound | `CollarBound` (:323) | `Scanner.prop_9_6`, `collarBound_of_complex` (audit :26–27) |
| Prop 10.2 amplification | `Amplification` (:355) | `amplification` (audit :28) |
| Lemma 11.1 two-family cancellation | `TwoFamilyCancellation` (:388) | `twoFamilyCancellation` (Transfer.lean:316; arbitrary site type) |
| Prop 11.2 two-family decomposition | `TwoFamilyDecomposition` (:410) | `Geometry.prop_11_2` (audit :30) |
| 3D cylinder corollary | `OpenAI.cylinderAreaLaw3D` | `OpenAI/Cylinder3D.lean` (audit :37–38) |

**Exact shape of the main theorem [VERIFIED, Statements.lean:202–209].** For fixed `q R : ℕ`,
`J Δ : ℝ`, `∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ)`, every interaction `Φ` with `IsAdmissible Λ R J Φ`
(:179 — each term Hermitian, `‖Φ X‖ ≤ J` in the L2 operator norm `Matrix.Norms.L2Operator`, support
vanishing off nonempty sets of `d_Λ`-diameter ≤ `R`), every normalized eigenvector `Ω`
(`hamiltonian Λ Φ *ᵥ Ω = E₀ • Ω`) with `HasGlobalGap (hamiltonian Λ Φ) Ω E₀ Δ`, every `A ⊆ Λ`:
`(pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary Λ A).card`. Hypotheses on the whole
Hamiltonian only — "no gap assumption is imposed on Hamiltonians restricted to smaller regions"
(paper §1.1; Statements.lean docstring).

**The gap [VERIFIED, Statements.lean:185–187].** `HasGlobalGap H Ω E₀ Δ : (Δ : 𝕜) • (1 −
vecMulVec Ω (star Ω)) ≤ H − (E₀ : 𝕜) • 1` — a Loewner-order inequality (mathlib `MatrixOrder`).
Entropy in nats (`regionEntropy` = `Arealaw.vonNeumann`, `Real.log`; Statements.lean:55–57).
Proof over `ℂ`, transferred to any `RCLike` field in `AreaLaw/Transfer.lean` [VERIFIED].

**Region layer (the mathlib-donation surface) [VERIFIED].** `AreaLawForMathlib/QuantumInfo/`:
`Reg`/`ptrace` (PartialTrace.lean:25 — partial trace over `T \ S`), `SubState`/`MState`
(State.lean:28,37 — PSD, trace ≤ 1 / = 1), `SubState.entropy = vonNeumann` (State.lean:69),
`entropy_eq_H` (:75 — entropy = Shannon `H` of the eigenvalue list), `eigenvalues_le_one` (:84),
`regionEntropy` (:198), `mutualInfo` (:203), `entropy_le_log_card` (:160),
`sum_eigenvalues_eq_one` (:164); `vonNeumann` (VonNeumann.lean:26) with `vonNeumann_eq_H`
(:31) and the trace-spectrum bridge `trace_cfc` (:25); trace distance `D₁`
(TraceDistance.lean:145); subadditivity/Araki–Lieb/SSA (`Entropy/Subadditivity.lean:45,52,58`;
`Region.lean:180 regionEntropy_strong_subadditivity`, via Physlib, ℂ-only). mathlib has **none**
of this: `rg -i 'von.?neumann|quantum.?entropy' Mathlib/` → only set-theory VonNeumann universes;
no partial trace, no density matrix, no `Mathlib/Information/`; tauceti likewise (its
Temperley-Lieb hits are knot theory). mathlib's sole entropy objects are `Real.binEntropy`
(`Analysis/SpecialFunctions/BinaryEntropy.lean`, used by ConditionalContinuity) and the
`H` machinery AreaLaw2D itself supplies in `QuantumInfo/ClassicalInfo/Entropy.lean`.

**The replica layer [VERIFIED].** §6's `k`-copy machinery runs on Wedderburn labels
`IrrepLabel (Equiv.Perm (Fin k))` of `ℂ[S_k]` (`AreaLaw/S06_Replicas/Setup.lean:73`), backed by a
Schur–Weyl library `AreaLawForMathlib/RepresentationTheory/SchurWeyl/` (49 files, 10,678 LoC:
Alternant, Branching, BranchingPieri, CommutantDimension, HighestWeight, WeylDimension, …) whose
content mathlib lacks entirely [VERIFIED: RefactoringResult.md §3 "none found in Mathlib (no
Schur–Weyl, Specht module, Weyl character or hook formula)"].

### 0.3 Family 265 on the openai-math side: two papers, one Lean interface

- **Area-law paper**: `preprints/A-two-dimensional-area-law-from-a-global-spectral-gap-September-24-2026/`
  (paper.pdf + build/sections/*.tex; 1 theorem, 1 corollary, 10 propositions, 24 lemmas; digest
  anchors D1.4–D11.26 in AreaLaw2D `digest/00-overview.md` [VERIFIED]). AreaLaw2D formalizes THIS
  paper faithfully clause-by-clause (`docs/StatementAudit.md`; Map.md, 238 anchors).
- **PEPS companion**: `preprints/Polynomial-PEPS-approximation-of-gapped-square-grid-ground-states-September-24-2026/`
  — same gap hypothesis (its eq. (global-gap) = ours), open `L×L` squares, `R = 1`; main theorem:
  PEPS with bond dimension ≤ `C·L^c` and global vector error ≤ `L⁻¹` (thm:main,
  00-introduction.tex). Its appendix `08-companion-interface.tex` consumes the area-law paper's
  PositiveReplacement, CollarBound, Amplification, TwoFamilyCancellation/Decomposition **as black
  boxes on the original ground state** [VERIFIED: full read].
- **openai-math's own Lean for the PEPS side** [VERIFIED]:
  `lean/OAI/MathematicalPhysics/PEPSFilters/Basic.lean` (namespace `PolynomialPEPS.PinnedEntropy`)
  defines `FullSystemGap` (:74 — the same Loewner gap in inner-product form), `contractPEPS`
  (:83), `HasPEPSApproximation Ω C c` (:88), `MainStatement` (:97 — the PEPS theorem),
  `coefficientMatrix` (:115), `reducedDensity Ω A := coefficientMatrix * conjTranspose coefficientMatrix`
  (:119 — **the Gram/W Wᴴ form**), `vonNeumannEntropy` (:127 = Σ negMulLog of RDM eigenvalues),
  `boundaryCard` (:130), and **`UniformAreaLaw` (:135): the area law stated as an unproved
  hypothesis** consumed by `MainStatement`'s chain (also consumed in `PEPSMove/GridStates.lean`).
  Sibling directories `PEPSMove/`, `PEPSSubvolume/`, `TensorNetwork/` extend it; no `sorry` in
  `PEPSFilters/` [VERIFIED: rg].
- **The comparison in one line**: AreaLaw2D PROVES the area law in the `Arealaw.Reg`/`ptrace`
  encoding over `Finset (ℤ × ℤ)`; openai-math ASSUMES it in a `Vertex L`/`RegionConfiguration`
  encoding over `Fin L × Fin L` grids. **No theorem in either corpus connects the two encodings**
  — the two halves of family 265 do not touch in Lean (see AL-EZ3).

### 0.4 Terminal points of AreaLaw2D (from its own docs [VERIFIED])

`docs/3D/Targets.md` freezes the 3D continuation and names four open problems needing "new
mathematics, not new bookkeeping": **C.1** scanner exponent bookkeeping (`CollarBound3D` — whether
the §9 error table stays under `n^{2−ε}` when rows are surfaces "is a computation that neither the
paper nor the formalization does"); **C.2** first subvolume exponent (`InitialBoxEstimate3D`; the
2D filter argument needs the energy cost E small, in 3D "E grows like D r"); **C.3** amplification
radius exceeds the template (the spectral window `w` must exceed `√(#crossing terms)`; "is the
spectrum of `−log ρ_X` known to concentrate in a window narrower than the square root of the number
of terms crossing the boundary of X?" — B.4's question-for-a-physicist); **C.4** point contacts
(codimension-2 contacts unavoidable in 3D). Also open: the `q`-dependence of `C(q,R,J,Δ)` is never
made explicit (B.1), and the PEPS companion is not formalized in AreaLaw2D at all.

---

## §1 Intersection table — shared objects under different names

| AreaLaw2D object | Main-run linalg counterpart [VERIFIED both sides] | openai-math PEPS counterpart | genuinely shared / absent elsewhere |
|---|---|---|---|
| Local Hamiltonian `H = Σ_X extendId (Φ X)` (Statements.lean:171), one term per support of diameter ≤ R | RHLinalg atom sums `P = Σ_j m_j v_j v_j*` + Hermitian error `Q` (`Pmat m v`, RankTraceMult.lean:220): same "PSD part + indefinite part" decomposition; interaction range R ↔ geometric spread of atom vectors | `Hamiltonian hv he` (site + edge terms, R=1) | the decomposition pattern is shared; nobody states the dictionary |
| **Spectral gap** `Δ(1−\|Ω⟩⟨Ω\|) ≤ H − E₀` (Loewner, :185) | **inertia separation**: `Q := E₀ − H` is Hermitian with `posIndex`-count ≤ 1 at threshold (§2 L1); `HasGlobalGap` ⇔ thresholded-index budget = 1 | `FullSystemGap` (Basic.lean:74, quadratic-form form) | the *identity* gap = inertia budget is present in NEITHER side's words; zeta23's `posIndexAbove` (PosIndex.lean:50) is the right counter |
| Compressed/conditioned observables: `condExpect` (Statements.lean:240, normalized partial trace = unital CP map), `E_{X,l}(k_X)` of Prop 4.3 | RHLinalg compressions `BᴴQB` + `posIndex_conj_le` (Inertia.lean:51; dossier 03a, ported+audited in pilot 01); tauceti operator Jensen for unital CP maps (OperatorJensen.lean:64) | conditional expectation in `PEPSFilters` (nested filters) | conditional expectations studied on both sides, never connected to index budgets |
| Entanglement entropy `regionEntropy = H(eigenvalues ρ_A)` (State.lean:69,75,198) | entropy ≰ anything in zeta23; nearest kin are the **cap/purity functionals**: `Σ_j k_c(p_j) = 2c − tr(ρ²)` when all `p_j ≤ c` (`k_c(x) = 2cx − x²` below the cap, kc_eq RankTraceMult.lean:353); rank bounds via `rank_eq_card_non_zero_eigs` (mathlib Spectrum.lean:202) | `vonNeumannEntropy` = Σ negMulLog (Basic.lean:127) | entropies live only in the two family-265 corpora; Schatten norms only in tauceti (`UnitarilyInvariantSeminorm/Schatten.lean`); no corpus has both |
| Reduced density matrix `ρ_A = ptrace \|Ω⟩⟨Ω\|` | `ρ_A = W Wᴴ` with W the coefficient matrix — **exactly the `Pmat m v = W Wᴴ` shape** Lemma R consumes (atoms = complement configurations) | `reducedDensity Ω A` IS `coefficientMatrix * conjTranspose` (Basic.lean:119) | the ptrace-form and Gram-form of ρ_A are never proven equal across corpora (AL-EZ3's core lemma) |
| Boundary `edgeBoundary/innerBoundary/cutEndpoints` (Statements.lean:135,140,144) | dossier-02 bandwidth-k ceiling classes: boundary = the bandwidth-1 data a certificate may consume; two-family tiles + collar data = higher bandwidth | `boundaryCard` (Basic.lean:130) | "boundary ↔ how much spectral data the proof consumes" is the transport of §2 L5 |
| Surprisal `K = −log p_j`, its MGF and tails (MarginalTails, :469: `log E e^{uK} ≤ uS + 512eϑ𝓑u²`) | moment/count certificates: `cauchySchwarz_count` (Weyl.lean:89) is the 1-moment count analogue; dossier 02 Theorem E's LP representation of k-data ceilings | — | moment-hierarchy ceiling for entropy functionals stated nowhere (AL-EZ2) |
| Replica commutant `ℂ[S_k]`, Schur–Weyl labels `IrrepLabel` (Setup.lean:73; 10.7k-LoC library mathlib lacks) | — | — | tauceti's diagram algebras: `KnotTheory/TemperleyLieb.lean` (Markov trace, Jones rep), `KnotTheory/Jimbo/`; classical limit connects TL to Schur–Weyl commutants — cross-lane with dossier 41 (q-deformed TL) |

**Reading of the table.** The two clusters are near-perfect complements, again: family 265 owns
*entropy objects and gap hypotheses* but no certificate layer (no rank–trace, no index budgeting,
no perturbation bookkeeping); the main-run linalg cluster owns *exact certificate bookkeeping*
(master identity, Lemma R with tightness, inertia pullback) but no entropy, no partial trace, no
notion of gap. mathlib owns the spectral substrate both build on (`eigenvalues₀_antitone`
Spectrum.lean:63, `spectral_theorem` :143, `trace_eq_sum_eigenvalues` :240, L2 operator norm
scoped `Matrix.Norms.L2Operator` via `Analysis/Matrix/Order.lean:316–335`, `Matrix.PosSemidef`,
CFC) and nothing above it.

---

## §2 Lifts and dualities

**L1 — the gap-as-inertia dictionary lemma (cheap, load-bearing, stated nowhere).**
`HasGlobalGap H Ω E₀ Δ` says exactly: the Hermitian `G := E₀ − H` satisfies `G ⪯ 0` with
`ker G = 𝕜Ω` (on `Ω^⊥`, `G ⪯ −Δ·1`), i.e. the
thresholded positive index of `G` at every level `θ ∈ (−Δ, 0]` is **≤ 1, the single counted
direction being `Ω`** (at `θ > 0` the count is trivially 0; the informative window is `(−Δ, 0]`)
[VERIFIED as a mathematical identity from Statements.lean:185–187]. In
`RHLinalg` terms: `posIndexAbove θ (E₀ − H) ≤ 1` for every `θ ∈ (−Δ, 0]` — the exact shape
`weyl_posIndexAbove_le` (Weyl.lean:50) perturbs. Nobody in any corpus writes the gap as an index
budget; once written, dossier 03a (`posIndex_conj_le`, Inertia.lean:51, PROVED in pilot 01's port)
immediately gives: **every compression `Bᴴ(E₀−H)B` inherits the budget 1** — the certificate-layer
counterpart of the paper's design choice "the gap hypothesis concerns the full Hamiltonian; no gap
assumption on restrictions" (Statements.lean docstring; paper §1.1). The paper gets restrictions to
obey *nothing*; the linalg machinery gets restrictions to obey *budget monotonicity*. The two
statements about the same object are complementary halves never composed. **This one lemma is the
door to AL-EZ1.**

**L2 — the master identity meets the reduced density matrix (in-corpus shapes match verbatim).**
Pilot 01's Theorem A (`research/pilots/01/port/09_MasterIdentity.lean:master_identity`) is an exact
five-defect identity for `‖P+Q‖²_F` with `P = W Wᴴ` = atom sum. The RDM of the ground state across
a cut `A` is *exactly* such a `P`: `ρ_A = W_A W_Aᴴ` with `W_A` the coefficient matrix
(openai-math `reducedDensity`, PEPSFilters/Basic.lean:115–119 [VERIFIED]) — atom vectors = the
columns `Ω(·, z)`, atom weights `‖W_{·z}‖²`, `tr ρ_A = ‖Ω‖² = 1`. So Lemma R / the master identity
applies verbatim to `(P, Q) := (ρ_A, Q_A)` for any Hermitian `Q_A` on the region; the output is
`2c(1 + tr Q_A) − ‖ρ_A + Q_A‖²_F ≤ Σ_j k_c(p_j‖v_j‖²) + c²·n₊(Q_A)` with `p_j` the Schmidt
coefficients — a **purity-type functional of the entanglement spectrum**, since
`Σ_j k_c(m_j x_j) → 2c − tr(ρ_A²)` when the spectrum sits below the cap [VERIFIED algebra:
`k_c(x) = 2cx − x²` for `x ≤ c`, RankTraceMult.lean:351–359]. The open content is the choice of
`Q_A` with a *gap-induced* budget: candidates from `PositiveReplacement` (the operators `k_X`,
`0 ≤ k_X ≤ 1`, `k_X Ω = 0`, `Σ k_X ⪰ (Δ/c*)(1−Π_Ω)`, locally approximable at rate `e^{−c l^α}`,
Statements.lean:259–277) or their conditional expectations onto `A` (`condExpect`, :240) — see
AL-EZ1. No corpus combines any of this; the paper's own route to the spectrum of `ρ_A` is the
MGF/tail route (MarginalTails), not a certificate route.

**L3 — effective rank and the two concentration windows.** MarginalTails gives
`P{|K − S| > w} ≤ 2e^{e/2} exp(−w/(32√((1+ϑ)𝓑)))` (Statements.lean:486–489): the surprisal
concentrates in a window `≍ √𝓑`, `𝓑 = 1 + Σ_crossing log²(e dᵢ)` — i.e. the *effective rank* of
`ρ_B` is `e^{S ± w}`. This is the paper's own rank-concentration statement [VERIFIED], and its
window is exactly what 3D Targets B.4/C.3 isolate as the 3D bottleneck ("a window of size
|∂X|^{1/2−δ} would remove the window's contribution to a radius above n" [VERIFIED quote,
Targets.md B.4]). Literature kin: Anshu–Harrow–Soleimanifar, *From communication complexity to an
entanglement spread area law…* (arXiv:2004.15009; Nature Physics 2022) prove a boundary-dependent
**entanglement-spread** area law from the same global-gap hypothesis — the log-width of the
significant spectrum [VERIFIED via arXiv]. So: spread-concentration from a gap is known (AHS),
surprisal-window concentration is known+formalized (MarginalTails); **a certificate/inertia-derived
bound is known nowhere**; and rank or α<1-Rényi versions are *false* in d ≥ 2 (Kuwahara,
arXiv:2610.15199: gapped finite-range Hamiltonians with von-Neumann area law and volume-law Rényi
α<1, plus Schmidt-rank trade-offs for approximate projectors [VERIFIED via arXiv]) — any zone here
must live at α ≥ 1 / effective-rank-with-threshold functionals. AL-EZ1 is positioned accordingly.

**L4 — boundary ↔ bandwidth (dossier 02 transport).** The linalg bridge's L5 (linear-algebra.md
§2) reads PairCeiling as bandwidth-one: a certificate may consume one-atom masses; the ceiling
`B_k` ladder (dossier 02, provable core: stability law + monotonicity + LP weak-duality
representation) measures how much more k-point spectral data buys. The area-law proof has the same
stratification with different names: InitialBoxEstimate consumes only entropy values
(bandwidth 0); CollarBound consumes mutual information across one collar (bandwidth 1 in
separation); Amplification consumes the *full* MarginalTails MGF (all moments — "infinite
bandwidth") but pays with the window `w ≍ √𝓑`; the two-family decomposition allocates data across
scales `n_i`. The transport question — *what is the best decoupling bound provable from k surprisal
moments, and is it an LP?* — is AL-EZ2.

**L5 — replicas ↔ diagram algebras (cross-lane).** `ℂ[S_k]`-Wedderburn labels of §6
(`IrrepLabel (Equiv.Perm (Fin k))`, Setup.lean:73; `BranchProbability`, `CoherentMeasure` in the
SchurWeyl library) and tauceti's `TemperleyLieb R δ n` with its Markov trace
(`KnotTheory/TemperleyLieb.lean:8,21–22`, Jones representation) are two developments of "diagram
algebras acting on tensor powers with dimension-counting labels"; the classical Schur–Weyl
commutant on `(ℂ^q)^{⊗k}` is `ℂ[S_k]`, its q-deformation meets TL — the natural meeting point of
dossier 41 (`41-q-deformed-eight-square-temperley-lieb.md`) and the replica layer. Flagged to the
tensor-algebra lane; one concrete shared object: both need *label-dimension summation identities*
(`WeylDimension.lean` vs TL path counting).

---

## §3 Quantitative transfer zones (evaluated for novelty)

**(a) Bandwidth-k → entropy decay in separation (candidate AL-EZ2).** The question "does dossier
02's ceiling-law machinery transport to a NEW statement about entropy decay in k for gapped 2D
local Hamiltonians?" decomposes:
 - *k = separation distance*: mutual-information decay `I(X : J) ≤ f(dist)` for gapped 2D ground
   states. Not in any corpus [VERIFIED: no MI-decay statement in AreaLaw2D beyond the
   collar/amplification at fixed scale; `rg` in tauceti/mathlib negative]. Literature: nearest kin
   Kastoryano–Eisert (arXiv:1303.6304, MI clustering for *Liouvillian* gaps), Chen–Rouzé
   (arXiv:2504.02208, CMI decay for *Gibbs* states); a general pure-state gapped-2D MI-decay-with-
   separation theorem is not among the area-law paper's cited tools (its history § never states
   one; CollarBound is its substitute). **Plausibly a real gap but physics-delicate — flagged,
   not proposed as the zone's core.**
 - *k = moment order*: the best bound on `S`, `I`, or the effective rank provable from the first k
   moments of the surprisal forms a monotone hierarchy whose fixed-grid values are finite LPs —
   the exact shape of dossier 02 Theorem E (LP weak duality in Lean, its declared unclaimed layer)
   applied to MarginalTails' data instead of near-CUE rows. **This is the novel, provable core of
   AL-EZ2**: a barrier theory for window-based amplification, with C.3 as the named consumer.

**(b) Conditional entropy / trace-defect inequalities bridging RHLinalg certificates to
density-matrix rank bounds (candidate AL-EZ1).** The precise lift question — *can the 01/03
inertial-defect machinery (rank–trace inequality, proved) bound AreaLaw2D-style entropy/area-law
constants; specifically rank concentration of RDMs from spectral-gap-induced inertia separation —
is THAT statement present anywhere?* — was checked directly: **absent from all corpora**
[VERIFIED: AreaLaw2D has no `rank`/`posIndex`/certificate content (`rg -i 'posIndex|rank.?trace|frobSq'`
over AreaLaw2D → 0 relevant hits); openai-math PEPS defines RDMs but proves no spectral bound on
them; mathlib/tauceti have no gap↔index dictionary; zeta23 has the certificates but no
entropy/RDM/partial-trace notion]. Literature: AHS 2022 (spread, different functional), Kuwahara
2610.15199 (α<1 obstruction + projector rank trade-offs), Arad–Kitaev–Landau–Vazirani 2013
(Schmidt-rank growth of approximate projectors — 1D, different mechanism). The certificate-shaped
statement is new; see AL-EZ1.

**(c) The AreaLaw2D repo's own terminal points as zones.** C.1/C.2/C.4 are research-grade open
physics (the repo's honest verdict: "new mathematics, not new bookkeeping") — out of scope for a
Lean pilot; C.3's window question overlaps AL-EZ1/L3 and is cited as motivation. The un-formalized
PEPS companion + the never-composed Lean interface is zone AL-EZ3. The inexplicit `q`-dependence
of `C(q,R,J,Δ)` is a constants-tracking note, not a candidate.

---

## §4 Empty zones — candidate NEW theorems

Ordering: strongest first. Each entry: precise statement, bridge-essentiality, contributing named
results, first proof step, novelty status.

### AL-EZ1. Gap-to-inertia budget lemma + certificate bound on entanglement-spectrum functionals — [HYPOTHESIS]

> **Erratum 2026-11-13 (round-4 §AL constraint, folded into the pilot spec).** The cap-first
> phrasing below is superseded for executable purposes: Kuwahara arXiv:2610.15199 refutes
> Rényi-α<1 area laws (hence rank concentration) in d ≥ 2, so pilot-grade statements are
> restricted to **purity (α=2) / effective-rank framings**; the poly-PEPS representation form is
> the companion preprint's territory and is not claimed. Authoritative executable form:
> `research/pilots/72-prework.md` §3 (purity-energy certificate), dossier 72 (A9).

**Statement (part 1, dictionary — provable now).** For `𝕜 = RCLike`, `H` Hermitian, `Ω` normalized,
`E₀ Δ : ℝ`, `Δ > 0`: `HasGlobalGap H Ω E₀ Δ ↔ ∀ θ ∈ (−Δ, 0], #{i | (E₀ − H).eigenvalues i > θ} ≤ 1 ∧
(the unique eigenvalue above θ, when counted, has eigenvector Ω)` — in `RHLinalg` words,
`posIndexAbove θ (E₀ − H) ≤ 1` on the window `θ ∈ (−Δ, 0]`. Consequently (part 1b, via dossier
03a applied to `G − θ·1`): for EVERY `B` and every `θ ∈ (−Δ, 0]`,
`posIndexAbove θ (Bᴴ(E₀−H)B) ≤ 1`.
**Statement (part 2, the lift — load-bearing hypothesis).** Under the hypotheses of Theorem 1.1
(admissible `H`, gapped unique ground vector `Ω`), for every region `A ⊆ Λ` there is an explicitly
constructible Hermitian `Q_A` on `Reg (Qudits q) A` — candidate: `E_A(Σ_{X crossing A} k_X)`
(compressed/conditioned positive-replacement terms; `condExpect`, Statements.lean:240; `k_X` from
PositiveReplacement :259) — with `n₊(Q_A) ≤ b(∂A)` for a boundary-linear budget `b`, such that the
pilot-01 master identity applied to `(ρ_A, Q_A)` yields, for every `c > 0`:
`2c(1 + tr Q_A) − ‖ρ_A + Q_A‖²_F ≥ Σ_j k_c(p_j) + c²·1 − (defects)` and hence a **boundary-linear
upper bound on the cap/purity functional `Σ_j k_c(p_j)`** (=: a smooth effective-rank of the
entanglement spectrum at scale c).
**Sub-questions:** (a) budget count for conditioned positive contractions: is
`posIndex(E_A(Σ_{X crossing} (c*−k_X)))`-type control boundary-linear? (conditional expectations
are unital positive — they do NOT preserve index in general; the k_X ⪯ (1−Π)-domination
`Σk_X ⪰ (Δ/c*)(1−|Ω⟩⟨Ω|)` is the input that must be exploited); (b) the defect-form refinement:
which of the five pilot-01 defects vanish on ground-state data (Δ₊ = 0 iff `ρ_A Q_{A,+} = 0` —
A2 of dossier 01); (c) converses: does a bound on `Σ k_c(p_j)` for all c recover the MarginalTails
window (relation to AHS spread)?
**Bridge-essentiality.** Requires ALL of: zeta23/pilot-01 certificate machinery (in this repo,
kernel-verified), AreaLaw2D's PositiveReplacement + condExpect (the only supply of local positive
operators dominated by the gap), and mathlib's spectral substrate. The paper's MGF route never
touches inertia; the linalg side never touches entropy; the composition is a genuinely new
statement family.
**Contributing results:** `master_identity` + `rank_trace_mult_k` + `posIndex_conj_le`
(pilot 01, ported donor statements Inertia.lean:51, RankTraceMult.lean:369);
`OpenAI.PositiveReplacement` (Statements.lean:259), `condExpect` (:240), `pureState` (:191),
`MarginalTails` (:469) as the comparison statement; mathlib `Spectrum.lean:63,143,202,240`.
**First proof step.** Prove part 1 in Lean over the ported `posIndexAbove` (one evening of work;
the Loewner-to-eigenvalue transfer is `IsHermitian.eigenvalues` bookkeeping). Then take the
smallest non-trivial instance of part 2: a single term `h_X` crossing the cut, `Q_A :=
E_A(E₀ − h_X)`, and compute the budget by hand — this is the feasibility probe that decides the
zone.
**Novelty.** Absent from all corpora [VERIFIED §3(b)]. Literature: nearest kin AHS 2022
(entanglement spread — log-width, not cap functionals); Kuwahara 2610.15199 **forbids** rank and
α<1-Rényi versions in d ≥ 2 (our functionals are α ≥ 1-type: `Σk_c → 2c − tr ρ²`), and its
projector rank trade-offs are the 1D-style mechanism — no inertia/certificate route in the
literature found. Novelty lane (R8-round-4) should run: `entanglement spectrum` + `inertia` /
`positive index`; `purity` + `area law` + `gap`; citations to 2004.15009 and 2610.15199.

### AL-EZ2. Moment-hierarchy ceilings for surprisal-based decoupling (bandwidth-k transport) — [HYPOTHESIS]

**Statement (programme, mirrors dossier 02's honest core).** Fix the MarginalTails setting
(Hermitian `h_i`, `‖h_i‖ ≤ c₀`, gap `g₀`, marginal `ρ` on `B`, surprisal `K = −log p_j`, entropy
`S`). Define a *k-moment certificate* as `(c₀, a : Fin k → ℝ)` valid at a spectrum if
`c₀ + Σ_{m≤k} a_m E[K^m] ≤ F` for the target functional `F ∈ {S, effective rank at threshold τ,
P(K > w)}`; define `B_k(F) := sup` of certified values over valid certificates. **Claims:**
(a) `B_k` is nondecreasing in k and the MarginalTails MGF bound is a k → ∞ point of the hierarchy;
(b) for finite grid-of-spectra classes, `B_k(F)` is the value of a finite LP (weak duality gives
computable ceilings — the Lean LP-duality layer dossier 02 item 1 declares unclaimed);
(c) specialization: the best decoupling window `w` provable from k moments, `w_k`, satisfies
`w_k → ` the MarginalTails window as `k → ∞`, and `w_1 ≥ (E K − F)²-based` Cauchy–Schwarz count
(the `cauchySchwarz_count` shape, Weyl.lean:89). The named consumer: 3D Targets C.3 — a certified
`w < √(#crossing)` ceiling would quantify exactly what window-based amplification can ever
achieve in any dimension.
**Bridge-essentiality.** zeta23/dossier-02 supplies the certificate-class + LP-duality methodology
(there: near-CUE rows; here: entanglement spectra); AreaLaw2D supplies the only formalized moment
data on those spectra (MarginalTails). Neither alone can even state `B_k(F)`. mathlib
`Convex/Separation` is the shared substrate.
**Contributing results:** `MarginalTails` (Statements.lean:469–489), dossier 02 Theorems A/D/E,
`cauchySchwarz_count` (Weyl.lean:89), mathlib `Analysis/Convex/Separation.lean`.
**First proof step.** (c) alone: from `Σ_j p_j = 1` and `E K = S` derive the 1-moment effective-rank
ceiling by Cauchy–Schwarz (a self-contained Lean lemma over `Arealaw.H`), then compare against
`MarginalTails`'s window — a measurable delta with zero new physics.
**Novelty.** No barrier/ceiling theory for entropy decay exists in any corpus [VERIFIED: rg
'ceiling|bandwidth' in AreaLaw2D/openai-quantum dirs → hits are the paper's collar/amplification,
not classes of proofs]; literature trace (§3(a)) found none (Kastoryano–Eisert is Liouvillian,
Chen–Rouzé Gibbs). R8-round-4: `barrier` + `mutual information` + `gapped`; `moment problem` +
`entanglement spectrum`.

### AL-EZ3. The family-265 interface theorem: discharging openai-math's `UniformAreaLaw` from AreaLaw2D — [HYPOTHESIS as stated; both endpoints [VERIFIED]]

**Statement.** A Lean theorem chain: (i) *ptrace-Gram identity*: for the `L×L` grid,
`ptrace (Finset.subset …) (pureState Ω hΩ).M = reducedDensity Ω A` — the partial-trace RDM equals
the coefficient-matrix Gram matrix (both encodings of `ρ_A`); (ii) *boundary match*:
`(edgeBoundary Λ A).card = boundaryCard A` for the grid instance; (iii) *theorem*:
`AreaLaw.areaLaw ℂ q 1 J Δ` (Transfer.lean:361; `q ≥ 2`, `J,Δ > 0`) implies
`PolynomialPEPS.PinnedEntropy.UniformAreaLaw` (PEPSFilters/Basic.lean:135), which makes
openai-math's `MainStatement` (:97) unconditional modulo its own remaining hypotheses.
**Bridge-essentiality.** The two halves of family 265 are formalized in disjoint encodings by two
corpora (AreaLaw2D proves, openai-math assumes); the paper-level interface
(08-companion-interface.tex) exists, the Lean-level one does not. The bridge lemma (i) is exactly
the `W Wᴴ` = `Pmat` shape of the linalg cluster (§1 row 5) — the same lemma AL-EZ1's part 2 needs.
Honesty note: like dossier 03, this is *corollary-grade* new mathematics (the content is transport),
but with a genuine consumer (every PEPS-side result currently resting on the `UniformAreaLaw`
hypothesis) and it is the first cross-AxiomMath↔openai-math consumable link on our pin.
**Contributing results:** `AreaLaw.areaLaw`, `Arealaw.ptrace` (PartialTrace.lean:25),
`Arealaw.regionEntropy` (State.lean:198), `pureState` (Statements.lean:191);
`PolynomialPEPS.PinnedEntropy.reducedDensity/coefficientMatrix/vonNeumannEntropy/boundaryCard/UniformAreaLaw`
(Basic.lean:115,119,127,130,135); `FullSystemGap ↔ HasGlobalGap` (Basic.lean:74 ↔ Statements.lean:185,
quadratic-form vs Loewner form of the same inequality — mathlib
`l2_opNorm_conjTranspose_mul_self`-adjacent transfer).
**First proof step.** (i): unfold `ptrace` over `Reg` and `coefficientMatrix` over
`RegionConfiguration`; both sides are `Σ_z Ω(x,z) conj (Ω(y,z))` — a reindexing; the eigenspectrum
then coincides, and `regionEntropy = vonNeumannEntropy` by `entropy_eq_H` (State.lean:75).
**Novelty.** Formalization-bridge (no new mathematics); its value is enabling AL-EZ1's shared
encoding and closing family 265's own loop. Not for triage as a standalone discovery; natural
milestone-1 of any AL-EZ1/EZ2 pilot.

### AL-EZ4 (exploratory, cross-lane). Schur–Weyl ↔ Temperley–Lieb label dictionary — [HYPOTHESIS]

A dictionary theorem between `IrrepLabel (Equiv.Perm (Fin k))`-indexed replica observables
(`AreaLawForMathlib/RepresentationTheory/SchurWeyl/`, incl. `WeylDimension`, `BranchProbability`,
`CoherentMeasure`) and tauceti's `TemperleyLieb R δ n` calculus (Markov trace, Jones
representation, `KnotTheory/TemperleyLieb.lean`; `KnotTheory/Jimbo/`), e.g.: the classical
Schur–Weyl commutant of `S_k` on `(ℂ^q)^{⊗k}` evaluated on the TL generators at loop value `q`
(+) the dimension-sum identities both libraries prove separately. Only a zone *seed*: owned
jointly with the tensor-algebra lane (dossier 41); this lane contributes the observation that the
replica layer is the ONLY in-corpus consumer of Schur–Weyl and that mathlib has none of it
(RefactoringResult §3 [VERIFIED]). R8-round-4 query: `Schur-Weyl` + `Temperley-Lieb` +
`Jones-Wenzl projector` + `tensor power`.

---

## §5 Feasibility on our pin (v4.36.0-rc2 / ff2494ea) — first guesses (lane A7's job to probe)

- **Donor alignment is now exact at the mathlib level** (§0.1): the v4.33→v4.36 port risk that
  AGENTS.md's AreaLaw2D entry implied is gone at HEAD `c0f6d96`. The real cost items are (i)
  **Physlib** `a50684a1` — not a sibling; region-layer statements import it; a probe must stage
  Physlib on Modal (its own mathlib pin vs `ff2494ea` needs checking) or re-derive the minimal
  region core in-repo (`ptrace` is a 5-line def; `vonNeumann`/`SubState`/`MState` ≈ 300 LoC;
  SSA/Araki–Lieb only needed at the AL-EZ2 margins); (ii) the stale manifest (`db584cd6`) —
  elaboration should follow the lakefile require, but `lake`'s resolver behavior on a mismatched
  manifest needs one probe.
- **AL-EZ1:** part 1 is S-effort on the pilot-01 port (already in-repo and axiom-audited); part 2's
  probe = single-crossing-term instance (see first proof step). Guess M for the dictionary + one
  nontrivial cap-functional corollary; L for the full budget-linear family. Risk: the budget claim
  in part 2(a) may be false as first phrased (conditional expectations do not preserve index) —
  the probe exists to find the right `Q_A`.
- **AL-EZ2:** the (c) core is S (Cauchy–Schwarz over `Arealaw.H`, no physics); the LP layer rides
  on dossier 02's declared M-effort LP-duality-in-Lean item; guess M for (a)+(c), M/L with (b).
- **AL-EZ3:** S–M (transport + reindexing; both endpoints already kernel-verified in their homes).
  The encoding gap (`Finset (ℤ×ℤ)` + `Reg` vs `Vertex L = Fin L × Fin L` + `RegionConfiguration`)
  is fiddly but bounded; requires staging BOTH AreaLaw2D (with Physlib) and openai-math's
  `OAI/MathematicalPhysics` (which pins a different mathlib — check `lean-toolchain` there before
  promising one file; worst case re-state `UniformAreaLaw` verbatim in our probe, it is 15 lines).
- **Modal infra:** existing generic runners (`research/pilots/32/run_pilot.sh`) suffice; add
  Physlib to the staged tree only if statement-level elaboration of `OpenAI.Statements` is
  required (it is, for any donor import).

## §6 Dependencies on other lanes

- **Lane A7 (feasibility):** the probes this map generates, in order: (1) elaborate
  `OpenAI.HasGlobalGap`, `pureState`, `SubState.regionEntropy` + PEPS `UniformAreaLaw` statement
  against `ff2494ea` with Physlib staged; (2) AL-EZ1 part-1 dictionary lemma; (3) AL-EZ3(i)
  ptrace-Gram identity.
- **Novelty round 4 (R8-style):** literature verification for AL-EZ1 (AHS 2004.15009, Kuwahara
  2610.15199 as the boundary; queries listed in situ) and AL-EZ2.
- **Tensor-algebra lane (dossier 41):** AL-EZ4 is jointly owned.
- **Survey lane:** `survey/axiommath.md` should absorb §0 (this file's snapshot is the
  area-law-relevant cut of it).

---

## §7 Sources consulted

AreaLaw2D (read this lane): `README.md`; `lakefile.toml`; `lean-toolchain`; `lake-manifest.json`;
`git log` (c0f6d96, 7768136); `OpenAI/Statements.lean` (all 551 lines); `OpenAI/Audit.lean`
(audit list); `AreaLaw/Transfer.lean` (theorem sites :80–367); `AreaLaw/S06_Replicas/Setup.lean`
(:24–93); `AreaLawForMathlib/QuantumInfo/Region/{State,PartialTrace,Physlib}.lean`,
`QuantumInfo/Entropy/{VonNeumann,Subadditivity}.lean`, `Region/TraceDistance.lean` (decls + key
lines); `QuantumInfo/ClassicalInfo/Entropy.lean` (decls); `RepresentationTheory/` listing
(SchurWeyl 49 files, 10,678 LoC); `RefactoringResult.md` (§§1–3: Mathlib/Physlib-gap table);
`docs/3D/Targets.md` (all); `digest/00-overview.md` (§§1–2). openai-math:
`preprints/A-two-dimensional-area-law-from-a-global-spectral-gap-September-24-2026/build/sections/{00-introduction,00-history}.tex`;
`preprints/Polynomial-PEPS-approximation-…/build/sections/{00-introduction,08-companion-interface}.tex`;
`lean/OAI/MathematicalPhysics/PEPSFilters/Basic.lean` (:74–147) + directory listings
(PEPSMove/PEPSSubvolume/TensorNetwork); `overview.tex` (resultentry 265 :621); `rg` negative
searches (area law / HasGlobalGap in `OAI/`; sorry in PEPSFilters). mathlib `ff2494ea`:
`Analysis/Matrix/Spectrum.lean` (decl list :33–240), `Analysis/Matrix/Order.lean:316–335`
(L2Operator), `Analysis/SpecialFunctions/BinaryEntropy.lean`; negative searches (von Neumann /
partial trace / density matrix / local Hamiltonian / Lieb-Robinson / Information/). tauceti:
`KnotTheory/TemperleyLieb.lean` (:8–108); negative entropy/partial-trace search. zeta23/main-run:
`research/bridges/linear-algebra.md` (all); `research/candidates/{01,02,03}-*.md` (all);
pilot-01 artifacts referenced therein. Literature (arXiv API + paper bibs): Anshu–Harrow–
Soleimanifar arXiv:2004.15009 (entanglement-spread area law); Kuwahara arXiv:2610.15199 (Rényi
α<1 counterexamples + Schmidt-rank trade-offs); Kastoryano–Eisert arXiv:1303.6304; Chen–Rouzé
arXiv:2504.02208; area-law paper's history section (Hastings 2007, ALV 2012, AKLV 2013,
Brandão–Horodecki 2015, Nachtergaele–Sims 2006, Anshu–Arad–Gosset 2022a/b, Arad–Firanko–Jain 2026,
Kitaev's filter, detectability lemma lineage).
