/-
L2 — the 02-core consumer clause (LP-P2): `bw2_ceiling_of_dual`, PROVED.

PROOF ARTIFACT — no `sorry`, no `native_decide`, no external CAS. Iteration-4 slot 1,
LP-P2 (qa/iter4-review/r5-iteration4-backlog.md §9b; prework pilots/lp-layer-prework.md
§2.3). Card 11. Guard: ≤ 0.7k LoC, 3–5 runs. Elaborated on mathlib `ff2494ea`
(v4.36.0-rc2) via app `crossmath-pilot-lp`; `import L1` = the pilot-11 sibling-import
pattern (lake env lean resolves the same-directory source).

Content: every dual-feasible combination of data rows bounds every valid certificate's
value — the weak-duality half of dossier-02 §Re-scope item 1, POINTWISE in the
certificate (the `B_k`-`sSup` packaging is a stop-gated optional extension; 02
Theorems A/B/C are NOT slot-1). The proof is the LP dictionary of prework §2.3:
index types m := D (rows = data), n := Unit ⊕ G ⊕ G (coordinates = c₀ ⊕ r₁ ⊕ r₂);
objective `c` selects 1/μ/μ; `hAx` is definitionally the validity rows; `hATy` unfolds
to hsum/hbary₁/hbary₂ (the barycenter equalities ARE Aᵀy = c). Zero new mathematics —
`Sum`-index plumbing via the pin's `Finset.sum_disjSum` (P0's run-3/4 pin; the
prework's guessed `sum_sum_elim` does not exist at ff2494ea).

Statement freeze: the structures/def/statement below are IDENTICAL to P0.lean's probe
freeze (same bundle idioms; ℝ-valued consumer — no class binders needed here).

PHRASING RULE (A5 seed-9, binding): the layer + this consumer are Lean/mathlib-native
scope only; AFP trio (LP_Duality/Linear_Programming/Farkas) + Coq 1706.10269 +
Yamashita 2026-06 are MANDATORY nearest-miss citations in any artifact citing this;
never "first formal LP duality"/"unformalized"/unqualified "first". Knausgård §7.6 owns
the all-windows ceiling framing — never "first barrier theory".
-/

import Mathlib
import L1

/-! ## The grid-quantized bandwidth-2 data class (dossier-02 §Precise shapes;
identical to P0's freeze). -/

/-- One k = 2 datum: one-point row `s`, two-point diagonal row `s₂`, simple fraction
`p₁` (a configuration of the near-CUE enclosure family; the enclosure itself enters
only as an `EnclOK`-style binder at the consumer's consumer — NOT here). -/
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

/-! ## The `Unit ⊕ G ⊕ G` sum decomposition (P2's plumbing; the pin-pinned lemma). -/

/-- Sum over the dictionary's coordinate index decomposes into the `c₀` slot plus the
two `G`-sums. Via `Finset.univ_disjSum_univ` + `Finset.sum_disjSum` (twice), then the
`Unit` collapse — the names P0's substrate preflight pinned at this pin. -/
private theorem sum_uGG {G : Type*} [Fintype G] (f : Unit ⊕ G ⊕ G → ℝ) :
    ∑ j, f j
      = f (Sum.inl ()) + (∑ g, f (Sum.inr (Sum.inl g)) + ∑ g, f (Sum.inr (Sum.inr g))) := by
  -- run-2 restructure: one rw-chain left a Unit-side univ equation bare `simp` does
  -- not close; three standalone simp-haves instead.
  have e1 : ∑ j : Unit ⊕ (G ⊕ G), f j
      = (∑ u : Unit, f (Sum.inl u)) + ∑ v : G ⊕ G, f (Sum.inr v) := by
    simp [Finset.sum_disjSum]
  have e2 : ∑ v : G ⊕ G, f (Sum.inr v)
      = (∑ g, f (Sum.inr (Sum.inl g))) + ∑ g, f (Sum.inr (Sum.inr g)) := by
    simp [Finset.sum_disjSum]
  have e3 : ∑ u : Unit, f (Sum.inl u) = f (Sum.inl ()) := by simp
  rw [e1, e2, e3]

/-! ## The 02-core consumer clause. -/

/-- **02-core consumer clause.** Every dual-feasible combination of data rows bounds
every valid certificate's value — the weak-duality half of dossier-02 §Re-scope item
1, stated pointwise (no `sSup`). Proof: `lp_weak_duality` at the dictionary program
`m := D`, `n := Unit ⊕ G ⊕ G`. -/
theorem bw2_ceiling_of_dual {G D : Type*} [Fintype G] [Fintype D]
    (dat : D → BWDatum G) (μ : G → ℝ) (y : D → ℝ)
    (hy : ∀ δ, 0 ≤ y δ)
    (hsum : ∑ δ, y δ = 1)
    (hbary₁ : ∀ g, ∑ δ, y δ * (dat δ).s g = μ g)
    (hbary₂ : ∀ g, ∑ δ, y δ * (dat δ).s₂ g = μ g)
    (cert : BWCert G) (hvalid : ∀ δ, cert.valid (dat δ)) :
    cert.c₀ + ∑ g, μ g * cert.r₁ g + ∑ g, μ g * cert.r₂ g
      ≤ ∑ δ, y δ * (dat δ).p₁ := by
  -- hAx: the validity rows, definitionally (after the decomposition).
  have hAx : ∀ δ : D, ∑ j, (Sum.elim (fun _ : Unit => 1) (Sum.elim (dat δ).s (dat δ).s₂)) j
        * (Sum.elim (fun _ : Unit => cert.c₀) (Sum.elim cert.r₁ cert.r₂)) j ≤ (dat δ).p₁ := by
    intro δ
    rw [sum_uGG]
    simp only [Sum.elim_inl, Sum.elim_inr, one_mul]
    -- run-3..5 diagnosis (DIAGNOSE-lp-p2-run5.md): sum_uGG's RHS is right-associated,
    -- `valid`'s body left-associated — not defeq, linarith does not normalize the
    -- grouping. Deterministic bridge (run 6, orchestrator-authorized +1 beyond the
    -- card budget): re-associate the goal onto valid's exact form, close by defeq.
    rw [← add_assoc]
    exact hvalid δ
  -- hATy: the barycenter equalities ARE Aᵀy = c, case by case.
  have hATy : ∀ j : Unit ⊕ G ⊕ G, ∑ δ, y δ
        * (Sum.elim (fun _ : Unit => 1) (Sum.elim (dat δ).s (dat δ).s₂)) j
      = Sum.elim (fun _ : Unit => 1) (Sum.elim μ μ) j := by
    intro j
    rcases j with (_ | g | g)
    · simp only [Sum.elim_inl, mul_one]; exact hsum
    · simp only [Sum.elim_inl, Sum.elim_inr]; exact hbary₁ g
    · simp only [Sum.elim_inl, Sum.elim_inr]; exact hbary₂ g
  have h := lp_weak_duality
    (fun δ => Sum.elim (fun _ : Unit => 1) (Sum.elim (dat δ).s (dat δ).s₂))
    (fun δ => (dat δ).p₁)
    (Sum.elim (fun _ : Unit => 1) (Sum.elim μ μ))
    (Sum.elim (fun _ : Unit => cert.c₀) (Sum.elim cert.r₁ cert.r₂))
    y hAx hy hATy
  calc cert.c₀ + ∑ g, μ g * cert.r₁ g + ∑ g, μ g * cert.r₂ g
      = ∑ j, Sum.elim (fun _ : Unit => 1) (Sum.elim μ μ) j
          * Sum.elim (fun _ : Unit => cert.c₀) (Sum.elim cert.r₁ cert.r₂) j := by
        rw [sum_uGG]
        simp only [Sum.elim_inl, Sum.elim_inr, one_mul]
        ring_nf  -- run-3 finding: assoc + 1*c₀ residues; sums are atoms for ring_nf
    _ ≤ ∑ δ, (dat δ).p₁ * y δ := h
    _ = ∑ δ, y δ * (dat δ).p₁ := Finset.sum_congr rfl fun δ _ => mul_comm _ _

/-! ## Full-coverage axiom audit (LP-P2 acceptance; the modal log is the evidence). -/

#print axioms bw2_ceiling_of_dual
#print axioms sum_uGG
