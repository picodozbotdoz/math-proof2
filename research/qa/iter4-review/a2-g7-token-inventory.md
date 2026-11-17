# A2 — G7 token-disposition inventory (Iteration-4 close-out decision input)

Lane A2, 2026-11-17 (reading + scoped greps only, no Modal). Scope: the live annotation
families the G7 close-out must account for — `[TRIAGE-DECISION]`, `[A5-triage-pending]`,
`[NOVELTY-CHECK-NEEDED]`, `[CHARTER-PENDING]`, `[DEFER-watchlist]` — plus the
supersession-stamp precheck on the four staging files. Convention per
`RESUME-BRIEF-ITER4.md` §(e): the [TRIAGE-DECISION] annotation family is OPEN BY DESIGN
until the orchestrator typesets/closes the charter — this inventory is the decision
input for that close. Historical record-mentions (STATUS.md, REPORT-INPUTS-C2.md,
RESUME-BRIEF-*.md, closeout-gate-run-C2, debts-register pointers, r9-draft quotations,
INDEX descriptions — ~20 sites) are NOT live tokens; they are ledger pointers H updates
mechanically at close and are excluded from the counts below.

## 1. Token census and dispositions

### [TRIAGE-DECISION] — 19 live sites: **19 CLOSES-THIS-CYCLE, 0 RETARGET, 0 NEEDS-RULING**

Event-closed (14) — the conditioned decision is consumed by landed outcomes:

| site | annotates | closing event |
|---|---|---|
| `feasibility/ITERATION4-SCAN.md:18` | upgraded-42 vs 75 wave-4 share the GREEN stack | 75-Pb FINAL-GREEN (`pilots/75/logs/pb-run11-final.log`); 42-M4 landed Cycle 2 — sequencing consumed by the charter slot ledger |
| `SCAN.md:19` | 50-M2 R1-vs-R3 route choice | CLOSED IN CYCLE 2: G7b PASS (run32) + R1 GREEN — `TRIAGE.md:319` RESOLVED 2026-11-14; staging text now stale, superseded at stamp |
| `SCAN.md:20` | 73-Q4 opens/closes the Tate-dictionary's provable-on-our-pin depth | **Q4 GREEN 2026-11-17** (`pilots/73/logs/q4-run15-green.log` + §10.7 table + `pilots/73/Q4-upgrade-note.md`) |
| `SCAN.md:21` | 75 wave-4 slotting vs 42-upgrade sequencing | 75-Pb FINAL-GREEN (ledger row) |
| `SCAN.md:22` | FF follow-ons rank only after 71-P2/73-C | 71-P2 GREEN + 73-C GREEN (Cycle-2 relay, ledger §8/§9); FF-EZ2 since chartered, in flight |
| `SCAN.md:23` | AL-zone sequencing rides 72-M1/C-neg | C-neg GREEN + 72-M1 L3a GREEN + AL-P2 m1 GREEN (`r3-verification-tables.md` §10.6) |
| `SCAN.md:40` | §1b cold inventory vs §2 seeds compete for slots | bench preflights landed (`pilots/{41,12}/preflight.md`, 2026-11-17) + orchestrator rulings recorded (41 CHARTER iter-5 opener; 12 DEFER behind it); rest of 1b benched with reasons (backlog §4 item 9) |
| `SCAN.md:90` | FF-EZ2 survivor rank | FF-EZ2 chartered and in flight (L3 lane; waited-on L6 battery + debt g discharged per its activation) |
| `feasibility/ITERATION4-SEED-DOSSIERS.md:110` | seed-1(AL) rises if 72-M1/C-neg land green; falls behind FF if 71-P2/73-C land first | both conditionals resolved (all four GREEN); the seed was consumed by the chartered AL-3D pilot (P0/P1/P2-m1 landed) |
| `SEED-DOSSIERS.md:179` | seed-2(LP) rises sharply if 72-M1 Tier-C lands (C.3 consumer) | LP chartered + slot 1 FINAL-GREEN end-to-end (ledger; `r3-verification-tables.md` §10.1–10.2) |
| `SEED-DOSSIERS.md:232` | seed-3(ZZV2) strengthens if 42-M4b-upgrade lands; multiplies with 75 wave-4 | ZZV2-λ chartered (slot-3 KEEP resolved at typeset; §12 spec + P0 staged, backlog §14 run 9) |
| `feasibility/ITERATION4-CHARTER-DRAFT.md:94` | 75 continuation folds at [TRIAGE-DECISION] | 75-Pb FINAL-GREEN; fold made |
| `CHARTER-DRAFT.md:97` | watch-list ranks at [TRIAGE-DECISION] | FF-EZ2 chartered (in flight); physlib probe done (G13); remaining watch pairs carry via L6 batteries |
| `feasibility/ITERATION4-CHARTER-SPLICE.md:29` | slots stay [TRIAGE-DECISION] until typeset (LP layer + first consumer named) | charter typeset; LP-1/LP-2 FINAL-GREEN |

Close-act-closed (5) — resolved BY the close itself (owner: orchestrator/H per the
splice's own instruction):

| site | annotates | closing act |
|---|---|---|
| `CHARTER-DRAFT.md:6` + `:83` | the live-gates header (family definition; [A5-SEED-TRIAGE] already resolved 2026-11-14) | close-summary fill resolves the family definition |
| `CHARTER-SPLICE.md:5` | "three live gates stay bracketed" | same |
| `CHARTER-SPLICE.md:71` | fill [DATE]/[SUBTITLE]/close-summary; resolve [TRIAGE-DECISION] into the final slot ledger | this IS the close-out act |
| `TRIAGE.md:385` + `TRIAGE-C2-ROWS.md:244` (pointer rows, same text) | "slots per CHARTER-DRAFT (all … next-cycle)" | H updates the pointers when the family resolves |

### [A5-triage-pending] — 3 live sites: **3 CLOSES-THIS-CYCLE (already resolved in place)**

All three read `[A5-triage-pending → FOLDED: …]` with A5's verdict inline:
`SEED-DOSSIERS.md:53` (seed 1 AL: NEW-LEAN conditional/glue), `:123` (seed 2 LP: FOLDED,
AFP check RESOLVED 2026-11-14), `:187` (seed 3 ZZV2: NEW-LEAN formalization-first).
Closing event: A5's `novelty/iter4-seed-triage.md` landed 2026-11-14 (charter-draft :59
records the landing). Ledger pointers (`REPORT-INPUTS-C2.md:277`, `debts-register.md:32`)
update at close.

### [NOVELTY-CHECK-NEEDED] — 8 live sites: **5 CLOSES-THIS-CYCLE, 3 RETARGET-ITER-5**

| site | annotates | disposition |
|---|---|---|
| `candidates/76-zero-temperature-schrodinger-duality.md:98` | read `OptimalTransport/Duality/` in full | **CLOSES-THIS-CYCLE** — R7 gate-sweep landed 2026-11-16 (`qa/iter4-review/r7-bib-cards.md` §A; header records "[NOVELTY-CHECK RESOLVED … both rungs clear, grade B → B+") |
| `candidates/76…:107` | check `TruffetCounterexample.lean` companion | **CLOSES-THIS-CYCLE** — same R7 gate-sweep |
| `pilots/lp-layer-prework.md:208` | LP-duality novelty mark | **CLOSES-THIS-CYCLE** — self-resolved in place ("RESOLVES the bridge §2 [NOVELTY-CHECK-NEEDED] mark": AFP-HAS-LP_DUALITY finding recorded) |
| `SEED-DOSSIERS.md:5` (convention header) + `:239` (ownership note) | the convention definition, not an instance | **CLOSES-THIS-CYCLE** at close-summary (resolve with the family) |
| `SEED-DOSSIERS.md:56` | seed-1 residual: rg the OAI family-265 companion preprints for a 3D corollary + third-party formal activity on AreaLaw2D's 3D layer | **RETARGET-ITER-5** — carrier: L6 novelty battery / `novelty/round-5*` (no round-5 record exists in the tree as of 2026-11-17; closes in-cycle IFF round-5 lands before close-out) |
| `CHARTER-DRAFT.md:58` | phase-3 "obligations, not decorations" row (per-chartered-seed batteries) | **RETARGET-ITER-5** (split): LP sub-item CLOSES (prework:208 + seed-triage AFP check); AL-3D + ZZV2 sub-items → L6/round-5 carrier (ZZV2's Lamzouri must-cite framing exists in `pilots/zzv2-lambda-prework.md:120–122` but the formal battery does not) |
| `feasibility/lp-duality-bridge.md:68` | residual: mathlib LP/PNT PRs in flight | **RETARGET-ITER-5** — carrier: L6 standing clock (mathlib-PR watch); a clock, not a battery |

### [CHARTER-PENDING] — 4 live sites: **2 CLOSES-THIS-CYCLE, 2 RETARGET-ITER-5**

| site | annotates | disposition |
|---|---|---|
| `pilots/zzv2-lambda-prework.md:3` + `:141` | ZZV2 λ-family proposal headers | **CLOSES-THIS-CYCLE** — chartered (slot-3 KEEP resolved at typeset; §12 execution spec; P0 staged per backlog §14 run 9) |
| `pilots/10/next-tranche-spec.md:3` + `pilots/10-blueprint.md:187` | 10-tranche D1–D6 proposal | **RETARGET-ITER-5** — carrier: the 10-tranche charter decision itself (benched: "activates week 2 on lane-drain or charter scope decision", backlog §5 tail; ledger row 10-tranche OPEN) |

(INDEX:192–193 and the four STATUS.md hits are historical records/descriptions, not
live tokens.)

### [DEFER-watchlist] — **0 sites** (class marker absent from the tree; nothing to disposition)

## 2. Totals

| class | sites | CLOSES-THIS-CYCLE | RETARGET-ITER-5 | NEEDS-RULING |
|---|---|---|---|---|
| [TRIAGE-DECISION] | 19 | 19 (14 event + 5 close-act) | 0 | 0 |
| [A5-triage-pending] | 3 | 3 (resolved-in-place) | 0 | 0 |
| [NOVELTY-CHECK-NEEDED] | 8 | 5 | 3 | 0 |
| [CHARTER-PENDING] | 4 | 2 | 2 | 0 |
| [DEFER-watchlist] | 0 | — | — | — |
| **total** | **34** | **29** | **5** | **0** |

**NEEDS-RULING list: EMPTY.** Two sequencing dependencies for the orchestrator to note
(not token rulings): (i) the 3 RETARGET novelty residuals close in-cycle only if L6's
`novelty/round-5*` lands before close-out — otherwise the close-summary must record the
retarget (the stamps don't wait on it); (ii) the close-act items (SPLICE:71 fill, the
pointer-row updates, the stamps below) are the orchestrator/H close-out sequence itself.

## 3. Supersession-stamp precheck on the four staging files

`grep -i 'supersed\|SUPERSEDED\|stamp'` over all four — **ZERO hits each: NO file
carries a stamp yet** (correct pre-close state; the G7 `grep -L` empties only after the
close-out stamps land). What each needs at close:

| file | state | needs |
|---|---|---|
| `feasibility/ITERATION4-SCAN.md` | unstamped | superseded-by-charter stamp; its 8 token rows resolve per §1 above (one — :19 — already stale-closed in Cycle 2) |
| `feasibility/ITERATION4-SEED-DOSSIERS.md` | unstamped | superseded-by-charter stamp; A5 folds already inline; the :56 residual carries via the L6/round-5 retarget |
| `feasibility/ITERATION4-CHARTER-DRAFT.md` | unstamped | superseded-by-typeset-charter stamp (the draft is the pre-typeset artifact; [G7b]/[SWEEP]/[A5-SEED-TRIAGE] already show in-place resolutions at :6) |
| `feasibility/ITERATION4-CHARTER-SPLICE.md` | unstamped | FIRST the :71 close-summary fill ([DATE]/[SUBTITLE]/close-summary; resolve [TRIAGE-DECISION] into the final slot ledger), THEN the stamp — splice is the close instrument, stamped last |

— end inventory (A2, 2026-11-17; greps run against worktree agent-03 @ 53c1548 + this
session's landings)
