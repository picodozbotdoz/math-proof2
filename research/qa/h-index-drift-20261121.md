# INDEX reconciliation prep — drift at `ef1e7bd` (2026-11-21)

Author: the general helper lane (worktree agent-01). Computed at the carry base
`ef1e7bd` (worktree clean). Main has since advanced to `0a15ec0`; the only INDEX delta
`ef1e7bd..0a15ec0` is the new `pilots/72-M1/L3-recharter.md` row (correct, rides its
landing) — everything below is unaffected by it.

## Method

Bidirectional check per the 2026-11-17 listing convention: `git ls-files research/`
(1,065 tracked files) vs every path named in `research/INDEX.md` rows (backticked
tokens expanded: braces, globs, `…`-truncations, relative tokens resolved both against
`research/` and the row's primary dir; plus raw-substring mentions). Raw matcher output
manually curated — two false-covering classes caught and excluded this pass:

- batch-style dir tokens ("`research/pilots/41/` P0 day-1 batch: …" enumerates its
  files; it is not whole-directory coverage — other 41 files carry their own rows);
- the stray repo-root `qa/` mention in the r7-bib-cards row (path-correction history,
  not a coverage token).

Convention check (per the unit brief): the iter-5 close / G3 precedent for
directory-level sets is the **grouped single row** naming the set's files (rows 426
round-6 novelty brace-of-6; 445/446/447 decl-index families). So the 19-file
introduction set takes ONE grouped row, not 19 rows.

## Drift found — 28 files in 4 groups (+2 accuracy fixes)

All four groups are files whose landing commits did not carry their INDEX row:

| # | Group | Files | Landed at | Missed because |
|---|---|---|---|---|
| 1 | `research/articles/introduction/` | 19 (17 same-stem companions + `_SPEC.md` + `README-INTRODUCTION_IS_POST_REVIEW.md`) | `ef1e7bd` (UNVERIFIED draft set) | commit touched no INDEX row |
| 2 | `research/qa/article-revisions-2026-11-21.md` | 1 | created `2bfe771`, amended `2ea25a9` | `2bfe771`'s INDEX edit was the 78-A2′ retraction only |
| 3 | `research/pilots/41/presolve/` | 7 (`README.md`, `h3_presolve_archive.py`, 5 `outputs/` files) | `2ea25a9` | commit touched no INDEX row |
| 4 | `research/qa/decl-index-v3-coverage-vs-v2.tsv` | 1 | `c58ef8f` (decl-index-v3 CPU stage) | row 445 names the py/manifest/enrich trio, not the TSV |

Everything else new since the iter-6 open (`6306dbe..HEAD`) is rowed — verified
per-file, including: ORCHESTRATION/RESUME-BRIEF-ITER6 (row 428), a9-iter6 typeset +
splice.diff (429), n2-p1-run31 (430), r2-75v3 drypass (431), al3d run7/run8 (432/437),
axcheck-iter6-n2p1rebind (433), r7-75v3 editorial read (434), 12-core day-1 + S-tranche
batches (436/442 + the earlier 396/399/406), 41H3 draft/ship (438/439), r2 gate pair
(440), gpu-investigation (444), decl-index-v3 family (445–447). The eta-r4 payload
`0df2546` modifies an already-rowed file (no new row owed). Deleted files carry RETIRED
stamps (rows 83/84/131) — nothing dangles.

## Ready-to-paste rows (H lands, same commit as any fix batch)

```markdown
- `research/articles/introduction/` companion set: `_SPEC.md` (the binding spec; exemplar = the 41 companion) + `README-INTRODUCTION_IS_POST_REVIEW.md` (the one-line marker: introduction documents are generated after review, never during the research loop) + the 17 same-stem beginner's introductions (`01`, `10`, `11`, `20`, `22`, `30`, `32`, `41`, `41H`, `41H3`, `42`, `50`, `52`, `71`, `72`, `75`, `78`) | article companions (expository; NON-NORMATIVE per the spec's verbatim marker — "Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win") | landed 2026-11-21 at `ef1e7bd` (accessibility pass resumed post-referee-review; **UNVERIFIED at landing — R6/R7 lane verification in flight, fixes land on verdicts**) | One expository companion per research article, closing the 2026-11-21 external-review reader gap (review-q4 density/notation/no examples; review-ds wrong-field imports); target reader an undergraduate in mathematics or an adjacent-field expert; same stem as its article.
- `research/qa/article-revisions-2026-11-21.md` | revision record (external referee set) | created 2026-11-21 at `2bfe771`, amended `2ea25a9` (the 41H3 custody tail) | Per-article disposition table for the 2026-11-21 external referee set: 17 revisions applied in place (the 75 DLRT rescope, 41H Thm-B conditional re-bill, 42 title-claim withdrawal, 78 A2′ homogeneity-artifact retraction, …); every finding artifact-verified before applying — no kernel theorem found false, all fixes prose-layer; refute1/ notes for the two reviewer errors (30, 50).
- `research/pilots/41/presolve/` custody archive: `README.md` + `h3_presolve_archive.py` (numpy-only generator/checker, deterministic seed 20261121) + `outputs/` (`host_generators_qspin±1.txt`, `target_tables.txt`, `scan_results.json`, `run_log.txt`) | pre-solve custody settlement — option (a) archive (the 41H3 ship's CERTIFIED-NUMERIC billing kept: never-kernel, never in proved counts; settles the H3-M-candidates "ephemeral by design" gap) | landed 2026-11-21 at `2ea25a9` (orchestrator decision, option (a) over downgrading the billing) | Rebuilt from the record note's formulas only (tauceti `MarkovTrace.lean` cup/cap/generator/rep + `Core.lean` φQ/τ), re-run of record with per-fiber counts + 4 self-checks: S1 census reproduction (24 images/13 dims, 37/14), C1 |det| = 8⁴ = 4096 exact, 20 planted-solution controls per fiber at ~10⁻¹³, and the negative (0 survivors, every class, both fibers).
```

Fold-in (group 4) — extend row 445's first field (rest of the row unchanged), plus a
clause for the desc:

```markdown
- `research/qa/decl_index_v3.py` + `qa/decl-index-v3-manifest.json` + `qa/decl-enrich-v3.tsv` + `qa/decl-index-v3-coverage-vs-v2.tsv` | …
```

(desc, append): `; the coverage TSV = the v2→v3 row audit backing the "covers every live v2 row" claim (AGENTS.md cites it)`.

## Optional accuracy fixes (H's call; not drift)

1. **Row 447 "(not merged)" is stale**: the et-v2 files are in HEAD lineage —
   `e363431` ("decl-index-v3: et-v2 embedding recipe, kept after run 3") is an
   ancestor of HEAD. Suggest replacing "landed 2026-11-21 on branch
   `claude/decl-index-v3-et-v2-893da6` (not merged)" with "landed 2026-11-21 (branch
   `claude/decl-index-v3-et-v2-893da6`, on main at `e363431`)".
2. **Header verification stamp**: the INDEX header still says "partial
   re-verification 2026-11-17 … full bidirectional reconciliation is the close gate".
   When these rows land, refresh the stamp to note the 2026-11-21 full pass
   (1,065 tracked files; 28-file drift reconciled; false-covering classes documented
   above).

## Rows for this chore's own outputs (per the same-commit convention, H's call)

```markdown
- `research/qa/h-scratch-triage-20261121.md` + `h-index-drift-20261121.md` + `h-substrate-note-draft-20261121.md` | H-lane QA chores (post-resume) | landed 2026-11-21 (general helper lane, worktree agent-01) | Carry-scratch triage (4/4 verdicts: runbook superseded-by-protocol, §14 sweep discharged, 2026-11-17 drift listing executed at the iter-4 close, substrate patch dead-with-content-absorbed) + the current drift listing (28 files / 4 groups, ready-to-paste rows) + the user-gated AGENTS.md substrate-note amendment draft (both Modal routes live; doz primary).
```
