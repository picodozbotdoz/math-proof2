# ζ_K Zero Proportions with an Unconditional ζ-Column: the ZetaZerosV2 Donor Swap

*cross-math-fronttier research article 42-M4 (Cycle 2) · DRAFT 2026-11-14 · **STANDALONE
by orchestrator decision 2026-11-14 (one-article-per-discovery rule): this is the
Cycle-2 donor-swap discovery's own article; the main-run article 42
(`42-quadratic-dedekind-zeta-zero-proportions.md`) is FROZEN HISTORY — the
certificate-conditional record of the main run, cited below but not edited** · dossier
`research/candidates/42-zeta-k-two-thirds-product-assembly.md` · blueprint
`research/pilots/42-M4-blueprint.md` · pilot `research/pilots/42/{M4a,M4b}.lean`, logs
`research/pilots/42/logs/` (m4-run2, m4-axcheck-run1, m4b-run2)*

**Status: PROVED, FINAL — both routes GREEN; A3's FORMAL REPORT LANDED
(`research/pilots/42/M4-note.md`, 2026-11-14).** M4a GREEN + axcheck-clean; **M4b
fallback GREEN (1,560 LoC / 66 thms by run-header count; full-coverage axcheck
`m4b-axcheck-run1.log`: 68 theorems, every one exactly the triad, 0 sorryAx) AND the
upgrade COMPLETE on the PRIMARY route — `research/pilots/42/M4b.lean` is the FINAL
artifact, 1,571 LoC / 68 theorems (LoC corrected in-run by A3: header paragraph +1 after
the 1,570 measurement): direct ZetaZerosV2 import (`import ZetaZeros`), elaborated inside
the built V2 tree on our pin; `m4b2-run2.log` OK 0/0; full-coverage axcheck
`m4b2-axcheck-run1.log` GREEN triad-only (70 instrumented theorems + the 2 donor prints);
fallback preserved byte-exact (`logs/M4b-fallback-GREEN.lean`, runnable via `run_m4.sh`
without the V2 tree); upgrade delta net +11 LoC (1,560→1,571; ~30 added / ~26 removed —
A3's note records +10 against the pre-correction 1,570 measurement), within the
≤20-line-delta gate.** Standalone-vs-addendum DECIDED 2026-11-14: standalone (header
cross-reference above; main-run article 42 frozen).

---

## Abstract

Article 42 landed, kernel-verified, the first zero-proportion theorems for a Dedekind
zeta function (quadratic K): ≥ 2/3 of ζ_K's window zeros on the critical line, ≥ 5/6
distinct modulo the common-zero defect — but with the ζ-side input consumed from
Knausgård's certificate layer through binders (`hCert`, `hK673`/`hK839`). Cycle 2
registered AxiomMath's `ZetaZerosV2` — Lamzouri's theorem, built on our exact mathlib pin
— and its strictly stronger constants: at least 2/3 of ζ's zeros SIMPLE and on the line
(C₀ = 0.6725007… > 2/3) and at least 5/6 DISTINCT (C₁ = 0.8362504… > 5/6), unconditional.
We swap the donor: the M4a layer re-states the assembly at strip-window vocabulary
(`EpsLowerDistinctStripCum`, the `commonStripCum` defect, the `hCZStrip` negligibility
schema); the M4b layer discharges the ζ-side binders from V2's endpoints and lands the
three upgraded theorems — `zetaK_two_thirds_landed_of_V2`,
`zetaK_distinct_five_sixths_strip_landed_of_V2` (+ `_of_negligible`) — dropping the
Knausgård certificate machinery (`hCert`/`hK673`/`hK839`) entirely on the ζ side. The
χ-side inputs (zeta23 Theorem E) and the structural set are unchanged from article 42.
What was certificate-conditional on the ζ column is now unconditional-in-corpus: the
first ζ_K proportion statements with no external certificate artifact anywhere in the
dependency tree.

## 1. Introduction

Article 42's consumption discipline bought provability at the price of a certificate
binder: Knausgård's `LocalInequality`, checked by external C++/Python tooling, entered as
an opaque Prop. The price was honest but it left the ζ column of every assembly theorem
conditional on a non-Lean artifact. The Cycle-2 corpus registration changed the option
space: ZetaZerosV2 (AxiomMath) proves the Lamzouri proportions as Lean theorems on the
exact pin this repo elaborates against (`ff2494ea`, v4.36.0-rc2; full build reproduced by
probe G2: 8,262 jobs, 13/13 audited theorems axiom-triad-clean). The constants are also
better: C₀ = 0.6725007… > 2/3 simple-and-on-line, C₁ = 0.8362504… > 5/6 distinct — both
above the round constants the assembly absorbs by monotonicity. The donor swap is the
Cycle-2 thesis in miniature: a corpus result becomes a consumable, and a proved theorem
gets strictly stronger hypotheses-hygiene with zero new mathematics.

**Honesty.** No new mathematics beyond article 42's assembly (which is itself
corollarical as mathematics — its words, not ours); the deltas are (a) the strip-distinct
vocabulary layer (M4a: `distinctCountCum`, `EpsLowerDistinctStripCum`, `commonStripCum`
— new formal objects, the strip-window analogue of the cumulative layer), (b) the
pilot↔V2 count-identification glue and the numeral endpoints (2/3 ≤ C₀, 5/6 ≤ C₁), and
(c) the landing theorems with the V2 discharge list. The χ-side binders (`hEχ`/`hEχd`)
remain: no on-pin corpus has Dirichlet-L proportion content.

## 2. Setting

As article 42 §2, plus the M4a/M4b vocabulary (over the pilot-42 cumulative-window
layer (0,T]): `distinctCountCum` (`M4a.lean:821`), `EpsLowerDistinctStripCum` (:833) —
the ε-form for distinct zeros inside the parametric strip [1−θ, θ] rather than on the
line — and `commonStripCum` (shared-strip mass; the strip analogue of article 42's C_D).
Donor endpoints: `ZetaZeros.simple_proportion_lower`
(`ZetaZerosV2/ZetaZeros/Main.lean:47`, C₀ = 0.6725007…) and
`distinct_proportion_lower` (:88, C₁ = 0.8362504…).

## 3. Main results

**Theorem M4a-1 (strip-distinct assembly, defect form).** If each component (ζ column,
χ column) carries `EpsLowerDistinctStripCum` at its constant, then ζ_K's assembled
strip-distinct proportion holds at the min constant with the pairwise `commonStripCum`
defect — the n = 2 instance of the schema dossier 75 generalizes to abelian towers.

**Theorem M4a-2 (hCZStrip form).** Under the strip-common negligibility binder `hCZStrip`
(the strip analogue of article 42's hCZ; not provable today — `pilots/20-hCZ-NOTE.md`'s
verdict carries over), ≥ 5/6 of ζ_K's window zeros are distinct and in the strip.

**Theorems M4b-1–3 (the V2-discharged landings).**
`zetaK_two_thirds_landed_of_V2` (≥ 2/3 with multiplicity, ζ-side from V2),
`zetaK_distinct_five_sixths_strip_landed_of_V2` (5/6 strip-distinct modulo defect),
`…_of_negligible` (under hCZ′) — hypothesis lists: article 42's structural set + the
zeta23 χ-side binders + window finiteness; **no `hCert`, no `hK673`/`hK839`** (the
Knausgård layer is dropped from the ζ side entirely; his artifacts remain cited as
audit trail in article 42).

## 4. Proofs

M4a is article 42's counting algebra restated at strip vocabulary: multiplicities add
under products (`multOf_mul`, mathlib `analyticOrderNatAt` additivity), distinct counts
obey the inclusion–exclusion identity with `commonStripCum` in place of C_D, and the
min-of-fractions merge (`epsLowerCum_of_factorization` engine) iterates. M4b is the
discharge bookkeeping: count-identification glue between the pilot's cumulative
vocabulary and V2's window convention, the numeral lemmas (2/3 ≤ C₀, 5/6 ≤ C₁ absorbed
by `EpsLowerCum_mono`), and the endpoint wiring. Route history, recorded for the audit
trail: M4b was first built via the fallback binders `hV2d4`/`hV2d5` (G2-gated direct
import pending); the G2 evidence (build + 13/13 triad) cleared the primary route, and
the direct-import upgrade — discharging the two endpoint binders from the imported donor
theorems (`import ZetaZeros`) — is recorded as APPLIED in the file header
(`M4b.lean:40–44`), with the fallback binders retained as the documented fallback.

## 5. Formal verification

**Landed (evidence, logs with provenance headers):**

- **M4a GREEN** — `m4-run2.log`: M4a.lean OK, 0 errors / 0 sorry-warnings; the three
  M4a landing theorems' axioms = [propext, Classical.choice, Quot.sound] exactly
  (1,194 LoC / 54 theorems incl. 52 triad-checked; one benign push_neg deprecation,
  frozen heritage).
- **M4a axcheck-clean** — `m4-axcheck-run1.log`: full-coverage axiom sweep, every
  'depends on axioms' line exactly the triad (83 axiom-print occurrences; zero
  non-triad names; none sorryAx/native_decide).
- **M4b run2 GREEN (on disk, 2026-11-14, lane A3-relaunch)** — `m4b-run2.log`: M4b.lean
  OK, 0 errors / 0 sorry-warnings; 1,560 LoC / 66 theorems; all 6 landing theorems
  (3 M4a-carried + 3 `_of_V2`) triad, zero sorryAx; warnings benign (push_neg heritage,
  unused binder, if_neg deprecation). Run 1's 5 sites fixed (mul_nonpos refinements,
  calc relaxations, ℕ↔ℝ casts).

**Landed (A3's FORMAL REPORT LANDED — `research/pilots/42/M4-note.md` + corrected run
headers; figures below are the post-correction authoritative record):**

- **[VERDICT:M4b] FILLED-FINAL:** fallback GREEN — `m4b-run2.log` OK 0/0 (1,560 LoC /
  66 thms by run-header count); full-coverage axcheck `m4b-axcheck-run1.log`: **68
  theorems, every one exactly [propext, Classical.choice, Quot.sound], zero
  sorryAx/native_decide**.
- **[VERDICT:M4b-upgrade] FILLED-FINAL:** upgrade COMPLETE on the primary route —
  `m4b2-run2.log` (app `crossmath-pilot-42-m4b2`, V2+PNT+ tarball build with PNT+ path
  redirect): build OK, M4b.lean OK, 0 errors / 0 sorry-warnings; **FINAL artifact
  `pilots/42/M4b.lean` = 1,571 LoC / 68 theorems** (in-run LoC correction recorded by
  A3). Upgrade delta: **net +11 LoC, ~30 added / ~26 removed** — the V2-vocabulary block
  20→13 lines as donor abbrevs, **−3 binders (hCert/hK673/hK839 gone), +2 endpoint
  bridges (`V2d4_endpoint`/`V2d5_endpoint` := the imported donor theorems)**, 3
  call-sites rewired, +4 axiom prints; every proof except 2 touched lines unchanged.
- **M4c(i) axiom hygiene: FULLY DISCHARGED.** From the primary run itself: the three
  M4b landings + the two bridges + the donor endpoints on-pin from the consumer side
  (`ZetaZeros.simple_proportion_d4`, `ZetaZeros.distinct_proportion_d5`) = exactly the
  triad; the C₀/C₁-form donors (`simple_proportion_lower`/`distinct_proportion_lower`)
  plus 9 more donor theorems (13 total) printed triad-clean on-pin by A7's G2 run3
  (`feasibility/probe/logs-g/run3-g2.log`); full-coverage axcheck of the final artifact
  `m4b2-axcheck-run1.log` — GREEN, triad-only, 70 instrumented theorems + the 2 donor
  prints, 0 errors / 0 sorry. The "unconditional ζ-side" wording is justified.
- **Binder inventory of the landings (exact, per the note):** the 2/3 landing carries
  exactly `hEχ` + the M2a structural set + `hntopζ`/`hntopχ` (`hζ` discharged inline via
  `analyticAt_riemannZeta`); the distinct landing adds **`hEχdStrip`**; the negligible
  form adds **`hCZStrip`** (the strip-common negligibility binder — `20-hCZ-NOTE.md`'s
  analysis transfers verbatim). The ζ-side content is zero-hypothesis: the endpoint
  bridges ARE the imported donor theorems. Constants delivered at the donor's margins
  (0.6725 − 2/3 ≈ 0.0058; 0.83625 − 5/6 ≈ 0.0029, both `norm_num`); Knausgård's
  0.67354/0.83900 remain the stronger *conditional* constants — the
  unconditional-vs-stronger trade is the recorded posture.
- **Provenance chain (A1, `novelty/pntplus-glue-as-donor.md`):** the discharged ζ side
  transitively consumes the fork's unique glue — `simple_proportion_d4`/
  `distinct_proportion_d5` ← `…_proportion_lower` ← `pairCorrelationFormula`
  (`PairCorrelation/FromLandau.lean:52`) ← Landau log-derivative (`Landau/Formula.lean:
  170`) ← `RiemannZetaHadamard` (`Landau/Formula.lean:9`).
- **Runner-regex log-hygiene reconciliation (recorded in the run headers):** the
  `error(lean.*)` diagnostic format undercounted in earlier runner summaries — the
  fallback's run 1 had 5 error SITES vs SUMMARY 3, and m4b2-run1's SUMMARY read errors=0
  against 4 real `error(lean.dependsOnNoncomputable)` sites (rc=1 still flagged FAIL
  correctly); same root cause, regex widened to ": error" after m4b2-run1; run 2 counted
  under the fixed regex.

## 6. Relation to prior work

- **Article 42** (this repo, main run): the assembly being upgraded; everything proved
  there stands, with the certificate route now superseded on the ζ side.
- **ZetaZerosV2 / Lamzouri** (AxiomMath; arXiv-lineage per the repo): the donor —
  > 2/3 of ζ zeros simple-and-on-line, > 83.6% distinct; the first on-pin,
  kernel-verified source for these constants.
- **Knausgård** (arXiv:2609.33043, arXiv:2610.08965): the superseded ζ-side route; his
  constants were 0.67354/0.83900 with a `native_decide`-fronted clean layer — never
  consumed at the headlines (article 42 §5's discipline, carried forward).
- **DLRT arXiv:1908.04876** (corrected qualifiers per A5 standing note 3: GRH-conditional,
  fixed abelian/quadratic K, T→∞ asymptotic): the literature's nearest distinct-zero
  statement for ζ_K; article 42's comparison paragraph stands with those qualifiers.
- **Dossier 75** (Cycle 2): the n+1-factor generalization these theorems instantiate at
  n = 2 — the reuse demonstration for the abelian tower.

## 7. Limitations and open problems

- The χ-side (zeta23 Theorem E) is still a binder: full unconditional discharge of the
  Dirichlet column needs the v4.33 zeta23 port (statement-cost ≈ 0 corpus-wide; proofs
  are the cost).
- hCZStrip inherits hCZ's conjecture-grade status (`pilots/20-hCZ-NOTE.md`); only the
  defect-form theorems are unconditional-shaped.
- The strip window's θ is parametric in the vocabulary but instantiated at the article-42
  constants in the landing statements; the dossier-70/75 clock notes apply if a stronger
  formal zero-free input ever lands.

## References

- axiommath `ZetaZerosV2/ZetaZeros/Main.lean:47,88` (donor endpoints);
  `research/feasibility/axiommath-donor-probes.md` §G2 (build + triad audit);
  `research/pilots/42/{M4a,M4b}.lean`, logs `m4-run2`, `m4-axcheck-run1`, `m4b-run2`;
  article 42 and `research/pilots/42/{M1,M2a,M3,M2b}.lean`; zeta23 `Challenge.lean:131–229`;
  Knausgård arXiv:2609.33043, arXiv:2610.08965; DLRT arXiv:1908.04876 (with corrected
  qualifiers); dossier 75 §P; `research/pilots/42-M4-blueprint.md`.
