# INDEX — annotated index of research/

One line per file: path | phase | status | content. Verified against disk 2026-11-09
(`ls -R research/`). Files marked [expected] do not exist yet; they appear here because
a lane owns them (see STATUS.md). H updates this index as files appear.

## Charter & coordination

- `research/RESEARCH.md` | — | stable | Research charter: objective, Phases 1–4, ground rules (discovery-first; kernel-only verification; exact citations).
- `research/STATUS.md` | — | live | Coordination board: lane table, phase pipeline, file-ownership rule.
- `research/INDEX.md` | — | live | This file.
- `research/REPORT-INPUTS.md` | final input | DONE 2026-11-09 19:58 (H) | Orchestrator's §1-conclusion data pack: headline-numbers block + §A scale (QA recompute 230 items / 193 OK / 37 minor / 0 WRONG) + §B verification (final-disk) + §C decision + §D timeline (3 pivots 19:26–19:31). Every number file-cited.
- `research/REPORT.md` | final | **FINAL** (≈2.4k words); Cycle-2 addendum FILLED-FINAL 2026-11-14 | §1 executive summary integrated with final-sweep counts; §7 final proved-artifacts table; §8 Top-3 outcomes; §9 signed-off compliance; § Cycle 2 = C2.1–C2.7 all filled (close-out chain executed: sweep Steps A–D signed at ledger §9.F; §C2.6 mirrors the TRIAGE decision).

## Phase 1 — surveys (research/survey/)

- `research/survey/anthropics.md` | P1 | DONE (maintainer: H) | Survey of anthropics_formal-math (3sum-apsp, eth, zeta23): territory, sorry inventory, external deps, bridging hooks. QA fixes applied 2026-11-09.
- `research/survey/tauceti.md` | P1 | landed 2026-11-09 (R1); **QA'd 2026-11-13 (A1-5 fixes-in-place, `qa/tauceti-spotcheck.md`)** | Survey of tauceti: AI-authored mathlib-downstream library of record scale (universal covers, reductive groups, Floer homology, …); git `d92acc5c0`.
- `research/survey/openai-math.md` | P1 | landed 2026-11-09 (R2); **QA'd 2026-11-13 (A1-5 fixes-in-place, `qa/openai-math-spotcheck.md`)** | Survey of openai-math: largest corpus (721 manuscripts, ~29.7M Lean lines); family-granularity map + deep dives on bridging targets.
- `research/survey/mathlib-frontier.md` | P1 | DONE 2026-11-09 (R3) | Survey of mathlib checkout `ff2494ea`: zeta/L, computability, matrix inequalities, tensors — exists/missing/glue per zone. QA'd by H (9/12 OK, 3 minor).

## Phase 2 — bridge maps (research/bridges/)

- `research/bridges/complexity.md` | P2 | v1 DONE 2026-11-09 (R4; dossiers 10–12 in progress) | Complexity cluster: 5 corpora × 3 machine models, intersection table, lifts L1–L4, transfers Q1–Q4, empty zones Z1–Z6 (reduction theory, word-RAM↔TM simulation, uniform+poly-space SAT counting, ε(ω_b), second-moment lemma). QA'd: 9/10 OK, 1 cosmetic.
- `research/bridges/analytic-nt.md` | P2 | v1 landed 2026-11-09 (R5; status pending) | Analytic NT cluster: zero counting, explicit formulas, zero-free/density, prime counting across zeta23/mathlib/tauceti/openai-math; empty zones E1–E6 (Hecke-L density, modular-L EF, effective PNT, uniform Theorem E, De Bruijn–Newman). QA'd by H: 8/10 OK, 2 minor.
- `research/bridges/linear-algebra.md` | P2 | v1 DONE 2026-11-09 (R6; dossiers 01–03 in progress) | Matrix-analysis cluster: RHLinalg certificate layer vs tauceti classical perturbation layer vs mathlib substrate; lifts L1–L6, transfers Q1–Q5, empty zones EZ1–EZ6. QA'd: 10/10 OK.
- `research/bridges/tensor-algebra.md` | P2 | v1 landed 2026-11-09 (R7; status pending) | Tensor/algebraic methods: eth + 3sum-apsp + openai-math as three independent tensor-decomposition→algorithm pipelines; Fock/Heisenberg ↔ Hall-inner-product identification; empty zones (a)–(d). QA'd by H: 8/10 OK, 2 minor.
- `research/bridges/tauceti-contributions.md` | P2 | landed 2026-11-09 (R1; corrects survey/tauceti.md §4) | Zeta23↔TauCeti duplication audit (ξ-completions identical up to factor 2; Landau namesake collision; inertia complementarity), zero-density empty zone C1–C3, eth↔TauCeti hosting (eight-square in Clifford), openai/3sum hooks. QA'd by H: 5/10 OK, 5 minor (all locator-level).

## Phase 3 — candidate dossiers (research/candidates/)

- `research/candidates/` | P3 | open | Dossier directory; one file per candidate discovery (owner = creating researcher, assigned by orchestrator).
- `research/candidates/TEMPLATE.md` | P3 | DONE 2026-11-09 (owner: H) | Phase-3 dossier template with all charter sections + score fields and an EXAMPLE-NOT-A-CANDIDATE (Strassen) density illustration.
- `research/candidates/01-ez1-inertial-defect-master-identity.md` | P3 | DONE 2026-11-09 (R6) | Dossier realizing EZ1: exact five-defect master identity for the rank–trace/Lemma-R inequality + corollaries A1–A5. QA'd: 7/8 OK, 1 minor.
- `research/candidates/02-ez5-bandwidth-k-ceiling-laws.md` | P3 | DONE 2026-11-09 (R6) | Dossier realizing EZ5: bandwidth-k certificate hierarchy, stability law, monotone ceiling constants B_k, LP computability; honest open-core split. QA'd: 7/8 OK, 1 minor.
- `research/candidates/03-ez3-compression-rank-trace.md` | P3 | DONE 2026-11-09 (R6) | Dossier realizing EZ3: compression rank–trace inequality with global inertia budget + 03a donation sub-candidate. QA'd: 8/8 OK.
- `research/candidates/10-z3-uniform-poly-space-eth-refutation.md` | P3 | DONE 2026-11-09 (R4) | Dossier realizing Z3: one k-uniform machine, poly space — eth uniformity × openai space monitor; pad-compression strategy. QA'd: 6/8 OK, 2 minor.
- `research/candidates/11-z1-composable-reduction-theory.md` | P3 | DONE 2026-11-09 (R4) | Dossier realizing Z1: call-charged reduction calculus (calls multiply, extras add) with word-RAM and TM2 realizations. QA'd: 7/8 OK, 1 minor.
- `research/candidates/12-z4-parametric-savings-function-in-matrix-exponent.md` | P3 | DONE 2026-11-09 (R4) | Dossier realizing Z4: ε(ω_b) parametric savings; openai ω ≤ 9/4 wired into 3sum-apsp's MM slot. QA'd: 6/8 OK, 2 minor.
- **Second wave (landed 2026-11-09 evening, QA'd by H — see `qa/dossiers-spotcheck.md` Part 2):** `20-hecke-zetaK-zero-density.md` (R5, E1; 8/8 OK), `21-quartic-window-zeta-thmD.md` (R5, §2a; 6/8, minors fixed Task 7), `22-quasi-rh-pnt-effective.md` (R5, E3, ecosystem/pilot-labelled; 6/8, minors fixed Task 7), `40-zeta-k-prime-derivative-zeros.md` (R1, C1(iii); 7/8), `41-q-deformed-eight-square-temperley-lieb.md` (R1, §3a q≠1; 6/8, negations restated Task 7), `42-zeta-k-two-thirds-product-assembly.md` (R1, C1(ii) assembly; 7/8), `50-quasi-rh-truncated-window-constants.md` (R2, audit+killed-headline dossier; 7/8), `60-border-rank-first-connector.md` (R3, ECOSYSTEM-NOT-DISCOVERY connector; 8/8).
- **Third wave:** `30-hall-parseval-boson-identification.md` (R7, §4c; QA 7/8 Part 3), `31-budgeted-split-meta-theorem.md` (R7, §4a; QA 8/8), `32-rc-savings-frontier.md` (R7, §3-3 frontier; QA 7/8), `51-omega-to-wordram-bit-bridge.md` (R2, ECOSYSTEM feeder for 12; QA 6/8 Part 4), `52-unified-ccr-fock-layer.md` (R2, occupation-calculus reframing; QA 6/8 Part 4).

## Cross-cutting lanes

- `research/novelty/round-1.md` | P2/P3 support | round-1 DONE 2026-11-09 (R8) | Novelty verification round 1: anthropics §4 donor/gap claims checked against outside literature.
- `research/novelty/round-2.md` | P2/P3 support | round-2 DONE 2026-11-09 (R8) | Dossier-level novelty: Hughes–Miller citation correction (§2), per-dossier verdict table, AF-v2 fulltext checks (§6, pre-checks on candidate 50).
- `research/novelty/round-3.md` | P2/P3 support | DONE 2026-11-09 (R8) | Round-3 novelty incl. §T Knausgård clock (arXiv:2609.33043 + repo kristianmk/839, formal 0.67354/0.83900 with ceilings).
- `research/novelty/CLAIMS-REGISTER.md` + `RELATED-WORK.md` | P4 input | DONE (R8) | Final claim register (per-candidate claim, evidence cites, prior art, SAFE/RISKY) — 01 line updated to PROVED; related-work companion.
- `research/novelty/VERDICTS.md` | P4 input | DONE 2026-11-09 19:26 (R8) | Consolidated novelty verdicts for all 19 dossiers: N-adjusts, risk tiers (HOT/WARM/COLD), re-scope one-liners, standing flags for H (Hughes–Miller ✓done, 60 attribution hold, anthropics constants staleness ✓done, Knausgård patch = de-risking for 20/21/42).
- `research/feasibility/mathlib-verification.md` | P3/P4 support | round-1 DONE 2026-11-09 (R9; maintenance: H) | Independent verification of 10 mathlib-gap claims vs checkout `ff2494ea`, 9 surprises, and the §3 Phase-3 feasibility template with worked example C-1. H re-checked 4 items (3 OK, 1 minor; fixed with errata).
- `research/feasibility/port-probe.md` | support | DONE 2026-11-09 (R9) | Rounds 2–5 empirical port-probe: donor statements vs mathlib v4.36.0-rc2 — what breaks, measured.
- `research/feasibility/FEASIBILITY-SUMMARY.md` | P4 input | DONE 2026-11-09 19:38 (R9 round 6) | Canonical 19-row effort table (F4 grades + scores + probe-cited evidence); headline: statement-port ≈ 0 corpus-wide, effort lives in proofs/new math.
- `research/feasibility/VERIFICATION-LEDGER.md` | P4 input | DONE 2026-11-09 19:38 (R9 round 7) | Canonical Lean-artifact ledger: per-pilot files/LoC/theorems, proved-milestone vs FAIL vs [runs-unrecorded] statuses, probe conventions, compliance statement. FEASIBILITY-SUMMARY no longer pending. Cycle-2 addenda: §8 (52/20 close-outs, MODAL_USER=doz substrate note) + **§9 FILLED 2026-11-14** (relaunch cross-check rows, conditional TARGETS 42-M4b-upgrade/50-M2; machinery pre-verified).
- `research/feasibility/probe/` | support | DONE 2026-11-09 (R9) | Lean/Modal port probes: `lean_probe.py`, `run_probe.sh`, `Probe0_Smoke.lean`, `ProbeA.lean`, `ProbeB1_RHLinalg.lean`, `ProbeB2_EthTime.lean`, `ProbeB3_3sumEnd.lean`.
- `research/feasibility/mathlib-assembly-maps.md` | support | landed 2026-11-09 (R3 continuation) | Phase-3 feasibility inputs: per-bridge-direction assembly maps over checkout `ff2494ea` (incl. map C port order, map D polytime-composition layer cited by dossiers).

## Phase 4 — triage

- `research/TRIAGE.md` | P4 | **FINAL** | Rubric + complete 19-row matrix (all columns filled; final ranking headed by 42 @ 12.0 post-decision updates) + **§Top-3 DECIDED (orchestrator): 42, 10, 01** + alternates/exclusions + decision log.

## Pilots (research/pilots/)

- `research/pilots/01-blueprint.md` | pilot | COMPLETE — (a)–(d) GREEN: identity + anchor + tightness (R6) | Pre-pilot blueprint for dossier 01 (+ shared RHLinalg port bundling 01+03): port inventory, first-milestone spec, Modal pilot plan consuming R9's probe infra, risk register.
- `research/pilots/01/` | pilot work | active (R6) | `BindingSurface.lean`, `MasterIdentity.lean`.
- `research/pilots/22-blueprint.md` | pilot | PROVED-TO-M4 (R3) | PNT assembly pilot (Wiener–Ikehara route) for candidate 22; work dir `pilots/22/` (`M1.lean`, `ProbeP1_PNT.lean`, `run_m1.sh`, `run1.log`).
- `research/pilots/42-blueprint.md` | pilot | COMPLETE — M1/M2a/M3/M2b GREEN, landing theorems proved (R1) | Dossier 42 (zeta-K two-thirds product assembly), mirroring pilot 01's pattern.
- `research/pilots/11-blueprint.md` | pilot | M1 COMPLETE (R4) | Milestone-1 statement-file spec for dossier 11; work dir `pilots/11/` (RedCompA/B, P11T1/T2).
- `research/pilots/10-prework.md` | pilot | DONE — G1 audit CASE A, GO unconditional (R4) | Dossier 10 pre-pilot work.
- `research/pilots/10-blueprint.md` + `pilots/10/` | pilot | **M1 GREEN axioms-clean 2026-11-10** (pilot-10 lane) | Milestone L3: `M1.lean` (2,043 lines; eth host stack transcribed with proofs + new space layer) proves `exists_tm_space` (eth's `exists_tm` ∧ ∀t SpaceWithin poly(|x|)), eth's `exists_tm` as corollary, and openai's per-prefix monitor form; `logs/m1-run{1,2-green,3-confirm-axcheck,4-final}.log`; `axcheck_full.py` (full-coverage #print-axioms generator).
- `research/pilots/50-blueprint.md` + `pilots/50/M1.lean` | pilot | M1 + M2a (Dirichlet) GREEN, axioms clean | Dossier 50 pilot (S1a zero-confinement first).
- `research/pilots/21-milestoneC.md` | pilot | spec landed, not executing (R5) | In-Lean proof path for dossier 21's milestone (C) (trig series route).
- `research/pilots/32/M1.lean` | pilot | GREEN (run3; see `pilots/32-blueprint.md`) | Dossier 32 frontier pilot.
- `research/pilots/*/logs/` | evidence | R9 log-rescue LANDED; Cycle-2 refresh 2026-11-13 (A8) | Per-pilot Modal run logs incl. `axcheck-run1` (axiom/sorryAx audit: 42-M1 OK 15/0, 50-M1 OK 4/0, 11-T2 OK 19/0). 52-M1's recorded FAIL was a mid-iteration snapshot: R2's same-day fix landed run14-green + axcheck-final (15 axiom-lines, 0 sorryAx), reproduced Cycle 2 (`m1-run15-cycle2-green` + `axcheck-cycle2` — see `pilots/52-note.md`). `pilot52_run2` attributed to `pilots/52/logs/m1-run2.log`; `pilots/_unattributed/` now EMPTY. Pilot 20's [runs-unrecorded] gap closed: `pilots/20/logs/m1-cycle2-green.log` + `axcheck-cycle2.log` (`pilots/20-note.md`); ledger §8 addendum.

## QA (research/qa/)

- `research/qa/anthropics-spotcheck.md` | QA | DONE 2026-11-09 | Spot-check of 12 citations from survey/anthropics.md against the anthropics_formal-math repo: 11 OK, 1 minor error (fixed in survey same day).
- `research/qa/mathlib-frontier-spotcheck.md` | QA | DONE 2026-11-09 | Spot-check of 12 mathlib-frontier.md claims (9 OK, 3 minor) + 4 re-checks of R9's mathlib-verification.md (3 OK, 1 minor) vs mathlib checkout `ff2494ea`. Fixes applied same day with errata.
- `research/qa/bridges-spotcheck.md` | QA | DONE 2026-11-09 (two passes) | Pass 1: complexity.md 9/10 OK, linear-algebra.md 10/10 OK. Pass 2: analytic-nt.md 8/10, tensor-algebra.md 8/10, tauceti-contributions.md 5/10 (all minors locator-level; ξ-pair factor-2 arithmetic CONFIRMED; Clifford-present/octonions-absent both halves hold).
- `research/qa/dossiers-spotcheck.md` | QA | DONE 2026-11-09 (four passes — all 19 dossiers covered) | P1: 01/02/03/10/11/12 — 41/48. P2: 20/21/22/40/41/42/50/60 — 55/64. P3: 30/31/32 — 22/24. P4: 51/52 — 12/16. Totals: 130/152 OK, 22 minor, 0 WRONG; deferred-fix register in STATUS.md.
- `research/qa/make-decl-index.sh` | tooling | DONE 2026-11-09 (H) | Re-runnable rg-based builder of the cross-corpus declaration index; usage header documents novelty-check recipes and caveats (ASCII names, prefixed/noncomputable headers excluded — use direct rg fallback).
- `research/qa/decl-index.tsv` (gitignored, 273 MB; tracked only as `decl-index.tsv.zip` — unzip or re-run the builder) | tooling output | built 2026-11-09, 8.7s wall | 2,888,273 decl rows: openai-math 2,439,960, tauceti 242,275, mathlib 184,207, eth 10,148, 3sum-apsp 6,795, zeta23 4,888. **Caveat for novelty checks:** the OAI tree includes mathlib-like vendored content (2.4M decls), so a TSV miss is NOT evidence of absence in openai-math — always also run targeted `rg` in `openai-math/lean/OAI/`, `openai-math/lean/ComparatorChallenges/`, and `openai-math/preprints/` (manuscripts are not indexed at all).

Nothing remains [expected] from the main run: every file owned by a lane is on disk (project closed 2026-11-09). Cycle-2 [expected] entries follow at the end of this file.

## Articles (research/articles/) — one per discovery (project close, 2026-11-09)

- `research/articles/README.md` | final | DONE | Index of the 10 articles with kind + status.
- `articles/01-inertial-defect-master-identity.md` | final | DONE | Five-defect master identity + simultaneous tightness (proved, unconditional).
- `articles/30-boson-operators-second-difference-closed-form.md` | final | DONE | Theorem B refuted; Q_s closed form as second differences of number operators; Σ s²Q_s = 4·Euler.
- `articles/52-statistics-universal-occupation-calculus.md` | final | DONE | ε-universal dual-family theorem, Pauli boundary, fermionic exterior-algebra instance.
- `articles/32-rc-savings-frontier.md` | final | DONE | Exact frontier Γ(ε), unique crossing, phase transition at ε*.
- `articles/42-quadratic-dedekind-zeta-zero-proportions.md` | final | DONE | ζ_K proportions (certificate-conditional), C_D defect, hCZ.
- `articles/20-common-zero-seam-dedekind-zero-density.md` | final | DONE | Engine instantiation, merge-vs-degrade dichotomy, hCZ requirements (corrected).
- `articles/11-call-charged-reduction-calculus.md` | final | DONE | `Red` calculus; Theorem 19 as one composition.
- `articles/50-zero-free-regions-cannot-move-certificate-constants.md` | final | DONE | Negative engine audit + formal strip confinement.
- `articles/21-quartic-window-transplant-certified-loss.md` | final | DONE | Certified negative result (numeric, not kernel).
- `articles/22-pnt-psi-form-from-mathlib-wiener-ikehara.md` | final | DONE | ψ(x) ~ x from mathlib's Wiener–Ikehara (formalization).

## Close-out additions (resume session)

- `research/pilots/30-note.md` | pilot | CLOSED | Pilot 30 outcome: Theorem B2 REFUTED (kernel), Theorem B′ closed form proved; run history.
- `research/pilots/30/ClosedForm.lean` | pilot | GREEN | Faithful `MvPolynomial ℕ ℚ` model: `nab_nab`, `Qh1_closed_form`, `Qh1_monomial`, `Qh1_comm_monomial`.
- `research/pilots/30/logs/` | evidence | DONE | run1 (R7'), run2, run3-green, axcheck-final.
- `research/pilots/32-blueprint.md` | pilot | CLOSED | Pilot 32 inventory, run log (22 → 2 → 0 errors), novelty/must-cites.
- `research/pilots/32/logs/` | evidence | DONE | run1, run2, run3-green, axcheck-final.
- `research/pilots/*/logs/axcheck-final.log` | evidence | DONE | Final-sweep axcheck transcript (29/29 OK, 0 sorryAx), one copy per pilot (01, 11, 20, 22, 30, 32, 42, 50, 52).
- `research/feasibility/probe/make_axcheck.py` | tooling | updated | Final target list; section- and comment-aware theorem extraction; optional stage-name filter.
- `research/feasibility/axiommath-bump/` | feasibility | run1 2026-11-13 | AxiomMath clones bumped to v4.36.0-rc2/ff2494ea: Challenge statements 3/3 OK; ZetaZeros build OK after 4 fix rounds (run5, 7472 jobs, 0 sorry; ZetaZeros dev/claude port commit); ZetaZerosV2 build OK after 9 rounds (v2-run9, 8262 jobs, 0 sorry; with the PNT+ modules on its path ported — full PNT+ lib not built).

## Cycle 2 (opened 2026-11-13) — AxiomMath corpus as fifth source

Statuses as of the 2026-11-14 relaunch (charter addendum: `RESEARCH.md` § Cycle 2; live
board: `STATUS.md` § Cycle 2 + relaunch block; handoff: `RESUME-BRIEF-C2.md`). QA plan
passes Parts 1–7 executed (cumulative 0 WRONG — `qa/cycle2-qa-plan.md`; Part 7 = DLRT-erratum propagation sweep). Mid-flight
artifacts of the outage are committed in snapshot `ca4fd22` (pre-relaunch, unverified
state per the resume brief).

- `research/survey/axiommath.md` | P1 | landed 2026-11-13 (A1; QA P1: 10 OK / 2 minor) | Phase-1 survey of the six AxiomMath repos: territory, terminal points, external deps, hooks H1–H7 (incl. the H1 correction: DZDF does not discharge 7/8 binders).
- `research/survey/axiommath-pntplus.md` | P1 addendum | landed 2026-11-13 (A1-2) | PNT+ deep dive + §RvM triplication; upstream-PNT+ inspection (rev `938912bb`).
- `research/survey/axiommath-cft-vendor.md` | P1 addendum | landed 2026-11-13 (A1) | Vendored-CFT audit: DZDF's vendor tree is number-field-only; the binder-route needs ZERO imports.
- `research/novelty/pntplus-glue-as-donor.md` | P2/P3 support | landed 2026-11-13 (A1-3) | PNT+ glue donor map; upstream registration verdict DEFER-WATCHLIST (triggers T1–T3 in STATUS).
- `research/bridges/function-field.md` | P2 | v1 + dictionary-zone update landed 2026-11-13 (A2; QA P2 9 OK/1 MINOR, `qa/cycle2-qa-plan.md` Part 4) | Weil ↔ quasi-RH cluster; zones FF-EZ1–FF-EZ5; Stacks-wall binder posture.
- `research/bridges/area-law.md` | P2 | v1 + zone update landed 2026-11-13 (A4; QA P3 9 OK/1 MINOR; Physlib-import premise flag from QA P5c + H erratum) | AreaLaw2D ↔ openai family 265 ↔ linalg; zones AL-EZ1–AL-EZ4.
- `research/feasibility/quantum-info-substrate.md` | support | landed 2026-11-13 (A4) | Quantum-info substrate gap map over mathlib `ff2494ea` (Phase-3 feasibility input for 72/74).
- `research/novelty/axiommath-as-donor.md` | P2/P3 support | landed + Liu-1 erratum 2026-11-13 (A3; QA P4: 8 OK / 2 minor pins) | Donor remap: 50 PARTIAL(31/32), 20 object-layer switch, 42 ζ-side DISCHARGES + M4 spec (strip-distinct QA fix), 22/21/40 no deltas; `dedekindAbelianQuotient` feeder.
- `research/novelty/round-4.md` | P2/P3 support | PART 1+2 landed 2026-11-13 (A5) | Cycle-2 novelty protocol + pre-registered nearest-miss baselines (zones FF/AL/QR-D) + the §5 QR-D precision pass (Liu-1/CT split — binding on dossiers 70/50).
- `research/novelty/VERDICTS.md` | P4 input | Cycle-2 addendum landed 2026-11-13 (A5) | Rows 71–74 zone-level pre-fills, `[incoming-dossier]` cells for A9.
- `research/qa/make-decl-index-v2.sh` + `decl-index-v2.tsv` (gitignored; `.zip` tracked) | tooling | DONE 2026-11-13 (A5) | decl-index v2: 13 corpus labels incl. the six axiommath trees + vendor-CFT; vendoring caveats documented.
- `research/candidates/70-unconditional-zetaK-zero-confinement.md` | P3 | FINAL 2026-11-13 (A9; QA P5a: 7 OK / 1 minor) | Part A posture upgrade (M2-31/32, GATED on G1) + Part B abelian-assembly discovery content; per-class novelty split vs Liu-1/Liu-2.
- `research/candidates/71-function-field-splane-dictionary.md` | P3 | FINAL 2026-11-13 (A9; QA P5b: 8 OK) | Renamed from 71-simple-zero-proportions on A2's bridge landing; FF-EZ1 dictionary + FF-EZ5 window-comparison corollary; falsity-trap respected.
- `research/candidates/72-area-law-inertial-defect.md` | P3 | FINAL 2026-11-13 (A9; QA P5c: 7 OK / 1 minor — Physlib premise flag) | Gap-to-inertia dictionary (P1), certificate route (P2, HYPOTHESIS), Kuwahara no-go gate (C-neg), AL-EZ3 interface as M1.
- `research/candidates/73-function-field-hecke-tate.md` | P3 | FINAL 2026-11-13 (A9; QA P5d 7 OK/1 MINOR); Tier-C pilot delivered 2026-11-14 (A2) | FF Hecke–Tate; Q4 carried to Iteration 4.
- `research/candidates/74-surprisal-moment-hierarchy-ceilings.md` | P3 | FINAL 2026-11-13 (A4; QA P5e 7 OK/1 MINOR); unassigned — activates on Iteration-4 chartering | Moment-hierarchy ceilings for surprisal decoupling (secondary of 72 promoted).
- `research/candidates/75-abelian-assembly-zetaL-proportions.md` | P3 | FINAL 2026-11-13 (A9; QA Q5f 7 OK/1 MINOR); entry milestone delivered 2026-11-14 (run6-final) | Part B of dossier 70 promoted to its own dossier.
- `research/feasibility/axiommath-donor-probes.md` | support | landed 2026-11-13 (A7; commit 24e8d93) | G-verdicts: G1a OK (DZDF statements elaborate) / **G1b FAIL** (DZDF full build 62 errors → 50-M2-R2 statement-level only), G2 OK (V2 build 8,262 jobs, triad-clean → M4b-upgrade gate cleared), G3 binder-route OK, G4/G6 OK, G7 Liu-1 pins exact. **G7b PASS 2026-11-14 (run32 — headlines + delegation roots triad-only); G5a BLOCKED-INFRA → Iteration 4; G6a CONFIRMED NEGATIVE.**
- `research/feasibility/probe/{ProbeG1–G5c, gprobe.py, run_gprobe.sh}` + `probe/logs-g/` | evidence | committed 24e8d93 (logs run16–18 added in snapshot ca4fd22) | Cycle-2 donor probes; run16 = G7b has NO verdict (outage-killed); run17 (G5a) / run18 (G6a) tails written post-outage — suspect until re-verified.
- `research/feasibility/probe/FINAL-SWEEP-PLAN-C2.md` | support | landed 2026-11-13 (A1; tested — 36 sorry-tokens all justified, 0 unexplained) | Cycle-2 final-sweep plan (TARGETS + Steps A–C); trigger = A1 standby signal.
- `research/pilots/42-M4-blueprint.md` + `pilots/42/` | pilot | M4a GREEN + axcheck-clean 2026-11-13 (1,194 LoC/52 thms, logs m4-run2 + m4-axcheck-run1); `M4a-note.md` = M4c addendum draft; **M4b.lean fallback route GREEN 2026-11-14** (run1 FAIL err=3 sorry=0 → 12-line Fix-C → run2 "M4b.lean: OK" + `m4b-axcheck-run1` GREEN triad-only 0 sorryAx, 92 axiom-prints/68 thms; snapshot 942828c) ; **upgrade COMPLETE 2026-11-14 (A3 formal, M4-note: final 1,571/68, both routes)** | The V2 donor-swap pilot (GO).
- `research/pilots/50-M2-31-32-spec.md` | pilot | landed 2026-11-13 (A3) | The unconditional [1/32, 31/32] strip spec (GATED on A7/G1; Liu-1 third route).
- `research/pilots/72-prework.md` | pilot | landed 2026-11-13 (A4) | EZ3-first pilot-72 prework (import tiers, binding constraints).
- `research/pilots/10/L1.lean` + logs | pilot | committed (snapshot ca4fd22): **L1 GREEN + axcheck-clean** (529 LoC/25 thms, logs l1-run1..4-final) | L1 counter combinators done; **L2 GREEN 2026-11-14 (A6 formal: 2,625/151 all ⊆ triad; l2-run5-final)** — headline OPEN, assembly tranche carried.
- `research/pilots/71-prework.md` + `pilots/71/` | pilot | prework landed 2026-11-13 (A2); P0 OK (probe, 4 justified stubs) + **P1 GREEN** (7/7 kernel-clean, triad; logs run1–4); **P2 FINAL-GREEN 2026-11-14 (p2-run6: 279/11 all triad; W1 pole-family correction)** | Slot-1 FF pilot (W1 s≠1 pole exclusion → W2 → HW); then 73-C skeleton.
- `research/pilots/72/C-neg.lean` + `pilots/72/logs/` | pilot | **FINAL-GREEN 2026-11-14 (run8-final 0/0/0; 369/11; axcheck 11/11 triad; run1–7 headers reconstructed + marked)** | Kuwahara no-go gate pilot (A4 relaunch: fix to GREEN per N1–N3, then axcheck triad-only).
- `research/pilots/11/{P11T3,RedTm2}.lean` + `run_pilot11.sh` | pilot | **11-M2 GREEN FINAL 2026-11-14 (A8 formal: m2-run8 all six OK; axcheck 76 lines 0 sorryAx; RedTm2 final 421 LoC)** | 11-M2 revival (authorized A8-3; ahead of 72-M1 Tier-C).
- `research/pilots/75-prework.md` | pilot | landed complete 2026-11-13 (A9; "— end spec"; final report never arrived, treated as done) | Wave-4 abelian-assembly pilot spec.
- `research/pilots/52/`, `research/pilots/20/` close-outs | pilot | CLOSED 2026-11-13 (A8; commits 6263625/26bd2bc) | 52 M1 VERIFIED-GREEN; 20 runs recorded GREEN; ledger §8.
- Sibling donor: `liu-zerofree/` registered 2026-11-13 (AGENTS.md; commit 2d5a663) — read-only reference, probe pending A7/G7.
- `research/pilots/FF-sequencing-memo.md` | pilot | landed 2026-11-13 (A2) | Function-field pilot sequencing memo (71-P2 → 73-C ordering basis for the slot decision).
- `research/pilots/73-prework.md` | pilot | landed 2026-11-13 (A2) | Pilot-73 prework (Hecke–Tate, FF-EZ3 statement-only route).
- `research/TRIAGE-C2-ROWS.md` | P4 staging | landed 2026-11-13 (A9, orchestrator-authorized) | Cycle-2 triage row staging; typesets into TRIAGE § Cycle-2 addendum at decision time.
- `research/REPORT-INPUTS-C2.md` | final input | landed 2026-11-13 (A9, 231 ln) | §C2-conclusion data pack for REPORT.md § Cycle 2 (fills at close-out per the chain in RESUME-BRIEF-C2 § Gate state).
- `research/novelty/liu1-hygiene-sweep.md` | support | landed 2026-11-13 (A1) | Full-tree audit of the registered Liu-1 clone: constant story resolved (README = B_new exactly; entry uses weakened B_r with proved boundary_order), 0 sorry/0 axiom/22-22 names, vendor replay prerequisite.
- `research/AGENTS-C2-DRAFT.md` | charter support | landed 2026-11-13 (A1); **held UNAPPLIED until cycle close** | Draft Cycle-2 conventions addendum for AGENTS.md (3 cited blocks; apply under standing authorization at close).
- `research/qa/tauceti-spotcheck.md` | QA | landed 2026-11-13 (A1-5) | Spot-check driving the tauceti.md fixes-in-place (trivial-and-uncontested class).
- `research/qa/openai-math-spotcheck.md` | QA | landed 2026-11-13 (A1-5) | Spot-check driving the openai-math.md fixes-in-place.
- `research/qa/donor-probes-spotcheck.md` | QA | landed 2026-11-13 (A5, pass Q7) | G-verdict spotcheck: 12 OK / 0 WRONG; G2 fully evidence-backed (13 triad lines, 0 sorryAx); G7b OPEN pending run16 re-run.
- `research/qa/triage-decision-staging.md` | QA/P4 input | landed 2026-11-14 (H) | One-screen orchestrator input brief for the TRIAGE § Cycle-2 §decision typeset: decision frame (slots/gates, not re-litigable), candidate rows (lane N/S/E → A5 tier → empirical cost), gate→verdict map, fill order.
- A5 erratum propagation (2026-11-13): `novelty/CLAIMS-REGISTER.md` row 42 + `novelty/RELATED-WORK.md` carry the DLRT GRH-conditional/fixed-quadratic-K qualifiers (VERDICTS §5.2(c) + REPORT §1 fixed by H; round-4 PART-2 rows updated).
- `research/feasibility/probe/g7_layers.py` + `g7_layers_plan.json` | feasibility/Modal | landed 2026-11-14 (orchestrator) | G7b substrate as 28 cached Modal image layers (prep + chunk0 + 25 topo ~20k-LoC chunks + target), 2 cpu / LEAN_NUM_THREADS=2, chunk memory 8 GB user-approved; `elaborate` re-runs consumer files on the cached top layer without rebuild
- `research/feasibility/probe/modal_telemetry.py` | feasibility/Modal | landed 2026-11-14 | shared `SPEC` (2 cpu / 4 GB) + `@telemetered` (cpu/mem/procs samples, OVER flags, SUMMARY) used by every Modal runner
- `research/feasibility/probe/logs-g/run27–run32` | logs | 2026-11-14 | G7b attempts 5–6: run27 aborted, run28 user-cancelled (over-provisioned), run29/30 telemetry-fix stops, run31 full layered build, run32 GREEN (G7b PASS + R1 GREEN)
- `research/feasibility/probe/logs/step{A-final,B,B-m4b-donor,C}-c2.log` + `research/pilots/*/logs/axcheck-c2-final.log` | verification | 2026-11-14 | Cycle-2 final sweep Steps A–C (ledger §9.F sign-off)
- `research/pilots/50/R1.lean` | pilot | GREEN 2026-11-14 | unconditional ζ strip [1/8, 7/8] + Dirichlet at 7/8 under hFEχ, on the openai donor pin (article 50-M2)

### Cycle-2 close & endgame additions (INDEX refresh, R4 batch B, 2026-11-16)

- `research/articles/10-uniform-poly-space-eth-refutation.md` | article (C2) | FINAL 2026-11-14 (orchestrator promotion, 8a43767) | main-run dossier 10's Cycle-2 article: three proved layers M1/L1/L2 (2,043+529+2,625 LoC; l2-run5-final 151/151 ⊆ triad); headline OPEN, assembly tranche D1–D6 carried.
- `research/articles/42M4-zetaK-proportions-unconditional-zeta-column.md` | article (C2) | FINAL 2026-11-14 | donor-swap upgrade of article 42 (frozen): unconditional ζ-column via direct ZetaZerosV2 import — M4b both routes (1,571/68; m4b2-run2 + donor-tree axcheck; M4-note = A3 formal report).
- `research/articles/50M2-unconditional-strip-confinement.md` | article (C2) | FINAL 2026-11-14 | unconditional ζ strip [1/8, 7/8] + Dirichlet at 7/8 under hFEχ (R1.lean 178 LoC; G7b PASS run32); grows article 50.
- `research/articles/71-splane-zeta-curve-dictionary.md` | article (C2) | FINAL 2026-11-14 | FF s-plane dictionary: W1/W2/HW conditional on WeilData (P2 279/11 triad, p2-run6; pole-family correction).
- `research/articles/72-renyi-monotonicity-nogo-gate.md` | article (C2) | FINAL 2026-11-14 | C-neg no-go gate (369/11 triad, run8-final) + family-265 interface tranche (702+360/25; L3 + interface carried to Iteration 4).
- `research/articles/73-formal-tate-dictionary-function-field.md` | article (C2) | FINAL 2026-11-14 | FF Hecke–Tate statement layer at Tier C (Q0 143 + C.lean 236/7 triad; Q4 carried).
- `research/articles/75-abelian-assembly-zetaL-proportions.md` | article (C2) | FINAL 2026-11-14 (Cycle-2 scope) | ζ_L abelian-assembly entry milestone (Pa.lean 1,557/66; run6-final 17/17 triad; P-b + N2 carried).
- `research/RESUME-BRIEF-C2-ENDGAME.md` | coordination | frozen 2026-11-14 | endgame-chain protocol doc (G7b → R1 → sweep → TRIAGE typeset → REPORT → AGENTS-C2 apply → close); executed as written.
- `research/qa/closeout-commit-plan.md` | QA/process | frozen 2026-11-14 | STEP 1–9 close sequence, STEP-8 gate list + baseline dry-run, git-integrity pre-pass, log-header audit appendix (137 files).
- `research/qa/agents-c2-apply-plan.md` | QA | executed 2026-11-14 | AGENTS-C2 apply plan (E1–E7; applied bf025a1, E2 at d36d62d) + slot-2/3 normalization tail (applied 431a941).
- `research/qa/articles-novelty-signoff.md` | QA | landed 2026-11-14 (A5) | per-article novelty sign-off pass; 75:114 minor fix applied; [G7b] novelty fold note.
- `research/qa/debts-register.md` | QA | live (close record) | carried-debts register: (b)–(e) CLOSED 2026-11-14, (i) CLOSED (431a941); (f)(g)(h)(j)–(m) carried/recorded; next-cycle deferrals cross-listed.
- `research/feasibility/ITERATION4-SCAN.md` | iter-4 input | landed 2026-11-14 (A1) | iteration-4 scan: 13 seeds + substrate §3; [TRIAGE-DECISION]-annotated throughout.
- `research/feasibility/ITERATION4-SEED-DOSSIERS.md` | iter-4 input | landed 2026-11-14 (A1) | seed dossiers for the top NEW-LEAN candidates (LP-duality, AL-3D, ZZV2 λ-family).
- `research/feasibility/ITERATION4-CHARTER-DRAFT.md` | iter-4 input | landed 2026-11-14 (A1; consumed by R9's splice draft) | skeleton §Iteration-4 addendum; live gates resolved at close (A11 wording applied).
- `research/feasibility/ITERATION4-CHARTER-SPLICE.md` | iter-4 input | landed 2026-11-14 (orchestrator) | branch-cut + splice mechanics (STEP 9; dev/iteration4 cut at b1ea051).
- `research/novelty/iter4-seed-triage.md` | novelty | landed 2026-11-14 (A5) | seed triage: 6 NEW-LEAN / 2 POSSIBLY-KNOWN / 4 DONOR-INFRA; AFP re-scope on seed 9 (Lean-ecosystem scope only).
- `research/novelty/knausgaard-as-donor.md` | novelty | landed 2026-11-09 (R8) | main-run donor mapping (rows 02/20/21/22/42/50 deltas; folded into TRIAGE).
- `research/novelty/liu1-as-donor.md` | novelty | landed 2026-11-13 | Liu-1 donor map: §5 DO-NOT-CONSUME as build dep; statement-level citation only (G7-confirmed).
- `research/novelty/physlib-surface.md` | novelty | landed 2026-11-14 (A5) | physlib surface scan (ExchangeSign nearest neighbor; seeds 11/13 input).
- `research/feasibility/lp-duality-bridge.md` | feasibility | landed 2026-11-14 (A1) | LP-duality bridge verdict: mathlib Cone/Basic TODO verified on-pin; AFP-HAS-LP_DUALITY; claim scope = Lean-ecosystem only.
- `research/pilots/20-blueprint.md` + `20-prework.md` + `20-hCZ-NOTE.md` (+ `pilots/20/`) | pilot | main-run; runs recorded GREEN 2026-11-13 (close-out 26bd2bc) | dossier-20 pilot set; hCZ seam note (weakest sufficient form S₁).
- `research/pilots/52-blueprint.md` | pilot | main-run; M1 VERIFIED-GREEN close-out 2026-11-13 | pilot 52 spec (`pilots/52-note.md` the close record).
- `research/pilots/30-falsify-TheoremB-h1.lean` | pilot evidence | GREEN 2026-11-09 (resume session) | kernel refutation of Theorem B at h = 1 (article 30).
- `research/pilots/10/next-tranche-spec.md` | pilot | [CHARTER-PENDING] 2026-11-14 (A6) | assembly-tranche D1–D6 spec; iteration-4 input.
- `research/pilots/{al-3d,lp-layer,zzv2-lambda}-prework.md` | pilot | [CHARTER-PENDING] 2026-11-14 | iteration-4 seed preworks (AL-3D; LP layer; ZZV2 λ-family).
- `research/pilots/72-M1/` (`P72M1T1/T2.lean`, `L3-spec.md`, `make_axcheck72m1.py`, runners) | pilot | FINAL-for-tranche 2026-11-14 (A8) | vendor layer 702 + L1/L2 360/25 kernel-clean (m1-run8; axcheck 52+28 triad-only); L3 + interface carried with spec.
- `research/pilots/73/` (`C.lean`, `P0.lean`, runners) | pilot | 73-C FINAL-GREEN 2026-11-14 (A2) | C.lean 236/7 triad (run6-c-green); Q0 probe 143 first-try.
- `research/pilots/75/` (`Pa.lean`, `Pb-design.md`, runners) | pilot | entry FINAL 2026-11-14 (A4) | Pa.lean 1,557/66 (run6-final; 17/17 triad); P-b design carried.
- `research/pilots/50/` additions (`Dirichlet.lean`, `R1-prework.md`, `R1probe.lean`, `run_r1.*`) | pilot | main-run + R1 GREEN 2026-11-14 | R1 staged on the G7b cached layer (article 50-M2).
- `research/pilots/42/` additions (`M4b.lean`, `M4-note.md`, `M4a-note.md`, `run_m4b2.*`) | pilot | FINAL 2026-11-14 (A3) | donor-swap both routes; M4-note = A3 formal report; M4a-note = superseded-draft pointer.
- `research/feasibility/probe/` remainder (ProbeA2–A4, C1/C2, D, E, F, G7, G7b; `axcheck_probe.py`, `oai_closure.py`, `m4b_donor_axcheck.py` + runners; `run_axcheck.sh`) | tooling | main-run + C2 | port probes beyond :54/:137 and the axcheck machinery (incl. the full-coverage pilot-10 pattern).
- `research/pilots/01/` additions (`port/` 10 files, `master_layer.lean`, `tightness_layer.lean`, `make_port.py`) | pilot | main-run (complete) | the port-bundle layers behind MasterIdentity + tightness.

## Iteration 4 (opened 2026-11-16) — review phase then pilots

Run opened on branch `dev/iteration4` (cut at `b1ea051`, the Cycle-2 close commit);
phase A = Cycle-2 review (9 lanes R1–R9), phase B = pilot execution after the charter
splice. Coordination lives in the two docs below (STATUS.md stays the Cycle-≤2 board).

- `research/ORCHESTRATION-ITER4.md` | coordination | live (H; opened 2026-11-16) | Iteration-4 lane tracker: one row per lane (H + R1–R9) with role / current task / status / last update; maintained by H on orchestrator signal, refreshed in every H batch.
- `research/RESUME-BRIEF-ITER4.md` | coordination | live (H; written at launch 2026-11-16, batches 1–4) | Launch-state continuity doc (unlike C2's, written at launch not wrap): session context, 10-lane protocol, per-lane table mirrored from the tracker, restart instructions, launch gate check (all three Cycle-2 close-out gates resolved), substrate baseline @ launch (sibling pin table, Modal health, xyz-route env-fact correction).
- `research/qa/iter4-review/r9-iteration-plan-draft.md` | review (phase A) | landed 2026-11-16 (R9; batch 5) | Iteration-4 plan draft: filled §Iteration-4 splice for RESEARCH.md (two honesty corrections vs A1's skeleton — 50-M2-R1 G7b staleness, carried-list additions 72-M1 L3 + 10-D1–D6), phase-B launch queues for all 10 lanes (§2), one-page quality gate (6 discovery-strength criteria, article template, two-strike rule, §3), six open decisions (§5); all review-dependent cells [MERGE: Rx]-marked.
- `research/qa/iter4-review/00-DIGEST.md` | review (phase A) | live (H; opened batch 5) | One entry per landed review deliverable (lane / one-line verdict / top-3 findings / open asks) — the post-outage quick-read and R9's integration feed; appended by H at each landing batch.
- `research/qa/iter4-review/r2-discovery-strength.md` | review (phase A) | landed 2026-11-16 (R2; batch 6) | Discovery-strength audit of all 18 articles (both cycles): classes (i)–(v); ≈4–5 genuine (01 > 30 > 32 > 52; 75 = only new statement class, capped); 50-M2/72/42-M4 over-billed; 7 named weak spots (§3); strength bar S1–S4 + 11 demotion/relabel items (§4); 13 direct-source query families on record (§5).
- `research/feasibility/probe/run_iter4_probe.sh` + `iter4_probe.py` | feasibility/Modal | STAGED 2026-11-16 (H; UNRUN — pending R8 runner-kit review) | Iteration-4 generic Modal runner template: byte-identical copy of the pilots/71 image block (layer cache shared; app `crossmath-iter4-probe`), SPEC 2cpu/4GB + @telemetered + LEAN_NUM_THREADS=2 secret, doz CLI; stages modal_telemetry.py locally (R8 §5a gap-2 preference); P0-probe sorry convention carried.
- `research/qa/iter4-review/r4-process-completeness.md` | review (phase A) | landed 2026-11-16 (R4; batches 7–8) | Process/completeness audit both cycles: charter-vs-delivered tables (0 substantive MISSING; 1 delivered-differently), findings F1–F19 (1 MISSING/13 INCOMPLETE/4 WRONG), marker-sweep reconciliation; Part 2 = fixes package (batch A 14 one-liners + batch B INDEX refresh, pre-approved, H-applied; batch C splice-time) + §6 close-protocol addendum for the charter + §7 R2-coupling pass-2 map.
