# FINAL-SWEEP-PLAN-ITER5 — Iteration-5 mechanical close-out (PREP ONLY — execute on the orchestrator's final signal; rows finalize as pilots land)

Lane R1 (verification-integrity successor; worktree agent-02), 2026-11-19. Fourth in
the lineage: main-run `FINAL-SWEEP-PLAN.md` (R9) → `FINAL-SWEEP-PLAN-C2.md` (A1,
EXECUTED) → `FINAL-SWEEP-PLAN-ITER4.md` (A1/R1, EXECUTED at the iter-4 close act —
Step A 52 exact; Step B(i) 58-stage sweep + 5-defect staging fix + 5/5 subset re-fire;
Step B(ii) 9/9 custody batch; citations of record; `VERIFICATION-LEDGER.md` §10 +
Step D). Read the three first. **Do not execute before the orchestrator signals the
Iteration-5 pilot lanes final.** Run from the repo root; budget ~10–30 min (one warm
Modal batch + local sweeps; donor-tree/heavy stages cost extra).

**Defaults inherited from the iter-4 close residue (2026-11-19, all standing):**
full-coverage private+lemma-aware custody (R3 §4/§5), widened error counters
(`error(<code>)` forms; backtick sorry-warnings), wrapped-line joining, no
middle-excerpting (elided axiom lines persist in full), sha256-at-sweep, **order.txt
dependency-ordered emission** (`make_axcheck.py` emits; `axcheck_probe.py` reads;
absent → sorted glob), **AxDep_ compile-only dep stages** and **AxFC_ full-coverage
custody stages** (`axb_close_iter4.py` + `run_axb_close_iter4.sh`), and
**GIT_BYTES_OVERRIDES** (staged bytes of record may be a committed REV, not HEAD).
Class rulings follow the file's OWN header + declaration census at landing — never an
inherited label (the ff-ez2-P1 correction, iter-4 close: a "probe-convention" TARGETS
comment was wrong; the file was proof-class, discharged by bytes-unchanged citation).

## 0 Scope — Iteration-5 TARGETS inventory (pre-staged 2026-11-19; rows land on landing)

Baseline at prep: main carries the day-1 spines `pilots/41/P0.lean` (statement rung,
1 public theorem `Pilot41.phi_parts`, sha `3ba649fa12cca395`, landed `f5cfe5e`
2026-11-18) and `pilots/zzv2-lam/eta-pin-probe.lean` (320 LoC, sha `afa0c06c514ef74b`,
landed `c359f48`). Everything else below is worktree-side until H's opening-commit
pulls + subsequent landings; statuses update per lane formal reports.

| slot | expected final file(s) | class / Step-B treatment | notes |
|---|---|---|---|
| 10-D4 **M-arc** (R3, agent-07; reported GREEN day-1) | `pilots/10/M-arc.lean` | **AxPilot10_MArc — RECOMMENDED as the SINGLE tranche-final anchor row** (the `AxPilot10_L5` single-anchor precedent: orchestrator ruling 2026-11-18, FINAL-SWEEP-ITER4 §0 `[SUPERSEDED… single tranche-final anchor…]` — L5 embeds L4/L3 verbatim, one row covers the tranche's final theorem state, earlier rungs stay §-historical citations). CONDITION at landing: verify M-arc EMBEDS L5 verbatim (the L4-in-L5 pattern). If instead it `import`s L5 (new pattern), keep the single row but stage `AxDep_10_L5` (compile-only dep class) ahead of it in order.txt — do NOT hand-merge | 6 prose-header sorry-hits only per R3's report — Step-A entry, 0 real tokens expected |
| 41-P0 statement rung (R4, agent-08; reported GREEN day-1) | `pilots/41/P0.lean` (on main) | **AxPilot41_P0 Step-B(i) row on landing-report confirmation** — 1 public theorem, one print, near-zero cost; the file's own header bills it "statement/faithfulness rung … NOT a proof artifact" (candidate-unfired at `f5cfe5e`) — R4's GREEN firing report supersedes that status line and governs the class. NEVER carries a headline | if R4's report classes it probe-convention despite the theorem, record the ruling + cite the run log instead (either branch is one line of evidence) |
| 41 core S–M (R4, agent-08; in flight) | `pilots/41/Core.lean` (name per R4's landing) | **AxPilot41_Core row on landing** (proof-class expected; full-coverage AxFC custody if privates/lemmas present — census at landing decides) | the (M)/(N) targets and (H) binders in P0 discharge here |
| **Liu-B_new** statement-port (R7, agent-10) | `pilots/liu-bnew/P0.lean` | **probe-class — NEVER a Step-B stage** (the §7a zzv2-P0 ruling class); donor = Liu-1 sibling (AGENTS.md: statement-level citation only, DO-NOT-CONSUME as build dep) — any donor hygiene evidence rides the probe run log, not a TARGETS row. Re-check the class at landing against the file's own header + census (ff-ez2-P1 lesson: labels drift; if actual proof content lands later it gets its own row then) | expected 0 tokens (Step-A entry only) |
| 74-P2 (R3, agent-07; precharter `6216e2a` — two-atom hVarLB insufficiency, FIND-#1 family recycled) | `pilots/74/P2.lean` on landing | **Step-B(i) row AxPilot74_P2 + AxFC full-coverage custody stage** (the AxFC_74_P1 class at iter-4 close: 7 publics + 24 privates direct-printed) | Mathlib-only expected; no ordering constraint |
| 75-N2 P2 resume (R6, agent-06; runs 22+; the iter-5 lead-1 payload) | `pilots/75/N2-P1.lean` grows and/or P2 file | **GIT_BYTES_OVERRIDES EXTENSION RULE (pre-staged):** at iter-4 close the override pins AxPilot75_N2P1 to the RUN-19 bytes (`3ad896b`, sha-guard `ca1089e2a0c122c4`) because HEAD carried unfired paused-P2 bytes. When R6 lands a NEW verified N2 state (P2-complete or amended P1), the override's (rev, sha) moves to THAT run's committed bytes in the same landing batch — never to an unverified HEAD; if the landed-and-verified state IS HEAD (run's bytes committed and verified), the override drops with a dated correction note. If P2 adds sibling imports (e.g. an `import N2P1` chain), extend stage-scoped EXTRA_REWRITES + order.txt, never hand-merge | watch the hnp-erratum interplay: post-erratum N2-P0 `1cf5cbe217c68564` is the standing dep (iter-4 close compatibility argument, §10.33) |
| 77 completion / T2 tainted-decl fix (charter-dependent) | `pilots/77/T1.lean` re-charter, `T2.lean` fix | rows ONLY for GREEN completions (the 74-precedent ruling: honest-stop files stay Step-A classifier-covered); a T2 tainted-decl fix flips the iter-4 385/386 whole-tree residual — Step-B row for the fixed file + ledger §11 delta row when it lands | billing: the fixed decl closes a filter-blind-spot class, not a math gap |
| AL M0-rebuild (R8, agent-05) | `pilots/al3d/` M0 file per landing | row on landing (proof-class expected; AxDep chain if it imports P0/A1 — the close-resume order.txt machinery handles it); the `dependsOnNoncomputable` substrate rule (h-wave4-log standing note: `Polynomial ℤ`/monoid-algebra defs get `noncomputable` UP-FRONT) applies to any new al3d data-level defs | A2.lean's iter-5 re-charter (find-#5 z-rank rebuild) rides separately — when it lands, AxPilotAL3D_A2 re-stages at the new bytes (sha-at-sweep governs) |
| η-pin-probe (R5, agent-04; run 2 + OVER-cpu investigation owed) | `pilots/zzv2-lam/eta-pin-probe.lean` (on main) | **probe-convention — Step-A scope ONLY, never a Step-B stage** (pre-ruled by the re-task; the file is a probe by name and billing) | entry in stepA-incremental-iter5.log; the OVER-cpu telemetry investigation is R5's, not the sweep's |
| round-6 novelty batteries (R9, agent-09) | md/probe artifacts as they land | Step-A scope for any new .lean; rows only for proof-class landings per lane reports | — |

**On-landing duties (unchanged):** add the row to `make_axcheck.py` TARGETS
(Iteration-5 append-only block AFTER the frozen C2 + Iteration-4 blocks — those are
frozen history, audit `r3-verification-integrity.md` §7); classify probe-vs-proof
from the file's own header + census + lane report; Step-A entry appended to
`logs/stepA-incremental-iter5.log`; sha256-at-sweep in every stage header; order.txt
keeps chains ahead of consumers automatically.

## 1 Baseline sorry-token certificate — iter-5 re-baseline at the OPENING COMMIT

Baseline = the iter-4 sweep-time certificate **52 exact** (43 C2 carry-forward +
3 `al3d/P0` :106/:144/:149 + 3 `lp/P0` :44/:55/:97 + 2 ProbeG9 :51/:67 + 1 ProbeG10
:96; `logs/stepA-incremental-iter4.log` sweep-time entry) **re-run on the
post-opening tree**; new Iteration-5 files append their entries to
`feasibility/probe/logs/stepA-incremental-iter5.log` (R1 opens it at the opening
commit): M-arc.lean (R3 reports 6 prose-header hits only — expect 0 REAL-TOKEN),
eta-pin-probe.lean (probe-convention), liu-bnew/P0.lean (expected 0), 41/Core.lean
(when R4 reports), N2-P1 run-24 bytes (when R6 reports). Any REAL-TOKEN outside the
declared entries = VIOLATION-UNEXPLAINED → STOP, route the file verbatim to its
owning lane before Step B. Classifier = the §G1/C2 §2 script verbatim (docstring
interiors are prose; PROSE regex; comment prefixes) — never retyped.

## 2 Step B — two-part (defaults as inherited; donor classes below)

(i) TARGETS batch `run_axcheck.sh` (warm app crossmath-probe, doz CLI default,
order.txt-governed). (ii) full-coverage custody stages for every Iteration-5
proof-class artifact (`axb_close_iter4.py` batch class; re-run-only-if-sha-differs
for already-discharged iter-4 stages — their citations stand while bytes hold).
Substrate classes: [WARM] plain pin; [LAYERS]-donor-tree zzv2-class stages on the
built ZetaZerosV2 tree (`run_m4b_donor_axcheck.sh` recipe — the η-pin P0/P2 chain if
it ever graduates to proof-class); [D-PIN] zeta23e donor-pin rows cite the donor-pin
log; Liu-1 = statement-level citation only (never a build dep). Donor hygiene gate:
on-pin `#print axioms` is proof; comparator configs and READMEs are claims.

## 3 Step C — VERIFICATION-LEDGER §11 (per-pilot rows; extractor-generated counts only)

`| pilot | final files | LoC/thms (extractor, sha-dated) | axcheck verdict (log cite; coverage split) | sorry tokens | sign-off |`; sign-off OK iff Step A 0 unexplained ∧ Step B OK ∧ logs persisted full-length with provenance headers + sha256. The pilot-tree LoC total re-measures (55,305 at iter-4 close).

## 4 Step D — compliance sign-off (append once A–C clean; §4 text verbatim per FINAL-SWEEP-PLAN-ITER4 §4 with the iter-5 enumerated token list)

If Steps A–C surface anything, stop and route to the lane instead of signing.

## 5 Close gates — the Iteration-4 close-act gates family (G1–G8) re-runs at iter-5 close per the then-current gates file; results table committed with the close block.

## 6 Execution trigger

Orchestrator signal "Iteration-5 pilot lanes final". Then Step A locally (seconds) →
Step B one warm Modal batch (+ donor-tree/heavy classes in their batches) → Steps
C–D ledger + sign-off → close gates. Blockers route to lanes; §1 re-baselines if
pending files landed with tokens.

— lane R1, 2026-11-19, worktree agent-02 (pre-K prep; supersedes nothing;
FINAL-SWEEP-PLAN-ITER4.md stands as the executed predecessor).
