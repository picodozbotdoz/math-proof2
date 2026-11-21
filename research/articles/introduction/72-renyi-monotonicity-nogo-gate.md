# A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws](../72-renyi-monotonicity-nogo-gate.md).
> Audience: an undergraduate mathematics background — no Lean, no quantum physics, no
> exposure to this project assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state.

## 1. In plain words

In quantum many-body physics, an "area law" says the entropy of a region of a system grows
like the size of its boundary, not its volume. Rényi entropies are a one-parameter family
of entropy measures; the famous von Neumann entropy is the α = 1 member. A recent paper
(Kuwahara, arXiv:2610.15199) proves that below α = 1, area laws fail dramatically in a
broad class of quantum systems: the Rényi entropy of a region grows like its volume. This
article does not re-prove or claim that refutation. It builds a machine-checked "fence"
around it: a small set of exact statements — monotonicity of Rényi entropy, an
entropy ≤ log(rank) support bound, and a no-go gate saying that a volume law together with
a boundary-linear area law is self-contradictory — arranged so that the moment any
construction supplies Kuwahara's volume law as a hypothesis, every matching boundary-linear
log-rank area law is automatically refuted. None of the proved content uses physics: it is
one inequality (Hölder), a support bound, and a contrapositive.

## 2. The background, in one page

### 2.1 Entropy of a probability vector (classical)

For p = (p₁, …, p_m) with pᵢ ≥ 0 and Σ pᵢ = 1, Shannon's entropy H(p) = −Σ pᵢ ln pᵢ
measures spread: uniform on m outcomes gives ln m; concentrated gives near 0. Rényi (1961)
introduced a one-parameter family: for α ≠ 1,

  S_α(p) = (1/(1−α)) · ln Σᵢ pᵢ^α.

At α → 1 it recovers Shannon's entropy. (classical)

### 2.2 Monotonicity in α (classical)

For 0 < α ≤ β, S_β(p) ≤ S_α(p): larger α emphasizes the big probabilities, so the value
drops as α rises. This is the article's Theorem N1 — a textbook fact, here kernel-checked.

### 2.3 Quantum states, reduced states, rank (classical)

A pure state Ω of a system split into a region A and its complement has a **reduced
density matrix** ρ_A — a Hermitian, positive-semidefinite matrix with eigenvalues summing
to 1 — describing everything observable inside A. Its von Neumann entropy is the Shannon
entropy of its eigenvalues. The **Schmidt rank** of Ω across the cut is the number of
nonzero eigenvalues of ρ_A — the smallest number of terms needed to write Ω across the
cut. An **area law** bounds the entropy of ρ_A by a constant times the boundary size |∂A|
of the region.

### 2.4 Kuwahara's refutation, and the missing statement

Kuwahara's theorem (external, paper-level): in every spatial dimension d ≥ 2, a broad
class of finite-range, uniformly gapped, unique-ground-state systems has volume-law
Rényi-α entropy for every 0 < α < 1 — entropy like the region's volume, not its boundary.
Two things are absent from every source the article surveyed: the observation that such a
volume law, fed through the support bound S_α ≤ log(rank), kills every boundary-linear
log-rank area law along the family; and any machine-checked statement of that no-go. The
article's core question: can the no-go be stated exactly, at the generality of arbitrary
boundary functions, and kernel-verified — so that any future encoding, region family, or
boundary convention can plug in?

## 3. One example, by hand

First, the entropy definition itself, on p = (3/4, 1/4):

- S_{1/2}(p) = 2·ln(√(3/4) + √(1/4)) = 2·ln((√3 + 1)/2) ≈ 2·ln(1.36603) ≈ **0.6238**.
- S_{3/4}(p) = 4·ln((3/4)^{3/4} + (1/4)^{3/4}) ≈ 4·ln(0.80593 + 0.35355) ≈ 4·ln(1.15948)
  ≈ **0.5919**.

So S_{3/4} < S_{1/2} — Theorem N1's monotone decrease, on display. Theorem N2a's support
bound: the support has size 2, and 0.5919 ≤ 0.6238 ≤ ln 2 ≈ 0.6931. ✓

Second, the gate's engine (the proof of N3a in the article's §5), run at concrete values.
Take c = 1 (volume constant) and C = 10 (area constant), and suppose functions renyiOf,
bndOf satisfied all three hypotheses. The proof splits in two cases:

- If C = 0: at n = 1 the chain c·1² ≤ renyiOf 1 ≤ C·bndOf 1 ≤ 0 gives 1 ≤ 0 — against
  c > 0.
- Otherwise pick N > C/c, i.e. N > 10; take N = 11. Volume law: renyiOf 11 ≥ 1·11² = 121.
  Boundary: bndOf 11 ≤ 11. Area law: renyiOf 11 ≤ 10·bndOf 11 ≤ 110. So 121 ≤ 110 —
  false. No such functions exist: the three hypotheses are jointly contradictory
  (the formal conclusion is `False`).

The point of the gate: no physics enters this arithmetic. Kuwahara's theorem would supply
the volume law (renyiOf n ≥ c·n²) as the hypothesis hKL; the gate does the rest.

*Provenance:* the entropy definition, the N1/N2a statements, and the two-case N3 argument
are article-recorded (article §2, §3 Theorems N1–N3a, §5). The decimal values 0.6238,
0.5919, 0.6931 and the gate arithmetic at (c, C, N) = (1, 10, 11) are hand-computed from
those recorded definitions and proofs; the article records no numeric witnesses of its own,
and none is invented.

## 4. How the proof works, without Lean

The workhorse is Hölder's inequality, derived from weighted AM–GM: for x, y ≥ 0 and
θ ∈ [0, 1], x^θ y^{1−θ} ≤ θx + (1−θ)y, summed against a normalization. For N1, write
pᵢ^β = (pᵢ^α)^θ · pᵢ^{1−θ} with θ = (1−β)/(1−α) (so that αθ + (1−θ) = β); Hölder gives
Σ p^β ≤ (Σ p^α)^θ, and taking logs against the positive denominators 1 − β, 1 − α yields
S_β ≤ S_α. For N2a, apply the same workhorse with the second factor identically 1 on the
support: Σ pᵢ^α ≤ |s|^{1−α}, and log/divide. N2b is N2a applied to the eigenvalue vector
of a Hermitian positive-semidefinite matrix (nonnegative, summing to 1), with mathlib's
rank-equals-support lemma identifying the support size with the rank. N3 is the two-case
contrapositive computed above. Part II's three links are transport proofs: entrywise
re-indexing of the partial trace, eigenvalue transport, and an oriented-edge injection
that beats the expected constant by a factor of 4 (constant 1).

## 5. What the main results say, informally

- **Theorem N1 (`renyi_antiMono`).** For a probability vector and 0 < α ≤ β < 1:
  S_β ≤ S_α. PROVED-UNCONDITIONAL. → article §3, N1.
- **Theorem N2a (`renyi_le_log_card`).** For 0 < α < 1: S_α ≤ ln(support size).
  PROVED-UNCONDITIONAL. → article §3, N2a.
- **Theorem N2b (`renyi_le_log_rank`).** For a Hermitian, positive-semidefinite M with
  eigenvalues summing to 1 and 0 < α < 1: S_α(eigenvalues M) ≤ ln(rank M); for a reduced
  density matrix ρ_A of a pure state, rank M is the Schmidt rank across the cut.
  PROVED-UNCONDITIONAL. → article §3, N2b.
- **Theorem N3a (`renyi_area_law_nogo`).** For 0 < α < 1 (a carried parameter, unused in
  the proof), c > 0, C ≥ 0 and functions renyiOf, bndOf : ℕ → ℝ, the three hypotheses —
  hKL: c·n² ≤ renyiOf n for all n (the volume law; supplied by Kuwahara's construction,
  the named external hypothesis), hBnd: bndOf n ≤ n for all n, hArea: renyiOf n ≤ C·bndOf n
  for all n — are jointly contradictory; the conclusion is `False`. PROVED-CONDITIONAL on
  hKL, hBnd, hArea. A hypothesis here is a named assumption the formal theorem carries as
  an explicit binder; the kernel proof is complete relative to it, and the article names
  hKL without discharging it (formalizing Kuwahara's construction would). → article §3,
  N3a.
- **Theorem N3b (`rank_area_law_nogo`).** The same with an intermediate rankLogOf and the
  extra hypothesis hMono: renyiOf n ≤ rankLogOf n (supplied per instance by N2b); the
  area-law hypothesis now binds the intermediate, hArea: rankLogOf n ≤ C·bndOf n — a
  volume-law Rényi family refutes every boundary-linear log-rank law. PROVED-CONDITIONAL
  on hKL, hBnd, hArea, hMono. The α-binders are unused, so both gates hold for every α. →
  article §3, N3b.
- **Scope of the gate.** Formalized for two dimensions: volume exponent 2 against a linear
  boundary bound in the same index (n = side length of a square region). Kuwahara's
  refutation is dimension-general, but for d ≥ 3 the boundary exceeds the side, hBnd fails
  as stated, and no indexing of a d ≥ 3 family satisfies both hKL and hBnd — d ≥ 3 is
  open (unformalized remark, article §3). → article §3, §7.
- **Part II, links 1–3** (`ptrace_pureState_eq_reducedDensity`,
  `regionEntropy_eq_vonNeumannEntropy`, `boundaryCard_le_edgeBoundary` with constant 1):
  AreaLaw2D's reduced states/entropies equal openai-math's PEPS encodings'.
  PROVED-UNCONDITIONAL. → article §3, Part II.
- **Link 4 and the interface theorem** (`interface_areaLaw_uniformAreaLaw`): **not article
  claims** — open for future work (spec `pilots/72-M1/L3-spec.md`); until they are proved,
  openai's `MainStatement` still carries `UniformAreaLaw` as a hypothesis. → article §3,
  Part II, §7.
- **What is *not* here:** any re-proof or ownership of Kuwahara's refutation; any claim
  about α ≥ 1 (his examples satisfy a von Neumann area law — α = 1 is the sharp threshold
  in his class). → article §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| p : ι → ℝ | probability vector: p ≥ 0, Σ p = 1 | (3/4, 1/4) |
| α, β | the Rényi order parameters, here in (0, 1) | α = 1/2, β = 3/4 |
| renyi p α = S_α | (1/(1−α))·ln Σ pᵢ^α | S_{1/2}(3/4,1/4) ≈ 0.6238 |
| von Neumann entropy | the α = 1 member (Shannon of the eigenvalues) | survives in Kuwahara's class |
| ln | the natural logarithm (mathlib's `log`) | ln 2 ≈ 0.6931 |
| M Hermitian, PSD | matrix equal to its conjugate transpose; nonnegative eigenvalues | a reduced density matrix |
| rank M | number of nonzero eigenvalues | Schmidt rank for pure states |
| ρ_A | reduced density matrix of region A | — |
| \|∂A\|, bndOf n | boundary size of a region; its abstract stand-in | ≤ n in the 2D indexing |
| renyiOf n | abstract stand-in for S_α of the region's reduced state | ≥ c·n² under hKL |
| rankLogOf n | intermediate bound fed by N2b | log of the Schmidt rank |
| hKL, hBnd, hArea, hMono | the gate's named hypothesis binders | volume law; boundary ≤ n; area law; rank monotone |
| `False` | the formal conclusion of N3a/N3b: the hypotheses cannot all hold | — |
| Hölder | Σ fg ≤ (Σ f^{1/θ})^θ (Σ g^{1/(1−θ)})^{1−θ} | the whole engine of N1/N2a |
| PEPS, `UniformAreaLaw` | openai-math's tensor-network encoding and its assumed area law | Part II's consumer |
| AreaLaw2D | AxiomMath's formal 2D area law from a global spectral gap | Part II's source side |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL / -CONDITIONAL | kernel-checked beyond the triad only / relative to named binders | N1 / N3a |

## 7. What this is — and what it is not

- Rényi entropy is Alfred Rényi's 1961 information measure — not the "Rényi" of statistics
  name associations, and α here is the entropy order, not a significance level.
- "Area law" is quantum many-body physics (entropy of a region vs its boundary); the
  formalized gate, however, is a statement about functions ℕ → ℝ — no geometry, no Hilbert
  spaces, no physics inside the proofs.
- The refutation is Kuwahara's, carried as the hypothesis hKL; this article's own claims
  are the stated no-go (N3a/N3b) and its verification, plus the fence lemmas N1/N2a/N2b.
- The gate is the two-dimensional instantiation; d ≥ 3 stays open, and the article says so
  in both §3 and §7 rather than claiming the dimension-general no-go.
- "Kernel-verified" means every theorem was machine-checked term by term by the Lean type
  checker against fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the
  full set used by every row of the article's table.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract.
- Formal statements → article §3, with the glossary (§6 here) open.
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (formal record), `research/pilots/72/C-neg.lean`,
  `research/pilots/72-M1/P72M1T{1,2}.lean`, and the cited logs.
- Novelty and nearest misses → article §4 (the Kuwahara row; the Rényi/Beck–Schlögl
  attribution).
- What stays open → article §7: d ≥ 3, the hKL formalization, α ≥ 1, and Part II's
  link 4 and interface theorem.

## 9. What you need going in

- Natural logarithm and exponentials; manipulating sums of powers p^α.
- The AM–GM idea "weighted average ≥ geometric mean", at statement level only.
- Eigenvalues and rank of a Hermitian matrix, in one sentence each.
- What a hypothesis binder is (one sentence, §5 above) — nothing else about Lean.
- Comfort with a statement whose conclusion is literally "these assumptions contradict
  each other" (`False`) — the standard formal shape of a no-go.
