# AL-P2 rebuild precharter — the canonical z-rank enumeration (find #5 re-charter; iter-5 front-load)

Consolidates `A2-gaps.md` §4(b)/§5 (lane A4, 2026-11-18; AL-3D wave-3 lineage). Copy-paste-
ready for the iter-5 typeset. Baseline: P2-c closed 100% GREEN (runs 9–13,
`logs/alp2-run13-p2c-closureverify.log`); P2-d partial GREEN (8 generic/plumbing theorems)
+ parked at find #5; P2-e not attempted. Everything below lives in `research/pilots/al3d/`
(app `crossmath-pilot-al3d`, mathlib `ff2494ea`, `leanprover/lean4:v4.36.0-rc2`, doz-CLI
Modal route, 2 cpu / 4 GB / telemetry / LEAN_NUM_THREADS=2).

## 1. The obstruction (statement-level find #5, the parked state)

The P2-d extend-relabel swap and the Hamiltonian identification

    hamiltonianVar (projF Λ) (colCard Λ) Ψ = (hamiltonian3D Λ Φ).submatrix ē ē,
    ē := (regReindexEquiv Λ q).symm

hinge on the restriction-compat workhorse

    colEquivVar Λ q X' hX' (restr hX' (regReindexEquiv Λ q x)) = restr (fibre_subset Λ X') x

which reduces per-site (via the GREEN `regReindexEquiv_comp_colEquivVar` +
`regReindexEquiv_apply`) to comparing `colRegEquiv`-encodings of the SAME column
enumerated through DIFFERENT classical instances:

    heightCast (colRegEquiv (Λ := Λ) u (x |col Λ u)) = colRegEquiv (Λ := fibre Λ X') u (x |col (fibre Λ X') u)

`col Λ u` and `col (fibre Λ X') u` are propositionally equal (`col_fibre_eq`, GREEN) but
distinct TERMS, so the two `colRegEquiv`s carry distinct `Fintype ↥(col · u)`-instance
arguments and hence unrelated `Fintype.equivFin`-values. Failed-route family (all four
cited from run logs):

- **run 23** (`logs/alp2c-run23-parked.log`; the original P2-c park): direct per-index
  transport along `proj site = u` — every `rw`/`simp` fails motive-incorrectness on the
  `Fintype.equivFin`-choice transport (the `.symm` side is an `Eq.rec` that never reduces).
- **run 9, A2.lean:679** (`logs/alp2-run9-p2c-closure.log`): `regEquivOfEq` with implicit
  `loc` against a spelled pi-type — higher-order pattern unification of `Reg ?loc X'`
  fails (fixable, and fixed: `loc`-explicit — but only the PRESENTATION was fixed there;
  the value-level comparison below remains).
- **runs 10/12** (`logs/alp2-run12-p2c-finalgreen.log` tail-200): the value-level
  comparison itself — the height cast's opaque proof obstructs `kabstract` on any
  `col (fibre Λ X') u` rewrite (motive not type correct); and even with the cast
  eliminated (`cases` at variable cardinalities is legitimate), the residual
  `colRegEquiv`--vs-`colRegEquiv` comparison is between different classical enumerations.

**Mathlib-gap note:** there is NO `Fintype.equivFin`-congruence lemma on this pin —
nothing in the spirit of " propositionally equal types with (canonically related)
instances give equal `equivFin` values ". `Fintype.equivFin`'s value is a function of
the classical instance data; two distinct instance terms for propositionally equal
types yield unrelated enumerations, and mathlib offers no transport. (Contrast:
`Finset.orderIsoOfFin` is built from the ORDER via `Finset.sort` of the Multiset — a
function of the Finset data — so its congruence along `Finset`-extensionality +
`Multiset`-congruence IS provable. That contrast is the design lever below.)

## 2. Rebuild scope (statements frozen; bodies move)

Replace the CHOICE-BASED column enumeration with the DONOR'S CANONICAL z-rank
enumeration (donor `Cylinder3D.lean` architecture — pattern-only, mathlib-only):

- **New core (choice-free):** for a column `col Λ u`, the z-rank of a site
  `rank x := ((col Λ u).filter fun y => y.2.2 < x.2.2).card`, with the site-order
  induced by `col_inj_on_z` (A1: z is injective on a column) and `col_heights`
  (A1: slab columns live in z ∈ [0, h)). Encodings built from the z-IMAGE Finset via
  `Finset.orderIsoOfFin` (order-canonical, congruence provable per §1's contrast) or
  directly by `rank`/`Finset.min'` induction — either way, a function of the Finset
  DATA, not of a classical instance.
- **Bodies that move:** `colRegEquiv`, `regReindexEquiv`, and the supporting
  `colToFin`/`colIdxOf`/`colSiteOf`/`colEquivVarToFun`/`colEquivVarInvFun` (+ the
  `colEquivVar` composite's `regReindexEquiv` factor). `colEquivVar`'s composite SHAPE
  (heightCasts ∘ regEquivOfEq-symmed ∘ regReindexEquiv-symmed — the P2-c closure) is
  retained; only the regrouping factor's body changes.
- **Statements unchanged (frozen):** all GREEN P2-b declarations (`colSigmaEquiv`,
  `colRegEquiv`'s TYPE, `regReindexEquiv`'s TYPE, `colCard_le_h`) and the whole P2-c
  surface (`colEquivVar`'s TYPE, `projInteraction` + its three clauses +
  `isAdmissible_projInteraction`), plus the GREEN P2-d generic layer (consumes none of
  the moving bodies). The four support layers I–IV are untouched.
- **Key new lemma class (the un-park key):** column-encoding congruence — for
  propositionally equal columns `S = S'` (as Finsets), the canonical encodings of `S`
  and `S'` are EQUAL (proved via Finset-extensionality + Multiset/sort-congruence; the
  `orderIsoOfFin` route) or, in rank-form, `rank` is extensional in the column. With
  it, the per-site comparison of §1 closes by `col_fibre_eq` rewriting — the dependent-
  motive obstruction vanishes because there is no `Eq.rec` left to dodge.

## 3. Re-verify plan (milestone-gated; every gate = one Modal verification run minimum)

- **M0 — rebuild + regression:** new canonical core (rank/orderIso lemmas, congruence
  class) + moved bodies; re-verify P0 → A1 → A2 with the P2-b/P2-c statements
  UNCHANGED (regression: run-13's full-coverage triad-only audit must reproduce).
  Includes re-proving the two rfl-transparency API lemmas (`regReindexEquiv_apply`'s
  `rfl` may need adjusting to the new body) and `regReindexEquiv_comp_colEquivVar`.
- **M1 — L1 GREEN:** the restriction-compat workhorse via the congruence class.
- **M2 — swap + D4:** extend-relabel swap (entrywise, consumes L1 + `sdiff_fibre_eq` +
  complement form of L1), the powerset-regrouping (`Finset.sum_biUnion` over
  `projFib`-fibres of `Λ.powerset`), and the Hamiltonian identification
  (rides `extendId_extendId`, GREEN).
- **M3 — P2-e assembly:** eigenvector/gap/norm transports (already GREEN, generic) +
  the entropy identification for column-closed cuts (partial-trace commutation with the
  regrouping — same per-column structure as L1; consumes support layer III's
  `vonNeumann_submatrix_equiv`, GREEN) + the final `SlabAreaLawColumnCuts3D` discharge
  from the `PlanarAreaLawVar` binder (instantiate G := projLattice Λ, Λ' := projF Λ,
  hU := colCard Λ, Ψ := projInteraction; boundary side rides A1's `edgeBoundaryG_card_le`,
  GREEN). Full-coverage audit + sorry-token classifier per close-out convention.

## 4. Budget estimate (from the runs 9–13 baseline)

Warm-layer elaboration runs cost 45–97 s wall (telemetry clean at 2 cpu / 4 GB
throughout — no breach risk expected). The 9–13 descent's fix-density: pin-level API
quirks cost ~1 fix-run per 2–3 fired runs (namespaces, instance binders, simp-shape);
NEW-proof milestones were ~1 run per milestone + 1–2 fix runs when entrywise defeq
joins were involved. Estimate: M0 = 3–4 runs (new core + congruence class + regression
re-verify); M1 = 2–3; M2 = 3–5 (largest new-proof mass); M3 = 4–6 (assembly + honest
close). **Total 12–18 runs ≈ 3–4 lane-sessions at the ≤4-run discipline.** Risks:
`orderIsoOfFin`-congruence proof shape on this pin (untested — first M0 risk), and the
P2-e partial-trace commutation (donor's own hard content). Both are bounded by the
M-gates; an honest park at any gate keeps all earlier milestones GREEN.

## 5. Fences carried forward (unchanged)

No `AreaLaw3D` content (Targets.md §A :23; C.1–C.4); B.1 donor-owned; full
`SlabAreaLaw3D` HARD-STOPPED (prework stop-gate ii); `PlanarAreaLawVar` binder NOT
discharged (honesty ledger, prework §2.4). `SlabAreaLawColumnCuts3D` remains
weaker-by-cut-class and conditional, per P0's frozen statement layer.
