# Pre-work de-risking — dossier 10 (z3-uniform-poly-space-eth-refutation): the pad

Lane R4, 2026-11-09. Task: work out, at sketch level, the argument replacing eth's
materialized pad (length 2^{e x}) by a space-cheap device, maintaining a per-prefix
space certificate in openai's monitor sense; classify which eth lemmas carry over
verbatim vs need analogues; name the three new lemmas; document any genuine wall.
Companion docs: `research/candidates/10-z3-uniform-poly-space-eth-refutation.md`
(statement: `SpaceWithin` def + quantifier structure),
`research/bridges/complexity.md` §4 Z3. All citations read this session unless marked.
**Verdict up front: conditional GO** (sequencing recommendation §7) — the combinator
layer de-risked beautifully; one genuine wall candidate (the frontier-size conflation,
§6 W3) survives, with a bounded audit (G1) that decides it in ≤ 2 days of corpus
reading, and a fallback (DFS restructuring) that preserves the theorem at higher cost.

---

## §1 Where the exponential space actually comes from [VERIFIED]

The pad pipeline, in three decls:

- `pad k = List.replicate (2^k) ()` (`eth/proof/rates/PaddedDescent/Pad.lean:30`) — a
  list of units; informationally empty (dossier 10, QA-verified C2).
- `padM e A` (`Pad.lean:35–40`): a `Stepped` machine doubling the pad per step, then
  applying `A` in one step; `padM_runs` (`:93–94`) bounds its **state size** by
  `2|x| + 2·2^{e x} + 3`. The state *contains the pad list* (`σ = (List Bool × List
  Unit) ⊕ Bool`, `:36`).
- `exists_tm_padded` (`:116–125`): from `PolyT e`, `PolyT A` concludes a TM2 halting in
  `q·(|x| + 2^{e x} + 1)^q` steps — via `exists_tm' (padM e A)`, whose simulation
  (Host.lean, §4 below) writes **coded configurations onto the TM2 stacks**. The coded
  configuration of a state containing a 2^{e x}-long list is itself exponential.
  Hence space ≈ time for every machine built this way. No eth statement mentions
  space (dossier 10 novelty: 0 rg hits).

So the space is not spent by "the algorithm" in the abstract — it is spent by the
*piping idiom*: A receives the pad as **input word**, and the step machine's state, and
therefore the TM2's stacks, hold it.

## §2 The design insight: the pad enters through exactly three combinators [VERIFIED]

`eth/proof/rates/PaddedDescent/F/Fuel.lean:15–23` (docstring, read in full this
session) — the pad is a *discipline*, and the discipline is local:

> "`U` is a number in unary; the pad is a `U`. Every enumeration of exponentially many
> things runs over `rng pad q` (or `sumF q pad`) …; every loop whose state could grow
> puts `cap pad d` around the state after each round. So all functions built this way
> are polynomial-time in (pad, arguments) without any side condition, and the
> mathematics is only needed to show that, for a long enough pad, no cut-off is
> active (`rng_eq`, `sumF_eq`, `cap_eq`)."

The three combinators (`Fuel.lean:35,38,45`):

    rng  pad q     = List.range (min q pad.length)                -- enumeration cut
    sumF N pad f   = (List.range (min N pad.length)).foldl (·+f·) 0  -- summation cut
    cap  pad d x   = if len x ≤ pad.length then x else d          -- state-size cut

with inactivity lemmas `rng_eq`/`sumF_eq` (`:51,54`) — and every Solver-pipeline
routine (`enumF`, `expandG`, `stepG`, `descendG`, `solveG`,
`eth/proof/rates/ClauseBound/Alg/Prog.lean:28–102`) is *built from these*, threading
`pad : U` down to the combinators. This kills the scary version of the problem: **no
general Fr-normal-form theorem over arbitrary fragments is needed** — a pad-length
`ℕ`-counter (`nb`) suffices wherever `pad.length` is used, provided the combinators
are rebuilt list-free.

## §3 The replacement device: a binary countdown clock, not a phase index

What replaces the physical pad is a **pair of binary counters**:

- `nb : ℕ` — the *virtual pad length* (replaces `pad.length`; carried in binary,
  `⌈log₂ nb⌉ + 1` bits), set to `2^{e x}` once `e x` is computed;
- `ct : ℕ` — a *loop countdown* replacing materialized `List.range` iteration: every
  `rng pad q`-fold and `sumF N pad f`-fold becomes `loopC nb q f` = iterate `f` over
  `y < min q nb` with a binary counter `y`, never building the list.

The new discipline ("PolyTVal"): a fragment computes `fC (nb, args)` in time
polynomial in `(len args + nb)` — value, not word length — and the exponential-time
budget `2^{O(e x)}` is paid by `nb = 2^{e x}` while the *space* stays
`poly(len args + ⌈log₂ nb⌉)`. Countdown mechanics: each iteration costs
`poly(log nb)` fragment steps (increment/decrement on a ⌈log₂ nb⌉-bit counter), total
`min q nb · poly(log nb) ≤ 2^{O(e x)}` — the polynomial degradation is absorbed by
eth's own halving trick ("The polynomial factor is paid at the very end, by proving
the bound in steps for δ/2", `proof/networks/Paper/SecNetworks_Model.lean:38–40`),
i.e. by the constant `C`, which is exactly how `exists_tm`'s `c·(T+1)·(|x|+1)^c`
overhead is already absorbed. **No log-factor loss threatens the time bound** — the
loss is polynomial, and the theorem's `C` is existentially quantified.

## §4 The per-prefix space certificate and what carries over verbatim

`SpaceWithin` (dossier 10) is maintained across the simulation by instrumenting the
one place stacks grow — the configuration coding in the assembly theorem:

- `exists_tm (M : Stepped …) [IsPolyT M] (d : ℕ)` (`eth/proof/machines/ToTuring/
  Machine/Host.lean:305–309`): from `M.Runs x T S b` with `S ≤ (|x|+2)^d` concludes a
  TM2 with time `c·(T+1)·(|x|+1)^c`. Its proof (read at `:310–319`) decomposes each
  simulated step into init/step/out fragment runs over **coded states of ≤
  `7·(|x|+2)^d` symbols** (`pL`, `:313`). Stack content at any prefix = coded current
  state (+ transient scratch of the running fragment, itself bounded by the fragment's
  output-length discipline: `PolyT` bundles `len (f x) ≤ c·(len x + 1)^c`,
  `ToTuring/PolyT.lean:58`). Therefore: if the Stepped machine's states are
  polynomial-size, the assembled TM2 satisfies `SpaceWithin` with a polynomial —
  **the certificate is a stack-length invariant threaded through the existing
  step-induction** (`Stepped.Reaches` is inductive over steps,
  `statements/StepMachineStatements.lean:62–71`, with the size bound `S` already a
  parameter of `Reaches`/`Runs` — the eth model was built to carry exactly this).
- openai's monitor supplies the *statement pattern and the per-prefix discipline*
  (`ComparatorChallenges/SubexponentialSAT.lean:166–189`; library form with
  `visitedSpace_mono`/`visitedSpace_le_of_envelope`,
  `OAI/Algorithms/SubexponentialSAT/SqrtLogSpace/VisitedTape.lean` — decl-index
  verified): bound every *intermediate* configuration, not just the final one. The
  `Reaches` induction gives this for free (the invariant is checked at each `step`
  node).
- The `Wrap` layers (`Wrap/Main.lean:27–46`): `CodingExists` (every machine has a
  configuration coding) and `Sim` (a fixed host runs the given machine step by step,
  poly-time front and back ends) — each is `PolyT`, hence stack-polynomial, hence
  preserves `SpaceWithin` up to constant changes.

**Carries over verbatim** (no changes): all of `PolyT` and its closure lemmas
(`PolyT.lean:54–94`) — the calculus is space-silent and reuse-free; `Solver.Correct`
(`ClauseBound/Alg/Interfaces.lean:137–138`) — the pad enters only through the
hypothesis `2^S.need … ≤ pad.length`, which becomes `2^S.need ≤ nb`, same inequality;
`FitsG`/`needG`/`BudG` (`Interfaces.lean:54–74`) — already pure length arithmetic;
the entire mathematical layer (`rates/`, `threesat/`, `sparsification/`,
`consequences/`) — the pad never appears in the mathematics, only in the machine
layer; `steps_to_time`'s pattern (`SecNetworks_Model.lean:67–74`).

**Needs analogues**: `exists_tm_padded` → the clocked assembly (L3 below);
`padM`/`padM_runs` → a counter machine with poly state size (routine); the seven
`StCert*` polynomial-time certificates (`Interfaces.lean:111–120`: StCertEnum,
StCertGrid, StCertLam, StCertExpandG, StCertBruteK, StCertSolveG, StCertNeedC) →
PolyTVal re-proofs over the counter combinators (the bulk of the new work).

## §5 The three new lemmas

- **L1 (combinator agreement — routine).** Counter combinators
  `rngC nb q`, `sumFC nb N f`, `capC nb d x` with `nb : ℕ` replacing `pad.length`,
  defined list-free (binary countdown). For every pipeline routine `f` over `U`-pads
  and its counter variant `fC`: `f (pad k, args) = fC (2^k, args)` whenever the
  cut-offs are inactive — by structural induction mirroring each def
  (`Prog.lean:28–102`), using `rng_eq`/`sumF_eq` (`Fuel.lean:51,54`) at the leaves and
  the inactivity bounds already proved as `StNeedG`/`FitsG` (`Interfaces.lean:54,74`).
  Estimated 300–600 LoC.
- **L2 (PolyTVal certificates — the hard new layer).** Each `fC` is computed by an
  `Fr` fragment in time `poly(len args + nb)` and space `poly(len args + ⌈log nb⌉)`:
  a `PolyTVal` predicate + countdown-loop fragment combinator + re-proofs of the
  seven `StCert*` statements. This is the genuinely new proof infrastructure — the
  `PolyT` calculus bounds time by word *length* and cannot express value-bounded
  loops; the loop combinator must thread a per-iteration clock. Estimated 600–1200
  LoC. Hardest single item: `StCertSolveG` (the top-level recursion over the
  schedule, whose per-level frontier interacts with W3 below).
- **L3 (space-annotated assembly — localized).** `exists_tm` analogue: for `M :
  Stepped (List Bool) Bool`, `IsPolyT M`, `M.Runs x T S b`, `S ≤ (|x|+2)^d`, there is
  `N` with the time conclusion of `exists_tm` **and** `SpaceWithin N x (c·(|x|+1)^c)`
  — proof = instrument Host.lean's simulation with a stack-length invariant at each
  `Reaches.step`; the coded-state size bound `pL` (`Host.lean:313`) is the only
  quantitative input. Estimated 200–400 LoC inside one file.

Assembly of the main theorem: counter-`padM'` (states `(x, nb, phase)`, size
`poly(|x| + e x)`) + L2 certificates for `A'` + L3 + the Wrap layers (§4) + re-run
`CountedRoute.mainTheoremHolds`'s shape. Uniformity in k survives untouched: the
clock's constants come from the fragments, which are fixed before k exactly as
`PolyT`'s are (`MainResults.lean:177–180` order of quantifiers is unchanged); the
countdown replaces only the pad plumbing inside `A`. [ARGUED]

## §6 Walls examined

- **W1 — does space-certified simulation lose a factor?** No fundamental loss: time
  degrades polynomially (countdown overhead), absorbed by `C`; space is exactly poly
  because the coded state is poly and fragments carry output-length bounds
  (`PolyT.lean:58`). [ARGUED, §3–4]
- **W2 — uniformity-in-k conflict?** None: the clock is as uniform as the pad it
  replaces (§5, last paragraph). [ARGUED]
- **W3 — THE GENUINE WALL CANDIDATE: the pad conflates time budget and state budget.
  [VERIFIED as conflation; open whether de-conflatable]** `FitsG` demands
  `cnt · instLen + 8z + 4lam + 40 ≤ F` (state budget) **and** the enumeration budgets
  (`BudG`, `P.need`) in the *same* `F = pad.length` (`Interfaces.lean:54–60`); and
  `cap` cuts *any* growing state at `pad.length` (`Fuel.lean:45`). The frontier of
  live instances in `descendG`/`stepG` multiplies by
  `nPat s lam = P.cnt s.h lam ^ nRectG s.p s.d` per level (`Prog.lean`,
  "The number of patterns", verified this session) — if `P.cnt` is linear in λ (the
  piece count of the eight-square construction is ≈ λ/3 + 1 pieces,
  `EightSquareStatement.lean:75–76` `tOf lam = (lam + 2)/3`), then `nPat` is
  exponential in the grid dimensions and the **true frontier may itself be
  exponential**, in which case `List`-free combinators do not suffice: the algorithm
  is breadth-first with an exponential state, and polynomial space requires a
  **depth-first restructuring** — process children one at a time, accumulator in
  place of the frontier list. That is sound for the ℤ-valued results (finite sums
  re-associate), but it changes the structure every `St…` correctness lemma reasons
  about (they are phrased over `foldl` of materialized lists), pushing L1 → L1′ with
  new correctness obligations and effort M → L.
  **Decision procedure (audit G1, ≤ 2 days):** read the level arithmetic
  (`rates/PiecesCounted/`, `rates/Given*`, `BudG` users) and determine whether the
  *inactive-cap* theorems already bound the frontier by a polynomial in the input
  (Case A: `cap` is slack by an exponential margin on real runs ⇒ L1–L3 suffice, GO
  as planned) or the frontier genuinely reaches `pad.length` (Case B: L1′ DFS
  restructuring required, theorem survives, cost L). Either way the *statement* of
  dossier 10 stands; only the effort and the lemma list move.

## §7 Recommendation — GO (conditional), sequencing

**GO**, with this sequencing: (1) run audit **G1 first** (≤ 2 days, corpus reading
only — the two named outcomes §6 W3 bound the pilot's effort class in advance);
(2) pilot **11 milestone 1 proceeds in parallel regardless** (zero overlap with the
pad question, and its `Red.comp` constant convention §5-(i) is a prerequisite
abstraction if Case B forces the DFS restructuring's correctness to be phrased as
composed reductions over the schedule); (3) if G1 = Case A, pilot 10 starts
immediately after 11-M1 with L3 (the most reusable, smallest wall-free tranche) as
its own first milestone; if G1 = Case B, pilot 10 is re-scoped to L + L1′ and drops
behind dossier 12 in the pilot queue (12's F3b-free core would then pilot first).
The early-obstruction principle applies: W3 is now on the record before any Lean is
written, with a bounded audit to resolve it.

## §8 Sources (this session)

eth: `Pad.lean` (all 135), `Fuel.lean:1–60`, `Prog.lean:10–113`,
`Interfaces.lean` (all 195), `StepMachineStatements.lean:1–80`,
`ToTuring/Machine/Host.lean:301–319`, `Wrap/Main.lean:1–60`,
`SecNetworks_Model.lean:1–76`, `EightSquareStatement.lean:73–99`. openai:
`SubexponentialSAT.lean:149–189`; `SqrtLogSpace/VisitedTape.lean` (decl-index row),
`SqrtLogSpace/Final.lean:74–147` (prior session). Cross-refs:
`research/candidates/10-*.md`, `research/qa/bridges-spotcheck.md` C1–C5 (my Z3 cites
QA'd 10/10 at load-bearing level), `research/pilots/11-blueprint.md` §6 (Logspace
finding), `research/feasibility/port-probe.md`.

---

## §9 G1-scoped audit (2026-11-09, lane R4 — reading + analysis only, no Lean)

Task: decide, from eth sources directly, whether the descent frontier
(`nPat = P.cnt^nRectG` per level, total `cnt·nPat^levels`) can actually reach
`pad.length` in the main-theorem parameter regime (§6 W3), or whether the exponential
pad is driven purely by the time-side enumeration budgets — i.e., whether the
state-budget terms inside `FitsG`/`BudG` are polynomially bounded and exponentially
slack against the pad.

**Evidence read this session (all [VERIFIED] against source):**

1. **The pieces count is polynomial in λ.** Definition 7, clause (c):
   "|𝓘| ≤ (2λ)^c" — `PiecesCountedStatement.lean` module docstring (paper Def 7
   rendering); the "2^{cλ}" in Def 7 is the *operation count* (time to compute piece
   values), not the count. The `PiecesF.Spec` field is `cnt : ℕ → ℕ → ℕ` with
   `cnt_pos : 1 ≤ P.cnt h lam` (`ClauseBound/Alg/Data.lean:48–51`) and the Def-7
   instance bound rides in `Data.Is ρ c`'s clauses.
2. **`nPat` is therefore polynomial.** `nPat P s lam = P.cnt s.h lam ^ nRectG s.p s.d`
   (`Prog.lean:44`) — (poly in λ)^(#rectangles, poly in p·d ≤ K) = polynomial in (K, λ).
3. **Per-level growth functions are polynomial-shaped.** `lamNextG` (`Prog.lean:71`):
   `(D·ubarG + 3p²(d²(m·λ)))/(D·K²) + 1` with `ubarG` a polynomial formula
   (`Prog.lean:61`); `bNextG` (`Prog.lean:110`): polynomial in (B, λ, K);
   `PnG s lam = m·(p·d²·λ)` (`Prog.lean`); `ebarG` (`Prog.lean`):
   `c2·d·p·λ + nRectG p d + 8(√(b·(nRectG·(λ+h))²/a)+1)` — polynomial in (p, d, λ, h).
   Over the fixed finite schedule (Theorem A's K_ℓ), composing polynomial growths stays
   polynomial.
4. **The pad's exponential size is demanded only by time-side budgets.** `BudG`
   (`Prog.lean`, "What one step needs of the length F of the pad") requires:
   `2 ^ P.need s.h lam ≤ F` (the pieces' loop pad — the enumeration budget, exponent
   scale c·λ·(2mλ)² per Def 7's 2^{cλ}-operations reading), `2 ^ ebarG ≤ F` /
   `2 ^ (p²dλ) ≤ F` (grid enumeration, polynomial exponents in K²λ), and — on the
   state side — only `nPat ≤ F`, `K^p ≤ F`, `2^{PnG} ≤ F`, `2^{(K−1)·lamNextG} ≤ F`:
   each a POLYNOMIAL compared against the same F. `FitsG`'s state clause
   `cnt·instLen + 8z + 4λ + 40 ≤ F` (`Interfaces.lean:55`) is likewise polynomial.
   The top-instance clause `2^{Kup(Kup−1)/2·λ} ≤ F` (`Interfaces.lean:55`) is
   polynomial in the input.

**Verdict: CASE A.** In the main-theorem regime the frontier
(`cnt·∏ nPat`) and every state-budget term are polynomial in (K, λ, B) — while the pad
is `2^{poly(K²λ)}` because the *enumeration* budgets (`2^{P.need}`, `2^{ebarG}`, the
2^{eK²λ} network evaluation of Lemma 1) demand it. The conflation of §6 W3 is real
(one F serves both) but **harmless by an exponential margin**: `cap pad d` state-cuts
are exponentially slack on real runs, and no DFS restructuring (L1′) is needed. The
polynomial-space theorem needs only: counter combinators (L1), PolyTVal certificates
(L2), and the space-annotated assembly (L3) — the §5 plan as written.

*What a full audit would still add (not needed for the verdict):* (i) theorem-level
instantiation checking that the pieces used by the main theorem satisfy `Data.Is` with
the fixed c at every schedule level (Def 7's clause (c) is the statement-level
guarantee); (ii) explicit polynomial bounds for λ_ℓ, B_ℓ along Theorem A's actual
schedule (the formulas above are polynomial-shaped; a composed explicit bound is
routine bookkeeping); (iii) `ebarG`'s asymptotic role vs `P.need` (both polynomial
exponents — only their constants matter for the final C).

**Sequencing implication: pilot 10 may start immediately after the top-3 handoff, with
L3 (space-annotated `exists_tm`) as its first milestone** — the §7 GO is now
unconditional on the audit question.
