/-
Pilot ZZV2-λ — P1 `ZZLam` λ-abstract statement layer (r5-iteration4-backlog §12a P1;
zzv2-lambda-prework §1–§2 ladder L0+L1+L2 + L4-at-binder-level). PROOF ARTIFACT
(sorry-strict): every theorem below is proved from the ZetaZerosV2 donor's λ-generic
transfer layer (`Zeta/Transfer.lean:126/:151`, `Zeta/TransferBounds.lean:35/:63`) plus
λ-free asymptotic bookkeeping (`Zeta/Proportion.lean`, `Zeta/Asymptotics.lean`) — the
ONE non-donor input is the explicit binder `hKS : KSAsymptotic`, mirroring
`kernelConstruction` (`Zeta/Kernel.lean:995`) minus its frozen λ=1/2 constant
identification. That subtraction is exactly the P0(b) MT-frozen seam (P0-record.md):
the Landau bridge is proved only at `cutoffTest ψ` kernels; discharging `KSAsymptotic`
at new λ-kernels is a Landau η-port = charter decision (iteration 5), NOT this cycle.

BILLING: technical record / engineering — this is NOT a discovery and never an article.
The informal λ-dependence is Lamzouri's content (must-cite; donor's cited source for the
>2/3 + three further proportions; Montgomery ICF 1974 pair-correlation framework;
Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh 2024 Lemma 5). Novelty = the Lean
λ-layer (novelty/iter4-seed-triage.md row 2, KNOWN-INFORMAL, corpus-collision NONE).

P0 pins consumed here (P0-record.md pin table):
  (a) endpoints λ-generic, no numeric λ-range — L0 carries only `0 < lam`;
  (b) binder at the /zeroScale frontier (the primitive the frozen layer proves);
  (c) functionals `2 − c`, `3/2 − c/2`, `(5+2√2−2(c+d))/(3+2√2)` = the transfer
      functional shapes inline at the donor endpoints; NO closed form in `lam` is
      guessed (a cot-substitution at general λ would be informal content = P2 lemma,
      and P2 is hard-stopped per r5 §12a).
-/
import ZetaZeros

namespace ZZLam

open ZetaZeros Filter Topology

/-! ## L0 — the λ-bundle (zeta23 parameter-record model; range P0-pinned minimal) -/

/-- The λ-family parameter record. P0(a): the transfer endpoints impose NO numeric
λ-range — λ enters mathematics only through `IsAdmissible`'s support clause — so the
minimal honest range is positivity (an admissible η exists only for `0 < lam`: the
support clause kills `eta ≡ λ-window` content otherwise, contradicting the Fourier
normalisation `fourierC (η²) 0 = 1`). -/
structure LamParams where
  /-- The admissibility half-width: `eta` must vanish on `lam ≤ |x|`. -/
  lam : ℝ
  /-- Positivity (P0-pinned range; nothing narrower is honest at P1). -/
  hpos : 0 < lam

/-! ## L1 — the binder + the λ-family constants (donor vocabulary, no closed forms) -/

/-- **The P1 kernel-sum binder** — `kernelConstruction`'s output tuple
(`Zeta/Kernel.lean:995`) minus the frozen constant identification: an admissible
`lam`-kernel whose normalized kernel sum `Re (unweightedKernelSum η T) / zeroScale T`
tends to `c`. This ONE binder is everything the transfer layer needs beyond its own
hypotheses, and everything a Landau η-port would have to produce for new λ-kernels
(the frozen layer discharges it at `lam = 1/2` with `c` near `montgomeryTaylorConst`). -/
def KSAsymptotic (lam c : ℝ) : Prop :=
  ∃ eta : ℝ → ℝ,
    IsAdmissible lam eta ∧
      Filter.Tendsto (fun T => (unweightedKernelSum eta T).re / zeroScale T)
        Filter.atTop (nhds c)

/-- The simple-and-on-line proportion functional at kernel-asymptotic value `c`
(donor shape `2 − C`, the `simpleOnLineCount_lower` endpoint functional). -/
def C0Lam (c : ℝ) : ℝ := 2 - c

/-- The distinct (and average) proportion functional at kernel-asymptotic value `c`
(donor shape `3/2 − C/2`, the `distinctZeroCount_lower` endpoint functional). -/
noncomputable def C1Lam (c : ℝ) : ℝ := 3 / 2 - c / 2

/-- The simple-or-on-line proportion functional at `c` with slack `d` (donor shape
`(5 + 2√2 − 2·Ac)/(3 + 2√2)`, the `simpleOrOnLineCount_lower` A-form). -/
noncomputable def C2Lam (c d : ℝ) : ℝ := (5 + 2 * Real.sqrt 2 - 2 * (c + d)) / (3 + 2 * Real.sqrt 2)

/-- Admissibility windows widen monotonically: the same kernel witness serves every
`lam' ≥ lam`. (Family-domain pin: `KSAsymptotic lam c` is nonempty for a WIDER window
whenever it is nonempty at `lam`.) -/
theorem KSAsymptotic_mono {lam lam' c : ℝ} (h : KSAsymptotic lam c) (hlam : lam ≤ lam') :
    KSAsymptotic lam' c := by
  obtain ⟨eta, heta, hsum⟩ := h
  exact ⟨eta, ⟨heta.memLp, heta.even,
    fun x hx => heta.support x (hlam.trans hx), heta.fourier_sq_zero⟩, hsum⟩

/-- The frozen witness re-windowed: for every `lam ≥ 1/2` and `ε > 0` there is `c`
within `ε` of `montgomeryTaylorConst` with `KSAsymptotic lam c`. The family domain
contains `[1/2, ∞)` — via the FROZEN kernels (`kernelConstruction` states
`IsAdmissible (1/2) eta`), not new λ-kernels (P0(b): the η-port is out of cycle). -/
theorem exists_KSAsymptotic_of_half_le {lam : ℝ} (hlam : 1 / 2 ≤ lam) (ε : ℝ) (hε : 0 < ε) :
    ∃ c : ℝ, KSAsymptotic lam c ∧ |c - montgomeryTaylorConst| < ε := by
  obtain ⟨eta, C, heta, hC, hsum⟩ := kernelConstruction ε hε
  exact ⟨C, KSAsymptotic_mono ⟨eta, heta, hsum⟩ hlam, hC⟩

/-! ## Local copies of the donor's private bookkeeping (λ-free; cited verbatim) -/

/-- Copy of the donor's private `eventually_average_proportion`
(`ZetaZeros/Proportions.lean:32`, inaccessible cross-module): from `3N - S ≤ A`
and `S/N → C`, the average proportion is eventually above `3/2 - C/2 - ε`. -/
private theorem eventually_average_proportion_lam
    (N A S : ℝ → ℝ) (C ε : ℝ) (hε : 0 < ε)
    (hNpos : ∀ᶠ T in atTop, 0 < N T)
    (hS : Tendsto (fun T => S T / N T) atTop (nhds C))
    (hbound : ∀ᶠ T in atTop, 3 * N T - S T ≤ A T) :
    ∀ᶠ T in atTop, 3 / 2 - C / 2 - ε < A T / (2 * N T) := by
  have hlt : ∀ᶠ T in atTop, S T / N T < C + ε := (tendsto_order.1 hS).2 _ (by linarith)
  filter_upwards [hNpos, hlt, hbound] with T hNT hST hAT
  rw [lt_div_iff₀ (by linarith : (0 : ℝ) < 2 * N T)]
  have hSN : S T < (C + ε) * N T := (div_lt_iff₀ hNT).mp hST
  nlinarith

/-- Copy of the donor's private `eventually_le_mul_of_tendsto_ratio`
(`ZetaZeros/Proportions.lean:47`): once `S/N → C`, eventually `S ≤ (C + d) * N`. -/
private theorem eventually_le_mul_of_tendsto_ratio_lam
    (N S : ℝ → ℝ) (C d : ℝ) (hd : 0 < d)
    (hNpos : ∀ᶠ T in atTop, 0 < N T)
    (hS : Tendsto (fun T => S T / N T) atTop (nhds C)) :
    ∀ᶠ T in atTop, S T ≤ (C + d) * N T := by
  have hlt : ∀ᶠ T in atTop, S T / N T < C + d := (tendsto_order.1 hS).2 _ (by linarith)
  filter_upwards [hNpos, hlt] with T hNT hST
  exact le_of_lt ((div_lt_iff₀ hNT).mp hST)

/-! ## L2 — the λ-family statements (donor proved-endpoint shapes, constants generalized) -/

/-- **Family theorem 1 (simple and on the line).** At any admissible-λ kernel whose
normalized kernel sum tends to `c`: for every `ε > 0`, beyond some height the
simple-and-on-line proportion exceeds `C0Lam c - ε = 2 - c - ε`. λ-generalizes the
donor's `simple_proportion_lower` (`Main.lean`) modulo the constant. -/
theorem thm_simple_lam (P : LamParams) (c : ℝ) (hKS : KSAsymptotic P.lam c)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      C0Lam c - ε < (simpleOnLineCount T : ℝ) / (zeroCount T : ℝ) := by
  obtain ⟨eta, heta, hsum⟩ := hKS
  have hNscale := riemannVonMangoldt.tendsto
  have hscale : ∀ᶠ T : ℝ in atTop, zeroScale T ≠ 0 :=
    zeroScale_pos_eventually.mono fun _ h => ne_of_gt h
  have hratio : Tendsto
      (fun T => (unweightedKernelSum eta T).re / (zeroCount T : ℝ)) atTop (nhds c) :=
    tendsto_ratio_of_tendsto_div_scale _ _ _ _ hNscale hsum hscale
  have hNpos := riemannVonMangoldt.zeroCount_pos_eventually
  have hbound : ∀ᶠ T : ℝ in atTop,
      2 * (zeroCount T : ℝ) - (unweightedKernelSum eta T).re ≤
        (simpleOnLineCount T : ℝ) := by
    filter_upwards [eventually_gt_atTop (1 : ℝ), hNpos] with T hT hNT
    exact simpleOnLineCount_lower hT (nontrivialZeros_nonempty_of_zeroCount_pos hNT) heta
  exact eventually_atTop.1 <| eventually_simple_proportion
    (fun T => (zeroCount T : ℝ)) (fun T => (simpleOnLineCount T : ℝ))
    (fun T => (unweightedKernelSum eta T).re) c ε hε hNpos hratio hbound |>.mono
    fun T hT => by simpa only [C0Lam] using hT

/-- **Family theorem 2 (distinct).** Same binder: the distinct-zero proportion
eventually exceeds `C1Lam c - ε = 3/2 - c/2 - ε`. λ-generalizes the donor's
`distinct_proportion_lower` modulo the constant. -/
theorem thm_distinct_lam (P : LamParams) (c : ℝ) (hKS : KSAsymptotic P.lam c)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      C1Lam c - ε < (distinctZeroCount T : ℝ) / (zeroCount T : ℝ) := by
  obtain ⟨eta, heta, hsum⟩ := hKS
  have hNscale := riemannVonMangoldt.tendsto
  have hscale : ∀ᶠ T : ℝ in atTop, zeroScale T ≠ 0 :=
    zeroScale_pos_eventually.mono fun _ h => ne_of_gt h
  have hratio : Tendsto
      (fun T => (unweightedKernelSum eta T).re / (zeroCount T : ℝ)) atTop (nhds c) :=
    tendsto_ratio_of_tendsto_div_scale _ _ _ _ hNscale hsum hscale
  have hNpos := riemannVonMangoldt.zeroCount_pos_eventually
  have hbound : ∀ᶠ T : ℝ in atTop,
      3 / 2 * (zeroCount T : ℝ) - (unweightedKernelSum eta T).re / 2 ≤
        (distinctZeroCount T : ℝ) := by
    filter_upwards [eventually_gt_atTop (1 : ℝ), hNpos] with T hT hNT
    exact distinctZeroCount_lower hT (nontrivialZeros_nonempty_of_zeroCount_pos hNT) heta
  exact eventually_atTop.1 <| eventually_distinct_proportion
    (fun T => (zeroCount T : ℝ)) (fun T => (distinctZeroCount T : ℝ))
    (fun T => (unweightedKernelSum eta T).re) c ε hε hNpos hratio hbound |>.mono
    fun T hT => by simpa only [C1Lam] using hT

/-- **Family theorem 3 (average).** Same binder: the average of the simple and
on-line proportions eventually exceeds `C1Lam c - ε`. λ-generalizes the donor's
`average_proportion_lower` modulo the constant (via the local copy of its private
bookkeeping lemma). -/
theorem thm_average_lam (P : LamParams) (c : ℝ) (hKS : KSAsymptotic P.lam c)
    (ε : ℝ) (hε : 0 < ε) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      C1Lam c - ε <
        ((simpleZeroCount T : ℝ) + (onLineCount T : ℝ)) / (2 * (zeroCount T : ℝ)) := by
  obtain ⟨eta, heta, hsum⟩ := hKS
  have hNscale := riemannVonMangoldt.tendsto
  have hscale : ∀ᶠ T : ℝ in atTop, zeroScale T ≠ 0 :=
    zeroScale_pos_eventually.mono fun _ h => ne_of_gt h
  have hratio : Tendsto
      (fun T => (unweightedKernelSum eta T).re / (zeroCount T : ℝ)) atTop (nhds c) :=
    tendsto_ratio_of_tendsto_div_scale _ _ _ _ hNscale hsum hscale
  have hNpos := riemannVonMangoldt.zeroCount_pos_eventually
  have hbound : ∀ᶠ T : ℝ in atTop,
      3 * (zeroCount T : ℝ) - (unweightedKernelSum eta T).re ≤
        (simpleZeroCount T : ℝ) + (onLineCount T : ℝ) := by
    filter_upwards [eventually_gt_atTop (1 : ℝ), hNpos] with T hT hNT
    exact simpleZeroCount_add_onLineCount_lower hT
      (nontrivialZeros_nonempty_of_zeroCount_pos hNT) heta
  exact eventually_atTop.1 <| eventually_average_proportion_lam
    (fun T => (zeroCount T : ℝ)) (fun T => (simpleZeroCount T : ℝ) + (onLineCount T : ℝ))
    (fun T => (unweightedKernelSum eta T).re) c ε hε hNpos hratio hbound |>.mono
    fun T hT => by simpa only [C1Lam] using hT

/-- **Family theorem 4 (simple or on the line).** Same binder, plus the A-window
hypotheses the donor derives from its frozen constant bounds: with slack `ε/2` and
`1 ≤ c + ε/2 < 2`, the simple-or-on-line proportion eventually exceeds
`C2Lam c (ε/2) - ε`. λ-generalizes the donor's `simpleOrOnLine_proportion_lower`
modulo the constant. -/
theorem thm_simple_or_critical_lam (P : LamParams) (c : ℝ) (hKS : KSAsymptotic P.lam c)
    (ε : ℝ) (hε : 0 < ε) (hA1 : 1 ≤ c + ε / 2) (hA2 : c + ε / 2 < 2) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      C2Lam c (ε / 2) - ε < (simpleOrOnLineCount T : ℝ) / (zeroCount T : ℝ) := by
  obtain ⟨eta, heta, hsum⟩ := hKS
  have hNscale := riemannVonMangoldt.tendsto
  have hscale : ∀ᶠ T : ℝ in atTop, zeroScale T ≠ 0 :=
    zeroScale_pos_eventually.mono fun _ h => ne_of_gt h
  have hratio : Tendsto
      (fun T => (unweightedKernelSum eta T).re / (zeroCount T : ℝ)) atTop (nhds c) :=
    tendsto_ratio_of_tendsto_div_scale _ _ _ _ hNscale hsum hscale
  have hNpos := riemannVonMangoldt.zeroCount_pos_eventually
  have hle := eventually_le_mul_of_tendsto_ratio_lam
    (fun T => (zeroCount T : ℝ)) (fun T => (unweightedKernelSum eta T).re)
    c (ε / 2) (by positivity) hNpos hratio
  have hfinal : ∀ᶠ T : ℝ in atTop,
      C2Lam c (ε / 2) * (zeroCount T : ℝ) ≤ (simpleOrOnLineCount T : ℝ) := by
    filter_upwards [eventually_gt_atTop (1 : ℝ), hNpos, hle] with T hT hNT hbnd
    exact simpleOrOnLineCount_lower hT (nontrivialZeros_nonempty_of_zeroCount_pos hNT)
      heta hA1 hA2 hbnd
  refine eventually_atTop.1 ?_
  filter_upwards [hNpos, hfinal] with T hNT hT
  rw [lt_div_iff₀ hNT]
  calc (C2Lam c (ε / 2) - ε) * (zeroCount T : ℝ)
      < C2Lam c (ε / 2) * (zeroCount T : ℝ) :=
        mul_lt_mul_of_pos_right (by linarith) hNT
    _ ≤ (simpleOrOnLineCount T : ℝ) := hT

/-! ## L4 at binder level — λ = 1/2 regression (the donor's frozen point) -/

/-- **Regression 1.** Instantiating the family at the donor's own frozen point
(`kernelConstruction` states `IsAdmissible (1/2) eta`; the prework's "λ = 1" was the
informal paper's parameterization — the donor's admissibility point is `1/2`) and
discharging the binder with the frozen witness re-derives the donor's headline
`simple_proportion_lower` constant bit-for-bit: the family EXTENDS the frozen layer. -/
theorem thm_simple_lam_half_regression (ε : ℝ) (hε : 0 < ε) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      3 / 2 - (1 / Real.sqrt 2) * Real.cot (1 / Real.sqrt 2) - ε <
        (simpleOnLineCount T : ℝ) / (zeroCount T : ℝ) := by
  obtain ⟨eta, C, heta, hC, hsum⟩ := kernelConstruction (ε / 2) (by positivity)
  obtain ⟨T₀, hT₀⟩ :=
    thm_simple_lam ⟨1 / 2, by norm_num⟩ C ⟨eta, heta, hsum⟩ (ε / 2) (by positivity)
  refine ⟨T₀, fun T hT => ?_⟩
  have hconst : 3 / 2 - (1 / Real.sqrt 2) * Real.cot (1 / Real.sqrt 2) - ε
      < C0Lam C - ε / 2 := by
    rw [show 3 / 2 - (1 / Real.sqrt 2) * Real.cot (1 / Real.sqrt 2)
        = 2 - montgomeryTaylorConst from by rw [montgomeryTaylorConst]; ring]
    rw [abs_lt] at hC
    unfold C0Lam
    linarith
  exact hconst.trans (hT₀ T hT)

/-- **Regression 2.** Same at the distinct endpoint: the family at `lam = 1/2` with the
frozen witness re-derives the donor's `distinct_proportion_lower` constant bit-for-bit. -/
theorem thm_distinct_lam_half_regression (ε : ℝ) (hε : 0 < ε) :
    ∃ T₀ : ℝ, ∀ T ≥ T₀,
      5 / 4 - (1 / (2 * Real.sqrt 2)) * Real.cot (1 / Real.sqrt 2) - ε <
        (distinctZeroCount T : ℝ) / (zeroCount T : ℝ) := by
  obtain ⟨eta, C, heta, hC, hsum⟩ := kernelConstruction (ε / 2) (by positivity)
  obtain ⟨T₀, hT₀⟩ :=
    thm_distinct_lam ⟨1 / 2, by norm_num⟩ C ⟨eta, heta, hsum⟩ (ε / 2) (by positivity)
  refine ⟨T₀, fun T hT => ?_⟩
  have hconst : 5 / 4 - (1 / (2 * Real.sqrt 2)) * Real.cot (1 / Real.sqrt 2) - ε
      < C1Lam C - ε / 2 := by
    rw [show 5 / 4 - (1 / (2 * Real.sqrt 2)) * Real.cot (1 / Real.sqrt 2)
        = 3 / 2 - montgomeryTaylorConst / 2 from by rw [montgomeryTaylorConst]; ring]
    rw [abs_lt] at hC
    unfold C1Lam
    linarith
  exact hconst.trans (hT₀ T hT)

end ZZLam

/-! ## Full print surface (P1 audit: every top-level theorem incl. privates; expected
triad-only — the donor's consumed theorems are triad per P0's on-pin prints, and the
proofs add only λ-free bookkeeping). The axcheck_full-pattern sweep attaches at P3. -/

#print axioms ZZLam.KSAsymptotic_mono
#print axioms ZZLam.exists_KSAsymptotic_of_half_le
#print axioms ZZLam.eventually_average_proportion_lam
#print axioms ZZLam.eventually_le_mul_of_tendsto_ratio_lam
#print axioms ZZLam.thm_simple_lam
#print axioms ZZLam.thm_distinct_lam
#print axioms ZZLam.thm_average_lam
#print axioms ZZLam.thm_simple_or_critical_lam
#print axioms ZZLam.thm_simple_lam_half_regression
#print axioms ZZLam.thm_distinct_lam_half_regression
