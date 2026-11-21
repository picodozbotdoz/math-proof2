# A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws

*kind: TECHNICAL-RECORD (fence around an external theorem + interface layer) ·
date: 2026-11-16 · supersedes: none · artifacts: `research/pilots/72/C-neg.lean`,
`research/pilots/72-M1/P72M1T{1,2}.lean`; logs
`research/pilots/72/logs/axcheck-run1.log`,
`research/pilots/72-M1/logs/m1-axcheck-final.log`*

**Claims of this article.** Part I — the fence, N1–N3b below. Part II —
interface links 1–3; link 4 and the interface theorem are **not article claims**
(open for future work; spec `pilots/72-M1/L3-spec.md`).

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| N1 `renyi_antiMono` | PROVED-UNCONDITIONAL | p a probability vector (p ≥ 0, Σ p = 1), 0 < α ≤ β < 1 — definition of subject | `pilots/72/logs/axcheck-run1.log:24` — triad |
| N2a `renyi_le_log_card` | PROVED-UNCONDITIONAL | p a probability vector (p ≥ 0, Σ p = 1), 0 < α < 1 — definition of subject | `axcheck-run1.log:25` — triad |
| N2b `renyi_le_log_rank` | PROVED-UNCONDITIONAL | M Hermitian, positive semidefinite, Σ eigenvalues = 1; 0 < α < 1 — definition of subject | `axcheck-run1.log:26` — triad |
| N3a `renyi_area_law_nogo` | PROVED-CONDITIONAL | parameters: α with 0 < α < 1 (unused in the proof), c > 0, C ≥ 0, renyiOf bndOf : ℕ → ℝ; hypotheses: hKL (volume law c·n² ≤ renyiOf n for all n — supplied by Kuwahara's construction, arXiv:2610.15199; the named external hypothesis) + hBnd (bndOf n ≤ n for all n) + hArea (renyiOf n ≤ C·bndOf n for all n); conclusion `False` | `axcheck-run1.log:27` — triad |
| N3b `rank_area_law_nogo` | PROVED-CONDITIONAL | parameters: α with 0 < α < 1 (unused in the proof), c > 0, C ≥ 0, rankLogOf renyiOf bndOf : ℕ → ℝ; hypotheses: hKL (as N3a) + hMono (renyiOf n ≤ rankLogOf n for all n) + hBnd (as N3a) + hArea (rankLogOf n ≤ C·bndOf n for all n); conclusion `False` | `axcheck-run1.log:28` — triad |
| link 1 `ptrace_pureState_eq_reducedDensity` | PROVED-UNCONDITIONAL | hΩ (normalization `star Ω ⬝ᵥ Ω = 1` — definition of subject) | `pilots/72-M1/logs/m1-axcheck-final.log:83` — triad |
| link 2 `regionEntropy_eq_vonNeumannEntropy` | PROVED-UNCONDITIONAL | hΩ (same normalization — definition of subject) | `m1-axcheck-final.log:84` — triad |
| link 3 `boundaryCard_le_edgeBoundary` | PROVED-UNCONDITIONAL | none (constant 1; design allowed ≤ 4) | `m1-axcheck-final.log:82` — triad |
| link 4 + `interface_areaLaw_uniformAreaLaw` | not article claims (spec `pilots/72-M1/L3-spec.md`; open for future work) | — | — |

Per-declaration file:line view, private-declaration coverage and the
transcription layer: §6.

---

## Abstract

Does a Rényi entropy area law survive below α = 1? Kuwahara's refutation
(arXiv:2610.15199): in every dimension d ≥ 2 his finite-range, uniformly
gapped, unique-ground-state class has volume-law Rényi-α entropy for
0 < α < 1. It implies, via the support bound S_α ≤ log rank
(N2a/N2b), that no log (Schmidt rank of ρ_A) ≤ C·|∂A| bound holds along such a
family — not among his stated results per our surveys. The refutation is his;
the fence is ours: N1, S_β ≤ S_α for 0 < α ≤ β < 1; N2b, S_α ≤ log rank for
Hermitian positive-semidefinite M with sum of eigenvalues 1; N3a, for
0 < α < 1, c > 0, C ≥ 0 and renyiOf, bndOf : ℕ → ℝ, volume law c·n² ≤ renyiOf n,
boundary bndOf n ≤ n, area law renyiOf n ≤ C·bndOf n (all n) are jointly
contradictory; N3b adds rankLogOf with renyiOf n ≤ rankLogOf n (N2b). Statuses:
N1/N2a/N2b PROVED-UNCONDITIONAL; N3a/N3b PROVED-CONDITIONAL on hKL (volume
law), hBnd, hArea, hMono; axioms ⊆ {propext, Classical.choice, Quot.sound}.
The gate is formalized for two dimensions; d ≥ 3 is open. Part II
kernel-checks AreaLaw2D's reduced states and entropies against openai-math's
PEPS encodings.

## 1. Introduction

The area-law bridge aimed to connect three things: AxiomMath's AreaLaw2D (a
formal 2D area law from a global spectral gap), the corpus's inertia/rank
machinery (article 01), and openai-math's PEPS layer, which *assumes* a uniform
area law. The tempting headline was "spectral gap ⟹ rank concentration". It is
false — **by Kuwahara's theorem, in every spatial dimension d ≥ 2** (scope
documented in the external prior-art survey,
`novelty/iter4-external-priorart.md` §2.4). The novelty search
(`novelty/round-4.md` §2) found his refutation; this article does not re-prove
it or claim it. What the corpora lack — and, as far as our surveys record
(`novelty/round-4.md` §2, `novelty/iter4-external-priorart.md` §2.4),
Kuwahara's paper too — is the fence: his own rank statement is a positive
trade-off for *approximate projectors*, and the boundary-linear log-rank no-go
is not stated as a theorem in any source we surveyed. Stating it at the
generality of arbitrary boundary functions, machine-checked, makes the no-go
survive contact with any future encoding, region family, or boundary
convention. This is written in the tradition of the project's negative results
(articles 30 and 50) — with the difference that 30 refuted a conjecture
formulated *here* and 50 Part I read our target engine, whereas here the
refutation is external and enters as `hKL`; what is ours is the *stated* no-go
and its verification.

**Honesty.** Part I uses no physics, no gap hypothesis and no geometry: it is a
Hölder inequality (textbook core: Rényi 1961 for the monotonicity statement;
the standard derivation per Beck–Schlögl 1993), a support bound, and a
contrapositive. The informal input that makes the gate bite is Kuwahara's,
carried as a hypothesis. Part II is interface work: two encodings of the same
objects, proved equal — deliberately dimension-generic as Lean statements,
which makes the links reusable; it carries no claim about the fence's dimension
scope.

## 2. Setting and notation

For a probability vector p : ι → ℝ (finite ι, p ≥ 0, Σ p = 1) and α ≠ 1,
`renyi p α := (1/(1−α)) · log Σ_i p_i^α`. For a matrix, the Rényi entropy is
taken on the eigenvalue vector `hM.eigenvalues` of a Hermitian matrix (mathlib
`Analysis/Matrix/Spectrum.lean`). Mathlib has no quantum entropies; the
definition is the verification file's own (`C-neg.lean:52`). Everything imports
only Mathlib, on mathlib `ff2494ea` with Lean v4.36.0-rc2. The verification
files live under `research/pilots/` — the corpus's standalone verification
directories (`pilots/72/` for Part I, `pilots/72-M1/` for Part II).

## 3. Main results

**Part I — the fence.**

**Theorem N1 (`renyi_antiMono`).** If 0 < α ≤ β < 1, then renyi p β ≤ renyi p α.

**Theorem N2a (`renyi_le_log_card`).** If 0 < α < 1, then
renyi p α ≤ log #{i | p_i > 0}.

**Theorem N2b (`renyi_le_log_rank`).** Let M be Hermitian and positive
semidefinite with Σ eigenvalues = 1. Then for 0 < α < 1,
renyi (eigenvalues M) α ≤ log (rank M).
When M is a reduced density matrix ρ_A of a pure state, rank M is the Schmidt
rank across the cut.

**Theorem N3a (`renyi_area_law_nogo`).** Let 0 < α < 1, c > 0 and C ≥ 0, and
let renyiOf, bndOf : ℕ → ℝ. The following three hypotheses are jointly
contradictory (the conclusion is `False`):
- (volume law, `hKL`) c·n² ≤ renyiOf n for all n;
- (boundary) bndOf n ≤ n for all n;
- (area law) renyiOf n ≤ C · bndOf n for all n.

The volume exponent is 2 and the boundary bound is linear in the same index:
this is the two-dimensional geometry, with n the side length of a square
region. N3a is a statement about functions ℕ → ℝ; no geometry is formalized.

**Theorem N3b (`rank_area_law_nogo`).** The same, with an intermediate
rankLogOf and renyiOf n ≤ rankLogOf n (supplied per instance by N2b). A
volume-law Rényi family refutes every boundary-linear *log-rank* law. The
α-range binders of N3 are unused in the proof, so both gates hold for every α.

**Reading (whose theorem bites, and where).** Take n = side length of a square
region in the hypothesized Kuwahara family (`hKL`); the gate applies the moment
his theorem supplies the family. Then renyiOf n is S_α of the region's reduced
state, at least c·n² by the volume law. bndOf n is its boundary size, at most
4n (rescale c). N3b says no constant C makes log rank ρ_A ≤ C·|∂A| hold along
the family, so no such theorem can be proved for the class of unique gapped
ground states *in dimension two*.

*Unformalized remark on d ≥ 3 (analysis, not theorem content).* Kuwahara's
theorem is dimension-general, but the formalized gate does not reach d ≥ 3 as
stated. For a side-L region in dimension d ≥ 3, his volume law gives
S = Ω(L^d), while the boundary is Θ(L^{d−1}) — larger than L, so the
hypothesis `hBnd` (boundary ≤ side) fails. Re-indexing by boundary size b
would give a volume law Ω(b^{d/(d−1)}) with d/(d−1) < 2, weaker than the
formalized c·b². No indexing of a d ≥ 3 family satisfies both `hKL` and
`hBnd` as formalized.

**Part II — the interface layer.**

openai-math's PEPS work (`PolynomialPEPS/PEPSFilters/Basic.lean:74–135`)
assumes `UniformAreaLaw`. AxiomMath's AreaLaw2D proves an area law from a
global gap, in a different encoding. Part II aims at the theorem "AreaLaw2D's
`areaLaw` implies openai's `UniformAreaLaw`". That theorem would make openai's
`MainStatement` unconditional in that hypothesis. The planned chain has four
links:

1. **(proved, `ptrace_pureState_eq_reducedDensity`)** For a normalized grid
   state Ω and region A, AreaLaw2D's partial trace of the pure state
   |Ω⟩⟨Ω|, re-indexed, *equals* openai's `reducedDensity Ω A := W Wᴴ`. Here W
   is the coefficient matrix across the cut.
2. **(proved, `regionEntropy_eq_vonNeumannEntropy`)** consequently AreaLaw2D's
   `regionEntropy` equals openai's `vonNeumannEntropy`. The eigenvalue
   multisets are transported by `hermEigen_eq_of_matrix_eq`.
3. **(proved, `boundaryCard_le_edgeBoundary`)** openai's `boundaryCard A` is at
   most the AreaLaw2D edge boundary of the embedded region, **with constant
   1**. The design expected a factor ≤ 4. The proof orients each crossing edge
   and injects it (`orientPair_injective`).
4. **(not claimed here — open for future work)** the gap/Hamiltonian transfer:
   Hermitian symmetrization, state conventions, and `FullSystemGap`
   (quadratic-form gap) → `HasGlobalGap` (Loewner gap). Also open: the
   interface theorem `interface_areaLaw_uniformAreaLaw` built from links 1–4.
   The specification is `pilots/72-M1/L3-spec.md`.

The transcription layer `P72M1T1.lean` re-states the needed AreaLaw2D and
openai statement-level definitions on the same toolchain. Both encodings
re-derive from mathlib alone (statement-level elaboration checks).

## 4. Novelty and nearest misses

| source | what it owns | relation to this article |
|---|---|---|
| **T. Kuwahara, arXiv:2610.15199** | the refutation: volume-law Rényi-α for all 0 < α < 1, in **every d ≥ 2** (finite range, fixed local dimension, bounded interactions, unique ground state, uniform gap, adiabatically connected); von Neumann area law coexisting; a **positive** worst-case trade-off for *approximate projectors* — optimal Schmidt rank exp[Õ((A log ε⁻¹)^{2/3})] for log ε⁻¹ ≳ A | external input, carried as `hKL`; **not** the boundary-linear log-rank no-go — not among his stated results per our surveys (`novelty/iter4-external-priorart.md` §2.4, abstract-level); the log-rank bridge is the fence's own content (N2a/N2b) |
| **A. Rényi (1961, Berkeley Symposium)** | the entropies; the monotonicity statement | N1 formalizes this textbook core — no mathematics claimed |
| **C. Beck, F. Schlögl (1993)** | the standard derivation of H_α monotonicity and H₀ = log‖supp‖ | N1–N2a formalize this layer — no mathematics claimed |
| Anshu–Harrow–Soleimanifar (2004.15009); Anshu–Arad–Gosset (1905.11337, 2103.02492); Abrahamsen et al. (2203.16012) | the positive program (entanglement spread; 2D area/sub-volume laws; 1D AGSP framework) | neighbors; the fence does not touch them |
| AxiomMath AreaLaw2D (`AreaLaw/Transfer.lean:361`, `PartialTrace.lean:25`, `State.lean:75,198`) | the formal area law — "first formal area law" belongs to it | Part II's positive side: the cross-encoding bridge |
| openai-math `PolynomialPEPS` (`PEPSFilters/Basic.lean:74–135`) | the `UniformAreaLaw` consumer | Part II's target interface |
| this project, articles 30/50 | the negative-results lineage | difference of kind per §1: 30 refuted our own conjecture; 50 Part I read our engine; here the refutation is external and hypothesized — the stated no-go is our increment |

Formal-prior-art corroboration: no **Rényi-entropy-for-states / H_α** definitions in
mathlib (on the pin — mathlib carries `Real.binEntropy` and topological entropy, a
different object class), in the AFP, or in circuit-level Coq libraries (external
prior-art survey, `novelty/iter4-external-priorart.md` §2.4). In-corpus nearest miss:
tauceti `TauCeti.renyiEntropy`
(`MeasureTheory/OptimalTransport/Wasserstein/RenyiEntropy.lean:120`) — the
CD(K,N)/Sturm **measure-theoretic** Rényi entropy, a different object class from N1's
distribution/quantum H_α (novelty re-verification 2026-11-21,
`novelty/r9-novelty-verification-iter6-round2.md`); the fence and the no-go billing
are unaffected. The entropy definition used here is the verification file's own.

## 5. Proofs

**Hölder workhorse (`sum_rpow_mul_le`).** For x, y ≥ 0 and θ ∈ [0, 1], weighted
AM–GM gives x^θ y^{1−θ} ≤ θx + (1 − θ)y. Summed over a finset with
normalization, this yields Σ f g ≤ (Σ f^{1/θ})^θ (Σ g^{1/(1−θ)})^{1−θ} in the
form needed.

**N1.** Put θ = (1 − β)/(1 − α) ∈ (0, 1]. Write p_i^β = (p_i^α)^θ · p_i^{1−θ},
since αθ + (1 − θ) = β. Hölder and Σ p = 1 give Σ p^β ≤ (Σ p^α)^θ. Take logs
(both sums are positive, because some p_i > 0) and divide by 1 − β > 0:
renyi p β = log Σ p^β/(1 − β) ≤ θ log Σ p^α/(1 − β) = log Σ p^α/(1 − α) =
renyi p α.

**N2a.** Apply the workhorse with g ≡ 1 on the support s:
Σ_{i∈s} p_i^α ≤ |s|^{1−α} (Σ p)^α = |s|^{1−α}. Take logs and divide by 1 − α.

**N2b.** The eigenvalues are nonnegative (PSD) and sum to 1, so N2a applies.
Mathlib's `Matrix.IsHermitian.rank_eq_card_non_zero_eigs` identifies the
support size with rank M.

**N3 (`nogo_core`).** If C = 0, then at n = 1 we get c ≤ x 1 ≤ y 1 ≤ 0,
contradicting c > 0. Otherwise choose N > C/c. Then c·N² ≤ x N ≤ y N ≤ C·b N ≤
C·N. Hence c·N ≤ C, contradicting N > C/c. N3a takes y = x; N3b takes
y = rankLogOf. ∎

Part II's links are transport proofs (entrywise re-indexing of the partial
trace, eigenvalue transport by proof irrelevance, an oriented-edge injection);
they are kernel-checked per the §6 formal record, with declarations at the
cited file:line.

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| N1 | `renyi_antiMono` | `pilots/72/C-neg.lean:188` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72/logs/axcheck-run1.log:24` |
| N2a | `renyi_le_log_card` | `pilots/72/C-neg.lean:231` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72/logs/axcheck-run1.log:25` |
| N2b | `renyi_le_log_rank` | `pilots/72/C-neg.lean:282` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72/logs/axcheck-run1.log:26` |
| N3a | `renyi_area_law_nogo` | `pilots/72/C-neg.lean:344` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72/logs/axcheck-run1.log:27` |
| N3b | `rank_area_law_nogo` | `pilots/72/C-neg.lean:354` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72/logs/axcheck-run1.log:28` |
| private helpers (`nogo_core`, `sum_rpow_mul_le`, `amgm2`, `div_rpow_eq`, `exists_pos_of_sum_eq_one`, `sum_rpow_pos`) | private declarations of `C-neg.lean` | `pilots/72/C-neg.lean` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72/logs/axcheck-run1.log:29–34` |
| link 1 | `ptrace_pureState_eq_reducedDensity` | `pilots/72-M1/P72M1T2.lean:303` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72-M1/logs/m1-axcheck-final.log:83` |
| link 2 | `regionEntropy_eq_vonNeumannEntropy` | `pilots/72-M1/P72M1T2.lean:330` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72-M1/logs/m1-axcheck-final.log:84` |
| link 3 | `boundaryCard_le_edgeBoundary` | `pilots/72-M1/P72M1T2.lean:164` | ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72-M1/logs/m1-axcheck-final.log:82` |
| transcription layer (statement re-exports) | `P72M1T1.lean` (702 lines) | `pilots/72-M1/P72M1T1.lean` | 52 axiom-lines ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72-M1/logs/m1-axcheck-final.log:25` |
| Part II file audit (28 printed axiom lines, incl. the one private declaration) | `P72M1T2.lean` | `pilots/72-M1/P72M1T2.lean` | 0 sorryAx, all ⊆ {propext, Classical.choice, Quot.sound} | `pilots/72-M1/logs/m1-axcheck-final.log:81` |

## 7. Limitations and open problems

1. **Dimension scope.** The formalized gate is the two-dimensional
   instantiation: volume exponent 2 against a linear boundary bound, in the
   same index. Kuwahara's refutation is dimension-general, but for d ≥ 3 the
   gate as formalized does not apply (§3, unformalized remark). The scalar
   core's argument would go through for any volume exponent q > 1 (c·N^q ≤ C·N
   fails at large N once q > 1), and indexing a d ≥ 3 family by boundary size
   b would instantiate q = d/(d−1); generalizing `nogo_core` to c·n^p for
   p > 1 and re-running the axiom audit is future work. (Unformalized.)
2. The gate covers rank and all α < 1. It says nothing about α ≥ 1 — note that
   Kuwahara's examples *satisfy* a von Neumann (α = 1) area law, so α = 1 is
   the sharp threshold in his class. The research dossier's purity-certificate
   route (`research/candidates/72-area-law-inertial-defect.md`) lives there
   and remains a hypothesis-grade objective.
3. `hKL` is an informal input. Formalizing Kuwahara's construction would
   discharge it.
4. Part II's link 4 and the interface theorem are open. Until they are proved,
   openai's `MainStatement` still carries `UniformAreaLaw` as a hypothesis.
5. Statement scope (underclaims, safe direction): N1 is stated for
   0 < α ≤ β < 1 — the range the rank argument needs — rather than for all
   α, β ≠ 1, and N3 is stated as concrete-family contradictions rather than a
   general "∀ f" schema.

## 8. Prior work and references

(a) Literature.

1. T. Kuwahara, *The Rényi area law conjecture is false below α = 1 in high
   dimensions*, arXiv:2610.15199 (quant-ph), v1 2026-10-10.
2. A. Rényi, *On measures of entropy and information*, Berkeley Symposium on
   Mathematical Statistics and Probability, 1961.
3. C. Beck, F. Schlögl, *Thermodynamics of Chaotic Systems*, Cambridge
   University Press, 1993.
4. A. Anshu, A. W. Harrow, M. Soleimanifar, arXiv:2004.15009. A. Anshu,
   I. Arad, D. Gosset, arXiv:1905.11337, arXiv:2103.02492. Abrahamsen et al.,
   arXiv:2203.16012.

Entries 2–3 are standard bibliographic entries; the corpus's bibliographic
card set (`qa/iter4-review/r7-bib-cards.md` §C) holds cards C.1–C.5 for other
works (Bansal–Maji, Kuwahara, Lamzouri, Knausgård, Liu) and none for Rényi or
Beck–Schlögl.

(b) Project artifacts.

- Verification files: `research/pilots/72/C-neg.lean`;
  `research/pilots/72-M1/P72M1T1.lean`; `research/pilots/72-M1/P72M1T2.lean`.
- Logs: `research/pilots/72/logs/axcheck-run1.log`;
  `research/pilots/72-M1/logs/m1-axcheck-final.log`.
- Specification: `research/pilots/72-M1/L3-spec.md`.
- Research dossier: `research/candidates/72-area-law-inertial-defect.md`;
  prework `research/pilots/72-prework.md` (Appendix A); bridge
  `research/bridges/area-law.md`.
- Prior-art surveys: `research/novelty/round-4.md` §2;
  `research/novelty/iter4-external-priorart.md` §2.4; bibliographic card for
  the donor: `research/qa/iter4-review/r7-bib-cards.md` §C.2.
- Sibling articles: 01 (`01-inertial-defect-master-identity.md`),
  30 (`30-boson-operators-second-difference-closed-form.md`),
  50 (`50-zero-free-regions-cannot-move-certificate-constants.md`).
