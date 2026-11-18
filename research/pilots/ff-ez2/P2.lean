/-
Pilot FF-EZ2 P2 — descope-closure rung: the guarded squarefree-iff translation layer,
PROVED from the carried P0 defs + mathlib only. PROOF ARTIFACT: zero `sorry`, no
`native_decide`, kernel-only. S-class (P1 record §"Recorded descope"; charter
2026-11-17: the guarded form governs, optional proportion add-on, ≤3 Modal runs).

THE P1 DESCOPE, CLOSED HERE. The P0 form of `stmt_lpoly_squarefree_iff` (the zeta-side
Squarefree packaging of `ZerosSimpleAt`) is FALSE for repeated-zero spectra — the P1
amendment note: `A = {0, 0}`, `m = 1` gives `lPolyM = 1` (squarefree) while the powered
multiset `{0, 0}` is not nodup. The GUARDED form governs (P1 record): under
`0 ∉ baseChange A m` (implied by purity), `Squarefree (lPolyM A m) ↔ ZerosSimpleAt A m`.
Purity discharge: `HypFrobeniusSpectrum` — the Weil-side statement-binder (G3/G6b
class; purity clause of `LeanEval/WeilConjectures.lean:185–194`, cited never imported)
— gives the guard (`guard_of_purity`), so the hypothesis-binder convention holds.

API CENSUS RESOLVED (the P1-recorded blockers, on-pin ff2494ea): the Finset lemma
`separable_prod_X_sub_C_iff'` (FieldTheory/Separable.lean:316) indeed does not transfer
to multiset products — BYPASSED by the roots route: `Polynomial.roots_multiset_prod`
(Algebra/Polynomial/Roots.lean:298) + `Multiset.bind_map` / `bind_congr` /
`bind_singleton` (Data/Multiset/Bind.lean) + per-factor `Polynomial.roots_X_sub_C`
(Roots.lean:212) / `roots_C_mul` (:236) with root β⁻¹, then
`Polynomial.nodup_roots_iff_of_splits` (FieldTheory/Separable.lean:449) +
`PerfectField.separable_iff_squarefree` (FieldTheory/Perfect.lean:326; ℂ perfect via
`IsAlgClosed.perfectField`, FieldTheory/IsAlgClosed/Basic.lean:389) +
`IsAlgClosed.splits` (:64). The nodup transfer runs along `inv`, an involution of ℂ
(`inv_inv`, incl. the 0⁻¹ = 0 convention), hence injective.

Optional proportion rung (P1 record §P2, same chartered run budget): the unconditional
per-level bound `simpleProportion A m ≤ 1` — powering only merges (the P1 merge
inequality's corollary via `Multiset.dedup_le`, Dedup.lean:52 + `Multiset.card_map`).

Guards unchanged and binding (bridge §4 design rule; battery 2026-11-17): every
statement is exclusion-guarded, a bound, or carries its own guard; no
uniform-in-family claim. Informal neighbors unchanged, dated 2026-11-17: Bui–Florea
arXiv:1605.07092; Suzuki arXiv:2610.41115; falsity-trap pins Fuhrmann
arXiv:alg-geom/9610023 + Tafazolian–Torres 2012.

Axiom-spelling note (P1 finding): P2 does NOT `open Classical`, so the triad prints in
the full spelling (`Classical.choice`, not the open-relativized `choice`).

Target: mathlib ff2494ea (toolchain v4.36.0-rc2).
-/

import Mathlib

open Multiset Polynomial

namespace CrossMath.FFEZ2

/-! ## P0 definitions, carried (pilots/01 self-contained convention) -/

/-- Weil-side binder (G3/G6b class, statement-level citation only): purity/normal form
of the H¹ Frobenius eigenvalue multiset (`LeanEval/WeilConjectures.lean:185–194`). -/
def HypFrobeniusSpectrum (q : ℕ) (A : Multiset ℂ) : Prop :=
  1 < q ∧ ∀ α ∈ A, α ≠ 0 ∧ IsIntegral ℤ α ∧ ‖α‖ = √((q : ℝ))

/-- The base-change power law as data (`FieldOfConstantsFrobenius.lean:163` class). -/
def baseChange (A : Multiset ℂ) (m : ℕ) : Multiset ℂ := A.map (fun α => α ^ m)

/-- All zeros of the H¹ numerator of `Z_{C_m}(T)` are simple ⟺ the powered spectrum is
nodup (the load-bearing definition, unchanged from P0/P1). -/
def ZerosSimpleAt (A : Multiset ℂ) (m : ℕ) : Prop := (baseChange A m).Nodup

/-- The L-polynomial at level `m` (carried from `pilots/71/P2.lean:57` via P0). -/
noncomputable def lPolyM (A : Multiset ℂ) (m : ℕ) : Polynomial ℂ :=
  ((baseChange A m).map (fun α => 1 - Polynomial.C α * Polynomial.X)).prod

/-- The per-level simple proportion (carried, P0 spelling). -/
noncomputable def simpleProportion (A : Multiset ℂ) (m : ℕ) : ℝ :=
  ((baseChange A m).dedup.card : ℝ) / (A.card : ℝ)

/-! ## The P2 statements -/

/-- The descope item, GUARDED form governs (P1 record amendment): the zeta-side
Squarefree reading of `ZerosSimpleAt`, under `0 ∉ baseChange A m`. The unguarded P0
form is FALSE (`A = {0, 0}`, `m = 1`: unit numerator, non-nodup powered spectrum). -/
def stmt_lpoly_squarefree_iff (A : Multiset ℂ) (m : ℕ) : Prop :=
  0 ∉ baseChange A m → (Squarefree (lPolyM A m) ↔ ZerosSimpleAt A m)

/-- Optional proportion rung: the unconditional per-level bound in honest form — the
distinct-powered-value fraction never exceeds 1 (powering only merges; P1's merge
inequality as the carrier). -/
def stmt_simple_proportion_le (A : Multiset ℂ) : Prop :=
  0 < A.card → ∀ m : ℕ, 0 < m → simpleProportion A m ≤ 1

/-! ## Proof layer -/

/-- Each linear factor is nonzero (evaluate at 0). -/
private theorem factor_ne_zero (β : ℂ) :
    (1 : Polynomial ℂ) - Polynomial.C β * Polynomial.X ≠ 0 := by
  intro h
  have h0 : ((1 : Polynomial ℂ) - Polynomial.C β * Polynomial.X).eval 0 = 0 := by
    rw [h]; simp
  simp at h0

/-- Per-factor roots: the zero of `1 − βT` is `β⁻¹` (unit reshuffle to `X − C β⁻¹`). -/
private theorem roots_one_sub (β : ℂ) (hβ : β ≠ 0) :
    ((1 : Polynomial ℂ) - Polynomial.C β * Polynomial.X).roots = {β⁻¹} := by
  have h : (1 : Polynomial ℂ) - Polynomial.C β * Polynomial.X
      = -(Polynomial.C β) * (Polynomial.X - Polynomial.C (β⁻¹)) := by
    rw [neg_mul, mul_sub, ← Polynomial.C_mul, mul_inv_cancel₀ hβ, Polynomial.C_1]
    ring
  rw [h, ← Polynomial.C_neg, Polynomial.roots_C_mul _ (neg_ne_zero.mpr hβ),
    Polynomial.roots_X_sub_C]

/-- `inv : ℂ → ℂ` is an involution, hence injective. -/
private theorem inv_injective : Function.Injective (Inv.inv : ℂ → ℂ) :=
  Function.Involutive.injective fun _ => inv_inv _

private theorem nodup_map_inv (B : Multiset ℂ) (h : B.Nodup) :
    (B.map (fun β => β⁻¹)).Nodup :=
  Multiset.Nodup.map inv_injective h

private theorem nodup_of_map_inv (B : Multiset ℂ) (h : (B.map (fun β => β⁻¹)).Nodup) :
    B.Nodup := by
  have h2 := Multiset.Nodup.map inv_injective h
  rw [Multiset.map_map] at h2
  have hid : ((fun x : ℂ => x⁻¹) ∘ (fun x : ℂ => x⁻¹)) = id := by
    funext x; simp [inv_inv]
  rwa [hid, Multiset.map_id] at h2

/-- Purity discharges the guard (hypothesis-binder convention: the Weil-side statement
binder gives `α ≠ 0`, and powers of nonzero complex numbers are nonzero). -/
theorem guard_of_purity {q : ℕ} {A : Multiset ℂ} (hs : HypFrobeniusSpectrum q A) (m : ℕ) :
    0 ∉ baseChange A m := by
  intro h
  simp only [baseChange, Multiset.mem_map] at h
  obtain ⟨α, hα, hα0⟩ := h
  rcases Nat.eq_zero_or_pos m with rfl | hm
  · rw [pow_zero] at hα0
    exact one_ne_zero hα0
  · exact (hs.2 α hα).1 ((pow_eq_zero_iff (by omega)).mp hα0)

/-- **The P2 headline, proved** (descope closed): under the purity-implied guard, the
zeta-side `Squarefree` reading of the base-changed H¹ numerator is equivalent to the
load-bearing nodup definition. -/
theorem stmt_lpoly_squarefree_iff_holds (A : Multiset ℂ) (m : ℕ) :
    stmt_lpoly_squarefree_iff A m := by
  intro h0
  have hmem : (0 : Polynomial ℂ) ∉
      ((baseChange A m).map fun β => (1 : Polynomial ℂ) - Polynomial.C β * Polynomial.X) := by
    intro h
    simp only [Multiset.mem_map] at h
    obtain ⟨β, -, hβ⟩ := h
    exact factor_ne_zero β hβ
  have hfne : lPolyM A m ≠ 0 := by
    simp only [lPolyM]
    exact Multiset.prod_ne_zero hmem
  have hbind : (baseChange A m).bind (fun x : ℂ => ({x⁻¹} : Multiset ℂ))
      = (baseChange A m).map (fun β => β⁻¹) :=
    Multiset.bind_singleton _ _
  have hroots : (lPolyM A m).roots = (baseChange A m).map (fun β => β⁻¹) := by
    simp only [lPolyM]
    rw [Polynomial.roots_multiset_prod _ hmem, Multiset.bind_map, ← hbind]
    exact Multiset.bind_congr fun β hβ =>
      roots_one_sub β (fun h => h0 (h ▸ hβ))
  have hsplits : (lPolyM A m).Splits := IsAlgClosed.splits (lPolyM A m)
  constructor
  · intro hsq
    have hsep : (lPolyM A m).Separable := PerfectField.separable_iff_squarefree.mpr hsq
    have hnd : ((baseChange A m).map (fun β => β⁻¹)).Nodup := by
      rw [← hroots]
      exact (Polynomial.nodup_roots_iff_of_splits hfne hsplits).mpr hsep
    exact nodup_of_map_inv _ hnd
  · intro hnd
    have hsep : (lPolyM A m).Separable :=
      (Polynomial.nodup_roots_iff_of_splits hfne hsplits).mp (by
        rw [hroots]
        exact nodup_map_inv _ hnd)
    exact PerfectField.separable_iff_squarefree.mp hsep

/-- The binder-consuming corollary (EnclOK precedent): under the purity binder alone,
the guarded equivalence runs unguarded — purity IS the guard. -/
theorem zeros_simple_iff_squarefree_of_purity {q : ℕ} {A : Multiset ℂ}
    (hs : HypFrobeniusSpectrum q A) (m : ℕ) :
    Squarefree (lPolyM A m) ↔ ZerosSimpleAt A m :=
  (stmt_lpoly_squarefree_iff_holds A m) (guard_of_purity hs m)

/-- The optional proportion rung, proved: the distinct-powered-value fraction over the
spectrum size never exceeds 1, unconditionally (dedup ≤ self via `dedup_le`, then
`card_map`) — the honest per-level statement behind the P0-corrected ≤ monotonicity. -/
theorem stmt_simple_proportion_le_holds (A : Multiset ℂ) : stmt_simple_proportion_le A := by
  intro hcard m _
  have hpos : (0 : ℝ) < (A.card : ℝ) := by exact_mod_cast hcard
  have hle : (baseChange A m).dedup.card ≤ A.card := by
    have h1 : (baseChange A m).dedup.card ≤ (baseChange A m).card :=
      Multiset.card_le_card (Multiset.dedup_le _)
    have h2 : (baseChange A m).card = A.card := by
      simp only [baseChange, Multiset.card_map]
    exact h1.trans h2.le
  show ((baseChange A m).dedup.card : ℝ) / (A.card : ℝ) ≤ 1
  rw [div_le_one hpos]
  exact_mod_cast hle

/-! ## Audit prints (P2 proof artifact: every top-level theorem; expected triad) -/

#print axioms CrossMath.FFEZ2.guard_of_purity
#print axioms CrossMath.FFEZ2.stmt_lpoly_squarefree_iff_holds
#print axioms CrossMath.FFEZ2.zeros_simple_iff_squarefree_of_purity
#print axioms CrossMath.FFEZ2.stmt_simple_proportion_le_holds
#print axioms CrossMath.FFEZ2.factor_ne_zero
#print axioms CrossMath.FFEZ2.roots_one_sub
#print axioms CrossMath.FFEZ2.inv_injective
#print axioms CrossMath.FFEZ2.nodup_map_inv
#print axioms CrossMath.FFEZ2.nodup_of_map_inv

end CrossMath.FFEZ2
