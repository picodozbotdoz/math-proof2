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

## STEP 4b — article 75 gains the Bansal–Maji nearest-miss citation (R7 relay, post-GO)

Small content edit to `research/articles/75-abelian-assembly-zetaL-proportions.md`
(anchors re-verified live: §1 nearest-prior sentence at `:48`; §6 DLRT bullet at `:211`;
file touched by R2's relabel pass — anchor on the quoted text, not line numbers):

1. §1, append to the sentence beginning "The nearest prior result we found is
   de Laat–Rolen–Tripp–Wagner…" one clause: "and, beyond DLRT, the unconditional
   on-line *infinitude* of Bansal–Maji (arXiv:2507.18121) — infinitude, not proportion".
2. §6, add a bullet after the DLRT bullet:
   "- **Bansal–Maji, arXiv:2507.18121:** infinitely many on-line zeros of ζ_F, for every
   number field F, unconditional — Hardy-type infinitude without a proportion statement;
   the exact nearest-miss boundary for the proportion statements claimed here (an
   infinitude theorem cannot feed Theorem A's component hypotheses; a proportion theorem
   would)."
3. References list: add the arXiv entry.

Cite-card slot: full authors/title/theorem number from R7's `r7-bib-cards.md` when it
lands — **[R7-CITE]**; the arXiv id and the scope above are from R2's §5 q2 sweep and
R7's relay, safe to print now.

Verify:
- `rg -c "2507.18121" research/articles/75-*.md` → ≥3 (§1, §6, References)
- `rg -n "infinitude, not proportion" research/articles/75-*.md` → 1
- `[R7-CITE]` resolved or explicitly carried by R7 at R4's sign-off.

## STEP 4c — article 20 split (R2's `r2-rewrite-20.md`, adopted §8 REWRITE-FULL; cross-review `r1-review-r2-rewrites.md` §A)

1. Create `research/articles/20-engine-seam-interface.md` from `r2-rewrite-20.md`
   Part 1, WITH the cross-review's splice conditions: per-theorem status rows in the
   closed vocabulary (R3 tables §4: `instantiate_family_A/B/C`, `assemble_eps`,
   `family_merge` PROVED-CONDITIONAL; `merged_mult_of_common` PROVED-UNCONDITIONAL),
   §6 converted to the nearest-miss table format, count corrected to 28 public
   theorems / 582 LoC, no run histories in §5's evidence cells.
2. Create `research/pilots/20-seam-analysis.md` from Part 2 (the note carries the old
   Theorem 5 + Discussion, billed PAPER-ONLY + knowledge-level; `SharedMass` /
   `CommonZeroControl` definitions move WITH it).
3. `git rm research/articles/20-common-zero-seam-dedekind-zero-density.md` (or keep the
   filename for the new article if H prefers no rename — then mark the 2026-11-09
   edition superseded at top; either way the cross-ref sweep below runs).
4. Cross-ref sweep: article 75 §7.4 (negligibility-form pointer, live anchor
   "conjecture-grade status of the common-zero hypothesis" cites `pilots/20-hCZ-NOTE.md`
   — add the seam-note pointer); TRIAGE rows 20/42/75 (dated drift-note convention);
   42v2's seam pointer already targets `pilots/20-seam-analysis.md` (pre-fixed in
   `r1-rewrite-42v2.md` §5/§8). README row handled by STEP 7 (v2 §B row 20 is the
   split form).

Verify:
- `test -f research/articles/20-engine-seam-interface.md && test -f research/pilots/20-seam-analysis.md`
- `rg -n "Theorem 5" research/articles/20-engine-seam-interface.md` → 0 hits (Thm 5 lives only in the note)
- `rg -n "SharedMass|CommonZeroControl" research/articles/20-engine-seam-interface.md` → 0 hits (defs moved with it)
- `rg -n "20-seam-analysis.md" research/articles/ research/qa/iter4-review/r1-rewrite-42v2.md research/articles/README.md` → ≥3 (note pointer present in 42v2 + README + the new article's companion line)
- `rg -n "PROVED (conditional interface)|All 27 theorems" research/articles/20-engine-seam-interface.md` → 0 hits (old dialect/stale count not carried)

## STEP 4d — article 72 in-place refocus (R2's `r2-rewrite-72.md`, adopted §8 REWRITE-FULL; cross-review `r1-review-r2-rewrites.md` §B)

1. Replace `research/articles/72-renyi-monotonicity-nogo-gate.md` content from
   `r2-rewrite-72.md` (filename may stay; H may prefer `72-renyi-fence-kuwahara.md`
   with an S–M slug sweep), WITH the cross-review's splice conditions:
   - **title decision pending orchestrator** (divergence #1 in the cross-review):
     R1 recommends dropping "(with the Family-265 Interface Layer)" — keep "family-265"
     only in §5 body with a gloss; do not execute this step before the ruling;
   - abstract trimmed to ≤ 200 words (measured 306; cut the §7-duplicated
     approximate-projector trade-off detail);
   - per-theorem status rows from R3 tables §3 (N1/N2a/N2b PROVED-UNCONDITIONAL;
     N3a/N3b PROVED-CONDITIONAL on hKL + hBnd + hArea; M1 links 1–3
     PROVED-UNCONDITIONAL; link 4 / interface theorem NOT an article claim);
   - §6 evidence cells filled from R3 tables §3 (`axcheck-run1.log:24–28` public,
     `:34+` private, `m1-axcheck-final.log:82–83`, sweep rows) — no descent
     trajectories;
   - preserve the fold's load-bearing items verbatim (cross-review §B list): d ≥ 2
     scope everywhere, the approximate-projector vs boundary-linear-no-go distinction,
     the attribution sentence, hKL as a named binder, `[R7-CITE]` slots.
2. README row handled by STEP 7 (v2 §B row 72 is the reconciled form; its "pending
   orchestrator confirm" note drops once the title ruling lands).

Verify:
- `rg -c "R3-FILL" research/articles/72-*.md` → 0 (filled at splice)
- `rg -n "d ≥ 2" research/articles/72-*.md` → ≥3 (status/§1/§7)
- `rg -n "The refutation is his" research/articles/72-*.md` → 1 (attribution preserved)
- `rg -n "descent|→0 over" research/articles/72-*.md` → 0 (no run histories)
- abstract word count `sed -n '/^## Abstract/,/^## 1\./p' … | wc -w` ≤ 200

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

1. Dangling-slug sweep: `rg -n "42M4-zetaK|50M2-unconditional|73-formal-tate|21-quartic-window-transplant|10-uniform-poly-space-eth-refutation|20-common-zero-seam" research/ --glob '!qa/iter4-review/**' --glob '!INDEX.md'` → every remaining hit must be inside a dated drift-note or a historical cycle record; any live-index hit is a defect. (If STEP 4d renames 72, add `72-renyi-monotonicity-nogo-gate` to the list.)
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
