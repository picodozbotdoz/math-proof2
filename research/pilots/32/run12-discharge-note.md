# Run-12 discharge note — article 32 §5 "What is not formalized" (crossing existence)

**Verdict: GREEN 2026-11-17 (iteration-4 week-1 row 1; R2 §12.2; r5 backlog §14 run 12).**
Evidence: `research/pilots/32/logs/run12-crossing-existence.log` — M2.lean OK
(rc=0, 0 errors, 0 sorry-warnings) at :58 with all seven printed theorems triad-only
`[propext, Classical.choice, Quot.sound]` at :60–:66; M1.lean regression OK (:14,
triad :16–:24). Substrate: mathlib `ff2494ea`, v4.36.0-rc2, warm `crossmath-pilot-32`
app via the **doz CLI route** (PRIMARY per orchestrator ruling 2026-11-17 + H's relay;
run URL `modal.com/apps/semraker/main/ap-nIcL1aicwp5tHgX0LlYY1n`). Descent 3 runs:
9 errors → 2 errors → GREEN (all error classes + fixes recorded in the log).

## 1. The exact sentence this run retires

`research/articles/32-rc-savings-frontier.md` §5, the paragraph opening
"**What is not formalized.**" (:123). It makes three claims; run 12 discharges the
first two, the third stays as scoped:

| §5 claim (verbatim span) | status after run 12 |
|---|---|
| "The existence of the crossing c*(ε) for ε ∈ (0, ε*) is the intermediate value theorem applied to the continuous, strictly increasing function c ↦ gammaOf(c, 9/10) − gmax(ε, c) on (10, ∞), which is negative as c → 10⁺ … and tends to +∞." | **DISCHARGED** — now formalized: continuity `crossDiff_continuous`; negative near 10⁺ via `gammaOf_le_add` (log(1+u) ≤ u) + `lnΛ_upper` (`gmax_pos_near_ten` quantifies it); +∞ far out via the new MVT lower bound `lnΛ_growth` (lnΛ c 0 ≥ 5·ln10 + (c−10)·κ/2, κ = 2·Lconst − ln(10/9) > 0; `gmax_neg_far`); IVT = mathlib `intermediate_value_Icc` → `crossing_exists`. |
| "In Lean the crossing is a parameter of `frontier_of_crossing`." | **DISCHARGED** — `frontier_unconditional` proves `FrontierSet ε = Ioo 0 (gammaOf c* (9/10))` and `frontier_formula_unconditional` recovers the sSup formula of Theorem 5 with NO crossing hypothesis; `crossing_unique` (M1) already gives uniqueness. |
| "Continuity and strict decrease of Γ and Γ(ε) → 0 as ε → ε*⁻ follow from the implicit-function picture and are likewise paper-level. The donor's Corollary 31 itself … is not consumed …" | **STAYS** (as scoped by R2 §12.2 — the mini-spec claims only the existence discharge; the ε-dependence of c*(ε) and the Corollary-31 data-structure statement remain paper-level). |

Note the paper's argument sketch and the Lean proof agree in mechanism; the Lean
near-10 endpoint is the explicit width c₁ = 10 + t, t := B/(2·(2·Lconst + 1/5)) with
B = ln4/ε − 5·ln10 > 0 (strictness via t·(Lconst + 1/10) = B/4 < B/2), and the far
endpoint is form 3's witness pushed past c₁ by `gmax_strictAnti`.

## 2. Draft replacement status line (for R1's post-GO v2 edit — article NOT edited here)

§5 replacement paragraph (drop-in for the two discharged sentences; keep the third
row's content as the residual "not formalized" sentence):

> **Crossing existence (discharged 2026-11-17, `research/pilots/32/M2.lean`).** For
> every ε ∈ (0, ε*) the crossing exists, so Theorem 5 is unconditional parametric:
> the difference c ↦ gammaOf(c, 9/10) − gmax(ε, c) is continuous on c > 10
> (`crossDiff_continuous`), negative at c = 10 + B/(2·(2·Lconst + 1/5)) with
> B = ln4/ε − 5·ln10 > 0, and positive far out since
> lnΛ c 0 ≥ 5·ln10 + (c−10)·(2·Lconst − ln(10/9))/2 (`gmax_neg_far`); the interval
> IVT (`intermediate_value_Icc`) returns c* > 10 with
> gammaOf(c*, 9/10) = gmax(ε, c*) (`crossing_exists`), unique by `crossing_unique`.
> `frontier_unconditional` then proves Ach(ε) = Ioo 0 (gammaOf c* (9/10)) outright and
> `frontier_formula_unconditional` recovers the frontier formula with no crossing
> hypothesis. Still paper-level: the ε-dependence of c* (continuity, strict decrease,
> Γ(ε) → 0 as ε → ε*⁻) and the donor's Corollary 31 data-structure statement.

README status cell (R2 §12.2's wording): **"proved; crossing exists for all ε < ε*"**.

§5 verification table row to append (R1's edit):

| statement | Lean declaration (`research/pilots/32/M2.lean`) |
|---|---|
| crossing existence (§5 discharge) | `crossDiff_continuous`, `gmax_pos_near_ten`, `gmax_neg_far`, `crossing_exists`, `frontier_unconditional`, `frontier_formula_unconditional` (+ near-ten quantitative form `gammaOf_tendsto_ten_right`) |

with the axiom line updated to cite `run12-crossing-existence.log:60–66` alongside
`run3-green.log`/`axcheck-final.log`.

## 3. Declarations landed (M2.lean, sha256 9c10fcf5…, 675 LoC, self-contained)

R2 §12.2's six missing lemma forms, exact names; one recorded binder adaptation —
forms 2/5/6 add an explicit `0 < ε` binder (the spec's bare `ε < ε*` does not exclude
ε ≤ 0, for which no crossing can exist since gmax < 0 < gammaOf; the positive-axis
binder is the faithful reading of the article's ε ∈ (0, ε*)):

1. `gammaOf_tendsto_ten_right` — ∀ e > 0, ∃ c > 10, gammaOf c (9/10) < e.
2. `gmax_pos_near_ten` (hε : 0 < ε) (hlt : ε < epsStar) — ∃ c > 10, 0 < gmax ε c.
3. `gmax_neg_far` (hε : 0 < ε) — ∃ c > 10, gmax ε c < 0 ∧ 0 ≤ gammaOf c (9/10).
4. `crossDiff_continuous` (h₁ : 10 < c₁) (hle : c₁ ≤ c₂) — continuity of the
   difference on Icc c₁ c₂ (stated exactly as specced, no ε-sign hypothesis).
5. `crossing_exists` (hε : 0 < ε) (hlt : ε < epsStar) — ∃ c > 10, IsCrossing ε c.
6. `frontier_unconditional` (spec's `Ach` = M1's `FrontierSet`) —
   ∃ cₓ, 10 < cₓ ∧ IsCrossing ε cₓ ∧ FrontierSet ε = Ioo 0 (gammaOf cₓ (9/10)).
Plus `frontier_formula_unconditional` (the sSup/Theorem-5 composition with M1's
`frontier_of_crossing`) and helpers `gammaOf_le_add`, `lnΛ_growth`.

## 4. Final-sweep registration note (owning lane: H/R3 — one line, no caveat)

M2.lean is **self-contained** (imports only Mathlib; M1's needed declarations carried
verbatim — frozen-M1 carry, byte-diff-verified this session — Pb.lean precedent), so
the sweep registration is a plain TARGETS append with NO sibling-import rewrite:

```python
("AxPilot32_M2",      PILOTS / "32/M2.lean"),  # run-12 GREEN 2026-11-17 (7 R2-§12.2 forms; self-contained M1 carry, no rewrite needed)
```

into `feasibility/probe/make_axcheck.py`'s Iteration-4 additions block. (This
deliberately dodges the overloaded-`M1`-stem hazard in the auto-rewrite map:
`import M1` would last-wins-rewrite to `AxPilot10_M1`, a different pilot's file.)

## 5. Runner note (H commits)

`run_pilot.sh:14` stage dir made lane-unique this session:
`STAGE=/tmp/crossmath-pilot-stage` → `/tmp/crossmath-pilot-32-a6` (the R8-flagged
stale-xyz-default caveat at :15–16 was already resolved at this worktree rev —
`MODAL_USER=${MODAL_USER:-doz}` with the doz-CLI branch first; run 12 used
`MODAL_USER=doz` explicitly, matching the week1-agenda row-1 override).
