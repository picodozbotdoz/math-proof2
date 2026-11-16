# Candidate dossier 76 — zero-temperature-schrodinger-duality

Lane R6 (fresh-bridge scan), 2026-11-16. Realizes the fresh territory-(a)+(b) junction of
`research/novelty/iter4-fresh-bridges.md` §3 FB-1 (the scan map's queries and nearest-miss
rg evidence are folded below). Tags: [VERIFIED] = read at the cited locator this lane;
[HYPOTHESIS] = proposed new content. **[NOVELTY-CHECK-NEEDED — DELEGATED to R7]:** the
mandatory informal-literature differentiation sweep (Carlier–Duval–Peyré–Schmitzer 2017 and
the tropical-Sinkhorn line: Akian–Gaubert school; web-search quota was exhausted in the R6
session) is R7's to run before triage; the sweeps and their kill effects are itemized in
the Novelty section. Not in any existing bridge-map zone (checked: `bridges/complexity.md`
Z1–Z5 own the machine-model junctions, not transport; `bridges/area-law.md`/`linear-algebra.md`
own matrix/entropy zones; no corpus map treats optimal transport).

## Name

zero-temperature-schrodinger-duality

## One-line pitch

tauceti proves the ε→0⁺ limit of the entropic transport *cost* but never of its *dual*;
combining tauceti's no-gap entropic duality with the finite-support LP-duality layer yields
the missing dual half — convergence of rescaled dual values and potentials to the
Kantorovich pair — and the OAI Truffet counterexample names the tropical question that
result closes around: which tropical substitution rules preserve optimality.

## Precise mathematical statement

**Setting [VERIFIED].** Finite types `X Y` (Fintype), cost `c : X × Y → ℝ≥0∞`, probability
measures `μ ν`. tauceti's objects (all on our pin, direct dep):

- `TauCeti.entropicTransportCost c ε μ ν` (`Entropic/Basic.lean:443`) — inf over couplings
  π of `∫⁻ c dπ + ε * klDiv π (μ ⊗ ν)`;
- `TauCeti.entropicDualValue c ε μ ν φ ψ` (`Entropic/Duality.lean:294`) — the unconstrained
  dual `∫ φ dμ + ∫ ψ dν − ε ∫ (exp ((φ + ψ − c)/ε) − 1) d(μ ⊗ ν)`, Gibbs factor
  `entropicGibbsFactor` (`Duality.lean:102`);
- `TauCeti.exists_isCoupling_lintegral_add_mul_klDiv_eq_entropicTransportCost`
  (`Entropic/SchroedingerSystem.lean:600`) — bounded cost: dual attained, no gap, optimizers
  unique up to one additive constant (header :22–36);
- `TauCeti.iInf_entropicTransportCost` (`ZeroTemperature.lean:223`),
  `tendsto_entropicTransportCost_nhdsGT_zero` (:240), `tendsto_entropicTransportCost_
  transportCost` (:270, discretisable cost; `_of_continuous` :320 compact case),
  `isOptimalCoupling_of_tendsto_of_entropicTransportCost` (:504) — the PRIMAL limit theory;
  `entropicDualValue` appears nowhere in `ZeroTemperature.lean` (rg = 0).

**T1 (dual limit, glue rung).** Define `Dε := sup_{φ,ψ} entropicDualValue c ε μ ν φ ψ` and
the Kantorovich value `V := inf_{π coupling} ∫⁻ c dπ`. Then:

(T1a) `lim_{ε→0⁺} Dε = V` (dual value convergence);
(T1b) for ε_k → 0⁺ and dual optimizers `(φ_k, ψ_k)` normalized by `∑_x μ x * φ_k x = 0`,
every cluster point `(φ*, ψ*)` (compactness: potentials bounded by the cost diameter) is a
Kantorovich-dual optimal pair: `φ* ⊕ ψ* ≤ c` (as an inequality on `X × Y`, `ℝ≥0∞`-valued)
and `∫ φ* dμ + ∫ ψ* dν = V`.

**T2 (tropical soundness criterion, discovery rung).** In the OAI tropical-LP state
machine (`OAI.TruffetV4Counterexample`, `Optimization/Tropical/TruffetModel.lean`: `eval`
max-plus `:33`, `feasible :36`, `advance :80`, `ForcedSingletonStep :86`, `initial :93`,
`better :116`; proved counterexample `finite_execution_not_optimal`
`TruffetCounterexample.lean:126` — a forced two-step execution whose output is strictly
beaten by the feasible point `better`): call a pivot rule (a function selecting
`(i, j)` among `eligible` states) **sound** if every maximal execution it generates ends in
a state `s` with `eval s.cost w = inf over feasible w of the initial cost`. **Theorem
target:** a sufficient soundness criterion phrased via `dominating`/`lower`/`upper`
(`TruffetModel.lean:44–56`) — candidate form: *a rule is sound if it only pivots on
variables that are both lower- and upper-dominated (dominating on both sides), and the V4
eligibility rule is unsound precisely because `eligible` admits one-sided dominating
variables* — with the two-step `initial → middle → finalState` execution of
`finite_execution_not_optimal` as the separating instance already proved in-donor.

## Novelty check

**In-corpus (rg, run 2026-11-16, patterns and counts).**
- tauceti: `rg -c 'entropicDualValue' TauCeti/MeasureTheory/OptimalTransport/Entropic/ZeroTemperature.lean` → **0**
  (the dual never meets the limit); `entropicDualValue` occurrences live only in
  `Duality.lean`/`SchroedingerSystem.lean` (fixed-ε theory). No `Kantorovich` dual-value
  object anywhere in the OT tree (the Kantorovich dual for the unregularized problem is
  itself not developed — tauceti's `OptimalTransport/Duality/` dir exists; its content is
  the entropic + `Data/Matrix/Scaling` duality, checked via directory read).
  **[NOVELTY-CHECK-NEEDED]: read `OptimalTransport/Duality/` in full** — if an
  unregularized Kantorovich duality with a zero-temperature corollary is already there,
  T1 collapses to citation-grade (kill T1b's novelty, keep T1a only if absent).
- mathlib: `rg -il 'kantorovich|wasserstein|optimal.?transport' Mathlib/` → **0**
  (no transport at all; `Algebra/Tropical/Basic.lean:60 def Tropical` is the max-plus
  semiring layer T2's semantics would target).
- openai-math: `Optimization/Tropical/` = exactly `TruffetModel` + `TruffetCounterexample`
  (find); no convergence/limit theorem (the tree's only theorem is
  `finite_execution_not_optimal` — a NEGATIVE result). `ComparatorChallenges/
  TruffetCounterexample.lean` exists (companion target); **[NOVELTY-CHECK-NEEDED]: read the
  comparator's MainClaim** — if the paper's actual theorem is a positive soundness result,
  T2 is FORMALIZATION-OF-RECENT and must be re-graded.
- anthropics: no transport, no tropical (surveys).

**Literature [DELEGATED to R7 — mandatory before triage].** (1) Carlier–Duval–Peyré–Schmitzer
2017, "Convergence of entropic schemes for optimal transport and gradient flows" — cited
*inside tauceti's own* `ZeroTemperature.lean` header (read) for the primal block
approximation; R7 must check whether its §on potentials already states T1a/T1b. If T1b is
there verbatim → T1 drops to formalization-of-known (grade C+); T1a alone, stated for
finite supports with the tauceti dual functional, may survive as glue. (2) The
tropical-Sinkhorn literature (Akian–Gaubert school; max-plus entropy optimization;
arXiv listing search "tropical Sinkhorn", "Sinkhorn max-plus", "zero temperature Schrödinger
potentials"): R7 dates and diffs any dual-convergence statement; T2's rule-characterization
has no candidate source we know of — R7 should also sweep the (unlocated) Truffet paper
(rg the OAI preprint listing for "Truffet"/"tropical"). Cross-reference
`novelty/round-1.md`..`round-4.md` once R7's verdict lands — until then every grade below
carries `[R7 confirmation pending]`.

**Known nearest misses.** (i) tauceti `ZeroTemperature.lean` — the primal half, exact
statement shapes above; T1 is its dual mirror. (ii) tauceti
`Entropic/Duality.lean` — fixed-ε no-gap duality, the engine T1 consumes. (iii) OAI
`finite_execution_not_optimal` — the witness T2 explains. (iv) CDPS 2017 (informal,
cited in-tauceti) — see delegation.

## Bridge analysis

- Corpora bridged: tauceti (entropic machinery; our pin, BUILT direct dep) × openai-math
  (tropical objects + failure witness; v4.34.1, statement-port≈0) × mathlib (`Algebra/
  Tropical` semiring + the seed-9 LP weak-duality layer as the finite Kantorovich duality
  engine, `feasibility/lp-duality-bridge.md`).
- Why the bridge is essential: tauceti has no tropical state machine and no dual limit;
  OAI has no entropic machinery and no positive theorem; mathlib has neither transport nor
  tropics assembled. T1 needs tauceti's attainment + a finite LP duality; T2 needs OAI's
  eligibility/dominance vocabulary and its counterexample as the separating instance.
- Empty-zone fit: new — the R6 scan's territory-(a) tropical junction
  (`novelty/iter4-fresh-bridges.md` §1(a), §3 FB-1); no prior bridge-map entry.

## Proof-strategy sketch

1. (T1a) For bounded `c`: by tauceti's no-gap attainment (`SchroedingerSystem.lean:600`)
   pick dual optimizers `(φε, ψε)`; weak duality (`Duality.lean`,
   `ofReal_integral_sub_integral_indicator_exp_sub_one_le_klDiv` family) gives
   `Dε = entropicTransportCost c ε μ ν`; now sandwich `Dε` between `V` and
   `V + ε·(finite klDiv bound)` using the block-approximation coupling argument ported
   from `ZeroTemperature.lean`'s `_of_continuous` route (finite supports: the partition is
   the identity — the discretisation hypothesis is free). New content: assembling the
   sandwich in the dual variable; routine analysis.
2. (T1b) Normalize `∑ μ x φ x = 0` (invariance: dual value is shift-invariant in `(φ,ψ)`
   jointly — prove as a one-line lemma from the `entropicDualValue` def :294); extract a
   cluster point by compactness of bounded potentials on finite types (mathlib
   `Compact`/`BolzanoWeierstrass` on `Fin n → ℝ`); the constraint `φ ⊕ ψ ≤ c` passes to the
   limit through `entropicGibbsFactor` (:102) decay; optimality from T1a. The genuinely
   new idea is step 2's normalization-shift trick; the rest is assembly.
3. (T2) First instance S-class: verify on the donor's numerals (`initial/middle/finalState`
   are explicit) that the V4 pivot `(0,1)` then `(1,0)` is exactly a one-sided-dominating
   choice sequence, by `decide`/`norm_num` over `TruffetModel`'s defs. General rung M:
   define `SoundRule` over the `State`/`eligible` structures restated mathlib-only
   (statement-port of `TruffetModel` defs ≈ 0 — they are `WithBot ℝ` linear algebra),
   prove the both-sided-dominance criterion by a tropical-substitution induction
   (each `advance` preserves the feasible-value infimum when the pivoted variable is
   dominated on both sides — the invariant is the min-plus analogue of `lowerForm`
   being a valid reparametrization; cite `substitute`/`lowerForm` TruffetModel.lean:70–80).

## Feasibility

- mathlib API entry points: `Mathlib.Algebra.Tropical.Basic` (T2 semantics target),
  `MeasureTheory` finite-type instances, `Analysis.Convex.Cone.Basic` + the seed-9
  lp-weak-duality layer (T1's Kantorovich duality core); tauceti imports
  `TauCeti.MeasureTheory.OptimalTransport.Entropic.{Basic,Duality,SchroedingerSystem,
  ZeroTemperature}` (legal direct dep, same pin).
- Donor lemmas: everything named in the Statement section (tauceti, direct import);
  OAI `TruffetModel`/`finite_execution_not_optimal` (statement-port + cite; donor-pin
  build NOT needed — defs are self-contained `WithBot ℝ` algebra).
- Missing glue: the shift-invariance lemma for `entropicDualValue`; the compactness
  extraction; T2's `SoundRule` definition and induction — all S-sized.
- Effort: T1 S–M (~600–1,500 LoC incl. restated dual objects); T2 first instance S,
  general M. Substrate class: `crossmath-probe` (tauceti direct dep, no donor builds).
- Risks: (i) R7's CDPS sweep kills T1's novelty (then re-scope to the finite-support
  explicit-constants form + T2); (ii) the Truffet comparator's MainClaim may already
  contain T2's criterion (re-grade to FORMALIZATION-OF-RECENT); (iii) `ℝ≥0∞`-valued dual
  bookkeeping friction at infinite costs (mitigate: state T1 for real-valued bounded cost
  first).

## Significance

First formal zero-temperature duality theorem anywhere (no corpus has any transport in
mathlib; tauceti's is the only built stack), plus the first positive statement about the
tropical pivot rules the OAI counterexample leaves open. T2 is the discovery rung: a
soundness criterion for tropical substitution would be the theorem the Truffet program
wanted before its V4 rule failed. [R7 confirmation pending on both halves' informal
novelty.]

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
