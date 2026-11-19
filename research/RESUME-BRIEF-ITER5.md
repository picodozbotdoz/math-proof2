# RESUME BRIEF — Iteration 5 (launch window 2026-11-19, pre-K insurance; kept current by H)

## (a) Session context

- Iteration 5 opens 2026-11-19, post-close: Iteration-4 close-completion commit
  **K = `b2f2c18`, 2026-11-19** (fired on the orchestrator's signal; post-K
  re-greps G4/G7(a)/G7(b) all PASS — h-wave4-log). The splice + §STATUS block +
  day-1 records landed in the opening commit (this brief's placeholders filled
  there; K execution record: h-wave4-log.md).
- Charter = `RESEARCH.md` § Iteration 5: R3's typeset (`a6-iter5-charter-typeset.md`)
  spliced VERBATIM per the orchestrator's 2026-11-19 approval (machine diff
  `a6-iter5-research-splice.diff`, `git apply`); the §STATUS block appends after
  the Iteration-4 CLOSED block. DECISION-1 ruled 2026-11-19 (quota
  spend-only-if-executed); DECISION-2 = Option A; DECISION-5 resolved-by-battery.
  Iteration-4 final basis (carried): §10 N=32 (26/3/3); whole-tree 385/386; 18/18
  donor rows; quota N=1 UNSPENT; census 40/46 / 6 / 0.

## (b) Protocol (carried from Iteration 4, unchanged)

1. 10 lanes: H (sticky; sole committer; owns this brief + the tracker) + R1–R9.
   One writer per file; lanes never commit; queue-loaded re-tasks (2–3 items,
   bottom-up, report on drain); spawn one-by-one; concurrency probe at close
   (`ps -eo comm --no-headers | grep -cx zcode-cli`).
2. H commits exact-file batches — hardened gate EVERY commit: `git status
   --porcelain` + `git diff --cached --stat`; any foreign staged line ⇒ `git
   restore --staged`; NEVER `git add -A`. Prefixes `Iter5:` / `Iter4 close:`.
3. File funnels: `qa/iter4-review/r3-verification-tables.md` → R1 only;
   `qa/REPORT-INPUTS-ITER4.md` → H-shepherded surgical edits. INDEX row rides
   every new `research/` file, same commit; tracker + briefs refresh per batch.
4. Modal (MANDATORY, AGENTS.md § Modal): doz CLI `/home/doz/dozenv/bin/modal`
   PRIMARY for warm-layer apps (semraker); xyz (`sudo -n -u xyz
   /home/xyz/xyzenv/bin/modal`) brand-new + fallback (donniexyz888; foreign rows
   expected); SPEC cpu=2.0/mem=4096; telemetry every run; `LEAN_NUM_THREADS=2`;
   taskset not -j; overrun ⇒ investigate-not-upgrade.

## (c) Per-lane table (mirrors the tracker wave-4 map; pull per REPORT)

| Lane | Worktree | Assignment |
|---|---|---|
| H | (main) | commits; K + opening mechanics; tracker/briefs; telemetry watch |
| R1 | agent-02 | close residue (the K gate); verification-integrity successor |
| R2 | agent-03 | gates G1–G8 DONE; 72-M1 L3b–d; K-time G4/G8 interrupt duty |
| R3 | agent-07 | charter DELIVERED+approved; 10-D4 M-arc GREEN; 74-P2 |
| R4 | agent-08 | 41-P0 GREEN; core S–M |
| R5 | agent-04 | η-pin-probe (run 2 + OVER-cpu investigation owed) |
| R6 | agent-06 | 75-N2 P2 (run 22+; the iter-5 lead-1 resume note) |
| R7 | agent-10 | close-support DONE; Liu B_new statement-port |
| R8 | agent-05 | wave-2 queue; AL M0-rebuild |
| R9 | agent-09 | round-6 novelty batteries |

## (d) Restart instructions (fresh instance)

1. Read order: `AGENTS.md` → `research/RESEARCH.md` (§ Iteration 5 + the
   Iteration-4 close-out record) → this brief → `ORCHESTRATION-ITER4.md` →
   `qa/iter4-review/h-wave4-log.md` (K script, manifests, standing notes).
2. `git status --porcelain` on main — reconcile against the lane table BEFORE any
   commit. Worktrees persist at `/home/doz/zcode-workdir/worktrees/agent-01…10`
   (base e3d984b+, forwarded 2026-11-19; `.carry` manifests in h-wave4-log.md).
   **Lane numbering is NON-SEQUENTIAL vs worktrees (see table) — pull per REPORT,
   never by lane number**; never delete/clean lane files; siblings read-only.
3. Modal relaunch per (b)4. Substrate rule: data-level defs touching `Polynomial
   ℤ` / monoid-algebra mul get `noncomputable` UP-FRONT (the
   `dependsOnNoncomputable` class; h-wave4-log standing note). Dates: decision
   rows or `git show -s --format=%cs`, never memory.

## (e) K + opening-commit state (the immediate sequence)

1. **K** (orchestrator signal; only R1 gates it): execute the 14-step script in
   h-wave4-log.md — R2 pair + R1 residue pulls → 6 stamps (§K-STAMPS 0–5) → 2
   [DATE-CLOSED] patches → 6 D.4 text-match stamps → STATUS closed block →
   REPORT-INPUTS §3 → REPORT §I4+KPI → INDEX G3+(A1)/(B1) → README verify-only →
   tracker/brief/log → hardened gate → exact-file commit + post-K G4/G7(a)
   re-greps; [DATE-CLOSED] = K's actual date everywhere.
2. **Opening commit** (post-K, one commit): the 8-step checklist in
   h-wave4-log.md — pull R3's typeset + diff (hash→copy→cmp) → `git apply --check`
   (conflict ⇒ STOP, route to R3; never hand-merge) → apply → §STATUS block
   verbatim → pull reported day-1 records (η-pin, N2-P2 run 22+, 41 S–M, M-arc,
   AL-M0, watchlist sha `2408da6e667ec6ca`, round-6) → INDEX rows → tracker/brief
   refresh → `Iter5:` commit — day-1 records worktree-side until then, **no splice
   before K**.

## SESSION END — wave-4 external termination (2026-11-19 night; wrapped by the orchestrator directly, lanes dead)

**§(e) above is SUPERSEDED — K and the opening commit EXECUTED** (K = `b2f2c18`;
opening = `e309edd`). The CURRENT state and restart map are THIS section. Sections
(a)–(d) remain valid for read-order, protocol, and substrate rules.

### (f) State at termination

**Main CLEAN at `3b12eb4`** (batch S; 39 commits this session `3dc6de2` → `3b12eb4`;
tree verified clean at every boundary). **Two discoveries SHIPPED**: article-41
(splice `cb87a67`, kind DISCOVERY: the parallelogram-defect deformation — `mainCor`
+ antipodal stratification) and article-41H (splice-2 `cc71841`, kind NEGATIVE
discovery-grade quota-free: traciality + rank obstructions close the 3-strand TL
hypothesis FALSE; n≥4 hunt = the deferred next-wave seed). KPI: discovery share
8/16 = exactly 50% (the ≥half bar PASSES at equality); quota N=1 UNSPENT. Also
landed this wave: 77 both-GREEN (the 386/386-equivalent discharge), AL ladder
M0→M2 kernel-verified (both P2-d parked targets proved; M3 = the only remaining
rung), N2 P1/P2-a/P3-a/b/c + V2 substrate banked (`simple_proportion_d4` on-pin
triad), 74-P2 G2 GREEN + tightness 3-of-4 (P2-c elaboration-complete, audit
pending = close-checklist item 13), 72-L3 honest-partial-deepened (L3d superstructure
kernel-clean; 3-item next-wave fix list), η-port rung-1 GREEN exit + rungs 2/3
parked-with-fixes, iter-4 gates file COMPLETE 8/8, the iter-5 close instrument set
COMPLETE (close-block skeleton `883aad67` + REPORT-INPUTS-ITER5 §I5 delta +
`iter5-closeout-gates.md` — all PREP-ONLY, executing at close on orchestrator
signal).

### (g) IN FLIGHT at termination (verdicts UNKNOWN — runs died mid-fire; owners' worktree files are the pre-fire states)

1. **R6 / agent-06** — the SALVO (dispatched, no report received): (a) P2-b
   confirmation run 31 on parked `396d8710d9084388` (expected 17/17);
   (b) P2-c confirmation on parked `da4c8d3fed30daac` (expected 11/11);
   (c) P3-d on either GREEN (V2 substrate + d4 triad banked; `ZetaColumnOfV2Q`
   discharge; runner pair `run_n2p3v2.{sh,py}` staged). Worktree holds:
   `N2-P1.lean` (parked 396d8710), `N2-P2c.lean` (da4c8d3f), `N2-P3.lean`
   (f9bd28c5 landed on main), `N2-P3V2-smoke.lean` + runner pairs.
2. **R5 / agent-04** — the parked-pair confirmation (dispatched, no report):
   `eta-r2.lean` `38bb8463fe7af1bc` (expected strict-OK 4/4 → rung-2 exit) +
   `eta-r3.lean` `ed0c061218a2d739` (expected strict-OK 2/2); then the R5/R6
   rungs (Fourier/identity layer at κ=1; public-layer re-census first). Port
   ledger 8 of the amended 11–13 band. Precharter amendment landed on main
   (`ca2470c2`).
3. **R8 / agent-05** — **M3** (the AL ladder's final rung; dispatched, no
   report): entropy identification + the `SlabAreaLawColumnCuts3D` discharge
   from the binder; ≤3 runs. `A2.lean` in flight (`61af175a` = the M2-closed
   state, landed on main via batch Q; M3's post-state is worktree-side).
   The `set_option linter.all false` diagnostic LIFTS at M3's close.
4. All other lanes were in close-support/standby at termination (R1 DRAAINED-13
   post-fold; R2 close-support; R3 close-support with the close-time audit fire
   pre-staged at staged sha `6c6a251f03eb0797` — fire = `bash
   research/pilots/74/stage_and_fire_p2.sh 20`; R7/R9 post-splice standby).

### (h) NEXT-INSTANCE SEQUENCE (execute in order)

1. Read: `AGENTS.md` → `RESEARCH.md` §Iteration 5 → this SESSION END section →
   `ORCHESTRATION-ITER5.md` (the live tracker) → `qa/iter4-review/h-wave4-log.md`.
2. Verify main CLEAN at `3b12eb4` (anything foreign = reconcile vs the tracker
   before any commit). Survey worktrees (all 10 persist; agent-02 is at `a175b1d`
   base, the rest at `e3d984b`; dirty files = the in-flight states listed in (g)
   — pull per REPORT, never delete/clean).
3. Check `modal app list` (doz CLI) for orphan runs from the terminated fires;
   re-derive any verdicts from partial logs; otherwise RE-FIRE the three in-flight
   units fresh (sha-guarded starts make this safe): R6's salvo (a)/(b)/(c), R5's
   pair confirmation, R8's M3.
4. Re-spawn the 10 lanes one-by-one per the standing directive; re-task R6/R5/R8
   per (g); R7/R9 → 41H-post-splice standby + next-article watch; R2/R3 →
   close-support standby; R1 → verification-integrity (fold the re-fired verdicts).
5. WAVE-CLOSE (orchestrator signal, after the fold-once set drains): R3's audit
   fire (item 13) → the iter-5 gates G1–G8 execute → the §I5 splice → the
   close-block skeleton fill (12-item checklist, mechanical) → H's close commit
   + the gates-persistence table.
6. Next-wave seeds already recorded: the n≥4 TL hunt (R4's scope note), L3's
   3-item fix list (stop-note §CHARTER-ITEM-3), the η rung ladder, salvo re-parks.

### (i) TERMINATION RECORD + DIAGNOSIS (orchestrator, evidence-based)

External termination mid-wave, all lanes dead, no partial-commit mess (tree clean).
Two candidate mechanisms, both evidenced:

1. **earlyoom OOM-kill (primary candidate).** The host runs `earlyoom -r 60
   -m 10,5 --prefer ^(claude-desktop|zcode|lake|lean|chrome|node)` — an OOM
   protector that kills BELOW 10%/5% free memory and **preferentially targets
   exactly our process class**. H's concurrency probes measured 13–19 concurrent
   processes during the salvo (vs the 10-lane baseline) — real memory pressure.
   No kill records were readable without sudo (`journalctl -u earlyoom` empty to
   doz; dmesg blocked) — verify with `sudo journalctl -u earlyoom | tail -50` or
   `sudo dmesg | grep -i kill` for the definitive record.
2. **Orchestrator-session context exhaustion (alternative/complementary).** The
   session's token counter stood at ≈14.6M of 15M (~97%) at the last pre-termination
   turn. A harness-side context-limit stop would present exactly as observed (the
   fresh-instruction reload on restart).
3. Historical precedents in this project: max-duration exceeded (2026-11-17),
   network failure mid-session (2026-11-18). Definitive record: the ZCode session
   transcript store (`~/.zcode/cli/db/db.sqlite`) or the app's session log.

Mitigation options for the operator (user decision — recorded, not enacted):
raise earlyoom's `-m` thresholds or add zcode to `--avoid`; cap concurrent lanes
below the spike (e.g. 10 max, no probe-measured excursions); or accept the risk
(the wrap convention makes restarts cheap — this section is proof).

— wrapped by the orchestrator, 2026-11-19 night. All lane outputs preserved in
worktrees; main CLEAN; nothing lost.
