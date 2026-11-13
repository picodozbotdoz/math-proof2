#!/usr/bin/env python3
"""Build axcheck stage copies: pilot file + appended `#print axioms` lines for
every top-level theorem (namespace-aware, full names). Output dir: argv[1]."""
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
        m = re.match(r"^(?:private\s+)?theorem\s+([^\s:({\[]+)", s)
        if m and not s.startswith("private"):
            out.append(".".join([n for n in ns if n] + [m.group(1)]))
    return out


def main(outdir, only=None):
    outdir = Path(outdir)
    outdir.mkdir(parents=True, exist_ok=True)
    for name, path in TARGETS:
        if only and name not in only:
            continue
        src = path.read_text()
        # rewrite the sibling import P11T1 -> AxP11T1 (staged module name)
        src = re.sub(r"^import (P11T[12])$", r"import Ax\1", src, flags=re.M)
        names = theorem_full_names(src)
        tail = "\n".join(f"#print axioms {n}" for n in names)
        header = (f"/- axcheck appendum (final sweep 2026-11-09): verbatim copy of {path} with\n"
                  f"   #print axioms on all {len(names)} top-level theorems; repo file untouched. -/\n")
        (outdir / f"{name}.lean").write_text(header + src + "\n" + tail + "\n")
        print(f"{name}: {len(names)} theorems -> {', '.join(names[:4])}{' …' if len(names) > 4 else ''}")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "/tmp/crossmath-axcheck-stage",
         set(sys.argv[2:]) or None)
