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
    ("AxPilotAL3D_A2",    PILOTS / "al3d/A2.lean"), # AL-P2 FINAL-for-iteration-4 (A4 closure-stamp 2026-11-18 per A2-gaps §7): **P2-c CLOSED 100%** — run13 verify-fire sha-guarded (`alp2-run13-p2c-closureverify.log`, guard `509f2368…` pre=post): A2.lean OK rc=0, 0 errors (open or hidden), 0 sorry, full-coverage inline audit triad-only; header stamp added post-verification (final-tree sha `6a5ed555…`; proof bytes = run13-verified). P2-d partial parked at find #5 → iter-5 canonical z-rank rebuild (A2-gaps §5); P2-e rides it. Stage per §7: P0 first (probe), then A1, then this row; `import A1` auto-rewritten to AxPilotAL3D_A1
    ("AxPilot72_M1_T3",   PILOTS / "72-M1/P72M1T3.lean"),  # L3a GREEN l3a-run6-GREEN + print-gap CLOSED axcheck-l3a-run1 (9/9 direct triad) 2026-11-17; mid-tranche: L3b-d + interface still owed — file GROWS, re-stage at sweep (sha fe57d30b19d9 at L3a); import P72M1T2 auto-rewritten
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
    ("AxPilot75_N2P1",    PILOTS / "75/N2-P1.lean"),  # 75-N2-P1 FINAL (M1 closure + M2 + M3) GREEN-triad n2-p1-run19 2026-11-18 (rc=0, 0 errors, 0 sorry tokens; **14/14 file triad** incl. M1 7/7, M2 `heckeTsum_eq_ratCharOf_LFunction`, M3 `hasQDirichletDictionary` = N2-a DISCHARGED + `dirichletFactorizationTransfer`); run-15 bytes sha 2e5217010e46ad0d (verify-fire), run-19 FINAL sha ca1089e2a0c122c4 (§10.29). CLOSE-RESIDUE STAGING RULE (fix 3, A1 pre-registered flag, §10.29 addendum): the STAGED BYTES ARE THE RUN-19 COMMITTED BYTES `git show 3ad896b:research/pilots/75/N2-P1.lean` (GIT_BYTES_OVERRIDES below; sha-guarded ca1089e2a0c122c4) — current-HEAD bytes carry the PAUSED P2-a block (§10.29 addendum; ecd44c6a… unfired fixes-on-disk) and must NEVER be the staged bytes. Compatibility with the post-erratum N2P0 dep verified: the run-19 theorem `dirichletFactorizationTransfer` states the corrected hnp shape INLINE (own binder, :654) and consumes only P0 defs the 02a5d71 erratum did not touch (it changed `DirichletFactorizationTransferQ`'s def alone, which N2-P1 references only in docstring prose :112/:644); Mathlib+N2P0 imports only
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
    # N2-P1's HEAD bytes carry the paused P2-a block (unfired fixes-on-disk) and
    # must not be staged; the run-19 FINAL bytes are the close basis.
    GIT_BYTES_OVERRIDES = {
        "AxPilot75_N2P1": ("3ad896b", "research/pilots/75/N2-P1.lean",
                           "ca1089e2a0c122c4"),  # expected sha256(16); fail loud on drift
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
