import Mathlib

/-!
# Pilot 78, Stage A (P0) — the Truffet v4 tropical substitution procedure,
transcribed verbatim, terminates suboptimally on a bounded two-row instance

**Charter** (orchestrator ruling, 2026-11-17, on `research/candidates/
78-truffet-substitution-refutation.md` §"Stage-A P0 spec"): dossier-78 Stage-A
pilot P0 is GO; executed by lane A7. **This is a PROOF artifact** — zero
`sorry`, kernel-verified; no probe-class header applies.

**What this file proves.** A transcription of the substitution procedure of
L. Truffet, *Substitution for minimizing/maximizing a tropical linear
(fractional) programming*, arXiv:2603.26423 v4 (2026-08-29) — its candidate
set (53b), its Theorem 4.3 singleton selection (47), and its §4.2.4
substitution/update step — run on the two-row instance `initial`, terminates
in the procedure's own success branch (Case 2.1, `terminal`) asserting a
minimum of cost `1`, while the feasible point `better` has cost `0`
(`paper_run_not_optimal`), and the instance's true infimum is `-∞`
(`instance_unbounded_below`). The v4 NOTA's correction of the "bad logical
mistake" (conjunction-vs-disjunction for max-half-spaces in minimization) is
incomplete at the I≥-selection level: the criteria commit the run to one
disjunct of row 0 and the optimum in the other disjunct is lost. Fidelity
back-mapping: `research/novelty/iter4-truffet-classical-scope.md` §10.1
(the dictionary lower ⟺ (24), upper ⟺ (32) [a⁺<a⁻, HTML-verified], dominating
⟺ Def 4.1/(53a), candidates ⟺ (53b), selection ⟺ (47)).

Model-level predecessor (nearest miss, row 1 of the dossier's table):
`OAI.TruffetV4Counterexample.finite_execution_not_optimal` (openai-math
corpus, sibling, read-only) — this pilot's definition layer is a verbatim
re-implementation of `TruffetModel.lean` (no import, no build dependency);
the delta is the procedure layer + the run theorems below.

**Fences** (per the charter and the dossier):
- Stage B (the classical sibling arXiv:2604.06726, eqs. 96–101) is OUT OF
  SCOPE here.
- No semiring generality: substrate is raw `WithBot ℝ` (⊕ spelled `max`, ⊗ as
  `+`), OAI-verbatim; mathlib's `MinTropical`/`MaxTropical` wrappers are
  deliberately unused (dossier §(c): zero proof leverage at 3-term-max scale).
- Scope boundary (dossier rows 4–5): this refutes the *substitution rule* of
  arXiv:2603.26423 v4, not tropical LP duality (Butkovič, "A note on tropical
  linear and integer programs", J. Optim. Theory Appl. 180(3):1011–1026,
  2019 = arXiv:1709.08983) and not tropical pivoting per se (Allamigeon–
  Benchimol–Gaubert–Joswig, "Tropicalizing the simplex algorithm",
  SIAM J. Discrete Math. 29(2):751–795, 2015).

Binder inventory: NONE (refutation; no donor statements consumed).

Port note: the machine-check proofs port the corpus file's structure
(`TruffetCounterexample.lean:10–77`, v4.34.1 there); the two cast-normalization
names it spells `← WithBot.coe_one, ← WithBot.coe_add` are replaced here by
private rfl-level lemmas (`coe_one_coeff`, `coe_add_coeff`, …) so the file does
not depend on pin-local lemma names.
-/

namespace CrossMath
namespace Truffet78

noncomputable section

/-! ## Substrate (paper (20a): cone rows `a⁺ ⊗ w ≥ a⁻ ⊗ w`; O = −∞ ↔ ⊥) -/

/-- Max-plus carrier: ⊕ = `max`, ⊗ = `+`, zero = `⊥` = −∞ (the paper's O). -/
abbrev Coeff := WithBot ℝ

/-- (x₀, x₁, h)-indexed max-plus forms (columns in the paper's order; h last). -/
abbrev Form := Fin 3 → Coeff

/-- Substitutable variables (z and h are not substitutable: paper (6e)). -/
abbrev Var := Fin 2

abbrev RowIndex := Fin 2

def column (j : Var) : Fin 3 := ⟨j.val, Nat.lt_trans j.isLt (by decide)⟩

def nullForm : Form := fun _ => ⊥

structure Row where
  lhs : Form
  rhs : Form

structure State where
  rows : RowIndex → Row
  cost : Form
  remaining : Var → Prop

/-- ⊕-evaluation of a form at a real point (h-coordinate included). -/
def eval (f : Form) (w : Fin 3 → ℝ) : Coeff :=
  max (f 0 + (w 0 : Coeff)) (max (f 1 + (w 1 : Coeff)) (f 2 + (w 2 : Coeff)))

/-- Cone membership (all rows satisfied). -/
def feasible (s : State) (w : Fin 3 → ℝ) : Prop :=
  ∀ i, eval (s.rows i).rhs w ≤ eval (s.rows i).lhs w

/-! ## The paper's predicates, transcribed (the §10.1 dictionary) -/

/-- Paper (24): `I≥(x_j, i)` valid — row i yields a lower bound on x_j
(the j-th LHS max-term alone covers the RHS max: one *sufficient disjunct*). -/
def lower (s : State) (i : RowIndex) (j : Var) : Prop :=
  (s.rows i).lhs (column j) ≠ ⊥ ∧
    (s.rows i).rhs (column j) < (s.rows i).lhs (column j)

/-- Paper (32) (a⁺ < a⁻, HTML-verified operand order): `I≤(x_j, i)` valid —
row i yields an upper bound on x_j (necessary-condition side). -/
def upper (s : State) (i : RowIndex) (j : Var) : Prop :=
  (s.rows i).rhs (column j) ≠ ⊥ ∧
    (s.rows i).lhs (column j) < (s.rows i).rhs (column j)

/-- Paper Def 4.1 / (53a): dominating = min-AND-max-bounded (and remaining). -/
def dominating (s : State) (j : Var) : Prop :=
  s.remaining j ∧ (∃ i, lower s i j) ∧ ∃ i, upper s i j

open Classical in
/-- Paper (53b): the candidate set — `I≥(x ∩ D)` if some variable dominates,
`I≥(x)` otherwise. Term-for-term the conditioned-hierarchy gate. -/
def paperCandidates (s : State) : Set (RowIndex × Var) :=
  if ∃ k, dominating s k then
    {p : RowIndex × Var | dominating s p.2 ∧ lower s p.1 p.2}
  else
    {p : RowIndex × Var | s.remaining p.2 ∧ lower s p.1 p.2}

/-- Paper Theorem 4.2 stopping condition (39): `A⁺_{[1,m]h} ≥ A⁻_{[1,m]h}`. -/
def stop (s : State) : Prop := ∀ i, (s.rows i).rhs 2 ≤ (s.rows i).lhs 2

/-- Paper §4.2.3 Case 1 (switch to maximization). -/
def switch (s : State) : Prop :=
  (∀ j, s.remaining j → s.cost (column j) = ⊥) ∧ ¬ stop s ∧
  (∃ j, s.remaining j) ∧
  (¬ ∃ i j, s.remaining j ∧ lower s i j) ∧
  ∃ i j, s.remaining j ∧ upper s i j

/-- Paper §4.2.3 Cases 0.1/0.2. -/
def failure (s : State) : Prop := ¬ stop s ∧
  ((¬ ∃ j, s.remaining j) ∨
   ((¬ ∃ i j, s.remaining j ∧ lower s i j) ∧
    (¬ ∃ i j, s.remaining j ∧ upper s i j)))

/-- Paper §4.2.3, Case 2.2.2 hypotheses (model-side rendering): not Case 0,
not Case 1, x ≠ ∅, `I≥(x) ≠ ∅`. -/
def case222 (s : State) : Prop :=
  (∃ j, s.remaining j) ∧ (∃ i j, s.remaining j ∧ lower s i j) ∧
  ¬ stop s ∧ ¬ switch s ∧ ¬ failure s

open Classical in
/-- Paper Theorem 4.3's selection. Only the singleton branch (47) is defined
here: on a singleton candidate set the tie-stages (48)–(52) are unreachable
(they require `n(argMin θ) ≥ 2`), which is exactly pilot A1. -/
def paperSelect (s : State) : Option (RowIndex × Var) :=
  if h : ∃ p, paperCandidates s = {p} then some h.choose else none

/-- Paper (27a)–(27d): `f≥_{ij}` — the row-i solve of the column-j max term
(lower-bound saturation function of Theorem 4.1). -/
def lowerForm (s : State) (i : RowIndex) (j : Var) : Form := fun k =>
  if k = column j then ⊥ else
    (s.rows i).rhs k + ((-WithBot.unbotD 0 ((s.rows i).lhs (column j)) : ℝ) : Coeff)

/-- ⊗-substitution of variable j by g into a form (used on all rows and cost). -/
def substitute (f : Form) (j : Var) (g : Form) : Form := fun k =>
  if k = column j then ⊥ else max (f k) (f (column j) + g k)

/-- Paper `setrowtozero` (7): delete rows trivially satisfied pointwise. -/
def cleanup (r : Row) : Row := by
  classical
  exact if ∀ k, r.rhs k ≤ r.lhs k then ⟨nullForm, nullForm⟩ else r

/-- Paper §4.2.4 (56)–(59): substitute `x_{j*} := f≥_{i*j*}` everywhere,
drop j from the remaining variables, delete satisfied rows. -/
def advance (s : State) (i : RowIndex) (j : Var) : State where
  rows := fun r => cleanup ⟨substitute (s.rows r).lhs j (lowerForm s i j),
    substitute (s.rows r).rhs j (lowerForm s i j)⟩
  cost := substitute s.cost j (lowerForm s i j)
  remaining := fun k => s.remaining k ∧ k ≠ j

/-- Paper Case 2.1 terminal: x = ∅ ∧ (39) — the success branch where the
procedure reads off `min z = c_h` at h := 1 (usual 0). -/
def terminal (s : State) : Prop := (∀ j, ¬ s.remaining j) ∧ stop s

/-- Paper Def 4.2 (34): bounded problem (every remaining variable has some
bound). Recorded as the prerequisite the exhibited instance satisfies. -/
def bounded (s : State) : Prop :=
  ∀ j, s.remaining j → (∃ i, lower s i j) ∨ ∃ i, upper s i j

/-! ## The instance (rows `x₂ ≤ x₀ ⊕ x₁` and `1⊗x₁ ⊕ (−2)⊗x₂ ≤ x₀`; cost x₀) -/

def initial : State where
  rows := ![⟨![(0 : Coeff), 0, ⊥], ![⊥, ⊥, (0 : Coeff)]⟩,
    ⟨![(0 : Coeff), ⊥, ⊥], ![⊥, (1 : Coeff), ((-2 : ℝ) : Coeff)]⟩]
  cost := ![(0 : Coeff), ⊥, ⊥]
  remaining := fun _ => True

def middle : State where
  rows := ![⟨nullForm, nullForm⟩,
    ⟨![(0 : Coeff), ⊥, ⊥], ![⊥, ⊥, (1 : Coeff)]⟩]
  cost := ![(0 : Coeff), ⊥, ⊥]
  remaining := fun j => j = 0

def finalState : State where
  rows := fun _ => ⟨nullForm, nullForm⟩
  cost := ![⊥, ⊥, (1 : Coeff)]
  remaining := fun _ => False

/-- The procedure's backward-substitution output at h := 1 (usual 0). -/
def output : Fin 3 → ℝ := ![1, 0, 0]

/-- The beating witness: feasible, cost 0 < 1 (satisfies row 0 via the
x₀-disjunct `x₂ ≤ x₀`, which the run never commits to). -/
def better : Fin 3 → ℝ := ![0, -1, 0]

/-! ## Pin-proof cast helpers (private; replace the corpus file's
`← WithBot.coe_one` / `← WithBot.coe_add` simp names). -/

private lemma bot_add_coeff (x : Coeff) : ⊥ + x = ⊥ := by cases x <;> rfl

private lemma coe_add_coeff (a b : ℝ) :
    ((a : ℝ) : Coeff) + ((b : ℝ) : Coeff) = ((a + b : ℝ) : Coeff) := rfl

private lemma coe_zero_coeff : (0 : Coeff) = ((0 : ℝ) : Coeff) := by norm_num

private lemma coe_one_coeff : (1 : Coeff) = ((1 : ℝ) : Coeff) := by norm_num


private lemma max_bot_left_coeff (x : Coeff) : max ⊥ x = x :=
  max_eq_right bot_le

private lemma max_bot_right_coeff (x : Coeff) : max x ⊥ = x :=
  max_eq_left bot_le

/-! ## Ported machine checks (definition layer identical to the OAI corpus
file, so these proofs port its structure: `TruffetCounterexample.lean:10–77`). -/

private lemma fin3_two_ne_one : (2 : Fin 3) ≠ 1 := by decide

private lemma fin3_two_ne_zero : (2 : Fin 3) ≠ 0 := by decide

private lemma coeff_one_add_neg_one : (1 : Coeff) + ((-1 : ℝ) : Coeff) = 0 := by
  change (((1 : ℝ) + (-1) : ℝ) : Coeff) = (0 : Coeff)
  norm_num

private theorem row_ext {a b : Row} (hl : a.lhs = b.lhs) (hr : a.rhs = b.rhs) : a = b := by
  cases a
  cases b
  cases hl
  cases hr
  rfl

private theorem state_ext {a b : State} (hr : a.rows = b.rows) (hc : a.cost = b.cost)
    (hv : a.remaining = b.remaining) : a = b := by
  cases a
  cases b
  cases hr
  cases hc
  cases hv
  rfl

private lemma advance_first : advance initial 0 1 = middle := by
  classical
  apply state_ext
  · funext i
    apply row_ext <;> funext k <;> fin_cases i <;> fin_cases k <;>
      norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
        coe_one_coeff, coe_add_coeff, advance, initial, middle, cleanup, substitute, lowerForm, column,
        nullForm, Fin.forall_fin_succ]
  · funext k
    fin_cases k <;> norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, advance, initial, middle, substitute, lowerForm, column]
  · funext j
    apply propext
    fin_cases j <;> simp [advance, initial, middle]

private lemma advance_second : advance middle 1 0 = finalState := by
  classical
  apply state_ext
  · funext i
    apply row_ext <;> funext k <;> fin_cases i <;> fin_cases k <;>
      norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
        coe_one_coeff, coe_add_coeff, advance, middle, finalState, cleanup, substitute, lowerForm, column,
        nullForm, Fin.forall_fin_succ]
  · funext k
    fin_cases k <;> norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, advance, middle, finalState, substitute, lowerForm, column]
  · funext j
    apply propext
    fin_cases j <;> simp [advance, middle, finalState]

private lemma terminal_final : terminal finalState := by
  refine ⟨fun j => by simp [finalState], ?_⟩
  simp [terminal, stop, finalState, nullForm]

private lemma output_feasible_cost :
    feasible initial output ∧ eval initial.cost output = (1 : Coeff) ∧
    eval finalState.cost output = (1 : Coeff) := by
  norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
    coe_one_coeff, coe_add_coeff, feasible, initial, finalState, output, eval, Fin.forall_fin_succ]

private lemma better_feasible_cost :
    feasible initial better ∧ eval initial.cost better = (0 : Coeff) := by
  norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
    coe_one_coeff, coe_add_coeff, feasible, initial, better, eval, Fin.forall_fin_succ]

private lemma bounded_initial : bounded initial := by
  intro j _
  fin_cases j <;> exact Or.inl ⟨0, by
    norm_num [fin3_two_ne_one, fin3_two_ne_zero, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, lower, initial, column]⟩

/-! ## The procedure layer: candidate sets and selections -/

private lemma dominating_initial_one : dominating initial 1 := by
  refine ⟨trivial, ⟨0, ?_⟩, ⟨1, ?_⟩⟩ <;>
    norm_num [fin3_two_ne_one, fin3_two_ne_zero, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, dominating, lower, upper, initial, column]

private lemma no_dominating_middle : ¬ ∃ k, dominating middle k := by
  push Not
  intro k
  fin_cases k <;>
    norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, dominating, lower, upper, middle, column, Fin.exists_fin_succ]

private lemma candidates_initial : paperCandidates initial = {(0, 1)} := by
  unfold paperCandidates
  rw [if_pos ⟨1, dominating_initial_one⟩]
  ext p
  rcases p with ⟨i, j⟩
  simp only [Set.mem_singleton_iff, Set.mem_setOf_eq, Prod.mk.injEq, Prod.fst, Prod.snd]
  fin_cases i <;> fin_cases j <;>
    norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, dominating, lower, upper, initial, column, Fin.exists_fin_succ]

private lemma candidates_middle : paperCandidates middle = {(1, 0)} := by
  unfold paperCandidates
  rw [if_neg no_dominating_middle]
  ext p
  rcases p with ⟨i, j⟩
  simp only [Set.mem_singleton_iff, Set.mem_setOf_eq, Prod.mk.injEq, Prod.fst, Prod.snd]
  fin_cases i <;> fin_cases j <;>
    norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, middle, lower, upper, column, Fin.exists_fin_succ]

private lemma case222_initial : case222 initial := by
  refine ⟨⟨0, trivial⟩, ⟨0, 1, trivial, ?_⟩, ?_, ?_, ?_⟩
  · norm_num [fin3_two_ne_one, fin3_two_ne_zero, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, lower, initial, column]
  all_goals
    norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, stop, switch, failure, lower, upper, dominating, initial, middle,
      finalState, nullForm, column, Fin.forall_fin_succ, Fin.exists_fin_succ]

private lemma case222_middle : case222 middle := by
  refine ⟨⟨0, rfl⟩, ⟨1, 0, rfl, ?_⟩, ?_, ?_, ?_⟩
  · norm_num [fin3_two_ne_one, fin3_two_ne_zero, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, lower, middle, column]
  all_goals
    norm_num [fin3_two_ne_one, fin3_two_ne_zero, coeff_one_add_neg_one, Matrix.cons_val_two, Matrix.vecHead, Matrix.vecTail,
      coe_one_coeff, coe_add_coeff, stop, switch, failure, lower, upper, dominating, initial, middle,
      finalState, nullForm, column, Fin.forall_fin_succ, Fin.exists_fin_succ]

/-! ## Target theorems (audit surface: the three public theorems below) -/

/-- **A1 (fidelity, singleton case).** On any state in the paper's Case 2.2.2
whose (53b)-candidate set is a singleton, the paper's Theorem-4.3 selection
returns that pair via branch (47) — the θ-interval values over Rλμ, the
T/T′ hB/hU filter, and the tie-stages (48)–(52) do not participate. This is
the formal counterpart of scoping-note §10.1's proposition. -/
theorem paperSelect_forced_singleton {s : State} {i : RowIndex} {j : Var}
    (_hcase : case222 s) (hsing : paperCandidates s = {(i, j)}) :
    paperSelect s = some (i, j) := by
  unfold paperSelect
  have hex : ∃ p, paperCandidates s = {p} := ⟨(i, j), hsing⟩
  have hspec := hex.choose_spec
  have h1 : (i, j) ∈ paperCandidates s := by rw [hsing]; simp
  rw [hspec] at h1
  have hkey : hex.choose = (i, j) := (Set.mem_singleton_iff.mp h1).symm
  rw [dif_pos hex, hkey]

/-- **A2 (the refutation run).** The paper's procedure, run verbatim on the
bounded (Def 4.2) two-row instance `initial`: both steps are singleton
selections (A1), the run terminates in the procedure's success branch, and
the asserted minimum `min z = 1` (at h := 1, i.e. the point `output`) is
strictly beaten by the feasible witness `better` with cost `0`. The standard
final-cost bookkeeping holds (`eval initial.cost output = eval
finalState.cost output = 1`): the failure is optimality, not bookkeeping. -/
theorem paper_run_not_optimal :
    bounded initial ∧
    paperSelect initial = some (0, 1) ∧ advance initial 0 1 = middle ∧
    paperSelect middle = some (1, 0) ∧ advance middle 1 0 = finalState ∧
    terminal finalState ∧
    feasible initial output ∧ eval initial.cost output = (1 : Coeff) ∧
    eval finalState.cost output = (1 : Coeff) ∧
    feasible initial better ∧ eval initial.cost better = (0 : Coeff) ∧
    eval initial.cost better < eval initial.cost output := by
  refine ⟨bounded_initial, paperSelect_forced_singleton case222_initial candidates_initial,
    advance_first, paperSelect_forced_singleton case222_middle candidates_middle,
    advance_second, terminal_final, output_feasible_cost.1, output_feasible_cost.2.1,
    output_feasible_cost.2.2, better_feasible_cost.1, better_feasible_cost.2, ?_⟩
  rw [better_feasible_cost.2, output_feasible_cost.2.1]
  norm_num

/-- **A2′ (sharpening).** The instance's true infimum is −∞: for every
threshold r there is a feasible point of cost below r (witness family
`(r−1, r−2, r−1)`). The procedure's success branch asserts a *finite*
minimum (1) on an unbounded-below instance. (Spec-signature correction
recorded in P0-record.md: the dossier spec's `(r : Coeff) < eval …` had the
inequality reversed; unbounded-*below* is `eval … < r`.) -/
theorem instance_unbounded_below :
    ∀ r : ℝ, ∃ w : Fin 3 → ℝ,
      feasible initial w ∧ eval initial.cost w < (r : Coeff) := by
  intro r
  refine ⟨![r - 1, r - 2, r - 1], ?_, ?_⟩
  · -- feasibility of the witness family
    intro i
    fin_cases i
    · -- row 0: coe (0+(r−1)) ≤ max (coe (0+(r−1))) (max (coe (0+(r−2))) ⊥)
      show eval ![⊥, ⊥, (0 : Coeff)] ![r - 1, r - 2, r - 1] ≤
           eval ![(0 : Coeff), 0, ⊥] ![r - 1, r - 2, r - 1]
      simp only [eval, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
        Matrix.head_cons, Matrix.tail_cons, bot_add_coeff, coe_add_coeff, coe_zero_coeff,
        max_bot_left_coeff, max_bot_right_coeff]
      exact le_max_left _ _
    · -- row 1: max (coe (1+(r−2))) (coe (−2+(r−1))) ≤ coe (0+(r−1))
      show eval ![⊥, (1 : Coeff), ((-2 : ℝ) : Coeff)] ![r - 1, r - 2, r - 1] ≤
           eval ![(0 : Coeff), ⊥, ⊥] ![r - 1, r - 2, r - 1]
      simp only [eval, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
        Matrix.head_cons, Matrix.tail_cons, bot_add_coeff, coe_add_coeff, coe_zero_coeff,
        coe_one_coeff, max_bot_left_coeff, max_bot_right_coeff]
      refine max_le_iff.mpr ⟨?_, ?_⟩
      · exact WithBot.coe_le_coe.mpr (by linarith)
      · exact WithBot.coe_le_coe.mpr (by linarith)
  · -- cost: coe (0+(r−1)) < coe r
    show eval ![(0 : Coeff), ⊥, ⊥] ![r - 1, r - 2, r - 1] < (r : Coeff)
    simp only [eval, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
      Matrix.head_cons, Matrix.tail_cons, bot_add_coeff, coe_add_coeff, coe_zero_coeff,
      max_bot_left_coeff, max_bot_right_coeff]
    exact WithBot.coe_lt_coe.mpr (by linarith)

end
end Truffet78
end CrossMath

/-! ## Audit surface (charter: every top-level theorem, triad-only expected) -/

#print axioms CrossMath.Truffet78.paperSelect_forced_singleton
#print axioms CrossMath.Truffet78.paper_run_not_optimal
#print axioms CrossMath.Truffet78.instance_unbounded_below
