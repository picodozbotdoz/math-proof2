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
- **Integration log:** 2026-11-16 (§6/§7 writing pass): re-checked — `qa/iter4-review/`
  still holds only this file; R6's `novelty/iter4-fresh-bridges.md` and R8's
  `feasibility/iter4-donor-unblock-plan.md` still absent. No merge points resolved;
  §6/§7 written branch-complete instead (hinges pre-written both ways).

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

— end R9 plan draft. No files outside this deliverable were modified; no Lean work; no
Modal runs.
