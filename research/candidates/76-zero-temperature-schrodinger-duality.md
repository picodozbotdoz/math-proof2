# Candidate dossier 76 — zero-temperature-schrodinger-duality

Lane R6 (fresh-bridge scan), 2026-11-16. Realizes the fresh territory-(a)+(b) junction of
`research/novelty/iter4-fresh-bridges.md` §3 FB-1 (the scan map's queries and nearest-miss
rg evidence are folded below). Tags: [VERIFIED] = read at the cited locator this lane;
[HYPOTHESIS] = proposed new content. **[NOVELTY-CHECK RESOLVED — R7 gate-sweep landed
2026-11-16, both rungs clear, grade B → B+** (`research/qa/iter4-review/r7-bib-cards.md`
§A; relayed via coordinator — full text read from the pre-move path `qa/iter4-review/`
same session): T1b (zero-temperature *dual* limit) = NEAREST-MISS — no dual/potential
statement anywhere in the literature; T2 (substitution-rule soundness characterization) =
NOVEL as a question type, canonical nearest-miss Allamigeon–Benchimol–Gaubert–Joswig's
tropical simplex (pivoting, no rule characterization). One conditional survives: CDPS
2017's body is paywalled (SIAM), so a body-level dual-content check is NOT DONE — if the
pilot proceeds to T1b, someone with SIAM access eyeballs CDPS §on potentials. All R7
must-cites are folded into the Novelty section below.] Not in any existing bridge-map zone
(checked: `bridges/complexity.md` Z1–Z5 own the machine-model junctions, not transport;
`bridges/area-law.md`/`linear-algebra.md` own matrix/entropy zones; no corpus map treats
optimal transport).

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

**Regime honesty (R7 must-cite, Gwozdz arXiv:2607.16881, "Entropic optimal transport need
not select a zero-temperature limit", 2026):** zero-temperature selection is NOT automatic
in general — Gwozdz constructs entropic-OT minimizers that fail to converge as ε→0, plus
compactness criteria. T1 is stated **only for finite supports** (equivalently, tauceti's
discretisable-cost regime — the block-approximation hypothesis of
`ZeroTemperature.lean`), where selection IS honest; the dossier claims nothing in the
general-measure regime, and the contrast with Gwozdz's counterexample must be stated in
any writeup.

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
**Canonical nearest-miss (R7):** Allamigeon–Benchimol–Gaubert–Joswig, "Tropicalizing the
simplex algorithm", arXiv:1308.0454 (v2 2014; SIAM J. Discrete Math. 29:2 (2015), DOI
10.1137/130936464) — tropical simplex, one tropical pivoting step incl. reduced costs in
O(n(m+n)); **no characterization of pivoting/substitution rules (criterion ⟺ soundness)
anywhere in the line** — T2's question type is unclaimed.

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

**Literature [RESOLVED — R7 gate-sweep, 2026-11-16, `research/qa/iter4-review/
r7-bib-cards.md` §A; both rungs clear].** Cite-card set (all consulted by R7 2026-11-16):

- **CDPS 2017** — G. Carlier, V. Duval, G. Peyré, B. Schmitzer, *Convergence of entropic
  schemes for optimal transport and gradient flows*, SIAM J. Math. Anal. 49 (2017),
  1385–1418 (tauceti's own header cite, `ZeroTemperature.lean:82–84`). The tauceti
  citation line scopes CDPS to "the block approximation of a coupling and the convergence
  of entropic transport as ε → 0" — **primal quantities**. Not on arXiv; SIAM body
  paywalled ⇒ body-level dual-content check NOT DONE: **conditional residue — if the
  pilot proceeds to T1b, a paywall pass over CDPS §on potentials is mandatory** (expected:
  primal-only, per the tauceti scoping; treat as cite-for-primal until then).
- **Zero-temperature dual sweep** (arXiv `all:"zero-temperature" AND all:"optimal
  transport"`, 7 hits): none proves dual-value or rescaled-potential convergence to the
  Kantorovich dual. Nearest miss: **Mengue, arXiv:2501.19369** (2025, "Optimal
  transportation and pressure at zero temperature") — Kantorovich duality recovered from a
  β→∞ *pressure* (primal) variational limit, not from Schrödinger dual potentials —
  MUST-CITE as the closest formal cousin. Cite-optional: Caputo–Gerolin–Monina–Pelikh–
  Portinale, arXiv:2602.23144 (quantum-thermodynamics SDP, dual maximizers +
  zero-temperature limits; different setting).
- **MUST-CITE / structural caution**: **Gwozdz, arXiv:2607.16881** (2026, "Entropic
  optimal transport need not select a zero-temperature limit") — entropic-OT minimizers
  can fail to converge as ε→0; compactness theorem + convergence criteria. T1's honesty
  rests on the finite-support/discretisable regime (stated in the Statement section); the
  contrast is mandatory in every writeup.
- **Tropical Sinkhorn**: arXiv `all:"tropical" AND all:"Sinkhorn"` = **0 hits** — the
  phrase-class is empty (checked 2026-11-16); the Akian–Gaubert-school concern from the
  pre-dossier does not materialize as a Sinkhorn-dual competitor.
- **Tropical LP / simplex line (T2's nearest-miss set)**: ABGJ arXiv:1308.0454 (canonical
  nearest-miss, above); **Butkovič, arXiv:1709.08983** (2017) — strong/weak duality of
  tropical LP, no gap (the duality substrate, no rules) — MUST-CITE; **Loho,
  arXiv:1612.01890** (2016/17) — signed tropical matroids, simplex/mean-payoff connections;
  **Adenwalla–Braunfeld–Hons–Sylvester–Zamaraev, arXiv:2607.23754** (2026) — decidability
  via tropical LP feasibility + mean-payoff game duality (line is active; nothing on
  rules); optional: Sergeev–Liu arXiv:1902.10055 (tropical bilevel), Joswig–Kulas
  arXiv:0801.4835 (tropical simplex as geometric object). **No paper in the line states a
  soundness criterion of the dominating/eligible-ordering ⟺ sound shape.**
- **Truffet literature (LOCATED — was "unlocated" in the pre-dossier)**: **Truffet,
  arXiv:2603.26423** "Substitution for minimizing/maximizing a tropical linear
  (fractional) programming" (v1 2026-03-27 … **v4 2026-08-29**) — the
  target-of-refutation; no soundness theorem for the substitution steps, no
  erratum/counterexample note at abstract level. **Truffet, arXiv:2604.06726** "Linear
  Programming Problem Solved By a Special Substitution Method" (v1 2026-04-08, **v4
  2026-08-29** — same v4 date as the tropical paper, matching `TruffetV4Counterexample`'s
  "V4" pin) — the classical sibling; abstract claims the method inherits correctness +
  strong polynomiality for **general LP** (unrefereed, open-problem-grade claim).
  Author-lineage correction pattern (supports the soundness-gap reading): Lahlou–Truffet
  arXiv:2106.08854 (Max-atom in P) carries a public errors-pointed-out note, superseded by
  Truffet arXiv:2408.14256. **No follow-ups/citations found anywhere** (Semantic Scholar
  citations of 2603.26423 = ∅, API 2026-11-16, S2-indexing caveat noted; no arXiv paper
  citing/refuting either; the `dominating/eligible` vocabulary is OAI-internal).

**Known nearest misses.** (i) tauceti `ZeroTemperature.lean` — the primal half, exact
statement shapes above; T1 is its dual mirror. (ii) tauceti `Entropic/Duality.lean` —
fixed-ε no-gap duality, the engine T1 consumes. (iii) OAI `finite_execution_not_optimal`
— the witness T2 explains. (iv) CDPS 2017 (primal-scoped, paywall-conditional). (v)
Mengue 2501.19369 (pressure-limit primal cousin of T1). (vi) ABGJ 1308.0454 (tropical
pivoting without rule characterization). (vii) Butkovič 1709.08983 (tropical duality
substrate for T2's semantics). (viii) Truffet 2603.26423 v4 / 2604.06726 v4 (the refuted
and the sibling claim).

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
- Risks: (i) **[RESOLVED by R7]** the CDPS/tropical-Sinkhorn novelty sweep cleared both
  rungs — the surviving conditional is the **CDPS paywall pass** (mandatory only if the
  pilot proceeds to T1b; expected outcome primal-only per tauceti's own scoping line);
  (ii) **[RESOLVED by R7 — LOCATED]** the Truffet papers are arXiv:2603.26423 v4 +
  2604.06726 v4 with **no soundness theorem, no erratum, no citing papers** — the
  "comparator may already contain T2's criterion" risk is retired; T2's question type is
  unclaimed (grade note B → B+ per R7); (iii) `ℝ≥0∞`-valued dual bookkeeping friction at
  infinite costs (mitigate: state T1 for real-valued bounded cost first); (iv) Gwozdz's
  non-selection counterexample — T1 must never be phrased beyond the
  finite-support/discretisable regime (the Statement section's regime-honesty block is
  load-bearing, not prose).

## Follow-ups (post-R7)

- **HIGH-VALUE OPTION (R7's side-finding, flagged):** the classical sibling Truffet
  arXiv:2604.06726 v4 claims a strongly-polynomial substitution method for **general LP**
  (unrefereed). If the OAI counterexample pattern (`TruffetV4Counterexample`'s
  forced-step-loses-optimality shape) extends to the classical criteria, that is a
  **refutation of a claimed strongly-polynomial LP method** — high-value, high-care:
  the transfer is a mathematical argument (criteria-to-criteria), not a citation; date
  against both v4s; never claim before the classical transcription is itself verified.
- CDPS paywall pass (conditional, above).

## Significance

First formal zero-temperature duality theorem anywhere (no corpus has any transport in
mathlib; tauceti's is the only built stack), plus the first positive statement about the
tropical pivot rules the OAI counterexample leaves open. T2 is the discovery rung: a
soundness criterion for tropical substitution would be the theorem the Truffet program
wanted before its V4 rule failed — and its question type is unclaimed in the literature
(R7, 2026-11-16). Grade: **B+** (R7-folded; was B at pre-dossier).

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):

## Battery (2026-11-17)

Executor: lane A3 (worktree agent-04 @ 53c1548), written/evidence work only, no Modal,
siblings read-only. Discharges the charter gate *"no FB charter before its
dossier-level battery"*. Inputs read this session: this dossier; fresh-bridges §3 FB-1
+ §5 yield block; week1-agenda row 4; **dossier 78 (post-P0 landscape —
`candidates/78-truffet-substitution-refutation.md`, pilot-78 Stage-A GREEN
2026-11-17)**; `novelty/iter4-truffet-classical-scope.md` §10.1 (the fidelity
dictionary); G13 log (`feasibility/probe/logs-g/run39-g13-fix.log`); full read-only
censuses of tauceti and openai-math. All [V] = verified at the cited locator this
session.

### (1) tauceti census — the zero-temperature limit object's surface (T1's consumption list)

**The dossier's open `[NOVELTY-CHECK-NEEDED]` item (read `OptimalTransport/Duality/`
in full) — EXECUTED AND RESOLVED, with a correction to this dossier's own Novelty
section:** the directory-read claim *"its content is the entropic + `Data/Matrix/
Scaling` duality"* was WRONG. `OptimalTransport/Duality/` (10 files, 2,624 LoC) is the
**unregularized Kantorovich duality**: `DualFeasible` (`Duality/Basic.lean:75`),
`kantorovichDualValue` (:147), weak duality `kantorovichDualValue_le_transportCost`
(:219–:236), sup-characterizations `isLUB_kantorovichDualValue_continuous`
(`Compact.lean:390`) and `_integrable` (:414), `transportCost_eq_sSup…`
(`LowerSemicontinuous.lean:133/:183`), dual-certificate attainment
`exists_isDualCertificate_of_continuous` (`Attainment.lean:132`, greatest-value form
:144), and the Schachermayer–Teichmann cyclical-monotonicity characterization
(`SchachermayerTeichmann.lean:75/:103`). The finite regime is also donor-native:
`Finite/Duality.lean` — `finiteDualValue` (:98), weak duality (:189), **strong duality
with attainment** `exists_cost_eq_finiteDualValue` (:564) and
`exists_isLeast_cost_isGreatest_finiteDualValue` (:622), compactness
`isCompact_realPlans` (:269), and the bridge `finiteDualValue_eq_kantorovichDualValue`
(:719); `Finite/Entropic.lean:179` `entropicDualValue_eq_mul_relEntropyDual` (fixed-ε
identification) consuming that bridge (:226).

**The gap T1 fills is confirmed, not collapsed:** zero entropic tokens anywhere in
`Duality/` (rg = 0); zero `entropicDualValue`/dual tokens in `ZeroTemperature.lean`
and in `Entropic/Selection.lean` (rg = 0); `Finite/Duality.lean` has zero entropic
tokens; `Finite/Entropic.lean` has no limit content. The dual value/potentials never
meet the ε→0 limit anywhere in-tree. `Entropic/Selection.lean` (which imports
`ZeroTemperature`, header selection story) is purely PRIMAL — 7 theorems :51–:178, no
dual object appears. In-corpus novelty of T1a/T1b STANDS; R7's literature nearest-miss
verdict unchanged.

**Feasibility UPGRADE (material):** T1's Kantorovich value `V` and T1b's target dual
pair are now donor-native (`kantorovichDualValue` + `isLUB_*`, or `finiteDualValue` +
`exists_isLeast_cost_isGreatest_finiteDualValue` :622 in the finite regime) — the
Feasibility section's plan to build `V` from the seed-9 LP-weak-duality layer is
superseded (that layer remains a fallback). The remaining cited surface verifies
verbatim: `entropicTransportCost` (`Entropic/Basic.lean:443`), `entropicGibbsFactor`
(`Entropic/Duality.lean:102`), `entropicDualValue` (:294), no-gap attainment
`exists_isCoupling_lintegral_add_mul_klDiv_eq_entropicTransportCost`
(`SchroedingerSystem.lean:600`), `iInf_entropicTransportCost`
(`ZeroTemperature.lean:223`), `tendsto_entropicTransportCost_nhdsGT_zero` (:240),
`tendsto_entropicTransportCost_transportCost` (:270, `_of_continuous` :320),
`isOptimalCoupling_of_tendsto_of_entropicTransportCost` (:504).

**Graded-CAR/occupation/trace census (the queue's literal ask) — exists, and has ZERO
intersection with the zero-temperature object:** `carOccupationElement`
(`Algebra/Lie/GeneralLinear/CAR/Occupation.lean:70`),
`isIdempotentElem_carOccupationElement` (:121), `commute_carOccupationElement`
(:138); `carCasimirElement_mem_even` (`CAR/Casimir.lean:169`) and
`carCasimirElement_eq_scalar` (:231) — both **private** (precision vs dossier 77's
citations: private = inaccessible cross-module; a 77-side consumer needs them
publicized or re-proved); `carLieModule_isFaithful` (`GeneralLinear/Fock.lean`,
dossier 77 cites :167); `traceQuadraticForm` (`GeneralLinear/TraceForm.lean:177`).
Import-edge check both directions between `Algebra.Lie.GeneralLinear.*` and
`MeasureTheory.OptimalTransport.*`: **0 and 0** [V rg]. The CAR stack is dossier 77's
substrate (FB-5), not a dossier-76 input — the collision test between the two FB
dossiers' pilot surfaces is CLEAN (disjoint namespace trees, no shared imports).

### (2) OAI/physlib side — what T1/T2 need as binders vs what exists

- **T1 (both rungs): no binders beyond data.** No donor statement outside
  tauceti+mathlib is consumed (Fintype types, cost, marginals, ε > 0; `V` and the
  target pair donor-native per census (1)). No physlib content is a T1 input:
  physlib's QuantumInfo wing (entropy/states/channels + trace-inequality stack +
  NumberOperator calculus — the physlib-surface §6 dated correction, LIVE on master
  2026-11-16) is potential *future-consumer* territory for entropic duality, not a
  76-side binder source.
- **T2: OAI substrate verified + now repo-native.** `TruffetModel.lean` cites verify
  verbatim [V]: `eval` :33, `feasible` :36, `lower` :39, `upper` :43, `dominating`
  :47, `lowerForm` :69, `advance` :80, `ForcedSingletonStep` :86, `initial` :93,
  `better` :116; `finite_execution_not_optimal` (`TruffetCounterexample.lean:126`).
  Statement-port ≈ 0 stands; no build dependency. **New since this dossier was
  written: dossier 78's P0 landed the full procedure-layer transcription IN-REPO on
  our pin** (`pilots/78/P0.lean`, 444 LoC, A1+A2+A2′ triad-clean, run-4 log —
  *2026-11-21 cross-note: A2′ remains kernel-proved in the pilot but is RETRACTED as a
  claimed article finding (homogeneity artifact; dossier-78 note (b)) — reusable here
  only as a pilot-level fact, not as an article-78 headline*) —
  `paperCandidates`/`paperSelect`/`advance`/`terminal` + the separating instance now
  exist repo-natively and are reusable by any T2 charter (no re-transcription).
- **G13/seed-13 respect note (per A8's feed note — stands alone, not folded in):** G13
  (`ProbeG13_PhyslibOccupation.lean`, GREEN `logs-g/run39-g13-fix.log`) is article-52's
  `OccupationPair` layer instantiated on QUOTED physlib `CrAnFieldOp` shapes —
  relation-layer donation FROM us; physlib is v4.35.0, DO-NOT-CONSUME as build
  dependency (Liu-1 convention). Zero interaction with the entropic-duality
  statement; recorded here only to close the adjacency question the battery was asked
  to respect.

### (3) The tropical substitution-rule question after dossier 78 (the dual hook, re-dated)

**The zero-T limit statement (T1) does NOT intersect dossier 78's fidelity
dictionary.** That dictionary (`novelty/iter4-truffet-classical-scope.md` §10.1,
CLOSED on the forced-singleton class; kernel-checked as theorem A1 in
`pilots/78/P0.lean`) maps OAI `TruffetModel` states ↔ the Truffet-2026 paper's
procedure machinery — tropical-procedure-side objects. T1 is entropic-OT-side; the two
rungs of FB-1 were thematically paired (both "what the ε→0 / substitution limit
leaves open"), not mathematically joined. No shared object, no interaction [V: zero
overlap between the census-(1) surface and dossier 78's transcription].

**Where the landscape DID change is T2:** dossier 78 (article-GO, discovery-grade
NEGATIVE) proved at procedure level — stronger than this dossier's model-level plan —
that the paper's own run loses optimality on a two-row bounded instance which is in
fact unbounded below (A2/A2′). Consequences: (i) 76-T2's S-class first instance (the
separating-instance verification on the donor's numerals, Proof-strategy step 3) is
SUPERSEDED by 78's stronger version; (ii) what remains unclaimed for 76-T2 is the
POSITIVE criterion (both-sided-dominance sufficiency; the "unsound *precisely
because* one-sided" characterization) — confirmed still unclaimed by dossier 78's
hardened 2026-11-17 sweep (empty critique space; no soundness theorem in the
Truffet/ABGJ/Butkovič lines); (iii) T2 is now SEQUENCED BEHIND 78: the criterion is
the sound-replacement chapter of the same story, best chartered after article-78's
care framing settles (or at 78's Stage-B decision, which may consume it).

### (4) Battery verdict: **NOT-YET** (iteration-4 FB charter), remnant precisely scoped

- **T1a — CHARTER-GO-able as an OPTIONAL small technical record** (knowledge-grade,
  formalization-first billing, never article — ZZV2-λ/LP posture). Evidence: novelty
  clean in-corpus (census (1)) and in-literature (R7 nearest-miss); feasibility
  UPGRADED to S-class assembly by the donor-native Kantorovich duality + finite
  strong duality + no-gap attainment (est. ≤ 0.5k LoC; the sandwich
  `V ≤ liminf Dε ≤ limsup Dε ≤ V` consumes `SchroedingerSystem.lean:600` +
  `Finite/Duality.lean:622`/`Duality/Compact.lean:390` verbatim). Under cap-N = 1 with
  dossier 78 GO and 75-Pb the discovery lead, this is cycle filler at the
  orchestrator's option, not a gap.
- **T2 — NOT-YET (sequencing, not merit):** absorbed-adjacent to dossier 78;
  revisit trigger = article-78 close OR a 78-Stage-B charter. The substrate is
  repo-native (pilots/78), the question unclaimed.
- **T1b — PARKED** (week1-agenda row 4 ruling stands: T1b NOT in scope ⇒ the CDPS
  paywall conditional does not fire).
- **KILL: no rung merits it** — T1a clean-and-cheap, T2 unclaimed-and-reusable,
  T1b parked-not-dead.

— battery by lane A3, 2026-11-17; the charter decision is the orchestrator's.
