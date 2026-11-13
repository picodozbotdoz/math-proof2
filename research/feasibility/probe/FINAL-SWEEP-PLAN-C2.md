# FINAL-SWEEP-PLAN-C2 — Cycle-2 mechanical close-out (PREP ONLY — execute on the orchestrator's final signal)

Lane A1, 2026-11-13 (queue item 1). Adaptation of the main run's
`research/feasibility/probe/FINAL-SWEEP-PLAN.md` (R9, read first — same two-step
discipline, same OK/FAIL routing). **Do not execute before the orchestrator signals that
the Cycle-2 pilot lanes have reported final.** Run from repo root
`/home/doz/zcode-workdir/cross-math-fronttier`; budget ~10–15 min (one warm Modal batch +
local sweeps).

Cross-check already banked (queue item 2): A7's G1b direct-build verdict (DZDF FAIL —
vendored CFT breaks vs `ff2494ea`, 62 unique errors / 11 modules, 648/29261 jobs before
saturation; `feasibility/axiommath-donor-probes.md` §G1b) **agrees with** the CFT-vendor
survey's §(c) prediction (v4.35-era source vs post-drift mathlib, unmeasured 1658-file
surface; `survey/axiommath-cft-vendor.md` §(c)) — same diagnosis, no discrepancy. G1
consumption for 50-M2-R2 stays statement-level-only.

## 0 Scope — Cycle-2 TARGETS

| Pilot | Files (expected final set) | Status at prep (2026-11-13) | Notes |
|---|---|---|---|
| 42 (M4 donor swap) | `M4a.lean`, `M4b.lean` (+ `M4a-note.md`) | on disk | proof artifacts; also already-swept `M1/M2a/M2b/M3` stay in TARGETS unchanged |
| 71 (FF-EZ1) | `P0.lean` (statement layer), `P1.lean` (dictionary), `P2.lean` (pending, A2/A6) | P0+P1 on disk; P2 pending | **P0 is probe-convention** (header `pilots/71/P0.lean:10–20`, "NOT A PROOF ARTIFACT") — Step A only, never Step B; P1 header declares "proof artifact: no `sorry`" |
| 73 (FF C-series) | C-series files | **no dir yet** (`73-prework.md` only) | add on landing; classify per lane report (statement vs proof) |
| 72 (area-law) | `C-neg.lean` (on disk), `M1.lean` (A8, pending) | partial | C-neg is a proof artifact per A8's plan |
| 10 (L1/L2) | `L1.lean`, `L2.lean` (+ `M1.lean`) | on disk | L1 already in make_axcheck TARGETS; **L2 new**; M1 swept in the resume session |
| 11 (M2) | `P11T3.lean`, `RedTm2.lean` | on disk, **not yet in TARGETS** | confirm final-vs-scratch with the lane before including |
| 52 / 20 | `M1`s | **already clean** | final-swept in the 2026-11-09 resume session (30/30 staged files OK, 0 sorryAx — `feasibility/VERIFICATION-LEDGER.md` §1, §6–§7); include in the re-run for drift-check only |

## 1 Baseline sorry-token certificate (2026-11-13, pre-final — re-run at execution)

Classifier = the main-run script **upgraded** for two Cycle-2 realities: (i) lines inside a
file's leading `/- … -/` docstring block are prose (the R9 script missed
docstring-interior lines like `ProbeG1_DZDF.lean:12` and `pilots/71/P0.lean:15`);
(ii) scope adds `feasibility/probe/ProbeG*.lean` and the C2 pilot files.

| classification | files | real tokens |
|---|---|---|
| KEPT-ARTIFACT-OK (0 real tokens) | all main-run pilot files (unchanged from R9 §1) + C2 proof artifacts on disk: `42/M4a`, `42/M4b`, `71/P1`, `72/C-neg`, `10/L1`, `10/L2`, `11/P11T3`, `11/RedTm2` | 0 |
| PROBE-CONVENTION (header-justified) | R9's 9 (B1 ×3, B2 ×1, C1 ×1, D ×4) + **G-series 23** (G1 ×4, G2 ×1, G3 ×1, G4 ×4, G5a ×1, G5b ×6, G5c ×4, G7 ×2) + **`pilots/71/P0.lean` ×4** (statement placeholders inside its own NOT-A-PROOF header at :10–20) | 36 |
| PENDING (lane still active) | `71/P2`, `73/*`, `72/M1` | — |
| VIOLATION-UNEXPLAINED | none | 0 |

## 2 Step A — sorry-token re-run (expected: exactly the 36 tokens of §1 — enumerated in the pre-baseline run, tested)

```bash
cd /home/doz/zcode-workdir/cross-math-fronttier/research && python3 -I - << 'EOF'
import re
from pathlib import Path
files = sorted(list(Path("pilots").rglob("*.lean")) + list(Path("feasibility/probe").rglob("*.lean")))
PROSE = re.compile(r"sorry-free|no `?sorry`?|0 sorry|sorryAx|sorry'd|[Tt]he sorry|replaced by sorry|uses `sorry`|forbidding sorry|sorry token", re.I)
for f in files:
    lines = f.read_text(errors="replace").splitlines()
    # docstring-interior lines are prose (ANY /- ... -/ block, not only leading ones)
    doc = set(); in_doc = False
    for i, l in enumerate(lines):
        s0 = l.strip()
        if in_doc:
            doc.add(i + 1)
            if s0.endswith("-/"): in_doc = False
        elif s0.startswith("/-"):
            doc.add(i + 1)
            if not s0.endswith("-/"): in_doc = True
    for i, line in enumerate(lines, 1):
        s = line.strip()
        if not re.search(r"\bsorry\b", line): continue
        if i in doc or s.startswith(("--", "/-", "*", "-")) or PROSE.search(line): continue
        print(f"REAL-TOKEN {f}:{i}: {s[:60]}")
EOF
```

Any line not in §1's enumeration (or not in the lane-declared pending set) =
VIOLATION-UNEXPLAINED → route to the owning lane verbatim before proceeding. **P0's four
placeholders are expected and certified here — they are never cited as results.**

## 3 Step B — axcheck elaboration sweep (use make_axcheck.py's CURRENT form)

A7 rewrote `make_axcheck.py` this cycle (docstring: "namespace-aware, full names" —
the dotted-name/`@[simp]` misses of the R9 regex edition are fixed; trust the current
file, not the R9 description). TARGETS additions to apply at execution (dependency order
respected — every C2 file imports only Mathlib):

```python
    ("AxPilot10_L2",           PILOTS / "10/L2.lean"),
    ("AxPilot11_P11T3",        PILOTS / "11/P11T3.lean"),      # if lane-final
    ("AxPilot11_RedTm2",       PILOTS / "11/RedTm2.lean"),     # if lane-final
    ("AxPilot42_M4a",          PILOTS / "42/M4a.lean"),
    ("AxPilot42_M4b",          PILOTS / "42/M4b.lean"),
    ("AxPilot71_P1",           PILOTS / "71/P1.lean"),         # P0 EXCLUDED (probe-convention)
    ("AxPilot72_Cneg",         PILOTS / "72/C-neg.lean"),
    # on landing: AxPilot71_P2, AxPilot73_C*, AxPilot72_M1
```

Run `research/feasibility/probe/run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-c2.log`;
rescue with provenance header to each pilot's `logs/axcheck-final-c2.log`. Per-file OK
criterion (unchanged): `OK; axiom-lines=N, sorryAx-lines=0`, every axiom line ⊆
`[propext, Classical.choice, Quot.sound]` (subset forms without `Classical.choice`
acceptable). `sorryAx-lines>0` in a PROOF artifact ⇒ the pilot is not done despite its
report — route to lane. For donor-swap pilots (42-M4*, 71-P1/P2, 72-*), additionally
confirm the run log shows the donor statements consumed as **binders or built-donor
imports only** (V2 = built; DZDF/Liu-1/Weil = statement-level — G1b/G3 verdicts).

## 4 Step C — VERIFICATION-LEDGER §Cycle-2 (per-pilot OK/FAIL sign-off format)

Refresh totals (`find pilots -name '*.lean' | xargs wc -l | tail -1`; theorem/lemma counts
per R9 Step C), then append a §Cycle-2 table, one row per pilot:

```
| pilot | final files | LoC/thms | axcheck verdict (log cite) | sorry tokens | sign-off |
| 42-M4 | M4a, M4b | … | OK; axioms=triad, sorryAx=0 (logs/axcheck-final-c2.log) | 0 | OK |
```

`sign-off = OK` iff Step A 0 unexplained tokens ∧ Step B OK ∧ logs persisted with
provenance headers; otherwise `FAIL → <lane>`. Already-clean rows (20, 52) cite the resume
session's entries plus this run's drift-check.

## 5 Step D — compliance sign-off (append once A–C clean)

> Signed off (Cycle-2 final sweep <date>): all kept Cycle-2 pilot artifacts elaborate on
> mathlib `ff2494ea` (v4.36.0-rc2) with standard axioms only — no `sorry`, no
> `native_decide`, no external CAS in any proof artifact; the sole `sorry` tokens in the
> tree are the 36 header-justified probe-convention stubs (9 main-run + 23 G-series + 4 in
> `pilots/71/P0.lean`), never cited as results; external donors (DZDF, Weil, Liu-1,
> upstream PNT+) enter only as statements — binders, verbatim probe copies, or
> already-built on-pin libraries (`logs/axcheck-final-c2.log`).

If Steps A–C surface anything else, stop and route to the lane instead of signing.

## 6 Execution trigger

Orchestrator signal "Cycle-2 pilot lanes final" (expected after 71-P2, 73 C-series,
72-M1 land or are declared dropped). Then: Step A locally (seconds) → Step B one warm
Modal batch via `run_axcheck.sh` → Steps C–D ledger + sign-off. Blockers route to lanes;
the plan re-baselines §1 if pending files landed with tokens.
