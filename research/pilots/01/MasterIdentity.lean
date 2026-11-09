/-
Milestone (a) statement-elaboration probe — dossier 01 (ez1-inertial-defect-master-identity).
NOT a proof artifact. Elaborates the master-identity statement layer against mathlib v4.36
(checkout ff2494ea) per research/pilots/01-blueprint.md §2.

CONVENTION (sorry-free, chosen for consistency with R9's Probe-B while forbidding sorry):
  * Theorems are stated as Prop-valued definitions (`stmt_*`); their proofs are deferred to
    milestone (b). No `sorry`, no `axiom`, no `native_decide` anywhere in this file.
  * Donor-side definitions the statements need are copied VERBATIM from
    anthropics_formal-math/zeta23 (read-only) with two purely notational changes: the
    donor's `(·⁺)`/`(·⁻)` superscripts are written as explicit `fun x => max x 0` /
    `fun x => max (-x) 0` lambdas, and everything sits in namespace
    `CrossMath.RankTraceDefect` instead of `RHLinalg`/`Zeta23.ZeroSide.RankTraceMult`.
    Provenance (file:line) on each def.

Sources (read-only, anthropics_formal-math/zeta23):
  Zeta23/LinAlg/PosIndex.lean        (posIndex :41, rtrace :70, frobSq :73)
  Zeta23/LinAlg/HermitianPosPart.lean (specMap :42, hermPosPart :148, hermNegPart :151)
  Zeta23/ZeroSide/RankTraceMult.lean  (gc :30, Wmat :220, Pmat :223, xsq :226)
New content: deltaC + five defect defs + S1/S2/S2'/S3/main statements (dossier 01 §Precise
mathematical statement).
-/
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Algebra.Star.UnitaryStarAlgAut

noncomputable section

open Matrix Finset Unitary
open scoped ComplexOrder

namespace CrossMath.RankTraceDefect

variable {𝕜 : Type*} [RCLike 𝕜]
variable {n : Type*} [Fintype n] [DecidableEq n]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-! ### Donor definitions (verbatim; see header) -/

/-- Positive index `n₊(A)`. Donor: `RHLinalg.posIndex`, zeta23 `Zeta23/LinAlg/PosIndex.lean:41`. -/
def posIndex {A : Matrix n n 𝕜} (hA : A.IsHermitian) : ℕ :=
  #{i | 0 < hA.eigenvalues i}

/-- Real trace. Donor: `RHLinalg.rtrace`, `Zeta23/LinAlg/PosIndex.lean:70`. -/
def rtrace (A : Matrix n n 𝕜) : ℝ := RCLike.re A.trace

/-- Squared Frobenius norm. Donor: `RHLinalg.frobSq`, `Zeta23/LinAlg/PosIndex.lean:73`. -/
def frobSq (A : Matrix n n 𝕜) : ℝ := RCLike.re (Aᴴ * A).trace

/-- Spectral functional calculus `U diag(f ∘ λ) Uᴴ`. Donor: `RHLinalg.specMap`,
`Zeta23/LinAlg/HermitianPosPart.lean:42` (notation `(·⁺)` made explicit below). -/
def specMap {A : Matrix n n 𝕜} (hA : A.IsHermitian) (f : ℝ → ℝ) : Matrix n n 𝕜 :=
  conjStarAlgAut 𝕜 _ hA.eigenvectorUnitary
    (diagonal (fun i => (f (hA.eigenvalues i) : 𝕜)))

/-- Positive part. Donor: `RHLinalg.hermPosPart`, `Zeta23/LinAlg/HermitianPosPart.lean:148`. -/
def hermPosPart {A : Matrix n n 𝕜} (hA : A.IsHermitian) : Matrix n n 𝕜 :=
  specMap hA (fun x => max x 0)

/-- Negative part. Donor: `RHLinalg.hermNegPart`, `Zeta23/LinAlg/HermitianPosPart.lean:151`. -/
def hermNegPart {A : Matrix n n 𝕜} (hA : A.IsHermitian) : Matrix n n 𝕜 :=
  specMap hA (fun x => max (-x) 0)

/-- `g_c(x) = x² − c·x − ((x−c)₊)²`. Donor: `gc`, `Zeta23/ZeroSide/RankTraceMult.lean:30`. -/
def gc (c x : ℝ) : ℝ := x ^ 2 - c * x - (max (x - c) 0) ^ 2

/-- The `d×s` matrix with columns `√m_j · v_j`. Donor: `Wmat`, RankTraceMult.lean:220. -/
def Wmat (m : ι → ℝ) (v : ι → n → 𝕜) : Matrix n ι 𝕜 :=
  fun a j => (Real.sqrt (m j) : 𝕜) * v j a

/-- `P := W Wᴴ = Σ_j m_j v_j v_j*`. Donor: `Pmat`, RankTraceMult.lean:223. -/
def Pmat (m : ι → ℝ) (v : ι → n → 𝕜) : Matrix n n 𝕜 :=
  Wmat m v * (Wmat m v)ᴴ

/-- `x_j := ‖v_j‖²`. Donor: `xsq`, RankTraceMult.lean:226. -/
def xsq (v : ι → n → 𝕜) (j : ι) : ℝ := ∑ a, ‖v j a‖ ^ 2

/-! ### New defect definitions (dossier 01, Theorem A) -/

/-- Scalar defect `Δ_c(p,m) := (p−m)² − c·p − g_c(p) + 2c·m`
    (= `m·(m+2(c−p))` for `p ≤ c`, `(p−c−m)²` for `p ≥ c`). -/
def deltaC (c p m : ℝ) : ℝ := (p - m) ^ 2 - c * p - gc c p + 2 * c * m

/-- Δ_pt — pairing defect: `Σ_k Δ_c(p_k, μ_k)` over the decreasingly sorted spectra of `P`, `Q₋`. -/
def pairingDefect (c : ℝ) {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) : ℝ :=
  ∑ k, deltaC c (hP.eigenvalues₀ k) (hQm.eigenvalues₀ k)

/-- Δ_SJ — Schur–Jensen defect: `Σ_k g_c(λ_k(P)) − Σ_j g_c(m_j‖v_j‖²)`. -/
def schurJensenDefect (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜) {P : Matrix n n 𝕜}
    (hP : P.IsHermitian) : ℝ :=
  ∑ k, gc c (hP.eigenvalues₀ k) - ∑ j, gc c (m j * xsq v j)

/-- Δ_vN — rearrangement defect: `Σ_k p_k·μ_k − Re tr(P·Q₋)`. -/
def rearrangementDefect {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) : ℝ :=
  ∑ k, hP.eigenvalues₀ k * hQm.eigenvalues₀ k - RCLike.re (P * Qm).trace

/-- Δ₊ — positive-coupling defect: `2·Re tr(P·Q₊)`. -/
def posCouplingDefect (P Qp : Matrix n n 𝕜) : ℝ :=
  2 * RCLike.re (P * Qp).trace

/-- Δ_Q+ — pair-block defect: `Σ_{q_i > 0} (q_i − c)²` (spectral form; equal to
`frobSq Q₊ − 2c·rtrace Q₊ + c²·n₊(Q)` by donor `frobSq_hermPosPart`/`rtrace_hermPosPart`,
proved at milestone (b)). -/
def pairBlockDefect (c : ℝ) {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) : ℝ :=
  ∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), (hQ.eigenvalues i - c) ^ 2

/-! ### Statements (Prop-valued `def`s; proofs deferred to milestone (b)) -/

/-- Nonnegativity of the scalar defect (mirror of donor `sq_sub_ge_gc`, RankTraceMult.lean:81). -/
def stmt_deltaC_nonneg : Prop :=
  ∀ c p m : ℝ, 0 ≤ p → 0 ≤ m → 0 ≤ c → 0 ≤ deltaC c p m

/-- S1: donor `hstep4` (RankTraceMult.lean:326) as an equality with named remainder `2·Δ_vN`. -/
def stmt_S1 {P Qm : Matrix n n 𝕜} (hP : P.IsHermitian) (hQm : Qm.IsHermitian) : Prop :=
  frobSq P - 2 * RCLike.re (P * Qm).trace + frobSq Qm
    = ∑ k, (hP.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
      + 2 * rearrangementDefect hP hQm

/-- S2: donor `hstep5'` (RankTraceMult.lean:334) with the pointwise defect kept explicit. -/
def stmt_S2 (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜) (Qm : Matrix n n 𝕜)
    (hPm : (Pmat m v).IsHermitian) (hQm : Qm.IsHermitian) : Prop :=
  ∑ k, (hPm.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
    = c * rtrace (Pmat m v) + (∑ k, gc c (hPm.eigenvalues₀ k)) - 2 * c * rtrace Qm
      + pairingDefect c hPm hQm

/-- S2': Schur–Jensen split; nonnegativity is donor `sum_gc_eigenvalues_ge` (:270). -/
def stmt_S2' (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜)
    (hPm : (Pmat m v).IsHermitian) : Prop :=
  ∑ k, gc c (hPm.eigenvalues₀ k)
    = ∑ j, gc c (m j * xsq v j) + schurJensenDefect c m v hPm

/-- S3: donor `hstep6` (RankTraceMult.lean:339) at the sharp budget `b := posIndex hQ`;
the remainder is the sum-of-squares `pairBlockDefect` by definition. -/
def stmt_S3 (c : ℝ) {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) : Prop :=
  frobSq (hermPosPart hQ)
    = 2 * c * rtrace (hermPosPart hQ) - c ^ 2 * (posIndex hQ : ℝ)
      + pairBlockDefect c hQ

/-- MAIN — the master identity (dossier 01, Theorem A); replaces the `linarith` at
`RankTraceMult.lean:346`. `hQp`/`hQmm` are supplied at milestone (b) by the ported
`specMap_isHermitian` (HermitianPosPart.lean:46); `hPm` by `Pmat_posSemidef.1` (:242). -/
def stmt_main (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜) (Q : Matrix n n 𝕜)
    (hQ : Q.IsHermitian) (hPm : (Pmat m v).IsHermitian)
    (_hQp : (hermPosPart hQ).IsHermitian) (hQmm : (hermNegPart hQ).IsHermitian) : Prop :=
  frobSq (Pmat m v + Q)
    = c * rtrace (Pmat m v) + (∑ j, gc c (m j * xsq v j)) + 2 * c * rtrace Q
        - c ^ 2 * (posIndex hQ : ℝ)
      + pairingDefect c hPm hQmm
      + schurJensenDefect c m v hPm
      + 2 * rearrangementDefect hPm hQmm
      + posCouplingDefect (Pmat m v) (hermPosPart hQ)
      + pairBlockDefect c hQ

end CrossMath.RankTraceDefect

end
