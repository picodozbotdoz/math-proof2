# cross-math-fronttier — Final Report (DRAFT skeleton, 2026-11-09 night)

Status: DRAFT compiled by lane H from project artifacts; the orchestrator edits §Top-3 and
conclusions in place. Placeholders are marked **[PLACEHOLDER]**. All quantitative claims carry
their source file; QA numbers are H's own spot-check tallies (`research/qa/`).

## 1. Executive summary

**TOP-3 DECIDED (orchestrator): 42 (ζ_K zero-density, rank ≈ 12, pilot already landing),
10 (uniform ∧ min-rate ∧ poly-space ETH refutation, 6.67), 01 (inertial master identity —
already an unconditional kernel-verified new theorem, 7.0).** Alternates 41/11/30; excluded
22/21/51. Full decision + log in `TRIAGE.md` §Top-3; capsule in §8 below.

Headline stats (verified this session):
- 4 corpora surveyed (mathlib ~8.7k files, tauceti 242k decls, openai-math 2.44M decls incl.
  vendored trees, anthropics 3 projects ~350k lines) → 5 bridge maps → **19 candidate
  dossiers**, every one citation-QA'd: **130/152 items OK, 22 minor locator slips, 0 WRONG**
  (`qa/dossiers-spotcheck.md` Parts 1–4); bridge maps QA'd 40/50 OK, 0 WRONG.
- **Lean pipeline state** (canonical: `feasibility/VERIFICATION-LEDGER.md`): pilots tree
  12,978 LoC / 242 theorems / 421 lemmas; **one milestone fully proved AND axioms-recorded —
  pilot 22 M1** (68 LoC); pilot 01's 8-file port green with recorded clean axioms for the
  two spine theorems; 42/50/52/20 staged-but-unrun ([runs-unrecorded]); 3 in-flight FAILs
  being cleared (01-09, 11-RedComp, 22-Tier1). R9 rescuing logs; final re-sweep pending.
- Novelty consolidation (`novelty/VERDICTS.md`): 6 dossiers survive at N ≥ 4 after adjustment
  (10, 11, 12, 30, 31, 41); 4 HOT depreciation risk (01, 02, 21, 22), 5 WARM.

**[PLACEHOLDER: one-paragraph narrative conclusion — orchestrator]**

## 2. Method

Ten-lane pipeline (R1–R9 + H) per `AGENTS.md` / `RESEARCH.md`: Phase 1 surveys → Phase 2
bridges → Phase 3 dossiers → Phase 4 triage, with a pilots pipeline grafted on before final
triage. Coordination: `STATUS.md` (lane board + file-ownership: one writer per file, reads
free); `INDEX.md` (annotated file index); H ran continuous citation QA with exact commands,
never content QA (novelty = R8, feasibility = R9).

- **QA stats**: dossiers 130/152 OK / 22 minor / 0 WRONG (4 passes, all 19 dossiers; ≥2
  negations re-run per dossier, all confirmed in substance); bridges 40/50 OK / 10 minor /
  0 WRONG; survey spot-checks 11/12 + 9/12 + 3/4. All authorized fixes applied with erratum
  one-liners at each site; deferred register in `STATUS.md` (R9-frozen files).
- **Declaration index**: `qa/decl-index.tsv` — 2,888,273 decls over 6 corpus roots in 8.7 s
  (rg-based, re-runnable via `qa/make-decl-index.sh`), with documented caveats (ASCII names,
  prefixed headers, OAI vendored trees → direct-rg fallback; preprints never indexed).
- **Feasibility headline** (`feasibility/FEASIBILITY-SUMMARY.md`, canonical 19-row effort
  table, probe-cited): **statement-port cost is ≈0 corpus-wide** — 8 verbatim/probe files
  clean across zeta23/eth/3sum-apsp/OAI/PairCeiling/mathlib with zero statement drift
  v4.33/v4.34→v4.36; every observed failure was a citing-side name/path error (corrected and
  re-verified). Effort lives in proofs and new mathematics; toolchain friction solved by
  pattern (zeta23→binder types; OAI→interface hypotheses; tauceti→direct dependency).
- **Modal usage** (per VERIFICATION-LEDGER): app `crossmath-probe`, image elan + v4.36.0-rc2
  + mathlib `ff2494ea` with 8,710 cached olans; **10 probe runs** (cold ≈3 m 45 s; warm
  68 s–2.5 m) + pilot runs (22: run1–6 in-repo; 01: 9 logs; 11: 3 logs; stage dirs for
  20/42/50/52) — transcripts cited per artifact in the ledger.

## 3. Corpus findings (Phase 1)

- **anthropics_formal-math** (`survey/anthropics.md`): three self-contained Palomar-style
  projects; zeta23 owns the zero side (RvM, Weil EF, 2/3–5/6 density), eth owns uniform
  subexponential k-SAT counting (ETH false), 3sum-apsp owns word-RAM 3SUM/APSP refutations.
  Zero `sorry` outside trusted challenge files; constants now two formal generations behind
  Knausgård (staleness erratum in §0).
- **mathlib (encore checkout)** (`survey/mathlib-frontier.md` + `feasibility/mathlib-assembly-maps.md`):
  substrate only — no PNT, no zero counting, no time-complexity API beyond an isolated
  `Computable.lean` island, no tensor rank; the assembly maps chart exactly what ports where.
- **tauceti** (`survey/tauceti.md` + `bridges/tauceti-contributions.md`): record-scale AI
  library; strongest classical matrix analysis (Courant–Fischer/Weyl/Hoffman–Wielandt/Ky Fan),
  argument principle, Landau, Chebotarev, octonions (Cayley–Dickson), TL/Jones — no counting
  functions, no complexity.
- **openai-math** (`survey/openai-math.md`): largest corpus; owns the zero-free side (quasi-RH
  7/8, Siegel), ω ≤ 9/4 with proofs, Hecke L over ℚ(√−3), Crouzeix, three independent
  TL/Heisenberg-adjacent stacks; no proportions, no reductions layer.

## 4. Bridge map highlights (Phase 2)

`bridges/`: complexity (Z1–Z6: reduction calculus, word-RAM↔TM2, uniform+poly-space synthesis,
ε(ω_b), second-moment layer); linear-algebra (EZ1–EZ6: defect identity, block rank–trace,
compression, Schur rigidity, bandwidth-k ceilings, trace-class lift); analytic-nt (E1–E6:
Hecke/ζ_K density, modular-L EF, effective PNT, uniform-in-conductor, De Bruijn–Newman);
tensor-algebra (BudgetedSplit, cocycle classification, Fock/Hall, grouping lemma); plus
tauceti-contributions (duplication audit: ξ-completions identical up to factor 2 — verified
def-by-def; Landau namesake collision; inertia complementarity). All five maps H-QA'd; every
load-bearing negation re-run and confirmed.

## 5. Candidate ledger (19 dossiers)

Full status — novelty verdicts, re-scopes, effort grades, pilot states, DRAFT ranks — lives in
the **canonical TRIAGE matrix** (`TRIAGE.md` §Candidate scores: 19 rows, complete DRAFT ranking
with 3 [S-proposed-H] and 1 [N-proposed-H] cells awaiting orchestrator confirmation; 52's N
pending lane R8). One-paragraph capsule: 6 dossiers hold N ≥ 4 after adjustment (10, 11, 12,
20, 30, 31, 41 — see TRIAGE for exact values); the Knausgård race demoted 01/02/21 to HOT
re-scopes and made 22 strategically dead (stop-at-M4); 42/50's donors accelerate their
assembly pilots; dossiers 51/60 are ecosystem feeders by design. Links: `candidates/NN-*.md`
(each carries its R8-verdict-aware text, R9 F4 section, and H's QA'd citations — 130/152 OK,
0 WRONG, all deferred locator fixes now applied per `qa/dossiers-spotcheck.md` Part 5).

## 6. External race report

From `novelty/VERDICTS.md` + `novelty/knausgaard-as-donor.md`:
- **Knausgård clock** (dominant): arXiv:2609.33043 (2026-09-27) + arXiv:2610.08965 with repo
  `kristianmk/839` (pushes through 2026-10-09) — a drop-in zeta23 extension (v4.33 lineage,
  MIT) proving formal constants 0.67354 (simple-on-line) / 0.83900 (distinct) plus six
  ceiling theorems and a §7.6 **all-windows** ceiling (0.68185/0.84093); headline theorems
  carry a `native_decide` local-check axiom, clean `*_of_local` layer beneath. Depreciates
  01/02/21 to HOT, stale-ifies 20/42 constants; simultaneously the strongest external donor
  (42's Hypζ discharges cleanly; window-instantiation existence proof for 20).
- **IEANTN/mathlib-PR clock**: mathlib PRs #41394/#44062/#43238 (Mertens/weights/weak-PNT)
  all still open; PNTAnd Medium/StrongPNT + IEANTN PntSmooth converging → 22's Tier-1 is a
  dead man walking.
- **AVW follow-up clock**: arXiv:2610.17420 (D ≤ N^0.172) + 2610.20297 — 32's constants
  superseded at birth (shape survives).

## 7. Proved Lean artifacts ledger (ours; kernel-only, no ports consumed)

**Canonical source: `feasibility/VERIFICATION-LEDGER.md` (R9 round 7) + the rescued run logs
now in `pilots/*/logs/` (axcheck-run1 et al.) — status below is the final-disk state at
report time; R9 re-attests at the final sweep.**
1. **Proved AND axioms-recorded clean (standard three only, 0 sorryAx):**
   - **22-M1** `pilots/22/M1.lean` (68 LoC) — `run4.log:15`, header "no sorry/axiom/native_decide".
   - **42-M1** `pilots/42/M1.lean` (337 LoC, 15 theorems) — `logs/axcheck-run1.log:43` "OK;
     axiom-lines=15, sorryAx-lines=0", all `[propext, Classical.choice, Quot.sound]`
     (resolves the ledger's earlier [runs-unrecorded]; the blueprint's GREEN is now
     log-confirmed).
   - **50-M1** `pilots/50/M1.lean` (94 LoC) — axcheck: OK, 4 axiom-lines, 0 sorryAx (hQRH binder).
   - **11-T1/T2** — P11T2 axcheck OK (19 axiom-lines, 0 sorryAx incl. `Real.logb_two_seven_lt`).
   - **01 port spine** — files 01–08 green; recorded clean axioms for
     `RHLinalg.rank_trace_ineq`/`rank_trace_mult` (`pilot01c-run5.log:158–159`).
2. **Moved since the ledger snapshot (final-disk):** **01 (b)+(c) GREEN — master_identity
   PROVED + anchor** (BindingSurface + MasterIdentity OK, 0 err / 0 sorry-warnings; tightness
   companion landing); **42-M2a/M3 landed** (602+444 LoC / 48 thms: factorization discharge +
   C_D defect layer; M2b next). **11-M1 COMPLETE** (acceptance GREEN, Design B;
   donor-verbatim faithfulness check; axioms = standard triad, no sorryAx; ≈35 min Modal —
   `11-blueprint.md:333–347`); M2 next, not open. **Still open:** 22-Tier1 (FAIL 10 err,
   run9; stop-at-M4 rule); 50-Dirichlet M2a (4–5 err); 52-M1 (13–15 err, 9 sorryAx);
   20-M1 staged; 32-M1 landed-unrun; 30-falsify not landed.
3. **Pilot 21 / milestone-C** — numeric certification (not a Lean theorem): Modal interval
   arithmetic certified `cStar(1) − cFun_quartic ≥ 3.870013e-4`, closing outcome B.
4. **Probes (R9)** — 13 files / 673 LoC; elaboration-probe convention (stub sorries are
   scaffolding in non-proof files, never cited as results; `native_decide` in zero files).
Caveat summary (ledger §3): donor material enters only as verbatim elaboration targets,
explicit hypothesis binders (42: Hypζ/Hypχ; 50: hQRH), or ported-and-reproved code with
provenance headers; the one sanctioned deviation is clean-layer consumption with certificate
binders (EnclOK pattern).

## 8. Top-3 recommendations for Lean pilot (DECIDED — orchestrator, charter Phase 4)

1. **42 — ζ_K zero-density proportions** (certificate-conditional landing theorem): first
   simple-or-on-line proportion statements for Dedekind ζ_K anywhere (DLRT-2019 prior >45%
   distinct via SDP — a 45%→5/6-class jump). M1 proved axioms-clean; M2a/M3 landed
   (602+444 LoC / 48 thms); donor-accelerated; N2→N4 (R8 r5(c)); rank ≈ 12. Next: M2b.
2. **10 (Z3) — uniform-in-k ∧ min-rate ∧ polynomial-space ETH refutation**: conjunction
   claimed by nobody; NOVEL-SUPPORTED high; conditional-GO after W3/FitsG wall analysis;
   first milestone = bounded G1 audit. Rank 6.67.
3. **01 — inertial defect-form master identity + tightness** (structural): the only
   candidate already an unconditional kernel-verified new theorem (master_identity + anchor
   proved; tightness companion landing); survives the Knausgård squeeze structurally;
   E2 empirical; rank 7.0.
Alternates: 41, 11, 30. Excluded: 22 (strategically dead pilot-category), 21 (absorbed),
51 (killed). Full typesetting + decision log: `TRIAGE.md` §Top-3.

## 9. Ground-rules compliance statement

Per `feasibility/VERIFICATION-LEDGER.md` §3 (canonical, R9-attested; H cross-checked): all
pilot files have **no actual `sorry`** (all 13 nonzero grep hits are header-compliance
mentions, verified line-by-line), zero `native_decide`, axioms recorded and clean for pilot
22 M1 and pilot 01's ported spine; four pilots staged-but-unrun and three in-flight failures
listed in the ledger for their lanes to clear before final. Donor caveats documented: Knausgård's headline theorems carry `native_decide` (we bind
only to his clean `*_of_local` layer, certificates as explicit hypotheses — the same posture
as zeta23's own `EnclOK`); openai/anthropics donors enter as statement-level citations or
Prop-binders, never imported proofs; sibling repos read-only throughout (only
`research/**` written in this repo). Known-attribution holds: dossier 60's ⟨3,3,3⟩
border-rank-≤21 attribution unverified (R8 flag — do not assert).

## 10. File index

- Charter/coordination: `RESEARCH.md`, `STATUS.md` (lane board, deferred-fix register),
  `INDEX.md`, `TRIAGE.md` (19-row matrix, DRAFT scores, checklist).
- Surveys: `survey/{anthropics,mathlib-frontier,tauceti,openai-math}.md`.
- Bridges: `bridges/{complexity,linear-algebra,analytic-nt,tensor-algebra,tauceti-contributions}.md`.
- Candidates: `candidates/TEMPLATE.md` + 19 dossiers `NN-slug.md` (F4 sections inside).
- Novelty: `novelty/{round-1,round-2,round-3,VERDICTS,knausgaard-as-donor}.md`.
- Feasibility: `feasibility/{mathlib-verification,port-probe,mathlib-assembly-maps,
  FEASIBILITY-SUMMARY,VERIFICATION-LEDGER}.md` + `probe/` (SUMMARY = canonical 19-row effort
  table; LEDGER = canonical artifact/compliance table).
- Pilots: `pilots/{01,10,11,20,21,22,42,50,52}*` (blueprints, work dirs, run logs).
- QA: `qa/{anthropics,mathlib-frontier,bridges,dossiers}-spotcheck.md`,
  `qa/{make-decl-index.sh,decl-index.tsv}`.
