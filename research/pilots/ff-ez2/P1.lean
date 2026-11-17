/-
Pilot FF-EZ2 P1 — proof rung: the base-change simplicity survivor statements, PROVED
from the P0 defs (carried) + mathlib only. PROOF ARTIFACT: zero `sorry`, no
`native_decide`, kernel-only. S-class per the P0 record's input (charter GO 2026-11-17).

Honest P1 shape per the P0 record: the collision bridge `α ^ m = β ^ m ↔ (α / β) ^ m = 1`
(given `β ≠ 0`) makes the exclusion hypothesis give ALL-m simplicity (`zeros_simple_all`,
the headline); the density-1 statement is the weaker corollary (M = 1), proved as such.

DESCOPE (recorded, P1): `stmt_lpoly_squarefree_iff` (the zeta-side Squarefree packaging
of `ZerosSimpleAt`) is NOT proved here — deferred to P2 as its own translation-layer
item. Census findings: the Finset lemma `separable_prod_X_sub_C_iff'`
(FieldTheory/Separable.lean:316) does not transfer to multiset products without a
cons-step that needs a `separable_mul`-class API absent on this pin, and the roots
route needs `nodup_roots_iff_of_splits` + the IsAlgClosed splits invocation — both
P2-sized API hunts for a convenience translation. `ZerosSimpleAt` (nodup of the
powered spectrum) IS the definition of "all zeros of Z_{C_m} simple" and is what every
load-bearing statement consumes. AMENDMENT note for P0's def: it is false for spectra
with repeated zeros (`A = {0, 0}`: numerator the unit `1`, powered multiset not nodup)
— the guarded form (0 ∉ baseChange A m) governs when P2 picks it up.

Guards unchanged and binding (bridge §4 design rule; battery 2026-11-17): every
statement here is exclusion-guarded or a negation/bound; no uniform-in-family claim.

Target: mathlib ff2494ea (toolchain v4.36.0-rc2).
-/

import Mathlib

open Multiset Polynomial Classical

namespace CrossMath.FFEZ2

/-! ## P0 definitions, carried (pilots/01 self-contained convention; descoped
`stmt_lpoly_squarefree_iff` carried only as documentation — see header) -/

def HypFrobeniusSpectrum (q : ℕ) (A : Multiset ℂ) : Prop :=
  1 < q ∧ ∀ α ∈ A, α ≠ 0 ∧ IsIntegral ℤ α ∧ ‖α‖ = √((q : ℝ))

def baseChange (A : Multiset ℂ) (m : ℕ) : Multiset ℂ := A.map (fun α => α ^ m)

def HypBaseChangePower (A : Multiset ℂ) (B : ℕ → Multiset ℂ) : Prop :=
  ∀ m : ℕ, 0 < m → B m = baseChange A m

def ZerosSimpleAt (A : Multiset ℂ) (m : ℕ) : Prop := (baseChange A m).Nodup

noncomputable def lPolyM (A : Multiset ℂ) (m : ℕ) : Polynomial ℂ :=
  ((baseChange A m).map (fun α => 1 - Polynomial.C α * Polynomial.X)).prod

noncomputable def simpleProportion (A : Multiset ℂ) (m : ℕ) : ℝ :=
  ((baseChange A m).dedup.card : ℝ) / (A.card : ℝ)

def NoRootOfUnityCollisions (A : Multiset ℂ) : Prop :=
  A.Nodup ∧ ∀ x ∈ A, ∀ y ∈ A, x ≠ y → ∀ n : ℕ, 0 < n → (x / y) ^ n ≠ 1

def stmt_maximal_violates_exclusion (A : Multiset ℂ) : Prop :=
  2 ≤ A.card → (∀ x ∈ A, ∀ y ∈ A, x = y) → ¬NoRootOfUnityCollisions A

def stmt_ff_ez2_base_change_density (q : ℕ) (A : Multiset ℂ) : Prop :=
  HypFrobeniusSpectrum q A → NoRootOfUnityCollisions A →
    ∀ ε : ℝ, 0 < ε → ∃ M : ℕ, ∀ M' : ℕ, M ≤ M' →
      ((Finset.filter (fun m => ZerosSimpleAt A m) (Finset.Ioc 0 M')).card : ℝ)
        / (M' : ℝ) > 1 - ε

def stmt_ff_ez2_family_form (q : ℕ) (A : Multiset ℂ) (B : ℕ → Multiset ℂ) : Prop :=
  HypFrobeniusSpectrum q A → HypBaseChangePower A B → NoRootOfUnityCollisions A →
    ∀ ε : ℝ, 0 < ε → ∃ M : ℕ, ∀ M' : ℕ, M ≤ M' →
      ((Finset.filter (fun m => (B m).Nodup) (Finset.Ioc 0 M')).card : ℝ)
        / (M' : ℝ) > 1 - ε

def stmt_power_merge_le (A : Multiset ℂ) : Prop :=
  0 < A.card → ∀ m : ℕ, 0 < m → (baseChange A m).dedup.card ≤ A.dedup.card

/-! ## Proof layer -/

/-- The P1 core: the collision bridge. If powers collide at a nonzero denominator,
the ratio is a root of unity. -/
theorem ratio_rootOfUnity_of_pow_eq {x y : ℂ} (hy : y ≠ 0) {m : ℕ} (hm : 0 < m)
    (h : x ^ m = y ^ m) : (x / y) ^ m = 1 := by
  rw [div_pow, h, div_self (pow_ne_zero m hy)]

/-- **The honest all-m theorem** (the headline): under purity (no zero eigenvalues,
from `HypFrobeniusSpectrum`) and the exclusion hypothesis, EVERY positive extension
degree has all-simple base-changed zeta zeros. -/
theorem zeros_simple_all {q : ℕ} {A : Multiset ℂ}
    (hs : HypFrobeniusSpectrum q A) (hc : NoRootOfUnityCollisions A)
    (m : ℕ) (hm : 0 < m) : ZerosSimpleAt A m := by
  rw [ZerosSimpleAt, baseChange, Multiset.nodup_iff_count_le_one]
  intro b
  rw [Multiset.count_map]
  by_cases hE : (A.filter fun a => b = a ^ m) = ∅
  · simp [hE]
  · obtain ⟨a, ha⟩ := Multiset.exists_mem_of_ne_zero hE
    rw [Multiset.mem_filter] at ha
    obtain ⟨haA, hab⟩ := ha
    have hsub : A.filter (fun a => b = a ^ m) ⊆ ({a} : Multiset ℂ) := by
      intro x hx
      rw [Multiset.mem_filter] at hx
      obtain ⟨hxA, hxb⟩ := hx
      by_contra hxa
      refine hc.2 x hxA a haA (fun h => hxa (by rw [h]; exact Multiset.mem_singleton_self a))
        m hm (ratio_rootOfUnity_of_pow_eq (hs.2 a haA).1 hm (by rw [← hxb, ← hab]))
    have hle := (Multiset.le_iff_subset (Multiset.Nodup.filter _ hc.1)).2 hsub
    calc (A.filter fun a => b = a ^ m).card ≤ ({a} : Multiset ℂ).card :=
          Multiset.card_le_card hle
      _ = 1 := by simp

/-- The trap negation, proved: an all-equal spectrum of size ≥ 2 violates the
exclusion hypothesis (the maximal-curve shape; Fuhrmann arXiv:alg-geom/9610023,
Tafazolian–Torres 2012 — battery pins, dated 2026-11-17). -/
theorem stmt_maximal_violates_exclusion_holds (A : Multiset ℂ) :
    stmt_maximal_violates_exclusion A := by
  intro hcard heq
  rintro ⟨hnodup, _⟩
  have hne : A ≠ 0 := by
    by_contra hA
    rw [hA] at hcard
    simpa using hcard
  obtain ⟨c, hc⟩ := Multiset.exists_mem_of_ne_zero hne
  have hsub : A ⊆ ({c} : Multiset ℂ) := by
    intro x hx
    exact Multiset.mem_singleton.2 (heq x hx c hc)
  have hle := (Multiset.le_iff_subset hnodup).2 hsub
  have h1 : A.card ≤ 1 :=
    calc A.card ≤ ({c} : Multiset ℂ).card := Multiset.card_le_card hle
      _ = 1 := by simp
  omega

/-- The merge inequality (statement-rung correction carrier), proved: powering can
only merge values — the powered multiset's dedup is dominated by mapping the source
dedup. -/
theorem stmt_power_merge_le_holds (A : Multiset ℂ) : stmt_power_merge_le A := by
  intro _ m _
  have hle : (A.map fun α => α ^ m).dedup ≤ A.dedup.map (fun α => α ^ m) := by
    rw [Multiset.le_iff_subset (Multiset.nodup_dedup _)]
    intro x hx
    rw [Multiset.mem_dedup, Multiset.mem_map] at hx
    rw [Multiset.mem_map]
    obtain ⟨a, ha, rfl⟩ := hx
    exact ⟨a, Multiset.mem_dedup.2 ha, rfl⟩
  calc (baseChange A m).dedup.card ≤ (A.dedup.map fun α => α ^ m).card :=
        Multiset.card_le_card hle
    _ = A.dedup.card := Multiset.card_map _ _

/-- The density mechanism, abstract form: if every positive `m` satisfies `p m`,
the density-1 bound holds with `M = 1`. -/
private theorem density_of_all {p : ℕ → Prop} [DecidablePred p]
    (hall : ∀ m, 0 < m → p m) (ε : ℝ) (hε : 0 < ε) (M' : ℕ) (hM : 1 ≤ M') :
    ((Finset.filter p (Finset.Ioc 0 M')).card : ℝ) / (M' : ℝ) > 1 - ε := by
  have hfilter : Finset.filter p (Finset.Ioc 0 M') = Finset.Ioc 0 M' :=
    Finset.filter_eq_self.2 (fun x hx => hall x (Finset.mem_Ioc.mp hx).1)
  have hcard : (Finset.Ioc 0 M').card = M' := by simpa using Nat.card_Ioc 0 M'
  rw [hfilter, hcard,
    div_self (by exact_mod_cast (show (M' : ℕ) ≠ 0 by omega))]
  linarith

/-- The headline, proved: purity + exclusion ⇒ natural density 1 (M = 1; the all-m
theorem makes the filtered set everything). -/
theorem stmt_ff_ez2_base_change_density_holds (q : ℕ) (A : Multiset ℂ) :
    stmt_ff_ez2_base_change_density q A := by
  intro hs hc ε hε
  refine ⟨1, fun M' hM =>
    density_of_all (p := fun m => ZerosSimpleAt A m)
      (fun m hm => zeros_simple_all (q := q) hs hc m hm) ε hε M' (by simpa using hM)⟩

/-- The family form, proved: transported along the Weil-side base-change binder
(`HypBaseChangePower`, the `FieldOfConstantsFrobenius.lean:163` conclusion). -/
theorem stmt_ff_ez2_family_form_holds (q : ℕ) (A : Multiset ℂ) (B : ℕ → Multiset ℂ) :
    stmt_ff_ez2_family_form q A B := by
  intro hs hB hc ε hε
  refine ⟨1, fun M' hM =>
    density_of_all (p := fun m => (B m).Nodup)
      (fun m hm => by rw [hB m hm]; exact zeros_simple_all (q := q) hs hc m hm)
      ε hε M' (by simpa using hM)⟩

/-! ## Audit prints (P1 proof artifact: every top-level theorem; expected triad) -/

#print axioms CrossMath.FFEZ2.ratio_rootOfUnity_of_pow_eq
#print axioms CrossMath.FFEZ2.zeros_simple_all
#print axioms CrossMath.FFEZ2.stmt_maximal_violates_exclusion_holds
#print axioms CrossMath.FFEZ2.stmt_power_merge_le_holds
#print axioms CrossMath.FFEZ2.density_of_all
#print axioms CrossMath.FFEZ2.stmt_ff_ez2_base_change_density_holds
#print axioms CrossMath.FFEZ2.stmt_ff_ez2_family_form_holds

end CrossMath.FFEZ2
