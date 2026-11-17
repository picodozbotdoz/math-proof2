# A9 — G5 gate dry-run (template compliance, mid-wave class; 2026-11-17)

Lane A9. Scope: TEMPLATE-iter4 §9's twelve hard rules run per-article over the current
shipping state — the 12 article files of this worktree (agent-10, post depth-pass) +
A3's landed 22/71 v2s (read in the main checkout, read-only; their flip lines and
PASS×5 grades are on record in `a9-corpus-compliance.md`). Method: the template's own
section-presence loop executed mechanically this session (kind-tag grep; header
status-table grep; abstract word count by exact line range; novelty-table row count;
bracketed-errata scan; addendum/closure-note section scan; infra-token scan) — not a
re-read of the compliance table. Evidence below cites the measured values.

**Findings found AND fixed in this pass** (the dry-run is dated after them):

- **F-1 [box 4] — three abstracts over 200 words** (measured before the pass):
  article 10 at 228, article 30 at 216, article 32 at 231. Fixed by trims that remove
  no claim (post-fix counts: 10 = 200, 30 = 199, 32 = 200; all theorem content,
  statuses, scope qualifiers and nearest-prior mentions preserved — 30's trim even
  added the kernel-checked-vs-paper split the README bills).
- **F-2 [box 7] — article 52 carried an append-only section**: the dated 2026-11-14
  nearest-neighbor addendum. Folded into §6's third table row (revise-not-append),
  with a tombstone note at the former position and a change-log line. No other
  addendum/closure-note section exists in the corpus (scan: 14/14 clean post-fix).

## Per-article §9 verdicts (in-file rules 1–10 and 12; box 11 is splice-time by construction)

| # | 1 kind | 2 title | 3 status rows | 4 abstract | 5 novelty | 6 no bracketed errata | 7 no addendum | 8 formal record | 9 vocab | 10 cites | 12 supersession | verdict |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 01 | ✓ DISCOVERY | ✓ | ✓ 3 rows | ✓ 145 w | ✓ 6 rows | ✓ | ✓ | ✓ | ✓ | ✓ (8+ this session) | ✓ | **PASS** |
| 10 | ✓ TECHNICAL-RECORD | ✓ | ✓ OPEN row + 4 layers | ✓ 200 w (F-1 fix) | ✓ 3 rows | ✓ | ✓ | ✓ | ✓ | ✓ (7 groups) | ✓ | **PASS** |
| 11 | ✓ TECHNICAL-RECORD | ✓ | ✓ 4 rows, binders listed | ✓ 155 w | ✓ 3 rows | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | **PASS** |
| 20 | ✓ TECHNICAL-RECORD | ✓ | ✓ 4 rows (header) | ✓ 186 w | ✓ 4 rows | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ (supersedes noted) | **PASS** |
| 22 | ✓ TECHNICAL-RECORD (A3) | ✓ | ✓ (A3 flip line) | ✓ 197 w (main) | ✓ 11 rows (main) | ✓ | ✓ (note relocated by A3) | ✓ | ✓ | ✓ | ✓ | **PASS** (A3's v2) |
| 30 | ✓ DISCOVERY | ✓ | ✓ 7 rows, PAPER-ONLY split | ✓ 199 w (F-1 fix) | ✓ 3 rows | ✓ | ✓ | ✓ | ✓ | ✓ (7 groups) | ✓ | **PASS** |
| 32 | ✓ DISCOVERY | ✓ | ✓ 7 rows incl. run-12 | ✓ 200 w (F-1 fix) | ✓ 8 rows | ✓ | ✓ | ✓ (with the disclosed lemma cell) | ✓ | ✓ (11 groups) | ✓ | **PASS** |
| 42 | ✓ DISCOVERY-CONDITIONAL | ✓ | ✓ 5 rows | ✓ 175 w | ✓ 5 rows | ✓ | ✓ | ✓ | ✓ | ✓ (R1 audit + self-check) | ✓ | **PASS** |
| 50 | ✓ NEGATIVE (technical record) | ✓ | ✓ 6 rows incl. at-donor-pin | ✓ 190 w | ✓ (§8) | ✓ | ✓ | ✓ | ✓ | ✓ (R1 audit + self-check) | ✓ | **PASS** |
| 52 | ✓ TECHNICAL-RECORD | ✓ | ✓ 5 rows | ✓ 181 w | ✓ 3 rows | ✓ | ✓ (F-2 fix: addendum folded) | ✓ | ✓ | ✓ | ✓ | **PASS** |
| 71 | ✓ FORMALIZATION-FIRST (A3) | ✓ | ✓ (A3 flip line) | ✓ 187 w (main) | ✓ 18 rows (main) | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | **PASS** (A3's v2) |
| 72 | ✓ TECHNICAL-RECORD | ✓ | ✓ 9 rows (header) | ✓ 196 w | ✓ 8 rows | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | **PASS** |
| 75 | ✓ DISCOVERY-CONDITIONAL | ✓ | ✓ 8 rows | ✓ 194 w | ✓ 5 rows | ✓ | ✓ | ✓ (closure-evidence current per A1 F1) | ✓ | ✓ (self-check + A1 pre-check) | ✓ | **PASS** |
| 78 | ✓ NEGATIVE | ✓ | ✓ 3 rows, binders empty | ✓ 181 w | ✓ 6 rows | ✓ | ✓ | ✓ | ✓ | ✓ (self-check) | ✓ | **PASS** |

**Box 11 (README row in the same commit)** — the one rule that cannot be satisfied in
a worktree: it is by construction a splice-time item owned by H. State at dry-run:
rows 32, 22, 71 already landed by H in the main checkout (verified consistent with
the v2 articles); row 78 drafted (A9, awaiting H); **two drift rows for H's same-commit
fixes — see the sweep below**. All other rows' status vocabulary matches their
articles' header rows.

## The disclosed evidence cells (the honest excerpt class — not gate failures)

Three cells cite stage/verdict-level evidence because the persisted logs are
head/tail-excerpted at exactly those declarations; each names its mitigation in-row:

1. **32, Thm 4** `lt_Rc_iff_gmax` — stage verdict `axcheck-final.log:618` (22 axiom
   lines, 0 sorryAx; section persists 16 of 22); the wave-2 full-coverage re-run is
   the print of record (32-M1 staged in the sweep plan's §7b(ii) list).
2. **01, ported spine** — headline decls print-persisted at the cited lines; the
   spine (`rank_trace_ineq`, `vonNeumann_trace_ineq`) at stage-verdict level (12-of-42/41
   persisted), qualifier in the §5 axioms row.
3. **20, `assemble_eps`** — main-run in-stage + C2 sweep verdict (38 axiom lines, 0
   sorryAx), disclosed in the header row and §5.

## README-consistency sweep (14 rows vs article header rows)

| row | state | action |
|---|---|---|
| 01, 11, 20, 30, 52 | status vocabulary matches the articles' header rows | none |
| 42, 50 | H-landed v2 rows, consistent (R1 swap-in runbook) | none |
| 32, 22, 71 | H-landed v2 rows in main (32's carries the crossing discharge; 22/71 A3's kinds), consistent | none |
| 78 | drafted by A9 this session (marked "H lands with counts re-ratified") | H lands at splice |
| **10** | **DRIFT**: both trees' rows still say "assembly tranche D1–D6 carried to Iteration 4" — the D1 counter padding machine landed 2026-11-17 (plumbing billing) and the article now carries its row | **H: same-commit fix** — status cell should read e.g. "M1/L1/L2 + tranche D1 PROVED-UNCONDITIONAL as layers (D1 plumbing, landed 2026-11-17); **headline OPEN**; D2–D6 carried" |
| **75** | **DRIFT**: row still in v1 one-tier wording (no two-tier structure, no Dirichlet-column-discharge-audited note, N2 still "carried" — which remains true) | **H: same-commit fix** — flagged since the 75 v2 self-audit (box 11 PENDING, owner H); the two-tier wording is in the article's own status table |

## Aggregate verdict

**G5 PASSES at dry-run, 14/14 articles, every in-file rule (1–10, 12) checked with
measured evidence; the single outstanding rule class is box 11 (README same-commit),
which is splice-time by construction, with exactly two named drift rows (10, 75) for H
and one drafted row (78) to land.** The three disclosed evidence cells are the
record's honest excerpt class, each with in-row mitigation. The two dry-run findings
(F-1 abstract lengths ×3, F-2 append-only section ×1) were found and fixed within
this pass — the gate re-run at splice should find them closed.

— Lane A9, 2026-11-17. Files changed in this pass: `articles/10-…md`, `articles/30-…md`,
`articles/32-…md` (abstract trims), `articles/52-…md` (addendum fold), this file. No
commits (H commits). The gates file is A1's — not touched here.
