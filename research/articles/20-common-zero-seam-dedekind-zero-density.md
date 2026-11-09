# The Common-Zero Seam: What Zero-Density Engines Can and Cannot Transport Through an L-Function Factorization

*cross-math-fronttier research article 20 · 2026-11-09 · dossier
`research/candidates/20-hecke-zetaK-zero-density.md` · Lean pilot `research/pilots/20/M1.lean`
· blueprint `research/pilots/20-blueprint.md` · obstruction note `research/pilots/20-hCZ-NOTE.md`*

**Status: conditional core PROVED, kernel-verified** (mathlib `ff2494ea`, Lean `v4.36.0-rc2`;
all 27 theorems `[propext, Classical.choice, Quot.sound]`; no `sorry`, no `native_decide`).
The engine inputs (zeta23 `PaperInputs` card, traces family, engine step) are explicit
hypotheses; the common-zero analysis of §4.3 is a paper result.

---

## Abstract

The zeta23 zero-density engine proves Alpöge–Furman proportions for ζ and for Dirichlet
L-functions from a "card" of analytic inputs (explicit formula, Riemann–von Mangoldt,
Chebyshev–Mertens, mean values, Γ-factor facts). We restate the engine at its natural
generality — a zero configuration plus coefficient data — and formalize the instantiation
layer: card + traces family + engine step ⇒ λ-families of division-free proportion bounds
⇒ the submitted constants 2/3, 1/2, 3/4 as λ → 1. Applied to a product L = L₁·L₂ (e.g.
ζ_K = ζ·L(χ_D)), we prove a sharp dichotomy. **Proportions counted with multiplicity merge
through any factorization with no hypothesis on common zeros** (`family_merge`); **every
distinct- or simple-numerator proportion degrades exactly by the common zeros**, because a
simple common zero of the factors is a double zero of the product (`merged_mult_of_common`).
We isolate the needed hypothesis hCZ (common on-line zero mass is o(N)), show that
hCZ at any level η > 1/6 already follows from the factors' 5/6-distinct theorems, and that
hCZ for small η needs two inputs, S₁ = o(N) (simple–simple coincidences) and density-zero
multiplicity for each factor, neither available today.

## 1. Introduction

Zero-density proportion theorems are proved function by function. For a number field K
the Dedekind zeta factors into Artin L-functions; for K quadratic, ζ_K = ζ·L(·, χ_D). Two
routes to ζ_K proportions exist:

- **assembly** (article 42): add the factor theorems using additivity of multiplicities;
- **engine** (this article): run the density engine directly on the zero configuration of
  ζ_K, which needs ζ_K-versions of the analytic inputs.

The engine route is the only route to distinct- and simple-zero statements and to window
constants (Montgomery–Taylor, 2 − 1/c₁* ≈ 0.6725) for ζ_K. The question is what blocks it.
The same engine applies to Hecke L-functions of ℚ(√−3) (openai-math's `HeckeFamily`), a
family no single corpus can state.

## 2. Setting

A *zero configuration* is a multiplicity function m : ℂ → ℕ with finite support in every
window {0 < Re ρ < 1, T₁ < Im ρ ≤ T₂}. Write N(T), N^on(T) for the dyadic window (T, 2T]
counts with multiplicity, and `EpsLower z c` for: ∀ ε > 0, eventually
(c − ε)·N(T) ≤ N^on(T). The engine's λ-family constants are

  H(λ) = 2 − 1/λ − λ/3,  F(λ) = λ/(1 + λ²/3),  λ ∈ (1/2, 1),

with H(1) = 2/3 and F(1) = 3/4 (Theorems A, B, C of zeta23 correspond to H, 2F − 1, F).
For configurations z, w let

  SharedMass(T) = Σ_{ρ on-line in window} min(z(ρ), w(ρ)),
  CommonZeroControl z w :⇔ ∀ η > 0, eventually SharedMass(T) ≤ η·N_{z+w}(T).

## 3. Main results

**Theorem 1 (instantiation).** If z carries a `Card20` (the five-field transcription of
`Zeta23.PaperInputs`), a traces family and an engine step, then for every λ ∈ (1/2, 1):
`EpsLower z (H λ)`, `EpsLower z (2F(λ) − 1)` and `EpsLower z (F λ)`.

**Theorem 2 (λ → 1 upgrades).** A family `EpsLower z (H λ)` for all λ ∈ (1/2, 1) implies
`EpsLower z (2/3)`; similarly 2F − 1 gives 1/2 and F gives 3/4. The proof is explicit in δ:
H(1 − δ) ≥ 2/3 − 5δ/3 for 0 < δ ≤ 1/2.

**Theorem 3 (merging with multiplicity; no common-zero hypothesis).** If z and w satisfy
`EpsLower · (H λ)` for all λ, so does z + w. In particular, via a factorization
L = L₁L₂ (orders add), the with-multiplicity 2/3 statement for L follows from those of the
factors.

**Theorem 4 (atom-level obstruction).** If z(ρ) = w(ρ) = 1 then (z + w)(ρ) = 2: a simple
common zero of the factors is a non-simple zero of the product. If the on-line supports of
z and w are disjoint then SharedMass ≡ 0.

**Theorem 5 (what common-zero control requires).** Let z, w satisfy the 5/6-distinct
theorem (as ζ and L(χ_D) do, zeta23 Theorem C/E). Then for every ε > 0, eventually

  SharedMass(T) ≤ S₁(T) + (1/6 + ε)·N(T),

where S₁ counts on-line points that are simple zeros of both factors. Consequently:
(a) hCZ at every level η > 1/6 holds unconditionally (given the factor theorems);
(b) hCZ ⇒ S₁ = o(N);
(c) S₁ = o(N) together with density-zero multiplicity of each factor ⇒ hCZ.

## 4. Proofs

**Theorems 1–2.** Theorem 1 is the definition of the engine step applied at each λ (the
card is carried so that its eventual discharge slots in unchanged). For Theorem 2 take
δ = min(3ε/10, 1/4) and λ = 1 − δ; then H(λ) − ε/2 ≥ 2/3 − ε, and the family bound at λ
with ε/2 gives the claim; the cases 2F − 1 and F are identical with their own δ-bounds. ∎

**Theorem 3.** With-multiplicity counts are additive: N_{z+w} = N_z + N_w and
N^on_{z+w} = N^on_z + N^on_w (finite sums over supports; supp(z+w) = supp z ∪ supp w). Add the
two ε-inequalities. The factorization step is article 42, Theorem 1. ∎

**Theorem 4.** Immediate from (z + w)(ρ) = z(ρ) + w(ρ). ∎

**Theorem 5.** Split SharedMass = S₁ + Σ_{shared}(min(z, w) − 1). Pointwise
min(z, w) − 1 ≤ z − 1 on shared points, and Σ_all (z(ρ) − 1)⁺ = N_z − N_z^{d} ≤ (1/6 + ε)N_z by
the 5/6-distinct theorem (and the same for w). Summing gives the bound and (a). (b) holds
because S₁ ≤ SharedMass. For (c), density-zero multiplicity of each factor makes the
shared-multiple part o(N). ∎

**Discussion.** Theorem 3 versus Theorem 4 is the whole story. The certificate engine
penalizes multiplicity through a convex function, so a merged multiplicity-2 atom costs
exactly where the product's distinct count loses a point. S₁ is a *cross-function
coincidence count*: a simple common zero is simple in each factor's own statistics, so no
per-function proportion theorem constrains it. Classical zero-density estimates
N(σ, T) ≪ T^{A(1−σ)} log^C T make shared mass with Re ρ > 7/12 + δ negligible (A = 12/5) but
say nothing on the critical line. Heuristically (independent ordinates) S₁ is eventually
zero; no theorem implies even S₁ = o(N).

## 5. Formal verification

| item | Lean (`CrossMath.Pilot20`, `research/pilots/20/M1.lean`, 576 LoC) |
|---|---|
| card transcription | `Card20` (fields ef/rvm/cheb/mv/gamma at `Zeta23/ThmE/Hypotheses.lean:48,67,83,107,125` shapes), `ChebyshevMertensCard`, `MVHilbertCard`, `RvMCard`, `GammaFactsCard`, `EFCard` |
| engine seam | `EngineStep`, `TracesFamily` (between SWAP-START/END markers) |
| Theorem 1 | `instantiate_family_A/B/C`, `zetaK_engine_two_thirds/half/three_quarters` |
| Theorem 2 | `hfun_one_sub_le`, `ffun_one_sub_le`, `family_to_two_thirds/half/three_quarters` |
| Theorem 3 | `assemble_eps`, `family_merge`, `two_thirds_of_components`, `count_add_of_factorization` |
| Theorem 4 | `merged_mult_of_common`, `sharedMass_eq_zero_of_disjoint`, `SharedMass`, `CommonZeroControl` |
| axioms | all `[propext, Classical.choice, Quot.sound]`; final sweep `research/pilots/20/logs/axcheck-final.log` |

Theorem 5 is not formalized (it needs the factors' distinct theorems as inputs, which the
pilot does not yet consume). Nine Modal cycles were needed (formalization deltas: the `λ`
keyword, `ComplexConjugate` scope, section-variable non-insertion, δ ≤ 1/2), recorded in the
blueprint §6.

## 6. Relation to prior work

- zeta23 (anthropics_formal-math): the engine and its `PaperInputs`/`PaperInputsChi` card
  (`Zeta23/ThmE/Hypotheses.lean:127`), `thmA₀_N0` (`Final.lean:356`), `trivial_chain`
  (`Statement.lean:157`).
- Alpöge–Furman (arXiv:2608.13637) for the method; Montgomery–Taylor window constants.
- Common zeros of L-functions: the classical question of whether ζ and L(χ) can share
  nontrivial zeros (Li 2012; Garunkštis–Kalpokas; Gonek's heuristics) — recorded queries,
  not verified in this project; nothing known to us gives S₁ = o(N) unconditionally.
- Zero-density estimates: Ingham, Huxley (A = 12/5).

## 7. Limitations and open problems

- **Discharging the card for ζ_K** needs a Weil explicit formula and Riemann–von Mangoldt for
  the target L (sized E3.5 in the dossier); for the ℚ(√−3) Hecke family the openai-math
  quasi-RH layer supplies part of the zero-free side.
- **The seam.** Prove S₁ = o(N) for (ζ, L(χ_D)) — or any statement making common on-line
  zeros negligible — and the distinct/simple/window constants for ζ_K become reachable by the
  engine route. Even the intermediate η between 1/6 and 0 would improve Theorem 4 of
  article 42.

## References

- anthropics_formal-math `zeta23` (files cited above). L. Alpöge, A. Furman, arXiv:2608.13637.
- M. N. Huxley, *On the difference between consecutive primes*, Invent. Math. 15 (1972).
- openai-math `SevenEighths.HeckeFamily`; tauceti Dedekind-zeta factorization record.
