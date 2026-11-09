# Phase 2 bridge map v1 — tensor / algebraic methods cluster (lane R7)

Scope: the two independent tensor-decomposition→algorithm formalizations inside
`anthropics_formal-math` (**eth**: tensor-network contraction + eight-square/Fock-space pieces;
**3sum-apsp**: Schönhage trilinear forms + pruned recursion), the third independent pipeline in
**openai-math** (Coppersmith–Winograd / matrix-multiplication exponents), the algebra that could
host a shared abstraction (**mathlib**), and the representation-theoretic content of **tauceti**
and **openai-math** that points at the same objects without connecting. All sibling repos
read-only; every claim carries an exact locator. `[VERIFIED]` = read in source; `[HYPOTHESIS]` =
reasoned proposal, flagged for checking.

---

## §0 Cluster snapshot

| Corpus | Tensor-decomposition→algorithm engine | Key formal objects (exact) | Terminal quantitative claim |
|---|---|---|---|
| eth (`/home/doz/zcode-workdir/anthropics_formal-math/eth`) | pieces with parameters (ρ,c) → grid-network grouping → level recursion | `Pieces.Family.Is` (`proof/statements/PiecesStatement.lean:54–63`), `Eight.Signs` (`proof/statements/EightSquareStatement.lean:53`), `AppHalfPieces.op/Q/LemmaQ/LemmaDual` (`proof/statements/AppHalfPiecesStatement.lean:105–175`), `Achievable`/`LevelProposition` (`proof/statements/PrintedStatement.lean:83,164`) | `eStar = 0` (`PrintedStatement.lean:167`, `Given.eStarZero`); k-CNF counted in `2^{C·min{km/√log m, k²n loglog n/√log n}}` (`MainResults.lean:177`) |
| 3sum-apsp (`…/3sum-apsp`) | Schönhage trilinear identity → Full/Pruned recursion → savings function Rc | `Term/phi/psi/chi` (`PaperStatements.lean:105–155`), `Lemma_6` (`:618`), `Mult/gamma` Eq (2)/(3) (`:302,306`), `Pruned.run` (`:492`), `Rc/epsStar` (`:2015–2018`) | Exact Triangle O(n^{2.9994…}) i.e. ε_T = 0.0017 (`EndStatement.lean:82,85`); `Rc < ε* = ln4/(5 ln10) ∈ (0.1204, 0.1205)` (`Sec4_epsStar_numeric`, `:2329`) |
| openai-math (`…/openai-math`) | Coppersmith–Winograd tensor analysis (degeneration, leaf statistics, laser stages) | `OAI/LinearAlgebra/MatrixMultiplication/` (`Model.lean:93,103,107` define `omega`, `rectangularOmega`, `complexAlpha`; `CoppersmithWinograd/` 25 files; `Main.lean:12–24`) | `omega ℂ ≤ 9/4`, `complexAlpha > 93/200`, `rectangularOmega ℂ 0.709 < 523/250` (`MatrixMultiplication/Main.lean`) |
| mathlib (`…/encore-mathlib/repo/mathlib4`) | hosts tensor algebra, lacks all three pipelines | `Mathlib/LinearAlgebra/TensorProduct/` (20 files), `Mathlib/LinearAlgebra/TensorAlgebra/`, `Mathlib/Algebra/FreeAlgebra*`, `Mathlib/LinearAlgebra/ExteriorAlgebra/`, `Mathlib/LinearAlgebra/CliffordAlgebra/` (14 files incl. `Grading.lean`, `SpinGroup.lean`) [erratum 2026-11-09, H/QA: v1 said "17 files"; actual 14], `Mathlib/Algebra/Quaternion.lean`, `Mathlib/Algebra/MvPolynomial/PDeriv.lean` | — (no tensor rank, no matrix-multiplication exponent: `rg "tensor rank|border rank|matrix multiplication exponent" Mathlib` → 0 hits) `[VERIFIED]` |
| tauceti (`…/tauceti`) | no algorithmic pipeline; richest algebraic host | `TauCeti/RingTheory/MvPolynomial/Symmetric/` (PowerSum, Schur incl. `HallInner.lean`), `TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean`, `TauCeti/LinearAlgebra/CliffordAlgebra/` (56 top-level entries, 198 .lean files recursive) [erratum 2026-11-09, H/QA: v1 said "52 files"], `TauCeti/RepresentationTheory/Spin/{LineSign,Triality/TrilinearForm}.lean`, `TauCeti/RepresentationTheory/Crystal/` | — |
| zeta23 (`…/zeta23`) | optimization-over-certificates pattern (analogy donor) | `Zeta23/PairCeiling/` (`ceiling_law256_signed`, `Signed.lean:94`, hypothesis `EnclOK`) | bandwidth-one certificate ceiling 0.6818… (Phase-1 survey §1.3) |

Mathlib gaps relevant to this cluster `[VERIFIED by rg/find]`: no octonion or composition algebra;
no Heisenberg/Weyl algebra (rg `heisenberg|weyl algebra|creation operator|annihilation|fock` → 0);
no symmetric functions Λ (no power-sum basis, no Schur functions, no Hall inner product — only
`Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean` elementary symmetric `esymm`,
`Mathlib/RingTheory/Polynomial/Vieta.lean`, `Mathlib/Combinatorics/Young/` diagrams/SSDT,
`Mathlib/Combinatorics/Enumerative/Partition/`). Partition counting `p(E)` is re-defined by eth
itself (`proof/statements/PartitionStatement.lean:11`, `Partitions.p := Fintype.card
(Nat.Partition E)`) — eth re-proves Hardy–Ramanujan-type bounds rather than import them.

**Errata (2026-11-09, post-public corrections, verified in source).**
(1) tauceti **does** have octonions / composition algebras: `TauCeti/Algebra/CayleyDickson/`
(`TauCeti.DivisionOctonionReal : CayleyDickson ℍ[ℝ]`, `Quaternion.lean:388`; Moufang identities
and Artin's theorem, `CayleyDickson.moufang_*`, `mul_assoc_of_mem_adjoin`, `Artin.lean`). Every
"no octonions" claim above is correct **only for mathlib** (§0, §1.2, §2a); §4(b)'s first proof
step should read "import tauceti's `CayleyDickson` rather than define octonions from scratch".
(2) this mathlib checkout **does** have power sums: `MvPolynomial.psum` and `MvPolynomial.psumPart`
(`Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:351,355`), alongside `hsymm`/`hsymmPart`
(`:312,316`). §1.2's "power-sum basis … absent" is corrected to: mathlib has the p/hsymm
*generators* (2026 additions) but still no Hall inner product, no Schur functions, no Λ as a
graded ring, no ω involution (tauceti holds those).

---

## §1 Intersection table

### 1.1 The two decomposition interfaces, side by side

| Conceptual slot | eth | 3sum-apsp | openai-math (3rd instance) |
|---|---|---|---|
| Object decomposed | the *crossing* `[x=v][y=u]` on 4 bit-strings (`Pieces.cross`, `PiecesStatement.lean:29`) | the 3×3 matrix-multiplication tensor + inner product (`G`, `PaperStatements.lean:178`) | Coppersmith–Winograd powers (`CoppersmithWinograd/`) |
| Polynomial ambient | `Pieces.Four λ = (Fin λ→Bool)⁴→ℤ` (`:26`) | `TriPoly = MvPolynomial (LeftVar ⊕ RightVar ⊕ OutVar) ℤ` (`:161`) | tensor spaces over fields (`MatrixMultiplication/Tensor/`) |
| Decomposition statement | `Σ_{s∈I} A_s = d·cross` (`Family.Is.sum_eq`, `:56`) | `Σ_λ φ_λψ_λχ_λ = G + E` (`Lemma_6`, `:618`) | degeneration/compatibility theorems (`ComplexCWPrimitiveDegeneration.lean`) |
| Per-term budget | `crow s + ccol s ≤ 4ρλ + c·log₂(2λ)` (`Family.Is.caps`, `:59`) | outer/inner per level: `N0 = 3^{L−m}`, `D = 4^m`, `K = C(L,m)` (`:323–327`), inner-set classification `IsInner` (`:189–209`) | leaf statistics (`CWLeafStatistics.lean`, `CWShapeLeaves.lean`) |
| Rank notion in the budget | `FactorsThrough (rowwise A) c` = A factors as `Σ_θ f(x,y,θ)·f'(u,v,θ)` — a rank-≤2^c matrix in the (xy|uv) split (`:33–35,57–58`) | each Term is a rank-1 trilinear form `φ_λ(s)·ψ_λ(t)·χ_λ(z)` with 0/±1 coefficients (`:140–155`) | tensor rank / border rank via degeneration |
| Recursion unraveling | pieces → grid networks → `Achievable` level step (below) | `Full.run` = recursion over levels; `Lemma_7`: leaves multiply `Φ_τ(a)·Ψ_τ(b)`, `Full = Mult` (`:635`); `Lemma_8`: `Mult[a,b][w] = Σ_{u,v} ∏_ℓ γ(u_ℓ,v_ℓ,w_ℓ)·a[u]·b[v]` (`:642`) | laser-method stages (`CWStageC*`) |
| Contribution/pruning | index set `I` of size ≤ (2λ)^c (`card_I`, `:60`) | `Leaf.Contributes τ w` (`:294`), `Pruned.run` on sets `S` (`:492–523`) | `CWLeafRestrictions.lean` |
| One-level improvement | `(K,e) achievable ∧ g = 3K⁸ → (g², (ρ+2/K)e+2/K) achievable`, `LevelProposition` (`PrintedStatement.lean:164`), ρ = `Eight.rho` = 11/12 (`EightSquareStatement.lean:99`); general schedule `e_{ℓ+1} = (ρ+3ζ_ℓ)e_ℓ + 3/K_ℓ` (`LevelsStatement.lean:34–36`) | savings `Rc c γ = ln4/lnΛ`, strictly antitone in c, `Rc → ε*` as c ↓ 10 (`Sec4_Rc_strictAntiOn :2319`, `Sec4_Rc_zero_tendsto :2325`) | `AdmissibleExponent` closure (`Model.lean:93`) |
| Probabilistic control | grouping variance `Var Y ≤ 4PU` over uniform colorings `Fin g → Fin K` (`Variance.stVar`, `proof/networks/Variance/Var.lean:139`; `stVarIsSumOfCov :47`) | deterministic (leaf counts α, β; `Leaves` band `D^18` per Phase-1 survey §1.1) | entropy/separation (`Entropy/`, `Separation/`) |
| Machine model | query machines / `Turing.FinTM2` (`PrintedStatement.lean:77–84`) | word RAM `Instr`/`exec`, `Problem.SolvedInTime` (`EndStatement.lean`, imports nothing) | arithmetic circuits (`Arithmetic.omega`, `Model.lean:93`) |

Structural correspondences (the "rank→speedup" pattern, both sides):

1. **Budgeted rank-1 splitting of a structured tensor.** `[VERIFIED]` eth's `FactorsThrough`
   (`PiecesStatement.lean:33`) is exactly a matrix-rank statement: `F(z,z') = Σ_{θ∈{0,1}^c}
   f(z,θ)f'(z',θ)` says the (z|z') matrix of F has rank ≤ 2^c. 3sum-apsp's `Lemma_6` terms are
   rank-1 in the *three-way* split. Both pipelines then run a recursion whose cost per level is
   the product of the budgets: eth multiplies label lengths (`crow`, `ccol`) through the level
   step; 3sum-apsp multiplies block dimensions (`N0 = 3^{L−m}` outer vs `D = 4^m` inner,
   `K = C(L,m)` interleavings). Same equation, different index partition (2+2 vs 1+1+1).
2. **eth's pieces ↔ 3sum-apsp's Term scheme.** `[VERIFIED-objects / HYPOTHESIS-correspondence]`
   The eight-square pieces `A_i` (`EightSquareStatement.lean:86–96`, `Rb/Cb` from
   `psi k p q = [p⊕q=k]·σ(p,q)`) are built as coefficient extraction from `∏_s (R + T·C)`; the
   Fock-space pieces `A_s` are coefficient extraction `coef υ (Q_s(a^ξ, b^ν) t^η)`
   (`AppHalfPiecesStatement.lean:203`). The 3sum-apsp terms `φ_λ, ψ_λ, χ_λ` are the *same* shape
   in the trilinear world: coefficient functions of a single variable family. In both, the
   "budget" of a piece is the support size of its coefficient family (eth: `Rrow/Rcol = Σ_i
   p(s+i)` partition counts, `:207–210`; 3sum-apsp: counts `α, β` over contributing leaves).
3. **Resolution of identity.** `[HYPOTHESIS]` eth's `LemmaQ.c` — `Σ_{|s|≤E+h} Q_s(a,b) =
   pairing(a,b)·Id` on each weight space `V_E` (`AppHalfPiecesStatement.lean:162–163`) — and
   3sum-apsp's `Lemma_7/8` — `Full = Mult = Σ_{τ contributes} Φ_τ ⊗ Ψ_τ` (`:635,642`) — are the
   operator-theoretic resp. array-theoretic form of one statement: *a pairing-graded sum of
   (left evaluation)·(right evaluation) recovers the scalar pairing times the identity*. Nobody
   states the common abstraction (see §4a).
4. **Two disjoint sign algebras.** eth's `sigma p q = (−1)^{phi p q}` with `phi` bilinear
   upper-triangular + cubic (`EightSquareStatement.lean:43–49`) vs 3sum-apsp's `Eq_1` —
   Strassen's 7-product identity over an arbitrary `Ring` (`PaperStatements.lean:603–611`). Both
   are the "seed identity" of their pipeline; neither corpus notices they live in the same
   algebraic world (composition algebras / normed division: Strassen's identity is the
   quaternion-type 4-square identity for 2×2 blocks; eight-square is the octonion case).
   `[HYPOTHESIS on the general frame; VERIFIED that the identities are stated as cited]`

### 1.2 Mathlib hosting map

| Shared abstraction candidate | mathlib today | what is missing |
|---|---|---|
| Tensor product / algebra | `Mathlib/LinearAlgebra/TensorProduct/` (incl. `Basis.lean`, `Matrix.lean`), `Mathlib/LinearAlgebra/TensorAlgebra/`, `Mathlib/Algebra/FreeAlgebra*` | tensor *rank*, border rank, degeneration — absent |
| Multivariate polynomial substrate of both sides | `Mathlib/Algebra/MvPolynomial/` (incl. `PDeriv.lean` — eth's `nabla` is literally built on it, `AppHalfPiecesStatement.lean:90` `pderiv`) | weight-graded submodule pairing layers; eth re-builds `weightedHomogeneousSubmodule` usage (`:83`) |
| Symmetric functions | `esymm` only (`Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean`) | Λ, power-sum basis `p_μ`, `z_μ` constant, Hall inner product — all absent; **tauceti has them** (`TauCeti/RingTheory/MvPolynomial/Symmetric/PowerSum/`, `Schur/HallInner.lean`) |
| Clifford / composition algebras | `Mathlib/LinearAlgebra/CliffordAlgebra/` (Basic, Grading, SpinGroup, Even…) + `Mathlib/Algebra/Quaternion.lean` | octonions / composition algebras absent — the natural home of `Eight.Signs` |
| Heisenberg / Weyl algebra | nothing (`rg` → 0) | the `[∇_k, ∇_{−l}] = k·δ` layer behind eth's Boson operators (§2c) |
| Partitions | `Mathlib/Combinatorics/Enumerative/Partition/` (Basic, GenFun, Glaisher, YoungDiagram) | asymptotics `p(E) ~ exp(π√(2E/3))` — eth re-proves bounds itself (`PartitionStatement.lean`) |

rg probes for the requested keywords (`Heisenberg`, `Weyl algebra`, `creation annihil`,
`Schur`, `representation`, `tensor`, `rank`) across tauceti and openai-math:
`TauCeti/RepresentationTheory/` is large (CharacterTable/, Crystal/, Spin/, Symmetric/Specht,
Tensor/, LSPath/, QuantumGroups/UqSl2/); openai-math has
`lean/OAI/RepresentationTheory/{VertexAlgebra,Weil,Tensor,TensorSquares,SignedTensor,FoulkesHowe,FoulkesSixth,Hecke,KazhdanLusztig,Young,SpinAngle}`
plus `lean/OAI/LinearAlgebra/{MatrixMultiplication,CliffordAlgebra/KugaSatake,Quaternion,TensorProduct}`
and `lean/OAI/Algorithms/SubexponentialSAT/` — a *fourth* sub-2^δn SAT push parallel to eth's
(`SubexponentialSAT/Algorithm.lean`: "executable separated arithmetic kernels"). `[VERIFIED]`

---

## §2 Lifts and dualities

### 2a. Is `Eight.Signs` an instance of a general phenomenon? Yes — a Pfaffian/cocycle identity of composition-algebra type. `[HYPOTHESIS; components VERIFIED]`

*What is verified:* `Eight.Signs` (`EightSquareStatement.lean:53`):
`p⊕q = p'⊕q' ∧ q ≠ q' → σ(p,q)σ(p',q') + σ(p,q')σ(p',q) = 0`, with
`φ(p,q) = Σ_{1≤i≤j≤3} p_iq_j + q₁p₂p₃ + p₁q₂p₃ + p₁p₂q₃` (`:43–46`). The Lean proof
(`proof/networks/Eight/SecCrossing_Identity.lean`, header: "eight-square identity (Degen 1818,
Graves 1843)") is pure mod-2 arithmetic: `phi_add_phi_bxor`, `four_phi` (`:109,118`) show the
4-term alternation holds because on bits `a⊕b ≡ a+b (mod 2)`.

*The lift:* define the twisted group algebra `ℝ_σ[F₂³]` with `e_p ∗ e_q = σ(p,q)·e_{p⊕q}`.
Classically this is the octonion multiplication table (imaginary units indexed by `F₂³\{0}`);
the eight-square identity is multiplicativity of the octonion norm. Two general readings:

1. **Cocycle reading.** `σ` is a 2-cocycle-style sign on the abelian group `F₂³`; `Eight.Signs`
   says its *antisymmetrized 4-point function vanishes on parallelograms* (`p+q = p'+q'`).
   Substituting `p' = p+d`, `q' = q+d` (the Lean lemmas `d_eq`, `p'_eq`, `q'_eq`,
   `SecCrossing_Identity.lean:70–80`), the identity becomes: the ratio
   `σ(p,q)σ(p+d,q+d) / (σ(p,q+d)σ(p+d,q))` is the constant `−1`, independent of `p,q`. A direct
   computation `[VERIFIED by hand for the bilinear part]`: the upper-triangular bilinear part
   contributes `(−1)^{Σ_{i≤j} d_i d_j}`; the cubic part is exactly the correction making the
   total ratio `−1`. So `Eight.Signs` = "the octonion sign cocycle has constant parallelogram
   ratio −1", i.e. it is a *Pfaffian/hyperbolic sign system* — the same alternation property
   satisfied by Hilbert symbols, Weil-representation/theta multipliers, and fermionic ordering
   signs `(−1)^{Σ_{i<j} a_i b_j}` used in Bravyi(-–Kitaev)-type simulations. In Clifford terms
   (mathlib's `CliffordAlgebra`, tauceti's 52-file development): orthogonal odd vectors
   anticommute, `v·w + w·v = −2⟨v,w⟩`; `Eight.Signs` says the octonion twist σ preserves exactly
   this Clifford alternation after transport through `p ↦ p⊕q`.
2. **Representation reading via tauceti.** tauceti's `SpinPolarizationData.d4TrialityTrilinearForm`
   (`TauCeti/RepresentationTheory/Spin/Triality/TrilinearForm.lean`) is a cyclic, Chevalley-
   invariant trilinear form on `vector ⊗ half-spin ⊗ half-spin` of type D₄ — the triality
   triple through which octonion multiplication is classically expressed (file cites Adams,
   *Lectures on Exceptional Lie Groups*, Ch. 3). A lift "Eight.Signs ⇄ triality" would identify
   eth's σ with the structure constants of tauceti's D₄ triple. Neither corpus makes or could
   make this identification alone: eth has no Clifford/octonion theory; tauceti has no
   `F₂³`-sign statement.

*Does it dualize to 3sum-apsp's trilinear forms?* `[HYPOTHESIS]` Yes, in a precise sense: the
3sum-apsp budget machinery is basis-free in the coefficient ring (terms have coefficients
`phi λ s ∈ {0,±1}`, `PaperStatements.lean:140–149`). Replacing ℤ-valued linear forms by
`±1`-valued cocycle-twisted forms on `F₂`-alphabets turns `Mult`/`gamma` (Eq (2)/(3), `:302,306`)
into a Walsh–Hadamard-type transform whose "pieces" are exactly eth's `A_i`. The dualized
statement would be: *the contribution kernel `γ(s,t,z) = Σ_{λ contributes to z} φ_λ(s)ψ_λ(t)`
(`:306`) satisfies the same parallelogram alternation as σ when the alphabets are `F₂³` and the
terms are read mod 2*. First proof step: compute `gamma` mod 2 for Schönhage's ten terms and
check the 2×2 alternation `γ(p,q)+γ(p',q') ≡ γ(p,q')+γ(p',q) (mod 2)` on `p⊕q = p'⊕q'`.

*Can `Pruned` absorb the level proposition?* `[HYPOTHESIS]` Structurally yes — both are
one-step improvement operators iterated to a fixed point: eth's `e ↦ (ρ+2/K)e + 2/K`
(contraction with ρ<1 ⇒ geometric decay, `Levels.Gen.e_le`: `e_ℓ ≤ 0.85·ρ^ℓ`,
`LevelsStatement.lean:44`) vs 3sum-apsp's `c ↦ Rc(c,γ)` antitone with limit ε* (`:2319–2326`).
An abstract `ImprovementOperator` (contraction ρ<1 or antitone-utility u with sup) with a
single iteration lemma yields both as instances; the level proposition's `+2/K` overhead and
the Pruned recursion's branching cost `K = C(L,m)` are the two instantiations of "additive
per-level cost". See §4a.

### 2b. The Fock/Heisenberg lift of eth's Appendix B (Boson) — the strongest algebraic bridge

`[VERIFIED objects; HYPOTHESIS identifications]` eth's Appendix B operators
(`AppHalfPiecesStatement.lean`):

- `V = MvPolynomial ℕ+ ℚ` (`:73`) with weight grading `V_E` by part-size (`:82`),
  monomial basis `t^μ` (`:76`);
- `nabla`: `∇_{−k} f = t_k·f`, `∇_k f = k·∂f/∂t_k` (`:89–90`) — on mathlib's
  `MvPolynomial.pderiv`;
- `op a r = a[r]` the mode operators of display (47) (`:105`), `Q_s(a,b)` of display (48)
  (`:149`), `LemmaQ` (a) symmetry `Q_s = Q'_s`, (b) support `|s| ≤ E+h`, (c) resolution
  `Σ_s Q_s = (a[−h]b)·Id` (`:159–163`);
- dual families `a^μ = ∏_i (−1)^{μ_i−1} y_{μ_i}` with `y_n = Σ_j C(n,j) t_j` (`:166–169`),
  `b^μ = (h!/z_μ)·t^μ` (`:172`), `z_μ = ∏_k k^{m_k}·m_k!` (`:54`), and
  `LemmaDual: a^μ[−h]·b^ν = h!·[μ=ν]` (`:175`).

The identification `t_k ↔ p_k` (power-sum symmetric function) transports `V` to the degree-graded
ring of symmetric functions. Then:

1. `[VERIFIED]` tauceti has the other side of this correspondence:
   `TauCeti.hallInner_psumPart`: **⟨p_ρ, p_ρ'⟩ = z_ρ·δ_{ρρ'}** for the Hall inner product
   (`TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean:273` [erratum
   2026-11-09, H/QA: v1 cited :264, a proof line of the neighboring `_schurPolyBasis` :257;
   `theorem hallInner_psumPart` is at :273], with
   `hallInner` defined in `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/HallInner.lean`,
   Schur basis orthonormal), and `z_μ` = centralizer order =
   `nat_card_centralizer_eq_zPart` (`TauCeti/RepresentationTheory/Symmetric/ClassSize.lean`).
   eth's `b^μ = (h!/z_μ) t^μ` and `LemmaDual` (`h!·[μ=ν]`) is precisely the normalization of
   the `p`-basis dual against `(z_μ)^{-1}p_μ` — i.e. **`LemmaDual` is the `p`-basis case of the
   Hall-pairing duality that tauceti proves**, with the sign-twist family `a^μ` playing
   `ω(p_μ)` (the involution ω acts by `ω(p_n) = (−1)^{n−1}p_n`; `a^μ` carries exactly the
   factor `∏(−1)^{μ_i−1}`, `:169`).
2. `[HYPOTHESIS]` eth's `nabla` operators satisfy the Heisenberg commutation relation
   `[∇_k, ∇_{−l}] = k·δ_{k,l}·Id`; `a[r]` are the modes of the field `Y(a,z) = Σ_r a[r] z^{-r}`
   of the rank-1 Heisenberg vertex algebra; `LemmaQ` is the statement that `Q_s` are the modes
   of a "coset/commutant" (symmetric-pair) vertex operator between weight spaces. openai-math's
   `OAI/RepresentationTheory/VertexAlgebra/` (100+ files: `Locality.lean`, `ModuleModeAlgebra`,
   `CreationDistribution`, Virasoro modes, `StronglyRationalVOA`) is the analytic VOA theory —
   same mode calculus, never connected to a combinatorial symmetric-function model.
   mathlib has no Heisenberg algebra at all.

### 2c. Grouping/variance duality

`[VERIFIED]` eth's `Variance.stVar: Var Y ≤ 4PU` (`proof/networks/Variance/Var.lean:139`) is
proved via `stVarIsSumOfCov` (variance = sum of covariances of pair-indicators, `:47`) plus the
three schematic facts: covariances vanish for disjoint pairs (`stCovDisjoint`), are ≤ 1
(`stCovLeOne`), and the "Hence" step `stHence` holds for *any* numbers with those two
properties (`Var.lean:18–21` docstring). This is an abstract second-moment lemma in disguise —
see §4d.

---

## §3 Quantitative transfers (frozen constants on both sides)

Frozen constants inventory `[VERIFIED]`:

- eth: ρ = 11/12 (`Eight.rho`, `EightSquareStatement.lean:99`) **and** ρ = 1/√2
  (`ThmHalfPiecesPure`, `AppHalfPiecesStatement.lean:240` — two independent piece
  constructions with different ρ; the Lean `LevelProposition` is printed at `Eight.rho` =
  11/12, `PrintedStatement.lean:163–164`); g = 3K⁸ (`:158,164`); ζ_ℓ = 2^{−ℓ−5}, schedule
  `e_{ℓ+1} = (ρ+3ζ_ℓ)e_ℓ + 3/K_ℓ`, `e_0 = 1/2`, `K_0 = 2^{x₀}`, `K_{ℓ+1} = g_ℓ²`
  (`LevelsStatement.lean:23–36`); the decay `e_ℓ ≤ 0.85·ρ^ℓ` (`:44`).
- 3sum-apsp: ε_T = 0.0017 (`EndStatement.lean:82`); ε* = ln4/(5·ln10) with `0.1204 < ε* <
  0.1205` (`PaperStatements.lean:2018,2329`); `Rc c γ = ln4/lnΛ` strictly antitone on
  `c ≥ 10` for every γ ≥ 0 (`:2319`), `Rc c 0 → ε*` as c ↓ 10 (`:2325`), `Rc c γ < ε*`
  (`:2334`); band `D = 4^m`, `D^18` leaf band (Phase-1 survey §1.1: `Leaves`, Table 2 rows);
  the 3SUM exponents 1.9992 / APSP 2.99942.
- openai-math: ω(ℂ) ≤ 9/4, α > 93/200, rectangular ω(0.709) < 523/250
  (`MatrixMultiplication/Main.lean:12–24`); model `omega F := sInf {τ | AdmissibleExponent F
  τ}` (`Model.lean:93`).

Transfers, ranked:

1. **[Best prospect] Instantiate 3sum-apsp's undefined rectangular exponents with OAI's proved
   ones.** `[VERIFIED gap; HYPOTHESIS payoff]` 3sum-apsp's `Corollary_40_fail τ₀`
   (`PaperStatements.lean:4120`, per survey §1.1) is parameter-universal over reals ω ≥ 2,
   ω₂, ω₃ precisely because "the rectangular exponents are not defined" (`docs/REMARKS.md`,
   "Exponents of matrix multiplication (ω, α, μ and the rectangular exponents) are not
   defined… That the true exponents satisfy these lower bounds is not proved"). OAI's
   `rectangularOmega ℂ 0.709 < 2.092` and `complexAlpha > 0.465` are exactly such proved
   exponent *values*. Transfer: compose OAI's `AdmissibleExponent` closure theorems with
   3sum-apsp's `Corollary_40_fail`-style phase analysis to convert the abstract refutation
   ("for **every** ω ≥ 2 … programs achieve Phase 2 in O(n^{2−0.063τ})…") into a numeric one at
   OAI's certified exponents. Barrier check needed: whether OAI's rectangular bounds satisfy
   3sum-apsp's Phase-2/Phase-3 hypotheses at their frozen constants (0.063, 0.437, 1/18, τ <
   ε*) — a finite inequality check, not new machinery.
2. **Trilinear (ρ,c)-pieces for a matrix-multiplication tensor via the Fock construction.**
   `[HYPOTHESIS]` eth's `ThmHalfPiecesPure` produces budgeted decompositions of the *crossing*
   tensor with ρ = 1/√2 from the dual families `a^μ, b^μ`. The same dual-family mechanism
   applied to a three-family version (left/right/output weight spaces, ternary duality
   `a^μ[−h]·b^ν = h![μ=ν]` extended to a trilinear pairing) would produce Schönhage-type
   identities with partition-count budgets. If it beat ρ = 11/12 for a *three-way* budget
   inequality `c^{out}+c^{row}+c^{col} ≤ 4ρ'λ`, it would feed 3sum-apsp's Pruned recursion a
   better savings constant than the ten frozen Schönhage terms. Barrier: the duality
   `LemmaDual` is inherently binary-pairing; no trilinear dual family is known even classically
   here. This is exactly empty-zone material (§4c).
3. **Which are barrier-limited.** `[VERIFIED barrier objects]` 3sum-apsp's ε* = 0.1204 is a
   *sup over its certificate class*: `Rc` is antitone with limit at c ↓ 10 (`:2319,2325`) — no
   schedule inside the band framework beats ε*, by `Sec4_Rc_lt_epsStar` (`:2334`). zeta23's
   `ceiling_law256_signed` (`Zeta23/PairCeiling/Signed.lean:94`, hypothesis `EnclOK`) is the
   same pattern perfected: an explicit ceiling (0.6818…) for a whole certificate class
   (bandwidth-one), with in-kernel `decide`-checked row inequalities. eth's `e* = 0` is *not*
   barrier-limited (the recursion drives the exponent to zero). Transfer direction:
   import the zeta23 *ceiling pattern* into 3sum-apsp — prove a matching lower barrier "every
   pruned-recursion certificate with band structure `D ≤ 4^m`, leaf counts α, β saves at most
   ε* (or less)" — would upgrade `Sec4_Rc_lt_epsStar` from "this Rc < ε*" to "no Rc-type
   certificate exceeds ε*". Not present in either corpus. `[HYPOTHESIS]`
4. **ρ-transfer inside eth is already two-valued (11/12 vs 1/√2)** `[VERIFIED]`; the printed
   `LevelProposition` (`PrintedStatement.lean:164`) is stated at `Eight.rho = 11/12`, while
   `ThmHalfPiecesPure` (`AppHalfPiecesStatement.lean:239–242`) gives ρ = 1/√2 pieces with
   costs `⌈log R^{row/col}_s⌉` = partition-count ceilings. A Lean-level transfer "re-instantiate
   `LevelProposition` at 1/√2 via `ThmHalfPiecesPure`" is internal to eth but never stated as
   one theorem (`PaperIndex.level := Given.levelProposition` at 11/12 only,
   `PaperIndex.lean:1138`); it would strictly improve the main constant C. Cheap, but it is a
   within-corpus gap, not a bridge; listed for completeness.

---

## §4 Empty zones — candidate NEW theorems

### (a) Unified "decomposition ⇒ algorithm" meta-theorem over an abstract budgeted-splitting structure

**Statement sketch.** Define a `BudgetedSplit` over an effective index category: data
`d, I, A_i, c^{row}_i, c^{col}_i` (mirroring eth's `Pieces.Family.Is`,
`PiecesStatement.lean:54–63`) *or* the trilinear variant `φ_λ, ψ_λ, χ_λ` with contribution
relations (mirroring `Term.Contributes`/`Leaf.Contributes`,
`3sum-apsp/PaperStatements.lean:212,294`). Meta-theorem, two clauses: (i) *(contraction case)*
if the split has ratio ρ < 1 and the one-level transformation `T: (K,e) ↦ (g(K)²,
(ρ+2/K)e+2/K)` preserves solvability of the associated evaluation problem, then the amortized
exponent tends to 0 (geometric schedule); (ii) *(antitone case)* if the one-level saving
`u(c)` is strictly antitone in the branching width with limit u*, then every level schedule
achieves at most u*, and schedules `c_ℓ → 10` achieve it.
**Bridge-essentiality.** Neither corpus can state it: eth's interface is hard-wired to
query-machine clique evaluation (`Achievable`, `PrintedStatement.lean:83`) and 3sum-apsp's to
the word-RAM `Problem.SolvedInTime` (`EndStatement.lean:67`); the *shared* shape exists only
when both are read together (survey §4: "the two never share API… which is itself an empty
zone"). OAI's `AdmissibleExponent` (`Model.lean:93`) is the third instance of the same closure
schematic.
**Contributing named results.** eth: `Eight.LemPieces` (`EightSquareStatement.lean:107`),
`GroupingLemma` (`PrintedStatement.lean:157`), `LevelProposition` (`:164`),
`Levels.Gen.e_le` (`LevelsStatement.lean:44`); 3sum-apsp: `Lemma_6/7/8`
(`PaperStatements.lean:618,635,642`), `Sec4_Rc_strictAntiOn/zero_tendsto` (`:2319,2325`);
OAI: `AdmissibleExponent` closure under degeneration (`CoppersmithWinograd/`).
**First proof step.** In Lean, define `BudgetedSplit` as a structure with fields
`sum_eq : Σ A_i = d • T`, `factors_row/col`, `caps` (copying `Family.Is` verbatim) plus a
`Compose` operation copying `Lemma_8`'s product-over-levels formula; then re-prove eth's
`Levels.Gen.PartA.e_le` and a `Sec4_Rc`-style limit lemma as two corollaries of one geometric-
series/monotone-limit argument. Feasibility: high — both source proofs are already
"statement-plus-schedule" shaped.

### (b) Pfaffian/cocycle classification of `Eight.Signs`; symmetric-function interpretation

**Statement sketch.** (i) There is a composition algebra (octonions) `O` over ℚ with imaginary
basis `e_p`, `p ∈ F₂³\{0}`, with `e_p·e_q = σ(p,q)·e_{p⊕q}` for eth's σ; consequently
`Eight.Signs` = "the octonion structure cocycle has constant parallelogram ratio −1". (ii) For
every n ≥ 2 there exist sign systems `σ_n` on `F₂ⁿ` (upper-triangular form + higher
corrections) with the same parallelogram alternation, and each yields an `Eight.LemPieces`-type
budget lemma with ratio ρ_n = 1 − Θ(1/n); the n = 3 case is `Eight.LemPieces.c_sum_t`
(`crow + ccol ≤ 11t`, `EightSquareStatement.lean:115`).
**Bridge-essentiality.** eth states and uses σ but never identifies it (proof is mod-2
arithmetic only, `SecCrossing_Identity.lean:22–23`: "no step runs through the values of a
block"). mathlib has Clifford algebras but **no octonions/composition algebras**; tauceti has
`CliffordAlgebra/` + D₄ `d4TrialityTrilinearForm` but no `F₂ⁿ`-sign systems. Part (ii)'s
ρ_n-family is stated nowhere. The symmetric-function reading of `ψ_k(p,q) = [p⊕q=k]σ(p,q)`
(`EightSquareStatement.lean:58`) — these are matrix coefficients of a Weil-representation-type
projective action of `F₂³` — would connect to tauceti's `Weil`-adjacent content and OAI's
`RepresentationTheory/Weil/` (`AdelicSplitting/`, `Local/`).
**Contributing named results.** `Eight.Signs`, `psi/Rb/Cb`, `Eight.LemPieces`
(`EightSquareStatement.lean:49–116`); mathlib `CliffordAlgebra` (anticommutation
`CliffordAlgebra/Basic.lean`); tauceti `SpinPolarizationData.d4TrialityTrilinearForm`
(`Spin/Triality/TrilinearForm.lean`, cyclic + Chevalley-invariant trilinear form); tauceti
`Spin/LineSign.lean` (two Fock actions `c_P`, `c_{P⁻}` on `S = ⋀·W`, compared by the grade
involution — the same "sign choice is invisible to Spin(V)" phenomenon at the representation
level).
**First proof step.** Define octonions (or just the twisted group algebra `ℝ_σ[F₂³]`) in Lean;
prove `e_p∗e_q = σ(p,q)e_{p⊕q}` by `decide` over the 8×8 table; derive `Eight.Signs` from
`(e_p∗e_q)∗(e_{p'}∗e_{q'}) + (e_p∗e_{q'})∗(e_{p'}∗e_q) = 0` via alternation, isolating the
cubic correction as the unique one making the ratio constant.

### (c) Algebraic statements about the Fock operators `a[r]`, `Q_s` beyond `LemmaQ`/`LemmaDual`

**Statement sketch.** Three escalating theorems on `V = MvPolynomial ℕ+ ℚ`:
(i) *Heisenberg relations*: `[∇_k, ∇_{−l}] = k·δ_{k,l}·Id` and the mode-commutator
("[a[r], b[s]] = Σ (structure constants)·(⋆)[r+s]") — Borcherds' commutator formula for the
rank-1 Heisenberg vertex algebra;
(ii) *Parseval for the resolution of identity*: with `⟨a,b⟩_h := pairing h a b`
(`AppHalfPiecesStatement.lean:131`), `Σ_s Q_s^{†}Q_s = |pairing|²·Id` on each `V_E` — combining
`LemmaQ.a` (Q_s = Q'_s) with the dual families;
(iii) *Hall identification*: under `t_k ↔ p_k`, `pairing(h, a, b) = h!·⟨ω(a), b⟩_{Hall}` where
`ω` is the symmetric-function involution and `⟨·,·⟩_{Hall}` tauceti's `hallInner` — making
`LemmaDual` the `p`-basis case of `hallInner_psumPart` (`⟨p_ρ,p_ρ'⟩ = z_ρδ`,
`FrobeniusCharacteristic.lean:273`), and `b^μ = (h!/z_μ)t^μ` the z_μ-dual normalization.
**Bridge-essentiality.** (i) is provable from eth's side alone but is stated nowhere (eth's
`OpFacts` has only linearity/finsum facts, `:110–117`); (ii) needs both `LemmaQ` and
`LemmaDual` and is not drawn in eth; (iii) *requires tauceti's Frobenius characteristic theory*
(`frobeniusCharacteristic`, cycle-type formula, `hallInner`) — neither corpus alone can state
the identification. OAI's `VertexAlgebra/` supplies the mode-calculus template
(`ModuleModeAlgebra`, `Locality`) but for analytic unitary VOAs, disconnected from
combinatorial bases. Every downstream consumer (eth's `PieceFacts` row/col displays (54)/(55)
(`:221–227`) would become commutator computations) profits.
**Contributing named results.** `OpFacts/O1/O3`, `LemmaQ`, `LemmaDual`, `PieceFacts`,
`ThmHalfPiecesPure` (`AppHalfPiecesStatement.lean:110–242`); tauceti `hallInner`,
`hallInner_psumPart`, `frobeniusCharacteristic` (`Schur/HallInner.lean`,
`FrobeniusCharacteristic.lean`); OAI `StronglyRationalVOA` mode files
(`VertexAlgebra/ModuleModeAlgebra.lean`, `Locality.lean`).
**First proof step.** Prove `[∇_k, ∇_{−l}] = kδ` by `MvPolynomial.pderiv` computation
(mathlib's `PDeriv.lean` already has `pderiv_mul`); then transport `hallInner` to
`MvPolynomial ℕ+ ℚ` via the power-sum embedding and verify `pairing h (aFam μ) (bFam ν) = h!·[μ=ν]`
reduces to `hallInner_psumPart`.

### (d) Common "grouping/variance" lemma (abstract second-moment method)

**Statement sketch.** `GroupingVar`: let `P` be a finite set of "events with weights" `c : P →
ℕ`, `χ` a uniform coloring of a ground set into K classes, `Y = Σ_{p} c_p·1[E_p(χ)]`. Assume
(a) each `Pr[E_p] = 1/K²`; (b) `E_p`, `E_q` independent when the supports of p, q are disjoint;
(c) `Pr[E_p ∧ E_q] ≤ 4/K²` otherwise. Then `E Y = U/K²` and `Var Y ≤ 4PU` (P = number of
non-disjoint pairs, U = Σ c_p). Corollary: Chebyshev existence of a coloring with `Y ≤ U/K² +
2√(PU)` — the grouping step of eth's Lemma 1.
**Bridge-essentiality.** `[VERIFIED abstractness]` eth's own `stHence` is already stated for
"any numbers in the place of the covariances that vanish for disjoint pairs and are bounded
otherwise" (`Var.lean:18–21`) — the abstraction is one step away but stops at the clique
application. Candidate second instances across corpora: zeta23's `PrimeSide/` Gram-matrix
trace/variance estimates (survey §4: "structurally identical… a shared probabilistic lemma
layer is a plausible bridge"); OAI's `SubexponentialSAT/Moments.lean` (moment weights for
coefficient extraction — same sum-of-indicators bookkeeping, `[HYPOTHESIS]` on exact fit). No
corpus states the lemma over an abstract probability space.
**Contributing named results.** `Variance.stVar/stVarIsSumOfCov/stVarOf`
(`proof/networks/Variance/Var.lean:47,131,139`), `stCovDisjoint/stCovLeOne` (`Variance/Cov.lean`);
zeta23 rank-trace machinery as the linear-algebraic mirror (`Zeta23/LinAlg/RankTrace.lean:163`,
per survey).
**First proof step.** Generalize `Var.lean`'s proofs verbatim: replace `Fin g → Fin K` by an
arbitrary finite probability space with a `Pairwise`-independence hypothesis; the eth proofs
(`sum_comm`, `sum_filter` manipulations) port unchanged.

---

## §5 Sources consulted

- `/home/doz/zcode-workdir/cross-math-fronttier/AGENTS.md`, `research/RESEARCH.md`,
  `research/survey/anthropics.md` (Phase-1 survey; tauceti/openai-math/mathlib-frontier surveys
  not present at time of writing).
- 3sum-apsp: `PaperStatements.lean` (root, 4194-line statement file: lines 100–340, 560–700,
  2295–2340); `EndStatement.lean` (via survey); `docs/REMARKS.md`, `docs/INDEX.md` (via survey).
- eth: `proof/statements/EightSquareStatement.lean` (all 118 lines);
  `proof/statements/AppHalfPiecesStatement.lean` (all 245 lines);
  `proof/statements/PiecesStatement.lean:20–94`; `proof/statements/PrintedStatement.lean:60–170`;
  `proof/statements/LevelsStatement.lean:1–57`; `proof/statements/PartitionStatement.lean:1–30`;
  `proof/networks/Eight/SecCrossing_Identity.lean:1–130`;
  `proof/networks/Variance/Var.lean:1–60`; `proof/PaperIndex.lean` (alias lines 918–2394);
  `proof/README.md:160–183` (Boson entry).
- mathlib (read-only checkout): directory listings + rg over
  `Mathlib/LinearAlgebra/{TensorProduct,TensorAlgebra,CliffordAlgebra,ExteriorAlgebra}`,
  `Mathlib/Algebra/{Quaternion,MvPolynomial,FreeAlgebra*}`,
  `Mathlib/RingTheory/MvPolynomial/Symmetric`, `Mathlib/Combinatorics/{Young,Enumerative/Partition}`.
- tauceti: `TauCeti/RepresentationTheory/Symmetric/FrobeniusCharacteristic.lean` (head 60 +
  rg); `TauCeti/RingTheory/MvPolynomial/Symmetric/` (listing; `Schur/HallInner.lean`);
  `TauCeti/RepresentationTheory/Symmetric/ClassSize.lean` (rg); `TauCeti/RepresentationTheory/
  Spin/LineSign.lean` (head 35), `Spin/Triality/TrilinearForm.lean` (head 45);
  `TauCeti/LinearAlgebra/CliffordAlgebra/` (listing, 56 entries / 198 .lean files);
  `TauCeti/RepresentationTheory/{Crystal,Tensor,CharacterTable}` and
  `TauCeti/Combinatorics/{Young,ChordDiagram}` (listings/headers);
  `TauCeti/Algebra/Lie/Heisenberg/Orbit.lean` (rg).
- openai-math: `lean/OAI/LinearAlgebra/MatrixMultiplication/Main.lean` (all), `Model.lean`
  (rg 93–107), `CoppersmithWinograd/` (listing); `lean/OAI/RepresentationTheory/` (listing;
  `VertexAlgebra/AdjointMass.lean` head); `lean/OAI/Algorithms/SubexponentialSAT/{Algorithm,
  Moments}.lean` (heads); `lean/OAI/LinearAlgebra/{CliffordAlgebra,TensorProduct,Quaternion}`
  (listings); `preprints/` title scan (751 entries; Matrix-Multiplication-Nine-Fourths,
  Complex-MM-2.258, Fock-space/Laughlin, Heisenberg-chain, Foulkes, quasisymmetric-function
  entries).
- zeta23: `Zeta23/PairCeiling/{Signed,RowCert}.lean` (rg for `ceiling_law256`,
  `EnclOK`); rest via Phase-1 survey.
