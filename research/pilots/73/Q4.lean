/-
Q4 — the hRat discharge for the 𝔽_q(T) probe class (proof artifact: no `sorry`).

Orchestrator-GO 2026-11-17 per the gate memo `research/pilots/73/Q4-gate-memo.md`.
Executes r5 backlog §13 M0 + Q4-a…d: the hRat witness produced EXPLICITLY by
residue-class periodicity on k[X] (Rosen GTM 210 ch. 8 — PROVISIONAL pin per the
memo §4 / C2 record :127–:130; one-lookup verification at the dossier-upgrade
write-up, HKT-precedent convention).

SCOPE FENCE (gate memo §3 / 73-prework §6 R5): no FE/root numbers (Gauss sums), no
general curves, no sheaf construction, no proportions, no Tier-A dreams — and `hPur`
is NEVER discharged (the prework §2.4 honesty correction; it stays a binder in every
statement this pilot touches).

Substrate: `import C` (the sibling GREEN Tier-C layer; C.lean stays frozen); the
runner emits C.olen in dependency order (the lp-runner olen-emission pattern,
applied to crossmath-pilot-73 this run — machinery delta logged in the run header).
Mathlib `ff2494ea` only. Modulus hypotheses: `M.Monic`, `1 ≤ M.natDegree` (the
degenerate `span M = ⊤` modulus — the trivial character — is fenced out and
recorded here, not silently assumed).

Proof architecture (Q4-a/b): monic degree-n polynomials decompose as
`M * g + r` with `g` monic of degree `n − d` and `r` of degree `< d`, uniquely
(`div_modByMonic_unique`; `d := M.natDegree`). χ is congruence-invariant on the
coprime cone (K1 — the common-multiple-inverse trick), vanishes off the cone
(`eq_zero_iff'`), and coprimality is congruence-invariant — so the level-`n`
coefficient of `heckeSeriesT χ` is `q^{n−d} · S` for every `n ≥ d` (Q4-a), and
`L · (1 − qT)` is the polynomial `P₁` of degree `≤ d` (Q4-b). Q4-c feeds the
witness to C.lean's GREEN `hecke_continuation`, making (P)(i) unconditional for
the probe.

OUTCOME FORK (N=1 FINAL): GREEN → dossier upgrade note (no article).
-/

import C
import Mathlib.Algebra.Polynomial.Div
import Mathlib.Algebra.Polynomial.Monic

open Polynomial

namespace Pilot73

section Q4

variable {k : Type*} [Field k] [Fintype k] [DecidableEq k]

/-! ## Q4-a.1 — coefficient computation for the `monicDegreeN` parametrization -/

/-- Pointwise coefficient/Finset-sum commute (local mini-lemma: avoids
big-operator-layer spelling risk; used for every coefficient computation below). -/
private theorem poly_coeff_finset_sum {R : Type*} [CommRing R] {ι : Type*}
    (s : Finset ι) (f : ι → Polynomial R) (j : ℕ) :
    (∑ b ∈ s, f b).coeff j = ∑ b ∈ s, (f b).coeff j := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s has ih => simp [Finset.sum_insert has, ih, coeff_add]

/-- A constant Finset sum is the cast of the cardinality times the constant. -/
private theorem finset_sum_const_eq {α : Type*} (s : Finset α) (c : ℂ) :
    ∑ _x ∈ s, c = ((s.card : ℕ) : ℂ) * c := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert a s has ih =>
    simp only [Finset.sum_insert has, ih, Finset.card_insert_of_notMem has,
      Nat.cast_succ, add_mul, one_mul]
    ring

/-- The coefficient of a coefficient-vector sum at an index below the length. -/
private theorem coeff_sum_monomial_eq (d : ℕ) (w : Fin d → k) (j : ℕ) (hj : j < d) :
    (∑ i : Fin d, monomial (i : ℕ) (w i)).coeff j = w ⟨j, hj⟩ := by
  rw [poly_coeff_finset_sum]
  refine (Finset.sum_eq_single (⟨j, hj⟩ : Fin d) ?_ ?_).trans ?_
  · intro b _ hb
    have hne : (b : ℕ) ≠ j := fun hc => hb (Fin.ext hc)
    simp [coeff_monomial, hne]
  · intro h0; exact absurd (Finset.mem_univ _) h0
  · simp [coeff_monomial]

/-- The coefficient of a coefficient-vector sum at an index at or above the length. -/
private theorem coeff_sum_monomial_eq_zero (d : ℕ) (w : Fin d → k) (j : ℕ)
    (hj : d ≤ j) :
    (∑ i : Fin d, monomial (i : ℕ) (w i)).coeff j = 0 := by
  rw [poly_coeff_finset_sum]
  refine Finset.sum_eq_zero fun i _ => ?_
  have hne : (i : ℕ) ≠ j := fun hc => absurd (hc ▸ i.prop) (by omega)
  simp [coeff_monomial, hne]

/-- Coefficients of the parametrized monic polynomial. -/
private theorem coeff_monic_param (n : ℕ) (v : Fin n → k) (j : ℕ) :
    (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k).coeff j
      = if j = n then 1 else if h : j < n then v ⟨j, h⟩ else 0 := by
  rw [coeff_add, coeff_X_pow]
  rcases Nat.lt_trichotomy j n with h | h | h
  · rw [if_neg (ne_of_lt h), zero_add, if_neg (ne_of_lt h), dif_pos h]
    exact coeff_sum_monomial_eq n v j h
  · rw [h, if_pos rfl, coeff_sum_monomial_eq_zero n v n (Nat.le_refl n), add_zero,
      if_pos rfl]
  · rw [if_neg (ne_of_gt h), zero_add, if_neg (ne_of_gt h),
      dif_neg (not_lt.mpr (le_of_lt h))]
    exact coeff_sum_monomial_eq_zero n v j (le_of_lt h)

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
        have hjn : n < j := by exact_mod_cast hj
        rw [coeff_monic_param]
        rcases Nat.lt_trichotomy j n with h | h | h
        · exact absurd h (by omega)
        · omega
        · rw [if_neg (ne_of_gt h), dif_neg (not_lt.mpr (le_of_lt h))]
      · exact le_degree_of_ne_zero (by
          rw [coeff_monic_param, if_pos rfl]; norm_num)
    refine ⟨?_, natDegree_eq_of_degree_eq_some hdeg⟩
    show (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k).coeff
      (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k).natDegree = 1
    rw [natDegree_eq_of_degree_eq_some hdeg, coeff_monic_param, if_pos rfl]
  · intro ⟨hmon, hdeg⟩
    refine Finset.mem_image.mpr ⟨fun i => f.coeff i, Finset.mem_univ _, ?_⟩
    have hc : f.coeff n = 1 := by
      have h1 : f.coeff f.natDegree = 1 := hmon
      rwa [hdeg] at h1
    ext j
    have hcj := coeff_monic_param n (fun i => f.coeff i) j
    rw [hcj]
    by_cases h : j = n
    · subst h
      rw [if_pos rfl]
      exact hc.symm
    · rw [if_neg h]
      by_cases h2 : j < n
      · rw [dif_pos h2]
      · rw [dif_neg h2]
        exact (coeff_eq_zero_of_natDegree_lt (by rw [hdeg]; omega)).symm

theorem card_monicDegreeN (n : ℕ) :
    (monicDegreeN k n).card = (Fintype.card k) ^ n := by
  have hinj : ∀ v ∈ (Finset.univ : Finset (Fin n → k)),
      ∀ v' ∈ (Finset.univ : Finset (Fin n → k)),
      (X ^ n + ∑ i : Fin n, monomial i (v i) : Polynomial k)
        = X ^ n + ∑ i : Fin n, monomial i (v' i) → v = v' := by
    intro v _ v' _ h
    funext i
    have h1 := congrArg (fun p : Polynomial k => p.coeff (i : ℕ)) h
    have hlt : (i : ℕ) < n := i.prop
    rw [coeff_monic_param n v (i : ℕ), coeff_monic_param n v' (i : ℕ),
      if_neg (by omega), if_neg (by omega), dif_pos hlt, dif_pos hlt] at h1
    exact h1
  simp only [monicDegreeN]
  rw [Finset.card_image_of_injOn (fun v hv v' hv' => hinj v hv v' hv')]
  simp

/-! ## Q4-a.2 — the residue carrier -/

/-- Residues as coefficient vectors. -/
private noncomputable def psiVec (d : ℕ) (v : Fin d → k) : Polynomial k :=
  ∑ i : Fin d, monomial i (v i)

private theorem natDegree_psiVec_lt (d : ℕ) (v : Fin d → k) :
    (psiVec d v).natDegree < d ∨ psiVec d v = 0 := by
  rcases Finset.eq_empty_or_nonempty (Finset.univ : Finset (Fin d)) with h0 | hne
  · right
    simp [psiVec, h0]
  · left
    obtain ⟨i, -⟩ := hne
    have hislt : (i : ℕ) < d := i.isLt
    have hdeg : (psiVec d v).degree < (d : WithBot ℕ) := by
      rw [Polynomial.degree_lt_iff_coeff_zero]
      exact fun m hm => coeff_sum_monomial_eq_zero d v m hm
    rcases eq_or_ne (psiVec d v) 0 with h1 | h1
    · rw [h1, natDegree_zero]; omega
    · exact (natDegree_lt_iff_degree_lt h1).mpr hdeg

/-- A polynomial of degree `< d` is its coefficient vector's `psiVec`. -/
private theorem eq_psiVec_of_lt {d : ℕ} {r : Polynomial k} (hr : r.natDegree < d) :
    r = psiVec d (fun i => r.coeff i) := by
  ext j
  by_cases hj : j < d
  · exact (coeff_sum_monomial_eq d (fun i => r.coeff i) j hj).symm
  · rw [coeff_eq_zero_of_natDegree_lt (by omega)]
    exact (coeff_sum_monomial_eq_zero d (fun i => r.coeff i) j (by omega)).symm

/-- Residues mod a length-`d` modulus, as a Finset. -/
private noncomputable def resFinset (d : ℕ) : Finset (Polynomial k) :=
  Finset.image (psiVec d) (Finset.univ : Finset (Fin d → k))

theorem mem_resFinset_iff {d : ℕ} (hd : 1 ≤ d) {r : Polynomial k} :
    r ∈ resFinset d ↔ r.natDegree < d := by
  constructor
  · intro hrw
    obtain ⟨v, _, hv⟩ := Finset.mem_image.mp hrw
    subst hv
    rcases natDegree_psiVec_lt d v with h | h
    · exact h
    · rw [h, natDegree_zero]; omega
  · intro hrw
    exact Finset.mem_image.2 ⟨fun i => r.coeff i, Finset.mem_univ _,
      (eq_psiVec_of_lt hrw).symm⟩

/-! ## Q4-a.3 — the coprime cone: transfer, the span bridge, vanishing, K1 -/

/-- Coprimality with the modulus is invariant under subtracting multiples of it. -/
theorem isCoprime_congr_of_dvd_sub {M f r : Polynomial k} (hcong : M ∣ f - r) :
    IsCoprime f M ↔ IsCoprime r M := by
  obtain ⟨h, hh⟩ := hcong
  constructor
  · intro hcop
    obtain ⟨a, b, hab⟩ := hcop
    exact ⟨a, a * h + b, by linear_combination hab - a * hh⟩
  · intro hcop
    obtain ⟨a, b, hab⟩ := hcop
    exact ⟨a, b - a * h, by linear_combination hab + a * hh⟩

theorem not_isUnit_of_one_le_natDegree {M : Polynomial k} (hM : M.Monic)
    (hd1 : 1 ≤ M.natDegree) : ¬ IsUnit M := by
  intro hu
  obtain ⟨u, hu'⟩ := isUnit_iff_exists_inv.mp hu
  have hle := Polynomial.Monic.natDegree_le_of_dvd hM one_ne_zero ⟨u, hu'.symm⟩
  rw [natDegree_one] at hle
  omega

/-- The coprime cone, at the ideal level of the character's `eq_zero_iff'`. -/
theorem span_sup_span_eq_top_iff {f M : Polynomial k} :
    Ideal.span {f} ⊔ Ideal.span {M} = ⊤ ↔ IsCoprime f M := by
  constructor
  · intro htop
    have h1 : (1 : Polynomial k) ∈ Ideal.span {f} ⊔ Ideal.span {M} := by
      rw [htop]; simp
    obtain ⟨x, hx, y, hy, hxy⟩ := Submodule.mem_sup.mp h1
    rw [Ideal.mem_span_singleton] at hx hy
    obtain ⟨c, hc⟩ := hx
    obtain ⟨e, he⟩ := hy
    exact ⟨c, e, by linear_combination hxy - hc - he⟩
  · intro hcop
    obtain ⟨a, b, hab⟩ := hcop
    refine (Submodule.sup_eq_top_iff _ _).2 fun x => ?_
    exact ⟨x * a * f, Ideal.mem_span_singleton.2 ⟨x * a, by ring⟩,
      x * b * M, Ideal.mem_span_singleton.2 ⟨x * b, by ring⟩,
      by linear_combination (-x) * hab⟩

/-- χ vanishes off the coprime cone. -/
theorem apply_span_singleton_eq_zero_of_not_isCoprime {M : Polynomial k} (hM : M.Monic)
    (hd1 : 1 ≤ M.natDegree) (χ : FFRayClassCharacter k (Ideal.span {M}))
    {f : Polynomial k} (h : ¬ IsCoprime f M) :
    χ.toFun (Ideal.span {f}) = 0 := by
  rcases eq_or_ne f 0 with rfl | hf0
  · rw [Ideal.span_singleton_eq_bot.2 rfl, χ.eq_zero_iff']
    exact Or.inl rfl
  · rw [apply_span_singleton_eq_zero_iff χ hf0]
    intro htop
    exact h (span_sup_span_eq_top_iff.1 htop)

/-- **K1**: χ is congruence-invariant on the coprime cone (the
common-multiple-inverse trick: `a` inverts `r` modulo `M`, so it inverts `f` too,
and `χ(span f) · χ(span a) = 1 = χ(span r) · χ(span a)`). -/
theorem apply_span_singleton_congr_of_dvd_sub {M : Polynomial k} (hM : M.Monic)
    (hd1 : 1 ≤ M.natDegree) (χ : FFRayClassCharacter k (Ideal.span {M}))
    {f r : Polynomial k} (hcong : M ∣ f - r) (hrc : IsCoprime r M) :
    χ.toFun (Ideal.span {f}) = χ.toFun (Ideal.span {r}) := by
  obtain ⟨h, hh⟩ := hcong
  have hMnu : ¬ IsUnit M := not_isUnit_of_one_le_natDegree hM hd1
  have hfc : IsCoprime f M := (isCoprime_congr_of_dvd_sub ⟨h, hh⟩).2 hrc
  have hf0 : f ≠ 0 := by
    intro h0
    rw [h0] at hfc
    exact hMnu (isCoprime_zero_left.1 hfc)
  have hr0 : r ≠ 0 := by
    intro h0
    rw [h0] at hrc
    exact hMnu (isCoprime_zero_left.1 hrc)
  obtain ⟨a, b, hbe⟩ := hrc
  have ha0 : a ≠ 0 := by
    intro h0
    rw [h0] at hbe
    simp only [zero_mul, zero_add] at hbe
    exact hMnu ((isUnit_iff_exists_inv).2 ⟨b, by rw [mul_comm]; exact hbe⟩)
  have hfa : f * a - 1 ∈ Ideal.span {M} := by
    refine Ideal.mem_span_singleton.2 ⟨a * h - b, ?_⟩
    linear_combination a * hh + hbe
  have hra : r * a - 1 ∈ Ideal.span {M} := by
    refine Ideal.mem_span_singleton.2 ⟨-b, ?_⟩
    linear_combination hbe
  have key1 : χ.toFun (Ideal.span {f * a}) = 1 :=
    χ.map_span' (f * a) (mul_ne_zero hf0 ha0) hfa
  have key2 : χ.toFun (Ideal.span {r * a}) = 1 :=
    χ.map_span' (r * a) (mul_ne_zero hr0 ha0) hra
  have hsplit1 : χ.toFun (Ideal.span {f}) * χ.toFun (Ideal.span {a}) = 1 := by
    rw [← χ.map_mul', Ideal.span_singleton_mul_span_singleton]
    exact key1
  have hsplit2 : χ.toFun (Ideal.span {r}) * χ.toFun (Ideal.span {a}) = 1 := by
    rw [← χ.map_mul', Ideal.span_singleton_mul_span_singleton]
    exact key2
  have hane : χ.toFun (Ideal.span {a}) ≠ 0 := by
    intro h0
    rw [h0, mul_zero] at hsplit1
    exact zero_ne_one hsplit1
  exact mul_right_cancel₀ hane (by rw [hsplit1, hsplit2])

/-! ## Q4-a.4 — the residue-class decomposition -/

/-- Building a monic degree-`(d + e)` polynomial from a monic degree-`e` quotient
and a residue of degree `< d`. -/
theorem monic_mul_add_natDegree {M : Polynomial k} (hM : M.Monic)
    {g r : Polynomial k} (hg : g.Monic) (hr : r.natDegree < M.natDegree) :
    (M * g + r).Monic ∧ (M * g + r).natDegree = M.natDegree + g.natDegree := by
  have hMg0 : M * g ≠ 0 := mul_ne_zero hM.ne_zero hg.ne_zero
  have hdMg : (M * g).natDegree = M.natDegree + g.natDegree :=
    Polynomial.Monic.natDegree_mul' hM hg.ne_zero
  have hrdeg : r.degree < (M * g).degree := by
    rw [Polynomial.degree_eq_natDegree hMg0, hdMg]
    refine lt_of_le_of_lt Polynomial.degree_le_natDegree ?_
    exact_mod_cast hr.trans_le (Nat.le_add_right M.natDegree g.natDegree)
  have hadd : (M * g + r).natDegree = M.natDegree + g.natDegree := by
    refine natDegree_eq_of_degree_eq_some ?_
    have hsub : (M * g - -r).degree = (M * g).degree :=
      Polynomial.degree_sub_eq_left_of_degree_lt (by rwa [Polynomial.degree_neg])
    rw [sub_neg_eq_add] at hsub
    exact hsub.trans ((Polynomial.degree_eq_natDegree hMg0).trans (by rw [hdMg]))
  refine ⟨?_, hadd⟩
  show (M * g + r).coeff (M * g + r).natDegree = 1
  rw [hadd, coeff_add, coeff_eq_zero_of_natDegree_lt
    (hr.trans_le (Nat.le_add_right M.natDegree g.natDegree)), add_zero, ← hdMg]
  exact Polynomial.Monic.mul hM hg

/-- The canonical decomposition of a monic degree-`n` polynomial mod `M`
(`n ≥ d`): the quotient is monic of degree `n − d`, the residue has degree `< d`. -/
theorem canonical_divByMonic {M : Polynomial k} (hM : M.Monic) (hd1 : 1 ≤ M.natDegree)
    {f : Polynomial k} {n : ℕ} (hf : f.Monic) (hfn : f.natDegree = n)
    (hn : M.natDegree ≤ n) :
    (f /ₘ M).Monic ∧ (f /ₘ M).natDegree = n - M.natDegree ∧
      M * (f /ₘ M) + f %ₘ M = f ∧ (f %ₘ M).natDegree < M.natDegree := by
  have hrn : (f %ₘ M).natDegree < M.natDegree :=
    Polynomial.natDegree_modByMonic_lt f hM (fun h1 => by
      subst h1
      exact absurd hd1 (by simp))
  have hqe : (f /ₘ M).natDegree = n - M.natDegree := by
    rw [Polynomial.natDegree_divByMonic f hM, hfn]
  have hfeq : M * (f /ₘ M) + f %ₘ M = f := by
    linear_combination Polynomial.modByMonic_add_div f M
  have hf0 : f ≠ 0 := by
    intro h0
    rw [h0] at hfn
    simp at hfn
    omega
  have hne : f /ₘ M ≠ 0 := by
    intro h0
    rw [Polynomial.divByMonic_eq_zero_iff hM] at h0
    rw [Polynomial.degree_eq_natDegree hf0,
      Polynomial.degree_eq_natDegree hM.ne_zero, hfn] at h0
    have h9 : n < M.natDegree := by exact_mod_cast h0
    exact absurd hn (Nat.not_le.mpr h9)
  have hmg : (M * (f /ₘ M)).natDegree = n := by
    rw [Polynomial.Monic.natDegree_mul' hM hne, hqe]
    omega
  have hcoeff1 : (M * (f /ₘ M)).coeff n = 1 := by
    have hEq : M * (f /ₘ M) = f - f %ₘ M := by
      linear_combination Polynomial.modByMonic_add_div f M
    rw [hEq, coeff_sub]
    have hz : (f %ₘ M).coeff n = 0 := coeff_eq_zero_of_natDegree_lt (by omega)
    rw [hz, sub_zero]
    have h2 : f.coeff f.natDegree = 1 := hf
    rw [hfn] at h2
    exact h2
  refine ⟨?_, hqe, hfeq, hrn⟩
  have h1 : (M * (f /ₘ M)).leadingCoeff = 1 := by
    show (M * (f /ₘ M)).coeff (M * (f /ₘ M)).natDegree = 1
    rw [hmg, hcoeff1]
  have hlm : M.leadingCoeff = 1 := hM
  have hlg0 : (f /ₘ M).leadingCoeff ≠ 0 := Polynomial.leadingCoeff_ne_zero.2 hne
  rw [Polynomial.leadingCoeff_mul' (by rw [hlm]; simpa using hlg0), hlm] at h1
  have h3 : (f /ₘ M).leadingCoeff = 1 := by simpa only [one_mul] using h1
  exact h3

/-! ## Q4-a.5 — the level-`n` coefficient by residue classes -/

/-- **Q4-a core**: for `n ≥ d` the level-`n` coefficient of `heckeSeriesT χ` is
`q^{n−d} · S`, `S` the (constant) residue-class sum — each residue class
contributes its `q^{n−d}` monic multiples uniformly. -/
theorem sum_apply_span_eq_of_degree_le {M : Polynomial k} (hM : M.Monic)
    (hd1 : 1 ≤ M.natDegree) (χ : FFRayClassCharacter k (Ideal.span {M})) {n : ℕ}
    (hn : M.natDegree ≤ n) :
    ∑ f ∈ monicDegreeN k n, χ.toFun (Ideal.span {f})
      = ((Fintype.card k ^ (n - M.natDegree) : ℕ) : ℂ) *
        ∑ r ∈ resFinset M.natDegree, χ.toFun (Ideal.span {r}) := by
  classical
  -- pointwise congruence: only the residue class matters
  have hpt : ∀ p ∈ monicDegreeN k (n - M.natDegree) ×ˢ resFinset M.natDegree,
      χ.toFun (Ideal.span {M * p.1 + p.2}) = χ.toFun (Ideal.span {p.2}) := by
    intro p hp
    obtain ⟨hgs, hrs⟩ := Finset.mem_product.mp hp
    rw [mem_resFinset_iff hd1] at hrs
    by_cases hc : IsCoprime p.2 M
    · exact apply_span_singleton_congr_of_dvd_sub hM hd1 χ ⟨p.1, by ring⟩ hc
    · rw [apply_span_singleton_eq_zero_of_not_isCoprime hM hd1 χ
          (fun hfc => hc ((isCoprime_congr_of_dvd_sub (⟨p.1, by ring⟩ :
            M ∣ M * p.1 + p.2 - p.2)).1 hfc)),
        apply_span_singleton_eq_zero_of_not_isCoprime hM hd1 χ hc]
  -- the built point is monic of degree n
  have hbuild : ∀ p ∈ monicDegreeN k (n - M.natDegree) ×ˢ resFinset M.natDegree,
      M * p.1 + p.2 ∈ monicDegreeN k n := by
    intro p hp
    obtain ⟨hgs, hrs⟩ := Finset.mem_product.mp hp
    rw [mem_monicDegreeN_iff] at hgs ⊢
    obtain ⟨hg1, hg2⟩ := hgs
    rw [mem_resFinset_iff hd1] at hrs
    exact ⟨(monic_mul_add_natDegree hM hg1 hrs).1,
      by rw [(monic_mul_add_natDegree hM hg1 hrs).2, hg2]; omega⟩
  -- the decomposed point lands in the product finset
  have hdecomp : ∀ f ∈ monicDegreeN k n,
      (f /ₘ M, f %ₘ M) ∈ monicDegreeN k (n - M.natDegree) ×ˢ resFinset M.natDegree := by
    intro f hf
    rw [mem_monicDegreeN_iff] at hf
    obtain ⟨hqm, hqe, hfeq, hrn⟩ := canonical_divByMonic hM hd1 hf.1 hf.2 hn
    rw [Finset.mem_product, mem_monicDegreeN_iff, mem_resFinset_iff hd1]
    exact ⟨⟨hqm, hqe⟩, hrn⟩
  -- the bijection on sums (build ↔ canonical decomposition)
  rw [Finset.sum_nbij'
      (f := fun f : Polynomial k => χ.toFun (Ideal.span {f}))
      (g := fun p : Polynomial k × Polynomial k =>
        χ.toFun (Ideal.span {M * p.1 + p.2}))
      (fun f : Polynomial k => (f /ₘ M, f %ₘ M))
      (fun p : Polynomial k × Polynomial k => M * p.1 + p.2)
      hdecomp hbuild
      (fun f _ => by
        show M * (f /ₘ M) + f %ₘ M = f
        linear_combination Polynomial.modByMonic_add_div f M)
      (fun p hp => by
        obtain ⟨hgs, hrs⟩ := Finset.mem_product.mp hp
        rw [mem_resFinset_iff hd1] at hrs
        have hu := Polynomial.div_modByMonic_unique
          (f := M * p.1 + p.2) (g := M) p.1 p.2 hM ⟨by ring, by
            refine lt_of_le_of_lt Polynomial.degree_le_natDegree ?_
            rw [Polynomial.degree_eq_natDegree hM.ne_zero]
            exact_mod_cast hrs⟩
        show ((M * p.1 + p.2) /ₘ M, (M * p.1 + p.2) %ₘ M) = p
        exact Prod.ext_iff.2 ⟨hu.1, hu.2⟩)
      (fun f _ => by
        show χ.toFun (Ideal.span {f})
          = χ.toFun (Ideal.span {M * (f /ₘ M) + f %ₘ M})
        rw [show M * (f /ₘ M) + f %ₘ M = f from by
          linear_combination Polynomial.modByMonic_add_div f M])]
  rw [Finset.sum_congr rfl (fun p hp => hpt p hp)]
  -- flatten the product sum to the constant inner sum
  have hflat : ∑ p ∈ monicDegreeN k (n - M.natDegree) ×ˢ resFinset M.natDegree,
      χ.toFun (Ideal.span {p.2})
      = ∑ r ∈ resFinset M.natDegree,
          ∑ g ∈ monicDegreeN k (n - M.natDegree), χ.toFun (Ideal.span {r}) := by
    rw [Finset.sum_product, Finset.sum_comm]
  rw [hflat, Finset.sum_congr rfl (fun r _ => finset_sum_const_eq _ _),
    ← Finset.mul_sum, card_monicDegreeN]

theorem coeff_heckeSeriesT {m : Ideal (Polynomial k)} (χ : FFRayClassCharacter k m)
    (n : ℕ) :
    PowerSeries.coeff n (heckeSeriesT χ)
      = ∑ f ∈ monicDegreeN k n, χ.toFun (Ideal.span {f}) := by
  simp only [heckeSeriesT, PowerSeries.coeff_mk]

/-! ## Q4-b — geometric-series assembly (the `1 − qT` denominator) -/

/-- Coefficients of `L · (1 − qT)` as a power series: `L_n − q · L_{n−1}`. -/
private theorem coeff_mul_one_sub_X (L : PowerSeries ℂ) (qz : ℂ) :
    ∀ n : ℕ, PowerSeries.coeff n
        (L * ((1 - C qz * X : Polynomial ℂ) : PowerSeries ℂ))
      = PowerSeries.coeff n L
        - qz * (if n = 0 then 0 else PowerSeries.coeff (n - 1) L) := by
  intro n
  rw [Polynomial.coe_sub, Polynomial.coe_one, Polynomial.coe_mul,
    Polynomial.coe_C, Polynomial.coe_X, mul_sub, mul_one, ← mul_assoc,
    mul_comm L (PowerSeries.C qz), map_sub (PowerSeries.coeff n), mul_assoc,
    PowerSeries.coeff_C_mul]
  rcases n with _ | m
  · rw [PowerSeries.coeff_zero_mul_X]
    simp
  · rw [if_neg (by omega : ¬ m + 1 = 0), Nat.succ_sub_one,
      PowerSeries.coeff_succ_mul_X]

/-- Coefficients of the truncated polynomial witness `P₁`. -/
private theorem coeff_trunc (c : ℕ → ℂ) (d m : ℕ) :
    (∑ i ∈ Finset.range (d + 1), C (c i) * X ^ i).coeff m
      = if m ≤ d then c m else 0 := by
  by_cases hmd : m ≤ d
  · rw [if_pos hmd, poly_coeff_finset_sum]
    refine (Finset.sum_eq_single m ?_ ?_).trans ?_
    · intro b hb hne
      rw [coeff_C_mul, coeff_X_pow, if_neg (Ne.symm hne), mul_zero]
    · intro h0
      exact absurd (Finset.mem_range.2 (by omega)) h0
    · rw [coeff_C_mul, coeff_X_pow, if_pos rfl, mul_one]
  · rw [if_neg hmd, poly_coeff_finset_sum]
    refine Finset.sum_eq_zero fun b hb => ?_
    have hne : b ≠ m := fun hcon =>
      hmd (hcon ▸ (Nat.lt_succ_iff.mp (Finset.mem_range.mp hb)))
    rw [coeff_C_mul, coeff_X_pow, if_neg (Ne.symm hne), mul_zero]

/-- **(C1) rationality by periodicity — the hRat discharge (M0)**: every
𝔽_q[T] ray-class character of modulus `span M` (`M` monic, `1 ≤ deg M`) has Hecke
series rational of shape `P₁ / (1 − qT)` with `P₁` of degree `≤ deg M` and
`P₀.eval 0 = 1 ≠ 0` — the hRat witness produced explicitly by residue-class
periodicity (Rosen GTM 210 ch. 8, PROVISIONAL pin per the gate memo §4). `hPur`
is NOT touched here (stays a binder per the §3 fence). -/
theorem heckeSeriesT_rational_of_periodicity {M : Polynomial k} (hM : M.Monic)
    (hd1 : 1 ≤ M.natDegree) (χ : FFRayClassCharacter k (Ideal.span {M})) :
    ∃ P₀ P₁ : Polynomial ℂ, P₀.eval 0 ≠ 0 ∧
      heckeSeriesT χ * ((P₀ : PowerSeries ℂ)) = ((P₁ : PowerSeries ℂ)) := by
  classical
  refine ⟨1 - C (((Fintype.card k : ℕ) : ℂ)) * X,
    ∑ i ∈ Finset.range (M.natDegree + 1),
      C (PowerSeries.coeff i (heckeSeriesT χ *
        ((1 - C (((Fintype.card k : ℕ) : ℂ)) * X : Polynomial ℂ) : PowerSeries ℂ)))
      * X ^ i, ?_, ?_⟩
  · simp
  · refine PowerSeries.ext fun n => ?_
    rcases Nat.lt_or_ge n (M.natDegree + 1) with hlt | hge
    · rw [Polynomial.coeff_coe, coeff_trunc, if_pos (by omega : n ≤ M.natDegree)]
    · rw [Polynomial.coeff_coe, coeff_trunc, if_neg (by omega : ¬ n ≤ M.natDegree)]
      rw [coeff_mul_one_sub_X, if_neg (by omega : ¬ n = 0),
        coeff_heckeSeriesT χ n, coeff_heckeSeriesT χ (n - 1),
        sum_apply_span_eq_of_degree_le hM hd1 χ (by omega),
        sum_apply_span_eq_of_degree_le hM hd1 χ (n := n - 1) (by omega)]
      have hexp : n - M.natDegree = (n - 1 - M.natDegree) + 1 := by omega
      have hcast : (((Fintype.card k ^ (n - M.natDegree) : ℕ) : ℂ))
          = (((Fintype.card k : ℕ) : ℂ)) *
            (((Fintype.card k ^ (n - 1 - M.natDegree) : ℕ) : ℂ)) := by
        rw [hexp, pow_succ, Nat.cast_mul]
        ring
      rw [hcast]
      ring

/-! ## Q4-c — (P)(i) unconditional for the probe class -/

/-- **(P)(i) unconditional for the 𝔽_q(T) probe class**: C.lean's GREEN
`hecke_continuation` with the rationality witness PRODUCED (not assumed) — the
`hRat` binder of C.lean's Tier-C statement is discharged at the probe class by
`heckeSeriesT_rational_of_periodicity`, so the meromorphic-continuation clause of
(P)(i) is unconditional here (first formal Tate-type statement with discharged
rationality, FF scope). `hPur` STAYS a binder (gate memo §3; the §2.4 honesty
correction — it is the RH for the Kummer covers). -/
theorem hecke_continuation_unconditional {M : Polynomial k} (hM : M.Monic)
    (hd1 : 1 ≤ M.natDegree) (χ : FFRayClassCharacter k (Ideal.span {M})) (q : ℕ) :
    ∃ P₀ P₁ : Polynomial ℂ, ∃ f : ℂ → ℂ,
      P₀.eval 0 ≠ 0 ∧ heckeSeriesT χ * ((P₀ : PowerSeries ℂ)) = ((P₁ : PowerSeries ℂ)) ∧
      (∀ z : ℂ, P₀.eval (wOf q z) ≠ 0 → DifferentiableAt ℂ f z) ∧
      (∀ s : ℂ, f s = P₁.eval (wOf q s) / P₀.eval (wOf q s)) := by
  obtain ⟨P₀, P₁, h0, hRat⟩ := heckeSeriesT_rational_of_periodicity hM hd1 χ
  obtain ⟨f, hd, he⟩ := hecke_continuation χ q P₀ P₁ hRat
  exact ⟨P₀, P₁, f, h0, hRat, hd, he⟩

/-! ## Axiom audit (full coverage: every theorem of this file) -/

#print axioms poly_coeff_finset_sum
#print axioms finset_sum_const_eq
#print axioms coeff_sum_monomial_eq
#print axioms coeff_sum_monomial_eq_zero
#print axioms coeff_monic_param
#print axioms mem_monicDegreeN_iff
#print axioms card_monicDegreeN
#print axioms natDegree_psiVec_lt
#print axioms eq_psiVec_of_lt
#print axioms mem_resFinset_iff
#print axioms isCoprime_congr_of_dvd_sub
#print axioms not_isUnit_of_one_le_natDegree
#print axioms span_sup_span_eq_top_iff
#print axioms apply_span_singleton_eq_zero_of_not_isCoprime
#print axioms apply_span_singleton_congr_of_dvd_sub
#print axioms monic_mul_add_natDegree
#print axioms canonical_divByMonic
#print axioms sum_apply_span_eq_of_degree_le
#print axioms coeff_heckeSeriesT
#print axioms coeff_mul_one_sub_X
#print axioms coeff_trunc
#print axioms heckeSeriesT_rational_of_periodicity
#print axioms hecke_continuation_unconditional

end Q4

end Pilot73
