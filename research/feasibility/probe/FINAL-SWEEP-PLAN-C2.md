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

**Machinery pre-verified post-outage (lane A1, 2026-11-14):** `run_axcheck.sh AxPilot10_L1`
(one already-final artifact) ran clean end-to-end on the doz Modal account —
`AxPilot10_L1.lean: OK | 36 axiom-lines, 0 with sorryAx`, all axiom sets ⊆ triad; log
`feasibility/probe/logs/axcheck-c2-machinery-check.log` (provenance header in-file).
Two machinery notes banked: (i) `run_axcheck.sh` now defaults to `MODAL_USER=doz`
(`/home/doz/dozenv/bin/modal`; `sudo -u xyz` blocked here — RESUME-BRIEF-C2 §Protocol 3)
and forwards subset stage-names to `make_axcheck.py` (`run_axcheck.sh <name>…` re-checks a
subset; no args = all TARGETS); (ii) `L1.lean` carries its own 13 in-file `#print axioms`
(`:517–529`), so its staged copy shows 38 print invocations with 13 idempotent duplicates
and the tool's `axiom-lines=36` excludes "does not depend on any axioms" lines — benign,
expected at the sweep too.

### 0a FROZEN Step-B/C TARGETS (orchestrator-ordered freeze, 2026-11-14 — per-file stage status)

Step A runs INCREMENTALLY as artifacts land (verdict log:
`feasibility/probe/logs/stepA-incremental-c2.log`); at the all-final signal only Steps B–C
execute. `make_axcheck.py` TARGETS already carries every LANDED file below (C2 block);
pending files get added on landing.

| stage name | source | stage status (2026-11-14) |
|---|---|---|
| AxPilot72_Cneg | `pilots/72/C-neg.lean` | **FINAL — A4 report OFFICIAL** (run8-final GREEN rc=0/0/0, 369 LoC/11 thms; axcheck 11/11 triad-only; Step A OK 0 tokens; deviations documented in 72-prework execution note) |
| AxPilot42_M4a | `pilots/42/M4a.lean` | **FINAL** (m4-run2 + m4-axcheck-run1) |
| AxPilot42_M4b | `pilots/42/M4b.lean` | **FINAL — PRIMARY route (direct ZetaZerosV2 import), m4b2-run2 GREEN**; fallback preserved at `pilots/42/logs/M4b-fallback-GREEN.lean`. **Step-B caveat RESOLVED — donor-tree pattern DRY-RUN PROVEN 2026-11-14** (`feasibility/probe/logs/m4b-donor-axcheck-dryrun.log`: build OK on the exact pin; axcheck copy OK, 78 axiom-lines, 0 sorryAx, all ⊆ triad incl. the built-donor theorems consumed as imports; re-run `feasibility/probe/run_m4b_donor_axcheck.sh` at sweep). Infra note: leanprover-community/elan release URL DEAD (404 on cold build) — live mirror leanprover/elan, used by the probe |
| AxPilot10_L1 | `pilots/10/L1.lean` | **FINAL** (l1-run4-final) |
| AxPilot71_P1 | `pilots/71/P1.lean` | **FINAL** (run4) — AxPilot71_P0 EXCLUDED (probe-convention, Step A only) |
| AxPilot71_P2 | `pilots/71/P2.lean` | **FINAL-GREEN p2-run6** (2026-11-14; 11 thms all triad; target ADDED 2026-11-14) |
| AxPilot11_P11T3 | `pilots/11/P11T3.lean` | **GREEN ×2 + axcheck-clean** (m2-run1/2; A1's fix-verify run: OK 64 axiom-lines 0 sorryAx) — lane final-vs-scratch confirm owed |
| AxP11T1 / AxP11T2 | `pilots/11/P11T{1,2}.lean` | FINAL (main-run records; re-verified OK in the 2026-11-14 fix-verify run) |
| AxPilot10_L2 | `pilots/10/L2.lean` | **PENDING** (A6: first-ever run landed l2-run1 FAIL 12 err, all Part D, fixes applied — iterating; target stages whatever is final at sweep) |
| AxPilot11_RedTm2 | `pilots/11/RedTm2.lean` | **FINAL-GREEN m2-run8** (2026-11-14; all six pilot-11 files OK; 421 LoC; Step A 0 tokens; import rewrite to AxPilot11_P11T3 VERIFIED) |
| AxPilot71_P2 | `pilots/71/P2.lean` | **PENDING** (A2, err=1 at p2-run5) — ADD TARGET ON LANDING |
| AxPilot73_C | `pilots/73/C.lean` | **FINAL-GREEN run6-c-green** (2026-11-14; Q1–Q3 + 71-glue, 7 thms all triad, 0 sorry; 236 LoC; Step A 0 tokens; target ADDED; Q4 NOT attempted per gate) — `73/P0.lean` = probe-convention, Step A only, EXCLUDED (7 stubs in the 43-token baseline) |
| AxPilot75_* | `pilots/75/` (P-a + C1 per `pilots/75-prework.md`) | **PENDING-EXECUTING** (orchestrator DECISION 2026-11-14: the FINAL Cycle-2 pilot, lane A4; final-or-declared-drop rule) — ADD ON LANDING |
| AxPilot72_M1 | `pilots/72/M1.lean` | **PENDING** (A8 slot 3) — ADD ON LANDING |
| (42-upgrade product) | tbd | if separate from `M4b.lean` — ADD ON LANDING |
| AxPilot20_M1 / AxPilot52_M1 | `pilots/{20,52}/M1.lean` | FINAL cross-refs (drift-check only, §8) |

**Executed fix (2026-11-14):** the sibling-import rewrite in `make_axcheck.py` is now a
generalized dict built from ALL TARGETS (every stem → stage name), replacing the
`P11T[12]`-only regex — `11/RedTm2`'s `import P11T3` → `import AxPilot11_P11T3` resolves.
VERIFIED: local unit-check (staged copies show both rewrites) + one Modal closure run
(`logs/axcheck-c2-p11t3fix-verify.log`: T1 OK, T2 OK 19 axiom-lines, P11T3 OK 64/0,
RedTm2 tactic-errors-only — zero import errors).

## 1 Baseline sorry-token certificate (2026-11-13; **RE-BASELINED 2026-11-14** per orchestrator order — 36 → 43)

Re-baseline run (A1, 2026-11-14, logged in `logs/stepA-incremental-c2.log`): classifier
over all 68 in-scope `.lean` files → **exactly 43 tokens, 0 unexplained** = 9 main-run
(B1 ×3, B2 ×1, C1 ×1, D ×4) + 23 G-series (G1 ×4, G2 ×1, G3 ×1, G4 ×4, G5a ×1, G5b ×6,
G5c ×4, G7 ×2) + **4 in `pilots/71/P0.lean`** (:65/:90/:97/:110) + **7 in
`pilots/73/P0.lean`** (:38/:43/:51/:77/:85/:119/:141 — header-expected Q0 stubs:
norm_wOf/re_eq_half/lPoly_eval 71-glue, no_real_homs, apply_span_singleton_eq_zero_iff,
hecke_continuation, hecke_window). Zero tokens in every pilot PROOF file on disk
(incl. the finals M4a/M4b-primary, L1, P1, P2, P11T3, C-neg and mid-flight L2, RedTm2).
Earlier 65-file/36-token certificate superseded.

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

## 2 Step A — sorry-token re-run (expected: exactly the **43** tokens of §1 — re-baselined 2026-11-14, enumerated and tested; incremental per-file verdicts already logged in `logs/stepA-incremental-c2.log`)

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

Import audit (A1, 2026-11-14, for the TARGETS additions above): `10/L2`, `42/M4a`,
`42/M4b`, `71/P1`, `71/P2`, `72/C-neg`, `11/P11T3` import only Mathlib — stage verbatim.
`11/RedTm2` imports `P11T3` — **handled**: the generalized dict rewrite in
`make_axcheck.py` (EXECUTED and VERIFIED 2026-11-14, see §0a) maps it to
`AxPilot11_P11T3`; sorted elaboration order respects the dependency
(`AxPilot11_P11T3` < `AxPilot11_RedTm2`).

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
§1 was re-baselined 2026-11-14 (43 tokens, orchestrator-ordered early execution — the
last sweep-time Step-A unknown removed); §6's conditional re-baseline clause is satisfied.

## 6 Execution trigger

Orchestrator signal "Cycle-2 pilot lanes final" (expected after 71-P2, 73 C-series,
72-M1 land or are declared dropped). Then: Step A locally (seconds) → Step B one warm
Modal batch via `run_axcheck.sh` → Steps C–D ledger + sign-off. Blockers route to lanes;
the plan re-baselines §1 if pending files landed with tokens.
