/-
Pilot 75 — dossier 75 (abelian-assembly zetaL proportions), wave-4 entry milestone
P-a + C1 (with-multiplicity). Lane A4, 2026-11-14. Spec: research/pilots/75-prework.md
§(a) N1-a + dossier 75 (P-a) + (C1) at 2/3; sequencing per the orchestrator's wave-4
decision (2026-11-14). Kernel-only artifact, math-proof1 standard: no sorry, no
native_decide, no external CAS.

Base vocabulary: the GREEN pilot-42 M4a layer (research/pilots/42/M4a.lean, 1,194 LoC,
runs m4-run2 OK 0/0 + full-coverage axcheck 54 theorems triad-only) carried VERBATIM
under namespace `CrossMath.Pilot75` — the pilot-01 duplication convention (self-contained
files). Everything below the `## P-a layer` banner is new this pilot.

New content (the n+1-factor lift; nothing else is new):
* `ZeroMult.addFin` + `countCum_addFin`/`countOnCum_addFin` + `sum_inter_distrib_fin_mem`
  — the n-ary counting core (N0's synthetic addFin plumbing check is folded: the lemmas
  are stated abstractly over arbitrary `ZeroMult` families before any donor statement).
* `analyticOrderAt_finset_prod`/`multOf_finprod`/`analyticOrderAt_finprod_ne_top` — the
  n-fold multiplicity glue, routed through the ℕ∞-level `analyticOrderAt_mul` (unconditional
  additivity) with `ENat.toNat` applied once at the end, so that ONLY per-factor
  `analyticOrderAt ≠ ⊤` hypotheses are consumed (no partial-product conditions).
* `multOf_of_abelFac` — `hAbFac : ∀ s ≠ 1, fL s = (∏ i, F i s) * fK s` gives the n-fold
  multiplicity factorization (EnclOK binder posture; discharge deferred to a G1-cleared
  DZDF build per 75-prework §(b)-1).
* `assemble_eps_cum_fin` — the n-ary ε-assembly.
* `zetaL_assembly_landed` (**P-a / N1-a**): `EpsLowerCum` at `c*` for the assembled ζ_L
  zero data from the ζ_K component at `c₀` and the family components at `c i`, for any
  lower bound `c* ≤ min (c₀, ⨅ i, c i)` (the binder-form of the spec's `c*`).
* `zetaL_two_thirds_conditional` (**C1**): the instantiation at the classical constant
  2/3 — ζ_K component via the carried `K673OfLayers` slot (Knausgård 673 ≥ 2/3), family
  components as `2/3` binders. This mirrors pilot-42's `zetaK_two_thirds_landed` one
  degree up the tower (n+1 factors).

P-b (strip-distinct 5/6 defect forms) is NOT in this milestone — priced item per
75-prework §(e) risk (ii); sequenced after P-a/C1 GREEN.
-/
import Mathlib

namespace CrossMath.Pilot75

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

#print axioms zetaK_two_thirds_landed
#print axioms zetaK_distinct_five_sixths_strip_landed
#print axioms zetaK_distinct_five_sixths_strip_landed_of_negligible


/-! ## P-a layer: the n-fold (abelian) assembly engine (pilot 75 new content) -/

section PaLayer

variable {ι : Type*} [Fintype ι]

/-! ### The n-ary counting core -/

open Classical in
/-- **n-ary counting lemma (mixed form)**: if `c ρ = a ρ + ∑ i, m i ρ` holds on `S`, then
the `S`-window sum of `c` splits into the `a`-window sum plus the per-component window
sums (the n-ary lift of `sum_inter_distrib_mem`; N0's synthetic `addFin` plumbing check,
stated abstractly before any donor statement is touched). -/
theorem sum_inter_distrib_fin_mem {m : ι → ℂ → ℕ} {a c : ℂ → ℕ} {S : Set ℂ}
    (h : ∀ ρ ∈ S, c ρ = a ρ + ∑ i, m i ρ)
    (hfina : (supp a ∩ S).Finite) (hfinm : ∀ i, (supp (m i) ∩ S).Finite)
    (hfinc : (supp c ∩ S).Finite) :
    ∑ ρ ∈ hfinc.toFinset, c ρ
      = (∑ ρ ∈ hfina.toFinset, a ρ) + ∑ i, ∑ ρ ∈ (hfinm i).toFinset, m i ρ := by
  have hUfin : ((supp a ∩ S) ∪ ⋃ i, (supp (m i) ∩ S)).Finite :=
    hfina.union (Set.finite_iUnion fun i => hfinm i)
  have hUS : (supp a ∩ S) ∪ ⋃ i, (supp (m i) ∩ S) ⊆ S :=
    Set.union_subset Set.inter_subset_right
      (Set.iUnion_subset fun _ => Set.inter_subset_right)
  have hmemU : ∀ ρ, ρ ∈ hUfin.toFinset → ρ ∈ S := fun ρ hρ => hUS (hUfin.mem_toFinset.mp hρ)
  have hsub : supp c ∩ S ⊆ (supp a ∩ S) ∪ ⋃ i, (supp (m i) ∩ S) := by
    intro ρ hρ
    by_contra hall
    rw [Set.mem_union, not_or, Set.mem_iUnion, not_exists] at hall
    have ha0 : a ρ = 0 := by
      by_contra hne
      exact hall.1 ⟨mem_supp_iff.mpr hne, hρ.2⟩
    have hm0 : ∀ i, m i ρ = 0 := fun i => by
      by_contra hne
      exact hall.2 i ⟨mem_supp_iff.mpr hne, hρ.2⟩
    have hc0 : c ρ = 0 := by
      rw [h ρ hρ.2, ha0, Finset.sum_eq_zero fun i _ => hm0 i]
      rfl
    exact mem_supp_iff.mp hρ.1 hc0
  have e1 : ∑ ρ ∈ hfinc.toFinset, c ρ
      = ∑ ρ ∈ hUfin.toFinset, c ρ := by
    refine Finset.sum_subset (Set.Finite.toFinset_subset_toFinset.mpr hsub) ?_
    intro ρ hρ hρ'
    by_contra hne
    exact hρ' (hfinc.mem_toFinset.mpr ⟨mem_supp_iff.mpr hne, hmemU ρ hρ⟩)
  have e2 : ∑ ρ ∈ hUfin.toFinset, c ρ
      = ∑ ρ ∈ hUfin.toFinset, (a ρ + ∑ i, m i ρ) :=
    Finset.sum_congr rfl fun ρ hρ => h ρ (hmemU ρ hρ)
  have e3 : ∑ ρ ∈ hUfin.toFinset, (a ρ + ∑ i, m i ρ)
      = (∑ ρ ∈ hUfin.toFinset, a ρ) + ∑ i, ∑ ρ ∈ hUfin.toFinset, m i ρ := by
    rw [Finset.sum_add_distrib, Finset.sum_comm]
  have e4 : ∀ i, ∑ ρ ∈ hUfin.toFinset, m i ρ = ∑ ρ ∈ (hfinm i).toFinset, m i ρ := by
    intro i
    refine (Finset.sum_subset (Set.Finite.toFinset_subset_toFinset.mpr ?_) ?_).symm
    · intro x hx
      exact Or.inr (Set.mem_iUnion.mpr ⟨i, hx⟩)
    · intro ρ hρ hρ'
      by_contra hne
      exact hρ' ((hfinm i).mem_toFinset.mpr ⟨mem_supp_iff.mpr hne, hmemU ρ hρ⟩)
  have e5 : ∑ ρ ∈ hUfin.toFinset, a ρ = ∑ ρ ∈ hfina.toFinset, a ρ := by
    refine (Finset.sum_subset (Set.Finite.toFinset_subset_toFinset.mpr ?_) ?_).symm
    · intro x hx
      exact Or.inl hx
    · intro ρ hρ hρ'
      by_contra hne
      exact hρ' (hfina.mem_toFinset.mpr ⟨mem_supp_iff.mpr hne, hmemU ρ hρ⟩)
  rw [e1, e2, e3, e5]
  exact congrArg _ (Finset.sum_congr rfl fun i _ => e4 i)

/-- Pointwise n-ary sum of multiplicity functions — the zero data of a finite product. -/
def ZeroMult.addFin (z : ι → ZeroMult) : ZeroMult where
  mult := fun ρ => ∑ i, (z i).mult ρ
  windowFinite := by
    intro T₁ T₂
    refine Set.Finite.subset (Set.finite_iUnion fun i => (z i).windowFinite T₁ T₂) ?_
    intro ρ hρ
    by_contra hall
    rw [Set.mem_iUnion, not_exists] at hall
    have hne0 : ∑ i, (z i).mult ρ ≠ 0 := mem_supp_iff.mp hρ.1
    exact hne0 (Finset.sum_eq_zero fun i _ => by
      by_contra hne
      exact hall i ⟨mem_supp_iff.mpr hne, hρ.2⟩)

open Classical in
theorem countCum_addFin (z : ι → ZeroMult) (T : ℝ) :
    (ZeroMult.addFin z).countCum T = ∑ i, (z i).countCum T := by
  have hfin0 : (supp (fun _ : ℂ => (0 : ℕ)) ∩ stripWindow 0 T).Finite := by
    have hempty : supp (fun _ : ℂ => (0 : ℕ)) ∩ stripWindow 0 T = ∅ := by ext ρ; simp [supp]
    rw [hempty]; exact Set.finite_empty
  have hcore := sum_inter_distrib_fin_mem (m := fun i => (z i).mult)
    (a := fun _ => (0 : ℕ)) (c := (ZeroMult.addFin z).mult)
    (fun ρ _ => (Nat.zero_add _).symm) hfin0 (fun i => (z i).windowFinite 0 T)
    ((ZeroMult.addFin z).windowFinite 0 T)
  have ha0 : ∑ ρ ∈ hfin0.toFinset, (fun _ : ℂ => (0 : ℕ)) ρ = 0 :=
    Finset.sum_eq_zero fun _ _ => rfl
  unfold ZeroMult.countCum
  rw [hcore, ha0, zero_add]

open Classical in
theorem countOnCum_addFin (z : ι → ZeroMult) (T : ℝ) :
    (ZeroMult.addFin z).countOnCum T = ∑ i, (z i).countOnCum T := by
  have hfin0 : (supp (fun _ : ℂ => (0 : ℕ)) ∩ lineWindow 0 T).Finite := by
    have hempty : supp (fun _ : ℂ => (0 : ℕ)) ∩ lineWindow 0 T = ∅ := by ext ρ; simp [supp]
    rw [hempty]; exact Set.finite_empty
  have hcore := sum_inter_distrib_fin_mem (m := fun i => (z i).mult)
    (a := fun _ => (0 : ℕ)) (c := (ZeroMult.addFin z).mult)
    (fun ρ _ => (Nat.zero_add _).symm) hfin0 (fun i => lineFiniteCum (z i).windowFinite T)
    (lineFiniteCum (ZeroMult.addFin z).windowFinite T)
  have ha0 : ∑ ρ ∈ hfin0.toFinset, (fun _ : ℂ => (0 : ℕ)) ρ = 0 :=
    Finset.sum_eq_zero fun _ _ => rfl
  unfold ZeroMult.countOnCum
  rw [hcore, ha0, zero_add]

/-! ### The n-fold multiplicity glue (ℕ∞ route) -/

private theorem analyticAt_finset_prod' {κ : Type*} {g : κ → ℂ → ℂ} (s : Finset κ) {ρ : ℂ} :
    (∀ i ∈ s, AnalyticAt ℂ (g i) ρ) → AnalyticAt ℂ (fun x => ∏ i ∈ s, g i x) ρ := by
  induction s using Finset.cons_induction with
  | empty =>
    intro _
    have hfun : (fun x => ∏ i ∈ (∅ : Finset κ), g i x) = fun _ => (1 : ℂ) :=
      funext fun _ => Finset.prod_empty
    rw [hfun]
    exact analyticAt_const
  | cons a t ha ih =>
    intro h
    have hfun : (fun x => ∏ i ∈ Finset.cons a t ha, g i x)
        = (g a) * (fun x => ∏ i ∈ t, g i x) := funext fun _ => Finset.prod_cons ha
    rw [hfun]
    exact (h a (Finset.mem_cons_self a t)).mul
      (ih fun i hi => h i (Finset.mem_cons_of_mem hi))

private theorem analyticOrderAt_finset_prod' {κ : Type*} {g : κ → ℂ → ℂ} (s : Finset κ)
    {ρ : ℂ} : (∀ i ∈ s, AnalyticAt ℂ (g i) ρ) →
    analyticOrderAt (fun x => ∏ i ∈ s, g i x) ρ = ∑ i ∈ s, analyticOrderAt (g i) ρ := by
  induction s using Finset.cons_induction with
  | empty =>
    intro _
    have hfun : (fun x => ∏ i ∈ (∅ : Finset κ), g i x) = fun _ => (1 : ℂ) :=
      funext fun _ => Finset.prod_empty
    rw [hfun,
      (analyticAt_const (v := (1 : ℂ)) (x := ρ)).analyticOrderAt_eq_zero.mpr one_ne_zero]
    simp
  | cons a t ha ih =>
    intro h
    have hfun : (fun x => ∏ i ∈ Finset.cons a t ha, g i x)
        = (g a) * (fun x => ∏ i ∈ t, g i x) := funext fun _ => Finset.prod_cons ha
    rw [hfun,
      analyticOrderAt_mul (h a (Finset.mem_cons_self a t))
        (analyticAt_finset_prod' t fun i hi => h i (Finset.mem_cons_of_mem hi)),
      ih fun i hi => h i (Finset.mem_cons_of_mem hi), Finset.sum_cons ha]

private theorem toNat_sum_finset {κ : Type*} {o : κ → ℕ∞} :
    ∀ (s : Finset κ), (∀ i ∈ s, o i ≠ ⊤) →
      (∑ i ∈ s, o i).toNat = ∑ i ∈ s, (o i).toNat ∧ (∑ i ∈ s, o i) ≠ ⊤ := by
  intro s
  induction s using Finset.cons_induction with
  | empty => intro _; exact ⟨rfl, by simp⟩
  | cons a t ha ih =>
    intro h
    have ha' : o a ≠ ⊤ := h a (Finset.mem_cons_self a t)
    obtain ⟨h1, h2⟩ := ih fun i hi => h i (Finset.mem_cons_of_mem hi)
    have hsum : ∑ i ∈ Finset.cons a t ha, o i = o a + ∑ i ∈ t, o i := Finset.sum_cons ha
    have htop : o a + ∑ i ∈ t, o i ≠ ⊤ := by
      intro htop
      rcases ENat.add_eq_top.mp htop with h3 | h4
      · exact ha' h3
      · exact h2 h4
    exact ⟨by rw [hsum, Finset.sum_cons ha, ENat.toNat_add ha' h2, h1], by rw [hsum]; exact htop⟩

/-- The multiplicity of a finite product is the sum of the multiplicities — per-factor
`≠ ⊤` hypotheses only (no partial-product conditions: additivity is applied at the ℕ∞
level, where it is unconditional, with `toNat` taken once at the end). -/
theorem multOf_finprod {κ : Type*} [Fintype κ] {g : κ → ℂ → ℂ} {ρ : ℂ}
    (han : ∀ i, AnalyticAt ℂ (g i) ρ) (hntop : ∀ i, analyticOrderAt (g i) ρ ≠ ⊤) :
    multOf (fun x => ∏ i, g i x) ρ = ∑ i, multOf (g i) ρ := by
  have hord := analyticOrderAt_finset_prod' (Finset.univ : Finset κ) fun i _ => han i
  have h2 := toNat_sum_finset (Finset.univ : Finset κ) fun i _ => hntop i
  show (analyticOrderAt (fun x => ∏ i, g i x) ρ).toNat
      = ∑ i, (analyticOrderAt (g i) ρ).toNat
  rw [hord, h2.1]

/-- A finite product of not-locally-identically-zero analytic factors is not locally
identically zero (derived, not hypothesized — this is where the 2-factor engine's
partial-product residue binder dissolves). -/
theorem analyticOrderAt_finprod_ne_top {κ : Type*} [Fintype κ] {g : κ → ℂ → ℂ} {ρ : ℂ}
    (han : ∀ i, AnalyticAt ℂ (g i) ρ) (hntop : ∀ i, analyticOrderAt (g i) ρ ≠ ⊤) :
    analyticOrderAt (fun x => ∏ i, g i x) ρ ≠ ⊤ := by
  have h2 := toNat_sum_finset (Finset.univ : Finset κ) fun i _ => hntop i
  intro h
  refine h2.2 ?_
  rw [← analyticOrderAt_finset_prod' (Finset.univ : Finset κ) fun i _ => han i]
  exact h

/-- **The n-fold multiplicity factorization behind `hAbFac`** (the EnclOK factorization
binder; discharge deferred to a G1-cleared DZDF build per 75-prework §(b)-1). -/
theorem multOf_of_abelFac {fL fK : ℂ → ℂ} {F : ι → ℂ → ℂ}
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (ρ : ℂ) (hρ : ρ ≠ 1) :
    multOf fL ρ = multOf fK ρ + ∑ i, multOf (F i) ρ := by
  have hne1 : ∀ᶠ z in 𝓝 ρ, z ≠ 1 := isOpen_compl_singleton.mem_nhds hρ
  have hprod : fL =ᶠ[𝓝 ρ] (fun s => (∏ i, F i s) * fK s) :=
    hne1.mono fun z hz => hAbFac z hz
  have hanP : AnalyticAt ℂ (fun s => ∏ i, F i s) ρ :=
    analyticAt_finset_prod' (Finset.univ : Finset ι) fun i _ => hF i ρ
  have hntopP : analyticOrderAt (fun s => ∏ i, F i s) ρ ≠ ⊤ :=
    analyticOrderAt_finprod_ne_top (fun i => hF i ρ) fun i => hntopF i ρ
  rw [multOf_congr hprod]
  show multOf ((fun s => ∏ i, F i s) * fK) ρ
      = multOf fK ρ + ∑ i, multOf (F i) ρ
  rw [multOf_mul hanP (hK ρ hρ) hntopP (hntopK ρ hρ),
    multOf_finprod (fun i => hF i ρ) fun i => hntopF i ρ]
  exact add_comm _ _

/-! ### The n-ary ε-assembly and the abelian-factorization wiring -/

/-- n-ary ε-assembly: a shared proportion constant assembles over any finite family of
zero data (the `Finset` lift of `assemble_eps_cum`). -/
theorem assemble_eps_cum_fin (z : ι → ZeroMult) {c : ℝ} (hz : ∀ i, EpsLowerCum (z i) c) :
    EpsLowerCum (ZeroMult.addFin z) c := by
  intro ε hε
  by_cases hne : Nonempty ι
  · obtain ⟨i₀⟩ := hne
    choose T₀ hT₀ using fun i => hz i ε hε
    refine ⟨Finset.univ.sup' ⟨i₀, Finset.mem_univ i₀⟩ T₀, fun T hT => ?_⟩
    have hsup : ∀ i, T₀ i ≤ Finset.univ.sup' ⟨i₀, Finset.mem_univ i₀⟩ T₀ := fun i =>
      Finset.le_sup' T₀ (Finset.mem_univ i)
    have e1 : ∀ i, (c - ε) * ((z i).countCum T : ℝ) ≤ ((z i).countOnCum T : ℝ) :=
      fun i => hT₀ i T (le_trans (hsup i) hT)
    rw [countCum_addFin, countOnCum_addFin]
    push_cast
    rw [Finset.mul_sum]
    exact Finset.sum_le_sum fun i _ => e1 i
  · have h0 : ∀ T, (ZeroMult.addFin z).countCum T = 0 := fun T =>
      Finset.sum_eq_zero fun ρ _ => by
        show ∑ i, (z i).mult ρ = 0
        exact Finset.sum_eq_zero fun i _ => (hne ⟨i⟩).elim
    refine ⟨0, fun T _ => by rw [h0 T]; simp⟩

open Classical in
/-- The n-fold factorization at the cumulative-count level: ζ_L's window count splits
into the ζ_K count plus the family counts. -/
theorem countCumOf_add_of_abFac {fL fK : ℂ → ℂ} {F : ι → ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fL ρ = multOf fK ρ + ∑ i, multOf (F i) ρ)
    (hfinL : WindowFinite (multOf fL)) (hfinK : WindowFinite (multOf fK))
    (hfinF : ∀ i, WindowFinite (multOf (F i))) (T : ℝ) :
    countCumOf hfinL T = countCumOf hfinK T + ∑ i, countCumOf (hfinF i) T := by
  unfold countCumOf
  exact sum_inter_distrib_fin_mem (fun ρ hρ => hmult ρ (stripWindow_ne_one hρ))
    (hfinK 0 T) (fun i => hfinF i 0 T) (hfinL 0 T)

open Classical in
/-- The n-fold factorization at the on-line cumulative-count level. -/
theorem countOnCumOf_add_of_abFac {fL fK : ℂ → ℂ} {F : ι → ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fL ρ = multOf fK ρ + ∑ i, multOf (F i) ρ)
    (hfinL : WindowFinite (multOf fL)) (hfinK : WindowFinite (multOf fK))
    (hfinF : ∀ i, WindowFinite (multOf (F i))) (T : ℝ) :
    countOnCumOf hfinL T = countOnCumOf hfinK T + ∑ i, countOnCumOf (hfinF i) T := by
  unfold countOnCumOf
  exact sum_inter_distrib_fin_mem (fun ρ hρ => hmult ρ (lineWindow_ne_one hρ))
    (lineFiniteCum hfinK T) (fun i => lineFiniteCum (hfinF i) T)
    (lineFiniteCum hfinL T)

/-- **P-a / N1-a — the abelian-assembly with-multiplicity landing**: the ζ_L zero data
carries the proportion constant `cStar` (any lower bound of `min (c₀, ⨅ i, c i)`; the
spec's `c*`) whenever the ζ_K component carries `c₀` and every abelian component carries
its `c i`. Engine: `multOf_of_abelFac` + `assemble_eps_cum_fin` + the 2-factor engine's
congruence wiring — no donor statement is consumed; every analytic/factorization fact is
an EnclOK binder. -/
theorem zetaL_assembly_landed {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ} {c₀ cStar : ℝ} {c : ι → ℝ}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hcK : cStar ≤ c₀) (hcF : ∀ i, cStar ≤ c i)
    (hAK : EpsLowerCum ⟨multOf fK, hfinK⟩ c₀)
    (hAF : ∀ i, EpsLowerCum ⟨multOf (F i), hfinF i⟩ (c i)) :
    EpsLowerCum ⟨multOf fL, hfinL⟩ cStar := by
  have hmult := multOf_of_abelFac hF hK hntopF hntopK hAbFac
  have hAsF : EpsLowerCum (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) cStar :=
    assemble_eps_cum_fin _ fun i => EpsLowerCum_mono (hcF i) (hAF i)
  have hAs := assemble_eps_cum (EpsLowerCum_mono hcK hAK) hAsF
  refine EpsLowerCum_congr
    (z := ZeroMult.add ⟨multOf fK, hfinK⟩
      (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩))
    (w := ⟨multOf fL, hfinL⟩) ?_ ?_ hAs
  · intro T
    have eK : (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T = countCumOf hfinK T := rfl
    have eL : (⟨multOf fL, hfinL⟩ : ZeroMult).countCum T = countCumOf hfinL T := rfl
    have eF : ∀ i, (⟨multOf (F i), hfinF i⟩ : ZeroMult).countCum T
        = countCumOf (hfinF i) T := fun _ => rfl
    have h1 := countCumOf_add_of_abFac hmult hfinL hfinK hfinF T
    have h2 := countCum_add (⟨multOf fK, hfinK⟩ : ZeroMult)
      (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T
    have h3 := countCum_addFin (fun i => ⟨multOf (F i), hfinF i⟩) T
    show (ZeroMult.add ⟨multOf fK, hfinK⟩
        (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩)).countCum T
      = (⟨multOf fL, hfinL⟩ : ZeroMult).countCum T
    rw [h2, h3, eK, Finset.sum_congr rfl fun i _ => eF i, ← h1, ← eL]
  · intro T
    have eK : (⟨multOf fK, hfinK⟩ : ZeroMult).countOnCum T = countOnCumOf hfinK T := rfl
    have eL : (⟨multOf fL, hfinL⟩ : ZeroMult).countOnCum T = countOnCumOf hfinL T := rfl
    have eF : ∀ i, (⟨multOf (F i), hfinF i⟩ : ZeroMult).countOnCum T
        = countOnCumOf (hfinF i) T := fun _ => rfl
    have h1 := countOnCumOf_add_of_abFac hmult hfinL hfinK hfinF T
    have h2 := countOnCum_add (⟨multOf fK, hfinK⟩ : ZeroMult)
      (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T
    have h3 := countOnCum_addFin (fun i => ⟨multOf (F i), hfinF i⟩) T
    show (ZeroMult.add ⟨multOf fK, hfinK⟩
        (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩)).countOnCum T
      = (⟨multOf fL, hfinL⟩ : ZeroMult).countOnCum T
    rw [h2, h3, eK, Finset.sum_congr rfl fun i _ => eF i, ← h1, ← eL]

/-- **C1 (2/3, with-multiplicity, cumulative)** — the conditional landing at the
classical constant: with the ζ_K component at Knausgård's 673 ≥ 2/3 (the carried
`K673OfLayers` slot) and every abelian component at 2/3 (the open core, as binders),
the assembled ζ_L zero data carries 2/3. Pilot-42's `zetaK_two_thirds_landed` one
degree up the tower. -/
theorem zetaL_two_thirds_conditional {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ} {cert : Prop}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hCert : cert)
    (hK673 : K673OfLayers cert ⟨multOf fK, hfinK⟩)
    (hAF : ∀ i, EpsLowerCum ⟨multOf (F i), hfinF i⟩ (2 / 3)) :
    EpsLowerCum ⟨multOf fL, hfinL⟩ (2 / 3) :=
  zetaL_assembly_landed hK hF hntopK hntopF hAbFac hfinK hfinL hfinF
    (le_refl _) (fun _ => le_refl _)
    (EpsLowerCum_mono two_thirds_le_673 (hK673 hCert)) hAF

end PaLayer

-- audit (expect: [propext, Classical.choice, Quot.sound] only)
#print axioms CrossMath.Pilot75.sum_inter_distrib_fin_mem
#print axioms CrossMath.Pilot75.countCum_addFin
#print axioms CrossMath.Pilot75.countOnCum_addFin
#print axioms CrossMath.Pilot75.multOf_finprod
#print axioms CrossMath.Pilot75.analyticOrderAt_finprod_ne_top
#print axioms CrossMath.Pilot75.multOf_of_abelFac
#print axioms CrossMath.Pilot75.assemble_eps_cum_fin
#print axioms CrossMath.Pilot75.countCumOf_add_of_abFac
#print axioms CrossMath.Pilot75.countOnCumOf_add_of_abFac
#print axioms CrossMath.Pilot75.zetaL_assembly_landed
#print axioms CrossMath.Pilot75.zetaL_two_thirds_conditional
#print axioms CrossMath.Pilot75.analyticAt_finset_prod'
#print axioms CrossMath.Pilot75.analyticOrderAt_finset_prod'
#print axioms CrossMath.Pilot75.toNat_sum_finset
