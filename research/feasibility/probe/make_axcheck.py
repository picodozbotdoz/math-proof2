#!/usr/bin/env python3
"""Build axcheck stage copies: pilot file + appended `#print axioms` lines for
every top-level theorem (namespace-aware, full names). Output dir: argv[1]."""
import re
import sys
from pathlib import Path

PILOTS = Path("/home/doz/zcode-workdir/cross-math-fronttier/research/pilots")

# (stage name, source) in elaboration order (P11T1 before P11T2: import dep)
TARGETS = [
    ("AxP11T1", PILOTS / "11/P11T1.lean"),
    ("AxP11T2", PILOTS / "11/P11T2.lean"),
    ("AxPilot42_M1", PILOTS / "42/M1.lean"),
    ("AxPilot50_M1", PILOTS / "50/M1.lean"),
    ("AxPilot50_Dirichlet", PILOTS / "50/Dirichlet.lean"),
    ("AxPilot52_M1", PILOTS / "52/M1.lean"),
    ("AxPilot10_M1", PILOTS / "10/M1.lean"),
]


def theorem_full_names(src: str):
    ns, out = [], []
    for line in src.splitlines():
        s = line.strip()
        m = re.match(r"^(?:public\s+)?namespace\s+([A-Za-z0-9_.]+)", s)
        if m:
            ns.append(m.group(1))
            continue
        if re.match(r"^end\b", s):
            if ns:
                ns.pop()
            continue
        m = re.match(r"^(?:private\s+)?theorem\s+([A-Za-z0-9_?!']+)", s)
        if m and not s.startswith("private"):
            out.append(".".join(ns + [m.group(1)]))
    return out


def main(outdir):
    outdir = Path(outdir)
    outdir.mkdir(parents=True, exist_ok=True)
    for name, path in TARGETS:
        src = path.read_text()
        # rewrite the sibling import P11T1 -> AxP11T1 (staged module name)
        src = re.sub(r"^import P11T1$", "import AxP11T1", src, flags=re.M)
        names = theorem_full_names(src)
        tail = "\n".join(f"#print axioms {n}" for n in names)
        header = (f"/- axcheck appendum (R9 2026-11-09): verbatim copy of {path} with\n"
                  f"   #print axioms on all {len(names)} top-level theorems; repo file untouched. -/\n")
        (outdir / f"{name}.lean").write_text(header + src + "\n" + tail + "\n")
        print(f"{name}: {len(names)} theorems -> {', '.join(names[:4])}{' …' if len(names) > 4 else ''}")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "/tmp/crossmath-axcheck-stage")
