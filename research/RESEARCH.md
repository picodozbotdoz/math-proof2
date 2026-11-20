Research objective. Conduct a deep, comparative study of four corpora — mathlib (encore-mathlib/repo/mathlib4), tauceti, openai-math, and anthropics_formal-math — and identify bridge points between them: places where results, structures, or techniques from different corpora meet, partially overlap, or point at each other without connecting. From those bridges, propose candidate new theorems — statements not present in any corpus or the classical literature — that become true, natural, or provable precisely because of the combination.
Once discoveries are complete, write a complete, separate research article for each discovery (theorems, proofs, context), one per file. Do not combine discoveries.

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

**Close-out record (2026-11-19; dated correction at K: the close act was
interrupted post-Step-8 on 2026-11-18 and completed at K on 2026-11-19 per the W1
pre-landing ruling).** Iteration 4 closed 2026-11-19 (orchestrator).
Final state: the wave's pilot slots resolved as recorded in
`qa/iter4-review/r3-verification-tables.md` §10 (landings §10.1–§10.32 at close:
tables N = 32 — 26 GREEN-triad / 3 honest-partial / 3 NOT-GREEN-honest [D7 RULING
2026-11-18: the §10 pilot vocabulary, machine-computed by
`qa/iter4-review/tally_section10.py`, reconciled exactly with A1's basis; the
ARTICLE vocabulary stays in A9's roll-up / REPORT §I4], every landed row
triad-only `[propext, Classical.choice, Quot.sound]`, 0 sorryAx, per the table's
own log:line citations; coverage classes C1/C2 per audit F2; whole-tree roll-up
385/386 triad-clean decls — 226/226 machine over 9 sections + the manual folds
per the §10.CENSUS companion — the one residual = 77-T2's filter-blind-spot
tainted decl, → Iteration 5 — plus 18/18 donor rows triad at their donor pins).
Still in flight at close, carried with owners: 72-M1 L3b–d + the interface
theorem (L3-spec §8 carrier); 22-T2a conditional remainder (T1/T2/T3 unfired;
PNT+ watch stays DEFER); 74-T3 (OPEN-GATED); 10-tranche D4–D6 (D4 ruled
Iteration 5); N2 P2-a paused-at-close (2/6 runs, all name-resolution residuals,
fixes-on-disk unfired — the resume note is Iteration 5's lead-1 payload) + P3
(V2 ζ-column landing, GO); AL-P2 P2-d find-#5 park + P2-e (canonical z-rank
rebuild re-charter); 77 T1's 7 site-local residuals + T2's one tainted decl;
G10 SHELF; 11-M3 benched; debts f/h/l. The knowledge-level article quota (cap-N =
1 FINAL) is UNSPENT — the wave's record outputs are dossier/pilot records and
verification tables, not N-class articles. Discovery ledger: 75 landed two-tier
(P-b entry + 5/6 strip-distinct arm FINAL-GREEN, two-tier conditionality in the
title/abstract per S4(b); N2/N3 remainder: P1 COMPLETE — M1+M2+M3 GREEN-triad at
run 19, 14/14, `hasQDirichletDictionary` = N2-a discharged; P2-a PAUSED-at-close;
P3 unstarted-GO; N3 untouched — carried to Iteration 5 as lead-1) and 78 NEGATIVE
(a discovery-grade negative result: §10.13 + `pilots/78/P0.lean` (sha256(16)
`d94d115e3d8d08d7`) + `pilots/78/logs/p0-run4.log` +
`articles/78-truffet-substitution-refutation.md` + README row 78). The N2-d
endpoint state at close: the ℚ dictionary's mathematical heart is
kernel-verified end-to-end (M1 span/character lemmas + M2
`heckeTsum_eq_ratCharOf_LFunction` + M3
`hasQDirichletDictionary`/`dirichletFactorizationTransfer`); the endpoint's
remainder = the P2 analytic window (paused, fixes-on-disk) + the P3 V2 ζ-column
landing — carried to Iteration 5 (A5's resume note w/ line numbers);
article-75's N2 anchor stays the :551 box-11 row, consistent with README
row-75's N2 tail. Retargeted to Iteration 5 (the corrected-census RETARGET
items: seed-1's AL-3D novelty residuals + the phase-3 battery remainder —
carrier L6/`novelty/round-5*`; the mathlib LP/PNT PR clock — carrier the L6
standing clock; the 10-tranche D1–D6 proposal — carrier the tranche charter
decision; the 72-M1 L3-spec §8 header — rides the L3b–d carry). The staging set
is superseded by the typeset charter (stamps on
`ITERATION4-SCAN/-SEED-DOSSIERS/-CHARTER-DRAFT`); the token census closed 40/46
in-cycle, 6 retargeted, 0 unrulled (corrected census 2026-11-18 per
`a2-close-act-runbook.md` §8).

## Iteration 5 (opened 2026-11-19, orchestrator) — same raised bar, pre-consolidated seeds, staged day-1 fires

Iteration 4 closed 2026-11-18 with the verification chain complete (§10.1–§10.32 at
close; whole-tree 385/386 triad-clean + 18/18 donor rows at their pins), the
knowledge-level quota N=1 UNSPENT (78 = NEGATIVE-kind, discovery-grade, no
consumption), every chartered slot landed or honestly recorded, and two hard-stop
rulings minting iteration-5 payloads: the **Landau η-port** (ZZV2-λ P2,
`pilots/zzv2-lam/P1-record.md` §HARD-STOP :75–90) and **10-D4's M-arc assembly w/ hv**
(`pilots/10/D3-record.md:31–37`). Iteration 5 re-charters under the SAME raised
discovery bar (R2 S1–S4 + the iteration-4 template; two-strike cap N = 1 per cycle;
≥ half of shipped articles discovery-grade) over the same five corpora (mathlib,
tauceti, openai-math, anthropics, axiommath) plus the Cycle-2/Iteration-4 donor
registrations. The seed inventory is PRE-CONSOLIDATED at open — A6's charter
consolidation (`qa/iter4-review/a6-iter5-charter-draft.md`, §8 final-outcome refresh
authoritative) over its three payload pre-charters
(`qa/iter4-review/a6-iter5-charter-candidate.md` — ranked leads, bench audit, and
the §5a NS-1 sweep: NS-1 KILLED, verdict COVERED;
`qa/iter4-review/a6-41-p0-precharter.md` = Lead 2's payload;
`pilots/zzv2-lam/eta-port-precharter.md` = Lead 3's payload) — no
new scan is needed at open; the bench is coherence-audited (candidate §4): **41
CHARTER — the iteration-5 opener** (`INDEX.md:290`), **12 DEFER behind 41** (P0-first
mandatory); FF-EZ2 and the physlib probe left the bench by execution. Discovery
posture: every launch slot below has a named NEW-statement target or a pre-ruled
opener; formalization-first work competes only for the single knowledge-level quota
slot and never displaces a discovery lead.

**Orchestrator rulings at open (2026-11-19; binding this iteration).** **DECISION-1:**
the N=1 quota opens UNSPENT by default — spend-only-if-executed; the contest is FB-2
vs FB-4 vs unspent; discovery leads are never displaced by the knowledge-level slot.
**DECISION-3 (confirmed):** the cap is per-cycle — a fresh N=1 in Iteration 5
(iteration-4's unspent status is the health indicator, not a carry-over); FB-2 and
FB-4 compete for the SAME single slot (the η-port Option-C corollary is out per
DECISION-2 = A). **DECISION-4:** pilot-41's (H) phase stays WAVE-TAIL CONDITIONAL —
no own slot or milestone budget at open; promotion to its own budget only by
mid-wave orchestrator ruling after core S–M GREEN + the (H) preflight pass.
**DECISION-6:** bench conversions DENIED at open — 12-P0 and 11-M3 stay under the
drain-activation rule (activate only when a pilot lane drains); 12-P0 may convert
mid-wave on idle-lane + dry-queue. (DECISION-2 = Option A, record-billed quota-free,
and DECISION-5 = resolved-by-battery for the η-port scope were ruled 2026-11-18 and
are folded into Lead 3 and the battery record; Option B unsupported, Option C closed.)

**Quality gate (carried verbatim from §Iteration 4 — normative here, operational in
`articles/TEMPLATE-iter4.md`).** An article ships only through the template — kind
declaration (DISCOVERY / DISCOVERY-CONDITIONAL / NEGATIVE / FORMALIZATION-FIRST),
per-theorem status rows in the closed four-string vocabulary, a novelty table with
≥ 2 nearest-miss rows, per-theorem verification blocks per R3 §5, no infrastructure
narration, the full §9 checklist. A candidate is article-eligible only if it passes
R2's S1–S4. Donor swaps, binder discharges, certified numerics and
formalization-first layers are first-class ENGINEERING deliverables — never
discoveries; an upgraded theorem is revised to v2 in one versioned article.
Two-strike rule FINAL: at most **one** knowledge-level / formalization-first /
donor-discharge article per cycle, and ≥ half of shipped articles discovery-grade.

**Launch order (day-1 items STAGED on main, unfired):**

(1) **75-N2 completion — resume first** (the strongest discovery-grade lead;
S4(a)-class). P1 is COMPLETE — M1+M2+M3 GREEN-triad at run 19 (14/14;
`heckeTsum_eq_ratCharOf_LFunction`, `hasQDirichletDictionary` = N2-a discharged;
§10.29 roll-up 278/278 triad-clean, zero residuals). **P2 is paused at the close
hard-stop: fire run 22 as the first action** on the parked post-fix sha `ecd44c6a…`
(three certain fixes on disk, unfired; 2 runs remain of the ≤6 budget; resume note
`pilots/75/N2-P1-record.md:139–150`; run-21 residuals are two named classes beyond
the applied fixes). P2-b (strip immunity) / P2-c (port) not started, API facts pinned
(`DirichletCharacter.LSeries_changeLevel` EulerProduct/DirichletLSeries.lean:173;
`changeLevel_injective` Basic.lean:79; `LSeries_ne_zero_of_one_lt_re`
Dirichlet.lean:233). P3 (V2 ζ-column + the composed `zetaL_rat_two_thirds_landed`
landing) is GO, blocked ONLY on P2-c (`factorization_identity_extension` supplies the
exact `hAbFacQ` bridge; M4b import pattern settled). Then N3 axcheck (S) and the
unconditional-at-ℚ endpoint `zetaL_two_thirds_landed_ℚ` — N2-d unproven at close is
this lead's own remainder. The 50-M2-R2 binder fold resolves here ((d1) staging
shared). Citations: `pilots/75/N2-P1-record.md`, dossier
`candidates/75-N2-rayclass-dirichlet-consumer.md`, pre-shipping sweep 3×NOVEL
(`3e5aaef`). Substrate warm (`crossmath-pilot-75`). Gate: none hard.

(2) **Pilot 41, q-deformed-eight-square — the pre-ruled OPENER, day-1.** Payload:
`qa/iter4-review/a6-41-p0-precharter.md` → the staged `pilots/41/P0.lean` (190 LoC,
self-consistency passed, firing instruction in-file; commit `f5cfe5e`): verbatim eth
port (`EightSquareStatement.lean:37–53` + `SecCrossing_Identity.lean:126–136`);
`sigmaQ`/`Gq` in `Polynomial ℤ` + `aeval` — the no-Laurent pin; Prop-valued
zero-sorry statements (M)/(B)/(P1)/(P2)/(N)/(N′); (H) at binder tier only (the
EnclOK `HostTransport` binder). P0 = 1–2 warm runs (`crossmath-probe`, doz CLI,
SPEC 2cpu/4GB, LEAN_NUM_THREADS=2); gates G-P0(a)–(c) as specced; then core S–M
≈ 0.5–1k LoC, 3–5 runs. **(H) is wave-tail conditional per DECISION-4** (+1–3k LoC,
own gate and budget only if promoted mid-wave). Descope ladder pre-negotiated ((N′)
degenerate branch; (H) no-match ⇒ Cayley–Dickson anchor; decide-too-slow ⇒
enumeration; aeval friction ⇒ map form). Headline discipline locked by round-3:
"first sign-rule/parallelogram-defect deformation", never "first q-deformation"
(Benkart–Pérez-Izquierdo 1998 owns the q-composition object level; nearest-miss
citations per the dossier's five). The dossier-41 G_q display errata are stamped and
the pre-charter carries the corrected `Gq` — the pilot consumes the corrected form.

(3) **The Landau η-port (ZZV2-λ P2) — record-billed per DECISION-2 = A** (pure
technical record, quota-free; the ZZV2-λ technical-record continuation). Payload:
`pilots/zzv2-lam/eta-port-precharter.md` (κ=1 amendment folded) + the staged
`pilots/zzv2-lam/eta-pin-probe.lean` (320 LoC at `e3d984b`; staged `c7a3089`,
firing-paragraph precision + runner-compat 4/4 PASS `c359f48`; unfired). Target:
`exists_KSAsymptotic_of_pos` (∃ c, `KSAsymptotic lam c ∧ |c − scaledConstLam lam| < ε`
for all λ > 0) via the scaling-covariance ladder (`dilateTo`/`extremalLam`/
`cutoffTestLam`/`correctedTestLam` — the corrected test keeps the donor's
`1/(4 log²T)` coefficient VERBATIM: the κ=1 pairWeight cancellation
`4/(4−(ρ−ρ′)²)` is family-independent). **Cost note, verbatim per A3 §2.2: the donor
bridge chain is ENTIRELY private (14 lemmas, `Zeta/Kernel.lean:237–599`) ⇒ local
re-proof, no transport-by-invocation shortcut** (the P1 private-copy precedent writ
large; sibling-read-only forecloses donor patching). Budget: **6–10 runs (the κ=1
amendment shifts the plausible band to 5–8; honest ceiling 12), 0.8–1.5k LoC, class
L** (1 pin-probe + 4–8 proof-loop + 1 regression/assembly; ≈1–1.9 h total at SPEC;
staged-image option per A3 §4 Phase 2 — a fresh `crossmath-pilot-zzv2-eta`-class app,
G7b layer pattern — if the loop grows past ~4 runs). **Donor hygiene at the pin
probe:** consumer-side `#print axioms` triad prints for the newly consumed public
names — minimally `PairCorrelation.tendsto` + the `pairCorrelationSum`/`pairWeight`
surface. Regression discipline: λ = 1/2 recovers the frozen constants bit-for-bit,
proved FIRST as the mid-ladder checkpoint. Billing guards binding: the informal
λ-dependence is Lamzouri's (must-cite in full: Lamzouri arXiv:2609.02882 + Montgomery
ICF 1974 + Baluyot–Goldston–Suriajaya–Turnage-Butterbaugh 2024); never phrased as
new mathematics — the η-port round-5 battery graded every component
PARTIALLY-COVERED/COVERED informally (component (ii) COVERED post-amendment; the
battery also closes the G7-retarget ZZV2 residual).

(4) **Same-week engineering rungs (never discovery-billed):** 10-D4 M-arc assembly
w/ hv — all inputs GREEN (`D3-record.md:31–37`); supply the value-poly binder
`hv : ∃ k, ∀ x, e x ≤ (|x|+2)^k` or derive it Solver-side (the adjudicated
two-true-forms amendment, `D1-record.md:42–45`); ~120 LoC, 1–3 warm runs; closes the
dossier-10 machine layer. 72-M1 L3b–d + the interface theorem (spec
`pilots/72-M1/L3-spec.md` §8; `REPORT.md` §I4.2 post-wave row). The Liu B_new
statement-level port (the never-fired named-cheap item; the informal frontier B♭
0.8748866 / B_new 0.8749570 now beats the in-corpus 7/8 donor): statement-binder
port, Liu-1 convention — statement-level citation ONLY, DO-NOT-CONSUME as build dep
(`novelty/liu1-as-donor.md` §5); warm, 1–2 runs, <250 LoC binder artifact.

(5) **Debt rungs (each carries its own landed precharter):** the AL-3D find-#5
canonical z-rank rebuild (`pilots/al3d/rebuild-precharter.md`; M0–M3 ladder, 12–18
runs ≈ 3–4 lane-sessions; fences carried: no AreaLaw3D content, `PlanarAreaLawVar`
binder not discharged, full `SlabAreaLaw3D` hard-stopped). 74-P2
(`pilots/74/P2-precharter.md`; the two-atom hVarLB insufficiency find + FIND-#1's
family recycled constructively; ≤5+≤5; 74-P1 completion is GREEN at 7/7 triad). The
77 follow-up = T1-completion + T2 as ONE pilot (residual census = the work list;
T1 NOT-GREEN honest at 31→7 residuals, zero math failures; T2 delivered 7/8
triad-clean with one tainted decl — the filter-blind-spot residual, the whole-tree
census's 1 of 386 — in scope, the runner filter fix already landed `43d55bb`);
**re-run T1's differentiation against physlib's new `WickAlgebra` layer** (the
2026-11-17/18 novelty event: the equal-statistics half of CAR now exists on physlib,
T1's CAR-transport sub-content drops to formalization-parity, condition (i)'s C+ cap
is more binding; FB-5/77's four charter conditions at
`candidates/77-car-occupation-dictionary-laughlin.md:331–341` carry; the physlib
clock rides the pilot at start AND end). The N2P0-sweep staging note (the
hyphen-workaround closure: stage the Pa → N2P0 → N2-P1 chain in the runner's ORDER
pattern or extend the rewrite map).

(6) **Wave-tail / lane-drain queue (charter names them, no slot by default):** 12-P0
(the DEFERred bench #2; P0-first MANDATORY, the termPrime/monotonicity check rides
the P0, `pilots/12/preflight.md:94–106`; **conversion DENIED at open per DECISION-6**
— mid-wave on idle-lane + dry-queue only); 11-M3 (CH20∘VW13; drain rule per
DECISION-6; carries the Fischer arXiv:2610.32162 cite-consumable); FB-1/76-T1a
(dual-value convergence rung; T2's 78-gate is clear); AL-3D B.3 (the designated
iteration-5 rung at the 6.3k-LoC transcription pricing, held behind the rebuild
outcome + the challenge-repo clock).

**Quota + watchlist (as ruled).** The N=1 knowledge-level slot opens UNSPENT
(DECISION-1/3): the contestants are **FB-2** (PNT-AP explicit-L: L-grade
explicit-formula build per R6's deciding rg — zero PNT-AP statements in the OAI tree;
donors registered, G7b 7/8 tree as the zero-free binder with G11 SiegelZeros `hLS`
as fallback; PNT-AP at x^{7/8+δ} = QRH-paper2 Cor 1.2 verbatim,
FORMALIZATION-OF-RECENT, never a discovery headline), **FB-4** (FF-PNT: M-effort
formalization-first technical record, "must not consume a discovery slot" per R2),
and **unspent**; default spend-only-if-executed (iteration-4 precedent: unspent again
is a healthy outcome). **T2 ignition rule carried verbatim from §Iteration 4:** IF an
FB-2 PNT-AP pilot charters (the G7b-audited 7/8 tree as zero-free binder, error
x^{7/8+δ}, landing on mathlib's `NumberTheory/LSeries/PrimesInAP.lean`), THEN T2
FIRES and the PNT+ watchlist upgrades DEFER → REGISTER-AND-PORT (upstream StrongPNT
imported at the donor pin; G9 preflight staged). Not fired at open; **PNT+ stays
DEFER** (T1/T2/T3 unfired; upstream v4.35.0 as of the last fetch). FB-3 stays a
watch note; the battery-hardened FB dossiers on disk are 76 (FB-1) and 77 (FB-5,
re-scoped).

**Template gates.** Every article ships through `articles/TEMPLATE-iter4.md`
unchanged — kind declaration; per-theorem status rows in the closed four-string
vocabulary; novelty table ≥ 2 nearest-miss rows; per-theorem verification blocks per
R3 §5; no infrastructure narration; the §9 shipping checklist. P0-GREEN is an
elaboration verdict, never a proof claim (probe conventions); statement-probe
`sorry` only in probe-convention files with headers.

**Day-1 fire table (all staged on main, unfired):**

| opener | state | payload |
|---|---|---|
| **41-P0** | staged, candidate-unfired (`f5cfe5e`) | `pilots/41/P0.lean` (190 LoC, self-consistency passed; firing instruction in-file; warm `crossmath-probe`, doz CLI, 1–2 runs) |
| **η-pin-probe** | staged, record-billed per DECISION-2 = A (`c7a3089`; firing-paragraph precision + runner-compat 4/4 PASS `c359f48`) | `pilots/zzv2-lam/eta-pin-probe.lean` (320 LoC at `e3d984b`, unfired; κ=1 correction folded in the precharter) |
| **N2-P2 run 22** | first action; parked sha `ecd44c6a…`, 2 runs remain of ≤6 | the resume note at `pilots/75/N2-P1-record.md:139–150` (three certain fixes on disk; two residual classes named) |

All fires at SPEC 2 CPU / 4 GB + telemetry + `LEAN_NUM_THREADS=2` per the mandatory
Modal guidelines.

**Inherited dispositions from the close (TRIAGE next-cycle annotations).** The
corrected token census closed 40/46 in-cycle, **6 retargeted to Iteration 5**, 0
unrulled: the five RETARGET-ITER-5 G7 sites (`qa/iter4-review/a2-g7-token-inventory.md:56–73`)
— `ITERATION4-SEED-DOSSIERS.md:56` (OAI family-265 companion sweep + AreaLaw2D 3D
third-party formal activity; carrier the L6/`novelty/round-5*` canonical record),
`ITERATION4-CHARTER-DRAFT.md:58` (AL-3D novelty residual + the ZZV2 sub-item — the
latter now CLOSED by the η-port round-5 battery + DECISION-2), `lp-duality-bridge.md:68`
(mathlib LP/PNT PR standing clock), `pilots/10/next-tranche-spec.md:3` +
`10-blueprint.md:187` (resolve with the D4 charter line) — plus 77-T2's
filter-blind-spot residual (in the 77 follow-up's scope). The 72-M1 L3-spec §8
header rides the L3b–d carry. The canonical `novelty/round-5*` record and the AL-3D
sub-item residual remain open obligations (DECISION-5's open remainder), as does the
optional BGS-TB/Lamzouri full-text pass (warranted only if a future consumer
challenges the DECISION-2 ruling).

**Standing rules + registries carried.** Ground rules verbatim: discovery-first,
kernel-only (no `sorry`, no `native_decide`, no external CAS), siblings read-only,
exact citations for every claim; donor statements enter only as hypothesis binders,
verbatim marked probe copies, or already-built on-pin libraries; logs persisted with
provenance headers; one writer per file; H commits only. Modal per the AGENTS.md
mandatory guidelines (2 CPU / 4 GB default, telemetry every run,
`LEAN_NUM_THREADS=2`, taskset-not-`-j` on lake phases, investigate-not-upgrade,
cached image layers for long builds, never over-reserve). Lane topology: H +
queue-loaded sticky lanes. **The Λ-absence ban carries verbatim (debt-l):** Λ ≤ 9/32
is kernel-checked by DrMurphyIsIn; "Λ absent everywhere" is false — any Λ idea must
START from this artifact. Standing clocks (`qa/REPORT-INPUTS-ITER4.md:69`): tracker,
Liu-2, WenrongZou, physlib pushed_at + wing sweep, mathlib PNT/LP PRs, AreaLaw2D
challenge repo, QR-D race consumers (Bhargava–Vemulapalli arXiv:2611.09031;
Baldwin–Sivek arXiv:2611.06705; Cao–Gao–Huang–Nie arXiv:2610.37179; Frei–Sofos–Widmer
arXiv:2610.18491; Chang–Wang arXiv:2611.00924 (Hecke zero-free, added
2026-11-19); Walsh arXiv:2610.40439). Debts f/h/l open (HKT theorem-number
partial pin; tracker as_of convention; the Λ-absence ban); debt g closed 2026-11-17.
Donor registration: the Sept-2026 honeycomb-SAW cluster (9 OAI preprints +
~150-module proved tree, `OAI/Combinatorics/Honeycomb*`) is unregistered —
G11/G12-pattern registration available, **SHELF, fire-gated on a chartered
consumer** (none exists); NS-1 is KILLED (verdict COVERED — name-collision artifact,
candidate §5a); stale-note flags report-only. Close-out: the Iteration-4 adopted
five-rule protocol (scoped final gates, gate-run persistence, INDEX reconciliation
as a close gate, date discipline, staging-file supersession stamps).

**Close-out record (2026-11-20).** Iteration 5 closed 2026-11-20 (orchestrator;
close-completion commit this commit). Final pilot outcomes (§11 basis,
machine-computed, D7 vocabulary): tables N = 22 — **15 GREEN-triad / 2
honest-partial / 1 NOT-GREEN-honest (parked-unfired)**; every landed row triad-only
`[propext, Classical.choice, Quot.sound]`, 0 sorryAx; whole-tree **605
print-verified** triad-clean decls (the 386/386-equivalent Iteration-4 basis + 219
Iteration-5 growth: 77-T1 8 + 41-Core 30 + 41-H1 2 + 41-H2 4 + A2 89 + N2-P1 17 @
run-31 + N2-P3 3 + P2-c 11 + P3-d V2 5 + P3-e 2 + P2-d 2 + eta-r1 6 + eta-r2 4 +
eta-r3 2 + RedM3 3 + M-arc 1 + 72-M1-T3 3-clean + 74-P2 16 @ run-20 + H3 11;
machine stages + AxFC custody cover the unprinted-helper surfaces per the ledger;
residual = the L3 contaminated four — `hasGlobalGap_of_fullSystemGap`,
`isAdmissible_ΦL`, `hamiltonian_gridDom_eq`, `interface_areaLaw_uniformAreaLaw`,
re-derivation class, named) + **18 donor rows** triad at their donor pins (the
P3-d endpoint set proved ON the ZetaZerosV2 donor tree). Sweep:
FINAL-SWEEP-PLAN-ITER5 Steps A–B executed at close — Step-A certificate **66 = 52 −
3 + 17 exact, zero unexplained** (ENTRY 14: −3 = the al3d/P0 find-#6 amendment
sorry-free; +17 = the 12-family staged-unfired statement stubs, in-record); Step-B
**60 stages** (make_axcheck `048b501f`, py_compile rc=0, 0 duplicate names) + the
AxFC custody records, 0 sorryAx. Gates G1–G8 executed on the exact closing tree
(`qa/iter5-closeout-gates.md` §G8, committed with this close block). **Discovery
ledger: article-41 SHIPPED** (splice `cb87a67`, DISCOVERY quota-free — the
Graves–Cayley sign alternation as the q=1 fiber of the (1−q)-defect identity on the
antipodal stratum; S1–S4 4/4; the S3 honesty sentence in-text) **+ article-41H
SHIPPED** (splice-2 `cc71841`, post-edit sha `cb4d4fae`, kind NEGATIVE
discovery-grade per BANK-AS-NEGATIVE — the 3-strand TL/Jones hypothesis closed
FALSE). **75-N2's arc CLOSED GREEN end-to-end** (P2-a/b + P3-a/b/c/d/e + the ℚ
endpoint triad on the V2 donor tree + the optional P2-d hEχ rung — SLOT-1 with NO
remainder; the N3 full-coverage audit 358+48 records, 0 sorryAx, all ⊆ triad).
Quota cap-N = 1 **UNSPENT** (DECISION-1: spend-only-if-executed; the FB-2 vs FB-4
vs unspent contest **never chartered or executed — the SECOND consecutive unspent
cycle** per the F5-corrected disposition, minting provenance recorded:
the two-strike rule was minted at Iteration 4, iter-4 was the FIRST cycle under
it). KPI: **flow 2/2 = 100% discovery-grade; stock 8/16 = exactly 50% — the ≥half
bar PASSES at equality.** Carried to Iteration 6 (owners recorded): the L3
re-derivation remainder (stop-note `db872dc5` = the re-charter input); η-r4 parked
at T2/T3 (fix-batch-10 unfired) + rungs 5–8 in the amended band; the AL-M3
one-fire inheritance (P0 `33c75942` + A1 `a8feb25b` + A2 `221eb30b`); the H3
M-tranche BANKED + the §S4 open tier (precharter + battery + pre-solve on main;
article decision at open); the article-75 v2/v3-candidacy decision
(`v2-candidacy-dossier.md`); the FB-2 vs FB-4 contest (precharter + core-charter
input landed); 74-T3 OPEN-GATED; debts f/h/l; stale wrappers; the iter-6 bench =
census v2 + charter TYPESET-DRAFT v6 + the 12-core day-1 STAGED-UNFIRED set.
Token/annotation census: **7 staging stamps flipped at close** (+ the splice-.diff
census-exclusion ruling: payload-not-instrument); annotation census = 1 baseline
token, dispositioned CLOSED-by-cycle (the η-port session's landing); the
fold-once queue DRAINED (all six slots folded + item-13 GREEN at run 20).
