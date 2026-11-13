# Candidate dossier 74 — surprisal-moment-hierarchy-ceilings

Lane A4 (area-law-bridge), 2026-11-13. Realizes empty zone AL-EZ2 of
`research/bridges/area-law.md` §4 (and its §2 L4). Tags: [VERIFIED] = read in source this lane;
[HYPOTHESIS] = proposed new content. **Boundary note:** dossier 72 (lane A9, final:
`research/candidates/72-area-law-inertial-defect.md`) carries AL-EZ2 as *secondary* context for
its purity-certificate primary; this dossier owns the moment-hierarchy ceiling zone outright —
no statement overlap (72's M2/P2 is a matrix identity on `Pmat` factorizations; 74's objects
are certificate classes over spectral moment data). This dossier makes no
compression-inheritance claim and is unaffected by the 72 §P1 QA erratum (isometric-B
correction, applied to bridge AL-EZ1 and pilot-72 prework §3.1 this cycle).

**Honesty header (read first).** This is a **CONDITIONAL-CORE** dossier in the post-re-scope
pattern of dossier 02 (`research/candidates/02-ez5-bandwidth-k-ceiling-laws.md`, re-scope
section): the headline-adjacent claim "first barrier theory for entropy decay" is NOT made;
what is proposed is the *transport* of dossier-02's proved certificate/LP methodology onto a
new data class (surprisal moments of entanglement spectra), yielding (i) an unconditional
two-sided window theorem at the 1–2 moment level (T1), (ii) the class-inclusion ladder (T2),
(iii) an LP-computability core contingent on the same unclaimed LP-weak-duality layer dossier
02 identified (T3), and (iv) a method-barrier corollary whose named consumer is AreaLaw2D's own
3D bottleneck C.3 (T4, hypothesis-binder form). No area-law claims are made for any functional
(Kuwahara discipline, below); no poly-PEPS representation consequence is claimed (round-4 §2
AL-7: companion-preprint territory).

---

## Name

surprisal-moment-hierarchy-ceilings

## One-line pitch

Dossier-02's bandwidth-k ceiling-law machinery (certificate classes over k-point data, monotone
ceiling constants, LP weak-duality representation) is transplanted from near-CUE pair-correlation
rows to the surprisal moments of entanglement spectra — producing the first method-barrier
statement for window-based amplification: the Θ(√𝓑) surprisal window that AreaLaw2D's
MarginalTails achieves and its own 3D targets (C.3) suffer under is *tight for the 2-moment data
class*, not an artifact of that proof.

## Precise mathematical statement

**Setting [VERIFIED].** Fix a finite type `ι`. A *spectrum* is `p : ι → ℝ` with `∀ i, 0 ≤ p i`
and `∑ i, p i = 1` (the eigenvalue list of a reduced density matrix — `MState.sum_eigenvalues_
eq_one`, AreaLaw2D `Region/State.lean:164`; nonnegativity `PosSemidef`). Write `K i := -Real.log
(p i)` on `{i | 0 < p i}` (surprisal, [OAI265] Lemma 3.1 convention, `OpenAI/Statements.lean:466`),
`S p := ∑ i, Real.negMulLog (p i)` (entropy; identical to openai's `PolynomialPEPS.Subvolume.
Dyadic.entropy`, `PEPSSubvolume/EntropyMoments.lean:94`), and — the shared moment object —

```
m_u(p) := ∑ {i | 0 < p i}, p i * Real.exp (-u * Real.log (p i)) = ∑ i, (p i)^(1-u)
          = openai `moment p u`  [VERIFIED: EntropyMoments.lean:93; and MarginalTails' first
          clause bounds exactly `Real.log (∑ … p j * exp (-u * log (p j)))`, Statements.lean:483]
```

*Caveat (A5 VERDICTS row-74 glue note, applied 2026-11-14):* the second equality — the
identification with the unfiltered openai `moment p u = ∑ i, (p i)^(1-u)` — holds **for
`u ≠ 1` only**: at `u = 1` the `Real.rpow` convention `0 ^ 0 = 1` counts zero-probability
atoms, so `moment p 1 = Fintype.card ι` while the filtered (left-hand) sum is the support
card. Every use below quantifies `u` over small symmetric windows around `0` (T1b: `|u| ≤
1/(2σ)`; hMGF: `|u| ≤ (32·√((1+ϑ)𝓑))⁻¹`), which exclude `u = 1` whenever `σ < 1/2`, resp.
`𝓑 ≥ 1`; T3 below carries the side condition explicitly.

The k-*moment datum* of `p` is `d^(k)(p) := (E[K], E[K²], …, E[K^k])`; `𝒟_k := {d^(k)(p) : p a
spectrum}` is the admissible set. For `F` in the **Kuwahara-safe family** —
`F ∈ {W_ε : ε ∈ (0,1)} ∪ {H_α : α ≥ 1}` where `W_ε(p) := inf {w ≥ 0 | ∑{i | w < |K i - S p|} p i
≤ ε}` (the ε-smooth surprisal window / effective-rank object) and `H_α(p) := (1/(1-α))·log (∑ i,
(p i)^α)` for `α > 1`, `H_2 = -log (purity)` (α ≥ 1 Rényi family; `α = 2` is dossier-72 M2's
functional) — a *k-moment certificate* is a pair `(c₀, a : Fin k → ℝ)`, *F-valid* iff

```
∀ q : ι → ℝ, (∀ i, 0 ≤ q i) → (∑ i, q i = 1) → c₀ + ∑_{i<k} a i * d^(k)(q) i ≤ F(q),
```

and the **k-th ceiling** is `B_k(F) := sup {c₀ | ∃ a, (c₀, a) F-valid}` (a finite number: validity
at two spectra with distinct data bounds `c₀`; cf. dossier-02 `B_k` definition, candidates/02
§Precise statement). Explicitly EXCLUDED from the family: `α < 1` Rényi and rank/support
functionals (Kuwahara arXiv:2610.15199 no-go; round-4 §2 decisive datum — the formal no-go
gate is now LANDED: pilot-72 `C-neg.lean` GREEN + triad-only axcheck, 2026-11-14; see
pilot-72 prework Appendix A execution outcome).

**Theorem T1 (moment–window floor AND subgaussian ceiling — unconditional) [HYPOTHESIS].**
For every spectrum `p` and `ε ∈ (0,1)`:
(a) *floor:* `√((1-ε)/ε * Var_p(K)) ≤ W_ε(p)`, where `Var_p(K) = E[K²] - S²` (Cantelli over the
finite spectral measure);
(b) *ceiling:* if `Real.log (m_u(p)) ≤ u * S p + σ² * u²` for all `|u| ≤ 1/(2σ)` with `σ > 0`,
then `Var_p(K) ≤ 2σ²` (local-MGF variance) and `W_ε(p) ≤ σ * Φ(ε)` for an explicit
`Φ(ε) = Θ(log(1/ε))`;
(c) *binding MarginalTails:* under `hMGF : ∀ |u| ≤ (32*Real.sqrt ((1+ϑ)*𝓑))⁻¹,
Real.log (m_u(p)) ≤ u * S p + 512*Real.exp 1 * ϑ * 𝓑 * u²` (the verbatim first clause of
`OpenAI.MarginalTails`, Statements.lean:482–485, as hypothesis binder), `Var_p(K) ≤ 1024 * e *
ϑ * 𝓑` and `W_ε(p) ≤ C * √(ϑ * 𝓑) * log(1/ε)` — MarginalTails recovered as the 2-moment-level
point of the hierarchy.

**Theorem T2 (inclusion monotonicity) [HYPOTHESIS, routine].** `B_k(F) ≤ B_{k+1}(F)` for every
`k` and every `F` of the family: the injection `(c₀, a) ↦ (c₀, a ∘ castLE)` (zero on the new
coordinate) preserves validity and value. (Dossier-02 Theorem D pattern verbatim.)

**Theorem T3 (LP representation, grid-quantized) [HYPOTHESIS — the M-core, contingent].**
For the grid classes `𝒢_N := {spectra supported on {e^{-j/N} : j = 0..N²}}` and grid-quantized
functionals **whose moment parameters satisfy `u ≠ 1`** (equivalently `α ≠ 0` in `m_u = ∑
p^α`; automatic for the `α ≥ 1` Rényi arm of the family — the side condition guards the one
degenerate point: at `u = 1` the `Real.rpow` convention makes `moment p 1 = card ι` ≠ the
filtered support sum, so the grid-column values `F(q)` computed through the `moment`
identification would be wrong — A5 VERDICTS row-74 glue note), `B_k(F)` on `𝒢_N` is the value
of the finite linear program
`max c₀ s.t. c₀ + ⟨a, d⟩ ≤ F(q) ∀ q ∈ 𝒢_N (vertices)`, and LP weak duality gives the dual
ceiling `B_k(F) = min {∑_λ F(q_λ) : convex combinations λ with barycenter-equality of moments}`
— computable, `decide`-checkable at small `N` (the zeta23 `LawN256_check` pattern; dossier-02
Theorem E / surviving-core item 1: mathlib has no LP duality, cone-separation route only).

**Theorem T4 (method-barrier corollary; consumer = C.3) [HYPOTHESIS, binder form].**
Under `hMGF` (as in T1c) and `hB : (#crossing terms) ≤ 𝓑` (`𝓑 = 1 + ∑_{i crossing} log² (e d_i)`
dominates the crossing count, Statements.lean:480–481), for every `ε`:
`B₁(W_ε) ≥ √((1-ε)/ε * Var_p(K))` on the hMGF-class is achieved and no 2-moment certificate can
certify `W_ε = o(√𝓑)` — i.e. **the √𝓑 window is tight for the ≤2-moment data class** (both
sides from T1), which is precisely the obstruction AreaLaw2D's 3D targets isolate as C.3
("the window must exceed the square root of the number of crossing terms", `docs/3D/Targets.md`
§C.3; question quoted in §B.4), now a theorem *about the method's data class* rather than an
open question about states.

Quantifier order (Lean shape): `∀ {ι} [Fintype ι] [DecidableEq ι] (p : ι → ℝ) (hp : ∀ i, 0 ≤ p i)
(hΣ : ∑ i, p i = 1) {ε : ℝ} (hε : 0 < ε) (hε' : ε < 1), …` — the certificate-class statements
(T2/T3) quantify over `𝒟_k` via the spectrum-existential, mirroring dossier-02's `isLUB` phrasing.

## Novelty check

- **Corpus side** (direct rg, 2026-11-13, this lane):
  - mathlib (`encore-mathlib/repo/mathlib4`): `rg -i -c 'ceiling.?law|moment.?hierarchy' Mathlib/`
    → 0; no Cantelli/chebyshev over finitely-supported spectral measures in matrix form; the
    substrate (`negMulLog`, `Real.log`, `Analysis/Convex/Separation.lean`) is present, the
    objects are not. Substrate gap map: `research/feasibility/quantum-info-substrate.md` §A.
  - tauceti: `rg -i -c 'ceiling|hierarchy|moment' TauCeti/Analysis/` → false positives
    (asymptotic-filter, lattice-theoretic "moment"); no certificate class, no spectral moment.
  - openai-math: `ceiling|hierarchy` over `OAI/MathematicalPhysics/` → 1 file
    (`ContinuumCoulomb/Programs/AmplificationProgram.lean`, different sense); **nearest miss:
    `PEPSSubvolume/EntropyMoments.lean`** — `moment p u = ∑ p i^(1-u)` :93, `entropy` :94,
    `logMoment` :95, `moment_derivative` :120, `logMoment_derivative` :128, dyadic bounds
    (`dyadic_linear_bound` :24, `quadratic_bound` :68) — the moment *calculus* of the very same
    object, with **no certificate class, no ceiling constant, no hierarchy, no LP form, no
    barrier statement** [VERIFIED decl-by-decl]. This file is therefore also the in-corpus
    DONOR for the definitions (Mathlib-level API).
  - anthropics (zeta23): the certificate/LP methodology exists exactly once — `Zeta23/
    PairCeiling/` (k=1 only; `ceiling_stability` Stability.lean:305, `ceiling_law256`
    CeilingLaw256.lean:38) — never applied outside near-CUE rows; `moment` in the spectral
    sense: absent (`rg -i 'sum.*p.*\^' ZeroSide/` → the k_c functionals only).
  - AreaLaw2D: `rg -i -c 'ceiling|bandwidth|moment.?class' AreaLaw2D/` → 0 relevant; its own
    moment-side statement is `MarginalTails` (Statements.lean:469) — a *bound*, not a class
    theory.
- **Literature side:** round-4 §2 rows (lane A5, `research/novelty/round-4.md`, run 2026-11-13):
  AL-1 **Kuwahara 2610.15199** (α<1 no-go — the family restriction), AL-2 Anshu–Arad–Gosset
  2103.02492 + 1905.11337 (2D area-law state-side), AL-5 Abrahamsen et al 2203.01612 (AGSP —
  nearest technique to rank certificates), AL-6 `abs:"effective rank" AND abs:"ground state"`
  → **0 relevant** (no effective-rank concentration statements anywhere), AL-7 in-corpus
  anchors. Lane-A4 bridge searches (bridges/area-law.md §3(a)): Kastoryano–Eisert 1303.6304
  (MI clustering, Liouvillian), Chen–Rouzé 2504.02208 (CMI decay, Gibbs) — no barrier/ceiling
  theory for entropy functionals in any. `[R8 round-5 confirmation pending]` — queries to run:
  `"truncated moment problem" AND "entanglement"`; `"certified bound" AND "spectral window"`;
  `"moment hierarchy" AND entropy`; citations to AHS 2004.15009 proving *lower* bounds on
  achievable windows.
- **Known nearest misses:** (a) openai `EntropyMoments.lean` (above — calculus, not classes);
  (b) AreaLaw2D `MarginalTails` (the achieved upper bound at 2-moment level — the *other* side
  of T1/T4; neither it nor the paper asks tightness-for-the-class); (c) zeta23 PairCeiling +
  dossier 02 (methodology source, different data class — the transport is the content);
  (d) AHS 2004.15009 (entanglement-spread *state-side* area law, Õ(√b) — 74's T1 floor is the
  class-side dual of their upper bound; no class/hierarchy/LP there); (e) classical truncated
  moment theory (Hausdorff) — supplies the 𝒟_k extremal structure T3 consumes, never applied to
  entanglement spectra.

## Bridge analysis

- **Corpora bridged:** anthropics/zeta23 + this repo's dossier-02 machinery (certificate
  classes, monotone ceilings, LP weak duality — the only ceiling-ladder methodology in any
  corpus) × openai-math (`EntropyMoments.lean` moment-calculus donor; PEPS-side consumer
  context) × AreaLaw2D (`MarginalTails` as the hypothesis binder `hMGF` — the only formalized
  gapped-moment bound in existence; 3D targets C.3 as the named consumer) × mathlib
  (`negMulLog`, convex separation substrate).
- **Why essential:** no single corpus can state `B_k(W_ε)`: zeta23 has certificate classes but
  no spectral-moment objects and no entropy; openai/AreaLaw2D have the moment objects (both the
  calculus and the gapped bound — the two halves of family 265 each formalize one face of
  `m_u`, [VERIFIED] Statements.lean:483 vs EntropyMoments.lean:93) but no certificate/LP layer;
  mathlib has neither. T4 additionally needs C.3's formulation, which exists only in
  AreaLaw2D's docs — the consumer is in the donor corpus.
- **Empty-zone fit:** `research/bridges/area-law.md` §4 AL-EZ2 (§2 L4, §3(a)); round-4 §2
  surviving shape (b) ("matrix-inequality cross-bridge content… effective-rank forms").

## Proof-strategy sketch

1. **T1(a) — routine:** Cantelli for the finitely-supported measure `p`: from
   `Var = E[K²] − S²` and `1_{|K−S|>w}` marking, `ε ≥ P(|K−S|>w) ≥ …` — the one-sided Chebyshev
   identity over `Finset.sum` (self-contained ≈ 60 LoC; the finite version avoids all
   measure-theory API). The `W_ε` infimum unfolds via `Real.isLUB_lt_iff`-style argument on the
   finite grid of thresholds.
2. **T1(b) — routine:** `Var ≤ 2σ²` from the second derivative of `exp(log(m_u(p)) − uS)` at
   `u = 0` (donor calculus: `logMoment_derivative`, EntropyMoments.lean:128;
   `summand_derivative` :107); the window tail from the MGF by the standard Chernoff split at
   `u = 1/(2σ)` — all finite sums over `{i | 0 < p i}`.
3. **T1(c) — binder application:** instantiate (b) at `σ² = 512 e ϑ 𝓑` from `hMGF` (verbatim
   MarginalTails clause; constant `1024 = 2·512` tracked).
4. **T2 — routine:** the zero-padding injection; validity transfers by `Finset.sum_congr`
   (dossier-02 Theorem D proof pattern, candidates/02 §Proof sketch step 4).
5. **T3 — the new layer (medium):** grid quantization makes `𝒟_k ∩ 𝒢_N` a finite set of
   rational vectors; the certificate-value supremum is a max over a polytope — weak duality via
   mathlib `Analysis/Convex/Separation.lean` (separating hyperplane), exactly the layer
   dossier-02 surviving-core item 1 scoped ("LP weak duality IN LEAN", unclaimed, flagged M);
   vertex enumeration at small `N` in the `LawN256_check` decide style.
6. **T4 — assembly:** combine T1(a) floor + T1(c) ceiling on the hMGF class; the
   `o(√𝓑)`-negation is `Real.not_isLittleO`-bookkeeping; `hB : #crossing ≤ 𝓑` from the 𝓑
   definition (Statements.lean:480–481, each crossing term contributes ≥ 1).

## Feasibility

(Preliminary, same shape as TEMPLATE; cross-ref `research/feasibility/quantum-info-substrate.md`
§C/§D — **every substrate item is S-cost and Tier-C** per that map.)

- **mathlib API entry points:** `Real.negMulLog` (`Analysis/SpecialFunctions/Log/NegMulLog.lean:164`),
  `Real.log`; `Analysis/Convex/Separation.lean` (T3); `Finset` sum calculus; `Real.sqrt`.
  No measure theory needed (finite spectral measures as `Finset.sum`).
- **Donor lemmas:** openai `EntropyMoments.lean:93–128` (`moment`, `entropy`, `logMoment`,
  derivative lemmas) — vendor ≈ 80 LoC (Mathlib-level API; the file's other imports
  `PEPSFilters.LocalOperators`/`TiltEnergy` are not needed by these decls); AreaLaw2D
  `MarginalTails` statement as hypothesis binder (transcribe the Prop, ≈ 50 LoC, over the
  tier-C region skeleton ≈ 0.35k per substrate map §C rows 1–3); dossier-02/pilot artifacts as
  *proof models* (02 has no Lean pilot; the certificate-class phrasing patterns from
  `candidates/02` §Precise statement).
- **Missing glue:** (a) definitional: `W_ε`, `𝒟_k`, certificate validity, `B_k` (≈ 150 LoC);
  (b) genuinely new mathematics: none beyond the T3 LP-duality layer (shared with dossier-02's
  declared missing glue — **cost-sharing note for triage: 02 and 74 draw on the same LP layer**);
  T1's inequalities are classical (Cantelli, Chernoff) in finite dress.
- **Effort:** **S for the provable core T1+T2+T4** (≈ 0.6–1k LoC, zero new analytic API);
  **+M for T3** (the LP layer, ≈ 0.5–1k on top, contingent).
- **Risks:** (i) `W_ε`'s infimum-over-thresholds could be degenerate at atoms (`P(|K−S| = w)`
  exactly ε) — state with `≤`-closure or quantified over the grid; (ii) the `o(√𝓑)` negation
  needs care with the two hypotheses' uniformity — mitigated by fixing `ε` and quantifying over
  the class only; (iii) T3 vertex enumeration blowup at large `N` — work at `N ≤ 8` (02's F6
  precedent); (iv) novelty drift toward "first barrier theory" framings — banned (honesty
  header), the claim is class-relative tightness only.

## Significance

Converts AreaLaw2D's own recorded 3D obstruction (C.3: amplification radius forced by the
√(#crossing) spectral window) from an open physics question into a *method-data theorem*: the
window is tight for the ≤2-moment data class, so any escape (the B.4 "narrower window" program)
must consume higher moments or different data — a decidable, LP-computable boundary. For the
project it is the first cross-domain transport of the proved ceiling-law methodology (zeta23 →
quantum), and its T1 core doubles as the missing finite "effective-rank concentration"
statement round-4 AL-6 found absent everywhere. Modest headline weight; high certainty;
direct consumer already in the corpus.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

**Lane proposal (A4, non-binding, conditional-core scoping per dossier-02 precedent):**
Novelty 3.5 (hierarchy/ceiling shape absent from all corpora and literature; components
classical; the AHS class-side dual is the new claim), Significance 3 (named in-corpus consumer
C.3; method-barrier tool; not headline physics), Effort 2 (S core; T3's M rides on the shared
02 LP layer) → proposed rank ≈ 5.25 conditional on T1+T2+T4 as the scored core, T3 as upside.
If triage prefers scoring the full programme: Effort 3 → rank ≈ 3.5.

## Pilot outcome (lane A4, 2026-11-14)

No 74-dedicated pilot was run (74 was never a triage slot). The dossier's executable fence —
the Kuwahara α<1 no-go gating the family restriction (§Precise statement, "Explicitly
EXCLUDED") — landed kernel-clean as pilot-72 milestone P4.5, `research/pilots/72/C-neg.lean`
(369 LoC, 11 theorems): **run8 GREEN** rc=0 errors=0 sorry=0
(`research/pilots/72/logs/run8-final.log`); full axcheck **11/11 triad-only** incl. private
lemmas (`research/pilots/72/logs/axcheck-run1.log`). Scope note: C-neg is dossier-72's §C-neg
artefact (A9's addendum owns its full outcome record); for 74 it certifies that the
purity/effective-rank family boundary is now a checkable Lean theorem, not editorial. A5's
row-74 u≠1 glue note applied to §Precise statement (m_u caveat + T3 side condition) this
session. T1–T4 of this dossier remain [HYPOTHESIS] — unexecuted, per the conditional-core
honesty header.
