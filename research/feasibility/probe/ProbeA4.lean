/-
Statement elaboration probe — not a proof artifact.
Probe A4: correct spelling of the signature defs — Signature.lean opens
`namespace QuadraticForm` at line 139, AFTER `def sigPos` (:65) / `def sigNeg`
(:98), so the defs are ROOT-named, not `QuadraticForm.sigPos` (the file's own
docstring is misleading). Re-test importability.
-/
import Mathlib.LinearAlgebra.QuadraticForm.Signature

#check @sigPos
#check @sigNeg
#check @QuadraticForm.sigPos_of_equiv_weightedSumSquares
#check @QuadraticForm.sigNeg_of_equiv_weightedSumSquares
#check @QuadraticForm.sigPos_add_sigNeg_add_radical
