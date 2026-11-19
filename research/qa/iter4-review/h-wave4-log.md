# H wave-4 lane log (Iteration 4 close act + Iteration 5 open — wave 4, opened 2026-11-19)

Append-only, dated entries; lineage of `h-wave3-log.md`. H = sticky helper/infra lane
(sole committer; worktree forwards, K-assembly standby, tracker/brief upkeep, close-act
mechanics on orchestrator signal). Canonical lane table:
`research/ORCHESTRATION-ITER4.md` (wave-4 header). Restart map:
`research/RESUME-BRIEF-ITER4.md` §SESSION END wave-3 wrap §(b).

## 2026-11-19 — wave-4 open, item 1: worktree survey + safe forward + carry manifest (H)

Main verified CLEAN at `e3d984b` (branch `master`) before any action. All 10 lane
worktrees were detached @ `53c1548` with the orchestrator-declared dirty counts
(01:4, 02:18, 03:22, 04:15, 05:14, 06:34, 07:26, 08:8, 09:16, 10:17 — default-porcelain;
confirmed exactly). Classification per tracked-modified file: sha256 vs
`git show 53c1548:<path>` AND `git show e3d984b:<path>` → SAFE-CARRY (worktree bytes ==
main bytes; forward loses nothing) / LIVE-CARRY (differs from both; preserve to
`<wt>.carry/` then restore over the forwarded tree). Empirical mechanics (agent-05
attempt): git blocks the forward on BOTH tracked-modified files (even when worktree
bytes == main bytes) AND colliding untracked files (even byte-identical) — so the
executed per-worktree procedure was: (1) snapshot LIVE-CARRY tracked + ALL
colliding untracked to `<wt>.carry/{tracked,untracked}/<relpath>`; (2) reset
tracked-modified to base (`git checkout -- <f>`; SAFE-CARRY bytes are on main,
LIVE-CARRY bytes are in `.carry`); (3) move colliding untracked aside; (4)
`git checkout e3d984b`; (5) restore LIVE-CARRY bytes over the forwarded tree (verified
byte-identical to `.carry`); (6) verify identical-untracked re-created byte-identical.
No `git clean`, no stash, no lane file deleted (removals were snapshot-first, and
checkout re-created identical bytes).

### Manifest (worktree | classes | action | post-state @ e3d984b)

| worktree | tracked-modified (class) | untracked | action | post-state |
|---|---|---|---|---|
| agent-01 (spare) | none | 4 scratch, no collision (dispositions already on record, h-wave3-log 2026-11-18) | plain forward | 4 untracked intact |
| agent-02 (R1) | **ANOMALY — see below** | — | forward only (tree arrived clean) | CLEAN |
| agent-03 (R2) | Q4.lean SAFE; REPORT-INPUTS **LIVE**; r3-tables **LIVE** | 17 collide-identical (landed: a2 instruments, tally, 73-Q4 family, preflights) + 7 `rehearsal/` no-collision | LIVE ×2 preserved+restored; identical set snapshotted+re-created | 2 tracked restored-dirty + 7 rehearsal scratch |
| agent-04 (R3) | articles 22/71, bridges, candidates 22/76, run_zzv2.py — all SAFE; REPORT-INPUTS **LIVE**; r3-tables **LIVE** | 26 collide-identical (ff-ez2 P0–P2 family, zzv2 family) | LIVE ×2 preserved+restored | 2 tracked restored-dirty |
| agent-05 (R4) | al3d A1/A2/P0/run_pilot.py/run_pilot.sh — all SAFE | 9 collide-identical | plain-after-resets | CLEAN |
| agent-06 (R5) | none | 33 collide-identical (N2 family) + 1 no-collision (`logs/n2-p1-run8.log`, superseded closure run, never landed) | snapshots only | 1 untracked (run8 log) |
| agent-07 (R6) | dossier-41 SAFE; 32/run_pilot.sh SAFE; REPORT-INPUTS **LIVE** | 23 collide-identical (10-tranche L3/L4/L5+records+logs, 32 M2, 41/P0, a6 files) | LIVE preserved+restored | 1 tracked restored-dirty (+1 NEW untracked `a6-iter5-charter-typeset.md` appeared post-forward = R6 live) |
| agent-08 (R7) | candidates/77, priorart, truffet-scope — all SAFE | 25 collide-identical (77 T1/T2 family, 78 family, a7 reviews) | plain-after-resets | CLEAN |
| agent-09 (R8) | candidates/74, ProbeG9, gprobe.py — all SAFE | 23 collide-identical + 1 **collide-DIFFERS**: `pilots/22/T2a-P0-record.md` = the KNOWN BEHIND-MAIN delta (lacks H's 2026-11-17 correction :74–83) | differs snapshotted to `.carry`, **main's corrected version kept in-tree** (restore would delete H's correction; 3-way-merge flag stands) | CLEAN (record now tracked at main's bytes) |
| agent-10 (R9) | articles 01/10/11/20/30/32/42/52/72/75 — all SAFE; `articles/README.md` **LIVE** | 6 collide-identical | LIVE preserved+restored | 1 tracked restored-dirty (README future edits = 3-way vs main's W1-pre-landed state) |

Carry directories (`/home/doz/zcode-workdir/worktrees/<wt>.carry/`, snapshots
byte-exact, post-forward restore cmp-verified 4/4): 03 (2 tracked + 18 untracked),
04 (2+26), 05 (0+9), 06 (0+33), 07 (1+23), 08 (0+25), 09 (0+24, incl. the T2a
older-lane copy), 10 (1+6). No `.carry` for 01/02 (nothing to preserve).

Funnel dispositions (restored LIVE-CARRY copies are WORKTREE-SIDE ONLY):
`r3-verification-tables.md` copies in 03/04 = the known stale-baseline discard-side
copies (A1-only funnel — never pull); `REPORT-INPUTS-ITER4.md` copies in 03/04/07 =
H-shepherded funnel (lanes report content; H applies surgically; never verbatim-copy);
`articles/README.md` in 10 = splice-checklist surface (edits ride the close commit).

Staleness-guard base rebased by this forward: worktree detach point 53c1548 →
**e3d984b** for all 10; regenerate `git diff --name-only e3d984b..HEAD | sort` after
every H batch (CHECK-BEFORE-VERBATIM-COPY rule unchanged).

### agent-02 ANOMALY (external clean in a ~2-minute window; recorded for the orchestrator + R1)

- Timeline: H's classification pass (≈18:25) saw the declared 18 dirty entries (8
  tracked: AGENTS-ITER4-DRAFT + SCAN + FINAL-SWEEP + axcheck_iter4 + make_axcheck +
  oai-donor-map + make_axcheck72m1 + r3-tables; 10 untracked: stepA log, 72-M1/75
  axcheck runners+logs, gates file, a1-prechecks ×3). Seconds later H's forward script
  read status **EMPTY** and checked out e3d984b cleanly (reflog: that checkout is the
  ONLY git-level action beyond the original detach — no other checkout/commit ever
  happened in this worktree). Concurrency probe: **8 × zcode-cli live** at 18:27; doz
  Modal shows two crossmath apps created 18:29 (below) — wave-4 lanes were ACTIVE in
  this window. Conclusion: an external actor — by all appearances the R1 lane
  resyncing its own worktree — cleaned it between H's two passes.
- Loss assessment: 15/18 entries were byte-identical to main (zero loss, now tracked).
  3 worktree-only versions were NOT snapshotted (no `agent-02.carry` could be created
  — tree arrived clean): `feasibility/ITERATION4-SCAN.md`, `feasibility/probe/
  make_axcheck.py`, `feasibility/probe/logs/stepA-incremental-iter4.log`. Checked the
  shared object store: 6 unreachable blobs exist, none are these files (all old
  INDEX/STATUS/digest/decl-index class) — not git-recoverable. Probable-zero genuine
  loss: main carries their landed W1 descendants (stamped SCAN; make_axcheck with the
  N2P0 closure row + EXTRA_REWRITES; stepA log with the sweep-time entry), so the
  worktree copies were most plausibly A1's pre-W1 states — but that is reconstruction,
  not proof. **Flag to R1 (owner): confirm the clean was yours and nothing unlanded
  was discarded; the close-residue staging fixes re-apply on main's W1 copy either
  way.**

## 2026-11-19 — wave-4 open, item 2: Modal route health (H; read-only, both routes)

- **doz PRIMARY — LIVE and carrying this wave's runs.**
  `/home/doz/dozenv/bin/modal` client 1.6.2, profile `semraker`; `app list`:
  `crossmath-pilot-zzv2-lam` (`ap-v35oNQsyWxcz8Z9lWNPlDn`, ephemeral, 1 task) +
  `crossmath-probe` (`ap-Ff7T9BWeQPUGijytDT50oF`, ephemeral, 1 task), both created
  2026-11-19 18:29 +08 = **wave-4 lane runs IN FLIGHT at probe time**, on the
  route-compliant side (warm-layer apps on doz — the η-pin-probe day-1 fire class).
- **xyz FALLBACK — LIVE.** `sudo -n -u xyz /home/xyz/xyzenv/bin/modal` client 1.6.3,
  workspace `donniexyz888`; `app list`: 3 FOREIGN apps (indo-evaluate ×2,
  indo-train-continue), all stopped / 0 tasks, created+stopped 2026-11-17:02–17:17 +08
  today — the standing shared-workload class (brief caveat 2). **Zero crossmath-* rows,
  zero collisions.**
- Route ruling stands unchanged: doz CLI primary for warm-layer apps
  (crossmath-probe, crossmath-pilot-75, pilot-32/73, today's zzv2-lam); xyz for
  brand-new apps + fallback. AGENTS.md § Modal usage guidelines route-agnostic and
  binding (2 cpu / 4 GB, telemetry every run, LEAN_NUM_THREADS=2, taskset not -j,
  overrun ⇒ investigate-not-upgrade).

Next items on H's queue: commit standby / K-assembly (restart map §(b)3–5) — **K does
NOT fire without the orchestrator's explicit signal**; post-K iteration-5 opening
batch (charter splice after approval, day-1 fire records, INDEX rows, tracker/brief
refresh).

## 2026-11-19 — ORCHESTRATOR APPROVAL recorded (H): iteration-5 charter splice, sequenced post-K

- **R3's Iteration-5 charter splice APPROVED VERBATIM by the orchestrator** (message
  to H, 2026-11-19): (a) the RESEARCH.md §SPLICE text applies via the machine diff
  `research/qa/iter4-review/a6-iter5-research-splice.diff` (worktree agent-07) with
  `git apply` — R3 verified it applies clean; (b) the §STATUS-BLOCK text appends to
  STATUS.md AFTER K's Iteration-4 closed block.
- **Sequence (binding): K FIRST, unchanged; the iteration-5 OPENING COMMIT comes
  after K** = the splice + the STATUS block + INDEX rows for the two new
  qa/iter4-review files (`a6-iter5-charter-typeset.md`, `a6-iter5-research-splice.diff`)
  + the day-1 fire records as R4/R5/R6 report them. **No splice before K.**
- **R3 re-tasked by the orchestrator: 10-D4 M-arc execution (day-1-class; holds
  commits — worktree outputs only, H pulls).** R3's iter-5-prep deliverables (the
  typeset + the splice diff) are complete and staged in agent-07 pending the
  post-K opening commit.
- H execution posture unchanged: K-assembly standby (R1 close residue + R2 gates
  reports → K-list minus W1-pre-landed → fire ONLY on explicit orchestrator signal);
  the opening batch is now fully pre-specified by this approval.
