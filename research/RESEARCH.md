Research objective. Conduct a deep, comparative study of four corpora — mathlib (encore-mathlib/repo/mathlib4), tauceti, openai-math, and anthropics_formal-math — and identify bridge points between them: places where results, structures, or techniques from different corpora meet, partially overlap, or point at each other without connecting. From those bridges, propose candidate new theorems — statements not present in any corpus or the classical literature — that become true, natural, or provable precisely because of the combination.

Phase 1 — Deep survey (per corpus). For each project, map:

Mathematical territory covered: objects, structures, and the strongest/most distinctive results (cite exact theorem/file names).
Depth and terminal points: what is stated but not proved; proved but not generalized; isolated results with no neighboring development.
External dependencies: what each corpus assumes, imports, or cites from classical mathematics beyond its own content.
Phase 2 — Bridge mapping. Build an explicit intersection map across corpora:

Shared or analogous objects/definitions appearing under different names.
Results in one corpus that generalize, dualize, or lift results in another.
Quantitative bounds in one area that techniques from another corpus could plausibly improve.
Empty zones: questions sitting between corpora where both sides' machinery points, but nothing has been proved.
Phase 3 — Candidate generation. For each proposed discovery, produce a dossier:

Precise mathematical statement.
Novelty check — evidence it is absent from all four corpora and the known literature.
Which corpora it bridges, and why the bridge is essential (not provable from one side alone).
Proof-strategy sketch, drawing on named results from the corpora.
Feasibility note: is it within reach of formal verification given mathlib's current API?
Phase 4 — Triage. Rank candidates by novelty × significance ÷ verification effort; recommend the top 3 for a Lean pilot.

Ground rules. Discovery-first, not formalization-first: a candidate is valuable only if the statement is new. Lean is the verification vehicle, with the math-proof1 standard (no sorry, no native_decide, no external CAS). Sibling repos are read-only. Cite exact declarations, files, and paper sections for every claim.

## Cycle 2 (opened 2026-11-13, orchestrator) — the AxiomMath corpus as a fifth source

The main run (Phases 1–4 over mathlib/tauceti/openai-math/anthropics) closed 2026-11-09
(TRIAGE final; top-3 pilots 42/01 landed, 10 partial). Cycle 2 re-runs the same pipeline
over the newly registered AxiomMath siblings (`axiommath/`: DedekindZetaZeroFree,
ZetaZerosV2, ZetaZeros, PrimeNumberTheoremAnd, Weil, AreaLaw2D), which as of
2026-11-13 build on our exact pin (mathlib `ff2494ea`, v4.36.0-rc2 —
`feasibility/axiommath-bump/`) and are therefore *consumable donors*, not just references.
Scope: survey (`survey/axiommath.md`), bridges (`bridges/function-field.md`,
`bridges/area-law.md`, donor remap `novelty/axiommath-as-donor.md`), new dossiers
(70-series), novelty round 4, TRIAGE addendum, and pilots — both the open main-run items
(10-L1/L2, 52-fix, 20-M1 close-out) and new donor-swap pilots (e.g. discharging the
`hQRH` binder of pilots 20/50 from DedekindZetaZeroFree's Cureton–Thorner theorem;
ZetaZerosV2 as a second donor for 42). Same ground rules; same Phase 1–4 definitions;
file-ownership and lane conventions carry over from the main run (see STATUS.md).

**Close-out record (2026-11-14):** the hQRH discharge promised above landed via route R1
(openai in-corpus 7/8 donor, G7b PASS — run32) rather than DZDF's Cureton–Thorner: G1b
priced the DZDF direct build out on our pin (statement-level only), and R1 is the
stronger theorem — pilot 50's ζ strip landed unconditionally at [1/8, 7/8]
(`pilots/50/R1.lean`); pilot 20 recorded an object-layer donor note only (hCZ not
dischargeable — `novelty/axiommath-as-donor.md` §b). Delivered-differently, recorded:
`feasibility/axiommath-donor-probes.md` §G1/§G7b, REPORT §C2.2.

## Iteration 4 (opened 2026-11-16, orchestrator) — raising the discovery bar: complete the genuine core, bill engineering as engineering

Cycle 2 closed 2026-11-14 technically complete — eleven pilots GREEN, final sweep 44/44
stages OK with 0 `sorryAx`, TRIAGE §decision typeset, REPORT §C2 filled, AGENTS-C2-DRAFT
applied (`STATUS.md:718–754`) — **but its articles drew unsatisfactory external
feedback, and the nine-lane review (2026-11-16, `qa/iter4-review/`) confirmed the
diagnosis: R2's cold count finds ≈ 4–5 genuine discoveries in the 18-article corpus
(01, 30, 32, 75's conditional statement class), with the Cycle-2 "discovery headline" a
donor-swap whose own article says "There is no new analytic mathematics"; r1 finds the
set "individually near-competent and citation-excellent, and collectively unacceptable
as a research-article corpus" (engineering records in article clothing, house-dialect
status lines, seam contradictions). R3's trace audit held: 19/19 articles VERIFIED, no
mathematical overclaim — the verification chain is sound, and the verdict is about
discovery strength and packaging, not proof integrity. R4 confirms both cycles
delivered their charters (one delivered-differently, recorded) and upgrades the
close-out protocol (adopted below). R7's external prior-art audit
(`novelty/iter4-external-priorart.md`) found **zero retracts — every Cycle-2 headline
stands**: 75/71/73/11 NOVEL, 42 formally NOVEL against Lamzouri/Knausgård, 50-M2/72
KNOWN-core exactly as already billed.** Iteration 4 therefore re-charters with a raised discovery bar and a
corrected billing discipline over the five corpora (mathlib, tauceti, openai-math,
anthropics, axiommath) plus the Cycle-2-surfaced donors and gaps; the seed inventory is
pre-assembled (`feasibility/ITERATION4-SCAN.md`, `ITERATION4-SEED-DOSSIERS.md`, A5's
`novelty/iter4-seed-triage.md`, `novelty/physlib-surface.md`, R6's
`novelty/iter4-fresh-bridges.md`) and the backlog consolidated
(`qa/iter4-review/r5-iteration4-backlog.md` §§1–16, with execution specs; slot ledger
`qa/REPORT-INPUTS-ITER4.md`).

**Quality gate (adopted; normative here, operational in `articles/TEMPLATE-iter4.md`).**
An article ships only through the template — kind declaration (DISCOVERY /
DISCOVERY-CONDITIONAL / NEGATIVE / FORMALIZATION-FIRST), per-theorem status rows in the
closed four-string vocabulary (PROVED-UNCONDITIONAL / PROVED-CONDITIONAL / CERTIFIED-
NUMERIC / PAPER-ONLY), a novelty table with ≥ 2 nearest-miss rows, per-theorem
verification blocks per R3 §5 (sha256-at-sweep, extractor-generated counts, binder
inventories), no infrastructure narration, and the full template §9 shipping checklist.
A candidate is article-eligible only if it passes R2's four-point strength bar S1–S4
(statement-level novelty with named nearest-miss; essential multi-corpus bridge;
non-trivial proof content or a surprising statement; discharge discipline —
corollary-level lemmas never pass S1). Donor swaps, binder discharges, open-headline
tranches, certified numerics and formalization-first layers are first-class ENGINEERING
deliverables — technical records, dossier notes, ledger rows — never discoveries; an
upgraded theorem is revised to v2 in one versioned article, never split. Two-strike
rule, FINAL: at most **one** knowledge-level / formalization-first / donor-discharge
article per cycle (reserved for the exceptional forced-correction class), and ≥ half of
shipped articles each cycle must be discovery-grade.

Phase mapping: Phases 1–2 pre-done, Phase 3 pre-done at pre-dossier level — the run
starts at dossier hardening and Phase-4 triage. **Launch order:** (1) **75 P-b, the 5/6
strip-distinct arm — day-1, the iteration's top-billed discovery milestone**: completion
of the one Cycle-2 statement class that survived audit (n-fold abelian-assembly ζ_L
proportions; Pb-1/Pb-2/Pb-3 over the GREEN Pa.lean carry; conditional-titled per S4(b);
DLRT / Bansal–Maji / article-42 nearest misses; spec `qa/iter4-review/
r5-iteration4-backlog.md` §8). (2) The **LP-duality layer + 02-core consumer, same
week, chartered as the named ENGINEERING deliverable** (never an article;
Lean-ecosystem-scoped claim only — the Isabelle AFP trio `LP_Duality`/
`Linear_Programming`/`Farkas` and Coq 1706.10269 own the theorem class and are
mandatory nearest-miss citations alongside Yamashita and the mathlib
`Analysis/Convex/Cone/Basic.lean:33–37` TODO; `lp_weak_duality` + `bw2_ceiling_of_dual`
per R5 §9). (3) **AL-3D, B.2 staged** — `SlabAreaLawColumnCuts3D` under the honest
`PlanarAreaLawVar` binder (never an AreaLaw3D-adjacent headline; every claim names its
C.1–C.4 fence; the B.2/B.3 branch sits at the post-AL-P1 GO/NO-GO, AL-P0/P1 serve both
rungs; B.3 is the designated iteration-5 rung at the 6.3k-LoC transcription pricing;
spec R5 §11). (4) **ZZV2 λ-family route (a)** — engineering/technical-record deliverable
(Lamzouri owns the informal math and is must-cited in full; hard STOP after P1 GREEN if
the Landau layer is MT-frozen; spec R5 §12). (5) **72-M1 L3 + the interface theorem**.
**Companion, day-2/3 (R5 §14 run 8): the hEχ discharge at the zeta23 donor pin** —
build zeta23's small v4.33 tree once (`crossmath-pilot-zeta23E`, own image lineage,
hour-class at SPEC), transitive `#print axioms` of the Theorem-E chain, statements port
back as discharged 2/3 binders; **COMPANION billing to 75-Pb — two binder tiers of the
ONE 75 statement-class article** (the 2/3 tier unconditional at ℚ = the cycle's
strongest S4(a) move; the 5/6 distinct tier conditional; the quadratic-ζ_K 2/3
zero-analytic-binders corollary as the third tier; R5 §14.1). Behind them: 73-Q4 `hRat`
(GO input per R5 §13; dossier-upgrade note on GREEN, `hPur` stays a binder), 74's
T1+T2+T4 discovery-dense core (T3 rides the LP layer), the 10 assembly tranche D1–D4
(week 2; declared plumbing — completion value, never discovery billing), FF-EZ4 +
22-T2a (binder-shaped, statement-first; G9 preflight — the ψ-object is mathlib-native
on our pin; PNT+ registration T1/T2 NOT fired), 75-N2, and the bench (41, 12, FF-EZ2
behind its battery, physlib occupation-pair probe). Carried at binder tier only: 50-M2
R2/R3 (R1 landed GREEN in Cycle 2; article 50-M2 final). **Donor-route verdicts (R8):**
DZDF direct build dead-as-specced (binder tier only); Physlib/G5a direct route dropped
(G10 shelved, fire-gated on a chartered consumer); upstream PNT+ DEFERRED (T1/T2/T3
unfired; v4.35.0); Weil at the statement tier (Stacks dead; the G3/pilot-71 path IS the
consumption route). QuasiRiemannTracker is a CLOCK, not a donor. **Watch (R6's
`novelty/iter4-fresh-bridges.md`):** five FB seeds — FB-1 zero-temperature entropic
duality + the tropical substitution-rule question; FB-2 effective corollaries of the
7/8 / Landau–Siegel donors; FB-3 an irrationality-exponent object layer; FB-4 the
function-field PNT (tauceti Wiener–Ikehara × Weil rationality); FB-5 the Laughlin/Fock
inequality on tauceti's graded CAR — grades provisional, R2 re-grading under the bar;
no FB charter before its dossier-level battery. Two unregistered PROVED openai-math
donors recorded: `OAI.SiegelZeros.exists_absolute_real_zero_gap` (uniform Landau–Siegel
exclusion; preprint *Uniform exclusion of Landau–Siegel zeros*, 2026-10-01, Thm 1) and
the `OAI.PiExponent` tree (μ(π) = 2 + Flint–Hills; trace
`reasoning_traces/irrationality-exponent-of-pi.pdf`; the adjacent QRH paper2 Thm 1.1 =
11/12 is unformalized and dominated in-corpus by the G7b-audited 7/8 tree) —
**DO-NOT-CONSUME until the G11/G12 statement-binder probes register them** (Liu-1
convention: binder-only, on-pin triad check first).** Named cheap iteration-4 item (R7
§3.1.1): the statement-level port of Liu's B_new (arXiv:2610.12234, formalized
externally) as the 50-M2-class strip upgrade — caveat verbatim: Liu-1 stays
DO-NOT-CONSUME as a build dependency; statement-level citation/port only
(`novelty/liu1-as-donor.md` §5).** QR-D race-clock citations add four consumers
(Bhargava–Vemulapalli arXiv:2611.09031; Baldwin–Sivek arXiv:2611.06705;
Cao–Gao–Huang–Nie arXiv:2610.37179; Frei–Sofos–Widmer arXiv:2610.18491). **FB-2/PNT+ T2
ignition rule (pre-registered; NOT fired this cycle):** IF an FB-2 PNT-AP pilot
charters (the G7b-audited 7/8 tree as zero-free binder, error x^{7/8+δ}, landing on
mathlib's `NumberTheory/LSeries/PrimesInAP.lean`), THEN T2 FIRES and the PNT+ watchlist
upgrades DEFER → REGISTER-AND-PORT (upstream statement as binder; G9 preflight staged).
R6's deciding rg resolved the effort class: **FB-2 = L-grade explicit-formula build**
(zero PNT-AP statements in the OAI tree; the DirichletL endgame stops at the two
zero-free theorems) — FB-2 stays **iteration-5 unless chartered as an explicit L**;
T2 does not fire this cycle and the PNT+ entry stays DEFER (T3 also unfired: upstream
still v4.35.0, fetched 2026-11-16; a future FB-2 build IMPORTS StrongPNT-grade
ψ-machinery at the donor pin — OAI's lake-manifest already declares
PrimeNumberTheoremAnd/StrongPNT + TauCeti as deps — rather than porting it). Paper2's
unformalized corollary set (PNT-AP, effective class number, idoneal completeness) is
such a pilot's CITATION menu — cited, never re-proved. FB-5's grade is
honesty-corrected B → B− in-file; the hardened FB dossiers are on disk
(`candidates/76-zero-temperature-schrodinger-duality.md` = FB-1;
`candidates/77-car-occupation-dictionary-laughlin.md` = FB-5, re-scoped at hardening).
Week-1 drain review: the completion-path elevation decisions (01-stability,
32-crossing when R2's specs land; 30-Theorem A behind them; hEχ already folded).

Lane topology: nine lanes + H, queue-loaded re-tasks, one writer per file, H-commit
cadence + concurrency probe (assignments: `qa/iter4-review/r9-iteration-plan-draft.md`
§9). Ground rules carried verbatim: discovery-first, kernel-only (no sorry, no
native_decide, no external CAS), siblings read-only, exact citations for every claim;
donor statements enter only as hypothesis binders, verbatim marked probe copies, or
already-built on-pin libraries; logs persisted with provenance headers; Modal usage per
the mandatory guidelines (2 CPU / 4 GB default, telemetry every run, overrun ⇒
investigation; new apps clone the 73/75 runner pattern with textually identical
`run_commands` for layer-cache sharing; the v4.33 hEχ app keeps its own image lineage).
Substrate: `feasibility/ITERATION4-SCAN.md` §3 + R8 §5 (runner kit, cost classes at
SPEC, artifact-cache retry ≤ 4 then seed-and-build; first-48h run queue R5 §14).

**Close-out protocol (adopted from the Cycle-2 close audit,
`qa/iter4-review/r4-process-completeness.md` §6).** (1) **Scoped final gates** — every
close gate grep is scoped to the live section of its target file
(`! sed -n '/^## <live-section>/,$p' <file> | grep -q '<retired-string>'`), never the
whole file; a gate that cannot pass invites silent overrides. (2) **Gate-run
persistence** — the final run of every gate executes on the exact tree being closed and
its results table (gate / command / result / date / commit) is committed with the close
block; failures are fixed-and-rerun or recorded `OVERRIDDEN — reason — owner`;
"passed by inspection" is not a state. (3) **INDEX refresh is a close gate** — close is
not declared until INDEX.md reconciles both directions against disk (every new row dated
and source-cited; stale-status rows rewritten in the same pass). (4) **Date discipline**
— dates in typeset records come from the decision-log row or the commit, never memory;
before the close commit the tree greps clean of future and split-mind dates.
(5) **Staging-file supersession** — when a staged block is spliced or decided, the
staging file gets its superseded/selected stamp in the same commit.
