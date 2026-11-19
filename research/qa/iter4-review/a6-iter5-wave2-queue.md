# R8 — Iteration-5 WAVE-2 QUEUE (charter-row consolidation; what fires AFTER the day-1 trio)

Lane R8 (A4 lineage), worktree agent-05, wave 4, 2026-11-19. Basis: main @ `e3d984b`
(read-side; H forwards this worktree to it). This file is the consolidated wave-2
candidate queue the typeset charter's wave-2 section draws from — one verdict line per
candidate (CHARTER-WAVE-2 / DEFER / DRAIN-ACTIVATION / DISCHARGED / SHARED), payload
path (every path cross-checked on `e3d984b`, §4), budget, first kernel-checkable
milestone, dependencies. Day-1 trio context (NOT queued here — R4/R5/R6 own the fire
files): 41-P0 (`pilots/41/P0.lean`), η-pin-probe (`pilots/zzv2-lam/eta-pin-probe.lean`),
N2-P2 run 22 (resume note `pilots/75/N2-P1-record.md:139–150`). Charter Leads 1–4
(N2 / 41 / η-port / FB-5-77) are wave-1 structure and are not re-queued; only Lead-4's
billing context is noted (§5). H commits; hold-all-commits until K lands.

Global gate (applies to every row): the iteration-5 charter typeset (from
`qa/iter4-review/a6-iter5-charter-draft.md` §8) + close-completion commit K precede any
wave-2 firing. No row below is lane-ready before that, by construction.

## 1. The queue (verdict rows)

| # | candidate | verdict | payload (verified @ e3d984b) | budget | first kernel-checkable milestone | dependencies / blocker |
|---|---|---|---|---|---|---|
| W2-1 | **74-P2** sharp constants + class-level tightness (FIND-#1 family recycled constructively; verify-fire discipline binding) | **CHARTER-WAVE-2** (engineering; discovery-shaped per DECISION-1 note — not a quota occupant unless the orchestrator rules otherwise) | `research/pilots/74/P2-precharter.md` (+ GREEN base `research/pilots/74/74-P1-record.md`, 7/7 triad) | G1 zero-run; G2 ≤5 (P2-a/b, expected 3–4); G3 1-run statement probe; P2-c ≤5 (expected 4–5), separate milestone so P2-a/b GREEN banks independently | G2 run 1: `mgfBound_var_sharp` (P2-a, the sharp `Var ≤ 2σ²` limit argument) first elaboration; the G3 n-atom class-membership Prop probe precedes any P2-c proof investment | G1 route decision (deriv-family vs pair-ε — read-only API pin, no runs); runner warm (`crossmath-pilot-74p1`, run-5 wall 30 s); verify-fire discipline binding (P1-completion pattern: fix-batch → verify-applied → fire, pre-run sha guard) |
| W2-2 | **AL-P2 find-#5 canonical z-rank rebuild** (M0–M3; the un-park of P2-d/e) | **CHARTER-WAVE-2** (engineering; the designated iteration-5 AL route — supersedes B.3 as the active rung) | `research/pilots/al3d/rebuild-precharter.md` (lineage `A2-gaps.md` §4(b)/§5; baseline run-13 sha `509f2368`) | 12–18 runs ≈ 3–4 lane-sessions (M0 3–4 / M1 2–3 / M2 3–5 / M3 4–6) | M0: new canonical core (rank/`orderIsoOfFin` congruence class) + moved bodies, P0→A1→A2 regression re-verified with P2-b/P2-c statements UNCHANGED (run-13 full-coverage triad audit reproduces) | none hard — the wave-3 hold ("behind AL-P2 c/d/e outcome") is RESOLVED (P2-c 100% GREEN runs 9–13; find #5 parked at P2-d); named risks: `orderIsoOfFin`-congruence proof shape (M0), P2-e partial-trace commutation (M3); warm `crossmath-pilot-al3d` |
| W2-3 | **10-D4 M-arc assembly w/ hv** (closes the dossier-10 machine layer) | **CHARTER-WAVE-2** (engineering completion; never discovery billing — D-charter/M-arc separation ruling) | `research/pilots/10/D3-record.md:31–37` + the adjudicated two-true-forms amendment `research/pilots/10/D1-record.md:42–45` | ~120 LoC + the hv decision; 1–3 warm runs | `exists_tm_padded_space` under the value-poly binder `hv : ∃ k, ∀ x, e x ≤ (|x|+2)^k` (all D4 inputs GREEN per D3-record) | **BLOCKED-ON: the hv supply-vs-derive decision** (charter-owner/DECISION-shaped — "the M-arc scope decision is the charter owner's", D3-record:35); zero-run prep possible before it |
| W2-4 | **72-M1 L3b–d + the interface theorem** | **CHARTER-WAVE-2** (engineering completion; the G7-retarget site `L3-spec:187`) | `research/pilots/72-M1/L3-spec.md` (§7 budget) | ≤8 runs with enforced error descent (run-5→8 discipline) | L3b first elaboration (the hermPart-block continuation off the GREEN L3a, `logs/m1-run8-GREEN.log`) | none hard (carried list in-spec); warm `crossmath-probe`-family runner |
| W2-5 | **Liu B_new statement-level port** (the never-fired "named cheap item"; B♭/B_new 0.8749570 now beats the in-corpus 7/8 donor by ≈0.0001) | **CHARTER-WAVE-2** (cheap engineering-plus strip upgrade) | `research/RESEARCH.md:143–146` + `research/novelty/iter4-external-priorart.md:208–211`; pattern `research/pilots/50-M2-31-32-spec.md` §3 | 1–2 warm runs, <250 LoC binder artifact | the B_new statement-binder artifact elaborating on-pin (Liu-1 convention: statement-level citation ONLY, DO-NOT-CONSUME as build dep, `novelty/liu1-as-donor.md` §5) | none hard; warm probe class |
| W2-6 | **12-P0** parametric savings (bench #2) | **DRAIN-ACTIVATION** (DECISION-6 ruling 2026-11-19: stays drain-activation; conversion condition = **idle lane + dry queue**) | `research/pilots/12/preflight.md:94–106` | P0 1–2 warm runs, then core S–M per preflight | P0 (P0-first MANDATORY; the termPrime/monotonicity check rides the P0) | the idle-lane condition itself (12 stays behind 41 while 41's lane lives) |
| W2-7 | **11-M3** (CH20∘VW13) | **DRAIN-ACTIVATION** (DECISION-6, same condition) | `research/pilots/11/` (T1–T3 landed main-run; M3 untouched) + the Fischer arXiv:2610.32162 cite-consumable at pilot time (bench-audit flag 3) | per M3 sizing at conversion time | M3 statement set first elaboration | idle-lane condition; add the Fischer cite when piloted |
| W2-8 | **FB-2 PNT-AP explicit-L** | **DEFER** (DECISION-1 contest: FB-2 vs FB-4 vs unspent; default **spend-only-if-executed**) | `research/RESEARCH.md:150–160` + `research/qa/iter4-review/r2-discovery-strength.md:750` | L-grade explicit-formula build (R6's deciding rg) | n/a until chartered | **BLOCKED-ON: DECISION-1 ruling**; if chartered, T2 FIRES (PNT+ REGISTER-AND-PORT) — the G9 preflight leg is already discharged (GREEN runs 36/37, 2026-11-17), so T2's marginal cost is the port itself |
| W2-9 | **FB-4 FF-PNT** | **DEFER** (same contest; M-effort formalization-first technical record; "must not consume a discovery slot") | `research/qa/iter4-review/r2-discovery-strength.md:752` + seed `research/novelty/iter4-fresh-bridges.md` §3 FB-4 | M-effort on the 71/73 FF substrate | n/a until chartered | **BLOCKED-ON: DECISION-1 ruling**; natural second consumer of the warm FF zone |

### Shared / not queued

- **50-M2-R2 binder fold — SHARED, not queued**: resolves inside the N2 lane's (d1)
  staging decision (`r5-iteration4-backlog.md` §1b :119; charter-draft §2 Lead 1 line
  "(d1) staging shared"). Firing it separately would duplicate the N2 lane's own
  milestone chain.
- **FB-5/77 continuation** (T1-completion + T2 as ONE follow-up pilot, residual census =
  work list, `pilots/77/T1-record.md` §T2-readiness): charter **Lead 4** — wave-1
  structure, wave-2 only if the orchestrator re-slots it; its four binding conditions
  (`candidates/77-car-occupation-dictionary-laughlin.md:331–341`) incl. the C+ cap and
  the re-run of T1's differentiation against physlib's new WickAlgebra layer (§8.3).
- **AL-3D B.3 — DEFER**: held behind the W2-2 rebuild outcome + the challenge-repo
  clock (charter-draft §2 wave-tail); W2-2 supersedes B.3's 6.3k-LoC transcription
  pricing as the active AL route.
- **NS-2 MatchingPSD — HOLD on bench** (LP-layer follow-on note, not a slot);
  **NS-3 — rides BEHIND the S13 pilot**; **S13 pilot — watch row** whose
  differentiation gates (52 + Wick stack) must re-run against the new WickAlgebra
  layer before any charter (§8.3 of the charter draft; `novelty/physlib-surface.md`
  §2/§6 wing data stale again).

## 2. r5 backlog §14 triage — the 12 STAGED-NO-RUN rows: ALL DISCHARGED (superseded by execution in iteration 4)

Every §14 row fired during iteration 4; none carries into the wave-2 queue. Evidence:

| §14 row | outcome | evidence @ e3d984b |
|---|---|---|
| 1 LP-P0 | FIRED GREEN | `pilots/lp/logs/lp-p0-run{1..4}.log` |
| 2 75-Pb run 1 | FIRED (day-1 top-billed, A3-pattern lane) | article 75 + §10.4 tables (`93b9500`) |
| 3 AL-P0 | FIRED GREEN (468 LoC, find-#4 amendment landed later) | `pilots/al3d/P0.lean` + INDEX fold |
| 4 LP-P1 | FIRED GREEN | `pilots/lp/logs/lp-l1-run{1,2}.log` |
| 5 75-Pb runs 2–5 | FIRED (article-75 v2 landed) | §10.4/10.5 + README rows (`9fece16`) |
| 6 72-M1 L3a | FIRED GREEN | `pilots/72-M1/logs/m1-run8-GREEN.log` (residual L3b–d = W2-4) |
| 7 AL-P1 | FIRED GREEN (22/22) | `pilots/al3d/A1.lean` |
| 8 hEχ donor-pin build + Theorem-E audit | EXECUTED GREEN (donor gate PASS; Pb print-gap remediation routed) | §10.4/10.5 tables + `pilots/zeta23e/logs/` |
| 9 ZZV2-λ P0 | FIRED (P0(a)/(b)/(c) pinned; P1 landed; P2 = the η-port, iter-5 day-1) | `pilots/zzv2-lam/P0-record.md`, `P1-record.md:75–90` |
| 10 G9 StrongPNT binder probe | FIRED GREEN 2026-11-17 (runs 36/37, orchestrator-approved) — antecedent 22-T2a never chartered; the conditional is moot | `qa/iter4-review/a8-22t2a-g9-recommendation.md:48`; probe `research/feasibility/probe/ProbeG9_StrongPNT.lean` |
| 11 LP-P2 consumer | FIRED GREEN (`bw2_ceiling_of_dual` triad) | `pilots/lp/logs/lp-l2-run6.log:12–62` |
| 12 32-crossing discharge | FIRED GREEN 2026-11-17 (7 forms triad; article-32 §5 v2 edit routed) | `pilots/32/logs/run12-crossing-existence.log` + `run12-discharge-note.md` |

**Residual riders out of §14 (flagged, not queued):**
- **74-T3 second-consumer gate** (§9's pending decision "charter names it or not"):
  the LP layer landed GREEN, so the gate is now cheap to exercise — but NO row owns it
  (P2-precharter keeps T3 unchartered, dossier-02 cost-share). Orchestrator call at
  typeset: name it (a W2-4-adjacent filler), or leave unchartered.
- The §14 warm-cache ordering note's two stale wrappers
  (`pilots/32/run_pilot.sh:15–16`, `research/feasibility/probe/run_probe.sh:15–16`)
  — the 32 one was resolved in-run (run12 note §5); both stay patch-optional since no
  wave-2 row uses them.

## 3. Sequencing proposal (post-day-1 firing order; discovery-grade first, warm-substrate first, dependency chains respected)

1. **W2-1 74-P2** — G1 (zero-run) at wave-2 open; G2 run 1 as wave-2's FIRST Modal run.
   Rationale: warmest substrate of the queue (30 s walls), bankable GREEN at P2-a/b
   independent of the P2-c risk, and the queue's highest discovery-shaped content
   (P2-c class-level tightness = FIND #1 used constructively) sits behind its own G3
   gate exactly as precharter §(d) orders it.
2. **W2-2 AL-rebuild M0** — may interleave with W2-1 fix-rounds (different app + stage
   dir, no substrate contention); M0's regression gate is the dependency root for
   M1–M3, so start it early. (This is the expected R8 re-task.)
3. **W2-3 10-D4** — fires as soon as the hv decision lands at typeset (DECISION-shaped
   slot); 1–3 runs, warm.
4. **W2-4 72-M1 L3b–d** — any lane, ≤8-run descent; independent of rows 1–3.
5. **W2-5 Liu B_new** — cheap filler (1–2 runs); pairs naturally with any drain window.
6. **W2-6 / W2-7 (12-P0, 11-M3)** — drain-activation ONLY on idle lane + dry queue
   (DECISION-6); 12 stays behind 41.
7. **W2-8 / W2-9 (FB-2, FB-4)** — no firing order: they exist only inside the
   DECISION-1 contest; default spend-only-if-executed (an again-unspent quota is a
   healthy outcome, iteration-4 precedent).

**Lane-ready TODAY** (blocked only by the global charter-typeset gate): W2-1, W2-2,
W2-4, W2-5. **Blocked-on (named)**: W2-3 → the hv supply-vs-derive decision;
W2-6/W2-7 → idle-lane + dry-queue condition (DECISION-6); W2-8/W2-9 → DECISION-1
ruling. **Dependency chains**: W2-2 M0 → M1 → M2 → M3 (milestone-gated, honest park at
any gate keeps earlier GREEN); W2-1 G1 → G2 → G3 → P2-c; AL-B.3 behind W2-2's outcome;
50-M2-R2 rides the N2 lane, not this queue.

## 4. Payload path cross-check (all against `git cat-file -e e3d984b:<path>`)

Verified OK on e3d984b: `research/pilots/al3d/rebuild-precharter.md`;
`research/pilots/al3d/A2-gaps.md`; `research/pilots/74/P2-precharter.md`;
`research/pilots/74/74-P1-record.md`; `research/pilots/10/D3-record.md`;
`research/pilots/10/D1-record.md`; `research/pilots/72-M1/L3-spec.md`;
`research/pilots/12/preflight.md`; `research/pilots/11/` (T1–T3);
`research/pilots/zzv2-lam/{eta-port-precharter.md,eta-pin-probe.lean,P0-record.md,P1-record.md}`;
`research/pilots/41/P0.lean`; `research/qa/iter4-review/a6-41-p0-precharter.md`;
`research/pilots/75/N2-P1-record.md`; `research/pilots/50-M2-31-32-spec.md`;
`research/novelty/iter4-external-priorart.md`; `research/novelty/liu1-as-donor.md`;
`research/novelty/iter4-fresh-bridges.md`; `research/candidates/77-car-occupation-dictionary-laughlin.md`;
`research/RESEARCH.md`; `research/REPORT.md`; `research/qa/iter4-review/r2-discovery-strength.md`;
`research/qa/iter4-review/a6-iter5-charter-draft.md`; `research/qa/iter4-review/a6-iter5-charter-candidate.md`;
`research/qa/iter4-review/r5-iteration4-backlog.md`; `research/qa/iter4-review/a2-g7-token-inventory.md`;
`research/qa/iter4-review/a8-22t2a-g9-recommendation.md`; `research/pilots/77/T1-record.md`;
`research/pilots/32/run12-discharge-note.md`; `research/feasibility/probe/ProbeG9_StrongPNT.lean`.

Flagged (not stale, but note for the typeset pass):
- **`research/qa/iter4-review/h-wave4-log.md` — NOT on main @ e3d984b** (H's in-flight
  wave-4 manifest; expected this session — do not cite as landed until H commits).
- Within-74 prose cites "74-P1-record.md"; the path is
  `research/pilots/74/74-P1-record.md` (74- prefix). AGENTS.md's bare `feasibility/…`
  shorthand = `research/feasibility/…` on disk.
- Charter-draft §8.2 cites `pilots/74/P2-precharter.md` etc. without the `research/`
  prefix throughout — same shorthand convention, resolves cleanly.

## 5. Residual flags for the orchestrator (beyond the rows)

1. **74-T3 second-consumer decision unowned** (§2 rider above) — the one live leftover
   of §14/§9; needs a named owner or an explicit leave-unchartered at typeset.
2. **DECISION-1 stays open** (FB-2 vs FB-4 vs unspent); this queue changes nothing —
   W2-8/W2-9 are inert unless ruled into execution.
3. **DECISION-4 (41's (H) phase) interacts with drain rows**: if (H) gets its own
   slot/milestone budget, the 41 lane occupies through wave-2 and 12-P0's idle-lane
   condition recedes; if (H) stays wave-tail, the drain window widens. Sequencing §3
   assumes nothing — both drain rows key on the live condition, not on DECISION-4.
4. **G7-retarget residue** (5 sites, charter-draft §4.1): W2-4's charter line resolves
   the `L3-spec:187` site; the other four ride the clock rows, not this queue.

— lane R8 (worktree agent-05), 2026-11-19. Sources: a6-iter5-charter-draft.md (§2/§4/
§6/§8.2/§8.5), a6-iter5-charter-candidate.md (§0/§4/§5/§5a), r5-iteration4-backlog.md
(§1b/§9/§11/§14/§15), 74/P2-precharter.md, al3d/rebuild-precharter.md,
10/D3-record.md + D1-record.md, 72-M1/L3-spec.md, RESUME-BRIEF-ITER4.md §SESSION END
wave-3 wrap, run12-discharge-note.md, a8-22t2a-g9-recommendation.md. No Modal runs;
no main-checkout writes; commits held for H (post-K).

## 6. ORCHESTRATOR RULINGS 2026-11-19 (appended same day, pre-M0; supersede the rows cited)

- **(A) W2-3 hv = SUPPLIED-AS-BINDER.** The 10-D4 M-arc assembly consumes the
  value-poly hypothesis as an explicit binder `hv : ∃ k, ∀ x, e x ≤ (|x|+2)^k` — the
  EnclOK hypothesis-binder precedent governs (donor statements as explicit Prop
  binders; same convention as `hQRH`/`Hypζ`/`HostTransport`). The Solver-side
  derivation of `hv` (where `e` is value-polynomial by construction) is a FOLLOW-UP
  DESCOPE NOTE ONLY — never a charter branch. Effect on W2-3: the row's
  "BLOCKED-ON: the hv supply-vs-derive decision" is RESOLVED — D4 is lane-ready at
  typeset with the binder form; R3's M-arc typeset consumes this ruling now
  (`D1-record.md:42–45` Part-E conditional form is the statement to assemble against).
- **(B) 74-T3 second consumer = LEAVE-UNCHARTERED at iter-5 open.** The §2 residual
  rider (unowned LP-layer second-consumer gate) is ruled: no charter line at open.
  74-T3 becomes a WATCH ITEM that competes with 12-P0 for the DECISION-6 mid-wave
  conversion slot under the same condition (idle lane + dry queue); it does not
  displace any W2 row and carries no owner until converted.

— rulings relayed by the orchestrator to R8, recorded 2026-11-19 before the AL-rebuild
M0 execution (same lane, same file, append-only).
