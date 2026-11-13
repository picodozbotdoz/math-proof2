# Pilot 20 close-out addendum — [runs-unrecorded] gap closed

Lane A8 (pilot-triage-52/20), Cycle 2, 2026-11-13. The 2026-11-09 M1 runs (9 cycles,
blueprint §6) were never persisted to `pilots/20/logs/` (only `axcheck-final.log` was);
this addendum records the reproduction run that closes the VERIFICATION-LEDGER
[runs-unrecorded] entry.

- **Verdict: GREEN, reproduced.** `research/pilots/20/run_m1.sh` on the unchanged
  `M1.lean` (582 LoC, 26 top-level theorems): `errors=0, sorry-warnings=0,
  other-warnings=5` — the same five benign linter notes blueprint §6 recorded
  (3 × `hCard` intentionally unreferenced, the documented M2 discharge anchor; 2 ×
  unused simp args). No elaboration fixes were needed on the current pin.
- **Axioms:** in-file `#print axioms` (10 headline theorems incl.
  `zetaK_engine_two_thirds`, `family_merge`, `merged_mult_of_common`, `assemble_eps`)
  all `[propext, Classical.choice, Quot.sound]`; full-coverage subset re-run
  `logs/axcheck-cycle2.log`: AxPilot20_M1 **OK, 36 axiom-lines, 0 sorryAx**.
- **Logs:** `logs/m1-cycle2-green.log` (elaboration run, Modal app `crossmath-probe`,
  mathlib `ff2494ea5e43`, v4.36.0-rc2, 8,710 oleans) and `logs/axcheck-cycle2.log`.
- **Runner note:** `run_m1.sh` minimally updated (MODAL_USER defaults to `doz`;
  `sudo -n -u xyz` is blocked in this environment — same image/rev in the app).
  `M1.lean` itself untouched.

VERIFICATION-LEDGER's pilot-20 [runs-unrecorded] gap can now be closed as
**[verified Cycle 2]** — M1 GREEN with recorded evidence. Closure edit proposed to
the orchestrator (per STATUS.md governance, lanes do not edit the ledger/INDEX).
