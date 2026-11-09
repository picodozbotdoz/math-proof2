/-
M1 pilot — dossier 20 (hecke-zetaK-zero-density), V2-ζ_K track, milestone 1:
the ENGINE-level conditional layer: full conditional engine instantiation,
sorry-free, zero ports.

Posture (research/pilots/20-blueprint.md §1): zeta23's PaperInputs card, its
traces-family engine step, and the factorization enter as explicit binders;
the lam→1 upgrades, the family merge (the V1-route comparison), and the hCZ
sanity lemmas are PROVED here. Everything elaborates against mathlib
v4.36.0-rc2 (encore checkout ff2494ea).

Provenance of mirrored shapes (read-only donors):
  * counting layer    ~ pilot 42 M1.lean (R1; mirrors zeta23 ChallengeDeps
                       windows/zeroMult/Ncount and the ε-form convention)
  * Card20 fields     ~ zeta23 `Zeta23/Hypotheses.lean:48` (EF), `:67` (RvM),
                       `:83` (cheb), `:107` (MV), `:125` (Gamma)
  * Hfun/Ffun         ~ zeta23 `Zeta23/Defs.lean:55,58`
  * engine seam       ~ zeta23 `Zeta23/Main.lean:176–208` (thm*_lam_of_traces)
SWAP-FRIENDLY BINDER BLOCK: the section between `SWAP-START` and `SWAP-END`
below is the single rewrite point for donor swaps (ported zeta23 engine in
M2, Knausgård relaxed-window donors if R8's mapping lands them) — a swap
rewrites that block only.
-/
import Mathlib

namespace CrossMath.Pilot20

open Complex Set Finset
open scoped ComplexConjugate

/-! ## §1 Counting layer (mirrored from pilot 42 M1.lean, R1; attributed) -/

/-- The nontrivial-strip window `{ρ | 0 < Re ρ < 1, T₁ < Im ρ ≤ T₂}`. -/
def stripWindow (T₁ T₂ : ℝ) : Set ℂ :=
  {ρ | 0 < ρ.re ∧ ρ.re < 1 ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

/-- The critical-line window `{ρ | Re ρ = 1/2, T₁ < Im ρ ≤ T₂}`. -/
def lineWindow (T₁ T₂ : ℝ) : Set ℂ := {ρ | ρ.re = 1 / 2 ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}

theorem lineWindow_subset (T₁ T₂ : ℝ) : lineWindow T₁ T₂ ⊆ stripWindow T₁ T₂ := by
  intro ρ hρ
  simp only [lineWindow, stripWindow, Set.mem_ofPred_eq] at hρ ⊢
  have h1 : 0 < ρ.re := by rw [hρ.1]; norm_num
  have h2 : ρ.re < 1 := by rw [hρ.1]; norm_num
  exact ⟨h1, h2, hρ.2.1, hρ.2.2⟩

/-- Multiplicity of `ρ` as a zero of `f` (mathlib `analyticOrderNatAt`,
`Mathlib/Analysis/Analytic/Order.lean:63`; the shape of zeta23's `zeroMult`,
`ChallengeDeps.lean:46`). -/
noncomputable def multOf (f : ℂ → ℂ) (ρ : ℂ) : ℕ := analyticOrderNatAt f ρ

/-- Support of a multiplicity function. -/
def supp (m : ℂ → ℕ) : Set ℂ := {ρ | m ρ ≠ 0}

theorem mem_supp_iff {m : ℂ → ℕ} {ρ : ℂ} : ρ ∈ supp m ↔ m ρ ≠ 0 := Iff.rfl

theorem supp_add_subset (a b : ℂ → ℕ) : supp (a + b) ⊆ supp a ∪ supp b := by
  intro ρ hρ
  by_contra h
  rw [Set.mem_union, not_or] at h
  have ha0 : a ρ = 0 := by
    by_contra hne; exact h.1 (mem_supp_iff.mpr hne)
  have hb0 : b ρ = 0 := by
    by_contra hne; exact h.2 (mem_supp_iff.mpr hne)
  exact mem_supp_iff.mp hρ (by rw [Pi.add_apply, ha0, hb0])

/-- Window-finiteness of a multiplicity function. -/
def WindowFinite (m : ℂ → ℕ) : Prop := ∀ T₁ T₂ : ℝ, (supp m ∩ stripWindow T₁ T₂).Finite

theorem lineFinite {m : ℂ → ℕ} (hfin : WindowFinite m) (T : ℝ) :
    (supp m ∩ lineWindow T (2 * T)).Finite :=
  Set.Finite.subset (hfin T (2 * T))
    (Set.inter_subset_inter (Subset.refl _) (lineWindow_subset T (2 * T)))

open Classical in
/-- If `c = a + b` pointwise, the window sums add (42-M1 `sum_inter_distrib`,
itself the window-level content of the factorization). -/
theorem sum_inter_distrib {a b c : ℂ → ℕ} (h : ∀ ρ, c ρ = a ρ + b ρ)
    {S : Set ℂ} (ha : (supp a ∩ S).Finite) (hb : (supp b ∩ S).Finite)
    (hc : (supp c ∩ S).Finite) :
    ∑ ρ ∈ hc.toFinset, c ρ = (∑ ρ ∈ ha.toFinset, a ρ) + (∑ ρ ∈ hb.toFinset, b ρ) := by
  classical
  have hsub : supp c ⊆ supp a ∪ supp b := by
    intro ρ hρ
    by_contra hmem
    rw [Set.mem_union, not_or] at hmem
    have ha0 : a ρ = 0 := by
      by_contra hne; exact hmem.1 (mem_supp_iff.mpr hne)
    have hb0 : b ρ = 0 := by
      by_contra hne; exact hmem.2 (mem_supp_iff.mpr hne)
    exact mem_supp_iff.mp hρ (by rw [h ρ, ha0, hb0])
  have hU : ((supp a ∪ supp b) ∩ S).Finite := by
    refine Set.Finite.subset (ha.union hb) ?_
    intro ρ hρ
    simp only [Set.mem_inter_iff, Set.mem_union] at hρ ⊢
    rcases hρ.1 with h' | h'
    · exact Or.inl ⟨h', hρ.2⟩
    · exact Or.inr ⟨h', hρ.2⟩
  have e1 : ∑ ρ ∈ hc.toFinset, c ρ = ∑ ρ ∈ hU.toFinset, c ρ :=
    Finset.sum_subset
      ((Set.Finite.toFinset_subset_toFinset).mpr
        (Set.inter_subset_inter hsub (Subset.refl S)))
      (fun ρ hρ hρ' => by
        by_contra hne
        exact hρ' (Set.Finite.mem_toFinset hc |>.mpr
          ⟨mem_supp_iff.mpr hne, (Set.Finite.mem_toFinset hU).mp hρ |>.2⟩))
  have ea : ∑ ρ ∈ ha.toFinset, a ρ = ∑ ρ ∈ hU.toFinset, a ρ :=
    Finset.sum_subset
      ((Set.Finite.toFinset_subset_toFinset).mpr
        (fun ρ hρ => ⟨Set.mem_union_left (supp b) hρ.1, hρ.2⟩))
      (fun ρ hρ hρ' => by
        by_contra hne
        exact hρ' (Set.Finite.mem_toFinset ha |>.mpr
          ⟨mem_supp_iff.mpr hne, (Set.Finite.mem_toFinset hU).mp hρ |>.2⟩))
  have eb : ∑ ρ ∈ hb.toFinset, b ρ = ∑ ρ ∈ hU.toFinset, b ρ :=
    Finset.sum_subset
      ((Set.Finite.toFinset_subset_toFinset).mpr
        (fun ρ hρ => ⟨Set.mem_union_right (supp a) hρ.1, hρ.2⟩))
      (fun ρ hρ hρ' => by
        by_contra hne
        exact hρ' (Set.Finite.mem_toFinset hb |>.mpr
          ⟨mem_supp_iff.mpr hne, (Set.Finite.mem_toFinset hU).mp hρ |>.2⟩))
  calc ∑ ρ ∈ hc.toFinset, c ρ = ∑ ρ ∈ hU.toFinset, c ρ := e1
    _ = ∑ ρ ∈ hU.toFinset, (a ρ + b ρ) := by simp only [h]
    _ = (∑ ρ ∈ hU.toFinset, a ρ) + (∑ ρ ∈ hU.toFinset, b ρ) := Finset.sum_add_distrib
    _ = (∑ ρ ∈ ha.toFinset, a ρ) + (∑ ρ ∈ hb.toFinset, b ρ) := by rw [← ea, ← eb]

/-- The abstract zero-count object (mirrors zeta23 `ZeroConfig`'s counting
data at multiplicity-function level, `ChallengeDeps.lean:46,55`). -/
structure ZeroMult where
  mult : ℂ → ℕ
  windowFinite : WindowFinite mult

namespace ZeroMult

/-- Pointwise sum of multiplicity functions — the zero data of a product. -/
def add (z w : ZeroMult) : ZeroMult where
  mult := z.mult + w.mult
  windowFinite := by
    intro T₁ T₂
    refine Set.Finite.subset ((z.windowFinite T₁ T₂).union (w.windowFinite T₁ T₂)) ?_
    intro ρ hρ
    simp only [Set.mem_inter_iff, Set.mem_union] at hρ ⊢
    rcases supp_add_subset z.mult w.mult hρ.1 with h | h
    · exact Or.inl ⟨h, hρ.2⟩
    · exact Or.inr ⟨h, hρ.2⟩

open Classical in
/-- General-window count with multiplicity. -/
noncomputable def countIn (z : ZeroMult) (T₁ T₂ : ℝ) : ℕ :=
  ∑ ρ ∈ (z.windowFinite T₁ T₂).toFinset, z.mult ρ

open Classical in
/-- Dyadic-window count with multiplicity `N(T, 2T]` (mirror of zeta23
`Ncount`, `ChallengeDeps.lean:55`). -/
noncomputable def count (z : ZeroMult) (T : ℝ) : ℕ := z.countIn T (2 * T)

open Classical in
/-- Critical-line dyadic count. -/
noncomputable def countOn (z : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (lineFinite z.windowFinite T).toFinset, z.mult ρ

theorem count_add (z w : ZeroMult) (T : ℝ) :
    (add z w).count T = z.count T + w.count T :=
  sum_inter_distrib (a := z.mult) (b := w.mult) (c := z.mult + w.mult)
    (fun ρ => Pi.add_apply z.mult w.mult ρ)
    (z.windowFinite T (2 * T)) (w.windowFinite T (2 * T))
    ((add z w).windowFinite T (2 * T))

theorem countOn_add (z w : ZeroMult) (T : ℝ) :
    (add z w).countOn T = z.countOn T + w.countOn T :=
  sum_inter_distrib (a := z.mult) (b := w.mult) (c := z.mult + w.mult)
    (fun ρ => Pi.add_apply z.mult w.mult ρ)
    (lineFinite z.windowFinite T) (lineFinite w.windowFinite T)
    (lineFinite (add z w).windowFinite T)

end ZeroMult

/-- The ε-form proportion statement (42-M1 `EpsLower`; the shape of zeta23's
submitted theorems, liminf convention — division-free, no asymptotic
denominators: the delta-3 convention of 42-blueprint §Formalization deltas). -/
def EpsLower (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T → (c - ε) * (z.count T : ℝ) ≤ (z.countOn T : ℝ)

/-- **The assembly (42-M1 `assemble_eps`, the V1-route core)**: a shared
proportion constant assembles over the product zero data — with NO
common-zero hypothesis (see `CommonZeroControl` below for the contrast). -/
theorem assemble_eps {z w : ZeroMult} {c : ℝ} (hz : EpsLower z c) (hw : EpsLower w c) :
    EpsLower (ZeroMult.add z w) c := by
  intro ε hε
  obtain ⟨T₁, hT₁⟩ := hz ε hε
  obtain ⟨T₂, hT₂⟩ := hw ε hε
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  rw [ZeroMult.count_add, ZeroMult.countOn_add]
  push_cast
  have hmul : (c - ε) * ((z.count T : ℝ) + (w.count T : ℝ))
      = (c - ε) * (z.count T : ℝ) + (c - ε) * (w.count T : ℝ) := mul_add _ _ _
  linarith

/-! ## §2 The lam-family constants and the lam→1 upgrades (proved) -/

/-- `Hfun lam = 2 − 1/lam − lam/3` — the Theorem-A lam-family constant
(zeta23 `Zeta23/Defs.lean:55`; `Hfun 1 = 2/3`). -/
noncomputable def Hfun (lam : ℝ) : ℝ := 2 - 1 / lam - lam / 3

/-- `Ffun lam = lam / (1 + lam²/3)` — the Theorem-B/C lam-family constant
(zeta23 `Zeta23/Defs.lean:58`; `Ffun 1 = 3/4`). -/
noncomputable def Ffun (lam : ℝ) : ℝ := lam / (1 + lam ^ 2 / 3)

theorem hfun_one : Hfun 1 = 2 / 3 := by norm_num [Hfun]
theorem ffun_one : Ffun 1 = 3 / 4 := by norm_num [Ffun]

/-- lam→1 lower bound for `Hfun`, explicit-δ form: for `δ ∈ (0, 1/2]`,
`Hfun (1 − δ) ≥ 2/3 − 5δ/3`. Proof: `1/(1−δ) ≤ 1 + 2δ` (from
`(1 + 2δ)(1 − δ) = 1 + δ − 2δ² ≥ 1` when `δ ≤ 1/2`), then
`Hfun (1−δ) = 2 − 1/(1−δ) − (1−δ)/3`. -/
theorem hfun_one_sub_le {δ : ℝ} (h0 : 0 < δ) (h1 : δ ≤ 1 / 2) :
    2 / 3 - 5 * δ / 3 ≤ Hfun (1 - δ) := by
  have hden : (0:ℝ) < 1 - δ := by linarith
  have hkey : (1:ℝ) ≤ (1 + 2 * δ) * (1 - δ) := by
    have hexp : (1 + 2 * δ) * (1 - δ) = 1 + δ - 2 * δ ^ 2 := by ring
    rw [hexp]
    nlinarith [sq_nonneg δ, h1]
  have hdiv : (1:ℝ) / (1 - δ) ≤ 1 + 2 * δ := by
    rw [div_le_iff₀ hden]
    linarith
  have hsub : (1 - δ) / 3 = 1 / 3 - δ / 3 := by ring
  unfold Hfun
  rw [hsub]
  linarith

/-- lam→1 lower bound for `Ffun`, explicit-δ form: for `δ ∈ (0, 1/2]`,
`Ffun (1 − δ) ≥ 3/4 − 5δ/8`. (Cross-multiplied numerator:
`δ (2δ − 5δ²/8 − 1) ≤ 0` since `2δ ≤ 1`.) -/
theorem ffun_one_sub_le {δ : ℝ} (h0 : 0 < δ) (h1 : δ ≤ 1 / 2) :
    3 / 4 - 5 * δ / 8 ≤ Ffun (1 - δ) := by
  have hpos : (0:ℝ) < 1 + (1 - δ) ^ 2 / 3 := by positivity
  have hexp : (1 - δ) ^ 2 = 1 - 2 * δ + δ ^ 2 := by ring
  unfold Ffun
  rw [le_div_iff₀ hpos, hexp]
  nlinarith [sq_nonneg δ, h1]

/-- **The lam→1 upgrade for Theorem A**: a lam-family of ε-form bounds at every
`lam ∈ (1/2, 1)` implies the submitted constant `2/3`. Division-free. -/
theorem family_to_two_thirds {z : ZeroMult}
    (hfam : ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (Hfun lam)) :
    EpsLower z (2 / 3) := by
  intro ε hε
  -- δ := min (3ε/10) (1/4): 5δ/3 ≤ ε/2 and lam = 1 − δ ∈ (3/4, 1)
  set δ : ℝ := min (3 * ε / 10) (1 / 4) with hδdef
  have hδ0 : 0 < δ := lt_min (by nlinarith) (by norm_num)
  have hδ4 : δ ≤ 1 / 4 := min_le_right _ _
  have hδlt : δ < 1 := by linarith
  have hδε : 5 * δ / 3 ≤ ε / 2 := by
    have hle : δ ≤ 3 * ε / 10 := min_le_left _ _
    linarith
  obtain ⟨T₀, hT₀⟩ := hfam (1 - δ) ⟨by linarith, by linarith⟩ (ε / 2) (by positivity)
  refine ⟨T₀, fun T hT => ?_⟩
  have hH := hfun_one_sub_le hδ0 (by linarith)
  have h1 : 2 / 3 - ε ≤ Hfun (1 - δ) - ε / 2 := by linarith
  exact le_trans (mul_le_mul_of_nonneg_right h1 (Nat.cast_nonneg _)) (hT₀ T hT)

/-- **The lam→1 upgrade for Theorem C** (`Ffun lam → 3/4`). -/
theorem family_to_three_quarters {z : ZeroMult}
    (hfam : ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (Ffun lam)) :
    EpsLower z (3 / 4) := by
  intro ε hε
  set δ : ℝ := min (4 * ε / 5) (1 / 4) with hδdef
  have hδ0 : 0 < δ := lt_min (by nlinarith) (by norm_num)
  have hδ4 : δ ≤ 1 / 4 := min_le_right _ _
  have hδlt : δ < 1 := by linarith
  have hδε : 5 * δ / 8 ≤ ε / 2 := by
    have hle : δ ≤ 4 * ε / 5 := min_le_left _ _
    linarith
  obtain ⟨T₀, hT₀⟩ := hfam (1 - δ) ⟨by linarith, by linarith⟩ (ε / 2) (by positivity)
  refine ⟨T₀, fun T hT => ?_⟩
  have hF := ffun_one_sub_le hδ0 (by linarith)
  have h1 : 3 / 4 - ε ≤ Ffun (1 - δ) - ε / 2 := by linarith
  exact le_trans (mul_le_mul_of_nonneg_right h1 (Nat.cast_nonneg _)) (hT₀ T hT)

/-- **The lam→1 upgrade for Theorem B** (`2 Ffun lam − 1 → 1/2`). -/
theorem family_to_half {z : ZeroMult}
    (hfam : ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (2 * Ffun lam - 1)) :
    EpsLower z (1 / 2) := by
  intro ε hε
  set δ : ℝ := min (2 * ε / 5) (1 / 4) with hδdef
  have hδ0 : 0 < δ := lt_min (by nlinarith) (by norm_num)
  have hδ4 : δ ≤ 1 / 4 := min_le_right _ _
  have hδlt : δ < 1 := by linarith
  have hδε : 5 * δ / 4 ≤ ε / 2 := by
    have hle : δ ≤ 2 * ε / 5 := min_le_left _ _
    linarith
  obtain ⟨T₀, hT₀⟩ := hfam (1 - δ) ⟨by linarith, by linarith⟩ (ε / 2) (by positivity)
  refine ⟨T₀, fun T hT => ?_⟩
  have hF := ffun_one_sub_le hδ0 (by linarith)
  have h1 : 1 / 2 - ε ≤ (2 * Ffun (1 - δ) - 1) - ε / 2 := by linarith
  exact le_trans (mul_le_mul_of_nonneg_right h1 (Nat.cast_nonneg _)) (hT₀ T hT)

/-! ## §3 The card: transcription of zeta23's `PaperInputs` (`Hypotheses.lean:147`) -/

open scoped ArithmeticFunction in
/-- H-cheb field (`Zeta23/Hypotheses.lean:83–94`), faithful transcription:
the six Chebyshev–Mertens Λ-moment bounds, `∑` over `Finset.Ioc 0 ⌊x⌋₊`
(Mathlib's Chebyshev.psi indexing). -/
structure ChebyshevMertensCard : Prop where
  cheb1a : ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x → ∑ n ∈ Finset.Ioc 0 ⌊x⌋₊, (Λ n : ℝ) ≤ C * x
  cheb1b : ∃ x₀ : ℝ, ∀ x : ℝ, x₀ ≤ x →
    ∑ n ∈ Finset.Ioc 0 ⌊x⌋₊, (Λ n : ℝ) / Real.sqrt n ≤ 3 * Real.sqrt x
  cheb1c : ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x →
    ∑ n ∈ Finset.Ioc 0 ⌊x⌋₊, (Λ n : ℝ) / (Real.sqrt n * Real.log n)
      ≤ C * Real.sqrt x / Real.log x
  cheb1d : ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x → ∑ n ∈ Finset.Ioc 0 ⌊x⌋₊, (Λ n : ℝ) ^ 2 ≤ C * x * Real.log x
  cheb2a : ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x →
    |∑ n ∈ Finset.Ioc 0 ⌊x⌋₊, (Λ n : ℝ) ^ 2 / n - Real.log x ^ 2 / 2| ≤ C * Real.log x
  cheb2b : ∃ C : ℝ, ∀ x : ℝ, 2 ≤ x →
    |∑ n ∈ Finset.Ioc 0 ⌊x⌋₊, (Λ n : ℝ) ^ 2 / n * (Real.log x - Real.log n)
      - Real.log x ^ 3 / 6| ≤ C * Real.log x ^ 2

/-- H-MV field (`Zeta23/Hypotheses.lean:107–111`), faithful transcription:
the bilinear Montgomery–Vaughan weighted Hilbert inequality. -/
def MVHilbertCard (C : ℝ) : Prop :=
  ∀ (ι : Type) [Fintype ι] [DecidableEq ι] (freq δ : ι → ℝ) (x z : ι → ℂ),
    Function.Injective freq → (∀ r, 0 < δ r) → (∀ r s, r ≠ s → δ r ≤ |freq r - freq s|) →
    ‖∑ r, ∑ s, if r = s then (0 : ℂ) else x r * conj (z s) / ((freq r - freq s : ℝ) : ℂ)‖
      ≤ C * Real.sqrt (∑ r, ‖x r‖ ^ 2 / δ r) * Real.sqrt (∑ r, ‖z r‖ ^ 2 / δ r)

/-- H-RvM field (`Zeta23/Hypotheses.lean:67–70`), faithful at count level:
main term `(T/2π)·ℓ(T) + O(log T)` and local count `N(t, t+1] ≪ log(|t|+3)`,
over a general length scale `ℓ : ℝ → ℝ` (for ζ_K: `ell1q`-shaped,
`Zeta23/ThmE/Hypotheses.lean:43`). -/
structure RvMCard (z : ZeroMult) (ℓ : ℝ → ℝ) : Prop where
  main : ∃ C T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
    |(z.count T : ℝ) - T / (2 * Real.pi) * ℓ T| ≤ C * Real.log T
  local_count : ∃ A₀ : ℝ, 1 ≤ A₀ ∧ ∀ t : ℝ,
    (z.countIn t (t + 1) : ℝ) ≤ A₀ * Real.log (|t| + 3)

/-- H-Γ field (`Zeta23/Hypotheses.lean:125–138`), faithful modulo the
(μ, ℓ) parameterization: the nine Γ-facts for the archimedean density μ. -/
structure GammaFactsCard (μ ℓ : ℝ → ℝ) : Prop where
  even : ∀ τ : ℝ, μ (-τ) = μ τ
  smooth : ContDiff ℝ ⊤ μ
  monotoneOn : MonotoneOn μ (Set.Ici 0)
  mu_zero_le : ∀ τ : ℝ, μ 0 ≤ μ τ
  neg_one_lt_mu_zero : -1 < μ 0
  stirling : ∃ C : ℝ, ∀ τ : ℝ, 1 ≤ |τ| →
    |μ τ - (1 / (2 * Real.pi)) * Real.log (|τ| / (2 * Real.pi))| ≤ C / τ ^ 2
  deriv_bound : ∃ C : ℝ, ∀ τ : ℝ, 1 ≤ |τ| → |deriv μ τ| ≤ C / |τ|
  int_mu : ∃ C T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
    |∫ τ in T..(2 * T), μ τ - T * ℓ T / (2 * Real.pi)| ≤ C / T
  int_mu_sq : ∃ C T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
    |∫ τ in T..(2 * T), μ τ ^ 2 - T * ℓ T ^ 2 / (4 * Real.pi ^ 2)|
      ≤ C * (T * ℓ T ^ 2 / (4 * Real.pi ^ 2)) / Real.log (T / (2 * Real.pi)) ^ 2

/-- The Fourier transform convention of zeta23's explicit formula
(`Zeta23/Defs.lean:44 paperFT`). -/
noncomputable def paperFT (f : ℝ → ℂ) (z : ℂ) : ℂ :=
  ∫ u : ℝ, f u * Complex.exp (Complex.I * z * (u : ℂ))

/-- `γ_ρ = (ρ − 1/2)/i` (`Zeta23/Defs.lean:105 gammaOf`). -/
noncomputable def gammaOf (ρ : ℂ) : ℂ := (ρ - 1 / 2) / Complex.I

/-- H-EF field (`Zeta23/Hypotheses.lean:48 ExplicitFormulaPaper`), faithful
modulo the density abstracted to a parameter `ν : ℝ → ℝ → ℝ` (for ζ:
`Zeta23.nuX`, `Zeta23/Defs.lean:99`; for ζ_K: the merged density), and the
two test functions' W-functional split into its zero-sum side (over the
strip support of the config) and its ν-density identity. -/
structure EFCard (z : ZeroMult) (ν : ℝ → ℝ → ℝ) : Prop where
  summable : ∀ (L : ℝ), 0 < L → ∀ (f g : ℝ → ℂ), ContDiff ℝ 2 f → ContDiff ℝ 2 g →
    tsupport f ⊆ Set.Icc (-(L / 2)) (L / 2) → tsupport g ⊆ Set.Icc (-(L / 2)) (L / 2) →
    Summable (fun ρ : {ρ : ℂ // z.mult ρ ≠ 0 ∧ 0 < ρ.re ∧ ρ.re < 1} => (z.mult ρ : ℂ) *
      paperFT f (gammaOf (ρ : ℂ)) * conj (paperFT g (conj (gammaOf (ρ : ℂ)))))
  identity : ∀ (L : ℝ), 0 < L → ∀ (f g : ℝ → ℂ), ContDiff ℝ 2 f → ContDiff ℝ 2 g →
    tsupport f ⊆ Set.Icc (-(L / 2)) (L / 2) → tsupport g ⊆ Set.Icc (-(L / 2)) (L / 2) →
    (∑' ρ : {ρ : ℂ // z.mult ρ ≠ 0 ∧ 0 < ρ.re ∧ ρ.re < 1}, (z.mult ρ : ℂ) *
      paperFT f (gammaOf (ρ : ℂ)) * conj (paperFT g (conj (gammaOf (ρ : ℂ)))))
      = ∫ τ : ℝ, paperFT f τ * conj (paperFT g τ) * (ν (Real.exp L) τ : ℂ)

/-- **The card** — transcription of `Zeta23.PaperInputs` (`Hypotheses.lean:
147–157`): the five published-input fields, for a zero config `z` with
density pair (ν, μ) and length scale ℓ. -/
structure Card20 (z : ZeroMult) (ν : ℝ → ℝ → ℝ) (μ ℓ : ℝ → ℝ) : Prop where
  ef : EFCard z ν
  rvm : RvMCard z ℓ
  cheb : ChebyshevMertensCard
  mv : ∃ C : ℝ, 0 < C ∧ MVHilbertCard C
  gamma : GammaFactsCard μ ℓ

/-! ## §4 The completed ζ_K object (tauceti factorization shape; pilot 42 M2a) -/

/-- The zero-count object of an explicit function (the completed ζ_K side;
window-finiteness is the 42-M2 discharge target via
`IsCompact.inter_riemannZetaZeros_finite` + the Dirichlet continuation's
discreteness). -/
noncomputable def zeroMultOf {f : ℂ → ℂ} (hfin : WindowFinite (multOf f)) : ZeroMult :=
  ⟨multOf f, hfin⟩

/-- **The factorization binder, count level** (42-M1
`countOf_add_of_factorization` shape; M2 discharges `hfac` from tauceti's
`dedekindZetaC_eq_riemannZeta_mul_LFunction` via `analyticOrderNatAt_mul`). -/
theorem count_add_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hfac : ∀ ρ, multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    (zeroMultOf hfinK).count T = (zeroMultOf hfinζ).count T + (zeroMultOf hfinχ).count T :=
  sum_inter_distrib hfac (hfinζ T (2 * T)) (hfinχ T (2 * T)) (hfinK T (2 * T))

/-! ## §5 SWAP-START: the engine seam (single rewrite point for donor swaps)

`Traces` stands for zeta23's traces-family hypothesis
(`ThmTracesHyp (paramsOf ϱ lam) Z`, consumed at `Zeta23/Main.lean:176–208`);
the `EngineStep` structure stands for the `thmA/B/C_lam_of_traces` chain.
M2 replaces these binders by the ported zeta23 engine over `Card20`; a
Knausgård relaxed-window donor (R8 mapping pending) rewrites the same block. -/

/-- The engine step binder: at every `lam ∈ (1/2, 1)`, the traces hypothesis
for the config yields the three lam-family ε-form bounds. -/
structure EngineStep (Traces : ZeroMult → ℝ → Prop) (z : ZeroMult) : Prop where
  hStepA : ∀ lam ∈ Set.Ioo (1 / 2) 1, Traces z lam → EpsLower z (Hfun lam)
  hStepB : ∀ lam ∈ Set.Ioo (1 / 2) 1, Traces z lam → EpsLower z (2 * Ffun lam - 1)
  hStepC : ∀ lam ∈ Set.Ioo (1 / 2) 1, Traces z lam → EpsLower z (Ffun lam)

/-- The traces-family binder: the engine's prime-side hypothesis holds for
the config at every lam (discharge target M2: zeta23 `PrimeSide.thm_traces`
ported, consuming `Card20`). -/
structure TracesFamily (Traces : ZeroMult → ℝ → Prop) (z : ZeroMult) : Prop where
  atLambda : ∀ lam ∈ Set.Ioo (1 / 2) 1, Traces z lam

/-! ## §5 SWAP-END -/

/-- **The instantiation theorem, Theorem A form**: the card (M2 discharge
anchor), the traces family, and the engine step give the lam-family
proportions. `hCard` does not enter the proof — it is carried explicitly so
the final statement reads "card + engine ⇒ proportions" and so M2's
discharge (`Card20` ⇒ `TracesFamily`) slots in unchanged. -/
theorem instantiate_family_A {Traces : ZeroMult → ℝ → Prop} {z : ZeroMult} {ν : ℝ → ℝ → ℝ} {μ ℓ : ℝ → ℝ}
    (hCard : Card20 z ν μ ℓ) (htf : TracesFamily Traces z) (hstep : EngineStep Traces z) :
    ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (Hfun lam) :=
  fun lam hlam => hstep.hStepA lam hlam (htf.atLambda lam hlam)

theorem instantiate_family_B {Traces : ZeroMult → ℝ → Prop} {z : ZeroMult} {ν : ℝ → ℝ → ℝ} {μ ℓ : ℝ → ℝ}
    (hCard : Card20 z ν μ ℓ) (htf : TracesFamily Traces z) (hstep : EngineStep Traces z) :
    ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (2 * Ffun lam - 1) :=
  fun lam hlam => hstep.hStepB lam hlam (htf.atLambda lam hlam)

theorem instantiate_family_C {Traces : ZeroMult → ℝ → Prop} {z : ZeroMult} {ν : ℝ → ℝ → ℝ} {μ ℓ : ℝ → ℝ}
    (hCard : Card20 z ν μ ℓ) (htf : TracesFamily Traces z) (hstep : EngineStep Traces z) :
    ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (Ffun lam) :=
  fun lam hlam => hstep.hStepC lam hlam (htf.atLambda lam hlam)

/-- **The M1 headline (conditional)**: card + traces family + engine step ⇒
the ζ_K zero data carries ≥ 2/3 (ε-form, division-free); likewise 1/2 and
3/4 below. -/
theorem zetaK_engine_two_thirds {Traces : ZeroMult → ℝ → Prop} {z : ZeroMult} {ν : ℝ → ℝ → ℝ} {μ ℓ : ℝ → ℝ}
    (hCard : Card20 z ν μ ℓ) (htf : TracesFamily Traces z) (hstep : EngineStep Traces z) :
    EpsLower z (2 / 3) :=
  family_to_two_thirds (instantiate_family_A hCard htf hstep)

theorem zetaK_engine_half {Traces : ZeroMult → ℝ → Prop} {z : ZeroMult} {ν : ℝ → ℝ → ℝ} {μ ℓ : ℝ → ℝ}
    (hCard : Card20 z ν μ ℓ) (htf : TracesFamily Traces z) (hstep : EngineStep Traces z) :
    EpsLower z (1 / 2) :=
  family_to_half (instantiate_family_B hCard htf hstep)

theorem zetaK_engine_three_quarters {Traces : ZeroMult → ℝ → Prop} {z : ZeroMult} {ν : ℝ → ℝ → ℝ} {μ ℓ : ℝ → ℝ}
    (hCard : Card20 z ν μ ℓ) (htf : TracesFamily Traces z) (hstep : EngineStep Traces z) :
    EpsLower z (3 / 4) :=
  family_to_three_quarters (instantiate_family_C hCard htf hstep)

/-! ## §6 The hCZ binder and the engine-vs-V1 comparison -/

open Classical in
/-- The shared-multiplicity mass in a dyadic line window: the multiplicity
mass of zeros shared by the two configurations. -/
noncomputable def SharedMass (z w : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (lineFinite (ZeroMult.add z w).windowFinite T).toFinset,
    min (z.mult ρ) (w.mult ρ)

/-- **hCZ — the common-zero control** (blueprint §3): the shared-multiplicity
mass is a density-zero fraction of the merged count. The weakest form that
lets the engine's zero-side bookkeeping (per-atom multiplicity caps at
c = 2, 3; spacing inputs to `MVHilbertCard`) go through for the MERGED
config. -/
def CommonZeroControl (z w : ZeroMult) : Prop :=
  ∀ η > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
    (SharedMass z w T : ℝ) ≤ η * ((ZeroMult.add z w).count T : ℝ)

/-- hCZ sanity 1: if the two configs share no strip zeros, the shared mass
is zero (in particular hCZ holds trivially under disjointness). -/
theorem sharedMass_eq_zero_of_disjoint {z w : ZeroMult}
    (hdisj : ∀ ρ, z.mult ρ ≠ 0 ∧ 0 < ρ.re ∧ ρ.re < 1 → w.mult ρ = 0) (T : ℝ) :
    SharedMass z w T = 0 := by
  classical
  unfold SharedMass
  rw [Finset.sum_eq_zero]
  intro ρ hρ
  have hline : ρ ∈ lineWindow T (2 * T) :=
    ((Set.Finite.mem_toFinset (lineFinite (ZeroMult.add z w).windowFinite T)).mp hρ).2
  have hstrip : ρ ∈ stripWindow T (2 * T) := lineWindow_subset T (2 * T) hline
  rcases Nat.eq_zero_or_pos (z.mult ρ) with h0 | hpos
  · show min (z.mult ρ) (w.mult ρ) = 0
    omega
  · have hw0 : w.mult ρ = 0 :=
      hdisj ρ ⟨by omega, hstrip.1, hstrip.2.1⟩
    show min (z.mult ρ) (w.mult ρ) = 0
    omega

/-- hCZ sanity 2 — **the mathematical heart**: a zero that is simple for BOTH
components is a multiplicity-2 zero of the merged (product) config — a
simple common zero of ζ and L(χ_D) is a NON-simple zero of ζ_K. This is the
atom-level failure that makes the engine route need `CommonZeroControl`
while the count-level assembly (`assemble_eps`) is immune. -/
theorem merged_mult_of_common {z w : ZeroMult} {ρ : ℂ}
    (hz : z.mult ρ = 1) (hw : w.mult ρ = 1) :
    (ZeroMult.add z w).mult ρ = 2 := by
  show z.mult ρ + w.mult ρ = 2
  rw [hz, hw]

/-- **The V1-route comparison, family level (proved)**: component lam-families
merge into the product family with NO common-zero hypothesis — the route
that pilot 42 runs, lifted from constants to lam-families. Contrast:
`zetaK_engine_two_thirds` (engine route) needs the card + traces, whose
merged-config zero-side discharge will require `CommonZeroControl`; this
theorem needs neither. -/
theorem family_merge {z w : ZeroMult}
    (hfamz : ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (Hfun lam))
    (hfamw : ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower w (Hfun lam)) :
    ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower (ZeroMult.add z w) (Hfun lam) :=
  fun lam hlam => assemble_eps (hfamz lam hlam) (hfamw lam hlam)

/-- V1 headline at family level + lam→1 upgrade: component families (no hCZ,
no card) already give the merged 2/3 — the precise sense in which the
min-of-fractions route AVOIDS the common-zero obstruction. -/
theorem two_thirds_of_components {z w : ZeroMult}
    (hfamz : ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower z (Hfun lam))
    (hfamw : ∀ lam ∈ Set.Ioo (1 / 2) 1, EpsLower w (Hfun lam)) :
    EpsLower (ZeroMult.add z w) (2 / 3) :=
  family_to_two_thirds (family_merge hfamz hfamw)

/-! ## §7 Smoke test (the defs are not vacuous) -/

def zeroZero : ZeroMult where
  mult := fun _ => 0
  windowFinite := by
    intro T₁ T₂
    have h : supp (fun _ : ℂ => 0) = ∅ := by
      ext ρ; simp [supp]
    simp [h]

@[simp] theorem zeroZero_count (T : ℝ) : zeroZero.count T = 0 := by
  simp [ZeroMult.count, ZeroMult.countIn, zeroZero]

@[simp] theorem zeroZero_countOn (T : ℝ) : zeroZero.countOn T = 0 := by
  simp [ZeroMult.countOn, ZeroMult.countIn, zeroZero]

example (c : ℝ) : EpsLower zeroZero c := by
  intro ε hε
  refine ⟨0, fun T hT => ?_⟩
  simp

example : CommonZeroControl zeroZero zeroZero := by
  intro η hη
  refine ⟨0, fun T hT => ?_⟩
  have h0 : SharedMass zeroZero zeroZero T = 0 :=
    sharedMass_eq_zero_of_disjoint (by
      intro ρ hρ
      exact absurd hρ.1 (by simp [supp, zeroZero])) T
  rw [h0]
  exact mul_nonneg hη.le (Nat.cast_nonneg _)

/-! ## §8 Axioms audit (the run log records the info messages) -/

#print axioms zetaK_engine_two_thirds
#print axioms zetaK_engine_half
#print axioms zetaK_engine_three_quarters
#print axioms family_to_two_thirds
#print axioms family_to_half
#print axioms family_to_three_quarters
#print axioms family_merge
#print axioms two_thirds_of_components
#print axioms merged_mult_of_common
#print axioms assemble_eps
