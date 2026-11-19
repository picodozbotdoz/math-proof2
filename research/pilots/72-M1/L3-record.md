# L3-record — pilot 72-M1, tranche T3 continuation (W2-4: L3b–d + interface theorem)

Lane R2 (close-out gates → W2-4 re-task), 2026-11-19. Spec: `pilots/72-M1/L3-spec.md`
§3–§6 (L3a landed 2026-11-16 GREEN, `l3a-run6-GREEN.log`). This record covers the
post-K continuation fire (iteration 5 wave 1; day-1-class: prepared + fired, ALL
commits held for H post-K landing).

## CHARTER-ITEM-3 AMENDMENT (2026-11-19 late): the re-open charter's FINAL ROUND fired
## (runs 14–16, ≤3 cap) — isAdmissible + the transport identity now TRIAD-CLEAN; the
## ladder closes NOT-GREEN at cap (the hz-reality block + attach-bridge forms remain;
## 3-item next-wave fix list in the stop-note §CHARTER-ITEM-3 RECORD; no further grants)

Run 14 flipped `isAdmissible_ΦL` AND `hamiltonian_gridDom_eq` to triad-clean (the
`Finset.mul_sum` vs `sum_mul` direction-pair decoded — the two scalar sides are
different lemmas at this pin). Runs 15–16 narrowed the residual to the hreal/hz
reality block (reopened by the conj→star restate; its inner sum-conversions are the
same class as the solved hQ pattern) and the attach-bridge. Final clean set: L3b,
submatrix_mulVec_ec, eig_toGrid, edgeBoundary_le_boundaryCard, isAdmissible_ΦL,
hamiltonian_gridDom_eq + all T1/T2/L3a. Contaminated: hasGlobalGap (hz-block),
interface (inherits). 16 runs, four grant rounds, zero math defects, T1/T2 clean
throughout. W2-4 stays HONEST-PARTIAL — deeper than at wave-4 open (the L3d
superstructure is now kernel-clean end-to-end; only the L3c-reality packaging and
one bridge conversion remain).

## FINAL-ROUND AMENDMENT (2026-11-19 night): the ≤2-run final grant fired (runs 12–13) —
## L3c + boundary lemmas now TRIAD-CLEAN; ladder still NOT-GREEN at wave close (final
## honest stop; 4 named mechanical fixes charter the next wave — `logs/l3bd-stop-note.md`
## §FINAL-ROUND ADDENDUM: the hQ-tail is a one-word `Finset.mul_sum` fix)

Run 12 flipped `hasGlobalGap_of_fullSystemGap` (L3c) and `edgeBoundary_le_boundaryCard`
to triad-clean — the Loewner gap transfer, the quadratic-form/reality assembly, and both
boundary-comparability directions all close kernel-clean. Run 13 rotated the remaining
form-mismatches (5 sites; hQ-tail one word from closing). Final triad-clean set: L3b,
submatrix_mulVec_ec, eig_toGrid, L3c, edgeBoundary_le_boundaryCard + all T1/T2/L3a.
Still contaminated: isAdmissible_ΦL, hamiltonian_gridDom_eq, the interface theorem.
13 runs total, zero math defects, T1/T2 regression OK throughout.

## GRANT-ROUND AMENDMENT (2026-11-19, evening): continuation fired (runs 9–11), still
## HONEST PARTIAL at grant-exhaustion — the residual is 3 displayed-form one-liners

The continuation grant (mechanical class, ≤3 runs) executed: adj_split CLOSED (the
case-2/3 goal-slot swap — run 9); the hQ/hN transports and the final assembly each
narrowed to displayed-form one-liners (runs 10–11; the `submatrix_add` pointwise-function
signature decoded via double congrFun). Descent 8 → 4 → 4-smaller; T1/T2 regression OK
every run. NOT GREEN at grant exhaustion; next-fix list of 3 one-liners recorded in
`logs/l3bd-stop-note.md` §GRANT-ROUND ADDENDUM (forms verbatim from run-11's errors).
Zero mathematical defects throughout.

## State at close of the ≤8-run budget (honest): HONEST PARTIAL — not GREEN

**Discharge status per spec-decl:**

| spec item | decl | state at run 8 |
|---|---|---|
| L3b (§3) hΩ discharge | `toGrid_star_dotProduct_self` | **GREEN, TRIAD-CLEAN** (0 sorryAx) |
| interface (viii) reverse bound | `edgeBoundary_le_boundaryCard` | elaborated; contaminated only via `adj_split` (2 of 4 cases) — mechanical |
| L3c (§4) gap transfer | `hasGlobalGap_of_fullSystemGap` | proof complete in structure; blocked on the `hQ` transport-sum elaboration (mechanical) |
| L3d (§5) admissibility | `isAdmissible_ΦL` | proof complete in structure; contaminated via residual mechanical sites |
| L3d (§5) transport identity | `hamiltonian_gridDom_eq` | blocked on the final submatrix-assembly orientation (1 site, mechanical) |
| eig-transfer (new lemma) | `submatrix_mulVec_ec`, `eig_toGrid` | **GREEN, TRIAD-CLEAN** (`eig_toGrid` 0 sorryAx) |
| interface (§6) | `interface_areaLaw_uniformAreaLaw` | statement elaborates; blocked on `hamiltonian_gridDom_eq` + L3c residuals |

Descent 47 → 48(parse) → 39 → 15 → 9 → 9 → 9 → 8 error-lines across 8 runs; T1/T2
regression OK in every run (0 errors, 0 sorry-warnings); ZERO mathematical defects —
every failure class is a name/elaboration-shape issue. STOP per §7's budget guard:
`logs/l3bd-stop-note.md` (descent table + the 3 residual classes + the next-instance
fix list; estimated 1–2 further fix rounds to GREEN). Logs: `logs/l3bd-run{1..16}.log`,
provenance headers in each (substrate mathlib `ff2494ea` v4.36.0-rc2, doz CLI, SPEC
2cpu/4GB soft, LEAN_NUM_THREADS=2, telemetry in every tail; OVER-class = mmapped-olean
mem-burst only — investigate-not-upgrade, no upgrade requested or needed).

## Statement-shape notes vs the spec sketches (recorded per the L3a precedent)

1. **L3c carries `(hH : H.IsHermitian)`** — the Loewner form is only defined on the
   Hermitian difference; `IsGridHamiltonian.2.2` supplies it in the interface. The
   spec sketch's hypothesis list omitted it.
2. **L3d landed in the injection-compression shape** (the spec §5 fallback clause
   anticipated shape-recording): `ΦL X := (hermPart (term)).submatrix (padConfig X)
   (padConfig X)` on matched shapes, `0` elsewhere — `padConfig` is the zero-extension
   of a partial lattice configuration. This makes the admissibility norm bound a
   one-line consequence of the compression contractivity lemma
   `opNorm_submatrix_le : ‖A.submatrix ι ι‖ ≤ ‖A‖` (proved via `Eᴴ * E = 1`,
   `Matrix.l2_opNorm_conjTranspose_mul_self`, `Matrix.l2_opNorm_mul` — the CStar
   route), and kills the fiber-counting entirely. The full matrix identity
   `hamiltonian_gridDom_eq` is carried as stated (not the weaker eig-transfer-only
   fallback), with `hV`/`hE` SupportedOn-witness binders.
3. **`[NeZero q]`** on the padConfig family (ΦL, admissibility, identity): the
   zero-extension needs a `Fin q` point; the interface derives it from `2 ≤ q`.
4. **`submatrix_mulVec_ec`** added as a named lemma (the asMap↔submatrix mulVec
   transport used by `eig_toGrid`).
5. The spec's `(a + aᴴ) / 2`-family hermPart form and the §5 extraction pattern are
   reused verbatim from L3a.

## v4.36 substrate finds (recorded for the next instance; T2-trap-class additions)

`hasse` needs `open SimpleGraph` in T3; `dotProduct` is root-level (NOT
`Matrix.dotProduct`) at this pin; `ofLp`/`toLp` are `WithLp.ofLp`/`WithLp.toLp`;
`Complex.conj` does not exist as such — use `RCLike.star_def` + `Complex.conj_ofReal`;
`Finset.sum_congr` takes an equality (not subset) as its first arg; `zero_le` is
proof-not-function; type-sums need `Finset.sum_congr rfl`; `Complex.normSq` equations
carry the ℤ-cast form (`(normSq z : ℂ) = conj z * z`) — the cast-inside-sum pattern
(`Complex.ofReal_sum`) is the reliable assembly route; `Finset.sum_filter_add_sum_filter_not`
has no side-condition; anonymous ⟨⟩ against `ForwardAdjacent` needs a full-Or `show`
(definition unfolding is not automatic for ctor-inference).

## Sweep/INDEX notes for A1/H (when this lands GREEN in a future instance)

- T3 grows (now 1,049 LoC, sha at run 8: see stop-note run-index) — re-stage
  `AxPilot72_M1_T3` at the new sha; the L3a-era closure log `axcheck-l3a-run1.log`
  stays historical.
- New named decls to cover in any full-coverage custody stage: `toGrid_eq_ofLp`,
  `fin_eq_of_val_eq`, `adj_split`, `edgeBoundary_le_boundaryCard`, `injMat`-family,
  `opNorm_submatrix_le`, `agreeSites_iff`, `extendId_comp_eq`, `padConfig`-family,
  `ΦL`-family, diam/supports lemmas, `sum_submatrix`, `extendId_zero`,
  `submatrix_mulVec_ec`, `eig_toGrid` — plus the six spec-named ones.
- ZERO sorry tokens in the file at every fired version (the header's "no `sorry`"
  prose line is the only grep hit); the run-8 residuals produce `sorryAx` in
  downstream `#print axioms` purely via failed-decl contamination, which the runner
  reports as errors (the acceptance criterion "0 errors" is honestly NOT met — this
  record does not claim GREEN).

— lane R2, 2026-11-19. Files: `P72M1T3.lean` (v8, worktree agent-03, uncommitted,
held for H post-K), `logs/l3bd-run{1..8}.log`, `logs/l3bd-stop-note.md`, this record.
