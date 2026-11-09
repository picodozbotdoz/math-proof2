/-
Statement elaboration probe — not a proof artifact.
Probe A: mathlib v4.36 (checkout ff2494ea) declaration smoke test.
One #check per key entry decl from the R9 round-1 verification list and the
R3-declared list (Holor.cprank probed as its closest real name CPRankMax).
Lean elaborates every command even after errors, so one file reports all failures.
-/
import Mathlib.Computability.TuringMachine.Computable
import Mathlib.NumberTheory.LSeries.WienerIkehara
import Mathlib.NumberTheory.LSeries.ZetaZeros
import Mathlib.Data.Holor
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.Analysis.Analytic.Order
import Mathlib.NumberTheory.LSeries.RiemannZeta
import Mathlib.Analysis.SpecialFunctions.SmoothTransition
import Mathlib.LinearAlgebra.QuadraticForm.Signature
import Mathlib.Analysis.SpecialFunctions.Gamma.Digamma
import Mathlib.NumberTheory.LSeries.HardyZ
import Mathlib.Analysis.InnerProductSpace.SingularValues

-- Computability / time API (round-1 claims 5, 10)
#check @Turing.FinTM2
#check @Turing.TM2ComputableAux
#check @Turing.TM2OutputsInTime
#check @Turing.TM2ComputableInPolyTime

-- Number theory surface (claims 3, 7)
#check @tendsto_sum_div
#check @riemannZetaZeros
#check @isDiscrete_riemannZetaZeros
#check @IsCompact.inter_riemannZetaZeros_finite
#check @analyticOrderAt
#check @completedRiemannZeta₀
#check @hardyZ

-- Linear algebra surface (claims 1, 2)
#check @Matrix.IsHermitian.eigenvalues
#check @Matrix.IsHermitian.eigenvalues₀
#check @Matrix.PosSemidef
#check @Matrix.rank
#check @QuadraticForm.sigPos
#check @QuadraticForm.sigNeg
#check @LinearMap.singularValues

-- Analysis / special functions (claim 6)
#check @Real.smoothTransition
#check @digamma

-- R3-listed name, probed at its closest real spelling (claim 8)
#check @Holor.CPRankMax
#check @Holor.CPRankMax1
