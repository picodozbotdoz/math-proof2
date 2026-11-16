# R1 — staged swap-in runbook (articles restructuring; H executes on orchestrator GO; R4 verifies)

Written 2026-11-16 against the **live post-relabel state** (commits `bf99d62` + `20af866`,
R2's fix-side pass). Branch rule (adopted from `qa/closeout-commit-plan-ITER4.md`): every
commit on `dev/iteration4`; never push. Frozen cycle records
(`REPORT-INPUTS-C2.md`, `REPORT.md`, `TRIAGE.md`, `qa/articles-novelty-signoff.md`) are
never rewritten — they get bracketed, dated drift-notes per the convention R2's pass
established ("dated-correction convention on frozen records", commit `20af866`).

## 0. Already executed (do NOT redo) — verified on disk 2026-11-16 22:07

- Article 10 renamed → `research/articles/10-layers-toward-uniform-poly-space-eth-refutation.md`
  (recorded at `research/INDEX.md:168`); README row 10 already leads with "**HEADLINE
  OPEN** — three layers proved…; assembly tranche carried" (`articles/README.md:48`).
- README row 11 contradiction already fixed in the live two-table README (single row now
  carries "Theorem B(ii) TM2 realization **proved** (Cycle 2, on three eth interface
  hypotheses); word-RAM half + M3 open").
- Kind relabels applied to README rows and article status lines (42 terminology fix
  "on-line zero-proportion lower bounds… 'zero-density' … retired"; 30 "project-formulated
  conjecture"; 52 "axiomatization"; 42M4/73 "technical record" parentheticals).
- Consequently: steps below are the REMAINING structural operations. Where
  `r1-fixes-11-73.md` quotes pre-relabel OLD text, the current anchor is given in-step.

Paste sources: **42v2 body** = `qa/iter4-review/r1-rewrite-42v2.md` content after its
`---` separator (drop the proposal header); **50v2 body** = same rule for
`r1-rewrite-50v2.md`; **73 record** = `r1-fixes-11-73.md` §b1.1 text;
**README v2** = `r1-readme-v2.md` §"README v2 (proposed content)" with §D resolutions
applied. `[R3-FILL]`/`[R3-TABLES]` placeholders may ship at swap; they are filled on R3's
tables drain (orchestrator signals).

## STEP 1 — 42v2 replaces 42; 42-M4 file retired

1. Overwrite `research/articles/42-quadratic-dedekind-zeta-zero-proportions.md` with the
   42v2 body (keep the v1 filename — the slug is correct post-terminology-fix).
2. `git rm research/articles/42M4-zetaK-proportions-unconditional-zeta-column.md`.
3. Article 75 sibling refs (live lines re-verified: `:8`, `:208–210`, `:246`): replace
   the byline backtick link `` `42M4-zetaK-proportions-unconditional-zeta-column.md` ``
   with `` `42-quadratic-dedekind-zeta-zero-proportions.md` (v2) ``; in §6 and References,
   "Article 42 / 42-M4" → "article 42 v2 (merged; includes the ζ-column donor swap)".
4. Drift-notes (append inside the existing table cells, dated):
   `research/qa/REPORT-INPUTS-C2.md:256–257` (rows cite `articles/42M4:13,124,125`),
   `research/qa/articles-novelty-signoff.md:103` and `:129` — add
   "[iter4 2026-11-16: 42-M4 merged into article 42 v2; file retired; line refs were to
   the 2026-11-14 text]".

Verify:
- `test ! -f research/articles/42M4-zetaK-proportions-unconditional-zeta-column.md`
- `rg -n "42M4-zetaK" research/articles/` → 0 hits
- `rg -n "erratum 2026" research/articles/42-quadratic*.md` → 0 hits (errata eliminated)
- `rg -n "c540682" research/articles/42-quadratic*.md` → ≥1 (true edit history present)
- `rg -n "supersedes" research/articles/42-quadratic*.md` → ≥1

## STEP 2 — 50v2 replaces 50; 50-M2 file retired

1. Overwrite `research/articles/50-zero-free-regions-cannot-move-certificate-constants.md`
   with the 50v2 body (title changes to "What the 7/8 Half-Plane Buys…"; slug unchanged).
2. `git rm research/articles/50M2-unconditional-strip-confinement.md`.
3. Drift-notes: `REPORT-INPUTS-C2.md:258` ([VERDICT:50-M2-R1] cites `articles/50M2:10,134,143`),
   `:267` ([G7b] cites `articles/50M2:9,132,142`), `:360` — same bracketed note pattern
   ("merged into article 50 v2 as its Part II discharge section; line refs were to the
   2026-11-14 text").

Verify:
- `test ! -f research/articles/50M2-unconditional-strip-confinement.md`
- `rg -n "at donor pin" research/articles/50-*.md` → ≥5 (status rows carry the substrate flag)
- `rg -in "cached Modal|user-approved|run28|g7_layers" research/articles/50-*.md` → 0 hits
  (infrastructure narration gone; ledger pointers only)
- `rg -n "PAPER-ONLY" research/articles/50-*.md` → ≥2 (Part I billing)

## STEP 3 — article 11 in-place integration (from `r1-fixes-11-73.md` §a, re-anchored)

Apply Edits 1–3 to `research/articles/11-call-charged-reduction-calculus.md`. Anchors
against the CURRENT file (R2's pass modified the status line; §7 bullet and addendum are
byte-unchanged — re-verified live: status parenthetical at `:8`; bullet "not attempted
here" at `:118`; addendum header at `:132`):

- **Edit 1 (status block).** OLD anchor now begins "**Status: Milestone 1 PROVED,
  kernel-verified (formal calculus for folklore composition — technical record; the
  acceptance test, not the calculus, is the article's deliverable)** (mathlib
  `ff2494ea`…" and ends "…remain open." Replace the whole block with the fix-sheet NEW
  status table, preserving R2's point as one prose line under it: "The acceptance test,
  not the calculus, is the article's deliverable (technical record, relabeled
  2026-11-16)."
- **Edit 2 (§7 bullet, `:113–118`)** and **Edit 3 (addendum → §8, `:130–134` + trailing
  "Still open" paragraph)**: apply exactly as written in `r1-fixes-11-73.md` §a
  (anchors unchanged).
- Edit 4 (README rows) is subsumed by STEP 5.

Verify:
- `rg -n "Cycle-2 addendum|M2 COMPLETE|A8 formal report" research/articles/11-*.md` → 0 hits
- `rg -n "not attempted here" research/articles/11-*.md` → 0 hits
- `rg -n "tm2_realized_composed" research/articles/11-*.md` → ≥2 (status row + §8)
- `rg -n "^## 8" research/articles/11-*.md` → 1 (integrated section)

## STEP 4 — 73 branch-1 demotion package (from `r1-fixes-11-73.md` §b1)

1. Append the §b1.1 outcome record to
   `research/candidates/73-function-field-hecke-tate.md`.
2. `git rm research/articles/73-formal-tate-dictionary-function-field.md`.
3. Drift-notes: `REPORT-INPUTS-C2.md:253` ([VERDICT:73-C] cites `articles/73:9,116–120`),
   `qa/articles-novelty-signoff.md:100` and `:126` — "[iter4 2026-11-16: article
   demoted to dossier/pilot record (branch-1, R1+R2); line refs were to the article
   text]".

Verify:
- `test ! -f research/articles/73-formal-tate-dictionary-function-field.md`
- `rg -n "Outcome record (2026-11-16)" research/candidates/73-*.md` → 1
- `rg -n "re-article condition|branch 2" research/candidates/73-*.md` → ≥1 (re-entry condition recorded)

## STEP 5 — 21 demotion (R2 package + R3 wording)

1. `git mv research/articles/21-quartic-window-transplant-certified-loss.md
   research/pilots/21-quartic-window-certificate.md` (root-level file, matching the
   existing `pilots/21-milestoneC.md` convention; H may prefer a `pilots/21/` dir —
   either is fine, keep the README row in sync).
2. In the moved file, apply R3's relabel at every mention
   (`r3-verification-integrity.md` §3): status line "CERTIFIED NUMERICALLY…" →
   "CERTIFIED-NUMERIC — computationally certified (external script, not kernel-verified,
   excluded from proved-artifact counts)"; the abstract's "(certified)" marker gains the
   same parenthetical once; §2's "Hence… (certified)" likewise. No other content changes.
3. Append the dossier-02 case-study stub (for the dossier owner) to
   `research/candidates/02-ez5-bandwidth-k-ceiling-laws.md`:
   > ### Case study stub (2026-11-16, article 21 demoted here per R2/R1/orchestrator)
   > The quartic-window certified comparison (ξ′-tuned window does not improve the ζ
   > Theorem-D constant; c⋆(1) − c(1, v_quartic) ≥ 3.87·10⁻⁴) now lives at
   > `research/pilots/21-quartic-window-certificate.md` — computationally certified
   > (external script, not kernel-verified, excluded from proved-artifact counts).
   > Dossier owner: fold as §case-study with any bandwidth-k framing you see fit.
4. README pointer row happens in STEP 6.

Verify:
- `test -f research/pilots/21-quartic-window-certificate.md`
- `rg -c "computationally certified" research/pilots/21-quartic-window-certificate.md` → ≥2
- `rg -n "Case study stub" research/candidates/02-ez5-bandwidth-k-ceiling-laws.md` → 1
- `test ! -f research/articles/21-quartic-window-transplant-certified-loss.md`

## STEP 6 — 10 cross-ref drift-notes (rename already done)

Add the dated drift-note (no rewrites) to the four coupled records (R4's coupling list,
line-verified live):
- `research/qa/REPORT-INPUTS-C2.md:259` ([VERDICT:10-L2]; cites `articles/10:13,114,116,136`)
- `research/qa/REPORT-INPUTS-C2.md:361` ("10 uniform-ETH" row)
- `research/REPORT.md:369` (10-L2 `PolyTVal` row; also `:358` cited from :259)
- `research/TRIAGE.md:349–356` ([VERDICT:10-L2] tail + empirical-cost-ledger rows for
  10-L1/10-L2)

Note text: "[iter4 2026-11-16: article renamed
`10-layers-toward-uniform-poly-space-eth-refutation.md` (INDEX.md:168); line/LoC refs
were to the pre-rename text; counts corrected by R3 §4 F4 where cited]".

Verify: `rg -c "iter4 2026-11-16" research/qa/REPORT-INPUTS-C2.md research/REPORT.md research/TRIAGE.md` → ≥4 total across the three files.

## STEP 7 — README v2 replacement

Replace `research/articles/README.md` wholesale with the v2 content
(`r1-readme-v2.md` §"README v2 (proposed content)", §D resolutions applied: counts line
"FINAL, orchestrator-ratified 2026-11-16 — 5 / 7 / 4 + 3 relocated"; alternate STRUCK;
§C carries the 10-keeps-article-status note and 21/50-M2/42-M4 resolved rows). While
pasting, carry over the live README's relabeled kind phrasings where they are better than
the v2 skeleton's (specifically: row 42's terminology note "'zero-density' = N(σ,T)
bounds — wrong term, retired"; row 30's "project-formulated conjecture"; row 52's
"axiomatization + ε-universal dual-family lemma (formal-first)"; row 20's "conditional
interface (engine seam) + knowledge-level seam analysis"; row 50's "source-verified
structural observation…"). Delete both old tables and the stale main-run prose paragraph
("…so it has no article yet").

Verify:
- `rg -n "no article yet" research/articles/README.md` → 0 hits (the audit's README BLOCKER closed)
- `rg -n "Discovery-grade|Technical records|Notes, certificates" research/articles/README.md` → 3 section headers
- `rg -n "FINAL, orchestrator-ratified" research/articles/README.md` → 1
- `rg -n "machine realizations open" research/articles/README.md` → 0 hits
- Every `](NN-…\.md)` link target in the new README exists on disk (`rg -o "\]\(([^)]+\.md)\)" -r '$1' | sort -u` + `test -f` each).

## STEP 8 — final sweep (R4 verifies after H's GO execution)

1. Dangling-slug sweep: `rg -n "42M4-zetaK|50M2-unconditional|73-formal-tate|21-quartic-window-transplant|10-uniform-poly-space-eth-refutation" research/ --glob '!qa/iter4-review/**' --glob '!INDEX.md'` → every remaining hit must be inside a dated drift-note or a historical cycle record; any live-index hit is a defect.
2. Article-set census: `ls research/articles/*.md | wc -l` → 15 article files + README + TEMPLATE-iter4 (17 files, down from 19 incl. TEMPLATE).
3. Status-vocabulary sweep on the two new articles: `rg -n "Status: PROVED" research/articles/42-*.md research/articles/50-*.md` → 0 hits (old dialect gone; template status rows instead).
4. Commit shape: one commit per step (or H's batching) on `dev/iteration4`, message prefix "Iter4 articles restructure (R1 runbook step N): …"; never push.
5. R4 re-runs this runbook's per-step greps and signs the result into
   `qa/iter4-review/00-DIGEST.md`.

## Deferred (explicitly out of this runbook's scope)

- 22-T2b closure-note relocation (→ dossier 22 / survey) and 52 physlib-addendum
  relocation (→ `novelty/physlib-surface.md` standing notes) — agreed in README v2 §C,
  scheduled with their owning dossiers, not with the article swap.
- 73 branch-2 (post-Q4 rewrite) — blocked on Q4; see `r1-fixes-11-73.md` §b2.
- `[R3-TABLES]` fills in `r1-rewrite-42v2.md` (3 slots) and `r1-rewrite-50v2.md` (2
  slots) — on R3's `r3-verification-tables.md` drain; orchestrator signals the re-task.
- TEMPLATE-iter4 gate enforcement for NEW iteration-4 articles (R9's plan §3 integrates
  it) — nothing to execute here.
