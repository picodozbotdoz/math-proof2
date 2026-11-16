/-
L1 — the LP-duality layer (LP-P1): `lp_weak_duality` + symmetric corollary, PROVED.

PROOF ARTIFACT — no `sorry`, no `native_decide`, no external CAS (math-proof1 standard).
Iteration-4 slot 1, LP-P1 (qa/iter4-review/r5-iteration4-backlog.md §9a M0.1/M0.2;
prework pilots/lp-layer-prework.md §2.1–§2.2, §3). Elaborated on mathlib `ff2494ea`
(v4.36.0-rc2) via app `crossmath-pilot-lp` (card 4). Guard: ≤ 0.25k LoC.

STATEMENT-FREEZE NOTE (probe finding, P0 run 1, 2026-11-16): the bridge/prework
vocabulary `[LinearOrderedRing R]` does not exist at this pin (2026 ring-order mixin
refactor — no bundled LinearOrderedRing/Semiring/CommRing classes remain). The frozen
statement uses `[CommSemiring R] [LinearOrder R] [IsOrderedRing R]` — the pin-canonical
umbrella (Mathlib/Algebra/Order/Ring/Defs.lean:64; exports PosMulMono/MulPosMono
:68–70 and IsOrderedAddMonoid, whose toAddLeftMono bridge at priority 900 discharges
Finset.sum_le_sum's `[AddLeftMono]`). Mathematical content unchanged; P0.lean carries
the identical bundle (statement freeze kept in lockstep).

Anchors used (all resolved in P0's substrate preflight, run 3/4): Finset.sum_congr,
Finset.sum_comm, Finset.sum_mul, Finset.mul_sum (BigOperators/Group/Finset/Basic.lean,
to_additive twins), Finset.sum_le_sum (Algebra/Order/BigOperators/Group/Finset.lean),
mul_le_mul_of_nonneg_left (Algebra/Order/GroupWithZero/Defs.lean:225, [PosMulMono]),
mul_le_mul_of_nonneg_right (:229, [MulPosMono]).

PHRASING RULE (A5 seed-9, binding; carried from P0): LP duality is formalized outside
Lean (AFP `LP_Duality` Thiemann 2022, `Linear_Programming` Parsert–Kaliszyk 2019 +
arXiv:2403.19639, `Farkas` Bottesch–Haslbeck–Thiemann 2019; Coq 1706.10269
Allamigeon–Katz 2017) and absent from mathlib (TODO Analysis/Convex/Cone/Basic.lean:37,
verified on-pin). Every claim is Lean/mathlib-native scope only — never "first formal
LP duality" / "unformalized" / unqualified "first". The layer alone is math-trivial
infrastructure; the novelty lives in the consumers (L2/02-core; 74-T3 optional).
-/

import Mathlib

/-- **LP weak duality (asymmetric standard form).** For any primal-feasible `x`
(FREE — sign-unconstrained) and dual-feasible `y` (nonnegative multipliers, equality
constraint `Aᵀy = c`), the primal objective is bounded by the dual objective:
`c ⬝ x ≤ b ⬝ y`. Ordered-field level: no division, no Farkas, no strong duality —
exactly the two `≤`-direction clauses the 02-core and 74-T3 consumers consume
(feasibility/lp-duality-bridge.md §3, verbatim modulo the pin's class idiom). -/
theorem lp_weak_duality {m n : Type*} [Fintype m] [Fintype n] {R : Type*}
    [CommSemiring R] [LinearOrder R] [IsOrderedRing R]
    (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)            -- primal feasible (x FREE)
    (hy : ∀ i, 0 ≤ y i)                            -- dual multipliers nonneg
    (hATy : ∀ j, ∑ i, y i * A i j = c j) :         -- dual equality feasibility
    ∑ j, c j * x j ≤ ∑ i, b i * y i := by
  -- Row-substitute the objective (hATy), push x_j inside the row sum, swap the
  -- summation order, pull y_i back out — then bound row-wise under y ≥ 0.
  have key : ∑ j, c j * x j = ∑ i, y i * (∑ j, A i j * x j) := by
    have step1 : ∀ j, (∑ i, y i * A i j) * x j = ∑ i, y i * (A i j * x j) := by
      intro j
      simp only [Finset.sum_mul, mul_assoc]
    calc ∑ j, c j * x j
        = ∑ j, (∑ i, y i * A i j) * x j := Finset.sum_congr rfl fun j _ => by rw [hATy j]
      _ = ∑ j, ∑ i, y i * (A i j * x j) := Finset.sum_congr rfl fun j _ => step1 j
      _ = ∑ i, ∑ j, y i * (A i j * x j) := Finset.sum_comm
      _ = ∑ i, y i * ∑ j, A i j * x j := by
          -- Finset.mul_sum pulls y i out; the remaining goal closes by rfl (run-1
          -- finding: a trailing `exact` after the auto-rfl errored "No goals").
          refine Finset.sum_congr rfl fun i _ => ?_
          rw [Finset.mul_sum]
  calc ∑ j, c j * x j
      = ∑ i, y i * (∑ j, A i j * x j) := key
    _ ≤ ∑ i, y i * b i := Finset.sum_le_sum fun i _ => mul_le_mul_of_nonneg_left (hAx i) (hy i)
    _ = ∑ i, b i * y i := Finset.sum_congr rfl fun i _ => mul_comm _ _

/-- **LP weak duality, symmetric-form corollary (reserve interface).** With the primal
also nonnegative (`x ≥ 0`), the dual equality constraint weakens to `c ≤ Aᵀy`.
Not needed by 02-core or 74-T3 as specced; kept as the reserve rider for any future
nonneg-variable consumer (bridge §4 row 3). -/
theorem lp_weak_duality_symm {m n : Type*} [Fintype m] [Fintype n] {R : Type*}
    [CommSemiring R] [LinearOrder R] [IsOrderedRing R]
    (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)
    (hx : ∀ j, 0 ≤ x j) (hy : ∀ i, 0 ≤ y i)
    (hATy : ∀ j, c j ≤ ∑ i, y i * A i j) :
    ∑ j, c j * x j ≤ ∑ i, b i * y i := by
  have h := lp_weak_duality A b (fun j => ∑ i, y i * A i j) x y hAx hy (fun _ => rfl)
  calc ∑ j, c j * x j
      ≤ ∑ j, (∑ i, y i * A i j) * x j :=
        Finset.sum_le_sum fun j _ => mul_le_mul_of_nonneg_right (hATy j) (hx j)
    _ ≤ ∑ i, b i * y i := h  -- run-1 finding: h is the ≤-form; calc step is ≤, not =

/-! ## Full-coverage axiom audit (LP-P1 acceptance; the modal log is the evidence). -/

#print axioms lp_weak_duality
#print axioms lp_weak_duality_symm
