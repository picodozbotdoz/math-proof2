#!/usr/bin/env python3
"""Build axcheck stage copies for pilot 72-M1 (lane A8, 2026-11-14): pilot file +
appended `#print axioms` for every top-level theorem. Local variant of
research/feasibility/probe/make_axcheck.py (A1's frozen TARGETS list is NOT touched;
on sweep A1 adds AxPilot72_M1 per the landing note there). Extension over the
make_axcheck regex: attribute-prefixed theorems (`@[simp] theorem …`, `@[ext] …`)
are also captured — P72M1T1's donor-verbatim layer carries several.

Usage: python3 make_axcheck72m1.py <outdir>
"""
import re
import sys
from pathlib import Path

PILOTS = Path("/home/doz/zcode-workdir/cross-math-fronttier/research/pilots")
TARGETS = [
    ("AxPilot72_M1_T1", PILOTS / "72-M1/P72M1T1.lean"),
    ("AxPilot72_M1_T2", PILOTS / "72-M1/P72M1T2.lean"),
]


def theorem_full_names(src: str):
    ns, out = [], []
    depth = 0
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


def main(outdir):
    outdir = Path(outdir)
    outdir.mkdir(parents=True, exist_ok=True)
    rewrites = {p.stem: name for name, p in TARGETS if p.stem != name}
    for name, path in TARGETS:
        src = path.read_text()
        for stem, stage in rewrites.items():
            src = re.sub(rf"^import {re.escape(stem)}$", f"import {stage}", src,
                         flags=re.M)
        names = theorem_full_names(src)
        tail = "\n".join(f"#print axioms {n}" for n in names)
        header = (f"/- axcheck appendum (pilot 72-M1, 2026-11-14): verbatim copy of "
                  f"{path} with #print axioms on all {len(names)} top-level theorems "
                  f"(incl. attribute-prefixed); repo file untouched. -/\n")
        (outdir / f"{name}.lean").write_text(header + src + "\n" + tail + "\n")
        print(f"{name}: {len(names)} theorems")


if __name__ == "__main__":
    main(sys.argv[1] if len(sys.argv) > 1 else "/tmp/crossmath-axcheck72m1-stage")
