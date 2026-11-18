# Truffet's Tropical Substitution Procedure (arXiv:2603.26423 v4) Terminates Suboptimally on a Bounded Two-Row Instance: a Kernel-Verified Refutation

*kind: NEGATIVE (refutation — discovery-grade per the orchestrator ruling 2026-11-17;
the negated optimality claim and its true owner are attributed throughout) ·
date: 2026-11-17 · supersedes: none · artifacts: `research/pilots/78/P0.lean`,
`research/pilots/78/logs/p0-run4.log`,
`research/pilots/78/P0-record.md`; dossier
`research/candidates/78-truffet-substitution-refutation.md`; scoping note
`research/novelty/iter4-truffet-classical-scope.md` §10*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| A1 `CrossMath.Truffet78.paperSelect_forced_singleton` (`P0.lean:365`) — the fidelity bridge | PROVED-UNCONDITIONAL | none beyond statement scope: any state in the paper's Case 2.2.2 with singleton (53b)-candidate set | `pilots/78/logs/p0-run4.log:22` — `[propext, Classical.choice, Quot.sound]` (repeat `:53`) |
| A2 `CrossMath.Truffet78.paper_run_not_optimal` (`P0.lean:383`) — the refutation run | PROVED-UNCONDITIONAL | none | `p0-run4.log:23` — triad (repeat `:54`) |
| A2′ `CrossMath.Truffet78.instance_unbounded_below` (`P0.lean:405`) — the sharpening | PROVED-UNCONDITIONAL | none | `p0-run4.log:24` — triad (repeat `:55`) |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; `import Mathlib` only; no `sorry`, no
`native_decide`, no external CAS; elaboration verdict `p0-run4.log:20` (P0.lean OK,
0 errors, 0 sorry-warnings). **Binder inventory: empty** — no donor statement is
consumed as a hypothesis; the openai-math counterexample machinery is re-transcribed
statement-level in-repo (no build dependency), and the refuted procedure is the
external paper's own, transcribed verbatim with eq-numbered locators.

## Abstract

Truffet's tropical substitution method (arXiv:2603.26423 v4, 2026) minimizes
max-plus-linear forms by repeated variable substitution, and its v4 erratum note
asserts that an earlier logical correction "does not question the general principle".
The openai-math corpus already proves, kernel-checked, that a *modeled abstraction* of
the method's eligibility criteria forces a suboptimal run. We promote that model-level
theorem to the procedure itself: Theorem A1 (PROVED-UNCONDITIONAL) proves that on every
singleton-candidate state the paper's own Theorem-4.3 selection takes that pair via its
branch (47) — no interval arithmetic participates; Theorem A2 (PROVED-UNCONDITIONAL)
runs the transcribed v4 procedure verbatim on a bounded two-row instance: both steps
are such forced singleton selections, the run terminates in the procedure's success
branch asserting min z = 1, while the feasible witness (0, −1, 0) achieves cost 0; and
Theorem A2′ (PROVED-UNCONDITIONAL) shows the instance's true infimum is −∞, so a finite
minimum is asserted on an unbounded-below problem. As far as the surveyed literature
shows, no third party has refuted — or criticized — the v4 correction. The classical
sibling paper (arXiv:2604.06726) rests on the same never-justified elimination step.

## 1. Introduction

**The question.** Is the substitution procedure of Truffet's *Substitution for
minimizing/maximizing a tropical linear (fractional) programming* (arXiv:2603.26423,
v4 2026-08-29; HAL twin hal-05556396) sound — does its terminal assertion of a minimum
actually deliver the optimum? The paper claims Theorem 4.2 "ensures the optimality of
the result", proving per-disjunct saturation (Theorem 4.1) and interval maximality
(Theorem 4.3); a v4 erratum note (NOTA) corrects an earlier minimization-disjunction
mistake and asserts the error "does not question the general principle". The stakes
extend beyond the tropics: the companion paper (arXiv:2604.06726; claim first public
as a ROADEF 2026 talk, Feb 2026; companion note hal-05534872, 2026-03-03) transports
the same single-bound substitution to classical linear programming and stakes a
strongly-polynomial general-LP theorem (Thm 2.1) and, by Corollary 2.1, a resolution
of Smale's 9th problem — on complexity accounting alone, with no soundness theorem
(the gap located at §7 eq. (118): one chosen upper bound is kept as an equality and
the other n̄ − 1 discarded, "0 additional inequalities", redundancy proved nowhere).

**The prior counterexample and what was missing.** The openai-math corpus contains a
kernel-checked counterexample: `OAI.TruffetV4Counterexample.finite_execution_not_optimal`
(`TruffetCounterexample.lean:118`, sibling tree) proves that the *modeled* eligibility
criteria — an abstraction of the paper's selection rule — force a suboptimal run. A
model-level statement does not touch the paper: the paper's defenders could reply that
the model omits whatever rescues the procedure. What was missing is the promotion from
"the modeled criteria lose the optimum" to "the paper's own procedure loses the
optimum" — a fidelity bridge showing the corpus machine and the paper's machinery
coincide on the run in question, then the run itself.

**What this article does.** Theorem A1 is the bridge, proved: on the forced-singleton
class the paper's Theorem-4.3 selection returns the unique candidate via branch (47)
of its own display — the θ-interval values over Rλμ, the T/T′ filter, and the
tie-stages (48)–(52) do not participate. Theorem A2 is the run, proved: the v4
procedure, transcribed verbatim (candidate set (53b), selection (47), substitution
and update of §4.2.4), executed on a Def-4.2-bounded two-row instance, takes two
forced singleton steps, terminates in its success branch (Case 2.1) asserting
min z = 1, while the feasible witness (0, −1, 0) has cost 0 — a full unit better —
and the standard final-cost bookkeeping holds (the failure is optimality, not
bookkeeping). Theorem A2′ sharpens the failure mode: the instance is unbounded below
(feasible family (r−1, r−2, r−1) for every threshold r), so the success branch
asserts a *finite* minimum on an unbounded-below problem — a failure mode new even
relative to the corpus theorem, which only exhibits a beating point.

**Attribution.** The model-level theorem is the openai-math corpus's. The promotion —
the fidelity dictionary, the singleton theorem A1, the procedure-level run A2, and the
sharpening A2′ — is this project's. The refuted claim is Truffet's, stated at its
v4 strength including the erratum note's "general principle" assertion.

## 2. Setting and notation

Setting per arXiv:2603.26423 v4, (6a)–(6f): minimize z over the max-plus cone
a⁺_{i,·}⊗w ≥ a⁻_{i,·}⊗w with z ≥ c^T⊗x ⊕ c_h⊗h, h > O, z and h non-substitutable.
The procedure (§4.2.3): a case ladder over the constraint rows; the candidate set
(53a)–(53b) (dominating columns; the (53b) D-gate); the Theorem-4.3 selection
(T-filter (43)–(44), θ/θ′ computations (45)/(50), argMin (47)/(52)); then
substitution and update (§4.2.4: x_{j\*} := f≥_{i\*j\*} (27); cost update
(29)/(56); cone update (57)–(59); `setrowtozero` (7)).

The pilot substrate (all in `research/pilots/78/P0.lean`, 444 lines, namespace
`CrossMath.Truffet78`): `Coeff := WithBot ℝ` (max-plus carrier, ⊥ = −∞), forms on
columns (x₀, x₁, h), a `State` (rows, cost, remaining variables), `eval`/`feasible`,
the paper-verbatim layer (`lower` ⟺ (24), `upper` ⟺ (32), `dominating` ⟺
Def 4.1/(53a), `paperCandidates` ⟺ (53b), `paperSelect` ⟺ the singleton case of
(43)–(47), `advance` ⟺ the §4.2.4 update), and the instance

  row 0: x₂ ≤ x₀ ⊕ x₁,  row 1: 1⊗x₁ ⊕ (−2)⊗x₂ ≤ x₀,  cost z = x₀,

with the exhibited points `output` (the procedure's terminal assertion, min z = 1)
and `better` = (0, −1, 0) (feasible, cost 0). The openai-math definitions are
re-transcribed in-repo at statement level — the sibling corpus is read-only and not a
build dependency.

## 3. Main results

**Theorem A1 (`paperSelect_forced_singleton`, the fidelity bridge; `P0.lean:365`).**
For every state s in the paper's Case 2.2.2 whose (53b)-candidate set is a singleton
{(i\*, j\*)}, the paper's Theorem-4.3 selection returns (i\*, j\*) via branch (47):
`paperSelect s = some (i\*, j\*)`. No θ-value, Rλμ-domain condition, or hB/hU
classification participates; the tie-stages (48)–(52) are not reached.

**Theorem A2 (`paper_run_not_optimal`, the refutation run; `P0.lean:383`).** The
instance is bounded in the paper's sense (Def 4.2); the procedure's run on it is
initial →(0,x₁) middle →(1,x₀) finalState with both steps Case-2.2.2 singleton
selections (by A1); the run terminates in the success branch (`terminal`); the
asserted minimum is min z = 1 at the point `output` (`eval initial.cost output = 1`,
with the standard final-cost bookkeeping `eval finalState.cost output = 1`); while
`better` = (0, −1, 0) is feasible for the initial instance with cost 0
(`eval initial.cost better = 0 < 1 = eval initial.cost output`).

**Theorem A2′ (`instance_unbounded_below`, the sharpening; `P0.lean:405`).** For every
threshold r : ℝ there is a feasible point of cost below r (witness family
(r−1, r−2, r−1)): the instance's true infimum is −∞. The procedure's success branch
asserts a finite minimum on an unbounded-below problem.

**The negative statement, assembled.** The v4 substitution procedure of
arXiv:2603.26423, transcribed verbatim, terminates suboptimally on a Def-4.2-bounded
two-row instance (A2), both of its steps being forced by its own selection rule (A1),
and it asserts a finite minimum on an instance that is unbounded below (A2′). The v4
NOTA's claim that the corrected disjunction treatment "does not question the general
principle" is false at the I≥-selection level: the criteria commit the run to one
disjunct of row 0, and the optimum in the other disjunct is lost.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| `OAI.TruffetV4Counterexample.finite_execution_not_optimal` (openai-math corpus, kernel-checked, `TruffetCounterexample.lean:118`) | the model-level statement: the *modeled* criteria force a suboptimal run | the fidelity bridge (A1) promotes it to the paper's own procedure: model-level → procedure-level is the discovery; without A1 the run is not the paper's |
| Truffet, arXiv:2603.26423 v4 (2026-08-29; HAL hal-05556396), §2.3, Thms 4.1–4.3 | the target of the refutation: claims Thm 4.2 "ensures the optimality of the result"; proves per-disjunct saturation and interval maximality; the v4 NOTA corrects the minimization disjunction and claims the principle unharmed | our exhibited run refutes the optimality claim on the paper's own singleton path with prerequisites satisfied; the NOTA's correction is shown incomplete at the I≥-selection level |
| Truffet, arXiv:2604.06726 v4 (v1 2026-04-08; HAL hal-05583720; ROADEF 2026 talk Feb 2026; companion note hal-05534872, 2026-03-03), §§6.3–9 | the classical sibling: same single-bound elimination (§7 eq. (118)); Thm 2.1 (strongly-poly general LP) and Cor 2.1 (Smale's 9th) by complexity accounting alone, no soundness theorem | not refuted here (Stage B, out of scope); it is the stakes-context: the tropical failure mode is exhibited on the shared elimination step |
| Allamigeon–Benchimol–Gaubert–Joswik, "Tropicalizing the simplex algorithm", arXiv:1308.0454; SIAM J. Discrete Math. 29(2):751–795, 2015, DOI 10.1137/130936464 | tropical simplex: pivoting mechanics, one step in O(n(m+n)); no rule-soundness criterion | scope boundary: this article refutes Truffet's substitution rule, not tropical pivoting or tropical LP |
| Butkovič, "On tropical linear and integer programs", arXiv:1709.08983; published as J. Optim. Theory Appl. 180(3):1011–1026, 2019, DOI 10.1007/s10957-018-1429-8; with Butkovič–Hegedüs (Ekon.-Mat. Obzor 20 (1984) 203–214) and Butkovič–Aminu (IMA J. Mgmt. Math. 20(3) (2009) 233–249) | the sound duality substrate of tropical LP (strong and weak duality, no gap, quadratic dual algorithm); systems-elimination for tropical systems | scope boundary: no substitution/elimination *soundness theory for optimization* exists on that line; the counterexample does not touch tropical LP duality |
| formal-methods landscape (checked 2026-11-17): mathlib `MinTropical`/`MaxTropical` (`Mathlib/Algebra/Tropical/Basic.lean:55/:54`); `hyperpolymath/tropical-types`; `leanprover/lp`; Isabelle LP (Parsert et al., arXiv:2403.19639); ProvSQL | tropical infrastructure in several proof ecosystems; classical LP formalizations | no tropical-LP formalization in any venue surveyed; this pilot is the first tropical-LP *refutation* formalization |

**Novelty support (the empty-critique-space evidence).** Semantic Scholar citations of
arXiv:2604.06726: empty set (API `/citations`, 2026-11-17; S2 indexing of 2026
preprints partially reliable — standing caveat). arXiv:2603.26423: empty set
(2026-11-16). Web sweeps (title-quoted; author+substitution; author+counterexample /
erratum / critique; strongly-polynomial / Smale): only the author's own records
surface (arXiv, HAL mirrors, ResearchGate copies, the S2 paper page). Both v4 NOTAs
are self-authored (Laurent Truffet, sole author; both dated 2026-08-29). **No third
party claims the v4 fix is insufficient** — this article's finding is unclaimed
anywhere in the indexed literature (access dates: 2026-11-16/17, lanes R7/A7; query
shapes and the Lahlou–Truffet lineage card at `qa/iter4-review/r7-bib-cards.md` §A).

## 5. Proofs

**Theorem A1.** Unfold the selection: on a singleton candidate set the argMin branch
(47) applies to the unique element — the branch condition is existential membership,
and uniqueness identifies the chosen pair. The θ/T-filter/tie-stage machinery sits in
branches that require a non-singleton set, so none is evaluated. ∎

**Theorem A2.** The two steps are discharged by A1 after checking the run states'
case labels (Case 2.2.2) and singleton candidate sets; the `advance` equalities,
terminality, feasibility, and the three cost evaluations are finite checks over the
2×3 state class (`norm_num` over the max-plus carrier, with the six cast/max helper
lemmas of the substrate). The strict inequality is
`eval initial.cost better < eval initial.cost output` after both sides compute. ∎

**Theorem A2′.** For each r : ℝ the point (r−1, r−2, r−1) is feasible (both row
inequalities reduce to `linarith` comparisons after unfolding the ⊕-evaluation), and
its cost x₀ = r−1 < r. ∎

The depth is not in tactic difficulty (elementary by design) but in the dictionary —
the eq-numbered back-mapping of §2, worked out in
`research/novelty/iter4-truffet-classical-scope.md` §10.1 — and in the singleton-case
insight of A1, which is what converts the corpus's model-level theorem into a
procedure-level refutation.

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| A1 | `CrossMath.Truffet78.paperSelect_forced_singleton` | `research/pilots/78/P0.lean:365` | ⊆ triad | `pilots/78/logs/p0-run4.log:22` (repeat `:53`) |
| A2 | `CrossMath.Truffet78.paper_run_not_optimal` | `P0.lean:383` | ⊆ triad | `p0-run4.log:23` (repeat `:54`) |
| A2′ | `CrossMath.Truffet78.instance_unbounded_below` | `P0.lean:405` | ⊆ triad | `p0-run4.log:24` (repeat `:55`) |

"⊆ triad" = exactly `[propext, Classical.choice, Quot.sound]` at the cited print.

### Verification: Theorem A1 — `CrossMath.Truffet78.paperSelect_forced_singleton`
- file: `research/pilots/78/P0.lean:365–380` (444 lines; sha256(16) of the run-4
  bytes `d94d115e3d8d08d7`, measured 2026-11-17; the final sweep re-stamps —
  PENDING-CLOSE, owner H)
- exact statement form: `_hcase : case222 s`, `hsing : paperCandidates s = {(i, j)} ⊢
  paperSelect s = some (i, j)` — scope hypotheses of the statement class, no donor
  binders
- binder inventory: empty (no donor statement consumed; the OAI machinery is
  re-transcribed, not imported)
- substrate: mathlib `ff2494ea` / Lean v4.36.0-rc2 (`p0-run4.log:3`)
- evidence: elaboration `p0-run4.log:20` (P0.lean OK, 0 errors, 0 sorry-warnings);
  axioms `p0-run4.log:22` — triad; coverage: exactly 3 public theorems, all
  direct-printed; the private lemma layer folds into them (P0-record)

- honest label: PROVED-UNCONDITIONAL

### Verification: Theorem A2 — `CrossMath.Truffet78.paper_run_not_optimal`
- file: `research/pilots/78/P0.lean:383–401`; bytes/substrate as A1
- exact statement form: no hypotheses; the eleven-fold conjunction of §3 (bounded,
  both selections, both advances, terminal, three feasibility/cost facts for
  `output`, two for `better`, and the strict inequality)
- binder inventory: empty
- evidence: axioms `p0-run4.log:23` — triad; elaboration as A1
- honest label: PROVED-UNCONDITIONAL

### Verification: Theorem A2′ — `CrossMath.Truffet78.instance_unbounded_below`
- file: `research/pilots/78/P0.lean:405–438`; bytes/substrate as A1
- exact statement form: `∀ r : ℝ, ∃ w, feasible initial w ∧ eval initial.cost w <
  (r : Coeff)` — no hypotheses (the corrected direction; see §7 item 1)
- binder inventory: empty
- evidence: axioms `p0-run4.log:24` — triad; elaboration as A1
- honest label: PROVED-UNCONDITIONAL

## 7. Limitations and open problems

1. **The A2′ spec-direction correction (recorded history).** The pilot spec drafted
   A2′'s inequality reversed (`(r : Coeff) < eval initial.cost w`); the proved
   statement is the corrected direction `eval initial.cost w < (r : Coeff)` —
   unbounded *below*. The article carries the corrected statement only; the drafting
   history stays in the pilot record (`P0-record.md`).
2. **Stage B (the classical sibling) is out of scope.** The de-tropicalized
   transcription of arXiv:2604.06726 and the search for a classical suboptimal run
   are not attempted here; the located §7-eq.-(118) gap is the charter's next-stage
   material, gated on its own search.
3. **A1's scope is the forced-singleton class.** The tie-stages (48)–(52) of the
   paper's selection are deliberately not transcribed — they are not reached on the
   exhibited run, whose both steps are singleton-forced; the transcription defines
   only branch (47), justified *by* A1. This scopes but does not weaken the
   refutation: on the exhibited run the procedure has no choice.
4. **The (32) operand-order extraction caveat.** The paper's HTML source renders the
   I≤ condition (32) ambiguously; the transcription was fixed by cross-checking
   Proposition 3.2. The caveat is inherited by every statement that uses `upper`.
5. **Scope boundary.** This article refutes the *substitution rule* of
   arXiv:2603.26423 v4 — not tropical LP duality (Butkovič's line, sound), not
   tropical pivoting (ABGJ), and not the classical sibling's Thm 2.1 (unrefuted
   here).
6. **Attribution discipline.** The model-level theorem is the openai-math corpus's;
   the procedure-level promotion (the dictionary, A1, A2, A2′) is this project's;
   the refuted claim is Truffet's at its v4 strength. No claim is made against the
   author's earlier LPP work beyond what the v4 NOTAs themselves correct.

## 8. Prior work and references

**Literature.** L. Truffet, *Substitution for minimizing/maximizing a tropical linear
(fractional) programming*, arXiv:2603.26423 v4 (2026-08-29), HAL hal-05556396. L.
Truffet, arXiv:2604.06726 v4 (2026-08-29), HAL hal-05583720; companion note
hal-05534872 (2026-03-03); ROADEF 2026 talk (Feb 2026). Lahlou–Truffet,
arXiv:2106.08854 → Truffet arXiv:2408.14256 (the lineage; card at
`qa/iter4-review/r7-bib-cards.md` §A). X. Allamigeon, P. Benchimol, S. Gaubert,
M. Joswig, *Tropicalizing the simplex algorithm*, SIAM J. Discrete Math. 29(2)
(2015) 751–795, DOI 10.1137/130936464 (arXiv:1308.0454). P. Butkovič, *A note on
tropical linear and integer programs*, J. Optim. Theory Appl. 180(3) (2019)
1011–1026, DOI 10.1007/s10957-018-1429-8 (arXiv:1709.08983); Butkovič–Hegedüs,
Ekon.-Mat. Obzor 20 (1984) 203–214; Butkovič–Aminu, IMA J. Mgmt. Math. 20(3) (2009)
233–249; Butkovič, *Max-linear Systems* (Springer, 2010).

**Project artifacts.** `research/pilots/78/{P0.lean, P0-record.md,
run_pilot.sh}`; logs `research/pilots/78/logs/p0-run{1..4}.log`;
dossier `research/candidates/78-truffet-substitution-refutation.md` (the S1–S4
re-grade § and the hardened nearest-miss table with access dates); scoping note
`research/novelty/iter4-truffet-classical-scope.md` (§9 Outcome B — the classical
soundness gap; §10.1 — the fidelity dictionary and the worked run); the openai-math
sibling files `OAI/Optimization/Tropical/TruffetModel.lean:33–116` and
`TruffetCounterexample.lean:118` (read-only).

---

## Change log

2026-11-17 (lane A9): drafted through TEMPLATE-iter4 from the orchestrator-GO'd
input package (dossier-78 §"S1–S4 re-grade (post-P0)" + §"Input package for A9");
kind NEGATIVE per the ruling (discovery-grade; does not touch the N=1 article-kind
quota); all three status rows, the six-row nearest-miss table, the six mandatory
limitations, and the R3-§5 verification blocks trace to that package and to
`pilots/78/P0.lean` / `logs/p0-run4.log` on disk. README row drafted in the same
session (H lands it).

2026-11-18 (lane A9, claims audit): one locator correction, three sites (§1, §4 row 1,
§8) — the OAI sibling cite `TruffetCounterexample.lean:126` → `:118` (the theorem's
keyword line). Audit record: `qa/iter4-review/a9-claims-audit-iter4.md`.

## Shipping-gate self-audit (TEMPLATE-iter4 §9) — lane A9, 2026-11-17

| # | hard rule | result |
|---|---|---|
| 1 | kind is a §0 article kind | PASS — `NEGATIVE`; the negated claim and its owner (Truffet, v4-strength incl. the NOTA) attributed in title, §1, §4 |
| 2 | title free of project-internal tokens | PASS — donor named AND the mathematical content stated |
| 3 | status row per theorem, closed vocabulary, binders listed | PASS — 3 rows, all PROVED-UNCONDITIONAL, binder inventory empty and stated |
| 4 | abstract ≤ 200 words, theorem+hypotheses+status+scoped novelty+nearest prior | PASS — 181 words; A1/A2/A2′ with statuses; scope "as far as the surveyed literature shows"; the corpus theorem named as prior |
| 5 | novelty table ≥ 2 rows; "first" scoped in-sentence | PASS — 6 rows + the empty-critique-space support block with access dates |
| 6 | no bracketed errata | PASS — the A2′ correction history is a dated limitation item, the statement written correctly |
| 7 | no section contradicts another; no addendum | PASS — single draft; §3/§5/§7 agree on scope |
| 8 | formal record table-only; no infra narration | PASS — §6 is the table + R3-§5 blocks; run counts/walls stay in the pilot record, not here |
| 9 | internal vocabulary ≤ 3 glosses | PASS — no dossier/pilot/probe tokens in body prose (paths appear as citations) |
| 10 | citations spot-checked (5+) | PASS this draft — `P0.lean:365/:383/:405`, `p0-run4.log:20/:22–24/:53–55` read on disk (agent-08 tree); dossier/scoping cites traced to the input package; re-verify at splice |
| 11 | README row updated in the same commit | **PENDING — owner H**: the §A row is drafted in `articles/README.md` this session; counts re-ratify at splice |
| 12 | superseded files marked; edit-state claims git-checked | PASS — supersedes none; the A2′ history claim cites the pilot record, not git state |

PENDING-CLOSE: sha256-at-sweep of `P0.lean` (run-4 bytes `d94d115e3d8d08d7` recorded
above) — owner H at the final sweep.
