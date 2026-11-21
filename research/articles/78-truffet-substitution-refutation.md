# Truffet's Tropical Substitution Procedure (arXiv:2603.26423 v4) Terminates Suboptimally on a Bounded Two-Row Instance: a Kernel-Verified Refutation

*kind: NEGATIVE (refutation — the negated optimality claim and its true owner are
attributed throughout) · date: 2026-11-21 · supersedes: none ·
artifacts: `research/pilots/78/P0.lean`, `research/pilots/78/logs/p0-run4.log`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| A1 `CrossMath.Truffet78.paperSelect_forced_singleton` (`research/pilots/78/P0.lean:365`) — model lemma: the transcribed selection returns the unique (53b)-candidate | PROVED-UNCONDITIONAL | none beyond statement scope: any model state in Case 2.2.2 whose (53b)-candidate set is a singleton | `research/pilots/78/logs/p0-run4.log:22` — `[propext, Classical.choice, Quot.sound]` (repeat `:53`) |
| A2 `CrossMath.Truffet78.paper_run_not_optimal` (`research/pilots/78/P0.lean:383`) — the refutation run | PROVED-UNCONDITIONAL | none | `research/pilots/78/logs/p0-run4.log:23` — `[propext, Classical.choice, Quot.sound]` (repeat `:54`) |
| Bridge claim (Assumption F, §3) — the transcribed machine is the paper's Theorem-4.3 selection on the exhibited run | PAPER-ONLY | — (source-level reading; not a Lean statement) | fidelity proposition of `research/novelty/iter4-truffet-classical-scope.md` §10.1, checked against the arXiv:2603.26423 v4 HTML |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; `import Mathlib` only; no `sorry`, no
`native_decide`, no external CAS; elaboration verdict `research/pilots/78/logs/p0-run4.log:20`
(P0.lean OK, 0 errors, 0 sorry-warnings). No theorem consumes a donor statement as a
hypothesis: the openai-math counterexample machinery is re-transcribed statement-level
in-repo (no build dependency), and the refuted procedure is the external paper's own,
transcribed verbatim with eq-numbered locators.

## Abstract

Is the substitution procedure of Truffet's tropical linear programming paper
(arXiv:2603.26423 v4, 2026) sound — does its terminal assertion of a minimum deliver the
optimum? The paper's v4 erratum note asserts that an earlier logical correction "does not
question the general principle", and its §2.3 claims Theorem 4.2 "ensures the optimality
of the result". Theorem A2 (`paper_run_not_optimal`; PROVED-UNCONDITIONAL; no hypotheses)
proves: the v4 procedure, transcribed verbatim (candidate set (53b), selection (47),
substitution and update of §4.2.4), run on a two-row instance in the paper's own bounded
class (Def 4.2), takes two steps that are forced singleton selections of the transcribed
machine (Theorem A1, PROVED-UNCONDITIONAL, model-level), terminates in its success branch
asserting the minimum z = 1, while a feasible point of the same instance has cost 0 — the
terminal cost form overstates the optimum by one unit. The identification of the
transcribed machine with the paper's own selection is a source-level reading, stated as
Assumption F (PAPER-ONLY). Nearest prior work: the openai-math corpus's kernel-checked
model-level counterexample `finite_execution_not_optimal`; the run here is procedure-level,
contingent on Assumption F. As far as the surveyed literature shows, no third party has
refuted — or criticized — the v4 correction.

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
(`lean/OAI/Optimization/Tropical/TruffetCounterexample.lean:126` in the openai-math
sibling repo) proves that the *modeled* eligibility criteria — an abstraction of the
paper's selection rule — force a suboptimal run. A model-level statement does not touch
the paper: the paper's defenders could reply that the model omits whatever rescues the
procedure. What was missing is the promotion from "the modeled criteria lose the optimum"
to "the paper's own procedure loses the optimum" — a fidelity argument showing the corpus
machine and the paper's machinery coincide on the run in question, then the run itself.
That fidelity argument is a source-level reading of the paper, not kernel content; this
article states it explicitly as Assumption F (§3) and keeps the kernel claims (A1, A2)
separate from it.

**What this article does.** Theorem A1 is the model lemma, proved: on the
forced-singleton class the transcribed selection returns the unique candidate — the
model's own machinery; no θ-value, Rλμ-domain condition, or hB/hU classification is
even defined in the transcription, and the tie-stages (48)–(52) are not reached.
Theorem A2 is the run, proved: the v4 procedure, transcribed verbatim (candidate set
(53b), selection (47), substitution and update of §4.2.4), executed on a
Def-4.2-bounded two-row instance, takes two forced singleton steps (by A1), terminates
in its success branch (Case 2.1) asserting min z = 1, while the feasible witness
(0, −1, 0) has cost 0 — a full unit better — and the standard final-cost bookkeeping
holds (the failure is optimality, not bookkeeping). Assumption F is the fidelity
dictionary: the identification of the transcribed machine with the paper's
Theorem-4.3 selection on the forced-singleton class, recorded source-level in
`research/novelty/iter4-truffet-classical-scope.md` §10.1 — including the survival of
the unique pair under the paper's (43)–(44) filter. Under F, A2 is the paper's own
procedure losing the optimum. The failure mode is a unit coefficient error: the
procedure's terminal cost form is 1⊗h and the instance's true value function is 0⊗h
(arithmetic outside the kernel; §3, §5), so at the paper's normalization h := 𝟙 the
asserted minimum is 1 and the true minimum is 0.

**Attribution.** The model-level theorem is the openai-math corpus's. The instance,
the model lemma A1, and the procedure-level run A2 are this project's; the fidelity
dictionary is this project's source-level reading of the two sources, carried as
Assumption F. The refuted claim is Truffet's, stated at its v4 strength including the
erratum note's "general principle" assertion.

## 2. Setting and notation

Setting per arXiv:2603.26423 v4, (6a)–(6f): minimize z over the max-plus cone
a⁺_{i,·}⊗w ≥ a⁻_{i,·}⊗w with z ≥ c^T⊗x ⊕ c_h⊗h, h > O, z and h non-substitutable.
The procedure (§4.2.3): a case ladder over the constraint rows; the candidate set
(53a)–(53b) (dominating columns; the (53b) D-gate); the Theorem-4.3 selection
(T-filter (43)–(44), θ/θ′ computations (45)/(50), argMin (47)/(52)); then
substitution and update (§4.2.4: x_{j\*} := f≥_{i\*j\*} (27); cost update
(29)/(56); cone update (57)–(59); `setrowtozero` (7)).

The Lean artifact (all in `research/pilots/78/P0.lean`, 444 lines, namespace
`CrossMath.Truffet78`): `Coeff := WithBot ℝ` (max-plus carrier, ⊥ = −∞), forms on
columns (x₀, x₁, h) — h the homogenization variable, the third column —, a `State`
(rows, cost, remaining variables), `eval`/`feasible`, and the paper-verbatim layer:
`lower` ⟺ (24), `upper` ⟺ (32), `dominating` ⟺ Def 4.1/(53a), `paperCandidates` ⟺ (53b),
`paperSelect` ⟺ the singleton branch (47) of the paper's selection (the θ/T-filter
machinery of (43)–(46) and the tie-stages (48)–(52) are not transcribed — §7 item 2),
`advance` ⟺ the §4.2.4 update, `stop` ⟺ (39), `terminal` ⟺ Case 2.1, `bounded` ⟺ Def 4.2.
The instance is

  row 0: h ≤ x₀ ⊕ x₁,  row 1: 1⊗x₁ ⊕ (−2)⊗h ≤ x₀,  cost z = x₀,

with the terminal cost form `finalState.cost` = 1⊗h (the asserted minimum: c_h = 1,
read at the paper's normalization h := 𝟙 — the model's h = 0) and the witness points
`output` = (1, 0, 0) and `better` = (0, −1, 0) (feasible for the initial instance,
cost 0). The openai-math definitions are re-transcribed in-repo at statement level —
the sibling corpus is read-only and not a build dependency.

## 3. Main results

**Model lemma A1 (`paperSelect_forced_singleton`; `research/pilots/78/P0.lean:365`).**
For every state s of the transcribed model in Case 2.2.2 whose (53b)-candidate set is
the singleton {(i\*, j\*)}, the transcribed selection returns that pair:
`paperSelect s = some (i\*, j\*)`. Hypotheses (statement scope only): `_hcase : case222 s`,
`hsing : paperCandidates s = {(i, j)}`. What A1 does not say: it is a property of the
transcription — the model's selection is *defined* to return the unique candidate when
there is one (`research/pilots/78/P0.lean:148–149`) — and not a theorem about the paper's
Theorem-4.3 selection. The paper-side identification is Assumption F.

**Assumption F (the fidelity dictionary; PAPER-ONLY; not a Lean statement).** On the
model's state class: (i) *dictionary* — the model predicates coincide with the paper's,
eq. for eq.: `lower` ⟺ (24), `upper` ⟺ (32), `dominating` ⟺ Def 4.1/(53a),
`paperCandidates` ⟺ (53b), `advance` ⟺ (27a–d)/(56)–(59) with `setrowtozero` (7),
`stop` ⟺ (39), `bounded` ⟺ Def 4.2; so the model's (53b)-candidate set is the paper's
I≥-set. (ii) *Singleton survival* — on a Case-2.2.2 state whose I≥-set is the singleton
{(i\*, j\*)}, the paper's Theorem-4.3 selection forms the (43)–(44) T-filter (T := B or U
according as f_{z,i\*j\*} ∈ hB or hU), the unique pair survives it, θ is evaluated over
the single row index (45a), and argMin resolves via branch (47); the tie-stages (48)–(52)
require n(argMin θ) ≥ 2 and are not reached. Evidence: the fidelity proposition of
`research/novelty/iter4-truffet-classical-scope.md` §10.1, each dictionary row checked
against the arXiv:2603.26423 v4 HTML (2026-11-17); (53b) and Def 4.2 re-checked against
the same source in external review (2026-11-21). The θ-interval values over Rλμ — the
one piece of the paper's machinery the model omits — are never evaluated on the singleton
path. Under F, each kernel-verified selection step of A2 is the paper's own; if F failed
(for instance, if the (44)-filter could drop a unique pair), A2 would remain a refutation
of the transcribed criteria family only, not of the paper's procedure.

**Theorem A2 (`paper_run_not_optimal`; `research/pilots/78/P0.lean:383`).** No
hypotheses; the twelve-fold conjunction: `bounded initial` (Def 4.2);
`paperSelect initial = some (0, 1)` and `advance initial 0 1 = middle`;
`paperSelect middle = some (1, 0)` and `advance middle 1 0 = finalState`;
`terminal finalState` (Case 2.1: no remaining variables ∧ (39)); feasibility of `output`
with `eval initial.cost output = 1` and `eval finalState.cost output = 1`; feasibility of
`better` with `eval initial.cost better = 0`; and
`eval initial.cost better < eval initial.cost output`. Both selection conjuncts are A1
applied at the two run states (case labels and singleton candidate sets kernel-checked:
`research/pilots/78/P0.lean:320`, `:330`, `:340`, `:349`). The terminal cost form is 1⊗h,
so the success branch asserts min z = c_h = 1 at the paper's normalization h := 𝟙.
Scope note: `output` = (1, 0, 0) is a fixed witness (`research/pilots/78/P0.lean:203`) at
which the asserted value and the bookkeeping are checked; A2 carries no conjunct
identifying it with the run's backward substitution (the openai-math predecessor's proved
theorem carries exactly that link — §7 item 3). The failure is optimality, not
bookkeeping.

**The coefficient reading (arithmetic outside the kernel).** For fixed h the instance's
true optimum is x₀ = h: row 0 gives h ≤ max(x₀, x₁); if x₀ ≥ h we are done, otherwise
x₁ ≥ h and row 1 forces x₀ ≥ 1 + x₁ ≥ 1 + h; equality is attained at (h, h−1, h). The
true value function is 0⊗h; the procedure's terminal cost form is 1⊗h — a unit
coefficient error, 1 + h > h at every h. At the paper's normalization h := 𝟙: asserted
minimum 1, true minimum 0, attained by `better` (which has the normalization h = 0).
No Lean conjunct asserts this paragraph; it is three lines of max-plus arithmetic on the
kernel-verified instance.

**The negative statement, assembled.** Under Assumption F, the v4 substitution procedure
of arXiv:2603.26423, transcribed verbatim, terminates suboptimally on a
Def-4.2-bounded two-row instance (A2), both of its steps being forced by its own
selection rule (A1 at the two run states; singleton survival in F). The v4 NOTA's claim
that the corrected disjunction treatment "does not question the general principle" is
false at the I≥-selection level: the criteria commit the run to one disjunct of row 0
(the substitution x₁ := 0⊗h saturates h ≤ x₁), and the optimum in the other disjunct is
lost (`better` satisfies row 0 via h ≤ x₀). The §2.3 claim that Theorem 4.2 "ensures the
optimality of the result" fails on this instance.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| `OAI.TruffetV4Counterexample.finite_execution_not_optimal` (openai-math corpus, kernel-checked, `lean/OAI/Optimization/Tropical/TruffetCounterexample.lean:126`) | the model-level statement: the *modeled* criteria force a suboptimal run, with the back-substitution links from the terminal value to the two substitutions | the procedure-level transcription (A2 + Assumption F) carries the refutation to the paper's own procedure: the instance and the run are new; A1 is the model lemma that makes each step forced, not a paper-side theorem |
| Truffet, arXiv:2603.26423 v4 (2026-08-29; HAL hal-05556396), §2.3, Thms 4.1–4.3 | the target of the refutation: claims Thm 4.2 "ensures the optimality of the result"; proves per-disjunct saturation and interval maximality; the v4 NOTA corrects the minimization disjunction and claims the principle unharmed | our exhibited run refutes the optimality claim on the paper's own singleton path with prerequisites satisfied; the NOTA's correction is shown incomplete at the I≥-selection level |
| Truffet, arXiv:2604.06726 v4 (v1 2026-04-08; HAL hal-05583720; ROADEF 2026 talk Feb 2026; companion note hal-05534872, 2026-03-03), §§6.3–9 | the classical sibling: same single-bound elimination (§7 eq. (118)); Thm 2.1 (strongly-poly general LP) and Cor 2.1 (Smale's 9th) by complexity accounting alone, no soundness theorem | not refuted here (Stage B, out of scope); it is the stakes-context: the tropical failure mode is exhibited on the shared elimination step |
| Allamigeon–Benchimol–Gaubert–Joswig, "Tropicalizing the simplex algorithm", arXiv:1308.0454; SIAM J. Discrete Math. 29(2):751–795, 2015, DOI 10.1137/130936464 | tropical simplex: pivoting mechanics, one step in O(n(m+n)); no rule-soundness criterion | scope boundary: this article refutes Truffet's substitution rule, not tropical pivoting or tropical LP |
| Butkovič, "On tropical linear and integer programs", arXiv:1709.08983; published as J. Optim. Theory Appl. 180(3):1011–1026, 2019, DOI 10.1007/s10957-018-1429-8; with Butkovič–Hegedüs (Ekon.-Mat. Obzor 20 (1984) 203–214) and Butkovič–Aminu (IMA J. Mgmt. Math. 20(3) (2009) 233–249) | the sound duality substrate of tropical LP (strong and weak duality, no gap, quadratic dual algorithm); systems-elimination for tropical systems | scope boundary: no substitution/elimination *soundness theory for optimization* exists on that line; the counterexample does not touch tropical LP duality |
| formal-methods landscape (checked 2026-11-17): mathlib `MinTropical`/`MaxTropical` (`Mathlib/Algebra/Tropical/Basic.lean:55/:54`); `hyperpolymath/tropical-types`; `leanprover/lp`; Isabelle LP (Parsert et al., arXiv:2403.19639); ProvSQL | tropical infrastructure in several proof ecosystems; classical LP formalizations | no tropical-LP formalization in any venue surveyed; this artifact is the first tropical-LP *refutation* formalization in that surveyed landscape |

**Novelty support (the empty-critique-space evidence).** Semantic Scholar citations of
arXiv:2604.06726: empty set (API `/citations`, 2026-11-17; S2 indexing of 2026
preprints partially reliable — standing caveat). arXiv:2603.26423: empty set
(2026-11-16). Web sweeps (title-quoted; author+substitution; author+counterexample /
erratum / critique; strongly-polynomial / Smale): only the author's own records
surface (arXiv, HAL mirrors, ResearchGate copies, the S2 paper page). Both v4 NOTAs
are self-authored (Laurent Truffet, sole author; both dated 2026-08-29). **No third
party claims the v4 fix is insufficient** — this article's finding is unclaimed
anywhere in the indexed literature (access dates: 2026-11-16/17; query shapes and the
Lahlou–Truffet lineage card at `research/qa/iter4-review/r7-bib-cards.md` §A).

## 5. Proofs

**Model lemma A1.** Unfold the definition: on a singleton candidate set the model's
selection is `dif_pos` applied to the existence proof, and uniqueness of the singleton's
element identifies the chosen pair (`research/pilots/78/P0.lean:368–374`; the
Case-2.2.2 hypothesis is statement scope and is not used in the proof). The proof's
brevity is the point: nothing paper-side enters, which is exactly why the paper-side
content is carried separately as Assumption F. ∎

**Theorem A2.** The two selection conjuncts are A1 at `initial` and `middle` (case
labels and singleton candidate sets kernel-checked: `research/pilots/78/P0.lean:320`,
`:330`, `:340`, `:349`); the `advance` equalities, terminality, feasibility, and the
three cost evaluations are finite checks over the 2×3 state class (`norm_num` over the
max-plus carrier, with the six cast/max helper lemmas of the artifact). The strict
inequality is `eval initial.cost better < eval initial.cost output` after both sides
compute. ∎

**The coefficient reading (not kernel-checked).** As in §3: from row 0,
h ≤ max(x₀, x₁); if x₀ ≥ h we are done, else x₁ ≥ h and row 1 gives x₀ ≥ 1 + x₁ ≥ 1 + h;
equality at (h, h−1, h). ∎ (max-plus arithmetic on the kernel-verified instance; no Lean
conjunct asserts it)

The depth is not in tactic difficulty (elementary by design) but in the dictionary —
the eq-numbered back-mapping of §2, worked out in
`research/novelty/iter4-truffet-classical-scope.md` §10.1 and carried here as
Assumption F — and in the instance itself, whose two steps are forced singletons: on
the exhibited run the procedure has no choice.

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| A1 | `CrossMath.Truffet78.paperSelect_forced_singleton` | `research/pilots/78/P0.lean:365` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/78/logs/p0-run4.log:22` (repeat `:53`) |
| A2 | `CrossMath.Truffet78.paper_run_not_optimal` | `research/pilots/78/P0.lean:383` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/78/logs/p0-run4.log:23` (repeat `:54`) |

The bridge claim of §3 is PAPER-ONLY by construction and has no row here; the artifact's
third audited statement is not claimed by this article and is recorded in §7 item 1.

## 7. Limitations and open problems

1. **The retracted third artifact statement (homogeneity artifact).** The Lean artifact
   also proves `CrossMath.Truffet78.instance_unbounded_below` — retracted as a claim at
   the 2026-11-21 revision,
   (`research/pilots/78/P0.lean:405`; axioms at
   `research/pilots/78/logs/p0-run4.log:24`, repeat `:55`): for every r : ℝ there is a
   feasible point of cost below r, witness family (r−1, r−2, r−1). This article does not
   claim it. It is a translation-homogeneity artifact of the WithBot-ℝ encoding:
   `feasible` is invariant under adding one constant to all three coordinates and every
   form's `eval` shifts by that constant, so any single feasible point yields such a
   family — the witness is exactly `better` translated by r−1, and every nonempty
   feasible instance of the encoding has raw infimum −∞. The paper's own semantics
   already treat this direction: its Theorem 4.2 is titled "Minimality and reachability
   at −∞ of h↦c_h⊗h", and Case 2.1 reads the coefficient at h = 𝟙. "A finite minimum
   asserted on an unbounded-below problem" is therefore not a failure mode of the paper;
   the failure A2 exhibits is the coefficient gap (asserted 1, true 0 at the
   normalization).
2. **Assumption F is the load-bearing paper-side content.** The dictionary rows and the
   singleton-survival argument are source-level readings (the fidelity proposition of
   `research/novelty/iter4-truffet-classical-scope.md` §10.1), not kernel theorems; A1
   alone does not connect the model to the paper. The transcription deliberately omits
   the tie-stages (48)–(52) (unreachable on the exhibited run under F) and defines only
   branch (47); the (43)–(44) T-filter is not transcribed at all — its singleton-survival
   is part of F. If F fails, the refutation narrows to the transcribed criteria family.
3. **The `output` back-substitution gap.** A2 checks feasibility and cost at the fixed
   witness `output` (`research/pilots/78/P0.lean:203`) but no conjunct identifies it with
   the run's backward substitution. The openai-math predecessor's proved theorem carries
   exactly those conjuncts (`output_backsubstitution` at
   `lean/OAI/Optimization/Tropical/TruffetCounterexample.lean:109`, entering its theorem
   at `:133–134`) on a definition layer identical to P0's; porting them into A2 is the
   recorded artifact-side follow-up. Until then, the asserted minimum rests on the
   terminal cost form (`eval finalState.cost output = 1`), not on `output` being the
   substitution's result.
4. **Stage B (the classical sibling) is out of scope.** The de-tropicalized
   transcription of arXiv:2604.06726 and the search for a classical suboptimal run
   are not attempted here; the located §7-eq.-(118) gap is the charter's next-stage
   material, gated on its own search.
5. **The (32) operand-order extraction caveat.** The PDF extraction of the paper renders
   the I≤ condition (32) with reversed operand order; the transcription was fixed from
   the arXiv HTML, cross-checked against Proposition 3.2's validity condition (18)
   (`research/novelty/iter4-truffet-classical-scope.md` §10.1, extraction caveat). The
   caveat is inherited by every statement that uses `upper`.
6. **Scope boundary.** This article refutes the *substitution rule* of
   arXiv:2603.26423 v4 on the exhibited instance (kernel: A1, A2; paper-side: F) — not
   tropical LP duality (Butkovič's line, sound), not tropical pivoting (ABGJ), and not
   the classical sibling's Thm 2.1 (unrefuted here).
7. **Attribution discipline.** The model-level theorem is the openai-math corpus's;
   the instance, the model lemma A1, and the run A2 are this project's; the fidelity
   dictionary is this project's source-level reading (Assumption F); the refuted claim
   is Truffet's at its v4 strength. No claim is made against the author's earlier LPP
   work beyond what the v4 NOTAs themselves correct.

## 8. Prior work and references

**Literature.** L. Truffet, *Substitution for minimizing/maximizing a tropical linear
(fractional) programming*, arXiv:2603.26423 v4 (2026-08-29), HAL hal-05556396. L.
Truffet, arXiv:2604.06726 v4 (2026-08-29), HAL hal-05583720; companion note
hal-05534872 (2026-03-03); ROADEF 2026 talk (Feb 2026). Lahlou–Truffet,
arXiv:2106.08854 → Truffet arXiv:2408.14256 (the lineage; card at
`research/qa/iter4-review/r7-bib-cards.md` §A). X. Allamigeon, P. Benchimol, S. Gaubert,
M. Joswig, *Tropicalizing the simplex algorithm*, SIAM J. Discrete Math. 29(2)
(2015) 751–795, DOI 10.1137/130936464 (arXiv:1308.0454). P. Butkovič, *A note on
tropical linear and integer programs*, J. Optim. Theory Appl. 180(3) (2019)
1011–1026, DOI 10.1007/s10957-018-1429-8 (arXiv:1709.08983); Butkovič–Hegedüs,
Ekon.-Mat. Obzor 20 (1984) 203–214; Butkovič–Aminu, IMA J. Mgmt. Math. 20(3) (2009)
233–249; Butkovič, *Max-linear Systems* (Springer, 2010).

**Project artifacts.** `research/pilots/78/P0.lean`, `research/pilots/78/P0-record.md`,
`research/pilots/78/run_pilot.sh`; logs `research/pilots/78/logs/p0-run1.log` through
`research/pilots/78/logs/p0-run4.log`; candidate record
`research/candidates/78-truffet-substitution-refutation.md` (the hardened nearest-miss
table with access dates); scoping note
`research/novelty/iter4-truffet-classical-scope.md` (§9 Outcome B — the classical
soundness gap; §10.1 — the fidelity dictionary, the singleton-survival proposition, and
the worked run); the openai-math sibling files (read-only; paths relative to that
repo): `lean/OAI/Optimization/Tropical/TruffetModel.lean:33–116` (the modeled criteria
layer) and `lean/OAI/Optimization/Tropical/TruffetCounterexample.lean:126` (the proved
model-level theorem; the sibling's challenge copy
`lean/ComparatorChallenges/TruffetCounterexample.lean:118` carries a deliberate `sorry`
at `:129` and is not the cited artifact).
