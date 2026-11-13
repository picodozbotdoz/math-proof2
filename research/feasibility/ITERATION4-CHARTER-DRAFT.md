# ITERATION4-CHARTER-DRAFT — skeleton for the §Iteration 4 addendum to research/RESEARCH.md

Lane A1, 2026-11-14. **Draft only — the orchestrator typesets and decides; everything
marked PROPOSAL is mine and may be overridden.** Slot markers used below:
**[TRIAGE-DECISION]** = deferred to pilot outcomes / triage; **[A5-SEED-TRIAGE]** =
deferred to `novelty/iter4-seed-triage.md` (in flight); **[G7b]** = gated on the G7b
donor-pin axiom audit (run19, in flight); **[SWEEP]** = gated on the Cycle-2 close-out
chain (sweep trigger → TRIAGE typeset → REPORT → AGENTS-C2-DRAFT applied → STATUS block).

## (a) Objective [PROPOSAL]

Continue the discovery-first program over the five corpora (mathlib, tauceti, openai-math,
anthropics, axiommath) plus the Cycle-2-surfaced donors and gaps. The iteration-4 seed
inventory (`feasibility/ITERATION4-SCAN.md` + `feasibility/ITERATION4-SEED-DOSSIERS.md`):

- **AL-3D targets** — AreaLaw2D's frozen 3D statement layer with the donor's own
  provability verdicts (B.2–B.5 bounded, C.1–C.4 fenced open problems).
- **LP-duality absence** — no LP weak duality anywhere in mathlib (tree-verified) nor in
  the other four corpora; one layer unlocks 02-core + 74-T3 across cycles.
- **ZZV2 λ-gap** — λ-abstract props exist unparameterized beside λ=1-frozen constants;
  the family layer is unclaimed and stack-reusable (42-M4/75).
- **FF continuation** — behind the in-flight 71-P2/73-C landings: FF-EZ2 survivor,
  FF-EZ4 (G6b tauceti bridge), FF-EZ5 families; 73-Q4 `hRat` gate.
- **Tracker DO-NOT-CONSUME posture** [PROPOSAL, from A5's audit]: QuasiRiemannTracker is
  a CLOCK, not a donor — re-check via the static-assets curl protocol (SCAN §3.9), date
  every QR-D artifact claim against it and the Liu-2 clock, but never consume tracker
  entries as results or cite them as donation sources; the Dirichlet-class formal
  frontier is other people's moving artifact (0.8733458561, Bebel, at audit).
- **Carried-over gates** — 50-M2 (R1 gated [G7b]; R3 Liu-1 binder CLEAN), 73-Q4,
  75 wave-4, 42-M4b-upgrade, 22-T2a (small, well-scoped).
- **Main-run cold inventory** — 41/12/31/60/40/30-remainder (SCAN §1b) compete for slots.

## (b) Phase mapping — what is pre-done (fresh run starts at hardening + triage)

| Phase | Pre-done by | Residual work |
|---|---|---|
| 1 (survey) | Main-run surveys (4 corpora, QA'd) + Cycle-2 axiommath surveys (`survey/axiommath*.md`, spotchecked) + terminal-points/donor-gap sections | none mandatory; refresh ONLY where a donor moved (clocks: Liu-2, tracker, WenrongZou, upstream PNT+) |
| 2 (bridges) | `bridges/function-field.md`, `bridges/area-law.md` (Cycle 2) + main-run bridge maps; SCAN §2 = the cross-corpus seed list (12 seeds, donor-cited) | optional mini-bridge for the LP layer (linear-algebra update); tauceti within-corpus zones need their own round if chartered |
| 3 (dossiers) | 3 pre-dossiers (`ITERATION4-SEED-DOSSIERS.md`) with statement sketches, why-new pre-checks, exact donor maps, feasibility classes, risks | **dossier hardening**: full Phase-3 form (precise statements, COMPLETE novelty verification — the [NOVELTY-CHECK-NEEDED] marks are obligations, not decorations — proof-strategy sketches) |
| 4 (triage) | score inputs pre-assembled (scan's N×S÷E arithmetic, sensitivity lines) | rank + slot after A5's seed triage lands **[A5-SEED-TRIAGE]** and Cycle-2 pilot outcomes settle **[TRIAGE-DECISION]** |

## (c) Lane topology [PROPOSAL — 10 lanes, mirroring C2's working shape]

| Lane | Role | Owned files (one writer each) |
|---|---|---|
| A1 | feasibility + close-out machinery + iteration scan upkeep | `feasibility/VERIFICATION-LEDGER.md`, `feasibility/probe/*` sweep machinery, `feasibility/ITERATION4-*`, survey/axiommath* |
| A2 | FF pilots (71-P2/73-C continuation; 73-Q4 if gated open) | `pilots/71/*`, `pilots/73/*`, `bridges/function-field.md` |
| A3 | donor map + pilots 42/50 | `pilots/42/*`, `pilots/50/*`, `novelty/axiommath-as-donor.md` |
| A4 | AL bridge + pilot 72 + dossier 74 | `pilots/72/*`, `bridges/area-law.md`, `candidates/74*` |
| A5 | novelty rounds + seed triage + clocks | `novelty/*` (round-5, VERDICTS, CLAIMS-REGISTER, RELATED-WORK, iter4-seed-triage) |
| A6 | long-form pilots (10-class) | `pilots/10/*` (+ new long pilots) |
| A7 | donor probes (G-series continuations: G5a/G6a/G7b; new donors as chartered) | `feasibility/axiommath-donor-probes.md`, `feasibility/probe/ProbeG*`, `logs-g/` |
| A8 | pilot close-outs + slot work (11/52/20-class; 72-M1 if carried) | `pilots/11/*`, `pilots/{20,52}/*` |
| A9 | dossiers 70–75 records + articles | `candidates/*`, `articles/*`, `TRIAGE-C2-ROWS.md`, `REPORT-INPUTS*` |
| H | board/commits/QA + concurrency probe | `STATUS.md`, `INDEX.md`, `qa/*`, commits |

Protocols carried verbatim from C2 (RESUME-BRIEF §Protocol): queue-loaded re-tasks
(2–3 item work queues, lanes work bottom-up, return when drained or at a decision
point; re-task before prose); H commits on lane reports (cadence: ≥2 events or any
decision-needing event; concurrency probe `ps -eo comm --no-headers | grep -cx
zcode-cli` at each batch close); one writer per file; logs persisted with provenance
headers (log-rescue lesson); post-outage log tails suspect until re-verified.

## (d) Proposed pilot slots with gates [PROPOSAL — all [TRIAGE-DECISION]]

| Slot | Content | Gate / sensitivity |
|---|---|---|
| 1 | LP-duality layer + first consumer (02-core shape; 74-T3 optional second) | **[A5-SEED-TRIAGE]** — escalate, don't swap, if POSSIBLY-KNOWN/LIKELY-DEAD; rises if 72-M1 lands (C.3 consumer warm) |
| 2 | AL-3D stage (a) statement port + (b) `PositiveReplacement3D` | **[A5-SEED-TRIAGE]** + decays if the donor/third party lands B.2–B.5 first (challenge-repo clock) |
| 3 | ZZV2 λ-family route (a) (continuity/glue) | strengthens automatically if 42-M4b-upgrade lands (same V2 stack); multiplies with 75 wave-4 |
| carried | 50-M2-R1 | **[G7b]** (run19 in flight); R3 fallback binder-CLEAN now |
| carried | 73-Q4 `hRat` discharge | separate gate after 73-C lands (A2 owns the recommendation) |
| carried | 75 wave-4 | spec landed; slot when the assembly stack is warm (42-upgrade/λ-family) |
| carried | 42-M4b-upgrade | G2-cleared; may already be executing (A3, `run_m4b2.sh` on disk) — confirm at charter time |
| carried | 22-T2a | small task-slot, upstream PNT+ statement as binder |
| watch | FF-EZ2 survivor / FF-EZ4 / FF-EZ5 / tauceti zones / AL-EZ1 P2-probe | rank only after the [TRIAGE-DECISION] inputs settle |

Slot-count and ordering are the orchestrator's; the sensitivity lines above come from
SEED-DOSSIERS §[TRIAGE-DECISION] verbatim.

## (e) Ground rules (carried verbatim from RESEARCH.md + C2 conventions)

> Discovery-first, not formalization-first: a candidate is valuable only if the statement
> is new. Lean is the verification vehicle, with the math-proof1 standard (no sorry, no
> native_decide, no external CAS). Sibling repos are read-only. Cite exact declarations,
> files, and paper sections for every claim.

Plus the C2 conventions: kernel-only verification; probe-convention stubs allowed only in
header-marked probe files, never cited as results; donor statements consumed as explicit
hypothesis binders, verbatim marked probe copies, or already-built on-pin libraries
(built = ZetaZerosV2, tauceti; statement-level = DZDF, Liu-1, Weil, upstream PNT+ —
SCAN §3.5); logs persisted with provenance headers; every log-tail written during an
outage window is suspect until re-verified.

## (f) Substrate

Pointer, not restatement: `feasibility/ITERATION4-SCAN.md` §3 (doz Modal pattern + costs,
artifact-cache retry protocol, axcheck coverage lessons incl. the sibling-import rewrite
generalization, Step-A classifier baseline, donor-consumption classes, toolchain split,
log custody, sweep discipline, standing-clock curl protocol). **[SWEEP]** Cycle-2 close-out
chain must complete before iteration-4 chartering is typeset: sweep trigger (all
FINAL-SWEEP-PLAN-C2 §0 TARGETS final-or-declared-drop) → Steps A–C → ledger §9 → H commit
→ TRIAGE §decision → REPORT §C2 → AGENTS-C2-DRAFT applied → STATUS cycle-close block.

— end draft (A1; all PROPOSAL slots subject to orchestrator decision; A5's seed-triage
verdicts to be folded into SEED-DOSSIERS §0 on landing — escalation rule per queue).
