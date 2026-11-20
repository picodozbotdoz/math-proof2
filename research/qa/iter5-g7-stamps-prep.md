# ITER-5 G7(a) STAMP PREP — paste-ready supersession/execution stamps (lane R2, 2026-11-20; PREP ONLY)

Discharges dry-run blocker #6 (`qa/iter5-closeout-gates-dryrun.md` BLOCKERS, "G7(a)
stamp debts"). **Nothing executed herein** — H flips these in at the close act (or at
convenience per the gates file's G7(a): "every iter-5 staging-class instrument that
DID land gets its supersession/selected stamp in the same commit as its consuming
decision"). Format = the executed iter-4 precedent (`ITERATION4-{SCAN,SEED-DOSSIERS,
CHARTER-DRAFT,CHARTER-SPLICE}.md` line-2 blockquote stamps). Consumption dates from
git records (`git show -s --format=%cs`): `e309edd` / `cb87a67` / `cc71841` all
landed **2026-11-19**. Census command at close (the gates file §G7(a)):

```bash
grep -rLn "SUPERSEDED\|SELECTED\|APPLIED\|EXECUTED\|RECORDED\|CONSUMED" <the landed staging list>
```

Placement rule (all .md targets): insert the blockquote as **line 2**, immediately
after the title line quoted below (the ITERATION4-* precedent). One paste per file;
each anchor title verified byte-exact against main @ `a6ad33d`.

## 1. `qa/iter4-review/a6-iter5-charter-candidate.md`

Title line (anchor): `# A6 — Iteration-5 charter CANDIDATE (consolidation + ranking + citations; orchestrator owns the typeset charter)`

```markdown
> SUPERSEDED 2026-11-19 — superseded by A6's charter draft (`a6-iter5-charter-draft.md`
> §8 final-outcome refresh = the authoritative consolidation); the ranked-leads, bench
> audit and §5a NS-1 sweep were all consumed there, and the family by the approved
> `RESEARCH.md` §Iteration 5 splice `e309edd`. Stamp per `qa/iter5-closeout-gates.md` §G7(a).
```

## 2. `qa/iter4-review/a6-iter5-charter-draft.md`

Title line (anchor): `# A6 — Iteration-5 charter TYPESET-DRAFT v1 (working consolidation for the orchestrator's typeset pass)`

```markdown
> SUPERSEDED 2026-11-19 — superseded by the typeset charter (`a6-iter5-charter-typeset.md`
> §SPLICE), applied as `RESEARCH.md` §Iteration 5 at the opening commit `e309edd`
> (pre-consolidated open: no ITERATION5-{SCAN,SEED-DOSSIERS,CHARTER-DRAFT,CHARTER-SPLICE}
> family exists). Stamp per `qa/iter5-closeout-gates.md` §G7(a).
```

## 3. `qa/iter4-review/a6-iter5-charter-typeset.md`

Title line (anchor): `# A6/R3 — Iteration-5 charter TYPESET (exact splice text for the orchestrator's RESEARCH.md pass)`

```markdown
> APPLIED 2026-11-19 — §SPLICE applied as `research/RESEARCH.md` §Iteration 5 at the
> opening commit `e309edd` (splice payload `a6-iter5-research-splice.diff`). The charter
> text of record is RESEARCH.md; this file is the applied staging original.
```

## 4. `qa/iter4-review/a6-iter5-research-splice.diff` — PLACEMENT CAVEAT (H rules; recommendation below)

This is a unified-diff ARTIFACT, not prose — a line-2 blockquote breaks diff parsing
(cosmetic-only: the payload is applied frozen history, never re-appliable). Two
options; **recommended = (a)**:

(a) **Census-exclusion ruling** (cleanest; the ff-ez2-P1 label-vs-artifact lesson):
H excludes the .diff from the G7(a) staging list with a one-line ruling in the close
block — "the splice diff is PAYLOAD, not instrument; its consumption is stamped on
the typeset file (block 3)". No byte change to the .diff.

(b) Trailing stamp line appended after the last hunk:
`# APPLIED 2026-11-19 — applied as research/RESEARCH.md §Iteration 5 at e309edd.`

## 5. `qa/iter4-review/a6-iter5-wave2-queue.md`

Title line (anchor): `# R8 — Iteration-5 WAVE-2 QUEUE (charter-row consolidation; what fires AFTER the day-1 trio)`

```markdown
> CONSUMED 2026-11-19 — consumed by the typeset charter's launch-order/wave-2 sections
> (spliced `e309edd`); the queue's dispositions live in `RESEARCH.md` §Iteration 5
> Launch order + the STATUS.md open block. Stamp per `qa/iter5-closeout-gates.md` §G7(a).
```

## 6. `qa/iter4-review/a7-41-splice-package.md`

Title line (anchor): `# A7/R7 — article-41 splice package (paste-ready; pre-staged for the orchestrator's post-R2 signal)`

```markdown
> EXECUTED 2026-11-19 — executed by H as the article-41 splice `cb87a67` (the §1–§5
> flips applied in-commit; §9 box-11 SATISFIED; README row-41 + counts 6→7). Stamp per
> `qa/iter5-closeout-gates.md` §G7(a).
```

## 7. `qa/iter4-review/a7-41h-splice-package.md`

Title line (anchor): `# A7/R7 — article-41H splice package (paste-ready; H splices on arrival)`

```markdown
> EXECUTED 2026-11-19 — executed by H as the article-41H splice-2 `cc71841` (draft base
> `2923f188` + the eight in-commit flips incl. R2's riders; README row-41H + counts
> 7→8). Stamp per `qa/iter5-closeout-gates.md` §G7(a).
```

## Exclusions (do NOT stamp — documented so the close census list is derivable)

- `qa/iter4-review/a6-41-p0-precharter.md` and `pilots/zzv2-lam/eta-port-precharter.md`
  (+ the batch-S amendment `ca2470c2`): LIVE payload references — the charter text
  cites them as the payload sources (`RESEARCH.md` §Iteration 5 seed-inventory
  paragraph), and the eta precharter was AMENDED in-wave. Not staging-superseded.
- The close-time instruments (this cycle's own): `a9-iter5-article-watchlist.md`
  (CONSUMED at close), `iter5-closeout-gates.md` (EXECUTED at close — the §G8 fill),
  `REPORT-INPUTS-ITER5.md` (CONSUMED by the REPORT fold), `iter5-close-block-skeleton.md`
  (CONSUMED by the close block), this prep file (CONSUMED by the G7(a) census) — they
  take their stamps IN the close act per the gates file G7(a); not pre-staged here.

— pre-staged lane R2 (gates-owner lineage), 2026-11-20, main read @ `a6ad33d`,
worktree agent-03. PREP ONLY; H pulls at convenience; no commit (lanes never commit).
