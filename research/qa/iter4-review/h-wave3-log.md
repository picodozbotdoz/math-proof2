# H wave-3 lane log (Iteration 4, wave 3 — opened 2026-11-18)

Append-only, dated entries; rides H commits when updated. H = helper/infra lane
(commits, tracker, brief stamps, notary, close-act mechanics). Canonical lane table:
`research/ORCHESTRATION-ITER4.md`.

## 2026-11-18 — wave-3 open (H)

- Session restarted after the second network-failure termination (snapshot #2 `2f90dcc`).
  Wave-3 stamp commit: `effabf7` (tracker wave-3 header + lane table re-cut with worktree
  assignments; brief Wave-3 open note appended). Main tree CLEAN before/after.
- Worktree survey (all detached @ `53c1548`, per design): dirty-file counts —
  agent-01: 4 (H scratch), agent-02: 18, agent-03: 18, agent-04: 13, agent-05: 8,
  agent-06: 21, agent-07: 22, agent-08: 8, agent-09: 15, agent-10: 15. The five
  in-flight owners (04/05/06/08/09) carry their uncommitted outputs; the new-duty
  worktrees (02/03/07/10) additionally carry their lanes' earlier landed-and-committed
  content — commit deltas only when pulling (the agent-09 NOTE convention).

### Previous-instance scratch disposition (4 untracked files in worktrees/agent-01)

1. `wave2-commit-runbook.md` — **absorbed + superseded.** Durable rules (hardened
   pre-commit gate, INDEX-row-same-commit, tracker/brief rides, concurrency probe,
   run-route reminders) are already encoded in brief §(b)5/§Substrate baseline and the
   tracker; the per-lane deliverable expectations were wave-2-specific (superseded by
   the wave-3 map). The CHECK-BEFORE-VERBATIM-COPY staleness guard is regenerated
   below and stays in force. File remains worktree scratch (never commit).
2. `index-drift-listing.md` — **superseded; do not act on it.** Verified 2026-11-18:
   its actionable items were executed by the 2026-11-17 H INDEX-reconciliation
   (REPORT-INPUTS-ITER4 now ×3 INDEX mentions, week1-agenda ×6,
   closeout-gate-run-C2 ×1, RESUME-BRIEF-C2 ×4, cycle2-qa-plan ×3; dead rows
   20/21/42M4/50M2/73 stamped SUPERSEDED/MOVED with disk-verification notes; the
   stepB-c2-m4b-donor filename corrected at INDEX :165; zzv2 P0.lean folded into
   row :252). Close-out protocol gate 3 re-runs the full bidirectional reconciliation
   fresh on the closing tree — that sweep, not this scratch, is the gate input.
3. `r5-14-runqueue-sweep.md` — **superseded.** All 12 §14 rows resolved (G9 fired
   GREEN runs 36/37 `68be1a2`; ZZV2-λ P0 GREEN `1a0ef7e`; 32-run12 landed; the rest
   DONE-GREEN per the wave-2 status block).
4. `agents-substrate-note-correction.patch` — **NOT applied, by design.** AGENTS.md
   edits are user/orchestrator-gated, not lane-initiated; the substance (xyz unblocked
   2026-11-16, distinct workspace, doz-primary route ruling) is already recorded in the
   committed brief §Substrate baseline Modal-health notes. Patch stays worktree scratch
   as the pre-drafted text should the owner decide to apply it.

### Substrate notary re-verify (2026-11-18, read-only) — **PASS, zero drift**

All 10 git-notary targets match the launch table (branch / HEAD / toolchain / pin / tree):

| Repo | Branch | HEAD | Toolchain | Mathlib pin | Tree |
|---|---|---|---|---|---|
| encore-mathlib/repo/mathlib4 | master | `ff2494ea5e` | v4.36.0-rc2 | (is the pin) | CLEAN |
| tauceti | main | `d92acc5c0` | v4.36.0-rc2 | n/a | CLEAN (formalization.yaml intact, 4,747 B) |
| axiommath/ZetaZerosV2 | dev/claude | `a86af1a` | v4.36.0-rc2 | full-sha `ff2494ea…fa0059` | CLEAN |
| axiommath/ZetaZeros | dev/claude | `c0b585e` | v4.36.0-rc2 | full-sha match | CLEAN |
| axiommath/DedekindZetaZeroFree | dev/claude | `4f6208b` | v4.36.0-rc2 | full-sha match | CLEAN |
| axiommath/PrimeNumberTheoremAnd | dev/claude | `d82cfae` | v4.36.0-rc2 | full-sha match | CLEAN |
| axiommath/Weil | dev/claude | `c1c8983` | v4.36.0-rc2 | full-sha match | CLEAN |
| axiommath/AreaLaw2D | dev/claude | `c0f6d96` | v4.36.0-rc2 | full-sha match | CLEAN |
| liu-zerofree | main | `7d10420` | v4.34.1 | n/a | CLEAN |
| math-proof1 | master | `a02216a` | v4.36.0-rc1 (for the record — launch table left blank) | n/a | CLEAN except untracked `.pwd` (known) |

No new commits, no branch moves, no toolchain changes, no dirty trees. Nothing to
report to the orchestrator on substrate grounds.

### CHECK-BEFORE-VERBATIM-COPY staleness guard — regenerated for wave 3

Rule (instated 2026-11-17, in force): any lane copy touching a file modified on main
since the worktree base gets a 3-WAY DIFF (lane vs live main vs base) + surgical merge;
FAST-FORWARD EXCEPTION: if main's last touch of the file was H's own verbatim copy of
THAT lane's earlier version (`git log --oneline -1 -- <file>`) and the lane version
descends from it, verbatim copy is a fast-forward — verify the diff shows only the
lane's own edits. **Regenerate after every H batch:**
`git diff --name-only 53c1548..HEAD | sort` (base = worktree detach point, unchanged).

List @ `effabf7`: **179 files** (full list = the command output; not inlined). Key
intersections with ACTIVE wave-3 deliverables:

- `qa/iter4-review/r3-verification-tables.md` — **A1-ONLY funnel** (tracker ruling).
- `qa/REPORT-INPUTS-ITER4.md` — **H-SHEPHERDED** (surgical hand-edits only).
- `feasibility/probe/{axcheck_iter4.py, make_axcheck.py, FINAL-SWEEP-PLAN-ITER4.md}` —
  A1 close-out-gates surface (pre-staged sweep; final runs at close).
- `pilots/ff-ez2/*` — A3 active (P2 descope-closure). `pilots/al3d/*` — A4 active
  (P2-c/d/e). `pilots/75/N2*` + runners — A5 active (closure → M2/M3).
  `pilots/77/*`, `candidates/77-*.md`, `novelty/iter4-truffet-classical-scope.md` —
  A7 active (fold + T1 + T2). `pilots/74/*` — A8 active (verify-fire completion).
- `articles/*` + `articles/README.md` — A9 splice-time touches (7 mandatory H-owned
  checklist items ride the close commit; article-75 README row PENDING-CLOSE).
- `INDEX.md`, `ORCHESTRATION-ITER4.md`, `RESUME-BRIEF-ITER4.md` — H's own (every batch).
- Landed-at-`9dc6684` families with no active owner (10-D tranche, 32, 73-Q4, 78,
  zzv2-lam, 22-T2a, 41/12 preflights): pull only if a lane explicitly reports them.

### Cross-batch reminders (carried from wave 2, still binding)

- **PATH DECISION:** iteration-4 §10.x verification landings tables live in
  `qa/iter4-review/r3-verification-tables.md` ONLY (REPORT-INPUTS-ITER4 has no §10;
  its §1 slot-ledger rows are the separate exception, H-shepherded).
- `articles/README.md` row updates ride with any article change (counts re-ratified
  vs disk). STATUS.md opened-block updates: orchestrator signal only.
- Never commit: AGENT_INSTRUCTION_1.md (untracked by design; absent today),
  external-doc/ (gitignored), sibling repos (read-only), worktree scratch.
- Date discipline: dates from decision-log rows or commits, never memory.
- Concurrency probe at each batch close: `ps -eo comm --no-headers | grep -cx zcode-cli`.

## 2026-11-18 — standing-duty re-task batch (runner-patch adjudication, route health, pull manifests)

### 1. runner-fixes-wave2.patch adjudication (signal received; verdict: NO application commit)

Input copies: untracked `worktrees/agent-09/research/feasibility/probe/runner-fixes-wave2.patch`
vs tracked main `research/feasibility/probe/runner-fixes-wave2.patch` (last touched `919cc82`,
the taskset revision) — **byte-identical** (diff clean). Dry-run `patch -p1` against main
`66a8085`, hunk-by-hunk:

| Target | Fix | Verdict |
|---|---|---|
| zzv2-lam/run_zzv2.py | (a) taskset build cap | **LANDED** — hunk #3 FAILED dry-run because main already carries `taskset -c 0,1 lake build ZetaZeros` (`run_zzv2.py:131`, A3's 6-line lane edit ridden with the P1-GREEN commit; SUPERSEDED-BY in form: lane edit without the patch's comment block) |
| zzv2-lam/run_zzv2.py | (b) cache retry ≤4 + DEFER-infra | **STILL-UNAPPLIED** (hunk applies clean) |
| zzv2-lam/run_zzv2.py | (c) modal_telemetry __file__-relative path | **STILL-UNAPPLIED** (applies clean) |
| zeta23e/run_zeta23e.py | (a)+(b)+(c) | **STILL-UNAPPLIED** (all three apply clean; file unchanged since patch base — current sha16 `e202c9d694fa3e1b`) |

Decision per the re-task's own test (still-unapplied AND still needed by THIS wave's
runners): **nothing qualifies — no residual application commit.** The patch's two targets
are not in the wave-3 in-flight lineage: zzv2-lam is hard-stopped for iteration 4 (Landau
η-port = the recorded iteration-5 ask), zeta23e's hEχ companion landed in wave 2. The
residual (zzv2 b/c + zeta23e a/b/c) stays available in the tracked patch for iteration-5
donor-tree builds — re-adjudicate before that use (zzv2's base has moved: sha16
`6e7e4be80ccb5204` post-taskset-landing; also note the patch header's two base-sha labels
appear transposed — current zeta23e matches the header's "zzv2" sha; harmless, dry-run is
authoritative). Untracked agent-09 copy = duplicate of main's tracked copy; remains
worktree scratch.

Service note (so nobody panics at "0 taskset refs"): none of the wave-3 runners
(ff-ez2, al3d, n2p1, 77) carries taskset — correct by design. The taskset rule targets
donor-tree `lake build` phases (lake sizes parallelism from nproc=18); the wave-3 family
are staged-file elaboration runners (`lake env lean` per file), CPU-capped via the
`LEAN_NUM_THREADS=2` CAP secret, which all four carry. pilots/74 has no runner on main;
A8's verify-fire helper `stage_and_fire.sh` is in its worktree (see manifest).

### 2. Modal route health probe (read-only, both routes) — BOTH LIVE

- **doz** `/home/doz/dozenv/bin/modal`: client 1.6.2, `app list` EMPTY (clean — no
  running apps, no leftovers). Primary route for warm-layer apps (semraker), per ruling.
- **xyz** `sudo -n -u xyz /home/xyz/xyzenv/bin/modal` (via bash -lc): client 1.6.3,
  authenticated, `app list` returns 5 FOREIGN apps — `indo-check-onnx2`, `indo-check-onnx`,
  `indo-evaluate`, `indo-test-suite`, `indo-export-onnx` — all stopped / 0 tasks, created
  2026-11-18 18:15–18:35 +08. Same foreign-workload class as caveat 2 (workspace shared);
  **zero crossmath-* rows on either route**, zero name collisions. No route breakage for
  the verification lanes; fallback route verified LIVE.

### 3. Landing-commit readiness drill — pull manifests (computed vs main `66a8085`)

Method: per dirty worktree file, hash vs main HEAD → LANDED-NOOP (identical; pull = no-op)
/ DELTA (content differs) / NEW (absent on main); directory verdicts resolved by recursive
diff (the hash-classified "delta" dirs ff-ez2/, zzv2-lam/logs/, pilots/77/, pilots/78/ are
all IDENTICAL to main — no wave-3 work on disk there yet). **When a landing report
arrives: commit from the manifest + the report's file list; no improvisation.**

- **A3 / agent-04 (FF-EZ2-P2):** true deltas = FUNNEL EXCEPTIONS ONLY —
  `qa/REPORT-INPUTS-ITER4.md` (H-SHEPHERDED: worktree copy diverged, 10 main-only vs 9
  worktree-only lines; A3 reports content, H applies surgically, never copy) and
  `qa/iter4-review/r3-verification-tables.md` (A1-ONLY funnel: worktree copy is the known
  stale-baseline copy, 815 main-only vs 20 worktree-only lines — the 20 are the
  never-committed stale §10 content, already superseded by A1's centralized rows; do not
  pull). Expected P2 payload when it exists: `pilots/ff-ez2/P2.lean` + `P2-record.md` +
  `logs/p2-run*.log` (none on disk yet). Everything else in the worktree = landed no-ops
  (articles 22/71, bridges, candidates 22/76, zzv2 family).
- **A4 / agent-05 (AL-P2-c/d/e):** one true delta — `pilots/al3d/A2.lean` (142 diff
  lines; P2-c completion in progress). Fast-forward-exception ELIGIBLE (main's last touch
  `f9d0007` = A4's own landing; verify the diff shows only A4's own edits, then verbatim).
  Expect new `logs/alp2c-run24+*.log` / P2-d runs; `A2-gaps.md` + run8/run23 logs +
  P0/A1/runners = landed no-ops.
- **A5 / agent-06 (N2-P1 closure → M2/M3):** true deltas — `pilots/75/N2-P1.lean`
  (37 diff lines beyond the v8 checkpoint; FF-eligible, last touch `dd299ef` = A5's own)
  + NEW `logs/n2-p1-run8.log` (360 lines, COMPLETE — the authorized M1-closure run,
  provenance-headed, terminal `EXIT=0`, semraker/`ap-54p4F9WBmVHcjQcf0Os2R3` = doz route
  compliant; verdict/triad counts belong to A5's landing report, not this manifest).
  Expect the report to claim closure + M2/M3 progression; all other N2 files = landed
  no-ops.
- **A7 / agent-08 (dossier-77 fold + T1-completion + T2):** one true delta —
  `candidates/77-car-occupation-dictionary-laughlin.md` (29 diff lines; fold in progress;
  FF-eligible, last touch `d2dc7a4` = A7's own battery landing). Expect `pilots/77/`
  T1-completion runs (`logs/t1-run6+*.log`, T1.lean evolution beyond the 781-LoC
  verified-red state) + T2 files when reached; `pilots/78/`, truffet-scope, prior-art,
  a7-* reviews = landed no-ops.
- **A8 / agent-09 (74-P1 completion, verify-fire):** true deltas — `pilots/74/P1.lean`
  (216 diff lines beyond the landed verified-red `170520aa…` state) + NEW
  `pilots/74/stage_and_fire.sh` (34-LoC sha-guard stage+fire helper enforcing the
  fix-batch→verify-applied→fire discipline; H never executes it — lane tooling) +
  `pilots/22/T2a-P0-record.md` **BEHIND-MAIN** (worktree copy lacks H's dated
  2026-11-17 correction block that main carries at :74–83: if A8 edits it, a 3-WAY MERGE
  is mandatory — a verbatim copy would delete H's correction). Expect `logs/p1-run7+*.log`
  + `74-P1-record.md` updates; G-probe/probe-lean/a8-* files = landed no-ops.

Manifest refresh rule: recompute at each landing batch (dirty lists move fast once lanes
resume); the LANDED-NOOP sets shrink the pull to exactly the reported payload + funnel
routing.

## 2026-11-18 — LANDING: A2 close-act runbook + draft refresh (H batch)

- Pulled from worktree agent-03 as ONE exact-file batch: NEW
  `qa/iter4-review/a2-close-act-runbook.md` (300 LoC, 20 steps / 5 phases, PREP-ONLY /
  apply-gated) + MODIFIED `qa/iter4-review/a2-close-summary-draft.md` (A2's surgical
  refresh: 6 placeholder-drift fixes + dated REFRESH RECORD). Fast-forward exception
  verified before copy: main's last touch `a42dc77` = A2's own landing; diff = only
  A2's own edits (census sentence re-quoted, §C rows 4–7 source-drift folds, MOOT note
  on [SUBTITLE-FINAL]). INDEX row staged same-commit (new research/ file). Tracker A2
  row refreshed in the same commit.
- `a2-g7-token-inventory.md` NOT pulled — byte-identical to main (`f53091cd…`), the
  frozen record confirmed untouched by design.
- **G7 correction recorded (A2's finding, relayed to A1 for the gates file):** census
  corrected **34 → 46 sites (40 close / 6 retarget-iter-5 / 0 needs-ruling)** — 12
  pre-existing missed sites (present since `de56e68`) + 1 anchor drift (SCAN FF-EZ2
  :90 → :105); new retarget-iter-5 site = L3-spec:187 (L3b–d + interface open).
- Infra note (mid-write race): agent-03's two files were being written at first probe
  (draft transiently absent between `status` and hash); re-verified stable at 19:58,
  byte-compared post-copy (BOTH-IDENTICAL). Lesson applied: hash → copy → `cmp` in one
  pass for fresh-mtime landings.

## 2026-11-18 — LANDING: A9 splice-checklist wave-3 addendum (H batch)

- Pulled from worktree agent-10 as ONE exact file:
  `qa/iter4-review/a9-splice-readme-checklist.md` (49 → 266 lines — the §D.0–D.5
  wave-3 addendum appended). Fast-forward exception verified: main's last touch
  `87187fa` = A9's own landing; diff = pure append of A9's addendum. No INDEX row
  (existing file). Tracker A9 row refreshed in the same commit.
- Addendum content of record: D.0 state correction (items 1/2 LANDED at `37a2637`,
  item 3 HALF-LANDED with D.3 the remaining exact edit); D.1–D.5 = the PENDING-CLOSE
  pre-stage (README header-counts edit pre-written; sweep-shas mechanism resolved,
  incl. the article-75 "P0.lean" = `pilots/zeta23e/P0.lean` disambiguation; in-flight
  exposure map for the five wave-3 units). H applies the addendum blocks at the close
  commit per box-11; A9 stays writer of record for D.2/D.5-activated article edits.
- Verified per the coordinator's note: everything else in agent-10 is byte-identical
  to main (cmp 14/14 EQUAL) — no other pull. Infra correction recorded: my first
  hash-probe loop double-prefixed paths under `git -C agent-10` (bogus "DIFFERS"
  output); re-verified with `cmp` — the manifest method note now prefers cmp for
  equality checks.

## 2026-11-18 — Step-B TARGETS pre-stage (H, per close-act runbook §3 Step 8)

- **Pre-staged 2 of the 3 named appends** in `feasibility/probe/make_axcheck.py`
  (Iteration-4 block):
  - `("AxPilot73_Q4", 73/Q4.lean)` — FINAL-GREEN q4-run15-green; `import C`
    auto-rewrites to AxPilot73_C; sorted order C < Q4 verified (dependency-respecting);
    other imports Mathlib-only — discharges the sweep-plan :175 "verify Mathlib-only
    imports at landing" check.
  - `("AxPilot78_P0", 78/P0.lean)` — proof-class Stage-A refutation (runbook-listed;
    NOT probe-convention; A9 checklist :147 deferred-Stage-B branch registered);
    Mathlib-only; Step-B(i) prints 3 public theorems, private census (23) → Step-B(ii).
- **STOPPED: the `AxPilot10_L3` re-anchor (runbook §3 ambiguity, per re-task rule 3).**
  The runbook text "L3.lean grew with D1–D3" conflicts with disk: the 10-tranche executed
  the file-per-rung embedding pattern — L3.lean (2,805 LoC) frozen since D1 (`9a122e7`);
  D2 grew L4.lean (4,195 LoC, `0677eae`); D3 grew L5.lean (4,248 LoC, `9dc6684`) =
  tranche-final embedding L4/L3 verbatim; all three import Mathlib only. Anchoring
  options for A2's rehearsal: (a) single `AxPilot10_L5` row (full D1–D3 stack);
  (b) `AxPilot10_L3` + `AxPilot10_L5` rows (keeps the sweep-plan :35 promised name);
  (c) literal name `AxPilot10_L3` pointed at L5.lean (discouraged — name/file mismatch).
  Recorded in-file as a STOPPED comment block; row(s) appended on A2's decision.
- Five-unit proof-class finals left as DOCUMENTED PLACEHOLDER comments (expected stage
  names: AxPilotAL3D_A2-re-stage-or-AxPilotAL3D_A3; AxPilot77_T1; AxPilot74_P1;
  AxPilotFFEZ2_P2; AxPilot75_N2P1 + M2/M3 TBD) — rows land on each unit's landing
  commit per the runbook.
- Syntax verify: `python3 -m py_compile` **rc=0**; module-load assertions OK (both new
  sources exist, no duplicate stage names, 53 rows total, sorted-order neighbors
  AxPilot73_C < AxPilot73_Q4 < AxPilot75_Pa). No lean, no Modal (as instructed).
- Not touched (A1 live on classifier dry-run): FINAL-SWEEP-PLAN-ITER4.md,
  r3-verification-tables.md — read-only references for this adjudication.
- Commit-message deviation, declared: the suggested "3 known appends" text would
  miscount (2 landed + 1 STOPPED) — accuracy per the close-out date-discipline rule.

## 2026-11-18 — LANDING: A6 iteration-5 charter candidate (H batch)

- Pulled from worktree agent-07 as ONE exact file: NEW
  `qa/iter4-review/a6-iter5-charter-candidate.md` (467 LoC, §0–§6: 16-row obligation
  inventory, ten ranked leads, debt rungs, charter skeleton, bench coherence audit —
  41 CHARTER = pilot name not row count, FF-EZ2 bench row superseded — novelty scan,
  open questions). INDEX row staged same-commit; tracker A6 row refreshed (delivered).
- Scope check per instruction ("everything else equals main"): 21 of agent-07's other
  dirty entries cmp-EQUAL main; TWO out-of-scope deltas remain worktree-side, NOT
  pulled: `qa/REPORT-INPUTS-ITER4.md` (H-SHEPHERDED funnel — A6 did not report it) and
  `pilots/10/L4.lean` + `pilots/ff-ez4/` (lane-local state vs main; flagged for any
  future A6 pull — 3-way merge, not verbatim).

## 2026-11-18 — LANDING: A2 close-act Phase-1 rehearsal (H batch)

- Pulled from worktree agent-03 as ONE exact-file batch: NEW
  `qa/iter4-review/a2-close-rehearsal-report.md` (D1–D6 defect list, 0 blockers,
  3 waits-on-lane; §R5 mechanical verifications; §R6 K-list 5-row amendment) +
  MODIFIED `a2-close-act-runbook.md` (rehearsal header + Step-5 ORCHESTRATOR-RATIFIED
  both-record + placeholder-map row-8 D3 locator fix + K-amendment rows 17–21) +
  MODIFIED `a2-close-summary-draft.md` (D2 fix: retarget 6 + L3-spec carrier
  enumerated; D4 fix: SCAN stamp 9 live rows). All three verified as A2's own edits
  descending from its landed versions (FF exception; main's last touches were H's
  verbatim copies of A2's files). INDEX row staged same-commit; tracker A2 row
  refreshed. The `rehearsal/` staging dir NOT pulled (never-commit by design).
- **Caveat recorded: the rehearsal ran against main @ `c67d64e` — it PREDATES the
  Step-B TARGETS pre-stage (`862d8d0`).** The runbook's §3 "AxPilot10_L3 re-anchor
  (L3.lean grew with D1–D3)" text is unchanged by the rehearsal deltas and remains
  factually wrong on disk; my STOPPED-comment adjudication (L3 frozen since D1; the
  anchoring decision) is NOT addressed by D1–D6. Open item for A2/orchestrator:
  the AxPilot10 anchoring ruling + the make_axcheck.py row append on that ruling.
- Waits-on-lane relayed by the report (for tracker visibility): A9 — item-1 wording
  + article-10 status-table D2-FINAL/D3 staleness; A1 — the D2-FINAL/D3 §10 fold
  (data on main, no unit dependency); A9/orchestrator — D6 qualifier.

## 2026-11-18 — ORCHESTRATOR RULING applied: AxPilot10_L5 single-row append (H)

- The STOPPED `AxPilot10_L3` re-anchor ambiguity (h-wave3-log, TARGETS pre-stage
  entry) is RESOLVED by orchestrator ruling: **single row `("AxPilot10_L5",
  pilots/10/L5.lean)`** — L5 embeds L4/L3 verbatim ⇒ full D-tranche theorem coverage
  at least compile cost; L3/L4 keep §10 citations as historical rungs; the sweep audits
  FINAL state = L5. STOPPED comment block REPLACED by the row + dated ruling note
  (rationale in-file). Syntax re-verified: py_compile rc=0; module-load assertions OK
  (source exists; no 'AxPilot10_L3' row remains; 54 rows total, no dups; sorted
  neighbors AxPilot10_L2 < AxPilot10_L5 < AxPilot10_M1; Mathlib-only import ⇒ no
  dependency-ordering constraint).
- Residual note for A2's next touch: the runbook §3 Step-8 line still reads
  "`AxPilot10_L3` re-anchor (L3.lean grew with D1–D3)" — A2-owned text, left untouched
  by H (one-writer rule); the ruling note in make_axcheck.py + this entry are the
  record until A2 folds it.
