# Truffet classical-extension scoping — does the OAI tropical counterexample pattern extend to the classical substitution criteria (arXiv:2604.06726)?

*Iteration-4 review, Phase B (A5-LIT-WATCH), first battery item · lane R7 (external
evidence + local donor reads) · 2026-11-16 · written at the L2 release (808c809);
local+external sides pre-fetched during the L1/L2 hold (warm state), this note is the
record (/tmp cache now discarded).*

**Provenance.** Local: `openai-math/lean/OAI/Optimization/Tropical/{TruffetModel,
TruffetCounterexample}.lean` read IN FULL this session (sibling repo, read-only).
External: `arxiv.org/html/2604.06726v4` and `arxiv.org/html/2603.26423v4` fetched
2026-11-16 — **both HTML fetches TRUNCATED**: 2604.06726 cut after Theorem 6.2
(sections 6.4, 7, 8, 9 NOT seen — re-pull before citing anything from them);
2603.26423 cut inside §6.3. Abstract pages of both fetched earlier the same day.
All quotes below are from the seen portions. Status of this note: SCOPING — one page,
no dossier, no pilot; elevation decision at the week-1 drain review (§7).

---

## 1. The question

`OAI.TruffetV4Counterexample.finite_execution_not_optimal` proves (kernel-checked, in
the openai-math corpus) that a forced run of the modeled tropical substitution
criteria terminates at a **suboptimal** feasible point: the criteria lose the optimum.
The modeled vocabulary (`dominating`, `eligible` with a conditioned gate, lower/upper
row relations) matches Laurent Truffet's tropical paper **arXiv:2603.26423 v4** (v4
dated 2026-08-29, matching the Lean name "V4") almost term-for-term. That paper's
classical sibling, **arXiv:2604.06726 v4** (same v4 date), applies the same
substitution methodology to **general classical LP** and asserts (Theorem 2.1) a
strongly polynomial method — with Corollary 2.2/2.1 explicitly staking **Smale's 9th
problem**. Question: does the OAI counterexample pattern transplant to the classical
criteria — i.e., is there a classical instance whose forced substitution run
terminates suboptimally, refuting the claimed strongly-polynomial general-LP method?

## 2. What the OAI tree proves (local, verified)

- Model (`TruffetModel.lean`): max-plus forms over `WithBot ℝ`; `eval f w =
  max(f₀+w₀, f₁+w₁, f₂+w₂)`; State = 2 constraint rows (`eval rhs ≤ eval lhs`), a
  cost form, a `remaining` predicate on 2 variables (column 2 = homogenization
  coordinate); predicates `lower s i j` / `upper s i j` (strict coefficient dominance
  in row i at column j), `dominating s j` := remaining ∧ (lower somewhere) ∧ (upper
  somewhere), `eligible s i j` := remaining ∧ lower-in-row-i ∧ (a dominating variable
  exists → j dominating) — the conditioned-hierarchy gate; `switch` / `failure` /
  `stop` transcribe the papers' switch-to-max, no-valid-inequality, and reachability
  cases; `advance s i j` = substitute variable j by `lowerForm s i j` (the row-i solve
  of the column-j max term) via the residual `substitute f j g k = if k = column j
  then ⊥ else max (f k) (f (column j) + g k)`, applied to all rows and the cost,
  dropping j from `remaining` and deleting satisfied rows (`cleanup`).
- `ForcedSingletonStep s s' i j` = wellFormed ∧ bounded ∧ ¬stop ∧ ¬switch ∧ ¬failure
  ∧ (the eligible pairs are exactly {(i,j)}) ∧ the substitution leaves a nonzero cost
  somewhere ∧ `s' = advance s i j`. I.e. the modeled criteria leave **no choice**.
- Counterexample (`TruffetCounterexample.lean`, headline `finite_execution_not_optimal`):
  `initial →(0,1) middle →(1,0) finalState`, terminal (`stop`, nothing remaining),
  back-substitution output `output = ![1,0,0]` feasible for `initial` with
  `eval initial.cost output = 1 = eval finalState.cost output` (the standard
  final-cost bookkeeping holds), **and** `better = ![0,−1,0]` feasible for `initial`
  with cost `0 < 1`. Plus `crossRowRestriction initial` (a non-degeneracy-flavored
  side condition).
- **Forcing verified by hand (R7, this session)**: in `initial`, variable 1 is lower
  in row 0 and upper in row 1 ⇒ dominating; variable 0 is lower in both rows, never
  upper ⇒ not dominating; the gate therefore blocks variable 0 and the unique
  eligible pair is (0,1). In `middle` no variable is dominating ⇒ the gate is
  vacuous; variable 0 is lower in row 1 ⇒ unique eligible pair (1,0). Both steps are
  forced under the modeled criteria; the run then terminates suboptimally.

## 3. The two papers (load-bearing quotes, fetched portions only)

### 3.1 Classical — arXiv:2604.06726v4, "Linear Programming Problem Solved By a Special Substitution Method" (L. Truffet)

- **Theorem 2.1 (asserted; proof sections 6.4+ NOT seen):** "There exists a special
  kind of substitution method which solves any general linear programming problem in
  strongly polynomial time." **Corollary (2.1):** it "would resolve the Smale's 9th
  problem dealing with linear programming." Claimed complexity (§2.5): ≈ O(mn²)
  (find) + O(mn³) (update) + O(n) (triangular back-substitution).
- **Criteria — Theorem 6.2** ("The set of the substituable variables after k
  substitutions"): τ = `Nearest-to-zero-criterion-for(Cost(k, I≤))` (eq. 96);
  τ′ (eqs. 97–99) with cases (a′), (b′.U) "the conditioned hierarchy does not apply"
  / (b′.B) "the conditioned hierarchy applies"; **S≤[k+1] := argMin(τ′)** (eq. 100);
  otherwise a dual computation with θ (eq. 101) with cases (a″), (b″), (c″).
  **Definition 6.2:** "We say that a variable xj is dominating if I≤(xj) ≠ ∅ and
  I≥+(xj) ≠ ∅." Also: h-boundedness (Definition 6.1: α ≤ 0, β > 0, eq. 68);
  positivity property (Definition 5.1, eq. 50) / strict positivity (Definition 5.2,
  eqs. 66a–66b).
- **Soundness: no explicit per-step feasibility/optimum-preservation theorem is
  visible** in the fetched portion. Closest: Theorems 5.1/5.2 (greatest elements of
  the cone C(i)); Theorem 6.1 (stopping condition: c_h·h attained iff x⁺ = ∅ and
  Ā[k]_{[|0,m|]h} ≤ 0, eqs. 80a–80b); Proposition 6.7 (nestedness of reachable cost
  intervals, eq. 86).
- **Author-disclosed soft spots:** NOTA admits a "bad logical mistake" in prior
  versions (the LPP involves "conjunction of a set of disjunctions," not conjunctions
  of conjunctions); **Assumption 2.1** (λ-parametrized boundedness of all variables)
  is shown false in identifiable cases (**Proposition 2.1**), and the method carries
  a boundedness assumption (**(79)**); **Main difficulty 6.1**: "It does not exist a
  global hierarchy between hB linear functions and hU linear functions," replaced by
  the weaker "conditioned hierarchy" (Proposition 6.4).

### 3.2 Tropical — arXiv:2603.26423v4, "Substitution for minimizing/maximizing a tropical linear (fractional) programming" (L. Truffet)

- **Definition 4.1:** min-bounded (I≥(xj) ≠ ∅), max-bounded (I≤(xj) ≠ ∅), and
  "dominating if xj is min-and-max-bounded." Hierarchies: ⪯var (eq. 35, dominating
  variables first) and ⪯fct (eq. 38, h-bounded ≺ h-unbounded, Definition 4.3).
  Eligible sets: **Sθ≥ := argMin(θ)** (eq. 47), or **Sθ'≥ := argMin(θ′)** (eq. 52)
  when argMin(θ) is not a singleton. Intervals θi (eq. 45b), θ′i (eq. 50b) over
  parametrized domains Rλμ(x,h) (eq. 23a).
- **Soundness-flavored:** Theorem 4.1 (saturation of an inequality: the infimum under
  xj ≥ f≥ij is attained at xj = f≥ij(x,h) — justifies saturating ≥ into = per step);
  Theorem 4.2 (min attained at x = −∞ iff A⁺_{[1,m]h} ≥ A⁻_{[1,m]h}, eq. 39); and the
  §2.3 **claim** that Theorem 4.2 "ensures the optimality of the result." **No
  per-step optimum-preservation theorem is stated.**
- **NOTA erratum (v4):** prior versions treated max(a,b) ≥ c "as if it was the
  conjunction" instead of the disjunction (a ≥ c or b ≥ c) — "a bad logical
  mistake… this logical error does not question the general principle." Maximization
  is unaffected (max(a′,b′) ≤ c is genuinely a conjunction).
- Complexity only claimed (§2.3, §4.2.4): O(mn²) update, ~O(mn³) overall, contrasted
  with "the exponential execution time of the tropical Fourier-Motzkin elimination."
- Switch-to-maximization (§2.4) when the cost is h-only and remaining variables lack
  lower bounds; Charnes–Cooper tropicalization (§5, eqs. 62–64, Remark 5.1). Worked
  examples: §6.1 (1 variable), §6.2 (2 variables, 7 constraints), §6.3 (3 variables,
  fractional).

## 4. Verdict (frame preserved verbatim from the scoping hold)

**PLAUSIBLE, UNDECIDED-AT-SCOPE.** The same criteria family appears in both papers
(Nearest-to-zero τ/τ′ selection, argMin eligibility, dominating-variable Definition),
the same "bad logical mistake" lineage is admitted in both, and **no soundness
theorem is visible in either fetched portion**; the classical Theorem 2.1
(strongly-poly general LP / Smale's 9th) is asserted with its proof sections
unavailable to this fetch. But the classical transplant has identified blockers that
must be checked before any refutation claim: **the τ ≠ [−∞,∞] fallback to the dual θ
computation (cases a″–c″), the boundedness assumption (79), and the strict-positivity
requirement (Definition 5.2)**. A real classical refutation = Lean state-machine
transcription of Theorem 6.2's criteria over ℚ-linear forms (the OAI template,
de-tropicalized) + small-instance search for a forced suboptimal run; statement
template = `finite_execution_not_optimal` with linear `eval` and classical
feasibility. **Care framing locked:** Corollary stakes = Smale's 9th problem; any
refutation claim must target the v4 criteria verbatim and exhibit a
prerequisite-satisfying instance ((79) + Definitions 5.1/5.2); never announce against
the abstract claim alone. **Fidelity back-mapping is mandatory** before even the
tropical-side claim "refutes 2603.26423": the OAI machine models the criteria shape
(dominating/eligible/gate/hierarchies), not the papers' eq.-level machinery (θ/θ′
intervals over Rλμ, h-boundedness gates) — the modeled eligibility must be shown to
coincide with the paper's argMin(θ/θ′) selection on the OAI instance class.

## 5. Fidelity back-mapping checklist (first work item if elevated)

| OAI (Lean) | Paper (to verify against) | status |
|---|---|---|
| `dominating s j` (lower ∃ ∧ upper ∃) | 2603.26423 Def 4.1 (min-AND-max-bounded); 2604.06726 Def 6.2 (I≤ ≠ ∅ ∧ I≥⁺ ≠ ∅) | vocabulary match; eq.-level coincidence unverified |
| `eligible` + conditioned gate | ⪯var (eq. 35) / conditioned hierarchy (Prop 6.4); argMin(θ) (47), argMin(θ′) (52) | shape match; interval semantics (Rλμ) unverified |
| `ForcedSingletonStep` (unique pair) | argMin singleton resolution | matches the papers' singleton case; non-singleton branch unused |
| `switch` / `failure` / `stop` | §2.4 switch; Case 0.1/0.2; Thm 4.2 / Thm 6.1 stopping | modeled; exact hypotheses unverified |
| `advance`/`substitute`/`lowerForm` | Theorem 4.1 saturation (≥ → =) | plausibly the formal counterpart; unverified |
| classical blockers | τ-fallback cases (a″–c″) eq. 101; assumption (79); Def 5.2 | NOT transplanted yet — the make-or-break items |

## 6. Effort / grade (if elevated to a battery item)

- **Effort S–M**: (a) Lean transcription of the classical Theorem 6.2 criteria over
  ℚ-linear forms — the OAI template with `eval` linearized (S); (b) small-instance
  search for a forced, prerequisite-satisfying, suboptimal run (decide/norm_num/SMT
  shape, as in the OAI proof) (S–M per instance); (c) the fidelity back-mapping pass
  for the tropical side (S, reading-heavy).
- **Grade: candidate DISCOVERY-grade negative result** (refutation of a claimed
  strongly-polynomial general-LP method / claimed Smale-9th resolution), article-
  eligible class — with the care framing of §4 as a hard gate. If the blockers
  (§4) instead hold the line, the fallback deliverable is the fidelity-verified
  tropical-side statement ("the v4 tropical criteria, faithfully transcribed, are
  unsound") — still FORMALIZATION-OF-RECENT grade at minimum.

## 7. Week-1 elevation pointer

At the week-1 drain review, this note elevates to a dossier + pilot proposal iff
either: (i) the fidelity back-mapping (§5) closes — modeled eligibility ≡ paper
argMin selection on the instance class — making the tropical-side refutation claim
publishable as stated; or (ii) the three classical blockers are shown NOT to block
some instance family (paper-read + one worked example, no Lean needed for the
go/no-go). It stands down to a citation note if the blockers hold and the paper's
sections 6.4–9 (unseen in this fetch) contain a soundness theorem — that re-pull is
a 5-minute first action either way.

## 8. Citation ledger (what was actually consulted, 2026-11-16)

- `arxiv.org/abs/2604.06726` (abstract), `arxiv.org/html/2604.06726v4` (truncated
  after Theorem 6.2 — sections 6.4, 7, 8, 9 NOT seen).
- `arxiv.org/abs/2603.26423` (abstract), `arxiv.org/html/2603.26423v4` (§6.3 tail
  truncated).
- Sibling read-only full reads: `openai-math/lean/OAI/Optimization/Tropical/
  TruffetModel.lean`, `TruffetCounterexample.lean`.
- Context lineage (abstract-level, earlier same day): Lahlou–Truffet arXiv:2106.08854
  (acknowledged errors) → Truffet arXiv:2408.14256 (correction); Truffet
  arXiv:0904.2244; Lahlou–Truffet 1712.05798, 1802.05974. Semantic Scholar citations
  of 2603.26423: empty set (2026-11-16; tool caveat: partial indexing of 2026
  preprints). No external match for the counterexample vocabulary found.

— lane R7, A5-LIT-WATCH battery item 1, 2026-11-16. Standing watches resume (QR-D
race clock, area-law line, LP-formalization world; on-call novelty batteries).
