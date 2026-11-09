/-
Pilot 32-M1 — rc-savings-frontier core (LevelSystem-free), lane R7, 2026-11-09.

Target: mathlib `ff2494ea` (toolchain leanprover/lean4:v4.36.0-rc2), kernel-only.
No `sorry`, no `native_decide`, no external CAS.

Definitions transcribed verbatim (shapes) from the read-only sibling
`anthropics_formal-math/3sum-apsp/PaperStatements.lean`:
  entropy :2006   lnΛ :2011   Rc :2015   epsStar :2018   rhoC :2021   gammaOf :2024
(We write `9/10` for the printed `0.9`.)

Donor statements RE-PROVED independently (Solution-layer proofs NOT ported; per
R9 port-probe §4 proof ports are tactic-churn M):
  Sec4_Rc_strictAntiOn  PaperStatements.lean:2319–2321 (γ=0 case) → Rc_strictAntiOn_zero
  evaluation at (10,0) behind Sec4_Rc_zero_tendsto :2325        → lnΛ_10_0, Rc_10_0
  Sec4_Rc_lt_epsStar    PaperStatements.lean:2334–2335          → Rc_lt_epsStar

New theorems of dossier 32 (research/candidates/32-rc-savings-frontier.md):
  A(i)    Rc antitone in γ               → Rc_antitone_gamma
  A(ii)   lnΛ(10,0) = 5·ln10             → lnΛ_10_0  (NO binder: direct rational-log proof)
  A(iii)  unique crossing                → crossing_unique; frontier formula frontier_of_crossing
  A(iv)/B phase transition at ε*         → ceiling, frontier_nonempty_iff

Formulation decision (blueprint §2): the log identity is provable directly via
`Real.log_div`/`Real.log_mul` + `ring`; no multiplicative reformulation, no
hΛ binder anywhere. The c-monotonicity margin uses only rational comparisons
((10/3)² = 100/9 > 10/9), so no `e`-bounds are needed either.
-/

import Mathlib

open Set

noncomputable section

/-! ## Transcribed definitions (3sum-apsp PaperStatements.lean) -/

/-- Section 4.4: `H(x) := -x ln x - (1-x) ln(1-x)` (PaperStatements.lean:2006). -/
noncomputable def entropy (θ : ℝ) : ℝ := -θ * Real.log θ - (1 - θ) * Real.log (1 - θ)

/-- Section 4.4: `lnΛ c γ := c ln 10 - (1/2) c H(1/c) - (c-1) ln 3 + γ ln 4`
(PaperStatements.lean:2011). -/
noncomputable def lnΛ (c γ : ℝ) : ℝ :=
  c * Real.log 10 - (1 / 2) * c * entropy (1 / c) - (c - 1) * Real.log 3 + γ * Real.log 4

/-- Equation (11): `R_c(γ) := ln 4 / ln Λ` (PaperStatements.lean:2015). -/
noncomputable def Rc (c γ : ℝ) : ℝ := Real.log 4 / lnΛ c γ

/-- Section 4.1: `ε* := ln 4 / (5 ln 10)` (PaperStatements.lean:2018). -/
noncomputable def epsStar : ℝ := Real.log 4 / (5 * Real.log 10)

/-- Corollary 31: `ρ_c := 9/(c-1)` (PaperStatements.lean:2021). -/
noncomputable def rhoC (c : ℝ) : ℝ := 9 / (c - 1)

/-- Corollary 31: `γ := θ ln(1/ρ_c) / ln 4` (PaperStatements.lean:2024). -/
noncomputable def gammaOf (c θ : ℝ) : ℝ := θ * Real.log (1 / rhoC c) / Real.log 4

/-! ## Log and division helpers -/

lemma log4_pos : 0 < Real.log 4 := Real.log_pos (by norm_num)
lemma log10_pos : 0 < Real.log 10 := Real.log_pos (by norm_num)

lemma div_lt_div_same {A B L : ℝ} (hL : 0 < L) (h : A < B) : A / L < B / L := by
  apply (div_lt_iff₀ hL).mpr
  have hBL : (B / L) * L = B := by field_simp
  linarith

lemma div_inv_lt {x a b : ℝ} (hx : 0 < x) (ha : 0 < a) (h : a < b) : x / b < x / a := by
  rw [div_eq_mul_inv, div_eq_mul_inv]
  exact mul_lt_mul_of_pos_left (inv_strictAnti₀ ha h) hx

lemma div_inv_le {x a b : ℝ} (hx : 0 < x) (ha : 0 < a) (h : a ≤ b) : x / b ≤ x / a := by
  rw [div_eq_mul_inv, div_eq_mul_inv]
  exact mul_le_mul_of_nonneg_left (inv_anti₀ ha h) (le_of_lt hx)

lemma one_div_rhoC {c : ℝ} (hc : c ≠ 9) : 1 / rhoC c = (c - 1) / 9 := by
  unfold rhoC; field_simp

lemma gammaOf_eq {c θ : ℝ} (hc : c ≠ 9) :
    gammaOf c θ = θ * Real.log ((c - 1) / 9) / Real.log 4 := by
  unfold gammaOf; rw [one_div_rhoC hc]

lemma log_quot_pos {c : ℝ} (hc : 10 < c) : 0 < Real.log ((c - 1) / 9) := by
  apply Real.log_pos
  rw [one_lt_div (by norm_num : (0:ℝ) < 9)]
  linarith

lemma gammaOf_pos {c θ : ℝ} (hc : 10 < c) (hθ : 0 < θ) : 0 < gammaOf c θ := by
  rw [gammaOf_eq (by linarith : c ≠ 9)]
  exact div_pos (mul_pos hθ (log_quot_pos hc)) log4_pos

lemma gammaOf_lt_of_lt {c : ℝ} (hc : 10 < c) {θ₁ θ₂ : ℝ} (h : θ₁ < θ₂) :
    gammaOf c θ₁ < gammaOf c θ₂ := by
  rw [gammaOf_eq (by linarith : c ≠ 9), gammaOf_eq (by linarith : c ≠ 9)]
  exact div_lt_div_same log4_pos
    (mul_lt_mul_of_pos_right h (log_quot_pos hc))

lemma gammaOf_strictMono {c₁ c₂ : ℝ} (h₁ : 10 < c₁) (h : c₁ < c₂) :
    gammaOf c₁ (9 / 10 : ℝ) < gammaOf c₂ (9 / 10 : ℝ) := by
  rw [gammaOf_eq (by linarith : c₁ ≠ 9), gammaOf_eq (by linarith : c₂ ≠ 9)]
  have hpos1 : 0 < (c₁ - 1) / 9 := by apply div_pos <;> linarith
  have hpos2 : 0 < (c₂ - 1) / 9 := by apply div_pos <;> linarith
  have hlog : Real.log ((c₁ - 1) / 9) < Real.log ((c₂ - 1) / 9) := by
    apply Real.log_lt_log hpos1
    exact div_lt_div_same (by norm_num : (0:ℝ) < 9) (by linarith)
  exact div_lt_div_same log4_pos
    (mul_lt_mul_of_pos_left hlog (by norm_num : (0:ℝ) < 9 / 10))

/-! ## Theorem A(ii): the evaluation identity `lnΛ 10 0 = 5 · log 10` -/

theorem lnΛ_10_0 : lnΛ 10 0 = 5 * Real.log 10 := by
  have h1 : Real.log ((1:ℝ) / 10) = -(Real.log 10) := by
    rw [one_div, Real.log_inv 10]
  have h2 : Real.log ((9:ℝ) / 10) = 2 * Real.log 3 - Real.log 10 := by
    rw [Real.log_div (by norm_num : ((9:ℝ)) ≠ 0) (by norm_num : ((10:ℝ)) ≠ 0)]
    have h9 : ((9:ℝ)) = 3 * 3 := by norm_num
    rw [h9, Real.log_mul (by norm_num : ((3:ℝ)) ≠ 0) (by norm_num : ((3:ℝ)) ≠ 0)]
    norm_num
    try ring
  have hOne : (1:ℝ) - 1 / 10 = 9 / 10 := by norm_num
  have hH : entropy ((1:ℝ) / 10) = Real.log 10 - (9 / 5) * Real.log 3 := by
    unfold entropy; rw [h1, hOne, h2]; ring
  unfold lnΛ
  simp only [zero_mul]
  rw [hH]
  ring

theorem Rc_10_0 : Rc 10 0 = epsStar := by
  unfold Rc epsStar; rw [lnΛ_10_0]

/-! ## Affinity in γ -/

theorem lnΛ_affine (c γ : ℝ) : lnΛ c γ = lnΛ c 0 + γ * Real.log 4 := by
  unfold lnΛ; ring

/-! ## Monotonicity in `c` via `lnΛ c 0 = c·L + log 3 + F c / 2` -/

noncomputable def Lconst : ℝ := Real.log 10 - Real.log 3

lemma Lconst_pos : 0 < Lconst := by
  have h : Lconst = Real.log (10 / 3) := by
    unfold Lconst
    rw [← Real.log_div (by norm_num : ((10:ℝ)) ≠ 0) (by norm_num : ((3:ℝ)) ≠ 0)]
  rw [h]; exact Real.log_pos (by norm_num)

lemma entropy_one_div {c : ℝ} (hc : 1 < c) :
    entropy (1 / c) = (1 / c) * Real.log c - ((c - 1) / c) * (Real.log (c - 1) - Real.log c) := by
  have hinv : Real.log (1 / c) = -(Real.log c) := by
    rw [one_div, Real.log_inv c]
  have hsub : 1 - 1 / c = (c - 1) / c := by field_simp
  unfold entropy
  rw [hinv, hsub, Real.log_div (by linarith : c - 1 ≠ 0) (by linarith : c ≠ 0)]
  ring

noncomputable def Ffun (c : ℝ) : ℝ := (c - 1) * Real.log (c - 1) - c * Real.log c

lemma lnΛ_decompose {c : ℝ} (hc : 1 < c) :
    lnΛ c 0 = c * Lconst + Real.log 3 + Ffun c / 2 := by
  unfold lnΛ Ffun Lconst; rw [entropy_one_div hc]; field_simp; ring

lemma hasDerivAt_Ffun {c : ℝ} (hc : 1 < c) :
    HasDerivAt Ffun (Real.log (c - 1) - Real.log c) c := by
  have h1 : HasDerivAt (fun x => x - 1) (1:ℝ) c :=
    (hasDerivAt_id (x := c)).sub (hasDerivAt_const (c := (1:ℝ)) (x := c))
  have h2 : HasDerivAt (fun x => Real.log (x - 1)) (1 / (c - 1)) c :=
    h1.log (by linarith)
  have h3 : HasDerivAt (fun x => (x - 1) * Real.log (x - 1))
      ((1:ℝ) * Real.log (c - 1) + (c - 1) * (1 / (c - 1))) c := h1.mul h2
  have h4 : HasDerivAt (fun x => Real.log x) (1 / c) c :=
    Real.hasDerivAt_log (ne_of_gt (by linarith : (0:ℝ) < c))
  have h5 : HasDerivAt (fun x => x * Real.log x) ((1:ℝ) * Real.log c + c * (1 / c)) c :=
    hasDerivAt_id.mul h4
  have hFinal : HasDerivAt (fun x => (x - 1) * Real.log (x - 1) - x * Real.log x)
      ((1:ℝ) * Real.log (c - 1) + (c - 1) * (1 / (c - 1))
        - ((1:ℝ) * Real.log c + c * (1 / c))) c := h3.sub h5
  have e1' : (c - 1) * (1 / (c - 1)) = 1 := by field_simp
  have e2' : c * (1 / c) = 1 := by field_simp
  have hde : ((1:ℝ) * Real.log (c - 1) + (c - 1) * (1 / (c - 1))
      - ((1:ℝ) * Real.log c + c * (1 / c))) = Real.log (c - 1) - Real.log c := by
    rw [e1', e2']; ring
  have hFeq : Ffun = fun x => (x - 1) * Real.log (x - 1) - x * Real.log x := by
    funext x; unfold Ffun; ring
  rw [← hFeq, hde] at hFinal
  exact hFinal

lemma deriv_Ffun_eq {c : ℝ} (hc : 1 < c) : deriv Ffun c = Real.log (c - 1) - Real.log c :=
  (hasDerivAt_Ffun hc).deriv

lemma log_quot_bound {ξ : ℝ} (hξ : 10 ≤ ξ) : Real.log (ξ / (ξ - 1)) ≤ Real.log (10 / 9) := by
  have h1 : 0 < ξ - 1 := by linarith
  have hle : ξ / (ξ - 1) ≤ 10 / 9 := by
    apply (le_div_iff₀ (by norm_num : (0:ℝ) < 9)).mpr
    have h9 : ξ / (ξ - 1) * 9 = ξ * 9 / (ξ - 1) := by ring
    rw [h9, div_le_iff₀ h1]
    nlinarith
  exact Real.log_le_log (by norm_num : (0:ℝ) < 10 / 9) hle

lemma Ffun_mvt {c₁ c₂ : ℝ} (h₁ : 10 ≤ c₁) (h : c₁ < c₂) :
    ∃ ξ, c₁ < ξ ∧ ξ < c₂ ∧ Ffun c₂ - Ffun c₁ = (c₂ - c₁) * (Real.log (ξ - 1) - Real.log ξ) := by
  have hopen : ∀ x ∈ Icc c₁ c₂, (1:ℝ) < x := fun x hx =>
    by have h := Set.mem_Icc.mp hx; linarith
  have hcont : ContinuousOn Ffun (Icc c₁ c₂) := by
    rw [continuousOn_iff_continuousWithinAt]
    intro x hx
    exact ((hasDerivAt_Ffun (hopen x hx)).continuousAt).continuousWithinAt
  have hdiff : DifferentiableOn ℝ Ffun (Ioo c₁ c₂) := fun x hx =>
    ((hasDerivAt_Ffun (by have h := Set.mem_Ioo.mp hx; linarith)).differentiableAt
      ).differentiableWithinAt
  obtain ⟨ξ, hξ, hsl⟩ := exists_deriv_eq_slope (f := Ffun) h hcont hdiff
  refine ⟨ξ, hξ.1, hξ.2, ?_⟩
  have hF : Ffun c₂ - Ffun c₁ = (c₂ - c₁) * deriv Ffun ξ := by
    rw [hsl]; field_simp
  rw [hF, deriv_Ffun_eq (by linarith : 1 < ξ)]

lemma Ffun_drop {c₁ c₂ : ℝ} (h₁ : 10 ≤ c₁) (h : c₁ < c₂) :
    (c₂ - c₁) * (-(Real.log (10 / 9))) ≤ Ffun c₂ - Ffun c₁ := by
  obtain ⟨ξ, hξ1, hξ2, heq⟩ := Ffun_mvt h₁ h
  have hb := log_quot_bound (by linarith : 10 ≤ ξ)
  have hd : Real.log (ξ - 1) - Real.log ξ = -(Real.log (ξ / (ξ - 1))) := by
    rw [Real.log_div (by linarith : ξ ≠ 0) (by linarith : ξ - 1 ≠ 0)]
    ring
  rw [heq, hd]
  have hdelta : 0 < c₂ - c₁ := sub_pos.mpr h
  apply mul_le_mul_of_nonneg_left _ (le_of_lt hdelta)
  exact neg_le_neg hb

lemma Ffun_anti {c₁ c₂ : ℝ} (h₁ : 10 ≤ c₁) (h : c₁ < c₂) : Ffun c₂ < Ffun c₁ := by
  obtain ⟨ξ, hξ1, hξ2, heq⟩ := Ffun_mvt h₁ h
  have hlog : Real.log (ξ - 1) - Real.log ξ < 0 := by
    have := Real.log_lt_log (by linarith : (0:ℝ) < ξ - 1) (by linarith : ξ - 1 < ξ)
    linarith
  have hdelta : 0 < c₂ - c₁ := sub_pos.mpr h
  have hlt : Ffun c₂ - Ffun c₁ < 0 := by
    rw [heq]
    nlinarith [hlog, hdelta]
  linarith

lemma kappa_pos : 0 < 2 * Lconst - Real.log (10 / 9) := by
  have h3 : ((10:ℝ) / 3) * (10 / 3) = 100 / 9 := by norm_num
  have h2L : 2 * Lconst = Real.log (100 / 9) := by
    unfold Lconst
    rw [← Real.log_div (by norm_num : ((10:ℝ)) ≠ 0) (by norm_num : ((3:ℝ)) ≠ 0), ← h3,
      Real.log_mul (by norm_num : (((10:ℝ)/3)) ≠ 0) (by norm_num : (((10:ℝ)/3)) ≠ 0)]
    ring
  rw [h2L]
  have hlt : Real.log (10 / 9) < Real.log (100 / 9) :=
    Real.log_lt_log (by norm_num : (0:ℝ) < 10 / 9) (by norm_num : (10/9:ℝ) < 100/9)
  linarith

theorem lnΛ_mono {c₁ c₂ : ℝ} (h₁ : 10 ≤ c₁) (h : c₁ < c₂) : lnΛ c₁ 0 < lnΛ c₂ 0 := by
  have hdec1 := lnΛ_decompose (by linarith : (1:ℝ) < c₁)
  have hdec2 := lnΛ_decompose (by linarith : (1:ℝ) < c₂)
  have hd := Ffun_drop h₁ h
  have hκ := kappa_pos
  have hdelta : 0 < c₂ - c₁ := sub_pos.mpr h
  rw [hdec1, hdec2]
  have hsplit : c₂ * Lconst = c₁ * Lconst + (c₂ - c₁) * Lconst := by ring
  rw [hsplit]
  have hkey : (c₂ - c₁) * (2 * Lconst - Real.log (10 / 9))
      ≤ 2 * ((c₁ * Lconst + Real.log 3 + (c₂ - c₁) * Lconst + Ffun c₂ / 2)
        - (c₁ * Lconst + Real.log 3 + Ffun c₁ / 2)) := by
    have hsplit' : (c₂ - c₁) * (2 * Lconst - Real.log (10 / 9))
        = 2 * ((c₂ - c₁) * Lconst) + (c₂ - c₁) * (-(Real.log (10 / 9))) := by ring
    have hgoal : 2 * ((c₁ * Lconst + Real.log 3 + (c₂ - c₁) * Lconst + Ffun c₂ / 2)
        - (c₁ * Lconst + Real.log 3 + Ffun c₁ / 2))
        = 2 * ((c₂ - c₁) * Lconst) + (Ffun c₂ - Ffun c₁) := by ring
    rw [hsplit', hgoal]
    exact add_le_add (le_refl _) hd
  have hpos := mul_pos hdelta hκ
  linarith

lemma lnΛ_upper {c : ℝ} (hc : 10 ≤ c) : lnΛ c 0 ≤ lnΛ 10 0 + (c - 10) * Lconst := by
  rcases eq_or_lt_of_le hc with rfl | hlt
  · simp
  · have hdecc := lnΛ_decompose (by linarith : (1:ℝ) < c)
    have hF10 : 10 * Lconst + Real.log 3 + Ffun 10 / 2 = 5 * Real.log 10 := by
      rw [← lnΛ_decompose (by norm_num : (1:ℝ) < 10), lnΛ_10_0]
    have hanti := Ffun_anti (by norm_num : (10:ℝ) ≤ 10) hlt
    rw [hdecc, lnΛ_10_0]
    have hsplit2 : c * Lconst = 10 * Lconst + (c - 10) * Lconst := by ring
    rw [hsplit2]
    have hF10' : 10 * Lconst + Real.log 3 + Ffun 10 / 2 + (c - 10) * Lconst
        = 5 * Real.log 10 + (c - 10) * Lconst := by rw [hF10]
    linarith

lemma lnΛ_pos {c : ℝ} (hc : 10 ≤ c) : 0 < lnΛ c 0 := by
  rcases eq_or_lt_of_le hc with rfl | hlt
  · rw [lnΛ_10_0]; positivity
  · have h10 : 0 < lnΛ 10 0 := by rw [lnΛ_10_0]; positivity
    exact lt_of_lt_of_le h10 (le_of_lt (lnΛ_mono hc hlt))

/-! ## Donor-shaped corollaries -/

/-- Donor shape `Sec4_Rc_strictAntiOn` (PaperStatements.lean:2319–2321) at γ = 0. -/
theorem Rc_strictAntiOn_zero : StrictAntiOn (fun c : ℝ => Rc c 0) (Set.Ici 10) := by
  intro a b ha hb hab
  have h10a : 10 ≤ a := Set.mem_Ici.mp ha
  have hLa : 0 < lnΛ a 0 := lnΛ_pos h10a
  have hLb : 0 < lnΛ b 0 := lnΛ_pos (Set.mem_Ici.mp hb)
  unfold Rc
  rw [div_eq_mul_inv, div_eq_mul_inv]
  exact mul_lt_mul_of_pos_left (inv_strictAnti₀ hLa (lnΛ_mono h10a hab)) log4_pos

/-- Theorem A(i): `Rc` strictly antitone in γ (on the positive-denominator domain). -/
theorem Rc_antitone_gamma {c γ γ' : ℝ} (hc : 10 ≤ c) (hγ : 0 ≤ γ) (h : γ < γ') :
    Rc c γ' < Rc c γ := by
  have hΛγ : 0 < lnΛ c γ := by rw [lnΛ_affine]; nlinarith [log4_pos]
  have hmono : lnΛ c γ < lnΛ c γ' := by
    rw [lnΛ_affine, lnΛ_affine]; nlinarith [log4_pos]
  unfold Rc
  rw [div_eq_mul_inv, div_eq_mul_inv]
  exact mul_lt_mul_of_pos_left (inv_strictAnti₀ hΛγ hmono) log4_pos

/-- Donor shape `Sec4_Rc_lt_epsStar` (PaperStatements.lean:2334–2335), re-proved. -/
theorem Rc_lt_epsStar {c γ : ℝ} (hc : 10 < c) (hγ : 0 ≤ γ) : Rc c γ < epsStar := by
  have hΛ0 : 0 < lnΛ c 0 := lnΛ_pos (le_of_lt hc)
  have hΛ10 : 0 < lnΛ 10 0 := by rw [lnΛ_10_0]; positivity
  have hmono := lnΛ_mono (le_of_lt hc) hc
  have hle : lnΛ c 0 ≤ lnΛ c γ := by rw [lnΛ_affine]; nlinarith [log4_pos]
  have h1 : Real.log 4 / lnΛ c γ ≤ Real.log 4 / lnΛ c 0 :=
    div_inv_le log4_pos hΛ0 hle
  have h2 : Real.log 4 / lnΛ c 0 < Real.log 4 / lnΛ 10 0 := by
    rw [div_eq_mul_inv, div_eq_mul_inv]
    exact mul_lt_mul_of_pos_left (inv_strictAnti₀ hΛ10 hmono) log4_pos
  rw [Rc, Rc, Rc_10_0]
  linarith

/-! ## gmax, the key equivalence, and the ceiling -/

/-- γ-maximal savings at width c for validity range ε (dossier 32, A.iii). -/
noncomputable def gmax (ε c : ℝ) : ℝ := (Real.log 4 / ε - lnΛ c 0) / Real.log 4

lemma lt_Rc_iff_gmax {ε c γ : ℝ} (hε : 0 < ε) (hc : 10 ≤ c) (hγ : 0 ≤ γ) :
    ε < Rc c γ ↔ γ < gmax ε c := by
  have hΛ0 : 0 < lnΛ c 0 := lnΛ_pos hc
  have hΛγ : 0 < lnΛ c γ := by rw [lnΛ_affine]; nlinarith [log4_pos]
  unfold Rc gmax
  rw [lnΛ_affine]
  constructor <;> intro h
  · rw [lt_div_iff₀ hΛγ] at h
    have e1 : γ * Real.log 4 < Real.log 4 / ε - lnΛ c 0 := by
      rw [lt_div_iff₀ hε]
      nlinarith [h, hε]
    exact (lt_div_iff₀ log4_pos).mpr e1
  · rw [lt_div_iff₀ hΛγ]
    have e1 := (lt_div_iff₀ log4_pos).mp h
    have e2 : (γ * Real.log 4 + lnΛ c 0) * ε < Real.log 4 := by
      rw [lt_div_iff₀ hε]
      linarith
    nlinarith [hε]

/-- The achievable set (dossier 32): the Corollary-31 certificate class. -/
def AchievableAt (ε γ : ℝ) : Prop :=
  ∃ c θ, 10 < c ∧ 0 < θ ∧ θ < 9 / 10 ∧ γ ≤ gammaOf c θ ∧ ε < Rc c (gammaOf c θ)

def FrontierSet (ε : ℝ) : Set ℝ := {γ | 0 < γ ∧ AchievableAt ε γ}

/-- Theorem B (ceiling direction): no certificate of the class at validity range
`ε ≥ ε*` — the PairCeiling-pattern statement (cf. `ceiling_law256_signed`,
zeta23 Zeta23/PairCeiling/Signed.lean:94). -/
theorem ceiling {ε : ℝ} (hε : epsStar ≤ ε) : FrontierSet ε = ∅ := by
  apply Set.eq_empty_iff_forall_notMem.mpr
  rintro γ ⟨hγ, c, θ, hc, hθ0, hθ1, hle, hRc⟩
  have hγθpos : 0 < gammaOf c θ := gammaOf_pos hc hθ0
  have := Rc_lt_epsStar hc (le_of_lt hγθpos)
  linarith

lemma gmax_strictAnti {ε : ℝ} (hε : 0 < ε) {c₁ c₂ : ℝ} (h₁ : 10 ≤ c₁) (h : c₁ < c₂) :
    gmax ε c₂ < gmax ε c₁ := by
  have hmono := lnΛ_mono h₁ h
  unfold gmax
  exact div_lt_div_same log4_pos (by linarith [hmono])

/-! ## Unique crossing (Theorem A(iii)) -/

def IsCrossing (ε c : ℝ) : Prop := gammaOf c (9 / 10 : ℝ) = gmax ε c

theorem crossing_unique {ε : ℝ} (hε : 0 < ε) {c₁ c₂ : ℝ} (h₁ : 10 < c₁) (h₂ : 10 < c₂)
    (e₁ : IsCrossing ε c₁) (e₂ : IsCrossing ε c₂) : c₁ = c₂ := by
  by_contra hne
  rcases lt_or_gt_of_ne hne with hlt | hlt
  · have hg := gammaOf_strictMono h₁ hlt
    have hd := gmax_strictAnti hε (le_of_lt h₁) hlt
    unfold IsCrossing at e₁ e₂
    linarith
  · have hg := gammaOf_strictMono h₂ hlt
    have hd := gmax_strictAnti hε (le_of_lt h₂) hlt
    unfold IsCrossing at e₁ e₂
    linarith

/-! ## The frontier formula (conditional on the crossing point) -/

noncomputable def theta_of (c γ : ℝ) : ℝ := (9 / 10 : ℝ) * γ / gammaOf c (9 / 10 : ℝ)

lemma gammaOf_nine_tenth_pos {c : ℝ} (hc : 10 < c) : 0 < gammaOf c (9 / 10 : ℝ) :=
  gammaOf_pos hc (by norm_num : (0:ℝ) < 9 / 10)

lemma theta_of_recover {c γ : ℝ} (hc : 10 < c) : gammaOf c (theta_of c γ) = γ := by
  have hg : gammaOf c (9 / 10 : ℝ)
      = (9 / 10 : ℝ) * Real.log ((c - 1) / 9) / Real.log 4 :=
    gammaOf_eq (by linarith : c ≠ 9)
  have hA : Real.log ((c - 1) / 9) * Real.log 4 ≠ 0 := by
    apply mul_ne_zero
    · exact ne_of_gt (log_quot_pos hc)
    · exact ne_of_gt log4_pos
  rw [theta_of, gammaOf_eq (by linarith : c ≠ 9), hg]
  field_simp
  ring

theorem membership_of_lt {ε : ℝ} (hε : 0 < ε) {cₓ : ℝ} (hc : 10 < cₓ)
    (e : IsCrossing ε cₓ)
    {y : ℝ} (hy0 : 0 < y) (hy : y < gammaOf cₓ (9 / 10 : ℝ)) : y ∈ FrontierSet ε := by
  have hg : 0 < gammaOf cₓ (9 / 10 : ℝ) := gammaOf_nine_tenth_pos hc
  have hrec : gammaOf c* (theta_of cₓ y) = y := theta_of_recover hc
  refine ⟨hy0, c*, theta_of cₓ y, hc, ?_, ?_, le_of_eq hrec.symm, ?_⟩
  · exact div_pos (mul_pos (by norm_num : (0:ℝ) < 9 / 10) hy0) hg
  · rw [theta_of, lt_div_iff₀ hg]
    exact mul_lt_mul_of_pos_left hy (by norm_num : (0:ℝ) < 9 / 10)
  · rw [hrec, lt_Rc_iff_gmax hε (le_of_lt hc) hy0]
    unfold IsCrossing at e
    linarith

theorem frontier_upper {ε : ℝ} (hε : 0 < ε) {cₓ : ℝ} (hc : 10 < cₓ) (e : IsCrossing ε cₓ)
    {γ : ℝ} (hγ : γ ∈ FrontierSet ε) : γ < gammaOf cₓ (9 / 10 : ℝ) := by
  obtain ⟨hγpos, c, θ, hC, hθ0, hθ1, hle, hRc⟩ := hγ
  have hγθpos : 0 < gammaOf c θ := gammaOf_pos hC hθ0
  have hθ9 : gammaOf c θ < gammaOf c (9 / 10 : ℝ) := gammaOf_lt_of_lt hC hθ1
  rw [lt_Rc_iff_gmax hε (le_of_lt hC) (le_of_lt hγθpos)] at hRc
  rcases lt_trichotomy c c* with hlt | heq | hgt
  · have h2 := gammaOf_strictMono hC hlt
    unfold IsCrossing at e
    linarith
  · subst heq
    unfold IsCrossing at e
    linarith
  · have h2 := gmax_strictAnti hε (le_of_lt hc) hgt
    unfold IsCrossing at e
    linarith

theorem frontier_of_crossing {ε : ℝ} (hε : 0 < ε) {cₓ : ℝ} (hc : 10 < cₓ)
    (e : IsCrossing ε cₓ) : sSup (FrontierSet ε) = gammaOf cₓ (9 / 10 : ℝ) := by
  have hg : 0 < gammaOf cₓ (9 / 10 : ℝ) := gammaOf_nine_tenth_pos hc
  have hhalf : gammaOf cₓ (9 / 10 : ℝ) / 2 ∈ FrontierSet ε :=
    membership_of_lt hε hc e (div_pos hg (by norm_num : (0:ℝ) < 2)) (by linarith)
  have hbb : BddAbove (FrontierSet ε) :=
    ⟨gammaOf cₓ (9 / 10 : ℝ), fun γ hγ => le_of_lt (frontier_upper hε hc e hγ)⟩
  apply le_antisymm
  · exact csSup_le hbb (fun γ hγ => le_of_lt (frontier_upper hε hc e hγ))
  · by_contra hnot
    have hlt : sSup (FrontierSet ε) < gammaOf cₓ (9 / 10 : ℝ) :=
      lt_of_le_of_ne (le_csSup hbb hhalf) (Ne.symm hnot)
    have hmm : (sSup (FrontierSet ε) + gammaOf cₓ (9 / 10 : ℝ)) / 2 ∈ FrontierSet ε :=
      membership_of_lt hε hc e (by
        have h1 := le_csSup hbb hhalf
        nlinarith [div_pos hg (by norm_num : (0:ℝ) < 2)]) (by linarith)
    have hle := le_csSup hbb hmm
    nlinarith

/-! ## Phase transition: nonempty iff below ε* (approach lemma, no donor tendsto) -/

theorem frontier_nonempty_iff {ε : ℝ} (hε : 0 < ε) :
    (FrontierSet ε).Nonempty ↔ ε < epsStar := by
  constructor
  · rintro ⟨γ, hγpos, c, θ, hc, hθ0, hθ1, hle, hRc⟩
    have hγθpos : 0 < gammaOf c θ := gammaOf_pos hc hθ0
    have := Rc_lt_epsStar hc (le_of_lt hγθpos)
    exact lt_of_le_of_lt hε (by linarith)
  · intro hlt
    rw [epsStar] at hlt
    have h5 : (0:ℝ) < 5 * Real.log 10 := by positivity
    have hlt' : ε * (5 * Real.log 10) < Real.log 4 := (lt_div_iff₀ h5).mp hlt
    have hden : 5 * Real.log 10 < Real.log 4 / ε := (lt_div_iff₀ hε).mp (by nlinarith [hlt'])
    set Δ : ℝ := (Real.log 4 / ε - 5 * Real.log 10) / (2 * Lconst) with hΔdef
    have hΔpos : 0 < Δ := div_pos (by linarith) (mul_pos (by norm_num : (0:ℝ) < 2) Lconst_pos)
    have hDL : Δ * Lconst = (Real.log 4 / ε - 5 * Real.log 10) / 2 := by
      have h2L : (2:ℝ) * Lconst ≠ 0 := mul_ne_zero two_ne_zero (ne_of_gt Lconst_pos)
      rw [hΔdef]
      field_simp
      try ring
    set c : ℝ := 10 + Δ with hcn
    have hc10 : 10 < c := by linarith
    have hΛc : lnΛ c 0 ≤ 5 * Real.log 10 + Δ * Lconst := by
      have hup := lnΛ_upper (by linarith : (10:ℝ) ≤ c)
      rw [lnΛ_10_0] at hup
      have hsplit : (c - 10) * Lconst = Δ * Lconst := by rw [hcn]; ring
      rw [hsplit] at hup
      exact hup
    have hΛlt : lnΛ c 0 < Real.log 4 / ε := by linarith
    have hgm : 0 < gmax ε c := by
      unfold gmax
      have : (0:ℝ) < Real.log 4 := log4_pos
      apply div_pos <;> linarith
    have hg9 : 0 < gammaOf c (9 / 10 : ℝ) := gammaOf_nine_tenth_pos hc10
    set y : ℝ := min (gmax ε c) (gammaOf c (9 / 10 : ℝ)) / 2 with hydef
    have hminpos : 0 < min (gmax ε c) (gammaOf c (9 / 10 : ℝ)) := lt_min hgm hg9
    have hy0 : 0 < y := by rw [hydef]; exact div_pos hminpos (by norm_num : (0:ℝ) < 2)
    have hyg : y < gmax ε c := by
      have h1 : min (gmax ε c) (gammaOf c (9 / 10 : ℝ)) ≤ gmax ε c := min_le_left _ _
      rw [hydef]; nlinarith
    have hy9 : y < gammaOf c (9 / 10 : ℝ) := by
      have h1 : min (gmax ε c) (gammaOf c (9 / 10 : ℝ)) ≤ gammaOf c (9 / 10 : ℝ) := min_le_right _ _
      rw [hydef]; nlinarith
    have hrec : gammaOf c (theta_of c y) = y := theta_of_recover hc10
    refine ⟨y, hy0, c, theta_of c y, hc10, ?_, ?_, le_of_eq hrec.symm, ?_⟩
    · exact div_pos (mul_pos (by norm_num : (0:ℝ) < 9 / 10) hy0) hg9
    · rw [theta_of, lt_div_iff₀ hg9]
      exact mul_lt_mul_of_pos_left hy9 (by norm_num : (0:ℝ) < 9 / 10)
    · rw [hrec, lt_Rc_iff_gmax hε (by linarith : (10:ℝ) ≤ c) hy0]
      exact hyg

#print axioms lnΛ_10_0
#print axioms Rc_10_0
#print axioms Rc_strictAntiOn_zero
#print axioms Rc_antitone_gamma
#print axioms Rc_lt_epsStar
#print axioms ceiling
#print axioms crossing_unique
#print axioms frontier_of_crossing
#print axioms frontier_nonempty_iff
