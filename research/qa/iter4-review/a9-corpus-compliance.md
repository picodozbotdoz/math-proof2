# A9 — corpus template-compliance gap table + v2-upgrade queue (2026-11-17)

Lane A9 (articles editorial/gate). Scope: every article of the restructured corpus
against `research/articles/TEMPLATE-iter4.md`'s hard rules, at the worktree @ 53c1548
tree **including this session's edits** (article 75 v2 + A1 pass; 52/11 header
modernizations + residual + depth passes; the 01/32/30/10 template upgrades with
their A1/A7 post-landing passes; article-32 v2 on A6's run-12 discharge relay; the
article-78 draft; the 20/72 placement + depth passes — every row and the tally
reflect the current files).
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
| 10 | `10-layers-toward-uniform-poly-space-eth-refutation.md` | PASS `:3–9` (2026-11-17 upgrade: kind TECHNICAL-RECORD, kept set) | PASS `:11–21` OPEN headline stated as the first row + 4 PROVED-UNCONDITIONAL layer rows incl. the D1 tranche landing (plumbing billing) | PASS `:213–231` 3-row table + scope statement | PASS `:196–212` §6 table re-cited to exact lines + the L3/Part-E row (`d1-run1.log:14/:25–30`) | PASS (v1's error-descent parenthesis removed) |
| 11 | `11-call-charged-reduction-calculus.md` | PASS `:3–6` (2026-11-17 header pass) | PASS `:9–14` closed strings only (the two "open — not attempted" placeholder rows moved out to §7's open-items bullet, 2026-11-17 residual pass) | PASS `:142–152` 3-row table + scope statement | PASS `:119–140` R3-§5 blocks added (decl file:line + binder inventories + honest labels; the run-count sentence removed) — depth pass | PASS |
| 20 | `20-engine-seam-interface.md` | PASS `:3–12` (front-matter shape, 2026-11-17 residual pass) | PASS `:22–32` status table moved to the header (content unchanged; depth pass) | PASS `:147–155` 4-row table (zeta23 / Alpöge–Furman / 42-v2+75 / moved-to-note) | PASS `:116–146` per-decl view + R3-§5 block depth at `:131` (binder inventory, substrate, coverage; `assemble_eps`'s verdict-level cite disclosed in-row) | PASS |
| 22 | `22-pnt-psi-form-from-mathlib-wiener-ikehara.md` | PASS `:3–12` (kind TECHNICAL-RECORD) — A3's v2, landed 2026-11-17 | PASS `:14–19` | PASS `:82–95` | PASS `:117–129` | PASS (closure note relocated) |
| 30 | `30-boson-operators-second-difference-closed-form.md` | PASS `:3–8` (2026-11-17 upgrade: kind DISCOVERY, own-conjecture caveat) | PASS `:14–22` 7 rows, closed strings — the kernel-checked vs PAPER-ONLY moment-identity split now at row level (Cor 5 PAPER-ONLY, instances PROVED-UNCONDITIONAL) | PASS `:188–202` 3-row table + scope statement | PASS `:167–186` §5 run-of-record cites (`run3-green.log:12/:14–26/:60/:62–69`, sweep `:505–506/:561–562`) | PASS |
| 78 | `78-truffet-substitution-refutation.md` | PASS `:3–10` (drafted 2026-11-17 through the template; kind NEGATIVE, discovery-grade per ruling) | PASS `:11–17` 3 rows PROVED-UNCONDITIONAL, binder inventory empty | PASS `:142–186` 6-row table + empty-critique-space support block | PASS `:188–228` §6 table + R3-§5 blocks, run-4 cites verified on disk (agent-08) | PASS (run counts/walls stay in the pilot record) |
| 32 | `32-rc-savings-frontier.md` | PASS `:3–13` (v2 2026-11-17: kind DISCOVERY + discharge) | PASS `:15–23` 7 rows, closed strings, run-12/sweep cites verified on disk (Thm 4's print counter-only, disclosed in-row) | PASS `:174–185` 3-row table + scope statement | PASS `:136–172` §5 table + discharge paragraph + amendment note; per-theorem log lines | PASS (v1's error-descent line removed at v2) |
| 42 | `42-quadratic-dedekind-zeta-zero-proportions.md` | PASS `:3–8` (v2, R1 rewrite) | PASS `:10–16` 5 rows, closed strings, verbatim binders | PASS `:130–144` 5 rows + scope paragraph | PASS `:174–190` §6 table, per-theorem lines | PASS (one ledger-pointer sentence, permitted) |
| 50 | `50-zero-free-regions-cannot-move-certificate-constants.md` | PASS `:3–8` (v2, R1 rewrite) | PASS `:10–17` incl. "at donor pin" qualifier | PASS `:158` §8 table | PASS `:129` §6 + status-row evidence cells | PASS (self-check `:176`) |
| 52 | `52-statistics-universal-occupation-calculus.md` | PASS `:3–9` (2026-11-17 header pass) | PASS `:11–20` 5 rows, closed strings (this session) | PASS `:159–170` 3-row table + scope statement (2026-11-17 residual pass) | PASS `:120–158` §5 decl table + R3-§5 block depth at `:139` (per-theorem file:line + coverage; binder inventory empty) | PASS `:128–131` retracted-blocker note reworded as the plain correction it records |
| 71 | `71-splane-zeta-curve-dictionary.md` | PASS `:3–9` (kind FORMALIZATION-FIRST) — A3's v2, landed 2026-11-17 | PASS `:11–21` | PASS `:118–135` | PASS `:160–181` | PASS (v1 error-trajectory removed) |
| 72 | `72-renyi-monotonicity-nogo-gate.md` | PASS `:3–9` (front-matter shape, 2026-11-17 residual pass) | PASS `:19–30` status table moved to the header (content unchanged; depth pass) | PASS `:214–222` 8-row attribution table | PASS `:176–212` per-decl view + R3-§5 block depth at `:198` (binder inventory incl. hKL's external-statement status, substrate, coverage) | PASS |
| 75 | `75-abelian-assembly-zetaL-proportions.md` | PASS `:3–8` (v2, this session) | PASS `:10–19` 8 rows, closed strings, "at donor pin" on the donor row | PASS `:271–286` 5 rows + scope paragraph | PASS `:344–448` §6 table + R3 §5 blocks (the charter format) | PASS (self-check `:520`) |
| (21) | relocated: `pilots/21-quartic-window-certificate.md` (dossier-02 case study) | n/a — not an article since the 2026-11-16 demotion (README §C) | n/a | n/a | n/a | n/a |
| (73) | relocated: `candidates/73-function-field-hecke-tate.md` outcome record | n/a — not an article since the 2026-11-16 demotion (README §C); re-article condition = runbook-file branch 2 | n/a | n/a | n/a | n/a |

## Tally — FINAL, post-depth-pass (14 live articles; 2026-11-17, close-out state)

Session sequence: A3's 71 v2 and 22 v2 (flip lines applied verbatim above), A9's
01/32/30/10 upgrades, the 78 draft, the residual batch, and the 14/14 depth pass
(20/72 status tables moved to the header; 11/20/52/72 verification blocks to R3-§5
depth — decl file:line, binder inventories, substrate, coverage, honest labels).

| rule | PASS | PARTIAL | FAIL |
|---|---|---|---|
| kind tag | **14 / 14** | 0 | 0 |
| status rows (closed vocabulary, header position) | **14 / 14** | 0 | 0 |
| novelty table ≥ 2 rows | **14 / 14** | 0 | 0 |
| verification blocks (R3 §5 depth or full §6 table w/ per-theorem lines) | **14 / 14** | 0 | 0 |
| no infra narration | **14 / 14** | 0 | 0 |

**14/14 on every rule — no FAIL and no PARTIAL cell remains.** Disclosed
verdict-level evidence cells (the honest-log-excerpt class, named in-row, same class
as A1's 32/01 findings): 32 Thm 4 (`lt_Rc_iff_gmax`, wave-2 print of record staged);
01's ported-spine row; 20's `assemble_eps` (main-run in-stage + C2 sweep verdict).
None is a hidden tally — each is stated in its cell with its mitigation.

## Close-out input (the numbers H copies)

- **Flow KPI (two-strike rule, per-cycle shipped set):** the cycle's article shipments
  are 75 v2, 32 v2, 01, 30, 78 (A9) + 71 v2, 22 v2 (A3) + the R1 rewrites 42 v2, 50 v2,
  20, 72 — every one either discovery-grade (75, 32, 01, 30, 78) or a kept-set
  technical record already counted at restructure. **New discovery-grade articles this
  cycle: 78 (kind NEGATIVE, ruled discovery-grade, quota-untouched). The N=1
  knowledge-level/formalization-first/donor-discharge quota is UNSPENT.** ≥-half KPI:
  satisfied with margin on every chartered plan (nothing non-discovery ships).
- **Stock ratio (health line):** discovery-grade articles = 01, 30, 32, 42, 75 (§A) +
  78 = **6 of 14 live ≈ 43%** (up from 5/13 = 38% at cycle open). Paths to ≥ 50% at a
  future close: the 75-N2 unconditional-at-ℚ landing would strengthen an existing §A
  row (no ratio change); ≥ 1 further discovery article or ≥ 1 §C-class relocation of a
  technical record would cross 50%. Neither is chartered — recorded as projection, not
  plan.
- **Template-compliance endgame: 14/14 on all five rules.** The G5 gate can consume
  this table as-is; the three disclosed verdict-level cells are the record's honest
  excerpt class, each with its named mitigation.

## Ranked v2-upgrade queue — CLOSED (2026-11-17 end of session)

The queue is exhausted and the optional 14/14 depth pass has also landed (orchestrator
GO, same day): 20/72 status tables moved to the header; 11/20/52/72 verification
blocks at R3-§5 depth. Nothing remains on this queue.

Done this cycle: 42 (R1), 50 (R1), 75 (A9; + A1 pre-check F1–F4 pass), 52+11 headers
(A9, 2026-11-17), **01 full template upgrade (A9 — orchestrator GO; + A1 F01-1 and A7
companion-PDF passes)**, **32 v2 (A9 — run-12 crossing-existence discharge + template
upgrade; + A1 F32-1/F32-2 and A7 pitch-rescope passes)**, **30 template upgrade (A9 —
orchestrator GO)**, **78 drafted through the template (A9 — orchestrator GO; kind
NEGATIVE, discovery-grade per ruling)**, **10 template upgrade (A9 — incl. the D1
tranche landing rows, plumbing billing)**, **residual batch 11/20/52/72 (A9)**,
**71 v2 + 22 v2 (lane A3 — her flip lines applied above)**.

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

— Lane A9, 2026-11-17 (end of session, post-depth-pass). One-writer scope: this file
+ `articles/75-…md` (v2 + the A1 F1–F4 pass) + `articles/52-…md` and
`articles/11-…md` (header modernizations + residual + depth passes) +
`articles/01-…md` (template upgrade + A1/A7 passes) + `articles/32-…md` (v2 discharge
+ template upgrade + A1/A7 passes) + `articles/30-…md` (template upgrade) +
`articles/78-…md` (new draft) + `articles/10-…md` (template upgrade incl. the D1
tranche rows) + `articles/20-…md`/`articles/72-…md` (front-matter residual + the
14/14 depth pass: status tables to header, R3-§5 blocks) + the README §A row-78 draft
(H lands it) this session. A3's 71/22 v2s are hers; only her flip lines live here. No
commits (H commits). Standing by for the close-out gate support (G5 consumes this
table).
