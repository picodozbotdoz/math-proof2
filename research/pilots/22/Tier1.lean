/-
Pilot 22 / Tier 1 growing file — M2 (log-derivative extension), M3 (Chebyshev dictionary);
M4 (ψ/x → 1), M5 (θ/x → 1), M6 (π-form PNT) are appended to THIS file in later edits.
(Milestone-per-file alternative rejected: probe files cannot import each other without
building modules, so one growing file is cleaner. M1.lean stays the standalone M1 record;
its proof is restated below unchanged as the engine for M2.)

Convention: full proofs, no `sorry`, no `native_decide`, kernel-only (math-proof1 standard).
`#print axioms` after each milestone theorem.

Citations (mathlib `ff2494ea`):
  riemannZeta_residue_one        LSeries/RiemannZeta.lean:242
  differentiableAt_riemannZeta   LSeries/RiemannZeta.lean:139
  analyticOn_riemannZeta         LSeries/RiemannZeta.lean:146
  LSeries_vonMangoldt_eq_deriv_riemannZeta_div   LSeries/Dirichlet.lean:439
  riemannZeta_ne_zero_of_one_le_re               LSeries/Nonvanishing.lean:417
  WienerIkehara.tendsto_sum_range_div            LSeries/WienerIkehara.lean:693
  psi_eq_sum_Icc                 NumberTheory/Chebyshev.lean:93
  psi_le_const_mul_self          NumberTheory/Chebyshev.lean:485
  vonMangoldt_nonneg             ArithmeticFunction/VonMangoldt.lean:81
  AnalyticAt.deriv              Analysis/Calculus/FDeriv/Analytic.lean:477
  RemovableSingularity.lean:36; Deriv/Slope.lean:73; Topology/Piecewise.lean:35
-/
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.NumberTheory.LSeries.WienerIkehara
import Mathlib.NumberTheory.Chebyshev
import Mathlib.Analysis.Complex.RemovableSingularity
import Mathlib.Analysis.Calculus.Deriv.Slope
import Mathlib.Topology.Piecewise

open Filter Topology

namespace CrossMath.Pilot22

/-! ### M1 (restated from M1.lean, same proof) -/

/-- **M1.** The constant term of the Laurent expansion of `riemannZeta` at `1` exists. -/
theorem exists_tendsto_riemannZeta_sub_inv :
    ∃ c : ℂ, Tendsto (fun s ↦ riemannZeta s - 1 / (s - 1)) (𝓝[≠] 1) (𝓝 c) := by
  set F : ℂ → ℂ := fun s ↦ (s - 1) * riemannZeta s with hF
  have hne : ∀ᶠ s in 𝓝[≠] 1, s ≠ (1 : ℂ) := by
    rw [eventually_nhdsWithin_iff]
    exact Filter.Eventually.of_forall fun s hs => hs
  have hd : ∀ᶠ s in 𝓝[≠] 1, DifferentiableAt ℂ F s := by
    filter_upwards [hne] with s hs
    have hF1 : DifferentiableAt ℂ (fun s : ℂ => s - 1) s := by fun_prop
    exact hF1.mul (differentiableAt_riemannZeta hs)
  have hc : ContinuousAt (Function.update F 1 1) 1 :=
    continuousAt_update_same.2 riemannZeta_residue_one
  have hd' : ∀ᶠ s in 𝓝[≠] 1, DifferentiableAt ℂ (Function.update F 1 1) s := by
    filter_upwards [hd, hne] with s hs hsne
    have hmem : {s : ℂ | s ≠ 1} ∈ 𝓝 s := isOpen_ne.mem_nhds hsne
    have heqF : Function.update F 1 1 =ᶠ[𝓝 s] F := by
      filter_upwards [hmem] with s' hs'
      exact Function.update_of_ne hs' 1 F
    exact hs.congr_of_eventuallyEq heqF
  have hg : AnalyticAt ℂ (Function.update F 1 1) 1 :=
    Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt hd' hc
  have heq : (fun s ↦ riemannZeta s - 1 / (s - 1))
      =ᶠ[𝓝[≠] 1] slope (Function.update F 1 1) 1 := by
    filter_upwards [hne] with s hs
    have h1 : Function.update F 1 1 1 = 1 := Function.update_self 1 1 F
    have h2 : Function.update F 1 1 s = F s := Function.update_of_ne hs 1 F
    simp only [slope, vsub_eq_sub, smul_eq_mul, h1, h2]
    field_simp
    ring
  exact ⟨deriv (Function.update F 1 1) 1,
    Tendsto.congr' heq.symm ((hasDerivAt_iff_tendsto_slope).1 hg.differentiableAt.hasDerivAt)⟩

/-! ### M2 — the continuous extension `G` of `−ζ'/ζ − 1/(s−1)` to `re s ≥ 1` -/

/-- **M2.** The subtracted log-derivative of ζ admits a continuous extension to the closed
half-plane `re s ≥ 1` — the `hG`/`hG'` hypothesis shape for Wiener–Ikehara with `f = Λ`,
`A = 1`, via `ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div`. -/
theorem exists_logDerivExtension :
    ∃ G : ℂ → ℂ, ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧
      Set.EqOn G (fun s ↦ -deriv riemannZeta s / riemannZeta s - 1 / (s - 1)) {s : ℂ | 1 < s.re} := by
  set F : ℂ → ℂ := fun s ↦ (s - 1) * riemannZeta s with hFdef
  set h : ℂ → ℂ := Function.update F 1 1 with hhdef
  have hne : ∀ᶠ s in 𝓝[≠] 1, s ≠ (1 : ℂ) := by
    rw [eventually_nhdsWithin_iff]
    exact Filter.Eventually.of_forall fun s hs => hs
  have hdF : ∀ᶠ s in 𝓝[≠] 1, DifferentiableAt ℂ F s := by
    filter_upwards [hne] with s hs
    have hF1 : DifferentiableAt ℂ (fun s : ℂ => s - 1) s := by fun_prop
    exact hF1.mul (differentiableAt_riemannZeta hs)
  have hch : ContinuousAt h 1 := continuousAt_update_same.2 riemannZeta_residue_one
  have hdh : ∀ᶠ s in 𝓝[≠] 1, DifferentiableAt ℂ h s := by
    filter_upwards [hdF, hne] with s hs hsne
    have hmem : {s : ℂ | s ≠ 1} ∈ 𝓝 s := isOpen_ne.mem_nhds hsne
    have heqF : h =ᶠ[𝓝 s] F := by
      filter_upwards [hmem] with s' hs'
      exact Function.update_of_ne hs' 1 F
    exact hs.congr_of_eventuallyEq heqF
  have hA : AnalyticAt ℂ h 1 :=
    Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt hdh hch
  have h1 : h 1 = 1 := Function.update_self 1 1 F
  have hnz : h 1 ≠ 0 := by simp [h1]
  have hn0 : ∀ᶠ s in 𝓝 1, h s ≠ 0 := hch.eventually_ne hnz
  have hn0' : ∀ᶠ s in 𝓝[≠] 1, h s ≠ 0 := by
    rw [eventually_nhdsWithin_iff]
    filter_upwards [hn0] with s hs _
    exact hs
  -- ζ s = h s / (s−1) for ALL s ≠ 1 (update definition; no limit needed)
  have hzeta : ∀ s : ℂ, s ≠ 1 → riemannZeta s = h s / (s - 1) := by
    intro s hs
    have hs' : h s = (s - 1) * riemannZeta s := Function.update_of_ne hs 1 F
    rw [hs']
    field_simp [sub_ne_zero.2 hs]
  -- key identity near 1: the branch equals `-(deriv h s / h s)`
  have key : ∀ᶠ s in 𝓝[≠] 1,
      (-deriv riemannZeta s / riemannZeta s - 1 / (s - 1)) = -(deriv h s / h s) := by
    filter_upwards [hne, hn0'] with s hs hhs0
    -- h = F near s and pointwise; deriv h through the product rule on F = (s−1)·ζ
    have hevq : h =ᶠ[𝓝 s] F := by
      filter_upwards [(isOpen_ne (x := (1 : ℂ))).mem_nhds hs] with t ht
      exact Function.update_of_ne ht 1 F
    have ha : HasDerivAt (fun s : ℂ => s - 1) 1 s := (hasDerivAt_id s).sub_const 1
    have hdF' := ha.mul (differentiableAt_riemannZeta hs).hasDerivAt
    have hdh' : deriv h s = riemannZeta s + (s - 1) * deriv riemannZeta s := by
      rw [hevq.deriv_eq]
      have hdd := hdF'.deriv
      simp only [one_mul] at hdd
      exact hdd
    have hFeq : h s = (s - 1) * riemannZeta s := Function.update_of_ne hs 1 F
    have hζ0 : riemannZeta s ≠ 0 := by
      rw [hzeta s hs]
      exact div_ne_zero hhs0 (sub_ne_zero.2 hs)
    rw [hFeq, hdh']
    field_simp [sub_ne_zero.2 hs, hζ0]
    ring
  refine ⟨fun s => if s = 1 then -(deriv h 1) else
      -deriv riemannZeta s / riemannZeta s - 1 / (s - 1), ?_, ?_⟩
  · -- ContinuousOn {1 ≤ re} (first conjunct)
    intro s₀ hs₀
    by_cases h₀ : s₀ = 1
    · subst h₀
      -- near 1, G agrees with the continuous function `-(deriv h s / h s)`
      have hdd : ContinuousAt (deriv h) 1 := hA.deriv.continuousAt
      have hcc : ContinuousAt h 1 := hA.continuousAt
      have hinvh : ContinuousAt (fun s => (h s)⁻¹) 1 := hcc.inv₀ hnz
      have hu : ContinuousAt (fun s => -(deriv h s * (h s)⁻¹)) 1 := (hdd.mul hinvh).neg
      have hu' : ContinuousAt (fun s => -(deriv h s / h s)) 1 := by
        have hE : (fun s => -(deriv h s / h s)) = fun s => -(deriv h s * (h s)⁻¹) := by
          funext s; simp [div_eq_mul_inv]
        rw [hE]; exact hu
      have hGeq : (fun s => if s = 1 then -(deriv h 1) else
          -deriv riemannZeta s / riemannZeta s - 1 / (s - 1))
          =ᶠ[𝓝 1] fun s => -(deriv h s / h s) := by
        filter_upwards [eventually_nhdsWithin_iff.mp key] with s hkeys
        by_cases hs : s = 1
        · subst hs; simp [h1]
        · simp only [if_neg hs]
          exact hkeys (by exact hs)
      exact (hu'.congr_of_eventuallyEq hGeq).continuousWithinAt
    · -- s₀ ≠ 1: the branch is continuous at s₀ (ζ analytic, ζ s₀ ≠ 0, s₀ ≠ 1)
      have hζA : AnalyticAt ℂ riemannZeta s₀ :=
        analyticOn_riemannZeta s₀ (by simpa using h₀)
      have hdζc : ContinuousAt (deriv riemannZeta) s₀ := hζA.deriv.continuousAt
      have hζc : ContinuousAt riemannZeta s₀ := hζA.continuousAt
      have hζ0 : riemannZeta s₀ ≠ 0 := riemannZeta_ne_zero_of_one_le_re (by simpa using hs₀)
      have hinvζ : ContinuousAt (fun s => (riemannZeta s)⁻¹) s₀ := hζc.inv₀ hζ0
      have hsub : ContinuousAt (fun s : ℂ => s - 1) s₀ := by fun_prop
      have hinvs : ContinuousAt (fun s => (s - 1)⁻¹) s₀ :=
        hsub.inv₀ (sub_ne_zero.2 h₀)
      have hbran : ContinuousAt
          (fun s => -deriv riemannZeta s / riemannZeta s - 1 / (s - 1)) s₀ := by
        have hE : (fun s : ℂ => -deriv riemannZeta s / riemannZeta s - 1 / (s - 1))
            = fun s => -(deriv riemannZeta s * (riemannZeta s)⁻¹) - (s - 1)⁻¹ := by
          funext s; simp [div_eq_mul_inv, one_div]
        rw [hE]
        exact ((hdζc.mul hinvζ).neg).sub hinvs
      have hGeq : (fun s => if s = 1 then -(deriv h 1) else
          -deriv riemannZeta s / riemannZeta s - 1 / (s - 1))
          =ᶠ[𝓝 s₀]
          fun s => -deriv riemannZeta s / riemannZeta s - 1 / (s - 1) := by
        filter_upwards [(isOpen_ne (x := (1 : ℂ))).mem_nhds h₀] with s hs
        simp only [if_neg hs]
      exact (hbran.congr_of_eventuallyEq hGeq).continuousWithinAt
  · -- EqOn on {1 < re} (second conjunct): s ≠ 1 there, so the `if` picks the branch
    intro s hs
    have hs1 : s ≠ 1 := by intro rfl; simp at hs
    simp only [if_neg hs1]

/-! ### M3 — Chebyshev dictionary: the `bound` hypothesis of Wiener–Ikehara for Λ -/

/-- **M3.** The partial sums of the von Mangoldt function satisfy the Chebyshev-form bound
`∑_{i<n} Λ i ≤ C·n` with `C = log 4 + 4`, from `Chebyshev.psi_le_const_mul_self`
(Chebyshev.lean:485) through the dictionary `psi_eq_sum_Icc` (Chebyshev.lean:93). -/
theorem exists_range_sum_vonMangoldt_le :
    ∃ C : ℝ, ∀ n : ℕ,
      ∑ i ∈ Finset.range n, (ArithmeticFunction.vonMangoldt i : ℝ) ≤ C * n := by
  refine ⟨Real.log 4 + 4, fun n => ?_⟩
  match n with
  | 0 => simp
  | (n + 1) =>
    have hrw : Finset.range (n + 1) = Finset.Icc 0 n := Nat.range_succ_eq_Icc_zero n
    have hfl : ⌊(n : ℝ)⌋₊ = n := Nat.floor_natCast n
    have hψ : Chebyshev.psi (n : ℝ) = ∑ d ∈ Finset.Icc 0 n, ArithmeticFunction.vonMangoldt d := by
      have := Chebyshev.psi_eq_sum_Icc (n : ℝ)
      rwa [hfl] at this
    have hle : Chebyshev.psi (n : ℝ) ≤ (Real.log 4 + 4) * (n : ℝ) :=
      Chebyshev.psi_le_const_mul_self (by positivity)
    have hcast : (Real.log 4 + 4) * ((n : ℝ) + 1) = (Real.log 4 + 4) * ((n + 1 : ℕ) : ℝ) := by
      push_cast; ring
    calc ∑ i ∈ Finset.range (n + 1), (ArithmeticFunction.vonMangoldt i : ℝ)
        = ∑ d ∈ Finset.Icc 0 n, ArithmeticFunction.vonMangoldt d := by rw [hrw]
      _ = Chebyshev.psi (n : ℝ) := hψ.symm
      _ ≤ (Real.log 4 + 4) * (n : ℝ) := hle
      _ ≤ (Real.log 4 + 4) * ((n + 1 : ℕ) : ℝ) := by
          rw [← hcast]
          exact mul_le_mul_of_nonneg_left (by exact_mod_cast Nat.le_succ n) (by positivity)

/-! ### M4 — ψ(x)/x → 1 (dossier 22 Tier-1a; the pilot's acceptance bar) -/

/-- **M4.** `Chebyshev.psi x / x → 1` as `x → ∞` — the Prime Number Theorem in ψ-form,
assembled from M2 + M3 + `WienerIkehara.tendsto_sum_range_div` (WienerIkehara.lean:693) and
`ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div` (Dirichlet.lean:439). -/
theorem tendsto_psi_div_atTop :
    Tendsto (fun x : ℝ => Chebyshev.psi x / x) atTop (𝓝 1) := by
  obtain ⟨C, hC⟩ := exists_range_sum_vonMangoldt_le
  obtain ⟨G, hGcont, hGeq⟩ := exists_logDerivExtension
  -- the Wiener–Ikehara hypothesis `hG'` (agreement on re s > 1)
  have hG' : Set.EqOn G
      (fun s => LSeries (fun n => ((ArithmeticFunction.vonMangoldt n : ℝ) : ℂ)) s
        - ((1 : ℝ) : ℂ) / (s - 1)) {s : ℂ | 1 < s.re} := by
    intro s hs
    show G s = LSeries (fun n => ((ArithmeticFunction.vonMangoldt n : ℝ) : ℂ)) s
      - ((1 : ℝ) : ℂ) / (s - 1)
    have h1 : G s = -deriv riemannZeta s / riemannZeta s - 1 / (s - 1) := hGeq hs
    have h2 : LSeries (fun n => ((ArithmeticFunction.vonMangoldt n : ℝ) : ℂ)) s
        = -deriv riemannZeta s / riemannZeta s :=
      ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div hs
    rw [h1, h2, Complex.ofReal_one]
  have hmain :=
    WienerIkehara.tendsto_sum_range_div (f := fun n => (ArithmeticFunction.vonMangoldt n : ℝ))
      (C := C) (A := 1) (G := G) hC hGcont hG' (fun n => ArithmeticFunction.vonMangoldt_nonneg)
  -- ψ x = ∑_{i < ⌊x⌋₊+1} Λ i
  have hψsum : ∀ x : ℝ, Chebyshev.psi x
      = ∑ i ∈ Finset.range (⌊x⌋₊ + 1), (ArithmeticFunction.vonMangoldt i : ℝ) := by
    intro x
    rw [Chebyshev.psi_eq_sum_Icc x, Nat.range_succ_eq_Icc_zero]
  -- factor the tendsto through N = ⌊x⌋₊ + 1
  have hN : Tendsto (fun x : ℝ => ⌊x⌋₊ + 1) atTop atTop :=
    (tendsto_add_atTop_nat 1).comp tendsto_nat_floor_atTop
  have hfac1 : Tendsto (fun x : ℝ =>
      (∑ i ∈ Finset.range (⌊x⌋₊ + 1), (ArithmeticFunction.vonMangoldt i : ℝ))
        / ((⌊x⌋₊ + 1 : ℕ) : ℝ)) atTop (𝓝 1) := hmain.comp hN
  have hfac2 : Tendsto (fun x : ℝ => (((⌊x⌋₊ : ℕ) : ℝ) + 1) / x) atTop (𝓝 1) := by
    have h1 : Tendsto (fun x : ℝ => ((⌊x⌋₊ : ℕ) : ℝ) / x) atTop (𝓝 1) :=
      tendsto_nat_floor_div_atTop
    have h2 : Tendsto (fun x : ℝ => (1 : ℝ) / x) atTop (𝓝 0) := by
      simpa using tendsto_inv_atTop_zero
    have heq : (fun x : ℝ => (((⌊x⌋₊ : ℕ) : ℝ) + 1) / x)
        = fun x : ℝ => ((⌊x⌋₊ : ℕ) : ℝ) / x + (1 : ℝ) / x := by
      funext x; rw [add_div]
    rw [heq]
    simpa using h1.add h2
  have hsplit : (fun x : ℝ => Chebyshev.psi x / x) =ᶠ[atTop]
      fun x : ℝ => ((∑ i ∈ Finset.range (⌊x⌋₊ + 1), (ArithmeticFunction.vonMangoldt i : ℝ))
        / (((⌊x⌋₊ : ℕ) : ℝ) + 1)) * ((((⌊x⌋₊ : ℕ) : ℝ) + 1) / x) := by
    filter_upwards [eventually_ge_atTop (1 : ℝ)] with x hx
    have hx0 : (x : ℝ) ≠ 0 := by positivity
    have ha : (((⌊x⌋₊ : ℕ) : ℝ) + 1) ≠ 0 := by positivity
    rw [hψsum x]
    field_simp
  have hprod : Tendsto (fun x : ℝ =>
      (∑ i ∈ Finset.range (⌊x⌋₊ + 1), (ArithmeticFunction.vonMangoldt i : ℝ))
        / (((⌊x⌋₊ : ℕ) : ℝ) + 1) * ((((⌊x⌋₊ : ℕ) : ℝ) + 1) / x)) atTop (𝓝 1) := by
    simpa using hfac1.mul hfac2
  exact Tendsto.congr' hsplit.symm hprod

/-! ### Tier 2 (statement-only; the next phase's target — NOT proved here) -/

/-- **Tier-2a shape** (dossier 22 `22-quasi-rh-pnt-effective.md` T2a; statement-only).
From openai-math's quasi-RH zero-free band `riemannZeta_ne_zero_of_seven_eighths_lt_re`
(`openai-math/lean/ComparatorChallenges/QuasiRiemannHypothesis.lean:7`): for every ε > 0
there is C_ε with `|ψ x − x| ≤ C_ε · x ^ (7/8 + ε)` for all x ≥ 2. -/
def stmt_Tier2 : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x →
    |Chebyshev.psi x - x| ≤ C * x ^ (7 / 8 + ε)

end CrossMath.Pilot22

#print axioms CrossMath.Pilot22.exists_tendsto_riemannZeta_sub_inv
#print axioms CrossMath.Pilot22.exists_logDerivExtension
#print axioms CrossMath.Pilot22.exists_range_sum_vonMangoldt_le
#print axioms CrossMath.Pilot22.tendsto_psi_div_atTop
