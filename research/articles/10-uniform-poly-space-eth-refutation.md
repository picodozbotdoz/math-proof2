# Toward One Machine for All k: Space-Certified Layers for a Uniform, Polynomial-Space ETH Refutation

*cross-math-fronttier research article 10 (main-run dossier, Cycle-2 article) · FINAL
(three proved layers; the assembly tranche carried to Iteration 4, by orchestrator decision
2026-11-14) · dossier `research/candidates/10-z3-uniform-poly-space-eth-refutation.md`
(Top-3 #2) · blueprint `research/pilots/10-blueprint.md` · Lean
`research/pilots/10/{M1,L1,L2}.lean` · next-tranche spec `research/pilots/10/next-tranche-spec.md`*

**Status: three layers PROVED; headline theorem OPEN.** M1 (space-annotated host
simulation), L1 (counter combinators agree with padded ones) and L2 (the space-certified
countdown loop and the first value-time/word-space certificate) are kernel-verified.
L2.lean has 2,625 lines and 151 theorems, every one with axioms ⊆
`{propext, Classical.choice, Quot.sound}`. **The target theorem of §3, one machine for all
k with polynomial space, is not proved.** What remains is the assembly tranche: the
relabeling walk between two input encodings and the counter-based padding machine. It is
specified and carried to Iteration 4. This article reports the proved layers as its
results.

---

## Abstract

Two 2026 formal corpora refute the Exponential Time Hypothesis (ETH) from opposite
sides.
- The anthropics `eth` corpus proves a *k-uniform* refutation: one Turing machine and one
  constant C count the solutions of every k-CNF in 2^{C·min(km/√log m, k²n·loglog n/√log n)}
  steps. But its assembly materializes an exponentially long pad, so space tracks time.
- openai-math's SubexponentialSAT proves polynomial space per execution prefix, but with a
  machine chosen *per k*.

The conjunction (uniform in k, the min-route time bound, *and* polynomial space) is
stated in neither corpus, and each corpus lacks the other's half by construction. We
prove three layers of it in Lean:

- **(M1)** A space-annotated host simulation. Every polynomial-time "stepped" machine
  with polynomial-size states runs on eth's host TM2 machine in eth's time *and* in
  polynomial stack space at every prefix. This includes openai's monitor form.
- **(L1)** Counter combinators. Binary-countdown versions of eth's pad-driven fold, sum,
  product, cap and find combinators agree with the originals at every pad length, and
  give the uncut semantics when inactive.
- **(L2)** A countdown loop on a ⌈log₂ n⌉-bit counter. Its run time is polynomial in the
  *value* n, while its space is polynomial in the *word* (bit length) of n. It comes with
  the certificate discipline `PolyTVal` and a first certificate, `polyTVal_id`.

L2's value-time/word-space separation is the mechanism that replaces eth's exponential
pad by a logarithmic-size counter.

## 1. Introduction

**The gap.** eth's padded descent drives its recursions with a pad of length 2^{e(x)}
(`PaddedDescent/Pad.lean:93–94`). The resulting machine's configurations hold that pad,
so its space is 2^{o(n)}, not polynomial. openai-math's poly-space bound
(`SqrtLogSpace/Final.lean:122–128`) is proved for each fixed k separately. Dossier 10
(novelty 5, significance 4) identified the conjunction as unclaimed. Both papers were
audited: eth's never discusses space in the computational sense, and openai's quantifies
"for every fixed k". No classical poly-space #SAT line reaches the 2^{o(n)} time regime.

**The idea.** Keep eth's time analysis verbatim, but replace every pad-length-driven
loop by a loop over a binary counter. A counter of value nb occupies Nat.size nb + 2
symbols, so loops still run nb rounds (time unchanged up to polynomial factors). But
nothing exponential is ever written down. M1 shows the host simulation preserves
polynomial space for any polynomial-size machine. L1 shows the counter combinators
compute the same values as eth's padded ones. L2 builds the counter loop as an actual
machine fragment and proves its time/space bounds.

**Honesty.** The two halves of the target theorem are the corpora's. The contributions
are:
- (a) the bridged space predicate;
- (b) the counter calculus and its agreement theorems;
- (c) the space-certified countdown machine and certificate discipline;
- (d) the uniform conjunction as a stated target.

The remaining tranche is, by its specification, "eth-library-grade plumbing, not new
mathematics". But until it lands the headline is a target, not a theorem.

## 2. Setting

- **Machines** are mathlib's `Turing.TM2` with finite alphabets, packaged by eth as
  `TM2ComputableAux Bool Bool` (`MainResults.lean:178`). eth's `Stepped` machines carry
  an `IsPolyT` instance: polynomial-time init/step/output fragments.
- **Space** (`SpaceWithinTM tm l t S`, `M1.lean:1402`): every configuration reached in
  s ≤ t steps from the initial configuration on input l has total stack content ≤ S.
  `SpaceWithin M x t S` is the same for a machine on input word x. For stacks, which
  shrink, the per-prefix bound on current content is the right analogue of openai's
  visited-interval monitor. Both bound the cells ever occupied (`visitedStacks_le`).
- **Counter word** (`L2.lean:2115`): `cw n = L :: bits(n) ++ [R]`, the binary digits of n,
  lowest first, between brackets; |cw n| = Nat.size n + 2.

## 3. Target theorem (not proved)

There exist a machine M and constants C, S, e such that for all k ≥ 1, n ≥ 4, and every
k-CNF φ on n variables satisfying eth's hypotheses,
  CountsWithin M k φ (timeMin C k |φ| n) ∧
  SpaceWithin M (encInput k φ) (timeMin C k |φ| n) (S·(|encInput k φ| + 1)^e).
Here |encInput k φ| = k + 1 + n + 1 + m·k·(⌊log₂ 2n⌋ + 1), so the bound is genuinely
polynomial in the input length. `ETHIsFalse` (`MainResults.lean:122`) would follow
verbatim, since time is unchanged.

## 4. Results (proved)

**Theorem M1 (`Groundwork.exists_tm_space`).** For every stepped machine M with
`[IsPolyT M]` and every d, there are a TM2 machine N with finite alphabets and a constant
c such that: whenever M runs on x in T steps using states of size S ≤ (|x| + 2)^d with
output b,
- N outputs b on x within c·(T + 1)·(|x| + 1)^c steps, and
- for every t, `SpaceWithin N x t (c·(|x| + 1)^c)`.

Variants:
- `exists_tm_space_at_time`: the space bound at the output time.
- `exists_tm_space_monitor`: every located prefix trace of N, up to the output time,
  has visited at most c'·(|x| + 1)^{c'} stack cells. This is openai's monitor shape
  (`SqrtLogSpace/Final.lean:122–128`).

**Theorem family L1 (namespace `PaddedDescent.F`, `L1.lean`).** For the countdown
combinators `foldC`, `collectC`, `findC`, `rngC`, `sumFC`, `prodC` and `capC` (where
nb := pad length and loops are cut at min(·, nb)):
1. **Agreement.** Each equals eth's materialized counterpart at every pad: `rngC_agree`,
   `sumFC_agree`, `prodC_agree`, `capC_agree`, `findC_agree`. Via `foldC_agree`, the
   countdown fold *is* the fold over the materialized range.
2. **Inactivity.** When the cut is inactive, the combinators have eth's uncut semantics.
   These are eth's five Fuel lemmas, transported (`rngC_eq` … `len_capC_le`).
3. **Composite agreement**, in both of eth's Prog.lean idioms:
   - the cut-sum leaf `termFCD_agree`;
   - the counted descent `descendC_agree_pad`: f(pad k, …) = fC(2^k, …);
   - `descendC_uncut`: when pattern counts and work-list words are ≤ nb, the counter
     descent is the uncut breadth-first expansion (`Prog.lean:144,148`).

**Theorem L2a (`cdLoop_runsB`, the per-iteration clock).** Let `body` be a fragment that
transforms the main stack M into fbody(M), with |fbody M| ≤ |M|, in at most tb steps,
never exceeding its starting size. Then for all n, X, B₀, N₀, the loop `cdLoop body`,
started with X on the main stack and cw n on the counter stack:
- runs fbody n times, ending at (fbody^[n] X, cw 0);
- takes at most n·(3·|bits n| + 5 + tb) + 1 steps. This is polynomial in the **value**
  n;
- keeps every configuration's size ≤ start + g·(3·|bits n| + 3 + tb), where g is the
  loop's growth constant. This is polynomial in the **word** of n.

**Definition L2b (`PolyTVal f`).** f : α → ℕ → β is *value-time / word-space computable*
if a single fragment P exists, together with polynomially bounded ct and cs, such that
for all x and nb:
- P runs from (wd x, cw nb, [], []) to (wd(f x nb), cw 0, [], []) in ≤ ct(|x| + nb)
  steps;
- every configuration on the way has size ≤ cs(|x| + size nb);
- |f x nb| ≤ cs(|x| + size nb).

**Theorem L2c (`polyTVal_id`).** The identity (x, nb) ↦ x is `PolyTVal`, with time
16·(|x| + nb + 1)^16 and space (4g + 16)·(|x| + size nb + 1)^{4g+16}. This is the first
certificate of the value-time/word-space shape. Every later certificate over the counter
combinators has the form "countdown loop + round body".

**Theorem L2d (`countdown_cut`).** Started from cw(min q nb), the trivial-body loop runs
exactly min(q, nb) rounds, in ≤ min(q, nb)·(3·|bits(min q nb)| + 6) + 1 steps. This is
L1's cut realized as a machine: enumeration of 0, …, min(q, nb) − 1 with nothing built.

## 5. Proofs (outline)

**M1** follows eth's host simulation (`Machine/Host.lean`, transcribed). Each of M's
init/step/output fragments runs in polynomial time and polynomial growth. The host keeps
one encoded state of size ≤ S on its stacks at any time. Induction over the step count
bounds every reached configuration by the sum of the state encoding and the fragment
working space, giving c·(|x| + 1)^c with S ≤ (|x| + 2)^d. `visitedStacks_le` converts
the per-prefix content bound into the visited-cells monitor. Each stack's high-water mark
is at most S, so the total over the finitely many stacks is |K|·S.

**L1** is induction on the countdown. The binary counter's decrement sequence visits
nb − 1, …, 0, matching eth's materialized range `rng pad`. Agreement of each combinator
reduces to `foldC_agree`. The composite descent lemmas induct on the descent depth, with
the pad-length/2^k correspondence.

**L2a** is induction on n. One round is a decrement of cw n (fragment `cdFrag`), costing
≤ 3·|bits n| + 5 steps and touching only the counter stack, then the body. The counter
never grows beyond its initial word (`stkLen_st`, `bits_odd_dec`, `bits_pow_sub_one` for
the borrow chain), and the body stays below its start. So the ceiling is the initial size
plus the per-round growth, which involves |bits n| and not n. `loop_growth_le` bounds the
loop combinator's growth. **L2c** instantiates L2a with the one-step body `skipF` and
bounds n(3n + 6) + 1 ≤ 16(l + nb + 1)^16 by elementary arithmetic (`bound16`, `boundW`).
**L2d** is L2a at n = min q nb. ∎

## 6. Formal verification

| file | content | size | run | axioms |
|---|---|---|---|---|
| `pilots/10/M1.lean` | M1 (+ transcribed eth host layer) | 2,043 lines | `m1-run3-confirm-axcheck.log`, `m1-run4-final.log` | all triad |
| `pilots/10/L1.lean` | L1 | 529 lines, 25 thms | `l1-run4-final.log` | full axcheck 27/27 ⊆ triad |
| `pilots/10/L2.lean` | M1 verbatim + Part D (L2) | 2,625 lines, 151 thms | `l2-run5-final-green.log` (errors 12→3→1→0) | 151/151 ⊆ triad, 0 sorryAx |

All three files are Cycle-2 final-sweep targets: `AxPilot10_M1`, `AxPilot10_L1` and
`AxPilot10_L2` are OK, with 106, 36 and 126 axiom lines respectively, and 0 sorryAx
(`pilots/10/logs/axcheck-c2-final.log`). In L2's own audit, 31 print lines were truncated
in the Modal log. All of them belong to the byte-identical M1 region, which M1's own
audit covers.

## 7. Relation to prior work

- **anthropics `eth`** (corpus `eth/proof/`): the uniform machine and time bound
  (`MainTheorem`; `Wrap.countingBoundImpliesFailureOfETH`). Its pad mechanism
  (`PaddedDescent/Pad.lean:93–94`, state sizes 2|x| + 2·2^{e(x)} + 3) is the space
  obstruction that L1/L2 are built to remove.
- **openai-math** ("The Exponential Time Hypothesis is False", 2026-10-17, rev. 10-25;
  `SubexponentialSAT`, `SqrtLogSpace`): the per-prefix space monitor and per-k
  poly-space counting (`sat_polynomial_space`, `Final.lean:149–182`). Its Appendix B
  binary-budget counter is L1's nearest in-corpus relative.
- **Literature:** classical polynomial-space #SAT algorithms run in other time regimes.
  None reaches 2^{o(n)}, and none is formalized (dossier 10 §Novelty).

## 8. Limitations and open problems

1. **The headline is open.** Still needed (`next-tranche-spec.md`, D1–D6):
   - the Stepped-level counter padding machine `padM'` with eth's Closure layer;
   - the theorem `exists_tm_padded_space`, which is eth's `exists_tm_padded` plus the
     space conjunct;
   - the relabeling walk between the bracket encoding `wd` and the counter word `cw`.

   After that, the `PolyTVal` certificates for the solver pipeline's state transitions
   must be proved over L1's combinators.
2. The polynomial exponents (16, 4g + 16, c) are not optimized. The point is the shape:
   value-time, word-space.
3. Asymptotic big-O forms and randomized cost models are out of scope (article 11's
   calculus covers that territory).

## References

anthropics_formal-math `eth/` (`MainResults.lean:122,144–160,178–179`,
`PaddedDescent/Pad.lean:93–94,116–120`, `Prog.lean:144,148`, `Machine/Host.lean:47–297`,
Fuel layer). openai-math `lean/ComparatorChallenges/SubexponentialSAT.lean:166–189`,
`SqrtLogSpace/{Asymptotics,Final}.lean`. mathlib `Computability/TuringMachine`. Project:
dossier 10; `pilots/10-prework.md` (§3, §5, §9 G1 audit); `pilots/10-blueprint.md`;
`pilots/10/next-tranche-spec.md`; logs `pilots/10/logs/`.
