# Pilot 75-N2 P1 — verification record (COMPLETE: M1+M2+M3 GREEN-triad; P2-a GREEN at run 26)

Lane A5, sessions 2026-11-17 (runs 1–8) + 2026-11-18 wave-3 (runs 9–15, M1+M2)
+ 2026-11-18 re-task (runs 16–19, M3) + 2026-11-18 close-act (runs 20–21, P2-a
open) + **2026-11-19 wave-4 R6 (runs 22–23, P2-a fix-loop to budget
exhaustion — see §P2 state)**. Charter chain: orchestrator P1 GO ruling
of 2026-11-17 (≤6-run fix-loop); restart charter 2026-11-18 (closure + one
fix+rerun + M2 + M3-if-budget); re-task 2026-11-18 (M3 execution, fresh ≤6-run
budget, verify-fire discipline, hard-stop rule); wave-4 task 2026-11-19 (R6:
P2-a continuation, 2-run remnant of the P2 ≤6 budget). Dossier:
`research/candidates/75-N2-rayclass-dirichlet-consumer.md` §Pilot spec skeleton
(P1) + §Proof-strategy steps 1–3. A1 folds the §10-format block below into
`qa/iter4-review/r3-verification-tables.md` (one-writer discipline). Evidence
of record: `pilots/75/logs/n2-p1-run{1..30}.log` + `n2-p3-run{1,2}.log`
(per-run provenance headers with verify-fire shas + error-class analyses;
**run 19 = the verified P1 state**, sha ca1089e2a0c1…; **run 26 = the
verified P2-a state**, sha ce6719c8af450eaa…, 15/15 triad incl.
`windowFinite_LFunction`; **run 31 = the verified P2-b state**, sha
396d8710d9084388…, 17/17 triad incl. `eulerStripImmunity_changeLevel`
(the dead unit-9 fire's run 31 COMPLETED before the session died — verdict
recovered from the preserved log at restart, 2026-11-20); **n2-p3-run2 =
the verified P3-a statement rung**; **n2-p2c-run8 = the verified P2-c
primitive core**, sha 2cca447d7c2a29c8…, 11/11 triad incl.
`thmE_dyadic_to_cumulative`; **n2-p3e-run1 = the verified P3-e assembly**;
**n2-p3v2-run3/4 = the verified P3-d + ℚ endpoint**, incl.
`zetaColumn_of_V2` and `zetaL_two_thirds_landed_ℚ` triad on the V2
substrate).

## Milestone verdicts (verified state = run 19)

| milestone | content | verdict |
|---|---|---|
| M1-core (P1-a) | `chi_span_eq_one`, `chi_span_mul`, `chi_span_ne_zero`, **`chi_span_residue` (the c-trick)** | **GREEN-triad** (since run 7) |
| M1-packaging | `exists_nat_span`, `chiUnitHom`/`ratCharOf`, `ratCharOf_apply` | **GREEN-triad** (7/7 since run 10) |
| M2 (P1-b) | `heckeTsum_eq_ratCharOf_LFunction` — the L-series identification | **GREEN-triad** (run 15) |
| **M3 (P1-c/d)** | `ratCharOf_eq_one_iff` (principality transfer), `isPrincipal_of_modulus_one` (q = 1 degeneracy), `identity_theorem_extension` (the donor's EntireAbelianQuotient pattern on our pin), `hasQDirichletDictionary` (**N2-a DISCHARGED**), `factorization_identity_extension` (the hAbFacQ bridge), `dirichletFactorizationTransfer` (the corrected composed transfer) | **GREEN-triad (run 19)** — 6/6 |
| **P2-a** | `windowFinite_LFunction` (χ ≠ 1 ⇒ WindowFinite (multOf χ.LFunction) — the hEχ port's window-finiteness input, via the isolated-zeros ⇒ discrete ⇒ closed ⇒ compact-box-finite chain) | **GREEN-triad (run 26)** — 15/15 file decls |
| **P2-b** | `eulerStripImmunity_changeLevel` (the Euler-identity transport — strip immunity for imprimitive characters; `HasEulerStripImmunity` becomes a theorem) | **GREEN-triad (run 31, verdict recovered 2026-11-20)** — 17/17 file decls |
| **P2-c core** | `thmE_dyadic_to_cumulative` + the count/window/chain infrastructure (`multOf_supp_iff`, `count_eq_ncountL`, `n0star_le_countOn`, `countCum_split`, `countCum_mono`, the doubling chains, `epsLowerCum_of_epsLower` — the dyadic→cumulative bridge) | **GREEN-triad (n2-p2c-run8, 2026-11-20)** — 11/11; the hUnb binder stays (Titchmarsh §5.8/Davenport ch.9, named) |
| **P3-b** | `abFacQ_of_factorization` (the hAbFacQ bridge — two-theorem P1 chain) | **GREEN-triad (n2-p3-run3)** |
| **P3-c** | `analyticOrderAt_lFunction_ne_top` (the engine's component nontop slot) | **GREEN-triad (n2-p3-run3)** |
| **P3-d** | `zetaColumn_of_V2` (the V2 ζ-column discharge — d4 endpoint + count identifications + the 2/3 ≤ 0.6725 numeral) | **GREEN-triad (n2-p3v2-run3, 2026-11-20)** — on the V2 substrate; donor d4 re-printed triad |
| **P3-e** | `zetaL_two_thirds_landed_of_DZDF` (THE COMPOSED N2-d ASSEMBLY — the card discharged over the GREEN stack; hζ/hEχcum as premises per the substrate split) | **GREEN-triad (n2-p3e-run1, 2026-11-20)** — first shot |
| **ℚ endpoint** | `zetaL_two_thirds_landed_ℚ` (the unconditional-at-ℚ remainder — RESEARCH.md §Iteration-5 lead-1 tail) | **GREEN-triad (n2-p3v2-run4, 2026-11-20)** — hfinζ/hntopζ the named FOREVER binders |
| **P2-d (hEχ composition)** | `epsLowerCum_of_thmE` + `componentEpsCum_of_thmE` (ANY ψ ≠ 1 via `ψ.primitiveCharacter` — the imprimitive hEχ rung: thmE_dyadic_to_cumulative + eulerStripImmunity_changeLevel + the count-agreement transfer) | **GREEN-triad (n2-p2d-run2, 2026-11-20)** — 6/6; SLOT-1's hEχ premise fully dischargeable; per-primitive binders only (ThmEDyadic donor endpoint + CountsUnbounded classical) |

**P1 is COMPLETE: the ℚ dictionary (N2-a), its L-series identification (N2-a(ii)),
principality transfer (N2-a(iii)), the identity-theorem extension, and the
factorization transfer are all kernel-verified, 14/14 file declarations triad-clean,
0 sorry.** What remains of the N2 pilot is P2 (the hEχ port) and P3 (the V2 ζ-column
landing) — the assembly-engine side; the dictionary layer is done.

## §10-format row block (verified state = run 19; axioms source `logs/n2-p1-run19.log`)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `chi_span_eq_one` | `pilots/75/N2-P1.lean:215` | PROVED-UNCONDITIONAL | run 19 — triad | DZDF `map_span'` over ℚ |
| `chi_span_mul` | `N2-P1.lean:244` | PROVED-UNCONDITIONAL | idem — triad | DZDF `map_mul'` on principal spans |
| `chi_span_ne_zero` | `N2-P1.lean:316` | PROVED-UNCONDITIONAL | idem — triad | DZDF `eq_zero_iff'` forward; `1 < q` scope |
| `chi_span_residue` | `N2-P1.lean:348` | PROVED-UNCONDITIONAL | idem — triad | **the c-trick** — the dictionary's mathematical core |
| `exists_nat_span` | `N2-P1.lean:161` | PROVED-UNCONDITIONAL | idem — triad | ℚ ideal classification |
| `ratCharOf` | `N2-P1.lean:404` | PROVED-UNCONDITIONAL | idem — triad | dictionary character via `MulChar.ofUnitHom` |
| `ratCharOf_apply` | `N2-P1.lean:411` | PROVED-UNCONDITIONAL | idem — triad | value dictionary, ALL k at 1 < q |
| `heckeTsum_eq_ratCharOf_LFunction` | `N2-P1.lean:473` | PROVED-UNCONDITIONAL | idem — triad | **M2**: Hecke tsum = mathlib L-function on ℜs > 1 |
| `ratCharOf_eq_one_iff` | `N2-P1.lean:537` | PROVED-UNCONDITIONAL | idem — triad | **M3-a**: principality transfer (`MulChar.ext` + `one_apply_coe`; sup-bridge + `Units.ne_zero`) |
| `isPrincipal_of_modulus_one` | `N2-P1.lean:576` | PROVED-UNCONDITIONAL | idem — triad | **M3-b**: q = 1 degeneracy (`Unique (ZMod 1)` instance) |
| `identity_theorem_extension` | `N2-P1.lean:590` | PROVED-UNCONDITIONAL | idem — triad | **M3-c**: half-plane → ℂ∖{1} (donor's verbatim pattern: `AnalyticOnNhd.eqOn_of_preconnected_of_eventuallyEq` + `isConnected_compl_singleton_of_one_lt_rank`, seed z₀ = 2) |
| `hasQDirichletDictionary` | `N2-P1.lean:610` | PROVED-UNCONDITIONAL | idem — triad | **M3-d**: `HasQDirichletDictionary` discharged (N2-a complete) |
| `factorization_identity_extension` | `N2-P1.lean:621` | PROVED-UNCONDITIONAL | idem — triad | **M3-c2**: the hAbFacQ bridge (products of entire LFunctions) |
| `dirichletFactorizationTransfer` | `N2-P1.lean:651` | PROVED-UNCONDITIONAL | idem — triad | **M3-e**: the composed transfer (corrected shape, `hnp` explicit — see the FIND) |
| `windowFinite_LFunction` | `N2-P1.lean:738` | PROVED-UNCONDITIONAL | **run 26** — triad | **P2-a**: the hEχ port's WindowFinite input (isolated-zeros chain; the §10 axioms source for this row is `logs/n2-p1-run26.log`) |
| (engine, frozen) | `Pa.lean` | PROVED-HERITAGE | run 19 Pa block — triad | recompiled clean each run |
| (P0 quotes, frozen) | `N2-P0.lean` (staged `N2P0`) | PROVED-HERITAGE | run 19 — triad | 15/15 per P0 record |

Zero sorry tokens written at any point (classifier: all grep hits are
header/audit prose); all intermediate sorryAx prints were elaboration-error
cascades, eliminated as fixes landed.

## STATEMENT FIND (find-#4 precedent class; recorded in-decl at `N2-P1.lean:641`
## + dossier + here; P0 amendment owed)

**`N2-P0.lean:166`'s `DirichletFactorizationTransferQ` as literally stated is
NOT provable.** Its hypothesis list omits the nonprincipality input
(`∀ i, ¬ IsDZDFPrincipalQ (m i) (χ i)`), yet its conclusion asserts `ψ i ≠ 1`.
Counterexample class: a principal family (e.g. the trivial character at
modulus (2), fK the ζ-side continuation, fL := Hecke·fK — all hypotheses hold)
would force `LFunction (ψ ≠ 1) = principal-Hecke` on ℜs > 1, refuted by
coefficient comparison (the L-series of a nontrivial character cannot equal
that of the principal character on the whole half-plane); the degenerate
fK = 0 case shows the shape is not uniformly refutable either — it is simply
wrong as a target. The DZDF factorization's own `∀ i, ¬IsDZDFPrincipalQ` is
the intended input; M3-e (`dirichletFactorizationTransfer`) carries it as the
explicit hypothesis `hnp` and discharges the corrected shape GREEN-triad.
**Owed:** the N2-P0 amendment (add `hnp` to the Prop, one-line + record note;
P0's 15/15 elaboration ledger unaffected — statement elaboration does not
certify provability), for the P0 owner (this lane) at the next P0-touching
commit; flagged for A1's verification-tables fold.

## Run ledger (19 runs; walls 66–190 s; telemetry per log; route: doz CLI,
`crossmath-pilot-75` warm lineage on semraker throughout; 2 cpu / 4 GB soft,
LEAN_NUM_THREADS=2; mem OVER flags on runs 11–19 are the AGENTS.md §Modal-5
mapped-olean artifact — M2/M3's statements pull the hurwitzZeta/LSeries
analysis closure; cpu stayed ≤ 1.02/2.0 in every run)

- Runs 1–8 (2026-11-17): descent 37→26→12→8→5; M1-core GREEN-triad at run 7;
  run 8 = the authorized closure run (fired at 21:09 just before the network
  termination; the wrap-up's "never verified" was a visibility gap, corrected
  at restart).
- Run 9: the one post-closure fix+rerun — 5→1 errors; `ratCharOf` GREEN-triad.
- Runs 10–15 (M2): run 10 confirmed M1 7/7 (the v10 conv_lhs fix) + M2 first
  elaboration; four mechanical classes (brace typo; `.mp`/`.mpr`; set_option
  placement; **the `have`-opacity trap** — tactic-`have` admits no zeta-unfold,
  retroactive root cause of the show-defeq failures; fix `let`); the F5(ii)
  fallback (LSeries-bridge restructure) executed; **run 15: M2 GREEN-triad**.
- Runs 16–19 (M3, fresh ≤6 budget): run 16 first elaboration (6 errors: missing
  Fact/Nontrivial instances; the donor's `(z₀ := 2)` named arg dropped;
  `Differentiable.differentiableAt`'s implicit point; omega's ∀-instantiation
  limit); run 17 (1 error: unit-vs-element metavariable rw in hvne); run 18
  (1 error: `.symm` direction); **run 19: OK — 14/14 triad-clean**. Four M3
  runs (2 under budget).
- Runs 22–23 (2026-11-19, R6 wave-4, the 2-run remnant of the P2 ≤6 budget;
  input shas 4839521c… (r22, from parked ecd44c6a + 4 pin-verified fixes) →
  r23): **r22 8→3 errors** — the four R6 fixes all landed (isDiscrete_zeroSet
  block fully green: `DifferentiableOn.analyticAt` + `.analyticOnNhd`
  (CauchyIntegral.lean:721/:729 — the REAL complex bridges; neither
  `DifferentiableAt.analyticAt` nor `Differentiable.analyticOnNhd` exists on
  the pin), the `.frequently` append (mathlib's own
  `frequently_zero_iff_eventually_zero` idiom), the verified 5-tuple
  `Filter.disjoint_iff` shape, the missing-`have` on `him`); residue = hBeq
  and_assoc + IsBounded shadowing. **r23 3→4 errors — NOT descent: the r22
  count was masking** (a failed have-type suppresses its whole tactic block;
  hBbd's `rw` had never elaborated at r21/r22). Residue all name-resolution:
  the pin's set-boundedness API is namespaced (`Bornology.IsBounded`,
  `Metric.isBounded_iff_subset_closedBall`, `Metric.isCompact_iff_isClosed
  _bounded`) while the file's `open Filter` shadows bare `IsBounded`; plus the
  A5 tail-tuple shape (wrong all along, masked — Real's `≤` whnfs to lt-or-eq,
  the r23 "more than one constructor" error). All four fixes applied on disk
  post-r23 (parked, unfired, sha cf6d293f…); budget EXHAUSTED at 6/6 there.
  Walls 66/59 s; r22 telemetry OVER-mem = the §Modal-5 mapped-olean artifact;
  r23 finished under the first sample.
- Runs 24–25 (2026-11-19, R6 unit 2, fresh ≤2-run grant on the diagnosis
  class; input shas 68a73689… (r24) → ce6719c8… (post-r25 park)): **r24 11
  errors — ALL inside the never-elaborated hBbd body, every other fix held**
  (the Pa-idiom tail, hBeq, hBbd's have-type + rw, hBcp/hfin all green; the
  masking lesson vindicated). Classes: bare `|ρ|` for ρ : ℂ is a lattice-abs
  parse error on the pin ("failed to synthesize Lattice ℂ" — write `‖ρ‖`;
  the ℂ norm instance is √(normSq), Analysis/Complex/Norm.lean:28–33);
  `Complex.sq_abs` unknown (A5's guess — the bridge is
  `Complex.norm_mul_self_eq_normSq` + `Complex.normSq_apply`, Norm.lean:33 +
  Basic/Complex/Basic.lean:516); the folded-hρ linarith blindness (unfold via
  the Pa simp-only idiom + obtain); `Metric.mem_closedBall` +
  root `dist_zero_right` + `abs_le_of_sq_le_sq` for the finish. Full hBbd
  rewrite in ‖·‖ form applied. **r25 11→1 — the whole rewrite landed; the
  single residual (:772) was R6's own `abs_le.mp (le_abs_self T₁)`
  construction unifying to the trivial `|T₁| ≤ |T₁|`; the intended
  `-|T₁| ≤ T₁` is one line (`le_abs_self (-T₁)` + `rw [abs_neg] at h` +
  linarith). Applied on disk, parked unfired (grant 2/2 SPENT; anything
  beyond = STOP + findings per the ruling). Expected: the next run on the
  parked sha ce6719c8… is P2-a GREEN (15/15, 0 sorry).** Walls 63/81 s;
  r25 telemetry OVER-mem = the §Modal-5 mapped-olean artifact (cpu 0.67/2.0).
  **Zero math defects across the entire grant; the P2-a argument is
  unchanged since run 22.**
- Run 26 (2026-11-19, R6 unit 3, the final-grant FIRE-ONCE ruling; input sha
  ce6719c8… verified by the pre-run guard): **OK — P2-a GREEN. 15/15 file
  decls triad-clean ([propext, Classical.choice, Quot.sound] only), 0 sorry,
  0 sorryAx**; Pa.lean OK, N2P0.lean OK. Wall 68 s, cpu 0.77/2.0, mem 3706 MB,
  **OVER=0** (fully within spec). The fix-loop closes at 10→8→3→4*→11*→1→0
  (* = unmasking events). P2-a CLOSED; same unit drafted the N2-P3 skeleton
  (`N2-P3.lean`, statements-only zero-sorry rung) + the P2-b note below.
- Runs 27–29 (2026-11-19, R6 unit 4, the P3-a + P2-b grant): **P3-a GREEN
  in 2 runs** (`logs/n2-p3-run{1,2}.log`; run 1 = one declaration-order
  error — ComponentEpsCum used before its def; run 2 = OK, all five cards +
  #check pins, 0 sorry; the N2P1 byte-identical-copy staging VERIFIED —
  compiles OK; runner pair `run_n2p3.sh`/`.py` added, ORDER =
  [Pa, N2P0, N2P1, N2-P3]). Then **P2-b (strip immunity) opened: 11 → 6 → 4
  errors over runs 27–29** (grant 3/3 spent): r27 = the changeLevel family
  is namespaced (`DirichletCharacter.` prefix; unqualified use in a theorem
  STATEMENT autoImplicit-poisons the whole body — the AddCommGroup ℕ junk
  class) + `↗` is scoped notation (`scoped[LSeries.notation]`,
  LSeries/Basic.lean:265 — expanded to the explicit lambda in e1/e2); r28 =
  ONE root class: un-annotated `fun s =>` binders under postponed instance
  metas make the leading `1 - …` literal default to ℕ (annotate
  `fun s : ℂ =>`, 11 sites); r29 = **hhp + hident (the Euler-identity
  transport — P2-b's mathematical core) elaborate GREEN**, residuals 4
  mechanical (double-prefix from the blanket replace; `push_cast <;> rfl`
  cast-bridge; `Complex.`-namespace for norm_cpow_eq_rpow_re_of_pos; the
  `analyticOrderAt_ne_top` ∃-form trap → reroute via
  `analyticOrderAt_eq_top.mp`). All four fixed on disk post-r29 — parked
  sha 225830aa…, expected next-run GREEN (17/17). Zero math defects; walls
  79/76/67 s, cpu ≤ 0.92/2.0, one OVER-mem artifact (r28).
- Run 30 (2026-11-19, R6 unit 5, the LAST P2 micro-grant, FIRE-ONCE; input
  sha 225830aa… guarded): **FAIL — 2 errors — HARD-STOP P2-b per the
  ruling.** Descent 11→6→4→2; **`lFunction_not_eventually_zero` now
  TRIAD-CLEAN (16/17 — only `eulerStripImmunity_changeLevel` carries the
  failed-decl sorryAx)**. The two residuals: (i) :883 a by-linarith inside
  the norm_cpow rw (goal display truncated; best-effort parked fix hoists
  the positivity fact with the lemma supplied); (ii) :918 dot-notation on
  AnalyticAt-typed terms resolves through the whnf head
  (`∃ p, HasFPowerSeriesAt …`) → phantom `Exists.` lookup — the eq_top iff
  is ROOT-level (`analyticOrderAt_eq_top`, Order.lean:77 in section
  NormedSpace with no namespace; its :119 sibling carries an explicit
  `AnalyticAt.` prefix IN THE NAME, which is why ITS dot worked at r29).
  Both fixed on disk post-r30 — parked sha 396d8710…, expected next-run
  GREEN 17/17. P3-a STAYS BANKED GREEN; P2-c NOT opened (was conditional
  on r30 green); no P3 staging. Wall 64s, cpu 0.89/2.0, OVER=0.
- n2-p3-run3 (2026-11-19, R6 unit 7, the unblocked P3-b + P3-c rungs per
  `N2-P3-plan.md`; N2-P1 guarded at the parked 396d8710 — NOT re-opened;
  only its already-triad helper consumed): **OK FIRST SHOT — P3-b AND P3-c
  BOTH GREEN** (`logs/n2-p3-run3.log`): `abFacQ_of_factorization` (the
  hAbFacQ bridge — the two-theorem P1 chain applied) and
  `analyticOrderAt_lFunction_ne_top` (the engine's hntopψ slot), plus
  `windowFinite_family`'s first formal axiom print — **all three
  triad-clean, 0 sorry**; 1 of the ≤4 unit-7 runs spent. N2-P3.lean sha at
  firing f9bd28c5… . Per the plan's binder table, the P3-e assembly now
  needs ONLY: P2-b-confirm (transitive, for the imprimitive hEχ
  composition) + P2-c + P3-d (V2 substrate). Wall 64s, cpu 1.00/2.0, one
  mapped-olean OVER.
- Unit 8 (2026-11-19, R6; two parallel tracks): **(b) THE V2 SUBSTRATE
  BUILT GREEN** (`logs/n2-p3v2-build1.log`: build OK + smoke OK, wall 507s;
  **the d4 endpoint's ON-PIN AXIOM PRINT BANKED** — `ZetaZeros.
  simple_proportion_d4` triad-clean, full statement confirmed; PNT+
  redirect + lake-update resolved mathlib ff2494ea per the m4b2/G2
  precedent; runner pair `run_n2p3v2.{sh,py}` + `N2-P3V2-smoke.lean`
  ready for P3-d). **(a) P2-c primitive core opened in a NEW file
  `N2-P2c.lean`** (keeps N2-P1 frozen at the parked sha; runner pair
  `run_n2p2c.{sh,py}`): runs 1–3 (grant 3/3 spent) 37→26→14 errors —
  **`multOf_supp_iff` + `count_eq_ncountL` (the count-identification
  layer, the port's first pillar) ALREADY TRIAD-CLEAN**; the 14 residuals
  all name-resolution/tactic-shape with certain fixes applied on disk
  (parked sha da4c8d3f…; the le_or_gt disjunct-order swap, the
  dependent-rewrite dodge via Finset.sum_eq_zero, Tendsto.eventually's
  pullback form, the find-equation carry-through, term-vs-tactic
  mem_toFinset). Zero math defects; the bridge/chain architecture is
  validated by the green pillars. Walls 60–90s, no over-flags.
- **Unit 9 (2026-11-19, R6 — DEAD FIRE, verdicts recovered 2026-11-20 from
  the preserved worktree logs; the session died AFTER these completed):**
  (a) **run 31 = P2-b GREEN 17/17** (`n2-p1-run31.log` — input sha 396d8710
  guarded; `eulerStripImmunity_changeLevel` triad; the r30 fix pair closed
  the loop 11→6→4→2→0; wall 52s, OVER=0); (b) **n2-p2c-run4 = P2-c FAIL
  7 errors** (the parked fix-set C insufficient — see run 5); (c) **P3-d
  runs 1–2** (`n2-p3v2-run{1,2}.log`): r1 13 errors, root = the incomplete
  V2-abbrev carry (V2.nontrivialZeros/V2.zeroMultiplicity) + backward rw;
  r2 exactly 1 error (:44 anonymous-constructor `hρ.1 : ρ.re = 1/2` passed
  where `ρ.re < 1` expected). The session died before r2's one-line fix was
  applied — recovered + fired as run 3 by unit 10.
- Unit 10 (2026-11-20, R6, the post-restart re-fire session): **the WHOLE
  landing arc closed.** (1) **P3-d run 3 GREEN** (input 5bb6a49f = r2 + the
  :44 fix; 5/5 audit prints triad + d4 re-print; wall 491s, build-phase
  OVER-cpu = the authorized m4b2/G2 class). (2) **P2-c runs 5–8**: r5
  7→1 (the toFinset transport restructure — see the engineering block
  below), r6 1→6* (UNMASKING — the failed hKmin term suppressed the
  succ-bullet tail), r7 6→1 (the :308 misattribution corrected — the error
  was hblock's nlinarith `pow_pos two_pos (j+1)`, not hp2K), **r8 GREEN
  11/11** (`n2-p2c-run8.log`; final sha 2cca447d7c2a29c8). (3) **P3-e run 1
  GREEN FIRST SHOT** (`n2-p3e-run1.log` — new file N2-P3e.lean + runner
  pair run_n2p3e.{sh,py}; `zetaL_two_thirds_landed_of_DZDF` +
  `epsLowerCum_transfer_plain` triad; wall 100s, OVER=0). (4) **V2 run 4
  GREEN — the ℚ endpoint** (`n2-p3v2-run4.log`: `zetaL_two_thirds_landed_ℚ`
  appended, 6/6 prints triad; wall 567s). (5) N3 full-coverage axchecks
  fired (plain 6-module Ax-chain + V2-side AxN2P3V2 — see below). All runs
  sha-guarded, telemetry logged, verdicts with post-run blocks in-log.
- Unit 11 (2026-11-20, R6, the orchestrator's optional-rung ruling): **the
  imprimitive hEχ composition GREEN — SLOT-1 has NO remainder.** New file
  `N2-P2d.lean` + runner pair `run_n2p2d.{sh,py}` (run_n2p3e pattern, ORDER =
  [Pa, N2P0, N2P1, N2P2c, N2P3, N2-P2d]). Runs 1–2 (`n2-p2d-run{1,2}.log`):
  r1 = 4 mechanical errors (the supp-transfer rw direction ×2; nested
  instance synthesis — windowFinite_LFunction inside @-form binders needs its
  OWN @-explicit NeZero(conductor) ×2), `primitiveCharacter_ne_one` already
  triad; **r2 GREEN 6/6** (`countCum_congr`, `countOnCum_congr`,
  `epsLowerCum_congr`, `primitiveCharacter_ne_one`, `epsLowerCum_of_thmE`,
  `componentEpsCum_of_thmE`; final sha 4f978b44a98ddbbe). The hEχ premise is
  now dischargeable for ANY nontrivial family from the two per-primitive
  binders (ThmEDyadic at ψ.primitiveCharacter = the zeta23 donor endpoint;
  CountsUnbounded at ψ.primitiveCharacter = the classical zero-infinitude).
  Zero new mathematics across the rung. **v2-candidacy note (per the
  orchestrator's 2026-11-20 ruling, evaluation at Iteration-6 open): the
  evidence base for an article-75 v2 upgrade = the composed N2-d card
  `zetaL_two_thirds_landed_of_DZDF` (n2-p3e-run1) + the ℚ endpoint
  `zetaL_two_thirds_landed_ℚ` (n2-p3v2-run4) + the full hEχ arc (P2-a/b/c/d)
  + the N3 audits (358 + 48 records, 0 sorryAx) — every engineering slot of
  the charter discharged; the FOREVER binder ledger unchanged (DZDF
  statement-binder G1-permanent; hUnb/hfinζ/hntopζ classical; fL-side
  structural).**
- Unit 12 (2026-11-20, R6, planning-only per the orchestrator's iter-6-prep
  ruling): **the article-75 v2-candidacy dossier drafted —
  `pilots/75/v2-candidacy-dossier.md`** (the one-read decision input for the
  iteration-6 open: the row-delta map vs the landed article v2, the closed-
  vocabulary status-row drafts with exact binder inventories, the N3 audit
  citations, the prospective S1–S4 checklist with the S4(b) bite-risks named,
  and the NOT-A-SHIP box; includes the file-internal v3-numbering caution).
  No fires this unit.

## Engineering record (reusable friction ledger; supplements the M2 note)

New M3 classes (all one-fix-each): `Units.ne_zero` needs `Nontrivial (ZMod q)`
= the Fact-governed `ZMod.nontrivial` instance — establish `haveI iF : Fact
(1 < q)` first; donor-pattern term applications must carry the `(z₀ := 2)`
named argument or the seed stays a metavariable through both point-proofs;
`Differentiable.differentiableAt`'s point is an implicit section variable —
`hg.differentiableAt (x := ρ)`; `omega` does not instantiate ∀-hypotheses —
`have hqi := hq i` first; a rw whose lemma-argument is a coerced UNIT
(`ZMod.natCast_zmod_val u`) leaves the pattern's `a` a metavariable — state
the equation explicitly with the coerced argument and rw the equation. The
identity-theorem extension is now a one-shot reusable pattern
(`identity_theorem_extension`: DifferentiableOn-on-{1}ᶜ + half-plane agreement
⇒ everywhere-off-{1}); the punctured-plane connectedness comes free from
`isConnected_compl_singleton_of_one_lt_rank` + `Complex.rank_real_complex`.

P2-a classes (runs 22–23, R6; all name-resolution/shape — zero math defects):

- **The complex bridges are `DifferentiableOn.analyticAt` /
  `DifferentiableOn.analyticOnNhd`** (Analysis/Complex/CauchyIntegral.lean:721/
  :729) — `DifferentiableAt.analyticAt` and `Differentiable.analyticOnNhd` do
  NOT exist on the pin; feed `hd.differentiableOn` + `isOpen_univ` /
  `isOpen_univ.mem_nhds (mem_univ x)`.
- **`AnalyticOnNhd.eqOn_zero_of_preconnected_of_frequently_eq_zero` takes ∃ᶠ
  (∃ᶠ z in 𝓝[≠] z₀)**, not ∀ᶠ — from an ∀ᶠ-in-𝓝 branch use
  `(h.filter_mono nhdsWithin_le_nhds).frequently` (mathlib's own
  `AnalyticAt.frequently_zero_iff_eventually_zero` idiom; NeBot for 𝓝[≠] is
  free over ℂ).
- **`Filter.disjoint_iff` (Order/Filter/Basic.lean:420) is the 5-component
  ∃** (`∃ s ∈ f, ∃ t ∈ g, Disjoint s t`); with `Filter.mem_principal_self`
  (:152) + `Set.disjoint_iff_inter_eq_empty` under `_root_.disjoint_iff.mp`
  (Order/Disjoint.lean:162) it discharges the `isDiscrete_iff_nhdsNE` goal
  `𝓝[≠] x ⊓ 𝓟 S = ⊥` (note the pin's RHS is the inf-equation, not NeBot).
- **Set-boundedness API is NAMESPACED on this pin**: `Bornology.IsBounded`
  (Topology/Bornology/Basic.lean:101), `Metric.isBounded_iff_subset_closedBall
  ` and `Metric.isCompact_iff_isClosed_bounded` (inside `namespace Metric`,
  MetricSpace/Bounded.lean:65/:97) — Bounded.lean reads them bare only via its
  own `open Bornology`; a consuming file with `open Filter` gets `IsBounded`
  SHADOWED by `Filter.IsBounded` (Order/Filter/Defs.lean:491) and
  `_root_.IsBounded` is a resolution error. `IsCompact.finite` (Compactness/
  Compact.lean:1054, takes `(hs : IsCompact s) (hs' : IsDiscrete s)`) and
  `IsDiscrete.mono` (Constructions.lean:636, `(hs : IsDiscrete s) (hst : t ⊆
  s)`) ARE root and fine.
- **THE MASKING LESSON (runs 21–23)**: under a failed `have`-TYPE, the
  block's tactic lines are suppressed — absence of per-line errors inside a
  masked block is NOT evidence of correctness (A5's r21 "hBbd fixed" note and
  R6's r22 "hBbd body clean" reading were both this artifact; it also hid the
  tail-tuple shape error). Budget discipline consequence: error-COUNT
  non-descent (3→4 at r23) can be an unmasking, not a regression — read the
  positions, not the count.
- **Real's `≤` whnfs to `a < b ∨ a = b`** (the LE instance is literally
  lt-or-eq): an anonymous-constructor leaf mismatch against a Real inequality
  surfaces as the confusing "expected type `0 < ρ.re ∨ 0 = ρ.re` has more
  than one constructor". The fix is the tuple SHAPE (`rintro ⟨hρs, hρ2, hρ3,
  hρ4, hρ5⟩` flattening supp ∩ stripWindow, then `⟨⟨le_of_lt hρ2, le_of_lt
  hρ3, le_of_lt hρ4, hρ5⟩, hzero⟩` flat-4-in-pair against B ∩ zeros).

P2-a classes (runs 24–25, R6 unit 2; all tactic-field — zero math defects):

- **Bare `|z|` for z : ℂ does NOT elaborate on this pin** — the `| |`
  notation attempts a lattice-flavored abs and fails with "failed to
  synthesize instance Lattice ℂ". Write `‖z‖` (the ℂ norm instance is
  √(normSq), Analysis/Complex/Norm.lean:28–33; `Complex.norm_nonneg` is
  protected — call it by full name).
- **The |z|² = re²+im² bridge**: `Complex.sq_abs` does NOT exist; use
  `‖z‖ ^ 2 = ‖z‖ * ‖z‖ (by ring)` → `Complex.norm_mul_self_eq_normSq`
  (Norm.lean:33) → `Complex.normSq_apply` (Basic/Complex/Basic.lean:516),
  finished with `ring`.
- **linarith cannot see through folded set-membership hypotheses** — unfold
  first with the Pa idiom (`simp only [hBdef, Set.mem_ofPred_eq] at hρ`)
  then `obtain` the bounds; |T|-atom connections need explicit facts
  (`T₂ ≤ |T₂|` via `le_abs_self`; `-|T₁| ≤ T₁` via
  `le_abs_self (-T₁)` + `rw [abs_neg] at h` + linarith).
- **The `abs_le.mp (le_abs_self a)` TRAP** (r25's single error): the
  application unifies to the trivial `|a| ≤ |a|` and fails — expected-type
  propagation sets the iff's `b` from the projection, not from the argument.
  Construct negated-abs facts via the `le_abs_self (-a)` + `abs_neg` route.
- **The closedBall finish**: `Metric.mem_closedBall` (Pseudo/Defs.lean:423,
  namespaced — NOT bare) + root `dist_zero_right` (bare; precedent
  Normed/Module/Convex.lean:119) + `abs_le_of_sq_le_sq`
  (Algebra/Order/Ring/Abs.lean:134) with a final `rwa [abs_of_nonneg hn] at
  hle` (the lemma concludes `|a| ≤ b`, the goal is `a ≤ b` for `a := ‖ρ‖`).

P2-b/P3-a classes (runs n2-p3-1/2 + 27–29, R6 unit 4; zero math defects):

- **An unqualified namespaced identifier in a theorem STATEMENT
  autoImplicit-poisons the entire proof body** (`changeLevel` → junk
  metavars → phantom AddCommGroup ℕ / Neg ℕ failures deep in the body).
  Qualify statement identifiers FIRST; body errors under a failed statement
  are not evidence. (Same genus as the failed-have masking lesson.)
- **`↗` is SCOPED notation** (`scoped[LSeries.notation]`,
  LSeries/Basic.lean:265, expands to `fun n : ℕ ↦ (f n : ℂ)`); without the
  scope it is a PARSE error. Expand the lambda explicitly rather than
  opening (the scope also carries an `L` alias for LSeries).
- **Un-annotated lambda binders under postponed instance metas default
  numeric literals to ℕ**: `Differentiable ℂ (fun s => 1 - …)` leaves
  `?E → ?F` unassigned, so the leading `1` elaborates as ℕ and
  `AddCommGroup ℕ` fails. ALWAYS annotate (`fun s : ℂ =>`) when the body
  starts with a numeric literal or the type feeds only through instances.
- **`AnalyticAt.analyticOrderAt_ne_top` is the ∃-witness iff** (Order.lean:
  119) on this pin, NOT the eventually-zero negation — for nontop from
  not-eventually-zero use `fun h => hnotzero (hA.analyticOrderAt_eq_top.mp h)`
  (:77: `analyticOrderAt = ⊤ ↔ ∀ᶠ z in 𝓝 z₀, f z = 0`).
- **`norm_cpow_eq_rpow_re_of_pos` is Complex-namespaced** (declared inside
  `namespace Complex`, Pow/Real.lean:280/:337) despite living in a Real
  file; the (p:ℝ)↔(p:ℕ)-cast bridge in ℂ needs `by push_cast <;> rfl`
  (plain push_cast can leave a trivial residual; `Complex.ofReal_natcast`
  does NOT exist on this pin).
- **Blanket string-replace double-prefix hazard**: replacing
  `changeLevel hMN χ` also hit inside `LSeries_changeLevel hMN χ` — verify
  replaces against lemma-name substrings (`LSeries_` + `changeLevel`).
- **Dot-notation on `AnalyticAt`-typed terms resolves through the whnf
  head (`∃ p, HasFPowerSeriesAt …`) → phantom `Exists.` lookups** (r30
  :918). The order-API siblings differ: `AnalyticAt.analyticOrderAt_ne_top`
  (:119) carries the namespace IN ITS DECLARED NAME (dot works), while
  `analyticOrderAt_eq_top` (:77) is ROOT-level in `section NormedSpace`
  (dot fails — reference it bare).
- **`χ.norm_le_one`** (Bounds.lean:44, `DirichletCharacter.`-namespaced,
  dot-usable) is the character-value norm bound; with
  `Complex.norm_cpow_eq_rpow_re_of_pos` + `Real.rpow_lt_one_of_one_lt_of_neg`
  + `Real.rpow_nonneg` the strip zero-freeness is a 4-fact nlinarith.

P2-c classes (runs 4–8, R6 units 9–10; zero math defects — the bridge's
architecture was already validated by the green pillars):

- **`Set.Finite.toFinset` is PROOF-DEPENDENT on this pin** (Data/Set/Finite/
  Basic.lean:75: `toFinset h = Set.toFinset h.fintype`, choice through the
  Fintype) — two toFinsets of the SAME set via different Finite proofs are
  neither syntactically equal nor rw-bridgeable. The working idiom (Pa.lean's
  own GREEN pattern): build the union finiteness by `hfA.union hfB`, bridge
  set-level by `Finset.ext ρ; simp only [Set.Finite.mem_toFinset, hset]` (or
  full `simp` when Finset/Set unions mix), convert same-proof toFinsets by
  `rfl`, then ONE `rw [hfe, hfu, Finset.sum_union hdisjF, hfe₁, hfe₂]`
  closing by rfl. NEVER `rw [hset] at hfinU` + pattern-match its toFinset.
- **`unfold`'s auto-rfl is not reliable for defeq-identical sums**: a goal
  whose two sides differ only by delta of a def (count vs its body) should
  be closed by `exact countCum_split …` (whole-theorem defeq) rather than
  rw+unfold.
- **`rcases K with | zero => … | succ K' => …` is MATCH syntax** — rcases
  wants `obtain _ | K' := K` + bullets.
- **`Nat.find_le hle` leaves the find predicate as a META** (its `p m`
  argument is implicit) — always ascribe:
  `have h1 : Nat.find hex ≤ K' := Nat.find_le hle`.
- **A bare `pow_pos two_pos _` inside a bracketed nlinarith list resolves
  `two_pos` against an AddMonoidWithOne junk instance** (no expected type
  under a bracket) — write `(by positivity : (0:ℝ) < 2 ^ (j + 1))`. The
  SAME term with an expected type (the chains' hpp) elaborates fine.
- **`abs_le` is an IFF** — cannot be applied; feed `le_abs_self` +
  `abs_nonneg` + cast-nonneg to nlinarith instead.
- **`le_or_gt`'s negative branch is STRICT** — `mul_nonpos_of_nonpos_of_
  nonneg` wants `le_of_lt hneg`.
- **linarith cannot relate the product atoms `(c-ε)*N` and
  `(c-ε/2)*N`** — bridge with `have hG : … := by ring` first, then linarith
  over hG + the decomposition equation.
- **A failed TERM-mode have masks the whole rest of its bullet** (the r5
  1-error → r6 6-error unmasking; the record's standing masking lesson now
  verified in the term direction too).

## P2/P3 recommendation (updated 2026-11-18, post-M3)

- **P2 (the hEχ port): GO** — every dictionary-level input it needs is now a
  kernel-verified theorem (`ratCharOf_apply`, `heckeTsum…`, the transfer's
  `1 < q i ∧ ψ i ≠ 1` scope); `ThmEDyadicToCumulative`'s proof is independent
  of P1's friction classes; `HasEulerStripImmunity`/`CountsUnbounded` shapes
  unchanged.
- **P3 (V2 ζ-column + the composed landing): GO** — the M4b import pattern is
  settled; `factorization_identity_extension` now supplies the exact
  `hAbFacQ : ∀ s ≠ 1` bridge the engine consumes, so P3's composition is a
  direct application chain (transfer → identity-extension →
  `zetaL_rat_two_thirds_landed`).
- **P0 amendment owed** (the FIND above): ~~add `hnp` to
  `DirichletFactorizationTransferQ`~~ — **APPLIED by A5 2026-11-18** (dated
  erratum block at `N2-P0.lean:161`; elaborates OK runs 20–23).

— end record (A5, 2026-11-18; P1 COMPLETE — M1+M2+M3 GREEN-triad at run 19).


## P2 state at the close-act hard stop (A5, 2026-11-18) — superseded by §below (R6)

- **Riding item DONE**: the N2-P0 erratum applied (`DirichletFactorizationTransferQ` + the `hnp` antecedent, dated erratum block at `N2-P0.lean:161`; P0-record note added; the amended file elaborates OK in runs 20–21; ledger 15/15 stands as history).
- **P2-a (windowFinite_LFunction) IN FLIGHT**: first elaborations runs 20–21 (10 → 8 errors, all in the P2-a block; the 14/14 triad state below line 720 is untouched and error-free). Four name-resolution classes fixed at run 21 (namespace AnalyticAt; Continuous.preimage_isClosed; IsBounded/isBounded_iff_subset_closedBall; two-preimage closedness). Remaining 8 errors: see `logs/n2-p1-run21.log` header + error list. 4 of the ≤6 P2 runs spent; parked at sha d4efc4ff… per the hard-stop rule.
- **P2-b (strip immunity) / P2-c (port) NOT STARTED** — spec current in the dossier §Proof-strategy steps 4–5; the P2-b API facts pinned this session: `DirichletCharacter.LSeries_changeLevel` (EulerProduct/DirichletLSeries.lean:173, exact form recorded above), `changeLevel_injective` (Basic.lean:79), `LSeries_ne_zero_of_one_lt_re` (Dirichlet.lean:233). P3 readiness: `factorization_identity_extension` (run 19) supplies the engine-input bridge; P3 is blocked only on P2-c.


## P2 state after run 26 (R6 unit 3, 2026-11-19) — **P2-a CLOSED GREEN**; unit-4: P3-a GREEN, P2-b opened; unit-5: P2-b HARD-STOPPED at 2 residuals (see ledger + resume note)

- **P2-a (windowFinite_LFunction) GREEN-triad at run 26** (15/15 file decls,
  0 sorry; sha ce6719c8…; OVER=0 telemetry). The hEχ port's window-finiteness
  input is a kernel-verified theorem. Error-loop closed: 10→8→3→4*→11*→1→0
  over runs 20–26; zero math defects throughout (the r20–r26 engineering
  classes are a complete name-resolution/tactic-field taxonomy — see the
  two engineering-record blocks above).
- **P2-b (strip immunity) — NEXT, not started. Spec note (pinned facts):**
  the target is `HasEulerStripImmunity` (N2P0 pair form: multOf ψ.LFunction =
  multOf χ'.LFunction on the open strip, χ' := the primitive associate).
  Pinned API: `DirichletCharacter.LSeries_changeLevel`
  (EulerProduct/DirichletLSeries.lean:173 — the imprimitivity Euler identity
  on ℜs > 1), `changeLevel_injective` (Basic.lean:79),
  `DirichletCharacter.LSeries_ne_zero_of_one_lt_re` (Dirichlet.lean:233),
  and the NEW r24 pin: `DifferentiableOn.analyticAt`/`.analyticOnNhd`
  (CauchyIntegral.lean:721/:729) for the identity-theorem transfer (the
  P1 `identity_theorem_extension` pattern re-applies verbatim). Proof plan
  (dossier step 4): changeLevel identity on ℜs > 1 → both sides meromorphic
  ⇒ identity theorem to ℂ; each correction factor `1 − ψ p p⁻ˢ` zero-free on
  the strip (|p⁻ˢ| = p⁻ᴿᵉˢ forces ℜs = 0 — Complex.abs-level, 75-prework
  §(d)(d2)); then the multOf-transfer lemma (Pa's `multOf_mul`-style
  vocabulary). Expected friction: the `p⁻ˢ` abs/zero-locus computation
  (real-exponential monotonicity) and the correction-product finiteness
  (N.primeFactors finite ✓ mathlib).
- **P2-c (the dyadic→cumulative port) after P2-b** — the P0 shapes
  (`ThmEDyadic`, `CountsUnbounded`, `ThmEDyadicToCumulative`) are staged
  verbatim; the P2-a landing now supplies its `hfin` slot per component
  (`windowFinite_family`, `N2-P3.lean`).
- **P3 SKELETON DRAFTED (this unit): `N2-P3.lean`** — statements-only
  zero-sorry rung: `AbFacQOfFactorization` (P3-b, the GREEN P1 chain shape),
  `windowFinite_family` (the file's one proof — P2-a applied at the family
  level), `ZetaColumnOfV2Q` (P3-d, the M4b ζ-column shape with the V2
  endpoint as binder), `ZetaLRatTwoThirdsOfDZDF` (P3-e, the composed N2-d
  statement, hEχ in ∀-candidate-family form) + `ComponentEpsCum`. Staging:
  needs `N2-P1.lean` staged as `N2P1.lean` (the N2P0 byte-identical-copy
  precedent) and a `run_n2p3` runner pair (copy of `run_n2p1` with ORDER
  extended); the V2 import is deferred to the P3-execution rung (M4b staging
  pattern — `pilots/42/M4b.lean:45` note). NOT yet elaborated (no run
  authorized for it this unit).


## NEXT-INSTANCE RESUME NOTE (R6 unit-5 close, 2026-11-19 — P2-b HARD-STOPPED; parked disk sha 396d8710d9084388…)

**[Unit-6 addendum: the full N2-P3 execution plan is now drafted —
`research/pilots/75/N2-P3-plan.md` (rung ladder P3-b/c/d/e with per-rung
exits, budgets, binder-discharge inventory, risks, and the P2-c interleave
analysis: P3-b/P3-c/P3-d are NOT P2-c-dependent and can run while P2-b
parks; only P3-e's assembly waits on P2-c ⇒ transitively P2-b). The
critical path to the landing: P2-b-confirm (1 run) → P2-c → P3-e.]**

**[Unit-7 update: P3-b + P3-c EXECUTED AND GREEN — one first-shot run
(n2-p3-run3): `abFacQ_of_factorization` + `analyticOrderAt_lFunction_ne_top`
+ the `windowFinite_family` axiom print, all triad, 0 sorry.]**

**[Unit-8 update: (b) the V2 substrate BUILT GREEN + the d4 on-pin axiom
print banked (P3-d unblocked: fire per N2-P3-plan.md rung 3 on
`run_n2p3v2.{sh,py}`); (a) P2-c opened in the new N2-P2c.lean — grant 3/3
spent at 14 residuals, the count-identification pillar (`multOf_supp_iff` +
`count_eq_ncountL`) ALREADY TRIAD, all residual fixes parked on disk
(sha da4c8d3f…). Remaining to the landing: P2-b-confirm (1 run) + P2-c
confirm (1 run expected) → P3-e assembly + N3 axcheck; P3-d any time.]**

**[Unit-10 FINAL: THE LANDING ARC IS CLOSED (2026-11-20). P2-b GREEN at
run 31 (verdict recovered from the dead unit-9 fire); P2-c GREEN 11/11 at
n2-p2c-run8; P3-d GREEN at n2-p3v2-run3; P3-e GREEN first shot at
n2-p3e-run1 (zetaL_two_thirds_landed_of_DZDF — the composed N2-d card
discharged); the ℚ endpoint zetaL_two_thirds_landed_ℚ GREEN at
n2-p3v2-run4; N3 plain-side full-coverage axcheck GREEN (358 records, 0
sorryAx, all ⊆ triad over Pa+N2P0+N2P1+N2P3+N2P2c+N2P3e; logs/
axcheck-n3-run1.log) AND the V2-side AxN2P3V2 audit GREEN (48 axiom
lines all exactly the triad, 0 sorryAx, incl. the donor d4 re-print;
logs/axcheck-n3v2-run1.log) — N3 CLOSED audit-complete. New files this session:
N2-P3e.lean + run_n2p3e.{sh,py} + axcheck_n75.{sh,py}; modified:
N2-P2c.lean (2cca447d), N2-P3V2.lean (run-4 sha), this record, the
dossier. The optional imprimitive hEχ rung ALSO closed GREEN at unit 11
(n2-p2d-run2: `componentEpsCum_of_thmE` triad — SLOT-1 has NO remainder;
per-primitive binders only: the donor endpoint + the classical
zero-infinitude).]**

**Wave-5 posture (superseded): P2-a CLOSED GREEN (run 26); P3-a BANKED GREEN (n2-p3-run2);
P2-b HARD-STOPPED at 2-residual depth by the ruling** (runs 27–30:
11→6→4→2; the helper `lFunction_not_eventually_zero` is TRIAD-CLEAN; the
Euler-identity transport hhp/hident validated since r29; zero math defects
throughout — the whole loop is name-resolution/tactic-field). Two fixes
applied on disk post-r30 (the hoisted positivity fact for the :883
by-linarith; the root-level `analyticOrderAt_eq_top.mp` for the :918
Exists-whnf dot trap) — parked sha 396d8710…, **expected: the next run
closes P2-b GREEN at 17/17**. Next-instance order: (1) fire that one run
on a fresh ruling (guard sha 396d8710…); (2) if the :883 linarith
resurfaces, read its exact :context goal first (the r30 display was
truncated — the parked hoist is best-effort); (3) on P2-b green → P2-c
(the dyadic→cumulative port per the P0 staged shapes `ThmEDyadic`/
`CountsUnbounded`/`ThmEDyadicToCumulative`; both its structural inputs —
P2-a finiteness, P2-b immunity — will then be theorems); (4) then P3
execution per the plan (V2 import rung, M4b pattern) + the N3
full-coverage axcheck before billing `zetaL_rat_two_thirds_landed`.
