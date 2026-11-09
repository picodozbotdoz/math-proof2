# Phase 2 bridge map, v1 — computational complexity cluster

Lane R4. Scope: time-bounded computation across the corpora — anthropics `eth` and
`3sum-apsp`, openai-math's complexity projects, with mathlib as the shared substrate and
tauceti as a scanned negative. Primary input: `research/survey/anthropics.md` (decl names
re-verified against sources for everything load-bearing below); every claim carries a
file:line citation. `[VERIFIED]` = read in source this session or in the Phase-1 survey
with locator; `[HYPOTHESIS]` = inference, marked with the evidence.

## §0 Cluster snapshot

Five bodies of complexity-theoretic content, three machine models, zero shared API.

| Corpus | Content | Machine model | Key statements |
|---|---|---|---|
| anthropics **eth** | one TM counts every k-CNF in 2^{C·min{km/√log m, k²n·loglog n/√log n}}; ETH (s₃>0) false | Mathlib `Turing.FinTM2` multi-stack (`TM2ComputableAux Bool Bool`) | `MainResults.MainTheorem` (`eth/MainResults.lean:177`), `ETHIsFalse` (:122), proved `eth/Solution.lean:40–44` |
| anthropics **3sum-apsp** | 3SUM O(n^1.9992), (min,+)/APSP O(n^2.99942), Exact Triangle O(n^2.9983), 0-weight k-clique O(n^{k−0.0017⌊k/3⌋}); refutation of [vdBNS19] Conjectures 5.2/5.7/5.12 | word RAM from scratch: 9 instructions, one step each (`Instr`, `exec`) | `EndStatement.lean:85,95,106,125,136`; `Items.Theorem_4` (`PaperStatements.lean:4187`) |
| openai-math **SubexponentialSAT** | one TM0-based machine exactly counts every k-CNF (k≥2) in (L+1)^{O_k(1)}·2^{O_k(n(loglog n)²/√log n)} AND visits only (L+1)^{O_k(1)} cells; "The Exponential Time Hypothesis is False" (preprint, Oct 25 2026) | `PrimitiveMachine` over `Turing.TM0` tapes + `BitProgram` compiler + `LocatedCfg` space monitor | `exact_count_and_sat`, `exact_count_eth`, `sat_polynomial_space` (`lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean:74,104,149`); comparator `lean/ComparatorChallenges/SubexponentialSAT.lean:194` |
| openai-math **other complexity** | ω_ℂ ≤ 9/4, dual exponent α > 93/200, rectangular ω(0.709) < 523/250 (arithmetic circuits); depth-3 circuit lower bounds; 2-way NFA complementation and one-way liveness state lower bounds; border-determinantal cubic lower bound for permanent; PSD rank of matching matrices | arithmetic circuits (`Gate`), automata, no TM time model | `MatrixMultiplication.lean:118–126` (comparator, `sorry` by design); `TwoWayComplementation.lean:36`; `OneWayLiveness.lean:95`; `PermanentCubic.lean`; `MatchingPSD.lean` |
| mathlib (encore checkout) | `TM2OutputsInTime` (:130), `TM2ComputableInTime` (:161), `TM2ComputableInPolyTime` (:174), sole example `idComputableInPolyTime` (:216); Akra–Bazzi | TM0/TM1/TM2 | `Mathlib/Computability/TuringMachine/Computable.lean` — an **island**: imported by no other mathlib file (`research/survey/mathlib-frontier.md` §2) |

**tauceti: no time-complexity content.** Its `TauCeti/Computability/` is recursion theory
(Turing degrees, jump, priority arguments, Friedberg–Muchnik: `Computability/{RE,TuringDegree,
Jump,FriedbergMuchnik,Priority}`). No time bound, no complexity class anywhere in `TauCeti/`
(grep for `PolyTime|TimeComplexity|NP-complete` returns nothing relevant). [VERIFIED]

The two ETH refutations are independent siblings (both dated Oct 2026, neither cites the
other) with complementary strengths — this is the cluster's central untapped junction:

| axis | eth | openai SubexponentialSAT |
|---|---|---|
| machine | one TM2, **one constant C for all k ≥ 1** (`MainResults.lean:177–180`: ∃M,C … ∀k) | one machine **per k ≥ 2**, constants O_k(1) (`Final.lean:10–13`: program `Native.countingProgram cutoff k …` chosen after k) |
| time scale | min{km/√log m, k²n·loglog n/√log n} | n·(loglog n)²/√log n (`rho`, `SqrtLogSpace/Asymptotics.lean:10–11`); manuscript adds (n+m)^{O_k(1)}·2^{O_k(n loglog n/√log n)}, and 2^{O_{k,D}(n/√log n)} for m ≤ Dn (`lean/docs/378.md`) |
| space | **no space statement at all**; padding route materializes a pad of length 2^{e x} (state size 2|x|+2·2^{e x}+3, `Pad.lean:93–94`) | **polynomial visited space**, every prefix: `visitedSpace ≤ S·(L+1)^e` (`Final.lean:96–97`, monitor `SubexponentialSAT.lean:166–189`) |

## §1 Intersection table

| Object | Corpus A (ref) | Corpus B (ref) | Relation |
|---|---|---|---|
| "solved in time T" | eth `InTime`/`DecidesKSat`/`CountsWithin` via `TM2OutputsInTime` (`MainResults.lean:92–102,158–160`) | 3sum-apsp `Problem.SolvedInTime` via fuel semantics `exec` (`EndStatement.lean:29–70`) | analogous, incommensurable: steps-of-TM2 vs word-RAM steps at word size W ≥ b(⌊log₂n⌋+1); no lemma in either corpus relates them |
| ditto | openai `Computation.Trace`+`runtimeBound` (`SubexponentialSAT.lean:87–90,136–139`) | both of the above | third variant: small-step Option semantics, ℝ-valued bound, input-length L explicit |
| abstract solver / interface layer | eth `ClauseBound.Alg.Solver` structure + `Solver.Correct`/`Solver.Poly` + `St… : Prop` interfaces (`proof/rates/ClauseBound/Alg/Interfaces.lean:126–149`) | 3sum-apsp `DetTimeModel` record + claims `∀T, M.lopDetect T → ∃T', M.exactTriangle T' ∧ T' ≤ 4ng(T+C n²/√D)+C(…)` (`TimeClaims/Sec3/Definitions.lean:75–101,192–199`) | same design pattern — "quantify over every solver, charge each call exactly its T" — one *computational* (dependent record), one *propositional*; no shared statement |
| two unlinked time-model records | 3sum-apsp `DetTimeModel` (`TimeClaims/Sec3/Definitions.lean:75`) | 3sum-apsp `TimeModel` (`ConditionalTimes/Definitions.lean:105`) | twins inside one corpus: "the record `ConditionalTimes.TimeModel` … is another one, and **nothing links the two**" (`TimeClaims/Sec3/Definitions.lean:18–20`) |
| cost-accounted imperative language | 3sum-apsp `Light` language, `Meets lim P p d vals μ T R` specs, `compileProgram` (`Lang/Syntax.lean:15–28`, `Lang/Calls.lean:31`) | eth `PolyT` fragments glued on shared stacks, closure under composition/pairing/case/folds (`ToTuring/PolyT.lean:13–58`) | both are verified "abstract cost semantics → concrete machine" layers; one compiles down to word RAM, other up to TM2 |
| padding to buy time | eth `exists_tm_padded` / `padM` (`PaddedDescent/Pad.lean:30–40,116–125`), `Wrap.everyMachineCanBeWrapped` + `decidesTM_of_wraps_counter` (`machines/Wrap/Main.lean:34,54–60`) | openai `BitProgram.Program 80 1220 labels` + `GuardedCompiler.primitive` (`Final.lean:10–14`) | eth converts PolyT-in-padded-input into TM time; openai compiles a register program and monitors space — composition devices that never meet |
| tensor-decomposition → recursion | eth pieces A₀…A_t with ∑A_i = 2^t·[x=v][y=u] and bit-complexities c^row/c^col (eight-square identity `Eight.signs`, `statements/EightSquareStatement.lean:53,107–116`) | 3sum-apsp Schönhage terms `phi/psi/chi`, `Full.run`/`Mult` with leaf products (`PaperStatements.lean:140–155,263–303`) | both are "decompose a bilinear/crossing object into low-rank pieces, recurse on pieces, count leaves" pipelines over *different* algebras (±1 sign table on 3-bit blocks vs ℤ trilinear forms); no common API, both feed a solver abstraction |
| rate/savings function | eth exponent recursion e(g²) ≤ (1/√2+2/K)e(K)+2/K, e* = 0 (`PaperIndex.levelHence := Given.eStarZero`; Prop 3) | 3sum-apsp `Rc c γ = ln4/lnΛ`, strictly antitone with limit ε* = ln4/(5 ln10) (`PaperStatements.lean:2011–2018`, `Sec4_Rc_strictAntiOn` :2319) | both are monotone trade-off curves whose only consumption is frozen numerals (Table 2 rows, ε_T = 0.0017) |
| second-moment method | eth `stVar : StVar` (Var Y ≤ 4PU over K^g colorings), **abstract in the pseudo-covariance κ** (`networks/Variance/Var.lean:100–139`, `Defs.lean:82–142`) | openai `SATVariance.variance_main` (k≥3), `DepthThree` moment bounds, `mass_le_of_width_correlation` (`Computability/DepthThree/CircuitLowerBound.lean:20`, `MomentBounds.lean`) | the only formalized variance-for-grouping device vs variance-for-lower-bound uses; 3sum-apsp has none (deterministic: "Where [CH20] uses Markov's inequality and a union bound, we count", `docs/REMARKS.md` §"The reduction after Chan and He") |
| exponent of matrix multiplication | openai `Arithmetic.omega`/`rectangularOmega`/`complexAlpha` via `MatrixAlgorithm` cost (`ComparatorChallenges/MatrixMultiplication.lean:100–126`) | 3sum-apsp: "ω is not defined … Strassen's exponent log₂ 7 is used in its place" (`docs/REMARKS.md`, "Exponents of matrix multiplication"; `logb_two_seven_lt`); `Claim.Theorem_17` carries `MM : ℕ → ℝ` as a parameter (`TimeClaims/Sec3/Definitions.lean:186–199`) | openai *defines* exactly the object 3sum-apsp *parameterizes and freezes* |
| space accounting | openai `LocatedCfg.monitor`/`visitedSpace` (`SubexponentialSAT.lean:149–189`) | 3sum-apsp `IsDataStructure` (space = extent of memory, `docs/REMARKS.md` NOTE at `IsDataStructure`) | both measure space as touched-address extent; eth has no counterpart |
| O(·) on exotic carriers | 3sum-apsp `BigO` on Nat→Nat via rational den/num powers (`EndStatement.lean:50–51`) | eth ⌊2^{…}⌋₊ floor conventions (`MainResults.lean:153`); openai ℝ-valued `runtimeBound` | three bespoke asymptotic layers; mathlib's `IsBigO` unused at these shapes |
| ETH in s₃-form | eth `s k = ⨅ δ, InTime k δ`, `ETH := 0 < s 3` (`MainResults.lean:100–117`) | openai `exact_count_eth` (2^{A·rho n} counting ⇒ refutation, `Final.lean:104–147`) | two independent refutation routes; the *definitions* of s₃ are not comparable without a machine-model bridge |

## §2 Lifts, dualities, generalizations

**L1 — One time-model to rule the twins.** `DetTimeModel` (Secs 2–4 problems) and
`TimeModel` (Sec 5 problems, incl. `lasVegas`/`lasVegasWhp`) are the same shape: a record of
predicates-on-running-times plus closure hypotheses (`Closure.MonoExactTriangle`,
`Closure.ChooseBySize`, `TimeClaims/Sec3/Definitions.lean:117–131`;
`Closure.RelaxMinPlusBound`, `ConditionalTimes/Definitions.lean:143–155`). The honest lift is
a single `CostModel` indexed by a problem universe, of which both are instances — this is
prerequisite infrastructure for empty zone Z1. [VERIFIED that they are unlinked; the lift is
proposed work]

**L2 — Propositional ↔ computational solver layers.** 3sum-apsp's claims quantify over
running-time predicates (`∀ T, M.lopDetect T → …`); eth's `Solver Idx` is a dependent record
carrying `run`/`need` with `Correct` and `Poly` *separate hypotheses*
(`Interfaces.lean:126–147`). The lift eth→3sum-apsp: from a `Solver` one gets the
propositional claim for free; the converse (extract a callable from a ∀-over-T claim) is
exactly what fails in `SolvedInTime` ("a program cannot simply be called as a subroutine …
the definition of solving does not say which cells a program reads or writes",
`docs/REMARKS.md` "Theorems 17 and 21 in their printed form"). eth's `Solver.Seq`
(`Interfaces.lean:165–181`) is the missing middle object: an *indexable family* with
polynomial pick — the shape a composable reduction needs. [VERIFIED asymmetry; lift proposed]

**L3 — The two tensor recursions are instances of one schema.** eth: split the crossing
equality [x=v][y=u] into ⌈λ/3⌉+1 pieces A_i, each factoring through ≤ c_i^row / c_i^col bits
(`EightSquareStatement.lean:107–116`), the eight-square identity σ(p,q)σ(p′,q′)+σ(p,q′)σ(p′,q)
= 0 (`:53`) being the cancellation making the split orthogonal; 3sum-apsp: split the
matrix-product tensor G into 10 terms φ_λψ_λχ_λ (Schönhage; `PaperStatements.lean:177–186`),
recurse via `Full`/`Pruned` with leaf counts α_d, β_d. Dual use of the same schema: eth's
pieces *reduce the information carried per side* (bit-complexity c_i), 3sum-apsp's terms
*reduce the leaf count* (only contributing leaves counted, `Mult` :302). A shared abstraction
— "a finitary bilinear object with a ranked decomposition and a cost-monotone recursion" —
would carry both `Lemma 2` and `Lemma 6` and make the two rate functions (§1 row 8) instances
of one contraction analysis. [HYPOTHESIS, structure-level; both sides verified]

**L4 — Divergence conventions.** The three step semantics differ where algorithms don't
halt: 3sum-apsp `exec` with exhausted fuel = reject (`EndStatement.lean:31`, "past its end P
rejects"); openai `step … : Option` with `none` = halted (`SubexponentialSAT.lean:107–119`);
mathlib `EvalsToInTime`. A bridging layer must state totalization lemmas; none exists.
[VERIFIED, trivial but load-bearing for Z2]

## §3 Quantitative-transfer opportunities

**Q1 — ω := 9/4 beats Strassen's log₂ 7 inside 3sum-apsp's reduction.** The only reason
`wordRam_theorem_19` rests on log₂ 7 is that ω is not defined (`docs/REMARKS.md`). openai's
comparator *defines* admissible exponents (`RectangularAdmissibleExponent`,
`MatrixMultiplication.lean:100–107`) and asserts ω_ℂ ≤ 9/4, α > 93/200, rectangular
ω(0.709) < 523/250 (:118–126). `Claim.Theorem_17` already takes `MM : ℕ → ℝ` as a parameter
and `Theorem19.explicit_of_theorem_17_corollary_16` (`TimeClaims/Sec3/Theorem19.lean:107`)
threads it symbolically — so instantiating `MM := n ↦ n^(9/4)` and re-running the frozen
choices (`Theorem19.choice_corollary_26`, D = ⌊n^{1/18}⌋, g = ⌈D^{0.0315}⌉) is mechanically
available. Where constants are frozen: ε_T = 0.0017, 1.9992, 2.99942, D^{0.063}/D^{0.437}
(`EndStatement.lean:82` etc.), each ultimately a Table-2 cell. [VERIFIED parameterization;
the *improved numerals* are a computation — see Z4 for the theorem-shaped version]

**Q2 — min-structure of the two SAT bounds.** eth's min{km/√log m, k²n·loglog n/√log n}
covers sparse (m small) and dense regimes with one C; openai's manuscript bound
(n+m)^{O_k(1)}2^{O_k(n loglog n/√log n)} with the m ≤ Dn refinement to 2^{O(n/√log n)}
(`docs/378.md`) matches eth's m-route qualitatively but with per-k constants. Transfer
questions: (a) does openai's construction admit a uniform-in-k constant (eth's C is uniform —
`MainResults.lean:177–180`)? (b) does eth's dense-route exponent k² survive openai's
sparsification trick (theirs has no k² but an extra loglog)? [HYPOTHESIS; both sides verified]

**Q3 — magnitude-aware word accounting.** 3sum-apsp charges calls exactly T and numbers of
|value| ≤ u at 1+log u words (`TimeClaims/Sec3/Definitions.lean:47–58`); eth's encoding uses
⌊log₂(2n)⌋+1-bit slots per clause position (`MainResults.lean:85–87`); openai bills time as
(L+1)^d·2^{A·ρ(n)} with L the full encoding length. A transfer of the 1+log u discipline to
either SAT encoding would separate input-length polynomial factors from the exponential
term — the exact bookkeeping needed to compare the two counting bounds on equal footing.
[HYPOTHESIS]

**Q4 — variance layer reuse.** eth's `StHence` is stated for *arbitrary* κ(p,q) vanishing
off meeting pairs, bounded by m (`Var.lean:100–102`) — i.e., a ready-made lemma for any
second-moment grouping argument. Candidate consumers outside eth: the Chan–He prime-hash
recursion in 3sum-apsp (currently deterministic exhaustive search over primes,
`docs/REMARKS.md` "[CH20]" section) and openai's Depth-3 correlation bounds. See Z5.

## §4 Empty zones (candidate discoveries)

### Z1. A composable reduction theory: "reduction composition preserves running times under an abstract cost semantics"

**Candidate statement.** Define a `CostModel` — a record with a field `Sol : Problem →
(ℝ→ℝ) → Prop` per problem plus three closure axioms: call-charging (a call costs its T),
monotonicity (`Closure.MonoExactTriangle` generically), and size-threshold choice
(`Closure.ChooseBySize` generically). Define a *reduction* from A to B as data
`⟨calls : ℝ→ℝ, extra : ℝ→ℝ, (h : ∀T, M.Sol B T → ∃T', M.Sol A T' ∧ T' ≤ extra + calls·T)⟩`
— the exact shape of `Claim.Theorem_17` (`TimeClaims/Sec3/Definitions.lean:192–199`),
`Claim.CH20_Theorem_5_1`, `Claim.VW18_Theorem_4_2`, `Claim.ApspFromMinPlus`. **Theorem:**
reductions compose: `(g ∘ f)` is a reduction with calls = calls_g·calls_f and extra =
extra_g + calls_g·extra_f (proof: pure arithmetic on the two inequalities). **Second
theorem:** every such abstract deduction is *realized* on the Turing side — if each
constituent reduction is computed by `PolyT` fragments and the callee by a `Solver.Poly`,
then `exists_tm`/`exists_tm_padded` yields one TM2 with the composed bound. This is the
missing sentence of Theorems 17/21 (`docs/REMARKS.md`: "such a program cannot simply be
called as a subroutine") restored at the right level of abstraction.

**Bridge-essentiality.** Not provable from one side: 3sum-apsp *has* the reductions and the
abstract claims but its end model (`exec` word RAM) is extensional — subroutine composition
is *stated impossible* for `SolvedInTime` programs; eth *has* the intensional machinery
(fragments glue under `PolyT`; `Wrap.everyMachineCanBeWrapped`,
`machines/Wrap/Main.lean:34`) but no problem/reduction layer at all — its `Solver` is bespoke
to clique counting. Only the combination yields a theorem whose instances include
`wordRam_theorem_22_*` (3sum side) and `Sat3.DecidedInTime` (eth side).

**Contributing named results.** 3sum-apsp: `DetTimeModel`, `Claim.Theorem_17`,
`Claim.Theorem_21a/21b_minPlus/21b_apsp`, `Claim.CH20_Theorem_5_1`,
`Claim.VW13_Theorem_4_3`, `Claim.VW18_Theorem_4_2`, `Closure.MonoExactTriangle`,
`Closure.ChooseBySize`, the light-language realization `Light.lightModel`
(`ThreeSumApsp/Programs/LightModel.lean`). eth: `PolyT` and its closure lemmas
(`ToTuring/PolyT.lean:13–23`), `IsPolyT`, `exists_tm` / `exists_tm'` / `exists_tm_padded`
(`PaddedDescent/Pad.lean:116`), `Wrap.CodingExists`/`Wrap.Sim` (`machines/Wrap/Main.lean`
header). openai: `Computation.Trace` as a third realization candidate.

**First proof step.** Pure Lean, no math: state and prove the composition lemma for
abstract claims (two `∃C, ∀T, …` implications in, one out — `linarith`-level). Then define
the *Turing realization* `Tm2Model : CostModel` with `Sol P T := ∃M, ∀x, TM2OutputsInTime …`
and prove the three closures from `PolyT` gluing. Everything else (both corpora's claim
chains) then applies verbatim to the TM model.

### Z2. word-RAM ↔ Turing simulation, formalized

**Candidate statement.** For every word size W there is a `PolyT` fragment `stepW` such
that for every word-RAM program `P : List Instr`, position `pc`, and memory `m`, the TM2
fragment computes one `exec P 1 pc m` step in poly(W) steps; consequently, for every
`Problem Q` with `Q.SolvedInTime Q r` (`EndStatement.lean:67`), the problem "Q's input
layout, read as a bit string" is solved by a `TM2ComputableInTime` machine in time
`T(n)·poly(log n)`, at every word size W = b(⌊log₂n⌋+1). Dual direction: a TM2 step
simulates on the word RAM in O(W) instructions (needs `load/store` addressing — available).
The composite is the first formal *polynomial-equivalence of machine models* covering a RAM
with multiplication.

**Bridge-essentiality.** Both anthropics projects explicitly disclaim it: eth
`MainResults.lean:36–48` — "A random-access machine simulates such machine with a bounded
number of operations per step … The simulation and the rewriting are standard facts; they
are **not part of the Lean statements or proofs**"; 3sum-apsp's model has no second model to
relate to. Without this bridge, `Theorem_22_3SUM` and `MainTheorem` live in different
universes and no cross-corpus hardness/algorithmic statement can even be phrased. mathlib's
`Computable.lean` island (§0) is exactly the neutral landing site
(`research/survey/mathlib-frontier.md` §2 "a bridge `FinTM2 ↔ word RAM` … a two-sided empty
zone").

**Contributing named results.** 3sum-apsp: `Instr`/`exec`/`loadWords`
(`EndStatement.lean:16–46`); the word-size discipline `W ≥ b(Nat.log2 n + 1)` (:69).
eth/mathlib: `PolyT.of` (`ToTuring/PolyT.lean:62`), fragment gluing `Fr`/`Runs`,
`TM2OutputsInTime` (`Computable.lean:130`), eth `ToTuring/Enc.lean` (encodings of values on
stacks), `Wrap.CodingExists` (configuration codings). openai: `headDisplacement` +
`LocatedCfg.monitor` (`SubexponentialSAT.lean:161–189`) as the template for a *space-aware*
simulation.

**First proof step.** Code `BitVec W` as a `List Bool` frame on an auxiliary stack; write
the four ALU fragments (add/sub/mul by schoolbook on bit lists — `ToTuring/Poly/` already
has `Digits.lean`, `Words.lean`, `Count.lean`); each `Instr` case is one `PolyT.of`. The
jump discipline `bltz` needs a program-counter-in-unary trick or a `Fr` per instruction
indexed by a counter — the `PolyT` composition closure is designed for exactly this.

### Z3. One machine, uniform in k, polynomial space: the synthesis of the two ETH refutations

**Candidate statement.** There exist one TM `M` and constants `C, C'` such that for every
k ≥ 1, n ≥ 4, m ≥ 2 and every k-CNF φ (no repeated clause, all variables occurring), `M`
outputs `numSat φ` within `2^{C·min{km/√log m, k²n·loglog n/√log n}}` steps **while visiting
at most (input length)^{C'} cells**. I.e.: eth's uniformity ∩ openai's space discipline.

**Bridge-essentiality.** Neither side proves it. eth's route *cannot* give polynomial space
as built: the padding theorem materializes the pad, and the pad has length 2^{e x} —
`padM`'s states have size 2|x| + 2·2^{e x} + 3 (`PaddedDescent/Pad.lean:93–94`), so space
scales with time. openai's route gives polynomial space (`sat_polynomial_space`,
`Final.lean:149–182`, monitor at `SubexponentialSAT.lean:166–189`) but per-k machines and
worse time scale. The bridge observation [HYPOTHESIS, checkable]: eth's pad is a list of
*units* — `pad k = List.replicate (2^k) ()` (`Pad.lean:30`) — carrying no information beyond
length; the solver uses it through `pad.length` bounds (`2 ^ S.need … ≤ pad.length`,
`Interfaces.lean:137–138`; `enumF`'s bound `2 ^ enumBits g F c ≤ pad.length`,
`Interfaces.lean:32`). If `Solver.run` factors through `pad.length` (a congruence lemma to
prove in `ClauseBound/Alg/`), then `padM` can be replaced by a machine carrying the *number*
2^{e x} in binary (e x + 1 bits) plus a counter that bounds each enumeration, giving space
poly(|x| + e x) at the same time bound. That lemma is provable only where the machine is
(eth), while the *statement pattern and certificate method* (per-prefix visited-space
invariant) come from openai — neither corpus alone states or proves the combined theorem.

**Contributing named results.** eth: `MainResults.MainTheorem` (uniform C over k,
`MainResults.lean:177–180`), `exists_tm_padded` (`Pad.lean:116`), `Solver`/`Solver.Poly`/
`Solver.Correct` (`Interfaces.lean:126–147`), `St…` interface discipline. openai:
`exact_count_and_sat`, `exact_count_eth`, `sat_polynomial_space` (`Final.lean:74,104,149`),
`LocatedCfg.monitor`/`visitedSpace` (`SubexponentialSAT.lean:166–189`), `rho`
(`SqrtLogSpace/Asymptotics.lean:10`).

**First proof step.** In eth: prove `Solver.run (pad, i, I) = Solver.run (pad', i, I)`
whenever `pad.length = pad'.length` (or the weaker: `run` depends on the pad only through
the bounds `2^need ≤ pad.length`). Then build `padM'` with a binary length-counter, reprove
`padM_runs` with size ≤ 2|x| + O(e x), and re-run `exists_tm'`. Finally state the space
invariant in openai's `visitedSpace` form. Feasibility: high — the `St…`-proposition
discipline (`Interfaces.lean:12–17`) is built for swapping implementations without touching
consumers.

### Z4. The savings function as a theorem in the matrix-multiplication exponent

**Candidate statement.** For every real ω_b ≥ 2 equipped with a matrix-multiplication
program of cost n^{ω_b} (openai's `RectangularAdmissibleExponent`-style hypothesis,
`MatrixMultiplication.lean:100–107`), there is ε(ω_b) > 0, given by an explicit strictly
increasing function, such that Exact Triangle is solved in O(n^{3−ε(ω_b)}) word-RAM time;
ε(log₂ 7) = 0.0017 (recovering the frozen `ε_T`, `EndStatement.lean:82`) and ε(9/4) >
0.0017 (instantiating openai's `complex_omega_le_nine_quarters`, `:118`). More generally:
the whole Table-2/Rc trade-off (`PaperStatements.lean:2040–2059`, `Rc` :2015,
`Sec4_Rc_strictAntiOn` :2319) becomes a parametrized family ε(ω_b, c, θ).

**Bridge-essentiality.** 3sum-apsp *declines* to define ω and freezes Strassen
(`docs/REMARKS.md` "Exponents of matrix multiplication … not defined"; `logb_two_seven_lt`);
openai defines the exponent infrastructure but proves no algorithmic consequence of it. The
parametrized theorem is a genuine new statement in neither corpus — the paper's own printed
constant is a function evaluation that the formalization collapsed to a numeral
(`Items.Theorem_19` bounds via `Sec4_epsStar_numeric` :2329).

**Contributing named results.** 3sum-apsp: `Claim.Theorem_17` with `MM` parameter
(`TimeClaims/Sec3/Definitions.lean:186–199`), `Theorem19.explicit_of_theorem_17_corollary_16`
(`Theorem19.lean:107–125`), `Rc`/`lnΛ`/`epsStar` (`PaperStatements.lean:2011–2018`),
Table-2 validators (`table_2_query_valid` etc.). openai: `Arithmetic.omega`,
`rectangularOmega`, `complexAlpha`, `MatrixAlgorithm.Cost` (`MatrixMultiplication.lean`).
mathlib: `Real.logb` calculus; Akra–Bazzi for any recursion re-derivation
(`Mathlib/Computability/AkraBazzi/AkraBazzi.lean:654`).

**First proof step.** Generalize `Theorem19.choice_corollary_26` to keep `MM n = n^ω_b`
symbolic (the proof structure already is — `h17 Td hTd` threading), then run the existing
arithmetic lemmas (`Theorem19.total_corollary_26`) with `MM` as a hypothesis variable. The
strict monotonicity ε(ω_b) is then a calculus exercise on `Rc` via `Sec4_Rc_strictAntiOn`.

### Z5. A shared second-moment grouping lemma (derandomization bridge)

**Candidate statement.** Abstract coloring lemma: for every g, K, symmetric `c : Fin g →
Fin g → ℕ` with row sums ≤ P, and every "conflict weight" κ : pairs → ℝ≥0 supported on a
`Meets` relation with the 4P-neighborhood property, there exists a K-coloring χ with total
conflict Σ_{p,q meet} c_p c_q κ(p,q) ≤ U·(4P/K² + √(4PU/K^g)) — i.e., extract from
`StVar`+`StChebOfVar`+`StSomePairOfCheb` a *pure-existence* grouping lemma with no
probability left. Then: (a) instantiate `c` = collision counts of the Chan–He prime hash
(`ChanHe` namespace) to replace one layer of exhaustive prime search by a direct existence
argument — a new deterministic-vs-search lemma inside 3sum-apsp's reduction; (b) instantiate
the same abstract lemma in openai's Depth-3 setting to compare against
`mass_le_of_width_correlation` (`CircuitLowerBound.lean:20–52`), whose ε-correlation
hypothesis is exactly a "κ bounded by ε" statement.

**Bridge-essentiality.** eth's `StHence` is *already* abstract in κ
(`Var.lean:100–102`: "for any numbers κ(p, q) in the place of the covariances") but has
exactly one consumer (Lemma 1's grouping). 3sum-apsp has the combinatorial situations
(collision counting in `ChanHe`) but deliberately replaced probabilistic existence by
deterministic counting — the lemma would give the *existence* route with explicit constants,
something its corpus lacks. openai has the variance techniques
(`SATVariance.variance_main`, `MomentBounds.lean`) but no grouping application. The pure
lemma is trivially provable inside eth; the *new theorems* are the instantiations, which
require the bridge.

**Contributing named results.** eth: `StVar`, `StHence`, `StChebOfVar`, `StGroupingOf`,
`groupingFacts` (`Variance/Var.lean:131–139`, `Grouping.lean:49,145`,
`Defs.lean:82–142`). 3sum-apsp: `ChanHe.reduction_correct`, `Claim.CH20_Theorem_5_1`,
the collision-count lemmas in `docs/REMARKS.md` "The reduction after Chan and He" (counting
colliding ordered pairs). openai: `SATVariance.variance_main`
(`ComparatorChallenges/SATVariance.lean:54`), `DepthThree.MomentBounds`,
`CNF.mass_le_of_width_correlation`.

**First proof step.** In eth, package `stMean`, `stVar`, Chebyshev (`stChebOfVar`,
`Grouping.lean:49`) and the pigeonhole step (`stSomePairOfCheb`) into one `∀ c κ`
proposition `GroupingExists` with the K^g averaging made explicit (`stTotalLe` is the
Σ over χ — `Grouping.lean` has the pieces). That lemma file, translated into 3sum-apsp's
`Util/Asymptotics` setting, is the deliverable.

**A sixth, weaker zone (noted, not developed):** a *counting* version of 3sum-apsp's thin
data structure — "preprocess X, Y so that #\{query pairs (I,J) ∈ W with (XY)[I,J] = t\} for
all t is computable in O(N²log²D/D^γ + |W|·D^q)" — sits between `Theorem 30`'s structure
(`PaperStatements.lean`, eq (8)–(9)) and eth's counting discipline, but nothing in either
corpus's machinery points at it specifically; deprioritized vs Z1–Z5.

## §5 Sources consulted

- `cross-math-fronttier/AGENTS.md`, `research/RESEARCH.md`, `research/survey/anthropics.md`,
  `research/survey/mathlib-frontier.md` (§2; appeared during this session).
- anthropics eth: `MainResults.lean` (all 183 lines); `proof/machines/ToTuring/PolyT.lean`;
  `proof/machines/Wrap/Main.lean` (head + `decidesTM_of_wraps_counter`);
  `proof/networks/Paper/SecNetworks_Model.lean` (all);
  `proof/rates/PaddedDescent/Pad.lean` (all 135);
  `proof/rates/ClauseBound/Alg/Interfaces.lean` (all);
  `proof/statements/EightSquareStatement.lean` (all); `proof/statements/AppHalfPiecesStatement.lean`
  (head); `proof/networks/Variance/{Var.lean,Defs.lean,Grouping.lean}` (key defs);
  `proof/README.md` (interface/solver glossary, lines 142–182).
- anthropics 3sum-apsp: `EndStatement.lean` (all 139); `docs/REMARKS.md` (all 462 read of
  546; remainder = NOTE index continuation); `PaperStatements.lean:100–330, 1995–2060,
  2319–2329, 2796–2811 (via survey), 4120–4194 (via survey)`;
  `ThreeSumApsp/ConditionalTimes/Definitions.lean:1–200`;
  `ThreeSumApsp/TimeClaims/Sec3/Definitions.lean:1–150`;
  `ThreeSumApsp/TimeClaims/Sec3/Theorem19.lean:82–125`;
  `ThreeSumApsp/Lang/Syntax.lean` + `Lang/Calls.lean` (heads);
  `ThreeSumApsp/Programs/LightModel.lean` (existence via rg).
- openai-math: `lean/ComparatorChallenges/{SubexponentialSAT,MatrixMultiplication,
  OneWayLiveness,TwoWayComplementation,PermanentCubic,MatchingPSD,HeilbronnTriangle,
  SATComputability,SATSharpness,SATVariance}.lean` (statements);
  `lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean` (all 202) +
  `SqrtLogSpace/Asymptotics.lean` (rho) + folder listing (1261 files, 0 `sorry` by rg);
  `lean/OAI/Computability/DepthThree/CircuitLowerBound.lean` (head);
  `lean/docs/378.md` (scope of the ETH-false formalization);
  `preprints/` listing (The-Exponential-Time-Hypothesis-is-False-October-25-2026 exists).
- tauceti: `formalization.yaml` (head); `TauCeti/` folder listing; grep scan for
  time-complexity content (negative); `TauCeti/ModelTheory/Complexity.lean` (formula
  complexity only, not computational).
- encore-mathlib: `Mathlib/Computability/` listing;
  `TuringMachine/Computable.lean:130–231` (`TM2OutputsInTime`, `TM2ComputableIn(Poly)Time`).
