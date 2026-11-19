/-
Pilot 74-P2 (the G2/G3 landing) — sharp constants + the G3 family probe, per
`research/pilots/74/P2-precharter.md` (A8, 2026-11-18) under the iteration-5 charter's
debt rung (74-P2 recharter to R3, orchestrator 2026-11-19, DAY-1-CLASS, hold-all-commits).

G1 (zero-run, executed 2026-11-19 read-only in encore-mathlib @ ff2494ea): ROUTE
DECIDED — route 1.5, a hybrid the precharter's two routes jointly suggest: the
second-derivative-at-local-min lemma family (route 1's dependency) has NO directly
consumable on-pin form (DerivativeTest.lean carries none; SecondDerivative.lean
absent from Analysis/Calculus), while everything needed for the sharp constant is
pinned: `Real.add_one_le_exp` (Analysis/Complex/Exponential.lean:629),
`Real.exp_le_exp` (:313), `ge_of_tendsto` (the to_dual of `le_of_tendsto`,
Topology/Order/OrderClosed.lean:133), `Filter.Tendsto.mono_left`
(Order/Filter/Tendsto.lean:133), `nhdsWithin_le_nhds` (Topology/NhdsWithin.lean:191),
`eventually_nhdsWithin_iff` (:49), `nhdsGT_neBot` instance
(Topology/Order/DenselyOrdered.lean:186). Route 1.5 = route 2's pair machinery at the
SHARP quadratic constant (`exp_pair_sharp`: x² ≤ e^x + e^{−x} − 2 via
`x ≤ 2 sinh(x/2)` from two `add_one_le_exp` — elementary, no deriv API) + route 1's
limit realized as `ge_of_tendsto` on the continuous envelope at 𝓝[>] 0. Sharp 2v
LANDS (not route 2's explicit-η downgrade).

Everything from the header marker «Pilot 74 P1» down to P1's audit tail is the GREEN
P1 artifact (`research/pilots/74/P1.lean`, 770 lines, sha 6ddbda11…, P1 COMPLETION
GREEN 2026-11-18, 7/7 triad-only), copied verbatim per the lineage embedding pattern;
the new work is Part P2-a/P2-b + the G3 PROBE at the end (P1's private lemmas are
file-local — the embedding is what makes them consumable).

Must-cites (R9 pre-gate relay, 2026-11-19 — research/novelty/round6-74p2-pregate.md):
mathlib ON THIS PIN carries Mathlib/Probability/Moments/SubGaussian.lean (the
2026-11-13 corpus grep missed it; no variance-equivalence theorem there — the
tilted-variance identity lives only inside Hoeffding's proof) +
Mathlib/Probability/MGFAnalytic.lean:279 `exists_cgf_eq_iteratedDeriv_two_cgf_mul` +
Mathlib/Probability/Moments/Tilted.lean:159 `variance_tilted_mul`. WORDING GUARD
binding on all P2-a prose: "mathlib-absent for finitely-supported spectra" (TRUE),
never "sub-Gaussian absent from mathlib" (FALSE — SubGaussian.lean exists). P2-a
bills formal-new-as-stated / mathematically-folklore; P2-c's class-level tightness
set is NEW-statement across 8 nearest-miss rows + sweeps.

Verify-fire discipline BINDING (the P1-completion precedent): pre-run sha guard via
the stage script; NO local lean; mechanical-fix-only loops; math defects = findings +
STOP. Kernel-only, zero sorry, no native_decide; maxHeartbeats 8M carried in the
verbatim body.

---
-/
/-
Pilot 74 / P1 — the T1+T2+T4 proof core (iteration 4; chartered to lane A8, GO ruling
2026-11-17). PROOF ARTIFACT: math-proof1 standard — NO sorry, NO native_decide, NO
external CAS; kernel-only; self-contained (`import Mathlib` only). The P0 statement
file `T1T2T4-P0.lean` stays the staging record; P1 carries the working defs.

CHARTER RULINGS RECORDED (binding): Q1 RESOLVED to shape (ii) — the per-spectrum-floor
reading governs P1; shape (i) (class-indexed `B_k`) is a P2-class extension, NOT a P1
deliverable. Run-1 lessons binding at authoring time: `noncomputable` on every data
def over log/negMulLog/sInf/sSup; explicit `(j : ℕ)` coercion on `Fin k` exponents.
No BUILD phase in this pilot's runs (probe route = `lake env lean` elaboration only);
the taskset-not-`-j` CPU-cap rule (A3 P1 run-1 finding, 2026-11-17) applies to any
future build-phase runner and to `runner-fixes-wave2.patch` (revised same day).

STATEMENT AMENDMENTS (finds #1–#4, recorded against the dossier's [HYPOTHESIS] tags;
the AL-P2 statement-amendment precedent):
  * FIND #1 — T1(a) as staged is FALSE per-spectrum. Counterexample (verified
    numerically 2026-11-17): p₀ = 1−δ on one atom, n atoms at δ/n each (δ = 0.01,
    n = 10⁶): Var ≈ 3.36, the ε = δ window is W ≈ 0.184 (the heavy atom sits 0.184
    from S), while the claimed floor √((1−ε)/ε·Var) ≈ 18.2. The honest per-spectrum
    floor is the MARKING bound (T1a′): Var ≤ (1−ε)·W² + ε·Mdev² with Mdev the max
    deviation — proved below (`t1a_floor`). The √((1−ε)/ε·Var) shape is class-level
    (extremal spectra) = shape (i) = P2.
  * FIND #2 — the dossier's hMGF transcription ("log m_u ≤ u·S + σ²u², ∀|u| ≤ δ") is
    degenerate at u < 0 (needs 2|u|S ≤ σ²u² for all small |u| — fails whenever S > 0).
    P1's hypothesis is the CENTERED two-sided form (the faithful reading of
    MarginalTails' intent): ∑_supp p·e^{u(K−S)} ≤ e^{v·u²} on the window (`mgfBound`).
  * FIND #3 — sharp constants: the dossier's exact 2σ² (1024 = 2·512) needs the limit
    argument; P1 proves EXPLICIT window-edge constants instead (elementary, one-shot
    at the window edge u₀): Var ≤ 8·(e^{v·u₀²} − 1)/u₀² and W ≤ (log(2/ε)+v·u₀²)/u₀.
    At subG's u₀ = 1/(2σ): Var ≤ 32(e^{1/4}−1)σ²; W ≤ σ·(2·log(2/ε) + 1/2) — the
    dossier's Θ(σ²) and Θ(log(1/ε)) shapes confirmed; sharp constants = P2 refinement.
  * FIND #4 — T4's per-spectrum "W_ε = o(√B)" negation is refuted at shape (ii) by
    the same family as FIND #1. T4 here = the honest pair (corrected floor + ceiling)
    on the class family (`t4_floor_ceiling`); the o(√B) tightness is class-level =
    shape (i) = P2.
T3 remains UNCHARTERED (the LP layer; cost-shared with dossier 02).

Row-7 scope rules (binding): p-indexed finite sums only (no "Lean-ecosystem-absent"
claims — physlib's Sᵥₙ/DPI wing is the ecosystem counterweight); the physlib
sandwiched-Rényi DPI family is a latent must-cite, NOT triggered here (m_u is not
rephrased as trace functionals); proof-engine: the elementary routes below needed no
operator-Jensen step — the census cites (tauceti OperatorJensen.lean :64/:124
importable on our pin; physlib HayataGroup wing citation-only) stand for any P2 route.

Full-coverage audit tail at file end (every public theorem).

COMPLETION FIX-BATCH (lane A8, 2026-11-18; the re-chartered P1-completion, fresh ≤5-run
budget, verify-fire discipline). Applied against the never-fired 21:13 local state (715
LoC): 30+ API-signature corrections, each verified against the pin's source tree
(encore-mathlib @ ff2494ea = the exact Modal image rev) BEFORE firing — the run-6 lesson
(never fire an unverified batch). Corrections include: `Finset.single_le_sum` arg order
(hf, hi); `Real.le_sInf` → `Real.sInf_nonneg` (the pin's `Real.le_sInf` takes a ≤0
side condition); `Real.csSup_le`/`Real.le_csSup` → the generic `csSup_le`/`le_csSup`
(ℝ is a ConditionallyCompleteLattice instance at this pin; the Real.* aliases are gone);
`Finset.min'_mem`/`min'_le` arity (no type tag; (s, mem)/(x, mem)); `Real.mul_self_sqrt`
→ `Real.sq_sqrt` under `mul_pow`; `rw` with ≤-hypotheses replaced by linarith finishes;
`Real.exp_add` rewrite directions; `positivity` calls on opaque atoms replaced by
explicit `mul_pos`/`one_div_pos`/`pow_pos`/`nlinarith` (positivity does not read
context); `Fin.eta`/beta-redex routes replaced by a named `padA` def; `set`-local `δ`/`v`
unfolded via their `with hδ/hv` equations (`unfold` fails on locals; field_simp does not
zeta-unfold); and the literal `\'` identifier-escape corruption (9 lines, from the
aborted 21:13 python batch) repaired to `'`.
-/
import Mathlib

set_option maxHeartbeats 8000000

open Real

namespace CrossMath.Pilot74P1

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-! ## Definitions -/

def IsSpectrum (p : ι → ℝ) : Prop := (∀ i, 0 ≤ p i) ∧ ∑ i, p i = 1

noncomputable def supp (p : ι → ℝ) : Finset ι := Finset.univ.filter (fun i => 0 < p i)

noncomputable def surprisal (p : ι → ℝ) (i : ι) : ℝ := -Real.log (p i)

noncomputable def S (p : ι → ℝ) : ℝ := ∑ i, Real.negMulLog (p i)

noncomputable def dev (p : ι → ℝ) (i : ι) : ℝ := surprisal p i - S p

noncomputable def varK (p : ι → ℝ) : ℝ := (∑ i ∈ supp p, p i * surprisal p i ^ 2) - S p ^ 2

noncomputable def massTail (p : ι → ℝ) (w : ℝ) : ℝ :=
  ∑ i ∈ Finset.univ.filter (fun i => w < |dev p i|), p i

noncomputable def W (p : ι → ℝ) (ε : ℝ) : ℝ :=
  sInf {w : ℝ | 0 ≤ w ∧ massTail p w ≤ ε}

noncomputable def Mdev (p : ι → ℝ) : ℝ :=
  sSup {r : ℝ | ∃ i ∈ supp p, r = abs (dev p i)}

/-- Centered two-sided windowed-MGF bound with variance proxy `v` (FIND #2's form). -/
def mgfBound (p : ι → ℝ) (v δ : ℝ) : Prop :=
  ∀ u : ℝ, |u| ≤ δ → ∑ i ∈ supp p, p i * Real.exp (u * dev p i) ≤ Real.exp (v * u ^ 2)

/-- The subG instance: `mgfBound` at proxy σ², window 1/(2σ). -/
def subG (p : ι → ℝ) (σ : ℝ) : Prop := mgfBound p (σ ^ 2) (1 / (2 * σ))

/-- Centered-class membership at scale B (the P0 `InMGFClass` centered per FIND #2;
MarginalTails' 512·e carried). -/
def InSubGClass (p : ι → ℝ) (θ B : ℝ) : Prop :=
  IsSpectrum p ∧ 1 ≤ B ∧
    mgfBound p (512 * Real.exp 1 * θ * B) (1 / (32 * Real.sqrt ((1 + θ) * B)))

/-- The k-moment datum (run-1 lesson: explicit `(j : ℕ)` coercion). -/
noncomputable def datum (p : ι → ℝ) (k : ℕ) : Fin k → ℝ :=
  fun j => ∑ i ∈ supp p, p i * surprisal p i ^ ((j : ℕ) + 1)

def CertValid (F : (ι → ℝ) → ℝ) (k : ℕ) (c₀ : ℝ) (a : Fin k → ℝ) : Prop :=
  ∀ q : ι → ℝ, IsSpectrum q → c₀ + ∑ j, a j * datum q k j ≤ F q

noncomputable def Bk (F : (ι → ℝ) → ℝ) (k : ℕ) : ℝ :=
  sSup {c₀ : ℝ | ∃ a : Fin k → ℝ, CertValid F k c₀ a}

/-! ## Support and tail lemmas -/

private lemma p_zero_of_notsupp {p : ι → ℝ} (hp : IsSpectrum p) {i : ι}
    (hi : i ∉ supp p) : p i = 0 := by
  have h1 : ¬(0 < p i) := fun h => hi (Finset.mem_filter.mpr ⟨Finset.mem_univ i, h⟩)
  exact le_antisymm (not_lt.mp h1) (hp.1 i)

private lemma sum_supp_extend {p : ι → ℝ} (hp : IsSpectrum p) (f : ι → ℝ)
    (hf : ∀ i ∉ supp p, f i = 0) : ∑ i ∈ supp p, f i = ∑ i, f i :=
  Finset.sum_subset (Finset.subset_univ (supp p)) (fun i _ hi => hf i hi)

private lemma supp_sum_eq_one {p : ι → ℝ} (hp : IsSpectrum p) : ∑ i ∈ supp p, p i = 1 := by
  rw [sum_supp_extend hp p (fun i hi => p_zero_of_notsupp hp hi)]
  exact hp.2

private lemma supp_sum_K_eq_S {p : ι → ℝ} (hp : IsSpectrum p) :
    ∑ i ∈ supp p, p i * surprisal p i = S p := by
  have hEq : ∀ i ∈ supp p, p i * surprisal p i = Real.negMulLog (p i) := by
    intro i _
    show p i * (-Real.log (p i)) = -(p i) * Real.log (p i)
    ring
  have h0 : ∀ i ∉ supp p, Real.negMulLog (p i) = 0 := by
    intro i hi; rw [p_zero_of_notsupp hp hi]; simp
  have hcongr : ∑ i ∈ supp p, p i * surprisal p i
      = ∑ i ∈ supp p, Real.negMulLog (p i) := Finset.sum_congr rfl hEq
  rw [hcongr]
  exact sum_supp_extend hp (fun i => Real.negMulLog (p i)) h0

private lemma varK_eq {p : ι → ℝ} (hp : IsSpectrum p) :
    varK p = ∑ i ∈ supp p, p i * (dev p i) ^ 2 := by
  have hexp : ∀ i ∈ supp p, p i * (dev p i) ^ 2
      = p i * surprisal p i ^ 2
        - (2 * S p * (p i * surprisal p i) - p i * (S p) ^ 2) := by
    intro i _; simp only [dev]; ring
  have hMS : 2 * S p * ∑ i ∈ supp p, p i * surprisal p i
      = ∑ i ∈ supp p, 2 * S p * (p i * surprisal p i) := by
    simp only [Finset.mul_sum]
  have h1' : ∑ i ∈ supp p, 2 * S p * (p i * surprisal p i) = 2 * S p * S p := by
    rw [← hMS, supp_sum_K_eq_S hp]
  have h2' : ∑ i ∈ supp p, p i * (S p) ^ 2 = (S p) ^ 2 := by
    rw [← Finset.sum_mul, supp_sum_eq_one hp, one_mul]
  have hMid : ∑ i ∈ supp p, (p i * surprisal p i ^ 2
      - (2 * S p * (p i * surprisal p i) - p i * (S p) ^ 2))
      = (∑ i ∈ supp p, p i * surprisal p i ^ 2) - (2 * S p * S p - (S p) ^ 2) := by
    rw [Finset.sum_sub_distrib, Finset.sum_sub_distrib, h1', h2']
  show (∑ i ∈ supp p, p i * surprisal p i ^ 2) - S p ^ 2
      = ∑ i ∈ supp p, p i * (dev p i) ^ 2
  rw [Finset.sum_congr rfl (fun i hi => hexp i hi), hMid]
  ring

private lemma Mdev_bddAbove (p : ι → ℝ) :
    BddAbove {r : ℝ | ∃ i ∈ supp p, r = abs (dev p i)} :=
  ⟨∑ i ∈ supp p, abs (dev p i) + 1, by
    intro r hr
    obtain ⟨i, hi, rfl⟩ := hr
    have h1 : abs (dev p i) ≤ ∑ j ∈ supp p, abs (dev p j) :=
      -- pin v4.36-rc2 signature: `single_le_sum (hf : ∀ i ∈ s, 0 ≤ f i) (h : a ∈ s)`
      Finset.single_le_sum (f := fun j => abs (dev p j)) (fun j _ => abs_nonneg _) hi
    linarith⟩

private lemma dev_le_Mdev {p : ι → ℝ} {i : ι} (hi : i ∈ supp p) : |dev p i| ≤ Mdev p :=
  le_csSup (Mdev_bddAbove p) ⟨i, hi, rfl⟩

private lemma Mdev_nonneg (p : ι → ℝ) : 0 ≤ Mdev p := by
  by_cases hne : (supp p).Nonempty
  · obtain ⟨i, hi⟩ := hne
    exact le_trans (abs_nonneg (dev p i))
      (le_csSup (Mdev_bddAbove p) ⟨i, hi, rfl⟩)
  · have hsub : {r : ℝ | ∃ i ∈ supp p, r = abs (dev p i)} ⊆ (∅ : Set ℝ) := by
      intro r hr
      obtain ⟨i, hi, _⟩ := hr
      exact (hne ⟨i, hi⟩).elim
    have hempty : {r : ℝ | ∃ i ∈ supp p, r = abs (dev p i)} = ∅ :=
      Set.subset_empty_iff.mp hsub
    rw [Mdev, hempty, Real.sSup_empty]

private lemma massTail_eq_supp {p : ι → ℝ} (hp : IsSpectrum p) (w : ℝ) :
    massTail p w = ∑ i ∈ (supp p).filter (fun i => w < |dev p i|), p i := by
  have hsub : (supp p).filter (fun i => w < |dev p i|) ⊆
      Finset.univ.filter (fun i => w < |dev p i|) := by
    intro i hi
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ i, (Finset.mem_filter.mp hi).2⟩
  have hzero : ∀ i ∈ Finset.univ.filter (fun i => w < |dev p i|),
      i ∉ (supp p).filter (fun i => w < |dev p i|) → p i = 0 := by
    intro i hiT hiS
    by_contra hp0
    have hpos : 0 < p i := by
      have hle := hp.1 i
      have hne : p i ≠ 0 := hp0
      exact lt_of_le_of_ne hle (Ne.symm hne)
    exact hiS (Finset.mem_filter.mpr
      ⟨Finset.mem_filter.mpr ⟨Finset.mem_univ i, hpos⟩, (Finset.mem_filter.mp hiT).2⟩)
  exact (Finset.sum_subset hsub hzero).symm

private lemma massTail_antitone {p : ι → ℝ} (hp : IsSpectrum p) {w₁ w₂ : ℝ}
    (h : w₁ ≤ w₂) : massTail p w₂ ≤ massTail p w₁ :=
  Finset.sum_le_sum_of_subset_of_nonneg (by
    intro i hi
    exact Finset.mem_filter.mpr ⟨(Finset.mem_filter.mp hi).1,
      lt_of_le_of_lt h (Finset.mem_filter.mp hi).2⟩) (fun i _ _ => hp.1 i)

private lemma massTail_zero_of_big {p : ι → ℝ} (hp : IsSpectrum p) :
    massTail p (Mdev p + 1) = 0 := by
  rw [massTail_eq_supp hp]
  have hF : (supp p).filter (fun i => Mdev p + 1 < |dev p i|) = ∅ := by
    rw [Finset.filter_eq_empty_iff]
    -- `filter_eq_empty_iff` at this pin: ∀ ⦃x⦄, x ∈ s → ¬p x  (so hi : i ∈ supp p)
    intro i hi hlt
    have hle : |dev p i| ≤ Mdev p := dev_le_Mdev hi
    linarith
  rw [hF, Finset.sum_empty]

private lemma mem_Wset {p : ι → ℝ} {ε w : ℝ} :
    w ∈ {w : ℝ | 0 ≤ w ∧ massTail p w ≤ ε} ↔ 0 ≤ w ∧ massTail p w ≤ ε := Iff.rfl

private lemma wset_bddBelow {p : ι → ℝ} {ε : ℝ} :
    BddBelow {w : ℝ | 0 ≤ w ∧ massTail p w ≤ ε} :=
  ⟨0, fun w hw => (mem_Wset.mp hw).1⟩

private lemma wset_nonempty {p : ι → ℝ} (hp : IsSpectrum p) {ε : ℝ} (hε : 0 ≤ ε) :
    {w : ℝ | 0 ≤ w ∧ massTail p w ≤ ε}.Nonempty := by
  refine ⟨Mdev p + 1, ?_, ?_⟩
  · linarith [Mdev_nonneg p]
  · rw [massTail_zero_of_big hp]; exact hε

private lemma W_nonneg {p : ι → ℝ} (hp : IsSpectrum p) {ε : ℝ} (hε : 0 ≤ ε) :
    0 ≤ W p ε := by
  exact Real.sInf_nonneg (fun _ hw => (mem_Wset.mp hw).1)

private lemma W_le_of_mem {p : ι → ℝ} (hp : IsSpectrum p) {ε : ℝ} (hε : 0 ≤ ε) {w : ℝ}
    (hw : 0 ≤ w ∧ massTail p w ≤ ε) : W p ε ≤ w := by
  exact csInf_le (wset_bddBelow) hw

private lemma sum_split {p : ι → ℝ} (w : ℝ) (f : ι → ℝ) :
    ∑ i ∈ (supp p).filter (fun i => |dev p i| ≤ w), f i
      + ∑ i ∈ (supp p).filter (fun i => w < |dev p i|), f i = ∑ i ∈ supp p, f i := by
  have h := Finset.sum_filter_add_sum_filter_not (supp p) (fun i => w < |dev p i|) f
  have hEq : (supp p).filter (fun i => ¬(w < |dev p i|))
      = (supp p).filter (fun i => |dev p i| ≤ w) := by
    ext i
    simp only [Finset.mem_filter, Finset.mem_univ, true_and, not_lt]
  rw [hEq] at h
  linarith [h]

private lemma massTail_nonneg {p : ι → ℝ} (hp : IsSpectrum p) (w : ℝ) :
    0 ≤ massTail p w :=
  Finset.sum_nonneg (fun i _ => hp.1 i)

private lemma massTail_at_W_le {p : ι → ℝ} (hp : IsSpectrum p) {ε : ℝ} (hε : 0 ≤ ε) :
    massTail p (W p ε) ≤ ε := by
  classical
  have hstab : ∃ δ' : ℝ, 0 < δ' ∧ massTail p (W p ε + δ') = massTail p (W p ε) := by
    by_cases hF : (supp p).filter (fun i => W p ε < |dev p i|) = ∅
    · refine ⟨1, by norm_num, ?_⟩
      have h0 : massTail p (W p ε) = 0 := by
        rw [massTail_eq_supp hp, hF, Finset.sum_empty]
      have hle : massTail p (W p ε + 1) ≤ massTail p (W p ε) :=
        massTail_antitone hp (by linarith)
      have hnn := massTail_nonneg hp (W p ε + 1)
      linarith
    · have hFne : ((supp p).filter (fun i => W p ε < |dev p i|)).Nonempty :=
        Finset.nonempty_iff_ne_empty.mpr hF
      have hGimg : (((supp p).filter (fun i => W p ε < |dev p i|)).image
          (fun i => |dev p i| - W p ε)).Nonempty :=
        Finset.Nonempty.image hFne (fun i => |dev p i| - W p ε)
      obtain ⟨m, hmp, hmin⟩ : ∃ m : ℝ, 0 < m ∧ ∀ i : ι, i ∈ supp p → W p ε < |dev p i| →
          m ≤ |dev p i| - W p ε := by
        refine ⟨((supp p).filter (fun i => W p ε < |dev p i|)).image
            (fun i => |dev p i| - W p ε) |>.min' hGimg, ?_, ?_⟩
        · obtain ⟨i, hiG, hi⟩ := Finset.mem_image.mp
            (Finset.min'_mem _ hGimg)
          rw [← hi]
          exact sub_pos.mpr (Finset.mem_filter.mp hiG).2
        · intro i hi hiW
          exact Finset.min'_le _ (|dev p i| - W p ε)
            (Finset.mem_image.mpr ⟨i, Finset.mem_filter.mpr ⟨hi, hiW⟩, rfl⟩)
      refine ⟨m / 2, by linarith, ?_⟩
      have hff : (supp p).filter (fun i => W p ε + m / 2 < |dev p i|)
          = (supp p).filter (fun i => W p ε < |dev p i|) := by
        ext i
        simp only [Finset.mem_filter]
        constructor
        · intro h
          exact ⟨h.1, by linarith [hmp]⟩
        · intro h
          have hle := hmin i h.1 h.2
          have hlt := h.2
          refine ⟨h.1, ?_⟩
          linarith
      rw [massTail_eq_supp hp, massTail_eq_supp hp, hff]
  obtain ⟨δ', hδ', hEq⟩ := hstab
  obtain ⟨s, hs, hs_lt⟩ : ∃ s ∈ {w : ℝ | 0 ≤ w ∧ massTail p w ≤ ε}, s < W p ε + δ' := by
    by_contra hcon
    push_neg at hcon
    have hSne : {w : ℝ | 0 ≤ w ∧ massTail p w ≤ ε}.Nonempty := wset_nonempty hp hε
    have hle : W p ε + δ' ≤ W p ε := le_csInf hSne (fun x hx => hcon x hx)
    linarith
  have h1 := massTail_antitone hp (le_of_lt hs_lt)
  rw [hEq] at h1
  linarith [h1, hs.2]

/-! ## The windowed-MGF pair bounds (general; FIND #3's explicit constants) -/

private lemma exp_pair_bound (x : ℝ) :
    x ^ 2 ≤ 4 * (Real.exp x + Real.exp (-x) - 2) := by
  have hkey : ∀ t : ℝ, 0 ≤ t → (1 + t / 2) ^ 2 ≤ Real.exp t := by
    intro t ht
    have h0 : t / 2 + 1 ≤ Real.exp (t / 2) := Real.add_one_le_exp _
    have h1 : 1 + t / 2 ≤ Real.exp (t / 2) := by linarith
    have h2 : 0 ≤ 1 + t / 2 := by linarith
    have hcore : (1 + t / 2) * (1 + t / 2) ≤ Real.exp (t / 2) * Real.exp (t / 2) := by
      have hpos : 0 ≤ Real.exp (t / 2) + (1 + t / 2) := by linarith
      have hneg : 0 ≤ Real.exp (t / 2) - (1 + t / 2) := by linarith
      nlinarith [mul_nonneg hneg hpos, h1]
    have e1 : (1 + t / 2) ^ 2 = (1 + t / 2) * (1 + t / 2) := by ring
    calc (1 + t / 2) ^ 2 ≤ Real.exp (t / 2) * Real.exp (t / 2) := by
          rw [e1]; exact hcore
      _ = Real.exp t := by rw [← Real.exp_add]; congr 1; ring
  have habs := hkey |x| (abs_nonneg x)
  have hsq : x ^ 2 = |x| ^ 2 := (sq_abs x).symm
  have hpair : Real.exp |x| + Real.exp (-|x|) = Real.exp x + Real.exp (-x) := by
    by_cases hx : 0 ≤ x
    · rw [abs_of_nonneg hx]
    · rw [abs_of_neg (not_le.mp hx), neg_neg]; ring
  have he2 : (1 + |x| / 2) ^ 2 = 1 + |x| + |x| ^ 2 / 4 := by ring
  have hn0 : -|x| + 1 ≤ Real.exp (-|x|) := Real.add_one_le_exp _
  have hn : 1 + -|x| ≤ Real.exp (-|x|) := by linarith
  rw [hsq, ← hpair]
  nlinarith [habs, he2, hn]

private lemma pair_var_bound {p : ι → ℝ} {v u₀ : ℝ} (hp : IsSpectrum p) (hu₀ : 0 < u₀)
    (hplus : ∑ i ∈ supp p, p i * Real.exp (u₀ * dev p i) ≤ Real.exp (v * u₀ ^ 2))
    (hminus : ∑ i ∈ supp p, p i * Real.exp (-u₀ * dev p i) ≤ Real.exp (v * u₀ ^ 2)) :
    u₀ ^ 2 * varK p ≤ 8 * (Real.exp (v * u₀ ^ 2) - 1) := by
  have hpt : ∀ i ∈ supp p, p i * (u₀ * dev p i) ^ 2
      ≤ p i * (4 * (Real.exp (u₀ * dev p i) + Real.exp (-(u₀ * dev p i)) - 2)) := by
    intro i _
    exact mul_le_mul_of_nonneg_left (exp_pair_bound (u₀ * dev p i)) (hp.1 i)
  have hsum : ∑ i ∈ supp p, p i * (u₀ * dev p i) ^ 2 = u₀ ^ 2 * varK p := by
    rw [varK_eq hp, Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  have h1 : ∑ i ∈ supp p, p i * (u₀ * dev p i) ^ 2
      ≤ ∑ i ∈ supp p, p i * (4 * (Real.exp (u₀ * dev p i)
          + Real.exp (-(u₀ * dev p i)) - 2)) :=
    Finset.sum_le_sum hpt
  rw [hsum] at h1
  have hE : ∀ i ∈ supp p, p i * (4 * (Real.exp (u₀ * dev p i)
        + Real.exp (-(u₀ * dev p i)) - 2))
      = 4 * (p i * Real.exp (u₀ * dev p i))
        + (4 * (p i * Real.exp (-(u₀ * dev p i))) - 8 * p i) := fun i _ => by ring
  have hDist : ∑ i ∈ supp p, p i * (4 * (Real.exp (u₀ * dev p i)
        + Real.exp (-(u₀ * dev p i)) - 2))
      = 4 * ∑ i ∈ supp p, p i * Real.exp (u₀ * dev p i)
        + ∑ i ∈ supp p, (4 * (p i * Real.exp (-(u₀ * dev p i))) - 8 * p i) := by
    rw [Finset.sum_congr rfl hE, Finset.sum_add_distrib, ← Finset.mul_sum]
  rw [hDist] at h1
  have hInner : ∑ i ∈ supp p, (4 * (p i * Real.exp (-(u₀ * dev p i))) - 8 * p i)
      = 4 * ∑ i ∈ supp p, p i * Real.exp (-(u₀ * dev p i))
        - 8 * ∑ i ∈ supp p, p i := by
    rw [Finset.sum_sub_distrib, ← Finset.mul_sum, ← Finset.mul_sum]
  rw [hInner, supp_sum_eq_one hp] at h1
  have hconv2 : ∑ i ∈ supp p, p i * Real.exp (-u₀ * dev p i)
      = ∑ i ∈ supp p, p i * Real.exp (-(u₀ * dev p i)) :=
    Finset.sum_congr rfl (fun i _ => by rw [← neg_mul])
  rw [hconv2] at hminus
  have hE2 : 4 * ∑ i ∈ supp p, p i * Real.exp (u₀ * dev p i)
      + (4 * ∑ i ∈ supp p, p i * Real.exp (-(u₀ * dev p i)) - 8)
      ≤ 8 * Real.exp (v * u₀ ^ 2) - 8 := by nlinarith [hplus, hminus]
  nlinarith [h1, hE2]

private lemma pair_tail_bound {p : ι → ℝ} {v u₀ t ε : ℝ} (hp : IsSpectrum p)
    (hu₀ : 0 < u₀) (hε : 0 < ε)
    (hplus : ∑ i ∈ supp p, p i * Real.exp (u₀ * dev p i) ≤ Real.exp (v * u₀ ^ 2))
    (hminus : ∑ i ∈ supp p, p i * Real.exp (-u₀ * dev p i) ≤ Real.exp (v * u₀ ^ 2))
    (ht : Real.log 2 + v * u₀ ^ 2 ≤ Real.log ε + u₀ * t) : massTail p t ≤ ε := by
  have hu0 : 0 ≤ u₀ := le_of_lt hu₀
  have hMem : ∀ i ∈ (supp p).filter (fun i => t < |dev p i|),
      p i ≤ p i * Real.exp (u₀ * (|dev p i| - t)) := by
    intro i hi
    have hlt := (Finset.mem_filter.mp hi).2
    have hpos : 0 ≤ u₀ * (|dev p i| - t) := mul_nonneg hu0 (by linarith)
    have h1 : (1 : ℝ) ≤ Real.exp (u₀ * (|dev p i| - t)) := Real.one_le_exp hpos
    calc p i = p i * 1 := by ring
      _ ≤ p i * Real.exp (u₀ * (|dev p i| - t)) := mul_le_mul_of_nonneg_left h1 (hp.1 i)
  have hAbs : ∀ i ∈ supp p, p i * Real.exp (u₀ * |dev p i|)
      ≤ p i * (Real.exp (u₀ * dev p i) + Real.exp (-(u₀ * dev p i))) := by
    intro i _
    by_cases h : 0 ≤ dev p i
    · have hrw : u₀ * |dev p i| = u₀ * dev p i := by rw [abs_of_nonneg h]
      rw [hrw]
      exact mul_le_mul_of_nonneg_left (le_add_of_nonneg_right (Real.exp_nonneg _)) (hp.1 i)
    · have hrw : u₀ * |dev p i| = -(u₀ * dev p i) := by
        rw [abs_of_neg (not_le.mp h)]; ring
      rw [hrw]
      exact mul_le_mul_of_nonneg_left (le_add_of_nonneg_left (Real.exp_nonneg _)) (hp.1 i)
  have hsub : (supp p).filter (fun i => t < |dev p i|) ⊆ supp p :=
    Finset.filter_subset _ _
  have hstep1 : massTail p t ≤ ∑ i ∈ supp p, p i * Real.exp (u₀ * (|dev p i| - t)) := by
    rw [massTail_eq_supp hp]
    calc ∑ i ∈ (supp p).filter (fun i => t < |dev p i|), p i
        ≤ ∑ i ∈ (supp p).filter (fun i => t < |dev p i|),
            p i * Real.exp (u₀ * (|dev p i| - t)) := Finset.sum_le_sum hMem
      _ ≤ ∑ i ∈ supp p, p i * Real.exp (u₀ * (|dev p i| - t)) :=
          Finset.sum_le_sum_of_subset_of_nonneg hsub
            (fun i _ _ => mul_nonneg (hp.1 i) (Real.exp_nonneg _))
  have hterm : ∀ i ∈ supp p, p i * Real.exp (u₀ * (|dev p i| - t))
      = Real.exp (-(u₀ * t)) * (p i * Real.exp (u₀ * |dev p i|)) := by
    intro i _
    have hsplit : u₀ * (|dev p i| - t) = u₀ * |dev p i| + -(u₀ * t) := by ring
    rw [hsplit, Real.exp_add]
    ring
  have hstep2 : ∑ i ∈ supp p, p i * Real.exp (u₀ * (|dev p i| - t))
      = Real.exp (-(u₀ * t)) * ∑ i ∈ supp p, p i * Real.exp (u₀ * |dev p i|) := by
    rw [Finset.sum_congr rfl hterm, Finset.mul_sum]
  have hD : ∀ i ∈ supp p, p i * (Real.exp (u₀ * dev p i) + Real.exp (-(u₀ * dev p i)))
      = p i * Real.exp (u₀ * dev p i) + p i * Real.exp (-(u₀ * dev p i)) :=
    fun i _ => by ring
  have hconv3 : ∑ i ∈ supp p, p i * Real.exp (-u₀ * dev p i)
      = ∑ i ∈ supp p, p i * Real.exp (-(u₀ * dev p i)) :=
    Finset.sum_congr rfl (fun i _ => by rw [← neg_mul])
  rw [hconv3] at hminus
  have hstep3 : Real.exp (-(u₀ * t)) * ∑ i ∈ supp p, p i * Real.exp (u₀ * |dev p i|) ≤
      Real.exp (-(u₀ * t)) * (Real.exp (v * u₀ ^ 2) + Real.exp (v * u₀ ^ 2)) := by
    refine mul_le_mul_of_nonneg_left ?_ (Real.exp_nonneg _)
    calc ∑ i ∈ supp p, p i * Real.exp (u₀ * |dev p i|)
        ≤ ∑ i ∈ supp p, p i * (Real.exp (u₀ * dev p i)
            + Real.exp (-(u₀ * dev p i))) := Finset.sum_le_sum hAbs
      _ = ∑ i ∈ supp p, p i * Real.exp (u₀ * dev p i)
          + ∑ i ∈ supp p, p i * Real.exp (-(u₀ * dev p i)) := by
          rw [Finset.sum_congr rfl hD, Finset.sum_add_distrib]
      _ ≤ Real.exp (v * u₀ ^ 2) + Real.exp (v * u₀ ^ 2) := add_le_add hplus hminus
  have hfinal : Real.exp (-(u₀ * t)) * (Real.exp (v * u₀ ^ 2)
        + Real.exp (v * u₀ ^ 2)) ≤ ε := by
    have hL : Real.exp (Real.log 2 + v * u₀ ^ 2) ≤ Real.exp (Real.log ε + u₀ * t) :=
      Real.exp_le_exp.mpr ht
    rw [Real.exp_add, Real.exp_log (by norm_num : (0 : ℝ) < 2)] at hL
    rw [Real.exp_add, Real.exp_log hε] at hL
    -- hL : 2 * exp (v * u₀²) ≤ ε * exp (u₀ * t)
    have hOne : Real.exp (u₀ * t) * Real.exp (-(u₀ * t)) = 1 := by
      rw [← Real.exp_add]; simp
    have hStep2 : 2 * Real.exp (v * u₀ ^ 2) * Real.exp (-(u₀ * t)) ≤ ε := by
      have hM := mul_le_mul_of_nonneg_right hL (Real.exp_nonneg (-(u₀ * t)))
      have hAssoc : ε * Real.exp (u₀ * t) * Real.exp (-(u₀ * t))
          = ε * (Real.exp (u₀ * t) * Real.exp (-(u₀ * t))) := mul_assoc _ _ _
      rwa [hAssoc, hOne, mul_one] at hM
    have hEq2 : Real.exp (-(u₀ * t)) * (Real.exp (v * u₀ ^ 2)
        + Real.exp (v * u₀ ^ 2)) = 2 * Real.exp (v * u₀ ^ 2) * Real.exp (-(u₀ * t)) := by
      ring
    rw [hEq2]
    exact hStep2
  calc massTail p t
      ≤ ∑ i ∈ supp p, p i * Real.exp (u₀ * (|dev p i| - t)) := hstep1
    _ = Real.exp (-(u₀ * t)) * ∑ i ∈ supp p, p i * Real.exp (u₀ * |dev p i|) := hstep2
    _ ≤ ε := hstep3.trans hfinal

/-! ## T1a′ — the marking floor (FIND #1's corrected statement) -/

/-- **T1a′ (corrected floor).** For every spectrum and ε ∈ (0,1):
`Var_p(K) ≤ (1−ε)·W_ε(p)² + ε·Mdev(p)²` — the marking bound (dossier T1(a) as staged
is FALSE per-spectrum; FIND #1). -/
theorem t1a_floor {p : ι → ℝ} (hp : IsSpectrum p) {ε : ℝ} (hε : 0 < ε) (hε' : ε < 1) :
    varK p ≤ (1 - ε) * (W p ε) ^ 2 + ε * (Mdev p) ^ 2 := by
  have hW0 := W_nonneg hp (le_of_lt hε)
  have hWM : W p ε ≤ Mdev p := by
    refine W_le_of_mem hp (le_of_lt hε) ⟨Mdev_nonneg p, ?_⟩
    rw [massTail_eq_supp hp]
    have hF : (supp p).filter (fun i => Mdev p < |dev p i|) = ∅ := by
      rw [Finset.filter_eq_empty_iff]
      intro i hi hlt
      have hle : |dev p i| ≤ Mdev p := dev_le_Mdev hi
      linarith
    rw [hF, Finset.sum_empty]
    exact le_of_lt hε
  have hmass := massTail_at_W_le hp (le_of_lt hε)
  have hmassSupp : ∑ i ∈ (supp p).filter (fun i => W p ε < |dev p i|), p i ≤ ε := by
    rw [← massTail_eq_supp hp]; exact hmass
  have hAB := sum_split (p := p) (W p ε) (fun i => p i)
  rw [supp_sum_eq_one hp] at hAB
  have hSplit := sum_split (p := p) (W p ε) (fun i => p i * (dev p i) ^ 2)
  rw [varK_eq hp, ← hSplit]
  set An := ∑ i ∈ (supp p).filter (fun i => |dev p i| ≤ W p ε), p i with hAn
  set Bn := ∑ i ∈ (supp p).filter (fun i => W p ε < |dev p i|), p i with hBn
  have hboundA : ∀ i ∈ (supp p).filter (fun i => |dev p i| ≤ W p ε),
      p i * (dev p i) ^ 2 ≤ p i * (W p ε) ^ 2 := by
    intro i hi
    have h1 : |dev p i| ≤ W p ε := (Finset.mem_filter.mp hi).2
    have h2 : (dev p i) ^ 2 ≤ (W p ε) ^ 2 := by
      have h4 : |dev p i| * |dev p i| ≤ (W p ε) * (W p ε) :=
        mul_le_mul h1 h1 (abs_nonneg _) hW0
      have h5 : |dev p i| ^ 2 ≤ (W p ε) ^ 2 := by nlinarith [h4]
      rwa [sq_abs] at h5
    exact mul_le_mul_of_nonneg_left h2 (hp.1 i)
  have hboundB : ∀ i ∈ (supp p).filter (fun i => W p ε < |dev p i|),
      p i * (dev p i) ^ 2 ≤ p i * (Mdev p) ^ 2 := by
    intro i hi
    have h1 : |dev p i| ≤ Mdev p := dev_le_Mdev (Finset.mem_filter.mp hi).1
    have h2 : (dev p i) ^ 2 ≤ (Mdev p) ^ 2 := by
      have h4 : |dev p i| * |dev p i| ≤ (Mdev p) * (Mdev p) :=
        mul_le_mul h1 h1 (abs_nonneg _) (Mdev_nonneg p)
      have h5 : |dev p i| ^ 2 ≤ (Mdev p) ^ 2 := by nlinarith [h4]
      rwa [sq_abs] at h5
    exact mul_le_mul_of_nonneg_left h2 (hp.1 i)
  have hA1 : ∑ i ∈ (supp p).filter (fun i => |dev p i| ≤ W p ε), p i * (dev p i) ^ 2
      ≤ An * (W p ε) ^ 2 := by
    calc ∑ i ∈ (supp p).filter (fun i => |dev p i| ≤ W p ε), p i * (dev p i) ^ 2
        ≤ ∑ i ∈ (supp p).filter (fun i => |dev p i| ≤ W p ε), p i * (W p ε) ^ 2 :=
          Finset.sum_le_sum hboundA
      _ = An * (W p ε) ^ 2 := by rw [← Finset.sum_mul]
  have hB1 : ∑ i ∈ (supp p).filter (fun i => W p ε < |dev p i|), p i * (dev p i) ^ 2
      ≤ Bn * (Mdev p) ^ 2 := by
    calc ∑ i ∈ (supp p).filter (fun i => W p ε < |dev p i|), p i * (dev p i) ^ 2
        ≤ ∑ i ∈ (supp p).filter (fun i => W p ε < |dev p i|), p i * (Mdev p) ^ 2 :=
          Finset.sum_le_sum hboundB
      _ = Bn * (Mdev p) ^ 2 := by rw [← Finset.sum_mul]
  have hWM2 : (W p ε) ^ 2 ≤ (Mdev p) ^ 2 := by
    have h1 : Mdev p * W p ε ≤ Mdev p * Mdev p :=
      mul_le_mul_of_nonneg_left hWM (Mdev_nonneg p)
    have h2 : W p ε * W p ε ≤ Mdev p * W p ε :=
      mul_le_mul_of_nonneg_right hWM hW0
    nlinarith [h1, h2]
  have hDiffNN : 0 ≤ (Mdev p) ^ 2 - (W p ε) ^ 2 := by linarith [hWM2]
  have hmono : Bn * ((Mdev p) ^ 2 - (W p ε) ^ 2)
      ≤ ε * ((Mdev p) ^ 2 - (W p ε) ^ 2) :=
    mul_le_mul_of_nonneg_right hmassSupp hDiffNN
  -- deterministic assembly (monomial-linear in An·W², Bn·M², Bn·W², Bn·M²-style atoms)
  have hWsqr : (0:ℝ) ≤ (W p ε) ^ 2 := sq_nonneg _
  have h7 : An * (W p ε) ^ 2 = (1 - Bn) * (W p ε) ^ 2 := by nlinarith [hAB, hWsqr]
  have h8 : (1 - Bn) * (W p ε) ^ 2 + Bn * (Mdev p) ^ 2
      = (W p ε) ^ 2 + Bn * ((Mdev p) ^ 2 - (W p ε) ^ 2) := by ring
  have h10 : (1 - ε) * (W p ε) ^ 2 + ε * (Mdev p) ^ 2
      = (W p ε) ^ 2 + ε * ((Mdev p) ^ 2 - (W p ε) ^ 2) := by ring
  linarith [hA1, hB1, h7, h8, hmono, h10]

/-! ## T1b — subgaussian variance and window (explicit constants, FIND #3) -/

theorem t1b {p : ι → ℝ} (hp : IsSpectrum p) {σ : ℝ} (hσ : 0 < σ) (h : subG p σ) :
    varK p ≤ 32 * (Real.exp (1 / 4) - 1) * σ ^ 2 := by
  have hu0 : 0 < 1 / (2 * σ) := one_div_pos.2 (mul_pos (by norm_num) hσ)
  have hWin : |1 / (2 * σ)| ≤ 1 / (2 * σ) := by rw [abs_of_nonneg (le_of_lt hu0)]
  have hWin' : |-(1 / (2 * σ))| ≤ 1 / (2 * σ) := by rw [abs_neg]; exact hWin
  have hplus := h (1 / (2 * σ)) hWin
  have hminus : ∑ i ∈ supp p, p i * Real.exp (-(1 / (2 * σ)) * dev p i)
      ≤ Real.exp (σ ^ 2 * (1 / (2 * σ)) ^ 2) := by
    have hb := h (-(1 / (2 * σ))) hWin'
    have hsq : (-(1 / (2 * σ))) ^ 2 = (1 / (2 * σ)) ^ 2 := by ring
    rwa [hsq] at hb
  have hq : σ ^ 2 * (1 / (2 * σ)) ^ 2 = 1 / 4 := by
    field_simp
    ring
  have h1 := pair_var_bound hp hu0 hplus hminus
  rw [hq] at h1
  have hScale : (1 / (2 * σ)) ^ 2 * (32 * (Real.exp (1 / 4) - 1) * σ ^ 2)
      = 8 * (Real.exp (1 / 4) - 1) := by
    have hσ2 : σ ^ 2 ≠ 0 := pow_ne_zero 2 (ne_of_gt hσ)
    field_simp
    ring
  have hchain : (1 / (2 * σ)) ^ 2 * varK p
      ≤ (1 / (2 * σ)) ^ 2 * (32 * (Real.exp (1 / 4) - 1) * σ ^ 2) := by
    rw [hScale]
    exact h1
  exact (mul_le_mul_iff_of_pos_left (pow_pos hu0 2)).mp hchain

theorem t1b_window {p : ι → ℝ} (hp : IsSpectrum p) {σ ε : ℝ} (hσ : 0 < σ)
    (h : subG p σ) (hε : 0 < ε) (hε' : ε < 1) :
    W p ε ≤ σ * (2 * Real.log (2 / ε) + 1 / 2) := by
  have hu0 : 0 < 1 / (2 * σ) := one_div_pos.2 (mul_pos (by norm_num) hσ)
  have hWin : |1 / (2 * σ)| ≤ 1 / (2 * σ) := by rw [abs_of_nonneg (le_of_lt hu0)]
  have hWin' : |-(1 / (2 * σ))| ≤ 1 / (2 * σ) := by rw [abs_neg]; exact hWin
  have hplus := h (1 / (2 * σ)) hWin
  have hminus : ∑ i ∈ supp p, p i * Real.exp (-(1 / (2 * σ)) * dev p i)
      ≤ Real.exp (σ ^ 2 * (1 / (2 * σ)) ^ 2) := by
    have hb := h (-(1 / (2 * σ))) hWin'
    have hsq : (-(1 / (2 * σ))) ^ 2 = (1 / (2 * σ)) ^ 2 := by ring
    rwa [hsq] at hb
  have hlog : Real.log (2 / ε) = Real.log 2 - Real.log ε :=
    Real.log_div (by norm_num) hε.ne'
  have hLt : (1 : ℝ) < 2 / ε := by rw [one_lt_div hε]; linarith
  have hlogpos : 0 < Real.log (2 / ε) := Real.log_pos hLt
  have ht : Real.log 2 + σ ^ 2 * (1 / (2 * σ)) ^ 2
      ≤ Real.log ε + (1 / (2 * σ)) * (σ * (2 * Real.log (2 / ε) + 1 / 2)) := by
    have hq : σ ^ 2 * (1 / (2 * σ)) ^ 2 = 1 / 4 := by
      field_simp
      ring
    have hut : (1 / (2 * σ)) * (σ * (2 * Real.log (2 / ε) + 1 / 2))
        = Real.log (2 / ε) + 1 / 4 := by
      field_simp
      ring
    rw [hq, hut, hlog]
    linarith
  have hnn : 0 ≤ σ * (2 * Real.log (2 / ε) + 1 / 2) := by
    have h2 : (0:ℝ) ≤ 2 * Real.log (2 / ε) + 1 / 2 := by linarith
    exact mul_nonneg (le_of_lt hσ) h2
  exact W_le_of_mem hp (le_of_lt hε) ⟨hnn, pair_tail_bound hp hu0 hε hplus hminus ht⟩

/-! ## T1c — the class instance at MarginalTails' constant (FIND #3 constants) -/

theorem t1c {p : ι → ℝ} (hp : IsSpectrum p) {θ B : ℝ} (hθ : 0 < θ) (hB : 1 ≤ B)
    (hC : InSubGClass p θ B) {ε : ℝ} (hε : 0 < ε) (hε' : ε < 1) :
    varK p ≤ 8192 * (Real.exp (Real.exp 1 / 2) - 1) * (1 + θ) * B ∧
      W p ε ≤ 32 * Real.sqrt ((1 + θ) * B) * (Real.log (2 / ε) + Real.exp 1 / 2) := by
  obtain ⟨hp', hB', hmgf⟩ := hC
  have hBpos : 0 < B := lt_of_lt_of_le (by norm_num) hB
  have h1p : 0 < 1 + θ := by linarith
  have hs : 0 < Real.sqrt ((1 + θ) * B) :=
    Real.sqrt_pos.mpr (by nlinarith [hθ, hBpos])
  set δ := 1 / (32 * Real.sqrt ((1 + θ) * B)) with hδ
  set v := 512 * Real.exp 1 * θ * B with hv
  have hδ0 : 0 < δ := by
    rw [hδ]
    exact one_div_pos.2 (mul_pos (by norm_num) hs)
  have hδ2 : δ ^ 2 = 1 / (1024 * (1 + θ) * B) := by
    have hs0 : (0:ℝ) ≤ (1 + θ) * B := mul_nonneg (le_of_lt h1p) (le_of_lt hBpos)
    have hsq : (32 * Real.sqrt ((1 + θ) * B)) ^ 2 = 1024 * ((1 + θ) * B) := by
      rw [mul_pow, Real.sq_sqrt hs0]
      norm_num
    rw [hδ]
    rw [div_pow, hsq, one_pow]
    ring
  have hBne : B ≠ 0 := ne_of_gt hBpos
  have h1pne : 1 + θ ≠ 0 := ne_of_gt h1p
  have hvδ : v * δ ^ 2 = Real.exp 1 * θ / (2 * (1 + θ)) := by
    rw [hδ2, hv]
    field_simp
    ring
  have hvδle : v * δ ^ 2 ≤ Real.exp 1 / 2 := by
    have h2 : θ / (2 * (1 + θ)) ≤ 1 / 2 := by
      rw [div_le_iff₀ (mul_pos (by norm_num) h1p)]
      linarith
    calc v * δ ^ 2 = Real.exp 1 * θ / (2 * (1 + θ)) := hvδ
      _ = Real.exp 1 * (θ / (2 * (1 + θ))) := by ring
      _ ≤ Real.exp 1 * (1 / 2) := mul_le_mul_of_nonneg_left h2 (Real.exp_nonneg _)
      _ = Real.exp 1 / 2 := by ring
  have hWin : |δ| ≤ δ := le_of_eq (abs_of_nonneg (le_of_lt hδ0))
  have hWin' : |-δ| ≤ δ := by rw [abs_neg]; exact hWin
  have hplus := hmgf δ hWin
  have hminus : ∑ i ∈ supp p, p i * Real.exp (-δ * dev p i) ≤ Real.exp (v * δ ^ 2) := by
    have hb := hmgf (-δ) hWin'
    have hsq : (-δ) ^ 2 = δ ^ 2 := by ring
    rwa [hsq] at hb
  constructor
  · have h1 := pair_var_bound hp hδ0 hplus hminus
    have hExp : Real.exp (v * δ ^ 2) ≤ Real.exp (Real.exp 1 / 2) :=
      Real.exp_le_exp.mpr hvδle
    have hT : δ ^ 2 * (8192 * (Real.exp (Real.exp 1 / 2) - 1) * (1 + θ) * B)
        = 8 * (Real.exp (Real.exp 1 / 2) - 1) := by
      rw [hδ2]
      field_simp
      ring
    have hchain : δ ^ 2 * varK p
        ≤ δ ^ 2 * (8192 * (Real.exp (Real.exp 1 / 2) - 1) * (1 + θ) * B) := by
      rw [hT]
      have hExp2 : Real.exp (v * δ ^ 2) - 1 ≤ Real.exp (Real.exp 1 / 2) - 1 :=
        sub_le_sub_right hExp _
      linarith [h1, hExp2]
    exact (mul_le_mul_iff_of_pos_left (pow_pos hδ0 2)).mp hchain
  · have hlog : Real.log (2 / ε) = Real.log 2 - Real.log ε :=
      Real.log_div (by norm_num) hε.ne'
    have hLt : (1 : ℝ) < 2 / ε := by rw [one_lt_div hε]; linarith
    have hlogpos : 0 < Real.log (2 / ε) := Real.log_pos hLt
    have hut : δ * (32 * Real.sqrt ((1 + θ) * B) * (Real.log (2 / ε) + Real.exp 1 / 2))
        = Real.log (2 / ε) + Real.exp 1 / 2 := by
      rw [hδ]
      field_simp
    have ht : Real.log 2 + v * δ ^ 2 ≤ Real.log ε + δ *
        (32 * Real.sqrt ((1 + θ) * B) * (Real.log (2 / ε) + Real.exp 1 / 2)) := by
      rw [hut, hlog]
      linarith [hvδle]
    have htnn : 0 ≤ 32 * Real.sqrt ((1 + θ) * B) * (Real.log (2 / ε) + Real.exp 1 / 2) := by
      have h1 : (0:ℝ) ≤ 32 * Real.sqrt ((1 + θ) * B) := mul_nonneg (by norm_num) (le_of_lt hs)
      have h2 : (0:ℝ) ≤ Real.log (2 / ε) + Real.exp 1 / 2 := by
        have hE1 : (0:ℝ) ≤ Real.exp 1 := Real.exp_nonneg 1
        linarith
      exact mul_nonneg h1 h2
    exact W_le_of_mem hp (le_of_lt hε) ⟨htnn, pair_tail_bound hp hδ0 hε hplus hminus ht⟩

/-! ## T2 — certificate padding and ceiling monotonicity -/

/-- The zero-padding injection (T2's map): `a ∘ castLE`, zero on the new coordinate. -/
noncomputable def padA {k : ℕ} (a : Fin k → ℝ) : Fin (k + 1) → ℝ :=
  fun j => if hj : ((j : ℕ) < k) then a ⟨(j : ℕ), hj⟩ else 0

private lemma padA_castSucc {k : ℕ} (a : Fin k → ℝ) (j : Fin k) :
    padA a (Fin.castSucc j) = a j := by
  have hlt : ((Fin.castSucc (j : Fin k) : Fin (k + 1)) : ℕ) < k := by simpa using j.isLt
  show (if hj : ((Fin.castSucc (j : Fin k) : Fin (k + 1)) : ℕ) < k
      then a ⟨((Fin.castSucc (j : Fin k) : Fin (k + 1)) : ℕ), hj⟩ else 0) = a j
  rw [dif_pos hlt]
  rfl

private lemma padA_last {k : ℕ} (a : Fin k → ℝ) : padA a (Fin.last k) = 0 := by
  show (if hj : (((Fin.last k : Fin (k + 1)) : ℕ) < k)
      then a ⟨((Fin.last k : Fin (k + 1)) : ℕ), hj⟩ else 0) = 0
  rw [dif_neg (by simp)]

theorem cert_pad {F : (ι → ℝ) → ℝ} {k : ℕ} {c₀ : ℝ} {a : Fin k → ℝ}
    (h : CertValid F k c₀ a) : ∃ a' : Fin (k + 1) → ℝ, CertValid F (k + 1) c₀ a' := by
  refine ⟨padA a, fun q hq => ?_⟩
  have key : ∑ j : Fin (k + 1), padA a j * datum q (k + 1) j
      = ∑ j : Fin k, a j * datum q k j := by
    rw [Fin.sum_univ_castSucc, padA_last, zero_mul, add_zero]
    exact Finset.sum_congr rfl (fun j _ => by rw [padA_castSucc]; rfl)
  show c₀ + ∑ j : Fin (k + 1), padA a j * datum q (k + 1) j ≤ F q
  rw [key]
  exact h q hq

/-- **T2 (ceiling monotonicity, guarded form).** `B_k(F) ≤ B_{k+1}(F)` whenever the
k-certificate set is nonempty and the (k+1)-certificate set is bounded above (the
ceilings are only meaningful then; the padding injection is `cert_pad`). -/
theorem Bk_le_Bk_succ {F : (ι → ℝ) → ℝ} {k : ℕ}
    (hne : {c₀ : ℝ | ∃ a : Fin k → ℝ, CertValid F k c₀ a}.Nonempty)
    (hB : BddAbove {c₀ : ℝ | ∃ a : Fin (k + 1) → ℝ, CertValid F (k + 1) c₀ a}) :
    Bk F k ≤ Bk F (k + 1) := by
  refine csSup_le hne ?_
  intro x hx
  obtain ⟨a, ha⟩ := hx
  obtain ⟨a', ha'⟩ := cert_pad ha
  exact le_csSup hB ⟨a', ha'⟩

/-! ## T4 — the corrected floor + subgaussian ceiling on the class family (FIND #4) -/

/-- **T4 (corrected, family form; consumer = AreaLaw2D 3D target C.3).** Under an
hSubG-class family `P` at scale B (FIND #2's centered MarginalTails constant carried)
and the inventoried binder `hVarLB` (extremal-family variance floor — the P1
hypothesis the dossier's tightness reading needs; the o(√B) clause itself is
class-level = shape (i) = P2, FIND #4): the corrected floor and the explicit ceiling
both hold at every scale. -/
theorem t4_floor_ceiling {P : ℝ → ι → ℝ} {θ κ ε : ℝ} (hθ : 0 < θ) (hκ : 0 < κ)
    (hε : 0 < ε) (hε' : ε < 1)
    (hClass : ∀ B : ℝ, 1 ≤ B → InSubGClass (P B) θ B)
    (hVarLB : ∀ B : ℝ, 1 ≤ B → κ * B ≤ varK (P B)) (B : ℝ) (hB : 1 ≤ B) :
    κ * B - ε * (Mdev (P B)) ^ 2 ≤ (1 - ε) * (W (P B) ε) ^ 2 ∧
      W (P B) ε ≤ 32 * Real.sqrt ((1 + θ) * B) * (Real.log (2 / ε) + Real.exp 1 / 2) := by
  obtain ⟨hpB, hB', hmgf⟩ := hClass B hB
  constructor
  · have hfloor := t1a_floor hpB hε hε'
    have hLB := hVarLB B hB
    linarith
  · exact (t1c hpB hθ hB ⟨hpB, hB', hmgf⟩ hε hε').2

/-! ## Full-coverage audit tail (expect the triad only, 0 sorryAx) -/

#print axioms t1a_floor
#print axioms t1b
#print axioms t1b_window
#print axioms t1c
#print axioms cert_pad
#print axioms Bk_le_Bk_succ
#print axioms t4_floor_ceiling

end CrossMath.Pilot74P1

namespace CrossMath.Pilot74P1

open Real Topology

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-! ## Part P2-a/P2-b (new, the G2 landing) — sharp constants via the sharp pair bound
and the right-window limit (route 1.5 per G1; statements frozen in the P2 precharter) -/

/-- The SHARP pair bound, nonnegative case (route 1.5's key, deriv form): for `x ≥ 0`,
`x ^ 2 ≤ exp x + exp (-x) - 2`. Two `monotoneOn_of_deriv_nonneg` layers (G1 pin,
Analysis/Calculus/Deriv/MeanValue.lean:413): `ψ := exp t - exp (-t) - 2t` has
`ψ' = exp t + exp (-t) - 2 ≥ 0` ELEMENTARILY (`add_one_le_exp` at `±t` sums to ≥ 2),
so `ψ ≥ ψ(0) = 0` on `[0, ∞)`; then `φ := exp t + exp (-t) - 2 - t ^ 2` has `φ' = ψ`,
so `φ ≥ φ(0) = 0`. The elementary route caps at constant 1/2 (squaring the linear
bounds gives `(1+t/2)^2 + (1-t/2)^2 - 2 = t^2/2`) — the sharp constant 1 genuinely
needs this monotone-derivative argument. -/
private lemma exp_pair_sharp_pos (x : ℝ) (hx : 0 ≤ x) :
    x ^ 2 ≤ Real.exp x + Real.exp (-x) - 2 := by
  -- ψ := exp t - exp (-t) - 2 * t ; ψ' = exp t + exp (-t) - 2 ≥ 0
  have hψd : ∀ t : ℝ, HasDerivAt (fun t : ℝ => Real.exp t - Real.exp (-t) - 2 * t)
      (Real.exp t + Real.exp (-t) - 2) t := by
    intro t
    have hneg : HasDerivAt (fun t : ℝ => -t) (-1) t := hasDerivAt_neg' t
    have he : HasDerivAt (fun t : ℝ => Real.exp (-t)) (Real.exp (-t) * (-1)) t :=
      hneg.exp
    have hsum : HasDerivAt (fun t : ℝ => Real.exp t - Real.exp (-t))
        (Real.exp t - Real.exp (-t) * (-1)) t := (hasDerivAt_exp t).sub he
    have h2t : HasDerivAt (fun t : ℝ => 2 * t) 2 t := by
      have h := (hasDerivAt_id t).const_mul 2
      exact h.congr_deriv (by ring)
    exact (hsum.sub h2t).congr_deriv (by ring)
  have hψdiff : Differentiable ℝ (fun t : ℝ => Real.exp t - Real.exp (-t) - 2 * t) :=
    fun t => (hψd t).differentiableAt
  have hψnn : ∀ t : ℝ, 0 ≤ deriv (fun t : ℝ => Real.exp t - Real.exp (-t) - 2 * t) t := by
    intro t
    rw [(hψd t).deriv]
    have h1 : t + 1 ≤ Real.exp t := Real.add_one_le_exp t
    have h2 : -t + 1 ≤ Real.exp (-t) := Real.add_one_le_exp (-t)
    linarith
  have hψmono : MonotoneOn (fun t : ℝ => Real.exp t - Real.exp (-t) - 2 * t) (Set.Ici 0) :=
    monotoneOn_of_deriv_nonneg (convex_Ici 0) hψdiff.continuous.continuousOn
      hψdiff.differentiableOn (fun t _ => hψnn t)
  have hψge : ∀ t : ℝ, 0 ≤ t → 0 ≤ Real.exp t - Real.exp (-t) - 2 * t := by
    intro t ht
    have h0 : (0:ℝ) ∈ Set.Ici 0 := Set.mem_Ici.2 le_rfl
    have ht' : t ∈ Set.Ici 0 := Set.mem_Ici.2 ht
    have hle := hψmono h0 ht' ht
    have hψ0 : (fun t : ℝ => Real.exp t - Real.exp (-t) - 2 * t) 0 = 0 := by norm_num
    rw [hψ0] at hle
    exact hle
  -- φ := exp t + exp (-t) - 2 - t ^ 2 ; φ' = ψ ≥ 0 on [0, ∞)
  have hφd : ∀ t : ℝ, HasDerivAt (fun t : ℝ => Real.exp t + Real.exp (-t) - 2 - t ^ 2)
      (Real.exp t - Real.exp (-t) - 2 * t) t := by
    intro t
    have hneg : HasDerivAt (fun t : ℝ => -t) (-1) t := hasDerivAt_neg' t
    have he : HasDerivAt (fun t : ℝ => Real.exp (-t)) (Real.exp (-t) * (-1)) t :=
      hneg.exp
    have hsum : HasDerivAt (fun t : ℝ => Real.exp t + Real.exp (-t))
        (Real.exp t + Real.exp (-t) * (-1)) t := (hasDerivAt_exp t).add he
    have hsub2 : HasDerivAt (fun t : ℝ => Real.exp t + Real.exp (-t) - 2)
        (Real.exp t + Real.exp (-t) * (-1) - 0) t :=
      hsum.sub (hasDerivAt_const t 2)
    have hq : HasDerivAt (fun t : ℝ => t ^ 2) (2 * t) t := by
      have h := (hasDerivAt_id' (𝕜 := ℝ) (x := t)).pow 2
      exact h.congr_deriv (by ring)
    exact (hsub2.sub hq).congr_deriv (by ring)
  have hφdiff : Differentiable ℝ (fun t : ℝ => Real.exp t + Real.exp (-t) - 2 - t ^ 2) :=
    fun t => (hφd t).differentiableAt
  have hφmono : MonotoneOn (fun t : ℝ => Real.exp t + Real.exp (-t) - 2 - t ^ 2) (Set.Ici 0) := by
    refine monotoneOn_of_deriv_nonneg (convex_Ici 0) hφdiff.continuous.continuousOn
      hφdiff.differentiableOn (fun t ht => ?_)
    rw [(hφd t).deriv]
    exact hψge t (interior_subset ht)
  have h0 : (0:ℝ) ∈ Set.Ici 0 := Set.mem_Ici.2 le_rfl
  have hx' : x ∈ Set.Ici 0 := Set.mem_Ici.2 hx
  have hle := hφmono h0 hx' hx
  have hφ0 : (fun t : ℝ => Real.exp t + Real.exp (-t) - 2 - t ^ 2) 0 = 0 := by norm_num
  rw [hφ0] at hle
  have hbeta : (0:ℝ) ≤ Real.exp x + Real.exp (-x) - 2 - x ^ 2 := by simpa using hle
  linarith

/-- The SHARP pair bound (full, by evenness): `x ^ 2 ≤ exp x + exp (-x) - 2` for all
real `x` (P1's `exp_pair_bound` at constant 4 → 1). -/
private lemma exp_pair_sharp (x : ℝ) :
    x ^ 2 ≤ Real.exp x + Real.exp (-x) - 2 := by
  by_cases hx : 0 ≤ x
  · exact exp_pair_sharp_pos x hx
  · have hx' : 0 ≤ -x := neg_nonneg.mpr (not_le.mp hx).le
    have h := exp_pair_sharp_pos (-x) hx'
    have hsum : Real.exp (-x) + Real.exp (-(-x)) = Real.exp x + Real.exp (-x) := by
      rw [neg_neg]
      ring
    have hsq : ((-x : ℝ)) ^ 2 = x ^ 2 := by ring
    rw [hsq, hsum] at h
    exact h

private lemma pair_var_sharp {p : ι → ℝ} {v u₀ : ℝ} (hp : IsSpectrum p) (hu₀ : 0 < u₀)
    (hplus : ∑ i ∈ supp p, p i * Real.exp (u₀ * dev p i) ≤ Real.exp (v * u₀ ^ 2))
    (hminus : ∑ i ∈ supp p, p i * Real.exp (-u₀ * dev p i) ≤ Real.exp (v * u₀ ^ 2)) :
    u₀ ^ 2 * varK p ≤ 2 * (Real.exp (v * u₀ ^ 2) - 1) := by
  have hsum : ∑ i ∈ supp p, p i * (u₀ * dev p i) ^ 2 = u₀ ^ 2 * varK p := by
    rw [varK_eq hp, Finset.mul_sum]
    exact Finset.sum_congr rfl (fun i _ => by ring)
  have hpt : ∀ i ∈ supp p, p i * (u₀ * dev p i) ^ 2
      ≤ p i * (Real.exp (u₀ * dev p i) + Real.exp (-(u₀ * dev p i)) - 2) := fun i _ =>
    mul_le_mul_of_nonneg_left (exp_pair_sharp (u₀ * dev p i)) (hp.1 i)
  have h1 : u₀ ^ 2 * varK p
      ≤ ∑ i ∈ supp p, p i * (Real.exp (u₀ * dev p i) + Real.exp (-(u₀ * dev p i)) - 2) :=
    hsum.symm.trans_le (Finset.sum_le_sum hpt)
  have hE : ∀ i ∈ supp p, p i * (Real.exp (u₀ * dev p i) + Real.exp (-(u₀ * dev p i)) - 2)
      = (p i * Real.exp (u₀ * dev p i))
        + ((p i * Real.exp (-(u₀ * dev p i))) - 2 * p i) := fun i _ => by ring
  have hDist : ∑ i ∈ supp p, p i * (Real.exp (u₀ * dev p i) + Real.exp (-(u₀ * dev p i)) - 2)
      = ∑ i ∈ supp p, p i * Real.exp (u₀ * dev p i)
        + ∑ i ∈ supp p, ((p i * Real.exp (-(u₀ * dev p i))) - 2 * p i) := by
    rw [Finset.sum_congr rfl hE, Finset.sum_add_distrib]
  rw [hDist] at h1
  have hInner : ∑ i ∈ supp p, ((p i * Real.exp (-(u₀ * dev p i))) - 2 * p i)
      = ∑ i ∈ supp p, p i * Real.exp (-(u₀ * dev p i)) - 2 := by
    rw [Finset.sum_sub_distrib, ← Finset.mul_sum, supp_sum_eq_one hp, mul_one]
  rw [hInner] at h1
  have hconv2 : ∑ i ∈ supp p, p i * Real.exp (-u₀ * dev p i)
      = ∑ i ∈ supp p, p i * Real.exp (-(u₀ * dev p i)) :=
    Finset.sum_congr rfl (fun i _ => by rw [← neg_mul])
  rw [hconv2] at hminus
  nlinarith [h1, hplus, hminus]

/-- The exponential-envelope weakening `exp y - 1 ≤ y * exp y` (elementary from
`Real.add_one_le_exp` at `-y`). -/
private lemma exp_sub_one_le (y : ℝ) : Real.exp y - 1 ≤ y * Real.exp y := by
  have h2 : -y + 1 ≤ Real.exp (-y) := Real.add_one_le_exp _
  have h3 : (-y + 1) * Real.exp y ≤ Real.exp (-y) * Real.exp y :=
    mul_le_mul_of_nonneg_right h2 (Real.exp_nonneg y)
  have h5 : Real.exp (-y) * Real.exp y = 1 := by
    rw [← Real.exp_add]
    simp
  have h6 : Real.exp y - y * Real.exp y ≤ 1 := by
    have h7 : (-y + 1) * Real.exp y = Real.exp y - y * Real.exp y := by ring
    rw [← h7]
    exact h3.trans_eq (by rw [h5])
  linarith

/-- **P2-a (G2)** — the sharp variance constant, window-free (the limit-argument
upgrade of `t1b`; the dossier T1(b)'s original `Var ≤ 2σ²` at last). From the CENTERED
bound on ANY positive window: the sharp pair bound at every window point gives
`u ^ 2 · varK ≤ 2 (exp (v u ^ 2) - 1)`, the envelope weakens it to
`varK ≤ 2 v · exp (v u ^ 2)`, and `ge_of_tendsto` at `𝓝[>] 0` (continuity of the
envelope, G1-pinned API) lands the sharp `2v`. Route 1.5 per G1: the sharp constant
without the second-derivative-at-local-min lemma (absent on-pin). -/
theorem mgfBound_var_sharp {p : ι → ℝ} (hp : IsSpectrum p) {v δ : ℝ} (hv : 0 ≤ v)
    (hδ : 0 < δ) (h : mgfBound p v δ) : varK p ≤ 2 * v := by
  have hpair : ∀ u : ℝ, 0 < u → u ≤ δ →
      u ^ 2 * varK p ≤ 2 * (Real.exp (v * u ^ 2) - 1) := by
    intro u hu0 huδ
    have hWin : |u| ≤ δ := by rw [abs_of_nonneg (le_of_lt hu0)]; exact huδ
    have hWin' : |-u| ≤ δ := by rw [abs_neg]; exact hWin
    have hplus := h u hWin
    have hminus : ∑ i ∈ supp p, p i * Real.exp (-u * dev p i) ≤ Real.exp (v * u ^ 2) := by
      have hb := h (-u) hWin'
      have hsq : (-u) ^ 2 = u ^ 2 := by ring
      rwa [hsq] at hb
    exact pair_var_sharp hp hu0 hplus hminus
  have henv : ∀ u : ℝ, 0 < u → u ≤ δ → varK p ≤ 2 * v * Real.exp (v * u ^ 2) := by
    intro u hu0 huδ
    have h1 := hpair u hu0 huδ
    have h2 : Real.exp (v * u ^ 2) - 1 ≤ (v * u ^ 2) * Real.exp (v * u ^ 2) :=
      exp_sub_one_le (v * u ^ 2)
    have h3 : u ^ 2 * varK p ≤ u ^ 2 * (2 * v * Real.exp (v * u ^ 2)) := by
      have h3' : 2 * (Real.exp (v * u ^ 2) - 1)
          ≤ 2 * ((v * u ^ 2) * Real.exp (v * u ^ 2)) :=
        mul_le_mul_of_nonneg_left h2 (by norm_num)
      have h4 : u ^ 2 * (2 * v * Real.exp (v * u ^ 2))
          = 2 * ((v * u ^ 2) * Real.exp (v * u ^ 2)) := by ring
      rw [h4]
      linarith
    exact (mul_le_mul_iff_of_pos_left (pow_pos hu0 2)).mp h3
  have hcont : Continuous (fun u : ℝ => 2 * v * Real.exp (v * u ^ 2)) := by continuity
  have hcw : ContinuousWithinAt (fun u : ℝ => 2 * v * Real.exp (v * u ^ 2)) (Set.Ioi 0) 0 :=
    hcont.continuousAt.continuousWithinAt
  have hT : Filter.Tendsto (fun u : ℝ => 2 * v * Real.exp (v * u ^ 2))
      (𝓝[>] (0:ℝ)) (𝓝 (2 * v * Real.exp (v * 0 ^ 2))) := hcw.tendsto
  have hEv : ∀ᶠ u in 𝓝[>] (0:ℝ), varK p ≤ 2 * v * Real.exp (v * u ^ 2) := by
    rw [eventually_nhdsWithin_iff]
    have hmem : {x : ℝ | x ∈ Set.Ioi 0 → varK p ≤ 2 * v * Real.exp (v * x ^ 2)} ∈ 𝓝 (0:ℝ) := by
      have hioo : (0:ℝ) ∈ Set.Ioo (-δ) δ := Set.mem_Ioo.2 ⟨by linarith, hδ⟩
      apply Filter.mem_of_superset (isOpen_Ioo.mem_nhds hioo)
      intro x hx hx0
      exact henv x (Set.mem_Ioi.1 hx0) (le_of_lt hx.2)
    exact hmem
  have hfinal := ge_of_tendsto hT hEv
  have hzero : Real.exp (v * 0 ^ 2) = 1 := by simp
  rw [hzero] at hfinal
  simpa using hfinal

/-- **P2-b (G2)** — the MarginalTails sharp class constant (T1c's variance half at the
dossier's exact `1024 = 2·512`): pure instantiation of P2-a at the class window
`v := 512·e·θ·B`, `δ := 1/(32 √((1+θ)B)) > 0` — window-free sharpness makes the
instantiation total (no σ-window matching; the P1 `t1b`→`t1c` gymnastics disappear).
The window clause of `t1c` stays as P1 proved it. -/
theorem t1c_sharp {p : ι → ℝ} (hp : IsSpectrum p) {θ B : ℝ} (hθ : 0 < θ) (hB : 1 ≤ B)
    (hC : InSubGClass p θ B) : varK p ≤ 1024 * Real.exp 1 * θ * B := by
  obtain ⟨hp', hB', hmgf⟩ := hC
  have hBpos : 0 < B := lt_of_lt_of_le (by norm_num) hB
  have hs : 0 < Real.sqrt ((1 + θ) * B) :=
    Real.sqrt_pos.mpr (by nlinarith [hθ, hBpos])
  have hδ0 : 0 < 1 / (32 * Real.sqrt ((1 + θ) * B)) :=
    one_div_pos.2 (mul_pos (by norm_num) hs)
  have hv0 : 0 ≤ 512 * Real.exp 1 * θ * B := by positivity
  have hsharp := mgfBound_var_sharp hp hv0 hδ0 hmgf
  calc varK p ≤ 2 * (512 * Real.exp 1 * θ * B) := hsharp
    _ = 1024 * Real.exp 1 * θ * B := by ring

/-! ## G3 PROBE (statement rung, elaboration-only — NOT a proof artifact for the
probed facts; the P2-c gate per the precharter (d)): the FIND-#1 n-atom family
(heavy atom `1/2`, `n` tail atoms `1/(2n)`) and its class-membership inequality at
`B := (log n) ^ 2` (the family realizes `Var ≈ B/4`; two atoms provably cannot —
`Var` bounded at ≈ 0.55). Pass = the Props elaborate on-pin; the marginal-θ truth
risk is exactly what gates the P2-c proof investment. -/

/-- The FIND-#1 extremal family (one heavy atom at 1/2, n tail atoms at 1/(2n)). -/
noncomputable def famN (n : ℕ) : Fin (n + 1) → ℝ :=
  fun i => if (i : ℕ) = 0 then 1 / 2 else 1 / (2 * (n : ℝ))

/-- G3 probe Prop 1 — the family is a spectrum and a class member at scale
`B = (log n) ^ 2` (the MARGINAL membership inequality; the known risk is small θ). -/
def famClassMemProbe (θ : ℝ) (n : ℕ) : Prop :=
  IsSpectrum (famN n) ∧ InSubGClass (famN n) θ ((Real.log (n : ℝ)) ^ 2)

/-- G3 probe Prop 2 — the family discharges `hVarLB` at a uniform κ (the honest κ is
tightened at P2-c from the exact varK computation; κ = 1/8 recorded as the probe
instance). -/
def famVarLBProbe (κ : ℝ) (n : ℕ) : Prop :=
  κ * (Real.log (n : ℝ)) ^ 2 ≤ varK (famN n)

/-- G3 probe Prop 3 — the W-side of the marking bound on the family (`W_ε` stays
bounded; the FIND-#1 counterexample shape used constructively). -/
def famTailProbe (ε : ℝ) (n : ℕ) : Prop :=
  W (famN n) ε ≤ 4 + Real.log 2

#print axioms mgfBound_var_sharp
#print axioms t1c_sharp
#check @famClassMemProbe
#check @famVarLBProbe
#check @famTailProbe

end CrossMath.Pilot74P1
