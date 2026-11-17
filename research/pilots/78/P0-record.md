# Pilot 78 — Stage A (P0) record: GREEN

*Dossier `research/candidates/78-truffet-substitution-refutation.md` · charter: orchestrator
ruling 2026-11-17 ("dossier-78 Stage-A pilot P0 is GO, executed by you") · lane A7 ·
2026-11-17. H owns commits; none made here.*

## Verdict

**P0 GREEN** — `P0.lean` elaborates clean on the pin (mathlib `ff2494ea`, toolchain
`v4.36.0-rc2`): **0 errors, 0 sorry**, and the in-file `#print axioms` audit surface
reports all three target theorems depending on **exactly the triad**
`[propext, Classical.choice, Quot.sound]` — no `sorryAx`, nothing beyond the standard
three. All three target theorems landed, including the optional sharpening A2′.

## The theorems (the discovery statement, kind NEGATIVE)

Namespace `CrossMath.Truffet78`, file `research/pilots/78/P0.lean`:

1. **A1 `paperSelect_forced_singleton`** (fidelity, singleton case): on any state in the
   paper's Case 2.2.2 whose (53b)-candidate set is a singleton, the paper's Theorem-4.3
   selection returns that pair via branch (47). Formal counterpart of scoping-note
   §10.1: the θ-intervals over Rλμ, the T/T′ hB/hU filter, and the tie-stages (48)–(52)
   do not participate — the proof never mentions them (a `dif_pos` + singleton-uniqueness
   argument, faithful to the §10.1 proposition that no interval arithmetic engages).
2. **A2 `paper_run_not_optimal`** (the DISCOVERY carrier): the paper's procedure —
   transcribed verbatim (dictionary of §10.1; definition layer re-implements the OAI
   corpus model, no import, no build dependency) — run on the Def-4.2-bounded two-row
   instance `initial`: both steps are singleton selections (A1), the run terminates in
   the procedure's success branch (Case 2.1) asserting `min z = 1` at the point
   `output = (1,0,0)` (h := 1, i.e. the paper's own normalization), while
   `better = (0,−1,0)` is feasible with cost `0 < 1`, and the final-cost bookkeeping
   itself holds (`eval initial.cost output = eval finalState.cost output = 1`) — the
   failure is optimality, not bookkeeping.
3. **A2′ `instance_unbounded_below`** (sharpening, LANDED): for every r : ℝ a feasible
   point of cost < r exists (witness family `(r−1, r−2, r−1)`) — the procedure asserts a
   *finite* minimum on an unbounded-below instance.

**Spec-signature correction (recorded per the charter's audit discipline):** the dossier
spec's A2′ signature `(r : Coeff) < eval initial.cost w` had the inequality reversed
(unbounded-*above*); the correct unbounded-*below* statement `eval initial.cost w < (r : Coeff)`
is what is proved. Noted in the P0.lean docstring; dossier spec stands corrected by this
record.

## Article framing (per the iteration-4 gate)

Kind: **NEGATIVE** (candidate DISCOVERY-grade). Per-theorem status: A1/A2/A2′ all
**PROVED-UNCONDITIONAL**. Nearest-miss rows (source-checked 2026-11-17, dossier table):
(1) `OAI.TruffetV4Counterexample.finite_execution_not_optimal` — the model-level
statement this pilot promotes to procedure-level; (2) Truffet arXiv:2603.26423 v4 — the
target-of-refutation (§2.3 optimality claim; v4 NOTA's disjunction correction shown
incomplete at the I≥-selection level); (3) Truffet arXiv:2604.06726 v4 (classical
sibling, Stage B); (4) Allamigeon–Benchimol–Gaubert–Joswig (SIAM J. Discrete Math.
29(2):751–795, 2015); (5) Butkovič (JOTA 180(3):1011–1026, 2019); (6) the
formal-methods landscape row (no tropical-LP formalization anywhere). Care framing
discharged: verbatim-v4 criteria (eq-numbered transcription), prerequisite-satisfying
instance (`bounded initial` in A2), in-procedure case ladder (`case222` hypotheses).

## Runs (fix-loop; all logs `logs/p0-run{1..4}.log` with provenance headers)

| run | wall | verdict | errors | what changed |
|---|---|---|---|---|
| 1 | 64 s (warm) | FAIL | 11 | baseline upload; parse cascade (`open Classical in` between docstring and def), `case222` referencing later defs, `Neg Coeff` missing on pin, `coe_le/lt_coe` iff-typed, section-`end` missing |
| 2 | 34 s | FAIL | 3 | A1 `rw at` choice-dependence (motive failure); A2′ index-2 lookup stuck on `vecTail` equation |
| 3 | 40 s | FAIL | 1 | A2′ row-1 still stuck: `cons_val_two` on this pin reduces to `vecHead (vecTail u)` — needed `Matrix.head_cons`/`tail_cons` |
| 4 | 53 s | **GREEN** | 0 | — |

Route notes: image layers shared with `crossmath-probe`/`pilot-32` as designed
(textually-identical `run_commands`) — no layer rebuild across runs. Elaboration
(single `lake env lean` on `import Mathlib`) dominates each run's wall time; the fix
loop's total wall ≈ 3.2 min of Modal compute. Within the charter's 3–6-run estimate and
nowhere near the 40-min stop.

## Telemetry (AGENTS.md §Modal mandatory guidelines)

Default spec (cpu=2.0, mem=4096) on every run; `LEAN_NUM_THREADS=2` via CAP secret.
Run 1 summary: `wall=64s max_cpu=0.89 max_mem=8363MB OVER=1` — the OVER line is the
documented inherent artifact (mem = MemTotal−MemAvailable includes the memory-mapped
Mathlib olean pages, ≈5–6 GB for `import Mathlib` modules; G7b measured-facts note in
AGENTS.md); CPU stayed under spec (0.89 ≤ 2.0). Runs 2–4 completed within the first
telemetry sample interval (`samples=0`). No investigation trigger beyond the documented
mapping artifact; no resource upgrade requested or needed.

## Hygiene

- `#print axioms` surface: 3 public theorems, all triad-only (above). Private lemmas fold
  into them (file has exactly three public theorems; the def layer is public as A2's
  statement mentions it).
- sorry-token check: 0 `sorry` in the file (proof artifact; no probe-class header).
- Residual warnings (cosmetic, verdict unaffected): unused-simp-arg linter notes and
  deprecation notes (`push_neg`→`push Not` used; `if_pos`/`Set.mem_setOf_eq` deprecated
  names still functional). Kept as-is to avoid a fifth run for cosmetics.
- Siblings read-only; the OAI tree was neither imported nor built (statement-level
  re-implementation only).

## Next (post-P0, per the dossier)

A2 (with A1 as its selection layer) is the article-eligible statement set for the iter-4
gate review (kind NEGATIVE; R2 re-grade at charter per S1–S4). A2′ rides along. Stage B
(classical transcription + search) charters only after this GREEN, per the dossier's
feasibility note.
