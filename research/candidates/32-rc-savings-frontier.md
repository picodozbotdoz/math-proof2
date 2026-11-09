# Candidate dossier 32 — rc-savings-frontier

Lane R7 ("tensor-bridge"), 2026-11-09. Realizes the §3 quantitative-transfer item 3 of
`research/bridges/tensor-algebra.md` (the zeta23-PairCeiling pattern imported into 3sum-apsp).
Tags: [VERIFIED] = read in source this lane; [HYPOTHESIS] = proposed new content.

**Pick + justification (required by task):** of the two offered thirds, this dossier takes the
**PairCeiling-pattern barrier upgrade for `Rc < ε* = 0.1204`** over the OAI-`rectangularOmega`
instantiation of `Corollary_40_fail`, because the OAI route is mostly parameter instantiation of
an already parameter-universal statement (`Corollary_40_fail` quantifies over *all* reals ω ≥ 2,
per `research/survey/anthropics.md` §1.1, so committing to OAI's certified exponents repackages
rather than discovers), and because it would collide with lane R2's dossier 51 (ω→word-RAM bit
bridge) and R4's complexity dossiers 10–12. The frontier/ceiling theorem below is a new theorem
*shape* — an exact achievable-savings phase transition for a certificate class — stated neither
in 3sum-apsp nor in the source paper.

---

## Name

rc-savings-frontier

## One-line pitch

The savings function `Rc` of 3sum-apsp's thin-product machinery has an exact frontier theorem:
the two-parameter certificate class of Corollary 31 achieves precisely the open savings region
`{(ε, γ) : ∃ c > 10, θ ∈ (0, 0.9), ε < Rc c (γ(c,θ))}`, whose ε-sections are nonempty exactly
below `ε* = ln 4/(5 ln 10)` and collapse continuously to zero at `ε*` — the first
zeta23-PairCeiling-style optimality barrier proved inside an algorithms corpus.

## Precise mathematical statement

All 3sum-apsp objects below are [VERIFIED] at `anthropics_formal-math/3sum-apsp/
PaperStatements.lean` (root statement file) unless flagged: `entropy θ := −θ·ln θ − (1−θ)ln(1−θ)`
(`:2006`); `lnΛ c γ := c·ln 10 − (c/2)·H(1/c) − (c−1)·ln 3 + γ·ln 4` (`:2011`);
`Rc c γ := ln 4 / lnΛ c γ` (`:2015`); `epsStar := ln 4/(5·ln 10)` with `0.1204 < epsStar <
0.1205` (`:2018`, `Sec4_epsStar_numeric :2329–2330`); `rhoC c := 9/(c−1)` (`:2021`);
`gammaOf c θ := θ·ln(1/rhoC c)/ln 4` (`:2024`); `Sec4_Rc_strictAntiOn :2319–2321`
(`StrictAntiOn (fun c => Rc c γ) (Set.Ici 10)` for every γ ≥ 0);
`Sec4_Rc_zero_tendsto :2325–2326` (`Rc c 0 → epsStar` as c → 10⁺);
`Sec4_Rc_lt_epsStar :2334–2335` (`Rc c γ < epsStar` for c > 10, γ ≥ 0);
`Corollary_31 :4014` (for `10 < c`, `0 < θ < 0.9`, `ε < Rc c (gammaOf c θ)`: a data structure
with preprocessing/query `O(N² log² D / D^γ)` / `O(D^q log D)`, `HasDataStructure :3934`).

**Definition (certificate class and frontier).** For ε > 0 let
`Achievable(ε) := {γ > 0 | ∃ c > 10, ∃ θ ∈ (0, 0.9), γ ≤ gammaOf c θ ∧ ε < Rc c (gammaOf c θ)}`
— exactly the savings that some Corollary-31 certificate realizes at validity range `D ≤ N^ε`
— and `Γ(ε) := sSup (Achievable(ε))` (sSup ∅ := 0, mathlib convention).

**Theorem A (exact frontier, phase transition at ε*).**
(i) *(monotonicity in γ — new, elementary)* `lnΛ c γ` is affine and strictly increasing in γ
(slope `ln 4 > 0`), hence `Rc c ·` is strictly antitone in γ; in particular
`sup_γ Rc c γ = Rc c 0`.
(ii) *(exact evaluation — new)* `lnΛ(10, 0) = 5·ln 10` — an exact rational-log identity, since
`H(1/10) = ln 10 − (9/5)·ln 3` [VERIFIED numerically: 10·ln10 − 5·0.325083 − 9·ln3 = 11.51293
= 5·ln 10; the identity is `ring_nf`-provable from `Real.log` product rules]. Hence
`Rc(10, 0) = epsStar` exactly.
(iii) *(frontier formula — new)* For every ε ∈ (0, epsStar) the set `Achievable(ε)` is the open
interval `(0, Γ(ε))` with
`Γ(ε) = gammaOf c*(ε) 0.9`, where `c*(ε) > 10` is the **unique** solution `c` of
`gammaOf c 0.9 = γmax(c, ε)` with
`γmax(c, ε) := (ln 4/ε − c·ln 10 + (c/2)·H(1/c) + (c−1)·ln 3)/ln 4`;
uniqueness holds because `γmax(·, ε)` is strictly decreasing (derivative
`(−ln 10 + (1/2)(H(1/c) − ln(c−1)/c) + ln 3)/ln 4 < 0` for c ≥ 10 [VERIFIED sign at c = 10 and
asymptotically]) while `gammaOf · 0.9` is strictly increasing from 0. The sup is **not
attained** (the constraint `ε < Rc` is strict at the crossing).
(iv) *(phase transition)* `Γ(ε) > 0 ⟺ ε < epsStar`; `Γ` is continuous and strictly decreasing
on `(0, epsStar)`; `lim_{ε→epsStar⁻} Γ(ε) = 0` and `Achievable(ε) = ∅` for ε ≥ epsStar.
Consequently `epsStar` is the exact, non-attained threshold of the Corollary-31 certificate
class.

**Theorem B (ceiling packaging — the PairCeiling-pattern statement; mostly packaging of A + a
donor).** Every certificate of the class with validity range `ε` has savings `< epsStar`, and
for every `ε < epsStar` and every `γ < Γ(ε)` a certificate exists (by `Corollary_31 :4014` and
A(iii)); i.e. the class realizes exactly `(0, Γ(ε))` and nothing at `ε ≥ epsStar`. This is the
algorithms-side analogue of zeta23's bandwidth-one ceiling — "every bandwidth-one certificate
certifies at most 0.6818… simple zeros" (`ceiling_law256_signed`,
`zeta23/Zeta23/PairCeiling/Signed.lean:94`, under hypothesis `EnclOK`; pattern per
`research/survey/anthropics.md` §1.3 and `research/bridges/tensor-algebra.md` §3 item 3): a
proved optimality statement *for the method class*, whose only route to improvement is leaving
the class.

**Theorem C (adaptive-schedule ceiling). [HYPOTHESIS — the research-grade extension]**
Extend the certificate class from constant widths (one `c` for the whole recursion) to
level-adaptive schedules: sequences `(c_ℓ, θ_ℓ)` driving a multi-level Pruned composition of
the Theorem-30 shape (free per-level parameters `(m, L, t)`, `theorem30Dom :3985`,
`Theorem_30 :3994`, `Theorem_30_wanted :4002`, leaf counts `alpha/beta` with `Lemma_11 :752`,
`Eq_6 :763` [erratum 2026-11-09, H/QA: v1 cited ":758–762"; the def is at :763]). Then
the achievable savings of the adaptive class still have supremum
`epsStar` (no adaptive schedule beats the constant-width frontier). Expected proof shape: an
exchange/interchange argument — per-level savings compose multiplicatively against per-level
costs, and strict antitonicity of `Rc` in c plus affinity in γ force the optimum to a constant
schedule. Not stated anywhere; flagged as the stretch goal.

## Novelty check

Corpus-side (python scans; rg-unicode caveat from `research/qa/make-decl-index.sh` honored —
all counts below from `python3` regex walks):

- 3sum-apsp (`PaperStatements.lean` + `docs/REMARKS.md`): `frontier|phase transition|sharp|
  optimal|sSup.*Rc` → **0 hits** each; `interchange|adaptive|barrier|ceiling` → **1 hit**,
  `PaperStatements.lean:1536`, a docstring "is non-adaptive: it produces all the instances
  before it makes any oracle call" — unrelated (an oracle-reduction remark). So: no frontier,
  no supremum, no optimality statement exists in the corpus; the nearest objects are exactly
  `Sec4_Rc_strictAntiOn/zero_tendsto/lt_epsStar` (`:2319–2335`) and `Corollary_31` (`:4014`),
  all one-directional.
- zeta23: `ceiling_law256_signed` (`Signed.lean:94`) + `ceiling_stability`/`ceiling_nearCUE_*`
  exist — the *pattern donor*, not the statement: those bound simple-zeta-zero certificates,
  nothing in 3sum-apsp consumes or mirrors them.
- mathlib: no savings-function or certificate-class API (trivially; the needed order/limit
  API — `StrictAntiOn`, `Filter.Tendsto`, `sSup`, `Real.log` — all exists, R9 round-1 §0/§3
  context).
- openai-math: `savings` in `OAI/LinearAlgebra/MatrixMultiplication/` → 0 files; no frontier
  statement for any exponent/savings function (its `AdmissibleExponent` is an infimum
  definition, `Model.lean:88–93`, with no achievability frontier theorem).
- Cross-check vs the source paper: `docs/INDEX.md` maps all 137 statements (per
  `research/survey/anthropics.md` §0); the Section-4 statements are the `Sec4_Rc_*` trio and
  Table-1/2 entries (`ValidQueryEntry :2040`, `Table_2_query_valid :2353`) — pointwise claims;
  no frontier/phase-transition sentence exists.

Literature: `[R8 confirmation pending — round-2]`. Exact queries: "Alman Vassilevska Williams
truly subquadratic 3SUM optimal savings thin product"; "van den Brand Naslund Vassilevska
Williams conjecture refutation optimal threshold"; "savings function Rc ln Lambda data
structure frontier"; "phase transition exponent data structure preprocessing tradeoff exact
threshold"; "certificate class optimality barrier algorithm analysis". Known nearest misses:
the source paper (arXiv:2610.06783, per survey §0) itself — it proves Corollary 31 and the Rc
properties but no frontier theorem; zeta23's PairCeiling (barrier pattern in a different
domain); classical time–space tradeoff lower bounds (different certificate classes).

## Bridge analysis

- Corpora bridged: anthropics/3sum-apsp (the `Rc` machinery, `Sec4_*` donors, `Corollary_31`)
  + anthropics/zeta23 (the PairCeiling *pattern*: `ceiling_law256_signed`, `Signed.lean:94`,
  the "optimization-over-certificates" shape per survey §1.3 / bridge map §3) + mathlib
  (order/limit/log API as glue). The bridge is pattern-level, not API-level — and that is the
  point: Phase 2 identified "import the zeta23 ceiling pattern into 3sum-apsp" as a transfer
  that no single corpus can perform because none of them formalizes "certificate class ⇒ exact
  optimum" for an algorithmic savings function at all.
- Empty-zone fit: `research/bridges/tensor-algebra.md` §3 item 3 ("import the zeta23 ceiling
  pattern into 3sum-apsp — would upgrade `Sec4_Rc_lt_epsStar` from 'this Rc < ε*' to a
  class-level barrier"); shares glue with dossier 31's Meta-theorem B (noted there as I2).
- Not essential from OAI/tauceti: deliberately scoped away from the ω/exponent space of R2's
  dossier 51 and R4's dossiers 10–12 (no overlap; this dossier never touches machine models or
  matrix-multiplication exponents).

## Proof-strategy sketch

1. **γ-monotonicity (A.i):** `lnΛ` is affine in γ with slope `ln 4 > 0` (definition `:2011`);
   `Rc = ln4/lnΛ` and `lnΛ(10,0) = 5 ln10 > 0` keep the denominator positive on the parameter
   domain, so division reverses monotonicity — routine (`Real` field API).
2. **Exact evaluation (A.ii):** expand `H(1/10) = −(1/10)·ln(1/10) − (9/10)·ln(9/10)` via
   `Real.log` product/power lemmas into `ln 10 − (9/5)·ln 3` (rational-log arithmetic;
   `ring_nf` + `Real.log_mul`/`log_pow`); substitute into `:2011` at `c = 10, γ = 0` —
   new but elementary; this is the one identity the corpus's `Sec4_Rc_zero_tendsto` proof
   must contain implicitly but never states as a lemma.
3. **Frontier (A.iii):** for fixed ε ∈ (0, ε*): the achievable γ at width c fill `(0, gammaOf c
   0.9)` as θ ranges over (0, 0.9) (continuity + strict monotonicity of `gammaOf` in θ);
   the constraint `ε < Rc c γ` rewrites linearly as `γ < γmax(c, ε)` (step 1 inverts the
   division); `γmax(·, ε)` strictly decreasing (compute the derivative sign: the auxiliary
   inequality `(1/2)(H(1/c) − ln(c−1)/c) < ln 10 − ln 3` on c ≥ 10 — a one-variable calculus
   lemma, the only new analytic input) and `gammaOf · 0.9` strictly increasing from 0 ⇒ unique
   crossing `c*(ε)`, and `Achievable(ε) = ∪_{c>10} (0, min(gammaOf c 0.9, γmax(c,ε))) =
   (0, gammaOf c*(ε) 0.9)` — moderate (the genuinely new idea: recognizing the class optimum
   as a two-monotone-families crossing).
4. **Phase transition (A.iv) + ceiling (B):** `γmax(10⁺, ε) > 0 ⟺ ε < ln4/(5 ln10) = epsStar`
   (step 2); emptiness above ε* is `Sec4_Rc_lt_epsStar` (`:2334`) verbatim; attainment of every
   `γ < Γ(ε)` is `Corollary_31 :4014` + step 3; continuity/strict decrease of Γ follow from
   implicit-function bookkeeping on the crossing (or a direct ε ↦ Γ monotonicity argument
   avoiding IFT: γmax decreasing in ε pointwise in c ⇒ c* decreasing ⇒ Γ decreasing) —
   routine-to-moderate.
5. **C (flagged):** extract the per-level composition law from `Theorem_30`'s cost functions
   (`cost8/costQuery`, `:3994–3997`) + `Lemma_11` (`:752`) + `Eq_6` (`:763`), state the
   adaptive-schedule functional, and attempt the interchange argument (strict antitonicity in
   c + affinity in γ ⇒ Jensen/exchange at the optimum). Research-grade; may fail (a smarter
   adaptive schedule could in principle beat constant width — that falsification would itself
   be a new theorem pointing past ε*).
6. **Consumer check:** re-derive the Table-2 entries (`ValidQueryEntry :2040`,
   `Table_2_query_valid :2353`) as instances of the frontier — confirms the frontier is
   compatible with every certified number the corpus already prints.

## Feasibility

- F0. Target: Theorems A + B as standalone Lean theorems over 3sum-apsp's statement layer +
  mathlib order/log API; Theorem C behind them.
- F1. Entry points: mathlib `Real.log` (`Mathlib/Analysis/SpecialFunctions/Log/Base`,
  `Real.log_mul`, `Real.log_pow`), `Real.log` positivity facts, `StrictAntiOn`
  (`Mathlib/Order/Monotone/Basic`), `Filter.Tendsto`/`nhdsWithin`/`Ioi`, `sSup` on reals,
  interval calculus (`Mathlib/Order/Interval/Set/…`); corpus defs `entropy/lnΛ/Rc/epsStar/
  rhoC/gammaOf/levelsOf` (`PaperStatements.lean:2006–2031`).
- F2. Donor lemmas: `Sec4_Rc_strictAntiOn` (`:2319`), `Sec4_Rc_zero_tendsto` (`:2325`),
  `Sec4_epsStar_numeric` (`:2329`), `Sec4_Rc_lt_epsStar` (`:2334`), `Corollary_31` (`:4014`) —
  all stated in `PaperStatements.lean` and proved in the Solution layer (`ThreeSumApsp/Sec4.lean`
  exists [VERIFIED in tree]); `EndStatement.lean` word-RAM layer not needed. Port friction:
  statement layer is mathlib-importing v4.33.1 — the port-probe proved 3sum-apsp's mathlib-free
  `EndStatement.lean` elaborates verbatim on v4.36.0-rc2 (B3) and statement-level ports are S
  (§4 table); the pilot targets v4.36.0-rc2 = the local checkout, per the three-way toolchain
  split (anthropics v4.33.x / OAI v4.34.1 / mathlib+tauceti v4.36.0-rc2; OAI not needed here —
  no cross-toolchain dependency, an advantage of this pick over the rectangularOmega option).
- F3. Missing glue: (a) exact identity `lnΛ(10,0) = 5·ln 10` — S (rational-log `ring_nf`);
  (b) the one-variable derivative-sign inequality for `γmax` monotonicity — S–M (calculus on
  `H`, mathlib `Real` derivative API exists; no new analytic theory); (c) frontier assembly
  (union-of-intervals = interval; unique crossing) — M-lite set/order bookkeeping; (d)
  Theorem C — unestimated research; not part of the pilot.
- F4. Effort: **S–M** for A + B (~500–1,500 LoC: one identity, one calculus lemma, interval
  bookkeeping, two donor applications); C would push to L and is explicitly out of the pilot.
- F5. Risks: `Real.log`-of-rational normalization can be finicky (`norm_num` + `log_expansion`
  chains — mitigated: only ln 2, ln 3, ln 5, ln 10 appear); the corpus's `Sec4_*` statements
  live behind the module system (`module`/`public import`) — B3-style verbatim elaboration
  expected but must be re-checked for `PaperStatements.lean` (only `EndStatement.lean` was
  probed); `sSup ∅ = 0` convention must be handled where `Achievable(ε) = ∅` (explicitly
  folded into the definition); no external computation anywhere (contrast zeta23's `EnclOK` —
  this ceiling needs *no* external certificates, an advantage over the PairCeiling original).
- F6. Kernel-only; no `sorry`/`native_decide`/external CAS; Modal build via `lean_build.py`/
  `lean_check.py` once lake scaffolding exists (AGENTS.md convention; port-probe §1 image
  reusable).

## Significance

Upgrades the 3sum-apsp corpus's own terminal point (the frozen constants ε_T = 0.0017,
ε* = 0.1204, `D^18` — survey §2(c) "no parametrized savings-as-a-function theorem is
extracted") into the first exact optimality theorem of the PairCeiling type inside an
algorithms formalization: anyone wanting savings beyond ε* now has a *proved* barrier for the
method class, exactly as zeta23's `ceiling_law256` delimits its zero-density method. It also
completes the bridge-map §3 story (which constants transfer, which are barrier-limited) with a
theorem instead of a remark, and its Theorem C, if true, would be the first formal
no-adaptive-schedule-beats-constant result in algorithm analysis; if false, it points to a
concrete better algorithm.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank:

Lane proposal: R7 pilot (cheapest of the three — natural first Lean milestone alongside 30's
falsification file; shares 31's step-3 glue).

## F4 grade by lane R9

2026-11-09, round 5. Evidence: Modal port-probe runs 1–6 (`research/feasibility/port-probe.md`).

- **Grade: S–M — confirmed.** F5's open item ("`PaperStatements.lean` re-check needed —
  only `EndStatement.lean` was probed") remains open in the strict sense, but the
  evidence base has widened: three further 3sum/eth statement families probed clean
  (B1/B2/B3 + rounds 5–6 PairCeiling and NT-cluster statements), all v4.33→v4.36 —
  zero statement drift observed anywhere in the corpus probes to date (7 clean statement
  files, 0 drift hits). A one-warm-run `PaperStatements`-defs probe (Rc/lnΛ/epsStar block,
  ~30 defs) would close it outright; recommended as the pilot's first commit.
- **F1 confirmations**: order/log/tendsto API cited — stable; no corrections.
- Verdict: keep S–M (~0.5–1.5k LoC); the `Real.log`-rational normalization risk (F5)
  stands as the main proof-side friction.
