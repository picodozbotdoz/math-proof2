# Candidate dossier 31 — budgeted-split-meta-theorem

Lane R7 ("tensor-bridge"), 2026-11-09. Realizes empty-zone candidate (a) of
`research/bridges/tensor-algebra.md` §4. Tags: [VERIFIED] = read in source this lane;
[HYPOTHESIS] = proposed new content. Boundary notes: R4's dossiers 10–12 own the
complexity-triangle machine-model comparisons (3sum-apsp ↔ eth ↔ mathlib computability);
R2's dossier 51 owns ω→word-RAM bit-complexity transfer; R1's dossier 41 owns the eight-square
parity chain (cite, don't re-derive). This dossier owns the *abstract improvement-operator
interface* unifying the two tensor-decomposition→algorithm recursions.

---

## Name

budgeted-split-meta-theorem

## One-line pitch

A single abstract "level system" structure — an improvement operator on exponent pairs with a
contraction bound or an antitone-savings parameter — proves once and for all the two schema
theorems that eth's `LevelProposition ⇒ eStarZero` pipeline and 3sum-apsp's `Rc → ε*`
savings analysis currently each re-prove from scratch inside incompatible machine models,
making every future "decomposition ⇒ algorithm" argument (openai-math's `AdmissibleExponent`
machinery included) a typeclass-instance check instead of a bespoke schedule construction.

## Precise mathematical statement

Honest scoping first: the full "abstract tensor category" version (budgeted splits of an
arbitrary tensor, rank → speedup over any model) is **out of reach** — no corpus has a
tensor-rank API (R9 round-1 #8: mathlib `rg "strassen|tensor.?rank|border.?rank|…"` → only
prose; tauceti: 0 real hits, python-verified — its one "Strassen" match is Strassen's theorem
in optimal transport, `MeasureTheory/OptimalTransport/MetricMeasure/GromovProkhorov.lean:54`).
The weakest version that is still new is the **improvement-operator abstraction** over the
two existing, fully formalized one-level transformations. All objects below [VERIFIED] in
source unless flagged.

**Definition (LevelSystem).** A `LevelSystem` is data
`(P : Type, e : P → ℝ, A : P → Prop, K₀ : ℕ, ρ : ℝ, T : ℕ → P → P)` — `P` a class of
"certificates at a scale" with exponent `e`, predicate `A` ("achievable"), one-level
transformation `T` indexed by a width `K` — satisfying:

- (L1) *realizability:* ∀ K ≥ K₀, ∀ p, `A p → A (T K p)`
  [abstracts eth `GroupingLemma` (`PrintedStatement.lean:157`) + `LevelProposition`
  (`:164`): `Achievable K e → Achievable ((3·K⁸)²) ((Eight.rho + 2/K)·e + 2/K)`];
- (L2) *contraction:* `1/2 ≤ ρ < 1` and ∀ K ≥ K₀, `e (T K p) ≤ (ρ + 2/K)·(e p) + 2/K`
  [eth's printed constant; the abstract theorem is quantified over any such ρ];
- (L3) *monotone achievability:* `A p → e p ≤ e' → A p'` with `e p' = e'`-weakening
  [abstracts eth `StMono` (`PrintedStatement.lean:87`)];
- (L4) *base points at unbounded scale:* for every scale bound there is an achievable `p`
  with `e p ≤ 1/2` [abstracts eth `StHalf` (`:94`) + the "infinitely many K" reading of
  `eStar` (`:90`)].

**Meta-theorem A (geometric extinction).** For any `LevelSystem`: defining
`e* := sInf {e' | ∀ scale bound ∃ p, A p ∧ e p ≤ e'}`, one has `e* = 0`, with the explicit
schedule `e_ℓ ≤ 0.85·ρ^ℓ` for the canonical iteration `p_{ℓ+1} = T (K_ℓ) p_ℓ`
(`K₀ = 2^{x₀}`, `x₀ ≥ 18`) — i.e. exactly the conclusion shape of eth's
`Levels.Gen.PartA` (`proof/statements/LevelsStatement.lean:39–48`: `e_ge : ρ^ℓ/2 ≤ e_ℓ`,
`e_le : e_ℓ ≤ 0.85·ρ^ℓ`) and `Given.eStarZero` (`threesat/Given/End.lean:38`,
alias `PaperIndex.levelHence`, `PaperIndex.lean:1145`), proved once, abstractly.

**Definition (AntitoneSavings).** An `AntitoneSavings` system is `(u : ℝ → ℝ, c₀, u* : ℝ,
Cert : ℝ → Prop)` with `u` strictly antitone on `[c₀, ∞)` (abstracts
`Sec4_Rc_strictAntiOn`, `3sum-apsp/PaperStatements.lean:2319–2321`:
`StrictAntiOn (fun c => Rc c γ) (Set.Ici 10)` for every γ ≥ 0),
`Filter.Tendsto u (nhdsWithin c₀ (Ioi c₀)) (nhds u*)` (abstracts `Sec4_Rc_zero_tendsto`,
`:2325–2326`), and `Cert c → u c < u*` (`Sec4_Rc_lt_epsStar`, `:2334–2335`), where `Cert c`
is "a certificate with width-c parameters exists achieving savings `u c`".

**Meta-theorem B (ceiling).** For any `AntitoneSavings` system: `sSup {u c | c > c₀} = u*`,
non-attained; consequently the achievable-savings set of the class is an interval with
supremum `u*` and no element reaches it.

**Instantiation theorem I1 (eth instance; statement).** The eth data
`P := {(K, e) | Achievable K e}` (`Achievable`, `PrintedStatement.lean:83–84`),
`T K (K', e') := ((3·K⁸)², (Eight.rho + 2/K)·e' + 2/K)` with `Eight.rho = 11/12`
(`EightSquareStatement.lean:99`) is a `LevelSystem`, and Meta-theorem A re-derives
`EStarZero` (`PrintedStatement.lean:167`). [HYPOTHESIS that this is *literally* an instance:
hypotheses (L1)–(L4) are theorem-shaped and all four eth inputs are proved
(`GroupingLemma :157`, `LevelProposition :164`, `StMono :87`, `StHalf :94`);
what must be re-proved abstractly is only the schedule arithmetic that eth carries out in
`Levels.Gen` — which is already ρ-parametric (`LevelsStatement.lean:34–36`,
`e ρ x₀ : ℕ → ℝ` with hypotheses `1/2 ≤ ρ → ρ < 1`), so the abstraction mostly re-homes a
finished argument. The genuinely new content is the interface, not the eth-side proof.]

**Instantiation theorem I2 (3sum-apsp instance; statement).** The data
`u c := Rc c 0` with `Rc c γ := log 4 / lnΛ c γ` (`:2015`), `lnΛ c γ := c·ln 10 − (c/2)·H(1/c)
− (c−1)·ln 3 + γ·ln 4` (`:2011`), `c₀ := 10`, `u* := epsStar := ln 4/(5·ln 10)`
(`:2018`, with `0.1204 < epsStar < 0.1205`, `Sec4_epsStar_numeric :2329–2330`) is an
`AntitoneSavings` system; Meta-theorem B yields `sSup {Rc c 0 | c > 10} = epsStar`
(non-attained). [HYPOTHESIS on the literalness: strict antitonicity and the limit are donated
(`:2319`, `:2325`); the new lemma is the exact-evaluation identity `lnΛ(10, 0) = 5·ln 10`
— an exact rational-log identity, since `H(1/10) = ln 10 − (9/5)·ln 3` — which upgrades
"tendsto" to "sup = value". The full frontier/phase-transition theorem (achievable set =
exactly the region below ε*) is dossier 32's `32-rc-savings-frontier.md`; I2 here is the
thin instance.]

## Novelty check

Corpus-side (python scans over the four corpora; rg-name caveat from
`research/qa/make-decl-index.sh` header honored):

- Pattern `BudgetedSplit|LevelRecursion|asymptotic sum|speedup synthesis` over mathlib,
  tauceti, openai-math/OAI, anthropics → **1 false positive** (`tauceti/Analysis/
  Pseudodifferential/Symbol/Topology.lean`, unrelated "asymptotic sum" phrase). No corpus has
  the abstraction.
- OAI's nearest object is `AdmissibleExponent` / `omega` / `rectangularOmega`
  (`openai-math/lean/OAI/LinearAlgebra/MatrixMultiplication/Model.lean:88–107`) — a closure
  predicate on exponents, *not* an improvement-operator interface; `schonhage|laser` words →
  0 hits in OAI's MM directory (python). eth's `Levels.Gen` is the closest existing "schedule"
  theory but is hard-wired to `Achievable`/clique grids; 3sum-apsp's `Sec4_Rc_*` is hard-wired
  to the thin-product data structures. Nothing connects them (bridge map
  `tensor-algebra.md` §1.1, last two rows).
- tauceti: `strassen|tensor rank|border rank` → 0 real hits (python + manual review of the one
  optimal-transport "Strassen"); mathlib: R9 round-1 #8 CONFIRMED (no tensor-rank algebra,
  only `Holor.CPRankMax` predicates, `Data/Holor.lean:253`, per port-probe §5.4).

Literature: `[R8 confirmation pending — round-2]`. Exact queries: "speedup synthesis tensor
decomposition abstract recursion"; "Schönhage asymptotic sum theorem"; "Strassen asymptotic
spectrum laser method abstraction"; "master recurrence exponent improvement algorithm tensor
rank"; "Alman Vassilevska Williams savings function Rc thin product". Known nearest misses:
Schönhage's asymptotic-sum theorem (1981) and Strassen's asymptotic spectrum (theory of
subrank/degeneration) are the classical "decomposition ⇒ speedup" theorems — but they live
inside *one* model (bilinear complexity over fields) and are formalized nowhere (openai-math
re-proves its spectral route from scratch for ω ≤ 9/4 per survey §3, "Strassen's spectral
theory is re-proved rather than cited"). The two-schema abstraction over *machine-model-graded
certificates* (query machines / word RAM) is not in the literature traced so far.

## Bridge analysis

- Corpora bridged: anthropics/eth + anthropics/3sum-apsp (the two one-level transformations),
  with mathlib as the order/limit substrate (`Filter.Tendsto`, `StrictAntiOn`, `sSup`) and
  openai-math's `AdmissibleExponent` as the designated third (future) instance.
- Why essential: eth's transformation exists only inside `Achievable`/query-machine theory
  (`PrintedStatement.lean:77–84`); 3sum-apsp's only inside `Problem.SolvedInTime`/`Instr`
  word-RAM programs (`EndStatement.lean`, imports nothing — port-probe B3 verified it
  elaborates verbatim on v4.36.0-rc2); the shared "exponent pairs improved by a schedule"
  shape exists in neither (Phase-1 survey §4: "the two never share API… which is itself an
  empty zone"). The meta-theorem needs both donors' exact constants — `g = 3K⁸` from
  `GroupingLemma :158`, `lnΛ` from `:2011` — to instantiate.
- Empty-zone fit: `research/bridges/tensor-algebra.md` §4(a) ("decomposition ⇒ algorithm"
  meta-theorem), §1.1 rows 7–9.

## Proof-strategy sketch

1. Define `LevelSystem` as a Lean structure with fields (L1)–(L4) (pure Prop bookkeeping; S).
2. Prove Meta-theorem A by transplanting eth's `Levels.Gen.PartA` proof
   (`LevelsStatement.lean:23–48`): the closed form `log K_ℓ = (3x₀+6)·2^ℓ − 6ℓ − 2x₀ − 6`,
   `K_{ℓ+1} ≤ K_ℓ^{10}`, and the induction `e_ℓ ≤ 0.85·ρ^ℓ` — this argument uses only (L1)–(L4)
   and field arithmetic of ℝ; eth's version is already parameterized in ρ
   (`e ρ x₀`, hypotheses `1/2 ≤ ρ → ρ < 1`, `:43–44`), so the transplant is mechanical
   (routine). The abstract packaging (sup over scale bounds = 0) is the one new inference.
3. Prove Meta-theorem B from the two donated hypotheses (`:2319`, `:2325`) plus the exact
   evaluation `lnΛ(10,0) = 5·ln 10` — new but elementary: expand `H(1/10) = −(1/10)ln(1/10) −
   (9/10)ln(9/10)` into logs of rationals (`Real.log` lemmas), `ring_nf` (routine-to-moderate;
   the only genuinely new lemma in I2).
4. I1: assemble the instance from the four eth donors (`GroupingLemma :157`,
   `LevelProposition :164` at `Eight.rho = 11/12`, `StMono :87`, `StHalf :94`); conclusion is
   `EStarZero` by Meta-theorem A + `eStar` def (`:90`) (plumbing).
5. I2: assembce from `Sec4_Rc_strictAntiOn`/`Sec4_Rc_zero_tendsto`/`Sec4_Rc_lt_epsStar`
   (`:2319–2335`) + step 3 (plumbing). Note for I1-adjacent parity content: eth's
   parity/level chain (change_Q etc.) is dossier 41's territory (R1) — cite, do not re-derive.
6. Optional third instance (flagged future work, not in the pilot): OAI
   `AdmissibleExponent` closure (`Model.lean:88–104`) as a `LevelSystem` with trivial
   contraction — needs the OAI v4.34.1 toolchain reconciliation (survey openai-math §4
   "watch the toolchain gap").

## Feasibility

- F0. Target: `LevelSystem` structure + Meta-theorems A and B + instances I1, I2 as Lean
  theorems over mathlib with the two anthropics statement layers imported.
- F1. Entry points: mathlib `Filter.Tendsto`/`nhdsWithin`/`Ioi`, `StrictAntiOn`
  (`Mathlib/Order/Monotone/…`), `Real.log` API, `sSup`/`ciSup`; eth statement files
  (`PrintedStatement.lean`, `LevelsStatement.lean`, `EightSquareStatement.lean` —
  statement-only, mathlib-imports-only); 3sum-apsp `PaperStatements.lean` defs
  (`Rc/lnΛ/epsStar :2011–2018`, `Sec4_* :2319–2335`) and `EndStatement.lean`.
- F2. Donor lemmas: eth `Levels.Gen.PartA` (`LevelsStatement.lean:39–48` — the schedule
  arithmetic; transplant, not port, since it is ρ-parametric already),
  `GroupingLemma`/`LevelProposition`/`StMono`/`StHalf` (`PrintedStatement.lean:87–164`);
  3sum-apsp `Sec4_Rc_*` trio (`:2319–2335`; statements proved in the Solution layer —
  `ThreeSumApsp/Sec4.lean` exists [VERIFIED in tree]). Port friction: eth/3sum-apsp were
  built on Mathlib v4.33.x; the port-probe (§4 table) shows statement-level porting is S
  (B1/B2/B3 all elaborate clean on v4.36.0-rc2) while proofs are tactic-churn M — hence the
  pilot should import statement layers and re-prove the thin glue, not port proofs.
- F3. Missing glue: (a) the `LevelSystem`/`AntitoneSavings` structures — new but small (S);
  (b) the abstract sup-packaging of Meta-theorem A (moderate: `sInf`/unbounded-scale
  bookkeeping over eth's `eStar` def `:90` — note mathlib's `sInf ∅ = 0` pitfall, which eth
  itself flags at `PrintedStatement.lean:169–172`); (c) the exact identity `lnΛ(10,0) = 5·ln 10`
  (elementary log-rational arithmetic); (d) nothing analytic.
- F4. Effort: **M** (~1.5–3k LoC: two structures + two meta-theorems + two instances +
  statement-layer imports). Theorem A of dossier 32 shares step-3 glue.
- F5. Risks: the "achievable at unbounded scale" predicate (L4) must be stated so that eth's
  `∀ K₀ ∃ K ≥ K₀, Achievable K e` (`eStar :90`) fits without a scale-indexed type — the
  cleanest is a `Prop`-valued family; schedule arithmetic transcription errors (mitigated:
  eth's `PartA.logK` closed form is the single numerical anchor); no toolchain risk on the
  mathlib side (everything targets v4.36.0-rc2 = checkout); the two anthropics projects use
  the Lean module system (`module`/`public import`) — the pilot imports must respect it
  (3sum-apsp's verbatim elaboration, port-probe B3, proves this works).
- F6. Kernel-only; Modal build via `lean_build.py`/`lean_check.py` per AGENTS.md once lake
  scaffolding exists; no sorry outside deliberate statement stubs (none needed here).

## Significance

Converts the two most expensive proof artifacts of the anthropics corpus — a 152k-line ETH
refutation and a 97k-line 3SUM/APSP attack — from bespoke schedule constructions into
*instances of one interface*, which is precisely the reusable lemma layer Phase 2 identified
as missing ("a joint reduction theory… is a concrete, feasible unification target",
survey/anthropics.md §4). Any future tensor-decomposition-to-algorithm argument (OAI's MM
machinery being the obvious third) becomes an instance check; and the abstraction makes the
*quantitative* comparison of the two pipelines (which constants are load-bearing) a
well-posed question inside Lean rather than a survey remark.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank:

Lane proposal: R7 pilot (second, after 30 — shares its toolchain setup; I2's glue is
dossier 32's step 2, so a joint pilot order 30 → 31+32 is natural).

## F4 grade by lane R9

2026-11-09, round 5. Evidence: Modal port-probe runs 1–6 (`research/feasibility/port-probe.md`).

- **Grade: M — confirmed.** The dossier's own F2 cites the port-probe §4 table correctly
  (statement-level S, proof-level M), and the newer rounds strengthen it: eth statement
  layers (TM shape, `ProbeB2`) and 3sum statement layers (`EndStatement` verbatim,
  `ProbeB3`; `PaperStatements`-family props per F2) both measure clean; the module-system
  worry in F5 is empirically discharged (B3's verbatim elaboration incl. `module`/
  `public import` headers).
- **F1 note**: the cited mathlib surface (Filter/Tendsto, StrictAntiOn, Real.log, sSup) is
  long-stable order/analysis API — no probe needed beyond the general elaborations already
  run; `sInf ∅ = 0` pitfall already flagged in-house by eth (F3(b)).
- Shared-glue note confirmed: Theorem A of dossier 32 shares the step-3 glue — bundling
  31+32 amortizes (both lean on the same `Sec4_*`/`eStar` statement layer, whose
  statement family probed clean via B3).
- Verdict: keep M (~1.5–3k LoC); no F1 corrections.
