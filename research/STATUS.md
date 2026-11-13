# STATUS — coordination board

Last updated: 2026-11-09, resume session (project close); pilot-10 row 2026-11-10 (pilot-10 lane, per the coordinating session's task); Cycle-2 board 2026-11-13 (H, per orchestrator);
Cycle-2 relaunch block 2026-11-14 (H, per orchestrator). This file is the single source of truth for
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
| A2 | function-field-bridge | `research/bridges/function-field.md` | RUNNING | bridge v1 + dictionary-zone update landed 2026-11-13; QA P2 DONE (9 OK / 1 minor census, 0 WRONG — Part 4; census-command fix routed) |
| A3 | donor-remap | `research/novelty/axiommath-as-donor.md` | RUNNING | donor map + Liu-1 erratum landed; 42-M4/50-M2 execution specs landed; QA P4 DONE (8 OK / 2 minor pins — Part 1); 42-M4 GO + 50 GATED verdicts relayed; M4a.lean on disk (mid-flight, uncommitted) |
| A4 | area-law-bridge | `research/bridges/area-law.md` | RUNNING | bridge + 72-prework + substrate map + **dossier 74 (AL-EZ2)** landed 2026-11-13; QA P3 DONE (9 OK / 1 minor pin, 0 WRONG — Part 4); Physlib note CORRECTED by H (Part 4 erratum: import real at PartialTrace.lean:4, staging cost stands); A5's row-74 u≠1 glue note → small dossier-74 edit expected |
| A5 | novelty | `research/qa/make-decl-index-v2.sh` + `research/novelty/round-4.md` | RUNNING | decl-index v2 + zip tracked; round-4 PART 1+2, VERDICTS Cycle-2 addendum, RELATED-WORK update, **liu1-as-donor audit** (constant mismatch found: 34999/40000 vs README) landed; DLRT §5.2(c) erratum applied by H per A5 P2-3 |
| A6 | pilot-10 | `research/pilots/10/` | RUNNING | L1 counter combinators first, then L2 `PolyTVal` (M1 = L3 green, axioms-clean, 2026-11-10) |
| A7 | feasibility | `research/feasibility/axiommath-donor-probes.md` + `research/feasibility/probe/logs-g/` | RUNNING | Donor-consumption probes against the axiommath builds on our pin (feeds A3 verdicts) |
| A8 | pilot-52/20 | `research/pilots/52/`, `research/pilots/20/` | RUNNING | close-outs DONE 2026-11-13: 52 M1 VERIFIED-GREEN (`52-note.md`), 20 runs recorded GREEN (`20-note.md`) |
| A9 | dossier-writer | `research/candidates/70-*.md` + skeletons `71-*`/`72-*` | RUNNING | 70/71/72/75 FINAL (75 = 70-Part-B split-out), 73 pre-registered, 74 written by A4 (parallelized); REPORT-INPUTS-C2 pack landed (A9-6, ownership via H); QA P5a–c DONE (22 OK / 2 minor, 0 WRONG — Part 3; fixes routed); P5d/e queued (73 unfilled-exempt, 74/75 next) |
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
| 50 | 50-M2-R1 (gated continuation; A3) | **GATED on A7/G1** (DZDF full build — vendor-CFT v4.35 blocker; fallback = statement-binder `hDZ` route) | hQRH@7/8 NOT dischargeable by DZDF (7/8 ⊋ 31/32); weakened 31/32 binders discharge at K = ℚ → unconditional [1/32, 31/32] strip, OAI-port-free; spec landed `pilots/50-M2-31-32-spec.md`; NOTE (2026-11-13): hQRH ζ-class formally dischargeable at FULL strength via external Liu-1 donor (registration `2d5a663`; probe pending A7/G7) |
| 42 | 42-M4b-upgrade (gated continuation; A3) | **COMPLETE — primary route, FORMAL REPORT RECEIVED (A3 terminal batch 4323178, 2026-11-14: both routes GREEN; final = PRIMARY, 1,571 LoC/68 thms canonical; full-coverage axcheck 98 prints/72 names triad-only; M4-note landed; run1 anomalies discharged — counter regex story, see debts register b/c/j)** | V2 `simple_proportion_lower` C₀ = 0.6725 > 2/3 + `distinct_proportion_lower` C₁ = 0.83625 > 5/6 discharge ζ-side binders unconditionally, hCert dropped; QA-confirmed precondition: strip-distinct re-vocabulary fix (donor map §c(2), QA Part 1 item 8) |
| 11 | 11-M2 (A8-3, authorized) | RUNNING | pilot-11 revival: `pilots/11/{P11T3,RedTm2}.lean` + `run_pilot11.sh` on disk, mid-flight (committed with A8's report) |
| 71 | 71-P2 + 73-C skeleton (slot; A2, executing) | **71-P2 FINAL-GREEN (disk-verified 2026-11-14: p2-run6 "P2.lean: OK", 282 LoC/11 thms, ALL triad, 0 sorry; W1 honestly corrected as pole-family exclusion — A2 official report pending, incl. 73-C: Q0 probe CONFIRMED run1-q0, skeleton executing)** | Cycle-2 pilot-decision slot 1 (see decision block below) |
| 72 | 72-M1 Tier-C (slot; A8, after 11-M2) | **SLOTTED — queued behind 11-M2**; **C-neg: FINAL-GREEN OFFICIAL (A4 report 2026-11-14, commit 80dfd4b)** — run8 OK rc=0 errors=0 sorry=0, axcheck 11/11 declarations (5 public + 6 private) triad-only; run1–5 headers reconstructed+marked; deviations vs Appendix A documented (N1 regime 0<α≤β<1; N3 concrete-family False forms; Kuwahara as `hKL` binder) | Cycle-2 pilot-decision slot 2 (see decision block below) |
| 75 | 75 abelian-assembly | **EXECUTING NOW (decision 2026-11-14: wave-4 pull-forward — the FINAL Cycle-2 pilot; lane A4; P-a then C1 per `pilots/75-prework.md`)**; A1 adds 75 to sweep TARGETS | Was DEFERRED to wave-4 (decision superseded 2026-11-14); spec complete |

**Cycle-2 pilot decision (orchestrator, 2026-11-13; TRIAGE Cycle-2 §decision typesets when
A9's staging `TRIAGE-C2-ROWS.md` lands):** slots = **71-P2 + 73-C skeleton (A2, executing)**
and **72-M1 Tier-C (A8, after 11-M2)**; **75 deferred to wave 4**; **42-M4b-upgrade and
50-M2-R1 = gated continuations (A3)**. Decision basis = the empirical record (M4a ~180 LoC
green; 71-P0/P1 243 LoC green; zone-owner memos); A7 grades [incoming].

A3 donor-verdict sweep (2026-11-13, `novelty/axiommath-as-donor.md` §Verdict summary): **20/22/21/40 — NO donor deltas** (hCZ + stop-at-M4 statuses unchanged; 20's Hecke object layer may switch openai→DZDF at 31/32 — note only); new cross-cutting donor `dedekindAbelianQuotient` (general-abelian factorization, 70-series feeder). QA P4 executed: 8 OK / 2 minor pins / 0 WRONG (`qa/cycle2-qa-plan.md` Part 1); two locator fixes routed to A3.

**Donor registrations (Cycle 2):** `liu-zerofree/` registered 2026-11-13 (orchestrator; rev
`7d10420`, v4.34.1, shallow clone, world-readable) — Liu arXiv:2610.12234 companion,
zero-free Re s > 0.8749570 for every Dirichlet L incl. ζ; B_new < 7/8 ⇒ its half-plane
strictly contains the 7/8 region, so pilot 50's `hQRH` class (ζ/Dirichlet) is formally
dischargeable at full strength (external donor #2 of the QR-D cluster, after DZDF).
**Constant story (resolved 2026-11-13 by A1's full-tree sweep, `novelty/liu1-hygiene-sweep.md`;
supersedes the earlier A5 "README↔Lean mismatch" caution):** README's 0.874957069799 = Lean's
`B_new = (1507 − 2√921)/1653` exactly (the ~5e-10 delta was the paper's decimal); the public
entry deliberately uses weakened rational `B_r = 34999/40000` with `boundary_order :
B_new < B_r < 7/8` PROVED and consumed by the headlines. Full-tree hygiene: 0 sorry /
0 axiom / 22-22 expected names. **Replay prerequisite (H note):** no `vendor/` tree ships —
`verify.py` needs manual population of 2,925 `vendor/OAI` modules @ openai/math `adc7f124`
(closure_manifest pins; no fetch script). Still **statement-level only** until probed on our
pin (A7/G7). AGENTS.md sibling bullet updated to the resolved phrasing.

**Untracked-by-decision:** `AGENT_INSTRUCTION_1.md` (repo root) is a user-placed instruction
to the orchestrator (concurrency audit, being acted on) — LEAVE in place, UNTRACKED, never
commit/delete (orchestrator disposition 2026-11-13).

**Concurrency probe (standing, per user instruction):** at each watch poll H also counts
live agent processes — command: `ps -eo comm --no-headers | grep -cx zcode-cli` (live zcode
CLI agent sessions; includes the orchestrator's own session — the desktop app's
Electron/zygote helpers are excluded by the exact-comm match). First measurement:
**8** at 2026-11-13 22:1x (= 7 lane sessions + orchestrator, consistent with the user's
observed max-7 concurrent); second **13** at batch close (orchestrator attribution:
>10 = transient subagent CLIs overlapping; steady-state ≈ lanes+1). Raw counts accompany
every future batch report.

**Watch attributions (orchestrator, 2026-11-13 — no ownership violations):** `pilots/11/`
activity = lane A8's authorized A8-3 assignment (pilot 11-M2, running);
`research/TRIAGE-C2-ROWS.md` = lane A9's orchestrator-authorized staging file; the
`survey/openai-math.md` + `survey/tauceti.md` modifications = lane A1-5's authorized
QA fixes-in-place (trivial-and-uncontested class, erratum lines). A2's census-command fix
(QA P2 minor) routed via the orchestrator into A2's next queue.

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
- **hexagonmath.org archive sweep is ORCID-gated** (A5 flag, 2026-11-13): novelty sweeps
  there are PASS-conditional via indirect evidence only (e.g. Liu-2's bibliography citing
  only CT); record this caveat on every claim whose absence-evidence rests on that archive.

**QA routing note (orchestrator, 2026-11-13):** pass **Q7** (A7's
`feasibility/axiommath-donor-probes.md` — G-verdicts incl. G1b-FAIL 62 errors/11 modules
already cited by A1) is owned by **A5**; H does not duplicate it. H's remaining plan
passes: Q5f (dossier 75) + P6a/b/e/f on lane-report triggers. `research/AGENTS-C2-DRAFT.md`
(A1, 89 ln) is on disk and **held UNAPPLIED until cycle close** — then applied under the
standing authorization with a commit.

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
- 2026-11-13 — `Cycle 2: H — dossier-wave board/INDEX + QA P5a-c`: STATUS
  donor-candidate register (upstream-PNT+ DEFER-WATCHLIST, triggers T1–T3 verbatim),
  pilot-50 Liu-1 note, A-lane landing notes, A9 wave row; INDEX rows for the wave (70–73
  landed, 74/75 [expected], pntplus ×2, substrate map, pilot specs/prework); QA Part 3
  (P5a–c: 70 7/1, 71 8/0, 72 7/1 — 0 WRONG; Physlib-premise flag routed to A4/A7-G5).
  (66406e4)
- 2026-11-13 — wave-2 series: `A4 dossier 74 (AL-EZ2 moment-hierarchy ceilings)`;
  `A9 dossier 75 (70-Part-B split-out) + REPORT-INPUTS-C2 pack`; `A1 vendored-CFT survey`;
  `A5 liu1-as-donor audit + round-4/RELATED-WORK updates`; `H errata — DLRT qualifier
  (A5 P2-3), Liu-1 constant caution, board notes` (AGENT_INSTRUCTION_1 disposition,
  concurrency-probe documentation; VERDICTS §5.2(c) + CLAIMS-REGISTER row 42 fixed).
  (2214b54, b564482, 675e319, 2513c27, 1e82a54)
- 2026-11-13 — `Cycle 2: H — QA P2/P3 + pilot audits P6c/d (+ P5c Physlib correction)`
  (this commit): qa plan Part 4 — P2 9/1, P3 9/1, P6c 5/5, P6d 5/5, 0 WRONG; H erratum
  retracting Part 3's Physlib tilt (import real via `QuantumInfo.ForMathlib.Matrix` at
  PartialTrace.lean:4; manifest mathlib stale db584cd6 — G5 staging cost stands);
  hexagonmath ORCID caveat recorded; VERDICTS C2 completeness glanced (rows 70–75 intact,
  73 [incoming], standing notes present). Cumulative plan tally: 0 WRONG. (4075e84)
- 2026-11-13 — wave-3 series: `A7 donor-probe verdicts + ProbeG series + logs-g` (24e8d93);
  `A9 dossier QA fixes + 73 filled + 75 revision + TRIAGE-C2 staging` (1bc1151); `A2 FF
  sequencing memo + 71/73 prework + pilot-71 P0/P1` (28fe244); `A4 area-law/72-prework
  fixes + pilot-72 C-neg start` (f329a8c); `A5 DLRT propagation + VERDICTS/CLAIMS-REGISTER
  row updates` (c046e8e); `A1 survey fixes-in-place + spotchecks + liu1 hygiene sweep`
  (abd8db3).
- 2026-11-13 — `Cycle 2: H — QA Q5d/e + INDEX reconciliation + Liu-1 resolution` (this
  commit): qa plan Part 5 (P5d 7/1, P5e 7/1, 0 WRONG; 73's hPur-correction and :12-locator
  both CONFIRMED present; 74's u≠1 line queued to A4); INDEX reconciled (survey QA flips,
  8 new rows); Liu-1 caution UPGRADED to the resolved triple phrasing (A1 sweep; AGENTS.md
  + register) + vendor replay-prerequisite note; Q7 routed to A5; AGENTS-C2-DRAFT held
  unapplied until cycle close.
- 2026-11-13 — `Cycle 2: H — pilot-decision board, REPORT DLRT erratum, watch attributions`
  (this commit): Cycle-2 pilot decision recorded in the pipeline (slots 71-P2+73-C / 72-M1
  Tier-C; 75 deferred wave-4; 42-M4b + 50-M2-R1 gated continuations); REPORT §1 DLRT
  qualifier erratum applied (A5 P2-3); probe readings 8→13 + orchestrator attribution
  recorded; watch attributions block (A8-3 / A9 staging / A1-5 fixes-in-place).
- 2026-11-14 — `Cycle 2: H — relaunch board + disk-state verification + INDEX
  reconciliation` (this commit): relaunch block above (10 lanes + assignments per
  RESUME-BRIEF-C2); six wrap claims disk-verified CONFIRMED (minors: M4b 1,560 vs ~1,557
  LoC; RedTm2 392 vs 386 LoC); one wrap-claim correction — INDEX was NOT current through
  the wrap (6 missing rows + 4 stale UNCOMMITTED flags, fixed); A2 already live
  (71/p2-run1.log: FAIL rc=1 errors=6 sorry=0, provenance header present, file left for
  A2's batch commit); concurrency probe 8 at this batch close. (f860280, fixup 9bdc1bd)
- 2026-11-14 — batch-2 series (per orchestrator relay): `Cycle 2: A9 dossier-70 clock-sweep
  notes + 75 splice fix + Pilot-outcome templates` (7d4189d); `Cycle 2: A1 ledger §9 filled
  + sweep machinery pre-verified + run_axcheck substrate fix` (5aada35); `Cycle 2:
  mid-flight snapshot — A3 M4b fallback GREEN / A2 p2-run1 / A7 logs-g run19–21`
  (942828c, ca4fd22 precedent); `Cycle 2: H — REPORT §C2 pre-stage + triage-decision
  staging brief + board/INDEX` (this commit): REPORT.md Cycle-2 addendum pre-staged with
  fill-in placeholders; qa/triage-decision-staging.md (one-screen orchestrator input);
  QA pass on batch-2 landings 7/7 OK (cumulative 0 WRONG).
- 2026-11-14 — `Cycle 2: A1 — ITERATION4-SCAN (next-cycle groundwork inputs) + ledger
  71-P2 run2 row` (2dc7963, drain relay; ownership confirmed: `articles/*` = A9,
  `feasibility/ITERATION4-SCAN.md` = A1 — commits held until each drain). `Cycle 2: H —
  AGENTS-C2 apply-plan dry-run` (this commit): `qa/agents-c2-apply-plan.md` — the 7-edit
  one-pass application sequence for the held draft (3 structural conflicts resolved:
  liu-zerofree duplicate, xyz-CLI stale clause, pre-relaunch app list; AGENTS.md:54 B_new
  decimal typo flagged for drive-by fix; STATUS slot-2/3 normalization wording staged at
  its tail). Nothing applied.
- 2026-11-14 — `Cycle 2: A5 — QuasiRiemannTracker audit (r4 §9) + §5.3/§8.1 post-outage
  repairs + row-70 propagation` (3056d0d, drain relay): tracker audited via clone +
  browser (site **gtimg.github.io/QuasiRiemannTracker** — the briefing's
  "quasiriemann.org" was WRONG); verdict kernel-grade (tri-kernel replay: Lean + NanoDa
  0.4.26 + con-ron, triad axioms, adversarial controls, hash-bound receipts);
  **Dirichlet-only at every layer ⇒ row-70 per-class ζ_K split SURVIVES**; no
  conditional-results class (Chang–Wang/Liu-2/CT absent); formal Dirichlet frontier
  **0.8733458561** (Bebel continuum-anchor 11-13) below the conditional informal one
  since 10-26; Liu B_new tracked at the exact surd; DO-NOT-CONSUME (their
  infrastructure, per-entry vendored 4.34.1 trees). VERDICTS row 70 + standing note 5,
  CLAIMS-REGISTER row 70 + standing-clocks line, RELATED-WORK cluster bullet (incl.
  **DrMurphyIsIn/qrh-debruijn-newman: kernel-checked Λ ≤ 9/32 — main-run round-1 §12's
  "Λ absent everywhere" gap TAKEN by a third party**, recorded donation-surface-note
  only). H QA on the batch: 5/5 OK, 0 WRONG (all relayed citation values verified in-file;
  A9's dossier-70 note-4 fold already on disk, values consistent — no lag).
- 2026-11-14 — `Cycle 2: A1 — ITERATION4-SEED-DOSSIERS + scan updates + ledger §9
  descent rows` (6a672a4, second drain): top-3 seeds AL-3D / LP-duality / ZZV2-λ
  ([NOVELTY-CHECK-NEEDED] + [A5-triage-pending] marks respected); scan §1c tracker
  standing-clock rewrite (static-asset curl protocol — no browser pass needed) + §3
  note 9; ledger §9: P2 descent 6→4→2→1, C-neg 7→3→1 (run7), 11-M2 P11T3 GREEN (four
  fixes green) / RedTm2 4→2. `Cycle 2: H — DLRT sweep + close TEMPLATE + INPUTS-C2
  refresh` (this commit): Part-7 DLRT-erratum propagation sweep (qa/cycle2-qa-plan.md) —
  all H/A5 surfaces correct, **3 residuals flagged for relay** (TRIAGE.md:137–138
  orchestrator-owned; candidates/42:355 + articles/42:28,:149 A9-owned); REPORT-INPUTS-C2
  §4 DLRT row refreshed (row-42 application recorded); STATUS cycle-close TEMPLATE
  pre-staged at tail (NOT a verdict).
- 2026-11-14 — batch-3 series: `Cycle 2: A9 — six article drafts + 11/22 appends + README
  Cycle-2 + dossier-70 note-4 fold` (dabd87a; QA pass: Status lines 6/6, citations 5/5 —
  2610.15199/WenrongZou/0.6725+0.83625/2610.41115/31/32+34999-40000 — appends additive,
  README 8 rows; note-4 [pending] resolved); `Cycle 2: A1 — ITERATION4-CHARTER-DRAFT
  (PROPOSAL-marked) + ledger §9` (482f459). **Disk milestones pending lane reports:**
  **72-C-neg FINAL-GREEN** (run8-final + A4's own axcheck, triad-clean — pilot row
  updated above; A4 owes run1–7 headers + u≠1 edit); **71-P2 GREEN** (`p2-run6.log`
  "P2.lean: OK", descent 6→4→2→1→1→0 — axcheck + A2 report pending); 11-M2 m2-run3:
  P11T3 OK again, RedTm2 FAIL (3 err — A8 iterating); DLRT-residual relays: TRIAGE:137–138
  (orchestrator) + candidates/42:355 + articles/42:28,:149 (A9) — Part 7, qa plan.
- 2026-11-14 — batch-4 series: `Cycle 2: H — REPORT §C2 non-verdict pre-fill` (0d6a396:
  donor-discharge rows incl. Liu-1 constant story + upstream-T2b + tracker
  DO-NOT-CONSUME; QR-D race paragraph with the full tracker audit (Bebel 0.8733458561
  leapfrog, tri-kernel, ζ_K split survives); C2.5 machinery/compliance prose; C2.7
  tracker static-asset re-check protocol — all verdict slots verified intact);
  `Cycle 2: A9 — 42M4 standalone decision + dossier fills` (75837e6: articles 42M4
  STANDALONE-by-decision header, main-run article 42 = frozen history; 11 addendum
  rewrite to ledger-final, T3 pending A8; dossier fills 71/42/10). Watch: A3 upgrade
  m4b2-run1 "build OK / M4b.lean FAIL rc=1 errors=0 sorry=0" (runner-level exit, A3 to
  interpret); A1 running incremental sweep Step A (`probe/logs/stepA-incremental-c2.log`,
  provenance header present); A4 prepending C-neg log headers; A5 VERDICTS/round-4 edits
  in flight (seed triage).
- 2026-11-14 — batch-5: `Cycle 2: A4 — 72-C-neg FINAL-GREEN official` (80dfd4b; H QA
  pass: LoC 369 ✓, axcheck 11-decl list exact vs file (5 public + 6 private,
  full-coverage pattern) ✓, deviations vs Appendix A documented in the execution-outcome
  note (N1 exponent regime; N3 False-form equivalence; Kuwahara `hKL` binder per EnclOK)
  ✓, run1–5 headers RECONSTRUCTED and marked as such ✓, dossier-74 u≠1 caveat applied
  with correct `0^0=1` reasoning + no-go fence pointer ✓). **Pilot-75 DECISION
  (orchestrator, 2026-11-14):** wave-4 pull-forward — 75 executes NOW as the final
  Cycle-2 pilot, lane A4 (P-a then C1 per 75-prework; A1 adds it to sweep TARGETS); row
  updated above. Close-out debts now: A8 m2-run{1,2,3} headers (orchestrator flagged to
  A8 directly), A7 run17/18 disposition (flagged to A7 directly).
- 2026-11-14 — batch-6 series: `Cycle 2: A5 — HKT close-out (§10 PARTIAL-PIN, Zbl
  1200.11042, Part-3-level rule) + §9.5 tracker clock protocol` (33426bf; H QA: Part-3
  form = page-numbered part mapping from publisher/zbMATH metadata, Zbl consistent
  §10↔row-71, no bare chapter citations introduced, catalogue/bound-badge curl URLs
  present; `novelty/iter4-seed-triage.md` HELD — A5 adding seed-1 rg-gate verdict +
  seeds-6/11 differentiation); `Cycle 2: A9 — slot ledger + DLRT errata + 72 fills`
  (c540682; H QA: article-72 fills match run8/axcheck evidence incl. the three Appendix-A
  deviations with :495 locator; DLRT qualifiers at all three flagged sites match
  dossier-75 standing note 3 (candidates/42:355, articles/42:28/:149, bracket-erratum
  style); slot ledger grep-driven exhaustive with OPEN/PENDING-RELAY/FILLED-FINAL
  discipline and [SWEEP] classed over the charter's REAL slot
  (ITERATION4-CHARTER-DRAFT:7/:100); `TRIAGE-C2-ROWS.md` HELD — A9 mid-reconciliation).
  Sweep-precondition update: seed triage + slot ledger both LANDED (seed-1 gate +
  seeds-6/11 differentiation in flight); A1 relabel + A9 reconciliation batches
  pending.
- 2026-11-14 — batch-7: `Cycle 2: H — STEP-8 dry-run + integrity pre-pass` (09e28ee: 11
  gates executed, 4 check fixes applied — stepB/C log naming, slot-ledger row-anchor,
  TRIAGE staging-banner, articles glob; harness worktree + agent-0* worktrees recorded
  as not-ours) + `Cycle 2: A1 — lp-duality bridge + iter-4 consequences + ledger §9
  batch` (afb7f4b; H QA: mathlib Cone/Basic TODO quote VERBATIM vs checkout ✓,
  m4b2-run2 "M4b.lean: OK" ✓, p2-run6 22 triad-lines/0 sorryAx ✓, seed-1 PASS wiring
  consistent with the held iter4-seed-triage :29 ✓). Board: rows 71 + 42 flipped to
  FINAL-GREEN / COMPLETE-primary (disk-verified; A2/A3 official reports pending).
- 2026-11-14 — batch-8 series: `Cycle 2: H — own-cell fills (71-P2, 42-M4b)` (16ae48a:
  REPORT §C2 slots + STATUS template rows, disk-verified markers, formal reports
  pending); `Cycle 2: A9 — TRIAGE-C2-ROWS final reconciliation + promotions` (cd59c09:
  articles 71 PROVED-FINAL-GREEN + 42M4 PROVED-FINAL both-routes + 75 SKELETON +
  README/INPUTS/ledger FILLED-FINAL rows; H QA: promotions consistent, P2 fill values
  match logs, **M4b LoC reconciliation: run-header 1,570 vs disk/ledger 1,571 — A9 cites
  the run-header figure with source label; H cells keep the disk figure 1,571;
  one-line alignment recommended at A9's next touch**; ledger OPEN rows anchored-count
  14 (+3 PENDING-RELAY, 11 FILLED-FINAL) — the relayed "33 OPEN" NOT reproduced by row-
  or occurrence-grep, counting basis requested); `Cycle 2: A5 — seed triage + novelty
  sign-off` (fbc02d5: Faifman–Rudnick Compositio 146 (2010) 81–101 verified; ExchangeSign
  = neighboring-layer precision note with post-dating argument; the 2 PASS-with-notes
  (73 C2-column refresh, 50-M2 tracker-audited + Dirichlet-class-only) match the
  fix-relays; **articles novelty gate: 10 PASS / 2 PASS-with-notes / 0 FAIL** — close-out
  novelty gate is GREEN). triage-decision-staging.md SUPERSEDED on content by A9's rows
  (kept as historical input; G5 banner check + fill-order remain operative).
- 2026-11-14 — batch-9: `Cycle 2: A3 — M4b TERMINAL` (4323178; H QA: 68+2 instrumentation
  = 70 theorems verified vs file (98 prints / 72 distinct names incl. file-own), regex
  story coherent across BOTH run1 logs — old counter missed `error(<code>)` forms;
  m4b2-run1's 4 noncomputable-abbrev errors real but pre-run2-fixed; **1,571 LoC
  canonical** — A9's articles still say 1,570 run-header figure, one-line alignment
  owed at its next touch). Debts register: (b), (c), (j) flipped CLOSED with one-line
  resolutions. Board row 42 → formal-report-received. Remaining pilot verdicts:
  10-L2 (A6), 11-M2 (A8), 72-M1 slot 3 (A8), 75 (A4 executing), G7b/G5a/G6a (A7);
  71-P2 A2 report pending (incl. 73-C).
- 2026-11-14 — batch-10: `Cycle 2: H — 72-C-neg cells filled` (138649f) + `H — A5
  delta-re-check target list staged` (articles-novelty-signoff tail; basis = fbc02d5
  02:38:32 +0800 + working-tree-vs-HEAD, re-grep flagged) + `Cycle 2: A9 — consolidated`
  (aff910c: PROPOSED TRIAGE §decision block 236 ln w/ splice instruction; the three
  sign-off fix-relays applied — H QA: 73 ×2 sites ✓, 50-M2 number-fields qualifier ✓
  (phrased "uniformly over number fields"), 52 dated via post-dates-2026-11-09 ✓;
  decision-block conditionals cover every OPEN slot family — 72-M1 :131, 73-C :183,
  10-L2 :200, 11-M2 :201, carried-list :222–226 incl. [G7b]; A3 fold 1,571-canonical
  with two intentional 1,570 provenance strings). **One miss flagged: articles/75:114
  cites 1,570/68 unlabeled — one-line fix owed to A9** (recorded in the sign-off's
  delta section as A5's bonus re-check target). Cross-check A9 re-touched list vs H's
  staged 5: identical, no gap.

## Session wrap 2026-11-14 — network outage, all lanes paused

The Cycle-2 orchestrator session terminated on an API network outage (~2026-11-13
late); all 10 lanes (A1–A9, H) died mid-flight. **Complete handoff:
`research/RESUME-BRIEF-C2.md`** — per-lane state, exact next steps, gate state,
protocol. Headline disk-state (verified at wrap): pilot 10-L1 GREEN + axcheck-clean;
42-M4a GREEN recorded, M4b on disk unrun; 71-P0/P1 GREEN, P2.lean written-unrun;
72-C-neg FAIL-in-flight (7 errs, 0 sorry); 11-M2 fixes mid-application; G7b run16
killed by the outage (no verdict); novelty lane fully complete (rows 70–75 all
dossier-checked; claims register + related-work landed); QA cumulative 0 WRONG.
All uncommitted lane artifacts are preserved in the snapshot commit. Relaunch:
read RESUME-BRIEF-C2.md, re-task lanes per its NEXT items, keep the queue-loaded
protocol + concurrency probe.

## Cycle 2 relaunch (2026-11-14)

All 10 lanes relaunched per `RESUME-BRIEF-C2.md` (orchestrator relaying; queue-loaded
re-task protocol + concurrency probe carried over). One-line assignments (from the
brief's NEXT items):

| Lane | Relaunch assignment |
|---|---|
| A1 | standby: sweep-trigger watch (re-read `FINAL-SWEEP-PLAN-C2.md` §0; fill ledger §9 rows as pilots finalize; signal orchestrator when all TARGETS final-or-declared-drop, then execute sweep Steps A–C) |
| A2 | P2.lean → GREEN (W1→W2→HW per 71-prework §c) + axcheck + logs; then 73-C skeleton Q0→Q3 (STOP before Q4); verdict relay for the dossier-71 addendum (A9 owns it) |
| A3 | reconcile M4b.lean half-applied Fix C → run on Modal → GREEN + axcheck; M4-note update; then the CLEARED M4b-upgrade primary route (direct V2 import, ≤20-line delta); 50-M2 stays gated on G7b |
| A4 | fix 72-C-neg remaining ~7 errors → GREEN (N1 Rényi monotonicity + N2 rank bridge + N3 gate per Appendix A); prepend provenance headers to logs run1–5; axcheck triad-only; then the u≠1 dossier-74 edit if unapplied |
| A5 | finish the GTimG/QuasiRiemannTracker audit (browser-use; was mid-navigation to the protocol tab; kernel-vs-certificate + any ζ_K/Hecke entries) → round-4 §tracker-audit + row-70 standing-note update if material |
| A6 | finish L2.lean Part-D defect fixes (rw directions, omega atoms, goal-side rewrites) → run on Modal → GREEN + full axcheck (`axcheck_full.py`) + logs with provenance headers; report → A9 writes the dossier-10 outcome note |
| A7 | reconcile gprobe.py minors (tauceti Zeta.lean path, sorry-warnings labeling); re-run run16 = G7b (Modal artifact-cache retry risk) — the 50-M2-R1 gate; finish run17 (G5a) / run18 (G6a) if pending |
| A8 | apply/verify the four pinpoint fixes in P11T3/RedTm2 → run (`run_pilot11.sh`) → GREEN + axcheck + logs; then 72-M1 Tier-C per 72-prework §2 (pilot slot 3) |
| A9 | fold the clock-sweep must-cites into dossier 70 (Chang–Wang, Ji, 13-repo landscape, tracker [pending A5 audit]); fix the dossier-75 §Novelty garbled sentence; then pilot-completion watch (§Pilot-outcome addenda; A4 owns 74) |
| H | standing cadence: per-lane provenance commits of landed artifacts, QA re-triggers, STATUS/INDEX board updates, concurrency probe at each batch close |

**Disk-state verification (H, 2026-11-14, at relaunch):** all six wrap claims CONFIRMED
on disk — (a) `pilots/71/P2.lean` header "proof artifact: no `sorry`" (line 11), logs
run1–4 only (all 22:26, before P2.lean's 22:42 mtime); (b) `pilots/42/M4b.lean` 1,560 LoC
(brief ~1,557; byte-identical in snapshot `ca4fd22`), no m4b run log; (c)
`pilots/10/L2.lean` 2,595 LoC exact, no l2 run logs; (d) `pilots/72/logs/run5.log` tail
`FAIL rc=1 errors=7 sorry=0` verbatim; (e) `pilots/11/` P11T3.lean 1,100 LoC + RedTm2.lean
on disk (392 LoC vs brief's 386 — consistent with the four pinpoint fixes
mid-application), logs untouched since 2026-11-09; (f) `pilots/75-prework.md` complete
("— end spec"). One wrap-claim correction: "INDEX current through the wrap" was NOT fully
accurate — six landed files were missing and four rows carried stale UNCOMMITTED flags;
reconciled this batch (INDEX Cycle-2 section + commit log below).

**First relaunch events (H batch 1):** A2 already live —
`pilots/71/logs/p2-run1.log` landed 02:00 2026-11-14 WITH provenance header: P2
first-ever run, unmodified from the outage snapshot (247 LoC), **FAIL rc=1 errors=6
sorry=0** (4 theorem axiom-lines show sorryAx — A2 owns the iteration toward GREEN).
Concurrency probe at this batch close: **8**.

**Batch 2 (2026-11-14 ~02:0x — orchestrator relay; H provenance commits + QA pass):**
- **A9 landed** (7d4189d): dossier-70 clock-sweep standing notes (Chang–Wang 2611.00924
  conditional 0.8744620; Ji 2611.16665; 13-repo QR-D landscape, no ζ_K formal artifact) +
  5 sharpening edits; dossier-75 §Novelty splice fix (:174–177); §Pilot-outcome templates
  on 71/72/73/75. QA spotcheck: citations match round-4 §8 values; splice coherent — OK.
- **A1 landed** (5aada35): ledger §9 FULLY FILLED (relaunch cross-check vs snapshot
  `ca4fd22`, rows for every TARGET + conditional additions 42-M4b-upgrade/50-M2);
  FINAL-SWEEP-PLAN-C2 machinery notes; `run_axcheck.sh` substrate fix (MODAL_USER=doz
  default + subset forwarding); sweep machinery pre-verified end-to-end
  (`AxPilot10_L1` OK, 36 axiom-lines, 0 sorryAx —
  `probe/logs/axcheck-c2-machinery-check.log`). QA spotcheck: consistent with disk — OK.
- **A3 mid-flight** (snapshot 942828c): **M4b fallback GREEN** — run1 FAIL rc=1 err=3
  sorry=0 → 12-line Fix-C (`mul_nonpos_of_nonpos_of_nonneg`, `le_of_lt` strictness,
  `exact_mod_cast` coercion) → run2 "M4b.lean: OK" + `m4b-axcheck-run1` GREEN triad-only
  0 sorryAx (92 axiom-prints / 68 thms); CLEARED direct-V2-import upgrade next. QA
  spotcheck: diff exactly the 3 error classes; axcheck header verbatim — OK.
- **A2**: P2 run2 FAIL rc=1 err=4 sorry=0 (descent 6→4; P2.lean edits in tree, un-relayed).
- **A7**: run19-g7 (G7b re-run) streaming; run20-g5a hit the Modal artifact-cache (retry in
  flight per relay); run21-g6a streaming — verdicts pending; logs committed in 942828c.
- Un-relayed tree activity at press time (left for next batch): `novelty/round-4.md` (A5,
  likely the tracker audit), `pilots/11/RedTm2.lean` (A8 pinpoint fixes),
  `pilots/71/P2.lean` + `p2-run2.log` (A2), `articles/71-splane-zeta-curve-dictionary.md`
  (early article draft — ownership to confirm at relay), `pilots/42/run_m4b2.sh` (A3).
- H this batch: REPORT.md §C2 pre-staged (C2.1–C2.7, fill-in placeholders
  [PILOT-VERDICT:71-P2/10-L2/11-M2/72-C-neg/42-M4b/73-C], [G7b], [SWEEP],
  [TRIAGE-DECISION]); `qa/triage-decision-staging.md` (orchestrator input brief);
  provenance-header QA of the 5 new lane logs (A2/A3 complete; A7 headers present,
  verdicts pending — no violations); INDEX refreshed.

## Cycle 2 CLOSE — TEMPLATE (pre-staged 2026-11-14, H; **NOT a verdict — orchestrator
fills at close; fill-in-fast slots in [brackets]; delete this banner when filling**)

Closed: [DATE]; cycle charter `RESEARCH.md` § Cycle 2; relaunch `RESUME-BRIEF-C2.md`.

**Final pilot outcomes:**

| Pilot / probe | Verdict | Evidence |
|---|---|---|
| 71-P2 (FF landing theorems, A2) | **FINAL-GREEN (disk-verified 2026-11-14; A2 formal report pending w/ 73-C)** | p2-run6 "P2.lean: OK": 282 LoC / 11 thms, 22 triad axiom-lines, 0 sorryAx; descent 6→4→2→1→OK (p2-run1–6); W1 pole-family correction |
| 73-C skeleton (FF Hecke–Tate, A2) | [PILOT-VERDICT:73-C] | [logs; STOP-before-Q4 respected] |
| 42-M4b + upgrade (V2 donor swap, A3) | fallback GREEN (m4b-run2 + m4b-axcheck-run1, triad-only) + upgrade **COMPLETE-primary** (m4b2-run2 "M4b.lean: OK" — direct V2 import, 1,571 LoC / 68 thms = PRIMARY, fallback byte-preserved, ≤20-line gate met; disk-verified, A3 formal report owed) | m4b-run2, m4b-axcheck-run1, m4b2-run2; M4-note owed |
| 10-L2 `PolyTVal` (A6) | [PILOT-VERDICT:10-L2] | [logs; full axcheck per axcheck_full.py] |
| 11-M2 (A8) | [PILOT-VERDICT:11-M2] | [m2-run* logs; axcheck] |
| 72-M1 Tier-C (A8, slot 3) | [PILOT-VERDICT:72-M1] | [logs] |
| 72-C-neg Kuwahara gate (A4) | **FINAL-GREEN OFFICIAL (A4 report received 2026-11-14)** | run8-final rc=0/0/0; descent 20→14→12→6→7→3→1→0 (runs 1–8; 1–5 headers reconstructed); 369 LoC / 11 thms (5 public + 6 private); axcheck-run1 11/11 exactly triad, 0 sorryAx; Appendix-A deviations documented (N1 0<α≤β<1; N3 False-forms ≡ ¬∃C; Kuwahara `hKL` binder) |
| G7b donor-pin axiom audit (A7) | [G7b] | [run19/20; gates 50-M2-R1 + Liu-1 posture] |
| G5a Physlib staging / G6a Stacks pricing (A7) | [G5a] / [G6a] | [run20-retry / run21] |

**Sweep:** [SWEEP] — FINAL-SWEEP-PLAN-C2 Steps A–C executed [date]; ledger §9 rows all
FINAL-or-declared-drop; [N/N] staged files OK, 0 sorryAx, triad-only; machinery log
`probe/logs/axcheck-c2-machinery-check.log`.

**TRIAGE § Cycle-2 §decision:** typeset [date] from `TRIAGE-C2-ROWS.md` +
`qa/triage-decision-staging.md`; top picks [ … ]; mirrored into REPORT.md §C2.6.

**Articles:** [list of Cycle-2 articles landed, one per landing] — `articles/README.md`
Cycle-2 section updated [date].

**AGENTS-C2 addendum:** APPLIED [date, commit] per `qa/agents-c2-apply-plan.md`
(7-edit pass; conflicts resolved as staged; draft header marked APPLIED).

**Iteration-4 handoff:** groundwork `feasibility/ITERATION4-SCAN.md` +
`ITERATION4-SEED-DOSSIERS.md` (+ [SEED-TRIAGE/CHARTER files]); charter
[ITERATION4-CHARTER-DRAFT.md status]; branch dev/claude at [commit].
