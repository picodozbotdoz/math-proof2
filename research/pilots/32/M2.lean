/-
Pilot 32-M2 — the crossing-existence discharge (article 32 §5), lane A6, 2026-11-17.
Iteration-4 run 12 (R2 §12.2, `qa/iter4-review/r2-discovery-strength.md`;
r5 backlog §14 row 12; week1-agenda row 1).

Discharges article 32 §5's "What is not formalized" paragraph verbatim-topic: the
crossing c*(ε) was a PARAMETER of M1's `frontier_of_crossing`; this file PROVES it
exists for every ε ∈ (0, ε*), making the frontier theorem unconditional parametric.
The paper's argument is the IVT on  c ↦ gammaOf c (9/10) − gmax ε c  on (10, ∞):
negative near 10⁺ (gammaOf → 0 while gmax ε 10 > 0 because ε < ε*), positive far
out (lnΛ c 0 ≥ 5·ln10 + (c−10)·κ/2 with κ = 2·Lconst − ln(10/9) > 0, so gmax → −∞
while gammaOf > 0), continuous on c > 10.

Statement forms 1–6 are R2 §12.2's missing-lemma list, verbatim names and shapes,
with one binder adaptation recorded here: forms 2/5/6 additionally carry
`0 < ε` as an explicit hypothesis. The spec's `ε < ε*` alone does not exclude
ε ≤ 0, and for ε ≤ 0 no crossing can exist (gmax ε c = (ln4/ε − lnΛ c 0)/ln4 < 0
< gammaOf c (9/10) whenever both are defined), so the positive-axis binder is the
faithful reading of the article's ε ∈ (0, ε*). Form 4 is stated exactly as specced
(no ε-sign hypothesis: continuity holds regardless).

File structure: SELF-CONTAINED (imports only Mathlib; Pb.lean "self-contained
carry" precedent). Everything between the CARRY markers is a verbatim carry of the
FROZEN `pilots/32/M1.lean` (GREEN run3 2026-11-09; axcheck-final/axcheck-c2-final;
run-12 log stamps the source sha256) minus the decls M2 does not consume
(`Rc_10_0`, `div_inv_le`, `Rc_strictAntiOn_zero`, `Rc_antitone_gamma`,
`Rc_lt_epsStar`, `ceiling`, `frontier_nonempty_iff`). M2 needs no sibling import,
so the generic multi-file runner semantics are untouched and the final-sweep
stage needs no cross-pilot `import M1` rewrite (the `M1` stem is overloaded across
pilots 10/20/22/32/42/50 in make_axcheck's rewrite map).

Target: mathlib `ff2494ea` (toolchain leanprover/lean4:v4.36.0-rc2), kernel-only.
No `sorry`, no `native_decide`, no external CAS.
-/

import Mathlib

open Set

noncomputable section

/-! ## CARRY BEGIN — verbatim from pilots/32/M1.lean (frozen at run3-green) -/

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
  have hc1 : c - 1 ≠ 0 := (show (0:ℝ) < c - 1 by linarith).ne'
  have hc0 : c ≠ 0 := (show (0:ℝ) < c by linarith).ne'
  have h1 : HasDerivAt (fun x : ℝ => x - 1) (1:ℝ) c := by
    first
    | exact (hasDerivAt_id' c).sub_const 1
    | exact HasDerivAt.sub_const 1 (hasDerivAt_id' c)
    | simpa using (hasDerivAt_id c).sub (hasDerivAt_const c (1:ℝ))
  have h2 : HasDerivAt (fun x => Real.log (x - 1)) (1 / (c - 1)) c :=
    h1.log hc1
  have h3 : HasDerivAt (fun x => (x - 1) * Real.log (x - 1))
      ((1:ℝ) * Real.log (c - 1) + (c - 1) * (1 / (c - 1))) c := h1.mul h2
  have h4 : HasDerivAt Real.log c⁻¹ c := Real.hasDerivAt_log hc0
  have h5 : HasDerivAt (fun x => x * Real.log x) ((1:ℝ) * Real.log c + c * c⁻¹) c :=
    (hasDerivAt_id' c).mul h4
  have e1' : (c - 1) * (1 / (c - 1)) = 1 := mul_one_div_cancel hc1
  have e2' : c * c⁻¹ = 1 := mul_inv_cancel₀ hc0
  have hde : ((1:ℝ) * Real.log (c - 1) + (c - 1) * (1 / (c - 1))
      - ((1:ℝ) * Real.log c + c * c⁻¹)) = Real.log (c - 1) - Real.log c := by
    rw [e1', e2']; ring
  first
  | exact (h3.sub h5).congr_deriv hde
  | (convert (h3.sub h5).congr_deriv hde using 1; funext x; simp [Ffun])

lemma deriv_Ffun_eq {c : ℝ} (hc : 1 < c) : deriv Ffun c = Real.log (c - 1) - Real.log c :=
  (hasDerivAt_Ffun hc).deriv

lemma log_quot_bound {ξ : ℝ} (hξ : 10 ≤ ξ) : Real.log (ξ / (ξ - 1)) ≤ Real.log (10 / 9) := by
  have h1 : 0 < ξ - 1 := by linarith
  have hle : ξ / (ξ - 1) ≤ 10 / 9 := by
    apply (le_div_iff₀ (by norm_num : (0:ℝ) < 9)).mpr
    have h9 : ξ / (ξ - 1) * 9 = ξ * 9 / (ξ - 1) := by ring
    rw [h9, div_le_iff₀ h1]
    nlinarith
  exact Real.log_le_log (div_pos (by linarith) h1) hle

lemma Ffun_mvt {c₁ c₂ : ℝ} (h₁ : 10 ≤ c₁) (h : c₁ < c₂) :
    ∃ ξ, c₁ < ξ ∧ ξ < c₂ ∧ Ffun c₂ - Ffun c₁ = (c₂ - c₁) * (Real.log (ξ - 1) - Real.log ξ) := by
  have hopen : ∀ x ∈ Icc c₁ c₂, (1:ℝ) < x := fun x hx =>
    by have h := Set.mem_Icc.mp hx; linarith
  have hcont : ContinuousOn Ffun (Icc c₁ c₂) := by
    intro x hx
    exact ((hasDerivAt_Ffun (hopen x hx)).continuousAt).continuousWithinAt
  have hdiff : DifferentiableOn ℝ Ffun (Ioo c₁ c₂) := fun x hx =>
    ((hasDerivAt_Ffun (by have h := Set.mem_Ioo.mp hx; linarith)).differentiableAt
      ).differentiableWithinAt
  obtain ⟨ξ, hξ, hsl⟩ := exists_deriv_eq_slope (f := Ffun) h hcont hdiff
  refine ⟨ξ, hξ.1, hξ.2, ?_⟩
  have hne : c₂ - c₁ ≠ 0 := (sub_pos.mpr h).ne'
  have hF : Ffun c₂ - Ffun c₁ = (c₂ - c₁) * deriv Ffun ξ := by
    rw [hsl]; field_simp
  rw [hF, deriv_Ffun_eq (by linarith [hξ.1] : 1 < ξ)]

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
    exact lt_of_lt_of_le h10 (le_of_lt (lnΛ_mono (le_refl _) hlt))

/-- `lnΛ c γ > 0` on the whole domain `c ≥ 10`, `γ ≥ 0`. -/
lemma lnΛ_pos_gamma {c γ : ℝ} (hc : 10 ≤ c) (hγ : 0 ≤ γ) : 0 < lnΛ c γ := by
  have e := lnΛ_affine c γ
  have h0 := lnΛ_pos hc
  have hp := mul_nonneg hγ log4_pos.le
  linarith

/-! ## gmax, the key equivalence -/

/-- γ-maximal savings at width c for validity range ε (dossier 32, A.iii). -/
noncomputable def gmax (ε c : ℝ) : ℝ := (Real.log 4 / ε - lnΛ c 0) / Real.log 4

lemma lt_Rc_iff_gmax {ε c γ : ℝ} (hε : 0 < ε) (hc : 10 ≤ c) (hγ : 0 ≤ γ) :
    ε < Rc c γ ↔ γ < gmax ε c := by
  have hΛγ : 0 < lnΛ c γ := lnΛ_pos_gamma hc hγ
  have hL : lnΛ c γ = lnΛ c 0 + γ * Real.log 4 := lnΛ_affine c γ
  unfold Rc gmax
  rw [lt_div_iff₀ hΛγ, lt_div_iff₀ log4_pos, hL, lt_sub_iff_add_lt, lt_div_iff₀ hε]
  have e : ε * (lnΛ c 0 + γ * Real.log 4) = (γ * Real.log 4 + lnΛ c 0) * ε := by ring
  constructor <;> intro h <;> linarith [e]

/-- The achievable set (dossier 32): the Corollary-31 certificate class. -/
def AchievableAt (ε γ : ℝ) : Prop :=
  ∃ c θ, 10 < c ∧ 0 < θ ∧ θ < 9 / 10 ∧ γ ≤ gammaOf c θ ∧ ε < Rc c (gammaOf c θ)

def FrontierSet (ε : ℝ) : Set ℝ := {γ | 0 < γ ∧ AchievableAt ε γ}

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
  have hLq : Real.log ((c - 1) / 9) ≠ 0 := ne_of_gt (log_quot_pos hc)
  have hl4 : Real.log 4 ≠ 0 := ne_of_gt log4_pos
  simp only [theta_of, gammaOf_eq (show c ≠ 9 by linarith)]
  field_simp

theorem membership_of_lt {ε : ℝ} (hε : 0 < ε) {cₓ : ℝ} (hc : 10 < cₓ)
    (e : IsCrossing ε cₓ)
    {y : ℝ} (hy0 : 0 < y) (hy : y < gammaOf cₓ (9 / 10 : ℝ)) : y ∈ FrontierSet ε := by
  have hg : 0 < gammaOf cₓ (9 / 10 : ℝ) := gammaOf_nine_tenth_pos hc
  have hrec : gammaOf cₓ (theta_of cₓ y) = y := theta_of_recover hc
  refine ⟨hy0, cₓ, theta_of cₓ y, hc, ?_, ?_, le_of_eq hrec.symm, ?_⟩
  · exact div_pos (mul_pos (by norm_num : (0:ℝ) < 9 / 10) hy0) hg
  · rw [theta_of, div_lt_iff₀ hg]
    exact mul_lt_mul_of_pos_left hy (by norm_num : (0:ℝ) < 9 / 10)
  · rw [hrec, lt_Rc_iff_gmax hε (le_of_lt hc) hy0.le]
    unfold IsCrossing at e
    linarith

theorem frontier_upper {ε : ℝ} (hε : 0 < ε) {cₓ : ℝ} (hc : 10 < cₓ) (e : IsCrossing ε cₓ)
    {γ : ℝ} (hγ : γ ∈ FrontierSet ε) : γ < gammaOf cₓ (9 / 10 : ℝ) := by
  obtain ⟨hγpos, c, θ, hC, hθ0, hθ1, hle, hRc⟩ := hγ
  have hγθpos : 0 < gammaOf c θ := gammaOf_pos hC hθ0
  have hθ9 : gammaOf c θ < gammaOf c (9 / 10 : ℝ) := gammaOf_lt_of_lt hC hθ1
  rw [lt_Rc_iff_gmax hε (le_of_lt hC) (le_of_lt hγθpos)] at hRc
  rcases lt_trichotomy c cₓ with hlt | heq | hgt
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
  · exact csSup_le ⟨_, hhalf⟩ (fun γ hγ => le_of_lt (frontier_upper hε hc e hγ))
  · by_contra hnot
    have hlt : sSup (FrontierSet ε) < gammaOf cₓ (9 / 10 : ℝ) := not_le.mp hnot
    have h1 := le_csSup hbb hhalf
    have hmm : (sSup (FrontierSet ε) + gammaOf cₓ (9 / 10 : ℝ)) / 2 ∈ FrontierSet ε :=
      membership_of_lt hε hc e (by linarith) (by linarith)
    have hle := le_csSup hbb hmm
    linarith

/-! ## CARRY END -/

/-! ## M2: near-ten quantitative bounds (helpers for forms 1–3) -/

/-- Near-ten gammaOf bound: for `t > 0`, `gammaOf (10+t) (9/10) ≤ t/(10·ln 4)`
(via `log (1+u) ≤ u` at `u = t/9`). This is the quantitative content of
`gammaOf → 0` as `c → 10⁺`. -/
lemma gammaOf_le_add {t : ℝ} (ht : 0 < t) :
    gammaOf (10 + t) (9 / 10 : ℝ) ≤ t / (10 * Real.log 4) := by
  have hinner : ((10:ℝ) + t - 1) / 9 = 1 + t / 9 := by ring
  rw [gammaOf_eq (by linarith : (10:ℝ) + t ≠ 9), hinner]
  have hle : Real.log (1 + t / 9) ≤ t / 9 := by
    have h := Real.log_le_sub_one_of_pos (show (0:ℝ) < 1 + t / 9 by linarith)
    have hring : (1:ℝ) + t / 9 - 1 = t / 9 := by ring
    rw [hring] at h
    exact h
  have hL4ne : Real.log 4 ≠ 0 := ne_of_gt log4_pos
  calc (9 / 10:ℝ) * Real.log (1 + t / 9) / Real.log 4
      ≤ (9 / 10:ℝ) * (t / 9) / Real.log 4 :=
        div_le_div_of_nonneg_right
          (mul_le_mul_of_nonneg_left hle (by norm_num : (0:ℝ) ≤ 9 / 10))
          (le_of_lt log4_pos)
    _ = t / (10 * Real.log 4) := by
        have h2 : (9 / 10 : ℝ) * (t / 9) = t / 10 := by ring
        rw [div_mul_eq_div_div, h2]

/-- Far-field growth: for `c > 10`,
`lnΛ 10 0 + (c−10)·(2·Lconst − ln(10/9))/2 ≤ lnΛ c 0` (MVT lower bound, the
mirror of M1's `lnΛ_upper`). This is the quantitative content of
`lnΛ c 0 → ∞` linearly, hence `gmax ε c → −∞`. -/
lemma lnΛ_growth {c : ℝ} (hc : 10 < c) :
    lnΛ 10 0 + (c - 10) * (2 * Lconst - Real.log (10 / 9)) / 2 ≤ lnΛ c 0 := by
  have h1 := lnΛ_decompose (by linarith : (1:ℝ) < c)
  have h2 := lnΛ_decompose (by norm_num : (1:ℝ) < 10)
  have hdrop := Ffun_drop (by norm_num : (10:ℝ) ≤ 10) hc
  have hd : (0:ℝ) ≤ c - 10 := by linarith
  have hsplit : lnΛ c 0 = lnΛ 10 0 + (c - 10) * Lconst + (Ffun c - Ffun 10) / 2 := by
    rw [h1, h2]; ring
  have hkey : (c - 10) * (2 * Lconst - Real.log (10 / 9)) / 2
      = (c - 10) * Lconst + (c - 10) * (-(Real.log (10 / 9))) / 2 := by ring
  have hdiv : (c - 10) * (-(Real.log (10 / 9))) / 2 ≤ (Ffun c - Ffun 10) / 2 :=
    div_le_div_of_nonneg_right hdrop (by norm_num : (0:ℝ) ≤ 2)
  have hsum : (c - 10) * Lconst + (c - 10) * (-(Real.log (10 / 9))) / 2
      ≤ (c - 10) * Lconst + (Ffun c - Ffun 10) / 2 :=
    add_le_add (le_refl ((c - 10) * Lconst)) hdiv
  rw [hsplit, hkey]
  linarith [hsum]

/-! ## R2 §12.2 form 1 -/

/-- R2 §12.2 form 1: `gammaOf c (9/10) → 0` as `c → 10⁺`, in ∃-witness form. -/
theorem gammaOf_tendsto_ten_right : ∀ e > 0, ∃ c > 10, gammaOf c (9 / 10 : ℝ) < e := by
  intro e he
  have h := gammaOf_le_add (div_pos (mul_pos he log4_pos) (by norm_num : (0:ℝ) < 2))
  have hL4ne : Real.log 4 ≠ 0 := ne_of_gt log4_pos
  refine ⟨10 + e * Real.log 4 / 2,
    show (10:ℝ) < 10 + e * Real.log 4 / 2 by
      have h4 := log4_pos; nlinarith, ?_⟩
  calc gammaOf (10 + e * Real.log 4 / 2) (9 / 10 : ℝ)
      ≤ (e * Real.log 4 / 2) / (10 * Real.log 4) := h
    _ = e / 20 := by
        rw [div_mul_eq_div_div]
        field_simp
        try ring
    _ < e := by linarith

/-! ## R2 §12.2 form 2 -/

/-- R2 §12.2 form 2 (positive-axis binder, see header): for `ε < ε*` there are
widths just above 10 with positive maximal savings. -/
theorem gmax_pos_near_ten {ε : ℝ} (hε : 0 < ε) (hlt : ε < epsStar) :
    ∃ c > 10, 0 < gmax ε c := by
  rw [epsStar] at hlt
  have h5 : (0:ℝ) < 5 * Real.log 10 := by positivity
  have hlt' : ε * (5 * Real.log 10) < Real.log 4 := (lt_div_iff₀ h5).mp hlt
  have hden : 5 * Real.log 10 < Real.log 4 / ε :=
    (lt_div_iff₀ hε).mpr (by linarith [hlt', mul_comm ε (5 * Real.log 10)])
  set Δ : ℝ := (Real.log 4 / ε - 5 * Real.log 10) / (2 * Lconst) with hΔdef
  have hΔpos : 0 < Δ := div_pos (by linarith) (mul_pos (by norm_num : (0:ℝ) < 2) Lconst_pos)
  have hDL : Δ * Lconst = (Real.log 4 / ε - 5 * Real.log 10) / 2 := by
    have hL0 : Lconst ≠ 0 := ne_of_gt Lconst_pos
    rw [hΔdef]
    field_simp
    try ring
  set c : ℝ := 10 + Δ with hcn
  have hc10 : 10 < c := by rw [hcn]; linarith
  have hΛc : lnΛ c 0 ≤ 5 * Real.log 10 + Δ * Lconst := by
    have hup := lnΛ_upper (by linarith : (10:ℝ) ≤ c)
    rw [lnΛ_10_0] at hup
    have hsplit : (c - 10) * Lconst = Δ * Lconst := by rw [hcn]; ring
    rw [hsplit] at hup
    exact hup
  rw [hDL] at hΛc
  refine ⟨c, hc10, ?_⟩
  unfold gmax
  have this : (0:ℝ) < Real.log 4 := log4_pos
  apply div_pos <;> linarith

/-! ## R2 §12.2 form 3 -/

/-- R2 §12.2 form 3: for every `ε > 0` there are widths where the maximal
savings are negative while `gammaOf` stays nonnegative — the far endpoint of
the IVT interval. -/
theorem gmax_neg_far {ε : ℝ} (hε : 0 < ε) :
    ∃ c > 10, gmax ε c < 0 ∧ 0 ≤ gammaOf c (9 / 10 : ℝ) := by
  have hκpos := kappa_pos
  have hκne : (2:ℝ) * Lconst - Real.log (10 / 9) ≠ 0 := ne_of_gt hκpos
  have hX : (0:ℝ) < Real.log 4 / ε + 1 := by
    have h0 := div_pos log4_pos hε
    linarith
  set c : ℝ := 10 + 2 * (Real.log 4 / ε + 1) / (2 * Lconst - Real.log (10 / 9)) with hcdef
  have hκhalf : (0:ℝ) < 2 * (Real.log 4 / ε + 1) / (2 * Lconst - Real.log (10 / 9)) :=
    div_pos (by nlinarith [hX] : (0:ℝ) < 2 * (Real.log 4 / ε + 1)) hκpos
  have hc10 : 10 < c := by rw [hcdef]; linarith
  have hgrow := lnΛ_growth hc10
  rw [lnΛ_10_0] at hgrow
  have hterm : (c - 10) * (2 * Lconst - Real.log (10 / 9)) / 2
      = Real.log 4 / ε + 1 := by
    have h1 : c - 10 = 2 * (Real.log 4 / ε + 1) / (2 * Lconst - Real.log (10 / 9)) := by
      rw [hcdef]; ring
    rw [h1]
    field_simp
    try ring
  rw [hterm] at hgrow
  refine ⟨c, hc10, ?_, le_of_lt (gammaOf_nine_tenth_pos hc10)⟩
  have h5 : (0:ℝ) < 5 * Real.log 10 := by positivity
  unfold gmax
  rw [div_lt_iff₀ log4_pos]
  have hzero : (0:ℝ) * Real.log 4 = 0 := by ring
  rw [hzero]
  linarith

/-! ## R2 §12.2 form 4 -/

/-- R2 §12.2 form 4: the crossing difference is continuous on every compact
interval past 10 (gammaOf: `Real.continuousOn_log` through `(c−1)/9 > 0`; gmax:
M1's `hasDerivAt_Ffun` through the `lnΛ_decompose` rewriting). -/
theorem crossDiff_continuous {ε : ℝ} {c₁ c₂ : ℝ} (h₁ : 10 < c₁) (hle : c₁ ≤ c₂) :
    ContinuousOn (fun c => gammaOf c (9 / 10 : ℝ) - gmax ε c) (Icc c₁ c₂) := by
  have hgt : ∀ x ∈ Icc c₁ c₂, (10:ℝ) < x := by
    intro x hx
    obtain ⟨hx1, _⟩ := Set.mem_Icc.mp hx
    exact lt_of_lt_of_le h₁ hx1
  -- gammaOf in c: log((c-1)/9) continuous, denominator const
  have hmaps : MapsTo (fun c : ℝ => (c - 1) / 9) (Icc c₁ c₂) ({0}ᶜ : Set ℝ) := by
    intro x hx
    have h10 := hgt x hx
    show (x - 1) / 9 ≠ 0
    exact ne_of_gt (div_pos (by linarith : (0:ℝ) < x - 1) (by norm_num : (0:ℝ) < 9))
  have hfrac : ContinuousOn (fun c : ℝ => (c - 1) / 9) (Icc c₁ c₂) :=
    (continuousOn_id.sub continuousOn_const).div continuousOn_const
      (fun _ _ => show (9:ℝ) ≠ 0 by norm_num)
  have hlogc : ContinuousOn (fun c : ℝ => Real.log ((c - 1) / 9)) (Icc c₁ c₂) :=
    ContinuousOn.comp' Real.continuousOn_log hfrac hmaps
  have hgamma : ContinuousOn (fun c : ℝ => gammaOf c (9 / 10 : ℝ)) (Icc c₁ c₂) := by
    have hR : ContinuousOn (fun c : ℝ => (9 / 10:ℝ) * Real.log ((c - 1) / 9) / Real.log 4)
        (Icc c₁ c₂) :=
      (continuousOn_const.mul hlogc).div continuousOn_const
        (fun x _ => ne_of_gt log4_pos)
    exact hR.congr (fun x hx => gammaOf_eq (by have := hgt x hx; linarith : x ≠ 9))
  -- gmax in c: lnΛ c 0 = c*Lconst + log 3 + Ffun c/2 continuous on c > 1
  have hF : ContinuousOn Ffun (Icc c₁ c₂) := fun x hx =>
    ((hasDerivAt_Ffun (by have := hgt x hx; linarith)).continuousAt).continuousWithinAt
  have hLc : ContinuousOn (fun c : ℝ => c * Lconst + Real.log 3 + Ffun c / 2) (Icc c₁ c₂) :=
    ((continuousOn_id.mul continuousOn_const).add continuousOn_const).add
      (hF.div continuousOn_const (fun _ _ => show (2:ℝ) ≠ 0 by norm_num))
  have hLn : ContinuousOn (fun c : ℝ => lnΛ c 0) (Icc c₁ c₂) :=
    hLc.congr (fun x hx => lnΛ_decompose (by have := hgt x hx; linarith : (1:ℝ) < x))
  have hgm : ContinuousOn (fun c : ℝ => gmax ε c) (Icc c₁ c₂) := by
    unfold gmax
    exact (continuousOn_const.sub hLn).div continuousOn_const
      (fun x _ => ne_of_gt log4_pos)
  exact hgamma.sub hgm

/-! ## R2 §12.2 form 5 -/

/-- R2 §12.2 form 5 (positive-axis binder, see header): the crossing EXISTS for
every `ε ∈ (0, ε*)` — the IVT step. Near 10 the difference is negative: at
`t := B/(2·(2·Lconst + 1/5))`, `B := ln4/ε − 5·ln10 > 0`, one has
`gammaOf ≤ t/(10·ln4) < (t/10 + B/2)/ln4 ≤ gmax` since `t·(Lconst + 1/10) = B/4`.
Far out it is positive (form 3 + `gmax_strictAnti` past the far witness). -/
theorem crossing_exists {ε : ℝ} (hε : 0 < ε) (hlt : ε < epsStar) :
    ∃ c > 10, IsCrossing ε c := by
  rw [epsStar] at hlt
  have h5 : (0:ℝ) < 5 * Real.log 10 := by positivity
  have hlt' : ε * (5 * Real.log 10) < Real.log 4 := (lt_div_iff₀ h5).mp hlt
  have hden : 5 * Real.log 10 < Real.log 4 / ε :=
    (lt_div_iff₀ hε).mpr (by linarith [hlt', mul_comm ε (5 * Real.log 10)])
  set B : ℝ := Real.log 4 / ε - 5 * Real.log 10 with hBdef
  have hBpos : (0:ℝ) < B := by linarith
  have hLp : (0:ℝ) < 2 * (2 * Lconst + 1 / 5) := by linarith [Lconst_pos]
  set t : ℝ := B / (2 * (2 * Lconst + 1 / 5)) with htdef
  have htpos : (0:ℝ) < t := div_pos hBpos hLp
  -- near side: gammaOf (10+t) (9/10) < gmax ε (10+t)
  have hgl : gammaOf (10 + t) (9 / 10 : ℝ) ≤ t / (10 * Real.log 4) := gammaOf_le_add htpos
  have hΛup : lnΛ (10 + t) 0 ≤ 5 * Real.log 10 + t * Lconst := by
    have h := lnΛ_upper (by linarith : (10:ℝ) ≤ 10 + t)
    rw [lnΛ_10_0] at h
    have hsplit : (10 + t - 10) * Lconst = t * Lconst := by ring
    rw [hsplit] at h
    exact h
  have htL : t * Lconst = B / 4 - t / 10 := by
    have hDen : 2 * (2 * Lconst + 1 / 5) ≠ 0 := ne_of_gt hLp
    have h2 : t * (2 * (2 * Lconst + 1 / 5)) = B := by
      rw [htdef]; exact div_mul_cancel₀ _ hDen
    rw [show t * (2 * (2 * Lconst + 1 / 5)) = 4 * (t * Lconst) + (2 / 5) * t by ring] at h2
    linarith
  have hX : t / 10 + B / 2 < Real.log 4 / ε - lnΛ (10 + t) 0 := by linarith
  have hD₁ : gammaOf (10 + t) (9 / 10 : ℝ) - gmax ε (10 + t) < 0 := by
    rw [sub_lt_zero]
    unfold gmax
    calc gammaOf (10 + t) (9 / 10 : ℝ)
        ≤ t / (10 * Real.log 4) := hgl
      _ = (t / 10) / Real.log 4 := by rw [div_mul_eq_div_div]
      _ < ((t / 10) + B / 2) / Real.log 4 :=
          div_lt_div_same log4_pos (by linarith)
      _ < (Real.log 4 / ε - lnΛ (10 + t) 0) / Real.log 4 :=
          div_lt_div_same log4_pos hX
  -- far side: past the far witness the difference is positive
  obtain ⟨c₂', hc₂'10, hgmax', hγ'⟩ := gmax_neg_far hε
  have hD₂ : gammaOf (c₂' + t) (9 / 10 : ℝ) - gmax ε (c₂' + t) > 0 := by
    have hltc : c₂' < c₂' + t := by linarith
    have hg2 : gmax ε (c₂' + t) < gmax ε c₂' := gmax_strictAnti hε (le_of_lt hc₂'10) hltc
    have hγ2 : (0:ℝ) < gammaOf (c₂' + t) (9 / 10 : ℝ) :=
      gammaOf_nine_tenth_pos (by linarith)
    linarith
  -- IVT
  have hcont := crossDiff_continuous (ε := ε) (c₁ := 10 + t) (c₂ := c₂' + t)
    (by linarith) (by linarith)
  have hIVT := intermediate_value_Icc (by linarith : (10:ℝ) + t ≤ c₂' + t) hcont
  have h0mem : (0:ℝ) ∈ Icc (gammaOf (10 + t) (9 / 10 : ℝ) - gmax ε (10 + t))
      (gammaOf (c₂' + t) (9 / 10 : ℝ) - gmax ε (c₂' + t)) :=
    Set.mem_Icc.mpr ⟨by linarith, by linarith⟩
  obtain ⟨c, hcm, hce⟩ := hIVT h0mem
  refine ⟨c, ?_, ?_⟩
  · obtain ⟨hcm1, _⟩ := Set.mem_Icc.mp hcm
    exact lt_of_lt_of_le (by linarith : (10:ℝ) < 10 + t) hcm1
  · have hce' : gammaOf c (9 / 10 : ℝ) - gmax ε c = 0 := hce
    exact sub_eq_zero.mp hce'

/-! ## R2 §12.2 form 6 -/

/-- R2 §12.2 form 6 (positive-axis binder, see header; spec's `Ach` = M1's
`FrontierSet`): the frontier theorem is now UNCONDITIONAL parametric — the
achievable set is exactly the open interval below the crossing value. -/
theorem frontier_unconditional {ε : ℝ} (hε : 0 < ε) (hlt : ε < epsStar) :
    ∃ cₓ, 10 < cₓ ∧ IsCrossing ε cₓ ∧ FrontierSet ε = Ioo 0 (gammaOf cₓ (9 / 10 : ℝ)) := by
  obtain ⟨cₓ, hcₓ, hcr⟩ := crossing_exists hε hlt
  refine ⟨cₓ, hcₓ, hcr, ?_⟩
  ext y
  constructor
  · intro hy
    have hyu := frontier_upper hε hcₓ hcr hy
    obtain ⟨hy0, _⟩ := hy
    exact Set.mem_Ioo.mpr ⟨hy0, hyu⟩
  · intro hy
    obtain ⟨hy0, hy1⟩ := Set.mem_Ioo.mp hy
    exact membership_of_lt hε hcₓ hcr hy0 hy1

/-- Theorem 5's `sSup` frontier formula, now unconditional: composes form 5 with
M1's `frontier_of_crossing` (the theorem article 32 §5 said was parameterized). -/
theorem frontier_formula_unconditional {ε : ℝ} (hε : 0 < ε) (hlt : ε < epsStar) :
    ∃ cₓ, 10 < cₓ ∧ IsCrossing ε cₓ ∧ sSup (FrontierSet ε) = gammaOf cₓ (9 / 10 : ℝ) := by
  obtain ⟨cₓ, hcₓ, hcr⟩ := crossing_exists hε hlt
  exact ⟨cₓ, hcₓ, hcr, frontier_of_crossing hε hcₓ hcr⟩

#print axioms gammaOf_tendsto_ten_right
#print axioms gmax_pos_near_ten
#print axioms gmax_neg_far
#print axioms crossDiff_continuous
#print axioms crossing_exists
#print axioms frontier_unconditional
#print axioms frontier_formula_unconditional

end
