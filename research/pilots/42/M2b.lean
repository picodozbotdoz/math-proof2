/-
M2b pilot — dossier 42 (zeta-k-two-thirds-product-assembly), milestone 2b: the donor swap.
Self-contained: the GREEN M1 layer + M2a structural discharge + M3 defect layer, plus the
M2b cumulative layer, the transcribed Knausgård clean-layer statements (certificate
binders), the monotone-absorption discharge, and the LANDED theorems. mathlib v4.36.0-rc2
(checkout ff2494ea). No sorry, no native_decide, no external CAS.

M2b content (new beyond M1/M2a/M3):
  * cumulative counts (0,T] — countCum / countOnCum / countDistinctOnCum / commonOnLineCum
    + EpsLowerCum / EpsLowerDistinctCum + additivity + inclusion–exclusion
  * EpsLowerCum_mono / EpsLowerDistinctCum_mono (monotone absorption) + the numeric facts
    two_thirds_le_673, five_sixths_le_839
  * K673OfLayers / K839OfLocal — the transcriptions of Knausgård's clean endpoints
    (distinct_zeros_839_of_local, simple_critical_zeros_673_of_layers; certificate =
    LocalInequality as the explicit `cert` binder, EnclOK precedent)
  * epsLowerCum_of_factorization (cumulative wiring), assemble_eps_cum,
    assemble_eps_defect_cum, countDistinctOnCum_of_factorization
  * LANDED: zetaK_two_thirds_landed, zetaK_distinct_five_sixths_landed (+ _of_negligible,
    the hCZ-seamed form) — with `#print axioms` at file end.
-/
import Mathlib

namespace CrossMath.Pilot42

open Set Finset Filter
open scoped Topology

-- ===== M1 layer (carried verbatim; provenance and proofs: see M1.lean) =====



/-! ## Windows -/

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

/-! ## Multiplicity functions -/

/-- Multiplicity of `ρ` as a zero of `f`, as a natural number. Mathlib:
`analyticOrderNatAt` (Mathlib/Analysis/Analytic/Order.lean:63); the shape of zeta23's
`zeroMult` (ChallengeDeps.lean:46) at v4.36. -/
noncomputable def multOf (f : ℂ → ℂ) (ρ : ℂ) : ℕ := analyticOrderNatAt f ρ

/-- **Multiplicity glue (proved, not hypothesized)**: orders of vanishing add under products,
at points where both factors are analytic and neither vanishes identically near the point.
Mathlib: `analyticOrderNatAt_mul` (Mathlib/Analysis/Analytic/Order.lean:565, hypotheses
`hf'`, `hg'`). M2 discharges `hf'`/`hg'` for ζ and L(s,χ) on the open strip (isolated zeros). -/
theorem multOf_mul {f g : ℂ → ℂ} {ρ : ℂ} (hf : AnalyticAt ℂ f ρ) (hg : AnalyticAt ℂ g ρ)
    (hf' : analyticOrderAt f ρ ≠ ⊤) (hg' : analyticOrderAt g ρ ≠ ⊤) :
    multOf (f * g) ρ = multOf f ρ + multOf g ρ :=
  analyticOrderNatAt_mul hf hg hf' hg'

/-- Set-restricted convenience form of `multOf_mul` (the M2 entry point). -/
theorem multOf_mul_of_forall {f g : ℂ → ℂ} {S : Set ℂ}
    (han : ∀ ρ ∈ S, AnalyticAt ℂ f ρ ∧ AnalyticAt ℂ g ρ ∧ analyticOrderAt f ρ ≠ ⊤
      ∧ analyticOrderAt g ρ ≠ ⊤) {ρ : ℂ} (hρ : ρ ∈ S) :
    multOf (f * g) ρ = multOf f ρ + multOf g ρ :=
  multOf_mul (han ρ hρ).1 (han ρ hρ).2.1 (han ρ hρ).2.2.1 (han ρ hρ).2.2.2

/-- Support of a multiplicity function (self-contained, to avoid `Function.support` API
churn across mathlib versions). -/
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

/-- Window-finiteness: only finitely many nonzero multiplicities in any strip window.
M2 discharge target: `IsCompact.inter_riemannZetaZeros_finite`
(Mathlib/NumberTheory/LSeries/ZetaZeros.lean:68) + the Dirichlet continuation's zero
discreteness. -/
def WindowFinite (m : ℂ → ℕ) : Prop := ∀ T₁ T₂ : ℝ, (supp m ∩ stripWindow T₁ T₂).Finite

/-- Finiteness of the critical-line window support, from window-finiteness. -/
theorem lineFinite {m : ℂ → ℕ} (hfin : WindowFinite m) (T : ℝ) :
    (supp m ∩ lineWindow T (2 * T)).Finite :=
  Set.Finite.subset (hfin T (2 * T))
    (Set.inter_subset_inter (Subset.refl _) (lineWindow_subset T (2 * T)))

/-! ## The core counting lemma (multiplicity glue at window level) -/

open Classical in
/-- If `c = a + b` pointwise, the window sums add (each finiteness supplied). This is the
whole window-level content of Theorem A-K; it composes with `multOf_mul` in M2. -/
theorem sum_inter_distrib {a b c : ℂ → ℕ} (h : ∀ ρ, c ρ = a ρ + b ρ)
    {S : Set ℂ} (ha : (supp a ∩ S).Finite) (hb : (supp b ∩ S).Finite)
    (hc : (supp c ∩ S).Finite) :
    ∑ ρ ∈ hc.toFinset, c ρ = (∑ ρ ∈ ha.toFinset, a ρ) + (∑ ρ ∈ hb.toFinset, b ρ) := by
  classical
  -- supp c ⊆ supp a ∪ supp b
  have hsub : supp c ⊆ supp a ∪ supp b := by
    intro ρ hρ
    by_contra hmem
    rw [Set.mem_union, not_or] at hmem
    have ha0 : a ρ = 0 := by
      by_contra hne; exact hmem.1 (mem_supp_iff.mpr hne)
    have hb0 : b ρ = 0 := by
      by_contra hne; exact hmem.2 (mem_supp_iff.mpr hne)
    exact mem_supp_iff.mp hρ (by rw [h ρ, ha0, hb0])
  -- the common finite set: (supp a ∪ supp b) ∩ S
  have hU : ((supp a ∪ supp b) ∩ S).Finite := by
    refine Set.Finite.subset (ha.union hb) ?_
    intro ρ hρ
    simp only [Set.mem_inter_iff, Set.mem_union] at hρ ⊢
    rcases hρ.1 with h' | h'
    · exact Or.inl ⟨h', hρ.2⟩
    · exact Or.inr ⟨h', hρ.2⟩
  -- transport each sum to the common set (sum_subset: the SMALLER set's sum equals the
  -- bigger's, off-support summands vanish)
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

/-! ## The zero-count object -/

/-- A multiplicity function with finite windows: the abstract zero-count object
(mirrors zeta23's `zeroMult`/`Ncount` data, ChallengeDeps.lean:46,55). -/
structure ZeroMult where
  mult : ℂ → ℕ
  windowFinite : WindowFinite mult

namespace ZeroMult

/-- Pointwise sum of multiplicity functions — the zero data of a product, by `multOf_mul`. -/
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
/-- Dyadic-window count with multiplicity `N(T, 2T]` (mirror of zeta23 `Ncount`,
ChallengeDeps.lean:55). -/
noncomputable def count (z : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (z.windowFinite T (2 * T)).toFinset, z.mult ρ

open Classical in
/-- Critical-line dyadic count with multiplicity — the on-line numerator. -/
noncomputable def countOn (z : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (lineFinite z.windowFinite T).toFinset, z.mult ρ

/-- **Theorem A-K (abstract form)**: window counts add under the pointwise sum of
multiplicity functions. -/
theorem count_add (z w : ZeroMult) (T : ℝ) :
    (add z w).count T = z.count T + w.count T :=
  sum_inter_distrib (a := z.mult) (b := w.mult) (c := z.mult + w.mult)
    (fun ρ => Pi.add_apply z.mult w.mult ρ)
    (z.windowFinite T (2 * T)) (w.windowFinite T (2 * T))
    ((add z w).windowFinite T (2 * T))

/-- Theorem A-K, on-line version. -/
theorem countOn_add (z w : ZeroMult) (T : ℝ) :
    (add z w).countOn T = z.countOn T + w.countOn T :=
  sum_inter_distrib (a := z.mult) (b := w.mult) (c := z.mult + w.mult)
    (fun ρ => Pi.add_apply z.mult w.mult ρ)
    (lineFinite z.windowFinite T) (lineFinite w.windowFinite T)
    (lineFinite (add z w).windowFinite T)

end ZeroMult

/-! ## The ε-form and the assembly -/

/-- The ε-form proportion statement: for every `ε > 0`, eventually
`(c − ε) · N(T,2T] ≤ N^{on}(T,2T]`. This is the shape of zeta23's submitted theorems
(liminf convention, survey/anthropics.md §1.3). Numerator-convention note: the submitted
statements count on-line zeros per zeta23's `N0star` convention; with-multiplicity counts
dominate distinct counts pointwise, so the assembly below is valid under either convention
(M2 reconciles the transcription). -/
def EpsLower (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T → (c - ε) * (z.count T : ℝ) ≤ (z.countOn T : ℝ)

/-- **Theorem B-K core (the assembly)**: a shared proportion constant assembles over the
product zero data. Division-free; consumes no absolute zero-count asymptotic. -/
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

/-- General-constants version: differing constants assemble at their minimum. -/
theorem assemble_eps_min {z w : ZeroMult} {c₁ c₂ : ℝ}
    (hz : EpsLower z c₁) (hw : EpsLower w c₂) :
    EpsLower (ZeroMult.add z w) (min c₁ c₂) := by
  intro ε hε
  obtain ⟨T₁, hT₁⟩ := hz ε hε
  obtain ⟨T₂, hT₂⟩ := hw ε hε
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have m1 : min c₁ c₂ - ε ≤ c₁ - ε := by
    have := min_le_left c₁ c₂; linarith
  have m2 : min c₁ c₂ - ε ≤ c₂ - ε := by
    have := min_le_right c₁ c₂; linarith
  have n1 : (0 : ℝ) ≤ (z.count T : ℝ) := Nat.cast_nonneg _
  have n2 : (0 : ℝ) ≤ (w.count T : ℝ) := Nat.cast_nonneg _
  have g1 : (min c₁ c₂ - ε) * (z.count T : ℝ) ≤ (z.countOn T : ℝ) :=
    le_trans (mul_le_mul_of_nonneg_right m1 n1) e1
  have g2 : (min c₁ c₂ - ε) * (w.count T : ℝ) ≤ (w.countOn T : ℝ) :=
    le_trans (mul_le_mul_of_nonneg_right m2 n2) e2
  rw [ZeroMult.count_add, ZeroMult.countOn_add]
  push_cast
  have hmul : (min c₁ c₂ - ε) * ((z.count T : ℝ) + (w.count T : ℝ))
      = (min c₁ c₂ - ε) * (z.count T : ℝ) + (min c₁ c₂ - ε) * (w.count T : ℝ) :=
    mul_add _ _ _
  linarith

/-! ## The conditional headline theorems (M2 replaces the binders by ports) -/

/-- **Theorem B-K (conditional)** — dossier 42. Binders:
`hAζ` = zeta23 `two_thirds_on_critical_line` (`Challenge.lean:131`);
`hAχ` = `dirichlet_two_thirds_on_critical_line` (`Challenge.lean:191`).
Conclusion: the product zero data (the Dedekind zeta of a quadratic field, once M2
identifies it with `ZeroMult.add`) carries the same proportion — the first zero-density
statement for a number-field zeta. -/
theorem zetaK_two_thirds {zζ zχ : ZeroMult}
    (hAζ : EpsLower zζ (2 / 3)) (hAχ : EpsLower zχ (2 / 3)) :
    EpsLower (ZeroMult.add zζ zχ) (2 / 3) :=
  assemble_eps hAζ hAχ

/-- **Montgomery–Taylor window version** — dossier 42 Theorem B-K′. Binders:
`hDζ` = `montgomery_taylor_on_critical_line` (`Challenge.lean:163`);
`hDχ` = `dirichlet_montgomery_taylor_on_critical_line` (`Challenge.lean:212`).
Both submitted statements carry the SAME constant `2 − 1/c₁` (zeta23's Theorem D and its
Dirichlet analogue E), so the min-step is vacuous — the observation that makes the assembly
work at the MT constant, not just at 2/3. -/
theorem zetaK_montgomery_taylor {c₁ : ℝ} {zζ zχ : ZeroMult}
    (hDζ : EpsLower zζ (2 - 1 / c₁)) (hDχ : EpsLower zχ (2 - 1 / c₁)) :
    EpsLower (ZeroMult.add zζ zχ) (2 - 1 / c₁) :=
  assemble_eps hDζ hDχ

/-! ## Function-level counts (the M2 discharge interface) -/

open Classical in
/-- Window count of the zeros of an explicit function (window-finiteness supplied). -/
noncomputable def countOf {f : ℂ → ℂ} (hfin : WindowFinite (multOf f)) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (hfin T (2 * T)).toFinset, multOf f ρ

open Classical in
/-- Critical-line window count of the zeros of an explicit function. -/
noncomputable def countOnOf {f : ℂ → ℂ} (hfin : WindowFinite (multOf f)) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (lineFinite hfin T).toFinset, multOf f ρ

/-- **Theorem A-K at function level**: if the multiplicities of `fK` are the pointwise sum
of those of `fζ` and `fχ` (M2: `multOf_mul` applied to tauceti's
`dedekindZeta_eq_riemannZeta_mul_LFunction`, `TauCeti/NumberTheory/LFunctions/DedekindZeta/
Quadratic.lean`), the window counts add. -/
theorem countOf_add_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hfac : ∀ ρ, multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    countOf hfinK T = countOf hfinζ T + countOf hfinχ T :=
  sum_inter_distrib hfac (hfinζ T (2 * T)) (hfinχ T (2 * T)) (hfinK T (2 * T))

/-- Theorem A-K at function level, on-line version. -/
theorem countOnOf_add_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hfac : ∀ ρ, multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    countOnOf hfinK T = countOnOf hfinζ T + countOnOf hfinχ T :=
  sum_inter_distrib hfac (lineFinite hfinζ T) (lineFinite hfinχ T) (lineFinite hfinK T)

/-! ## Smoke test (the defs are not vacuous) -/

/-- The zero multiplicity function: `0` everywhere (empty support). -/
def zeroMult : ZeroMult where
  mult := fun _ => 0
  windowFinite := by
    intro T₁ T₂
    have h : supp (fun _ : ℂ => 0) = ∅ := by
      ext ρ; simp [supp]
    simp [h]

@[simp] theorem zeroMult_count (T : ℝ) : zeroMult.count T = 0 := by
  simp [ZeroMult.count, zeroMult]

@[simp] theorem zeroMult_countOn (T : ℝ) : zeroMult.countOn T = 0 := by
  simp [ZeroMult.countOn, zeroMult]

/-- Trivially, the zero data satisfies every proportion bound. -/
example (c : ℝ) : EpsLower zeroMult c := by
  intro ε hε
  refine ⟨0, fun T hT => ?_⟩
  simp

-- ===== M2a layer (carried verbatim; see M2a.lean) =====

/-! ## M2a: structural-binder discharge

**BINDER INVENTORY** (donor-swap rewrites exactly `hAζ`/`hAχ` and nothing else):

`zetaK_two_thirds_wired` (below) still carries:
  - `hAζ`, `hAχ` — the proportion binders (zeta23 `Challenge.lean:131`/`:191` shapes).
    DONOR-SWAP SECTION (M2b, coordinator verdict 2026-11-09: Knausgård clean `*_of_local`
    layer discharges the ζ side with certificate binder; zeta23 ThmE the χ side).
  - `hK`, `hK1` — analyticity + at-most-simple-pole of `fK` (the ζ_K side): PORTED-STATEMENT
    binders from tauceti's `dedekindZetaC` meromorphic-continuation tree (M2b).
  - `hfac : FactorizationOnHalfPlane` — PORTED-STATEMENT binder: tauceti
    `TauCeti.NumberField.dedekindZeta_eq_riemannZeta_mul_LFunction`
    (TauCeti/NumberTheory/LFunctions/DedekindZeta/Quadratic.lean).
  - `hfinK`, `hfinζ`, `hfinχ` — window finiteness (mathlib `ZetaZeros.lean:68` side; M2b).
  - `hntopζ` — ζ-side `≠ ⊤` (M1 delta-1). **M2a residue**: the discharge needs "an
    eventually-zero ball for ζ has infinitely many zeros in a compact set", contradicting
    `IsCompact.inter_riemannZetaZeros_finite` (ZetaZeros.lean:68); the missing glue is an
    infinite/second-point-in-ball family lemma (see blueprint §M2a). `hntopχ` is DISCHARGED
    for nonprincipal χ (`LFunction_analyticOrderAt_ne_top` below).
Everything else is proved: `hζ`, `hχ`, `hP1` are one-liners
(`analyticAt_riemannZeta`, `analyticAt_LFunction`, `.mul`). -/

/-- Count-equality transfer for `EpsLower`. -/
theorem EpsLower_congr {z w : ZeroMult} {c : ℝ}
    (hcount : ∀ T, z.count T = w.count T) (hon : ∀ T, z.countOn T = w.countOn T)
    (h : EpsLower z c) : EpsLower w c := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := h ε hε
  exact ⟨T₀, fun T hT => by rw [← hcount, ← hon]; exact hT₀ T hT⟩

/-- **Germ congruence for multiplicities**: `multOf` depends only on the germ at `ρ`. -/
theorem multOf_congr {f g : ℂ → ℂ} {ρ : ℂ} (h : f =ᶠ[𝓝 ρ] g) : multOf f ρ = multOf g ρ := by
  unfold multOf
  by_cases hF : AnalyticAt ℂ f ρ
  · have hG : AnalyticAt ℂ g ρ := (analyticAt_congr h).mp hF
    rcases eq_or_ne (analyticOrderAt f ρ) ⊤ with h1 | h1
    · show (analyticOrderAt f ρ).toNat = (analyticOrderAt g ρ).toNat
      rw [h1, analyticOrderAt_eq_top.mpr
        (Filter.Eventually.mono (Filter.Eventually.and h (analyticOrderAt_eq_top.mp h1))
          fun z hz => by rw [← hz.1]; exact hz.2)]
    · rcases eq_or_ne (analyticOrderAt g ρ) ⊤ with h2 | h2
      · show (analyticOrderAt f ρ).toNat = (analyticOrderAt g ρ).toNat
        rw [h2, analyticOrderAt_eq_top.mpr
          (Filter.Eventually.mono (Filter.Eventually.and h.symm (analyticOrderAt_eq_top.mp h2))
            fun z hz => by rw [hz.1.symm]; exact hz.2)]
      · -- both finite: transfer the eq_natCast characterization across the germ equality
        have htrans : ∀ (F G : ℂ → ℂ) (hFG : F =ᶠ[𝓝 ρ] G) (hFA : AnalyticAt ℂ F ρ)
            (hGA : AnalyticAt ℂ G ρ) (k : ℕ),
            analyticOrderAt F ρ = k → analyticOrderAt G ρ = k := by
          intro F G hFG hFA hGA k hk
          obtain ⟨w, hw1, hw2, hw3⟩ := (AnalyticAt.analyticOrderAt_eq_natCast hFA (n := k)).mp hk
          exact (AnalyticAt.analyticOrderAt_eq_natCast hGA (n := k)).mpr
            ⟨w, hw1, hw2, hFG.symm.trans hw3⟩
        have hf : analyticOrderAt f ρ = (analyticOrderNatAt f ρ : ℕ∞) :=
          (Nat.cast_analyticOrderNatAt h1).symm
        have hgf : analyticOrderAt g ρ = (analyticOrderNatAt f ρ : ℕ∞) :=
          htrans f g h hF hG _ hf
        show (analyticOrderAt f ρ).toNat = (analyticOrderAt g ρ).toNat
        rw [hf, hgf]
  · have hG' : ¬ AnalyticAt ℂ g ρ := fun hg => hF ((analyticAt_congr h).mpr hg)
    unfold analyticOrderNatAt analyticOrderAt
    simp [hF, hG']

/-- The tauceti plugin point: factorization on the right half-plane (PORTED STATEMENT
BINDER — see the binder inventory above). -/
def FactorizationOnHalfPlane (fK fζ fχ : ℂ → ℂ) : Prop :=
  ∀ s : ℂ, 1 < s.re → fK s = fζ s * fχ s

/-- **The half-plane → global identity bridge** (assembly from ported pieces): if `fK`,
`fζ·fχ` are analytic off `s = 1`, have at most a simple pole at `1` (their `(s−1)`-multiples
are analytic there), and agree on the right half-plane, then they agree at every `s ≠ 1`
(identity principle on the `(s−1)`-multiplied entire functions). -/
theorem funEq_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s) (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s)
    (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hfac : FactorizationOnHalfPlane fK fζ fχ) :
    ∀ s : ℂ, s ≠ 1 → fK s = fζ s * fχ s := by
  have hOne : ∀ s : ℂ, AnalyticAt ℂ (fun z => z - 1) s := fun s =>
    Differentiable.analyticAt
      (Differentiable.sub differentiable_id (differentiable_const (1 : ℂ))) s
  have hG : AnalyticOnNhd ℂ (fun s => (s - 1) * fK s) Set.univ := by
    intro s _
    by_cases hs : s = 1
    · rw [hs]; exact hK1
    · exact (hOne s).mul (hK s hs)
  have hH : AnalyticOnNhd ℂ (fun s => (s - 1) * (fζ s * fχ s)) Set.univ := by
    intro s _
    by_cases hs : s = 1
    · rw [hs]; exact hP1
    · exact (hOne s).mul ((hζ s hs).mul (hχ s hs))
  have hopen : Complex.re ⁻¹' Set.Ioi (1 : ℝ) ∈ 𝓝 (2 : ℂ) :=
    (isOpen_Ioi.preimage Complex.continuous_re).mem_nhds (by norm_num)
  have heq : (fun s => (s - 1) * fK s) =ᶠ[𝓝 (2 : ℂ)]
      fun s => (s - 1) * (fζ s * fχ s) :=
    Filter.eventually_of_mem hopen fun z hz => by
      show (z - 1) * fK z = (z - 1) * (fζ z * fχ z)
      rw [hfac z hz]
  have hall := AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq hG hH
    isPreconnected_univ (Set.mem_univ (2 : ℂ)) heq
  intro s hs
  have h2 : (s - 1) * fK s = (s - 1) * (fζ s * fχ s) := hall (x := s) (Set.mem_univ s)
  exact mul_left_cancel₀ (sub_ne_zero_of_ne hs) h2

/-- No point of the open strip is `1`. -/
theorem stripWindow_ne_one {T₁ T₂ : ℝ} {ρ : ℂ} (hρ : ρ ∈ stripWindow T₁ T₂) : ρ ≠ 1 := by
  intro h
  rw [h] at hρ
  simp only [stripWindow, Set.mem_ofPred_eq] at hρ
  norm_num at hρ

/-- No point of the critical line is `1`. -/
theorem lineWindow_ne_one {T₁ T₂ : ℝ} {ρ : ℂ} (hρ : ρ ∈ lineWindow T₁ T₂) : ρ ≠ 1 :=
  stripWindow_ne_one (lineWindow_subset T₁ T₂ hρ)

open Classical in
/-- **Set-restricted counting lemma**: the window-additivity of `sum_inter_distrib` holds
when `c = a + b` only on the window (the factorization identity holds off `s = 1`, and `1`
is in no strip window). -/
theorem sum_inter_distrib_mem {a b c : ℂ → ℕ} {S : Set ℂ}
    (h : ∀ ρ ∈ S, c ρ = a ρ + b ρ)
    (ha : (supp a ∩ S).Finite) (hb : (supp b ∩ S).Finite) (hc : (supp c ∩ S).Finite) :
    ∑ ρ ∈ hc.toFinset, c ρ = (∑ ρ ∈ ha.toFinset, a ρ) + (∑ ρ ∈ hb.toFinset, b ρ) := by
  classical
  have hU : ((supp a ∪ supp b) ∩ S).Finite := by
    refine Set.Finite.subset (ha.union hb) ?_
    intro ρ hρ
    simp only [Set.mem_inter_iff, Set.mem_union] at hρ ⊢
    rcases hρ.1 with h' | h'
    · exact Or.inl ⟨h', hρ.2⟩
    · exact Or.inr ⟨h', hρ.2⟩
  have hcs : supp c ∩ S ⊆ (supp a ∪ supp b) ∩ S := by
    intro ρ hρ
    by_contra hmem
    have hnA : a ρ = 0 := by
      by_contra hne
      exact hmem ⟨Set.mem_union_left _ (mem_supp_iff.mpr hne), hρ.2⟩
    have hb0 : b ρ = 0 := by
      by_contra hne
      exact hmem ⟨Set.mem_union_right _ (mem_supp_iff.mpr hne), hρ.2⟩
    exact mem_supp_iff.mp hρ.1 (by rw [h ρ hρ.2, hnA, hb0])
  have e1 : ∑ ρ ∈ hc.toFinset, c ρ = ∑ ρ ∈ hU.toFinset, c ρ :=
    Finset.sum_subset
      ((Set.Finite.toFinset_subset_toFinset).mpr hcs)
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
  have hUmem : ∀ ρ ∈ hU.toFinset, ρ ∈ S := fun ρ hρ => (Set.Finite.mem_toFinset hU).mp hρ |>.2
  calc ∑ ρ ∈ hc.toFinset, c ρ = ∑ ρ ∈ hU.toFinset, c ρ := e1
    _ = ∑ ρ ∈ hU.toFinset, (a ρ + b ρ) :=
        Finset.sum_congr rfl fun ρ hρU => h ρ (hUmem ρ hρU)
    _ = (∑ ρ ∈ hU.toFinset, a ρ) + (∑ ρ ∈ hU.toFinset, b ρ) := Finset.sum_add_distrib
    _ = (∑ ρ ∈ ha.toFinset, a ρ) + (∑ ρ ∈ hb.toFinset, b ρ) := by rw [ea, eb]

/-- **Theorem A-K at function level, restricted factorization**: the factorization identity
is only needed off `s = 1` (exactly what `funEq_of_factorization` supplies). -/
theorem countOf_add_of_factorization_mem {fK fζ fχ : ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    countOf hfinK T = countOf hfinζ T + countOf hfinχ T :=
  sum_inter_distrib_mem (fun ρ hρ => hmult ρ (stripWindow_ne_one hρ))
    (hfinζ T (2 * T)) (hfinχ T (2 * T)) (hfinK T (2 * T))

/-- Theorem A-K at function level, on-line version. -/
theorem countOnOf_add_of_factorization_mem {fK fζ fχ : ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    countOnOf hfinK T = countOnOf hfinζ T + countOnOf hfinχ T :=
  sum_inter_distrib_mem (fun ρ hρ => hmult ρ (lineWindow_ne_one hρ))
    (lineFinite hfinζ T) (lineFinite hfinχ T) (lineFinite hfinK T)

/-! ### Analyticity / ≠ ⊤ instantiations (M2a(b)) -/

/-- ζ is analytic away from `s = 1` (mathlib `differentiableAt_riemannZeta`,
Mathlib/NumberTheory/LSeries/RiemannZeta.lean:139). -/
theorem analyticAt_riemannZeta {ρ : ℂ} (hρ : ρ ≠ 1) : AnalyticAt ℂ riemannZeta ρ :=
  DifferentiableOn.analyticAt differentiableOn_riemannZeta
    (isOpen_compl_singleton.mem_nhds hρ)

/-- L(s,χ) is analytic everywhere for nonprincipal χ (mathlib `differentiableAt_LFunction`,
Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:91, case `.inr`). -/
theorem analyticAt_LFunction {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} (hχ : χ ≠ 1)
    (ρ : ℂ) : AnalyticAt ℂ χ.LFunction ρ :=
  Differentiable.analyticAt
    (fun s => DirichletCharacter.differentiableAt_LFunction χ s (Or.inr hχ)) ρ

/-- L(s,χ) is not identically zero near any point: L is entire and `L(χ,1) ≠ 0`
(mathlib `DirichletCharacter.LFunction_apply_one_ne_zero`,
Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412). -/
theorem LFunction_not_eventuallyEq_zero {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ ≠ 1) (ρ : ℂ) : ¬ ∀ᶠ z in 𝓝 ρ, χ.LFunction z = 0 := by
  intro h
  have hL : AnalyticOnNhd ℂ χ.LFunction Set.univ := fun s _ => analyticAt_LFunction hχ s
  have h0 : AnalyticOnNhd ℂ (fun _ => (0 : ℂ)) Set.univ :=
    DifferentiableOn.analyticOnNhd
      (fun s _ => (differentiable_const (0 : ℂ) s).differentiableWithinAt) isOpen_univ
  have hall := AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq hL h0
    isPreconnected_univ (Set.mem_univ ρ) h
  exact DirichletCharacter.LFunction_apply_one_ne_zero hχ (hall (x := 1) (Set.mem_univ 1))

/-- L(s,χ) has finite order of vanishing everywhere (nonprincipal χ): the χ-side `≠ ⊤`
side condition of M1 delta-1, **discharged**. -/
theorem LFunction_analyticOrderAt_ne_top {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ ≠ 1) (ρ : ℂ) : analyticOrderAt χ.LFunction ρ ≠ ⊤ :=
  fun h => LFunction_not_eventuallyEq_zero hχ ρ
    ((analyticOrderAt_eq_top (f := (χ : DirichletCharacter ℂ N).LFunction) (z₀ := ρ)).mp h)

/-! ### The M2a wired headline -/

/-- **M2a WIRED HEADLINE** — dossier 42 Theorem B-K with every STRUCTURAL binder discharged:
the count algebra (`countOf/countOnOf_add_of_factorization_mem`), the factorization
multiplicity transfer (`funEq_of_factorization` + `multOf_congr` + `multOf_mul`), and the
χ-side `≠ ⊤` discharge are proved; `hAζ`/`hAχ` (donor swap), `hK`/`hK1`/`hfac`/`hfin*`
(tauceti ported statements) and the ζ-side `hntopζ` (M2a residue, see inventory) remain. -/
theorem zetaK_two_thirds_wired {fK fζ fχ : ℂ → ℂ}
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s) (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s)
    (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ))
    (hAζ : EpsLower ⟨multOf fζ, hfinζ⟩ (2 / 3))
    (hAχ : EpsLower ⟨multOf fχ, hfinχ⟩ (2 / 3)) :
    EpsLower ⟨multOf fK, hfinK⟩ (2 / 3) := by
  have hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fK ρ = multOf fζ ρ + multOf fχ ρ := by
    intro ρ hρ
    have hne1 : ∀ᶠ z in 𝓝 ρ, z ≠ 1 := isOpen_compl_singleton.mem_nhds hρ
    have hprod : fK =ᶠ[𝓝 ρ] (fζ * fχ) := by
      refine Filter.Eventually.mono hne1 fun z hz => ?_
      rw [Pi.mul_apply]
      exact funEq_of_factorization hK hζ hχ hK1 hP1 hfac z hz
    rw [multOf_congr hprod]
    exact multOf_mul (hζ ρ hρ) (hχ ρ hρ) (hntopζ ρ) (hntopχ ρ)
  refine EpsLower_congr (z := ZeroMult.add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩)
      (w := ⟨multOf fK, hfinK⟩) ?_ ?_ (assemble_eps hAζ hAχ)
  · intro T
    have h1 := countOf_add_of_factorization_mem hmult hfinK hfinζ hfinχ T
    have h2 := ZeroMult.count_add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T
    have eζ : (⟨multOf fζ, hfinζ⟩ : ZeroMult).count T = countOf hfinζ T := rfl
    have eχ : (⟨multOf fχ, hfinχ⟩ : ZeroMult).count T = countOf hfinχ T := rfl
    rw [h2, eζ, eχ, ← h1]
    rfl
  · intro T
    have h1 := countOnOf_add_of_factorization_mem hmult hfinK hfinζ hfinχ T
    have h2 := ZeroMult.countOn_add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T
    have eζ : (⟨multOf fζ, hfinζ⟩ : ZeroMult).countOn T = countOnOf hfinζ T := rfl
    have eχ : (⟨multOf fχ, hfinχ⟩ : ZeroMult).countOn T = countOnOf hfinχ T := rfl
    rw [h2, eζ, eχ, ← h1]
    rfl

-- ===== M3 layer (carried verbatim; see M3.lean) =====

/-! ## M3: the C_K common-zeros defect layer (dossier 42, Theorem C-K)

**BINDER INVENTORY**: `zetaK_five_sixths_defect` carries `hDζ`/`hDχ` (the DISTINCT-count
proportion binders — zeta23 `five_sixths_distinct` Challenge.lean:152 and
`dirichlet_five_sixths_distinct` :205 shapes; donor-swap section applies to these exactly as
to `hAζ`/`hAχ`); everything else is proved. `zetaK_five_sixths_of_negligible` adds the
explicit analytic binder `hCZ` (common on-line zeros negligible — no corpus can supply it;
this is the honest C_D obstruction). -/

/-- ℕ-valued multiplicities make the support of a sum exactly the union of the supports
(nonnegativity). -/
theorem supp_add_eq (a b : ℂ → ℕ) : supp (a + b) = supp a ∪ supp b := by
  ext ρ
  rw [mem_supp_iff, Set.mem_union, mem_supp_iff, mem_supp_iff]
  constructor
  · intro h
    by_contra hmem
    push_neg at hmem
    exact h (by rw [Pi.add_apply, hmem.1, hmem.2])
  · rintro (h | h)
    · intro hc
      exact h (Nat.add_eq_zero_iff.mp hc).1
    · intro hc
      exact h (Nat.add_eq_zero_iff.mp hc).2

open Classical in
/-- Distinct on-line zero count: the number of distinct on-line zeros in the window
(mirror of zeta23's distinct counts `N_d`/`N0star`, ChallengeDeps.lean:57). -/
noncomputable def ZeroMult.countDistinctOn (z : ZeroMult) (T : ℝ) : ℕ :=
  ((lineFinite z.windowFinite T).toFinset).card

open Classical in
/-- `C_D(T, 2T]`: the number of common on-line zeros of the two factors — the defect
quantity of dossier 42 Theorem C-K. -/
noncomputable def commonOnLine (z w : ZeroMult) (T : ℝ) : ℕ :=
  let hI : ((supp z.mult ∩ lineWindow T (2 * T)) ∩
      (supp w.mult ∩ lineWindow T (2 * T))).Finite :=
    Set.Finite.subset (lineFinite z.windowFinite T) Set.inter_subset_left
  hI.toFinset.card

/-- Inclusion–exclusion for the distinct counts: `D_{z+w} + C_D = D_z + D_w`. -/
theorem countDistinctOn_add (z w : ZeroMult) (T : ℝ) :
    (ZeroMult.add z w).countDistinctOn T + commonOnLine z w T
      = z.countDistinctOn T + w.countDistinctOn T := by
  have hA : (supp z.mult ∩ lineWindow T (2 * T)).Finite := lineFinite z.windowFinite T
  have hB : (supp w.mult ∩ lineWindow T (2 * T)).Finite := lineFinite w.windowFinite T
  have hU : ((supp z.mult ∩ lineWindow T (2 * T)) ∪
      (supp w.mult ∩ lineWindow T (2 * T))).Finite := hA.union hB
  have hset : supp (ZeroMult.add z w).mult ∩ lineWindow T (2 * T)
      = (supp z.mult ∩ lineWindow T (2 * T)) ∪ (supp w.mult ∩ lineWindow T (2 * T)) := by
    show supp (z.mult + w.mult) ∩ lineWindow T (2 * T) = _
    rw [supp_add_eq, Set.union_inter_distrib_right]
  have hK : (supp (ZeroMult.add z w).mult ∩ lineWindow T (2 * T)).Finite :=
    lineFinite (ZeroMult.add z w).windowFinite T
  have hI : ((supp z.mult ∩ lineWindow T (2 * T)) ∩
      (supp w.mult ∩ lineWindow T (2 * T))).Finite :=
    Set.Finite.subset hA Set.inter_subset_left
  have eL : (ZeroMult.add z w).countDistinctOn T = hU.toFinset.card := by
    unfold ZeroMult.countDistinctOn
    rw [((Set.Finite.toFinset_inj (hs := hK) (ht := hU))).mpr hset]
  have eI : commonOnLine z w T = hI.toFinset.card := rfl
  have eA : z.countDistinctOn T = hA.toFinset.card := rfl
  have eB : w.countDistinctOn T = hB.toFinset.card := rfl
  rw [eL, eI, eA, eB, Set.Finite.toFinset_union hA hB, Set.Finite.toFinset_inter hA hB,
    Finset.card_union_add_card_inter]

/-- The ε-form distinct-count proportion statement. -/
def EpsLowerDistinct (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
    (c - ε) * (z.count T : ℝ) ≤ (z.countDistinctOn T : ℝ)

/-- **Theorem C-K (defect form)** — dossier 42: the distinct-count proportion assembles
over the product zero data up to the explicit common-zeros defect `C_D`. -/
theorem assemble_eps_defect {z w : ZeroMult} {c : ℝ}
    (hz : EpsLowerDistinct z c) (hw : EpsLowerDistinct w c) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (c - ε) * ((ZeroMult.add z w).count T : ℝ)
        ≤ ((ZeroMult.add z w).countDistinctOn T : ℝ) + (commonOnLine z w T : ℝ) := by
  intro ε hε
  obtain ⟨T₁, hT₁⟩ := hz ε hε
  obtain ⟨T₂, hT₂⟩ := hw ε hε
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have hcard := countDistinctOn_add z w T
  rw [ZeroMult.count_add]
  push_cast
  have hmul : (c - ε) * ((z.count T : ℝ) + (w.count T : ℝ))
      = (c - ε) * (z.count T : ℝ) + (c - ε) * (w.count T : ℝ) := mul_add _ _ _
  have hd : (z.countDistinctOn T : ℝ) + (w.countDistinctOn T : ℝ)
      = ((ZeroMult.add z w).countDistinctOn T : ℝ) + (commonOnLine z w T : ℝ) :=
    by exact_mod_cast hcard.symm
  linarith

/-- **M3 HEADLINE (conditional)** — dossier 42 Theorem C-K at 5/6. Binders: `hDζ` =
zeta23 `five_sixths_distinct` (`Challenge.lean:152`), `hDχ` =
`dirichlet_five_sixths_distinct` (`Challenge.lean:205`). -/
theorem zetaK_five_sixths_defect {zζ zχ : ZeroMult}
    (hDζ : EpsLowerDistinct zζ (5 / 6)) (hDχ : EpsLowerDistinct zχ (5 / 6)) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (5 / 6 - ε) * ((ZeroMult.add zζ zχ).count T : ℝ)
        ≤ ((ZeroMult.add zζ zχ).countDistinctOn T : ℝ) + (commonOnLine zζ zχ T : ℝ) :=
  assemble_eps_defect hDζ hDχ

/-- **The hCZ binder form**: if the common-zeros defect is negligible (`hCZ`), the full
distinct-count proportion is recovered — the conditional content that no corpus can supply
(a common zero of ζ and L(χ_D) is a multiple zero of ζ_K; no bound on their count exists
anywhere). -/
theorem zetaK_five_sixths_of_negligible {zζ zχ : ZeroMult}
    (hDζ : EpsLowerDistinct zζ (5 / 6)) (hDχ : EpsLowerDistinct zχ (5 / 6))
    (hCZ : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (commonOnLine zζ zχ T : ℝ) ≤ ε * ((ZeroMult.add zζ zχ).count T : ℝ)) :
    EpsLowerDistinct (ZeroMult.add zζ zχ) (5 / 6) := by
  intro δ hδ
  obtain ⟨T₁, hT₁⟩ := zetaK_five_sixths_defect hDζ hDχ (δ / 2) (by linarith)
  obtain ⟨T₂, hT₂⟩ := hCZ (δ / 2) (by linarith)
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have hN : (0 : ℝ) ≤ ((ZeroMult.add zζ zχ).count T : ℝ) := Nat.cast_nonneg _
  nlinarith

/-! ## M2b: the donor swap — cumulative layer, transcribed clean-layer statements, landed theorems

**BINDER INVENTORY (post-M2b)** — the landed theorems carry, and only carry:
  - `hCert : cert` — Knausgård's local-inequality certificate as an explicit hypothesis
    (his `LocalInequality` Prop; opaque here). EnclOK precedent (zeta23
    `PairCeiling/NumericCert.lean:72`): his headline theorems carry a `native_decide`
    axiom (his `lean/axioms.txt`, 2026-10-06) and are NEVER consumed; his clean
    `*_of_local`/`*_of_layers` endpoints (propext/Classical.choice/Quot.sound only) are
    what is transcribed. External audit artifacts (never run): C++ box verifier
    (60,467,309 boxes), Python checkers, CHECKSUMS.sha256 (R8,
    `research/novelty/knausgaard-as-donor.md` §1b).
  - `hK673` / `hK839` — the transcriptions (defs below), cumulative (0,T] forms.
  - `hEχ` / `hEχd` — the χ-side statements from zeta23's ThmE (unmodified in his tree;
    cumulative variant), still binders.
  - the M2a structural set: `hζ`, `hχ`, `hK`, `hK1`, `hP1`, `hfac`, `hfinK/ζ/χ` (tauceti
    ported statements) and `hntopζ` — the M2a residue as its own named binder (discharge
    path: `IsCompact.inter_riemannZetaZeros_finite`, ZetaZeros.lean:68, vs an infinite
    ball family; blueprint §M2a). `hntopχ` is discharged for nonprincipal χ.

Transcribed sources (GitHub raw, kristianmk/839, paper 2 = arXiv:2610.08965):
  * `lean/Distinct839/Compose.lean`:
    `theorem distinct_zeros_839_of_local (hLoc : LocalInequality) : ∀ ε > 0, ∃ T₀ : ℝ,
    ∀ T ≥ T₀, (1645064 / 1960733 - ε) * (Ncount 0 T : ℝ) ≤ Ndist 0 T`
  * `lean/Simple673/Compose.lean`: `theorem simple_critical_zeros_673_of_layers (hWin …)
    (hLoc : LocalInequality) : SimpleCritical673` with `simpleCritical673_iff` the ε-form
    at 1669159 / 2478195 (N₀ˢ numerator, cumulative) — transcribed with the a-fortiori
    numerator upgrade (his N₀ˢ ≤ our `countOnCum`). -/

/-! ### Cumulative layer -/

/-- Finiteness of the critical-line support in a cumulative window (0, T]. -/
theorem lineFiniteCum {m : ℂ → ℕ} (hfin : WindowFinite m) (T : ℝ) :
    (supp m ∩ lineWindow 0 T).Finite :=
  Set.Finite.subset (hfin 0 T)
    (Set.inter_subset_inter (Subset.refl _) (lineWindow_subset 0 T))

open Classical in
/-- Cumulative count with multiplicity `N(0, T]` (his `Ncount 0 T`). -/
noncomputable def ZeroMult.countCum (z : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (z.windowFinite 0 T).toFinset, z.mult ρ

open Classical in
/-- Cumulative critical-line count with multiplicity. -/
noncomputable def ZeroMult.countOnCum (z : ZeroMult) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (lineFiniteCum z.windowFinite T).toFinset, z.mult ρ

open Classical in
/-- Cumulative distinct on-line count (his `Ndist 0 T` shape). -/
noncomputable def ZeroMult.countDistinctOnCum (z : ZeroMult) (T : ℝ) : ℕ :=
  (lineFiniteCum z.windowFinite T).toFinset.card

open Classical in
/-- The cumulative common-zeros defect `C_D(0, T]`. -/
noncomputable def commonOnLineCum (z w : ZeroMult) (T : ℝ) : ℕ :=
  let hI : ((supp z.mult ∩ lineWindow 0 T) ∩ (supp w.mult ∩ lineWindow 0 T)).Finite :=
    Set.Finite.subset (lineFiniteCum z.windowFinite T) Set.inter_subset_left
  hI.toFinset.card

/-- The ε-form cumulative proportion statement (with-multiplicity numerator). -/
def EpsLowerCum (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T → (c - ε) * (z.countCum T : ℝ) ≤ (z.countOnCum T : ℝ)

/-- The ε-form cumulative distinct-count proportion statement. -/
def EpsLowerDistinctCum (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
    (c - ε) * (z.countCum T : ℝ) ≤ (z.countDistinctOnCum T : ℝ)

theorem countCum_add (z w : ZeroMult) (T : ℝ) :
    (ZeroMult.add z w).countCum T = z.countCum T + w.countCum T :=
  sum_inter_distrib (a := z.mult) (b := w.mult) (c := z.mult + w.mult)
    (fun ρ => Pi.add_apply z.mult w.mult ρ)
    (z.windowFinite 0 T) (w.windowFinite 0 T) ((ZeroMult.add z w).windowFinite 0 T)

theorem countOnCum_add (z w : ZeroMult) (T : ℝ) :
    (ZeroMult.add z w).countOnCum T = z.countOnCum T + w.countOnCum T :=
  sum_inter_distrib (a := z.mult) (b := w.mult) (c := z.mult + w.mult)
    (fun ρ => Pi.add_apply z.mult w.mult ρ)
    (lineFiniteCum z.windowFinite T) (lineFiniteCum w.windowFinite T)
    (lineFiniteCum (ZeroMult.add z w).windowFinite T)

theorem countDistinctOnCum_add (z w : ZeroMult) (T : ℝ) :
    (ZeroMult.add z w).countDistinctOnCum T + commonOnLineCum z w T
      = z.countDistinctOnCum T + w.countDistinctOnCum T := by
  have hA : (supp z.mult ∩ lineWindow 0 T).Finite := lineFiniteCum z.windowFinite T
  have hB : (supp w.mult ∩ lineWindow 0 T).Finite := lineFiniteCum w.windowFinite T
  have hU : ((supp z.mult ∩ lineWindow 0 T) ∪ (supp w.mult ∩ lineWindow 0 T)).Finite :=
    hA.union hB
  have hset : supp (ZeroMult.add z w).mult ∩ lineWindow 0 T
      = (supp z.mult ∩ lineWindow 0 T) ∪ (supp w.mult ∩ lineWindow 0 T) := by
    show supp (z.mult + w.mult) ∩ lineWindow 0 T = _
    rw [supp_add_eq, Set.union_inter_distrib_right]
  have hK : (supp (ZeroMult.add z w).mult ∩ lineWindow 0 T).Finite :=
    lineFiniteCum (ZeroMult.add z w).windowFinite T
  have hI : ((supp z.mult ∩ lineWindow 0 T) ∩ (supp w.mult ∩ lineWindow 0 T)).Finite :=
    Set.Finite.subset hA Set.inter_subset_left
  have eL : (ZeroMult.add z w).countDistinctOnCum T = hU.toFinset.card := by
    unfold ZeroMult.countDistinctOnCum
    rw [((Set.Finite.toFinset_inj (hs := hK) (ht := hU))).mpr hset]
  have eI : commonOnLineCum z w T = hI.toFinset.card := rfl
  have eA : z.countDistinctOnCum T = hA.toFinset.card := rfl
  have eB : w.countDistinctOnCum T = hB.toFinset.card := rfl
  rw [eL, eI, eA, eB, Set.Finite.toFinset_union hA hB, Set.Finite.toFinset_inter hA hB,
    Finset.card_union_add_card_inter]

/-- **Monotone absorption** (the discharge engine; direction verified by R8 §2a): a
strictly stronger constant is absorbed for free — `(c−ε)·N ≤ (c′−ε)·N ≤ X`. -/
theorem EpsLowerCum_mono {z : ZeroMult} {c c' : ℝ} (hc : c ≤ c')
    (h : EpsLowerCum z c') : EpsLowerCum z c := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := h ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  have hN : (0 : ℝ) ≤ (z.countCum T : ℝ) := Nat.cast_nonneg _
  exact le_trans (mul_le_mul_of_nonneg_right (by linarith) hN) (hT₀ T hT)

theorem EpsLowerDistinctCum_mono {z : ZeroMult} {c c' : ℝ} (hc : c ≤ c')
    (h : EpsLowerDistinctCum z c') : EpsLowerDistinctCum z c := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := h ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  have hN : (0 : ℝ) ≤ (z.countCum T : ℝ) := Nat.cast_nonneg _
  exact le_trans (mul_le_mul_of_nonneg_right (by linarith) hN) (hT₀ T hT)

theorem two_thirds_le_673 : (2 / 3 : ℝ) ≤ 1669159 / 2478195 := by norm_num

theorem five_sixths_le_839 : (5 / 6 : ℝ) ≤ 1645064 / 1960733 := by norm_num

/-! ### Transcribed clean-layer statements (Knausgård donor) -/

/-- **Transcription of `simple_critical_zeros_673_of_layers`** (kristianmk/839,
`lean/Simple673/Compose.lean`; his layer hypotheses + `LocalInequality` rolled into
`hyps`). Numerator upgrade is a fortiori: his N₀ˢ ≤ our `countOnCum`. -/
def K673OfLayers (hyps : Prop) (z : ZeroMult) : Prop :=
  hyps → EpsLowerCum z (1669159 / 2478195)

/-- **Transcription of `distinct_zeros_839_of_local`** (kristianmk/839,
`lean/Distinct839/Compose.lean`; `hyps` = his `LocalInequality`). -/
def K839OfLocal (hyps : Prop) (z : ZeroMult) : Prop :=
  hyps → EpsLowerDistinctCum z (1645064 / 1960733)

/-! ### Cumulative wiring -/

open Classical in
noncomputable def countCumOf {f : ℂ → ℂ} (hfin : WindowFinite (multOf f)) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (hfin 0 T).toFinset, multOf f ρ

open Classical in
noncomputable def countOnCumOf {f : ℂ → ℂ} (hfin : WindowFinite (multOf f)) (T : ℝ) : ℕ :=
  ∑ ρ ∈ (lineFiniteCum hfin T).toFinset, multOf f ρ

theorem countCumOf_add_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    countCumOf hfinK T = countCumOf hfinζ T + countCumOf hfinχ T :=
  sum_inter_distrib_mem (fun ρ hρ => hmult ρ (stripWindow_ne_one hρ))
    (hfinζ 0 T) (hfinχ 0 T) (hfinK 0 T)

theorem countOnCumOf_add_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    countOnCumOf hfinK T = countOnCumOf hfinζ T + countOnCumOf hfinχ T :=
  sum_inter_distrib_mem (fun ρ hρ => hmult ρ (lineWindow_ne_one hρ))
    (lineFiniteCum hfinζ T) (lineFiniteCum hfinχ T) (lineFiniteCum hfinK T)

theorem countDistinctOnCum_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    (⟨multOf fK, hfinK⟩ : ZeroMult).countDistinctOnCum T
      = (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
          ⟨multOf fχ, hfinχ⟩).countDistinctOnCum T := by
  have hset : supp (multOf fK) ∩ lineWindow 0 T
      = (supp (multOf fζ) ∩ lineWindow 0 T) ∪ (supp (multOf fχ) ∩ lineWindow 0 T) := by
    ext ρ
    by_cases hρ : ρ ∈ lineWindow 0 T
    · have h1 := hmult ρ (lineWindow_ne_one hρ)
      show multOf fK ρ ≠ 0 ∧ ρ ∈ lineWindow 0 T ↔
        (multOf fζ ρ ≠ 0 ∧ ρ ∈ lineWindow 0 T) ∨ (multOf fχ ρ ≠ 0 ∧ ρ ∈ lineWindow 0 T)
      have hne : (multOf fζ ρ + multOf fχ ρ ≠ 0)
          ↔ (multOf fζ ρ ≠ 0 ∨ multOf fχ ρ ≠ 0) := by
        by_cases hζ0 : multOf fζ ρ = 0
        · by_cases hχ0 : multOf fχ ρ = 0
          · simp [hζ0, hχ0]
          · simp [hζ0, hχ0]
        · by_cases hχ0 : multOf fχ ρ = 0
          · simp [hζ0, hχ0]
          · simp [hζ0, hχ0]
      rw [h1, hne]
      by_cases hζ0 : multOf fζ ρ = 0
      · by_cases hχ0 : multOf fχ ρ = 0
        · simp [hζ0, hχ0]
        · simp [hζ0, hχ0]
      · by_cases hχ0 : multOf fχ ρ = 0
        · simp [hζ0, hχ0]
        · simp [hζ0, hχ0]
    · show multOf fK ρ ≠ 0 ∧ ρ ∈ lineWindow 0 T ↔
        (multOf fζ ρ ≠ 0 ∧ ρ ∈ lineWindow 0 T) ∨ (multOf fχ ρ ≠ 0 ∧ ρ ∈ lineWindow 0 T)
      constructor
      · rintro ⟨h, h'⟩
        exact absurd h' hρ
      · rintro (⟨h, h'⟩ | ⟨h, h'⟩)
        · exact absurd h' hρ
        · exact absurd h' hρ
  have hKey : supp (multOf fK) ∩ lineWindow 0 T
      = supp (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
          ⟨multOf fχ, hfinχ⟩).mult ∩ lineWindow 0 T := by
    rw [show supp (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
        ⟨multOf fχ, hfinχ⟩).mult = supp (multOf fζ + multOf fχ) from rfl,
      supp_add_eq, Set.union_inter_distrib_right]
    exact hset
  unfold ZeroMult.countDistinctOnCum
  rw [((Set.Finite.toFinset_inj
      (hs := lineFiniteCum hfinK T)
      (ht := lineFiniteCum (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
        ⟨multOf fχ, hfinχ⟩).windowFinite T))).mpr hKey]

theorem EpsLowerCum_congr {z w : ZeroMult} {c : ℝ}
    (hcount : ∀ T, z.countCum T = w.countCum T) (hon : ∀ T, z.countOnCum T = w.countOnCum T)
    (h : EpsLowerCum z c) : EpsLowerCum w c := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := h ε hε
  exact ⟨T₀, fun T hT => by rw [← hcount, ← hon]; exact hT₀ T hT⟩

/-- Cumulative assembly (same max-T₀ algebra as the dyadic `assemble_eps`). -/
theorem assemble_eps_cum {z w : ZeroMult} {c : ℝ}
    (hz : EpsLowerCum z c) (hw : EpsLowerCum w c) :
    EpsLowerCum (ZeroMult.add z w) c := by
  intro ε hε
  obtain ⟨T₁, hT₁⟩ := hz ε hε
  obtain ⟨T₂, hT₂⟩ := hw ε hε
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  rw [countCum_add, countOnCum_add]
  push_cast
  have hmul : (c - ε) * ((z.countCum T : ℝ) + (w.countCum T : ℝ))
      = (c - ε) * (z.countCum T : ℝ) + (c - ε) * (w.countCum T : ℝ) := mul_add _ _ _
  linarith

/-- Cumulative defect assembly (mirror of `assemble_eps_defect`). -/
theorem assemble_eps_defect_cum {z w : ZeroMult} {c : ℝ}
    (hz : EpsLowerDistinctCum z c) (hw : EpsLowerDistinctCum w c) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (c - ε) * ((ZeroMult.add z w).countCum T : ℝ)
        ≤ ((ZeroMult.add z w).countDistinctOnCum T : ℝ) + (commonOnLineCum z w T : ℝ) := by
  intro ε hε
  obtain ⟨T₁, hT₁⟩ := hz ε hε
  obtain ⟨T₂, hT₂⟩ := hw ε hε
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have hcard := countDistinctOnCum_add z w T
  rw [countCum_add]
  push_cast
  have hmul : (c - ε) * ((z.countCum T : ℝ) + (w.countCum T : ℝ))
      = (c - ε) * (z.countCum T : ℝ) + (c - ε) * (w.countCum T : ℝ) := mul_add _ _ _
  have hd : (z.countDistinctOnCum T : ℝ) + (w.countDistinctOnCum T : ℝ)
      = ((ZeroMult.add z w).countDistinctOnCum T : ℝ) + (commonOnLineCum z w T : ℝ) :=
    by exact_mod_cast hcard.symm
  linarith

/-- Multiplicity-level factorization at any `ρ ≠ 1` (composition of
`funEq_of_factorization`, `multOf_congr`, `multOf_mul`). -/
theorem hfac_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s) (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s)
    (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ) (ρ : ℂ) (hρ : ρ ≠ 1) :
    multOf fK ρ = multOf fζ ρ + multOf fχ ρ := by
  have hne1 : ∀ᶠ z in 𝓝 ρ, z ≠ 1 := isOpen_compl_singleton.mem_nhds hρ
  have hprod : fK =ᶠ[𝓝 ρ] (fζ * fχ) := by
    refine Filter.Eventually.mono hne1 fun z hz => ?_
    rw [Pi.mul_apply]
    exact funEq_of_factorization hK hζ hχ hK1 hP1 hfac z hz
  rw [multOf_congr hprod]
  exact multOf_mul (hζ ρ hρ) (hχ ρ hρ) (hntopζ ρ) (hntopχ ρ)

/-- The cumulative wiring core: factorization + the two cumulative proportion statements
give the cumulative proportion statement for `fK`'s zero data. -/
theorem epsLowerCum_of_factorization {fK fζ fχ : ℂ → ℂ} {c : ℝ}
    (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s) (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ))
    (hAζ : EpsLowerCum ⟨multOf fζ, hfinζ⟩ c) (hAχ : EpsLowerCum ⟨multOf fχ, hfinχ⟩ c) :
    EpsLowerCum ⟨multOf fK, hfinK⟩ c := by
  have hmult := hfac_of_factorization hK hζ hχ hK1 hP1 hntopζ hntopχ hfac
  refine EpsLowerCum_congr (z := ZeroMult.add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩)
      (w := ⟨multOf fK, hfinK⟩) ?_ ?_
    (assemble_eps_cum (z := ⟨multOf fζ, hfinζ⟩) (w := ⟨multOf fχ, hfinχ⟩) hAζ hAχ)
  · intro T
    have h1 := countCumOf_add_of_factorization hmult hfinK hfinζ hfinχ T
    have h2 := countCum_add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T
    have eζ : (⟨multOf fζ, hfinζ⟩ : ZeroMult).countCum T = countCumOf hfinζ T := rfl
    have eχ : (⟨multOf fχ, hfinχ⟩ : ZeroMult).countCum T = countCumOf hfinχ T := rfl
    rw [h2, eζ, eχ, ← h1]
    rfl
  · intro T
    have h1 := countOnCumOf_add_of_factorization hmult hfinK hfinζ hfinχ T
    have h2 := countOnCum_add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T
    have eζ : (⟨multOf fζ, hfinζ⟩ : ZeroMult).countOnCum T = countOnCumOf hfinζ T := rfl
    have eχ : (⟨multOf fχ, hfinχ⟩ : ZeroMult).countOnCum T = countOnCumOf hfinχ T := rfl
    rw [h2, eζ, eχ, ← h1]
    rfl

/-! ### The landed theorems -/

/-- **LANDED (2/3, with-multiplicity, cumulative)** — the pilot's landing theorem: for the
zero data of the quadratic Dedekind zeta (`fK`, identified via the factorization binders),
liminf N^{on}(0,T]/N(0,T] ≥ 2/3. Conditional ONLY on: Knausgård's certificate
(`hCert` + the transcribed clean layer `hK673`), zeta23's Dirichlet ThmE (`hEχ`), the
tauceti ported statements (`hζ`–`hfin*`, `hfac`), and the M2a residue binder `hntopζ`. -/
theorem zetaK_two_thirds_landed {fK fζ fχ : ℂ → ℂ} {cert : Prop}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ))
    (hCert : cert)
    (hK673 : K673OfLayers cert ⟨multOf fζ, hfinζ⟩)
    (hEχ : EpsLowerCum ⟨multOf fχ, hfinχ⟩ (2 / 3))
    (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s) (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ) :
    EpsLowerCum ⟨multOf fK, hfinK⟩ (2 / 3) :=
  epsLowerCum_of_factorization hζ hχ hK hK1 hP1 hntopζ hntopχ hfac hfinK hfinζ hfinχ
    (EpsLowerCum_mono two_thirds_le_673 (hK673 hCert)) hEχ

/-- **LANDED (distinct 5/6 + C_D defect, cumulative)**: the defect-form distinct theorem,
conditional on `hCert` + `hK839` + ThmE-distinct (`hEχd`) + the structural set. -/
theorem zetaK_distinct_five_sixths_landed {fK fζ fχ : ℂ → ℂ} {cert : Prop}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ))
    (hCert : cert)
    (hK839 : K839OfLocal cert ⟨multOf fζ, hfinζ⟩)
    (hEχd : EpsLowerDistinctCum ⟨multOf fχ, hfinχ⟩ (5 / 6))
    (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s) (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ) (ε : ℝ) (hε : ε > 0) :
    ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (5 / 6 - ε) * ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ)
        ≤ ((⟨multOf fK, hfinK⟩ : ZeroMult).countDistinctOnCum T : ℝ)
          + (commonOnLineCum ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T : ℝ) := by
  have hζ' : EpsLowerDistinctCum ⟨multOf fζ, hfinζ⟩ (5 / 6) :=
    EpsLowerDistinctCum_mono five_sixths_le_839 (hK839 hCert)
  have hmult := hfac_of_factorization hK hζ hχ hK1 hP1 hntopζ hntopχ hfac
  have hcum : ∀ T, (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T
      = (ZeroMult.add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩).countCum T := by
    intro T
    have h1 := countCumOf_add_of_factorization hmult hfinK hfinζ hfinχ T
    have h2 := countCum_add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T
    have eζ : (⟨multOf fζ, hfinζ⟩ : ZeroMult).countCum T = countCumOf hfinζ T := rfl
    have eχ : (⟨multOf fχ, hfinχ⟩ : ZeroMult).countCum T = countCumOf hfinχ T := rfl
    have eK : (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T = countCumOf hfinK T := rfl
    rw [h2, eK, h1, eζ, eχ]
  have hdist : ∀ T, (⟨multOf fK, hfinK⟩ : ZeroMult).countDistinctOnCum T
      = (ZeroMult.add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩).countDistinctOnCum T :=
    fun T => countDistinctOnCum_of_factorization hmult hfinK hfinζ hfinχ T
  obtain ⟨T₀, hT₀⟩ := assemble_eps_defect_cum hζ' hEχd ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  rw [hcum T, hdist T]
  exact hT₀ T hT

/-- **LANDED, hCZ-seamed stronger form**: with the common-zeros negligibility binder
`hCZ` (the honest obstruction — no corpus can supply it), the full distinct proportion
5/6 holds for the product zero data. -/
theorem zetaK_distinct_five_sixths_landed_of_negligible {fK fζ fχ : ℂ → ℂ} {cert : Prop}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ))
    (hCert : cert)
    (hK839 : K839OfLocal cert ⟨multOf fζ, hfinζ⟩)
    (hEχd : EpsLowerDistinctCum ⟨multOf fχ, hfinχ⟩ (5 / 6))
    (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s) (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ)
    (hCZ : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (commonOnLineCum ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T : ℝ)
        ≤ ε * ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ)) :
    EpsLowerDistinctCum ⟨multOf fK, hfinK⟩ (5 / 6) := by
  intro δ hδ
  obtain ⟨T₁, hT₁⟩ := zetaK_distinct_five_sixths_landed hfinK hfinζ hfinχ hCert hK839 hEχd
    hζ hχ hK hK1 hP1 hntopζ hntopχ hfac (δ / 2) (by linarith)
  obtain ⟨T₂, hT₂⟩ := hCZ (δ / 2) (by linarith)
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have hN : (0 : ℝ) ≤ ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ) := Nat.cast_nonneg _
  nlinarith

#print axioms zetaK_two_thirds_landed
#print axioms zetaK_distinct_five_sixths_landed
#print axioms zetaK_distinct_five_sixths_landed_of_negligible
