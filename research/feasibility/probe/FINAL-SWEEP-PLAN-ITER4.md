# FINAL-SWEEP-PLAN-ITER4 — Iteration-4 mechanical close-out (PREP ONLY — execute on the orchestrator's final signal)

Lane R4 (skeleton), 2026-11-16. Third in the lineage: main-run
`FINAL-SWEEP-PLAN.md` (R9) → `FINAL-SWEEP-PLAN-C2.md` (A1; EXECUTED, CLOSED) → this.
Read both first — same two-step discipline, same OK/FAIL routing. **Do not execute
before the orchestrator signals that the Iteration-4 pilot lanes have reported final.**
Run from repo root `/home/doz/zcode-workdir/cross-math-fronttier`; budget ~10–20 min
(one warm Modal batch + local sweeps; [LAYERS]/[HEAVY-IMPORT] stages cost extra — see §0).

**Differences vs the C2 plan, all defaults now (not options):** the R3 verification
upgrades (`qa/iter4-review/r3-verification-integrity.md` §4–§5) are BAKED IN —
full-coverage private+lemma-aware axcheck for donor-swap pilots, widened error/sorry
counters, wrapped-line joining, no middle-excerpting, sha256-at-sweep — and the R4
close-protocol rules (`qa/iter4-review/r4-process-completeness.md` §6) govern the
close gates (§5). Worked example for the gates:
`qa/closeout-gate-run-C2-reconstructed.md`.

## 0 Scope — Iteration-4 TARGETS (seeded 2026-11-16 from R5's specs; rows FINALIZE as pilots land)

Seed = R5's chartered/carry slots (`qa/iter4-review/r5-iteration4-backlog.md` §2 queue,
§5 lane table). Stage rows appear in `make_axcheck.py` TARGETS on landing (Iteration-4
block); statuses update per lane formal reports. Probe-convention files are Step-A-only
and NEVER Step-B stages (C2 precedent: 71/P0, 73/P0).

| slot (R5 rank) | expected final file(s) | status at seed (2026-11-16) | sweep class / notes |
|---|---|---|---|
| LP layer + 02-core consumer (rank 1; lane L1) | `pilots/lp/*`: P0 probe, `L1.lean` (layer: `lp_weak_duality` kernel-clean), P2 consumer | no dir yet | [WARM]; **add the `L1→AxL1` sibling-import case to make_axcheck at TARGETS time** (lp-layer-prework §4 note); LP-P0 = probe-convention class — classify per lane report |
| 75 P-b completion (rank 2; lane L4) | `pilots/75/Pb.lean` (+ shared-ℚ staging (d1)+(d2) file; N2 target `zetaL_two_thirds_landed_ℚ` = rank 10) | design on file (`Pb-design.md`); Pa.lean already C2-swept | [WARM]; Pa rides along as drift-check (C2 §0a precedent); P-b E1–E6 per design §1 |
| AL-3D B.2 staged (rank 3; lane L2) | `pilots/al3d/*`: AL-P0 statement layer (`Statements3D.lean` cluster, 32 defs + 3 new: `IsColumnClosed3D`/`SlabAreaLawColumnCuts3D`/`PlanarAreaLawVar`), P1/P2 rungs | no dir yet | [HEAVY-IMPORT]; statement-layer value only — never a headline (R5 §3a); B-rung label "B.2-staged" on every artifact |
| ZZV2 λ-family route (a) (rank 4; lane L3) | `pilots/zzv2-lam/*`: P0 probe (V2 tree), P1 λ-abstract statement layer, P2 glue (IF P0(b) favorable) | no dir yet | [LAYERS] — M4b2 recipe; P0/P2 stages run **on the built ZetaZerosV2 donor tree** (donor-tree pattern, C2 §0a AxPilot42_M4b precedent, `run_m4b_donor_axcheck.sh` recipe); stop-and-report if P0(b) unfavorable |
| 72-M1 L3 + interface (rank 5; lane L5) | `pilots/72-M1/P72M1T3.lean` (L3a–L3d + `interface_areaLaw_uniformAreaLaw`); stage `AxPilot72_M1_T3` | T1/T2 frozen GREEN; L3-spec on file | [WARM]; Tier-C only (Tier-B stays G5a-gated); full axcheck incl. the new stage; T1/T2 drift-check |
| 73-Q4 `hRat` discharge (rank 6; lane L8) | `pilots/73/*` Q4 file (gated on A2's owed recommendation) | gated — decision first | [WARM]; Rosen ch.-number spot-check due AT Q4 (SCAN §1c); if gated shut, declared-drop (no stage) |
| 22-T2a binder task (rank 9 pair; lane L8 drain-filler) | `pilots/22/*` addition (upstream StrongPNT statement binder) | no file yet | [WARM]; S-effort; FF-EZ4 probe (the pair's other half) = probe-tier, classify per lane |
| hEχ donor-pin discharge (R5 §14 run 8 + §14.1; row added by R3 machinery-upkeep 2026-11-16 — runner staged, NOT in the seed table) | `pilots/zeta23e/*`: consumer files elaborated INSIDE the built zeta23 tree at the DONOR pin (v4.33.0-rc2 / mathlib `51e6992e`; 50-M2/g7 recipe, `run_zeta23e.py`; build target `Zeta23.ThmE.Final`) | runner only (`run_zeta23e.{py,sh}`, STAGED-NO-RUN) | **[LAYERS]-donor-pin** — the D-PIN class of `qa/iter4-review/r3-verification-tables.md` §2/§9: donor rows `PROVED-UNCONDITIONAL (donor)` + donor-pin print source; OUR consumers in that tree are D-PIN rows; on-pin consumers keep hEχ as a binder until this discharge. Donor hygiene gate = `Zeta23.ThmE.Final` chain prints ⊆ triad at the donor pin (transitive Theorem-E audit per R2 mini-spec) |
| — conditional rows, add on landing (charter-dependent) | 74 T1+T2+T4 pilot (rank 7, dir TBD) *(74-P0 statement rung LANDED GREEN 2026-11-17, §10.15 — probe-convention, no stage)*, 10 tranche D1–D4 (rank 8, `pilots/10/*`) *(D1 LANDED GREEN 2026-11-17, §10.17 — `L3.lean` 2,805 LoC, Part E C2-covered 6/6; `AxPilot10_L3` TARGETS append AT SWEEP per the spec §6 protocol — L3 grows with the D-tranches **[SUPERSEDED 2026-11-18, orchestrator ruling: single tranche-final anchor `AxPilot10_L5` (`pilots/10/L5.lean`) — L5 embeds L4/L3 verbatim, one row covers the tranche's final theorem state; L3/L4 remain §10 historical citations. Reconciliation §7d]*)*, 75 N2 (rank 10) *(N2-P0 statement rung LANDED GREEN, §10.12; [WARM]+Pa-rewrite branch)*, 11 M3 (rank 11, `pilots/11/*`) | not chartered at seed | statuses per orchestrator chartering; each lands with its own row + stage |

**On-landing duties (every row):** add the stage to `make_axcheck.py` TARGETS; classify
probe-vs-proof; Step-A token row appended to the incremental log (§1); sibling-import
rewrites generalized from the ALL-TARGETS dict (C2 fix, verified — no new per-pair
regexes). Upkeep notes (R3, 2026-11-16): (i) the lp prework's §4 warning about adding
`L1 → AxL1` "to the regex at `make_axcheck.py:78`" is STALE — the C2 close generalized
the rewrite to ALL TARGETS (`make_axcheck.py:95–106`), so appending the lp rows to
TARGETS covers it with no code change; the same rewrite is available for full-coverage
staging via `axcheck_iter4.py gen --rewrite L1=AxL1` (tested: RedTm2's
`import P11T3` → `import AxPilot11_P11T3`, ×1, rest verbatim). (ii) TARGETS additions
land as a clearly-marked Iteration-4 block AFTER the frozen C2 list — the C2-era rows
and generator logic are frozen history (audit `r3-verification-integrity.md` §7).

## 1 Baseline sorry-token certificate — carry-forward + delta accounting

Baseline at seed = the **C2 certificate frozen at close (43 tokens, 0 unexplained**:
9 main-run + 23 G-series + 4 `pilots/71/P0.lean` + 7 `pilots/73/P0.lean`, enumerated in
FINAL-SWEEP-PLAN-C2 §1). New Iteration-4 files append their tokens to the incremental
verdict log `feasibility/probe/logs/stepA-incremental-iter4.log` as they land; any file
landing WITH tokens re-baselines the certificate before Step B (orchestrator order, C2
precedent) — the sweep-time unknown count must be zero.

Classifier = the C2 script verbatim (docstring-interior lines are prose — ANY `/- … -/`
block; PROSE regex; comment prefixes): see FINAL-SWEEP-PLAN-C2 §2 for the exact
invocation. Additions for Iteration-4 scope: `pilots/{lp,al3d,zzv2-lam,74}/**` +
new files under `pilots/{10,11,22,73,75,72-M1}`. Any REAL-TOKEN outside the enumerated
baseline + lane-declared pending set = VIOLATION-UNEXPLAINED → route to the owning lane
verbatim before proceeding.

## 2 Step B — axcheck elaboration sweep (R3 upgrades are the DEFAULT configuration)

Run `research/feasibility/probe/run_axcheck.sh 2>&1 | tee /tmp/crossmath-axcheck-iter4.log`;
rescue with provenance header to each pilot's `logs/axcheck-final-iter4.log`. Per-file OK
criterion (unchanged): `OK; axiom-lines=N, sorryAx-lines=0`, every axiom line ⊆
`[propext, Classical.choice, Quot.sound]` (subset forms acceptable). `sorryAx-lines>0`
in a PROOF artifact ⇒ the pilot is not done despite its report — route to lane.
Donor-consumption audit (unchanged): donor statements enter as **binders, verbatim probe
copies, or built on-pin libraries only** (V2 = built; DZDF/Weil/Liu-1/PNT+ = statement
level; openai 7/8 = donor-pin per G7b precedent).

**Defaults baked in (R3 §4/§5 — deviations require an OVERRIDDEN note in the gate-run
record):**

1. **Full-coverage, private+lemma-aware axcheck for donor-swap pilots** (R3 F2) — the
   staged copy prints `private theorem` and `lemma` declarations too (`_private.…` name
   shapes allowed; the C2 make_axcheck/axcheck_full gap closed in the generator, not
   per-pilot). Recommended for every NEW Iteration-4 stage, mandatory where the pilot
   consumes donors (lp consumer? — LP consumes no donor but is new: use full coverage
   anyway; zzv2-lam P1/P2 and 22-T2a are the hard cases). Fewer printed lines than a
   lane's private-inclusive audit is a REGRESSION signal now, not a design note.
2. **Widened counters** (C2 debts b/c + R3 F3a): error counting matches `error(<code>)`
   forms (incl. `error(lean.unknownIdentifier)`), not just `…error:`; sorry-warnings on
   v4.36 carry BACKTICKS ("declaration uses `sorry`") — straight-quote greps undercount;
   the axcheck copy remains the sorry-detector of record. **Wrapped-line joining before
   classification**: continuation lines of a wrapped axiom list join their opener before
   any sorryAx/axiom-set decision (R3 F3a).
3. **No middle-excerpting** (R3 F3b/F1): sweep-of-record logs persist ALL
   "depends on axioms"-bearing lines at full length — the head-40/tail-12 "(…N more)"
   excerpt mode is forbidden for the close sweep. A log must contain the lines it
   tallies, or its header must say "tally-only, prints not persisted" AND name the
   covering artifact.
4. **sha256-at-sweep** (R3 §5 rule 5): every stage's log header carries the source
   file's sha256 (12-hex min) — sweep-time staging is the bytes of record; articles and
   ledger quote sweep-time counts, never run-log counts of earlier bytes.

Substrate classes (R5 §2): [WARM] stages on the plain mathlib pin; [LAYERS] zzv2-lam
stages on the built ZetaZerosV2 tree (donor-tree runner; AxPilot42_M4b pattern);
[HEAVY-IMPORT] al3d stages — size the Modal batch accordingly (2 CPU / 4 GB default;
LEAN_NUM_THREADS=2; overruns investigated, never auto-upgraded — AGENTS.md Modal rules).

## 3 Step C — VERIFICATION-LEDGER Iteration-4 section (per-pilot OK/FAIL sign-off)

Refresh totals (`find pilots -name '*.lean' | xargs wc -l | tail -1`; theorem/lemma
counts from the extractor — R3 F4 rule: counts are generated, not hand-written), then
append the Iteration-4 table (section numbering per H's ledger at execution; §10
expected), one row per pilot:

```
| pilot | final files | LoC/thms (extractor, sha-dated) | axcheck verdict (log cite, coverage split public/private/lemma) | sorry tokens | sign-off |
```

`sign-off = OK` iff Step A 0 unexplained ∧ Step B OK ∧ logs persisted full-length with
provenance headers + sha256; otherwise `FAIL → <lane>`.

## 4 Step D — compliance sign-off (append once A–C clean)

> Signed off (Iteration-4 final sweep <date>): all kept Iteration-4 pilot artifacts
> elaborate on mathlib `ff2494ea` (v4.36.0-rc2) or a declared donor pin with standard
> axioms only — no `sorry`, no `native_decide`, no external CAS in any proof artifact;
> the sole `sorry` tokens in the tree are the enumerated header-justified
> probe-convention stubs (carry-forward baseline + Iteration-4 additions, listed),
> never cited as results; external donors enter only as statements — binders, verbatim
> probe copies, or already-built on-pin libraries; counts in this sign-off are
> extractor-generated.

If Steps A–C surface anything else, stop and route to the lane instead of signing.

## 5 Close gates (the R4 protocol rules, executed with the close — results table committed WITH the close block, same commit)

1. **Scoped gate greps** — every gate grep scoped to the live section of its target
   file, never the whole file: `! sed -n '/^## <live-section>/,$p' <file> | grep -q
   '<retired-string>'`. (C2 worked example: the whole-file "do not decide until" grep
   false-positived on frozen TRIAGE.md:115 — `qa/closeout-gate-run-C2-reconstructed.md`
   gate 5.)
2. **Gate-run persistence** — final run of every gate on the exact closing tree;
   per-gate table (gate / command / raw result / verdict / date / commit) committed
   with the close block; failures either fixed-and-rerun or `OVERRIDDEN — reason —
   owner`; no "passed by inspection".
3. **INDEX-refresh close gate** — close not declared until INDEX.md reconciles
   both directions against disk (command in r4-process-completeness §6 rule 3); every
   new row dated with a source record; stale-status rows rewritten in the same pass.
4. Date-discipline grep (future-date and `YYYY-MM-DD/DD` compounds) before the close
   commit — r4 §6 rule 4.

## 6 Execution trigger

Orchestrator signal "Iteration-4 pilot lanes final" (expected after the chartered slots
land or are declared dropped — per the closeout-commit-plan-ITER4 preconditions). Then:
Step A locally (seconds) → Step B one warm Modal batch via `run_axcheck.sh` (+ donor-tree
and heavy-import stages in their classes) → Steps C–D ledger + sign-off → close gates
(§5) with the close block. Blockers route to lanes; §1 re-baselines if pending files
landed with tokens.

## 7 Wave-2 addendum — pre-staged close-out inventory (lane A1, 2026-11-17; PREP ONLY)

Written so the final sweep is ONE command per step when the wave-2 pilots land
(zzv2 P1, 73-Q4, 75-N2, 78-P0, 32-M2, AL-P2 c/d/e). Baseline disk state 2026-11-17
(worktree agent-02): classifier re-run CLEAN (17 hits / 0 unexplained, all in the four
probe-convention P0 files — entry 1 of `logs/stepA-incremental-iter4.log`, OPENED this
pass; the log did not exist before). Wave-2 expected Step-A certificate at close =
**49** = 43 C2 carry-forward + 3 `al3d/P0` (:85/:123/:128) + 3 `lp/P0` (:44/:55/:97),
plus lane-declared additions only.

### 7a Per-artifact inventory (owed vs present, 2026-11-17)

| artifact | state at prep | Step-A (classifier) | Step-B stage / TARGETS | sha-stamp point |
|---|---|---|---|---|
| zzv2-lam **P0.lean** | FINAL-GREEN `p0-run1.log` (A3; log + P0-record.md in agent-04 until H commits) — sha256(16) `ab9974f18568d0ab` | 0 tokens (verified this pass) | **NO TARGETS row, ever — probe-convention** (#check + donor prints only, no theorems; plan §0 preamble + C2 AxPilot71_P0/73_P0 precedent). RULING: §0's zzv2-row phrase "P0/P2 stages run on the donor tree" is superseded for P0 by the lane's probe classification — P0's donor-hygiene evidence of record is `p0-run1.log:151–154` (4/4 triad, §10.10) | P0 sha of record = `ab9974f18568d0ab` (disk, agent-02 2026-11-17); cross-check against the p0-run1 header stamp when H commits A3's log |
| zzv2-lam **P1** (λ-abstract statement layer) | NOT on disk *(RESOLVED 2026-11-17: **P1 LANDED GREEN FINAL** — `p1-run3.log`, 10/10 theorems triad incl. both private helpers, sorry-strict, 290 LoC, §10.16; HARD STOP executed per r5 §12a — P2 = iteration-5 Landau η-port charter decision; [LAYERS]-donor-tree stage at sweep via the M4b recipe; taskset-not-j CPU cap finding recorded; record + log in agent-04 pending H commit)* | on landing: append row to stepA-incremental log | **OWED on landing**: classify probe-vs-proof per lane report; if proof → [LAYERS] donor-tree stage on the built ZetaZerosV2 tree (`run_m4b_donor_axcheck.sh` recipe, AxPilot42_M4b precedent) + TARGETS row or donor-tree stage name | sweep-time sha in the donor-tree stage header (M4b dry-run pattern) |
| 73-**Q4.lean** | on disk, **NOT final** (A2 mid-run; skip per queue) — sha a3c69aa53cc0453d is NOT a bytes-of-record *(RESOLVED 2026-11-17: **Q4 LANDED GREEN** — `q4-run15-green.log`, the hRat discharge M0 + Q4-c unconditional; 23 decls = 14 public + 9 private, ALL direct-print triad, coverage C1, §10.18; final sha 491af05ab4b95e76; 15-run descent; `AxPilot73_Q4` TARGETS append at sweep; Rosen GTM-210 ch. 8 pin carried PROVISIONAL — one-lookup verification at the dossier-upgrade write-up; record + log in agent-03 pending H commit)* | 0 tokens TODAY (early signal only) | **OWED on landing**: `AxPilot73_Q4` TARGETS row ([WARM]; verify Mathlib-only imports at landing); Rosen ch.-number spot-check due AT Q4 (SCAN §1c) | landing run-log header + sweep re-stage |
| 75-**N2-P0** (A5, in flight; A1 = fold owner) | NOT on disk *(RESOLVED 2026-11-17: **N2-P0 LANDED GREEN** — `n2-p0-run4.log`, 15/15 Pilot75N2 decls triad, §10.12; **[WARM] branch fired**: Mathlib-only + sibling `import Pa` (Pa rewrite, AxPilot75_Pa in TARGETS), NOT donor-tree D-PIN; P1 GO recorded, file/family grows — TARGETS row at N2-final; record + log in agent-06 pending H commit)* | on landing | **OWED on landing**: N2 shared-ℚ staging (d1/d2) + consumer file; class per §10.5's standing note — consumer elaborates in the zeta23 donor tree ⇒ **D-PIN rows** (donor-pin print source `zeta23e-p0-run1.log`), or [WARM] if N2 lands Mathlib-only as Pb did | sweep-time sha; D-PIN rows cite the donor-pin log |
| **78-P0** | no dir *(RESOLVED 2026-11-17: **Stage-A P0 LANDED GREEN** — `p0-run4.log`, 3/3 public theorems triad, §10.13; proof artifact 444 LoC, sha d94d115e3d8d08d7; census 3 public + 23 private lemmas — privates elimination-noted, full-coverage prints when Stage B charters; record + log in agent-08 pending H commit; TARGETS row deferred with the Stage-B family)* | n/a | **OWED on charter+landing**: row + stage once files exist (class unknown at prep) | on landing |
| 32 run-12 (**M2.lean**) | NOT on disk (only M1.lean + old logs) | on landing | **OWED on landing**: `AxPilot32_M2` TARGETS row ([WARM]; six lemma forms per REPORT-INPUTS §1 32-crossing row). RUNNER CAVEAT: `pilots/32/run_pilot.sh:15–16` is a STALE xyz-default wrapper — run with `MODAL_USER=doz` override (week1-agenda row 1) | landing run header (pb-run12 pattern) |
| AL-P2 **A2.lean final state** | m1 state (P2-b landed; **c/d/e owed** — file grows or A3.lean appears) | current: 0 tokens | `AxPilotAL3D_A2` **PRESENT** (re-stage at sweep = bytes of record); if `A3.lean` appears → **OWED**: new `AxPilotAL3D_A3` row | sweep-time sha (m1 sha 91b4fba741d05771 is historical, §10.6 F1-corrected) |
| 72-M1 **T3** | L3a FINAL (fe57d30b19d9a836; print-gap CLOSED `axcheck-l3a-run1.log`) — **mid-tranche**: L3b–d + interface owed, file GROWS | 0 tokens | `AxPilot72_M1_T3` **ADDED this pass** (staging dry-run verified: T3→AxT2→AxT1 rewrites, 9 appended prints; re-stage at sweep) | L3a sha recorded in row comment; sweep-time sha governs |
| 75 **Pb.lean** | FINAL (pb-run11/12 + Step-B closure) | 0 tokens | `AxPilot75_Pb` **PRESENT**; Step-B full coverage **ALREADY DISCHARGED EARLY** — `pilots/75/logs/axcheck-full-run1.log` (89/89 census decls triad, sha da05c60ceb78755b). At sweep: re-stage only as drift-check; quote sweep-time counts unless sha unchanged, in which case cite the standing closure log | da05c60ceb78755b (closure, §10.8 F3 stamp); sweep re-stamp if bytes move |
| LP L1/L2, AL3D A1 | final, swept rows current | 0 tokens | `AxPilotLP_L1/_L2`, `AxPilotAL3D_A1` **PRESENT** (drift-check class) | sweep-time |

**TARGETS deltas this pass (mechanical-safe only):** + `AxPilot72_M1_T3` (the sole
extension whose file exists at a landed-final state AND is proof-class; dry-run staged
clean). DELIBERATELY NOT added: zzv2 P0 (probe-convention — never a Step-B stage),
73/Q4 (in-flight, not final), and every not-yet-on-disk artifact above (rows owed on
landing). make_axcheck72m1.py's local TARGETS already carries T3 (L3a closure,
2026-11-17).

### 7b Sweep-time command card (one command per step, wave-2-ready)

1. **Step A (local, seconds):** the C2 §2 classifier verbatim over
   `research/pilots/**/*.lean` + `research/feasibility/probe/**/*.lean`; expected =
   49 + additions, 0 unexplained; append the verdict row to
   `logs/stepA-incremental-iter4.log` (opened 2026-11-17, entry 1 = the 17/0 baseline).
2. **Step B (two-part):** (i) `research/feasibility/probe/run_axcheck.sh 2>&1 | tee
   /tmp/crossmath-axcheck-iter4.log` — the full make_axcheck TARGETS batch (C2 frozen
   rows = drift-check; Iteration-4 rows [WARM] class; `MODAL_USER=doz` default);
   (ii) **full-coverage custody stages** for Iteration-4 proof artifacts per plan §2
   default 1 — `axcheck_iter4.py gen` + the pilot-75 custody-runner pattern
   (`axcheck_run75.py` class: complete-output dump, scan-compatible verdict, sha stamp):
   already DISCHARGED for 75_Pb (`axcheck-full-run1.log`) and 72-M1 T1/T2/T3
   (`axcheck-l3a-run1.log`) — re-run ONLY where sweep-time sha differs; NEW for
   whatever lands (N2/Q4/A3/T3-grown) **+ 32-M2** (the 2 helper lemmas
   `log4_pos`/`log10_pos` get direct prints there — §10.11's print caveat closes
   at that pass) **+ 32-M1** (added 2026-11-17 at the 32-v2 article pre-check:
   M1's 28 lemmas — incl. the article-§5-named `lnΛ_pos_gamma`, `lnΛ_decompose`,
   `hasDerivAt_Ffun`, `Ffun_mvt`, `kappa_pos`, `lnΛ_upper`, `lt_Rc_iff_gmax` —
   were never in any print surface: in-file tails and C2 stages are theorem-only,
   and the C2 rescue stage persisted 16 of its 22 lines; the full-coverage stage
   closes both at sweep). NOTE (generator split, verified 2026-11-17):
   `make_axcheck.py:96–97` still EXCLUDES `private` theorems and captures no `lemma`s —
   full-coverage comes from `axcheck_iter4.py gen`, which is why the two-part Step B.
   Donor-tree stages (zzv2 P1/P2 if proof-class) via `run_m4b_donor_axcheck.sh` recipe.
3. **Step C/D + close gates:** unchanged (§3–§5); sha256-at-sweep quotes sweep-time
   counts over standing-log counts whenever bytes moved.

### 7c Standing risk notes (wave-2)

- 73/P0 line drift +2 vs the C2 enumeration (same 7 tokens) — A8-F2 class, no action,
  recorded in stepA-incremental-iter4 entry 1.
- The G11/G12 + LP/AL3D/ZzV2-λ/Zeta23e probe files are Step-A scope (probe-convention);
  G12's μ(π)=2 registration ≠ endorsement language travels into any Step-C row that
  cites it.
- ZZV2 P0(b) UNFAVORABLE ⇒ stop-after-P1 rule ARMED (§10.10) — P2 may never land; the
  sweep treats a stopped ladder as declared-stop, not a gap (rows for P1 only).

— addendum lane A1 (R3-role successor), 2026-11-17. Supersedes nothing; §0–§6 stand.

### 7d Wave-2 tail landings — inventory update (lane A1, 2026-11-18; PREP ONLY, append-only)

Folds the six §10-covered landings that reached main AFTER §7a was written (commits
`68be1a2`, `3750c48`, `0677eae`+`9dc6684`, `570f3e9`, `c536994` — rows §10.24–§10.27
of `qa/iter4-review/r3-verification-tables.md`; main was at `c67d64e` at this
writing). §7a's rows stand; this block is the delta the sweep executor adds:

| artifact (landing commit) | Step-A (verified 2026-11-18 dry run) | Step-B at sweep |
|---|---|---|
| `pilots/10/L4.lean` (D2 FINAL, `9dc6684`; sha `4ae0d6435e351128`, 4,195 LoC) | 0 real tokens (header prose only) | **NO separate stage — folded into the single `AxPilot10_L5` anchor (orchestrator ruling 2026-11-18): L5 embeds L4 verbatim, so the one full-coverage custody stage covers the tranche's final theorem state; L4 is a §10 historical citation (§10.26)** |
| `pilots/10/L5.lean` (D3, `9dc6684`; sha `da398f2170288acb`, 4,248 LoC) | 0 real tokens | **THE tranche-final TARGETS row: single `AxPilot10_L5`** (orchestrator ruling 2026-11-18 — H applying in `make_axcheck.py`; supersedes the §0/§10.17 `AxPilot10_L3`-at-sweep phrasing and §10.20(iii)'s `AxPilot10_L4`); embeds L4+L3 verbatim, Part H 37 lines is the new surface — `pad_bound`/`padded_time_absorb` triad `d3-run1.log:44/:45`; full-coverage custody pattern (`axcheck_iter4.py gen` + pilot-75 runner class) |
| `pilots/22/T2a-P0.lean` (`3750c48`; sha `1b3d117662eb6cc8`, 99 LoC) | 0 tokens (3 prose strings :4/:6/:12) | NO stage — statement rung, probe-convention class (§10.25) |
| `probe/ProbeG9_StrongPNT.lean` (`68be1a2`; sha `c1f93388d2308073`) / `probe/ProbeG13_PhyslibOccupation.lean` (`68be1a2`; sha `66b9416f0cd6a50a`) | G9 = the 2 certificate tokens `:51/:67` (entry 2); G13 = 0 | NO stages — G-series probes are Step-A scope only |
| `pilots/ff-ez2/P1.lean` (`570f3e9`; sha `9d8a7b1981faabce`, 186 LoC) | 0 real tokens (1 prose string :3) | proof artifact — `AxPilotFFEZ2_P1` **fires at sweep: the family is FINAL** (P2 landed GREEN 2026-11-18, §10.28 — the P0→P1→P2 charter fully closed); 7/7 in-file triad surface is the landed evidence (§10.23) |
| `pilots/ff-ez2/P2.lean` (landed on main 2026-11-18; sha `24926ac4cbbcdd50`, 207 LoC) | 0 real tokens (1 prose string :3) — verified in the 2026-11-18 fold pass (post-dates the morning dry run) | **NEW full-coverage custody stage `AxPilotFFEZ2_P2`** — 9/9 triad full-spelling `p2-run2.log:42–:50` (4 public + 5 private); mathlib-only, zero donor imports (import check DISCHARGED, §10.28) |
| `pilots/77/T1.lean` (`c536994`; sha `f365c4c52b970d27`, 781 LoC) | 0 real tokens (1 prose string :11) | NO stage — verified-red NOT-GREEN artifact (31 site-local residuals); stage only if/when the re-chartered T1-completion lands GREEN (§10.27) |

Also recorded here: **stepA-incremental ENTRY 4** (2026-11-18) — wave-3 dry run
confirms certificate **52 exact** on main (`c67d64e`, 104 files, bucket tally exact),
zero new tokens from the tail landings; and the ENTRY-3 line-cite correction:
al3d/P0's 3 tokens sit at `:106/:144/:149` in the committed bytes at sha
`52c5b9f77344e0ed` (entry 3 + the run-8 log header cite `:104/:142/:147` — staged-bytes
drift, count unchanged; A8-F2 class). Sweep-time G1 is count-bound; unaffected.

— 7d lane A1, 2026-11-18. Append-only; §0–§6 + §7a–§7c stand.
