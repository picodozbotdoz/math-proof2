# Candidate dossier 40 — zeta-k-prime-derivative-zeros

Lane R1 (tauceti-surveyor), 2026-11-09. Realizes C1(iii) of
`research/bridges/tauceti-contributions.md` §2; companion empty zones: R5's E5
(`research/bridges/analytic-nt.md` §4 E5) is adjacent but different (E5 = heat flow Ξ_t on ζ;
40 = base change ζ→ζ_K on the derivative side). Division of labor: R5 owns dossier 20
(engine-instantiation of Theorems A–E on Hecke and ζ_K); this dossier is the **XiPrime-machine
transfer** (zeros of the *derivative* of the completed Dedekind zeta) and does not overlap 20.
Tags: [VERIFIED] / [HYPOTHESIS]. Corpus roots as in `research/survey/tauceti.md` §0;
`Zeta23/…` = `/home/doz/zcode-workdir/anthropics_formal-math/zeta23/…`.

**Honesty note up front.** The literature novelty of the headline statement (T3 below) is the
open risk of this dossier: zeros of ζ_K′ / ξ_K′ for number fields may exist in the analytic
number theory literature in weak forms (nearest misses below are genuinely uncertain). The
**provable core** is T1+T2 (structure + Speiser-type strip theorem). If R8's round-2 finds the
strip theorem for ζ_K′ in the literature, the dossier degrades to a formalization-first
candidate; the proportion theorem T3 should then be the surviving claim, with its novelty
re-checked separately.

---

## Name

zeta-k-prime-derivative-zeros

## One-line pitch

zeta23's ξ′-machine (all ξ′-zeros in the critical strip; 85.8%–86.9% of ξ′-zeros simple and on
the line), built only for ζ, transfers to the completed Dedekind zeta of a quadratic field — an
object assembled literally as `zetaEntireCompletion · completedLFunction χ_D` from TauCeti's
ξ-completion record × mathlib's Dirichlet completions, with the quadratic factorization as glue.

## Precise mathematical statement

**Setting.** `d ≠ 1` a squarefree integer, `K = ℚ(√d)` of fundamental discriminant `D`,
`χ_D := TauCeti.Multiquadratic.fundamentalDiscriminantChar` (the primitive quadratic character
of conductor |D|; [VERIFIED as the object used in
`TauCeti/NumberTheory/LFunctions/DedekindZeta/Quadratic.lean` header]). Write `Λ₀ :=
completedRiemannZeta₀` (mathlib, `Mathlib/NumberTheory/LSeries/RiemannZeta.lean:64`) and
`Λ_χ := χ_D.completedLFunction` (Tauceti, used in
`TauCeti/NumberTheory/LFunctions/Zeros/Completion/Dirichlet.lean`; mathlib counterpart
`completedLFunction`, `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:231` per R5 §1).

**Definition (the object).** `Ξ_K : ℂ → ℂ`,

```
Ξ_K s := s * (s - 1) * Λ₀ s * Λ_χ s + 1
```

equivalently, by `zetaEntireCompletion s = s*(s−1)*Λ₀ s + 1`
(`TauCeti/NumberTheory/LFunctions/Zeros/Completion/RiemannZeta.lean:33` [VERIFIED;
erratum 2026-11-09, H/QA: v1 cited :27, an `open` line — def at :33, same slip as fixed
in bridges/tauceti-contributions.md]), the
**assembly formula** `Ξ_K = (zetaEntireCompletion − 1) * Λ_χ + 1` — the K-analogue of zeta23's
`XiPrime.xi` (`ChallengeDeps/XiPrime.lean:16`: `xi = s(s−1)/2·Λ₀ + 1/2`; `Ξ_K = 2·xi·Λ_χ` away
from {0,1} [VERIFIED by inspection]). Let `Ξ_K′ := deriv Ξ_K` (mirroring `XiPrime.xiDeriv`,
`ChallengeDeps/XiPrime.lean:18`).

**T1 (structure) [VERIFIED ingredients, assembly new].** `Ξ_K` is entire; `Ξ_K 0 = Ξ_K 1 = 1`;
if `K` is imaginary (D < 0), `Ξ_K (1 − s) = Ξ_K s` for all s. (Reflection inputs:
`completedRiemannZeta_one_sub` (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:106`, R3 §1) and
the primitive-χ functional equation with root number +1 for quadratic χ — Tauceti's
`AnalyticLFunctionData.dual` reflection discipline,
`TauCeti/NumberTheory/LFunctions/Data/Basic.lean:120–152` [VERIFIED decls]; glue item (a) below.)

**T2 (provable core — Speiser-type).**
(i) `Re (Ξ_K′/Ξ_K) (s) > 0` for all `s` with `Re s ≥ 1`, `s ≠ 1` — the K-analogue of zeta23's
`xiPrime_over_xi_re_pos` (`Challenge/XiPrime.lean:72` [VERIFIED name:line]);
(ii) consequently every zero of `Ξ_K′` lies in the open critical strip `0 < Re s < 1` — the
K-analogue of `xiPrime_zeros_in_open_critical_strip` (`Challenge/XiPrime.lean:67` [VERIFIED]).
(For D < 0 the reflected half `Re s ≤ 0` follows from T1's symmetry, mirroring zeta23's
`logDeriv_xi_one_sub`/`logDeriv_xi_conj` (`Zeta23/XiPrime/ExplicitFormula/ZeroFree.lean:292,306`,
cited VERIFIED by R5 §4 E5).)

**T3 (headline, riskiest).** For K imaginary quadratic: the proportions of zeros of `Ξ_K′` with
`T < Im ρ ≤ 2T` that are simple and on the critical line have liminf ≥ the flat-window constant
0.85838 and the distinct proportion ≥ 0.92919; with the quartic window ≥ 0.86864 / 0.93432 —
i.e. the K-analogues of `xiPrime_simple_zeros_on_critical_line(_cumulative,_quartic_std,
_quartic_cumulative)` (`Challenge/XiPrime.lean:79,86,94,102` [VERIFIED names:lines]). Numerator/
denominator shapes: zeros counted via `analyticOrderAt` on `Ξ_K′` (mirror `XiPrime.xiDerivMult`,
`ChallengeDeps/XiPrime.lean:24`), denominator normalized by the ξ_K′ zero-count asymptotic
(mirror `xiDerivZeros₀_rvm`, `Zeta23/XiPrime/Final.lean:90` [VERIFIED], there stated as
`RiemannVonMangoldt xiDerivZeros₀`).

Quantifier order (Lean, T2(i)): `∀ {d : ℤ} (hd : d.IsSquarefree) (hd1 : d ≠ 1), ∀ s : ℂ,
1 ≤ s.re → s ≠ 1 → 0 < Complex.re (XiK' s / XiK s)`, with `XiK` defined as above over
`fun s => s * (s-1) * completedRiemannZeta₀ s * (fundamentalDiscriminantChar d).completedLFunction s + 1`.

## Novelty check

- **Corpus side** (rg, 2026-11-09):
  - mathlib: `rg -i -c 'dedekindZeta' Mathlib/` → hits only in
    `NumberTheory/NumberField/DedekindZeta.lean` (the Re s > 1 Dirichlet series `dedekindZeta`,
    `:50`, plus residue theorems `:57–72` [VERIFIED]) and import mentions; `rg -i -c
    'zeros? of.*derivative|zetaDeriv|deriv.*riemannZeta'` → only
    `NumberTheory/LSeries/RiemannZetaLogDeriv.lean` (log-derivative functional equation, not
    zeros of a derivative). **No completion, no derivative-zero content.**
  - tauceti: `rg -i -c 'xiDeriv|derivative of.*zeta|zeros of.*derivative' TauCeti/` → 0 (the
    three hits printed were `MFDeriv` chart calculus and unrelated). `dedekindZetaC`
    (continuation) exists but nothing about its derivative's zeros.
  - anthropics (zeta23): `rg -i -c 'dedekind' zeta23/` → **0 hits**; the XiPrime topic is
    ζ-only (`ChallengeDeps/XiPrime.lean`, `Zeta23/XiPrime/`).
  - openai-math: `rg -i -c 'dedekindZeta|xiDeriv' lean/` → **nearest miss found**:
    `OAI/NumberTheory/PrimePackets/IdealThetaXi.lean` defines `idealThetaXi`, `classThetaXi`,
    `completedThetaXi` (`:100,:232,:351`), `regularizedThetaZeta` (`:412`) over a *general*
    NumberField K, and `XiBoundary.lean` defines `completedXiBoundaryValue` (`:75`) — a
    completed number-field ξ-type object **exists in openai-math** [VERIFIED decls; content of
    the boundary theorems not yet dx-read — R2 should characterize]. No derivative-zero or
    proportion statement surfaced (`rg -i 'deriv' PrimePackets/` → no zero-side hits).
  - Object-name synonym sweep: `xiK|Xi_K|xi_K|completed.*Dedekind|Λ_K|LambdaK` over all four →
    only the openai-math files above.
- **Literature side: PENDING lane R8 round-2.** Queries R8 must run (flagged prominently per
  division note):
  1. `"zeros of the derivative" "Dedekind zeta"` and `ζ_K'(s) zeros` (zbMATH + Google Scholar) —
     the direct risk: Speiser-type / ζ′-distribution results are classical for ζ (Speiser 1881;
     Levinson–Montgomery; Ki–Kim–Lee) and studied for Dirichlet L; for ζ_K′ I know of nothing
     certain — this query decides T2's status;
  2. `"derivative of the Dedekind zeta function" critical strip` ;
  3. `"Levinson method" number field OR "Dedekind zeta" simple zeros` — decides whether any
     proportion result for ζ_K itself (not ζ_K′) exists (also affects dossier 20/42 framing);
  4. `"Farmer Gonek" derivative zeros` — the ξ′-proportion method source zeta23 builds on
     (arXiv:0803.0425); check its §/citations for number-field remarks;
  5. `"completed Dedekind zeta" xi function derivative` — the exact T3 phrasing.
- `[R8 confirmation pending]` on all five.
- **Known nearest misses**: (a) zeta23's XiPrime topic — same statements, ζ only
  (`Challenge/XiPrime.lean:67–105`); (b) openai-math `completedThetaXi` — the object family,
  no derivative theory (`IdealThetaXi.lean:351`); (c) mathlib `NumberField.dedekindZeta` +
  residue (`DedekindZeta.lean:50,57`) — uncompleted series side; (d) R5's E5 heat-flow Ξ_t
  (`analytic-nt.md` §4 E5) — t-deformation of ξ, not base change; the two candidates compose
  (Ξ_{K,t}) but that is out of scope here.

## Bridge analysis

- **Corpora bridged:** anthropics/zeta23 (XiPrime machine) × tauceti (ξ-completion record,
  quadratic factorization, Dirichlet completions) × mathlib (`completedRiemannZeta₀`,
  `analyticOrderAt`) × openai-math (nearest-miss object `completedThetaXi`, potential third
  donor of the object).
- **Why essential:** zeta23 owns the ξ′ zero-side method but has no number-field object and no
  factorization (`rg dedekind → 0`); tauceti owns `zetaEntireCompletion` (=
  2·`XiPrime.xi` [VERIFIED §1a of `bridges/tauceti-contributions.md`]) and the completed Dirichlet
  L with order-preservation (`analyticOrderAt_dirichletData_entireCompletion`,
  `Zeros/Completion/Dirichlet.lean` [VERIFIED]) but has no zero-proportion machinery at all;
  mathlib supplies the completion substrate and `analyticOrderAt`. T2's hardest step (the χ-term,
  below) exists in **no** corpus: zeta23's `xiPrime_over_xi_re_pos` is proved for ξ_ζ only.
- **Empty-zone fit:** `research/bridges/tauceti-contributions.md` §2 C1(iii); survey
  `tauceti.md` §4 ("zeros of Λ_K′" listed as stretch); R5 `analytic-nt.md` §0 headline asymmetry
  (zero side vs prime side vs substrate).

## Proof-strategy sketch

1. **Object assembly (routine).** Entirety of `Ξ_K`: `Λ_χ` entire for nonprincipal primitive χ
   (Tauceti `dirichletData_polarPolynomial_of_ne_one`-route,
   `Zeros/Completion/Dirichlet.lean` [VERIFIED]); `Λ₀` has poles only at 0,1 (mathlib);
   `s(s−1)` clears them; `+1` sets `Ξ_K 0 = Ξ_K 1 = 1`. Reflection from T1 inputs.
2. **T2 reduction (routine).** On `Re s ≥ 1, s ≠ 1`: `Ξ_K′/Ξ_K = 1/s + 1/(s−1) + Λ₀′/Λ₀ +
   Λ_χ′/Λ_χ` (logarithmic derivative of the product; `s(s−1)`-factor contributes the two
   positive-real-part terms since `Re (1/s) > 0`, `Re (1/(s−1)) ≥ 0` for `Re s ≥ 1, s ≠ 0,1`).
   So T2(i) ⟸ **Re (Λ₀′/Λ₀ + Λ_χ′/Λ_χ) (s) > 0** on the closed half-plane.
3. **HARDEST STEP (new mathematics).** zeta23 gives `Re(ξ′/ξ) > 0` for `ξ = s(s−1)/2·Λ₀+1/2`
   (`xiPrime_over_xi_re_pos`), which by step 2's algebra bounds `Re(Λ₀′/Λ₀)` from below by
   `−Re(1/s + 1/(s−1))` — not enough alone. Needed: the **χ-analogue**
   `Re(Λ_χ′/Λ_χ)(s) ≥ −(1/2)·(1/s + 1/(s−1))`-grade bound, or a direct port of zeta23's device:
   the ξ′/ξ positivity is proved in `Zeta23/XiPrime/ExplicitFormula/` off an explicit formula
   for ξ′/ξ; the χ-input EF exists as `Zeta23/ThmE/EFLitChi.lean` (EF for L(s,χ), cited VERIFIED
   by R5 §0). Port the ZeroFree-device from ξ_ζ to Λ_χ using `EFLitChi` + the reflection
   `logDeriv_xi_one_sub`-pattern. [HYPOTHESIS: the port is mechanical in structure but the
   constants/archimedean digamma terms differ; this is the dossier's genuine risk.]
4. **T2(ii) from T2(i) (routine, mirror zeta23).** If `Ξ_K′(s₀) = 0` with `Re s₀ ≥ 1`, then
   `Ξ_K′/Ξ_K` has a pole at `s₀` with positive integer residue, contradicting the positivity/
   boundedness on the boundary — replicate zeta23's `XiPrime/ZeroCount/` argument shapes.
5. **T3 (only after T2).** Full transfer of the Gram/rank–trace proportion machine: needs
   (a) a ξ_K′-zero-count asymptotic (mirror `xiDerivZeros₀_rvm`, `XiPrime/Final.lean:90` —
   needs the argument principle over Λ_K; Tauceti's
   `TauCeti.Contour.argumentPrinciple_nullHomologous`
   (`Analysis/Contour/Argument/Cycle.lean:110` [VERIFIED]) is the mathlib-side tool mathlib
   lacks per R3 §1), (b) the coefficient-moment hypotheses at K-grade (mirror
   `coeffMoments_flat_xi`, `XiPrime/Final.lean:123` [VERIFIED name]), (c) the rank–trace layer
   (shared with dossiers 01/03 ports). Mark L-effort, gated on T2.

## Feasibility

- **F0.** Target: T1 + T2 (provable core), with T3 stated as the gated extension. mathlib-ready
  phrasing given in §"Precise statement".
- **F1. Mathlib entry points** (v4.36.0-rc2 checkout `ff2494ea`): `completedRiemannZeta₀`
  (`Mathlib/NumberTheory/LSeries/RiemannZeta.lean:64`), `completedRiemannZeta_one_sub`
  (`:106`), `DirichletCharacter.LFunction`/`completedLFunction`
  (`Mathlib/NumberTheory/LSeries/Dirichlet.lean`, `DirichletContinuation.lean:231`),
  `analyticOrderAt` (`Mathlib/Analysis/Analytic/Order.lean:49`),
  `NumberField.dedekindZeta` + `dedekindZeta_residue`
  (`Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50,57`).
- **F2. Donor lemmas:** zeta23: `XiPrime.xi/xiDeriv/xiDerivMult` (`ChallengeDeps/XiPrime.lean:16–24`),
  `xiPrime_zeros_in_open_critical_strip`, `xiPrime_over_xi_re_pos`,
  `xiPrime_simple_zeros_on_critical_line(_quartic)` (`Challenge/XiPrime.lean:67,72,79,94`),
  `xiDerivZeros₀_rvm` (`Zeta23/XiPrime/Final.lean:90`), the `Zeta23/XiPrime/ExplicitFormula/`
  stack (`ZeroFree.lean:292,306`), `ThmE/EFLitChi.lean` (χ-EF). tauceti: `zetaEntireCompletion`
  + reflection (`Zeros/Completion/RiemannZeta.lean:33,53` [erratum 2026-11-09, H/QA:
:27→:33 def; :45→:53 `zetaEntireCompletion_one_sub`]), order-preservation
  (`Zeros/Completion/Dirichlet.lean`), `AnalyticLFunctionData` dual/reflection
  (`Data/Basic.lean:120–152`), `dedekindZeta_eq_riemannZeta_mul_LFunction`
  (`LFunctions/DedekindZeta/Quadratic.lean`), `argumentPrinciple_nullHomologous`
  (`Analysis/Contour/Argument/Cycle.lean:110`). Porting friction: zeta23 is Lean v4.33.0-rc2 /
  Mathlib v4.33 (per `research/survey/anthropics.md` §0 and R6 §0); tauceti and the encore
  checkout are v4.36.0-rc2 — **toolchain split**: the zeta23 XiPrime port must be re-based;
  `research/feasibility/port-probe.md` is **pending** (probe scaffolding has started:
  `research/feasibility/probe/ProbeB1_RHLinalg.lean` exists — RHLinalg only, XiPrime probe not
  yet present).
- **F3. Missing glue:** (a) definitional: identify Tauceti's `χ.completedLFunction` with mathlib's
  `completedLFunction χ` (same object family, different constructions — S); meromorphic identity
  `dedekindZetaC K = ζ·L(χ_D)` at the level of continued functions (Tauceti proves agreement on
  `Re s > 1` + normal-form uniqueness, `LFunctions/DedekindZeta/Basic.lean` — S); (b) genuinely
  absent mathematics: **the χ-analogue of step 3** (`Re(Λ_χ′/Λ_χ)` lower bound via the EF device)
  — the dossier's driver, M-grade analysis; (c) porting debt: `Zeta23/XiPrime/ExplicitFormula/`
  (~2–3k LoC estimated from dir listing) at v4.33→v4.36.
- **F4. Effort: M–L.** T1+T2 core: ~3–6k LoC (glue (a) S; step 3 driver M; XiPrime EF port
  M). T3 adds the Gram/moment/rank–trace layers: > 10k, gated.
- **F5. Risks:** (i) literature risk on T2/T3 (see Novelty) — mitigation: R8 round-2 before any
  pilot; (ii) step 3's digamma/constant bookkeeping at conductor |D| — the archimedean terms
  differ from ζ's and a uniform-in-K statement is NOT claimed (fixed K throughout); (iii)
  root-number sign: real quadratic χ (D > 0) still has ε = +1 (quadratic characters), so T1's
  reflection holds for both parities — but D > 0 vs D < 0 changes no step 2–4 logic [VERIFIED
  for characters; stated in dossier]; (iv) toolchain split (F2); (v) `analyticOrderAt` churn —
  mathlib's `ZetaZeros.lean` landed 2026-10-31 (R3 §1), neighborhood is active.
- **F6.** Kernel-only; milestones: (1) `Ξ_K` def + T1 (anchor: re-derive
  `zetaEntireCompletion_one_sub` as a special case); (2) step-2 identity; (3) step-3 χ-bound
  (the new theorem; first attempt: fixed d = −3, the Eisenstein field, where the unit group is
  largest and constants kindest — cross-ref openai-math's ℚ(√−3) Hecke family, R5 §4 E1);
  (4) T2; (5) gated T3. Modal build per math-proof1 (`lean_build.py`/`lean_check.py`).

## Significance

First zero-side theory for a completed number-field zeta's *derivative*: it extends the
zeta23 ξ′ topic (itself a beyond-paper addition) across the Dirichlet×Dedekind boundary and
creates the first three-corpus object (zeta23 method × tauceti record × mathlib substrate;
openai-math's `completedThetaXi` shows a fourth corpus pointing at the same object). If T3
survives R8, it is a new proportion theorem in the Alpöge–Furman/Farmer–Gonek line; if not,
T2 is still the first formal Speiser-type theorem beyond ζ.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

**Lane proposal (R1, non-binding):** Novelty 4 risk-adjusted (5 if R8 confirms T3 absent;
2–3 if ζ_K′ strip results exist), Significance 3, Effort 4 (M–L; the χ-bound is the driver)
→ proposed rank ≈ 3.0, **conditional on R8 round-2**: do not pilot before that check clears.

## F4 grade by lane R9

2026-11-09, round 4. Evidence: Modal port-probe runs 1–6; tauceti `lean-toolchain` read
directly (`research/feasibility/port-probe.md` §§1–8).

- **Grade: M–L — confirmed, with the toolchain-split risk HALVED by measurement.** The
  dossier's F2/F5(iv) "toolchain split" concern decomposes, and both halves now have data:
  (i) **tauceti side: zero port friction** — `tauceti/lean-toolchain` =
  `leanprover/lean4:v4.36.0-rc2`, *identical* to the encore checkout; tauceti donors
  (`zetaEntireCompletion`, `AnalyticLFunctionData`, `argumentPrinciple_nullHomologous`, …)
  can be a lake dependency as-is, no re-basing. (ii) **zeta23 side: statement ports measure
  ≈ 0** — NT-family statements now probe-verified directly: the submitted A–D shapes plus
  the `ChallengeDeps` counting defs elaborate as hypothesis-binder types against v4.36 with
  **0 errors, 0 warnings** (`ProbeE_Zeta23Binder.lean`, runs 5–6); the LinAlg spine was
  already clean (`ProbeB1`). Residual port debt is confined to the XiPrime EF *proof* stack
  (~2–3k LoC, F3(c)) — the M part of M–L; the step-3 χ-analysis driver stays the L-leaning M.
- **F1 confirmations**: `completedRiemannZeta₀`, `analyticOrderAt`, `riemannZetaZeros`
  family all probe-verified OK (runs 1–2); F5(v) churn risk unchanged.
- No F1 corrections needed. Verdict: keep M–L for T1+T2 core; the port line-item shrinks
  from "re-base zeta23" to "port XiPrime EF proofs only".
