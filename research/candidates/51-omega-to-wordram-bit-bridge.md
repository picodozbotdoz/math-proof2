# Candidate dossier 51 — omega-to-wordram-bit-bridge

Lane R2 (openai-surveyor), 2026-11-09. **Coordinate with lane R4
(`research/bridges/complexity.md` §3 Q1 + §4 Z4) and with dossiers 10/11/12
(`research/candidates/1{0,1,2}-*.md`), which consume this bridge.**

> **Classification (honesty-first, per the orchestrator's convention, cf. dossier 60):
> ECOSYSTEM-NOT-DISCOVERY.** The arithmetic-to-bit-complexity transfer is **classical**:
> V. Pan, *The bit complexity of matrix multiplication and of related computations* (1985),
> doi 10.1016/0898-1221(85)90095-1; Pan, *How to multiply matrices faster* (1984); Schönhage
> 1981 — per R8 round-2 §7 (`research/novelty/round-2.md:160–175`, verdict
> **PRE-CHECK KNOWN-INFORMAL-ONLY**, confidence high): "the arithmetic→bit-complexity transfer
> with polylog(entry-size) overhead is established 1980s material". What is new here is only
> (a) its **first formal statement/proof in Lean** ("No formalization of the transfer exists
> (round-1 word-RAM sweep: nothing; mathlib nothing)", round-2 §7), and (b) the **first
> realized connection** from openai-math's proved exponents (ω(ℂ) ≤ 9/4; ω(F) < 2.3717 for
> every field) to anthropics 3sum-apsp's word-RAM programs, which today rest on Strassen's
> log₂ 7 alone. Novelty is expected to score 1 at triage; the dossier is filed as the
> feasibility feeder for the *discovery*-shaped candidate 12 (parametric savings ε(ω_b)) and
> the machine-model bridge Z2, exactly as dossier 60 feeds the tensor lane.

---

## Name

omega-to-wordram-bit-bridge

## One-line pitch

Formalize Pan's classical arithmetic→bit transfer as a compiler from openai-math's
division-free field programs (`Gate`/`Program`) to 3sum-apsp's word-RAM light language over
ℤ[x]/(x^p−1), and instantiate it at `omega ℚ < 2.371054886006746` to give the first non-
Strassen realized instance of `Claim.Theorem_17` — the layer that turns candidate 12's
parametric ε(ω_b) family from a symbolic instantiation into actual machine theorems.

## Precise mathematical statement

**Setting [VERIFIED].** openai's arithmetic model: `Gate F Input Register` with constructors
`constant/add/sub/mul` only — **division-free by construction** — with `eval`/`cost`
(`openai-math/lean/OAI/LinearAlgebra/MatrixMultiplication/Model.lean:14–60`);
`MatrixAlgorithm F a b c` = program + register layout computing the a×b·b×c product
(`Correct`), `cost := program.cost`;
`Arithmetic.omega F := sInf {τ | AdmissibleExponent F τ}` (`Model.lean:93`) and the uniform
all-fields theorem `omega_lt_source_constant (F) [Field F] : omega F < 2371054886006746/10^15`
(`MatrixFields/Conclusions/AllFieldsBound.lean:17`). 3sum-apsp's reduction: `Claim.Theorem_17
(M : DetTimeModel) (MM : ℕ → ℝ) (D g : ℕ → ℕ)` (`ThreeSumApsp/TimeClaims/Sec3/Definitions.lean:
192–199`) — **MM is already a parameter** ("the number of ring operations of the matrix
multiplication", `Programs/Sec3/Theorem17/Claim.lean:18` [erratum 2026-11-13, H/QA: v1
pinned :12; the docstring quote sits at :18]), realized today only at
`strassen n := n^{logb 2 7}` (`ThreeSumApsp/Sec3/Parameters.lean:73`) via `strassenList p` —
Strassen over the ring ℤ[x]/(x^p−1), `7^K` ring multiplications
(`Spec/Sec3/Theorem17/Strassen.lean:81` + header), entry growth `strassenBound p j α β =
16^j·p·α·β` (`Hashing/StrassenFacts.lean:148`).

**(T1) Compiler lemma (formal Pan transfer, interface form).** For every division-free
program `P : MatrixAlgorithm ℚ a b c` with `P.cost ≤ K·(max(a,b,c))^e` and every height bound
H on the finitely many rational constants of P, there are functions `D₁(H,K,e)`, `W(H,·)`,
`T(H,K,e,·)` such that for every prime p, every M = 2^K' ≥ max(a,b,c) and all integer
coefficients of |value| ≤ U: a light-language word-RAM program `runP` (3sum-apsp `Program`,
`Solves`-semantics at word size `W ≥ W(H, log p + log M + log U)`) computes the image of the
matrix product in ℤ[x]/(x^p−1)[entries] with

  time(n) ≤ T(H,K,e, n) ≤ K·D₁(H,K,e)·n^e·(log U + log p + log n)^{c₀}

word steps, c₀ an absolute constant — i.e. **arithmetic cost + polylogarithmic bit overhead**
on the exact 9-instruction word RAM (`EndStatement.Instr`/`exec`, no division instruction).

**(T2) Realized instance theorem.** For every τ with 2.371054886006746 < τ (say τ = 2.3718)
there exist C and a `DetTimeModel`-realized cost function
`mmOpenAI n := C·n^τ` such that:

  `Claim.Theorem_17 lightModel mmOpenAI D g` holds for both Section-3.3 parameter choices
  (D = ⌊n^{1/18}⌋, g = ⌈D^{0.0315}⌉ etc. — the choices of
  `Programs/Sec3/Theorem17/ClaimAtParameters.lean`), with the realized `termPrime` term
  improving from Strassen's `n^{log₂7}·D^{3/2} = n^{2.8907…}` to `n^{τ+1/12} = n^{2.4547…}`
  (exponent arithmetic: log₂7 ≈ 2.8074 + 3/(2·18) = 1/12; τ = 2.3718 + 1/12).

**(T3) Numeric corollary (honest scope).** In `bound17 MM D g C T n κ`
(`Programs/Sec3/Theorem17/Claim.lean:32` [erratum 2026-11-13, H/QA: v1 pinned :28;
`noncomputable def bound17` sits at :32]) the MM-term is one of three additive overheads; with
the frozen parameter choices the lead terms are `4ng·T` and `termScans ≈ κn³log n/g ≈
n^{2.998}`; therefore **the substitution T2 alone does not move the frozen ε_T = 0.0017**
(`EndStatement.lean:82`) — [VERIFIED by the exponent arithmetic above; independently
corroborated by R8 round-2 §8's finding that "the AVW savings flow from a fixed tensor
identity, so better MM enters only through the `termPrime` term"]. Improving ε_T via MM is
candidate 12's ε(ω_b) question (re-optimizing D, g), which T1/T2 feed but do not answer.

## Novelty check

- **Corpora** (rg patterns + counts; decl-index caveat observed — OAI TSV rows include
  vendored trees, so openai-math was rg'd directly):
  - openai-math: `rg -i -l 'word.?ram|bit complexity' openai-math/lean/OAI/{LinearAlgebra,
    Computability}` → exactly two files: `Computability/DeterministicSum/Machine.lean` (a
    finite word-RAM with exact costs **for 3SUM** — `ThreeSUM {n} (x : Fin n → ℤ)`, `wordWidth`,
    `wordModulus` — a third, unconnected machine model, nearest in-corpus miss: the transfer
    could land there instead, but `Claim.Theorem_17` lives in 3sum-apsp) and
    `Computability/QuantumFactoring/VerifiedTableOrder.lean:97` (a comment *contrasting*
    circuit cost with word-RAM primitives). No arithmetic→RAM compiler anywhere:
    `\bGate\b` in `OAI/Computability` lands only in Boolean/quantum/circuit machine trees
    (QuantumFactoring, PerfectCompleteness/Machines, BinPacking/CookLevin, FourierCircuit,
    WeisfeilerLeman/WLIdentification — 55 files; the five also defining `eval`/`cost`
    vocabulary are circuit-eval flavors) — none is 3sum-apsp's arithmetic-program
    `Gate`/`eval`/`cost` model [erratum 2026-11-13, H/QA: v1 quoted `rg 'Gate|Program'
    OAI/Computability` → 0, a pattern slip — bare `Program` matches 872 files of ordinary
    identifiers; word-boundary re-run above]; `docs/107.md`: "The result concerns arithmetic
    complexity, rather than bit complexity"; the companion preprint likewise ("ω … measures
    the asymptotic arithmetic cost", `preprints/Staggered-extraction-…-September-24-2026.pdf`,
    Introduction).
  - anthropics 3sum-apsp: the only program-level MM is Strassen (`strassenList`,
    `strassen`, `logb_two_seven_lt`); `rg -i 'coppersmith|winograd|laser' 3sum-apsp` → 0;
    `docs/REMARKS.md`: "ω is not defined, and Strassen's exponent log₂ 7 is used in its
    place".
  - mathlib: no time-bounded simulation of arithmetic programs
    (`research/survey/mathlib-frontier.md` §2: `Computable.lean` is an unconsumed island).
  - eth: `TM2`-based; no arithmetic-program model at all.
- **Literature** — **KNOWN-INFORMAL-ONLY**, R8 round-2 §7 (`research/novelty/round-2.md:
  160–175`): Pan 1985 (doi 10.1016/0898-1221(85)90095-1, Zbl 0674.68027), Pan 1984
  (10.1007/3-540-13866-8), Schönhage 1981; "No formalization of the transfer exists (round-1
  word-RAM sweep: nothing; mathlib nothing)." Nearest formal relative: none. The candidate's
  statement T1 is Pan's theorem restated for two specific verified machine models.
- Known nearest misses: dossier 12 (`12-z4-parametric-savings-function-in-matrix-exponent.md`,
  R4's Z4) proves ε(ω_b) **symbolically** at the Claim level — without T1 its instantiation at
  openai's exponents is a parameter plug, not a word-RAM theorem (the realized
  `claim_theorem_17₅/₂₆` chain runs a concrete Strassen program); openai's
  `DeterministicSum` word-RAM (above) hosts neither MM nor exponents.

## Bridge analysis

- Corpora bridged: **openai-math (exponent theorems + arithmetic program model) × anthropics
  3sum-apsp (word RAM + realized reduction programs) × mathlib (initial ring facts)**.
- Why essential: only openai proves ω < 2.3717 over every field and only openai has the
  division-free program model; only 3sum-apsp has the word-RAM with multiplication and the
  realized `Claim.Theorem_17` chain consuming an MM cost; the transfer lemma exists in
  neither (3sum-apsp hand-compiled one algorithm — Strassen; openai has no RAM at all in the
  MM project). Neither side alone can produce a sub-Strassen word-RAM MM program.
- Empty-zone fit: R4 `research/bridges/complexity.md` §3 Q1 ("ω := 9/4 beats Strassen's log₂ 7
  inside 3sum-apsp's reduction … [VERIFIED parameterization; the improved numerals are a
  computation]") and the realization half of §4 Z4; also the MM-corner of Z2 (word-RAM ↔
  Turing). The bridge is Z4's F3 "missing glue" (R8 round-2 §7: "or folded into Z2/dossier 12
  F3b" — this dossier is that fold, kept separate because its donor and effort profile differ
  from Z2's TM-side simulation).

## Proof-strategy sketch

1. (Routine transport) Denominator clearing + initiality of ℤ: a `Gate`-program identity over
   ℚ with constants of height ≤ H is, after multiplying by a common denominator, a
   polynomial identity over ℤ, hence valid over every commutative ring — in particular over
   R = ℤ[x]/(x^p−1), the ring of `strassenList` (`Spec/Sec3/Theorem17/Strassen.lean`). This
   avoids any CRT/number-field detour. [The one classical subtlety Pan bills: none — the
   programs are division-free, so no rational function reconstruction is needed.]
2. (Template reuse) Compile gate-by-gate into the light language: memory layout = one tape
   cell block per register; `add/sub` = single instructions; `mul` on entries of bit-size B =
   O(log U + log p + depth·(log H)) — schoolbook via the RAM's `mul` on words of W ≥ 2B bits,
   cost O(B/W + 1)·polylog — mirroring how `strassenBound p j α β = 16^j·p·α·β`
   (`Hashing/StrassenFacts.lean:148`) bounds Strassen's entry growth by recursion depth; here
   the growth bound is `entryBits ≤ entryBits₀ + depth·log(H·M)` by induction on the gate
   tree. **This induction is the technical heart of T1 and the honest size of the "bit
   bridge": ~one well-scoped invariant plus a boring compiler; NOT a research-scale obstacle
   — matching Pan's theorem being classical.**
3. (Instantiate) `omega_lt_source_constant` at F = ℚ gives `AdmissibleExponent ℚ τ` for every
   τ > 2.371054886006746 [VERIFIED statement, `AllFieldsBound.lean:17`; the witness is an
   existence statement, so T2 is stated ∀τ > 2.3717…, avoiding program extraction]. T1 + the
   witness give `mmOpenAI`; the charging discipline `ObeysBound17`
   (`Programs/Sec3/Theorem17/Claim.lean:40` [erratum 2026-11-13, H/QA: v1 pinned :39; the
   `def ObeysBound17` line sits at :40]) then yields `Claim.Theorem_17 lightModel mmOpenAI
   D g` via `claim17_of_host` (`Claim.lean:49` [erratum 2026-11-13, H/QA: v1 pinned :63;
   the theorem sits at :49]) — the same host plumbing as
   `claim_theorem_17₅/₂₆` (`ClaimAtParameters.lean`), with the Strassen block swapped.
4. (Numeric comparison) `n^{2.3718+1/12} < n^{log₂7+1/12}`: `Real.logb` arithmetic;
   `logb_two_seven_lt` already in 3sum-apsp gives the strict inequality. Routine.
5. (Load-bearing check, flagged per R8 §8) Confirm T3's subordination claim inside
   `Theorem19.total_corollary_26` (`TimeClaims/Sec3/Theorem19.lean`): that no MM-term enters
   the recursive Phase-2/3 machinery except through `termPrime` — if a hidden MM term binds
   in Corollary 16's data-structure time T, T3 weakens and candidate 12's upside grows; the
   check is a read of the frozen constants' provenance (Table 2 rows), not new mathematics.

## Feasibility

Preliminary, R9's F0–F6 shape; `research/feasibility/port-probe.md` **pending** — and note
for R9: this candidate needs **two** probes the existing anthropics→v4.36 plan does not
cover: OAI→v4.36 (openai is Lean **v4.34.1**, a third toolchain) and 3sum-apsp→v4.36
(v4.33.1). Mitigation as in dossier 50: state T1 against an *abstract* program interface +
hypothesis (`∃ P : DivisionFreeProgram, cost P ≤ … ∧ height P ≤ …`), so the pilot imports
neither corpus's tree; the openai side is discharged later by instantiating the interface
from a ported `AdmissibleExponent`.

- F0: T1/T2/T3 as above (T1 is the deliverable; T2 its first consumer; T3 the scope note).
- F1 mathlib entry points: none essential (word-RAM is 3sum-apsp-internal, imports nothing);
  `Real.logb`, `Nat.log2` for step 4.
- F2 donor lemmas: openai `Gate`/`Program.eval`/`cost` (`Model.lean:14–60`),
  `MatrixAlgorithm.Correct`, `omega_lt_source_constant` (`AllFieldsBound.lean:17`);
  3sum-apsp `Instr`/`exec` (`EndStatement.lean:16–46`), light language + `claim17_of_host`
  (`Programs/Sec3/Theorem17/Claim.lean:49` [erratum 2026-11-13, H/QA: v1 pinned :63]),
  `strassenList`/`strassenBound`
  (`Spec/Sec3/Theorem17/Strassen.lean:81`, `Hashing/StrassenFacts.lean:148`) as the compiled-
  algorithm template, `strassen` (`Sec3/Parameters.lean:73`) as the replaced cost.
- F3 missing glue: (a) the gate-to-RAM compiler + entry-growth invariant (step 2; the whole
  honest "size of the bridge": moderate, bounded by the StrassenFacts template); (b) the
  abstract `DivisionFreeProgram` interface to decouple toolchains; (c) step-5 provenance
  check.
- F4 effort: **M** (~1.5–3k LoC: compiler + invariant + instance chain). Not L: no new
  mathematics, no analytic API; the classical theorem being known cuts the design risk.
- F5 risks: openai's `AdmissibleExponent` witness opacity (constants ineffective/huge — fine
  for BigO-form but blocks any explicit-constants variant); the `mul`-on-2B-bit-words trick
  needs W ≥ 2·entryBits which interacts with 3sum-apsp's `Need`/word-size discipline
  (`polyBounded` family in `ClaimAtParameters.lean`) — bookkeeping, not obstruction;
  toolchain trifold (v4.33.1 / v4.34.1 / v4.36) unless the interface decoupling of F3(b) is
  done first.
- F6: kernel-only; math-proof1 Modal build/check loop; no external CAS; T2's constants stay
  existential BigO-form (no numerics beyond exponent comparisons).

## Significance

Ecosystem-grade, not discovery: T1 is the first formal Pan transfer and the first compiler
between any two of the ecosystem's four machine models at the level of *verified programs*
(a concrete brick of R4's Z2); T2 retires the last load-bearing use of Strassen's log₂ 7 in
3sum-apsp, and — through candidate 12 — makes the whole ε(ω_b) family of parametric savings
theorems word-RAM-realizable. Anyone later improving openai's exponents (they will: the
catalog iterates) inherits word-RAM machine theorems for free.

## Score (filled at triage — leave empty)

- Novelty (1–5): —
- Significance (1–5): —
- Effort (S/M/L → 1–5): —
- Rank: —

Lane proposal: novelty 1 (Pan 1985; formalization-only per round-2 §7 — the statement is not
new), significance 3 (unlocks dossier 12's family + first inter-corpus program compiler),
effort 3 (M). File as feasibility feeder; pilot only after dossier 12 is scored, or jointly
with it (shared first milestone: the abstract `DivisionFreeProgram` interface + T1 at
Strassen's own program as the test compile).

## F4 grade by lane R9

2026-11-09, round 5. The dossier's "two probes needed" note is answered by round 3
(`research/feasibility/port-probe.md` §7).

- **Grade: M — confirmed.** (i) OAI→v4.36: `ProbeC2_OAI_Model.lean` elaborated
  `Model.lean` **verbatim** (0 errors, 0 warnings) — that file IS the `Gate`/`Program.
  eval`/`cost`/`MatrixAlgorithm` ontology F2 cites (:14–60 within the 114-LoC file);
  closure 1 file/depth 0. The abstract-interface mitigation (F3(b)) is therefore cheap to
  instantiate later from a ported `AdmissibleExponent`. (ii) 3sum→v4.36: `EndStatement`
  verbatim clean (`ProbeB3`), word-RAM layer portable as-is. (iii) `omega_lt_source_
  constant` verified present at `OAI/LinearAlgebra/MatrixFields/Conclusions/
  AllFieldsBound.lean` (dossier wrote "AllFieldsBound.lean:17" — path correction); if the
  *bound* is imported rather than hypothesized, its closure is the priced M add-on (cf.
  dossier 12's AuxiliarySeparation: 129 files/20.7k LoC).
- **Effort driver unchanged**: the gate-to-RAM compiler + entry-growth invariant (F3(a))
  is the M-mass; no new evidence changes it. No mathlib F1 items beyond `Real.logb`/
  `Nat.log2` (stable).
- Verdict: keep M (~1.5–3k LoC); toolchain trifold dissolved by the interface decoupling +
  measured clean statement ports.
