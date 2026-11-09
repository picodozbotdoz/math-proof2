/-
Statement elaboration probe — not a proof artifact.
Probe B1: zeta23 RHLinalg donor statements elaborated against mathlib v4.36
(checkout ff2494ea). Sources (read-only, anthropics_formal-math):
  Zeta23/LinAlg/PosIndex.lean  (defs posIndex/negIndex/posIndexAbove/rtrace/frobSq)
  Zeta23/LinAlg/VonNeumann.lean:171 (vonNeumann_trace_ineq)
  Zeta23/LinAlg/RankTrace.lean:163  (rank_trace_ineq)
  Zeta23/LinAlg/Weyl.lean:50        (weyl_posIndexAbove_le)
Definitions and theorem STATEMENTS are copied verbatim from the donor (only
proof bodies replaced by sorry); import line reproduces the donors' own Mathlib
imports. The sorries here are elaboration scaffolding only and are never results.
-/
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.Analysis.Convex.Birkhoff
import Mathlib.Algebra.Order.Rearrangement
import Mathlib.Algebra.Order.Chebyshev

noncomputable section

open Matrix Finset
open scoped ComplexOrder

namespace RHLinalg

variable {𝕜 : Type*} [RCLike 𝕜]
variable {n : Type*} [Fintype n] [DecidableEq n]

/-- The positive index `n₊(A)` of a Hermitian matrix (donor: PosIndex.lean). -/
def posIndex {A : Matrix n n 𝕜} (hA : A.IsHermitian) : ℕ :=
  #{i | 0 < hA.eigenvalues i}

/-- The negative index `n₋(A)` (donor: PosIndex.lean). -/
def negIndex {A : Matrix n n 𝕜} (hA : A.IsHermitian) : ℕ :=
  #{i | hA.eigenvalues i < 0}

/-- The thresholded positive index `n₊^θ(A)` (donor: PosIndex.lean). -/
def posIndexAbove {A : Matrix n n 𝕜} (hA : A.IsHermitian) (θ : ℝ) : ℕ :=
  #{i | θ < hA.eigenvalues i}

/-- Real part of the trace (donor: PosIndex.lean:70). -/
def rtrace (A : Matrix n n 𝕜) : ℝ := RCLike.re A.trace

/-- Squared Frobenius norm (donor: PosIndex.lean:73). -/
def frobSq (A : Matrix n n 𝕜) : ℝ := RCLike.re (Aᴴ * A).trace

/-- **Von Neumann's trace inequality** (Hermitian case) — donor VonNeumann.lean:171. -/
theorem vonNeumann_trace_ineq {A B : Matrix n n 𝕜}
    (hA : A.IsHermitian) (hB : B.IsHermitian) :
    RCLike.re (A * B).trace
      ≤ ∑ i, hA.eigenvalues₀ i * hB.eigenvalues₀ i := by
  sorry

/-- **Rank–trace inequality** — donor RankTrace.lean:163. -/
theorem rank_trace_ineq {P Q : Matrix n n 𝕜}
    (hP : P.PosSemidef) (hQ : Q.IsHermitian)
    {r b : ℕ} (hr : P.rank ≤ r) (hb : posIndex hQ ≤ b)
    {c : ℝ} (hc : 0 < c) :
    c * rtrace P - c ^ 2 / 4 * r + 2 * c * rtrace Q - c ^ 2 * b
      ≤ frobSq (P + Q) := by
  sorry

/-- **Weyl's eigenvalue perturbation inequality** — donor Weyl.lean:50. -/
theorem weyl_posIndexAbove_le {A E : Matrix n n 𝕜}
    (hA : A.IsHermitian) (hE : E.IsHermitian) {θ : ℝ}
    (hθ : ∀ i, |hE.eigenvalues i| ≤ θ) :
    posIndexAbove (hA.add hE) θ ≤ posIndex hA := by
  sorry

end RHLinalg
