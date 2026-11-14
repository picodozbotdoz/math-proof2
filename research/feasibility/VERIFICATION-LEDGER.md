# VERIFICATION-LEDGER — Lean artifacts, run evidence, ground-rules compliance

Lane R9, 2026-11-09 (round 7). Sweep of the CURRENT state of `research/pilots/` and
`research/feasibility/probe/` (a final re-sweep happens on the coordinator's signal).
This is the data source for REPORT.md §Proved-artifacts-ledger and
§Ground-rules-compliance; every cell is citable (file path, log path, or log:line).
Modal evidence: all runs through app `crossmath-probe` (ephemeral; image = elan v4.2.4 +
toolchain v4.36.0-rc2 + mathlib `ff2494ea` with 8,710 cached olans; per-run container
4 CPU / 32 GiB). Probes runs 1–10 transcripts: `/tmp/crossmath-probe-run{1..10}.log`;
pilot logs: `research/pilots/22/run{1..6}.log` (in-repo), `/tmp/pilot01*run*.log` (9),
`/tmp/pilot11-run{2,3,4}.log` (3). Pilot stage dirs: `/tmp/crossmath-pilot{20,42,50,52}-stage/`.

## 1 Summary table — FINAL (final sweep, 2026-11-09 resume session; supersedes the round-7/9 table)

Every cell is backed by `research/pilots/<NN>/logs/axcheck-final.log` (one Modal batch over
30 staged files = each pilot's final files + appended `#print axioms` for every top-level
theorem; `research/feasibility/probe/{make_axcheck.py,axcheck_probe.py,run_axcheck.sh}`)
unless noted. **30/30 files OK** (29 direct; `AxPilot20_M1` green on the single-file re-run
after the extractor fix); **0 sorryAx**; every axiom set ⊆ {propext, Classical.choice,
Quot.sound} — of the 323 theorem-axiom verdict lines captured verbatim in the log, 307 are
the full triad and 16 are `[propext, Quot.sound]` (3 triad lines are line-wrapped); the
tool's per-file tally totals 413 theorem-axiom lines (log excerpts omit some wrapped
printouts). [erratum 2026-11-10, orchestrator audit: earlier "29/29 OK; 303 axiom lines
(283× triad)" misstated both counts.]

| pilot | files | LoC | thm (+lem) | proved milestones (final) | conditional on (explicit binders) | axioms |
|---|---|---|---|---|---|---|
| 01 inertial-defect | 14 (10 port, 2 probes, 2 layer fragments) | 11,704 | 137 (+478) | port spine 01–08; **`master_identity` + `rank_trace_mult_k_of_master`** (port/09); **`tightness_of_master`** (port/10) | none — unconditional | clean (port/09: 42 lines, port/10: 41 lines) |
| 11 reduction calculus | 4 | 781 | 24 | P11T1/T2; **`Red.comp`**, `red_of_theorem_17`, **`theorem19_of_red`** (RedCompA/B — both designs green; B is the record) | abstract `DetTimeModel` interface only | clean |
| 20 Hecke/ζ_K engine | 1 | 582 | 27 | instantiation theorems, λ→1 upgrades, `family_merge`, `merged_mult_of_common`, hCZ seam | zeta23 `PaperInputs` card + traces family + engine step (binders) | clean (36 lines; first batch FAIL was a docstring-extraction artifact, re-run OK) |
| 22 quasi-RH PNT | 3 | 435 | 5 | M1 Laurent constant; **M4 `tendsto_psi_div_atTop` (ψ(x)/x → 1)** in Tier1 | none (unconditional) | clean |
| 30 Hall/Parseval | 2 | 583 | 20 (+48) | **`TheoremB2_refuted_h1`** (refutation) + faithfulness checks; **`Qh1_closed_form`, `Qh1_monomial`, `Qh1_comm_monomial`** (ClosedForm) | none (unconditional) | clean (`scalar_second_diff`: propext + Quot.sound) |
| 32 Rc frontier | 1 | 511 | 13 (+28) | **`frontier_of_crossing`, `frontier_nonempty_iff`, `ceiling`, `crossing_unique`**, `lnΛ_10_0` | crossing point as a parameter (`IsCrossing ε cₓ`) | clean |
| 42 ζ_K 2/3 assembly | 4 | 2,552 | 115 | M1, M2a, M3, **M2b: `zetaK_two_thirds_landed`, `zetaK_distinct_five_sixths_landed`, `…_of_negligible`** | Knausgård cert + clean-layer transcriptions, zeta23 ThmE, tauceti ported statements, `hntopζ`; `hCZ` for the last | clean (M2b: 55 lines) |
| 50 quasi-RH windows | 2 | 167 | 4 | `strip_confinement*` (M1), `strip_confinement_dirichlet` (M2a) | `hQRH`; `hQRHχ` + `hFEχ` | clean |
| 52 occupation calculus | 1 | 292 | 12 | **`dual_family`**, `sign_transposition`, `fermionic_create_sq`, `fermionicPair` (6/6) | none (unconditional) | clean (`dual_family`: propext + Quot.sound) |
| probes (R9) | 13 | 673 | 9* | 13/13 elaboration probes serve their purpose | n/a | n/a by design |

Totals (final disk): pilots **32 files / 17,607 LoC** (of which the cumulative 10-file port
spine is 11,068) **/ 357 theorems / 554 lemmas**; 76 persisted `.log` files before the final
sweep + 9 `axcheck-final.log` copies. Probe-convention theorem counts unchanged (*B1=3, B2=1,
C1=1, D=4 stubs; E=1 proved).

Post-sweep addition (2026-11-10, not in the totals above): pilot 10 M1 (`pilots/10/M1.lean`,
2,043 LoC, 135 non-private theorems; headline `exists_tm_space`, unconditional) is GREEN on Modal
(run 4 on the committed file: 0 errors / 0 sorry / 0 warnings). Axioms ⊆ {propext, Classical.choice,
Quot.sound} for all 135, checked with `pilots/10/axcheck_full.py`; the `AxPilot10_M1` target in
`make_axcheck.py` only covers the first component of dotted names, so use the full generator.
Logs: `pilots/10/logs/m1-run{1,2-green,3-confirm-axcheck,4-final}.log`.

Pilot 21 (milestone C) is a numeric certification outside Lean (`research/pilots/21-milestoneC.md`),
not a kernel artifact; it is listed in REPORT §7 separately.

## 2 Probe files (R9's own artifacts) — per-file detail

| file | LoC | th | sorry (actual) | decide | header convention | last run verdict |
|---|---|---|---|---|---|---|
| Probe0_Smoke | 5 | 0 | 0 | 0 | probe header | OK (runs 1–10) |
| ProbeA | 52 | 0 | 0 | 0 | probe header | FAIL-by-design: 4 unknown-id lines = 2 probe-side name errors (corrected in A2) + the sigPos pair (settled by A4) |
| ProbeA2 | 16 | 0 | 0 | 0 | probe header | OK for 4 checks; keeps 2 expected FAILs (sigPos names — settled by A4) |
| ProbeA3_F1batch | 23 | 0 | 0 | 0 | probe header | OK (runs 4–10, after `Matrix.isSymmetric_toLin_iff` fix) |
| ProbeA4 | 14 | 0 | 0 | 0 | probe header | OK (run 4+): root `sigPos`/`sigNeg` confirmed importable |
| ProbeB1_RHLinalg | 69 | 3 | **3** | 0 | "statement elaboration probe — not a proof artifact" | OK, 0 errors (runs 1–6) |
| ProbeB2_EthTime | 26 | 1 | **1** | 0 | idem | OK, 0 errors |
| ProbeB3_3sumEnd | 144 | 0 | 0 | 2 (donor-verbatim defs, not ours) | idem + verbatim-donor note | OK, 0 err, 0 warn (donor file itself is defs-only) |
| ProbeC1_OAI_QuasiRH | 16 | 1 | **1** | 0 | idem + "sorry is the challenge file's own placeholder" | OK (run 3+) |
| ProbeC2_OAI_Model | 119 | 0 | 0 | 0 | idem (verbatim donor defs file) | OK, 0 err, 0 warn (runs 3+) |
| ProbeD_PairCeiling | 94 | 4 | **4** | 0 | idem | OK, 0 errors (run 6, after probe-side `encl` typing fix) |
| ProbeE_Zeta23Binder | 58 | 1 | 0 | 0 | idem | OK, 0 err, 0 warn (runs 5–6) — the binder wrapper is proved |
| ProbeF_MathlibBatch | 37 | 0 | 0 | 0 | idem | OK, 0 errors (run 10, after 3 name + 2 import-path fixes) |

Probe-convention justification (per the round-2 task mandate, quoted in every file's
header): probe sorries are elaboration scaffolding inside files that are not proof
artifacts and are never cited as results — all reported results are elaboration
verdicts (0-errors / named errors). `decide` appears only inside the verbatim donor copy
B3 (word-RAM defs) — not our usage; `native_decide` occurs in zero probe files.

Modal evidence: run 1 cold (image build + 5 files) ≈ 3 min 45 s wall; run 2 warm 68 s;
runs 3–10 warm ≈ 1.5–2.5 min each (10 probe runs total; see `port-probe.md` §1 for the
cost model). One probe-side infra fix note: run 5's first launch aborted pre-Modal
(python `-I` import isolation) — re-launched same round; no Lean evidence affected.

## 3 Compliance statement (draft for REPORT.md §Ground-rules-compliance)

**Our-artifacts vs donor-artifacts.** Everything under `research/pilots/` and
`research/feasibility/probe/` is ours. Donor material enters in exactly three ways:
(1) *verbatim copies inside probe files* (B3 = 3sum `EndStatement.lean`, C2 = OAI
`Model.lean`), each header-marked as a verbatim donor copy and used only as an
elaboration target — no donor line is ever cited as a proved result of this project;
(2) *donor statements restated as hypothesis binders* in the pilots' conditional
postures (42: zeta23 density statements + tauceti factorization; 50: `hQRH`; 20:
PaperInputs/traces/factorization) — explicitly labeled binders, so the unconditional
content of each pilot theorem is exactly what its proof establishes; (3) *ported proofs*
(pilot 01's `port/` tree), which re-prove the zeta23 RHLinalg chain against v4.36
mathlib and are validated by elaboration plus recorded `#print axioms` — these become
ours by the port act, with provenance headers pointing at the donor files.

**Charter caveat, stated precisely.** The one sanctioned deviation from "prove
everything from Mathlib alone" is *clean-layer consumption of donor results with
explicit certificate binders*: a donor theorem may be consumed as an explicit hypothesis
(`hQRH`, PaperInputs binders, …) exactly when the consuming theorem is stated so that
removing the binder yields an unconditional statement of ours. Computational donor
inputs (interval-arithmetic enclosures) are never inlined; they may only enter the way
zeta23's `EnclOK` does — as a named, sha256-stamped hypothesis external to the Lean
development (the `EnclOK` precedent: `zeta23/Zeta23/PairCeiling/NumericCert.lean:72`,
certificate `cc3de991…`, survey §2(a)). `native_decide` is forbidden in our artifacts
(the word appears in this tree only inside "no native_decide" compliance headers);
`decide` is fine for finite checks per the math-proof1 standard (kernel-only), and the
one occurrence in probe B3 is donor-verbatim defs, not our proof step.

**Current compliance state** (to be re-attested at the final sweep): no actual `sorry`
in any pilot file (all 13 nonzero grep hits are header-compliance mentions — verified
line-by-line this round); no `native_decide`; axioms recorded and clean only for pilot
22 M1 and (for the ported spine) pilot 01's `rank_trace_ineq`/`rank_trace_mult`
(`pilot01c-run5.log:158–159`); four pilots staged-but-unrun (20/42/50/52) and three
in-flight failures (01-09, 11-RedCompA/B, 22-Tier1) — all listed in §1 for their lanes
to clear before final.

## 4 Round-8 update — log custody + axcheck re-verification (R9, 2026-11-09)

**Log custody.** All pilot/probe evidence that lived only in `/tmp` is now in-repo, each
with a one-line provenance header (original path, mtime, producing lane, rescue date):

- `research/pilots/01/logs/` — 10 logs (`pilot01-run{2,3}`, `pilot01b-run{1,2}`,
  `pilot01c-run{1..6}`), producing lane R6.
- `research/pilots/11/logs/` — 4 logs (`pilot11-run{2..5}`), producing lane R4.
- `research/feasibility/probe/logs/` — 10 logs (`crossmath-probe-run{1..10}`), R9.
- `research/pilots/_unattributed/pilot52_run2.log` — dual-owner (covers pilots 50 AND 52
  in one run, 19:43, producing lane R2); kept unattributed pending lane disambiguation.
- `research/pilots/22/run{1..6}.log` were already in-repo (left in place).
- `research/pilots/{42,50,52}/logs/axcheck-run1.log` — the round-8 axcheck batch (below).

**Axcheck batch** (`research/feasibility/probe/{make_axcheck.py,axcheck_probe.py,run_axcheck.sh}`;
Modal app `crossmath-probe` re-used, warm; raw transcript `/tmp/crossmath-axcheck-run3.log`,
rescued into the four pilots' `logs/axcheck-run1.log`). Method: verbatim copy of each
pilot file + appended `#print axioms` for every top-level theorem (namespace-aware);
elaborated in dependency order (`P11T1` → olean → `P11T2`) with `lean -o` against mathlib
`ff2494ea`. Repo files untouched. Verdicts on the CURRENT in-repo state:

| file | verdict |
|---|---|
| 11/P11T1 | OK (defs layer, no theorems) — green reproduced |
| 11/P11T2 | OK; 19 axiom-lines, **0 sorryAx** — green reproduced, axioms now RECORDED clean |
| 42/M1 | **OK; 15/15 theorem axiom-lines, 0 sorryAx — first recorded run; [runs-unrecorded] closed as [verified]** |
| 50/M1 | **OK; 3/3 theorems clean (`strip_confinement*`) — [verified]** |
| 50/Dirichlet | **FAILED-REVERIFY**: rc=1, 5 elaboration errors (lane's own 19:43 run: 4 errors) |
| 52/M1 | **FAILED-REVERIFY**: rc=1, 15 elaboration errors, 9 theorem axiom-lines with sorryAx — error-recovery artifact of failed elaborations (e.g. `Unknown constant CrossMath.Pilot52.bosonic_unweighted` at :274), NOT hidden sorries: the file contains no `sorry` token (only its "sorry-free" header claim, now stale) |

**In-flight, lanes active (per task rule 3, not touched by R9):** 01 `09_MasterIdentity`
(latest `logs/pilot01c-run6.log`: 1 error), 11 `RedCompA/B` (`logs/pilot11-run5.log`:
7+3 errors), 22 `Tier1` (`run6.log`: 9 errors), 50 `Dirichlet`, 52 `M1` (both above).
Non-reproduction note: 11 T1/T2 reproduced exactly; 42/50-M1 verified first-time green;
50-Dirichlet and 52 did not elaborate — reported verbatim above for their lanes.

## 5 Round-9 note — ledger-sync with moving disk (R9, 2026-11-09 ~19:55)

Folded into §1 on coordinator instruction (status [in-flight, 0 tokens], NOT verified):
`pilots/30-falsify-TheoremB-h1.lean` (284/9, lane R7), `pilots/32/M1.lean` (492/13),
`pilots/42/M2a.lean` (606/28), `pilots/42/M3.lean` (441/20). Also observed edited after
the round-7/8 sweeps (owners' lanes active, no R9 action): `01/master_layer.lean`,
`01/port/09_MasterIdentity.lean`, `11/RedCompA.lean`, `11/RedCompB.lean`, `20/M1.lean`,
`22/Tier1.lean` (now 283 LoC / 4 th), `50/Dirichlet.lean` (70 LoC), `52/M1.lean`.
All remain 0 real sorry tokens (round-9 certificate, FINAL-SWEEP-PLAN.md §1); their
verification status is only re-established by the final axcheck batch (plan §3).

## 6 Final sweep (2026-11-09 resume session, executing `probe/FINAL-SWEEP-PLAN.md`)

- **Step A (sorry tokens):** classifier re-run over 45 `.lean` files → exactly the 9 expected
  probe-convention lines (ProbeB1 :51/:60/:67, ProbeB2 :26, ProbeC1 :14, ProbeD :57/:70/:78/:92);
  0 tokens in any pilot file. `native_decide` occurs only in compliance-header prose
  (11 files) and one M2b comment describing the donor's headlines.
- **Step B (axioms):** `make_axcheck.py` TARGETS extended to the final file list (adds
  01/port/10, 11/RedCompA/B, 20/M1, 22/*, 30/*, 32/M1, 42/M2a/M2b/M3); extractor made
  section- and comment-aware (a section's `end` no longer pops the namespace; docstring prose
  beginning with "theorem" is skipped — this caused the one first-batch FAIL,
  `Unknown constant CrossMath.Pilot20.needs`, cleared by a single-file re-run). Result: 30/30
  OK (29 direct + the re-run), 0 sorryAx. Raw transcript rescued into all nine
  `pilots/*/logs/axcheck-final.log`.
- **Step C (ledger):** §1 rewritten from the final batch (above).
- **Pilots closed in this session:** 30 (falsify FAIL 12 → 6 → **OK**; ClosedForm new, 1 → **OK**)
  and 32 (FAIL 22 → 2 → **OK**) — `pilots/30/logs/run{2,3-green}.log`, `pilots/32/logs/run{2,3-green}.log`,
  notes `pilots/30-note.md`, `pilots/32-blueprint.md`.

## 7 Compliance sign-off (Step D)

> Signed off (final sweep, 2026-11-09): all kept pilot artifacts elaborate on mathlib
> `ff2494ea` (v4.36.0-rc2) with standard axioms only — no `sorry`, no `native_decide`,
> no external CAS in any artifact of this project; the sole `sorry` tokens in the tree
> are the 9 probe-convention stubs inside header-justified elaboration-probe files,
> never cited as results; donor material enters only as verbatim marked probe copies,
> explicit hypothesis binders, or ported-and-re-proved layers with clean axiom records
> (`logs/axcheck-final.log`).

## 8 Cycle-2 addendum — pilot 20/52 close-outs (lane A8, 2026-11-13)

- **Pilot 20: [runs-unrecorded] → [verified Cycle 2].** The 2026-11-09 M1 elaboration
  runs (blueprint §6, 9 cycles) were never persisted to `pilots/20/logs/`; A8's
  reproduction on the unchanged `M1.lean` (582 LoC / 26 top-level theorems) is GREEN:
  `errors=0, sorry-warnings=0` (5 benign linter notes, the blueprint-documented ones).
  Full-coverage axcheck re-run `pilots/20/logs/axcheck-cycle2.log`: AxPilot20_M1 OK,
  **36 axiom-lines, 0 sorryAx**, all ⊆ {propext, Classical.choice, Quot.sound}.
  Elaboration log `pilots/20/logs/m1-cycle2-green.log`; note `pilots/20-note.md`.
- **Pilot 52: Cycle-2 re-verification recorded.** M1 was already fixed by lane R2 on
  2026-11-09 (run 14 whole-file green; the recorded `axcheck-run1` FAIL was a
  mid-iteration snapshot whose 9 sorryAx were error-recovery artifacts of failed
  elaborations, per §4's own reading). Reproduced fresh:
  `pilots/52/logs/m1-run15-cycle2-green.log` (`M1.lean` OK, 0 errors / 0
  sorry-warnings; 292 LoC / 12 theorems, byte-identical to run 14's verified file) and
  `pilots/52/logs/axcheck-cycle2.log`: AxPilot52_M1 OK, **15 axiom-lines, 0 sorryAx**
  (9 × [propext, Quot.sound], 3 × full triad). Note `pilots/52-note.md`;
  `_unattributed/pilot52_run2.log` attributed to `pilots/52/logs/m1-run2.log`
  (`_unattributed/` now empty).
- **Substrate note (both Cycle-2 runs):** this shell blocks `sudo -n -u xyz`, so A8's
  runners use the doz modal profile (`MODAL_USER=doz`, `/home/doz/dozenv/bin/modal`)
  instead of xyz's; substrate otherwise identical — same image, mathlib `ff2494ea`,
  toolchain v4.36.0-rc2, 8,710 cached oleans (per-pilot runners
  `pilots/{20,52}/run_m1.sh`, doz default with xyz fallback).


## 9 Cycle-2 final-sweep skeleton (lane A1, 2026-11-13; relaunch cross-check 2026-11-14 — orchestrator-authorized addendum; H informed; fill-in at sweep execution per `probe/FINAL-SWEEP-PLAN-C2.md`)

Verdict columns are **[pending final sweep]** until Steps A–B of
`probe/FINAL-SWEEP-PLAN-C2.md` run on the orchestrator's trigger. The 2026-11-14 relaunch
cross-check (post-outage) re-read every file and log tail cited below against the snapshot
commit `ca4fd22` (working tree clean at check time); `status` reflects the relaunch lane
assignments per `RESUME-BRIEF-C2.md`, `last-verified` = date of that re-read. No
drop-declared rows yet. Sweep machinery pre-verified post-outage the same day:
`run_axcheck.sh AxPilot10_L1` → OK, 36 axiom-lines, 0 sorryAx
(`feasibility/probe/logs/axcheck-c2-machinery-check.log`; runner now defaults to
`MODAL_USER=doz` per the relaunch protocol — see plan §0 machinery note).

**Interruption note (2026-11-14 ~03:15):** A1's execution window was killed mid-flight
(disk silence); the uncommitted §9/§0a edits survived on disk (H committing). The
post-interruption reconciliation (same day, ~03:2x) re-verified every §9/§0a row against
disk: 11-M2 confirmed exactly as written (`m2-run8-GREEN` + `m2-axcheck-final`); the
stale rows were 72-M1 and the G-series paragraph — both updated below.

| pilot | final files | LoC/thms (on-disk 11-14) | status (relaunch) | axcheck verdict (log cite) | sorry tokens | sign-off | last-verified |
|---|---|---|---|---|---|---|---|
| 42-M4 (donor swap) | `M4a.lean` | 1194 / 52 | **FINAL-GREEN** (upgrade pilot, if it touches M4a, re-baselines this row) | **M4a GREEN** — elaboration `pilots/42/logs/m4-run2.log` ("M4a.lean: OK") + axcheck `m4-axcheck-run1.log` ("AxPilot42_M4a_full.lean: OK") | 0 (Step A pre-baseline) | [pending final sweep] | 2026-11-14 |
| 42-M4 | `M4b.lean` (final = PRIMARY route) | 1571 / 68 | **FINAL-GREEN via m4b2-run2 (upgrade COMPLETE)** — direct ZetaZerosV2 import GREEN; fallback preserved byte-exact at `logs/M4b-fallback-GREEN.lean`. A3 official report pending | **OK — independently verified by A1's donor-tree axcheck dry-run 2026-11-14** (`feasibility/probe/logs/m4b-donor-axcheck-dryrun.log`: axcheck copy in the built V2 tree, 78 axiom-lines, **0 sorryAx**, all ⊆ triad incl. donor `ZetaZeros.simple_proportion_d4/distinct_proportion_d5`) | 0 | OK (pending sweep confirm) | 2026-11-14 (donor-axcheck dry-run) |
| 71 (FF-EZ1) | `P0.lean` | 112 / 4 | **FINAL** (probe-convention — Step A only, never Step B) | header `P0.lean:10–20`; run verdict `pilots/71/logs/run4.log`: "P0.lean: OK (probe, sorry allowed)" | 4 placeholders (certified in plan §1) | [pending final sweep] | 2026-11-14 |
| 71 | `P1.lean` | 131 / 7 | **FINAL-GREEN** (triad axioms visible in run4 tail) | **P1 GREEN** — `pilots/71/logs/run4.log` ("P1.lean: OK", 7 triad axiom lines) | 0 | [pending final sweep] | 2026-11-14 |
| 71 | `P2.lean` | 282 / 11 | **FINAL-GREEN (A2, p2-run6)** — descent 6→4→2→1→OK; 11 theorems ALL triad, 0 sorry/0 errors, lint-clean; W1 honestly corrected (pole-family exclusion; prework's s≠1 unsound); Mathlib-only imports | OK (p2-run6 axiom prints; sweep Step B re-confirms) | 0 | OK (pending sweep confirm) | 2026-11-14 (p2-run6) |
| 72 (area-law) | `C-neg.lean` | 369 / 11 | **FINAL (A4 report OFFICIAL, relayed 2026-11-14)** — run8-final GREEN rc=0/0/0 (descent 7→3→1→OK); A4 axcheck `axcheck-run1.log`: **11/11 theorems triad-only, 0 sorryAx** (headline `CrossMath.CNeg.rank_area_law_nogo` + private helpers); deviations documented in `pilots/72-prework.md` execution note; all logs carry provenance headers (runs 1–5 reconstructed, 6–8 + axcheck native) | OK (official; sweep Step B re-confirms) | 0 | OK (pending sweep confirm) | 2026-11-14 (official relay) |
| 72-M1 (Tier-C) | `P72M1T1.lean`, `P72M1T2.lean` (`pilots/72-M1/`) | 702 / 47; 360 / 25 | **FINAL-GREEN, partial-M1 FINAL-for-tranche (A8 formal 2026-11-14 — same pattern as 75)** — m1-run8-GREEN: BOTH files OK, 0 errors / 0 sorry-warnings; T1 GREEN since run 4, T2 descent 24→10→1→0 (runs 6–8, within the ≤5 cap); **L1 ptrace-Gram + entropy match, L2 at constant 1 (stronger than the ≤4 safety form)**, vendor layer verbatim; **L3 + interface theorem NOT landed — carried to iteration 4 by design** (continuation spec in the m1-run8-GREEN.log header; A8 formalizing `pilots/72-M1/L3-spec.md`) | **OK** — `pilots/72-M1/logs/m1-axcheck-final.log`: both staged copies OK, **52 + 28 axiom-lines, 0 sorryAx, triad-only** (A8's local variant builder; A1 folded its attribute-prefix regex + added both targets to `make_axcheck.py` — outputs unit-checked byte-identical; sweep Step B re-confirms) | **0 / 0** (Step A classifier run on both final files 2026-11-14 — proof artifacts, baseline 43 unchanged) | OK (pending sweep confirm) | 2026-11-14 (m1-run8 + m1-axcheck-final + A8 formal relay) |
| 73 (FF C-series) | `P0.lean` (Q0 probe) + `C.lean` (Q1–Q3) | 143 / probe; 236 / 7 | **FINAL-GREEN (A2, run6-c-green)** — C.lean: Q1 transplant + Q2 `hecke_continuation` + Q3 `hecke_window` + 71-glue, 7 theorems ALL triad, 0 sorry/0 errors (descent 2→4→4→2→OK across runs 2–6; ∘-form Differentiable.comp haves dodge the HO-unification pathology); **Q4 (hRat discharge) NOT attempted — orchestrator gate holds** | C.lean OK (run6 axiom prints; sweep Step B re-confirms); P0 = probe-convention Step A only (7 stubs, in the 43-token baseline) | 7 (P0 probe-convention, enumerated); C.lean 0 | OK (pending sweep confirm) | 2026-11-14 (run6-c-green) |
| 75 (ζ_L proportions) | `Pa.lean` | 1557 / 66 (= 1,194 pilot-42-M4a carried verbatim + 363 new) | **FINAL-FOR-ENTRY (A4 formal report + orchestrator DECISION 2026-11-14)** — P-a + C1@2/3 GREEN: run6-final rc=0 (descent 26→0 over 6 runs); in-file axcheck 17/17 triad incl. heritage landings; Mathlib-only imports (plain axcheck class). **DECLARED DEFERRAL: P-b/N2/N3 → iteration 4** (assigned C2 scope complete per F0 sequencing; P-b design being formalized by A4 as an iteration-4 input) | OK (A4 in-file axcheck 17/17; sweep Step B re-confirms) | 0 | OK (pending sweep confirm) | 2026-11-14 (A4 formal) |
| 10-L1 | `L1.lean` | 529 / 25 | **FINAL-GREEN** | `pilots/10/logs/l1-run4-final.log` ("Pilot10_L1.lean: OK" + axcheck "AxPilot10_L1_full.lean: OK", triad, e.g. `PaddedDescent.F.descendC_uncut`: [propext]) | 0 | OK (pending sweep confirm) | 2026-11-14 |
| 10-L2 | `L2.lean` | 2625 / 151 | **FINAL-GREEN (A6 formal report, 2026-11-14)** — `l2-run5-final-green.log`: BOTH OK (`Pilot10_L2.lean` + full-axcheck copy `AxPilot10_L2_full.lean`), **151/151 theorems ⊆ triad, 0 sorryAx**; descent 12→3→1→0 across l2-run1..5; sha256-stamped provenance header; A6 also fixed `axcheck_full.py` (namespace/section-aware — `end Steps` no longer pops a namespace) | OK (l2-run5-final-green; sweep Step B re-confirms via the fixed full generator) | 0 | OK (pending sweep confirm) | 2026-11-14 (A6 formal) |
| 11-M2 | `P11T3.lean`, `RedTm2.lean` | 1100 / 88, 421 / 8 | **FINAL-GREEN (A8, m2-run8)** — ALL SIX files OK (T1/T2/T3/RedCompA/B + **RedTm2 OK**; RedTm2 churn **4→2→3→6→3→2→2→0** across m2-run1..8 — corrected per A8 formal report 2026-11-14: run 5 showed 3 error sites, its counter read 4); P11T3 axcheck-clean independently (A1 fix-verify run); A8 close-out report received | **OK — full axcheck landed** (`pilots/11/logs/m2-axcheck-final.log`: both staged copies OK, 64 + 12 = **76 axiom-lines, 0 sorryAx**, all ⊆ triad; P11T3 also `axcheck-c2-p11t3fix-verify.log` 64/0; sweep Step B re-confirms) | 0 | OK (pending sweep confirm) | 2026-11-14 (m2-run8 + m2-axcheck-final + A8 formal) |
| 52 / 20 | `M1`s | 292 / 12, 582 / 26 | **CLEAN (cross-ref)** — no drop, drift-check only | already clean (2026-11-09 resume final sweep §6–§7, 30/30 staged OK, 0 sorryAx; Cycle-2 re-verification §8: `20/logs/axcheck-cycle2.log` 36 lines 0 sorryAx, `52/logs/axcheck-cycle2.log` 15 lines 0 sorryAx) | 0 | clean (cross-ref §8) | 2026-11-14 |

Conditional TARGETS additions on landing (not yet rows): **42-M4b-upgrade** (A3, G2-cleared
gated continuation — direct V2 import; may modify or extend `M4b.lean`, re-baseline that row),
**50-M2** (gated: R1 openai in-corpus 7/8 on G7b — no G7b verdict yet; R2 DZDF statement-level
only per G1b). Probe/gate items outside TARGETS: G7b (donor-pin axiom audit, died in outage),
G5a/G6a staging runs (A7).

G-series state (A1 post-interruption reconciliation, 2026-11-14 ~03:2x — supersedes the
~02:0x paragraph): **G6a TERMINAL** — run21 build FAIL rc=1, **errors=7,493** (Stacks
partial-build pricing captured at job 12010/19336; confirmed negative, DONE-FAIL). **G7b**
— run19 FAIL rc=1 (errors=9, failed_modules=3: donor built unpatched — the lean4341 patch
tier only fires on `lake update`, which the cache path skipped); run22 (attempt 2) applied
**all 12 patches cleanly** then died mid-build in the interruption (wrapper killed, remote
container torn down); **attempt 3 launching** (A7 resumed — patch mechanism proven, no
probe-side changes needed). **G5a** — run20 died verdict-less ~35 min in (wrapper
externally killed — NOT a cache failure; the seed fallback had already engaged; header
note in-file); run23 (nohup-decoupled final retry) hit `mathlib: failed to fetch cache`
again → **BLOCKED-INFRA disposition expected** (A7). G7b/G5a dispositions are
sweep-relevant but NOT sweep-gating TARGETS rows (50-M2 has no row; G-probes sit outside
TARGETS by §0a).

Conventions (Cycle-2): (i) probe-convention stubs = the 36 header-justified tokens
enumerated in `probe/FINAL-SWEEP-PLAN-C2.md` §1 (9 main-run + 23 G-series + 4 in
`pilots/71/P0.lean`) — never cited as results; (ii) donor-consumption audit — external
donors (DZDF, Weil, Liu-1, upstream PNT+) enter proof artifacts only as hypothesis
binders, verbatim marked probe copies, or already-built on-pin libraries (ZetaZerosV2 =
built per G2; DZDF statement-level only per G1a/G1b); (iii) substrate note — Cycle-2 runs
use the doz Modal CLI directly (`MODAL_USER=doz`; `sudo -n -u xyz` blocked in this
environment; `pilots/71/run_pilot.sh:11`).

> Compliance [pending final sweep]: signed off only after FINAL-SWEEP-PLAN-C2 Steps A–C —
> all kept Cycle-2 artifacts elaborating on mathlib `ff2494ea` (v4.36.0-rc2), standard
> axioms only, 0 unexplained sorry tokens, logs persisted with provenance headers
> (`logs/axcheck-final-c2.log` per pilot).
