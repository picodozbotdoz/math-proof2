/-
Pilot 75-N2 P3-d — the V2 ζ-column discharge (unit 9, 2026-11-19).

Self-contained (the M4b monolithic pattern: `import Mathlib` + `import ZetaZeros` only —
the V2 runner elaborates at the ZetaZerosV2 workspace root, so cross-module imports of
the pilot stack are unavailable; the vocabulary is carried per the duplication
convention, cited to Pa.lean/M4b.lean). Contents:
  * the minimal Pa carry (windows, multOf, supp, WindowFinite, lineFinite(Cum),
    ZeroMult.countCum/countOnCum, EpsLowerCum — verbatim Pa/M4b shapes);
  * the P0 card `ZetaColumnOfV2Q` inlined (verbatim N2-P3.lean shape);
  * the M4b glue re-derived in-file (cited): multOf = V2.zeroMultiplicity (rfl), the
    vanishing↔order dictionary (hntopζ binder — the M4b/M2a posture), the set/count
    identifications, the numerator bound, `two_thirds_le_d4`, `V2d4_endpoint` from the
    imported `ZetaZeros.simple_proportion_d4` (on-pin triad, banked in
    logs/n2-p3v2-build1.log), and `epsLowerCum_zeta_of_V2d4`;
  * the card discharge `zetaColumn_of_V2` via a count-equality transfer (the
    EpsLowerCum analogue of Pa's EpsLower_congr) — P3-d's exit theorem, the hAK/hV2col
    slot of the P3-e assembly (N2-P3-plan.md rung 3).

HYGIENE: proof artifact — 0 sorry; #print axioms at file end. `hntopζ` is the honest
M4b-carried structural binder (analyticOrderAt riemannZeta ≠ ⊤ off the pole — the M2a
residue; NOT re-derived here).
-/
import Mathlib
import ZetaZeros

namespace CrossMath.Pilot75N2V2

open Set Finset Filter
open scoped Topology

/-! ## The minimal Pa carry (verbatim shapes; provenance: Pa.lean / M4b.lean) -/

/-- The nontrivial-strip window `{ρ | 0 < Re ρ < 1, T₁ < Im ρ ≤ T₂}` (Pa:50). -/
def stripWindow (T₁ T₂ : ℝ) : Set ℂ :=
  {ρ | 0 < ρ.re ∧ ρ.re < 1 ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

/-- The critical-line window (Pa:63). -/
def lineWindow (T₁ T₂ : ℝ) : Set ℂ := {ρ | ρ.re = 1 / 2 ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

theorem lineWindow_subset (T₁ T₂ : ℝ) : lineWindow T₁ T₂ ⊆ stripWindow T₁ T₂ := by
  intro ρ hρ
  simp only [lineWindow, stripWindow, Set.mem_setOf_eq] at hρ ⊢
  exact ⟨by rw [hρ.1]; norm_num, by rw [hρ.1]; norm_num, hρ.2.1, hρ.2.2⟩

/-- The multiplicity function (Pa:68). -/
noncomputable def multOf (f : ℂ → ℂ) (ρ : ℂ) : ℕ := analyticOrderNatAt f ρ

/-- The support (Pa:88). -/
def supp (m : ℂ → ℕ) : Set ℂ := {ρ | m ρ ≠ 0}

theorem mem_supp_iff {m : ℂ → ℕ} {ρ : ℂ} : ρ ∈ supp m ↔ m ρ ≠ 0 := Iff.rfl

/-- Window finiteness (Pa:106). -/
def WindowFinite (m : ℂ → ℕ) : Prop := ∀ T₁ T₂ : ℝ, (supp m ∩ stripWindow T₁ T₂).Finite

theorem lineFinite {m : ℂ → ℕ} (hfin : WindowFinite m) (T : ℝ) :
    (supp m ∩ lineWindow T (2 * T)).Finite :=
  Set.Finite.subset (hfin T (2 * T))
    (Set.inter_subset_inter (Subset.refl _) (lineWindow_subset T (2 * T)))

theorem lineFiniteCum {m : ℂ → ℕ} (hfin : WindowFinite m) (T : ℝ) :
    (supp m ∩ lineWindow 0 T).Finite :=
  Set.Finite.subset (hfin 0 T)
    (Set.inter_subset_inter (Subset.refl _) (lineWindow_subset 0 T))

/-- The zero-count object (Pa:177). -/
structure ZeroMult where
  mult : ℂ → ℕ
  windowFinite : WindowFinite mult

open Classical in
/-- Cumulative count with multiplicity `N(0, T]` (Pa:815). -/
noncomputable def ZeroMult.countCum (z : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (z.windowFinite 0 T).toFinset, z.mult ρ

open Classical in
/-- Cumulative critical-line count with multiplicity (Pa:823). -/
noncomputable def ZeroMult.countOnCum (z : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (lineFiniteCum z.windowFinite T).toFinset, z.mult ρ

/-- The ε-form cumulative proportion statement (Pa:835). -/
def EpsLowerCum (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T → (c - ε) * (z.countCum T : ℝ) ≤ (z.countOnCum T : ℝ)

open Classical in
/-- `countCumOf` (Pa:926 — the of-form of `ZeroMult.countCum`). -/
noncomputable def countCumOf {f : ℂ → ℂ} (hfin : WindowFinite (multOf f)) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (hfin 0 T).toFinset, multOf f ρ

theorem analyticAt_riemannZeta {ρ : ℂ} (hρ : ρ ≠ 1) : AnalyticAt ℂ riemannZeta ρ :=
  DifferentiableOn.analyticAt differentiableOn_riemannZeta
    (isOpen_compl_singleton.mem_nhds hρ)

/-! ## The P0 card, inlined (verbatim N2-P3.lean shape) -/

/-- **P3-d target**: the ζ-column at 2/3 for the abstract fK (N2-P3.lean card). -/
def ZetaColumnOfV2Q (fK : ℂ → ℂ) (hfinK : WindowFinite (multOf fK))
    (hfinζ : WindowFinite (multOf riemannZeta)) : Prop :=
  (∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤) →
  (∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T) →
  (∀ T : ℝ, (⟨multOf fK, hfinK⟩ : ZeroMult).countOnCum T
      = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T) →
  EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3) →
    EpsLowerCum ⟨multOf fK, hfinK⟩ (2 / 3)

/-! ## The M4b glue (re-derived in-file; provenance: M4b.lean:1219-1430) -/

abbrev V2.nontrivialZeros : ℝ → Set ℂ := ZetaZeros.nontrivialZeros

noncomputable abbrev V2.zeroMultiplicity : ℂ → ℕ := ZetaZeros.zeroMultiplicity

noncomputable abbrev V2.zeroCount : ℝ → ℕ := ZetaZeros.zeroCount

noncomputable abbrev V2.simpleOnLineCount : ℝ → ℕ := ZetaZeros.simpleOnLineCount

/-- `multOf riemannZeta` is definitionally V2's `zeroMultiplicity` (M4b:1253). -/
theorem multOf_riemannZeta_eq (ρ : ℂ) : multOf riemannZeta ρ = V2.zeroMultiplicity ρ := rfl

/-- No point of the open strip is `1` (M4b:1256). -/
theorem re_lt_one_ne_one {ρ : ℂ} (h0 : 0 < ρ.re) (h1 : ρ.re < 1) : ρ ≠ 1 := by
  intro h
  rw [h] at h1
  exact absurd h1 (by simp)

/-- **Vanishing ↔ positive-order dictionary** for ζ (M4b:1260; hntopζ binder — the M2a
residue posture). -/
theorem multOf_riemannZeta_ne_zero_iff
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤) {ρ : ℂ} (hρ : ρ ≠ 1) :
    multOf riemannZeta ρ ≠ 0 ↔ riemannZeta ρ = 0 := by
  constructor
  · intro h
    exact apply_eq_zero_of_analyticOrderNatAt_ne_zero h
  · intro h0
    have hA : AnalyticAt ℂ riemannZeta ρ := analyticAt_riemannZeta hρ
    have hne : analyticOrderAt riemannZeta ρ ≠ 0 := hA.analyticOrderAt_ne_zero.mpr h0
    intro hm0
    have hc : (V2.zeroMultiplicity ρ : ℕ∞) = analyticOrderAt riemannZeta ρ :=
      Nat.cast_analyticOrderNatAt (hntopζ ρ)
    have hm0' : V2.zeroMultiplicity ρ = 0 := hm0
    rw [hm0', Nat.cast_zero] at hc
    exact hne hc.symm

/-- **Set identification (strip):** pilot support-window = V2 zero-set (M4b:1272). -/
theorem supp_inter_strip_eq_nontrivialZeros
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤) (T : ℝ) :
    supp (multOf riemannZeta) ∩ stripWindow 0 T = V2.nontrivialZeros T := by
  ext ρ
  simp only [Set.mem_inter_iff, mem_supp_iff, stripWindow, Set.mem_ofPred_eq,
    V2.nontrivialZeros, ZetaZeros.nontrivialZeros]
  constructor
  · rintro ⟨hne, hre, hre1, him, himT⟩
    exact ⟨(multOf_riemannZeta_ne_zero_iff hntopζ (re_lt_one_ne_one hre hre1)).mp hne,
      hre, hre1, him, himT⟩
  · rintro ⟨h0, hre, hre1, him, himT⟩
    exact ⟨(multOf_riemannZeta_ne_zero_iff hntopζ (re_lt_one_ne_one hre hre1)).mpr h0,
      hre, hre1, him, himT⟩

open Classical in
/-- **Count identification:** pilot `countCum` = V2 `zeroCount` (M4b:1296). -/
theorem countCum_eq_zeroCount
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤)
    (hfinζ : WindowFinite (multOf riemannZeta)) (T : ℝ) :
    (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T = V2.zeroCount T := by
  have hset := supp_inter_strip_eq_nontrivialZeros hntopζ T
  have hA : (supp (multOf riemannZeta) ∩ stripWindow 0 T).Finite := hfinζ 0 T
  have hsub : Function.support (Set.indicator (V2.nontrivialZeros T) V2.zeroMultiplicity)
      ⊆ supp (multOf riemannZeta) ∩ stripWindow 0 T := by
    intro ρ hρ
    simp only [Function.mem_support] at hρ
    by_cases hmem : ρ ∈ V2.nontrivialZeros T
    · rw [Set.indicator_of_mem hmem] at hρ
      rcases hmem with ⟨h0, hre, hre1, him, himT⟩
      exact ⟨hρ, hre, hre1, him, himT⟩
    · rw [Set.indicator_apply, if_neg hmem] at hρ
      exact (hρ rfl).elim
  have eL : (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T
      = countCumOf hfinζ T := rfl
  have eR : V2.zeroCount T = ∑ᶠ ρ ∈ V2.nontrivialZeros T, V2.zeroMultiplicity ρ := rfl
  have eI : (∑ᶠ ρ ∈ V2.nontrivialZeros T, V2.zeroMultiplicity ρ)
      = ∑ᶠ ρ : ℂ, Set.indicator (V2.nontrivialZeros T) V2.zeroMultiplicity ρ :=
    finsum_mem_def _ _
  have hbr : ∑ᶠ ρ : ℂ, Set.indicator (V2.nontrivialZeros T) V2.zeroMultiplicity ρ
      = ∑ ρ ∈ (hfinζ 0 T).toFinset,
          Set.indicator (V2.nontrivialZeros T) V2.zeroMultiplicity ρ :=
    finsum_eq_sum_of_support_subset_of_finite _ hsub (hfinζ 0 T)
  rw [eL, eR, eI, hbr]
  exact Finset.sum_congr rfl fun ρ hρ =>
    (Set.indicator_of_mem (hset ▸ ((hfinζ 0 T).mem_toFinset).mp hρ)
      V2.zeroMultiplicity).symm

open Classical in
/-- **Numerator bound:** V2's `simpleOnLineCount` ≤ pilot `countOnCum` (M4b:1351). -/
theorem simpleOnLineCount_le_countOnCum
    (hfinζ : WindowFinite (multOf riemannZeta)) (T : ℝ) :
    V2.simpleOnLineCount T ≤ (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T := by
  have hA₀ : (supp (multOf riemannZeta) ∩ lineWindow 0 T).Finite := lineFiniteCum hfinζ T
  have hsub : {ρ ∈ V2.nontrivialZeros T | ρ.re = 1 / 2 ∧ V2.zeroMultiplicity ρ = 1}
      ⊆ supp (multOf riemannZeta) ∩ lineWindow 0 T := by
    intro ρ hρ
    rcases hρ with ⟨⟨h0, hre, hre1, him, himT⟩, hre2, hm1⟩
    simp only [Set.mem_inter_iff, mem_supp_iff, lineWindow, Set.mem_ofPred_eq]
    refine ⟨?_, hre2, him, himT⟩
    rw [multOf_riemannZeta_eq, hm1]
    exact one_ne_zero
  have hS : ({ρ ∈ V2.nontrivialZeros T | ρ.re = 1 / 2 ∧ V2.zeroMultiplicity ρ = 1} :
      Set ℂ).Finite := Set.Finite.subset hA₀ hsub
  show ({ρ ∈ V2.nontrivialZeros T | ρ.re = 1 / 2 ∧ V2.zeroMultiplicity ρ = 1} :
      Set ℂ).ncard ≤ (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T
  rw [Set.ncard_eq_toFinset_card
      {ρ ∈ V2.nontrivialZeros T | ρ.re = 1 / 2 ∧ V2.zeroMultiplicity ρ = 1} hS,
    Finset.card_eq_sum_ones]
  calc ∑ ρ ∈ hS.toFinset, 1
      ≤ ∑ ρ ∈ hS.toFinset, V2.zeroMultiplicity ρ := Finset.sum_le_sum fun ρ hρ => by
          rcases (hS.mem_toFinset).mp hρ with ⟨_, _, hm1⟩
          rw [hm1]
    _ ≤ ∑ ρ ∈ hA₀.toFinset, V2.zeroMultiplicity ρ :=
        Finset.sum_le_sum_of_subset (Set.Finite.toFinset_subset_toFinset.mpr hsub)
    _ = ∑ ρ ∈ hA₀.toFinset, multOf riemannZeta ρ := Finset.sum_congr rfl fun _ _ => rfl
    _ = (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T := rfl

/-! ## Numerics and discharges -/

/-- 2/3 < 0.6725 (M4b:1381; `norm_num`-clean). -/
theorem two_thirds_le_d4 : (2 / 3 : ℝ) ≤ 0.6725 := by norm_num

/-- **The imported donor endpoint** — on-pin triad (banked: n2-p3v2-build1.log). -/
theorem V2d4_endpoint : ∃ T₀ : ℝ, ∀ T ≥ T₀,
    (0.6725 : ℝ) < (V2.simpleOnLineCount T : ℝ) / (V2.zeroCount T : ℝ) :=
  ZetaZeros.simple_proportion_d4

/-- **ζ-side 2/3 discharge from the V2 numeric endpoint** (M4b:1404). -/
theorem epsLowerCum_zeta_of_V2d4
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤)
    (hfinζ : WindowFinite (multOf riemannZeta))
    (hV2d4 : ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (0.6725 : ℝ) < (V2.simpleOnLineCount T : ℝ) / (V2.zeroCount T : ℝ)) :
    EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3) := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := hV2d4
  refine ⟨T₀, fun T hT => ?_⟩
  have hT₀' := hT₀ T hT
  rcases Nat.eq_zero_or_pos (V2.zeroCount T) with h0 | h0
  · rw [h0, Nat.cast_zero, div_zero] at hT₀'
    exact absurd hT₀' (by norm_num)
  · have h0' : (0 : ℝ) < (V2.zeroCount T : ℝ) := by exact_mod_cast h0
    have hmul := (lt_div_iff₀ h0').mp hT₀'
    have h1 : (2 / 3 - ε) * ((⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T : ℝ)
        ≤ (0.6725 : ℝ) * (V2.zeroCount T : ℝ) := by
      rw [countCum_eq_zeroCount hntopζ hfinζ T]
      by_cases hε' : 2 / 3 ≤ ε
      · have hle : (2 / 3 - ε) * (V2.zeroCount T : ℝ) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg (by linarith) (Nat.cast_nonneg _)
        have hnn : (0 : ℝ) ≤ (0.6725 : ℝ) * (V2.zeroCount T : ℝ) :=
          mul_nonneg (by norm_num) (Nat.cast_nonneg _)
        linarith
      · exact mul_le_mul_of_nonneg_right
          (le_trans (by linarith) two_thirds_le_d4) (Nat.cast_nonneg _)
    calc (2 / 3 - ε) * ((⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T : ℝ)
        ≤ (0.6725 : ℝ) * (V2.zeroCount T : ℝ) := h1
      _ ≤ (V2.simpleOnLineCount T : ℝ) := le_of_lt hmul
      _ ≤ ((⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countOnCum T : ℝ) :=
          by exact_mod_cast simpleOnLineCount_le_countOnCum hfinζ T

/-! ## The P3-d exit theorem -/

/-- Count-equality transfer for `EpsLowerCum` (the EpsLowerCum analogue of Pa's
`EpsLower_congr`). -/
theorem epsLowerCum_transfer {z w : ZeroMult} {c : ℝ}
    (hccum : ∀ T, z.countCum T = w.countCum T)
    (hconcum : ∀ T, z.countOnCum T = w.countOnCum T)
    (h : EpsLowerCum w c) : EpsLowerCum z c := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := h ε hε
  exact ⟨T₀, fun T hT => by rw [hccum, hconcum]; exact hT₀ T hT⟩

/-- **P3-d**: the `ZetaColumnOfV2Q` card DISCHARGED — from the ζ-column 2/3 proportion
(the V2 import side, `epsLowerCum_zeta_of_V2d4`) and the count identifications of the
abstract fK with the ζ-column zero data, the abstract fK carries 2/3. The
`EpsLowerCum`-at-ζ side is supplied at P3-e by the glue above; `hntopζ` rides the
ζ-side theorem (the M4b/M2a binder posture). -/
theorem zetaColumn_of_V2 (fK : ℂ → ℂ) (hfinK : WindowFinite (multOf fK))
    (hfinζ : WindowFinite (multOf riemannZeta)) :
    ZetaColumnOfV2Q fK hfinK hfinζ := by
  intro _hntopK hccum hconcum hζ
  exact epsLowerCum_transfer hccum hconcum hζ

/-! ## The unconditional-at-ℚ endpoint -/

/-- **The ℚ endpoint** (`zetaL_two_thirds_landed_ℚ`, the RESEARCH.md §Iteration-5
lead-1 remainder): at K = ℚ the abelian L is ζ itself, and the composed landing
degenerates to the ζ-column — discharged from the V2 d4 endpoint with only the two
classical structural binders of the M4b/M2a posture (window-finiteness of the ζ
zero data; `analyticOrderAt riemannZeta ≠ ⊤`). No DZDF/family/hEχ premises — the
statement is unconditional in the composed sense (the two named binders are the
dossier's FOREVER set, billed as classical structural). -/
theorem zetaL_two_thirds_landed_ℚ
    (hfinζ : WindowFinite (multOf riemannZeta))
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤) :
    EpsLowerCum ⟨multOf riemannZeta, hfinζ⟩ (2 / 3) :=
  epsLowerCum_zeta_of_V2d4 hntopζ hfinζ V2d4_endpoint

end CrossMath.Pilot75N2V2

-- audit (expect triad only, 0 sorryAx)
#print axioms CrossMath.Pilot75N2V2.two_thirds_le_d4
#print axioms CrossMath.Pilot75N2V2.V2d4_endpoint
#print axioms CrossMath.Pilot75N2V2.epsLowerCum_zeta_of_V2d4
#print axioms CrossMath.Pilot75N2V2.epsLowerCum_transfer
#print axioms CrossMath.Pilot75N2V2.zetaColumn_of_V2
#print axioms CrossMath.Pilot75N2V2.zetaL_two_thirds_landed_ℚ
-- donor endpoint on-pin re-prints (A3 rec 4; already banked in n2-p3v2-build1.log)
#print axioms ZetaZeros.simple_proportion_d4
