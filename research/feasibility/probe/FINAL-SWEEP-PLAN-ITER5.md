# FINAL-SWEEP-PLAN-ITER5 — Iteration-5 mechanical close-out (PREP ONLY — execute on the orchestrator's final signal; rows finalize as pilots land)

Lane R1 (verification-integrity successor; worktree agent-02), 2026-11-19. Fourth in
the lineage: main-run `FINAL-SWEEP-PLAN.md` (R9) → `FINAL-SWEEP-PLAN-C2.md` (A1,
EXECUTED) → `FINAL-SWEEP-PLAN-ITER4.md` (A1/R1, EXECUTED at the iter-4 close act —
Step A 52 exact; Step B(i) 58-stage sweep + 5-defect staging fix + 5/5 subset re-fire;
Step B(ii) 9/9 custody batch; citations of record; `VERIFICATION-LEDGER.md` §10 +
Step D). Read the three first. **Do not execute before the orchestrator signals the
Iteration-5 pilot lanes final.** Run from the repo root; budget ~10–30 min (one warm
Modal batch + local sweeps; donor-tree/heavy stages cost extra).

**Defaults inherited from the iter-4 close residue (2026-11-19, all standing):**
full-coverage private+lemma-aware custody (R3 §4/§5), widened error counters
(`error(<code>)` forms; backtick sorry-warnings), wrapped-line joining, no
middle-excerpting (elided axiom lines persist in full), sha256-at-sweep, **order.txt
dependency-ordered emission** (`make_axcheck.py` emits; `axcheck_probe.py` reads;
absent → sorted glob), **AxDep_ compile-only dep stages** and **AxFC_ full-coverage
custody stages** (`axb_close_iter4.py` + `run_axb_close_iter4.sh`), and
**GIT_BYTES_OVERRIDES** (staged bytes of record may be a committed REV, not HEAD).
Class rulings follow the file's OWN header + declaration census at landing — never an
inherited label (the ff-ez2-P1 correction, iter-4 close: a "probe-convention" TARGETS
comment was wrong; the file was proof-class, discharged by bytes-unchanged citation).

## 0 Scope — Iteration-5 TARGETS inventory (pre-staged 2026-11-19; rows land on landing)

Baseline at prep: main carries the day-1 spines `pilots/41/P0.lean` (statement rung,
1 public theorem `Pilot41.phi_parts`, sha `3ba649fa12cca395`, landed `f5cfe5e`
2026-11-18) and `pilots/zzv2-lam/eta-pin-probe.lean` (320 LoC, sha `afa0c06c514ef74b`,
landed `c359f48`). Everything else below is worktree-side until H's opening-commit
pulls + subsequent landings; statuses update per lane formal reports.

| slot | expected final file(s) | class / Step-B treatment | notes |
|---|---|---|---|
| 10-D4 **M-arc** (R3, agent-07; reported GREEN day-1) | `pilots/10/M-arc.lean` | **AxPilot10_MArc — RECOMMENDED as the SINGLE tranche-final anchor row** (the `AxPilot10_L5` single-anchor precedent: orchestrator ruling 2026-11-18, FINAL-SWEEP-ITER4 §0 `[SUPERSEDED… single tranche-final anchor…]` — L5 embeds L4/L3 verbatim, one row covers the tranche's final theorem state, earlier rungs stay §-historical citations). CONDITION at landing: verify M-arc EMBEDS L5 verbatim (the L4-in-L5 pattern). If instead it `import`s L5 (new pattern), keep the single row but stage `AxDep_10_L5` (compile-only dep class) ahead of it in order.txt — do NOT hand-merge | 6 prose-header sorry-hits only per R3's report — Step-A entry, 0 real tokens expected |
| 41-P0 statement rung (R4, agent-08; reported GREEN day-1) | `pilots/41/P0.lean` (on main) | **AxPilot41_P0 Step-B(i) row on landing-report confirmation** — 1 public theorem, one print, near-zero cost; the file's own header bills it "statement/faithfulness rung … NOT a proof artifact" (candidate-unfired at `f5cfe5e`) — R4's GREEN firing report supersedes that status line and governs the class. NEVER carries a headline | if R4's report classes it probe-convention despite the theorem, record the ruling + cite the run log instead (either branch is one line of evidence) |
| 41 core S–M (R4, agent-08) — **CORE GREEN LANDED run 9 (folded R1 unit 6, 2026-11-19; the §2a pre-stage spec EXECUTED)** | `pilots/41/Core.lean` on-disk `733b4a2d93a84689` = run-9 FIRED `921bc43cbd06d252` + elaboration-inert FIRED header block (P0-record/A2 precedent) | **AxPilot41_Core ACTIVE in make_axcheck — ONE [WARM] Step-B row** (4 refutation decides + 26 corrected theorems together, the 78 one-row precedent; Mathlib-ONLY import, P0 surface carried verbatim in-file → NO AxDep_41_P0 dep stage, pre-stage question resolved NO). **NO GIT_BYTES override — inert-delta class** (HEAD = fired bytes + comment-only header; both shas of record in the row + Core-record.md). Census 31 decls ALL public (0 privates → the Step-B(i) appended tail IS full coverage; AxFC custody optional-confirm). FOUR theorems at zero axioms (deciders, ⊆ class) | Verdict: **GREEN-triad — 4 REFUTED-AS-UNIVERSAL (decide-certified, kernel: P1, P2, MainIdentity-as-Para, N′) + 26 CORRECTED-PROVED** (30 top-level theorems; `core-run9.log`, 53 s). Budget disclosure: 9 runs, runs 5–8 = universe-churn class (one theorem's auto-bound `Type*`; math certified from run 4), ≈9×60 s warm, 2cpu/4GB HELD. **(H) TRANCHES 1+2 COMPLETE (R1 unit-13 fold, batches D+P): H1 `283503ada8f5571e` (455 LoC, 22 decls — transports + the TRACIALITY OBSTRUCTION: `sigmaQ_asym_witness` [propext] + `tracial_realizability_refuted` [propext, Quot.sound] — trace dictionaries IMPOSSIBLE, the dictionary must be non-tracial) + H2 on-disk `3bc8170121492d18` = fired `95343839` + comment-only (373 LoC, 18 decls; `h2-run11`, 11 runs, 0/0) — certificates `sigmaOrth`+`sigmaExpand_basis` [propext]×2 + `sigmaExpand` + `rank_obstruction_nogo` triad; the complete Walsh→expansion→no-go obstruction kernel-proved. TRANCHE-3 RULING: BANK-AS-NEGATIVE — the (H) program = the SECOND DISCOVERY (negative-kind, quota-free); the 3-strand hypothesis CLOSED FALSE (dictionary needs ≥ 4 strands, TL₄; n≥4 deferred seed). TARGETS rows land with the close sweep** |
| **Liu-B_new** statement-port (R7, agent-10) | `pilots/liu-bnew/P0.lean` | **probe-class — NEVER a Step-B stage** (the §7a zzv2-P0 ruling class); donor = Liu-1 sibling (AGENTS.md: statement-level citation only, DO-NOT-CONSUME as build dep) — any donor hygiene evidence rides the probe run log, not a TARGETS row. Re-check the class at landing against the file's own header + census (ff-ez2-P1 lesson: labels drift; if actual proof content lands later it gets its own row then) | expected 0 tokens (Step-A entry only) |
| 74-P2 (R3, agent-07) — **G2 GREEN LANDED run 11 (folded R1 unit 7, 2026-11-19; the §2b stub EXECUTED)** | `pilots/74/P2.lean` `49b808f33ba897cc`, 1,063 LoC, 37 decls (9 pub + 28 priv) | **AxPilot74_P2 ACTIVE in make_axcheck** ([WARM] Mathlib-only, no ordering constraint) **+ AxFC full-coverage custody class per the pre-stage** (the AxFC_74_P1 pattern — 28 privates direct-printed at sweep). Sweep guard: main bytes == 49b808f33ba897cc | **GREEN-triad — P2-a `mgfBound_var_sharp` (Var ≤ 2σ² window-free, 4.5× over P1) + P2-b `t1c_sharp` (exact 1024·e·θ·B)**; **G3 statement-probe PASS row** (famN + 3 Prop defs, elaboration-only); **P2-c chartered-unexecuted, ≤5 INTACT — NO live row until its GREEN**. Budget disclosure: 11 vs chartered ≤5 (run-6 process-error OWNED — P1 run-6 precedent class; runs 7–10 mechanical residue, classes named in-log; zero math defects). **Route-1.5 finding: elementary squaring caps at 1/2 — the sharp constant needed the monotone-derivative route** (route 1's deriv blocked on-pin). Must-cites + wording guard BINDING (R9 pre-gate `round6-74p2-pregate.md`): on-pin SubGaussian.lean EXISTS (grep-miss) + MGFAnalytic.lean:279; never "corpus has no SubGaussian". Novelty: P2-a formal-new-as-stated / mathematically-folklore; P2-c tightness set NEW-statement. **P2-c FINAL PARK (R1 unit-13 fold, batch-O; supersedes unit-12's parked state): guard → `531a9eb70f9871ba` (1,489 LoC) — elaboration-COMPLETE, 0 sorry, 19 runs; rc=1 = the audit-tail namespace placement ALONE; charter item 2 CLOSED (two-fire + audit-pending = CLOSE-CHECKLIST ITEM 13: the audit-tail move + 1 audit fire at wave-close, R3 on the close signal); verdict class HONEST-PARTIAL until that audit fire** (t4_not_littleO CLOSED = the tightness set 3-of-4: floor-achieved + not-littleO + the θ₀-membership statement; famN_inClass's 2-line residue, both fixes stated in `p2c-run17.log`'s header; the ADJUDICATED BkClass-nonneg definition of record; FINDING #5 = BkClass degeneracy + adjudicated correction, FINDING #6 = explicit θ₀ = 1/(1024·e) — dossier-74 amendment drafted for H) |
| 75-N2 P2 resume (R6, agent-06) — **P2-a CLOSED GREEN run 26, FOLDED 2026-11-19 (R1 unit 4)** | `pilots/75/N2-P1.lean` @ `ff8b99e` `ce6719c8af450eaa` (820 LoC, 27 decls = 14 pub + 13 priv) | **GIT_BYTES_OVERRIDES — MOVED 2026-11-19 to the RUN-26 VERIFIED STATE** (rev `ff8b99e`, sha-guard `ce6719c8af450eaa`; the iter-4-close run-19 pin `3ad896b`/`ca1089e2a0c122c4` is SUPERSEDED — dated note in `make_axcheck.py`; mechanism verified: staging test stages ff8b99e bytes + 14-public extraction). **RULE (amended this fold):** the override TRACKS the last verified committed bytes, moving forward at each verified landing (never to an unverified HEAD); it DROPS at sweep time iff the then-HEAD bytes ARE the last run's verified bytes (active-pilot protection — P3 work in flight may touch N2-P1 again). Step-B: AxPilot75_N2P1 stages the run-26 bytes; AxFC custody direct-prints the 13 privates; sibling-import growth (P2-b/P3 wiring) extends EXTRA_REWRITES + order.txt, never hand-merge | **run 26**: P2-a `windowFinite_LFunction` (`N2-P1.lean:738`) PROVED-UNCONDITIONAL, **15/15 file decls triad, 0 sorry, 0 sorryAx** (`logs/n2-p1-run26.log`, wall 68 s, OVER=0; loop r20→r26 = 10→8→3→4*→11*→1→0, `*` = failed-have unmaskings; zero math defects, argument unchanged since run 22). Post-erratum N2-P0 `1cf5cbe217c68564` remains the standing dep (§10.33 argument) |
| 75-N2 **P3** (R6) — **FIRED: 3-theorem GREEN state (folded R1 unit 9; H batches 9+B)** | `pilots/75/N2-P3.lean` `f9bd28c5f8f7c3d2` (242 LoC, 3 public decls; grew from the banked P3-a state `fda6652636cddd8f`) | **P3-a `windowFinite_family` banked (n2-p3-run{1,2}) + P3-b `abFacQ_of_factorization` (AbFacQOfFactorization discharged) + P3-c `analyticOrderAt_lFunction_ne_top` (the engine's hntopψ slot) — b/c BOTH GREEN FIRST SHOT (`logs/n2-p3-run3.log`, all triad)**. **Chain wiring for its TARGETS row at P3-complete: `import N2P0` + `import N2P1` (hyphenless) → stage-scoped EXTRA_REWRITES to AxPilot75_N2P0/AxPilot75_N2P1 (the N2P1 row stages the override-pinned run-26 bytes) + order.txt Pa→N2P0→N2P1→P3** — the composed `zetaL_rat_two_thirds_landed` (P3's headline) has NOT landed yet; row enters at its GREEN | classifier: 0 real tokens (ENTRY 9); Step-B row deferred to P3-complete per the skeleton rule |
| 77 completion / T2 tainted-decl fix — **BOTH GREEN LANDED (R7 iter-5 follow-up; folded by R1 unit 5, 2026-11-19 — the GREEN-completions condition MET, rows ACTIVE in make_axcheck)** | `pilots/77/T1.lean` `70d7e9f75e705303` (840 LoC, 52 decls = 12+40 priv) + `pilots/77/T2.lean` `e70baf22d9ae220e` (281 LoC, 12 decls = 8+4) | **T1 = DONOR-PIN class** (AxPilot77_T1: `TauCeti.*` imports resolve only in the 77 runner's tauceti pin @ `d92acc5c` / its manifest mathlib `1b1ccf4b` — the zeta23E own-lineage pattern; plain-batch FAIL BY DESIGN per the M4b precedent — **verdict of record = `logs/t1t2-run11.log`**, or a sweep-time re-fire in that runner). **T2 = [WARM] plain row** (AxPilot77_T2; Mathlib-only, fires in any plain batch). Sweep-time guard both: main bytes == the GREEN shas (route to R7 otherwise). AxFC custody at sweep: T1 52-decl + T2 12-decl full coverage (privates direct-printed) | **T1 run 11: 8/8 top-level theorems triad incl. `map_iso_occupationElem` FIRST-CLEAN; burn-down 31→7→0. T2 run 12: 8/8 incl. the FORMERLY-TAINTED `isDegreeBlock_iff_sum_blockProj` = the whole-tree 385/386 residual DISCHARGED** — iter-4 close basis superseded by a 386/386-equivalent state (close-block pointer SPLICE:71 / RESEARCH.md:209 / STATUS:830). **Runner filter fix = the SECOND instance of the 43d55bb blind-spot class** (`: error(` forms; run_pilot.py @ `1434e832e889a1cb`, cross-ref make_axcheck's close-residue widened counters + FINAL-SWEEP-PLAN-ITER4 §7d). T2's [Fintype κ] statement-strengthening finding rides the row note (statement was ill-typed without the binder — only the iff gains it) |
| AL M0→M2 (R8, agent-05) — **M2 CLOSED GREEN (R1 unit-14 fold, batch-Q — the row-convention table, superseding the unit-13 narrative draft; r3-tables §11); guard `61af175aae141aa9`** (1,606 LoC, 89 decls = 86+3) | `pilots/al3d/A2.lean` guard `61af175aae141aa9` @ batch-Q | **GUARD DISCIPLINE RECORDED: AxPilotAL3D_A2's sweep guard MOVES to the last-verified committed bytes at each landing** (M0 b84270b6 → 7db88f34 @ batch-7 [M1] → **`9706196c5f5ff593` @ batch-B — M2-a CLOSED 4/4**, unit-9 fold: `colEquivVar_restr_apply` + `powerset_eq_biUnion_projFib` + `projFib_pairwise_disjoint` + `sum_projFib_extendId` all triad; **M2-b honest-partial**: 2 sorryAx-parked-at-last-fire decls `regReindexEquiv_compl_iff`+`colEquivVar_swap`, fixes-on-disk-unfired, disk sorry-free — D7 vocabulary, no live claim until the M2-b fire. **M2 CLOSED (unit-13): `regReindexEquiv_compl_iff` + `colEquivVar_swap` + the M2-c keystone `hamiltonianVar_eq_submatrix` ALL triad — the M0→M2 ladder kernel-verified end-to-end, BOTH P2-d parked targets PROVED; the bisect answer = the suppressed-error-in-fused-iff mechanism (standing lesson; the widened `: error(` filter class alone does not catch it — `alp2-m2c-run{7,8,9}`).** M3 (P2-e assembly) follows. Prior guard-line history: M1 CLOSED GREEN 4 runs, `alp2-m1-run4-completion.log`, workhorse `colEquivVar_restr` final assembly triad, run-13's 85-line regression identity held, growth 10 M0 + 4 M1 lines all triad — completion-grant class). NO git-bytes override (guard = row-comment sha discipline; A2's verified surface moves by committed landings). **M2-a state: 2/4 GREEN structural halves** (`powerset_eq_biUnion_projFib` + `sum_projFib_extendId` triad @ `alp2-m2-run2-fixround1.log`) **+ 2 fixes-on-disk UNFIRED** (`colEquivVar_restr_apply` + `projFib_pairwise_disjoint` — pre-written one-liners APPLIED, no fire since m2-run2 which fired the pre-fix sorryAx bytes; the N2-P2 paused class) — **honest-partial per D7: no live claim for the 2 until their GREEN fire; the A2 sweep stage's verdict is honest-partial until then** (disk sorry-free, 0 classifier tokens) | the `dependsOnNoncomputable` substrate rule + AxDep P0/A1 chain unchanged; M2-b (swap proper) + M3 (P2-e assembly) follow per the precharter ladder |
| η-port ladder (R5, agent-04) — **RUNG 1 GREEN EXIT (folded R1 unit 11, H batch-H)**; η-pin-probe stays probe-convention (Step-A only, never a Step-B stage) | `pilots/zzv2-lam/eta-r1.lean` `5b04304a53a5b849` (217 LoC, 7 decls = 6+1) + the rung files as they land (eta-r2.lean held fold-once) | **eta-r1 = PROOF artifact on the DONOR TREE ([LAYERS] class — the zzv2-P1/p1-run3 precedent: verdict of record = the on-pin run log `eta-r1-run3.log` (strict-OK 6/6 triad, sha-guarded; the GATED-RED 5/6 → 6/6 transition across runs 1–3); NOT a plain TARGETS stage.** Rung rows land per GREEN exit (this slot updates each rung); R2 GATED-RED with confirmation parked (`36c593f7`) — row at its GREEN. The λ=1/2 regression discipline DELIVERED at rung 1 | billing: technical record, DECISION-2 Option A; port ledger 6 of 6–10; the OVER-cpu investigation was R5's (delivered at the probe) |
| round-6 novelty batteries (R9, agent-09) | md/probe artifacts as they land | Step-A scope for any new .lean; rows only for proof-class landings per lane reports | — |

**On-landing duties (unchanged):** add the row to `make_axcheck.py` TARGETS
(Iteration-5 append-only block AFTER the frozen C2 + Iteration-4 blocks — those are
frozen history, audit `r3-verification-integrity.md` §7); classify probe-vs-proof
from the file's own header + census + lane report; Step-A entry appended to
`logs/stepA-incremental-iter5.log`; sha256-at-sweep in every stage header; order.txt
keeps chains ahead of consumers automatically.

## 1 Baseline sorry-token certificate — iter-5 re-baseline at the OPENING COMMIT

Baseline = the iter-4 sweep-time certificate **52 exact** (43 C2 carry-forward +
3 `al3d/P0` :106/:144/:149 + 3 `lp/P0` :44/:55/:97 + 2 ProbeG9 :51/:67 + 1 ProbeG10
:96; `logs/stepA-incremental-iter4.log` sweep-time entry) **re-run on the
post-opening tree**; new Iteration-5 files append their entries to
`feasibility/probe/logs/stepA-incremental-iter5.log` (R1 opens it at the opening
commit): M-arc.lean (R3 reports 6 prose-header hits only — expect 0 REAL-TOKEN),
eta-pin-probe.lean (probe-convention), liu-bnew/P0.lean (expected 0), 41/Core.lean
(when R4 reports), N2-P1 run-24 bytes (when R6 reports). Any REAL-TOKEN outside the
declared entries = VIOLATION-UNEXPLAINED → STOP, route the file verbatim to its
owning lane before Step B. Classifier = the §G1/C2 §2 script verbatim (docstring
interiors are prose; PROSE regex; comment prefixes) — never retyped.

## 2 Step B — two-part (defaults as inherited; donor classes below)

(i) TARGETS batch `run_axcheck.sh` (warm app crossmath-probe, doz CLI default,
order.txt-governed). (ii) full-coverage custody stages for every Iteration-5
proof-class artifact (`axb_close_iter4.py` batch class; re-run-only-if-sha-differs
for already-discharged iter-4 stages — their citations stand while bytes hold).
Substrate classes: [WARM] plain pin; [LAYERS]-donor-tree zzv2-class stages on the
built ZetaZerosV2 tree (`run_m4b_donor_axcheck.sh` recipe — the η-pin P0/P2 chain if
it ever graduates to proof-class); [D-PIN] zeta23e donor-pin rows cite the donor-pin
log; Liu-1 = statement-level citation only (never a build dep). Donor hygiene gate:
on-pin `#print axioms` is proof; comparator configs and READMEs are claims.

## 3 Step C — VERIFICATION-LEDGER §11 (per-pilot rows; extractor-generated counts only)

`| pilot | final files | LoC/thms (extractor, sha-dated) | axcheck verdict (log cite; coverage split) | sorry tokens | sign-off |`; sign-off OK iff Step A 0 unexplained ∧ Step B OK ∧ logs persisted full-length with provenance headers + sha256. The pilot-tree LoC total re-measures (55,305 at iter-4 close).

## 4 Step D — compliance sign-off (append once A–C clean; §4 text verbatim per FINAL-SWEEP-PLAN-ITER4 §4 with the iter-5 enumerated token list)

If Steps A–C surface anything, stop and route to the lane instead of signing.

## 5 Close gates — the Iteration-4 close-act gates family (G1–G8) re-runs at iter-5 close per the then-current gates file; results table committed with the close block.

## 6 Execution trigger

Orchestrator signal "Iteration-5 pilot lanes final". Then Step A locally (seconds) →
Step B one warm Modal batch (+ donor-tree/heavy classes in their batches) → Steps
C–D ledger + sign-off → close gates. Blockers route to lanes; §1 re-baselines if
pending files landed with tokens.

— lane R1, 2026-11-19, worktree agent-02 (pre-K prep; supersedes nothing;
FINAL-SWEEP-PLAN-ITER4.md stands as the executed predecessor).

### 2a — 41-CORE PRE-STAGE (event-prep drafts, lane R1 2026-11-19; DRAFT ONLY until R4's
core-1 formal report — names/counts below are the expected shapes, the report governs;
R4's files untouched by this lane)

**Landing shape expected (per the re-task + dossier):** Core.lean carries
(a) **decide-certified REFUTATIONS** of the P0-elaborated universal forms ((M)/(N)
as-universals — `decide` over the finite quadruple space, the dossier's §-222
"finite check settles it either way" route; kernel `Decidable.decide`, NEVER
`native_decide`), and (b) **CORRECTED theorems PROVED** — the amended
stratum/generator forms, expected names `GqGen`, `MainIdentityCor`,
`MainIdentityStratum`, `qRigid` (report governs). This is the **78 precedent shape**
(`AxPilot78_P0`: refutation theorems as FIRST-CLASS PROVED-UNCONDITIONAL decls,
triad-clean, NEGATIVE-kind discovery billing — §10.13; the AxPilot78_P0 TARGETS row +
AxFC_78_P0 custody class).

**TARGETS spec — ONE Step-B row, `AxPilot41_Core`:**
- `("AxPilot41_Core", PILOTS / "41/Core.lean")` in the Iteration-5 append-only block;
  row comment carries: landing report cite, sha256(16), census split
  (r refutation + c corrected + privates), the 78-precedent class note, and the
  `import Mathlib`-only check (Core is self-contained on the pin; P0's statements
  restated in-file or imported via the sibling-rewrite only if Core does `import P0` —
  if so, stage-scoped EXTRA_REWRITES routes it to a compile-only AxDep_41_P0 dep stage,
  the AL3D-P0 pattern; order.txt places the dep ahead).
- Verdict criterion unchanged (`OK; axiom-lines=N, sorryAx-lines=0`, records ⊆ triad).
  Note: decide-heavy proofs legitimately print `does not depend on any axioms` for the
  finite deciders (kernel terms) — the no-axioms record class is ⊆ triad and expected;
  wrapped-record joining already handles both forms.
- **Sorry-token class: ZERO by construction — stated per the re-task.** A `decide`
  line is a kernel-evaluated term (`Decidable.decide`), not a proof-device stub: no
  `sorry` can appear in a decide-certified refutation that elaborates rc=0 (a sorry
  would surface as a sorry-warning + sorryAx record and FAIL the sorry-strict
  verdict). The `native_decide` ban is enforced independently by
  `axcheck_iter4.py gate` (forbidden-token class) — the refutations are
  KERNEL-CERTIFIED by construction, per the AGENTS.md standard of proof. Step-A entry
  still lands (expect 0 real tokens; any hit = VIOLATION-UNEXPLAINED).
- **Full-coverage custody:** census at landing decides — if Core has privates/lemmas
  (expected: finite-check bookkeeping lemmas), the AxFC_41_Core custody stage runs in
  the next custody batch (`axb_close_iter4.py` class; 78's 3+23 split is the
  worked example). The refutation deciders and the four corrected theorems ALL get
  direct prints in the appended tail (they are top-level decls).

**GIT_BYTES answer (confirming the re-task's expectation): NO override for Core.lean.**
`GIT_BYTES_OVERRIDES` exists ONLY where HEAD bytes ≠ verified bytes-of-record (the
N2-P1 paused-P2 case: HEAD carried unfired fixes). Core.lean is a FRESH file whose
landing commit IS its verified state (R4's GREEN run fires on the committed bytes —
the 41-P0 run-table pattern: bytes-sha in the run table = the committed sha). Guard
class = sha-at-sweep stamp in the stage header only. If (unexpected) R4 reports a
post-landing edit that unfires the bytes, THEN an override enters with the report's
rev+sha — flagged as the exception, not the rule.

**P0 supersession note — drafted wording (§11.1's 41-P0 row addendum; the P0 verdict
STANDS, the statements' status moves):**

> **Core addendum (post-core-1):** P0's verdict of record is UNCHANGED — it is an
> elaboration verdict about statability/type-correctness on the pin and never
> certified truth or provability (the standing convention: "statement elaboration
> never certified provability — the pre-amendment elaboration ledger stands as
> history", the N2-P0 erratum wording, §10.29-adjacent). What moved is the
> STATEMENTS' status: the universal forms P0 elaborated are now REFUTED-AS-UNIVERSAL
> by Core's decide-certified theorems (kernel), and the corrected forms
> (`GqGen`/`MainIdentityCor`/`MainIdentityStratum`/`qRigid`, report-governed names)
> are the carriers going forward. Nothing in P0 is retracted; P0's `(M)/(N)/(H)`
> hypothesis labels read, post-core, as "(M)-as-universal: refuted; corrected (M):
> see Core" pointers. P0's Step-B treatment (statement rung, never a headline) is
> unaffected.

**§11 verdict vocabulary for the row (the "N refuted + M corrected" cell format):**

> GREEN-triad — **r REFUTED-AS-UNIVERSAL (decide-certified, kernel `Decidable.decide`,
> 0 sorryAx) + c CORRECTED-PROVED** (`<names>`), records ⊆ [propext,
> Classical.choice, Quot.sound] (deciders may print no-axioms — ⊆ class); billing per
> the 78 precedent: refutation theorems are first-class PROVED-UNCONDITIONAL decls
> (NEGATIVE-kind discovery surface if the dossier so rules — A9's roll-up owns the
> PROVED-* vocabulary, §11 stays in the GREEN-triad/honest-partial/NOT-GREEN-honest
> pilot vocabulary per the D7 RULING).

### 2b — same-hour-fold row stubs (DRAFT; report-governed placeholders)

- **N2 run-26 (R6) — EXECUTED 2026-11-19 (R1 unit 4), GREEN branch live:** §11.2
  carries the live row; the §0 N2 slot + GIT_BYTES_OVERRIDES moved to the run-26
  state (`ff8b99e`/`ce6719c8af450eaa`, dated supersession note in make_axcheck.py);
  the honest-stop branch is VACATED (P2-a CLOSED). Future N2 folds (P2-b, P3 fire)
  reuse this stub's chain-wiring notes.
- **AL-M1 (R8's ladder — DISTINCT from 72-M1; the unit-3 correction note stands,
  both stubs separate):** the rebuild-precharter rung after M0 — **M1 = the L1
  restriction-compat workhorse via the congruence class** (`rebuild-precharter.md`
  §"M1 — L1 GREEN"; consumes M0's z-rank core: `colZRank_fibre` is M1's exact feed
  per the M0 record). Landing shape: `pilots/al3d/A2.lean` grows again (the M0
  pattern) or a new al3d file — either way sha-at-sweep governs; AxPilotAL3D_A2
  re-stages at the new bytes; AxDep chain P0/A1 applies unchanged; census at landing
  decides AxFC custody; verdict cell GREEN-triad / honest-partial per R8's report.
  Ladder context: M2 (swap + D4) and M3 (assembly + honest close) follow — stubs
  extend identically as those land.
- **74-P2 (R3):** §11 row stub — Step-B(i) row `AxPilot74_P2` + AxFC custody (the
  P1 class: publics + privates direct-printed); verdict cell GREEN-triad/honest-partial
  per report; billing: the two-atom hVarLB insufficiency FIND-#1 recycle (precharter
  `6216e2a`) — engineering or discovery per the charter ruling at landing.
- **72-M1 L3(b–d + interface) (R2) — WAVE-CLOSE FOLDED (R1 unit 10, H batch-G; **PRINT-LEVEL CORRECTION R1 unit 14, 2026-11-20** — see r3-tables §11's corrected L3 block): HONEST-PARTIAL-FINAL.** `P72M1T3.lean` v13 `dcda3133b1ffbd16` (1,048 LoC, 44 decls; 13 runs / 3 grants — the ≤2 FINAL-ROUND grant fired as runs 12–13). **CERTIFIED TRIAD at close (print-level, multiline-verified over ALL 16 l3bd logs): `toGrid_star_dotProduct_self` (L3b, since run 6) + `eig_toGrid` (run 5) + `edgeBoundary_le_boundaryCard` (run 9) with T2's `boundaryCard_le_edgeBoundary` — both directions; T1/T2/L3a regressions held throughout. The unit-10 list's `hasGlobalGap_of_fullSystemGap` (L3c) entry is RETRACTED (zero triad prints in any persisted run — the run-12 flip was narrative, not prints); `submatrix_mulVec_ec` is record-only (never print-audited — the §10.9 print-gap class). CONTAMINATED TAIL (as printed): `hasGlobalGap_of_fullSystemGap` / `isAdmissible_ΦL` / `hamiltonian_gridDom_eq` / `interface_areaLaw_uniformAreaLaw`. ZERO math defects; ZERO sorry tokens on disk (classifier 0 real).** **The T3 row's sweep GUARD = `aed631015beb38d6` (the v16 park, R1 unit-14 fold 2026-11-20, BYTE-CORRECTED — dcda3133 superseded): the records' run-14 isAdmissible/hamiltonian "flip" and run-12 L3c "flip" are BOTH contradicted by the logs (zero triad prints for either — tactic-level site-closures had been read as certifications); run 16 overall FAIL rc=1 errors=35, sorryAx = error-recovery (disk sorry-free stands); 16 runs / four grant rounds / zero math defects; the stop-note §CHARTER-ITEM-3 3-item next-wave list UNDERSTATES the residue — isAdmissible/hamiltonian/hasGlobalGap need re-derivation (R2 re-basis owed); no further grants this wave. The sweep verdict class STAYS honest-partial until the next wave's GREEN** — the §FINAL-ROUND next-wave charter pointer (`logs/l3bd-stop-note.md`, re-basis pending). At that GREEN: re-stage + custody re-run, verdict flips GREEN-triad.
