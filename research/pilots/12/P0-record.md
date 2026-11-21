# P0 record — pilot 12 (z4-parametric-savings-function-in-matrix-exponent)

**Verdict: P0 GREEN at run 2, 2026-11-20** (`PROBE-OK rc=0 errors=0 sorry=7` — zero
elaboration errors across the full statement surface; the 7 sorries are the expected
statement-shape stubs, probe-convention, NOT proof artifacts). Lane R3 (worktree
agent-07), DECISION-6 idle-lane conversion after the item-13 prestage drained; P0-first
MANDATORY per the preflight's own §6 ("its P0-first structure … is mandatory either
way"). Two warm fires, budget 1–2 respected.

## What elaborated (the P0 statement set, `P0.lean` sha `3d924056…` at GREEN)

Per preflight §5, four components:

1. **Ported shapes, VERBATIM** (3sum-apsp v4.33 statements → our v4.36 pin; the
   ProbeB3 statement-port class — again free): `DetTimeModel` (all 9 fields,
   `TimeClaims/Sec3/Definitions.lean:75`), `thinBound`/`splitBound`/`wantedBound`
   (:113/:117/:121), `logU` (`Util/Log.lean:104`), `queryCap` (root
   `PaperStatements.lean:876`), `termScans`/`termPrime`/`termBuild`
   (`Sec3/Parameters.lean:60/:66/:70` — termPrime = `MM n * D^{3/2}` is the flagged
   check's anchor), `strassen` (:73), `paramD₅/paramG₅/paramD₂₆/paramG₂₆`
   (:78/:83/:86/:89), `splitCap` (:93), and the Claim block:
   `Claim.Theorem_17 M MM D g` (:178–199 — the `MM : ℕ → ℝ` parameter this pilot
   generalizes), `Claim.Corollary_15_first` (:277), `Claim.Corollary_16` (:295),
   `Claim.Theorem_19_explicit M δ e` (:305–308). Plus the Sec-4 trade-off block
   (root `PaperStatements.lean:2006–2027`): `entropy`, `lnΛ`, `Rc`, `epsStar`,
   `rhoC`, `gammaOf`, `qOf`; plus `Theorem19.Choice` (`Sec3/Theorem19/Choice.lean:38`).
2. **The frozen routes restated** (stubs): `route15_frozen` (= donor
   `Theorem19.explicit_of_theorem_17_corollary_15` at `strassen`/paramD₅/paramG₅ →
   `(1/648, 2)`) and `route16_frozen` (= the `…_corollary_16` route →
   `(0.00175, 1)`) — the ported shapes compose to the donor's route shapes verbatim.
3. **The MM-generalized set** (hypothesis-binder pattern throughout — donors appear
   ONLY as explicit Prop binders, zero cross-project import): `WordRamMMData`
   (MM + ωb ∈ (2, 2.9] + nonneg + `MM n ≤ C·n^ωb` growth), `EpsData` (ε as DATA with
   the three dossier properties as explicit hypothesis fields: frozen fiber
   `ε (logb 2 7) = 0.00175`, strict monotonicity, `ε → 0` at 3⁻),
   `route15_MMgeneral` / `route16_MMgeneral` (the two routes at abstract `MM` —
   `Claim.Theorem_17 M W.MM …` ⇒ `Claim.Theorem_19_explicit M (E.ε W.ωb)
   (E.e W.ωb)`), `route16_symbolic` (D and g ALSO abstract, with the
   `Theorem19.Choice` family as an explicit binder — what the ω_b-dependent symbolic
   choice must re-provide), and `flagship_shape` (the ε(9/4) corollary with F3b —
   the model-gap transfer — as a binder over the OAI `AdmissibleExponent`/`omega`
   API carried VERBATIM from `ProbeC2_OAI_Model.lean`, which re-elaborated 0-error
   here at closure depth 0, as measured).
4. **The flagged F5 check as a P0 consumer**: `balancePoint_monotone_shape` —
   `hAnti` (the general form of `sec4_Rc_strictAntiOn`, `Limit.lean:132`) and `hZero`
   (the shape of `sec4_Rc_zero_tendsto`, `Limit.lean:148`) as binders over abstract
   Rc-data; `hbal` realizes the savings at the balance point in the corpus's own
   switching-order vocabulary (`gammaOf c θ = κ − qOf θ`, root
   `PaperStatements.lean:2068`), with ω_b entering the demand budget `κ` monotonically
   (through termPrime); conclusion `StrictAntiOn εf (Ioc 2 2.9)`.
   **THE STATEMENT ELABORATES — the F5 risk's first evidence is positive at the
   statement-shape level.** Whether `hAnti`/`hZero` alone SUFFICE to prove it remains
   the core's open step-2 question (the stub records exactly that).

## The preflight's GO/NO-GO read, discharged

Preflight :88–92: "P0 GREEN with the monotonicity statement elaborating ⇒ core is
charterable as scoped; the monotonicity statement NEEDING a stronger input than the
Sec-4 general lemmas provide ⇒ rescope". Run 2 is GREEN and the monotonicity statement
elaborates. **GO for the 12 core as scoped** (S–M per F4, F3b excluded = hypothesis
binder), with two honest qualifications below. The NEEDING-stronger-input branch is
NOT triggered at P0 level (that branch can only fire during the core's step-2 proof,
not at statement level — the P0's job was to pin that the statement is expressible
against the donor shapes, and it is).

## Two findings to carry into any charter (both pre-charter corrections)

1. **DOSSIER WORDING DEFEAT (found at staging):** dossier 12
   (`candidates/12-z4-parametric-savings-function-in-matrix-exponent.md` :54/:66/:172)
   says "strictly increasing ε(ω_b)" while its own headline reads ε(9/4) > 0.0017 —
   but 9/4 = 2.25 < log₂ 7 ≈ 2.8074, so both hold only for ε strictly DECREASING in
   ω_b (better MM = smaller ω = larger savings; ε → 0 as ω → 3). The P0 states the
   decreasing form (`StrictAntiOn` in `EpsData.strict_anti`); the dossier's
   "increasing" is a wording slip to correct at charter time (the 78-class correction
   pattern). The preflight :20 ("strictly increasing") inherits the same slip.
2. **Runner sorry-filter defect class (probe-runners):** run_p1.py's inherited filter
   `"declaration uses 'sorry'"` misses Lean 4.36's backtick rendering
   (`` declaration uses `sorry` ``) — run 1's verdict line read "OK" while the file
   carried 7 stubs (true count visible in the raw tail). run_p0.py now matches both
   forms; run 2's `PROBE-OK … sorry=7` is machine-truthful. Harmless for the 74
   series (all its runs were genuinely sorry-free — the filter was never
   positively tested there), but any lane reusing the 74 runner for a probe with
   expected sorries must widen the filter.

## Descent + discipline

Run 1 (`12759a5e…`, first fire): rc=0, 0 errors, 7/7 expected stubs — substantively
GREEN in one fire; two cosmetic defects only (dupNamespace linter warnings from a
nested namespace reopen around the top-level OAI block; the sorry-filter form above).
Run 2 (`3d924056…`, fix batch — single-level namespace reopen + filter widening,
sha-guarded, diff = exactly those two fixes): **GREEN, artifact of record.** Zero
mathematical content in the fix batch. No local lean at any point; SPEC 2cpu/4096MB +
LEAN_NUM_THREADS=2 + telemetry every run (wall 49 s / 32 s, OVER=0, samples=0 — both
runs under one 60 s interval; max_cpu reported 0.00 for the same reason); app
`crossmath-pilot-12p0`, image layers textually identical to the gprobe/73/74 lineage
(warm); oleans 8710 @ ff2494ea, toolchain v4.36.0-rc2.

## Files (H commits per hold-all-commits; worktree agent-07)

- `research/pilots/12/P0.lean` — sha `3d924056ed4c3e2c` at GREEN (run-1 state
  `12759a5e3eb8abd9` preserved in the run-1 raw log).
- `research/pilots/12/run_p0.py` — sha `a3976f964941804a` post-filter-fix (the
  runner; app `crossmath-pilot-12p0`), `research/pilots/12/stage_and_fire_p0.sh` —
  sha `a8658c4b53207764` (the sha-guarded fire script).
- `research/pilots/12/logs/p0-runs1-2.log` — sha `46abd882b5484e78` (provenance
  header + both raw runs).
- This record.

## Standing by

Item-13 (P2-c audit-tail fire at wave-close) remains PRE-STAGED UNFIRED per
`research/pilots/74/item13-prestage.md` — the ABSOLUTE PRIORITY OVERRIDE stands: on
the orchestrator's close signal, 12-core work (if chartered) pauses at a clean
boundary, the item-13 runbook §7 pre-fire assertions run first, then resume.

— lane R3 (A6 lineage, worktree agent-07), 2026-11-20.

## PENDING OWE (relay 2026-11-21, R5's read via H — track; apply at next P0 touch / iter-7 S-residue unit)

`P0.lean:236` (`route16_MMgeneral` statement-probe stub, file sha `3d924056ed4c3e2c`)
still restates the OLD unconditional (false-as-shown) form — probe-convention-exempt,
but the D4 rider binds core prose. OWED: the one-line binder mirror, the
`(hδ : E.ε W.ωb ≤ 0.0315 / 18) (he : 1 ≤ E.e W.ωb)` pair exactly as CORE.lean
`:892–896` (`route16_MMgeneral`) and `:941–947` (`parametric_main`) carry
post-223cfa1; to be applied at the NEXT P0.lean touch — the edit must ride an
elaboration fire so the probe verdict chain stays sha-verified (no fire granted
now). Same mirror owed for `route15_MMgeneral` (:230–233) and `route16_symbolic`
(:244+) when those statements are next touched — same falsity class (γ-freeze,
`M-CLASS-EVALUATION.md` §0).

— lane R3 (A6 lineage, worktree agent-07), 2026-11-21.
