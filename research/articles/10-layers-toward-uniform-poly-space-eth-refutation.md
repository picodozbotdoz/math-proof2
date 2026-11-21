# Toward One Machine for All k: Space-Certified Layers for a Uniform, Polynomial-Space ETH Refutation

*kind: TECHNICAL-RECORD — retained as an article by the recorded project decision of
2026-11-16 (`research/articles/README.md` §C: "KEEPS article status as a relabeled
technical record"); outside TEMPLATE-iter4 §0's closed kept set {11, 20, 50, 52, 72} ·
date: 2026-11-09 (revised 2026-11-21; theorems and proofs unchanged) · supersedes: none ·
artifacts: `research/pilots/10/{M1,L1,L2,L3,L4,L5}.lean`, `research/pilots/10/logs/`
(each log carries a provenance header), `research/pilots/10/next-tranche-spec.md` (the
assembly plan), candidate record `research/candidates/10-z3-uniform-poly-space-eth-refutation.md`
(the "dossier": the project's tracked novelty and significance assessment — novelty
grade 5, significance 4 at triage), blueprint `research/pilots/10-blueprint.md`*

**Headline status: open.** The target theorem of §3 — one machine for all k, polynomial
space — is not proved in this article; no status row below claims it. The rows cover the
proved material only, one row per theorem (grouping only a theorem and its stated
variants).

| theorem | status | hypotheses | evidence |
|---|---|---|---|
| Theorem 2 (M1) `Groundwork.exists_tm_space` (+ variants 2a `exists_tm_space_at_time`, 2b `exists_tm_space_monitor`) | PROVED-UNCONDITIONAL | none beyond the definitions of the subject: a stepped machine `M` with an `IsPolyT` instance (polynomial-time init/step/output fragments — a defined property, §2); the size hypothesis `S ≤ (|x|+2)^d` sits inside the statement's implication | `research/pilots/10/logs/m1-run4-final.log:14–17` (verdict `:1`, stage OK `:12`); full-coverage audit `research/pilots/10/logs/axcheck-c2-final.log:5` (106 axiom lines, 0 sorryAx) |
| Theorem 3 (L1) `PaddedDescent.F.{foldC,collectC,rngC,sumFC,prodC,capC,findC}_agree` + the transported inactivity lemmas (`rng_eq`…`cap_eq`, `rngC_eq`…`len_capC_le`) + the composite agreements (`termFCD_agree`, `expandC_agree`, `descendC_agree`, `descendC_agree_pad`, `descendC_uncut`) | PROVED-UNCONDITIONAL | none | `research/pilots/10/logs/l1-run4-final.log:15–31` and `:39–43` — `collectC_agree` prints `[propext]` only, the rest ⊆ {propext, Classical.choice, Quot.sound}; `capC_agree` axiom-free (`:68`); full audit 27/27 at `:1`, stage OK `:13`; `axcheck-c2-final.log:3` (36 axiom lines, 0 sorryAx) |
| Theorem 4 (L2a) `Counted.cdFrag_runs`, `cdLoop_runsB`; Definition 5 (`PolyTVal`); Theorems 6–7 (`polyTVal_id`, `countdown_cut`) | PROVED-UNCONDITIONAL | none | `research/pilots/10/logs/l2-run5-final-green.log:19–23` (verdict `:1`; full audit 151/151 ⊆ triad, 0 sorryAx, `:1`); `axcheck-c2-final.log:4` (126 axiom lines, 0 sorryAx) |
| Theorem 8 (a)–(c) (D1, unconditional members) `Groundwork.PadC.padM'_reaches`, `padM'_runs`, `padM'_state_poly_pair` (+ size lemmas `size_bools`, `size_two_pow`) | PROVED-UNCONDITIONAL | none (the exponent function `e : List Bool → ℕ` is a free parameter; parts (a)–(c) hold for every `e`) | `research/pilots/10/logs/d1-run1.log:25–30` (stage OK `:14`); `size_bools`, `size_two_pow` print `[propext, Quot.sound]`, the machine theorems ⊆ triad |
| Theorem 8 (d) (D1) `Groundwork.PadC.padM'_state_poly` | PROVED-CONDITIONAL | `hv : ∃ k : ℕ, ∀ x : List Bool, e x ≤ (x.length + 2)^k`, with the exponent function `e : List Bool → ℕ` explicit (value-polynomiality of `e`; the dated correction of the assembly plan's bare-`PolyT e` form, which is false — §7.1) | `research/pilots/10/logs/d1-run1.log:30` (stage OK `:14`); declaration `research/pilots/10/L3.lean:2764–2766` |
| Theorem 9 (D2) `Groundwork.PadC.padM'_isPolyT` — the `IsPolyT` instance of the counter padding machine (fields: init via `padM'_init_polyT` + `padM'_init_eq`, step via `padM'_step_polyT`, out via `padM'_out_polyT`; support `canary_init`, `canary_pair`, `carried_σ`, `decide_le`, `log2'`, `mul`, `foldl_add`, `foldr`) | PROVED-CONDITIONAL | `he : PolyT e`, `hA' : PolyT A'` — the counter machine's parameter functions are polynomial-time computable (the same hypothesis shape as eth's `exists_tm_padded`, `Pad.lean:116–120`) | `research/pilots/10/logs/d2-run4.log:110` (repeated `:141`; verdict `:1`, stage OK `:82`); `padM'_init_eq` prints `[propext, Quot.sound]`, the rest ⊆ triad |
| Theorem 10 (D3) `Groundwork.PadC.pad_bound`, `padded_time_absorb` (eth `Pad.lean:98–109` verbatim, one pin-adjustment: `pow_le_pow_right'`) | PROVED-UNCONDITIONAL | none (arithmetic in q, l, e) | `research/pilots/10/logs/d3-run1.log:44–45` (verdict `:1`, stage OK `:15`) |

Substrate: mathlib `ff2494ea`, Lean v4.36.0-rc2; no `sorry`, no `native_decide`, no
external CAS; every printed axiom set ⊆ {propext, Classical.choice, Quot.sound}.
**The target theorem of §3, one machine for all k with polynomial space, is not
proved.** The proved layers are M1 (space-annotated host simulation), L1 (counter
combinators agreeing with padded ones), L2 (the space-certified countdown loop and the
first value-time/word-space certificate), and — as assembly toward that target, billed
engineering, never novelty — the counter padding machine D1 with its polynomial-time
closure D2 and the pad bound D3 (§7).

## Abstract

Is there one machine deciding k-SAT for every clause width k within the Exponential Time
Hypothesis (ETH)-refuting time bound in polynomial space? Target (Thm. 1, §3): M, C, S,
e with CountsWithin M k φ (timeMin C k \|φ\| n) and SpaceWithin M (encInput k φ)
(S(\|encInput k φ\|+1)^e) at that time, for every k ≥ 1, n ≥ 4, k-CNF φ with 1 ≤ k,
IsKCNF k φ, 2 ≤ φ.length, 4 ≤ n, AllOccur φ. Theorem 1 is open, not proved here. M1,
host simulation: polynomial-time machines with polynomial-size states keep the anthropics
eth corpus's time bound, gain polynomial stack space (PROVED-UNCONDITIONAL); L1,
binary-countdown combinators agreeing with eth's padded ones at every pad
(PROVED-UNCONDITIONAL); L2, space-certified countdown loop: time polynomial in the
counter's value, space in its word (PROVED-UNCONDITIONAL); D1–D3 assembly: counter
padding machine, polynomial-state arithmetic (one member PROVED-CONDITIONAL on
hv : ∃ k, ∀ x, e x ≤ (\|x\|+2)^k), its polynomial-time closure (PROVED-CONDITIONAL on
parameter polynomiality), pad bound (PROVED-UNCONDITIONAL). Scoped novelty: engineering
toward that conjunction, not new mathematics. Nearest prior: eth (k-uniform time,
exponential pad) and openai-math's SubexponentialSAT (polynomial space, machine per k)
supply one half each.

## 1. Introduction

**The gap.** eth's padded descent drives its recursions with a pad of length 2^{e(x)}
(`anthropics_formal-math/eth/proof/rates/PaddedDescent/Pad.lean:93–94`; "eth" is this
shorthand for the anthropics formal-math corpus throughout). The resulting machine's
configurations hold that pad, so its space is exponential, not polynomial. openai-math's
poly-space bound (`SqrtLogSpace/Final.lean:122–128`) is proved for each fixed k
separately. The candidate record (novelty grade 5, significance 4 at triage) identified
the conjunction as unclaimed. Both papers were audited: eth's never discusses space in
the computational sense (text extraction over its paper: zero occurrences of "memory",
"polynomial space" or "poly-space"), and openai's quantifies "for every fixed k". Within
the audited corpora, no poly-space #SAT line reaches the 2^{o(n)} time regime; the
classical literature sweep is pending in the candidate record (§4 scopes this precisely).

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

The remaining assembly is, by its own plan, transcription-grade work on eth's library
pieces, not new mathematics ("eth-Lib-grade plumbing, not new mathematics",
`next-tranche-spec.md:6`); until it is proved, the headline is a target, not a theorem.

## 2. Setting and notation

- **Machines** are mathlib's `Turing.TM2` with finite alphabets, packaged by eth as
  `TM2ComputableAux Bool Bool` (eth `MainResults.lean:177–180`). The Groundwork layer's
  `Stepped` structure (`research/pilots/10/M1.lean:923`) packages a stepped machine; the
  class `IsPolyT` (`M1.lean:1108`) bundles polynomial-time init/step/output fragments,
  each a `PolyT` witness (`M1.lean:1093`: one fragment running in ≤ c·(len x + 1)^c
  steps with output word of length ≤ c·(len x + 1)^c).
- **Space** (`SpaceWithinTM tm l t S`, `M1.lean:1402`): every configuration reached in
  s ≤ t steps from the initial configuration on input l has total stack content ≤ S.
  `SpaceWithin M x t S` (`M1.lean:1407`) is the same for a machine on input word x. For
  stacks, which shrink, the per-prefix bound on current content is the analogue of
  openai's visited-interval monitor; both bound the cells ever occupied
  (`visitedStacks_le`, `M1.lean:2006`).
- **Counter word** (`research/pilots/10/L2.lean:2115`): `cw n = L :: bits(n) ++ [R]`,
  the binary digits of n, lowest first, between brackets; |cw n| = Nat.size n + 2
  (`L2.lean:2119`).

## 3. Main results

Numbered theorems; every hypothesis explicit. Donor citations are to
`anthropics_formal-math/eth/` ("eth") and `openai-math/`.

**The coding.** For a k-CNF φ with n variables and m clauses, eth codes the input as
`encInput k φ = 1ᵏ 0 ++ encClauses k φ` (`MainResults.lean:138–139`), where
`encClauses k φ` is 1ⁿ 0 followed by, for each clause and each of its k literal slots,
⌊log₂ 2n⌋ + 1 bits (`MainResults.lean:85–88`); hence
|encInput k φ| = k + 1 + n + 1 + m·k·(⌊log₂ 2n⌋ + 1). The time scale:
`timeMin C k m n = ⌊2^{C·min(expM k m, expN k n)}⌋₊` with `expM k m = k·m/√(log m)` and
`expN k n = k²·n·log log n/√(log n)` (`MainResults.lean:144–155`; `lg` :144, `expM`
:147, `expN` :150, `timeMin` :153). `CountsWithin M k φ t`: M started on `encInput k φ`
halts within t steps with output `numSat φ` in its lowest n + 1 bits
(`MainResults.lean:158–160`; `numSat` :130, `binary` :135). The five hypotheses of eth's
`MainTheorem` (`MainResults.lean:177–180`): 1 ≤ k; `IsKCNF k φ` (every clause has ≤ k
literals and φ has no repeated clause, `MainResults.lean:69`); 2 ≤ φ.length; 4 ≤ n;
`AllOccur φ` (every variable occurs, `MainResults.lean:127`).

**Theorem 1 (the target; open).** There exist a machine M and constants C, S, e such
that for all k ≥ 1, n ≥ 4 and every k-CNF φ on n variables satisfying the five
hypotheses above,
  CountsWithin M k φ (timeMin C k φ.length n) ∧
  SpaceWithin M (encInput k φ) (timeMin C k φ.length n) (S·(|encInput k φ| + 1)^e).
The space bound is polynomial in the input length
k + 1 + n + 1 + m·k·(⌊log₂ 2n⌋ + 1). Since time is unchanged, eth's `ETHIsFalse`
(`MainResults.lean:122`) would follow verbatim. **Not proved in this article; the
headline is open.**

**Theorem 2 (M1; `Groundwork.exists_tm_space`, `research/pilots/10/M1.lean:1798`).**
For every stepped machine M with `[IsPolyT M]` and every d, there are a TM2 machine N
with finite alphabets and a constant c such that for all x, T, S, b: if
`M.Runs x T S b` and S ≤ (|x| + 2)^d, then N outputs b on x within
c·(T + 1)·(|x| + 1)^c steps, and for every t, `SpaceWithin N x t (c·(|x| + 1)^c)`.
- **Theorem 2a** (`exists_tm_space_at_time`, `M1.lean:1899`): the space bound at the
  output time only.
- **Theorem 2b** (`exists_tm_space_monitor`, `M1.lean:2019`): every located prefix
  trace of N, up to the output time, has visited at most c'·(|x| + 1)^{c'} stack cells —
  openai's monitor shape (`openai-math/lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean:122–128`).

**Theorem 3 (L1 agreement family; namespace `PaddedDescent.F`,
`research/pilots/10/L1.lean`).** For the countdown combinators `foldC`, `collectC`,
`findC`, `rngC`, `sumFC`, `prodC`, `capC` (nb := pad length; loops are cut at
min(·, nb)):
1. **Agreement.** Each equals eth's materialized counterpart at every pad:
   `foldC_agree` (the countdown fold is the fold over the materialized range;
   `L1.lean:226`), `collectC_agree` (:239), `rngC_agree` (:293), `sumFC_agree` (:299),
   `prodC_agree` (:304), `capC_agree` (:309), `findC_agree` (:313).
2. **Inactivity.** When the cut is inactive, the combinators have eth's uncut
   semantics — eth's five fuel lemmas transported (`rng_eq` :161, `sumF_eq` :164,
   `prodL_eq` :176, `cap_eq` :185, `len_cap_le` :188) and their counter forms
   (`rngC_eq` :319, `sumFC_eq` :324, `prodC_eq` :337, `capC_eq` :347, `len_capC_le`
   :351).
3. **Composite agreement**, in both of eth's Prog.lean idioms: the cut-sum leaf
   `termFCD_agree` (:373); the counted descent `descendC_agree_pad`:
   f(pad k, …) = fC(2^k, …) (:465, via `expandC_agree` :426 and `descendC_agree` :454);
   `descendC_uncut`: when pattern counts and work-list words are ≤ nb, the counter
   descent is the uncut breadth-first expansion (:505; eth
   `proof/rates/PaddedDescent/F/Prog.lean:144,148`).

**Theorem 4 (L2a; `cdLoop_runsB`, `research/pilots/10/L2.lean:2412`).** Let `body` be a
fragment that transforms the main stack M into fbody(M), with the hypotheses
(hl) |fbody M| ≤ |M| for every M and (hb) every run of `body` from a state of the form
st M A B N takes at most tb steps and never exceeds its starting size. Then for all n,
X, B₀, N₀, the loop `cdLoop body`, started with X on the main stack and cw n on the
counter stack:
- runs fbody n times, ending at (fbody^[n] X, cw 0);
- takes at most n·(3·|bits n| + 5 + tb) + 1 steps — polynomial in the **value** n;
- keeps every configuration's size ≤ start + g·(3·|bits n| + 3 + tb), where g is the
  loop's growth constant — polynomial in the **word** of n.

**Definition 5 (value-time/word-space computability; `PolyTVal`,
`L2.lean:2487`).** f : α → ℕ → β is `PolyTVal` if a single fragment P exists, with
polynomially bounded ct and cs, such that for all x and nb: P runs from
(wd x, cw nb, [], []) to (wd(f x nb), cw 0, [], []) in ≤ ct(|x| + nb) steps; every
configuration on the way has size ≤ cs(|x| + size nb); and |f x nb| ≤ cs(|x| + size nb).

**Theorem 6 (L2c; `polyTVal_id`, `L2.lean:2555`).** The identity (x, nb) ↦ x is
`PolyTVal`, with time 16·(|x| + nb + 1)^16 and space
(4g + 16)·(|x| + size nb + 1)^{4g+16} (g the countdown loop's growth constant). This is
the first certificate of the value-time/word-space shape; every later certificate over
the counter combinators has the form "countdown loop + round body". (The arithmetic
bound n·(3n + 6) + 1 ≤ 16·(l + nb + 1)^16 is `bound16`, `L2.lean:2498`, private.)

**Theorem 7 (L2d; `countdown_cut`, `L2.lean:2609`).** Started from cw(min q nb), the
trivial-body loop runs exactly min(q, nb) rounds, in ≤
min(q, nb)·(3·|bits(min q nb)| + 6) + 1 steps — L1's cut realized as a machine:
enumeration of 0, …, min(q, nb) − 1 with nothing built.

**Theorem 8 (D1; the counter padding machine `padM'`, `research/pilots/10/L3.lean`
Part E).** For explicit `e : List Bool → ℕ` and `A' : List Bool × ℕ → Bool`:
- (a) `padM'_reaches` (`L3.lean:2713`): for all d, k with k + d = e x, the machine
  reaches from the initial state (x, 2^k) to the output A'(x, 2^{e x}) in d + 1 steps,
  with every intermediate state of size ≤ 2·|x| + e x + 4;
- (b) `padM'_runs` (:2744): `(padM' e A').Runs x (e x + 1) (2·|x| + e x + 4)
  (A' (x, 2^{e x}))`;
- (c) `padM'_state_poly_pair` (:2751): for every e there is d with
  2·|x| + e x + 4 ≤ (|x| + e x + 2)^d for all x;
- (d) **`padM'_state_poly` (:2764), PROVED-CONDITIONAL on the binder
  `hv : ∃ k, ∀ x, e x ≤ (|x| + 2)^k`:** there is d with 2·|x| + e x + 4 ≤ (|x| + 2)^d
  for all x.

Parts (a)–(c) are unconditional (e is a free parameter; they hold for every e).
Contrast with eth: `padM_runs` holds states of size ≤ 2|x| + 2·2^{e x} + 3 (eth
`Pad.lean:93–94`); here 2^{e x} never enters the state — the exponential enters only
through the step count e x + 1 and the value e x. **Dated spec correction:** the
assembly plan's form of `padM'_state_poly` under a bare `PolyT e` hypothesis is FALSE
over the substrate's binary `Enc ℕ` (`PolyT` bounds the *word* of e x, not its value;
e x = 2^{|x|²} satisfies `PolyT` but violates the conclusion) — see §7.1.

**Theorem 9 (D2; the `IsPolyT` closure of `padM'`,
`research/pilots/10/L4.lean:4180–4182`).** `padM'_isPolyT (e) (A') (he : PolyT e)
(hA' : PolyT A') : IsPolyT (padM' e A')` — the polynomial-time instance of the counter
machine over all three fields: init via `padM'_init_polyT` (:3408) and the bridge
`padM'_init_eq` (:3412), step via `padM'_step_polyT` (:4166), out via `padM'_out_polyT`
(:3416). It is conditional on the parameters' polynomial-time computability — the same
hypothesis shape eth's `exists_tm_padded` carries (`he : PolyT e`, `hA : PolyT A`; eth
`Pad.lean:116–120`). Support: `canary_init` (:3219), `canary_pair` (:3223),
`carried_σ` (:3227), and the `PolyT`-closure combinators `decide_le` (:4020),
`log2'` (:4088), `mul` (:4139), `foldl_add` (:3616), `foldr` (:3686).

**Theorem 10 (D3; pad bound and time absorption, `research/pilots/10/L5.lean` Part
H).** `pad_bound` (`L5.lean:4223`): for all q, l, e,
q·(e + 2)·(l + 2l + 2·2^e + 3 + 1)^q ≤ (q·4^{q+1} + (q+1))·(l + 2^e + 1)^{q·4^{q+1} + (q+1)}
— eth's `Pad.lean:98–109` verbatim modulo one pin adjustment (`pow_le_pow_right'` for
the pin's exponent-monotonicity name). `padded_time_absorb` (:4241):
c·(e + 2)·(l + 1)^c ≤ (c·4^{c+1} + (c+1))·(l + 2^e + 1)^{c·4^{c+1} + (c+1)} — the
e + 2 factor absorbs into the polynomial base, so the host's time analysis is preserved
with the counter machine's state bound.

## 4. Novelty and nearest misses

| prior work (exact citation) | what it proves | why this differs |
|---|---|---|
| anthropics `eth` corpus (`eth/MainResults.lean:122,144–160,177–180`; `eth/proof/rates/PaddedDescent/Pad.lean:93–94,98–109`; `eth/proof/machines/Wrap/Main.lean:115`) | the uniform machine and the k-uniform time bound (`MainTheorem`, `MainResults.lean:177–180`; `Wrap.countingBoundImpliesFailureOfETH`, `Wrap/Main.lean:115`); its pad mechanism (state sizes 2\|x\| + 2·2^{e x} + 3, `Pad.lean:93–94`) is the space obstruction | our layers remove the obstruction: counter combinators and the countdown loop replace the materialized pad; the uniform **conjunction** with polynomial space is stated in neither corpus |
| openai-math, "The Exponential Time Hypothesis is False" (2026-10-17, rev. 2026-10-25; `openai-math/lean/ComparatorChallenges/SubexponentialSAT.lean:166–189`; `openai-math/lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean:122–128,149–182`; `openai-math/lean/OAI/Algorithms/SubexponentialSAT/SqrtLog/StatementCanonical.lean:31,37`) | the per-prefix space monitor (`visitedSpace`, `SubexponentialSAT.lean:188`) and per-k polynomial-space counting (`sat_polynomial_space`, `Final.lean:149–182`); the target quantifies per width (`MainTheorem` = ∀ width, 3 ≤ width → Feasible width, `StatementCanonical.lean:37`, with `Feasible` at `:31`) | per-k machines; the k-uniform half is eth's — the conjunction is the target neither proves; openai's Appendix B ("Exact arithmetic and space", with clause counters using O_k(log(n + 2))-bit thresholds) is L1's nearest in-corpus relative |
| classical polynomial-space #SAT and model-checking counting lines — **scoped**: candidate record 10 §Novelty check, "Known nearest misses" (3) and "Literature side: PENDING"; the classical lines are cited by the openai preprint's introduction | polynomial-space counting in other time regimes | per the candidate record: different time regimes, no 2^{o(n)} claim, no formalization; that record's wider literature sweep is pending, so no literature-wide negative is claimed here |

Scope statement. The layers are engineering toward an open headline (kind
TECHNICAL-RECORD); no layer is billed as new mathematics, and the assembly layers D1–D3
carry completion value only. The unclaimed object is the uniform, polynomial-space
conjunction of Theorem 1 (novelty record: candidate record 10 §Novelty, novelty grade 5
at triage).

## 5. Proofs

**M1 (Theorem 2)** follows eth's host simulation
(`eth/proof/machines/ToTuring/Machine/Host.lean`, transcribed). Each of M's
init/step/output fragments runs in polynomial time and polynomial growth. The host keeps
one encoded state of size ≤ S on its stacks at any time. Induction over the step count
bounds every reached configuration by the sum of the state encoding and the fragment
working space, giving c·(|x| + 1)^c with S ≤ (|x| + 2)^d. `visitedStacks_le`
(`M1.lean:2006`) converts the per-prefix content bound into the visited-cells monitor.
Each stack's high-water mark is at most S, so the total over the finitely many stacks is
|K|·S.

**L1 (Theorem 3)** is induction on the countdown. The binary counter's decrement
sequence visits nb − 1, …, 0, matching eth's materialized range `rng pad`. Agreement of
each combinator reduces to `foldC_agree`. The composite descent lemmas induct on the
descent depth, with the pad-length/2^k correspondence.

**L2a (Theorem 4)** is induction on n. One round is a decrement of cw n (fragment
`cdFrag`), costing ≤ 3·|bits n| + 5 steps and touching only the counter stack, then the
body. The counter never grows beyond its initial word (`stkLen_st`, `L2.lean:2159`;
`bits_odd_dec`, :2141; `bits_pow_sub_one`, :2130, for the borrow chain), and the body
stays below its start. So the ceiling is the initial size plus the per-round growth:
`Frag.growth` (:1256) and `Frag.step_growth` (:1259) bound a fragment's per-step growth,
and `Frag.Runs.toB` (:1363) turns any run into a run with the ceiling start +
growth·steps; `cdLoop body = Frag.loop headQ (cdFrag.seq body)` (:2205). **Theorem 6**
instantiates Theorem 4 with the one-step body `skipF` and bounds n(3n + 6) + 1 ≤
16(l + nb + 1)^16 by elementary arithmetic (`bound16`, :2498). **Theorem 7** is
Theorem 4 at n = min q nb. ∎

## 6. Formal record

| theorem | Lean declaration | file:line | axioms | log path:line |
|---|---|---|---|---|
| Thm 2 (M1) | `Groundwork.exists_tm_space` | `research/pilots/10/M1.lean:1798` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/m1-run4-final.log:14` (verdict `:1`, stage OK `:12`); confirm audit `research/pilots/10/logs/m1-run3-confirm-axcheck.log` (135 non-private theorems); `research/pilots/10/logs/axcheck-c2-final.log:5` |
| Thm 2a | `Groundwork.exists_tm_space_at_time` | `research/pilots/10/M1.lean:1899` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/m1-run4-final.log:16` |
| Thm 2b | `Groundwork.exists_tm_space_monitor` | `research/pilots/10/M1.lean:2019` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/m1-run4-final.log:17` |
| Thm 3, agreement | `PaddedDescent.F.foldC_agree` | `research/pilots/10/L1.lean:226` | [propext, Quot.sound] | `research/pilots/10/logs/l1-run4-final.log:15`; audit 27/27 at `:1` |
| Thm 3, agreement | `PaddedDescent.F.collectC_agree` | `research/pilots/10/L1.lean:239` | [propext] | `research/pilots/10/logs/l1-run4-final.log:16` |
| Thm 3, agreement | `PaddedDescent.F.rngC_agree`, `sumFC_agree`, `prodC_agree`, `findC_agree` | `research/pilots/10/L1.lean:293, 299, 304, 313` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/l1-run4-final.log:17–20` |
| Thm 3, agreement | `PaddedDescent.F.capC_agree` | `research/pilots/10/L1.lean:309` | none (rfl) | `research/pilots/10/logs/l1-run4-final.log:68` |
| Thm 3, inactivity | `PaddedDescent.F.rng_eq`, `sumF_eq`, `prodL_eq`, `cap_eq`, `len_cap_le`; `rngC_eq`, `sumFC_eq`, `prodC_eq`, `capC_eq`, `len_capC_le` | `research/pilots/10/L1.lean:161, 164, 176, 185, 188; 319, 324, 337, 347, 351` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/l1-run4-final.log:27–30` (in-file prints), `:39–43` (audit prints) |
| Thm 3, composite | `PaddedDescent.F.termFCD_agree`, `expandC_agree`, `descendC_agree`, `descendC_agree_pad`, `descendC_uncut` | `research/pilots/10/L1.lean:373, 426, 454, 465, 505` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/l1-run4-final.log:21–26` |
| Thm 4 (L2a) | `Groundwork.Counted.cdFrag_runs`, `cdLoop_runsB` | `research/pilots/10/L2.lean:2360, 2412` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/l2-run5-final-green.log:19–20` (verdict `:1`, audit 151/151 ⊆ triad, 0 sorryAx); `research/pilots/10/logs/axcheck-c2-final.log:4` |
| Def. 5 | `Groundwork.Counted.PolyTVal` | `research/pilots/10/L2.lean:2487` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/l2-run5-final-green.log:21` |
| Thm 6 | `Groundwork.Counted.polyTVal_id` | `research/pilots/10/L2.lean:2555` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/l2-run5-final-green.log:22` |
| Thm 7 | `Groundwork.Counted.countdown_cut` | `research/pilots/10/L2.lean:2609` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/l2-run5-final-green.log:23` |
| Thm 8 (a)–(c) | `Groundwork.PadC.padM'_reaches`, `padM'_runs`, `padM'_state_poly_pair`; `size_bools`, `size_two_pow` | `research/pilots/10/L3.lean:2713, 2744, 2751; 2686, 2694` | machine theorems ⊆ {propext, Classical.choice, Quot.sound}; size lemmas [propext, Quot.sound] | `research/pilots/10/logs/d1-run1.log:25–30` (stage OK `:14`) |
| Thm 8 (d) | `Groundwork.PadC.padM'_state_poly` | `research/pilots/10/L3.lean:2764` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/d1-run1.log:30` (stage OK `:14`) |
| Thm 9 (D2) | `Groundwork.PadC.padM'_isPolyT` (fields `padM'_init_polyT`, `padM'_step_polyT`, `padM'_out_polyT`, bridge `padM'_init_eq`; support `canary_init`, `canary_pair`, `carried_σ`, `decide_le`, `log2'`, `mul`, `foldl_add`, `foldr`) | `research/pilots/10/L4.lean:4180` (fields :3408, :4166, :3416, :3412; support :3219, :3223, :3227, :4020, :4088, :4139, :3616, :3686) | `padM'_isPolyT` ⊆ {propext, Classical.choice, Quot.sound}; `padM'_init_eq`, `carried_σ` [propext, Quot.sound]; rest ⊆ triad | `research/pilots/10/logs/d2-run4.log:99–110` (verdict `:1`, stage OK `:82`) |
| Thm 10 (D3) | `Groundwork.PadC.pad_bound`, `padded_time_absorb` | `research/pilots/10/L5.lean:4223, 4241` | ⊆ {propext, Classical.choice, Quot.sound} | `research/pilots/10/logs/d3-run1.log:44–45` (verdict `:1`, stage OK `:15`) |

## 7. Limitations and open problems

1. **The headline is open.** Assembly state (the plan `next-tranche-spec.md`, items
   D1–D6):
   - **D1 complete** (2026-11-17; engineering billing, never novelty): Theorem 8
     (`L3.lean` Part E). The state bound 2|x| + e x + 4 improves eth's
     2|x| + 2·2^{e x} + 3 (`Pad.lean:93–94`): the exponential enters only through the
     number of doublings, never the state. **Dated spec correction carried by this
     work:** the plan's §2 form of `padM'_state_poly` under a bare `PolyT e` is FALSE
     over the substrate's binary `Enc ℕ` (`PolyT` bounds the *word* of e x, not its
     value; e x = 2^{|x|²} is the counterexample); the completed form is the pair —
     `padM'_state_poly_pair` unconditional and `padM'_state_poly` under the explicit
     value-polynomiality binder `hv` (Theorem 8d), the form the headline's assembly
     consumes.
   - **D2 complete** (2026-11-17): Theorem 9 over all three fields (`L4.lean`;
     evidence `d2-run4.log:110`, verdict `:1`). The run of record also contains an
     earlier discarded attempt of the same file — its `sorryAx` prints (`:42`, `:56`)
     are superseded within the same log by the final passing run; the file shas
     distinguish them. The earlier interruptions had one root cause: `Nat.log2` and
     `Nat.log 2` are lemma-equal, not definitionally equal, at this pin
     (`Nat.log2_eq_log_two`, per the run record); closed by the explicit bridge
     `log2log'`.
   - **D3 complete** (2026-11-17): Theorem 10 (`L5.lean` Part H; evidence
     `d3-run1.log:44–45`).
   - **D4–D6 carried.** D4 — the headline assembly `exists_tm_padded_space`, eth's
     `exists_tm_padded` (`Pad.lean:116–120`) plus the space conjunct — is carried to
     the next iteration (recorded project decision, README row 10, 2026-11-17); D5
     (the wd↔cw relabeling walk) and D6 (the certificate transfer) unchanged. After
     D4, the `PolyTVal` certificates for the solver pipeline's state transitions must
     be proved over L1's combinators.
2. The polynomial exponents (16, 4g + 16, c) are not optimized. The point is the shape:
   value-time, word-space.
3. Asymptotic big-O forms and randomized cost models are out of scope (the corpus's
   companion calculus article, `research/articles/11-call-charged-reduction-calculus.md`,
   covers that territory).

## 8. Prior work and references

**(a) Literature.**

- anthropics formal-math, the `eth` corpus paper: "A 2^{o(n)} Time Algorithm for
  3-SAT" (per the candidate record: to appear, no arXiv id in-repo; `paper.pdf` in the
  corpus tree, path under project artifacts below). Its Theorem 1 is the k-uniform time
  bound (`MainTheorem`, `MainResults.lean:177–180`). Text extraction (2026-11-09,
  re-checked 2026-11-21) finds no computational use of "memory", "polynomial space" or
  "poly-space".
- openai-math: "The Exponential Time Hypothesis is False" (2026-10-17, rev.
  2026-10-25). Per-fixed-k poly-space counting (`sat_polynomial_space`) and the
  per-width target.
- Classical polynomial-space counting: no independent citation is made here. The
  candidate record's literature sweep is pending (candidate record 10 §Novelty check);
  the classical lines enter this article only through the openai preprint's
  introduction, as recorded there.

**(b) Project artifacts.**

- Donor `eth` (`anthropics_formal-math/eth/`): `MainResults.lean` (`IsKCNF` :69,
  `encClauses` :85, `ETHIsFalse` :122, `AllOccur` :127, `numSat` :130, `binary` :135,
  `encInput` :138, `lg`/`expM`/`expN`/`timeMin` :144–155, `CountsWithin` :158,
  `MainTheorem` :177); `proof/rates/PaddedDescent/Pad.lean` (`padM_runs` :93–94,
  `pad_bound` :98–109, `exists_tm_padded` :116–120);
  `proof/rates/PaddedDescent/F/Prog.lean:144,148`;
  `proof/machines/ToTuring/Machine/Host.lean:47–297`;
  `proof/machines/Wrap/Main.lean:115` (`countingBoundImpliesFailureOfETH`); the paper
  file `paper.pdf` at the corpus root.
- Donor openai-math: `lean/ComparatorChallenges/SubexponentialSAT.lean:166–189`
  (`monitor`, `locatedStep`, `visitedSpace` :188);
  `lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Final.lean:122–128,149–182`;
  `lean/OAI/Algorithms/SubexponentialSAT/SqrtLog/StatementCanonical.lean:31,37`;
  `lean/OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/Asymptotics.lean` (`rho`); the
  preprint file `preprints/The-Exponential-Time-Hypothesis-is-False-October-25-2026/paper.pdf`
  (Appendix B, "Exact arithmetic and space").
- mathlib `Computability/TuringMachine` (`TM2`; pin `ff2494ea`).
- Project: candidate record 10
  (`research/candidates/10-z3-uniform-poly-space-eth-refutation.md`);
  `research/pilots/10-prework.md` (§3, §5, §9 G1 audit);
  `research/pilots/10-blueprint.md`; `research/pilots/10/next-tranche-spec.md` (the
  assembly plan D1–D6, incl. the §2 form corrected by Theorem 8d);
  `research/pilots/10/logs/` (per-run provenance headers);
  `research/feasibility/VERIFICATION-LEDGER.md` (Cycle-2 final-sweep record).
