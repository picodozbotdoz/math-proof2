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
| 75-Pb | 5/6 strip-distinct arm (A3-pattern lane; discovery completion, S4(b) conditional title) | Pb.lean v1 = Pa.lean carry + E1–E3 GREEN (`zetaL_assembly_distinct_defect_landed` chain begun; spec r5 §8) | `pilots/75/logs/pb-run<N>.log`; inline full-coverage axcheck; expected 3–5 runs | **OPEN** |
| LP-1 | LP layer + 02-core consumer (A2; engineering deliverable, never article) | **FINAL-GREEN 2026-11-16 — slot 1 complete end-to-end** (P0 probe frozen → P1 layer → P2 consumer, all triad): `lp_weak_duality` + `_symm` proved kernel-clean in `pilots/lp/L1.lean` (90 LoC ≤ 0.25k; 2 of ≤3 runs) | `pilots/lp/logs/lp-p0-run1..4.log` (probe freeze incl. the **IsOrderedRing port finding**: bridge `[LinearOrderedRing]` absent at ff2494ea — pin idiom `[CommSemiring][LinearOrder][IsOrderedRing]`; anchors held at GroupWithZero/Defs.lean:225/:229; P2 plumbing pin `Finset.sum_disjSum`/`sum_sumElim`), `lp-l1-run1..2.log` (L1 GREEN, triad prints :15–16) | **FINAL-GREEN** |
| LP-2 | 02-core consumer clause | **FINAL-GREEN 2026-11-16**: `bw2_ceiling_of_dual` GREEN in `pilots/lp/L2.lean` (127 LoC ≤ 0.7k) at `Unit ⊕ G ⊕ G` — 5 card runs + **1 orchestrator-authorized +1** (deterministic-continuation class; four-condition policy logged: monotone descent + written hypotheses + staged fix + diagnostic pointer `pilots/lp/logs/DIAGNOSE-lp-p2-run5.md`) | `pilots/lp/logs/lp-l2-run1..6.log` (run-6 triad prints :24–25 incl. private `sum_uGG`; sha-stamped headers; machinery deltas in headers: error-classifier widening + dependency-order olean emission — the prework's sibling-import bet needed the axcheck_full pattern). Total slot cost: 11 minutes-class runs | **FINAL-GREEN** |
| AL-3D | B.2 staged (AL lane; formalization-grade, rung NAMED, C.1–C.4 fences in every header) | **AL-P0 GREEN** (R8-reviewed, 2026-11-16 relay: 468 LoC, 4% overage-on-GREEN recorded) — with R9's statement-level find: the prework §2.5 induced-square reading REFUTED; landed encoding = `projLattice` + ambient-graph binder (r5 §11 dated correction re-anchors P1-b + GO/NO-GO on it) | `pilots/al3d/logs/*`; P0 header = the encoding authority | **GREEN (P0 stage)** |
| AL-3D-2 | `SlabAreaLawColumnCuts3D` rung-stone | AL-P2 GREEN under `PlanarAreaLawVar` binder (post-GO/NO-GO branch point; B.3 fallback carries P0/P1) | guard ≤0.9k; inline axcheck | **OPEN** |
| ZZV2-λ | λ-family route (a) (slot-3, KEEP recommended; technical record, never article) | P0 probe in built V2 tree: pin transfer-endpoint range + **P0(b) Landau η-genericity** | `pilots/zzv2-lam/logs/*`; C3 ≈1–2 h @SPEC; P0 ≤2 runs | **OPEN** (typeset pending) |
| 72-M1 | L3 + interface theorem (A8; interface glue) | **L3a GREEN (run 6, 2026-11-16 relay)** — hermPart block kernel-clean in `P72M1T3.lean` (L3-spec §2); L3b–d + interface theorem OPEN | `pilots/72-M1/logs/`; extend `make_axcheck72m1.py` TARGETS with T3 | **L3a GREEN; L3b–d OPEN** |
| 73-Q4 | hRat discharge (A2 memo → gate; dossier upgrade note outcome, N=1) | Step 0 gate memo (no Modal); then `heckeSeriesT_rational_of_periodicity` (spec r5 §13) | `pilots/73/logs/q4-run<N>.log`; Rosen ch.-number spot-check DUE at Q4 | **OPEN-GATED** |
| 22-T2a | upstream StrongPNT binder pilot (A8; statement-only, T1 NOT fired) | G9 probe: `ProbeG9_StrongPNT.lean` elaborates 0 errors on ff2494ea | `feasibility/probe/logs-g/run<g9>.log`; C1 3–4 min | **OPEN-CONDITIONAL** (charter names it) |
| 74-T3 | surprisal LP second consumer (A4; ONLY if chartered) | statement-port in LP-P0 already; execution = `≤` clause at `u ≠ 1` in-statement | own guard ≤0.6k additional | **OPEN-GATED** |
| 10-tranche | D1–D6 assembly (A6; engineering, headline stays OPEN) | D1 wd↔cw walk agreement lemmas GREEN | `pilots/10/logs/*`; tranche guard 1.0–1.6k | **OPEN** (not first-48h) |
| 75-N2/N3 | unconditional-at-ℚ instantiation (A3-pattern lane, after P-b) | (d1)+(d2) shared staging file → `zetaL_two_thirds_landed_ℚ` | `pilots/75/logs/`; N2 0.4–0.8k | **OPEN** |
| hEχ | 75/42 χ-column discharge at zeta23 donor pin (A3-pattern lane; **COMPANION billing to 75-Pb** — two binder tiers of the one 75 statement-class article; R2 mini-spec :535–553) | run-8 folded state: `crossmath-pilot-zeta23E` **STAGED at `pilots/zeta23e/`** (50-M2-pattern clone; donor = `Zeta23.ThmE.Final`, v4.33.0-rc2, mathlib `51e6992e`), C3-[LAYERS] hour-class @SPEC, day-2/3; first kernel-checkable = transitive `#print axioms` of the Theorem-E chain + consumer file GREEN in the built tree | `pilots/zeta23e/logs/*` + donor-hygiene audit log; gate = on-pin triad check of the Theorem-E chain before any binder swap | **OPEN** (chartered-pending-typeset; §14 run 8, r5 §14.1) |
| 32-crossing | frontier-theorem crossing-existence discharge (R2 §12.2; riskless filler, any lane drain; article-32 §5 "not formalized" paragraph discharges on GREEN — the v2 status rewrite is R1's post-GO edit) | the six missing lemma forms 1–6 in `pilots/32/M2.lean` (`gammaOf_tendsto_ten_right` … `frontier_unconditional` via `intermediate_value_Icc`); S–M ≈300–600 LoC | `pilots/32/logs/*`; in-file `#print axioms`; register `AxPilot32_M2` in the sweep TARGETS; **runs on the existing `crossmath-pilot-32` via `MODAL_USER=doz` override — `pilots/32/run_pilot.sh` is a flagged STALE xyz-default wrapper (R8 §5a gap 1)** | **OPEN-CONDITIONAL** (filler; §14 run 12) |
| G10 | AreaLaw2D+Physlib refreshed retry (A7 shelf) | n/a until a consumer charters (72-M1 Tier-B / PlanarAreaLawVar discharge) | `logs-g/`; C3-layer-campaign class ≈6–12 h @SPEC | **SHELF** |
| G9 | StrongPNT statement-binder probe (A7) | see 22-T2a row | `logs-g/` | **OPEN-CONDITIONAL** |

## §2 Carried/ledger rows (fill at close-out)

| Row | Item | Discharge condition | Status |
|---|---|---|---|
| debts f/g/h/l | HKT pin; vdG–vdV number (DUE at FF-EZ2 dossier); tracker citation convention; Λ-absence ban | novelty lane (L6/A5-pattern) | **OPEN** |
| clocks | tracker (static-asset curl), Liu-2, WenrongZou, physlib pushed_at, mathlib PNT/LP PRs, AreaLaw2D challenge repo | standing; date every claim | **STANDING** |
| stale wrappers | `pilots/32/run_pilot.sh:15–16`, `feasibility/probe/run_probe.sh:15–16` (xyz-default) | patch or `MODAL_USER=doz` at first reuse (feasibility lane) | **OPEN** |
| cold bench | 41 (top), 12, 11-M3/word-RAM, FF-EZ2 (battery + debt g first), physlib bridge probe | lane-drain activation only | **BENCHED** |

## §3 Article-gate accounting skeleton (A9 fills; N = 1 FINAL)

Shipped iteration-4 articles: **none yet**. Non-discovery (knowledge-level /
formalization-first / donor-discharge) article slots: **1 maximum for the whole cycle** —
current recommendation leaves it UNSPENT (75-Pb = discovery-grade conditional per S4(b);
73-Q4 = dossier note; ZZV2-λ/LP/AL-3D/10-tranche = technical records). Discovery-grade
billing candidates: **the 75 statement-class article** (75-Pb's distinct-strip tier
CONDITIONAL + hEχ's 2/3 tier discharged-unconditional-at-ℚ + the quadratic-ζ_K corollary
— one article, two honestly-labeled tiers, S4(a) satisfied by the in-article hEχ
discharge; r5 §14.1(c)), 74-T1/T4 (if piloted), 01-stability / 32-crossing / 30-Theorem A
(R2's completion list, not yet chartered). KPI at close: ≥ half of shipped articles
discovery-grade — recorded in the cycle-close REPORT block.

## §4 Open-marker summary

OPEN rows land as `FINAL-GREEN / FINAL / DECLARED-DROP` per the Cycle-2 convention
(ledger §9); GATED/CONDITIONAL rows keep their gate line until the gate resolves;
PENDING-SIGNAL/SHELF/BENCHED rows are not cycle obligations. Every fill cites its log
path; H's Step-C sweep checks row-by-row at close.

— end skeleton (R5). Owners: rows filled by their lanes; this file's writer (R5) owns
only the skeleton. No orchestrator conclusions herein.
