# ITERATION4-CHARTER-SPLICE — the §Iteration 4 block for research/RESEARCH.md (DRAFT FOR REVIEW)

Lane A1, 2026-11-14. **Draft only — the orchestrator reviews, fills the [DATE]/[SUBTITLE]
slots, and typesets; the text below is written in RESEARCH.md's register, mirroring how
§Cycle 2 reads.** The three live gates stay bracketed: **[TRIAGE-DECISION]** resolves when
the orchestrator typesets the final slot list; **[G7b]** resolves when run19's donor-pin
axiom audit lands; **[SWEEP]** resolves at Cycle-2 close (predecessor of this launch).
Branch mechanics + launch-day checklist follow the splice text (not part of it).

---

## SPLICE TEXT (append at the end of research/RESEARCH.md)

## Iteration 4 (opened [DATE], orchestrator) — [SUBTITLE: proposal = "the LP-duality layer, the 3D area-law ladder, and bridges outward"]

Cycle 2 closed [DATE] ([one-line close summary; TRIAGE §decision typeset; REPORT §C2
filled; AGENTS-C2-DRAFT applied]). Iteration 4 continues the discovery-first program over
the five corpora (mathlib, tauceti, openai-math, anthropics, axiommath) plus the
Cycle-2-surfaced donors and gaps. The seed inventory is pre-assembled —
`feasibility/ITERATION4-SCAN.md` (13 triage-annotated seeds, carried-over tables,
substrate notes) and `feasibility/ITERATION4-SEED-DOSSIERS.md` (3 pre-dossiers) — with
A5's triage verdicts folded (`novelty/iter4-seed-triage.md`) and the physlib surface
mapped (`novelty/physlib-surface.md`).

Phase mapping: Phases 1–2 are pre-done (surveys + bridge maps + the seed list; the LP
mini-bridge `feasibility/lp-duality-bridge.md` is written) and Phase 3 is pre-done at
pre-dossier level — the fresh run STARTS at dossier hardening (full Phase-3 form; the
[NOVELTY-CHECK-NEEDED] marks are obligations) and Phase-4 triage. Pilot slots, all
[TRIAGE-DECISION] until typeset: (1) the LP-duality layer + first consumer — NEW-LEAN in
the **Lean ecosystem only** (Isabelle AFP `LP_Duality`/`Linear_Programming`/`Farkas` +
Coq 1706.10269 own the theorem class and are mandatory nearest-miss citations; mathlib
`Analysis/Convex/Cone/Basic.lean:37` TODO verified on our pin; never "first formal /
unformalized" phrasings); (2) an AL-3D B-rung (statement port + `PositiveReplacement3D`
or a named higher rung — the north star `AreaLaw3D` is "not a target"; every slot NAMES
its B-rung; every AreaLaw3D-adjacent claim cites the obstruction C.1–C.4 it resolves);
(3) the ZZV2 λ-family (formalization-first: Lamzouri owns the informal math, must-cited
in full; the artifact is the Lean λ-layer). Carried: 50-M2-R1 pre-staged awaiting
**[G7b]** (R3 Liu-1 binder fallback CLEAN); 73-Q4 `hRat` (A2 recommendation owed);
22-T2a (small, upstream PNT+ binder); the main-run cold inventory (41/12/31/60/40/30)
competes throughout. Watch: FF-EZ2 survivor (FF-EZ5 folded in — Faifman–Rudnick), FF-EZ4,
AL-EZ1 P2-probe, the physlib occupation-pair bridge (seed 13; differentiate from article
52 AND physlib `WickContraction/Sign/`; the three-"Physlib"s name-collision trap).
QuasiRiemannTracker is a CLOCK, not a donor (A5 §9.5 protocol; DO-NOT-CONSUME).

Lane topology and protocols carry over from Cycle 2 unchanged (10 lanes A1–A9 + H,
one-writer-per-file, queue-loaded re-tasks, H-commit cadence + concurrency probe —
see `feasibility/ITERATION4-CHARTER-DRAFT.md` §c). Ground rules carried verbatim:
discovery-first, kernel-only (no sorry, no native_decide, no external CAS), siblings
read-only, exact citations for every claim; donor statements enter only as hypothesis
binders, verbatim marked probe copies, or already-built on-pin libraries; logs persisted
with provenance headers. Substrate: `feasibility/ITERATION4-SCAN.md` §3 (doz Modal
pattern, artifact-cache retry protocol, axcheck lessons — sibling-import rewrite,
donor-tree axcheck pattern for built-donor consumers, v4.36 backtick sorry-warning filter
caveat: axcheck is the reliable detector — and the standing clock protocols).

---

## BRANCH MECHANICS (H's plan — not part of the splice)

Cut `dev/iteration4` from the Cycle-2 close commit (the [SWEEP]-resolving commit, i.e.
after ledger §9 fills, TRIAGE §decision, REPORT §C2, AGENTS-C2-DRAFT applied, STATUS
cycle-close block): launch-day work happens on the branch, first merge to main at the
orchestrator's discretion.

## LAUNCH-DAY CHECKLIST (the fresh run's first turn)

1. **Charter splice**: orchestrator appends the SPLICE TEXT above to `research/RESEARCH.md`
   (fill [DATE]/[SUBTITLE]/close-summary; resolve [TRIAGE-DECISION] into the final slot
   list; [G7b] must have resolved or the 50-M2-R1 row stays gated), on `dev/iteration4`.
2. **Lane spawn one-by-one per protocol**: spawn lanes sequentially (A1 → A5 → A9 first —
   feasibility upkeep, novelty batteries, dossier records — then the pilot lanes as slots
   resolve), H last; concurrency probe (`ps -eo comm --no-headers | grep -cx zcode-cli`)
   at each batch close; steady ≈ lanes+1 expected.
3. **Queue-loaded re-tasks** (AGENT_INSTRUCTION pattern): every lane gets a 2–3 item work
   queue at spawn; lanes work bottom-up and return only when drained or at a decision
   point; re-task before prose.
4. **H commits** the launch commit (charter splice + ITERATION4-* kit files) on the branch.

— end splice kit (A1). HOLD: awaiting the all-final signal (surface: 75, 72-M1, G-series,
formal reports); on signal → Steps B–C only (Step A already incremental-complete, 43-token
baseline certified).
