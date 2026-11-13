# Carried-debts register — Cycle 2 close (H, 2026-11-14)

Feeds the STATUS close block's "carried debts" line-items. Classes: **CLOSE** =
discharge before/at cycle close; **ITER-4** = carried to the next cycle's charter/scan;
**RECORDED** = documented, no action possible or needed. Every item: owner + discharge
condition.

| # | Debt | Class | Owner | Discharge condition |
|---|---|---|---|---|
| a | `C-neg.lean` advisory warnings (2× `push_cast`/`push_neg`-class deprecations, unusedSectionVars `DecidableEq`, unused `hα` binders) — accepted; kernel standard met (0 errors, 0 sorry, triad-only) | RECORDED | A4 | none (advisory-only; note lives in run8/axcheck logs) |
| b | ~~`m4b-run1.log` internal count discrepancy~~ **CLOSED 2026-11-14 (A3 terminal batch, 4323178)**: 5 error SITES (L1413/1419/1423/1447/1454) vs counter 3 — the two `error(lean.unknownIdentifier)` lines fell outside the old `…error:` regex; hygiene addendum in the log + regex widened in `run_m4b2.py`. |
| c | ~~`m4b2-run1.log` anomaly (FAIL rc=1, errors=0)~~ **CLOSED 2026-11-14 (A3 terminal batch, 4323178)**: 4 mechanical noncomputable-abbrev errors outside the old counter regex (rc=1 correct); fixed before run2; m4b2-run2 GREEN with regex-verified error counting (incl. `error(<code>)` forms) + full-coverage axcheck 98 prints / 72 names, triad-only. |
| d | ~~`pilots/11/logs/m2-run{1,2,3}.log` headers owed + RedTm2 err churn (4→2→3) explanation + final-vs-scratch state of the 392-LoC file (vs 386 skeleton)~~ **CLOSED 2026-11-14 (A8 terminal batch, 08df45f):** m2-run1/2/3 carry "run-time persisted, NOT reconstructed" provenance marks; blueprint §8 corrected table = the churn record, 4→2→3→6→3→2→2→0 site-basis (run5's machine counter reads 4 — the sole divergence, both numbers preserved in the log); RedTm2 final = 421 LoC; A8 formal report received (blueprint §8 = the formal record; REPORT §C2.3 + STATUS rows filled by H, debt closed). | — | — | discharged |
| e | ~~`logs-g/run{17,18}-*.log` outage-killed, headerless verdict-less~~ **CLOSED 2026-11-14 (H sweep, 749e8b3):** SUPERSEDED-by disposition headers prepended (run17→run20, run18→run21); run19/21 verdicts landed (G7b-attempt-1 FAIL unpatched-donor; G6a priced-and-blocked 7,493 errs); run20 marked killed-externally-NOT-cache (superseded by run23). | — | — | discharged |
| f | HKT theorem-number PARTIAL-PIN residue (book pinned Zbl 1200.11042; chapter/theorem unpinnable from open web; Part-3-level citation rule stands) | ITER-4 | iter-4 novelty lane | physical-copy check or author-query; until then cite Part-3/four-pinned-papers only |
| g | vdG–vdV exact theorem number open (round-4 §6.3) | ITER-4 | iter-4 novelty lane | pin at theorem granularity when a pilot consumes the falsity-trap citation |
| h | QuasiRiemannTracker Pages-deployment-lag caveat: deployed catalogue normalizes all 55 records to `framework-verified` (`as_of` 2026-11-13) while in-tree metadata carries status on only 11/56 — admission status computed from admission records; a fresh push may lag the repo state | ITER-4 | iter-4 novelty lane | cite catalogue `as_of` + commit date together (protocol §9.5); no fix needed beyond the convention |
| i | STATUS pilot-slot numbering normalization (row 72 "slot 2" → slot 3; decision-block three-slot enumeration) — wording staged at `qa/agents-c2-apply-plan.md` tail | CLOSE | orchestrator (H stages) | applied at TRIAGE §decision typeset |
| j | ~~M4a-note.md is still the M4c addendum DRAFT; M4-note update owed~~ **CLOSED 2026-11-14 (A3 terminal batch, 4323178)**: `M4-note.md` landed (M4c addendum); `M4a-note.md` carries the supersession pointer. |
| k | Main-run mid-iteration logs without headers (28 files: 42 m2a_m3_run3–10 + m2b_run1–6, 50 combined-run13/14, 52 m1-run{3,5..14} + dirichlet-m2a-final-ok) — predate the Cycle-2 header discipline; green/final successors all headered | RECORDED | — (frozen history) | none (classification in `qa/closeout-commit-plan.md` Appendix) |
| l | Λ-gap taken externally: `DrMurphyIsIn/qrh-debruijn-newman` kernel-checks Λ ≤ 9/32 — main-run round-1 §12's "Λ absent everywhere" is false as of 2026-11-13; note recorded in RELATED-WORK only (main-run files frozen) | ITER-4 | iter-4 novelty lane | iter-4 charter/scan must not resurrect Λ-absence claims (A1's ITERATION4-SCAN to carry the line) |
| m | hexagonmath.org ORCID-gated archive ⇒ PASS-conditional absence evidence only | RECORDED | — | convention already recorded (round-4 P2-1/P2-12; STATUS); cite on every affected claim |

Pending-verdict items are NOT debts (they are close-out preconditions, tracked in the
closeout-commit-plan preconditions block and A9's slot ledger): 71-P2 axcheck+report,
42-M4b-upgrade, 10-L2, 11-M2 final, 72-M1 (slot 3), 75 (executing), G7b/G5a/G6a, seed-1
rg-gate + seeds-6/11 differentiation, TRIAGE-C2-ROWS reconciliation, A1 relabel batch.
