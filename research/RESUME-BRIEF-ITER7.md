# RESUME BRIEF — Iteration 7 (PRE-DRAFT; opens at the iter-6 wrap commit)

**PREP ONLY (lane R6, 2026-11-21 @ main `7d7fcdd`).** Template = `RESUME-BRIEF-ITER6.md`
(the §structure convention: session context / protocol / per-lane table / restart
instructions / SESSION END). Every close-time value is stamped **[PENDING]** — H (or the
orchestrator's close act) fills them at the WRAP COMMIT, never re-derives: the fixed
facts below are byte-cited to their landings and stay; everything gated on the iter-6
close (gates G1–G8, KPI cells, quota stamps, the closing-batch outcomes) carries the
stamp. Companion inputs: the iter-6 close skeleton (`qa/iter4-review/r7-iter6-close-skeleton.md`
`0a93019b`), the close staging checklist (`qa/h-close-staging-checklist-iter6.md`
`f21f28cc`), the iter-7 seed census DRAFT (`novelty/iter7-seed-census-DRAFT.md` `422face2`),
R2's quota structural draft (`qa/iter4-review/r2-iter7-quota-structural-draft.md` `4955ac91`),
and the iteration-6 register (`qa/REPORT-INPUTS-ITER6.md` @ maintenance-1).

## (a) Session context

- Iteration 7 opens at the iter-6 close commit **[PENDING — the `§D` choreography
  execution; expected two-act shape per `f21f28cc`: close commit then wrap commit]**.
  Iteration-6 final basis: **[PENDING — G1–G8 gate results; the Step-A certificate
  count; Step-B tallies; whole-tree census cells]**.
- Fixed already (byte-cited, not pending): iteration 6 shipped **article-41H3** (NEGATIVE
  discovery-grade quota-free; `e4ac8dd`) and revised **article-75 to v3** in place
  (NOT-A-SHIP; `8680edc`); the 2026-11-21 external referee set revised all 17 articles
  with **zero kernel theorems falsified** (`2bfe771`+`2ea25a9`); the introduction
  companions pass completed 17/17 (registry `f264d6b0`); KPI moved 8/16 → **9/17 ≈ 52.9%**
  (above the ≥half bar) — the close-time re-check **[PENDING]**.
- Quota at open: N=1 knowledge-level slot **[PENDING — the `[QUOTA-STATE]` /
  `[QUOTA-OUTCOME]` stamps per `r2-mclass-share-arithmetic.md` `7de17ba7`; V1 = the
  12-core M-class evaluation resolves with R3's closing batch]**. Expected iter-6
  disposition: THIRD consecutive unspent (`r2-iter6-quota-disposition.md` `356cff31`).
- Charter = **[PENDING — R9's §Iteration 7 typeset from the census consolidation at the
  iter-7 open (`422face2` DRAFT v0 = the input bench: 2 Tier-1 / 2 Tier-2 / 2 Tier-3) +
  the orchestrator's rulings; verbatim-splice discipline as at `458dce3`]**. R2's
  Option-A recommendation (day-1 placement of the quota contest) is drafted at
  `4955ac91` and rides the charter decision **[PENDING]**.

## (b) Protocol (carried from Iterations 4/5/6, unchanged — fill lane names at open)

1. 10 lanes: H (sticky; sole committer; owns this brief + the tracker) + R1–R9.
   **[PENDING — the iter-7 lane count/roles per the orchestrator's spawn map.]** One
   writer per file; lanes never commit; queue-loaded re-tasks (2–3 items, bottom-up,
   report on drain); spawn one-by-one; concurrency probe at close.
2. H commits exact-file batches — hardened gate EVERY commit: `git status --porcelain`
   + `git diff --cached --stat`; any foreign staged line ⇒ `git restore --staged`;
   NEVER `git add -A`. Prefixes **[PENDING — `Iter7:` / `Iter6 close:`]**.
3. File funnels + INDEX-row-rides-every-new-`research/`-file; tracker + briefs refresh
   per batch (unchanged).
4. Modal (MANDATORY, AGENTS.md): doz CLI `/home/doz/dozenv/bin/modal` PRIMARY (xyz =
   documented fallback — the resume probe found it WORKS again); SPEC cpu=2.0/mem=4096;
   telemetry every run (IN-LOG disposition, the eta-r4 run-14 form); `LEAN_NUM_THREADS=2`;
   taskset not -j; overrun ⇒ investigate-not-upgrade (class citation suffices for the
   authorized m4b2/G2 build-phase class); long runs (> ~40 min) `modal run --detach`
   from a `setsid nohup` wrapper. Standing lessons bind (runner-hygiene family;
   site-closure ≠ certification; verdicts from VERDICT blocks never filenames).
5. Ghost-writer containment: the 2026-11-21 incident is CLOSED (containment exit
   EXECUTED at `f586b47`; writes now idempotent; evidence pack `qa/h-ghost-writer-20261121.md`).
   Main stays H-only; lanes work in worktrees only.

## (c) Per-lane table (SEEDED from the census DRAFT + the banked units; the
orchestrator's spawn map is authoritative — every row [PENDING-ORCHESTRATOR])

| Lane | Worktree | Seeded unit (source) | Status |
|---|---|---|---|
| H | (main) | commits; the iter-7 opening mechanics on R9's typeset + approval; tracker/briefs | [PENDING] |
| R1-class | [PENDING] | verification-integrity: the iter-6 close residue folds (Step-A/B continuation logs, `FINAL-SWEEP-PLAN-ITER6.md` owed per the close skeleton §0) then iter-7 duty | [PENDING] |
| R2-class | [PENDING] | quota placement per the charter ruling (Option A day-1 recommended, B fallback; `4955ac91`); S1–S4 gate duty | [PENDING] |
| R3-class | [PENDING] | the 12-core M-class evaluation (flagship + balancePoint step-2) once the closing batch lands **[PENDING — closing-batch outcome: ≤5-fire GO, unfired at `7d7fcdd`]**; V1 of the share table | [PENDING] |
| R4-class | [PENDING] | H4 E2/F arms + G rider — BANKED to iter-7 w/ the **constraint-propagation pre-solve unit FIRST** (`H4-precharter.md` `6647fbf1` §E2/F/G; the E1 fire's outcome **[PENDING — granted `5c7fac7`, ≤3 runs, in flight]**) | [PENDING] |
| R5-class | [PENDING] | η R7 (bridge port) → R8 (full-domain assembly + threshold improvement + full-coverage axcheck) — BANKED Tier-2, FRESH grant required (`25879dd` record tail) | [PENDING] |
| R6-class | [PENDING] | [PENDING — the 75-N2 lineage's next unit: the seed-1 (N2/P3-d) prep's owner-review outcome **[PENDING — R8's prep in flight at `7d7fcdd`]** decides whether the Ξ_K′/N2 arcs charter a pilot] | [PENDING] |
| R7-class | [PENDING] | editorial: the iter-6 close-block execution support (skeleton stamps consumed at close) then the iter-7 article queue | [PENDING] |
| R8-class | [PENDING] | seed-1 (N2-completion/P3-d) discovery-prep outcome **[PENDING]** → the M3-A2 priced continuation stays FUTURE-grant-only (2–4 fires; `fbf91d1`) | [PENDING] |
| R9-class | [PENDING] | the census consolidation at open (`422face2` → the iter-7 charter bench) + novelty-verification duty; the Ξ_K′ precharter outcome **[PENDING — Tier-1 seed 1 of the census DRAFT]** | [PENDING] |

## (d) Restart instructions (fresh instance)

1. Read: `AGENTS.md` → `RESEARCH.md` (§Iteration 7 + the §Iteration 6 close-out record)
   → this brief → `ORCHESTRATION-ITER7.md` → `qa/iter4-review/h-wave4-log.md` tail.
2. **PLAN CHECK FIRST (the standing user directive from iter-6):** confirm the session
   runs under the approved plan family BEFORE spawning; if not — report and await the
   user. No auto-resume; no heartbeat automation.
3. Verify main CLEAN at **[PENDING — the wrap commit sha]**; worktrees persist; pull the
   lane map per REPORT, never delete/clean; `modal app list` orphan check.
4. Day-1 records land worktree-side until the opening commit; dates from decision rows
   or `git show -s --format=%cs`, never memory.
5. The close-skeleton residue owed INTO iter-7 if not consumed at close: the gates file
   lineage, the Step-A -iter6 log, `FINAL-SWEEP-PLAN-ITER6.md`, the optional rehearsal
   **[PENDING — each consumed-or-carried cell per the close act]**.

## SESSION END

**[PENDING — this section is written at Iteration 7's own session end/pause per the
ITER6 convention: cause of stop, state at pause (main sha, per-lane states),
interrupted-units map (sha-guarded), restart map. Nothing here is pre-fillable.]**

— pre-drafted by lane R6 (worktree agent-06) @ `7d7fcdd`, 2026-11-21. PREP ONLY; the
wrap commit consumes this file; INDEX row rides H's landing.
