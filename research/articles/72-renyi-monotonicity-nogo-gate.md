# The Rényi Monotonicity No-Go Gate for Area-Law Rank Statements (with the Family-265 Interface Layer)

*cross-math-fronttier research article 72 (Cycle 2) · FINAL (C-neg complete; M1 interface
layer landed for its Cycle-2 tranche, with the gap transfer and the interface theorem
carried to Iteration 4) · dossier `research/candidates/72-area-law-inertial-defect.md` ·
prework `research/pilots/72-prework.md` (Appendix A) · Lean `research/pilots/72/C-neg.lean`,
`research/pilots/72-M1/P72M1T{1,2}.lean` · bridge `research/bridges/area-law.md`*

**Status: PROVED, FINAL.**
- **Part I (the gate, C-neg)** is complete. It has 369 lines and 11 theorems (5 public,
  6 private), each with axioms exactly `[propext, Classical.choice, Quot.sound]`.
- **Part II (M1)** proves the first two links of the planned AreaLaw2D → openai-math
  interface chain, kernel-clean: the partial-trace/Gram identity with entropy match, and
  the boundary comparison at constant 1. The third link (Hamiltonian/gap transfer) and
  the interface theorem itself carry to Iteration 4.

The mathematics of Part I is elementary. Its value is as a permanent formal fence around
a statement shape that a 2026 preprint refuted.

---

## Abstract

Kuwahara (arXiv:2610.15199, October 2026) constructed families of 2D finite-range,
uniformly gapped Hamiltonians with unique ground states whose Rényi-α entanglement
entropy obeys a *volume* law for every 0 < α < 1. A consequence is never stated in the
corpora we surveyed, yet it is what any "rank concentration from a spectral gap"
proposal would run into. The consequence: no bound of the form
log(Schmidt rank of ρ_A) ≤ C·|∂A| can hold for all such ground states. The reason is
that log rank = S₀ ≥ S_α. We formalize the chain that makes this a theorem:

- **(N1)** S_β(p) ≤ S_α(p) for 0 < α ≤ β < 1, for every probability vector p;
- **(N2)** S_α ≤ log #supp p, and, for a Hermitian PSD matrix with unit eigenvalue sum,
  S_α(eigenvalues) ≤ log rank;
- **(N3)** two gate theorems. A family whose α-entropy grows like c·n², with boundaries
  of size ≤ n, refutes every boundary-linear Rényi-α law (N3a). With N2 it also refutes
  every boundary-linear log-rank law (N3b).

Kuwahara's construction enters only as a hypothesis (`hKL`). Part II records the
positive companion: the first kernel-checked identification of AxiomMath AreaLaw2D's
reduced density matrices and entropies with openai-math's PEPS encodings on the L×L
grid. It also proves the comparison of the two boundary counts.

## 1. Introduction

The Cycle-2 area-law bridge aimed to connect three things: AxiomMath's AreaLaw2D (a
formal 2D area law from a global spectral gap), the main run's inertia/rank machinery
(article 01), and openai-math's PEPS layer, which *assumes* a uniform area law. The
tempting headline was "spectral gap ⟹ rank concentration". It is false. The novelty
sweep (`novelty/round-4.md` §2) found Kuwahara's refutation of the Rényi-α (α < 1) area
law, which kills every rank statement by S₀ ≥ S_α. This article turns that observation
into a kernel-checked obstruction, in the tradition of the project's other negative
results (articles 30 and 50).

**Honesty.** Part I uses no physics, no gap hypothesis and no geometry: it is a Hölder
inequality and a contrapositive. Kuwahara's theorem is the informal input that makes the
gate bite. It is a hypothesis, never re-proved. Part II is glue-grade: two encodings of
the same objects, proved equal.

## 2. Setting

For a probability vector p : ι → ℝ (finite ι, p ≥ 0, Σ p = 1) and α ≠ 1,
`renyi p α := (1/(1−α)) · log Σ_i p_i^α`. For a matrix, the Rényi entropy is taken on
the eigenvalue vector `hM.eigenvalues` of a Hermitian matrix (mathlib
`Analysis/Matrix/Spectrum.lean`). Mathlib has no quantum entropies; the definition is
the pilot's own (`C-neg.lean:52`). Everything imports only Mathlib, on mathlib
`ff2494ea` with Lean v4.36.0-rc2.

## 3. Part I — results

**Theorem N1 (`renyi_antiMono`).** If 0 < α ≤ β < 1, then renyi p β ≤ renyi p α.

**Theorem N2a (`renyi_le_log_card`).** If 0 < α < 1, then
renyi p α ≤ log #{i | p_i > 0}.

**Theorem N2b (`renyi_le_log_rank`).** Let M be Hermitian and positive semidefinite with
Σ eigenvalues = 1. Then for 0 < α < 1, renyi (eigenvalues M) α ≤ log (rank M). When M is
a reduced density matrix ρ_A of a pure state, rank M is the Schmidt rank across the cut.

**Theorem N3a (`renyi_area_law_nogo`).** Let 0 < α < 1, c > 0 and C ≥ 0, and let
renyiOf, bndOf : ℕ → ℝ. The following three hypotheses are jointly contradictory (the
conclusion is `False`):
- (volume law, `hKL`) c·n² ≤ renyiOf n for all n;
- (boundary) bndOf n ≤ n for all n;
- (area law) renyiOf n ≤ C · bndOf n for all n.

**Theorem N3b (`rank_area_law_nogo`).** The same, with an intermediate rankLogOf and
renyiOf n ≤ rankLogOf n (supplied per instance by N2b). A volume-law Rényi family refutes
every boundary-linear *log-rank* law.

**Reading.** Take n = side length of a square region in Kuwahara's family. Then
renyiOf n is S_α of the region's reduced state, at least c·n² by the volume law. bndOf n
is its boundary size, at most 4n (rescale c). N3b says no constant C makes
log rank ρ_A ≤ C·|∂A| hold along the family, so no such theorem can be proved for the
class of unique gapped 2D ground states.

## 4. Part I — proofs

**Hölder workhorse (`sum_rpow_mul_le`).** For x, y ≥ 0 and θ ∈ [0, 1], weighted AM–GM
gives x^θ y^{1−θ} ≤ θx + (1 − θ)y. Summed over a finset with normalization, this yields
Σ f g ≤ (Σ f^{1/θ})^θ (Σ g^{1/(1−θ)})^{1−θ} in the form needed.

**N1.** Put θ = (1 − β)/(1 − α) ∈ (0, 1]. Write p_i^β = (p_i^α)^θ · p_i^{1−θ}, since
αθ + (1 − θ) = β. Hölder and Σ p = 1 give Σ p^β ≤ (Σ p^α)^θ. Take logs (both sums are
positive, because some p_i > 0) and divide by 1 − β > 0:
renyi p β = log Σ p^β/(1 − β) ≤ θ log Σ p^α/(1 − β) = log Σ p^α/(1 − α) = renyi p α.

**N2a.** Apply the workhorse with g ≡ 1 on the support s:
Σ_{i∈s} p_i^α ≤ |s|^{1−α} (Σ p)^α = |s|^{1−α}. Take logs and divide by 1 − α.

**N2b.** The eigenvalues are nonnegative (PSD) and sum to 1, so N2a applies. Mathlib's
`Matrix.IsHermitian.rank_eq_card_non_zero_eigs` identifies the support size with
rank M.

**N3 (`nogo_core`).** If C = 0, then at n = 1 we get c ≤ x 1 ≤ y 1 ≤ 0, contradicting
c > 0. Otherwise choose N > C/c. Then c·N² ≤ x N ≤ y N ≤ C·b N ≤ C·N. Hence c·N ≤ C,
contradicting N > C/c. N3a takes y = x; N3b takes y = rankLogOf. ∎

## 5. Part II — the family-265 interface layer (M1)

openai-math's PEPS work (family 265) assumes `UniformAreaLaw`. AxiomMath's AreaLaw2D
proves an area law from a global gap, in a different encoding. M1 aims at the theorem
"AreaLaw2D's `areaLaw` implies openai's `UniformAreaLaw`". That theorem would make
openai's `MainStatement` unconditional in that hypothesis. The planned chain has four
links:

1. **(proved, `ptrace_pureState_eq_reducedDensity`)** For a normalized grid state Ω and
   region A, AreaLaw2D's partial trace of the pure state |Ω⟩⟨Ω|, re-indexed, *equals*
   openai's `reducedDensity Ω A := W Wᴴ`. Here W is the coefficient matrix across the
   cut.
2. **(proved, `regionEntropy_eq_vonNeumannEntropy`)** consequently AreaLaw2D's
   `regionEntropy` equals openai's `vonNeumannEntropy`. The eigenvalue multisets are
   transported by `hermEigen_eq_of_matrix_eq`.
3. **(proved, `boundaryCard_le_edgeBoundary`)** openai's `boundaryCard A` is at most the
   AreaLaw2D edge boundary of the embedded region, **with constant 1**. The design
   expected a factor ≤ 4. The proof orients each crossing edge and injects it
   (`orientPair_injective`).
4. **(carried to Iteration 4)** the gap/Hamiltonian transfer: Hermitian symmetrization,
   state conventions, and `FullSystemGap` (quadratic-form gap) → `HasGlobalGap` (Loewner
   gap). Also carried: the interface theorem `interface_areaLaw_uniformAreaLaw` built
   from links 1–4. The specification is `pilots/72-M1/L3-spec.md`.

The vendor layer `P72M1T1.lean` (702 lines) re-states the needed AreaLaw2D and openai
statement-level definitions on our pin. Both encodings re-derive mathlib-only (probe G4;
G5b/G5c elaborate the bridge shapes).

## 6. Formal verification

| file | content | size | run | axioms |
|---|---|---|---|---|
| `pilots/72/C-neg.lean` | N1–N3 | 369 lines, 11 thms | `run8-final.log` rc=0, 0 err, 0 sorry (errors 20→14→12→6→7→3→1→0) | `axcheck-run1.log`: 11/11 triad |
| `pilots/72-M1/P72M1T1.lean` | vendor statement layer | 702 lines | `m1-run8-GREEN.log` OK | `m1-axcheck-final.log`: 52 lines ⊆ triad |
| `pilots/72-M1/P72M1T2.lean` | links 1–3 | 360 lines, 25 thms | `m1-run8-GREEN.log` OK (errors 24→10→1→0) | 28 lines ⊆ triad |

All three files are Cycle-2 final-sweep targets: `AxPilot72_Cneg`, `AxPilot72_M1_T1` and
`AxPilot72_M1_T2` are OK with 0 sorryAx (`pilots/72{,-M1}/logs/axcheck-c2-final.log`).
The sweep's 5 C-neg lines cover the public theorems; the 11/11 record includes the
private helpers.

**Deviations from the design (documented in `72-prework.md` §"Execution outcome"):**
- N1 is stated for 0 < α ≤ β < 1, the range the rank argument needs, rather than for
  all α, β ≠ 1.
- N3 is stated as concrete-family contradictions rather than as a general "∀ f" schema.
- Kuwahara's construction is the external hypothesis `hKL`.

## 7. Relation to prior work

- **T. Kuwahara, arXiv:2610.15199**: the refutation itself (finite range, fixed local
  dimension, unique ground state, uniform gap, volume-law Rényi-α for all 0 < α < 1).
  The gate formalizes its consequence for rank.
- **Anshu–Harrow–Soleimanifar, arXiv:2004.15009** (Nature Physics 2022): an area law for
  entanglement *spread* under related hypotheses. It is the nearest positive result, for
  a different functional.
- **Anshu–Arad–Gosset, arXiv:1905.11337 and arXiv:2103.02492**: 2D area laws and
  subvolume laws for frustration-free systems. **Abrahamsen et al., arXiv:2203.16012**:
  the 1D approximate-ground-space-projector framework.
- **AxiomMath AreaLaw2D**: the formal area law. "First formal area law" belongs to it.
  Our contribution is the cross-encoding bridge and, here, the fence.
  (`AreaLaw/Transfer.lean:361`, `QuantumInfo/Region/PartialTrace.lean:25`,
  `State.lean:75,198`).
- **openai-math `PolynomialPEPS`** (`PEPSFilters/Basic.lean:74–135`): the consumer of
  `UniformAreaLaw`.

## 8. Limitations and open problems

1. The gate covers rank and all α < 1. It says nothing about α ≥ 1. The dossier's
   purity-certificate route (P2) lives there and remains a hypothesis-grade objective.
2. `hKL` is an informal input. Formalizing Kuwahara's construction would discharge it.
3. Part II's link 4 and the interface theorem are open (Iteration 4). Until they land,
   openai's `MainStatement` still carries `UniformAreaLaw` as a hypothesis.

## References

T. Kuwahara, arXiv:2610.15199. A. Anshu, A. W. Harrow, M. Soleimanifar, arXiv:2004.15009.
A. Anshu, I. Arad, D. Gosset, arXiv:1905.11337, arXiv:2103.02492. Abrahamsen et al.,
arXiv:2203.16012. AxiomMath `AreaLaw2D` (`OpenAI/Statements.lean:185–259`,
`AreaLaw/Transfer.lean:361`, `AreaLawForMathlib/QuantumInfo/Region/PartialTrace.lean:25`,
`State.lean:75,198`). openai-math `PolynomialPEPS/PEPSFilters/Basic.lean:74–135`.
Project: dossier 72; `pilots/72-prework.md` Appendix A; `pilots/72-M1/L3-spec.md`;
`novelty/round-4.md` §2; articles 01, 30, 50.
