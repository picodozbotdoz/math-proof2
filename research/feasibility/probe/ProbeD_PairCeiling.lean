/-
Statement elaboration probe — not a proof artifact.
Probe D (round 4, dossier-02 pre-condition): zeta23 PairCeiling statement chain against
mathlib v4.36.0-rc2 @ ff2494ea. Definitions copied verbatim from the donor (read-only):
  Defs.lean:26-36 (Csum/Cstep/Dfun/Efun), NearCUE.lean:34 (NearCUE), Bridge.lean:31
  (massOf), NumericCert.lean:72-75 (EnclOK). Theorem STATEMENTS verbatim from
  Stability.lean:305 (ceiling_stability), Signed.lean:54 (ceiling_nearCUE_signed),
  CeilingLaw256.lean:30,38 (lawN256_rows / ceiling_law256, with the LawN256 data
  instance abstracted to parameters K/encl — the data itself is not statement-level);
  proofs replaced by sorry (elaboration scaffolding only, never results).
Import line = the donors' own Mathlib imports (Stability.lean:2-4).
-/
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.MeasureTheory.Integral.IntervalIntegral.IntegrationByParts
import Mathlib.Analysis.SpecialFunctions.Integrals.Basic

noncomputable section

open scoped BigOperators Interval
open MeasureTheory Set intervalIntegral

namespace ProbePairCeiling

/-- partial sums C_m := Σ_{j=1}^{m} s j. -/
def Csum (s : ℕ → ℝ) (m : ℕ) : ℝ := ∑ j ∈ Finset.Icc 1 m, s j

/-- the right-continuous step function C(x) = Σ_{1 ≤ j ≤ N, j/N ≤ x} s_j. -/
def Cstep (s : ℕ → ℝ) (N : ℕ) (x : ℝ) : ℝ :=
  ∑ j ∈ (Finset.Icc 1 N).filter (fun j : ℕ => ((j : ℕ) : ℝ) / N ≤ x), s j

/-- D := C − x²/2. -/
def Dfun (s : ℕ → ℝ) (N : ℕ) (x : ℝ) : ℝ := Cstep s N x - x ^ 2 / 2

/-- E := ∫₀ˣ D. -/
def Efun (s : ℕ → ℝ) (N : ℕ) (x : ℝ) : ℝ := ∫ t in (0:ℝ)..x, Dfun s N t

/-- near-CUE rows. -/
def NearCUE (S : ℕ → ℝ) (N : ℕ) (τ : ℝ) : Prop :=
  ∀ j : ℕ, 1 ≤ j → j < N → |(N : ℝ) * S j - j| ≤ τ

def massOf (S : ℕ → ℝ) (N : ℕ) : ℕ → ℝ := fun j => S j / N

/-- `EnclOK K S j l`: the list l = [(lo,hi), …] encloses K·S(j+1), K·S(j+2), … in order. -/
def EnclOK (K : ℕ) (S : ℕ → ℝ) : ℕ → List (ℤ × ℤ) → Prop
  | _, [] => True
  | j, e :: l => ((e.1 : ℝ) ≤ K * S (j + 1) ∧ (K : ℝ) * S (j + 1) ≤ e.2) ∧ EnclOK K S (j + 1) l

variable {s : ℕ → ℝ} {N : ℕ}

/-- **CEILING STABILITY (L1)** — donor Stability.lean:305, verbatim statement. -/
theorem ceiling_stability (hN : 0 < N) {r g h : ℝ → ℝ} {T : Set ℝ} (hT : T.Countable) {M : ℝ}
    (hr : ∀ x ∈ Icc (0:ℝ) 1, HasDerivAt r (g x) x) (hg : ContinuousOn g (Icc (0:ℝ) 1))
    (hgh : ∀ x ∈ Ioo (0:ℝ) 1 \ T, HasDerivAt g (h x) x) (hh : IntervalIntegrable h volume 0 1)
    (hM : ∀ x ∈ Icc (0:ℝ) 1, |Efun s N x| ≤ M) :
    |∑ j ∈ Finset.Icc 1 N, s j * r ((j:ℝ)/N) - ∫ x in (0:ℝ)..1, r x * x|
      ≤ |r 1| * |Dfun s N 1| + |g 1| * |Efun s N 1| + M * ∫ x in (0:ℝ)..1, |h x| := by
  sorry

/-- **signed ceiling for a near-CUE law** — donor Signed.lean:54, verbatim statement. -/
theorem ceiling_nearCUE_signed (hN : 0 < N) (S : ℕ → ℝ) {τ : ℝ} (hτ : 0 ≤ τ) (hS : NearCUE S N τ)
    (hD1 : 0 ≤ Dfun (massOf S N) N 1)
    {r g h : ℝ → ℝ} {T : Set ℝ} (hT : T.Countable) {c₀ p : ℝ}
    (hr : ∀ x ∈ Icc (0:ℝ) 1, HasDerivAt r (g x) x) (hg : ContinuousOn g (Icc (0:ℝ) 1))
    (hgh : ∀ x ∈ Ioo (0:ℝ) 1 \ T, HasDerivAt g (h x) x) (hh : IntervalIntegrable h volume 0 1)
    (hr1 : 0 ≤ r 1)
    (hvalid : c₀ + ∑ j ∈ Finset.Icc 1 N, massOf S N j * r ((j:ℝ)/N) ≤ p) :
    c₀ + ∫ x in (0:ℝ)..1, r x * x
      ≤ p + (1 / (6 * (N : ℝ) ^ 2) + τ / (2 * N)) * |g 1|
          + (1 / (6 * (N : ℝ) ^ 2) + τ / (2 * N)) * ∫ x in (0:ℝ)..1, |h x| := by
  sorry

/-- **the row certificate of the N = 256 law, unpacked** — donor CeilingLaw256.lean:30,
with the `LawN256` data instance abstracted to parameters (statement-level probe). -/
theorem lawN256_rows_shape (S : ℕ → ℝ) (K : ℕ) (encl : List (ℤ × ℤ))
    (hS : EnclOK K S 0 encl) :
    NearCUE S 256 ((3 : ℝ) / 10 ^ 40)
      ∧ |Dfun (massOf S 256) 256 1| ≤ (82395317 : ℝ) / 10 ^ 8 := by
  sorry

/-- **CEILING AT THE N = 256 LAW** — donor CeilingLaw256.lean:38, data abstracted as above. -/
theorem ceiling_law256_shape (S : ℕ → ℝ) (K : ℕ) (encl : List (ℤ × ℤ))
    (hS : EnclOK K S 0 encl)
    {r g h : ℝ → ℝ} {T : Set ℝ} (hT : T.Countable) {c₀ p : ℝ}
    (hr : ∀ x ∈ Icc (0:ℝ) 1, HasDerivAt r (g x) x) (hg : ContinuousOn g (Icc (0:ℝ) 1))
    (hgh : ∀ x ∈ Ioo (0:ℝ) 1 \ T, HasDerivAt g (h x) x) (hh : IntervalIntegrable h volume 0 1)
    (hvalid : c₀ + ∑ j ∈ Finset.Icc 1 256, massOf S 256 j * r ((j:ℝ)/256) ≤ p) :
    c₀ + ∫ x in (0:ℝ)..1, r x * x
      ≤ p + (82395317 : ℝ) / 10 ^ 8 * |r 1|
          + (1 / (6 * (256 : ℝ) ^ 2) + ((3 : ℝ) / 10 ^ 40) / (2 * 256)) * |g 1|
          + (1 / (6 * (256 : ℝ) ^ 2) + ((3 : ℝ) / 10 ^ 40) / (2 * 256))
              * ∫ x in (0:ℝ)..1, |h x| := by
  sorry

end ProbePairCeiling
