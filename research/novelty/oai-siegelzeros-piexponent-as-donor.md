# OAI SiegelZeros + PiExponent as donor — registration of the two unregistered proved OAI trees

Lane R6 (iteration-4 fresh-bridge scan), 2026-11-16. Format follows
`research/novelty/axiommath-as-donor.md` (Cycle-2 donor-remap lane A3); this file registers
the two **proved, sorry-free, previously unregistered** openai-math Lean trees found by the
R6 re-scan (`research/novelty/iter4-fresh-bridges.md` §0.1 — the discovery record, searches,
and preprint reads live there; this file is the donor map). Donor read-only at
`/home/doz/zcode-workdir/openai-math/lean` (toolchain v4.34.1, mathlib `d13f23b7` per the
G7b audit; NOT our pin). Every file:line citation below was read this session.

## 0. Donor status (read this first — it gates every verdict)

| Tree | Status | Evidence |
|---|---|---|
| `OAI/NumberTheory/SiegelZeros/` | **PROVED in donor tree, 0 proof sorries; donor-pin axiom audit PASS (G11, 2026-11-17)** — headline + BOTH delegation roots triad-clean `[propext, Classical.choice, Quot.sound]`; **statement-binder class RELEASED** (build-dependency ban unchanged) | `feasibility/probe/logs-g/run35-g11-fix.log:188` (probe OK sorry-warnings=0), `:198–206` (3 × triad prints); registration evidence: rg `sorry` = 0, `Conclusions/Theorem.lean:11–21` |
| `OAI/NumberTheory/PiExponent/` | **PROVED in donor tree, 0 proof sorries; donor-pin axiom audit PASS (G12, 2026-11-17)** — all six audited decls (headline quartet's 3 + `main` + the interpolation interface + the analytic leaf) triad-clean; **statement-binder class RELEASED** (build-dependency ban unchanged) | `run35-g11-fix.log:232` (probe OK sorry-warnings=0), `:240–245` (6 × triad prints); registration evidence: rg `sorry` = 0, `Main.lean:9–33` |
| Both | **v4.34.1 pin — DO-NOT-CONSUME as a build dependency STANDS. Statement-binder class RELEASED 2026-11-17**: the Cycle-2 donor hygiene gate (triad-clean donor-pin `#print axioms`) is discharged by run35 — verdict review + release ruling in §"G11/G12 verdict" below (A1, R3-role successor; G2/G7b precedent: on-pin `#print axioms` is proof, registration ≠ endorsement) | `run35-g11-fix.log:271–276` (SUMMARY: build OK, both probes OK sorry-warnings=0) |

**Relation to the 7/8 frontier (do not mis-file these).** Both companion preprints are
*weaker than the already-audited 7/8 tree on the Dirichlet class*:

- `preprints/The-Quasi-Riemann-Hypothesis-October-5-2026/paper2.pdf` (OpenAI, Oct 5 2026),
  Theorem 1.1: zero-free Re s > 11/12 for every finite-order Hecke L over K = ℚ(√−3), hence
  every Dirichlet L incl. ζ. The paper's own words (p.2): "a natural intermediate step toward
  the stronger zero-free region Re s > 7/8 established in [36]" — [36] = the OAI 7/8 paper
  whose Lean tree G7b audited (2026-11-14, PASS). **No Dirichlet-class frontier change.**
  Residual value: the Hecke-over-imaginary-quadratic class (no formal artifact anywhere
  except Liu-1, statement-citation-only) and a simpler proof. Unformalized (rg `elevenTwelf`
  over the lean tree: no statement).
- `preprints/Uniform-exclusion-of-Landau-Siegel-zeros-October-1-2026/paper.pdf` (OpenAI,
  Oct 1 2026), Theorem 1: ∃ absolute c > 0 with (1−β) log q ≥ c for every real zero β ∈ (0,1)
  of every primitive nonprincipal real Dirichlet L of conductor q ≥ 3. Different *shape*
  from any fixed-B half-plane: implied by a 7/8 zero-free half-plane (c = (1/8)·log 3 would
  do), i.e. logically weaker than the audited 7/8 tree on Dirichlet — its value is the
  independent method (biquadratic interpolation determinants) and, if G11 lands, a second
  triad-clean donor for no-Siegel-zero-class binders.

## (a) SiegelZeros — the Landau–Siegel exclusion donor

Donor theorem (exact): `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap`
(`OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11–21`; full statement quoted in
ProbeG11's header): ∃ c : ℝ, 0 < c ∧ ∀ q ≥ 3 [NeZero q], ∀ χ : DirichletCharacter ℂ q,
χ.IsPrimitive → χ ≠ 1 → real-valued → ∀ β ∈ (0,1), χ.LFunction (β : ℂ) = 0 →
c ≤ (1 − β) · log q. Delegation roots (G7b convention audit targets):
`SiegelZerosAwei.W50.uniform_exclusion_of_local_isolated_bezout`
(`Intersection/BezoutBoundary.lean:13`); `WeightedTorusJets.W22.
localIsolatedBezout_of_actual_regular_selection`
(`Intersection/IsolatedBezoutFromRegularSelection.lean:346`). Tree layout: 13 subdirs
(Characters, Conclusions, Determinants, Differentials, EntireFunctions, Hilbert,
Intersection, LocalAlgebra, Selection, Structure, Model, Estimates), 0 sorries.

Paper anchor: paper.pdf Theorem 1 + §"The argument" (prime-bias → biquadratic
interpolation determinant; Lemma 3 = the reusable uniform interpolation estimate) [read
pp.1–2].

**Binder forms for consumers** (hypothesis-binder pattern; statement-port≈0 expected — the
objects `DirichletCharacter`, `χ.LFunction`, `IsPrimitive` are the DONOR's defs, so the
our-pin transcription is consumer-pilot work in the G7 Liu-1 pattern, not registration
work):

- `hLS : ∃ c : ℝ, 0 < c ∧ ∀ q (hq : 3 ≤ q), ∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive →
  χ ≠ 1 → IsReal χ → ∀ β ∈ Ioo 0 1, χ.LFunction β = 0 → c ≤ (1 - β) * log q` — discharges
  any "no Landau–Siegel zero" / effective-class-number hypothesis of the QRH-paper2 §1
  corollary family (effective h(D) ≫ √|D|/log log |D|; idoneal-number completeness;
  PNT-AP with x^{7/8+δ}-grade error via the 7/8 binder instead).
- Weakened corollary binders (e.g. `hNoLS_zero : ¬ ∃ χ β, … (1−β) log q < c₀`) for consumers
  that only need exclusion at a fixed window.

**Consumers (none yet; candidate first consumers).** (i) FB-2's PNT-AP corollary pilot
(`novelty/iter4-fresh-bridges.md` §3) — but note the 7/8 binder is the sharper route there;
SiegelZeros is the fallback if the explicit formula machinery is only ever built in the
log-free form. (ii) Any future effective class-number dossier (paper2 §1 consequences).
**Verdict line (G11, LANDED 2026-11-17): PASS — triad-clean.** Headline + both delegation
roots print exactly `[propext, Classical.choice, Quot.sound]` at the donor pin
(`run35-g11-fix.log:198–206`); statement-binder class RELEASED, build-dependency ban
unchanged (§"G11/G12 verdict").

## (b) PiExponent — the μ(π) = 2 donor

Donor theorems (exact, `OAI/NumberTheory/PiExponent/Main.lean`): `pi_eventual_lower_bound`
:9 (`PiEventualLowerBound Real.pi`), `pi_integer_eventual_lower_bound` :13,
`pi_irrationalityExponent_eq_two` :17 (`irrationalityExponent Real.pi = 2`), `main` :19
(the pair), `flint_hills_summable` :29 (`Summable fun n => 1 / ((n+1)³ * sin (n+1)²)`).
Object layer (`Statement.lean`): `GoodRationalApproximations` :10, `ApproximationExponents`
:15, `irrationalityExponent` :17 (`sSup`), `EventualLowerBound` :21, `PiEventualLowerBound`
:27. Tree layout: 7 subdirs (Ampleness, Analysis, Approximation, Cohomology, Geometry,
Jets, LocalAlgebra, Polynomials — an arithmetic-algebraization/Bost-style apparatus), 0
sorries.

**The binder interface (the reusable find).** `Approximation/InterpolationConsequence.lean`:
`piEventualLowerBound_of_globalInterpolation (hgeometry :
PiExponent.DeterminantContradiction.GlobalInterpolationStatement) : PiEventualLowerBound`
:11 — siblings `pi_irrationalityExponent_of_globalInterpolation` :18 and
`flintHills_of_globalInterpolation` :25. The hypothesis type is one Prop:
`PiExponent.DeterminantContradiction.GlobalInterpolationStatement`
(`Approximation/DeterminantContradiction.lean:94`). The π-specific content enters only via
`PiExponent.LiteralAnalytic.analyticAggregate` (`Analysis/AnalyticAggregate.lean:96`),
consumed inside the proof. **Consequence: the whole conclusion layer (eventual lower bound,
μ = 2, Flint–Hills) is dischargeable from ONE hypothesis binder** — the shape future
μ(x) = 2 attempts at other constants would target (the analytic aggregate is what must be
rebuilt per constant).

Companion trace: `reasoning_traces/irrationality-exponent-of-pi.pdf` (OpenAI summarized
CoT: Part I Flint–Hills via a claimed 62/25 bound, Part II exponent 2 via
interpolation-and-determinant [read pp.1–2]). No formal preprint located under
`preprints/` matching by title (rg over the preprint listing for "irrationality" — absent);
the Lean tree is the settled record. **This exceeds every classical record (Salikhov-type
μ(π) ≤ 7.6063…); the registration does NOT endorse the claim** — G12 audits internal
hygiene (axioms) only, which is what a statement-binder consumer needs; the mathematical
verification burden stays with the donor corpus.

**Binder forms for consumers.**
- Direct: `hμπ : OAI.PiExponent.PiEventualLowerBound` (or its `EventualLowerBound x`
  generalization at x := π) — for any Flint–Hills-type or ‖nπ‖-lower-bound consumer.
- Interface: `hGeo : OAI.PiExponent.DeterminantContradiction.GlobalInterpolationStatement`
  → everything (the minimal witness a re-derivation at another constant must produce).
- Object-layer port (FB-3, `novelty/iter4-fresh-bridges.md` §3): `irrationalityExponent` /
  `EventualLowerBound` are mathlib-absent (mathlib's only adjacency is the qualitative
  `LiouvilleWith`, `Mathlib/NumberTheory/Transcendental/Liouville/{LiouvilleWith,Measure}.
  lean`) — an S-class mathlib-only layer with OAI's defs as the model.

**Consumers (none yet; candidate first consumers).** (i) FB-3's object layer + the
`‖nπ‖` corollary (`n^{ν−1}‖nπ‖` control feeding tauceti's recorded Littlewood Prop at
`NumberTheory/DiophantineApproximation/BadlyApproximable.lean:248`). (ii) The tracker
side-note: μ(π) = 2 (if ever externally confirmed) is the strongest possible answer to the
irrationality-measure clock — date any FB-3 claim against the donor tree's git history.
**Verdict line (G12, LANDED 2026-11-17): PASS — triad-clean.** All six audited decls print
exactly `[propext, Classical.choice, Quot.sound]` at the donor pin (`run35-g11-fix.log:240–245`);
statement-binder class RELEASED, build-dependency ban unchanged; the μ(π) = 2 claim itself
remains NOT endorsed (§"G11/G12 verdict").

## G11/G12 verdict — donor-pin axiom audit: PASS, triad-clean (2026-11-17, lane A1 = R3-role successor; probes run by lane R6)

Review follows the G7b precedent (`feasibility/axiommath-donor-probes.md` §G7b) and the
R3 conventions (`qa/iter4-review/r3-verification-tables.md` §9). Canonical evidence:
`research/feasibility/probe/logs-g/run35-g11-fix.log` (the fix run; all log cites below are
that file unless named). **This is a donor-pin audit verdict, not an elaboration-only one:
per-theorem `#print axioms` output is present in the log for every audited declaration.**

**G11 — PASS.** `probe ProbeG11_OAI_SiegelZeros.lean: OK sorry-warnings=0` (:188);
`OAI build: OK; 201/9993 jobs; failed: []` (:161). Audited set = headline + both
delegation roots (G7b convention), each `[propext, Classical.choice, Quot.sound]` exactly,
0 sorryAx, no `native_decide`-class axiom:

- `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap` (:198–200)
- `OAI.SiegelZeros.SiegelZerosAwei.W50.uniform_exclusion_of_local_isolated_bezout` (:201–203)
- `OAI.SiegelZeros.WeightedTorusJets.W22.localIsolatedBezout_of_actual_regular_selection` (:204–206)

Delegation-root coverage class check: the probe's two roots are exactly this map §(a)'s
two audit targets (:45–48 above). Statement-shape check: the in-log `#check` print (:189–197)
is the elaborated form of this map's §(a) quote — `∃ c, 0 < c ∧ ∀ q [NeZero q], 3 ≤ q →
∀ χ : DirichletCharacter ℂ q, χ.IsPrimitive → χ ≠ 1 → (∀ a : ZMod q, (χ a).im = 0) →
∀ β ∈ (0,1), χ.LFunction β = 0 → c ≤ (1 - β) * Real.log q` — matching `Conclusions/Theorem.lean:11–21`
verbatim (the binder surface consumers quote).

**G12 — PASS.** `probe ProbeG12_OAI_PiExponent.lean: OK sorry-warnings=0` (:232). Audited
set = the four headline decls + the interface + the analytic leaf, all triad-only
(:240–245): `pi_eventual_lower_bound` (:240), `pi_irrationalityExponent_eq_two` (:241),
`flint_hills_summable` (:242), `main` (:243), `piEventualLowerBound_of_globalInterpolation`
(:244), `LiteralAnalytic.analyticAggregate` (:245). Coverage-class check: this is exactly
§(b)'s binder-consumption surface — the conclusion layer dischargeable from the one
`GlobalInterpolationStatement` binder plus the π-specific `analyticAggregate` input. The
`#check` prints (:234–239) match the donor statements quoted in §(b). **Scope note
(un-audited surface):** `pi_integer_eventual_lower_bound` (`Main.lean:13`) and the two
sibling interface lemmas (`InterpolationConsequence.lean:18/:25`) are named in §(b) but
were not audit targets of the staged probe; if any future consumer binds one of them
directly, append its `#print axioms` to the probe first (one-line change, same substrate
and volume — no new sizing).

**Substrate (D-PIN).** Built INSIDE the donor's own tree at the DONOR pin (v4.34.1 /
mathlib `d13f23b7`; cmd header `run33-g11.log:2`; probe headers), so all rows above are
**PROVED-UNCONDITIONAL (donor)** with the donor-pin print source, and any of OUR consumers
elaborated in that tree carry the D-PIN class (r3-verification-tables §9(ii)). Closure
1,070 files (:17); donor `lake exe cache get` rc=0, 8,908 oleans (:24–29); build completed
9,993 jobs (:149, :185). "patches: 0/12 applied" (:233, :272) means **already applied** —
run33 applied the donor's 12-dep post_update tier 12/12 (`run33-g11.log:202`) and run35
volume-resumed from that snapshot (:97–108 "already applied"; only the SiegelZeros side
recompiled, 201 jobs). Axiom verdicts are pin-independent (§9(i)).

**Attempt history (first-attempt record, per instruction).** run33 FAIL rc=1 errors=2:
the g11 wiring misspelled the build target `Conclusions.Theory` — the module is
`Conclusions.Theorem` — so lake looked for a nonexistent `Conclusions/Theory.lean`
(`run33-g11.log:131–133`, `:190–192`, `:228–233`); the PiExponent side built (9,793-job
schedule, 869 done at abort). run33's postmortem blamed a sibling-FS flake; run34 retried
on that theory (git-cat-file recovery, mirror at `/tmp/r6-g11-mirror`, 870 files —
incomplete) and **died early: the log ends at t=120 s with no verdict or SUMMARY**
(`run34-g11-retry.log:21`). run35's header supersedes both: root cause = the misspelled
target (fixed in gprobe.py + ProbeG11), mirror rebuilt from the correct seed 1,070/1,070,
volume-resume (`run35-g11-fix.log:1–2`). run33 telemetry for the record: wall=3587 s,
max_cpu=9.63, max_mem=3325 MB, OVER=29 (`run33-g11.log:238`) — the cold full-closure build
burst, failed run, superseded by run35's resume.

**Telemetry (run35, within guidelines — no escalation).** SPEC cpu=2.0 / mem=4096 MB
(:18); SUMMARY wall=1713 s, max_cpu=2.54, max_mem=1600 MB, anon=0, samples=28, OVER=12
(:276). The OVER window (:134–146) coincides with the lake build phase (:140–148) — the
known soft-limit burst class (lake sizes job parallelism from `nproc=18`; the zeta23e
precedent at max_cpu=8.98 was classified soft-burst, `r3-verification-tables.md` §10.5).
max_cpu 2.54 at spec 2.0 is a 27% burst, memory at 39% of spec. Guideline-3 investigation:
nothing wrong-sized — the run was a volume-resume compiling 201 jobs; the burst is the
build-phase scheduling class, not a runaway. **No escalation needed or requested.**

**Release ruling (orchestrator pre-authorization, conditional on this triad-clean
verdict — condition met, release executed 2026-11-17):** the **statement-binder class is
RELEASED** for both donors — consumers may bind `hLS` (§(a) forms) and `hμπ`/`hGeo` (§(b)
forms) as Prop binders per the hypothesis-binder pattern. Still in force, unchanged:
(i) **DO-NOT-CONSUME as a build dependency** (donor pin v4.34.1 ≠ our ff2494ea; Liu-1
convention) — statement-level citation/binder only; (ii) **full-tree sorry/axiom sweep
beyond the audited set only if a consumer lands** (G7b scope convention); (iii)
**registration ≠ endorsement** — G12's μ(π) = 2 exceeds every classical record
(Salikhov μ(π) ≤ 7.6063…) and is NOT endorsed by this audit: the audit shows a
triad-clean proof tree inside the donor corpus and nothing about the preprint's truth;
G11's exclusion is logically weaker on the Dirichlet class than the already-audited 7/8
tree (§0 "do not mis-file" stands).

## Gating language (applies to both)

**DO-NOT-CONSUME as a build dependency until G11/G12 land** (donor-pin `#print axioms`
triad-clean). Until then: statement-citation only, in all dossiers/pilots, in the Liu-1
convention. Full-tree sorry sweeps beyond the two subtrees are unnecessary (G7b scope:
audit the headline + delegation roots; widen only if a consumer lands). Probes:
`feasibility/probe/ProbeG11_OAI_SiegelZeros.lean`, `feasibility/probe/ProbeG12_OAI_PiExponent.lean`
— runner `feasibility/probe/run_gprobe.sh g11` (mode added 2026-11-16; volume
`crossmath-g11-tree`), approval-gated, no runs this cycle.

*2026-11-17 amendment (lane A1, verdict review):* the gate's condition HAS FIRED —
G11/G12 ran (runs 33–35, `logs-g/run35-g11-fix.log`) and landed triad-clean. Reading
this section as of 2026-11-17: the statement-citation-only restriction is LIFTED to
**statement-binder class RELEASED** (§"G11/G12 verdict"); the DO-NOT-CONSUME
**build-dependency** ban and the G7b-scope sweep rule stand unchanged.

— lane R6, 2026-11-16. Updated 2026-11-17 by lane A1 (R3-role successor): §0 table +
verdict lines + §"G11/G12 verdict" + this amendment record the donor-pin audit verdicts
(evidence `feasibility/probe/logs-g/run35-g11-fix.log`; ledger rows at
`qa/iter4-review/r3-verification-tables.md` §10.7).
