/-
  Pilot 72, tranche T2 — M1 NEW CONTENT on the Tier-C vendor layer (72M1T1): the
  grid bridge `iotaL`, boundary comparability (L2, with constant 1 — stronger than the
  prework's ≤ 4 safety form), the configuration transport `configEquiv`, and the
  ptrace-Gram identity (L1) with the entropy match (prework §2.3, steps vii–viii).

  Posture: dossier 72 M1's interface theorem needs L1/L2/L3; this tranche lands L2 and
  L1 + entropy match. L3 (Hamiltonian/ground-state/gap transfer) and the interface
  theorem itself are NOT in this file (stop+diagnose per the overrun guard; the
  continuation spec lives in the pilot log).

  No `sorry`, no `native_decide`, no external CAS.
-/
import P72M1T1

namespace CrossMath.Pilot72.M1

open Arealaw OpenAI OAI PolynomialPEPS.PinnedEntropy
open Matrix SimpleGraph
open scoped ComplexOrder

/-! ## §1 The grid bridge -/

/-- The canonical embedding of the `L × L` vertex grid into the square lattice. -/
def iotaL {L : ℕ} (v : Vertex L) : ℤ × ℤ := (v.1.val, v.2.val)

theorem iotaL_injective {L : ℕ} : Function.Injective (iotaL (L := L)) := by
  intro a b h
  have h1 : a.1.val = b.1.val := by
    have hm := congrArg Prod.fst h; simp only [iotaL] at hm; omega
  have h2 : a.2.val = b.2.val := by
    have hm := congrArg Prod.snd h; simp only [iotaL] at hm; omega
  exact Prod.ext (Fin.val_injective h1) (Fin.val_injective h2)

/-- The image of a grid region under the embedding (Finset image; the `''` notation is
Set-valued and does not apply). -/
def iotaLimg {L : ℕ} (S : Finset (Vertex L)) : Finset (ℤ × ℤ) :=
  Finset.image (iotaL (L := L)) S

/-- The `L × L` grid as a finite domain of the square lattice. -/
def gridDom (L : ℕ) : Finset (ℤ × ℤ) := iotaLimg (L := L) Finset.univ

theorem iotaL_mem_gridDom {L : ℕ} (v : Vertex L) : iotaL v ∈ gridDom L :=
  Finset.mem_image_of_mem _ (Finset.mem_univ v)

theorem v_mem_of_mem_image {L : ℕ} {A : Finset (Vertex L)} {v : Vertex L}
    (h : iotaL v ∈ iotaLimg A) : v ∈ A := by
  obtain ⟨w, hw, he⟩ := Finset.mem_image.1 h
  exact iotaL_injective he ▸ hw

theorem iotaL_mem_image {L : ℕ} {A : Finset (Vertex L)} {v : Vertex L} (hv : v ∈ A) :
    iotaL v ∈ iotaLimg A := Finset.mem_image_of_mem _ hv

theorem iotaL_not_mem_image {L : ℕ} {A : Finset (Vertex L)} {v : Vertex L} (hv : v ∉ A) :
    iotaL v ∉ iotaLimg A := fun h => hv (v_mem_of_mem_image h)

theorem image_subset_gridDom {L : ℕ} {A : Finset (Vertex L)} : iotaLimg A ⊆ gridDom L := by
  intro x hx
  obtain ⟨v, -, rfl⟩ := Finset.mem_image.1 hx
  exact iotaL_mem_gridDom v

/-- Adjacency in the square lattice, in arithmetic form (the donor decidability
instance's own characterization). -/
theorem adj_squareLattice {x y : ℤ × ℤ} :
    (hasse ℤ □ hasse ℤ).Adj x y ↔
      ((x.1 + 1 = y.1 ∨ y.1 + 1 = x.1) ∧ x.2 = y.2) ∨
      ((x.2 + 1 = y.2 ∨ y.2 + 1 = x.2) ∧ x.1 = y.1) := by
  simp [boxProd_adj, hasse_adj, Order.covBy_iff_add_one_eq]

/-- Forward adjacency of the grid lands in square-lattice adjacency. -/
theorem adj_of_forwardAdjacent {L : ℕ} {v w : Vertex L} (h : ForwardAdjacent v w) :
    (hasse ℤ □ hasse ℤ).Adj (iotaL v) (iotaL w) := by
  rw [adj_squareLattice]
  rcases h with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · exact Or.inl ⟨Or.inl (by simp only [iotaL]; omega),
      by simp only [iotaL, h2]⟩
  · exact Or.inr ⟨Or.inl (by simp only [iotaL]; omega),
      by simp only [iotaL, h1]⟩

/-! ## §2 L2 — boundary comparability (constant 1) -/

/-- `boundaryCard`'s crossing predicate, verbatim. -/
def crosses {L : ℕ} (A : Finset (Vertex L)) (e : Edge L) : Prop :=
  (e.val.1 ∈ A ∧ e.val.2 ∉ A) ∨ (e.val.1 ∉ A ∧ e.val.2 ∈ A)

/-- Orient a crossing grid edge out of `A`. -/
def orientPair {L : ℕ} (A : Finset (Vertex L)) (e : Edge L) : (ℤ × ℤ) × (ℤ × ℤ) :=
  if e.val.1 ∈ A then (iotaL e.val.1, iotaL e.val.2) else (iotaL e.val.2, iotaL e.val.1)

/-- Forward adjacency is antisymmetric on the grid. -/
theorem ForwardAdjacent.asymm {L : ℕ} {v w : Vertex L} (h1 : ForwardAdjacent v w)
    (h2 : ForwardAdjacent w v) : False := by
  rcases h1 with ⟨a1, a2⟩ | ⟨a1, a2⟩
  · rcases h2 with ⟨b1, b2⟩ | ⟨b1, b2⟩
    · have _ := congrArg Fin.val a2; have _ := congrArg Fin.val b2; omega
    · have _ := congrArg Fin.val a2; have _ := congrArg Fin.val b1; omega
  · rcases h2 with ⟨b1, b2⟩ | ⟨b1, b2⟩
    · have _ := congrArg Fin.val a1; have _ := congrArg Fin.val b2; omega
    · have _ := congrArg Fin.val a1; have _ := congrArg Fin.val b1; omega

theorem orientPair_of_mem {L : ℕ} {A : Finset (Vertex L)} {e : Edge L} (h : e.val.1 ∈ A) :
    orientPair A e = (iotaL e.val.1, iotaL e.val.2) := by
  simp only [orientPair, h, ite_true]

theorem orientPair_of_not_mem {L : ℕ} {A : Finset (Vertex L)} {e : Edge L}
    (h : e.val.1 ∉ A) :
    orientPair A e = (iotaL e.val.2, iotaL e.val.1) := by
  simp only [orientPair, h, ite_false]

theorem orientPair_mem {L : ℕ} (A : Finset (Vertex L)) {e : Edge L} (he : crosses A e) :
    orientPair A e ∈ edgeBoundary (gridDom L) (iotaLimg A) := by
  rcases he with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · rw [orientPair_of_mem h1]
    simp only [edgeBoundary, SimpleGraph.interedges, Rel.interedges, Finset.mem_filter,
    Finset.mem_product]
    exact ⟨⟨iotaL_mem_image h1, Finset.mem_sdiff.2
      ⟨iotaL_mem_gridDom _, iotaL_not_mem_image h2⟩⟩, adj_of_forwardAdjacent e.property⟩
  · rw [orientPair_of_not_mem h1]
    simp only [edgeBoundary, SimpleGraph.interedges, Rel.interedges, Finset.mem_filter,
    Finset.mem_product]
    exact ⟨⟨iotaL_mem_image h2, Finset.mem_sdiff.2
      ⟨iotaL_mem_gridDom _, iotaL_not_mem_image h1⟩⟩,
      (adj_of_forwardAdjacent e.property).symm⟩

theorem orientPair_injective {L : ℕ} (A : Finset (Vertex L)) :
    Function.Injective (fun (e : {e : Edge L // crosses A e}) => orientPair A e.val) := by
  rintro ⟨e, he⟩ ⟨f, hf⟩ h
  change orientPair A e = orientPair A f at h
  -- Eq has no field projections in v4.36: component access is congrArg, and the
  -- projection of an explicit iotaL-pair reduces definitionally inside iotaL_injective.
  by_cases h1 : e.val.1 ∈ A
  · by_cases h1' : f.val.1 ∈ A
    · rw [orientPair_of_mem h1, orientPair_of_mem h1'] at h
      -- `Edge L` is itself a subtype: peel the outer {e // crosses A e} layer, then the
      -- inner Edge layer, down to the Vertex-pair Prod.ext.
      apply Subtype.ext
      apply Subtype.ext
      exact Prod.ext (iotaL_injective (congrArg Prod.fst h))
        (iotaL_injective (congrArg Prod.snd h))
    · rw [orientPair_of_mem h1, orientPair_of_not_mem h1'] at h
      exfalso
      have e1 : e.val.1 = f.val.2 := iotaL_injective (congrArg Prod.fst h)
      have e2 : e.val.2 = f.val.1 := iotaL_injective (congrArg Prod.snd h)
      exact ForwardAdjacent.asymm (v := f.val.2) (w := f.val.1)
        (by rw [← e2, ← e1]; exact e.property) f.property
  · by_cases h1' : f.val.1 ∈ A
    · rw [orientPair_of_not_mem h1, orientPair_of_mem h1'] at h
      exfalso
      have e1 : e.val.2 = f.val.1 := iotaL_injective (congrArg Prod.fst h)
      have e2 : e.val.1 = f.val.2 := iotaL_injective (congrArg Prod.snd h)
      exact ForwardAdjacent.asymm (v := f.val.1) (w := f.val.2) f.property
        (by rw [← e2, ← e1]; exact e.property)
    · rw [orientPair_of_not_mem h1, orientPair_of_not_mem h1'] at h
      apply Subtype.ext
      apply Subtype.ext
      exact Prod.ext (iotaL_injective (congrArg Prod.snd h))
        (iotaL_injective (congrArg Prod.fst h))

/-- **L2 (boundary comparability, constant 1 — stronger than the ≤ 4 safety form).**
Every crossing grid edge orients to a distinct square-lattice edge of the boundary.
(The donor's `boundaryCard`-to-subtype-card comparison lives INSIDE the classical
scope: the statement itself cannot mention the subtype univ, whose `Fintype`
instance is only synthesized with the classical decidability instance.) -/
theorem boundaryCard_le_edgeBoundary {L : ℕ} (A : Finset (Vertex L)) :
    boundaryCard A ≤ (edgeBoundary (gridDom L) (iotaLimg A)).card := by
  classical
  have hb : boundaryCard A = (Finset.univ : Finset {e : Edge L // crosses A e}).card := by
    rw [Finset.card_univ]
    -- T1's `boundaryCard` body and this subtype differ only by the `crosses` wrapper;
    -- the two `Fintype` instances come from different elaboration paths, so bridge the
    -- cards propositionally (card_congr' over the definitional type equality).
    exact Fintype.card_congr' (α := {e : Edge L //
        (e.val.1 ∈ A ∧ e.val.2 ∉ A) ∨ (e.val.1 ∉ A ∧ e.val.2 ∈ A)}) rfl
  calc boundaryCard A = ((Finset.univ : Finset {e : Edge L // crosses A e}).image
          fun e => orientPair A e.val).card := by
        rw [Finset.card_image_of_injOn (fun a _ b _ h => orientPair_injective A h), hb]
    _ ≤ (edgeBoundary (gridDom L) (iotaLimg A)).card := by
        refine Finset.card_le_card ?_
        intro p hp
        obtain ⟨a, -, rfl⟩ := Finset.mem_image.1 hp
        exact orientPair_mem A a.property

/-! ## §3 The configuration transport -/

/-- The vertex subtype over `S` embeds into the lattice sites over the image. -/
noncomputable def vertexImageEquiv {L : ℕ} (S : Finset (Vertex L)) :
    {v : Vertex L // v ∈ S} ≃ {x : ℤ × ℤ // x ∈ iotaLimg S} :=
  Equiv.ofBijective (fun v => ⟨iotaL (v : Vertex L), Finset.mem_image_of_mem _ v.2⟩)
    ⟨fun a b h => Subtype.ext (iotaL_injective (congrArg Subtype.val h)), fun y => by
      obtain ⟨v, hv, he⟩ := Finset.mem_image.1 y.2
      exact ⟨⟨v, hv⟩, Subtype.ext he⟩⟩

theorem vertexImageEquiv_symm_apply {L : ℕ} (S : Finset (Vertex L))
    (v : {v : Vertex L // v ∈ S}) :
    (vertexImageEquiv S).symm ⟨iotaL (v : Vertex L), Finset.mem_image_of_mem _ v.2⟩ = v :=
  (vertexImageEquiv S).symm_apply_apply v

/-- Region index types transport along `iotaL`: `Reg (Qudits q) (iotaLimg S) ≃
RegionConfiguration q S`. -/
noncomputable def regEquivImage {L q : ℕ} (S : Finset (Vertex L)) :
    Reg (Qudits q) (iotaLimg S) ≃ RegionConfiguration q S :=
  (Equiv.piCongrLeft' (fun _ => Fin q) (vertexImageEquiv S)).symm

theorem regEquivImage_symm_apply {L q : ℕ} (S : Finset (Vertex L))
    (x : RegionConfiguration q S) (v : {v : Vertex L // v ∈ S}) :
    (regEquivImage S).symm x ⟨iotaL (v : Vertex L), Finset.mem_image_of_mem _ v.2⟩ = x v := by
  show x ((vertexImageEquiv S).symm ⟨iotaL (v : Vertex L), _⟩) = x v
  rw [vertexImageEquiv_symm_apply]

/-- The complement side: `Aᶜ`-configurations are `(gridDom \ iotaLimg A)`-configurations. -/
noncomputable def complImageEquiv {L : ℕ} (A : Finset (Vertex L)) :
    {v : Vertex L // v ∈ Aᶜ} ≃ {x : ℤ × ℤ // x ∈ gridDom L \ iotaLimg A} :=
  Equiv.ofBijective (fun v => ⟨iotaL (v : Vertex L), Finset.mem_sdiff.2
      ⟨iotaL_mem_gridDom _, iotaL_not_mem_image (Finset.mem_compl.1 v.2)⟩⟩)
    ⟨fun a b h => Subtype.ext (iotaL_injective (congrArg Subtype.val h)), fun y => by
      -- the preimage comes from `y ∈ gridDom L` (a grid vertex), NOT from the non-membership
      -- side of the sdiff (that side carries no existential).
      obtain ⟨v, -, he⟩ := Finset.mem_image.1 (Finset.mem_sdiff.1 y.2).1
      exact ⟨⟨v, Finset.mem_compl.2 fun hc =>
        (Finset.mem_sdiff.1 y.2).2 (he ▸ iotaL_mem_image hc)⟩, Subtype.ext he⟩⟩

/-- Oriented so that `.symm`-application reduces definitionally: `piCongrLeft'`'s own
  `toFun` is the clean precomposition, and its `.symm`'s toFun (the `invFun`) is an
  `Eq.ndrec` cast that never reduces for an `ofBijective` base. Here
  `(regComplEquiv A).symm` is `piCongrLeft' (complImageEquiv A).symm` itself. -/
noncomputable def regComplEquiv {L q : ℕ} (A : Finset (Vertex L)) :
    RegionConfiguration q Aᶜ ≃ Reg (Qudits q) (gridDom L \ iotaLimg A) :=
  (Equiv.piCongrLeft' (fun _ => Fin q) (complImageEquiv A).symm).symm

/-- A lattice site of the grid domain, as a vertex (classical choice of preimage); the
full-grid index transport `configEquiv` below gives `Reg (Qudits q) (gridDom L) ≃
Configuration L q`. -/
noncomputable def gridVertex {L : ℕ} (i : {x // x ∈ gridDom L}) : Vertex L :=
  (Finset.mem_image.1 i.2).choose

theorem iotaL_gridVertex {L : ℕ} (i : {x // x ∈ gridDom L}) :
    iotaL (gridVertex i) = (i : ℤ × ℤ) :=
  (Finset.mem_image.1 i.2).choose_spec.2

/-- On sites of the form `iotaL v`, the chosen preimage is (propositionally) `v` itself. -/
theorem gridVertex_of {L : ℕ} (v : Vertex L) :
    gridVertex (L := L) ⟨iotaL v, iotaL_mem_gridDom v⟩ = v :=
  iotaL_injective (iotaL_gridVertex ⟨iotaL v, iotaL_mem_gridDom v⟩)

/-- Built via `Equiv.ofBijective`: the inverse on a site is the classically chosen preimage,
  which is NOT definitionally the vertex (Exists.choose is choice-based), so the inverse
  laws must go through the propositional `iotaL_gridVertex` / `gridVertex_of`. -/
noncomputable def configEquiv (L q : ℕ) : Reg (Qudits q) (gridDom L) ≃ Configuration L q :=
  Equiv.ofBijective (fun c v => c ⟨iotaL v, iotaL_mem_gridDom v⟩)
    ⟨fun c d h => by
       -- pointwise agreement transports to the sites via the gridVertex roundtrip
       funext i
       have hv : i = ⟨iotaL (gridVertex i), iotaL_mem_gridDom (gridVertex i)⟩ :=
         (Subtype.ext (iotaL_gridVertex i)).symm
       rw [hv]
       exact congrFun h (gridVertex i),
     fun f => ⟨fun i => f (gridVertex i), funext fun v => by
       show f (gridVertex ⟨iotaL v, iotaL_mem_gridDom v⟩) = f v
       rw [gridVertex_of v]⟩⟩

theorem regComplEquiv_symm_apply' {L q : ℕ} (A : Finset (Vertex L))
    (z : Reg (Qudits q) (gridDom L \ iotaLimg A)) (v : Vertex L) (hv : v ∉ A) :
    (regComplEquiv A).symm z ⟨v, Finset.mem_compl.2 hv⟩
      = z ⟨iotaL (v : Vertex L), Finset.mem_sdiff.2
          ⟨iotaL_mem_gridDom _, iotaL_not_mem_image hv⟩⟩ := by
  -- `.symm` here IS the piCongrLeft' whose toFun precomposes with `complImageEquiv A`,
  -- and `(complImageEquiv A) ⟨v, _⟩` is definitionally `⟨iotaL v, _⟩` (ofBijective's
  -- toFun); the two membership proofs differ only inside the subtype's Prop field.
  show z ((complImageEquiv A) ⟨v, Finset.mem_compl.2 hv⟩) = _
  rfl

theorem configEquiv_apply {L q : ℕ} (c : Reg (Qudits q) (gridDom L)) (v : Vertex L) :
    configEquiv L q c v = c ⟨iotaL v, iotaL_mem_gridDom v⟩ := rfl

/-- **The glue/join bridge** (L1's engine): gluing on the lattice side is joining on the
grid side, along the region transports. -/
theorem configEquiv_glue {L q : ℕ} (A : Finset (Vertex L))
    (x' : RegionConfiguration q A) (z : Reg (Qudits q) (gridDom L \ iotaLimg A)) :
    configEquiv L q (glue ((regEquivImage A).symm x') z)
      = joinConfigurations A x' ((regComplEquiv A).symm z) := by
  funext v
  simp only [configEquiv_apply, glue, joinConfigurations]
  by_cases hv : v ∈ A
  · rw [dite_eq_left (iotaL_mem_image hv), dite_eq_left hv]
    exact regEquivImage_symm_apply A x' ⟨v, hv⟩
  · rw [dite_eq_right (iotaL_not_mem_image hv), dite_eq_right hv,
      regComplEquiv_symm_apply' A z v hv]

/-! ## §4 L1 — the ptrace-Gram identity and the entropy match -/

/-- The consumer's state, read as a vector over the lattice domain. -/
noncomputable def toGrid (L q : ℕ) (Ω : State L q) : Reg (Qudits q) (gridDom L) → ℂ :=
  fun c => Ω (configEquiv L q c)

/-- Entry form of the pure state's density matrix (rfl: `pureState` is `MState.mk'` over
`posSemidef_vecMulVec_self_star`, whose matrix is `vecMulVec Ω (star Ω)`). -/
theorem pureState_M {ι : Type*} [Fintype ι] {𝕜 : Type*} [RCLike 𝕜]
    (Ω : ι → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) :
    (pureState Ω hΩ).M = Matrix.vecMulVec Ω (star Ω) := rfl

/-- **L1 (ptrace-Gram identity).** The producer's partial trace of the pure state,
reindexed to the consumer's region, IS the consumer's reduced density matrix. -/
theorem ptrace_pureState_eq_reducedDensity {L q : ℕ} (Ω : State L q)
    (hΩ : star (toGrid L q Ω) ⬝ᵥ (toGrid L q Ω) = 1) (A : Finset (Vertex L)) :
    (ptrace (image_subset_gridDom (L := L) (A := A))
        ((pureState (toGrid L q Ω) hΩ).M)).submatrix
        ((regEquivImage A).symm) ((regEquivImage A).symm)
      = reducedDensity Ω A := by
  ext x' y'
  simp only [Matrix.submatrix_apply, ptrace, Matrix.of_apply, pureState_M,
    Matrix.vecMulVec_apply, toGrid, reducedDensity, coefficientMatrix, Matrix.mul_apply,
    Matrix.conjTranspose_apply, Pi.star_apply]
  refine Fintype.sum_equiv ((regComplEquiv A).symm) _ _ fun z => ?_
  -- after both transports the two entries are syntactically the `joinConfigurations`
  -- sums; the rw closes them by its automatic rfl
  rw [configEquiv_glue A x' z, configEquiv_glue A y' z]

/-- The eigenvalue family does not see the IsHermitian witness (proof irrelevance),
across a matrix equality. -/
theorem hermEigen_eq_of_matrix_eq {ι : Type*} [Fintype ι] [DecidableEq ι] {𝕜 : Type*}
    [RCLike 𝕜] {M N : Matrix ι ι 𝕜} (hMN : M = N) (hM : M.IsHermitian)
    (hN : N.IsHermitian) : hM.eigenvalues = hN.eigenvalues := by
  -- subst (not `rw … at hM`): rewriting the hypothesis in place clears/re-adds it and
  -- leaves the goal's occurrence referring to the old, inaccessible variable.
  subst hMN
  exact congrArg (fun h => h.eigenvalues) (proof_irrel hM hN)

/-- **The entropy match** (interface step vii): the producer's region entropy of the
transported state equals the consumer's von Neumann entropy. -/
theorem regionEntropy_eq_vonNeumannEntropy {L q : ℕ} (Ω : State L q)
    (hΩ : star (toGrid L q Ω) ⬝ᵥ (toGrid L q Ω) = 1) (A : Finset (Vertex L)) :
    (pureState (toGrid L q Ω) hΩ).regionEntropy
        (image_subset_gridDom (L := L) (A := A))
      = vonNeumannEntropy Ω A := by
  -- no `have h := image_subset_gridDom …` here: an opaque fvar would never be matched
  -- by `rw [h1]` against the goal's literal `image_subset_gridDom` term.
  have hmat := ptrace_pureState_eq_reducedDensity Ω hΩ A
  have hP : (ptrace (image_subset_gridDom (L := L) (A := A))
      ((pureState (toGrid L q Ω) hΩ).M)).IsHermitian :=
    ((pureState (toGrid L q Ω) hΩ).restrict (image_subset_gridDom (L := L) (A := A))).psd.isHermitian
  have h1 : (pureState (toGrid L q Ω) hΩ).regionEntropy (image_subset_gridDom (L := L) (A := A))
      = H hP.eigenvalues :=
    SubState.entropy_eq_H _
  have h2 : H (hP.submatrix ((regEquivImage A).symm)).eigenvalues = H hP.eigenvalues :=
    H_eq_of_multiset_eq (eigenvalues_multiset_submatrix_equiv hP _)
  have hw : (hP.submatrix ((regEquivImage A).symm)).eigenvalues
      = (reducedDensity_isHermitian Ω A).eigenvalues :=
    hermEigen_eq_of_matrix_eq hmat (hP.submatrix ((regEquivImage A).symm))
      (reducedDensity_isHermitian Ω A)
  have h3 : vonNeumannEntropy Ω A
      = H (hP.submatrix ((regEquivImage A).symm)).eigenvalues := by
    simp only [vonNeumannEntropy, H]
    rw [hw]
  rw [h1, h3, ← h2]

end CrossMath.Pilot72.M1

#print axioms CrossMath.Pilot72.M1.boundaryCard_le_edgeBoundary
#print axioms CrossMath.Pilot72.M1.ptrace_pureState_eq_reducedDensity
#print axioms CrossMath.Pilot72.M1.regionEntropy_eq_vonNeumannEntropy
