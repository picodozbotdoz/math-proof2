# A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws

*kind: TECHNICAL-RECORD (TEMPLATE-iter4 §0 kept set — fence around an external
theorem + interface layer) · date: 2026-11-16 (Iter-4 edition; 2026-11-17 passes:
front-matter shape, status rows moved to the header, §6 verification-block depth —
no mathematical content change) · supersedes: the Cycle-2
text (r2-rewrite-72) · artifacts: `research/pilots/72/C-neg.lean`,
`research/pilots/72-M1/P72M1T{1,2}.lean`, `research/pilots/72-M1/logs/`; dossier
`research/candidates/72-area-law-inertial-defect.md`; prework
`research/pilots/72-prework.md` (Appendix A); bridge `research/bridges/area-law.md`*

**Status: TECHNICAL-RECORD.** Part I — N1/N2a/N2b PROVED-UNCONDITIONAL; N3a/N3b
PROVED-CONDITIONAL (hKL = Kuwahara's construction, arXiv:2610.15199, as the named
external binder, plus the negated candidate law); all axioms ⊆
{propext, Classical.choice, Quot.sound}. Part II — interface links 1–3
PROVED-UNCONDITIONAL; link 4 and the interface theorem are **not article claims**
(carried to Iteration 4; spec `pilots/72-M1/L3-spec.md`).

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| N1 `renyi_antiMono` | PROVED-UNCONDITIONAL | well-formedness: p a probability vector, 0 < α ≤ β < 1 (definition of subject) | `pilots/72/logs/axcheck-run1.log:24` — triad |
| N2a `renyi_le_log_card` | PROVED-UNCONDITIONAL | idem | `axcheck-run1.log:25` — triad |
| N2b `renyi_le_log_rank` | PROVED-UNCONDITIONAL | Hermitian PSD, unit trace — definition of subject | `axcheck-run1.log:26` — triad |
| N3a `renyi_area_law_nogo` | PROVED-CONDITIONAL | hKL (Kuwahara's volume-law construction, arXiv:2610.15199 — the named external binder) + hBnd + hArea (the negated candidate law); conclusion `False` | `axcheck-run1.log:27` — triad |
| N3b `rank_area_law_nogo` | PROVED-CONDITIONAL | hKL + hMono + hBnd + hArea; conclusion `False` | `axcheck-run1.log:28` — triad |
| link 1 `ptrace_pureState_eq_reducedDensity` | PROVED-UNCONDITIONAL | hΩ = normalization — definition of subject | `pilots/72-M1/logs/m1-axcheck-final.log:83` — triad |
| link 2 `regionEntropy_eq_vonNeumannEntropy` | PROVED-UNCONDITIONAL | none | `m1-axcheck-final.log` — triad |
| link 3 `boundaryCard_le_edgeBoundary` | PROVED-UNCONDITIONAL | none (constant 1; design allowed ≤ 4) | `m1-axcheck-final.log:82` — triad |
| link 4 + `interface_areaLaw_uniformAreaLaw` | not article claims (carried to Iteration 4; spec `pilots/72-M1/L3-spec.md`) | — | — |

Status rows moved to the header from §6 (template skeleton; content unchanged,
2026-11-17 depth pass). Per-decl file:line view, the private-helper coverage row and
the vendor layer: §6.

---

## Abstract (≈190 words)

Kuwahara (arXiv:2610.15199, October 2026) disproved the Rényi area-law conjecture below
α = 1: in every spatial dimension d ≥ 2, his finite-range, uniformly gapped Hamiltonians
with unique ground states have volume-law Rényi-α entropy for every 0 < α < 1, alongside
a von Neumann area law. The log-rank consequence — no bound log(Schmidt rank of ρ_A) ≤
C·|∂A| can hold for all such ground states — follows from his theorem via
log rank = S₀ ≥ S_α alone, but is not stated in his paper: his rank statement is a
positive trade-off for approximate projectors, not a boundary-linear no-go. The
refutation is his; the fence, and the no-go-as-a-theorem, are ours. We make the
corollary a machine-checked fence, valid for the whole d ≥ 2 class: (N1) S_β ≤ S_α for
0 < α ≤ β < 1; (N2) S_α ≤ log rank for PSD unit-trace matrices; (N3) a volume-law
α-entropy family with boundary ≤ n refutes every boundary-linear Rényi-α law (N3a) and
every boundary-linear log-rank law (N3b). Kuwahara's construction enters only as the
hypothesis hKL. Part II: the kernel-checked identification of AreaLaw2D's reduced
states and entropies with openai-math's PEPS encodings, boundary counts compared at
constant 1.

## 1. Introduction

The Cycle-2 area-law bridge aimed to connect three things: AxiomMath's AreaLaw2D (a
formal 2D area law from a global spectral gap), the main run's inertia/rank machinery
(article 01), and openai-math's PEPS layer, which *assumes* a uniform area law. The
tempting headline was "spectral gap ⟹ rank concentration". It is false — **by
Kuwahara's theorem, in every spatial dimension d ≥ 2** (not 2D only; scope per the R7
external read, `novelty/iter4-external-priorart.md` §2.4). The novelty sweep
(`novelty/round-4.md` §2) found his refutation; this article does not re-prove it or
claim it. What the corpora — and Kuwahara's paper — lack is the fence: his own rank
statement is a positive trade-off for *approximate projectors*, and the
boundary-linear log-rank no-go is nowhere stated as a theorem; stating it at the
generality of arbitrary boundary functions, machine-checked, makes the no-go survive
contact with any future encoding, region family, or boundary convention. This is
written in the tradition of the project's negative results (articles 30 and 50) — with
the difference that 30 refuted a conjecture formulated *here* and 50 Part I read our
target engine, whereas here the refutation is external and enters as `hKL`; what is
ours is the *stated* no-go and its verification.

**Honesty.** Part I uses no physics, no gap hypothesis and no geometry: it is a Hölder
inequality (textbook core: Rényi 1961 for the monotonicity statement; the standard
derivation per Beck–Schlögl 1993), a support bound, and a contrapositive. The informal
input that makes the gate bite is Kuwahara's, carried as a hypothesis. Part II is
glue-grade: two encodings of the same objects, proved equal — and deliberately
dimension-generic, which (given Kuwahara's d ≥ 2 scope) is an asset rather than a
reach.

## 2. Setting

For a probability vector p : ι → ℝ (finite ι, p ≥ 0, Σ p = 1) and α ≠ 1,
`renyi p α := (1/(1−α)) · log Σ_i p_i^α`. For a matrix, the Rényi entropy is taken on
the eigenvalue vector `hM.eigenvalues` of a Hermitian matrix (mathlib
`Analysis/Matrix/Spectrum.lean`). Mathlib has no quantum entropies; the definition is
the pilot's own (`C-neg.lean:52`) — externally corroborated: R7's AFP and Coq scans
found no entropy definitions either. Everything imports only Mathlib, on mathlib
`ff2494ea` with Lean v4.36.0-rc2.

## 3. Part I — results (the fence)

**Theorem N1 (`renyi_antiMono`).** If 0 < α ≤ β < 1, then renyi p β ≤ renyi p α.

**Theorem N2a (`renyi_le_log_card`).** If 0 < α < 1, then
renyi p α ≤ log #{i | p_i > 0}.

**Theorem N2b (`renyi_le_log_rank`).** Let M be Hermitian and positive semidefinite
with Σ eigenvalues = 1. Then for 0 < α < 1, renyi (eigenvalues M) α ≤ log (rank M).
When M is a reduced density matrix ρ_A of a pure state, rank M is the Schmidt rank
across the cut.

**Theorem N3a (`renyi_area_law_nogo`).** Let 0 < α < 1, c > 0 and C ≥ 0, and let
renyiOf, bndOf : ℕ → ℝ. The following three hypotheses are jointly contradictory (the
conclusion is `False`):
- (volume law, `hKL`) c·n² ≤ renyiOf n for all n;
- (boundary) bndOf n ≤ n for all n;
- (area law) renyiOf n ≤ C · bndOf n for all n.

**Theorem N3b (`rank_area_law_nogo`).** The same, with an intermediate rankLogOf and
renyiOf n ≤ rankLogOf n (supplied per instance by N2b). A volume-law Rényi family
refutes every boundary-linear *log-rank* law. The α-range binders of N3 are unused in
the proof, so both gates hold for every α (R3 §1.5).

**Reading (whose theorem bites).** Take n = side length of a square region in the
hypothesized Kuwahara family (`hKL`); the gate fires the moment his theorem supplies
the family. Then renyiOf n is S_α of the region's reduced state, at least c·n² by the
volume law. bndOf n is its boundary size, at most 4n (rescale c). N3b says no constant
C makes log rank ρ_A ≤ C·|∂A| hold along the family, so no such theorem can be proved
for the class of unique gapped ground states — in any dimension d ≥ 2.

## 4. Part I — proofs

**Hölder workhorse (`sum_rpow_mul_le`).** For x, y ≥ 0 and θ ∈ [0, 1], weighted
AM–GM gives x^θ y^{1−θ} ≤ θx + (1 − θ)y. Summed over a finset with normalization, this
yields Σ f g ≤ (Σ f^{1/θ})^θ (Σ g^{1/(1−θ)})^{1−θ} in the form needed.

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

## 5. Part II — the interface layer (M1)

openai-math's PEPS work (comparator family 265 — the corpus's internal index for the
PolynomialPEPS/PEPSFilters line, `PEPSFilters/Basic.lean:74–135`) assumes
`UniformAreaLaw`. AxiomMath's AreaLaw2D proves an area law from a global gap, in a
different encoding. M1 aims at the theorem "AreaLaw2D's `areaLaw` implies openai's
`UniformAreaLaw`". That theorem would make openai's `MainStatement` unconditional in
that hypothesis. The planned chain has four links:

1. **(proved, `ptrace_pureState_eq_reducedDensity`)** For a normalized grid state Ω
   and region A, AreaLaw2D's partial trace of the pure state |Ω⟩⟨Ω|, re-indexed,
   *equals* openai's `reducedDensity Ω A := W Wᴴ`. Here W is the coefficient matrix
   across the cut.
2. **(proved, `regionEntropy_eq_vonNeumannEntropy`)** consequently AreaLaw2D's
   `regionEntropy` equals openai's `vonNeumannEntropy`. The eigenvalue multisets are
   transported by `hermEigen_eq_of_matrix_eq`.
3. **(proved, `boundaryCard_le_edgeBoundary`)** openai's `boundaryCard A` is at most
   the AreaLaw2D edge boundary of the embedded region, **with constant 1**. The design
   expected a factor ≤ 4. The proof orients each crossing edge and injects it
   (`orientPair_injective`).
4. **(carried to Iteration 4 — not claimed here)** the gap/Hamiltonian transfer:
   Hermitian symmetrization, state conventions, and `FullSystemGap` (quadratic-form
   gap) → `HasGlobalGap` (Loewner gap). Also carried: the interface theorem
   `interface_areaLaw_uniformAreaLaw` built from links 1–4. The specification is
   `pilots/72-M1/L3-spec.md`.

The encodings are deliberately dimension-generic, which (given Kuwahara's d ≥ 2
scope) is an asset rather than a reach. The vendor layer `P72M1T1.lean` re-states the
needed AreaLaw2D and openai statement-level definitions on our pin. Both encodings
re-derive mathlib-only (probe G4; G5b/G5c elaborate the bridge shapes).

## 6. Formal verification (per-decl view; status rows in the header; from `r3-verification-tables.md` §3)

| decl | file:line | status | axioms print source |
|---|---|---|---|
| N1 `renyi_antiMono` | `pilots/72/C-neg.lean:188` | PROVED-UNCONDITIONAL (well-formedness: p probability vector, 0 < α ≤ β < 1) | `pilots/72/logs/axcheck-run1.log:24` — triad |
| N2a `renyi_le_log_card` | `pilots/72/C-neg.lean:231` | PROVED-UNCONDITIONAL (idem) | `axcheck-run1.log:25` — triad |
| N2b `renyi_le_log_rank` | `pilots/72/C-neg.lean:282` | PROVED-UNCONDITIONAL (Hermitian PSD, unit trace — definition of subject) | `axcheck-run1.log:26` — triad |
| N3a `renyi_area_law_nogo` | `pilots/72/C-neg.lean:344` | PROVED-CONDITIONAL — hKL (Kuwahara volume law, arXiv:2610.15199) + hBnd + hArea (the negated candidate law); conclusion `False` | `axcheck-run1.log:27` — triad |
| N3b `rank_area_law_nogo` | `pilots/72/C-neg.lean:354` | PROVED-CONDITIONAL — hKL + hMono + hBnd + hArea; conclusion `False` | `axcheck-run1.log:28` — triad |
| private helpers (`nogo_core`, `sum_rpow_mul_le`, `amgm2`, `div_rpow_eq`, `exists_pos_of_sum_eq_one`, `sum_rpow_pos`) | `pilots/72/C-neg.lean` (private) | supporting — no independent claim; **C1** coverage (public via sweep + private via pilot-local audit) | `axcheck-run1.log:34` etc. — triad |
| link 1 `ptrace_pureState_eq_reducedDensity` | `pilots/72-M1/P72M1T2.lean:303` | PROVED-UNCONDITIONAL (hΩ = normalization — definition of subject) | `pilots/72-M1/logs/m1-axcheck-final.log:83` — triad; sweep `axcheck-c2-final.log` (T2: 28 axiom-lines, 0 sorryAx); T2 has 1 private decl — **C3** |
| link 2 `regionEntropy_eq_vonNeumannEntropy` | `pilots/72-M1/P72M1T2.lean:330` | PROVED-UNCONDITIONAL | `m1-axcheck-final.log` — triad |
| link 3 `boundaryCard_le_edgeBoundary` | `pilots/72-M1/P72M1T2.lean:164` | PROVED-UNCONDITIONAL (constant 1; design allowed ≤ 4) | `m1-axcheck-final.log:82` — triad |
| link 4 (gap transfer) + `interface_areaLaw_uniformAreaLaw` | spec only: `pilots/72-M1/L3-spec.md` | NOT AN ARTICLE CLAIM (carried to Iteration 4; no status row per template §0) | — |

Vendor layer: `P72M1T1.lean` (702 lines, 52 axiom-lines ⊆ triad, `m1-axcheck-final.log`).
Deviations from design (carried from the v1 record): N1 is stated for
0 < α ≤ β < 1, the range the rank argument needs, rather than for all α, β ≠ 1; N3 is
stated as concrete-family contradictions rather than as a general "∀ f" schema;
Kuwahara's construction is the external hypothesis `hKL`. (R3 §1.5: the `_hα`/`_hα1`
binders are unused — N3a/N3b hold for all α; an underclaim in the safe direction.).

Verification-block depth (R3 §5; 2026-11-17 depth pass):

- substrate: mathlib `ff2494ea` / Lean v4.36.0-rc2 for all rows; the status rows in the
  header carry the per-theorem log lines.
- binder inventory: **hKL** = Kuwahara's volume-law construction (arXiv:2610.15199) —
  the one external statement, carried as the named hypothesis binder (never imported;
  the refutation is his, the fence ours); **hBnd, hArea** = the boundary bound and the
  negated candidate area law — parameters of the statement class (defining what is
  refuted); **hMono** (N3b) = the monotonicity instance of N1, discharged in-file;
  N1/N2's probability-vector, α-range, Hermitian-PSD and normalization hypotheses are
  definitions of subject, which is why those rows are unconditional; T2's `hΩ`
  likewise.
- coverage: the private-helper row above (C1: public via sweep + private via the
  pilot-local audit, prints `axcheck-run1.log:34` etc.); T2 has one private decl (C3
  class, sweep-covered).

## 7. Relation to prior work (attribution architecture; nearest-miss table)

| source | what it owns | relation to this article |
|---|---|---|
| **T. Kuwahara, arXiv:2610.15199** | the refutation: volume-law Rényi-α for all 0 < α < 1, in **every d ≥ 2** (finite range, fixed local dimension, bounded interactions, unique ground state, uniform gap, adiabatically connected); von Neumann area law coexisting; a **positive** worst-case trade-off for *approximate projectors* — optimal Schmidt rank exp[Õ((A log ε⁻¹)^{2/3})] for log ε⁻¹ ≳ A | external input, carried as `hKL`; **not** the boundary-linear log-rank no-go, which his paper does not state — the S₀ ≥ S_α bridge is the only bridge, and it is ours (R7 §2.4: the "never stated" claim survives) |
| **A. Rényi (1961, Berkeley Symposium)** | the entropies; the monotonicity statement | N1 formalizes this textbook core — no mathematics claimed. [Cite status: **no card in r7-bib-cards.md §C (C.1–C.5 confirmed absent, 2026-11-16)** — R2's standard entry used provisionally; card-fill when issued] |
| **C. Beck, F. Schlögl (1993)** | the standard derivation of H_α monotonicity and H₀ = log‖supp‖ | N1–N2a formalize this layer — no mathematics claimed. [Cite status: idem — no §C card; provisional standard entry] |
| Anshu–Harrow–Soleimanifar (2004.15009); Anshu–Arad–Gosset (1905.11337, 2103.02492); Abrahamsen et al. (2203.16012) | the positive program (entanglement spread; 2D area/sub-volume laws; 1D AGSP framework) | neighbors; the fence does not touch them |
| AxiomMath AreaLaw2D (`AreaLaw/Transfer.lean:361`, `PartialTrace.lean:25`, `State.lean:75,198`) | the formal area law — "first formal area law" belongs to it | Part II's positive side: the cross-encoding bridge |
| openai-math `PolynomialPEPS` (`PEPSFilters/Basic.lean:74–135`) | the `UniformAreaLaw` consumer | Part II's target interface |
| this project, articles 30/50 | the negative-results lineage | difference of kind per §1: 30 refuted our own conjecture; 50 Part I read our engine; here the refutation is external and hypothesized — the stated no-go is our increment |

Also fold (one line): formal-prior-art corroboration — no entropy definitions in
mathlib (on pin), AFP (R7 landing scan), or circuit-level Coq libraries (search-null);
"the pilot's own definitions" stands.

## 8. Limitations and open problems

1. The gate covers rank and all α < 1. It says nothing about α ≥ 1 — note that
   Kuwahara's examples *satisfy* a von Neumann (α = 1) area law, so α = 1 is the sharp
   threshold in his class. The dossier's purity-certificate route (P2) lives there and
   remains a hypothesis-grade objective.
2. `hKL` is an informal input. Formalizing Kuwahara's construction would discharge it.
3. Part II's link 4 and the interface theorem are open (Iteration 4). Until they land,
   openai's `MainStatement` still carries `UniformAreaLaw` as a hypothesis.

## References

- T. Kuwahara, *The Rényi area law conjecture is false below α = 1 in high dimensions*,
  arXiv:2610.15199 (quant-ph), v1 2026-10-10; 7 pp + 25 pp appendix. [Filled from
  `r7-bib-cards.md` §C.2: all-D≥2 scope; von-Neumann-law coexistence; the
  approximate-projector trade-off exp[Θ̃((A log ε⁻¹)^{2/3})] (log ε⁻¹ ≳ A); the
  boundary-linear log-rank no-go NOT stated — the S₀ ≥ S_α bridge is ours.]
- A. Rényi, *On measures of entropy and information*, Berkeley Symposium on
  Mathematical Statistics and Probability, 1961. [No §C card issued (C.1–C.5 checked
  2026-11-16); standard entry stands pending a card]
- C. Beck, F. Schlögl, *Thermodynamics of Chaotic Systems*, Cambridge University
  Press, 1993. [Idem — standard entry pending a card]
- A. Anshu, A. W. Harrow, M. Soleimanifar, arXiv:2004.15009. A. Anshu, I. Arad,
  D. Gosset, arXiv:1905.11337, arXiv:2103.02492. Abrahamsen et al., arXiv:2203.16012.
- AxiomMath `AreaLaw2D` (`OpenAI/Statements.lean:185–259`, `AreaLaw/Transfer.lean:361`,
  `AreaLawForMathlib/QuantumInfo/Region/PartialTrace.lean:25`, `State.lean:75,198`).
  openai-math `PolynomialPEPS/PEPSFilters/Basic.lean:74–135`.
- Project: dossier 72; `pilots/72-prework.md` Appendix A; `pilots/72-M1/L3-spec.md`;
  `novelty/round-4.md` §2; `novelty/iter4-external-priorart.md` §2.4; articles 01, 30, 50.

