# Phase 2 bridge map v1 — LINEAR ALGEBRA / MATRIX ANALYSIS cluster (lane R6)

Corpora (all read-only):
**zeta23** `/home/doz/zcode-workdir/anthropics_formal-math/zeta23` (Mathlib v4.33.0-rc2),
**mathlib** `/home/doz/zcode-workdir/encore-mathlib/repo/mathlib4` (v4.36.0-rc2),
**tauceti** `/home/doz/zcode-workdir/tauceti`, **openai-math** `/home/doz/zcode-workdir/openai-math`.
All Lean declarations cited as `file:line`; every claim below was checked by reading the cited
lines. Markers: **[VERIFIED]** = read and confirmed in source; **[HYPOTHESIS]** = proposed, not
present in any corpus (novelty vs classical literature argued but not exhaustively proven).

---

## §0 Cluster snapshot

**Source cluster: `Zeta23/LinAlg/` (namespace `RHLinalg`), 7 files, 1385 lines** — a self-contained
matrix-analysis development written for §3 of the Alpöge–Furman zero-density paper, consumed by
`Zeta23/ZeroSide/` and (for `hermPosPart`) by `Zeta23/MV/Duality.lean` [VERIFIED; header comment of
every LinAlg file; Phase-1 survey §1.3, §2(d)]:

| Object | Declaration | Site |
|---|---|---|
| von Neumann trace inequality (Hermitian case) | `RHLinalg.vonNeumann_trace_ineq` | `Zeta23/LinAlg/VonNeumann.lean:171` |
| — Birkhoff core | `bilinear_doublyStochastic_le_of_monovary` | `VonNeumann.lean:143` |
| Hermitian pos/neg parts, `specMap` | `hermPosPart`, `hermNegPart`, `specMap` | `HermitianPosPart.lean:148,151,42` |
| positive/negative/thresholded index | `posIndex`, `negIndex`, `posIndexAbove` | `PosIndex.lean:41,45,50` |
| Sylvester hard + easy directions | `finrank_le_posIndex_of_posDefOn`, `posDefOn_range_hermPosPart`, `posIndex_eq_max_finrank_posDefOn` | `Sylvester.lean:82,123,304` |
| thresholded easy direction | `hermForm_gt_on_range_truncPos` | `Sylvester.lean:215` |
| inertia pull-back + subadditivity | `posIndex_conj_le`, `posIndex_add_le` | `Inertia.lean:51,90` |
| Weyl index bound + CS count | `weyl_posIndexAbove_le`, `cauchySchwarz_count` | `Weyl.lean:50,89` |
| rank–trace inequality | `rank_trace_ineq` (c=2 form :260) | `RankTrace.lean:163` |
| multiplicity-aware Lemma R | `rank_trace_mult`, `rank_trace_mult_k`, `rank_trace_mult_k_le` | `ZeroSide/RankTraceMult.lean:281,369,380` |
| tightness of Lemma R | `lemmaR_tight`, `lemmaR_tight'`, `lemmaR_tight_two` | `ZeroSide/TightMult.lean:93,104,114` |
| PairCeiling (bandwidth-1 barrier) | `ceiling_stability` (Stability.lean:305), `ceiling_of_valid_at` (Ceiling.lean:28), `NearCUE` (NearCUE.lean:34), `ceiling_nearCUE_signed` (Signed.lean:54), `ceiling_law256` (CeilingLaw256.lean:38) | `Zeta23/PairCeiling/` |
| MV duality ladder (§2 hook) | `EigenBound` (Duality.lean:34) → `MVDiag 13` → `mv_hilbert` | `MV/Final.lean:30` |

Key formulas [VERIFIED]: `rank_trace_ineq`: for `P ⪰ 0`, `rank P ≤ r`, `Q` Hermitian,
`posIndex hQ ≤ b`, `c > 0`:
`c·tr P − (c²/4)r + 2c·tr Q − c²b ≤ ‖P+Q‖²_F`. Lemma R (`rank_trace_mult_k`): for
`P = Σ_j m_j v_j v_j*` (`m_j ≥ 0`), `2c·tr(P+Q) − ‖P+Q‖²_F ≤ Σ_j k_c(m_j‖v_j‖²) + c²·b` with
`k_c(x) = c² − ((c−x)₊)²` (`kc`, RankTraceMult.lean:351); applied at c=2 (simple zeros) and c=3
(distinct zeros) with integer bookkeeping `sum_kc_two_nat`/`sum_kc_three_nat`
(RankTraceMult.lean:403,419). `lemmaR_tight`: equality on orthonormal atoms with `m_j ≤ c` plus
`b` blocks `Q = c·Π`: `2c·tr(P+Q) − ‖P+Q‖²_F = Σ_j k_c(m_j) + c²b`.

**Counterpart clusters** (scanned in full): mathlib's matrix-analysis surface is
`Mathlib/Analysis/Matrix/{Spectrum,PosDef,Order,HermitianFunctionalCalculus,LDL,Normed}.lean` +
`Mathlib/Analysis/InnerProductSpace/{Spectrum,SingularValues}.lean` +
`Mathlib/LinearAlgebra/QuadraticForm/{Real,Signature}.lean` — eigenvalue API, PSD order, CFC, but
**no** perturbation theory. **tauceti** has the deepest matrix-analysis library of the four corpora:
`TauCeti/Analysis/Matrix/` (52 files: HoffmanWielandt, Eigenvalues/{Basic,Interlacing,OperatorNorm,
Continuous}, HermitianSignature/, Trace/, SchurComplement, Grothendieck, OperatorJensen,
GramFactorization, …) and `TauCeti/Analysis/InnerProductSpace/` (CourantFischer, KyFan,
FanDominance, SchurHorn, DavisEigenvalueChange, HoffmanWielandt/, UnitarilyInvariantSeminorm/
incl. Schatten + SinTheta + Sylvester, VonNeumannAlgebra/). **openai-math** has essentially one
matrix-analysis node: the Crouzeix theorem (`lean/ComparatorChallenges/CompleteCrouzeix.lean:33`,
`UniversalBound 2` with optimality); **no random-matrix/CUE/GUE content anywhere**
[VERIFIED: `rg -i "circular ensemble|form factor|sine kernel|GUE|CUE"` over preprints+lean returns
no RMT hit].

---

## §1 Intersection table

| RHLinalg object | mathlib counterpart [VERIFIED] | tauceti counterpart [VERIFIED] | genuinely absent in mathlib |
|---|---|---|---|
| `vonNeumann_trace_ineq` (Hermitian) | ingredients only: Birkhoff `exists_eq_sum_perm_of_mem_doublyStochastic` (`Analysis/Convex/Birkhoff.lean:146`) + rearrangement `Monovary.sum_mul_comp_perm_le_sum_mul` (`Algebra/Order/Rearrangement.lean:439`) | `Analysis/Convex/DoublyStochasticMatrix.lean` (doubly-stochastic averaging/Jensen), `SchurHorn.lean` (same Schur-weight matrix), Ky Fan machinery — but **no vN trace inequality in either corpus** | the theorem itself, both the Hermitian-eigenvalue form and the singular-value form `Re tr(A*B) ≤ Σσᵢ(A)σᵢ(B)` |
| Sylvester both directions (`Sylvester.lean:82,123,304`) | `QuadraticForm.sigPos/sigNeg` (`LinearAlgebra/QuadraticForm/Signature.lean:65,98`, new 2026, Loeffler) — max finrank of a pos-def subspace, but only for quadratic forms over a **linearly ordered field** (ℝ), never connected to Hermitian eigenvalue counts; `le_sigPos_of_posDef` (:91), `exists_finrank_eq_sigPos_and_posDef` (:87) | `Matrix.IsHermitian.signature : ℤ` (π−ν, `HermitianSignature/Basic.lean:68`) with `signature_congr` for **invertible** congruence (:147), via realification `signature_realify` (:122) | `posIndex` for Hermitian matrices as eigenvalue count **and** its subspace characterization; the identity `sigPos(hermForm A) = posIndex hA`; any ℂ-valued inertia |
| inertia pull-back `posIndex_conj_le` (Inertia.lean:51), subadditivity `posIndex_add_le` (:90) | — | `signature_congr` is the equality case (invertible P); **monotonicity under arbitrary B and subadditivity absent** | both statements |
| Weyl bound `weyl_posIndexAbove_le` (Weyl.lean:50) | — | full classical suite: Weyl additive inequalities `eigenvalues₀_add_le` / `le_eigenvalues₀_add` (`Eigenvalues/Basic.lean:208,222`), rank interlacing `eigenvalues₀_le_of_rank_sub_le` (:252), eigenvalue-count stability `abs_card_eigenvalues₀_le_sub_card_le_rank` (:299), Courant–Fischer (`InnerProductSpace/CourantFischer.lean`), Cauchy interlacing (`Eigenvalues/Interlacing.lean:58,71`), Davis–Kahan sin-θ (`UnitarilyInvariantSeminorm/SinTheta/`) | norm-perturbation stability of the **thresholded index** `n₊^θ` as a single statement |
| `rank_trace_ineq` (RankTrace.lean:163) | — | — | the whole statement; nearest kin anywhere is tauceti's Hoffman–Wielandt + Ky Fan, neither of which implies it |
| Lemma R `rank_trace_mult_k` + `lemmaR_tight` | — | — | the whole statement, incl. the Schur–Jensen diagonal-vs-spectrum lemma `sum_gc_diag_le_sum_gc_eigenvalues` (RankTraceMult.lean:119) and the WWᴴ/WᴴW spectral transfer `sum_eigenvalues_comm` (:189, Lagrange interpolation) |
| PairCeiling machinery | — | nearest kin: Lipschitz spectral statistics `norm_integral_spectralMeasure_sub_integral_spectralMeasure_le` (`HoffmanWielandt.lean:112`); empirical `spectralMeasure` (`Matrix/SpectralMeasure/`) | all of it (stability calculus, near-CUE rows, ceiling law) |
| `hermPosPart`/`specMap` (HermitianPosPart.lean:42,148) | `Matrix.IsHermitian.cfc` (`Analysis/Matrix/HermitianFunctionalCalculus.lean:133`); the file itself notes the equivalence (`cfc_eq`) | `FunctionalCalculus.lean`, `Sqrt.lean` | nothing — `specMap` is a lightweight re-derivation of `cfc`; **refactor/donation, not discovery** |
| `rtrace`/`frobSq`, `frobSq_hermitian_eq_sum_sq_eigenvalues` (PosIndex.lean:70,73,117) | Frobenius *norm instances* (`Analysis/Matrix/Normed.lean:538–545`) but not the Hermitian `‖A‖²_F = Σλᵢ²` identity | `LinearMap.nValues : tr(A†A) = Σσᵢ(A)²` (`UnitarilyInvariantSeminorm/Frobenius.lean`) | the eigenvalue form of the identity |
| `cauchySchwarz_count` (Weyl.lean:89) | — | `card_eigenvalues₀_le_le_card_add_rank` (perturbation form, Basic.lean:269) | the moment form `(trR − θd)²/tr(R²) ≤ n₊^θ(R)` |
| — (no RHLinalg counterpart) | `LinearMap.singularValues` (`Analysis/InnerProductSpace/SingularValues.lean:95`, new 2026 Voss–Mehta); Schur product thm (`Analysis/Matrix/Order.lean:214`); StarOrderedRing Loewner order (`Order.lean:111`); LDL (`Analysis/Matrix/LDL.lean`) | Ky Fan sums (`KyFan.lean:99`), Fan dominance (`FanDominance.lean`), Schur–Horn, Schatten norms, majorization + transfer descent (`Convex/Majorization.lean`), Grothendieck (`Matrix/Grothendieck.lean:157` const 8), operator Jensen (`OperatorJensen.lean:64`), Gram factorization (`GramFactorization.lean:52–78`), Schur complement w/ pseudoinverse (`Matrix/SchurComplement.lean:39,58`), Crouzeix-adjacent none | (donor direction: RHLinalg → mathlib/tauceti all of row 1–6) |

**Reading of the table.** The RHLinalg cluster and the tauceti matrix library are almost perfect
complements: tauceti owns the *classical perturbation/majorization* layer (Courant–Fischer, Weyl,
interlacing, Hoffman–Wielandt, Ky Fan, Schur–Horn, Davis–Kahan), RHLinalg owns the *certificate*
layer (rank–trace/Lemma R with tightness, thresholded-index counting, PairCeiling) which is
post-classical (the k_c inequality and the ceiling law appear in no classical text — see §4
positioning). mathlib owns the *substrate* (eigenvalue API, PSD order, CFC, and, since 2026, both
`sigPos` and `singularValues`) but no theorem that speaks to either layer. Every RHLinalg object in
rows 1–6 is a mathlib-ready donation with in-repo proof already at kernel standard [VERIFIED].

---

## §2 Lifts and dualities

**L1 — multiplicity lift (in-corpus, terminal).** `rank_trace_ineq` (support-count certificate)
→ `rank_trace_mult_k` (weighted certificate via `k_c`) → `lemmaR_tight` (optimality from
(tr, rank, n₊) data alone) is a completed lift chain inside zeta23 [VERIFIED]. Open lifts:
(a) *matrix/block weights*: `P = Σ_j M_j` PSD blocks instead of scalar `m_j v_j v_j*`; the
Schur–Jensen step (`gc_sum_le`, RankTraceMult.lean:63; `sum_gc_diag_le_sum_gc_eigenvalues` :119)
generalizes to operator-concave Jensen under compressions — exactly tauceti's
`conjTranspose_mul_cfc_mul_le_cfc_conjTranspose_mul_mul` (`OperatorJensen.lean:64`) — see EZ2.
(b) *contraction sharpness*: `rank_trace_mult_k_le` (:380) raises `x_j = ‖v_j‖² ≤ 1` to 1 using
monotonicity of `k_c`; whether the bound `Σ_j k_c(m_j x_j) + c²b` with `x_j < 1` allowed has a
strictly smaller supremum over configurations (i.e. whether norm-data `x_j` strictly helps) is
**not** settled by `lemmaR_tight` (which only treats `x_j = 1`) [VERIFIED gap; HYPOTHESIS: the
supremum is still attained at `x_j = 1`, by concavity of `k_c` and a splitting argument].

**L2 — inertial refinement.** The proof of `rank_trace_ineq` drops exactly three nonnegative
quantities: `tr(PQ₊) ≥ 0` (`RankTrace.lean:228`), the pointwise slack in
`(p−m)² ≥ cp + g_c(p) − 2cm` (`sq_sub_ge_gc`, RankTraceMult.lean:81), and the slack in the
Schur–Jensen step. `lemmaR_tight` shows these slanks vanish simultaneously on the extremal
configuration (there `PQ₊ = 0`, blocks orthogonal) [VERIFIED]. Hence the *defect form* — the
master identity keeping every slack as an explicit term indexed by the negative spectrum of `Q`
and the positive part `tr(PQ₊)` — is the natural sharp refinement; see EZ1.

**L3 — compression/pull-back lift.** `posIndex_conj_le` (Inertia.lean:51) says a compressed form
`BᴴQB` inherits the global positive-index budget. Composing with `rank_trace_mult_k` on the
compressed pair gives rank–trace inequalities for `Π_S(P+Q)Π_S` whose `b`-budget is the **global**
`n₊(Q)`, not the compressed one. In the zero-side application this is exactly why the certificate
survives restricting to on-line atoms [VERIFIED mechanism; the standalone matrix statement is EZ3].

**L4 — MV-shaped duality.** zeta23's Montgomery–Vaughan ladder is: eigenvalue bound
(`EigenBound 13`, `MV/Duality.lean:34`) → quadratic form via eigenbasis expansion → diagonal
weighted Hilbert inequality (`MVDiag 13`, `MV/Final.lean:27`) → bilinear by polarization
(`mv_hilbert`, `MV/Final.lean:30`, C = 26); the kernel is the antisymmetric
`kfun r s = √δ_r√δ_s/(λ_r−λ_s)` Hermitized as `M = iK` (`Mmat`, Duality.lean:55) [VERIFIED]. The
same three-storey shape (spectral bound ⇒ quadratic form ⇒ bilinear/polarized) is latent in the
rank–trace cluster: `cauchySchwarz_count` is the spectral store, `rank_trace_ineq` the quadratic
store; the missing third store is a *bilinear* rank–trace inequality for two pairs (P,Q), (P′,Q′)
with cross terms `tr(PQ′₊)` — polarization of `‖P+Q‖²_F` as a Frobenius inner product. No corpus
states it; EZ1 sub-question (d).

**L5 — bandwidth-k ceiling.** PairCeiling is bandwidth-one: a certificate is a pair (c₀, r) with
scalar `r ∈ C¹[0,1]`, validated against single-atom masses `s_j = S(j)/N`, and the barrier is
`v ≤ p₁ + d₁|r(1)| + e₁|r′(1)| + M∫|r″|` with near-CUE constants `e₁ = M = 1/(6N²) + τ/(2N)`
(`NearCUE.lean` header; `ceiling_nearCUE_signed`, Signed.lean:54), instantiated at N = 256 with
`p₀ = 0.68182868746…` (`ceiling_law256`, CeilingLaw256.lean:38) [VERIFIED]. The generalization to
certificates consuming k-point form-factor data (bandwidth k) — with a computable ceiling law
`B_k` — does not exist in any corpus nor, to our knowledge, in the pair-correlation literature
(see EZ5).

**L6 — dimension lift.** All RHLinalg statements are finite-dimensional (`Fintype n`). The
trace-class/Hilbert–Schmidt lift over ℓ² with finite positive index is stated nowhere; the two
ingredients (monotone approximation by finite-rank compressions; index monotonicity under
compression = L3) are available. See EZ6.

---

## §3 Quantitative transfers

**Q1 — rank–trace ⊗ Hoffman–Wielandt [VERIFIED connection].** Step 4 of the `rank_trace_ineq`
proof (`RankTrace.lean:233 hstep4`: `Σ(p_k−m_k)² ≤ frobSq P − 2Re tr(PQ₋) + frobSq Q₋`) is a
one-sided Hoffman–Wielandt inequality for the PSD pair (P, −Q₋) derived from
`vonNeumann_trace_ineq`. tauceti's two-sided `IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq`
(`HoffmanWielandt.lean:93`) is strictly stronger *as a spectral statement* but is not usable
inside the rank–trace proof (the target is `‖P+Q‖²_F`, not `‖P+Q₋‖²_F`). Transfer opportunity:
tauceti's HW gives *equality cases* (permutation alignment), which would characterize when the vN
step is tight — a tool for EZ1's defect analysis. Constants: `lemmaR_tight` proves `c²/4`, `c²`
are optimal, so no constant transfer is possible in the aggregate statement [VERIFIED].

**Q2 — Weyl forms.** RHLinalg `weyl_posIndexAbove_le` (norm-perturbation of thresholded index)
and tauceti `eigenvalues₀_add_le` (Weyl additive) + `abs_card_eigenvalues₀_le_sub_card_le_rank`
(rank-perturbation count stability, `Eigenvalues/Basic.lean:299`) are siblings. Each is derivable
from the other's corpus with work; a merged "rank r AND norm θ" perturbation bound
`n₊^{θ+‖E‖}(A+E) ≤ n₊^θ(A) + #{i > d−r …}` is elementary from tauceti's own
`eigenvalues₀_le_of_rank_sub_le` (:252) — a porting note, not a discovery [VERIFIED].

**Q3 — counting bounds.** RHLinalg `cauchySchwarz_count` (`Weyl.lean:89`,
`(trR − θd)²/frobSq R ≤ n₊^θ(R)`) is a moment lower bound on the index; tauceti's
`card_eigenvalues₀_le_le_card_add_rank` is a perturbation upper bound. Both appear in zero-density
arguments on one side and RMT truncation arguments on the other. Combined
moment+perturbation index bound is a one-line composition — worth stating once in the shared
library, not a candidate theorem [VERIFIED].

**Q4 — near-CUE form factors vs random-matrix content.** Neither openai-math nor tauceti contains
CUE/GUE ensembles or form-factor asymptotics [VERIFIED by search]. The nearest neighbors are:
(a) tauceti's deterministic Lipschitz estimate for spectral statistics
`norm_integral_spectralMeasure_sub_integral_spectralMeasure_le` (`HoffmanWielandt.lean:112`,
`‖∫f dL_A − ∫f dL_B‖ ≤ K‖A−B‖_F/√n`) — the standard entry point for RMT concentration;
(b) openai-math's Crouzeix constant-2 theorem (`CompleteCrouzeix.lean:33`) — operator-theoretic,
no ensembles. Transfer [HYPOTHESIS]: PairCeiling's discrepancy functionals `Dfun`/`Efun`
(`PairCeiling/Defs.lean:33,36`) for configurations realized as eigenvalues of unitarily invariant
ensembles could be bounded via (a), replacing/complementing the external `EnclOK` enclosures;
this is a proof-engineering bridge (import path), not new mathematics.

**Q5 — constants zoo [HYPOTHESIS].** zeta23 MV constants (13 diagonal, 26 bilinear,
`MV/Final.lean:27,30`) vs tauceti Grothendieck constants (8 real, 16 complex,
`Matrix/Grothendieck.lean:157,207`). Both bound bilinear pairings by global constants; a direct
inequality between them (e.g. Grothendieck ⇒ a worse-but-uniform MV bound with a *dimension-free*
proof) is plausible and unexplored, but the MV sharp constant is a Hilbert-transform question —
flagged, not proposed.

---

## §4 Empty zones — candidate NEW theorems

Ordering: strongest first. Each entry: precise statement, bridge-essentiality, contributing named
results, first proof step.

### EZ1. Inertial defect-form of the rank–trace inequality (master identity) — [HYPOTHESIS]

**Statement.** Let `P, Q` be `d×d` Hermitian, `P ⪰ 0`, `c > 0`. Let `p₁ ≥ … ≥ p_d` be the
eigenvalues of `P`, `m₁ ≥ … ≥ m_d` those of `Q₋ = (Q)₋`, `π = n₊(Q)`. Define the pointwise defect
`Δ_c(p, m) := (p − m)² − c·p − g_c(p) + 2c·m` (so `Δ_c ≥ 0` by `sq_sub_ge_gc`,
RankTraceMult.lean:81, with `Δ_c(p,m) = m(m + 2(c−p))` for `p ≤ c` and `(p − c − m)²` for
`p ≥ c`). Then the *exact identity*

```
‖P+Q‖²_F = c·tr P + Σᵢ g_c(pᵢ) + 2c·tr Q − c²π
         + Σᵢ Δ_c(pᵢ, mᵢ) + 2Re tr(PQ₊) + [rearrangement defect] + [Schur–Jensen defect] + [pos-part defect on Q₊]
```

holds, where the three bracketed defects are the explicitly computable nonnegative slacks of
(i) `vonNeumann_trace_ineq`, (ii) `sum_gc_diag_le_sum_gc_eigenvalues`, (iii)
`sum_sq_lower_of_card_pos_le`; in particular `rank_trace_ineq`, `rank_trace_mult_k` and every
refinement obtained by lower-bounding any defect term is a corollary of dropping defect terms.
**Sub-questions (each a theorem if true):** (a) defect-term monotone coupling: `2Re tr(PQ₊) ≥ 2k`
improves the certificate by exactly `2k` (diagonal-dominance gain); (b) the `n₋(Q)`-refinement:
an inertial version trading `−c²π` against a `ν = n₋(Q)`-dependent term that is strictly better
whenever `Q` has negative eigenvalues above a threshold; (c) equality characterization: the
defects vanish simultaneously exactly on the `lemmaR_tight` configurations and their unitary
conjugates; (d) polarized/bilinear form of (a) along L4.
**Bridge-essentiality.** zeta23 supplies every ingredient inequality and the tightness extremals;
tauceti's Hoffman–Wielandt equality analysis (`HoffmanWielandt.lean:93` and its permutohedron
argument in `DavisEigenvalueChange.lean`) supplies the *rearrangement defect* structure
(permutation alignment) that zeta23 never extracts. Neither corpus alone states or proves an
exact defect identity; it is a self-contained new result the combination motivates.
**Contributing results:** `frobSq_add_hermitian` (RankTrace.lean:138), `sq_sub_ge_gc`,
`sum_eigenvalues_comm` (RankTraceMult.lean:189), `lemmaR_tight` (TightMult.lean:93),
`IsHermitian.sum_sq_eigenvalues₀_sub_le_frobenius_norm_sub_sq` (tauceti HoffmanWielandt.lean:93).
**First proof step.** In the `rank_trace_mult` proof (RankTraceMult.lean:281) replace the final
`linarith` (line 346) and each `≤` (hstep4/hstep5'/hstep6) by the defining identity plus
`Σ Δ_c`, reading off each slack from the existing `calc` blocks.
**Novelty.** The k_c-form and its tightness are proved in zeta23 but the *defect decomposition* is
nowhere stated; sub-question (b) is not in the Alpöge–Furman paper (checked against survey §2(c)
"intermediate c values … not computed") nor in classical matrix-analysis texts (Bhatia's
*Matrix Analysis* treats HW/Weyl, not joint trace–Frobenius certificates).

### EZ2. Matrix-weighted (block) rank–trace inequality — [HYPOTHESIS]

**Statement.** For PSD blocks `M_j ⪰ 0` (`j ∈ ι`) on 𝕜ⁿ and Hermitian `Q` with `n₊(Q) ≤ b`,
`c > 0`:
`2c·tr(Σ_j M_j + Q) − ‖Σ_j M_j + Q‖²_F ≤ Σ_j tr k_c[Γ_j] + c²·b`, where `k_c` is applied by
functional calculus to the finite PSD "effective multiplicity matrix"
`Γ_j := M_j^{1/2}(Σ_k restricted-Gram)M_j^{1/2}` — precisely, the Gram-side quantity
`Σ_j Σ_α g_c((W_jᵀW)_{jj,α})`-pattern of `sum_gc_eigenvalues_ge` (RankTraceMult.lean:270) with
`W := [M_1^{1/2} … M_s^{1/2}]` replaced by its natural matrix analogue
`Σ_j tr g_c(G_j)` with `G_j` the diagonal block of `WᴴW`. Scalar case `M_j = m_j v_j v_j*`
recovers `rank_trace_mult_k` exactly.
**Bridge-essentiality.** zeta23's scalar Jensen chain (`gc_sum_le` :63) becomes *operator* Jensen
under isometric compression — the exact statement tauceti proves as
`conjTranspose_mul_cfc_mul_le_cfc_conjTranspose_mul_mul` (OperatorJensen.lean:64, operator-concave
`f`, isometry `V`). Neither corpus has the block statement; mathlib's `Matrix.IsHermitian.cfc`
(HermitianFunctionalCalculus.lean:133) is the substrate for `k_c` by functional calculus.
**Contributing results:** `sum_gc_diag_le_sum_gc_eigenvalues`, `sum_eigenvalues_comm`
(spectral transfer WWᴴ vs WᴴW), tauceti `OperatorJensen.lean:64`, mathlib `cfc`.
**First proof step.** Redo the Schur step (RankTraceMult.lean §(B)) with `Wmat m v`
(:220) generalized to block columns; the diagonal of `WᴴW` becomes the block diagonal
`(WᴴW)_{jj} = M_j^{1/2}(Σ)M_j^{1/2}`, and `gc_sum_le` is replaced by the operator-concave
compression inequality for the concave `g_c` (note `g_c` is convex — reverse the direction via
`k_c = c·p − g_c(p)` concave, RankTraceMult.lean:350–359, so `k_c` is the operator-concave
object).
**Novelty.** Block/matrix-weighted analogues of trace-Frobenius certificates do not appear in
classical texts; the tightness question (block extremals = `lemmaR_tight` with rank-one blocks)
is a concrete open sub-problem.

### EZ3. Compression rank–trace inequality with global inertia budget — [HYPOTHESIS]

**Statement.** Hermitian `P ⪰ 0` (rank ≤ r), `Q` Hermitian on 𝕜ⁿ, subspace `S ⊆ 𝕜ⁿ`, `Π` the
orthogonal projection, `c > 0`. Then
`c·tr(ΠPΠ) − (c²/4)·rank(ΠPΠ) + 2c·tr(ΠQΠ) − c²·n₊(Q) ≤ ‖Π(P+Q)Π‖²_F + [rank-slack terms on Sᗮ]`,
i.e. the compressed pair still admits the rank–trace certificate with the **global** budget
`n₊(Q)` — while `n₊(ΠQΠ) ≤ n₊(Q)` may be strict, giving a strict improvement over applying
`rank_trace_ineq` naively inside `S`.
**Bridge-essentiality.** Requires zeta23's `posIndex_conj_le` (Inertia.lean:51 — pull-back index
monotonicity, **absent from mathlib and tauceti**, both of which only have congruence-invariance
for invertible maps: tauceti `signature_congr` HermitianSignature/Basic.lean:147) composed with
`rank_trace_ineq`. The composition is one lemma; its content is that certificates are stable under
dimension reduction — the property that makes the zero-side argument work with truncated Gram
matrices.
**Contributing results:** `posIndex_conj_le`, `hermForm_conj` (Sylvester.lean:51),
`rank_trace_ineq`.
**First proof step.** Apply `rank_trace_ineq` to `BᴴPB, BᴴQB` (B = orthonormal basis of S, using
`hermForm_conj` to transfer the form), then `posIndex_conj_le` on the `b`-budget; unwind
`frobSq(Bᴴ(P+Q)B) ≤ ‖Π(P+Q)Π‖²_F` (compression contracts Frobenius norm — from tauceti's
`UnitarilyInvariantSeminorm/Projection.lean` if ported, else directly).
**Novelty.** Stated nowhere; it is a *corollary-grade* new statement but with a genuine consumer
(any future compressed zero-density or numerical-spectral certificate) — feasibility: immediate.

### EZ4. Schur-complement/block rigidity form of `lemmaR_tight` — [HYPOTHESIS]

**Statement.** For the block configuration `H = [[A, B],[Bᴴ, C]]` with `A = P` (PSD, rank ≤ r) and
`C = Q`: the extremals of `2c·tr H − ‖H‖²_F − c²·n₊(C)` are exactly those with
`B ∈ ker A ⊗ ran C` — equivalently the Schur complement `C − BᴴA⁺B = C` — i.e. tightness forces
the block decomposition to be the TightMult orthogonal direct sum; conversely any coupling `B ≠ 0`
adds an explicitly computable `2‖B‖²_F + 2Re tr(AB-part)` to the Frobenius energy, a rigidity
theorem for certificate extremals.
**Bridge-essentiality.** zeta23 provides the extremal value (`lemmaR_tight`); the kernel/range
calculus of PSD block matrices (`ker C ⊆ ker Bᴴ`, `ran B ⊆ ran A`) is exactly tauceti's
`PosSemidef/Block.lean` + `PosSemidef.schur_complement₂₂_covariancePseudoInverse`
(`Matrix/SchurComplement.lean:39,58`); mathlib's `SchurComplement.lean` supplies the det/inverse
algebra. No corpus connects rank–trace tightness to Schur-complement rigidity.
**Contributing results:** `lemmaR_tight` (TightMult.lean:93), tauceti `PosSemidef/Block.lean`
(kernel containment), `schur_complement₂₂_covariancePseudoInverse`, `frobSq_add_hermitian`.
**First proof step.** Block-expand `‖H‖²_F = ‖A‖²_F + 2‖B‖²_F + ‖C‖²_F`; run the
`rank_trace_ineq` estimate separately on the diagonal blocks; the cross term `2‖B‖²_F` is
nonnegative and the coupling inside `tr` vanishes iff `AB = BC = 0`, i.e. iff the blocks decouple.

### EZ5. Bandwidth-k pair-correlation ceiling laws — [HYPOTHESIS] (instance at k=1: [VERIFIED])

**Statement (programme).** Define a bandwidth-k certificate on the N-grid as
`(c₀, r)` where `r` is now a kernel `r : {1..N}ᵏ⁻¹ × [0,1] → ℝ` consuming the k-point form-factor
data of a configuration; validity: `c₀ + ⟨data, r⟩ ≤ p₁` (fraction of simple points) for every
admissible configuration. Define `B_k(N)` = sup of certified values over all bandwidth-k
certificates. **Claims to prove:** (a) `B_{k+1} ≤ B_k` and `B_k ≥ 2/3` for all k ≥ 1 if the
zero-density theorem is true (soundness); (b) `B_k` is the value of an explicit finite convex
program whose feasible set is described by majorization (doubly-stochastic) constraints — hence
computable; (c) `lim_k B_k` exists and equals a variational constant for the continuum method;
(d) `B_1 = 0.6818287…` at the N = 256 near-CUE law [VERIFIED, `ceiling_law256`,
CeilingLaw256.lean:38]; the open value `B_2` (does pair data strictly beat 0.68182?) is the first
genuine unknown.
**Bridge-essentiality.** The stability calculus (Abel summation + integration by parts to second
order, `ceiling_stability` Stability.lean:305) is zeta23-only; the convex-programming half —
optimizing linear functionals of measures under majorization/doubly-stochastic constraints — is
exactly tauceti's `Convex/Majorization.lean` transfer descent + `SchurHorn.lean` +
`Convex/DoublyStochasticMatrix.lean`; the numerical instance needs the near-CUE row machinery
(`NearCUE.lean:34`). Neither corpus can even state `B_2` alone.
**Contributing results:** `ceiling_stability`, `ceiling_of_valid_at` (Ceiling.lean:28),
`NearCUE.abs_E` bounds (NearCUE.lean), tauceti `IsWeaklyMajorizedBy` + transfer descent
(`Majorization.lean`), `SchurHorn.lean` Karamata direction.
**First proof step.** Write bandwidth-2 validity as a constraint on the *joint* masses
`s_{j,j'} = S(j,j')/N²`; the second-order integration-by-parts identity (Stability.lean identity
(2)) becomes a double Abel sum; the resulting bound has the same shape `v ≤ p₁ + d₁|r(1,1)| +
e₁(|∇r|) + M(∫|D²r|)` with `D,E` replaced by 2-D discrepancy functions — then optimize the
right side over the near-CUE feasible set with the majorization calculus.
**Novelty.** Bandwidth-one ceilings are not in the classical pair-correlation literature (the
zeta23 appendix is the only source); bandwidth-k laws with computable constants are new
mathematics with a direct bearing on how far the Alpöge–Furman method can be pushed (the
2/3-vs-0.68182 gap).

### EZ6. Infinite-dimensional rank–trace (trace-class/HS, finite positive index) — [HYPOTHESIS]

**Statement.** `P` positive trace-class on a Hilbert space `H` with `rank P ≤ r ≤ ∞`; `Q`
self-adjoint Hilbert–Schmidt with `Q₋` trace-class and `n₊(Q) = sup{dim W : Q|_W > 0} = b < ∞`;
`c > 0`. Then `c·tr P − (c²/4)r + 2c·tr Q − c²b ≤ ‖P+Q‖²_{HS}` (with `r = ∞` read as: the
`−(c²/4)r` term dropped, giving `c·trP + 2c·trQ − c²b ≤ ‖P+Q‖²_{HS}` — already meaningful).
**Bridge-essentiality.** The finite-dimensional proof is zeta23's; the lift needs (i) the
spectral theorem for compact self-adjoint operators (mathlib
`Analysis/InnerProductSpace/Spectrum.lean` compact case; tauceti's von Neumann algebra layer is
available but not needed), (ii) finite-rank compression approximation with monotone trace/norm
convergence, and (iii) compression index monotonicity = EZ3/`posIndex_conj_le`. A genuinely
operator-algebraic statement sitting between RHLinalg and tauceti's `VonNeumannAlgebra/` /
`Schatten` layers, consumable by future ℓ² trace-method arguments in analytic number theory
(e.g. infinite Gram matrices of zeros).
**Contributing results:** `rank_trace_ineq`, `posIndex_conj_le`, mathlib compact spectral
theorem (`InnerProductSpace/Spectrum.lean`), tauceti `UnitarilyInvariantSeminorm/Schatten.lean`.
**First proof step.** For `Π_n` = projection onto an n-dim subspace: apply
`rank_trace_ineq` to `Π_nPΠ_n, Π_nQΠ_n` (needs EZ3's budget step for `n₊(Π_nQΠ_n) ≤ n₊(Q)`);
let `n → ∞` along an exhausting sequence, using lower-semicontinuity of `‖·‖²_{HS}` and monotone
convergence of the traces (all terms monotone along the standard exhaustion).

**Positioning vs classical theory [VERIFIED survey of names in both Lean corpora].**
- *Ky Fan*: the maximum principle (index = max subspace dim) is the engine of RHLinalg's
  `Sylvester.lean`; Ky Fan *norms/sums* exist in tauceti (`KyFan.lean:99`, `FanDominance.lean`)
  and nowhere in mathlib. Lemma R is not a Ky Fan consequence: it mixes trace, rank, positive
  index and Frobenius energy in one inequality — no majorization-only argument yields `−c²b`
  from `n₊(Q) ≤ b` (the pair-block pricing), as `lemmaR_tight` shows the constants are optimal.
- *Wielandt–Hoffman*: tauceti owns it; zeta23 re-derives a one-sided instance inside
  `rank_trace_ineq` (see Q1). Lemma R is incomparable: it lower-bounds `‖P+Q‖²_F` (energy of the
  *sum*) rather than the spectral distance of P and Q.
- *Fejér/majorization*: the Schur–Jensen step (`sum_gc_diag_le_sum_gc_eigenvalues`) is precisely
  the Fejér/Karamata "diagonal ≼ spectrum" fact for convex `g_c`, formalized in tauceti as the
  forward Schur–Horn direction (`SchurHorn.lean`, `DoublyStochasticMatrix.lean`). Lemma R is thus
  a *new member of the majorization family*: a joint majorization constraint coupling the atom
  weights `m_j x_j`, the spectrum of P (through concave cap `k_c`), and the inertia of Q.

---

## §5 Sources consulted

zeta23 (read in full unless noted): `Zeta23/LinAlg/{RankTrace,VonNeumann,Sylvester,Inertia,
PosIndex,Weyl,HermitianPosPart}.lean` (all lines); `Zeta23/ZeroSide/{RankTraceMult,TightMult}.lean`
(all); `Zeta23/PairCeiling/{Defs,Stability(1–100),Ceiling,NearCUE(1–60),CeilingLaw256(1–60)}.lean`;
`Zeta23/MV/{Final,Duality(1–60)}.lean`; `Zeta23/MV/Eigen.lean:46`. mathlib v4.36.0-rc2:
`Analysis/Matrix/{Spectrum (decls list), PosDef, Order, HermitianFunctionalCalculus, LDL, Normed,
Hermitian}.lean`; `Analysis/InnerProductSpace/{Spectrum, SingularValues}.lean`;
`LinearAlgebra/QuadraticForm/{Signature (full header+decls), Real}.lean`;
`Analysis/Convex/Birkhoff.lean:146`; `Algebra/Order/Rearrangement.lean:439`; rg searches for
Weyl/Courant–Fischer/Ky Fan/Wielandt/von Neumann/inertia/Schur decomposition (negative results
cited in §1). tauceti: `Analysis/Matrix/` directory listing + `HoffmanWielandt.lean` (full),
`Eigenvalues/{Basic (195–310), Interlacing (1–75)}.lean`, `HermitianSignature/Basic.lean (1–60 +
decls)`, `SchurComplement.lean (10–30)`, `PosSemidef/Block.lean (10–30)`, `OperatorJensen.lean
(10–28)`, `GramFactorization.lean (decls)`, `Holder.lean`, `Grothendieck.lean (decls)`;
`Analysis/InnerProductSpace/` listing + `CourantFischer.lean (decls)`, `FanDominance.lean (1–50)`,
`DavisEigenvalueChange.lean (1–40)`, `SchurHorn.lean (1–30)`, `KyFan.lean (decls)`;
`Analysis/Convex/{DoublyStochasticMatrix (10–24), Majorization (decls)}.lean`. openai-math:
`lean/ComparatorChallenges/CompleteCrouzeix.lean (decls)`, preprint-title scan (751 entries) for
matrix/RMT/spectral content; negative search `circular ensemble|form factor|sine kernel|GUE|CUE`.
Project context: `cross-math-fronttier/research/RESEARCH.md`, `research/survey/anthropics.md`
(Phase 1). Other lanes' surveys (`tauceti.md`, `openai-math.md`, `mathlib-frontier.md`) were not
present at time of writing; tauceti/openai-math content above was surveyed directly by this lane.
