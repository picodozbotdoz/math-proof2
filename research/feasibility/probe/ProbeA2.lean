/-
Statement elaboration probe — not a proof artifact.
Probe A2: corrected names for the two ProbeA name misses, plus re-confirmation
that QuadraticForm.sigPos/sigNeg are module-private (not importable API).
-/
import Mathlib.NumberTheory.LSeries.WienerIkehara
import Mathlib.Analysis.SpecialFunctions.Gamma.Digamma
import Mathlib.LinearAlgebra.QuadraticForm.Signature

#check @WienerIkehara.tendsto_sum_div
#check @WienerIkehara.tendsto_sum_range_div
#check @Complex.digamma
#check @Complex.digamma_apply_add_one
-- expected to fail: module-private in this checkout
#check @QuadraticForm.sigPos
#check @QuadraticForm.sigNeg
