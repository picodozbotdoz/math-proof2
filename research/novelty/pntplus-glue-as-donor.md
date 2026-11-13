# PNT+ glue as donor — Γ-bounds discharge, Hadamard/Λ-FE/convexity consumers, upstream registration

Lane A1 (axiommath-surveyor), Cycle 2, 2026-11-13 (task A1-3). **This file deepens §(d) of
`research/novelty/axiommath-as-donor.md` (A3)** — the PrimeNumberTheoremAnd row of the donor
map — with the corpus-level finds of `research/survey/axiommath-pntplus.md` (A1-2; cited
below as "addendum §…"). All zeta23 citations verified in
`/home/doz/zcode-workdir/anthropics_formal-math/zeta23/` (v4.33 tree, read-only); all fork
citations in `/home/doz/zcode-workdir/axiommath/PrimeNumberTheoremAnd/` (on-pin build,
`axiommath-bump/logs/v2-run9.log`); upstream facts from a discarded read-only shallow clone
of `AlexKontorovich/PrimeNumberTheoremAnd @ 938912bb` (2026-11-12). One correction to A3 §(d)
is recorded in §0 and §(d) below (upstream StrongPNT).

## 0. The one fact that reframes §(a): zeta23's GammaFacts is NOT an open binder

`Zeta23.GammaFacts` (structure, `Zeta23/Hypotheses.lean:126–138`; 9 fields: `even`,
`smooth`, `monotoneOn`, `mu_zero_le`, `neg_one_lt_mu_zero`, `stirling` — μ(τ) =
(1/2π)log(|τ|/2π) + O(τ⁻²), `deriv_bound`, `int_mu`, `int_mu_sq`) is **proved inside zeta23**:
`Zeta23.gammaFacts : GammaFacts` at `Zeta23/GammaFacts/Complete.lean:30`, assembled as
`gammaFacts_of_stirling StirlingVert.mu_stirling` — even/smooth in `GammaFacts.lean:60,96`
(unconditional), monotonicity/μ-bounds/deriv_bound via the digamma partial-fraction series
(`GammaFacts/Mu.lean`, route documented `GammaFacts.lean:24–27`), the vertical-line Stirling
ψ(w) = log w − 1/(2w) + O((Im w)⁻²) for 0 < Re w ≤ 1 proved **without Euler–Maclaurin** in
`GammaFacts/StirlingVert.lean` (header :6–17; constant C = 20/2π, `Complete.lean` header :11),
the two μ-integrals in `GammaFacts/IntMu.lean`. So the (hΓ) binders are a modularity device
with an in-tree discharge on the v4.33 tree. **The donor question is therefore a port-cost
question**: when a pilot ports a zeta23 layer to our pin (v4.36.0-rc2), which parts of the
GammaFacts tree must be ported, and can the fork's already-built Γ material replace them?

## (a) Γ-bounds discharge assessment

**Inventory of Γ-class binders in zeta23** (grep `(hΓ` intersect theorem/lemma, 2026-11-13):
**62 statement-level carriers**, clustering into six layers:

| Layer (binder) | Representative carriers (file:line) | Fork quintet discharge? |
|---|---|---|
| RvM: `hΓ : GammaFacts` | `RvM/MainTerm.lean:482 rvM_main`, `:465 rvM_main_aux`, `RvM/Statement.lean:20 riemannVonMangoldt`, `RvM/GammaSide.lean:161,165` | **MOOT** — on our pin consume V2's unconditional `ZetaZeros.riemannVonMangoldt` (`ZeroCount/RiemannVonMangoldt.lean:465`) instead; no Γ anywhere in that route (addendum §5) |
| Explicit formula: `explicitFormulaPaper_of_lit (hEF) (hΓ)` | `ExplicitFormula/Bridge.lean:191` (plus `abs_mu_le_of_gammaFacts` `:94`) | **PARTIAL** — see field-by-field below; the μ-Stirling and μ-integrals have no fork analogue |
| Prime-side engine: `prop_trace(_mu)`, `eq_Msplit`, `prop_cross_*`, `prop_mumu`, `lem_ends`, `nuBound_eventually` | `PrimeSideA.lean:58,300,380,408,428,449`; `PrimeSideA/MuMu.lean:41,160,224`; `PrimeSideA/Ends.lean:11,130` | same — needs the full μ-record |
| π-side: `nuX_abs_le(_window)` | `PiFacts.lean:211,409` | same |
| λ-families: `thmA/B/C_lam` (section vars `hEF hRvM hMV hΓ`) | `Final.lean:79,99,119` with `PaperInputs.of_literature hEF hRvM hMV hΓ` (`Final.lean:51`) | same |
| χ-side: `hΓq : GammaFactsChi κ q` (conductor-q analogue, `muq κ q`, Stirling centered at (1/2π)log(q|τ|/2π)) | structure `ThmE/Hypotheses.lean:97–111`; bounded-constant discharge `GammaFactsChiBounded` `:205` → `:222`; carriers `ThmE/MuMuChi.lean:38,150,213`, `ThmE/EFLitChi.lean:249`, `ThmE/PrimeSideChi.lean:820,1122,1375` | **NO** — fork has no conductor-dependent digamma content at all |

**The fork's Γ material, field by field** (all in
`PrimeNumberTheoremAnd/Mathlib/Analysis/SpecialFunctions/`, on-pin, built green inside
v2-run9):

| Fork declaration | What it proves | GammaFacts field(s) it serves |
|---|---|---|
| `Complex.hasSum_digamma` — `Gamma/DigammaSeries.lean` (docstring :21–29, main list :43): `digamma z = −γ_E + ∑' n, (1/(n+1) − 1/(n+z))` off −ℕ | the classical partial-fraction series | **Substrate for `monotoneOn`, `mu_zero_le`, `neg_one_lt_mu_zero`, `deriv_bound`** — exactly the route zeta23's `GammaFacts/Mu.lean` takes from its own `Zeta23.DigammaSeries` (imported at `StirlingVert.lean:18`); termwise monotonicity/differentiation carry over unchanged |
| `Gamma/CriticalLineDecay.lean` (`gamma_half_vertical_norm_sq` :42, `gamma_half_vertical_norm_le_exp`) | ‖Γ(1/2+iτ)‖² = π/cosh(πτ), exponential decay | none of the nine (‖Γ‖-level, not Re-digamma-level) |
| `Gamma/GammaStirlingAux.lean` (`norm_sub_real_le` :39, `prod_norm_le_pow`, `Gamma_iterate`) | FE-shifting algebra for strip bounds (DLMF §5.11-adjacent) | none directly; aux for StripBounds |
| `Gamma/IntegralBounds.lean` (`norm_le_Gamma_re` :62, `norm_le_one` :79), `Gamma/StripBounds.lean`, `GammaBounds.lean` (Γ_ℝ derivative bounds) | ‖Γ‖ bounds in half-planes/strips, Deligne Γ_ℝ factors — "finite-order estimates for completed zeta functions" (module docstrings) | none of the nine |

**Verdict (a): PARTIAL — the quintet discharges the series-derivable four fields'
*substrate*, not the record.** Concretely: porting zeta23's Γ-layer to our pin needs
`GammaFacts/Series+Mu` (~the digamma route) **or** the fork's `Complex.hasSum_digamma` as an
on-pin replacement — but `stirling` (μ-shaped, C = 20/2π) and `int_mu`/`int_mu_sq` must come
from porting `GammaFacts/StirlingVert.lean` + `GammaFacts/IntMu.lean` regardless; the fork has
no Re-digamma-on-the-1/4+iτ/2-line object (μ is zeta23-proprietary). No fork content touches
`GammaFactsChi κ q`.

**Consumers, per the task list:**

- **Dossier 21** (demoted, absorbed into 02): its zeta23 layer was the ThmD λ-family —
  Γ-port on the critical path of any revival; unchanged, no fork shortcut (A3 §(e) verdict
  stands).
- **Dossier 40** (Ξ_K′): the XiPrime stack carries `GammaFacts` too
  (`Zeta23/XiPrime/{Statement,Inputs,ZeroCount}.lean`), so a 40 port inherits the same
  four-substrate + StirlingVert/IntMu split; A3 §(e)'s "convenience alternates" note
  (RiemannZetaHadamard, V2 Backlund) is unaffected.
- **Dossier 42 / M4**: ζ-column now from V2 (Γ-free); the χ-column (ThmE port) carries
  `GammaFactsChi` — **no fork substitute; the ThmE Γ_χ port is an irreducible line item**
  (consistent with A3 §(c) verdict 4).
- **Pilot 20 Card20 `gamma` field** (transcription of `Hypotheses.lean:125–138`,
  `pilots/20-blueprint.md` §1): if M2 resumes, the field can be discharged from a ported
  `gammaFacts`, with the fork's `hasSum_digamma` replacing `Zeta23.DigammaSeries` in the Mu
  route — a measured S-sized softener, not a bypass.
- **70-series hooks** (A3 §(c) feeder: ζ_K average / simple-or-on-line analogues): ζ-side
  Γ-free via V2; χ-side same ThmE obstruction as 42.

## (b) Hadamard / Λ-FE / convexity glue — consumers

The load-bearing fact (not in A3's map): **the fork's Hadamard product is already consumed,
transitively, by the entire V2 proportion package** — `ZetaZerosV2/ZetaZeros/Landau/Formula.lean:8–9`
imports `PrimeNumberTheoremAnd.Mathlib.Analysis.Complex.DivisorFiber` +
`…NumberTheory.LSeries.RiemannZetaHadamard`, and `Landau/Formula.lean:170
exists_logDeriv_riemannZeta_eq_add_tsum_allZeros` (the log-derivative-over-zeros expansion)
feeds `PairCorrelation/FromLandau.lean:52 pairCorrelationFormula` → BGST →
`simple/distinct_proportion_lower` (`Main.lean:47,88`). So:

| Glue decl (fork, file:line) | Active consumer | Concrete statement it enables | Verdict |
|---|---|---|---|
| `Mathlib/NumberTheory/LSeries/RiemannZetaHadamard.lean` (canonical genus-1 products for `completedRiemannZeta₀`/`riemannXi`; main-results docstring) | **V2's Landau formula** (import `Landau/Formula.lean:9`) — and thereby **pilot 42-M4** (A3 §(c): the V2 swap) and the 70-series ζ_K analogues off the same chain | `exists_logDeriv_riemannZeta_eq_add_tsum_allZeros` (`Formula.lean:170`) = the ζ-side log-derivative zero-sum — the same shape dossier 20's `ef` field and zeta23's `WeilEF` state for ζ | **Consumed (transitively, already shipped)** — no new work needed; record as evidence, not as a task |
| `Mathlib/NumberTheory/LSeries/RiemannZetaConvexity.lean:38 norm_riemannZeta_ratio_le_on_verticalLine` | V2's ζ bounds: import at `ZetaZerosV2/ZetaZeros/Analytic/ZetaBounds.lean:12` | V2's strip bounds feeding `ZeroCount/` and `Landau/` | **Consumed (V2)**; for OUR pilots: an on-pin alternate for pilot 20-M2's E5 contour ζ-bound inputs (A3 §(b) Card20 `rvm`-adjacent contour prerequisites) — convenience alternate, not on the critical path |
| `Mathlib/NumberTheory/LSeries/ZetaFunctionalEquation.lean:30 zeta_functional_equation` (asymmetric Λ form for mathlib's Λ) | none found in the six repos beyond PNT+ itself; our pilots used mathlib's symmetric `completedRiemannZeta_one_sub` (pilot 50's left-edge proof, `pilots/50/M1.lean:68` route; `RiemannZeta.lean:106`) | would enable Λ-form FE manipulations (τ ↦ 1−s bookkeeping at the Λ level) for any future explicit-formula work preferring Λ over ξ | **No active consumer; ecosystem-grade** (record for dossier 40's XiPrime-adjacent work and any WeilEF port that wants the Λ presentation) |
| `Mathlib/Analysis/SpecialFunctions/CompletedXi.lean:42 riemannXi` (+ `RiemannZetaValues`' Λ₀(1) ≠ 0) | V2 `Analytic/Basic.lean:11` imports CompletedXi | third ξ normalization in the ecosystem (vs zeta23 `XiPrime.xi`, tauceti `zetaEntireCompletion`) — duplication-audit row, not a donor gap | ecosystem-grade |
| `IEANTN/KadiriEq12Foundations`, `IEANTN/HadamardLogDerivative` | V2 `Analytic/Basic.lean:10` | ζ-side Kadiri-flavoured foundations for V2's analytic layer | consumed (V2); note these are **fork-retained IEANTN files** — stable snapshot (addendum §3(c) teorth/IEANTN port-out) |

Net for (b): **no new consumer needs wiring** — the glue's principal consumer (V2) is
already built, which is precisely what makes the 42-M4 donor swap cheap. `zeta_functional_equation`
is the one unique-on-pin decl with no consumer: register as ecosystem-grade.

## (c) Upstream registration recommendation: **DEFER (watch-list), with named triggers**

Facts observed at upstream `AlexKontorovich/PrimeNumberTheoremAnd @ 938912bb`
(2026-11-12, PR #1809-era; read-only clone, discarded):

- **Toolchain/pin:** `lean-toolchain` = `leanprover/lean4:v4.35.0`; lakefile mathlib rev =
  tag `v4.35.0`, manifest resolves `56a005855ea17e0b0958f73ec801ae140b0a1679` — a full
  mathlib generation **behind our pin** `ff2494ea` (v4.36.0-rc2).
- **Hygiene:** 272 sorry-lines, concentrated in `IEANTN/` (`TMEEMT` 77, `Dusart` 33,
  `FioriKadiriSwidinsky` 29, FKS2 trusted-numerics 22+13, `Kadiri` 14, `Buthe` 8) +
  `IwaniecKowalskiCh1` (7); the asymptotic core (Wiener, MediumPNT, **StrongPNT**,
  ZetaBounds, Perron, the whole `Mathlib/` subtree) is sorry-free; StrongPNT carries an
  in-file `#guard_msgs`/`#print axioms` = `[propext, choice, Quot.sound]`
  (`StrongPNT.lean:2906–2908`).
- **Fork↔upstream drift:** the fork's port touched 39 of the 75 `Mathlib/`-subtree files
  (`diff -rq`, this session) and the core files differ by tens–hundreds of lines
  (MediumPNT 4150→4284, Wiener 4391→4276, StrongPNT 2908→1885) — a fork rebase onto future
  upstream is a real port, not a fast-forward.
- **Motion:** last commit 2026-11-12; IEANTN is being ported **out** to `teorth/IEANTN`
  (upstream README notice, 2026-08) with trimming planned; stated goals include PNT-AP and
  Chebotarev (overlap with tauceti's `Chebotarev.lean:210 frobeniusPsi_asymptotic`).

**Recommendation: do NOT register now.** (i) No Cycle-2 critical path needs upstream-only
content: the glue that matters (§b) is on our pin via the fork and already load-bearing in
V2's build; the upstream-only StrongPNT *closes* a target (§d) rather than opening one.
(ii) The pin gap (v4.35.0 / mathlib 56a00585 vs our ff2494ea) plus the 39-file subtree drift
means registration would commit us to a rebase we have no consumer to justify. (iii) The tree
is mid-flight (IEANTN port-out). **Named triggers to register-and-port:** (T1) triage slots a
dossier-22 T2a pilot wanting the upstream Borel–Carathéodory bootstrap chain
(`StrongPNT.lean:76–1536` — the only upstream-only content our map flags as reusable);
(T2) a 70-series dossier needs PNT-AP/Chebotarev-class statements (upstream's stated next
goals); (T3) upstream itself lands on v4.36-class pins (then the fork merge becomes cheap).
Until a trigger fires, cite upstream facts (StrongPNT proved, sorry geography) as
*external-formal-prior-art*, the same register convention A5 applied to Liu-1
(`axiommath-as-donor.md` §(a) erratum).

## (d) Claims-register line (one line, for row 22 — A5 to transcribe)

> **22 (update, A1-3 2026-11-13):** Tier-2's T2b half (ψ = x + O(x·exp(−c√log x))) is
> **closed by external formal prior art** — upstream Kontorovich PNT+ `StrongPNT`
> (`StrongPNT.lean:2900`, triad axioms, v4.35.0) — formalization-only to recover on our pin
> (fork amputation at `StrongPNT.lean:1883–1885`); **T2a (quasi-RH-conditional x^{7/8+ε})
> survives as dossier 22's only open content**; prior-art-to-cite gains
> `AlexKontorovich/PrimeNumberTheoremAnd@938912bb`.

This *narrows* row 22's claim sentence (CLAIMS-REGISTER.md row 22, "first effective
PNT-class error term in the Lean ecosystem" — already RISKY) to the T2a statement; it does
not change the STRATEGICALLY DEAD / stop-at-M4 posture (TRIAGE row 22).

## Verdict summary

| Item | Verdict |
|---|---|
| Γ-bounds discharge (§a) | **PARTIAL**: fork's `Complex.hasSum_digamma` (`Gamma/DigammaSeries.lean`) is an on-pin substrate for 4 of 9 GammaFacts fields (monotoneOn, mu_zero_le, neg_one_lt_mu_zero, deriv_bound); `stirling`/`int_mu`/`int_mu_sq` require porting zeta23's `StirlingVert`/`IntMu` (no fork analogue); `GammaFactsChi` (ThmE/42-χ-column): **NO fork substitute**. RvM-layer binders: MOOT on our pin (V2's unconditional RvM) |
| Hadamard/convexity consumers (§b) | **Already consumed** by V2 (`Landau/Formula.lean:9` RiemannZetaHadamard; `Analytic/ZetaBounds.lean:12` RiemannZetaConvexity; `Analytic/Basic.lean:10–13` KadiriEq12/CompletedXi/DigammaSeries) — transitively load-bearing for 42-M4 and the 70-series ζ-column; `zeta_functional_equation`: **no active consumer, ecosystem-grade** |
| Upstream registration (§c) | **DEFER** (watch-list); triggers T1 (T2a pilot wants the BC chain), T2 (PNT-AP/Chebotarev consumer), T3 (upstream reaches v4.36-class pin); facts: v4.35.0 / mathlib 56a00585, sorry-free asymptotic core incl. StrongPNT (triad), 272 sorry-lines in IEANTN, 39/75 Mathlib-subtree drift vs fork |
| Dossier-22 register (§d) | T2b closed-by-upstream (formalization-only on our pin); T2a survives; row 22 claim narrows, posture unchanged |

## Sources consulted

- zeta23: `Zeta23/GammaFacts.lean` (all), `Zeta23/Hypotheses.lean:120–138`,
  `Zeta23/GammaFacts/Complete.lean:7–30`, `Zeta23/GammaFacts/StirlingVert.lean:6–20`,
  `Zeta23/Final.lean:19–119`, `Zeta23/ThmE/Hypotheses.lean:97–120,205–222`,
  `ThmE/{MuMuChi,EFLitChi,PrimeSideChi}.lean` (carrier greps), `XiPrime/` Γ-usage grep,
  62-carrier grep `(hΓ` ∧ theorem/lemma.
- Fork: `Mathlib/Analysis/SpecialFunctions/Gamma/{DigammaSeries,CriticalLineDecay,GammaStirlingAux,IntegralBounds,StripBounds}.lean` + `GammaBounds.lean` (docstrings + main-theorem greps), `Mathlib/NumberTheory/LSeries/{RiemannZetaHadamard,RiemannZetaConvexity,ZetaFunctionalEquation}.lean`, `Mathlib/Analysis/SpecialFunctions/CompletedXi.lean`; V2 import surface (`grep "import PrimeNumberTheoremAnd"` over `ZetaZerosV2/ZetaZeros`): `Landau/Formula.lean:8–9`, `Landau/ContourFold.lean:8`, `Landau/TruncatedPerron.lean:8`, `Analytic/Basic.lean:10–13`, `Analytic/ZetaBounds.lean:12`, `ZeroCount/ThetaAsymptotic.lean:12`.
- Upstream (discarded clone): `lean-toolchain`, `lakefile.toml` + `lake-manifest.json` (mathlib
  tag v4.35.0 → 56a00585…), `diff -rq Mathlib/` vs fork (39 files), sorry-per-file counts,
  `README.md` (IEANTN port-out notice), `git log -1` (938912bb, 2026-11-12).
- Project: `research/novelty/axiommath-as-donor.md` (A3, all sections cited),
  `research/survey/axiommath-pntplus.md` (A1-2 addendum §0–§5), `research/survey/axiommath.md`
  §4–§5, `research/pilots/20-blueprint.md` §1, `research/pilots/50/M1.lean:45,68`,
  `research/novelty/CLAIMS-REGISTER.md` rows 21/22/40/42, `research/TRIAGE.md` row 22,
  `axiommath-bump/logs/v2-run9.log`.
