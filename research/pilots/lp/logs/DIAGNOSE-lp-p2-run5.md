# DIAGNOSE — LP-P2 stop at card run-limit (5 of 3–5), 2026-11-16, lane A2

Guard trip: run budget (not LoC — L2 124 ≤ 0.7k). Per §9c overrun rule: stop,
diagnose, report; single continuation run requested (deterministic one-liner).

State: L1 GREEN (regressed OK in every P2 run). P0 GREEN (re-frozen, 3 stubs per
R3's count — grid_ceiling_of_dual is an application, no stub of its own; Step-A
incremental baseline for lp = +3 tokens, sorries at the three layer/consumer sites).
L2: ONE error site remains (hAx finish, :97).

Diagnosis (run-5): `BWCert.valid`'s body parses LEFT-associated
(`(c₀ + ∑₁) + ∑₂ ≤ p₁`); `sum_uGG`'s RHS is explicitly RIGHT-associated
(`c₀ + (∑₁ + ∑₂)`); `+`-associativity is not defeq and linarith did not normalize
the grouping between goal and the ascription-unfolded hypothesis (its failure
context shows the two identical printed forms — different ASTs).

Staged fix (NOT run — card exhausted):
  in hAx, replace the final `linarith [(hvalid δ : …)]` with:
    rw [← add_assoc]
    exact hvalid δ
(← add_assoc rewrites the goal's `a + (b + c)` to valid's `(a + b) + c`; exact then
closes by rfl-defeq — the same defeq `exact` that already worked for the inr-cases.)

Descent record (distinct error classes per run): 1 import-resolution → 2
(sum_uGG-rw + Fintype-stuck) → 2 assoc/mul finishes → 1 linarith-visibility →
1 linarith-grouping. Strictly monotone; every fix round had a written hypothesis
(R8 stop-rule satisfied — no two consecutive hypothesis-less failures).

Machinery deltas this card (recorded in-run): run_pilot.py error classifier widened
to `error(<code>)` forms (R8-d2); dependency-order olean emission added (the
axcheck_full pattern) — sibling imports now resolve for this pilot family.
