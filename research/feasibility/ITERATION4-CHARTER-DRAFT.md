# ITERATION4-CHARTER-DRAFT — skeleton for the §Iteration 4 addendum to research/RESEARCH.md

Lane A1, 2026-11-14; **consistency pass 2026-11-14 (post-triage, post-landings)**.
**Draft only — the orchestrator typesets and decides; everything
marked PROPOSAL is mine and may be overridden.** Live slot markers after the
consistency pass: **[TRIAGE-DECISION]** (orchestrator's), **[G7b]** (donor-pin axiom
audit, run19 in flight), **[SWEEP]** (Cycle-2 close-out chain). ~~[A5-SEED-TRIAGE]~~ =
RESOLVED 2026-11-14: `novelty/iter4-seed-triage.md` landed and its verdicts are folded
in (top-3 NEW-LEAN with the AFP re-scope on seed 9; seed 6 LIKELY-DEAD folded into
seed 4; seed 11's CAR-half dead, reframed; physlib surface opened seed 13).

## (a) Objective [PROPOSAL]

Continue the discovery-first program over the five corpora (mathlib, tauceti, openai-math,
anthropics, axiommath) plus the Cycle-2-surfaced donors and gaps. The iteration-4 seed
inventory (`feasibility/ITERATION4-SCAN.md` + `feasibility/ITERATION4-SEED-DOSSIERS.md`):

- **AL-3D targets** — AreaLaw2D's frozen 3D statement layer with the donor's own
  provability verdicts (B.2–B.5 bounded, C.1–C.4 fenced open problems; the north star
  `AreaLaw3D` is "not a target" per the donor — the charterable surface is the B-rung
  ladder, and every slot must NAME its B-rung).
- **LP-duality layer** — Lean-ecosystem-scoped (AFP-HAS-LP_DUALITY per A5: Isabelle AFP
  trio + Coq own the theorem class; mathlib `Cone/Basic.lean:37` TODO verified on-pin);
  one mathlib-native layer unlocks 02-core + 74-T3 across cycles — bridge doc
  `feasibility/lp-duality-bridge.md`.
- **ZZV2 λ-gap** — λ-abstract props exist unparameterized beside λ=1-frozen constants;
  the family layer is unclaimed and stack-reusable (42-M4/75); formalization-first
  (Lamzouri owns the informal math).
- **FF continuation** — 71-P2/73-C both landed GREEN (2026-11-14); the follow-ons are
  FF-EZ2 survivor (with seed-6's folded survivors: multiplicity-aware counts,
  uniform-in-family bounds, s-plane-strip counts), FF-EZ4 (G6b tauceti bridge), and the
  73-Q4 `hRat` gate (carried, A2's recommendation owed).
- **physlib surface (NEW corpus note, A5's `novelty/physlib-surface.md`)** —
  leanprover-community/physlib (HEPLean's successor; v4.35.0, one minor behind our pin =
  DZDF-class statement-binder consumption gap): ONE mature wing (perturbative QFT,
  `ExchangeSign` cocycle + sign-aware Wick stack), NO CAR/CCR relation layer — sharpest
  opening = the occupation-pair bridge (seed 13). **Name-collision trap: THREE distinct
  "Physlib"s** — the physlib repo; AreaLaw2D's vendored dependency package of the same
  name (G5a's `a50684a1` boundary); the "PhysLean" precedent name. Never conflate.
- **Tracker DO-NOT-CONSUME posture** [PROPOSAL, from A5's audit]: QuasiRiemannTracker is
  a CLOCK, not a donor — re-check per A5's §9.5 clock protocol (the static-assets curl
  recipe, cross-referenced as SCAN §3.9), date every QR-D artifact claim against it and
  the Liu-2 clock, but never consume tracker entries as results or cite them as donation
  sources; the Dirichlet-class formal frontier is other people's moving artifact
  (0.8733458561, Bebel, at audit).
- **Carried-over state (post-2026-11-14 landings)** — 42-M4b-upgrade COMPLETE (primary
  route GREEN, donor-tree axcheck dry-run verified); 71-P2, 73-C, 11-M2, 10-L2, 72-C-neg
  all FINAL-GREEN; **75 pulled INTO Cycle 2 and EXECUTING** (lane A4, the final C2
  pilot); 50-M2-R1 pre-staged awaiting **[G7b]** (R3 Liu-1 binder CLEAN as fallback);
  73-Q4 carried with A2's recommendation owed; 22-T2a (small, well-scoped); the
  10-completion thread is next-tranche assembly only (L1+L2+M1 all landed).
- **Main-run cold inventory** — 41/12/31/60/40/30-remainder (SCAN §1b) compete for slots.

## (b) Phase mapping — what is pre-done (fresh run starts at hardening + triage)

| Phase | Pre-done by | Residual work |
|---|---|---|
| 1 (survey) | Main-run surveys (4 corpora, QA'd) + Cycle-2 axiommath surveys (`survey/axiommath*.md`, spotchecked) + terminal-points/donor-gap sections + **A5's physlib surface map (`novelty/physlib-surface.md`)** | none mandatory; refresh ONLY where a donor moved (clocks: Liu-2, tracker, WenrongZou, upstream PNT+, physlib `FieldStatistics/`+`WickContraction/Sign/`+`WickAlgebra/`) |
| 2 (bridges) | `bridges/function-field.md`, `bridges/area-law.md` (Cycle 2) + main-run bridge maps; SCAN §2 = the cross-corpus seed list (13 seeds, donor-cited, triage-annotated) | DONE for LP: `feasibility/lp-duality-bridge.md` (mini-bridge written 2026-11-14); tauceti within-corpus zones / physlib occupation-pair need their own rounds if chartered |
| 3 (dossiers) | 3 pre-dossiers (`ITERATION4-SEED-DOSSIERS.md`) with statement sketches, why-new pre-checks, exact donor maps, feasibility classes, risks — all triage-folded | **dossier hardening**: full Phase-3 form (precise statements, COMPLETE novelty verification — the [NOVELTY-CHECK-NEEDED] marks are obligations, not decorations — proof-strategy sketches) |
| 4 (triage) | score inputs pre-assembled (scan's N×S÷E arithmetic, sensitivity lines) + **A5's seed triage LANDED** (`novelty/iter4-seed-triage.md`: 6 NEW-LEAN / 2 POSSIBLY-KNOWN / 4 DONOR-INFRA; AFP verdict folded) | rank + slot once Cycle-2 pilot outcomes settle **[TRIAGE-DECISION]** — the seed-novelty input is no longer pending |

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

## (d) Proposed pilot slots with gates [PROPOSAL — live gates: [TRIAGE-DECISION] only; [A5-SEED-TRIAGE] resolved 2026-11-14]

| Slot | Content | Gate / sensitivity |
|---|---|---|
| 1 | LP-duality layer + first consumer (02-core shape; 74-T3 optional second) | **NEW-LEAN, Lean-ecosystem scope only** ("do it FIRST"): unclaimed in the **Lean ecosystem** — Isabelle (AFP trio `LP_Duality`/`Linear_Programming`/`Farkas`, maintained through Isabelle2026) and Coq (Allamigeon–Katz 1706.10269, 2017) own the theorem class and are **mandatory nearest-miss citations**; the slot's value is the **mathlib-native layer + the two in-repo consumers**, not theorem-class priority (never-phrase list applies). Bridge doc: `feasibility/lp-duality-bridge.md`; rises if 72-M1 lands (C.3 consumer warm); residual clock = mathlib PRs in flight |
| 2 | AL-3D B-rung — **B.2 (`SlabAreaLaw3D`) staged (prework `pilots/al-3d-prework.md`, A2); B.3 (`PositiveReplacement3D`) alternative — decided at launch** | **NEW-LEAN, "cleanest of the set"; pre-charter gate PASSED** (A5: OAI265 tex 0 hits for 3D/cylinder; PEPS "cylinder" = Hilbert-patch only; no 3D ComparatorChallenge). **Caveat (A5, charter-shaping): the charterable surface is the B.2–B.5 ladder — the slot must NAME its B-rung (AL-P0 statement stage serves either rung identically); the north star `AreaLaw3D` is "not a target" (obstructions C.1–C.4), and any AreaLaw3D-adjacent claim must cite which obstruction it resolves.** Decays if the donor/third party lands B-rungs first (challenge-repo clock) |
| 3 | ZZV2 λ-family route (a) (continuity/glue) | **FORMALIZATION-FIRST** — Lamzouri's proportions are λ-parametric informally (the λ-dependence IS the paper's content), so the informal math is known and must-cited in full; the novelty claim is the Lean λ-layer artifact only, never new-math (label like dossier 73's "math is 25 years old"). Strengthened: 42-M4b-upgrade COMPLETE (same V2 stack); multiplies with 75's assembly |
| carried | 50-M2-R1 | pre-staged, awaiting **[G7b]** (run19 in flight); R3 Liu-1 binder fallback CLEAN now |
| carried | 73-Q4 `hRat` discharge | 73-C LANDED GREEN; Q4 carried as a separate gate — A2's recommendation owed |
| ~~pulled into C2~~ | 75 | **NOT an iteration-4 slot** — pulled INTO Cycle 2, EXECUTING as the final C2 pilot (lane A4, P-a then C1, final-or-declared-drop) |
| ~~done~~ | 42-M4b-upgrade | COMPLETE — primary route GREEN (m4b2-run2) + donor-tree axcheck dry-run verified (`feasibility/probe/logs/m4b-donor-axcheck-dryrun.log`) |
| carried | **75 continuation** (P-b 5/6 strip-distinct arm + N2/N3 remainder; entry (P-a)+C1 GREEN in C2; design input: `pilots/75/Pb-design.md`, A4) | design already priced — fold at **[TRIAGE-DECISION]**, don't rediscover |
| carried | 22-T2a | small task-slot, upstream PNT+ statement as binder |
| carried | 10-completion thread | L1+L2+M1 all FINAL — remaining value is next-tranche assembly only, not a slot of its own |
| watch | FF-EZ2 survivor (incl. seed-6 folded survivors: multiplicity-aware counts, uniform-in-family bounds, s-plane-strip counts) / FF-EZ4 / AL-EZ1 P2-probe / physlib occupation-pair bridge (seed 13 — differentiate from article 52 AND physlib `WickContraction/Sign/`; re-check `FieldStatistics/`+`WickAlgebra/`) | rank at **[TRIAGE-DECISION]**; FF-EZ5 standalone DEAD (Faifman–Rudnick, folded into FF-EZ2); seed-11 CAR-half DEAD (physlib ExchangeSign) — per-pair batteries before any tauceti-zone charter |

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
