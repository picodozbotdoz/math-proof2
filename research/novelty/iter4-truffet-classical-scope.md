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

---

## §9 Appendix (2026-11-16, later session) — the §§6.3–9 re-pull: **OUTCOME B — soundness theorem CONFIRMED ABSENT**

*Week-1 agenda row 3's first action, executed. The full v4 text was obtained via a
second fetch engine (complete §1–§9 + references; the earlier truncation inside
Theorem 6.2 is resolved — §8 of this note's fetch-caveat is hereby discharged).
What follows is the section inventory and the two decisive quotes.*

**Inventory, §6.3 to end (every result listed — there are no others):**

- **§6.3 "The substitution procedure at step k itself"** — case enumeration only:
  Case 0 (h = 0, or Ū false → unbounded/fail), Case 1 (𝕩⁺ ≠ ∅), Case 2.1 (Theorem
  6.1 applies → stop), Case 2.2 (Prop 6.6 + Theorem 6.2, "Else pmrp fails").
  **Zero theorems/propositions/lemmas.**
- **§6.4 "The new characteristics elements of the pmrp after substitution computed
  in O(mn²)"** — the update recipe only: eq. (112) ℒ^[k+1] := ℒ^[k] ∪ {x_{j\*} =
  f_{i\*j\*}(x,h)}; eq. (113) cost^[k+1] := f_{z,i\*j\*}; the transition matrix
  T^{k→k+1} (eq. 115), the correction τ^[k+1] (eq. 116), the new cone Ā^[k+1] :=
  Ā^[k]·T^{k→k+1} + τ^[k+1] (eq. 117). **Zero theorems — no feasibility-
  preservation and no optimum-preservation statement anywhere.**
- **§7 "Fourier-Motzkin elimination method vs substitution method"** — discussion;
  contains the **gap locator, verbatim**: the method substitutes x_{j\*} keeping
  ONE upper bound f^≤_{i\*j\*} "for one i\* ∈ {i′₁,…,i′_{n̄}}" and claims this
  "generates n̲ × (1−1) = 0 additional inequalities w.r.t the set of lower bounds.
  In other words no additional inequality is required to eliminate the substituable
  variable x_{j\*}" — contrasted with Fourier–Motzkin's n̲×(n̄−1). **The discarded
  n̄−1 upper bounds are never shown redundant** (that would need the kept bound to
  dominate them on the feasible set — proved nowhere). This is the classical
  residue of the very disjunction-mistake the v4 NOTA admits, and it is exactly the
  single-bound elimination shape the OAI tropical counterexample refutes.
- **§8 "Conclusion"** — complexity accounting only: O(2mn²) + O(mn³) + O(n), plus
  the dual-side O(2m²n + m³n + m) (eq. (120)), followed by: **"The main Theorem
  2.1 of the paper is now proved and also its Corollary 2.1."** I.e., the "proof"
  of the strongly-polynomial-LP theorem (and thereby of the Smale-9th corollary) is
  complexity arithmetic; correctness of the substitution is never established as a
  theorem. The only correctness-flavored results in the entire paper remain
  Theorems 5.1/5.2 (per-step greatest-element bounds for (z, x_j) on the two-row
  cone C(i)), Proposition 6.7 (nested reachable cost intervals), and Theorem 6.1
  (iff-stopping condition at the CURRENT cone) — none connects the substituted
  problem's optimum to the original's.
- **§9 "Numerical examples"** — two worked examples (positive maximum z = 3500;
  negative maximum z = −45/7 via the dual switch). No results.
- **References lineage confirmed**: [17]/[19] = arXiv:2603.26423 (the tropical
  twin), [18] = ROADEF 2026 talk "About an Attempt to Solve Linear Programming by
  Substitution", [15] = Schewe (parity/mean-payoff → LP reduction; the motivation
  for strong polynomiality mattering), [16] = Smale.

**Verdict (row-3 first action, Outcome B).** The per-step soundness theorem is
**CONFIRMED ABSENT** from the full v4 text. The STAND-DOWN condition of agenda row
3 ("blockers hold AND §§6.4–9 contain a soundness theorem") **cannot fire**. The
elevation's two go-conditions ((i) fidelity back-mapping closes, or (ii) the three
classical blockers shown not to block some instance family) are now the only gates.
New evidence registered: §7's "0 additional inequalities" paragraph is a precise
locator for the classical gap — the same unjustified single-upper-bound elimination
the OAI counterexample refutes in the tropical twin — which strengthens the ELEVATE
branch's prior without by itself satisfying either go-condition.

— lane R7, 2026-11-16 (later session). Fetch: `arxiv.org/html/2604.06726v4`, full
text, second engine; quotes verbatim from §7 and §8 as shown.

---

## §10 The elevation decision (2026-11-17, lane A7) — **ELEVATE; go-condition (i) CLOSED**

*Week-1 agenda row 3, decided per its rule (STAND-DOWN unavailable per §9; the two
go-conditions were the only gates). Evidence base this session: both PDFs pulled in full
and read (`arxiv.org/pdf/2604.06726v4`, `arxiv.org/pdf/2603.26423v4`, 2026-11-17; all §/eq
numbers below are the papers' own), one targeted re-render of the tropical paper's HTML
(eq. (32) operand order — see §10.1 caveat), the sibling OAI Lean files re-read in full
(read-only), and a numeric sanity script (feasibility/costs/infimum of the worked
instance; scratch, not an artifact). This section supersedes the §5 checklist's "status"
column; §5 stands as the historical scoping record.*

### 10.1 Go-condition (i) — fidelity back-mapping: **CLOSED on the forced-singleton class**

**The dictionary** (tropical paper 2603.26423v4 ⟷ OAI `TruffetModel.lean`; every row
verified against both texts this session):

| Paper (2603.26423v4) | OAI model | verdict |
|---|---|---|
| cone rows a⁺_{i,·}⊗w ≥ a⁻_{i,·}⊗w, w=(z,x,h) (20a) | `Row ⟨lhs,rhs⟩`, `feasible` = eval rhs ≤ eval lhs (`:36`) | identical (max-plus forms; O=−∞ ↔ ⊥) |
| (24): a⁺_{i,j}≠O ∧ a⁻_{i,j}<a⁺_{i,j} ⟹ I≥(x_j,i) valid | `lower s i j`: lhs(col j)≠⊥ ∧ rhs(col j)<lhs(col j) (`:39`) | identical |
| (32): a⁻_{i,j}≠O ∧ a⁺_{i,j}<a⁻_{i,j} ⟹ I≤(x_j,i) valid | `upper s i j`: rhs(col j)≠⊥ ∧ lhs(col j)<rhs(col j) (`:43`) | identical (operand order HTML-verified, caveat below) |
| Def 4.1 min-/max-bounded, dominating | `lower`/`upper` existentials; `dominating s j` (`:47`) | identical (paper's set 𝕩 ↔ `remaining`) |
| (53a) D := {x_j : I≤(x_j)≠∅ ∧ I≥(x_j)≠∅}; (53b): I≥ := I≥(𝕩∩D) if D≠∅, else I≥(𝕩) | `eligible s i j` := remaining j ∧ lower s i j ∧ ((∃k dominating s k) → dominating s j) (`:50`) | **identical as candidate sets**, term for term |
| T := B/U (43), T-set (44), θ/θ′ (45a/b, 50a/b), argMin (47), (52) | — (absent from the model) | participates only when ≥2 candidates; **vacuous in the singleton case** (proposition below) |
| x_{j\*} := f≥_{i\*j\*} (27a–d; §4.2.3 Case 2.2.2; §4.2.4) | `advance` with `lowerForm s i j` (`:69,:80`) | identical coefficient-wise (incl. ⊥/O at col j\*, r_{ij} at h) |
| cost[k+1] := f_{z,i\*j\*} (56), f_{z,ij} (29) | `cost := substitute s.cost j (lowerForm…)` | identical coefficient-wise |
| new cone via T^{k→k+1} (57)–(58); `setrowtozero` (7) | row-wise `substitute`; `cleanup` (`:76`) | identical (zero row iff a⁻_{i,·} ≤ a⁺_{i,·} pointwise) |
| Theorem 4.2 stopping (39): A⁺_{[1,m]h} ≥ A⁻_{[1,m]h} | `stop`: ∀i rhs 2 ≤ lhs 2 (`:56`) | identical |
| Case 1 switch (§4.2.3); Cases 0.1/0.2; Case 2.1 terminal (min z = c_h, h:=1) | `switch` (`:58`); `failure` (`:64`); terminal (no remaining ∧ stop; h=0 output) | identical (case ladder walked on both states, §10.1.2) |
| bounded problem B (34) | `bounded` (`:53`) | identical |

**Fidelity proposition (singleton case).** Let s be any state of the common class (m rows,
remaining variables 𝕩, homogenization h) on which the paper's procedure is in Case 2.2.2
(𝕩≠∅, ¬(39), I≥(𝕩)≠∅, not Case 1) and whose (53b)-candidate set is a singleton {(i\*,j\*)}.
Then the paper's Theorem-4.3 selection returns Sθ≥ = {(i\*,j\*)} via the singleton branch
(47), which equals the OAI eligible set of s, and the procedure's substitution is exactly
`advance s i* j*`. *Proof sketch:* (53b)-set = eligible-set by the dictionary (no row uses
arity); by (43)–(44), T := B iff f_{z,i\*j\*} ∈ hB, and either way (i\*,j\*) survives its own
hT-filter — so T(T,I≥) = {(i\*,j\*)}; then θ = θ_{i\*} over the single row index (45a) and
argMin(θ) = {(i\*,j\*)} is a singleton, so branch (47) applies and the (48)–(52) stage
(requires n(argMin θ) ≥ 2) is unreachable; the θ-interval values over Rλμ — the one piece
of the paper's machinery the model omits — never participate. ∎ (The model's extra
hypotheses `wellFormed`/`bounded`/nonzero-cost only shrink its step class; the paper
performs every model step.)

**Worked application — the paper's own run on the OAI instance** (all numbers
re-derived this session; feasibility/costs machine-sanity-checked):
- Step 1 on `initial` (rows x₂ ≤ x₀⊕x₁ and 1⊗x₁⊕(−2)⊗x₂ ≤ x₀; cost z = x₀): D = {x₁}
  (I≤(x₁,1) valid: a⁺=O < a⁻=1; I≥(x₁,0) valid: a⁺=0 > a⁻=O), so (53b) gives the
  singleton {(0,x₁)} — which is the kernel-verified `eligible initial = {(0,1)}`
  (`first_forced`). Paper selects (0,x₁) by (47) and substitutes x₁ := f≥_{0,1} = 0⊗h.
- Step 2 on `middle`: D = ∅ (no uppers remain), (53b) gives I≥(𝕩) = {(1,x₀)} singleton =
  `eligible middle = {(1,0)}` (`second_forced`); substitute x₀ := f≥_{1,0} = 1⊗h.
- Terminal: all rows zeroed (Case 2.1), the paper asserts **min z = c_h = 1** at h:=1
  (usual 0), backward substitution x = (1,0) — exactly the OAI `output = ![1,0,0]`,
  `eval finalState.cost output = 1`.
- **Refuting witness:** `better = (0,−1,0)` is feasible with z = 0 < 1 (row 0 satisfied
  via the x₀-disjunct x₂ ≤ x₀ — NOT the x₁-disjunct the run committed to). Sharpening:
  the instance's true infimum is **−∞** (feasible family (−N, −N−1, −N), z = −N), so the
  procedure asserts a finite minimum on an unbounded-below instance; the witness alone
  already refutes the asserted value.
- **Mechanism (why the NOTA's fix did not fix it):** row 0 is the disjunction
  (x₂ ≤ x₀) ∨ (x₂ ≤ x₁); I≥(x_j,i) (25) is one *sufficient disjunct* of row i ("the
  j-th LHS max-term alone covers the RHS max"), Theorem 4.1's saturation is sound only
  within that disjunct, and the substitution permanently commits the run to it. The v4
  criteria still conjoin the disjunctions at the selection level — the exact logical
  shape the v4 NOTA describes as the corrected "bad logical mistake".

**Extraction caveat (recorded for the citation ledger).** The `pdftotext -layout` pass of
the tropical PDF renders (32) with reversed operand order ("a⁻ < a⁺"); the arXiv HTML
shows **a⁺_{i,j} < a⁻_{i,j}**, and Proposition 3.2's validity condition (18) (a > v_j,
with a := a⁻_{i,j}, v := a⁺_{i,·}) confirms the mirror of (24) semantically. Under the
corrected reading, `upper` ⟺ I≤-validity exactly as tabled. (Under the reversed reading
the OAI row-1 upper would be invalid, D(initial) would be ∅, the candidate set would be
the 2-element tie {(0,x₀),(0,x₁)} — both f_{z} ∈ hB with equal images [µ,+∞] — and the
paper's selection would be an arbitrary tie-break, one branch of which (substituting
x₀ first) finds the true minimum. The reversed reading also makes every I≤-inequality
trivially self-satisfied, killing Def 4.1's max-boundedness and the paper's own §6.2
usage D = {x₂}. So the HTML/Prop-3.2 reading is the paper's intended content; the
fidelity closure rests on it.)

**Scope of the closure.** The identity is proved for the singleton-candidate class —
exactly the class `ForcedSingletonStep` defines, the counterexample lives in, and any
forced-run instance search explores. On non-singleton states the model is silent (it
under-determines; it cannot contradict the paper). The §4 care framing is thereby
dischargeable for the tropical side: verbatim v4 criteria, prerequisite-satisfying
instance (mpr (6a)–(6f), Def 4.2-bounded, h> O), case ladder walked in-procedure.

### 10.2 Go-condition (ii) — classical blockers: not needed ((i) fired); status PARTIAL

Recorded for the dossier's Stage-B section; no classical suboptimal run is claimed. Each
blocker's prerequisite is instantiated **in the paper's own §9 examples**, so none is a
structural obstruction to a classical search:

- **τ ≠ [−∞,∞] (fallback to θ, cases a″–c″):** the τ-branch fires repeatedly in the
  paper's own runs — §9.1 at k=1 (τ = [−3500λ,3500λ], case (c)); §9.2-dual at k=0,1,2
  (case (b.U), singletons S≤ = {(3,5)},{(3,4)},{(1,1)}). Non-degenerate τ is routine on
  small instances.
- **(79) U-boundedness:** both §9 examples are bounded with finite optima (+3500;
  −45/7). Bounded instances are the paper's own terrain, not an empty class.
- **Def 5.2 strict positivity (66a–66b):** instantiated in §9.2 — D = {x₁} requires
  I≥⁺(x₁) ≠ ∅, and f≥_{2,1} = (3/2)x₂ + (1/2)h has v = (3/2,0) ≥ 0, r = 1/2 > 0 — and
  avoidable: §9.1 runs its τ-branch with D = ∅ (I≥⁺ enters only through the D-gate and
  the θ-fallback). Satisfiable and bypassable: doubly non-blocking.

What is NOT discharged: a worked classical instance whose verbatim-Thm-6.2 run terminates
suboptimally. That construction is the Stage-B pilot's work (the §7/eq.-118 discarded
upper bounds remain the located gap; note the classical max-side rows are conjunctions —
max(a,b) ≤ c — so the classical gap is projection-soundness of the single-bound
substitution, the mirror of the tropical disjunction commitment).

### 10.3 DECISION: **ELEVATE**

Go-condition (i) fired (§10.1); (ii) unnecessary and recorded PARTIAL (§10.2). Dossier
filed as `research/candidates/78-truffet-substitution-refutation.md` (skeleton: statement
class in two stages — Stage A the fidelity-verified tropical refutation, publishable as
stated; Stage B the classical extension — nearest-miss table (5 rows), bridge claim,
feasibility note (effort S–M per §6, no new mathematics for Stage A), care framing
locked from §4, pilot proposal). Grade carried from §6: Stage A = DISCOVERY-grade
NEGATIVE result, article-eligible under the iter-4 gate (kind NEGATIVE); Stage B, if it
lands, = the §6 headline class. R2 re-grade at charter per S1–S4.

### 10.4 Bib-cards tail

§9 named no bib-card follow-ups; §10 names none. The target-of-refutation cards already
exist (`qa/iter4-review/r7-bib-cards.md` §A gate (b) items 1–2: 2603.26423 v1–v4 dates +
V4-pin; 2604.06726); gate (a) item 5 already holds the ABGJ/Butkovič nearest-miss line
the dossier reuses. The (32) operand-order finding is an extraction-provenance caveat
(§10.1), not a card. **No edit to r7-bib-cards.md this session.**

— lane A7 (R7-successor), 2026-11-17. Worktree `worktrees/agent-08` @ 53c1548; no
commits (H owns them).
