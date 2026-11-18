# 74-P1 record — COMPLETION GREEN at run 5/5 (lane A8, 2026-11-18)

**Verdict (one line):** 74-P1 **GREEN** — `pilots/74/logs/p1-completion-runs1-5.log` run 5:
OK rc=0, errors=0, **sorry-warnings=0**, wall 30 s; the full-coverage `#print axioms` tail
reports every one of the seven public theorems
(`t1a_floor`, `t1b`, `t1b_window`, `t1c`, `cert_pad`, `Bk_le_Bk_succ`, `t4_floor_ceiling`)
**triad-only** — `[propext, Classical.choice, Quot.sound]`, **0 sorryAx**. The re-charter's
fresh ≤5-run budget was used in full (5/5 fired, all sha-guarded, zero sorry at every run);
the error descent over the completion series was 29 → 10 → 10 → 4 → 0 (against the
2026-11-17 stop at 46).

**Artifact:** `P1.lean` (770 LoC, final sha256(16) `6ddbda11d5da4f35`) — the four FINDS'
amended statements, all now kernel-verified:
- **T1a′ (`t1a_floor`)** — the marking bound `Var ≤ (1−ε)·W² + ε·Mdev²` (FIND #1's
  corrected per-spectrum statement; the dossier's √-floor as staged is refuted and
  re-recorded in the dossier's §Iteration-4 amendment).
- **T1b + T1b_window (`t1b`, `t1b_window`)** — subgaussian variance
  `Var ≤ 32(e^{1/4}−1)σ²` and window `W ≤ σ(2·log(2/ε)+1/2)` (FIND #3's explicit
  window-edge constants).
- **T1c (`t1c`)** — the MarginalTails class instance:
  `Var ≤ 8192(e^{e/2}−1)(1+θ)B` and `W ≤ 32√((1+θ)B)(log(2/ε)+e/2)` (FIND #2's centered
  mgfBound carries the class; FIND #3's constants).
- **T2 (`cert_pad`, `Bk_le_Bk_succ`)** — zero-padding injection + guarded ceiling
  monotonicity `B_k ≤ B_{k+1}` (the padA def is the injection; nonempty + bounded-above
  guards).
- **T4′ (`t4_floor_ceiling`)** — the corrected floor+ceiling PAIR on the class family
  under `hClass`/`hVarLB` (FIND #4; Q1 shape (ii); the o(√B) tightness stays P2-class).

**Route + discipline trail:** runner `pilots/74/run_p1.py` (app `crossmath-pilot-74p1`,
pilot-73 clone — textually identical image recipe, warm layers shared with the
gprobe/pilot-73 lineage; FULL error output, the fix-loop requirement). Fired via
`stage_and_fire.sh` with the sha guard: staged shas recorded BEFORE each fire
(2a11b1ed → 4b3b22e9 → a5a6d0cd → 8f05abd9 → 6ddbda11), never edited between record and
fire. doz CLI, SPEC cpu=2.0/mem=4096, LEAN_NUM_THREADS=2, telemetry every run
(walls 267/144/466/52/30 s; OVER flags mem-class only — mmapped-olean accounting,
anon=0 throughout; no escalation requested or needed). One code-side elaboration-budget
change: `maxHeartbeats` 2M → 8M (in-file option) to clear `pair_tail_bound`'s whnf
blowups — recorded in the log header; SPEC resources unchanged (guideline 3:
investigate-not-upgrade — the investigation outcome is in the log).

**The completion's mechanical classes (all foreseen by the 2026-11-17 taxonomy, below):
the record's 8-class list was confirmed almost verbatim — notably class 7 (`lt_of_not_le`
absent → `not_le.mp`) and class 1/2 (Finset min'/Real sInf arities) — plus the
projection-notation gap family (`.le`/`.symm` dotted forms unresolvable at this pin:
`LT.lt.le` absent → `le_of_lt`; `Finset.sum_mul.symm` parses as one qualified name → rw
forms), `Finset.sum_mul`'s direction, `le_add_of_nonneg_left/right` swapped, and
`Real.exp_log` taking the positivity proof. Full list in the log header.**

---

## Frozen history — the 2026-11-17 stop (NOT-GREEN at the original 6-run budget)

**Verdict (one line):** 74-P1 **NOT-GREEN at budget** — six runs (initial + 5
fix-retries, the charter ceiling), error descent 62→60→57→50→46→46, rc=1 throughout,
**zero sorry at every run** (no forced gaps; the artifact never left the
proof-artifact discipline). The stop is per the abort rule; the residue is
mechanical, not mathematical. Evidence: `logs/p1-runs1-6-combined.log` (descent
ledger + per-run verdicts/telemetry/URLs; the run-6 entry discloses a process error
of mine — the final fix batch aborted on a script assert BEFORE writing and I fired
without verifying, so run 6 elaborated a file byte-identical to run 5; owned here,
not a Lean finding).

**Artifact (at the stop):** `P1.lean` (sha256(16) `170520aa2fd5509d`) — the four FINDS are real
mathematics and stand regardless of elaboration state:
- **FIND #1 (refutation):** the dossier's T1(a) per-spectrum floor
  √((1−ε)/ε·Var) ≤ W_ε is FALSE — counterexample verified numerically (p₀ = 1−δ, n
  atoms at δ/n: Var ≈ 3.36, W_{0.01} ≈ 0.184, claimed floor ≈ 18.2). The honest
  per-spectrum statement is the marking bound T1a′: Var ≤ (1−ε)W² + ε·Mdev². **This
  refutation is itself a dossier-74 deliverable** (the [HYPOTHESIS] tag earned its
  keep); the class-level √-floor survives only at shape (i) = P2.
- **FIND #2:** the transcribed hMGF ("log m_u ≤ uS + σ²u², ∀|u| ≤ δ") is degenerate
  at u < 0 (needs 2|u|S ≤ σ²u² near 0 — fails whenever S > 0); the faithful
  MarginalTails reading is the CENTERED form ∑ p·e^{u(K−S)} ≤ e^{v·u²}.
- **FIND #3:** the dossier's exact constants (2σ², 1024 = 2·512) need the limit
  argument (log g(u)/u² → Var/2); the elementary window-edge constants are
  Var ≤ 8(e^{v·u₀²}−1)/u₀² and W ≤ (log(2/ε)+v·u₀²)/u₀ — Θ-shapes confirmed.
- **FIND #4:** T4's per-spectrum o(√B) negation is refuted at shape (ii) by the FIND
  #1 family (Var ≥ κB realizable with W = o(√B) along subfamilies) — the tightness
  statement is inherently class-level = shape (i) = P2, consistent with the Q1 ruling.

**Remaining-error taxonomy at the stop (the resume map; ~8 classes, all API-signature
drift vs mathlib v4.36.0-rc2 — each CONFIRMED by the completion, see above):**
1. `Finset.le_max'` / `Finset.le_min'` / `Finset.min'_mem` arities.
2. `Real.sInf` API (`Real.le_sInf` carries a ≤0 side condition; `Real.sInf_nonneg`
   is the right form).
3. `Finset.sum_add_sum_compl` arg order.
4. `Finset.sum_subset` subset arg application.
5. Ring-grouping syntactic discipline for `rw`.
6. `Finset.sum_filter_add_sum_filter_not` arg order + summands.
7. `by_cases` negative branch `¬(0 ≤ x)` → `not_le.mp` (not `lt_of_not_le` — unknown
   at this pin).
8. Heartbeat blowups in the two heaviest proofs (resolved code-side: 8M in-file cap).

**Decomposition state (core-prep §1):** all of P1-a..P1-e are now GREEN (above).
**T3 unchartered** (unchanged); **Q1 ruling recorded** in the artifact header (shape
(ii) governs; class-indexed Bk = P2).

— lane A8, 2026-11-17 (stop) / 2026-11-18 (completion GREEN). H commits; A1 folds the
§10 row. Related: `74-P0-record.md` (P0 GREEN, runs 1–2, 2026-11-17);
`research/candidates/74-surprisal-moment-hierarchy-ceilings.md` §Iteration-4 amendment.
