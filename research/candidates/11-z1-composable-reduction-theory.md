# Candidate 11 — z1-composable-reduction-theory

Lane proposal (R4): novelty 4, significance 5, effort 3 (M) → rank ≈ 6.7.

## Name

z1-composable-reduction-theory

## One-line pitch

A typed calculus of many-one-with-calls reductions over an abstract cost semantics in
which **reductions compose with calls multiplying and extras adding**, realized on both
the 3sum-apsp word-RAM (light language) and mathlib TM2 machines — restoring the
running-time sentences that 3sum-apsp's Theorems 17/21 had to drop because
`Problem.SolvedInTime` programs cannot call subroutines.

## Precise mathematical statement

### Syntax and semantics

Fix a record `CostModel` (generalizing 3sum-apsp's `DetTimeModel`,
`ThreeSumApsp/TimeClaims/Sec3/Definitions.lean:75–101`, and `TimeModel`,
`ThreeSumApsp/ConditionalTimes/Definitions.lean:105–141`): fields `Sol : Problem →
(Param → ℝ) → Prop` ("problem solved in time T", arbitrary interpretation), plus three
closure axioms, each already present in the corpus in unary form:

- monotonicity: `∀ T T', (∀p, T p ≤ T' p) → Sol A T → Sol A T'`
  (corpus instance `Closure.MonoExactTriangle`, `Definitions.lean:120–122`);
- size-threshold choice: `∀n₀, ∃C₀, Sol A T₁ → Sol A T₂ → Sol A (if n < n₀ then T₁
  else T₂) + C₀` (instance `Closure.ChooseBySize`, `:127–130`);
- **call-charging**: a call of a solver of B with time T costs exactly T, everything
  else to the extra time (3sum-apsp convention, `Definitions.lean:54–58` "a transfer
  claim charges a call of an algorithm exactly its running time").

A **reduction** from `A` to `B` at shape functions `calls extra : Param → ℝ≥0` is data

    Red A B calls extra : Prop :=
      ∃ C ≥ 0, ∀ T, Sol B T → ∃ T', Sol A T' ∧ ∀ p, T' p ≤ extra p + calls p * T (β p) + C,

where `β` maps A-parameters to B-parameters (the corpus instances fix `β` concretely;
e.g. `Claim.Theorem_17 M MM D g`, `Definitions.lean:192–199`: `∃C ≥ 0, ∀T,
M.lopDetect T → ∃T', M.exactTriangle T' ∧ T' n u ≤ 4·n·g·(T n (D n) (queryCap n (D n))
+ C·n²/√D) + C·(termScans + termPrime MM + termBuild)` — here `calls p = 4·n·g`,
`extra p = C·(n²/√D + termScans + …)`).

### The two theorems

**Theorem A (abstract composition — "calls multiply, extras add").**
If `Red A B c₁ e₁` and `Red B C c₂ e₂` (with compatible parameter maps `β₁, β₂`), then
`Red A C (c₁ · (c₂ ∘ β₁)) (e₁ + c₁ · (e₂ ∘ β₁))`; explicitly, for every `T` with
`Sol C T` there is `T''` with `Sol A T''` and

    T'' p ≤ e₁ p + c₁ p · e₂ (β₁ p) + c₁ p · c₂ (β₁ p) · T (β₂ (β₁ p)) + C''

with `C'' = C₁ + c₁max·C₂` on bounded shapes (exact constant from the two witnesses;
pure ∀/∃-algebra plus `linarith` on the two pointwise inequalities).

**Theorem B (realization on two machine models).**
(i) *Word-RAM realization*: for `M₀ := Light.lightModel`
(`ThreeSumApsp/Programs/LightModel.lean`), every `Red` derivable in the calculus from
corpus claims is realized by light-language programs: the composed program is the
caller's program with each oracle call replaced by the callee's body, and
soundness of the time bound follows from the call rule `Ends.callTo`/`Ends.callLast`
(`ThreeSumApsp/Lang/Calls.lean:93–124`: a call charges
`(args.map Expr.cost).sum + 2 + T'`), by induction on the step fuel of the `Ends`
relation.
(ii) *TM2 realization*: define `Tm2Model : CostModel` with `Sol A T := ∃ M :
Turing.TM2ComputableAux …, ∀ input, Nonempty (TM2OutputsInTime M.tm … (T …))`
(mathlib `Computable.lean:130,142`); the closure axioms follow from eth's fragment
calculus — `PolyT` closure under composition, pairing, case distinction and folds
(`eth/proof/machines/ToTuring/PolyT.lean:13–23` docstring; `PolyT.of` :62,
`PolyT.elim` :73), assembly `exists_tm`, and the wrapping route
`Wrap.everyMachineCanBeWrapped` (`eth/proof/machines/Wrap/Main.lean:34`). Every
calculus derivation is realized by a single TM2 with the composed bound.

### Instantiation corollaries (≥2 required)

1. **Theorem 19's route as one composition** (running-time restoration for the
   Theorem-17 half): `Claim.Theorem_17 lightModel strassen paramD₂₆ paramG₂₆`
   (`claim_theorem_17₂₆`, `Programs/Sec3/Theorem17/ClaimAtParameters.lean:204–218`,
   via `host_of_paramProcs` :188) composed with `Claim.Corollary_16`
   (`Light` model instance `claim_corollary_16`) yields `Claim.Theorem_19_explicit
   M 0.00175 1` *without re-proving the program* — i.e. the deduction
   `Theorem19.explicit_of_theorem_17_corollary_16`
   (`TimeClaims/Sec3/Theorem19.lean:107–125`) becomes an instance of Theorem A.
2. **CH20 as an instance**: `Claim.CH20_Theorem_5_1` (3SUM → Convolution-3SUM,
   program `ChanHe.reduction` with proof `ChanHe.reduction_correct`,
   `docs/REMARKS.md` "Section 3: cited results" table) composed with
   `Claim.VW13_Theorem_4_3` (Convolution-3SUM → Exact Triangle) gives the composed
   3SUM → Exact Triangle reduction with calls = (instances of CH20) × (instances of
   VW13) — the `theorem_21a_compose` statement (`PaperStatements.lean`, NOTE at
   `Theorem_21a_compose`) currently carried by hand.
3. (Stretch) **The missing Theorem-21(b) chain**: `Claim.VW13_Theorem_3_3` ∘
   `Claim.VW18_Theorem_4_2` ∘ `Claim.ApspFromMinPlus` in one application of Theorem A.

## Novelty check

Corpus side (`research/qa/decl-index.tsv` absent — rg directly, 2026-11-09):

- Composition vocabulary: `rg -i -c 'calls multiply|composition.*running time|compos.*
  time bound'` over `anthropics_formal-math/`, `openai-math/lean/OAI/`,
  `tauceti/TauCeti/` → **0 hits**. No corpus states or proves a reduction-composition
  theorem.
- "transfer claim"/"cost model" exist **only** in 3sum-apsp
  (`TimeClaims/Sec3/Definitions.lean` ×4, `ConditionalTimes/Definitions.lean` ×7, etc.)
  and are applied one-deduction-at-a-time by hand (`Theorem19.lean:85–125` re-proves
  the glue for each pair); no `Red`-type, no composition lemma.
- eth: `rg -n 'reduction' eth/proof/` → only paper-prose occurrences; the `Solver`
  interface (`Interfaces.lean:126–181`) is bespoke to clique counting, has no
  composition. openai: `rg -rn 'Claim\.|DetTimeModel' OAI/` → 0; SubexponentialSAT
  has no reduction layer. mathlib: "Any reduction theory between problems: absent"
  (R9 §1 #5/#9 CONFIRMED, `research/feasibility/mathlib-verification.md`); tauceti:
  recursion theory only.
- The exact obstruction this repairs is on record in 3sum-apsp: "such a program cannot
  simply be called as a subroutine: the definition of solving does not say which cells
  a program reads or writes" (`docs/REMARKS.md`, "Theorems 17 and 21 in their printed
  form") — Theorems 17/21 are stated *without* their running-time sentences.

Literature side: composition of reductions is textbook folklore for plain many-one
reductions (e.g., Arora–Barak ch. 2) and oracle machines charge one step per query —
but the *call-charging arithmetic for f-reductions that spawn many sub-instances*
(`T' ≤ extra + calls·T`, extras nested through outer calls) is, to our searches, not
stated as a standalone theorem anywhere, and no formalization exists of either.
**PENDING lane R8 round-2** — queries: `"reductions compose" oracle "running time"
formalized`; `f-reduction "number of oracle calls" composition inequality`;
`verified complexity reductions Lean/Coq/Isabelle` (nearest formal relatives: Coq
CompCert-style cost models, Isabelle's refinement frameworks — neither targets
complexity-theoretic reductions); `"cost semantics" reductions composition theorem`;
check [VW10] §2 and [CH20] §2 prose for an implicit composition remark.
`[R8 confirmation pending]`

Nearest misses: 3sum-apsp's hand-glued pairwise lemmas (`Theorem19.explicit_*`,
`theorem_21a_compose` with its `N^{3/2+o(1)}` hand-carried term); eth's `PolyT`
closure (function-composition, not problem-reduction); openai's `Trace` transitivity
(`SubexponentialSAT.lean:87–90`) — step composition, not reduction composition.

## Bridge analysis

- Corpora bridged: anthropics/3sum-apsp (claims, reductions-as-programs, light
  language) + anthropics/eth (TM2 fragment calculus + padding/wrapping) + mathlib
  (machine types, `TM2ComputableIn(Poly)Time` anchor).
- Why the bridge is essential: 3sum-apsp owns the *reductions* (programs with proofs:
  `ChanHe.reduction_correct`, VW13/VW18 programs, `et17` host) and the abstract claim
  layer, but its end semantics is extensional — composition is *stated impossible* for
  `SolvedInTime` programs (REMARKS, above), and its only model is the word RAM. eth
  owns *intensional machine composition* (fragments glue; `exists_tm`; wrapping) but
  has no problem/reduction abstraction to compose. Theorem B(ii) (TM2 realization) is
  unstatable inside 3sum-apsp alone; Theorem B(i) (word-RAM realization with composed
  programs) is unstatable inside eth alone. Only the combination yields a calculus
  with both models.
- Empty-zone fit: `research/bridges/complexity.md` §4 zone Z1 (v1, 2026-11-09).

## Proof-strategy sketch

1. Define `CostModel`, `Red` (propositional layer only). [Routine — transcription of
   `Definitions.lean:75–130` shapes]
2. Prove Theorem A: introduce the two witnesses, instantiate the outer with
   `Sol B T''`-witness from the inner, combine pointwise bounds; monotonicity closure
   absorbs the constant bookkeeping. [Routine — first-order algebra + `linarith`; this
   is deliberately the smallest complete sorry-free milestone]
3. Word-RAM realization (Theorem B(i)): given `Red`-witnesses realized by hosts
   (solver-transformer programs, the `host_of_paramProcs` pattern,
   `ClaimAtParameters.lean:188`), build the composed light program by procedure
   substitution; prove `Meets`-specification composition by induction on the `Ends`
   step fuel, with the call rule `Ends.callTo` (`Lang/Calls.lean:107–117`) as the
   inductive step and `Meets.mono` (`Calls.lean:56` [erratum 2026-11-09, H/QA: v1 cited :52;
`theorem Meets.mono` is at :56]) for weakening. [New but bounded —
   this is the first genuinely new lemma: a substitution/`Ends`-congruence lemma]
4. TM2 realization (Theorem B(ii)): realize the three closure axioms: monotonicity via
   a time-widening wrapper (`Wrap`-style, `Wrap/Main.lean:34–60`); choice via a
   size-branching fragment (`PolyT` case distinction); call-charging via fragment
   gluing with per-call clocks — eth's `exists_tm` already charges steps; the content
   is relating `Sol`-time to `TM2OutputsInTime`. [Moderate — the polytime-composition
   layer R3's assembly map D is meant to chart; cite `research/feasibility/
   mathlib-assembly-maps.md` — **file pending**]
5. Instantiations 1–2 above: discharge each corpus claim's hypothesis at the light
   model using existing `claim_*` theorems; apply Theorem A; read off the printed
   bounds. [Routine given 3–4]

## Feasibility (R9 template, `research/feasibility/mathlib-verification.md` §3)

- **F0.** Abstract call-charged reductions compose (calls multiply, extras add), with
  realization theorems on the word-RAM light model and on mathlib TM2 machines.
- **F1. Mathlib entry points**: `Turing.TM2OutputsInTime` (`Computable.lean:130`),
  `TM2ComputableAux` (:142), `TM2ComputableInTime` (:161),
  `TM2ComputableInPolyTime` (:174) — R9 §1 #5/#10 CONFIRMED present at `ff2494ea`;
  note R9's caution: engage `TM2ComputableInPolyTime` as the anchor, don't claim empty
  ground. Elaboration-level v4.33→v4.36 risk: R9 port-probe staged
  (`research/feasibility/probe/ProbeB2_EthTime.lean`), results pending.
- **F2. Donor lemmas**: 3sum-apsp `DetTimeModel` + `Claim.*` + `Closure.*`
  (`TimeClaims/Sec3/Definitions.lean:75–199`), light language `Meets`/`Ends.callTo`
  (`Lang/Calls.lean:31,107`), `Light.lightModel` (`Programs/LightModel.lean`),
  hosts `claim_theorem_17₅/₂₆` (`ClaimAtParameters.lean:204–218`); eth `PolyT` layer
  (`ToTuring/PolyT.lean:54–94`), `exists_tm*` (`PaddedDescent/Pad.lean:116`),
  `Wrap.*` (`Wrap/Main.lean`). Porting friction: 3sum-apsp uses the Lean 4
  `module`/`public import` system and imports nothing at statement level — the
  propositional layer ports cleanly; the program layer is best consumed in-tree.
- **F3. Missing glue**: (a) `CostModel`/`Red` transcription — S; (b) `Ends`
  substitution-congruence (step 3) — M, the one new program-level lemma;
  (c) TM2 realization of call-charging (step 4) — M, overlaps R3's assembly map D
  (pending); (d) nothing analytic.
- **F4. Effort: M** (~1.5–3k LoC): milestone 1 (steps 1–2 + instantiation-1 at the
  abstract level) is S (<500 LoC); steps 3–4 bring it to M.
- **F5. Risks**: light-language program substitution may hit `Renumber`/`Frames`
  bookkeeping (`Lang/Renumber.lean`, `Lang/Frames.lean` exist for this — check
  reuse); TM2 call-charging needs an explicit per-call clock that `PolyT` frames
  (shared stacks, `PolyT.lean:47–58`) were not designed to expose — worst case scope
  Theorem B(ii) to monotone+choice closures and route charging through `exists_tm`
  step counts; no analytic risk anywhere.
- **F6.** Kernel-only; pilot on vendored 3sum-apsp + minimal eth import of `ToTuring/`
  (46 files, self-contained per `PolyT.lean` imports); math-proof1 Modal loop.
- Cross-references: R3 assembly map D — **pending** (`research/feasibility/
  mathlib-assembly-maps.md` not yet present); R9 port-probe — staged, pending.

## Significance

Turns three corpora's ad-hoc, hand-glued running-time deductions into a reusable
calculus with two verified realizations — the first formal reduction-composition
theory with exact call-charging. It directly repairs a named defect (Theorems 17/21
running-time loss, on record in `docs/REMARKS.md`), and it is infrastructure: Z3's
space-invariant threading and Z4's parametric instantiations both become single
calculus applications once it exists, which is why it ranks as the recommended pilot.

## Score (filled at triage — leave empty)

- Novelty (1–5):
- Significance (1–5):
- Effort (S/M/L → 1–5):
- Rank (novelty × significance ÷ effort):

## F4 grade by lane R9

2026-11-09, round 4. Evidence: Modal port-probe runs 1–5 (`research/feasibility/port-probe.md`).

- **Grade: M — confirmed; milestone 1 (abstract layer, <500 LoC) is S with measured-zero
  statement friction on both statement layers.** The dossier's two "pending" citations are
  resolved: `ProbeB2_EthTime.lean` (eth TM2 time shape) = 0 errors against v4.36
  (`TM2ComputableAux` fields and `TM2OutputsInTime` argument list identical); 
  `ProbeB3_3sumEnd.lean` (3sum EndStatement verbatim, incl. `module`/`public import`
  headers) = 0 errors, 0 warnings — the `DetTimeModel`/`Claim.*` propositional layer lives
  in the same statement family and ports cleanly per F2's own assessment.
- **F1 confirmations**: all four cited Turing anchors probe-verified OK (run 1); the
  caution "engage TM2ComputableInPolyTime, don't claim empty ground" stands (it elaborates,
  `ProbeA`).
- **Porting-cost delta**: steps 3–4 remain the M-mass; eth `ToTuring/` consumption stays
  in-tree (interface S / full M per port-probe §4). No F1 corrections.

---

## Pilot outcome (M1, executed 2026-11-09 — lane R4)

**M1 COMPLETE.** Artifacts: `research/pilots/11/{P11T1,P11T2,RedCompA,RedCompB}.lean`
(781 LoC total) + Modal runner `pilot11_probe.py`/`run_pilot11.sh` (reuses R9's
`crossmath-probe` image). **Acceptance GREEN**: `CrossMath.RedB.theorem19_of_red` has
exactly the donor type
(`ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16`, itself compiled VERBATIM
in `P11T2.lean` as the port-faithfulness check — first-try OK), with the
Theorem-17/Corollary-16 combination routed through `Red.comp`. **Axioms**: all five
declarations = `[propext, Classical.choice, Quot.sound]` — no `sorryAx`; kept artifacts
sorry-free. **Design B rationale (one line)**: A's constant is always instantiated at 0
(the corpus `C` multiplies parameter-dependent factors), a Prop-structure cannot carry
it as data, its composition admits no closed form, and its ∃-packaging blocks opaque
composition — B (constant folded into `extra` at the leaves) composes in closed form
and is consumed as a black box. Full iteration log + evidence:
`research/pilots/11-blueprint.md` §7.

**Effort empirically confirmed**: M1 machine-time ≈ 35 min over 13 warm Modal runs
(~2.5 min each; 8 h budget, 15× margin); E3 (M) holds — the M1 kernel
(`Red` + `Red.comp` + acceptance instance) is now a proof-of-record, so the remaining
M-scope is exactly the TM2 realization + CH20∘VW13 instantiation as blueprinted
(§4 there). **Lane proposal unchanged: N4, S5, E3** — now with the M1 kernel proven
rather than estimated. **Next: M2 (TM2 realization via PolyT gluing; 10-file eth slice,
~1.5–2.5k LoC), probe-first via `ProbeB2_EthTime.lean` extension.**
