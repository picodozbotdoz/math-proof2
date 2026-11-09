# Candidate dossier 50 — quasi-rh-truncated-window-constants

Lane R2 (openai-surveyor), 2026-11-09. **Coordinate with lane R5
(`research/bridges/analytic-nt.md` — this dossier audits and downgrades one of R5 §3/§4's
 tempting combinations and proposes what honestly survives).**
Tags: [VERIFIED] = read in source this lane; [HYPOTHESIS] = proposed/reasoned, flagged.

**Honesty header (read first).** The dossier's nominal pitch — "re-run zeta23's Theorem-D
variational window with zero support truncated at ℜs = 7/8 to improve the Montgomery–Taylor
constants 2−1/c₁* ≈ 0.6725 / (3−1/c₁*)/2 ≈ 0.8363" — is **refuted by an engine audit below
(§ "Why the headline is dead")**: the variational variable of ThmD is the *height-window
profile*, not the horizontal location of zeros, so a zero-free half-plane cannot enter the
functional. What survives is (S1) the first *formal* zero-confinement theorem gluing openai's
quasi-RH to the functional-equation reflection (novel as a Lean theorem, but the mathematical
content is a one-line corollary that the openai preprint itself already prints — novelty
downgraded accordingly); (S2) a composite location+proportion theorem in zeta23's own
zero-counting vocabulary (conjunction-level); (S3) a genuinely new candidate — extending
zeta23's `xiPrime_over_xi_re_pos` band from ℜs ≥ 1 down towards 7/8 — flagged [HYPOTHESIS]
with the obstruction named. Triage should read this dossier primarily as (i) the audit that
kills a seductive false bridge and (ii) a small, honest, high-certainty formalization pilot.

---

## Name

quasi-rh-truncated-window-constants

## One-line pitch

The 7/8 zero-free half-plane (openai `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`) cannot
improve zeta23's Theorem-D constants (the ThmD functional varies a height window, not the
σ-support of zeros — engine audit below); what the combination genuinely yields is the first
formal zero-*confinement* theorem (all nontrivial zeros of ζ and of every Dirichlet L-function
in the closed strip 1/8 ≤ ℜs ≤ 7/8, paper-only today), its zeta23-vocabulary corollary
"N(σ,T) = 0 for σ > 7/8 among zeros that zeta23 counts", and a [HYPOTHESIS] ξ′-band extension.

## Precise mathematical statement

**Objects (all [VERIFIED]).** Mathlib's `riemannZeta` and `DirichletCharacter.LFunction`;
zeta23's nontrivial-zero predicate `IsNontrivialZero ρ := riemannZeta ρ = 0 ∧ 0 < ρ.re ∧ ρ.re < 1`
(`zeta23/Zeta23/Defs.lean` region; per survey anthropics.md §1.3) and windowed counts
`zerosIn T₁ T₂ := {ρ | IsNontrivialZero ρ ∧ T₁ < ρ.im ∧ ρ.im ≤ T₂}`
(`Zeta23/Statement.lean:46`); openai's
`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re : ∀ s, (7/8:ℝ) < s.re → riemannZeta s ≠ 0`
(`OAI/NumberTheory/DirichletL/Nonvanishing.lean:29`) and
`OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re`
(same file :19, with the `¬(χ = 1 ∧ s = 1)` pole exclusion).

**(S1) Zero-confinement theorem (the honest deliverable).**

  (S1a) For every ρ : ℂ with `riemannZeta ρ = 0` and 0 < ρ.re < 1:  **1/8 ≤ ρ.re ≤ 7/8**.
  (S1b) For every q ≥ 1, every `χ : DirichletCharacter ℂ q`, every non-pole zero ρ of
  `LFunction χ` with 0 < ρ.re < 1 (principal χ: also ρ ≠ 1): **1/8 ≤ ρ.re ≤ 7/8**.
  Equivalently, in zeta23's vocabulary: for every T₁ < T₂, the set
  `{ρ ∈ zerosIn T₁ T₂ | ρ.re < 1/8 ∨ 7/8 < ρ.re}` is empty — a *box-confinement* theorem for
  exactly the zero set zeta23's `ZeroConfig` carries.

**(S2) Composite location+proportion corollary (zeta23 vocabulary).** With
`Ncount/N0star/N0simple/Ndist` as in `zeta23/ChallengeDeps.lean:41–95`: for every ε > 0 there
is T₀ such that for all T ≥ T₀ simultaneously

  - `N0star T (2T) ≥ (2 − 1/c₁* − ε) · Ncount T (2T)` (zeta23 Theorem D — already proved,
    `Challenge.lean` `montgomery_taylor_*`; c₁* the Montgomery–Taylor constant,
    `ChallengeDeps.lean:107 cMT`), **and**
  - every zero counted by `Ncount T (2T` lies in the closed box [1/8, 7/8] × (T, 2T] (from S1).

  Read as one theorem: *at least 67.25…% of the zeros of ζ in the window are simple and on the
  critical line, and 100% of them lie in the closed strip 1/8 ≤ ℜs ≤ 7/8.* New as a single
  formal statement; mathematically the conjunction of S1 with a proved zeta23 theorem.

**(S3) [HYPOTHESIS] ξ′-band extension.** Extend
`XiPrime.xiPrime_over_xi_re_pos : ∀ s, 1 ≤ s.re → 0 < (xiDeriv s / xi s).re`
(`zeta23/Challenge/XiPrime.lean:72`, proved) to a band: *there exist δ > 0 and T₀ such that
`0 < (xiDeriv s / xi s).re` for all s with `7/8 + δ ≤ s.re` and `T₀ ≤ |s.im|`; consequently
`xiDeriv` has no zeros in that region* (ξ ≠ 0 there by S1a since ξ′/ξ is finite only where
ξ ≠ 0 — where ξ(s₀) ≠ 0 and ξ′(s₀) = 0 the quotient vanishes, contradicting strict
positivity). Obstruction (why this is not a corollary): for 7/8 < σ < 1 the polynomial factor
contributes `Re(1/(s−1)) = (σ−1)/|s−1|² < 0`, and positivity must be rescued by the
zero-sum term `Σ_ρ Re(1/(s−ρ)) ≥ (σ − 7/8)·Σ_ρ |s−ρ|^{-2}` against the Γ′/Γ term — an
interplay that zeta23's σ ≥ 1 proof never faces. Whether δ > 0 exists (and how it trades
against T₀) is open; stated as hypothesis, not claimed.

## Why the headline is dead (engine audit — the negative result this dossier contributes)

Claim audited: "zero support truncated at 7/8 re-optimizes the ThmD/Montgomery–Taylor constant."
[VERIFIED, all read in source this lane]:

1. The ThmD variational object is `ThmD.cFun lam v = lam·(∫v)²/(∫v² + lam²∬|s−s'|vv')`,
   integrals over **s ∈ [−1/2, 1/2]** (`zeta23/Zeta23/ThmD/Functional.lean:40–43`), with
   optimizer `vStar lam s = cos(√2 lam s)` (:32) and closed-form `cStar lam = √2 sin ϑ/
   (cos ϑ + ϑ sin ϑ)`, ϑ = λ/√2 (:35). The variable `s` is the **scale-free height offset
   inside the detection window (T, 2T]** — confirmed by the concrete window
   `phiD ϱ lam L w u := √(vStar lam (u/L))·Taper.phi ϱ L w u` (`ThmD/Window.lean:~:38–43`
   [erratum 2026-11-09, H/QA: v1's ":33–35" lands on the `namespace Zeta23/ThmD` lines;
   the def sits just above `phiD_even` :45 / `phiD_nonneg` :50]),
   u the height offset on the support [−L/2, L/2].
2. Zero classification in the engine is binary: `Defs.lean:140 onLine : Set ℂ := {ρ | ρ.re = 1/2}`;
   the abstract `ZeroConfig` (`Defs.lean:120`) + `PaperInputs Z` (`Zeta23/Hypotheses.lean:147`)
   expose carrier/multiplicity/window and the EF/RvM/cheb/GammaFacts fields — **no field
   encodes the real parts of off-line zeros, and none could consume a zero-free region**: the
   on-line count is bounded below (rank–trace), the total comes from Riemann–von Mangoldt, and
   neither quantity changes when a region containing no zeros is excised.
3. The constants 2−1/c₁* ≈ 0.67250 and (3−1/c₁*)/2 ≈ 0.83625 are functions of λ (window
   shape) alone (`HD lam := 2 − 1/cStar lam`, `Functional.lean:53`; λ = 1 packaging
   `cMT`, `ChallengeDeps.lean:107`); the λ-family `thmA_lam/thmB_lam/thmC_lam`
   (`Zeta23/Final.lean:79,99,119`) and the quartic-window variant for ξ′
   (`Zeta23/XiPrime/QuarticWindow/`) are the real constant-improvement axes — both internal
   to zeta23, both independent of any zero-free region. This confirms and sharpens R5 §2(a):
   the right question is λ/quartic re-optimization, not 7/8-truncation. The openai 7/8 input
   is irrelevant to that question.

Conclusion: no ε-statement of the form "c₁* improves to c₁*(7/8)" exists to be proved. The
dossier proceeds with S1–S3 only.

## Novelty check

Corpus side (rg patterns and counts; per `research/qa/make-decl-index.sh` caveats the OAI TSV
rows include vendored mathlib-like trees, so openai-math was searched **both** via the TSV and
by direct rg over `openai-math/lean/OAI` and `openai-math/preprints`):

- **S1 (strip confinement), formal absence:**
  - openai-math: `rg '1 / 8 ≤|≤ 7 / 8' openai-math/lean/OAI/NumberTheory -g '*.lean'` → 0
    relevant hits (the only `1 / 8` occurrences in `OAI/NumberTheory/DirichletL/` are
    parameter arithmetic in `Parameters.lean:16–17` and a compactness witness in
    `Mellin/CompactWeights.lean:170` — inspected, unrelated). The comparator
    `lean/ComparatorChallenges/DirichletSevenEighths.lean` states only the right half-plane
    (theorem `LFunction_ne_zero_of_seven_eighths_lt_re`, :8). `lean/docs/003.md`: "The paper's
    later applications are not included."
  - anthropics zeta23: `rg 'zero.?free|zeroFree' anthropics_formal-math/zeta23/Zeta23` → hits
    only inside `XiPrime/` (ξ′ zero-free strip statements), none for ζ/Dirichlet; `rg '1 / 8'
    Zeta23` → `XiPrime/ZeroCount/{Y.lean:101,177, Generic.lean:44}` — growth-lemma hypotheses
    for ξ′ zero counting, not confinement theorems.
  - mathlib: no zero-free region beyond ℜs ≥ 1
    (`Mathlib/NumberTheory/LSeries/Nonvanishing.lean:391,404,417`; R5 §0 [V]).
  - tauceti: no ζ-zero content (R5 §0 [V]).
- **S1, literature side — nearest miss that forces the novelty downgrade:** the openai
  preprint *itself* prints the corollary inside the proof of its Corollary 1.2: "By Theorem
  1.1 and the functional equation, the nontrivial zeros of every primitive Dirichlet
  L-function lie in 1/8 ≤ ℜs ≤ 7/8" (`preprints/The-Quasi-Riemann-Hypothesis-September-30-
  2026/paper.pdf`, Cor 1.2 proof, pdftotext p.~7 line "lie in 1/8 ≤ ℜs ≤ 7/8"). So the
  mathematical statement is **present in the corpus's own paper** (as a proof step, not a
  numbered theorem, and not formalized). Per `research/TRIAGE.md` novelty scale this caps S1's
  novelty at 2 ("one corpus contains a close variant; the candidate adds … model transfer" —
  here: formalization + Dirichlet-family packaging + zeta23-vocabulary export).
- **S2:** `rg 'N0star.*Ncount|montgomery' openai-math` → 0; the conjunction
  proportion+location is stated nowhere (zeta23 has proportions only, openai location only).
  Novelty 2–3 (conjunction of two corpus theorems, but the composite sentence is new).
- **S3:** `rg 'xiPrime_over_xi|xiDeriv.*re_pos' openai-math tauceti mathlib` → 0; nothing in
    either paper states a ξ′ band below σ = 1. zeta23's `Challenge/XiPrime.lean:67` confines
    ξ′ zeros to the *open* strip only. Novelty of S3 (if true): 4 (no literature trace found
    by the searches below; flagged for R8).
- Literature — **R8 round-2 has landed**: `research/novelty/round-2.md` §6 (lines 147–158,
  PRE-CHECK on this candidate): "AF v2 (HTML): no zero-free-strip-conditional constants
  anywhere. The conditional results are RH-shaped only: §7.3 assumes full RH (third trace via
  Hejhal / Rudnick–Sarnak, giving liminf N_d/N ≥ 0.85082); §7.1 assumes zeros 'within
  o(1/log T) of the line'. Nothing uses a Re s > 7/8-type strip (quasi-RH) to improve window
  constants." Verdict NOVEL-SUPPORTED, confidence medium-high. Two consequences for this
  dossier: (i) the audit's negative conclusion is *externally corroborated* — no strip-
  conditional window constants exist in the literature either, consistent with the engine
  reason they cannot exist (§ "Why the headline is dead"); (ii) AF §7.3's RH-conditional
  0.85082 is the nearest miss for any σ-sensitive constant and confirms that S3 (the ξ′
  positivity band below σ = 1) has no RH-shaped or strip-shaped precedent. Residual queries
  for R8 round-3 if S3 is piloted: "Re xi'/xi positive half-plane", "Speiser xi' zero-free
  region right half-plane".

## Bridge analysis

- Corpora bridged: **openai-math (quasi-RH) × anthropics zeta23 (zero config + XiPrime) ×
  mathlib (functional equation substrate)**.
- Why essential: the *right* half of S1 exists only in openai
  (`riemannZeta_ne_zero_of_seven_eighths_lt_re` — no other corpus has any zero-free region);
  the *left* half needs the reflection ρ ↦ 1 − ρ̄, which zeta23 has already assembled from
  mathlib (`ZetaSeam.reflect_zero` field, `Zeta23/Statement.lean:79`, discharged as
  `ZetaSeam.of_reflect zeta_reflect_zero zeta_mult_reflect` in
  `Zeta23/Statement/SeamClosed.lean:22` — itself from mathlib's
  `completedRiemannZeta_one_sub`); the *identification layer* (zeros outside the open strip
  are trivial/pole) is R5's flagged missing lemma (analytic-nt.md §2(b)); S2 needs zeta23's
  counting vocabulary, which openai lacks entirely. No single corpus can state S1+S2.
- Empty-zone fit: realizes the "Dualities" row of `research/bridges/analytic-nt.md` §2
  ("zeta23 counts zeros … openai excludes zeros … the explicit formula is the dictionary") in
  its weakest (set-theoretic) form; explicitly **does not** realize R5's E3 (effective PNT
  from 7/8 — a different, stronger consumer of the same openai theorem) or R5's E1/E4.

## Proof-strategy sketch

1. (Routine) Right half: `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` gives `ρ.re ≤ 7/8`
   for nontrivial ρ. [VERIFIED donor, `Nonvanishing.lean:29`]
2. (Routine) Left half: apply the same theorem to `1 − conj ρ` — needs the reflection lemma
   `riemannZeta (1 − conj ρ) = 0 ↔ riemannZeta ρ = 0` for nontrivial ρ. Port from zeta23's
   `zeta_reflect_zero`/`zeta_mult_reflect` (`Zeta23/Statement/SeamClosed.lean:22`, built on
   mathlib `completedRiemannZeta_one_sub` + conjugation), or re-prove directly at mathlib
   level; then `1/8 = 1 − 7/8 ≤ ρ.re`. Same pair for Dirichlet: reflection for
   `DirichletCharacter.LFunction` must be assembled (zeta23 has the χ-version inside ThmE's
   seam work; mathlib has `completedLFunction` functional equation
   `LSeries/DirichletContinuation.lean:231` per R5 §1).
3. (Small theorem, the honest glue) The strip-identification lemma: every zero of
   `riemannZeta` with ℜs ≤ 0 is trivial and none has ℜs ≥ 1 except the pole — R5 §2(b) flags
   exactly this as "missing in mathlib and … a real (small) theorem"; needed so S1a's
   hypothesis 0 < ρ.re < 1 can be dropped or discharged.
4. (Packaging) State S1b over the Dirichlet family with openai's
   `LFunction_ne_zero_of_seven_eighths_lt_re` [VERIFIED, :19] + χ-reflection.
5. (Routine) S2: S1 + zeta23's already-proved `montgomery_taylor_*` comparator theorems
   (import path per `zeta23/Challenge.lean:131–229`); the composite is a Λ-conjunction, no
   new analysis.
6. (The genuinely open step, flagged) S3: attempt the band extension of
   `xiPrime_over_xi_re_pos` using S1a inside zeta23's ξ′/ξ explicit formula
   (`Zeta23/XiPrime/ExplicitFormula/`); the new content is estimating
   `Σ_ρ (σ − ρ.re)/|s−ρ|² + Re(ψ(s/2))/2 + (1/s + 1/(s−1)).re` from below for
   σ ∈ [7/8 + δ, 1). The negative `(σ−1)/|s−1|²` term is bounded by `(1/8)/|t|²`; the Γ-term
   grows like log|t|; the zero-sum term needs a lower bound on `Σ |s−ρ|^{-2}` — zeta23's
   `RvM/` density input (Backlund) should suffice for |t| ≥ T₀. **Hardest step; may fail for
   small |t| — S3 is exploratory and separable from S1/S2.**

## Feasibility

Preliminary, in R9's F0–F6 shape (`research/feasibility/mathlib-verification.md` §3); R9's
port-probe write-up (`research/feasibility/port-probe.md`) is **pending** — note for R9: the
existing anthropics→v4.36 probe does not cover **OAI → v4.36**: openai-math sits on Lean
**v4.34.1** (`lean/lean-toolchain`), a THIRD toolchain in the ecosystem (zeta23 v4.33.x,
tauceti/mathlib v4.36.0-rc2); importing `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re`
alongside zeta23/mathlib needs an OAI→v4.36 port probe (start with
`OAI/NumberTheory/DirichletL/Nonvanishing.lean`'s import closure) before any pilot.

- F0: S1a/S1b as above; S2 composite; S3 optional stretch.
- F1 mathlib entry points: `riemannZeta`, `completedRiemannZeta_one_sub`,
  `DirichletCharacter.LFunction`, `completedLFunction`
  (`Mathlib/NumberTheory/LSeries/{RiemannZeta,DirichletContinuation}.lean`).
- F2 donor lemmas: openai `riemannZeta_ne_zero_of_seven_eighths_lt_re` /
  `LFunction_ne_zero_of_seven_eighths_lt_re` (`Nonvanishing.lean:29/:19` — porting friction:
  the 2,926-file `OAI/NumberTheory/DirichletL` tree must come along or the statement be
  re-anchored; **this is the port-probe question**); zeta23 `zetaSeam`
  (`Statement/SeamClosed.lean:22`), `ZeroConfig`/`zerosIn` (`Defs.lean:120`,
  `Statement.lean:46`), `Challenge.lean` Thm-D statements.
- F3 missing glue: (a) trivial-zero identification lemma (R5 §2(b)); (b) χ-reflection for
  mathlib's `LFunction`; (c) S3's zero-sum lower bound (only for the stretch).
- F4 effort: **S** for S1+S2 (< ~500 LoC once the openai import lands); **M** if S3 is
  attempted.
- F5 risks: toolchain port of the openai statement is the single biggest risk (v4.34.1 →
  v4.36.0-rc2 across a 486k-line dependency tree — mitigate by re-proving the *statement*
  against a re-anchored hypothesis, i.e., take `7/8 < s.re → riemannZeta s ≠ 0` as an
  interface axiom of the pilot file, discharge later via the port); S3 may be false as
  stated for small |t| (then weaken to |ℑs| ≥ T₀ form or drop).
- F6: kernel-only; math-proof1 Modal build/check loop per AGENTS.md; no external CAS.

## Significance

Small but real: S1 is the first formal theorem locating ζ/Dirichlet zeros in a proper closed
substrip, and the *type-checking layer* (trivial-zero identification + reflection +
zero-free import) is exactly the seam R5 identified as prerequisite for every future
zeta23↔openai zero-side transfer (including their E1/E3/E4, which are the cluster's stronger
candidates). The audit result (headline refutation with file:line evidence) protects Phase-4
triage from a tempting zero-payoff candidate. S3, if true, would be the first quantitative
ξ′-band statement and a new Speiser-flavored theorem — the dossier's only path to novelty ≥ 3.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank: —

Lane proposal: novelty 2 (S1 printed in openai's own paper; S2 conjunction; S3 alone would be
4 but is [HYPOTHESIS] and separable), significance 2–3 (glue layer for the ant-bridge
cluster), effort 1–2 (S pilot, gated on the OAI→v4.36 port probe). Pilot S1a alone first.

## F4 grade by lane R9

2026-11-09, round 5. The dossier's "note for R9" is answered by round 3
(`research/feasibility/port-probe.md` §7): the OAI→v4.36 probe EXISTS and is clean where
it matters.

- **Grade: S (S1+S2) — confirmed, with the single biggest risk (F5) DISCHARGED.** The
  openai quasi-RH statement elaborates standalone against v4.36 mathlib
  (`ProbeC1_OAI_QuasiRH.lean`, run 3: 0 errors — statement layer imports only `Mathlib`);
  and the def-chain closure measurement quantifies the alternative: the library statement
  at `Nonvanishing.lean:29` sits on **2924 OAI files / 486,490 LoC / depth 44** — so the
  dossier's F5 mitigation ("take `7/8 < s.re → riemannZeta s ≠ 0` as an interface
  hypothesis") is not just the safe route, it is the ONLY sane route; the binder pattern
  itself is elaboration-validated (`ProbeE`, runs 5–6: 0 errors, 0 warnings).
- **zeta23 side**: Thm-D statement shapes + counting defs = exactly the ProbeE surface,
  clean; `zetaSeam`/`ZeroConfig` are the same statement family (unprobed individually —
  residual S).
- Verdict: keep S for S1+S2 (<~500 LoC), M if S3; no F1 corrections.

---

## Pilot outcome (2026-11-09, lane R2 closure)

- **M1: GREEN** — `research/pilots/50/M1.lean` (94 LoC; blueprint `research/pilots/
  50-blueprint.md` with full run log): strip confinement `1/8 ≤ Re ρ ≤ 7/8` under the hQRH
  binder, in three vocabularies (binder / `riemannZetaZeros` / zeta23-window set form).
  Axioms `[propext, Classical.choice, Quot.sound]`; clean at iteration 2 (run
  `ap-ogcHrPsYMUnSPLLc839H4b`).
- **M2a: GREEN** — `research/pilots/50/Dirichlet.lean` (73 LoC): the Dirichlet shell over
  `hQRHχ` + `hFEχ` binders, primitive χ; axioms `[propext, Classical.choice, Quot.sound]`
  (re-confirmed OK in run 14, `research/pilots/50/logs/combined-run14-green.log`). R9's
  independent axcheck batch concurs on both (`research/pilots/50/logs/axcheck-run1.log`:
  `AxPilot50_M1: 3 theorems`, `AxPilot50_Dirichlet: 1 theorems`).
- **Conditional posture confirmed as the design**, not a stopgap: three explicit binders
  (hQRH, hQRHχ, hFEχ). Notably `hFE` was never needed — mathlib's product-form
  `riemannZeta_one_sub` (`RiemannZeta.lean:178`) discharges the ζ-reflection inline (the
  Λ-route would have needed pole bookkeeping + conjugation symmetry; the product form needs
  neither). hTZ (trivial-zero identification) is not required by the conditional statement.
- **The missing-FE note (donation opportunity, report-grade):** mathlib HAS the Dirichlet
  functional equation in completed form — `DirichletCharacter.IsPrimitive.
  completedLFunction_one_sub` (`Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291`
  : `completedLFunction χ (1−s) = N^(s−1/2) · rootNumber χ · completedLFunction χ⁻¹ s`) — but
  **no product-form `DirichletCharacter.LFunction_one_sub`** (the analogue of
  `riemannZeta_one_sub`). Donating that one decl (route: the completed↔raw Γℝ-division
  lemmas, `ZMod.lean:50–51`, + Γ-nonvanishing) would discharge `hFEχ` inline and make the
  whole M2a shell single-binder.
- **Two v4.36 instance-binder elaboration findings** (documented in the pilots): (i)
  instance binders nested inside a hypothesis's ∀-type (`∀ {q} [NeZero q] (χ), …`) are NOT
  consulted for class synthesis while elaborating that hypothesis's type — the
  `LFunction`-level `[NeZero q]` requirement then fails; workaround: explicit
  `(inst : NeZero q)` argument + `@`-application; (ii) `DirichletCharacter.LFunction`
  lives under `variable {N} [NeZero N]` (DirichletContinuation.lean:50), so any
  binder-level restatement of quasi-RH-for-Dirichlet-L inherits this constraint — relevant
  to every future port of the openai statement.
- **Updated proposal:** the conditional core of S1a is COMPLETE and kernel-verified
  (ζ + primitive Dirichlet, both binder-conditional). What remains is exactly M2 as scoped
  in the blueprint: hQRH/hQRHχ discharge (blocked on the openai statement port — its library
  closure is 2,924 files per `port-probe.md` §7.2; the challenge-form statements port
  standalone and are what the binders quote), hTZ (drop the strip hypotheses), and M3 (the
  S2 composite, to be built on R1's pilot-42 `ZeroMult`/`EpsLower` layer). Scores for triage
  unchanged in kind: the pilot confirms effort ≈ S for the conditional layer and relocates
  all remaining risk to the hQRH port, exactly as the dossier's F2/F5 predicted.
