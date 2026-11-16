/-
PROOF ARTIFACT — AL-P1, the fibre-geometry core of the B.2 route (card 7; spec
`qa/iter4-review/r5-iteration4-backlog.md` §11b + `pilots/al-3d-prework.md` §2.5 AS
CORRECTED by its §9 correction log: the boundary lift is stated against the PROJECTED
graph `projLattice Λ` — the induced-square reading is refuted by the two-site slab
`Λ = {(0,0,0), (1,0,5)}`, `A = {(0,0,0)}` (prework §9, 2026-11-16).

Self-contained (pilot-01/73 convention: this file re-declares the lattice defs it
consumes; `A2.lean` will import this file as a sibling). NO entropy core — P1 is pure
graph combinatorics. NO donor imports, NO Physlib (G5a boundary).

FENCES: nothing here progresses `AreaLaw3D` (NOT A TARGET, Targets.md §A :23; C.1 :103,
C.2 :111, C.3 :117, C.4 :123); B.1 remains donor-owned; full `SlabAreaLaw3D` is
HARD-STOPPED (prework stop-gate ii). The statements are the donor's Cylinder3D
architecture steps generalized from `IsCyl` to slabs — pattern-only, mathlib-only.

Content: P1-a projection contraction (walk / edist / diameter forms), P1-b boundary
lift (projected-graph form, column-closed cuts, injective lift), P1-c fibre/row count,
P1-d slab/column basics + `projLattice ≤ planarLattice`. Pin-verified API anchors:
`SimpleGraph.fromRel_adj` (Basic.lean:135–141), `edist_eq_sInf`/`Walk.edist_le`
(Metric.lean:55–73), `Walk.induce` (Walk/Maps.lean:227), `SimpleGraph.induce_adj`,
`SimpleGraph.mem_interedges_iff` (Density.lean:46–57), `iSup₂_le`/`le_iSup₂`
(Order/CompleteLattice/Basic.lean:226/239), `Walk.support_nil`/`length_cons`
(Walk/Basic.lean:95/135). Inline full-coverage `#print axioms` at the end.
-/

import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Order.SuccPred
import Mathlib.Order.Cover
import Mathlib.Algebra.Group.Pointwise.Finset.Basic
import Mathlib.Combinatorics.SimpleGraph.Density
import Mathlib.Combinatorics.SimpleGraph.Hasse
import Mathlib.Combinatorics.SimpleGraph.Metric
import Mathlib.Combinatorics.SimpleGraph.Prod
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Int.Interval
import Mathlib.Logic.Equiv.Basic
import Mathlib.Order.Bounds.Basic
import Mathlib.Topology.Instances.Int

namespace OpenAI.AL3D

open SimpleGraph

/-- The cubic lattice `ℤ³` (donor spelling, `OpenAI/Statements3D.lean:64`). -/
noncomputable abbrev cubicLattice3D : SimpleGraph (ℤ × ℤ × ℤ) := hasse ℤ □ (hasse ℤ □ hasse ℤ)

/-- The square lattice `ℤ²` (donor spelling). -/
noncomputable abbrev planarLattice : SimpleGraph (ℤ × ℤ) := hasse ℤ □ hasse ℤ

/-- Adjacency in `cubicLattice3D` is decidable (classical, donor convention). -/
noncomputable instance : DecidableRel cubicLattice3D.Adj := Classical.decRel _

/-- The column projection `π : ℤ³ → ℤ²` (the donor's `column` map). -/
def proj (x : ℤ × ℤ × ℤ) : ℤ × ℤ := (x.1, x.2.1)

/-- The projection of a 3D domain as a `Finset` (readability: avoids `''`-ascription
ambiguity between Set- and Finset-image). -/
def projF (Λ : Finset (ℤ × ℤ × ℤ)) : Finset (ℤ × ℤ) := Λ.image proj

theorem mem_projF {Λ : Finset (ℤ × ℤ × ℤ)} {u : ℤ × ℤ} (hu : u ∈ projF Λ) :
    ∃ x, x ∈ Λ ∧ proj x = u := Finset.mem_image.1 hu

/-- The projected-edge relation (directional; `projLattice` symmetrizes). -/
def projEdge (Λ : Finset (ℤ × ℤ × ℤ)) (u u' : ℤ × ℤ) : Prop :=
  ∃ x y : ℤ × ℤ × ℤ, x ∈ Λ ∧ y ∈ Λ ∧ cubicLattice3D.Adj x y ∧ proj x = u ∧ proj y = u'

/-- The PROJECTED graph of a 3D domain (prework §9 correction: the honest
boundary-lift object, a subgraph of `planarLattice` on `proj '' Λ`). -/
def projLattice (Λ : Finset (ℤ × ℤ × ℤ)) : SimpleGraph (ℤ × ℤ) :=
  SimpleGraph.fromRel (projEdge Λ)

/-- The graph distance `d_Λ` of the cubic lattice induced on `Λ` (donor spelling, :75). -/
noncomputable def domainEDist3D (Λ : Finset (ℤ × ℤ × ℤ)) (x y : ℤ × ℤ × ℤ) : ℕ∞ :=
  if h : x ∈ Λ ∧ y ∈ Λ then
    (cubicLattice3D.induce (Λ : Set (ℤ × ℤ × ℤ))).edist ⟨x, h.1⟩ ⟨y, h.2⟩
  else ⊤

/-- The diameter `diam_{d_Λ} X` (donor spelling, :84 area). -/
noncomputable def domainEDiam3D (Λ X : Finset (ℤ × ℤ × ℤ)) : ℕ∞ :=
  ⨆ x ∈ X, ⨆ y ∈ X, domainEDist3D Λ x y

/-- The edge boundary `∂_Λ A` (donor spelling, :98). -/
noncomputable def edgeBoundary3D (Λ A : Finset (ℤ × ℤ × ℤ)) :
    Finset ((ℤ × ℤ × ℤ) × (ℤ × ℤ × ℤ)) :=
  cubicLattice3D.interedges A (Λ \ A)

/-- The graph distance of an ambient planar graph `G` induced on `Λ'`. -/
noncomputable def domainEDistG (G : SimpleGraph (ℤ × ℤ)) (Λ' : Finset (ℤ × ℤ))
    (u v : ℤ × ℤ) : ℕ∞ :=
  if h : u ∈ Λ' ∧ v ∈ Λ' then
    (G.induce (Λ' : Set (ℤ × ℤ))).edist ⟨u, h.1⟩ ⟨v, h.2⟩
  else ⊤

/-- The diameter of `X` under `domainEDistG G Λ'`. -/
noncomputable def domainEDiamG (G : SimpleGraph (ℤ × ℤ)) (Λ' X : Finset (ℤ × ℤ)) : ℕ∞ :=
  ⨆ u ∈ X, ⨆ v ∈ X, domainEDistG G Λ' u v

/-- The edge boundary at ambient graph `G`. -/
noncomputable def edgeBoundaryG (G : SimpleGraph (ℤ × ℤ)) (Λ' A : Finset (ℤ × ℤ)) :
    Finset ((ℤ × ℤ) × (ℤ × ℤ)) :=
  letI : DecidableRel G.Adj := Classical.decRel _
  G.interedges A (Λ' \ A)

/-- A domain inside the slab `ℤ² × [0, h)` (donor spelling). -/
def IsSlabDomain3D (h : ℕ) (Λ : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∀ x ∈ Λ, 0 ≤ x.2.2 ∧ x.2.2 < h

/-- A cut is column-closed in `Λ` (Targets.md §D rule-2 new name). -/
def IsColumnClosed3D (Λ A : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∀ x ∈ A, ∀ y ∈ Λ, (y.1, y.2.1) = (x.1, x.2.1) → y ∈ A

/-! ## P1-d — slab and column basics -/

/-- The column of `u`: the sites of `Λ` projecting to `u`. -/
def col (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) : Finset (ℤ × ℤ × ℤ) :=
  Λ.filter fun x => proj x = u

theorem col_subset (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) : col Λ u ⊆ Λ :=
  Finset.filter_subset _ _

theorem mem_col_of_proj (Λ : Finset (ℤ × ℤ × ℤ)) {x : ℤ × ℤ × ℤ} (u : ℤ × ℤ)
    (hx : x ∈ Λ) (h : proj x = u) : x ∈ col Λ u :=
  Finset.mem_filter.2 ⟨hx, h⟩

/-- P1-d: column heights live in `[0, h)` for slab domains (the `h_u ≤ h` fact). -/
theorem col_heights (h : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)} (hΛ : IsSlabDomain3D h Λ)
    (u : ℤ × ℤ) : ∀ x ∈ col Λ u, 0 ≤ x.2.2 ∧ x.2.2 < (h : ℤ) :=
  fun x hx => hΛ x (col_subset Λ u hx)

/-- P1-d: the height coordinate is injective on a column. -/
theorem col_inj_on_z (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) {x y : ℤ × ℤ × ℤ}
    (hx : x ∈ col Λ u) (hy : y ∈ col Λ u) (h : x.2.2 = y.2.2) : x = y := by
  obtain ⟨-, hxu⟩ := Finset.mem_filter.1 hx
  obtain ⟨-, hyu⟩ := Finset.mem_filter.1 hy
  have hp : (x.1, x.2.1) = (y.1, y.2.1) := hxu.trans hyu.symm
  have h1 : x.1 = y.1 := congrArg (fun p : ℤ × ℤ => p.1) hp
  have h2 : x.2.1 = y.2.1 := congrArg (fun p : ℤ × ℤ => p.2) hp
  exact Prod.ext h1 (Prod.ext h2 h)

/-- P1-d/P1-c core: a slab column has at most `h` sites. -/
theorem col_card_le (h : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)} (hΛ : IsSlabDomain3D h Λ)
    (u : ℤ × ℤ) : (col Λ u).card ≤ h := by
  classical
  have hinj : Set.InjOn (fun x : ℤ × ℤ × ℤ => (x.2.2 : ℤ))
      (↑(col Λ u) : Set (ℤ × ℤ × ℤ)) := by
    rintro a ha b hb hab
    simpa using col_inj_on_z Λ u (Finset.mem_coe.2 ha) (Finset.mem_coe.2 hb) hab
  have hsub : (col Λ u).image (fun x : ℤ × ℤ × ℤ => (x.2.2 : ℤ)) ⊆ Finset.Ico (0 : ℤ) h := by
    intro b hb
    obtain ⟨x, hx, rfl⟩ := Finset.mem_image.1 hb
    exact Finset.mem_Ico.2 (col_heights h hΛ u x hx)
  calc (col Λ u).card = ((col Λ u).image (fun x : ℤ × ℤ × ℤ => (x.2.2 : ℤ))).card :=
        (Finset.card_image_of_injOn hinj).symm
    _ ≤ (Finset.Ico (0 : ℤ) h).card := Finset.card_le_card hsub
    _ = h := by rw [Int.card_Ico, Int.sub_zero]; simp

/-! ## P1-c — the fibre/row count: `|(π ⁻¹' S) ∩ Λ| ≤ h * |S|` -/

/-- The fibre of `S` in `Λ`. -/
def fibre (Λ : Finset (ℤ × ℤ × ℤ)) (S : Finset (ℤ × ℤ)) : Finset (ℤ × ℤ × ℤ) :=
  Λ.filter fun x => proj x ∈ S

theorem fibre_eq_bUnion_cols (Λ : Finset (ℤ × ℤ × ℤ)) (S : Finset (ℤ × ℤ)) :
    fibre Λ S = S.biUnion (col Λ) := by
  ext x
  simp only [fibre, Finset.mem_filter, Finset.mem_biUnion, col, Finset.mem_filter]
  constructor
  · rintro ⟨hxΛ, hPS⟩
    exact ⟨proj x, hPS, hxΛ, rfl⟩
  · rintro ⟨u, huS, hxΛ, rfl⟩
    exact ⟨hxΛ, huS⟩

/-- P1-c: the row/fibre count acquires exactly the factor `h`
(Targets.md §B.2 :51 "every row count acquires a factor `h`" step). -/
theorem fibre_card_le (h : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)} (hΛ : IsSlabDomain3D h Λ)
    (S : Finset (ℤ × ℤ)) : (fibre Λ S).card ≤ h * S.card := by
  rw [fibre_eq_bUnion_cols]
  exact (Finset.card_biUnion_le_card_mul S (col Λ) h
    (fun u _ => col_card_le h hΛ u)).trans (le_of_eq (Nat.mul_comm _ _))

/-! ## P1-a — the projection contraction (walk, edist, and diameter forms) -/

/-- Cubic adjacency splits: adjacent sites with distinct projections span a projected
edge; adjacent sites in one column share their projection. -/
theorem projLattice_adj_of_cubic_adj {Λ : Finset (ℤ × ℤ × ℤ)} {x y : ℤ × ℤ × ℤ}
    (hx : x ∈ Λ) (hy : y ∈ Λ) (hadj : cubicLattice3D.Adj x y) :
    proj x = proj y ∨ (projLattice Λ).Adj (proj x) (proj y) := by
  rcases eq_or_ne (proj x) (proj y) with h | h
  · exact Or.inl h
  · refine Or.inr ?_
    simp only [projLattice]
    rw [SimpleGraph.fromRel_adj]
    exact ⟨h, Or.inl ⟨x, y, hx, hy, hadj, rfl, rfl⟩⟩

/-- P1-a (walk form): every cubic `Λ`-walk projects to a `projLattice Λ`-walk (vertical
steps collapse; horizontal steps become projected edges), and the projected walk's
support stays inside `proj '' Λ` (the donor's column-path argument, Targets.md report
item 9). -/
theorem proj_walk_full (Λ : Finset (ℤ × ℤ × ℤ)) (a b : ↥((Λ : Finset (ℤ × ℤ × ℤ)) :
    Set (ℤ × ℤ × ℤ)))
    (p : (cubicLattice3D.induce ((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ))).Walk a b) :
    ∃ q : (projLattice Λ).Walk (proj (a : ℤ × ℤ × ℤ)) (proj (b : ℤ × ℤ × ℤ)),
      q.length ≤ p.length ∧ ∀ z ∈ q.support, z ∈ projF Λ := by
  induction p with
  | @nil u =>
      refine ⟨Walk.nil, le_rfl, ?_⟩
      intro z hz
      rw [Walk.support_nil, List.mem_singleton] at hz
      rw [hz]
      exact Finset.mem_image.2
        ⟨(u : ℤ × ℤ × ℤ), Finset.mem_coe.mp u.2, rfl⟩
  | @cons u v w hadj p' ih =>
      obtain ⟨q, hq, hsup⟩ := ih
      have hcub : cubicLattice3D.Adj (u : ℤ × ℤ × ℤ) (v : ℤ × ℤ × ℤ) :=
        SimpleGraph.induce_adj.1 hadj
      have huΛ : (u : ℤ × ℤ × ℤ) ∈ Λ := Finset.mem_coe.mp u.2
      have hvΛ : (v : ℤ × ℤ × ℤ) ∈ Λ := Finset.mem_coe.mp v.2
      rcases projLattice_adj_of_cubic_adj huΛ hvΛ hcub with hproj | hadj'
      · rw [show (proj (u : ℤ × ℤ × ℤ)) = (proj (v : ℤ × ℤ × ℤ)) from hproj]
        exact ⟨q, hq.trans (Nat.le_succ _), hsup⟩
      · refine ⟨Walk.cons hadj' q, ?_, ?_⟩
        · simpa only [Walk.length_cons] using Nat.succ_le_succ hq
        · intro z hz
          simp only [Walk.support_cons, List.mem_cons] at hz
          rcases hz with rfl | hz
          · exact Finset.mem_image_of_mem proj huΛ
          · exact hsup z hz

/-- Length preservation of `Walk.induce` (mathlib carries the rfl-lemmas but not the
length fact; both `induce_nil`/`induce_cons` are `rfl`). -/
theorem walk_induce_length {V : Type*} {G : SimpleGraph V} {s : Set V} {u v : V} :
    ∀ (q : G.Walk u v) (hw : ∀ x ∈ q.support, x ∈ s),
      (q.induce s hw).length = q.length := by
  intro q
  induction q with
  | nil => intro _; rfl
  | @cons a b c hadj q' ih =>
      intro hw
      rw [SimpleGraph.Walk.induce_cons, SimpleGraph.Walk.length_cons,
        SimpleGraph.Walk.length_cons, ih (by simp_all)]

/-- P1-a (edist form): the projected graph's induced distance contracts the cubic
induced distance. -/
theorem proj_edist_le (Λ : Finset (ℤ × ℤ × ℤ)) {x y : ℤ × ℤ × ℤ}
    (hx : x ∈ Λ) (hy : y ∈ Λ) :
    ((projLattice Λ).induce ((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ))).edist
        ⟨proj x, Finset.mem_image_of_mem proj hx⟩ ⟨proj y, Finset.mem_image_of_mem proj hy⟩ ≤
      (cubicLattice3D.induce ((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ))).edist
        ⟨x, Finset.mem_coe.2 hx⟩ ⟨y, Finset.mem_coe.2 hy⟩ := by
  rw [SimpleGraph.edist_eq_sInf, SimpleGraph.edist_eq_sInf]
  refine le_sInf_iff.2 ?_
  intro b hb
  obtain ⟨p, rfl⟩ := hb
  obtain ⟨q, hq, hsup⟩ :=
    proj_walk_full Λ ⟨x, Finset.mem_coe.2 hx⟩ ⟨y, Finset.mem_coe.2 hy⟩ p
  have h1 : ((projLattice Λ).induce ((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ))).edist
      ⟨proj x, Finset.mem_image_of_mem proj hx⟩ ⟨proj y, Finset.mem_image_of_mem proj hy⟩ ≤
      (q.length : ℕ∞) := by
    refine le_trans (SimpleGraph.Walk.edist_le
      (q.induce _ fun z hz => Finset.mem_coe.2 (hsup z hz))) ?_
    rw [walk_induce_length]
  exact h1.trans (Nat.cast_le.2 hq)

/-- Dite-unfold helper (statement-level plumbing). -/
theorem domainEDistG_of_mem {G : SimpleGraph (ℤ × ℤ)} {Λ' : Finset (ℤ × ℤ)} {u v : ℤ × ℤ}
    (hu : u ∈ Λ') (hv : v ∈ Λ') :
    domainEDistG G Λ' u v = (G.induce (Λ' : Set (ℤ × ℤ))).edist ⟨u, hu⟩ ⟨v, hv⟩ :=
  dif_pos ⟨hu, hv⟩

/-- Dite-unfold helper (statement-level plumbing). -/
theorem domainEDist3D_of_mem {Λ : Finset (ℤ × ℤ × ℤ)} {x y : ℤ × ℤ × ℤ}
    (hx : x ∈ Λ) (hy : y ∈ Λ) :
    domainEDist3D Λ x y =
      (cubicLattice3D.induce (Λ : Set (ℤ × ℤ × ℤ))).edist ⟨x, hx⟩ ⟨y, hy⟩ :=
  dif_pos ⟨hx, hy⟩

/-- P1-a (diameter form): projected supports stay admissible — the transfer feeding
P2's `IsAdmissibleVar` check at `G := projLattice Λ`. -/
theorem proj_diam_le (Λ X : Finset (ℤ × ℤ × ℤ)) (hXΛ : X ⊆ Λ) :
    domainEDiamG (projLattice Λ) (projF Λ) (projF X) ≤ domainEDiam3D Λ X := by
  refine iSup₂_le fun u hu => iSup₂_le fun v hv => ?_
  obtain ⟨x, hxX, rfl⟩ := Finset.mem_image.1 hu
  obtain ⟨y, hyX, rfl⟩ := Finset.mem_image.1 hv
  have hxΛ : x ∈ Λ := hXΛ hxX
  have hyΛ : y ∈ Λ := hXΛ hyX
  have hmemL : proj x ∈ projF Λ := Finset.mem_image_of_mem proj hxΛ
  have hmemR : proj y ∈ projF Λ := Finset.mem_image_of_mem proj hyΛ
  rw [domainEDistG_of_mem hmemL hmemR]
  refine le_trans (le_trans (proj_edist_le Λ hxΛ hyΛ)
    (le_of_eq (domainEDist3D_of_mem hxΛ hyΛ).symm)) ?_
  exact (le_iSup₂ (f := fun b (_ : b ∈ X) => domainEDist3D Λ x b) y hyX).trans
    (le_iSup₂ (f := fun a (_ : a ∈ X) => ⨆ b ∈ X, domainEDist3D Λ a b) x hxX)

/-! ## P1-b — the boundary lift (projected-graph form; column-closed cuts) -/

/-- Column-closed cuts contain whole `Λ`-columns of their projection. -/
theorem col_subset_A_of_mem_proj {Λ A : Finset (ℤ × ℤ × ℤ)} (hA : IsColumnClosed3D Λ A)
    {u : ℤ × ℤ} (hu : u ∈ projF A) {y : ℤ × ℤ × ℤ} (hy : y ∈ Λ)
    (hcol : proj y = u) : y ∈ A := by
  obtain ⟨x, hxA, rfl⟩ := Finset.mem_image.1 hu
  exact hA x hxA y hy hcol

/-- P1-b: every projected crossing edge of a column-closed cut lifts to a cubic
crossing edge — the injective lift behind the card inequality (the donor's Cylinder3D
edge-count step, generalized from `IsCyl` to slabs; prework §9-corrected form). -/
theorem edgeBoundaryG_card_le (Λ A : Finset (ℤ × ℤ × ℤ)) (hA : IsColumnClosed3D Λ A)
    (hAΛ : A ⊆ Λ) :
    (edgeBoundaryG (projLattice Λ) (projF Λ) (projF A)).card ≤
      (edgeBoundary3D Λ A).card := by
  classical
  have hex : ∀ e ∈ edgeBoundaryG (projLattice Λ) (projF Λ) (projF A),
      ∃ z : (ℤ × ℤ × ℤ) × (ℤ × ℤ × ℤ), z ∈ edgeBoundary3D Λ A ∧
        (proj z.1, proj z.2) = e := by
    intro e he
    obtain ⟨u, u'⟩ := e
    rw [edgeBoundaryG, SimpleGraph.mem_interedges_iff] at he
    obtain ⟨h1, h2, h3⟩ := he
    rw [Finset.mem_sdiff] at h2
    obtain ⟨h2Λ, h2A⟩ := h2
    simp only [SimpleGraph.fromRel_adj] at h3
    obtain ⟨-, hdir⟩ := h3
    rcases hdir with ⟨x, y, hxΛ, hyΛ, hadj, rfl, rfl⟩ | ⟨x, y, hxΛ, hyΛ, hadj, rfl, rfl⟩
    · have hxA : x ∈ A := col_subset_A_of_mem_proj hA h1 hxΛ rfl
      have hyA : y ∉ A := fun hy => h2A (Finset.mem_image_of_mem proj hy)
      exact ⟨(x, y),
        Finset.mem_filter.2 ⟨Finset.mem_product.2 ⟨hxA, Finset.mem_sdiff.2 ⟨hyΛ, hyA⟩⟩, hadj⟩,
        rfl⟩
    · have hyA : y ∈ A := col_subset_A_of_mem_proj hA h1 hyΛ rfl
      have hxA : x ∉ A := fun hx => h2A (Finset.mem_image_of_mem proj hx)
      exact ⟨(y, x),
        Finset.mem_filter.2 ⟨Finset.mem_product.2 ⟨hyA, Finset.mem_sdiff.2 ⟨hxΛ, hxA⟩⟩,
          hadj.symm⟩, rfl⟩
  have hsub : edgeBoundaryG (projLattice Λ) (projF Λ) (projF A) ⊆
      (edgeBoundary3D Λ A).image
        (fun z : (ℤ × ℤ × ℤ) × (ℤ × ℤ × ℤ) => (proj z.1, proj z.2)) := by
    intro e he
    obtain ⟨z, hz1, hz2⟩ := hex e he
    exact Finset.mem_image.2 ⟨z, hz1, hz2⟩
  exact (Finset.card_le_card hsub).trans Finset.card_image_le

/-! ## The subgraph fact feeding the binder application (`G ≤ planarLattice`) -/

/-- `ℤ`-cover is exactly the add-one step (`Order.covBy_iff_add_one_eq` cannot
instantiate at `ℤ` on this pin — no `SuccAddOrder ℤ` instance — so proved from
`Order.covBy_iff_lt_and_eq_or_eq` directly). -/
theorem int_covBy_add_one {a b : ℤ} : a ⋖ b ↔ a + 1 = b := by
  rw [covBy_iff_lt_and_eq_or_eq]
  constructor
  · rintro ⟨hlt, h⟩
    rcases eq_or_ne b (a + 1) with hb | hb
    · exact hb.symm
    · exfalso
      obtain h' | h' := h (a + 1) (by omega) (by omega)
      · omega
      · omega
  · intro hb
    exact ⟨by omega, fun c hc1 hc2 => by omega⟩

/-- Arithmetic characterization of cubic adjacency. -/
theorem cubic_adj_iff {x y : ℤ × ℤ × ℤ} :
    cubicLattice3D.Adj x y ↔
      ((x.1 + 1 = y.1 ∨ y.1 + 1 = x.1) ∧ (x.2.1, x.2.2) = (y.2.1, y.2.2) ∨
       (x.2.1 + 1 = y.2.1 ∨ y.2.1 + 1 = x.2.1) ∧ x.2.2 = y.2.2 ∧ x.1 = y.1 ∨
       (x.2.2 + 1 = y.2.2 ∨ y.2.2 + 1 = x.2.2) ∧ x.2.1 = y.2.1 ∧ x.1 = y.1) := by
  simp only [cubicLattice3D, boxProd_adj, hasse_adj, int_covBy_add_one]
  tauto

/-- Arithmetic characterization of square-lattice adjacency. -/
theorem planar_adj_iff {u v : ℤ × ℤ} :
    planarLattice.Adj u v ↔
      ((u.1 + 1 = v.1 ∨ v.1 + 1 = u.1) ∧ u.2 = v.2 ∨
       (u.2 + 1 = v.2 ∨ v.2 + 1 = u.2) ∧ u.1 = v.1) := by
  simp only [planarLattice, boxProd_adj, hasse_adj, int_covBy_add_one]

/-- Cubic adjacency transfers to square adjacency of distinct projections (the only
adjacency fact P1 needs: a cubic step is planar unless it is vertical). -/
theorem planar_adj_of_cubic_adj {x y : ℤ × ℤ × ℤ} (hadj : cubicLattice3D.Adj x y)
    (hne : proj x ≠ proj y) : planarLattice.Adj (proj x) (proj y) := by
  rw [cubic_adj_iff] at hadj
  rw [planar_adj_iff, proj, proj]
  rcases hadj with ⟨h1, h2⟩ | ⟨h1, h2, h3⟩ | ⟨h1, h2, h3⟩
  · obtain ⟨h2a, -⟩ := Prod.ext_iff.1 h2
    exact Or.inl ⟨h1, h2a⟩
  · exact Or.inr ⟨h1, h3⟩
  · exfalso
    apply hne
    simp only [proj, Prod.ext_iff, h2, h3]

/-- `projLattice Λ` is a subgraph of the square lattice (instantiates
`PlanarAreaLawVar`'s ambient-graph parameter at `G := projLattice Λ`). -/
theorem projLattice_le_planar (Λ : Finset (ℤ × ℤ × ℤ)) :
    projLattice Λ ≤ planarLattice := by
  rintro u u' ⟨hne, hdir⟩
  rcases hdir with ⟨x, y, -, -, hadj, rfl, rfl⟩ | ⟨x, y, -, -, hadj, rfl, rfl⟩
  · exact planar_adj_of_cubic_adj hadj hne
  · exact (planar_adj_of_cubic_adj hadj (Ne.symm hne)).symm

/-! ## Inline full-coverage axiom audit (71/73 convention; every top-level theorem). -/

#print axioms col_subset
#print axioms mem_projF
#print axioms mem_col_of_proj
#print axioms col_heights
#print axioms col_inj_on_z
#print axioms col_card_le
#print axioms fibre_eq_bUnion_cols
#print axioms fibre_card_le
#print axioms projLattice_adj_of_cubic_adj
#print axioms proj_walk_full
#print axioms walk_induce_length
#print axioms proj_edist_le
#print axioms domainEDistG_of_mem
#print axioms domainEDist3D_of_mem
#print axioms proj_diam_le
#print axioms col_subset_A_of_mem_proj
#print axioms edgeBoundaryG_card_le
#print axioms int_covBy_add_one
#print axioms cubic_adj_iff
#print axioms planar_adj_iff
#print axioms planar_adj_of_cubic_adj
#print axioms projLattice_le_planar

end OpenAI.AL3D
