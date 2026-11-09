/-
Milestone (a) import-surface probe — dossier 01/03 shared port bundle.
NOT a proof artifact: #check-only smoke of every mathlib v4.36 declaration the port bundle
binds to (blueprint §1, column 6), catching module-visibility gaps (cf. R9's
`QuadraticForm.sigPos`/`sigNeg` finding) BEFORE the port.

One import line per module the bundle will bind to; one #check per binding decl.
Visibility sweep (source-side, this lane): every module below carries `public section`/
`@[expose]` above the listed decls; the only `private` decls in these files
(`PosDef.preInnerProductSpace` Analysis/Matrix/PosDef.lean:95; `exists_perm_eq_zero_implies_
eq_zero` Birkhoff.lean:50; `doublyStochastic_sum_perm_aux` Birkhoff.lean:88) are NOT bindings.
Corrections to blueprint §1 found while pinning names:
  * `LinearMap.finrank_range_of_inj` lives in `Mathlib/LinearAlgebra/Dimension/Finrank.lean:127`
    (blueprint cited FiniteDimensional/Lemmas.lean — that import is merely transitive).
  * `reindex_mem_doublyStochastic` lives in `Mathlib/Analysis/Convex/DoublyStochasticMatrix.lean:119`
    (not Birkhoff.lean as the donor's open-set suggested).
  * `posSemidef_self_mul_conjTranspose`-family lives in `Mathlib/LinearAlgebra/Matrix/PosDef.lean`
    (a different file from `Mathlib/Analysis/Matrix/PosDef.lean`).
-/
import Mathlib.Analysis.Matrix.Spectrum
import Mathlib.Analysis.Matrix.PosDef
import Mathlib.LinearAlgebra.Matrix.PosDef
import Mathlib.Analysis.Convex.Birkhoff
import Mathlib.Analysis.Convex.DoublyStochasticMatrix
import Mathlib.Algebra.Order.Rearrangement
import Mathlib.Algebra.Order.Chebyshev
import Mathlib.LinearAlgebra.Lagrange
import Mathlib.Algebra.Star.UnitaryStarAlgAut
import Mathlib.Algebra.Star.Unitary
import Mathlib.LinearAlgebra.Matrix.Rank
import Mathlib.LinearAlgebra.Matrix.Diagonal
import Mathlib.LinearAlgebra.Dimension.Finrank

-- Spectrum.lean (spectral-theorem surface; @[expose] public section at :24)
#check @Matrix.IsHermitian.eigenvalues₀          -- :60
#check @Matrix.IsHermitian.eigenvalues₀_antitone -- :63
#check @Matrix.IsHermitian.eigenvalues           -- :67
#check @Matrix.IsHermitian.eigenvectorUnitary    -- :89
#check @Matrix.IsHermitian.spectral_theorem      -- :143
#check @Matrix.IsHermitian.rank_eq_card_non_zero_eigs -- :202
#check @Matrix.IsHermitian.trace_eq_sum_eigenvalues  -- :240

-- Analysis/Matrix/PosDef.lean + LinearAlgebra/Matrix/PosDef.lean
#check @Matrix.PosSemidef
#check @Matrix.IsHermitian.posSemidef_iff_eigenvalues_nonneg -- Analysis …/PosDef.lean:34
#check @Matrix.posSemidef_self_mul_conjTranspose  -- LinAlg …/PosDef.lean (donor RankTraceMult.lean:243)
#check @Matrix.posSemidef_conjTranspose_mul_self  -- donor RankTraceMult.lean:272
#check @Matrix.posSemidef_diagonal_iff            -- donor TightMult.lean:73

-- Doubly-stochastic layer (Birkhoff + DoublyStochasticMatrix)
#check @exists_eq_sum_perm_of_mem_doublyStochastic -- Birkhoff.lean:146
#check @doublyStochastic                           -- DoublyStochasticMatrix.lean:42
#check @mem_doublyStochastic_iff_sum               -- DoublyStochasticMatrix.lean:56
#check @reindex_mem_doublyStochastic               -- DoublyStochasticMatrix.lean:119

-- Rearrangement + Chebyshev
#check @Monovary.sum_mul_comp_perm_le_sum_mul      -- Rearrangement.lean:439
#check @sq_sum_le_card_mul_sum_sq                  -- Chebyshev.lean:143

-- Lagrange interpolation (milestone (b): `sum_eigenvalues_comm` transfer step)
#check @Lagrange.interpolate                     -- Lagrange.lean:298 (root namespace; Polynomial closes at :129)
#check @Lagrange.eval_interpolate_at_node

-- Unitary / ⋆-alg-aut layer (specMap binds to these; UNPROBED by R9's ProbeB1)
#check @Unitary.conjStarAlgAut                     -- UnitaryStarAlgAut.lean:37
#check @Unitary.conjStarAlgAut_apply               -- :47
#check @Unitary.mul_star_self_of_mem               -- Unitary.lean:68
#check @Unitary.star_mul_self_of_mem               -- Unitary.lean:64

-- Rank / diagonal / finrank
#check @Matrix.rank                                -- Rank.lean:133
#check @Matrix.rank_diagonal                       -- Rank.lean (donor TightMult.lean:78)
#check @LinearMap.finrank_range_of_inj             -- Dimension/Finrank.lean:127
