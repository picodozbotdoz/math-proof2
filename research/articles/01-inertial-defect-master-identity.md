# An Exact Five-Defect Identity for the Rank–Trace Inequality

*cross-math-fronttier research article 01 · 2026-11-09 · dossier
`research/candidates/01-ez1-inertial-defect-master-identity.md` · Lean pilot
`research/pilots/01/`*

**Status: PROVED, unconditional, kernel-verified** (mathlib `ff2494ea`, Lean
`v4.36.0-rc2`; `#print axioms` = `[propext, Classical.choice, Quot.sound]`; no `sorry`,
no `native_decide`, no external CAS).

---

## Abstract

The rank–trace inequality ("Lemma R") of the zeta23 zero-density programme bounds a
quadratic certificate built from a positive semidefinite Gram-type matrix `P` and a
Hermitian perturbation `Q`:

  2c·tr(P+Q) − ‖P+Q‖²_F ≤ Σ_j k_c(m_j‖v_j‖²) + c²·n₊(Q).

It is proved in the donor corpus by a `linarith` over four separately established
inequalities, so it carries no information about *where* the slack sits. We prove that the
inequality is the shadow of an **exact identity**: ‖P+Q‖²_F equals the right-hand certificate
plus five explicitly defined, individually nonnegative defects (a scalar pairing defect, a
Schur–Jensen defect, a von Neumann rearrangement defect, a positive-coupling defect and a
pair-block defect). We further prove that on the extremal configuration behind the donor's
tightness lemma all five defects vanish *simultaneously*. Both theorems, together with a
re-derivation of the donor inequality from the identity (a faithfulness anchor), are
kernel-checked in Lean 4 against current mathlib.

## 1. Introduction

The anthropics `zeta23` corpus proves that at least 2/3 of the nontrivial zeros of ζ are
simple and on the critical line (via an Alpöge–Furman-style certificate argument). Its
linear-algebra layer `Zeta23/LinAlg` + `Zeta23/ZeroSide/RankTraceMult.lean` culminates in
`rank_trace_mult` / `rank_trace_mult_k`: an upper bound on a certificate functional in terms
of a convex penalty `k_c` and the positive index `n₊(Q)`. The bound is used one-sidedly;
equality questions (when is it sharp, how much is lost) are answered only for one special
configuration (`lemmaR_tight`).

The tauceti library, independently, owns the classical perturbation layer (Weyl, Ky Fan,
Hoffman–Wielandt) but no rank–trace certificate. The bridge map
(`research/bridges/linear-algebra.md`, empty zone EZ1) observed that the donor proof is a
sum of four inequalities each of which is the nonnegativity of an *explicit* quantity, so an
identity must exist. This article states and proves it.

**Contribution.**
1. *Theorem 1 (master identity)* — an exact decomposition with five named defects.
2. *Theorem 2 (nonnegativity)* — each defect is ≥ 0, recovering the donor inequality.
3. *Theorem 3 (simultaneous tightness)* — on the TightMult configuration all five defects
   vanish, a strictly finer statement than the known equality case.

## 2. Setting and notation

Let `𝕜 ∈ {ℝ, ℂ}` (any `RCLike` field), `n`, `ι` finite index types, `d = |n|`. For Hermitian
`A` let `λ↓(A) ∈ ℝ^d` be its eigenvalues in decreasing order, `n₊(A)` the number of strictly
positive eigenvalues, and `A = A₊ − A₋` its spectral decomposition into positive and negative
parts (`A₊, A₋ ⪰ 0`, `A₊A₋ = 0`). Write `rtr A = Re tr A` and `‖A‖²_F = Re tr(AᴴA)`.

Fix `c > 0` and define the scalar functions

  g_c(x) = x² − c·x − ((x − c)₊)²,  k_c(x) = c·x − g_c(x) = c² − ((c − x)₊)²,

  Δ_c(p, m) = (p − m)² − c·p − g_c(p) + 2c·m.

`g_c` is convex (its derivative `2x − c` for `x ≤ c`, `c` for `x ≥ c`, is nondecreasing) and
`g_c(0) = 0`. Explicitly `Δ_c(p,m) = m(m + 2(c − p))` for `p ≤ c` and `(p − c − m)²` for
`p ≥ c`, so `Δ_c(p, m) ≥ 0` whenever `p, m ≥ 0`.

**Inputs.** Atoms `m : ι → ℝ_{≥0}` and vectors `v : ι → 𝕜^n`, `x_j = ‖v_j‖²`, and

  P = Σ_j m_j v_j v_jᴴ  (⪰ 0),  Q Hermitian.

Let `p = λ↓(P)`, `μ = λ↓(Q₋)`, and `π = n₊(Q)`.

## 3. Main results

**Definition (the five defects).**

| symbol | name | definition |
|---|---|---|
| Δ_pt | pairing defect | Σ_k Δ_c(p_k, μ_k) |
| Δ_SJ | Schur–Jensen defect | Σ_k g_c(p_k) − Σ_j g_c(m_j x_j) |
| Δ_vN | rearrangement defect | Σ_k p_k μ_k − Re tr(P Q₋) |
| Δ₊ | positive-coupling defect | 2·Re tr(P Q₊) |
| Δ_Q+ | pair-block defect | Σ_{λ_i(Q) > 0} (λ_i(Q) − c)² |

**Theorem 1 (master identity).** For all `m, v, Q` as above and every `c > 0`,

  ‖P + Q‖²_F = c·rtr P + Σ_j g_c(m_j x_j) + 2c·rtr Q − c²·π
       + Δ_pt + Δ_SJ + 2·Δ_vN + Δ₊ + Δ_Q+.

Equivalently (using `k_c = c·x − g_c` and `rtr P = Σ_j m_j x_j`):

  2c·rtr(P+Q) − ‖P+Q‖²_F = Σ_j k_c(m_j x_j) + c²·π − (Δ_pt + Δ_SJ + 2Δ_vN + Δ₊ + Δ_Q+).

**Theorem 2 (nonnegativity; donor inequality recovered).** If `m_j ≥ 0` for all `j`, every
defect is nonnegative. Consequently, for every budget `b ≥ n₊(Q)`,

  2c·rtr(P+Q) − ‖P+Q‖²_F ≤ Σ_j k_c(m_j x_j) + c²·b,

which is exactly the donor theorem `rank_trace_mult_k`.

**Theorem 3 (simultaneous tightness).** Let `r, b ∈ ℕ`, `m : Fin r → ℕ` with `m_j ≤ c`, and
consider the TightMult configuration on the index set `Fin r ⊕ Fin b`: `v_j = e_{inl j}`
(on-line atoms of integer multiplicity `m_j` on orthonormal vectors) and
`Q = diag(0_r, c·I_b)` (`b` pair-blocks). Then

  Δ_pt = Δ_SJ = Δ_vN = Δ₊ = Δ_Q+ = 0.

In words: the extremal configuration is not merely one where the *sum* of the slack
vanishes (which is what equality in the inequality says); each of the five independent
mechanisms of loss is individually switched off.

## 4. Proofs

**Proof of Theorem 1.** Since `Q = Q₊ − Q₋` with `Q₊Q₋ = 0`,

  ‖P+Q‖² = ‖P‖² + 2Re tr(PQ₊) − 2Re tr(PQ₋) + ‖Q₊‖² + ‖Q₋‖².   (1)

By unitary invariance `‖P‖² = Σ p_k²` and `‖Q₋‖² = Σ μ_k²`; by definition of Δ_vN,
`Re tr(PQ₋) = Σ p_k μ_k − Δ_vN`. Hence

  ‖P‖² − 2Re tr(PQ₋) + ‖Q₋‖² = Σ_k (p_k − μ_k)² + 2Δ_vN.   (2)

By definition of Δ_c, `(p_k − μ_k)² = Δ_c(p_k, μ_k) + c p_k + g_c(p_k) − 2c μ_k`; summing,
and using `Σ p_k = rtr P`, `Σ μ_k = rtr Q₋`, and the definition of Δ_SJ,

  Σ_k (p_k − μ_k)² = Δ_pt + c·rtr P + Σ_j g_c(m_j x_j) + Δ_SJ − 2c·rtr Q₋.   (3)

Finally, expanding the square in Δ_Q+ over the π positive eigenvalues `q_i` of `Q`,
`‖Q₊‖² = Σ q_i² = Δ_Q+ + 2c·rtr Q₊ − c²π`.   (4)

Substituting (2)–(4) into (1) and using `rtr Q = rtr Q₊ − rtr Q₋` gives the identity. ∎

**Proof of Theorem 2.** (i) `Δ_pt ≥ 0` termwise because `p_k, μ_k ≥ 0` (both `P` and `Q₋`
are PSD). (ii) `Δ_SJ ≥ 0`: the numbers `m_j x_j` are the diagonal entries of the Gram matrix
`WᴴW` (columns `√m_j v_j`), whose nonzero spectrum coincides with that of `P = WWᴴ`; by
Schur–Horn the diagonal is majorized by the spectrum, and `g_c` is convex with `g_c(0) = 0`.
(iii) `Δ_vN ≥ 0` is von Neumann's trace inequality for the PSD pair `(P, Q₋)`. (iv)
`Δ₊ = 2Re tr(P^{1/2} Q₊ P^{1/2}) ≥ 0`. (v) `Δ_Q+` is a sum of squares. Dropping the defects
in the k-form of Theorem 1 and using `π ≤ b` gives the donor inequality. ∎

**Proof of Theorem 3.** On the TightMult configuration, the donor lemma `lemmaR_tight`
states that the inequality of Theorem 2 holds with equality at `b = n₊(Q) = b`. Comparing
with Theorem 1, the *weighted sum* `Δ_pt + Δ_SJ + 2Δ_vN + Δ₊ + Δ_Q+` is zero; since each
summand is nonnegative (Theorem 2), each is zero. ∎

The proofs are short once the five defects are named. The content of the result is the
choice of defects: each is a classical inequality's slack, they are mutually independent
mechanisms (spectral pairing, majorization, rearrangement, cross-coupling, block
deviation from `c`), and together they account for *all* of the slack.

## 5. Formal verification

| item | value |
|---|---|
| file | `research/pilots/01/port/10_TightMult.lean` (2,234 LoC: verbatim donor port 01–08 + identity layer + TightMult port + tightness) and `port/09_MasterIdentity.lean` (identity alone) |
| identity | `CrossMath.RankTraceDefect.master_identity` |
| defects | `pairingDefect`, `schurJensenDefect`, `rearrangementDefect`, `posCouplingDefect`, `pairBlockDefect` with `*_nonneg` lemmas |
| anchor | `CrossMath.RankTraceDefect.rank_trace_mult_k_of_master` — the donor statement `rank_trace_mult_k` re-derived from the identity |
| tightness | `CrossMath.RankTraceDefect.tightness_of_master` |
| axioms | `[propext, Classical.choice, Quot.sound]` for all of the above and the ported spine (`rank_trace_ineq`, `rank_trace_mult(_k)`, `vonNeumann_trace_ineq`, …) |
| evidence | blueprint run logs `research/pilots/01-blueprint.md` §6b–§6d; Modal logs `research/pilots/01/logs/`; final-sweep axcheck `research/pilots/01/logs/axcheck-final.log` |

The donor bundle (9 zeta23 files, Apache-2.0, copyright Anthropic PBC) was ported verbatim
from Lean v4.33 to v4.36 with **zero** fix cycles; the new layer (~320 LoC) took six fix
cycles. The Lean proof of `master_identity` is the `linarith` combination of five split
lemmas (`frob_split_rearrangement`, `pairing_split`, `schurJensenSplit`, `pairBlock_split`,
`frobSq_add_eq`), mirroring §4 line by line.

## 6. Relation to prior work

- **Donor.** zeta23 `rank_trace_mult(_k)` and `lemmaR_tight` (anthropics_formal-math); our
  Theorem 2 is their theorem, Theorem 3 refines their equality lemma.
- **Alpöge–Furman v2** (arXiv:2608.13637v2), Lemma 3.2 states the base-lemma equality case
  `P = Π₁, Q = 2Π₂` and §7.2(b) discusses downstream sharpness. Our delta is the
  *five-defect simultaneous* characterization and the exact identity itself.
- **Equality-case literature** (So; Golden–Thompson; Carlen 2010; Ipsen–Saibaba 2025)
  contains no defect decomposition of this certificate (novelty round 2, R8).
- **Knausgård** (arXiv:2609.33043, repo `kristianmk/839`) formalizes a "nonnegative
  correction from overlaps" move resembling Δ₊; his theorem has no Frobenius/rank/inertia
  structure and does not subsume the identity. We make **no** claim of improved
  zero-density constants: that race is lost (see `research/novelty/VERDICTS.md`).
- **Lamzouri** (arXiv:2609.02882v2) gives a matrix-free route that may make the identity's
  number-theoretic consumers unnecessary; its standalone linear-algebra content stands.

## 7. Limitations and open directions

- The corollaries A2 (diagonal-dominance gain, with `Δ₊ = 0 ⇔ PQ₊ = 0`), A3 (`n₋(Q)`
  tail-mass refinement `‖P+Q‖² ≥ cert + T²/(d−r)`), the converse of A4 (all defects vanish
  ⇒ TightMult-type structure) and A5 (polarized form) are stated in the dossier but **not**
  formalized.
- The identity is an equality of real numbers; a module-level (operator) refinement that
  would give a "defect certificate" usable inside the zero-density engine is open.
- Upstreaming: the defect layer is mathlib-ready modulo naming; the donor port is
  zeta23-specific.

## References

- anthropics_formal-math, `zeta23/Zeta23/LinAlg/*.lean`, `zeta23/Zeta23/ZeroSide/RankTraceMult.lean`
  (`rank_trace_mult` :281, `rank_trace_mult_k` :369, `sq_sub_ge_gc` :81),
  `ZeroSide/TightMult.lean` (`lemmaR_tight`).
- L. Alpöge, A. Furman, arXiv:2608.13637v2. K. Knausgård, arXiv:2609.33043. Y. Lamzouri,
  arXiv:2609.02882v2.
- J. von Neumann, *Some matrix-inequalities and metrization of matric-space* (1937); I. Schur
  (1923) / A. Horn (1954) on diagonal majorization.
