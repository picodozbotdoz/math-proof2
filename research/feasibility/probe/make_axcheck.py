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
    ("AxPilot42_M4b",     PILOTS / "42/M4b.lean"),     # under upgrade edit; re-staged at sweep run
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
    ("AxPilotAL3D_A1",    PILOTS / "al3d/A1.lean"),  # AL-P1 GREEN alp1-final 2026-11-16 (22 decls; inline audit prints 20 — Step-B full-coverage prints all 22); al3d/P0 EXCLUDED (probe-convention)
    ("AxPilot75_Pb",      PILOTS / "75/Pb.lean"),   # 75-Pb GREEN pb-run11-final 2026-11-16 (89 decls = Pa carry + E1-E6 + Pb-1/2/3; inline tails print 32 — Step-B full-coverage prints all 89); Mathlib-only, self-contained carry
    ("AxPilotAL3D_A2",    PILOTS / "al3d/A2.lean"), # AL-P2 m1 GREEN alp2-run7-m1green 2026-11-17 (2 theorems triad; 3 Equiv defs carry no status); import A1 auto-rewritten; al3d/P0 stays EXCLUDED (probe)
    ("AxPilot72_M1_T3",   PILOTS / "72-M1/P72M1T3.lean"),  # L3a GREEN l3a-run6-GREEN + print-gap CLOSED axcheck-l3a-run1 (9/9 direct triad) 2026-11-17; mid-tranche: L3b-d + interface still owed — file GROWS, re-stage at sweep (sha fe57d30b19d9 at L3a); import P72M1T2 auto-rewritten
    ("AxPilot32_M2",      PILOTS / "32/M2.lean"),   # 32-crossing FINAL-GREEN run12-crossing-existence 2026-11-17 (lane A6; 7 new theorems triad :60-:66; self-contained frozen-M1 carry, import Mathlib only, NO rewrite needed; row from A6's run12-discharge-note §4). INERT until H commits A6's batch (M2.lean in agent-07 at prep).
    # --- Step-B(i) TARGETS pre-stage (H, 2026-11-18, per close-act runbook §3 Step 8;
    #     landing-independent rows only) ---
    ("AxPilot73_Q4",      PILOTS / "73/Q4.lean"),   # 73-Q4 FINAL-GREEN q4-run15-green 2026-11-17 (hRat discharged, (P)(i) unconditional; ALL decls triad per §10.18 + 8 C.lean frozen-layer regression prints); `import C` auto-rewritten to AxPilot73_C (sorted order C < Q4 respects the dependency); other imports Mathlib-only — the sweep-plan :175 "verify Mathlib-only imports at landing" check DISCHARGED at pre-stage
    ("AxPilot78_P0",      PILOTS / "78/P0.lean"),   # 78 Stage-A refutation, PROOF-CLASS (A1+A2+A2′ PROVED-UNCONDITIONAL triad, p0-run4 2026-11-17 — article-78's carrier; runbook §3 Step 8 lists it explicitly; A9 checklist :147 "deferred Stage-B family" branch REGISTERED here); `import Mathlib` only; Step-B(i) prints the 3 PUBLIC theorems — the private census (23) belongs to Step-B(ii) axcheck_iter4 custody staging
    ("AxPilot10_L5",      PILOTS / "10/L5.lean"),   # 10-D-tranche FINAL (orchestrator ruling 2026-11-18: SINGLE row — L5.lean embeds L4/L3 VERBATIM, full D1–D3 theorem coverage at least compile cost; L3/L4 keep §10 citations as historical rungs; the sweep audits FINAL state = L5); D3 GREEN d3-run1 2026-11-17 (L5 = D3 header + L4 verbatim [D2 FINAL, sha 4ae0d643…] + Part H); Mathlib-only import; sorted after AxPilot10_L2
    # --- Five-unit proof-class finals — PLACEHOLDERS ONLY (rows appended on each unit's
    #     LANDING commit per close-act runbook §3 Step 8; expected stage names): ---
    ("AxPilotFFEZ2_P2",   PILOTS / "ff-ez2/P2.lean"),  # FF-EZ2-P2 FINAL-GREEN p2-run2 2026-11-18 (2/≤3 fix-loop; sorry-strict OK, 9/9 triad-only incl. 5 private, 0 sorryAx; telemetry mem OVER=1 = documented mmapped-olean class) — the descope-closure rung, PROOF-CLASS per runbook Step 8; Mathlib-only import (no ordering constraint); ff-ez2 P0/P1 STAY probe-convention (statement-class); sha256(16) 24926ac4cbbcdd50; chartered-row append at landing (A3 unit 1 of 5)
    # --- remaining four-unit finals — PLACEHOLDERS (rows appended on each unit's
    #     landing commit per close-act runbook §3 Step 8): ---
    # AxPilotAL3D_A2 re-stage at sweep = bytes of record (row above) OR new AxPilotAL3D_A3 row if pilots/al3d/A3.lean appears (A4)
    # AxPilot77_T1 (pilots/77/T1.lean on disk, in flight; T2 file TBD) (A7)
    # AxPilot74_P1 (pilots/74/P1.lean on disk, in flight; verify-fire discipline) (A8)
    # AxPilot75_N2P1 final (pilots/75/N2-P1.lean on disk, in flight) + M2/M3 final files TBD (A5)
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
    outdir = Path(outdir)
    outdir.mkdir(parents=True, exist_ok=True)
    # generalized sibling-import rewrite (Cycle-2 fix, 2026-11-14): every target whose
    # source module stem differs from its stage name gets ^import <stem>$ rewritten to
    # the stage name — subsumes the old P11T1/P11T2 regex and covers 11/RedTm2's
    # `import P11T3` -> `import AxPilot11_P11T3`. Built from ALL TARGETS (subset runs
    # still rewrite correctly — but a subset must include its dependency closure to
    # elaborate; sorted stage names keep every chain ahead of its consumer).
    rewrites = {p.stem: name for name, p in TARGETS if p.stem != name}
    selected = [(name, path) for name, path in TARGETS if not only or name in only]
    for name, path in selected:
        src = path.read_text()
        for stem, stage in rewrites.items():
            src = re.sub(rf"^import {re.escape(stem)}$", f"import {stage}", src, flags=re.M)
        names = theorem_full_names(src)
        tail = "\n".join(f"#print axioms {n}" for n in names)
        header = (f"/- axcheck appendum (final sweep 2026-11-09): verbatim copy of {path} with\n"
                  f"   #print axioms on all {len(names)} top-level theorems; repo file untouched. -/\n")
        (outdir / f"{name}.lean").write_text(header + src + "\n" + tail + "\n")
        print(f"{name}: {len(names)} theorems -> {', '.join(names[:4])}{' …' if len(names) > 4 else ''}")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "/tmp/crossmath-axcheck-stage",
         set(sys.argv[2:]) or None)
