/-
Pilot zzv2-lam η-port R8 — the TWO-ARM assembly + the threshold-corrected strict
improvement (iter-7 day-1, D2′(c); lane R8 worktree agent-05; grant = 1 fire +
1 axcheck run, record-billed per DECISION-2 = Option A).

What this file proves (the port plan `eta-port-plan.md` rung R8; the wrap
`zzv2-lam-port-wrap.md` §3):
  1. `exists_KSAsymptotic_of_pos_of_scaledBridge` — the full-domain assembly
     (`stmt_exists_KSAsymptotic_of_pos`, the P1 HARD-STOP ask "prove ∃ c,
     KSAsymptotic lam c" on the whole honest domain (0, ∞)), TWO-ARM:
       arm 1 (λ ≥ 1/2): P1's `exists_KSAsymptotic_of_half_le` UNCHANGED (GREEN
         p1-run3, re-printed below);
       arm 2 (λ ∈ (0, 1/2]): the port arm at c := `scaledConstLam lam psi`,
         ψ the donor's `exists_isCutoff` witness (delta = 1/8) — assembled from
         `IsAdmissible lam (cutoffTestLam lam psi)` and the `ScaledBridge`
         tendsto, EXACTLY the probe's `discharge_of_scaledBridge` shape.
     BRIDGE-CONDITIONAL FORM (honest, this fire): R8's arm-2 consumes the R7
     port bridge (`stmt_scaledBridge`), which is agent-04's separately-granted
     rung and NOT yet fired — so BOTH port-arm inputs ride as EXPLICIT binders
     (the EnclOK hypothesis-binder pattern; the probe's own wrapper form):
       hAdm = eta-r2's GREEN `cutoffTestLam_isAdmissible`
         (GREEN at run 14 `cebc4730`, standalone-unimportable — the self-containment
         convention; its ∀-form is EXACTLY this binder);
       hB = R7's `stmt_scaledBridge` (in flight). When R7 lands, ONE application
     discharges hB and the unconditional `stmt_exists_KSAsymptotic_of_pos`
     follows; hAdm is discharged at the close by re-stating r2's theorem at the
     unified substrate (or one import once modules unify). This is the R8
     deliverable obtainable TODAY, honestly shaped.
  2. `scaledConstLam_lt_of_threshold` — the THRESHOLD-CORRECTED strict
     improvement (`stmt_scaled_const_improves`, corrected per the (ii-c)/(iii)
     FINDING): the probe skeleton's bare positivity binder `Q(0) < c₀` does NOT
     imply `scaledConstLam < c₀` for all λ ∈ (0, 1/2) — from r3's corrected
     covariance `pairMainTerm Q_λ = ρ·c₀ + (ρ⁻¹ − ρ)·Q(0)` (ρ := 2λ), the
     improvement holds iff `Q(0)·(1 + ρ) < ρ·c₀` (algebra below), i.e. on a
     THRESHOLD sub-window of λ — NOT down to λ = 0 (counterexample class:
     Q(0) = 0.9·c₀, ρ = 0.1 gives scaledConstLam ≈ 9·c₀). The corrected
     statement carries the exact multiplicative threshold antecedent
     `Q(0) < (ρ/(1+ρ))·c₀`; the wrap's prose "ρ ∈ (Q(0)/c₀, 1]" maps to the
     same window (improvement ⟺ ρ > Q(0)/(c₀ − Q(0)) when Q(0) < c₀).
     Proof: one application of r3's covariance + algebra (field_simp/nlinarith)
     — positivity hypotheses `0 < cutoffNormaliser psi` as in r3.

ARCHITECTURE (NEW for this pilot, the n2p4v2 precedent): this file is the FIRST
eta-family module composed by IMPORT rather than self-containment — `import
ZZLamP1` (P1.lean, namespace ZZLam) + `import EtaR3` (eta-r3.lean, namespace
ZZLam.EtaPort) are chain-compiled to .olean inside the built V2 tree
(run_zzv2_r8.py); the namespaces are DISJOINT (P1: KSAsymptotic/C0Lam/C1Lam/C2Lam/
LamParams + theorems; r3: the dilation def layer + lemma A + the covariance), so
no collision — and lemma A / the corrected covariance (the arc's heaviest pieces)
are REUSED, not duplicated.

HYGIENE: proof artifact — 0 sorry; #print axioms at file end (expect triad-only
on both theorems + the consumed GREEN pieces re-printed; the full-coverage sweep
= the axcheck run, pilot-10 pattern). Informal mathematics Lamzouri's
(arXiv:2609.02882; Montgomery ICF 1974; Baluyot–Goldston–Suriajaya–Turnerbaugh
2024 Lemma 5) — must-cite in full wherever referenced; engineering deliverable,
never article-phrased.
-/
import ZetaZeros
import Mathlib.MeasureTheory.Measure.Haar.NormedSpace
import ZZLamP1
import EtaR3

namespace ZZLam.EtaPort

open ZetaZeros Filter Topology

/-! ## The bridge binder (carried VERBATIM from eta-pin-probe.lean:158, cited) -/

/-- The ported bridge in `KSAsymptotic`'s normalization (the `.re / zeroScale`
projection of the donor `:600`-shape asymptotic at `cutoffTestLam`) — R7's
output statement. -/
def ScaledBridge (lam : ℝ) (psi : ℝ → ℝ) : Prop :=
  Filter.Tendsto (fun T => (unweightedKernelSum (cutoffTestLam lam psi) T).re
      / zeroScale T)
    Filter.atTop (nhds (scaledConstLam lam psi))

/-! ## R8-1: the two-arm full-domain assembly (bridge-conditional) -/

/-- **R8-1 (the P1 HARD-STOP ask, two-arm, bridge-conditional)**: on the honest
domain `0 < lam`, a kernel-asymptotic constant exists — arm 1 (λ ≥ 1/2) is P1's
frozen-kernel theorem; arm 2 (λ ∈ (0, 1/2]) assembles the port kernel
`cutoffTestLam lam psi` (ψ = the donor's `exists_isCutoff` witness at δ = 1/8)
from the two port inputs: `hAdm` (r2's GREEN admissibility, ∀-form) and `hB`
(R7's bridge, ∀-form). When R7 fires, `hB` discharges by one application and the
unconditional `stmt_exists_KSAsymptotic_of_pos` follows. -/
theorem exists_KSAsymptotic_of_pos_of_scaledBridge
    (hAdm : ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 →
      IsCutoff delta psi → IsAdmissible lam (cutoffTestLam lam psi))
    (hB : ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 →
      IsCutoff delta psi → ScaledBridge lam psi) :
    ∀ lam : ℝ, 0 < lam → ∃ c : ℝ, KSAsymptotic lam c := by
  intro lam hlam
  rcases le_or_lt (1 / 2) lam with hge | hlt
  · -- arm 1: the frozen kernels (P1, GREEN p1-run3)
    obtain ⟨c, hc, -⟩ := exists_KSAsymptotic_of_half_le hge 1 one_pos
    exact ⟨c, hc⟩
  · -- arm 2: the port kernel at the donor's cutoff witness (δ = 1/8)
    have hdelta : (0:ℝ) < 1 / 8 ∧ (1 / 8:ℝ) < 1 / 4 := by norm_num
    obtain ⟨psi, hpsi⟩ := exists_isCutoff hdelta.1 hdelta.2
    have hle : lam ≤ 1 / 2 := le_of_lt hlt
    exact ⟨scaledConstLam lam psi, cutoffTestLam lam psi,
      hAdm lam (1 / 8) psi hlam hle hpsi, hB lam (1 / 8) psi hlam hle hpsi⟩

/-! ## R8-2: the threshold-corrected strict improvement -/

/-- **R8-2 (`stmt_scaled_const_improves`, THRESHOLD-CORRECTED per the FINDING)**:
for `0 < lam ≤ 1/2` and a cutoff ψ with positive normaliser, IF `Q(0)` sits
below the multiplicative threshold `(ρ/(1+ρ))·c₀` (ρ := 2λ; Q :=
`cutoffSelfConv psi`, c₀ := `pairMainTerm Q`), THEN the scaled constant is
strictly smaller — the proportion side `2 − c` strictly improves. The bare
`Q(0) < c₀` of the probe skeleton is INSUFFICIENT (the FINDING's corrected
covariance has the `(ρ⁻¹ − ρ)Q(0)` tail; the wrap's `ρ ∈ (Q(0)/c₀, 1]` prose
maps to `ρ > Q(0)/(c₀ − Q(0))`, the same window). Proof: r3's covariance + the
algebra `(ρ⁻¹ − ρ)·a = ((1−ρ)(1+ρ)/ρ)·a < ((1−ρ)/ρ)·ρ·b` for the threshold
`a·(1+ρ) < ρ·b`. -/
theorem scaledConstLam_lt_of_threshold {lam : ℝ} (hlam : 0 < lam)
    (hle : lam ≤ 1 / 2) {delta : ℝ} {psi : ℝ → ℝ} (hpsi : IsCutoff delta psi)
    (hA : 0 < cutoffNormaliser psi)
    (hthr : cutoffSelfConv psi 0
      < (2 * lam / (1 + 2 * lam)) * pairMainTerm (cutoffSelfConv psi)) :
    scaledConstLam lam psi < pairMainTerm (cutoffSelfConv psi) := by
  have hρ : (0:ℝ) < 2 * lam := by linarith
  have hρ1 : (2 * lam : ℝ) ≤ 1 := by linarith
  have hQ0 : cutoffSelfConv psi 0
      < (2 * lam / (1 + 2 * lam)) * pairMainTerm (cutoffSelfConv psi) := hthr
  unfold scaledConstLam
  rw [pairMainTerm_cutoffSelfConvLam hlam hle hpsi hA]
  have key : (1 + 2 * lam : ℝ) * cutoffSelfConv psi 0
      < 2 * lam * pairMainTerm (cutoffSelfConv psi) := by
    rw [div_lt_iff₀ (by linarith : (0:ℝ) < 1 + 2 * lam)] at hQ0
    linarith
  field_simp
  nlinarith

end ZZLam.EtaPort

-- audit (expect triad only, 0 sorryAx; the full-coverage sweep = the axcheck run)
#print axioms ZZLam.EtaPort.ScaledBridge
#print axioms ZZLam.EtaPort.exists_KSAsymptotic_of_pos_of_scaledBridge
#print axioms ZZLam.EtaPort.scaledConstLam_lt_of_threshold
-- consumed GREEN pieces re-printed (the dependency surface of this rung)
#print axioms ZZLam.exists_KSAsymptotic_of_half_le
#print axioms ZZLam.KSAsymptotic_mono
#print axioms ZZLam.EtaPort.pairMainTerm_cutoffSelfConvLam
#print axioms ZZLam.EtaPort.scaledConstLam_half
#print axioms ZetaZeros.exists_isCutoff
