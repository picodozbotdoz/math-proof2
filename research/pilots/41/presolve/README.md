# 41H3 pre-solve — archived generator + checker (custody settlement, 2026-11-21)

This directory settles the custody gap recorded for the M-tranche pre-solve
(`../H3-M-candidates.md`, 2026-11-20, whose session scripts were "ephemeral by
design"): the scan's generator and checker now EXIST as persisted, re-runnable
code, and the scan of record has been re-executed with per-fiber counts. The
2026-11-21 orchestrator decision chose settlement option (a) — archive — over
downgrading the `CERTIFIED-NUMERIC` billing.

## What is here

- `h3_presolve_archive.py` — the generator + scanner, rebuilt from the record
  note's formulas only (tauceti `MarkovTrace.lean` :91/:99/:153/:300 cup/cap/
  generator/rep formulas; `Core.lean:106–121` φQ/τ; the record note §1 class
  definitions; precharter P5's `tr(K·W_p·W_p′) = m(p,p′)` realization). numpy-only,
  deterministic (seed 20261121), no network, no Modal.
- `outputs/` — the archive produced by the re-run of record:
  - `host_generators_qspin±1.txt` — the exact-integer 16×16 generator matrices
    at both fibers;
  - `target_tables.txt` — the two closed-fiber targets (M₊ = eth's σ =
    (−1)^{φQ+τ}; M₋ = (−1)^{φQ});
  - `word_census` figures and scan results in `scan_results.json` (+ `run_log.txt`
    console transcript);
  - per-fiber system counts for all three classes (the split the record note
    did not state), with an explicit reconciliation against the record note's
    combined counts.

## Verification chain (self-checks inside the run)

1. **S1 reproduction:** the L ≤ 3 / L ≤ 4 word-image census comes out at
   24 distinct images spanning 13 dims, and 37 spanning 14 — exactly the record
   note's S1 numbers (the faithfulness datum).
2. **C1 consistency:** both target tables are nonsingular with |det| = 8⁴ = 4096
   (exact rational determinant).
3. **Planted-solution controls:** 20 random integer-K plants per fiber detected at
   residual ~10⁻¹³ (2-norm of the left-null projection — the metric reproduces the
   record note's ~7.1 for far tables: a random ±1 table sits at ‖t‖·√(null/64)).
4. **The negative:** 0 survivors in every class at both fibers; the target's
   minimum distance to any scanned monomial subspace is recorded per class.

## Re-run

```
python3 h3_presolve_archive.py            # full (~10–15 min, 4 cores)
python3 h3_presolve_archive.py --quick    # reduced random sweep, smoke test
```

The scanner's assignment handling is the record's "gather-batch" solver: for a
fixed 8-word subset the 64 equation rows vec₇₀(W_a·W_b) are assignment-independent,
so the 40320 transports of the target are batch-tested against the left-null
basis of the 64×70 system in one matmul per subset chunk.

## Billing status

The pre-solve remains `CERTIFIED-NUMERIC` (machinery-validated computation,
never kernel theorem, never in proved counts — the 2026-11-20 ruling's class).
What changed with this archive: the custody rider "no archived scripts" is
DISCHARGED — the certificate artifact is now the persisted generator/checker +
outputs (this directory), not only the record note's formulas. The separate
H3.lean print-coverage rider (16 unprinted helpers at the next H3.lean edit)
is unaffected and remains binding.
