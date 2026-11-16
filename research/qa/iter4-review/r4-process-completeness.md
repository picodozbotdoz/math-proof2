# R4 — process/completeness audit of the executed iteration (Cycle 1 main run + Cycle 2)

Lane R4, 2026-11-16. Mandate: charter-vs-delivered gap analysis (both cycles),
marker sweep + reconciliation, INDEX coverage. Rules honored: no fixes applied by this
lane; every finding cites file:line; no Lean work; nothing outside this file touched.

Verdict in one line: **no substantive charter obligation is missing — both cycles
delivered what `RESEARCH.md` promised (one delivered-differently, recorded) — but the
close-out left ~15 stale/stale-dated records behind: 1 MISSING-class record (the STEP-8
final gate-run), 10 INCOMPLETE (stale headers/statuses, INDEX gaps), 4 WRONG (two date
errors, one rank-arithmetic slip, one debts-line misclassification).** 12 safe one-line
fixes are listed for H (orchestrator approval required; none applied here).

---

## 1. Charter-vs-delivered gap analysis

### 1.1 Main run (charter `research/RESEARCH.md:1-23`; closed 2026-11-09)

| Obligation | Artifact | Verdict |
|---|---|---|
| Phase 1 survey per corpus (×4) | `survey/{anthropics,mathlib-frontier,tauceti,openai-math}.md` | DELIVERED (INDEX.md:17-20; each QA'd) |
| Phase 2 bridge map | `bridges/{complexity,analytic-nt,linear-algebra,tensor-algebra,tauceti-contributions}.md` | DELIVERED (INDEX.md:24-28; each QA'd) |
| Phase 3 dossiers w/ 5 mandatory components | 19 dossiers + TEMPLATE in `candidates/` | DELIVERED — all 19 carry the 5 charter components (Precise statement / Novelty check / Bridge analysis / Proof-strategy sketch / Feasibility; section headers verified per file) |
| Phase 4 triage + top-3 pilots | `TRIAGE.md` FINAL; top-3 = 42, 10, 01 (TRIAGE.md:188) | DELIVERED. Pilots: 42 all milestones GREEN; 01 complete (REPORT.md:194-196); 10 partial-by-design — M1 main-run, L1/L2 Cycle-2, assembly tranche D1–D6 carried to Iteration 4 (REPORT.md:369; TRIAGE.md:352-356). Carried state is recorded everywhere it is claimed — honest, not a gap |
| One article per discovery | `articles/` 10 articles + README | DELIVERED (articles/README.md:11-22) |

### 1.2 Cycle 2 (charter `RESEARCH.md:25-39`; closed 2026-11-14)

| Promised (RESEARCH.md:33-38) | Artifact | Verdict |
|---|---|---|
| `survey/axiommath.md` | on disk, QA'd 10 OK/2 minor (INDEX.md:119) | DELIVERED |
| `bridges/function-field.md` + `bridges/area-law.md` | on disk; QA P2 = 9 OK/1 MINOR, P3 = 9 OK/1 MINOR (`qa/cycle2-qa-plan.md:343,:376`) | DELIVERED (but INDEX.md:123-124 still says "QA P2/P3 pending" — stale, see §3) |
| donor remap `novelty/axiommath-as-donor.md` | on disk, QA P4 8 OK/2 minor (INDEX.md:126) | DELIVERED |
| 70-series dossiers | `candidates/70..75` all FINAL, all 5 components, pilot-outcome blocks filled | DELIVERED. One stale header: dossier 71's outcome header says "P2 stays slotted" while its own body has P2 FINAL-GREEN (`candidates/71-function-field-splane-dictionary.md:297` vs `:311`) |
| novelty round 4 | `novelty/round-4.md` (Parts 1+2, §5-§10) | DELIVERED; title still reads "SKELETON, PART 1" (`round-4.md:1`) — stale |
| TRIAGE addendum | `TRIAGE.md:202-387` DECIDED 2026-11-14 | DELIVERED |
| pilots: 10-L1/L2, 52-fix, 20-M1 close-out | all terminal GREEN/verified (STATUS.md:723-737; ledger §9) | DELIVERED |
| "discharging the hQRH binder of pilots 20/50 from DedekindZetaZeroFree's Cureton–Thorner" | 50: discharged via **openai R1 (7/8)**, not DZDF — G1b FAIL priced DZDF direct build out (donor-probes §G1b; REPORT.md:327-331); 20: object-layer switch = note only, hCZ not dischargeable (`novelty/axiommath-as-donor.md:134`) | **DELIVERED-DIFFERENTLY (recorded)** — the deviation is documented in donor-probes/REPORT C2.2, and R1 is the stronger theorem (7/8 > 31/32), but no top-level record (close block or §Cycle 2) reconciles the promise verbatim; see PROCESS DEBTS |
| ZetaZerosV2 as second donor for 42 | M4b both routes FINAL (REPORT.md:371) | DELIVERED |

**Counts (queue 1): MISSING 0 substantive artifacts.** Soft-missing record-keeping items
are counted in §2 (the STEP-8 final gate-run record and INDEX coverage gaps).

## 2. Findings table

Classes: MISSING (promised record absent) / INCOMPLETE (stub, stale, unfilled, dangling)
/ WRONG (contradicts other records). Owner lane: H = helper/infra; A1 = feasibility lane;
ORCH = orchestrator-owned text.

| # | Item | Class | Evidence | Suggested fix | Owner |
|---|---|---|---|---|---|
| F1 | STEP-8 final gate-run results never persisted — only the pre-close baseline dry-run exists; the close block asserts gates passed without a recorded run | MISSING | `qa/closeout-commit-plan.md:120-135` (baseline only); STATUS.md:718-778 close block has no gate table | append "STEP-8 final run" results table to closeout-commit-plan (or STATUS close block) retroactively from the close commits | H |
| F2 | STEP-8 gate 5 as specified can never pass: `! grep -q "do not decide until" research/TRIAGE.md` false-positives on the frozen main-run checklist header | WRONG (gate spec) | `qa/closeout-commit-plan.md:129` vs `TRIAGE.md:115` ("do not decide until these clear", main-run 2026-11-09, frozen); the Cycle-2 banner itself WAS replaced (TRIAGE.md:240) | record the override; narrow the gate to the §Cycle-2 section | H |
| F3 | INDEX.md not refreshed at close: ~25 pre-close files have no row (all 7 Cycle-2 article files + article-10 file, 4 `ITERATION4-*` files, `RESUME-BRIEF-C2-ENDGAME.md`, `novelty/{knausgaard-as-donor,liu1-as-donor,physlib-surface,iter4-seed-triage}.md`, `feasibility/lp-duality-bridge.md`, `pilots/{20-blueprint,20-prework,20-hCZ-NOTE,52-blueprint,30-falsify-TheoremB-h1.lean,10/next-tranche-spec,al-3d-prework,lp-layer-prework,zzv2-lambda-prework}`, work dirs `pilots/72-M1/*`, `pilots/73/C.lean`, `pilots/75/{Pa.lean,Pb-design.md}`, `pilots/50/{Dirichlet.lean,R1-prework.md,R1probe.lean,run_r1.*}`, `qa/{agents-c2-apply-plan,articles-novelty-signoff,closeout-commit-plan,debts-register}.md`) | INCOMPLETE | INDEX.md:86-98 ("10 articles"), :111-164 (Cycle-2 section ends at `pilots/50/R1.lean`); disk cross-check this audit (both directions: no INDEX entry dangles — only `pilots/_unattributed/` is referenced-as-empty, correctly) | one INDEX refresh pass; the 7 Cycle-2 articles + close/QA files are the material gaps | H |
| F4 | INDEX.md Cycle-2 statuses stale vs final records: REPORT "pre-staged … placeholders" (INDEX.md:13); "QA Parts 1–5" vs 1–7 (:115); bridges "QA P2/P3 pending" vs executed (:123-124); dossier 73 "skeleton, no QA due" vs FINAL+QA'd (:133); 74/75 "[expected]" vs landed/delivered (:134-135); G7b "no verdict" vs PASS (:136-137); 42 "next: upgrade" vs COMPLETE (:139); 10-L2 "UNRUN" (:142), 71-P2 "iterating" (:143), 72-C-neg "FAIL-in-flight" (:144), 11 "verdict NOT landed" (:145) — all landed GREEN | INCOMPLETE | INDEX.md vs REPORT.md:362-375, TRIAGE.md:227-232, `qa/cycle2-qa-plan.md:410` | same refresh pass as F3 | H |
| F5 | Stale date: "orchestrator's 2026-11-15 decision" (article-10 promotion). README and TRIAGE were fixed (commit `1490e22` "article-10 date fix 2026-11-15→14"); the staging file was missed. Correct date = **2026-11-14** (promotion commit `8a43767`, 2026-11-14; decision-log row TRIAGE.md:190; close 2026-11-14) | WRONG | `TRIAGE-C2-ROWS.md:214` (unfixed instance); fixed: `articles/README.md` (post-1490e22), `TRIAGE.md:353-354`; instruction at `RESUME-BRIEF-C2-ENDGAME.md:83` | one-token date fix | H |
| F6 | Rank-arithmetic slip: TRIAGE decision text "Recomputed rank ≈ 4.5 ⟨orchestrator: 3.5·3.5÷2.5, C-neg-only⟩" — the stated arithmetic equals 4.9; the TRIAGE matrix and REPORT §C2.6 both say 4.9 | WRONG | `TRIAGE.md:279` vs `TRIAGE.md:229` ("**4.9** (3.5×3.5÷2.5)") and `REPORT.md:443` ("≈ 4.9"); inherited from staging `TRIAGE-C2-ROWS.md:137` | 4.5 → 4.9 (both TRIAGE.md:279 and the staging snapshot line) — orchestrator-owned number, flag for approval | ORCH (H applies) |
| F7 | Leftover template skeleton in FINAL TRIAGE: "### 1. <candidate>" + "Chosen after all dossiers are scored; per candidate:" sits directly above the real "### 1. Candidate 42" | INCOMPLETE | `TRIAGE.md:132-135` | delete the two placeholder lines | H |
| F8 | Debts register row (i) never marked discharged although applied (slot-2/3 normalization landed, commit `431a941`) | INCOMPLETE | `qa/debts-register.md:18` (no strikethrough, class CLOSE) vs applied wording at STATUS.md:142,:144,:148 | strike row (i) as CLOSED 2026-11-14 (431a941) | H |
| F9 | Close block debts line misclassifies (i): "(b)(c)(d)(e) CLOSED; (f)(g)(h)(i)–(m) carried or recorded" — (i) was discharged | WRONG | STATUS.md:761 vs STATUS.md:142/:144 (applied) | "(b)(c)(d)(e)(i) CLOSED; (f)(g)(h)(j)–(m) carried or recorded" | H |
| F10 | Debts-register tail still frames resolved items as live: "Pending-verdict items are NOT debts (they are close-out preconditions …): 71-P2 axcheck+report, 42-M4b-upgrade, 10-L2, 11-M2 final, 72-M1 (slot 3), 75 (executing), G7b/G5a/G6a, seed-1 rg-gate + seeds-6/11 differentiation, TRIAGE-C2-ROWS reconciliation, A1 relabel batch" — every one resolved at close | INCOMPLETE | `qa/debts-register.md:24-27` | retitle paragraph "resolved at close (2026-11-14); kept for provenance" | H |
| F11 | Ledger §9 preamble paragraph still pre-G7b: "Conditional TARGETS additions on landing (not yet rows): 42-M4b-upgrade …, 50-M2 (gated … no G7b verdict yet …)" — contradicted 30 lines later by §9.F (both resolved: M4-note row; R1 GREEN) | INCOMPLETE | `feasibility/VERIFICATION-LEDGER.md:254-258` vs `:283-309` | prepend one resolution pointer sentence | H |
| F12 | REPORT-INPUTS-C2 promotion-checklist 50M2 row states current status "DRAFT — route decision pending" (article is FINAL since d36d62d); neighboring rows' "remaining to FINAL: [SWEEP]" likewise resolved | INCOMPLETE | `REPORT-INPUTS-C2.md:360` (also :356,:358,:359,:364) vs `articles/README.md:44`, `articles/50M2-…md:3,:9` | annotate the row "superseded — FINAL (d36d62d)" or update the cell | H |
| F13 | Imprecise date family: "after the 2026-11-14/15 close-out fills" | WRONG (minor) | `REPORT-INPUTS-C2.md:367` | "2026-11-14 close-out fills" | H |
| F14 | H QA note (iii) never actioned: ITERATION4-CHARTER-DRAFT still says 75 "EXECUTING" (landed FINAL-FOR-ENTRY); its header still lists [G7b] "run19 in flight" and [SWEEP] as live gates (G7b PASS run32; sweep executed) | INCOMPLETE | STATUS.md:628-631 (the note, "A1 next touch") vs `feasibility/ITERATION4-CHARTER-DRAFT.md:6-7,:48,:94` | refresh the three sites before Iteration-4 chartering consumes the draft | A1 |
| F15 | HKT [TBD] markers superseded 2026-11-14 by the PARTIAL-PIN (round-4 §10) but the iteration-4 input files still carry bare [TBD] without the resolution pointer (residual registered as debt f) | INCOMPLETE | `feasibility/ITERATION4-SCAN.md:45`; `RESUME-BRIEF-C2.md:94` (historical); resolution at `novelty/round-4.md:459` (§10), `novelty/VERDICTS.md:185`; debt f `qa/debts-register.md:15` | add "(resolved 2026-11-14: PARTIAL-PIN, r4 §10; debt-f residual)" at SCAN:45 | A1 |
| F16 | Dossier-71 pilot-outcome header contradicts its own body ("P2 stays slotted" vs P2 FINAL-GREEN FILLED) | INCOMPLETE | `candidates/71-function-field-splane-dictionary.md:297` vs `:311` | header → "P2 FILLED 2026-11-14" | H |
| F17 | Round-4 title still "SKELETON, PART 1" though PART 2 + §7-§10 landed and are load-bearing citations | INCOMPLETE | `novelty/round-4.md:1` vs `:427` (PART 2), `:459` (§10) | title → "PARTS 1–2 LANDED" | H |
| F18 | R1-prework §7 header "both STAGED-NOT-A-VERDICT" though block (a) is SELECTED (b = dead branch, correctly still staged) | INCOMPLETE | `pilots/50/R1-prework.md:144` vs `:150` | header → "(a) SELECTED 2026-11-14; (b) dead-branch, STAGED-NOT-A-VERDICT" | H |
| F19 | TRIAGE-C2-ROWS staging snapshot carries pre-G7b state under a "RECONCILED 2026-11-14" banner (row 70 "OPEN (gated)", M-2 open-slot list) — superseded by the typeset TRIAGE, but nothing on the file says so | INCOMPLETE (superseded-snapshot) | `TRIAGE-C2-ROWS.md:1,:28,:275-276` vs `TRIAGE.md:204-209,:227` | add a one-line banner "superseded by TRIAGE.md §Cycle-2 (typeset 2026-11-14 post-G7b)" | H |

**Totals: 1 MISSING / 13 INCOMPLETE / 4 WRONG** (F2 counted once in WRONG; F5, F6, F9, F13 are the four WRONG). No charter artifact is MISSING.

### Marker-sweep classification (queue 2, evidence for the table above)

- **Resolved-in-place (verified this audit):** ledger 11-M2 churn corrected (`VERIFICATION-LEDGER.md:251`); ITERATION4-SCAN:141 dedup done (single item-12 line); FINAL-SWEEP-PLAN-C2 duplicate AxPilot71_P2 row removed with strikethrough note (`FINAL-SWEEP-PLAN-C2.md:70`); slot-2/3 normalization applied (STATUS.md:142/:144/:148); AGENTS-C2-DRAFT marked APPLIED, E2 applied (`AGENTS-C2-DRAFT.md:3`; commits bf025a1, d36d62d); DLRT :137 qualifier fixed (`TRIAGE.md:139-140`); REPORT.md placeholder grep = 0 hits (gate 6 passes); articles Status/provenance DRAFT grep = 0 hits (gate 7 passes); all Cycle-2 articles FINAL (`articles/[0-9]*.md` headers); sweep evidence chain complete (stepB/stepC logs + 15 axcheck-c2-final.log copies; ledger §9.F filled).
- **Legitimately-carried:** [CHARTER-PENDING] family = iteration-4 proposals awaiting chartering (`pilots/zzv2-lambda-prework.md:3,:141`; `pilots/10-blueprint.md:187`; `pilots/10/next-tranche-spec.md:3`; `pilots/72-M1/L3-spec.md:187`; `pilots/75/Pb-design.md:1-3`); [TRIAGE-DECISION] annotation family in ITERATION4-* files = next-cycle decisions, cross-listed (`qa/debts-register.md:29-36`; `REPORT-INPUTS-C2.md:276-279` — the 4 "OPEN (next-cycle)" rows all defer-with-owner; the 5th OPEN row is the documented 10-L2 headline-open caveat, debts-register.md:35-36); R1-prework block (b) staged-dead-branch; TODO tokens in `lp-*`/`round-4`/`VERDICTS` = mathlib's own source-file TODO citations (verbatim-quote convention), not dangling markers; no XXX / "???" hits outside logs.
- **Stale-needs-fill:** F4-F19 above.
- **Reconciliation, TRIAGE-C2-ROWS ↔ TRIAGE.md ↔ REPORT §C2.6:** content reconciles — post-G7b deltas were typeset into TRIAGE (item 5 RESOLVED, matrix row 70 LANDED, status note final-form, decision-log row delivered-form), and REPORT §C2.6 mirrors it (ranks 5.8/4.9/4.8/6.4, carried list identical to TRIAGE.md:375-383). Residuals = F5 (date), F6 (4.5 vs 4.9), F19 (snapshot not stamped superseded).
- **Article-10 "2026-11-15" oddity (queue question):** wrong date; correct = **2026-11-14** (promotion commit 8a43767 and README/TRIAGE fixes 1490e22 are both 2026-11-14; decision log TRIAGE.md:190 dated 2026-11-14; Cycle 2 closed 2026-11-14). One instance remains unfixed (F5).
- **Post-close files not yet indexed (expected, not a defect):** `ORCHESTRATION-ITER4.md`, `RESUME-BRIEF-ITER4.md`, `qa/iter4-review/` — landed after the close (f8f37e6, 5ba0b91); fold into the F3 INDEX pass.

## 3. Safe immediate fixes (H applies on orchestrator approval; exact old → new)

1. `research/TRIAGE-C2-ROWS.md:214` — "orchestrator's 2026-11-15 decision" → "orchestrator's 2026-11-14 decision".
2. `research/TRIAGE.md:279` — "Recomputed rank ≈ 4.5 ⟨orchestrator: 3.5·3.5÷2.5, C-neg-only⟩." → "Recomputed rank ≈ 4.9 ⟨orchestrator: 3.5·3.5÷2.5, C-neg-only⟩." (orchestrator-owned arithmetic — confirm first).
3. `research/TRIAGE.md:132-134` — delete the lines "### 1. <candidate>", "", "Chosen after all dossiers are scored; per candidate:" (keep "### 1. Candidate 42 — …" that follows).
4. `research/novelty/round-4.md:1` — "# Novelty verification — round 4 (Cycle 2) — SKELETON, PART 1" → "# Novelty verification — round 4 (Cycle 2) — PARTS 1–2 LANDED".
5. `research/candidates/71-function-field-splane-dictionary.md:297` — header tail "rows P0/P1 FILLED 2026-11-14 from ledger-final verdicts per the orchestrator's instruction; P2 stays slotted)" → "…; P2 FILLED 2026-11-14)".
6. `research/pilots/50/R1-prework.md:144` — "## 7. Outcome blocks (staged for splice; both STAGED-NOT-A-VERDICT)" → "## 7. Outcome blocks (staged for splice; (a) SELECTED 2026-11-14; (b) dead-branch, STAGED-NOT-A-VERDICT)".
7. `research/qa/debts-register.md:18` — mark row (i) discharged: prepend "~~" around the debt text and append "**CLOSED 2026-11-14: applied, commit 431a941 (STATUS:142/:144/:148)**".
8. `research/STATUS.md:761` — "(b)(c)(d)(e) CLOSED; (f)(g)(h)(i)–(m) carried or recorded" → "(b)(c)(d)(e)(i) CLOSED; (f)(g)(h)(j)–(m) carried or recorded".
9. `research/feasibility/VERIFICATION-LEDGER.md:254` — prepend to the paragraph: "[Resolved at close 2026-11-14: upgrade re-baselined in the M4-note row; 50-M2 R1 GREEN on the donor pin — see §9.F Step D.] ".
10. `research/REPORT-INPUTS-C2.md:360` — "| 50M2 strip | DRAFT — route decision pending |" → "| 50M2 strip | superseded — PROVED, FINAL (route R1; G7b PASS + R1 GREEN, d36d62d) |".
11. `research/REPORT-INPUTS-C2.md:367` — "after the 2026-11-14/15 close-out fills" → "after the 2026-11-14 close-out fills".
12. `research/TRIAGE-C2-ROWS.md:1` — append banner line under the title: "*Superseded by `TRIAGE.md` § Cycle-2 (typeset 2026-11-14 post-G7b); kept as the pre-typeset snapshot.*".

(Not in the safe list because they need content judgment, not one-liners: F1 STEP-8 record, F2 gate-spec fix, F3/F4 INDEX refresh, F14 CHARTER-DRAFT refresh, F15 SCAN pointer, F10 register-tail retitle.)

## 4. Process debts for the next iteration (what discipline slipped)

1. **INDEX discipline.** INDEX.md self-describes as live ("H updates this index as files appear", INDEX.md:4-5) but was last substantively refreshed mid-cycle: 7 delivered Cycle-2 articles, all close-chain QA files and the ITERATION4 handoff kit are unindexed, and a dozen statuses contradict final records (F3/F4). Make an INDEX refresh + orphan grep an explicit STEP-8 gate at every close.
2. **Gate-run persistence + gate quality.** STEP-8's final gate run was never recorded (F1), and one gate (5) was miscalibrated against frozen main-run text so it could never pass (F2) — an unrecorded-override hazard. Rule: gates are re-run on the final tree, and the pass/fail table is committed with the close block.
3. **Date discipline.** Three instances of the "2026-11-15" family (two fixed, two residual: F5, F13) — a future-dated decision written during the 11-14 close and propagated. Rule: typeset dates only from the decision-log row, never from memory; the endgame brief had to issue an explicit fix instruction (`RESUME-BRIEF-C2-ENDGAME.md:83`).
4. **Staging-file lifecycle.** Staging/PROPOSAL artifacts (TRIAGE-C2-ROWS, R1-prework §7, apply-plan tails) keep pre-decision state under "RECONCILED" headers with no superseded stamp (F19, F18); headers lag bodies (F16). Rule: when a staged block is spliced/selected, stamp the staging file the same commit.
5. **Unactioned QA notes.** H's batch-19/20 QA notes assigned fixes "at next touch" (STATUS.md:625-631); note (iii) was never executed (F14) because close-out had no checklist slot for it. Rule: QA notes get an owner + a close-out gate line, not "next touch".
6. **Debts-register hygiene.** Row (i) discharged without being struck (F8); the tail still lists resolved items as preconditions (F10); the close block then miscites the register (F9). Rule: strike rows in the same commit that discharges them; retire precondition paragraphs at close.
7. **Delivered-differently reconciliation.** The charter's DZDF-discharge promise vs the openai-R1 landing + pilot-20 note-only outcome is documented in donor-probes/REPORT but never reconciled against the §Cycle 2 text itself (close block STATUS.md:723-737 does not mention the substitution). Rule: close blocks carry a one-line promise-vs-delivered delta table for the cycle charter.
8. **Verified-no-defect (recorded here for the next auditors):** article close-out promotions were content edits to finished articles AFTER the sweep? No — commit order shows A9's final article fills (2125382, batch 22) preceded the sweep (stepB/stepC logs, §9.F), so every FINAL article post-dates its axcheck evidence; no article-touched .lean files were edited after Step B; article Status/provenance greps are clean (gate 7 passes). The `pilots/22/run*.log` mid-tree logs and headerless main-run logs remain frozen-history classes (debt k), correctly unactioned.

— end R4 deliverable part 1 (process/completeness). Counts: findings 19 (1 MISSING / 13 INCOMPLETE / 4 WRONG + 1 delivered-differently recorded); safe fixes 12; no fixes applied by this lane.

---

# Part 2 — Fixes package v1 + close-protocol upgrades (R4, queue 2, 2026-11-16)

Author: R4. Applier: H. **Nothing in this part has been applied by R4.** Batches A and B
are pre-approved by the orchestrator for H to apply on delivery; batch C is
orchestrator-owned and **applied only at charter-splice time** (marked per block).
All `old` blocks are byte-exact as of 2026-11-16 (INDEX.md = 175 lines after a042c48;
every other target file unchanged since the Part-1 audit). Apply by unique-string match
(the `old` strings are unique in their file); line numbers are aids, not anchors, and
edits within one file should be applied lowest-line-last to keep cites readable.

## Batch A — one-line fixes (pre-approved; H applies; 14 edits)

**A1. `research/TRIAGE-C2-ROWS.md:214` — stale promotion date (F5).**
- old: `orchestrator's 2026-11-15 decision`
- new: `orchestrator's 2026-11-14 decision`
- why: promotion commit `8a43767` and the README/TRIAGE fixes (`1490e22`) are both 2026-11-14; decision-log row TRIAGE.md:190 is dated 2026-11-14. This is the last unfixed instance.

**A2. Rank arithmetic slip (F6) — two files, same string.**
- `research/TRIAGE.md:279` and `research/TRIAGE-C2-ROWS.md:137`
- old: `Recomputed rank ≈ 4.5 ⟨orchestrator: 3.5·3.5÷2.5, C-neg-only⟩.`
- new: `Recomputed rank ≈ 4.9 ⟨orchestrator: 3.5·3.5÷2.5, C-neg-only⟩.`
- why: the quoted arithmetic equals 4.9; TRIAGE matrix (:229) and REPORT §C2.6 (:443) both read 4.9. Orchestrator-owned number — the orchestrator pre-approval of this batch covers it; if the orchestrator intended 4.5, the ⟨…⟩ arithmetic must change instead (flag, don't guess).

**A3. `research/TRIAGE.md:132-135` — remove leftover template header (F7).**
- old (4 lines incl. blanks):
```
### 1. <candidate>

Chosen after all dossiers are scored; per candidate:

### 1. Candidate 42
```
- new:
```
### 1. Candidate 42
```
- why: skeleton remnant inside a section marked FINAL; the real item heading follows immediately.

**A4. `research/novelty/round-4.md:1` — stale title (F17).**
- old: `# Novelty verification — round 4 (Cycle 2) — SKELETON, PART 1`
- new: `# Novelty verification — round 4 (Cycle 2) — PARTS 1–2 LANDED`
- why: PART 2 (:427) and §7–§10 are landed and load-bearing citations (e.g. VERDICTS row 71 cites r4 §10).

**A5. `research/candidates/71-function-field-splane-dictionary.md:297` — header contradicts body (F16).**
- old: `## Pilot outcome (TEMPLATE — appended by A9 2026-11-14; rows P0/P1 FILLED 2026-11-14 from ledger-final verdicts per the orchestrator's instruction; P2 stays slotted)`
- new: `## Pilot outcome (appended by A9 2026-11-14; rows P0/P1 FILLED from ledger-final verdicts; P2 FILLED 2026-11-14 — p2-run6 FINAL-GREEN)`
- why: body row at :311 already records P2 FINAL-GREEN.

**A6. `research/pilots/50/R1-prework.md:144` — header lags selection (F18).**
- old: `## 7. Outcome blocks (staged for splice; both STAGED-NOT-A-VERDICT)`
- new: `## 7. Outcome blocks (staged for splice; (a) SELECTED 2026-11-14; (b) dead-branch — STAGED-NOT-A-VERDICT)`
- why: block (a) is marked SELECTED at :150; only (b) is correctly still staged.

**A7. `research/qa/debts-register.md:18` — strike discharged row (i) (F8).**
- old: `| i | STATUS pilot-slot numbering normalization (row 72 "slot 2" → slot 3; decision-block three-slot enumeration) — wording staged at \`qa/agents-c2-apply-plan.md\` tail | CLOSE | orchestrator (H stages) | applied at TRIAGE §decision typeset |`
- new: `| i | ~~STATUS pilot-slot numbering normalization (row 72 "slot 2" → slot 3; decision-block three-slot enumeration) — wording staged at \`qa/agents-c2-apply-plan.md\` tail~~ **CLOSED 2026-11-14: applied (commit 431a941; STATUS.md:142/:144/:148)** | CLOSE | — | discharged |`
- why: the wording landed in commit 431a941; the register row was never struck (same-commit strike rule, Part-1 §4.6).

**A8. `research/feasibility/VERIFICATION-LEDGER.md:254` — resolution pointer on the stale pre-G7b paragraph (F11).**
- old: `Conditional TARGETS additions on landing (not yet rows): **42-M4b-upgrade** (A3, G2-cleared`
- new: `[Resolved at close 2026-11-14 — upgrade re-baselined in the M4-note row below; 50-M2 R1 GREEN on the donor pin (§9.F Step D):] Conditional TARGETS additions on landing (not yet rows): **42-M4b-upgrade** (A3, G2-cleared`
- why: the paragraph asserts "no G7b verdict yet", contradicted 30 lines later by §9.F; pointer keeps the frozen narrative honest without rewriting it.

**A9. `research/REPORT-INPUTS-C2.md:360` — 50M2 promotion-checklist row superseded (F12).**
- old: `| 50M2 strip | DRAFT — route decision pending | (1) **[G7b]** (A7 run19) → route decision; (2) pilot [VERDICT:50-M2-R1] execution + axcheck (or orchestrator's carried-to-Iter-4 call); (3) A5 delta | on landing: Status → "PROVED, FINAL (route R…, θ = …)"; if carried: → "FINAL (statement-level; execution carried to Iteration-4)"; provenance token either way |`
- new: `| 50M2 strip | **superseded — PROVED, FINAL (route R1; G7b PASS run32 + R1 GREEN; commit d36d62d; README:44)** | resolved 2026-11-14 | none — resolved before the pack froze | — |`
- why: the row states a current status ("DRAFT — route decision pending") that has been false since d36d62d.

**A10. `research/REPORT-INPUTS-C2.md:367` — date family (F13).**
- old: `remaining after the 2026-11-14/15 close-out fills`
- new: `remaining after the 2026-11-14 close-out fills`
- why: the close completed 2026-11-14; "14/15" is the same future-date slip family as A1.

**A11. `research/feasibility/ITERATION4-CHARTER-DRAFT.md` — 75 status + resolved gates (F14; H QA note iii, unactioned). Four one-liners:**
- A11a `:48`
  - old: `all FINAL-GREEN; **75 pulled INTO Cycle 2 and EXECUTING** (lane A4, the final C2` (line continues `pilot);` on :49 — match through `the final C2\n  pilot);`)
  - old (exact, two lines): `**75 pulled INTO Cycle 2 and EXECUTING** (lane A4, the final C2\n  pilot);`
  - new: `**75 landed in Cycle 2 — FINAL-FOR-ENTRY** (lane A4; run6-final GREEN, 17/17 triad);`
- A11b `:49`
  - old: `50-M2-R1 pre-staged awaiting **[G7b]** (R3 Liu-1 binder CLEAN as fallback);`
  - new: `50-M2-R1 LANDED (G7b PASS run32; R1 GREEN — article 50-M2); R2 DZDF statement-level only;`
- A11c `:94`
  - old: `| ~~pulled into C2~~ | 75 | **NOT an iteration-4 slot** — pulled INTO Cycle 2, EXECUTING as the final C2 pilot (lane A4, P-a then C1, final-or-declared-drop) |`
  - new: `| ~~pulled into C2~~ | 75 | **NOT an iteration-4 slot** — pulled INTO Cycle 2, LANDED FINAL-FOR-ENTRY (lane A4; P-a+C1 GREEN run6-final; P-b/N2 carried) |`
- A11d `:6-7` (header live-gates line)
  - old: `**[G7b]** (donor-pin axiom\naudit, run19 in flight), **[SWEEP]** (Cycle-2 close-out chain).`
  - new: `**[G7b]** (RESOLVED PASS 2026-11-14, run32), **[SWEEP]** (RESOLVED 2026-11-14 — Steps A–D executed, ledger §9.F).`
- why: the draft is the orchestrator's charter-splice input; consuming a draft that says 75 is "EXECUTING" and G7b "in flight" would propagate close-stale state into the Iteration-4 charter. (A11 wording is status-factual only; R2 restructure wording is NOT folded in here — see §7.)

**A12. `research/TRIAGE-C2-ROWS.md:1` — superseded stamp (F19).**
- old: `# TRIAGE-C2-ROWS — staging rows for the Cycle-2 TRIAGE addendum (A9, 2026-11-13; RECONCILED 2026-11-14)\n\nMechanical staging only`
- new: `# TRIAGE-C2-ROWS — staging rows for the Cycle-2 TRIAGE addendum (A9, 2026-11-13; RECONCILED 2026-11-14)\n\n*Superseded by \`TRIAGE.md\` § Cycle-2 (typeset 2026-11-14 post-G7b); this file is the pre-typeset snapshot, kept for provenance.*\n\nMechanical staging only`
- why: prevents any reader (or future splice) from consuming pre-G7b row state as current.

## Batch B — INDEX.md refresh (pre-approved; H applies)

### B1. `research/INDEX.md:13` — REPORT row (the "unparked" stale line)

- old: `- \`research/REPORT.md\` | final | **FINAL** (≈2.4k words); Cycle-2 addendum pre-staged 2026-11-14 | §1 executive summary integrated with final-sweep counts; §7 final proved-artifacts table; §8 Top-3 outcomes; §9 signed-off compliance; § Cycle 2 = C2.1–C2.7 skeleton with fill-in placeholders ([PILOT-VERDICT:*], [G7b], [SWEEP], [TRIAGE-DECISION]).`
- new: `- \`research/REPORT.md\` | final | **FINAL** (≈2.4k words); Cycle-2 addendum FILLED-FINAL 2026-11-14 | §1 executive summary integrated with final-sweep counts; §7 final proved-artifacts table; §8 Top-3 outcomes; §9 signed-off compliance; § Cycle 2 = C2.1–C2.7 all filled (close-out chain executed: sweep Steps A–D signed at ledger §9.F; §C2.6 mirrors the TRIAGE decision).`

### B2. New rows — insert as a dated block immediately after line 164 (`research/pilots/50/R1.lean` row), i.e. between it and the `## Iteration 4` header at :166. Covers every unindexed pre-close file found in Part-1 F3 (grouped where a directory is the natural unit; statuses per current reality, sources named).

```
### Cycle-2 close & endgame additions (INDEX refresh, R4 batch B, 2026-11-16)

- `research/articles/10-uniform-poly-space-eth-refutation.md` | article (C2) | FINAL 2026-11-14 (orchestrator promotion, 8a43767) | main-run dossier 10's Cycle-2 article: three proved layers M1/L1/L2 (2,043+529+2,625 LoC; l2-run5-final 151/151 ⊆ triad); headline OPEN, assembly tranche D1–D6 carried.
- `research/articles/42M4-zetaK-proportions-unconditional-zeta-column.md` | article (C2) | FINAL 2026-11-14 | donor-swap upgrade of article 42 (frozen): unconditional ζ-column via direct ZetaZerosV2 import — M4b both routes (1,571/68; m4b2-run2 + donor-tree axcheck; M4-note = A3 formal report).
- `research/articles/50M2-unconditional-strip-confinement.md` | article (C2) | FINAL 2026-11-14 | unconditional ζ strip [1/8, 7/8] + Dirichlet at 7/8 under hFEχ (R1.lean 178 LoC; G7b PASS run32); grows article 50.
- `research/articles/71-splane-zeta-curve-dictionary.md` | article (C2) | FINAL 2026-11-14 | FF s-plane dictionary: W1/W2/HW conditional on WeilData (P2 279/11 triad, p2-run6; pole-family correction).
- `research/articles/72-renyi-monotonicity-nogo-gate.md` | article (C2) | FINAL 2026-11-14 | C-neg no-go gate (369/11 triad, run8-final) + family-265 interface tranche (702+360/25; L3 + interface carried to Iteration 4).
- `research/articles/73-formal-tate-dictionary-function-field.md` | article (C2) | FINAL 2026-11-14 | FF Hecke–Tate statement layer at Tier C (Q0 143 + C.lean 236/7 triad; Q4 carried).
- `research/articles/75-abelian-assembly-zetaL-proportions.md` | article (C2) | FINAL 2026-11-14 (Cycle-2 scope) | ζ_L abelian-assembly entry milestone (Pa.lean 1,557/66; run6-final 17/17 triad; P-b + N2 carried).
- `research/RESUME-BRIEF-C2-ENDGAME.md` | coordination | frozen 2026-11-14 | endgame-chain protocol doc (G7b → R1 → sweep → TRIAGE typeset → REPORT → AGENTS-C2 apply → close); executed as written.
- `research/qa/closeout-commit-plan.md` | QA/process | frozen 2026-11-14 | STEP 1–9 close sequence, STEP-8 gate list + baseline dry-run, git-integrity pre-pass, log-header audit appendix (137 files).
- `research/qa/agents-c2-apply-plan.md` | QA | executed 2026-11-14 | AGENTS-C2 apply plan (E1–E7; applied bf025a1, E2 at d36d62d) + slot-2/3 normalization tail (applied 431a941).
- `research/qa/articles-novelty-signoff.md` | QA | landed 2026-11-14 (A5) | per-article novelty sign-off pass; 75:114 minor fix applied; [G7b] novelty fold note.
- `research/qa/debts-register.md` | QA | live (close record) | carried-debts register: (b)–(e) CLOSED 2026-11-14, (i) CLOSED (431a941); (f)(g)(h)(j)–(m) carried/recorded; next-cycle deferrals cross-listed.
- `research/feasibility/ITERATION4-SCAN.md` | iter-4 input | landed 2026-11-14 (A1) | iteration-4 scan: 13 seeds + substrate §3; [TRIAGE-DECISION]-annotated throughout.
- `research/feasibility/ITERATION4-SEED-DOSSIERS.md` | iter-4 input | landed 2026-11-14 (A1) | seed dossiers for the top NEW-LEAN candidates (LP-duality, AL-3D, ZZV2 λ-family).
- `research/feasibility/ITERATION4-CHARTER-DRAFT.md` | iter-4 input | landed 2026-11-14 (A1; consumed by R9's splice draft) | skeleton §Iteration-4 addendum; live gates resolved at close (A11 wording applied).
- `research/feasibility/ITERATION4-CHARTER-SPLICE.md` | iter-4 input | landed 2026-11-14 (orchestrator) | branch-cut + splice mechanics (STEP 9; dev/iteration4 cut at b1ea051).
- `research/novelty/iter4-seed-triage.md` | novelty | landed 2026-11-14 (A5) | seed triage: 6 NEW-LEAN / 2 POSSIBLY-KNOWN / 4 DONOR-INFRA; AFP re-scope on seed 9 (Lean-ecosystem scope only).
- `research/novelty/knausgaard-as-donor.md` | novelty | landed 2026-11-09 (R8) | main-run donor mapping (rows 02/20/21/22/42/50 deltas; folded into TRIAGE).
- `research/novelty/liu1-as-donor.md` | novelty | landed 2026-11-13 | Liu-1 donor map: §5 DO-NOT-CONSUME as build dep; statement-level citation only (G7-confirmed).
- `research/novelty/physlib-surface.md` | novelty | landed 2026-11-14 (A5) | physlib surface scan (ExchangeSign nearest neighbor; seeds 11/13 input).
- `research/feasibility/lp-duality-bridge.md` | feasibility | landed 2026-11-14 (A1) | LP-duality bridge verdict: mathlib Cone/Basic TODO verified on-pin; AFP-HAS-LP_DUALITY; claim scope = Lean-ecosystem only.
- `research/pilots/20-blueprint.md` + `20-prework.md` + `20-hCZ-NOTE.md` (+ `pilots/20/`) | pilot | main-run; runs recorded GREEN 2026-11-13 (close-out 26bd2bc) | dossier-20 pilot set; hCZ seam note (weakest sufficient form S₁).
- `research/pilots/52-blueprint.md` | pilot | main-run; M1 VERIFIED-GREEN close-out 2026-11-13 | pilot 52 spec (`pilots/52-note.md` the close record).
- `research/pilots/30-falsify-TheoremB-h1.lean` | pilot evidence | GREEN 2026-11-09 (resume session) | kernel refutation of Theorem B at h = 1 (article 30).
- `research/pilots/10/next-tranche-spec.md` | pilot | [CHARTER-PENDING] 2026-11-14 (A6) | assembly-tranche D1–D6 spec; iteration-4 input.
- `research/pilots/{al-3d,lp-layer,zzv2-lambda}-prework.md` | pilot | [CHARTER-PENDING] 2026-11-14 | iteration-4 seed preworks (AL-3D; LP layer; ZZV2 λ-family).
- `research/pilots/72-M1/` (`P72M1T1/T2.lean`, `L3-spec.md`, `make_axcheck72m1.py`, runners) | pilot | FINAL-for-tranche 2026-11-14 (A8) | vendor layer 702 + L1/L2 360/25 kernel-clean (m1-run8; axcheck 52+28 triad-only); L3 + interface carried with spec.
- `research/pilots/73/` (`C.lean`, `P0.lean`, runners) | pilot | 73-C FINAL-GREEN 2026-11-14 (A2) | C.lean 236/7 triad (run6-c-green); Q0 probe 143 first-try.
- `research/pilots/75/` (`Pa.lean`, `Pb-design.md`, runners) | pilot | entry FINAL 2026-11-14 (A4) | Pa.lean 1,557/66 (run6-final; 17/17 triad); P-b design carried.
- `research/pilots/50/` additions (`Dirichlet.lean`, `R1-prework.md`, `R1probe.lean`, `run_r1.*`) | pilot | main-run + R1 GREEN 2026-11-14 | R1 staged on the G7b cached layer (article 50-M2).
- `research/pilots/42/` additions (`M4b.lean`, `M4-note.md`, `M4a-note.md`, `run_m4b2.*`) | pilot | FINAL 2026-11-14 (A3) | donor-swap both routes; M4-note = A3 formal report; M4a-note = superseded-draft pointer.
- `research/feasibility/probe/` remainder (ProbeA2–A4, C1/C2, D, E, F, G7, G7b; `axcheck_probe.py`, `oai_closure.py`, `m4b_donor_axcheck.py` + runners; `run_axcheck.sh`) | tooling | main-run + C2 | port probes beyond :54/:137 and the axcheck machinery (incl. the full-coverage pilot-10 pattern).
- `research/pilots/01/` additions (`port/` 10 files, `master_layer.lean`, `tightness_layer.lean`, `make_port.py`) | pilot | main-run (complete) | the port-bundle layers behind MasterIdentity + tightness.
```

### B3. Stale-status row replacements (the Part-1 F4 cluster; same pre-approval; neutral, verdict-cited wording — R2-coupled wording deliberately excluded, see §7)

- **:115** old: `QA plan passes Parts 1–5 executed (cumulative 0 WRONG — \`qa/cycle2-qa-plan.md\`)` → new: `QA plan passes Parts 1–7 executed (cumulative 0 WRONG — \`qa/cycle2-qa-plan.md\`; Part 7 = DLRT-erratum propagation sweep)`
- **:123** old: `v1 + dictionary-zone update landed 2026-11-13 (A2; QA P2 pending)` → new: `v1 + dictionary-zone update landed 2026-11-13 (A2; QA P2 9 OK/1 MINOR, \`qa/cycle2-qa-plan.md\` Part 4)`
- **:124** old: `v1 + zone update landed 2026-11-13 (A4; QA P3 pending; Physlib-import premise flag from QA P5c)` → new: `v1 + zone update landed 2026-11-13 (A4; QA P3 9 OK/1 MINOR; Physlib-import premise flag from QA P5c + H erratum)`
- **:133** old: `pre-registered skeleton 2026-11-13 (A9; FF-EZ3) | Highest-ceiling Stacks-blocked zone; no QA due until filled` → new: `FINAL 2026-11-13 (A9; QA P5d 7 OK/1 MINOR); Tier-C pilot delivered 2026-11-14 (A2) | FF Hecke–Tate; Q4 carried to Iteration 4`
- **:134** old: `[expected] (A4, AL-EZ2)` → new: `FINAL 2026-11-13 (A4; QA P5e 7 OK/1 MINOR); unassigned — activates on Iteration-4 chartering`
- **:135** old: `[expected] (A9, in flight)` → new: `FINAL 2026-11-13 (A9; QA Q5f 7 OK/1 MINOR); entry milestone delivered 2026-11-14 (run6-final)`
- **:136-137** old: `G7 Liu-1 pins exact. **G7b (run16) killed by the outage — no verdict; re-run = A7 relaunch item (50-M2-R1 gate).**` → new: `G7 Liu-1 pins exact. **G7b PASS 2026-11-14 (run32 — headlines + delegation roots triad-only); G5a BLOCKED-INFRA → Iteration 4; G6a CONFIRMED NEGATIVE.**`
- **:139** old: `— next: the CLEARED direct-V2-import upgrade (≤20-line delta)` → new: `; **upgrade COMPLETE 2026-11-14 (A3 formal, M4-note: final 1,571/68, both routes)**`
- **:142** old: `**L2.lean (2,595 LoC/126 thms) committed UNRUN** — A6 relaunch: Part-D defect fixes → run → GREEN + full axcheck` → new: `**L2 GREEN 2026-11-14 (A6 formal: 2,625/151 all ⊆ triad; l2-run5-final)** — headline OPEN, assembly tranche carried`
- **:143** old: `P2.lean (247 LoC, header "proof artifact: no sorry") **first-ever run at relaunch: p2-run1 (2026-11-14) FAIL rc=1 errors=6 sorry=0** — A2 iterating to GREEN` → new: `**P2 FINAL-GREEN 2026-11-14 (p2-run6: 279/11 all triad; W1 pole-family correction)**`
- **:144** old: `honest **FAIL-in-flight** (descent 20→14→12→6→7 across run1–5; run5: rc=1 errors=7 sorry=0; provenance headers owed at close-out)` → new: `**FINAL-GREEN 2026-11-14 (run8-final 0/0/0; 369/11; axcheck 11/11 triad; run1–7 headers reconstructed + marked)**`
- **:145** old: `committed (snapshot ca4fd22): 1,100 + 392 LoC, **run verdict NOT landed** — four pinpoint fixes were mid-application at the outage (A8 relaunch)` → new: `**11-M2 GREEN FINAL 2026-11-14 (A8 formal: m2-run8 all six OK; axcheck 76 lines 0 sorryAx; RedTm2 final 421 LoC)**`

## Batch C — orchestrator-owned reconciliations (DO NOT APPLY NOW — apply only at charter-splice time, with the orchestrator's splice commit)

**C1. `research/RESEARCH.md` § Cycle 2 — delivered-differently record (Part-1 §1.2 delta).**
- where: append as the final paragraph of § Cycle 2, immediately after line 39 (`file-ownership and lane conventions carry over from the main run (see STATUS.md).`)
- new text:
```
**Close-out record (2026-11-14):** the hQRH discharge promised above landed via route R1
(openai in-corpus 7/8 donor, G7b PASS — run32) rather than DZDF's Cureton–Thorner: G1b
priced the DZDF direct build out on our pin (statement-level only), and R1 is the
stronger theorem — pilot 50's ζ strip landed unconditionally at [1/8, 7/8]
(`pilots/50/R1.lean`); pilot 20 recorded an object-layer donor note only (hCZ not
dischargeable — `novelty/axiommath-as-donor.md` §b). Delivered-differently, recorded:
`feasibility/axiommath-donor-probes.md` §G1/§G7b, REPORT §C2.2.
```
- why: the charter promise text currently stands uncorrected next to records that supersede it; one sentence reconciles promise vs delivery at the only place a future reader looks first.

**C2. `research/STATUS.md:761` — close-block debts line re row (i) (Part-1 F9; moved out of batch A because the close block is an orchestrator-owned record).**
- old: `**Debts:** \`qa/debts-register.md\` — (b)(c)(d)(e) CLOSED; (f)(g)(h)(i)–(m) carried or recorded.`
- new: `**Debts:** \`qa/debts-register.md\` — (b)(c)(d)(e)(i) CLOSED ((i) applied 2026-11-14, commit 431a941); (f)(g)(h)(j)–(m) carried or recorded.`
- why: (i) was discharged at typeset; the close block is the top-level record and must not contradict the register post-A7.

**C3 (flagged, not authored).** R2 item 4 asks the TRIAGE §Cycle-2 decision text and REPORT §C2.6 to stop calling the 42→42-M4 line "the discovery headline". That is a post-decision rewording of the orchestrator's own decision prose, not a mechanical fix — R4 does not author it; it belongs in the §7 pass-2 sequence below if the orchestrator adopts R2's recommendation.

## 6. Close-protocol upgrades — self-contained addendum (for R9 to fold verbatim into the Iteration-4 charter conventions block)

```
## Close-out protocol (Iteration 4; adopted from the Cycle-2 close audit, qa/iter4-review/r4-process-completeness.md §6)

1. **Scoped final gates.** Every close gate grep must be scoped to the live section of
   its target file, never the whole file: frozen main-run/earlier-cycle text can contain
   the retired banner string and false-positive the gate. Pattern:
   `! sed -n '/^## <live-section-heading>/,$p' <file> | grep -q '<retired-string>'`
   Worked example (Cycle-2 gate 5, corrected): the banner check becomes
   `! sed -n '/^## Cycle 2 addendum/,$p' research/TRIAGE.md | grep -q 'do not decide until'`
   — the old whole-file grep hit frozen TRIAGE.md:115 and could never pass. A gate that
   cannot pass invites silent overrides; a gate that always passes hides regressions.

2. **Gate-run persistence.** The final (post-close-edits) run of every gate is executed
   on the exact tree being closed, and its results table (gate / command / result /
   date / commit) is committed together with the close block in the same commit. A gate
   that fails is either fixed and re-run or recorded in the table as
   `OVERRIDDEN — <reason> — <owner>`; "passed by inspection" is not a state. Baseline
   dry-runs (pre-close) stay in the plan file and are labeled as baselines.

3. **INDEX refresh is a close gate.** Cycle close is not declared until INDEX.md is
   reconciled both directions against disk:
   `comm -3 <(find research -type f -name '*.md' -o -name '*.lean' -o -name '*.py' -o -name '*.sh' | grep -v -e '/logs' -e '__pycache__' -e decl-index | sort) <(grep -oE '`research/[^`]+`' research/INDEX.md | tr -d '\`' | sort -u)`
   must show only directory-covered or explicitly grouped entries; every new row's
   status field is dated and cites its source record (decision log, ledger row, or run
   log). Stale-status rows (statuses contradicted by the close records) are rewritten in
   the same pass — an index that enumerates files but misstates their state is worse
   than a short index.

4. **Date discipline.** Dates in typeset records are copied from the decision-log row or
   taken from the commit (`git show -s --format=%cs <sha>`), never written from memory
   or anticipation. Before the close commit, the tree is grepped for future and
   split-mind dates: `grep -rn "$(date -d '+1 day' +%Y-%m-%d)" research/` must be empty,
   and any `YYYY-MM-DD/DD` compound date must resolve to a real spanning decision. (The
   Cycle-2 close left three 2026-11-15-family errors written during the 11-14 close;
   two needed a later fix commit, one survives in a frozen snapshot.)

5. **Staging-file supersession.** When a staged/PROPOSED block is spliced, selected, or
   decided, the staging file receives a one-line superseded/selected stamp in the same
   commit. Pre-decision state that survives under a "RECONCILED" header without a stamp
   reads as current and gets consumed by mistake.
```

## 7. Cross-check: R2's 11 demote/relabel items vs batch B (coordination for H)

R2's list (`r2-discovery-strength.md` §4 "Items to DEMOTE or RETRACT-AND-RELABEL", 11
items) touches `articles/README.md` kind/status columns, three article files' existence
or names, and the TRIAGE/REPORT decision prose. Batch B rows are deliberately
**status-factual and R2-neutral** (verdicts, LoC, log cites; no discovery-strength
labels, no README-kind quotes), so A+B can land before the restructuring decision
without conflict. The coupling points that need **one coordinated pass 2 after the
orchestrator decides on R2** — never a second uncoordinated edit round:

| R2 item | Artifact(s) touched | Coupling with A/B | Pass-2 action (post-decision, single sequence) |
|---|---|---|---|
| 1. 50-M2 retract/fold into article 50 | `articles/50M2-*.md`, README:44 | B2 adds a 50M2 row asserting standalone FINAL | if folded: update the B2 row to "folded into article 50 Part II addendum (R2 restructure, date)" + README row + REPORT/STATUS cites of "article 50-M2" |
| 2. 21 fold into dossier 02 | `articles/21-*.md`, README:21, INDEX:97 | none (INDEX:97 is a pre-existing main-run row, untouched by B) | if folded: INDEX:97 reword + README row + TRIAGE:79 note |
| 3. 73 demote to dossier/pilot record | `articles/73-*.md`, README:42 | B2 73 row + B3 :133 rewrite | if demoted: both rows gain "(demoted to dossier/pilot record, R2 restructure, date)"; keep the artifact/log cites verbatim |
| 4. 42-M4 cycle-headline relabel | TRIAGE §decision prose, REPORT §C2.6 | **none of A/B touches decision prose** (C3 flag only) | orchestrator-authored rewording of TRIAGE:244-253 + REPORT:442-448; batch C timing |
| 5. 11 kind relabel | README:19/:46 | none | README-only edit |
| 6. 42 README kind ("zero-density" → "on-line zero-proportion") | README:17 | none (INDEX:93 quotes the article title, not the kind) | README-only edit |
| 7. 10 filename overclaim | `articles/10-uniform-poly-space-eth-refutation.md` (rename or banner), README:45 | **B2 row cites the current filename** | if renamed: B2 row path + every cite of the old filename (REPORT-INPUTS-C2:259/:361, REPORT.md:369, TRIAGE:353, INDEX B2) updated in the same pass; if banner-only: README + no path churn |
| 8. 72 kind softening | README:43 | B2 72 row says "no-go gate … + interface tranche" (neutral) | README-only edit; B2 row optionally adds "(fence around external refutation)" |
| 9. 20 kind relabel | README:18 | none (B2 pilots/20 row is pilot-side, not article-kind) | README-only edit |
| 10. 52 kind relabel | README:15 | none | README-only edit |
| 11. 50 Part I kind relabel | README:20, article 50 internals | none | README edit + article-internal wording (R1-lane territory if adopted) |

**H's sequence (single writes, no interleaving):**
1. Apply batch A (pre-approved) — one commit per file-group as H sees fit; A2 touches two files in one logical fix.
2. Apply batch B (pre-approved) — B3 first (bottom-up within INDEX to keep line cites stable), then B2 insertion, then B1.
3. Hold everything R2-coupled until the orchestrator's restructuring decision; then execute pass 2 as ONE sequence (README kinds/folds + filename + the B2/B3 row updates above + C3 if adopted), so no intermediate state contradicts either record.
4. Batch C rides the charter-splice commit (C1 + C2 together; C3 only if adopted).

— end R4 part 2. Batches: A = 14 edits (12 one-liners + the CHARTER-DRAFT pack counted as 4 one-liners, with the STATUS:761 item re-homed to C2 per queue), B = 1 + 34-file block (30 rows) + 12 stale-row rewrites, C = 2 authored + 1 flagged. Nothing applied by R4.

---

# Part 3 — Gate-run record delivered + R3 cross-read (R4, queue 3, 2026-11-16)

## 8. Gate-run record (closes Part-1 finding F1)

Written to **`research/qa/closeout-gate-run-C2-reconstructed.md`** — all 11 STEP-8 gates
re-executed 2026-11-16 at HEAD `081a79f` with the corrected/scoped greps, header-marked
RECONSTRUCTED as mandated. Summary: **11/11 PASS** (gate 1 manual-recorded; gates 4 and
10 via their documented escape/reconstruction clauses; gate 5 passes only under the
scoped grep — the demonstration line records the original false positive: whole-file
`grep -c 'do not decide until' research/TRIAGE.md` = 1 at frozen `TRIAGE.md:115` while
the scoped §Cycle-2-addendum section has 0). Gate 11's reconstruction maps every plan
STEP to its commit and records three order deviations with their documented rationales
(typeset `1490e22` before sweep `3876126` — the splice carried pre-written [CONDITIONAL]
markers; E2 riding `d36d62d` after `bf025a1` per the apply-plan's G7b dependency;
STEP-8 slot-ledger fills `b1ea051` after the close block `0d3c94b` — gate-4's deferral
cross-list landing, not a reopen). Batches A+B were verified **unapplied** at execution
and no gate grep reads a site A/B edits, so the record stays valid post-apply.
This file is the worked example for protocol addendum rules 1–2 (§6 above).

## 9. Cross-read: R3's `r3-verification-integrity.md` vs this audit (no silent contradictions)

R3's mandate (evidence chain) is disjoint from mine (process records); its six
machinery/records findings neither overlap nor conflict with my four WRONG findings
(F5 date, F6 rank, F9 debts line, F13 date — R3 audits none of those files' prose).
Three coordination points and one **new WRONG finding** from the cross-read:

1. **NEW WRONG (cross-read product): `TRIAGE.md:259` LoC correction is direction-inverted.**
   It reads "(A2 formal report LANDED; LoC corrected **282→279** …)" — but disk is
   **282** (`wc -l pilots/71/P2.lean` = 282) and A2's formal commit `56fba53` says
   "**282 LoC disk**"; 279 is the stale figure (run6 header + article, per R3 F5:
   3-line post-run drift, sweep staged the current bytes). The intended note was
   "corrected 279→282" (or "disk 282 vs header 279"). Same-direction 279 quotes ride
   `TRIAGE.md:228` (matrix row), `TRIAGE-C2-ROWS.md:117`, `REPORT.md:276`, and this
   file's B2/B3 rows. Disposition: added as **C4** below (TRIAGE decision text is
   orchestrator-owned); my released B rows keep 279 until pass 2 so they match the
   current records of record — flag, don't fork the numbers.
   **C4 (add to batch C, apply at charter-splice):** `research/TRIAGE.md:259`
   - old: `(A2 formal report LANDED; LoC corrected 282→279; W1 statement`
   - new: `(A2 formal report LANDED; LoC corrected 279→282-disk (run6 header says 279; sweep staged the 282-byte file); W1 statement`
   - why: the correction arrow points the wrong way vs disk (`wc -l` = 282), A2's formal
     commit 56fba53, and R3 F5; as written it instructs future readers to prefer the
     stale count.
2. **Counting-convention coordination (R3 F4 vs batch B).** R3 documents systematic
   undercounts (75: 66→68 decls; 42-M4 M4b: 68→70; P11T3: 88→110; 10-L1: 25→27; 20:
   27→28; ledger M4a 52→54) and proposes extractor-generated counts (its §5 rule 4).
   Batch B rows intentionally quote the current articles/ledger figures, so they inherit
   those undercounts. **Pass 2 must not fix counts piecemeal:** adopt R3's
   extractor-count rule first, then update articles + ledger + INDEX B-rows in the same
   sequence (same pass-2 discipline as the R2 couplings in §7).
3. **"44/44" paraphrase (R3 §4.2).** R3 reads the close block's "44/44 stages OK" as
   "43/43 plain + M4b donor-tree OK" (the ledger §9.F form). No conflict with this
   audit: my gate-run record's gate-2b checks log existence, not stage tallies, and my
   Part-1 §1.2 quoted the ledger's exact form. If pass 2 touches the close block,
   aligning the paraphrase to the ledger form is optional polish (C-batch adjacent, not
   authored).
4. **Complementary, not conflicting:** R3's custody/coverage findings (m2-axcheck-final
   P11T3 prints not persisted; private/lemma blind spot in make_axcheck) are exactly the
   class of evidence-hygiene rules my protocol addendum (§6) covers for gates; R3 §5's
   article verification-block format and my §6 close-protocol rules are disjoint and
   both fold into R9's charter conventions block without overlap.

**Task 2 standing:** A+B verification pass is armed and waiting on the orchestrator's
signal that H has applied them (confirmed unapplied at `081a79f`; the only commits since
Part 2 are R2/R9 deliverable landings + iteration-4 infra). On signal: re-read every
touched file, verify each edit byte-exact per Part 2, report PASS per batch or the exact
divergences routed to H. No fixes by R4.

— end R4 part 3. New: gate-run record file (11/11 PASS), C4 added to batch C, one new
WRONG finding (TRIAGE.md:259 direction), two coordination rules for pass 2.

---

# Part 4 — Iteration-4 close-out skeletons (R4, queue 4, 2026-11-16)

Two skeletons authored and staged (nothing executed; both are PREP-ONLY until the
orchestrator's triggers):

1. **`research/feasibility/probe/FINAL-SWEEP-PLAN-ITER4.md`** — modeled on the C2 plan
   (lineage: main-run → C2 → this). §0 TARGETS seeded from R5's specs exactly as
   mandated: pilots/75/Pb.lean (+ shared-ℚ staging + N2), LP pilot files
   (`pilots/lp/*`, L1.lean, the `L1→AxL1` sibling-import note), AL-3D
   (`pilots/al3d/*`, Statements3D cluster, [HEAVY-IMPORT]), ZZV2-λ
   (`pilots/zzv2-lam/*`, donor-tree class via the M4b2 recipe), 72-M1 L3
   (`P72M1T3.lean`, stage `AxPilot72_M1_T3`), 73-Q4 (gated), 22-T2a — plus a
   conditional-rows table for the charter-dependent ranks 7/8/10/11. §1 = sorry-token
   classifier note (C2 43-token carry-forward + incremental delta log + re-baseline
   rule). §2 = Step B with R3's upgrades as DEFAULTS, deviations requiring an
   OVERRIDDEN note: full-coverage private+lemma axcheck (mandatory for donor-swap
   pilots, recommended for all new stages), counters matching `error(<code>)` +
   backtick-sorry + wrapped-line joining, no middle-excerpting (full-length print
   persistence; tally-only logs must name their covering artifact), sha256-at-sweep.
   §3/§4 = ledger sign-off + compliance text (extractor-generated counts). §5 = the
   close gates (scoped-grep pattern, gate-run persistence, INDEX-refresh gate,
   date-discipline grep), citing the reconstructed C2 run as worked example. §6 trigger.
2. **`research/qa/closeout-commit-plan-ITER4.md`** — modeled on the C2 plan.
   Preconditions mirror R5's queue ranks 1–11 (per-lane verdict slots) + the records
   preconditions (A9's REPORT-INPUTS-ITER4 ledger, L9's TRIAGE-ITER4 rows, L6 novelty
   discharges, R2 decision landed pre-freeze). **STEP 5 is the NAMED pass-2 sequence**
   (extractor-count rule adopted FIRST → counts fixed everywhere in one pass → R2
   relabels/folds with cite-chasing → dated correction markers on frozen records,
   never silent rewrites). STEP 8 hard-codes gate-run persistence (results table in the
   same commit as the close block). STEP 9 = gates 1–11 scoped + two new gates (12
   INDEX reconciliation, 13 date discipline). STEP 10 = next-branch cut
   (orchestrator-only). Appendix restates the log-header convention (no debt-k class
   available to Iteration-4 logs).

**Standing status:** (a) A+B verification — batch A confirmed applied by H (commit
`4fad4f0`, "R4 fixes batch A applied"); batch B in progress on disk (INDEX.md modified,
uncommitted) — **verification pass NOT started**, per the queue it fires only on the
orchestrator's explicit signal that A+B are applied; the pass will re-read every touched
file byte-exact against Part 2 and report PASS per batch or exact divergences routed to
H. (b) R2's relabel set — R2's file has grown to 557 lines (the expanded edit list);
verification on H's apply, byte-exact + dated-correction-marker convention; divergences
routed to H, nothing fixed by R4.

— end R4 part 4.

---

# Part 5 — Batch A+B verification results + Iteration-4 launch-commit mechanics (R4, queue 5, 2026-11-16)

## 10. Batch A verification — **PASS (14/14 edits byte-exact; commit `4fad4f0`)**

Method: full `git show 4fad4f0` diff compared hunk-by-hunk against Part 2's A1–A12
`new` blocks, then current-state site greps (all old strings absent, all new strings
present, each ×1): A1 date (TRIAGE-C2-ROWS:214 = 2026-11-14, zero `2026-11-15` left),
A2 rank (both TRIAGE.md:279 and TRIAGE-C2-ROWS.md:137 = ≈ 4.9, zero ≈ 4.5), A3 template
header gone, A4 round-4 title, A5 dossier-71 header, A6 R1-prework header, A7 debts
row (i) struck with commit cite, A8 ledger resolution pointer, A9 INPUTS 50M2 row
superseded, A10 "2026-11-14 close-out fills", A11a-d CHARTER-DRAFT (75 FINAL-FOR-ENTRY
×2, 50-M2-R1 LANDED, gates RESOLVED), A12 superseded banner. Touched-file set = exactly
the 9 files the package names; nothing extra changed. One cosmetic note for the record:
"14 edits" (my Part-2 trailer, echoed in H's commit message) = **16 physical edit
sites** (A2 spans two files; A11 is four one-liners) — count nuance only, no divergence.

## 11. Batch B verification — **PASS (B1 + B2 33/33 rows byte-exact + B3 12/12; commit `bc1ef81`)**

B1 (:13 REPORT row FILLED-FINAL) applied. B2: all 33 inserted INDEX rows byte-identical
to the Part-2 block (programmatic row-by-row diff; 0 differences) — trailer nuance: the
Part-2/commit-message count "30 rows" is actually 33 rows (cosmetic, as with A). B3:
all 12 stale-row rewrites byte-exact (each new fragment present, each old fragment
absent; the one apparent :115 miss was my check-fragment spanning H's line wrap — the
applied line is exact). No collateral edits. **A+B fully verified; both batches PASS.**

## 12. R2 fix-side status — authored, NOT yet applied (verification pending)

Commit `bf99d62` adds the fix-side sections (+447 lines) to
`r2-discovery-strength.md` only — no artifact edits yet. When H applies the 29 relabel
edits: verify byte-exact against R2's expanded list + the dated-correction-marker
convention on frozen records (R4 Part-2 §7 / closeout-commit-plan-ITER4 STEP 5.4);
divergences routed to H, nothing fixed by R4. Still standing.

## 13. Launch-commit mechanics (H executes at orchestrator GO; R4-verifiable post-GO)

Ownership split per the queue: **R9 §10 checklist v2 owns process steps; this section
owns commit mechanics** — mapping: R9 §10.1 (pre-splice approvals) = already satisfied
(A `4fad4f0`, B `bc1ef81`, verified §§10–11; the R2-approval record remains the
orchestrator's); R9 §10.2 (splice commit) = L2 below; R9 §10.3–10.4 (lane re-task,
first Modal runs) = after L2, no commits defined here; R9 §10.5 (day-1 disciplines) =
behavioral, no launch commit.

**L1 — review-phase closure commit** (everything the review produced, minus the
splice targets; H may split by lane at discretion):
- files: `research/qa/iter4-review/` complete set — `00-DIGEST.md`, `r1-articles-editorial.md`,
  `r1-fixes-11-73.md`, `r1-readme-v2.md`, `r1-rewrite-42v2.md`, `r2-discovery-strength.md`
  (modified), `r3-verification-integrity.md`, `r4-process-completeness.md` (modified,
  this file), `r5-iteration4-backlog.md`, `r9-iteration-plan-draft.md` (modified);
  `research/qa/closeout-gate-run-C2-reconstructed.md`; `research/qa/REPORT-INPUTS-ITER4.md`;
  `research/qa/closeout-commit-plan-ITER4.md`; `research/feasibility/probe/FINAL-SWEEP-PLAN-ITER4.md`;
  `research/articles/TEMPLATE-iter4.md`; `research/feasibility/iter4-donor-unblock-plan.md`
  (R8); R8 infra (H confirms which ride here vs a later infra commit — staged-unrun per
  `f2aaa2e`): `feasibility/probe/{ProbeG9_StrongPNT,ProbeG10_PhyslibRefresh}.lean`,
  `iter4_probe.py`, `run_iter4_probe.sh`, modified `run_probe.sh` + `pilots/32/run_pilot.sh`.
  **Not in L1:** `novelty/iter4-fresh-bridges.md` (R6 mid-flight per R9 §10.6 — commit at
  its own landing, orchestrator call if a DRAFT snapshot is wanted).
- message: `Iter4 review phase: lane deliverables (R1–R5, R9) + C2 gate-run reconstruction + launch kit (sweep plan, closeout plan, REPORT-INPUTS-ITER4 skeleton, article template)`.
- verify: `git show --stat <L1>` covers exactly the list above; `git status --short`
  afterwards shows only R6/R7 in-flight outputs (none expected on disk) and the L2
  targets; L1 touches none of RESEARCH/STATUS/TRIAGE/INDEX/ORCHESTRATION.

**L2 — the splice/launch commit** (exactly R9 §10.2):
- `research/RESEARCH.md`: §Iteration 4 block from R9 §8 splice v2 (orchestrator
  typesets; may compress the protocol block) **+ batch C1** (close-out record paragraph
  appended after the §Cycle 2 tail line "…carry over from the main run (see
  STATUS.md).").
- `research/STATUS.md`: §"Iteration 4 (opened 2026-11-16)" block from R5 §16's staged
  snippet (extract-and-splice; H owns STATUS) **+ batch C2** (:761 debts line).
- `research/TRIAGE.md`: **batch C4** (:259 LoC direction fix).
- `research/ORCHESTRATION-ITER4.md`: re-keyed to R9 §9 A-duties.
- `research/INDEX.md`: dated, source-cited rows for every file L1/L2 commits (protocol
  rule 3 applied at landing).
- message: `Iteration 4: charter splice v2 (R9 §8) + STATUS opened block (R5 §16) + R4 batch C (C1/C2/C4) + tracker re-key + INDEX rows — launch commit`.
- verify (each one grep, post-GO):
  1. `grep -c '^## Iteration 4' research/RESEARCH.md` = 1
  2. `grep -q 'Close-out record (2026-11-14): the hQRH discharge promised above landed via route R1' research/RESEARCH.md` (C1)
  3. `grep -q '(b)(c)(d)(e)(i) CLOSED' research/STATUS.md && ! grep -q '(f)(g)(h)(i)–(m) carried or recorded' research/STATUS.md` (C2)
  4. `grep -q 'LoC corrected 279→282-disk' research/TRIAGE.md` (C4)
  5. `grep -q '^## Iteration 4 (opened 2026-11-16)' research/STATUS.md` (R5 §16 splice)
  6. INDEX two-direction reconciliation (r4 §6 rule-3 command) → empty except
     directory-covered/grouped entries
  7. date-discipline grep (r4 §6 rule 4) clean.

**L3 — launch-state refresh** (fold into L2 or separate at H's discretion):
`research/RESUME-BRIEF-ITER4.md` refreshed at GO (GO recorded; spawn order per R9
§10.3; first-48h queue pointer to R5 §14). Message if separate:
`Iter4: RESUME-BRIEF-ITER4 refresh at GO`. Verify: the brief's launch-gate table shows
GO + the L1/L2 commit hashes.

**Explicitly NOT in the launch commits:** R2's 29 relabels (pass-2, post-splice, ONE
sequence per closeout-commit-plan-ITER4 STEP 5 — never bundled here); R6/R7 outputs
(merge at their own landings); first Modal runs (R9 §10.4 governs; they follow L2).
Single-commit alternative: L1+L2+L3 fused (R9 §10.2 contemplates one commit) — same
file set, concatenated message, all seven verification greps run against that commit.

— end R4 part 5.

---

# Part 6 — R2 relabel verification + GO-readiness table (R4, queue 6, 2026-11-16)

**R2's 29 relabel edits — PASS (commit `20af866`).** Found applied in history (same
posture as batch B: verified on discovery, before later commits confound). Method: R2's
fix-side list (`r2-discovery-strength.md` §7.1 R1–R13, §7.2 A1–A12, §7.3 D1–D5) reduced
to 32 current-state site checks (new-fragment present ∧ old-fragment absent) + rename +
convention checks. Results: 32/32 pass; article-10 file rename complete
(`10-uniform-poly-space-eth-refutation.md` → `10-layers-toward-…`, old file absent) with
the cross-reference sweep done (INDEX cites the new name only); dated-correction
markers present on both frozen records (TRIAGE.md and TRIAGE-C2-ROWS.md "corrected
2026-11-16, Iter-4 review"); A12 left as R2 recommended and D5 correctly no-edit; D2's
two-copy sentence moved together. Commit touched exactly the 15 files the list implies;
nothing extra. Residue (not a divergence — outside R2's list): REPORT §C2.6's
"discovery-grade core" phrasing for 75 remains, the orchestrator's C3-adjacent call.

**GO-readiness table — written to `qa/iter4-review/r4-go-readiness.md`** (live gate
table, header-dated, updated on orchestrator signals): rows 1–10 as mandated; blocking
set exactly {R9-final splice, R7 prior-art audit, L1 review-closure commit}; rows 3–8
ride post-GO with disk-true states (R6 G11/G12 staged-untracked + runner modes
mid-edit; R8 AGENTS-ITER4-DRAFT untracked; R1 50v2 + R2 re-grades + R3 axcheck_iter4.py
in flight); row 8 records the R2 PASS above with the pass-2 count batch deferred to
close-time by design; row 10 notes L2 is the GO act itself, firing on rows 1/2/9 green.
Standing verifications unchanged: R3 pass-2 counts, L1 closure + L2's seven greps at
GO, and any divergence-fix commits before a row goes green.

— end R4 part 6.

---

# Part 7 — C5 proposed (REPORT §C2.6 residue) + R3 pass-2 batch-1 verification (R4, queue 7, 2026-11-16)

## 14. C5 — proposed one-line dated correction for the REPORT §C2.6 residue (joins batch C; orchestrator approves at GO; applied in L2)

- file:line: `research/REPORT.md:444`
- old (byte-exact): `(≈ 4.8), 75's entry milestone — the cycle's discovery-grade core (≈ 6.4) — and the main-run`
- new: `(≈ 4.8), 75's entry milestone — the cycle's one conditional statement class, discovery-grade at statement-class level only (≈ 6.4; corrected 2026-11-16, Iter-4 review: the 42→42-M4 line and the other completions around it are ecosystem/donor-swap technical records, not a discovery headline) — and the main-run`
- why: aligns the REPORT mirror with the applied D2 reframe (TRIAGE + TRIAGE-C2-ROWS already carry the corrected sentence, dated 2026-11-16) and D3's technical-record classing; the dated marker follows the frozen-record convention. No other REPORT §C2.6 change proposed — the ranks and carried list are accurate post-A2.
- L2 mechanics amendment: C5 rides the L2 splice commit with C1/C2/C4 (r4 §13); verification grep #8: `grep -q 'one conditional statement class, discovery-grade at statement-class level only' research/REPORT.md` and `! grep -q "the cycle's discovery-grade core" research/REPORT.md`.

## 15. R3 pass-2 batch-1 — verified **PASS with one sequencing note** (commit `683fdaf`)

Found applied in history; verified against R3's canonical tables
(`r3-verification-tables.md`, landed `2b3e121`) and R3 §4–§6:
- article 20 LoC 576→582 ✓; article 71 two sites 279→282 ✓; article 21 status → the
  R3-§3 quarantine label (computationally certified / external script / excluded from
  proved counts) ✓; article 50M2 "R1.lean (178 lines)" → 180 — disk-true
  (`wc -l pilots/50/R1.lean` = 180; supersedes the run-log count of earlier bytes,
  extractor-rule direction) ✓; VERIFICATION-LEDGER 11-M2 row amended with the
  tally-only note naming the covering artifact (stepB-c2.log:533–586) ✓ = R3 F1's fix
  pattern; both pilot-11 logs gained **dated correction comments (2026-11-16)** for F1
  (P11T3 prints not persisted) and F5 (RedTm2 410-run vs 421-disk) — frozen-record
  convention honored ✓. Touched files exactly the 7 implied; nothing extra.
- **Sequencing note (routed to H, not fixed by R4):** (a) `axcheck_iter4.py` is on disk
  but **uncommitted** — the extractor whose authority the count fixes invoke must ride
  L1 (or R3's next commit) for the "extractor rule adopted first" leg to be
  literally true in history; (b) the count-fix remainder is still owed and stays
  pre-registered for close-time (75 66→68, 42-M4b 68→70, 11-addendum 88→110, 10-L1
  25→27, ledger M4a 52→54 + §8 pilot-20 26→28, INDEX B-row counts) — closeout-
  commit-plan-ITER4 STEP 5 remains its single home; no piecemeal fixes elsewhere.

## 16. Readiness-table updates made this turn (see `r4-go-readiness.md`)

Row 1 (R9): integration pass landed (`3c95134`, +662 ln incl. splice v2 fold-state) —
state remains in-flight (touch-up + R7 fold; R7 still absent). Row 7 (R3): script
implemented on disk, **uncommitted** — rides L1. Row 8 (H applications): pass-2 batch-1
applied + R4-verified (`683fdaf`); remainder registered for STEP 5 at close; no other
pre-GO applications outstanding. Residue line updated: the REPORT §C2.6 residue is now
**C5 proposed (Part 7 §14), pending GO approval**. Blocking set unchanged
{R9-final, R7, L1}; L1/L2 verification held for the GO act.

— end R4 part 7.

---

# Part 8 — C5 approval recorded + readiness batch-3 update (R4, 2026-11-16, orchestrator queue 8)

**C5 APPROVED (orchestrator, 2026-11-16):** exact text as drafted (Part 7 §14), dated
marker included; rides **L2** with C1/C2/C4; grep #8 amendment adopted. L2's
verification set is now the eight greps (r4 §13 items 1–7 + the C5 grep).

**Readiness batch-3 updates** (`r4-go-readiness.md`, same-day): row 2 **cleared** — R7
landed (`1496c9a`, `novelty/iter4-external-priorart.md` 362 ln, 7/7 verdicts, ZERO
retracts; bib-cards follow-up commits on report); row 1's R7-fold leg = **in flight
with R9** (r9 worktree-modified; outstanding = fold + emission). Also refreshed from
the same drain wave: row 5 R1 **landed** (`e558674`, 50v2 + swap-in runbook +
resolutions), row 6 R2 **landed** (`a0d9373`, §11–13 re-grades + completion mini-specs),
row 4 R8 §9 checklist landed (`4f561bb`, digest-corrected `2864cbf`; AGENTS-ITER4-DRAFT
uncommitted, rides L1 or own commit). Pass-2 batch-1 PASS recorded by the orchestrator;
close-time remainder registration stands. `axcheck_iter4.py` riding L1 confirmed
belt-and-braces. **Blocking set: {R9-final, L1}** — remaining pre-GO updates: R9's
final block emission, H's L1 execution. At GO: R4 runs L1 closure verification + the
L2 eight-grep set.

— end R4 part 8.
