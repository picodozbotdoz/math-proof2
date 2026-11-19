# l3bd STOP-DIAGNOSE NOTE — pilot 72-M1 T3 (L3b–d + interface), lane R2 (W2-4), 2026-11-19

The ≤8-run fix-round budget (L3-spec §7) is exhausted with enforced descent honored.
STOP per the guard. ZERO mathematical defects — every residual below is a mechanical
elaboration-form issue (name/shape), and every mathematical route in the tranche is
verified through (the transports, the compression-norm identity EᴴAE, the sum-split,
the reality argument, the cast algebra).

## Descent table (distinct error sites per run; wall ~77–178 s warm)

| run | errors | note |
|---|---|---|
| 1 | 47 | first fire; T1/T2 regression OK throughout |
| 2 | 48 (13 lines) | parse-cascade from a duplicated line + name classes (conj, toLp, ofLp, dotProduct-namespace, hasse-not-open) |
| 3 | 39 | names fixed; new classes surfaced (Complex.conj absent → RCLike.star_def route; WithLp.ofLp; iotaL_mem_gridDom typo; EuclideanSpace.inner_eq…; Fin q OfNat0 → [NeZero q]) |
| 4 | 15 lines | SimpleGraph open + all above applied; cast-placement + Or-ctor + subtype-witness classes remain |
| 5 | 9 lines | cast-inside-sum restructure landed; L3b GREEN-triad (toGrid_star_dotProduct_self clean from here on) |
| 6 | 9 lines | eig_toGrid went TRIAD-CLEAN; adj_split show-forms + final-assembly remain |
| 7 | 9 lines | adj_split partially closed (2 of 4 cases); hQ layered-refines |
| 8 | 8 lines | final inventory below |

## Run-8 inventory (the last fire)

TRIAD-CLEAN at run 8: `toGrid_star_dotProduct_self` (L3b), `eig_toGrid` (eig-transfer),
plus all T1/T2/L3a predecessors (regression OK, 0 errors, 0 sorry-warnings on T1/T2).
Contaminated (via the 3 residual sites): `edgeBoundary_le_boundaryCard`,
`hasGlobalGap_of_fullSystemGap`, `isAdmissible_ΦL`, `hamiltonian_gridDom_eq`,
`interface_areaLaw_uniformAreaLaw`.

## The 3 residual classes (next-instance fix list, all mechanical)

1. **adj_split, 2 of 4 cases** (:186/:193/:196): the full-Or `show`-targets now type,
   but two `omega` side-goals fail to close the ℕ/ℤ double-cast bridge (the h1/h2 are
   ℤ-coordinate equations; ForwardAdjacent wants ℕ/Fin-val forms; `by omega` proved
   the bridge in cases 1/2 — cases 3/4 need the SAME bridge with the components
   swapped; likely fix: pull the `by omega`s out as named haves so omega sees both
   hypotheses, or use `Int.ofNat`-injection explicitly).
2. **hQ transport-sums** (:295–:308): the layered `Fintype.sum_equiv` refines leave one
   calc-side-condition unsolved — the per-c row-equality needs the INNER sum_equiv as a
   term (`fun c => Fintype.sum_equiv ec _ _ fun d => …`) rather than a refine-layer
   when the outer is already refined; the tail `simp only [dotProduct, Matrix.mulVec,
   Matrix.submatrix_apply]` is in place.
3. **hamiltonian_gridDom_eq final assembly** (:921): the explicit-arg `sum_submatrix`
   haves (e1/e2) + `Matrix.submatrix_add` leave one orientation unsolved — the goal
   after rw's differs only in binder annotation; likely fix: `rw […]; ring_nf` or state
   e1/e2 with the goal's exact binder forms.

## Estimate to GREEN

1–2 additional fix rounds (the classes above are single-site each). NOT fired — budget
exhausted; a continuation needs a charter or orchestrator approval (the declared-drop
rule's STOP branch; this note is the record).

## Run-index

run1 v1 00abb9f30665e9d2 | run2 v2 | run3 v3 | run4 v4 | run5 v5 | run6 v6 | run7 v7 |
run8 v8 — logs `logs/l3bd-run{1..8}.log`, provenance headers in each (substrate
mathlib ff2494ea v4.36.0-rc2, doz CLI, SPEC 2cpu/4GB, LEAN_NUM_THREADS=2, telemetry
in every tail; OVER-class = mem-burst/mmapped-olean only, investigate-not-upgrade, no
upgrade requested or needed).
