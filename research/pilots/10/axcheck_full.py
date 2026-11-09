#!/usr/bin/env python3
"""Pilot 10 (2026-11-10): full-coverage axcheck copy of a pilot file.

Appends `#print axioms` for EVERY non-private theorem (dotted names and `@[simp]`
ones included), namespace-aware. Complements feasibility/probe/make_axcheck.py,
whose theorem regex captures only the first component of dotted names
(`Frag.seq_runs` -> `Frag`) and skips `@[simp] theorem` lines.

usage: axcheck_full.py <pilot.lean> <out.lean>
"""
import re
import sys
from pathlib import Path

src = Path(sys.argv[1]).read_text()
ns, names = [], []
for line in src.splitlines():
    s = line.strip()
    m = re.match(r"^namespace\s+([A-Za-z0-9_.]+)", s)
    if m:
        ns.append(m.group(1))
        continue
    if re.match(r"^end\b", s):
        if ns:
            ns.pop()
        continue
    m = re.match(r"^(?:@\[[^\]]*\]\s+)?theorem\s+([A-Za-z0-9_?!'.₀-₉]+)", s)
    if m:
        names.append(".".join(ns + [m.group(1)]))
hdr = (f"/- full axcheck copy of {sys.argv[1]}: #print axioms on all {len(names)} "
       f"non-private theorems -/\n")
Path(sys.argv[2]).write_text(hdr + src + "\n" + "\n".join(f"#print axioms {n}" for n in names) + "\n")
print(len(names))
