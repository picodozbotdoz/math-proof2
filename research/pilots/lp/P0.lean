/-
LP-P0 — statement probe: the LP-duality layer + 02-core consumer cluster.

PROBE FILE — "NOT A PROOF ARTIFECT" is wrong; it IS a probe artifact: every `sorry`
below is a probe-convention stub (AGENTS.md; the 71/73 P0 pattern). This file never
lands as a proof artifact and is never cited as a result; it exists to elaborate the
frozen statement shapes against mathlib `ff2494ea` (v4.36.0-rc2) and to preflight the
substrate names LP-P1/LP-P2 consume (the `to_additive` twins and the `Sum`-index glue).

Iteration-4 slot 1 (qa/iter4-review/r5-iteration4-backlog.md §9; prework
pilots/lp-layer-prework.md §2). Guard: ≤ 0.15k LoC (this file: see wc; header/comment
lines excluded from the count by convention).

RUN-1 STATEMENT-PORT DELTA (2026-11-16, probe finding — record for the dossier):
`LinearOrderedRing` (the bridge/prework vocabulary) DOES NOT EXIST at mathlib
`ff2494ea` (the 2026 ring-order mixin refactor: no LinearOrderedRing/Semiring/CommRing
bundled classes remain; the pin's idiom is the mixin bundle). The layer is stated as
`[CommSemiring R] [LinearOrder R] [PosMulMono R] [MulPosMono R]` — the idiom of
contemporary files (e.g. Mathlib/NumberTheory/Height/Basic.lean); mathematical content
unchanged (both mul-mono directions = exactly LinearOrderedRing's order-multiplication
content). The two proof anchors HELD at their predicted lines, with mixin classes:
`mul_le_mul_of_nonneg_left [PosMulMono α]` at
Mathlib/Algebra/Order/GroupWithZero/Defs.lean:225; `..._right [MulPosMono α]` at :229.

PHRASING RULE (A5 seed-9, binding): LP duality is formalized outside Lean (AFP
`LP_Duality` Thiemann 2022, `Linear_Programming` Parsert–Kaliszyk 2019 +
arXiv:2403.19639, `Farkas` Bottesch–Haslbeck–Thiemann 2019; Coq 1706.10269
Allamigeon–Katz 2017) and absent from mathlib (TODO `Analysis/Convex/Cone/Basic.lean`,
verified on-pin). Any claim about this layer is Lean/mathlib-native scope only — never
"first formal LP duality" / "unformalized" / unqualified "first".
-/

import Mathlib

/-! ## M0.1 — the layer, asymmetric standard form (bridge §3 verbatim). -/

theorem lp_weak_duality {m n : Type*} [Fintype m] [Fintype n] {R : Type*} [CommSemiring R] [LinearOrder R] [IsOrderedRing R]
    (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)            -- primal feasible (x FREE)
    (hy : ∀ i, 0 ≤ y i)                            -- dual multipliers nonneg
    (hATy : ∀ j, ∑ i, y i * A i j = c j) :         -- dual equality feasibility
    ∑ j, c j * x j ≤ ∑ i, b i * y i := by
  sorry

/-! ## M0.2 — the symmetric-form corollary (reserve rider; prework §2.2). -/

theorem lp_weak_duality_symm {m n : Type*} [Fintype m] [Fintype n] {R : Type*} [CommSemiring R] [LinearOrder R] [IsOrderedRing R]
    (A : m → n → R) (b : m → R) (c : n → R)
    (x : n → R) (y : m → R)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)
    (hx : ∀ j, 0 ≤ x j) (hy : ∀ i, 0 ≤ y i)
    (hATy : ∀ j, c j ≤ ∑ i, y i * A i j) :
    ∑ j, c j * x j ≤ ∑ i, b i * y i := by
  sorry

/-! ## The 02-core consumer cluster (prework §2.3; dossier-02 §Precise shapes).

Grid-quantized bandwidth-2 certificates: validity and value depend only on grid
quantities (dossier 02 Theorem E's own program); the C¹→grid reduction (02 Theorems
A/B/C) is NOT slot-1 work. -/

/-- One k = 2 datum: one-point row `s`, two-point diagonal row `s₂`, simple fraction
`p₁` (dossier 02 §Precise; a configuration of the near-CUE enclosure family — the
enclosure itself enters only as an `EnclOK`-style binder at the consumer's consumer,
NOT here). -/
structure BWDatum (G : Type*) [Fintype G] where
  s : G → ℝ
  s₂ : G → ℝ
  p₁ : ℝ

/-- The grid-quantized bandwidth-2 certificate: constant + grid values of `r₁, r₂`. -/
structure BWCert (G : Type*) [Fintype G] where
  c₀ : ℝ
  r₁ : G → ℝ
  r₂ : G → ℝ

/-- Validity at a datum (dossier 02 §Precise, verbatim shape). -/
def BWCert.valid {G : Type*} [Fintype G] (cert : BWCert G) (δ : BWDatum G) : Prop :=
  cert.c₀ + ∑ g, δ.s g * cert.r₁ g + ∑ g, δ.s₂ g * cert.r₂ g ≤ δ.p₁

/-- **02-core consumer clause.** Every dual-feasible combination of data rows bounds
every valid certificate's value — the weak-duality half of dossier-02 §Re-scope item 1
(`B_k(N,τ) ≤ LP-dual value`), pointwise in the certificate (no `sSup` machinery — that
packaging is a stop-gated optional extension). `μ` is the model (CUE) weight vector the
value functional selects; the three barycenter equalities ARE the dual equality
constraint `Aᵀy = c` for this program. -/
theorem bw2_ceiling_of_dual {G D : Type*} [Fintype G] [Fintype D]
    (dat : D → BWDatum G) (μ : G → ℝ) (y : D → ℝ)
    (hy : ∀ δ, 0 ≤ y δ)
    (hsum : ∑ δ, y δ = 1)
    (hbary₁ : ∀ g, ∑ δ, y δ * (dat δ).s g = μ g)
    (hbary₂ : ∀ g, ∑ δ, y δ * (dat δ).s₂ g = μ g)
    (cert : BWCert G) (hvalid : ∀ δ, cert.valid (dat δ)) :
    cert.c₀ + ∑ g, μ g * cert.r₁ g + ∑ g, μ g * cert.r₂ g
      ≤ ∑ δ, y δ * (dat δ).p₁ := by
  sorry

/-! ## 74-T3 shape port (OPTIONAL second consumer; execute only if chartered).

Kept at the bridge's schematic level (prework §2.4): the moment identification with
`u ≠ 1` carried IN the statement (A5 row-74 glue note: at `u = 1` the `Real.rpow`
convention `0 ^ 0 = 1` counts zero-probability atoms, so the unfiltered openai
`moment p 1 = Fintype.card ι` ≠ the filtered support sum), plus the grid-dictionary
application shape the full T3 statement will instantiate. The FULL T3 statement is
deferred to charter time if 74-T3 is named. -/

/-- The moment identification (openai `EntropyMoments.lean:93` shape:
`moment p u = ∑ i, (p i) ^ (1 - u)`), with the `u ≠ 1` side condition as an explicit
hypothesis binder — never an implicit convention. -/
noncomputable def momentIdent (ι : Type*) [Fintype ι] (p : ι → ℝ) (u : ℝ) : ℝ :=
  ∑ i, (p i) ^ (1 - u)
  -- SHAPE ONLY: the u ≠ 1 side condition (momentIdent p 1 = card ι vs the filtered
  -- support sum, via Real.rpow's 0^0 = 1) is 74-T3 charter-time content; the FULL T3
  -- statement carries it IN-SIGNATURE. noncomputable: Real.instPow (rpow) at this pin.

/-- Grid-dictionary application shape (rows = grid spectra; objective selects `c₀`;
the layer supplies ONLY the `≤` clause — vertex enumeration / `=` are never slot-1). -/
theorem grid_ceiling_of_dual {G n : Type*} [Fintype G] [Fintype n]
    (A : G → n → ℝ) (b : G → ℝ) (c : n → ℝ) (x : n → ℝ) (y : G → ℝ)
    (hAx : ∀ i, ∑ j, A i j * x j ≤ b i)
    (hy : ∀ i, 0 ≤ y i)
    (hATy : ∀ j, ∑ i, y i * A i j = c j) :
    ∑ j, c j * x j ≤ ∑ i, b i * y i :=
  lp_weak_duality A b c x y hAx hy hATy

/-! ## Substrate preflight (info only; the names LP-P1/LP-P2 consume). -/

#check @Finset.sum_congr
#check @Finset.sum_comm
#check @Finset.sum_mul
#check @Finset.mul_sum
#check @Finset.sum_le_sum
#check @mul_le_mul_of_nonneg_left
#check @mul_le_mul_of_nonneg_right
#check @Finset.sum_disjSum   -- RUN-2 PIN: the prework's guessed `Finset.sum_sum_elim`
                            -- does NOT exist at ff2494ea; the Sum-index decomposition
                            -- is Finset.sum_disjSum / sum_sumElim (to_additive twins of
                            -- prod_disjSum/prod_sumElim, BigOperators/Group/Finset/Basic.lean:209/:223)
#check @Finset.sum_sumElim    -- the Sum.elim form (to_additive of prod_sumElim, :223)
