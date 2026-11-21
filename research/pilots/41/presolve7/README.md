# presolve7 — the iter-7 constraint-propagation pre-solve (PRE-STUB skeleton; NO data yet)

**STATUS: PRE-STUB** (lane R4, 2026-11-21; landed-for-scaffolding-only). This
directory is the output-interface skeleton for the pre-solve unit chartered at
`../H4-presolve-charter.md` (`cda679eca1d7fd76`, landed `b19b3ee`, ABSORBED
into the iter-7 bench by ruling). Nothing here has run; every count table
carries `[PENDING]`; the generator/checker files are docstring contracts with
ZERO code bodies. The iter-7 unit starts at code, not scaffolding — this file
is the shape that code fills.

Authority chain: the charter §1 (three tiers, bands, propagation designs) →
§2 (method options; the custody-archive pattern primary) → §3 (this README's
billing contract) → §4 (price/stop-loss). Billing discipline: R2's gate
`qa/iter4-review/r2-41h4-s1s4-gate.md` S4(i)–(vi) bind everything downstream;
the 41H §N3 / 2026-11-20 BANK ruling classes all outputs CERTIFIED-NUMERIC,
never kernel, never in proved counts.

## What will be here (when the unit runs)

- `generator.py` — the propagation engine(s): tier A (semigroup κ-CSP), tier B
  (bounded structure-constant bands), tier C (spin-host combination: T_spin
  recompute + per-f Gram/rank filter + sequential row-solve, sector-aligned
  variants first). numpy-only, deterministic, no network, no Modal. Contract:
  its docstring header (zero body at stub time).
- `checker.py` — the INDEPENDENT re-verification pass (survivor re-checks,
  control re-runs, count reconciliation). Contract: its docstring header.
- `outputs/` — per-tier/band/fiber artifacts: survivor lists (expected empty),
  count tables (`scan_results.json`-class), the run log, the T_spin constants
  (tier C), the partition/propagation traces (tier A).
- This README — filled with the tables below.

## Count tables (the per-tier/band/fiber interface — ALL `[PENDING]`)

### Tier A — semigroup (`SemigroupEvaluationTable`; finite-domain, class-closed if 0)

| fiber | partitions tried | pruned at AC | survivors | wall | `[PENDING]` |
|---|---|---|---|---|---|
| M₋ (q = −1) | — | — | — | — | `[PENDING]` |
| M₊ (q = +1) | — | — | — | — | `[PENDING]` |

Billing slot (fill verbatim at run): `[PENDING — if 0: "no semigroup-algebra
evaluation table for either certified fiber" (class-closed, no band qualifier);
if >0: SURVIVOR LIST = E2-positive certificate data → fresh kernel-fire grant
request, NEVER a kernel claim here]`.

### Tier B — d = 8 structure constants (`StructureConstantDictionary`; band-scoped)

| band (B_N, B_f) | fiber | f-vectors tried | rank/assoc-pruned | survivors | wall | `[PENDING]` |
|---|---|---|---|---|---|---|
| (1,1) | M₋ / M₊ | — | — | — | — | `[PENDING]` |
| (1,2) | M₋ / M₊ | — | — | — | — | `[PENDING]` |
| (2,1) | M₋ / M₊ | — | — | — | — | `[PENDING]` |
| (2,2) | M₋ / M₊ | — | — | — | — | `[PENDING]` |

Billing slot: `[PENDING — negatives carry the band qualifier VERBATIM ("no
d = 8 structure-constant dictionary with |N| ≤ B_N, |f| ≤ B_f"); never "no
d = 8 host"]`.

### Tier C — spin-host combination (F's open core; sector-aligned first)

| variant | fiber | f's passing rank-filter | row-solve nodes | survivors | wall | `[PENDING]` |
|---|---|---|---|---|---|---|
| sector-aligned, \|f\| ≤ 1 | M₋ / M₊ | — | — | — | — | `[PENDING]` |
| sector-aligned, \|f\| ≤ 2 | M₋ / M₊ | — | — | — | — | `[PENDING]` |
| unstructured, \|W\| ≤ 1, \|f\| ≤ 1 | M₋ / M₊ | — | — | — | — | `[PENDING]` |
| unstructured, \|W\| ≤ 2, \|f\| ≤ 2 | M₋ / M₊ | — | — | — | — | `[PENDING]` |

Billing slot: `[PENDING — a survivor (T_spin, W, f) = the F-positive certificate
DATA → the dictionary_of_combination_data pullback fire (≤3-run class); the
negative is spin-host-scoped (no-injectivity caveat) + band-scoped]`.

## Controls section (the planted/far protocol — `[PENDING]` until run)

1. **Planted dictionary solutions:** synthetic (κ,f) / (N,f) / (W,f) pairs,
   planted per tier, MUST be detected (the archive's ~1e-13-class residual
   discipline where float paths are used; exact-integer match where integer).
   Count planted / count detected: `[PENDING]`.
2. **Far tables:** random ±1 tables and both certified targets MUST be
   rejected/handled per design; far-table distances recorded: `[PENDING]`.
3. **Determinism:** fixed seed (record the value here at run:
   `[PENDING — the archive precedent used 20261121]`); two runs byte-identical:
   `[PENDING]`.
4. **Generator/checker reconciliation:** every survivor list and every load
   bearing count re-verified by `checker.py` independently; discrepancies ⇒ the
   run does not land: `[PENDING]`.

## Solver-assisted runs (the re-verification gate — fill only if used)

`[PENDING — DEFAULT: none; option (a) only. If a SAT/CP accelerator was used
for any tier: solver + version pinned here, the deterministic checker
re-verification recorded here, and UNSAT claims independently re-verified
(encodings/bounded re-run) here — per charter §2(b). Until then this section
stays empty.]`

## Stop-loss ledger (charter §4; fill per band)

| band/variant | stop-loss state | partial counts | shrink plan |
|---|---|---|---|
| — | `[PENDING — expected: none triggered; any band > ~4 h local parks here with counts + the named shrink plan]` | — | — |

## Re-run (fill exact commands at run)

```
[PENDING — e.g. python3 generator.py --tier A|B|C --band … ; python3 checker.py --all]
```

## Billing status (fixed vocabulary; slots only)

All outputs: **CERTIFIED-NUMERIC** (machinery-validated computation, never
kernel theorem, never in proved counts). Negative rows feed E2-negative
billing (NEGATIVE-kind quota-free; R2's class-reading condition — the negative
must terminate/extend the tier, not restate folklore); survivor lists feed the
F/E2-positive kernel-fire request (DISCOVERY route, quota-free per R2's
reconciliation). Wording locks verbatim: host-scoped negatives only — never
"no TL₄ dictionary"; band qualifiers ride every tier-B/C negative; the δ = ±2
scoping on transfer sentences. E1's billing lock (rung/note, never standalone)
is unaffected by anything here.

— pre-stub by lane R4 (worktree agent-08), 2026-11-21. H lands the skeleton;
the iter-7 unit fills it.
