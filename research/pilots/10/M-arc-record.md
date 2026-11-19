# M-arc record — pilot-10 `exists_tm_padded_space` (the machine-layer headline assembly, under the hv amendment)

**Verdict: GREEN at run 2, 2026-11-19** (iteration-5 charter rung 4; orchestrator
rulings 2026-11-19: DAY-1-CLASS + hv SUPPLIED-AS-BINDER + the D-charter/M-arc
separation — the M-arc is NOT a D-tranche extension; plumbing/completion-value
billing, never novelty). `M-arc.lean` OK — rc=0, 0 errors, 0 sorry-warnings — on the
second of the ≤3-run budget (run 1 = the budgeted mechanical fix-loop class). 
Evidence: `research/pilots/10/logs/marc-run1.log` (provenance header + both raw
runs; GREEN run wall=65 s warm, telemetry OVER=1 soft = the mmapped-mathlib-olean
class per AGENTS.md §Modal(5); max_cpu=0.96 within SPEC). File:
`research/pilots/10/M-arc.lean` (sha `7addcf00…`, 4,327 LoC = 28-line M-arc header +
**L5.lean verbatim** (4,248 lines, sha `da398f21…`, D3 GREEN) + **Part M, 51 lines**).

## The hv amendment, quoted verbatim (D3-record.md:31–37 — the implementing ruling)

> - **D4 readiness (the headline `exists_tm_padded_space`): all D4 inputs now exist** —
>   `padM'_isPolyT` + `padM'_state_poly` (under the amendment-bound value-poly binder) +
>   `padM'_runs` (D1) + `padded_time_absorb` (this landing) + M1's `exists_tm_space`
>   (substrate) + the `PB.bound_le` absorption ending (the `exists_tm_space_monitor`
>   pattern, GREEN in substrate). D4 remains UNCHARTERED (the M-arc scope decision is
>   the charter owner's; per the amended spec, D4's assembly must supply the
>   value-polynomiality binder `hv` for `padM'_state_poly` or derive it Solver-side).

Implemented as **SUPPLIED-AS-BINDER** per the orchestrator ruling relayed mid-unit
(2026-11-19): `hv : ∃ k : ℕ, ∀ x : List Bool, e x ≤ (x.length + 2) ^ k` enters
`exists_tm_padded_space` as an explicit hypothesis binder (the EnclOK/hypothesis-binder
precedent; D1-record.md:42–45's adjudicated two-true-forms amendment — the binder form
is the true form). **Solver-side derivation NOT attempted; no one-line defeq/instance
derivation was found** (nothing in the substrate relates `PolyT e` to value-poly growth
— the D1 spec correction is exactly that no such relation holds) — no descope note.

## What landed (Part M, namespace `Groundwork.PadC`)

| decl | content | axioms |
|---|---|---|
| `exists_tm_padded_space` | eth `exists_tm_padded` statement shape (Pad.lean:116–120): under `he : PolyT e`, `hA' : PolyT A'`, `hv` (the binder), there are `N : TM2ComputableAux Bool Bool` with finite alphabets and `q : ℕ` such that on every `x` the machine halts with `A' (x, 2 ^ e x)` within `q·(|x| + 2^(e x) + 1)^q` steps AND every step holds at most `q·(|x| + 1)^q` stack symbols together — polynomial space in |x| alone, whatever `2^(e x)` is | `[propext, Classical.choice, Quot.sound]` |

Assembly (every step GREEN precedent, per D3-record.md:31–37): `d` from
`padM'_state_poly e hv` (D1); `haveI := padM'_isPolyT e A' he hA'` (D2) opens
`exists_tm_space (padM' e A') d` (M1/L3); instantiate `T := e x + 1`, `S := 2|x| + e x + 4`
via `padM'_runs` (D1); **time half** = `padded_time_absorb c |x| (e x)` (D3) landing
eth's own final constant `q := c·4^(c+1) + (c+1)` (Pad.lean:123) — the `EvalsToInTime`
weakening via `⟨ev.toEvalsTo, ev.steps_le_m.trans …⟩` (the monitor pattern); **space
half** = `PB.bound_le hcq hcq` absorption (the `exists_tm_space_monitor` ending
pattern), `hcq : c ≤ q` by omega. New content = header + Part M ≈ 79 LoC — under the
charter's ~120-LoC class (D1–D3 banked everything; the assembly itself is 15 proof
lines).

## Descent (run 1 FAIL → fix → run 2 GREEN; 2 of ≤3 runs)

Run 1 failed with **2 errors, both MECHANICAL namespace misses** (no math content):
`TM2ComputableAux`/`TM2OutputsInTime` unknown inside `Groundwork.PadC` — Part M had
omitted the `open TM Turing` that L5's `exists_tm_space` block carries (autoImplicit
turned the unknowns into mystery binders). Fix = one line (`open TM Turing` in Part M),
applied, run 2 GREEN. This is the fix-loop class the charter budgets (the
aeval-friction/41-P0 precedent). One style-linter warning stands at :4310
(`haveI` vs `have` — `haveI` is the instance-registration idiom for the `IsPolyT`
local instance; the linter prefers `have` because the type is a Prop; harmless,
proof kernel-clean — swap at any future fold, never worth a run).

## Tranche/M-arc state after this landing

- D1 GREEN (L3), D2 FINAL GREEN (L4), D3 GREEN (L5) — unchanged.
- **M-arc GREEN (this record): the dossier-10 machine layer is CLOSED at the headline**
  (`exists_tm_padded_space` kernel-verified triad-clean; the space-annotated
  polynomial-space counter-machine assembly, eth's padded bound with the pad never
  materialized).
- D5/D6 remain unchartered (the wd↔cw relabeling walk / downstream consumers per
  `next-tranche-spec.md`; not part of the M-arc ruling). The spec's optional stretch
  corollary `decidesTM_of_padded_space` (mirroring Pad.lean:134–148) was NOT attempted
  (marked "NOT required" in the spec's own D4 skeleton).

## Files (H commits post-K, per the hold-all-commits ruling; A1 folds the §10 row)

`research/pilots/10/M-arc.lean` (new; sha `7addcf00…`), `logs/marc-run1.log` (new;
sha `43c95474…`), this record (new). L5/L4/L3/D-records unchanged from their GREEN
states.

## Next pointer

None chartered behind this rung (the M-arc was the D4-inputs' only consumer named in
the iter-5 charter's rung 4). Natural follow-ons, all UNCHARTERED: the D5 wd↔cw
relabeling walk; the optional `decidesTM_of_padded_space` stretch corollary; a
10-blueprint §M4 line update (charter owner).

— lane R3 (A6 lineage, worktree agent-07), 2026-11-19.
