# A Call-Charged Reduction Calculus for Fine-Grained Complexity, with Theorem 19 of the 3SUM/APSP Refutation as One Composition

*kind: TECHNICAL-RECORD — formal calculus for folklore composition, acceptance-tested
on donor Theorem 19 (TEMPLATE-iter4 §0 kept set) · date: 2026-11-09 (header modernized
2026-11-17) · supersedes: none · artifacts: `research/pilots/11/` (Lean pilots +
logs), dossier `research/candidates/11-z1-composable-reduction-theory.md`, blueprint
`research/pilots/11-blueprint.md`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 `RedB.Red.comp` (calls multiply, extras add) | PROVED-UNCONDITIONAL | none | print `pilots/11/logs/axcheck-final.log:386` — triad [R3 tables §5] |
| Thm 2 `RedB.red_of_theorem_17` / `Corollary_16` repackaging | PROVED-CONDITIONAL | `Claim.Theorem_17` (donor statement as binder; donor reference compiled verbatim alongside as faithfulness check — `stepB-c2.log:60` triad) | print `axcheck-final.log:389` — triad [R3 tables §5] |
| Thm 3 acceptance: `Claim.Theorem_19_explicit M 0.00175 1` from one composition | PROVED-CONDITIONAL | `Claim.Theorem_17` + `Claim.Corollary_16` binders (donor parameter arithmetic ported verbatim) | print `axcheck-final.log:387` — triad [R3 tables §5] |
| Thm B(ii) `tm2_realized_composed` (§8) | PROVED-CONDITIONAL | EthExistsTm, EthPoly, EthIsPoly (eth interface statements as explicit binders) + the machine/size binders of §8 | print `pilots/11/logs/m2-axcheck-final.log:22` — triad [R3 tables §5] |

All kernel verification on mathlib `ff2494ea`, Lean v4.36.0-rc2; axioms ⊆ {propext,
Classical.choice, Quot.sound}; no `sorry`, no `native_decide`. Kind: formal calculus
for folklore composition — technical record; the acceptance test, not the calculus,
is the article's deliverable (relabeled 2026-11-16).

Change log (2026-11-17, lane A9 — header modernization only, no content change): the
byline was brought to the TEMPLATE-iter4 front matter with the kind tag of the README
relabel (2026-11-16; the kind already appeared in the paragraph above). The status
table, theorems, proofs and all dated records are unchanged. Same-day residual pass:
the two non-vocabulary "open — not attempted" placeholder rows (Thm B(i) word-RAM,
M3 instantiation) were removed from the status table — §7's first limitation already
states both as open; §6 converted to the mandatory nearest-miss table (same
citations). Same-day depth pass: §5 gained the per-theorem verification blocks
(decl file:line + binder inventories + honest labels); the run-count/machine-time
sentence was removed (record content, not article content).

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

Verification-block depth (R3 §5; 2026-11-17 depth pass — per-theorem file:line and
binder inventories; the status rows in the header carry the print cites):

- Thm 1 `CrossMath.RedB.Red.comp` — `pilots/11/RedCompB.lean:36`; no hypothesis
  binders (the `Red` type's guard is part of the definition); substrate mathlib
  `ff2494ea` / v4.36.0-rc2; print `pilots/11/logs/axcheck-final.log` (RedCompB stage,
  5 axiom lines, 0 sorryAx); honest label PROVED-UNCONDITIONAL.
- Thm 2 `CrossMath.RedB.red_of_theorem_17` — `RedCompB.lean:86`; binder inventory:
  the donor statement `Claim.Theorem_17` as an explicit hypothesis (3sum-apsp
  `PaperStatements.lean`; the donor reference compiled verbatim alongside as the
  faithfulness check, `stepB-c2.log:60` triad) — a donor binder, hence conditional;
  honest label PROVED-CONDITIONAL(Theorem_17).
- Thm 3 `CrossMath.RedB.theorem19_of_red` — `RedCompB.lean:111`; binders:
  `Claim.Theorem_17` + `Claim.Corollary_16` (donor parameter arithmetic ported
  verbatim); honest label PROVED-CONDITIONAL(Theorem_17, Corollary_16).
- Thm B(ii) `CrossMath.RedTm2.tm2_realized_composed` — `pilots/11/RedTm2.lean:392`;
  binders: EthExistsTm, EthPoly, EthIsPoly (eth interface statements as explicit
  hypothesis binders — the open machine-model core) + the machine/size binders of §8;
  print `pilots/11/logs/m2-axcheck-final.log:22` — triad; honest label
  PROVED-CONDITIONAL(EthExistsTm, EthPoly, EthIsPoly).
- Coverage: the calculus layer's public theorems all print in the RedCompA/RedCompB
  stages of the sweep log; the word-RAM half and M3 are open (§7), no claims carried.

## 6. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| fine-grained folklore: Vassilevska Williams' surveys; Williams–Williams 2010 (subcubic equivalences) | "calls multiply, extras add" accounting, used informally throughout | the accounting is folklore, not a formal object; this article's contribution is the typed reduction calculus + machine acceptance test, not the accounting rule |
| formal complexity in proof assistants: mathlib's `Computable`/`TM2ComputableInTime` island; Coq/Isabelle complexity libraries (incl. AFP `Cook_Levin/Composing.thy` — nearest formal, different shape) | machine models and time bounds | no call-charged reduction type for problem-time predicates exists in any of them |
| the four corpora (bridge map Z1; novelty R8 grade N4) | no composition calculus in the donor corpus (direct-source query, `qa/iter4-review/r2-discovery-strength.md` §5 q10) | the calculus + the Theorem-19 acceptance test are the article's engineering contribution (technical-record billing) |

Scope statement. The calculus formalizes folklore composition — the acceptance test,
not the calculus, is the deliverable (kind TECHNICAL-RECORD; the relabel applied
2026-11-16 records exactly this).

## 7. Limitations and open problems

- **Machine realizations.** The TM2 half of Theorem B — every calculus derivation
  realized by a single machine — is proved in §8, conditional on the three eth
  interface binders (EthExistsTm, EthPoly, EthIsPoly). The word-RAM half (light-language
  programs with oracle calls inlined, via `Ends.callTo`/`Ends.callLast`,
  `ThreeSumApsp/Lang/Calls.lean:93–124`) and the M3 instantiation (CH20 ∘ VW13 as one
  composed realization, blueprint §4) remain open.
- The calculus is over real-valued time shapes with pointwise guards; asymptotic (`=O`)
  forms and randomized cost models are not covered.

## References

- anthropics_formal-math `3sum-apsp`: `TimeClaims/Sec3/Definitions.lean` (:54–58, :75–101,
  :192–199), `TimeClaims/Sec3/Theorem19.lean:107–125`, `Sec3/Theorem19.lean:91–145`,
  `Lang/Calls.lean:93–124`.
- V. Vassilevska Williams, R. Williams, *Subcubic equivalences between path, matrix and
  triangle problems*, FOCS 2010.

---

## 8. The TM2 realization (Theorem B(ii))

Every derivation of the calculus is realized by a single TM2 machine. The realization
uses mathlib's own TM2 machines and eth's polynomial-time fragment calculus, in
`research/pilots/11/P11T3.lean` (1,100 lines, 88 theorems as run-counted — 110 public
declarations on disk, R3 §4 F4; eth's machine-model tranche ported with proofs) and
`research/pilots/11/RedTm2.lean` (421 lines).

**Cost model.** `Tm2Sol f T` :⟺ there is a `TM2ComputableAux Bool Bool` machine M
that, on every input x, outputs f x within T x steps (mathlib's `TM2OutputsInTime`).
This is eth's `MainResults.lean:158` shape.

**Interface hypotheses.** eth results whose proofs need its full fragment library enter
as verbatim statement hypotheses, following eth's own interface convention:
- `EthExistsTm` (`exists_tm`, `Machine/Host.lean:305–309`);
- `EthPoly` (function-level `PolyT` closure facts, e.g. `Closure/Basic.lean:53–127`);
- `EthIsPoly` (`IsPolyT` closure of the Stepped combinators, `Poly/Comb.lean:50,63`).

Everything else is proved.

**Theorem B(ii) (`tm2_realized_composed`).** Assume `EthExistsTm`, `EthPoly` and
`EthIsPoly`. Let:
- qs : input → list of queries, polynomial-time;
- Md, a polynomial-time Stepped callee answering each query q as v q within tquery q
  steps, with state size Sm;
- Tn x, a bound with tquery q ≤ Tn x for every q ∈ qs x;
- a polynomial-time combining step g and initial value c₀, with all intermediate
  sizes bounded by (|x| + 2)^d;
- calls x ≥ |qs x|.

Then there is c with
  Tm2Sol (x ↦ fold of g over the answers to qs x, starting at c₀ x)
         (x ↦ c · (calls x · (Tn x + 1) + 1) · (|x| + 1)^c).
**One TM2 machine** realizes the calculus's composed bound "calls × callee time +
polynomial overhead".

**Companion results:**
- `Tm2Sol.mono`: time bounds widen. It needs no interface hypotheses.
- `tm2_choice`: a size-threshold branch between two machines costs the selected
  branch's time plus polynomial overhead. It is built from eth's `Stepped.ite` and the
  decision x.length < n₀.
- `tm2_charging`: the composed machine is eth's `Stepped.foldWhile` over the query
  list's suffixes `sf (qs x)`, running the callee once per query. Its step count is
  Σ_q (tquery q + 1) plus overhead.
- `composed_sum_le`: Σ_q (tquery q + 1) ≤ calls · (Tn + 1).

**Proof outline.** Express the caller as a Stepped machine: `foldWhile` walks the
suffixes of the query list (`orbit_sf`, `map_headD_sf`, `sum_sf`). Each iteration
invokes Md on the head query and folds the answer with g. eth's IsPolyT closure gives
the iteration polynomial overhead. `exists_tm` compiles the Stepped machine to a TM2 with
time c·(steps + 1)·(|x| + 1)^c. The step count is bounded by `sum_sf` and
`composed_sum_le` (induction on the query list). Finally `Tm2Sol.mono` widens to the
stated bound.

Formal record for §8 (elaboration: `pilots/11/logs/m2-run8-GREEN.log:7–8` — all six
pilot-11 files, 0 errors, 0 sorry):

| theorem | declaration | file | axioms | evidence |
|---|---|---|---|---|
| Thm B(ii) | `tm2_realized_composed` (`RedTm2.lean:392`) | `research/pilots/11/RedTm2.lean` (421 lines) | ⊆ triad | print `m2-axcheck-final.log:22` [R3 tables §5]; sweep `AxPilot11_RedTm2` OK, 12 axiom-lines, 0 sorryAx |
| companions | `Tm2Sol.mono` (unconditional, no interface hypotheses) `:18`; `tm2_choice`, `tm2_charging` (interface binders) `:19–20`; `composed_sum_le` (`[propext, Quot.sound]`) `:21` | idem | ⊆ triad or fewer | prints `m2-axcheck-final.log:18–21` [R3 tables §5] |
| list lemmas | `orbit_sf` (`[propext]`), `map_headD_sf` (axiom-free), `sum_sf` (`[propext]`) | idem | ⊆ triad or fewer | prints `m2-axcheck-final.log:23–25` [R3 tables §5] |
| ported machine tranche | 110 public theorems (run-header "88"; R3 §4 F4) | `research/pilots/11/P11T3.lean` | ⊆ triad | sweep of record `stepB-c2.log:533` — AxPilot11_P11T3 OK, 71 axiom-lines, 0 sorryAx, excerpts `:534–586` (the "64 axiom-lines" at `m2-axcheck-final.log:13` is tally-only — custody gap F1; the sweep is the evidence of record) |

The still-open word-RAM half and M3 instantiation are listed in §7.
