# A2 — CLOSE-ACT PHASE-1 REHEARSAL REPORT (pre-flight defect list; 2026-11-18)
> RECORDED 2026-11-19 — the pre-flight defect list (D1–D6, 0 blockers, 3 waits-on-lane) stood as the rehearsal record (basis `c67d64e`, pre-Step-B-pre-stage caveat in h-wave3-log); consumed by the executed close act; closed at K (this commit).

Lane A2. Mechanical dry-run of runbook §2 Phase 1 (Steps 1–6) against **main @
`c67d64e`** (bases byte-verified before editing). Staging area + apply script:
`research/qa/iter4-review/rehearsal/` (worktree agent-03; **scratch — never commit**;
re-runnable: `python3 -I apply_rehearsal.py` after re-copying bases). Content
placeholders that depend on the five in-flight units stayed tokens; every locator and
source artifact was resolved, not assumed. RATIFICATION honored: the RESEARCH.md
close-out record executed as BOTH (splice instrument + live record).

**Verdict: 6 steps rehearsed — 4 PASS (2 with residuals), 2 PASS-with-defect; 6
defects found (D1–D6 below), 0 blockers, 3 waits-on-lane.** The close act is
mechanically sound on the current tree; every defect has a proposed fix.

## R1 — SPLICE :14 header fill (runbook Step 1) — PASS

- Anchor `ITERATION4-CHARTER-SPLICE.md:14` matched the draft's base string EXACTLY
  (asserted by the script; rehearsal line replaced).
- `[DATE-OPENED]` = **2026-11-16** — `git show -s --format=%cs 808c809` → 2026-11-16
  ("Iter4: LAUNCH — charter splice (R9 section-11) + batch C + STATUS opened block");
  cross-quoted `RESEARCH.md:49` "opened 2026-11-16". ✓
- `[SUBTITLE-FINAL]` = `RESEARCH.md:49` verbatim: **"raising the discovery bar:
  complete the genuine core, bill engineering as engineering"**. ✓ (D1 already
  recorded at the 2026-11-18 draft refresh: the keep-the-proposal default is moot.)

## R2 — SPLICE :71 close block (runbook Step 2) — PASS (1 defect fixed in-draft)

- Anchors: `:57` = the standing-clock-protocols line; `:59` = `---`; both exact. Block
  inserted between them (blockquote form); rehearsal `rehearsal/ITERATION4-CHARTER-SPLICE.md:59–87`.
- Tokens preserved (7): `[DATE-CLOSED]`, `[PENDING-TALLY]`, `[PENDING-N-TABLES]`,
  `[PENDING-VERDICT-COUNTS]`, `[PENDING-INFLIGHT-SET]`, `[PENDING-75-N2/N3]`,
  `[PENDING-N2-D]`.
- Fills: `[PENDING-78-LOCATOR]` → §10.13 (`r3-verification-tables.md:904`) +
  `pilots/78/P0.lean` sha256-16 `d94d115e3d8d08d7` (re-hashed at rehearsal — byte-
  identical to the run-4 record; sweep re-stamp governs) + `pilots/78/logs/p0-run4.log`
  + `articles/78-truffet-substitution-refutation.md` + README row 78. ✓
- **D2 (fixed in-draft):** the retarget parenthetical said "the 5 RETARGET items"
  while the corrected census says 6 — draft §A2 now reads "the RETARGET items" (+ the
  2026-11-18 corrected-census citation) and enumerates the 4th carrier (72-M1 L3-spec
  §8 header, `pilots/72-M1/L3-spec.md:187`, riding [PENDING-INFLIGHT-SET]).

## R3 — the 8-placeholder map (runbook Step 3) — 7/8 PASS, 1 locator defect

| # | source resolution at `c67d64e` | verdict |
|---|---|---|
| 1 | 808c809 → 2026-11-16 | PASS |
| 2 | close-signal day (token by design) | PASS (token) |
| 3 | `RESEARCH.md:49` verbatim | PASS |
| 4 | `r3-verification-tables.md` §10: **22** `### 10.` headings (10.1–10.22) at rehearsal; five-unit folds + the D2/D3 fold (D6) append | PASS (waits on folds) |
| 5 | `REPORT-INPUTS-ITER4.md` §1/§2 OPEN rows all present: 72-M1 "L3b–d OPEN", 22-T2a OPEN-CONDITIONAL, 74-T3 OPEN-GATED, 10-tranche OPEN, G10 SHELF, debts "f/h/l OPEN" | PASS |
| 6 | ledger row 75-N2/N3 + §10.22 checkpoint exist | PASS (waits on A5) |
| 7 | all five 78-locators exist; P0.lean sha re-verified `d94d115e3d8d08d7` | PASS (filled) |
| 8 | **D3:** runbook said "article-75's carried-tier text (§8)" — WRONG: article-75 §8 (`:510`) is "Prior work and references"; the article's ONLY N2 anchor is the **`:551` box-11 row** ("N2 still carried"); README row-75 N2 tail is the second anchor. Runbook placeholder-map row 8 corrected at rehearsal | DEFECT→FIXED (runbook) |

## R4 — the three supersession stamps (runbook Step 4) — PASS (1 defect fixed in-draft)

- Title anchors exact on all three (`:1` = `# ITERATION4-SCAN — groundwork inputs…` /
  `# ITERATION4-SEED-DOSSIERS — pre-dossiers…` / `# ITERATION4-CHARTER-DRAFT —
  skeleton…`); stamps inserted as the line immediately below `:1` (rehearsal files,
  1-line diff each). SEED stamp's inline anchors re-verified: `:53/:123/:187` A5-fold
  lines present; DRAFT stamp's `:6` resolutions line present.
- **D4 (fixed in-draft):** the SCAN stamp said "8 [TRIAGE-DECISION] rows" — SCAN
  carries **9** live rows on main (`:5,:18–:23,:40,:105`; the corrected census). Draft
  §B SCAN stamp now reads "9 live … rows per the 2026-11-18 corrected census —
  a2-close-act-runbook.md §8; all closed in-cycle".

## R5 — RESEARCH.md close-out record (runbook Step 5; RATIFIED BOTH) — PASS

- `research/RESEARCH.md` is 195 lines; §Iteration 4 is the LAST section; `:195` =
  close-out protocol item (5) tail ("…superseded/selected stamp in the same commit.").
  Append verified: `**Close-out record ([DATE-CLOSED]):**` + block at :196+
  (`rehearsal/RESEARCH.md`, 30-line additive diff).
- Anchor note for H: the phrase "**Staging-file supersession**" is on `:194`; the `:195`
  line is the sentence TAIL — anchor on the tail phrase (the rehearsal script's first
  guess was off by one; corrected, assertion now exact).

## R6 — A9 items 1–5 staging (runbook Step 6) — 2 PASS, 1 NO-OP, 2 with defects

- **Item 1 (row 10) — D5 (staleness, fix staged):** main `articles/README.md:45`
  already carries the D1-landed wording, but **D2 FINAL GREEN** (`padM'_isPolyT`
  triad, `pilots/10/logs/d2-run4.log`, L5.lean sha `4ae0d643…`, commit `9dc6684`) and
  **D3 GREEN** (`d3-run1.log`) landed after the checklist was drafted — the
  checklist's example wording ("D2–D6 carried") is one-tranche stale. ALSO
  **article-10's header status table still has only the D1 row** (`:17`) — the item's
  declared source of truth lacks D2/D3. Fix: A9 extends article-10's status table (or
  the README row cites §10.17/§10.20 + the INDEX L5.lean row directly); rehearsal
  staged the D1–D3 wording with D4→Iteration-5 ruling noted. **Waits on: A9
  ratification (content is on main — no unit dependency).**
- **Item 2 (row 75) — PASS-with-residual:** row `:22` is ALREADY the v2 two-tier
  wording (pre-applied at the article-75 v2 landing); the only close-time edit is the
  N2 tail cell ("IN FLIGHT (P0 + P1-core GREEN)") → rehearsal tokenized
  `[N2-FINAL-STATE]`. **Waits on: A5 landing.**
- **Item 3 (row 78) — PASS:** row `:23` present; the drafting attribution "— row
  drafted 2026-11-17 lane A9, landed by H" matched VERBATIM (note: the checklist
  quotes an earlier variant of the marker — locator correction only); drop is
  mechanical (rehearsaled).
- **Item 4 (counts line) — PASS-with-question (D6-minor):** `:3` base matched exactly;
  the 6-discovery-grade wording staged (01, 30, 32, 42, 75, 78; 75 two-tier per S4(b),
  78 NEGATIVE-kind per the 2026-11-17 ruling) + re-date additive ("counts re-ratified
  at the Iteration-4 close [DATE-CLOSED]" — original 2026-11-16 ratification date
  preserved, per date discipline). OPEN: the "(1 pending a branch decision)" notes
  qualifier — the checklist's "notes/certificates unchanged" does not say whether the
  qualifier itself is stale at close; rehearsal kept it verbatim (no fabrication).
  **Waits on: A9/orchestrator qualifier disposition.**
- **Item 5 (conditional prose) — NO-OP:** the target sentence ("ordering above is by
  how new the mathematics is") is ABSENT from main README (grep: zero hits) — no edit;
  checklist's own conditional resolves to absent. Evidence recorded.

## R7 — K-list cross-check (16 files, main @ `c67d64e`) — PASS + 5-row amendment proposed

All 16 K-files exist on main: `feasibility/ITERATION4-CHARTER-SPLICE.md`,
`RESEARCH.md`, `feasibility/ITERATION4-{SCAN,SEED-DOSSIERS,CHARTER-DRAFT}.md`,
`TRIAGE.md` + `TRIAGE-C2-ROWS.md`, `articles/README.md`,
`articles/75-abelian-assembly-zetaL-proportions.md`,
`articles/78-truffet-substitution-refutation.md`, `qa/iter4-closeout-gates.md`,
`qa/REPORT-INPUTS-ITER4.md`, `REPORT.md`, `INDEX.md`, `STATUS.md`,
`ORCHESTRATION-ITER4.md` + `RESUME-BRIEF-ITER4.md` + `qa/iter4-review/h-wave3-log.md`. ✓
Nothing committed since runbook drafting changes the list EXCEPT (report-only
amendment, now also in runbook §5 as K-rows 17–21): per close-out protocol rule 5
(staging supersession, same-commit stamps), the five close-act staging instruments —
`a2-close-summary-draft.md` (APPLIED), `a9-splice-readme-checklist.md` (APPLIED, A9
lineage), `a2-g7-token-inventory.md` (SUPERSEDED-BY-CLOSE-BLOCK), `a2-close-act-runbook.md`
(EXECUTED), `a2-close-rehearsal-report.md` (RECORDED). `rehearsal/` itself stays
worktree scratch. `c67d64e` touched only `h-wave3-log.md` (already in K). Batch-S
composition unchanged by the rehearsal.

## Defect register (consolidated)

| id | defect | class | fix | waits on |
|---|---|---|---|---|
| D1 | draft's subtitle default moot (L2 retitled) | stale-default | already fixed in the 2026-11-18 draft refresh (mechanical quotation of `RESEARCH.md:49`) | — |
| D2 | close-block retarget count 5 vs corrected census 6; L3-spec carrier unenumerated | content-internal | fixed in draft §A2 + rehearsal block | — |
| D3 | runbook placeholder-8 locator "article-75 §8" wrong (§8 = Prior work; only N2 anchor is `:551` box-11) | locator | fixed in runbook §2 map row 8 | — |
| D4 | SCAN stamp "8 rows" vs 9 live rows (corrected census) | content-internal | fixed in draft §B + rehearsal stamp | — |
| D5 | A9 item-1 wording + article-10 status table one-tranche stale (D2-FINAL/D3 GREEN landed `9dc6684`, unreflected); also **D2-FINAL/D3 have NO §10 row yet** (§10.20 still records the PARTIAL budget-stop; INDEX L5.lean row has the final state) | staleness ×2 | (a) A9: extend article-10 table / README row cites §10.17+§10.20-final; (b) A1: append the D2-FINAL/D3 fold pre-close ([PENDING-TALLY]/[PENDING-N-TABLES] input) | A9 wording; A1 fold (data on main, no unit dependency) |
| D6 | item-4 "(1 pending a branch decision)" qualifier disposition unspecified | unspecified | A9/orchestrator confirm at close (rehearsal kept it verbatim) | A9/orchestrator |

Plus 3 by-design waits (not defects): [N2-FINAL-STATE]/[PENDING-75-N2/N3]/
[PENDING-N2-D] ← A5; [PENDING-INFLIGHT-SET]/[PENDING-TALLY]/[PENDING-N-TABLES]/
[PENDING-VERDICT-COUNTS] ← the five-unit folds; [DATE-CLOSED] ← the close signal.

— end report (A2, 2026-11-18; rehearsal bases = main @ `c67d64e`, byte-verified;
nothing applied to any tree file; H pulls the report + runbook + refreshed draft).

---

## ADDENDUM — [PENDING-TALLY]/[PENDING-N-TABLES] computation scaffold (A2, 2026-11-18)

### A. The procedure

`research/qa/iter4-review/tally_section10.py` (sibling to apply_rehearsal.py —
RE-HOMED out of `rehearsal/` 2026-11-18 per orchestrator instruction, since the
runbook's close-time Step 3 depends on it and `rehearsal/` is never-commit;
READ-ONLY on A1's `r3-verification-tables.md`; defaults to the MAIN-tree copy, never
the worktree base; re-run from the new location verified exit 0):

```
python3 -I research/qa/iter4-review/tally_section10.py [path]
```

Grammar: §10 is split at `## 10. Iteration-4 landings`; sections = `### 10.N`
headings. **Verdict classes come from the heading text** (ordered: `NOT-GREEN` →
not-green-honest; `M1 CHECKPOINT` / `PARTIAL GREEN` → honest-partial; `LANDED GREEN` /
`LANDED` → green-triad; anything else → hard FAIL). **Fail-loud guarantees:** §10
numbering must be contiguous 1..N (else abort); unknown verdict heading → abort with
the offending line; census N/N phrases are strict-regex and are **never
first-matched** — a section span containing several (recap blocks quote other
sections' censuses) flags MULTI-CENSUS for manual pick, absent flags
NO-MACHINE-CENSUS; totals sum ONLY unambiguous single-census sections. Subclasses
recorded for close-time eyeballing: probe-convention, remediation row, audit row,
engineering/plumbing billing, hard-stop executed, heading-variant "LANDED" (ledger
FINAL-GREEN; spot-check).

### B. Dry-run output — main @ `c67d64e`, §10 = §10.1–§10.22 (PROVISIONAL until A1's final fold)

- **N-TABLES = 22** (§10.1–§10.22).
- **Verdict counts: GREEN-triad = 19 · honest-partial = 2 (10.20 D2 budget-stop
  PARTIAL; 10.22 N2-P1 M1 CHECKPOINT) · NOT-GREEN-honest = 1 (10.21 74-P1)** — sum 22 ✓.
- **Machine triad census: 144/144** over the 4 unambiguous sections (10.6 = 22/22,
  10.8 = 89/89, 10.16 = 10/10, 10.18 = 23/23); **10.22 = MULTI-CENSUS
  [10/10,15/15,3/3,4/4,89/89]** — its own census is the **4/4** (`n2-p1-run7.log:175–178`
  incl. the c-trick); the other four are its recap block cross-referencing
  §10.16/§10.12/§10.13/§10.8. 16 further sections are NO-MACHINE-CENSUS (their
  per-decl `triad` table cells predate the N/N-phrase convention) — manual fold by A1
  if a full-tree census number is wanted in the close block; otherwise quote
  "144/144 machine + per-decl tables".

### C. Fill-in-the-blanks delta slots (close-time expectation; verdict templates per the charters)

| slot | unit (owner) | primary template | alternate | counter bumps | census slot |
|---|---|---|---|---|---|
| §10.23 | 10-D2 FINAL (A1 fold; data ON MAIN: `d2-run4.log`, L5.lean sha `4ae0d643…`) | LANDED GREEN (`padM'_isPolyT` triad; supersedes §10.20 PARTIAL — keep 10.20 as the honest descent record) | in-place §10.20 retitle | green+1, partial stays-as-history (or partial−1 if reclassified) | D2-final decl census |
| §10.24 | 10-D3 (A1 fold; `d3-run1.log`) | LANDED GREEN first-run | — | green+1 | D3 census |
| §10.25 | FF-EZ2-P2 descope-closure (A3) | LANDED GREEN (guarded squarefree-iff governs; optional proportion ≤3 runs) | honest-partial parked (guarded GREEN; unguarded → Iteration 5) | green+1 or partial+1 | P2 decl census |
| §10.26 | AL-P2-c completion (path a) + P2-d/e (A4) | LANDED GREEN (A2.lean final state or A3.lean; §10.6 row extends) | honest-partial (d/e budget-stop) | green+1 or partial+1 | final-state census |
| §10.27 | 75-N2-P1 packaging closure + M2 + M3 (A5) | LANDED GREEN (§10.22 checkpoint resolves final; M2/M3 as rows or folded) — MULTI-CENSUS flag clears when the recap block lands its own final census | honest-partial (M-arc stop) | green+1..2, partial−1 (checkpoint resolves) | N2-final census (4/4 grows) |
| §10.28 | 77 T1-completion + T2 as ONE unit (A7) | LANDED GREEN (corrected T1: hyperbolic submodel + number-operator intertwining) | NOT-GREEN-honest re-stop (§10.21 class precedent) | green+1 or notgreen+1 | T1/T2 census |
| §10.29 | 74-P1 completion, verify-fire ≤5 (A8) | LANDED GREEN (amended statements per FINDS: marking-bound floor, centered hMGF, 8 signature classes) | NOT-GREEN-honest re-stop (§10.21 stands final as-is) | green+1 or no change | P1 census |

N at close ∈ **[26, 29]** by fold granularity (22 + 1–2 A1 fold rows + 3–5 unit rows;
A5 may extend §10.22 in place). The close-time re-run reads the actual state — the
slots above are expectations, not commitments; any unit landing with a verdict
OUTSIDE its two templates → the tally aborts loudly and the row goes back to the lane.

### D. New defect found while scaffolding

**D7 (report-only, orchestrator wording call):** the draft close-block's
[VERDICT-COUNTS] sentence is written in the ARTICLE status vocabulary
(PROVED-UNCONDITIONAL / PROVED-CONDITIONAL / CERTIFIED-NUMERIC / PAPER-ONLY), but the
table it cites (§10) carries ROW verdicts in the PILOT vocabulary
(GREEN-triad / honest-partial / NOT-GREEN-honest). Recommended: the close block quotes
the §10 vocabulary (source-consistent, machine-computable by this scaffold); the
article-vocabulary census belongs to A9's compliance roll-up / REPORT §I4 (per-article
status tables), not the close block. **RULED 2026-11-18 (orchestrator): RECOMMENDATION
ADOPTED** — the close-block sentence quotes the §10 PILOT vocabulary (machine-computable
by `tally_section10.py`); the ARTICLE vocabulary stays in A9's roll-up and REPORT §I4.
Consequential edit owed at close (H, mechanical): the draft close-block sentence
"N × PROVED-UNCONDITIONAL / M × PROVED-CONDITIONAL / C × CERTIFIED-NUMERIC / P ×
PAPER-ONLY" → "G × GREEN-triad / P × honest-partial / N × NOT-GREEN-honest" (numbers
from the scaffold's close-time re-run).

— end addendum v1 (A2, 2026-11-18; scaffold re-homed at
`research/qa/iter4-review/tally_section10.py`; **§B/§C v1 above SUPERSEDED by §B2/§C2
below after A1's §10.CENSUS landing**).

### B2 — DRY-RUN v2 (2026-11-18, post A1's §10.CENSUS + grammar fixes; the CURRENT basis)

A1 landed `§10.CENSUS` (`r3-verification-tables.md:1752`, placed AFTER the `##
Sources` level-2 heading at :1644 so the tool's section geometry is unchanged) + two
fixes: §10.26 re-titled to LANDED-GREEN grammar (the tool's fail-loud abort on the old
title was CORRECT — A1 fixed the row, not the tool, and says so at :1758), and the
changelog promoted to level-2 so §10.28's span no longer absorbs quoted censuses.
Tool re-run against the updated main file reconciles EXACTLY with A1's stated basis —
**zero defects, no tool patch needed**:

- **N-TABLES = 28** (§10.1–§10.28; new: 10.23 FF-EZ2-P1 7/7, 10.24 G9+G13, 10.25
  22-T2a P0, 10.26 10-D2 FINAL + 10-D3 45/45, 10.27 77-T1 honest stop, 10.28 FF-EZ2-P2
  9/9 — A3's unit LANDED GREEN 2026-11-18, removed from the delta slots).
- **Verdicts 24 green-triad / 2 honest-partial (10.20 superseded-partial history,
  10.22 N2-P1 checkpoint) / 2 not-green-honest (10.21 74-P1, 10.27 77-T1)** — sum 28 ✓.
- **Machine census 205/205 over 7 sections** (22+89+10+23+7+45+9), **0 MULTI-CENSUS**
  (the §10.22 v1 MULTI flag is RESOLVED: A1 validated our 4/4 manual pick against
  `n2-p1-run7.log:175–:178` and refined it to **4/7** — the 3 sorryAx packaging decls
  are IN-PROGRESS, the only non-triad denominator contributors tree-wide),
  **21 NO-MACHINE-CENSUS flags all resolved manually** by §10.CENSUS tables (a)–(d).
- **[PENDING-VERDICT-COUNTS] G/P/N seeds = 24/2/2 CONFIRMED** (cross-check requested:
  passes; the close block fills G/P/N from the close-time re-run, seeded at 24/2/2).

**Whole-tree roll-up — the ONE number the close block quotes** (A1's §10.CENSUS(e)
formula, `r3-verification-tables.md:1815–1820`, verbatim):

```
OUR pilots:  machine 205/205 (7 sections, tally_section10.py @ this file)
           + manual    69/72 (8 evidenced sections, table (b))
           =          274/277 triad-clean decls across §10.1–§10.28
              (249 direct-print + 25 documented-elimination; the 3 residuals =
               §10.22's IN-PROGRESS packaging decls, delta slot below)
DONOR rows:  + 18/18 donor-pin audit rows (table (c)) — quote separately
```

Close-block citation shape: "274/277 triad-clean decls (machine 205/205 + manual
69/72; the 3 residuals = N2-P1 packaging IN-PROGRESS, delta slot) + 18/18 donor rows
at their donor pins, quoted separately" — numbers refreshed by the close-time re-run +
A1's appendix-successor row. N/A classes (probe rungs, honest stops, embedded/
machine-covered) are excluded from every roll-up number per §10.CENSUS(d) — do not
re-add them.

### C2 — Delta slots v2 (supersedes §C v1; base 28, FOUR slots)

| slot | unit (owner) | primary template | alternate | counter bumps | census slot |
|---|---|---|---|---|---|
| §10.29 | AL-P2-c completion (path a) + P2-d/e (A4) | LANDED GREEN (A2.lean final or A3.lean; §10.6 row extends) | honest-partial (d/e budget-stop) | green+1 or partial+1 | final-state census → appendix successor |
| §10.30 | 75-N2-P1 closure + M2 + M3 (A5) | LANDED GREEN (§10.22 checkpoint resolves: 4/7 → 7/7; M2/M3 rows or folded) | honest-partial (M-arc stop — the 3 residuals then stand in the roll-up) | green+1..2, partial−1 (checkpoint resolves) | 10.22 → 7/7; roll-up 274/277 → 277/277 expected |
| §10.31 | 77 T1-completion + T2 as ONE unit (A7) | LANDED GREEN (corrected T1; §10.27's stop stands as history) | NOT-GREEN-honest re-stop (§10.27 stands final) | green+1 or no change (10.27 already not-green) | T1/T2 census |
| §10.32 | 74-P1 completion, verify-fire ≤5 (A8) | LANDED GREEN (amended statements per FINDS) | NOT-GREEN-honest re-stop (§10.21 stands final) | green+1 or no change | P1 census |

N at close ∈ **[29, 32]** (28 + up to 4 rows; A5 may extend §10.22 in place → 29).
Any verdict outside a unit's two templates → the tally aborts loudly; the row goes
back to the lane. After all four land: re-run the tool + A1's appendix-successor row
→ fill [PENDING-N-TABLES], [PENDING-TALLY], G/P/N, and the roll-up citation.

— end addendum v2 (A2, 2026-11-18; reconciliation against A1's basis: N=28 ✓ 24/2/2 ✓
205/205/7 ✓ 0 MULTI ✓ 21 flags ✓ — zero defects; close-time re-run is the number of
record).

---

## PRE-GO VERIFICATION (A2, 2026-11-18 @ main `6216e2a` — A1's final folds + census
refresh + H's A7 batch still pending; this block is the GO-time starting state)

### G-a. Rehearsal staging currency — ALL SIX BASES CURRENT

`git diff --stat c67d64e..HEAD` over the six staged sources (SPLICE, SCAN,
SEED-DOSSIERS, CHARTER-DRAFT, RESEARCH.md, articles/README.md) = **0 lines** — the
apply-script's assertion bases are exact; a full re-apply after re-copy ran clean
(all 8 edit steps OK). (The earlier "DRIFTED" cmp scare compared main against the
rehearsal's EDITED outputs — self-inflicted, resolved.)

### G-b. Tally on A1's last committed fold — CLEAN, basis moved again (v3 seeds)

`tally_section10.py` @ `6216e2a`: **N=29 (§10.29 = 75-N2 P1 FINAL, LANDED GREEN,
8/8 machine), verdicts 25/2/2, machine 213/213 over 8 sections, 0 MULTI-CENSUS, 21
flags**. §10.CENSUS(e) was RESTATED at the §10.29 landing — **the roll-up of record
is now 278/278 ZERO residuals** (machine 213/213 + manual 65/65; 253 direct + 25
documented-elimination) **+ 18/18 donor rows**, superseding the 274/277 interim my
§B2 quoted. Remaining folds owed by A1 (pre-GO): AL-P2 c/d/e final-state row (A4
landed as honest stop, `0e771ab`/`136c935`; §10.6 :615 still says "rows follow their
verdicts") + 74-P1 completion row (A8 landed GREEN run 5/5, `086e7fd`; §10.21 still
the wave-2 stop). Only **A7 (77 T1/T2) is truly in flight**. N at GO ∈ [30,32];
G/P/N seeds at GO = 25/2/2 + the A4/A8/A7 fold outcomes.

### G-c. Map-source drift found (D8–D10) and dispositioned

- **D8 (fixed): my rehearsal row-10 staged wording mis-attributed L4.lean's sha
  `4ae0d643…` to the D2 log** — corrected in apply_rehearsal.py to the article-10
  header's own citations (:17–:19): D2 = `d2-run4.log:110`, L4.lean `4ae0d643…`;
  D3 = `d3-run1.log:44–45`, L5.lean `da398f21…`. Re-apply re-proved. NOTE: the
  article-10 header NOW carries all three tranche rows — the original D5
  source-parity gap is CLOSED on main.
- **D9 (anchors moved): article-78's A9-item-7 anchors drifted** with the claims-audit
  extension (`0184baa`): box-11 row 11 `:309 → :313`; tail sha-stamp `:312 → :316`;
  `:201` stable. Article-75's `:383/:551/:554` ALL stable. GO-time A9 edits use the
  current line numbers.
- **D10 (supersession): A9's checklist gained a WAVE-3 ADDENDUM** (D-series:
  copy-paste-exact PENDING-CLOSE blocks; "supersedes the A-section framing of items
  1–3 per D.0"; D.2 = P1-complete wording M1+M2+M3 GREEN 14/14, branch carried;
  D.5 = A5 edge resolved). Phase-1 assembly at GO stages the README/article edits
  from the D-SERIES blocks, not from my rehearsal's item-1–4 staging (mine remains
  the structural dry-run; where both exist, D-series wording wins — A9 is writer of
  record).

### G-d. Placeholders now fillable at GO (source-quoted, on main)

- `[PENDING-75-N2/N3]` / `[PENDING-N2-D]` ← §10.29 FINAL (P1 COMPLETE 14/14 incl.
  the dictionary heart `heckeTsum_eq_ratCharOf_LFunction`/`hasQDirichletDictionary`;
  M2 GREEN 8/8; M3 DEFERRED→Iteration-5; FIND: P0 transfer missing `hnp` amendment
  owed — `dc3cd6c`/`3ad896b`/`d77bb20`).
- README row-75 N2 tail `[N2-FINAL-STATE]` ← same (M3-deferred wording per A9 D.2).
- `[PENDING-78-LOCATOR]` ← unchanged fills (verified again).
- Still token at GO: `[DATE-CLOSED]`; `[PENDING-TALLY]`/`[PENDING-N-TABLES]`/
  `[PENDING-VERDICT-COUNTS]` (A1's final folds + A7); `[PENDING-INFLIGHT-SET]`
  (A7 + carries); the roll-up citation quotes §10.CENSUS(e)'s GO-time restatement.

### G-e. K-list — 21/21 files exist on main (`c67d64e`→`6216e2a` changed only
content, no K-file added/removed; the K-17–21 amendment stands).

**VERDICT: READY.** Zero blocking defects; D8 fixed, D9/D10 recorded for GO-time
use; tally clean on the last committed fold; staging bases current and re-proved.
GO fires on A1's census refresh + H's A7 batch per the orchestrator.

— end pre-GO block (A2, 2026-11-18; next write = the GO-time execution log).

---

## GO-TIME FILL SHEET (A2, 2026-11-18 — GO fired; H executing Part 1)

**Basis pre-verification (the GO-stated final basis, tool-run against A1's worktree
copy — commit pending in H's Part 1):** `tally_section10.py` on agent-02's
`r3-verification-tables.md` → **N=32 (§10.30 AL-P2 honest-stop, §10.31 74-P1
COMPLETION GREEN, §10.32 77-T1/T2 NOT-GREEN-at-budget), verdicts 26/3/3 (sum ✓),
machine 226/226 over 9 sections, 0 MULTI-CENSUS, 23 NO-MACHINE-CENSUS flags
(manual-table covered)** — reconciles EXACTLY with A1's §10.CENSUS restatement:
machine 226/226 + manual 159/160 = **whole-tree 385/386** (226+159=385 ✓,
226+160=386 ✓; the ONE residual = 77-T2's runner-filter-tainted decl → Iteration 5),
**+ 18/18 donor rows**, **delta slots NONE**. ANOMALY DISPOSITION (surfaced, not a
defect): A1's folds were UNCOMMITTED at GO (main `041f4ea` still reads N=29/25/2/2/
213/213) — sequencing constraint: **the fill-time tally re-run on the COMMITTED tree
happens AFTER H commits A1's r3-verification-tables.md**; the numbers above are
pre-verified identical. SCAN.md in agent-02 = identical to main (no stamp-anchor
drift; the agent-02 "M" status is vs its 53c1548 base).

**Fill state (applied to the draft close block this pass — source-quoted):** all
placeholders FILLED except **[DATE-CLOSED]** (orchestrator): N=32; 26/3/3 per D7
vocabulary; 385/386 whole-tree + 18/18 donor (§10.CENSUS(e) final restatement); the
"every landed row triad-only" sentence corrected to the honest 385/386-with-residual
form (the old sentence was FALSE for 77-T2's tainted decl); carried-to-iter-5 set
enumerated (nothing in flight — delta slots NONE; carries: 72-M1 L3b–d+interface,
22-T2a, 74-T3, 10-D4–D6, N2-P2 paused-at-close, AL-P2 P2-d FIND#5 park + P2-e
rebuild, 77-T2 residual, A3 η-port precharter, A8 74-P2 precharter, G10, 11-M3,
debts f/h/l); 75-N2/N3 = P1 COMPLETE 14/14 + M2 GREEN, M3 deferred, P2 paused, hnp
erratum applied, N3 carried; 78-locator five anchors; N2-d = dictionary heart
kernel-verified, instantiation beyond carries.

**Remaining A2 duties at Phase 2/3 (per activation):** (i) fill-time tally re-run on
the COMMITTED closing tree (after H's A1-fold commit) — quote its numbers in K;
(ii) MULTI/NO-CENSUS manual-fold verification: the 23 flags ↔ §10.CENSUS table (b)
manual rows 159/160 — every flag covered, the one residual attributed; (iii) gates
split per the runbook owner column (my support: G4 date grep + G7 staging-file
greps re-run on the closing tree — the four staging files unchanged since my §8
sweep, gate grep still 30 lines); (iv) anomalies surface to the orchestrator
unpatched.

— end GO fill sheet (A2, 2026-11-18; Phase-1 assembly support active alongside H).
