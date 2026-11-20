#!/usr/bin/env python3
"""Build axcheck stage copies: pilot file + appended `#print axioms` lines for
every top-level theorem (namespace-aware, full names). Output dir: argv[1].

Regex extension (folded 2026-11-14 from lane A8's proven pilot-local variant
`pilots/72-M1/make_axcheck72m1.py`, whose m1-axcheck-final run went GREEN with it):
attribute-prefixed theorems (`@[simp] theorem …`, `@[ext] …`) are now captured — the
long-known make_axcheck gap otherwise covered only by `pilots/10/axcheck_full.py`.
Effect: Step-B coverage increases for all TARGETS (e.g. 42/*'s zeroMult_count[On],
10's @[simp] layer); historical axiom-line counts in VERIFICATION-LEDGER §1 were
taken with the older extractor and stay as historical records."""
import re
import sys
from pathlib import Path

PILOTS = Path("/home/doz/zcode-workdir/cross-math-fronttier/research/pilots")

# (stage name, source) — final-sweep list (FINAL-SWEEP-PLAN.md §3; resume session
# 2026-11-09 adds 01/port/10, 42/M2b, 30/ClosedForm). axcheck_probe.py elaborates in
# sorted stage-name order: AxP11T1 < AxP11T2 < AxPilot11_* respects the import chain;
# every other file imports only Mathlib.
TARGETS = [
    ("AxP11T1", PILOTS / "11/P11T1.lean"),
    ("AxP11T2", PILOTS / "11/P11T2.lean"),
    ("AxPilot11_RedCompA", PILOTS / "11/RedCompA.lean"),
    ("AxPilot11_RedCompB", PILOTS / "11/RedCompB.lean"),
] + [
    (f"AxPilot01_port{f.name[:2]}", f) for f in sorted((PILOTS / "01/port").glob("*.lean"))
] + [
    ("AxPilot01_BindingSurface", PILOTS / "01/BindingSurface.lean"),
    ("AxPilot01_MasterIdentity", PILOTS / "01/MasterIdentity.lean"),
    ("AxPilot20_M1", PILOTS / "20/M1.lean"),
    ("AxPilot22_M1", PILOTS / "22/M1.lean"),
    ("AxPilot22_ProbeP1_PNT", PILOTS / "22/ProbeP1_PNT.lean"),
    ("AxPilot22_Tier1", PILOTS / "22/Tier1.lean"),
    ("AxPilot30_falsify", PILOTS / "30-falsify-TheoremB-h1.lean"),
    ("AxPilot30_ClosedForm", PILOTS / "30/ClosedForm.lean"),
    ("AxPilot32_M1", PILOTS / "32/M1.lean"),
    ("AxPilot42_M1", PILOTS / "42/M1.lean"),
    ("AxPilot42_M2a", PILOTS / "42/M2a.lean"),
    ("AxPilot42_M2b", PILOTS / "42/M2b.lean"),
    ("AxPilot42_M3", PILOTS / "42/M3.lean"),
    ("AxPilot50_M1", PILOTS / "50/M1.lean"),
    ("AxPilot50_Dirichlet", PILOTS / "50/Dirichlet.lean"),
    ("AxPilot52_M1", PILOTS / "52/M1.lean"),
    ("AxPilot10_M1", PILOTS / "10/M1.lean"),
    ("AxPilot10_L1", PILOTS / "10/L1.lean"),
] + [
    # --- Cycle-2 additions (FINAL-SWEEP-PLAN-C2.md §3; frozen list 2026-11-14) ---
    ("AxPilot10_L2",      PILOTS / "10/L2.lean"),      # mid-flight (A6); must be final at sweep
    ("AxPilot11_P11T3",   PILOTS / "11/P11T3.lean"),   # GREEN m2-run1/2; lane final-vs-scratch confirm owed
    ("AxPilot11_RedTm2",  PILOTS / "11/RedTm2.lean"),  # mid-flight (A8)
    ("AxPilot42_M4a",     PILOTS / "42/M4a.lean"),
    ("AxPilot42_M4b",     PILOTS / "42/M4b.lean"),     # under upgrade edit; re-staged at sweep run. CLOSE-RESIDUE DISPOSITION (fix 4, R1 2026-11-19): the plain-substrate stage FAILs BY DESIGN on `import ZetaZeros` (built donor) — the C2-close precedent class (stepB-c2.log:1: "verdict of record comes from stepB-c2-m4b-donor.log"); close-time verdict of record = the donor-tree run `logs/stepB-c2-m4b-donor.log` (build rc=0, stage OK, 70 axiom-lines, triad-only). Bytes-unchanged branch VERIFIED 2026-11-19: M4b.lean sha 4499e790e54398c9 identical at 4323178 (2026-11-14, M4b TERMINAL) and close HEAD e3d984b, no intervening commit (git log), donor record staged the same 70-theorem surface the close re-extraction sees
    ("AxPilot71_P1",      PILOTS / "71/P1.lean"),      # 71/P0 EXCLUDED (probe-convention)
    ("AxPilot71_P2",      PILOTS / "71/P2.lean"),      # FINAL-GREEN p2-run6 (landed 2026-11-14)
    ("AxPilot73_C",       PILOTS / "73/C.lean"),       # FINAL-GREEN run6-c-green (landed 2026-11-14); 73/P0 EXCLUDED (probe-convention)
    ("AxPilot75_Pa",      PILOTS / "75/Pa.lean"),      # FINAL-FOR-ENTRY (A4 formal 2026-11-14; P-b/N2/N3 DEFERRED to iteration 4); Mathlib-only
    ("AxPilot72_Cneg",    PILOTS / "72/C-neg.lean"),   # FINAL-GREEN run8 + axcheck-run1
    ("AxPilot72_M1_T1",   PILOTS / "72-M1/P72M1T1.lean"),  # FINAL-GREEN m1-run8 (vendor layer, GREEN since run 4); landed 2026-11-14
    ("AxPilot72_M1_T2",   PILOTS / "72-M1/P72M1T2.lean"),  # FINAL-GREEN m1-run8 (partial-M1, FINAL-for-tranche; L3 → iteration 4); import P72M1T1 auto-rewritten
] + [
    # --- Iteration-4 additions (append-only block, 2026-11-16; every C2 row above is
    #     FROZEN history — R3 machinery upkeep per FINAL-SWEEP-PLAN-ITER4 §0 on-landing
    #     duties; rows land as pilot files appear; probe-convention P0 files are NEVER
    #     Step-B stages, plan §0) ---
    ("AxPilotLP_L1",      PILOTS / "lp/L1.lean"),  # LP-P1 GREEN lp-l1-run2 2026-11-16 (2 thms, triad-only); lp/P0 EXCLUDED (probe-convention)
    ("AxPilotLP_L2",      PILOTS / "lp/L2.lean"),  # LP-P2 GREEN lp-l2-run6 2026-11-16 (2 decls incl. 1 private, triad-only); import L1 auto-rewritten
    # AxPilotAL3D_P0 (close-residue fix 1, lane R1 2026-11-19 per the W1 FAIL-taxonomy
    # defect (1) in logs/axcheck-iter4-close-run1.log): COMPILE-ONLY dep stage — staged
    # verbatim (no #print tail, never a verdict row: probe-convention statement layer,
    # the §0/§7a never-a-Step-B-stage class) so its olean lands on the search path for
    # A1/A2. Run1's A1/A2 FAILs were a STEM COLLISION, not just a missing dep: A1/A2's
    # `import P0` was rewritten to `import AxPilot78_P0` by the global stem map (78/P0.lean
    # and al3d/P0.lean share stem `P0`; dict-last-wins handed 78's row) — the wrong module
    # elaborated clean and `proj`/`IsSlabDomain3D` (P0.lean:384/:348) went unknown. Fix:
    # AMBIGUOUS_STEMS drops `P0` from the global map + stage-scoped EXTRA_REWRITES below
    # route A1/A2 to AxPilotAL3D_P0. Artifacts themselves GREEN: alp2-run13-p2c-closureverify.log.
    ("AxPilotAL3D_P0",    PILOTS / "al3d/P0.lean"),  # compile-only dep (see block note above); al3d/P0 sha 52c5b9f77344e0ed
    ("AxPilotAL3D_A1",    PILOTS / "al3d/A1.lean"),  # AL-P1 GREEN alp1-final 2026-11-16 (22 decls; inline audit prints 20 — Step-B full-coverage prints all 22); al3d/P0 EXCLUDED as a VERDICT stage (compile-only dep row above)
    ("AxPilot75_Pb",      PILOTS / "75/Pb.lean"),   # 75-Pb GREEN pb-run11-final 2026-11-16 (89 decls = Pa carry + E1-E6 + Pb-1/2/3; inline tails print 32 — Step-B full-coverage prints all 89); Mathlib-only, self-contained carry
    ("AxPilotAL3D_A2",    PILOTS / "al3d/A2.lean"), # AL-P2 FINAL-for-iteration-4 (A4 closure-stamp 2026-11-18 per A2-gaps §7): **P2-c CLOSED 100%** — run13 verify-fire sha-guarded (`alp2-run13-p2c-closureverify.log`, guard `509f2368…` pre=post): A2.lean OK rc=0, 0 errors (open or hidden), 0 sorry, full-coverage inline audit triad-only; header stamp added post-verification (final-tree sha `6a5ed555…`; proof bytes = run13-verified). P2-d partial parked at find #5 → iter-5 canonical z-rank rebuild (A2-gaps §5); P2-e rides it. Stage per §7: P0 first (probe), then A1, then this row; `import A1` auto-rewritten to AxPilotAL3D_A1. **ITER-5 STATE (R1 unit-8 fold, 2026-11-19): M0-rebuild GREEN r3 (b84270b6) → M1 CLOSED GREEN 4 runs (`logs/alp2-m1-run4-completion.log`, workhorse `colEquivVar_restr` final assembly triad; run-13's 85-line regression identity held; growth 10 M0 + 4 M1 lines all triad) → M2-a 2/4 GREEN (`powerset_eq_biUnion_projFib` + `sum_projFib_extendId` triad @ `alp2-m2-run2-fixround1.log`) + 2 FIXES-ON-DISK UNFIRED (`colEquivVar_restr_apply`, `projFib_pairwise_disjoint` — pre-written one-liners APPLIED, no fire since m2-run2 which fired the pre-fix sorryAx bytes; the N2-P2 paused class). GUARD RE-BIND (R1 unit 9, 2026-11-19, H batch-B): `7db88f34` → **`9706196c5f5ff593`** (1,431 LoC, 83 decls = 82+1 priv) — **M2-a CLOSED 4/4** (`colEquivVar_restr_apply` + `powerset_eq_biUnion_projFib` + `projFib_pairwise_disjoint` + `sum_projFib_extendId` ALL triad; the unit-8 unfired pair certified). **M2-b honest-partial rides: 2 sorryAx-parked-at-last-fire decls (`regReindexEquiv_compl_iff` :1267 + `colEquivVar_swap` :1337, which consumes the iff) — fixes-on-disk-UNFIRED, disk SORRY-FREE (classifier 0 real tokens; the sorryAx state is the last-fire record, not disk tokens)** — no live claim until the M2-b fire; the A2 sweep verdict stays honest-partial per D7
    ("AxPilot72_M1_T3",   PILOTS / "72-M1/P72M1T3.lean"),  # L3a GREEN l3a-run6-GREEN + print-gap CLOSED axcheck-l3a-run1 (9/9 direct triad) 2026-11-17; import P72M1T2 auto-rewritten. **L3 WAVE-CLOSE STATE (R1 unit-10 fold, 2026-11-19, H batch-G): v13 closing bytes `dcda3133b1ffbd16`** (1,048 LoC, 44 decls all public; 13 runs / 3 grants, ZERO sorry tokens on disk — classifier 0 real). TRIAD-CLEAN at close: `toGrid_star_dotProduct_self` (L3b), `submatrix_mulVec_ec`, `eig_toGrid`, `hasGlobalGap_of_fullSystemGap` (L3c), `edgeBoundary_le_boundaryCard` + T2's `boundaryCard_le_edgeBoundary` — BOTH directions; T1/T2/L3a regressions OK throughout. CONTAMINATED TAIL: `isAdmissible_ΦL`, `hamiltonian_gridDom_eq`, `interface_areaLaw_uniformAreaLaw`. ZERO math defects. **Sweep verdict class = HONEST-PARTIAL until the next wave's FINAL-ROUND GREEN** (the §FINAL-ROUND charter pointer: Finset.mul_sum one-word hQ-tail fix, hmul rw-order, hN e1-pullout, hamiltonian-step1 set-avoidance; est. 1–2 rounds — `logs/l3bd-stop-note.md`). Sweep guard: main bytes == dcda3133
    ("AxPilot32_M2",      PILOTS / "32/M2.lean"),   # 32-crossing FINAL-GREEN run12-crossing-existence 2026-11-17 (lane A6; 7 new theorems triad :60-:66; self-contained frozen-M1 carry, import Mathlib only, NO rewrite needed; row from A6's run12-discharge-note §4). INERT until H commits A6's batch (M2.lean in agent-07 at prep).
    # --- Step-B(i) TARGETS pre-stage (H, 2026-11-18, per close-act runbook §3 Step 8;
    #     landing-independent rows only) ---
    ("AxPilot73_Q4",      PILOTS / "73/Q4.lean"),   # 73-Q4 FINAL-GREEN q4-run15-green 2026-11-17 (hRat discharged, (P)(i) unconditional; ALL decls triad per §10.18 + 8 C.lean frozen-layer regression prints); `import C` auto-rewritten to AxPilot73_C (sorted order C < Q4 respects the dependency); other imports Mathlib-only — the sweep-plan :175 "verify Mathlib-only imports at landing" check DISCHARGED at pre-stage
    ("AxPilot78_P0",      PILOTS / "78/P0.lean"),   # 78 Stage-A refutation, PROOF-CLASS (A1+A2+A2′ PROVED-UNCONDITIONAL triad, p0-run4 2026-11-17 — article-78's carrier; runbook §3 Step 8 lists it explicitly; A9 checklist :147 "deferred Stage-B family" branch REGISTERED here); `import Mathlib` only; Step-B(i) prints the 3 PUBLIC theorems — the private census (23) belongs to Step-B(ii) axcheck_iter4 custody staging
    ("AxPilot10_L5",      PILOTS / "10/L5.lean"),   # 10-D-tranche FINAL (orchestrator ruling 2026-11-18: SINGLE row — L5.lean embeds L4/L3 VERBATIM, full D1–D3 theorem coverage at least compile cost; L3/L4 keep §10 citations as historical rungs; the sweep audits FINAL state = L5); D3 GREEN d3-run1 2026-11-17 (L5 = D3 header + L4 verbatim [D2 FINAL, sha 4ae0d643…] + Part H); Mathlib-only import; sorted after AxPilot10_L2
    # --- Five-unit proof-class finals — PLACEHOLDERS ONLY (rows appended on each unit's
    #     LANDING commit per close-act runbook §3 Step 8; expected stage names): ---
    ("AxPilotFFEZ2_P2",   PILOTS / "ff-ez2/P2.lean"),  # FF-EZ2-P2 FINAL-GREEN p2-run2 2026-11-18 (2/≤3 fix-loop; sorry-strict OK, 9/9 triad-only incl. 5 private, 0 sorryAx; telemetry mem OVER=1 = documented mmapped-olean class) — the descope-closure rung, PROOF-CLASS per runbook Step 8; Mathlib-only import (no ordering constraint); ff-ez2 P0 stays probe-convention (statement-class); sha256(16) 24926ac4cbbcdd50; chartered-row append at landing (A3 unit 1 of 5). DATED CORRECTION (R1 2026-11-19): the 2026-11-18 clause "P1 STAY probe-convention" was WRONG — P1.lean is PROOF-CLASS (own header "PROOF ARTIFACT"; 7 decls = 6 public + 1 private; §7d's "AxPilotFFEZ2_P1 fires at sweep") and needs Step-B coverage; discharged via the BYTES-UNCHANGED CITATION branch (Pb/D.4 precedent) instead of a new stage: verdict of record = p1-run4.log (sorry-strict OK, FULL print surface 7/7 incl. `_private…density_of_all`, every record [propext, choice, Quot.sound] — `choice` = Classical.choice relativized by `open Classical`, log header note verified; bytes 9d8a7b1981faabce unchanged since 570f3e9 2026-11-17)
    ("AxPilot75_N2P0",    PILOTS / "75/N2-P0.lean"),  # 75-N2-P0 GREEN 15/15 triad n2-p0-run4 2026-11-17 (§10.12) — CLOSURE ROW added at the close-act sweep (2026-11-18) per FINAL-SWEEP-PLAN-ITER4 §7d's rewrite-map option: N2-P1 stages with the hyphenless `import N2P0` (the runner workaround), so the chain Pa → N2P0 → N2-P1 must resolve inside the stage; this row + EXTRA_REWRITES below do it; `import Pa` auto-rewrites to AxPilot75_Pa. ORDER CORRECTION (close-residue fix 2, R1 2026-11-19): the 2026-11-18 comment "sorted AxPilot75_Pa < AxPilot75_N2P0 respects the chain" was FALSE — 'N'(0x4E) < 'P'(0x50), so sorted-name order compiles N2P0 BEFORE Pa (run1's exact failure mode); dependency order now comes from the emitted order.txt (TARGETS list order, Pa is a C2-block row preceding every Iteration-4 row). Post-erratum bytes sha 1cf5cbe217c68564 (02a5d71 hnp erratum; the 14/14 core untouched — n2-p1-run20/21 chains compiled it GREEN)
    ("AxPilot75_N2P1",    PILOTS / "75/N2-P1.lean"),  # 75-N2-P1 (M1 closure + M2 + M3) GREEN-triad n2-p1-run19 2026-11-18 (14/14 file triad; §10.29) + **P2-a GREEN at run 26 (2026-11-19, R6 unit 3): `windowFinite_LFunction` (N2-P1.lean:738) PROVED-UNCONDITIONAL, 15/15 file decls triad, 0 sorry, 0 sorryAx** — `logs/n2-p1-run26.log`, wall 68 s, OVER=0; loop r20→r26 = 10→8→3→4*→11*→1→0 (* = failed-have unmaskings), zero math defects, argument unchanged since run 22; fired bytes = ff8b99e-committed sha ce6719c8af450eaa (820 LoC). STAGING: GIT_BYTES_OVERRIDES below pins the RUN-26 VERIFIED bytes (SUPERSEDES the run-19 pin ca1089e2 at the 2026-11-19 unit-4 fold — the iter-4 close basis stands as history); override tracks last-verified committed bytes, drops at sweep iff HEAD is then the verified state (N2-P3 work in flight). Census at ce6719c8: 27 decls = 14 public + 13 private (the 15/15 audit = the file's own print surface; privates direct-printed at sweep custody); Mathlib+N2P0 imports only
    ("AxPilot74_P1",      PILOTS / "74/P1.lean"),   # 74-P1 COMPLETION GREEN run 5/5 2026-11-18 (verify-fire held: SHA-GUARD TRAIL runs 1–5, run 5 fired sha256(16) 6ddbda11d5da4f35 = the final artifact; descent 29→10→10→4→0, zero sorry every run): **7/7 public theorems triad-only** (t1a_floor, t1b, t1b_window, t1c, cert_pad, Bk_le_Bk_succ, t4_floor_ceiling), 0 sorryAx; Mathlib-only import (no ordering constraint); ephemeral app crossmath-pilot-74p1 (73-clone warm-layer-shared recipe, doz route; one maxHeartbeats fix recorded); amended statements per the 4 FINDS, 8+1 signature classes (dossier amendment landed same batch)
    # --- 77 unit closed 2026-11-18 (A7, the last wave-3 blocker) — RULING: NO AxPilot77_T1
    #     row this iteration (the 74-precedent: rows land for GREEN finals; honest-stop
    #     files stay Step-A classifier-covered). State of record: T1-completion NOT-GREEN
    #     at budget (31→7 residuals honest stop, ZERO math failures, run-8 state carried,
    #     sha 3e6b50641990af9b, 817 LoC); T2 fresh file 7/8 triad-clean (the three
    #     Laughlin-instance theorems incl. pairHamiltonian_isParityBlock; ONE tainted
    #     decl `isDegreeBlock_iff_sum_blockProj` carries sorryAx via a filter-missed
    #     elaboration error — errors=0 but rc=1, the A4-run11 blind-spot class; T2 sha
    #     55107d0c6768fe34, 272 LoC). Step-B scope for 77 = NONE (classifier-only). ---
    #     **SUPERSEDED 2026-11-19 (R1 unit-5 fold): the iter-5 follow-up unit landed BOTH
    #     GREEN (R7, worktree agent-10; T1 run 11 8/8, T2 run 12 8/8 incl. the formerly
    #     tainted decl = the whole-tree 385/386 residual DISCHARGED) — the GREEN-completions
    #     condition of FINAL-SWEEP-PLAN-ITER5 §0's 77 slot is MET; the two rows below
    #     activate. Honest-stop history stands (the iter-4 rows above are CLOSED HISTORY).**
] + [
    # --- Iteration-5 additions (append-only block, opened 2026-11-19 by R1 unit 5;
    #     every row above is frozen history — the FINAL-SWEEP-ITER4 §0 on-landing
    #     duties apply here; probe-convention P0 files are NEVER Step-B stages) ---
    ("AxPilot77_T1",      PILOTS / "77/T1.lean"),   # 77 T1-COMPLETION GREEN run 11 (R7 iter-5 follow-up; logs/t1t2-run11.log): 8/8 top-level theorems triad-only incl. `map_iso_occupationElem` FIRST-CLEAN (element-level dictionary to tauceti's own `carOccupationElement`); burn-down 31→7→0 COMPLETE; sorry-strict rc=0, 0 errors, 0 sorry. GREEN bytes sha 70d7e9f75e705303 (840 LoC; census 52 = 12 pub + 40 priv — AxFC custody at sweep prints all). **DONOR-PIN CLASS — plain-batch FAIL BY DESIGN** (the M4b precedent): `import TauCeti.Algebra.Lie.GeneralLinear.{TraceForm,CAR.Occupation}` resolves only in the 77 runner's tauceti-pinned tree (tauceti @ d92acc5c, its own manifest mathlib 1b1ccf4b — the zeta23E own-lineage pattern), NEVER on the ff2494ea plain substrate; **verdict of record = the donor-pin run log**. Sweep-time guard: stage only if main bytes == 70d7e9f75e705303 (route to R7 otherwise). The runner's widened `: error(` filter (run_pilot.py @1434e832e889a1cb) = the SECOND instance of the 43d55bb filter-blind-spot class — cross-ref: this file's widened counters note (close residue 2026-11-19) + FINAL-SWEEP-PLAN-ITER4 §7d
    ("AxPilot77_T2",      PILOTS / "77/T2.lean"),   # 77 T2 GREEN run 12 (R7; logs/t2-run12.log): **8/8 top-level theorems triad-only incl. the FORMERLY-TAINTED `isDegreeBlock_iff_sum_blockProj`** (:82) — the whole-tree census's 1-of-386 residual DISCHARGED (iter-4 close basis 385/386 superseded by a 386/386-equivalent state on this landing; close-block pointer SPLICE:71 / RESEARCH.md:209 / STATUS:830). Root cause of the taint: `error(lean.synthInstanceFailed): failed to synthesize Fintype κ` — the drafted iff statement was ill-typed without **[Fintype κ]** (the statement-strengthening finding; only the iff gains the binder — the four other section theorems + three instances theorems signature-unchanged), missed by the old `": error:"`-only runner filter. GREEN bytes sha e70baf22d9ae220e (281 LoC; census 12 = 8 pub + 4 priv). **[WARM] class — Mathlib-only imports** (tauceti-SetLike stays a recorded extension condition, never imported): plain-batch stage fires normally; sweep-time guard: main bytes == e70baf22d9ae220e (route otherwise)
    ("AxPilot41_Core",    PILOTS / "41/Core.lean"), # 41-CORE GREEN run 9 (R4 iter-5 unit 2; logs/core-run9.log — the headline fold, R1 unit 6): 627 LoC, 31 decls ALL public (30 top-level theorems + 1 def); **GREEN-triad — 4 REFUTED-AS-UNIVERSAL (decide-certified, kernel `Decidable.decide` over the 4096-quad space: P1, P2, MainIdentity-as-Para, N′) + 26 CORRECTED-PROVED** (mainCor/mainStratum/qRigid/signs_anchor/alternation_fails_at_q_minus_one et al.); FOUR theorems at ZERO axioms (the deciders — 'does not depend on any axioms' ⊆ class), rest triad-or-leaner, 0 sorry/0 sorryAx. BYTES: run-9 FIRED sha 921bc43cbd06d252; on-disk 733b4a2d93a84689 = fired bytes + dated FIRED header block (elaboration-inert comment-only — the P0-record/A2.lean precedent) → **NO GIT_BYTES override (inert-delta class, HEAD stages fine; both shas recorded here + in the record)**. [WARM] — `import Mathlib` ONLY (§0 carries the P0 surface verbatim in-file; NO `import P0` → NO AxDep_41_P0 dep stage — the pre-stage question resolved). Budget disclosure: 9 runs (runs 5–8 = the universe-churn class: ONE theorem's auto-bound `Type*` plumbing, math certified from run 4), ≈9×60 s warm single-container, 2cpu/4GB HELD. Sweep guard: main bytes == 733b4a2d93a84689
    ("AxPilot74_P2",      PILOTS / "74/P2.lean"),   # 74-P2 G2 GREEN run 11 (R3 recharter, 2026-11-19; logs/p2-runs1-11.log — folded R1 unit 7): 1,063 LoC, 37 decls (9 pub + 28 priv — AxFC custody class per the pre-stage, privates direct-printed at sweep). **GREEN-triad — P2-a `mgfBound_var_sharp`** (varK ≤ 2v window-free on ANY positive window — the sharp variance constant, 4.5× over P1's window-edge 32(e^{1/4}−1)σ²≈9.06σ²) **+ P2-b `t1c_sharp`** (exact 1024·e·θ·B class constant under InSubGClass, pure instantiation of P2-a) — both exactly [propext, Classical.choice, Quot.sound]; rc=0, 0 errors, 0 sorry-warnings. G3 statement-probe PASS rides (famN + 3 Prop defs, elaboration-only — never proof claims); P2-c chartered-unexecuted, its ≤5 budget INTACT (no live P2-c row until GREEN). Bytes 49b808f33ba897cc (sha-guarded every run; maxHeartbeats 8M carried in the verbatim P1 body). Budget disclosure: chartered ≤5, used 11 — run 6 = process-error misfire OWNED (the P1 run-6 precedent class: fix-batch assert aborted pre-write, fired unverified), runs 7–10 = mechanical-residue fix-loop (4 classes + audit-tail qualification, every class named in-log; ZERO math defects), run 11 GREEN. [WARM] Mathlib-only. Must-cites + wording guard BINDING (R9 pre-gate, novelty/round6-74p2-pregate.md; P2.lean header carries verbatim): on-pin Mathlib/Probability/Moments/SubGaussian.lean EXISTS (the 2026-11-13 corpus-grep miss; no variance-equivalence theorem there — tilted-variance identity only inside Hoeffding's proof) + Mathlib/Probability/MGFAnalytic.lean:279; NEVER phrase "corpus has no SubGaussian". **P2-c PARKED FOLD (R1 unit 12, H batch-H): guard 49b808f3 → `4425be898768fdb0` (1,490 LoC, 55 decls = 16+39 priv) — run 17 FIRE-ONCE NOT-GREEN → PARKED wave-close** (`logs/p2c-run17.log`: 15 err = 2 real + 13 cascade, ZERO sorry; CLEARED: `t4_not_littleO` fully closed + both arg-shape sites + neg_neg; the ADJUDICATED nonneg-coefficient BkClass def of record elaborates; 2 parked sites in `famN_inClass`'s final chain, fixes stated in-log). **Sweep verdict class = HONEST-PARTIAL until the wave-close GREEN**
    ("AxPilot10_MArc",    PILOTS / "10/M-arc.lean"), # 10-D4 M-arc assembly FINAL-GREEN run 2 (R3, day-1, landed `e309edd`; `M-arc-record.md` + `logs/marc-run1.log`, both runs w/ provenance): rc=0, 0 sorry — `exists_tm_padded_space` machine-layer assembly with `hv` SUPPLIED-AS-BINDER (the orchestrator's two-true-forms ruling); 4,327 LoC = header + L5 VERBATIM + Part M (51). **SINGLE-ANCHOR class (the `AxPilot10_L5` precedent; FINAL-SWEEP-PLAN-ITER5 §0's recommendation, orchestrator ruling 2026-11-18)**: L5 is EMBEDDED, not imported → NO AxDep stage; one row covers the tranche's final theorem state, earlier rungs stay §-historical citations. [WARM] Mathlib-only. Sweep guard: main bytes == `7addcf0029ea06e7`. Billing: plumbing/completion-value, never novelty (the in-record ruling); Step-A: prose-header hits only, 0 real tokens (the ENTRY-1 day-1 class). Row added 2026-11-20 by lane R2 (dry-run OWED-list discharge; edit base = main @ `a6ad33d` bytes `00236246`)
    ("AxPilot41_H2",      PILOTS / "41/H2.lean"),   # 41-(H) TRANCHE-2 COMPLETE, GREEN closing state (R4, batch-P `c25bf25`; `H-record.md` `f21b07f3`; 11 runs): on-disk `3bc8170121492d18` = fired `9534383949a6ac0c` + comment-only note (**INERT-DELTA class — NO GIT_BYTES override**, both shas of record). `h2-run11` certificates: `sigmaOrth : [propext]`, `sigmaExpand_basis : [propext]`, `sigmaExpand : [propext, Classical.choice, Quot.sound]`, `rank_obstruction_nogo : [propext, Classical.choice, Quot.sound]` — 0 sorryAx anywhere in the block (spot-verified at the run log by R2's S1–S4 pass `ace8bd28`); **the 3-strand TL host hypothesis CLOSED FALSE** (the 41H negative; BANK-AS-NEGATIVE ruling 2026-11-19, quota-free — the article surface is `articles/41H-tl-realizability-transport.md` @ splice-2 `cc71841`; THIS row is the kernel-evidence stage). [WARM] `import Mathlib` ONLY (H2.lean:60; ZERO tauceti imports — donor-discipline verified on the landed bytes by R2); full decl census at sweep custody. Sweep guard: main bytes == `3bc8170121492d18`. Row added 2026-11-20 by lane R2 (dry-run OWED-list discharge; edit base = main @ `a6ad33d` bytes `00236246`)
]


def theorem_full_names(src: str):
    # scope stack: namespace names, or None for a (possibly noncomputable) section, so a
    # section's `end` does not pop the enclosing namespace
    ns, out = [], []
    depth = 0  # block-comment nesting (/- … -/); docstring prose can start with "theorem"
    for line in src.splitlines():
        s = line.strip()
        if depth > 0 or s.startswith("/-"):
            depth += line.count("/-") - line.count("-/")
            continue
        m = re.match(r"^(?:public\s+)?namespace\s+([A-Za-z0-9_.]+)", s)
        if m:
            ns.append(m.group(1))
            continue
        if re.match(r"^(?:noncomputable\s+)?(?:public\s+)?section\b", s):
            ns.append(None)
            continue
        if re.match(r"^end\b", s):
            if ns:
                ns.pop()
            continue
        m = re.match(r"^(?:@\[[^\]]*\]\s+)*(?:private\s+)?theorem\s+([^\s:({\[]+)", s)
        if m and not s.startswith("private"):
            out.append(".".join([n for n in ns if n] + [m.group(1)]))
    return out


def main(outdir, only=None):
    import subprocess
    outdir = Path(outdir)
    outdir.mkdir(parents=True, exist_ok=True)
    # generalized sibling-import rewrite (Cycle-2 fix, 2026-11-14): every target whose
    # source module stem differs from its stage name gets ^import <stem>$ rewritten to
    # the stage name — subsumes the old P11T1/P11T2 regex and covers 11/RedTm2's
    # `import P11T3` -> `import AxPilot11_P11T3`. Built from ALL TARGETS (subset runs
    # still rewrite correctly — but a subset must include its dependency closure to
    # elaborate; dependency order now comes from the emitted order.txt, close-residue
    # fix 2: the pre-2026-11-19 assumption that sorted stage names keep every chain
    # ahead of its consumer was FALSE for the 75 chain, 'N' < 'P' sorts N2P0 first).
    AMBIGUOUS_STEMS = {"P0"}  # close-residue fix 1: al3d/P0.lean AND 78/P0.lean share
    # the stem; dict-last-wins silently rewrote al3d consumers' `import P0` to
    # AxPilot78_P0 (run1's A1/A2 failure). No stage file legitimately imports a bare
    # `P0` expecting the GLOBAL map — the al3d route is stage-scoped below, and
    # 78/P0.lean imports only Mathlib.
    rewrites = {p.stem: name for name, p in TARGETS
                if p.stem != name and p.stem not in AMBIGUOUS_STEMS}
    # EXTRA_REWRITES (close-act sweep 2026-11-18; made STAGE-SCOPED by close-residue
    # fixes 1+3, R1 2026-11-19): hyphenless/ambiguous module names that occur as
    # imports but must be routed per-consumer (the run_n2p1.py workaround class —
    # it stages N2-P0.lean AS module `N2P0`; the al3d P0 stem collision above).
    EXTRA_REWRITES = {
        "AxPilot75_N2P1": {"N2P0": "AxPilot75_N2P0"},
        "AxPilotAL3D_A1": {"P0": "AxPilotAL3D_P0"},
        "AxPilotAL3D_A2": {"P0": "AxPilotAL3D_P0"},
    }
    # COMPILE-ONLY dep stages (close-residue fix 1): staged verbatim, NO #print tail,
    # never a verdict row (probe-convention bytes; the stage exists so the engine's
    # `-o` emission puts its olean on the search path for its consumers).
    COMPILE_ONLY = {"AxPilotAL3D_P0"}
    # GIT_BYTES_OVERRIDES (close-residue fix 3, A1 pre-registered flag §10.29
    # addendum): stages whose bytes of record are a COMMITTED REV, not HEAD —
    # N2-P1's HEAD bytes carried the paused P2-a block (unfired fixes-on-disk) and
    # must not be staged; the run-19 FINAL bytes were the close basis.
    # SUPERSEDED 2026-11-19 (R1 unit-4 fold, per the orchestrator re-task): the
    # override now pins the RUN-26 VERIFIED P2-a STATE — ff8b99e-committed bytes
    # sha ce6719c8af450eaa (P2-a `windowFinite_LFunction` GREEN, 15/15 triad,
    # `logs/n2-p1-run26.log`; run-19 pin ca1089e2 is historical). OVERRIDE RULE
    # (amended same fold, FINAL-SWEEP-PLAN-ITER5 §0): the override TRACKS the last
    # verified committed bytes and moves forward at each verified landing (never to
    # an unverified HEAD); it DROPS at sweep time iff the then-HEAD bytes are
    # themselves the last run's verified bytes (active-pilot protection — N2-P3
    # work is in flight and may touch this file again).
    GIT_BYTES_OVERRIDES = {
        "AxPilot75_N2P1": ("ff8b99e", "research/pilots/75/N2-P1.lean",
                           "ce6719c8af450eaa"),  # expected sha256(16); fail loud on drift
    }
    REPO = PILOTS.parents[1]
    selected = [(name, path) for name, path in TARGETS if not only or name in only]
    for name, path in selected:
        if name in GIT_BYTES_OVERRIDES:
            rev, rel, want = GIT_BYTES_OVERRIDES[name]
            r = subprocess.run(["git", "-C", str(REPO), "show", f"{rev}:{rel}"],
                               capture_output=True, text=True, check=True)
            src = r.stdout
            import hashlib
            got = hashlib.sha256(src.encode()).hexdigest()[:16]
            if got != want:
                raise SystemExit(f"{name}: git-bytes sha guard FAILED — {rev}:{rel} "
                                 f"hashes {got}, expected {want}; refusing to stage")
            print(f"{name}: staged from git bytes {rev}:{rel} (sha256(16) {got} verified)")
        else:
            src = path.read_text()
        stage_rewrites = dict(rewrites)
        stage_rewrites.update(EXTRA_REWRITES.get(name, {}))
        for stem, stage in stage_rewrites.items():
            src = re.sub(rf"^import {re.escape(stem)}$", f"import {stage}", src, flags=re.M)
        if name in COMPILE_ONLY:
            header = (f"/- axcheck compile-only dep stage (close residue 2026-11-19): verbatim copy of\n"
                      f"   {path}; NO #print axioms appended — this stage exists solely so the engine's\n"
                      f"   olean emission feeds its consumers' `import`; never a verdict row\n"
                      f"   (probe-convention class). Repo file untouched. -/\n")
            (outdir / f"{name}.lean").write_text(header + src + "\n")
            print(f"{name}: compile-only dep stage (0 theorem prints by design)")
            continue
        names = theorem_full_names(src)
        tail = "\n".join(f"#print axioms {n}" for n in names)
        header = (f"/- axcheck appendum (final sweep 2026-11-09): verbatim copy of {path} with\n"
                  f"   #print axioms on all {len(names)} top-level theorems; repo file untouched. -/\n")
        (outdir / f"{name}.lean").write_text(header + src + "\n" + tail + "\n")
        print(f"{name}: {len(names)} theorems -> {', '.join(names[:4])}{' …' if len(names) > 4 else ''}")
    # order.txt (close-residue fix 2, R1 2026-11-19): dependency-ordered emission list
    # for axcheck_probe.py — TARGETS list order IS dependency order (C2 block rows
    # precede Iteration-4 rows; each block's chains are listed deps-first: P11T1<T2,
    # 73_C<Q4, LP_L1<L2, AL3D_P0<A1<A2, 75_Pa<N2P0<N2P1). The engine reads order.txt
    # when present and falls back to sorted names otherwise (back-compat).
    order = [f"{name}.lean" for name, _ in selected]
    (outdir / "order.txt").write_text("\n".join(order) + "\n")
    print(f"order.txt: {len(order)} stage(s) in TARGETS dependency order")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "/tmp/crossmath-axcheck-stage",
         set(sys.argv[2:]) or None)
