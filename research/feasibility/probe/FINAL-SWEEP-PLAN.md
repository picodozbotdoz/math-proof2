# FINAL-SWEEP-PLAN — mechanical close-out (execute on the coordinator's final signal)

Lane R9, 2026-11-09 (round 9 baseline). Precondition: all pilots report done.
Everything below runs from the repo root `/home/doz/zcode-workdir/cross-math-fronttier`
unless noted. Runtime budget: ~5–10 min total (one warm Modal batch + local sweeps).

## 1 Baseline sorry-token certificate (round 9, current tree)

Method: per-file line scan for `\bsorry\b`; a REAL token is a line whose stripped form is
` sorry`/`… := by sorry` (proof body); all other hits are comment/prose (backticked
`sorry`, "no `sorry`" compliance headers, probe-header justifications) — classifier
script below reproduces the split. Files with 0 real tokens are omitted from the token
list but counted in the totals.

| classification | files | real tokens |
|---|---|---|
| KEPT-ARTIFACT-OK (0 tokens) | 33 pilot files + 9 probe files (all pilots incl. in-flight 01/09, RedCompA/B, Tier1, 50-Dirichlet, 52-M1 have **0 real tokens**; their failures are elaboration errors, not sorries) | 0 |
| PROBE-CONVENTION (header-justified, "statement elaboration probe — not a proof artifact") | `feasibility/probe/ProbeB1_RHLinalg.lean` (3: :51,:60,:67), `ProbeB2_EthTime.lean` (1: :26), `ProbeC1_OAI_QuasiRH.lean` (1: :14 — the donor challenge's own placeholder), `ProbeD_PairCeiling.lean` (4: :57,:70,:78,:92) | 9 |
| IN-FLIGHT-FLAGGED (lane active) | 0 new token findings — the in-flight set carries failures, not sorries | 0 |
| VIOLATION-UNEXPLAINED | **none** | 0 |

New files landed since round 7 and included in this baseline: `pilots/32/M1.lean`
(492 LoC, 13 th), `pilots/42/M2a.lean` (606 LoC, 28 th), `pilots/42/M3.lean`
(441 LoC, 20 th) — all 0 real tokens.

## 2 Step A — sorry-token re-run (expected: identical to §1)

```bash
cd /home/doz/zcode-workdir/cross-math-fronttier/research && python3 -I - << 'EOF'
import re
from pathlib import Path
files = sorted(list(Path("pilots").rglob("*.lean")) + list(Path("feasibility/probe").rglob("*.lean")))
PROSE = re.compile(r"sorry-free|no `?sorry`?|0 sorry|sorryAx|sorry'd|[Tt]he sorry|replaced by sorry|uses `sorry`|forbidding sorry|sorry token", re.I)
for f in files:
    for i, line in enumerate(f.read_text().splitlines(), 1):
        s = line.strip()
        if not re.search(r"\bsorry\b", line): continue
        if s.startswith(("--", "/-", "*", "-")) or PROSE.search(line): continue
        print(f"REAL-TOKEN {f}:{i}: {s[:60]}")
EOF
```

Expected output: exactly 9 lines — 3× ProbeB1 (:51,:60,:67), 1× ProbeB2 (:26),
1× ProbeC1 (:14), 4× ProbeD (:57,:70,:78,:92). Any other line = VIOLATION-UNEXPLAINED
→ route to the owning lane verbatim before proceeding.

## 3 Step B — axioms re-batch for every pilot's final files

1. Update `TARGETS` in `research/feasibility/probe/make_axcheck.py` to the full ordered
   list (dependency order matters — `P11T1` → `P11T2` → `RedCompA`/`RedCompB`; all other
   files import only Mathlib):

   01: `port/01..09` (9 files), `BindingSurface`, `MasterIdentity`, `master_layer`;
   11: `P11T1`, `P11T2`, `RedCompA`, `RedCompB`;
   20: `M1`; 22: `M1`, `ProbeP1_PNT`, `Tier1`; 32: `M1`;
   42: `M1`, `M2a`, `M3`; 50: `M1`, `Dirichlet`; 52: `M1`.

2. Run: `research/feasibility/probe/run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-final.log`
3. Rescue: copy with provenance header into every pilot's `logs/axcheck-final.log`
   (same pattern as `logs/axcheck-run1.log`).
4. Expected per file: `OK; axiom-lines=N, sorryAx-lines=0`, and every axiom line is
   `[propext, Classical.choice, Quot.sound]` (subset forms without `Classical.choice`
   are acceptable — some constructive lemmas legitimately avoid choice). Any
   `sorryAx-lines>0` ⇒ check the same log for that file's elaboration errors (the
   error-recovery mechanism of round 8) and route to the lane; any FAIL rc≠0 ⇒ the
   pilot is not done despite its report.

## 4 Step C — ledger summary-table refresh (commands + expected)

```bash
cd /home/doz/zcode-workdir/cross-math-fronttier/research
find pilots -name '*.lean' | xargs wc -l | tail -1                      # total LoC
find pilots -name '*.lean' | xargs grep -cE '^\s*theorem ' | awk -F: '{s+=$2} END{print s}'
find pilots -name '*.lean' | xargs grep -cE '^\s*lemma '  | awk -F: '{s+=$2} END{print s}'
```

Update `research/feasibility/VERIFICATION-LEDGER.md` §1 with the new totals and flip
every remaining in-flight/[runs-unrecorded]/FAILED-REVERIFY cell to its Step-B verdict
(cite `logs/axcheck-final.log`). The proved-milestone column should then list, per pilot,
exactly the files that returned OK with 0 sorryAx.

## 5 Step D — compliance sign-off line (append to ledger §3 once A–C are clean)

> Signed off (R9, final sweep <date>): all kept pilot artifacts elaborate on mathlib
> `ff2494ea` (v4.36.0-rc2) with standard axioms only — no `sorry`, no `native_decide`,
> no external CAS in any artifact of this project; the sole `sorry` tokens in the tree
> are the 9 probe-convention stubs inside header-justified elaboration-probe files,
> never cited as results; donor material enters only as verbatim marked probe copies,
> explicit hypothesis binders, or ported-and-re-proved layers with clean axiom records
> (`logs/axcheck-final.log`).

If Step A/B/C surface anything else, stop and route to the lane instead of signing.
