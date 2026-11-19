/-
Pilot 75-N2 P2-c — the hEχ port, PRIMITIVE CORE (unit 8, 2026-11-19).

CHARTER: R6 unit-8 ruling — the P2-c primitive core authorized (per N2-P3-plan.md's
binder table: needs only P2-a GREEN + the hUnb binder; the imprimitive composition
needs the parked P2-b confirmation and stays parked-side). Budget ≤3 runs.

CONTENT: `thmE_dyadic_to_cumulative` discharges the P0-staged `ThmEDyadicToCumulative`
at the primitive level — the hEχ slot the P3-e assembly consumes per family member.
Decomposition (dossier §Proof-strategy step 5):
  (1) count identification: zeta23's `NcountL` (finsum over `zerosInL`) = the stack's
      dyadic `ZeroMult.count` — via supp(zero-mult) = zeroSet for the entire
      L-function (`multOf_supp_iff`; the flat-zero ⊤ case excluded by the
      run-30-triad `lFunction_not_eventually_zero`);
  (2) distinct→with-multiplicity dominance: `N0starL` ≤ `ZeroMult.countOn`;
  (3) the dyadic `EpsLower` from the donor binder `ThmEDyadic`;
  (4) the dyadic→cumulative bridge `epsLowerCum_of_epsLower`: window splits, the
      doubling chain (the plan's K-indexed block family), the minimal-K archimedean
      choice, per-block donor bounds summed, the tail absorbed against `hUnb` (the
      classical zero-infinitude binder, named — Titchmarsh §5.8/Davenport ch. 9).

HYGIENE: proof artifact — 0 sorry; #print axioms at file end. Substrate: plain (the
run_n2p3 runner pattern; this file staged as N2P2c.lean — `import N2-P2c` is not a
legal module path; N2-P1.lean stays frozen at the parked P2-b sha 396d8710…).
-/
import Mathlib
import N2P1

namespace CrossMath.Pilot75N2

open Set Finset Filter
open scoped NumberField Classical Topology

open CrossMath.Pilot75

/-! ### (1) The count identification -/

/-- For a nontrivial character's L-function (entire, nowhere flat-zero by the
run-30-triad helper), `multOf ≠ 0` ↔ `value = 0` — the supp/zeroSet identification
equating zeta23's `zerosInL` windows with the stack's strip windows. -/
theorem multOf_supp_iff {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} (hχ : χ ≠ 1)
    (ρ : ℂ) : multOf χ.LFunction ρ ≠ 0 ↔ χ.LFunction ρ = 0 := by
  constructor
  · exact apply_eq_zero_of_analyticOrderNatAt_ne_zero
  · intro hzero
    by_contra h0
    have hA : AnalyticAt ℂ χ.LFunction ρ :=
      (DirichletCharacter.differentiable_LFunction hχ).differentiableOn.analyticAt
        (isOpen_univ.mem_nhds (mem_univ ρ))
    have h1 : analyticOrderAt χ.LFunction ρ ≠ 0 :=
      (hA.analyticOrderAt_ne_zero).mpr hzero
    rw [multOf, analyticOrderNatAt] at h0
    rcases ENat.toNat_eq_zero.mp h0 with h | h
    · exact h1 h
    · exact lFunction_not_eventually_zero hχ ρ (analyticOrderAt_eq_top.mp h)

/-- **Count identification**: the stack's dyadic with-multiplicity count equals
zeta23's `NcountL` on the same window. -/
theorem count_eq_ncountL {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} (hχ : χ ≠ 1)
    (hfin : WindowFinite (multOf χ.LFunction)) (T : ℝ) :
    (⟨multOf χ.LFunction, hfin⟩ : ZeroMult).count T = NcountL χ T (2 * T) := by
  have hset : zerosInL χ T (2 * T)
      = supp (multOf χ.LFunction) ∩ stripWindow T (2 * T) := by
    ext ρ
    simp only [zerosInL, IsNontrivialZeroL, stripWindow, Set.mem_setOf_eq,
      Set.mem_inter_iff, supp, multOf_supp_iff hχ]
    tauto
  unfold ZeroMult.count NcountL
  rw [hset, finsum_mem_eq_finite_toFinset_sum _ (hfin T (2 * T))]
  rfl

/-! ### (2) Distinct→with-multiplicity dominance -/

/-- `N0starL` (distinct on-line zeros, ncard) ≤ the with-multiplicity on-line dyadic
count: pointwise `1 ≤ multOf` on the support, summed over the subset. -/
theorem n0star_le_countOn {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N} (hχ : χ ≠ 1)
    (hfin : WindowFinite (multOf χ.LFunction)) (T : ℝ) :
    N0starL χ T (2 * T) ≤ (⟨multOf χ.LFunction, hfin⟩ : ZeroMult).countOn T := by
  have hsub : zerosInL χ T (2 * T) ∩ {ρ | ρ.re = 1 / 2}
      ⊆ supp (multOf χ.LFunction) ∩ lineWindow T (2 * T) := by
    intro ρ hρ
    have hz : IsNontrivialZeroL χ ρ := hρ.1.1
    simp only [IsNontrivialZeroL] at hz
    have hm : multOf χ.LFunction ρ ≠ 0 := (multOf_supp_iff hχ ρ).mpr hz.1
    exact ⟨hm, hρ.2, hρ.1.2.1, hρ.1.2.2⟩
  have hf : (zerosInL χ T (2 * T) ∩ {ρ | ρ.re = 1 / 2}).Finite :=
    (lineFinite hfin T).subset hsub
  have hfinsub : hf.toFinset ⊆ (lineFinite hfin T).toFinset := by
    intro ρ hρ
    simp only [Set.Finite.mem_toFinset] at hρ ⊢
    exact hsub hρ
  calc N0starL χ T (2 * T)
      = (zerosInL χ T (2 * T) ∩ {ρ | ρ.re = 1 / 2}).ncard := rfl
    _ = hf.toFinset.card := Set.ncard_eq_toFinset_card _ hf
    _ ≤ ∑ ρ ∈ hf.toFinset, multOf χ.LFunction ρ := by
        rw [Finset.card_eq_sum_ones]
        refine Finset.sum_le_sum fun ρ hρ => Nat.one_le_iff_ne_zero.mpr ?_
        have hmem := (Set.Finite.mem_toFinset hf).mp hρ
        have hz : IsNontrivialZeroL χ ρ := hmem.1.1
        simp only [IsNontrivialZeroL] at hz
        exact (multOf_supp_iff hχ ρ).mpr hz.1
    _ ≤ ∑ ρ ∈ (lineFinite hfin T).toFinset, multOf χ.LFunction ρ :=
        Finset.sum_le_sum_of_subset hfinsub

/-! ### (4a) Window splits and monotonicity -/

/-- Cumulative-window split at `0 ≤ T₁ ≤ T₂` (the im-interval decomposition; the two
sub-windows are disjoint by the strict left edge). -/
theorem countCum_split (z : ZeroMult) {T₁ T₂ : ℝ} (h0 : 0 ≤ T₁) (h : T₁ ≤ T₂) :
    z.countCum T₂ = z.countCum T₁
      + ∑ ρ ∈ (z.windowFinite T₁ T₂).toFinset, z.mult ρ := by
  have hset : supp z.mult ∩ stripWindow 0 T₂
      = (supp z.mult ∩ stripWindow 0 T₁) ∪ (supp z.mult ∩ stripWindow T₁ T₂) := by
    ext ρ
    simp only [stripWindow, Set.mem_inter_iff, Set.mem_setOf_eq, Set.mem_union]
    constructor
    · rintro ⟨hs, hre1, hre2, him1, him2⟩
      rcases le_or_gt ρ.im T₁ with hle | hlt
      · exact Or.inl ⟨hs, hre1, hre2, him1, hle⟩
      · exact Or.inr ⟨hs, hre1, hre2, hlt, him2⟩
    · rintro (⟨hs, hre1, hre2, him1, him2⟩ | ⟨hs, hre1, hre2, him1, him2⟩)
      · exact ⟨hs, hre1, hre2, him1, him2.trans h⟩
      · exact ⟨hs, hre1, hre2, lt_of_le_of_lt h0 him1, him2⟩
  have hdisj : (supp z.mult ∩ stripWindow 0 T₁) ∩ (supp z.mult ∩ stripWindow T₁ T₂)
      = ∅ := by
    ext ρ
    simp only [stripWindow, Set.mem_inter_iff, Set.mem_setOf_eq, Set.mem_empty_iff_false,
      not_and]
    rintro ⟨⟨-, -, -, him2⟩, ⟨-, -, -, him1⟩⟩
    exact absurd him1 (not_lt.mpr him2)
  have hfA : (supp z.mult ∩ stripWindow 0 T₁).Finite := z.windowFinite 0 T₁
  have hfB : (supp z.mult ∩ stripWindow T₁ T₂).Finite := z.windowFinite T₁ T₂
  have hfinU : (supp z.mult ∩ stripWindow 0 T₂).Finite := z.windowFinite 0 T₂
  rw [hset] at hfinU
  have hfu : hfinU.toFinset = hfA.toFinset ∪ hfB.toFinset := by
    ext ρ
    simp [hset]
  have hdisjF : Disjoint hfA.toFinset hfB.toFinset :=
    Finset.disjoint_iff_ne.mpr fun a ha b hb hab => by
      subst hab
      simp only [Set.Finite.mem_toFinset] at ha hb
      exact absurd hb.2.2.2.1 (not_lt.mpr ha.2.2.2.2)
  unfold ZeroMult.countCum
  rw [hfu, Finset.sum_union hdisjF]

/-- Cumulative counts are monotone. -/
theorem countCum_mono (z : ZeroMult) {S T : ℝ} (h : S ≤ T) :
    z.countCum S ≤ z.countCum T := by
  rcases le_or_gt 0 S with h0 | h0
  · have hsplit := countCum_split z h0 h
    omega
  · have hempty : z.countCum S = 0 := by
      unfold ZeroMult.countCum
      refine Finset.sum_eq_zero fun ρ hρ => ?_
      have hmem : ρ ∈ supp z.mult ∩ stripWindow 0 S := by
        simpa using hρ
      simp only [Set.mem_inter_iff, stripWindow, Set.mem_setOf_eq] at hmem
      exact absurd hmem.2.2.2.1
        (not_lt.mpr (le_trans hmem.2.2.2.2 (le_of_lt h0)))
    omega

/-- The doubling form of the split (the chain's step). -/
theorem countCum_split' (z : ZeroMult) {S : ℝ} (hS : 0 < S) :
    z.countCum (2 * S) = z.countCum S + z.count S := by
  have h2S : S ≤ 2 * S := by nlinarith
  rw [countCum_split z hS.le h2S]
  unfold ZeroMult.count

/-- The on-line doubling split (the on-chain's step). -/
theorem countOnCum_split' (z : ZeroMult) {S : ℝ} (hS : 0 < S) :
    z.countOnCum (2 * S) = z.countOnCum S + z.countOn S := by
  have hset : supp z.mult ∩ lineWindow 0 (2 * S)
      = (supp z.mult ∩ lineWindow 0 S) ∪ (supp z.mult ∩ lineWindow S (2 * S)) := by
    ext ρ
    simp only [lineWindow, Set.mem_inter_iff, Set.mem_setOf_eq, Set.mem_union]
    constructor
    · rintro ⟨hs, hre, him1, him2⟩
      rcases le_or_gt ρ.im S with hle | hlt
      · exact Or.inl ⟨hs, hre, him1, hle⟩
      · exact Or.inr ⟨hs, hre, hlt, him2⟩
    · rintro (⟨hs, hre, him1, him2⟩ | ⟨hs, hre, him1, him2⟩)
      · refine ⟨hs, hre, him1, le_trans him2 ?_⟩
        nlinarith
      · exact ⟨hs, hre, hS.trans him1, him2⟩
  have hdisj : (supp z.mult ∩ lineWindow 0 S) ∩ (supp z.mult ∩ lineWindow S (2 * S))
      = ∅ := by
    ext ρ
    constructor
    · intro hρ
      simp only [Set.mem_inter_iff, lineWindow, Set.mem_setOf_eq] at hρ
      exact absurd hρ.2.2.2.1 (not_lt.mpr hρ.1.2.2.2)
    · intro hρ
      exact absurd hρ (by simp)
  have hfA : (supp z.mult ∩ lineWindow 0 S).Finite := lineFiniteCum z.windowFinite S
  have hfB : (supp z.mult ∩ lineWindow S (2 * S)).Finite := lineFinite z.windowFinite S
  have hfinU : (supp z.mult ∩ lineWindow 0 (2 * S)).Finite :=
    lineFiniteCum z.windowFinite (2 * S)
  rw [hset] at hfinU
  have hfu : hfinU.toFinset = hfA.toFinset ∪ hfB.toFinset := by
    ext ρ
    simp [hset]
  have hdisjF : Disjoint hfA.toFinset hfB.toFinset :=
    Finset.disjoint_iff_ne.mpr fun a ha b hb hab => by
      subst hab
      simp only [Set.Finite.mem_toFinset] at ha hb
      exact absurd hb.2.2.1 (not_lt.mpr ha.2.2.2)
  unfold ZeroMult.countOnCum ZeroMult.countOn
  rw [hfu, Finset.sum_union hdisjF]

/-! ### (4b) The doubling chains (the block family) -/

theorem countCum_chain (z : ZeroMult) {T : ℝ} (hT : 0 < T) (K : ℕ) :
    z.countCum T
      = z.countCum (T / 2 ^ K) + ∑ j ∈ Finset.range K, z.count (T / 2 ^ (j + 1)) := by
  induction K generalizing T with
  | zero => simp
  | succ K ih =>
    have hpp : (0:ℝ) < 2 ^ (K + 1) := pow_pos two_pos _
    have hS : (0:ℝ) < T / 2 ^ (K + 1) := div_pos hT hpp
    have hrw : 2 * (T / 2 ^ (K + 1)) = T / 2 ^ K := by
      field_simp [pow_succ]
      ring
    have hs := countCum_split' z hS
    rw [hrw] at hs
    have ih' := ih hT
    rw [ih', hs, Finset.sum_range_succ]
    omega

theorem countOnCum_chain (z : ZeroMult) {T : ℝ} (hT : 0 < T) (K : ℕ) :
    z.countOnCum T
      = z.countOnCum (T / 2 ^ K) + ∑ j ∈ Finset.range K, z.countOn (T / 2 ^ (j + 1)) := by
  induction K generalizing T with
  | zero => simp
  | succ K ih =>
    have hpp : (0:ℝ) < 2 ^ (K + 1) := pow_pos two_pos _
    have hS : (0:ℝ) < T / 2 ^ (K + 1) := div_pos hT hpp
    have hrw : 2 * (T / 2 ^ (K + 1)) = T / 2 ^ K := by
      field_simp [pow_succ]
      ring
    have hs := countOnCum_split' z hS
    rw [hrw] at hs
    have ih' := ih hT
    rw [ih', hs, Finset.sum_range_succ]
    omega

/-! ### (4c) The dyadic→cumulative bridge -/

/-- **The bridge**: a dyadic-block `EpsLower` plus unbounded cumulative counts give
the cumulative `EpsLowerCum` (the donor bounds summed over the doubling chain's
blocks, all above threshold by the minimal-K choice; the sub-threshold tail
absorbed against the unboundedness). -/
theorem epsLowerCum_of_epsLower {z : ZeroMult} {c : ℝ}
    (hdyad : EpsLower z c)
    (hUnb : Filter.Tendsto (fun T => (z.countCum T : ℝ)) atTop atTop) :
    EpsLowerCum z c := by
  intro ε hε
  obtain ⟨T₁, hT₁⟩ := hdyad (ε / 2) (by positivity)
  have hT₀pos : (0:ℝ) < max T₁ 1 := lt_of_lt_of_le zero_lt_one (le_max_right T₁ 1)
  have hT₀le : T₁ ≤ max T₁ 1 := le_max_left T₁ 1
  set T₀d := max T₁ 1 with hT₀def
  set M₀ := |c - ε / 2| + 1 with hM₀def
  set N₀ := z.countCum (2 * T₀d) with hN₀def
  have hMpos : (0:ℝ) < M₀ := by rw [hM₀def]; positivity
  have hNnn : (0:ℝ) ≤ M₀ * N₀ := by positivity
  have hE : ∀ᶠ y in atTop, M₀ * N₀ / (ε / 2) < y :=
    eventually_atTop.mpr ⟨M₀ * N₀ / (ε / 2), fun y hy => hy⟩
  obtain ⟨T₂, hT₂⟩ := eventually_atTop.mp (hUnb.eventually hE)
  refine ⟨max (2 * T₀d) T₂, fun T hT => ?_⟩
  have hT₀d : T₀d < T := by
    have h2 := le_trans (le_max_left (2 * T₀d) T₂) hT
    nlinarith
  have hTpos : (0:ℝ) < T := lt_trans hT₀pos hT₀d
  have hex : ∃ k : ℕ, T ≤ T₀d * 2 ^ k := by
    have hkey : ∀ m : ℕ, ((m : ℝ) + 1) ≤ 2 ^ (m + 1) := by
      intro m
      induction m with
      | zero => norm_num
      | succ k ih => rw [pow_succ]; linarith [ih, Nat.cast_nonneg (α := ℝ) k]
    obtain ⟨n, hn⟩ := exists_nat_gt (T / T₀d)
    refine ⟨n + 1, ?_⟩
    rw [div_lt_iff₀ hT₀pos] at hn
    have hle := hkey n
    nlinarith [hn, hle, hT₀pos]
  obtain ⟨K, hKspec, hKeq⟩ : ∃ K, T ≤ T₀d * 2 ^ K ∧ Nat.find hex = K :=
    ⟨Nat.find hex, Nat.find_spec hex, rfl⟩
  rcases K with
  | zero =>
    exfalso
    rw [pow_zero, mul_one] at hKspec
    exact absurd hKspec (not_le.mpr hT₀d)
  | succ K' =>
  have hKmin : ¬(T ≤ T₀d * 2 ^ K') :=
    fun hle => absurd (Nat.find_le hle)
      (by rw [hKeq]; omega)
  have hKlow : T₀d * 2 ^ K' < T := not_le.mp hKmin
  have hp2K : (0:ℝ) < 2 ^ K' := pow_pos two_pos _
  have hlowdiv : T₀d < T / 2 ^ K' := by
    rw [lt_div_iff₀ hp2K]
    exact hKlow
  have hchain := countCum_chain z hTpos K'
  have hchainOn := countOnCum_chain z hTpos K'
  have hremle : T / 2 ^ K' ≤ 2 * T₀d := by
    rw [pow_succ] at hKspec
    field_simp
    nlinarith
  have hrem : z.countCum (T / 2 ^ K') ≤ N₀ := by
    rw [hN₀def]
    exact countCum_mono z hremle
  have hblock (j : ℕ) (hj : j < K') : T₁ ≤ T / 2 ^ (j + 1) := by
    have hpow : ((2:ℝ) ^ (j + 1)) ≤ ((2:ℝ) ^ K') := by
      exact_mod_cast Nat.pow_le_pow_right (by omega : (1:ℕ) ≤ 2) (by omega : j + 1 ≤ K')
    have hdivge : T / 2 ^ K' ≤ T / 2 ^ (j + 1) := by
      field_simp
      nlinarith [hpow, hTpos, pow_pos two_pos (j + 1)]
    exact le_trans (le_trans hT₀le (le_of_lt hlowdiv)) hdivge
  have hsumb : ∀ j ∈ Finset.range K', (c - ε / 2) * ((z.count (T / 2 ^ (j + 1)) : ℝ))
      ≤ (z.countOn (T / 2 ^ (j + 1)) : ℝ) :=
    fun j hj => hT₁ _ (hblock j (Finset.mem_range.mp hj))
  have hsum : (c - ε / 2) * (∑ j ∈ Finset.range K', (z.count (T / 2 ^ (j + 1)) : ℝ))
      ≤ ∑ j ∈ Finset.range K', (z.countOn (T / 2 ^ (j + 1)) : ℝ) := by
    rw [Finset.mul_sum]
    exact Finset.sum_le_sum fun j hj => hsumb j hj
  have honsum : (∑ j ∈ Finset.range K', (z.countOn (T / 2 ^ (j + 1)) : ℝ))
      ≤ (z.countOnCum T : ℝ) := by
    rw [hchainOn]
    have h0 : (0:ℝ) ≤ (z.countOnCum (T / 2 ^ K') : ℝ) := by positivity
    push_cast
    linarith
  have hcum : (z.countCum T : ℝ)
      = (z.countCum (T / 2 ^ K') : ℝ)
        + ∑ j ∈ Finset.range K', (z.count (T / 2 ^ (j + 1)) : ℝ) := by
    have := hchain
    push_cast
    exact this
  have hB : (c - ε / 2) * ((z.countCum (T / 2 ^ K') : ℝ)) ≤ M₀ * N₀ := by
    have hX : (z.countCum (T / 2 ^ K') : ℝ) ≤ (N₀ : ℝ) := by exact_mod_cast hrem
    rcases le_or_gt 0 (c - ε / 2) with hpos | hneg
    · have h1 : (c - ε / 2) * ((z.countCum (T / 2 ^ K') : ℝ))
          ≤ (c - ε / 2) * (N₀ : ℝ) :=
        mul_le_mul_of_nonneg_left hX hpos
      have h2 : (c - ε / 2) * (N₀ : ℝ) ≤ M₀ * N₀ := by
        rw [hM₀def]
        nlinarith [abs_le (c - ε / 2), abs_nonneg (c - ε / 2), hpos]
      exact le_trans h1 h2
    · have h1 : (c - ε / 2) * ((z.countCum (T / 2 ^ K') : ℝ)) ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg hneg (by positivity)
      exact le_trans h1 (by positivity)
  have habs : M₀ * N₀ ≤ (ε / 2) * ((z.countCum T : ℝ)) := by
    have h3 := hT₂ T (le_trans (le_max_right (2 * T₀d) T₂) hT)
    rw [div_lt_iff₀ (by positivity : (0:ℝ) < ε / 2)] at h3
    linarith
  have hsplit : (c - ε / 2) * ((z.countCum T : ℝ))
      = (c - ε / 2) * ((z.countCum (T / 2 ^ K') : ℝ))
        + (c - ε / 2) * (∑ j ∈ Finset.range K', (z.count (T / 2 ^ (j + 1)) : ℝ)) := by
    rw [← Finset.mul_sum, ← hcum]
    ring
  rw [hsplit]
  linarith [hsum, honsum, hB, habs]

/-! ### (5) The composed port theorem -/

/-- **P2-c primitive core**: the P0-staged `ThmEDyadicToCumulative` discharged at
the primitive level — the donor's dyadic distinct-numerator 2/3 bound + the classical
unboundedness binder give the engine's cumulative with-multiplicity `EpsLowerCum` at
2/3. (The imprimitive composition with `HasEulerStripImmunity` is the parked P2-b
side.) -/
theorem thmE_dyadic_to_cumulative {N : ℕ} [NeZero N] {χ : DirichletCharacter ℂ N}
    (hχ : χ ≠ 1) (hq : 1 < N) (hprim : χ.IsPrimitive)
    (hfin : WindowFinite (multOf χ.LFunction))
    (hUnb : CountsUnbounded χ hfin) (hE : ThmEDyadic χ) :
    EpsLowerCum ⟨multOf χ.LFunction, hfin⟩ (2 / 3) := by
  have hdyad : EpsLower ⟨multOf χ.LFunction, hfin⟩ (2 / 3) := by
    intro ε hε
    obtain ⟨T₀, hT₀⟩ := hE hq hprim ε hε
    refine ⟨T₀, fun T hT => ?_⟩
    have hc := hT₀ T hT
    have h2c : ((⟨multOf χ.LFunction, hfin⟩ : ZeroMult).count T : ℝ)
        = (NcountL χ T (2 * T) : ℝ) := by
      exact_mod_cast count_eq_ncountL hχ hfin T
    rw [← h2c] at hc
    have h3c : (N0starL χ T (2 * T) : ℝ)
        ≤ ((⟨multOf χ.LFunction, hfin⟩ : ZeroMult).countOn T : ℝ) := by
      exact_mod_cast n0star_le_countOn hχ hfin T
    exact hc.trans h3c
  exact epsLowerCum_of_epsLower hdyad hUnb

end CrossMath.Pilot75N2

-- audit (expect triad only, 0 sorryAx)
#print axioms CrossMath.Pilot75N2.multOf_supp_iff
#print axioms CrossMath.Pilot75N2.count_eq_ncountL
#print axioms CrossMath.Pilot75N2.n0star_le_countOn
#print axioms CrossMath.Pilot75N2.countCum_split
#print axioms CrossMath.Pilot75N2.countCum_mono
#print axioms CrossMath.Pilot75N2.countCum_split'
#print axioms CrossMath.Pilot75N2.countOnCum_split'
#print axioms CrossMath.Pilot75N2.countCum_chain
#print axioms CrossMath.Pilot75N2.countOnCum_chain
#print axioms CrossMath.Pilot75N2.epsLowerCum_of_epsLower
#print axioms CrossMath.Pilot75N2.thmE_dyadic_to_cumulative
