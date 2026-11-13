/-
Statement elaboration probe — not a proof artifact.
Probe G5c (axiommath donor round, 2026-11-13; bridge research/bridges/area-law.md §2 L2 /
§6 item on AL-EZ1's binding surface): the dictionary lemma between openai-math's PEPS
reduced density matrix `reducedDensity Ω A = coefficientMatrix * conjTranspose` (the
W Wᴴ / Gram form, PEPSFilters/Basic.lean:115-120, donor @ v4.34.1) and pilot-01's
`Pmat m v = Wmat m v * (Wmat m v)ᴴ` atom-sum form (research/pilots/01/port/
09_MasterIdentity.lean:1508-1517, kernel-verified on this pin). Both sides transcribed
verbatim; the dictionary statements are sorry'd scaffolding — elaboration verdicts only.
-/
import Mathlib

open scoped ComplexOrder
open Matrix

namespace ProbeG5c

noncomputable section

/-! ## PEPS side (verbatim, minimal prelude: Basic.lean:11,23-25,104-120) -/

abbrev Vertex (L : ℕ) := Fin L × Fin L

abbrev Configuration (L q : ℕ) := Vertex L → Fin q

abbrev State (L q : ℕ) := EuclideanSpace ℂ (Configuration L q)

abbrev RegionConfiguration {L : ℕ} (q : ℕ) (S : Finset (Vertex L)) :=
  {v : Vertex L // v ∈ S} → Fin q

def joinConfigurations {L q : ℕ} (A : Finset (Vertex L))
    (x : RegionConfiguration q A) (z : RegionConfiguration q Aᶜ) :
    Configuration L q := by
  classical
  exact fun v => if h : v ∈ A then x ⟨v, h⟩ else z ⟨v, Finset.mem_compl.mpr h⟩

def coefficientMatrix {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    Matrix (RegionConfiguration q A) (RegionConfiguration q Aᶜ) ℂ :=
  fun x z => Ω (joinConfigurations A x z)

def reducedDensity {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    Matrix (RegionConfiguration q A) (RegionConfiguration q A) ℂ :=
  coefficientMatrix Ω A * (coefficientMatrix Ω A).conjTranspose

/-! ## Pilot-01 side (verbatim: 09_MasterIdentity.lean:1508-1517) -/

section Pilot01

variable {𝕜 : Type*} [RCLike 𝕜] {n : Type*} [Fintype n] [DecidableEq n]
  {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- the d×s matrix with columns √m_j · v_j. -/
def Wmat (m : ι → ℝ) (v : ι → n → 𝕜) : Matrix n ι 𝕜 := fun a j => (Real.sqrt (m j) : 𝕜) * v j a

/-- P := W Wᴴ = Σ_j m_j v_j v_j*. -/
def Pmat (m : ι → ℝ) (v : ι → n → 𝕜) : Matrix n n 𝕜 := Wmat m v * (Wmat m v)ᴴ

/-- x_j := ‖v_j‖² = Σ_a ‖v_j a‖². -/
def xsq (v : ι → n → 𝕜) (j : ι) : ℝ := ∑ a, ‖v j a‖ ^ 2

end Pilot01

/-! ## The dictionary (AL-EZ1 binding surface; bridge §1 row 5, §2 L2) -/

/-- **Dictionary, PEPS → pilot-01** (weight-1 atom form): the PEPS RDM IS a `Pmat` with
atoms = complement configurations `z`, atom vectors = coefficient-matrix columns, atom
weights all `1` (the mass sits in the vectors; the weighted refinement `m_z = ‖W_{·z}‖²`,
`v_z = W_{·z}/√m_z` splits it instead). -/
theorem reducedDensity_eq_Pmat {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    reducedDensity Ω A
      = Pmat (fun _ : RegionConfiguration q Aᶜ => (1 : ℝ))
          (fun (z : RegionConfiguration q Aᶜ) (x : RegionConfiguration q A) =>
            Ω (joinConfigurations A x z)) := by
  sorry

/-- **Dictionary, general Gram → pilot-01**: every Gram matrix `W Wᴴ` is the `Pmat` of the
weight-1 atom family of its columns. -/
theorem gram_eq_Pmat {𝕜 : Type*} [RCLike 𝕜] {n ι : Type*} [Fintype n] [DecidableEq n]
    [Fintype ι] [DecidableEq ι] (W : Matrix n ι 𝕜) :
    W * Wᴴ = Pmat (fun _ : ι => (1 : ℝ)) (fun j a => W a j) := by
  sorry

/-- **Trace bookkeeping of the dictionary** (bridge §2 L2: "atom weights ‖W_{·z}‖²,
tr ρ_A = ‖Ω‖² = 1"): the trace of the RDM is the sum of squared column norms of the
coefficient matrix — pilot-01's `xsq` at the PEPS atom family, summed over `z`. -/
theorem rdm_trace_eq_sum_xs {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L)) :
    (reducedDensity Ω A).trace
      = ∑ z : RegionConfiguration q Aᶜ,
          xsq (fun (z' : RegionConfiguration q Aᶜ) (x : RegionConfiguration q A) =>
            Ω (joinConfigurations A x z')) z := by
  sorry

/-- **Binder-consumption (the binding surface)**: any certificate functional of an atom
family (pilot-01's master identity consumes exactly `(m, v, Q)` triples) sees the PEPS RDM
through the dictionary — the RDM admits an atom decomposition on which the certificate
evaluates. Validates the AL-EZ1 part-2 input shape at signature level. -/
theorem cert_sees_rdm_atoms {L q : ℕ} (Ω : State L q) (A : Finset (Vertex L))
    (cert : (RegionConfiguration q Aᶜ → ℝ) →
      (RegionConfiguration q Aᶜ → RegionConfiguration q A → ℂ) → ℝ)
    (h : cert (fun _ => (1 : ℝ))
        (fun (z : RegionConfiguration q Aᶜ) (x : RegionConfiguration q A) =>
          Ω (joinConfigurations A x z)) = 0) :
    ∃ (m : RegionConfiguration q Aᶜ → ℝ)
      (v : RegionConfiguration q Aᶜ → RegionConfiguration q A → ℂ),
      reducedDensity Ω A = Pmat m v ∧ cert m v = 0 := by
  sorry

end

end ProbeG5c
