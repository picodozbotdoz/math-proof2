# Close-out commit & branch plan — Cycle 2 (H, staged 2026-11-14)

Ordered commit sequence for cycle close. Each step: trigger → expected files → commit
message class (H runs every commit; "trigger" = the lane/report that unblocks it).
**Branch rule: every commit on `dev/claude`; never push.** The dev/iteration4 cut is
STEP 9 — executed ONLY on the orchestrator's explicit trigger (H verifies with the
orchestrator immediately before the cut).

## Preconditions (all must be true before STEP 2)

- Lane drains relayed: A2 (P2 GREEN + axcheck + report), A3 (M4b-upgrade verdict incl.
  the m4b2-run1 rc=1/errors=0 anomaly interpretation), A4 (formal report: run1–7
  headers — now on disk uncommitted — + u≠1 dossier edit), A6 (L2 verdict), A7 (G7b +
  G5a/G6a verdicts + run17/18 disposition), A8 (11-M2 final + RedTm2 wobble
  reconciliation), A5 (seed triage + any VERDICTS/round-4 residue), A9 (slot ledger +
  final fills).
- Known debts closed at their step: A8 `pilots/11/logs/m2-run{1,2,3}.log` headers
  (NEW audit finding — relay to A8); A7 `logs-g/run{17,18}-*.log` outage-killed
  disposition (headerless, verdict-less — annotate superseded-by run20/21 or declare
  dead); DLRT residuals — A9's two (candidates/42:355, articles/42:28/:149, relayed)
  land in STEP 5; TRIAGE:137–138 is the orchestrator's at STEP 3.
- `AGENT_INSTRUCTION_1.md` stays untracked throughout; `AGENTS-C2-DRAFT.md` is applied
  (STEP 6), never deleted.

## STEP 1 — final lane provenance commits (H, rolling; already in cadence)

Per drain relay, one commit per lane as before ("Cycle 2: <lane> — …"). Includes A4's
header-prepended `pilots/72/logs/run1–7` + C-neg final + u≠1 edit; A8's 11-M2 terminal
logs (with headers prepended per the audit finding); A2's p2-run* + P2 axcheck; A3's
upgrade product + logs; A6's L2 logs; A7's run19/20/21 finals.

## STEP 2 — final sweep + ledger finalization (trigger: A1 standby signal — all §9
TARGETS final-or-declared-drop)

Files: `feasibility/probe/logs/stepA-incremental-c2.log` (completed),
`run_axcheck.sh` batch outputs → `pilots/*/logs/axcheck-c2-final.log` copies,
`feasibility/VERIFICATION-LEDGER.md` (§9 FINAL: every row signed off, sorry-token
tallies, conditional-TARGETS rows resolved), `feasibility/probe/FINAL-SWEEP-PLAN-C2.md`
(closed note). Commit: `Cycle 2: A1 — final sweep Steps A–C + ledger §9 FINAL`.
H QA: sweep tally vs §9 rows (0 sorryAx expected on all staged finals).

## STEP 3 — TRIAGE §decision typeset (trigger: orchestrator, after STEP 2)

Files: `research/TRIAGE.md` (§ Cycle-2 addendum: typeset from
`TRIAGE-C2-ROWS.md` + `qa/triage-decision-staging.md`; INCLUDES the DLRT qualifier fix
at TRIAGE:137–138). Commit: `Cycle 2: TRIAGE §Cycle-2 §decision typeset (orchestrator;
H commit)`. Mirror slot: REPORT §C2.6 fills at STEP 4.

## STEP 4 — REPORT §C2 final fills (trigger: STEPS 2–3 done; H owns)

Files: `research/REPORT.md` — replace [PILOT-VERDICT:71-P2/73-C/42-M4b/10-L2/11-M2/
72-C-neg], [G7b], [SWEEP], [TRIAGE-DECISION] with verdict text (integrity count: 71-P2
×2, 72-C-neg ×2, 73-C ×2, 10-L2/11-M2/42-M4b ×1, G7b ×4, SWEEP ×2, TRIAGE-DECISION ×2);
re-pull §4-class counts from A9's slot ledger; flip the C2 header banner to FINAL.
Commit: `Cycle 2: H — REPORT §C2 final fills`.

## STEP 5 — articles + dossier slot fills (trigger: A9, consumes STEPS 2–4 outcomes)

Files: `research/articles/*` (six drafts DRAFT→FINAL + verdict slots; main-run appends
finalized: 11 T3 verdict, 22 note already closed), `articles/README.md` (statuses),
`research/candidates/{70,71,72,73,74,75,…}` (§Pilot-outcome addenda final fills;
candidates/42 DLRT qualifier fix if not already in STEP 1's A9 commit). Commit:
`Cycle 2: A9 — article/dossier final fills`.

## STEP 6 — AGENTS-C2 apply (trigger: orchestrator apply signal; H executes)

Per `qa/agents-c2-apply-plan.md`: E1–E7 + wrap-up (draft header marked APPLIED; INDEX
row flip). Commit: `Cycle 2 close: apply AGENTS-C2 addendum (AGENTS.md) per
qa/agents-c2-apply-plan.md`.

## STEP 7 — STATUS cycle-close block (trigger: STEPS 2–6 done; H owns)

Fill the TEMPLATE at STATUS tail (banner deleted): pilot-outcomes table, sweep sign-off
line, TRIAGE pointer, articles pointer, AGENTS-C2 apply pointer, iteration-4 handoff
slot. Commit: `Cycle 2: H — STATUS cycle-close block (Cycle 2 CLOSED)`.

## STEP 8 — stop-point check (H reports to orchestrator)

Concrete pre-branch-cut checklist — every item checkable by a single command; ALL must
pass (or be explicitly deferred-with-owner per the debts register) before H asks the
orchestrator to trigger STEP 9:

1. **Orchestrator all-final signal given** (the explicit message; no command).
2. **Sweep Steps B–C logged**:
   `ls research/pilots/*/logs/axcheck-c2-final.log` (per-pilot copies exist) AND
   `grep -l "Step B\|Step C\|stepB\|stepC" research/feasibility/probe/logs/*.log` non-empty.
3. **Ledger §9 FINAL**: `! grep -qE "\[pending" research/feasibility/VERIFICATION-LEDGER.md`
   (no pending cells left) AND §9 contains a FINAL sign-off line.
4. **Slot ledger zero OPEN/PENDING**:
   `! grep -qE "\bOPEN\b|PENDING-RELAY" research/REPORT-INPUTS-C2.md` OR every remaining
   row explicitly marked deferred-with-owner (grep the deferrals and cross-list them in
   `qa/debts-register.md`).
5. **TRIAGE §decision typeset**: `grep -q "Cycle 2" research/TRIAGE.md` AND a §decision
   block exists (visual/one-grep: `grep -c "decision" research/TRIAGE.md` rises vs
   pre-close count; DLRT qualifier at :137–138 verified present).
6. **REPORT §C2 placeholders zero**:
   `! grep -qE "\[PILOT-VERDICT|\[G7b\]|\[SWEEP\]|\[TRIAGE-DECISION\]|\[VERDICT:" research/REPORT.md`.
7. **Articles Status lines FINAL**: `grep -l "Status:.*DRAFT" research/articles/*.md`
   returns EMPTY (main-run articles say FINAL/CLOSED; Cycle-2 drafts flip at STEP 5).
8. **AGENTS-C2 applied per plan**: `head -3 research/AGENTS-C2-DRAFT.md | grep -q APPLIED`
   AND the AGENTS.md changes match the 7-edit plan (spot-read E2 merged bullet + :54
   decimal fix).
9. **Debts register linked**: `grep -q "debts-register" research/STATUS.md` (close block
   carries the CLOSE-class items; ITER-4/RECORDED classes referenced).
10. **Tree clean**: `git status --short` shows ONLY `?? AGENT_INSTRUCTION_1.md`.
11. **Close sequence verified**: `git log --oneline -12` shows STEPS 2–7 commits in
    order; close commit hash recorded for the STEP-9 cut line.

Any residue → append fixes and re-run the checklist before requesting the STEP-9 trigger.

## STEP 9 — dev/iteration4 branch cut (trigger: ORCHESTRATOR ONLY — H verifies and
confirms immediately before executing)

Commands (run at the STEP-8 close commit on dev/claude):

    git checkout dev/claude && git status --short        # verify clean
    git checkout -b dev/iteration4                       # cut at close commit
    git checkout dev/claude                              # return (work continues per orchestrator)

Then the iteration-4 initial commit (on dev/iteration4 unless the orchestrator
directs otherwise): `RESEARCH.md` § Iteration 4 addendum typeset by the orchestrator
from `feasibility/ITERATION4-CHARTER-DRAFT.md` (+ SEED-DOSSIERS / seed-triage refs;
STATUS Iteration-4 board block seeded by H). Commit:
`Iteration 4: charter addendum + branch open (from Cycle-2 close <hash>)`.
Never push (repo rule). dev/claude retains the full Cycle-2 history as the trunk.

## Appendix — log-header audit results (2026-11-14, 137 files; basis for the debts above)

Clean (headers present): all Cycle-2-era logs incl. A2 p2-run1–6 + run1–4, A3 m4-* /
m4b-*, A6 l1/m1-*, A1 machinery/stepA/p11t3fix, A4 72 run1–8 + axcheck (run1–7 headers
prepended on disk, commit owed in STEP 1). GAPS (Cycle-2, owed): A8 m2-run{1,2,3}
(no headers); A7 run17-g5a / run18-g6a (outage-killed, headerless verdict-less —
disposition owed). Frozen-history informational class (main-run mid-iteration descent
logs, NO action — predate the Cycle-2 header discipline; their green/final successors
all carry headers): pilots/42 m2a_m3_run3–10 + m2b_run1–6, pilots/50 combined-run13/14,
pilots/52 m1-run{3,5..14} + dirichlet-m2a-final-ok (28 files).
