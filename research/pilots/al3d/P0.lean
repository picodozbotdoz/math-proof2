/-
PROBE FILE — STATEMENT ELABORATION ONLY; NOT A PROOF ARTIFACT.
AL-P0, iteration-4 AL-3D B.2 staged (card 3; spec `qa/iter4-review/r5-iteration4-backlog.md`
§11 + `pilots/al-3d-prework.md` §2). Mathlib-only port of the frozen 3D statement layer of
AreaLaw2D (`OpenAI/Statements3D.lean` @ dev/claude, sibling read-only) on our pin
(mathlib ff2494ea, v4.36.0-rc2), per the G4 statement-port template
(`feasibility/probe/ProbeG4_AreaLaw.lean` — the Arealaw entropy core is carried VERBATIM
from that green probe; zero donor imports, zero Physlib, per the G5a boundary).

FENCES (Targets.md §A :23, cited at every claim site): the north star `AreaLaw3D` is
"NOT A TARGET" — no claim here progresses it; obstructions C.1 scanner exponents
(Targets.md :103), C.2 first subvolume exponent (:111), C.3 amplification radius (:117),
C.4 point contacts (:123). B.1 (cylinders) is DONOR-OWNED (`OpenAI.cylinderAreaLaw3D`,
`Cylinder3D.lean:574`; `cylinderAreaLawOfPlanar3D` :526) — cited, never re-proved.
Frozen defs (Targets.md §D rule 1): `cubicLattice3D`…`IsAdmissible3D`, `IsSlabDomain3D`,
`SlabAreaLaw3D` transcribed VERBATIM from `OpenAI/Statements3D.lean` (:64–:182); nothing
is proved about them here. New defs (rule 2, new names beside): `planarLattice`,
`projLattice`, `domainEDistG`, `domainEDiamG`, `supportsG`, `edgeBoundaryG`,
`IsAdmissibleVar`, `hamiltonianVar`, `PlanarAreaLawVar`, `IsColumnClosed3D`,
`SlabAreaLawColumnCuts3D` — recorded as weaker/variant, never as progress on the frozen
`SlabAreaLaw3D` (rule 3).

STUB-COMPLETION NOTE (find-#6 amendment, H-approved 2026-11-20 — PROOF-ONLY, the
declaration list byte-identical): the three probe-convention stubs this file carried
since the G4 port are now PROVED, mathlib-only, zero statement drift:
`posSemidef_vecMulVec_self_star` := mathlib's `Matrix.posSemidef_vecMulVec_self_star`
(the Physlib statement-layer lemma turns out to be IN mathlib at this pin);
`posSemidef_ptrace` := the compression route (the A2 M3 support-layer V port — ptrace
as a sum of psd conjugate slice-compressions); `trace_ptrace` := the glue-reindex route
(`Reg S × Reg (T \ S) ≃ Reg T` bijection). What the stubs WERE: G4 probe scaffolding
verbatim (the dropped `QuantumInfo.ForMathlib.*` imports' statement-layer content),
carried as `sorry` under the probe convention while A2's support layers re-proved the
CALCULUS around them; why COMPLETED: the find-#6 audit mechanism — the def-level axiom
audit propagates stub `sorryAx` through the frozen DEFS `pureState`/`SubState.restrict`
into every pureState-typed consumer, so the AL rung-stone could not be triad-clean
without this completion. This file is now sorry-free; it remains probe-convention
statement-layer (its verdict line still reads "probe").

STATEMENT-LEVEL FIND (surfaced by this probe's spec pass; recorded for the dossier):
the prework's §2.3/§2.5 reading of the boundary lift via "π(Λ)'s INDUCED (square) graph"
is REFUTED by a two-site slab: Λ = {(0,0,0), (1,0,5)} ⊂ slab h > 5, A = {(0,0,0)}
(column-closed) has |∂^square_{πΛ} πA| = 1 but |∂^cubic_Λ A| = 0. The honest object is
the PROJECTED graph `projLattice Λ` (edges = projections of cubic Λ-edges), and the
`PlanarAreaLawVar` binder accordingly carries an ambient-graph parameter `G ≤ planarLattice`
(at `G = planarLattice`, uniform heights: the donor `AreaLaw` shape verbatim — the
specialization note below). This find changes MY new defs only; the frozen layer is
untouched.

STATEMENT-LEVEL FIND #3 (at P2 planning, 2026-11-16): the prework §2.3 sketch
instantiates `PlanarAreaLawVar` at the 3D statement's raw `J`, but the projected
(grouped) interaction has strength `groupStrength h R J := 2 ^ (h * (2*R+1)^2) * max J 1`
(diameter-bounded preimages per projected support, each of 3D strength at most `J`) —
a binder at raw J cannot consume it. `SlabAreaLawColumnCuts3D` below therefore
instantiates the binder at `groupStrength h R J`; the range R is preserved by the
P1-a diameter contraction. New-defs side only; frozen layer untouched.

STATEMENT-LEVEL FIND #4 (at P2-e assembly planning, 2026-11-17, lane A4): the landed
binder/rung-stone pair had TWO scoping defects that make the rung-stone unprovable as
landed, both on the new-defs side (frozen layer untouched):
(i) `PlanarAreaLawVar` quantified `∃ C` INSIDE `∀ Λ' hU` (per-domain constant), while
`SlabAreaLawColumnCuts3D` asserts `∃ C` BEFORE `∀ Λ` (uniform); a per-domain-constant
hypothesis cannot discharge a uniform-constant conclusion. The donor's planar law
quantifies one `C` outside `∀ Λ` (`OpenAI/AreaLaw` shape, donor `Statements.lean:202–210`,
"one constant C … for every finite domain"), and the donor's cylinder theorem extracts it
once (`Cylinder3D.lean:531–532`, `obtain ⟨C, hC⟩ := hplanar _ …`).
(ii) `SlabAreaLawColumnCuts3D` prefixed `∀ G ≤ planarLattice` OUTSIDE the hypothesis
while its conclusion is G-independent: instantiating G at the EMPTY graph trivializes
the hypothesis class while the conclusion remains the full conditional slab law. The
proof needs the binder at `G := projLattice Λ` per Λ (the honest boundary-lift graph,
find #1) — so the G-quantification belongs INSIDE the binder, with `∃ C` outside it.
AMENDED SHAPE (this file, both defs below): `PlanarAreaLawVar := ∃ C, ∀ G ≤
planarLattice, ∀ Λ' hU (hU ≤ h), …` — one constant serves every subgraph — and
`SlabAreaLawColumnCuts3D := PlanarAreaLawVar … → ∃ C, ∀ Λ …` (the prework §2.3 sketch's
outer shape, vindicated). At `G := planarLattice`, constant `hU := h`, the binder is the
donor `AreaLaw 𝕜 (q ^ h) R J Δ` shape verbatim, uniformity included; the honesty ledger
is unchanged (still not discharged here).

Honesty ledger for the binder (prework §2.4): NOT discharged here; AAG
arXiv:2103.02492 = frustration-free 2D only; uniform donor `area_law` rests on the
unrefereed [OAI265]; the padding route FAILS at the boundary count (prework §2.4(iii)).
-/

import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.Group.Pointwise.Finset.Basic
import Mathlib.Analysis.Convex.Hull
import Mathlib.Analysis.Matrix.HermitianFunctionalCalculus
import Mathlib.Analysis.Matrix.Order
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Analysis.SpecialFunctions.BinaryEntropy
import Mathlib.Analysis.SpecialFunctions.Log.NegMulLog
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Combinatorics.SimpleGraph.Density
import Mathlib.Combinatorics.SimpleGraph.Hasse
import Mathlib.Combinatorics.SimpleGraph.Metric
import Mathlib.Combinatorics.SimpleGraph.Prod
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Int.Interval
import Mathlib.Data.Matrix.Mul
import Mathlib.LinearAlgebra.Matrix.Charpoly.Basic
import Mathlib.LinearAlgebra.Matrix.Kronecker
import Mathlib.Logic.Equiv.Basic
import Mathlib.Topology.EMetricSpace.Diam
import Mathlib.Topology.Instances.Int
import Mathlib.Topology.MetricSpace.HausdorffDistance

open scoped ComplexOrder

/-! ## The Arealaw entropy core — carried VERBATIM from `ProbeG4_AreaLaw.lean` (G4-green) -/

/-- Physlib lemma (the five dropped `QuantumInfo.ForMathlib.*` imports' only statement-layer
contribution), restated per G4; its PROOF is not part of this probe. -/
theorem posSemidef_vecMulVec_self_star {ι : Type*} [Fintype ι] [DecidableEq ι] {𝕜 : Type*}
    [RCLike 𝕜] (Ω : ι → 𝕜) : Matrix.PosSemidef (Matrix.vecMulVec Ω (star Ω)) :=
  Matrix.posSemidef_vecMulVec_self_star Ω

namespace Arealaw

section Region

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*}

/-- The index of the region `S`: a basis label of the local space at every site of `S`. -/
abbrev Reg (loc : σ → Type*) (S : Finset σ) := ∀ i : S, loc i

variable {S T U : Finset σ}

/-- The restriction of a configuration on `T` to `S ⊆ T`. -/
def restr (h : S ⊆ T) (z : Reg loc T) : Reg loc S := Finset.restrict₂ h z

/-- A configuration on `S` glued to one on `T \ S`, giving one on `T`. -/
def glue (x : Reg loc S) (z : Reg loc (T \ S)) : Reg loc T :=
  fun j => if hj : (j : σ) ∈ S then x ⟨j, hj⟩ else z ⟨j, Finset.mem_sdiff.2 ⟨j.2, hj⟩⟩

end Region

section PTrace

open scoped ComplexOrder Matrix.Norms.L2Operator
open Matrix

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
  [∀ i, Fintype (loc i)] {𝕜 : Type*} [RCLike 𝕜] {S T U : Finset σ}

/-- The partial trace from the region `T` to the `S ⊆ T`. -/
noncomputable def ptrace (_h : S ⊆ T) (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    Matrix (Reg loc S) (Reg loc S) 𝕜 :=
  Matrix.of fun x y => ∑ z : Reg loc (T \ S), M (glue x z) (glue y z)

/-- The partial trace of a positive semidefinite matrix is positive semidefinite. -/
theorem posSemidef_ptrace (h : S ⊆ T) {M : Matrix (Reg loc T) (Reg loc T) 𝕜} (hM : M.PosSemidef) :
    (ptrace h M).PosSemidef := by
  classical
  -- COMPRESSION ROUTE (the A2 M3 support-layer V port; find-#6 amendment, H-approved
  -- 2026-11-20): `ptrace h M = ∑ z, E z M (E z)ᴴ` with `E z` the glue-slice selector;
  -- each summand is psd by conjugation (`mul_mul_conjTranspose_same`), quadratic forms
  -- distribute over the sum, and the ℝ-cast (`sum_nonneg_re`-route) closes.
  have hsel : ∀ (a : Reg loc T) (F : Reg loc T → 𝕜),
      (∑ w : Reg loc T, (if w = a then (1 : 𝕜) else 0) * F w) = F a := by
    intro a F
    rw [Finset.sum_eq_single_of_mem a (Finset.mem_univ _)
      (fun b _ hbne => by simp [hbne])]
    simp
  have hsel' : ∀ (a : Reg loc T) (F : Reg loc T → 𝕜),
      (∑ w : Reg loc T, F w * star ((if w = a then (1 : 𝕜) else 0))) = F a := by
    intro a F
    rw [Finset.sum_eq_single_of_mem a (Finset.mem_univ _)
      (fun b _ hbne => by simp [hbne])]
    simp
  have hsum : ptrace h M = ∑ z : Reg loc (T \ S),
      (Matrix.of fun c w => if w = glue c z then (1 : 𝕜) else 0) * M *
        (Matrix.of fun c w => if w = glue c z then (1 : 𝕜) else 0)ᴴ := by
    ext c d
    simp only [ptrace, Matrix.of_apply, Matrix.sum_apply]
    refine Finset.sum_congr rfl fun z _ => ?_
    simp only [Matrix.mul_apply, Matrix.conjTranspose_apply, Matrix.of_apply]
    have hin : ∀ j : Reg loc T,
        (∑ j_1 : Reg loc T, (if j_1 = glue c z then (1 : 𝕜) else 0) * M j_1 j) =
          M (glue c z) j :=
      fun j => hsel (glue c z) (fun w => M w j)
    simp only [hin]
    exact (hsel' (glue d z) (fun w => M (glue c z) w)).symm
  have hH : (ptrace h M).IsHermitian := by
    rw [hsum, Matrix.IsHermitian, Matrix.conjTranspose_sum]
    exact Finset.sum_congr rfl fun z _ =>
      ((hM.mul_mul_conjTranspose_same _).isHermitian).eq
  refine Matrix.PosSemidef.of_dotProduct_mulVec_nonneg hH ?_
  intro x
  rw [hsum]
  have hq : ∀ {ι κ : Type} [Fintype ι] [Fintype κ] (P : ι → Matrix κ κ 𝕜) (x : κ → 𝕜),
      star x ⬝ᵥ ((∑ i, P i) *ᵥ x) = ∑ i, star x ⬝ᵥ (P i *ᵥ x) := by
    intro ι κ _ _ P x
    have h1 : (∑ i, P i) *ᵥ x = ∑ i, P i *ᵥ x := by
      funext j
      simp only [mulVec, dotProduct, Matrix.sum_apply, Finset.sum_apply, Finset.sum_mul]
      rw [show ∑ j' : κ, ∑ i : ι, P i j j' * x j' = ∑ i : ι, ∑ j' : κ, P i j j' * x j' from
        Finset.sum_comm]
    have h3 : star x ⬝ᵥ (∑ i, P i *ᵥ x) = ∑ i, star x ⬝ᵥ (P i *ᵥ x) := by
      simp only [dotProduct, Finset.sum_apply, Finset.mul_sum]
      rw [show ∑ j : κ, ∑ i : ι, star x j * (P i *ᵥ x) j = ∑ i : ι, ∑ j : κ, star x j * (P i *ᵥ x) j from
        Finset.sum_comm]
    rw [h1, h3]
  refine (hq (ι := Reg loc (T \ S)) (κ := Reg loc S)
      (fun z => (Matrix.of fun c w => if w = glue c z then (1 : 𝕜) else 0) * M *
        (Matrix.of fun c w => if w = glue c z then (1 : 𝕜) else 0)ᴴ) x) ▸ ?_
  have hnn : ∀ q : Reg loc (T \ S) → 𝕜,
      (∀ i, 0 ≤ RCLike.re (q i)) → (∀ i, RCLike.im (q i) = 0) → 0 ≤ ∑ i, q i := by
    intro q hre him
    have h1 : ∀ i, q i = ((RCLike.re (q i) : ℝ) : 𝕜) := by
      intro i
      have h2 := RCLike.re_add_im (q i)
      rw [him i] at h2
      simp at h2
      exact h2.symm
    rw [Finset.sum_congr rfl (fun i _ => h1 i), ← RCLike.ofReal_sum]
    exact RCLike.ofReal_nonneg.2 (Finset.sum_nonneg fun i _ => hre i)
  refine hnn _ (fun z =>
    (hM.mul_mul_conjTranspose_same _).re_dotProduct_nonneg x) (fun z =>
    ((hM.mul_mul_conjTranspose_same _).isHermitian).im_star_dotProduct_mulVec_self x)

/-- The partial trace preserves the trace. -/
theorem trace_ptrace (h : S ⊆ T) (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    (ptrace h M).trace = M.trace := by
  classical
  -- GLUE-REINDEX ROUTE (find-#6 amendment, 2026-11-20): the diagonal sum reindexes
  -- along the glue bijection `Reg S × Reg (T \ S) ≃ Reg T`.
  have hrg : ∀ (x : Reg loc S) (z : Reg loc (T \ S)), restr h (glue x z) = x :=
    fun _ _ => funext fun i => dif_pos i.2
  have hrgc : ∀ (x : Reg loc S) (z : Reg loc (T \ S)),
      restr (S := T \ S) (T := T) Finset.sdiff_subset (glue x z) = z :=
    fun _ _ => funext fun i => dif_neg (Finset.mem_sdiff.1 i.2).2
  have hgr : ∀ w : Reg loc T,
      glue (restr h w) (restr (S := T \ S) (T := T) Finset.sdiff_subset w) = w :=
    fun _ => funext fun _ => by simp [restr, glue]
  have hbij : Function.Bijective (fun p : Reg loc S × Reg loc (T \ S) => glue p.1 p.2) := by
    constructor
    · rintro ⟨x, z⟩ ⟨x', z'⟩ hp
      have e1 := congrArg (restr h) hp
      have e2 := congrArg (restr (S := T \ S) (T := T) Finset.sdiff_subset) hp
      simp only [hrg, hrgc] at e1 e2
      exact Prod.ext e1 e2
    · intro w
      exact ⟨(restr h w, restr (S := T \ S) (T := T) Finset.sdiff_subset w), hgr w⟩
  simp only [ptrace, Matrix.of_apply, Matrix.trace, Matrix.diag_apply]
  rw [← Fintype.sum_prod_type' (fun (x : Reg loc S) (z : Reg loc (T \ S)) =>
    M (glue x z) (glue x z))]
  exact Fintype.sum_equiv (Equiv.ofBijective _ hbij)
    (fun p => M (glue p.1 p.2) (glue p.1 p.2)) (fun w => M w w) (fun _ => rfl)

section DecEqLoc
variable [∀ i, DecidableEq (loc i)]

/-- A matrix on `S ⊆ T` extended to `T` by the identity on `T \ S`. -/
noncomputable def extendId (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    Matrix (Reg loc T) (Reg loc T) 𝕜 :=
  Matrix.of fun w w' =>
    if restr (S := T \ S) (T := T) Finset.sdiff_subset w
        = restr (S := T \ S) (T := T) Finset.sdiff_subset w'
    then A (restr h w) (restr h w') else 0

end DecEqLoc

end PTrace

section VonNeumann

open Matrix

variable {𝕜 : Type*} [RCLike 𝕜] {n : Type*} [Fintype n] [DecidableEq n]

/-- The von Neumann entropy `-tr(ρ log ρ)` of a Hermitian matrix, in nats. -/
noncomputable def vonNeumann {ρ : Matrix n n 𝕜} (hρ : ρ.IsHermitian) : ℝ :=
  RCLike.re (-(hρ.cfc (fun x => x * Real.log x)).trace)

end VonNeumann

section Mixed

open scoped ComplexOrder
open Matrix

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
  [∀ i, Fintype (loc i)]
  {𝕜 : Type*} [RCLike 𝕜] {S T U : Finset σ}

/-- A subnormalized state: positive semidefinite with real trace at most one. -/
@[ext] structure SubState (ι : Type*) [Fintype ι] (𝕜 : Type*) [RCLike 𝕜] where
  M : Matrix ι ι 𝕜
  psd : M.PosSemidef
  tr_le_one : RCLike.re M.trace ≤ 1

/-- A state: a subnormalized state of unit trace. -/
structure MState (ι : Type*) [Fintype ι] (𝕜 : Type*) [RCLike 𝕜] extends SubState ι 𝕜 where
  tr_eq_one : RCLike.re M.trace = 1

namespace SubState

/-- The restriction of a state on `T` to `S ⊆ T`, by the partial trace. -/
noncomputable def restrict (h : S ⊆ T) (ρ : SubState (Reg loc T) 𝕜) : SubState (Reg loc S) 𝕜 where
  M := ptrace h ρ.M
  psd := posSemidef_ptrace h ρ.psd
  tr_le_one := trace_ptrace h ρ.M ▸ ρ.tr_le_one

/-- The von Neumann entropy of a state, in nats. -/
noncomputable def entropy {ι : Type*} [Fintype ι] [DecidableEq ι] (ρ : SubState ι 𝕜) : ℝ :=
  vonNeumann ρ.psd.isHermitian

end SubState

namespace MState

/-- The state with density matrix `M`, given positivity and unit trace. -/
@[simps] def mk' {ι : Type*} [Fintype ι] {M : Matrix ι ι 𝕜} (psd : M.PosSemidef)
    (tr_eq_one : RCLike.re M.trace = 1) : MState ι 𝕜 where
  M := M
  psd := psd
  tr_le_one := tr_eq_one.le
  tr_eq_one := tr_eq_one

end MState

variable {X Y : Finset σ} [∀ i, DecidableEq (loc i)]

namespace SubState

/-- The entropy `S_ρ(X)` of the region `X ⊆ U` of a state `ρ` on `U`. -/
noncomputable def regionEntropy (ρ : SubState (Reg loc U) 𝕜) (h : X ⊆ U) : ℝ :=
  (ρ.restrict h).entropy

end SubState

end Mixed

end Arealaw

/-! ## The planar (2D) statement layer — carried VERBATIM from `ProbeG4_AreaLaw.lean` -/

namespace OpenAI

open Arealaw
open scoped ComplexOrder MatrixOrder Matrix.Norms.L2Operator Pointwise
open Matrix SimpleGraph

/-- Adjacency in the square lattice `ℤ²` is decidable. -/
instance instDecidableRelAdjSquareLattice : DecidableRel (hasse ℤ □ hasse ℤ).Adj :=
  fun x y => decidable_of_iff ((x.1 + 1 = y.1 ∨ y.1 + 1 = x.1) ∧ x.2 = y.2 ∨
      (x.2 + 1 = y.2 ∨ y.2 + 1 = x.2) ∧ x.1 = y.1)
    (by simp only [boxProd_adj, hasse_adj, Order.covBy_iff_add_one_eq])

/-- The graph distance `d_Λ` of the square lattice induced on `Λ`. -/
noncomputable def domainEDist (Λ : Finset (ℤ × ℤ)) (x y : ℤ × ℤ) : ℕ∞ :=
  if h : x ∈ Λ ∧ y ∈ Λ then
    ((hasse ℤ □ hasse ℤ).induce (Λ : Set (ℤ × ℤ))).edist ⟨x, h.1⟩ ⟨y, h.2⟩
  else ⊤

/-- The diameter of `X` in the distance `d_Λ`. -/
noncomputable def domainEDiam (Λ X : Finset (ℤ × ℤ)) : ℕ∞ :=
  ⨆ x ∈ X, ⨆ y ∈ X, domainEDist Λ x y

/-- The edge boundary `∂_Λ A`: lattice edges `(x, y)` with `x ∈ A` and `y ∈ Λ \ A`. -/
noncomputable def edgeBoundary (Λ A : Finset (ℤ × ℤ)) : Finset ((ℤ × ℤ) × (ℤ × ℤ)) :=
  (hasse ℤ □ hasse ℤ).interedges A (Λ \ A)

/-- Every site of `ℤ²` carries a qudit, with basis `Fin q`. -/
abbrev Qudits (q : ℕ) : ℤ × ℤ → Type := fun _ => Fin q

/-- The admissible supports: nonempty `X ⊆ Λ` of `d_Λ`-diameter at most `R`. -/
noncomputable def supports (Λ : Finset (ℤ × ℤ)) (R : ℕ) : Finset (Finset (ℤ × ℤ)) :=
  Λ.powerset.filter fun X => X.Nonempty ∧ domainEDiam Λ X ≤ R

variable {𝕜 : Type*} [RCLike 𝕜] {q : ℕ}

/-- The Hamiltonian `H = ∑_X ⊆ Λ Φ X`. -/
noncomputable def hamiltonian (Λ : Finset (ℤ × ℤ))
    (Φ : (X : Finset (ℤ × ℤ)) → Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) 𝕜) :
    Matrix (Reg (Qudits q) Λ) (Reg (Qudits q) Λ) 𝕜 :=
  ∑ X ∈ Λ.powerset.attach, extendId (Finset.mem_powerset.1 X.2) (Φ X.1)

/-- An interaction of range `R` and strength `J`. -/
def IsAdmissible (Λ : Finset (ℤ × ℤ)) (R : ℕ) (J : ℝ)
    (Φ : (X : Finset (ℤ × ℤ)) → Matrix (Reg (Qudits q) X) (Reg (Qudits q) X) 𝕜) : Prop :=
  ∀ X ⊆ Λ, (Φ X).IsHermitian ∧ ‖Φ X‖ ≤ J ∧ (X ∉ supports Λ R → Φ X = 0)

/-- The spectral gap `H - E₀ ≥ Δ (1 - |Ω⟩⟨Ω|)`, in the Loewner order. -/
def HasGlobalGap {ι : Type*} [Fintype ι] [DecidableEq ι] (H : Matrix ι ι 𝕜) (Ω : ι → 𝕜)
    (E₀ Δ : ℝ) : Prop :=
  (Δ : 𝕜) • (1 - vecMulVec Ω (star Ω)) ≤ H - (E₀ : 𝕜) • 1

/-- The pure state `|Ω⟩⟨Ω|` of a unit vector. -/
noncomputable def pureState {ι : Type*} [Fintype ι] (Ω : ι → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) :
    MState ι 𝕜 :=
  MState.mk' (posSemidef_vecMulVec_self_star Ω)
    (by rw [trace_vecMulVec, dotProduct_comm, hΩ, RCLike.one_re])

/-! ## The frozen 3D encoding cluster — VERBATIM from `OpenAI/Statements3D.lean` (:64–:182);
frozen per Targets.md §D rule 1; nothing below is proved here. -/

/-- The cubic lattice `ℤ³` as `hasse ℤ □ (hasse ℤ □ hasse ℤ)`. -/
noncomputable abbrev cubicLattice3D : SimpleGraph (ℤ × ℤ × ℤ) := hasse ℤ □ (hasse ℤ □ hasse ℤ)

/-- Adjacency in `cubicLattice3D` is decidable (classical; the donor file carries no proof). -/
noncomputable instance instDecidableRelAdjCubicLattice3D : DecidableRel cubicLattice3D.Adj :=
  Classical.decRel _

/-- The graph distance `d_Λ` of the cubic-lattice graph induced on a finite domain `Λ ⊂ ℤ³`. -/
noncomputable def domainEDist3D (Λ : Finset (ℤ × ℤ × ℤ)) (x y : ℤ × ℤ × ℤ) : ℕ∞ :=
  if h : x ∈ Λ ∧ y ∈ Λ then
    (cubicLattice3D.induce (Λ : Set (ℤ × ℤ × ℤ))).edist ⟨x, h.1⟩ ⟨y, h.2⟩
  else ⊤

/-- The diameter `diam_{d_Λ} X`. -/
noncomputable def domainEDiam3D (Λ X : Finset (ℤ × ℤ × ℤ)) : ℕ∞ :=
  ⨆ x ∈ X, ⨆ y ∈ X, domainEDist3D Λ x y

/-- The edge boundary `∂_Λ A`, each crossing edge once, oriented out of `A`. -/
noncomputable def edgeBoundary3D (Λ A : Finset (ℤ × ℤ × ℤ)) :
    Finset ((ℤ × ℤ × ℤ) × (ℤ × ℤ × ℤ)) :=
  cubicLattice3D.interedges A (Λ \ A)

/-- Every site of `ℤ³` carries `Fin q`. -/
abbrev Qudits3D (q : ℕ) : ℤ × ℤ × ℤ → Type := fun _ => Fin q

/-- The admissible supports: nonempty `X ⊆ Λ` with `diam_{d_Λ} X ≤ R`. -/
noncomputable def supports3D (Λ : Finset (ℤ × ℤ × ℤ)) (R : ℕ) :
    Finset (Finset (ℤ × ℤ × ℤ)) :=
  Λ.powerset.filter fun X => X.Nonempty ∧ domainEDiam3D Λ X ≤ R

/-- The Hamiltonian `H = ∑_{X ⊆ Λ} h_X` [OAI265, eq. (1.1)] on `ℤ³`. -/
noncomputable def hamiltonian3D (Λ : Finset (ℤ × ℤ × ℤ))
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) → Matrix (Reg (Qudits3D q) X) (Reg (Qudits3D q) X) 𝕜) :
    Matrix (Reg (Qudits3D q) Λ) (Reg (Qudits3D q) Λ) 𝕜 :=
  ∑ X ∈ Λ.powerset.attach, extendId (Finset.mem_powerset.1 X.2) (Φ X.1)

/-- An admissible interaction of range `R` and strength `J` [OAI265, eq. (1.1)]. -/
def IsAdmissible3D (Λ : Finset (ℤ × ℤ × ℤ)) (R : ℕ) (J : ℝ)
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) → Matrix (Reg (Qudits3D q) X) (Reg (Qudits3D q) X) 𝕜) :
    Prop :=
  ∀ X ⊆ Λ, (Φ X).IsHermitian ∧ ‖Φ X‖ ≤ J ∧ (X ∉ supports3D Λ R → Φ X = 0)

/-! ## M0.1 — the frozen target `SlabAreaLaw3D`, VERBATIM
(`OpenAI/Statements3D.lean:164–182`; the north fence this pilot's rung-stone sits BESIDE;
a proof of it is a `theorem` of the frozen `def` applied to its parameters — Targets.md §D
rule 1. The north star `AreaLaw3D` (:153) is NOT A TARGET — §A fence at :23, obstructions
C.1 :103 / C.2 :111 / C.3 :117 / C.4 :123.) -/

/-- A domain inside the slab `ℤ² × [0, h)`: every site has third coordinate in `[0, h)`. -/
def IsSlabDomain3D (h : ℕ) (Λ : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∀ x ∈ Λ, 0 ≤ x.2.2 ∧ x.2.2 < h

/-- **Target 2**, the area law inside a slab of thickness `h`: `AreaLaw3D` restricted to
domains `Λ` with `IsSlabDomain3D h Λ`.  The constant may depend on `h`.  FROZEN — this
pilot does NOT prove it (arbitrary cuts are donor-scale; HARD STOP per the prework's
stop-gate ii); the rung-stone below is weaker-by-cut-class and NEWLY NAMED beside it. -/
def SlabAreaLaw3D (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ × ℤ), IsSlabDomain3D h Λ →
    ∀ Φ : (X : Finset (ℤ × ℤ × ℤ)) → Matrix (Reg (Qudits3D q) X) (Reg (Qudits3D q) X) 𝕜,
      IsAdmissible3D Λ R J Φ →
    ∀ (Ω : Reg (Qudits3D q) Λ → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
      hamiltonian3D Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω → HasGlobalGap (hamiltonian3D Λ Φ) Ω E₀ Δ →
    ∀ (A : Finset (ℤ × ℤ × ℤ)) (hA : A ⊆ Λ),
      (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary3D Λ A).card

end OpenAI

/-! ## NEW defs (Targets.md §D rules 2–3): the projected graph, the variable planar binder
with ambient-graph parameter, and the B.2 rung-stone. The ambient-graph parameter is the
probe's statement-level find (header): the square-reading of the boundary lift is refuted
by `Λ = {(0,0,0), (1,0,5)}`, `A = {(0,0,0)}`; `projLattice` is the honest object, and the
binder quantifies over `G ≤ planarLattice` so that at `G = planarLattice` + uniform
heights it is the donor `AreaLaw` shape verbatim (see the specialization note). -/

namespace OpenAI.AL3D

open Arealaw OpenAI
open scoped ComplexOrder MatrixOrder Matrix.Norms.L2Operator Pointwise
open Matrix SimpleGraph

/-- The square lattice `ℤ²` (readability name; `hasse ℤ □ hasse ℤ` itself is the donor's
spelling and is used verbatim in the frozen layer above). -/
noncomputable abbrev planarLattice : SimpleGraph (ℤ × ℤ) := hasse ℤ □ hasse ℤ

/-- The column projection `π : ℤ³ → ℤ²` (the donor's `column` map, `Cylinder3D.lean`). -/
def proj (x : ℤ × ℤ × ℤ) : ℤ × ℤ := (x.1, x.2.1)

/-- The projected-edge relation: some cubic edge of `Λ` projects to `(u, u')`
(directional; `projLattice` symmetrizes and excludes loops). -/
def projEdge (Λ : Finset (ℤ × ℤ × ℤ)) (u u' : ℤ × ℤ) : Prop :=
  ∃ x y : ℤ × ℤ × ℤ, x ∈ Λ ∧ y ∈ Λ ∧ cubicLattice3D.Adj x y ∧ proj x = u ∧ proj y = u'

/-- The PROJECTED graph of a 3D domain `Λ`: `u ~ u'` iff some edge of `Λ` (in
`cubicLattice3D`) projects to `(u, u')`. A subgraph of `planarLattice` on `proj '' Λ`;
this probe's honest replacement for the refuted "induced square graph" reading (header).
Built via `SimpleGraph.fromRel` (this pin's `SimpleGraph` fields are `Std.Symm`/
`Std.Irrefl` — `fromRel` handles both; `fromRel_adj` gives
`Adj u u' ↔ u ≠ u' ∧ (projEdge Λ u u' ∨ projEdge Λ u' u)`). -/
def projLattice (Λ : Finset (ℤ × ℤ × ℤ)) : SimpleGraph (ℤ × ℤ) :=
  SimpleGraph.fromRel (projEdge Λ)

/-- The graph distance of an ambient planar graph `G` induced on `Λ'`
(`domainEDist` with the ambient graph abstracted). -/
noncomputable def domainEDistG (G : SimpleGraph (ℤ × ℤ)) (Λ' : Finset (ℤ × ℤ))
    (u v : ℤ × ℤ) : ℕ∞ :=
  if h : u ∈ Λ' ∧ v ∈ Λ' then
    (G.induce (Λ' : Set (ℤ × ℤ))).edist ⟨u, h.1⟩ ⟨v, h.2⟩
  else ⊤

/-- The diameter of `X` in the distance `domainEDistG G Λ'`. -/
noncomputable def domainEDiamG (G : SimpleGraph (ℤ × ℤ)) (Λ' X : Finset (ℤ × ℤ)) : ℕ∞ :=
  ⨆ u ∈ X, ⨆ v ∈ X, domainEDistG G Λ' u v

/-- The admissible supports at ambient graph `G`: nonempty `X ⊆ Λ'` of `G`-diameter ≤ R. -/
noncomputable def supportsG (G : SimpleGraph (ℤ × ℤ)) (Λ' : Finset (ℤ × ℤ)) (R : ℕ) :
    Finset (Finset (ℤ × ℤ)) :=
  Λ'.powerset.filter fun X => X.Nonempty ∧ domainEDiamG G Λ' X ≤ R

/-- The edge boundary at ambient graph `G`: `G`-edges `(u, u')` with `u ∈ A`,
`u' ∈ Λ' \ A`, each once, oriented out of `A` (decidability classical — statement layer). -/
noncomputable def edgeBoundaryG (G : SimpleGraph (ℤ × ℤ)) (Λ' A : Finset (ℤ × ℤ)) :
    Finset ((ℤ × ℤ) × (ℤ × ℤ)) :=
  letI : DecidableRel G.Adj := Classical.decRel _
  G.interedges A (Λ' \ A)

variable {𝕜 : Type*} [RCLike 𝕜] {q : ℕ}

/-- The variable-local-dimension Hamiltonian `H = ∑_X ⊆ Λ' Φ X` (the `hamiltonian`
def with `loc := fun u => Fin (q ^ hU u)`; graph-free). -/
noncomputable def hamiltonianVar (Λ' : Finset (ℤ × ℤ)) (hU : ℤ × ℤ → ℕ)
    (Φ : (X : Finset (ℤ × ℤ)) →
      Matrix (Reg (fun u => Fin (q ^ hU u)) X) (Reg (fun u => Fin (q ^ hU u)) X) 𝕜) :
    Matrix (Reg (fun u => Fin (q ^ hU u)) Λ') (Reg (fun u => Fin (q ^ hU u)) Λ') 𝕜 :=
  ∑ X ∈ Λ'.powerset.attach, extendId (Finset.mem_powerset.1 X.2) (Φ X.1)

/-- Admissibility at ambient graph `G` and variable heights (the `IsAdmissible` shape). -/
def IsAdmissibleVar (G : SimpleGraph (ℤ × ℤ)) (Λ' : Finset (ℤ × ℤ)) (R : ℕ) (J : ℝ)
    (hU : ℤ × ℤ → ℕ)
    (Φ : (X : Finset (ℤ × ℤ)) →
      Matrix (Reg (fun u => Fin (q ^ hU u)) X) (Reg (fun u => Fin (q ^ hU u)) X) 𝕜) :
    Prop :=
  ∀ X ⊆ Λ', (Φ X).IsHermitian ∧ ‖Φ X‖ ≤ J ∧ (X ∉ supportsG G Λ' R → Φ X = 0)

/-- The planar area law at NON-UNIFORM local dimension and every ambient graph
`G ≤ planarLattice`: ONE constant `C` (find #4) serves every subgraph `G`, every domain
`Λ'` and every height profile `hU u ≤ h`; sites `u ∈ Λ'` carry `Fin (q ^ hU u)`;
admissibility (`supportsG`), eigenvector/gap skeleton and cut as in `AreaLaw`, boundary
at `G`.  A HYPOTHESIS at this tier (honesty ledger, prework §2.4): NOT discharged in
this pilot — the general 2D gapped law is open informally (AAG arXiv:2103.02492 =
frustration-free 2D only) and the uniform donor `area_law` rests on the unrefereed
[OAI265].  SPECIALIZATION NOTE: at `G := planarLattice` and constant `hU := fun _ => h`,
this is the donor's `AreaLaw 𝕜 (q ^ h) R J Δ` shape verbatim (same supports, same
boundary, `Fin (q ^ h)` sites, one constant for every domain — donor
`Statements.lean:202–210`).  The ambient-graph quantifier and the outer `∃ C` are find
#4 (file header): the rung-stone's proof instantiates `G := projLattice Λ` per Λ, so the
G-quantification lives inside the binder and the constant outside it. -/
def PlanarAreaLawVar (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  ∃ C : ℝ, ∀ (G : SimpleGraph (ℤ × ℤ)) (_hG : G ≤ planarLattice),
    ∀ (Λ' : Finset (ℤ × ℤ)) (hU : ℤ × ℤ → ℕ), (∀ u ∈ Λ', hU u ≤ h) →
    ∀ Φ : (X : Finset (ℤ × ℤ)) →
        Matrix (Reg (fun u => Fin (q ^ hU u)) X) (Reg (fun u => Fin (q ^ hU u)) X) 𝕜,
      IsAdmissibleVar G Λ' R J hU Φ →
    ∀ (Ω : Reg (fun u => Fin (q ^ hU u)) Λ' → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
      hamiltonianVar Λ' hU Φ *ᵥ Ω = (E₀ : 𝕜) • Ω →
        HasGlobalGap (hamiltonianVar Λ' hU Φ) Ω E₀ Δ →
    ∀ (A : Finset (ℤ × ℤ)) (hA : A ⊆ Λ'),
      (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundaryG G Λ' A).card

/-- A cut is column-closed in `Λ`: it contains every site of `Λ` in each of its columns. -/
def IsColumnClosed3D (Λ A : Finset (ℤ × ℤ × ℤ)) : Prop :=
  ∀ x ∈ A, ∀ y ∈ Λ, (y.1, y.2.1) = (x.1, x.2.1) → y ∈ A

/-- The grouped strength of a projected interaction: at most `2 ^ (h * (2*R+1)^2)`
diameter-bounded preimages per projected support (each of 3D strength at most `J`), so
the projected terms have norm at most this (find #3 above; the prework's `J'`). -/
def groupStrength (h R : ℕ) (J : ℝ) : ℝ := 2 ^ (h * (2 * R + 1) ^ 2) * max J 1

/-- The slab area law for COLUMN-CLOSED cuts — the first B.2 rung-stone.  WEAKER than the
frozen `SlabAreaLaw3D` (cut class restricted; recorded as such per Targets.md §D rule 3 —
this is NOT progress on the frozen target, whose arbitrary cuts remain donor-scale) and
CONDITIONAL on the variable-height planar area law `PlanarAreaLawVar` (every subgraph
`G ≤ planarLattice`, one constant — find #4; the binder is part of the statement;
not-known-discharged — honesty ledger above).  No `AreaLaw3D` content: this claim
resolves none of C.1–C.4. -/
def SlabAreaLawColumnCuts3D (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ) : Prop :=
  PlanarAreaLawVar 𝕜 q R (groupStrength h R J) Δ h →
    ∃ C : ℝ, ∀ Λ : Finset (ℤ × ℤ × ℤ), IsSlabDomain3D h Λ →
      ∀ Φ : (X : Finset (ℤ × ℤ × ℤ)) → Matrix (Reg (Qudits3D q) X) (Reg (Qudits3D q) X) 𝕜,
        IsAdmissible3D Λ R J Φ →
      ∀ (Ω : Reg (Qudits3D q) Λ → 𝕜) (hΩ : star Ω ⬝ᵥ Ω = 1) (E₀ : ℝ),
        hamiltonian3D Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω →
          HasGlobalGap (hamiltonian3D Λ Φ) Ω E₀ Δ →
      ∀ (A : Finset (ℤ × ℤ × ℤ)) (hA : A ⊆ Λ) (_ : IsColumnClosed3D Λ A),
        (pureState Ω hΩ).regionEntropy hA ≤ C * (edgeBoundary3D Λ A).card

/-! ## Shape checks (trivial binder-consumption forms; sorry-free, never cited as content) -/

/-- Binder-consumption shape (EnclOK / ProbeE precedent): validates the rung-stone's
conditional form elaborates.  Trivial re-export; not a result. -/
theorem slab_column_cuts_shape (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ)
    (hS : SlabAreaLawColumnCuts3D 𝕜 q R J Δ h) : SlabAreaLawColumnCuts3D 𝕜 q R J Δ h :=
  hS

/-- Binder-consumption shape for the planar binder itself.  Trivial re-export; not a
result. -/
theorem planar_var_shape (𝕜 : Type*) [RCLike 𝕜] (q R : ℕ) (J Δ : ℝ) (h : ℕ)
    (hV : PlanarAreaLawVar 𝕜 q R J Δ h) : PlanarAreaLawVar 𝕜 q R J Δ h :=
  hV

end OpenAI.AL3D
