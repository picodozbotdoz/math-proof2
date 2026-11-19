# A3/R3 — WAVE-CLOSE RE-OPEN CHARTER (the one-fire instrument for the queue-dry moment)

Lane R3 (A6 lineage, worktree agent-07), 2026-11-19. Drafted at the orchestrator's
re-task; state-read at main `53b7278` (batches B–G landed) + the worktree-side parks
(N2-P1 `396d8710` on agent-06; 74-P2 `4425be89` on agent-07). Purpose: when the wave's
task queue runs DRY, this charter re-opens the completion-class residues as ONE
consolidated fire-list — every item carries its owner lane, the staged sha, the
EXACT fix list (verbatim from the parked records), its run budget, the expected
verdict, and the fold that follows. Cross-check: R1's EVENT-STANDBY fold list
(batch F: L3-final, M2-b-fire, P3-complete-fire, 41H-T2, eta-confirm) — this
charter's items are exactly those fires plus the two N2/74 one-fires. Discipline
riders in §8. **Total predicted spend if all items fire: 10–16 runs across 5 lanes;
4 of the 6 items are single-fire.**

---

## Item 1 — N2 P2-b CONFIRMATION (single fire; the critical-path head of the 75 landing)

- **Owner lane:** R6 (the N2 owner; any lane may fire — the run is mechanical).
- **Staged sha:** `N2-P1.lean` parked `396d8710d9084388…` (worktree agent-06; main
  keeps the verified `ce6719c8` per the batch-9 note). Guard: `396d8710`.
- **The run:** ONE confirmation run (`run_n2p1.py` lineage, warm `crossmath-pilot-75`
  class, doz CLI, SPEC 2cpu/4GB). Two fixes are already on disk post-r30 (the hoisted
  positivity fact for the :883 by-linarith; the root-level `analyticOrderAt_eq_top.mp`
  for the :918 Exists-whnf dot trap); runs 27–30 descended 11→6→4→2, zero math
  defects throughout — the whole loop was name-resolution/tactic-field.
- **Expected verdict:** **GREEN at 17/17** (`eulerStripImmunity_changeLevel` — the
  one non-triad decl at 16/17 — closes with the two parked fixes). Fallback per the
  resume note: if the :883 linarith resurfaces, read its exact context goal FIRST
  (the r30 display was truncated; the parked hoist is best-effort) — that is the
  only authorized second fire.
- **The fold that follows:** R1's `P2-b-fire` fold-once (r3-tables ENTRY; the N2-P1
  record's wave-5 posture closes P2-a CLOSED + P2-b CLOSED). **Then the critical
  path continues per `pilots/75/N2-P3-plan.md`: P2-c (the dyadic→cumulative port on
  the staged `ThmEDyadic`/`CountsUnbounded`/`ThmEDyadicToCumulative` shapes — both
  structural inputs then theorems) → P3-e assembly + N3 full-coverage axcheck ⇒
  `zetaL_rat_two_thirds_landed` (P3-b/c already GREEN at `N2-P3.lean` `f9bd28c5`;
  P3-d = the V2 substrate rung, free-floating, can fire any time).

## Item 2 — 74-P2-c WAVE-CLOSE (single fire; the two parked lines)

- **Owner lane:** R3 (mine; any lane may fire).
- **Staged sha:** `P2.lean` at the park `4425be898768fdb0` (worktree agent-07; the
  adjudicated nonneg-`BkClass` def + run-17's cleared classes already in). The
  G2-GREEN state of record `49b808f3` stays preserved in `logs/p2-runs1-11.log`.
- **The run:** ONE run (`stage_and_fire_p2.sh 18`; sha-guard sidecar active). The
  TWO parked fixes (from `logs/p2c-run17.log`'s header, fixes in hand):
  1. `hy2` — restate `hyy` in `y ^ 2 ≤ (1/64) ^ 2` form (or feed the
     `show y * y = y ^ 2` explicitly): the nlinarith atom-shape `y^2` vs `y*y`.
  2. `hmul` — DROP the type ascription: `have hmul := mul_le_mul_of_nonneg_left hθe
     (mul_nonneg (sq_nonneg u) (sq_nonneg L))` (the lemma's own output shape
     `u^2*L^2*(1/2) ≤ u^2*L^2*(512*e*θ)` needs no flip).
- **Expected verdict:** **GREEN** — run 17 closed everything else: `t4_not_littleO`
  fully closed, both arg-shape sites, the neg_neg class, and the adjudicated
  `BkClass` elaborates. Residue at 17 was exactly these 2 sites + 13 print-cascade.
- **The fold that follows:** R1's ENTRY fold (74-P2-c CLOSED: the full tightness set
  — family-on-parabola + θ₀ = 1/(1024·e) membership + floor-achieved + not-littleO
  + the adjudicated nonneg-BkClass); the dossier-74 amendment draft
  (`pilots/74/dossier-74-amendment-p2c.md`) flips from "at honest proof-status" to
  "landed" and H folds it; the §10 row cites both shas.

## Item 3 — 72-M1 L3 FINAL ROUND (1–2 rounds; the four named fixes)

- **Owner lane:** R2 (the L3 owner).
- **Staged sha:** `P72M1T3.lean` v13 at the 13-run closing state `dcda3133b1ffbd16`
  (Held fold-once per batch G; the stop-note `logs/l3bd-stop-note.md` §FINAL-ROUND
  ADDENDUM is the fix list of record).
- **The fixes (verbatim classes from the stop-note):**
  1. **hQ-tail — ONE WORD:** the lemma is `Finset.mul_sum` (`a * ∑ f = ∑ (a * f)`),
     NOT `Finset.sum_mul` — run-13's own error display shows the needed form.
  2. **hmul — pattern rotation** (the r13 form; run-11's `submatrix_add` double-
     congrFun precedent decodes the pointwise-function signature).
  3. **hN — the e1/star-chain pullout** (displayed in run 13's errors).
  4. **hamiltonian-step1 — set-avoidance:** do NOT rewrite `ps` inside the subtype;
     state step-1 in the UNFOLDED `{X // X ∈ (gridDom L).powerset}`-form, or
     generalize `ps` before the calc instead of `set`.
- **Expected verdict (per round):** round 1 flips `isAdmissible_ΦL` + (likely)
  `hamiltonian_gridDom_eq`; round 2 the interface. **Target: the contaminated trio
  (`isAdmissible_ΦL`, `hamiltonian_gridDom_eq`, `interface_areaLaw_uniformAreaLaw`)
  all triad-clean** — L3b/submatrix_mulVec_ec/eig_toGrid/L3c/edgeBoundary_le_boundaryCard
  are ALREADY triad-clean; 13 runs, zero math defects; T1/T2 regression must stay OK.
- **The fold that follows:** R1's `L3-final` fold-once (the §10 row: 72-M1 L3b–d +
  interface CLOSED — the last open iter-4 carry); REPORT §I4.2's post-wave row closes.

## Item 4 — AL-3D M2-b/M2-c (2–3 runs; two pre-written one-liners then the swap + assembly)

- **Owner lane:** R8 (A4 lineage, agent-05).
- **Staged sha:** `A2.lean` at the unit-6 stop `9706196c5f5ff593` (2 sorryAx-parked
  M2-b decls: the guard bridge `regReindexEquiv_compl_iff` + the swap
  `colEquivVar_swap`; M2-a CLOSED 4/4 GREEN; the M0-rebuild leg GREEN).
- **The fixes (pre-written in `pilots/al3d/M0-record.md` §M2 unit-6):**
  1. `:1312` — the planar-restr index is FLAT, not nested: `congrFun h ⟨proj x,
     Finset.mem_sdiff.2 ⟨huP, hxu⟩⟩` (the w-membership rides `Finset.sdiff_subset`
     inside the restrict₂-unfold, met by `simpa`).
  2. `:1325` — construct the two colRegEquiv-equations EXPLICITLY (`e1`/`e2` via
     `rw [← regReindexEquiv_apply (Λ := Λ) q ēw ⟨proj x, huP⟩, hw]`), then
     `exact e1.trans (hwu.trans e2.symm)`.
  3. Then the SWAP proper (`colEquivVar_swap`'s proof is untested — cascade-sorried
     through the guard; `if_pos/if_neg` entrywise, guard now discharged) + the M2-c
     Hamiltonian-identification assembly (submatrix-sum distribution over the
     partition; the structural halves `powerset_eq_biUnion_projFib` +
     `sum_projFib_extendId` are banked GREEN).
- **Expected verdict:** M2-b GREEN at run 1–2 (the one-liners landed first-try in
  the M2-a precedent); M2-c GREEN at +1–2. Gate held: the 85-line core
  byte-identical, P0/A1 frozen.
- **The fold that follows:** R1's `M2-b-fire` fold-once; the rebuild-precharter's
  M-ladder advances to its M3 rung (the 12–18-run budget's remainder).

## Item 5 — eta CONFIRMATION + the rung queue (single fire, then the port ladder)

- **Owner lane:** R5 (the eta owner).
- **Staged sha:** `eta-r1.lean` parked `5b04304a53a5b849` (the ii-b unfold-order fix
  on disk, UNFIRED per budget discipline).
- **The run:** ONE confirmation run (`run_zzv2.py`, warm `crossmath-pilot-zzv2-lam`,
  doz CLI; sorry-STRICT branch — port files are proof artifacts, no probe prefix).
- **Expected verdict:** **strict-OK 6/6 triad → R1 exits GREEN** (`fourierC_dilateTo`,
  `cutoffNormaliserLam_covariance`, `cutoffTestLam_eq_dilate`, `dilateTo_half`,
  `extremalLam_half`, `cutoffTestLam_half`). Port ledger: 2 of 6–10 spent.
- **Then the ladder (per `eta-port-plan.md`, budgets pre-mapped):** R2 admissibility
  + pair-test tier (1 run) → R3 the λ=1/2 regression FIRST (risk-2 mitigation, 1
  run) → R4+ (1 each) → first-GREEN band run 4–6; κ=1 keeps 5–8 plausible; ceiling
  12–13. Phase-2 bake trigger if the loop passes ~4 runs.
- **The fold that follows:** R1's `eta-confirm` fold-once (the port's R1 rung row);
  each subsequent rung folds on its own exit.

## Item 6 — 41H TRANCHE 2 (charter DECISION first, then 4–8 runs — NOT one-fire)

- **Owner lane:** R4 (H; the tranche-2 charter decision belongs to the orchestrator).
- **State:** tranche-1 GREEN at `H1.lean` `283503ada8f5571e` (2 of 9 runs; the §T
  tauceti hygiene gate fired first; transport + the TRACIALITY OBSTRUCTION banked —
  the tranche-1 finding that SHARPENS tranche 2's target: trace dictionaries are
  ELIMINATED).
- **Tranche-2 scope (the H-record's re-price checkpoint):** (a) a concrete
  NON-tracial dictionary candidate — Kauffman-bracket tangle evaluation or an
  explicit 5-dim TL_3(δ)-module functional (must be non-tracial by §3); (b) its
  finite check, decide-encoded. Estimate UNCHANGED: +0.5–1k LoC / 4–8 runs; the
  L-case (build TL infrastructure) remains possible if no mathlib-native
  non-tracial functional suffices.
- **The charter ask:** rule the tranche-2 direction at the dry-queue (or defer to
  the wave-close review — the decision, not the fire, is the gate). On a GO: R4
  fires per the preflight's tranche-2 pattern; own-file bookkeeping continues (the
  second-discovery-own-file adjudication stands; the article stub carries no
  content claims until landing).
- **The fold that follows:** R1's `41H-T2` fold-once at tranche-2's closing state
  (GREEN or honest-partial; the §10 row + the 41H article).

---

## §7 The parallel schedule (ordering recommendation — which lanes free up when)

All six items are INDEPENDENT pilots (no cross-pilot dependencies); the only
internal sequencing is N2's own critical path (P2-b-confirm → P2-c → P3-e, per the
N2-P3-plan — P3-d free-floating). Recommended at the dry-queue, assuming 4–5 free
lanes:

- **SALVO 1 (parallel one-fires, t=0 — three lanes, 3 runs total):** Item 1 (N2
  P2-b confirm), Item 2 (74 wave-close), Item 5 (eta confirm). All three are
  single-fire with fixes already on disk; all three free their lanes at t≈40–90 s
  (warm walls). Their folds (R1's fold-once list) can batch.
- **SALVO 2 (t=+1, two lanes):** Item 3 (L3 FINAL-ROUND round 1) and Item 4 (AL
  M2-b one-liners + swap). Both are ≤3-run items with pre-written fixes. If a
  salvo-1 lane frees first, the L3 round 2 or the AL M2-c assembly slots in.
- **GATED (any time after the orchestrator's ruling):** Item 6 (41H-T2) — the
  decision is the gate, not a lane; on a GO it can run in parallel with everything
  (its budget is the largest, 4–8 runs — start it EARLY if ruled GO, since it is
  the long pole).
- **N2 continuation (after salvo 1's GREEN):** P2-c → P3-d (free) → P3-e + N3
  axcheck — the 75 landing remains the wave's critical path; prioritize its lane.
- **Folds:** each GREEN fires R1's fold-once at the closing state (the EVENT-STANDBY
  protocol); no fold waits for another.

Lane-free map: R6 (after N2 confirm → continues the 75 path), R5 (after eta confirm
→ R2 rung), R2 (after L3 round 2 → free for 41H-T2 if ruled), R8 (after M2-c → the
rebuild M3 rung), R3 (after the 74 close → free; any overflow item).

## §8 Discipline riders (binding, all items)

Verify-fire per the 74 precedent (pre-run sha guard recorded in every log header —
the run-15 refusal is the exemplar; NO local lean; mechanical-fix-only loops; math
defects = findings + STOP). Budgets: per item above; a NO-GREEN at budget parks with
the wave-close set + the residue taxonomy — no looping past budget (the unit-4
ruling). Kernel-only; sorry-strict for proof artifacts (the eta convention); triad
`#print axioms` on every new theorem; telemetry every run (SPEC 2cpu/4GB,
LEAN_NUM_THREADS=2, taskset-not-`-j` where a build phase exists); logs with
provenance headers under each pilot's logs/. Commits HELD for H post-K per the
day-1-class convention. The must-cites + wording guards already binding in each
pilot's header carry verbatim (74's R9 set; 41H's own-file bookkeeping; the eta
record-billed DECISION-2=A posture).

— lane R3 (A6 lineage, worktree agent-07), 2026-11-19. State-read at main
`53b7278`; parks as cited. Execution-ready: each item's fire command, staged sha,
and fix list are one paste away.
