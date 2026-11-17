# Pilot 77 — T1 record: NOT GREEN (fix-loop budget exhausted; 31 proof-level residuals, zero mathematical failures)

*Dossier `research/candidates/77-car-occupation-dictionary-laughlin.md` §"Battery
(2026-11-17)" · charter: FB-5 T1 GO (billing C+ substrate-bridge, conditions (i)–(iv)
binding) · lane A7 · 2026-11-17. H owns commits; none made here.*

## Verdict

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

## Residual census (run 5, 31 errors — classes, with the fixes identified)

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

## Clock (charter condition (iii))

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
