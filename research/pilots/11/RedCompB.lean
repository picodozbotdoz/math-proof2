/-
  Pilot 11, tranche T3 — the `Red` calculus, DESIGN B (no constant field: any absolute
  constant is folded into `extra` at the leaves). Composition is literal:
  calls multiply, extras add.

  Problem adapters (needed because the corpus time types are curried ℕ→ℝ→ℝ and
  ℕ→ℕ→ℕ→ℝ while the calculus is over π → ℝ): `ET`/`Lop` re-pad a problem's time
  function through a product parameter type, with an ∃-witness so the κ-slot
  dependence is exactly "none".

  Acceptance target: `theorem19_of_red` must have the exact type of the donor
  `ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16` (P11T2), with the
  Theorem-17/Corollary-16 combination routed through `Red.comp`.
-/
import P11T2

namespace CrossMath.RedB

open ThreeSumApsp

/-! ### The calculus -/

/-- A call-charged reduction from problem `A` (parameters π) to problem `B`
    (parameters ρ): every solver of `B` in time `T` yields a solver of `A` in time
    at most `extra + calls · T ∘ β` on parameters satisfying the guard `H`.
    A call is charged exactly its running time (the corpus convention,
    TimeClaims/Sec3/Definitions.lean:54–58). -/
structure Red {π ρ : Type} (A : (π → ℝ) → Prop) (B : (ρ → ℝ) → Prop)
    (β : π → ρ) (calls extra : π → ℝ) (H : π → Prop) : Prop where
  calls_nonneg : ∀ p, 0 ≤ calls p
  transfer : ∀ T : ρ → ℝ, B T → ∃ T' : π → ℝ, A T' ∧
    ∀ p, H p → T' p ≤ extra p + calls p * T (β p)

/-- **Composition theorem (Design B): calls multiply, extras add.** Binder-exact:
    the composed guard is the conjunction (inner guard at the shaped parameters). -/
theorem Red.comp {π ρ σ : Type} {A : (π → ℝ) → Prop} {B : (ρ → ℝ) → Prop}
    {Cc : (σ → ℝ) → Prop} {β₁ : π → ρ} {β₂ : ρ → σ}
    {c₁ e₁ : π → ℝ} {c₂ e₂ : ρ → ℝ} {H₁ : π → Prop} {H₂ : ρ → Prop}
    (r₁ : Red A B β₁ c₁ e₁ H₁) (r₂ : Red B Cc β₂ c₂ e₂ H₂) :
    Red A Cc (β₂ ∘ β₁)
      (fun p => c₁ p * c₂ (β₁ p))
      (fun p => e₁ p + c₁ p * e₂ (β₁ p))
      (fun p => H₁ p ∧ H₂ (β₁ p)) := by
  obtain ⟨hc₁, t₁⟩ := r₁
  obtain ⟨hc₂, t₂⟩ := r₂
  refine ⟨fun p => mul_nonneg (hc₁ p) (hc₂ (β₁ p)), ?_⟩
  intro T hT
  obtain ⟨T₂', hB₂', hb₂⟩ := t₂ T hT
  obtain ⟨T₁', hA, hb₁⟩ := t₁ T₂' hB₂'
  refine ⟨T₁', hA, fun p hp => ?_⟩
  obtain ⟨hp₁, hp₂⟩ := hp
  have h2 := hb₂ (β₁ p) hp₂
  calc T₁' p ≤ e₁ p + c₁ p * T₂' (β₁ p) := hb₁ p hp₁
    _ ≤ e₁ p + c₁ p * (e₂ (β₁ p) + c₂ (β₁ p) * T (β₂ (β₁ p))) := by
        linarith [mul_le_mul_of_nonneg_left h2 (hc₁ p)]
    _ = (e₁ p + c₁ p * e₂ (β₁ p)) + c₁ p * c₂ (β₁ p) * T (β₂ (β₁ p)) := by ring

/-! ### Problem adapters -/

/-- Exact Triangle (time ℕ → ℝ → ℝ), re-padded over `ℕ × ℝ × ℝ`; the ∃-witness
    pins the κ-slot to carry no dependence. -/
def ET (M : DetTimeModel) : ((ℕ × ℝ × ℝ) → ℝ) → Prop :=
  fun S => ∃ f : ℕ → ℝ → ℝ, M.exactTriangle f ∧ S = fun p => f p.1 p.2.2

/-- Lop-AE-SparseTri detection (time ℕ → ℕ → ℕ → ℝ), re-padded over `ℕ × ℕ × ℕ`. -/
def Lop (M : DetTimeModel) : ((ℕ × ℕ × ℕ) → ℝ) → Prop :=
  fun S => ∃ f : ℕ → ℕ → ℕ → ℝ, M.lopDetect f ∧ S = fun q => f q.1 q.2.1 q.2.2

/-! ### The Theorem-17 shapes -/

noncomputable def beta17 (D : ℕ → ℕ) (p : ℕ × ℝ × ℝ) : ℕ × ℕ × ℕ :=
  (p.1, D p.1, queryCap p.1 (D p.1))

def calls17 (g : ℕ → ℕ) (p : ℕ × ℝ × ℝ) : ℝ := 4 * (p.1 : ℝ) * (g p.1 : ℝ)

noncomputable def extra17 (D g : ℕ → ℕ) (MM : ℕ → ℝ) (C : ℝ) (p : ℕ × ℝ × ℝ) : ℝ :=
  calls17 g p * C * ((p.1 : ℝ) ^ 2 / Real.sqrt (D p.1))
    + C * (termScans p.1 (g p.1) p.2.1 + termPrime MM p.1 (D p.1) + termBuild p.1 (D p.1) (g p.1))

def guard17 (D g : ℕ → ℕ) (p : ℕ × ℝ × ℝ) : Prop :=
  16 ≤ D p.1 ∧ D p.1 ≤ p.1 ∧ 1 ≤ g p.1 ∧ (g p.1 : ℝ) ≤ Real.sqrt (D p.1) ∧
    1 ≤ p.2.1 ∧ p.2.2 ≤ (p.1 : ℝ) ^ p.2.1

/-- `Claim.Theorem_17` (destructured) is a `Red`: the reduction from Exact Triangle to
    Lop-AE-SparseTri. Design B: the claim's constant `C` rides inside `extra`. -/
theorem red_of_theorem_17 {M : DetTimeModel} {MM : ℕ → ℝ} {D g : ℕ → ℕ} {C : ℝ} (hC : 0 ≤ C)
    (h17 : ∀ T : ℕ → ℕ → ℕ → ℝ, M.lopDetect T → ∃ T' : ℕ → ℝ → ℝ, M.exactTriangle T' ∧
      ∀ (n : ℕ) (κ u : ℝ), 16 ≤ D n → D n ≤ n → 1 ≤ g n → (g n : ℝ) ≤ Real.sqrt (D n) →
        1 ≤ κ → u ≤ (n : ℝ) ^ κ →
        T' n u ≤ 4 * (n : ℝ) * (g n : ℝ) *
            (T n (D n) (queryCap n (D n)) + C * ((n : ℝ) ^ 2 / Real.sqrt (D n))) +
          C * (termScans n (g n) κ + termPrime MM n (D n) + termBuild n (D n) (g n))) :
    Red (ET M) (Lop M) (fun p => beta17 D p) (fun p => calls17 g p)
      (fun p => extra17 D g MM C p) (fun p => guard17 D g p) := by
  refine ⟨fun p => by simp only [calls17]; positivity, fun T hT => ?_⟩
  obtain ⟨f, hf, rfl⟩ := hT
  obtain ⟨T', hA, hb⟩ := h17 f hf
  refine ⟨fun p => T' p.1 p.2.2, ⟨T', hA, rfl⟩, fun p hp => ?_⟩
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hp
  have hbound := hb p.1 p.2.1 p.2.2 h1 h2 h3 h4 h5 h6
  simp only [beta17, calls17, extra17]
  linear_combination hbound

/-! ### The acceptance theorem: Theorem 19's route as ONE calculus composition -/

/-- **Milestone-1 acceptance.** From `Claim.Theorem_17` (with Strassen) and
    `Claim.Corollary_16`, the explicit Theorem-19 bound — derived by composing the
    Theorem-17 reduction with the Corollary-16 solver (a zero-calls self-reduction)
    through `Red.comp`. Same type as donor
    `ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16`. -/
theorem theorem19_of_red (M : DetTimeModel)
    (h17 : Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) : Claim.Theorem_19_explicit M 0.00175 1 := by
  obtain ⟨C, hC, h17⟩ := h17
  obtain ⟨C₁₆, Tc, Td, hC₁₆, -, hTd, h16⟩ := h16
  -- Stage 1: Theorem 17 as a reduction.
  have r₁ : Red (ET M) (Lop M) (fun p => beta17 paramD₂₆ p) (fun p => calls17 paramG₂₆ p)
      (fun p => extra17 paramD₂₆ paramG₂₆ strassen C p)
      (fun p => guard17 paramD₂₆ paramG₂₆ p) :=
    red_of_theorem_17 hC h17
  -- Stage 2: Corollary 16 as a zero-calls solver Red (the known time is folded into extra).
  have r₂ : Red (Lop M) (Lop M) (fun q => q) 0
      (fun q => C₁₆ * wantedBound q.1 q.2.1 q.2.2) (fun q => 1 ≤ q.2.1 ∧ q.2.1 ^ 18 ≤ q.1) := by
    refine ⟨fun _ => le_rfl, fun T _ => ?_⟩
    refine ⟨fun q => Td q.1 q.2.1 q.2.2, ⟨Td, hTd, rfl⟩, fun q hq => ?_⟩
    have h := (h16 q.1 q.2.1 q.2.2 hq.1 hq.2).2
    simp only [Pi.zero_apply, zero_mul, add_zero]
    exact h
  -- The composition: calls multiply (by 0), extras add.
  have rcomp := r₁.comp r₂
  obtain ⟨S, hS, hb⟩ := rcomp.transfer (fun q => Td q.1 q.2.1 q.2.2) ⟨Td, hTd, rfl⟩
  obtain ⟨f, hf, rfl⟩ := hS
  obtain ⟨C₀, -, htotal⟩ := Theorem19.total_corollary_26
  refine ⟨C₀ * (2 * C₁₆ + C + C), f, hf, fun n κ u hn hκ hu => ?_⟩
  -- Step 1: the parameters.
  have P := Theorem19.choice_corollary_26 hn
  have hgd : (fun p => guard17 paramD₂₆ paramG₂₆ p) (n, κ, u)
      ∧ (fun q => 1 ≤ q.2.1 ∧ q.2.1 ^ 18 ≤ q.1)
          ((fun p => beta17 paramD₂₆ p) (n, κ, u)) :=
    ⟨⟨P.sixteen_le, P.le_n, P.one_le_ceil, P.ceil_le_sqrt, hκ, hu⟩,
      ⟨by have h16 := P.sixteen_le; simp only [beta17]; omega, by simp only [beta17]; exact P.pow_eighteen_le⟩⟩
  have hbd := hb (n, κ, u) hgd
  -- Step 2: one call (through the calculus: the solver's time already sits in extra).
  have hD1 : 1 ≤ paramD₂₆ n := (by norm_num : (1 : ℕ) ≤ 16) |>.trans P.sixteen_le
  have hcall : C₁₆ * wantedBound n (paramD₂₆ n) (queryCap n (paramD₂₆ n))
      + C * ((n : ℝ) ^ 2 / Real.sqrt (paramD₂₆ n))
      ≤ (2 * C₁₆ + C) * ((n : ℝ) ^ 2 / (paramD₂₆ n : ℝ) ^ (0.063 : ℝ)) :=
    Theorem19.call_cost_corollary_16 hD1 hC hC₁₆ le_rfl
  -- Step 3: the sum of the proof of Theorem 19.
  have hsum := htotal hn (a := 2 * C₁₆ + C) (b := C) (by positivity) hC hκ
  rw [pow_one]
  have key : f n u ≤ 4 * (n : ℝ) * (paramG₂₆ n : ℝ) *
      (C₁₆ * wantedBound n (paramD₂₆ n) (queryCap n (paramD₂₆ n))
        + C * ((n : ℝ) ^ 2 / Real.sqrt (paramD₂₆ n)))
      + C * (termScans n (paramG₂₆ n) κ + termPrime strassen n (paramD₂₆ n)
        + termBuild n (paramD₂₆ n) (paramG₂₆ n)) := by
    simp only [beta17, calls17, extra17, Pi.zero_apply, mul_zero] at hbd
    linear_combination hbd
  exact (Theorem19.time_le_of_calls key hcall hsum (by positivity)).trans_eq (by ring)

end CrossMath.RedB

#print axioms CrossMath.RedB.Red.comp
#print axioms CrossMath.RedB.theorem19_of_red
