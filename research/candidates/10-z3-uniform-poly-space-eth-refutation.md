# Candidate 10 — z3-uniform-poly-space-eth-refutation

Lane proposal (R4): novelty 5, significance 4, effort 3 (M) → rank ≈ 6.7.

## Name

z3-uniform-poly-space-eth-refutation

## One-line pitch

One Turing machine with one constant C for every clause width k ≥ 1 that counts
every k-CNF in 2^{C·min{km/√log m, k²n·loglog n/√log n}} steps **while visiting only
polynomially many cells** — eth's k-uniformity married to openai-math's per-prefix
space monitor, a combination neither refutation of ETH states or proves.

## Precise mathematical statement

Objects (all defined; eth names verbatim):

- Machine: `M : Turing.TM2ComputableAux Bool Bool` with `∀ i, Finite (M.tm.Γ i)`
  (eth `MainResults.lean:178`; the structure is mathlib
  `Turing.TM2ComputableAux`, `Mathlib/Computability/TuringMachine/Computable.lean:142`).
- Time: `timeMin C k m n = ⌊2^{C·min(expM k m, expN k n)}⌋₊` with
  `expM k m = k·m/√(log₂ m)`, `expN k n = k²·n·log₂log₂ n/√(log₂ n)`
  (eth `MainResults.lean:144–154`).
- Correctness: `CountsWithin M k φ t` := `Nonempty (TM2OutputsInTime M.tm
  (encInput k φ …) (some (binary n (numSat φ) …)) t)` (eth `MainResults.lean:158–160`).
- **Space (new, bridged definition).** For a `TM2ComputableAux` machine `M`, input word
  `x : List Bool` and `t : ℕ`, say `SpaceWithin M x t S` iff for every `s ≤ t` and every
  configuration `c` reached from the start configuration on `x` within `s` steps,
  the total stack content satisfies `∑_k (c.stacks k).length ≤ S`. This is the stack
  analogue, per execution prefix, of openai-math's tape-space monitor
  `LocatedCfg.monitor`/`visitedSpace c = ∑ i, (c.upper i − c.lower i + 1).toNat`
  (`lean/ComparatorChallenges/SubexponentialSAT.lean:166–189`), which bounds the
  **visited interval** of each tape at **every prefix** (`∀ prefixSteps ≤ time …
  visitedSpace intermediate ≤ S·(L+1)^e`, `SqrtLogSpace/Final.lean:122–128`); for
  stacks, which shrink, the per-prefix sup of current content replaces the monotone
  interval extent. Both readings bound cells *ever occupied* during the run.

**Theorem (target).** There exist `M : Turing.TM2ComputableAux Bool Bool` and
constants `C S : ℕ`, `e : ℕ` with `∀ i, Finite (M.tm.Γ i)` such that for every
`k ≥ 1`, `n ≥ 4`, and every `φ : CNF n` with `IsKCNF k φ`, `2 ≤ φ.length`, `AllOccur φ`
(hypotheses exactly as in eth `MainResults.lean:179`):

    CountsWithin M k φ (timeMin C k φ.length n)
    ∧ SpaceWithin M (encInput k φ) (timeMin C k φ.length n)
        (S * ((encInput k φ).length + 1) ^ e).

Note `|encInput k φ| = k + 1 + n + 1 + m·k·(⌊log₂(2n)⌋+1)` (eth `MainResults.lean:85–87,
138–139`) — polynomial in the input length, so the space bound is genuinely polynomial.
A corollary in openai's monitor form (per-prefix, explicit intermediate configurations)
follows by unrolling the definition; and `ETHIsFalse` (eth `MainResults.lean:122`) is
recovered verbatim since time is unchanged.

## Novelty check

Corpus side (`research/qa/decl-index.tsv` absent — rg directly, 2026-11-09):

- anthropics eth: `rg -i -c 'polynomial space|poly.?space|visitedSpace|visited space'
  anthropics_formal-math/eth/` → **0 hits** (the word "space" occurs only in
  non-computational senses — "sample spaces"/"eigenspaces"; `rg -i space` over eth .lean
  files returns 1,354 hits, none computational). [erratum 2026-11-09, H/QA: v1 said "13
  hits", a single-file count; repo-wide it is 1,354 — substantive 0-hit negation unaffected.]
  No space predicate exists anywhere in `eth/proof/` (`rg -n 'SpaceWithin|space.*bound' → 0`).
- anthropics 3sum-apsp: same patterns → 0 hits in statements; space appears only as the
  data-structure "extent of memory" convention (`docs/REMARKS.md` NOTE at
  `IsDataStructure`), a different notion, and nothing about SAT machines.
- openai-math: the space notion EXISTS (`visitedSpace`, `SubexponentialSAT.lean:188`;
  `sat_polynomial_space`, `Final.lean:149–182`) but the machine is chosen **per k**
  (`∃ program … Native.countingProgram cutoff k`, `Final.lean:10–13`; theorem
  quantifier order `∀ k ≥ 2, ∃ machine/constants`) and the time scale is
  n·(loglog n)²/√log n (`rho`, `SqrtLogSpace/Asymptotics.lean:10–11`) — no min-route,
  no k-uniform constant.
- mathlib: no complexity classes/space at all (R9 §1 claim 9, CONFIRMED;
  `research/feasibility/mathlib-verification.md`).
- tauceti: no time-complexity content (R4 §0 of `research/bridges/complexity.md`).

**Source papers (the critical questions):**

- (a) Does either paper claim uniform+poly-space combined? **No.**
  eth `paper.pdf` Theorem 1 (p. 2, display (1)): time
  2^{O(min{√(k²n loglog n/√log n), km/√log m})} "where the O(·) hides an **absolute
  constant**" — uniformity is claimed, space is **never mentioned** (paper-text "space"
  occurrences are non-computational; verified by pdftotext + rg, 2026-11-09. [erratum
  2026-11-09, H/QA: v1's "13 hits" figure was a single-file count; see the corrected
  corpus-side note above.]). openai preprint
  "The Exponential Time Hypothesis is False" (17 Oct 2026, rev. 25 Oct 2026),
  Abstract: "For every **fixed** k ≥ 2 … uses poly_k(n,m) space and runs in time
  (n+m)^{O_k(1)} 2^{n/(log n)^{1/2+o(1)}}" — poly space per-k, no uniform machine;
  Appendix C (circuit bounds, inversion) claims no uniform+space combination either
  ("A single algorithm attains both bounds", p. ~4599 of extracted text, refers to two
  time bounds of Appendix D, not to k-uniformity).
- (b) Does openai's paper already claim uniformity? **No** — every quantitative claim
  is indexed "for every fixed k" with constants poly_k/O_k(1)/O_{k,D}(1) (Abstract;
  `lean/docs/378.md`: "For fixed k≥2, Lean proves…"; `docs/378.md` §Scope).

Literature side: **PENDING lane R8 round-2.** Queries R8 should run:
`"ETH refutation" "polynomial space" uniform`; `"one algorithm" "all k" k-SAT
subexponential space`; `#k-SAT "polynomial space" 2^{o(n)}`; arXiv listings/follow-ups
of both papers (eth: "A 2^{o(n)} Time Algorithm for 3-SAT", Hexagon to appear, no
arXiv id found in-repo — check for a posted version; openai: arXiv version of "The
Exponential Time Hypothesis is False" and citing papers); STOC/FOCS/CCC 2026–27
programs for either title; Williams's E^NP-circuit line (Wil13 Thm 6.1) for any
uniform+space phrasing. `[R8 confirmation pending]`

Known nearest misses: (1) openai `sat_polynomial_space` — per-k machine, no min-route,
weaker exponent; (2) eth `MainTheorem` — uniform, no space; (3) classical
space-optimized #SAT (e.g., Dalmau's ETH-orthogonal poly-space counting lines cited in
openai §1.1) — different time regimes, no 2^{o(n)} claim, no formalization.

## Bridge analysis

- Corpora bridged: anthropics/eth (machine, uniform bound) + openai-math
  SubexponentialSAT (space-monitor statement pattern and per-prefix certificate
  method); mathlib hosts the machine type.
- Why the bridge is essential: the two halves exist on opposite sides.
  eth has: one machine + one C ∀k (`MainResults.lean:177–180`, proved
  `Solution.lean:40–44` via `Wrap.countingBoundImpliesFailureOfETH`,
  `CountedRoute.mainTheoremHolds`) — but its final assembly **materializes a pad of
  length 2^{e x}**: `padM` doubles a unit list, states have size
  `2|x| + 2·2^{e x} + 3` (`PaddedDescent/Pad.lean:93–94`), so space tracks time
  (2^{o(n)} space, NOT polynomial). openai has: the per-prefix visited-space invariant
  (`SubexponentialSAT.lean:166–189`) and a proof method (binary-budget counters,
  Appendix B "Exact arithmetic and space") — but per-k machines and no min-route.
  Neither proves the conjunction; each corpus lacks the other's half by construction.
- Empty-zone fit: `research/bridges/complexity.md` §4 zone Z3 (v1, 2026-11-09).

## Proof-strategy sketch

1. **[Routine]** Prove the trivial semantic lemma: for `pad k = List.replicate (2^k) ()`
   (`Pad.lean:30`) every function of `(x, pad)` factors through `(x, pad.length)`
   (units carry no data). Target: `Solver.run (pad, i, I) = Solver.run (pad', i, I)`
   whenever `pad.length = pad'.length`, for `ClauseBound.Alg.Solver.run`
   (`proof/rates/ClauseBound/Alg/Interfaces.lean:128`) — check against `enumF`/`solveG`
   whose pad hypotheses are only `2 ^ … ≤ pad.length` (`Interfaces.lean:32,137–138`).
   [VERIFIED hypothesis; the congruence lemma itself is new]
2. **[Hardest step — honest flag]** Replace the materialized pad by a binary length
   budget without losing the time bound. Two routes:
   (a) *Normal form*: any `PolyT` fragment (`ToTuring/PolyT.lean:54`) computing a
   pad-factoring function has a witness whose stack configuration never holds a run of
   equal symbols longer than O(log run-length) (run-length-compressed configurations;
   the pad is one run). Prove a compression simulation lemma over `Fr`/`Runs`.
   (b) *Clocked simulation*: simulate the witness fragment step-by-step with a binary
   counter of budget q·(|x|+2^{e x})^q (O(e x) bits), using eth's configuration-coding
   machinery (`Wrap/CodingExists`, cited `Wrap/Main.lean` header) for the compressed
   configuration; the clock is justified because the fragment's running time is bounded
   by `PolyT.elim` (`PolyT.lean:73–77`).
   New content: route (a) is a genuinely new normal-form lemma; route (b) trades it for
   a universal-machine-plus-clock construction of size ~exists_tm'.
3. **[Routine]** Rebuild `exists_tm_padded` (`Pad.lean:116–125`) as
   `exists_tm_padded_space`: same conclusion plus `SpaceWithin N x (q·(|x|+2^{e x})^q)
   (q'·(|x| + e x + 1)^{q'})` — the pad's contribution to space drops from 2^{e x}
   symbols to e x bits. Re-run `padM_runs` (`Pad.lean:93`) with the compressed state
   measure.
4. **[Routine]** Thread the space invariant through the final assembly: `Wrap.Sim`
   step-by-step host + `Wrap.FrontEnd` polynomial front end
   (`proof/machines/Wrap/Main.lean:27–46`); each is `PolyT`, and polynomial-time
   fragments have polynomial-size words (`Carried` discipline, `PolyT.lean:104–112`),
   so the wrapper preserves `SpaceWithin` up to a polynomial change of constants.
   Re-state `MainResults.MainTheorem` with the added `SpaceWithin` conjunct; the proof
   is `CountedRoute.mainTheoremHolds` with step 3's theorem substituted for
   `exists_tm_padded` (the `St…`-interface discipline, `Interfaces.lean:12–17`, exists
   precisely to allow this swap).
5. **[Optional cross-corpus certificate]** State the per-prefix monitor form à la
   openai (`Final.lean:122–128`) as a corollary, discharging "intermediate
   configuration" through mathlib's `EvalsToInTime` step relation
   (`Mathlib/Computability/StateTransition.lean:266–288`).

## Feasibility (R9 template, `research/feasibility/mathlib-verification.md` §3)

- **F0.** One TM2 machine, constants C (time) and S,e (space), ∀k ≥ 1: counts k-CNFs in
  2^{C·min{km/√log m, k²n·loglog n/√log n}} steps within polynomial visited space.
- **F1. Mathlib entry points** (checkout `ff2494ea`, v4.36.0-rc2): `Turing.FinTM2`
  (`Computable.lean:46`), `TM2ComputableAux` (:142), `TM2OutputsInTime` (:130),
  `EvalsToInTime` (+ refl/trans, `StateTransition.lean:266–288`). R9 §1 #10 CONFIRMED:
  every eth-used name exists verbatim → v4.33→v4.36 name-level risk low; elaboration
  risk pending R9's port-probe (`research/feasibility/probe/ProbeB2_EthTime.lean` is
  staged for exactly the eth time-machinery shape; probe results not yet recorded —
  cite as pending).
- **F2. Donor lemmas**: eth `PolyT` + closure (`ToTuring/PolyT.lean:54,62–94`),
  `IsPolyT` (:104), `exists_tm_padded` (`PaddedDescent/Pad.lean:116`),
  `Wrap.everyMachineCanBeWrapped`, `decidesTM_of_wraps_counter`
  (`Wrap/Main.lean:39,57` [erratum 2026-11-09, H/QA: v1 cited :34/:54; the theorems are at
  :39 and :57]), `Solver` layer (`Interfaces.lean:126–181`);
  openai `LocatedCfg`/`monitor`/`visitedSpace` (`SubexponentialSAT.lean:149–189`) —
  statement pattern only (their TM0 machinery need not be ported). Porting friction:
  eth is a self-contained Lake project pinned at v4.33.1 — the donors are internal to
  `eth/proof/`, so the pilot should build ON a vendored copy of eth, not port across.
- **F3. Missing glue**: (a) pad-congruence lemma (step 1) — S; (b) compression normal
  form OR clocked simulation (step 2) — the driver, M-sized, genuinely new; (c) space
  invariant through `Wrap/Sim` (step 4) — S, polynomial-size word bounds already
  implicit in `Carried`.
- **F4. Effort: M** (~1.5–3k LoC): step 2 dominates; no analytic content; everything
  else is restatement around existing 152k-line eth infrastructure.
- **F5. Risks**: the normal-form lemma (route a) could fail for fragments that use pad
  *positions* as counters — then route (b) must be taken (larger constant, same shape);
  `Wrap/Sim` configuration codings must be shown run-compressible; uniformity in k must
  survive the swap (it does: C is fixed before k in `MainTheorem`, and step 2 changes
  only the pad mechanism, not the solver).
- **F6.** Kernel-only, math-proof1 standard; build on vendored eth via Modal
  `lean_build.py`/`lean_check.py` once scaffolding exists; no sorry, no native_decide.
- Cross-references: R3's assembly map D (polytime-composition layer,
  `research/feasibility/mathlib-assembly-maps.md`) — **file not present yet, pending**;
  relevant here because step 4 is exactly a polytime-composition-for-space extension.

## Significance

The first formal complexity theorem combining k-uniformity and polynomial space for the
ETH refutation — stronger than each 2026 result separately, and the natural "best of
both" statement the two AI-discovered refutations point at without reaching. It would
also give the first poly-space 2^{o(n)} #k-SAT machine uniform in k in any medium
(formal or paper), and its key lemma (pad-compression normal form) is reusable
infrastructure for every padding-based time-bounded construction.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

## F4 grade by lane R9

2026-11-09, round 4. Evidence: Modal port-probe runs 1–5 + OAI closure stats
(`research/feasibility/port-probe.md` §§1–7).

- **Grade: M — confirmed.** The dossier's F1 "pending" items are now measured: the eth
  time-machinery shape elaborates verbatim against v4.36 (`ProbeB2_EthTime.lean`: 0 errors;
  `TM2OutputsInTime` signature identical to eth's usage), and every F1 mathlib name is
  probe-verified (`Turing.FinTM2/TM2ComputableAux/TM2OutputsInTime/TM2ComputableInPolyTime`,
  `EvalsToInTime` refl/trans, `ProbeA`/round-1 rg). Statement side: zero drift.
- **Porting-cost deltas**: eth donors stay in-tree on vendored eth (per F2) — consistent with
  the measured S-interface/M-full ToTuring grade; nothing in the new evidence changes that.
  The openai space-monitor enters as pattern only; if anything beyond the pattern is ever
  imported, the OAI closure stats are the cost: `SqrtLogSpace/Final.lean` sits on 2569 OAI
  files / 484,267 LoC (depth 30) — vendoring the monitor defs alone (`visitedSpace`/
  `LocatedCfg`, `ComparatorChallenges/SubexponentialSAT.lean:149–189`) is the only sane scope,
  as the dossier already assumes.
- Effort driver unchanged (step 2, pad-compression normal form); no F1 corrections needed.
  Verdict for triage: keep M (~1.5–3k LoC), confidence up.

---

## Novelty addendum (R8 round-2 §4 evidence; appended 2026-11-09, lane R4)

R8's pre-check (`research/novelty/round-2.md` §4, "PRE-CHECK — Z3 … CRITICAL", sources:
both paper.pdfs via pdftotext, openai Lean local read, suquark/NotETHSimplified papers,
unaltuzun `docs/REPORT.md` + `VERIFICATION.md`) audited the 2×2
(uniformity × space) + rate. **Verdict: NOBODY claims the conjunction** — one machine,
one constant, ∀k, min-rate, polynomial space. The claim is hereby stated strictly as
that conjunction, with the three neighboring cells excluded verbatim-precisely:

- **suquark** (papers "One Pigeonhole" Thm 1.1, "Uncrossing Wires"; paper+Lean,
  multitape TM): 3-SAT only (k = 3, no k-uniformity), **polynomial space claimed**
  ("and space |φ|^{O_ε(1)}"; "formalized … down to a multitape machine, with its time
  and space"), ε-form rate C_ε|φ|^{O_ε(1)}2^{εn} with **no explicit rate and no
  min-of-two-routes** (R8 round-2 §4 table, rows suquark 1–2).
- **openai** (preprint Thm 1.1; Lean): **per-fixed-k** machines with poly_k/O_k(1)
  constants ("for every fixed k ≥ 2", (n+m)^{O_k(1)} bits of space); and the **formal
  rate is weaker than the paper's**: the Lean gives 2^{O_k(n(loglog n)²/√log n)} (the
  ρ(n) interpolation bound) while the sharper Theorem-1.1 bounds
  (2^{O_k(n loglog n/√log n)}; sparse O_{k,D}(n/√log n)) have *no Lean counterpart*
  (unaltuzun REPORT §1, per R8 round-2 §4, openai-Lean row; unaltuzun reports
  KERNEL-VERIFIED 2026-10-28 — build exit 0, 3 standard axioms, Comparator accepts).
- **anthropics eth** (paper Thm 1): **k-uniform** (one algorithm, absolute constant,
  every k) with the min-rate 2^{O(min{km/√log m, k²n·loglog n/√log n})}, but **no space
  claim at all** (13 "space" hits, all probability/vector/graded — verified).

**Formal-strength-gap exploitation note.** Our conjunction statement does not merely
add openai's space to eth's uniformity: it also covers the **sharper min-rate that
openai's Lean does not formalize** — i.e., even the per-k, non-uniform fragment of our
theorem (min-route + poly space at k fixed) is absent from the strongest formal cell
(openai Lean), and the full conjunction is absent from every cell and from the
literature (eth paper not on arXiv; O'Donnell [O'D26]/Kintali [Kin26] expositions are
blog-level; IPW examination group pending per openai `history.md`). Novelty 5
assessment stands, now with the two taken cells fenced off by the differentiators
above.

---

## Pilot outcome

2026-11-10, pilot-10 lane. Milestone **M1 = prework lemma L3** (space-annotated assembly), run
first per the G1 audit's CASE A sequencing (`research/pilots/10-prework.md` §9). File
`research/pilots/10/M1.lean`; blueprint and run log `research/pilots/10-blueprint.md`; raw logs
`research/pilots/10/logs/m1-run{1,2-green,3-confirm-axcheck,4-final}.log`.

- **Verdict: GREEN, unconditional.** Mathlib `ff2494ea`, `leanprover/lean4:v4.36.0-rc2`, kernel only:
  0 errors, 0 `sorry`, 0 warnings (run 4, on the committed file). No hypothesis binders: eth's host
  stack (Run/Frag/Tree/Stacks/Rename/Move/Ops/Lift/StepMachineStatements/Enc/Bound/PolyT/Host,
  ~1.3k LoC) was transcribed with its proofs, and every transcribed proof elaborated verbatim on
  v4.36. That is a measured data point for the feasibility claim "statement-port ≈ 0": for eth's
  machine layer, *proof*-port cost was also ≈ 0.
- **Proved (`Groundwork.exists_tm_space`).** For every `M : Stepped (List Bool) Bool` with
  `[IsPolyT M]` and every d there are a machine `N` with finite alphabets and a constant c such that
  if `M.Runs x T S b` and `S ≤ (|x|+2)^d`, then N outputs b within c·(T+1)·(|x|+1)^c steps (eth's
  `exists_tm`, same machine `tmOf (prog Pi Ps Po)`) **and, for every t, `SpaceWithin N x t
  (c·(|x|+1)^c)`**. The space bound is polynomial in |x| alone, independent of T. `SpaceWithin`
  is this dossier's definition verbatim (every configuration reached in s ≤ t steps has total
  stack content ≤ S), stated through mathlib's `EvalsTo` iteration.
- **Corollaries proved in the same file:** `exists_tm` (eth's statement verbatim, the time half);
  `exists_tm_space_at_time` (this dossier's exact conjunct shape); `spaceWithinTM_iff_trace`
  (equivalence with openai's `Computation.Trace` per-prefix form); `exists_tm_space_monitor`
  (openai's located-monitor form for stacks: high-water marks per stack, visited ≤ |K|·S, shape
  of `SqrtLogSpace/Final.lean:122–128`). These discharge strategy step 5.
- **Axioms.** All four headline theorems: `[propext, Classical.choice, Quot.sound]`. Full sweep
  over all 135 non-private theorems (`research/pilots/10/axcheck_full.py`): every axiom set is a
  subset of those three, 0 `sorryAx`. The file is added to `feasibility/probe/make_axcheck.py`
  TARGETS (`AxPilot10_M1`); that copy elaborates OK too.
- **What the proof actually uses** (new mathematics at the machine level). (i) One TM2 step running
  statement q grows the total stack content by at most `pushes q` (`stkLen_stepAux`), so every
  fragment has a growth constant and every n-step run stays below start + growth·n
  (`Frag.Runs.toB`). No fragment internals are needed: `PolyT`'s time bound alone controls a
  fragment's transient space. This is the dossier's step-4 claim that "polynomial-time fragments
  have polynomial-size words", now a theorem. (ii) The host's loop resets to one coded state and one
  optional bit at the head of every round, so one ceiling L + 5 + growth(body)·(tS L + 3L + 3 +
  tO L), with L = 7(|x|+2)^d, holds for all rounds (`mainLoop_withinB`).
- **Strategy-sketch status.** Step 3's `exists_tm_padded_space` is NOT yet available, and should not
  be expected from M1 alone: eth's `padM` has states of size 2|x| + 2·2^{e x} + 3, so feeding it
  into `exists_tm_space` gives exponential space. M1 is the reusable assembly half. The pad half
  is L1 (counter combinators) + L2 (PolyTVal certificates), which yield a counter-`padM` with
  poly-size states. Then `exists_tm_space` replaces `exists_tm` and the time bound is unchanged.
  Remaining effort is unchanged from the prework: M, with L2 dominant.
- **Novelty status of the headline theorem:** unchanged (the conjunction is still open; M1 is
  infrastructure). The space-annotated host is itself absent from every corpus: eth has no space
  predicate (0 hits, novelty check above), and openai's monitor is for TM0 tapes and per-k machines.
