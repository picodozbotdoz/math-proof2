/-
Copyright (c) 2026 cross-math-fronttier contributors. Apache 2.0 (see repo LICENSE).

# Pilot 72, milestone P4.5 — the Kuwahara no-go gate (certified negative)

Lane A4, 2026-11-13. Specification: `research/pilots/72-prework.md` Appendix A;
dossier-level narrative: `research/candidates/72-area-law-inertial-defect.md` §C-neg (lane A9);
family fence for `research/candidates/74-surprisal-moment-hierarchy-ceilings.md`;
round-4 novelty §2 (`research/novelty/round-4.md`) decisive datum made executable.

Kernel-only artifact, math-proof1 standard: **no `sorry`, no `native_decide`, no external CAS**.
The Kuwahara construction (arXiv:2610.15199: gapped, finite-range, unique-ground-state 2D
Hamiltonians with volume-law Rényi-α entanglement for all 0 < α < 1) is **not** formalized; it
enters only as hypothesis binders (`hKL` below) — the EnclOK / dossier-50 pattern.

Substrate: mathlib `ff2494ea` @ `leanprover/lean4:v4.36.0-rc2` (tier-C per
`research/feasibility/quantum-info-substrate.md` §C/§D: every object below is either
probability-vector algebra or mathlib's own `Analysis/Matrix/Spectrum.lean` API).

## Contents
* `renyi`            — Rényi α-entropy (nats) of a probability vector.
* `sum_rpow_mul_le`  — two-term weighted AM-GM summed over a Finset (Hölder form); workhorse.
* N1  `renyi_antiMono`        — anti-monotonicity in α (0 < α ≤ β < 1).
* N2a `renyi_le_log_card`     — H_α ≤ log (card support)         (the H₀ ≥ H_α window).
* N2b `renyi_le_log_rank`     — H_α(eigenvalues ρ) ≤ log rank ρ  for PSD Hermitian ρ with
                                spectral normalization ∑ λ = 1: the log-Schmidt-rank bridge
                                (`Matrix.IsHermitian.rank_eq_card_non_zero_eigs`).
* N3a `renyi_area_law_nogo`   — no boundary-linear Rényi-α (0<α<1) area constant survives a
                                volume-law family.
* N3b `rank_area_law_nogo`    — the same for log Schmidt rank (round-4 decisive-datum form:
                                S₀ ≥ S_α pushes the Kuwahara refutation up to rank).
-/
import Mathlib.Analysis.MeanInequalities
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Analysis.Matrix.PosDef

namespace CrossMath.CNeg

open Real

/-! ## The Rényi functional of a spectrum -/

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Rényi α-entropy (nats) of a probability vector `p`, at exponents `α ≠ 1`.
For `0 < α` and `∑ p = 1` the inner sum is positive, so the log is well defined. -/
noncomputable def renyi (p : ι → ℝ) (α : ℝ) : ℝ := (1 / (1 - α)) * Real.log (∑ i, (p i) ^ α)

/-! ## The workhorse: summed weighted AM-GM (Hölder form) -/

/-- Two-number weighted AM-GM over ℝ: mathlib's Finset-weighted AM-GM
(`Real.geom_mean_le_arith_mean_weighted`, MeanInequalities.lean:129) at the two-point type
`Bool`. -/
private theorem amgm2 {x y θ : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) (hθ₁ : 0 ≤ θ) (hθ₂ : θ ≤ 1) :
    x ^ θ * y ^ (1 - θ) ≤ θ * x + (1 - θ) * y := by
  have hw : ∀ b ∈ (Finset.univ : Finset Bool), 0 ≤ (fun b => if b then θ else 1 - θ) b := by
    intro b _
    cases b
    · show (0 : ℝ) ≤ 1 - θ
      linarith
    · show (0 : ℝ) ≤ θ
      exact hθ₁
  have hsumw : ∑ b ∈ (Finset.univ : Finset Bool), (fun b => if b then θ else 1 - θ) b = 1 := by
    rw [Finset.sum_univ_bool]
    show (1 - θ) + θ = 1
    ring
  have hz : ∀ b ∈ (Finset.univ : Finset Bool), 0 ≤ (fun b => if b then x else y) b := by
    intro b _
    cases b
    · show (0 : ℝ) ≤ y
      exact hy
    · show (0 : ℝ) ≤ x
      exact hx
  have h := Real.geom_mean_le_arith_mean_weighted (Finset.univ : Finset Bool)
    (fun b => if b then θ else 1 - θ) (fun b => if b then x else y) hw hsumw hz
  rw [Finset.prod_univ_bool, Finset.sum_univ_bool] at h
  have h' : y ^ (1 - θ) * x ^ θ ≤ (1 - θ) * y + θ * x := h
  calc x ^ θ * y ^ (1 - θ)
      = y ^ (1 - θ) * x ^ θ := mul_comm _ _
    _ ≤ (1 - θ) * y + θ * x := h'
    _ = θ * x + (1 - θ) * y := by ring

/-- `(x / y) ^ a = x ^ a / y ^ a` for `y > 0` (from `Real.mul_rpow`, `Real.inv_rpow`). -/
private theorem div_rpow_eq {x : ℝ} (hx : 0 ≤ x) {y : ℝ} (hy : 0 < y) (a : ℝ) :
    (x / y) ^ a = x ^ a / y ^ a := by
  rw [div_eq_mul_inv, Real.mul_rpow hx (inv_nonneg.mpr hy.le), Real.inv_rpow hy.le,
    div_eq_inv_mul]
  exact mul_comm _ _

/-- **Weighted Hölder over a Finset**: for `f, g ≥ 0` on `s` and `θ ∈ [0, 1]`,
`∑_{i∈s} f i ^ θ * g i ^ (1-θ) ≤ (∑ f) ^ θ * (∑ g) ^ (1-θ)` (AM-GM normalization). -/
private theorem sum_rpow_mul_le {κ : Type*} [Fintype κ] [DecidableEq κ]
    (s : Finset κ) {f g : κ → ℝ} (hf : ∀ i ∈ s, 0 ≤ f i) (hg : ∀ i ∈ s, 0 ≤ g i)
    {θ : ℝ} (hθ₁ : 0 ≤ θ) (hθ₂ : θ ≤ 1) :
    ∑ i ∈ s, (f i ^ θ) * (g i ^ (1 - θ)) ≤ (∑ i ∈ s, f i) ^ θ * (∑ i ∈ s, g i) ^ (1 - θ) := by
  classical
  rcases eq_or_lt_of_le hθ₁ with rfl | hθ0
  · simp [Real.rpow_zero, Real.rpow_one]
  -- θ ∈ (0, 1].  Degenerate sums first.
  by_cases hF : ∑ i ∈ s, f i = 0
  · have hf0 : ∀ i ∈ s, f i = 0 := (Finset.sum_eq_zero_iff_of_nonneg hf).mp hF
    have hterm : ∀ i ∈ s, f i ^ θ * g i ^ (1 - θ) = 0 := fun i hi => by
      rw [hf0 i hi, Real.zero_rpow (ne_of_gt hθ0), zero_mul]
    rw [Finset.sum_congr rfl hterm, Finset.sum_const_zero, hF,
      Real.zero_rpow (ne_of_gt hθ0), zero_mul]
  by_cases hG : ∑ i ∈ s, g i = 0
  · have hg0 : ∀ i ∈ s, g i = 0 := (Finset.sum_eq_zero_iff_of_nonneg hg).mp hG
    rcases eq_or_lt_of_le hθ₂ with hθeq | hθ1
    · have h2 : (1 : ℝ) - θ = 0 := by rw [hθeq]; norm_num
      have hterm : ∀ i ∈ s, f i ^ θ * g i ^ (1 - θ) = f i := by
        intro i hi
        rw [h2, hg0 i hi, Real.rpow_zero, mul_one, hθeq, Real.rpow_one]
      have hrhs : (∑ i ∈ s, f i) ^ θ * (∑ i ∈ s, g i) ^ (1 - θ) = ∑ i ∈ s, f i := by
        rw [h2, hG, Real.rpow_zero, hθeq, Real.rpow_one, mul_one]
      rw [Finset.sum_congr rfl hterm, hrhs]
    · have hterm : ∀ i ∈ s, f i ^ θ * g i ^ (1 - θ) = 0 := fun i hi => by
        rw [hg0 i hi, Real.zero_rpow (by linarith : (1 : ℝ) - θ ≠ 0), mul_zero]
      rw [Finset.sum_congr rfl hterm, Finset.sum_const_zero, hG,
        Real.zero_rpow (by linarith : (1 : ℝ) - θ ≠ 0), mul_zero]
  -- Main case: F, G > 0, θ ∈ (0, 1].
  have hF0 : 0 < ∑ i ∈ s, f i := lt_of_le_of_ne (Finset.sum_nonneg hf) (Ne.symm hF)
  have hG0 : 0 < ∑ i ∈ s, g i := lt_of_le_of_ne (Finset.sum_nonneg hg) (Ne.symm hG)
  set F : ℝ := ∑ i ∈ s, f i with hFdef
  set G : ℝ := ∑ i ∈ s, g i with hGdef
  have hpos : 0 ≤ F ^ θ * G ^ (1 - θ) :=
    mul_nonneg (Real.rpow_nonneg hF0.le _) (Real.rpow_nonneg hG0.le _)
  have hnorm : ∀ i ∈ s, f i ^ θ * g i ^ (1 - θ)
      = F ^ θ * G ^ (1 - θ) * ((f i / F) ^ θ * (g i / G) ^ (1 - θ)) := by
    intro i hi
    rw [div_rpow_eq (hf i hi) hF0 θ, div_rpow_eq (hg i hi) hG0 θ]
    field_simp [Real.rpow_nonneg (hf i hi) _, Real.rpow_nonneg (hg i hi) _]
  have hsumAM : ∀ i ∈ s, (f i / F) ^ θ * (g i / G) ^ (1 - θ)
      ≤ θ * (f i / F) + (1 - θ) * (g i / G) :=
    fun i hi => amgm2 (div_nonneg (hf i hi) hF0.le) (div_nonneg (hg i hi) hG0.le)
      hθ0.le hθ₂
  have hsplit : ∑ i ∈ s, (θ * (f i / F) + (1 - θ) * (g i / G))
      = θ * (∑ i ∈ s, f i / F) + (1 - θ) * (∑ i ∈ s, g i / G) := by
    rw [← Finset.mul_sum, ← Finset.mul_sum, Finset.sum_add_distrib]
  have h1 : ∑ i ∈ s, f i / F = 1 := by
    rw [Finset.sum_div]
    field_simp
    exact hF0.ne'
  have h2 : ∑ i ∈ s, g i / G = 1 := by
    rw [Finset.sum_div]
    field_simp
    exact hG0.ne'
  calc ∑ i ∈ s, (f i ^ θ) * (g i ^ (1 - θ))
      = F ^ θ * G ^ (1 - θ) *
          ∑ i ∈ s, ((f i / F) ^ θ * (g i / G) ^ (1 - θ)) := by
        rw [Finset.mul_sum]
        exact Finset.sum_congr rfl (fun i hi => (hnorm i hi).symm)
    _ ≤ F ^ θ * G ^ (1 - θ) *
          (∑ i ∈ s, (θ * (f i / F) + (1 - θ) * (g i / G))) :=
        mul_le_mul_of_nonneg_left (Finset.sum_le_sum hsumAM) hpos
    _ = F ^ θ * G ^ (1 - θ) * 1 := by
        rw [hsplit, h1, h2]
        ring
    _ = F ^ θ * G ^ (1 - θ) := mul_one _

/-! ## Spectral helpers -/

/-- Some atom of a probability vector is positive. -/
private theorem exists_pos_of_sum_eq_one {p : ι → ℝ} (hp : ∀ i, 0 ≤ p i)
    (hp1 : ∑ i, p i = 1) : ∃ i, 0 < p i := by
  by_contra h
  push_neg at h
  have h0 : ∀ i, p i = 0 := fun i => le_antisymm (h i) (hp i)
  rw [Finset.sum_congr rfl (fun i _ => h0 i), Finset.sum_const_zero] at hp1
  norm_num at hp1

/-- The Rényi denominator of a probability vector at `0 < α` is positive. -/
private theorem sum_rpow_pos {p : ι → ℝ} (hp : ∀ i, 0 ≤ p i) (hp1 : ∑ i, p i = 1)
    {α : ℝ} (hα : 0 < α) : 0 < ∑ i, p i ^ α := by
  obtain ⟨i₀, hi₀⟩ := exists_pos_of_sum_eq_one hp hp1
  have hle : p i₀ ^ α ≤ ∑ i, p i ^ α :=
    Finset.single_le_sum (fun i _ => Real.rpow_nonneg (hp i) _) (Finset.mem_univ i₀)
  exact lt_of_lt_of_le (Real.rpow_pos_of_pos hi₀ α) hle

/-! ## N1: anti-monotonicity of the Rényi functional -/

/-- **N1** — Rényi anti-monotonicity: for `0 < α ≤ β < 1`, `H_β(p) ≤ H_α(p)`.
Route: the Hölder workhorse at `θ := (1-β)/(1-α)` gives `∑ p^β ≤ (∑ p^α)^θ`
(the chord inequality; `∑ p = 1` kills the second factor), then logs. -/
theorem renyi_antiMono {p : ι → ℝ} (hp : ∀ i, 0 ≤ p i) (hp1 : ∑ i, p i = 1)
    {α β : ℝ} (hα : 0 < α) (hαβ : α ≤ β) (hβ1 : β < 1) :
    renyi p β ≤ renyi p α := by
  have hβ0 : 0 < β := lt_of_lt_of_le hα hαβ
  have hA0 := sum_rpow_pos hp hp1 hα
  have hB0 := sum_rpow_pos hp hp1 hβ0
  have hθ0 : 0 < (1 - β) / (1 - α) := div_pos (by linarith) (by linarith)
  have hθ1 : (1 - β) / (1 - α) ≤ 1 := by
    rw [div_le_one₀ (by linarith : (0 : ℝ) < 1 - α)]
    linarith
  have hβexp : α * ((1 - β) / (1 - α)) + (1 - (1 - β) / (1 - α)) = β := by
    field_simp
    ring
  have hterm : ∀ i, (p i ^ α) ^ ((1 - β) / (1 - α)) * (p i ^ (1 - (1 - β) / (1 - α)))
      = p i ^ β := by
    intro i
    rw [← Real.rpow_mul (hp i), ← Real.rpow_add' (hp i) (by rw [hβexp]; linarith), hβexp]
  have hH := sum_rpow_mul_le (Finset.univ : Finset ι) (fun i _ => hp i) (fun i _ => hp i)
    hθ0.le hθ1
  rw [hp1] at hH
  simp only [Real.one_rpow, mul_one] at hH
  have hEq : ∑ i, (p i ^ α) ^ ((1 - β) / (1 - α)) * (p i ^ (1 - (1 - β) / (1 - α)))
      = ∑ i, p i ^ β := Finset.sum_congr rfl (fun i _ => hterm i)
  rw [hEq] at hH
  have hlog := Real.log_le_log hB0 hH
  rw [Real.log_rpow hA0] at hlog
  have hkey : (1 / (1 - β)) * (((1 - β) / (1 - α)) * Real.log (∑ i, p i ^ α))
      = (1 / (1 - α)) * Real.log (∑ i, p i ^ α) := by
    field_simp
    ring
  calc renyi p β
      = (1 / (1 - β)) * Real.log (∑ i, p i ^ β) := rfl
    _ ≤ (1 / (1 - β)) * (((1 - β) / (1 - α)) * Real.log (∑ i, p i ^ α)) :=
        mul_le_mul_of_nonneg_left hlog
          (div_nonneg zero_le_one (le_of_lt (by linarith : (0 : ℝ) < 1 - β)))
    _ = (1 / (1 - α)) * Real.log (∑ i, p i ^ α) := hkey
    _ = renyi p α := rfl

/-! ## N2: the support and rank bridges -/

/-- **N2a** — the α-window sits under the support size: for `0 < α < 1`,
`H_α(p) ≤ log (card {i // 0 < p i})` (the `H₀ ≥ H_α` instance; workhorse at `g ≡ 1`). -/
theorem renyi_le_log_card {p : ι → ℝ} (hp : ∀ i, 0 ≤ p i) (hp1 : ∑ i, p i = 1)
    {α : ℝ} (hα : 0 < α) (hα1 : α < 1) :
    renyi p α ≤ Real.log (Fintype.card {i // 0 < p i}) := by
  have hA0 := sum_rpow_pos hp hp1 hα
  obtain ⟨i₀, hi₀⟩ := exists_pos_of_sum_eq_one hp hp1
  set s : Finset ι := Finset.univ.filter (fun i => 0 < p i) with hsdef
  have hzp : ∀ i, i ∉ s → p i = 0 := by
    intro i hi
    have hi' : p i ≤ 0 := by
      simp only [hsdef, Finset.mem_filter, Finset.mem_univ, true_and, not_lt] at hi
      exact hi
    exact le_antisymm hi' (hp i)
  have hsumα : ∑ i ∈ s, p i ^ α = ∑ i, p i ^ α :=
    Finset.sum_subset (Finset.filter_subset _ Finset.univ)
      (fun i _ hi => by rw [hzp i hi, Real.zero_rpow (ne_of_gt hα)])
  have hsub : ∑ i ∈ s, p i = ∑ i, p i :=
    Finset.sum_subset (Finset.filter_subset _ Finset.univ)
      (fun i _ hi => by rw [hzp i hi])
  have hsum1 : ∑ i ∈ s, p i = 1 := by rw [hsub, hp1]
  have hH := sum_rpow_mul_le s (fun i _ => hp i) (fun _ _ => (zero_le_one : (0 : ℝ) ≤ 1))
    hα.le hα1.le
  simp only [Real.one_rpow, mul_one] at hH
  rw [hsum1] at hH
  simp only [Real.one_rpow, mul_one] at hH
  have hcard : Fintype.card {i // 0 < p i} = s.card :=
    Fintype.card_ofFinset s (by
      intro x
      rw [hsdef, Finset.mem_filter]
      exact ⟨fun h => h.2, fun h => ⟨Finset.mem_univ x, h⟩⟩)
  have hcardpos : 0 < (s.card : ℝ) := by
    have hsne : s.Nonempty := ⟨i₀, by
      rw [hsdef, Finset.mem_filter]
      exact ⟨Finset.mem_univ i₀, hi₀⟩⟩
    exact_mod_cast hsne.card_pos
  calc renyi p α
      = (1 / (1 - α)) * Real.log (∑ i ∈ s, p i ^ α) := by rw [renyi, hsumα]
    _ ≤ (1 / (1 - α)) * Real.log ((s.card : ℝ) ^ (1 - α)) :=
        mul_le_mul_of_nonneg_left (Real.log_le_log (by rw [← hsumα]; exact hA0) hH)
          (div_nonneg zero_le_one (le_of_lt (by linarith : (0 : ℝ) < 1 - α)))
    _ = (1 / (1 - α)) * ((1 - α) * Real.log (s.card : ℝ)) := by
        rw [Real.log_rpow hcardpos]
    _ = Real.log (Fintype.card {i // 0 < p i}) := by
        rw [hcard]
        field_simp
        ring

/-- **N2b** — the rank bridge: for PSD Hermitian `M` with spectral normalization
`∑ (hM.eigenvalues) = 1`, `H_α(eigenvalues M) ≤ log M.rank`.  For `M` a reduced density
matrix, `M.rank` is the Schmidt rank across the cut. -/
theorem renyi_le_log_rank {n : Type*} [Fintype n] [DecidableEq n] {𝕜 : Type*} [RCLike 𝕜]
    {M : Matrix n n 𝕜} (hM : M.IsHermitian) (hpsd : M.PosSemidef)
    (hΣ : ∑ i, hM.eigenvalues i = 1) {α : ℝ} (hα : 0 < α) (hα1 : α < 1) :
    renyi hM.eigenvalues α ≤ Real.log M.rank := by
  have hnn : ∀ i, 0 ≤ hM.eigenvalues i := fun i => hpsd.eigenvalues_nonneg i
  have h1 := renyi_le_log_card hnn hΣ hα hα1
  obtain ⟨i₀, hi₀⟩ : ∃ i, 0 < hM.eigenvalues i := by
    by_contra h
    push_neg at h
    have h0 : ∀ i, hM.eigenvalues i = 0 := fun i => le_antisymm (h i) (hnn i)
    rw [Finset.sum_congr rfl (fun i _ => h0 i), Finset.sum_const_zero] at hΣ
    norm_num at hΣ
  have hcardpos : 0 < (Fintype.card {i // 0 < hM.eigenvalues i} : ℝ) :=
    exact_mod_cast Fintype.card_pos_iff.mpr ⟨⟨i₀, hi₀⟩⟩
  have hcardle : (Fintype.card {i // 0 < hM.eigenvalues i} : ℝ) ≤ (M.rank : ℝ) := by
    have hle : Fintype.card {i // 0 < hM.eigenvalues i} ≤ M.rank := by
      rw [hM.rank_eq_card_non_zero_eigs]
      exact Fintype.card_le_of_injective (fun a => ⟨a.1, ne_of_gt a.2⟩)
        (fun a b h => Subtype.ext (congrArg Subtype.val h))
    exact_mod_cast hle
  exact le_trans h1 (Real.log_le_log hcardpos hcardle)

/-! ## N3: the Kuwahara no-go gates -/

/-- Scalar core of both gates: a volume-law scale (`c·n²`) cannot be dominated, through any
monotone intermediate, by a boundary-linear scale (`≤ C·n`). -/
private theorem nogo_core {c C : ℝ} (hc : 0 < c) (hC : 0 ≤ C)
    (x y b : ℕ → ℝ)
    (hvol : ∀ n : ℕ, c * (n : ℝ) ^ 2 ≤ x n) (hmono : ∀ n : ℕ, x n ≤ y n)
    (harea : ∀ n : ℕ, y n ≤ C * b n) (hb : ∀ n : ℕ, b n ≤ (n : ℝ)) : False := by
  by_cases hC0 : C = 0
  · subst hC0
    have h1 := hvol 1
    have h2 := hmono 1
    have h3 := harea 1
    rw [zero_mul] at h3
    norm_num at h1
    linarith
  · have hCpos : 0 < C := lt_of_le_of_ne hC (Ne.symm hC0)
    obtain ⟨N, hN⟩ : ∃ N : ℕ, C / c < (N : ℝ) := by
      refine ⟨(⌊C / c⌋₊ + 1 : ℕ), ?_⟩
      have h1 : (C / c : ℝ) ≤ ⌊C / c⌋₊ := Nat.floor_le (div_nonneg hC.le hc.le)
      have h2 : (⌊C / c⌋₊ : ℝ) < ((⌊C / c⌋₊ + 1 : ℕ) : ℝ) :=
        by exact_mod_cast (Nat.lt_succ_self ⌊C / c⌋₊)
      linarith
    have hNpos : 0 < (N : ℝ) := lt_of_le_of_lt (div_nonneg hC.le hc.le) hN
    have hCx : C < c * (N : ℝ) := by
      have hlt := (div_lt_iff₀ hc).mp hN
      rw [mul_comm] at hlt
      exact hlt
    have hchain : c * (N : ℝ) ^ 2 ≤ C * (N : ℝ) :=
      le_trans (le_trans (hvol N) (hmono N)) (le_trans (harea N) (hb N))
    have hle : c * (N : ℝ) ≤ C := by
      refine le_of_mul_le_mul_left ?_ hNpos
      calc (N : ℝ) * (c * N) = c * N ^ 2 := by ring
        _ ≤ C * N := hchain
        _ = (N : ℝ) * C := by ring
    linarith

/-- **N3a** — the Kuwahara gate, direct form: a volume-law Rényi-α family (external
hypothesis `hKL`, arXiv:2610.15199) refutes every boundary-linear Rényi-α area law
(`hArea`) at boundary scale `bndOf ≤ perimeter` (`hBnd`). -/
theorem renyi_area_law_nogo {α c C : ℝ} (hα : 0 < α) (hα1 : α < 1) (hc : 0 < c) (hC : 0 ≤ C)
    (renyiOf bndOf : ℕ → ℝ)
    (hKL : ∀ n : ℕ, c * (n : ℝ) ^ 2 ≤ renyiOf n)
    (hBnd : ∀ n : ℕ, bndOf n ≤ (n : ℝ))
    (hArea : ∀ n : ℕ, renyiOf n ≤ C * bndOf n) : False :=
  nogo_core hc hC renyiOf renyiOf bndOf hKL (fun _ => le_refl _) hArea hBnd

/-- **N3b** — the Kuwahara gate, Schmidt-rank form (round-4 decisive datum): with `hMono`
discharged per instance by `renyi_le_log_rank` (N2b), a volume-law Rényi-α family refutes
every boundary-linear **log-Schmidt-rank** area law. -/
theorem rank_area_law_nogo {α c C : ℝ} (hα : 0 < α) (hα1 : α < 1) (hc : 0 < c) (hC : 0 ≤ C)
    (rankLogOf renyiOf bndOf : ℕ → ℝ)
    (hKL : ∀ n : ℕ, c * (n : ℝ) ^ 2 ≤ renyiOf n)
    (hMono : ∀ n : ℕ, renyiOf n ≤ rankLogOf n)
    (hBnd : ∀ n : ℕ, bndOf n ≤ (n : ℝ))
    (hArea : ∀ n : ℕ, rankLogOf n ≤ C * bndOf n) : False :=
  nogo_core hc hC renyiOf rankLogOf bndOf hKL hMono hArea hBnd

end CrossMath.CNeg

-- audit (expect: [propext, Classical.choice, Quot.sound] only)
#print axioms CrossMath.CNeg.renyi_antiMono
#print axioms CrossMath.CNeg.renyi_le_log_card
#print axioms CrossMath.CNeg.renyi_le_log_rank
#print axioms CrossMath.CNeg.renyi_area_law_nogo
#print axioms CrossMath.CNeg.rank_area_law_nogo
