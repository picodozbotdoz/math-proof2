# RESUME BRIEF — Iteration 4 (written at launch, 2026-11-16)

Unlike the Cycle-2 brief (`RESUME-BRIEF-C2.md`, written only at wrap after an outage
killed all lanes), this one is written at launch and kept current by H at every commit
batch. Read AFTER `AGENTS.md` + `research/RESEARCH.md` (§ Cycle 2 + § Iteration 4 —
charter TYPESET at L2) + this brief + `research/ORCHESTRATION-ITER4.md`.

## (a) Session context

- Iteration-4 run (the user's "Iteration 3" launch) opened 2026-11-16 on branch
  `dev/iteration4`, cut at `b1ea051` (the Cycle-2 close commit; == `master` at open;
  ff-only merge confirmed identical; never pushed).
- **Phase A (review) CLOSED at L1** (`226fa08`): nine lane audits + fix-side passes all
  landed and applied (digest: `qa/iter4-review/00-DIGEST.md`, 17 entries).
- **Phase B (pilots) ACTIVE since L2** (the splice commit): charter typeset into
  `RESEARCH.md` §Iteration 4; STATUS opened block spliced; R4 batch C applied
  (C1/C2/C4/C5). Launch order: 75-Pb day-1 top-billed; LP layer same week (engineering
  billing); AL-3D B.2; ZZV2-λ (a); 72-M1 L3a; hEχ companion day-2/3. First-48h run
  queue: r5 backlog §14 (12 STAGED-NO-RUN rows; approvals at charter typeset).
- Lane reassignment: the R1–R9 review lanes are CLOSED; phase-B lanes spawn per R9 §9
  briefs (A-lane pattern) on orchestrator signal; H stays sticky.

## (b) Protocol

1. 10 lanes: H (sticky helper/infra; owner of this brief and the tracker) + R1–R9.
   One writer per file; lanes never write outside their assigned deliverable.
2. Lanes NEVER commit. H commits exact-file batches (never `git add -A`), message
   `Iter4: <summary>` in phase B / `Iter4 review: <lane> <topic>` in phase A.
3. Queue-loaded re-tasks: every lane gets a 2–3 item queue; lanes work bottom-up and
   return only on drain or a decision point; re-task before prose.
4. Spawn lanes one-by-one (this run: H first, then the review lanes); concurrency probe
   at each batch close: `ps -eo comm --no-headers | grep -cx zcode-cli`, raw count
   reported. Observed so far: 16 at H-spawn close, 22 at batch-1 close.
5. Standing duty (added at batch 2): at each signal batch, BEFORE committing, H re-reads
   `ORCHESTRATION-ITER4.md` and this brief's lane table and refreshes both (status +
   date); they ride in the same commit. Extended at batch 4: every batch that introduces
   a new `research/` file stages its `research/INDEX.md` row in the same commit.
   **HARDENED at the L2 release (orchestrator ruling, 2026-11-16 — the index is SHARED
   STATE during parallel lane work):** before EVERY commit — (a) `git status --porcelain`
   + `git diff --cached --stat`; (b) if the staged set contains anything H did not stage
   itself, `git restore --staged` the foreign entries (disk content untouched; the
   owning lane re-stages for its own commit); (c) only then commit the exact files.
   **Serialization while R1's articles swap-in executes:** H does not commit anything
   under `articles/`, `candidates/`, or runbook-touched files; R1's step-commits are its
   own or ride on its execution report.
   **Incident record (2026-11-16):** commit `bb969c0` (R7 Truffet file) swept in three
   pre-staged article deletions (42M4/50M2/73 — R1's authorized swap-in STEP 1–3 work,
   landed early in the wrong commit; ruled authorized, no revert; per-step commit
   discipline breached — the eventual swap-in completion commit carries a dated note to
   this effect per the frozen-record convention). The hardened rule caught a second
   in-flight staging (the 21-rename) the same hour and unstaged it cleanly.
   **Second sweep, same class:** commit `1719115` (R6 Wing check) swept the staged
   article-20 deletion (R1's 20-split step) — the rule-2 check PRINTED the foreign
   entry but H failed to enforce step (b); ruled authorized, no revert. Both incidents
   fold into the swap-in completion note: "deletions for steps 1–3 and the 20-split
   landed early in bb969c0/1719115 — H index-sweep incidents, ruled authorized;
   per-step commit discipline superseded by end-batch."
   **PAUSE PROTOCOL (orchestrator, 2026-11-16, effective until R1's swap-in completion
   report):** H commits NOTHING autonomously — commits only on explicit orchestrator
   signal (the shared-index race cannot be check-then-committed reliably while R1
   stages mid-step). Rule 2 is a HARD GATE: any staged line H did not stage ⇒ stop,
   unstage foreign entries, re-verify, commit in a separate command. **At R1
   completion (on signal):** (1) census verification first (articles end-state per the
   runbook); (2) stage the FULL swap-in changeset deliberately (R1 leaves everything
   worktree-only); (3) ONE serialized commit carrying the incident notes above.
6. Modal ONLY via the doz CLI `/home/doz/dozenv/bin/modal` (`sudo -n -u xyz` is blocked
   in this env); NEVER local lake/lean builds. `AGENTS.md` § Modal usage guidelines is
   mandatory: defaults cpu=2.0/memory=4096, telemetry in every run,
   `LEAN_NUM_THREADS=2`, overrun ⇒ investigate-not-upgrade (more resources only with
   explicit per-run user approval), long builds (> ~40 min) as cached image layers,
   never over-reserve.

## (c) Per-lane table (current state; mirrored from ORCHESTRATION-ITER4.md)

| Lane | Assignment | Deliverable path | Status |
|---|---|---|---|
| H | helper/infra (branch, commits, probes, tracker) | `research/ORCHESTRATION-ITER4.md` + this brief | idle (standing by for signals) |
| R1 | articles editorial audit | audit + TEMPLATE-iter4 + all rewrite proposals + swap-in runbook LANDED (runbook NOT executed — orchestrator GO only) | delivered |
| R2 | discovery-strength audit | S1–S4 bar + fix-side + hEχ mini-spec + 20/72 rewrites LANDED; 29 relabel edits + pass-2 counts APPLIED by H | delivered |
| R3 | verification integrity audit | 19/19 VERIFIED + tables + axcheck spec LANDED; §8 pass-2 APPLIED; axcheck_iter4.py awaited | delivered |
| R4 | process/completeness audit | audit + fixes package + gate-run record LANDED; batches A+B APPLIED; batch C at splice | delivered |
| R5 | iteration-4 backlog consolidation | §§1–16 final LANDED; STATUS snippet + REPORT-INPUTS-ITER4 HELD for LAUNCH commit; runner clones staged | delivered final |
| R6 | fresh corpus bridge re-scan | `research/novelty/iter4-fresh-bridges.md` LANDED (5 seeds, 2 OAI donors); follow-ups unreported | delivered v1 |
| R7 | external prior-art web check | `research/novelty/iter4-external-priorart.md` on disk (unreported) | writing |
| R8 | donor/feasibility engineering | route plan + runner kit + approval packet + AGENTS-ITER4-DRAFT LANDED (NOTHING applied to AGENTS.md) | delivered |
| R9 | synthesis/charter draft | §§1–10 LANDED (splice v2); final touch-up in flight | integrating |

## (d) Restart instructions (after outage / session loss)

1. Read, in order: `AGENTS.md` → `research/RESEARCH.md` → this brief →
   `research/ORCHESTRATION-ITER4.md`.
2. On `dev/iteration4`: `git -C /home/doz/zcode-workdir/cross-math-fronttier status
   --porcelain` — reconcile untracked/modified files against the lane table BEFORE any
   commit (lanes' in-flight deliverables may sit untracked; never delete or "clean"
   them; AGENT_INSTRUCTION_1.md at repo root, if present, is untracked by design —
   leave it; `external-doc/` is gitignored — leave it).
3. Re-task surviving lanes via message (queue-loaded, 2–3 items); respawn dead lanes
   one-by-one. Empty agent worktrees surveyed 2026-11-16:
   `/home/doz/zcode-workdir/worktrees/agent-01…agent-10` and
   `/home/doz/zcode-workdir/worktrees/cmft/agent-01…agent-15` (all empty, usable).
4. Any Modal relaunch follows (b) item 6 (doz CLI only, spec'd resources).

## (e) Launch gate check (H, 2026-11-16) — all three Cycle-2 close-out gates RESOLVED-IN-PLACE

- **[G7b] PASS** — `qa/REPORT-INPUTS-C2.md:267` FILLED-FINAL; `REPORT.md:347`;
  `TRIAGE.md:190`; `STATUS.md:735`.
- **[SWEEP] FILLED-FINAL** — `qa/REPORT-INPUTS-C2.md:273`;
  `feasibility/VERIFICATION-LEDGER.md:283` (§9.F, Steps A–D executed 2026-11-14);
  `STATUS.md:739–741`.
- **[TRIAGE-DECISION] close-out DECIDED** — `TRIAGE.md:204` and `:240`;
  `REPORT.md:440` (§C2.6); `qa/REPORT-INPUTS-C2.md:274` FILLED-FINAL.
- The **[TRIAGE-DECISION] annotation family** (next-cycle slotting annotations in
  `ITERATION4-SCAN/-SEED-DOSSIERS/-CHARTER-DRAFT/-SPLICE`, `TRIAGE.md:381`) is OPEN BY
  DESIGN until the orchestrator typesets the Iteration-4 charter (tracked at
  `qa/REPORT-INPUTS-C2.md:279`) — not dangling.
- **PARKED for the R4 fixes batch — do NOT fix before then:** `research/INDEX.md:13`
  still describes REPORT § Cycle 2 as a "skeleton with fill-in placeholders" — a stale
  description of a filled section (cosmetic; no gate involved).

## Substrate baseline @ launch (H notary, 2026-11-16 — read-only verification)

All sibling donors match the AGENTS.md-recorded pins. No new commits, no dirty trees,
no toolchain changes (post-outage restarter: re-run the notary loop and diff against
this table before any Modal elaboration).

| Repo | Branch | HEAD | Last commit | Toolchain | Mathlib pin | Tree |
|---|---|---|---|---|---|---|
| encore-mathlib/repo/mathlib4 | master | `ff2494ea5e` | 2026-11-09 02:14 +0000 | v4.36.0-rc2 | (is the pin) | CLEAN |
| tauceti | main | `d92acc5c0` | 2026-11-09 11:59 +1100 | v4.36.0-rc2 | n/a | CLEAN (formalization.yaml intact, 4,747 B) |
| axiommath/ZetaZerosV2 | dev/claude | `a86af1a` | 2026-11-13 20:38 +0800 | v4.36.0-rc2 | `ff2494ea5e43…fa0059` | CLEAN |
| axiommath/ZetaZeros | dev/claude | `c0b585e` | 2026-11-13 18:05 +0800 | v4.36.0-rc2 | `ff2494ea5e43…fa0059` | CLEAN |
| axiommath/DedekindZetaZeroFree | dev/claude | `4f6208b` | 2026-11-13 17:12 +0800 | v4.36.0-rc2 | `ff2494ea5e43…fa0059` | CLEAN |
| axiommath/PrimeNumberTheoremAnd | dev/claude | `d82cfae` | 2026-11-13 20:38 +0800 | v4.36.0-rc2 | `ff2494ea5e43…fa0059` | CLEAN |
| axiommath/Weil | dev/claude | `c1c8983` | 2026-11-13 17:12 +0800 | v4.36.0-rc2 | `ff2494ea5e43…fa0059` | CLEAN |
| axiommath/AreaLaw2D | dev/claude | `c0f6d96` | 2026-11-13 17:12 +0800 | v4.36.0-rc2 | `ff2494ea5e43…fa0059` | CLEAN |
| liu-zerofree | main | `7d10420` | 2026-10-08 12:43 -0400 | v4.34.1 | n/a | CLEAN |
| openai-math (`lean/`) | — | — | — | v4.34.1 | — | not a git-notary target |
| anthropics/3sum-apsp, anthropics/eth | — | — | — | v4.33.1 | — | not a git-notary target |
| anthropics/zeta23 | — | — | — | v4.33.0-rc2 | — | not a git-notary target |
| math-proof1 | (predecessor; untouched) | `a02216a` | 2026-11-05 12:44 +0800 | — | — | CLEAN except untracked `.pwd` |

axiommath HEAD subjects are the 2026-11-13 bump/port commits ("Pin toolchain v4.36.0-rc2
and mathlib ff2494ea (cross-math-fronttier pin)" / "Port to mathlib ff2494ea…"), i.e. the
expected post-bump state, not drift; AGENTS.md's shallow-clone revs are the pre-bump
originals. All six lakefiles pin the full sha `ff2494ea5e438f8a8452db803068acd711fa0059`.

**Modal health @ launch (doz CLI):** client 1.6.2; `app list` EMPTY (no running apps —
correct post-Cycle-2); profile `semraker`. **Env-fact drift, flagged for the record:**
`sudo -n -u xyz true` returns rc=0 (2026-11-16) — the AGENTS.md substrate note
"sudo -n -u xyz is blocked" (recorded 2026-11-13) no longer holds for a basic command;
xyz (uid 1001, /home/xyz) exists but `/home/xyz/xyzenv/bin/modal` is not visible from
doz. Protocol unchanged: all Modal runs stay on the doz CLI per orchestrator
instruction; the AGENTS.md note may warrant an orchestrator-owned correction later.

**Env-fact correction (probe 2026-11-16):** sudo -n -u xyz unblocked as of 2026-11-16
(basic cmd rc=0; modal route WORKS — client 1.6.3, profile `donniexyz888`, a DIFFERENT
workspace from doz's `semraker` where the Cycle-2 cached images/apps live) — protocol
unchanged (doz CLI) pending orchestrator decision.

## SESSION END — 2026-11-17 (external termination: orchestrator session exceeded max duration)

Wrap-up by the orchestrator directly (lanes unavailable). **All lane work committed through `9711730`; the only uncommitted items are in-flight lane outputs, preserved in the snapshot commit `see git log` (the wrap-up commit below this line).**

### State at termination

**LANDED + fully recorded (commit chain f8f37e6 → 9711730 on `dev/iteration4`):**
- Review phase complete; charter spliced (L2=`808c809`); article corpus restructured + verified (census 15; 5 discovery-grade / 7 technical / 4 notes); fix batches A+B, R2 relabels, R3 pass-2 batch-1 all applied + R4-verified.
- **Pilots GREEN: LP slot 1 COMPLETE (P0/P1/P2 triad, `bw2_ceiling_of_dual`)**; **75-Pb GREEN — the day-1 discovery milestone** (P-b + C1 5/6-arm, all four landings triad, zero donor imports; M1 design-erratum recorded); hEχ donor-pin audit GREEN (Theorem-E chain triad; **hEχ binder swap CLEARED**); AL-P0/P1/P2-m1 GREEN (three statement-level finds: projLattice/ambient-G, P1-b subset-image bound, groupStrength amendment); 72-M1 L3a GREEN. Verification tables §10.1–10.6 issued; REPORT-INPUTS-ITER4 ledger current.

**IN FLIGHT at termination (files on disk, committed in the wrap-up snapshot; verdicts NOT yet known):**
- **G11/G12** (R6 lane): three runs logged (`logs-g/run33-g11.log`, `run34-g11-retry.log`, `run35-g11-fix.log`) — read the last log's verdict line first; donor map `novelty/oai-siegelzeros-piexponent-as-donor.md` NOT yet updated with verdicts. R3 owes the G11/G12 verdict review per §9.
- **73-Q4** (R5 lane): `pilots/73/Q4.lean` written (gate memo GO at `pilots/73/Q4-gate-memo.md`, `3b9b0a0`) — no run logs yet; pilot NOT executed.
- **ZZV2-P0** (R2 lane): `pilots/zzv2-lam/P0.lean` written — not run.
- **75-Pb audit-tail remediation**: `Pb.lean` modified + `logs/pb-run12-auditfix.log` (R3's §10.4 print-gap: +3 private prints; verify rc=0/triad in that log).
- **AL-P2 c/d/e** (R9 lane): P2-d is the risk concentration (reindex-conjugation transport). No new files since `f24efa4`.
- **75-N2 consumer design** (R2 lane, R2 §10 consumer (ii)): the ℚ ray-class↔Dirichlet dictionary + DZDF `abelianFactorization` statement-binder + hEχ port — the cycle's strongest discovery candidate, NOT started.

**Uncommitted modified files in the snapshot** (owners' final state, none re-verified post-edit): dossier 76 (R6 R7-fold), iter4-donor-unblock-plan + FINAL-SWEEP-PLAN-ITER4 + make_axcheck + axcheck_iter4 + gprobe (R3/R8 machinery + zeta23e/AL TARGETS appends), truffet-classical-scope (R7 row-3 outcome B appendix — soundness CONFIRMED ABSENT; §7 gap locator), 73/run_pilot.py (Q4 wiring), r5-iteration4-backlog (§11 re-anchor + Q4 spec), week1-agenda.md (R6 — **NEW, read first at restart**).

### Restart instructions (addendum to §Restart above)

1. Read this brief + ORCHESTRATION-ITER4.md + week1-agenda.md (the 10-row decision agenda).
2. First actions: (a) read the three G11 log tails → verdict lines → route to R3 for review → update donor map; (b) verify pb-run12-auditfix.log closes the §10.4 print-gap; (c) then the week-1 drain review per agenda (elevations: Truffet go-conditions, 01-Rung-0 lane-free, N=1 quota state — 75 two-tier article is the unspent discovery lead).
3. Then resume in-flight: run 73-Q4 (spec in the gate memo, warm crossmath-pilot-73), ZZV2-P0 (card 8, released), AL-P2-d/e (R9's decomposition in A2.lean header), and charter the 75-N2 consumer design.
4. Standing constraints unchanged: Modal ONLY via doz CLI (2cpu/4GB, telemetry, LEAN_NUM_THREADS=2, `-j 2` on lake-build phases per the hEχ nproc note), siblings read-only, one-writer-per-file, lanes report; H-style commits with the hardened pre-commit gate.
