# STATUS — coordination board

Last updated: 2026-11-09, resume session (project close); pilot-10 row 2026-11-10 (pilot-10 lane, per the coordinating session's task); Cycle-2 board 2026-11-13 (H, per orchestrator). This file is the single source of truth for
lane status. The orchestrator messages status changes to H, who updates this board.

## FINAL STATE (2026-11-09 resume session) — project CLOSED

**Post-close update (2026-11-10):** pilot 10 was resumed after the close-out and its first Lean
milestone landed — M1 (= L3) `exists_tm_space`, green and axioms-clean (`pilots/10-blueprint.md`,
`pilots/10/`, dossier 10 § Pilot outcome); branch merged into master (`37e2898`). Everything else
below is unchanged; open items for 10 are L1 counter combinators and L2 `PolyTVal`.

All lanes closed. R7's 30/32 work (interrupted twice) was finished in the resume session:
**30** Theorem B refuted + closed form proved; **32** M1 green. R9's final sweep was executed
per `feasibility/probe/FINAL-SWEEP-PLAN.md`: 30/30 staged files OK (29 direct + one
extractor-fix re-run), 0 sorryAx, sign-off in
`feasibility/VERIFICATION-LEDGER.md` §7. H's final polish is done (`REPORT.md` FINAL, §1
integrated with re-pulled counts; `REPORT-INPUTS.md` §E). Articles, one per discovery:
`articles/` (10 + README). Erratum: `pilots/20-hCZ-NOTE.md` (Route A is a necessity
reduction, not an equivalence).

| Lane | Final status |
|---|---|
| R1–R6, R8 | CLOSED (artifacts intact; see history below) |
| R7 | CLOSED — 30: `pilots/30-note.md` (REFUTED + Theorem B′); 32: `pilots/32-blueprint.md` (M1 GREEN); dossier appends landed |
| R9 | CLOSED — final sweep A–D done; ledger §1 rewritten (FINAL) |
| H | CLOSED — REPORT FINAL, INDEX/STATUS final |

History (lane board as of the main run) follows.

## Lanes

| Lane | Role | Output file | Status | Since / note |
|---|---|---|---|---|
| R1 | tauceti-surveyor | `research/survey/tauceti.md` + `research/bridges/tauceti-contributions.md` | RUNNING | survey landed 2026-11-09; contributions file landed 18:44 (H's earlier ls raced R1's write — it IS on disk); contributions QA'd: 5/10 OK, 5 minor locators |
| R2 | openai-surveyor | `research/survey/openai-math.md` | RUNNING | survey + dossiers 50/51/52 landed, ALL QA'd (50: 7/8, 51: 6/8, 52: 6/8 — Part 4); pilot 50 M1 PROVED |
| R3 | mathlib-surveyor | `research/survey/mathlib-frontier.md` | RUNNING | survey DONE + QA'd/fixed (maintenance: H); assembly-maps task DONE 2026-11-09 (`feasibility/mathlib-assembly-maps.md` landed) |
| R4 | complexity-bridge | `research/bridges/complexity.md` | RUNNING | bridge DONE (QA 9/10); dossiers 10–12 DONE 2026-11-09 (QA: 6/8, 7/8, 6/8 OK — see `qa/dossiers-spotcheck.md`); now on blueprint/prework (pilots 10, 11, 22) |
| R5 | ant-bridge | `research/bridges/analytic-nt.md` | RUNNING | bridge v1 landed 2026-11-09; QA'd by H: 8/10 OK, 2 minor (`muq` :44→:48, SiegelZeros :6→:8) — fixes pending sign-off |
| R6 | linalg-bridge | `research/bridges/linear-algebra.md` | RUNNING | bridge DONE (QA 10/10); dossiers 01–03 DONE (QA: 7/8, 7/8, 8/8); pilot 01 blueprint DONE → **milestone (a) executing** |
| R7 | tensor-bridge | `research/bridges/tensor-algebra.md` | RUNNING | bridge v1 DONE + QA'd + fixes applied (hallInner :273, counts); **dossiers 30/31/32 DONE 2026-11-09** (QA: 7/8, 8/8, 7/8 — `qa/dossiers-spotcheck.md` Part 3); now in pilots/ (30-falsify + 32 running) |
| R8 | novelty | `research/novelty/round-{1,2,3}.md` + `VERDICTS.md` | RUNNING | rounds 1–3 + VERDICTS consolidation DONE 2026-11-09 (all 19 dossiers: N-adjusts, HOT/WARM/COLD tiers, re-scopes; standing flags — Hughes–Miller + anthropics-constants handled by H); donor-mapping {42,50,20,22} outstanding (feeds TRIAGE checklist) |
| R9 | feasibility | `research/feasibility/*` | RUNNING | **F4 COMPLETE 19/19** + `FEASIBILITY-SUMMARY.md` (canonical effort table) + `VERIFICATION-LEDGER.md` (canonical artifact table, 19:38) DONE; now rescuing pilot run logs + final re-sweep on coordinator's signal — collision rule lifted for H's deferred locator fixes once lanes confirm |
| H | helper | `STATUS.md` + `INDEX.md` + `qa/*` + `TEMPLATE.md` + `TRIAGE.md` (matrix) + `REPORT.md` | RUNNING | Task-11 final consolidation: deferred-fix register APPLIED (12 sites/8 dossiers, all re-verified true-as-written; 41 clean); REPORT polished (1,464 words — §5 defers to TRIAGE, §7 = final-disk pilot state from rescued logs: 42-M1/50-M1/11-T2 now axioms-recorded clean); TRIAGE 52-note; ready to typeset orchestrator's top-3 |
| H | anthropics survey (maintainer) | `research/survey/anthropics.md` | DONE | written before lanes existed; H owns it as of 2026-11-09. QA spot-check 11/12 (see `research/qa/anthropics-spotcheck.md`); the one minor error fixed same day (XiPrime sorry span 69–106; `_quartic` decl name) |

Orchestrator-owned: `research/RESEARCH.md`, `research/TRIAGE.md` (skeleton created by H 2026-11-09; orchestrator fills at Phase 4).

Status values: RUNNING / BLOCKED (say why) / DONE (link output) / DROPPED.

## Phase pipeline

Per `research/RESEARCH.md`:

    Phase 1 surveys                Phase 2 bridges              Phase 3 dossiers            Phase 4 triage
    research/survey/*.md     -->   research/bridges/*.md   -->  research/candidates/   -->  research/TRIAGE.md
    (anthropics DONE;             (one per bridge area,         (one dossier per             (rank by novelty x
    tauceti, openai-math,          fed by all surveys)           candidate discovery)        significance / effort;
    mathlib-frontier)                                                                        top 3 to Lean pilot)

Bridges may start on partial survey input; dossiers require the relevant bridge map plus
novelty (R8) and feasibility (R9) sign-off before entering triage.

## Pilots pipeline (post-triage — TOP-3 DECIDED 2026-11-09: 42, 10, 01; alternates 41/11/30; excluded 22/21/51 — see TRIAGE §Top-3)

| Pilot | Candidate | Stage | Note |
|---|---|---|---|
| 01 | 01-ez1 (+03 shared port) | **(a) GREEN; (b)+(c) GREEN — master_identity PROVED + anchor** (TOP-3 #3) | tightness companion landing |
| 22 | 22-quasi-rh-pnt-effective | **PROVED-TO-M4 (ψ(x)/x → 1)**; M5/M6 skipped by rule | run1–12 logs |
| 11 | 11-z1 | **M1 COMPLETE** | RedCompA/B, P11T1/T2 |
| 42 | 42-zeta-k-two-thirds | **M1/M2a/M3/M2b GREEN — landing theorems proved** (TOP-3 #1) | `candidates/42-*.md` § Pilot outcome |
| 50 | 50-quasi-rh-truncated | **M1 + M2a (Dirichlet) PROVED** | `pilots/50/` |
| 32 | 32-rc-savings-frontier | **M1 GREEN** (frontier formula, phase transition, ceiling) | `pilots/32-blueprint.md` |
| 30 | 30-hall-parseval | **Theorem B REFUTED (kernel) + closed form B′ PROVED** | `pilots/30-note.md` |
| 20 | 20-hecke-zetaK | **M1 GREEN** (conditional core + hCZ seam) | `20-blueprint.md`, `20-hCZ-NOTE.md` |
| 10 | 10-z3 | **M1 (= L3) PROVED axioms-clean 2026-11-10** (TOP-3 #2; G1 = CASE A → GO): `exists_tm_space` — eth's host in eth's time AND poly(\|x\|) stack space ∀t, + openai monitor form; unconditional, 0 binders, 135/135 thms ⊆ std axioms | `10-prework.md`, `10-blueprint.md`, `pilots/10/` (M1.lean, logs run1–4); next: L1 counter combinators, L2 PolyTVal |
| 21 | 21-quartic-window | **milestone-C DONE, certified** (cStar(1)−cFun_quartic ≥ 3.87e-4: B closed, A2 kernel) | `21-milestoneC.md` |

## Deferred-fix register (H-owned list) — CLOSED 2026-11-09 night (Task 11): all fixes applied (12 sites / 8 dossiers: 10,11,12,30,32,40,42,50; 41 verified already-clean); only 51/52's Part-4 minors remain documented-not-applied (R2 scope). Historic list:

Locator fixes verified by QA but NOT yet applied (R9 was appending F4 sections to these files;
apply next task): dossiers 10, 11, 12, 40, 42, 50 — exact edits in
`qa/dossiers-spotcheck.md` Part 2 "Deferred-fix register". Pending orchestrator sign-off (R5's
files, outside this task's fix list): dossier 21 (quartic file-count, cFun-consumption wording),
dossier 22 (zeta_growth_right name, ψ-mention wording).

## File ownership

- Every file under `research/` has exactly ONE writer lane (the owner listed above).
- Reads are free: any lane may read any file at any time.
- H owns only `STATUS.md`, `INDEX.md`, `research/qa/*`, `research/candidates/TEMPLATE.md`, and
  holds **maintenance** (post-QA errata only) of `research/survey/anthropics.md`,
  `research/survey/mathlib-frontier.md`, and `research/feasibility/mathlib-verification.md`
  (transfers authorized by the orchestrator 2026-11-09; R3/R9 informed). H never edits other
  researchers' files; researchers never edit `STATUS.md`/`INDEX.md` — route status changes
  through the orchestrator.
- New files: a lane creates files only inside its own output area; anything else needs
  orchestrator sign-off (recorded here).
- `RESEARCH.md` is owned by the orchestrator.

## Cycle 2 (2026-11-13)

Opened by the orchestrator (charter addendum: `RESEARCH.md` § Cycle 2). Scope: re-run
Phases 1–4 over the AxiomMath corpus (`axiommath/` siblings — consumable donors on our pin
mathlib `ff2494ea` / v4.36.0-rc2 per `feasibility/axiommath-bump/`), plus the open main-run
pilot items. The main-run sections above are frozen as history; **this section is the live
board.** Same ground rules, same Phase 1–4 definitions.

### Cycle-2 lane board

| Lane | Role | Output file | Status | Since / note |
|---|---|---|---|---|
| A1 | axiommath-surveyor | `research/survey/axiommath.md` | RUNNING | Phase-1 survey of the six AxiomMath repos (DedekindZetaZeroFree, ZetaZerosV2, ZetaZeros, PrimeNumberTheoremAnd, Weil, AreaLaw2D) |
| A2 | function-field-bridge | `research/bridges/function-field.md` | RUNNING | Phase-2 bridge: Weil conjectures (Deligne RH over 𝔽_q) ↔ zeta/quasi-RH cluster; function-field analog |
| A3 | donor-remap | `research/novelty/axiommath-as-donor.md` | RUNNING | Remap main-run candidates with AxiomMath as donor (hQRH discharge via Cureton–Thorner for 20/50; ZetaZerosV2 second donor for 42) |
| A4 | area-law-bridge | `research/bridges/area-law.md` | RUNNING | Phase-2 bridge: AreaLaw2D (openai family 265) ↔ openai-math ↔ linear algebra |
| A5 | novelty | `research/qa/make-decl-index-v2.sh` + `research/novelty/round-4.md` | RUNNING | decl-index v2 builder incl. axiommath trees; novelty round 4 over the 70-series |
| A6 | pilot-10 | `research/pilots/10/` | RUNNING | L1 counter combinators first, then L2 `PolyTVal` (M1 = L3 green, axioms-clean, 2026-11-10) |
| A7 | feasibility | `research/feasibility/axiommath-donor-probes.md` + `research/feasibility/probe/logs-g/` | RUNNING | Donor-consumption probes against the axiommath builds on our pin (feeds A3 verdicts) |
| A8 | pilot-52/20 | `research/pilots/52/`, `research/pilots/20/` | RUNNING | 52 fix-or-close first, then 20 close-out (M1 run unrecorded) |
| A9 | dossier-writer | `research/candidates/70-*.md` + skeletons `71-*`/`72-*` | RUNNING | New 70-series dossiers from A1–A4 outputs; `candidates/TEMPLATE.md` applies |
| H | helper | `STATUS.md` + `INDEX.md` + `research/qa/*` + `TEMPLATE.md` maintenance + all repo commits | RUNNING | Same charter as main run; runs Cycle-2 commit log below |

File ownership, carried over verbatim from the main run: every file under `research/` has
exactly ONE writer lane (the owner listed above); reads are free — any lane may read any
file at any time; researchers never edit `STATUS.md`/`INDEX.md` — status changes are routed
through the orchestrator. **Cycle-2 relay:** A-lanes report status to the orchestrator, who
relays to H. New files: a lane creates files only inside its own output area; anything else
needs orchestrator sign-off (recorded here). `RESEARCH.md` and `TRIAGE.md` remain
orchestrator-owned.

### Cycle-2 pilots pipeline

| Pilot | Item | Stage | Note |
|---|---|---|---|
| 10 | 10-z3: L1 counter combinators, then L2 `PolyTVal` | IN FLIGHT (A6) | M1 (= L3) green + axioms-clean 2026-11-10; L1/L2 are the open items |
| 52 | 52 unified CCR Fock layer | MID-FLIGHT (A8) | M1 FAIL mid-iteration (axcheck run1; run2 in `pilots/_unattributed/`); fix-or-close decision due |
| 20 | 20-hecke-zetaK close-out | M1 GREEN, RUN UNRECORDED → close-out (A8) | Rescue/record M1 run evidence + hCZ seam (`20-hCZ-NOTE.md`); after 52 |
| 50 | 50-M3 donor-swap (prospective) | PENDING A3/A7 VERDICTS | Discharge `hQRH` binder from DedekindZetaZeroFree (Cureton–Thorner ζ_K ≠ 0, Re s > 31/32) |
| 42 | 42-M4 second donor (prospective) | PENDING A3/A7 VERDICTS | ZetaZerosV2 (Lamzouri > 2/3 simple/on-line) as donor for remaining milestones |

### Cycle-2 commit log (H)

- 2026-11-13 — opening checkpoint `Cycle 2 open: charter addendum, lane board, index`:
  `RESEARCH.md` (orchestrator's Cycle-2 addendum) + this STATUS section + INDEX [expected]
  entries. [this commit]
