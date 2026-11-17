/-
Pilot 75 — dossier 75 (abelian-assembly zetaL proportions), the 5/6 STRIP-DISTINCT arm
P-b + C1(5/6). Lane A3 (execution; design lane A4), 2026-11-16. Spec:
qa/iter4-review/r5-iteration4-backlog.md §8 (EXECUTION SPEC A) over the authoritative
design research/pilots/75/Pb-design.md (A4, 2026-11-14). Kernel-only artifact,
math-proof1 standard: no sorry, no native_decide, no external CAS.

Base vocabulary: Pa.lean (the GREEN wave-4 entry milestone P-a + C1-at-2/3, 1,557 LoC,
run6-final rc=0/0/0, 17/17 in-file triad) carried VERBATIM above the `## P-b layer`
banner — the pilot-01 duplication convention (self-contained files; Pa.lean stays frozen
as the GREEN entry record). Pa.lean itself carries the GREEN pilot-42 M4a layer under
namespace `CrossMath.Pilot75`. Everything below the `## P-b layer` banner is new this
pilot.

New content (the n-fold Bonferroni lift of the M4a defect engine; nothing else is new):
* `ZeroMult.eq_of_mult` (private) — the F1 pre-empt (ZeroMult extensionality).
* `ZeroMult.addFinOver` + `addFinOver_cons` (**E1**) — sub-family aggregation.
* `commonStripCum_mono` (**E2b**) — monotonicity of the pair defect in both arguments.
* `commonStripCum_add_le` (**E2**) — binary sub-additivity.
* `commonStripCum_addFinOver_le` (**E3**) — the union-intersection bound.
* `bonferroni_addFinOver` (**E4**) — the two-level Bonferroni invariant, ORDERED-pair
  `Finset.offDiag` defect convention (each unordered pair counted twice; no linear order
  on ι; factor 2 harmless at the negligibility stage — Pb-design §0 THE CALL).
* `supp_addFin_inter` + `distinctCountCum_of_abelFac` (**E5**) — the n-ary distinct
  identification of ζ_L's strip-distinct count.
* `assemble_eps_defect_strip_cum_fin` (**E6 core**) — the n-ary defect assembly.
* `zetaL_assembly_distinct_defect_landed` (**Pb-1**) and
  `zetaL_assembly_distinct_landed_of_negligible` (**Pb-2**) — the defect-form and
  hCZStripFam-seamed landings at `c*`.
* `zetaL_distinct_five_sixths_strip_conditional(_of_negligible)` (**Pb-3 / C1-5/6**) —
  the 5/6 instantiation: ζ_K slot via the carried `K839OfLocalStrip` slot (Knausgård
  839 ≥ 5/6), family components as 5/6 binders — M4a's two distinct landings one degree
  up the tower.

Binder posture (unchanged from P-a): `hAbFac` is the statement-quoted mirror of DZDF
`abelianFactorization` (AbelianRayCharacterFactorization.lean:62) — never imported
(G1 dead); `hAKd`/`hAFd` (component strip-distinct proportions) are the named OPEN CORE
nobody has; `hCZStripFam` is a binder BY DESIGN (20-hCZ-NOTE's not-provable-today
verdict); window finiteness is carried explicitly. No donor imports anywhere.

Design remark (Pb-design §0, recorded here per spec): the `hCZStripFam` binder is stated
in the SUMMED form; it is discharge-equivalent to the per-pair form of 75-prework §(b)-6
(per-pair ⇒ summed via `Finset.sum_const` + card arithmetic at ε' := δ / (card univ ^ 2 + 1)
— a bookkeeping bridge, deliberately not a lemma here).

Fallback note (Pb-design §4): the spec-sanctioned iterated-2-factor fallback was NEVER
invoked — GREEN landed on the primary (offDiag) route at run 11 (2026-11-16, descent
55→…→1→0 over 11 runs under the continuation policy, every fix round with written
error-class hypotheses in logs/pb-run*.log).
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

/-! ## P-b layer: the n-fold Bonferroni lift of the M4a defect engine (pilot 75 new
content; E1–E6 per Pb-design §1 / r5-iteration4-backlog §8c). Defect convention:
ORDERED-pair defect (Pb-design §0 THE CALL), formalized at mathlib's `Finset.offDiag`
(the design's `(s ×ˢ s).offDiag` notation corrected to the API form `s.offDiag` —
run-1 H1; requires `[DecidableEq ι]`, added below).

Run-2 math finding (M1, recorded): the cons-step of E4 does not close from
monotonicity alone. E4 is therefore an abstract Finset-level Bonferroni
(`bonferroni_union_le`, cons-induction via `Finset.card_biUnion_le` + a both-column
offDiag-growth lemma) plus a cardinality transport through membership-`Finset.ext`;
`commonStripCum_mono` is retained as an engine lemma but is not load-bearing for E4.
The doubled offDiag convention absorbs the factor 2 via `Finset.inter_comm`
(the design §0 rationale, load-bearing). -/

section PbLayer

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-! ### E0 helpers (F1 pre-empt, uniform toFinset reps, zeroMult emptiness) -/

/-- **F1 pre-empt**: `ZeroMult` equality from pointwise multiplicity equality (the two
`WindowFinite` fields are proof-irrelevant). Private by design (Pb-design §1 E1 note). -/
private theorem ZeroMult.eq_of_mult {z w : ZeroMult} (h : ∀ ρ, z.mult ρ = w.mult ρ) :
    z = w := by
  obtain ⟨zm, zf⟩ := z
  obtain ⟨wm, wf⟩ := w
  have hm : zm = wm := funext h
  subst hm
  simp

/-- The pair defect, unfolded to a uniform toFinset rep (the same proof term as the
definition, so `rfl`; the anchor of every card manipulation below). -/
theorem commonStripCum_eq (z w : ZeroMult) (T : ℝ) :
    commonStripCum z w T =
      (Set.Finite.subset (z.windowFinite 0 T)
        (Set.inter_subset_left : (supp z.mult ∩ stripWindow 0 T)
          ∩ (supp w.mult ∩ stripWindow 0 T) ⊆ supp z.mult ∩ stripWindow 0 T)).toFinset.card :=
  rfl

private theorem not_mem_supp_zeroMult (ρ : ℂ) : ρ ∉ supp zeroMult.mult :=
  fun h => mem_supp_iff.mp h rfl

private theorem supp_zeroMult_inter_empty (S R : Set ℂ) :
    (supp zeroMult.mult ∩ S) ∩ R = ∅ := by
  ext ρ
  refine ⟨fun hρ => ?_, fun h => h.elim⟩
  exact not_mem_supp_zeroMult ρ hρ.1.1

private theorem inter_supp_zeroMult_empty (S R : Set ℂ) :
    R ∩ (supp zeroMult.mult ∩ S) = ∅ := by
  ext ρ
  refine ⟨fun hρ => ?_, fun h => h.elim⟩
  exact not_mem_supp_zeroMult ρ hρ.2.1

/-- **E2b**: the pair defect is monotone in both arguments (bigger support ⇒ bigger
intersection). Retained as an engine lemma (not load-bearing for E4 after the
re-architecture). -/
theorem commonStripCum_mono (u u' w w' : ZeroMult) (T : ℝ)
    (h1 : supp u.mult ⊆ supp u'.mult) (h2 : supp w.mult ⊆ supp w'.mult) :
    commonStripCum u w T ≤ commonStripCum u' w' T := by
  have hfL : ((supp u.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T)).Finite :=
    Set.Finite.subset (u.windowFinite 0 T) Set.inter_subset_left
  have hfR : ((supp u'.mult ∩ stripWindow 0 T) ∩ (supp w'.mult ∩ stripWindow 0 T)).Finite :=
    Set.Finite.subset (u'.windowFinite 0 T) Set.inter_subset_left
  have hsub : (supp u.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T)
      ⊆ (supp u'.mult ∩ stripWindow 0 T) ∩ (supp w'.mult ∩ stripWindow 0 T) :=
    Set.inter_subset_inter
      (Set.inter_subset_inter h1 (Subset.refl _))
      (Set.inter_subset_inter h2 (Subset.refl _))
  rw [commonStripCum_eq u w T, commonStripCum_eq u' w' T]
  refine Finset.card_le_card ?_
  intro p hp
  refine (Set.Finite.mem_toFinset _).mpr (hsub ?_)
  exact (Set.Finite.mem_toFinset _).mp hp

/-! ### E1 — sub-family aggregator -/

/-- **E1**: pointwise sum over a sub-family — the zero data of a partial product. -/
def ZeroMult.addFinOver (s : Finset ι) (z : ι → ZeroMult) : ZeroMult where
  mult := fun ρ => ∑ i ∈ s, (z i).mult ρ
  windowFinite := by
    intro T₁ T₂
    refine Set.Finite.subset (Set.Finite.biUnion (Finset.finite_toSet s)
      (fun i _ => (z i).windowFinite T₁ T₂)) ?_
    intro ρ hρ
    by_contra hall
    have hall' : ∀ i ∈ s, ρ ∉ supp (z i).mult ∩ stripWindow T₁ T₂ := fun i hi hmem =>
      hall (Set.mem_iUnion₂.mpr ⟨i, hi, hmem⟩)
    exact mem_supp_iff.mp hρ.1 (Finset.sum_eq_zero fun i hi => by
      by_contra hne
      exact hall' i hi ⟨mem_supp_iff.mpr hne, hρ.2⟩)

/-- Remark (in-file, no lemma): `ZeroMult.addFin z = ZeroMult.addFinOver Finset.univ z`
by `rfl` (the univ sum is the Fintype sum). -/

theorem addFinOver_cons {z : ι → ZeroMult} (a : ι) (s : Finset ι) (ha : a ∉ s) :
    ZeroMult.addFinOver (Finset.cons a s ha) z
      = ZeroMult.add (ZeroMult.addFinOver s z) (z a) := by
  refine ZeroMult.eq_of_mult (fun ρ => ?_)
  simp only [ZeroMult.addFinOver, ZeroMult.add, Finset.sum_cons ha, Pi.add_apply]
  exact Nat.add_comm _ _

/-! ### Support identities (stated early: consumed by E4's transport) -/

theorem le_sum_mem (s : Finset ι) (f : ι → ℕ) (i : ι) (hi : i ∈ s) :
    f i ≤ ∑ j ∈ s, f j := by
  rw [← Finset.add_sum_erase s f hi]
  omega

theorem supp_addFinOver_inter (s : Finset ι) (z : ι → ZeroMult) (S : Set ℂ) :
    supp (ZeroMult.addFinOver s z).mult ∩ S = ⋃ i ∈ s, (supp (z i).mult ∩ S) := by
  ext ρ
  constructor
  · rintro ⟨hs, hS⟩
    by_contra hall
    rw [Set.mem_iUnion₂, not_exists] at hall
    exact mem_supp_iff.mp hs (Finset.sum_eq_zero fun i hi => by
      by_contra hne
      exact hall i ⟨hi, mem_supp_iff.mpr hne, hS⟩)
  · intro h
    rw [Set.mem_iUnion₂] at h
    obtain ⟨i, hi, himem⟩ := h
    obtain ⟨h1, h2⟩ := himem
    refine ⟨mem_supp_iff.mpr ?_, h2⟩
    intro hsum
    have hterm : (0 : ℕ) < (z i).mult ρ :=
      Nat.pos_of_ne_zero (mem_supp_iff.mp h1)
    have hle : (z i).mult ρ ≤ ∑ j ∈ s, (z j).mult ρ := le_sum_mem s (fun j => (z j).mult ρ) i hi
    have hsum' : ∑ j ∈ s, (z j).mult ρ = 0 := hsum
    rw [hsum'] at hle
    exact Nat.lt_irrefl 0 (lt_of_lt_of_le hterm hle)

theorem supp_addFin_inter (z : ι → ZeroMult) (S : Set ℂ) :
    supp (ZeroMult.addFin z).mult ∩ S = ⋃ i, (supp (z i).mult ∩ S) := by
  ext ρ
  constructor
  · rintro ⟨hs, hS⟩
    by_contra hall
    rw [Set.mem_iUnion, not_exists] at hall
    exact mem_supp_iff.mp hs (Finset.sum_eq_zero fun i _ => by
      by_contra hne
      exact hall i ⟨mem_supp_iff.mpr hne, hS⟩)
  · intro h
    obtain ⟨i, hi⟩ := Set.mem_iUnion.mp h
    obtain ⟨h1, h2⟩ := hi
    refine ⟨mem_supp_iff.mpr ?_, h2⟩
    intro hsum
    have hterm : (0 : ℕ) < (z i).mult ρ :=
      Nat.pos_of_ne_zero (mem_supp_iff.mp h1)
    have hle : (z i).mult ρ ≤ ∑ j, (z j).mult ρ := le_sum_mem Finset.univ (fun j => (z j).mult ρ) i (Finset.mem_univ i)
    have hsum' : ∑ j, (z j).mult ρ = 0 := hsum
    rw [hsum'] at hle
    exact Nat.lt_irrefl 0 (lt_of_lt_of_le hterm hle)

/-! ### E2 — binary sub-additivity of the pair defect -/

theorem commonStripCum_add_le (u v w : ZeroMult) (T : ℝ) :
    commonStripCum (ZeroMult.add u v) w T
      ≤ commonStripCum u w T + commonStripCum v w T := by
  have hfL : ((supp u.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T)).Finite :=
    Set.Finite.subset (u.windowFinite 0 T) Set.inter_subset_left
  have hfR : ((supp v.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T)).Finite :=
    Set.Finite.subset (v.windowFinite 0 T) Set.inter_subset_left
  have hf1 : ((supp (ZeroMult.add u v).mult ∩ stripWindow 0 T)
      ∩ (supp w.mult ∩ stripWindow 0 T)).Finite :=
    Set.Finite.subset ((ZeroMult.add u v).windowFinite 0 T) Set.inter_subset_left
  have hset : (supp (ZeroMult.add u v).mult ∩ stripWindow 0 T)
      ∩ (supp w.mult ∩ stripWindow 0 T)
      = ((supp u.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T))
        ∪ ((supp v.mult ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T)) := by
    show (supp (u.mult + v.mult) ∩ stripWindow 0 T) ∩ (supp w.mult ∩ stripWindow 0 T) = _
    rw [supp_add_eq, Set.union_inter_distrib_right, Set.union_inter_distrib_right]
  have eAdd : commonStripCum (ZeroMult.add u v) w T = hf1.toFinset.card := rfl
  have eU : commonStripCum u w T = hfL.toFinset.card := rfl
  have eV : commonStripCum v w T = hfR.toFinset.card := rfl
  rw [eAdd, eU, eV]
  have husub : hf1.toFinset ⊆ hfL.toFinset ∪ hfR.toFinset := by
    intro p hp
    have hpm := (Set.Finite.mem_toFinset hf1).mp hp
    rw [hset] at hpm
    rcases hpm with h | h
    · exact Finset.mem_union_left _ ((Set.Finite.mem_toFinset hfL).mpr h)
    · exact Finset.mem_union_right _ ((Set.Finite.mem_toFinset hfR).mpr h)
  calc hf1.toFinset.card ≤ (hfL.toFinset ∪ hfR.toFinset).card :=
        Finset.card_le_card husub
    _ ≤ hfL.toFinset.card + hfR.toFinset.card := Finset.card_union_le _ _

/-! ### E3 — union-intersection bound -/

theorem commonStripCum_addFinOver_le (s : Finset ι) (z : ι → ZeroMult) (w : ZeroMult)
    (T : ℝ) :
    commonStripCum (ZeroMult.addFinOver s z) w T
      ≤ ∑ i ∈ s, commonStripCum (z i) w T := by
  induction s using Finset.cons_induction with
  | empty =>
      have hE : ZeroMult.addFinOver (∅ : Finset ι) z = zeroMult :=
        ZeroMult.eq_of_mult (fun ρ => by simp [ZeroMult.addFinOver, zeroMult])
      rw [hE]
      have hC : commonStripCum zeroMult w T = 0 := by
        have hint := supp_zeroMult_inter_empty (stripWindow 0 T)
          (supp w.mult ∩ stripWindow 0 T)
        rw [commonStripCum_eq]
        have hfeq : (Set.Finite.subset (zeroMult.windowFinite 0 T)
            (Set.inter_subset_left : (supp zeroMult.mult ∩ stripWindow 0 T)
              ∩ (supp w.mult ∩ stripWindow 0 T)
              ⊆ supp zeroMult.mult ∩ stripWindow 0 T)).toFinset = ∅ := by
          refine Finset.eq_empty_of_forall_notMem fun p hp => ?_
          have hpm := (Set.Finite.mem_toFinset _).mp hp
          rw [hint] at hpm
          exact hpm
        rw [hfeq]
        rfl
      simp [hC]
  | cons a t ha ih =>
      rw [addFinOver_cons a t ha, Finset.sum_cons ha]
      exact le_trans (commonStripCum_add_le (ZeroMult.addFinOver t z) (z a) w T)
        (by omega)

/-! ### E4 — the two-level Bonferroni invariant (ORDERED-pair offDiag defect).
Abstract Finset core + membership transport. -/

/-- Both-column offDiag growth (F2 bridge): the offDiag sum over `insert a t` dominates
the old sum plus the `(i, a)`- and `(a, i)`-columns (each unordered pair counted twice). -/
theorem offDiag_cons_ge (a : ι) (t : Finset ι) (ha : a ∉ t) (g : ι × ι → ℕ) :
    (∑ p ∈ t.offDiag, g p) + (∑ i ∈ t, g (i, a)) + ∑ i ∈ t, g (a, i)
      ≤ ∑ p ∈ (insert a t).offDiag, g p := by
  have hod : t.offDiag ⊆ (insert a t).offDiag := by
    intro p hp
    rw [Finset.mem_offDiag] at hp ⊢
    exact ⟨Finset.mem_insert_of_mem hp.1, Finset.mem_insert_of_mem hp.2.1, hp.2.2⟩
  have hcol1 : (Finset.image (fun i => (i, a)) t) ⊆ (insert a t).offDiag := by
    intro p hp
    rw [Finset.mem_image] at hp
    obtain ⟨i, hi, rfl⟩ := hp
    rw [Finset.mem_offDiag]
    refine ⟨Finset.mem_insert_of_mem hi, Finset.mem_insert_self a t, ?_⟩
    intro h
    exact ha (by rw [show i = a from h] at hi; exact hi)
  have hcol2 : (Finset.image (fun i => (a, i)) t) ⊆ (insert a t).offDiag := by
    intro p hp
    rw [Finset.mem_image] at hp
    obtain ⟨i, hi, rfl⟩ := hp
    rw [Finset.mem_offDiag]
    refine ⟨Finset.mem_insert_self a t, Finset.mem_insert_of_mem hi, ?_⟩
    intro h
    exact ha (by rw [← show a = i from h] at hi; exact hi)
  have hd12 : Disjoint (Finset.image (fun i => (i, a)) t)
      (Finset.image (fun i => (a, i)) t) := by
    rw [Finset.disjoint_left]
    intro p hpA hpB
    rw [Finset.mem_image] at hpA hpB
    obtain ⟨i, hi, hpAeq⟩ := hpA
    obtain ⟨j, hj, hpBeq⟩ := hpB
    refine ha ?_
    have hEq : (i, a) = (a, j) := hpAeq.trans hpBeq.symm
    have hia : i = a := congrArg Prod.fst hEq
    rw [hia] at hi
    exact hi
  have hd1 : Disjoint t.offDiag (Finset.image (fun i => (i, a)) t) := by
    rw [Finset.disjoint_left]
    intro p hpA hpB
    rw [Finset.mem_offDiag] at hpA
    rw [Finset.mem_image] at hpB
    obtain ⟨i, hi, rfl⟩ := hpB
    exact ha (show a ∈ t from hpA.2.1)
  have hd2 : Disjoint t.offDiag (Finset.image (fun i => (a, i)) t) := by
    rw [Finset.disjoint_left]
    intro p hpA hpB
    rw [Finset.mem_offDiag] at hpA
    rw [Finset.mem_image] at hpB
    obtain ⟨i, hi, rfl⟩ := hpB
    exact ha (show a ∈ t from hpA.1)
  have hbig : ((t.offDiag ∪ Finset.image (fun i => (i, a)) t)
      ∪ Finset.image (fun i => (a, i)) t) ⊆ (insert a t).offDiag := by
    intro p hp
    rcases Finset.mem_union.mp hp with h | h
    · rcases Finset.mem_union.mp h with h' | h'
      · exact hod h'
      · exact hcol1 h'
    · exact hcol2 h
  have hsum1 : ∑ p ∈ ((t.offDiag ∪ Finset.image (fun i => (i, a)) t)
        ∪ Finset.image (fun i => (a, i)) t), g p
      ≤ ∑ p ∈ (insert a t).offDiag, g p :=
    Finset.sum_le_sum_of_subset hbig
  have hsplit : ∑ p ∈ ((t.offDiag ∪ Finset.image (fun i => (i, a)) t)
        ∪ Finset.image (fun i => (a, i)) t), g p
      = (∑ p ∈ t.offDiag, g p) + (∑ i ∈ t, g (i, a)) + ∑ i ∈ t, g (a, i) := by
    have hdA : Disjoint (t.offDiag ∪ Finset.image (fun i => (i, a)) t)
        (Finset.image (fun i => (a, i)) t) := by
      rw [Finset.disjoint_union_left]
      exact ⟨hd2, hd12⟩
    rw [Finset.sum_union hdA, Finset.sum_union hd1,
      Finset.sum_image (fun i _ j _ h => congrArg Prod.fst h),
      Finset.sum_image (fun i _ j _ h => congrArg Prod.snd h)]
  exact hsplit ▸ hsum1

/-- The union inequality: a family of finsets satisfies the Bonferroni lower bound
`∑ cards ≤ (biUnion).card + ordered-pair overlap sum`. Cons-induction; the doubled
offDiag convention absorbs the factor 2 via `Finset.inter_comm`. -/
theorem bonferroni_union_le (f : ι → Finset ℂ) (s : Finset ι) :
    ∑ i ∈ s, (f i).card
      ≤ (s.biUnion f).card + ∑ p ∈ s.offDiag, ((f p.1 ∩ f p.2).card) := by
  induction s using Finset.cons_induction with
  | empty => simp
  | cons a t ha ih =>
      have hge := offDiag_cons_ge a t ha (fun p => (f p.1 ∩ f p.2).card)
      have hIE := (f a).card_union_add_card_inter (t.biUnion f)
      have hsub : f a ∩ t.biUnion f ⊆ t.biUnion (fun i => f a ∩ f i) := by
        intro p hp
        rw [Finset.mem_inter] at hp
        obtain ⟨hpa, hpB⟩ := hp
        rw [Finset.mem_biUnion] at hpB
        obtain ⟨i, hi, hpi⟩ := hpB
        rw [Finset.mem_biUnion]
        refine ⟨i, hi, ?_⟩
        rw [Finset.mem_inter]
        exact ⟨hpa, hpi⟩
      have hia : (f a ∩ t.biUnion f).card
          ≤ ∑ i ∈ t, (f a ∩ f i).card :=
        (Finset.card_le_card hsub).trans (Finset.card_biUnion_le (s := t)
          (t := fun i => f a ∩ f i))
      have hsym : ∑ i ∈ t, (f i ∩ f a).card = ∑ i ∈ t, (f a ∩ f i).card :=
        Finset.sum_congr rfl fun i _ => congrArg Finset.card (Finset.inter_comm (f i) (f a))
      have hcol1' : ∑ i ∈ t, (f (i, a).1 ∩ f (i, a).2).card
          = ∑ i ∈ t, (f i ∩ f a).card :=
        Finset.sum_congr rfl fun i _ => rfl
      have hcol2' : ∑ i ∈ t, (f (a, i).1 ∩ f (a, i).2).card
          = ∑ i ∈ t, (f a ∩ f i).card :=
        Finset.sum_congr rfl fun i _ => rfl
      rw [hcol1', hcol2'] at hge
      rw [Finset.cons_eq_insert, Finset.sum_insert ha, Finset.biUnion_insert]
      omega

/-- **E4** (transport): the two-level Bonferroni invariant at the ZeroMult defect
vocabulary, by cardinality identification (membership-`Finset.ext` + `toFinset_inj`;
all finiteness proofs fully spelled to keep rewrites syntactic). -/
theorem bonferroni_addFinOver (s : Finset ι) (z : ι → ZeroMult) (u : ZeroMult) (T : ℝ) :
    (u.distinctCountCum T : ℕ) + ∑ i ∈ s, (z i).distinctCountCum T
      ≤ ((ZeroMult.add u (ZeroMult.addFinOver s z)).distinctCountCum T : ℕ)
        + ((commonStripCum u (ZeroMult.addFinOver s z) T : ℕ)
          + ∑ p ∈ s.offDiag, (commonStripCum (z p.1) (z p.2) T : ℕ)) := by
  have key := bonferroni_union_le (fun i => ((z i).windowFinite 0 T).toFinset) s
  have id0 : ((u.windowFinite 0 T).toFinset).card = u.distinctCountCum T := rfl
  have idF : ∀ i ∈ s, (((z i).windowFinite 0 T).toFinset).card
      = (z i).distinctCountCum T := fun _ _ => rfl
  have eUnion : ((u.windowFinite 0 T).toFinset
      ∪ s.biUnion (fun i => ((z i).windowFinite 0 T).toFinset))
      = ((u.windowFinite 0 T).union
          (Set.Finite.biUnion (Finset.finite_toSet s)
            fun i _ => (z i).windowFinite 0 T)).toFinset := by
    ext p
    simp only [Finset.mem_union, Finset.mem_biUnion, Set.Finite.mem_toFinset,
      Set.mem_union, Set.mem_iUnion₂]
    tauto
  have eInter : (((u.windowFinite 0 T).toFinset)
      ∩ s.biUnion (fun i => ((z i).windowFinite 0 T).toFinset))
      = (Set.Finite.subset (u.windowFinite 0 T)
          (Set.inter_subset_left : (supp u.mult ∩ stripWindow 0 T)
            ∩ (⋃ i ∈ s, (supp (z i).mult ∩ stripWindow 0 T))
            ⊆ supp u.mult ∩ stripWindow 0 T)).toFinset := by
    ext p
    simp only [Finset.mem_inter, Finset.mem_biUnion, Set.Finite.mem_toFinset,
      Set.mem_inter_iff, Set.mem_union, Set.mem_iUnion₂]
    tauto
  have idUnion : (((u.windowFinite 0 T).toFinset
        ∪ s.biUnion (fun i => ((z i).windowFinite 0 T).toFinset)).card)
      = ((ZeroMult.add u (ZeroMult.addFinOver s z)).distinctCountCum T : ℕ) := by
    have hsetBig : supp (ZeroMult.add u (ZeroMult.addFinOver s z)).mult ∩ stripWindow 0 T
        = (supp u.mult ∩ stripWindow 0 T)
          ∪ ⋃ i ∈ s, (supp (z i).mult ∩ stripWindow 0 T) := by
      show supp (u.mult + (ZeroMult.addFinOver s z).mult) ∩ stripWindow 0 T = _
      rw [supp_add_eq, Set.union_inter_distrib_right, supp_addFinOver_inter]
    have hfinAdd : (supp (ZeroMult.add u (ZeroMult.addFinOver s z)).mult
        ∩ stripWindow 0 T).Finite :=
      (ZeroMult.add u (ZeroMult.addFinOver s z)).windowFinite 0 T
    unfold ZeroMult.distinctCountCum
    rw [((Set.Finite.toFinset_inj (hs := hfinAdd)
        (ht := (u.windowFinite 0 T).union
          (Set.Finite.biUnion (Finset.finite_toSet s)
            fun i _ => (z i).windowFinite 0 T))).mpr hsetBig), ← eUnion]
  have idInter : (((u.windowFinite 0 T).toFinset)
      ∩ s.biUnion (fun i => ((z i).windowFinite 0 T).toFinset)).card
      = (commonStripCum u (ZeroMult.addFinOver s z) T : ℕ) := by
    have hsetI : (supp u.mult ∩ stripWindow 0 T)
        ∩ (⋃ i ∈ s, (supp (z i).mult ∩ stripWindow 0 T))
        = (supp u.mult ∩ stripWindow 0 T)
          ∩ (supp (ZeroMult.addFinOver s z).mult ∩ stripWindow 0 T) := by
      rw [supp_addFinOver_inter]
    rw [commonStripCum_eq u (ZeroMult.addFinOver s z) T,
      ((Set.Finite.toFinset_inj
        (hs := Set.Finite.subset (u.windowFinite 0 T)
          (Set.inter_subset_left : (supp u.mult ∩ stripWindow 0 T)
            ∩ (supp (ZeroMult.addFinOver s z).mult ∩ stripWindow 0 T)
            ⊆ supp u.mult ∩ stripWindow 0 T))
        (ht := Set.Finite.subset (u.windowFinite 0 T)
          (Set.inter_subset_left : (supp u.mult ∩ stripWindow 0 T)
            ∩ (⋃ i ∈ s, (supp (z i).mult ∩ stripWindow 0 T))
            ⊆ supp u.mult ∩ stripWindow 0 T))).mpr
      (by rw [hsetI])), ← eInter]
  have idPair : ∀ p ∈ s.offDiag,
      ((((z p.1).windowFinite 0 T).toFinset) ∩ (((z p.2).windowFinite 0 T).toFinset)).card
        = (commonStripCum (z p.1) (z p.2) T : ℕ) := by
    intro p hp
    have ePair : (Set.Finite.subset ((z p.1).windowFinite 0 T)
          (Set.inter_subset_left : (supp (z p.1).mult ∩ stripWindow 0 T)
            ∩ (supp (z p.2).mult ∩ stripWindow 0 T)
            ⊆ supp (z p.1).mult ∩ stripWindow 0 T)).toFinset
        = (((z p.1).windowFinite 0 T).toFinset) ∩ (((z p.2).windowFinite 0 T).toFinset) := by
      ext q
      simp
    rw [commonStripCum_eq (z p.1) (z p.2) T, ePair]
  have idOD : ∑ p ∈ s.offDiag,
        ((((z p.1).windowFinite 0 T).toFinset) ∩ (((z p.2).windowFinite 0 T).toFinset)).card
      = ∑ p ∈ s.offDiag, (commonStripCum (z p.1) (z p.2) T : ℕ) :=
    Finset.sum_congr rfl fun p hp => idPair p hp
  have hU : (((u.windowFinite 0 T).toFinset)
        ∪ s.biUnion (fun i => ((z i).windowFinite 0 T).toFinset)).card
      + (((u.windowFinite 0 T).toFinset)
        ∩ s.biUnion (fun i => ((z i).windowFinite 0 T).toFinset)).card
      = ((u.windowFinite 0 T).toFinset).card
        + (s.biUnion (fun i => ((z i).windowFinite 0 T).toFinset)).card :=
    Finset.card_union_add_card_inter _ _
  have hL : (u.distinctCountCum T : ℕ) + ∑ i ∈ s, (z i).distinctCountCum T
      = (((u.windowFinite 0 T).toFinset).card
          + ∑ i ∈ s, (((z i).windowFinite 0 T).toFinset).card) := by
    rw [id0]
    exact congrArg _ (Finset.sum_congr rfl fun i hi => (idF i hi).symm)
  omega


/-! ### E5 — the n-ary distinct identification of ζ_L -/

theorem distinctCountCum_of_abelFac {fL fK : ℂ → ℂ} {F : ι → ℂ → ℂ}
    (hmult : ∀ ρ : ℂ, ρ ≠ 1 → multOf fL ρ = multOf fK ρ + ∑ i, multOf (F i) ρ)
    (hfinL : WindowFinite (multOf fL)) (hfinK : WindowFinite (multOf fK))
    (hfinF : ∀ i, WindowFinite (multOf (F i))) (T : ℝ) :
    (⟨multOf fL, hfinL⟩ : ZeroMult).distinctCountCum T
      = (ZeroMult.add ⟨multOf fK, hfinK⟩
          (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩)).distinctCountCum T := by
  have hsetL : supp (multOf fL) ∩ stripWindow 0 T
      = (supp (multOf fK) ∩ stripWindow 0 T)
        ∪ ⋃ i, (supp (multOf (F i)) ∩ stripWindow 0 T) := by
    ext ρ
    constructor
    · rintro ⟨hs, hS⟩
      by_contra hall
      rw [Set.mem_union, not_or, Set.mem_iUnion, not_exists] at hall
      have hK0 : multOf fK ρ = 0 := by
        by_contra hne; exact hall.1 ⟨mem_supp_iff.mpr hne, hS⟩
      have hF0 : ∀ i, multOf (F i) ρ = 0 := fun i => by
        by_contra hne; exact hall.2 i ⟨mem_supp_iff.mpr hne, hS⟩
      have hs' := mem_supp_iff.mp hs
      rw [hmult ρ (stripWindow_ne_one hS), hK0,
        Finset.sum_eq_zero fun i _ => hF0 i] at hs'
      exact hs' rfl
    · intro h
      rw [Set.mem_union, Set.mem_iUnion] at h
      rcases h with hK | ⟨i, hi⟩
      · obtain ⟨h1, h2⟩ := hK
        refine ⟨mem_supp_iff.mpr ?_, h2⟩
        intro hzero
        have hKne := mem_supp_iff.mp h1
        rw [hmult ρ (stripWindow_ne_one h2)] at hzero
        exact hKne (Nat.add_eq_zero_iff.mp hzero).1
      · obtain ⟨h1, h2⟩ := hi
        refine ⟨mem_supp_iff.mpr ?_, h2⟩
        intro hzero
        rw [hmult ρ (stripWindow_ne_one h2)] at hzero
        have hF0 := (Nat.add_eq_zero_iff.mp hzero).2
        have hz := Finset.sum_eq_zero_iff.mp hF0 i (Finset.mem_univ i)
        exact mem_supp_iff.mp h1 hz
  have hsetR : supp (ZeroMult.add ⟨multOf fK, hfinK⟩
        (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩)).mult ∩ stripWindow 0 T
      = (supp (multOf fK) ∩ stripWindow 0 T)
        ∪ ⋃ i, (supp (multOf (F i)) ∩ stripWindow 0 T) := by
    show supp (multOf fK
        + (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩).mult) ∩ stripWindow 0 T = _
    rw [supp_add_eq, Set.union_inter_distrib_right, supp_addFin_inter]
  unfold ZeroMult.distinctCountCum
  rw [(Set.Finite.toFinset_inj
      (hs := hfinL 0 T)
      (ht := (ZeroMult.add ⟨multOf fK, hfinK⟩
        (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩)).windowFinite 0 T)).mpr
      (by rw [hsetL, hsetR])]

/-! ### E6 — the ε-wiring -/

/-- **E6 core**: the n-ary defect assembly (the lift of
`assemble_eps_defect_strip_cum` to `zK + addFin zF`, with the ORDERED-pair offDiag
defect of E4). -/
theorem assemble_eps_defect_strip_cum_fin (zK : ZeroMult) (zF : ι → ZeroMult) {c : ℝ}
    (hK : EpsLowerDistinctStripCum zK c) (hF : ∀ i, EpsLowerDistinctStripCum (zF i) c) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (c - ε) * ((ZeroMult.add zK (ZeroMult.addFin zF)).countCum T : ℝ)
        ≤ ((ZeroMult.add zK (ZeroMult.addFin zF)).distinctCountCum T : ℝ)
          + ((commonStripCum zK (ZeroMult.addFin zF) T : ℝ)
            + ∑ p ∈ (Finset.univ : Finset ι).offDiag,
                (commonStripCum (zF p.1) (zF p.2) T : ℝ)) := by
  intro ε hε
  by_cases hne : Nonempty ι
  · obtain ⟨i₀⟩ := hne
    obtain ⟨TK, hTK⟩ := hK ε hε
    choose TF hTF using fun i => hF i ε hε
    refine ⟨max TK (Finset.univ.sup' ⟨i₀, Finset.mem_univ i₀⟩ TF), fun T hT => ?_⟩
    have eK := hTK T (le_trans (le_max_left _ _) hT)
    have eF : ∀ i, (c - ε) * ((zF i).countCum T : ℝ)
        ≤ ((zF i).distinctCountCum T : ℝ) := fun i =>
      hTF i T (le_trans (le_trans (Finset.le_sup' TF (Finset.mem_univ i))
        (le_max_right _ _)) hT)
    have hBonf := bonferroni_addFinOver (Finset.univ : Finset ι) zF zK T
    have hcum : ((ZeroMult.add zK (ZeroMult.addFin zF)).countCum T : ℝ)
        = ((zK.countCum T : ℝ) + ∑ i, ((zF i).countCum T : ℝ)) := by
      have h1 := countCum_add zK (ZeroMult.addFin zF) T
      have h2 := countCum_addFin zF T
      rw [h1, h2]
      push_cast
      rfl
    have hsumL : (c - ε) * ((ZeroMult.add zK (ZeroMult.addFin zF)).countCum T : ℝ)
        = (c - ε) * (zK.countCum T : ℝ)
          + ∑ i, (c - ε) * ((zF i).countCum T : ℝ) := by
      rw [hcum, mul_add, Finset.mul_sum]
    have hsumU : (zK.distinctCountCum T : ℝ) + ∑ i, ((zF i).distinctCountCum T : ℝ)
        ≤ ((ZeroMult.add zK (ZeroMult.addFin zF)).distinctCountCum T : ℝ)
          + ((commonStripCum zK (ZeroMult.addFin zF) T : ℝ)
            + ∑ p ∈ (Finset.univ : Finset ι).offDiag,
                (commonStripCum (zF p.1) (zF p.2) T : ℝ)) := by
      exact_mod_cast hBonf
    have e2 := Finset.sum_le_sum (fun i (_ : i ∈ Finset.univ) => eF i)
    linarith
  · -- ι empty: the family contributes nothing; reduce to hK itself
    obtain ⟨T₀, hT₀⟩ := hK ε hε
    refine ⟨T₀, fun T hT => ?_⟩
    have hEF : ZeroMult.addFin zF = zeroMult :=
      ZeroMult.eq_of_mult (fun ρ => Finset.sum_eq_zero fun i _ => (hne ⟨i⟩).elim)
    have hEU : ZeroMult.add zK zeroMult = zK :=
      ZeroMult.eq_of_mult (fun ρ => by
        simp only [ZeroMult.add, zeroMult, Pi.add_apply, add_zero])
    have hCZ : commonStripCum zK zeroMult T = 0 := by
      have hint : (supp zK.mult ∩ stripWindow 0 T)
          ∩ (supp zeroMult.mult ∩ stripWindow 0 T) = ∅ :=
        inter_supp_zeroMult_empty (stripWindow 0 T) (supp zK.mult ∩ stripWindow 0 T)
      rw [commonStripCum_eq]
      have hfeq : (Set.Finite.subset (zK.windowFinite 0 T)
          (Set.inter_subset_left : (supp zK.mult ∩ stripWindow 0 T)
            ∩ (supp zeroMult.mult ∩ stripWindow 0 T)
            ⊆ supp zK.mult ∩ stripWindow 0 T)).toFinset = ∅ := by
        refine Finset.eq_empty_of_forall_notMem fun p hp => ?_
        have hpm := (Set.Finite.mem_toFinset _).mp hp
        rw [hint] at hpm
        exact hpm
      rw [hfeq]
      rfl
    have hOD : ∑ p ∈ (Finset.univ : Finset ι).offDiag,
        (commonStripCum (zF p.1) (zF p.2) T : ℝ) = 0 := by
      have hise : IsEmpty ι := not_nonempty_iff.mp hne
      have hE : (Finset.univ : Finset ι).offDiag = ∅ := by
        refine Finset.eq_empty_of_forall_notMem fun p hp => ?_
        exact absurd (Finset.mem_offDiag.mp hp).1 (fun h => hise.elim p.1)
      rw [hE]
      simp
    rw [hEF, hEU, hCZ, hOD]
    simpa using hT₀ T hT

/-! ### The landings -/

/-- **Pb-1 — the n-fold defect-form landing**: under the component strip-distinct
proportion binders (`hAKd` at `c₀`, `hAFd i` at `c i` — the open core), the assembled
ζ_L zero data satisfies the 5/6-class defect inequality at any `cStar ≤ min (c₀, ⨅ i,
c i)`, with defect = the ζ_K-vs-family common-strip count PLUS the ORDERED-pair family
defect (Pb-design §0). -/
theorem zetaL_assembly_distinct_defect_landed {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ}
    {c₀ cStar : ℝ} {c : ι → ℝ}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hcK : cStar ≤ c₀) (hcF : ∀ i, cStar ≤ c i)
    (hAKd : EpsLowerDistinctStripCum ⟨multOf fK, hfinK⟩ c₀)
    (hAFd : ∀ i, EpsLowerDistinctStripCum ⟨multOf (F i), hfinF i⟩ (c i)) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (cStar - ε) * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)
        ≤ ((⟨multOf fL, hfinL⟩ : ZeroMult).distinctCountCum T : ℝ)
          + ((commonStripCum ⟨multOf fK, hfinK⟩
              (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T : ℝ)
            + ∑ p ∈ (Finset.univ : Finset ι).offDiag,
                (commonStripCum ⟨multOf (F p.1), hfinF p.1⟩
                  ⟨multOf (F p.2), hfinF p.2⟩ T : ℝ)) := by
  intro ε hε
  have hmult := multOf_of_abelFac hF hK hntopF hntopK hAbFac
  have hcum : ∀ T, (⟨multOf fL, hfinL⟩ : ZeroMult).countCum T
      = (ZeroMult.add ⟨multOf fK, hfinK⟩
          (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩)).countCum T := by
    intro T
    have h1 := countCumOf_add_of_abFac hmult hfinL hfinK hfinF T
    have h2 := countCum_add (⟨multOf fK, hfinK⟩ : ZeroMult)
      (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T
    have h3 := countCum_addFin (fun i => ⟨multOf (F i), hfinF i⟩) T
    have eK : (⟨multOf fK, hfinK⟩ : ZeroMult).countCum T = countCumOf hfinK T := rfl
    have eL : (⟨multOf fL, hfinL⟩ : ZeroMult).countCum T = countCumOf hfinL T := rfl
    have eF : ∀ i, (⟨multOf (F i), hfinF i⟩ : ZeroMult).countCum T
        = countCumOf (hfinF i) T := fun _ => rfl
    rw [h2, h3, eK, Finset.sum_congr rfl fun i _ => eF i, ← h1, ← eL]
  have hdist := distinctCountCum_of_abelFac hmult hfinL hfinK hfinF
  obtain ⟨T₀, hT₀⟩ := assemble_eps_defect_strip_cum_fin
    (⟨multOf fK, hfinK⟩ : ZeroMult) (fun i => ⟨multOf (F i), hfinF i⟩)
    (EpsLowerDistinctStripCum_mono hcK hAKd)
    (fun i => EpsLowerDistinctStripCum_mono (hcF i) (hAFd i)) ε hε
  refine ⟨T₀, fun T hT => ?_⟩
  rw [hcum T, hdist T]
  exact hT₀ T hT

/-- **Pb-2 — the hCZStripFam-seamed form**: with the summed common-strip-defect
negligibility binder (design note in the file header: discharge-equivalent to the
per-pair form), the full strip-distinct proportion holds for ζ_L. -/
theorem zetaL_assembly_distinct_landed_of_negligible {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ}
    {c₀ cStar : ℝ} {c : ι → ℝ}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hcK : cStar ≤ c₀) (hcF : ∀ i, cStar ≤ c i)
    (hAKd : EpsLowerDistinctStripCum ⟨multOf fK, hfinK⟩ c₀)
    (hAFd : ∀ i, EpsLowerDistinctStripCum ⟨multOf (F i), hfinF i⟩ (c i))
    (hCZStripFam : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      ((commonStripCum ⟨multOf fK, hfinK⟩
          (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T : ℝ)
        + ∑ p ∈ (Finset.univ : Finset ι).offDiag,
            (commonStripCum ⟨multOf (F p.1), hfinF p.1⟩
              ⟨multOf (F p.2), hfinF p.2⟩ T : ℝ))
        ≤ ε * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)) :
    EpsLowerDistinctStripCum ⟨multOf fL, hfinL⟩ cStar := by
  intro δ hδ
  obtain ⟨T₁, hT₁⟩ := zetaL_assembly_distinct_defect_landed hK hF hntopK hntopF hAbFac
    hfinK hfinL hfinF hcK hcF hAKd hAFd (δ / 2) (by linarith)
  obtain ⟨T₂, hT₂⟩ := hCZStripFam (δ / 2) (by linarith)
  refine ⟨max T₁ T₂, fun T hT => ?_⟩
  have e1 := hT₁ T (le_trans (le_max_left _ _) hT)
  have e2 := hT₂ T (le_trans (le_max_right _ _) hT)
  have hN : (0 : ℝ) ≤ ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ) :=
    Nat.cast_nonneg _
  have hsplit : (δ / 2) * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)
      + (δ / 2) * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)
      = δ * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ) := by ring
  nlinarith [hN, hsplit]

/-- **Pb-3 (C1, 5/6 arm) — the defect-form instantiation at the classical constant**:
ζ_K component via the carried `K839OfLocalStrip` slot (Knausgård 839 ≥ 5/6), family
components at 5/6 binders (the open core). M4a's `zetaK_distinct_five_sixths_strip_
landed` one degree up the tower. -/
theorem zetaL_distinct_five_sixths_strip_conditional {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ}
    {cert : Prop}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hCert : cert)
    (hK839 : K839OfLocalStrip cert ⟨multOf fK, hfinK⟩)
    (hAFd : ∀ i, EpsLowerDistinctStripCum ⟨multOf (F i), hfinF i⟩ (5 / 6)) :
    ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      (5 / 6 - ε) * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)
        ≤ ((⟨multOf fL, hfinL⟩ : ZeroMult).distinctCountCum T : ℝ)
          + ((commonStripCum ⟨multOf fK, hfinK⟩
              (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T : ℝ)
            + ∑ p ∈ (Finset.univ : Finset ι).offDiag,
                (commonStripCum ⟨multOf (F p.1), hfinF p.1⟩
                  ⟨multOf (F p.2), hfinF p.2⟩ T : ℝ)) :=
  zetaL_assembly_distinct_defect_landed hK hF hntopK hntopF hAbFac hfinK hfinL hfinF
    (le_refl _) (fun _ => le_refl _)
    (EpsLowerDistinctStripCum_mono five_sixths_le_839 (hK839 hCert)) hAFd

/-- **Pb-3 (C1, 5/6 arm), `hCZStripFam`-seamed**: the full strip-distinct 5/6 statement
for ζ_L under the summed negligibility binder. -/
theorem zetaL_distinct_five_sixths_strip_conditional_of_negligible
    {fK fL : ℂ → ℂ} {F : ι → ℂ → ℂ} {cert : Prop}
    (hK : ∀ ρ : ℂ, ρ ≠ 1 → AnalyticAt ℂ fK ρ)
    (hF : ∀ i (ρ : ℂ), AnalyticAt ℂ (F i) ρ)
    (hntopK : ∀ ρ : ℂ, ρ ≠ 1 → analyticOrderAt fK ρ ≠ ⊤)
    (hntopF : ∀ i (ρ : ℂ), analyticOrderAt (F i) ρ ≠ ⊤)
    (hAbFac : ∀ s : ℂ, s ≠ 1 → fL s = (∏ i, F i s) * fK s)
    (hfinK : WindowFinite (multOf fK)) (hfinL : WindowFinite (multOf fL))
    (hfinF : ∀ i, WindowFinite (multOf (F i)))
    (hCert : cert)
    (hK839 : K839OfLocalStrip cert ⟨multOf fK, hfinK⟩)
    (hAFd : ∀ i, EpsLowerDistinctStripCum ⟨multOf (F i), hfinF i⟩ (5 / 6))
    (hCZStripFam : ∀ ε > 0, ∃ T₀ : ℝ, ∀ T : ℝ, T₀ ≤ T →
      ((commonStripCum ⟨multOf fK, hfinK⟩
          (ZeroMult.addFin fun i => ⟨multOf (F i), hfinF i⟩) T : ℝ)
        + ∑ p ∈ (Finset.univ : Finset ι).offDiag,
            (commonStripCum ⟨multOf (F p.1), hfinF p.1⟩
              ⟨multOf (F p.2), hfinF p.2⟩ T : ℝ))
        ≤ ε * ((⟨multOf fL, hfinL⟩ : ZeroMult).countCum T : ℝ)) :
    EpsLowerDistinctStripCum ⟨multOf fL, hfinL⟩ (5 / 6) :=
  zetaL_assembly_distinct_landed_of_negligible hK hF hntopK hntopF hAbFac hfinK hfinL
    hfinF (le_refl _) (fun _ => le_refl _)
    (EpsLowerDistinctStripCum_mono five_sixths_le_839 (hK839 hCert)) hAFd hCZStripFam

end PbLayer

-- P-b audit (expect: [propext, Classical.choice, Quot.sound] only, 0 sorryAx).
-- 2026-11-17 correction (R3 §10.4 fold): the run-11 log's tail was head/tail-excerpted and
-- omitted the three PRIVATE helpers below; this audit block now prints every P-b-layer
-- declaration directly (public + private). The run-11 header's "EVERY declaration prints
-- triad" was tally-only-broad; the re-run (logs/pb-run12-auditfix.log) is the complete record.
#print axioms CrossMath.Pilot75.le_sum_mem
#print axioms CrossMath.Pilot75.offDiag_cons_ge
#print axioms CrossMath.Pilot75.bonferroni_union_le
#print axioms CrossMath.Pilot75.commonStripCum_eq
#print axioms CrossMath.Pilot75.commonStripCum_mono
#print axioms CrossMath.Pilot75.ZeroMult.addFinOver
#print axioms CrossMath.Pilot75.addFinOver_cons
#print axioms CrossMath.Pilot75.commonStripCum_add_le
#print axioms CrossMath.Pilot75.commonStripCum_addFinOver_le
#print axioms CrossMath.Pilot75.bonferroni_addFinOver
#print axioms CrossMath.Pilot75.supp_addFin_inter
#print axioms CrossMath.Pilot75.supp_addFinOver_inter
#print axioms CrossMath.Pilot75.distinctCountCum_of_abelFac
#print axioms CrossMath.Pilot75.assemble_eps_defect_strip_cum_fin
#print axioms CrossMath.Pilot75.zetaL_assembly_distinct_defect_landed
#print axioms CrossMath.Pilot75.zetaL_assembly_distinct_landed_of_negligible
#print axioms CrossMath.Pilot75.zetaL_distinct_five_sixths_strip_conditional
#print axioms CrossMath.Pilot75.zetaL_distinct_five_sixths_strip_conditional_of_negligible
