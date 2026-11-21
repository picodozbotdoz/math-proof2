# A Call-Charged Reduction Calculus for Fine-Grained Complexity, with Theorem 19 of the 3SUM/APSP Refutation as One Composition

*kind: TECHNICAL-RECORD — formal calculus for folklore composition, acceptance-tested
on the 3sum-apsp corpus's Theorem 19 · date: 2026-11-09 · supersedes: none · artifacts:
`research/pilots/11/` (Lean sources `RedCompA.lean`, `RedCompB.lean`, `RedM3.lean`,
`RedTm2.lean`, `P11T1.lean`, `P11T2.lean`, `P11T3.lean`; logs
`research/pilots/11/logs/`, `research/feasibility/probe/logs/stepB-c2.log`) · dossier
`research/candidates/11-z1-composable-reduction-theory.md` · blueprint
`research/pilots/11-blueprint.md`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 `RedB.Red.comp` (composition: calls multiply, extras add) | PROVED-UNCONDITIONAL | none | print `research/pilots/11/logs/axcheck-final.log:386` — axioms [propext, Classical.choice, Quot.sound] |
| Thm 2 `RedB.red_of_theorem_17` (Theorem 17 is a reduction) | PROVED-CONDITIONAL | `hC : 0 ≤ C` and `h17`, the transfer clause of donor `Claim.Theorem_17` with its ∃-packaging peeled (`RedCompB.lean:86–92`) | print `research/pilots/11/logs/axcheck-final.log:389` — axioms [propext, Classical.choice, Quot.sound] |
| Thm 3 `RedB.theorem19_of_red` (acceptance) | PROVED-CONDITIONAL | `Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆` + `Claim.Corollary_16 M` (donor statements as hypothesis binders) | print `research/pilots/11/logs/axcheck-final.log:387` — axioms [propext, Classical.choice, Quot.sound] |
| Thm 4 `RedM3.composed_21a_of_ch20_vw13` (second acceptance) | PROVED-CONDITIONAL | `Claim.CH20_Theorem_5_1 M` + `Claim.VW13_Theorem_4_3 M` (donor cited-literature statements as hypothesis binders; the ChanHe program not re-ported); conclusion guarded by `1 ≤ n`, `0 ≤ Num₁ n`, `0 ≤ Num₂ (N n)` (`RedM3.lean:166`) | print `research/pilots/11/logs/m3-run3.log:48–54` — axioms [propext, Classical.choice, Quot.sound] for all three declarations (`composed_21a_of_ch20_vw13`, `red_of_CH20`, `red_of_VW13`); the file has not yet passed a full-coverage axiom audit |
| Thm 5 `RedTm2.tm2_realized_composed` (TM2 realization) | PROVED-CONDITIONAL | EthExistsTm, EthPoly, EthIsPoly (eth interface statements as hypothesis binders) + the machine/size binders `qs`, `Md` (per-query time, state size), `v`, `tquery`, `Tn`, `Sm`, `g`, `c₀`, `d`, `calls` with their polynomiality and size hypotheses (Theorem 5 below) | print `research/pilots/11/logs/m2-axcheck-final.log:22` — axioms [propext, Classical.choice, Quot.sound] |

All kernel verification on mathlib `ff2494ea`, Lean v4.36.0-rc2; axioms ⊆ {propext,
Classical.choice, Quot.sound} throughout; no `sorry`, no `native_decide`. Kind: formal
calculus for folklore composition — technical record; the acceptance test, not the
calculus, is the article's deliverable.

---

## Abstract

Fine-grained complexity results are chains of reductions. In the formal 3SUM/APSP
refutation corpus (`anthropics_formal-math/3sum-apsp`) each link is a standalone
transfer claim — a time bound for one problem derived from a time bound for another —
and composed bounds are re-derived by hand: the corpus's programs do call subroutines,
but its transfer claims are not composable objects. We introduce a reduction type
`Red A B β calls extra H` — every solver of B in time T yields a solver of A in time
≤ extra + calls·(T ∘ β) on parameters satisfying a guard H, a call charged exactly its
running time — and prove the composition law: under `Red.comp` calls multiply and
extras add (Theorem 1 below, PROVED-UNCONDITIONAL). As acceptance test, Theorem 3
derives the explicit bound of the corpus's Theorem 19 from the Theorem-17 reduction
and the Corollary-16 solver by one composition, matching the donor theorem's type
exactly; it is PROVED-CONDITIONAL on the donor statements `Claim.Theorem_17` and
`Claim.Corollary_16`, taken as hypothesis binders. The typed interface is new within
the four surveyed corpora; the call-charged accounting itself is folklore
(Vassilevska Williams; Williams–Williams, FOCS 2010), and the nearest formal
comparator is the AFP Cook–Levin composition development.

## 1. Introduction

`anthropics_formal-math/3sum-apsp` refutes the (strong) 3SUM and APSP hypotheses in the
word-RAM model through a chain: Strassen-based matrix multiplication → Lop-AE-SparseTri
detection (Corollary 16) → Exact Triangle (Theorem 17 + Theorem 19) → … . Its time claims
live in an abstract `DetTimeModel` whose fields are "problem P is solved in time T", with a
documented convention (`TimeClaims/Sec3/Definitions.lean:54–58`): *a transfer claim charges
a call of an algorithm exactly its running time*. What the corpus lacks is a calculus in which
transfer claims are first-class objects that compose. The complexity bridge map
(`research/bridges/complexity.md`, empty zone Z1) records that neither 3sum-apsp, eth
(the `anthropics_formal-math/eth` development), openai-math nor mathlib has one.

## 2. Setting and notation

Let A : (π → ℝ) → Prop and B : (ρ → ℝ) → Prop be "solvable in time" predicates over
parameter types π, ρ (A T reads "A is solved in time T"). Fix a parameter map β : π → ρ,
shape functions calls, extra : π → ℝ and a guard H : π → Prop.

**Definition.** `Red A B β calls extra H` holds iff calls ≥ 0 pointwise and for every T with
B T there is T' with A T' and T'(p) ≤ extra(p) + calls(p)·T(β p) for all p with H p.

(Design B: there is no separate additive constant — any constant is folded into `extra` at
the leaves. Design A, with an existential constant field, also compiles but its constant is
always instantiated at 0 in the corpus, composes without a closed form, and its
∃-packaging blocks opaque composition.)

## 3. Main results

**Theorem 1 (composition: calls multiply, extras add).** If `Red A B β₁ c₁ e₁ H₁` and
`Red B C β₂ c₂ e₂ H₂`, then

  Red A C (β₂ ∘ β₁) (p ↦ c₁(p)·c₂(β₁ p)) (p ↦ e₁(p) + c₁(p)·e₂(β₁ p)) (p ↦ H₁ p ∧ H₂(β₁ p)).

**Theorem 2 (corpus claims are reductions).** The corpus's `Claim.Theorem_17 M MM D g`,
entering with its ∃-packaging peeled (a nonnegative constant `C` plus the transfer
clause — the binders `hC`, `h17` of `RedCompB.lean:86–92`), is a `Red` from Exact
Triangle to Lop-AE-SparseTri with
calls = 4·n·g(n), β = (n, κ, u) ↦ (n, D n, queryCap n (D n)), extra = the claim's additive
terms (C·n²/√D·4ng + C·(termScans + termPrime + termBuild)), guard = the claim's side
conditions; `Claim.Corollary_16` is a zero-calls reduction from Lop-AE-SparseTri to itself
(a solver).

**Theorem 3 (acceptance).** From `Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆` and
`Claim.Corollary_16 M` one obtains `Claim.Theorem_19_explicit M 0.00175 1` — exactly the
type of the donor theorem `ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16` — by
one application of Theorem 1 followed by the donor's parameter-choice arithmetic
(`choice_corollary_26`, `total_corollary_26`).

**Theorem 4 (second acceptance).** Assume the two cited-literature claims of the
donor, `Claim.CH20_Theorem_5_1 M` (3SUM → Convolution-3SUM) and
`Claim.VW13_Theorem_4_3 M` (Convolution-3SUM → Exact Triangle), as hypothesis
binders. For every weight exponent κ ≥ 0 the composed data exist — E₁, Num₁, mag,
N with the donor's `IsPowPolylog` side-conditions, E₂, Num₂, size, c ≥ 1 with the
`IsPowLittleO`/`IsBigOPow` ones (the six hypothesis shapes of the corpus's
hand-carried `theorem_21a_compose` arithmetic) — and every Exact-Triangle time T
yields a 3SUM time T₃ with

  T₃ n (n^κ) ≤ E₁ n + Num₁ n·(E₂ (N n)·(1 + logU (mag n)) + Num₂ (N n)·T (size (N n)) (c·mag n))

on the guard 1 ≤ n with 0 ≤ Num₁ n and 0 ≤ Num₂ (N n) (`RedM3.lean:166`) — calls
`Num₁·(Num₂∘N)` multiply, extras `E₁ + Num₁·(E₂∘N)` add, weight `(size∘N, c·mag)` —
derived through Theorem 1 (`Red.comp` consumed as a black box): the composition the
donor carries by hand becomes an instance of the calculus. The `n^{3/2+o(1)}`
classification of the composed bound (the NOTE term of `theorem_21a_compose`) is not
derived here — it is the asymptotic classification port of §7.

**Theorem 5 (TM2 realization).** Every derivation of the calculus is realized by a
single TM2 machine. The construction uses mathlib's own TM2 machines and eth's
polynomial-time fragment calculus — eth's machine-model tranche ported with proofs in
`research/pilots/11/P11T3.lean` (88 `theorem` declarations), the construction in
`research/pilots/11/RedTm2.lean`.

Cost model: `Tm2Sol f T` holds iff there is a `TM2ComputableAux Bool Bool` machine M
that, on every input x, outputs f x within T x steps (mathlib's `TM2OutputsInTime`;
eth's `MainResults.lean:158` shape). eth results whose proofs need its full fragment
library enter as verbatim statement hypotheses, following eth's own interface
convention: `EthExistsTm` (`exists_tm`, `Machine/Host.lean:305–309`), `EthPoly`
(function-level `PolyT` closure facts, `Closure/Basic.lean:53–127`), `EthIsPoly`
(`IsPolyT` closure of the Stepped combinators, `Poly/Comb.lean:50,63`). Everything
else is proved.

**Statement (`tm2_realized_composed`, `RedTm2.lean:392`).** Assume `EthExistsTm`,
`EthPoly` and `EthIsPoly`. Let:
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
One TM2 machine realizes the calculus's composed bound "calls × callee time +
polynomial overhead".

Companion results: `Tm2Sol.mono` — time bounds widen; it needs no interface
hypotheses; `tm2_choice` — a size-threshold branch between two machines costs the
selected branch's time plus polynomial overhead (built from eth's `Stepped.ite` and
the decision x.length < n₀); `tm2_charging` — the composed machine is eth's
`Stepped.foldWhile` over the query list's suffixes, running the callee once per
query; `composed_sum_le` — Σ_q (tquery q + 1) ≤ calls · (Tn + 1).

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| fine-grained folklore: Vassilevska Williams' surveys; Williams–Williams 2010 (subcubic equivalences) | "calls multiply, extras add" accounting, used informally throughout | the accounting is folklore, not a formal object; this article's contribution is the typed reduction calculus + machine acceptance test, not the accounting rule |
| formal complexity in proof assistants: mathlib's `Computable`/`TM2ComputableInTime` island; Coq/Isabelle complexity libraries (incl. AFP `Cook_Levin/Composing.thy` — nearest formal, different shape) | machine models and time bounds | we found no call-charged reduction type for problem-time predicates in the surveyed formal developments (complexity-bridge survey `research/bridges/complexity.md`, zone Z1) |
| the four corpora (bridge map Z1) | no composition calculus in the donor corpus (direct-source query, `research/qa/iter4-review/r2-discovery-strength.md` §5 q10) | the calculus + the Theorem-19 acceptance test are the article's engineering contribution (technical-record billing) |

Scope statement. The calculus formalizes folklore composition — the acceptance test,
not the calculus, is the deliverable (kind TECHNICAL-RECORD).

## 5. Proofs

**Theorem 1.** Given a C-solver in time T, r₂ gives a B-solver in time T₂ with
T₂(q) ≤ e₂(q) + c₂(q)·T(β₂ q) on H₂; r₁ applied to it gives an A-solver T₁ with
T₁(p) ≤ e₁(p) + c₁(p)·T₂(β₁ p) on H₁. Since c₁ ≥ 0, multiplying the first bound at q = β₁ p
by c₁(p) and adding gives T₁(p) ≤ (e₁ + c₁·e₂∘β₁)(p) + c₁(p)c₂(β₁ p)·T(β₂β₁ p). ∎

**Theorem 2** is a repackaging: re-pad the corpus's curried time types ℕ → ℝ → ℝ and
ℕ → ℕ → ℕ → ℝ through product parameter types (adapters `ET`, `Lop` with an ∃-witness pinning
the unused κ-slot), then `linear_combination` against the claim's bound; the claim
enters peeled (`hC : 0 ≤ C` plus the transfer clause `h17`, `RedCompB.lean:86–92`),
and the packaging is reassembled by Theorem 3. **Theorem 3** composes the two `Red`s
and discharges the remaining inequality with the donor's own arithmetic lemmas
(`choice_corollary_26`, `total_corollary_26`, `call_cost_corollary_16`,
`time_le_of_calls`), ported verbatim in `P11T2.lean`; the donor reference theorem
itself is compiled alongside (`P11T2.lean:328`) as the faithfulness check. ∎

**Theorem 4** lifts each donor claim to a `Red` over the padded `ℕ × ℝ` parameter
type (`red_of_CH20` at fixed κ, `red_of_VW13`), then reads the composed bound off
`(Red.comp r₁ r₂).transfer` — order composition plus the padding equalities; the
calculus's nonnegative-calls field is met by clamping at 0 with the sign carried in
the guard (the corpus's own partiality convention). No donor content is used or
re-proved. ∎

**Theorem 5.** Express the caller as a Stepped machine: eth's `foldWhile` walks the
suffixes of the query list (`orbit_sf`, `map_headD_sf`, `sum_sf`). Each iteration
invokes Md on the head query and folds the answer with g. eth's IsPolyT closure gives
the iteration polynomial overhead. `exists_tm` compiles the Stepped machine to a TM2
with time c·(steps + 1)·(|x| + 1)^c. The step count is bounded by `sum_sf` and
`composed_sum_le` (induction on the query list); `Tm2Sol.mono` widens to the stated
bound. ∎

The calculus is elementary by design; its value is that a 3-step reduction chain becomes a
term `r₁.comp (r₂.comp r₃)` whose composed bound the calculus assembles mechanically —
the shape (calls multiplied, extras added, guards conjoined) is computed by `Red.comp`,
while the comparison arithmetic against a target claim (as in Theorem 3's parameter
choice) is discharged separately, with the donor's own lemmas.

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 | `CrossMath.RedB.Red.comp` | `research/pilots/11/RedCompB.lean:36` | [propext, Classical.choice, Quot.sound] | `research/pilots/11/logs/axcheck-final.log:386` |
| Thm 2 | `CrossMath.RedB.red_of_theorem_17` | `research/pilots/11/RedCompB.lean:86` | [propext, Classical.choice, Quot.sound] | `research/pilots/11/logs/axcheck-final.log:389` |
| Thm 3 | `CrossMath.RedB.theorem19_of_red` | `research/pilots/11/RedCompB.lean:111` | [propext, Classical.choice, Quot.sound] | `research/pilots/11/logs/axcheck-final.log:387` (donor reference compiled verbatim: `research/pilots/11/P11T2.lean:328`; donor-type print `research/feasibility/probe/logs/stepB-c2.log:60`) |
| Thm 4 | `CrossMath.RedM3.composed_21a_of_ch20_vw13` (lifts `red_of_CH20`, `red_of_VW13`) | `research/pilots/11/RedM3.lean:155` | [propext, Classical.choice, Quot.sound] | `research/pilots/11/logs/m3-run3.log:48–54` |
| Thm 5 | `CrossMath.Pilot11.M2.tm2_realized_composed` | `research/pilots/11/RedTm2.lean:392` | [propext, Classical.choice, Quot.sound] | `research/pilots/11/logs/m2-axcheck-final.log:22` |
| Thm 5 companions | `Tm2Sol.mono` (`RedTm2.lean:70`), `tm2_choice` (`:181`), `tm2_charging` (`:283`), `composed_sum_le` (`:369`, axioms [propext, Quot.sound]) | `research/pilots/11/RedTm2.lean` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/11/logs/m2-axcheck-final.log:18–21` |
| Thm 5 list lemmas | `orbit_sf` (`RedTm2.lean:252`, axioms [propext]), `map_headD_sf` (`:257`, axiom-free), `sum_sf` (`:265`, axioms [propext]) | `research/pilots/11/RedTm2.lean` | ⊆ {propext, Classical.choice, Quot.sound} or fewer | `research/pilots/11/logs/m2-axcheck-final.log:23–25` |
| calculus (comparison Design A) | `CrossMath.RedA.Red.comp`, `RedA.red_of_theorem_17`, `RedA.theorem19_of_red` | `research/pilots/11/RedCompA.lean` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/11/logs/axcheck-final.log:365` |
| transcript layer | defs in `P11T1.lean`; arithmetic port with proofs in `P11T2.lean` | `research/pilots/11/P11T1.lean`, `research/pilots/11/P11T2.lean` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/11/logs/axcheck-final.log:43` (P11T1), `:46` (P11T2) |
| transcript block (Theorem 4's file) | def-only `logU`, `IsPowLittleO`/`IsPowPolylog`/`IsBigOPow`, the two Claim statements | `research/pilots/11/RedM3.lean:33–76` | — (definitions) | in-run elaboration `research/pilots/11/logs/m3-run3.log` |
| ported machine tranche | 88 `theorem` declarations | `research/pilots/11/P11T3.lean` | ⊆ {propext, Classical.choice, Quot.sound} | `research/feasibility/probe/logs/stepB-c2.log:533–586` |

All files elaborate on mathlib `ff2494ea`, Lean v4.36.0-rc2; every printed axiom list
above is a subset of {propext, Classical.choice, Quot.sound}.

## 7. Limitations and open problems

- **Machine realizations.** The TM2 half — every calculus derivation realized by a
  single machine — is Theorem 5, conditional on the three eth interface binders
  (EthExistsTm, EthPoly, EthIsPoly). The word-RAM half — every derivation realized in
  the donor's light-language model, using its procedure-call machinery
  (`Ends.callLast`, `Ends.callTo`, `Ends.callToThen`,
  `ThreeSumApsp/Lang/Calls.lean:86–125`) — remains open.
- **The asymptotic classification port.** Theorem 4 (CH20 ∘ VW13 as one calculus
  composition) is conditional on the two donor binders, with the six asymptotic
  side-conditions surfaced at the corpus's `theorem_21a_compose` hypothesis shapes.
  What remains open is the classification port: deriving `IsPowLittleO (fun n => E₁ n +
  Num₁ n · E₂ (N n)) (3/2)` (the NOTE-carried `n^{3/2+o(1)}` of Theorem 21(a)) from
  those side-conditions requires the donor's asymptotic API with proofs
  (`Util/Asymptotics/PowLittleO.lean` + dependencies, ~300–500 lines) — a priced
  add-on planned for the next project iteration (`research/pilots/11/M3-precharter.md`
  §4); the present artifact hands the side-conditions to that port at exactly its
  hypothesis shapes. Theorem 4's axiom evidence is the run's own `#print axioms`
  output (`m3-run3.log:48–54`); the file has not yet passed a full-coverage axiom
  audit.
- The calculus is over real-valued time shapes with pointwise guards; asymptotic (`=O`)
  forms and randomized cost models are not covered.

## 8. Prior work and references

Literature:

- V. Vassilevska Williams, R. Williams, *Subcubic equivalences between path, matrix and
  triangle problems*, FOCS 2010.
- S. Fischer, arXiv:2610.32162 (2026) — context citation only, never a mathematical
  input: it opens "since the 3SUM Hypothesis was recently refuted" and rebuilds
  geometric quadratic lower bounds under a replacement "k-AP Hypothesis", externally
  corroborating the refutation premise the 3sum-apsp corpus formalizes and motivating
  the CH20∘VW13 acceptance's currency (the field re-anchors lower bounds on
  replacement hypotheses; Exact Triangle is the standard anchor, CH20∘VW13 its
  3SUM-side bridge). It proves nothing about CH20∘VW13 and is cited as if it did
  nowhere.

Project artifacts:

- donor corpus `anthropics_formal-math/3sum-apsp`: `TimeClaims/Sec3/Definitions.lean`
  (:54–58 the call-charging convention; :75–101 the `DetTimeModel` fields; :189 the
  partiality convention; :192–199 `Claim.Theorem_17`; :219 `Claim.CH20_Theorem_5_1`;
  :235 `Claim.VW13_Theorem_4_3`; :295 `Claim.Corollary_16`; :305
  `Claim.Theorem_19_explicit`), `TimeClaims/Sec3/Theorem19.lean:107–125` (the donor
  acceptance theorem), `Sec3/Theorem19.lean:91–145` (the parameter-choice arithmetic),
  `Lang/Calls.lean:86–125` (the procedure-call machinery).
- eth (interface statements): `proof/machines/ToTuring/Machine/Host.lean:305–309`
  (`exists_tm`), `proof/machines/ToTuring/Poly/Comb.lean:50,63`,
  `proof/machines/ToTuring/Closure/Basic.lean:53–127`, `MainResults.lean:158`.
- this project: `research/pilots/11/` (Lean sources and logs),
  `research/feasibility/probe/logs/stepB-c2.log`,
  `research/candidates/11-z1-composable-reduction-theory.md`,
  `research/pilots/11-blueprint.md`, `research/pilots/11/M3-precharter.md`,
  `research/bridges/complexity.md`.
