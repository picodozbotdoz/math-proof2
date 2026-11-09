/-
  Pilot 11, tranche T3 — the `Red` calculus, DESIGN A (a constant `C` trailing the bound:
  `extra + calls · T + C`, matching the corpus `∃ C, …` shape).
  Run-1 finding (decisive for the design verdict, recorded in the run log): a
  `Prop`-valued structure cannot carry the data field `C : ℝ` ("failed to generate
  projection … field must be a proof", RedCompA.lean:17, run 1) — so the constant is
  ∃-encoded inside `transfer`. Consequence: the inner constant is not nameable in the
  composition STATEMENT, and since `calls₁` is unbounded the `calls₁ · C₂` correction
  cannot ride in the trailing constant — it must appear as an existential correction
  function. Design B states composition in closed form.
-/
import P11T2

namespace CrossMath.RedA

open ThreeSumApsp

/-- As Design B, but with an absolute additive constant existing inside the transfer. -/
structure Red {π ρ : Type} (A : (π → ℝ) → Prop) (B : (ρ → ℝ) → Prop)
    (β : π → ρ) (calls extra : π → ℝ) (H : π → Prop) : Prop where
  calls_nonneg : ∀ p, 0 ≤ calls p
  transfer : ∃ C : ℝ, 0 ≤ C ∧ ∀ T : ρ → ℝ, B T → ∃ T' : π → ℝ, A T' ∧
    ∀ p, H p → T' p ≤ extra p + calls p * T (β p) + C

/-- **Composition theorem (Design A):** calls multiply; extras add — but the inner
    constant can only appear as an existential correction `ecorr` (the `calls₁ · C₂`
    term is parameter-dependent, so it cannot ride in the trailing `C`). This is
    exactly the friction blueprint §5 risk #1 predicted. -/
theorem Red.comp {π ρ σ : Type} {A : (π → ℝ) → Prop} {B : (ρ → ℝ) → Prop}
    {Cc : (σ → ℝ) → Prop} {β₁ : π → ρ} {β₂ : ρ → σ}
    {c₁ e₁ : π → ℝ} {c₂ e₂ : ρ → ℝ} {H₁ : π → Prop} {H₂ : ρ → Prop}
    (r₁ : Red A B β₁ c₁ e₁ H₁) (r₂ : Red B Cc β₂ c₂ e₂ H₂) :
    ∃ ecorr : π → ℝ,
      Red A Cc (β₂ ∘ β₁)
        (fun p => c₁ p * c₂ (β₁ p))
        (fun p => e₁ p + ecorr p)
        (fun p => H₁ p ∧ H₂ (β₁ p)) := by
  obtain ⟨hc₁, t₁⟩ := r₁
  obtain ⟨C₁, hC₁, t₁⟩ := t₁
  obtain ⟨hc₂, t₂⟩ := r₂
  obtain ⟨C₂, hC₂, t₂⟩ := t₂
  refine ⟨fun p => c₁ p * (e₂ (β₁ p) + C₂), fun p => mul_nonneg (hc₁ p) (hc₂ (β₁ p)), ?_⟩
  refine ⟨C₁, hC₁, fun T hT => ?_⟩
  obtain ⟨T₂', hB₂', hb₂⟩ := t₂ T hT
  obtain ⟨T₁', hA, hb₁⟩ := t₁ T₂' hB₂'
  refine ⟨T₁', hA, fun p hp => ?_⟩
  obtain ⟨hp₁, hp₂⟩ := hp
  have h2 := hb₂ (β₁ p) hp₂
  calc T₁' p ≤ e₁ p + c₁ p * T₂' (β₁ p) + C₁ := hb₁ p hp₁
    _ ≤ e₁ p + c₁ p * (e₂ (β₁ p) + c₂ (β₁ p) * T (β₂ (β₁ p)) + C₂) + C₁ := by
        linarith [mul_le_mul_of_nonneg_left h2 (hc₁ p)]
    _ = (e₁ p + c₁ p * (e₂ (β₁ p) + C₂)) + c₁ p * c₂ (β₁ p) * T (β₂ (β₁ p)) + C₁ := by ring

/-! ### Adapters and shapes (as Design B) -/

def ET (M : DetTimeModel) : ((ℕ × ℝ × ℝ) → ℝ) → Prop :=
  fun S => ∃ f : ℕ → ℝ → ℝ, M.exactTriangle f ∧ S = fun p => f p.1 p.2.2

def Lop (M : DetTimeModel) : ((ℕ × ℕ × ℕ) → ℝ) → Prop :=
  fun S => ∃ f : ℕ → ℕ → ℕ → ℝ, M.lopDetect f ∧ S = fun q => f q.1 q.2.1 q.2.2

noncomputable def beta17 (D : ℕ → ℕ) (p : ℕ × ℝ × ℝ) : ℕ × ℕ × ℕ :=
  (p.1, D p.1, queryCap p.1 (D p.1))

def calls17 (g : ℕ → ℕ) (p : ℕ × ℝ × ℝ) : ℝ := 4 * (p.1 : ℝ) * (g p.1 : ℝ)

noncomputable def extra17 (D g : ℕ → ℕ) (MM : ℕ → ℝ) (C : ℝ) (p : ℕ × ℝ × ℝ) : ℝ :=
  C * (termScans p.1 (g p.1) p.2.1 + termPrime MM p.1 (D p.1) + termBuild p.1 (D p.1) (g p.1))

def guard17 (D g : ℕ → ℕ) (p : ℕ × ℝ × ℝ) : Prop :=
  16 ≤ D p.1 ∧ D p.1 ≤ p.1 ∧ 1 ≤ g p.1 ∧ (g p.1 : ℝ) ≤ Real.sqrt (D p.1) ∧
    1 ≤ p.2.1 ∧ p.2.2 ≤ (p.1 : ℝ) ^ p.2.1

/-- `Claim.Theorem_17` as a Design-A `Red`. NOTE: the claim's `C·(calls·n²/√D)` term is
    parameter-dependent, so it must ride in `extra` even in Design A; the trailing
    constant takes the value 0 here — the vestigial-constant observation for the
    verdict. -/
theorem red_of_theorem_17 {M : DetTimeModel} {MM : ℕ → ℝ} {D g : ℕ → ℕ} {C : ℝ} (hC : 0 ≤ C)
    (h17 : ∀ T : ℕ → ℕ → ℕ → ℝ, M.lopDetect T → ∃ T' : ℕ → ℝ → ℝ, M.exactTriangle T' ∧
      ∀ (n : ℕ) (κ u : ℝ), 16 ≤ D n → D n ≤ n → 1 ≤ g n → (g n : ℝ) ≤ Real.sqrt (D n) →
        1 ≤ κ → u ≤ (n : ℝ) ^ κ →
        T' n u ≤ 4 * (n : ℝ) * (g n : ℝ) *
            (T n (D n) (queryCap n (D n)) + C * ((n : ℝ) ^ 2 / Real.sqrt (D n))) +
          C * (termScans n (g n) κ + termPrime MM n (D n) + termBuild n (D n) (g n))) :
    Red (ET M) (Lop M) (fun p => beta17 D p) (fun p => calls17 g p)
      (fun p => calls17 g p * C * ((p.1 : ℝ) ^ 2 / Real.sqrt (D p.1))
        + extra17 D g MM C p) (fun p => guard17 D g p) := by
  refine ⟨fun p => by simp only [calls17]; positivity, 0, le_rfl, fun T hT => ?_⟩
  obtain ⟨f, hf, rfl⟩ := hT
  obtain ⟨T', hA, hb⟩ := h17 f hf
  refine ⟨fun p => T' p.1 p.2.2, ⟨T', hA, rfl⟩, fun p hp => ?_⟩
  obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hp
  have hbound := hb p.1 p.2.1 p.2.2 h1 h2 h3 h4 h5 h6
  simp only [beta17, calls17, extra17]
  exact hbound.trans_eq (by ring)

/-- **Acceptance, Design A.** Same type as donor
    `ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16`. -/
theorem theorem19_of_red (M : DetTimeModel)
    (h17 : Claim.Theorem_17 M strassen paramD₂₆ paramG₂₆)
    (h16 : Claim.Corollary_16 M) : Claim.Theorem_19_explicit M 0.00175 1 := by
  obtain ⟨C, hC, h17⟩ := h17
  obtain ⟨C₁₆, Tc, Td, hC₁₆, -, hTd, h16⟩ := h16
  -- Design A's ∃-packaged constant cannot be composed opaquely (verdict point #4:
  -- the composed bound mentions the opaque inner constant). The instance therefore
  -- unrolls the two transfers with their literal constants (both 0: every constant
  -- of the corpus claims is parameter-dependent and rides in `extra`), following the
  -- same algebra as `Red.comp`.
  have t₁ : ∀ T : (ℕ × ℕ × ℕ) → ℝ, Lop M T → ∃ S : (ℕ × ℝ × ℝ) → ℝ, ET M S ∧
      ∀ p, guard17 paramD₂₆ paramG₂₆ p →
        S p ≤ (calls17 paramG₂₆ p * C * ((p.1 : ℝ) ^ 2 / Real.sqrt (paramD₂₆ p.1))
          + extra17 paramD₂₆ paramG₂₆ strassen C p) + calls17 paramG₂₆ p * T (beta17 paramD₂₆ p) := by
    intro T hT
    obtain ⟨f, hf, rfl⟩ := hT
    obtain ⟨T', hA, hb⟩ := h17 f hf
    refine ⟨fun p => T' p.1 p.2.2, ⟨T', hA, rfl⟩, fun p hp => ?_⟩
    obtain ⟨h1, h2, h3, h4, h5, h6⟩ := hp
    have hbound := hb p.1 p.2.1 p.2.2 h1 h2 h3 h4 h5 h6
    simp only [beta17, calls17, extra17]
    exact hbound.trans_eq (by ring)
  have t₂ : ∀ T : (ℕ × ℕ × ℕ) → ℝ, Lop M T → ∃ S : (ℕ × ℕ × ℕ) → ℝ, Lop M S ∧
      ∀ q, (1 ≤ q.2.1 ∧ q.2.1 ^ 18 ≤ q.1) →
        S q ≤ C₁₆ * wantedBound q.1 q.2.1 q.2.2 := by
    intro T _
    exact ⟨fun q => Td q.1 q.2.1 q.2.2, ⟨Td, hTd, rfl⟩,
      fun q hq => (h16 q.1 q.2.1 q.2.2 hq.1 hq.2).2⟩
  -- The calculus composition (Red.comp's algebra, constants literal):
  obtain ⟨T₂', hLop₂, hb₂⟩ := t₂ (fun q => Td q.1 q.2.1 q.2.2) ⟨Td, hTd, rfl⟩
  obtain ⟨S, hS, hb₁⟩ := t₁ T₂' hLop₂
  obtain ⟨f, hf, rfl⟩ := hS
  obtain ⟨C₀, -, htotal⟩ := Theorem19.total_corollary_26
  refine ⟨C₀ * (2 * C₁₆ + C + C), f, hf, fun n κ u hn hκ hu => ?_⟩
  have P := Theorem19.choice_corollary_26 hn
  have hgd : (fun p => guard17 paramD₂₆ paramG₂₆ p) (n, κ, u)
      ∧ (fun q => 1 ≤ q.2.1 ∧ q.2.1 ^ 18 ≤ q.1)
          ((fun p => beta17 paramD₂₆ p) (n, κ, u)) :=
    ⟨⟨P.sixteen_le, P.le_n, P.one_le_ceil, P.ceil_le_sqrt, hκ, hu⟩,
      ⟨by have h16P := P.sixteen_le; simp only [beta17]; omega,
        by simp only [beta17]; exact P.pow_eighteen_le⟩⟩
  have hb₁' := hb₁ (n, κ, u) hgd.1
  have hb₂' := hb₂ (beta17 paramD₂₆ (n, κ, u)) hgd.2
  simp only [beta17, calls17, extra17] at hb₁'
  have hc4 : 0 ≤ 4 * (n : ℝ) * (paramG₂₆ n : ℝ) := by positivity
  have hb2s : 4 * (n : ℝ) * (paramG₂₆ n : ℝ) * T₂' (n, paramD₂₆ n, queryCap n (paramD₂₆ n))
      ≤ 4 * (n : ℝ) * (paramG₂₆ n : ℝ)
        * (C₁₆ * wantedBound n (paramD₂₆ n) (queryCap n (paramD₂₆ n))) :=
    mul_le_mul_of_nonneg_left hb₂' hc4
  have key : f n u ≤ 4 * (n : ℝ) * (paramG₂₆ n : ℝ) *
      (C₁₆ * wantedBound n (paramD₂₆ n) (queryCap n (paramD₂₆ n))
        + C * ((n : ℝ) ^ 2 / Real.sqrt (paramD₂₆ n)))
      + C * (termScans n (paramG₂₆ n) κ + termPrime strassen n (paramD₂₆ n)
        + termBuild n (paramD₂₆ n) (paramG₂₆ n)) := by
    have hmid : f n u ≤ (4 * (n : ℝ) * (paramG₂₆ n : ℝ) * C * ((n : ℝ) ^ 2 / Real.sqrt (paramD₂₆ n))
        + C * (termScans n (paramG₂₆ n) κ + termPrime strassen n (paramD₂₆ n)
          + termBuild n (paramD₂₆ n) (paramG₂₆ n)))
        + 4 * (n : ℝ) * (paramG₂₆ n : ℝ)
          * (C₁₆ * wantedBound n (paramD₂₆ n) (queryCap n (paramD₂₆ n))) := by
      linarith [hb₁', hb2s]
    exact hmid.trans_eq (by ring)
  have hD1 : 1 ≤ paramD₂₆ n := (by norm_num : (1 : ℕ) ≤ 16) |>.trans P.sixteen_le
  have hcall : C₁₆ * wantedBound n (paramD₂₆ n) (queryCap n (paramD₂₆ n))
      + C * ((n : ℝ) ^ 2 / Real.sqrt (paramD₂₆ n))
      ≤ (2 * C₁₆ + C) * ((n : ℝ) ^ 2 / (paramD₂₆ n : ℝ) ^ (0.063 : ℝ)) :=
    Theorem19.call_cost_corollary_16 hD1 hC hC₁₆ le_rfl
  have hsum := htotal hn (a := 2 * C₁₆ + C) (b := C) (by positivity) hC hκ
  rw [pow_one]
  have hpos : (0 : ℝ) ≤ 4 * (n : ℝ) * (paramG₂₆ n : ℝ) := by positivity
  exact (Theorem19.time_le_of_calls key hcall hsum hpos).trans_eq (by ring)

end CrossMath.RedA

#print axioms CrossMath.RedA.Red.comp
#print axioms CrossMath.RedA.theorem19_of_red
