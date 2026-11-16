# R2 rewrite proposal — article 72, full refocus (fence, not refutation)

Lane R2, 2026-11-16, per the adopted restructuring plan (§8: 72 → REWRITE-FULL,
technical record) and edits R4 + A3 of `r2-discovery-strength.md` §7. Complete
replacement article text for H/R3 to splice; `[R3-FILL]` marks cells to re-verify
against `research/pilots/72/logs/` and `research/pilots/72-M1/logs/` before promotion.
Attribution architecture: **Kuwahara's theorem is the no-go; our contribution is the
kernel-verified fence (N1–N3) and the cross-encoding interface layer.**

## Replacement article text (`research/articles/72-renyi-monotonicity-nogo-gate.md` — filename may stay; H may prefer `72-renyi-fence-kuwahara.md`, S–M sweep)

# A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws (with the Family-265 Interface Layer)

*cross-math-fronttier research article 72 (Iter-4 edition) · technical record · dossier
`research/candidates/72-area-law-inertial-defect.md` · prework
`research/pilots/72-prework.md` (Appendix A) · Lean `research/pilots/72/C-neg.lean`,
`research/pilots/72-M1/P72M1T{1,2}.lean` · bridge `research/bridges/area-law.md`*

**Status: PROVED, FINAL — fence, not refutation.** The refutation is Kuwahara's
theorem (arXiv:2610.15199, carried here as the hypothesis `hKL`); N1–N2 are textbook
inequalities; our contribution is the kernel-verified gate N3 and the interface chain
of Part II. Part I: 369 lines, 11 theorems (5 public), each with axioms exactly
`[propext, Classical.choice, Quot.sound]`. Part II: the first two links of the
AreaLaw2D → openai-math interface chain, kernel-clean; the gap transfer and the
interface theorem itself carry to Iteration 4.

---

## Abstract

Kuwahara (arXiv:2610.15199, October 2026) disproved the Rényi area-law conjecture below
α = 1: he constructed 2D finite-range, uniformly gapped Hamiltonians with unique ground
states whose Rényi-α entanglement entropy obeys a volume law for every 0 < α < 1, while
a von Neumann area law still holds. The log-rank consequence — no bound of the form
log(Schmidt rank of ρ_A) ≤ C·|∂A| can hold for all such ground states — is an immediate
corollary of his theorem, since log rank = S₀ ≥ S_α; his paper states rank trade-offs
of its own. **The refutation is his; the fence is ours.** We make the corollary a
permanent, machine-checked fence around the statement shape, so that no future
"spectral gap ⇒ rank concentration" proposal can be stated without confronting it:

- **(N1)** S_β(p) ≤ S_α(p) for 0 < α ≤ β < 1, for every probability vector p;
- **(N2)** S_α ≤ log #supp p; for a Hermitian PSD matrix with unit eigenvalue sum,
  S_α(eigenvalues) ≤ log rank;
- **(N3)** two gate theorems: a family whose α-entropy grows like c·n² with boundaries
  of size ≤ n refutes every boundary-linear Rényi-α law (N3a) and, via N2, every
  boundary-linear log-rank law (N3b).

Kuwahara's construction enters only as the hypothesis `hKL`. Part II records the
positive companion: the first kernel-checked identification of AxiomMath AreaLaw2D's
reduced density matrices and entropies with openai-math's PEPS encodings on the L×L
grid, and the comparison of the two boundary counts at constant 1.

## 1. Introduction

[Adapted from the current §1; keep the bridge-map framing. Replace the sentence
"It is false." (current :49) with:] The tempting headline "spectral gap ⟹ rank
concentration" is false — **by Kuwahara's theorem**. The novelty sweep
(`novelty/round-4.md` §2) found his refutation; this article does not re-prove it or
claim it. What the corpora lacked was the fence: the refutation's consequence for rank,
stated at the generality of arbitrary boundary functions and machine-checked, so the
no-go survives contact with any future encoding, region family, or boundary
convention. [Keep the articles-30/50 lineage sentence but qualify:] in the tradition of
the project's negative results — with the difference that 30 refuted a conjecture
formulated *here* and 50 Part I read our target engine, whereas here the refutation is
external and enters as `hKL`.

**Honesty.** Part I uses no physics, no gap hypothesis and no geometry: it is a Hölder
inequality, a support bound, and a contrapositive. The informal input that makes the
gate bite is Kuwahara's, carried as a hypothesis. Part II is glue-grade: two encodings
of the same objects, proved equal.

## 2. Setting

[Verbatim from current §2: probability vectors, `renyi p α`, eigenvalue convention,
`C-neg.lean:52` self-owned definition, mathlib-has-no-quantum-entropies note.]

## 3. Part I — results (the fence)

[Verbatim from current §3: N1 `renyi_antiMono`, N2a `renyi_le_log_card`,
N2b `renyi_le_log_rank`, N3a `renyi_area_law_nogo`, N3b `rank_area_law_nogo`, with the
Reading paragraph re-labeled from "Reading." to "Reading (whose theorem bites)." —
change "Take n = side length … in Kuwahara's family" to "…in the hypothesized
Kuwahara family (`hKL`); the gate fires the moment his theorem supplies the family."]

## 4. Part I — proofs

[Verbatim from current §4: Hölder workhorse `sum_rpow_mul_le`, N1, N2a, N2b, N3
`nogo_core`.]

## 5. Part II — the family-265 interface layer (M1)

[Verbatim from current §5, links 1–4 and the vendor-layer paragraph. The interface
theorem framing is unchanged: glue with a real consumer.]

## 6. Formal verification

| file | content | size | run | axioms |
|---|---|---|---|---|
| `pilots/72/C-neg.lean` | N1–N3 | [R3-FILL — carry-over: 369 lines, 11 thms; `run8-final.log` rc=0, 0 err, 0 sorry; descent 20→…→0 over 8 runs] | [R3-FILL] | [R3-FILL — carry-over: `axcheck-run1.log` 11/11 triad] |
| `pilots/72-M1/P72M1T1.lean` | vendor statement layer | [R3-FILL — carry-over: 702 lines; `m1-run8-GREEN.log`] | [R3-FILL] | [R3-FILL — carry-over: 52 lines ⊆ triad] |
| `pilots/72-M1/P72M1T2.lean` | links 1–3 | [R3-FILL — carry-over: 360 lines, 25 thms; descent 24→10→1→0] | [R3-FILL] | [R3-FILL — carry-over: 28 lines ⊆ triad] |

Cycle-2 final sweep: [R3-FILL — carry-over: `AxPilot72_Cneg`, `AxPilot72_M1_T1`,
`AxPilot72_M1_T2` OK, 0 sorryAx, `pilots/72{,-M1}/logs/axcheck-c2-final.log`].
Deviations from design: [R3-FILL — carry over the three documented deviations from
current §6 verbatim].

## 7. Relation to prior work (attribution architecture)

- **T. Kuwahara, arXiv:2610.15199 — the no-go itself.** Volume-law Rényi-α for all
  0 < α < 1 (finite range, fixed local dimension, unique ground state, uniform gap),
  von Neumann area law coexisting, and worst-case rank-error trade-offs for approximate
  ground-state projectors (his abstract). The log-rank corollary N3b is immediate from
  his volume law via S₀ ≥ S_α; whether he prints it, his theorem proves it. Nothing in
  Part I competes with or extends his result.
- **Anshu–Harrow–Soleimanifar (arXiv:2004.15009); Anshu–Arad–Gosset (1905.11337,
  2103.02492); Abrahamsen et al. (2203.16012)** — the positive-program neighbors.
- **AxiomMath AreaLaw2D** — the formal area law; "first formal area law" belongs to it
  (`AreaLaw/Transfer.lean:361`, `PartialTrace.lean:25`, `State.lean:75,198`).
- **openai-math `PolynomialPEPS`** (`PEPSFilters/Basic.lean:74–135`) — the
  `UniformAreaLaw` consumer that Part II serves.
- **This project, articles 30/50** — the negative-results lineage; note the difference
  of kind stated in §1 (30 refuted our own conjecture; 50 Part I read our target
  engine; here the refutation is external and hypothesized).

## 8. Limitations and open problems

[Verbatim from current §8: α ≥ 1 uncovered; `hKL` an informal input, formalizing
Kuwahara's construction would discharge it; Part II link 4 + interface theorem open.]

## References

[R3-FILL — carry over the current reference block verbatim; it already leads with
Kuwahara.]

---

## README row edit (old → new; supersedes R4's short form with the final row text)

**README.md:43.**
- old: `| 72 | [The Rényi Monotonicity No-Go Gate (+ family-265 interface layer)](72-renyi-monotonicity-nogo-gate.md) | negative result + glue | **proved** (gate unconditional given the `hKL` family); interface theorem carried |`
- new: `| 72 | [A Kernel-Verified Fence for Kuwahara's Refutation of the Rényi Area Laws](72-renyi-monotonicity-nogo-gate.md) | fence around an external refutation (Kuwahara's no-go + our N1–N3 gate) + interface layer — technical record | **proved** (gate unconditional given the `hKL` family, i.e. Kuwahara's construction as hypothesis); interface theorem carried |`

**Effort:** S–M (text ~70% carried verbatim; the new material is §1 qualification,
abstract re-attribution, §7 restructure; R3 fills the verification table from logs).
