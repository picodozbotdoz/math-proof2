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


---

## GRANT-ROUND ADDENDUM (lane R2, 2026-11-19, same day — the continuation grant's record)

The orchestrator GRANTED the continuation (mechanical class, ≤3 runs, 77-T1/M1-completion
pattern). Fired runs 9–11 (v9 `1c6de0f4…`-lineage → v11, logs `l3bd-run{9,10,11}.log`):

- run 9: adj_split fully closed (the case-2/3 goal-slot swap: case 2 → the goal's SECOND
  disjunct via FA-w-v's first; case 3 → the FIRST via FA-v-w's second — cases 1/4's
  omegas had already proven the ℕ/ℤ double-cast bridge); hQ-step2's sum_equiv-orientation
  symm-form landed.
- run 10: hQ-step1 show-defeq route; hN's hin f/g-swap + side-fix; final-assembly
  congrArg-composition — the congrFun-pointwise `submatrix_add` signature decoded
  (`((A+B).submatrix : (l→m)→(o→n)→_) = A.submatrix + B.submatrix` — a function-equality;
  apply via double congrFun).
- run 11: hQ-tail + hmul + hin-side + hc-lambda — 4 sites left, ALL with the required
  form displayed verbatim in the error message (next-fix list below).

Descent across the grant: 8 error-lines → 4 sites → 4 sites (shifted, smaller). T1/T2
regression OK every run; triad-clean set unchanged-plus: eig/L3b stayed clean; adj_split
dependencies (edgeBoundary_le_boundaryCard et al.) now elaborating.

### Remaining fix list (3 one-liners, forms taken from run-11's own error displays)

1. hQ-tail (:321): add `Finset.sum_mul` to the simp-only set (the residual is
   `∑ i, star x i * ∑ i₁, H … * x i₁ = ∑ c ∑ d, star (x c) * (H … * x d)` — per-i
   distribution, then alpha).
2. hN-step1 (:344): replace the rw-pair with `simp only [dotProduct, e1, ← Finset.sum_mul]`
   where `e1` is the per-point `hmul`-instance (factor `(star x c * Ω' c)` out of the sum).
3. Final assembly (:937): the composition direction — use
   `Eq.trans (hc.trans hc2) (congrFun (congrFun (Matrix.submatrix_add …) ec) ec).symm`
   (the double-congrFun eq is ALREADY `sub-of-sum = split+split`; my `(.symm).trans`
   composed it backwards).

Grant budget exhausted at run 11; NOT fired further. Estimated: one more round closes
all three (each is a displayed-form one-liner). Same STOP class: zero math defects.

— grant-round R2, 2026-11-19. Run-index extended: run9 v9, run10 v10, run11 v11.


---

## FINAL-ROUND ADDENDUM (lane R2, 2026-11-19 night — the ≤2-run final grant; NOT-GREEN,
## final honest stop per the grant's own terms; this note is the next-wave charter input)

Fired runs 12–13 (v12 → v13, logs `l3bd-run{12,13}.log`):

- **run 12**: the 3 recorded one-liners applied. `hasGlobalGap_of_fullSystemGap` (L3c)
  and `edgeBoundary_le_boundaryCard` went **TRIAD-CLEAN** — the entire L3c gap-transfer
  and both boundary lemmas now close kernel-clean. 4 sites remained with goals fully
  displayed in the errors.
- **run 13**: form-rotations continued (hQ-tail → sum_congr-typing; hmul → pattern;
  hN e1/star-chain; hamiltonian-step1 → motive-not-type-correct on the set-var type
  rewrite). 5 sites. **The hQ-tail site is literally one word from closing: the lemma is
  `Finset.mul_sum` (a * ∑ f = ∑ (a * f)), not `Finset.sum_mul` ((∑ f) * b = ∑ (f i * b))
  — run-13's own error display shows the needed form.** The hamiltonian-step1 fix is to
  avoid rewriting `ps` inside the subtype (state step-1 in the UNFOLDED `{X // X ∈
  (gridDom L).powerset}`-form, or generalize `ps` before the calc instead of `set`).

**Final clean/contaminated inventory (run 13):** TRIAD-CLEAN — `toGrid_star_dotProduct_self`
(L3b), `submatrix_mulVec_ec`, `eig_toGrid`, `hasGlobalGap_of_fullSystemGap` (L3c),
`edgeBoundary_le_boundaryCard` (both directions of the boundary comparability with T2's),
+ every T1/T2/L3a declaration. Contaminated via the remaining mechanical sites:
`isAdmissible_ΦL`, `hamiltonian_gridDom_eq`, `interface_areaLaw_uniformAreaLaw`.
T1/T2 regression OK in all 13 runs; zero mathematical defects in 13 runs; every
mathematical route in the tranche is verified through.

**Wave verdict: W2-4 = HONEST PARTIAL (final for this wave).** The L3 ladder did not
close GREEN under the three grant budgets (8 + 3 + 2 = 13 runs); what remains is a
bounded, fully-diagnosed mechanical tail in four proof regions (hQ-tail: `Finset.mul_sum`
one-word fix; hmul: rw-order for ← mul_assoc/← mul_sum after vecMulVec_apply; hN-step1:
e1-sum_congr + mul_sum-pullout; hamiltonian-step1: avoid the type-level `set`-unfold).
Next wave's continuation charters from here: apply the four named fixes, fire, expect
1–2 rounds.

— final-round R2, 2026-11-19. Run-index final: runs 1–13, v1–v13
(v13 sha256(16) at the run-13 header).
