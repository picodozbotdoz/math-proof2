# Pilot 77 follow-up unit — findings + dossier amendment draft (for H; lane R7, 2026-11-19)

The follow-up unit (T1-completion + T2 as ONE pilot, iter-5 charter rung 5) landed
**BOTH GREEN** (T1 run 11, T2 run 12; full detail in `T1-record.md` §FOLLOW-UP UNIT;
logs `logs/t1t2-run{10,11}.log`, `logs/t2-run12.log`). The dossier is R9-adjacent —
this file DRAFTS the amendments; H applies them to
`research/candidates/77-car-occupation-dictionary-laughlin.md` (one-writer rule
respected; nothing in main was touched).

## Amendment 1 — §"Precise mathematical statement" T2 (the statement correction)

**Finding:** the drafted T2(a) statement was **ill-typed as stated** — the
degree-spectrum sum `∑ n ∈ Finset.image deg Finset.univ, blockProj deg n M = M`
requires `[Fintype κ]`, absent from the Abstract section. This was the ENTIRE content
of the run-9 "filter-blind-spot" tainted-decl mystery: two
`error(lean.synthInstanceFailed)` messages in the `: error(` format the runner's
filter missed (rc=1 reported as errors=0), the decl taking the error-sorry → sorryAx.
The parity twin masked the class (its spectrum `Finset.range 2` needs no Fintype).

**Amended statement (as now PROVED, `T2.lean:83`):**

> For any `κ` with `[DecidableEq κ] [Fintype κ]`, degree map `deg : κ → ℕ`, and
> `M : Matrix κ κ ℂ`: `IsDegreeBlock deg M ↔ ∑ n ∈ Finset.image deg Finset.univ,
> blockProj deg n M = M`.

The `[Fintype κ]` binder is a genuine hypothesis-strengthening relative to the
draft (the mod-2 twin remains Fintype-free). Consumers are unaffected (the three
Laughlin-instance theorems never consume the iff; `Occupation Q = Finset …` carries
`Fintype` canonically at instantiation).

## Amendment 2 — §"T1/T2 EXECUTION UPDATE": append the follow-up outcome block

> **[FOLLOW-UP UNIT UPDATE 2026-11-19 (lane R7; runs 10–12).]** T1 GREEN — all 8
> top-level theorems triad-only, incl. `map_iso_occupationElem` (the element-level
> dictionary to tauceti's own `carOccupationElement`) clean for the first time;
> residual burn-down 31 → 7 → 0. T2 GREEN at **8/8** triad-only — the tainted
> `isDegreeBlock_iff_sum_blockProj` repaired: the run-9 sorryAx was an
> `error(lean.synthInstanceFailed)` (missing `[Fintype κ]`, see Amendment 1) that the
> pilot runner's `": error:"`-only filter missed; the follow-up runner adds the
> `: error(` class (matching make_axcheck's 43d55bb fix) and dumps FULL RAW OUTPUT on
> any non-clean verdict. Physlib clock (condition (iii)) stamped at BOTH ends:
> start `pushed_at = 2026-11-18T14:07:18Z` (tick = #2001 central-force integrability —
> orthogonal), end `pushed_at = 2026-11-19T11:30:09Z` (tick = #2075/#2072
> documentation handbooks — zero math). Differentiation re-run at the end-tick
> re-confirms the 2026-11-18 event verdict (Wick wing: same-statistics
> supercommutation + central mixed supercommutators; 0 Clifford/quadratic-form, 0
> Fock-matrix, 0 tauceti): **the CAR-transport sub-content's ceiling is
> formalization-parity (below C+) against the Wick layer; the C+ billing
> concentrates on the dictionary core, now kernel-verified GREEN both ways.** The
> standing clock condition stays LIVE for the FB-5/77 continuation.

## Amendment 3 — durable-find ledger additions (§EXECUTION UPDATE's API list)

- `Finset.mem_image_of_mem` on the tauceti-pin mathlib (1b1ccf4b) takes `f` EXPLICIT
  first: `mem_image_of_mem deg h` — not the implicit-position application.
- Never feed simp both orientations of one equality (`hxi : x = i` + `hxis : i = x`):
  the inverse rewrite pair loops to `maximum recursion depth` (4 blowouts in run 10).
  One orientation + cascade-to-`i` rewriting is orientation-immune for
  `Matrix.single`'s if-conditions.
- The `: error(` message class (`error(lean.synthInstanceFailed)` et al.) must be in
  EVERY runner/sweep error filter — the 77 runner is now the third instrument to
  learn this (make_axcheck 43d55bb, the sweep tooling, now run_pilot.py).

## Not-amendments (checked, no dossier exposure)

- The T1 mathematical corrections (hyperbolic submodel rank 2(Q+1); number-operator
  images) are ALREADY folded in the dossier's T1 AMENDED block — the follow-up's
  GREEN did not change them (both held through runs 10–12).
- Article-78: zero exposure (the D.5 resolution stands — T2's theorems and the iff
  are not cited there).
- FB-5/77 continuation charter conditions (i)–(iv): all four carry unchanged; the
  C+ cap is now TIGHTER on the CAR-transport sub-rung per the differentiation
  re-run (Amendment 2's last paragraph).

— lane R7 (A9 lineage), 2026-11-19, worktree agent-10. No commits (H commits, after K).
