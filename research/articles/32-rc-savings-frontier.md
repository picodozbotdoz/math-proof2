# The Exact Savings Frontier of the Thin-Product Certificate Class of the 3SUM/APSP Refutation

*kind: DISCOVERY (new theorem — the frontier function Γ(ε) and a phase transition; the
constants are superseded at birth, a caveat stated in the abstract and §4) ·
date: 2026-11-09 · supersedes: the earlier text of this same file (v1 2026-11-09; the
2026-11-17 revision added the crossing-existence discharge and re-verified the record) ·
artifacts: `research/pilots/32/M1.lean`, `research/pilots/32/M2.lean`,
`research/pilots/32/logs/run3-green.log`,
`research/pilots/32/logs/axcheck-final.log`,
`research/pilots/32/logs/run12-crossing-existence.log`; dossier (the candidate
research record that preceded this article)
`research/candidates/32-rc-savings-frontier.md`; blueprint
`research/pilots/32-blueprint.md`; strength bar: passes
(`research/qa/iter4-review/r2-discovery-strength.md:203–204`)*

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Thm 1 (monotonicity in γ) `lnΛ_affine`, `Rc_antitone_gamma` | PROVED-UNCONDITIONAL | none (statement domain: c ≥ 10, 0 ≤ γ < γ′) | `pilots/32/logs/axcheck-final.log:661, :664`; `run3-green.log:108` — axiom profile [propext, Classical.choice, Quot.sound] |
| Thm 2 (exact evaluation) `lnΛ_10_0`, `Rc_10_0` | PROVED-UNCONDITIONAL | none | `axcheck-final.log:655–656`; `run3-green.log:105–106` — axiom profile [propext, Classical.choice, Quot.sound] |
| Thm 3 (monotonicity in c; donor re-proved) `lnΛ_mono`, `Rc_strictAntiOn_zero`, `Rc_lt_epsStar` | PROVED-UNCONDITIONAL | none (statement domain: 10 ≤ c₁ < c₂ for `lnΛ_mono`; [10, ∞) for `Rc_strictAntiOn_zero`; c > 10, γ ≥ 0 for `Rc_lt_epsStar`) | `axcheck-final.log:662, :657, :665`; `run3-green.log:107, :109` — axiom profile [propext, Classical.choice, Quot.sound] |
| Thm 4 (key equivalence) `lt_Rc_iff_gmax` | PROVED-UNCONDITIONAL | none (statement domain: 0 < ε, c ≥ 10, γ ≥ 0) | `axcheck-final.log:618` (stage OK: 22 axiom lines, 0 sorryAx; the declaration has no direct axiom print — contained in the axiom profile by consumption, §5) |
| Thm 5 (unique crossing and frontier formula) `crossing_unique`, `membership_of_lt`, `frontier_upper`, `frontier_of_crossing` | PROVED-UNCONDITIONAL | one discharged binder — `frontier_of_crossing` carries `IsCrossing ε c*` (dischargeable by Thm 6); statement domain ε > 0, c* > 10 | `axcheck-final.log:667–670`; `run3-green.log:111–112` — axiom profile [propext, Classical.choice, Quot.sound] |
| Thm 6 (crossing existence) `crossing_exists`, `frontier_unconditional`, `frontier_formula_unconditional` | PROVED-UNCONDITIONAL | none (statement domain: 0 < ε < ε*) | `pilots/32/logs/run12-crossing-existence.log:60–66` (stage OK `:58`; M1 regression prints `:16–24`) — all seven printed M2 declarations carry [propext, Classical.choice, Quot.sound] |
| Thm 7 (phase transition and ceiling) `frontier_nonempty_iff`, `ceiling` | PROVED-UNCONDITIONAL | none (statement domain: ε > 0 for the biconditional; ε ≥ ε* for the ceiling) | `axcheck-final.log:671, :666`; `run3-green.log:113, :110` — axiom profile [propext, Classical.choice, Quot.sound] |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; no `sorry`, no `native_decide`, no
external CAS.

## Abstract

For thin-matrix products with D ≤ N^ε, Corollary 31 of the 3SUM/APSP refutation
certifies polylog-savings data structures (width c > 10, density θ ∈ (0, 0.9)) whenever
ε < R_c(γ) = ln 4/ln Λ(c, γ), γ the savings exponent. Which exponents γ can this
certificate class certify at a given ε, and for which ε does it certify anything? Theorems
5–6 prove: for every ε ∈ (0, ε*), ε* = ln 4/(5 ln 10) ≈ 0.1204, a unique crossing c*(ε) of
two explicit monotone curves exists and the achievable set is exactly
(0, gammaOf(c*(ε), 0.9)), so Γ(ε) = gammaOf(c*(ε), 0.9) with the supremum unattained;
Theorem 7 proves the sharp phase transition: the achievable set is nonempty iff ε < ε*.
Theorems 1–7 are PROVED-UNCONDITIONAL in Lean 4 against mathlib ff2494ea (hypotheses: the
stated domains only; axioms propext, Classical.choice, Quot.sound). The novelty claim —
the first exact achievable-frontier theorem for a data-structure certificate class —
concerns the frontier shape, not the constants: these are superseded at birth, Majdoddin's
coordinatewise dichotomy already reaching D ≤ N^0.172. Nearest prior work (the donor
refutation; Majdoddin; Tomar) states frozen constants and thresholds, never a frontier
function of ε.

## 1. Introduction

Corollary 31 of the 3sum-apsp refutation paper (`PaperStatements.lean:4014`) is stated as
a family of certificates indexed by (c, θ). Downstream uses pick one certificate. The
natural question — *what is the best savings exponent this family can certify at a given
range D ≤ N^ε, and for which ε does it certify anything at all?* — is answered nowhere in
the corpus or the follow-up literature, which states frozen constants, dichotomies,
threshold systematizations and technique barriers, but no exact achievable frontier for
the class (`research/novelty/VERDICTS.md` §5.2(a); the follow-up work of §4). We answer it
exactly for the certificate class as stated.

## 2. Setting and notation

Transcribed from `3sum-apsp/PaperStatements.lean`:

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

**Theorem 1 (monotonicity in γ).** For c ≥ 10 and 0 ≤ γ < γ′, ln Λ(c, ·) is affine with
slope ln 4 > 0 and positive on γ ≥ 0; hence R_c(γ′) < R_c(γ).

**Theorem 2 (exact evaluation).** ln Λ(10, 0) = 5 ln 10, hence R_10(0) = ε*.

**Theorem 3 (monotonicity in c; donor re-proved).** c ↦ ln Λ(c, 0) is strictly increasing
on [10, ∞); consequently c ↦ R_c(0) is strictly decreasing there; and R_c(γ) < ε* for all
c > 10, γ ≥ 0.

**Theorem 4 (key equivalence).** For 0 < ε, c ≥ 10, γ ≥ 0: ε < R_c(γ) ⇔ γ < gmax(ε, c).

**Theorem 5 (unique crossing and frontier formula).** For ε > 0 there is at most one
crossing c > 10. If c* is a crossing for ε, then Ach(ε) = (0, gammaOf(c*, 9/10)) and

  Γ(ε) = gammaOf(c*, 9/10),

with the supremum not attained. The hypothesis "c* is a crossing" is discharged by
Theorem 6 for every ε ∈ (0, ε*).

**Theorem 6 (crossing existence).** For every ε ∈ (0, ε*) there exists a crossing
c* > 10; it is unique (Theorem 5), Ach(ε) = (0, gammaOf(c*, 9/10)) outright, and
sSup Ach(ε) = gammaOf(c*, 9/10) — the frontier formula of Theorem 5 holds unconditionally
on this range.

Domain note. The formalized forms (`research/pilots/32/M2.lean`) carry this domain as two
explicit hypotheses on each declaration, `0 < ε` and `ε < ε*`: the bare `ε < ε*` of the
design sketch does not exclude ε ≤ 0, for which no crossing can exist (gmax(ε, c) < 0 <
gammaOf(c, 9/10)). Theorem 6 as stated quantifies over ε ∈ (0, ε*) directly, so statement
and formalization match with no weakening; the range is sharp, since at ε ≥ ε* the
achievable set is empty (Theorem 7) and a crossing would make it nonempty.

**Theorem 7 (phase transition and ceiling).** For ε > 0: Ach(ε) ≠ ∅ ⇔ ε < ε*. For
ε ≥ ε*, Ach(ε) = ∅.

Stated scope. Not claimed here: the ε-dependence of c*(ε) — continuity, strict
monotonicity in ε, and the limit Γ(ε) → 0 as ε → ε*⁻ — and the donor's Corollary 31
data-structure statement itself (§7).

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| 3sum-apsp donor: `Sec4_Rc_strictAntiOn` (`PaperStatements.lean:2319`), `Sec4_Rc_zero_tendsto` (`:2325`), `Sec4_Rc_lt_epsStar` (`:2334`), `Corollary_31` (`:4014`) | qualitative facts (R_c decreasing in c, below ε*) and the frozen-constant certificate family | ours determines the entire achievable region: the exact frontier Γ(ε) via a unique crossing (Theorems 5–6, existence proved), the phase transition at ε* (Theorem 7), and an independent re-proof of the donor's monotonicity lemmas (Theorem 3 against `Sec4_Rc_strictAntiOn`, `Sec4_Rc_lt_epsStar`); Theorem 2 proves the endpoint evaluation `Rc 10 0 = ε*`, the value the donor's limit statement `Sec4_Rc_zero_tendsto` (`:2325`) approaches — the Tendsto statement itself is not formalized here |
| R. Majdoddin, arXiv:2610.17420 (v1 2026-10-12; with its own Lean development, `github.com/Majdoddin/formal-math`), incl. Appendix A | extends the thin-product range to ε < ln4/(5 ln5) ≈ 0.172 with a coordinatewise dichotomy, and proves **technique barriers** (border-rank/shape exclusions for base identities) | constants supersede ours (ε* ≈ 0.1204 is the donor paper's anchor, not a record — the caveat is stated in the abstract); the barriers are technique-level, with no data-structure-class optimality and no frontier as a function of ε |
| Tomar, *Which Fine-Grained Lower Bounds Survive the Refutation of 3SUM and APSP?*, v4 2026-10-27 (`mefyi.com/papers/survive-3sum-apsp/survive-3sum-apsp.pdf`) | systematizes the thresholds: closed-form analysis-range formula ε*_R = 2 ln q0/(R ln R), quoting ε*₁₀ = ln4/(5 ln 10) = 0.1204 — and is explicit that such limits "limit the closed-form analysis, not the method" (its subject: which conditional lower bounds survive) | a threshold systematization, not an achievable frontier: no Γ(ε), no crossing/uniqueness shape, no non-attainment; our ε* phase transition is the exact version of what it quotes as an analysis limit |
| Karingula–Lovett, arXiv:2610.15663 / ECCC TR26-247 (2026-10-11) | a simplified proof with weaker exponents | no optimality claim (abstract-verified); no frontier |
| Saha–Ye, arXiv:2610.20297 (2026-10-14) | a faster (min,+) algorithm, Õ(N^2.9964) | algorithmic improvement, no frontier claim |
| Alman–Vassilevska Williams, arXiv:2610.06783v1 (the donor paper; class anchor) | the refutation itself; names ε*₁₀ (Thm 24/25 region: "all three fail … for every τ < 0.1204") | the anchor constant's home; no frontier function for the certificate class |

Scope statement. The claim is the **first exact achievable-frontier theorem for a
data-structure certificate class** — an exact Γ(ε) with unique crossing and phase
transition. It is not a barrier claim (Majdoddin proves technique barriers) and not a
threshold systematization (Tomar v4); no frontier-as-function-of-ε statement for this or
the successor certificate classes appears in the corpus or the follow-up literature
(`research/novelty/VERDICTS.md` §5.2(a); prior-art hardening 2026-11-17,
`research/qa/iter4-review/a7-32-01-priorart-hardening.md`); the constants themselves are
superseded at birth, and the claim is the exact frontier shape, not the constants.

## 5. Proofs

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

**Theorem 6.** Fix 0 < ε < ε* and put B = ln 4/ε − 5 ln 10 > 0 (Theorem 2). The difference
c ↦ gammaOf(c, 9/10) − gmax(ε, c) is continuous on c > 10 (`crossDiff_continuous`). Near
10: at the witness c = 10 + B/(2·(2·L + 1/5)) the difference is negative
(`gmax_pos_near_ten`: gmax(ε, c) > 0 there, while gammaOf(c, 9/10) is small). Far out:
ln Λ(c, 0) ≥ 5 ln 10 + (c − 10)·(2L − ln(10/9))/2, so gmax(ε, c) → −∞ while
gammaOf(c, 9/10) > 0, and the difference is positive (`gmax_neg_far`). The intermediate
value theorem on a compact interval spanning the two witnesses (`intermediate_value_Icc`)
returns c* > 10 with gammaOf(c*, 9/10) = gmax(ε, c*) (`crossing_exists`). Uniqueness is
Theorem 5; its interval characterization then gives Ach(ε) = (0, gammaOf(c*, 9/10))
outright (`frontier_unconditional`) and sSup Ach(ε) = gammaOf(c*, 9/10) with no crossing
hypothesis (`frontier_formula_unconditional`). ∎

**Theorem 7.** (⇐, constructive) Let ε < ε*, so ln 4/ε > 5 ln 10. Since F is decreasing on
[10, ∞), ln Λ(c, 0) ≤ 5 ln 10 + (c − 10)L. Choose c = 10 + Δ with
Δ = (ln 4/ε − 5 ln 10)/(2L); then ln Λ(c, 0) < ln 4/ε, so gmax(ε, c) > 0, and any
0 < y < min(gmax(ε,c), gammaOf(c, 9/10)) is achieved (as in Theorem 5). (⇒) If γ ∈ Ach(ε)
via (c, θ), then ε < R_c(gammaOf(c, θ)) < ε* by Theorem 3. The ceiling is the
contrapositive. ∎

**Verification notes.** The seven lemma-level declarations (`lnΛ_pos_gamma`,
`lnΛ_decompose`, `hasDerivAt_Ffun`, `Ffun_mvt`, `kappa_pos`, `lnΛ_upper`,
`lt_Rc_iff_gmax`) have no direct axiom print anywhere in the record chain — every print
surface is theorem-only. Each is consumed by a printed theorem whose axiom profile is
[propext, Classical.choice, Quot.sound], so their axioms are contained in that set (the
"⊆" entries of §6). The axiom-audit section for `M1.lean` (`pilots/32/logs/axcheck-final.log`
from :618) prints 22 axiom lines and truncates 6 of them ("…18 more"); the 16 persisted
records carry 13 distinct names — all thirteen theorems of `M1.lean`. The M2 declarations
are all printed directly (`pilots/32/logs/run12-crossing-existence.log:60–66`).

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 1 | `lnΛ_affine`, `lnΛ_pos_gamma`, `Rc_antitone_gamma` | `pilots/32/M1.lean:133, :293, :310` | [propext, Classical.choice, Quot.sound] (`lnΛ_affine`, `Rc_antitone_gamma`); ⊆ that set (`lnΛ_pos_gamma`) | `pilots/32/logs/axcheck-final.log:661, :664`; `pilots/32/logs/run3-green.log:108` |
| Thm 2 | `lnΛ_10_0`, `Rc_10_0` | `pilots/32/M1.lean:111, :128` | [propext, Classical.choice, Quot.sound] | `axcheck-final.log:655–656`; `run3-green.log:105–106` |
| Thm 3 | `lnΛ_decompose`, `hasDerivAt_Ffun`, `Ffun_mvt`, `kappa_pos`, `lnΛ_mono`, `lnΛ_upper`, `Rc_strictAntiOn_zero`, `Rc_lt_epsStar` | `pilots/32/M1.lean:157, :161, :198, :238, :250, :272, :302, :321` | [propext, Classical.choice, Quot.sound] (`lnΛ_mono`, `Rc_strictAntiOn_zero`, `Rc_lt_epsStar`); ⊆ that set (the five lemmas) | `axcheck-final.log:662, :657, :665`; `run3-green.log:107, :109` |
| Thm 4 | `lt_Rc_iff_gmax` | `pilots/32/M1.lean:342` | ⊆ {propext, Classical.choice, Quot.sound} (no direct print; consumed by `membership_of_lt`, `frontier_upper`, `frontier_nonempty_iff`) | `axcheck-final.log:618` (stage OK: 22 axiom lines, 0 sorryAx) |
| Thm 5 | `crossing_unique`, `membership_of_lt`, `frontier_upper`, `frontier_of_crossing` | `pilots/32/M1.lean:377, :403, :416, :433` | [propext, Classical.choice, Quot.sound] | `axcheck-final.log:667–670`; `run3-green.log:111–112` |
| Thm 6 | `crossing_exists`, `frontier_unconditional`, `frontier_formula_unconditional` (+ support: `gammaOf_tendsto_ten_right`, `gmax_pos_near_ten`, `gmax_neg_far`, `crossDiff_continuous`) | `pilots/32/M2.lean:582, :646, :662` (+ `:452, :471, :504, :538`) | [propext, Classical.choice, Quot.sound] (all seven printed) | `pilots/32/logs/run12-crossing-existence.log:60–66` (stage OK `:58`; M1 regression prints `:16–24`) |
| Thm 7 | `frontier_nonempty_iff`, `ceiling` | `pilots/32/M1.lean:452, :360` | [propext, Classical.choice, Quot.sound] | `axcheck-final.log:671, :666`; `run3-green.log:113, :110` |

## 7. Limitations and open problems

- The frontier is that of *this* certificate class. Theorem C of the dossier — the ceiling
  of adaptive per-level schedules (free (m, L, t) per level, `Theorem_30` shape) — is open
  and would be the research-grade extension.
- The ε-dependence of c*(ε) flagged in §3 — continuity, strict monotonicity in ε, and
  Γ(ε) → 0 as ε → ε*⁻ — is open.
- Transporting the frontier to Majdoddin's improved class (its own (c, θ)-type
  parameterization) is the natural next instance of the same argument.

## 8. Prior work and references

**(a) Literature.**

- Alman–Vassilevska Williams, arXiv:2610.06783v1 (2026) — the donor paper (the 3SUM/APSP
  refutation); the certificate class is its Corollary 31; the ε*₁₀ naming (Thm 24/25
  region: "all three fail … for every τ < 0.1204").
- R. Majdoddin, arXiv:2610.17420 (2026) and `github.com/Majdoddin/formal-math`.
- Tomar, *Which Fine-Grained Lower Bounds Survive the Refutation of 3SUM and APSP?*, v4
  2026-10-27, `mefyi.com/papers/survive-3sum-apsp/survive-3sum-apsp.pdf`.
- Karingula–Lovett, arXiv:2610.15663 / ECCC TR26-247 (2026).
- Saha–Ye, arXiv:2610.20297 (2026).

**(b) Project artifacts.**

- Donor statement layer: `3sum-apsp/PaperStatements.lean` (definitions :2006, :2011,
  :2015, :2018, :2021, :2024; statements :2319, :2325, :2334; `Corollary_31` :4014).
- Lean sources: `research/pilots/32/M1.lean`, `research/pilots/32/M2.lean`; logs:
  `research/pilots/32/logs/run3-green.log`,
  `research/pilots/32/logs/axcheck-final.log`,
  `research/pilots/32/logs/run12-crossing-existence.log`.
- Dossier `research/candidates/32-rc-savings-frontier.md`; blueprint
  `research/pilots/32-blueprint.md`.
- `research/novelty/VERDICTS.md` §5.2(a); `research/qa/iter4-review/a7-32-01-priorart-hardening.md`
  (external sources accessed 2026-11-17); strength bar
  `research/qa/iter4-review/r2-discovery-strength.md:203–204`.
