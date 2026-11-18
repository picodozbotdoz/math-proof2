# Pilot 77 — T1 record: NOT GREEN (fix-loop budget exhausted; 31 proof-level residuals, zero mathematical failures)

*Dossier `research/candidates/77-car-occupation-dictionary-laughlin.md` §"Battery
(2026-11-17)" · charter: FB-5 T1 GO (billing C+ substrate-bridge, conditions (i)–(iv)
binding) · lane A7 · 2026-11-17. H owns commits; none made here.*

## COMPLETION UNIT (2026-11-18, lane A7 resumed) — T1-completion + T2 as ONE unit: T1 NOT-GREEN at 7 residuals (31→7); T2 7/8 TRIAD-CLEAN

*Re-charter per the 2026-11-17 session-end handoff (RESUME-BRIEF-ITER4 §Session-end
item 4): fold the two derived corrections into dossier 77, burn down the 31-residual
map, execute T2. Four Modal runs (the ≤4 + ≤4 budgets served by the same runs; doz
CLI, warm `crossmath-pilot-77` lineage, wall 57–107 s each, telemetry clean —
max_cpu 1.65, the one OVER-line in run 6 is the documented mapped-olean artifact).
Logs: `logs/t1t2-run{6,7,8,9}.log` with provenance headers.*

### Verdicts

- **T1: NOT GREEN at budget, 31 → 7 residuals** (run 8 is the best state and what
  the tree carries; the run-9 attempt at the last 7 regressed to 16 and was
  reverted). Every residual is site-local and root-caused (census below). Zero
  mathematical failures across all four runs: the corrected statements
  (hyperbolic submodel rank 2(Q+1); number-operator intertwining) elaborated
  exactly as designed, and the amended `occupationElem_mul_self`,
  `commute_occupationElem` (via `CliffordAlgebra.mul_ι_mul_ι_mul_comm`),
  `traceQuadraticForm_isoV`, `fockDictionary_apply_hypE/hypE'`,
  `dictionary_numberOp/idempotent/commute` all verify. The remaining 7 sit in
  `pairBilin`'s two outer field proofs (2) and the two undecided-ite cases of
  `isoV_hypE`/`isoV_hypE'` (5); `map_iso_occupationElem` — the element-level
  dictionary to tauceti's own declaration — CLOSED in run 8 (the
  `Matrix.single` instance bridge goes through tauceti's `_def` theorems, not
  `unfold`).
- **T2: 7 of 8 top-level theorems TRIAD-CLEAN** (`[propext, Classical.choice,
  Quot.sound]`, 0 sorryAx): the mod-2 regrading decomposition
  `isParityBlock_iff_sum_parityProj`, the coarsening
  `isParityBlock_of_isDegreeBlock`, both sum-closure lemmas, and the three
  Laughlin-instance theorems `pairHamiltonian_isDegreeBlock`,
  `pairHamiltonian_entry_eq_zero` (the donor's `Model.lean:138` re-derived at the
  abstract coefficient shape), `pairHamiltonian_isParityBlock`. ONE tainted:
  `isDegreeBlock_iff_sum_blockProj` (the `⨁_n` decomposition iff) carries sorryAx
  via an elaboration error the runner's error filter missed (rc=1, errors=0 —
  the error text sits in the unprinted output region; most likely a filter-format
  miss in the `rw [Matrix.sum_apply, Finset.sum_eq_single (deg a)]` block). T2's
  tauceti-SetLike instantiation through Φ stays the recorded extension condition
  (scope honesty note in `T2.lean`'s header).
- **Physlib clock (condition (iii)): FIRED PARTIALLY — a novelty event.** Master
  ticked `2026-11-17T09:42:38Z → 2026-11-18T08:24:23Z → 13:00:37Z` (end-tick) and
  landed `Physlib/QFT/PerturbationTheory/` (54 files, Tooby-Smith):
  `CrAnFieldOp` + `FieldOpFreeAlgebra` + **`WickAlgebra`** — the free CrAn algebra
  quotiented by the ideal making same-statistics pairs super-commute. The
  equal-statistics HALF of CAR now exists on physlib (a² = 0, aa′ = −a′a for
  fermions, in supercommutator form); still ABSENT there: the {a, a†} mixed
  relation (Wick keeps it central), any Clifford/quadratic-form content, any
  finite Fock-matrix model, any tauceti connection. T1's CAR-transport
  sub-content drops to formalization-parity against that layer; the dictionary
  core stays clean in both corpora. Full note in dossier 77 §T1/T2 EXECUTION
  UPDATE. Seed-13's "no CrAnFieldOp" gap also CLOSED.

### Residual census (run 8, 7 errors — the work list for any follow-up)

1. `pairBilin` outer `map_add'` (~:300) and `map_smul'` (~:308): `ext u` on the
   nested-linear-map goal decomposes through `LinearMap.inl`/`LinearMap.single`
   compositions (the Pi-ext chain), leaving goals the `Finset.sum_add_distrib`
   /`Finset.mul_sum` rewrites cannot recognize. Fix: hand-rolled
   `LinearMap.ext` with an explicit pair argument (no `ext` tactic), or restate
   `pairBilin` as a composition of `LinearMap.proj`-style components.
2. `isoV_hypE` (inr x, inl y) and `isoV_hypE'` (inl x, inr y), undecided-ite
   cases (5 errors): full `simp` fed a `¬(x = i ∧ y = i)` hypothesis leaves
   `i = x → ¬ i = y`-shaped proof obligations. Fix (validated on paper, run 9
   regressed on a DIFFERENT sub-issue — the anonymous `fun h => hyi (h.trans _)`
   simp-args mis-elaborate): pre-split per variable (`by_cases hxi : x = i` /
   `by_cases hyi : y = i`, four cases) with all side conditions as typed `have`s.

### Durable finds (pin API, recorded in dossier 77 §T1/T2 EXECUTION UPDATE)

rw-metavariable fixation (per-instance rewrites need `simp`-with-lemma);
`Finset.sum_add_distrib : ∑ (f+g) = ∑ f + ∑ g` orientation; no
`Prod.fst_smul`/`Prod.snd_smul` on the pin (use rfl-haves); matrix rings lack
`NoZeroDivisors` (halve via scalar inversion); `eq_neg_of_add_eq_zero_right`
solves for the RIGHT summand; `Nat.mod_two_lt` → `Nat.mod_lt _ two_pos`; omega
needs `Finset.card_pos` for card-erase goals; `Matrix.single` instances from
`unfold` differ from statement-elaborated ones (use `_def` theorems).

### Runs (completion unit)

| run | wall | T1 errors | T2 errors | note |
|---|---|---|---|---|
| 6 | 68 s | 23 | 6 | first combined run; physlib tick assessed (novelty event) |
| 7 | ~60 s | 13 | 2 | occupationElem chain + commute + isoV fields landed |
| 8 | 107 s | **7** | 1 | map_iso closed via _def theorems; T2 down to the omega |
| 9 | 57 s | 16* | 0† | *last-7 fix attempt regressed (reverted); †T2 errors=0 but rc=1, one sorryAx |

*T1 tree state = run 8 (post-revert). T2 tree state = run 9.*

— lane A7, 2026-11-18.

## Verdict (runs 1–5, 2026-11-17 — historical; superseded by the completion unit above)

**T1 NOT GREEN at loop exhaustion.** Five runs (the charter's ≤5 fix-loop budget),
errors 50 → 39 → 37 → 38 → **31**; every remaining error is *proof-mechanics* (lemma-name
drift on the tauceti-manifest mathlib 1b1ccf4b, simp-set calibration, one binder-order
mismatch) — **zero mathematical failures**: all statements elaborate exactly as designed,
no `sorry` in the file (the `sorryAx` in the `#print axioms` lines of the run logs is the
error-sorry artifact of failed proofs, not content), and the two mathematical
corrections to the dossier's drafted T1 (below) were *derived*, not hit — the design held
through five rounds. The substrate line is fully proven: the tauceti own-lineage image
builds (clone d92acc5c → manifest mathlib 1b1ccf4b cache-hit → `lake build` of the two
imported GeneralLinear modules), elaboration runs, telemetry clean (runs 39–102 s; the
one OVER line is the documented mapped-olean artifact).

## The two mathematical corrections (stand regardless of GREEN; recorded in T1.lean's
header and to be folded into dossier 77)

1. **The drafted T1(ii) is dimensionally unsound.** A unital algebra hom
   `CliffordAlgebra (TauCeti.traceQuadraticForm ℂ N) →ₐ FockMatrix Q` cannot exist once
   `N * N > 2 * (Q + 1)`: the trace form is nondegenerate
   (`TauCeti.traceQuadraticForm_nondegenerate`), so the Clifford algebra is over ℂ a
   simple algebra of dimension `2 ^ (N * N)`, while `FockMatrix Q` has dimension
   `2 ^ (2 * (Q + 1))`. The even-subalgebra injectivity claim (via "dimension count
   `2^{Q+1} = #Occupation`") conflated the Fock space with its endomorphism algebra.
   The executed dictionary lives on the hyperbolic submodel `V` of rank `2 * (Q + 1)`,
   where the count goes through.
2. **The drafted T1(i) intertwining is algebraically ill-typed.** tauceti's
   `carOccupationElement i j` are idempotent (off-diagonal) and mutually commuting
   (`CAR/Occupation.lean:121/:138`); the drafted images `annihilator† * annihilator` are
   neither — no hom can send a commuting family to a noncommuting one. The corrected
   dictionary intertwines the hyperbolic occupation elements with the **number
   operators** `creator * annihilator` (diagonal, idempotent, commuting —
   `creator_mul_annihilator`), which is what the ported CAR delivers.

## What the file proves (design; statement set fixed through all five runs)

§1 ports (OAI LaughlinFock, statement-level, v4.34.1 donor read-only): `Orbital/
Occupation/FockMatrix/annihilator/creator/fermionSign` + the four CAR theorems
(`FermionOperators.lean:94/:102/:156/:190` pins; `annihilator_square` and
`annihilator_anticommute` GREEN in runs 2–5). §2–§6: the hyperbolic model `V`, its form
`qV (c,d) = ∑ c i * d i` (polar computed from the classical definition), `toFock`, the
Clifford-condition theorem `toFock_mul_self` (the CAR in quadratic form), `Φ :=
CliffordAlgebra.lift`, the abstract occupation elements `o i := ι (e' i) * ι (e i)` with
`occupationElem_mul_self`/`commute_occupationElem` (the `CAR/Occupation.lean:121/:138`
proof shapes from `ι_mul_ι_add_swap` alone), the transports (`Φ (o i) = creator Q i *
annihilator Q i`, idempotence and commutation through the hom), the isotropic-pair
isometry `isoQ` with `traceQuadraticForm_isoV`, and the element-level dictionary
`map_iso_occupationElem : map isoQ (o i) = TauCeti.carOccupationElement ℂ (.inl i)
(.inr i)`.

## Residual census (run 5, 31 errors — classes, with the fixes identified; historical — 31→7 in the completion unit)

- **One name fix**: `Matrix.mul_conjTranspose` → on this pin `Matrix.conjTranspose_mul`
  (the pin names it `conjTranspose_add`-style, as `Matrix.conjTranspose_add` already
  confirmed for +; `creator_anticommute` :277).
- **pairBilin field finishes** (~4): after `Prod.snd_add/Pi.add_apply` the goals are
  `∑ f + ∑ g` shapes needing one more `Finset.sum_add_distrib`-orientation pass.
- **`toFock` field finishes** (~4): same class (the `Pi.add_apply` fix landed; the
  smul-side needs `mul_smul` ordering).
- **eAB sum gymnastics** (~4): `expand1/expand2/merged` — the binder-order fix
  (`Finset.sum_comm` in expand2) landed; the residual is the final
  `Finset.sum_ite_eq`-orientation in `merged`'s tail.
- **polar trio + einl/einr ite-sums** (~8): `sum_ite_eq` vs `sum_ite_eq'` orientation
  per-site + `simp`-folding of `∑ x, 0` tails.
- **`fockDictionary`'s lift arity** (~2): `lift (hyperbolicForm Q) ⟨…⟩` landed; one
  further explicit-arg pass.
- Remainder: cascade of the above.

All are site-local; the estimate to GREEN is **one focused session (~1–2 further runs
under a relaxed budget)** — the mathematics is closed, only the pin's exact API shapes
remain.

## Clock (charter condition (iii)) — run-5 ticks; the 2026-11-18 completion-unit ticks and the novelty event are in the section above

Start-tick `pushed_at = 2026-11-17T09:42:38Z` (unchanged since the battery's
CAR-relations re-grep — trigger rule not fired); end-tick `pushed_at =
2026-11-17T09:42:38Z` — **physlib did not move during the pilot**; the T1 novelty
condition held throughout.

## T2-readiness (the charter's asked line)

**T2 is NOT unblocked today** — not for mathematical reasons but sequencing: T2's
S-class graded↔blocks lemma is independent of the failing glue, but the charter's
condition set (billing C+ pilot as one unit, physlib clock riding "the pilot") reads
T1+T2 as one charter; resuming means finishing T1's residual census first (site-local),
then T2 rides the same substrate line (the tauceti image is built and cached — marginal
cost per run is now ~100 s). Recommendation: **re-charter T1-completion + T2 as one
follow-up pilot** with the residual census above as its work list; the two dossier
corrections should be folded into dossier 77's T1 statement (they narrow it honestly:
hyperbolic submodel, number-operator images).

## Runs

| run | wall | errors | note |
|---|---|---|---|
| 1 | 73 s* | 50 | tauceti URL fix (TauCetiProject/TauCeti), lineage build + cache-hit confirmed |
| 2 | 97 s | 39 | `open scoped Matrix`, anticommute `ring` fixes |
| 3 | 90 s | 37 | fock_smul_cross, sum_pair_antisymm restructure |
| 4 | 39 s | 38 | conjTranspose_add name, expand2 binder order |
| 5 | 102 s | 31 | eAB merged-by-combine, polar finishes |

*Run 1's wall includes the image-layer build (tauceti module closure); runs 2–5 warm.
Logs: `logs/t1-run{1..5}.log` with provenance headers. Telemetry: all runs ≤1.33 CPU
(spec 2.0), one documented mem-OVER artifact line.

— lane A7, 2026-11-17.
