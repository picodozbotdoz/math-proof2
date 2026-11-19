# A7/R7 — article-41 splice package (paste-ready; pre-staged for the orchestrator's post-R2 signal)

Lane R7 (A9 lineage), 2026-11-19. Purpose: make the article-41 splice MECHANICAL. The
ship-gate chain (per the batch-6 record, main `35bd210`): R9's 41-battery **FINAL
§LANDING** (S1–S4 PASS; "this appendix is the novelty table's source") → R2's S1–S4 pass
(consumes L1–L3) → the orchestrator's splice signal → H applies THIS package in ONE
commit (the box-11 rule). Byte anchors verified against main @ `35bd210` this session;
the article = worktree agent-10 `research/articles/
41-parallelogram-defect-deformation-eight-square.md`, DRAFT-final v0.3, sha256(16)
`f068d9aef70d3a36`, 294 LoC.

**Shas of record**: article v0.3 `f068d9aef70d3a36` (pre-flip base; the §2.4 flips land
inside the splice commit); Core.lean GREEN bytes `921bc43cbd06d252` (core-run9 fired
bytes = the verdict of record) vs on-disk tree `733b4a2d93a84689` (comment-only delta,
both documented in-file + in the run-9 provenance header — H stamps the COMMITTED
bytes' sha in §6 of the article); novelty source `novelty/round6-41-battery.md` FINAL
(235 LoC, §LANDING appendix).

## 1. README edits (`research/articles/README.md`) — exact paste-ready blocks

### 1a. Counts line (§ header, lines 3–5)

Current exact text (byte-verified at `35bd210`):

```
Honest counts — **FINAL, orchestrator-ratified 2026-11-18**: **6 discovery-grade**
(01, 30, 32, 42, 75, 78 — 75 conditional, 78 NEGATIVE-kind per the orchestrator
ruling) · **7 technical records & formalizations** · **4 notes/certificates (1 pending
a branch decision)** + 3 relocated notes — down from 17 article files for both cycles.
```

Replace with (splice date = the splice commit's date, H's fill per the D.1
dated-correction convention; the 2026-11-18 ratification line governed the iter-4 close):

```
Honest counts — **FINAL, orchestrator-ratified <splice-date>**: **7 discovery-grade**
(01, 30, 32, 41, 42, 75, 78 — 75 conditional, 78 NEGATIVE-kind per the orchestrator
ruling; 41 the first iteration-5 shipment, kind DISCOVERY ruled 2026-11-19, quota-free)
· **7 technical records & formalizations** · **4 notes/certificates (1 pending a branch
decision)** + 3 relocated notes — down from 17 article files across iterations 1–4.
```

("down from 17 across iterations 1–4" — with 15 live files after the splice the phrase
stays true and stops drifting; the technical/notes counts are unchanged per the task.)
If R2's pass lands AFTER the iter-4 close summary was typeset, the close-summary prose
is NOT touched by this splice (iter-5's own summary carries the 7-count forward).

### 1b. Row 41 (§A table; slots BETWEEN rows 32 and 42 — numeric order)

Paste-ready row (single table line):

```
| 41 | [A q-Deformation of the Eight-Square Sign Rule: the Unified Parallelogram-Defect Identity and the Bitwise-Complement Stratum](41-parallelogram-defect-deformation-eight-square.md) | new theorem (the unified defect identity A + B = (1−q)·GqGen at every parallelogram quad + the antipodal stratification p′ = ¬p + off-stratum q-rigidity); first iteration-5 shipment — kind DISCOVERY per the orchestrator ruling 2026-11-19, quota-free | Thms 1–5 PROVED-UNCONDITIONAL (`Core.lean` core-run9: 30 top-level decls triad-or-leaner, four at zero axioms; the P1/P2/universal-form/N′ refutations enter as decide-certified components, never the headline); the (H) TL/Jones host bridge is a separate article if it lands |
```

## 2. Box-11 splice-commit checklist (the a9-splice-readme-checklist convention — ONE commit, H-owned)

| # | item | exact content | owner |
|---|---|---|---|
| 1 | **Article file lands** | `research/articles/41-parallelogram-defect-deformation-eight-square.md` from worktree agent-10 (base `f068d9aef70d3a36` + the item-4 flips applied in-commit) | H |
| 2 | **README row + counts line** | §1b row + §1a counts, same commit (box-11; the 78 same-commit landing `b98f8bc` is the exemplar, the 75 one-late `37a2637` the anti-pattern) | H |
| 3 | **INDEX row** | §3 below, appended at the articles block tail (after the :288 row-78 entry) | H |
| 4 | **The article's PENDING flips** (named in its §7/§9; all in-commit) | (i) delete the DRAFT-FINAL NOTE block; (ii) §4 refresh from `round6-41-battery.md` FINAL §LANDING (the battery's 7-row table + the EMPTY class row are the source; fold S3's honesty sentence — "elementary proof, nonelemental statement" — into §1's headline paragraph or §4's scope note per R2's pass); (iii) abstract word-count finalize (≤ 200; delete the draft note); (iv) §6 sha stamps: the COMMITTED Core.lean bytes' sha256(16) + the axcheck/sweep extract line per the D.4 discipline; (v) §9 box-11 flips to SATISFIED with the splice-commit sha; (vi) artifacts line: "R4's bytes on worktree agent-08, H commits post-K" → the committed state | H (R7 on signal if re-tasked) |
| 5 | **R2-pass riders** | if R2's S1–S4 pass carries L1–L3 notes, they ride the same commit (the battery §LANDING's consumption rule) | H |
| 6 | **Cross-file guards** | no other file touches: the watchlist (`qa/iter4-review/a9-iter5-article-watchlist.md` §2) is NOT edited at splice — its arithmetic note (discovery share 6/14 ≈ 43% → 7/15 ≈ 47%) is cited by the iter-5 close summary, not rewritten; dossier-41 already carries its correction fold (batch 6) | H |

## 3. INDEX row (paste-ready, `research/INDEX.md` articles block tail)

```
- `research/articles/41-parallelogram-defect-deformation-eight-square.md` | article (Iter-5) | SPLICE <splice-date> (R7/A9-lineage; drafted through TEMPLATE-iter4; DRAFT-final v0.3 held for R2's pass; core GREEN core-run9, fired bytes `921bc43cbd06d252`) | **Kind DISCOVERY (orchestrator ruling 2026-11-19; quota-free — never consumes the N=1 slot)**: the unified parallelogram-defect identity A + B = (1−q)·aeval(GqGen) at every parallelogram quad for the q-deformed eight-square sign rule, plus the antipodal stratification (gap odd ⟺ q₁⊕q₂ = 111 ⟺ p′ = ¬p bitwise) and off-stratum q-rigidity — all PROVED-UNCONDITIONAL (Core.lean, 30 top-level decls triad-or-leaner, four at zero axioms; run-of-record core-run9; the runs-4–8 universe-churn budget disclosure carried in-article §6); the P1/P2/universal-form/N′ refutations decide-certified as components (the article-30 pattern); novelty per `novelty/round6-41-battery.md` FINAL §LANDING (S1–S4 PASS); headline wording locked: first sign-rule/parallelogram-defect deformation, never "first q-deformation of a composition algebra" (Benkart–Pérez-Izquierdo 1998 owns the object level); README §A row-41 + counts 6→7 land in the same commit.
```

## 4. The article's §9 final self-audit (all 12 boxes, one line each — splice-day state)

| # | rule | final state |
|---|---|---|
| 1 | kind is a §0 article kind | PASS — DISCOVERY, ruled 2026-11-19, quota-free (the ruling recorded in the front matter) |
| 2 | title free of project-internal tokens | PASS — "A q-Deformation of the Eight-Square Sign Rule: the Unified Parallelogram-Defect Identity and the Bitwise-Complement Stratum" |
| 3 | status rows, closed vocabulary, binders listed | PASS — every row PROVED-UNCONDITIONAL, binder inventory NONE throughout |
| 4 | abstract ≤ 200 words, all five elements | PASS at splice — word count finalized in-commit (item 4iii) |
| 5 | novelty table ≥ 2 rows, scoped "first" | PASS — 7 nearest-miss rows + the EMPTY defect/skein class row, refreshed from the battery FINAL §LANDING (item 4ii) |
| 6 | no bracketed errata | PASS — the erratum story is §1 prose, told once |
| 7 | no section contradicts another | PASS — §3 certificates subordinate to the shipped theorem; §7 carries no residue |
| 8 | formal record table-only, no infra narration | PASS — the run-of-record table is the disclosed budget-evidence class (named in-block, the honest-disclosure precedent) |
| 9 | internal vocabulary ≤ 3 glosses | PASS — "eth corpus", "dossier", "battery" glossed at first use |
| 10 | citations spot-checked (5+) | PASS at splice — re-verified against the committed tree (donor file:line, log paths, the sha pair) |
| 11 | README row updated in the same commit | SATISFIED in the splice commit (§1a+§1b; this package) |
| 12 | superseded files marked | n/a — supersedes none (the draft forms it corrects are dossier/pre-charter records, not articles) |

## 5. Open dependency + date conventions

- **The one open gate**: R2's S1–S4 pass (the battery §LANDING's consumption rule). On
  its landing + the orchestrator's signal, H executes §1–§4 as ONE commit; nothing here
  pre-empts it.
- Date fills: `<splice-date>` = the splice commit's date (never memory —
  `git show -s --format=%cs` on the splice commit).
- If the committed Core.lean bytes differ from both shas of record (a further R4 edit),
  item 4iv stamps the committed bytes and cites the delta; the verdict of record
  (core-run9) is superseded only by a later GREEN run's log line.

— Lane R7 (A9 lineage), 2026-11-19, worktree agent-10 (this file + the article draft are
the lane's splice-side surface; H applies on signal). No commits (H commits).
