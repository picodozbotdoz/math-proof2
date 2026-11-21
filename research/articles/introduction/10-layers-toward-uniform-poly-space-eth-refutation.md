# Toward One Machine for All k: Space-Certified Layers for a Uniform, Polynomial-Space ETH Refutation — a beginner's introduction

> **What this file is.** An expository, non-normative companion to the research article
> [Toward One Machine for All k: Space-Certified Layers for a Uniform, Polynomial-Space ETH Refutation](../10-layers-toward-uniform-poly-space-eth-refutation.md).
> Audience: an undergraduate mathematics background — no Lean, no computational complexity theory, no exposure to this project assumed.
> Nothing here adds, weakens, or replaces any claim of the article: if this file and the article ever disagree, the article and its Lean artifacts win.
> Written 2026-11-21 against the article's committed state.

## 1. In plain words

A famous bet in theoretical computer science, the Exponential Time Hypothesis (ETH), says
in rough terms: deciding whether Boolean formulas are satisfiable cannot be done
dramatically faster than trying exponentially many true/false assignments. A formal,
machine-checked mathematics corpus — call it "eth" — proves a strong theorem in this
landscape: one single abstract computer decides satisfiability for every clause width k at
once, within a subexponential time budget. That machine pays for it with memory: a step of
its proof writes down an exponentially long filler string, so its space use is exponential.
A second corpus proves polynomial memory, but with a different machine for each width.
This article states the missing conjunction — one machine, all widths, subexponential time
AND polynomial space — as a target, and says plainly that the target is **not** proved.
What is proved (kernel-checked, no gaps) is a ladder of layers that dismantle the memory
obstruction piece by piece: a simulation that preserves polynomial space, counter-based
loops that compute exactly what the filler-string loops computed, a space-certified
countdown loop, and a padding machine whose state never holds anything exponential.

## 2. The background, in one page

### 2.1 Formulas, satisfiability, and the ETH (classical)

A k-CNF is a Boolean formula that is an AND of clauses, each clause an OR of at most k
literals (a literal is a variable or its negation). k-SAT asks whether some assignment of
true/false to the n variables makes every clause true. The Exponential Time Hypothesis
(classical) says: no algorithm solves 3-SAT in 2^{o(n)} steps, where 2^{o(n)} denotes any
growth slower than 2^{εn} for every ε > 0. An algorithm that fast would "refute ETH".

### 2.2 Time versus space (classical)

An idealized computer (a Turing-machine variant) transforms its state one step at a time.
Its time cost is the number of steps; its space cost is the number of memory cells ever
occupied. These are different budgets: a machine can be fast yet memory-hungry.
"Polynomial space" means at most (input length)^constant cells; "polynomial time" the same
shape for steps.

### 2.3 The two halves the corpora own

The eth corpus proves the k-uniform time bound: one machine, all widths, subexponential
time. Its mechanism drives its loops with a **pad** — a filler string of length 2^{e(x)}
materialized in the machine's state — so its space is exponential. The openai-math corpus
proves polynomial space for its counting, but "for each fixed k": a different machine per
width. Neither corpus proves, or even states, the conjunction (the article's §1 audits
both).

### 2.4 The idea: count instead of materialize

A binary counter counting m − 1, m − 2, …, 0 visits the same m values as a loop over a
materialized list of length m — but the counter's word occupies only (number of binary
digits of m) + 2 symbols, never m itself. The program: keep eth's time analysis verbatim,
replace every pad-driven loop by a counter-driven one, and prove space stays polynomial.
The article's core question: can the full conjunction be assembled this way? Its answer
today: the verified layers below; the final assembly is open.

## 3. One example, by hand

The smallest object of the article is the **counter word**: cw n = L :: bits(n) ++ [R] —
the binary digits of n, lowest bit first, wrapped in two bracket symbols. Its length is
(number of binary digits of n) + 2. Take n = 5 = 101₂: three digits, so cw 5 occupies
3 + 2 = 5 symbols. The materialized pad of the same loop length would be 2⁵ = 32 symbols.
That is the whole trick: logarithmic word, exponential value.

Run the article's countdown loop (Theorem 4's machine) from cw 5 with a trivial body, and
apply the article's own recorded bounds by hand:

| quantity | the article's formula (§3) | at n = 5, trivial body |
|---|---|---|
| rounds | runs the body n times | 5 |
| steps | ≤ n·(3·\|bits n\| + 5 + tb) + 1 | 5·(3·3 + 5 + 0) + 1 = **71** |
| space | ≤ start + g·(3·\|bits n\| + 3 + tb) | start + g·(9 + 3) = start + 12g |

(g is the loop's growth constant, tb the body's step bound, |bits 5| = 3.) The cut form
(Theorem 7) with q = nb = 5 gives the same 5 rounds in ≤ 5·(3·3 + 6) + 1 = **76** steps.

The padding machine (Theorem 8) shows the contrast the article aims at. Give it an input
word x with |x| = 4 and an exponent function with e x = 10, so eth's pad holds
2^{10} = 1024 symbols. Eth's padding machine carries states of size ≤ 2|x| + 2·2^{e x} + 3
(article §3, quoting eth `Pad.lean:93–94`): 8 + 2048 + 3 = **2039**. The article's counter
padding machine carries states of size ≤ 2|x| + e x + 4: 8 + 10 + 4 = **22**. The
exponential 2^{e x} enters only through the number of doubling steps (e x + 1 = 11 steps),
never through the state.

*Provenance:* the formulas — cw n's length, Theorems 4, 7 and 8's step/space/state bounds,
and eth's state bound — are article-recorded (article §2 and §3, Theorems 4, 7, 8, with the
eth bound quoted there). Every concrete number in the tables above is hand-computed from
those recorded formulas; no log records these particular instantiations, and none is
invented.

## 4. How the proof works, without Lean

**M1 (Theorem 2), the space-preserving simulation.** The host machine's three fragments
(initialization, one step, output extraction) each run in polynomial time with polynomial
growth. The simulation keeps one encoded machine state, of size at most S, on its stacks;
induction over the step count bounds every configuration ever reached by the state encoding
plus the fragments' working space. Given the hypothesis S ≤ (|x| + 2)^d — polynomial in the
input — everything folds into c·(|x| + 1)^c. A companion form converts the per-moment
content bound into a visited-cells count (openai's monitor shape).

**L1 (Theorem 3), agreement.** Induction on the countdown: the binary counter's decrement
sequence visits nb − 1, nb − 2, …, 0 — exactly the values eth's materialized range lists.
So each counter-based combinator computes the same value as eth's pad-based one at every
pad length; the composite descent lemmas induct on the descent depth.

**L2 (Theorem 4), the certified loop.** Induction on n. One round is one counter decrement
(at most 3·|bits n| + 5 steps, touching only the counter stack) then the body. Two
monotonicities do the work: the counter never grows beyond its initial word, and the body
never exceeds its starting size. Per-step growth constants then give the space ceiling.

**D1–D3, the padding machine.** The counter machine produces the pad's effect by e x
successive doublings of a register; nothing of size 2^{e x} is ever stored, so states stay
at 2|x| + e x + 4. Arithmetic lemmas (Theorem 10) absorb the leftover factor e + 2 into a
polynomial base, so eth's time analysis survives verbatim.

## 5. What the main results say, informally

- **Theorem 1 — the target.** One machine M and constants C, S, e such that for every
  width k and every admissible k-CNF φ, M halts within eth's time bound with the right
  answer AND uses at most S·(|encInput k φ| + 1)^e space — polynomial in the input length.
  Since time is unchanged, eth's refutation of ETH would follow verbatim, now in
  polynomial space. **Not proved in this article; the headline is open.** → article §3,
  Thm 1.
- **Theorem 2 (M1), `Groundwork.exists_tm_space` (+ variants 2a, 2b).** Every
  polynomial-time-fragment machine whose state size obeys S ≤ (|x| + 2)^d is simulated by
  a concrete TM2 machine keeping the time bound up to a polynomial factor and running in
  polynomial space (2a: at the output time; 2b: the visited-cells monitor shape).
  PROVED-UNCONDITIONAL. → article §3, Thm 2.
- **Theorem 3 (L1), the agreement family.** The seven counter combinators equal eth's
  materialized counterparts at every pad; when the cut is inactive they have eth's uncut
  semantics; the composite descent agreements hold in both of eth's idioms.
  PROVED-UNCONDITIONAL. → article §3, Thm 3.
- **Theorem 4 (L2a) with Definition 5, Theorems 6–7.** The countdown loop runs n rounds in
  time polynomial in the VALUE n and space polynomial in the WORD of n; the first
  certificate of that value-time/word-space shape is the identity (Theorem 6); the cut
  version runs exactly min(q, nb) rounds (Theorem 7). PROVED-UNCONDITIONAL. → article §3,
  Thm 4, Def 5, Thms 6–7.
- **Theorem 8 (D1), the counter padding machine.** Parts (a)–(c): it reaches its output in
  e x + 1 steps with every state ≤ 2|x| + e x + 4 — PROVED-UNCONDITIONAL (the exponent
  function e is a free parameter). Part (d): states polynomially bounded in |x| alone —
  PROVED-CONDITIONAL on the binder hv : ∃ k, ∀ x, e x ≤ (|x| + 2)^k. A binder is a
  hypothesis the formal theorem carries as an explicit assumption; the kernel proof is
  complete relative to it; the article names and does not discharge it. (The assembly
  plan's earlier bare-`PolyT` form of (d) is FALSE — e x = 2^{|x|²} satisfies `PolyT` but
  violates (d); §7.1 carries the correction.) → article §3, Thm 8.
- **Theorem 9 (D2).** The padding machine's three fields are polynomial-time computable —
  PROVED-CONDITIONAL on the parameter-polynomiality binders he : PolyT e, hA' : PolyT A'
  (the same hypothesis shape eth's own interface carries). → article §3, Thm 9.
- **Theorem 10 (D3).** Pad bound and time absorption: the e + 2 factor absorbs into the
  polynomial base, preserving eth's host time analysis with the counter machine's state
  bound. PROVED-UNCONDITIONAL. → article §3, Thm 10.
- **What is *not* here:** the headline assembly (D4) and the relabeling/certificate steps
  (D5–D6), carried to the next iteration; exponents are not optimized. → article §7.

## 6. Glossary

| symbol | one-line meaning | example |
|---|---|---|
| k-CNF, k-SAT | AND-of-ORs formula, ≤ k literals per clause; the satisfiability question | (x₁ ∨ ¬x₂) ∧ (x₂ ∨ x₃) |
| ETH | Exponential Time Hypothesis: no 2^{o(n)} algorithm for 3-SAT (classical bet) | — |
| eth | the sibling corpus whose MainTheorem is the k-uniform time bound | `anthropics_formal-math/eth` |
| TM2, M | mathlib's stack-machine model (a Turing-machine variant with finitely many stacks); an abstract machine over it | — |
| \|x\| | length of the input word x | \|x\| = 4 above |
| timeMin C k m n | eth's time scale ⌊2^{C·min(expM k m, expN k n)}⌋ | — |
| CountsWithin M k φ t | M halts within t steps with the satisfying-count in its lowest n+1 bits | — |
| SpaceWithin M x t S | every configuration reached by time t holds ≤ S symbols | S·(\|x\|+1)^e in the target |
| IsPolyT, PolyT | machine (resp. function) with polynomial-time fragments, ≤ c·(len+1)^c | the class Theorem 2 quantifies over |
| S ≤ (\|x\|+2)^d | size hypothesis: the simulated state is polynomially bounded | inside Thm 2's implication |
| bits n, Nat.size n | binary digits of n, lowest first; their count | bits 5 = [1,0,1], size 3 |
| cw n | counter word L :: bits n ++ [R] | \|cw 5\| = 5 |
| pad 2^{e(x)} | eth's filler string driving its loops | 1024 symbols at e x = 10 |
| cdLoop body | the countdown loop: decrement, then run body | 5 rounds from cw 5 |
| PolyTVal | value-time/word-space computability (Def. 5) | Theorem 6's identity |
| hv; he, hA' | binders: e is value-polynomial (∃ k, ∀ x, e x ≤ (\|x\|+2)^k); the padding machine's parameters are polynomial-time | Thm 8(d); Thm 9 |
| triad | the three routine Lean axioms: propext, Classical.choice, Quot.sound | — |
| PROVED-UNCONDITIONAL / -CONDITIONAL | kernel-checked beyond the triad only / relative to named binders | Thm 2 / Thm 8(d) |

## 7. What this is — and what it is not

- "ETH" here is the Exponential Time Hypothesis of complexity theory, and "eth" is the
  sibling corpus formalizing a refutation-shaped theorem about it — not entropy, not
  physics, and not the appendix naming of article 30.
- "Space" means memory (cells occupied), not geometric space; the article's point is that
  a time bound does not give a space bound for free.
- "Padding" is a loop-driving technique: materialize a filler string of length 2^{e(x)} so
  a loop can run that many rounds. The article replaces the materialized pad with a binary
  counter; nothing philosophical is meant.
- "Machine" is an idealized computing device in a formal model (mathlib's TM2), not a
  machine-learning model and not a physical device.
- The headline is a target, not a theorem: no status row claims Theorem 1, and the proved
  layers are billed as engineering toward it, never as new mathematics. "Kernel-verified"
  means every theorem was machine-checked term by term by the Lean type checker against
  fixed axioms — the triad (propext, Classical.choice, Quot.sound) is the full set used.

## 8. How to read the real article

- Claim in words → §1 here, then the article's abstract (whose first line flags the open
  headline).
- Formal statements → article §3, with the glossary (§6 here) open; the coding paragraph
  there defines encInput, timeMin and CountsWithin.
- Proof ideas → §4 here, then article §5.
- Verification → article §6 (formal-record table), `research/pilots/10/*.lean`, and the
  cited logs under `research/pilots/10/logs/`.
- Novelty and nearest misses → article §4 (donor table, scoped-novelty statement).
- What stays open → article §7 (assembly state D1–D6, the dated spec correction) and the
  plan `research/pilots/10/next-tranche-spec.md`.

## 9. What you need going in

- Polynomial growth: functions bounded by c·n^c, and how such bounds absorb constants.
- Binary representation of integers; n has about log₂ n binary digits.
- Induction over loop iterations (the proofs induct on step and round counts).
- What an idealized computer is, in one sentence: a finite control reading and writing
  symbols in memory, one step at a time — and what a hypothesis binder is (§5 above);
  nothing else about Lean.
