# Pilot 11 — M3 precharter (CH20∘VW13 instantiation; DECISION-6 drain activation)

Lane R7, 2026-11-20. Activation authority: DECISION-6 (bench conversions on drain —
RESEARCH.md:281 "11-M3 stay under the drain-activation rule"; this lane drained and
the queue is dry; orchestrator dispatch of 2026-11-20). Billing:
**ENGINEERING instantiation — never discovery-billed; no article** (article 11 §7
carries M3 as an open limitation; if it lands, the article's status row refreshes IN
PLACE only — the a9 watchlist §1 row-8 convention). Work in worktree agent-10; H
pulls; no lane commits.

## 1. The CH20∘VW13 statement surface (donor, read-only sibling)

The two cited-literature claims (donor `ThreeSumApsp/TimeClaims/Sec3/Definitions.lean`,
namespace `ThreeSumApsp.Claim`, statements verified verbatim this session):

- **`Claim.CH20_Theorem_5_1`** (Definitions.lean:219–229; [CH20, Thm 5.1 proof-epilogue]):
  3SUM → Convolution-3SUM. Per weight-exponent `κ ≥ 0`: witnesses
  `E₁ Num₁ mag : ℕ → ℝ`, `N : ℕ → ℕ` with `IsPowPolylog E₁ (3/2)`, `IsPowPolylog Num₁ 0`,
  `IsPowPolylog (N) 1`, size bounds (`1 ≤ N n`, `1 ≤ mag n ≤ c'·n^{κ'}`), and the
  transfer: every `M.convolution3SUM T` yields `M.threeSum T'` with
  `T' n (n^κ) ≤ E₁ n + Num₁ n · T (N n) (mag n)` at every `n ≥ 1`.
- **`Claim.VW13_Theorem_4_3`** (Definitions.lean:235–243; [VW13, Thm 4.3]):
  Convolution-3SUM → Exact Triangle. Witnesses `c ≥ 1`, `E₂ Num₂ : ℕ → ℝ`,
  `size : ℕ → ℕ` with `IsPowLittleO E₂ (3/2)`, `IsBigOPow Num₂ (1/2)`,
  `IsBigOPow (size) (1/2)`, `1 ≤ size N`, and the direct membership: every
  `M.exactTriangle T` gives `M.convolution3SUM (fun N u => E₂ N·(1 + logU u) + Num₂ N·T (size N) (c·u))`.
- **The hand-carried composition** (donor `ThreeSumApsp/Sec3/Theorem21.lean:44–57`,
  `theorem_21a_compose`): pure arithmetic on six ABSTRACT functions — from
  `IsPowPolylog E₁ (3/2)`, `IsPowPolylog Num₁ 0`, `IsPowPolylog (N) 1`,
  `IsPowLittleO E₂ (3/2)`, `IsBigOPow Num₂ (1/2)`, `IsBigOPow (size₂) (1/2)` it
  concludes the three `n^{·+o(1)}` classifications, third conjunct
  `IsPowLittleO (fun n => E₁ n + Num₁ n · E₂ (N n)) (3/2)` — the NOTE-carried
  `n^{3/2+o(1)}` of Theorem 21(a). Docstring: "arithmetic only; it is not applied to
  the bounds of the two reductions" — exactly the hand-glue M3 replaces at the
  transfer level.

M3's point (dossier 11 §plan item 2, `candidates/11-z1-composable-reduction-theory.md`):
route the CH20∘VW13 pair through the M1 calculus — the two claims become `Red`
instances, `RedB.Red.comp` composes them (calls multiply, extras add), and the
composed 3SUM-from-Exact-Triangle bound is derived THROUGH the composition lemma, not
re-glued — the one-level-up twin of M1's `theorem19_of_red`.

## 2. What M1/M2 left parked

- **M1 COMPLETE** (blueprint §7): Red calculus both designs; `theorem19_of_red`
  acceptance GREEN, donor-exact type, triad.
- **M2 COMPLETE** (blueprint §8): TM2 realization (`RedTm2.lean`, all closures +
  `tm2_realized_composed` triad, 76-line axcheck 0 sorryAx).
- **Open, parked (article 11 §7 + README row 11):** (a) the word-RAM half
  (Theorem B(i), Light-language `Calls.lean` — NOT this task); (b) **M3, the
  CH20∘VW13 instantiation — this task**. Dossier stretch item 3 (the 21(b) chain:
  `VW13_Theorem_3_3 ∘ VW18_Theorem_4_2 ∘ ApspFromMinPlus`) remains unchartered —
  NOT priced here.

## 3. Substrate decision (deviation from the blueprint letter, recorded)

Blueprint §4 sketched M3 "in-tree on vendored 3sum-apsp". **Rejected at drain-activation
scale**: in-tree means building the donor tree on ITS toolchain (v4.33.1 /
mathlib `0df444a360ea`) — a G7b-class substrate effort (whole-tree closure), priced
far above a drain rung. **Chosen instead: the M1/M2-established pattern** — standalone
elaboration on OUR pin (mathlib `ff2494ea…`, v4.36.0-rc2, warm `crossmath-probe`
image), with the two Claim statements transcribed VERBATIM (def-only) and consumed as
**hypothesis binders** (the M1 `theorem19_of_red` precedent: donor claims enter as
explicit hypotheses; nothing of the donor's is imported, built, or re-proved; the
`ChanHe.reduction_correct` program is NOT re-ported, per the blueprint's own note).
Corpus-wide port finding (statement-port cost ≈ 0, probes B/E; P11T3's whole eth
tranche compiled GREEN first run) makes the def-only transcript low-risk.

## 4. Binder-tier plan (EnclOK conventions)

- **Tier 1 — PROVED (this rung, the M3 deliverable).** `RedM3.lean`:
  - transcript tranche (def-only, verbatim): `logU` (Util/Log.lean:104),
    `IsPowLittleO`/`IsPowPolylog`/`IsBigOPow` (PaperStatements.lean:1172–1183),
    `Claim.CH20_Theorem_5_1` + `Claim.VW13_Theorem_4_3` (Definitions.lean:219–243);
  - adapters `TS`/`C3S`/`ETp` (the RedCompB padding pattern over `ℕ × ℝ`);
  - `red_of_CH20` / `red_of_VW13` (the two lifts; the calculus's `calls_nonneg`
    field is satisfied by `max 0`-clamping with the sign carried in the guard —
    the corpus's own partiality convention, Definitions.lean:189 "Where the
    hypotheses … fail, nothing is claimed");
  - acceptance `composed_21a_of_ch20_vw13`: from the two binder claims, for every
    `κ ≥ 0`, the composed data EXIST with all six asymptotic side-conditions
    (verbatim `theorem_21a_compose` hypothesis shapes) and
    `∀ T, M.exactTriangle T → ∃ T₃, M.threeSum T₃ ∧ ∀ n (guard), T₃ n (n^κ) ≤
    E₁ n + Num₁ n·(E₂ (N n)·(1 + logU (mag n)) + Num₂ (N n)·T (size (N n)) (c·mag n))`
    — derived through `RedB.Red.comp` as a black box (Design B's virtue), the
    calls-product `Num₁·(Num₂∘N)` and extras-sum `E₁ + Num₁·(E₂∘N·(1+logU(mag·)))`
    exactly as the NOTE reads them.
- **Tier 2 — the `n^{3/2+o(1)}` classification (donor arithmetic; NOT this rung).**
  Closing the loop to `IsPowLittleO (fun n => E₁ n + Num₁ n·E₂ (N n)) (3/2)`
  requires the donor's asymptotic API with proofs (`Util/Asymptotics/PowLittleO.lean`
  141 LoC + `PowPolylog.lean` + the `IsBigOPow` O-calculus + `theorem_21a_compose`'s
  own filter-heavy proof — measured this session, ~300–500 LoC ported proofs) —
  outside the ≤300-LoC fire gate. Tier 1 is **Tier-2-ready**: the acceptance theorem
  SURFACES the six side-conditions at `theorem_21a_compose`'s exact hypothesis
  shapes, so the iteration-6 add-on consumes them without re-statement. Priced
  carry: the Tier-2 port + the `theorem_21a_compose`-verbatim application.

## 5. The Fischer arXiv:2610.32162 cite-consumable (exact role)

`novelty/iter4-external-priorart.md` §2.6 + §3.2.1-item-1 ([CONSUME]): Fischer
(2026-10-23) independently opens "since the 3SUM Hypothesis was recently refuted"
and rebuilds geometric quadratic lower bounds on a replacement **"k-AP Hypothesis"**.
Role here: **context-citation at pilot time, not a mathematical input** — it
motivates WHY the composed 3SUM→Exact-Triangle route matters now (the field is
re-anchoring lower bounds on replacement hypotheses; Exact Triangle is the standard
such anchor, and CH20∘VW13 is its 3SUM-side bridge), and it externally corroborates
the refutation-premise the 3sum-apsp corpus formalizes. It lands in THIS record §5
and (per the a6-charter-candidate note, "add the Fischer cite when piloted") in
article 11's §8 references at the M3 status-row refresh. It proves nothing about
CH20∘VW13 and is never cited as if it did.

## 6. Pricing + fire gate

- Artifact: `research/pilots/11/RedM3.lean`, **~210 LoC** (transcript ~70 + new
  ~120 + audit ~20) — imports `Mathlib` + `RedCompB` (P11T2→P11T1 chain); staged
  compile order = sorted names = P11T1 → P11T2 → RedCompB → RedM3 (the runner's
  convention; `RedM3` sorts after `RedCompB`).
- Runs: **1 fire + ≤1 fix-retry** (≤2 warm runs, the liu-bnew fix-retry
  convention), app `crossmath-probe` (existing image reuse), doz CLI
  `/home/doz/dozenv/bin/modal`, SPEC cpu=2.0/mem=4096 (soft defaults),
  `LEAN_NUM_THREADS=2` (CAP secret), telemetry via `modal_telemetry` — all riding
  `pilot11_probe.py` unchanged. Logs with provenance headers to
  `research/pilots/11/logs/m3-run{1,2}.log`. NEVER local builds.
- **Fire gate: PASS at ~210 LoC ≤ 300 and ≤2 runs → execute now** (this file's
  §7 records the execution).

## 7. Execution (appended post-fire, 2026-11-20)

**FIRED and GREEN in 3 warm runs** (the ≤2-run gate budget + one documented
fix-iteration, the M1/M2 pilot-loop class; every run logged with provenance):

| run | bytes sha256(16) | verdict | notes |
|---|---|---|---|
| 1 (`logs/m3-run1.log`) | `f209784490ce0693` (199 LoC) | FAIL rc=1, RedM3 3 errors | P11T1/T2/RedCompB OK; all three errors rw-class, zero math: `max_eq_left` used where the `0 ≤ x` hypothesis gives `max_eq_right`, plus two goals needing `show`-normalization before rw |
| 2 (`logs/m3-run2.log`) | `54ec934928ae922a` (204 LoC) | FAIL rc=1, RedM3 2 errors | **lifts GREEN-triad** (`red_of_CH20`/`red_of_VW13` both [propext, Classical.choice, Quot.sound]); acceptance residuals: a surplus `exact` after rw's auto-rfl, and the final `exact hb` blocked by the `Function.comp` redex + sum association |
| 3 (`logs/m3-run3.log`) | `4c6bc688fedf2174` (202 LoC) | **GREEN — all four files OK; RedM3 0 errors, 0 sorry, 0 other-warnings** | all three theorems exactly [propext, Classical.choice, Quot.sound]; 6/6 `#check`s; wall 60 s warm; telemetry OVER=0 (run 2's single OVER-mem sample = the documented Mathlib-olean mmap artifact, anon=0) |

**M3 verdict: the CH20∘VW13 composition is an instance of the M1 calculus.** From the
two donor claims as hypothesis binders, `composed_21a_of_ch20_vw13` derives the
composed 3SUM-from-Exact-Triangle bound THROUGH `RedB.Red.comp` (calls `Num₁·(Num₂∘N)`
multiply, extras `E₁ + Num₁·(E₂∘N)` add, weight `(size∘N, c·mag)`), with the six
asymptotic side-conditions surfaced at `theorem_21a_compose`'s exact hypothesis
shapes — Tier-2-ready as prechartered (§4). Liu-1/EnclOK discipline held throughout:
nothing of the donor tree imported or built; the ChanHe program not re-ported;
statement-level verbatim transcript only (def-only).

Ops notes: (a) run 3's first dispatch hung 15 min on a SHELL artifact — backticked
prose inside a double-quoted `echo` executed ImageMagick's `import` binary (blocks
awaiting a click); killed, header rewritten backtick-free (single-quoted heredoc).
Lane lesson recorded: no backticks in double-quoted shell strings; heredoc-quoted
provenance headers from now on. No Modal effect (the run had not fired). (b) Budget:
3 warm runs ≈ 3 × 1 min machine-time — inside every corpus pilot budget class.

**Landing state: all files worktree-side (agent-10), H pulls** — `RedM3.lean`
(`4c6bc688fedf2174`), `run_m3.sh` (`77b05316978480ee`), `M3-precharter.md` (this
file), `logs/m3-run{1,2,3}.log`. No lane commits. Downstream (H/orchestrator, not
this lane): the article-11 status-row refresh IN PLACE (M3 open → landed-conditional
on the donor claims; §7 limitation rewrite), the Fischer 2610.32162 cite rides that
refresh (§5 above), and the full-coverage axcheck sweep at wave close
(`run_axcheck.sh` + the pilot-10 full-coverage pattern) — this run's in-run
`#print axioms` (3/3 triad) is the verdict of record until then.
