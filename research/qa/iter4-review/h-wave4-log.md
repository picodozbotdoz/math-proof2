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

## 2026-11-19 — ANOMALY DISPOSITION (R1 via orchestrator; closes the agent-02 item)

R1 confirms the agent-02 clean was **ITS OWN deliberate `git checkout -f e3d984b`**
after verifying the forward landed — **pre-verified zero-loss**: every
dirty+untracked entry diffed vs `git show e3d984b:<path>` first; 15/18
byte-identical; the 3 worktree-only versions each verified **STRICT SUBSETS of
main** — `ITERATION4-SCAN.md` lacked the SUPERSEDED stamp; `make_axcheck.py` was
pre-W1 (its +2 rows T3/M2 already on main); the stepA log lacked H's sweep-time
entry. No in-flight edits existed at checkout time; R1 now works from main's W1
copy byte-identical. **Anomaly CLOSED as self-inflicted-and-verified, not
external; no further action.** (H note: consistent with the reflog — a path-scoped
force reset leaves no HEAD reflog entry; H's checkout was the only HEAD move.)

**Standing note (R1's diagnosis, staged for the close-residue fixes):** the
Step-8 sweep's staging defects have two root causes — (a) a **STEM COLLISION**:
`78/P0.lean` and `al3d/P0.lean` share the stem "P0" in the global rewrite map
(explains the "unknown identifier proj" vs "unknown module" symptom split); (b)
the "Pa < N2P0" sort belief is FALSE ('N' < 'P' sorts N2P0 first) — the fix is
**dependency-ordered emission (order.txt), not name-sorting**.

## 2026-11-19 — K-PREP 1: STATUS.md Iteration-4 CLOSED block, ready-to-apply pre-draft (H; applies INSIDE K on orchestrator signal)

Append after the `## Iteration 4 (opened 2026-11-16)` block (file end, post-:817),
mirroring the Cycle-2 closed-block structure (`STATUS.md:718–761`). Counts are the
machine §10 basis (fixed; D7 vocabulary); `[…]` placeholders resolve at K time
([K-DATE] = K's commit date, [K-SHA] = K's sha, sweep numbers from R1's report):

```
## Iteration 4 CLOSED — [K-DATE]

Charter: `RESEARCH.md` § Iteration 4 (+ close-out record, same date). Session maps:
`RESUME-BRIEF-ITER4.md` (wave-3 wrap = restart map; wave-4 open stamp); lane tracker
`ORCHESTRATION-ITER4.md`. Close-completion commit: [K-SHA] (the close act was
interrupted post-Step-8 on 2026-11-18; K completed it — [DATE-CLOSED] = K's actual
date per the W1 pre-landing ruling).

**Final pilot outcomes (§10 basis, machine-computed by
`qa/iter4-review/tally_section10.py`; D7 vocabulary):** tables N = 32 — **26
GREEN-triad / 3 honest-partial / 3 NOT-GREEN-honest**; every landed row triad-only
`[propext, Classical.choice, Quot.sound]`, 0 sorryAx; whole-tree **385/386
triad-clean decls** (226/226 machine over 9 sections + 159/160 manual per the
§10.CENSUS companion; the ONE residual = 77-T2's filter-blind-spot tainted decl →
Iteration 5) + **18/18 donor rows triad at their donor pins**. Evidence:
`qa/iter4-review/r3-verification-tables.md` §10 + §10.CENSUS.

**Sweep:** FINAL-SWEEP-PLAN-ITER4 Steps A–B executed at close: Step-A certificate
**52 exact** on the closing tree (sweep-time entry); Step-B(i) 58 stages — 53 OK /
5 staging-class FAILs dispositioned in-log (`feasibility/probe/logs/
axcheck-iter4-close-run1.log`), the 5 re-fired after the make_axcheck staging fixes:
[R1-SUBSET-REFIRE-RESULTS]. Step-B(ii) custody stages per the runbook. Ledger:
`feasibility/VERIFICATION-LEDGER.md` §10 + Step D.

**Gates G1–G8:** executed on the exact closing tree; persistence table =
`qa/iter4-closeout-gates.md` §G8 (filled at K).

**Articles:** 75 two-tier DISCOVERY-CONDITIONAL (P-b entry + 5/6 strip-distinct arm
FINAL-GREEN) and 78 NEGATIVE (discovery-grade; quota not consumed); corpus header
"6 discovery-grade (01, 30, 32, 42, 75, 78)". Knowledge-level quota cap-N = 1
**UNSPENT** (the wave's record outputs are dossier/pilot records and verification
tables, not N-class articles). Token census **40/46 closed in-cycle, 6 retargeted
to Iteration 5, 0 unrulled** (corrected census, `a2-close-act-runbook.md` §8).
Index: `articles/README.md`.

**Carried to Iteration 5 (owners recorded):** 72-M1 L3b–d + interface theorem;
22-T2a conditional remainder (PNT+ watch DEFER); 74-T3 (OPEN-GATED); 10-tranche
D4–D6 (D4 ruled Iteration 5); N2 P2-a paused-at-close (2/6, name-resolution only;
resume note = iter-5 lead-1) + P3 GO; AL-P2 P2-d find-#5 park + P2-e (canonical
z-rank rebuild); 77 T1's 7 site-local residuals + T2's tainted decl; G10 SHELF;
11-M3 benched; debts f/h/l.

**AGENTS-ITER4-DRAFT:** E1–E9 NOT applied at close — user-gated (separate
decision, separate commit if approved).
```

## 2026-11-19 — K-PREP 2: the two [DATE-CLOSED] amendment patches (H; execute INSIDE K)

Old-strings verified UNIQUE on main @ `3dc6de2` (one hit each; the
a2-close-summary-draft carries no copy of the sentence). At K time substitute
[K-DATE] = the actual K commit date (date discipline: the commit IS the date) and
[K-SHA] = K's sha (if the sha is wanted in-file, commit K first without these two
files then amend? NO — single-K rule: cite the K sha as "this commit" instead, or
fill the date only; H default: DATE-ONLY, no self-referential sha).

- **Patch A — `research/feasibility/ITERATION4-CHARTER-SPLICE.md:59`:**
  - old: `Iteration 4 closed 2026-11-18 (orchestrator). Final state: the wave's pilot`
  - new: `Iteration 4 closed [K-DATE] (orchestrator; dated correction at K: the close
    act was interrupted post-Step-8 on 2026-11-18 and completed by close-completion
    commit K on [K-DATE] per the W1 pre-landing ruling — honesty of the record over
    the earlier same-day assumption). Final state: the wave's pilot`
- **Patch B — `research/RESEARCH.md:198`:**
  - old: `**Close-out record (2026-11-18).** Iteration 4 closed 2026-11-18 (orchestrator).`
  - new: `**Close-out record ([K-DATE]; dated correction at K: the close act was
    interrupted post-Step-8 on 2026-11-18 and completed at K on [K-DATE] per the W1
    pre-landing ruling).** Iteration 4 closed [K-DATE] (orchestrator).`

The three SUPERSEDED stamps' own dates (2026-11-18) are the W1 application dates —
factually correct, NOT amended. All other in-block dates (D7 ruling, censuses,
landings) are decision-row dates and stay.

## 2026-11-19 — K-PREP 3: iteration-5 OPENING-COMMIT assembly checklist (H; executes post-K, one commit)

0. Preconditions: K landed (tree CLEAN at K; post-K checks done); the 2026-11-19
   orchestrator approval on record (this log). DECISION-1/3/4 embodied in R3's
   approved splice text — no re-derivation.
1. Pull R3's two files from worktree agent-07 (hash → copy → cmp vs reported
   shas): NEW `research/qa/iter4-review/a6-iter5-charter-typeset.md` + NEW
   `research/qa/iter4-review/a6-iter5-research-splice.diff`.
2. `git apply --check research/qa/iter4-review/a6-iter5-research-splice.diff`
   against the post-K tree (K's Patch B touches RESEARCH.md :198; the splice
   appends §Iteration 5 at file end — contexts should not collide; if --check
   fails: STOP, route to R3 for a regenerated diff; never hand-merge the charter).
3. `git apply` the diff → RESEARCH.md gains §Iteration 5.
4. Append R3's §STATUS-BLOCK text VERBATIM to `research/STATUS.md` AFTER the
   Iteration-4 CLOSED block (landed inside K).
5. Pull every R4/R5/R6/R8/R9 file reported by then — day-1 fire records observed
   on disk already: zzv2-lam `eta-pin-probe` runs (agent-04; run 1 FAIL-mechanical
   logged, run 2+ per report), N2-P2 run 22+ (agent-06), 41-P0 runs 1–2 (agent-08;
   run 2 rc=0 four #check targets), AL M0 regression (agent-05), plus
   `a6-iter5-wave2-queue.md` (agent-05) and `a9-iter5-article-watchlist.md`
   (agent-10) if reported. Funnels: r3-tables → R1 only; REPORT-INPUTS →
   H-shepherded (never verbatim).
6. INDEX rows same-commit: the two new qa files + every pulled file (dated,
   source-cited).
7. Tracker + brief wave-4 rows refresh (iteration 5 OPENED; lane map per the
   orchestrator's wave-4 assignments; H row → opening landed).
8. Hardened pre-commit gate; commit `Iter5: <summary>` (exact files, never -A).

## 2026-11-19 — telemetry watch pass 1 (H; note-only, per re-task item 5)

Five day-1 fire logs on disk (worktree-side, not yet reported/pulled): all
ROUTE-COMPLIANT (doz CLI / profile semraker; warm apps crossmath-pilot-zzv2-lam,
crossmath-pilot-75, crossmath-probe, al3d lineage) and SPEC-COMPLIANT
(cpu=2.0/mem=4096 soft, LEAN_NUM_THREADS=2 via CAP secret, telemetry @60 s,
taskset-not--j where build phases exist, verify-fire sha guards where chartered).
Notes (no lane interruption):
- `zzv2-lam/logs/eta-pin-probe-run1.log`: one telemetry sample OVER cpu (t=120 s,
  cpu=5.70 — soft-limit burst; nproc=18 box). Investigation line owed in the
  lane's reported record per AGENTS §Modal 3; watch run 2+.
- `pilots/41/logs/p0-run{1,2}.log`: OVER-mem samples (4,312 / 8,005 MB) = the
  DOCUMENTED mmapped-olean class (anon=0; AGENTS measured fact 5) —
  investigation-in-log, compliant pattern.
- `pilots/41/logs/p0-run1.log` runner finding: `errors=0` while rc=1 — the
  verdict carried by rc; same filter blind-spot class as A4-run11 (fixed in the
  al3d runner; the probe runners predate it). Standing note for R1's sweep
  hygiene pass.

## 2026-11-19 — K-ASSEMBLY INPUTS RELAY (orchestrator → H; R2 ✅ R7 ✅, only R1 gates K)

K still fires ONLY on the orchestrator's signal (expected on R1's landed report:
staging fixes + subset re-fire + runbook Steps 9–12; the re-fire log will persist
as `feasibility/probe/logs/axcheck-iter4-close-run2-subset.log`). Concrete K-pull
list + rulings now on record:

- **R2 handoff (agent-03, shas VERIFIED by H at relay time):**
  `research/qa/iter4-closeout-gates.md` sha256(16) `94c9e14a88fe845a` — appended
  §CLOSE-ACT GATE RUN + the FILLED §G8 table + §K-STAMPS (incl. **item 0 = the
  SPLICE literal "SELECTED" one-line stamp, OWED IN K** — after it G7(a) is EMPTY,
  G7(b) 31/31 dispositioned → G7 PASS at K) — and
  `research/feasibility/probe/logs/stepA-incremental-iter4.log` sha256(16)
  `2ec00eeb3d114f8d` (R2 re-run entry; G1 certificate 52 exact, 0 unexplained,
  `.lean` scope identical dd6686f→e3d984b). G8 highlights: G2(ii) PASS once the
  5-stage subset re-fire lands 5/5; **G6 records DECISION-1 RULED 2026-11-19
  (spend-only-if-executed; contest FB-2 vs FB-4 vs unspent = iter-5)**; G5
  authoritative = a9-g5-dryrun 14/14; G4 self-cite :275 = pre-ruled whitelist.
- **G3 finalization rides K's INDEX commit (H, inside K):** (A1) add the missing
  INDEX row for `research/pilots/32/run_pilot.py` (sibling `.sh` already in-row,
  INDEX:268); (B1) fix the stale `runner-fixes-wave2.patch` row (INDEX:254 —
  "applies post-wave" never happened; the TASKSET supersession is recorded at
  :291).
- **R7 handoff:** the D.4 article-75/78 sha-stamp edits are READY-TO-APPLY — **6
  verbatim blocks in R7's report (arrives with the K signal); apply by TEXT-MATCH,
  not line numbers (article 78's line cites drifted +4)**. The
  `research/qa/iter4-review/a9-iter5-article-watchlist.md` (agent-10, sha256(16)
  `2408da6e667ec6ca` VERIFIED) pulls into the **iter-5 opening commit** (H
  default; orchestrator allowed K-or-opening).
- **ORCHESTRATOR RULING (README date):** `articles/README.md` counts line KEEPS
  "ratified 2026-11-18" as-is — that ratification factually happened 11-18; K's
  close block carries the dated-correction note ([DATE-CLOSED] = K's actual date
  per the W1 ruling); **no README date amendment** (K-PREP 2 patch set unaffected
  — it never touched README).
- **R4 infra micro-fix APPLIED in this batch (H):** `feasibility/probe/lean_probe.py`
  error matcher widened — now catches the parenthesized Lean forms `error(...)`
  alongside `error:` (the 41-P0 run-1 `errors=0 at rc=1` blind spot; same class
  as the al3d `_LEAN_ERROR_RE` fix, mirrored in probe-runner form). py_compile
  rc=0; matcher regression-checked 3/3 error-form lines (old form caught 1/3).

**K file list (assembled; = runbook K-list items 11–16 + amendments 17–21, minus
W1-pre-landed, PLUS the relay additions):** gates file (R2 copy) · stepA log (R2
copy) · REPORT-INPUTS §3 (H-shepherded fill) · REPORT.md §I4 + KPI · INDEX.md (G3
fresh both-directions + (A1)/(B1)) · STATUS.md closed block (pre-draft above, on
signal) · tracker + brief + h-wave3-log + h-wave4-log · articles 75/78 (D.4 stamps
by text-match) · the five instrument stamps (rows 17–21) · **SPLICE SELECTED
one-line stamp (§K-STAMPS item 0)** · the two [DATE-CLOSED] patches (K-PREP 2) ·
Batch-S stragglers (R1's subset re-fire log rescue + Steps 9–12 evidence +
VERIFICATION-LEDGER §10 + Step D).

## 2026-11-19 — item 3b: K DRY-RUNS (H; scratch clone at e3d984b, removed after; main untouched)

Scratch-clone basis validated first: all 9 K-target files byte-identical
e3d984b ↔ current master (articles 75/78, SPLICE, RESEARCH.md, the five stamp
targets) — the dry-run results transfer to the K-time tree for everything except
R1's still-pending residue files.

**(1) D.4 anchors — 6/6 UNIQUE-OK against e3d984b article bytes** (the A9
checklist §D.4 pre-written blocks, bytes-unchanged branch): 75:382–383 sha-preamble
/ 75:551 box-11 / 75:554–556 PENDING-CLOSE tail / 78:199–201 file cell /
78:309 box-11 / 78:312–313 tail — each matches EXACTLY ONCE. **The +4 line drift
on article 78 is line-number-only; text-match is immune — no anchor ambiguity.**
R7's arriving blocks carry resolved `<close-date>` + sweep-confirmed shas; the
expected values are on record (Pa `d61eb0485a6ff672`, Pb `da05c60ceb78755b`,
zeta23e-P0 `986f1ce879786f33`, 78-P0 `d94d115e3d8d08d7`); any anchor count ≠ 1 at
K time ⇒ STOP, route to R7, never hand-merge.

**(2) [DATE-CLOSED] patches — both APPLY-CLEAN** (old-count=1 each; placeholder
substitution + re-read verified in the clone). Execute at K with [K-DATE] = the
K commit's calendar date.

**(3) §K-STAMPS items 0–5 — all 6 targets clean for the one-line insert:** every
target has title=line 1, blank=line 2, stamp keyword ABSENT from the top 6 lines
(matches the three W1 SUPERSEDED stamps' placement at :2). **Date dependency
flagged:** R2's stamp texts hard-code 2026-11-19 (items 1–5) and 2026-11-18
(item 0 — the W1/L2 record fact, stays) per the §K-STAMPS preamble "dates = K's
fire date"; if K fires on a later date, substitute the fire date in items 1–5
before inserting.

**(4) README (verify-only, NOT a K edit):** the counts line landed at W1
(`articles/README.md:3` "FINAL, orchestrator-ratified 2026-11-18: 6
discovery-grade" — date KEEPS 11-18 per the orchestrator ruling); the D.3 row-78
draft-marker drop also already executed (row :24 tail clean).

### K EXECUTION SCRIPT (H; mechanical playback; fires ONLY on the orchestrator's explicit K signal)

- **K0.** Pre-checks: R1 landed report in hand (staging fixes + subset re-fire 5/5
  + Steps 9–12); Batch-S evidence commits done; `git status --porcelain` CLEAN;
  record K-BASE sha; concurrency probe.
- **K1.** Pull R2's pair from agent-03 (hash → copy → cmp): gates file
  (`94c9e14a88fe845a`) + stepA log (`2ec00eeb3d114f8d`) — re-verify shas; if
  moved, the K signal carries the updated shas.
- **K2.** Pull R1's close-residue files per its report (expected:
  `make_axcheck.py` staging fixes — dependency-ordered emission + stem-collision
  fix; `axcheck-iter4-close-run2-subset.log` (5/5); Step-B(ii) custody logs;
  `VERIFICATION-LEDGER.md` §10 + Step D; any r3-tables final fold — A1-funnel
  copy from agent-02).
- **K3.** Insert the six one-line stamps under each target's title (§K-STAMPS
  items 0–5 verbatim; date rule above; dry-run placement verified).
- **K4.** Apply the two [DATE-CLOSED] patches (K-PREP 2) with [K-DATE] = today.
- **K5.** Apply R7's six D.4 blocks BY TEXT-MATCH into articles 75/78
  (`<close-date>` → K-DATE); anchor-count check before each replace (expect 1).
- **K6.** Append the STATUS.md Iteration-4 CLOSED block (K-PREP 1 pre-draft;
  resolve [K-DATE], [R1-SUBSET-REFIRE-RESULTS] from R1's report; no
  self-referential sha — "this commit").
- **K7.** REPORT-INPUTS §3 fill (H-shepherded): shipped set, N=1 UNSPENT,
  DECISION-1 ruled 2026-11-19 line.
- **K8.** REPORT.md §I4 final currency + the G6 KPI line.
- **K9.** INDEX.md: G3 both-directions fresh (`comm -3` per §G3) + close (A1)
  `pilots/32/run_pilot.py` row + (B1) `runner-fixes-wave2.patch` stale-row fix.
- **K10.** Verify-only: README counts line + D.3 (both W1-landed; no edits).
- **K11.** Tracker + brief + h-wave3-log + h-wave4-log: close-out refresh
  (iteration CLOSED at K; lane rows → wrapped-at-close).
- **K12.** Hardened gate: `git status --porcelain`; stage EXACTLY the K file
  list; `git diff --cached --stat`; foreign-staged check must be EMPTY.
- **K13.** Commit `Iter4 close: CLOSE-COMPLETION K — <summary>`; record K sha +
  date (= [DATE-CLOSED] everywhere).
- **K14.** Post-K: tree CLEAN; G4 re-grep on the committed tree; G7(a) re-grep
  (grep -L SUPERSEDED\|SELECTED over the four staging files = EMPTY);
  h-wave4-log K-entry; standby for the iteration-5 opening commit (checklist
  above).

**OPEN lane items (recorded per orchestrator; owners hold disposition, no H
action):** (i) R5's η-pin-probe run-1 FAIL-mechanical (one `lean.dependsOnNoncomputable`
at :108 `dilateTo`; fix applied, run 2 owed) — R5 owns; (ii) the OVER-cpu 5.70
sample on the same run (soft-limit burst @t=120 s) — investigation line owed in
R5's reported record per AGENTS §Modal 3. Orchestrator chases both at R5's report.
