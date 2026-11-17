# Candidate dossier 78 — truffet-substitution-refutation

Lane A7 (external prior-art / classical-scope, R7-successor), 2026-11-17. Elevated from
`research/novelty/iter4-truffet-classical-scope.md` §10 (week-1 agenda row 3; go-condition
(i) CLOSED — the fidelity back-mapping of §10.1 is this dossier's load-bearing input).
Kind per the iteration-4 gate: **NEGATIVE (candidate DISCOVERY-grade)**. Tags:
[VERIFIED] = read at the cited locator this session (both PDFs in full, 2026-11-17;
sibling Lean files read-only); [PAPER-ONLY] = paper mathematics of §10.1, no Lean yet;
[HYPOTHESIS] = proposed pilot content.

## Name

truffet-substitution-refutation

## One-line pitch

The OAI tropical counterexample, fidelity-verified at the selection level (§10.1), is a
refutation of Truffet's v4 tropical substitution *procedure itself* — not merely of an
abstraction of it: the paper's own criteria, run verbatim on a two-row bounded instance,
assert a finite minimum that an explicit feasible witness beats by a full unit (and the
instance is in fact unbounded below); the classical sibling's Smale-9th-staking theorem
(arXiv:2604.06726 Thm 2.1) rests on the same never-justified single-bound elimination.

## Precise mathematical statement

**Setting [VERIFIED].** mpr per 2603.26423v4 (6a)–(6f): min z over the max-plus cone
a⁺_{i,·}⊗w ≥ a⁻_{i,·}⊗w, z ≥ c^T⊗x ⊕ c_h⊗h, h > O, z and h non-substitutable;
procedure = §4.2.3 case ladder, candidate set (53a)–(53b) (the D-gate), Theorem 4.3
selection (T-filter (43)–(44), θ/θ′ (45)/(50), argMin (47)/(52)), substitution and update
§4.2.4 (x_{j\*} := f≥_{i\*j\*} (27); cost := f_{z,i\*j\*} (29)/(56); cone update
(57)–(59); `setrowtozero` (7)). OAI substrate: `OAI.TruffetV4Counterexample`
(`openai-math/lean/OAI/Optimization/Tropical/TruffetModel.lean` :33–:116,
`TruffetCounterexample.lean` :126 — sibling, read-only; re-transcribed in-repo at pilot
time, no build dependency).

**Stage A — tropical refutation, publishable as stated.**

- **A1 (fidelity, [PAPER-ONLY] §10.1; pilot theorem).** For every state s of the common
  class on which the procedure is in Case 2.2.2 with singleton (53b)-set {(i\*,j\*)},
  the procedure selects Sθ≥ = {(i\*,j\*)} by (47) — no θ-value, Rλμ domain, or hB/hU
  classification participates — and performs `advance s i* j*`. (Formalizable as a
  finite case check over the 2×3 state class, or generically.)
- **A2 (refutation run, [PAPER-ONLY] §10.1; pilot theorem).** On the instance I =
  OAI `initial` (rows x₂ ≤ x₀⊕x₁ and 1⊗x₁⊕(−2)⊗x₂ ≤ x₀; cost x₀; Def-4.2-bounded),
  the procedure's run is initial →(0,x₁) middle →(1,x₀) terminal (both steps Case 2.2.2
  singleton selections per A1), terminates in Case 2.1 asserting **min z = 1** at
  x = (1,0) — while `better = (0,−1,0)` is feasible with z = 0, and the true infimum is
  −∞ (feasible family (−N,−N−1,−N)). Statement shape: `finite_execution_not_optimal`
  with the procedure layer replacing the modeled eligibility.

**Stage B — classical extension [HYPOTHESIS].** De-tropicalized transcription of
2604.06726 Thm 6.2 (eqs. 96–100; Prop 6.6 D-gate; Defs 5.2/6.1/6.2; Nearest-to-zero
function p. 33) over ℚ-linear (z,x,h)-forms; small-instance search for a forced,
prerequisite-satisfying ((79) + Def 5.1/5.2), suboptimal run. Located gap: §7 eq. (118) —
substitution keeps ONE chosen upper bound f≤_{i\*j\*} as an equality and discards the
other n̄−1, "0 additional inequalities", redundancy proved nowhere (scoping note §9
Outcome B). Blockers assessed passable-in-principle per §10.2 (each prerequisite
instantiated in the paper's own §9 examples); **no classical suboptimal run exhibited at
paper level** — Stage B is exploratory and gated on the search.

## Novelty (nearest-miss table — hardened 2026-11-17, lane A7 sweep; every row source-checked, URLs + access dates below)

| # | Nearest miss | What it has (source-checked) | Delta (why 78 is new) |
|---|---|---|---|
| 1 | `OAI.TruffetV4Counterexample.finite_execution_not_optimal` (sibling corpus, kernel-checked, `TruffetCounterexample.lean:126`) | the model-level statement: modeled criteria force a suboptimal run | the fidelity bridge (§10.1 dictionary + singleton proposition) promotes it from "the modeled criteria lose the optimum" to "the paper's own procedure loses the optimum" — model-level → procedure-level is the discovery |
| 2 | Truffet, arXiv:2603.26423 v4 (2026-08-29; HAL twin hal-05556396), §2.3 + Thms 4.1–4.3 | the target-of-refutation: claims Thm 4.2 "ensures the optimality of the result"; proves only per-disjunct saturation (Thm 4.1) and interval maximality (Thm 4.3); v4 NOTA self-corrects the minimization disjunction mistake, claims "this logical error does not question the general principle" | §10.1's worked run refutes the optimality claim on the paper's own singleton path, prerequisites satisfied; the v4 NOTA's correction is shown incomplete at the I≥-selection level — **and nobody else says so** (see sweep below) |
| 3 | Truffet, arXiv:2604.06726 v4 (v1 2026-04-08, v4 2026-08-29; HAL hal-05583720; claim first public = ROADEF 2026 talk Feb 2026, companion note hal-05534872 deposited 2026-03-03), §§6.3–9 | the classical sibling: same single-bound elimination (§7 eq. 118), Thm 2.1 (strongly-poly general LP) + Cor 2.1 (Smale's 9th) proved by complexity accounting alone, no soundness theorem (§8; scoping §9) | Stage-B target; also the stakes-context for Stage A's article framing |
| 4 | Allamigeon–Benchimol–Gaubert–Joswig, "Tropicalizing the simplex algorithm", arXiv:1308.0454 (v1 2013); **SIAM J. Discrete Math. 29(2):751–795, 2015, DOI 10.1137/130936464** | tropical simplex: one tropical pivoting step in O(n(m+n)), reduced costs; no rule-soundness characterization | pivoting WITHOUT any rule-soundness criterion; shows the refutation targets Truffet's rule, not tropical LP per se |
| 5 | Butkovič, "On tropical linear and integer programs", arXiv:1709.08983 (v1 2017-09-26); published as **"A note on tropical linear and integer programs", J. Optim. Theory Appl. 180(3):1011–1026, 2019, DOI 10.1007/s10957-018-1429-8** | abstract-verified: compact proofs of strong AND weak duality theorems of tropical LP, no duality gap, quadratic-complexity dual algorithm, integer-case gap; **no substitution/elimination method** | the sound duality substrate the counterexample does not touch (scoping boundary: this dossier refutes a method, not tropical LP duality); book *Max-linear Systems* (Springer, 2010) + Butkovič–Hegedüs elimination for tropical *systems* (Ekon.-Mat. Obzor 20 (1984) 203–214) + Butkovič–Aminu "Max-linear programming" (IMA J. Mgmt. Math. 20(3) (2009) 233–249) bound the line: elimination for systems and duality for LP exist; a *substitution-rule soundness theory for optimization* does not |
| 6 | Formal-methods landscape (checked 2026-11-17): mathlib `MinTropical`/`MaxTropical` (`Mathlib/Algebra/Tropical/Basic.lean:55/:54`, `Tropical` deprecated 2026-07-24) — semiring/order/big-operators API only, no LP/cones/forms; `hyperpolymath/tropical-types` (Lean 4, custom no-Mathlib max-plus for session types — no LP); `leanprover/lp` (classical LP tactics + SoPlex — not tropical); Isabelle LP (Parsert et al., arXiv:2403.19639 — classical); ProvSQL tropical semiring (provenance, not LP) | tropical *infrastructure* exists in several proof ecosystems | **no tropical-LP formalization in any venue** — the OAI tree remains the nearest formal object, and our pilot is the first tropical-LP *refutation* formalization |

**Critique/refutation sweep (row-2 hardening, executed 2026-11-17).** Semantic Scholar
citations of arXiv:2604.06726: **empty set** (API `/citations` endpoint, 2026-11-17;
rate-limit retry pattern per the r7 tool-conditions ledger; S2 indexing of 2026 preprints
partially reliable — standing caveat). arXiv:2603.26423: empty set (2026-11-16, R7 gate
(b)). Web sweeps (multiple query shapes: title-quoted, author+substitution,
author+counterexample/erratum/critique, strongly-polynomial/Smale): only the author's own
records surface — arXiv abs/html pages, HAL mirrors (hal-05583720 v2/v4, hal-05534872),
ResearchGate copies, and the Semantic Scholar paper page (no commentary). **The v4 NOTAs
are self-authored** (Laurent Truffet, sole author; both papers' v4 dated 2026-08-29):
classical NOTA corrects the LPP "conjunction of disjunctions" mistake and asserts the
error "does not question the general principle"; tropical NOTA corrects the minimization
disjunction treatment and claims maximization unaffected. **No third party claims the v4
fix is insufficient** — dossier 78's §10.1 finding (the fix is incomplete at the
I≥-selection level: the criteria still commit the run to one disjunct) is unclaimed
anywhere in the indexed literature.

Lineage correction pattern (Lahlou–Truffet 2106.08854 → Truffet 2408.14256) already
carded at `qa/iter4-review/r7-bib-cards.md` §A gate (b). Access dates: all sources above
fetched/verified 2026-11-17 (lane A7), except where a 2026-11-16 R7 date is stated.

## Bridge claim

openai-math × external 2026 preprints, via the fidelity dictionary. Essential: the
corpus alone proves only the model-level statement (row 1); the papers alone assert
(unrefereed) correctness; only the §10.1 back-mapping — showing the paper's (53b)+(47)
selection and §4.2.4 update coincide with the corpus machine on the forced-singleton
class — converts the corpus's kernel-checked instance into a refutation of the paper's
procedure. Discovery-first: the statement "the v4 tropical substitution method is
unsound, by its own run" is absent from all corpora and the literature.

## Feasibility note (per §6 of the scoping note, carried)

- **Stage A: effort S–M, no new mathematics.** The §10.1 proposition is complete paper
  mathematics; the pilot verifies it. Transcription = the OAI template plus a procedure
  layer (candidate set, case ladder, singleton selection, substitution/update) — all
  finite/decidable on 2×3 states; A2 re-points the existing OAI proof shape
  (decide/norm_num class) at the procedure layer. Kernel-only; no sorry; no
  native_decide; no external CAS. Runner: the standard pilot app class
  (`crossmath-probe` / pilot-32 pattern); no new Modal resources beyond defaults
  (2 CPU / 4 GB per the mandatory guidelines).
- **Stage B: effort M+ (exploratory).** De-tropicalized transcription + instance
  search; the search class is decide/norm_num-shaped per the OAI proof. Fire only after
  Stage A GREEN; stop at the first negative search sweep (blockers then hold the line
  and the Stage-A article ships alone).
- **Grades.** Stage A = DISCOVERY-grade NEGATIVE (article-eligible, kind NEGATIVE, the
  §4 care framing as hard gate — dischargeable per §10.1). Stage B, if it lands, = the
  §6 headline class (refutation of a claimed strongly-polynomial general-LP method /
  claimed Smale-9th resolution). R2 re-grade at charter per S1–S4 (S1 ✓ named nearest
  misses; S2 ✓ essential bridge; S3 transcription+re-pointing = M proof content,
  surprising statement ✓; S4 n/a).

## Care framing (locked; from scoping §4, dischargeable per §10.1)

Refutation claims target the v4 criteria verbatim (eq-numbered), exhibit a
prerequisite-satisfying instance, and walk the paper's own case ladder; never announce
against the abstract claim alone. The (32) operand-order caveat (§10.1) must appear in
any writeup. Stage-B claims additionally require (79) + Def 5.1/5.2 satisfied on the
exhibited instance.

## Pilot proposal (Stage A, one file)

1. In-repo transcription of the §10.1 dictionary (state type = OAI `State` pattern;
   procedure layer: `paperCandidates` (53b), `paperSelect` (singleton case of 43–47),
   `paperStep` = `advance`).
2. Theorem A1 over the reachable states of the counterexample run (finite check), or
   generic singleton lemma if cheap.
3. Theorem A2: the run assertion + witness (re-point `finite_execution_not_optimal`).
4. Full-coverage axcheck (`axcheck_full.py` pattern); triad-clean; log persisted with
   provenance header; no `sorry` tokens outside probe-convention headers (none expected).

## Stage-A P0 spec (appended 2026-11-17, lane A7; for whichever lane is chartered — NO Lean authored yet)

**[EXECUTED — P0 GREEN 2026-11-17, lane A7** (chartered same day by the orchestrator):
`research/pilots/78/P0.lean` + `P0-record.md`; 4 runs, 0 sorry, all three theorems
triad-clean. One spec correction: A2′'s inequality direction (below, §(a)). **]**

*(a) correction, applied at execution:* the A2′ signature drafted below as
`(r : Coeff) < eval initial.cost w` had the inequality reversed; the proved statement is
`eval initial.cost w < (r : Coeff)` (unbounded *below*). The signature block below is
kept verbatim as the drafted spec; the executed statement governs.

### (a) Statement list — signatures only (pilot vocabulary; OAI-verbatim substrate)

One file `pilots/78/P0.lean`, `import Mathlib`, namespace `CrossMath.Truffet78`.
Definitions (transcription targets, each tagged with its paper locator):

```lean
abbrev Coeff := WithBot ℝ                    -- max-plus carrier; ⊥ = O = −∞ (20a)
abbrev Form := Fin 3 → Coeff                 -- columns x₀, x₁, h
abbrev Var := Fin 2
abbrev RowIndex := Fin 2
structure Row where lhs rhs : Form
structure State where rows : RowIndex → Row; cost : Form; remaining : Var → Prop

def eval (f : Form) (w : Fin 3 → ℝ) : Coeff                        -- ⊕-evaluation of a form
def feasible (s : State) (w : Fin 3 → ℝ) : Prop                     -- cone membership
def lower (s : State) (i : RowIndex) (j : Var) : Prop               -- (24): I≥(x_j,i) valid
def upper (s : State) (i : RowIndex) (j : Var) : Prop               -- (32): I≤(x_j,i) valid
def dominating (s : State) (j : Var) : Prop                         -- Def 4.1 = (53a)
def paperCandidates (s : State) : Set (RowIndex × Var)              -- (53b) D-gated candidate set
def case222 (s : State) : Prop                                     -- §4.2.3 Case 2.2.2 hypotheses
def paperSelect (s : State) : Option (RowIndex × Var)              -- Thm 4.3, singleton branch (47)
def lowerForm (s : State) (i : RowIndex) (j : Var) : Form           -- f≥_{ij} (27a–d)
def substitute (f : Form) (j : Var) (g : Form) : Form               -- ⊗-substitution (row/cost update)
def cleanup (r : Row) : Row                                        -- setrowtozero (7)
def advance (s : State) (i : RowIndex) (j : Var) : State            -- §4.2.4 step (56)–(59)
def terminal (s : State) : Prop                                    -- Case 2.1: x = ∅ ∧ (39); min z = c_h

def initial : State                                                -- the instance (rows x₂ ≤ x₀⊕x₁,
def middle : State                                                 --   1⊗x₁⊕(−2)⊗x₂ ≤ x₀; cost x₀) and
def finalState : State                                             --   its two successors
def output better : Fin 3 → ℝ                                      -- paper output (1,0,0); witness (0,−1,0)
```

Target theorems (statement shapes final at P0; proof bodies are the pilot's work):

```lean
-- A1 (fidelity, per §10.1; P0 proves it on the two run states, generic form optional):
theorem paperSelect_forced_singleton (s : State) (hcase : case222 s)
    (hsing : paperCandidates s = {(i, j)}) : paperSelect s = some (i, j)

-- A2 (refutation: the paper's own run + the beating witness):
theorem paper_run_not_optimal :
    paperSelect initial = some (0, 1) ∧ advance initial 0 1 = middle ∧
    paperSelect middle = some (1, 0) ∧ advance middle 1 0 = finalState ∧
    terminal finalState ∧
    feasible initial output ∧ eval initial.cost output = 1 ∧
    feasible initial better ∧ eval initial.cost better = 0 ∧
    eval initial.cost better < eval initial.cost output

-- A2′ (optional sharpening, P1 tier): the asserted minimum is not just beaten —
theorem instance_unbounded_below : ∀ r : ℝ, ∃ w, feasible initial w ∧ (r : Coeff) < eval initial.cost w
```

`A2` is the DISCOVERY carrier (kind NEGATIVE, per-theorem status PROVED-UNCONDITIONAL);
`A2′` upgrades the failure mode to "finite minimum asserted on an unbounded-below
instance" (witness family (−N, −N−1, N) — note the sign: w₂ = h = −N).

### (b) Binder inventory

**None.** This is a refutation: no donor statements are consumed (no `hQRH`-class
binders, no EnclOK-pattern hypotheses). The paper's definitions are transcribed
in-repo (the §10.1 dictionary is the spec), and the OAI sibling tree is neither imported
nor built — statement-level re-implementation only, per the sibling read-only convention.
Consequently no donor-pin, no G-series hygiene gate, no Liu-1-class DO-NOT-CONSUME
concern. Standard axcheck still applies to the finished file (expected triad:
propext/Classical.choice/Quot.sound only, 0 sorryAx).

### (c) mathlib tropical API census (encore checkout @ ff2494ea, read-only, 2026-11-17)

What exists:

- `Mathlib/Algebra/Tropical/Basic.lean` — `MinTropical R` (:55, min-plus: `untrop_add`
  = `min` :272) and its order-dual `MaxTropical R` (:54, `to_dual`-generated:
  `MaxTropical.instLinearOrder` :300, mono instances :533–:558); `Tropical R` (:60) is a
  **deprecated alias of `MinTropical` (since 2026-07-24)**; `Mul` := base addition
  (:383, `untrop_mul` :390); `CommSemiring (MinTropical R)` (:582, dual auto);
  `LinearOrder` (:287); zero := `trop ⊤` (:228) — dual: zero := `trop ⊥`.
- `Mathlib/Algebra/Tropical/Lattice.lean` (:37–:67) — lattice/sup/inf/conditionally-
  complete order API on the tropical wrappers.
- `Mathlib/Algebra/Tropical/BigOperators.lean` (:45–:96) — `trop_sum`/`untrop_prod`
  products-as-sums/infima.
- Sole consumer outside the module: `Mathlib/Analysis/Asymptotics/ExpGrowth.lean`
  (growth-rate applications).

What does NOT exist (the definitional gap): no tropical/max-plus linear forms, no
tropical cones or polyhedra, no tropical LP or elimination/substitution API, nothing
optimization-shaped — anywhere in mathlib. **The entire procedure layer is pilot-custom;
that is the transcription itself, not a blocking gap.**

**Substrate recommendation: raw `WithBot ℝ`, OAI-verbatim** (⊕ spelled as `max`, ⊗ as
`+`, forms as `Fin 3 → Coeff`), NOT `MaxTropical (WithBot ℝ)`. Rationale: (i) the
transcribed corpus theorem (`finite_execution_not_optimal`) and its norm_num proof
mechanics live on raw `WithBot ℝ` — the pilot re-points that proof, and the wrapper's
`trop`/`untrop` coercions would inflate every step with zero leverage at 3-term-max
scale; (ii) the machine never invokes semiring generality (no matrices, no big
operators); (iii) faithfulness — the dictionary maps paper forms to raw coefficient
vectors one-for-one. `MaxTropical (WithBot ℝ)` (mathlib-native max-plus semiring, zero =
⊥) is the documented upgrade path if Stage B (classical, larger arity) or a
tropical-algebra-heavy extension ever needs generic algebra; record the choice in the
pilot header.

### (d) Effort class + runner refinement

- **Effort: S–M** under the r5 sizing conventions (0.35–0.6k LoC band; cf. 73-Q4 at
  0.3–0.6k "M", 75-Pb at +0.25–0.35k "S–M"): ≈ 0.15k LoC definitions (the 121-LoC OAI
  model + the procedure layer) + ≈ 0.2–0.4k LoC proofs (the 148-LoC counterexample file's
  norm_num pattern, re-pointed, plus the singleton lemma). Single pilot lane, no
  dependencies, no donor builds.
- **Runner:** clone the pilot-32 pattern — ephemeral `modal run` app (no volume, no
  secret, textually identical `run_commands` for layer-cache sharing per the iteration-4
  substrate note), `run_pilot.sh <P0.lean>` staged world-readable under `/tmp`;
  default Modal resources (2 CPU / 4 GB), telemetry per the mandatory guidelines;
  expected 3–6 runs (P0 elaboration → proof iterations → final axcheck via the
  `axcheck_full.py` full-coverage pattern, log persisted to `pilots/78/logs/` with
  provenance header).
- **P0 exit:** A1 (two states) + A2 GREEN, axcheck triad-clean → article-eligibility
  review per the iter-4 gate; A2′ is P1-optional; Stage B (classical transcription +
  search) charters only after Stage A GREEN, per the dossier's feasibility note.

## S1–S4 re-grade (post-P0; lane A7, 2026-11-17)

*The flagged next gate action after P0 GREEN (`pilots/78/P0-record.md`), executed against
R2's four-point strength bar as typeset in RESEARCH.md §Iteration 4 quality gate.
Evidence base: P0.lean (444 LoC) + run logs 1–4 + the hardened 6-row nearest-miss table
above + the empty-critique-space sweep (2026-11-16 R7 / 2026-11-17 A7).*

**S1 — statement-level novelty with named nearest-miss: PASS** (with the layer-delta
named). The NEGATIVE statement — "the v4 substitution procedure of arXiv:2603.26423,
transcribed verbatim ((53b) gate, Thm-4.3 singleton selection (47), §4.2.4 update, §4.2.3
case ladder), terminates suboptimally on a Def-4.2-bounded two-row instance, and asserts
a finite minimum on an unbounded-below instance" — is absent from every named neighbor:
(a) **vs the OAI theorem** (`finite_execution_not_optimal`): that statement is
model-level ("the *modeled* criteria force a suboptimal run"); ours is procedure-level —
it names the paper's own machinery, and the promotion content is A1, itself a new
theorem (every singleton-candidate Case-2.2.2 state selects its unique pair via (47),
no interval arithmetic participating). A2 is not a corollary of the OAI theorem: without
A1 the run is not the paper's. (b) **vs the Butkovič line**: duality theorems and
systems-elimination (1984) carry no method-soundness claim to negate — nothing to
overlap. (c) **vs ABGJ**: pivoting mechanics without a rule-soundness criterion; no
counterexample-to-another's-method statement. (d) **vs the Truffet line itself**: the
author's v4 NOTA claims the disjunction fix "does not question the general principle";
no soundness theorem, counterexample, or third-party critique exists (S2 citations of
both papers empty 2026-11-16/17; web sweeps clean — the empty-critique-space
confirmation is now hard evidence, not absence-of-reading). A2′'s failure mode (finite
minimum asserted on an unbounded-below instance) is new even relative to the corpus
theorem, which only exhibits a beating point.

**S2 — essential bridge, not provable from one side: PASS** (asymmetry noted for R2's
final ruling). The bridge is openai-math (the state substrate + counterexample machinery,
re-implemented statement-level) × the external 2026 preprint (the procedure under
refutation), with the fidelity dictionary as the join. The P0 landing *strengthens* the
claim: the bridge's load-bearing lemma (A1) is now kernel-checked on our pin, so the
join is verified rather than argued — the paper side alone cannot even state the
counterexample (it asserts correctness), and the corpus side alone refutes only its own
abstraction. Honest note: this is a corpus × external-preprint bridge, not an
inter-corpus one (no mathlib/tauceti/anthropics content beyond ambient substrate); R2
should confirm the asymmetric reading of "multi-corpus" for NEGATIVE-kind refutations —
the project's discovery pattern (corpus engine, external target) supports it, but the
confirmation belongs to the bar's owner.

**S3 — non-trivial proof content or surprising statement: PASS (limb (b) decisively;
limb (a) contributing).** Limb (b): a 2026 method — whose classical sibling stakes
Smale's 9th problem — is refuted by its own two-step forced run on a 2×3 instance, with
the failure mode including a finite minimum asserted on an unbounded-below problem, and
with the v4 NOTA's "does not question the general principle" shown false at the
I≥-selection level. That is a surprising statement by any reading. Limb (a): the proof
content is 444 LoC — the procedure layer (candidates/selection/case-ladder/terminal),
six pin-proofed private cast/max helpers, the singleton-uniqueness argument (A1), the
witness family with coe-affine comparisons (A2′), and the ported run lemmas; elementary
in tactic difficulty (norm_num/finite-case/linarith) by design — the depth is in the
dictionary and the singleton-case insight. Against the corollary-level exclusion rule:
A1 is a standalone new theorem, and A2 consumes it; neither is a relabeling of the
corpus theorem.

**S4 — discharge/billing discipline: PASS.** Kind NEGATIVE declared at filing; binder
inventory empty (no donor statements consumed, no EnclOK-class binders, no donor-pin
concerns — verified by construction and by the in-file axiom surface). Article status
rows (closed four-string vocabulary): **A1 / A2 / A2′ = PROVED-UNCONDITIONAL** (kernel-
verified on pin `ff2494ea`; triad-only `#print axioms` in `pilots/78/logs/p0-run4.log`).
No open-headline tranche, no certified numerics (all symbolic), no infrastructure
narration in the article. Mandatory limitations for the draft: (1) the A2′
spec-direction correction (drafted reversed, executed corrected — article carries the
corrected statement only, correction history stays in the record); (2) Stage B (the
classical sibling) out of scope; (3) A1's scope is the forced-singleton class — the
tie-stages (48)–(52) are deliberately not transcribed (not reached on the exhibited
run; the transcription defines only branch (47), justified *by* A1 — this scopes but
does not weaken the refutation, since both steps of the exhibited run are
singleton-forced, leaving the procedure no choice); (4) the (32) operand-order
extraction caveat (HTML + Prop 3.2 cross-check); (5) the scope boundary rows — this
refutes the substitution *rule*, not tropical LP duality (Butkovič) nor tropical
pivoting (ABGJ); (6) attribution discipline — the model-level theorem is the corpus's;
the procedure-level promotion (A1+A2+A2′) is this project's.

## GO/NO-GO: **GO** for article-78 drafting

All four bar points pass; the two flagged items for the orchestrator/R2 at charter:
(a) the S2 asymmetric-bridge reading, (b) the N=1 article-kind quota interaction
(week1-agenda row 9 — whether any week-1 GREEN consumed the slot is the orchestrator's
ruling). Neither blocks drafting; both belong in the charter note.

### Input package for A9

1. **Statements**: the three theorems verbatim from `pilots/78/P0.lean`
   (`CrossMath.Truffet78.paperSelect_forced_singleton` :365,
   `paper_run_not_optimal` :383, `instance_unbounded_below` :405) + the NEGATIVE
   headline formulation (S1 above) + the instance spelling (rows x₂ ≤ x₀⊕x₁ and
   1⊗x₁⊕(−2)⊗x₂ ≤ x₀, cost x₀, witness (0,−1,0) vs output (1,0,0)).
2. **Verification blocks per R3 §5**: file `pilots/78/P0.lean` sha256-at-sweep;
   extractor-generated counts from the GREEN run (3 public theorems, 0 sorry,
   decl-level counts from `logs/p0-run4.log`); binder inventory = empty; the
   `#print axioms` triad outputs (three lines, run-4 log); run table (4 runs, walls
   64/34/40/53 s, warm layers shared with crossmath-probe/pilot-32); Modal provenance
   (app `crossmath-pilot-78`, mathlib `ff2494ea`, `v4.36.0-rc2`, spec 2 CPU/4 GB,
   LEAN_NUM_THREADS=2, telemetry summary lines incl. the documented run-1
   mapped-olean OVER artifact).
3. **Nearest-miss table**: the hardened 6-row table above, with URLs + access dates.
4. **Limitations**: the six S4 items verbatim.
5. **Novelty-support block**: the empty-critique-space evidence (S2 API `/citations`
   empty for both papers, 2026-11-16/17; web-sweep query shapes; the v4-NOTA
   authorship/scope/timeline pins: ROADEF Feb 2026 → HAL notes 2026-03-03 → arXiv v1 →
   v4 2026-08-29).

— re-grade by lane A7, 2026-11-17; the charter gate is the orchestrator's.

— filed by lane A7, 2026-11-17, from `research/novelty/iter4-truffet-classical-scope.md`
§10 (ELEVATE; go-condition (i)). Spec appended same day from the coordinator's queue
(prior-art hardening + P0 staging spec).
