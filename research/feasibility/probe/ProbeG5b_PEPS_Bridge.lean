/-
Statement elaboration probe — not a proof artifact.
Probe G5b (axiommath donor round, 2026-11-13; bridge research/bridges/area-law.md §6 item 3,
zone AL-EZ3 — dossier-72 milestone-1 shapes): the family-265 interface lemma statements —
(i) ptrace-Gram identity (partial-trace RDM = coefficient-matrix Gram form),
(ii) boundary match (AreaLaw2D edge-boundary card = PEPS boundaryCard on the L×L grid),
(iii) the interface theorem (AreaLaw ⇒ openai-math's UniformAreaLaw), and
(iv) the gap dictionary (FullSystemGap quadratic-form ↔ HasGlobalGap Loewner form).
Method: mathlib-only transcription on our pin (mathlib ff2494ea, v4.36.0-rc2). The PEPS side
(openai-math lean/OAI/MathematicalPhysics/PEPSFilters/Basic.lean:7-147, donor @ v4.34.1) is
transcribed verbatim; the AreaLaw2D side uses the ProbeG4 transcription shapes (donor @
dev/claude c0f6d96). All `sorry`s are probe scaffolding — statement elaboration verdicts
only, never proof claims.
-/
import Mathlib

open scoped ComplexOrder MatrixOrder Matrix.Norms.L2Operator Pointwise
open Matrix SimpleGraph

namespace ProbeG5b

noncomputable section

/-! ## PEPS prelude — PEPSFilters/Basic.lean:7-147, verbatim transcription -/

abbrev Vertex (L : ℕ) := Fin L × Fin L

def ForwardAdjacent {L : ℕ} (v w : Vertex L) : Prop :=
  (v.1.val + 1 = w.1.val ∧ v.2 = w.2) ∨
  (v.1 = w.1 ∧ v.2.val + 1 = w.2.val)

abbrev Edge (L : ℕ) := {e : Vertex L × Vertex L // ForwardAdjacent e.1 e.2}

instance edgeFintype (L : ℕ) : Fintype (Edge L) := Fintype.ofFinite _

def Incident {L : ℕ} (v : Vertex L) (e : Edge L) : Prop :=
  v = e.val.1 ∨ v = e.val.2

abbrev IncidentEdge {L : ℕ} (v : Vertex L) := {e : Edge L // Incident v e}

instance incidentFintype {L : ℕ} (v : Vertex L) : Fintype (IncidentEdge v) :=
  Fintype.ofFinite _

abbrev Configuration (L q : ℕ) := Vertex L → Fin q

abbrev State (L q : ℕ) := EuclideanSpace ℂ (Configuration L q)

abbrev Operator (L q : ℕ) := Matrix (Configuration L q) (Configuration L q) ℂ

abbrev RegionConfiguration {L : ℕ} (q : ℕ) (S : Finset (Vertex L)) :=
  {v : Vertex L // v ∈ S} → Fin q

def liftLocal {L q : ℕ} (S : Finset (Vertex L))
    (a : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ) :
    Operator L q := fun x y =>
  if ∀ v, v ∉ S → x v = y v then
    a (fun v => x v.val) (fun v => y v.val)
  else 0

def SupportedOn {L q : ℕ} (a : Operator L q) (S : Finset (Vertex L)) : Prop :=
  ∃ aS : Matrix (RegionConfiguration q S) (RegionConfiguration q S) ℂ,
    a = liftLocal S aS

def EdgeSites {L : ℕ} (e : Edge L) : Finset (Vertex L) := {e.val.1, e.val.2}

def Hamiltonian {L q : ℕ} (hv : Vertex L → Operator L q)
    (he : Edge L → Operator L q) : Operator L q :=
  (∑ v, hv v) + ∑ e, he e

def asMap {L q : ℕ} (a : Operator L q) : State L q →L[ℂ] State L q :=
  Matrix.toEuclideanCLM (n := Configuration L q) (𝕜 := ℂ) a

def opNorm {L q : ℕ} (a : Operator L q) : ℝ := ‖asMap a‖

def IsGridHamiltonian {L q : ℕ} (J : ℝ)
    (hv : Vertex L → Operator L q) (he : Edge L → Operator L q) : Prop :=
  (∀ v, SupportedOn (hv v) {v} ∧ opNorm (hv v) ≤ J) ∧
  (∀ e, SupportedOn (he e) (EdgeSites e) ∧ opNorm (he e) ≤ J) ∧
  (Hamiltonian hv he).IsHermitian

def phase (θ : ℝ) : ℂ := Complex.exp ((θ : ℂ) * Complex.I)

def UniqueGround {L q : ℕ} (H : Operator L q) (Ω : State L q) (E₀ : ℝ) : Prop :=
  ‖Ω‖ = 1 ∧
  asMap H Ω = (E₀ : ℂ) • Ω ∧
  (∀ ψ : State L q,
    E₀ * ‖ψ‖ ^ 2 ≤ (inner ℂ ψ (asMap H ψ)).re) ∧
  (∀ ψ : State L q, ‖ψ‖ = 1 →
    asMap H ψ = (E₀ : ℂ) • ψ →
    ∃ θ : ℝ, ψ = phase θ • Ω)

def FullSystemGap {L q : ℕ} (H : Operator L q) (Ω : State L q)
    (E₀ Δ : ℝ) : Prop :=
  ∀ ψ : State L q,
    Δ * (‖ψ‖ ^ 2 - ‖inner ℂ Ω ψ‖ ^ 2) ≤
      (inner ℂ ψ (asMap H ψ)).re - E₀ * ‖ψ‖ ^ 2

def joinConfigurations {L q : ℕ} (A : Finset (Vertex L))
    (x : RegionConfiguration q A) (z : RegionConfiguration q Aᶜ) :
    Configuration L q := by
  classical
  exact fun v => if h : v ∈ A then x ⟨v, h⟩ else z ⟨v, Finset.mem_compl.mpr h⟩

def coefficientMatrix {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    Matrix (RegionConfiguration q A) (RegionConfiguration q Aᶜ) ℂ :=
  fun x z => Ω (joinConfigurations A x z)

def reducedDensity {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    Matrix (RegionConfiguration q A) (RegionConfiguration q A) ℂ :=
  coefficientMatrix Ω A * (coefficientMatrix Ω A).conjTranspose

/-- Donor proves this by `Matrix.isHermitian_mul_conjTranspose_self` (Basic.lean:121-122);
stated here with a probe `sorry` to keep the statement layer self-contained (run-2 lesson:
inlining the mathlib lemma at `vonNeumannEntropy` failed to unify on this pin). -/
theorem reducedDensity_isHermitian {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    (reducedDensity Ω A).IsHermitian := by
  sorry

def vonNeumannEntropy {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) : ℝ :=
  ∑ i, Real.negMulLog ((reducedDensity_isHermitian Ω A).eigenvalues i)

def boundaryCard {L : ℕ} (A : Finset (Vertex L)) : ℕ := by
  classical
  exact Fintype.card {e : Edge L //
    (e.val.1 ∈ A ∧ e.val.2 ∉ A) ∨ (e.val.1 ∉ A ∧ e.val.2 ∈ A)}

/-- PEPSFilters/Basic.lean:135-147 — the area law as the donor ASSUMES it. -/
def UniformAreaLaw : Prop :=
  ∀ (q : ℕ), 2 ≤ q → ∀ (J Δ : ℝ), 0 < J → 0 < Δ →
    ∃ C_A : ℝ, 0 < C_A ∧
      ∀ (L : ℕ), 2 ≤ L →
      ∀ (hv : Vertex L → Operator L q) (he : Edge L → Operator L q)
        (Ω : State L q) (E₀ : ℝ),
        IsGridHamiltonian J hv he →
        UniqueGround (Hamiltonian hv he) Ω E₀ →
        FullSystemGap (Hamiltonian hv he) Ω E₀ Δ →
        ∀ A : Finset (Vertex L),
          vonNeumannEntropy Ω A ≤ C_A * (boundaryCard A : ℝ)

/-! ## AreaLaw2D region core — ProbeG4 transcription shapes (PartialTrace.lean:25-27,
Statements.lean:185-195), mathlib-only. -/

section AreaLawCore

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*}

abbrev Reg (loc : σ → Type*) (S : Finset σ) := ∀ i : S, loc i

variable {S T U : Finset σ}

def glue (x : Reg loc S) (z : Reg loc (T \ S)) : Reg loc T :=
  fun j => if hj : (j : σ) ∈ S then x ⟨j, hj⟩ else z ⟨j, Finset.mem_sdiff.2 ⟨j.2, hj⟩⟩

variable [∀ i, Fintype (loc i)] {𝕜 : Type*} [RCLike 𝕜] {ι : Type*} [Fintype ι]

/-- `PartialTrace.lean:25` — the partial trace from `T` down to `S ⊆ T`. -/
noncomputable def ptrace (_h : S ⊆ T) (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    Matrix (Reg loc S) (Reg loc S) 𝕜 :=
  Matrix.of fun x y => ∑ z : Reg loc (T \ S), M (glue x z) (glue y z)

/-- `Statements.lean:185-187` — the Loewner-form gap, stated at any indexed matrix type. -/
def HasGlobalGapMat {𝕜 : Type*} [RCLike 𝕜] {ι : Type*} [Fintype ι] [DecidableEq ι]
    (H : Matrix ι ι 𝕜) (Ω : ι → 𝕜) (E₀ Δ : ℝ) : Prop :=
  (Δ : 𝕜) • (1 - Matrix.vecMulVec Ω (star Ω)) ≤ H - (E₀ : 𝕜) • 1

end AreaLawCore

/-! ## (iv) the gap dictionary — stated first; (iii) consumes it. -/

/-- **AL-EZ3 gap dictionary** (bridge §1 row 2): openai-math's quadratic-form gap and
AreaLaw2D's Loewner gap state the same inequality; the inner-product ↔ `star ⬝ᵥ`
dictionary is carried as a hypothesis binder. -/
theorem fullSystemGap_iff_hasGlobalGap {L q : ℕ} (hv : Vertex L → Operator L q)
    (he : Edge L → Operator L q) (Ω : State L q) (E₀ Δ : ℝ)
    (hnorm : ‖Ω‖ = 1)
    (hdot : ∀ ψ : State L q,
      ‖ψ‖ ^ 2 = ((star (ψ : Configuration L q → ℂ)
        ⬝ᵥ (ψ : Configuration L q → ℂ)) : ℂ).re ∧
      ‖inner ℂ Ω ψ‖ ^ 2 = ((star (Ω : Configuration L q → ℂ)
        ⬝ᵥ (ψ : Configuration L q → ℂ)) : ℂ) ^ 2 ∧
      (inner ℂ ψ (asMap (Hamiltonian hv he) ψ)).re = ((star (ψ : Configuration L q → ℂ)
        ⬝ᵥ (Hamiltonian hv he *ᵥ (ψ : Configuration L q → ℂ))) : ℂ).re) :
    FullSystemGap (Hamiltonian hv he) Ω E₀ Δ ↔
      HasGlobalGapMat (Hamiltonian hv he) (fun c => Ω c) E₀ Δ := by
  sorry

/-! ## (i) AL-EZ3(i) — the ptrace-Gram identity. -/

/-- The PEPS coefficient matrix, transcribed into the `Reg` encoding: `joinConfigurations`
is `glue` under the subtype coercion (PEPSFilters/Basic.lean:104-108); at `T = univ`,
`Aᶜ = univ \ A`. -/
def coefficientMatrixReg {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    [∀ i, Fintype (loc i)] {𝕜 : Type*} [RCLike 𝕜] {T : Finset σ}
    (Ω : Reg loc T → 𝕜) (A : Finset σ) :
    Matrix (Reg loc A) (Reg loc (T \ A)) 𝕜 :=
  fun x z => Ω (glue x z)

/-- **AL-EZ3(i), ptrace-Gram identity** (bridge §4 AL-EZ3(i)): the partial trace of the
pure-state density matrix equals the Gram form of the coefficient matrix — both encodings
of `ρ_A`. -/
theorem ptrace_gram_identity {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    [∀ i, Fintype (loc i)] {𝕜 : Type*} [RCLike 𝕜] {T : Finset σ}
    (Ω : Reg loc T → 𝕜) (A : Finset σ) (hA : A ⊆ T) :
    ptrace hA (Matrix.vecMulVec Ω (star Ω))
      = coefficientMatrixReg Ω A * (coefficientMatrixReg Ω A).conjTranspose := by
  sorry

/-- The same identity at the PEPS encoding: the partial trace of the pure state's density
matrix (over the whole grid, read through `Reg`) equals openai-math's `reducedDensity`.
The state reindexing `toReg` and normalization are hypothesis binders. -/
def toReg {L q : ℕ} (Ω : State L q) :
    Reg (fun _ : Vertex L => Fin q) (Finset.univ : Finset (Vertex L)) → ℂ :=
  fun c => Ω (fun v => c ⟨v, Finset.mem_univ v⟩)

theorem ptrace_gram_identity_peps {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L))
    (hΩ : star (toReg Ω) ⬝ᵥ (toReg Ω) = 1)
    (hequiv : ∀ (x : RegionConfiguration q A) (z : RegionConfiguration q Aᶜ) (v : Vertex L),
      joinConfigurations A x z v
        = glue (loc := fun _ : Vertex L => Fin q) (S := A)
            (T := (Finset.univ : Finset (Vertex L))) x z ⟨v, Finset.mem_univ v⟩) :
    ptrace (Finset.subset_univ A) (Matrix.vecMulVec (toReg Ω) (star (toReg Ω)))
      = reducedDensity Ω A := by
  sorry

/-! ## (ii) AL-EZ3(ii) — the boundary match. -/

/-- Adjacency decidability for the square lattice — the donor's instance
(Challenge/Basic.lean:183-186); required by `interedges` (run-2 lesson). -/
instance instDecidableRelAdjSquareLattice : DecidableRel (hasse ℤ □ hasse ℤ).Adj :=
  fun x y => decidable_of_iff ((x.1 + 1 = y.1 ∨ y.1 + 1 = x.1) ∧ x.2 = y.2 ∨
      (x.2 + 1 = y.2 ∨ y.2 + 1 = x.2) ∧ x.1 = y.1)
    (by simp only [boxProd_adj, hasse_adj, Order.covBy_iff_add_one_eq])

noncomputable def edgeBoundaryBox (Λ A : Finset (ℤ × ℤ)) : Finset ((ℤ × ℤ) × (ℤ × ℤ)) :=
  (hasse ℤ □ hasse ℤ).interedges A (Λ \ A)

/-- The standard embedding `Fin L × Fin L ↪ ℤ × ℤ`. -/
def boxEmb {L : ℕ} (v : Vertex L) : ℤ × ℤ := (v.1.val, v.2.val)

/-- The `L × L` box as a `ℤ × ℤ` domain. -/
def gridBox (L : ℕ) : Finset (ℤ × ℤ) :=
  Finset.image boxEmb (Finset.univ : Finset (Vertex L))

/-- **AL-EZ3(ii), boundary match** (bridge §4 AL-EZ3(ii)): on the `L × L` grid,
AreaLaw2D's edge-boundary count equals PEPS's `boundaryCard`. -/
theorem boundary_match {L : ℕ} (A : Finset (Vertex L)) :
    (edgeBoundaryBox (gridBox L) (Finset.image boxEmb A)).card = boundaryCard A := by
  sorry

/-! ## (iii) AL-EZ3(iii) — the interface theorem (hypothesis-binder form). -/

/-- AreaLaw2D's Theorem 1.1 as a hypothesis type at the PEPS grid, entropy abstracted
(one constant `C` bounds the region entropy of every gapped ground state by `C` times the
edge-boundary card) — the `OpenAI.AreaLaw` body shape (Statements.lean:202-209) with the
Hamiltonian/admissibility layer abstracted to the single gap carrier. -/
def HypAreaLawOnGrids : Prop :=
  ∀ (q : ℕ), 2 ≤ q → ∀ (J Δ : ℝ), 0 < J → 0 < Δ →
    ∃ C : ℝ, ∀ (L : ℕ), 2 ≤ L →
      ∀ (hv : Vertex L → Operator L q) (he : Edge L → Operator L q)
        (Ω : State L q) (E₀ : ℝ),
        IsGridHamiltonian J hv he →
        UniqueGround (Hamiltonian hv he) Ω E₀ →
        FullSystemGap (Hamiltonian hv he) Ω E₀ Δ →
        ∀ A : Finset (Vertex L),
          vonNeumannEntropy Ω A ≤ C * (edgeBoundaryBox (gridBox L)
            (Finset.image boxEmb A)).card

/-- **AL-EZ3(iii), interface theorem** (bridge §4 AL-EZ3(iii); dossier-72 milestone-1):
AreaLaw2D's area law (as hypothesis, at the PEPS grid) + the boundary match (as
hypothesis) discharges openai-math's `UniformAreaLaw` — the assumption every PEPS-side
result rests on. -/
theorem uniformAreaLaw_of_areaLaw (hAreaLaw : HypAreaLawOnGrids)
    (hbound : ∀ {L : ℕ} (A : Finset (Vertex L)),
      (edgeBoundaryBox (gridBox L) (Finset.image boxEmb A)).card = boundaryCard A) :
    UniformAreaLaw := by
  sorry

end

end ProbeG5b
