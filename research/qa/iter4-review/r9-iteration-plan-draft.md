# R9 — ITERATION-4 PLAN DRAFT: launch dossier, lane assignment, quality gate

Lane R9 (synthesis/charter draft), 2026-11-16, for the orchestrator. Inputs consumed at
draft time: the A1 iteration-4 kit (`feasibility/ITERATION4-CHARTER-SPLICE.md`,
`ITERATION4-SCAN.md`, `ITERATION4-SEED-DOSSIERS.md`, `ITERATION4-CHARTER-DRAFT.md`),
A5's `novelty/iter4-seed-triage.md`, the three slot prework files
(`pilots/lp-layer-prework.md`, `pilots/al-3d-prework.md`, `pilots/zzv2-lambda-prework.md`),
the Cycle-2 close record (`STATUS.md:718–780`, `REPORT.md` §C2, `articles/README.md`),
and `ORCHESTRATION-ITER4.md`. **No R1–R8 review deliverables had landed when this was
written** (see §4) — every review-dependent cell is marked [MERGE: Rx] instead.

This file proposes; the orchestrator typesets. Nothing here edits `RESEARCH.md`.

---

## 1 THE FILLED SPLICE — draft of the §Iteration 4 block for research/RESEARCH.md

Written in RESEARCH.md's register, mirroring §Cycle 2 (`RESEARCH.md:25–39`), per A1's
splice skeleton (`ITERATION4-CHARTER-SPLICE.md:12–57`). Filled: [DATE] = 2026-11-16
(`ORCHESTRATION-ITER4.md:3`); [SUBTITLE] reflects the review outcome; [TRIAGE-DECISION]
resolved into the slot list below; [G7b] = PASS (`REPORT.md:347–350`); [SWEEP] = executed
and signed off (`REPORT.md` §C2.5; ledger §9.F). Two honesty corrections vs A1's
skeleton are marked † and justified in §1.1.

> ## Iteration 4 (opened 2026-11-16, orchestrator) — raising the discovery bar: the
> > LP-duality layer, the 3D area-law ladder, and bridges outward
>
> Cycle 2 closed 2026-11-14 technically complete — eleven pilots GREEN, final sweep
> 44/44 stages OK with 0 `sorryAx`, TRIAGE §decision typeset, REPORT §C2 filled,
> AGENTS-C2-DRAFT applied (`STATUS.md:718–754`) — **but its articles drew unsatisfactory
> external feedback: too few discovery-grade results, too many knowledge-level and
> formalization-first pieces dressed as discoveries.** A nine-lane review (R1–R9,
> 2026-11-16, `qa/iter4-review/`) audited the record before this launch; its outcome is
> a raised discovery bar — candidates must clear discovery-strength criteria before a
> pilot slot, and articles ship only through the iteration-4 article gate with a
> verification-status table, nearest-miss citations, and limitations (gate spec:
> `qa/iter4-review/r9-iteration-plan-draft.md` §3, to be folded into conventions by the
> orchestrator). Iteration 4 continues the discovery-first program over the five corpora
> (mathlib, tauceti, openai-math, anthropics, axiommath) plus the Cycle-2-surfaced
> donors and gaps. The seed inventory is pre-assembled —
> `feasibility/ITERATION4-SCAN.md` (13 triage-annotated seeds, carried-over tables,
> substrate notes) and `feasibility/ITERATION4-SEED-DOSSIERS.md` (3 pre-dossiers) —
> with A5's triage verdicts folded (`novelty/iter4-seed-triage.md`) and the physlib
> surface mapped (`novelty/physlib-surface.md`).
>
> Phase mapping: Phases 1–2 are pre-done (surveys + bridge maps + the seed list; the LP
> mini-bridge `feasibility/lp-duality-bridge.md` is written) and Phase 3 is pre-done at
> pre-dossier level — the fresh run STARTS at dossier hardening (full Phase-3 form; the
> [NOVELTY-CHECK-NEEDED] marks are obligations) and Phase-4 triage. Pilot slots,
> resolved at launch (may be re-ordered when the review backlog R5 lands):
>
> 1. **The LP-duality layer + first consumer** — NEW-LEAN in the **Lean ecosystem
>    only** (Isabelle AFP `LP_Duality`/`Linear_Programming`/`Farkas` and Coq
>    1706.10269 own the theorem class and are mandatory nearest-miss citations; mathlib
>    `Analysis/Convex/Cone/Basic.lean:37` TODO verified on our pin; never "first
>    formal / unformalized" phrasings). The layer is infrastructure — article-worthiness
>    lives only in the consumer dictionary (02-core pair-mass B₂ ceiling; 74-T3
>    surprisal LPs the optional second), and the iteration-4 article gate applies to
>    the consumers on their own strength. Execute first regardless of the discovery
>    race (A5: fastest de-risk; prework `pilots/lp-layer-prework.md`, GO at
>    mathlib-only tier).
> 2. **An AL-3D B-rung: B.2 (`SlabAreaLaw3D`) staged, B.3 (`PositiveReplacement3D`)
>    the alternative — B.2 confirmed at launch** (AL-P0 statement stage serves either
>    rung identically; prework `pilots/al-3d-prework.md`; the north star `AreaLaw3D`
>    is "not a target"; the slot NAMES its B-rung; every AreaLaw3D-adjacent claim
>    cites the obstruction C.1–C.4 it resolves). The strongest discovery-grade seed in
>    the inventory (A5: "cleanest NEW-LEAN of the set"; pre-charter gate PASSED
>    2026-11-14).
> 3. **The ZZV2 λ-family, route (a) continuity/glue** — formalization-first by design:
>    Lamzouri owns the informal math and is must-cited in full; the artifact is the
>    Lean λ-layer. Under the raised bar this slot runs as **stack infrastructure** (it
>    feeds the 42-M4/75 assembly line); its output ships as a technical record, not as
>    a discovery article (two-strike rule, §3c). If the review's strength bar (R2)
>    lands stricter than this plan assumes, the orchestrator may swap this slot for
>    the FF-EZ2 survivor (A5 row 4, NEW-LEAN, dossier-level re-verification owed) —
>    the swap decision is taken at the R5 reconciliation.
>
> Carried: **50-M2 remainder routes only** † — R1 (openai in-corpus 7/8) LANDED GREEN
> in Cycle 2 after G7b PASS'd (`pilots/50/R1.lean`, article 50-M2 final); what carries
> is R2 (31/32 ζ_K strip, statement-level per G1b FAIL) and R3 (Liu-1 full-strength
> binder, statement-level, DO-NOT-CONSUME pin). **73-Q4** `hRat` discharge (A2's
> recommendation owed; `hPur` STAYS a binder). **75 continuation** (P-b 5/6
> strip-distinct arm + N2/N3 remainder; entry (P-a)+C1 GREEN in C2; design input
> `pilots/75/Pb-design.md`). **72-M1 L3 + the interface theorem** † (PARTIAL-M1 GREEN;
> continuation spec in the m1-run8 header). **The 10 assembly tranche D1–D6** † (the
> three-layer certificate stack is complete; the uniform+poly-space headline stays
> OPEN). **22-T2a** (small, upstream PNT+ statement as binder). **74** (dossier rides
> slot 1's layer as optional second consumer). **G5a Physlib pair** (BLOCKED-INFRA,
> deferred here; unblock plan R8 when it lands). The main-run cold inventory
> (41/12/31/60/40/30) competes throughout. Watch: FF-EZ2 survivor (FF-EZ5's surviving
> counting-half folded in — Faifman–Rudnick own the family statistics), FF-EZ4,
> AL-EZ1 P2-probe, the physlib occupation-pair bridge (seed 13; differentiate from
> article 52 AND physlib `WickContraction/Sign/`; the three-"Physlib"s name-collision
> trap). QuasiRiemannTracker is a CLOCK, not a donor (A5 §9.5 protocol;
> DO-NOT-CONSUME).
>
> Lane topology and protocols carry over from Cycle 2 unchanged (10 lanes A1–A9 + H,
> one-writer-per-file, queue-loaded re-tasks, H-commit cadence + concurrency probe —
> see `feasibility/ITERATION4-CHARTER-DRAFT.md` §c; launch-day assignments in
> `qa/iter4-review/r9-iteration-plan-draft.md` §2). Ground rules carried verbatim:
> discovery-first, kernel-only (no sorry, no native_decide, no external CAS), siblings
> read-only, exact citations for every claim; donor statements enter only as hypothesis
> binders, verbatim marked probe copies, or already-built on-pin libraries; logs
> persisted with provenance headers; Modal usage per the mandatory guidelines (2 CPU /
> 4 GB default, telemetry every run, overrun ⇒ investigation). Substrate:
> `feasibility/ITERATION4-SCAN.md` §3 (doz Modal pattern, artifact-cache retry
> protocol, axcheck lessons, standing clock protocols).

### 1.1 Deltas vs A1's splice skeleton (justified here, invisible in the typeset text)

1. **† 50-M2-R1 row corrected.** The skeleton's "Carried: 50-M2-R1 pre-staged awaiting
   [G7b]" (`ITERATION4-CHARTER-SPLICE.md:40–41`) is stale against the close record:
   G7b PASS'd 2026-11-14 (`REPORT.md:347–350`, `probe/logs-g/run32-g7-elab.log`) and R1
   landed GREEN (`pilots/50/R1.lean`, 178 LoC, article 50-M2 FINAL — `REPORT.md:375`,
   `STATUS.md` final-pilot table). Carrying R1 as "awaiting" would be false; the filled
   splice carries only R2/R3, matching `STATUS.md:776`.
2. **† 72-M1 L3 + interface and the 10 assembly tranche added to the carried list.**
   The skeleton omits both; the close record carries them explicitly
   (`STATUS.md:774–775`, `REPORT.md:294–297, :369`). They are the largest open
   proof-obligations from Cycle 2 and must appear in the charter's carried list.
3. **Subtitle changed** from A1's proposal ("the LP-duality layer, the 3D area-law
   ladder, and bridges outward", `ITERATION4-CHARTER-SPLICE.md:14`) to prefix it with
   the review outcome — per the launch directive that the iteration is charted in
   response to the negative external feedback.
4. **Close-summary line rewritten** from the skeleton's bracket
   (`ITERATION4-CHARTER-SPLICE.md:16–17`) to state the negative feedback in plain
   terms. Wording note for the orchestrator: the feedback arrived out-of-band (user
   review of the article set; no on-disk critic document exists as of 2026-11-16), so
   the line characterizes rather than quotes it; the review files under
   `qa/iter4-review/` are the in-repo record of the diagnosis once they land.
5. **Slot-1 and slot-3 posture notes added** (infrastructure / technical-record
   framing): this is the splice-level consequence of the raised bar — the slots stay
   as pre-worked (all three have complete prework files), but their ARTICLE claims are
   gated (§3). Slot 2 is unchanged in substance from A1's proposal.

---

## 2 LAUNCH-DAY LANE ASSIGNMENT (9 lanes A1–A9 + H)

Topology = C2's, per `ITERATION4-CHARTER-DRAFT.md` §c (one writer per file). Spawn
order per the launch-day checklist: **A1 → A5 → A9 first** (feasibility upkeep,
novelty batteries, dossier/article records — the review-touching surfaces), **then the
pilot lanes as slots resolve, H last** (`ITERATION4-CHARTER-SPLICE.md:73–76`). Every
lane spawns with a 2–3 item bottom-up queue (queue-loaded protocol,
`RESUME-BRIEF-C2.md` §Protocol).

| Lane | Launch-day queue (top = first) | Owned files (unchanged from §c) |
|---|---|---|
| A1 | (1) fold the review's substrate corrections + R8's donor-unblock plan (when landed) into the feasibility records; (2) open `VERIFICATION-LEDGER.md` §10 (iteration-4 rows) + generalize the axcheck sibling-import rewrite (SCAN §3.3 lesson); (3) substrate upkeep: Modal doz-pattern runners, telemetry, artifact-cache retry protocol | `feasibility/VERIFICATION-LEDGER.md`, `feasibility/probe/*`, `feasibility/ITERATION4-*`, survey upkeep |
| A2 | (1) **slot 1** LP layer + 02-core consumer (`pilots/lp-layer-prework.md`, its own spec — GO mathlib-only); (2) the 73-Q4 `hRat` recommendation owed to the orchestrator; (3) B.2-vs-B.3 launch input for slot 2 (author of `pilots/al-3d-prework.md` — hands the spec to A4) | `pilots/71/*`, `pilots/73/*`, `bridges/function-field.md` |
| A3 | (1) **slot 3** ZZV2-λ route (a) (`pilots/zzv2-lambda-prework.md`, its own spec; technical-record posture per §3c); (2) 50-M2 R2/R3 statement-level route upkeep (`pilots/50/*`, V2/Liu-1 donor map); (3) 75-N2 ζ-side-via-V2 support (with A4) | `pilots/42/*`, `pilots/50/*`, `novelty/axiommath-as-donor.md` |
| A4 | (1) **slot 2** AL-3D B-rung, B.2 staged (executes `pilots/al-3d-prework.md` — cross-lane handoff from A2; owns the area-law bridge); (2) 75 P-b strip-distinct arm (`pilots/75/Pb-design.md`, its own design); (3) 74-T3 second-consumer execution if slot 1 opens the gate | `pilots/72/*`, `pilots/75/*`, `bridges/area-law.md`, `candidates/74*` |
| A5 | (1) dossier-level novelty batteries for the three slots (the [NOVELTY-CHECK-NEEDED] marks are obligations — SEED-DOSSIERS header); (2) fold R6 fresh-bridges + R7 external-prior-art (when landed) into VERDICTS/round-5; (3) clock sweep: tracker (static-asset curl), Liu-2, WenrongZou, physlib `FieldStatistics/`+`WickAlgebra/`, mathlib PNT/LP PRs | `novelty/*` |
| A6 | (1) the 10 assembly tranche D1–D6 (the open headline: uniform-in-k ∧ min-rate ∧ poly-space ETH refutation; three-layer stack complete per `REPORT.md:369`); (2) axcheck + article-10 update on tranche milestones | `pilots/10/*` (+ new long pilots) |
| A7 | (1) G5a Physlib unblock attempt per R8's plan (when landed; boundary measured: imports `Region.{State,TraceDistance}` → Physlib @ `a50684a1`); (2) G6a stays priced-and-blocked (59,222-job closure — do not re-run without charter); (3) new-donor probes as slots demand | `feasibility/axiommath-donor-probes.md`, `feasibility/probe/ProbeG*`, `logs-g/` |
| A8 | (1) 72-M1 L3 + interface theorem continuation (its own tranche record; spec in m1-run8 header); (2) 22-T2a small binder pilot (upstream StrongPNT statement, port≈0); (3) pilot close-out/axcheck support on request | `pilots/11/*`, `pilots/{20,52}/*`, 72-M1 continuation |
| A9 | (1) dossier hardening to full Phase-3 form for the three slots (records in `candidates/`); (2) **article-gate enforcement**: instantiate the iteration-4 template (§3b) and re-classify the standing article set's kinds for the two-strike count (§3c); (3) TRIAGE-ITER4 rows + REPORT-INPUTS ledger | `candidates/*`, `articles/*`, `TRIAGE-*`, `REPORT-INPUTS*` |
| H | standing: branch/commits (launch commit = charter splice + ITERATION4-* kit + this plan), concurrency probe at each batch close, custody of `qa/iter4-review/*` landings, STATUS/INDEX upkeep | `STATUS.md`, `INDEX.md`, `qa/*`, commits |

Load note for the orchestrator: A4 carries the heaviest queue (slot 2 + 75 P-b +
74-T3); if R5's backlog re-orders slots, moving 75 P-b to A8 (or A3, whose N2 half it
shares) is the cheapest re-balance — both lanes hold design context.

---

## 3 QUALITY-GATE SPEC — the iteration-4 discovery bar and article gate (ONE PAGE)

Drafted independently (no R1/R2 inputs landed); **merge points marked [MERGE: Rx]** —
where a review deliverable lands, it REPLACES the corresponding criterion/template
here, and A9's gate instance is re-issued. Floor semantics: my criteria are the
minimum; R2's bar can only raise them.

### (a) Discovery-strength criteria — a candidate must pass ALL before a pilot slot

1. **New-statement test.** The target statement (or its negation, for refutation
   candidates) is absent from every corpus by DIRECT-SOURCE check (rg in-tree +
   namespace check — a decl-index hit is never evidence, per the Cycle-2 caveat block,
   AGENTS-C2 conventions) AND from the informal literature by a recorded round-level
   novelty battery (query list + hits kept in the dossier). [MERGE: R2's strength bar
   supersedes the criterion set; R7's prior-art protocol supersedes the battery
   recipe.]
2. **Not-knowledge-level test.** The statement is not a transcription of a known
   theorem into Lean. If the math is known informally (Weil 1948; Lamzouri; Hasse
   1936; the AFP LP trio), the work is formalization-first: it may run as
   infrastructure or stack reuse, it may ship as a technical record, but it can never
   be presented as a discovery article. Formalization-first slots must be LABELLED
   such in the charter (as slot 3 is, §1).
3. **Bridge-essential test.** The statement becomes true, natural, or provable because
   of the combination of corpora (RESEARCH.md Phase-2 definition); a candidate
   provable from one side alone is re-scoped or dropped.
4. **Decay test.** The candidate's value is dated against the standing clocks
   (QuasiRiemannTracker Dirichlet class, Liu-2, mathlib PNT/LP PRs, physlib pushes,
   the AreaLaw2D challenge repo, Suzuki/WenrongZou); the dossier names the clock(s)
   that would devalue it and the fallback shape if one fires.
5. **Honest-posture test.** Binders are named as the open core (hypothesis-binder
   pattern); no "unconditional" dressing of conditional results; assemblies with
   not-known-consistent hypotheses say so (the `TwoFamilyDecomposition3D` precedent,
   SEED-DOSSIERS seed 1).
6. **Verdict floor.** A pilot slot requires a dossier-final novelty verdict of
   NEW-LEAN (or R2's replacement tier) — a pre-dossier triage verdict is a STARTING
   position, never sufficient (A5's own pre-check honesty note,
   `novelty/iter4-seed-triage.md:244–247`).

Retroactive application (calibration, not revision): under these criteria Cycle 2's
shipped set contains at most three discovery-grade articles (75's assembly class; 72's
no-go gate; arguably 71's forced W1 correction), against six-plus knowledge-level /
formalization-first / donor-discharge records (`articles/README.md:37–47`) — which is
the failure mode the bar exists to prevent.

### (b) Article gate — an article ships ONLY through this template [MERGE: R1 template supersedes skeleton; R3 refines the status table]

Mandatory sections, in order:

1. **Kind declaration** — exactly one of: new theorem / refutation + replacement /
   negative result / formalization-first record / knowledge-level record / donor-
   discharge record. The kind is decided by the dossier verdicts, not by the author.
2. **Statement** — the landed theorem(s) VERBATIM (Lean statement + English gloss),
   every binder explicit and flagged unproved-vs-proved.
3. **Verification-status table** — one row per landed declaration: `.lean` file:line,
   LoC/thm counts, axcheck log path, axiom set (must be ⊆ triad), sorry count, unproved
   binders, pin (mathlib rev + toolchain), run date. No table, no article.
   [MERGE: R3's integrity requirements]
4. **Nearest-miss citations** — a dedicated block of exact citations to the closest
   prior formal and informal work (the AFP-trio precedent from seed 9 is the model:
   five entries, not one). An article without a nearest-miss block does not ship;
   "no prior work exists" is not an acceptable block.
5. **Limitations** — what is NOT proved, what is conditional, which clocks can devalue
   the result, what was carried.
6. **Relation to prior work** — who owns the theorem class, where our claim sits
   (scoped "first"s only; the LP never-phrase list is the pattern).

### (c) Two-strike rule — article-kind quotas per cycle

1. **Cap:** at most **2** knowledge-level / formalization-first / donor-discharge
   ARTICLES per cycle ([MERGE: R2 — if R2's bar implies N=1, tighten to 1]). Articles
   beyond the cap DEMOTE to dossier outcome blocks or technical records (indexed, not
   article-numbered).
2. **Strike:** each article whose kind declaration (per §3b.1) is knowledge-level,
   formalization-first, or donor-discharge counts one strike.
3. **Consequence:** two strikes in a cycle ⇒ the next charter's PILOT SLOTS go to
   discovery-grade candidates only; formalization-first work remains allowed as
   infrastructure (charter-labelled, technical-record outcomes) — it loses article
   standing, not execution standing.
4. **KPI:** ≥ half of shipped articles each cycle must be discovery-grade
   (new-theorem / refutation / negative-result kinds). Reported in the cycle-close
   REPORT block.
5. **Grandfathering:** the rule is prospective from iteration 4; Cycle 2's article set
   is re-classified by A9 for the baseline count only, not rewritten — except where
   R1's editorial audit mandates specific corrections.

### (d) Enforcement points

- Slot chartering: the orchestrator checks §3a against the hardened dossier (gate
  criterion 6 makes A5's dossier-final verdict the gate input).
- Article publication: A9 checks §3b/§3c; H's close-out QA verifies the
  verification-status tables against the ledger.
- Cycle close: the KPI (§3c.4) is computed into the REPORT block; a miss is recorded
  as a process failure in the next cycle's review, not silently absorbed.

---

## 4 INTEGRATION — review-input status and the re-task protocol

**Inputs present at draft time (2026-11-16 evening): NONE.** `qa/iter4-review/` is
empty; `novelty/iter4-fresh-bridges.md` (R6) and `feasibility/iter4-donor-unblock-plan.md`
(R8) do not yet exist on disk. All eight review lanes were still writing
(`ORCHESTRATION-ITER4.md:8–17`, every row "active"). Accordingly:

- Zero review content is consumed in §§1–3; all review-dependent cells carry
  [MERGE: Rx] marks instead of guesses.
- **Changes the review forced anyway** (known from the launch directive, integrated
  above): (i) the subtitle and close-summary line now state the negative external
  feedback and the raised bar (§1); (ii) slots 1 and 3 carry infrastructure /
  technical-record posture labels and slot 3 has an explicit swap candidate (FF-EZ2)
  pending R2/R5 (§1 slot list); (iii) the quality gate (§3) exists at all — the C2
  charter had no article gate; (iv) A9's launch queue includes re-classification of
  the standing article set (§2).
- **Re-task protocol for R9:** when R1–R8 land, the merge points resolve as —
  R1 template/rubric → §3b skeleton replaced; R2 strength bar → §3a criteria (and the
  §3c cap N); R3 verification-status requirements → §3b.3 table columns; R5 ranked
  backlog → slot-list reconciliation below; R6/R7 → A5's queue items 1–2 (novelty
  side, not this plan's); R8 → A1/A7 queue item 1. R9 re-issues §§1–3 as v2 with a
  delta list if any merge changes the splice text, the lane assignment, or the gate.
- **R5 reconciliation (pre-registered):** when `r5-iteration4-backlog.md` lands,
  compare its ranked queue against §1's slot list; conflicts go to the orchestrator as
  a named list (expected friction points: the slot-3 formalization-first posture vs
  any R5 discovery-first re-ranking; the carried-item load vs A4's queue; whether
  74-T3 belongs in slot 1's scope or A4's queue).
- **Integration log:**
  - 2026-11-16 (§6/§7 writing pass): re-checked — `qa/iter4-review/` still held only
    this file; R6/R8 outputs absent. No merge points resolved; §6/§7 written
    branch-complete instead.
  - 2026-11-16 (§8–§10 integration pass): **consumed** — R1
    (`r1-articles-editorial.md`, 431 ln: rubric, 17-article defect lists, ranked
    causes, kind verdicts), R2 incl. Part B (`r2-discovery-strength.md`, 557 ln:
    4–5-genuine-of-18, strength bar S1–S4, 11 demotions, restructuring plan, §9
    completion paths), R4 both parts (`r4-process-completeness.md`, 369 ln: batches
    A/B/C, §6 close-protocol addendum, §7 pass-2 coordination), R5 §§1–10
    (`r5-iteration4-backlog.md`, 675 ln: ranked queue + §7 launch-order flip + §8/§9
    execution specs + §10 G10 shelf), R8 (`feasibility/iter4-donor-unblock-plan.md`,
    381 ln: four route verdicts, runner kit, cost classes),
    `articles/TEMPLATE-iter4.md` (204 ln, mandatory skeleton), `00-DIGEST.md` (covers
    R9+R2 only — H's digest lags the later landings). **R3 landed mid-pass**
    (`r3-verification-integrity.md`, 21:51): headline consumed — no mathematical
    overclaim in any audited article, defects records-level; §5 verification-block
    format + checklist rules folded into §10's day-1 disciplines. Still absent: R6
    (`novelty/iter4-fresh-bridges.md`), R7.
  - 2026-11-16 (final touch-up pass): **consumed** R5's final state (§16 staged STATUS
    snippet; §14 now ELEVEN rows with the **hEχ fold-in at run 8** —
    `crossmath-pilot-zeta23E`, v4.33 pin, C3 [LAYERS] hour-class @SPEC, day-2/3 — and
    §14.1's judgments: displacement NONE; 75-Pb billing = **COMPANION**, two binder
    tiers of the one 75 statement-class article) + the NEW
    `qa/REPORT-INPUTS-ITER4.md` slot ledger (R5, all rows OPEN); **R6**
    (`novelty/iter4-fresh-bridges.md`, 391 ln: five FB seeds, the two unregistered
    proved OAI donors with preprints, the FB-2/PNT+-T2 note); the coordinator relay of
    R8's G9 pure-mathlib find (ψ-object mathlib-native on our pin; R8's on-disk §3
    pending the update — corroborated by R1's mathlib `Chebyshev.lean` spot-checks,
    `r1-articles-editorial.md:327`). Applied as §8 v2.1 minimal deltas + §9/§10 fixes
    + §11 typeset-prep block. R7 still outstanding.
  - **Merge resolutions (integration pass):** [MERGE: R1] → template adopted verbatim as the
    article gate; [MERGE: R2] → S1–S4 bar supersedes my §3a floor; two-strike cap
    **N=1 FINAL** (coordinator correction mid-pass, supersedes the provisional N=2 —
    R2's landed kind-eligibility makes the stricter form operative); [MERGE: R3] →
    verification-block format into the gate; [MERGE: R5] → launch order adopted + the
    A-lane key RETAINED (R5 §15 defers to §7 as typeset-ready; the two deltas it flags —
    75-Pb's day-1 lane and the 73-Q4 memo's home — are applied in §9 per decisions
    (e)/(f)), R5 §§11–15 execution specs + first-48h run queue + dependency ledger
    consumed into §9/§10; [MERGE: R8] → route verdicts folded into the splice's
    carried/dropped lists. **Changes the review forced:**
    launch-order flip (75-Pb day-1 discovery-billed, LP same-week engineering-billed);
    LP loses article eligibility entirely (R2 S1: corollary-level); the gate is now
    template+bar (my §3 skeleton survives only as the two-strike rule + enforcement
    points); R4's close-protocol enters the charter conventions; the §7 A-key briefs
    stand (R5 §15 endorses) with the two typeset deltas applied. One unresolved
    tension flagged for the orchestrator: R2 §9's
    completion paths (75/42-hEχ flagship, 01-stability, 32-crossing, 30-Theorem A)
    are NOT in R5's ranked queue (R5's §7 reconcile predates R2's Part B) — §8 note
    + open decision.

## 5 OPEN DECISIONS FOR THE ORCHESTRATOR

1. **Slot 3 under the raised bar** — keep ZZV2-λ as a chartered slot with
   technical-record posture (this plan's recommendation: the prework is complete, the
   stack reuse is real, and the two-strike rule already contains the article risk), or
   swap to the FF-EZ2 survivor (discovery-grade per A5 row 4, but dossier-level
   re-verification owed and no prework file). Decide at the R5/R2 merge.
2. **Two-strike cap N** — 2 (this plan) vs 1 (if R2's bar lands stricter). §3c.1.
3. **B.2 vs B.3 for slot 2** — B.2 recommended (staged, donor-sketched route, the
   prework's target); B.3 is the fallback if the B.2 restatement volume estimate
   (donor-scale, `pilots/al-3d-prework.md` §1) proves out at AL-P0. Launch-day call,
   per the splice.
4. **Where the gate text is typeset** — proposal: the orchestrator appends §3's normative
   content as a conventions block in `RESEARCH.md` (or AGENTS.md iteration-4 addendum)
   at splice time, so the bar is charter-level, not file-level; the splice sentence in
   §1 already points at it.
5. **75 P-b lane placement** — A4 (design owner, heaviest queue) vs A8/A3 (re-balance);
   §2 load note.
6. **Carried-item depth** — the charter lists 72-M1 L3, 10 D1–D6, 22-T2a as carried but
   no lane owns 22-T2a's execution start before A8's queue item 2; confirm the ordering
   or re-assign.

---

## 6 DECISION MEMOS (for §5's open decisions; branch-complete where hinged on pending reviews)

> **DECISIONS RECORDED 2026-11-16 (orchestrator; corrections mid-§8–§10 pass supersede the
> earlier relay where noted):** (a) slot-3 **KEEP ZZV2-λ**, chartered as an
> engineering/technical-record deliverable (NOT discovery-billed; stack-reuse value);
> FF-EZ2 swap branch stays pre-written (R5 §12c). (b) two-strike cap **N=1 FINAL**
> (supersedes this section's N=2 recommendation and the provisional N=2 — R2's landed
> kind-eligibility makes the stricter form operative; KPI ≥half discovery-grade
> unchanged). (c) **B.2 SlabAreaLaw3D**, formal branch point moved to the post-AL-P1
> GO/NO-GO. (d) **hybrid** gate location (normative paragraph in `RESEARCH.md`
> §Iteration 4 at splice + template detail in the article file). (e) 75-Pb owned by the
> **A3-pattern lane from day-1** as the top-billed discovery milestone (M4a-mirror
> competence, `pilots/75/Pb-design.md:57–65`); the AL lane owns AL-3D B.2 only — the
> "strictly after AL-P0/P1" sequencing and A3-as-fallback framing below are SUPERSEDED
> (fallback survives as standing contingency only). (f) 22-T2a = A8, binder-shaped
> statement-first, T1 NOT fired. §8–§10 carry the operative text.

### (a) Slot 3 — keep ZZV2-λ vs swap to FF-EZ2

**Options.** K = keep ZZV2-λ route (a) as chartered (technical-record posture, §1). S =
swap to the FF-EZ2 survivor statement.

**Evidence.** Keep: prework complete and guard-fenced (`pilots/zzv2-lambda-prework.md`
§2 :84–101 — P0 probe pins the λ-range; P1 lands GREEN binder-shaped with no new
analysis; §5 :129–137 — total M− if P0(b) favorable, S otherwise, hard STOP after P1
GREEN if the Landau layer is MT-frozen); BUILT-donor recipe reused verbatim (M4b2,
:105–115); stack-multiplier value — "strengthens automatically if 42-M4b-upgrade lands;
multiplies with 75's assembly" (`ITERATION4-SEED-DOSSIERS.md` §seed-3 triage line, :232–234)
and 42-M4b DID land (`REPORT.md:371`); A5 verdict NEW-LEAN formalization-first, corpus
collision NONE (`novelty/iter4-seed-triage.md:17`). Swap: FF-EZ2 = NEW-LEAN with the
supersingular-trap analysis already done and S-effort (`ITERATION4-SCAN.md:87–91`); its
gating pilots 71-P2/73-C both landed GREEN (`REPORT.md:372`), so the "rank only after
these land" condition is satisfied; but it carries a month-clock + "family version
literature-occupied" decay note (`ITERATION4-SEED-DOSSIERS.md:44`) and owes a
dossier-level re-verification (triage row 4: "re-verify at dossier level",
`iter4-seed-triage.md:19`) plus a from-scratch P0 spec (no prework file exists).

**Cost-risk.** K: risks another formalization-first cycle-item — contained by §3c
(technical record, no article standing) and by the prework's own novelty posture
(`zzv2-lambda-prework.md:117–127`: "NEVER phrase as new mathematics"). S: risks an
unpreworked charter (≈ one lane-day of P0 spec before any run) and re-activating a
novelty surface A5 has not cleared at dossier grade.

**Recommendation.** **K**, unless R2's strength bar kills formalization-first SLOTS
(not just articles) — the differentiator: slot 3's output feeds 42-M4/75-class
assembly either way, so its value survives demotion; FF-EZ2's does not survive a
novelty re-check failure. **Hinge: R2 (slot-level bar) and R5 (ranking).** Branch S is
pre-written in §7's A3 brief. If R5 ranks FF-EZ2 above ZZV2-λ on discovery strength,
the swap is cheap at charter time (A3's brief swaps wholesale; no other lane moves).

### (b) Two-strike cap N = 2 vs N = 1

**Options.** Cap knowledge-level/formalization-first/donor-discharge articles per cycle
at 2 (§3c.1) or 1.

**Evidence.** Cycle 2 shipped ≥6 such pieces against ≤3 discovery-grade
(`articles/README.md:37–47`: 71, 73 formalization-first; 22 knowledge-level; 42-M4/50-M2
donor-discharge; 10/11 layer/completion records — vs 75, 72, and 71's forced
correction as the discovery-grade residue). Either cap would have forced demotions; N=1
would have demoted nearly the whole set.

**Cost-risk.** N=2 lets a cycle keep exactly one "enabler" record (e.g. the LP layer)
plus one knowledge-level closure (e.g. a 22-T2a-style note) while forcing everything
else into dossiers. N=1 maximizes pressure toward discovery-grade but risks
under-recording genuinely useful infrastructure (unindexed technical records rot — the
reason `articles/README.md:49–53` had to explain where knowledge-level records went).

**Recommendation.** **N=2** at charter; the KPI (§3c.4, ≥half discovery-grade) is the
real teeth. **Hinge: R2** — if R2's bar classifies formalization-first slots as
never-article-eligible regardless of count, N becomes moot; adopt N=1 then for
simplicity.

### (c) AL-3D rung — B.2 (`SlabAreaLaw3D`) vs B.3 (`PositiveReplacement3D`)

**Options.** B.2-staged (the preworked ladder) vs B.3 (the donor's "most routine"
target) vs decide-at-launch.

**Evidence.** B.2: full prework with guards — AL-P0 statement port ≤0.45k, AL-P1 fibre
core ≤0.4k with a GO/NO-GO, AL-P2 ≤0.9k binder-conditional landing
(`pilots/al-3d-prework.md:257–270`); HARD STOP before full `SlabAreaLaw3D` (:271–273 —
donor-scale, separate charter); the donor's §11 whole-column uncertainty shadows only
B.2-FULL, not the staged ladder (:301–305). B.3: donor verdict "the most routine of the
targets and the foundation of B.4" (Targets.md :65, via prework :75); crucially **AL-P0
and AL-P1 serve BOTH rungs** — "AL-P1's fibre lemmas are B.3-neutral (B.3 replaces
counting constants)" (:77–78); so the branch point is AL-P2, not launch.

**Cost-risk.** Deciding B.2 now risks committing to the volume-heavy rung before P1's
GO/NO-GO data; deciding B.3 now forfeits the B.2 donor-sketched route. The shared
P0/P1 substrate makes early commitment nearly free either way.

**Recommendation.** **B.2-staged as the working target, with the branch formally moved
to post-AL-P1** (not launch): if P1-b's boundary lift needs fibre-generic donor
restatement (the prewritten NO-GO, :263–266), flip to B.3 — AL-P0/P1 are sunk-cost-free
for it. No review hinge. The splice's "decided at launch" softens to "B.2 working /
B.3 at the AL-P1 gate" — one-line typeset change.

### (d) Quality-gate typeset location

**Options.** (i) RESEARCH.md conventions paragraph at splice; (ii) AGENTS.md
iteration-4 addendum; (iii) leave in this qa file; (iv) articles/README template
section.

**Evidence.** The gate enforces the ground-rules sentence "Discovery-first, not
formalization-first: a candidate is valuable only if the statement is new"
(`RESEARCH.md:23`) — the bar is that sentence's enforcement arm and belongs beside it.
Precedent cuts both ways: Cycle-2 PROCESS conventions (donor hygiene gate, decl-index
caveats, probe protocol) were applied into AGENTS.md (`AGENTS.md` §"Cycle-2
conventions", applied per `STATUS.md:750–754`), but those are environment mechanics,
not research-content standards; AGENTS.md is also H/user-directive territory
(application needed a qa/plan + explicit step). Option (iii) is weakest: qa files are
audit artifacts a working lane may never open. Option (iv) puts a program-wide bar
inside one lane's owned file (one-writer-per-file makes it A9's private rule).

**Cost-risk.** RESEARCH.md grows by one paragraph (the charter is meant to carry
addenda — §Cycle 2 precedent, `RESEARCH.md:25–39`); the operational template detail
must NOT go there (it will churn when R1 lands).

**Recommendation.** **Hybrid:** one normative paragraph (the §3a floor + §3c cap + the
pointer) typeset into `RESEARCH.md` §Iteration 4 at splice time; the template/rubric
detail lives in the A9-owned article template once R1 lands; AGENTS.md gets at most a
one-line pointer if H prefers the AGENTS.md reading habit. No review hinge (R1 affects
the template's content, not the location).

### (e) 75 P-b lane placement

**Options.** A4 (design owner) vs A3 (V2-stack owner) vs A8 (spare capacity).

**Evidence.** Ownership is explicit: "this file is lane A4's; … the pilot file is
`research/pilots/75/Pb.lean` (lane A4)" (`pilots/75/Pb-design.md:11–12`); the design is
fully priced — Pb-1 defect form (verbatim statement, :20–43), Pb-2 `_of_negligible`
(δ/2-split "exactly as M4a's `zetaK_distinct_five_sixths_strip_landed_of_negligible`",
:57–65), Pb-3 the 5/6 C1 arm (:67–70). But A4 also owns slot 2 (AL-3D, the cycle's
heaviest pilot — three M-class milestones) and the 74-T3 option; A3 owns the M4b2 V2
recipe that Pb-3's `K839OfLocalStrip` slot rides (`pilots/42/run_m4b2.py` recipe,
`zzv2-lambda-prework.md:105–115`).

**Cost-risk.** A4-overload risks serializing slot 2 behind P-b (both are M). Moving
P-b costs context transfer: Pa.lean's 1,557-LoC layer + the design file — moderate for
A3 (the M4a mirror is A3's own pattern), high for A8 (no 75/V2 context).

**Recommendation.** **A4 keeps P-b, sequenced strictly after slot-2 AL-P0/P1 land**
(the §2 queue order); pre-written fallback: if AL-P2 opens while P-b is untouched, P-b
moves to A3 at the next re-task (A3's N2 half shares the substrate). No review hinge.

### (f) 22-T2a ownership

**Options.** A8 (execution owner, after 72-M1 L3) vs A2 (analytic-NT provenance) vs
defer entirely.

**Evidence.** 22-T2a is dossier 22's ONLY open content — T2b closed by upstream
StrongPNT (`novelty/pntplus-glue-as-donor.md:141–146`); it is "small, well-scoped,
upstream statement as binder, statement-port≈0" (`ITERATION4-SCAN.md:82–86, :25`). Two
standing gates: the mathlib-PR clock ("charter fast or binder-shape it",
`iter4-seed-triage.md:18`) and the PNT+ registration trigger T1 — register-and-port
fires only if "a dossier-22 T2a pilot wants the upstream Borel–Carathéodory bootstrap
chain" (`pntplus-glue-as-donor.md:130–132`); without it, DEFER stands (:125–129) and
upstream is cited as external formal prior art. A2 is loaded (slot 1 + the owed 73-Q4
recommendation); A8's queue (72-M1 L3, then slot work) matches the C2 shape
("pilot close-outs + slot work", `ITERATION4-CHARTER-DRAFT.md` §c A8 row).

**Cost-risk.** The T2a statement is conditional (quasi-RH binder + a
PNT-shape binder) — the risky part is phrasing, not proving: CLAIMS-REGISTER row 22's
"first effective PNT-class error term in the Lean ecosystem" is already flagged RISKY
(`pntplus-glue-as-donor.md:148–150`). Whatever lane executes must route wording through
A5 and NOT fire T1 without a charter decision.

**Recommendation.** **A8**, as a binder-shaped S-pilot: first milestone is statement
elaboration only (donors as binders; no T1 trigger; claim text pre-cleared by A5). No
review hinge on ownership; R5 may reorder its priority vs the 10-tranche.

---

## 7 PHASE-B LANE BRIEFS (launch-day first queues; paste-ready at charter typeset)

Parameterized on the two branch-decisions: **[RUNG]** = B.2-staged (default) / B.3 (if
the AL-P1 GO/NO-GO flips, per §6c — the branch point is post-AL-P1, so the A4 brief is
written once); **[SLOT3]** = ZZV2-λ (default, §6a K) / FF-EZ2 (swap branch). Modal cost
classes (all runs default 2 CPU / 4 GB soft + telemetry, per `AGENTS.md` §Modal usage
guidelines): **C1** = warm statement/elaboration probe, minutes (`ITERATION4-SCAN.md`
§3.1); **C2** = pilot-file elaboration runs, warm ≈3–15 min; **C3** = donor-tree runs
(V2+PNT+ build, ≈15–20 min warm, cached layers, M4b2 recipe —
`zzv2-lambda-prework.md:105–115`). Overrun rule everywhere: guard breach without GREEN
⇒ stop, diagnose-note in the log dir, report (`lp-layer-prework.md:284–285`
convention).

**A1 — feasibility upkeep.** Assignment: substrate + ledger for the iteration; fold
R8's unblock plan when it lands. Deliverable: `feasibility/VERIFICATION-LEDGER.md` (open
§10), `feasibility/ITERATION4-SCAN.md` upkeep. First milestone (non-pilot): §10 header
+ the generalized axcheck sibling-import rewrite spec (SCAN §3.3 lesson). Overrun guard:
no Modal runs in item 1; machinery check = one C1 axcheck re-run. Cost class C1.

**A2 — slot 1 (LP layer + 02-core consumer) + 73-Q4 recommendation.** Assignment:
execute `pilots/lp-layer-prework.md` §5 verbatim. Deliverable: `pilots/lp-layer/`
(P0.lean, L1.lean, L2.lean + logs; prework file stays A2's). First milestone
(kernel-checkable): **LP-P1** — `lp_weak_duality` (asymmetric standard form, §2.1
verbatim from the bridge) + symmetric corollary proved kernel-clean in `L1.lean`,
inline full-coverage axcheck; guard ≤0.25k LoC (:269–273). Queue item 2: the 73-Q4
`hRat` discharge recommendation memo (elementary per `FF-sequencing-memo.md:36–44`,
0.3–0.6k LoC estimate — recommendation only, execution is a separate charter gate).
Item 3: B-rung launch input to A4 (§6c). Stop gates: no Farkas/strong
duality/separation, no `sSup` packaging, no 02 Theorems A/B/C (:278–283). Cost class
C2.

**A3 — [SLOT3] + 50-M2 routes + 75-N2 support.** Default (ZZV2-λ): execute
`pilots/zzv2-lambda-prework.md` §2. Deliverable: `pilots/zzv2-lam/` (runner + P0 probe
+ `ZZLam.lean` + logs; ownership per :139–144). First milestone (kernel-checkable):
**P1** — the `ZZLam` file (L0 `LamParams` + L1 `kernelLam`/`C0Lam`-shape defs + L2
binder-shaped family statements) GREEN on donor+mathlib statements alone, kernel-sum
side as ONE explicit binder `hKS_lam` (:92–96); guard ≤~300 LoC (:131). P0 (1–2 C3
runs, statement facts only) precedes and PINS the λ-range — do not guess it (:44–46).
**STOP rule:** if P0(b) finds the Landau/kernel-sum layer MT-frozen, stop after P1 GREEN
+ diagnose-note; the Landau η-port is a charter decision (:132–135). Posture:
formalization-first technical record — every phrase routes A5-side (:117–127). Swap
branch (FF-EZ2): deliverable `pilots/ff-ez2/` + a P0 spec doc first (the 71/73 pattern);
milestone 1 = the survivor statement elaborated on-pin (C1 probe, tauceti/mathlib-only)
AFTER A5's dossier-level battery clears it (`iter4-seed-triage.md:19` re-verify mark);
no guards exist yet — the spec doc must set them before any proof run. Cost class C3
(default) / C1 (swap probe).

**A4 — slot 2 (AL-3D, [RUNG]) + 75 P-b (sequenced) + 74-T3 option.** Assignment:
execute `pilots/al-3d-prework.md` §5 (A2's spec, cross-lane handoff). Deliverable:
`pilots/al-3d/` (AL-P0.lean, AL-P1.lean, AL-P2.lean + logs) + `pilots/75/Pb.lean`
(A4-owned, `Pb-design.md:11–12`). First milestone (kernel-checkable): **AL-P1** — the
fibre-geometry core P1-a…P1-d kernel-clean + inline axcheck; guard ≤0.4k (:263–266);
AL-P0 (statement port, guard ≤0.45k, C1/C2) precedes and is [RUNG]-neutral. [RUNG]
branch: B.2-staged target = `SlabAreaLawColumnCuts3D` under the `PlanarAreaLawVar`
binder (AL-P2, guard ≤0.9k); if the AL-P1 GO/NO-GO trips (boundary lift needs
fibre-generic donor restatement), flip to B.3 — AL-P0/P1 carry over; only AL-P2's
target statement changes (B.3 replaces counting constants, :77–78). Stop gates: never
`AreaLaw3D`/progress phrasing without naming a C-item; no full `SlabAreaLaw3D`; no
donor imports; no binder discharge (:271–276). Queue item 2 (after AL-P1): 75 **Pb-1**
(the defect-form landing, statement verbatim at `Pb-design.md:20–43`) — Pb-2/Pb-3
follow; fallback to A3 per §6e if slot 2 runs long. Item 3: 74-T3 ONLY if the charter
names it (LP-P0 keeps its shape-port; own guard ≤0.6k additional,
`lp-layer-prework.md:276–277`). Cost class C2 (C1 for AL-P0).

**A5 — novelty batteries + clocks.** Assignment: dossier-level batteries for the three
slots ([NOVELTY-CHECK-NEEDED] obligations — `ITERATION4-SEED-DOSSIERS.md` header),
consume R6/R7 when they land, clock sweep (tracker static-asset curl, Liu-2,
WenrongZou, physlib `FieldStatistics/`+`WickAlgebra/`, mathlib PNT/LP PRs). Deliverable:
`novelty/round-5.md` + VERDICTS rows. First milestone (non-pilot): slot-1/2/3 battery
verdicts at dossier grade (the round-4 PART-2 pattern); pre-clear 22-T2a's claim
wording (§6f). Overrun guard: batteries time-boxed per candidate; no Modal. Cost class
none (desk work; the tracker curl is not a Modal run).

**A6 — the 10 assembly tranche (D1–D6).** Assignment: execute
`pilots/10/next-tranche-spec.md` (A6-authored, [CHARTER-PENDING]). Deliverable:
`pilots/10/` new tranche files + logs. First milestone (kernel-checkable): **D1** — the
wd↔cw walk agreement lemmas kernel-clean (the tranche's plumbing base; whole tranche M,
≈1.0–1.6k new LoC, `pilots/10-blueprint.md:188`; D4 = `exists_tm_padded_space` is
landable without D5/D6 per the blueprint's "charter decides scope/split"). Claim
discipline: eth-Lib-grade plumbing, no new-math claims except the space conjunct
(next-tranche-spec §0 :17–24). Overrun guard: tranche-total 1.6k; per-milestone
diagnose-note convention. Cost class C2.

**A7 — donor probes (G5a + as-chartered).** Assignment: prep the G5a Physlib unblock
against R8's plan when it lands (boundary known: statement layer imports
`Region.{State,TraceDistance}` → Physlib @ `a50684a1`; 17 errors/1 module vs our pin —
`ITERATION4-SCAN.md` §1c A7 row). Deliverable: `feasibility/axiommath-donor-probes.md`
+ `feasibility/probe/ProbeG5a*` + `logs-g/`. First milestone: the re-priced G5a probe
plan (no run without charter + R8 input; G6a stays priced-and-blocked — 59,222-job
closure, never re-run without charter). Overrun guard: statement-elaboration probes
only; any build-class run needs the cached-layer pattern. Cost class C1 (probes) /
build-class only via cached layers.

**A8 — 72-M1 L3 + interface, then 22-T2a.** Assignment: execute
`pilots/72-M1/L3-spec.md` (A8-owned continuation; [CHARTER-PENDING]). Deliverable:
`pilots/72-M1/` L3 files + logs. First milestone (kernel-checkable): **L3a** — per-term
Hermiticity by symmetrization, ~40–80 LoC kernel-clean (`L3-spec.md:72–86`); then
L3b/c/d + interface steps i–vi. Queue item 2: 22-T2a binder-shaped S-pilot (§6f) —
first milestone is statement elaboration only (C1), claim wording pre-cleared by A5,
T1 NOT fired. Overrun guard: L3-spec's own guards; 22-T2a statement-only until
charter. Cost class C2 (L3) / C1 (22-T2a probe).

**A9 — dossier hardening + article gate.** Assignment: harden the three slot dossiers
to full Phase-3 form; instantiate the iteration-4 article template (post-R1) and
re-classify the standing article set for the two-strike baseline (§3c.5). Deliverable:
`candidates/` slot dossiers (numbering at spawn), `articles/` template + README rows,
TRIAGE-ITER4 rows. First milestone (non-pilot): the re-classification table (kind per
article, the §3b.1 vocabulary) + the slot-1 dossier-hardening record. Overrun guard:
no Modal; dossiers cite direct-source only (decl-index caveat). Cost class none.

**H — standing.** Launch commit (charter splice + ITERATION4-* kit + this plan);
concurrency probe at each batch close; custody of `qa/iter4-review/*` landings; STATUS
cycle-open block. Cost class none.

Spawn order at typeset: A1 → A5 → A9, then A2/A3/A4 (slots), then A6/A7/A8, H last
(`ITERATION4-CHARTER-SPLICE.md:73–76`). If [SLOT3] = swap, A3's brief needs its P0
spec doc authorized as a charter line (the spec-before-run rule above).

---

## 8 SPLICE TEXT v2 — the §Iteration 4 block, integration-pass fill (supersedes §1)

All slots resolved; every review input landed by 2026-11-16 evening is folded (R1, R2
incl. Part B, R3, R4 both parts, R5 §§1–15, R8, `articles/TEMPLATE-iter4.md`). Register
matches §Cycle 2 (`RESEARCH.md:25–39`). The close-out protocol block is folded near-verbatim
per R4 §6's instruction ("for R9 to fold verbatim into the Iteration-4 charter conventions
block"); the orchestrator may compress at typeset.

> ## Iteration 4 (opened 2026-11-16, orchestrator) — raising the discovery bar: complete
> > the genuine core, bill engineering as engineering
>
> Cycle 2 closed 2026-11-14 technically complete — eleven pilots GREEN, final sweep 44/44
> stages OK with 0 `sorryAx`, TRIAGE §decision typeset, REPORT §C2 filled, AGENTS-C2-DRAFT
> applied (`STATUS.md:718–754`) — **but its articles drew unsatisfactory external
> feedback, and the nine-lane review (2026-11-16, `qa/iter4-review/`) confirmed the
> diagnosis: R2's cold count finds ≈ 4–5 genuine discoveries in the 18-article corpus
> (01, 30, 32, 75's conditional statement class), with the Cycle-2 "discovery headline"
> a donor-swap whose own article says "There is no new analytic mathematics"; R1 finds
> the set "individually near-competent and citation-excellent, and collectively
> unacceptable as a research-article corpus" (engineering records in article clothing,
> house-dialect status lines, seam contradictions). R3's trace audit held: 19/19 articles
> VERIFIED, no mathematical overclaim — the verification chain is sound, and the verdict
> is about discovery strength and packaging, not proof integrity. R4 confirms both cycles
> delivered their charters (one delivered-differently, recorded) and upgrades the
> close-out protocol (adopted below).** Iteration 4 therefore re-charters with a raised
> discovery bar and a corrected billing discipline over the five corpora (mathlib,
> tauceti, openai-math, anthropics, axiommath) plus the Cycle-2-surfaced donors and gaps;
> the seed inventory is pre-assembled (`feasibility/ITERATION4-SCAN.md`,
> `ITERATION4-SEED-DOSSIERS.md`, A5's `novelty/iter4-seed-triage.md`,
> `novelty/physlib-surface.md`) and the backlog consolidated (`qa/iter4-review/
> r5-iteration4-backlog.md`, §§1–15 with execution specs).
>
> **Quality gate (adopted; normative here, operational in `articles/TEMPLATE-iter4.md`).**
> An article ships only through the template — kind declaration (DISCOVERY /
> DISCOVERY-CONDITIONAL / NEGATIVE / FORMALIZATION-FIRST), per-theorem status rows in the
> closed four-string vocabulary (PROVED-UNCONDITIONAL / PROVED-CONDITIONAL / CERTIFIED-
> NUMERIC / PAPER-ONLY), a novelty table with ≥ 2 nearest-miss rows, per-theorem
> verification blocks per R3 §5 (sha256-at-sweep, extractor-generated counts, binder
> inventories), no infrastructure narration, and the full §9 shipping checklist. A
> candidate is article-eligible only if it passes R2's four-point strength bar S1–S4
> (statement-level novelty with named nearest-miss; essential multi-corpus bridge;
> non-trivial proof content or a surprising statement; discharge discipline — corollary-
> level lemmas never pass S1). Donor swaps, binder discharges, open-headline tranches,
> certified numerics and formalization-first layers are first-class ENGINEERING
> deliverables — technical records, dossier notes, ledger rows — never discoveries; an
> upgraded theorem is revised to v2 in one versioned article, never split. Two-strike
> rule, FINAL: at most **one** knowledge-level / formalization-first / donor-discharge
> article per cycle (reserved for the exceptional forced-correction class), and ≥ half of
> shipped articles each cycle must be discovery-grade.
>
> Phase mapping: Phases 1–2 pre-done, Phase 3 pre-done at pre-dossier level — the run
> starts at dossier hardening and Phase-4 triage. **Launch order (R5 §7a, adopted):**
> (1) **75 P-b, the 5/6 strip-distinct arm — day-1, the iteration's top-billed discovery
> milestone**: completion of the one Cycle-2 statement class that survived audit
> (n-fold abelian-assembly ζ_L proportions; Pb-1/Pb-2/Pb-3 over the GREEN Pa.lean carry;
> conditional-titled per S4(b); DLRT / Bansal–Maji / article-42 nearest misses). (2) The
> **LP-duality layer + 02-core consumer, same week, chartered as the named ENGINEERING
> deliverable** (never an article; Lean-ecosystem-scoped claim only — the Isabelle AFP
> trio `LP_Duality`/`Linear_Programming`/`Farkas` and Coq 1706.10269 own the theorem
> class and are mandatory nearest-miss citations alongside Yamashita and the mathlib
> `Analysis/Convex/Cone/Basic.lean:33–37` TODO; `lp_weak_duality` + `bw2_ceiling_of_dual`
> per R5 §9). (3) **AL-3D, B.2 staged** — `SlabAreaLawColumnCuts3D` under the honest
> `PlanarAreaLawVar` binder (never an AreaLaw3D-adjacent headline; every claim names its
> C.1–C.4 fence; **the B.2/B.3 branch sits at the post-AL-P1 GO/NO-GO**, AL-P0/P1 serve
> both rungs; B.3 is the designated iteration-5 rung at R5's 6.3k-LoC transcription
> pricing). (4) **ZZV2 λ-family route (a)** — engineering/technical-record deliverable
> (Lamzouri owns the informal math and is must-cited in full; hard STOP after P1 GREEN if
> the Landau layer is MT-frozen). (5) **72-M1 L3 + the interface theorem**. **Companion,
> day-2/3 (R5 §14 run 8): the hEχ discharge at the zeta23 donor pin** — build zeta23's
> small v4.33 tree once (`crossmath-pilot-zeta23E`, own image lineage, C3 [LAYERS]
> hour-class at SPEC), transitive `#print axioms` of the Theorem-E chain, consumer
> elaboration in-tree, statements port back as discharged 2/3 binders; **COMPANION
> billing to 75-Pb — two binder tiers of the ONE 75 statement-class article** (the 2/3
> tier unconditional at ℚ = the cycle's strongest S4(a) move, a previously-open binder
> discharged in the article; the 5/6 distinct tier conditional; the quadratic-ζ_K 2/3
> zero-analytic-binders corollary as the third tier; R5 §14.1). Slot ledger + evidence
> formats + OPEN markers: `qa/REPORT-INPUTS-ITER4.md`. Behind them:
> 73-Q4 `hRat` (GO input per R5 §13; dossier-upgrade note on GREEN, `hPur` stays a
> binder), 74's T1+T2+T4 discovery-dense core (T3 rides the LP layer), the 10 assembly
> tranche D1–D4 (week 2; declared plumbing — completion value, never discovery billing),
> FF-EZ4 + 22-T2a (binder-shaped, statement-first; G9 preflight; PNT+ registration T1 NOT
> fired), 75-N2, and the bench (41, 12, FF-EZ2 behind its battery, physlib occupation-pair
> probe). Carried at binder tier only: 50-M2 R2/R3 (R1 landed GREEN in Cycle 2; article
> 50-M2 final). **Donor-route verdicts (R8, adopted):** DZDF direct build is
> dead-as-specced (≤ 4 of 62 first-wave errors shim-addressable; ≈ 6.3k-module closure;
> no consumer — the binder tier already landed); the Physlib/G5a direct route is dropped
> (AL-3D needs zero Physlib; G10 stays specced on the shelf, fire-gated on a chartered
> consumer); upstream PNT+ stays DEFERRED (T1/T2/T3 unfired; v4.35.0); Weil stays at the
> statement tier (Stacks direct import dead; the G3/pilot-71 path IS the consumption
> route). QuasiRiemannTracker is a CLOCK, not a donor. **Watch (R6's fresh-bridge scan,
> `novelty/iter4-fresh-bridges.md`):** five FB seeds — FB-1 zero-temperature entropic
> duality + the tropical substitution-rule question (tauceti OT × OAI tropical × the
> seed-9 LP layer); FB-2 effective corollaries of the 7/8 / Landau–Siegel donors
> (PNT-in-AP at x^{7/8+δ}-grade error); FB-3 an irrationality-exponent object layer
> (OAI × mathlib `LiouvilleWith` × tauceti badly-approximable); FB-4 the function-field
> PNT (tauceti's general Wiener–Ikehara × Weil rationality, statement-binder); FB-5 the
> Laughlin/Fock inequality on tauceti's graded CAR (occupation-sector reduction) —
> **grades provisional: R2 is re-grading them under the bar**; no FB charter before its
> dossier-level battery. Two unregistered PROVED openai-math donors recorded:
> `OAI.SiegelZeros.exists_absolute_real_zero_gap` (uniform Landau–Siegel exclusion,
> `(1−β) log q ≥ c`; preprint *Uniform exclusion of Landau–Siegel zeros*, 2026-10-01,
> Thm 1) and the `OAI.PiExponent` tree (μ(π) = 2 + Flint–Hills summable; trace record
> `reasoning_traces/irrationality-exponent-of-pi.pdf`; the adjacent QRH paper2 Thm 1.1
> = 11/12 is itself unformalized and dominated in-corpus by the G7b-audited 7/8 tree) —
> **DO-NOT-CONSUME until the G11/G12 statement-binder probes register them** (Liu-1
> convention: v4.34.1 pin, binder-only, on-pin triad check first). FB-2's PNT-AP shape
> is the PNT+ watchlist's T2 trigger — **watchlist posture only, registration not
> fired**. Week-1 drain review (orchestrator): take the completion-path elevation
> decisions — 01-stability and 32-crossing when R2's specs land (hEχ already folded at
> run 8; 30-Theorem A behind them).
>
> Lane topology: nine lanes + H, queue-loaded re-tasks, one writer per file, H-commit
> cadence + concurrency probe (assignments: `qa/iter4-review/r9-iteration-plan-draft.md`
> §9). Ground rules carried verbatim: discovery-first, kernel-only (no sorry, no
> native_decide, no external CAS), siblings read-only, exact citations for every claim;
> donor statements enter only as hypothesis binders, verbatim marked probe copies, or
> already-built on-pin libraries; logs persisted with provenance headers; Modal usage per
> the mandatory guidelines (2 CPU / 4 GB default, telemetry every run, overrun ⇒
> investigation; new apps clone the 73/75 runner pattern with textually identical
> `run_commands` for layer-cache sharing). Substrate: `feasibility/ITERATION4-SCAN.md` §3
> + R8 §5 (runner kit, cost classes at SPEC, artifact-cache retry ≤ 4 then seed-and-build).
>
> **Close-out protocol (adopted from the Cycle-2 close audit, `qa/iter4-review/
> > r4-process-completeness.md` §6).** (1) **Scoped final gates** — every close gate grep
> > is scoped to the live section of its target file
> > (`! sed -n '/^## <live-section>/,$p' <file> | grep -q '<retired-string>'`), never the
> > whole file; a gate that cannot pass invites silent overrides. (2) **Gate-run
> > persistence** — the final run of every gate executes on the exact tree being closed
> > and its results table (gate / command / result / date / commit) is committed with the
> > close block; failures are fixed-and-rerun or recorded `OVERRIDDEN — reason — owner`;
> > "passed by inspection" is not a state. (3) **INDEX refresh is a close gate** — close
> > is not declared until INDEX.md reconciles both directions against disk (every new row
> > dated and source-cited; stale-status rows rewritten in the same pass). (4) **Date
> > discipline** — dates in typeset records come from the decision-log row or the commit,
> > never memory; before the close commit the tree greps clean of future and split-mind
> > dates. (5) **Staging-file supersession** — when a staged block is spliced or decided,
> > the staging file gets its superseded/selected stamp in the same commit.

Deltas vs §1 (v1): subtitle and close-summary now carry the quantified review verdict
(R2's 4–5-of-18, R1's collection-failure line, R3's chain-held line); the slot list is
re-ordered to R5 §7a's launch order with billing labels (75-Pb discovery day-1; LP
engineering — v1 had LP as slot 1 with article-gated consumers; R2 S1 removes LP's
article eligibility entirely); B.2/B.3 branch moved from "decided at launch" to the
post-AL-P1 gate; ZZV2-λ's posture hardened from "technical-record expectation" to
chartered engineering deliverable; the two-strike cap is N=1 FINAL (was N=2 provisional);
R8's route verdicts and the R5 queue ranks 6–15 replace v1's carried/watch prose; the
close-out protocol block is new. §1's honesty corrections (50-M2-R1 landed; 72-M1-L3 and
10-tranche carried) survive inside the new ordering.

## 9 PHASE-B LANE BRIEFS v2 (de-parameterized; supersedes §7)

Branches resolved: [RUNG] = B.2 staged, formal branch at the post-AL-P1 GO/NO-GO
(coordinator decision (c), R5 §11 adopted); [SLOT3] = KEEP ZZV2-λ as engineering
deliverable (decision (a), R5 §12 adopted). Lane key stays the §7 A-key (R5 §15 defers
to it as typeset-ready, picking up exactly two deltas, both applied here: 75-Pb's day-1
lane per decision (e), and the 73-Q4 memo's home). Modal cost classes follow R5 §2 /
R8 §5b at SPEC: C1 warm probe (minutes), C2 pilot milestone (≈3–15 min; heavy-import
variants read ≈5–6 GB RSS by mmapped-olean residency — inherent), C3 donor-tree
(≈1–2 h at SPEC). Overrun rule everywhere: guard breach without GREEN ⇒ stop,
diagnose-note, report; fix rounds need a written error-class hypothesis.

**A1 — feasibility + gate machinery.** (1) Generalize the make_axcheck sibling-import
rewrite to map every staged name → ALL sibling TARGETS imports (absorbs the coming
`AxL1→L1` and `al3d A2→A1` cases; R5 §5 L7 item 1 + R8 §7b wrapper debt: patch the two
stale xyz wrappers `pilots/32/run_pilot.sh:15–16`, `feasibility/probe/run_probe.sh:15–16`).
(2) Ledger §10 rows + sweep TARGETS for every landing. (3) The G5a decision memo
(fix-forward vs mathlib-only; coordinate R8 §2; G10 stays shelf, fire-gated).
Deliverable: `feasibility/VERIFICATION-LEDGER.md`, `feasibility/probe/*`. First milestone
(non-pilot): the generalized rewrite, proven on the pilot-11 case. Cost class C1.

**A2 — LP pilot (the engineering deliverable) + the 73-Q4 memo.** Execute R5 §9 verbatim.
(1) LP-P0 probe (`P0.lean` ≤0.15k; doubles as the artifact-cache health ping — R5 §14
run 1). (2) LP-P1: `lp_weak_duality` (M0.1) + `lp_weak_duality_symm` (M0.2) proved
kernel-clean in `pilots/lp/L1.lean`, inline full-coverage axcheck, guard ≤0.25k; GO/NO-GO
at §9a's inventory (convexity/separation/`Matrix` reach = stop). (3) LP-P2:
`bw2_ceiling_of_dual` in `L2.lean` (imports L1 — flag the sibling rewrite to A1), guard
≤0.7k; 74-T3 stays statement-port-only unless chartered. New app `crossmath-pilot-lp`
(clone `pilots/75/run_pilot.py`, textually identical `run_commands`). Billing:
engineering deliverable, no article under any outcome. (2nd queue item) the 73-Q4 gate
recommendation memo — R5 §13's input is GO; the memo is the charter line, execution
separate. Deliverable: `pilots/lp/*`. First kernel-checkable milestone: M0.1 GREEN.
Cost class C1/C2, 1–3 runs per stage.

**A3 — 75-Pb day-1 (top-billed discovery milestone) + ZZV2-λ + binder-tier routes.**
(1) Execute R5 §8 verbatim: `Pb.lean` = Pa.lean carried verbatim + E1–E6 (+0.25–0.35k
LoC), first milestone E1 `addFinOver_cons` + E2 `commonStripCum_add_le` + E3
`commonStripCum_addFin_le` GREEN (R5 §14 run 2, warm `crossmath-pilot-75`); then E4–E6 →
Pb-1/Pb-2/Pb-3; guards 0.45k-LoC/6-runs/F1-F2-3-runs; fallback = iterated 2-factor defect
(§8e, enumeration-dependent, honestly noted); acceptance per §8f (full-coverage prints,
zero donor imports, no U+2032 primes). Billing: discovery completion of the 75 statement
class, conditional-titled per S4(b) — the cycle's first H-commit celebration.
(2) ZZV2-λ per R5 §12: P0 probe on the V2 tree (pins the Landau η-genericity question;
C3, ≈1–2 h at SPEC, queued LAST in the 48h window), P1 `ZZLam.lean` ≤300 LoC
binder-shaped GREEN, STOP-after-P1 rule; technical-record billing, Lamzouri must-cites.
(3) 50-M2 R2/R3 binder-tier notes + 75-N2 (d1)/(d2) co-staging (post-P-b). Deliverables:
`pilots/75/Pb.lean`, `pilots/zzv2-lam/*`, `pilots/50/*`. First kernel-checkable
milestone: E1–E3 GREEN, day 1. Cost class C2 (75) / C3 (ZZV2).

**A4 — AL-3D B.2 only.** Execute R5 §11 verbatim. (1) AL-P0: the frozen statement
skeleton M0.1/M0.2 + `PlanarAreaLawVar` + encoding cluster, mathlib-only, guard ≤0.45k
(template `ProbeG4_AreaLaw.lean`). (2) AL-P1: fibre core P1-a…P1-d, guard ≤0.4k; the
GO/NO-GO here is the B.2/B.3 branch point (flip to B.3 = swap AL-P2's target statement
only; AL-P0/P1 carry over). (3) AL-P2: `SlabAreaLawColumnCuts3D` under the binder,
guard ≤0.9k, honestly weaker-than-frozen labeling. New app `crossmath-pilot-al3d` (clone
73 pattern). Stop gates per R5 §11d (no `AreaLaw3D` progress phrasing without a C-item;
no full `SlabAreaLaw3D`; no donor imports; no binder discharge). Billing:
substrate + conditional rung-stone, never a headline. Deliverable: `pilots/al3d/*`.
First kernel-checkable milestone: AL-P1 P1-a…P1-d. Cost class C1/C2 heavy-import.

**A5 — novelty battery + clocks.** (1) Dossier-hardening batteries for the chartered
items (mathlib-Cone/LP-PR clock; Lamzouri λ-window and constant shapes; third-party
formal activity on AreaLaw2D's 3D layer; consume R6/R7 on landing — battery-finality
BLOCKED until they do). (2) Debts f/g/h/l discharge lines; Rosen ch.-number spot-check
(due at Q4); 72's α>1 Rényi re-check (due at 74 pilot). (3) Standing clocks (tracker
static-asset curl w/ `as_of`+commit-date convention, Liu-2, physlib `pushed_at` +
`QuantumInfo/ForMathlib` wing sweep per R8 §2b correction, WenrongZou, mathlib PRs).
Deliverable: `novelty/round-5*`, VERDICTS, CLAIMS-REGISTER. Non-pilot. Pre-clears 22-T2a
claim wording and the FF-EZ2 dossier-grade re-verification (debt g pin).

**A6 — bench activator (week-2).** (1) Week-1: pilot close-out support + readiness
checks on `pilots/10/next-tranche-spec.md` (scope split D4-without-D5/D6 pre-decided).
(2) The 10-tranche D1–D4 on first lane-drain or the charter scope call — first
kernel-checkable milestone D1 (wd↔cw walk agreement lemmas); tranche guard 1.0–1.6k;
declared plumbing, never discovery-billed. (3) 41 q-deformed-eight-square re-scope probe
as second drain-filler. Deliverable: `pilots/10/*`. Cost class C2.

**A7 — donor probes.** (1) G9 StrongPNT statement-binder transcription probe
(conditional on the 22-T2a charter; `ProbeG9_StrongPNT.lean`, g-mode in
`crossmath-gprobe`, warm; R8 §3). (2) G10 stays shelved — no run without a chartered
consumer (72-M1 Tier-B or `PlanarAreaLawVar` discharge); G8 NOT recommended (R8 §1d).
(3) Substrate probes as chartered. Deliverable: `feasibility/axiommath-donor-probes.md`,
`feasibility/probe/ProbeG*`, `logs-g/`. First milestone (non-run): the G9 probe file
staged. Cost class C1.

**A8 — 72-M1 L3 + 22-T2a.** (1) Execute `pilots/72-M1/L3-spec.md`: first
kernel-checkable milestone L3a (`hermPart_isHermitian`/`opNorm_hermPart_le`/
`hamiltonian_hermPart`, ~40–80 LoC) then L3b/c/d + the interface theorem; ≤8 warm runs
(reuses `crossmath-probe` — R5 §14 run 6); Tier-C only. (2) 22-T2a binder-shaped
S-pilot: statement elaboration ONLY after A5 pre-clears wording and A7's G9 validates
the binder shape; T1 NOT fired; no priority claims beyond the scoped T2a statement.
Deliverables: `pilots/72-M1/*`, `pilots/22/*`. Cost class C2 / C1.

**A9 — dossiers, records, article gate.** (1) Dossier 74 hardening to full Phase-3 form
(T1+T2+T4 scored core; T3 rides LP) — unlocks the rank-7 pilot on the first draining
lane. (2) Pilot-outcome records for A3/A8 landings; TRIAGE-iter4 sync against R5.
(3) **Article-gate enforcement**: the re-classification baseline (R2 §8 target 5
discovery-grade / 9 technical records / 1 certificate moved / 2 merged), template
instantiation for any new article, and the two-strike ledger at N=1; execute the R2/R1
restructure pass 2 with H as ONE sequence once the orchestrator approves R2's §8 plan
(R4 §7 coordinates the exact edits). Deliverable: `candidates/74*`, `articles/*`,
TRIAGE-iter4 rows. Non-pilot.

**H — standing.** Pre-splice batches A+B (pre-approved, R4 part 2); batch C rides the
splice commit; launch commit (splice + ITERATION4 kit + review files + this plan);
concurrency probe at each batch close; `qa/iter4-review/*` custody; STATUS cycle-open
block; ORCHESTRATION-ITER4 re-key to the §9 duties.

## 10 LAUNCH-DAY CHECKLIST v2 (supersedes the §1.1-referenced A1 checklist)

1. **Pre-splice (H):** apply R4 batches A+B (pre-approved one-liners + INDEX refresh);
   the orchestrator records the R2-restructuring approval (pass 2 then executes as ONE
   post-splice sequence per R4 §7 — README kinds/folds, filename rename, TRIAGE/REPORT
   C3 rewording, coordinated with batch-B rows).
2. **Splice commit (H, on `dev/iteration4`):** orchestrator typesets §8's splice text
   into `RESEARCH.md` §Iteration 4 (nothing left to fill — v2 is decided text; the
   orchestrator may compress the close-out protocol block); R4 batch C applied in the
   same commit (C1 = §Cycle 2 close-out record paragraph; C2 = STATUS:761 debts line);
   STATUS cycle-open block; ORCHESTRATION-ITER4 re-keyed to §9 duties; commit includes
   the ITERATION4 kit + all `qa/iter4-review/` files + this plan.
3. **Lane re-task:** orchestrator re-tasks the nine R-lanes to the §9 A-duties with the
   briefs above (paste-ready). Spawn order: A5 → A1 → A9 first (gate inputs, machinery,
   baseline records), then **A3 (75-Pb, day-1 milestone) + A2 (LP-P0 same day)**, then
   A4, A8, A7, A6 (week-2 activator), H standing; concurrency probe
   (`ps -eo comm --no-headers | grep -cx zcode-cli`) at each batch close, steady ≈
   lanes+1.
4. **First Modal runs — staged-then-approved:** R5 §14's ten-run queue governs the first
   48 h (every row STAGED-NO-RUN; the approval column resolves at charter typeset). All
   runs SPEC 2 CPU / 4 GB + `@telemetered` + `LEAN_NUM_THREADS=2`; the three new apps
   (`-lp`, `-al3d`, `-zzv2-lam`) clone the 73/75 pattern with textually identical
   `run_commands` (first-run image build = layer-cache hit — do not reword fetch lines);
   LP-P0 run 1 doubles as the artifact-cache health ping (retry ≤ 4, then seed-and-build);
   ZZV2-λ P0 runs LAST (the only cold-class item, ≈1–2 h at SPEC, 3-h timeout;
   image-layer caching is a launch-day option, not a default); G9 is conditional on the
   22-T2a charter; any run needing > 4 GB re-asks with fresh telemetry (the G7b 8 GB
   approval is spent).
5. **Gate disciplines live from day 1:** TEMPLATE-iter4 mandatory for any article (R1's
   banned status vocabulary; R3's per-theorem verification blocks, extractor-generated
   counts, sha256-at-sweep; README row in the same commit); billing labels on every
   artifact from its first commit (75-Pb = discovery-completion conditional-titled;
   LP/ZZV2-λ = engineering/technical record; AL-3D = substrate/rung-stone; 10-tranche =
   plumbing; 73-Q4-GREEN = dossier upgrade note, no article even on success); R4's five
   close-protocol rules apply immediately where they touch daily work (date discipline,
   staging-supersession stamps, dated+cited INDEX rows at landing); the two-strike
   ledger (N=1) opens with A9's re-classification baseline.
6. **What still gates what:** **R6 (fresh bridges) and R7 (external prior art) have NOT
   landed** — they block article shipping and A5's battery-finality declarations, NOT
   the splice or the pilot launches; their outputs merge per the standing protocol
   (nearest-miss tables, clock sweeps). **R3 landed during this pass** and is consumed
   (19/19 VERIFIED; §5 protocol folded into the day-1 disciplines) — receipt
   confirmation rests with the orchestrator. **Cap-N is RESOLVED** (N=1 FINAL,
   coordinator correction; no longer gated on R2's next drain). **Open, non-blocking:**
   the R2 §9 completion-path elevation (75/42-hEχ donor-build discharge as the flagship
   continuation, 01-stability, 32-crossing, 30-Theorem A) is NOT in R5's ranked queue —
   R5's §7 reconcile predates R2's Part B; recommend the orchestrator take the
   elevation decision at the week-1 drain review (the hEχ route is R2's own "cheapest
   path to a genuinely unconditional theorem in the flagship statement class" and would
   absorb the 75-N2 rank-10 item).

— end R9 plan draft v3 (§§1–7 + §8 splice v2 + §9 briefs v2 + §10 checklist v2; §6
decision memos stamped with the orchestrator's recorded decisions incl. the (b)/(e)
corrections). No files outside this deliverable were modified; no Lean work; no Modal
runs.
