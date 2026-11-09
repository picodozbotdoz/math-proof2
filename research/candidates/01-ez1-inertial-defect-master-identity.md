# Candidate dossier 01 — ez1-inertial-defect-master-identity

Lane R6, 2026-11-09. Realizes empty zone EZ1 of `research/bridges/linear-algebra.md` §4.
Tags: [VERIFIED] = read in source this lane; [HYPOTHESIS] = proposed new content.

---

## Name

ez1-inertial-defect-master-identity

## One-line pitch

An exact five-defect decomposition identity for the rank–trace (Lemma R) inequality
`2c·tr(P+Q) − ‖P+Q‖²_F ≤ Σ_j k_c(m_j‖v_j‖²) + c²·n₊(Q)`, turning zeta23's one-sided
certificate into an equality with named, individually nonnegative, structurally interpretable
slack terms — subsuming the diagonal-dominance gain, an n₋(Q) tail-mass refinement, the
equality-characterization behind `lemmaR_tight`, and a polarized (MV-shaped) bilinear form.

## Precise mathematical statement

**Setting [VERIFIED].** `𝕜` an `RCLike` field, `n, ι` finite types (`Fintype`, `DecidableEq`),
`d := Fintype.card n`. For Hermitian `A : Matrix n n 𝕜`, let
`A.eigenvalues₀ : Fin d → ℝ` be the decreasing enumeration
(`Matrix.IsHermitian.eigenvalues₀`, mathlib `Analysis/Matrix/Spectrum.lean:60`, antitone :63).
`RHLinalg.posIndex hQ := #{i | 0 < Q.eigenvalues i}` (`zeta23/Zeta23/LinAlg/PosIndex.lean:41`),
`hermPosPart hQ / hermNegPart hQ` the spectral positive/negative parts
(`HermitianPosPart.lean:148,151`), `rtrace A := re A.trace`, `frobSq A := re tr(AᴴA)`
(`PosIndex.lean:70,73`). Fixed `c > 0`. Scalar functions [VERIFIED, `Zeta23/ZeroSide/
RankTraceMult.lean:30,351`]:

```
g_c(x) := x² − c·x − ((x−c)₊)²          (equals x² − cx for x ≤ c, cx − c² for x ≥ c)
k_c(x) := c·x − g_c(x) = c² − ((c−x)₊)²  (equals 2cx − x² for x ≤ c, c² for x ≥ c)
Δ_c(p, m) := (p − m)² − c·p − g_c(p) + 2c·m   (explicitly: m·(m + 2(c−p)) if p ≤ c;
                                                 (p − c − m)² if p ≥ c)   [HYPOTHESIS: the
                                                 piecewise formula, verified by algebra below]
```

`Δ_c(p,m) ≥ 0` for `p, m ≥ 0` is exactly `sq_sub_ge_gc` (RankTraceMult.lean:81).

**Inputs.** Atoms `m : ι → ℝ` with `m_j ≥ 0`, vectors `v : ι → n → 𝕜`, `x_j := ‖v_j‖²`
(`xsq`, RankTraceMult.lean:226); `P := Pmat m v = W Wᴴ` with `W` the `d×|ι|` matrix of columns
`√m_j·v_j` (RankTraceMult.lean:220–223); `Q` Hermitian. Write `p := eigenvalues₀(P)`,
`μ := eigenvalues₀(Q₋)` (both decreasing), `q⁺ :=` the positive eigenvalues of `Q`,
`π := posIndex hQ`, `b := π` (the sharp budget).

**Theorem A (master identity) [HYPOTHESIS — the new result].** With the five defects

```
Δ_pt  := Σ_{k< d} Δ_c(p_k, μ_k)                                    (pairing defect)
Δ_SJ  := Σ_{k< d} g_c(p_k) − Σ_j g_c(m_j x_j)                       (Schur–Jensen defect)
Δ_vN  := Σ_{k< d} p_k μ_k − re tr(P·Q₋)                             (rearrangement defect)
Δ₊    := 2·re tr(P·Q₊)                                              (positive-coupling defect)
Δ_Q+  := Σ_{q⁺ > 0} (q⁺_i − c)² = frobSq(Q₊) − 2c·rtrace(Q₊) + c²π   (pair-block defect)
```

each `≥ 0`, there is the **exact identity**

```
frobSq(P + Q) = c·rtrace P + Σ_j g_c(m_j x_j) + 2c·rtrace Q − c²·π
              + Δ_pt + Δ_SJ + 2·Δ_vN + Δ₊ + Δ_Q+ ,
```

equivalently, in the k-form (via `kc_eq`, RankTraceMult.lean:353, and `rtrace P = Σ_j m_j x_j`,
:261),

```
2c·rtrace(P+Q) − frobSq(P+Q) = Σ_j k_c(m_j x_j) + c²·π
                              − (Δ_pt + Δ_SJ + 2·Δ_vN + Δ₊ + Δ_Q+) .
```

All quantities are computable from `(P, Q, m, v, c)` alone; the bracketed certificate is the
LHS of `rank_trace_mult` (RankTraceMult.lean:281) at `b = π`.

**Corollaries (each a standalone Lean theorem).**

- **A1 (Lemma R and rank_trace_ineq re-derived).** Dropping all five defects recovers
  `rank_trace_mult` (:281) at `b = π`, and — using `k_c ≥ −c²/4`-route `gc_ge`
  (:41) with at most `r` nonzero atoms — `RHLinalg.rank_trace_ineq`
  (`zeta23/Zeta23/LinAlg/RankTrace.lean:163`). Routine.
- **A2 (diagonal-dominance gain) [HYPOTHESIS].** If `re tr(P·Q₊) ≥ K ≥ 0` then
  `frobSq(P+Q) ≥ cert + 2K`. Moreover `Δ₊ = 0 ↔ P·Q₊ = 0`. (For PSD `P, Q₊`,
  `re tr(P Q₊) = 0 ↔ P Q₊ = 0`; needs a small new lemma — see Proof sketch step 6.)
- **A3 (n₋(Q) tail-mass refinement) [HYPOTHESIS].** Since `p_k = 0` for `k ≥ rank P`
  (mathlib `Matrix.IsHermitian.rank_eq_card_non_zero_eigs`, `Analysis/Matrix/Spectrum.lean:202`,
  + antitonicity) and `Δ_c(0, m) = m²`, one has `Δ_pt ≥ Σ_{k ≥ r} μ_k²`, hence with
  `T := Σ_{k≥r} μ_k` (negative trace of `Q` beyond the top-`r` sorted positions) and `r ≤ d`:
  `frobSq(P+Q) ≥ cert + T²/(d−r)` (Cauchy–Schwarz on `d−r` terms,
  mathlib `sq_sum_le_card_mul_sum_sq`). The certificate strictly improves whenever `Q` carries
  negative mass outside the top-`r` eigenvalue slots.
- **A4 (equality characterization) [HYPOTHESIS].** All five defects vanish simultaneously iff:
  (i) `P·Q₊ = 0`; (ii) every positive eigenvalue of `Q` equals `c`; (iii) `μ` is supported in
  the first `rank P` sorted positions with `μ_k = m-side` of `Δ_c` zero-set
  (`μ_k(μ_k + 2(c−p_k)) = 0` where `p_k ≤ c`, `μ_k = p_k − c` where `p_k ≥ c`);
  (iv) `P, Q₋` are simultaneously unitarily diagonalizable in the sorted order (vN equality);
  (v) equality in the Schur–Jensen step. Necessity of (i)–(iii) is unconditional; necessity of
  (iv)–(v) is proved under simple spectra (no repeated eigenvalues in `P` or `Q₋`).
  `lemmaR_tight` (`Zeta23/ZeroSide/TightMult.lean:93`) is the special case
  `Q ⪰ 0`, `Q² = c·Q`, orthonormal `v_j`, `m_j ≤ c` — there `μ ≡ 0`, `P Q₊ = 0`, so
  Δ_pt = Δ₊ = 0 trivially and Δ_vN = Δ_SJ = Δ_Q+ = 0 by construction [VERIFIED].
- **A5 (polarized / MV-shaped bilinear form) [HYPOTHESIS, sub-question].** Writing
  `frobSq(M) = ⟨M, M⟩_F` (Frobenius inner product, tauceti `frobenius_inner_eq_trace_conjTranspose_mul`,
  `TauCeti/Analysis/Matrix/Frobenius.lean:106`) and polarizing Theorem A for two configurations
  `(P,Q), (P′,Q′)`: `⟨P+Q, P′+Q′⟩_F ≥ cert-bilinear − ½(Σdefects + Σdefects′)` by
  `2⟨X,Y⟩ ≤ ‖X‖² + ‖Y‖²`. This is the rank–trace analogue of zeta23's MV ladder
  (`EigenBound 13` → `MVDiag 13` → bilinear `MVHilbert` by polarization,
  `zeta23/Zeta23/MV/Duality.lean:34`, `MV/Final.lean:27,30`) — the missing third storey
  flagged in bridge map §2 L4.

Quantifier order for a Lean statement of Theorem A: `∀ {𝕜} [RCLike 𝕜] {n ι} [Fintype n]
[DecidableEq n] [Fintype ι] [DecidableEq ι] (m : ι → ℝ) (v : ι → n → 𝕜) (Q : Matrix n n 𝕜)
(hQ : Q.IsHermitian) {c : ℝ} (hc : 0 < c), <identity>` — mirroring the signatures at
RankTraceMult.lean:281.

## Novelty check

- **Corpus side** (`research/qa/decl-index.tsv` absent — searched corpora directly, patterns +
  counts, 2026-11-09):
  - mathlib (`encore-mathlib/repo/mathlib4`, `ff2494ea`): `rg -i -c 'rank.?trace' Mathlib/` →
    **0 files**; `rg -i -c 'multiplicity.?aware' Mathlib/` → **0**; `rg -i -n 'defect' Mathlib/`
    → 4 hits, all unrelated (measure-theory Dirac correction `VectorMeasure/BoundedVariation.lean:30`;
    modular-forms defect `D2`, `ModularForms/…/E2/Defs.lean:63`). No defect-form or identity-form
    trace inequality anywhere.
  - tauceti: `rg -i -c 'rank.?trace' TauCeti/` (lean) → 17 hits / 6 files, **all false
    positives** (`finrank_traceFreeSelfAdjoint` `Analysis/InnerProductSpace/Trace/Free.lean:243`,
    `finrank_traceZero` `Algebra/AlbertAlgebra/Compact.lean:375` — dimension counts, not
    inequalities); `multiplicity.?aware` → 0.
  - openai-math: `rg -i -c 'rank.?trace' lean/` → 78 hits / 31 files, predominantly the
    combinatorial `rankTrace`/`cloudRankTrace` of IndependentSets machines
    (`lean/OAI/Combinatorics/IndependentSets/Machines/MachineCloudRank.lean:176` etc.; also e.g.
    `central_rank_trace` in `lean/OAI/Analysis/TracialCohomology/CenterTrace.lean`, an algebra
    lemma) — all unrelated to matrix trace inequalities. [erratum 2026-11-09, H/QA: v1 said
    "**all** IndependentSets"; the TracialCohomology/Laughlin family is a second, equally
    unrelated cluster. Counts 78/31 exact.]
  - anthropics (zeta23): the *ingredients* all present — `rank_trace_mult` /
    `rank_trace_mult_k` / `rank_trace_mult_k_le` (`Zeta23/ZeroSide/RankTraceMult.lean:281,369,380`),
    `lemmaR_tight` (`TightMult.lean:93,104,114`), `sum_kc_two_nat`/`sum_kc_three_nat`
    (:403,419) — but **no defect term, no identity, no equality case beyond the tightness
    examples**: the proof closes with `linarith` (RankTraceMult.lean:346), discarding all slack
    anonymously. Nearest miss inside zeta23: `gc_ge` (:41) and `affine_le_gc` (:49), the
    pointwise minorants — these are the *duals* of Δ_pt, never summed into a defect.
- **Literature side: PENDING lane R8 round-2** (`research/novelty/round-1.md` not yet present).
  Queries R8 should run:
  1. arXiv full-text: `"rank-trace inequality"`; `"trace inequality" AND "positive index"`;
     `"Frobenius" AND "multiplicity" AND "simple zeros"`;
  2. Google Scholar: `"von Neumann trace inequality" equality case` (Mirsky-type equality
     analyses); `Carlen Lieb trace inequality equality/defect` — Carlen 2010 is already cited in
     mathlib (`Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/
     IntegralRepresentation.lean:51`, found by R9 §1 #1) and is the nearest literature kin for
     *defect analyses of trace inequalities*; what differs: no Carlen-type result treats the
     joint (rank, positive-index) certificate;
  3. zbMATH open: `15A42 AND "trace" AND "defect"`; `15A45 AND "Frobenius" AND "inertia"`;
  4. Bhatia, *Matrix Analysis* (1997) ch. III (majorization, von Neumann/Fan) and
     Horn–Johnson ch. 4 — confirm no joint trace–Frobenius–inertia identity with named defects;
  5. Citations *to* Alpöge–Furman arXiv:2608.13637 (the only source of Lemma R; its appendix
     proves tightness examples, not a defect identity).
- **Known nearest misses:** (a) zeta23 `rank_trace_mult_k` — one-sided version, slack discarded;
  (b) zeta23 `lemmaR_tight` — tightness *examples* (sufficiency for equality), no necessity, no
  defect decomposition; (c) tauceti Hoffman–Wielandt `IsHermitian.sum_sq_eigenvalues₀_sub_le_
  frobenius_norm_sub_sq` (`Analysis/Matrix/HoffmanWielandt.lean:93`) — a spectral-distance
  inequality, not an energy identity, but its permutohedron/equality machinery (see
  `DavisEigenvalueChange.lean` proof sketch) is the model for Δ_vN necessity; (d) mathlib's
  rearrangement inequality `Monovary.sum_mul_comp_perm_le_sum_mul`
  (`Algebra/Order/Rearrangement.lean:439`) — equality cases unstated.

## Bridge analysis

- **Corpora bridged:** anthropics/zeta23 (all ingredients + extremals) × tauceti (equality-case
  machinery, Frobenius inner-product API) × mathlib (sorted-eigenvalue substrate).
- **Why essential:** the identity itself is assembled entirely from zeta23 pieces (steps 1–5
  below) — but two of the five defect characterizations are not provable from zeta23 alone:
  Δ_vN necessity needs von-Neumann-equality analysis (Birkhoff convex decomposition +
  rearrangement equality), whose operator-level form exists only in tauceti
  (`Analysis/InnerProductSpace/CourantFischer.lean` eigenvalue mechanics,
  `HoffmanWielandt.lean` permutohedron argument); A5's polarization needs the Frobenius
  *inner product* API (`TauCeti/Analysis/Matrix/Frobenius.lean:81–106`), which zeta23 never
  develops (it works with `frobSq` only, `PosIndex.lean:73`). Conversely tauceti has no
  certificate inequality to decompose. The result is a self-contained new theorem the
  combination motivates; A4/Δ_vN is where the bridge is load-bearing.
- **Empty-zone fit:** `research/bridges/linear-algebra.md` §4 EZ1 (and §2 L2, L4).

## Proof-strategy sketch

1. **[VERIFIED skeleton]** Port the exact `calc` spine of `rank_trace_mult`
   (RankTraceMult.lean:281–346) unchanged: Frobenius expansion `hexpand` (:314) =
   `frobSq(P+Q) = frobSq P + 2re tr(PQ₊) − 2re tr(PQ₋) + frobSq Q₊ + frobSq Q₋` (via
   `frobSq_add_hermitian`, `zeta23/Zeta23/LinAlg/RankTrace.lean:138`); `hPQp : 0 ≤ re tr(PQ₊)`
   (:323, `trace_mul_nonneg_of_posSemidef`, RankTrace.lean:114); `hvN : re tr(PQ₋) ≤ Σ p μ`
   (:325, `vonNeumann_trace_ineq`, `zeta23/Zeta23/LinAlg/VonNeumann.lean:171`).
2. **The unfreeze point.** The final `linarith [hstep4, hstep5', hstep6, hPQp, hexpand, htraceQ]`
   at **RankTraceMult.lean:346** discards: `hPQp` (→ Δ₊), the slack in `hstep4`
   (`Σ(p−μ)² ≤ frobSq P − 2re tr(PQ₋) + frobSq Q₋`, :326 — the gap is exactly `2Δ_vN`),
   the slack in `hstep5'` (`c·rtraceP + Σ_j g_c(m_jx_j) − 2c·rtraceQm ≤ Σ(p−μ)²`, :334 —
   gap `Δ_pt + Δ_SJ`, via `sum_sq_sub_ge_gc` :87 and `sum_gc_eigenvalues_ge` :270), and the
   slack in `hstep6` (`2c·rtrace Qp − c²b ≤ frobSq Qp`, :339 — gap `Δ_Q+` at `b = π`, via
   `sum_sq_lower_of_card_pos_le`, `zeta23/Zeta23/LinAlg/RankTrace.lean:87`). **Replacement:**
   prove the four *equalities-with-named-remainder*
   `hstep4' : frobSq P − 2re tr(PQ₋) + frobSq Q₋ = Σ(p−μ)² + 2Δ_vN`,
   `hstep5'' : Σ(p−μ)² = c·rtraceP + Σ_k g_c(p_k) − 2c·rtraceQm + Δ_pt`,
   `hstep5-SJ : Σ_k g_c(p_k) = Σ_j g_c(m_jx_j) + Δ_SJ`,
   `hstep6' : frobSq Qp = 2c·rtrace Qp − c²π + Δ_Q+`, then assemble Theorem A by `ring` +
   `htraceQ : 2c·rtrace Q = 2c·rtrace Q₊ − 2c·rtrace Q₋` (:345, `rtrace_sub_decomp`,
   HermitianPosPart.lean:192). Algebra routine (`ring`/`Finset.sum_sub_distrib`); the only
   genuinely new ideas are the *definitions* of the five defects and the observations
   `Δ_c(0,m) = m²` (A3) and `Δ_Q+ = Σ_{q⁺>0}(q⁺−c)²` (sum of squares).
3. **A2:** `Δ₊ = 0 ↔ P·Q₊ = 0`: `re tr(PQ₊) = 0` with `P, Q₊ ⪰ 0`; factor
   `Q₊ = R²` (`Matrix.PosSemidef` square root — mathlib `CFC.sqrt` via
   `Analysis/Matrix/Order.lean:137 inv_sqrt` or tauceti `Analysis/Matrix/Sqrt.lean`); then
   `tr(P R²) = tr(R P R) = frobSq(R P^{1/2}·)`-reduction gives the iff. ~30 LoC.
4. **A3:** `p_k = 0` for `k ≥ rank P` from `rank_eq_card_non_zero_eigs`
   (mathlib Spectrum.lean:202) + `eigenvalues₀_antitone` (:63) — this is the same argument as
   tauceti `eigenvalues₀_nonpos_of_rank_le` (`TauCeti/Analysis/Matrix/Eigenvalues/Basic.lean:235`);
   then Cauchy–Schwarz `sq_sum_le_card_mul_sum_sq` (mathlib
   `Algebra/Order/Chebyshev.lean`, already used by `RHLinalg.cauchySchwarz_count`,
   `zeta23/Zeta23/LinAlg/Weyl.lean:111`).
5. **A4 necessity (i)–(iii):** each defect is a sum of squares/nonneg terms; zero iff each term
   zero — `Finset.sum_eq_zero_iff_of_nonneg`. (iv) Δ_vN: equality in
   `bilinear_doublyStochastic_le_of_monovary` (`zeta23/Zeta23/LinAlg/VonNeumann.lean:143`)
   requires every permutation in the Birkhoff support of the Schur weight matrix to be
   `Monovary`-equality; with simple spectra the support is `{id}` — adapt tauceti's
   doubly-stochastic extremality arguments (`Analysis/Convex/DoublyStochasticMatrix.lean`,
   `InnerProductSpace/SchurHorn.lean`). (v) Δ_SJ: equality in `gc_sum_le`
   (RankTraceMult.lean:63) — Jensen equality along strictly convex pieces.
6. **A5:** polarization identity for the Frobenius inner product (tauceti
   `Frobenius.lean:81–106`), applied to `M = P+Q`, `M′ = P′+Q′`, plus `2⟨X,Y⟩ ≤ ‖X‖²+‖Y‖²`.

## Feasibility

(F0–F6 per `research/feasibility/mathlib-verification.md` §3; checkout `ff2494ea` v4.36.0-rc2.)

- **F0.** Target: Theorem A + A2/A3/A4(i–iii) as stated above, in a `CrossMath.RankTrace`
  namespace of this repo, kernel-only.
- **F1. Mathlib entry points:** `Matrix.IsHermitian.eigenvalues₀ / eigenvalues₀_antitone /
  spectral_theorem / rank_eq_card_non_zero_eigs / trace_eq_sum_eigenvalues`
  (`Analysis/Matrix/Spectrum.lean:60,63,143,202,240`); `Matrix.PosSemidef` API (`Analysis/Matrix/PosDef.lean:34,42,45`); `sq_sum_le_card_
  mul_sum_sq` (`Algebra/Order/Chebyshev.lean`); `Monovary.sum_mul_comp_perm_le_sum_mul`
  (`Algebra/Order/Rearrangement.lean:439`); Frobenius norm instances
  (`Analysis/Matrix/Normed.lean:538–545`).
- **F2. Donor lemmas (zeta23, v4.33.0-rc2 build):** the whole `Zeta23/LinAlg/` spine
  (7 files, 1385 LoC: `rank_trace_ineq` RankTrace.lean:163; `vonNeumann_trace_ineq`
  VonNeumann.lean:171; `hermPosPart` chain HermitianPosPart.lean; Sylvester chain
  Sylvester.lean:82–307) + `RankTraceMult.lean` (443 LoC: :63 `gc_sum_le`, :81 `sq_sub_ge_gc`,
  :119 `sum_gc_diag_le_sum_gc_eigenvalues`, :189 `sum_eigenvalues_comm`, :270
  `sum_gc_eigenvalues_ge`, :281 `rank_trace_mult`, :353 `kc_eq`) + `TightMult.lean` (123 LoC).
  Donor hypotheses: `RCLike 𝕜`, `Fintype/DecidableEq n ι`, Hermitian side conditions — match
  mathlib v4.36 API shapes (same decl names confirmed by R9 §1 #1–2 and this lane's §1 table).
  tauceti donors (equality-case layer): `HoffmanWielandt.lean:93`, `DoublyStochasticMatrix.lean`,
  `Frobenius.lean:81–106` — import friction higher (tauceti is a separate Lake project, not a
  mathlib overlay; treat as *proof models*, re-derive in-repo).
- **F3. Missing glue:** (a) definitional: none — the identity lives in the donor's own terms;
  the only new definitions are `Δ_c` and the five defect sums (S). (b) genuinely new
  mathematics: A4(iv) vN equality case with simple spectra (~150 LoC, medium — Birkhoff support
  argument); A2 PSD zero-trace iff (~30 LoC); A3 (routine). (c) porting debt: v4.33→v4.36
  port of `Zeta23/LinAlg` + `RankTraceMult` + `TightMult` (~1.9k LoC); R9's port probe
  (`research/feasibility/port-probe.md`, **pending — expected location**, R9 measuring) will
  quantify; zeta23's mathlib surface for these files is narrow (Spectrum, PosDef, Birkhoff,
  Rearrangement, Lagrange — all confirmed present at v4.36), so friction expected low-moderate
  (module-system `public import` syntax changes possible; zeta23 files predate the module
  system).
- **F4. Effort: M** (~1.5–3k LoC: ~1.9k port + ~0.4k new theorems + ~0.3k equality-case
  analysis). Not S because of the port; not L because no new analytic API is needed — every
  ingredient is finite-dimensional algebra.
- **F5. Risks:** (i) port churn: zeta23 built on v4.33.0-rc2 Mathlib `51e6992e`; three minor
  versions of drift (R9 §0 note) — `eigenvalues₀` and `spectral_theorem` names confirmed
  stable, but `Finset.sum_sub_distrib` simp-lemma behavior may differ (proof-only, not
  statement risk); (ii) A4(iv) equality analysis could degenerate for repeated eigenvalues —
  mitigated by the simple-spectrum hypothesis (stated); (iii) `sum_eigenvalues_comm`
  (Lagrange-interpolation transfer) carries `Polynomial` API dependencies — port these too
  (small; mathlib's object is root-level `Lagrange.interpolate`,
  `LinearAlgebra/Lagrange.lean:298` [naming note added 2026-11-09, H])
  (small); (iv) no external computation anywhere — no `EnclOK`-style hypothesis involved.
- **F6. Verification plan:** kernel-only, math-proof1 standard (no `sorry`, no `native_decide`,
  no external CAS); first `lake` milestone = port `Zeta23/LinAlg` + `rank_trace_mult` and
  re-prove `rank_trace_mult_k` verbatim (regression anchor), then Theorem A. Modal
  build/check via `lean_build.py`/`lean_check.py` per `math-proof1` once scaffolding exists.
  Cross-ref R3's assembly map C (`research/feasibility/mathlib-assembly-maps.md`, **not yet
  present — expected location**) for the port order.

## Significance

Converts the zeta23 zero-density method's workhorse from an inequality into an exact
bookkeeping identity: every future application (simple-zeros vs distinct-zeros counting,
ξ′-topic upgrades, any consumer of `rank_trace_mult`) can read off exactly how much of the
Frobenius budget is lost where — and A3 gives the first quantitative handle on when the
certificate is *strictly improvable*, the question left open by `lemmaR_tight` (survey §2(c)
"intermediate c values … not computed"). A5 opens the MV-style bilinear dual. For mathlib it
is a donation-grade trace-inequality layer where none exists (R9 §1 #1).

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

**Lane proposal (R6, non-binding):** Novelty 4 (absent everywhere; Carlen-type defect analyses
are the nearest kin and differ essentially), Significance 4 (fills named empty zone EZ1;
direct consumer in every zero-side argument), Effort 3 (M) → proposed rank ≈ 5.3.

## F4 grade by lane R9

2026-11-09, round 3. Evidence: Modal port-probe runs 1–4 (`research/feasibility/port-probe.md`
§§2–4 + this round's additions; transcripts `/tmp/crossmath-probe-run{1,2,3,4}.log`).

- **Grade: M — confirmed.** New bound: statement-side port cost is **measured ≈ 0**, so M is
  now purely proof-side work (~1.5–3k LoC re-fixing), slightly firmer than the dossier's
  "port + fix" reading.
- **Port-probe evidence**: `ProbeB1_RHLinalg.lean` (run 1, re-confirmed runs 2–4) elaborated the
  donor's `vonNeumann_trace_ineq`, `rank_trace_ineq`, `weyl_posIndexAbove_le` statements plus
  all five `PosIndex.lean` defs **verbatim against v4.36.0-rc2 @ ff2494ea: 0 errors**; donor
  import line (`Analysis.Matrix.PosDef`, `Convex.Birkhoff`, `Algebra.Order.Rearrangement`,
  `Algebra.Order.Chebyshev`) intact. F3(c)'s "module-system public import syntax changes
  possible" risk: **did not materialize** (plain imports of module-system mathlib work fine).
- **F1 corrections/confirmations** (ProbeA/A3, runs 3–4): `spectral_theorem`
  (Spectrum.lean:143), `trace_eq_sum_eigenvalues` (:240), `sq_sum_le_card_mul_sum_sq`
  (Chebyshev.lean:143), `Monovary.sum_mul_comp_perm_le_sum_mul` (Rearrangement.lean:439),
  `eigenvalues₀`, `PosSemidef` — all elaborated OK with signatures captured. No F1 changes
  needed.
- **Deltas vs F-assumptions**: none material; the ~1.9k LoC port line-item remains (proofs),
  `RankTraceMult.lean`/`TightMult.lean` were NOT probe-extracted (statements only exist
  interleaved with proofs) — residual risk is tactic churn there, consistent with F5(i).
- Verdict for triage: keep Effort M (≈ as assumed; confidence up from assumed→measured on the
  statement half).

---

## Pilot outcome (append, lane R6, 2026-11-09 evening — closes this dossier's feasibility question)

**Theorem A is PROVED, kernel-verified, axiom-clean.** `research/pilots/01/port/09_MasterIdentity.lean`
(2,053 LoC = 1,731-LoC donor port bundle + ~320-LoC proof layer): `master_identity` (the exact
five-defect identity, replacing the `linarith` at RankTraceMult.lean:346) and
`rank_trace_mult_k_of_master` (the donor's `rank_trace_mult_k` statement re-derived by dropping
the defects — faithfulness anchor) both compile with 0 errors, 0 sorry;
`#print axioms` → `[propext, Classical.choice, Quot.sound]` only, as do all eight audited ported
theorems (`rank_trace_ineq`, `rank_trace_mult(_k)(_le)`, `vonNeumann_trace_ineq`,
`posIndex_conj_le`, `weyl_posIndexAbove_le`). **Tightness companion (milestone d):**
`research/pilots/01/port/10_TightMult.lean` ports donor TightMult verbatim and proves
`tightness_of_master` — on the `lemmaR_tight` extremal configuration all five named defects
vanish simultaneously (structural pair complete: exact identity + exact per-defect tightness).
Run logs: blueprint `research/pilots/01-blueprint.md` §6b/§6c/(§6d tightness).

**Feasibility settled empirically — the dossier's M was an overestimate.** Port of the whole
9-file donor bundle: **zero fix cycles** (v4.33→v4.36 proof churn did not materialize; only
donor-side `if_neg/if_pos` deprecation warnings). New layer: ~320 LoC across 6 fix cycles
(22→10→5→2→1→0 errors), all pilot-side authoring (application precedence; defect-def unfolds;
converse `Finset.sum_filter_of_ne` signature; rw-motive under proof-dependent `hermPosPart hQ`;
linarith variable-coefficient nonlinearity — pre-scaled `rw`+`ring` bridges, the reusable
pattern). Total: ~45 min wall, ~25 min Modal machine-time across 9 warm runs.

**Novelty re-scope (R8 round-2 §1 + VERDICTS row 01, incorporated).** Novelty 4 → **3.5**:
(i) the exact five-defect identity + named nonnegativity = **NEW-CLAIM-SUPPORTED**
(medium-high confidence) — no defect/slack decomposition anywhere in AF v2, Lamzouri, or the
equality-case genre (So/Golden–Thompson, Carlen 2010, Ipsen–Saibaba 2025); (ii) **A4 narrowed**:
AF v2 (arXiv:2608.13637v2) Lemma 3.2 already states a base-lemma equality case
(`P = Π₁, Q = 2Π₂`, orthogonal projections) and §7.2(b) characterizes downstream sharpness —
our delta is the *finer five-defect simultaneous* characterization, now proved as
`tightness_of_master`; (iii) **Lamzouri caveat** (arXiv:2609.02882v2): a matrix-free route
avoids the certificate line altogether — the identity's number-theoretic consumers may shrink;
its standalone linear-algebra novelty stands; (iv) **Knausgård** (arXiv:2609.33043, repo
`kristianmk/839`): the Δ₊-move ("nonnegative correction from overlaps", his Thm 2) is
precedented and formalized ahead of us — his theorem does NOT subsume the identity (no
Frobenius/rank/inertia) but any constant-improvement framing is dropped from this dossier.

**Lane proposal (updated, supersedes the original):** Novelty 3.5 (structural identity +
tightness core only), Significance 4 (proved, donation-grade, anchors dossiers 03/21-line
consumers), Effort 2 (port done; remaining = upstreaming polish + A2/A3/A5 corollaries, each a
bounded add-on on the proved identity) → **proposed rank = 3.5 × 4 ÷ 2 = 7.0**. Note for
triage: this candidate is now de-risked to the maximum extent short of a mathlib PR; its
score should reflect completed work, not planned work.
