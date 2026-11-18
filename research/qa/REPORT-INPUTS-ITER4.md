# REPORT-INPUTS-ITER4 — Iteration-4 input pack / slot-ledger skeleton (lane R5, 2026-11-16)

Model: `research/REPORT-INPUTS-C2.md` (A9's Cycle-2 pack). Scope: **pure factual input
skeleton for H's REPORT.md Iteration-4 sections + A9's TRIAGE-ITER4 rows — no orchestrator
conclusions**; every verdict cell ships **OPEN** and is filled by the owning lane at
landing (one writer per row, named below). Pre-filled from the R5 Phase-B specs
(`qa/iter4-review/r5-iteration4-backlog.md` §§8–§14 — the milestone and evidence shapes
below are quotations from there) + R9's plan (`r9-iteration-plan-draft.md` §7) with the
orchestrator's 2026-11-16 resolutions applied (75-Pb → A3-pattern lane day-1; cap-N = 1).
Conventions carried from C2: every line carries its on-disk source; logs persisted with
provenance headers; disk-verified counts only.

## §0 Launch state (fixed at typeset; H copies into the STATUS open block)

- Opened 2026-11-16 on `dev/iteration4` (cut from the Cycle-2 close commit). Charter =
  R9 splice v2 + the R5 resolutions. Discovery bar RAISED: R2's four-point strength bar
  (`qa/iter4-review/r2-discovery-strength.md` §4) + the iteration-4 article gate (R9 §3)
  at **cap-N = 1 FINAL** (at most ONE knowledge-level / formalization-first /
  donor-discharge article per cycle; KPI ≥ half of shipped articles discovery-grade).
- Launch order: **75-Pb day-1 (A3-pattern lane, top-billed discovery milestone)**; LP
  layer + 02-core same week (engineering-deliverable billing); AL-3D B.2 staged (AL
  lane); slot-3 = ZZV2-λ KEEP-recommended (typeset pending); 72-M1 L3a in the first 48h.
- First-48h run queue: `qa/iter4-review/r5-iteration4-backlog.md` §14 (TWELVE rows, all
  STAGED-NO-RUN; orchestrator approves at charter typeset; run 12 = the 32-crossing
  filler, R2 §12.2). Quality gate: R9 §3, typeset per §6d hybrid
  (normative paragraph into `RESEARCH.md` §Iteration 4; template detail A9-owned).
- Runner apps STAGED on disk 2026-11-16 (launch-prep; H commits with the kit):
  `pilots/lp/` (crossmath-pilot-lp), `pilots/al3d/` (crossmath-pilot-al3d),
  `pilots/zzv2-lam/` (crossmath-pilot-zzv2-lam), `pilots/zeta23e/`
  (crossmath-pilot-zeta23E) — image blocks diff-checked byte-identical to their
  sources (75/73/m4b2/r1 respectively) for family layer sharing; SPEC/telemetry/
  LEAN_NUM_THREADS=2 verified in each; zeta23E's donor substrate (v4.33.0-rc2 +
  mathlib 51e6992e, target `Zeta23.ThmE.Final`) is the per-run cold cost, not the
  image lineage.

## §1 Slot ledger (one row per chartered/carried item; status column ships OPEN)

Evidence-slot format (all rows): `run log = pilots/<dir>/logs/<name>-run<N>.log with
provenance header (date, file+LoC, command, verdict, run URL)` + interim axiom evidence
`in-file #print axioms over every top-level theorem, triad-only, 0 sorryAx` + at close-out
`Step-B axcheck stage (make_axcheck / axcheck_full per AGENTS.md full-coverage standard)`.
TARGETS additions land with each pilot's first GREEN (A1's ledger §10 row).

| Row | Item (lane; billing) | First milestone (kernel-checkable) | Evidence slot (path + form) | Status |
|---|---|---|---|---|
| 75-Pb | 5/6 strip-distinct arm (A3-pattern lane; discovery completion, S4(b) conditional title) | **FINAL-GREEN 2026-11-16 (relay)** — P-b + C1 5/6-arm landed: ALL FOUR landings triad-only, 0 sorryAx, ZERO donor imports; 11-run descent with TWO continuation authorizations (the +1 four-condition policy, both logged) | `pilots/75/logs/pb-run11-final.log` (the evidence record); print-gap remediation pb-run12-auditfix.log (R3 §10.4 fold) + Step-B full-coverage closure logs/axcheck-full-run1.log (89/89 census decls triad, sha da05c60ceb78755b; §10.8) [2026-11-17, A1 audit relay] | **FINAL-GREEN** |
| LP-1 | LP layer + 02-core consumer (A2; engineering deliverable, never article) | **FINAL-GREEN 2026-11-16 — slot 1 complete end-to-end** (P0 probe frozen → P1 layer → P2 consumer, all triad): `lp_weak_duality` + `_symm` proved kernel-clean in `pilots/lp/L1.lean` (90 LoC ≤ 0.25k; 2 of ≤3 runs) | `pilots/lp/logs/lp-p0-run1..4.log` (probe freeze incl. the **IsOrderedRing port finding**: bridge `[LinearOrderedRing]` absent at ff2494ea — pin idiom `[CommSemiring][LinearOrder][IsOrderedRing]`; anchors held at GroupWithZero/Defs.lean:225/:229; P2 plumbing pin `Finset.sum_disjSum`/`sum_sumElim`), `lp-l1-run1..2.log` (L1 GREEN, triad prints :15–16) | **FINAL-GREEN** |
| LP-2 | 02-core consumer clause | **FINAL-GREEN 2026-11-16**: `bw2_ceiling_of_dual` GREEN in `pilots/lp/L2.lean` (127 LoC ≤ 0.7k) at `Unit ⊕ G ⊕ G` — 5 card runs + **1 orchestrator-authorized +1** (deterministic-continuation class; four-condition policy logged: monotone descent + written hypotheses + staged fix + diagnostic pointer `pilots/lp/logs/DIAGNOSE-lp-p2-run5.md`) | `pilots/lp/logs/lp-l2-run1..6.log` (run-6 triad prints :24–25 incl. private `sum_uGG`; sha-stamped headers; machinery deltas in headers: error-classifier widening + dependency-order olean emission — the prework's sibling-import bet needed the axcheck_full pattern). Total slot cost: 11 minutes-class runs | **FINAL-GREEN** |
| AL-3D | B.2 staged (AL lane; formalization-grade, rung NAMED, C.1–C.4 fences in every header) | **AL-P0 GREEN** (R8-reviewed, 2026-11-16 relay: 468 LoC, 4% overage-on-GREEN recorded) — with R9's statement-level find: the prework §2.5 induced-square reading REFUTED; landed encoding = `projLattice` + ambient-graph binder (r5 §11 dated correction re-anchors P1-b + GO/NO-GO on it); P0 amendment find #3 (groupStrength instantiation of PlanarAreaLawVar) re-GREEN alp0-run3.log; A1 remediation +2 audit prints (coverage C1, 22/22) — both §10.6 [2026-11-17, A1 audit relay] | `pilots/al3d/logs/*`; P0 header = the encoding authority | **GREEN (P0 stage)** |
| AL-3D-2 | `SlabAreaLawColumnCuts3D` rung-stone | AL-P2 GREEN under `PlanarAreaLawVar` binder (post-GO/NO-GO branch point; B.3 fallback carries P0/P1) | guard ≤0.9k; inline axcheck | find #4 LANDED (uniform ∃C + G-in-binder amendment — the as-scoped pair was unprovable; substrate re-GREEN run 8) + **P2-c parked**: 114 decls GREEN triad, parked at the `colEquivVar_left` transport (run 23; `A2-gaps.md` ledger; §10.6) — completion path a re-chartered (A4 in flight) [2026-11-18, A1 delta item 4, H hand-apply] |
| ZZV2-λ | λ-family route (a) (slot-3, KEEP recommended; technical record, never article) | **P0 GREEN 2026-11-17 (run 1 of ≤2, wall 681 s @SPEC, doz/semraker route)** — pins landed: (a) transfer endpoints λ-generic with NO numeric λ-range (λ only via `IsAdmissible`'s support clause); (b) **Landau side MT-frozen at the bridge** — input `pairCorrelationFormula` η-generic+unconditional, but `unweightedKernelSum_cutoffTest_tendsto` proved only at `cutoffTest ψ` (frozen `extremalTest` base, no scaling-covariance lemma in-tree) ⇒ **P1 GO then hard STOP after P1 GREEN** (r5 §12a rule; diagnose-note = `pilots/zzv2-lam/P0-record.md`; η-port = charter decision); (c) functional sites `Zeta/Kernel.lean:191` + `Zeta/Defs.lean:48/:120` | `pilots/zzv2-lam/logs/p0-run1.log` (provenance header + closing block; donor hygiene gate on-pin: 4/4 consumed names triad-only, log :151–154; telemetry wall=681s OVER=8 cpu-only, investigation note in log; verification rows = r3-verification-tables.md §10.10) + `p1-run3.log` (P1 FINAL: build OK 8262 jobs taskset-capped; P1.lean OK SORRY-STRICT rc=0 0 errors 0 sorry; 10/10 theorems incl. 2 privates each exactly the triad, :145–:155; ZERO sorryAx/native_decide token-sweep; 3-run descent, fix-loop 2 of ≤4) | **FINAL-GREEN (P1 stage); HARD STOP EXECUTED per r5 §12a** (Landau η-port = iteration-5 ask, recorded in P1-record); slot CLOSED at the L0–L4 technical-record rung [H hand-applied from A3's P1 report 2026-11-17] |
| 72-M1 | L3 + interface theorem (A8; interface glue) | **L3a GREEN (run 6, 2026-11-16 relay)** — hermPart block kernel-clean in `P72M1T3.lean` (L3-spec §2); L3a print-gap CLOSED axcheck-l3a-run1.log (9/9 direct triad; §10.9) [2026-11-17, A1 audit relay]; L3b–d + interface theorem OPEN | `pilots/72-M1/logs/`; make_axcheck72m1.py TARGETS +T3 DONE 2026-11-17 (local file + central make_axcheck row `AxPilot72_M1_T3`) | **L3a GREEN; L3b–d OPEN** |
| 73-Q4 | hRat discharge (A2 memo → gate; dossier upgrade note outcome, N=1) | **GATE MEMO LANDED 2026-11-17, recommendation GO** (`pilots/73/Q4-gate-memo.md`: elementary periodicity; R2's named upgrade path; warm zero-cost substrate; `hPur` never discharged; Rosen pin provisional-passed-to-pilot per the C2 :127–:130 record, verify at write-up) — awaiting pilot authorization + lane assignment | `pilots/73/logs/q4-run15-green.log` (final: C.lean frozen-layer regression GREEN + Q4.lean OK rc=0 0 errors 0 sorry-warnings, wall 26 s; **30 printed decls = 22 Q4 + 8 C.lean, all triad-only, 0 sorryAx**; 15-run descent with runs 9–14 condensed) + `Q4-upgrade-note.md` (the dossier-upgrade write-up: hRat discharged, `hPur` fence held; Rosen pin verified at write-up) + §10.18 (folded + re-verified by lane A1) [stale "§10.18-to-come" cite fixed 2026-11-18, A1 delta item 7, H] | **FINAL-GREEN 2026-11-17** — hRat discharged; (P)(i) unconditional for the 𝔽_q(T) probe class [H hand-applied from A2's Q4 report 2026-11-17] |
| 22-T2a | upstream StrongPNT binder pilot (A8; statement-only, T1 NOT fired) | G9 preflight GREEN (runs 36/37, one fix-retry; §10.24) → 22-T2a P0 | `feasibility/probe/logs-g/run3{6,7}-g9*.log` + `pilots/22/logs/t2a-p0-run1.log` + `T2a-P0.lean`/`-record.md` | **FINAL-GREEN 2026-11-17** — P0 GREEN run 1, no retry spent (§10.25); T1/T2/T3 unfired, PNT+ stays DEFER [2026-11-18, A1 delta item 1, H hand-apply] |
| 74-T3 | surprisal LP second consumer (A4; ONLY if chartered) | statement-port in LP-P0 already; execution = `≤` clause at `u ≠ 1` in-statement | own guard ≤0.6k additional | **OPEN-GATED** |
| 74-P1 | surprisal T1/T2/T4 pilot (A8; discovery-dense core, T3 rides the LP layer) | P0 statement rung GREEN → P1 proof core | `pilots/74/logs/*`; §10.15/§10.21 | **P0 GREEN** (14 defs + 5 statement Prop-defs, zero-sorry; §10.15) + **P1 NOT-GREEN honest at budget — the 4 FINDS stand** (T1(a) per-spectrum floor refuted w/ counterexample; hMGF centered form; constants-via-limit; T4 shape-(ii) consistent; §10.21); **completion re-chartered with verify-fire discipline (A8 in flight)** [2026-11-18, A1 delta item 5, H hand-apply] |
| 10-tranche | D1–D6 assembly (A6; engineering, headline stays OPEN) | D1 wd↔cw walk agreement lemmas GREEN | `pilots/10/logs/*`; tranche guard 1.0–1.6k | **D1/D2/D3 ALL FINAL-GREEN** (D1 §10.17; D2 FINAL §10.26 superseding §10.20 PARTIAL; D3 GREEN first-run §10.26); **D4 UNCHARTERED → iteration-5 M-arc** (must supply/derive hv); Step-B anchor = **AxPilot10_L5 single row** (orchestrator ruling 2026-11-18: L5 embeds L4/L3 verbatim) [2026-11-18, A1 delta item 2, H hand-apply] |
| 75-N2/N3 | unconditional-at-ℚ instantiation (A3-pattern lane, after P-b) | (d1)+(d2) shared staging file → `zetaL_two_thirds_landed_ℚ` | `pilots/75/logs/`; N2 0.4–0.8k | **N2-P0 GREEN** (15/15 triad, §10.12) + **N2-P1 M1-CHECKPOINT** (core GREEN-triad incl. the `chi_span_residue` c-trick, run 7; packaging closure owed; §10.22 honest checkpoint row, NOT final) — M2/M3 chartered, A5 in flight [2026-11-18, A1 delta item 3, H hand-apply] |
| hEχ | 75/42 χ-column discharge at zeta23 donor pin (A2-executing; **COMPANION billing to 75-Pb** — two binder tiers of the one 75 statement-class article; R2 mini-spec :535–553) | **GREEN FIRST-RUN 2026-11-16/17, card 9 done in ONE run** (wall 862s — minutes-class; the 144-file pruned closure was small as R2 predicted): build OK + zero-sorry probe OK + **donor hygiene gate PASS** — transitive Theorem-E audit all five triad-only (`thmE_A₀/B₀/C₀` + `paperInputsChi_L` + `thmE_A`), 0 sorryAx; the `hex_two_thirds_binder_port` shape (verbatim thmE_A₀ conclusion) elaborated in-tree — statement-port ≈ 0 confirmed | `pilots/zeta23e/logs/zeta23e-p0-run1.log` (triad prints :165–169; sha-stamped; OVER=13 telemetry note in header: build-phase lake -j burst, soft class, `-j 2` for future build runs) | **GREEN (audit + port)** — binder swap CLEARED |
| 32-crossing | frontier-theorem crossing-existence discharge (R2 §12.2; riskless filler, any lane drain; article-32 §5 "not formalized" paragraph discharges on GREEN — the v2 status rewrite is R1's post-GO edit) | **FINAL-GREEN 2026-11-17 (run 12, lane A6)** — all six R2 §12.2 forms + `frontier_formula_unconditional` in `pilots/32/M2.lean` (675 LoC, self-contained frozen-M1 carry), 3-run descent 9→2→0 errors, triad-only, 0 sorry | `pilots/32/logs/run12-crossing-existence.log` (provenance header incl. all three descent URLs + doz-route record; GREEN-block triad prints :40–:66; M1 regression :14; attempts 1–2 raw preserved below the final block); discharge note `pilots/32/run12-discharge-note.md` (article §5 retired-sentence map + R1 v2 draft + TARGETS row for H/R3: plain append, self-contained file needs NO import rewrite) | **FINAL-GREEN** |
| G10 | AreaLaw2D+Physlib refreshed retry (A7 shelf) | n/a until a consumer charters (72-M1 Tier-B / PlanarAreaLawVar discharge) | `logs-g/`; C3-layer-campaign class ≈6–12 h @SPEC | **SHELF** |
| G9 | StrongPNT statement-binder probe (A7→A8) | StrongPNT statement ports ≈0 on-pin; statement-binder class released (with G13 same batch) | `feasibility/probe/logs-g/run3{6,7}-g9*.log` (§10.24) | **FINAL-GREEN 2026-11-17** [2026-11-18, A1 delta item 1, H hand-apply] |
| G11/G12 | OAI SiegelZeros+PiExponent donor registration (R6 probes; A1 verdict review) | donor-pin axiom audits triad-clean, statement-binder class RELEASED 2026-11-17 (registration ≠ endorsement) | feasibility/probe/logs-g/run35-g11-fix.log; r3-verification-tables §10.7; donor map §"G11/G12 verdict" | FINAL-GREEN |
| 77 (FB-5) | CAR-occupation dictionary + Laughlin inequality (A7; re-scoped dossier, CHARTER-GO 4 conditions) | T1 execution | `pilots/77/*`; §10.27 | **T1 NOT-GREEN honest at budget** — the two derived T1-statement corrections stand (hyperbolic submodel rank 2(Q+1); number-operator intertwining); math closed, 31 site-local residuals; **T1-completion + T2 re-chartered as ONE unit (A7 in flight)**; physlib clock stable both ticks [2026-11-18, A1 delta new-row, H hand-apply] |
| FF-EZ2 | survivor battery (A3; engineering billing) | battery guards + P0 statement rung | `pilots/ff-ez2/*`; §10.19/§10.23/§10.28 | **CHARTER FULLY CLOSED 2026-11-18**: P0 GREEN (guards 5/5; ≤-direction statement correction; §10.19) + P1 GREEN (7/7 triad, all-m simplicity + density-1; §10.23) + **P2 GREEN descope-closure** (9/9 triad incl. 5 private, 0 sorryAx, run 2/≤3; §10.28; AxPilotFFEZ2_P2 TARGETS row landed at landing) [2026-11-18, A1 delta new-row, H hand-apply] |
| FF-EZ4-P0 | genus-1 Weil×tauceti identification rung (A6; statement-first Prop-def convention) | zero-sorry statement elaboration | `pilots/ff-ez4/logs/p0-run1.log`; §10.14 | **GREEN** (4-run descent 15→8→3→0 errors, run 4 OK wall 76 s, ZERO sorry tokens; probe-convention — never a Step-B stage) [2026-11-18, A1 delta new-row, H hand-apply] |
| 78-Stage-A | Truffet tropical-substitution refutation (A7; NEGATIVE-kind, discovery-grade) | A1 fidelity bridge + A2 refutation run | `pilots/78/*`; `articles/78-*.md` | **GREEN** (p0-run4: A1+A2+A2′ 3/3 PROVED-UNCONDITIONAL triad; AxPilot78_P0 TARGETS row landed 2026-11-18; quota NOT consumed per the NEGATIVE-kind ruling) [2026-11-18, A1 delta new-row, H hand-apply] |

## §2 Carried/ledger rows (fill at close-out)

| Row | Item | Discharge condition | Status |
|---|---|---|---|
| debts f/g/h/l | HKT pin; vdG–vdV number (DUE at FF-EZ2 dossier; **PINNED 2026-11-17 to theorem-granular — Fuhrmann arXiv:alg-geom/9610023 + Tafazolian–Torres 2012, superseding the tables-level cite; H hand-apply per A3's battery flag**); tracker citation convention; Λ-absence ban | novelty lane (L6/A5-pattern) | **g CLOSED 2026-11-17 (FF-EZ2 battery); f/h/l OPEN**; runner-fixes-wave2.patch **ADJUDICATED 2026-11-18 (H): NO application** — zzv2 fix-a LANDED via the lane's own taskset edit; fixes b/c + zeta23e a/b/c still-unapplied and NOT needed by wave-3 runners (elaboration-family, LEAN_NUM_THREADS-capped); tracked for iteration-5 donor-tree re-adjudication (`qa/iter4-review/h-wave3-log`) |
| clocks | tracker (static-asset curl), Liu-2, WenrongZou, physlib pushed_at, mathlib PNT/LP PRs, AreaLaw2D challenge repo | standing; date every claim | **STANDING** |
| stale wrappers | `pilots/32/run_pilot.sh:15–16`, `feasibility/probe/run_probe.sh:15–16` (xyz-default) | patch or `MODAL_USER=doz` at first reuse (feasibility lane) | **OPEN** |
| cold bench | 41 (top), 12, 11-M3/word-RAM, FF-EZ2 (battery + debt g first), physlib bridge probe | lane-drain activation only | **BENCHED** |

## §3 Article-gate accounting skeleton (A9 fills; N = 1 FINAL)

Shipped iteration-4 articles: **none yet**. Non-discovery (knowledge-level /
formalization-first / donor-discharge) article slots: **1 maximum for the whole cycle** —
current recommendation leaves it UNSPENT (75-Pb = discovery-grade conditional per S4(b);
73-Q4 = dossier note; ZZV2-λ/LP/AL-3D/10-tranche = technical records). Discovery-grade
billing candidates: **the 75 statement-class article — now the clear lead with BOTH tiers
in motion (week-1 note, 2026-11-16): P-b's distinct-5/6 tier LANDED FINAL-GREEN
(pb-run11-final.log); hEχ's multiplicity-2/3 tier audit-PASSED + port-elaborated
(zeta23e-p0-run1.log)** — one article, two honestly-labeled tiers, S4(a) satisfied by the
in-article hEχ discharge (r5 §14.1(c)); plus 74-T1/T4 (if piloted) and R2's completion
list (01-stability / 32-crossing / 30-Theorem A, not yet chartered). **No quota
consumption yet — the article ships at cycle close per the gate.** KPI at close: ≥ half
of shipped articles discovery-grade — recorded in the cycle-close REPORT block.

## §4 Open-marker summary

OPEN rows land as `FINAL-GREEN / FINAL / DECLARED-DROP` per the Cycle-2 convention
(ledger §9); GATED/CONDITIONAL rows keep their gate line until the gate resolves;
PENDING-SIGNAL/SHELF/BENCHED rows are not cycle obligations. Every fill cites its log
path; H's Step-C sweep checks row-by-row at close.

— end skeleton (R5). Owners: rows filled by their lanes; this file's writer (R5) owns
only the skeleton. No orchestrator conclusions herein.
