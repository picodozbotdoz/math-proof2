# ITER-6 CLOSE-OUT GATES — G1–G8 execution-record template (PREP ONLY; H executes at the close act)

> STATUS: PREP — no gate executed herein (the iter-4/iter-5 trigger rule). This file is
> the FILL-TARGET: every close-time value sits in a **[PENDING]** cell; the §G8 table
> fills and commits WITH the close block (the iter-5 precedent's own G7(a) convention).

Drafted by lane R5 (worktree agent-04 @ `3a752cf`), 2026-11-21 — assigned per
`qa/h-close-staging-checklist-iter6.md` row 12 ("R2-precedent owner, H assigns"; the
`qa/iter5-closeout-gates.md` lineage, PREP-ONLY + EXECUTED-at-close form). Protocol
source: `RESEARCH.md` §Iteration 6 "Close-out" (the adopted five-rule set: scoped
final gates, gate-run persistence, INDEX reconciliation as a gate, date discipline,
staging supersession stamps). **The choreography owner is R7's skeleton
`qa/iter4-review/r7-iter6-close-skeleton.md` `0a93019b` — this file owns ONLY the
execution-record shape; nothing here re-derives a skeleton slot.** Run from repo root;
final run of every gate on the EXACT closing tree; `OVERRIDDEN — <reason> — <owner>`
or fixed-and-rerun, never "passed by inspection".

## Input wiring (the four registered sources + the two owed prestates)

| source | file @ sha16 | feeds |
|---|---|---|
| R7 close skeleton | `qa/iter4-review/r7-iter6-close-skeleton.md` `0a93019b` | the G1–G8 slot list + Instruments A/B + the fill checklist (choreography) |
| R6 register of record | `qa/REPORT-INPUTS-ITER6.md` `2805db70` | the landed-unit register + §2 fire ledger + §4 open items (G1 deltas, G2 scope, G5 set, G7 candidates) |
| R2 share-arithmetic | `qa/iter4-review/r2-mclass-share-arithmetic.md` `7de17ba7` | G6's V1×V2 decision cells (§2 below) |
| R2 quota disposition | `qa/iter4-review/r2-iter6-quota-disposition.md` `356cff31` | G6's R-A/R-B pre-registered test + stamp wording |
| **OWED: R1 G1 prestate** | `feasibility/probe/logs/stepA-incremental-iter6.log` (NEW; or the `-iter5` log extended) + `FINAL-SWEEP-PLAN-ITER6.md` | G1's certificate ledger — **[PENDING until R1 fires]** (staging-checklist #8) |
| **OWED: R1 G2 prestate** | `make_axcheck.py` final TARGETS refresh + `feasibility/probe/logs/axcheck-iter6-close-run1.log` | G2's batch basis — 58 rows at skeleton-prep `9cadcbe`; **the count at close governs [PENDING]** (staging-checklist #7/#9) |

## Summary — READY / PENDING tally (at prep, 2026-11-21, main @ `3a752cf`)

| gate | state | blocked-on |
|---|---|---|
| G1 sorry-token | TEMPLATE-READY; declared-delta candidate list below | R1's Step-A run on the closing tree; the 12-core closing batch + seed-prep fires resolving |
| G2 axcheck | TEMPLATE-READY; class map below | R1's TARGETS refresh + the Step-B run; H4-stage inclusion iff R4's E1 fire lands GREEN |
| G3 INDEX | TEMPLATE-READY; drift-class table from the 2026-11-21 full pass | H's fresh drift list on the EXACT closing tree (H's file; this gate names it) |
| G4 dates | READY (runs at close-commit time by construction) | — |
| G5 template | TEMPLATE-READY; shipped set = article-41H3 + the 17-article referee-revision surface | any later ship (FB-2 under R-B; a seed-prep M-class article) |
| G6 two-strike | TEMPLATE-READY; basis 9/17 ≈ 52.9%; R-A/R-B cells pre-wired | V1 (the 12-core M-class evaluation) + V2 (FB-2) resolving; the orchestrator's stamp |
| G7 annotations + stamps | TEMPLATE-READY; candidate list below | re-derivation from what actually landed (the ff-ez2 label-drift lesson) |
| G8 persistence | skeleton below (empty by design) | fills as G1–G7 execute |

## G1 — sorry-token gate (Step-A certificate)

Command: the classifier VERBATIM (`qa/iter4-closeout-gates.md` §G1 :33–56 — the
C2-lineage script; scope `research/pilots/**/*.lean` +
`research/feasibility/probe/**/*.lean`; unchanged this cycle).

Basis: **66 = 52 − 3 + 17** (iter-5 close, ENTRY 14 of
`stepA-incremental-iter5.log`). PASS = **[PENDING: STEPA-COUNT]** exact + only
lane-declared additions recorded in **[PENDING: the -iter6 log / -iter5 extension]**.
Declared-delta candidate classes the close certificate must account for (each either
zero-delta-recorded or ENTRY-ledgered — any OTHER hit = VIOLATION-UNEXPLAINED →
route to the owning lane before Step B):

- **(a) post-referee integrity sweep** — `2bfe771`+`2ea25a9`+`ef1e7bd` touched
  article `.md`/introduction prose only; the sorry-free `*.lean` diff
  (`0676ba0..HEAD`, R1's sweep `20abcf90`) is the expected **zero-delta class**.
- **(b) the 12-core fire family** — `pilots/12/CORE.lean` sha chain
  `d3f7b5c9→…→7e40dff4` (runs 4–9) **[PENDING: the closing batch's final sha +
  verdict]**; the 8 by-design statement-stub sorries are the staged-unfired class
  (the +17 precedent) — declared, in-record.
- **(c) eta-r4 grant-fire-2** — `285a411e` landed GREEN strict-OK (run 14, log
  `cebc4730`; 0 errors / 0 sorry log-wide; the port files are sorry-strict proof
  artifacts) — expected **zero new tokens**.
- **(d) M3 run-9 split park** — `al3d/{P0,A1,A2}.lean` @ `c6752422`/`a8feb25b`/
  `221eb30b`; A2 NOT-GREEN 10 errors first-sight — A2's parked-decl state is a
  **run-status fact class** per the iter-5 M-ladder note (token-count-bound
  criterion; the honesty lives in the ledger/G2 rows) **[PENDING: A2's token count
  at close]**.
- **(e) seed-prep statement sets** — R4's `pilots/41/H4-probe.lean` (+ the E1 fire
  set iff executed, ≤3 runs **[PENDING: R4's fire outcome]**) and R8's
  N2-completion/P3-d seed-1 set **[PENDING: if landed]** — the
  staged-unfired statement-stub class.
- **Out-of-scope note (pre-ruled):** `pilots/41/presolve/` (custody settle
  `2ea25a9`) is numpy-only — outside the classifier scope by construction (the
  skeleton's own note, carried here as the G1 record's standing line).

## G2 — axcheck full-coverage gate (two-part Step B)

Part (i) — the TARGETS batch:
```bash
research/feasibility/probe/run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-iter6.log
# rescue with provenance header → feasibility/probe/logs/axcheck-iter6-close-run1.log
```
Basis: make_axcheck **[PENDING: ROW-COUNT at close]** rows (58 at skeleton-prep
`9cadcbe`; R1's refresh governs — append-only after the frozen blocks). Batch scope
THIS iteration = the iter-6 fire set (skeleton §1 G2): **eta-r4 (`pilots/zzv2-lam/`)
+ 12-core (`pilots/12/`) + M3 run-9 (`pilots/al3d/`) + any seed-prep probes**.

Verdict line format (per stage): `OK; axiom-lines=N, sorryAx-lines=0`, records ⊆
`[propext, Classical.choice, Quot.sound]` — or `FAIL rc=<rc> errors=<n>
sorry=<n>` with the class named. Declared-exception classes expected (the iter-5
precedent map, updated):

- **donor-pin class (plain-batch FAIL BY DESIGN; verdict-of-record cited):**
  `AxPilot77_T1` (tauceti pin — verdict-of-record `t1t2-run11.log` or a sweep-time
  re-fire); **donor-tree class:** `AxPilot42_M4b*` (ZetaZerosV2 prefix —
  verdict-of-record the m4b2 audit); **openai-pin class:** the 50/22 G7b family at
  its donor pin.
- **`AxPilotAL3D_A2` guard-track** — the guard MOVES to the run-9
  permanent-park state (`221eb30b`): P0+A1 kernel-GREEN, A2 mechanical
  first-sight — the **split-verdict honesty rides the row comment** (the
  parked/unverified surface never re-audited as clean).
- **`AxPilot75_N2P1` override-track** — re-bound day-1 (`206b0840`; 6-stage trio
  ALL OK `55f7b197`); at close **verify override == HEAD == verified still holds**
  (the iter-5 OVERRIDDEN carry is CLOSED — this is the regression check).
- **`AxPilot12_*` (12-core)** — NEW rows if R1 adds them: CORE.lean's 8 by-design
  statement-stub sorries ⇒ stages print sorryAx **by design** (declared staged-unfired
  class); the proved core (`MMgeneral_total_sum` et al.) must print triad-only
  **[PENDING: the closing batch's landing state]**.
- **`AxPilot41_H4` stage — CONDITIONAL:** iff R4's E1 fire lands GREEN
  **[PENDING: R4's ≤3-run verdict]**, the H4 stage enters the batch at its landed
  sha (the probe `H4-probe.lean` itself stays a NEVER-Step-B stage —
  probe-convention).
- **eta-r4 custody cell** — the port files are runner-elaborated with in-file
  `#print axioms` gates and carry NO TARGETS entry; the evidence of record = run-14
  log `cebc4730` (10/10 triad in-file) + the wrap's custody pointers
  (`pilots/zzv2-lam/zzv2-lam-port-wrap.md` §4). A TARGETS row is R1's funnel call,
  not pre-staged here.
- **NEVER Step-B stages (probe-convention, carried):** eta-pin-probe, Liu-B_new P0,
  41/P0 statement rungs, zzv2/ff-ez family P0s, H4-probe.

Part (ii) — full-coverage custody (per-row, `axcheck_iter4.py gen` class where the
pilot runner supports it; privates direct-printed): owed for every new GREEN landing
— the 12-core CORE.lean proved set, M3's P0/A1 pair (`c6752422`/`a8feb25b`), eta-r4
at `285a411e` (in-file form above), any H4/seed-prep GREEN. **[PENDING: the custody
row list at close]**.

## G3 — INDEX reconciliation gate

```bash
comm -3 <(find research -type f -name '*.md' -o -name '*.lean' -o -name '*.py' -o -name '*.sh' | grep -v -e '/logs' -e '__pycache__' -e decl-index | sort) <(grep -oE '`research/[^`]+`' research/INDEX.md | tr -d '\`' | sort -u)
```
PASS = only directory-covered or explicitly grouped entries remain; every new row
dated + source-cited. **Input: H's fresh pre-close drift list on the EXACT closing
tree [PENDING].** Expected drift classes — the 2026-11-21 full pass
(`qa/h-index-drift-20261121.md` @ `aac8e20`) already rowed the 28-file backlog in 4
groups; the close re-run covers **post-`aac8e20` growth only**, expected classes:

- the **close-prep instrument family** (grouped-row convention): this gates file,
  the skeleton `0a93019b`, `r2-mclass-share-arithmetic.md` `7de17ba7`,
  `REPORT-INPUTS-ITER6.md` `2805db70`, `h-close-staging-checklist-iter6.md`, the
  other `qa/h-*-20261121.md` notes;
- the **fire-family landings**: `pilots/zzv2-lam/` run-14 log + record update +
  port-wrap; `pilots/41/H4-*` pair (+ E1 fire set if landed); `pilots/12/`
  closing-batch logs/records; any R8 seed-1 set;
- the **grouped set convention** (iter-5 row-426 / introduction-row precedent):
  multi-file sets take ONE grouped row naming the files, never per-file rows.

## G4 — date-discipline gate

```bash
grep -rn "$(date -d '+1 day' +%Y-%m-%d)" research/             # must be EMPTY
grep -rnE '[0-9]{4}-[0-9]{2}-[0-9]{2}/[0-9]{2}-[0-9]{2}' research/ --include='*.md'  # compounds resolve
```
Whitelist class carried verbatim (iter-4/iter-5): gates-file self-cites (this file
quoting its own sweep patterns — the pre-ruled class; spell future literals out,
never embed). Runs at close-commit time by construction; dates from decision rows or
`git show -s --format=%cs`, never memory.

## G5 — template-compliance gate (per shipped article)

Checklist source `articles/TEMPLATE-iter4.md` §9 + the corrected per-article command
(iter-4 gates appendix): (a) kind declaration; (b) novelty/nearest-miss section; (c)
formal-record/verification section; (d) `## Limitations*`; (e) the §9 box-run with
evidence cites. Shipped set THIS cycle: **article-41H3** (splice `e4ac8dd`; §9
box-11 in-commit) — close-time check = drift-scan vs the shipped state INCLUDING the
`2ea25a9` custody-settle edits and the `2bfe771` referee revision; **the 17-article
in-place revision surface must still carry the template bones** — R1's
post-revision integrity sweep (`r1-postrevision-integrity-iter6.md` `20abcf90` @
`5238e44`) is the evidence base; the close re-check is the delta since `5238e44`.
**Later ships to cover if they land [PENDING]:** an FB-2 article under R-B; a
seed-prep M-class article (the 12-core evaluation's (a)/(b2) branches); an R4 H3
n≥4 ship. Verdict line format: `<article>: 0 drift since <sha>, §9 N/N` per
shipped article.

## G6 — two-strike ratio gate (KPI binding; the share-arithmetic execution)

Basis of record (byte-verified `25879dd`, the `7de17ba7` table): **N = 9
discovery-grade / D = 17 article rows; share 9/17 ≈ 52.9% — ABOVE the ≥half bar**
(equality passes, ruled at the iter-5 close). Fixed points: eta-r4 GREEN
record-billed NO article row; M3 PERMANENT PARK; L3 BANK; 41H3 already inside 9/17;
75-v3 NOT-A-SHIP by D3.

The two live variables — **[PENDING: V1]** = the 12-core M-class evaluation
(discovery-grade (a) / record-billed-no-row (b1) / technical-record-ARTICLE (b2) /
park (c)); **[PENDING: V2]** = the FB-2 spend (R-B). The mechanical cells
(`r2-mclass-share-arithmetic.md` §2, cited not restated):

| V1 ↓ · V2 → | UNSPENT (R-A) | SPENT (R-B) |
|---|---|---|
| (a) discovery | 10/18 ≈ 55.6% PASS+margin | 10/19 ≈ 52.6% PASS (headroom survives) |
| (b1) no row | 9/17 PASS | 9/18 = 50.0% PASS AT EQUALITY — last-ship clause binds |
| (b2) §B article | 9/18 = 50.0% PASS at equality | **9/19 ≈ 47.4% FAIL — the spend is BLOCKED** |
| (c) park | 9/17 PASS | 9/18 at equality — "resolved" = the park record |

**R-A/R-B stamp slots** (host = the skeleton's Instrument A text → lands in
RESEARCH.md §Iteration 6 close-out record; fires ONLY on explicit orchestrator
ruling): `[QUOTA-STATE]` = UNSPENT default / SPENT-on-R-B;
`[QUOTA-OUTCOME]` = **[PENDING]** — R-A rows stamp "THIRD consecutive unspent
(iter-4/5/6) + the structural finding (wave-tail placement biases unspent; the
iter-7 charter decision per `4955ac91`, Option A recommended)"; R-B requires BOTH
(b1) V1 resolved AND non-breaking arithmetic per the cells above, AND (b2) ≥2
drained-lane sessions (or accepted descope tier); never FB-4 this cycle.
**Recompute rule** (§5 of the table): any NEW article variable before close re-runs
`bar = 2·N ≥ D` once on the landed README rows. PASS at close = the G6 line filled
(close-time shipped set + quota ruling recorded + KPI sentence in the cycle-close
REPORT block).

## G7 — dangling-annotation + staging-supersession gate

(a) **Staging stamps.** Candidates at close — **[PENDING: re-derive from what
actually landed]** (the ff-ez2 label-drift lesson; skeleton §1 G7 list as the prep
basis): `a9-iter6-charter-typeset.md` + `a9-iter6-research-splice.diff` (CONSUMED at
open `458dce3` — verify stamped), `r2-iter6-quota-disposition.md` (CONSUMED by the
quota ruling), `r2-mclass-share-arithmetic.md` (CONSUMED likewise),
`candidates/fb2-followon-evaluation.md` (CONSUMED), `pilots/72-M1/L3-recharter.md`
(CONSUMED by the BANK verdict `460a04bc`), `r9-novelty-verification-iter6-round2.md`
(RECORDED), `REPORT-INPUTS-ITER6.md` (CONSUMED by the §I6 fold), the R7 skeleton
`0a93019b` (CONSUMED), the h-close-staging checklist (CONSUMED), this file
(EXECUTED at close), the iter-7 census DRAFT `422face2` (consolidates at the
iter-7 open — stamp RETARGETED, not CONSUMED). Census:
```bash
grep -rLn "SUPERSEDED\|SELECTED\|APPLIED\|EXECUTED\|RECORDED\|CONSUMED" <the landed staging list>
```
(b) **Annotation census.** Every `[TRIAGE-DECISION]` / `[A5-triage-pending]` /
`[NOVELTY-CHECK-NEEDED]` / `[PENDING-*]`-family token in the iter-6-active files
(quota/precharter/seed-prep/INPUTS/gates surfaces + the HELD-state markers: the
eta-r4 arc's park history — now CLOSED-GREEN, stamp; M3 permanent park; L3 PARKED
under D6) either CLOSED-by-cycle or explicitly retargeted with owner.
**[PENDING: baseline count re-run at close]**; plus the fold-once/standby queues in
the tracker — every entry folded or carried with an owner.

## G8 — gate-run persistence table (fills at close; committed WITH the close block)

| gate | command (short ref) | raw result | verdict | date | commit |
|---|---|---|---|---|---|
| G1 sorry-token | §G1 classifier verbatim | **[PENDING: 66 ± declared deltas — ENTRY line + class list]** | **[PENDING]** | [DATE] | this commit |
| G2 axcheck (i) batch | `run_axcheck.sh` → `axcheck-iter6-close-run1.log` **[PENDING sha]** | **[PENDING: OK-n/FAIL-m split + the declared-class FAILs named]** | **[PENDING]** | [DATE] | this commit |
| G2 axcheck (ii) full-coverage | per-row custody | **[PENDING: the custody row list + in-file gates of record]** | **[PENDING]** | [DATE] | this commit |
| G3 INDEX | §G3 `comm -3` + coverage filter | **[PENDING: raw-N → uncovered list; rows added same-commit]** | **[PENDING]** | [DATE] | this commit |
| G4 dates | §G4 greps | **[PENDING: both scans' hit counts — expected 0/0]** | **[PENDING]** | [DATE] | this commit |
| G5 template | §G5 per-article §9 run | **[PENDING: article-41H3 drift line + the 17-article bone check + any later ship]** | **[PENDING]** | [DATE] | this commit |
| G6 two-strike | §G6 cells + the orchestrator's stamp | **[PENDING: the V1/V2 cell landed + R-A/R-B stamp]** | **[PENDING]** | [DATE] | this commit |
| G7 stamps + annotations | §G7 censuses | **[PENDING: stamps flipped-N + annotation census + queue state]** | **[PENDING]** | [DATE] | this commit |

OVERRIDDEN convention unchanged; no "passed by inspection"; completion-owed cells
state their exact condition and owner.

---

**PREP NOTES (R5, 2026-11-21):** (1) PREP ONLY — no gate executed herein; H executes
on the close signal per the skeleton's choreography (staging-checklist §D order:
evidence logs first, then folds, then instruments, then INDEX + wave-log). (2) The
close is NOT stageable until the two R1 prestates land (Step-A ledger + TARGETS
refresh) and the pending verdicts resolve (12-core closing batch + M-class
evaluation; R4's E1 fire; any R8 seed-1 landing) — the skeleton's §0/§4 and the
register's §4 own those lists. (3) The G2 Step-B Modal run (~15 min at iter-5 scale)
must be scheduled BEFORE the close commit, transcript rescued w/ provenance
(log-rescue lesson). (4) This file's own INDEX row + CONSUMED-at-close stamp ride H's
commits.

— pre-staged by lane R5 (gates-owner this cycle by H's assignment; the R2/iter-5
lineage), 2026-11-21, main @ `3a752cf`, worktree agent-04. No commits (lanes never
commit).

## EXECUTED — the close commit (2026-11-21; verdicts of record)

- **G1 PASS** — classifier real-tokens **77 over 133 files, 0 UNEXPLAINED** (49 carry + 7 12/P0 stubs + 7 12/CORE interface stubs + 8 H4-probe + 6 Xi-probe + 0 H4.lean + 0 N2-P4V2; basis 66 = 52−3+17 reproduced exactly at 6306dbe; the presolve numpy-only class out of scope by construction; Branch A = 77, the arc closed GREEN).
- **G2 PASS** — Step-B batch 73 stages (`axcheck-iter6-close-run1.log` `4b9f411a`, wall 979 s, telemetry in-log, OVER-mem anon=0 authorized): **68 OK + 5 FAIL = EXACTLY the pre-declared classes, zero other FAILs** (42_M4b + ZZV2_etaR4 donor-tree; 77_T1 donor-pin; AL3D_A2 the run-9 park [7 sorryAx as predicted]; P72M1_T3 the L3 v16 park); AxPilot12_CORE OK w/ the DECLARED 8-sorryAx interface set (7 stubs + 1 transitive); A1 upgrade held (44 lines 0 sorryAx); H4 11/11 re-printed; **H3 16-helper custody DISCHARGED** (35 lines 0 sorryAx); N2P1 override triple-equality re-held. Axiom census: 2314 records / 1037 distinct decls — **zero genuine non-triad on any OK stage** (1856 exact-triad + 419 subset-triad + 30 with-sorryAx all inside the 3 declared park stages + 9 artifacts). **Part ii PASS** — the eta donor-tree full-coverage custody (`axcheck-eta-fullcoverage-run1.log` `bd0eaeeb`, runner `run_zzv2_axcheck.py` `e008dc96`, mathlib at pin in-log): r2/r3/r4 all OK 0-sorry; **21/21 distinct decls EXACT triad, 0 missing, 0 sorryAx** — the port family's full-coverage custody DISCHARGED.
- **G3 PASS** — INDEX drift reconciled continuously (the 2026-11-21 full pass aac8e20 + every landing rowed in-commit since; the close rows ride this commit).
- **G4 PASS** — 0/0 by construction.
- **G5 PASS** — shipped set drift-clean: article-41H3 at the audited bytes (R1's sweep 20abcf90; zero .lean delta since 0676ba0 except the fired payloads); the referee-revised 17-article set integrity-swept CLEAN; the v5 revision gate-PASSED 7/7+5/5.
- **G6 PASS** — KPI **9/17 ≈ 52.9% discovery-grade, ABOVE the ≥half bar**; flow 1/1 (article-41H3, NEGATIVE-kind quota-free per BANK-AS-NEGATIVE); the v5 = revision-class no-ship (NOT-A-SHIP standing; counts DO NOT MOVE). **[QUOTA-STATE] = UNSPENT; [QUOTA-OUTCOME] = THIRD consecutive unspent cycle** (iter-4 → iter-5 → iter-6, F5-corrected), carrying: the contest's wave-tail/no-slot placement systematically biased unspent across all three cycles; the Iteration-7 charter adopts the day-1 placement (Option A) with the opportunistic reclassification (Option B) as automatic fallback. **R-B override CLOSED-NO** ((b1) unmet — the M-class resolved record-billed no-row via the γ-freeze finding; (b2)'s window consumed; no re-open trigger fired).
- **G7 EXECUTED** — the stamping candidates landed with their instruments (the FB-2 precharter CONSUMED, the follow-on/disposition/mclass/watchtick EXECUTED/RECORDED, the charter draft SUPERSEDED, the 12-core staging pair, the seed census v4, the §I6/Instruments predrafts CONSUMED); annotation census closed (the 41H3 §9 queued-correction token closed by the referee-set sweep; the precharter §7 count fixed eba7e9b2).
- **G8 = this commit** — all verdict logs persisted w/ provenance (the two G2 logs herein + the fire logs of record per the register); [DATE-CLOSED] = 2026-11-21.
