/-
M3 pilot — dossier 42 (zeta-k-two-thirds-product-assembly), milestone 3:
the C_K common-zeros defect layer. Self-contained: carries the GREEN M1 layer verbatim
(research/pilots/42/M1.lean, run ap-TDkDWU9RqzgY4YfAyrsRNT) plus the M3 additions.
Zero ports; mathlib v4.36.0-rc2 (checkout ff2494ea). No sorry, no native_decide.

M3 content: distinct on-line counts (`countDistinctOn`), the common-zeros defect `C_D`
(`commonOnLine`), support-union equality (`supp_add_eq` — ℕ-nonnegativity), the
inclusion–exclusion identity (`countDistinctOn_add`), the ε-form `EpsLowerDistinct`,
the defect-form assembly (`assemble_eps_defect`, `zetaK_five_sixths_defect`), and the
hCZ-binder recovery theorem (`zetaK_five_sixths_of_negligible`).
-/
import Mathlib

namespace CrossMath.Pilot42

open Set Finset

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
