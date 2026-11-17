# The Exact Savings Frontier of the Corollary-31 Certificate Class for Thin Matrix Products

*kind: DISCOVERY (new theorem — frontier function Γ(ε) and phase transition; constants
superseded at birth, caveat carried in §6; passes the strength bar,
`qa/iter4-review/r2-discovery-strength.md:202`) · date: 2026-11-09 (v2 2026-11-17:
crossing-existence discharge + template upgrade) · supersedes: the v1 text of this
same file (in place; change log below) · artifacts: `research/pilots/32/M1.lean`,
`research/pilots/32/M2.lean`,
`research/pilots/32/logs/run3-green.log`,
`research/pilots/32/logs/axcheck-final.log`,
`research/pilots/32/logs/run12-crossing-existence.log`; dossier
`research/candidates/32-rc-savings-frontier.md`; blueprint
`research/pilots/32-blueprint.md`*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 (monotonicity in γ) `lnΛ_affine`, `Rc_antitone_gamma` | PROVED-UNCONDITIONAL | none (c ≥ 10, γ ≥ 0 are the statement's domain) | `pilots/32/logs/axcheck-final.log:661` and `:658` (repeats `:664`) — triad; `run3-green.log:108` |
| Thm 2 (exact evaluation) `lnΛ_10_0`, `Rc_10_0` | PROVED-UNCONDITIONAL | none | `axcheck-final.log:655–656`; `run3-green.log:105–106` — triad |
| Thm 3 (monotonicity in c; donor re-proved) `lnΛ_mono`, `Rc_strictAntiOn_zero`, `Rc_lt_epsStar` | PROVED-UNCONDITIONAL | none | `axcheck-final.log:662`, `:657`, `:665`; `run3-green.log:107–109` — triad |
| Thm 4 (key equivalence) `lt_Rc_iff_gmax` | PROVED-UNCONDITIONAL | none | stage verdict `axcheck-final.log:618` (AxPilot32_M1 OK, 22 axiom lines, 0 sorryAx) — verdict-level cite: the stage section persists 16 of 22 records (12 distinct + tail dupes; excerpt class), and this lemma declaration is elaboration-clean with no direct print yet; the wave-2 full-coverage re-run is the print of record |
| Thm 5, parameter form (unique crossing + frontier from a crossing) `crossing_unique`, `membership_of_lt`, `frontier_upper`, `frontier_of_crossing` | PROVED-UNCONDITIONAL | none (ε > 0 is the statement's domain) | `axcheck-final.log:667–670`; `run3-green.log:111–112` — triad |
| Thm 5, unconditional form (crossing exists; 2026-11-17) `crossing_exists`, `frontier_unconditional`, `frontier_formula_unconditional` | PROVED-UNCONDITIONAL | none beyond scope: `0 < ε`, `ε < ε*` (see the amendment note in §5) | `run12-crossing-existence.log:60–66` (all seven M2 theorems triad; stage OK `:58`; M1 regression triad `:16–:24`) |
| Thm 6 (phase transition and ceiling) `frontier_nonempty_iff`, `ceiling` | PROVED-UNCONDITIONAL | none | `axcheck-final.log:671`, `:666`; `run3-green.log:113`, `:110` — triad |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; no `sorry`, no `native_decide`, no
external CAS. **Crossing existence: proved — for every ε ∈ (0, ε*) the crossing exists,
so the frontier formula is unconditional parametric in that range.**

Change log (2026-11-17, lane A9 — v2 in place): (1) the §5 "What is not formalized"
paragraph's first two claims are discharged by `research/pilots/32/M2.lean` (run 12
GREEN, `run12-crossing-existence.log`) and replaced by the discharge paragraph;
(2) dated amendment note recording the `0 < ε` binder adaptation of the formalized
forms (not a silent absorption); (3) template upgrade: front matter with kind tag,
per-theorem status rows in the closed vocabulary (log lines verified against disk this
session), §6 converted to the mandatory nearest-miss table. Theorems 1–6, proofs and
§7 unchanged. Same-day post-landing passes: (4) A1 pre-check
`qa/iter4-review/a1-3x01v2-precheck.md` applied — the lemma-coverage note added to §5
(seven lemma decls elaboration-clean, direct prints owed at the wave-2 full-coverage
pass) and the `axcheck-final.log:618` cite qualified as verdict-level (the stage
section persists 16 of 22 records, excerpt class); (5) A7 prior-art hardening
`a7-32-01-priorart-hardening.md` applied — the pitch rescoped to "first exact
achievable-frontier theorem for a data-structure certificate class" and the five owed
citations added (Majdoddin App. A technique barriers, Tomar v4 thresholds,
Karingula–Lovett, Saha–Ye, AVW's ε*₁₀ naming).

---

## Abstract

The anthropics `3sum-apsp` corpus formalizes a theorem (Corollary 31): for
width c > 10 and density θ ∈ (0, 0.9), thin-matrix products with D ≤ N^ε admit
polylog-savings data structures valid whenever ε < R_c(γ) = ln 4 / ln Λ(c, γ), γ the
savings exponent. The paper records the threshold ε* = ln 4/(5 ln 10) ≈ 0.1204 and the
qualitative facts: R_c decreases in c, below ε*. We determine the **entire
achievable region** of this certificate class. With Γ(ε) := sup{γ > 0 achievable at
range ε}, we prove: (i) R_c is strictly decreasing in γ; (ii) ln Λ(10, 0) = 5 ln 10
exactly, so R_10(0) = ε*; (iii) Γ(ε) = gammaOf(c*(ε), 0.9) for a unique crossing point
c*(ε) of two explicit monotone curves, the supremum not attained; (iv) a sharp phase
transition: the achievable set is nonempty iff ε < ε*. Theorems 1–6 are
PROVED-UNCONDITIONAL in Lean 4 against current mathlib, independently of the corpus —
including, since 2026-11-17, crossing existence for every ε ∈ (0, ε*), making the
frontier formula unconditional parametric. Scoped claim: the first exact
achievable-frontier theorem for a data-structure certificate class — the follow-up
literature proves barriers and thresholds, not frontiers (§6).

## 1. Introduction

Corollary 31 of the 3sum-apsp paper (`PaperStatements.lean:4014`) is stated as a family of
certificates indexed by (c, θ). Downstream uses pick one certificate. The natural question
— *what is the best savings exponent this family can certify at a given range D ≤ N^ε, and
for which ε does it certify anything at all?* — is answered nowhere in the corpus or the
follow-up literature, which states frozen constants, dichotomies, threshold
systematizations and technique barriers, but no exact achievable frontier for the class
(`research/novelty/VERDICTS.md` §5.2(a); the follow-up sweep of §6). We answer it exactly
for the certificate class as
stated.

## 2. Definitions (transcribed from `3sum-apsp/PaperStatements.lean`)

  H(x) = −x ln x − (1−x) ln(1−x)                          (:2006)
  ln Λ(c, γ) = c ln 10 − (c/2)·H(1/c) − (c − 1) ln 3 + γ ln 4     (:2011)
  R_c(γ) = ln 4 / ln Λ(c, γ)                               (:2015)
  ε* = ln 4 / (5 ln 10)                                    (:2018)
  ρ_c = 9/(c − 1),  gammaOf(c, θ) = θ·ln(1/ρ_c) / ln 4           (:2021, :2024)

**Certificate class.** For ε > 0,

  Ach(ε) = { γ > 0 : ∃ c > 10, ∃ θ ∈ (0, 9/10), γ ≤ gammaOf(c, θ) and ε < R_c(gammaOf(c, θ)) },

and Γ(ε) = sup Ach(ε). Put gmax(ε, c) = (ln 4/ε − ln Λ(c, 0)) / ln 4 and call c > 10 a
*crossing* for ε if gammaOf(c, 9/10) = gmax(ε, c).

## 3. Main results

**Theorem 1 (monotonicity in γ).** For c ≥ 10, ln Λ(c, ·) is affine with slope ln 4 > 0 and
positive on γ ≥ 0; hence γ < γ' implies R_c(γ') < R_c(γ).

**Theorem 2 (exact evaluation).** ln Λ(10, 0) = 5 ln 10, hence R_10(0) = ε*.

**Theorem 3 (monotonicity in c; donor re-proved).** c ↦ ln Λ(c, 0) is strictly increasing on
[10, ∞); consequently c ↦ R_c(0) is strictly decreasing there, and R_c(γ) < ε* for all
c > 10, γ ≥ 0.

**Theorem 4 (key equivalence).** For ε > 0, c ≥ 10, γ ≥ 0: ε < R_c(γ) ⇔ γ < gmax(ε, c).

**Theorem 5 (unique crossing and frontier formula).** For ε > 0 there is at most one
crossing c > 10. If c* is a crossing, then Ach(ε) = (0, gammaOf(c*, 9/10)) and

  Γ(ε) = gammaOf(c*, 9/10),

with the supremum not attained.

**Theorem 6 (phase transition and ceiling).** For ε > 0: Ach(ε) ≠ ∅ ⇔ ε < ε*. For ε ≥ ε*,
Ach(ε) = ∅.

## 4. Proofs

**Theorem 2.** H(1/10) = (1/10) ln 10 − (9/10) ln(9/10) = ln 10 − (9/5) ln 3, using
ln(9/10) = 2 ln 3 − ln 10. Then ln Λ(10,0) = 10 ln 10 − 5 H(1/10) − 9 ln 3 = 5 ln 10. ∎

**Theorem 3.** For c > 1 one checks (c/2)·H(1/c) = −F(c)/2 with
F(c) = (c−1) ln(c−1) − c ln c, so ln Λ(c, 0) = c·L + ln 3 + F(c)/2 with L = ln(10/3).
F'(ξ) = ln((ξ−1)/ξ) ≥ −ln(10/9) for ξ ≥ 10. By the mean value theorem, for 10 ≤ c₁ < c₂,
ln Λ(c₂,0) − ln Λ(c₁,0) ≥ (c₂ − c₁)(L − ½ ln(10/9)) > 0, because
2L = ln(100/9) > ln(10/9) — a purely rational comparison, no bounds on e or π needed.
The statements about R_c follow since ln 4 > 0 and ln Λ > 0 on the domain; and
R_c(γ) ≤ R_c(0) < R_10(0) = ε* for c > 10. ∎

**Theorem 4.** Clearing the positive denominators ln Λ(c, γ) = ln Λ(c,0) + γ ln 4, ε and
ln 4, both sides are equivalent to (γ ln 4 + ln Λ(c, 0))·ε < ln 4. ∎

**Theorem 5.** gammaOf(·, 9/10) is strictly increasing on (10, ∞) (ln((c−1)/9) increases)
and gmax(ε, ·) strictly decreasing (Theorem 3), so two crossings coincide. Given a
crossing c*: if γ ∈ Ach(ε) via (c, θ), then γ ≤ g := gammaOf(c, θ) < gammaOf(c, 9/10) and,
by Theorem 4, g < gmax(ε, c). If c ≤ c* then gammaOf(c, 9/10) ≤ gammaOf(c*, 9/10); if c > c*
then gmax(ε, c) < gmax(ε, c*) = gammaOf(c*, 9/10). Either way γ < gammaOf(c*, 9/10).
Conversely every 0 < y < gammaOf(c*, 9/10) is achieved at c = c* with
θ = (9/10)·y / gammaOf(c*, 9/10) ∈ (0, 9/10), because gammaOf(c*, θ) = y < gmax(ε, c*). So
Ach(ε) is the open interval and Γ(ε) its right end; it is not attained. ∎

**Theorem 6.** (⇐, constructive) Let ε < ε*, so ln 4/ε > 5 ln 10. Since F is decreasing on
[10, ∞), ln Λ(c, 0) ≤ 5 ln 10 + (c − 10)L. Choose c = 10 + Δ with
Δ = (ln 4/ε − 5 ln 10)/(2L); then ln Λ(c, 0) < ln 4/ε, so gmax(ε, c) > 0, and any
0 < y < min(gmax(ε,c), gammaOf(c, 9/10)) is achieved (as in Theorem 5). (⇒) If γ ∈ Ach(ε)
via (c, θ), then ε < R_c(gammaOf(c, θ)) < ε* by Theorem 3. The ceiling is the contrapositive. ∎

## 5. Formal verification

| statement | Lean declaration (`research/pilots/32/M1.lean`) |
|---|---|
| Theorem 1 | `lnΛ_affine`, `lnΛ_pos_gamma`, `Rc_antitone_gamma` |
| Theorem 2 | `lnΛ_10_0`, `Rc_10_0` |
| Theorem 3 | `lnΛ_decompose`, `hasDerivAt_Ffun`, `Ffun_mvt`, `kappa_pos`, `lnΛ_mono`, `lnΛ_upper`, `Rc_strictAntiOn_zero`, `Rc_lt_epsStar` |
| Theorem 4 | `lt_Rc_iff_gmax` |
| Theorem 5 | `crossing_unique`, `membership_of_lt`, `frontier_upper`, `frontier_of_crossing` |
| Theorem 6 | `frontier_nonempty_iff`, `ceiling` |
| Theorem 5, unconditional form (§5 discharge, 2026-11-17) | `crossDiff_continuous`, `gmax_pos_near_ten`, `gmax_neg_far`, `crossing_exists`, `frontier_unconditional`, `frontier_formula_unconditional` (+ near-ten quantitative form `gammaOf_tendsto_ten_right`) — `research/pilots/32/M2.lean` |

Axioms of every printed theorem: `[propext, Classical.choice, Quot.sound]`
(`research/pilots/32/logs/run3-green.log:105–113`; final-sweep
`logs/axcheck-final.log:618` stage OK, 22 axiom lines, 0 sorryAx — verdict-level: the
section persists 16 of 22 records, excerpt class; run 12
`logs/run12-crossing-existence.log:60–66`, M1 regression triad `:16–24`).

Lemma-level declarations (coverage note, 2026-11-17): the lemma names in the table
above (`lnΛ_pos_gamma`, `lnΛ_decompose`, `hasDerivAt_Ffun`, `Ffun_mvt`, `kappa_pos`,
`lnΛ_upper`, `lt_Rc_iff_gmax`) are elaboration-clean (rc=0, 0 sorry) with their triad
status resting on consumption inside printed theorems — every print surface in the
record chain is theorem-only, so these have no direct axiom print yet; direct prints
are owed at the wave-2 full-coverage pass (32-M1 is staged in the sweep plan's
full-coverage list; the lemma-aware generator captures them).

**Crossing existence (discharged 2026-11-17, `research/pilots/32/M2.lean`).** For
every ε ∈ (0, ε*) the crossing exists, so Theorem 5 is unconditional parametric: the
difference c ↦ gammaOf(c, 9/10) − gmax(ε, c) is continuous on c > 10
(`crossDiff_continuous`), negative at c = 10 + B/(2·(2·Lconst + 1/5)) with
B = ln4/ε − 5·ln10 > 0, and positive far out since
lnΛ c 0 ≥ 5·ln10 + (c−10)·(2·Lconst − ln(10/9))/2 (`gmax_neg_far`); the interval
IVT (`intermediate_value_Icc`) returns c* > 10 with gammaOf(c*, 9/10) = gmax(ε, c*)
(`crossing_exists`), unique by `crossing_unique`. `frontier_unconditional` then proves
Ach(ε) = Ioo 0 (gammaOf c* (9/10)) outright and `frontier_formula_unconditional`
recovers the frontier formula with no crossing hypothesis. Still paper-level: the
ε-dependence of c* (continuity, strict decrease, Γ(ε) → 0 as ε → ε*⁻) and the donor's
Corollary 31 data-structure statement.

**Amendment note (dated, 2026-11-17 — binder adaptation, not a silent absorption).**
The formalized crossing-existence forms carry an explicit `0 < ε` hypothesis binder
(`gmax_pos_near_ten`, `crossing_exists`, and `gmax_neg_far`; likewise the ε-scope of
`frontier_unconditional`). The design's bare `ε < ε*` does not exclude ε ≤ 0, for
which no crossing can exist (gmax < 0 < gammaOf); the positive-axis binder is the
faithful reading of the article's ε ∈ (0, ε*) domain. No statement is weakened:
Theorem 5 as stated in §3 already quantifies over ε > 0.

## 6. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| 3sum-apsp donor: `Sec4_Rc_strictAntiOn` (`PaperStatements.lean:2319`), `Sec4_Rc_zero_tendsto` (`:2325`), `Sec4_Rc_lt_epsStar` (`:2334`), `Corollary_31` (`:4014`) | qualitative facts (R_c decreasing in c, below ε*) and the frozen-constant certificate family | ours determines the entire achievable region: exact frontier Γ(ε) via a unique crossing (Thm 5, now with existence proved), the phase transition at ε* (Thm 6), and an independent re-proof of the donor's monotonicity lemmas (Thm 3 replaces `Sec4_Rc_zero_tendsto` with the exact evaluation, Thm 2) |
| R. Majdoddin, arXiv:2610.17420 (v1 2026-10-12; with its own Lean development, `github.com/Majdoddin/formal-math`), incl. Appendix A | extends the thin-product range to ε < ln4/(5 ln5) ≈ 0.172 with a coordinatewise dichotomy, and proves **technique barriers** (border-rank/shape exclusions for base identities) | constants supersede ours (ε* ≈ 0.1204 is the donor paper's anchor, not a record — the caveat carried since v1); the barriers are technique-level, with no data-structure-class optimality and no frontier as a function of ε |
| Tomar, *Which Fine-Grained Lower Bounds Survive the Refutation of 3SUM and APSP?*, v4 2026-10-27 (`mefyi.com/papers/survive-3sum-apsp/survive-3sum-apsp.pdf`) | systematizes the thresholds: closed-form analysis-range formula ε*_R = 2 ln q0/(R ln R), quoting ε*₁₀ = ln4/(5 ln 10) = 0.1204 — and is explicit that such limits "limit the closed-form analysis, not the method" (its subject: which conditional lower bounds survive) | a threshold systematization, not an achievable frontier: no Γ(ε), no crossing/uniqueness shape, no non-attainment; our ε* phase transition is the exact version of what it quotes as an analysis limit |
| Karingula–Lovett, arXiv:2610.15663 / ECCC TR26-247 (2026-10-11) | a simplified proof with weaker exponents | no optimality claim (abstract-verified); no frontier |
| Saha–Ye, arXiv:2610.20297 (2026-10-14) | a faster (min,+) algorithm, Õ(N^2.9964) | algorithmic improvement, no frontier claim |
| Alman–Vassilevska Williams, arXiv:2610.06783v1 (the donor paper; class anchor) | the refutation itself; names ε*₁₀ (Thm 24/25 region: "all three fail … for every τ < 0.1204") | the anchor constant's home; no frontier function for the certificate class |

Scope statement. The claim is the **first exact achievable-frontier theorem for a
data-structure certificate class** — an exact Γ(ε) with unique crossing and phase
transition. It is not a barrier claim (Majdoddin proves technique barriers) and not a
threshold systematization (Tomar v4); no frontier-as-function-of-ε statement for this
or the successor certificate classes appears in the corpus or the follow-up literature
swept (`research/novelty/VERDICTS.md` §5.2(a); prior-art hardening 2026-11-17,
`qa/iter4-review/a7-32-01-priorart-hardening.md`); the constants themselves are
superseded at birth, and the claim is the exact frontier shape, not the constants.

## 7. Limitations and open problems

- The frontier is that of *this* certificate class. Theorem C of the dossier — the ceiling of
  adaptive per-level schedules (free (m, L, t) per level, `Theorem_30` shape) — is open and
  would be the research-grade extension.
- Transporting the frontier to Majdoddin's improved class (its own (c, θ)-type
  parameterization) is the natural next instance of the same argument.

## References

- anthropics_formal-math, `3sum-apsp/PaperStatements.lean` (lines cited above).
- R. Majdoddin, arXiv:2610.17420 (2026) and `github.com/Majdoddin/formal-math`.
- Tomar, *Which Fine-Grained Lower Bounds Survive the Refutation of 3SUM and APSP?*, v4
  2026-10-27, `mefyi.com/papers/survive-3sum-apsp/survive-3sum-apsp.pdf`.
- Karingula–Lovett, arXiv:2610.15663 / ECCC TR26-247 (2026).
- Saha–Ye, arXiv:2610.20297 (2026).
- Alman–Vassilevska Williams, arXiv:2610.06783v1 (2026) — the donor paper; the ε*₁₀
  naming (Thm 24/25 region).
- Prior-art hardening record: `research/qa/iter4-review/a7-32-01-priorart-hardening.md`
  (all sources accessed 2026-11-17).
