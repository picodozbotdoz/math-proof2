# Candidate dossier 03 — ez3-compression-rank-trace (with sub-candidate 03a)

Lane R6, 2026-11-09. Realizes empty zone EZ3 of `research/bridges/linear-algebra.md` §4
(and the §1 shared-gap row "inertia pull-back `posIndex_conj_le` … absent from mathlib and
tauceti"). Tags: [VERIFIED] / [HYPOTHESIS].

**Honesty note up front.** The mathematics of sub-candidate 03a is *classical* (it is the
pullback half of Sylvester's law of inertia); its novelty is as a **formalized statement
absent from all four corpora** — it is the missing-glue lemma, not a new theorem. The
discovery content of this dossier is the *composition* (the compression rank–trace inequality
with a global inertia budget, Theorem M below), which is stated nowhere — including inside
zeta23, where `posIndex_conj_le` is proved but **never consumed** [VERIFIED:
`rg -n 'posIndex_conj_le' zeta23/Zeta23/` → only its definition site
`Zeta23/LinAlg/Inertia.lean:51`; no hit in `ZeroSide/`, `Final.lean`, or anywhere else].

---

## Name

ez3-compression-rank-trace

## One-line pitch

The rank–trace certificate survives compression to any subspace with the *global* positive
index as its budget — a two-line composition of zeta23's never-used inertia pullback with its
rank–trace inequality, yielding the compression-stability property that makes Gram-matrix
truncation legitimate in spectral zero-density arguments.

## Precise mathematical statement

**Setting [VERIFIED].** `𝕜` an `RCLike` field; `n, d` finite types with `Fintype`/`DecidableEq`;
`RHLinalg.rtrace`, `frobSq`, `posIndex` as in dossier 01 (`zeta23/Zeta23/LinAlg/PosIndex.lean:41,70,73`).

**Sub-candidate 03a (missing glue, classical math, absent from all corpora).**
For `Q : Matrix m m 𝕜` Hermitian and **any** `B : Matrix m d 𝕜` (no rank/injectivity
hypothesis):

```
posIndex (isHermitian_conjTranspose_mul_mul B hQ) ≤ posIndex hQ
```

i.e. the positive index of the pulled-back Hermitian form `BᴴQB` never exceeds that of `Q`.
[VERIFIED: this exact statement is proved in the donor as
`RHLinalg.posIndex_conj_le` (`zeta23/Zeta23/LinAlg/Inertia.lean:51`), from
`finrank_le_posIndex_of_posDefOn` (Sylvester.lean:82) + `posDefOn_range_hermPosPart`
(Sylvester.lean:123).] Its **Lean-phrasable mathlib form** (the donation target): for
`T : E →ₗ[𝕜] E` self-adjoint on a finite-dimensional inner-product space and any linear
`B : F →ₗ[𝕜] E`, `n₊(B† T B) ≤ n₊(T)` with `n₊` defined via `LinearMap.IsSymmetric.eigenvalues`
(`Mathlib/Analysis/InnerProductSpace/Spectrum.lean:277`).

**Theorem M (main, new) [HYPOTHESIS].** Let `P : Matrix n n 𝕜` with `P.PosSemidef`,
`rank P ≤ r`; `Q : Matrix n n 𝕜` Hermitian; `U : Matrix n d 𝕜` with orthonormal columns
(`Uᴴ * U = 1`, i.e. `U ∈ ` the isometry `Matrix` counterpart of
`Matrix.unitaryGroup`-restricted maps — Lean: `(Uᴴ * U) = 1`); `c > 0`. Then

```
c · rtrace (Uᴴ*P*U) − (c²/4) · (Uᴴ*P*U).rank + 2c · rtrace (Uᴴ*Q*U) − c² · posIndex hQ
  ≤ frobSq (Uᴴ*(P+Q)*U).
```

Note the budget is `posIndex hQ` — the **global** index of `Q` on the ambient space — and
`rank (UᴴPU) ≤ rank P ≤ r` is automatic (rank contraction under compression). Since
`frobSq(Uᴴ M U) ≤ frobSq M` for all `M` (compression contracts Frobenius norm), Theorem M
also implies the a-priori weaker but often-quoted form

```
c·rtrace(UᴴPU) − (c²/4)·rank(UᴴPU) + 2c·rtrace(UᴴQU) − c²·posIndex hQ ≤ frobSq (P+Q).
```

**Corollary M′ (comparison content, honest) [HYPOTHESIS].** Theorem M with the global budget
is *valid without any knowledge of the compressed index* `posIndex (UᴴQU)`; the naive
in-subspace route (`rank_trace_ineq` applied to `(UᴴPU, UᴴQU)`, `zeta23/Zeta23/LinAlg/
RankTrace.lean:163`) requires that compressed index and gives the *stronger* certificate
`− c²·posIndex(UᴴQU) ≤ …` whenever it is available (by 03a,
`posIndex(UᴴQU) ≤ posIndex hQ`). The value of M is therefore *robustness*, not strength:
(i) it makes the certificate stable under arbitrary dimension reduction (any `d`, any
isometric `U`); (ii) in the Gram-matrix truncation pattern (observe only `s` of `d` atoms),
M licenses the truncated certificate at the price `c²·n₊(Q)` with `n₊(Q)` the global
off-line-pair count — the only index datum available in situ. **This refines the
bridge-map phrasing** (`research/bridges/linear-algebra.md` §2 L3 said "strict improvement";
correct statement: strict *availability* improvement — M is usable precisely when the
compressed index is unknown).

**Theorem M″ (strict-strength sub-question) [HYPOTHESIS, open-ish].** Characterize when M's
conclusion with the *global* budget is still best possible, i.e. when
`posIndex (UᴴQU) = posIndex hQ` (index-preserving compressions — e.g. `U` ranging onto a
subspace meeting every positive eigenvector). Sufficient condition: `ran U ⊇ ran Q₊`
(equivalently `Q₊ = U Uᴴ Q₊ U Uᴴ`); proof via `hermPosPart` functoriality
(`HermitianPosPart.lean:42 specMap` + unitary conjugation). Easy direction provable now.

Quantifier order (Lean): `∀ {𝕜} [RCLike 𝕜] {n d} [Fintype n] [DecidableEq n] [Fintype d]
[DecidableEq d] (P Q : Matrix n n 𝕜) (hP : P.PosSemidef) (hQ : Q.IsHermitian) (U : Matrix n d 𝕜)
(hU : Uᴴ * U = 1) {r : ℕ} (hr : P.rank ≤ r) {c : ℝ} (hc : 0 < c), <M>`.

## Novelty check

- **Corpus side** (direct rg, 2026-11-09; `research/qa/decl-index.tsv` absent):
  - mathlib: `rg -i -c 'posIndex|positive.?index' Mathlib/` → 1 hit, the docstring mention of
    sorted eigenvalues (false positive; `LinearAlgebra/QuadraticForm/Signature.lean` uses
    `sigPos`, not index-of-Hermitian); `rg -i -c 'compressed.{0,15}(index|inertia)|…' Mathlib/`
    → **0**; no pullback/compression inertia statement exists (R9 §1 #2 verdict "NUANCED …
    Hermitian side absent").
  - tauceti: `posIndex|positive.?index` → 401 raw hits, but: sampled hits are either
    `Data/Nat/Prime` false positives or the *path-crossing* Morse theory of
    `Analysis/Matrix/HermitianSignature/Crossing.lean:28,66,257` (index changes along paths of
    forms — different statement: local jumping, not pullback monotonicity); tauceti's actual
    inertia object is the ℤ-valued `Matrix.IsHermitian.signature`
    (`HermitianSignature/Basic.lean:68`) with `signature_congr` (:147) **only for invertible
    congruence and as an equality** — no monotonicity under general `B`, no `n₊/n₋` pair, no
    compression form. `rg 'rank.?trace'` → false positives only (dossier 01).
  - openai-math: `posIndex|positive.?index` → 137 hits, all `Fin`-index/combinatorics senses
    (spot-checked); `rank.?trace` → IndependentSets machinery, unrelated (dossier 01).
  - anthropics: 03a **present** (that is its role: donor); Theorem M **absent** —
    `rg -i -n 'compress|subspace|restriction' zeta23/Zeta23/ZeroSide/*.lean` → **0 hits**
    [VERIFIED this lane]; `rank_trace_ineq` is applied only on the full space
    (`ZeroSide/RankTraceMult.lean:281–346`, `ZeroSide/Mult.lean`), and `posIndex_conj_le` has
    no consumers at all.
- **Literature side: PENDING lane R8 round-2.** Queries R8 should run:
  1. Google Scholar / zbMATH: `"law of inertia" "compression"`; `"positive index" "monotone"
     "congruence"` — expectation: 03a is textbook-classical (Horn–Johnson *Matrix Analysis*
     ch. 4, inertia theorems 4.5.x); the point of the search is to *confirm classical status*
     (for honest labeling) and find whether anyone states the compressed *trace inequality*;
  2. `Cauchy interlacing compression positive eigenvalues` — interlacing implies the isometric
     case of 03a (see Proof sketch route 2) — nearest miss in classical form;
  3. `"trace inequality" "restriction" OR "compression" Hermitian "Frobenius"` — check no
     named "compressed trace inequality" exists;
  4. `"Gram matrix" truncation "inertia" zeros` — whether the number-theory literature states
     M implicitly (expectation: no; the Alpöge–Furman paper works in situ, never compresses).
- **Known nearest misses:** (a) zeta23 `posIndex_conj_le` (Inertia.lean:51) = 03a exactly,
  proved and unused; (b) tauceti `signature_congr` (HermitianSignature/Basic.lean:147) —
  equality under *invertible* congruence only, ℤ-valued signature; (c) tauceti Cauchy
  interlacing `eigenvalues₀_submatrix_le` / `eigenvalues₀_le_eigenvalues₀_submatrix`
  (`Analysis/Matrix/Eigenvalues/Interlacing.lean:58,71`) — implies 03a for *isometric
  embeddings into a basis* (see sketch route 2), not for general `B`, and never states an
  index inequality; (d) mathlib `QuadraticForm.sigPos` (`LinearAlgebra/QuadraticForm/
  Signature.lean:65`) — real quadratic forms only, ordered fields; Hermitian case unexpressed
  (R9 §1 #2).

## Bridge analysis

- **Corpora bridged:** anthropics/zeta23 (03a donor + rank–trace donor) × tauceti
  (alternative 03a route via interlacing; Frobenius-contraction facts) × mathlib
  (LinearMap-level donation target).
- **Why essential:** Theorem M needs both `posIndex_conj_le` (zeta23-only; no other corpus has
  pullback monotonicity) and `rank_trace_ineq` (zeta23-only). The *mathlib-facing* version of
  03a additionally needs a Matrix↔LinearMap transport that neither zeta23 (matrix-only) nor
  mathlib (no Hermitian inertia at all) provides — a genuine two-sided port. The tauceti
  interlacing route shows the isometric case is *derivable* in a third corpus — valuable as a
  cross-check (two independent proof routes), and it is what makes 03a low-risk.
- **Empty-zone fit:** `research/bridges/linear-algebra.md` §1 row 3 (shared gap), §2 L3, §4 EZ3.

## Proof-strategy sketch

1. **Route 1 (donor route, primary).** `PU := Uᴴ*P*U` is PSD (`PosSemidef` closed under
   `conjTranspose_mul_mul_same`-conjugation; mathlib `Analysis/Matrix/PosDef.lean` +
   zeta23 `hermForm_conj`, Sylvester.lean:51). Apply `RHLinalg.rank_trace_ineq`
   (`zeta23/Zeta23/LinAlg/RankTrace.lean:163`) to `(PU, QU := Uᴴ*Q*U)` with
   `hr' : PU.rank ≤ r` (rank contraction: `Matrix.rank_mul_le_*` family / mathlib
   `Matrix.rank_mul_le_rank`) and `hb' : posIndex hQU ≤ posIndex hQ` **= 03a applied to
   `B := U`** (Inertia.lean:51). Conclude M directly. This is two lemma applications — the
   entire content is the (missing) middle step 03a and the observation that the budget may be
   taken global.
2. **Route 2 (cross-check via tauceti).** For the isometric case, 03a follows from Cauchy
   interlacing: `λᵢ(QU) ≤ λᵢ(Q)` (`TauCeti/Analysis/Matrix/Eigenvalues/Interlacing.lean:58`,
   after unitary change of basis putting `ran U` as the first `d` coordinates —
   `LinearMap.IsSymmetric.eigenvalues_congr`, `CourantFischer.lean:510`); then
   `#{i < d : λᵢ(QU) > 0} ≤ #{i < d : λᵢ(Q) > 0} ≤ posIndex hQ`. Independent of Sylvester —
   a one-route-if-other-fails insurance and a check that the two corpora agree.
3. **Frobenius contraction.** `frobSq(Uᴴ M U) ≤ frobSq M`: `Uᴴ M U` is a compression; via
   `‖U *ᵥ x‖ ≤ ‖x‖` and `frobSq A = Σ_{ij} |Aij|²` (`PosIndex.lean:73` unfolding), or tauceti
   `UnitarilyInvariantSeminorm/Projection.lean` (projections do not increase unitarily
   invariant seminorms, `FanDominance.lean` consequence "orthogonal projections do not
   increase `N`" [VERIFIED FanDominance.lean header]). ~20 LoC.
4. **M″ easy direction.** If `ran U ⊇ ran (Q₊)` then `posIndex (UᴴQU) = posIndex hQ`:
   `Q₊ = U(UᴴQ₊U)Uᴴ`-factorization via `specMap`/`hermPosPart` conjugation
   (`HermitianPosPart.lean:42,148`; `rank_hermPosPart` :180). ~40 LoC.
5. **LinearMap-level donation (03a-mathlib).** Transport `Matrix.IsHermitian` ↔
   `LinearMap.IsSymmetric` (`Mathlib/Analysis/Matrix/Hermitian.lean:46 isSymmetric_toLin_iff`
   [VERIFIED]); restate with `LinearMap.IsSymmetric.eigenvalues`
   (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean:277`). ~150 LoC with transport lemmas.

## Feasibility

- **F0.** Target: Theorem M (+ M′ as a corollary comment, M″ easy direction), and 03a at both
  Matrix level (ported) and LinearMap level (mathlib-facing donation).
- **F1. Mathlib entry points:** `Matrix.IsHermitian` / `isSymmetric_toLin_iff`
  (`Analysis/Matrix/Hermitian.lean:46`); `Matrix.PosSemidef` (`Analysis/Matrix/PosDef.lean`);
  `LinearMap.IsSymmetric.eigenvalues` (`Analysis/InnerProductSpace/Spectrum.lean:277`);
  `Matrix.rank_mul_le_*` (`LinearAlgebra/Matrix/Rank` family);
  `QuadraticForm.sigPos` (`LinearAlgebra/QuadraticForm/Signature.lean:65`) — not used, but the
  alternative real-form host if one prefers donating into the ordered-field world (R9 §1 #2
  surprise #5 suggests checking the realify route; tauceti's `Matrix.realify` +
  `signature_realify` (`HermitianSignature/Basic.lean:122`) is the model).
- **F2. Donor lemmas (zeta23):** `posIndex_conj_le` (Inertia.lean:51) + its two-step support
  (`finrank_le_posIndex_of_posDefOn` Sylvester.lean:82, `posDefOn_range_hermPosPart` :123,
  `finrank_range_hermPosPart` :299); `rank_trace_ineq` (RankTrace.lean:163) + its
  dependencies (`RankTrace.lean` full: 267 LoC; upstream `VonNeumann.lean` 204, `Sylvester.lean`
  309, `HermitianPosPart.lean` 204, `PosIndex.lean` 127 — the M-proof only needs the
  `rank_trace_ineq` black box, but the port pulls the whole namespace: ~1.1k LoC).
  tauceti (models, not imports): `Interlacing.lean:58,71`; `eigenvalues_congr`
  (`CourantFischer.lean:510`); `FanDominance.lean` projection consequence.
- **F3. Missing glue:** (a) definitional: `Matrix n d` isometries (`Uᴴ * U = 1`) as a named
  predicate — trivial; Matrix↔LinearMap eigenvalue transport for the mathlib-facing 03a
  (medium-small, ~150 LoC); (b) genuinely new mathematics: **none** beyond the composition
  statement itself (Theorem M is new as a statement; its proof is a two-step composition) and
  the M″ characterization (easy direction only); (c) porting debt: the RHLinalg namespace
  (~1.1k LoC needed for a self-contained M; ~1.9k if 01 and 03 share the port — **shared-cost
  note for triage: dossiers 01 and 03 draw on the same port, so approving both amortizes**);
  v4.33→v4.36 friction pending R9's `research/feasibility/port-probe.md` (**not yet present —
  expected location**).
- **F4. Effort: S** (< 500 new LoC on top of the shared port; the new content is Theorem M
  (~30 LoC), Frobenius contraction (~20), M″ (~40), LinearMap transport (~150), plus ~100 for
  statement/API polish).
- **F5. Risks:** (i) minimal mathematical risk (two-step composition, both steps
  kernel-verified in the donor); (ii) port churn of the RHLinalg namespace (shared with
  dossier 01; zeta23's import surface for these files is narrow — `Analysis.Matrix.Spectrum`,
  `Analysis.Matrix.PosDef`, `Analysis.Convex.Birkhoff`, `Algebra.Order.Rearrangement`,
  `Algebra.Order.Chebyshev`, `LinearAlgebra.FiniteDimensional.Lemmas` — all confirmed present
  at v4.36 by this lane's §1 table); (iii) the `Uᴴ * U = 1` rectangle-isometry bookkeeping
  (`Matrix m d`, `m ≠ d`) is mildly fiddly in Lean (DecidableEq on both index types) — S-risk
  only; (iv) if triage wants the LinearMap-level 03a donated upstream, expect mathlib-side
  review friction on the `n₊` definition choice (eigenvalue count vs `sigPos`-style subspace
  sup — provide both, they're equal by Sylvester, `posIndex_eq_max_finrank_posDefOn`,
  Sylvester.lean:304).
- **F6.** Kernel-only; milestones: (1) port RHLinalg + re-prove `rank_trace_ineq` (shared with
  dossier 01's milestone 1); (2) 03a at Matrix level (re-prove donor statement — anchor);
  (3) Theorem M; (4) route-2 cross-check via ported interlacing (optional, validates the
  tauceti bridge); (5) LinearMap-level 03a. Modal build per math-proof1; cross-ref R3
  assembly map C (`research/feasibility/mathlib-assembly-maps.md`, **not yet present —
  expected location**).

## Significance

Modest but real: Theorem M is the certification that the zeta23 zero-density certificate is
*dimension-reduction stable* — the property implicitly assumed whenever Gram matrices are
truncated to observed atoms, now an explicit theorem with the exact price (`c²·n₊(Q)` global).
As a mathlib donation package (03a + the Sylvester chain), it fills the Hermitian-inertia half
of R9's "NUANCED" verdict #2 and unlocks dossiers 01 (which reuses the same port) and any
future operator-theoretic consumer. Its scientific weight is as infrastructure with one clean
new statement; it is the low-risk/low-novelty end of this lane's proposals.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

**Lane proposal (R6, non-binding):** Novelty 3 (composition absent everywhere; 03a classical —
see honesty note), Significance 2 (useful but local; infrastructure value), Effort 1–2 (S,
falling to ~1 if the dossier-01 port is shared) → proposed rank ≈ 3.0–4.5 (highest when
bundled with 01).

## F4 grade by lane R9

2026-11-09, round 3. Evidence: Modal port-probe runs 1–4 (`research/feasibility/port-probe.md`);
`research/feasibility/probe/ProbeB1_RHLinalg.lean`, `ProbeA3_F1batch.lean`, `ProbeA4.lean`.

- **Grade: S — confirmed and strengthened.** The donor spine this dossier composes was
  probe-elaborated verbatim against v4.36 (`rank_trace_ineq` + all `PosIndex.lean` defs:
  0 errors, runs 1–4); `posIndex_conj_le` (Inertia.lean:51) is one def-file over in the same
  statement family — statement port cost ≈ 0. New content remains Theorem M (~30 LoC) +
  contraction/transport glue (~200 LoC) as in F3.
- **F1 corrections (three):**
  1. `QuadraticForm.sigPos` as cited is a **wrong full name**: Signature.lean opens
     `namespace QuadraticForm` only at line 139, AFTER the defs (:65/:98) — the correct,
     probe-verified importable names are root-level **`sigPos` / `sigNeg`** (ProbeA4, run 4:
     OK, together with `QuadraticForm.sigPos_of_equiv_weightedSumSquares` etc.); the file's own
     docstring is misleading. The real-form host route is therefore fully viable — no privacy
     gap (corrects my round-2 note in port-probe.md §5.2; see its §OAI-probe correction).
  2. `isSymmetric_toLin_iff` → full name **`Matrix.isSymmetric_toLin_iff`** (namespace Matrix,
     Analysis/Matrix/Hermitian.lean:46; bare name fails, probed run 3; corrected name OK run 4).
  3. `LinearMap.IsSymmetric.eigenvalues` and `Matrix.rank_mul_le{,_left,_right}` — probed OK
     (runs 3–4), signatures captured; note `IsSymmetric.eigenvalues` takes an explicit
     `finrank = n` argument (`Fin n → ℝ`).
- **Deltas vs F-assumptions**: shared-port amortization with dossier 01 stands (same probe
  covers both); risk (ii) "port churn of RHLinalg namespace" is now measured-zero at statement
  level — S grade is firmer than written.
