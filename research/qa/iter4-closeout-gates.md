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

## MID-WAVE CHECKPOINT — 2026-11-17 (lane A1; EARLY-DETECTION pass, NOT the final gate run)

Executed against the LIVE main tree @ `47bec92` (read-only scoped-command runs, G1 +
G4 only). The final gate run still executes on the exact closing tree per §G8.

### G1 at snapshot: 52 real tokens vs the 49 expectation — DELTA +3, itemized

Command: §G1 classifier verbatim, scope `research/pilots/**/*.lean` +
`research/feasibility/probe/**/*.lean` (93 files, main @ 47bec92). Tally **52**:

| bucket | expected | found | verdict |
|---|---|---|---|
| main-run probes (B1×3, B2×1, C1×1, D×4) | 9 | 9 | ✓ |
| C2 G-series (G1×4, G2×1, G3×1, G4×4, G5a×1, G5b×6, G5c×4, G7×2) | 23 | 23 | ✓ |
| `71/P0` (:65/:90/:97/:110) | 4 | 4 | ✓ |
| `73/P0` (:40/:45/:53/:79/:87/:121/:143 — +2 line drift vs C2, count unchanged) | 7 | 7 | ✓ |
| `al3d/P0` (:85/:123/:128) | 3 | 3 | ✓ |
| `lp/P0` (:44/:55/:97) | 3 | 3 | ✓ |
| **NEW: `ProbeG9_StrongPNT` (:51/:67) + `ProbeG10_PhyslibRefresh` (:96)** | 0 | **3** | **DELTA — unrecorded lane additions** |

**Delta itemization (the catch this pass exists for):** the +3 are R8-lane
probe-convention files staged 2026-11-16 (post-C2-certificate), BOTH carrying the
"Statement elaboration probe — not a proof artifact" header with sorry'd
donor-statement transcriptions (G9: upstream StrongPNT conclusion + its binder form;
G10: the SHELF `areaLaw_to_corollary` stub) — header-justified, so NOT
VIOLATION-UNEXPLAINED, but they are **unrecorded in
`stepA-incremental-iter4.log`** (which was seeded 2026-11-17 from the pilots-only
baseline and predates their sweep into scope). **Remedy (owner: the G9/G10 lane,
R8-successor): append entry 2 to the incremental log re-baselining the certificate
49 → 52** (plan §1's "any file landing WITH tokens re-baselines the certificate
before Step B" — orchestrator-visible, not silent). ***EXECUTED 2026-11-17 (lane A1,
coordinator-authorized self-service): entry 2 appended to
`stepA-incremental-iter4.log` — certificate now 52.*** All wave-2 landed pilots check
0 tokens as expected: 73/Q4 ✓, zzv2-P0 ✓, N2-P0 ✓, M2.lean ✓, 78-P0 ✓, ff-ez4-P0 ✓,
74-P0 (1 `sorry` string = header prose) ✓.

**G1 verdict at snapshot: PASS-WITH-DELTA** — 0 unexplained; 3 unrecorded-but-justified
(re-baseline owed).

### G4 at snapshot: PASS (1 meta-hit)

- G4a `grep -rn "2026-11-18" research/ --include='*.md'` → **1 hit**:
  `qa/iter4-review/a8-midwave-audit.md:80` — A8's own mid-wave audit REPORTING its
  zero-hit result ("2026-11-18+/2026-12+: zero hits") — the date string inside the
  audit quoting its own grep pattern. **Meta-hit class** (the C2 whole-file-grep
  false-positive precedent): not a future-dated record. Cosmetic early-warning,
  **owner A8** (reword to avoid embedding tomorrow's literal, e.g. "T+1 dates") or
  H whitelists it in the final gate table; otherwise the final run false-positives.
- G4b compound dates `YYYY-MM-DD/DD` → **0 hits** ✓.
- Broader early-warning sweep (any date > 2026-11-17, incl. 2026-12+/2027): **only the
  same 1 meta-hit** — the tree is future-date clean.

**G4 verdict at snapshot: PASS** (with the 1 meta-hit disposition owed before the
final run). Corroboration: A8's independent mid-wave audit
(`qa/iter4-review/a8-midwave-audit.md:80`) reports the same date-discipline result.

— checkpoint lane A1, 2026-11-17, main @ 47bec92. G2/G3/G5–G7 NOT run (not yet
unblocked; see the summary table).

## APPENDIX — wave-3 gate readiness matrix (lane A1, 2026-11-18; main @ `c67d64e`; PREP ONLY — no gate executed herein)

Re-assessment of every close-out gate against the CURRENT main tree (post-`2f90dcc`:
wave-3 commits `effabf7`/`66a8085`/`c67d64e` are H-infra only, no pilot landings).
The §G1–§G8 command cards above stand except where corrected here. The five wave-3
in-flight units (A3 FF-EZ2-P2, A4 AL-P2-c/d/e, A5 N2-P1 closure+M2/M3, A7 77-T1/T2,
A8 74-P1 completion) are the only remaining fold/verification obligations; their §10
final folds route to A1 (sticky) as they land.

| gate | state @ 2026-11-18 | blocked-on (in-flight unit named) | close-time command/artifact |
|---|---|---|---|
| G1 sorry-token | **READY — certificate 52 CONFIRMED** (dry run 2026-11-18, main @ c67d64e, 104 files: 52 hits, bucket tally exact, 0 unexplained; `stepA-incremental-iter4.log` ENTRY 4) | only the five in-flight units' files, IF any lands WITH tokens (re-baseline entry before Step B, plan §1) | §G1 classifier verbatim; PASS = 52 + declared in-flight additions, 0 unexplained. Correction of record (ENTRY 4): al3d/P0 tokens at `:106/:144/:149` in the committed sha `52c5b9f7` (entry 3's `:104/:142/:147` = staged-bytes drift, count unchanged — gate is count-bound) |
| G2 axcheck | **PARTIAL READY** — machinery live; 3 TARGETS rows already present (`AxPilot72_M1_T3`, `AxPilot32_M2`, `AxPilot73_Q4`); part (ii) DISCHARGED EARLY for 75_Pb (`axcheck-full-run1.log` 89/89) + 72-M1 T1/T2/T3 (`axcheck-l3a-run1.log`) | part (i): H's `AxPilot10_L5` single-anchor row (orchestrator ruling 2026-11-18 — supersedes the L3/L4 phrasing; my reconciliation at FINAL-SWEEP §0/§7d + r3-tables §10.26). part (ii) owed stages: zzv2 P1 donor-tree (landed final — [LAYERS] M4b recipe, executor = sweep); 32-M1 + 32-M2 full-coverage (§7b); ff-ez2 P1 rides family finalization (**A3 FF-EZ2-P2 in flight**); 75-N2 final (**A5 in flight**); AL-P2 A2-final/A3 (**A4 in flight**); 74-P1 (**A8 in flight** — stage only if completion lands GREEN; verified-red has none); 77 (**A7 in flight**, same class) | (i) `run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-iter4.log` + provenance-rescue; (ii) `axcheck_iter4.py gen` + custody-runner per §G2, donor-tree via `run_m4b_donor_axcheck.sh`; PASS per stage = `OK; axiom-lines=N, sorryAx-lines=0`, records ⊆ triad |
| G3 INDEX | **BLOCKED-ON H** (unchanged) | H's pre-close drift list + the exact closing tree (INDEX is H's file). comm dry-run 2026-11-18: 232 delta lines — known classes dominate (candidates/* individually unlisted = directory-covered; INDEX `.log`/`logs/` rows = column-2-only by the command's file extension set; wave-2/3 new files incl. `h-wave3-log.md`, `a2-close-act-runbook.md`, runners, records) | §G3 `comm -3` both directions on the closing tree; PASS = only directory-covered/grouped entries remain, every new row dated + source-cited |
| G4 dates | **READY — dry PASS today** (2026-11-18: future-date grep `2026-11-19+`/`2026-12-`/`2027-` = **0 hits**; compounds = **0 hits**; the mid-wave meta-hit `a8-midwave-audit.md:80` ("2026-11-18+") self-resolved with the date rollover) | none (re-run on the closing tree at close-commit time by construction) | §G4 two greps verbatim |
| G5 template | **PARTIAL — corpus READY (A9 compliance 14/14 + G5 dry-run PASS @ `37a2637`), pre-staged command STALE (corrected below)**; shipped-set declaration is a close act | the close-time shipped-set declaration (orchestrator) + splice checklist §B sweep-sha stamps (7 mandatory H-owned items, `a9-splice-readme-checklist.md`) | **CORRECTED command (dated 2026-11-18):** the §G5 grep patterns false-FAIL — `^## 1\. Front matter` is a TEMPLATE fill section no shipped article carries as a heading, and the corpus has TWO live layouts (legacy `## 5. Formal verification`/`## 6. Novelty and nearest misses` — 01/32-class; template `## 4. Novelty and nearest misses`/`## 6. Formal record` — 22/75/78-class). Close-time per article: (a) kind declaration in the header block; (b) a novelty/nearest-miss section (`## 4` OR `## 6`); (c) a formal-record/verification section (`## 5` OR `## 6`); (d) `## 7. Limitations*`; (e) TEMPLATE-iter4 §9 box-run with evidence cites (the binding instrument — A9's compliance table + per-article self-audit blocks are the worked record) |
| G6 two-strike | **BLOCKED-ON the §3 close fill** (unchanged in kind) | the §3 accounting fill (shipped set + N=1 quota ruling recorded + R1-gate note) at close — `REPORT-INPUTS-ITER4` is H-shepherded | §G6 scoped reads; binding FLOW reading pre-computed by A9 (`a9-corpus-compliance.md` §discovery-ratio: 100% discovery-grade on every chartered shipment plan — 75 v2 DISCOVERY-CONDITIONAL, 32 v2, 01, 30, 78 NEGATIVE-kind discovery-grade NOT consuming N=1; N=1 UNSPENT); report stock (38%) as the corpus-health line only |
| G7 annotations + stamps | **READY-PARTIAL with the CORRECTED CENSUS** — A2 re-verification (`a2-close-act-runbook.md` §8, 2026-11-18, main @ `66a8085`): **46 sites = 40 CLOSE / 6 RETARGET-ITER-5 / 0 NEEDS-RULING** (recorded 34 = 29/5/0 + 12 missed pre-existing sites = 11 close + 1 retarget; anchor drift SCAN FF-EZ2 `:90`→`:105`; the new retarget site = `pilots/72-M1/L3-spec.md:187`, L3b–d + interface open) | the close-block annotation dispositions themselves (orchestrator) — cite runbook §8, do NOT re-derive | G7(a): `grep -L "SUPERSEDED\|SELECTED" …` — all four staging files unstamped today (re-verified 2026-11-18); stamps ride their consuming decisions in the close commit. G7(b): gate grep = **30 in-scope lines** (re-counted 2026-11-18, exact), fully covered = 26 recorded + 4 delta (SCAN:5, DRAFT:59, DRAFT:100, SPLICE:28); close block quotes: "40/46 in-cycle, 6 retargeted, 0 unrulled (corrected census, a2-close-act-runbook.md §8)" |
| G8 persistence | skeleton stands (empty by design) | fills as G1–G7 execute | per-gate table (gate/command/raw result/verdict/date/commit) committed WITH the close block; `OVERRIDDEN — <reason> — <owner>` or fixed-and-rerun, never "passed by inspection" |

**Standing corrections this appendix makes to the pre-staged text above (all dated,
none silent):** (1) G5's grep pattern set (this appendix's corrected command); (2) G7's
census basis (34→46 per runbook §8); (3) the mid-wave G4 meta-hit disposition
(self-resolved 2026-11-18 — the a8 wording need not change unless the final gate run
re-flags it); (4) G2's 10-tranche stage phrasing → single `AxPilot10_L5` anchor
(orchestrator ruling 2026-11-18). Everything else in the pre-staged table stands.

**LATE UPDATE (same day, post-appendix):** FF-EZ2-P2 landed GREEN on main mid-pass
(the first of the five in-flight units) — folded as §10.28 (r3-tables); classifier
re-run WITH `P2.lean` in scope: 105 files, **52 hits — the certificate stands on the
post-P2 tree** (P2 = 1 prose string, 0 real tokens; ENTRY 4 addendum). G1/G2 exposure
shrinks accordingly: the ff-ez2 family is FINAL ⇒ `AxPilotFFEZ2_P1/_P2` custody
stages fire at sweep (FINAL-SWEEP §7d updated in the same pass); remaining in-flight
folds owed: AL-P2 c/d/e (A4), N2-P1 closure + M2/M3 (A5), 77-T1/T2 (A7), 74-P1
completion (A8).

**LATE UPDATE 2 (same day, §10.29):** 75-N2 P1 FINAL landed (M1 closure + M2 GREEN,
8/8 file-wide triad, run 15; M3 → iter-5 declared) — folded as §10.29, superseding
the §10.22 checkpoint. G2 exposure: `AxPilot75_N2` stage owed at sweep **with H's
closure-staging finding** (`import N2P0` = the runner's hyphen workaround — stage the
Pa → N2P0 → N2-P1 closure per `run_n2p1.py:49` ORDER, or extend the rewrite map;
`h-wave3-log.md:604–:608`, §10.29 Step-B note, §7d row). G1: the final N2-P1.lean
(sha 2e5217010e46ad0d, 506 LoC) checked 0 real tokens on agent-06 disk (ENTRY 5
addendum; re-verify at H-commit). Census roll-up restated: **machine 213/213 +
manual 65/65 = 278/278, ZERO residuals** (§10.CENSUS (e)). Remaining in-flight
folds: AL-P2 c/d/e (A4), 77-T1/T2 (A7), 74-P1 completion (A8).

— appendix lane A1, 2026-11-18, main @ c67d64e (+ P2 landing), worktree agent-02. No
gate executed herein; PREP ONLY per the file's execution trigger (orchestrator close
signal).
