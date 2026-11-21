"""presolve7 checker — CONTRACT ONLY (pre-stub; ZERO code body, NO data, never run).

The INDEPENDENT re-verification pass for the iter-7 H4 pre-solve (charter §2-§3;
the custody-settlement generator/checker split — this file must NOT share
solver code paths with generator.py beyond the shared formula definitions it
re-derives itself).

DUTIES (all mandatory before any output lands):
  1. SURVIVOR RE-CHECK: every survivor the generator reports is re-verified
     from scratch (equations re-evaluated exactly, integers only) — a survivor
     that fails re-check voids the run.
  2. CONTROL RE-RUN: the planted-solution controls and far-table rejections
     re-executed; detection rates must reconcile with the generator's.
  3. COUNT RECONCILIATION: the per-tier/band/fiber counts re-derived from the
     artifacts (JSON/trace files) and cross-checked against the run log;
     discrepancies void the run (the archive precedent's row-shortfall
     reconciliation is the model — differences get DIAGNOSED, not silently
     patched).
  4. DETERMINISM CHECK: re-run byte-identity (or the recorded divergence
     diagnosed) per the seed rule.

RE-VERIFICATION GATE (if any solver-assisted tier ran): this checker is the
deterministic authority — solver UNSAT/survivor claims enter NO record until
re-verified here; UNSAT claims additionally need an independent encoding or
bounded re-run (charter §2(b)). The gate result is recorded in the README's
solver-assisted section.

DETERMINISM / SEED RULE: same as the generator (fixed seed recorded in the
README; sorted enumerations; byte-identical re-runs; no network/Modal).

CLASS: CERTIFIED-NUMERIC machinery (never kernel, never in proved counts).
This stub contains no code by design.
"""
