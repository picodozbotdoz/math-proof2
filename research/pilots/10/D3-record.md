# D3 record — pilot-10 time absorption (`pad_bound` + `padded_time_absorb`)

**Verdict: GREEN FIRST RUN, 2026-11-17** (charter ruling: D2 final closure + D3 GO;
plumbing/completion-value billing, never novelty). `L5.lean` OK — rc=0, 0 errors,
0 sorry-warnings — on the FIRST of its ≤4-run budget (1/4 used). Evidence:
`research/pilots/10/logs/d3-run1.log` (provenance header; warm wall=65 s, telemetry
OVER=1 soft = the mmapped-olean class). File: `research/pilots/10/L5.lean`
(sha `da398f21…`, 4,248 LoC = 16-line D3 header + **L4.lean verbatim** (4,195 lines,
sha `4ae0d643…`, the D2-FINAL-GREEN artifact) + Part H, 37 lines).

## What landed (Part H, namespace `Groundwork.PadC`)

| decl | content | axioms |
|---|---|---|
| `pad_bound` | eth Pad.lean:98–109 VERBATIM: `q·(e+1+1)·(l + (2l + 2·2^e + 3) + 1)^q ≤ (q·4^(q+1) + (q+1))·(l + 2^e + 1)^(q·4^(q+1) + (q+1))` — the host bound for the padding machine is a polynomial in `l + 2^e + 1` | `[propext, Classical.choice, Quot.sound]` |
| `padded_time_absorb` | the spec's §2 D3: our middle factor `(l+1)^c` is SMALLER than `pad_bound`'s, so `pad_bound` applies directly — the counter machine's host time absorbs into eth's padded shape with eth's own final constant `q := c·4^(c+1) + (c+1)` | `[propext, Classical.choice, Quot.sound]` |

One pin-adjustment (recorded): eth's `Nat.pow_le_pow_right` exponent-mono call →
`pow_le_pow_right'` (the pin's Unbundled name; the Part-E-precedent form). Everything
else verbatim — consistent with the port-probe corpus finding and the whole D-tranche
experience (≈0 churn modulo named pin-adjustments).

## D-tranche state after this landing

- D1 GREEN (L3, `padM'`/`padM'_runs`/state-poly, D1-record.md).
- D2 FINAL GREEN (L4, `padM'_isPolyT` triad — the full Closure subset: Carried bill,
  structural fragments, `PolyT` trio + `@[fun_prop]`, Closure/Basic + Cases (incl. the
  listCases gadgets) + the numeric layer (Bool/List1/Fold/List1b/Nat1/Nat1b/Nat2);
  D2-record.md FINAL).
- D3 GREEN (this record).
- **D4 readiness (the headline `exists_tm_padded_space`): all D4 inputs now exist** —
  `padM'_isPolyT` + `padM'_state_poly` (under the amendment-bound value-poly binder) +
  `padM'_runs` (D1) + `padded_time_absorb` (this landing) + M1's `exists_tm_space`
  (substrate) + the `PB.bound_le` absorption ending (the `exists_tm_space_monitor`
  pattern, GREEN in substrate). D4 remains UNCHARTERED (the M-arc scope decision is
  the charter owner's; per the amended spec, D4's assembly must supply the
  value-polynomiality binder `hv` for `padM'_state_poly` or derive it Solver-side).

## Files (H commits; A1 folds the §10 row from this record)

`research/pilots/10/L5.lean`, `logs/d3-run1.log`, this record (new); L4/D2 files
unchanged from the D2-final state.

— lane A6, 2026-11-17.
