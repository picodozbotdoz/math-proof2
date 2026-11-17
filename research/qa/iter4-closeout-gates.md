# ITER-4 CLOSE-OUT GATES — pre-staged command table (lane A1, 2026-11-17; PREP ONLY)

Protocol source: `research/RESEARCH.md` §Close-out protocol (adopted verbatim from
`qa/iter4-review/r4-process-completeness.md` §6; worked example
`qa/closeout-gate-run-C2-reconstructed.md`). Rules baked in here: (1) every grep scoped
to the LIVE section (`! sed -n '/^## <live-section>/,$p' <file> | grep -q '<retired>'`),
never the whole file; (2) final run of every gate on the exact closing tree, results in
the §G8 table committed WITH the close block — `OVERRIDDEN — <reason> — <owner>` or
fixed-and-rerun, never "passed by inspection"; (3) INDEX reconciliation both directions;
(4) date discipline (no future / split-mind dates); (5) staging-file supersession stamps.
**Execute only on the orchestrator's close signal.** Run from repo root
`/home/doz/zcode-workdir/cross-math-fronttier`. Sweep-plan companion:
`feasibility/probe/FINAL-SWEEP-PLAN-ITER4.md` §7 (wave-2 inventory + Step-A/B command
card — G1/G2 below are its gate restatements).

## Summary — READY / BLOCKED-ON tally (at prep, 2026-11-17)

| gate | verdict | blocked-on |
|---|---|---|
| G1 sorry-token (Step-A certificate) | READY (machinery; 17/0 baseline logged) | final PASS blocked only by in-flight landings appending declared tokens |
| G2 axcheck full-coverage (two-part Step B) | READY-partial — 75_Pb + 72-M1 T1/T2/T3 DISCHARGED EARLY | wave-2 landings: 75-N2 (A5), 73-Q4 (A2), 32-M2, zzv2 P1 (A3/L3), AL-P2 c/d/e or A3.lean (A4/R9), 78-P0 (if chartered) |
| G3 INDEX reconciliation | BLOCKED-ON | H (pre-close drift list) + the exact closing tree |
| G4 date discipline | READY (runs at close-commit time by construction) | — |
| G5 template compliance (per shipped article) | BLOCKED-ON | articles ship at cycle close (75 statement-class article unshipped; §3 quota recommendation leaves N=1 UNSPENT) |
| G6 two-strike ratio (flow-KPI binding reading) | BLOCKED-ON | same as G5 (needs the shipped-article set + orchestrator quota ruling) |
| G7 dangling annotations + staging stamps | BLOCKED-ON | orchestrator (annotation family dispositions: close vs re-target to iteration 5); no stamp exists yet on any of the four staging files (verified 2026-11-17) |
| G8 gate-run persistence table | skeleton below (empty by design) | fills as G1–G7 execute |

## G1 — sorry-token gate (Step-A certificate)

Command (classifier verbatim from `FINAL-SWEEP-PLAN-C2.md` §2; scope per ITER4 plan §1):

```bash
cd research && python3 -I - << 'EOF'
import re
from pathlib import Path
files = sorted(list(Path("pilots").rglob("*.lean")) + list(Path("feasibility/probe").rglob("*.lean")))
PROSE = re.compile(r"sorry-free|no `?sorry`?|0 sorry|sorryAx|sorry'd|[Tt]he sorry|replaced by sorry|uses `sorry`|forbidding sorry|sorry token", re.I)
for f in files:
    lines = f.read_text(errors="replace").splitlines()
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

PASS = every hit enumerated in the certificate — expected **49** = 43 C2 carry-forward
+ 3 `al3d/P0` (:85/:123/:128) + 3 `lp/P0` (:44/:55/:97) — **plus only** lane-declared
additions recorded in `feasibility/probe/logs/stepA-incremental-iter4.log` (opened
2026-11-17, entry 1 = the 17/0 pilots-only baseline; note 73/P0's 7 tokens line-drifted
+2 vs the C2 enumeration, count unchanged). Any other hit = VIOLATION-UNEXPLAINED →
route to the owning lane before proceeding.

## G2 — axcheck full-coverage gate (two-part Step B)

Part (i) — TARGETS batch (drift-check + [WARM] rows):

```bash
research/feasibility/probe/run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-iter4.log
# rescue with provenance header to each pilot's logs/axcheck-final-iter4.log
```

Part (ii) — full-coverage custody stages (ITER4 plan §2 default 1; the generator split:
`make_axcheck.py:96–97` excludes `private`/lemmas, full coverage = `axcheck_iter4.py gen`
+ the pilot-75 custody-runner pattern — complete-output dump, scan-compatible verdict,
sha stamp):

```bash
python3 -I research/feasibility/probe/axcheck_iter4.py gen research/pilots/<dir>/<file>.lean /tmp/stage/Ax<Name>.lean   # per wave-2 landing
python3 -I research/feasibility/probe/axcheck_iter4.py scan <persisted log>                                                # 0 sorryAx, all records ⊆ triad, no TALLY-ONLY
```

PASS per stage = `OK; axiom-lines=N, sorryAx-lines=0`, every joined record ⊆
`[propext, Classical.choice, Quot.sound]`, primed-name records included (T9 fix,
2026-11-17). ALREADY DISCHARGED EARLY (re-run only if sweep-time sha differs):
`pilots/75/logs/axcheck-full-run1.log` (Pb, 89/89, sha da05c60ceb78755b),
`pilots/72-M1/logs/axcheck-l3a-run1.log` (T1/T2/T3, 93 records). Donor-tree class
(zzv2 P1/P2 if proof-class): `run_m4b_donor_axcheck.sh` recipe (AxPilot42_M4b
precedent); D-PIN rows cite `pilots/zeta23e/logs/zeta23e-p0-run1.log`. zzv2 **P0 is
Step-A-only** (probe-convention ruling, FINAL-SWEEP-PLAN-ITER4 §7a — never a Step-B
stage).

## G3 — INDEX reconciliation gate

```bash
comm -3 <(find research -type f -name '*.md' -o -name '*.lean' -o -name '*.py' -o -name '*.sh' | grep -v -e '/logs' -e '__pycache__' -e decl-index | sort) <(grep -oE '`research/[^`]+`' research/INDEX.md | tr -d '\`' | sort -u)
```

PASS = only directory-covered or explicitly grouped entries remain; every new row dated
+ source-cited; stale-status rows rewritten in the same pass. **Input: H's pre-close
drift list** (known at prep: the R4 batch-B B2/B3 pattern; A1's 2026-11-17 new files —
`pilots/75/axcheck_run75.py`, `pilots/75/run_axcheck75.sh`, `pilots/72-M1/run_axcheck72m1_l3a.sh`,
`feasibility/probe/logs/stepA-incremental-iter4.log`, this file — plus whatever wave-2
lands). INDEX.md is H's file; this gate names it, H executes it.

## G4 — date-discipline gate

```bash
grep -rn "$(date -d '+1 day' +%Y-%m-%d)" research/            # must be EMPTY
grep -rnE '[0-9]{4}-[0-9]{2}-[0-9]{2}/[0-9]{2}-[0-9]{2}' research/ --include='*.md'  # every compound resolves to a real spanning decision
# dates in typeset records: from the decision-log row or `git show -s --format=%cs <sha>` — never memory
```

(The C2 close left three 2026-11-15-family errors written during the 11-14 close — the
precedent this gate exists for.)

## G5 — template-compliance gate (per shipped article)

Checklist source = **A9's compliance table: `research/articles/TEMPLATE-iter4.md` §9
"Shipping gate — check every box"** (skeleton §0–§8: front matter, abstract ≤200 words,
statement, MANDATORY novelty/nearest-miss table, proofs, formal record, limitations,
prior work). Normative paragraph: `research/RESEARCH.md:76` (the adopted quality gate).
Per article shipping at close:

```bash
for a in research/articles/*.md; do case "$a" in *TEMPLATE*) continue;; esac
  echo "== $a"; for s in '^## 1\. Front matter' '^## 4\. Novelty and nearest misses' '^## 6\. Formal record' '^## 7\. Limitations'; do
    grep -q "$s" "$a" && echo "  OK  $s" || echo "  MISSING $s"; done; done
# then run §9's boxes one by one with evidence cites — results into the G8 table (no "passed by inspection")
```

Week-1 review context (week1-agenda row 8): 75-Pb is the top-billed discovery-first
slot — review hardest; every GREEN needs its verification-status table + nearest-miss
cites + limitations before celebrate-H-commit.

## G6 — two-strike ratio gate (flow-KPI binding reading)

Charter text (scoped to the live section — `research/RESEARCH.md:89` inside
`## Iteration 4 (opened 2026-11-16, orchestrator)`): "Two-strike rule, FINAL: at most
**one** knowledge-level / formalization-first / donor-discharge article per cycle … and
≥ half of shipped articles each cycle must be discovery-grade."

```bash
sed -n '/^## Iteration 4 (opened 2026-11-16, orchestrator)/,$p' research/RESEARCH.md | grep -n "Two-strike"   # the binding text, live-section-scoped
sed -n '/^## §3/,$p' research/qa/REPORT-INPUTS-ITER4.md    # the accounting skeleton (N=1 FINAL; recommendation: UNSPENT)
```

PASS = at close, the §3 accounting is FILLED with the shipped-article set, the N=1
quota ruling recorded (orchestrator) + R1 gate enforcement noted, and (if >0 shipped)
≥ half are discovery-grade; KPI line recorded in the cycle-close REPORT block. Current
state at prep: zero articles shipped; recommendation leaves the slot UNSPENT
(75 statement-class = discovery-grade conditional per S4(b)).

## G7 — dangling-annotation + staging-supersession gate

Two parts (rule 5 + the C2-carried tracker `research/REPORT-INPUTS-C2.md:279`
[[TRIAGE-DECISION] annotation family — OPEN (next-cycle); owner: orchestrator]):

(a) **Stamps.** None of the four staging files carries a superseded/selected stamp
(verified 2026-11-17): `feasibility/ITERATION4-SCAN.md`,
`feasibility/ITERATION4-SEED-DOSSIERS.md`,
`feasibility/ITERATION4-CHARTER-DRAFT.md`,
`feasibility/ITERATION4-CHARTER-SPLICE.md`. At close each gets its one-line stamp in
the same commit as the consuming decision (the charter was spliced at L2=`808c809` —
the SPLICE/CHARTER-DRAFT files are the stamp-owing pair; SCAN/SEED-DOSSIERS stamps ride
their consumed-by decisions).

```bash
grep -L "SUPERSEDED\|SELECTED" research/feasibility/ITERATION4-{SCAN,SEED-DOSSIERS,CHARTER-DRAFT,CHARTER-SPLICE}.md   # must be EMPTY at close
```

(b) **Annotation family disposition.** Every `[TRIAGE-DECISION]` / `[A5-triage-pending]`
/ `[NOVELTY-CHECK-NEEDED]` token in the four files + `TRIAGE.md` gets either a
CLOSED-by-iteration-4 disposition or an explicit re-target to iteration 5 (the
orchestrator's call; the family was OPEN BY DESIGN pending the charter typeset, which
happened at L2 — so iteration-4 close is the decision point):

```bash
grep -rn "TRIAGE-DECISION\|A5-triage-pending\|NOVELTY-CHECK-NEEDED" research/feasibility/ITERATION4-*.md research/TRIAGE.md | wc -l   # baseline count; every line dispositioned at close
```

## G8 — gate-run persistence table (fills at close; committed WITH the close block)

| gate | command (short ref) | raw result | verdict | date | commit |
|---|---|---|---|---|---|
| G1 sorry-token | §G1 classifier | | | | |
| G2 axcheck (i) batch | `run_axcheck.sh` | | | | |
| G2 axcheck (ii) full-coverage | `axcheck_iter4.py gen`+`scan` per landing | | | | |
| G3 INDEX | §G3 `comm -3` | | | | |
| G4 dates | §G4 greps | | | | |
| G5 template | §G5 per-article §9 run | | | | |
| G6 two-strike | §G6 scoped reads + §3 fill | | | | |
| G7 stamps + annotations | §G7 greps | | | | |

OVERRIDDEN convention: `OVERRIDDEN — <reason> — <owner>` in the verdict cell;
"passed by inspection" is not a state. Baseline dry-runs (like stepA-incremental entry 1)
stay in their plan/log files and are labeled baselines.

— pre-staged by lane A1 (R3-role successor), 2026-11-17. No gate executed herein.
