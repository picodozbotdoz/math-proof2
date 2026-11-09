#!/usr/bin/env python3
"""OAI statement def-chain closure analysis (text-level, no Lean).

For each target file: BFS over `import X` lines; classify X by prefix
(OAI.* / TauCeti.* / Mathlib* / other); stop at non-OAI/non-TauCeti leaves.
Reports: reachable file count + LoC per prefix, max BFS depth, and the
first three BFS levels (what a statement port pulls in immediately).
"""
import sys
from pathlib import Path

ROOT = Path("/home/doz/zcode-workdir/openai-math/lean")


def imports_of(rel: str):
    p = ROOT / rel
    if not p.exists():
        return None, []
    out = []
    for line in p.read_text(errors="replace").splitlines():
        s = line.strip()
        if s.startswith("import "):
            mod = s[len("import "):].strip()
            out.append(mod)
    return p, out


def to_path(mod: str):
    if mod in ("Init", "Lean", "Lake", "Std", "Batteries"):
        return None
    if mod.startswith(("Mathlib", "Init", "Lean", "Lake", "Std", "Batteries")):
        return None
    if mod.startswith("OAI."):
        rel = "OAI/" + mod[4:].replace(".", "/") + ".lean"
    elif mod.startswith("TauCeti."):
        rel = "../tauceti/TauCeti/" + mod[len("TauCeti."):].replace(".", "/") + ".lean"
    else:
        return None
    p = ROOT / rel
    return rel if p.exists() else None


def closure(target_rel: str):
    seen = {target_rel}
    frontier = [(target_rel, 0)]
    levels = {}
    while frontier:
        rel, d = frontier.pop(0)
        p, mods = imports_of(rel)
        if p is None:
            continue
        levels.setdefault(d, set())
        for m in mods:
            nxt = to_path(m)
            if nxt and nxt not in seen:
                seen.add(nxt)
                levels.setdefault(d + 1, set()).add(nxt)
                frontier.append((nxt, d + 1))
    return seen, levels


def main():
    targets = {
        "T1 quasi-RH (Nonvanishing.lean)":
            "OAI/NumberTheory/DirichletL/Nonvanishing.lean",
        "T2a omega defs (Model.lean)":
            "OAI/LinearAlgebra/MatrixMultiplication/Model.lean",
        "T2b omega bound (Witness.lean)":
            "OAI/LinearAlgebra/MatrixMultiplication/Rectangular/Witness.lean",
        "T3 SubexponentialSAT (SqrtLogSpace/Final.lean)":
            "OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean",
    }
    for name, rel in targets.items():
        seen, levels = closure(rel)
        oai = sorted(s for s in seen if s.startswith("OAI/"))
        tauc = sorted(s for s in seen if not s.startswith("OAI/"))
        loc_oai = sum(len((ROOT / s).read_text(errors="replace").splitlines()) for s in oai)
        loc_tauc = sum(len((ROOT / s).read_text(errors="replace").splitlines()) for s in tauc)
        print(f"\n### {name}")
        print(f"root: {rel}")
        print(f"OAI closure:     {len(oai)} files, {loc_oai} LoC")
        print(f"TauCeti closure: {len(tauc)} files, {loc_tauc} LoC")
        print(f"max BFS depth:   {max(levels)}")
        for d in (1, 2, 3):
            if d in levels:
                files = sorted(levels[d])
                show = files if len(files) <= 8 else files[:8] + [f"… +{len(files)-8}"]
                print(f"level {d} ({len(files)}): " + ", ".join(show))
        print(f"all OAI files ({len(oai)}):")
        for s in oai:
            print("   ", s)


if __name__ == "__main__":
    main()
