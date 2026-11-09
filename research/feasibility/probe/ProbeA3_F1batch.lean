/-
Statement elaboration probe — not a proof artifact.
Probe A3: F1 entry points cited by dossiers 01/03 but not yet probe-verified.
Names/lines pre-verified by rg in the local checkout (ff2494ea).
-/
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Algebra.Order.Chebyshev
import Mathlib.Algebra.Order.Rearrangement
import Mathlib.Analysis.Matrix.Hermitian
import Mathlib.Analysis.InnerProductSpace.Spectrum
import Mathlib.LinearAlgebra.Matrix.Rank

-- dossier 01 F1
#check @Matrix.IsHermitian.spectral_theorem        -- Spectrum.lean:143
#check @Matrix.IsHermitian.trace_eq_sum_eigenvalues -- Spectrum.lean:240
#check @sq_sum_le_card_mul_sum_sq                  -- Chebyshev.lean:143
#check @Monovary.sum_mul_comp_perm_le_sum_mul      -- Rearrangement.lean:439
-- dossier 03 F1
#check @Matrix.isSymmetric_toLin_iff               -- Analysis/Matrix/Hermitian.lean:46 (namespace Matrix)
#check @LinearMap.IsSymmetric.eigenvalues          -- InnerProductSpace/Spectrum.lean
#check @Matrix.rank_mul_le                         -- LinearAlgebra/Matrix/Rank.lean:190
#check @Matrix.rank_mul_le_left                    -- Rank.lean:179
#check @Matrix.rank_mul_le_right                   -- Rank.lean:184
