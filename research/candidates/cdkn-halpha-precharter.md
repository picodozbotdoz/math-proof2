# CD(K,N)→H_α DICTIONARY BRIDGE — PRE-CHARTER (iter-7 Tier-1 seed 2)

*Lane R6 (worktree agent-06), 2026-11-21, iteration-7 day-1 per D2′(e) (the census v4
`novelty/iter7-seed-census-DRAFT.md` `18a904d4` = the bench of record; row 2).
Discovery-PREP + GO/NO-GO; the ONE Modal probe consumed by this unit is the
statement-tier checkpoint below (probe class, never a fire). Basis: the tauceti
sibling tree read at `TauCeti/MeasureTheory/OptimalTransport/Wasserstein/RenyiEntropy.lean`
(read-only; 604 lines) + R9's round-2 verification
(`novelty/r9-novelty-verification-iter6-round2.md` §1 row 72 + §2 seed-2 + §4)
+ the iter-7 charter `RESEARCH.md` §Iteration 7.*

## 0. Scope discipline — the one claimable surface

Round-2's binding finding: tauceti's `TauCeti.renyiEntropy` (`RenyiEntropy.lean:120`,
def `(N : ℝ) (m μ : Measure X) : EReal`, the Sturm/CD(K,N) convention
S_N(μ|m) = −∫ ρ^{1−1/N} dm) and the distribution/quantum H_α side are **unconnected
object classes** (measures with an N-parameter vs distributions/quantum states); the
absence claim ("no distribution/state Rényi-α entropy in mathlib/AFP/Coq; mathlib has
only `Real.binEntropy`/`Real.qaryEntropy` + topological entropy") survived, with
tauceti's file the nearest FORMAL kin (a different object class). **The bridge
statement — the counting-measure dictionary that makes the classical distribution
facts finite instances of the CD(K,N) theorems — is stated nowhere** (round-2 §2
seed-2; re-confirmed at the 2026-11-21 decl-index-v3 state, semantic + BM25 + exact-id).
This seed must therefore differentiate from BOTH sides: no claim on tauceti's layer
(it stays measure-side, cited as kin + consumed as substrate) and none on N1's
distribution/quantum monotonicity layer (article-72's scoped line). The dictionary is
the only claimable surface, and the census grades it MEDIUM / DISCOVERY-CONDITIONAL:
the math is transport-level, and R2's S1–S4 decides discovery vs glue at article time.

## 1. The statement family (hypothesis-binder pattern at the measure boundary)

Object side (new, in-repo): a probability vector `p : Fin n → ℝ≥0∞` with `∑ pᵢ = 1`,
the measure `pmeas p = ∑ i, pᵢ • δᵢ` on `Fin n`, the reference `Measure.count`, and
the classical object `Halpha p N = N · log (∑ pᵢ^{1−1/N})` (the Rényi H_α at
α = 1 − 1/N ∈ (0,1) ⇔ N ∈ (1,∞); H_α = N log Σpᵅ exactly).

| # | statement (all PROVED-UNCONDITIONAL targets at pilot time — both sides are proved objects; no mathematical binders) | shape |
|---|---|---|
| **T1** | **The dictionary equation.** (a) the density plumbing: `pmeas p = withDensity count p` and `(pmeas p).rnDeriv count i = pᵢ`; (b) the equation: `TauCeti.renyiEntropy N count (pmeas p) = −((∑ i, pᵢ ^ (1 − N⁻¹) : ℝ≥0∞) : EReal)` for N > 1 — i.e. **−S_N = the α-power-sum**: the measure-side object IS the classical power sum at the counting instance. | `withDensity`/`rnDeriv` lemma + the lintegral-over-count = finset-sum computation (tauceti's public `renyiEntropy_eq_neg_lintegral_rpow` `:167`, N > 1 [SigmaFinite μ], consumed as the unfolded form) |
| **T2** | **The monotonicity transport.** N ≤ N′ ⇒ S_N(count, pmeas p) ≤ S_{N′}(count, pmeas p), and consequently **H_α is antitone in α ∈ (0,1)** — the classical distribution monotonicity RECOVERED as the counting instance of the CD(K,N) N-monotonicity. | the discrete proof is elementary and self-contained (each pᵢ ∈ [0,1] ⇒ t ↦ pᵢᵗ antitone ⇒ Σpᵅ antitone; mathlib `Real.rpow` antitone-of-base-le-one). NOTE: tauceti's own N-monotonicity is PRIVATE (`renyiGap` :333 + `renyiGap_le_renyiGap` :336 + the in-proof `have` block :402–409) — the bridge re-proves the discrete instance rather than promoting private API (tauceti is read-only) |
| **T3** | **The Boltzmann→Shannon limit.** tauceti's public `tendsto_mul_renyiEntropy_add_measureReal_univ_nhds_boltzmannEntropy` (:489) instantiated at (count, pmeas p): every hypothesis resolves finitely (A = univ; m A = card n ≠ ∞; `IsFiniteMeasure`; `HaveLebesgueDecomposition` via σ-finiteness of count on Fin n) ⇒ `N·(S_N + 1) → Ent_count(pmeas p) = ∑ pᵢ log pᵢ`; corollary via T1's equation: **H_α → H_1 (Shannon) as α → 1⁺** — the finite-support α→1 limit AS the finite instance of the Sturm Boltzmann limit. | instance-resolution + the log-vs-linear limit transport (`N log(Σpᵅ)` vs `N(1 − Σpᵅ)` agree in the limit; one `Tendsto` lemma) |
| **T4 (extension, NOT day-1)** | the α > 1 branch (N < 0): the dictionary formally extends but tauceti's API gates on N > 0 (`renyiEntropy_nonpos` :188, `ne_bot` :298) — the negative-N integrand behavior is unstudied there. BANKED as the pilot's stretch arm, never a blocker. | open |

The hypothesis-binder pattern applies at the MEASURE boundary in the probe only
(the ProbeE precedent): the pilot itself imports `TauCeti.…RenyiEntropy` directly
(same toolchain, the cheapest consumption class per the feasibility summary).

## 2. Substrate audit (what tauceti gives, what is missing, the checkpoint probe)

**Gives (public API, 18 theorems + 2 defs, all at the project's toolchain family):**
`renyiEntropy` :120 + `_def` :124; three unfolded forms (:154 for N > 0, **:167 the
rpow form for N > 1 [SigmaFinite μ] — T1's consumption**, :181 Sturm's form under
`μ ≪ m`); `nonpos` :188, `ne_top` :193, `eq_bot_iff` :197, `zero_measure` :203,
**`withDensity` :209 (S_N of a with-density measure — T1(a)'s direct consumer)**,
`of_mutuallySingular` :217, support bounds :238/:288, finiteness `ne_bot` :298,
`smul_restrict` :304, `cond_ne_bot` :319; **the Boltzmann limit :489** (T3's engine);
the distorted layer :554/:560/:567/:580/:595 (`distortedRenyiEntropy_anti` :567 — a
DISTORTION-coefficient antitone statement, NOT the N-monotonicity; kin only).

**Missing (the bridge must build):**
1. any counting/discrete instance (none anywhere in the file — the API is
   measure-theoretic throughout; confirmed by read + the round-2 sweep);
2. a PUBLIC N-monotonicity theorem — `renyiGap` :333 and `renyiGap_le_renyiGap` :336
   are `private`, the monotone-Φ chain :402–409 is in-proof inside the Boltzmann
   argument (the census's ":402ff" pointer is this block) ⇒ T2 re-proves the discrete
   instance in-repo (elementary; see §1) — tauceti stays untouched (read-only);
3. the α-entropy-of-distributions OBJECT (H_α) — absent corpus-wide (round-2's
   scoped finding; mathlib: binEntropy/qaryEntropy only) — the bridge defines it
   in-repo (`Halpha` above) as the dictionary's classical endpoint;
4. the EReal↔ℝ≥0∞↔ℝ coercion layer for the discrete statements (EReal-coercion
   lemmas family — mechanical, enumerated by the probe);
5. the `.real`/`measureReal` surface: tauceti's `:489` uses `μ.real univ` (its
   InternalEnergy file's API) where mathlib at pin carries the `measureReal` family
   (KullbackLeibler) — the pilot resolves the exact surface at the import (one
   definition-level alignment, the :489 statement consumed verbatim otherwise);
6. name-level TauCeti-import elaboration — NOT yet exercised (see the probe's
   non-goals); the class evidence is the feasibility summary's "tauceti → direct
   dependency (same toolchain)" (probes D/E/F).

**The statement-tier checkpoint probe — GREEN (4-run descent, 9→2→2→0 errors):**
`research/feasibility/probe/ProbeCDKN_Halpha.lean` elaborating on mathlib alone
(`import Mathlib`, pin `ff2494ea`/v4.36.0-rc2) the Sexp MIRROR (tauceti :167's
unfolded form quoted verbatim), the dictionary objects (`pmeas`, `Halpha`), and all
five bridge statement shapes (P1/P1′ density plumbing, P2 = T1(b), P3 = T2, P4 = T3
as a hypothesis-binder application, P5 the H_α-correspondence arithmetic). Verdict:
**OK rc=0** — every shape typechecks; the three fix classes were pure
namespace/notation surface (`open scoped ENNReal`, `open Filter`,
`open scoped Topology`, `Measure.univ`→`Set.univ`) — recorded for the pilot's file
header. Log of record (the 4 runs + URLs + telemetry):
`research/feasibility/probe/logs-g/probe-cdkn-halpha-runs1-4.log` (walls 31–82 s;
run 2 OVER=1 mem 7040 MB anon=0 = the authorized mmapped-mathlib class; the rest
OVER=0). The probe's sorries are statement-shape placeholders under the probe
convention — never proof claims, never cited as results.

## 3. Price, risk classes, GO/NO-GO

**Price (M-class per the census; concretized):** ≈0.5–0.9k LoC, 6–10 runs:
T1 2–3 fires (density plumbing + the lintegral-sum computation), T2 1–2 fires (the
antitone power-sum lemma is pointwise + `Finset.sum_le_sum`; the H_α translation is
arithmetic), T3 2–3 fires (instance resolution + the log-linear limit transport),
+ the import/bootstrap fire (the TauCeti build on-path). One statement probe SPENT
(this unit).

**Risk classes (all mechanical-or-glue; zero mathematical risk identified):**
(a) the TauCeti import/bootstrap (same-toolchain class; untested at NAME level by
the probe — the residual it flags); (b) `rnDeriv`-of-count plumbing shape (mathlib
API drift risk — the probe de-risked the STATEMENT side; the proof side needs
`rnDeriv`-uniqueness at the discrete instance, standard); (c) EReal coercion
arithmetic (mechanical; enumerated); (d) the `:489` hypothesis instantiation
(`HaveLebesgueDecomposition` instance resolution on Fin n — expected clean via
σ-finiteness; if not, one `have`-instance); (e) the T3 corollary's limit transport
(`N·log(Σpᵅ)` vs `N·(1−Σpᵅ)` — one tendsto lemma, `log`-vs-linear near 1; the
classical computation). NO private-API dependency (§2.2's finding pre-empts it).

**GO/NO-GO: GO for a day-1/2 charter** — conditions: (i) the carrier lane imports
`TauCeti.RenyiEntropy` at the FIRST fire and reports the bootstrap verdict before
T1's proof work (the probe's one flagged residual); (ii) T4 (α > 1) stays banked;
(iii) the article path (if T1–T3 land GREEN) goes through R2's S1–S4 as a
DISCOVERY-CONDITIONAL candidate — never billed as engineering-first (the dictionary
IS the claim); (iv) tauceti stays read-only (T2's discrete re-proof, not a promotion).

## 4. The discovery-grade case (both sides stated; R2's S1 bar)

**For:** the dictionary statement is NEW everywhere surveyed — the round-2 sweeps
(semantic et-v2 + BM25 + exact-id over the 13 corpora, caveat-block-checked at
source) found the two sides unconnected; the bridge turns three classical
distribution facts (the α-power-sum identity, H_α-monotonicity, the α→1 Shannon
limit) into INSTANCES of in-corpus proved theorems — a new connection between
corpora objects, which is the cross-math program's own target shape; the nearest
formal kin (tauceti's file) becomes a consumed substrate rather than a competitor.
**Against (honest):** each recovered fact is elementary standalone (T2's discrete
proof is a few lines); the content is the IDENTIFICATION, not difficulty — the exact
profile R2's S1 weighed for the 75-P4 card (there ruled the revision channel via
"completes the article's own stated claim"; here there is NO prior article claiming
this endpoint, so the S1 novelty bar is met by the statement-level newness, but the
S2 billing question — dictionary-as-discovery vs glue — is genuinely open and R2's).
**Nearest-miss skeleton (≥2 mandatory):** ★1 tauceti `TauCeti.renyiEntropy` itself
(measure-side, N-parameter, no dictionary, no distribution object — substrate and
kin, not competitor); ★2 mathlib `Real.binEntropy`/`Real.qaryEntropy`
(`Analysis/SpecialFunctions/BinaryEntropy.lean` — Shannon-binary only, no Rényi-α,
no monotonicity-in-α API); 3 Sturm 2006 / Lott–Villani (the CD(K,N) informal
literature — no finite-discrete dictionary stated); 4 Rényi 1961 (the H_α definition
— classical, informal, no measure-theoretic bridge); 5 article-72's scoped
corroboration line (the N1 disambiguation pair, `decl-enrich-v3.tsv` rows 2).
**Billing guardrails:** kind DISCOVERY-CONDITIONAL per the census (ruled at article
time); the monotonicity/limit facts are never billed as difficulty; no quota
interaction (discovery-class); the companion-sync rule binds any article.

— lane R6, 2026-11-21. PREP ONLY: one statement probe spent (probe class, GREEN);
no fires; no article; tauceti read-only. INDEX rows for this file + the probe log +
the probe `.lean` ride H's landing.
