/-
Q4 — the hRat discharge for the 𝔽_q(T) probe class (proof artifact: no `sorry`).

Orchestrator-GO 2026-11-17 per the gate memo `research/pilots/73/Q4-gate-memo.md`.
Executes r5 backlog §13 M0 + Q4-a…d: the hRat witness produced EXPLICITLY by
residue-class periodicity on k[X] (Rosen GTM 210 ch. 8 — PROVISIONAL pin per the
memo §4 / C2 record :127–:130; one-lookup verification at the dossier-upgrade
write-up, HKT-precedent convention).

SCOPE FENCE (gate memo §3 / 73-prework §6 R5): no FE/root numbers (Gauss sums), no
general curves, no sheaf construction, no proportions, no Tier-A dreams — and `hPur`
is NEVER discharged (the prework §2.4 honesty correction; it stays a binder).

Substrate: `import C` (the sibling GREEN Tier-C layer; C.lean stays frozen); the
runner emits C.olen in dependency order (the lp-runner olen-emission pattern,
applied to crossmath-pilot-73 this run — machinery delta logged in the run header).
Mathlib `ff2494ea` only. Modulus hypotheses: `M.Monic`, `M ≠ 0`, `1 ≤ M.natDegree`
(the degenerate `span M = ⊤` modulus — the trivial character — is fenced out and
recorded here, not silently assumed).

Proof architecture (Q4-a/b): monic degree-n polynomials decompose uniquely as
`M * g + r` with `g` monic of degree `n − d` and `r` of degree `< d`
(`divmod_unique`; `d := M.natDegree`). χ is congruence-invariant on the coprime
cone (K1 — the common-multiple-inverse trick), vanishes off the cone
(`eq_zero_iff'`), and coprimality is congruence-invariant — so the level-`n`
coefficient of `heckeSeriesT χ` is `q^{n−d} · S` for every `n ≥ d`, and
`L · (1 − qT)` is a polynomial of degree `≤ d` (Q4-b). Q4-c feeds the witness to
C.lean's GREEN `hecke_continuation`, making (P)(i) unconditional for the probe.

OUTCOME FORK (N=1 FINAL): GREEN → dossier upgrade note (no article).
-/

import C

open Polynomial

namespace Pilot73

section Q4

variable {k : Type*} [Field k] [Fintype k] [DecidableEq k]

/-! ## The coefficient computation for `monicDegreeN` elements -/

/-- Coefficients of the parametrized monic polynomial. -/
private theorem coeff_monic_param (n : ℕ) (v : Fin n → k) (j : ℕ) :
    (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k).coeff j
      = if j = n then 1 else if h : j < n then v ⟨j, h⟩ else 0 := by
  rcases Nat.lt_trichotomy j n with h | h | h
  · have hn : ¬ j = n := ne_of_lt h
    rw [coeff_add, coeff_X_pow, if_neg hn, if_pos h]
    rw [Finset.coeff_sum]
    rw [Finset.sum_eq_single (⟨j, h⟩ : Fin n)]
    · simp [coeff_monomial, if_neg hn]
    · intro b _ hb
      have : ¬ (b : ℕ) = j := fun hc => hb (by
          ext; simpa using hc.symm)
      simp [coeff_monomial, this]
    · intro h0
      exact absurd (Finset.mem_univ _) h0
  · subst h
    simp only [coeff_add, coeff_X_pow, Finset.coeff_sum, if_pos rfl]
    rw [Finset.sum_eq_zero fun i _ => by
      simp [coeff_monomial, Fin.val_ne_of_ne (by
        intro hc; exact absurd (congrArg Fin.val hc) (by simp))]
      ]
    norm_num
  · have hn : ¬ j = n := ne_of_gt h
    have h2 : ¬ j < n := not_lt.mpr h
    rw [coeff_add, coeff_X_pow, if_neg hn, if_neg h2]
    rw [Finset.coeff_sum, Finset.sum_eq_zero fun i _ => by
      have : ¬ (i : ℕ) = j := fun hc => absurd (hc ▸ i.prop) (not_lt.mpr h)
      simp [coeff_monomial, this]]
    norm_num

/-- Faithfulness of the parametrization. -/
theorem mem_monicDegreeN_iff {n : ℕ} {f : Polynomial k} :
    f ∈ monicDegreeN k n ↔ f.Monic ∧ f.natDegree = n := by
  constructor
  · intro hf
    obtain ⟨v, _, hv⟩ := Finset.mem_image.mp hf
    subst hv
    have hdeg : (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k).degree
        = (n : WithBot ℕ) := by
      refine le_antisymm ?_ ?_
      · rw [Polynomial.degree_le_iff_coeff_zero]
        intro j hj
        rw [coeff_monic_param]
        split_ifs <;> simp_all
      · exact le_degree_of_ne_zero (by
          rw [coeff_monic_param, if_pos rfl]; norm_num)
    refine ⟨⟨?_⟩, ?_⟩
    · show (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k).leadingCoeff = 1
      rw [Polynomial.leadingCoeff, natDegree_of_degree_eq hdeg,
          coeff_monic_param, if_pos rfl]
      norm_num
    · exact natDegree_of_degree_eq hdeg
  · intro ⟨hmon, hdeg⟩
    refine Finset.mem_image.mpr ⟨fun i => f.coeff i, Finset.mem_univ _, ?_⟩
    have hc : f.coeff n = 1 := by
      have : f.coeff f.natDegree = 1 := hmon
      rwa [hdeg] at this
    ext j
    have hcj := coeff_monic_param n (fun i => f.coeff i) j
    rw [← hcj]
    by_cases h : j = n
    · rw [if_pos h, if_pos h, hc]
    · rw [if_neg h]
      by_cases h2 : j < n
      · rw [if_pos h2, if_pos h2]
      · rw [if_neg h2, if_neg h2]
        exact coeff_eq_zero_of_degree_lt_degree (by
          rw [← natDegree_lt_iff_degree_lt]
          exact_mod_cast (lt_of_le_of_lt (le_of_eq hdeg) (by omega)))

theorem card_monicDegreeN (n : ℕ) :
    (monicDegreeN k n).card = (Fintype.card k) ^ n := by
  have hinj : ∀ v ∈ (Finset.univ : Finset (Fin n → k)),
      ∀ v' ∈ (Finset.univ : Finset (Fin n → k)),
      (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k)
        = X ^ n + ∑ i : Fin n, monomial i (v' i) → v = v' := by
    intro v _ v' _ h
    funext i
    have h1 := congrArg (fun p : Polynomial k => p.coeff (i : ℕ)) h
    rw [coeff_monic_param, coeff_monic_param, if_neg (by
        exact fun hc => absurd (congrArg Fin.val hc) (by simp)),
      if_pos i.prop, if_neg (by
        exact fun hc => absurd (congrArg Fin.val hc) (by simp)), if_pos i.prop] at h1
    exact h1
  rw [monicDegreeN, Finset.card_image_of_injOn (fun v hv v' hv' => hinj v hv v' hv')]
  simp

/-! ## The residue carrier -/

/-- Residues as coefficient vectors. `natDegree < d` uniformly. -/
private def psiVec (d : ℕ) (v : Fin d → k) : Polynomial k :=
  ∑ i : Fin d, monomial i (v i)

private theorem natDegree_psiVec_lt (d : ℕ) (v : Fin d → k) :
    (psiVec d v).natDegree < d ∨ psiVec d v = 0 := by
  rcases Finset.eq_empty_or_nonempty (Finset.univ : Finset (Fin d)) with h0 | hne
  · right
    simp [psiVec, h0]
  · left
    have hbound : (psiVec d v).natDegree ≤ ⨆ i : Fin d,
        (monomial (i : ℕ) (v i)).natDegree := natDegree_sum_le
    have hsup : (⨆ i : Fin d, (monomial (i : ℕ) (v i)).natDegree) < d := by
      refine Finset.sup_lt_iff ?_ |>.2 fun i _ =>
        lt_of_le_of_lt (natDegree_monomial_le _ _) i.prop
      exact_mod_cast (Finset.card_pos.mpr hne)
    exact lt_of_le_of_lt hbound hsup

/-- A polynomial of degree `< d` is its coefficient vector's `psiVec`. -/
private theorem eq_psiVec_of_lt {d : ℕ} {r : Polynomial k} (hr : r.natDegree < d) :
    r = psiVec d (fun i => r.coeff i) := by
  ext j
  rcases Nat.lt_trichotomy j d with h | h | h
  · rw [psiVec, Finset.coeff_sum]
    rw [Finset.sum_eq_single (⟨j, h⟩ : Fin d)]
    · simp [coeff_monomial]
    · intro b _ hb
      have : ¬ (b : ℕ) = j := fun hc => hb (by ext; simpa using hc.symm)
      simp [coeff_monomial, this]
    · intro h0; exact absurd (Finset.mem_univ _) h0
  · subst h; simp
  · rw [coeff_eq_zero_of_degree_lt_degree (by
      rw [← natDegree_lt_iff_degree_lt]; exact_mod_cast hr)]
    rw [psiVec, Finset.coeff_sum, Finset.sum_eq_zero fun i _ => by
      have : ¬ (i : ℕ) = j := fun hc => absurd (hc ▸ i.prop) (not_lt.mpr h)
      simp [coeff_monomial, this]]

end Q4

end Pilot73
