# RESUME BRIEF — Iteration 4 (written at launch, 2026-11-16)

Unlike the Cycle-2 brief (`RESUME-BRIEF-C2.md`, written only at wrap after an outage
killed all lanes), this one is written at launch and kept current by H at every commit
batch. Read AFTER `AGENTS.md` + `research/RESEARCH.md` (§ Cycle 2; the § Iteration 4
charter splice is appended at phase-B start) + this brief +
`research/ORCHESTRATION-ITER4.md`.

## (a) Session context

- Iteration-4 run (the user's "Iteration 3" launch) opened 2026-11-16 on branch
  `dev/iteration4`, cut at `b1ea051` (the Cycle-2 close commit; == `master` at open;
  ff-only merge confirmed identical; never pushed).
- **Phase A (current)** — Cycle-2 review: the user reported unsatisfactory external
  feedback on the iteration-2 articles; 9 review lanes (R1–R9) audit and consolidate
  before any new pilot work.
- **Phase B (after review)** — pilot execution; starts when the orchestrator typesets
  the charter splice into `research/RESEARCH.md` (kit:
  `feasibility/ITERATION4-CHARTER-SPLICE.md`; carried inventory:
  `feasibility/ITERATION4-SCAN.md`, `feasibility/ITERATION4-SEED-DOSSIERS.md`,
  `novelty/iter4-seed-triage.md`).
- Commit history: batch 1 `f8f37e6` (orchestration tracker + review workspace); this
  brief = batch 2.

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
| R1 | articles editorial audit | `research/qa/iter4-review/` (lane-named file TBD) | active (writing) |
| R2 | discovery-strength audit | `research/qa/iter4-review/r2-discovery-strength.md` (v1 landed batch 6; S1–S4 bar proposed) | delivered v1 |
| R3 | verification integrity audit | `research/qa/iter4-review/` (lane-named file TBD) | active (writing) |
| R4 | process/completeness audit | `research/qa/iter4-review/` (lane-named file TBD) | active (writing) |
| R5 | iteration-4 backlog consolidation | `research/qa/iter4-review/` (lane-named file TBD) | active (writing) |
| R6 | fresh corpus bridge re-scan | `research/novelty/iter4-fresh-bridges.md` | active (writing) |
| R7 | external prior-art web check | `research/qa/iter4-review/` (lane-named file TBD) | active (writing) |
| R8 | donor/feasibility engineering | `research/feasibility/iter4-donor-unblock-plan.md` | active (writing) |
| R9 | synthesis/charter draft | `research/qa/iter4-review/r9-iteration-plan-draft.md` (v1 landed batch 5; re-issues §§1–3 as v2 on [MERGE: Rx] resolutions) | delivered v1 |

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
