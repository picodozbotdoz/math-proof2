# Pilot zzv2-lam η-port R8 — the two-arm assembly + threshold-corrected improvement (iter-7 day-1 park record)

Lane R8 (worktree agent-05), 2026-11-21. Grant: D2′(c) R8 rung, 1 fire + 1 axcheck
run, record-billed per DECISION-2 = Option A (ENGINEERING deliverable, quota-free;
informal mathematics Lamzouri's — arXiv:2609.02882; Montgomery ICF 1974;
Baluyot–Goldston–Suriajaya–Turnerbaugh 2024 Lemma 5 — must-cite in full wherever
referenced; never article-phrased).

## 1. What was built (the rung's shape, adapted to the async-lane reality)

- **eta-r8.lean** `db559058419a2dba` (NEW) — the FIRST eta-family module composed by
  IMPORT instead of self-containment: `import ZZLamP1` (P1.lean `a9a6555c`, namespace
  ZZLam) + `import EtaR3` (eta-r3.lean `21fb0c4e`, namespace ZZLam.EtaPort), both at
  their VERIFIED states, chain-compiled to .olean inside the built ZetaZerosV2 tree
  (the pilot-11/n2p4v2 pattern; namespaces disjoint — lemma A and the corrected
  covariance REUSED, not duplicated; validated GREEN this run: chain 2/2 OK with the
  in-file gates re-fired triad).
- **R8-1 `exists_KSAsymptotic_of_pos_of_scaledBridge`** — the two-arm full-domain
  assembly (`stmt_exists_KSAsymptotic_of_pos`, the P1 HARD-STOP ask): arm 1 (λ ≥ 1/2)
  = P1's `exists_KSAsymptotic_of_half_le` unchanged; arm 2 (λ ∈ (0, 1/2]) = the port
  kernel `cutoffTestLam lam psi` at the donor's `exists_isCutoff` witness (δ = 1/8),
  assembled exactly at the probe's `discharge_of_scaledBridge` shape.
  **BRIDGE-CONDITIONAL FORM (honest, forced by the async sequencing):** R8's arm 2
  consumes the R7 port bridge (`stmt_scaledBridge`) — agent-04's separately-granted
  rung, NOT yet fired at this unit's execution — so both port inputs ride as explicit
  ∀-form binders: `hAdm` (= eta-r2's GREEN `cutoffTestLam_isAdmissible`, standalone-
  unimportable per the self-containment convention) and `hB` (= R7's bridge). When R7
  lands, ONE application discharges `hB`; `hAdm` closes at the unified substrate.
- **R8-2 `scaledConstLam_lt_of_threshold`** — `stmt_scaled_const_improves` in its
  THRESHOLD-CORRECTED form: the probe skeleton's bare positivity binder `Q(0) < c₀`
  does NOT imply `scaledConstLam < c₀` on all of (0, 1/2) — from r3's corrected
  covariance `pairMainTerm Q_λ = ρ·c₀ + (ρ⁻¹ − ρ)·Q(0)` (ρ = 2λ), improvement holds
  iff `Q(0)·(1+ρ) < ρ·c₀` (counterexample class: Q(0) = 0.9·c₀, ρ = 0.1 ⇒
  scaledConstLam ≈ 9·c₀). The corrected statement carries the exact multiplicative
  threshold antecedent `Q(0) < (ρ/(1+ρ))·c₀`; the wrap's prose "ρ ∈ (Q(0)/c₀, 1]"
  maps to `ρ > Q(0)/(c₀ − Q(0))` — the same window. **This statement-tier correction
  is the rung's own FINDING-class content (recorded; it supersedes the probe skeleton
  for any future consumer).**

## 2. The fire (`logs/eta-r8-run1.log` `2e76732b6cfe3ae7`): NOT-GREEN at the cap ⇒ honest-park D7

Build OK at mathlib `ff2494ea` exact; chain ZZLamP1 OK + EtaR3 OK (the import
mechanism GREEN, gates re-fired triad); consumer **FAIL rc=1 errors=4 sorry=0,
BOTH new theorems carrying error-recovery sorryAx**. Telemetry: wall 671 s, OVER=9
samples all in the lake-build phase (the authorized m4b2/G2 class; mem ≤ 3.1 GB
IN-SPEC, anon=0; consumer IN-SPEC).

**Residual class (2 mechanical roots, named verbatim by the run's errors; ZERO math
defects — r3's covariance rw elaborated and the goal display shows the corrected
closed form):**
1. `:94:9 unknown identifier le_or_lt` — the pin's case-split lemma name (use
   `lt_or_ge lam (1/2)` with arms swapped, or `le_or_gt`); the cascade killed both
   arms of R8-1.
2. `:131:8` the threshold-algebra block: `rw [div_lt_iff₀ …] at hQ0` does not match
   `a < (ρ/(1+ρ))·b` (divisor a right-factor, not top-level) — the correct move is
   `mul_lt_mul_of_pos_right hQ0 (0 < 1+ρ)` then `div_mul`-cleanup; `:134` linarith
   was pure cascade.

**Priced continuation (one fresh grant):** 1 fix round (both fixes pre-named above —
the arc's own friction classes) + the 1 axcheck run (NOT SPENT this unit: the exit
criterion requires the headline proved; an axcheck over a sorryAx artifact verifies
nothing — its coverage value partially delivered by the fire's own in-file triad
gates: ScaledBridge, exists_KSAsymptotic_of_half_le, KSAsymptotic_mono,
pairMainTerm_cutoffSelfConvLam, scaledConstLam_half, exists_isCutoff).

## 3. State at park

- The R8 rung is one fix round from GREEN, with the file's architecture validated
  (chain composition GREEN; ScaledBridge def triad; both theorem STATEMENTS elaborate
  — the errors are inside tactic blocks, not statements).
- The unconditional `stmt_exists_KSAsymptotic_of_pos` additionally awaits R7
  (agent-04) — the bridge binder `hB` is R7's exact output statement; the park record
  recommends the orchestrator sequence the R8 fix round AFTER (or with) R7's fire so
  the unconditional corollary lands in the same unit.
- The threshold-corrected improvement statement (R8-2) stands on its own evidence:
  r3's covariance is triad-verified and re-printed; only the terminal algebra tactic
  is owed.

— lane R8 (worktree agent-05), 2026-11-21. No commits (H commits). Fire spent 1 of
the 1 granted; axcheck unspent by design.
