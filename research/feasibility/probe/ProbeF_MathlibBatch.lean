/-
Statement elaboration probe — not a proof artifact.
Probe F (round 5): mathlib-side F1 bindings cited by dossiers 20/30/52 that no
earlier probe covered (names pre-verified by rg in checkout ff2494ea).
-/
import Mathlib.RingTheory.MvPolynomial.Symmetric.Defs
import Mathlib.Algebra.MvPolynomial.PDeriv
import Mathlib.RingTheory.MvPolynomial.WeightedHomogeneous
import Mathlib.NumberTheory.LSeries.AbstractFuncEq
import Mathlib.NumberTheory.LSeries.HurwitzZetaEven
import Mathlib.Analysis.SpecialFunctions.Gamma.Deligne
import Mathlib.Analysis.Analytic.Order
import Mathlib.LinearAlgebra.CliffordAlgebra.Basic
import Mathlib.LinearAlgebra.CliffordAlgebra.Contraction
import Mathlib.LinearAlgebra.ExteriorAlgebra.Basic
import Mathlib.RingTheory.MvPolynomial.Basic

-- dossier 30 (power-sum symmetric machinery; R7 verified :351/:355 by rg)
#check @MvPolynomial.psum      -- Symmetric/Defs.lean:351
#check @MvPolynomial.psumPart  -- :355
#check @MvPolynomial.hsymm     -- :312
#check @MvPolynomial.hsymmPart -- :316
#check @MvPolynomial.pderiv    -- PDeriv

-- dossier 20 (functional-equation layer; names corrected after run-9 misses)
#check @WeakFEPair
#check @HurwitzZeta.hurwitzEvenFEPair  -- HurwitzZetaEven.lean:256 (namespace HurwitzZeta)
#check @le_analyticOrderAt_add          -- Analytic/Order.lean:228
#check @analyticOrderAt_add_of_ne       -- Analytic/Order.lean:254 region
-- Deligne Γ-factors (namespace Complex):
#check @Complex.Gammaℝ                  -- Deligne.lean:46
#check @Complex.Gammaℂ                  -- Deligne.lean:54

-- dossier 52 (Clifford/Fock substrate)
#check @CliffordAlgebra.contractLeft
#check @ExteriorAlgebra
#check @Nat.Partition
