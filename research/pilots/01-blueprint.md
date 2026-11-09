# Pre-pilot blueprint — dossier 01 (ez1-inertial-defect-master-identity) + shared RHLinalg port

Lane R6, 2026-11-09. Scope: port inventory (bundling dossiers 01+03), first-milestone
statement-file spec, Modal pilot plan (consumes R9's probe infra), risk register, decl-index
errand. Everything below is a plan — **no builds were run**. Companion docs:
`research/candidates/01-ez1-inertial-defect-master-identity.md` (statement + F0–F6),
`research/feasibility/mathlib-assembly-maps.md` §C (R3's donation map — cross-read below),
`research/feasibility/probe/` (R9's probe infra).

---

## §1 Shared port inventory (dossiers 01 + 03)

**Corpus:** `/home/doz/zcode-workdir/anthropics_formal-math/zeta23` (read-only; built on
Mathlib v4.33.0-rc2 pin `51e6992e`; target = encore-mathlib v4.36.0-rc2, checkout
`ff2494ea`, R9 §0). **Bundle = 9 files, 1827 LoC core (+123 stretch);** `wc -l` verified this
session. All under namespace `RHLinalg` (except the last two, `Zeta23.ZeroSide.*`).

| # | File (donor path `zeta23/Zeta23/…`) | LoC | Imports (verbatim, `:line`) | Needed for | Drift-risk spots → v4.36 binding decls [VERIFIED in encore checkout] |
|---|---|---|---|---|---|
| 1 | `LinAlg/PosIndex.lean` | 127 | `Mathlib.Analysis.Matrix.PosDef` (:13) | 01, 03 | `Matrix.IsHermitian.eigenvalues` (`Analysis/Matrix/Spectrum.lean:67`), `rank_eq_card_non_zero_eigs` (:202), `trace_eq_sum_eigenvalues` (:240); `PosSemidef` API (`Analysis/Matrix/PosDef.lean:34 posSemidef_iff_eigenvalues_nonneg`, `:42 eigenvalues_nonneg`) |
| 2 | `LinAlg/HermitianPosPart.lean` | 204 | `Zeta23.LinAlg.PosIndex` (:13) | 01, 03 | `specMap` is built on `Unitary.conjStarAlgAut` (`Mathlib/Algebra/Star/UnitaryStarAlgAut.lean`, unitary → ⋆-alg-equiv), `IsHermitian.spectral_theorem` (`Analysis/Matrix/Spectrum.lean:143`), `eigenvectorUnitary` (:89), `Matrix.diagonal` API, `PosSemidef.diagonal_mul_mul_conjTranspose_same`-family (`Analysis/Matrix/PosDef.lean`) |
| 3 | `LinAlg/VonNeumann.lean` | 204 | `Zeta23.LinAlg.PosIndex` (:13), `Mathlib.Analysis.Convex.Birkhoff` (:14), `Mathlib.Algebra.Order.Rearrangement` (:15) | 01, 03 | `exists_eq_sum_perm_of_mem_doublyStochastic` (`Analysis/Convex/Birkhoff.lean:146`), `Monovary.sum_mul_comp_perm_le_sum_mul` (`Algebra/Order/Rearrangement.lean:439`), `eigenvalues₀` + `eigenvalues₀_antitone` (`Analysis/Matrix/Spectrum.lean:60,:63` — note R3's map §C.1/§3 cites :65; direct read gives :63), `Matrix.unitaryGroup`, `Unitary.mul_star_self_of_mem`/`star_mul_self_of_mem` (`Algebra/Star/Unitary.lean`) |
| 4 | `LinAlg/Sylvester.lean` | 309 | `Zeta23.LinAlg.HermitianPosPart` (:13), `Mathlib.LinearAlgebra.FiniteDimensional.Lemmas` (:14) | 01, 03 | `Submodule.finrank_mono`, `LinearMap.finrank_range_of_inj`, `LinearMap.domRestrict` (all `LinearAlgebra/FiniteDimensional/Lemmas.lean`-stable); `hermForm`/`PosDefOn` are donor-local (no mathlib counterpart — the R3 §C.1 gap) |
| 5 | `LinAlg/Inertia.lean` | 138 | `Zeta23.LinAlg.Sylvester` (:13) | 03 (03a) | same as #4; `isHermitian_conjTranspose_mul_mul` (donor `HermitianPosPart.lean` route; mathlib has the fact in `Analysis/Matrix/PosDef.lean` PSD block lemmas — bind donor-side first) |
| 6 | `LinAlg/Weyl.lean` | 136 | `Zeta23.LinAlg.PosIndex` (:13), `Zeta23.LinAlg.Sylvester` (:14), `Mathlib.Algebra.Order.Chebyshev` (:15) | 01 only via umbrella (see below) | `sq_sum_le_card_mul_sum_sq` (`Algebra/Order/Chebyshev.lean:143`) |
| 7 | `LinAlg/RankTrace.lean` | 267 | `Zeta23.LinAlg.PosIndex` (:13), `Zeta23.LinAlg.VonNeumann` (:14), `Zeta23.LinAlg.HermitianPosPart` (:15) | 01, 03 | `Matrix.rank` (`LinearAlgebra/Matrix/Rank.lean:133`); proof-level: `nlinarith`-friendly `sq_nonneg` steps (stable); `Finset.sum_sub_distrib` simp shape (proof-only drift) |
| 8 | `Zeta23.lean` umbrella `LinAlg.lean` | 10 | imports #1–#7 | forces full 7-file port | trivial |
| 9 | `ZeroSide/RankTraceMult.lean` | 442 | `Zeta23.LinAlg` umbrella (:16), `Mathlib.LinearAlgebra.Lagrange` (:17) | **01 core** (the :346 unfreeze site; `gc`/`kc` :30/:351, `Pmat`/`xsq` :223/:226, `sum_eigenvalues_comm` :189) | `Polynomial.Lagrange.interpolate` (`LinearAlgebra/Lagrange.lean:298`) + `eval_interpolate_at_node`; `Matrix.posSemidef_self_mul_conjTranspose`/`conjTranspose_mul_self` (`Analysis/Matrix/PosDef.lean:63,67`) |
| 10 | *(stretch)* `ZeroSide/TightMult.lean` | 123 | `Zeta23.ZeroSide.RankTraceMult` (:15), `Mathlib.LinearAlgebra.Matrix.Diagonal` (:16) | 01's A4 anchor only | `posSemidef_diagonal_iff`, `rank_diagonal` (`LinearAlgebra/Matrix/Diagonal.lean` / `Rank.lean`); `kc`-table lemmas :389–393 (risk #3) |

**Topological port order (also the R3 §C.3 staging, reconciled):**
`PosIndex → HermitianPosPart → {VonNeumann ∥ Sylvester} → {Inertia, Weyl, RankTrace} →
LinAlg.lean umbrella → RankTraceMult → (stretch: TightMult)`.
Parallelizable pairs in braces. R3 §C.3 orders Weyl third (before Inertia/Sylvester) because it
needs only `specMap`; either order is consistent with the import graph above — the pilot should
follow R3's cheapest-first (Weyl before Sylvester) since `specMap` arrives with #2 and Weyl is
then self-contained. **Bundle note for triage:** dossier 03's closure is files #1–#5 + #7 (+#8);
dossier 01 adds #6, #9, (#10). Porting the 9-file bundle once serves both.

## §2 First-milestone target: statement-file spec for Modal elaboration

**One self-contained file** (proposed path in a future pilot repo: `CrossMath/Pilot01/
MasterIdentity.lean`), importing the ported chain; namespaces kept **verbatim** from the donor
(`RHLinalg`, `Zeta23.ZeroSide.RankTraceMult`) so the regression anchors are statement-identical.
New content lives in `CrossMath.RankTraceDefect`. Requirements: elaborates against v4.36 mathlib;
proof bodies in this *spec* are step-comments (NOT `sorry` — the pilot's actual file must be
sorry-free per math-proof1 standard; R9's probe-style `sorry` scaffolding is elaboration-only and
never lands in the pilot repo).

**Definitional layer (5 defs + 1 helper), theorem signature, and 3 sub-lemmas** in dependency
order — each sub-lemma mapped to the donor proof-step it restructures:

- **S1 (rearrangement defect equality).** Donor `hstep4` (`RankTraceMult.lean:326`, an
  inequality derived from `vonNeumann_trace_ineq`) becomes an *equality* with named remainder
  `2·Δ_vN`; the donor's `hvN` (:325) supplies the sign.
- **S2 (pairing + Schur–Jensen defect equalities).** Donor `hstep5'` (:334, via
  `sum_sq_sub_ge_gc` :87) splits into the pointwise-defect equality plus the Schur–Jensen
  remainder from `sum_gc_eigenvalues_ge` (:270).
- **S3 (pair-block defect equality).** Donor `hstep6` (:339, via
  `RHLinalg.sum_sq_lower_of_card_pos_le`, `zeta23/Zeta23/LinAlg/RankTrace.lean:87`) with the
  slack binder `hb : posIndex hQ ≤ b` **instantiated at `b := posIndex hQ`** so the remainder is
  exactly the sum of squares `Σ (q⁺ᵢ − c)²`.
- **MAIN (master identity).** Assembly of S1–S3 with the donor's `hexpand`
  (`RankTraceMult.lean:314`) and `htraceQ` (:345) by `ring` — this replaces the
  **`linarith [hstep4, hstep5', hstep6, hPQp, hexpand, htraceQ]` at `RankTraceMult.lean:346`**,
  the exact unfreeze point named in dossier 01.

```lean
/-
  CrossMath/Pilot01/MasterIdentity.lean — STATEMENT SPEC (pilot milestone 1).
  Spec only: `:= by` bodies below are step-comments, not proofs, not sorry.
  Ported-namespace prerequisites (§1): RHLinalg.* (files #1–#8),
  Zeta23.ZeroSide.RankTraceMult.{gc, kc, Pmat, xsq, gc_zero, ...} (file #9).
-/
import CrossMath.RankTraceMult            -- ported donor chain, namespaces verbatim

namespace CrossMath.RankTraceDefect

open Matrix RHLinalg RankTraceMult        -- rtrace, frobSq, posIndex, hermPosPart, gc, Pmat, xsq
open scoped ComplexOrder

variable {𝕜 : Type*} [RCLike 𝕜]
variable {n : Type*} [Fintype n] [DecidableEq n]
variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Scalar defect Δ_c(p,m) = (p−m)² − c·p − g_c(p) + 2c·m  (dossier 01, Thm A).
    Explicitly m·(m+2(c−p)) for p ≤ c and (p−c−m)² for p ≥ c. -/
def deltaC (c p m : ℝ) : ℝ := (p - m) ^ 2 - c * p - gc c p + 2 * c * m

/-- Δ_pt — pairing defect: Σ_k Δ_c(p_k, μ_k), p/μ the sorted spectra of P and Q₋. -/
def pairingDefect (c : ℝ) {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) : ℝ :=
  ∑ k, deltaC c hP.eigenvalues₀ k hQm.eigenvalues₀ k

/-- Δ_SJ — Schur–Jensen defect: Σ_k g_c(λ_k(P)) − Σ_j g_c(m_j‖v_j‖²). -/
def schurJensenDefect (c : ℝ) (m : ι → ℝ) (v : ι → n → 𝕜) {P : Matrix n n 𝕜}
    (hP : P.IsHermitian) : ℝ :=
  ∑ k, gc c hP.eigenvalues₀ k - ∑ j, gc c (m j * xsq v j)

/-- Δ_vN — rearrangement defect: Σ_k p_k·μ_k − Re tr(P·Q₋). -/
def rearrangementDefect (c : ℝ) (P : Matrix n n 𝕜) {Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) : ℝ :=
  ∑ k, hP.eigenvalues₀ k * hQm.eigenvalues₀ k - RCLike.re (P * Qm).trace

/-- Δ₊ — positive-coupling defect: 2·Re tr(P·Q₊). -/
def posCouplingDefect (P Qp : Matrix n n 𝕜) : ℝ := 2 * RCLike.re (P * Qp).trace

/-- Δ_Q+ — pair-block defect: ‖Q₊‖²_F − 2c·tr Q₊ + c²·n₊(Q)  (= Σ_{q⁺ᵢ>0} (q⁺ᵢ−c)² by S3). -/
def pairBlockDefect (c : ℝ) {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) : ℝ :=
  frobSq (hermPosPart hQ) - 2 * c * rtrace (hermPosPart hQ) + c ^ 2 * (posIndex hQ : ℝ)

/-- Nonnegativity of the scalar defect (mirror of donor `sq_sub_ge_gc`,
    RankTraceMult.lean:81, remainder kept explicit). -/
theorem deltaC_nonneg {c p m : ℝ} (hp : 0 ≤ p) (hm : 0 ≤ m) (hc : 0 ≤ c) :
    0 ≤ deltaC c p m := by
  -- STEP: rcases le_or_gt p c → rw [gc_of_le / gc_of_ge]; unfold deltaC; nlinarith [sq_nonneg …]
  sorry_spec_step_only

/-- S1: donor `hstep4` (RankTraceMult.lean:326) as an equality with named remainder 2·Δ_vN. -/
theorem frob_split_rearrangement {P Qm : Matrix n n 𝕜}
    (hP : P.IsHermitian) (hQm : Qm.IsHermitian) :
    frobSq P - 2 * RCLike.re (P * Qm).trace + frobSq Qm
      = ∑ k, (hP.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
        + 2 * rearrangementDefect 0 P hP hQm := by   -- (c arg dropped in S1; Δ_vN is c-free)
  -- STEP: expand both frobSq by `frobSq_hermitian_eq_sum_sq_eigenvalues` (PosIndex.lean:117,
  --      reindexed via `sum_eigenvalues_reindex` :96); the cross term is
  --      2·(Σ p·μ − Re tr(PQm)); `vonNeumann_trace_ineq` (VonNeumann.lean:171) signs the remainder.
  sorry_spec_step_only

/-- S2: donor `hstep5'` (RankTraceMult.lean:334) + `sum_gc_eigenvalues_ge` (:270),
    split into pointwise defect and Schur–Jensen remainder. -/
theorem pairing_split (m : ι → ℝ) (hm : ∀ j, 0 ≤ m j) (v : ι → n → 𝕜)
    {Qm : Matrix n n 𝕜} (hQm : Qm.IsHermitian) {c : ℝ} (hc : 0 ≤ c) :
    ∑ k, ((Pmat m v).isHermitian.eigenvalues₀ k - hQm.eigenvalues₀ k) ^ 2
      = c * rtrace (Pmat m v) + (∑ k, gc c (Pmat m v).isHermitian.eigenvalues₀ k)
          - 2 * c * rtrace Qm
        + pairingDefect c (Pmat m v).isHermitian hQm := by
  -- STEP: termwise `deltaC` rewrite (deltaC_nonneg reversed); then
  --      `sum_eigenvalues_reindex` + `rtrace_eq_sum_eigenvalues` (PosIndex.lean:75) on the traces.
  sorry_spec_step_only

theorem schurJensen_split (m : ι → ℝ) (hm : ∀ j, 0 ≤ m j) (v : ι → n → 𝕜)
    {c : ℝ} (hc : 0 ≤ c) :
    ∑ k, gc c (Pmat m v).isHermitian.eigenvalues₀ k
      = ∑ j, gc c (m j * xsq v j) + schurJensenDefect c m v (Pmat m v).isHermitian := by
  -- STEP: definitional unfold; nonnegativity is donor `sum_gc_eigenvalues_ge` (:270) verbatim.
  sorry_spec_step_only

/-- S3: donor `hstep6` (RankTraceMult.lean:339) at the sharp budget b := n₊(Q);
    remainder exactly Σ_{q⁺ᵢ>0} (q⁺ᵢ−c)². -/
theorem pairBlock_split {Q : Matrix n n 𝕜} (hQ : Q.IsHermitian) {c : ℝ} (hc : 0 ≤ c) :
    frobSq (hermPosPart hQ)
      = 2 * c * rtrace (hermPosPart hQ) - c ^ 2 * (posIndex hQ : ℝ)
        + pairBlockDefect c hQ
    ∧ pairBlockDefect c hQ
      = ∑ i, ((max (hQ.eigenvalues i) 0) - c) ^ 2 *ᵥ 1 := by  -- (see note: sum over support)
  -- STEP: `frobSq_hermPosPart` + `rtrace_hermPosPart` (HermitianPosPart.lean:196,:186),
  --      `sum_sq_lower_of_card_pos_le` at hb := le_refl (posIndex hQ) — slack becomes
  --      the sum of squares by `sum_eq_of_sub_eq_zero`-style termwise `(q⁺−c)²` identity.
  sorry_spec_step_only

/-- MAIN — the master identity (dossier 01, Theorem A). Replaces the `linarith` at
    RankTraceMult.lean:346. -/
theorem master_identity (m : ι → ℝ) (hm : ∀ j, 0 ≤ m j) (v : ι → n → 𝕜)
    (Q : Matrix n n 𝕜) (hQ : Q.IsHermitian) {c : ℝ} (hc : 0 < c) :
    frobSq (Pmat m v + Q)
      = c * rtrace (Pmat m v) + (∑ j, gc c (m j * xsq v j)) + 2 * c * rtrace Q
          - c ^ 2 * (posIndex hQ : ℝ)
        + pairingDefect c (Pmat m v).isHermitian (hermNegPart hQ).isHermitian
        + schurJensenDefect c m v (Pmat m v).isHermitian
        + 2 * rearrangementDefect 0 (Pmat m v) (hermNegPart hQ).isHermitian …
        + posCouplingDefect (Pmat m v) (hermPosPart hQ)
        + pairBlockDefect c hQ := by
  -- STEP 1: donor `hexpand` (RankTraceMult.lean:314) verbatim — it is already an identity.
  -- STEP 2: rewrite its pieces by S1 (on P, Qm := hermNegPart hQ), S2 + schurJensen_split,
  --         S3 (on Qp := hermPosPart hQ).
  -- STEP 3: `htraceQ : 2*c*rtrace Q = 2*c*rtrace Qp − 2*c*rtrace Qm` (donor :345,
  --         `rtrace_sub_decomp`, HermitianPosPart.lean:192); close by `ring`.
  sorry_spec_step_only

end CrossMath.RankTraceDefect
```

Spec-level caveats (to be resolved when writing the real file, listed here so they are not
rediscovered): (i) `rearrangementDefect` needs no `c` — drop the parameter or keep for
signature uniformity; (ii) the `*ᵥ 1` in S3's squares-form is a placeholder — write
`∑ i ∈ Finset.univ.filter (fun i => 0 < hQ.eigenvalues i), (hQ.eigenvalues i - c) ^ 2`
mirroring donor `hstep6`'s filter (`RankTraceMult.lean:342–344`); (iii) `(Pmat m v).isHermitian`
should be a named have (`Pmat_posSemidef m v).1`, donor :242) rather than a dotted projection;
(iv) ℕ→ℝ casts on `posIndex` must be single `(posIndex hQ : ℝ)` sites to keep `ring` closable.

**Regression anchors** (same file or a sibling `Regression.lean`): re-prove donor
`rank_trace_mult` (:281) and `rank_trace_mult_k` (:369) *from* `master_identity` by dropping
defects via their nonnegativity lemmas — this is the milestone-1 acceptance test that the port
is faithful (the donor statements must elaborate verbatim, cf. R9's `ProbeB1_RHLinalg.lean`
which already elaborates `rank_trace_ineq`'s statement against v4.36).

## §3 Modal pilot plan

**Pattern source (read this session):** math-proof1's Modal discipline
(`/home/doz/zcode-workdir/math-proof1/AGENTS.md` "Build" section): all builds on Modal via
`lean_build.py` / `lean_check.py`; CLI at `/home/xyz/xyzenv/bin/modal` reached by passwordless
`sudo -u xyz`; xyz cannot read `/home/doz` → mirror/stage first (`tools/modal_run.sh`;
`tools/stage_chain.sh` = one `lean_check` per module, stop-at-first-failure, resumable through
build cache; telemetry + `[memory]` tables with a 64 GiB investigation threshold). R9's probe
infra already adapts this: `research/feasibility/probe/run_probe.sh` stages into
`/tmp/crossmath-probe-stage` and `sudo -u xyz modal run lean_probe.py --dir …`;
`lean_probe.py` = app `crossmath-probe`, image `debian_slim(python 3.12)` + elan v4.2.4 +
toolchain `v4.36.0-rc2` + mathlib clone at `MATHLIB_REV=ff2494ea…` + `lake exe cache get`
oleans; function `cpu=4.0, memory=32768, timeout=2h`; elan layer *textually identical* to
math-proof1's so the layer cache is shared; ephemeral only (no volumes/secrets/deploy).

**Pilot design — consume R9's infra as it lands** (`research/feasibility/port-probe.md` +
probe results not yet on disk; `probe/` scripts are):

- **Image/volume:** reuse the `crossmath-probe` image bake as-is (one-time bake ≈ 15–30 min,
  mostly cached via the shared elan layer; `cache get` ≈ 5–15 min — both already part of the
  bake). No Modal volumes (matches the ephemeral-only authorization under which R9 built it);
  the pilot repo is small (≤ ~2.5k LoC + proofs) and stages in seconds. If the pilot outgrows
  ephemeral runs (multi-day iteration), request a read-only volume mount of `/opt/mathlib`
  separately rather than mutating the probe app.
- **What gets mounted/staged:** the staged dir gains the ported files (#1–#9 §1, verbatim
  donor text with adjusted `import` lines), the pilot lakefile (a mathlib-using leaf package —
  math-proof1's `lakefile.toml` shape), and `Pilot01/MasterIdentity.lean` from §2. Files are
  written into the container's `/opt/mathlib` tree as sibling modules (probe pattern:
  `repo / rel` writes) — simplest path to warm oleans; a standalone package with
  `lake-packages` symlink (math-proof1 `lean_check` pattern) is the fallback if writing into
  the mathlib tree is undesirable.
- **Phased runs & wall-time estimates** (reasoning: probe function shape cpu=4/mem=32 GiB;
  math-proof1 measured "~1 min round trip" per target with warm tree; RHLinalg files are
  tactic-light except Sylvester/RankTraceMult; no `decide`-heavy content):
  - **(a) Statement-only elaboration** (§2 file with proofs as `sorry`-free *empty*
    placeholders is impossible — so: elaborate a probe-style twin with `sorry` bodies, probe
    authorization, never committed): **~3–6 min wall** (container spin ~1–2 min on warm image +
    elaboration of ~180 LoC against warm oleans ~1–4 min). This is exactly R9's `ProbeB1`
    pattern extended with the §2 statements — add `ProbeC_MasterIdentity.lean` to `probe/`.
  - **(b) Ported-library compile** (#1–#9, one `lake build`): per-file elaboration
    1–6 min (heaviest: Sylvester.lean ~3–5 min submodule/finrank chains; RankTraceMult.lean
    ~5–10 min Lagrange + big-sum rewriting) → **~20–40 min machine-time clean; budget 2–3 h**
    (2–3 compile-fix iterations for simp-drift). Fits the 2 h function timeout if run
    per-module `stage_chain`-style; a single all-modules run should raise timeout to 4 h.
  - **(c) Full proof** (S1–S3 + MAIN + regression anchors, ~400–600 new LoC): each successful
    full pass **~1–2 h machine-time**; expect 3–8 iteration cycles (risk register §4) →
    **1–2 days calendar**, each cycle a per-target Modal round trip of minutes.
- **Check discipline:** `lean_check`-style per-target builds with `[telemetry]`/`[memory]`
  capture; math-proof1 caveat applies — Modal `memory=` is soft (60 GiB RSS observed on a
  "32 GiB" request), so keep the 64 GiB investigation rule; RHLinalg is expected well under
  (no `decide` kernels; largest risk is `nlinarith` heartbeats in S2 — raise
  `maxHeartbeats` before suspecting the port).

## §4 Risk register (top 5, with mitigations)

1. **v4.33→v4.36 spectral/PSD API drift in files #1–#3.** The port binds to
   `IsHermitian.spectral_theorem`/`eigenvectorUnitary`/`conjStarAlgAut`/`Unitary.*_of_mem`/
   Birkhoff/rearrangement — names verified present at v4.36 (§1 column 6; R9 §1 #1 CONFIRMED
   the substrate), but *proof-level* drift (simp lemma shapes like `Finset.sum_sub_distrib`,
   `Matrix.mulVec` simp normalization) is the realistic breakage. **Mitigation:** R9's
   `ProbeB1_RHLinalg.lean` already elaborates the three headline statements verbatim; extend it
   with `ProbeB1plus` covering `HermitianPosPart`/`Sylvester`/`Weyl` statements +
   `conjStarAlgAut` smoke (5 min, phase (a)) *before* any porting; port files in §1 topo order
   so drift surfaces one file at a time.
2. **The `b = π` specialization vs the donor's slack binder.** Donor `hstep6` carries
   `hb : posIndex hQ ≤ b`; the defect Σ(q⁺−c)² is exact only at `b := posIndex hQ` (slack
   `b − π` contributes `(b−π)c²`). **Mitigation:** state `master_identity` with no `b` binder
   at all (§2 draft does); prove S3 by instantiating `sum_sq_lower_of_card_pos_le`
   (`RankTrace.lean:87`) at `le_refl` and converting the resulting `≤` to `=` via the termwise
   square identity — do not attempt a general-b master identity.
3. **Numeric-side `k_c` table lemmas** (`kc_two_one`, `sum_kc_two_nat`, …,
   RankTraceMult.lean:389–438) — only needed by the *stretch* anchor `lemmaR_tight`
   (TightMult.lean), not by MAIN; they mix `norm_num`/`omega` casts that occasionally drift.
   **Mitigation:** milestone gate excludes file #10; port it last, and only
   `lemmaR_tight` (uses `kc_of_le` + `sum_kc_two_nat`), deferring the c = 3 table entirely.
4. **`RankTraceMult` internal hypotheses** shape the statement surface: `Wmat` needs
   `Real.sqrt (m j)` (hence `hm : ∀ j, 0 ≤ m j`), `sum_eigenvalues_comm` needs `g 0 = 0`
   (`gc_zero`, :38) — the defect defs must compose with these verbatim or S2's transfer step
   breaks. **Mitigation:** keep donor `gc`/`kc`/`Pmat`/`xsq` definitions *unmodified* (§2 does:
   `deltaC` is a new def over `gc`); add `gc_zero`, `rtrace_Pmat`, `Pmat_posSemidef` to the
   regression-anchor list.
5. **Toolchain/cache drift at Modal run time.** `lake exe cache get` returns nothing for a
   too-fresh mathlib rev → `lean_probe.py` aborts `CACHE-MISS` (built-in guard). **Mitigation:**
   already engineered by R9: pin `MATHLIB_REV=ff2494ea…`; fallback nightly tag
   `master-2026-11-08` documented in `lean_probe.py` (probe-relevant diff vs checkout is only
   `HurwitzZetaValues.lean`, untouched by this pilot). Secondary drift: elan bump vs mathlib
   CI oleans — the bake pins elan v4.2.4, keep it pinned in the pilot runner.

## §5 Sanity errand — decl-index verdict

**Resolved: `research/qa/decl-index.tsv` EXISTS** (2,888,273 rows; TSV `project, file, kind,
name`; built by H via `research/qa/make-decl-index.sh`, alongside a new
`research/qa/mathlib-frontier-spotcheck.md`). File mtimes indicate it landed 2026-11-09
~18:38, *after* dossiers 01–03 were written (their "absent" statements were accurate at the
time; dossiers should be treated as corpus-direct searches, still valid). Retroactive index
check for this blueprint: donor rows confirmed present — `zeta23 / Zeta23/LinAlg/Inertia.lean /
theorem / posIndex_conj_le`, `…/ZeroSide/RankTraceMult.lean / theorem / rank_trace_mult`,
`rank_trace_mult_k`, `rank_trace_mult_k_le`, `…/TightMult.lean / theorem / lemmaR_tight` —
and no `master_identity`/`pairingDefect`/defect-form or bandwidth-2/`ceiling_law`-successor
declarations exist under those names (substring counts like `defect|ceiling|master` are noisy
— e.g. "Effective", "Ceil"-adjacent names — so name-exact queries were used; 44 rows match
`rank_trace|posIndex|lemmaR|gc |kc `, all donor-side). No dossier edits required; future
novelty checks should start from this index, then fall back to corpus rg for synonym sweeps.

---

## §6 Milestone (a) run log (executed 2026-11-09, lane R6)

**Status: GREEN** — both files elaborate clean (0 errors, 0 warnings, 0 sorry) against mathlib
v4.36.0-rc2 @ `ff2494ea` (container-verified: HEAD + `lean-toolchain` echoed; 8710 oleans).

**Files (written under `research/pilots/01/`):**
- `MasterIdentity.lean` — statement layer per §2. Convention chosen (sorry-free, axiom-free):
  theorems as **Prop-valued `def`s** (`stmt_S1`, `stmt_S2`, `stmt_S2'`, `stmt_S3`,
  `stmt_main`, `stmt_deltaC_nonneg`); donor defs copied verbatim (`posIndex`, `rtrace`,
  `frobSq`, `specMap`, `hermPosPart`, `hermNegPart`, `gc`, `Wmat`, `Pmat`, `xsq`) with two
  notational changes (⁺/⁻ → explicit `max` lambdas; namespace `CrossMath.RankTraceDefect`);
  new defs `deltaC` + the five defects (`pairingDefect`, `schurJensenDefect`,
  `rearrangementDefect`, `posCouplingDefect`, `pairBlockDefect`). `pairBlockDefect` is stated
  in the spectral sum-of-squares form (`Σ_{qᵢ>0}(qᵢ−c)²`), which simplifies blueprint §2's
  S3 (its ∧-squares conjunct is now definitional).
- `BindingSurface.lean` — import-surface #check (13 modules, 29 `#check`s).

**Invocation (R9's `crossmath-probe` pattern, ephemeral, no volume):**
stage `lean_probe.py` + the two files into `/tmp/crossmath-pilot01-stage` (world-readable;
xyz cannot read `/home/doz`), then `sudo -n -u xyz bash -lc "cd /tmp/crossmath-pilot01-stage
&& /home/xyz/xyzenv/bin/modal run lean_probe.py --dir /tmp/crossmath-pilot01-stage"`.
Environment identical to R9's probe: app `crossmath-probe`, image cached (warm), 4 CPU /
32 GiB, `lake env lean` per file.

**Iterations (3 of ≤3 budget used):**
1. **Run 1** (app `ap-4C6EJdr8D4eLhE4s0hhgwv`): `MasterIdentity.lean` FAIL (4 errors) —
   application-precedence: `deltaC c hP.eigenvalues₀ k` parses as one application; fixed by
   parenthesizing `(hP.eigenvalues₀ k)` at 4 sites (`:87,92,125,131`) + `_hQp` rename
   (unused-binder linter). Probe-side authoring bug, not API drift. `BindingSurface.lean`
   FAIL (error above the captured tail — rerun with full log).
2. **Run 2** (`ap-xfTqJVZi2V6JUEkcJ1m8FJ`): `MasterIdentity.lean` **OK**. `BindingSurface.lean`
   FAIL (2 unknown-constant errors): `Polynomial.Lagrange.interpolate` /
   `.eval_interpolate_at_node`. Diagnosis (source): `namespace Polynomial` **closes at
   Lagrange.lean:129**; `namespace Lagrange` (:135) is root-level — correct names are
   `Lagrange.interpolate` (:298) / `Lagrange.eval_interpolate_at_node` (:318), exactly as the
   donor writes them (`open Polynomial` + `Lagrange.interpolate`, RankTraceMult.lean:196).
   Probe-side name error, **not** a module-visibility gap (Lagrange.lean has
   `@[expose] public section` at :29).
3. **Run 3** (`ap-8fUkkPrCGku3UwhhxV4aez`): **both files OK — errors=0, sorry-warnings=0,
   other-warnings=0.**

**Wall-time:** ~2 min per warm run end-to-end (staging → modal spin-up → two-file
elaboration; log timestamps 19:02→19:05→19:08), consistent with R9's 68 s warm baseline.
Raw logs kept at `/tmp/pilot01-run{2,3}.log` (run 1 captured via pipe tail only).

**Visibility sweep results (task item 3):** all 13 binding modules carry
`public section`/`@[expose]` above the bundle's bindings — **no sigPos-style private
bindings in the port surface**. The only `private` decls in these files are non-bindings
(`PosSemidef.preInnerProductSpace` Analysis/Matrix/PosDef.lean:95;
`exists_perm_eq_zero_implies_eq_zero` Birkhoff.lean:50; `doublyStochastic_sum_perm_aux`
Birkhoff.lean:88). Name-pin corrections folded into `BindingSurface.lean`'s header:
`LinearMap.finrank_range_of_inj` lives at `LinearAlgebra/Dimension/Finrank.lean:127`
(FiniteDimensional/Lemmas is merely transitive); `reindex_mem_doublyStochastic` at
`Analysis/Convex/DoublyStochasticMatrix.lean:119` (not Birkhoff.lean);
`posSemidef_self_mul_conjTranspose`-family in `LinearAlgebra/Matrix/PosDef.lean` (≠
`Analysis/Matrix/PosDef.lean`).

**Notable GREEN content:** the previously-UNPROBED `specMap` surface
(`Unitary.conjStarAlgAut` + `eigenvectorUnitary : Matrix.unitaryGroup n 𝕜` coercion +
`Matrix.diagonal`) elaborates verbatim — the last statement-level unknown from §1's drift
column is now empirically cleared; statement-level port risk for the whole bundle is
**zero confirmed breakage** (matches R9 ProbeB1's verdict, now extended to
HermitianPosPart/Sylvester-adjacent defs).

**Next (milestone (b), not started):** port the 9-file bundle per §1 order and re-prove
`rank_trace_mult` as the regression anchor; proof-level simp drift remains the live risk
(R9 §3 caveat).

---

## §6b Milestone (b) run log — the RHLinalg port (executed 2026-11-09, lane R6)

**Status: GREEN — all modules compile sorry-free, `#print axioms` clean, ZERO fix cycles.**

**Method.** Prefix-chain port: `research/pilots/01/make_port.py` (one-shot generator) emits
`research/pilots/01/port/{01..08}_*.lean`, where file k = tailored v4.36 import header +
verbatim concatenation of donor bodies 1..k (per-file copyright/imports stripped; proofs and
defs untouched). The prefix chain realizes §1's topo order and IS the per-module compile
discipline (each prefix compiles standalone against mathlib oleans — `lake env lean`, no lake
packaging). Module↔file mapping: M1 PosIndex (124 LoC), M2 +HermitianPosPart (315), M3
+VonNeumann (509), M4 +Sylvester (806), M5 +Inertia (931), M6 +Weyl (1053), M7 +RankTrace
(1305; = the whole `RHLinalg` namespace, subsuming umbrella `LinAlg.lean`), M8 +RankTraceMult
(1731). TightMult (row 10, stretch) excluded per blueprint gate. Header-level name-pin
corrections applied: +`Analysis.Convex.DoublyStochasticMatrix` (M3, `reindex_mem_
doublyStochasticDoublyStochastic` at v4.36 `DoublyStochasticMatrix.lean:119`),
+`Analysis.Matrix.Spectrum`, +`Algebra.Star.Unitary{,StarAlgAut}`, +`LinearAlgebra.Dimension.
Finrank` (M4), +`LinearAlgebra.Lagrange` (M8, root-namespace `Lagrange.*` — see §6).

**Runs.** Chunk 1 (M1–M4): one Modal run, **all OK first attempt** (errors=0, sorry=0). Chunk 2
(M5–M8): one Modal run, **all OK first attempt**. Donor `if_neg/if_pos` deprecation *warnings*
appear (RankTrace.lean region, v4.36 renames to `ite_eq_right/left`) — warnings only, zero
errors: **the predicted v4.33→v4.36 tactic churn did not materialize for this bundle** (all
heavy tactics — `nlinarith`, the Lagrange transfer, the Birkhoff argument — recompiled
unchanged). Axiom audit (from the milestone-(c) run's `#print axioms` output): `rank_trace_ineq`,
`vonNeumann_trace_ineq`, `posIndex_conj_le`, `weyl_posIndexAbove_le`, `rank_trace_mult`,
`rank_trace_mult_k`, `rank_trace_mult_k_le` → all `[propext, Classical.choice, Quot.sound]`.
Modal cost: 2 warm runs ≈ 2–3 min each. Logs: `/tmp/pilot01b-run{1,2}.log`.

## §6c Milestone (c) run log — the master-identity proof (executed 2026-11-09, lane R6)

**Status: GREEN — `09_MasterIdentity.lean` (2,053 LoC = port bundle + proof layer) compiles
with 0 errors, 0 sorry; MAIN and the acceptance anchor are axiom-clean.**

**Artifacts.** `research/pilots/01/master_layer.lean` (proof layer, hand-written, ~320 LoC) is
concatenated after `port/08_RankTraceMult.lean` to form `port/09_MasterIdentity.lean`
(generator + `cat`; layer is the maintained source). Layer contents: 6 defs (`deltaC`, five
defects), 6 nonneg lemmas, S1 `frob_split_rearrangement` (donor `hstep4` :326 → equality),
S2 `pairing_split` (`hstep5'` :334 + `sq_sub_ge_gc` :81), S2' `schurJensenSplit`
(`sum_gc_eigenvalues_ge` :270, definitional), S3 `pairBlock_split` (`hstep6` :339 at
b := posIndex via new `sum_posPart_restrict` filter lemma), `frobSq_add_eq` (`hexpand` :314
promoted), **MAIN `master_identity`** (replaces the `linarith` at `RankTraceMult.lean:346`),
and the **ACCEPTANCE TEST `rank_trace_mult_k_of_master`** — the donor statement
(`RankTraceMult.lean:369`) re-derived from `master_identity` by dropping the five defects.

**Axiom audit (final run):** `CrossMath.RankTraceDefect.master_identity` and
`CrossMath.RankTraceDefect.rank_trace_mult_k_of_master` → `[propext, Classical.choice,
Quot.sound]` — no `sorryAx`, no project axioms. All eight audited ported theorems likewise
clean. k_c numeric table (TightMult) stayed out of the gate as planned.

**Fix cycles: 6 (22 → 10 → 5 → 2 → 1 → 0 errors).** Every failure was pilot-side authoring,
none touched donor content or the mathematical statements:
1. 22→: application-precedence (`deltaC c (eig₀ k) (eig₀ k)` parens; recurred in the layer
   after being fixed at milestone (a) — noted as a lint-to-add: a grep gate for
   `<ident> .*eigenvalues₀ k` unparenthesized).
2. defeq/unfold of defect defs in the `_nonneg` lemmas (`unfold` before `exact`/`linarith`);
   `schurJensenDefect_nonneg` restated Pmat-specific (donor `sum_gc_eigenvalues_ge` is
   Pmat-shaped).
3. `Finset.sum_filter_of_ne` has the CONVERSE signature in v4.36 (h : f x ≠ 0 → p x);
   `sub_sq` orientation (→ `by ring`); `id`-form beta-mismatch (→ defeq `have := …` bridge).
4. **rw-motive failures under proof-dependence:** promoting `hexpand`/`htrQ` with
   `hermPosPart hQ` in the statement makes `rw [Q = Qp − Qm]` ill-motived (the `IsHermitian`
   proof `hQ` occurs in `hermPosPart hQ`); fixed by restating `frobSq_add_eq` with explicit
   `Qp Qm` + PSD-proof binders (donor's own local shape) and proving `htrQ` by `rw`-at-hyp +
   `ring`.
5. **linarith nonlinearity:** monomials `2 * c * X`, `c * rtrace`, `c ^ 2 * ↑π` cannot be
   scaled by a variable coefficient — fixed by pre-proving the scaled bridges
   (`htrQ`, `hsplit2`, `hctrP`, `hc2` via `rw`+`ring` / `mul_le_mul_of_nonneg_left`) and
   handing those to `linarith`. This is THE reusable lesson for dossier 01's future
   consumers (A2/A3 corollaries will hit the same pattern).
6. final `ring` left over after the `rw` chain closed `hsum` (removed).

**Runs:** 7 Modal runs (`/tmp/pilot01c-run{1..7}.log`; run 2 used a transient full-output copy
of lean_probe.py staged in /tmp — `lean_probe_full.py`, 400-line head, since R9's 60-line head
hid the middle errors; probe copy deleted-pending, never a project artifact). Modal cost:
~2.5–3 min per warm run.

**Total pilot wall-clock (b)+(c):** ≈ 45 min end-to-end (19:02–19:47 local), ≈ 25 min Modal
machine-time across 9 runs — far under the 2–3 h + cycles budgeted in §3(b)/(c).

**Findings for triage:** (i) the port is *cheaper than the dossier's M estimate* — statement
AND proof port of the whole 1,731-LoC bundle was zero-churn; the effort driver was entirely the
new layer (≈ 320 LoC / 6 cycles); (ii) dossier 01's Theorem A is now formally proved
(kernel-only, axiom-clean) with the donor's own `rank_trace_mult_k` re-derived as the
regression anchor — candidate 01's feasibility question is settled at the strongest possible
level short of upstreaming; (iii) lemmas `sum_posPart_restrict` and the scaled-bridge pattern
are the layer's reusable additions beyond the dossier text.

---

## §6d Milestone (d) run log — the tightness companion (executed 2026-11-09, lane R6)

**Status: GREEN — `port/10_TightMult.lean` (2,238 LoC) compiles with 0 errors, 0 sorry;
`tightness_of_master` axiom-clean.** Contents: full port bundle (01–08) + master-identity
layer (09) + donor `TightMult.lean` verbatim (incl. `lemmaR_tight`, its first port) +
`tightness_of_master`: on the TightMult extremal configuration (integer multiplicities
`m_j ≤ c` on orthonormal atoms + `b` pair-blocks `Q = c·Π`), **all five defects of the master
identity vanish simultaneously** — completing the structural pair of dossier 01 (exact
identity + exact per-defect tightness; the R8-surviving novelty core).

Axiom audit: `CrossMath.RankTraceDefect.tightness_of_master`,
`CrossMath.RankTraceDefect.master_identity`,
`CrossMath.RankTraceDefect.rank_trace_mult_k_of_master`,
`Zeta23.ZeroSide.TightMult.lemmaR_tight` → all `[propext, Classical.choice, Quot.sound]`.

**Honest cycle accounting: 5 Modal runs against a ≤2-cycle budget** (`/tmp/pilot01d-run{1..5}.log`),
total wall ≈ 55 min (inside the ≤1 h cap). No mathematical failure occurred at any point —
every cycle was mechanical bookkeeping: (1) `set`-aliasing broke linarith atom identity with
the donor statement (fixed by using raw configuration terms); (2) `positivity` needed the
donor's own `unfold mR` idiom; (3) v4.36 `open RankTraceMult` under the nested namespace
required full qualification `open Zeta23.ZeroSide.RankTraceMult`; (4) hD's statement needed
the *unfolded* coupling atom (`2 * RCLike.re (P ⋯).trace`) to match `hmid`; (5) an
edit-the-artifact-not-the-source regression (the generator overwrote a sed fix) + short
`#print axioms` names outside the namespace. The proof assembled correctly on the first
structurally-correct build (run 5). Lesson recorded for the repo lint list: never edit
generated concatenations; edit the layer sources.

## §7 Final status

**Pilot 01 CLOSED — outcome: structural pair PROVED** (`master_identity` + five-defect
exact tightness on the extremal configuration + donor `rank_trace_mult_k` re-derived as
faithfulness anchor; all axiom-clean, kernel-only, v4.36.0-rc2 @ ff2494ea). Artifacts:
`research/pilots/01/{make_port.py, master_layer.lean, tightness_layer.lean,
port/01..10}`, this blueprint (§6–§6d logs), dossiers 01/02 re-scoped per R8 round-2.
Post-pilot re-scoring lives in `research/candidates/01-…md` (Pilot outcome) and
`research/candidates/02-…md` (Re-scope final).
