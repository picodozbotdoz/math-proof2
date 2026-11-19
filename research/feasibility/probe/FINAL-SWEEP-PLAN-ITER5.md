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
| 41 core S–M (R4, agent-08; in flight) | `pilots/41/Core.lean` (name per R4's landing) | **AxPilot41_Core row on landing** (proof-class expected; full-coverage AxFC custody if privates/lemmas present — census at landing decides) | the (M)/(N) targets and (H) binders in P0 discharge here |
| **Liu-B_new** statement-port (R7, agent-10) | `pilots/liu-bnew/P0.lean` | **probe-class — NEVER a Step-B stage** (the §7a zzv2-P0 ruling class); donor = Liu-1 sibling (AGENTS.md: statement-level citation only, DO-NOT-CONSUME as build dep) — any donor hygiene evidence rides the probe run log, not a TARGETS row. Re-check the class at landing against the file's own header + census (ff-ez2-P1 lesson: labels drift; if actual proof content lands later it gets its own row then) | expected 0 tokens (Step-A entry only) |
| 74-P2 (R3, agent-07; precharter `6216e2a` — two-atom hVarLB insufficiency, FIND-#1 family recycled) | `pilots/74/P2.lean` on landing | **Step-B(i) row AxPilot74_P2 + AxFC full-coverage custody stage** (the AxFC_74_P1 class at iter-4 close: 7 publics + 24 privates direct-printed) | Mathlib-only expected; no ordering constraint |
| 75-N2 P2 resume (R6, agent-06) — **P2-a CLOSED GREEN run 26, FOLDED 2026-11-19 (R1 unit 4)** | `pilots/75/N2-P1.lean` @ `ff8b99e` `ce6719c8af450eaa` (820 LoC, 27 decls = 14 pub + 13 priv) | **GIT_BYTES_OVERRIDES — MOVED 2026-11-19 to the RUN-26 VERIFIED STATE** (rev `ff8b99e`, sha-guard `ce6719c8af450eaa`; the iter-4-close run-19 pin `3ad896b`/`ca1089e2a0c122c4` is SUPERSEDED — dated note in `make_axcheck.py`; mechanism verified: staging test stages ff8b99e bytes + 14-public extraction). **RULE (amended this fold):** the override TRACKS the last verified committed bytes, moving forward at each verified landing (never to an unverified HEAD); it DROPS at sweep time iff the then-HEAD bytes ARE the last run's verified bytes (active-pilot protection — P3 work in flight may touch N2-P1 again). Step-B: AxPilot75_N2P1 stages the run-26 bytes; AxFC custody direct-prints the 13 privates; sibling-import growth (P2-b/P3 wiring) extends EXTRA_REWRITES + order.txt, never hand-merge | **run 26**: P2-a `windowFinite_LFunction` (`N2-P1.lean:738`) PROVED-UNCONDITIONAL, **15/15 file decls triad, 0 sorry, 0 sorryAx** (`logs/n2-p1-run26.log`, wall 68 s, OVER=0; loop r20→r26 = 10→8→3→4*→11*→1→0, `*` = failed-have unmaskings; zero math defects, argument unchanged since run 22). Post-erratum N2-P0 `1cf5cbe217c68564` remains the standing dep (§10.33 argument) |
| 75-N2 **P3 skeleton** (R6, staged same unit, `ff8b99e`) | `pilots/75/N2-P3.lean` `5d2b7dd7e72497cc`, 207 LoC, 1 public decl (`CrossMath.Pilot75N2.windowFinite_family` :105) | **statements-only SKELETON — NEVER-RUN staging class: NO Step-B row until fired-and-GREEN** (the 41-P0 candidate-unfired class); Step-A entry landed (classifier 52-exact re-confirmed post-`ff8b99e` over 111 files); on a GREEN P3 fire, the row + chain wiring (imports Pa/N2P0/N2P1 → AxDep stages + stage-scoped rewrites) enter at that fold | charter: final-grant ruling 2026-11-19 (P2-a CLOSED authorizing the skeleton); the V2 ζ-column discharge + composed `zetaL_rat_two_thirds_landed` |
| 77 completion / T2 tainted-decl fix — **BOTH GREEN LANDED (R7 iter-5 follow-up; folded by R1 unit 5, 2026-11-19 — the GREEN-completions condition MET, rows ACTIVE in make_axcheck)** | `pilots/77/T1.lean` `70d7e9f75e705303` (840 LoC, 52 decls = 12+40 priv) + `pilots/77/T2.lean` `e70baf22d9ae220e` (281 LoC, 12 decls = 8+4) | **T1 = DONOR-PIN class** (AxPilot77_T1: `TauCeti.*` imports resolve only in the 77 runner's tauceti pin @ `d92acc5c` / its manifest mathlib `1b1ccf4b` — the zeta23E own-lineage pattern; plain-batch FAIL BY DESIGN per the M4b precedent — **verdict of record = `logs/t1t2-run11.log`**, or a sweep-time re-fire in that runner). **T2 = [WARM] plain row** (AxPilot77_T2; Mathlib-only, fires in any plain batch). Sweep-time guard both: main bytes == the GREEN shas (route to R7 otherwise). AxFC custody at sweep: T1 52-decl + T2 12-decl full coverage (privates direct-printed) | **T1 run 11: 8/8 top-level theorems triad incl. `map_iso_occupationElem` FIRST-CLEAN; burn-down 31→7→0. T2 run 12: 8/8 incl. the FORMERLY-TAINTED `isDegreeBlock_iff_sum_blockProj` = the whole-tree 385/386 residual DISCHARGED** — iter-4 close basis superseded by a 386/386-equivalent state (close-block pointer SPLICE:71 / RESEARCH.md:209 / STATUS:830). **Runner filter fix = the SECOND instance of the 43d55bb blind-spot class** (`: error(` forms; run_pilot.py @ `1434e832e889a1cb`, cross-ref make_axcheck's close-residue widened counters + FINAL-SWEEP-PLAN-ITER4 §7d). T2's [Fintype κ] statement-strengthening finding rides the row note (statement was ill-typed without the binder — only the iff gains it) |
| AL M0-rebuild (R8, agent-05) | `pilots/al3d/` M0 file per landing | row on landing (proof-class expected; AxDep chain if it imports P0/A1 — the close-resume order.txt machinery handles it); the `dependsOnNoncomputable` substrate rule (h-wave4-log standing note: `Polynomial ℤ`/monoid-algebra defs get `noncomputable` UP-FRONT) applies to any new al3d data-level defs | A2.lean's iter-5 re-charter (find-#5 z-rank rebuild) rides separately — when it lands, AxPilotAL3D_A2 re-stages at the new bytes (sha-at-sweep governs) |
| η-pin-probe (R5, agent-04; run 2 + OVER-cpu investigation owed) | `pilots/zzv2-lam/eta-pin-probe.lean` (on main) | **probe-convention — Step-A scope ONLY, never a Step-B stage** (pre-ruled by the re-task; the file is a probe by name and billing) | entry in stepA-incremental-iter5.log; the OVER-cpu telemetry investigation is R5's, not the sweep's |
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
- **72-M1 L3(b–d + interface) (R2):** §11 row stub — `P72M1T3.lean` GROWS (L3a sha
  `fe57d30b…` = the standing citation; sha-at-sweep governs on growth): Step-B(i)
  re-stage + custody re-run where the sha moved; the interface theorem
  (`interface_areaLaw_uniformAreaLaw`) is the row's headline decl; verdict cell
  GREEN-triad/honest-partial per report. *(Prep note: the re-task's "M1" token is
  read as 72-M1's T3-file growth; if a different M1 was meant, the stub re-titles
  without structural change — correction note then, not silent.)*
