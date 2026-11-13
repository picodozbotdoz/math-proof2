# Pilot 52 close-out note — unified-ccr-fock-layer (M1)

Lane A8 (pilot-triage-52/20), Cycle 2, 2026-11-13. Task: diagnose the recorded
"axcheck FAIL 13–15 err, 9 sorryAx, mid-flight" status (INDEX.md pilots-logs line,
`logs/axcheck-run1.log`) and either fix to GREEN axioms-clean or close out honestly.

## Verdict: VERIFIED-GREEN — already fixed by lane R2 on 2026-11-09; reproduced and
axiom-audited fresh in Cycle 2. Not REFUTED, not STALLED. Milestone M1 (the
N1-universal dual-family statement per dossier §Pilot outcome) is kernel-verified:
`OccupationPair.dual_family` proved ONCE with no case-split on ε, axioms
`[propext, Quot.sound]` (not even Classical).

## What the FAIL records actually were (diagnosis)

Both FAIL snapshots predate the fix and are elaboration-level, not mathematical:

1. `_unattributed/pilot52_run2.log` (mtime 19:43, lane R2; NOW ATTRIBUTED — moved to
   `logs/m1-run2.log` with an attribution header): iteration 2 of 14, 13 errors.
   The error classes (blueprint §3 table): deprecated `Module.End.mul_apply` /
   `.one_apply` aliases in simp calls leaving unsolved goals; recursive `ext`
   descending into ExteriorAlgebra's own ext principle; ite-application from the
   unsplit mixed relation; `← mul_add` misuse; silent no-op python edits (runs 8–9);
   and finally one tactic block (`fermionicPair.ac_self`).
2. `logs/axcheck-run1.log` (19:48, lane R9's batch): 15 errors / 9 sorryAx lines —
   staged over the SAME mid-flight file. The 9 sorryAx are Lean's auto-sorry of FAILED
   ELABORATIONS (error recovery), not textual sorries: sorry-warnings = 0 in every
   run 2–14, the final-sweep Step A classifier found 0 sorry tokens in pilot files
   (ledger §6), and the `Unknown constant CrossMath.Pilot52.bosonic_unweighted`
   error at :274 is the appended `#print axioms` referencing a declaration whose
   elaboration had aborted earlier in the file. Ledger §4 already recorded this
   correctly at the time ("error-recovery artifact of failed elaborations … NOT
   hidden sorries").

## Resolution history (all logs in `logs/`)

13 → 5 → 2 → 1 → … → 1 → 0 errors across runs 2–14 (`m1-run2 … m1-run14-green`,
2026-11-09 19:43–20:19; full per-iteration fix table in `52-blueprint.md` §3).
Run 13's `[BLOCKED-defeq]` hypothesis (Exterior↔Clifford ι-spellings not unifiable)
was RETRACTED at run 14: the ι-spellings do unify under simp's reducible-rfl; the
rfl failure was against an unreduced `• x` coefficient. Run 14: whole file GREEN,
6/6 `fermionicPair` fields proved, no sorryAx anywhere. The final sweep then
confirmed (`logs/axcheck-final.log`: AxPilot52_M1 OK, 15 axiom-lines, 0 sorryAx) —
so INDEX's mid-flight line was simply never refreshed.

## Cycle-2 reproduction (this lane, 2026-11-13, Modal app `crossmath-probe`)

- `logs/m1-run15-cycle2-green.log` — `run_m1.sh` (new per-pilot runner, pattern of
  pilots 20/22): `M1.lean: OK; errors=0, sorry-warnings=0`, 3 benign unused-simp-arg
  warnings; in-file `#print axioms`: dual_family / sign_transposition =
  `[propext, Quot.sound]`, fermionicPair = `[propext, Classical.choice, Quot.sound]`.
- `logs/axcheck-cycle2.log` — full-coverage subset re-run (make_axcheck +
  axcheck_probe, both pilots 52+20 in one batch): AxPilot52_M1 OK, **15 axiom-lines,
  0 sorryAx**; all 12 theorems ⊆ {propext, Classical.choice, Quot.sound}
  (9 × `[propext, Quot.sound]`, 3 × triad).
- Environment note: this Cycle-2 shell blocks `sudo -n -u xyz`, so both runs used
  the doz modal profile (`/home/doz/dozenv/bin/modal`, workspace `semraker`), not
  xyz's `donniexyz888`; substrate identical (same image, mathlib `ff2494ea5e43…`,
  toolchain v4.36.0-rc2, 8,710 oleans).

## Artifact-trail updates made by this lane

- `pilots/_unattributed/pilot52_run2.log` → `pilots/52/logs/m1-run2.log`
  (header attribution appended; `_unattributed/` now empty).
- New: `pilots/52/run_m1.sh` (per-pilot runner, doz-modal default with xyz fallback),
  `pilots/52/logs/{m1-run15-cycle2-green,axcheck-cycle2}.log`.
- INDEX.md pilots-logs line: refresh PROPOSED to the orchestrator (52-M1 no longer
  "FAIL mid-flight"; unplaced-run note removed) — per STATUS.md governance, lanes do
  not edit INDEX.md; exact replacement line included in lane A8's report.
- Math content: NO edits to `M1.lean` — the committed file (292 LoC, 12 theorems) is
  byte-identical to what run 14 verified (warning line-numbers 222/267/279 match).

## What would be needed for M2 (from dossier/blueprint, unchanged)

The weighted refinement `WeightedOccupationPair` (eth `LemmaDual` full form: mixed
weights `w i`, Multiset/partition indexing, `z_μ` normalization, `aFam` sign-twists)
and the adjointness layer (openai `annihilate_create_inner`, Fock/NormalSquare.lean:10)
— both recorded as M2 design targets in `M1.lean`'s own docstrings and dossier §Pilot.
