# A2 — ITERATION-4 CLOSE-ACT RUNBOOK (ordered execution plan; PREP ONLY)
> EXECUTED 2026-11-19 — the 20-step close act executed: Phase-1 pre-landed at W1 `8c1c544` per the orchestrator's superseding ruling (2026-11-18); K = the close-completion commit (this commit); gates G1–G8 verdicts in `qa/iter4-closeout-gates.md` §CLOSE-ACT GATE RUN.

Lane A2 (bench/close-out), 2026-11-18. **Phase-1 steps REHEARSED 2026-11-18** against
main @ `c67d64e` — staging copies + the mechanical apply script live at
`research/qa/iter4-review/rehearsal/` (worktree scratch, never commit); the pre-flight
defect list is `research/qa/iter4-review/a2-close-rehearsal-report.md`. Companion to —
and sequencing layer over — three
instrument files that own the content: **A1's gates** `research/qa/iter4-closeout-gates.md`
(G1–G8 commands + G8 persistence table; read-only for A2), **A9's checklist**
`research/qa/iter4-review/a9-splice-readme-checklist.md` (9 items, 7 mandatory, all
H-owned), and **A2's own drafts** `research/qa/iter4-review/a2-close-summary-draft.md`
(SPLICE :71 close block + 3 stamp texts + 8-placeholder map; refreshed 2026-11-18, same
lineage) + `research/qa/iter4-review/a2-g7-token-inventory.md` (re-verified 2026-11-18 —
§8 below). Sweep commands: `research/feasibility/probe/FINAL-SWEEP-PLAN-ITER4.md` §7.
**Nothing herein executes before the orchestrator's close signal.** Per the wave-3
tracker (`research/ORCHESTRATION-ITER4.md`, 2026-11-18): *H prepares and dry-runs,
orchestrator fires.* Run everything from repo root
`/home/doz/zcode-workdir/cross-math-fronttier`.

## 0. Ownership map (every step names one)

| actor | owns in this runbook |
|---|---|
| orchestrator | fires/holds the close signal; [DATE-CLOSED], quota ruling (G6), honest-stop rulings, abort/resume calls |
| H | all commits (exact-file, never `git add -A`); SPLICE/stamp edits; README + article sha edits (A9 items); INDEX; STATUS close block; tracker/brief/log refresh; dry-runs |
| A1 | gates content + final §10 folds pre-close; G8 table fill; Step-B staging classifications |
| A9 | checklist item content on request (rows/wordings); the C-clearance watch |
| A2 (this lane) | runbook upkeep; G7 inventory delta (§8); close-support standby |

Hard rules carried: lanes never commit; one writer per file; no local lake/lean — every
Lean check via Modal per AGENTS.md (2 cpu / 4 GB, telemetry, `LEAN_NUM_THREADS=2`,
taskset-not-`-j`, doz-CLI primary for warm-layer apps, xyz fallback/new-apps); siblings
read-only; dates from decision-log rows or `git show -s --format=%cs <sha>`, never memory.

## 1. Preconditions (all must hold before Phase 1; owner named per check)

P0. **Close signal received** (orchestrator). Without it this file is a dry-run script only.
P1. **Five in-flight units landed** (report + worktree outputs pulled by H; honest-stop
    counts as landed, unreported does NOT):

| # | unit | owner (worktree) | landing artifacts (pull source) |
|---|---|---|---|
| 1 | FF-EZ2-P2 descope-closure (guarded squarefree-iff + optional proportion, ≤3 runs) | A3 (`worktrees/agent-04`) | `research/pilots/ff-ez2/` P2 file + record + `logs/p2-run*.log` |
| 2 | AL-P2-c completion (path a) → P2-d → P2-e (fresh ≤4) | A4 (`worktrees/agent-05`) | `research/pilots/al3d/` `A2.lean` final or `A3.lean` + `A2-gaps.md` §4 closure + logs |
| 3 | 75-N2 P1 packaging closure (v8, one run) → M2 → M3 | A5 (`worktrees/agent-06`) | `research/pilots/75/` N2-P1 final + M2/M3 files + records + logs |
| 4 | 77 dossier fold + T1-completion (≤4) + T2 (≤4) — ONE unit | A7 (`worktrees/agent-08`) | `research/pilots/77/` T1 final + T2 + records + logs; `candidates/77-*` fold |
| 5 | 74-P1 completion (verify-fire: pre-run sha guard, NO local lean, ≤5) | A8 (`worktrees/agent-09`) | `research/pilots/74/P1.lean` amended-final + record + logs; dossier-74 amendment |

P2. **A1 pre-close folds current**: `qa/iter4-review/r3-verification-tables.md` §10 has a
    row for every landed pilot incl. the five units (main carries §10.1–10.22 at this
    runbook's drafting; the five folds append §10.23+). File is A1-ONLY (funnel ruling).
P3. **Step-A certificate re-baseline current**: `feasibility/probe/logs/stepA-incremental-iter4.log`
    entries cover every file that landed WITH tokens (entries 1–3 exist: 17/0 baseline,
    49→52 re-baseline, al3d drift note). Five-unit landings append entries if needed (A1).
P4. **G4 meta-hit dispositioned**: `qa/iter4-review/a8-midwave-audit.md:80` (the literal
    "2026-11-18" inside A8's own quoted grep) — reworded by owner or whitelisted by H in
    the final gate table; else G4 false-positives at close (owner A8/H; checkpoint finding).
P5. **Main tree CLEAN** at the post-pull HEAD; no unexplained foreign staging; the
    hardened pre-commit gate (brief §(b)5) active.
P6. **A9 item-C watch resolved**: 75-N2 surprise-landing check — if A5's M-arc landed a
    tier-1 supersession, A9's item 2 carries the added rows; else row 75 as v2 (A9/H).

## 2. Phase 1 — assemble the close-edit set (H; all edits ON DISK, NOTHING COMMITTED)

Step 1 (H). **SPLICE :14 header fill** — `research/feasibility/ITERATION4-CHARTER-SPLICE.md:14`:
`[DATE]` ← `git show -s --format=%cs 808c809` (the L2 splice; expect 2026-11-16 — quote
RESEARCH.md:49, never memory); `[SUBTITLE: …]` ← **the typeset title verbatim from
`research/RESEARCH.md:49`** ("raising the discovery bar: complete the genuine core, bill
engineering as engineering"). NOTE (drift finding, 2026-11-18): the draft's default
"keep the proposal subtitle" is MOOT — the orchestrator already retitled at L2; the fill
is mechanical quotation. Orchestrator confirms at fire time.

Step 2 (H). **SPLICE :71 close block** — insert the drafted block (a2-close-summary-draft
§A2, refreshed 2026-11-18) after `ITERATION4-CHARTER-SPLICE.md:57`, before the `---` at
:59, with the eight placeholders filled per the map in Step 3. Default for the
[TRIAGE-DECISION] tokens at `:5`/`:29`: NO inline strike — the close block IS the
resolution (draft §A3 default; fewer edits, same record).

Step 3 (H). **The 8-placeholder map** (each row: placeholder → source artifact → owner):

| # | placeholder | source artifact at close | owner |
|---|---|---|---|
| 1 | `[DATE-OPENED]` | `git show -s --format=%cs 808c809`; cross-quote `RESEARCH.md:49` | H, mechanical |
| 2 | `[DATE-CLOSED]` (close block + all 3 stamps) | the close-signal date (= commit-K day) | orchestrator |
| 3 | `[SUBTITLE-FINAL]` | `RESEARCH.md:49` verbatim (L2 already retitled — see Step 1 note) | H, mechanical (orchestrator confirm) |
| 4 | `[PENDING-TALLY]` / `[PENDING-N-TABLES]` / `[PENDING-VERDICT-COUNTS]` | `qa/iter4-review/r3-verification-tables.md` §10 at close (**§10.1–§10.28 post A1's §10.CENSUS landing; FOUR folds append — A4/A5/A7/A8**) — **computed by the scaffold** `python3 -I research/qa/iter4-review/tally_section10.py` (re-homed 2026-11-18 — commit with the close-act pull; fail-loud; re-run v2 reconciled with A1's basis exactly: N=28, 24/2/2, 205/205 over 7, 0 MULTI, 21 flags resolved). **Whole-tree citation source = A1's §10.CENSUS(e) roll-up formula** (`r3-verification-tables.md:1815–1820`): machine 205/205 + manual 69/72 = **274/277** + **18/18 donor rows quoted separately**; dry runs + delta slots v2 = the rehearsal-report addendum §B2/§C2. Verdict vocabulary per the D7 RULING (adopted 2026-11-18): the §10 PILOT vocabulary (GREEN-triad / honest-partial / NOT-GREEN-honest); PROVED-* stays in A9's roll-up / REPORT §I4 | A1 pulls; H fills from the scaffold output |
| 5 | `[PENDING-INFLIGHT-SET]` | `qa/REPORT-INPUTS-ITER4.md` §1/§2 OPEN rows at close (expected carries: 72-M1 L3b–d + interface, 22-T2a OPEN-CONDITIONAL, 74-T3 OPEN-GATED, 10-tranche D4–D6 (ruled iter-5), G10 SHELF, 11-M3 benched, debts f/h/l) + any five-unit honest-stops | H from ledger (H-shepherded file) |
| 6 | `[PENDING-75-N2/N3]` | ledger row 75-N2/N3 + §10.22→final state after A5's closure/M2/M3 verdicts | H from A5 report |
| 7 | `[PENDING-78-LOCATOR]` | **resolvable since 2026-11-17**: §10.13 (`r3-verification-tables.md` :904) + `pilots/78/P0.lean` (sha d94d115e3d8d08d7) + `pilots/78/logs/p0-run4.log` + `articles/78-truffet-substitution-refutation.md` + `articles/README.md:23` | H, mechanical |
| 8 | `[PENDING-N2-D]` | the N2-d endpoint sentence: A5's final M-state + ledger row 75-N2/N3 + article-75's only N2 anchor = the :551 box-11 row (the §8-at-:510 "Prior work" locator in earlier drafts was WRONG — rehearsal 2026-11-18) + `articles/README.md` row-75 N2 tail | orchestrator from A5/A9 |

Step 4 (H). **Three supersession stamps** — exact texts + anchors = draft §B table, all
three under `research/feasibility/`: `ITERATION4-SCAN.md:1`, `ITERATION4-SEED-DOSSIERS.md:1`,
`ITERATION4-CHARTER-DRAFT.md:1` (insert as a new line immediately below each title).
CHARTER-SPLICE itself is NOT stamped (it is the close instrument; kit sections below its
`---` stay as H's branch-mechanics record).

Step 5 (H). **RESEARCH.md §Iteration 4 close-out record — ORCHESTRATOR-RATIFIED
2026-11-18 (post-drafting): execute BOTH** (splice-file instrument + `RESEARCH.md`
live record; C2 precedent `RESEARCH.md:41–47`; no further decision needed). Append
the same close block (RESEARCH.md voice) at the end of `research/RESEARCH.md`
§Iteration 4 — the section is the file's last (:195 = close-out protocol item 5);
insert as `**Close-out record ([DATE-CLOSED]):** …` after :195. REHEARSED 2026-11-18:
anchor + append verified mechanically (`rehearsal/RESEARCH.md`; report §R5).

Step 6 (H). **A9 checklist items 1–5 staged** (`articles/README.md` edits — exact cells
per `a9-splice-readme-checklist.md` §A): item 1 row-10 D1–D3 wording; item 2 row-75
two-tier v2 wording; item 3 row-78 landed; item 4 header counts line → "**6
discovery-grade** (01, 30, 32, 42, 75, 78 …)" + re-date; item 5 conditional prose.
Items 6–7 (sha stamps) stay PENDING until Phase 2 produces sweep shas (Step 12).
Also stage: `TRIAGE.md:385` + `TRIAGE-C2-ROWS.md:244` pointer-row updates (G7 close-act
site 5: "slots per CHARTER-DRAFT (all … next-cycle)" → resolved-at-close pointers).

## 3. Phase 2 — the final sweep (FINAL-SWEEP-PLAN-ITER4 §6–§7; A1 executes, H witnesses)

Step 7 (A1). **Step A — sorry-token classifier, LOCAL (seconds).** Command = the §G1
classifier verbatim from `qa/iter4-closeout-gates.md:33–56` (do not retype; scope
`research/pilots/**/*.lean` + `research/feasibility/probe/**/*.lean`). PASS = every hit
enumerated in the certificate: **52** (43 C2 + 3 al3d/P0 [lines now :104/:142/:147 per
entry 3] + 3 lp/P0 + 2 ProbeG9 + 1 ProbeG10) **plus only** five-unit lane-declared
additions appended to `feasibility/probe/logs/stepA-incremental-iter4.log`. Any other
hit = VIOLATION-UNEXPLAINED → STOP (see §7). Append the sweep-time entry to the log.

Step 8 (A1+H). **Step B(i) — TARGETS batch** (warm Modal, doz CLI):
```
research/feasibility/probe/run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-iter4.log
# rescue with provenance header to each pilot's logs/axcheck-final-iter4.log
```
Prerequisite TARGETS appends (A1, before the run — `feasibility/probe/make_axcheck.py`
Iteration-4 block): `AxPilot73_Q4` (73/Q4.lean), `AxPilot10_L3` re-anchor (L3.lean grew
with D1–D3), plus rows for five-unit proof-class finals (AL-P2 final state — `AxPilotAL3D_A2`
re-stage or new `AxPilotAL3D_A3`; 77 T1/T2; 74 P1; ff-ez2 P2; 75 N2-final files) and
`78-P0` (A9 item-7 companion note). Probe-convention files NEVER get rows (ff-ez2 P0/P1
if statement-class, 74-P0, zzv2 P0, al3d P0, lp P0). PASS/stage = `OK; axiom-lines=N,
sorryAx-lines=0`, every record ⊆ `[propext, Classical.choice, Quot.sound]`.

Step 9 (A1). **Step B(ii) — full-coverage custody stages** for every Iteration-4
proof-class artifact (default 1, R3 upgrades):
```
python3 -I research/feasibility/probe/axcheck_iter4.py gen research/pilots/<dir>/<file>.lean /tmp/stage/Ax<Name>.lean
python3 -I research/feasibility/probe/axcheck_iter4.py scan <persisted log>
```
Already discharged early (re-run ONLY if sweep-time sha differs): 75_Pb
(`pilots/75/logs/axcheck-full-run1.log`, 89/89, sha da05c60ceb78755b), 72-M1 T1/T2/T3
(`pilots/72-M1/logs/axcheck-l3a-run1.log`). OWED new: five-unit finals, 73-Q4, 32-M1
(28 lemmas) + 32-M2 (2 helper lemmas), 10-L5/L3-grown, 78-P0. Donor-tree class (zzv2
P1 if re-staged): `feasibility/probe/run_m4b_donor_axcheck.sh` recipe. Logs persist
full-length (no middle-excerpting), sha256-at-sweep in every header.

Step 10 (A1). **Step C — VERIFICATION-LEDGER §10** (`feasibility/VERIFICATION-LEDGER.md`,
next §number per H's ledger): per-pilot rows `| pilot | final files | LoC/thms
(extractor, sha-dated) | axcheck verdict | sorry tokens | sign-off |`; sign-off OK iff
Step A 0 unexplained ∧ Step B OK ∧ logs persisted. **Step D — compliance sign-off**
appended once A–C clean (plan §4 text verbatim). If Steps A–C surface anything: STOP,
route to lane (§7) — do not sign.

Step 11 (H). **Batch S commits — sweep evidence** (exact-file, may be several small
commits as stages complete; INDEX row rides every new file, same commit): rescued
`axcheck-final-iter4.log`s, stepA sweep entry, `VERIFICATION-LEDGER.md` §10+D,
`make_axcheck.py` appends, A1's final §10 table rows if not yet committed. Nothing from
Phase 1's close-edit set is in Batch S.

## 4. Phase 3 — gates G1–G8 on the assembled closing tree (A1 content, H runs)

Execution order below is dependency-driven; every result goes into the §G8 table in
`qa/iter4-closeout-gates.md` (gate / command / raw result / verdict / date / commit).
"Closing tree" = post-Batch-S HEAD + the Phase-1 edits on disk (uncommitted). Failures:
fixed-and-rerun or `OVERRIDDEN — <reason> — <owner>`; "passed by inspection" is not a state.

Step 12 (H). **A9 items 6–7 — sweep sha stamps** (needs Step 9 shas): article 75 §6
preamble (:383) sha fields + LoC re-measure + :551/:554 flips; article 78 (:201, :312)
sha + :309 box-11 flip. Now G5 can see final articles.

Step 13 (A1). **G5 — template compliance** per shipped article:
```
for a in research/articles/*.md; do case "$a" in *TEMPLATE*) continue;; esac
  echo "== $a"; for s in '^## 1\. Front matter' '^## 4\. Novelty and nearest misses' '^## 6\. Formal record' '^## 7\. Limitations'; do
    grep -q "$s" "$a" && echo "  OK  $s" || echo "  MISSING $s"; done; done
# then TEMPLATE-iter4.md §9 boxes one by one with evidence cites → G8 rows
```
Step 14 (H+orchestrator). **G6 — two-strike ratio**: fill
`qa/REPORT-INPUTS-ITER4.md` §3 (H-shepherded) with the shipped set + the quota ruling
(expected: cap-N = 1 UNSPENT; 78 is NEGATIVE-kind discovery-grade, no quota); scoped
reads per gates §G6; KPI line into REPORT.md §I4 (Step 16 file).
Step 15 (H). **G7 — stamps + annotation family**: stamps landed in Step 4, so
```
grep -L "SUPERSEDED\|SELECTED" research/feasibility/ITERATION4-{SCAN,SEED-DOSSIERS,CHARTER-DRAFT,CHARTER-SPLICE}.md   # must be EMPTY
grep -rn "TRIAGE-DECISION\|A5-triage-pending\|NOVELTY-CHECK-NEEDED" research/feasibility/ITERATION4-*.md research/TRIAGE.md | wc -l   # = 30 lines, every one dispositioned
```
Disposition record = `a2-g7-token-inventory.md` + the §8 delta below (46 sites: 40 close
/ 6 retarget / 0 needs-ruling — corrected census) + the close block itself. The gate
grep's 30 in-scope lines are fully covered: 26 recorded sites + 4 delta sites
(SCAN:5, DRAFT:59, DRAFT:100, SPLICE:28).
Step 16 (H). **G3 — INDEX reconciliation, both directions**:
```
comm -3 <(find research -type f -name '*.md' -o -name '*.lean' -o -name '*.py' -o -name '*.sh' | grep -v -e '/logs' -e '__pycache__' -e decl-index | sort) <(grep -oE '`research/[^`]+`' research/INDEX.md | tr -d '\`' | sort -u)
```
Input: H's fresh pre-close drift list (the 2026-11-17 reconciliation is stale by
construction; `worktrees/agent-01`'s `index-drift-listing.md` is superseded — do not
use). Every new row dated + source-cited; stale-status rows rewritten in the same pass.
Step 17 (H). **G4 — date discipline, LAST before commit** (tree final):
```
grep -rn "$(date -d '+1 day' +%Y-%m-%d)" research/            # must be EMPTY (P4 disposition first)
grep -rnE '[0-9]{4}-[0-9]{2}-[0-9]{2}/[0-9]{2}-[0-9]{2}' research/ --include='*.md'  # compounds resolve to real spanning decisions
```
Step 18 (A1). **G1/G2 verdict rows finalized** into the §G8 table (G1 = Step 7 result;
G2 = Steps 8–9 results; both already executed — this is the persistence fill).

## 5. Phase 4 — THE close commit (H; ONE serialized commit "K", box-11 integrity)

Step 19 (orchestrator fires; H commits). **K carries exactly these files** (exact-file
staging; the hardened pre-commit gate; concurrency probe logged):

1. `research/feasibility/ITERATION4-CHARTER-SPLICE.md` (Steps 1–2)
2. `research/RESEARCH.md` (Step 5 close-out record; orchestrator-owned)
3. `research/feasibility/ITERATION4-SCAN.md` (stamp)
4. `research/feasibility/ITERATION4-SEED-DOSSIERS.md` (stamp)
5. `research/feasibility/ITERATION4-CHARTER-DRAFT.md` (stamp)
6. `research/TRIAGE.md` + 7. `research/TRIAGE-C2-ROWS.md` (pointer rows)
8. `research/articles/README.md` (A9 items 1–5)
9. `research/articles/75-abelian-assembly-zetaL-proportions.md` (item 6)
10. `research/articles/78-truffet-substitution-refutation.md` (item 7)
11. `research/qa/iter4-closeout-gates.md` (G8 table filled — A1 wrote, H commits)
12. `research/qa/REPORT-INPUTS-ITER4.md` (§3 fill, H-shepherded)
13. `research/REPORT.md` (§I4 final currency + KPI line)
14. `research/INDEX.md` (G3 output)
15. `research/STATUS.md` (Iteration-4 CLOSED block — orchestrator signal only)
16. `research/ORCHESTRATION-ITER4.md` + `research/RESUME-BRIEF-ITER4.md` +
    `research/qa/iter4-review/h-wave3-log.md` (tracker/brief/log refresh — rides every batch)

Commit message: `Iter4: CLOSE — iteration-4 cycle close (splice fill + stamps + G8 gates table + box-11)`.
AGENTS-ITER4-DRAFT E1–E9 stays OUT of K (user-gated apply — separate decision, separate commit if approved).

**K-LIST AMENDMENTS (proposed 2026-11-18 at the Phase-1 rehearsal, report-only —
`a2-close-rehearsal-report.md` §R6; H/orchestrator adopt-or-override at fire time):**
per close-out protocol rule 5 (staging supersession — "when a staged block is spliced
or decided, the staging file gets its superseded/selected stamp in the same commit"),
FIVE close-act staging instruments are missing from the K-list above:
17. `research/qa/iter4-review/a2-close-summary-draft.md` — APPLIED stamp (its Parts A+B land in K)
18. `research/qa/iter4-review/a9-splice-readme-checklist.md` — APPLIED stamp (A9 lineage)
19. `research/qa/iter4-review/a2-g7-token-inventory.md` — SUPERSEDED-BY-CLOSE-BLOCK stamp (its census is quoted in K)
20. `research/qa/iter4-review/a2-close-act-runbook.md` — EXECUTED stamp (this file)
21. `research/qa/iter4-review/a2-close-rehearsal-report.md` — RECORDED stamp (pre-flight defect list)
The `rehearsal/` staging directory itself stays worktree scratch (never commit — the
`wave2-commit-runbook.md` precedent, h-wave3-log 2026-11-18 disposition 1).

Step 20 (H). **Post-K checks**: `git status --porcelain` CLEAN; G4 re-grep on the
committed tree (future-date fix-forward if anything surfaced — small exact-file commit,
recorded in h-wave3-log; not a rollback); close-out state stamped into tracker + brief.

## 6. Rollback / abort criteria (what STOPs the close and returns to pilot mode)

| trigger | action | mode |
|---|---|---|
| Any P1 unit unreported/unfolded at fire time | close HOLDS; orchestrator re-tasks the unit or records declared-drop (a declared drop IS a valid landing per plan §6) | pilot mode for that unit only |
| G1 VIOLATION-UNEXPLAINED (real token outside certificate) | STOP Step B; route the file verbatim to its owning lane; fix lands + classifier re-run + stepA log re-baseline | pilot mode (lane-scoped) |
| G2 `sorryAx-lines>0` or non-triad axiom line in a PROOF artifact | that pilot is NOT done despite its report → route to lane; its ledger/article rows revert to OPEN; G5/G6 re-run after fix | pilot mode (lane-scoped) |
| Modal infra failure mid-sweep | artifact-cache retry ≤ 4 → seed-and-build; still failing ⇒ sweep holds, close holds; NO partial close commit, NO "close-lite" | hold |
| Resource overrun (>2 cpu / >4 GB telemetry) | investigate-not-upgrade (AGENTS.md §Modal 3); more resources ONLY on explicit per-run user approval; never auto | hold |
| G3 unresolvable INDEX rows / G4 future-date in frozen history | fix-forward on live files; frozen history gets a dated correction note, never an edit | hold, then proceed |
| Orchestrator rescinds the close signal mid-act | H unstages everything staged for K (`git restore --staged`; disk untouched); Phase-1 edits remain drafts; Batch-S evidence STANDS (it is true regardless); lanes re-task | pilot mode |
| Post-K date/typo defect | fix-forward exact-file commit + h-wave3-log note (the C2 2026-11-15-family precedent: correct, record, never rewrite) | closed (fix-forward) |

NEVER, at any point: force-push; revert landed commits; edit frozen C2-era history
(make_axcheck rows, ledger §9.F); commit sibling repos, `external-doc/`, worktree
scratch, or AGENT_INSTRUCTION files; run local lake/lean.

## 7. Step count (for the report)

20 numbered steps: P0–P6 preconditions (7 checks), Steps 1–6 (assembly), 7–11 (sweep),
12–18 (gates), 19–20 (commit + post-checks).

## 8. G7 token inventory RE-VERIFICATION (A2, 2026-11-18; main @ 66a8085)

Re-sweep of `a2-g7-token-inventory.md` (2026-11-17, landed `de56e68`) against the
current tree. Method: the five family greps re-run verbatim + per-site line checks at
66a8085 and at de56e68 (the inventory's own landing commit).

**Verdict on the recorded set: CONFIRMED.** All 34 recorded sites are still present,
no disposition flips; expected tallies 29 close / 5 retarget / 0 needs-ruling hold for
the recorded set. One anchor drift: the SCAN FF-EZ2-survivor site, recorded `:90`,
matches the inventory's 53c1548 basis and now sits at
`feasibility/ITERATION4-SCAN.md:105` (same token, same text). All other anchors exact
(SCAN :18–:23/:40; SEED-DOSSIERS :5/:53/:56/:110/:123/:179/:187/:232/:239; CHARTER-DRAFT
:6/:58/:83/:94/:97; SPLICE :5/:29/:71; TRIAGE.md:385; TRIAGE-C2-ROWS.md:244;
candidates/76 :98/:107; lp-layer-prework :208; lp-duality-bridge :68; zzv2-lambda-prework
:3/:141; 10/next-tranche-spec :3; 10-blueprint :187).

**Corrected census — 12 pre-existing sites the inventory missed** (all present at
de56e68 AND at 66a8085; file:line evidence):

| site | class | disposition |
|---|---|---|
| `feasibility/ITERATION4-SCAN.md:5` | TRIAGE-DECISION (convention header: "every in-flight Cycle-2 item marked …") | CLOSE — with the family (same class as SEED:5 counted for NOVELTY-CHECK) |
| `feasibility/ITERATION4-CHARTER-DRAFT.md:59` | TRIAGE-DECISION (workplan row 4: "rank + slot once Cycle-2 pilot outcomes settle") | CLOSE — outcomes settled (charter typeset + slots resolved) |
| `feasibility/ITERATION4-CHARTER-DRAFT.md:100` | TRIAGE-DECISION (pointer line "SEED-DOSSIERS §[TRIAGE-DECISION] verbatim") | CLOSE — cosmetic pointer, closes with the family |
| `feasibility/ITERATION4-CHARTER-SPLICE.md:28` | NOVELTY-CHECK-NEEDED (convention: "the marks are obligations") | CLOSE — with the family |
| `candidates/76-zero-temperature-schrodinger-duality.md:277` | NOVELTY-CHECK-NEEDED (inside the R7 "EXECUTED AND RESOLVED" record) | CLOSE — already resolved (R7 gate-sweep; same class as lp-prework:208) |
| `pilots/lp-layer-prework.md:3` | CHARTER-PENDING (header) | CLOSE — LP slot 1 FINAL-GREEN end-to-end |
| `pilots/al-3d-prework.md:3` | CHARTER-PENDING (header) | CLOSE — AL-P0/P1/P2 chartered + landed (P2-c/d/e remainder rides the AL-3D-2 ledger row, not this token) |
| `pilots/10/tranche-D1-preflight.md:5` | CHARTER-PENDING (quotes the tranche marker) | CLOSE — D1–D3 landed; D4+ rides the recorded 10-tranche RETARGET carrier |
| `pilots/10/tranche-D1-preflight.md:68` | CHARTER-PENDING ("the tranche is [CHARTER-PENDING] and benched week-1") | CLOSE — activation happened (D1-ONLY ruling, then D2/D3 GO); D4+ same carrier |
| `pilots/75/Pb-design.md:1` + `:3` | CHARTER-PENDING (title + marker) | CLOSE ×2 — 75-Pb FINAL-GREEN + article-75 v2 shipped |
| `pilots/72-M1/L3-spec.md:187` | CHARTER-PENDING (§8 header) | **RETARGET-ITER-5** — L3a landed; L3b–d + interface open at close (carried row) |

**Corrected totals: 46 sites = 40 CLOSE / 6 RETARGET / 0 NEEDS-RULING** (recorded 34 =
29/5/0 + delta 12 = 11 close / 1 retarget). Gate impact (G7(b)): the gate grep over the
four staging files + TRIAGE.md returns **30 lines**; in-scope coverage = 26 recorded +
4 delta (SCAN:5, DRAFT:59, DRAFT:100, SPLICE:28) — complete, 0 unaccounted. The 12-site
delta does not change the close act's shape (no new instruments, no ruling needed); it
changes only the census quoted in the close block: "token census closed 29/34 in-cycle,
5 retargeted, 0 unrulled" → "**40/46 in-cycle, 6 retargeted, 0 unrulled** (corrected
census, a2-close-act-runbook.md §8)". Zero new tokens arrived between de56e68 and
66a8085 (the wave-3 commits touched no staging file).

— end runbook (A2, 2026-11-18; PREP ONLY; nothing applied; H pulls from
`worktrees/agent-03/research/qa/iter4-review/`)
