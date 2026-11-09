/-
Pilot 22 / M1+M2 statement-elaboration probe — dossier/statement doc: R5's 22-* [expected],
worked from research/pilots/22-blueprint.md (R3). NOT a proof artifact: elaborates the M1
(Laurent-constant) and M2 (log-derivative extension) statement layer against mathlib v4.36
(checkout ff2494ea) and pins the cited decls with #check.

CONVENTION (sorry-free, mirroring pilots/01/MasterIdentity.lean and R9's probe style):
theorems are stated as Prop-valued definitions (`stmt_*`); proofs are deferred to the
milestone files (M1.lean). No `sorry`, no `axiom`, no `native_decide`.

Pinned mathlib decls (all verified read in the checkout):
  riemannZeta_residue_one            Mathlib/NumberTheory/LSeries/RiemannZeta.lean:242
  differentiableAt_riemannZeta       Mathlib/NumberTheory/LSeries/RiemannZeta.lean:139
  MeromorphicNFAt                    Mathlib/Analysis/Meromorphic/NormalForm.lean:51
  meromorphicOrderAt                 Mathlib/Analysis/Meromorphic/Order.lean:50
  Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt
                                     Mathlib/Analysis/Complex/RemovableSingularity.lean:36
  ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div
                                     Mathlib/NumberTheory/LSeries/Dirichlet.lean:439
  riemannZeta_ne_zero_of_one_le_re   Mathlib/NumberTheory/LSeries/Nonvanishing.lean:417
  WienerIkehara.tendsto_sum_range_div
                                     Mathlib/NumberTheory/LSeries/WienerIkehara.lean:693
-/
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.NumberTheory.LSeries.Dirichlet
import Mathlib.NumberTheory.LSeries.Nonvanishing
import Mathlib.NumberTheory.LSeries.WienerIkehara
import Mathlib.Analysis.Meromorphic.NormalForm
import Mathlib.Analysis.Meromorphic.Order
import Mathlib.Analysis.Complex.RemovableSingularity

open Filter Topology

namespace CrossMath.Pilot22

/-! ### M1 (blueprint §M1, glue G1): the Laurent constant of ζ at 1 -/

/-- **M1 statement.** The constant term of the Laurent expansion of `riemannZeta` at `1`
exists: `ζ s − 1/(s−1)` has a limit at `s → 1` along the punctured neighborhood. -/
def stmt_M1_LaurentConstant : Prop :=
  ∃ c : ℂ, Tendsto (fun s ↦ riemannZeta s - 1 / (s - 1)) (𝓝[≠] 1) (𝓝 c)

/-- M1 support: ζ is meromorphic at `1` in mathlib's normal-form sense
(the normal form *is* the Laurent expansion; no ζ instance exists in mathlib today). -/
def stmt_M1_MeromorphicNFAt : Prop :=
  MeromorphicNFAt riemannZeta 1

/-- M1 support: the order of ζ at `1` is `-1` (simple pole). -/
def stmt_M1_order : Prop :=
  meromorphicOrderAt riemannZeta 1 = ((-1 : ℤ) : WithTop ℤ)

/-- M1 support (removable-extension shape): `(s−1)·ζ s` equals an analytic `g` near `1`
with `g 1 = 1`. This is the form the M1 proof constructs. -/
def stmt_M1_removable : Prop :=
  ∃ g : ℂ → ℂ, AnalyticAt ℂ g 1 ∧ g 1 = 1 ∧ ∀ᶠ s in 𝓝[≠] 1, (s - 1) * riemannZeta s = g s

/-! ### M2 (blueprint §M2, glue G2): the continuous extension G on re s ≥ 1 -/

/-- **M2 statement.** The subtracted log-derivative of ζ admits a continuous extension to the
closed half-plane `re s ≥ 1` (the `hG` hypothesis of Wiener–Ikehara for `f = Λ`, `A = 1`, via
`LSeries_vonMangoldt_eq_deriv_riemannZeta_div`). -/
def stmt_M2_logDerivExtension : Prop :=
  ∃ G : ℂ → ℂ, ContinuousOn G {s : ℂ | 1 ≤ s.re} ∧
    Set.EqOn G (fun s ↦ -deriv riemannZeta s / riemannZeta s - 1 / (s - 1)) {s : ℂ | 1 < s.re}

/-! ### Decl pins (#check: elaboration fails here if any cited name/signature drifted) -/

#check @riemannZeta_residue_one
#check @differentiableAt_riemannZeta
#check @MeromorphicNFAt
#check @meromorphicOrderAt
#check @Complex.analyticAt_of_differentiable_on_punctured_nhds_of_continuousAt
#check @ArithmeticFunction.LSeries_vonMangoldt_eq_deriv_riemannZeta_div
#check @riemannZeta_ne_zero_of_one_le_re
#check @WienerIkehara.tendsto_sum_range_div

end CrossMath.Pilot22
