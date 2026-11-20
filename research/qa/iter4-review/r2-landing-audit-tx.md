# R2 LANDING AUDIT — batches T→EE (the pre-close byte-integrity gate; lane R2, 2026-11-20)

Independently verifies every lane-reported sha256(16) from this session against the
landed bytes on main. **Audit basis moved during the audit** (main is live: the
tasking named `c31c89a`/T–X; batches CC `8fc848d`, DD `e9e1434`, EE `868e37d`
landed mid-audit — every sweep re-run at the then-HEAD; the table below is the
FINAL sweep @ `868e37d`). Method: `sha256sum` on the working tree at HEAD vs the
relayed sha; landing commits from `git log`; supersedes authority from the batch
commit messages (dated, in-commit). No file was edited; no gate executed.

## PASS — sha match (26 rows)

| relayed sha | file | landed at |
|---|---|---|
| `14ee0643` (v2) | `qa/iter5-closeout-gates-dryrun.md` | batch W `37cb520` |
| `f4307714` | `qa/iter5-g7-stamps-prep.md` | W |
| `df2e93c2` | `qa/iter5-closeout-gates.md` (guard-cell refresh) | W |
| `12c05683` | `feasibility/probe/make_axcheck.py` (batch-W state: 55 rows) | W |
| `1294a667` | `pilots/74/item13-prestage.md` | T `a33c319` |
| `bad61a2c` | `qa/iter4-review/r7-41h-postsplice-audit.md` | U `385210a` |
| `ef1eee51` | `pilots/liu-bnew/P0-record.md` (the addendum) | U |
| `a69ee201` (v2) | `novelty/iter6-seed-census.md` | AA `178e2d5` |
| `ddec4089` | `qa/iter4-review/r9-quota-disposition-draft.md` | X `c31c89a` |
| `587f1ab5` (v3) | `qa/iter4-review/r9-iter6-charter-draft.md` | AA |
| `14e43b28` | `feasibility/probe/logs/stepA-incremental-iter5.log` (ENTRY 13 + correction) | Y-partial `0eb0932` |
| `927f3235` | `feasibility/probe/FINAL-SWEEP-PLAN-ITER5.md` | Y-partial |
| `db872dc5` | `pilots/72-M1/logs/l3bd-stop-note.md` (print-level re-base) | CC `8fc848d` |
| `b846290e` | `pilots/72-M1/L3-record.md` (re-base) | CC |
| `09c3bcab` | `qa/REPORT-INPUTS-ITER5.md` (72-M1 row correction) | CC |
| `60278bd4` | `pilots/41/H3-precharter.md` (FINAL) | Z `e1c4017` |
| `833dcff8` | `pilots/41/H3.lean` (on-disk = fired) | BB `bc53672` |
| `6dc794e7` | `pilots/41/logs/h3-s-run1.log` | BB |
| `8b1bd589` | `pilots/41/H3-record.md` | BB |
| `3d924056` | `pilots/12/P0.lean` | DD `e9e1434` |
| `3f88feb8` | `pilots/12/P0-record.md` | DD |
| `46abd882` | `pilots/12/logs/p0-runs1-2.log` | DD |
| `a3976f96` | `pilots/12/run_p0.py` | DD |
| `a8658c4b` | `pilots/12/stage_and_fire_p0.sh` | DD |
| `14f80c83` | `qa/iter4-review/rehearsal/iter5-close-rehearsal.md` (R2's) | EE `868e37d` |
| `5f0b57cc` | `novelty/round7-h3-battery.md` — see supersedes row; tree carries this newest state | EE |

## SUPERSEDED-BY (authorized, dated in the landing commit — NOT misses)

| older sha | disposition |
|---|---|
| `4e5b4854` (dry-run v1, batch T) | superseded by v2 `14ee0643` at W (recorded in W's commit message) — v2 on tree ✓ |
| `e202244b` (census v1, batch V) | superseded by v2 `a69ee201` at AA with a dated CORRECTION block (seed-#5's "1–2 fix rounds" retracted → re-derivation class) ✓ |
| `87659f58` (battery, batch V — the tasking's sha) | superseded by `5f0b57cc` at EE (§M-PRE extension, pure append after :263, dated) ✓ — the tree correctly carries the NEWER state; PASS-as-superseded |
| `f3a8e43d` (charter v2) + in-flight `6cdf85d0` | NEVER LANDED by design (single-landing rule, batch AA record); v3 `587f1ab5` is the landed state ✓ |
| `726e3d69` → `b9e911cd` → `7b76e8ce` (precharter in-flight chain) | never landed by design; FINAL `60278bd4` landed (Z) ✓ |

## NOT-YET-LANDED (flagged, owned — the close's two open pulls)

1. **R1's r3-verification-tables corrected block** — relayed `a4938caa`, then
   superseded in-worktree by R1's live edits (`3047e7da` lineage); main carries
   `eac24fee` = the PRE-correction state (no "TRIAD NEVER" rows). HELD at
   Y-partial by H's hash gate (recorded in `0eb0932`). The correction SUBSTANCE is
   on main three other ways (ENTRY 13 CORRECTION in the ledger; the FINAL-SWEEP
   row `927f3235`; H's h-wave4-log `:1109` line), so this is a funnel-lag, not an
   integrity gap — **but close-block items 2/3 ([TALLIES]/[WHOLE-TREE-CENSUS]) draw
   from R1's §11 tables: the corrected block must land (fresh relay) before the
   close fill.** Owner R1.
2. **R1's make_axcheck merge** — relayed `93252ec0`, superseded in-worktree
   (`3047e7da`/`6eedbfdc`); main = batch-W `12c05683`. The merge is a pre-analyzed
   compatible superset (+`AxPilot41_H1` row, +3 comment folds, the :83 corrections:
   stale guard `dcda3133` → `aed63101` + the retracted L3 triad claims). **G2's
   batch wants the merged file; the :83 re-bind is also a rehearsal GO condition.**
   Owner R1 (fresh relay; union asserts pre-passed per the Y-partial record).

## FAIL list — EMPTY

No unauthorized drift found: every byte delta between a relayed sha and the tree
traces to a dated, in-commit-message supersedes record. No supersedes-miss (no
case of an older version on tree where a newer was relayed WITHOUT a landing
record for the newer — the two not-yet-landed items above are HELD-with-gate-record
states, not misses).

## Completeness notes (outside the relayed list, recorded for the audit trail)

- Batch U's 41H micro-edit: article file now `cb4d4fae` (R7's four wording-class
  fixes, in-commit authorized); the rehearsal G5 cell already cites it.
- Batch DD carried an orchestrator-direct dossier correction
  (`candidates/…parametric-savings-function-in-matrix-exponent.md`, the eps(w_b)
  monotonicity defeat) — content-matched + gate-verified per the DD record; not
  sha-relayed, noted only.
- Running files (INDEX.md, ORCHESTRATION-ITER5.md, h-wave4-log.md) updated in
  every batch — no sha pinning by design.

— audit by lane R2, 2026-11-20, main read @ `868e37d` (live HEAD re-swept at
c31c89a → 8fc848d → e9e1434 → 868e37d during the audit), worktree agent-03.
Read-only: no edits, no gate execution, no fires. H pulls at convenience; no
commit (lanes never commit).
