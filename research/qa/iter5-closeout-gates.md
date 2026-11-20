# ITER-5 CLOSE-OUT GATES — pre-staged command table (lane R2, 2026-11-19; PREP ONLY)

Protocol source: `research/RESEARCH.md` §Close-out protocol + the **executed iteration-4
precedent** `qa/iter4-closeout-gates.md` (8/8 PASS at K `b2f2c18`, closed 2026-11-19 —
this file is its direct lineage, same rules): (1) every grep scoped to the LIVE section,
never the whole file; (2) **final run of every gate on the exact closing tree**, results
in the §G8 table committed WITH the close block — `OVERRIDDEN — <reason> — <owner>` or
fixed-and-rerun, never "passed by inspection"; (3) INDEX reconciliation both directions;
(4) date discipline (no future / split-mind dates); (5) staging-supersession stamps.
**Execute only on the orchestrator's close signal.** Run from repo root
`/home/doz/zcode-workdir/cross-math-fronttier`. Sweep-plan companion:
`feasibility/probe/FINAL-SWEEP-PLAN-ITER5.md` (§0 inventory + §5 names this gates
family; G1/G2 below restate its gate forms).

## Summary — READY / BLOCKED-ON tally (at prep, 2026-11-19, main @ `22d688b`)

| gate | verdict | blocked-on |
|---|---|---|
| G1 sorry-token (Step-A certificate) | READY (machinery; 52+0 re-baselined at ENTRY 1) | in-flight landings appending declared tokens only (ENTRY ledger live) |
| G2 axcheck full-coverage (two-part Step B) | READY-partial — rows ACTIVE: 77_T1 (donor-pin), 77_T2, 41_Core, 74_P2, AL3D_A2 (guard-tracking); deferred: 75_N2_P3-at-complete, L3-final, M2-b-fire, eta-confirm, 41H-T2 | the five R1 fold-once events (`22d688b` tracker: EVENT-STANDBY) + any new GREEN landings |
| G3 INDEX reconciliation | BLOCKED-ON the exact closing tree (H owns the INDEX commit; input = fresh drift list) | close |
| G4 date discipline | READY (runs at close-commit time by construction) | — |
| G5 template compliance (per shipped article) | READY for article-41 (`cb87a67` — §9 box-11 SATISFIED in-commit); **watchlist live** (`a9-iter5-article-watchlist.md`) | any later ships this cycle (41H second-discovery file; FB-contest outcomes) |
| G6 two-strike ratio | READY-frame (basis recorded below) | the close-time shipped set + any quota ruling |
| G7 dangling annotations + staging stamps | READY-PREP (census scope defined below; NO ITERATION5-* staging family exists this cycle) | close-time disposition rulings |
| G8 gate-run persistence table | skeleton below (empty by design) | fills as G1–G7 execute |

## G1 — sorry-token gate (Step-A certificate)

Command: the classifier VERBATIM (`qa/iter4-closeout-gates.md` §G1 :33–56 — identical
script, C2-lineage; scope `research/pilots/**/*.lean` +
`research/feasibility/probe/**/*.lean`).

PASS = **52 exact + only lane-declared additions recorded in
`feasibility/probe/logs/stepA-incremental-iter5.log`** (R1's ENTRY ledger, lineage
`stepA-incremental-c2 → -iter4 → -iter5`; ENTRY 1 = the post-opening re-baseline at
`e309edd`: 52 over 110 files, composition identical to the K-closing certificate — 43
C2 carry-forward [9 main-run + 23 G-series + 4×71/P0 + 7×73/P0] + 3 al3d/P0
:106/:144/:149 + 3 lp/P0 :44/:55/:97 + 2 ProbeG9 :51/:67 + 1 ProbeG10 :96). ENTRIES
2+ carry the day-1/landing deltas (M-arc 6-prose-only, P0/eta-pin/liu/AL3D zero-delta
classes recorded per file). Any other hit = VIOLATION-UNEXPLAINED → route to the owning
lane before Step B. **M-ladder note**: AL3D A2's sorryAx-parked M2-b decls are
run-status facts, NOT classifier tokens (the ENTRY-6 precedent) — the G1 criterion is
token-count-bound; the M2-b honesty lives in the ledger/G2 rows.

## G2 — axcheck full-coverage gate (two-part Step B)

Part (i) — the TARGETS batch:
```bash
research/feasibility/probe/run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-iter5.log
# rescue with provenance header to feasibility/probe/logs/axcheck-iter5-close-run1.log
```
Basis at prep: make_axcheck **63 rows at `1d0927df`** (R1's unit-8 fold; grows with each
landing — **the count at close governs**; append-only after the frozen C2/Iter-4 blocks).
Class map pre-staged by R1 (FINAL-SWEEP-PLAN-ITER5 §0 + the row comments):
**donor-pin class** — `AxPilot77_T1` (tauceti pin `d92acc5c`/manifest `1b1ccf4b`;
plain-batch FAIL BY DESIGN; verdict of record = `logs/t1t2-run11.log` or a sweep-time
re-fire in the 77 runner); **[WARM] rows** — 77_T2, 41_Core (inert-delta class: on-disk
`733b4a2d` = fired `921bc43c` + comment header; NO GIT_BYTES override), 74_P2
(`531a9eb7` sha-guard @ the batch-O final park `cc1c566` — refreshed 2026-11-20 by
lane R2 from main `a6ad33d`; lineage: run-11 `49b808f3` → ENTRY-12 park `4425be89`
→ final park `531a9eb70f9871ba` = the bytes on main; the R1 P2-c-close fold re-binds
the row guard); **guard-tracking** — AxPilotAL3D_A2 (guard MOVES to the last
verified committed bytes at each landing; `61af175a` @ batch-Q M2-closed `a175b1d`
— refreshed 2026-11-20 by lane R2 from main `a6ad33d`, superseding
`9706196c5f5ff593` @ batch-B; M3's landing moves it again); **GIT_BYTES
override-tracking** — AxPilot75_N2P1 (run-26 bytes `ce6719c8` @ `ff8b99e`; the override
tracks last-verified-committed, drops iff HEAD == verified at sweep); **single-anchor**
— `AxPilot10_MArc` (embeds L5 verbatim — the `AxPilot10_L5` precedent); **deferred
rows** — 75_N2_P3 at P3-complete (chain Pa→N2P0→N2P1→P3 + stage-scoped EXTRA_REWRITES),
plus the fold-once events. **NEVER Step-B stages** (probe-convention): eta-pin-probe,
Liu-B_new P0, 41/P0 (statement rung — row on landing-report confirmation only per §0),
zzv2/ff-ez family P0s.

Part (ii) — full-coverage custody (`axcheck_iter4.py gen` + the pilot-75 runner class;
privates direct-printed): owed for 74_P2 (28 priv), 77_T1 (40) + 77_T2 (4), AL3D_A2
(1), N2P1 (13) at their sweep-time shas; AxFC optional-confirm for 41_Core (31 publics
= the appended tail IS full coverage).

PASS per stage = `OK; axiom-lines=N, sorryAx-lines=0`, records ⊆
`[propext, Classical.choice, Quot.sound]` (zero-axiom decider subclass ⊆ class).

## G3 — INDEX reconciliation gate

```bash
comm -3 <(find research -type f -name '*.md' -o -name '*.lean' -o -name '*.py' -o -name '*.sh' | grep -v -e '/logs' -e '__pycache__' -e decl-index | sort) <(grep -oE '`research/[^`]+`' research/INDEX.md | tr -d '\`' | sort -u)
```
PASS = only directory-covered or explicitly grouped entries remain; every new row dated
+ source-cited. **Input: H's fresh pre-close drift list** on the EXACT closing tree
(iter-5's known growth classes: `pilots/{41,10,74,77,75,72-M1,al3d,zzv2-lam,liu-bnew}/`
new files + `qa/iter5-*` instruments + `novelty/round6-*` + `REPORT-INPUTS-ITER5.md`).
INDEX.md is H's file; this gate names it, H executes.

## G4 — date-discipline gate

```bash
grep -rn "$(date -d '+1 day' +%Y-%m-%d)" research/            # must be EMPTY
grep -rnE '[0-9]{4}-[0-9]{2}-[0-9]{2}/[0-9]{2}-[0-9]{2}' research/ --include='*.md'  # compounds resolve
```
Whitelist class carried from iter-4: gates-file self-cites (this file quoting its own
sweep patterns — the pre-ruled class; spell future literals out, never embed). Runs at
K-time by construction; dates from decision rows or `git show -s --format=%cs`, never
memory.

## G5 — template-compliance gate (per shipped article)

Checklist source `articles/TEMPLATE-iter4.md` §9 + the **corrected command** (iter-4
gates appendix, 2026-11-18): per article — (a) kind declaration; (b) a
novelty/nearest-miss section (any shipped layout); (c) a formal-record/verification
section; (d) `## Limitations*`; (e) the §9 box-run with evidence cites. **Shipped set at
prep: article-41** (`cb87a67`) — the splice carried the §4 battery-LANDING refresh incl.
the S3 honesty sentence, abstract 192 words, §6 committed-bytes stamps, §9 box-11
SATISFIED in-commit (the README same-commit rule discharged); its close-time re-check is
a drift-scan vs the splice state. **Later ships to cover if they land**: the 41H
second-discovery file (own-file bookkeeping, `efcabc4`), any FB-contest article. The
watchlist (`qa/iter4-review/a9-iter5-article-watchlist.md`) is the standing review
surface.

## G6 — two-strike ratio gate (flow-KPI binding reading)

Charter text: `RESEARCH.md` §Iteration 5 (two-strike FINAL; **fresh N=1 per DECISION-3**).
Basis at prep (mid-wave, this file's §3 in `REPORT-INPUTS-ITER5.md`): **1 shipped —
article-41, DISCOVERY quota-free; N=1 UNSPENT (DECISION-1: spend-only-if-executed;
contest FB-2 vs FB-4 vs unspent); flow 100% discovery-grade; stock 7/15 ≈ 47%.**
PASS at close = the §3 accounting FILLED with the close-time shipped set + quota ruling
recorded + KPI line in the cycle-close REPORT block.

## G7 — dangling-annotation + staging-supersession gate

(a) **Staging stamps.** NO `ITERATION5-{SCAN,SEED-DOSSIERS,CHARTER-DRAFT,CHARTER-SPLICE}`
family exists this cycle (pre-consolidated open per the charter — the A6 draft lineage
`a6-iter5-charter-draft.md` §8 was consumed by the approved splice `e309edd`). At close,
every iter-5 staging-class instrument that DID land gets its supersession/selected stamp
in the same commit as its consuming decision — candidates at prep: the A6 draft family
(stamped at open? verify), `a7-41-splice-package.md` (consumed by `cb87a67`),
`a9-iter5-article-watchlist.md` (consumed at close), this file (EXECUTED at close),
`REPORT-INPUTS-ITER5.md` (consumed by the REPORT fold). Census command at close:
```bash
grep -rLn "SUPERSEDED\|SELECTED\|APPLIED\|EXECUTED\|RECORDED\|CONSUMED" <the landed staging list>
```
(b) **Annotation census.** Every `[TRIAGE-DECISION]` / `[A5-triage-pending]` /
`[NOVELTY-CHECK-NEEDED]` / `[PENDING-*]`-family token in the iter-5-active files
(precharter/splice-package/watchlist/INPUTS/gates + the pilots' HELD-state markers, e.g.
P2-b's parked marker, the fold-once queue's pending states) either CLOSED-by-cycle or
explicitly retargeted with a stamp. Baseline count at close (re-run then):
```bash
grep -rn "TRIAGE-DECISION\|A5-triage-pending\|NOVELTY-CHECK-NEEDED" research/qa/iter4-review/a6-iter5-*.md research/novelty/round6-*.md 2>/dev/null | wc -l
```
plus the fold-once EVENT-STANDBY queue (`22d688b` tracker) — every entry either folded
or carried with an owner.

## G8 — gate-run persistence table (fills at close; committed WITH the close block)

| gate | command (short ref) | raw result | verdict | date | commit |
|---|---|---|---|---|---|
| G1 sorry-token | §G1 classifier verbatim | | | | |
| G2 axcheck (i) batch | `run_axcheck.sh` | | | | |
| G2 axcheck (ii) full-coverage | `axcheck_iter4.py gen`+custody per row | | | | |
| G3 INDEX | §G3 `comm -3` | | | | |
| G4 dates | §G4 greps | | | | |
| G5 template | §G5 per-article §9 run | | | | |
| G6 two-strike | §G6 scoped reads + §3 fill | | | | |
| G7 stamps + annotations | §G7 censuses | | | | |

OVERRIDDEN convention unchanged; no "passed by inspection"; completion-owed cells state
their exact condition and owner.

---

**PREP NOTES (R2, 2026-11-19):** (1) PREP ONLY — no gate executed herein (the iter-4
file's execution trigger rule); (2) the §I5 splice decision stays with the orchestrator
(mid-wave vs wave-close — **leaning wave-close** given the consolidation value of one
fold; the paste-ready delta sits in `REPORT-INPUTS-ITER5.md` §4 and stays current via
that file's §1/§2 statuses); (3) G2's five fold-once events gate the close's Step-B
completeness — the close act should hold until the EVENT-STANDBY queue drains or each
pending event gets a declared-drop ruling; (4) this file's G7(a) candidate list must be
re-derived at close from what actually landed (the ff-ez2-P1 label-drift lesson).

— pre-staged by lane R2 (gates-owner; the iter-4 file's lineage), 2026-11-19, main @
`22d688b`, worktree agent-03. H pulls at convenience; no commit (lanes never commit).
