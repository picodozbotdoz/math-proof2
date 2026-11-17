# A9 — week1-agenda rows 9–10 support: quota state + strength-bar casualties (2026-11-17)

Lane A9 (articles editorial/gate). Inputs frozen at the worktree @ 53c1548 tree; every
claim carries its on-disk source. Companion artifact of this note: article 75 v2
(`research/articles/75-abelian-assembly-zetaL-proportions.md`, drafted this session).

## Row 9 — N=1 quota state (two-strike, article-kind, N=1 FINAL)

**The rule as typeset in the splice (R9 §11 final block, verbatim,
`qa/iter4-review/r9-iteration-plan-draft.md:1088–1091`):**

> Two-strike rule, FINAL: at most **one** knowledge-level / formalization-first /
> donor-discharge article per cycle (reserved for the exceptional forced-correction
> class), and ≥ half of shipped articles each cycle must be discovery-grade.

**The orchestrator ruling under review (2026-11-17, relayed to lane A9, verbatim):**

> the N=1 article-kind quota is UNCONSUMED — article-75 v2 is
> DISCOVERY-CONDITIONAL/DISCOVERY class (75's conditional statement class survived the
> audit as genuine discovery), so drafting it does NOT spend the single knowledge-level
> slot.

**Fit assessment: CONSISTENT, on three grounds.**

1. *Kind taxonomy.* The splice's quality-gate paragraph and the template's §0 kind
   table list `DISCOVERY-CONDITIONAL` ("new theorem class under named open
   hypotheses") as a **discovery** article kind; the quota's trigger set is the
   non-discovery kinds ("knowledge-level / formalization-first / donor-discharge"). A
   `DISCOVERY-CONDITIONAL`-kind article cannot spend a quota reserved for other kinds.
   R2's bar reached the same verdict on the content: 75's statement class is one of the
   ≈ 4–5 genuine discoveries, S4(b) applying (`r2-discovery-strength.md:202–206`).
2. *Billing structure.* The two week-1 completions that could have looked like
   quota-consuming donor-discharge articles — the 5/6 strip-distinct arm (75-Pb) and
   the hEχ Theorem-E discharge (zeta23e) — are billed as TIERS of the ONE 75
   statement-class article (companion billing, charter line `RESEARCH.md:113–119` =
   R5 §14.1(c) `r5-iteration4-backlog.md:999–1018`). Neither is a standalone article;
   neither claims an article kind. `qa/REPORT-INPUTS-ITER4.md` §3's accounting
   ("current recommendation leaves it UNSPENT") matches.
3. *No other week-1 consumption.* The week-1 GREENs (75-Pb, LP-1/LP-2, AL-P0/P1/P2-m1,
   zeta23e audit+port, 72-M1 L3a — §1 rows of `REPORT-INPUTS-ITER4.md`) are all billed
   engineering deliverables / discovery-completion inside existing articles; none
   requested an article-kind slot. Shipped iteration-4 articles: still none
   (`REPORT-INPUTS-ITER4.md` §3), so both the quota and the ≥-half-discovery KPI are
   untouched.

**Caution recorded for the gate (not a quota issue):** the charter's tier-1 endpoint
("the 2/3 tier unconditional at ℚ") is **not yet a proved theorem** — the hEχ run
landed the donor-pin audit + binder-port elaboration only; the consumer (75-N2) is OPEN
(`REPORT-INPUTS-ITER4.md` §1 row 75-N2/N3), and R3's tables say the on-pin consumer
"keeps the hEχ binder until an on-pin port" (`r3-verification-tables.md:526–530`).
Article 75 v2 was drafted accordingly: every 75-owned row stays PROVED-CONDITIONAL; the
single PROVED-UNCONDITIONAL row is the donor input `thmE_A₀`, flagged "at donor pin"
(`zeta23e-p0-run1.log:190`). When N2 lands it strengthens the same article
(supersession rows), still without quota consumption.

## Row 10 — strength-bar casualties: R2's 11 demotion/relabel items, applied state

R2's list = `r2-discovery-strength.md:173–200` ("Items to DEMOTE or
RETRACT-AND-RELABEL as they stand", items 1–11). Applied state as visible in the
article corpus at 53c1548 (`research/articles/` + `README.md`):

| # | R2 item (gist) | Applied state | Evidence |
|---|---|---|---|
| 1 | 50-M2 retract/fold as substrate note or Part II | **APPLIED (fold)** — merged into article 50 v2 as its Part II; ops narration moved to ledger pointers | README §C row "50-M2"; article 50 v2 front matter "supersedes … 50M2-unconditional-strip-confinement.md" |
| 2 | 21 retract standalone; fold into dossier 02 | **APPLIED** — demoted 2026-11-16; case-study stub in dossier 02; no article file remains | README §C row 21 (pointer resolves: `pilots/21-quartic-window-certificate.md` on disk); articles/ listing has no 21- file |
| 3 | 73 demote to dossier/pilot record until Q4 | **APPLIED** — demoted 2026-11-16; article file gone; outcome record in dossier | README §C row 73 → `candidates/73-function-field-hecke-tate.md` (on disk); Q4 gate memo GO 2026-11-17 per §1 row 73-Q4 |
| 4 | 42-M4 relabel cycle headline as ecosystem/donor-swap upgrade; triage typeset same | **APPLIED (superseded by the stronger merge)** — 42-M4 retired into 42 v2 (integrated merge, not addendum); the ecosystem/donor-swap framing is typeset in the triage rows and the Iter-4 charter's own diagnosis | README §A row 42 + §C "42-M4 file retired"; 42 v2 §0/§1; `TRIAGE-C2-ROWS.md:105–106` ("ecosystem/donor-swap completion"); `RESEARCH.md:56–58` |
| 5 | 11 relabel kind: "formal calculus for folklore composition (acceptance-tested on donor Thm 19)" | **APPLIED** — README kind cell carries R2's wording; M2 integrated into the body | README §B row 11 |
| 6 | 42 README kind: retire "zero-density" → on-line zero-proportion lower bounds | **APPLIED** — the misleading term is gone from row 42 and the article (title now "Critical-Line Zero Proportions…"); "zero-density" survives only in articles 01/20 where it names the zeta23 engine's own programme (different, correct use) | README §A row 42; grep: no "zero-density" in article 42 or its README row |
| 7 | 10 filename overclaim: rename or banner | **APPLIED (rename + leading OPEN)** — file renamed `10-layers-toward-uniform-poly-space-eth-refutation.md`; in-file status line leads "HEADLINE OPEN (not a theorem of this article)" (R2 §7.2 A1's text) | articles/ listing; `10-layers-…md:9`; README §C row 10 |
| 8 | 72 README kind: "negative result" → formal fence around Kuwahara's refutation | **APPLIED** — README kind and article title/status/abstract all carry the fence framing with attribution ("The refutation is his; the fence … are ours") | README §B row 72; `72-renyi-monotonicity-nogo-gate.md:1,9–13` |
| 9 | 20 kind → conditional interface + knowledge-level obstruction analysis | **APPLIED** — r2-rewrite-20 executed; seam analysis moved to `pilots/20-seam-analysis.md` (dossier-grade); kind TECHNICAL-RECORD | README §B row 20; `20-engine-seam-interface.md:1–8` |
| 10 | 52 kind → axiomatization + ε-universal dual-family lemma (formal) | **APPLIED at README level** — README §B row 52 carries the wording | README §B row 52 |
| 11 | 50 Part I kind → source-verified structural observation (knowledge-level) | **APPLIED** — README row and article v2 both carry it; Part I row is PAPER-ONLY with "not a theorem of mathematics" | README §B row 50; `50-…md` status table row 1 |

**Spot-checks (3, as tasked):**

- **article 42 v2** (item 4/6): title/byline/kind `DISCOVERY-CONDITIONAL` with dated v2
  version-history §0 (the c540682 vs 4e19304 record); 5 status rows in the closed
  vocabulary with verbatim binder lists; 5-row novelty table with the corrected DLRT
  scope; no bracketed errata; §9 self-audit PASSES (all 12 rows). No residue of the
  "zero-density" kind or the standalone 42-M4 headline.
- **article 50 v2** (items 1/11): kind `NEGATIVE (technical record)`; Part I row
  PAPER-ONLY "not a theorem of mathematics and not kernel-checked"; Part II Thm 1
  PROVED-UNCONDITIONAL with the "at donor pin" substrate qualifier in the status cell
  (the template's sanctioned use); abstract claims "no mathematical priority". The
  50-M2 discharge is a Part II section, not an addendum.
- **article 72** (item 8): title "A Kernel-Verified Fence for Kuwahara's Refutation…";
  status paragraph attributes the refutation (arXiv:2610.15199, binder hKL) and claims
  only the fence + interface; README kind matches.

**NOT-applied items: NONE.** One residual for the gate owners (record, not a casualty):

- Articles 52 and 11 carry the README-level relabels, but their **in-file headers are
  still pre-template** (52: no kind tag, house-style "Status: PROVED, unconditional,
  kernel-verified" line; 11: 2026-11-09 byline). Both are in the kept technical-record
  set and were not in R1/R2's rewrite sets, so no R2 item is unapplied — but full
  TEMPLATE-iter4 front-matter compliance for the kept set is an open splice-time gate
  item. **Flagged for H/R1.**

**New week-1 casualties sweep (row 10's second clause):** none found. The known state
holds (FB-3 was R2's own kill, pre-week-1; 77 narrowed to C+ substrate and survives;
74 no-kill per `week1-agenda.md` row 10), and none of the week-1 GREENs (75-Pb, LP,
AL-P0/P1/P2-m1, zeta23e, 72-M1 L3a) changed billing class or requested article status
— 75-Pb and hEχ landed inside the one statement-class article per the companion
billing; LP/AL/72-M1 remain engineering/interface deliverables.

— Lane A9, 2026-11-17. One writer scope honored: `articles/75-…md` (this session's v2
draft) + this note. No commits (H commits).
