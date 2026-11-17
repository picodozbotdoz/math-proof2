# A9 — corpus template-compliance gap table + v2-upgrade queue (2026-11-17)

Lane A9 (articles editorial/gate). Scope: every article of the restructured corpus
against `research/articles/TEMPLATE-iter4.md`'s hard rules, at the worktree @ 53c1548
tree **including this session's edits** (article 75 v2; 52/11 header modernizations;
the orchestrator-GO'd article-01 template upgrade; article-32 v2 on A6's run-12
discharge relay — the 01/32 rows and the tally reflect the upgraded files).
Cells were read from the files this session; every verdict carries file:line evidence.

**Rows = 15**: the 13 live article files in `research/articles/` + the 2 relocated
items the README tracks (21, 73), which are no longer articles and whose rows record
that fact only (cells n/a).

**Columns** (the template's hard rules; grading):

- **kind** — template §1 front matter with a §0 kind tag. PASS = `*kind: …*` byline;
  PARTIAL = kind stated but not in the front-matter shape (mid-byline); FAIL =
  pre-template byline (typically with a house status line).
- **status rows** — per-theorem status rows in the closed four-string vocabulary,
  header position. PASS = table at the header, closed strings only; PARTIAL = closed
  strings present but out of placement (§5/§6) or with non-vocabulary rows; FAIL =
  prose status line only.
- **novelty table** — §4-style nearest-miss table, ≥ 2 rows. PASS/PARTIAL/FAIL.
- **verification blocks** — per-theorem verification: R3 §5 blocks or the §6-format
  formal-record table with per-theorem axioms + log lines. PARTIAL = evidence
  tables/paths present but without per-theorem status/lines in the template shape.
- **no infra narration** — §5/§6 free of run histories, error trajectories, diffstats,
  Modal/CPU stories. PARTIAL = isolated process clauses.

## The table

| # | article | kind | status rows | novelty table | verification blocks | no infra narration |
|---|---|---|---|---|---|---|
| 01 | `01-inertial-defect-master-identity.md` | PASS `:3–9` (2026-11-17 upgrade: kind DISCOVERY) | PASS `:11–15` 3 rows, closed strings, sweep-log cites verified on disk | PASS `:189–206` 5-row table + scope statement | PASS `:171–187` §5 evidence row `:181` re-pointed to exact print lines; status rows carry per-theorem lines | PASS `:183–187` fix-cycle narration removed 2026-11-17 |
| 10 | `10-layers-toward-uniform-poly-space-eth-refutation.md` | FAIL `:3–7` | FAIL `:9` prose status (OPEN-leading per R2 A1, but not closed-vocab rows) | FAIL `:193` §7 prose | PARTIAL `:179–190` per-file table w/ logs + triad + honest coverage note | PASS (`:189` coverage note is honesty, not narration) |
| 11 | `11-call-charged-reduction-calculus.md` | PASS `:3–6` (2026-11-17 header pass) | PARTIAL `:9–16` closed strings, but `:15–16` "open — not attempted" rows outside the vocabulary | FAIL `:117` §6 prose | PARTIAL `:9–14` status-row prints + `:106` §5 decl table; no R3 §5 blocks | PASS |
| 20 | `20-engine-seam-interface.md` | PARTIAL `:3–4` kind mid-byline ("· kind: TECHNICAL-RECORD …"), not front matter | PARTIAL `:102–110` closed-vocab rows at §5, not header position | PASS `:117–123` 4-row table (zeta23 / Alpöge–Furman / 42-v2+75 / moved-to-note) | PARTIAL `:102–110` rows w/ log lines; no binder inventories | PASS |
| 22 | `22-pnt-psi-form-from-mathlib-wiener-ikehara.md` | FAIL `:3–5` | FAIL `:7–10` house line (with the honest "formalization result" framing) | FAIL `:72` §4 prose | PARTIAL `:58–66` | PASS — but `:99` carries an append-only "Cycle-2 closure note" section (template: revise, never append; README already flags it as destined for dossier 22) |
| 30 | `30-boson-operators-second-difference-closed-form.md` | FAIL `:3–5` | FAIL `:8–11` house line (PAPER-ONLY moment-identity split embedded in prose) | FAIL `:164` §6 prose | PARTIAL `:144–161` | PASS |
| 32 | `32-rc-savings-frontier.md` | PASS `:3–13` (v2 2026-11-17: kind DISCOVERY + discharge) | PASS `:15–23` 7 rows, closed strings, run-12/sweep cites verified on disk (Thm 4's print counter-only, disclosed in-row) | PASS `:174–185` 3-row table + scope statement | PASS `:136–172` §5 table + discharge paragraph + amendment note; per-theorem log lines | PASS (v1's error-descent line removed at v2) |
| 42 | `42-quadratic-dedekind-zeta-zero-proportions.md` | PASS `:3–8` (v2, R1 rewrite) | PASS `:10–16` 5 rows, closed strings, verbatim binders | PASS `:130–144` 5 rows + scope paragraph | PASS `:174–190` §6 table, per-theorem lines | PASS (one ledger-pointer sentence, permitted) |
| 50 | `50-zero-free-regions-cannot-move-certificate-constants.md` | PASS `:3–8` (v2, R1 rewrite) | PASS `:10–17` incl. "at donor pin" qualifier | PASS `:158` §8 table | PASS `:129` §6 + status-row evidence cells | PASS (self-check `:176`) |
| 52 | `52-statistics-universal-occupation-calculus.md` | PASS `:3–9` (2026-11-17 header pass) | PASS `:11–20` 5 rows, closed strings (this session) | FAIL `:135` §6 prose + `:165` dated addendum; no table | PARTIAL `:117–133` §5 decl table without per-theorem log lines (lines now in the status rows) | PARTIAL `:132` retracted-blocker process note |
| 71 | `71-splane-zeta-curve-dictionary.md` | FAIL `:3–7` byline incl. "FINAL" | FAIL `:8–10` "PROVED, FINAL." — the exact pattern the R1 audit named unparseable | FAIL `:169` §6 prose | PARTIAL `:154` | PASS |
| 72 | `72-renyi-monotonicity-nogo-gate.md` | PARTIAL `:3–4` kind mid-byline | PARTIAL `:156–164` closed-vocab rows w/ log lines, at §6 not header | PASS `:178–188` 8-row attribution table | PARTIAL `:156+` rows w/ lines; no binder inventories | PASS |
| 75 | `75-abelian-assembly-zetaL-proportions.md` | PASS `:3–8` (v2, this session) | PASS `:10–19` 8 rows, closed strings, "at donor pin" on the donor row | PASS `:271–286` 5 rows + scope paragraph | PASS `:344–448` §6 table + R3 §5 blocks (the charter format) | PASS (self-check `:520`) |
| (21) | relocated: `pilots/21-quartic-window-certificate.md` (dossier-02 case study) | n/a — not an article since the 2026-11-16 demotion (README §C) | n/a | n/a | n/a | n/a |
| (73) | relocated: `candidates/73-function-field-hecke-tate.md` outcome record | n/a — not an article since the 2026-11-16 demotion (README §C); re-article condition = runbook-file branch 2 | n/a | n/a | n/a | n/a |

## Tally (13 live articles; updated 2026-11-17 after the article-01 and article-32 upgrades)

| rule | PASS | PARTIAL | FAIL |
|---|---|---|---|
| kind tag | 7 (01, 11, 32, 42, 50, 52, 75) | 2 (20, 72) | 4 (10, 22, 30, 71) |
| status rows (closed vocabulary) | 6 (01, 32, 42, 50, 52, 75) | 3 (11, 20, 72) | 4 (10, 22, 30, 71) |
| novelty table ≥ 2 rows | 7 (01, 20, 32, 42, 50, 72, 75) | 0 | 6 (10, 11, 22, 30, 52, 71) |
| verification blocks | 5 (01, 32, 42, 50, 75) | 8 (all others) | 0 |
| no infra narration | 12 | 1 (52) | 0 |

Fully compliant (5/5 PASS): **01, 32, 42, 50, 75**. Non-compliant on ≥ 3 rules: **10,
22, 30, 71** — Cycle-2 originals never touched by the R1/R2 rewrite sets.

## Ranked v2-upgrade queue (feed for orchestrator slotting)

Ranked by (a) discovery-grade exposure (§A rows face external readers and the KPI
first), (b) gap count/severity, (c) whether an edit is already chartered. Effort
classes are edit-session sizes, not Lean work.

1. **30 — per-theorem status split the README already bills.** The kernel-checked
   (refutation, closed form) vs PAPER-ONLY (general moment identities) split exists
   in the README row and the prose status line but not in per-theorem rows; §6 prose
   → table. Discovery-grade §A. Effort S–M.
2. **71 — small header pass, high rule-severity.** The "PROVED, FINAL." pattern is the
   R1 audit's named example of an unparseable status line; kind = FORMALIZATION-FIRST
   (forced-correction class — the statement correction is its earned article status).
   Header/status-rows edit only. Effort S.
3. **22 — header pass + closure-note relocation.** Kind tag + status rows; the
   `:99` append-only closure note moves to dossier 22 (its already-declared
   destination) so the file stops carrying an addendum. Effort S.
4. **10 — header pass.** Kind tag (TECHNICAL-RECORD, kept) + status rows from §4's
   proved-layers content; the OPEN-leading status line becomes row form. Effort S.
5. **Residual batch (11, 20, 52, 72)** — 11: convert the two "open — not attempted"
   rows to the vocabulary (or move them to §7 limitations); 11/52: novelty tables from
   the §6 prose; 20/72: front-matter shape for the kind tag. Effort S each,
   batchable in one session. None is externally load-bearing.

Done this cycle: 42 (R1), 50 (R1), 75 (A9), 52+11 headers (A9, 2026-11-17),
**01 full template upgrade (A9, 2026-11-17 — orchestrator GO; all five cells PASS)**,
**32 v2 (A9, 2026-11-17 — run-12 crossing-existence discharge + template upgrade;
all five cells PASS)**.

## Discovery-grade ratio projection (two-strike rule)

- **Flow (the rule's wording — "shipped articles each cycle"):** every
  currently-chartered iteration-4 article shipment is a discovery-grade upgrade
  (75 v2, 32 v2, 01 done; 30's completion optional per R2 §9's list), and the N=1
  non-discovery quota is UNSPENT (`a9-quota-casualties.md` row 9).
  On every chartered plan the cycle's shipped set is 100% discovery-grade — the
  ≥-half KPI is satisfied with margin. No chartered item can flip this: LP/AL-3D/
  ZZV2-λ/10-tranche/72-M1 are engineering deliverables that never take article form.
- **Stock (standing corpus):** 5 discovery-grade / 13 live articles = **38%**. The
  template upgrades above change packaging, not grades; the stock ratio moves only
  via §C-class relocations (each +1 to the percentage) or new discovery articles.
  Reaching stock ≥ 50% needs ≥ 3 relocations or ≥ 2 new discovery articles — neither
  is chartered, and relocations should follow discovery-bar verdicts, not the KPI.
- **Recommendation for H at close:** report both numbers, with the flow reading (the
  rule's own) as the binding one; keep the stock ratio as the corpus-health line.

— Lane A9, 2026-11-17. One-writer scope: this file + `articles/75-…md` (v2) +
`articles/52-…md` and `articles/11-…md` (header modernizations) + `articles/01-…md`
(orchestrator-GO'd template upgrade) + `articles/32-…md` (v2: the A6 run-12
crossing-existence discharge, relayed same day) this session. No commits (H commits).
