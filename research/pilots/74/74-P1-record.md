# 74-P1 record — STOP at fix-loop budget, NOT-GREEN (lane A8, 2026-11-17)

**Verdict (one line):** 74-P1 **NOT-GREEN at budget** — six runs (initial + 5
fix-retries, the charter ceiling), error descent 62→60→57→50→46→46, rc=1 throughout,
**zero sorry at every run** (no forced gaps; the artifact never left the
proof-artifact discipline). The stop is per the abort rule; the residue is
mechanical, not mathematical. Evidence: `logs/p1-runs1-6-combined.log` (descent
ledger + per-run verdicts/telemetry/URLs; the run-6 entry discloses a process error
of mine — the final fix batch aborted on a script assert BEFORE writing and I fired
without verifying, so run 6 elaborated a file byte-identical to run 5; owned here,
not a Lean finding).

**Artifact:** `P1.lean` (sha256(16) `170520aa2fd5509d`) — the four FINDS are real
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

**Remaining-error taxonomy (the resume map; ~8 classes, all API-signature drift vs
mathlib v4.36.0-rc2, each with the leading fix hypothesis):**
1. `Finset.le_max'` / `Finset.le_min'` / `Finset.min'_mem` arities — three runs'
   diagnostics triangulate to the `(s, a, m ∈ s)` shape (nonempty implicit); my last
   (unwritten) batch had `le_max' _ _ hmem`.
2. `Real.sInf` API — `Real.sInf_le`/`Real.le_sInf`/`Set.mem_lowerBounds` were
   "unknown" ONLY in the parse-cascade (runs 1–3); restored in the final batch
   (`Real.le_sInf (wset_nonempty …) (Set.mem_lowerBounds.mpr …)`); the isGLB-field
   projections were the wrong route.
3. `Finset.sum_add_sum_compl` arg order `(s, t, f)` (not `(f, s, t)`).
4. `Finset.sum_subset` subset arg must be APPLIED (`Finset.subset_univ (supp p)`,
   not the ∀-form).
5. Ring-grouping discipline: `4 * (p i * e)` vs `(4 * p i) * e` are syntactically
   distinct for `rw` — uniform grouping through hE/hDist/hInner (fixed in the final
   batch for one of two occurrences — the assert that aborted it).
6. `Finset.sum_filter_add_sum_filter_not` arg order `(s, p, f)` + summands swapped
   vs my statement (fixed via `linarith [h]`).
7. `by_cases` negative branch gives `¬(0 ≤ x)` — needs `not_le.mp` (or push_neg),
   not `lt_of_not_le` (unknown at this pin).
8. Heartbeat blowups (2M) in the two heaviest proofs once cascades stack —
   precompute the final algebra chains (also in the aborted batch) instead of bare
   `nlinarith`.
Root cause, honestly stated: authoring ~600 LoC of real-analysis Lean against a pin
I cannot elaborate locally — the probe route is batch-only (no interactive
error-fix loop), so each signature guess costs a full run. The math itself is
verified by the analysis above; the remaining distance is mechanical.

**Decomposition state (core-prep §1):** P1-a (marking floor) — proof designed, not
elaborated; P1-b (subG var + window) — pair-bound lemmas designed (explicit
constants), not elaborated; P1-c — instantiation designed (window match
1/(2·16√((1+θ)B)) = δ exact; constants 8192(e^{e/2}−1)(1+θ)B etc.); P1-d (cert_pad +
Bk monotonicity) — written, not elaborated; P1-e (t4 assembly) — written as the
honest floor+ceiling pair.

**T3 unchartered** (unchanged); **Q1 ruling recorded** in the artifact header (shape
(ii) governs; class-indexed Bk = P2).

**Recommendation to the orchestrator:** re-charter P1 with a fresh ≤5 budget AND one
of (a) a local `lake env lean` loop (the encore checkout + a stage dir — the
substrate for it exists on this machine), or (b) two-batch remote discipline
(fix-batch → verify-script-applied → fire). Expected distance to GREEN: the 8
classes above, all one-line-to-ten-line fixes; I estimate 2–3 interactive-loop
iterations. The FINDS and the P0 statement layer are unaffected and stand as
landed record (74-P0 GREEN, `74-P0-record.md`).

— lane A8, 2026-11-17. H commits; A1 folds. Related: `T2a-P0-record.md` (the
taskset finding's origin is A3's P1, acknowledged in the revised
`runner-fixes-wave2.patch` header).
