/-
M4a pilot — dossier 42 (zeta-k-two-thirds-product-assembly), milestone 4a: the distinct-
count RE-VOCABULARIZATION (strip-distinct). Implements research/pilots/42-M4-blueprint.md
§(b) (the QA flag of research/novelty/axiommath-as-donor.md §(c).2). Self-contained: the
GREEN M1 layer + M2a structural discharge + M3 dyadic defect layer + M2b cumulative layer,
carried from M2b.lean, with ONE family replaced in place: the cumulative DISTINCT-count
family now counts distinct zeros in the WHOLE STRIP (`stripWindow 0 T`), not on the
critical line — the faithful vocabulary of zeta23's `Ndist` (ChallengeDeps.lean:59),
Knausgård's `Ndist 0 T`, and ZetaZerosV2's `distinctZeroCount` (Definitions.lean:56).
M2b's on-line numerator was strictly stronger than any donor proves (on-line distinct ≤
strip distinct); nothing false was proved (the transcription was only ever a hypothesis),
but the binder was undischargeable. M1/M2a/M3/M2b files are FROZEN as the GREEN historical
record; this file is the corrected successor layer. mathlib v4.36.0-rc2 (checkout
ff2494ea). No sorry, no native_decide, no external CAS.

M4a changes vs M2b (all inside the cumulative distinct family; everything else verbatim):
  * `ZeroMult.distinctCountCum` (strip) replaces `ZeroMult.countDistinctOnCum` (on-line);
    `commonStripCum` replaces `commonOnLineCum`; `EpsLowerDistinctStripCum` replaces
    `EpsLowerDistinctCum` (names deliberately distinct — no shadowing of the frozen layer)
  * `distinctCountCum_add` / `distinctCountCum_of_factorization` /
    `EpsLowerDistinctStripCum_mono` / `assemble_eps_defect_strip_cum` — the same proofs at
    strip windows
  * `K839OfLocalStrip` — the now-VERBATIM-faithful transcription of Knausgård's
    `distinct_zeros_839_of_local` (1645064/1960733 over `Ndist 0 T` = strip distinct)
  * LANDED (restated, still certificate-conditional — the V2 donor swap that discharges
    the ζ side unconditionally is M4b, NOT this file): `zetaK_two_thirds_landed`
    (2/3-family untouched, carried), `zetaK_distinct_five_sixths_strip_landed` (+
    `_of_negligible` with the strip `hCZStrip` binder) — `#print axioms` at file end.
  * the M3 DYADIC distinct layer (`countDistinctOn` / `commonOnLine` / `EpsLowerDistinct`
    / `zetaK_five_sixths_*`) is carried verbatim as heritage — superseded for the distinct
    family by this strip layer (recorded in the M4c addendum, not edited).

M4b addendum (same file): appended below the M4a layer — the donor counting vocabulary
(exposed under the `V2` prefix), the pilot↔V2 glue (set/count identifications), the
numeric endpoint lemmas, the two ζ-side discharges, and the M4b LANDED theorems
(`zetaK_two_thirds_landed_of_V2`, `zetaK_distinct_five_sixths_strip_landed_of_V2` +
`_of_negligible`). The M4a landings above remain as the certificate-conditional record;
the M4b landings replace `hCert`/`hK673`/`hK839` by the V2 numeric endpoints (Knausgård
certificate machinery fully dropped on the ζ side). Direct-import upgrade APPLIED
(G2-green, 2026-11-14): the ζ side is discharged by the imported donor theorems
(`ZetaZeros.simple_proportion_d4`/`distinct_proportion_d5`); the verbatim-body fallback
file (mathlib-only, GREEN + full axcheck) is preserved at `logs/M4b-fallback-GREEN.lean`.
-/
import Mathlib
import ZetaZeros

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

/-! ## M4a: the re-vocabulary layer — cumulative STRIP-distinct counts, transcribed
clean-layer statements (faithful), landed theorems (restated).

**VOCABULARY NOTE (the M4a correction).** zeta23's `Ndist T₁ T₂ = (zerosIn T₁ T₂).ncard`
(`ChallengeDeps.lean:59`) counts distinct zeros in the WHOLE STRIP (ordinates in window);
Knausgård's `Ndist 0 T` is character-for-character that definition; ZetaZerosV2's
`distinctZeroCount T = (nontrivialZeros T).ncard` (`Definitions.lean:56`) likewise. M2b
transcribed the 839 statement onto an ON-LINE distinct numerator
(`countDistinctOnCum` over `lineWindow`) — a strengthening no donor proves (on-line
distinct ≤ strip distinct, wrong direction). M4a replaces the numerator by the faithful
strip count `distinctCountCum` (over `stripWindow 0 T`); the transcription is then
VERBATIM-faithful modulo the count identifications `Ncount 0 T ≡ countCum`,
`Ndist 0 T ≡ distinctCountCum`.

**BINDER INVENTORY (post-M4a)** — the restated landed theorems carry, and only carry:
  - `hCert : cert` — Knausgård's local-inequality certificate as an explicit hypothesis
    (his `LocalInequality` Prop; opaque here). EnclOK precedent (zeta23
    `PairCeiling/NumericCert.lean:72`): his headline theorems carry a `native_decide`
    axiom (his `lean/axioms.txt`, 2026-10-06) and are NEVER consumed; his clean
    `*_of_local`/`*_of_layers` endpoints (propext/Classical.choice/Quot.sound only) are
    what is transcribed. External audit artifacts (never run): C++ box verifier
    (60,467,309 boxes), Python checkers, CHECKSUMS.sha256 (R8,
    `research/novelty/knausgaard-as-donor.md` §1b).
  - `hK673` / `hK839` — the transcriptions (defs below), cumulative (0,T] forms; `hK839`
    now at the STRIP-distinct numerator.
  - `hEχ` / `hEχdStrip` — the χ-side statements from zeta23's ThmE (unmodified in his tree;
    cumulative variant; `hEχdStrip` at the strip-distinct numerator — ThmE's C-form is over
    `NdistL` = strip, so this too is the faithful shape), still binders.
  - the M2a structural set: `hζ`, `hχ`, `hK`, `hK1`, `hP1`, `hfac`, `hfinK/ζ/χ` (tauceti
    ported statements) and `hntopζ` — the M2a residue as its own named binder (discharge
    path: `IsCompact.inter_riemannZetaZeros_finite`, ZetaZeros.lean:68, vs an infinite
    ball family; blueprint §M2a). `hntopχ` is discharged for nonprincipal χ.
  - the negligible-defect form adds `hCZStrip` — common-STRIP-zeros negligibility (a common
    strip zero of ζ and L(χ_D) is a multiple zero of ζ_K; the `20-hCZ-NOTE.md` analysis
    transfers verbatim from the on-line special case).

Transcribed sources (GitHub raw, kristianmk/839, paper 2 = arXiv:2610.08965):
  * `lean/Distinct839/Compose.lean`:
    `theorem distinct_zeros_839_of_local (hLoc : LocalInequality) : ∀ ε > 0, ∃ T₀ : ℝ,
    ∀ T ≥ T₀, (1645064 / 1960733 - ε) * (Ncount 0 T : ℝ) ≤ Ndist 0 T`
  * `lean/Simple673/Compose.lean`: `theorem simple_critical_zeros_673_of_layers (hWin …)
    (hLoc : LocalInequality) : SimpleCritical673` with `simpleCritical673_iff` the ε-form
    at 1669159 / 2478195 (N₀ˢ numerator, cumulative) — transcribed with the a-fortiori
    numerator upgrade (his N₀ˢ ≤ our `countOnCum`); the 2/3-family is UNCHANGED from M2b. -/

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
/-- Cumulative STRIP-distinct count `N_d(0, T]` (M4a re-vocabulary): the number of
distinct zeros in the WHOLE strip window — zeta23's `Ndist 0 T`, Knausgård's `Ndist 0 T`,
ZetaZerosV2's `distinctZeroCount T` shape. -/
noncomputable def ZeroMult.distinctCountCum (z : ZeroMult) (T : ℝ) : ℕ :=
  (z.windowFinite 0 T).toFinset.card

open Classical in
/-- The cumulative common-STRIP-zeros defect `C_D(0, T]` (M4a re-vocabulary): distinct
zeros shared by both factors anywhere in the strip window. -/
noncomputable def commonStripCum (z w : ZeroMult) (T : ℝ) : ℕ :=
  let hI : ((supp z.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T)).Finite :=
    Set.Finite.subset (z.windowFinite 0 T) Set.inter_subset_left
  hI.toFinset.card

/-- The ε-form cumulative proportion statement (with-multiplicity numerator). -/
def EpsLowerCum (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T → (c - ε) * (z.countCum T : ℝ) ≤ (z.countOnCum T : ℝ)

/-- The ε-form cumulative STRIP-distinct proportion statement (M4a re-vocabulary; faithful
distinct-family numerator — see the vocabulary note above). -/
def EpsLowerDistinctStripCum (z : ZeroMult) (c : ℝ) : Prop :=
  ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
    (c - ε) * (z.countCum T : ℝ) ≤ (z.distinctCountCum T : ℝ)

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

/-- Inclusion–exclusion for the STRIP-distinct counts: `D_{z+w} + C_D = D_z + D_w`
(same proof as M2b's `countDistinctOnCum_add`, at strip windows). -/
theorem distinctCountCum_add (z w : ZeroMult) (T : ℝ) :
    (ZeroMult.add z w).distinctCountCum T + commonStripCum z w T
      = z.distinctCountCum T + w.distinctCountCum T := by
  have hA : (supp z.mult ∩ stripWindow 0 T).Finite := z.windowFinite 0 T
  have hB : (supp w.mult ∩ stripWindow 0 T).Finite := w.windowFinite 0 T
  have hU : ((supp z.mult ∩ stripWindow 0 T) ∪
      (supp w.mult ∩ stripWindow 0 T)).Finite := hA.union hB
  have hset : supp (ZeroMult.add z w).mult ∩ stripWindow 0 T
      = (supp z.mult ∩ stripWindow 0 T) ∪ (supp w.mult ∩ stripWindow 0 T) := by
    show supp (z.mult + w.mult) ∩ stripWindow 0 T = _
    rw [supp_add_eq, Set.union_inter_distrib_right]
  have hK : (supp (ZeroMult.add z w).mult ∩ stripWindow 0 T).Finite :=
    (ZeroMult.add z w).windowFinite 0 T
  have hI : ((supp z.mult ∩ stripWindow 0 T) ∩
      (supp w.mult ∩ stripWindow 0 T)).Finite :=
    Set.Finite.subset hA Set.inter_subset_left
  have eL : (ZeroMult.add z w).distinctCountCum T = hU.toFinset.card := by
    unfold ZeroMult.distinctCountCum
    rw [((Set.Finite.toFinset_inj (hs := hK) (ht := hU))).mpr hset]
  have eI : commonStripCum z w T = hI.toFinset.card := rfl
  have eA : z.distinctCountCum T = hA.toFinset.card := rfl
  have eB : w.distinctCountCum T = hB.toFinset.card := rfl
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

theorem EpsLowerDistinctStripCum_mono {z : ZeroMult} {c c' : ℝ} (hc : c ≤ c')
    (h : EpsLowerDistinctStripCum z c') : EpsLowerDistinctStripCum z c := by
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
`lean/Distinct839/Compose.lean`; `hyps` = his `LocalInequality`). M4a RE-VOCABULARIZED:
numerator = the STRIP-distinct `distinctCountCum`, verbatim-faithful to his `Ndist 0 T`
(zeta23 `ChallengeDeps.lean:59`; ZetaZerosV2 `Definitions.lean:56`). M2b's on-line
numerator was a strengthening no donor proves (QA flag,
`novelty/axiommath-as-donor.md` §(c).2). -/
def K839OfLocalStrip (hyps : Prop) (z : ZeroMult) : Prop :=
  hyps → EpsLowerDistinctStripCum z (1645064 / 1960733)

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

theorem distinctCountCum_of_factorization {fK fζ fχ : ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fK ρ = multOf fζ ρ + multOf fχ ρ)
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ)) (T : ℝ) :
    (⟨multOf fK, hfinK⟩ : ZeroMult).distinctCountCum T
      = (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
          ⟨multOf fχ, hfinχ⟩).distinctCountCum T := by
  have hset : supp (multOf fK) ∩ stripWindow 0 T
      = (supp (multOf fζ) ∩ stripWindow 0 T) ∪ (supp (multOf fχ) ∩ stripWindow 0 T) := by
    ext ρ
    by_cases hρ : ρ ∈ stripWindow 0 T
    · have h1 := hmult ρ (stripWindow_ne_one hρ)
      show multOf fK ρ ≠ 0 ∧ ρ ∈ stripWindow 0 T ↔
        (multOf fζ ρ ≠ 0 ∧ ρ ∈ stripWindow 0 T) ∨ (multOf fχ ρ ≠ 0 ∧ ρ ∈ stripWindow 0 T)
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
    · show multOf fK ρ ≠ 0 ∧ ρ ∈ stripWindow 0 T ↔
        (multOf fζ ρ ≠ 0 ∧ ρ ∈ stripWindow 0 T) ∨ (multOf fχ ρ ≠ 0 ∧ ρ ∈ stripWindow 0 T)
      constructor
      · rintro ⟨h, h'⟩
        exact absurd h' hρ
      · rintro (⟨h, h'⟩ | ⟨h, h'⟩)
        · exact absurd h' hρ
        · exact absurd h' hρ
  have hKey : supp (multOf fK) ∩ stripWindow 0 T
      = supp (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
          ⟨multOf fχ, hfinχ⟩).mult ∩ stripWindow 0 T := by
    rw [show supp (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
        ⟨multOf fχ, hfinχ⟩).mult = supp (multOf fζ + multOf fχ) from rfl,
      supp_add_eq, Set.union_inter_distrib_right]
    exact hset
  unfold ZeroMult.distinctCountCum
  rw [((Set.Finite.toFinset_inj
      (hs := hfinK 0 T)
      (ht := (ZeroMult.add (⟨multOf fζ, hfinζ⟩ : ZeroMult)
        ⟨multOf fχ, hfinχ⟩).windowFinite 0 T))).mpr hKey]

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

/-- Cumulative STRIP-distinct defect assembly (mirror of `assemble_eps_defect`, at the
M4a strip vocabulary). -/
theorem assemble_eps_defect_strip_cum {z w : ZeroMult} {c : ℝ}
    (hz : EpsLowerDistinctStripCum z c) (hw : EpsLowerDistinctStripCum w c) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (c - ε) * ((ZeroMult.add z w).countCum T : ℝ)
        ≤ ((ZeroMult.add z w).distinctCountCum T : ℝ) + (commonStripCum z w T : ℝ) := by
  intro ε hε
  obtain ⟨T₁, hT₁⟩ := hz ε hε
  obtain ⟨T₂, hT₂⟩ := hw ε hε
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have hcard := distinctCountCum_add z w T
  rw [countCum_add]
  push_cast
  have hmul : (c - ε) * ((z.countCum T : ℝ) + (w.countCum T : ℝ))
      = (c - ε) * (z.countCum T : ℝ) + (c - ε) * (w.countCum T : ℝ) := mul_add _ _ _
  have hd : (z.distinctCountCum T : ℝ) + (w.distinctCountCum T : ℝ)
      = ((ZeroMult.add z w).distinctCountCum T : ℝ) + (commonStripCum z w T : ℝ) :=
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

/-- **LANDED, M4a-restated (distinct 5/6 + C_D strip defect, cumulative)**: the
defect-form distinct theorem at the faithful STRIP-distinct vocabulary, conditional on
`hCert` + `hK839` (the faithful transcription) + ThmE-distinct (`hEχdStrip`, strip numerator)
+ the structural set. -/
theorem zetaK_distinct_five_sixths_strip_landed {fK fζ fχ : ℂ → ℂ} {cert : Prop}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ))
    (hCert : cert)
    (hK839 : K839OfLocalStrip cert ⟨multOf fζ, hfinζ⟩)
    (hEχdStrip : EpsLowerDistinctStripCum ⟨multOf fχ, hfinχ⟩ (5 / 6))
    (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s) (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ) (ε : ℝ) (hε : ε > 0) :
    ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (5 / 6 - ε) * ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ)
        ≤ ((⟨multOf fK, hfinK⟩ : ZeroMult).distinctCountCum T : ℝ)
          + (commonStripCum ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T : ℝ) := by
  have hζ' : EpsLowerDistinctStripCum ⟨multOf fζ, hfinζ⟩ (5 / 6) :=
    EpsLowerDistinctStripCum_mono five_sixths_le_839 (hK839 hCert)
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
  have hdist : ∀ T, (⟨multOf fK, hfinK⟩ : ZeroMult).distinctCountCum T
      = (ZeroMult.add ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩).distinctCountCum T :=
    fun T => distinctCountCum_of_factorization hmult hfinK hfinζ hfinχ T
  obtain ⟨T₀, hT₀⟩ := assemble_eps_defect_strip_cum hζ' hEχdStrip ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  rw [hcum T, hdist T]
  exact hT₀ T hT

/-- **LANDED, M4a-restated, hCZStrip-seamed stronger form**: with the common-STRIP-zeros
negligibility binder `hCZStrip` (the honest obstruction — no corpus can supply it), the full
distinct proportion 5/6 holds for the product zero data at the strip vocabulary. -/
theorem zetaK_distinct_five_sixths_strip_landed_of_negligible {fK fζ fχ : ℂ → ℂ}
    {cert : Prop}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf fζ))
    (hfinχ : WindowFinite (multOf fχ))
    (hCert : cert)
    (hK839 : K839OfLocalStrip cert ⟨multOf fζ, hfinζ⟩)
    (hEχdStrip : EpsLowerDistinctStripCum ⟨multOf fχ, hfinχ⟩ (5 / 6))
    (hζ : ∀ s ≠ 1, AnalyticAt ℂ fζ s) (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (fζ s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt fζ ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK fζ fχ)
    (hCZStrip : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (commonStripCum ⟨multOf fζ, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T : ℝ)
        ≤ ε * ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ)) :
    EpsLowerDistinctStripCum ⟨multOf fK, hfinK⟩ (5 / 6) := by
  intro δ hδ
  obtain ⟨T₁, hT₁⟩ := zetaK_distinct_five_sixths_strip_landed hfinK hfinζ hfinχ hCert
    hK839 hEχdStrip hζ hχ hK hK1 hP1 hntopζ hntopχ hfac (δ / 2) (by linarith)
  obtain ⟨T₂, hT₂⟩ := hCZStrip (δ / 2) (by linarith)
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have hN : (0 : ℝ) ≤ ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ) := Nat.cast_nonneg _
  nlinarith

-- ===== M4b layer (PRIMARY route: direct ZetaZerosV2 import; G2-green, applied 2026-11-14) =====

/-! ## M4b: the ZetaZerosV2 donor swap — PRIMARY ROUTE (direct import)

The ζ-side proportion inputs are ZetaZerosV2's numeric endpoints, CONSUMED DIRECTLY via
`import ZetaZeros` (root module; the full V2 lib + its redirected PrimeNumberTheoremAnd
dependency path build on our pin — `feasibility/axiommath-bump/logs/v2-run9.log` and G2
run3; donor hygiene triad on-pin, `feasibility/probe/logs-g/run3-g2.log`). The donor's
counting vocabulary is re-exposed below under the `V2` prefix by abbrevs, so the glue
lemmas and discharges read identically to the fallback transcription (the verbatim-body
fallback file, GREEN + full-coverage triad axcheck mathlib-only, is preserved at
`logs/M4b-fallback-GREEN.lean`). Donor statements: `ZetaZeros.simple_proportion_d4`
(`ZetaZerosV2/ZetaZeros/Main.lean:130`, `0.6725`) and `ZetaZeros.distinct_proportion_d5`
(`Main.lean:149`, `0.83625`); comparator-permitted axioms only, no sorry, no
native_decide (`novelty/axiommath-as-donor.md` §0). The two former binders
(`hV2d4`/`hV2d5`) are DISCHARGED by the imported theorems (`V2d4_endpoint`/
`V2d5_endpoint` below).
Constants: 2/3 = 0.6667 < 0.6725 (margin 0.0058) and 5/6 = 0.8333 < 0.83625
(margin 0.0029) — `norm_num`-clean.

Provenance of the discharged statements (A1, `novelty/pntplus-glue-as-donor.md`):
`simple/distinct_proportion_lower` ← `pairCorrelationFormula`
(`PairCorrelation/FromLandau.lean:52`) ← Landau log-derivative (`Landau/Formula.lean:170`)
← `RiemannZetaHadamard` (`Landau/Formula.lean:9`). -/

/-- PRIMARY ROUTE (direct import, G2-green): the donor's counting vocabulary
(`ZetaZerosV2/ZetaZeros/Definitions.lean:38–56`) re-exposed under the `V2` prefix, so
the glue and discharge layer below reads identically to the fallback transcription
(preserved at `logs/M4b-fallback-GREEN.lean`). -/
abbrev V2.nontrivialZeros : ℝ → Set ℂ := ZetaZeros.nontrivialZeros

noncomputable abbrev V2.zeroMultiplicity : ℂ → ℕ := ZetaZeros.zeroMultiplicity

noncomputable abbrev V2.zeroCount : ℝ → ℕ := ZetaZeros.zeroCount

noncomputable abbrev V2.simpleOnLineCount : ℝ → ℕ := ZetaZeros.simpleOnLineCount

noncomputable abbrev V2.distinctZeroCount : ℝ → ℕ := ZetaZeros.distinctZeroCount

/-! ### M4b glue: pilot vocabulary ↔ V2 vocabulary

The ← direction of the vanishing↔order dictionary needs `hntopζ` (the M2a residue
binder, carried by the landings exactly as the blueprint's binder table says: REMAINS);
the forward direction and the 2/3-side numerator bound do not. -/

/-- `multOf riemannZeta` is definitionally V2's `zeroMultiplicity`. -/
theorem multOf_riemannZeta_eq (ρ : ℂ) : multOf riemannZeta ρ = V2.zeroMultiplicity ρ := rfl

/-- No point of the open strip is `1` (helper for the iff applications). -/
theorem re_lt_one_ne_one {ρ : ℂ} (h0 : 0 < ρ.re) (h1 : ρ.re < 1) : ρ ≠ 1 := by
  intro h
  rw [h] at h1
  exact absurd h1 (by simp)

/-- **Vanishing ↔ positive-order dictionary** for ζ. Forward: mathlib
`apply_eq_zero_of_analyticOrderNatAt_ne_zero` (Analysis/Analytic/Order.lean:161).
Backward: analytic + `f ρ = 0` gives `analyticOrderAt ≠ 0`
(`AnalyticAt.analyticOrderAt_ne_zero`, Order.lean:152), and `hntopζ` upgrades the ℕ∞
order to the ℕ order (`Nat.cast_analyticOrderNatAt`, the M2a route). -/
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

/-- **Set identification (strip):** pilot support-window = V2 zero-set, under `hntopζ`. -/
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
/-- **Count identification:** pilot `countCum` = V2 `zeroCount` (the same multiplicity
function over the same finite set; the `∑ᶠ`-over-set side opens via `finsum_mem_def`
and closes via the finite-support bridge). -/
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
/-- **Distinct-count identification:** pilot `distinctCountCum` = V2 `distinctZeroCount`
(the M4a strip numerator IS V2's `N_d`; equality needs `hntopζ`, same as the set
identification). -/
theorem distinctCountCum_eq_distinctZeroCount
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤)
    (hfinζ : WindowFinite (multOf riemannZeta)) (T : ℝ) :
    (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).distinctCountCum T = V2.distinctZeroCount T := by
  have hset := supp_inter_strip_eq_nontrivialZeros hntopζ T
  have hA : (supp (multOf riemannZeta) ∩ stripWindow 0 T).Finite := hfinζ 0 T
  have hB : (V2.nontrivialZeros T).Finite := by rw [← hset]; exact hA
  show (hfinζ 0 T).toFinset.card = (V2.nontrivialZeros T).ncard
  rw [Set.ncard_eq_toFinset_card (V2.nontrivialZeros T) hB,
    (Set.Finite.toFinset_inj (hs := hB) (ht := hfinζ 0 T)).mpr hset.symm]

open Classical in
/-- **Numerator bound (2/3 side):** V2's `simpleOnLineCount` (set-card of simple on-line
zeros) ≤ pilot `countOnCum` (on-line mass) — each simple point carries mass ≥ 1. No
`hntopζ` needed (points of the simple set have multiplicity 1 ≠ 0). -/
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


/-! ### M4b numerics and discharges -/

/-- 2/3 = 0.66667 < 0.6725 (V2's `simple_proportion_d4` endpoint), `norm_num`-clean
(margin 0.00583…). -/
theorem two_thirds_le_d4 : (2 / 3 : ℝ) ≤ 0.6725 := by norm_num

/-- 5/6 = 0.83333 < 0.83625 (V2's `distinct_proportion_d5` endpoint), `norm_num`-clean
(margin 0.00292…). -/
theorem five_sixths_le_d5 : (5 / 6 : ℝ) ≤ 0.83625 := by norm_num

/-- **The imported donor endpoint** (was the fallback's `hV2d4` binder): Lamzouri Thm 1.1
(i) numeric form, `ZetaZeros.simple_proportion_d4` (`ZetaZerosV2/ZetaZeros/Main.lean:130`)
— triad-clean on our pin (G2 run3 + the `#print axioms` at file end). -/
theorem V2d4_endpoint : ∃ T₀ : ℝ, ∀ T ≥ T₀,
    (0.6725 : ℝ) < (V2.simpleOnLineCount T : ℝ) / (V2.zeroCount T : ℝ) :=
  ZetaZeros.simple_proportion_d4

/-- **The imported donor endpoint** (was the fallback's `hV2d5` binder): Lamzouri Thm 1.1
(ii) numeric form, `ZetaZeros.distinct_proportion_d5` (`Main.lean:149`). -/
theorem V2d5_endpoint : ∃ T₀ : ℝ, ∀ T ≥ T₀,
    (0.83625 : ℝ) < (V2.distinctZeroCount T : ℝ) / (V2.zeroCount T : ℝ) :=
  ZetaZeros.distinct_proportion_d5

/-- **ζ-side 2/3 discharge from the V2 numeric endpoint** (hypothesis form; at the
landing theorems it is fed the imported `V2d4_endpoint`). The denominator positivity is
forced by the endpoint itself (`0.6725 < num/den` with `den = 0` impossible since
division by zero is `0` in ℝ). -/
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

/-- **ζ-side 5/6 strip-distinct discharge from the V2 numeric endpoint** (hypothesis
form; at the landing theorems it is fed the imported `V2d5_endpoint`; same shape as the
2/3 discharge — the numerator identification is an equality here). -/
theorem epsLowerDistinctStripCum_zeta_of_V2d5
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤)
    (hfinζ : WindowFinite (multOf riemannZeta))
    (hV2d5 : ∃ T₀ : ℝ, ∀ T ≥ T₀,
      (0.83625 : ℝ) < (V2.distinctZeroCount T : ℝ) / (V2.zeroCount T : ℝ)) :
    EpsLowerDistinctStripCum ⟨multOf riemannZeta, hfinζ⟩ (5 / 6) := by
  intro ε hε
  obtain ⟨T₀, hT₀⟩ := hV2d5
  refine ⟨T₀, fun T hT => ?_⟩
  have hT₀' := hT₀ T hT
  rcases Nat.eq_zero_or_pos (V2.zeroCount T) with h0 | h0
  · rw [h0, Nat.cast_zero, div_zero] at hT₀'
    exact absurd hT₀' (by norm_num)
  · have h0' : (0 : ℝ) < (V2.zeroCount T : ℝ) := by exact_mod_cast h0
    have hmul := (lt_div_iff₀ h0').mp hT₀'
    have h1 : (5 / 6 - ε) * ((⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T : ℝ)
        ≤ (0.83625 : ℝ) * (V2.zeroCount T : ℝ) := by
      rw [countCum_eq_zeroCount hntopζ hfinζ T]
      by_cases hε' : 5 / 6 ≤ ε
      · have hle : (5 / 6 - ε) * (V2.zeroCount T : ℝ) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg (by linarith) (Nat.cast_nonneg _)
        have hnn : (0 : ℝ) ≤ (0.83625 : ℝ) * (V2.zeroCount T : ℝ) :=
          mul_nonneg (by norm_num) (Nat.cast_nonneg _)
        linarith
      · exact mul_le_mul_of_nonneg_right
          (le_trans (by linarith) five_sixths_le_d5) (Nat.cast_nonneg _)
    rw [distinctCountCum_eq_distinctZeroCount hntopζ hfinζ T]
    calc (5 / 6 - ε) * ((⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T : ℝ)
        ≤ (0.83625 : ℝ) * (V2.zeroCount T : ℝ) := h1
      _ ≤ (V2.distinctZeroCount T : ℝ) := le_of_lt hmul

/-! ### M4b LANDED theorems (primary: ζ side discharged from the imported donor) -/

/-- **LANDED, M4b-primary (2/3, ζ-side discharged from the imported donor)**: the M4a/M2b
2/3 landing with the Knausgård certificate machinery REPLACED on the ζ side by V2's
numeric endpoint, imported (`V2d4_endpoint` = `ZetaZeros.simple_proportion_d4`); the
ζ-analyticity facts are DISCHARGED inline (`analyticAt_riemannZeta`; `hζ` of the M2b
shape is gone — it was a binder only while `fζ` was abstract). Remaining binders:
`hEχ`, the M2a structural set at `fζ := riemannZeta`, `hntopζ`, `hntopχ`. No `cert`, no
`native_decide` path anywhere. -/
theorem zetaK_two_thirds_landed_of_V2 {fK fχ : ℂ → ℂ}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf riemannZeta))
    (hfinχ : WindowFinite (multOf fχ))
    (hEχ : EpsLowerCum ⟨multOf fχ, hfinχ⟩ (2 / 3))
    (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (riemannZeta s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK riemannZeta fχ) :
    EpsLowerCum ⟨multOf fK, hfinK⟩ (2 / 3) :=
  epsLowerCum_of_factorization (fun _s hs => analyticAt_riemannZeta hs) hχ hK hK1 hP1 hntopζ hntopχ hfac
    hfinK hfinζ hfinχ (epsLowerCum_zeta_of_V2d4 hntopζ hfinζ V2d4_endpoint) hEχ

/-- **LANDED, M4b-primary (distinct 5/6 + strip defect)**: the M4a strip-distinct
landing with `hCert`/`hK839` replaced by the imported `ZetaZeros.distinct_proportion_d5`
(via `V2d5_endpoint`). -/
theorem zetaK_distinct_five_sixths_strip_landed_of_V2 {fK fχ : ℂ → ℂ}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf riemannZeta))
    (hfinχ : WindowFinite (multOf fχ))
    (hEχdStrip : EpsLowerDistinctStripCum ⟨multOf fχ, hfinχ⟩ (5 / 6))
    (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (riemannZeta s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK riemannZeta fχ) (ε : ℝ) (hε : ε > 0) :
    ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (5 / 6 - ε) * ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ)
        ≤ ((⟨multOf fK, hfinK⟩ : ZeroMult).distinctCountCum T : ℝ)
          + (commonStripCum ⟨multOf riemannZeta, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T : ℝ) := by
  have hζ' : EpsLowerDistinctStripCum ⟨multOf riemannZeta, hfinζ⟩ (5 / 6) :=
    epsLowerDistinctStripCum_zeta_of_V2d5 hntopζ hfinζ V2d5_endpoint
  have hmult := hfac_of_factorization hK (fun _s hs => analyticAt_riemannZeta hs) hχ hK1 hP1 hntopζ hntopχ hfac
  have hcum : ∀ T, (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T
      = (ZeroMult.add ⟨multOf riemannZeta, hfinζ⟩ ⟨multOf fχ, hfinχ⟩).countCum T := by
    intro T
    have h1 := countCumOf_add_of_factorization hmult hfinK hfinζ hfinχ T
    have h2 := countCum_add ⟨multOf riemannZeta, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T
    have eζ : (⟨multOf riemannZeta, hfinζ⟩ : ZeroMult).countCum T
        = countCumOf hfinζ T := rfl
    have eχ : (⟨multOf fχ, hfinχ⟩ : ZeroMult).countCum T = countCumOf hfinχ T := rfl
    have eK : (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T = countCumOf hfinK T := rfl
    rw [h2, eK, h1, eζ, eχ]
  have hdist : ∀ T, (⟨multOf fK, hfinK⟩ : ZeroMult).distinctCountCum T
      = (ZeroMult.add ⟨multOf riemannZeta, hfinζ⟩ ⟨multOf fχ, hfinχ⟩).distinctCountCum T :=
    fun T => distinctCountCum_of_factorization hmult hfinK hfinζ hfinχ T
  obtain ⟨T₀, hT₀⟩ := assemble_eps_defect_strip_cum hζ' hEχdStrip ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  rw [hcum T, hdist T]
  exact hT₀ T hT

/-- **LANDED, M4b-primary, hCZStrip-seamed stronger form**: the full 5/6 strip-distinct
proportion given additionally the common-strip-zeros negligibility binder. -/
theorem zetaK_distinct_five_sixths_strip_landed_of_V2_of_negligible {fK fχ : ℂ → ℂ}
    (hfinK : WindowFinite (multOf fK)) (hfinζ : WindowFinite (multOf riemannZeta))
    (hfinχ : WindowFinite (multOf fχ))
    (hEχdStrip : EpsLowerDistinctStripCum ⟨multOf fχ, hfinχ⟩ (5 / 6))
    (hχ : ∀ s ≠ 1, AnalyticAt ℂ fχ s)
    (hK : ∀ s ≠ 1, AnalyticAt ℂ fK s)
    (hK1 : AnalyticAt ℂ (fun s => (s - 1) * fK s) 1)
    (hP1 : AnalyticAt ℂ (fun s => (s - 1) * (riemannZeta s * fχ s)) 1)
    (hntopζ : ∀ ρ : ℂ, analyticOrderAt riemannZeta ρ ≠ ⊤)
    (hntopχ : ∀ ρ : ℂ, analyticOrderAt fχ ρ ≠ ⊤)
    (hfac : FactorizationOnHalfPlane fK riemannZeta fχ)
    (hCZStrip : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (commonStripCum ⟨multOf riemannZeta, hfinζ⟩ ⟨multOf fχ, hfinχ⟩ T : ℝ)
        ≤ ε * ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ)) :
    EpsLowerDistinctStripCum ⟨multOf fK, hfinK⟩ (5 / 6) := by
  intro δ hδ
  obtain ⟨T₁, hT₁⟩ := zetaK_distinct_five_sixths_strip_landed_of_V2 hfinK hfinζ hfinχ
    hEχdStrip hχ hK hK1 hP1 hntopζ hntopχ hfac (δ / 2) (by linarith)
  obtain ⟨T₂, hT₂⟩ := hCZStrip (δ / 2) (by linarith)
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left T₁ T₂) hT)
  have e2 := hT₂ T (le_trans (le_max_right T₁ T₂) hT)
  have hN : (0 : ℝ) ≤ ((⟨multOf fK, hfinK⟩ : ZeroMult).countCum T : ℝ) :=
    Nat.cast_nonneg _
  nlinarith


#print axioms zetaK_two_thirds_landed
#print axioms zetaK_distinct_five_sixths_strip_landed
#print axioms zetaK_distinct_five_sixths_strip_landed_of_negligible
#print axioms zetaK_two_thirds_landed_of_V2
#print axioms zetaK_distinct_five_sixths_strip_landed_of_V2
#print axioms zetaK_distinct_five_sixths_strip_landed_of_V2_of_negligible
#print axioms V2d4_endpoint
#print axioms V2d5_endpoint
#print axioms ZetaZeros.simple_proportion_d4
#print axioms ZetaZeros.distinct_proportion_d5
