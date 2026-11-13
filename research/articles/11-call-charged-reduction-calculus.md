# A Call-Charged Reduction Calculus for Fine-Grained Complexity, with Theorem 19 of the 3SUM/APSP Refutation as One Composition

*cross-math-fronttier research article 11 · 2026-11-09 · dossier
`research/candidates/11-z1-composable-reduction-theory.md` · Lean pilot
`research/pilots/11/` · blueprint `research/pilots/11-blueprint.md`*

**Status: Milestone 1 PROVED, kernel-verified** (mathlib `ff2494ea`, Lean `v4.36.0-rc2`;
all declarations `[propext, Classical.choice, Quot.sound]`; no `sorry`, no `native_decide`).
The machine realizations (word-RAM and TM2, the dossier's Theorem B) are **not** done.

---

## Abstract

Fine-grained complexity results are chains of reductions, but the formal developments in
our corpora state each link as a standalone "transfer claim" and recombine them by hand:
3sum-apsp's programs cannot call subroutines, so every composed bound is re-derived. We
introduce a reduction type `Red A B β calls extra H` — every solver of B in time T yields
a solver of A in time ≤ extra + calls·(T ∘ β) on parameters satisfying a guard H, where a call
is charged exactly its running time — and prove the composition law "calls multiply,
extras add". As acceptance test we derive the explicit bound of the corpus's Theorem 19
(the Exact-Triangle solver behind the 3SUM/APSP refutation) as a single `Red.comp` of the
Theorem-17 reduction (Exact Triangle → Lop-AE-SparseTri) with the Corollary-16 solver, and
check that the result has exactly the type of the donor theorem, whose own proof is compiled
alongside as a faithfulness check.

## 1. Introduction

`anthropics_formal-math/3sum-apsp` refutes the (strong) 3SUM and APSP hypotheses in the
word-RAM model through a chain: Strassen-based matrix multiplication → Lop-AE-SparseTri
detection (Corollary 16) → Exact Triangle (Theorem 17 + Theorem 19) → … . Its time claims
live in an abstract `DetTimeModel` whose fields are "problem P is solved in time T", with a
documented convention (`TimeClaims/Sec3/Definitions.lean:54–58`): *a transfer claim charges
a call of an algorithm exactly its running time*. What the corpus lacks is a calculus in which
transfer claims are first-class objects that compose. The complexity bridge map
(`research/bridges/complexity.md`, empty zone Z1) records that neither 3sum-apsp, eth,
openai-math nor mathlib has one.

## 2. The calculus

Let A : (π → ℝ) → Prop and B : (ρ → ℝ) → Prop be "solvable in time" predicates over
parameter types π, ρ (A T reads "A is solved in time T"). Fix a parameter map β : π → ρ,
shape functions calls, extra : π → ℝ and a guard H : π → Prop.

**Definition.** `Red A B β calls extra H` holds iff calls ≥ 0 pointwise and for every T with
B T there is T' with A T' and T'(p) ≤ extra(p) + calls(p)·T(β p) for all p with H p.

(Design B: there is no separate additive constant — any constant is folded into `extra` at
the leaves. Design A, with an existential constant field, also compiles but its constant is
always instantiated at 0 in the corpus, composes without a closed form, and its
∃-packaging blocks opaque composition.)

## 3. Results

**Theorem 1 (composition: calls multiply, extras add).** If `Red A B β₁ c₁ e₁ H₁` and
`Red B C β₂ c₂ e₂ H₂`, then

  Red A C (β₂ ∘ β₁) (p ↦ c₁(p)·c₂(β₁ p)) (p ↦ e₁(p) + c₁(p)·e₂(β₁ p)) (p ↦ H₁ p ∧ H₂(β₁ p)).

**Theorem 2 (corpus claims are reductions).** The corpus's `Claim.Theorem_17 M MM D g`
(destructured) is a `Red` from Exact Triangle to Lop-AE-SparseTri with
calls = 4·n·g(n), β = (n, κ, u) ↦ (n, D n, queryCap n (D n)), extra = the claim's additive
terms (C·n²/√D·4ng + C·(termScans + termPrime + termBuild)), guard = the claim's side
conditions; `Claim.Corollary_16` is a zero-calls reduction from Lop-AE-SparseTri to itself
(a solver).

**Theorem 3 (acceptance).** From `Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆` and
`Claim.Corollary_16 M` one obtains `Claim.Theorem_19_explicit M 0.00175 1` — exactly the
type of the donor theorem `ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16` — by
one application of Theorem 1 followed by the donor's parameter-choice arithmetic
(`choice_corollary_26`, `total_corollary_26`).

## 4. Proofs

**Theorem 1.** Given a C-solver in time T, r₂ gives a B-solver in time T₂ with
T₂(q) ≤ e₂(q) + c₂(q)·T(β₂ q) on H₂; r₁ applied to it gives an A-solver T₁ with
T₁(p) ≤ e₁(p) + c₁(p)·T₂(β₁ p) on H₁. Since c₁ ≥ 0, multiplying the first bound at q = β₁ p
by c₁(p) and adding gives T₁(p) ≤ (e₁ + c₁·e₂∘β₁)(p) + c₁(p)c₂(β₁ p)·T(β₂β₁ p). ∎

**Theorem 2** is a repackaging: re-pad the corpus's curried time types ℕ → ℝ → ℝ and
ℕ → ℕ → ℕ → ℝ through product parameter types (adapters `ET`, `Lop` with an ∃-witness pinning
the unused κ-slot), then `linear_combination` against the claim's bound. **Theorem 3**
composes the two `Red`s and discharges the remaining inequality with the donor's own
arithmetic lemmas, ported verbatim in `P11T2.lean`. ∎

The calculus is elementary by design; its value is that a 3-step reduction chain becomes a
term `r₁.comp (r₂.comp r₃)` whose bound is computed, not re-proved.

## 5. Formal verification

| item | Lean |
|---|---|
| transcript layer | `research/pilots/11/P11T1.lean` (defs), `P11T2.lean` (arithmetic port with proofs + the donor reference theorem compiled verbatim — first-try OK) |
| calculus (Design B, record) | `CrossMath.RedB.Red`, `Red.comp`, `red_of_theorem_17`, `theorem19_of_red` in `RedCompB.lean` |
| calculus (Design A, comparison) | `CrossMath.RedA.*` in `RedCompA.lean` |
| axioms | all `[propext, Classical.choice, Quot.sound]` (`research/pilots/11/logs/axcheck-final.log`: RedCompA 5 lines, RedCompB 5 lines, P11T2 19 lines, 0 sorryAx) |

13 warm Modal runs (≈ 35 min machine time); iteration log in the blueprint §7.

## 6. Relation to prior work

Reductions with "calls multiply, extras add" accounting are folklore in fine-grained
complexity (e.g. Vassilevska Williams' surveys; Williams–Williams 2010 subcubic
equivalences). Formal treatments of complexity in proof assistants (mathlib's `Computable`
/ `TM2ComputableInTime` island; Coq/Isabelle complexity libraries) do not provide a
call-charged reduction type for problem-time predicates. Within the four corpora no such
layer exists (bridge map Z1; novelty R8: N4).

## 7. Limitations and open problems

- **Machine realizations (M2).** Theorem B of the dossier — every calculus derivation is
  realized by light-language word-RAM programs (oracle calls inlined, via
  `Ends.callTo`/`Ends.callLast`, `ThreeSumApsp/Lang/Calls.lean:93–124`) and by a single TM2
  machine (via eth's `PolyT` fragment calculus) — is the substantive next milestone
  (≈ 1.5–2.5k LoC, eth slice) and is not attempted here.
- The calculus is over real-valued time shapes with pointwise guards; asymptotic (`=O`)
  forms and randomized cost models are not covered.

## References

- anthropics_formal-math `3sum-apsp`: `TimeClaims/Sec3/Definitions.lean` (:54–58, :75–101,
  :192–199), `TimeClaims/Sec3/Theorem19.lean:107–125`, `Sec3/Theorem19.lean:91–145`,
  `Lang/Calls.lean:93–124`.
- V. Vassilevska Williams, R. Williams, *Subcubic equivalences between path, matrix and
  triangle problems*, FOCS 2010.

---

## Cycle-2 addendum (2026-11-14): M2 — the TM2 realization, in flight

The open milestone named in §7 (the machine realization via eth's `PolyT` fragment
calculus, dossier 11's Theorem B(ii); blueprint `research/pilots/11-blueprint.md` §M2,
~1.5–2.5k LoC, effort M) is Cycle-2 slot 2, lane A8, executing after the pilot-52/20
close-outs. **Ledger-final state (filled 2026-11-14 per the orchestrator's instruction):
P11T1.lean and P11T2.lean GREEN, FINAL; P11T3.lean GREEN in both m2 runs
(`research/pilots/11/logs/m2-run1.log` / `m2-run2.log`, 2026-11-14, after the four
outage-killed pinpoint fixes — explicit type params on stuck instance applications,
branch-form machine in choice, induction-style `sum_sf`, missing `hk` in
`composed_sum_le` — plus run-1's id'/rfl/length_cons repairs; ≈1.1k LoC / 88 thms),
marked PENDING A8 OFFICIAL RELAY.** The remaining realization file RedTm2.lean
(≈0.4k LoC / 8 thms, incl. `RedB.theorem19_of_red`) is in the last iteration — m2-run2:
2 errors; a later run3 is on disk (3 errors) — verdict via relay.

**Verdict slot: [VERDICT:11-M2]** (final RedTm2 run / LoC / thm count / axcheck triad /
GREEN-FAIL line — fills from the orchestrator relay; until then the M1 record of §5
plus the P11T1/T2/T3 greens above stand as this article's proved content and nothing on
this page claims B(ii) complete).
