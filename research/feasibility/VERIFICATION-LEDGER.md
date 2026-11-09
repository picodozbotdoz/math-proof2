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

## 1 Summary table

| pilot | files | LoC | theorems (+lemmas/+examples) | proved milestones | open / in-flight | conditional on | axioms clean? |
|---|---|---|---|---|---|---|---|
| 01 inertial-defect | 12 | 9,390 | 99 (+394) | port 01–08 all green (`logs/pilot01b-run2.log`: 8×OK, 0 err); BindingSurface + MasterIdentity statement layer OK (`logs/pilot01-run3.log`) | `port/09_MasterIdentity.lean`: latest recorded run `logs/pilot01c-run6.log` **FAIL (1 error)**, `master_identity` still error-recovery sorryAx (`:152`) — **in-flight, lane R6 active** | none (unconditional port + defect identity) | port spine YES (`rank_trace_ineq`, `rank_trace_mult(_k)` clean at `logs/pilot01c-run6.log:157+`); final milestone NO |
| 11 reduction calculus | 4 | 751 | 26 | `P11T1.lean`, `P11T2.lean` OK and **axcheck-reverified with clean axioms** (`logs/pilot11-run4.log` + `logs/axcheck-run1.log`: P11T2's 18 theorems all `[propext, Classical.choice, Quot.sound]`-class, 0 sorryAx) | `RedCompA.lean` **FAIL (7 err)**, `RedCompB.lean` **FAIL (3 err)** (`logs/pilot11-run5.log` — in-flight, lane R4 active; `theorem19_of_red` still error-recovery sorryAx) | abstract `CostModel` interface (no cert binders) | T1/T2 **YES** (axcheck run, 0 sorryAx); RedComp NO |
| 20 Hecke ζ_K | 1 | 576 | 27 (+2 ex) | none recorded — staged only (`/tmp/crossmath-pilot20-stage/M1.lean`, 19:40) | M1 not yet run (not in axcheck batch per task scope) | zeta23 PaperInputs card + traces-family step + factorization as explicit binders (header :3–5) | **[runs-unrecorded]** |
| 22 quasi-RH PNT | 3 | 351 | 4 | **M1 kernel-proved**: `M1.lean: OK`, axioms `[propext, Classical.choice, Quot.sound]` (`run4.log:15`; header "no sorry, no axiom, no native_decide"); `ProbeP1_PNT.lean` OK | `Tier1.lean` **FAIL (9 err)** in latest run (`run6.log` tail); one mid-run sorryAx on `exists_logDerivExtension` (`run5.log:117`) from an earlier iteration, current files 0 sorries | M1: none (unconditional); Tier1: quasi-RH-conditional statement (per dossier 22) | M1 YES (clean 3); Tier1 NO (not elaborated) |
| 30-falsify | 1 | 284 | 9 | none recorded — **landed ~19:4x** (`pilots/30-falsify-TheoremB-h1.lean`, lane R7; header: kernel-only, "no sorry, no native_decide, no external CAS") | **[in-flight, 0 tokens]** — not elaborated by R9; axioms unrecorded until the final batch | Theorem-B falsification hypothesis h1 (R7; constructions transcribed from read-only siblings, per header) | **[runs-unrecorded]** |
| 32 Rc frontier | 1 | 492 | 13 | none recorded — **landed 19:48** (`pilots/32/M1.lean`) | **[in-flight, 0 tokens]**; axioms unrecorded until the final batch | none expected (dossier 32 is unconditional order/log work) | **[runs-unrecorded]** |
| 42 ζ_K 2/3 assembly | 3 | 1,384 | 63 (+1 ex) | **[verified — `logs/axcheck-run1.log`]** M1 elaborates **OK, 15/15 theorem axiom-lines, 0 sorryAx** (first recorded run for this pilot) | **M2a** (606 LoC / 28 th, 19:51) and **M3** (441 LoC / 20 th, 19:51): **[in-flight, 0 tokens]** — not elaborated by R9; M2b pending per coordinator | M1: zeta23 density statements + tauceti factorization as hypothesis binders, glue PROVED from `analyticOrderNatAt_mul`; M2a header: "structural-binder discharge, carries the GREEN M1 layer verbatim"; M3 = C_K common-zeros defect theorem | M1 **YES** (axcheck: standard axioms only); M2a/M3 unrecorded |
| 50 quasi-RH windows | 2 | 178 | 4 | **[verified — `logs/axcheck-run1.log`]** `M1.lean` **OK, 3/3 theorems clean** (`strip_confinement*` = `[propext, Classical.choice, Quot.sound]`-class) | `Dirichlet.lean` **[FAILED-REVERIFY]**: rc=1, **5 elaboration errors** (`logs/axcheck-run1.log`; lane's own 19:43 run had 4 — `logs/../../_unattributed/pilot52_run2.log`) — in-flight, lane R2 active | ONE binder `hQRH` = verbatim OAI quasi-RH challenge form (probe-validated standalone: `ProbeC1`, run 3 OK) (header :4–6) | M1 YES; Dirichlet NO (does not elaborate) |
| 52 CCR/Fock layer | 1 | 275 | 13 | none green | **[FAILED-REVERIFY]**: rc=1, **15 elaboration errors**, 9 theorem axiom-lines carry **sorryAx** (`logs/axcheck-run1.log`) — mechanism: Lean error-recovery inserts sorryAx into proofs that fail to elaborate (e.g. `Unknown constant CrossMath.Pilot52.bosonic_unweighted`, :274); the file itself contains no `sorry` token (header still claims "sorry-free") — in-flight, lane R2 active | abstract `OccupationPair` structure, ε-parameterized; no external cert binders (header :5–6) | NO (does not elaborate) |
| probes (R9) | 13 | 673 | 9* | 13/13 elaboration probes serve their purpose (final states: A2/A3/A4/B1/B2/B3/C1/C2/D/E/F all recorded OK/expected-FAIL-with-named-errors) | — (probes are point-in-time; A retains its 2 known-name FAILs by design) | none (statement elaboration only) | n/a by design (no `#print axioms`; sorried probes are scaffolding, never results) |

Totals (current tree, round-9 refresh — tree still moving, 9 files edited after 19:50):
pilots **13,768 LoC / 256 theorems / 437 lemmas / 28 files** (includes newly landed
30-falsify 284/9, 32-M1 492/13, 42-M2a 606/28, 42-M3 441/20 — all [in-flight, 0 tokens]);
probes **673 LoC / 9 theorems (all probe-convention stubs)**. Project-wide proved (green +
axioms-clean recorded): pilot 22 M1 (68 LoC, 1 theorem) is the only fully proved-and-
axioms-recorded milestone; pilot 01's 8-file port (7,774 LoC green elaboration, axioms
recorded clean for `RHLinalg.rank_trace_ineq` and `rank_trace_mult` at
`pilot01c-run5.log:158–159`) plus pilot 11's T1/T2 (444 LoC green, axioms unrecorded).

*Probe theorem counts: B1=3, B2=1, C1=1, D=4 (statement stubs with `sorry`), E=1
(trivial binder wrapper — actually proved, no sorry).

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
