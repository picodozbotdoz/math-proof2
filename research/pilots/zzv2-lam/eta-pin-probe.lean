/-
Pilot ZZV2-λ η-port — Phase-1 PIN PROBE, CANDIDATE (staged 2026-11-18, lane A3; NOT
FIRED — iteration-5 gates firing per the pre-charter `eta-port-precharter.md` §4).

NOT A PROOF ARTIFACT (probe convention): statement-elaboration rung only. ZERO
`sorry` by construction (the wave-2 zero-sorry statement-rung ruling): every ported
statement is a Prop-valued `def` — no proof bodies; the ONE theorem
(`discharge_of_scaledBridge`) is the trivial binder-consumption wrapper (FF-EZ4/P0
`conditional_shape` / EnclOK precedent: validates the conditional-theorem shape,
contains no analysis). Elaboration verdicts only, never proof claims.

Scope (pre-charter §1, statement tier): the scaled-family defs against donor
vocabulary; the ScaledBridge→discharge binder rung; the covariance ladder + the
donor-chain statement mirror at `cutoffTestLam` (the 16-lemma frozen chain of
`Zeta/Kernel.lean:191–:600` — the private inaccessibility finding stands, so the
PILOT re-proves these locally; this probe only pins that the statements are statable
and meaningful on-pin); the full-domain discharge target; the λ = 1/2 regression;
the strict-improvement transfer (positivity as an explicit antecedent binder — the
pilot proves it).

CORRECTION vs the pre-charter, recorded here (dated 2026-11-18, this staging
session, against the donor's own statements read this session): the pre-charter
§1.3(iv) claimed the corrected-test coefficient must scale by (2λ)². FALSE — the
weight cancellation is family-INDEPENDENT: `fourierC_correctedTest` gives the factor
`1 + π²z²/log²T`, and at `z = rescaledDiff T ρ ρ' = i(ρ−ρ')·log T/(2π)` one has
`π²z²/log²T = −(ρ−ρ')²/4`, so `(1 − (ρ−ρ')²/4) · 4/(4−(ρ−ρ')²) = 1` cancels
`pairWeight` for ANY kernel family with the SAME coefficient κ = 1. Hence
`correctedTestLam` below keeps the donor's `1/(4 log²T)` coefficient verbatim. The
Fourier/derivative identities behind it (`fourierC(Q'') = (2πiz)²·fourierC(Q)`,
`fourierC(f⋆f) = fourierC(f)²`) are family-free modulo regularity — so the port's
genuine-content tier shrinks to the regularity/support/integrability analogues + the
covariance ladder + admissibility (pre-charter §2.2–2.3 risk 1 largely dissolves;
budget possibly 5–8 runs rather than 6–10).

Donor citations (read-only sibling `axiommath/ZetaZerosV2/ZetaZeros/`, this session):
`extremalTest`/`pairMainTerm`/`pairWeight`/`pairCorrelationSum`/`IsCutoff`/
`cutoffNormaliser`/`cutoffTest`/`cutoffSelfConv`/`correctedTest`
(`Zeta/Defs.lean:76/:48/:39/:57/:88/:106/:111/:120/:126`); `IsAdmissible`/
`fourierC`/`testKernel` (`Definitions.lean:92/:74/:104`); `unweightedKernelSum`
(`Zeta/Kernel.lean:191`); the four mirrored statements
`fourierC_iteratedDeriv_two_cutoffSelfConv`/`fourierC_correctedTest`/
`correctedTest_weight_cancel`/`unweightedKernelSum_cutoffTest_eq_pairCorrelationSum`
(`Zeta/Kernel.lean:540±/:546±/:554±/:575±`-area statements) and the frozen bridge
`unweightedKernelSum_cutoffTest_tendsto` (`:600`); `zeroScale`
(`Zeta/Asymptotics.lean:29`); `IsPairTestFunction` (`Zeta/Inputs.lean:40`);
`PairCorrelation` (Inputs.lean:55, proved `pairCorrelationFormula`,
`PairCorrelation/FromLandau.lean:52`); `PairCorrelation.tendsto` (Zeta/Kernel.lean,
public). Our layer: `KSAsymptotic` carried VERBATIM from `pilots/zzv2-lam/P1.lean:54`.

Billing: engineering pre-staging of the iteration-5 η-port (A6 charter candidate
Lead 3; pre-charter §5 billing options open). Informal content Lamzouri's
(must-cite in full, prework §4 posture — never phrase as new mathematics).

FIRING INSTRUCTION (one paragraph, per pre-charter §4 Phase 1): when the iter-5
charter fires the pin probe, run it on the WARM lineage as-is — stage this file
(`research/pilots/zzv2-lam/run_zzv2.sh eta-pin-probe.lean`, which copies it with the
runner to the world-readable stage `/tmp/crossmath-zzv2-lam-stage`) against the
unchanged app
`crossmath-pilot-zzv2-lam` via the doz CLI (`/home/doz/dozenv/bin/modal`, primary
per the 2026-11-17 route ruling; the runner tars the two sibling repos, redirects
the PNT+ dep, `lake update` + `lake exe cache get`, then `taskset -c 0,1 lake build
ZetaZeros` — lake v4.36-rc2 has NO -j flag — and elaborates each staged file with
`lake env lean`). SPEC guardrails per AGENTS.md § Modal usage guidelines: cpu=2.0 /
memory=4096 soft, LEAN_NUM_THREADS=2 (CAP secret), @telemetered on, telemetry
persisted with the log; expect the ~10-min build-dominated wall (582–681 s
precedent). NOTE: the file name lacks the `P0` prefix, so the runner applies its
SORRY-STRICT verdict branch — INTENTIONAL for this zero-sorry rung (strict OK is
the expected verdict; any sorry-warning is a real failure). Persist the transcript
with a provenance header to
`research/pilots/zzv2-lam/logs/eta-pin-run1.log` and fold the verdict into the
η-port record set. Iteration-5 gates firing: DO NOT run this file before the
charter typesets.

Target: ZetaZerosV2 dev/claude pin (mathlib ff2494ea, toolchain v4.36.0-rc2).
-/

import ZetaZeros

namespace ZZLam.EtaPort

open ZetaZeros Filter Topology

/-! ## Anchor preflight (every consumed donor name, elaborated) -/

#check @ZetaZeros.extremalTest
#check @ZetaZeros.pairMainTerm
#check @ZetaZeros.pairWeight
#check @ZetaZeros.pairCorrelationSum
#check @ZetaZeros.rescaledDiff
#check @ZetaZeros.IsCutoff
#check @ZetaZeros.cutoffNormaliser
#check @ZetaZeros.cutoffTest
#check @ZetaZeros.cutoffSelfConv
#check @ZetaZeros.correctedTest
#check @ZetaZeros.IsAdmissible
#check @ZetaZeros.fourierC
#check @ZetaZeros.testKernel
#check @ZetaZeros.unweightedKernelSum
#check @ZetaZeros.zeroScale
#check @ZetaZeros.IsPairTestFunction
#check @ZetaZeros.PairCorrelation.tendsto
#check @ZetaZeros.kernelConstruction
#check @ZetaZeros.montgomeryTaylorConst

/-! ## The scaled family (defs against donor vocabulary; pre-charter §1.2) -/

/-- Coordinate dilation to the λ-window (ρ := 2λ). `noncomputable` marker added at
run-1 fix (2026-11-19): `lean.dependsOnNoncomputable` on the ℝ-division — the
P1-run2 friction class, mechanical fix only. -/
noncomputable def dilateTo (lam : ℝ) (f : ℝ → ℝ) : ℝ → ℝ := fun x => f (x / (2 * lam))

/-- The λ-scaled extremal base: `extremalTest` re-windowed from [−1/2, 1/2] to
[−λ, λ] (`Defs.lean:76` dilated; for `lam = 1/2` literally `extremalTest`). -/
noncomputable def extremalLam (lam : ℝ) : ℝ → ℝ := dilateTo lam extremalTest

/-- The λ-scaled normaliser `A_{ψ,λ}` (`Defs.lean:106` shape at the dilated window;
covariance: `A_{ψ,λ} = 2λ · A_ψ` — the statement ladder below). -/
noncomputable def cutoffNormaliserLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ :=
  ∫ x : ℝ, dilateTo lam psi x ^ 2 * extremalLam lam x

/-- The λ-scaled cutoff family: `cutoffTest` (`Defs.lean:111`) at the dilated base
and window. Admissible exactly for `0 < lam ≤ 1/2`-class windows (the pilot's port
of the private `cutoffTest_isAdmissible`, `Zeta/Kernel.lean:237`). -/
noncomputable def cutoffTestLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ → ℝ := fun x =>
  dilateTo lam psi x * Real.sqrt (extremalLam lam x)
    / Real.sqrt (cutoffNormaliserLam lam psi)

/-- The scaled self-convolution `Q_λ` (`Defs.lean:120` shape at `cutoffTestLam`).
Covariance (statement below): `Q_λ = dilateTo lam (cutoffSelfConv psi)` — the
normalisation constant cancels (`a²·ρ = 1` at `A_{ψ,λ} = 2λ·A_ψ`). -/
noncomputable def cutoffSelfConvLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ → ℝ := fun x =>
  ∫ t : ℝ, (cutoffTestLam lam psi t)^2 * (cutoffTestLam lam psi (x - t))^2

/-- The scaled corrected test — DONOR COEFFICIENT KEPT (see the header correction):
the pairWeight cancellation `4/(4−z²)` pins κ = 1 family-independently, so the
correction stays `Q_λ''/(4 log²T)` (`Defs.lean:126` shape at `Q_λ`). -/
noncomputable def correctedTestLam (lam : ℝ) (psi : ℝ → ℝ) (T : ℝ) : ℝ → ℝ := fun x =>
  cutoffSelfConvLam lam psi x
    - iteratedDeriv 2 (cutoffSelfConvLam lam psi) x / (4 * Real.log T ^ 2)

/-- The scaled asymptotic functional (the "scaled functional" of the P1 hard-stop
ask; closed form via the covariance ladder: `pairMainTerm Q_λ = ρ²·c₀ + (1−ρ²)·Q 0`
with ρ = 2λ, `Q = cutoffSelfConv psi`, `c₀ = pairMainTerm Q`). -/
noncomputable def scaledConstLam (lam : ℝ) (psi : ℝ → ℝ) : ℝ :=
  pairMainTerm (cutoffSelfConvLam lam psi)

/-- `KSAsymptotic`, carried VERBATIM from `pilots/zzv2-lam/P1.lean:54` (the ONE P1
binder; self-contained-convention carry). -/
def KSAsymptotic (lam c : ℝ) : Prop :=
  ∃ eta : ℝ → ℝ,
    IsAdmissible lam eta ∧
      Filter.Tendsto (fun T => (unweightedKernelSum eta T).re / zeroScale T)
        Filter.atTop (nhds c)

/-! ## The binder rung (EnclOK hypothesis-binder forms) -/

/-- The ported bridge in `KSAsymptotic`'s normalization (the `.re / zeroScale`
projection of the `:600`-shape asymptotic at `cutoffTestLam`). -/
def ScaledBridge (lam : ℝ) (psi : ℝ → ℝ) : Prop :=
  Filter.Tendsto (fun T => (unweightedKernelSum (cutoffTestLam lam psi) T).re
      / zeroScale T)
    Filter.atTop (nhds (scaledConstLam lam psi))

/-- Binder-consumption wrapper (trivial; validates the conditional-theorem shape —
the file's ONLY theorem, no analysis). -/
theorem discharge_of_scaledBridge {lam : ℝ} {psi : ℝ → ℝ}
    (hη : IsAdmissible lam (cutoffTestLam lam psi)) (hB : ScaledBridge lam psi) :
    KSAsymptotic lam (scaledConstLam lam psi) :=
  ⟨cutoffTestLam lam psi, hη, hB⟩

/-! ## Statement ladder (Prop-valued defs; zero sorry; no proof bodies) -/

section Statements

/-- (i) Fourier covariance of `fourierC` (`Definitions.lean:74`) along dilation. -/
def stmt_fourierC_dilateTo : Prop :=
  ∀ (f : ℝ → ℝ), MeasureTheory.Integrable f → ∀ lam : ℝ, 0 < lam → ∀ ξ : ℂ,
    fourierC (dilateTo lam f) ξ = (2 * lam) * fourierC f ((2 * lam) * ξ)

/-- (ii-a) Normaliser covariance: `A_{ψ,λ} = 2λ · A_ψ` (change of variables). -/
def stmt_cutoffNormaliserLam_covariance : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    cutoffNormaliserLam lam psi = 2 * lam * cutoffNormaliser psi

/-- (ii-b) Test-function covariance: `cutoffTestLam` is the dilation of `cutoffTest`
up to the normalisation constant `√(A_ψ / A_{ψ,λ})`. -/
def stmt_cutoffTestLam_eq_dilate : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    cutoffNormaliserLam lam psi ≠ 0 → cutoffNormaliser psi ≠ 0 →
      cutoffTestLam lam psi = fun x =>
        Real.sqrt (cutoffNormaliser psi / cutoffNormaliserLam lam psi)
          * dilateTo lam (cutoffTest psi) x

/-- (ii-c) Self-convolution covariance — the CLEAN form: at the admissible
normalisation the constants cancel, `Q_λ = dilateTo lam Q`. -/
def stmt_cutoffSelfConvLam_eq_dilate : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    cutoffNormaliserLam lam psi ≠ 0 → cutoffNormaliser psi ≠ 0 →
      cutoffSelfConvLam lam psi = dilateTo lam (cutoffSelfConv psi)

/-- (iii) Functional covariance — the scaled closed form (`scaledConstLam` in terms
of the frozen family; no per-λ numerics needed). -/
def stmt_scaledConstLam_covariance : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    cutoffNormaliserLam lam psi ≠ 0 → cutoffNormaliser psi ≠ 0 →
      scaledConstLam lam psi = (2 * lam)^2 * pairMainTerm (cutoffSelfConv psi)
        + (1 - (2 * lam)^2) * cutoffSelfConv psi 0

/-- Admissibility of the scaled family (port target of the private
`cutoffTest_isAdmissible`, `Zeta/Kernel.lean:237`): the support clause closes at
`lam ≤ |x|`, the Fourier normalisation by construction of `cutoffNormaliserLam`. -/
def stmt_cutoffTestLam_isAdmissible : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    IsAdmissible lam (cutoffTestLam lam psi)

/-- Pair-test admissibility of the scaled self-convolution (port of the private
`cutoffSelfConv_isPairTestFunction`; the window only widens the `Inputs.lean:40`
margin: supp Q_λ ⊆ [−2λ, 2λ] ⊂ (−1, 1) for λ < 1/2). -/
def stmt_cutoffSelfConvLam_isPairTestFunction : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    IsPairTestFunction (cutoffSelfConvLam lam psi)

/-- Pair-test admissibility of the scaled second derivative (port of the private
`iteratedDeriv_two_cutoffSelfConv_isPairTestFunction`). -/
def stmt_iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    IsPairTestFunction (iteratedDeriv 2 (cutoffSelfConvLam lam psi))

/-- Fourier value of the scaled second derivative — MIRRORED from the donor's
`fourierC_iteratedDeriv_two_cutoffSelfConv` (family-free modulo regularity). -/
def stmt_fourierC_iteratedDeriv_two_cutoffSelfConvLam : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    ∀ z : ℂ,
      fourierC (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) z =
        -4 * (Real.pi : ℂ)^2 * z^2 * testKernel (cutoffTestLam lam psi) z ^ 2

/-- Fourier value of the scaled corrected test — MIRRORED from
`fourierC_correctedTest` (κ = 1 factor `1 + π²z²/log²T`, the cancellation carrier). -/
def stmt_fourierC_correctedTestLam : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    ∀ T : ℝ, 1 < T → ∀ z : ℂ,
      fourierC (correctedTestLam lam psi T) z =
        (1 + (Real.pi : ℂ)^2 * z^2 / (Real.log T : ℂ)^2)
          * testKernel (cutoffTestLam lam psi) z ^ 2

/-- Weight cancellation at the scaled family — MIRRORED from
`correctedTest_weight_cancel` (strip hypotheses as in the donor statement). -/
def stmt_correctedTestLam_weight_cancel : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    ∀ T : ℝ, 1 < T → ∀ rho rho' : ℂ, 0 < rho.re → rho.re < 1 →
      0 < rho'.re → rho'.re < 1 →
        fourierC (correctedTestLam lam psi T) (rescaledDiff T rho rho')
            * pairWeight (rho - rho') =
          testKernel (cutoffTestLam lam psi) (rescaledDiff T rho rho') ^ 2

/-- The exact identity at the scaled family — MIRRORED from
`unweightedKernelSum_cutoffTest_eq_pairCorrelationSum` (linear form, donor shape). -/
def stmt_unweightedKernelSum_cutoffTestLam_eq_pairCorrelationSum : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    ∀ T : ℝ, 1 < T →
      unweightedKernelSum (cutoffTestLam lam psi) T =
        pairCorrelationSum (cutoffSelfConvLam lam psi) T
          - pairCorrelationSum (iteratedDeriv 2 (cutoffSelfConvLam lam psi)) T
              / (((4 * Real.log T ^ 2 : ℝ) : ℂ))

/-- The ported bridge, donor `:600` normalization (complex division; direct mirror).
The `.re / zeroScale` projection is `ScaledBridge` above (transfer = the `Complex.re`
projection bookkeeping, a micro-lemma class). -/
def stmt_bridge_port_complex : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    Filter.Tendsto (fun T => unweightedKernelSum (cutoffTestLam lam psi) T
        / ((zeroScale T : ℝ) : ℂ))
      Filter.atTop (nhds ((scaledConstLam lam psi : ℝ) : ℂ))

/-- The bridge in `KSAsymptotic` normalization (= `ScaledBridge`, as a ∀-statement). -/
def stmt_scaledBridge : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam ≤ 1 / 2 → IsCutoff delta psi →
    ScaledBridge lam psi

/-- The full-domain discharge target — the P1 hard-stop ask verbatim
(`P1-record.md:88–89`: "prove `∃ c, KSAsymptotic lam c`"): existence on the whole
honest domain (the `lam ≥ 1/2` arm is P1's `exists_KSAsymptotic_of_half_le`,
unchanged; the port arm supplies `c = scaledConstLam lam psi` for any cutoff ψ). The
closeness-to-functional form is arm-specific (frozen arm: near
`montgomeryTaylorConst`, `kernelConstruction` shape; port arm: `scaledConstLam`) and
is carried by `stmt_scaledBridge` + P1's half-le theorem separately. -/
def stmt_exists_KSAsymptotic_of_pos : Prop :=
  ∀ lam : ℝ, 0 < lam → ∃ c : ℝ, KSAsymptotic lam c

/-- λ = 1/2 regression: the scaled family at the frozen point IS the frozen family
(`dilateTo (1/2) = id` on the nose; the bit-for-bit anchor discipline). -/
def stmt_eta_regression_half : Prop :=
  ∀ (delta : ℝ) (psi : ℝ → ℝ), IsCutoff delta psi →
    cutoffTestLam (1 / 2) psi = cutoffTest psi
      ∧ scaledConstLam (1 / 2) psi = pairMainTerm (cutoffSelfConv psi)

/-- Strict-improvement transfer (no numerics; positivity as an explicit antecedent
binder — the pilot discharges it from `ψ ≥ 0`, `ψ ≢ 0`): for λ < 1/2 the scaled
constant is strictly smaller, so the proportion side `2 − c` strictly improves and
the frozen 2/3-class margins transfer to every λ ∈ (0, 1/2). -/
def stmt_scaled_const_improves : Prop :=
  ∀ (lam delta : ℝ) (psi : ℝ → ℝ), 0 < lam → lam < 1 / 2 → IsCutoff delta psi →
    cutoffNormaliserLam lam psi ≠ 0 → cutoffNormaliser psi ≠ 0 →
      cutoffSelfConv psi 0 < pairMainTerm (cutoffSelfConv psi) →
        scaledConstLam lam psi < pairMainTerm (cutoffSelfConv psi)

end Statements

/-! ## Extended consumer-side triad print surface (the donor-hygiene delta,
pre-charter §3): the four P0-checked names + the three port-newly-consumed ones.
Expected: each exactly [propext, Classical.choice, Quot.sound] (defs may print
"does not depend on any axioms" — also acceptable; the gate is: NO sorryAx). -/

#print axioms ZetaZeros.PairCorrelation.tendsto
#print axioms ZetaZeros.pairCorrelationSum
#print axioms ZetaZeros.pairWeight
#print axioms ZetaZeros.pairCorrelationFormula
#print axioms ZetaZeros.simpleOnLineCount_lower
#print axioms ZetaZeros.distinctZeroCount_lower
#print axioms ZetaZeros.unweightedKernelSum_cutoffTest_tendsto

end ZZLam.EtaPort
