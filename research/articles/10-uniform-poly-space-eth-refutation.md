# One Machine, All k: Uniform ETH Refutation with Polynomial Space

*cross-math-fronttier research article 10 (drafted Cycle 2) · DRAFT 2026-11-14 · dossier
`research/candidates/10-z3-uniform-poly-space-eth-refutation.md` (Top-3 #2, main run) ·
blueprint `research/pilots/10-blueprint.md` (M1 = L3 landed main-run; §L1 = milestone M2,
Cycle 2) · pilot `research/pilots/10/` (M1.lean, L1.lean GREEN; L2.lean on disk) · logs
`research/pilots/10/logs/`*

**Status: DRAFT — two layers GREEN, headline pending.** Proved and axiom-audited so far:
the space-annotated assembly theorem `exists_tm_space(_at_time/_monitor)` (main-run M1 =
layer L3) and the counter-combinator agreement layer (Cycle-2 L1: 27/27 theorems
triad-clean, full axcheck). The remaining descent layer L2 is written but unlanded at
draft time: [VERDICT:10-L2]. The headline conjunction below is the target; the two
landed layers are cited as landed, the rest carries slots.

---

## Abstract

Two 2026 corpora refute the Exponential Time Hypothesis from opposite halves. The
anthropics `eth` corpus proves a k-UNIFORM refutation — one Turing machine and one
absolute constant C such that every k-CNF with n variables and m clauses is counted in
2^{C·min(km/√log m, k²n·loglog n/√log n)} steps — but its final assembly materializes an
exponential pad, so the machine's space tracks its time (2^{o(n)}, not polynomial).
openai-math's SubexponentialSAT corpus proves per-prefix polynomial space bounds for
counting k-SAT — but with a machine chosen per k, and no min-route over the two
exponents. We target the conjunction, which neither corpus states and each lacks the
other's half of by construction: **one machine, one constant C, all k ≥ 1 — the
min-route time bound AND polynomial space**, in openai's per-prefix monitor form. The
bridge object is the space predicate itself (per-execution-prefix stack content, the
stack analogue of openai's visited-interval monitor), plus the counter-combinator
calculus that replaces eth's pad-materialized fuel recursion with list-free ℕ-recursion
over the binary countdown — the two landed layers below.

## 1. Introduction

The main run's dossier 10 (novelty 5, significance 4; Top-3 #2) identified the empty
zone between the two corpora: uniformity (eth) × space (openai). The novelty case held
through both rounds of literature checks: neither source paper claims the combination
(eth's paper never mentions space in the computational sense — 0 substantive hits
corpus-wide; openai's abstract quantifies "for every fixed k"), and no classical
space-optimized #SAT line attains the 2^{o(n)} time regime. The pilot was gated on the
G1 audit (CASE A ⇒ GO unconditional) and its assembly layer landed in the main run;
Cycle 2 resumes at the counter layer. This draft exists so the landing is a fill-in.

**Honesty.** The theorem's halves are the corpora's; the deltas are (a) the bridged
definition `SpaceWithin` (per-prefix total stack content of a TM2 machine — the reading
that makes "cells ever occupied" comparable across stack/track machines), (b) the
counter-combinator calculus L1 (below), and (c) the uniform conjunction packaging. As
mathematics the result is an assembly; as a formal artifact it is the first
uniform-plus-space statement anywhere, and the first formal contact between the two
ETH-refuting corpora.

## 2. Setting

eth's objects, verbatim: `M : Turing.TM2ComputableAux Bool Bool` with finite alphabets
(`MainResults.lean:178`); `timeMin C k m n = ⌊2^{C·min(expM k m, expN k n)}⌋₊` with
expM = km/√(log₂ m), expN = k²n·log₂log₂ n/√(log₂ n) (:144–154); `CountsWithin`
(:158–160); the hypotheses of the uniform MainTheorem (:179) — k ≥ 1, n ≥ 4, k-CNF,
2 ≤ clause count, all variables occurring. openai's monitor: `visitedSpace c = Σ i,
(c.upper i − c.lower i + 1).toNat` bounded at every prefix (`SubexponentialSAT.lean:
166–189`, `SqrtLogSpace/Final.lean:122–128`). The bridged definition: `SpaceWithin M x
t S` iff every configuration reached within s ≤ t steps has total stack content ≤ S —
for stacks, which shrink, the per-prefix sup of current content replaces the monotone
interval extent; both readings bound cells ever occupied.

## 3. Main result (target theorem)

There exist M, C, S : ℕ and e : ℕ with finite alphabets such that for every k ≥ 1,
n ≥ 4, and every φ : CNF n satisfying eth's hypotheses:

    CountsWithin M k φ (timeMin C k φ.length n)
    ∧ SpaceWithin M (encInput k φ) (timeMin C k φ.length n) (S·((encInput k φ).length + 1)^e).

Corollaries (by unrolling the definition): openai's per-prefix monitor form with explicit
intermediate configurations; `ETHIsFalse` (`MainResults.lean:122`) recovered verbatim
(time is unchanged). Note |encInput k φ| = k + 1 + n + 1 + m·k·(⌊log₂(2n)⌋+1) — the space
bound is polynomial in the input length, genuinely.

## 4. The landed layers

**Layer L3 (main-run M1, GREEN + axioms-clean):** `Groundwork.exists_tm_space` — the
space-annotated assembly: eth's `exists_tm` machine lifted with `∀ t, SpaceWithin N x t
(c·(|x|+1)^c)` — plus `exists_tm_space_at_time` (the dossier's exact shape) and
`exists_tm_space_monitor` (the headline in openai's per-prefix form), all three
`[propext, Classical.choice, Quot.sound]` (blueprint §M1 run log, m1-run3/4 logs). This
layer is wall-free: it does not touch the pad.

**Layer L1 (Cycle-2 milestone M2, GREEN + full axcheck, 2026-11-13):** the counter
combinators, namespace `PaddedDescent.F` — `foldC`/`collectC`/`findC` (list-free
ℕ-recursion over the binary countdown) and `rngC`/`sumFC`/`prodC`/`capC` (nb :=
pad.length, cut at min · nb inside) — proving: **agreement with eth's materialized
counterparts at every pad** (`rngC_agree`, `sumFC_agree`, `prodC_agree`, `capC_agree`,
`findC_agree`, bridge `foldC_agree`: the countdown fold IS the fold of the materialized
range); **inactivity gives the uncut semantics** (eth's five Fuel.lean lemmas
transported: `rngC_eq` … `len_capC_le`); and the **composite agreement** in both Prog.lean
idioms — the cut-sum leaf (`termFCD_agree`) and the generic counted descent
(`expandC`/`descendC` vs eth's `expand`/`descend` at `Prog.lean:144,148`, with
`descendC_agree_pad` = the prework's `f (pad k, …) = fC (2^k, …)` and `descendC_uncut`
= the inactivity transport: pattern counts and work-list words ≤ nb ⇒ the counter
descent is the uncut breadth-first expansion). L1.lean: 529 LoC / 25 theorems (+ donor
layer transcribed in-file); runs l1-run1..4, run3 first GREEN, run4-final linter-clean;
**full axcheck: 27/27 theorems, every axiom set ⊆ the triad, 0 sorryAx**
(`AxPilot10_L1_full.lean` OK, l1-run4-final.log).

This layer is the space argument's engine: replacing pad materialization by countdown
recursion is exactly what converts eth's 2^{o(n)}-space descent into a polynomial-stack
one, and the agreement lemmas are what make the time side carry over verbatim.

## 5. Pending

- **Layer L2 (descent bookkeeping, on disk: 2,595 LoC / 126 theorems per the ledger
  row; defect review for Part D — rw directions, omega atoms, goal-side rewrites — was
  in flight when the outage hit; unrun at wrap):** [VERDICT:10-L2].
- Headline conjunction + monitor corollary, final LoC/thm count, close-out axcheck:
  [VERDICT:10-L2].

## 6. Relation to prior work

- **anthropics `eth`** ("A 2^{o(n)} Time Algorithm for 3-SAT", Hexagon, to appear;
  corpus `eth/proof/`): the uniform machine and time bound — `MainTheorem`,
  `Wrap.countingBoundImpliesFailureOfETH`; the pad mechanism (`PaddedDescent/Pad.lean:
  93–94`: state sizes 2|x| + 2·2^{e·x} + 3) is the space obstruction this theorem
  removes at the assembly level.
- **openai-math** ("The Exponential Time Hypothesis is False", 2026-10-17 rev. 10-25;
  `SubexponentialSAT`, `SqrtLogSpace`): the per-prefix space monitor and per-k
  poly-space counting (`sat_polynomial_space`, `Final.lean:149–182`); Appendix B's
  binary-budget counter method is L1's nearest in-corpus relative.
- Literature: Dalmau-type poly-space counting lines (different time regimes, no 2^{o(n)},
  no formalization — dossier 10 §Novelty's nearest-miss list; R8 round-2 sweep clean).
- No uniform+space combination claimed anywhere: corpus greps (eth: 0 computational
  "space" hits; openai: per-k quantifiers throughout) + both papers' text audited.

## 7. Limitations and open problems

- The headline is unlanded until L2 goes GREEN ([VERDICT:10-L2]); the two proved layers
  stand independently (assembly wall-free; counter calculus self-contained).
- The space bound's polynomial exponent e is not optimized anywhere — the theorem's
  point is the shape (uniform × poly-space × min-route), not tight exponents.
- Asymptotic (=O) time forms and randomized cost models are out of scope (article 11's
  calculus territory).

## References

- anthropics_formal-math `eth/` (`MainResults.lean:122,144–160,178–179`,
  `PaddedDescent/Pad.lean:93–94`, `Prog.lean:144,148`, Fuel layer). openai-math
  `lean/ComparatorChallenges/SubexponentialSAT.lean:166–189`,
  `SqrtLogSpace/{Asymptotics,Final}.lean`. mathlib `Computability/TuringMachine/
  Computable.lean:142`. Dossier 10; `research/pilots/10-prework.md` (§5 lemmas L1–L3,
  §9 G1 audit CASE A); `research/pilots/10-blueprint.md`; logs `research/pilots/10/
  logs/{m1-run3-green,m1-run4-final,l1-run3-green,l1-run4-final}.log`.
