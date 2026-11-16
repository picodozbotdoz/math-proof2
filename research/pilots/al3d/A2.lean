/-
PROOF ARTIFACT — AL-P2, the B.2 rung-stone (card per approval 2026-11-16: GO at P1-b
ratified; AL-P2 APPROVED at SPEC on crossmath-pilot-al3d). MILESTONE 1 of the P2
decomposition: the COLUMN REGROUPING equivalence — the variable-height generalization
of the donor's uniform-`h` `(Fin h → Fin q) ≃ Fin (q ^ h)` map (`Cylinder3D.lean`
architecture, pattern-only, mathlib-only).

P2 decomposition (this file grows by milestones; each elaborates sorry-strict):
- P2-a (DONE, recorded): statement amendments — find #3: the planar binder is
  instantiated at `groupStrength h R J := 2 ^ (h * (2*R+1)^2) * max J 1` (P0.lean, new
  def + header note; frozen layer untouched). Range R preserved by P1-a contraction.
- P2-b (THIS MILESTONE): `colSigmaEquiv` (a 3D domain ≃ the sigma of its columns) +
  `regReindexEquiv` (3D configurations ≃ planar variable-height configurations), and
  `colCard_le_h` (slab heights bound — consumes A1's `col_card_le`).
- P2-c (next): the projected interaction `Ψ` (grouping Φ-terms by exact projection;
  support clause via the P1-a diameter contraction, strength via the fibre bound) and
  `IsAdmissibleVar` at `(R, groupStrength)`.
- P2-d: eigenvector/gap transport through the reindexing (Loewner/norm transport —
  the donor's relabelling step; may need reindex-conjugation lemmas mathlib lacks).
- P2-e: the entropy identification for column-closed cuts (whole columns = single
  sites) + the final assembly of `SlabAreaLawColumnCuts3D` via P1-b's boundary lift.

FENCES: no `AreaLaw3D` content (NOT A TARGET, Targets.md §A :23; C.1 :103, C.2 :111,
C.3 :117, C.4 :123); B.1 donor-owned (cite, never re-prove); full `SlabAreaLaw3D`
HARD-STOPPED (prework stop-gate ii). `PlanarAreaLawVar` binder NOT discharged here
(honesty ledger, prework §2.4; AAG 2103.02492 frustration-free 2D only; uniform
donor `area_law` rests on unrefereed [OAI265]).

Imports `A1` (sibling; pilot-11 pattern). R3 fold applied at this touch: A1's audit
tail now carries all 22 theorems (added domainEDistG_of_mem / domainEDist3D_of_mem).
-/

import A1
import Mathlib.Algebra.Order.SuccPred
import Mathlib.Order.Cover

namespace OpenAI.AL3D

open SimpleGraph

/-- Every site of `ℤ³` carries `Fin q` (donor spelling; needed here for the target
type of the regrouping). -/
abbrev Qudits3D (q : ℕ) : ℤ × ℤ × ℤ → Type := fun _ => Fin q

/-- The height of column `u` in `Λ` (the local planar dimension is `q ^ colCard`);
spelled via `Fintype.card` so the per-column reindexing typechecks definitionally. -/
def colCard (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) : ℕ :=
  Fintype.card ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ))

theorem colCard_eq_card (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) :
    colCard Λ u = (col Λ u).card := Fintype.card_coe _

/-! ## P2-b — the column regrouping equivalence -/

/-- Sigma decomposition of a 3D domain into its columns (the fibres of `proj`;
classical bijection, proof by `Subtype.ext`/column-membership). -/
def colSigmaEquiv (Λ : Finset (ℤ × ℤ × ℤ)) :
    ↥((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) ≃
      Σ u : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
        ↥((col Λ (u : ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) where
  toFun x := ⟨⟨proj (x : ℤ × ℤ × ℤ), Finset.mem_image_of_mem proj x.2⟩,
    ⟨(x : ℤ × ℤ × ℤ), mem_col_of_proj Λ _ x.2 rfl⟩⟩
  invFun p := ⟨(p.2 : ℤ × ℤ × ℤ), col_subset Λ _ p.2.2⟩
  left_inv _ := rfl
  right_inv p := by
    obtain ⟨⟨u, -⟩, x, hxcol⟩ := p
    have hxu : proj (x : ℤ × ℤ × ℤ) = u := (Finset.mem_filter.1 hxcol).2
    subst hxu
    rfl

/-- The per-column configuration equivalence: a column of height `n` carrying `Fin q`
per site ≃ one site carrying `Fin (q ^ n)` (the donor's `finFunctionFinEquiv` map,
generalized from uniform `h` to the column height; pin anchor
`Mathlib/Algebra/BigOperators/Fin.lean:577`). -/
noncomputable def colRegEquiv {Λ : Finset (ℤ × ℤ × ℤ)} {q : ℕ} (u : ℤ × ℤ) :
    (∀ x : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) ≃
      Fin (q ^ colCard Λ u) :=
  (Equiv.piCongrLeft' (fun _ : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) =>
      Fin q) (Fintype.equivFin _)).trans
    (finFunctionFinEquiv (m := q) (n := colCard Λ u))

/-- P2-b MAIN: the column regrouping — 3D configurations over `Λ` (each site `Fin q`)
≃ planar variable-height configurations over `proj '' Λ` (column `u` one site of
`Fin (q ^ colCard Λ u)`). This is the reindexing the rung-stone's Hamiltonian
comparison and the entropy identification ride on (donor `Cylinder3D` architecture,
variable-height generalization). -/
noncomputable def regReindexEquiv {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) :
    (∀ x : ↥((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Qudits3D q (x : ℤ × ℤ × ℤ)) ≃
      ∀ u : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
        Fin (q ^ colCard Λ (u : ℤ × ℤ)) :=
  (Equiv.piCongrLeft' (fun _ => Fin q) (colSigmaEquiv Λ)).trans
    ((Equiv.piCurry (fun _ _ => Fin q)).trans
      (Equiv.piCongrRight (fun u => colRegEquiv (u : ℤ × ℤ))))

/-! ## Slab heights feed the planar binder's `hU ≤ h` side condition -/

/-- `colCard` is exactly the height profile the projected system carries, and slab
domains bound it by `h` (consumes A1's `col_card_le`; the `∀ u ∈ Λ'`-side of the
`PlanarAreaLawVar` application). -/
theorem colCard_le_h (h : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)} (hΛ : IsSlabDomain3D h Λ) :
    ∀ u ∈ projF Λ, colCard Λ u ≤ h := fun u _ =>
  colCard_eq_card Λ u ▸ col_card_le h hΛ u

/-! ## Inline full-coverage axiom audit (71/73 convention; every top-level decl). -/

#print axioms colCard_eq_card
#print axioms colCard_le_h

end OpenAI.AL3D
