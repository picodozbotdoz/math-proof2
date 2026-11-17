# 01-stability Rung-0 paper tranche — statement list, nearest-miss table, P0 spec

Lane A6, 2026-11-17 (iteration-4 week-1 row 2; R2 §12.1 mini-spec
`qa/iter4-review/r2-discovery-strength.md:794–857`; go-conditions were already
satisfied at slotting: R7 §B both mandatory LIT sweeps CLEAR + lane-free). Scope per
the mini-spec's recommendation: **Iter-4 = paper Rung-0 tranche only** — this
document is the statement architecture + nearest-miss record + the P0 elaboration
SPEC (statement-level; **no Modal run this iteration** — R2's own split defers the
Lean diagonal tranche to Iter-5).

Vocabulary: `pilots/01/MasterIdentity.lean` (namespace `CrossMath.RankTraceDefect`):
`deltaC` :82, `pairingDefect` :85, `schurJensenDefect` :90, `rearrangementDefect`
:95, `posCouplingDefect` :100, `pairBlockDefect` :106, `posIndex` :41, `hermPosPart`
:57, `hermNegPart` :61, `Pmat`/`xsq` :72/:76, `gc` :65. Donor anchors on the built
port stack: `vonNeumann_trace_ineq` (`port/08_RankTraceMult.lean:480`),
`sum_gc_eigenvalues_ge` (`port/08_RankTraceMult.lean:1559`), `sq_sub_ge_gc` mirror =
`stmt_deltaC_nonneg` (MasterIdentity.lean:112).

## 1. Rung-0 statement (paper form — the identity → characterization upgrade)

**Theorem R0 (zero-locus converse; sharpens article-01 Theorem 3 to an iff).** Fix
c > 0, atoms (m_j ≥ 0, v_j) with P = Pmat m v, Q Hermitian. Define the **TightMult
shape class** (real-weight form): (P, Q) has TightMult shape iff for SOME unitary U,
some b ∈ ℕ, and real weights λ₁, …, λ_r ∈ [0, c],

  UPU* = diag(λ₁, …, λ_r, 0, …, 0)  and  UQU* = diag(0, …, 0, c·I_b).

Then

  Δ_pt = Δ_SJ = Δ_vN = Δ₊ = Δ_Q+ = 0  ⟺  (P, Q) has TightMult shape

(where Δ_SJ is evaluated at the given atoms; on the shape, the witnessing atoms are
the on-line ones m_j := λ_j, v_j := U e_j). By Theorem 2 (all defects ≥ 0) the
five-fold vanishing is equivalent to the single weighted identity
Δ_pt + Δ_SJ + 2Δ_vN + Δ₊ + Δ_Q+ = 0 — the equation the master identity isolates.

**Two mandatory article sentences (the mini-spec's exact caveats):**
1. The shape class is **strictly larger than the donor's `TightMult`**: integrality
   of the m_j was the donor lemma's artifact. E.g. diag(λ, 0 | 0, c) with any real
   λ ∈ [0, c] already has Δ_pt = Δ_SJ = Δ_vN = Δ₊ = Δ_Q+ = 0, since for p ≤ c, μ = 0:
   Δ_c(p, 0) = ((p−c)₊)² = 0.
2. **Integrality is not recoverable from the defects** — the converse is stated over
   real weights and the article must say so.

Also carry forward: b = π := n₊(Q) is FORCED (Δ_Q+ = 0 pins the positive spectrum
inside {c}); r = n − π. The ε-dependence picture (continuity of the shape in
parameters) is Rung-1 material, not Rung-0.

## 2. Statement list (hypothesis-binder forms; the paper tranche's obligations)

Convention (EnclOK/ProbeE precedent, MasterIdentity's Prop-def idiom): each item is a
Prop-valued statement; where a DONOR result is consumed it enters as an explicit Prop
binder (`h…`) rather than an import-side proof; the two hard cores are stated as
binders so the whole architecture elaborates statement-level without any proof debt.

| # | name (working) | statement (Lean shape, `CrossMath.RankTraceDefect` vocabulary) | donor binder / source |
|---|---|---|---|
| R0.0 | `TightShape` (def) | `(P Q : Matrix n n 𝕜) (c : ℝ) : Prop := ∃ (b : ℕ) (r : ℕ) (λ : Fin r → ℝ), (∀ j, λ j ∈ Icc 0 c) ∧ ∃ U : Matrix n n 𝕜, U.IsUnitary ∧ Uᴴ * P * U = … diag-shape … ∧ Uᴴ * Q * U = … c·I_b …` (exact diagonal-normal-form idiom pinned at P0; permutation-equivalence form acceptable) | none (new def; mathlib `Matrix.IsUnitary`, `Matrix.diagonal` anchors) |
| R0.1 | `stmt_rung0_forward` | shape → all five defects vanish (⇐ direction: a computation each channel vanishes on the shape; the on-line atoms realize Δ_SJ = 0 because the Gram diagonal equals the nonzero spectrum) | donor `sq_sub_ge_gc` mirror (deltaC branches); `sum_gc_eigenvalues_ge` (majorization is tight at the shape) |
| R0.2 | `stmt_rung0_converse` | (P = Pmat m v PSD, Q Hermitian) all five defects = 0 → `TightShape P Q c` | consumes R0.3–R0.7 |
| R0.3 | `stmt_M1_Qpos` | `pairBlockDefect c hQ = 0 ↔ ∀ i, 0 < hQ.eigenvalues i → hQ.eigenvalues i = c` (zero locus; stability |q_i − c| ≤ √Δ_Q+ is Rung-1) | none (sum-of-squares by def) |
| R0.4 | `stmt_M2_posCoupling` | `posCouplingDefect P (hermPosPart hQ) = 0 ↔ P * hermPosPart hQ = 0` for P PSD; paper identity 2·Re tr(PQ₊) = 2·‖P^{1/2}Q₊^{1/2}‖²_F | port surface `specMap`-sqrt (`rtrace_specMap`, `frobSq_specMap`, 03_VonNeumann.lean:217/:225) |
| R0.5 | `stmt_M3_pairingBranch` | `deltaC c p μ = 0 ↔ (p ≤ c ∧ μ = 0) ∨ (p ≥ c ∧ μ = p − c)` (for p, μ ≥ 0) | none (elementary case split on `max`; the ≥ 0 half is `stmt_deltaC_nonneg`) |
| R0.6 | `stmt_M4_vNzero` **[hard core A]** | for P, Q₋ PSD: `rearrangementDefect hP hQm = 0 → ∃ U unitary, simultaneous diagonalization of P, Q₋ with oppositely-sorted spectra` — the equality case of `vonNeumann_trace_ineq` | **hVN_eq** binder; inequality side = donor `vonNeumann_trace_ineq` (port :480) |
| R0.7 | `stmt_M5_SJzero` **[hard core B]** | `schurJensenDefect c m v hPm = 0 →` partial rigidity: the Gram diagonal {m_j·xsq v j} is a g_c-exact majorization witness of the spectrum (full permutation ONLY on the strictly-convex branches; g_c is linear on x ≥ c, so the zero locus is partial rigidity, not a permutation) — equality case of `sum_gc_eigenvalues_ge` | **hSH_eq** binder; inequality side = donor `sum_gc_eigenvalues_ge` (port :1559) |
| R0.8 | `stmt_assembly` | R0.3 ∧ R0.4 ∧ R0.5 ∧ R0.6 ∧ R0.7 → R0.2 (block/eigenvalue geometry from 1–3 + near-simultaneous diagonalization/orthonormal atoms from 4–5 glue to the shape) | composition binder |
| R0.9 | `defect_zero_diag_iff_shape` (Lean diagonal target, **Iter-5**) | in the commuting sector (v_j = e_j on-line, P and Q diagonal): five defects vanish ↔ m_j ∈ [0, c] ∧ q_i ∈ {0, c} (permutation form); mechanisms 1, 3 in full, 2 trivial, 4–5 vacuous (Δ_vN = Δ_SJ = 0 automatically in the sector) | mini-spec's named Lean deliverable |
| R0.10 | `tightmult_shape_approx_diag` (**Rung-1 preview, Iter-5**) | qualitative fallback form: defects → 0 forces distance → 0 (quantitative: O(defect^{1/2}) at scale c²·(1+π), b' := π forced by Δ_Q+ ≈ 0) | gated on the two LIT sweeps' bespoke rates (§3) |

Statement count: 11 (1 def + 10 statements), of which 2 are hard-core binders (R0.6,
R0.7) and 2 are Iter-5 Lean targets (R0.9, R0.10).

## 3. Nearest-miss table (R7 §B, both sweeps CLEAR — record for the article's related-work)

| channel | nearest statement | arXiv | why it is not the theorem |
|---|---|---|---|
| Δ_vN (vN trace inequality, quantitative/equality) | Guterman–Wolf, *Poset-refined majorization relations* | 2607.28061 | strengthens the inequality by relaxing aligned orderings to partial orders — a refinement line, not stability; no explicit constants |
| Δ_vN (equality ⇒ aligned diagonalization; stability shape) | Hastings, *Making Almost Commuting Matrices Commute* (v4) | 0808.2474 (CMP 291:321) | dimension-independent δ–ε for ‖[A,B]‖ small ⇒ near-commuting pair — the structural template for our stability rung, NOT a vN-deficit statement; cite the v4 hygiene note (proof error fixed after Filonov–Kachkovskiy) when building on it; qualitative predecessor H. Lin |
| Δ_vN (other trace inequalities' equality cases) | Fang–He–Huang 2608.30172; Hiai 2402.16067; Li–Zhou 2608.20937 | — | equality cases for OTHER inequalities (Jensen trace, log-majorization/Golden–Thompson, Audenaert); qualitative only |
| Δ_SJ (Schur–Horn, quantitative) | Chen–Li, *On the Continuity of Schur–Horn Mapping* (v2 2026) | 2407.00701 | THE nearest statement: continuity of the eigenvalue map at fixed diagonals — continuity, not Lipschitz/Hölder constants |
| Δ_SJ (direction-opposite) | Uhlmann–Wang (SPD, dim ≤ 6) | 2609.35558 | reverse Schur–Horn majorization — cite-optional |
| Δ_SJ (equality-case analogues) | Mishra 2309.04562 (symplectic Weyl/Lidskii/S–H, LAA 2026); Bhatia–Jain 2004.03906 | — | equality in OTHER S–H-type inequalities |
| context (2026 applications, not competition) | Zelaya–Miri 2608.19353, 2607.24104; Kleywegt–Milz–Singh–Xie 2605.27837; Zhang 2601.10602; Bloch–Ratiu 2504.12924 (MK↔S–H link, also FB-1's OT junction); Meckes–Meckes 1711.02710 | — | tomography / spectral design / hyperbolic / transport-link lines |

**Bottom lines (R7 §B, quoted status):** "a theorem 'deficit in the vN trace
inequality controls distance to an aligned (near-)commuting pair, with explicit
constants' is not in the arXiv literature"; "a quantitative (piecewise-strict g_c)
Schur–Horn stability theorem is unclaimed; nearest = Chen–Li continuity." Both rungs
clear — no obstruction, and both hard cores must name these or prove bespoke rates
(the paper tranche cites; Rung-1 decides bespoke vs cited rates).

## 4. P0 elaboration spec (statement-level; NOT run this iteration)

- **File** `research/pilots/01/R0.lean` (new; self-contained statement file,
  MasterIdentity.lean idiom: Prop-valued defs, NO sorry/axiom/native_decide anywhere,
  namespace `CrossMath.RankTraceDefect.Rung0`).
- **Carry**: the defect-definition block of `MasterIdentity.lean` (:40–:107) verbatim
  (the frozen milestone-(a) surface — same self-contained-carry discipline as
  pilots/32/M2.lean and Pb.lean; no sibling import, so the eventual Step-B stage is a
  plain make_axcheck append, no rewrite).
- **Imports** (MasterIdentity's verified set): `Mathlib.Analysis.Matrix.Spectrum`,
  `Mathlib.Analysis.Matrix.PosDef`, `Mathlib.Algebra.Star.UnitaryStarAlgAut`,
  plus `Mathlib.LinearAlgebra.Matrix.Diagonal` (shape predicate) and
  `Mathlib.Algebra.Star.Unitary` (unitary anchor).
- **Elaborate** (all as `def … : Prop`): R0.0–R0.8 of §2 (R0.9–R0.10 commented as
  Iter-5 placeholders or included if the diagonal-sector statement pins cleanly at
  P0 time). Hard-core binders `hVN_eq`, `hSH_eq` are ordinary Prop binders on
  R0.2/R0.8 — no sorry needed since nothing is proved.
- **Anchors** (`#check` preflight, BindingSurface.lean precedent): the
  MasterIdentity surface above; `Matrix.IsUnitary` / `Matrix.diagonal`;
  `Matrix.IsHermitian.eigenvalues₀`; donor-statement SHAPES re-declared verbatim as
  Prop-valued defs (`stmt_vn_ineq` from `vonNeumann_trace_ineq` port :480 shape;
  `stmt_sum_gc_ge` from `sum_gc_eigenvalues_ge` port :1559 shape) so the binders'
  types elaborate against the port's own statement forms.
- **Acceptance** (when chartered, Iter-5): elaborates 0 errors / 0 sorry-warnings on
  mathlib `ff2494ea` (v4.36.0-rc2) via the generic statement-probe route (`modal run`
  ephemeral app class, 2 cpu / 4 GB, doz CLI); verdicts are elaboration verdicts
  only. No Modal run is required or performed for the paper tranche itself (this
  document); the P0 file may be drafted any time, run only at charter.
- **Effort (R2 §12.1 grades):** paper Rung 0 **M** (mechanisms 1–3 elementary;
  hard cores A/B are the mass); Rung 1 **M+** (gated on bespoke-vs-cited rates;
  qualitative fallback is a real theorem); Lean diagonal **S–M** (~0.4–0.8k LoC,
  Iter-5). Feeds R5: a characterization theorem is a category upgrade for the KPI's
  discovery-grade accounting of the project's strongest unconditional article.

## 5. Provenance

- Mini-spec: `qa/iter4-review/r2-discovery-strength.md` §12.1 (:794–857) — followed
  verbatim for the Rung-0 statement, caveat sentences, mechanism list, Lean-diagonal
  scope, and effort grades; the two LIT sweeps' go-condition = R7 §B
  (`qa/iter4-review/r7-bib-cards.md` §B.1/§B.2, folded 2026-11-16).
- Vocabulary/anchors verified on disk this session: `pilots/01/MasterIdentity.lean`,
  `pilots/01/port/03_VonNeumann.lean`, `pilots/01/port/08_RankTraceMult.lean`,
  `pilots/01/BindingSurface.lean`; article-01 Theorems 1–3 at
  `articles/01-inertial-defect-master-identity.md:95–:152`.
- One-writer: `research/pilots/01/rung0-tranche.md` (this file). No article edits
  (A9/R1 own article-01); no dossier edits.
