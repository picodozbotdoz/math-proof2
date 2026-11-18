# A2 — CLOSE-ACT PHASE-1 REHEARSAL REPORT (pre-flight defect list; 2026-11-18)

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
