# Candidate 12 — z4-parametric-savings-function-in-matrix-exponent

Pick justification (one line, required): Z4 over Z2/Z5 because it is the most
machine-ready parametrization in the whole cluster — 3sum-apsp already carries the
matrix-multiplication cost as an *abstract parameter* `MM` in `Claim.Theorem_17`, and
openai-math has a fully proved ω_ℂ ≤ 9/4 with zero sorries — so the candidate yields a
printable new constant (ε(9/4) > ε(log₂ 7) = 0.0017) rather than only infrastructure
(Z2) or a packaging lemma (Z5).

Lane proposal (R4): novelty 4, significance 3, effort 2 (S–M scoped) → rank ≈ 6.0
(4×3/2); with the arithmetic→word-RAM transfer lemma included, effort 3.

## Name

z4-parametric-savings-function-in-matrix-exponent

## One-line pitch

The frozen Exact-Triangle savings constant ε_T = 0.0017 becomes an explicit, strictly
increasing function ε(ω_b) of an assumed matrix-multiplication exponent bound, so that
openai's proved ω_ℂ ≤ 9/4 (vs. Strassen's log₂ 7 ≈ 2.807) yields a strictly better
formal running time — the first parametrized theorem where each corpus supplies one
side of the equation.

## Precise mathematical statement

Fix the 3sum-apsp time-claim setting: `M : DetTimeModel`
(`ThreeSumApsp/TimeClaims/Sec3/Definitions.lean:75`), and write
`Claim.Theorem_19_explicit M δ e` for the explicit bound
(`Definitions.lean:305–308`): `∃K T, M.exactTriangle T ∧ ∀ n κ u, 16^18 ≤ n → 1 ≤ κ →
u ≤ n^κ → T n u ≤ K·κ·n^{3−δ}·(log n)^e`. Recall the reduction claim

    Claim.Theorem_17 M MM D g  (Definitions.lean:192–199):
      ∃C ≥ 0, ∀T, M.lopDetect T → ∃T', M.exactTriangle T' ∧
        T' n u ≤ 4·n·g·(T n (D n) (queryCap n (D n)) + C·n²/√(D n))
                  + C·(termScans n (g n) κ + termPrime MM n (D n) + termBuild n (D n) (g n)),

where `termPrime MM n D = MM n * D^{3/2}` (`ThreeSumApsp/Sec3/Parameters.lean`,
"termPrime"), `strassen n = n^{log₂ 7}` (same file), and the library's two routes are
`Theorem19.explicit_of_theorem_17_corollary_16 … : Claim.Theorem_19_explicit M 0.00175 1`
(`TimeClaims/Sec3/Theorem19.lean:107–125`, from `Claim.Theorem_17 … strassen paramD₂₆
paramG₂₆`, `Programs/Sec3/Theorem17/ClaimAtParameters.lean:204–218`) and
`…_corollary_15 … : Claim.Theorem_19_explicit M (1/648) 2` (`Theorem19.lean:85–103`).

**Admissible exponent bound (word-RAM form).** `WordRamMM MM : Prop` := there is a
constant c and, for every κ, a light-language program computing the n×n integer matrix
product with entries |·| ≤ n^κ in ≤ `MM n` ring operations at every large enough word
size (the precise shape of the Strassen program-with-proof,
`Spec/Sec3/Theorem17/Strassen.lean` + `docs/REMARKS.md` cited-results row
"[Str69]: O(n^{log₂ 7}) ring operations … a program with a proof"). Say `MM` has
exponent `ω_b` if `MM n ≤ C·n^{ω_b}` for all large n.

**Theorem (parametric savings).** There is an explicitly given, strictly increasing,
continuous function `ε : (2, 3) → ℝ≥0` (built from the Sec-4 trade-off data: `Rc`,
`lnΛ`, `gammaOf`, `qOf`, `rhoC`, `PaperStatements.lean:2004–2031`, and the choice
lemmas `Theorem19.choice_theorem_5/choice_corollary_26`) such that for every `MM` with
`WordRamMM MM` and exponent `ω_b ∈ (2, 2.9]`:

    Claim.Theorem_19_explicit M (ε(ω_b)) e(ω_b)

for an explicit polylog exponent `e`, with:

1. `ε(log₂ 7) = 0.0017` — the frozen `ε_T` (`EndStatement.lean:82`,
   `Theorem_19 : ExactTriangle.SolvedInTime (3 - ε_T)`, :85–86) is recovered exactly;
2. `ε` strictly increasing, so `ε(9/4) > 0.0017`;
3. monotone dependence: `ω_b ≤ ω_b' → ε(ω_b) ≤ ε(ω_b')`, with `ε(ω) → 0` as `ω → 3`.

**Corollary (conditional on the model-gap transfer lemma, see Feasibility F3b).**
If every `AdmissibleExponent ℂ τ` bound (openai
`OAI/LinearAlgebra/MatrixMultiplication/Model.lean:88–93`) is realized by a word-RAM
integer program with polylog overhead, then `Claim.Theorem_19_explicit M (ε(9/4)) e`
holds, and consequently `ExactTriangle.SolvedInTime (3 − ε(9/4))` with
`ε(9/4) > 0.0017`, improving `Theorem_19`'s frozen exponent — from openai's
`omega_le_nine_quarters : Arithmetic.omega ℂ ≤ 9/4`
(`AuxiliarySeparation/Main.lean:28` [erratum 2026-11-09, H/QA: v1 cited :23–25; the theorem
is at :28, the public wrapper at :13]; library: 509 files, 0 `sorry` by rg) and
`matrix_multiplication_cost_le` (:16–21: ∀ε>0 ∃C ∀n ∃P, P.Correct ∧ cost ≤
C·n^{9/4+ε}).

## Novelty check

Corpus side (`research/qa/decl-index.tsv` absent — rg directly, 2026-11-09):

- 3sum-apsp: `rg -i -c 'as a function of (the )?(assumed|matrix)|epsilon.*(function
  of|depends on).*(omega|MM|exponent)' ThreeSumApsp/ PaperStatements.lean
  EndStatement.lean` → **0 hits**. The exponent is frozen by design: "Exponents of
  matrix multiplication (ω, α, μ and the rectangular exponents) are not defined. Where
  the paper uses a bound on them, the bound is an explicit hypothesis or a numeral"
  (`docs/REMARKS.md`, "What is not proved"); Strassen everywhere
  (`logb_two_seven_lt`; `strassen` def in `Sec3/Parameters.lean`). The PARAMETER `MM`
  exists (`Claim.Theorem_17 M MM D g`), but is instantiated exactly twice, both at
  `strassen` (`ClaimAtParameters.lean:204,214` [erratum 2026-11-09, H/QA: v1 cited :216;
`claim_theorem_17₂₆` is at :214]); no monotonicity/dependence theorem,
  no savings-function extraction. The Sec-4 objects are parametric in (c, γ, θ)
  (`Rc`, `Sec4_Rc_strictAntiOn` `PaperStatements.lean:2319`, `Sec4_Rc_zero_tendsto`
  :2325, `Sec4_epsStar_numeric` :2329) but never composed with the Sec-3 `MM`
  parameter — the two parameter layers have no connecting theorem.
- openai-math: ω infrastructure is proved but has **no consumer**: `rg -rln
  'Claim\.|DetTimeModel|Theorem_17' OAI/LinearAlgebra/MatrixMultiplication/` → 0;
  nothing downstream of `omega_le_nine_quarters` uses it algorithmically (their
  `MatrixMultiplication.lean` comparator statements are self-contained).
- mathlib: no matrix-multiplication exponent at all (R9 §1 #8 CONFIRMED: no ω, no
  tensor rank; Strassen only as Akra–Bazzi motivation,
  `Computability/AkraBazzi/AkraBazzi.lean:21`). tauceti: nothing.

Literature side: **PENDING lane R8 round-2.** Queries: `Exact Triangle "matrix
multiplication exponent" parametrized savings`; `truly subcubic triangle "as a function
of omega"`; [AVW26] arXiv:2610.06783 (the 3sum-apsp source paper) §3.3 prose — does
the paper itself state ε as a function of the assumed ω informally? (The Lean REMARKS
"the paper uses a bound on them … as an explicit hypothesis" suggests the paper treats
ω as a symbol — R8 should quote any displayed function ε(ω);) `Williams "triangle
detection" exponent ω dependence` (classical: triangle ≈ n^ω folklore — the *savings
function* for the lopsided/sparse setting is the novel part); Alman–Vassilevska
Williams tensor-inspired triangle bounds for comparison. `[R8 confirmation pending]`

Known nearest misses: (1) `Theorem_19_explicit M 0.00175 1` — one point of the
function, frozen; (2) openai's `omega`/`RectangularAdmissibleExponent` — the supply
side, unconsumed; (3) folklore "triangle in O(n^ω)" — no sparse/lopsided savings, no
formalization, different regime (D < n middle part is where `Rc` lives).

## Bridge analysis

- Corpora bridged: anthropics/3sum-apsp (the parametric claim chain + Sec-4 trade-off
  calculus) + openai-math (the proved exponent bound + admissible-exponent
  infrastructure); mathlib `Real.logb`/calculus as ambient.
- Why the bridge is essential: 3sum-apsp *cannot* conclude ε(9/4) > ε(log₂ 7) — it
  declines to define ω and has no exponent bound beyond Strassen; openai *cannot*
  conclude any triangle running time — it has no reduction from Exact Triangle to
  matrix multiplication and no word-RAM model at all. The parametric ε-theorem needs
  the demand side's parameter slot (`Claim.Theorem_17 M MM D g`) and the supply side's
  bound (`omega_le_nine_quarters`); neither exists in the other corpus. The model-gap
  transfer lemma (F3b) is additionally a two-corpus object: openai's programs are
  `Arithmetic.MatrixAlgorithm ℂ` (field gates, `ComparatorChallenges/
  MatrixMultiplication.lean:14–40`); 3sum-apsp's realization notion is integer word-RAM
  ring operations.
- Empty-zone fit: `research/bridges/complexity.md` §4 zone Z4 (v1, 2026-11-09); also
  §3 Q1 (quantitative transfer).

## Proof-strategy sketch

1. Generalize the two existing route lemmas from `strassen` to abstract `MM` with
   hypothesis `WordRamMM MM` and exponent ω_b: the proof bodies already treat `MM` as a
   symbol — `Theorem19.explicit_of_theorem_17_corollary_15/16`
   (`TimeClaims/Sec3/Theorem19.lean:85–125`) only use `h17`'s shape and the arithmetic
   lemmas `Theorem19.total_theorem_5/total_corollary_26` (:91,113). [Routine — the
   parameter is already there; the Strassen-specific content sits only in
   `claim_theorem_17₅/₂₆`, which stays at ω_b = log₂ 7 as the anchor instance]
2. Extract the trade-off: the final δ comes from balancing
   `4ng·T(n,D,q) + C·(termScans + MM n·D^{3/2} + termBuild)` against the Corollary-26
   bound; with `MM n = n^{ω_b}`, the choice lemmas `Theorem19.choice_theorem_5` /
   `choice_corollary_26` (cited `REMARKS.md` "Section 3: differences" point 8, n ≥
   16^18) become functions of ω_b. Re-run the Sec-4 arithmetic symbolically over the
   `Rc`/`gammaOf`/`qOf` data (`PaperStatements.lean:2011–2031`), using
   `Sec4_Rc_strictAntiOn` (:2319) for monotonicity in γ and hence in ω_b. [New but
   calculus-level — the genuinely new math here is showing the balance point moves
   monotonically with ω_b; a derivative sign computation on `Rc`]
3. Prove `ε(log₂ 7) = 0.0017` (resp. 0.00175 at the claim level) by instantiating the
   parametric chain at `strassen` and matching the frozen numerals via
   `Sec4_epsStar_numeric` (:2329) and the Table-2 validators (`table_2_query_valid`
   etc.). [Routine numeric re-instantiation]
4. State the corollary: apply openai's `matrix_multiplication_cost_le`
   (`AuxiliarySeparation/Main.lean:16–21`) through the model-gap transfer lemma to
   obtain `WordRamMM` with ω_b = 9/4 + ε′ for every ε′ > 0; conclude with step 2 and
   let ε′ → 0 by continuity of ε. [Conditional on F3b; without it, ship steps 1–3 as
   the standalone theorem and the corollary as a hypothesis-explicit statement]
5. Upgrade to the EndStatement level: `ExactTriangle.SolvedInTime (3 − ε(ω_b))`
   via the existing `endStatement_theorem_19` bridge (`Items.Theorem_19` →
   `EndStatement.lean:85`). [Routine]

## Feasibility (R9 template, `research/feasibility/mathlib-verification.md` §3)

- **F0.** ε(ω_b): an explicit strictly increasing savings function with
  ε(log₂ 7) = 0.0017, so openai's ω_ℂ ≤ 9/4 strictly improves the formal Exact
  Triangle exponent.
- **F1. Mathlib entry points**: no complexity API needed beyond what 3sum-apsp
  carries; ambient calculus = `Real.logb`, `Real.log`, monotone limits (R9 §1 #8
  confirms mathlib has no ω — the theorem lives entirely on corpus ground).
- **F2. Donor lemmas**: 3sum-apsp `Claim.Theorem_17` + parameter plumbing
  (`TimeClaims/Sec3/Definitions.lean:178–199`), route lemmas
  (`Theorem19.lean:85–125`), choice/arithmetic lemmas
  (`ThreeSumApsp/Sec3/Theorem19.lean`), Sec-4 trade-off objects
  (`PaperStatements.lean:2004–2060, 2319–2329`); openai
  `MatrixMultiplication.AuxiliarySeparation.Main.lean:16–25`
  (`matrix_multiplication_cost_le`, `omega_le_nine_quarters`; 0-sorry library,
  verified by rg) and `Model.lean:88–101` (`AdmissibleExponent`, `omega`,
  `RectangularAdmissibleExponent`, `innerSize`). Porting friction: low for the
  parametric theorem (everything is ℝ-valued propositions); the openai side is needed
  only as a citation-quality hypothesis unless F3b is attempted.
- **F3. Missing glue**: (a) symbolic re-instantiation of the two route lemmas — S;
  (b) **model-gap transfer lemma** (arithmetic-ℂ program ⇒ word-RAM integer program
  with polylog overhead, coefficient-height control) — the real work, M–L if done
  honestly (it is a specialization of bridge Z2's simulation, plus integrality of
  openai's construction, which is *not* stated in their repo —
  `rg -i 'integer coefficients|rational' OAI/LinearAlgebra/MatrixMultiplication/` →
  check; if coefficients are algebraic/complex, rational reconstruction or a
  rounding argument is needed); (c) monotonicity of the balance point (step 2) — S,
  one derivative computation.
- **F4. Effort: S–M** scoped without F3b (~0.5–1.5k LoC: restatement + calculus);
  M–L with F3b (then it subsumes a slice of Z2).
- **F5. Risks**: the Sec-4 numeric chain is validated at specific rationals
  (`table_2_*` are per-cell statements) — the symbolic version needs the general
  `Rc` lemmas, not the table cells; if `Theorem19.total_corollary_26`-style sums were
  tuned to the frozen D = ⌊n^{1/18}⌋ choice, the symbolic choice may need a stronger
  monotonicity input than `Sec4_Rc_strictAntiOn` gives (check
  `Sec4_Rc_zero_tendsto` suffices); openai coefficient integrality unverified.
- **F6.** Kernel-only; pilot in-tree on vendored 3sum-apsp (module system); the
  openai citation enters as a hypothesis, so no cross-project build is needed for
  the core theorem. v4.33→v4.36 risk minimal (statement-level ℝ propositions); R9
  port-probe staged (`research/feasibility/probe/ProbeB3_3sumEnd.lean` — 3sum
  EndStatement shape), results pending.
- Cross-references: R3 assembly map D — **pending** (only relevant if F3b is
  attempted).

## Significance

A quantitative cross-corpus improvement with a printable bottom line (a strictly
better formal Exact-Triangle exponent than the 2026 paper's frozen 0.0017), obtained by
wiring openai's proved ω ≤ 9/4 into a parameter slot 3sum-apsp built but never filled.
Methodologically it converts two frozen-constant corpora into one parametric theorem —
the template for every future "supply-side exponent meets demand-side reduction"
result, and the cheapest pilot for demonstrating corpus-to-corpus theorem transfer.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

## F4 grade by lane R9

2026-11-09, round 4. Evidence: Modal port-probe runs 3–4 + closure measurements
(`research/feasibility/port-probe.md` §7).

- **Grade: S–M (core, without F3b) — confirmed and cheapened**: the openai side the core
  theorem cites is exactly `Model.lean:88–101`, and `ProbeC2_OAI_Model.lean` elaborated that
  entire 114-LoC defs file **verbatim, 0 errors, 0 warnings** against v4.36 (def-chain
  closure depth 0, imports `Mathlib` only) — the citation-quality hypothesis costs zero
  port. The 3sum side (`Claim.Theorem_17` plumbing) is the same statement family as
  `ProbeB3` (verbatim OK). The dossier's "results pending" note is resolved in the clean
  direction.
- **F3b-adjacent cost, quantified**: if the *bound itself* must be imported as a proved
  theorem rather than a hypothesis, `omega_le_nine_quarters` /
  `matrix_multiplication_cost_le` live in `AuxiliarySeparation/Main.lean`, whose OAI
  closure is **129 files / 20,694 LoC / depth 12** (measured); the Witness-route bound
  (`omega_lt_of_balanced_family`) needs the 78-file/13,697-LoC witness sub-library whose
  level-1 blockers are `ComplexWitness.FiniteRectangularWitness`,
  `RectangularRateLimit.exponent_le_of_finite_asi`,
  `Arithmetic.equalRectangular_log_inequality_of_polynomialApproximation`
  (port-probe §7.3). That is M-grade on top of the core — consistent with the dossier's
  "M–L with F3b" and now with numbers attached.
- Verdict for triage: core S–M stands; treat "import the bound" as a priced M add-on, not a
  surprise.
