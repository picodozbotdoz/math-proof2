# ORCHESTRATION-ITER4 — Iteration 4 lane tracker

Iteration 4 run (= user's "Iteration 3" launch), opened 2026-11-16. **PHASE B ACTIVE as
OF the L2 splice commit** (charter typeset into RESEARCH.md §Iteration 4; STATUS opened
block spliced; review phase CLOSED at L1). Maintained by H on orchestrator signal.

**PHASE-B WAVE 2 opened 2026-11-17** (post-restart; session-end snapshot `53c1548`):
lane map re-cut to H + A1–A9 per the orchestrator's wave-2 assignments; the R1–R9 review
lanes stay CLOSED at L1 (2026-11-16 — their phase-B follow-ups are inherited by the
A-lanes as noted per row). In-flight state at wave-2 open: RESUME-BRIEF-ITER4 §Session-end.

**FILE-FUNNEL RULING (orchestrator, 2026-11-17):** `qa/iter4-review/r3-verification-tables.md`
edits funnel through A1 ONLY (single writer; renumber/merge centralized — A3's stale-baseline
copy was never committed); `qa/REPORT-INPUTS-ITER4.md` is H-SHEPHERDED (lanes report; H applies
surgical §-level hand-edits on lane reports, noted in the commit).

**PHASE-B WAVE 3 opened 2026-11-18** (post-restart after the second network-failure
termination; session-end snapshot #2 `2f90dcc`; lane worktrees all detached @ `53c1548` —
pull from them, never restart). Lane map re-cut by the orchestrator: the five in-flight
units RESUMED from their worktrees (A3/agent-04, A4/agent-05, A5/agent-06, A7/agent-08,
A8/agent-09); new duties for A1/A2/A6/A9. Close act armed on orchestrator signal after
the five units land (A2's runbook + A9's splice checklist 7 mandatory items + final gates
G1–G8 per `qa/iter4-closeout-gates.md`; H prepares and dry-runs, orchestrator fires).

| Lane | Worktree | Role | Current task | Status | Last update |
|---|---|---|---|---|---|
| H | (main) | helper/infra (branch, commits, tracker) | wave-3 open stamp; substrate notary re-verify; standing commit duty | active | 2026-11-18 |
| A1 | agent-02 | verification integrity | pre-close folds (§10 rows for the five in-flight units as they land) | re-tasked | 2026-11-18 |
| A2 | agent-03 | bench/close-out | close-act runbook LANDED (`a2-close-act-runbook.md`, 20 steps/5 phases, apply-gated) + close-summary draft refreshed; G7 census corrected 34→46 (40 close / 6 retarget / 0 needs-ruling; A1 relayed for gates file); close-support standby | close-support standby | 2026-11-18 |
| A3 | agent-04 | FF-EZ2 + articles 71/22 | FF-EZ2-P2 descope-closure (guarded squarefree-iff + optional proportion, ≤3 runs) | in-flight (resumed) | 2026-11-18 |
| A4 | agent-05 | AL-3D P2 | AL-P2-c completion (path a: Fin.cast+Subtype plumbing) → P2-d → P2-e (fresh ≤4) | in-flight (resumed) | 2026-11-18 |
| A5 | agent-06 | 75-N2 consumer | N2-P1 packaging closure (v8 on disk, one closure run) → M2 → M3 | in-flight (resumed) | 2026-11-18 |
| A6 | agent-07 | iteration-5 prep | iteration-5 charter candidate prep | re-tasked | 2026-11-18 |
| A7 | agent-08 | 78 + 77 + prior-art | dossier-77 fold + T1-completion (≤4) + T2 (≤4) as ONE unit | in-flight (resumed) | 2026-11-18 |
| A8 | agent-09 | 74 + validation | 74-P1 completion (verify-fire discipline: pre-run sha guard, NO local lean, ≤5) | in-flight (resumed) | 2026-11-18 |
| A9 | agent-10 | articles editorial | close-support (splice checklist, README PENDING-CLOSEs) | re-tasked | 2026-11-18 |
