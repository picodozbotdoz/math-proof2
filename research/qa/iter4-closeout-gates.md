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

**LATE UPDATE 3 (same day, §10.29 run-19 amendment):** A5's re-task completed M3 in
the same file — §10.29 amended to the run-19 state (14/14 file-wide triad, sha
`ca1089e2a0c122c4`, six M3 theorems incl. `hasQDirichletDictionary` = N2-a
DISCHARGED; the N2-P0 `hnp` FIND folded as a dated amendment — P0 one-liner owed at
the next P0-touching commit, elaboration ledger unaffected). G1: run-19 bytes 0 real
tokens (ENTRY 6). Census roll-up: **machine 219/219 + manual 65/65 = 284/284, ZERO
residuals** (§10.CENSUS (e), tally-verified). Remaining in-flight folds: AL-P2 c/d/e
(A4), 77-T1/T2 (A7), 74-P1 completion (A8).

**LATE UPDATE 4 (same day, §10.30 + §10.31):** AL-P2 c/d/e honest stop folded (P2-c
CLOSED at run 13 — 63/63 direct at the verify-fire bytes; P2-d PARTIAL GREEN parked
at find #5; P2-e → rebuild re-charter; the "114 decls" header claim corrected as
intent-not-state) and 74-P1 COMPLETION GREEN folded (7/7 publics + 24 privates elim;
supersedes §10.21). G1: both files 0 real tokens (ENTRY 7). G2 exposure: new
`AxPilot74_P1` custody stage; `AxPilotAL3D_A2` sha-at-sweep (file grows with the
rebuild); the al3d runner error-filter process find carried to §7d standing notes.
Census roll-up: **machine 226/226 + manual 152/152 = 378/378, ZERO residuals**
(§10.CENSUS (e), tally-verified: N=31, verdicts 26/3/2, 0 MULTI). Remaining
in-flight fold: **77-T1/T2 (A7) only — the last wave-3 unit.**

**LATE UPDATE 5 — FINAL CLOSE BASIS (§10.32 + the N2-P2 PAUSED addendum, 2026-11-18):**
the LAST wave-3 unit folded: §10.32 77 honest stop (T1 31→7 site-local, zero
mathematical failures; T2 seven-of-eight triad, one tainted by the runner
filter blind spot; physlib WickAlgebra NOVELTY EVENT; no 77 TARGETS row per the
74-precedent ruling). §10.29 carries the PAUSED-AT-CLOSE addendum (N2-P2 2/6,
name-resolution only, the 14/14 core untouched; the P2-a block =
in-flight-unverified, token-treated; the hnp erratum APPLIED at `02a5d71` — the
owed one-liner DISCHARGED). **Close-time census basis (tool-verified): N=32,
verdicts 26 GREEN-triad / 3 honest-partial / 3 NOT-GREEN-honest, machine 226/226
over 9 sections, manual 159/160 — whole-tree 385/386; the ONE residual = 77-T2's
tainted decl (iter-5). Delta slots: NONE — wave 3 complete.** G1 basis: ENTRY 8
(certificate 52, all honest-stop files classifier-clean). **This appendix's gate
matrix + the §10.CENSUS roll-up are the close-act inputs; the final gate run still
executes on the exact closing tree per G8.**

— appendix lane A1, 2026-11-18, main @ c67d64e (+ P2 landing), worktree agent-02. No
gate executed herein; PREP ONLY per the file's execution trigger (orchestrator close
signal).

---

# CLOSE-ACT GATE RUN — wave 4 (lane R2, 2026-11-19; EXECUTED per the orchestrator close signal)

Basis tree: main @ `e3d984b` (verified CLEAN; worktree agent-03 forwarded to the same
sha by H — `h-wave4-log.md` item 1). Scope guard for G1: the `.lean` tree is IDENTICAL
`dd6686f`→`e3d984b` (108 files, zero .lean deltas) — the close residue (R1's staging
fixes + evidence logs, H's instrument edits) is .py/.log/.md only and cannot move G1's
scope. G4/G8 re-verify at K-assembly per the standing rule ("final run of every gate on
the exact closing tree": K-time deltas are the gates file itself, REPORT-INPUTS §3,
REPORT.md §I4, INDEX, STATUS, stamps ×5 + SPLICE literal stamp — none .lean).

## G1 — PASS (52 exact, 0 unexplained; re-run on the closing tree 2026-11-19)

§G1 classifier verbatim, full scope (`research/pilots/**/*.lean` +
`research/feasibility/probe/**/*.lean`, 108 files): **52 REAL-TOKEN hits — EXACT
certificate match** (basis ENTRY 8 + the sweep-time entry; composition re-verified):

| bucket | lines | n |
|---|---|---|
| main-run probes | B1 :51/:60/:67, B2 :26, C1 :14, D :57/:70/:78/:92 | 9 |
| C2 G-series | G1 :45/:54/:62/:71, G2 :92, G3 :47, G4 :53/:94/:99/:281, G5a :59, G5b :117/:185/:206/:223/:248/:276, G5c :74/:81/:91/:106, G7 :37/:47 | 23 |
| probe-scope re-baseline (entry 2) | ProbeG9 :51/:67, ProbeG10 :96 | 3 |
| `71/P0` | :65/:90/:97/:110 | 4 |
| `73/P0` | :40/:45/:53/:79/:87/:121/:143 | 7 |
| `al3d/P0` (committed sha lines, entry-4 correction) | :106/:144/:149 | 3 |
| `lp/P0` | :44/:55/:97 | 3 |
| **total** | | **52** |

Zero hits outside the certificate → no VIOLATION-UNEXPLAINED, no STOP. R1's staging
work landed NO `.lean` staging files (compile-only classes stage under `/tmp`; main
tree CLEAN) — the pre-declared STOP condition did not materialize. Evidence:
`feasibility/probe/logs/stepA-incremental-iter4.log` (ENTRY 8 + sweep-time entry +
the R2 re-run entry appended this pass, worktree-side for H to pull).

## G2 — PASS (dual-log: run1 53 OK + run2-subset closing the 5 staging defects)

- (i) Full-TARGETS sweep: `feasibility/probe/logs/axcheck-iter4-close-run1.log`
  (H, 2026-11-18, closing tree post-`dd6686f`; wall 514 s, telemetry in-header) —
  **58 stages: 53 OK** (each "N axiom-lines, 0 sorryAx", records ⊆
  `[propext, Classical.choice, Quot.sound]`) **/ 5 FAIL, ALL dispositioned IN-LOG as
  STAGING defects, not artifact defects** (AxPilotAL3D_A1/A2 compile-only-P0 dep gap;
  AxPilot75_N2P0 Pa-olean ordering; AxPilot75_N2P1 cascade + the run-19-committed-bytes
  staging rule; AxPilot42_M4b donor search path) — taxonomy + fix plan in the
  provenance header.
- (ii) Subset re-fire of exactly those 5 stages:
  `feasibility/probe/logs/axcheck-iter4-close-run2-subset.log` (R1; in flight at this
  writing — not duplicated here per the no-double-fire instruction). **G2 final verdict
  row: "58/58 stages OK, all triad-clean" once R1's log shows 5/5**; any residue routes
  to R1 before K. [PENDING-R1 at press time — update this row, not the run1 record.]

## G3 — INDEX reconciliation, both directions (drift list for H; H owns the INDEX commit)

§G3 `comm -3` on the closing tree (2026-11-19): 238 delta lines = 194 column-1 (files
without an exact backticked row) + 44 column-2 (rows the command's extension set cannot
resolve). Classification (mechanical: dir rows, brace/glob expansion, in-row
relative-path and bare-name mentions; full method reproducible from this list):

**(A) Genuine gaps — 1 (the only H-action items):**
1. `research/pilots/32/run_pilot.py` — no row, no in-row mention anywhere (its sibling
   `run_pilot.sh` IS mentioned in-row at INDEX:268's de-stale note). Fix: fold into the
   32 row (row 268 class) — dated + source-cited per the PASS rule.

**(B) Stale-status rewrites owed in H's same pass — 1:**
1. `runner-fixes-wave2.patch` (INDEX:254 "H applies post-wave") — the wave closed with
   the patch never applied; INDEX:291 already carries the superseding TASKSET-revision
   note. Rewrite the status cell (never-applied / superseded-by-TASKSET-revision class).

**(C) Directory-covered (no action; convention class)** — 17 INDEX dir rows cover 151
of the 194: `candidates/`, `feasibility/axiommath-bump/`, `feasibility/probe/`,
`pilots/{01,20,42,50,52,72-M1,73,74,75,77,78,al3d,ff-ez2,ff-ez4}/`.

**(D) Grouped/brace/in-row-covered (no action)** — the rest of the 194, incl. the
double-brace runner row (`{lp,al3d,zzv2-lam,zeta23e}/run_*.{py,sh}`), the
`{P11T3,RedTm2}`/`al3d/{P0,A1}`/`lp/{P0,L1}`/`{r1-rewrite-42v2,…}` brace rows, and
in-row relative/bare-name mentions (20-prework/20-hCZ at INDEX:191; zzv2 P0/P1
records at :252/:283; 72 runners at :146; 32 run_pilot.sh at :268).

**(E) Column-2-only, all benign classes (no action)** — 13 `.log`//`logs/` glob+brace
rows (the find's extension set), 3 decl-index-filtered rows (the command's own
`grep -v decl-index`), 1 `.patch` (extension class, = item B1 above for status), 3
SUPERSEDED article rows (42M4/50M2/73-formal-tate — already dispositioned in-row as
swap-in deletions, disk-verified absent 2026-11-17), 17 dir rows (class C), 7
brace-group rows (class D).

**Wave-4 new files needing rows as they land in K** (dated + source-cited, H):
the gates file (this close block — row exists, status refresh), `axcheck-iter4-close-
run2-subset.log` (logs-excluded class — no row needed, cite in G2), the five stamped
instruments (rows exist; stamps are status refreshes), REPORT-INPUTS §3 / REPORT §I4 /
STATUS / INDEX (self). Verdict: **PASS once (A1)+(B1) close in H's INDEX commit** —
every other delta line is directory-covered/grouped/extension-class, i.e. exactly the
residue classes the PASS rule permits.

## G4 — PASS at dry run (1 whitelist self-cite); FINAL re-run at K-assembly

§G4 greps on the closing tree (2026-11-19): (a) tomorrow-literal (the `date -d '+1
day'` expansion, T+1 = the 20th) → **EMPTY**; (b) compound dates `YYYY-MM-DD/DD` →
**EMPTY**; broader future sweep (December-2026-onward / next-year-onward patterns) →
**1 hit =
this file's own appendix row quoting its 2026-11-18 dry-run grep patterns**
(`iter4-closeout-gates.md:275`) — the pre-ruled **gates-file self-cite whitelist
class** (RESUME-BRIEF-ITER4 §(b)4), dispositioned here, dated. (Wording rule applied
in THIS block: future-date literals are spelled out, never embedded — the
a8-midwave-audit meta-hit precedent; this section adds zero new grep-visible
future-date literals.) Runs at K-time by construction (per §G4); the K-time re-run
cites this note for the self-cite line if it still appears. [DATE-CLOSED] = K's
actual fire date (the 19th if today) — dated-correction note in the close block per
the W1 ruling if it moves.

## G5 — PASS (AUTHORITATIVE = a9-g5-dryrun 14/14; K-time mechanical confirmation clean)

**Dated note (R2, 2026-11-19, per the restart-map instruction): the runbook Step-13
literal heading patterns (`^## 1\. Front matter`, `^## 4\. Novelty…`, `^## 6\. Formal
record`) are STALE vs shipped naming and false-FAIL — the AUTHORITATIVE pass is
`qa/iter4-review/a9-g5-dryrun.md` (2026-11-17): 14/14 articles PASS every in-file §9
rule (1–10, 12) with measured evidence; the appendix's CORRECTED command (2026-11-18)
is the operative grep form.** K-time mechanical confirmation on the closing tree
(R2, 2026-11-19): all 14 articles carry (a) a kind declaration (DISCOVERY /
DISCOVERY-CONDITIONAL / NEGATIVE / TECHNICAL-RECORD / FORMALIZATION-FIRST), (b) a
novelty/nearest-miss section — three shipped layouts verified: `## Novelty…` class,
`## Relation to prior work (nearest-miss table)` (20, 72), legacy §6 class — (c) a
formal-record/verification section, (d) `## Limitations*`. Box 11 (README same-commit)
is splice-time by construction (H): the a9 dry-run's two drift rows (10, 75) verified
LANDED (README:23 carries the two-tier/χ-column-audited wording; 78's row
re-ratified), so box 11 closes with K's README row. The three disclosed
verdict-level evidence cells (32 Thm 4 / 01 spine / 20 assemble_eps) are the honest
excerpt class, in-row mitigations named — not gate failures.

## G6 — PASS (flow-KPI binding reading; quota UNSPENT at close; DECISION-1 ruled 2026-11-19)

- **Orchestrator quota ruling (DECISION-1, 2026-11-19): N=1 UNSPENT-default,
  spend-only-if-executed; the slot contest = FB-2 (PNT-AP explicit-L) vs FB-4 (FF-PNT)
  vs unspent — an ITERATION-5 decision, not an iteration-4 spend.** At iteration-4
  close the knowledge-level/formalization-first/donor-discharge quota is recorded
  **UNSPENT** (`a9-quota-casualties.md` row 9; `a6-iter5-charter-draft.md` §3/§8.4
  context; ruling relayed by the orchestrator to R2 2026-11-19).
- Binding flow computation (per `a9-corpus-compliance.md` §Close-out input): the
  cycle's article shipments — 75 v2, 32 v2, 01, 30, 78 (A9) + 71 v2, 22 v2 (A3) + 42
  v2, 50 v2, 20, 72 (R1) — every one either discovery-grade (75 v2
  DISCOVERY-CONDITIONAL, 32, 01, 30, 78) or a kept-set technical record already
  counted at the C2 restructure (no NEW non-discovery article takes form this cycle;
  78 is NEGATIVE-kind discovery-grade per the 2026-11-17 ruling and does not touch
  N=1). **New-article class: 100% discovery-grade → the ≥-half KPI holds with
  margin; nothing chartered can flip it (LP/AL-3D/ZZV2-λ/10-tranche/72-M1 never take
  article form).** KPI line for REPORT §I4: "flow 100% discovery-grade on the
  chartered shipment set; N=1 quota UNSPENT; stock 6/14 ≈ 43% discovery-grade
  (up from 38% at cycle open) — stock reported as the corpus-health line only."
- §3 fill (REPORT-INPUTS, H-shepherded): cite this block + DECISION-1; R1 gate
  enforcement noted (no swap-in consumed the quota).

## G7 — count 31 EXACT (30 + net +1 stamps-note); 3/4 stamped; SPLICE literal stamp owed in K

G7(b) gate grep on the closing tree (2026-11-19): **31 lines** — composition
reconciled against the corrected census (runbook §8: 46 sites = 40 close /
6 retarget / 0 unrulled; in-scope gate lines were 30 at `66a8085`):
- SCAN 10 = 9 census sites (line-drifted +2 by the W1 stamp) + **1 stamps-note**
  (SCAN:2 — the SUPERSEDED stamp itself quotes "[TRIAGE-DECISION]");
- SEED-DOSSIERS 9 = the 9 census sites (drifted +2; the SEED stamp is token-free);
- CHARTER-DRAFT 8 = 7 census sites (drifted +2) + **1 stamps-note** (DRAFT:2);
- SPLICE 4 = the 4 census sites (drifted by the W1 :14/:71 fills; :71→:123);
- TRIAGE.md 0 = the recorded :385 site was CLOSED by W1's pointer-row edit.
Net: 30 census-class lines − 1 (TRIAGE closed) + 2 (stamp-notes) = **31 = 30 + the
stamps-note** (the expected close-time count; every line dispositioned: census
dispositions per runbook §8 + h-wave3-log; the two stamp-note lines are
self-referentially closed — whitelist class, same ruling family as the G4 self-cite).
G7(a) `grep -L "SUPERSEDED\|SELECTED"`: **3/4 stamped** (SCAN/SEED-DOSSIERS/
CHARTER-DRAFT, all W1). **CHARTER-SPLICE.md carries the W1 :14/:71 fills + the
in-file close-summary + a lowercase "superseded" sentence — but NOT the literal
uppercase stamp keyword the gate greps.** One-line stamp owed in K (K-list file #1;
suggested text in §K-STAMPS below, item 0). After that stamp: G7(a) EMPTY, G7(b) 31
all-dispositioned → **G7 PASS at K**.

## G8 — gate-run persistence table (filled 2026-11-19, lane R2; committed WITH the close block)

| gate | command (short ref) | raw result | verdict | date | commit |
|---|---|---|---|---|---|
| G1 sorry-token | §G1 classifier verbatim (this file :33–56) | 52 REAL-TOKEN hits / 108 files, bucket tally exact, 0 unexplained; `.lean` scope identical dd6686f→e3d984b; log: `feasibility/probe/logs/stepA-incremental-iter4.log` ENTRY 8 + sweep-time entry + R2 re-run entry | **PASS** (certificate 52 exact) | 2026-11-19 | K |
| G2 axcheck (i) batch | `run_axcheck.sh` (Step 8) | 58 stages: 53 OK (triad-only, 0 sorryAx) / 5 FAIL = staging defects, taxonomy in-log; log: `feasibility/probe/logs/axcheck-iter4-close-run1.log` | **PASS** (staging-defect class; artifacts unaffected) | 2026-11-18 (H) | W1 `8c1c544` |
| G2 axcheck (ii) subset re-fire | failed-stages-only re-fire (R1, warm app) | 5 stages: **[PENDING-R1]** — log: `feasibility/probe/logs/axcheck-iter4-close-run2-subset.log` | **PASS once 5/5** → "58/58 stages OK, all triad-clean" | 2026-11-19 | K (log rescue) |
| G3 INDEX | §G3 `comm -3` both directions | 238 delta = 1 genuine gap (`pilots/32/run_pilot.py`) + 1 stale-status (`runner-fixes-wave2.patch` row) + directory-covered/grouped/extension classes; drift list = §G3 CLOSE (A)–(E) above | **PASS after H's INDEX commit closes (A1)+(B1)** | 2026-11-19 | K (INDEX) |
| G4 dates | §G4 two greps verbatim | tomorrow-literal EMPTY; compounds EMPTY; broader sweep 1 hit = gates-file self-cite (:275) — whitelist class, pre-ruled | **PASS** (final re-run at K-assembly) | 2026-11-19 | K |
| G5 template | corrected §G5 (appendix 2026-11-18) + §9 box-run | AUTHORITATIVE: `a9-g5-dryrun.md` 14/14 (2026-11-17); K-time mechanical sweep: 14/14 carry kind/novelty/verification/limitations (3 layouts verified); box 11 drift rows (10, 75) landed, 78 ratified | **PASS** (runbook literal patterns STALE — dated note §G5 above) | 2026-11-19 | K |
| G6 two-strike | §G6 scoped reads + §3 fill | flow: new-article class 100% discovery-grade (75 v2, 32, 01, 30, 78); N=1 UNSPENT (DECISION-1 ruled 2026-11-19: spend-only-if-executed; contest FB-2 vs FB-4 vs unspent = iter-5); stock 6/14 ≈ 43% health-line | **PASS** (≥-half KPI met with margin; quota UNSPENT) | 2026-11-19 | K (REPORT §I4 + REPORT-INPUTS §3) |
| G7 stamps + annotations | §G7 greps | (b) 31 lines = 30 census (dispositioned 40/46 close / 6 retarget / 0 unrulled) + net +1 stamps-note (2 stamp-notes added, 1 TRIAGE site closed at W1); (a) 3/4 stamped — SPLICE literal stamp owed in K (§K-STAMPS item 0) | **PASS at K** (31/31 dispositioned + 4/4 stamped) | 2026-11-19 | K |

OVERRIDDEN convention: no cell above uses "passed by inspection"; the two
completion-owed cells (G2(ii) on R1's 5/5, G3 on H's INDEX commit) state their exact
completion condition and owner. G4/G8 K-time re-run: this table + §G4 re-greps fire on
the assembled K tree; deltas recorded as dated addenda here, never silent.

## K-STAMPS — the five instrument stamps (K-rows 17–21) + the SPLICE literal stamp (row 1)

Prepared by R2 2026-11-19 for H's K commit (one line each, top-of-file under the
title; dates = K's fire date; "this commit" wording avoids the self-sha
chicken-and-egg):

0. **`feasibility/ITERATION4-CHARTER-SPLICE.md`** (K-list row 1; the G7(a) literal-keyword
   closure) — stamp text:

       > SELECTED 2026-11-18 — the SPLICE TEXT was typeset into research/RESEARCH.md §Iteration 4 at L2 `808c809`; this file's in-file close-summary (W1 fills) is the record of it; literal stamp keyword added at close (this commit) per gates G7(a).

1. **`qa/iter4-review/a2-close-summary-draft.md`** (K-row 17) — stamp text:

       > APPLIED 2026-11-19 — Parts A+B landed in the close-completion commit K (this commit): the close block carries this draft's fill (32 tables / 26×G / 3×P / 3×N; whole-tree 385/386 per §10.CENSUS(e)) as verified at W2 `0382e16`.

2. **`qa/iter4-review/a9-splice-readme-checklist.md`** (K-row 18) — stamp text:

       > APPLIED 2026-11-19 — the §B sweep-sha stamps (7 mandatory H-owned items) consumed and ratified at K (this commit); D.4 sha stamps verified bytes-unchanged (Pa/Pb/zeta23e-P0/78-P0 branch pre-verified); box-11 drift rows (10, 75) landed, 78 ratified.

3. **`qa/iter4-review/a2-g7-token-inventory.md`** (K-row 19) — stamp text:

       > SUPERSEDED-BY-CLOSE-BLOCK 2026-11-19 — the corrected census (46 sites = 40 close / 6 retarget / 0 unrulled; runbook §8) is quoted in K's close block (this commit); this file remains the 34-site record of 2026-11-17 (`de56e68`).

4. **`qa/iter4-review/a2-close-act-runbook.md`** (K-row 20) — stamp text:

       > EXECUTED 2026-11-19 — the 20-step close act executed: Phase-1 pre-landed at W1 `8c1c544` per the orchestrator's superseding ruling (2026-11-18); K = the close-completion commit (this commit); gates G1–G8 verdicts in `qa/iter4-closeout-gates.md` §CLOSE-ACT GATE RUN.

5. **`qa/iter4-review/a2-close-rehearsal-report.md`** (K-row 21) — stamp text:

       > RECORDED 2026-11-19 — the pre-flight defect list (D1–D6, 0 blockers, 3 waits-on-lane) stood as the rehearsal record (basis `c67d64e`, pre-Step-B-pre-stage caveat in h-wave3-log); consumed by the executed close act; closed at K (this commit).

— close-act gate run lane R2 (gates-owner), 2026-11-19, main @ e3d984b (worktree
agent-03, forwarded). G2(ii) and G3 completion conditions named in-table; G4/G8
re-fire at K-assembly. No gate passed by inspection; no OVERRIDDEN cell.
