# R5 READ RUBRIC — the 12-core closing-batch independent verification read (pre-loaded 2026-11-21, fires on R3's report)

Lane R5 (worktree agent-04 @ `d6179f4`). Fresh-eyes protocol: every check executes
against LANDED bytes/logs (worktree ff-refreshed to the landing commit FIRST), never
against R3's narrative alone; verdicts from VERDICT blocks, never filenames (the
al3d run-8 lesson); site-closure ≠ certification — parse explicit error/sorry counts
and the axioms prints. Output = a one-page read record
(`qa/iter4-review/r5-12core-verification-read.md`, same dir) + the verdict line to H.

## 1. Regression anchors (must hold at the landed shas)

- [ ] **The milestone state is intact or guard-superseded**: disk `CORE.lean` at the
      closing-batch final sha, with the recorded sha chain
      `9c213eb7` (day-1 baseline) → `d3f7b5c9`→`acb9fe47`→`49dc682a`→`0b040ee7`→
      `5608bb30`→`7e40dff4` (milestone) → **[closing-batch chain]** — every link
      named in the run-log provenance headers; no unexplained jump.
- [ ] **Day-1 kernel-clean structures survive**: the three verbatim donor ports
      kernel-clean; `parametric_main`'s `route16_MMgeneral M W epsParam_data h17 h16`
      real reduction; `epsParam_frozen_fiber_claim` real projection (the
      `ε (logb 2 7) = 0.00175` frozen fiber).
- [ ] **The run-9 milestone content survives**: `MMgeneral_total_sum` with
      `termPrime W.MM n D` (strassen slot freed), the ω_b-balance binder
      `W.ωb + 1/12 ≤ 3 − η/18` explicit, the in-line MM-term bound chain
      (`W.grows` × `Choice.le_root` ⇒ the balance step), `ChoiceSumInputs` as the
      explicit interface.

## 2. Triad-print audit scope

- [ ] **The 13 top-level theorems of record @ `7e40dff4`** (R1's prestage §3.1 count;
      H's brief says 14 — the count at the CLOSING sha governs; enumerate the
      declaration table from the closing record, do not trust either count blindly).
- [ ] **The closing batch's new/changed decls** (expected: the `Choice.lean:60–244`
      rpow-calculus port at the frozen η = 0.0315, c = 2 instance; the
      `ChoiceSumInputs` discharge; `route16_MMgeneral`; possibly route-15/symbolic).
- [ ] Expected classes per decl: **triad-clean** (`[propext, Classical.choice,
      Quot.sound]` exactly) for the proved core — vs the **DECLARED 8-sorry
      interface set** (`AxPilot12_CORE` booked declared-FAIL by R1; class upgrades to
      OK iff sorryAx-lines=0 at the closing sha). Every decl must sit in exactly one
      class; any third state = finding.

## 3. The DECREASING-form rider (`EpsData.strict_anti`) compliance

- [ ] The form of record is `EpsData.strict_anti : StrictAntiOn ε (Set.Ioc 2 2.9)`
      (P0.lean) — ε strictly DECREASING on (2, 3), the 9/4 < log₂7 = 2.8074 anchor.
      Check: (a) the closing batch's new proofs consume decreasing facts ONLY in
      this StrictAntiOn form; (b) CORE.lean + the closing record's prose make no
      weaker/reverted (mono-on, increasing) decreasing claim; (c) the rider's BINDS-
      all-core-prose scope (D4) is respected — any new prose row that mentions ε's
      monotonicity carries the strict-anti form.

## 4. Sorry-token accounting (Branch A arithmetic vs R1's dry census)

- [ ] Branch A = the closing batch LANDS: final sorry-count = **8 − (discharged N,
      each named: expected ≥ `route16_MMgeneral`; possibly `:250 route16_symbolic`,
      `:233/:240` route-15/16 siblings)** — count from the log's explicit
      sorry-lines + the record's stub-table diff, not from the headline.
- [ ] The 8-stub frontier of record: `:190 route15_frozen`, `:198 route16_frozen`,
      `:233 route15_MMgeneral`, `:240 route16_MMgeneral`, `:250 route16_symbolic`,
      `:378 flagship_shape`, `:400 balancePoint_monotone_shape`, `:471 epsParam_data`
      (def-stub). Stubs that remain carry the declared class; **any NEW sorry beyond
      the frontier = violation** (route to R3 before any G1 fold).

## 5. Run-ledger reconciliation vs `REPORT-INPUTS-ITER6.md` §2 + the grant discipline

- [ ] Register §2 rows: 12-core runs 1–3 (day-1 GREEN descent 3→1→0) + runs 4–9
      (S-tranche, 6 fires, descent 11→10→3→2→1→0, run 9 = the milestone) +
      **closing batch ≤5-fire GO** — reconcile R3's reported run numbers, per-run
      verdicts, log paths + shas, walls, telemetry class against the register; the
      register's UNFIRED rows must be superseded by the read's time.
- [ ] Grant discipline: fires ≤ 5 for the closing batch (the `259f383` GO); every
      fire sha-guarded; logs persisted with provenance headers (the log-rescue
      lesson); no off-band fire.

## 6. M-class evaluation readiness (the G6 V1 gate inputs)

- [ ] `flagship_shape` `:378` + `balancePoint_monotone_shape` `:400` — still the
      named statement targets; their hypothesis inputs (the closed routes +
      `MMgeneral_total_sum` + the discharged `ChoiceSumInputs`) complete?
- [ ] The **step-2 open question** (the charter input's only mathematical risk) —
      named, scoped, and either resolved or honestly carried by the closing record.
- [ ] Verdict cell: V1-READY (the evaluation can execute on these inputs) /
      V1-BLOCKED-on-<named gap> — this line feeds H's G6 stamp directly.

— pre-loaded by lane R5, 2026-11-21 (@ `d6179f4`; modal-side probe at 12:52 showed
R3 TASK-IN-FLIGHT, fresh task created 12:52:40−ε +08). The read fires the instant
R3's report lands.
