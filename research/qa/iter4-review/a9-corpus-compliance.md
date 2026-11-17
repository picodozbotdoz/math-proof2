# A9 — corpus template-compliance gap table + v2-upgrade queue (2026-11-17)

Lane A9 (articles editorial/gate). Scope: every article of the restructured corpus
against `research/articles/TEMPLATE-iter4.md`'s hard rules, at the worktree @ 53c1548
tree **including this session's edits** (article 75 v2 + A1 pass; 52/11 header
modernizations; the 01/32/30 template upgrades with their A1/A7 post-landing passes;
article-32 v2 on A6's run-12 discharge relay; the article-78 draft — the
01/30/32/75/78 rows and the tally reflect the current files).
Cells were read from the files this session; every verdict carries file:line evidence.

**Rows = 16**: the 14 live article files in `research/articles/` (13 restructured +
the 2026-11-17 article-78 draft) + the 2 relocated
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
| 30 | `30-boson-operators-second-difference-closed-form.md` | PASS `:3–8` (2026-11-17 upgrade: kind DISCOVERY, own-conjecture caveat) | PASS `:14–22` 7 rows, closed strings — the kernel-checked vs PAPER-ONLY moment-identity split now at row level (Cor 5 PAPER-ONLY, instances PROVED-UNCONDITIONAL) | PASS `:188–202` 3-row table + scope statement | PASS `:167–186` §5 run-of-record cites (`run3-green.log:12/:14–26/:60/:62–69`, sweep `:505–506/:561–562`) | PASS |
| 78 | `78-truffet-substitution-refutation.md` | PASS `:3–10` (drafted 2026-11-17 through the template; kind NEGATIVE, discovery-grade per ruling) | PASS `:11–17` 3 rows PROVED-UNCONDITIONAL, binder inventory empty | PASS `:142–186` 6-row table + empty-critique-space support block | PASS `:188–228` §6 table + R3-§5 blocks, run-4 cites verified on disk (agent-08) | PASS (run counts/walls stay in the pilot record) |
| 32 | `32-rc-savings-frontier.md` | PASS `:3–13` (v2 2026-11-17: kind DISCOVERY + discharge) | PASS `:15–23` 7 rows, closed strings, run-12/sweep cites verified on disk (Thm 4's print counter-only, disclosed in-row) | PASS `:174–185` 3-row table + scope statement | PASS `:136–172` §5 table + discharge paragraph + amendment note; per-theorem log lines | PASS (v1's error-descent line removed at v2) |
| 42 | `42-quadratic-dedekind-zeta-zero-proportions.md` | PASS `:3–8` (v2, R1 rewrite) | PASS `:10–16` 5 rows, closed strings, verbatim binders | PASS `:130–144` 5 rows + scope paragraph | PASS `:174–190` §6 table, per-theorem lines | PASS (one ledger-pointer sentence, permitted) |
| 50 | `50-zero-free-regions-cannot-move-certificate-constants.md` | PASS `:3–8` (v2, R1 rewrite) | PASS `:10–17` incl. "at donor pin" qualifier | PASS `:158` §8 table | PASS `:129` §6 + status-row evidence cells | PASS (self-check `:176`) |
| 52 | `52-statistics-universal-occupation-calculus.md` | PASS `:3–9` (2026-11-17 header pass) | PASS `:11–20` 5 rows, closed strings (this session) | FAIL `:135` §6 prose + `:165` dated addendum; no table | PARTIAL `:117–133` §5 decl table without per-theorem log lines (lines now in the status rows) | PARTIAL `:132` retracted-blocker process note |
| 71 | `71-splane-zeta-curve-dictionary.md` | FAIL `:3–7` byline incl. "FINAL" | FAIL `:8–10` "PROVED, FINAL." — the exact pattern the R1 audit named unparseable | FAIL `:169` §6 prose | PARTIAL `:154` | PASS |
| 72 | `72-renyi-monotonicity-nogo-gate.md` | PARTIAL `:3–4` kind mid-byline | PARTIAL `:156–164` closed-vocab rows w/ log lines, at §6 not header | PASS `:178–188` 8-row attribution table | PARTIAL `:156+` rows w/ lines; no binder inventories | PASS |
| 75 | `75-abelian-assembly-zetaL-proportions.md` | PASS `:3–8` (v2, this session) | PASS `:10–19` 8 rows, closed strings, "at donor pin" on the donor row | PASS `:271–286` 5 rows + scope paragraph | PASS `:344–448` §6 table + R3 §5 blocks (the charter format) | PASS (self-check `:520`) |
| (21) | relocated: `pilots/21-quartic-window-certificate.md` (dossier-02 case study) | n/a — not an article since the 2026-11-16 demotion (README §C) | n/a | n/a | n/a | n/a |
| (73) | relocated: `candidates/73-function-field-hecke-tate.md` outcome record | n/a — not an article since the 2026-11-16 demotion (README §C); re-article condition = runbook-file branch 2 | n/a | n/a | n/a | n/a |

## Tally (14 live articles; updated 2026-11-17 after the 01/32/30 upgrades + the 78 draft)

| rule | PASS | PARTIAL | FAIL |
|---|---|---|---|
| kind tag | 9 (01, 11, 30, 32, 42, 50, 52, 75, 78) | 2 (20, 72) | 3 (10, 22, 71) |
| status rows (closed vocabulary) | 8 (01, 30, 32, 42, 50, 52, 75, 78) | 3 (11, 20, 72) | 3 (10, 22, 71) |
| novelty table ≥ 2 rows | 9 (01, 20, 30, 32, 42, 50, 72, 75, 78) | 0 | 5 (10, 11, 22, 52, 71) |
| verification blocks | 7 (01, 30, 32, 42, 50, 75, 78) | 7 (11, 20, 22, 10, 52, 71, 72) | 0 |
| no infra narration | 13 | 1 (52) | 0 |

Fully compliant (5/5 PASS): **01, 30, 32, 42, 50, 75, 78**. Non-compliant on ≥ 3
rules: **10, 22, 71** — Cycle-2 originals never touched by the R1/R2 rewrite sets.

## Ranked v2-upgrade queue (feed for orchestrator slotting)

Ranked by (a) discovery-grade exposure (§A rows face external readers and the KPI
first), (b) gap count/severity, (c) whether an edit is already chartered. Effort
classes are edit-session sizes, not Lean work.

1. **71 — small header pass, high rule-severity.** The "PROVED, FINAL." pattern is the
   R1 audit's named example of an unparseable status line; kind = FORMALIZATION-FIRST
   (forced-correction class — the statement correction is its earned article status).
   Header/status-rows edit only. Effort S.
2. **22 — header pass + closure-note relocation.** Kind tag + status rows; the
   `:99` append-only closure note moves to dossier 22 (its already-declared
   destination) so the file stops carrying an addendum. Effort S.
3. **10 — header pass.** Kind tag (TECHNICAL-RECORD, kept) + status rows from §4's
   proved-layers content; the OPEN-leading status line becomes row form. Effort S.
4. **Residual batch (11, 20, 52, 72)** — 11: convert the two "open — not attempted"
   rows to the vocabulary (or move them to §7 limitations); 11/52: novelty tables from
   the §6 prose; 20/72: front-matter shape for the kind tag. Effort S each,
   batchable in one session. None is externally load-bearing.

Done this cycle: 42 (R1), 50 (R1), 75 (A9; + A1 pre-check F1–F4 pass), 52+11 headers
(A9, 2026-11-17), **01 full template upgrade (A9 — orchestrator GO; + A1 F01-1 and A7
companion-PDF passes)**, **32 v2 (A9 — run-12 crossing-existence discharge + template
upgrade; + A1 F32-1/F32-2 and A7 pitch-rescope passes)**, **30 template upgrade (A9 —
orchestrator GO)**, **78 drafted through the template (A9 — orchestrator GO; kind
NEGATIVE, discovery-grade per ruling)**.

## Discovery-grade ratio projection (two-strike rule)

- **Flow (the rule's wording — "shipped articles each cycle"):** every
  currently-chartered iteration-4 article shipment is a discovery-grade upgrade or
  draft (75 v2, 32 v2, 01, 30 done; **78 NEW — kind NEGATIVE, ruled discovery-grade
  and explicitly NOT touching the N=1 quota**), and the N=1
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

— Lane A9, 2026-11-17. One-writer scope: this file + `articles/75-…md` (v2 + the A1
F1–F4 pass) + `articles/52-…md` and `articles/11-…md` (header modernizations) +
`articles/01-…md` (template upgrade + A1/A7 passes) + `articles/32-…md` (v2 discharge
+ template upgrade + A1/A7 passes) + `articles/30-…md` (template upgrade) +
`articles/78-…md` (new draft) + the README §A row-78 draft (H lands it) this session.
No commits (H commits).
