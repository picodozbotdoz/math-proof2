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
- P2-b (DONE, m1 GREEN): `colSigmaEquiv` + `regReindexEquiv` + `colCard_le_h`.
- P2-c (CLOSED 100%, 2026-11-18, runs 9–13 — A2.lean OK, full-coverage audit triad-clean;
  run 13 `logs/alp2-run13-p2c-closureverify.log`): the
  projected interaction `Ψ := projInteraction` (grouping Φ-terms by exact projection via
  `projFib`; support clause via the P1-a diameter contraction `image_projF_mem_supportsG`;
  strength via the fibre bound `card_projFib_le` + the planar packing
  `card_le_of_mem_supportsG` at any `G ≤ planarLattice`) and `IsAdmissibleVar` at
  `(R, groupStrength h R J)`. Four mathlib-only support layers (glue/extendId calculus;
  L2-operator-norm relabelling/padding; spectral entropy relabelling; planar support
  packing — `A2-gaps.md`). PARK RESOLUTION (`A2-gaps.md` §4 — neither pre-written path
  a/b but a third, EQUIV-COMPOSITION): `colEquivVar` is defined as
  `heightCasts ∘ (regEquivOfEq (projF_fibre)).symm ∘ (regReindexEquiv (fibre Λ X')).symm`
  — every component is an Equiv by construction, so BOTH roundtrips are inherited and the
  per-index choice transport (`Fintype.equivFin` along `proj site = u`) never has to be
  proved; the pointwise-action defs `colEquivVarToFun/InvFun` are kept as documentation
  of the donor's entrywise action only (NOT the composite's underlying functions). The
  `Eq.rec`-motive motif of run 23's park is gone from the proof obligations entirely.
  CLOSURE TAIL (runs 10–13): runs 10/12 reported `errors=0` through a RUNNER-FILTER BLIND
  SPOT (`error(lean.synthInstanceFailed)` lines do not match the `": error:"` filter —
  recorded in A2-gaps §6); the real residual was `l2_opNorm_extendId_le`'s statement
  failing to synthesize `Norm (Matrix (Reg loc T) (Reg loc T) 𝕜)` — the previous session's
  post-park rewrite had dropped `[∀ i, Fintype (loc i)]` from the section variables (that
  decl was NEVER green: absent from runs 7/23/9–12 audits), cascading `sorryAx` into
  `projInteraction_norm_le`/`isAdmissible_projInteraction` via `unknown identifier`. The
  one-line fix (the binder, restored at the L2OpNorm section's `variable` line) was
  VERIFIED by run 13 (`logs/alp2-run13-p2c-closureverify.log`, verify-fire sha-guard
  509f2368… pre = post): A2.lean OK, rc=0, 0 errors (open or hidden), 0 sorry, and the
  FULL-COVERAGE inline audit is triad-only (propext/Classical.choice/Quot.sound) — every
  audited decl including `l2_opNorm_extendId_le`, `projInteraction_norm_le`,
  `isAdmissible_projInteraction`. P2-c is closed at 100%.
- P2-d (PARTIAL, PARKED 2026-11-18 with a PRECISE BLOCKER — statement-level find #5): the
  generic submatrix-conjugation transports (eigenvector `mulVec_eq_smul_submatrix`, gap
  `hasGlobalGap_submatrix`, unit norm `star_dotProduct_comp`, projector `vecMulVec_submatrix`)
  and the entrywise/plumbing layer (`regReindexEquiv_apply` — the `toFun` side is
  rfl-transparent; `regReindexEquiv_comp_colEquivVar` — the roundtrip collapse;
  `fibre_subset`, `sdiff_fibre_eq`) are GREEN-triad (runs 10–12). THE EXTEND-RELABEL SWAP
  AND THE `hamiltonianVar Λ' (colCard·) Ψ = H.submatrix e e` IDENTIFICATION ARE NOT
  PROVABLE AS SCOPED with the current regrouping: their workhorse (the restriction-compat
  lemma `colEquivVar (restr hX' (e x)) = restr hbig x`) reduces per-site to comparing
  `colRegEquiv`-encodings of the SAME column enumerated through DIFFERENT classical
  `Fintype.equivFin` instances (`col Λ u` vs `col (fibre Λ X') u` — propositionally equal
  Finsets, `col_fibre_eq`, but not definitionally equal terms, hence distinct instance
  arguments and unrelated classical enumeration values) — every rewriting route dies on
  dependent motives (the same family as the P2-c park, now at the Λ-vs-fibre level), and
  mathlib provides no `equivFin`-congruence lemma to discharge the residual. THE DONOR'S
  OWN ROUTE is
  the choice-free CANONICAL column enumeration (A2-gaps §4(b): z-rank via A1's
  `col_inj_on_z`/`col_heights`, the donor's `⟨x.2.2⟩` height index) — under canonical
  enumerations the two columns' encodings agree BY CONSTRUCTION and the swap goes through.
  That requires rebuilding P2-b's `colRegEquiv`/`regReindexEquiv` (and re-verifying P2-b/c
  against them) — sized and chartered as the NEXT unit (find #5 recorded in A2-gaps §5).
- P2-e: the entropy identification for column-closed cuts (whole columns = single
  sites) + the final assembly of `SlabAreaLawColumnCuts3D` via P1-b's boundary lift.
- M0-REBUILD (EXECUTED 2026-11-19, lane R8; `rebuild-precharter.md` §2 + the M0-record
  freeze manifest): the canonical z-rank enumeration IS IN — `colZImage`/`colZRank`
  (the new core, "canonical z-rank column enumeration" section below) replace BOTH
  classical `Fintype.equivFin` bodies (`colToFin`'s and `colRegEquiv`'s inner
  reindex). The congruence class (`colZImage_congr`/`colZRank_congr`/
  `colZRank_fibre` — plain `congrArg`, no `Eq.rec`, no instance transport) plus the
  rank-fiber pinning (`colZRank_inj`, `colToFin_symm_rank`) are the un-park key for
  M1's restriction-compat workhorse. Statements FROZEN: all P2-b/P2-c types
  byte-identical to the equivFin era (only def BODIES moved — M0-record §2 manifest);
  regression = run-13's 275-line audit identity re-verified on the rebuilt tree
  (`logs/alp2-m0-run2-rebuild.log`).
- M1 (COMPLETED GREEN 2026-11-19, lane R8 — completion grant run 4; see `M0-record.md` §M1):
  the RESTRICTION-COMP WORKHORSE `colEquivVar_restr` — `colEquivVar Λ q X' hX' (restr hX'
  (regReindexEquiv (Λ := Λ) q x)) = restr (fibre_subset Λ X') x` — PROVED triad-only over
  the GREEN congruence class (`colToFin_symm_fibre`, `colRegEquiv_fibre_apply`, private
  `heightCast_finFunctionFinEquiv`); NO `Eq.rec` anywhere — find #5's obstruction fully
  discharged at M1. The M2-a rung (`colEquivVar_restr_apply` ē-form feed, the powerset
  partition `powerset_eq_biUnion_projFib` + `projFib_pairwise_disjoint`, and the
  per-fibre factorization `sum_projFib_extendId`) lands beside it; the swap proper and
  the Hamiltonian identification are the M2-b continuation.
- M2 (COMPLETED GREEN 2026-11-19, units 6–9; `M0-record.md` §Unit 9): the guard bridge
  (bisected fwd/bwd after the suppressed-error-in-fused-iff find), the extend-relabel
  swap `colEquivVar_swap`, the partition regroup `sum_powerset_eq_sum_projFib`, and the
  KEYSTONE `hamiltonianVar_eq_submatrix` — the P2-d parked targets PROVED over the
  canonical z-rank enumeration.
- M3 (EXECUTED 2026-11-20, lane R8; PARKED at the unit's 3-fire cap with BOTH residual
  fixes pre-written — completion = one fire, the M1 completion-grant precedent): the
  transports (eigenvector/norm/gap, keystone-fed),
  the psd support layer V (`compE`-compression + `posSemidef_ptrace'` + the mathlib-native
  `Matrix.posSemidef_vecMulVec_self_star`), the ENTROPY IDENTIFICATION
  `regionEntropy_pureState_column_closed` (two-loc split lemma + column dichotomy +
  restr-transport), and the RUNG-STONE `slab_column_cuts_of_planar_var`
  (`SlabAreaLawColumnCuts3D` discharged from the `PlanarAreaLawVar` binder at
  `G := projLattice Λ`, `Λ' := projF Λ`, `hU := colCard Λ`, `Ψ := projInteraction`,
  `C' := max C 0`; boundary side on A1's `edgeBoundaryG_card_le`). STATEMENT-LAYER
  FIND #6 recorded in-file at the rung-stone: the frozen P0 probe stubs
  (`posSemidef_vecMulVec_self_star`/`posSemidef_ptrace`/`trace_ptrace`, P0 :104/:142/:147)
  sit INSIDE the frozen defs `pureState`/`SubState.restrict`, so the def-traversing axiom
  audit shows their `sorryAx` on exactly the pureState-typed theorems — M3's OWN proof
  content is triad-only (see the audit block; the find + the proof-only-amendment option
  are recorded for H in `M0-record.md` §M3).

STATEMENT-LEVEL FIND #4 (at P2-e assembly planning, 2026-11-17; amended P0, re-GREEN as
probe in `logs/alp2-run8-substrate.log`): the landed `PlanarAreaLawVar` quantified
`∃ C` inside `∀ Λ' hU` (per-domain constant) while `SlabAreaLawColumnCuts3D` asserts a
uniform `∃ C` before `∀ Λ`, and it prefixed `∀ G ≤ planarLattice` OUTSIDE the
hypothesis with a G-independent conclusion (the empty-graph instantiation trivializes
the hypothesis class). Both are unprovable-as-landed scoping defects; P0's amended
binder is `∃ C, ∀ G ≤ planarLattice, ∀ Λ' hU, …` (one constant, every subgraph) and the
rung-stone consumes it directly — the prework §2.3's outer shape. The proof
instantiates `G := projLattice Λ` per Λ (find #1's honest boundary-lift graph).

SUBSTRATE RESTRUCTURE (same touch, recorded in run8's log): A1 dropped its textual
duplicates of P0's encoding defs and imports P0 (theorem texts unchanged, 22/22 triad);
the runner elaborates P0 → A1 → A2.

FENCES: no `AreaLaw3D` content (NOT A TARGET, Targets.md §A :23; C.1 :103, C.2 :111,
C.3 :117, C.4 :123); B.1 donor-owned (cite, never re-prove); full `SlabAreaLaw3D`
HARD-STOPPED (prework stop-gate ii). `PlanarAreaLawVar` binder NOT discharged here
(honesty ledger, prework §2.4; AAG 2103.02492 frustration-free 2D only; uniform
donor `area_law` rests on unrefereed [OAI265]).

Imports `A1` + `P0` (siblings; pilot-11 pattern; P0 first in the run order — it owns
the encoding defs since the A1 dedup). R3 fold applied at the m1 touch: A1's audit
tail carries all 22 theorems.
-/

import A1
import P0
import Mathlib.Algebra.Order.SuccPred
import Mathlib.Order.Cover
import Mathlib.Analysis.CStarAlgebra.Matrix
import Mathlib.Analysis.Matrix.Order
import Mathlib.LinearAlgebra.Matrix.Kronecker

-- (Linter diagnostic LIFTED at M3 close, 2026-11-20, per the task instruction: the
-- unit-8 `set_option linter.all false` workaround is removed; verdicts never depended
-- on it — the runner's error filter and axiom extraction grep the FULL output.)

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

/-! ### The canonical z-rank column enumeration (M0-rebuild, find #5; 2026-11-19)

Replaces the two `Fintype.equivFin` bodies (find #5, `A2-gaps.md` §4,
`rebuild-precharter.md` §1–§2): `Fintype.equivFin`'s value is an opaque classical
function of the `Fintype` instance, so the two instances carried by the
propositionally equal columns `col Λ u` and `col (fibre Λ X') u` enumerate unrelated —
every per-site transport along `col_fibre_eq` died on dependent motives. The donor's
canonical architecture instead enumerates a column through its z-IMAGE — a `Finset ℤ`
whose `Finset.orderIsoOfFin` is a function of the Finset data (`Finset.sort` of the
backing Multiset; `Finset.orderIsoOfFin_symm_apply` is `rfl`) — so the encoding
congruence along propositional column equality is plain `congrArg`: no `Eq.rec`, no
instance transport. The site↔z leg is classical (`Equiv.ofBijective`) but VALUE-PINNED
by rank-fiber uniqueness (`colZRank_inj`, `colToFin_symm_rank`). Statements FROZEN —
`colToFin`/`colRegEquiv` types byte-identical to the equivFin era (M0-record §2). -/

/-- The z-image of a column — the substrate of the canonical enumeration. -/
def colZImage (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) : Finset ℤ :=
  (col Λ u).image fun x => x.2.2

theorem mem_colZImage {Λ : Finset (ℤ × ℤ × ℤ)} {u : ℤ × ℤ} {x : ℤ × ℤ × ℤ}
    (hx : x ∈ col Λ u) : x.2.2 ∈ colZImage Λ u :=
  Finset.mem_image_of_mem _ hx

/-- The canonical z-rank of a site in column `u`: the position of its z-value in the
sorted z-image (the donor's height index at variable heights). A function of the
column Finset data — never of a `Fintype` instance. -/
def colZRank (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) (x : ℤ × ℤ × ℤ) : ℕ :=
  (colZImage Λ u).sort.idxOf x.2.2

/-- The z-image's card is the column's height (z is injective on a column). -/
theorem colZImage_card (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) :
    (colZImage Λ u).card = colCard Λ u := by
  simp only [colZImage, colCard_eq_card]
  refine Finset.card_image_of_injOn ?_
  rintro a ha b hb hab
  simpa using col_inj_on_z Λ u (Finset.mem_coe.2 ha) (Finset.mem_coe.2 hb) hab

/-- RANK CHARACTERIZATION (rfl-level via `Finset.orderIsoOfFin_symm_apply`): the
z-rank is the `Fin`-value of the canonical z-image enumeration. -/
theorem colZRank_eq (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) {x : ℤ × ℤ × ℤ}
    (hx : x ∈ col Λ u) :
    colZRank Λ u x =
      ((((colZImage Λ u).orderIsoOfFin (colZImage_card Λ u)).symm
          ⟨x.2.2, by simpa using mem_colZImage hx⟩ :
        Fin (colCard Λ u))).val := by
  simp [colZRank, Finset.orderIsoOfFin_symm_apply]

/-- The rank is bounded by the column height. -/
theorem colZRank_lt (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) {x : ℤ × ℤ × ℤ}
    (hx : x ∈ col Λ u) : colZRank Λ u x < colCard Λ u := by
  rw [colZRank_eq Λ u hx]
  exact Fin.isLt _

/-- RANK-FIBER UNIQUENESS (the value-pinning of the classical leg): equal ranks give
equal sites (z injective on the column, and the z-image enumeration is an equiv). -/
theorem colZRank_inj (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) {x y : ℤ × ℤ × ℤ}
    (hx : x ∈ col Λ u) (hy : y ∈ col Λ u) (h : colZRank Λ u x = colZRank Λ u y) :
    x = y := by
  refine col_inj_on_z Λ u hx hy ?_
  have e1 : (((colZImage Λ u).orderIsoOfFin (colZImage_card Λ u)).symm
          ⟨x.2.2, by simpa using mem_colZImage hx⟩ :
        Fin (colCard Λ u)) =
      (((colZImage Λ u).orderIsoOfFin (colZImage_card Λ u)).symm
          ⟨y.2.2, by simpa using mem_colZImage hy⟩ :
        Fin (colCard Λ u)) :=
    Fin.val_injective (by rw [← colZRank_eq Λ u hx, ← colZRank_eq Λ u hy, h])
  exact Subtype.ext_iff.mp
    (((colZImage Λ u).orderIsoOfFin (colZImage_card Λ u)).symm.injective e1)

/-- CONGRUENCE (the un-park key): the z-image is extensional in the column. -/
theorem colZImage_congr {Λ Λ' : Finset (ℤ × ℤ × ℤ)} {u : ℤ × ℤ}
    (h : col Λ u = col Λ' u) : colZImage Λ u = colZImage Λ' u := by
  simp only [colZImage]
  exact congrArg (fun T : Finset (ℤ × ℤ × ℤ) => T.image fun x => x.2.2) h

/-- CONGRUENCE (the un-park key): the canonical z-rank is extensional in the column —
plain `congrArg` through the data functions, NO instance transport, NO `Eq.rec`
(find #5 dies here). -/
theorem colZRank_congr {Λ Λ' : Finset (ℤ × ℤ × ℤ)} {u : ℤ × ℤ}
    (h : col Λ u = col Λ' u) (x : ℤ × ℤ × ℤ) :
    colZRank Λ u x = colZRank Λ' u x := by
  simp only [colZRank, colZImage_congr h]

/-- The canonical column enumeration (M0-REBUILD 2026-11-19; TYPE FROZEN): a column
site ↦ the position of its z-value in the sorted z-image (`colZRank`); the inverse
leg is the sorted-z-image member with that rank — classical (`Equiv.ofBijective`,
whose `toFun` is the literal z-map) but value-pinned (`colZRank_inj`,
`colToFin_symm_rank`). Unlike `Fintype.equivFin`, congruent along propositional
column equality (`colZRank_congr`); `colToFin_apply` is the per-site transparency
lemma M1's workhorse consumes. -/
noncomputable def colToFin (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) :
    ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) ≃ Fin (colCard Λ u) :=
  (Equiv.ofBijective
        (fun x : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) =>
          ⟨(x : ℤ × ℤ × ℤ).2.2, mem_colZImage x.2⟩)
        ⟨fun x y hxy =>
            Subtype.ext
              (col_inj_on_z Λ u x.2 y.2 (Subtype.ext_iff.mp hxy)),
          fun z =>
            by
            obtain ⟨x, hx, hxz⟩ := Finset.mem_image.1 z.2
            exact ⟨⟨x, hx⟩, Subtype.ext hxz⟩⟩).trans
      ((colZImage Λ u).orderIsoOfFin (colZImage_card Λ u)).symm.toEquiv

/-- Per-site transparency: the canonical enumeration's `toFun` value IS the z-rank. -/
theorem colToFin_apply (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ)
    (x : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ))) :
    (colToFin Λ u x : Fin (colCard Λ u)).val = colZRank Λ u (x : ℤ × ℤ × ℤ) := by
  simp [colToFin, colZRank, Equiv.trans_apply, Equiv.ofBijective_apply,
    Finset.orderIsoOfFin_symm_apply]

/-- Per-site pinning of the inverse leg: the site at index `i` has rank `i`. -/
theorem colToFin_symm_rank (Λ : Finset (ℤ × ℤ × ℤ)) (u : ℤ × ℤ) (i : Fin (colCard Λ u)) :
    colZRank Λ u ((colToFin Λ u).symm i : ℤ × ℤ × ℤ) = (i : Fin (colCard Λ u)).val := by
  have h1 : (colToFin Λ u ((colToFin Λ u).symm i) : Fin (colCard Λ u)).val =
      (i : Fin (colCard Λ u)).val := by
    rw [(colToFin Λ u).apply_symm_apply]
  rw [colToFin_apply] at h1
  exact h1

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
`Mathlib/Algebra/BigOperators/Fin.lean:577`). M0-REBUILD 2026-11-19: the inner
reindex is the CANONICAL `colToFin Λ u` (was a second, independent
`Fintype.equivFin _` — the two classical choices never agreed; find #5); type
FROZEN, body-moves per the M0-record §2 manifest. -/
noncomputable def colRegEquiv {Λ : Finset (ℤ × ℤ × ℤ)} {q : ℕ} (u : ℤ × ℤ) :
    (∀ x : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) ≃
      Fin (q ^ colCard Λ u) :=
  (Equiv.piCongrLeft' (fun _ : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) =>
      Fin q) (colToFin Λ u)).trans
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
#print axioms mem_colZImage
#print axioms colZImage_card
#print axioms colZRank_eq
#print axioms colZRank_lt
#print axioms colZRank_inj
#print axioms colZImage_congr
#print axioms colZRank_congr
#print axioms colToFin_apply
#print axioms colToFin_symm_rank

end OpenAI.AL3D

/-! ## P2 support layer I — region calculus (`glue`/`extendId`)

Mathlib-only re-proofs of the vendored `AreaLawForMathlib` patterns (the donor tree's
mathlib-extension files — `AreaLawForMathlib/QuantumInfo/Region/{Basic,PartialTrace}.lean`;
per the G5a boundary nothing is imported: each lemma is re-proved here at the generality
this pilot needs, source noted per lemma; the underlying mathlib gaps are recorded in
`A2-gaps.md`). -/

namespace Arealaw

section Region

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*} {S T U : Finset σ}

/-- Gluing then restricting to the subregion returns the subregion part
(pattern: vendored `Region/Basic.lean:51`). -/
@[simp] theorem restr_glue (h : S ⊆ T) (x : Reg loc S) (z : Reg loc (T \ S)) :
    restr h (glue x z) = x :=
  funext fun i => dif_pos i.2

/-- Gluing then restricting to the complement returns the complement part
(pattern: vendored `Region/Basic.lean:60`). -/
@[simp] theorem restr_glue_compl (x : Reg loc S) (z : Reg loc (T \ S)) :
    restr (S := T \ S) (T := T) Finset.sdiff_subset (glue x z) = z :=
  funext fun i => dif_neg (Finset.mem_sdiff.1 i.2).2

/-- A configuration is recovered from its two restrictions
(pattern: vendored `Region/Basic.lean:65`). -/
@[simp] theorem glue_restr (h : S ⊆ T) (w : Reg loc T) :
    glue (restr h w) (restr (S := T \ S) (T := T) Finset.sdiff_subset w) = w :=
  funext fun j => by simp [restr, glue]

/-- `glue` and the two restrictions assemble to an equivalence
`Reg S × Reg (T \ S) ≃ Reg T` (pattern: vendored `Region/Basic.lean:86`). -/
def glueEquiv (h : S ⊆ T) : Reg loc S × Reg loc (T \ S) ≃ Reg loc T where
  toFun p := glue p.1 p.2
  invFun w := (restr h w, restr (S := T \ S) (T := T) Finset.sdiff_subset w)
  left_inv p := Prod.ext (restr_glue h p.1 p.2) (restr_glue_compl p.1 p.2)
  right_inv := glue_restr h

@[simp] theorem glueEquiv_apply (h : S ⊆ T) (p : Reg loc S × Reg loc (T \ S)) :
    glueEquiv h p = glue p.1 p.2 := rfl

@[simp] theorem glueEquiv_symm_apply (h : S ⊆ T) (w : Reg loc T) :
    (glueEquiv h).symm w =
      (restr h w, restr (S := T \ S) (T := T) Finset.sdiff_subset w) := rfl

/-- Transport of configurations along an equality of regions
(pattern: vendored `Region/Basic.lean:127`, verbatim). -/
def regEquivOfEq (hst : S = T) : Reg loc S ≃ Reg loc T where
  toFun := restr (le_of_eq hst.symm)
  invFun := restr (le_of_eq hst)
  left_inv _ := rfl
  right_inv _ := rfl

@[simp] theorem regEquivOfEq_apply (hst : S = T) (z : Reg loc S) :
    regEquivOfEq hst z = restr (le_of_eq hst.symm) z := rfl

@[simp] theorem regEquivOfEq_symm_apply (hst : S = T) (w : Reg loc T) :
    (regEquivOfEq (loc := loc) hst).symm w = restr (le_of_eq hst) w := rfl

section DecEqLoc

variable [DecidableEq σ] [∀ i, DecidableEq (loc i)] {𝕜 : Type*} [RCLike 𝕜]

/-- Extension by the identity kills zero (pattern: vendored
`Region/PartialTrace.lean:205`). -/
@[simp] theorem extendId_zero (h : S ⊆ T) :
    extendId h (0 : Matrix (Reg loc S) (Reg loc S) 𝕜) = 0 := by
  ext w w'
  simp [extendId]

/-- Extension by the identity is additive (pattern: vendored
`Region/PartialTrace.lean:211`). -/
@[simp] theorem extendId_add (h : S ⊆ T) (A B : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId h (A + B) = extendId h A + extendId h B := by
  ext w w'
  simp [extendId, apply_ite₂]

/-- Extension by the identity commutes with finite sums (pattern: vendored
`Region/PartialTrace.lean:267`). -/
theorem extendId_sum {κ : Type*} (h : S ⊆ T) (s : Finset κ)
    (f : κ → Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId h (∑ k ∈ s, f k) = ∑ k ∈ s, extendId h (f k) :=
  map_sum (AddMonoidHom.mk' (extendId h) (extendId_add h)) f s

/-- How `extendId` acts on glued configurations: diagonal on the added region, `A` on
the subregion (pattern: vendored `Region/PartialTrace.lean:224`). -/
@[simp] theorem extendId_apply_glue (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜)
    (u u' : Reg loc S) (z z' : Reg loc (T \ S)) :
    extendId h A (glue u z) (glue u' z') = if z = z' then A u u' else 0 := by
  simp only [extendId, Matrix.of_apply]
  rw [restr_glue_compl, restr_glue_compl, restr_glue, restr_glue]

/-- Extension by the identity is transitive: `(A ⊗ 1_{T∖S}) ⊗ 1_{V∖T} = A ⊗ 1_{V∖S}`
(pattern: vendored `Region.lean:404`). -/
theorem extendId_extendId {V : Finset σ} (hST : S ⊆ T) (hTV : T ⊆ V)
    (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId hTV (extendId hST A) = extendId (hST.trans hTV) A := by
  ext w w'
  have hiff : (restr (S := V \ T) (T := V) Finset.sdiff_subset w =
        restr (S := V \ T) (T := V) Finset.sdiff_subset w' ∧
      restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w) =
        restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w')) ↔
      restr (S := V \ S) (T := V) Finset.sdiff_subset w =
        restr (S := V \ S) (T := V) Finset.sdiff_subset w' := by
    simp only [restr, Finset.restrict₂, funext_iff, Subtype.forall, Finset.mem_sdiff]
    constructor
    · rintro ⟨h1, h2⟩ i ⟨hiV, hiS⟩
      by_cases hiT : (i : σ) ∈ T
      · exact h2 i ⟨hiT, hiS⟩
      · exact h1 i ⟨hiV, hiT⟩
    · intro h
      exact ⟨fun i hi ↦ h i ⟨hi.1, fun hS ↦ hi.2 (hST hS)⟩, fun i hi ↦ h i ⟨hTV hi.1, hi.2⟩⟩
  simp only [extendId, Matrix.of_apply]
  by_cases hc1 : restr (S := V \ T) (T := V) Finset.sdiff_subset w =
      restr (S := V \ T) (T := V) Finset.sdiff_subset w'
  · by_cases hc2 : restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w) =
        restr (S := T \ S) (T := T) Finset.sdiff_subset (restr hTV w')
    · rw [if_pos hc1, if_pos hc2, if_pos (hiff.1 ⟨hc1, hc2⟩)]
      rfl
    · rw [if_pos hc1, if_neg hc2, if_neg (fun hc3 => hc2 (hiff.2 hc3).2)]
  · rw [if_neg hc1, if_neg (fun hc3 => hc1 (hiff.2 hc3).1)]

/-- Extension by the identity preserves Hermitianness (pattern: vendored
`Region/PartialTrace.lean:248`; proved entrywise here). -/
theorem isHermitian_extendId (h : S ⊆ T) {A : Matrix (Reg loc S) (Reg loc S) 𝕜}
    (hA : A.IsHermitian) : (extendId h A).IsHermitian := by
  rw [Matrix.IsHermitian]
  ext w w'
  simp only [Matrix.conjTranspose_apply, extendId, Matrix.of_apply]
  by_cases hc : restr (S := T \ S) (T := T) Finset.sdiff_subset w =
      restr (S := T \ S) (T := T) Finset.sdiff_subset w'
  · rw [if_pos hc.symm, if_pos hc, ← Matrix.conjTranspose_apply, hA]
  · rw [if_neg (fun hh => hc hh.symm), if_neg hc, star_zero]

end DecEqLoc

end Region

/-! ## P2 support layer II — the L2 operator norm under relabelling and identity padding

Mathlib (pin `ff2494ea`) carries the L2-operator-norm C*-structure on matrices
(`Mathlib/Analysis/CStarAlgebra/Matrix.lean`) but has no submatrix/reindexing bound and
no identity-Kronecker padding bound; both are re-proved here at the needed generality
(patterns: the donor tree's mathlib-extension file
`AreaLawForMathlib/Analysis/CStarAlgebra/Matrix.lean:60–104`, mathlib-only in content).
Recorded in `A2-gaps.md`. -/

section L2OpNorm

open scoped Matrix.Norms.L2Operator Kronecker
open Matrix

variable {𝕜 : Type*} [RCLike 𝕜] {m n p q ι : Type*}
  [Fintype m] [Fintype n] [Fintype p] [Fintype q]
  [DecidableEq m] [DecidableEq n] [DecidableEq p] [DecidableEq q]

/-- The Euclidean norm of a subvector along an injection: injectivity keeps a
coordinate from being counted twice. -/
theorem euclidean_norm_comp_le (y : n → 𝕜) {f : p → n} (hf : Function.Injective f) :
    ‖(EuclideanSpace.equiv p 𝕜).symm (y ∘ f)‖ ≤ ‖(EuclideanSpace.equiv n 𝕜).symm y‖ := by
  rw [EuclideanSpace.norm_eq, EuclideanSpace.norm_eq]
  gcongr
  exact (Finset.sum_map _ ⟨f, hf⟩ fun j => ‖y j‖ ^ 2).symm.trans_le
    (Finset.sum_le_univ_sum_of_nonneg fun _ => by positivity)

/-- Upper-bound criterion for the L2 operator norm; the converse direction is
`Matrix.l2_opNorm_mulVec`. -/
theorem l2_opNorm_le_bound (A : Matrix m n 𝕜) {c : ℝ} (hc : 0 ≤ c)
    (h : ∀ x : EuclideanSpace 𝕜 n,
      ‖(EuclideanSpace.equiv m 𝕜).symm (A *ᵥ WithLp.ofLp x)‖ ≤ c * ‖x‖) : ‖A‖ ≤ c :=
  ContinuousLinearMap.opNorm_le_bound _ hc h

/-- Selecting rows along an injection cannot increase the norm. -/
theorem l2_opNorm_submatrix_id_le (A : Matrix m n 𝕜) {f : p → m}
    (hf : Function.Injective f) : ‖A.submatrix f id‖ ≤ ‖A‖ :=
  l2_opNorm_le_bound _ (norm_nonneg _) fun x =>
    (euclidean_norm_comp_le (A *ᵥ WithLp.ofLp x) hf).trans (Matrix.l2_opNorm_mulVec A x)

/-- Taking a submatrix along injections does not increase the L2 operator norm.
Injectivity is necessary: duplicating the row of `(1 : Matrix Unit Unit ℝ)` gives norm
`√2`. -/
theorem l2_opNorm_submatrix_le (A : Matrix m n 𝕜)
    {f : p → m} {g : q → n} (hf : Function.Injective f) (hg : Function.Injective g) :
    ‖A.submatrix f g‖ ≤ ‖A‖ := by
  classical
  refine le_trans ?_ (l2_opNorm_submatrix_id_le A hf)
  rw [← Matrix.l2_opNorm_conjTranspose (A.submatrix f id), ← Matrix.l2_opNorm_conjTranspose]
  exact l2_opNorm_submatrix_id_le (A.submatrix f id)ᴴ hg

/-- The L2 operator norm is invariant under reindexing along equivalences. -/
@[simp] theorem l2_opNorm_submatrix (A : Matrix m n 𝕜) (e : p ≃ m) (f : q ≃ n) :
    ‖A.submatrix e f‖ = ‖A‖ :=
  le_antisymm (l2_opNorm_submatrix_le A e.injective f.injective)
    (by simpa using l2_opNorm_submatrix_le (A.submatrix e f) e.symm.injective f.symm.injective)

/-- Pythagoras over a product index. -/
theorem euclidean_norm_sq_prod (v : EuclideanSpace 𝕜 (m × p)) :
    ‖v‖ ^ 2 = ∑ b : p, ‖(EuclideanSpace.equiv m 𝕜).symm fun i => v.ofLp (i, b)‖ ^ 2 := by
  simp [EuclideanSpace.norm_sq_eq, Fintype.sum_prod_type_right]

/-- `A ⊗ₖ 1` acts fibrewise: on the fibre over `b` of the second factor it is `A`. -/
theorem kronecker_one_mulVec_apply [DecidableEq p] [Fintype ι] (A : Matrix ι n 𝕜)
    (v : n × p → 𝕜) (i : ι) (b : p) :
    ((A ⊗ₖ (1 : Matrix p p 𝕜)) *ᵥ v) (i, b) = (A *ᵥ fun j => v (j, b)) i := by
  simp only [mulVec, dotProduct, Matrix.kroneckerMap_apply, Fintype.sum_prod_type,
    Matrix.one_apply, Prod.mk.injEq, mul_ite, mul_zero, mul_one, Finset.sum_ite_eq,
    Finset.sum_ite_eq']
  simp

/-- Padding on the right by an identity factor does not increase the L2 operator norm. -/
theorem l2_opNorm_kronecker_one_le [DecidableEq p] (A : Matrix m n 𝕜) :
    ‖A ⊗ₖ (1 : Matrix p p 𝕜)‖ ≤ ‖A‖ := by
  refine l2_opNorm_le_bound _ (norm_nonneg _) fun x => ?_
  refine (sq_le_sq₀ (norm_nonneg _) (by positivity)).mp ?_
  rw [euclidean_norm_sq_prod, mul_pow, euclidean_norm_sq_prod, Finset.mul_sum]
  simp_rw [← mul_pow]
  gcongr with b _
  simpa [kronecker_one_mulVec_apply] using
    Matrix.l2_opNorm_mulVec A ((EuclideanSpace.equiv n 𝕜).symm fun j => x.ofLp (j, b))

variable {σ : Type*} [DecidableEq σ] {loc : σ → Type*} [∀ i, Fintype (loc i)]
  [∀ i, DecidableEq (loc i)] {S T : Finset σ}

/-- `extendId` is the Kronecker product with the identity, transported along `glueEquiv`
(pattern: vendored `Region/PartialTrace.lean:230`). -/
theorem extendId_eq_kronecker (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    extendId h A = (Matrix.kroneckerMap (· * ·) A
        (1 : Matrix (Reg loc (T \ S)) (Reg loc (T \ S)) 𝕜)).submatrix
      (glueEquiv h).symm (glueEquiv h).symm := by
  ext w w'
  simp [extendId, Matrix.one_apply, Matrix.kroneckerMap_apply, Matrix.submatrix_apply]

/-- Extension by the identity does not increase the L2 operator norm
(pattern: vendored `Region/PartialTrace.lean:274`). -/
theorem l2_opNorm_extendId_le (h : S ⊆ T) (A : Matrix (Reg loc S) (Reg loc S) 𝕜) :
    ‖extendId h A‖ ≤ ‖A‖ := by
  rw [extendId_eq_kronecker, l2_opNorm_submatrix]
  exact l2_opNorm_kronecker_one_le A

end L2OpNorm

/-! ## P2 support layer III — the spectral entropy under relabelling

`Arealaw.vonNeumann` (P0) equals the Shannon entropy of the eigenvalue family, and
relabeling the index preserves it. Mathlib has the pieces (`IsHermitian.cfc`,
`IsHermitian.eigenvalues`, `charpoly_reindex`) but neither the trace-of-cfc bridge nor
the invariance; re-proved here (patterns: the donor tree's mathlib-extension files
`QuantumInfo/ClassicalInfo/Entropy.lean` and `QuantumInfo/Entropy/VonNeumann.lean`,
mathlib-only in content). Recorded in `A2-gaps.md`. -/

section Entropy

open Matrix

variable {𝕜 : Type*} [RCLike 𝕜] {n : Type*} [Fintype n] [DecidableEq n]

/-- Shannon entropy of a finite real family `p : ι → ℝ`, `H p = ∑ i, -p i · log (p i)`. -/
noncomputable def H {ι : Type*} [Fintype ι] (p : ι → ℝ) : ℝ := ∑ i, Real.negMulLog (p i)

/-- `H p` is the sum of `Real.negMulLog` over the multiset of values of `p`. -/
theorem H_eq_multiset_sum {ι : Type*} [Fintype ι] (p : ι → ℝ) :
    H p = (Multiset.map (fun x => Real.negMulLog x) (Finset.univ.val.map p)).sum := by
  rw [H, Finset.sum_eq_multiset_sum, Multiset.map_map, Function.comp_def]

/-- `H` depends only on the multiset of values. -/
theorem H_eq_of_multiset_eq {ι κ : Type*} [Fintype ι] [Fintype κ] {p : ι → ℝ} {q : κ → ℝ}
    (h : Finset.univ.val.map p = Finset.univ.val.map q) : H p = H q := by
  rw [H_eq_multiset_sum, H_eq_multiset_sum, h]

/-- Trace-spectrum bridge: for Hermitian `A` and real `f`, the trace of `f(A)` is
`∑ f(eigenvalueᵢ)`. -/
theorem trace_cfc {A : Matrix n n 𝕜} (hA : A.IsHermitian) (f : ℝ → ℝ) :
    (hA.cfc f).trace = ∑ i, ((f (hA.eigenvalues i) : ℝ) : 𝕜) := by
  simp [IsHermitian.cfc, trace_mul_cycle]

/-- The operator definition `-tr(ρ log ρ)` equals the Shannon entropy of the
eigenvalues. -/
theorem vonNeumann_eq_H {ρ : Matrix n n 𝕜} (hρ : ρ.IsHermitian) :
    vonNeumann hρ = H hρ.eigenvalues := by
  simp [vonNeumann, trace_cfc, H, Real.negMulLog]

/-- Reindexing a Hermitian matrix leaves its eigenvalue multiset unchanged. -/
theorem eigenvalues_multiset_submatrix_equiv {m : Type*} [Fintype m] [DecidableEq m]
    {A : Matrix n n 𝕜} (hA : A.IsHermitian) (e : m ≃ n) :
    Finset.univ.val.map (hA.submatrix e).eigenvalues = Finset.univ.val.map hA.eigenvalues := by
  refine Multiset.map_injective (RCLike.ofReal_injective (K := 𝕜)) ?_
  rw [Multiset.map_map, Multiset.map_map, ← (hA.submatrix e).roots_charpoly_eq_eigenvalues,
    ← hA.roots_charpoly_eq_eigenvalues]
  exact congrArg Polynomial.roots (charpoly_reindex e.symm A)

/-- The von Neumann entropy does not see a relabelling of the index. -/
theorem vonNeumann_submatrix_equiv {m : Type*} [Fintype m] [DecidableEq m]
    {A : Matrix n n 𝕜} (hA : A.IsHermitian) (e : m ≃ n) :
    vonNeumann (hA.submatrix e) = vonNeumann hA := by
  simpa [vonNeumann_eq_H] using H_eq_of_multiset_eq (eigenvalues_multiset_submatrix_equiv hA e)

end Entropy

end Arealaw

namespace OpenAI.AL3D

open Arealaw
open scoped Matrix.Norms.L2Operator
open Matrix SimpleGraph

/-! ## P2 support layer IV — planar boxes (support packing at `G ≤ planarLattice`)

The donor's `card_le_of_mem_supports` chain (`Cylinder3DSupport.lean:150–261`), ported
to the ambient-graph `supportsG` at any `G ≤ planarLattice`: subgraphs have larger
distances, so a `G`-admissible support is a planar admissible support, of size at most
`(2R+1)²`. -/

/-- Distances shrink when the graph grows: `G ≤ H` gives `H.edist ≤ (G.induce s).edist`
on `s` (mathlib's `SimpleGraph.Hom.edist_le` along the coe-hom). -/
theorem edist_induce_le_of_adj_le {V : Type*} {G H : SimpleGraph V} (h : G ≤ H) (s : Set V)
    (u v : s) : (H.induce s).edist u v ≤ (G.induce s).edist u v := by
  exact SimpleGraph.Hom.edist_le
    (RelHom.mk (fun x : s => x) fun hadj => h hadj) u v

/-- The ambient distance on `ℤ × ℤ` is the sup-distance of the coordinates
(donor `Cylinder3DSupport.lean:186`). -/
theorem planar_dist_eq_max_abs (x y : ℤ × ℤ) :
    dist x y = ((max |x.1 - y.1| |x.2 - y.2| : ℤ) : ℝ) := by
  rw [Prod.dist_eq, Int.dist_eq, Int.dist_eq]
  push_cast
  rfl

theorem planar_dist_le_iff {x y : ℤ × ℤ} {k : ℕ} :
    dist x y ≤ k ↔ |x.1 - y.1| ≤ k ∧ |x.2 - y.2| ≤ k := by
  rw [planar_dist_eq_max_abs, ← Int.cast_natCast (R := ℝ), Int.cast_le, max_le_iff]

/-- Adjacent sites of the square lattice are at sup-distance one (donor
`Cylinder3DSupport.lean:194`, via A1's `planar_adj_iff`). -/
theorem planar_dist_eq_one_of_adj {x y : ℤ × ℤ} (h : planarLattice.Adj x y) :
    dist x y = 1 := by
  rw [planar_adj_iff] at h
  rw [planar_dist_eq_max_abs, Int.cast_eq_one]
  rcases h with ⟨h1 | h1, h2⟩ | ⟨h1 | h1, h2⟩ <;> simp [h2, ← h1]

/-- A walk of length `k` in an induced subgraph of the square lattice moves the
sup-distance by at most `k` (donor `Cylinder3DSupport.lean:198`). -/
theorem planar_dist_le_length_of_walk {s : Set (ℤ × ℤ)} {u v : s}
    (p : (planarLattice.induce s).Walk u v) : dist (u : ℤ × ℤ) v ≤ p.length := by
  induction p with
  | nil => simp
  | cons h p ih =>
      rw [Walk.length_cons, Nat.cast_add_one, add_comm]
      exact (dist_triangle _ _ _).trans
        (add_le_add (planar_dist_eq_one_of_adj (SimpleGraph.induce_adj.1 h)).le ih)

/-- A walk of length at most `n` exists iff the graph distance is at most `n`
(donor `Cylinder3DSupport.lean:203`). -/
theorem exists_walk_length_le_iff_edist_le {V : Type*} (G : SimpleGraph V) {u v : V} {n : ℕ} :
    (∃ p : G.Walk u v, p.length ≤ n) ↔ G.edist u v ≤ n := by
  constructor
  · rintro ⟨p, hp⟩
    exact p.edist_le.trans (by exact_mod_cast hp)
  · intro h
    obtain ⟨p, hp⟩ := SimpleGraph.exists_walk_of_edist_ne_top (ne_top_of_le_ne_top (by simp) h)
    exact ⟨p, by exact_mod_cast hp ▸ h⟩

/-- The ambient planar distance is bounded by the `G`-domain distance at any
`G ≤ planarLattice`. -/
theorem planar_dist_le_of_domainEDistG_le {G : SimpleGraph (ℤ × ℤ)} {Λ' : Finset (ℤ × ℤ)}
    {x y : ℤ × ℤ} {k : ℕ} (hG : G ≤ planarLattice) (h : domainEDistG G Λ' x y ≤ k) :
    dist x y ≤ k := by
  by_cases hxy : x ∈ Λ' ∧ y ∈ Λ'
  · have hmono : (planarLattice.induce (Λ' : Set (ℤ × ℤ))).edist ⟨x, hxy.1⟩ ⟨y, hxy.2⟩ ≤
        (G.induce (Λ' : Set (ℤ × ℤ))).edist ⟨x, hxy.1⟩ ⟨y, hxy.2⟩ :=
      edist_induce_le_of_adj_le hG (Λ' : Set (ℤ × ℤ)) ⟨x, hxy.1⟩ ⟨y, hxy.2⟩
    rw [domainEDistG_of_mem hxy.1 hxy.2] at h
    obtain ⟨p, hp⟩ := (exists_walk_length_le_iff_edist_le _).2 (hmono.trans h)
    exact (planar_dist_le_length_of_walk p).trans (by exact_mod_cast hp)
  · rw [domainEDistG, dif_neg hxy] at h
    exact absurd h (by simp)

theorem domainEDiamG_le_iff {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)} {r : ℕ∞} :
    domainEDiamG G Λ' X' ≤ r ↔ ∀ x ∈ X', ∀ y ∈ X', domainEDistG G Λ' x y ≤ r := by
  simp only [domainEDiamG, iSup₂_le_iff]

theorem mem_supportsG_iff {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)} {R : ℕ} :
    X' ∈ supportsG G Λ' R ↔ X' ⊆ Λ' ∧ X'.Nonempty ∧ domainEDiamG G Λ' X' ≤ R := by
  simp only [supportsG, Finset.mem_filter, Finset.mem_powerset]

/-- A `G`-admissible support of range `R` containing `a` lies in the planar box
`[a - (R, R), a + (R, R)]` (donor `Cylinder3DSupport.lean:226`, at ambient `G`). -/
theorem subset_Icc_of_mem_supportsG {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)}
    {R : ℕ} (hG : G ≤ planarLattice) (hX' : X' ∈ supportsG G Λ' R) {a : ℤ × ℤ}
    (ha : a ∈ X') :
    X' ⊆ Finset.Icc (a - ((R : ℤ), (R : ℤ))) (a + ((R : ℤ), (R : ℤ))) := by
  intro x hx
  obtain ⟨h1, h2⟩ := planar_dist_le_iff.1 <|
    planar_dist_le_of_domainEDistG_le hG
      (domainEDiamG_le_iff.1 ((mem_supportsG_iff.1 hX').2.2) x hx a ha)
  rw [abs_le] at h1 h2
  rw [Finset.mem_Icc, Prod.le_def, Prod.le_def]
  simp only [Prod.fst_sub, Prod.snd_sub, Prod.fst_add, Prod.snd_add]
  omega

theorem card_Icc_eq_mul (a b : ℤ × ℤ) :
    (Finset.Icc a b).card = (b.1 + 1 - a.1).toNat * (b.2 + 1 - a.2).toNat := by
  rw [Finset.card_Icc_prod, Int.card_Icc, Int.card_Icc]

theorem card_Icc_sub_add (a : ℤ × ℤ) (R : ℕ) :
    (Finset.Icc (a - ((R : ℤ), (R : ℤ))) (a + ((R : ℤ), (R : ℤ)))).card = (2 * R + 1) ^ 2 := by
  rw [card_Icc_eq_mul, sq]
  simp only [Prod.fst_sub, Prod.snd_sub, Prod.fst_add, Prod.snd_add]
  congr 1 <;> omega

/-- A `G`-admissible support of range `R` has at most `(2R + 1)²` sites, at any ambient
`G ≤ planarLattice` (donor `Cylinder3DSupport.lean:247`, at ambient `G`). -/
theorem card_le_of_mem_supportsG {G : SimpleGraph (ℤ × ℤ)} {Λ' X' : Finset (ℤ × ℤ)} {R : ℕ}
    (hG : G ≤ planarLattice) (hX' : X' ∈ supportsG G Λ' R) : X'.card ≤ (2 * R + 1) ^ 2 := by
  obtain ⟨a, ha⟩ := (mem_supportsG_iff.1 hX').2.1
  exact (Finset.card_le_card (subset_Icc_of_mem_supportsG hG hX' ha)).trans
    (card_Icc_sub_add a R).le

/-! ## P2-c — the projected interaction `Ψ` and its admissibility -/

/-- The supports of the 3D interaction that group onto the planar support `X'`: subsets
`X ⊆ Λ` whose column projection is exactly `X'` (the donor's `fibre h X'`
(`Cylinder3D.lean:249`) at variable heights — no cylinder, so defined directly as a
filter of the powerset). -/
def projFib (Λ : Finset (ℤ × ℤ × ℤ)) (X' : Finset (ℤ × ℤ)) :
    Finset (Finset (ℤ × ℤ × ℤ)) :=
  Λ.powerset.filter fun X => X.image proj = X'

theorem mem_projFib {Λ : Finset (ℤ × ℤ × ℤ)} {X : Finset (ℤ × ℤ × ℤ)}
    {X' : Finset (ℤ × ℤ)} : X ∈ projFib Λ X' ↔ X ⊆ Λ ∧ X.image proj = X' := by
  simp only [projFib, Finset.mem_filter, Finset.mem_powerset]

theorem subset_fibre_of_mem_projFib {Λ : Finset (ℤ × ℤ × ℤ)} {X : Finset (ℤ × ℤ × ℤ)}
    {X' : Finset (ℤ × ℤ)} (hX : X ∈ projFib Λ X') : X ⊆ fibre Λ X' := by
  intro x hx
  refine Finset.mem_filter.2 ⟨(mem_projFib.1 hX).1 hx, ?_⟩
  rw [← (mem_projFib.1 hX).2]
  exact Finset.mem_image_of_mem proj hx

/-- The grouping fibre over `X'` has at most `2 ^ (h * |X'|)` members (donor
`card_fibre_le`, `Cylinder3D.lean:264`; consumes A1's `fibre_card_le`). -/
theorem card_projFib_le (h : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)} (hΛ : IsSlabDomain3D h Λ)
    {X' : Finset (ℤ × ℤ)} : (projFib Λ X').card ≤ 2 ^ (h * X'.card) := by
  refine le_trans (Finset.card_le_card fun X hX =>
    Finset.mem_powerset.2 (subset_fibre_of_mem_projFib hX)) ?_
  rw [Finset.card_powerset]
  exact Nat.pow_le_pow_right two_pos (fibre_card_le h hΛ X')

/- The column enumeration used by the relabelling (`col Λ u` indexed as
`Fin (colCard Λ u)`; REGION-INDEPENDENT — this is what the P2-d transport rides on).
M0-REBUILD 2026-11-19: the `colToFin` def itself moved up to the P2-b core (the
canonical z-rank enumeration, `colZImage`/`colZRank`); `colSiteOf`/`colIdxOf` below
consume it unchanged. -/

/-- The 3D site of column `u` at enumeration index `i`, as an element of the fibre
(the membership proof: a column site is in `Λ` and projects to `u ∈ X'`). -/
noncomputable def colSiteOf (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} (u : ℤ × ℤ)
    (hu : u ∈ X') (i : Fin (colCard Λ u)) :
    ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) :=
  ⟨((colToFin Λ u).symm i : ℤ × ℤ × ℤ), by
    have hx := Finset.mem_filter.1 ((colToFin Λ u).symm i).2
    exact Finset.mem_filter.2 ⟨hx.1, by rw [hx.2]; exact hu⟩⟩

/-- The enumeration index of a fibre site in its own column. -/
noncomputable def colIdxOf (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)}
    (x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ))) :
    Fin (colCard Λ (proj (x : ℤ × ℤ × ℤ))) :=
  colToFin Λ (proj (x : ℤ × ℤ × ℤ))
    ⟨(x : ℤ × ℤ × ℤ), mem_col_of_proj Λ _ (Finset.mem_filter.1 x.2).1 rfl⟩

noncomputable def colEquivVarToFun (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) (X' : Finset (ℤ × ℤ)) :
    (∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) →
      (∀ x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) :=
  fun f x =>
    (finFunctionFinEquiv (m := q) (n := colCard Λ (proj (x : ℤ × ℤ × ℤ))).symm
        (f ⟨proj (x : ℤ × ℤ × ℤ), (Finset.mem_filter.1 x.2).2⟩))
      (colIdxOf Λ x)

noncomputable def colEquivVarInvFun (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) (X' : Finset (ℤ × ℤ)) :
    (∀ x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) →
      (∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) :=
  fun g u =>
    finFunctionFinEquiv (m := q) (n := colCard Λ (u : ℤ × ℤ))
      fun i => g (colSiteOf Λ (u : ℤ × ℤ) u.2 i)

theorem projF_fibre (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ) :
    projF (fibre Λ X') = X' := by
  ext u
  simp only [projF, Finset.mem_image, fibre, Finset.mem_filter]
  constructor
  · rintro ⟨y, ⟨-, hy⟩, rfl⟩
    exact hy
  · intro hu
    obtain ⟨y, hyΛ, rfl⟩ := mem_projF (hX' hu)
    exact ⟨y, ⟨hyΛ, hu⟩, rfl⟩

/-- The fibre's columns are `Λ`'s columns (`u ∈ X'` suffices; no `X' ⊆ projF Λ` needed). -/
theorem col_fibre_eq (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} {u : ℤ × ℤ}
    (hu : u ∈ X') : col (fibre Λ X') u = col Λ u := by
  ext y
  simp only [col, fibre, Finset.mem_filter]
  constructor
  · rintro ⟨⟨hyΛ, -⟩, hyu⟩
    exact ⟨hyΛ, hyu⟩
  · rintro ⟨hyΛ, hyu⟩
    exact ⟨⟨hyΛ, by rw [hyu]; exact hu⟩, hyu⟩

theorem colCard_fibre_eq (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} {u : ℤ × ℤ}
    (hu : u ∈ X') : colCard (fibre Λ X') u = colCard Λ u := by
  rw [colCard_eq_card, colCard_eq_card]
  exact congrArg Finset.card (col_fibre_eq Λ hu)

/-- CONGRUENCE, FIBRE INSTANCE (M1's exact feed): the canonical z-rank is insensitive
to restricting `Λ` to the fibre over `X'` — the two columns are propositionally equal
(`col_fibre_eq`), and the canonical enumeration is extensional, so the per-site
comparison closes by rewriting with NO `Eq.rec` (find #5's obstruction dies here). -/
theorem colZRank_fibre (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} {u : ℤ × ℤ}
    (hu : u ∈ X') (x : ℤ × ℤ × ℤ) :
    colZRank (fibre Λ X') u x = colZRank Λ u x :=
  colZRank_congr (col_fibre_eq Λ hu) x

/-- Height-cast along a column-cardinality equality (roundtrips free: `Equiv.cast`). -/
noncomputable def heightCastEquiv (q : ℕ) {a b : ℕ} (h : a = b) : Fin (q ^ a) ≃ Fin (q ^ b) :=
  Equiv.cast (congrArg (fun n => Fin (q ^ n)) h)

/-- **The per-region regrouping equivalence** (the donor's `colEquiv`, `Cylinder3D.lean:78`,
at variable heights), built as an EQUIV-COMPOSITION — P2-b's `regReindexEquiv` instantiated
at the fibre region, transported along `projF_fibre` (index, via `regEquivOfEq` whose
`restr`-based action is proof-irrelevant-transparent) and `colCard_fibre_eq` (heights,
via `heightCastEquiv`) — so both roundtrips are INHERITED from the components and no
per-index choice transport is ever owed (run 23's park, `A2-gaps.md` §4, resolved
2026-11-18: the earlier draft's `Equiv.piCongrLeft'` misapplied `regEquivOfEq` at base
level; the `.symm` of this composite is what P2-d's relabelling consumes). The
pointwise-action functions `colEquivVarToFun`/`colEquivVarInvFun` above document the
donor's entrywise action and are NOT this composite's underlying functions. -/
noncomputable def colEquivVar (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) (X' : Finset (ℤ × ℤ))
    (hX' : X' ⊆ projF Λ) :
    (∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) ≃
      (∀ x : ↥((fibre Λ X' : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q) :=
  ((Equiv.piCongrRight fun u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)) =>
        heightCastEquiv q (colCard_fibre_eq Λ u.2).symm).trans
      (regEquivOfEq (loc := fun u : ℤ × ℤ => Fin (q ^ colCard (fibre Λ X') u))
          (projF_fibre Λ hX')).symm).trans
    (regReindexEquiv (Λ := fibre Λ X') q).symm

/-- The projected (grouped) interaction: on the planar support `X'`, the `Φ`-terms with
column set `X'`, extended to the fibre region and relabelled to variable-height planar
sites (the donor's `colInteraction`, `Cylinder3D.lean:299`, at variable heights). -/
noncomputable def projInteraction (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (X' : Finset (ℤ × ℤ)) :
    Matrix (Reg (fun u => Fin (q ^ colCard Λ u)) X') (Reg (fun u => Fin (q ^ colCard Λ u)) X') 𝕜 :=
  if hX' : X' ⊆ projF Λ then
    (∑ X ∈ projFib Λ X',
        if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0).submatrix
      (colEquivVar Λ q X' hX') (colEquivVar Λ q X' hX')
  else 0

/-- The projected interaction is Hermitian. -/
theorem projInteraction_isHermitian {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    {J : ℝ} {R : ℕ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ) :
    (projInteraction Λ q Φ X').IsHermitian := by
  rw [projInteraction, dif_pos hX']
  have hsum : (∑ X ∈ projFib Λ X',
      if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0).IsHermitian :=
    (isSelfAdjoint_sum _ fun X hX => by
      by_cases hXf : X ⊆ fibre Λ X'
      · rw [dif_pos hXf]
        exact (isHermitian_extendId _ (hΦ X (mem_projFib.1 hX).1).1).isSelfAdjoint
      · rw [dif_neg hXf]
        exact IsSelfAdjoint.zero _).isHermitian
  exact Matrix.IsHermitian.submatrix hsum _

/-- 3D admissible supports project to `G`-admissible supports (P1-a's diameter
contraction, membership form; feeds the zero clause). -/
theorem image_projF_mem_supportsG {Λ X : Finset (ℤ × ℤ × ℤ)} {R : ℕ} (hXΛ : X ⊆ Λ)
    (hX : X ∈ supports3D Λ R) : X.image proj ∈ supportsG (projLattice Λ) (projF Λ) R := by
  rw [supports3D, Finset.mem_filter, Finset.mem_powerset] at hX
  obtain ⟨-, hne, hdiam⟩ := hX
  rw [supportsG, Finset.mem_filter, Finset.mem_powerset]
  refine ⟨?_, hne.image _, ?_⟩
  · exact Finset.image_subset_image hXΛ
  · exact (proj_diam_le Λ X hXΛ).trans hdiam

/-- The projected interaction vanishes off the `G`-admissible planar supports. -/
theorem projInteraction_eq_zero {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    {J : ℝ} {R : ℕ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) {X' : Finset (ℤ × ℤ)}
    (hX' : X' ⊆ projF Λ) (hs : X' ∉ supportsG (projLattice Λ) (projF Λ) R) :
    projInteraction Λ q Φ X' = 0 := by
  rw [projInteraction, dif_pos hX']
  have hzero : ∀ X ∈ projFib Λ X',
      (if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0) = 0 := by
    intro X hX
    have hXΛ : X ⊆ Λ := (mem_projFib.1 hX).1
    have hΦ0 : Φ X = 0 := (hΦ X hXΛ).2.2 fun hXs =>
      hs (by rw [← (mem_projFib.1 hX).2]; exact image_projF_mem_supportsG hXΛ hXs)
    rw [dif_pos (subset_fibre_of_mem_projFib hX), hΦ0, extendId_zero]
  rw [Finset.sum_congr rfl hzero, Finset.sum_const_zero]
  rfl

/-- The projected interaction's strength is the grouped bound `2 ^ (h (2R+1)²) max J 1`
(find #3's `groupStrength`; donor `isAdmissible_colInteraction`, `Cylinder3D.lean:333`). -/
theorem projInteraction_norm_le (h R : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)}
    (hΛ : IsSlabDomain3D h Λ) (q : ℕ) {𝕜 : Type*} [RCLike 𝕜] {J : ℝ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ) :
    ‖projInteraction Λ q Φ X'‖ ≤ groupStrength h R J := by
  have hJ : 0 ≤ J := (norm_nonneg _).trans (hΦ ∅ (Finset.empty_subset _)).2.1
  by_cases hs : X' ∈ supportsG (projLattice Λ) (projF Λ) R
  · rw [projInteraction, dif_pos hX', l2_opNorm_submatrix]
    have hterm : ∀ X ∈ projFib Λ X',
        ‖(if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0)‖ ≤ J := by
      intro X hX
      by_cases hXf : X ⊆ fibre Λ X'
      · rw [dif_pos hXf]
        exact (l2_opNorm_extendId_le _ _).trans (hΦ X (mem_projFib.1 hX).1).2.1
      · rw [dif_neg hXf, norm_zero]
        exact hJ
    have hcard : ((projFib Λ X').card : ℝ) ≤ 2 ^ (h * (2 * R + 1) ^ 2) := by
      have h2 : h * X'.card ≤ h * (2 * R + 1) ^ 2 :=
        Nat.mul_le_mul_left h (card_le_of_mem_supportsG (projLattice_le_plan Λ) hs)
      exact_mod_cast (card_projFib_le h hΛ).trans (Nat.pow_le_pow_right two_pos h2)
    calc ‖∑ X ∈ projFib Λ X', if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0‖
          ≤ ∑ X ∈ projFib Λ X', ‖(if hX : X ⊆ fibre Λ X' then extendId hX (Φ X) else 0)‖ :=
        norm_sum_le _ _
      _ ≤ ∑ _X ∈ projFib Λ X', J := Finset.sum_le_sum hterm
      _ = (projFib Λ X').card * J := by rw [Finset.sum_const, nsmul_eq_mul]
      _ ≤ 2 ^ (h * (2 * R + 1) ^ 2) * max J 1 :=
        mul_le_mul hcard (le_max_left J 1) hJ (by positivity)
      _ = groupStrength h R J := by rw [groupStrength, mul_comm]
  · rw [projInteraction_eq_zero q Φ hΦ hX' hs, norm_zero, groupStrength]
    exact mul_nonneg (pow_nonneg (by norm_num) _) (le_trans zero_le_one (le_max_right J 1))

/-- **P2-c MAIN**: the projected interaction is `(R, groupStrength h R J)`-admissible at
`G := projLattice Λ`, heights `colCard Λ ·` — the planar binder's admissibility side. -/
theorem isAdmissible_projInteraction (h R : ℕ) {Λ : Finset (ℤ × ℤ × ℤ)}
    (hΛ : IsSlabDomain3D h Λ) (q : ℕ) {𝕜 : Type*} [RCLike 𝕜] {J : ℝ}
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    (hΦ : IsAdmissible3D Λ R J Φ) :
    IsAdmissibleVar (projLattice Λ) (projF Λ) R (groupStrength h R J) (colCard Λ)
      (projInteraction Λ q Φ) :=
  fun X' hX' => ⟨projInteraction_isHermitian q Φ hΦ hX',
    projInteraction_norm_le h R hΛ q Φ hΦ hX',
    fun hs => projInteraction_eq_zero q Φ hΦ hX' hs⟩

/-! ## P2-d — transport through the reindexing (generic layer + entrywise API)

The donor's relabelling step, part 1: eigenvector, spectral gap and unit norm transport
along submatrix-conjugation by an equivalence (donor `Cylinder3D.lean` relabelling
chapter; mathlib-only). Entrywise API discipline: everything reducible is stated on the
`toFun` side of `regReindexEquiv` (rfl-transparent); the `Fintype.equivFin` choice
transports that parked P2-c (run 23) live only on the `.symm` side, which is NEVER
unwrapped — `.symm` values are pinned by roundtrips (`Equiv.symm_apply_apply`). -/

section P2d

open scoped MatrixOrder

variable {𝕜 : Type*} [RCLike 𝕜] {ι ι' : Type*} [Fintype ι] [Fintype ι']
  [DecidableEq ι] [DecidableEq ι']

/-- Submatrix-conjugation of a pure projector is the projector of the relabelled
factors (entrywise). -/
theorem vecMulVec_submatrix (v w : ι → 𝕜) (e : ι' ≃ ι) :
    (vecMulVec v w).submatrix e e = vecMulVec (v ∘ e) (w ∘ e) := by
  ext i j
  rfl

/-- The spectral-gap inequality transports along submatrix-conjugation (the donor's
relabelling step, gap side; the Loewner difference conjugates entrywise). -/
theorem hasGlobalGap_submatrix {H : Matrix ι ι 𝕜} {Ω : ι → 𝕜} {E₀ Δ : ℝ}
    (h : HasGlobalGap H Ω E₀ Δ) (e : ι' ≃ ι) :
    HasGlobalGap (H.submatrix e e) (Ω ∘ e) E₀ Δ := by
  unfold HasGlobalGap at h ⊢
  rw [Matrix.le_iff] at h ⊢
  have key : (H.submatrix e e - (E₀ : 𝕜) • 1 - (Δ : 𝕜) • (1 - vecMulVec (Ω ∘ e) (star (Ω ∘ e)))) =
      (H - (E₀ : 𝕜) • 1 - (Δ : 𝕜) • (1 - vecMulVec Ω (star Ω))).submatrix e e := by
    ext i j
    simp [Matrix.submatrix_apply, Matrix.one_apply, Matrix.smul_apply,
      Matrix.sub_apply, Pi.star_apply, Matrix.vecMulVec_apply, e.apply_eq_iff_eq]
  rw [key]
  -- the conjugated Loewner difference is PosSemidef because the original is. Stated via
  -- the anonymous constructor against the (already-elaborated) goal — the
  -- `Matrix.PosSemidef.submatrix` shortcut failed `PartialOrder 𝕜` instance synthesis
  -- in this RCLike-section context (run 9, A2.lean:827), so mathlib's own proof shape is
  -- re-derived inline (PosDef.lean:83–86: `mapDomain` of the quadratic form).
  exact ⟨h.1.submatrix e, fun x => by
    simpa [Finsupp.sum_mapDomain_index, add_mul, mul_add] using h.2 (x.mapDomain e)⟩

/-- The eigen-equation transports along submatrix-conjugation (the donor's relabelling
step, eigenvector side). -/
theorem mulVec_eq_smul_submatrix {H : Matrix ι ι 𝕜} {Ω : ι → 𝕜} {E₀ : ℝ}
    (h : H *ᵥ Ω = (E₀ : 𝕜) • Ω) (e : ι' ≃ ι) :
    H.submatrix e e *ᵥ (Ω ∘ e) = (E₀ : 𝕜) • (Ω ∘ e) := by
  have hcomp : (Ω ∘ e) ∘ e.symm = Ω := funext fun i => by simp
  rw [Matrix.submatrix_mulVec_equiv H (Ω ∘ e) e e, hcomp, h]
  funext i
  simp [Algebra.smul_def, smul_eq_mul]

/-- Unit norm transports along a reindexing (dot-product side; the dotProduct
reindex lemmas live at ROOT namespace on this pin, not under `Matrix`). -/
theorem star_dotProduct_comp {Ω : ι → 𝕜} (hΩ : star Ω ⬝ᵥ Ω = 1) (e : ι' ≃ ι) :
    star (Ω ∘ e) ⬝ᵥ (Ω ∘ e) = 1 := by
  have hstar : star (Ω ∘ e) = (star Ω) ∘ e := funext fun _ => rfl
  have hcomp : (Ω ∘ e) ∘ e.symm = Ω := funext fun i => by simp
  rw [hstar, ← dotProduct_comp_equiv_symm (u := star Ω) (x := Ω ∘ e) e, hcomp, hΩ]

end P2d

/-! ### P2-d entrywise API (toFun side) and fibre/complement plumbing -/

/-- The regrouping's action on a configuration, column by column — the `toFun` side is
rfl-transparent (every component application reduces: `Equiv.trans`, `piCongrLeft'`,
`piCurry`, `piCongrRight`, `colSigmaEquiv.invFun` all whnf-reduce on application). -/
theorem regReindexEquiv_apply (Λ : Finset (ℤ × ℤ × ℤ)) {q : ℕ}
    (w : ∀ a : ↥((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q)
    (u : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ))) :
    regReindexEquiv (Λ := Λ) q w u =
      colRegEquiv (u : ℤ × ℤ)
        (fun s : ↥((col Λ (u : ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)) =>
          w ⟨(s : ℤ × ℤ × ℤ), col_subset Λ (u : ℤ × ℤ) s.2⟩) := rfl

/-- Conjugating the fibre regrouping by the whole-domain regrouping collapses to the
height/index casts (roundtrip form: the `.symm` choice transports cancel against
`regReindexEquiv`, leaving the cast/`regEquivOfEq` tail — the P2-d swap's key). -/
theorem regReindexEquiv_comp_colEquivVar (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ)
    {X' : Finset (ℤ × ℤ)} (hX' : X' ⊆ projF Λ)
    (v : ∀ u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)), Fin (q ^ colCard Λ (u : ℤ × ℤ))) :
    regReindexEquiv (Λ := fibre Λ X') q (colEquivVar Λ q X' hX' v) =
      (regEquivOfEq (loc := fun u : ℤ × ℤ => Fin (q ^ colCard (fibre Λ X') u))
          (projF_fibre Λ hX')).symm
        ((Equiv.piCongrRight fun u : ↥((X' : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)) =>
            heightCastEquiv q (colCard_fibre_eq Λ u.2).symm) v) := by
  simp [colEquivVar, Equiv.trans_apply, Equiv.apply_symm_apply]

/-- The fibre is a subregion of the domain. -/
theorem fibre_subset (Λ : Finset (ℤ × ℤ × ℤ)) (S : Finset (ℤ × ℤ)) :
    fibre Λ S ⊆ Λ :=
  Finset.filter_subset _ _

/-- Off a planar region, the complement of the fibre is the fibre of the complement
(the complement's column decomposition; feeds the P2-d swap's off-region clause —
every `Λ`-site's projection is in `projF Λ`, so the two filters agree). -/
theorem sdiff_fibre_eq (Λ : Finset (ℤ × ℤ × ℤ)) (X' : Finset (ℤ × ℤ)) :
    Λ \ fibre Λ X' = fibre Λ (projF Λ \ X') := by
  ext x
  by_cases hxΛ : x ∈ Λ
  · have hP : proj x ∈ projF Λ := Finset.mem_image_of_mem proj hxΛ
    by_cases hxX : proj x ∈ X'
    · simp [Finset.mem_sdiff, fibre, Finset.mem_filter, hxΛ, hP, hxX]
    · simp [Finset.mem_sdiff, fibre, Finset.mem_filter, hxΛ, hP, hxX]
  · simp [Finset.mem_sdiff, fibre, Finset.mem_filter, hxΛ]

/-! ## P2-d M1 — the restriction-compat workhorse (the find-#5 un-park; 2026-11-19)

The P2-d swap's workhorse (`rebuild-precharter.md` §1, statement verbatim): the column
regrouping COMMUTES with restriction to the fibre. The find-#5 obstruction (two
classical `Fintype.equivFin` instances for the propositionally equal columns
`col Λ u` / `col (fibre Λ X') u` enumerating unrelated) is gone by construction: the
canonical enumeration's per-index sites agree by RANK-PINNING, and the digit-encoding's
height-cast congruence is closed at variable level (no `Eq.rec` on complex terms
anywhere — the one unavoidable `Fin`-cast is handled by `subst` at variable level). -/

/-- Digit-cast congruence of the column encoding (variable-level; closed by `subst`,
so no `Eq.rec` on complex terms). -/
private theorem heightCast_finFunctionFinEquiv {q m n : ℕ} (h : m = n) (f : Fin m → Fin q) :
    heightCastEquiv q h (finFunctionFinEquiv f) =
      finFunctionFinEquiv (fun j : Fin n => f (Fin.cast h.symm j)) := by
  subst h
  rfl

/-- KEY (site-level agreement): the canonical enumeration's inverse legs agree along
the fibre restriction — the site at index `j` of the fibre's column IS the site at
index `Fin.cast h j` of the ambient column (rank-pinned via `colToFin_symm_rank` +
`colZRank_fibre` + `colZRank_inj`). -/
theorem colToFin_symm_fibre (Λ : Finset (ℤ × ℤ × ℤ)) {X' : Finset (ℤ × ℤ)} {u : ℤ × ℤ}
    (hu : u ∈ X') (h : colCard (fibre Λ X') u = colCard Λ u)
    (j : Fin (colCard (fibre Λ X') u)) :
    ((colToFin Λ u).symm (Fin.cast h j) : ℤ × ℤ × ℤ) =
      ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ) := by
  have h1 : ((colToFin Λ u).symm (Fin.cast h j) : ℤ × ℤ × ℤ) ∈ col Λ u :=
    ((colToFin Λ u).symm (Fin.cast h j)).2
  have h2 : ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ) ∈ col (fibre Λ X') u :=
    ((colToFin (fibre Λ X') u).symm j).2
  have h2' : ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ) ∈ col Λ u := by
    -- membership transport WITHOUT rewriting the Finset (dependent-motive hazard):
    -- unfold both columns to their filter forms instead.
    simp only [col, fibre, Finset.mem_filter] at h2 ⊢
    exact ⟨h2.1.1, h2.2⟩
  have r1 : colZRank Λ u ((colToFin Λ u).symm (Fin.cast h j) : ℤ × ℤ × ℤ) =
      (Fin.cast h j : Fin (colCard Λ u)).val := colToFin_symm_rank Λ u _
  have r2 : colZRank (fibre Λ X') u ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ) =
      (j : Fin (colCard (fibre Λ X') u)).val := colToFin_symm_rank _ _ _
  refine colZRank_inj Λ u h1 h2' ?_
  rw [r1, ← colZRank_fibre Λ hu ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ), r2]
  rfl

/-- ENCODING CONGRUENCE (M1's column core): ambient- and fibre-encodings of
raw-site-agreeing column configurations are equal through the height cast. -/
theorem colRegEquiv_fibre_apply {Λ : Finset (ℤ × ℤ × ℤ)} {X' : Finset (ℤ × ℤ)} {q : ℕ}
    {u : ℤ × ℤ} (hu : u ∈ X')
    (F : ∀ s : ↥((col Λ u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q)
    (G : ∀ t : ↥((col (fibre Λ X') u : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)), Fin q)
    (hFG : ∀ s : ℤ × ℤ × ℤ, ∀ hs : s ∈ col Λ u, ∀ hs' : s ∈ col (fibre Λ X') u,
      F ⟨s, hs⟩ = G ⟨s, hs'⟩) :
    heightCastEquiv q (colCard_fibre_eq Λ hu).symm (colRegEquiv (Λ := Λ) u F) =
      colRegEquiv (Λ := fibre Λ X') u G := by
  have rF : colRegEquiv (Λ := Λ) u F =
      finFunctionFinEquiv (fun i : Fin (colCard Λ u) => F ((colToFin Λ u).symm i)) := rfl
  have rG : colRegEquiv (Λ := fibre Λ X') u G =
      finFunctionFinEquiv (fun j : Fin (colCard (fibre Λ X') u) =>
        G ((colToFin (fibre Λ X') u).symm j)) := rfl
  rw [rF, rG, heightCast_finFunctionFinEquiv]
  refine congrArg finFunctionFinEquiv ?_
  funext j
  have hs' : ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ) ∈ col (fibre Λ X') u :=
    ((colToFin (fibre Λ X') u).symm j).2
  have hs : ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ) ∈ col Λ u := by
    -- filter-unfold transport (no Finset rewrite — dependent-motive hazard)
    simp only [col, fibre, Finset.mem_filter] at hs' ⊢
    exact ⟨hs'.1.1, hs'.2⟩
  have hsite : ((colToFin Λ u).symm
          (Fin.cast (colCard_fibre_eq Λ hu).symm.symm j) : ℤ × ℤ × ℤ) =
      ((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ) :=
    colToFin_symm_fibre Λ hu (colCard_fibre_eq Λ hu).symm.symm j
  have hF : (colToFin Λ u).symm (Fin.cast (colCard_fibre_eq Λ hu).symm.symm j)
      = ⟨((colToFin (fibre Λ X') u).symm j : ℤ × ℤ × ℤ), hs⟩ :=
    Subtype.ext hsite
  rw [hF]
  exact hFG _ hs hs'

/-- **M1 MAIN — the restriction-compat workhorse** (the find-#5 un-park;
`rebuild-precharter.md` §1 statement verbatim): the column regrouping commutes with
restriction to the fibre. The proof transforms by the fibre regrouping's injectivity
(the `regReindexEquiv_comp_colEquivVar` roundtrip collapse), then closes per-column by
the encoding congruence `colRegEquiv_fibre_apply` — the raw-site agreement hypothesis
discharges by proof-irrelevance (`rfl`), since both configurations read the same
ambient `x` at the same raw site. -/
theorem colEquivVar_restr (Λ : Finset (ℤ × ℤ × ℤ)) (q : ℕ) {X' : Finset (ℤ × ℤ)}
    (hX' : X' ⊆ projF Λ)
    (x : ∀ a : ↥((Λ : Finset (ℤ × ℤ × ℤ)) : Set (ℤ × ℤ × ℤ)),
      Qudits3D q (a : ℤ × ℤ × ℤ)) :
    colEquivVar Λ q X' hX'
        (restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u)) hX'
          (regReindexEquiv (Λ := Λ) q x)) =
      restr (fibre_subset Λ X') x := by
  refine (regReindexEquiv (Λ := fibre Λ X') q).injective ?_
  rw [regReindexEquiv_comp_colEquivVar]
  funext u
  have huX : (u : ℤ × ℤ) ∈ X' := by
    -- no Finset-rewrite (dependent-motive hazard): destructure through the image
    obtain ⟨y, hyfib, hyu⟩ := Finset.mem_image.1 u.2
    have hy := (Finset.mem_filter.1 hyfib).2
    rw [← hyu]; exact hy
  simp only [regEquivOfEq_symm_apply, restr, Finset.restrict₂_def,
    Equiv.piCongrRight_apply, regReindexEquiv_apply]
  exact colRegEquiv_fibre_apply huX _ _ (fun _ _ _ => rfl)

/-! ## P2-d M2-a — the powerset partition + per-fibre extendId factorization (2026-11-19)

First bankable rung of M2 (`rebuild-precharter.md` §3): the regrouping of
`Λ.powerset` into its `projFib`-fibres (disjoint; every subset's fibre is read off its
column projection) and the factorization of each fibre's `extendId`-sum through the
fibre region — the two structural halves of the Hamiltonian identification. The swap
proper (extend-relabel at the glue level) is the designed M2-b rung; its derived feed
`colEquivVar_restr_apply` (the workhorse's ē-form) lands here. -/

/-- The workhorse in `ē`-form (the swap's feed): the whole-domain regrouping's inverse
`ē := (regReindexEquiv Λ q).symm`, restricted to the fibre, IS the column regrouping
applied to the planar restriction. -/
theorem colEquivVar_restr_apply {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {X' : Finset (ℤ × ℤ)}
    (hX' : X' ⊆ projF Λ)
    (w : ∀ v : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
      Fin (q ^ colCard Λ (v : ℤ × ℤ))) :
    restr (fibre_subset Λ X')
        ((regReindexEquiv (Λ := Λ) q).symm w) =
      colEquivVar Λ q X' hX'
        (restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u)) hX' w) := by
  have h := (colEquivVar_restr Λ q hX'
      ((regReindexEquiv (Λ := Λ) q).symm w)).symm
  rwa [Equiv.apply_symm_apply] at h

/-- `Λ.powerset` is the disjoint union of the `projFib`-fibres over the planar
powerset (every subset of `Λ` lands in the fibre of its own column projection). -/
theorem powerset_eq_biUnion_projFib (Λ : Finset (ℤ × ℤ × ℤ)) :
    Λ.powerset = (projF Λ).powerset.biUnion (projFib Λ) := by
  ext X
  simp only [Finset.mem_powerset, Finset.mem_biUnion, mem_projFib]
  constructor
  · intro hX
    exact ⟨X.image proj, Finset.image_subset_image hX, hX, rfl⟩
  · rintro ⟨-, -, hXΛ, -⟩
    exact hXΛ

theorem projFib_pairwise_disjoint (Λ : Finset (ℤ × ℤ × ℤ)) :
  Set.PairwiseDisjoint ((projF Λ).powerset : Set (Finset (ℤ × ℤ))) (projFib Λ) := by
  rintro X₁ h₁ X₂ h₂ hne
  unfold Function.onFun
  rw [Finset.disjoint_right]
  intro X hX hX2
  have e1 := (mem_projFib.1 hX).2
  have e2 := (mem_projFib.1 hX2).2
  exact hne (e2.symm.trans e1)

/-- PER-FIBRE FACTORIZATION: each `projFib`-fibre's `extendId`-sum (as in
`hamiltonian3D`) factors through the fibre region — `extendId` along `X ⊆ Λ` is
`extendId` along the fibre after `extendId` along `X ⊆ fibre` (via `extendId_extendId`,
the two subset-proofs proof-irrelevantly equal), and `extendId_sum` pulls the
region-extension out of the sum. -/
theorem sum_projFib_extendId {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    {X' : Finset (ℤ × ℤ)} :
    ∑ X ∈ (projFib Λ X').attach,
        extendId ((mem_projFib.1 X.2).1) (Φ X.1) =
      extendId (fibre_subset Λ X')
        (∑ X ∈ (projFib Λ X').attach,
          extendId (subset_fibre_of_mem_projFib X.2) (Φ X.1)) := by
  rw [extendId_sum]
  exact Finset.sum_congr rfl fun X _ => by rw [extendId_extendId]

/-! ## P2-d M2-b — the guard bridge + the extend-relabel swap (2026-11-19)

The swap's guards (the `extendId` off-diagonal conditions on the two sides) are bridged
PER-SITE through the GREEN toFun-side transparency: planar agreement off `X'` iff 3D
agreement off the fibre, column by column (`colRegEquiv` injectivity forward,
`congrArg` backward; the column decomposition of `Λ \ fibre Λ X'`). No `Eq.rec`, no
complement-`Eq.rec`-transport, no `sdiff`-bridge — the donor's own route. -/

/-- GUARD BRIDGE, FORWARD DIRECTION (bisect unit 9): 3D agreement off the fibre →
planar agreement off `X'` (congrArg direction). -/
theorem regReindexEquiv_compl_fwd {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {X' : Finset (ℤ × ℤ)}
  (w w' : ∀ v : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
      Fin (q ^ colCard Λ (v : ℤ × ℤ)))
  (h : restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
        ((regReindexEquiv (Λ := Λ) q).symm w) =
      restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
        ((regReindexEquiv (Λ := Λ) q).symm w')) :
  restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (S := projF Λ \ X') (T := projF Λ) Finset.sdiff_subset w =
      restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (S := projF Λ \ X') (T := projF Λ) Finset.sdiff_subset w' := by
  have hw : regReindexEquiv (Λ := Λ) q ((regReindexEquiv (Λ := Λ) q).symm w) = w :=
  (regReindexEquiv (Λ := Λ) q).apply_symm_apply w
  have hw' : regReindexEquiv (Λ := Λ) q ((regReindexEquiv (Λ := Λ) q).symm w') = w' :=
  (regReindexEquiv (Λ := Λ) q).apply_symm_apply w'
  funext u
  have huP : (u : ℤ × ℤ) ∈ projF Λ := (Finset.mem_sdiff.1 u.2).1
  have huX : (u : ℤ × ℤ) ∉ X' := (Finset.mem_sdiff.1 u.2).2
  -- the 3D agreement spreads over the whole column of u
  have hcol : ∀ a : ℤ × ℤ × ℤ, ∀ ha : a ∈ col Λ (u : ℤ × ℤ),
        (regReindexEquiv (Λ := Λ) q).symm w ⟨a, col_subset Λ (u : ℤ × ℤ) ha⟩ =
        (regReindexEquiv (Λ := Λ) q).symm w' ⟨a, col_subset Λ (u : ℤ × ℤ) ha⟩ := by
      intro a ha
      have haΛ : a ∈ Λ := (Finset.mem_filter.1 ha).1
      have haf : a ∉ fibre Λ X' := by
        intro hcon
        apply huX
        rw [← (Finset.mem_filter.1 ha).2]
        exact (Finset.mem_filter.1 hcon).2
      have := congrFun h ⟨a, Finset.mem_sdiff.2 ⟨haΛ, haf⟩⟩
      simpa [restr, Finset.restrict₂_def] using this
  show w ⟨(u : ℤ × ℤ), huP⟩ = w' ⟨(u : ℤ × ℤ), huP⟩
  rw [← hw, ← hw', regReindexEquiv_apply, regReindexEquiv_apply]
  exact congrArg _ (funext fun s => hcol _ s.2)

#print axioms OpenAI.AL3D.regReindexEquiv_compl_fwd

/-- GUARD BRIDGE, BACKWARD DIRECTION (bisect unit 9): planar agreement off `X'` →
3D agreement off the fibre (colRegEquiv-injectivity direction). -/
theorem regReindexEquiv_compl_bwd {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {X' : Finset (ℤ × ℤ)}
    (w w' : ∀ v : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
      Fin (q ^ colCard Λ (v : ℤ × ℤ)))
    (h : restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (S := projF Λ \ X') (T := projF Λ) Finset.sdiff_subset w =
      restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (S := projF Λ \ X') (T := projF Λ) Finset.sdiff_subset w') :
    restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
        ((regReindexEquiv (Λ := Λ) q).symm w) =
      restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
        ((regReindexEquiv (Λ := Λ) q).symm w') := by
  have hw : regReindexEquiv (Λ := Λ) q ((regReindexEquiv (Λ := Λ) q).symm w) = w :=
    (regReindexEquiv (Λ := Λ) q).apply_symm_apply w
  have hw' : regReindexEquiv (Λ := Λ) q ((regReindexEquiv (Λ := Λ) q).symm w') = w' :=
    (regReindexEquiv (Λ := Λ) q).apply_symm_apply w'
  funext x
  have hxΛ : (x : ℤ × ℤ × ℤ) ∈ Λ := (Finset.mem_sdiff.1 x.2).1
  have hxf : (x : ℤ × ℤ × ℤ) ∉ fibre Λ X' := (Finset.mem_sdiff.1 x.2).2
  have hxu : proj (x : ℤ × ℤ × ℤ) ∉ X' := fun hcon =>
      hxf (Finset.mem_filter.2 ⟨hxΛ, hcon⟩)
  have huP : proj (x : ℤ × ℤ × ℤ) ∈ projF Λ := Finset.mem_image_of_mem proj hxΛ
  -- the planar agreement at proj x (an element of projF Λ \ X')
  have hwu : w ⟨proj (x : ℤ × ℤ × ℤ), huP⟩ =
        w' ⟨proj (x : ℤ × ℤ × ℤ), huP⟩ := by
      have := congrFun h ⟨proj (x : ℤ × ℤ × ℤ),
        Finset.mem_sdiff.2 ⟨huP, hxu⟩⟩
      simpa [restr, Finset.restrict₂_def] using this
  -- through the toFun-side transparency and injectivity: the columns agree
  have hcol : (fun s : ↥((col Λ (proj (x : ℤ × ℤ × ℤ)) : Finset (ℤ × ℤ × ℤ)) :
            Set (ℤ × ℤ × ℤ)) =>
          (regReindexEquiv (Λ := Λ) q).symm w ⟨(s : ℤ × ℤ × ℤ),
            col_subset Λ (proj (x : ℤ × ℤ × ℤ)) s.2⟩) =
        (fun s : ↥((col Λ (proj (x : ℤ × ℤ × ℤ)) : Finset (ℤ × ℤ × ℤ)) :
            Set (ℤ × ℤ × ℤ)) =>
          (regReindexEquiv (Λ := Λ) q).symm w' ⟨(s : ℤ × ℤ × ℤ),
            col_subset Λ (proj (x : ℤ × ℤ × ℤ)) s.2⟩) := by
      refine (colRegEquiv (Λ := Λ) (q := q) (u := proj (x : ℤ × ℤ × ℤ))).injective ?_
      have e1 : colRegEquiv (Λ := Λ) (q := q) (u := proj (x : ℤ × ℤ × ℤ))
          (fun s : ↥((col Λ (proj (x : ℤ × ℤ × ℤ)) : Finset (ℤ × ℤ × ℤ)) :
              Set (ℤ × ℤ × ℤ)) =>
            (regReindexEquiv (Λ := Λ) q).symm w ⟨(s : ℤ × ℤ × ℤ),
              col_subset Λ (proj (x : ℤ × ℤ × ℤ)) s.2⟩) =
          w ⟨proj (x : ℤ × ℤ × ℤ), huP⟩ := by
        rw [← regReindexEquiv_apply (Λ := Λ) (q := q) ((regReindexEquiv (Λ := Λ) q).symm w)
          ⟨proj (x : ℤ × ℤ × ℤ), huP⟩, hw]
      have e2 : colRegEquiv (Λ := Λ) (q := q) (u := proj (x : ℤ × ℤ × ℤ))
          (fun s : ↥((col Λ (proj (x : ℤ × ℤ × ℤ)) : Finset (ℤ × ℤ × ℤ)) :
              Set (ℤ × ℤ × ℤ)) =>
            (regReindexEquiv (Λ := Λ) q).symm w' ⟨(s : ℤ × ℤ × ℤ),
              col_subset Λ (proj (x : ℤ × ℤ × ℤ)) s.2⟩) =
          w' ⟨proj (x : ℤ × ℤ × ℤ), huP⟩ := by
        rw [← regReindexEquiv_apply (Λ := Λ) (q := q) ((regReindexEquiv (Λ := Λ) q).symm w')
          ⟨proj (x : ℤ × ℤ × ℤ), huP⟩, hw']
      exact Eq.trans e1 (Eq.trans hwu e2.symm)
  -- x sits in that column
  have hxcol : (x : ℤ × ℤ × ℤ) ∈ col Λ (proj (x : ℤ × ℤ × ℤ)) :=
      Finset.mem_filter.2 ⟨hxΛ, rfl⟩
  simpa [restr, Finset.restrict₂_def] using congrFun hcol ⟨(x : ℤ × ℤ × ℤ), hxcol⟩

#print axioms OpenAI.AL3D.regReindexEquiv_compl_bwd

/-- GUARD BRIDGE (assembled from the two bisected directions). -/
theorem regReindexEquiv_compl_iff {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {X' : Finset (ℤ × ℤ)}
    (w w' : ∀ v : ↥((projF Λ : Finset (ℤ × ℤ)) : Set (ℤ × ℤ)),
      Fin (q ^ colCard Λ (v : ℤ × ℤ))) :
    restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
        ((regReindexEquiv (Λ := Λ) q).symm w) =
      restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
        ((regReindexEquiv (Λ := Λ) q).symm w') ↔
    restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (S := projF Λ \ X') (T := projF Λ) Finset.sdiff_subset w =
      restr (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (S := projF Λ \ X') (T := projF Λ) Finset.sdiff_subset w' :=
  ⟨regReindexEquiv_compl_fwd (Λ := Λ) q w w', regReindexEquiv_compl_bwd (Λ := Λ) q w w'⟩

/-- **M2 SWAP (extend-relabel):** extending a fibre-indexed matrix to `Λ` by the
identity and relabelling by the whole-domain regrouping equals relabelling by the
column regrouping and extending on the planar side by the identity. Entrywise via
`extendId`'s definition; the guards bridge by `regReindexEquiv_compl_iff`, the inner
values by the workhorse's `ē`-form `colEquivVar_restr_apply`. -/
theorem colEquivVar_swap {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {X' : Finset (ℤ × ℤ)}
    {𝕜 : Type*} [RCLike 𝕜] (hX' : X' ⊆ projF Λ)
    (M : Matrix (Reg (OpenAI.Qudits3D q) (fibre Λ X'))
        (Reg (OpenAI.Qudits3D q) (fibre Λ X')) 𝕜) :
    (extendId (fibre_subset Λ X') M).submatrix
        ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm) =
      extendId (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u)) hX'
        (M.submatrix (colEquivVar Λ q X' hX') (colEquivVar Λ q X' hX')) := by
  ext w w'
  simp only [Matrix.submatrix_apply, extendId, Matrix.of_apply]
  by_cases hg : restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
      ((regReindexEquiv (Λ := Λ) q).symm w) =
      restr (S := Λ \ fibre Λ X') (T := Λ) Finset.sdiff_subset
        ((regReindexEquiv (Λ := Λ) q).symm w')
  · rw [if_pos hg, if_pos ((regReindexEquiv_compl_iff (Λ := Λ) q w w').1 hg)]
    rw [colEquivVar_restr_apply, colEquivVar_restr_apply]
  · rw [if_neg hg, if_neg (fun hcon => hg
      ((regReindexEquiv_compl_iff (Λ := Λ) q w w').2 hcon))]

/-! ## P2-d M2-c — the Hamiltonian identification (2026-11-19, unit 7 part b) -/

/-- Attach↔dite bridge: a sum over `s.attach` of a membership-dependent body is the
plain sum with the corresponding `dite` (the condition always holds on `s`;
`Finset.sum_attach` itself takes only non-dependent bodies, so normalize per-element
to the dite form first). -/
private theorem sum_attach_eq_dite {α : Type*} {M : Type*} [AddCommMonoid M]
    (s : Finset α) (P : α → Prop) [DecidablePred P] (hP : ∀ a ∈ s, P a)
    (f : (a : α) → P a → M) :
    ∑ x ∈ s.attach, f x.1 (hP x.1 (Finset.mem_coe.2 x.2)) =
      ∑ a ∈ s, if ha : P a then f a ha else 0 := by
  have h1 : ∑ x ∈ s.attach, f x.1 (hP x.1 (Finset.mem_coe.2 x.2)) =
      ∑ x ∈ s.attach, (if hx : P x.1 then f x.1 hx else 0) :=
    Finset.sum_congr rfl fun x _ => by rw [dif_pos (hP x.1 (Finset.mem_coe.2 x.2))]
  rw [h1]
  exact Finset.sum_attach (f := fun a => if ha : P a then f a ha else 0) s

/-- Submatrix distributes over finite sums (`submatrix_add` is `rfl`, so the
distribution goes by induction). -/
private theorem sum_submatrix {ι : Type*} [DecidableEq ι] {M : Type*} [AddCommMonoid M]
    {m n m' n' : Type*} (s : Finset ι) (f : ι → Matrix m n M)
    (g : m' → m) (h : n' → n) :
    (∑ i ∈ s, f i).submatrix g h = ∑ i ∈ s, (f i).submatrix g h := by
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s ha ih => simp [Finset.sum_insert ha, ih, Matrix.submatrix_add]

/-- PARTITION REGROUP (flat bodies; `rebuild-precharter.md` §3 M2): summing over
`Λ.powerset` is summing the `projFib`-fibres over the planar powerset. -/
theorem sum_powerset_eq_sum_projFib {Λ : Finset (ℤ × ℤ × ℤ)} {M : Type*} [AddCommMonoid M]
    (F : Finset (ℤ × ℤ × ℤ) → M) :
    ∑ X ∈ Λ.powerset, F X = ∑ X' ∈ (projF Λ).powerset, ∑ X ∈ projFib Λ X', F X := by
  rw [powerset_eq_biUnion_projFib Λ, Finset.sum_biUnion (projFib_pairwise_disjoint Λ)]

/-- **M2-c MAIN — the Hamiltonian identification** (`rebuild-precharter.md` §1, P2-d's
parked target): the planar variable-height Hamiltonian of the projected interaction is
the 3D Hamiltonian conjugated by the whole-domain regrouping. Chain: the two
attach↔dite bridges + the partition regroup + `sum_projFib_extendId` + the swap. -/
theorem hamiltonianVar_eq_submatrix {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*}
    [RCLike 𝕜]
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜) :
    hamiltonianVar (projF Λ) (colCard Λ) (fun X' => projInteraction Λ q Φ X') =
      (hamiltonian3D Λ Φ).submatrix
        ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm) := by
  classical
  -- RHS: unfold the 3D Hamiltonian, distribute the submatrix, bridge attach→dite,
  -- then regroup by the partition
  have hR : (hamiltonian3D Λ Φ).submatrix
      ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm) =
      ∑ X' ∈ (projF Λ).powerset, ∑ Y ∈ projFib Λ X',
        (if hY : Y ∈ Λ.powerset then
          (extendId (loc := OpenAI.Qudits3D q) (Finset.mem_powerset.1 hY) (Φ Y)).submatrix
            ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm)
        else 0) := by
    have hbody : ∑ i ∈ Λ.powerset.attach,
        (extendId (loc := OpenAI.Qudits3D q) (Finset.mem_powerset.1 i.2) (Φ i.1)).submatrix
          ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm) =
      ∑ i ∈ Λ.powerset.attach,
        (extendId (loc := OpenAI.Qudits3D q)
            (Finset.mem_powerset.1 (Finset.mem_coe.2 i.2)) (Φ i.1)).submatrix
          ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm) :=
      Finset.sum_congr rfl fun _ _ => rfl
    rw [hamiltonian3D, sum_submatrix, hbody, sum_attach_eq_dite (s := Λ.powerset)
      (P := fun X => X ∈ Λ.powerset)
      (f := fun X hX => (extendId (loc := OpenAI.Qudits3D q)
        (Finset.mem_powerset.1 hX) (Φ X)).submatrix
        ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm))
      (fun _ hX => hX), sum_powerset_eq_sum_projFib]
  -- per-fibre key: the planar projected term equals the fibre's conjugated 3D sum
  have key : ∀ X' : Finset (ℤ × ℤ), ∀ hX' : X' ∈ (projF Λ).powerset,
      extendId (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
          (Finset.mem_powerset.1 hX') (projInteraction Λ q Φ X') =
      ∑ Y ∈ projFib Λ X',
        (if hY : Y ∈ Λ.powerset then
          (extendId (loc := OpenAI.Qudits3D q) (Finset.mem_powerset.1 hY) (Φ Y)).submatrix
            ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm)
        else 0) := by
    intro X' hX'
    have hX'p : X' ⊆ projF Λ := Finset.mem_powerset.1 hX'
    have hswap : extendId (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (Finset.mem_powerset.1 hX') (projInteraction Λ q Φ X') =
      (extendId (fibre_subset Λ X')
          (∑ Y ∈ projFib Λ X',
            if hY : Y ⊆ fibre Λ X' then extendId hY (Φ Y) else 0)).submatrix
        ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm) := by
      rw [projInteraction, dif_pos hX'p, colEquivVar_swap]
    have hfib : ∑ Y ∈ projFib Λ X',
          (if hY : Y ⊆ fibre Λ X' then extendId hY (Φ Y) else 0) =
        ∑ Y ∈ (projFib Λ X').attach,
          extendId (subset_fibre_of_mem_projFib Y.2) (Φ Y.1) :=
      (sum_attach_eq_dite (s := projFib Λ X') (P := fun Y => Y ⊆ fibre Λ X')
        (f := fun Y hY => extendId (loc := OpenAI.Qudits3D q) hY (Φ Y))
        (fun Y hY => subset_fibre_of_mem_projFib hY)).symm
    rw [hswap, hfib, ← sum_projFib_extendId (Λ := Λ) (q := q) Φ, sum_submatrix,
      sum_attach_eq_dite (s := projFib Λ X') (P := fun Y => Y ∈ Λ.powerset)
        (f := fun Y hY => (extendId (loc := OpenAI.Qudits3D q)
          (Finset.mem_powerset.1 hY) (Φ Y)).submatrix
          ((regReindexEquiv (Λ := Λ) q).symm) ((regReindexEquiv (Λ := Λ) q).symm))
        (fun Y hY => Finset.mem_powerset.2 ((mem_projFib.1 hY).1))]
  -- LHS: unfold the planar Hamiltonian and bridge attach→dite
  have hbody2 : ∑ i ∈ (projF Λ).powerset.attach,
      extendId (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (Finset.mem_powerset.1 i.2) (projInteraction Λ q Φ i.1) =
    ∑ i ∈ (projF Λ).powerset.attach,
      extendId (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
        (Finset.mem_powerset.1 (Finset.mem_coe.2 i.2)) (projInteraction Λ q Φ i.1) :=
    Finset.sum_congr rfl fun _ _ => rfl
  rw [hamiltonianVar, hbody2, sum_attach_eq_dite (s := (projF Λ).powerset)
    (P := fun X' => X' ∈ (projF Λ).powerset)
    (f := fun X' hX' => extendId (loc := fun u : ℤ × ℤ => Fin (q ^ colCard Λ u))
      (Finset.mem_powerset.1 hX') (projInteraction Λ q Φ X'))
    (fun _ hX' => hX')]
  rw [hR]
  refine Finset.sum_congr rfl fun X' hX' => ?_
  rw [dif_pos hX']
  exact key X' hX'

/-! ## P2-e / M3 — the transports, the entropy identification, the rung-stone (2026-11-19)

The AL-rebuild ladder's final rung. The eigenvector/norm/gap transports consume the M2
keystone (`hamiltonianVar_eq_submatrix`) plus the P2-d generic submatrix transports; the
ENTROPY IDENTIFICATION is the donor's partial-trace commutation, done as
`vecMulVec_submatrix` + the splitting lemma `ptrace_submatrix_split` (the glue-commuted
case analysis rides the column dichotomy: a column of a column-closed cut is either
wholly inside `A` or wholly in the complement) + `vonNeumann_submatrix_equiv`; the
RUNG-STONE assembles the `PlanarAreaLawVar` binder at `G := projLattice Λ`,
`Λ' := projF Λ`, `hU := colCard Λ`, `Ψ := projInteraction`, with the boundary side on
A1's `edgeBoundaryG_card_le`. Fences: no `AreaLaw3D` content; `PlanarAreaLawVar` NOT
discharged (consumed as the binder); `SlabAreaLaw3D` untouched. -/

/-- The partial trace commutes with a SPLIT submatrix-conjugation: if the relabelling
`e` carries the `S`-part and the complement part separately (the glue-commutation),
then tracing out the complement commutes with the conjugation. TWO-LOC form (M3 fix,
2026-11-20): the primed side may carry a different site-type function — the planar
variable-height system vs the 3D system — which the entropy identification needs; the
entrywise proof never compares the two locs, so the generalization is free. The run-1
residuals are fixed by restructuring: the summands are rewritten by the derived
`e.symm ∘ glue = glue ∘ (eS.symm, eC.symm)` identity FIRST, then the sum is reindexed
by `Equiv.sum_comp eC.symm _` (positional `g` — the pin's parameter name, run-1's
`(f := …)` was the named-arg class's 7th recurrence). -/
private theorem ptrace_submatrix_split {σ σ' : Type*}
    {loc : σ → Type*} [∀ i, Fintype (loc i)]
    {loc' : σ' → Type*} [∀ i, Fintype (loc' i)]
    {𝕜 : Type*} [RCLike 𝕜] {S T : Finset σ} {S' T' : Finset σ'}
    (hS : S ⊆ T) (hS' : S' ⊆ T')
    (e : Reg loc' T' ≃ Reg loc T)
    (eS : Reg loc' S' ≃ Reg loc S)
    (eC : Reg loc' (T' \ S') ≃ Reg loc (T \ S))
    (hglue : ∀ x : Reg loc' S', ∀ z : Reg loc' (T' \ S'),
      e (glue x z) = glue (eS x) (eC z))
    (M : Matrix (Reg loc' T') (Reg loc' T') 𝕜) :
    ptrace hS (M.submatrix (fun x => e.symm x) (fun x => e.symm x)) =
      (ptrace hS' M).submatrix (fun x => eS.symm x) (fun x => eS.symm x) := by
  ext x y
  simp only [ptrace, Matrix.of_apply, Matrix.submatrix_apply]
  have key : ∀ w : Reg loc S, ∀ z : Reg loc (T \ S),
      e.symm (glue w z) = glue (eS.symm w) (eC.symm z) := by
    intro w z
    have h1 := hglue (eS.symm w) (eC.symm z)
    rw [eS.apply_symm_apply w, eC.apply_symm_apply z] at h1
    rw [← h1, e.symm_apply_apply]
  calc ∑ z : Reg loc (T \ S), M (e.symm (glue x z)) (e.symm (glue y z))
      = ∑ z : Reg loc (T \ S),
          M (glue (eS.symm x) (eC.symm z)) (glue (eS.symm y) (eC.symm z)) :=
        Finset.sum_congr rfl fun z _ => by rw [key x z, key y z]
    _ = ∑ w : Reg loc' (T' \ S'), M (glue (eS.symm x) w) (glue (eS.symm y) w) :=
        eC.symm.sum_comp _

/-- EIGENVECTOR TRANSPORT: the composed planar configuration `Ω ∘ ē` is an eigenvector
of the projected Hamiltonian with the same eigenvalue (the M2 keystone + the generic
submatrix transport). -/
theorem hamiltonianVar_eigenvector {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    {Ω : Reg (OpenAI.Qudits3D q) Λ → 𝕜} {E₀ : ℝ}
    (heig : hamiltonian3D Λ Φ *ᵥ Ω = (E₀ : 𝕜) • Ω) :
    hamiltonianVar (projF Λ) (colCard Λ) (fun X' => projInteraction Λ q Φ X') *ᵥ
        (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm) =
      (E₀ : 𝕜) • (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm) := by
  rw [hamiltonianVar_eq_submatrix]
  exact mulVec_eq_smul_submatrix heig _

/-- NORM TRANSPORT: the composed planar configuration is a unit vector. -/
theorem star_dotProduct_regReindex {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*} [RCLike 𝕜]
    {Ω : Reg (OpenAI.Qudits3D q) Λ → 𝕜} (hΩ : star Ω ⬝ᵥ Ω = 1) :
    star (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm) ⬝ᵥ
        (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm) = 1 :=
  star_dotProduct_comp hΩ _

/-- GAP TRANSPORT: the spectral-gap hypothesis transports to the projected system. -/
theorem hasGlobalGap_hamiltonianVar {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ) {𝕜 : Type*}
    [RCLike 𝕜]
    (Φ : (X : Finset (ℤ × ℤ × ℤ)) →
      Matrix (Reg (OpenAI.Qudits3D q) X) (Reg (OpenAI.Qudits3D q) X) 𝕜)
    {Ω : Reg (OpenAI.Qudits3D q) Λ → 𝕜} {E₀ Δ : ℝ}
    (hgap : HasGlobalGap (hamiltonian3D Λ Φ) Ω E₀ Δ) :
    HasGlobalGap (hamiltonianVar (projF Λ) (colCard Λ)
        (fun X' => projInteraction Λ q Φ X'))
      (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm) E₀ Δ := by
  rw [hamiltonianVar_eq_submatrix]
  exact hasGlobalGap_submatrix hgap _

/-! ### M3 remainder (2026-11-20, lane R8): the psd support layer V, the entropy
identification, and the rung-stone. Supports: `compE`-compression (each `ptrace`-summand
is `E M Eᴴ`, psd by `Matrix.PosSemidef.mul_mul_conjTranspose_same`), the mathlib-native
`Matrix.posSemidef_vecMulVec_self_star` (the probe stub's content, available on this pin),
witness-extensionality of `vonNeumann` (proof irrelevance), and the column dichotomy
(`fibre_eq_of_column_closed` — a column-closed cut IS its projection's fibre). The
identification itself consumes the two-loc split lemma + the M1/M2 ē-form workhorses;
the rung-stone closes over A1's boundary lift. -/

section M3

open scoped ComplexOrder

/-- A finite sum of `𝕜`-elements with vanishing imaginary parts and nonnegative real
parts is nonnegative (the cast route — `𝕜` carries no `OrderedAddCommMonoid` suitable
for `Finset.sum_nonneg`, so the sum is pulled to `ℝ` and pushed back). -/
private theorem sum_nonneg_re {ι : Type*} [Fintype ι] {𝕜 : Type*} [RCLike 𝕜]
    (q : ι → 𝕜) (hre : ∀ i, 0 ≤ RCLike.re (q i)) (him : ∀ i, RCLike.im (q i) = 0) :
    0 ≤ ∑ i, q i := by
  have h1 : ∀ i, q i = ((RCLike.re (q i) : ℝ) : 𝕜) := by
    intro i
    have h2 := RCLike.re_add_im (q i)
    rw [him i] at h2
    simp at h2
    exact h2.symm
  rw [Finset.sum_congr rfl (fun i _ => h1 i), ← RCLike.ofReal_sum]
  exact RCLike.ofReal_nonneg.2 (Finset.sum_nonneg fun i _ => hre i)

/-- The quadratic form of a sum of matrices is the sum of the quadratic forms
(entrywise distributivity, via two pinned sum-commutations). -/
private theorem dotProduct_sum_mulVec {ι κ : Type*} [Fintype ι] [Fintype κ]
    {𝕜 : Type*} [RCLike 𝕜] (P : ι → Matrix κ κ 𝕜) (x : κ → 𝕜) :
    star x ⬝ᵥ ((∑ i, P i) *ᵥ x) = ∑ i, star x ⬝ᵥ (P i *ᵥ x) := by
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

/-- The compression matrix of the complement-slice `z`: conjugating `M` by `E_z`
selects the `z`-block of `M` entrywise, so each `ptrace`-summand below is a conjugate
compression of `M` — positive semidefinite whenever `M` is. -/
private noncomputable def compE {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    [∀ i, Fintype (loc i)] [∀ i, DecidableEq (loc i)] {𝕜 : Type*} [RCLike 𝕜]
    {S T : Finset σ} (z : Reg loc (T \ S)) :
    Matrix (Reg loc S) (Reg loc T) 𝕜 :=
  Matrix.of fun c w => if w = glue c z then 1 else 0

/-- Entry form of the slice-compression: conjugating by `E_z` selects the `z`-block
(single-point selection at both indices; each selection a standalone lemma so no
rw-induced beta redexes or postponed metavariable-goals arise). -/
private theorem compE_entry {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    [∀ i, Fintype (loc i)] [∀ i, DecidableEq (loc i)] {𝕜 : Type*} [RCLike 𝕜]
    {S T : Finset σ} (z : Reg loc (T \ S)) (M : Matrix (Reg loc T) (Reg loc T) 𝕜)
    (c d : Reg loc S) : (compE z * M * (compE z)ᴴ) c d = M (glue c z) (glue d z) := by
  classical
  simp only [Matrix.mul_apply, compE, Matrix.conjTranspose_apply, Matrix.of_apply]
  have sel1 : ∀ F : Reg loc T → 𝕜,
      (∑ w : Reg loc T, (if w = glue c z then (1 : 𝕜) else 0) * F w) = F (glue c z) := by
    intro F
    rw [Finset.sum_eq_single_of_mem (glue c z) (Finset.mem_univ _)
      (fun b _ hbne => by simp [hbne])]
    simp
  have sel2 : (∑ w' : Reg loc T,
        M (glue c z) w' * star ((if w' = glue d z then (1 : 𝕜) else 0))) =
      M (glue c z) (glue d z) := by
    rw [Finset.sum_eq_single_of_mem (glue d z) (Finset.mem_univ _)
      (fun b _ hbne => by simp [hbne])]
    simp
  refine Eq.trans ?_ sel2
  exact sel1 (fun w => ∑ w' : Reg loc T, M w w' * star ((if w' = glue d z then (1 : 𝕜) else 0)))

/-- `ptrace` is the sum of the slice-compressions (entrywise single-point selection). -/
private theorem ptrace_eq_sum_compE {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    [∀ i, Fintype (loc i)] [∀ i, DecidableEq (loc i)] {𝕜 : Type*} [RCLike 𝕜]
    {S T : Finset σ} (h : S ⊆ T) (M : Matrix (Reg loc T) (Reg loc T) 𝕜) :
    ptrace h M = ∑ z : Reg loc (T \ S), compE z * M * (compE z)ᴴ := by
  ext c d
  simp only [ptrace, Matrix.of_apply, Matrix.sum_apply]
  exact Finset.sum_congr rfl fun z _ => compE_entry z M c d

/-- The partial trace of a positive semidefinite matrix is positive semidefinite —
mathlib-only re-proof of the probe stub's CONTENT under a new name (P0's
`Arealaw.posSemidef_ptrace` stays untouched, frozen; it is bridged proof-irrelevantly
at the entropy layer). Compression route: a sum of psd conjugates. -/
private theorem posSemidef_ptrace' {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    [∀ i, Fintype (loc i)] [∀ i, DecidableEq (loc i)] {𝕜 : Type*} [RCLike 𝕜]
    {S T : Finset σ} (h : S ⊆ T) {M : Matrix (Reg loc T) (Reg loc T) 𝕜}
    (hM : M.PosSemidef) : (ptrace h M).PosSemidef := by
  have hsum : ptrace h M = ∑ z : Reg loc (T \ S), compE z * M * (compE z)ᴴ :=
    ptrace_eq_sum_compE h M
  have hH : (ptrace h M).IsHermitian := by
    rw [hsum]
    exact (isSelfAdjoint_sum _ fun z _ =>
      ((hM.mul_mul_conjTranspose_same (compE z)).isHermitian).isSelfAdjoint).isHermitian
  refine Matrix.PosSemidef.of_dotProduct_mulVec_nonneg hH ?_
  intro x
  rw [hsum, dotProduct_sum_mulVec _ x]
  refine sum_nonneg_re _ (fun z =>
    (hM.mul_mul_conjTranspose_same (compE z)).re_dotProduct_nonneg x) ?_
  exact fun z =>
    ((hM.mul_mul_conjTranspose_same (compE z)).isHermitian
        : Matrix.IsHermitian _).im_star_dotProduct_mulVec_self x

/-- The von Neumann entropy does not see the Hermitian witness (proof irrelevance). -/
private theorem vonNeumann_witness_ext {n : Type*} [Fintype n] [DecidableEq n]
    {𝕜 : Type*} [RCLike 𝕜]
    {ρ : Matrix n n 𝕜} (h₁ h₂ : ρ.IsHermitian) : vonNeumann h₁ = vonNeumann h₂ := by
  rw [proof_irrel h₁ h₂]

/-- The von Neumann entropy is invariant under matrix EQUALITY (witnesses may differ). -/
private theorem vonNeumann_congr {n : Type*} [Fintype n] [DecidableEq n]
    {𝕜 : Type*} [RCLike 𝕜]
    {A B : Matrix n n 𝕜} (hAB : A = B) (hA : A.IsHermitian) (hB : B.IsHermitian) :
    vonNeumann hA = vonNeumann hB := by
  subst hAB
  rw [proof_irrel hA hB]

/-- Restriction of configurations along an equality of regions: `regEquivOfEq` is the
transport (both `restr`-actions are `Finset.restrict₂` — proof-irrelevant pointwise). -/
private theorem restr_congr {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    {S S' T : Finset σ} (h : S = S') (hST : S ⊆ T) (hS'T : S' ⊆ T) {u : Reg loc T} :
    restr hS'T u = regEquivOfEq h (restr hST u) := by
  funext j
  simp only [restr, Finset.restrict₂_def, regEquivOfEq_apply]

/-- The region entropy of a PURE state is the von Neumann entropy of the partially
traced density matrix, with the mathlib-native psd witnesses (the frozen P0 stubs enter
only through proof-irrelevant `IsHermitian` witnesses — see the rung-stone's find-#6
note below for what this does and does not discharge at the audit layer). -/
theorem regionEntropy_pureState_eq {σ : Type*} [DecidableEq σ] {loc : σ → Type*}
    [∀ i, Fintype (loc i)] [∀ i, DecidableEq (loc i)] {𝕜 : Type*} [RCLike 𝕜]
    {A T : Finset σ} (hA : A ⊆ T) {Ω : Reg loc T → 𝕜} (hΩ : star Ω ⬝ᵥ Ω = 1) :
    (pureState Ω hΩ).regionEntropy hA =
      vonNeumann (posSemidef_ptrace' hA (Matrix.posSemidef_vecMulVec_self_star Ω)).isHermitian := by
  have h1 : (pureState Ω hΩ).regionEntropy hA =
      vonNeumann (Arealaw.posSemidef_ptrace hA
        (_root_.posSemidef_vecMulVec_self_star Ω)).isHermitian :=
    rfl
  rw [h1]

/-- M3 column dichotomy: a column-closed cut IS the fibre of its own projection
(whole columns, by definition of `IsColumnClosed3D`; consumes A1's
`col_subset_A_of_mem_proj`). -/
theorem fibre_eq_of_column_closed {Λ A : Finset (ℤ × ℤ × ℤ)} (hcol : IsColumnClosed3D Λ A)
    (hA : A ⊆ Λ) : fibre Λ (projF A) = A := by
  ext x
  simp only [fibre, projF, Finset.mem_filter, Finset.mem_image]
  constructor
  · rintro ⟨hxΛ, y, hyA, hyx⟩
    exact col_subset_A_of_mem_proj hcol (Finset.mem_image.2 ⟨y, hyA, rfl⟩) hxΛ hyx.symm
  · intro hx
    exact ⟨hA hx, x, hx, rfl⟩

/-- **M3 ENTROPY IDENTIFICATION**: for a COLUMN-CLOSED cut, the 3D pure state's region
entropy equals the planar pure state's region entropy at the projected cut — the
partial trace commutes with the column regrouping. Proof: both sides are `vonNeumann`
of a partially traced density (`regionEntropy_pureState_eq`); the planar density is the
3D density conjugated by the whole-domain regrouping (`vecMulVec_submatrix`), and the
split lemma `ptrace_submatrix_split` (fed by the M1 ē-form workhorse `colEquivVar_restr_apply`
at the cut and its complement, plus the dichotomy transports `restr_congr`) identifies
the traced matrices up to submatrix-conjugation, which `vonNeumann_submatrix_equiv`
cannot see. -/
theorem regionEntropy_pureState_column_closed {Λ : Finset (ℤ × ℤ × ℤ)} (q : ℕ)
    {𝕜 : Type*} [RCLike 𝕜] {A : Finset (ℤ × ℤ × ℤ)} (hcol : IsColumnClosed3D Λ A)
    (hA : A ⊆ Λ) {Ω : Reg (OpenAI.Qudits3D q) Λ → 𝕜} (hΩ : star Ω ⬝ᵥ Ω = 1) :
    (pureState Ω hΩ).regionEntropy hA =
    (pureState (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm :
          Reg (fun u => Fin (q ^ colCard Λ u)) (projF Λ) → 𝕜)
        (star_dotProduct_regReindex q hΩ)).regionEntropy
      (Finset.image_subset_image hA) := by
  have hA' : projF A ⊆ projF Λ := Finset.image_subset_image hA
  have hfibA : fibre Λ (projF A) = A := fibre_eq_of_column_closed hcol hA
  have hC2 : fibre Λ (projF Λ \ projF A) = Λ \ A := by
    rw [← sdiff_fibre_eq Λ (projF A), hfibA]
  have hglue : ∀ x : Reg (fun u : ℤ × ℤ => Fin (q ^ colCard Λ u)) (projF A),
      ∀ z : Reg (fun u : ℤ × ℤ => Fin (q ^ colCard Λ u)) (projF Λ \ projF A),
      (regReindexEquiv (Λ := Λ) q).symm (glue x z) =
        glue (((colEquivVar Λ q (projF A) hA').trans (regEquivOfEq hfibA)) x)
          (((colEquivVar Λ q (projF Λ \ projF A)
              (Finset.sdiff_subset : projF Λ \ projF A ⊆ projF Λ)).trans
            (regEquivOfEq hC2)) z) := by
    intro x z
    have hdec : (regReindexEquiv (Λ := Λ) q).symm (glue x z) =
        glue (restr hA ((regReindexEquiv (Λ := Λ) q).symm (glue x z)))
          (restr (S := Λ \ A) (T := Λ) Finset.sdiff_subset
            ((regReindexEquiv (Λ := Λ) q).symm (glue x z))) :=
      (glue_restr hA _).symm
    rw [hdec]
    have hS : restr hA ((regReindexEquiv (Λ := Λ) q).symm (glue x z)) =
        ((colEquivVar Λ q (projF A) hA').trans (regEquivOfEq hfibA)) x := by
      rw [restr_congr hfibA (fibre_subset Λ (projF A)) hA,
        colEquivVar_restr_apply q hA' (glue x z), restr_glue, Equiv.trans_apply]
    have hC : restr (S := Λ \ A) (T := Λ) Finset.sdiff_subset
          ((regReindexEquiv (Λ := Λ) q).symm (glue x z)) =
        ((colEquivVar Λ q (projF Λ \ projF A)
              (Finset.sdiff_subset : projF Λ \ projF A ⊆ projF Λ)).trans
            (regEquivOfEq hC2)) z := by
      rw [restr_congr hC2 (fibre_subset Λ (projF Λ \ projF A))
        (Finset.sdiff_subset : Λ \ A ⊆ Λ),
        colEquivVar_restr_apply q
          (Finset.sdiff_subset : projF Λ \ projF A ⊆ projF Λ) (glue x z),
        restr_glue_compl x z, Equiv.trans_apply]
    rw [hS, hC]
  have hcomp : (vecMulVec (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm)
        (star (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm))).submatrix
      (fun x => (regReindexEquiv (Λ := Λ) q).symm.symm x)
      (fun x => (regReindexEquiv (Λ := Λ) q).symm.symm x) = vecMulVec Ω (star Ω) := by
    rw [vecMulVec_submatrix]
    ext i j
    simp [vecMulVec_apply, Function.comp_apply, Equiv.symm_symm, Equiv.symm_apply_apply]
  have hsplit := ptrace_submatrix_split (σ := ℤ × ℤ × ℤ) (σ' := ℤ × ℤ)
      (loc := OpenAI.Qudits3D q) (loc' := fun u => Fin (q ^ colCard Λ u))
      (S := A) (T := Λ) (S' := projF A) (T' := projF Λ)
      hA hA' (regReindexEquiv (Λ := Λ) q).symm
      ((colEquivVar Λ q (projF A) hA').trans (regEquivOfEq hfibA))
      ((colEquivVar Λ q (projF Λ \ projF A)
          (Finset.sdiff_subset : projF Λ \ projF A ⊆ projF Λ)).trans
        (regEquivOfEq hC2))
      hglue
      (vecMulVec (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm)
        (star (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm)))
  rw [hcomp] at hsplit
  rw [regionEntropy_pureState_eq hA hΩ,
      regionEntropy_pureState_eq hA' (star_dotProduct_regReindex q hΩ)]
  calc vonNeumann (posSemidef_ptrace' hA
          (Matrix.posSemidef_vecMulVec_self_star Ω)).isHermitian
      = vonNeumann (((posSemidef_ptrace' hA'
              (Matrix.posSemidef_vecMulVec_self_star
                (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm))).isHermitian).submatrix
          ((colEquivVar Λ q (projF A) hA').trans (regEquivOfEq hfibA)).symm) :=
        vonNeumann_congr hsplit _ _
    _ = vonNeumann (posSemidef_ptrace' hA'
          (Matrix.posSemidef_vecMulVec_self_star
            (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm))).isHermitian :=
        vonNeumann_submatrix_equiv _ _

/-- **M3 RUNG-STONE — `SlabAreaLawColumnCuts3D` discharged from the `PlanarAreaLawVar`
binder** (hypothesis-binder pattern per EnclOK: the donor statement is the explicit
`Prop` binder `hplanar`). Instantiation: `G := projLattice Λ` (A1's honest boundary-lift
graph, `projLattice_le_plan`), `Λ' := projF Λ`, `hU := colCard Λ` (`colCard_le_h`),
`Ψ := projInteraction Λ q Φ` (`isAdmissible_projInteraction` at `groupStrength`),
`Ω' := Ω ∘ ē` (the three transports), cut `projF A`; the entropy side is the
identification above; the boundary side is A1's `edgeBoundaryG_card_le`. The output
constant is `max C 0` (monotonicity needs `0 ≤ C'`, which the binder does not provide).
FENCES: `PlanarAreaLawVar` NOT discharged (consumed as the binder — honesty ledger);
full `SlabAreaLaw3D` untouched; no `AreaLaw3D` content.
STATEMENT-LAYER FIND #6 (audit): the frozen P0 probe stubs (P0 :104 `sorry` inside
`pureState`'s psd witness via `posSemidef_vecMulVec_self_star`, :142/:147 inside
`SubState.restrict`) are traversed by the def-level axiom audit, so the pureState-TYPED
theorems of this section print `sorryAx` of P0 provenance — every theorem PROVED here is
otherwise triad-only, and the stubs' mathematical content is re-proved at
`posSemidef_ptrace'`/mathlib above. A proof-only P0 completion (replace the three
`sorry` bodies; zero statement drift) is the recorded amendment option for H. -/
theorem slab_column_cuts_of_planar_var {𝕜 : Type*} [RCLike 𝕜] {q R : ℕ} {J Δ : ℝ} {h : ℕ}
    (hplanar : PlanarAreaLawVar 𝕜 q R (groupStrength h R J) Δ h) :
    SlabAreaLawColumnCuts3D 𝕜 q R J Δ h := by
  obtain ⟨C, hC⟩ := hplanar
  refine fun _ => ⟨max C 0, fun Λ hΛ Φ hΦ Ω hΩ E₀ heig hgap A hA hcol => ?_⟩
  have hA' : projF A ⊆ projF Λ := Finset.image_subset_image hA
  have hbound := hC (projLattice Λ) (projLattice_le_plan Λ) (projF Λ) (colCard Λ)
    (colCard_le_h h hΛ) (projInteraction Λ q Φ)
    (isAdmissible_projInteraction h R hΛ q Φ hΦ)
    (Ω ∘ (regReindexEquiv (Λ := Λ) q).symm) (star_dotProduct_regReindex q hΩ) E₀
    (hamiltonianVar_eigenvector q Φ heig) (hasGlobalGap_hamiltonianVar q Φ hgap)
    (projF A) hA'
  rw [regionEntropy_pureState_column_closed q hcol hA hΩ]
  refine le_trans hbound ?_
  calc C * ((edgeBoundaryG (projLattice Λ) (projF Λ) (projF A)).card : ℝ)
      ≤ max C 0 * ((edgeBoundaryG (projLattice Λ) (projF Λ) (projF A)).card : ℝ) :=
        mul_le_mul_of_nonneg_right (le_max_left C 0) (by positivity)
    _ ≤ max C 0 * ((edgeBoundary3D Λ A).card : ℝ) :=
        mul_le_mul_of_nonneg_left
          (Nat.cast_le.2 (edgeBoundaryG_card_le Λ A hcol hA)) (le_max_right C 0)

end M3

/-! ## P2-c audit (inline full-coverage; every new top-level theorem). -/

#print axioms Arealaw.restr_glue
#print axioms Arealaw.restr_glue_compl
#print axioms Arealaw.glue_restr
#print axioms Arealaw.glueEquiv_apply
#print axioms Arealaw.glueEquiv_symm_apply
#print axioms Arealaw.regEquivOfEq_apply
#print axioms Arealaw.regEquivOfEq_symm_apply
#print axioms Arealaw.extendId_zero
#print axioms Arealaw.extendId_add
#print axioms Arealaw.extendId_sum
#print axioms Arealaw.extendId_apply_glue
#print axioms Arealaw.extendId_extendId
#print axioms Arealaw.isHermitian_extendId
#print axioms Arealaw.euclidean_norm_comp_le
#print axioms Arealaw.l2_opNorm_le_bound
#print axioms Arealaw.l2_opNorm_submatrix_id_le
#print axioms Arealaw.l2_opNorm_submatrix_le
#print axioms Arealaw.l2_opNorm_submatrix
#print axioms Arealaw.euclidean_norm_sq_prod
#print axioms Arealaw.kronecker_one_mulVec_apply
#print axioms Arealaw.l2_opNorm_kronecker_one_le
#print axioms Arealaw.extendId_eq_kronecker
#print axioms Arealaw.l2_opNorm_extendId_le
#print axioms Arealaw.H_eq_multiset_sum
#print axioms Arealaw.H_eq_of_multiset_eq
#print axioms Arealaw.trace_cfc
#print axioms Arealaw.vonNeumann_eq_H
#print axioms Arealaw.eigenvalues_multiset_submatrix_equiv
#print axioms Arealaw.vonNeumann_submatrix_equiv
#print axioms OpenAI.AL3D.edist_induce_le_of_adj_le
#print axioms OpenAI.AL3D.planar_dist_eq_max_abs
#print axioms OpenAI.AL3D.planar_dist_le_iff
#print axioms OpenAI.AL3D.planar_dist_eq_one_of_adj
#print axioms OpenAI.AL3D.planar_dist_le_length_of_walk
#print axioms OpenAI.AL3D.exists_walk_length_le_iff_edist_le
#print axioms OpenAI.AL3D.planar_dist_le_of_domainEDistG_le
#print axioms OpenAI.AL3D.domainEDiamG_le_iff
#print axioms OpenAI.AL3D.mem_supportsG_iff
#print axioms OpenAI.AL3D.subset_Icc_of_mem_supportsG
#print axioms OpenAI.AL3D.card_Icc_eq_mul
#print axioms OpenAI.AL3D.card_Icc_sub_add
#print axioms OpenAI.AL3D.card_le_of_mem_supportsG
#print axioms OpenAI.AL3D.mem_projFib
#print axioms OpenAI.AL3D.subset_fibre_of_mem_projFib
#print axioms OpenAI.AL3D.card_projFib_le
#print axioms OpenAI.AL3D.projF_fibre
#print axioms OpenAI.AL3D.col_fibre_eq
#print axioms OpenAI.AL3D.colCard_fibre_eq
#print axioms OpenAI.AL3D.projInteraction_isHermitian
#print axioms OpenAI.AL3D.image_projF_mem_supportsG
#print axioms OpenAI.AL3D.projInteraction_eq_zero
#print axioms OpenAI.AL3D.projInteraction_norm_le
#print axioms OpenAI.AL3D.isAdmissible_projInteraction
#print axioms OpenAI.AL3D.vecMulVec_submatrix
#print axioms OpenAI.AL3D.hasGlobalGap_submatrix
#print axioms OpenAI.AL3D.mulVec_eq_smul_submatrix
#print axioms OpenAI.AL3D.star_dotProduct_comp
#print axioms OpenAI.AL3D.regReindexEquiv_apply
#print axioms OpenAI.AL3D.regReindexEquiv_comp_colEquivVar
#print axioms OpenAI.AL3D.fibre_subset
#print axioms OpenAI.AL3D.sdiff_fibre_eq
#print axioms OpenAI.AL3D.colZRank_fibre
#print axioms OpenAI.AL3D.colToFin_symm_fibre
#print axioms OpenAI.AL3D.colRegEquiv_fibre_apply
#print axioms OpenAI.AL3D.colEquivVar_restr
#print axioms OpenAI.AL3D.heightCast_finFunctionFinEquiv
#print axioms OpenAI.AL3D.colEquivVar_restr_apply
#print axioms OpenAI.AL3D.powerset_eq_biUnion_projFib
#print axioms OpenAI.AL3D.projFib_pairwise_disjoint
#print axioms OpenAI.AL3D.sum_projFib_extendId
#print axioms OpenAI.AL3D.regReindexEquiv_compl_iff
#print axioms OpenAI.AL3D.colEquivVar_swap
#print axioms OpenAI.AL3D.sum_powerset_eq_sum_projFib
#print axioms OpenAI.AL3D.hamiltonianVar_eq_submatrix
#print axioms OpenAI.AL3D.sum_attach_eq_dite
#print axioms OpenAI.AL3D.sum_submatrix
#print axioms OpenAI.AL3D.ptrace_submatrix_split
#print axioms OpenAI.AL3D.hamiltonianVar_eigenvector
#print axioms OpenAI.AL3D.star_dotProduct_regReindex
#print axioms OpenAI.AL3D.hasGlobalGap_hamiltonianVar
#print axioms OpenAI.AL3D.sum_nonneg_re
#print axioms OpenAI.AL3D.dotProduct_sum_mulVec
#print axioms OpenAI.AL3D.compE
#print axioms OpenAI.AL3D.compE_entry
#print axioms OpenAI.AL3D.ptrace_eq_sum_compE
#print axioms OpenAI.AL3D.posSemidef_ptrace'
#print axioms OpenAI.AL3D.vonNeumann_witness_ext
#print axioms OpenAI.AL3D.vonNeumann_congr
#print axioms OpenAI.AL3D.restr_congr
#print axioms OpenAI.AL3D.regionEntropy_pureState_eq
#print axioms OpenAI.AL3D.fibre_eq_of_column_closed
#print axioms OpenAI.AL3D.regionEntropy_pureState_column_closed
#print axioms OpenAI.AL3D.slab_column_cuts_of_planar_var

end OpenAI.AL3D
