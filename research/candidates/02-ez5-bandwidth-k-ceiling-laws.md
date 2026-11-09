# Candidate dossier 02 — ez5-bandwidth-k-ceiling-laws

Lane R6, 2026-11-09. Realizes empty zone EZ5 of `research/bridges/linear-algebra.md` §4.
Tags: [VERIFIED] / [HYPOTHESIS] as before. **Honesty note up front:** the strict comparison
`B₂ > B₁?` is genuinely open and is NOT part of the provable core; the provable core of this
dossier is (i) the bandwidth-2 stability law, (ii) the class-inclusion monotonicity of `B_k`,
(iii) the convex-program representation (computability) of `B_k` for fixed grid — with `B₂ vs
B₁` carried as impact framing and as the explicit open sub-question Q2.

---

## Name

ez5-bandwidth-k-ceiling-laws

## One-line pitch

zeta23's bandwidth-one pair-correlation ceiling (certificates cap at 0.6818287…,
`ceiling_law256`) is generalized to a hierarchy of bandwidth-k certificates with (a) a
second-order stability calculus for bandwidth 2 (the new analysis), (b) monotone ceiling
constants `B_k` defined as suprema of certified values, and (c) `B_k` computable as a finite
convex program over the near-CUE admissible polytope — the first formal barrier theory for
*how much spectral data a zero-density certificate is allowed to consume*.

## Precise mathematical statement

**Setting [VERIFIED].** Grid `{j/N : 1 ≤ j ≤ N}`; a *one-point datum* is a weight sequence
`s : ℕ → ℝ` with `s j` the atom mass at `j/N` (zeta23 `Zeta23/PairCeiling/Defs.lean:27–36`:
`Csum`, `Cstep`, `Dfun := Cstep − x²/2`, `Efun := ∫₀ˣ D`). A *bandwidth-one certificate* is a
pair `(c₀, r)`, `r ∈ C¹[0,1]` with `r′ = g` continuous, `g` differentiable off a countable set
with integrable derivative `h` (`Ceiling.lean:28` hypotheses). *Validity* at `(s, p₁)`:
`c₀ + Σ_{j=1}^N s j · r(j/N) ≤ p₁`; *value*: `v(c₀,r) := c₀ + ∫₀¹ r(x)·x dx`
(`Zeta23/PairCeiling/Ceiling.lean:28–34`). Near-CUE admissibility [VERIFIED,
`NearCUE.lean:34`]: `NearCUE S N τ := ∀ j, 1 ≤ j < N → |N·S j − j| ≤ τ`.

**New definitions [HYPOTHESIS].**

- **Bandwidth-2 data:** a pair `(s, s₂)` where `s₂ : ℕ → ℝ` assigns to each grid point `j/N`
  the *pair mass* `S₂(j)/N²` — the density (normalized so `Σ_j s₂ j = 1`) of pairs at
  separation `j/N`, for a configuration with form-factor rows `S` (one-point) and `S₂`
  (two-point diagonal of the pair kernel). Model datum: `s*  j := j/N²` (the exact
  sine-process row underlying `NearCUE.lean`'s `T_m`, `U_m` identities
  `N·T_m = m(m+1)/2`, `N·U_m = (m³−m)/6` [VERIFIED NearCUE.lean:38–60]).
- **Bandwidth-2 discrepancy:** `D₂(j) := C₂(j) − x²/2` where `C₂(x) := Σ_{j/N ≤ x} s₂ j`
  (same shape as `Dfun`, Defs.lean:33), `E₂(x) := ∫₀ˣ D₂`.
- **Bandwidth-2 certificate:** a triple `(c₀, r₁, r₂)` with `r₁` as above and
  `r₂ ∈ C¹[0,1]` (same regularity). *Validity* at `((s, s₂), p₁)`:
  `c₀ + Σ_j s j·r₁(j/N) + Σ_j s₂ j·r₂(j/N) ≤ p₁`. *Value*:
  `v₂ := c₀ + ∫₀¹ r₁·x dx + ∫₀¹ r₂·x dx`.
- **Admissible k-data set** `𝒟_k(N, τ)`: the set of k-point data of *some* configuration
  whose rows lie in the near-CUE enclosure family (k=1: exactly the `S` with
  `EnclOK K S 0 encl` as in `ceiling_law256`, CeilingLaw256.lean:38 [VERIFIED]; k=2: same
  one-point condition plus the pair-row enclosure `|N·S₂(j) − j| ≤ τ₂` — **hypothesis-shaped**,
  see Q3).
- **Ceiling constants:**
  `B_k(N, τ) := sup { v(cert) : cert a bandwidth-k certificate valid at every datum in 𝒟_k(N,τ) }`
  (sup over an infinite-dimensional certificate class, a finite number by the stability law).

**Theorem A (bandwidth-2 stability law — the new analysis) [HYPOTHESIS].** For `0 < N`,
any weights `s₂`, and `r₂ ∈ C¹[0,1]` with `r₂′ = g₂` continuous, `g₂` differentiable off a
countable `T` with integrable derivative `h₂`:

```
| Σ_j s₂ j·r₂(j/N) − ∫₀¹ r₂(x)·x dx | ≤ |r₂(1)|·|D₂(1)| + |g₂(1)|·|E₂(1)| + (sup|E₂|)·∫₀¹|h₂|
```

— i.e. the identities (A)/(1)/(2) and bound (B) of `Zeta23/PairCeiling/Stability.lean`
(header identities; `ceiling_stability`, Stability.lean:305) hold *verbatim* with
`(s, D, E) ↦ (s₂, D₂, E₂)`: the proof is the same cellwise FTC + Abel summation
(`integral_cell`, `abel`, Stability.lean), because it uses only that `C₂` is a step function
against the same model CDF `x²/2`.

**Theorem B (near-CUE propagation, pair rows) [HYPOTHESIS].** If
`|N·S₂(j) − j| ≤ τ₂` for `0 < j < N` (pair-row near-CUE), then
`|E₂(x)| ≤ 1/(6N²) + τ₂/(2N)` on `[0,1]` — the exact analogue of the one-point bound
[VERIFIED for k=1, NearCUE.lean main theorem, and `ceiling_nearCUE_signed`,
`Signed.lean:54].

**Theorem C (bandwidth-2 ceiling law) [HYPOTHESIS].** Under the pair-row enclosure
hypothesis of B (the `EnclOK`-style external input, sha256-certified as in zeta23's pattern),
every bandwidth-2 certificate valid at a configuration with simple fraction `p₁` satisfies

```
v₂ ≤ p₁ + d₁|r₁(1)| + d₂|r₂(1)| + (1/(6N²)+τ/2N)(|r₁′(1)| + ∫|r₁″|) + (1/(6N²)+τ₂/2N)(|r₂′(1)| + ∫|r₂″|)
```

with `d₁ = 0.82395317` [VERIFIED k=1 instance: `ceiling_law256`,
CeilingLaw256.lean:38, decimal form :53].

**Theorem D (inclusion monotonicity — provable core) [HYPOTHESIS, routine].**
`B₁(N,τ) ≤ B₂(N,τ,τ₂)` for every `τ₂ > 0`: the injection `(c₀, r₁) ↦ (c₀, r₁, 0)` preserves
validity (the `r₂`-terms vanish) and value. **Direction note (corrects the lane-R6 prompt
`B_{k+1} ≤ B_k`):** under the sup-of-certified-values definition, more bandwidth can only
certify more, so `B_k` is *nondecreasing* in `k`; the barrier content is the *upper* bound of
Theorem C, giving `B₂ ≤ B₁ + ε₂` with `ε₂ := sup over certificates of the two new stability
terms` — the two together pin `B₂ ∈ [B₁, B₁ + ε₂]`. (The prompt's `B_{k+1} ≤ B_k` holds for
the complementary formulation "best upper bound provable about the method" and is the same
theorem after complementation.)

**Theorem E (computability: convex-program representation) [HYPOTHESIS — the deep part].**
For fixed `(N, τ, τ₂)` and certificate class restricted to values on the grid (i.e.
certificates represented by their `N(+1)` grid values, the only values validity and
`∫r·x dx`-type functionals depend on up to the stability error), `B_k(N,τ)` is the value of
the finite linear program

```
maximize  c₀ + ⟨r, μ_CUE⟩   subject to   c₀ + ⟨r, δ⟩ ≤ p₁(δ)  for every extreme datum δ of conv 𝒟_k,
```

and LP weak duality gives `B_k = min over finitely supported convex combinations λ of the
admissible data with barycenter μ_CUE of Σ_λ p₁(weights)` — a finite, `decide`-checkable
quantity in the zeta23 `LawN256/LawN256_check` style [VERIFIED pattern:
`LawN256_check` `decide`-checked row inequalities, survey §1.3].

**Open sub-questions (NOT in the provable core).**
- **Q1:** is `ε₂ > 0`, i.e. does the pair-data stability error allow strictly more certified
  value (does bandwidth 2 help at all)?
- **Q2 (headline):** is `B₂ > B₁` — does *any* bandwidth-2 certificate strictly beat every
  bandwidth-1 certificate? Even the sign is unknown. Both directions are consistent with
  Theorems A–E.
- **Q3:** what pair-row enclosures `τ₂` do actual zero configurations satisfy (the external
  interval-arithmetic input; zeta23's `EnclOK` is k=1-only, sha256-stamped, survey §2(a))?

Lean phrasing: Theorem A is a statement about `ℕ → ℝ`, `ℝ → ℝ` functions and
`intervalIntegral` mirroring `Zeta23.PairCeiling.ceiling_stability` (Stability.lean:305) —
directly formalizable in the zeta23 style; Theorem D is a sup over a Pi-type certificate
space (phrased as `∀ cert, valid → v ≤ B` + `∃ cert sequence attaining`, i.e. `isLUB`).

## Novelty check

- **Corpus side** (direct rg, 2026-11-09; `research/qa/decl-index.tsv` absent):
  - mathlib: `rg -i -c 'pair.?ceiling|ceiling.?law' Mathlib/` → **0**;
    `rg -i -c 'bandwidth' Mathlib/` → **0**; `rg -i -c 'near.?CUE|nearCUE' Mathlib/` → **0**.
  - tauceti: same three patterns over `TauCeti/` (lean) → **0 / 0 / 0**;
    `rg -i -c 'one.?level density|pair correlation|explicit formula' TauCeti/` → 3 hits, all
    false positives (knot-theory PD codes, symmetric polynomials, Hochschild cohomology).
  - openai-math: `pair.?ceiling|ceiling.?law` → 1 hit, false positive
    (`lean/OAI/Computability/MeanPayoff/Tightening.lean:196` `supersolution_lower_ceiling`,
    payoff games); `bandwidth` → 143 hits — all graph/circuit bandwidth senses
    (spot-checked `lean/OAI/` samples); `nearCUE` → **0**.
  - anthropics: `pair.?ceiling|ceiling.?law` → 65 hits, all but the umbrella import file
    `Zeta23.lean` inside zeta23's own `Zeta23/PairCeiling/` (the k=1 source; nothing at k ≥ 2 —
    the directory contains exactly `Defs, Stability, Ceiling, NearCUE, Signed, Bridge, RowCert,
    NumericCert, Grid, LawN256, CeilingLaw256` [VERIFIED listing], all bandwidth-one: "the
    bandwidth-1 pair-correlation CEILING theorem" per Defs.lean:7 header); `bandwidth` in
    anthropics → 11 hits, all "bandwidth-one"/"bandwidth-1" self-references in PairCeiling
    headers. [erratum 2026-11-09, H/QA: v1 said 86 hits "all inside PairCeiling" / 15 bandwidth
    hits; recounted 65 (one external file, the umbrella `Zeta23.lean`) / 11. Conclusion
    unchanged.] **No corpus contains
    a bandwidth-2 or bandwidth-k certificate, a `B_k` constant, or a ceiling hierarchy.**
- **Literature side: PENDING lane R8 round-2.** Queries R8 should run:
  1. arXiv: `"pair correlation" AND ("barrier" OR "ceiling" OR "limitation") AND zeta`;
     `"one-level density" AND "support" AND "barrier"` (Iwaniec–Sarnak-type support
     restrictions `φ̂` supported in `[−2,2]` are the classical *analogue* of bandwidth limits —
     the nearest known phenomenon; must be checked as nearest miss);
  2. Google Scholar: Hughes–Miller, "Low-lying zeros of L-functions with orthogonal symmetry"
     (2007) — coupled densities = the bandwidth-2-like move in the one-level world [citation
     corrected 2026-11-09 per R8 `novelty/round-2.md` §2: v1's "Hughes Miller 'zeros of
     L-functions coupled' (2008)" was garbled; no such 2008 title exists];
     `Farmer Gonek "hypotheses"`; `Conrey "pair correlation" method bounds`;
  3. Citations *to* Alpöge–Furman arXiv:2608.13637 (source of the k=1 ceiling,
     `ceiling_law256`); does any follow-up define higher bandwidths?
  4. zbMATH: `11M26 AND "pair correlation" AND "test function"`; `15Axx`-crossed
     "majorization" "moment problem" ceiling — for Theorem E's LP representation novelty.
- **Known nearest misses:** (a) zeta23 `ceiling_stability`/`ceiling_law256` — k=1 only, and its
  stability calculus is *one-variable*; Theorem A is the two-datum extension (new); (b) the
  one-level-density support barrier (Iwaniec–Sarnak 1999; Hughes–Miller 2007) — a bandwidth
  phenomenon for a *different* statistic (density vs pair correlation), never given a
  `B_k`-style computable ceiling; (c) tauceti's majorization/LP-adjacent layer
  (`Analysis/Convex/Majorization.lean`, `DoublyStochasticMatrix.lean`, `PermutationOrbit.lean`)
  — the machinery for Theorem E exists there, never applied to zero-density certificates.

## Bridge analysis

- **Corpora bridged:** anthropics/zeta23 (k=1 stability calculus, near-CUE rows, ceiling
  statement forms) × tauceti (convex/majorization layer for Theorem E; Schur–Horn
  doubly-stochastic extremality) × mathlib (interval-integral calculus substrate,
  `MeasureTheory.Integral.IntervalIntegral.*`, the very imports of Stability.lean).
- **Why essential:** zeta23 alone cannot define `B₂` meaningfully — it has no convex-duality
  layer to express "sup over certificates = min over convex combinations of data" (Theorem E);
  that layer is tauceti's (`IsWeaklyMajorizedBy` transfer descent, `Majorization.lean:30`;
  permutation-orbit convex hulls, `PermutationOrbit.lean`). Conversely tauceti has no
  certificate/stability calculus at all. Theorem A alone would be zeta23-internal — which is
  exactly why its novelty rests on the *combination* (A + D + E form one theory of method
  barriers). mathlib provides the FTC/Abel substrate (`FundThmCalculus`,
  `IntegrationByParts` — Stability.lean's own imports [VERIFIED]).
- **Empty-zone fit:** `research/bridges/linear-algebra.md` §4 EZ5 (and §2 L5); negative finding
  "no RMT content anywhere else" from §3 Q4 motivates why zeta23 must be the analytic source.

## Proof-strategy sketch

1. **Theorem A (routine adaptation):** re-run `Zeta23/PairCeiling/Stability.lean` with
   `Csum/Cstep/Dfun/Efun` (Defs.lean:27–36) re-instantiated at `s₂`. The file's three
   identities are proved from: cellwise FTC (`integral_cell`), Abel summation (`abel`),
   integration by parts (`intervalIntegral.integral_eq_sub_of_hasDerivAt`) — none uses the
   one-point origin of `s`, only that `Cstep` is a step function with jumps at the grid against
   the model CDF `x²/2`. ~300 LoC, mechanical.
2. **Theorem B (medium, the analytic core):** propagate pair-row near-CUE enclosures to `E₂`
   bounds: re-run `NearCUE.lean`'s exact cell computation (`N³·E(x) = (−m + 3mθ(1−θ) − θ³)/6 +
   perturbation ≤ m(m+1)τ₂/2`) — the polynomial identities `N·T_m = m(m+1)/2`,
   `N·U_m = (m³−m)/6` [VERIFIED :38–60] are separation-independent and carry over. New input:
   the `τ₂` enclosure itself (Q3 — external, enters as hypothesis like `EnclOK`).
3. **Theorem C (assembly):** combine A + B exactly as `ceiling_of_valid_at` (Ceiling.lean:28)
   combines stability + near-CUE; constants in the `ceiling_numeric` (Ceiling.lean:44) style.
4. **Theorem D (routine):** explicit injection of certificate classes; validity preserved
   because `r₂ = 0` kills the pair terms.
5. **Theorem E (the genuinely new idea):** (i) discretize: validity and value depend on `r`
   only through its grid values + the three stability functionals — so optimize over
   `ℝ^(N+1) × ℝ³` (quotient by the kernel); (ii) the constraint set is a projection of
   `conv 𝒟_k` — for k=1 the near-CUE row constraints are coordinate boxes intersected with the
   mass constraint, so `conv 𝒟₁` is a polytope with computable vertices (the `LawN256`-style
   grid); (iii) LP weak duality (separating hyperplane suffices — mathlib
   `Analysis/Convex/Separation.lean` + tauceti `Convex/Separation.lean`; note mathlib has no
   LP strong-duality theorem [VERIFIED: `rg -i 'farkas|strong duality|linear program' Mathlib/`
   → only linarith's simplex oracle and cone duality files] — weak duality is enough for an
   *upper* bound = ceiling, and lower bounds come from exhibiting certificates). Medium-hard.
6. **Sanity anchors:** at `r₂ = 0`, N = 256, Theorem C must numerically re-derive
   `ceiling_law256_decimal` (CeilingLaw256.lean:53) — the regression test.

## Feasibility

- **F0.** Target: Theorems A, B (conditional on the `τ₂` enclosure hypothesis), C, D, E
  (weak-duality form) in `CrossMath.PairCeiling2`.
- **F1. Mathlib entry points:** `MeasureTheory.Integral.IntervalIntegral.FundThmCalculus` /
  `IntegrationByParts` / `SpecialFunctions.Integrals.Basic` (Stability.lean's own imports
  [VERIFIED]); `Analysis.Convex.Separation`, `Analysis.Convex.ConvexHull`,
  `Analysis.Convex.ExtremePoints` (for E); `Finset`/`decide` infrastructure (for the numeric
  instance, `LawN256_check` pattern).
- **F2. Donor lemmas (zeta23):** `Zeta23/PairCeiling/` wholesale — `Defs.lean` (93 LoC),
  `Stability.lean` (~330 LoC: `integral_cell`, `integral_gC_eq_sum`, `abel`,
  `ceiling_stability` :305), `Ceiling.lean` (69 LoC), `NearCUE.lean` (~200 LoC), `Signed.lean`,
  `CeilingLaw256.lean` + `LawN256.lean` (the `decide`-checked row law). Port surface narrow
  (analysis-of-one-variable; no matrix API). tauceti (proof models, re-derive): transfer
  descent `Majorization.lean`, `DoublyStochasticMatrix.lean` averaging lemmas,
  `PermutationOrbit.lean` hull structure.
- **F3. Missing glue:** (a) definitional: `s₂/D₂/E₂` + bandwidth-2 certificate type (S,
  ~100 LoC); (b) genuinely new mathematics: Theorem E's discretization-quotient argument
  (certificates ≅ grid values + stability functionals) — the load-bearing new idea, est.
  500–800 LoC with real proof risk; Theorem B's cell computation is medium (~200 LoC,
  mirrors existing NearCUE cellwise lemmas); (c) porting debt: ~700 LoC of PairCeiling files
  v4.33→v4.36 (R9 `research/feasibility/port-probe.md` **pending**); (d) **external-input
  risk**: the `τ₂` pair-row enclosures (Q3) do not exist even externally — Theorems B/C are
  conditional on a hypothesis in the `EnclOK` style; this is kernel-clean (hypothesis, not
  computation) but means C is not unconditional until Q3 is discharged outside Lean.
- **F4. Effort: M for the provable core** (A + D + E-weak + C-conditional: ~2.5k LoC);
  **L for the full programme** (unconditional C requires the external `τ₂` enclosures — out of
  Lean scope; plus Q1/Q2 are research-level mathematics, possibly open long).
- **F5. Risks:** (i) Theorem E discretization: if certificate value depends on more than grid
  values + the three stability functionals, the LP reduction fails — mitigation: the stability
  bound exactly controls the continuum-vs-grid gap (that is its role in `ceiling_numeric`);
  (ii) `conv 𝒟₂` vertex structure may be intractable for N = 256 — mitigation: work at the
  constraint level (validity at all *box vertices*), as `LawN256_check` already does for rows;
  (iii) churn: zeta23 PairCeiling imports are stable analysis files (low risk per R9 §1 #6);
  (iv) `decide`-scale numeric verification at N = 256 with two kernels may exceed kernel
  limits — mitigation: verify rows by reflection-free `NormNum` calls per row, or state at
  smaller N first (the theory is N-parametric).
- **F6.** Kernel-only; milestones: (1) port `Defs/Stability` and re-prove
  `ceiling_stability` (anchor); (2) Theorem A; (3) Theorem D; (4) Theorem E at small N
  (e.g. N = 8, fully `decide`-able); (5) Theorem B/C conditional. Modal build per
  math-proof1; cross-ref R3 assembly map C (`research/feasibility/mathlib-assembly-maps.md`,
  **not yet present — expected location**) for import ordering of the ported PairCeiling layer.

## Significance

The bandwidth-one ceiling 0.6818287… is the *proved optimality barrier* of the entire
Alpöge–Furman method (survey §1.3) — knowing whether pair data escapes it (Q2) determines
whether that method can ever reach beyond ~0.682 toward the Riemann-hypothesis-conditional
expectations. Theorems A–E create the first *general theory of method barriers* for spectral
zero-density arguments: a computable `B_k` ladder. This also gives the project its cleanest
"barrier ⟺ convex program" bridge (zeta23's analytic ceiling + tauceti's convexity layer),
and the k→∞ behavior (Q1/Q2) is a genuinely new mathematical question even classically
(nearest kin: one-level-density support barriers, which are not computable ceilings).

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

**Lane proposal (R6, non-binding):** Novelty 5 (no ceiling hierarchy anywhere; R8 to confirm
vs one-level-density literature), Significance 4 (method-barrier theory with a headline open
constant), Effort 4 (M core / L full) → proposed rank ≈ 5.0 (core) — note for triage: score
against the *provable core* A+D+E, with Q2 as upside, not as deliverable.

## F4 grade by lane R9

2026-11-09, round 3. Evidence: Modal port-probe runs 1–4 (`research/feasibility/port-probe.md`);
PairCeiling itself was NOT probe-extracted — grading below states that basis explicitly.

- **Grade: M (provable core) / L (full programme) — confirmed, but on weaker direct evidence
  than dossiers 01/03.** No PairCeiling statement was elaborated in Modal this round; the
  analogous zeta23 probes that DID run (LinAlg algebraic, eth TM, 3sum core, plus openai-math
  defs) all elaborated with 0 errors, which weakly suggests v4.33→v4.36 statement drift is
  near-zero corpus-wide — but the one plausible drift zone for THIS dossier is the
  `MeasureTheory.Integral.IntervalIntegral.*` surface (F1's own entry points), which is exactly
  the mathlib area with historical namespace churn and the only one unprobed.
- **Recommendation**: before committing, spend one warm Modal run (~70 s pipeline, cost model
  in port-probe.md §1) elaborating `ceiling_stability`'s statement + `Defs.lean`'s four defs —
  that closes the evidence gap for the ~330-LoC Stability port anchor (milestone 1).
- **F1 corrections**: none possible/needed this round (cited decls are standard analysis;
  unverified in Modal — flagged above). Porting-cost delta vs F3(c): the ~700 LoC PairCeiling
  port is now presumed statement-clean by analogy, pending the one-run check; proof-side
  effort unchanged.
- Verdict for triage: keep M/L split as written; add the one-run PairCeiling probe as a
  pre-condition of the M grade.

---

## Re-scope (final) (append, lane R6, 2026-11-09 evening — incorporates R8 VERDICTS row 02, round-3 §T(b), and the 21-absorption)

**Framing correction (mandatory).** The original pitch's "first formal barrier theory for
zero-density certificates" is **dropped**: Knausgård's `Ceilings/` (paper Props 7.2–7.3, repo
`kristianmk/839`, building on zeta23 itself via `upstream_relax.patch`) already formalizes a
*parameterized monotone ceiling ladder* — certificate classes `PairCert s x₁ x₂ b` (17/20-
separated labelled configurations, index-distance pair energy) with `ceiling_range6 <
83916/100000`, `ceiling_range8 < 83943/100000`, `ceiling_range10 < 83957/100000`,
`ceiling_all < 83998/100000` and line-family `ceiling_line_range7 < 67357/100000`,
`ceiling_line_all < 67383/100000` — his constants sit within ~1.5×10⁻⁴ of his class ceilings.
The *program shape* of this dossier (certificate classes indexed by a data parameter + monotone
computable ceilings + near-attainment) is anticipated; the **"first"** claim is dead. Novelty
5 → **3.5**.

**Surviving core (what this dossier now proposes, in order):**
1. **LP weak duality IN LEAN for the ceiling program** — the unclaimed layer. mathlib has no LP
   strong/weak duality (cone-duality infrastructure only, `Analysis/Convex/Cone/*`, flagged as
   TODO by R8); the nearest formal neighbor, Yamashita 2026-06 (Lean 4 HSD interior-point for
   LP; R8 `research/novelty/RELATED-WORK.md`), is an algorithm, not a duality theorem, and is
   not reusable for our statement. Knausgård's `law_lp.py` is a **Python precedent only** (an
   LP solver reconstructing AF's unpublished period-256 law — cite as motivation, not
   competition). Deliverable: `B_k(N,τ) ≤ LP-dual value` as a Lean theorem (weak duality
   suffices for a ceiling; separation-hyperplane route over mathlib's `Convex/Separation`).
2. **The B₂ pair-mass bandwidth axis** — definitionally incomparable to Knausgård's
   index-distance `s`-ladder: his parameter constrains *which pairs* (index distance ≥ s) of a
   labelled configuration; ours constrains *how much k-point form-factor data* the certificate
   consumes (pair masses at grid separations). The **dictionary theorem** (his axis ↔ our axis;
   when does an s-class simulate a bandwidth-k class and vice versa) is theorem-sized work and
   a genuine contribution neither side has.
3. **Absorbed case study (dossier 21, demoted per R8 verdict row 21: novelty 4 → 1.5):**
   R5's `research/pilots/21-milestoneC.md` — the certified quartic-transplant computation
   (exact rational moments of `cFun`/`J(v)` for `vQuartic`, sanity anchors, rational interval
   certificates) and its §7.6 **class-identification question** (certificate ⇒ window
   domination; the sup over the broader class not asserted equal to 2 − 1/c₁*), which R5
   partially answered. Milestone C's data becomes 02's first worked instance on the
   zeta23-internal `(c₀, r)` certificate class (sup over zeta23's own class only, per R8's
   surviving-kernel note). B₂-strictness (old sub-question Q2) stays open-impact framing.

**Bridge essentiality (unchanged in substance):** zeta23's stability calculus + R5's certified
quartic data ↔ mathlib `Convex/Separation` + majorization layer (tauceti) — with Knausgård now
explicitly a *donor* (his formalized ceilings are the counterpart class for the dictionary, and
his patch demonstrates the window-relaxation glue) rather than only a competitor.

**Lane proposal (updated, supersedes the original):** Novelty 3.5 (LP-in-Lean layer +
pair-mass axis + dictionary; ladder framing removed), Significance 4 (method-barrier tooling
with an absorbed worked instance), Effort 4 (LP-duality layer is the missing-glue driver;
stability law and inclusion remain as before) → **proposed rank = 3.5 × 4 ÷ 4 = 3.5**.
Condition for triage: pilot only if the LP weak-duality layer (item 1) is scoped first — it is
the rate-limiter and the unclaimed ground.
