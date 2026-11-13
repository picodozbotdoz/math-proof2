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

## Deferred-fix register (H-owned list) — CLOSED. Main run closed 2026-11-09 night (Task 11: 12 sites / 8 dossiers: 10,11,12,30,32,40,42,50; 41 verified already-clean). **Final closure 2026-11-13 (Cycle-2 orchestrator sign-off):** dossier 21/22's Part-2 minors verified ALREADY APPLIED on disk (2026-11-09 inline errata, 4 sites — re-verified true-as-written 2026-11-13: XiPrime quartic count 23 recursive ✓, cFun token in 74 zeta23 files with no ∀v-optimality theorem ✓, `zeta_growth_right_at` :119 ✓, ψ restated to the `Hypotheses.lean:80` comment mention ✓); dossier 51/52's Part-4 minors APPLIED 2026-11-13 by H — 51: 5 sites (Claim.lean pins :12→:18, :28→:32, :39→:40, :63→:49 ×2 + Gate|Program word-boundary restatement); 52: 4 sites (`annihilate_create_inner` named, `annihilate_normSq` name, Heisenberg 35→33, `Algebra/Lie/UniversalEnveloping/PBW/Weighted/Heisenberg.lean` path) — each re-verified true-as-written before editing. Register fully closed. Historic list:

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
| A1 | axiommath-surveyor | `research/survey/axiommath.md` | RUNNING | survey landed 2026-11-13; QA P1 DONE (10 OK / 2 minor, 0 WRONG — Part 2; fixes routed to A1); PNT+ deep-dive addendum `survey/axiommath-pntplus.md` landed (commit pending batch) |
| A2 | function-field-bridge | `research/bridges/function-field.md` | RUNNING | bridge v1 + dictionary-zone update landed 2026-11-13 (QA pass P2 pending) |
| A3 | donor-remap | `research/novelty/axiommath-as-donor.md` | RUNNING | donor map + Liu-1 erratum landed; 42-M4/50-M2 execution specs landed; QA P4 DONE (8 OK / 2 minor pins — Part 1); 42-M4 GO + 50 GATED verdicts relayed; M4a.lean on disk (mid-flight, uncommitted) |
| A4 | area-law-bridge | `research/bridges/area-law.md` | RUNNING | bridge v1 + zone update + 72-prework + quantum-info substrate map landed 2026-11-13 (QA P3 pending; Physlib-import premise flag from QA P5c routed) |
| A5 | novelty | `research/qa/make-decl-index-v2.sh` + `research/novelty/round-4.md` | RUNNING | decl-index v2 built + zip tracked; round-4 PART 1+2 landed (QR-D precision pass — Liu-1/CT split, binding) + VERDICTS Cycle-2 addendum; dossier-level PART-2 queries vs 70–72 landing next |
| A6 | pilot-10 | `research/pilots/10/` | RUNNING | L1 counter combinators first, then L2 `PolyTVal` (M1 = L3 green, axioms-clean, 2026-11-10) |
| A7 | feasibility | `research/feasibility/axiommath-donor-probes.md` + `research/feasibility/probe/logs-g/` | RUNNING | Donor-consumption probes against the axiommath builds on our pin (feeds A3 verdicts) |
| A8 | pilot-52/20 | `research/pilots/52/`, `research/pilots/20/` | RUNNING | close-outs DONE 2026-11-13: 52 M1 VERIFIED-GREEN (`52-note.md`), 20 runs recorded GREEN (`20-note.md`) |
| A9 | dossier-writer | `research/candidates/70-*.md` + skeletons `71-*`/`72-*` | RUNNING | 70/71/72 FINAL, 73 pre-registered (Hecke–Tate), 75 in flight; dossier production parallelized with A4 (74 = surprisal-moment-hierarchy-ceilings); QA P5a–c DONE (22 OK / 2 minor, 0 WRONG — Part 3; fixes routed) |
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
| 52 | 52 unified CCR Fock layer | **M1 VERIFIED-GREEN** (A8 close-out 2026-11-13, see `pilots/52-note.md`; main-run FAIL was mid-iteration, superseded same-day by run14-green + axcheck-final) | reproduced Cycle 2: `m1-run15-cycle2-green` + `axcheck-cycle2` (15 axiom-lines, 0 sorryAx); `_unattributed/` emptied (run2 attributed); M2 = weighted refinement + adjointness layer |
| 20 | 20-hecke-zetaK close-out | **CLOSED (A8)**: M1 run recorded GREEN, `pilots/20/logs/m1-cycle2-green.log`, note `20-note.md` | axcheck-cycle2 OK 36 axiom-lines 0 sorryAx; ledger §8 addendum; hCZ seam unchanged (`20-hCZ-NOTE.md`); A3: no hCZ/Card20 deltas — Hecke object layer may switch openai→DZDF at 31/32 (note only) |
| 50 | 50-M2-31/32 (donor-swap; A3 verdict in) | **GATED on A7/G1** (DZDF full build — vendor-CFT v4.35 blocker; fallback = statement-binder `hDZ` route) | hQRH@7/8 NOT dischargeable by DZDF (7/8 ⊋ 31/32); weakened 31/32 binders discharge at K = ℚ → unconditional [1/32, 31/32] strip, OAI-port-free; spec landed `pilots/50-M2-31-32-spec.md`; NOTE (2026-11-13): hQRH ζ-class formally dischargeable at FULL strength via external Liu-1 donor (registration `2d5a663`; probe pending A7/G7) |
| 42 | 42-M4 donor swap to V2 | **GO — spec in flight (A3), pilot lane pending** (blueprint landed: `pilots/42-M4-blueprint.md`) | V2 `simple_proportion_lower` C₀ = 0.6725 > 2/3 + `distinct_proportion_lower` C₁ = 0.83625 > 5/6 discharge ζ-side binders unconditionally, hCert dropped; QA-confirmed precondition: strip-distinct re-vocabulary fix (donor map §c(2), QA Part 1 item 8) |

A3 donor-verdict sweep (2026-11-13, `novelty/axiommath-as-donor.md` §Verdict summary): **20/22/21/40 — NO donor deltas** (hCZ + stop-at-M4 statuses unchanged; 20's Hecke object layer may switch openai→DZDF at 31/32 — note only); new cross-cutting donor `dedekindAbelianQuotient` (general-abelian factorization, 70-series feeder). QA P4 executed: 8 OK / 2 minor pins / 0 WRONG (`qa/cycle2-qa-plan.md` Part 1); two locator fixes routed to A3.

**Donor registrations (Cycle 2):** `liu-zerofree/` registered 2026-11-13 (orchestrator; rev
`7d10420`, v4.34.1, shallow clone, world-readable) — Liu arXiv:2610.12234 companion,
zero-free Re s > 0.8749570 for every Dirichlet L incl. ζ; B_new < 7/8 ⇒ its half-plane
strictly contains the 7/8 region, so pilot 50's `hQRH` class (ζ/Dirichlet) is formally
dischargeable at full strength (external donor #2 of the QR-D cluster, after DZDF).
Not built on our pin — probe pending A7/G7. AGENTS.md sibling list updated.

**External donor-candidate register** (decision-traceability for sibling growth):
- Liu-1 (`liubaiying101/Slightly-improved-…`): **REGISTERED** (clone + AGENTS.md, commit
  `2d5a663`); consumer = pilot 50 `hQRH` class; probe = A7/G7 (pending).
- upstream PNT+ (`AlexKontorovich/PrimeNumberTheoremAnd` @ `938912bb`, 2026-11-12):
  **DEFER-WATCHLIST** per A1-3's recommendation (`novelty/pntplus-glue-as-donor.md` §c) —
  facts: v4.35.0 / mathlib `56a00585` (a generation behind our pin); sorry-free asymptotic
  core incl. StrongPNT (triad via `#guard_msgs`); 272 sorry-lines confined to
  IEANTN/IwaniecKowalskiCh1; 39/75 Mathlib-subtree files drifted fork-vs-upstream; tree
  mid-flight (IEANTN → teorth/IEANTN). **Registration triggers (verbatim):** T1 a T2a
  pilot wanting the upstream Borel–Carathéodory chain (StrongPNT.lean:76–1536); T2 a
  PNT-AP/Chebotarev consumer (overlaps tauceti); T3 upstream reaching v4.36-class pins.
  Until a trigger fires: cite as external-formal-prior-art (Liu-1 convention); do NOT
  clone.

### Cycle-2 commit log (H)

- 2026-11-13 — opening checkpoint `Cycle 2 open: charter addendum, lane board, index`:
  `RESEARCH.md` (orchestrator's Cycle-2 addendum) + this STATUS section + INDEX [expected]
  entries. (313c506)
- 2026-11-13 — `Cycle 2: main-run errata closure (dossiers 21/22/51/52 Part-2/4 minors,
  orchestrator sign-off)`: candidates/51 (5 sites) + candidates/52 (4 sites) applied with
  inline errata; 21/22 verified already-applied (no diff needed); `qa/cycle2-qa-plan.md`
  committed — pre-registration complete, QA passes P1–P6 unblocked; deferred-fix register
  closed. (de5d8dc)
- 2026-11-13 — `Cycle 2: A8 close-outs — pilot 52 verified-green, pilot 20 runs recorded`:
  `pilots/52/` (run_m1.sh, run15-green + axcheck-cycle2 logs, 52-note) + `pilots/20/`
  (run_m1.sh, m1-cycle2-green + axcheck-cycle2 logs, 20-note); board updates routed by the
  orchestrator: STATUS pilot rows 52/20, INDEX pilots-logs line, VERIFICATION-LEDGER §8
  (incl. MODAL_USER=doz substrate note). (6263625; notes follow-up 26bd2bc)
- 2026-11-13 — per-lane provenance commits: `Cycle 2: A1 axiommath survey (fifth corpus,
  on-pin)` (0cf230a); `Cycle 2: A2 function-field bridge (Weil <-> quasi-RH cluster)`
  (6e32734); `Cycle 2: A4 area-law bridge (AreaLaw2D <-> openai family 265 <-> linalg)`
  (31600ad); `Cycle 2: A3 donor remap — axiommath-as-donor (50/20/42/22/21/40 verdicts +
  M4 spec)` (bc46876); `Cycle 2: A5 decl-index v2 + novelty round-4 part 1` (75168b2 —
  incl. the APPROVED root .gitignore entry and the tracked decl-index-v2.tsv.zip).
- 2026-11-13 — `Cycle 2: H board — A3 verdict rows + QA P4 donor-remap` (this commit):
  STATUS pilot rows 42-GO/50-GATED per relay + A3 sweep note + lane-landing notes;
  `qa/cycle2-qa-plan.md` Part 1 (P4 executed: 8 OK / 2 minor / 0 WRONG; V1
  Challenge-file sorry caveat recorded; A3's §c(2) QA flag CONFIRMED load-bearing).
  (0079dc3)
- 2026-11-13 — `Cycle 2: register Liu-1 zero-free repo as sibling donor (read-only)`:
  shallow clone at `/home/doz/zcode-workdir/liu-zerofree/` (rev `7d10420`,
  v4.34.1); AGENTS.md sibling bullet; STATUS donors note. No probe/build (A7 owns G7).
  (2d5a663)
- 2026-11-13 — dossier-wave + lane-update series: `A1 PNT+ deep-dive addendum` (f647e69);
  `dossiers 70/71/72 final + 73 pre-registered; TRIAGE/REPORT Cycle-2 addenda` (539a1c2 —
  the held TRIAGE/REPORT addenda released here per relay); `A2 function-field bridge
  update` (d056c80); `A4 area-law update + 72 prework + substrate map` (6b0791c); `A3
  donor-map Liu-1 erratum + 42-M4/50-M2 specs` (9d3949f); `A5 round-4 part 2 + VERDICTS
  Cycle-2 addendum` (8a109fd); `A1 PNT+-glue donor map (upstream DEFER-WATCHLIST)`
  (124cdf9).
- 2026-11-13 — `Cycle 2: H — dossier-wave board/INDEX + QA P5a-c` (this commit): STATUS
  donor-candidate register (upstream-PNT+ DEFER-WATCHLIST, triggers T1–T3 verbatim),
  pilot-50 Liu-1 note, A-lane landing notes, A9 wave row; INDEX rows for the wave (70–73
  landed, 74/75 [expected], pntplus ×2, substrate map, pilot specs/prework); QA Part 3
  (P5a–c: 70 7/1, 71 8/0, 72 7/1 — 0 WRONG; Physlib-premise flag routed to A4/A7-G5).
