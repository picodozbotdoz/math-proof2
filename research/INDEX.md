# INDEX — annotated index of research/

One line per file: path | phase | status | content. Verified against disk 2026-11-09
(`ls -R research/`). Files marked [expected] do not exist yet; they appear here because
a lane owns them (see STATUS.md). H updates this index as files appear.

## Charter & coordination

- `research/RESEARCH.md` | — | stable | Research charter: objective, Phases 1–4, ground rules (discovery-first; kernel-only verification; exact citations).
- `research/STATUS.md` | — | live | Coordination board: lane table, phase pipeline, file-ownership rule.
- `research/INDEX.md` | — | live | This file.
- `research/REPORT-INPUTS.md` | final input | DONE 2026-11-09 19:58 (H) | Orchestrator's §1-conclusion data pack: headline-numbers block + §A scale (QA recompute 230 items / 193 OK / 37 minor / 0 WRONG) + §B verification (final-disk) + §C decision + §D timeline (3 pivots 19:26–19:31). Every number file-cited.
- `research/REPORT.md` | final | **FINAL** (≈2.4k words) | §1 executive summary integrated with final-sweep counts; §7 final proved-artifacts table; §8 Top-3 outcomes; §9 signed-off compliance.

## Phase 1 — surveys (research/survey/)

- `research/survey/anthropics.md` | P1 | DONE (maintainer: H) | Survey of anthropics_formal-math (3sum-apsp, eth, zeta23): territory, sorry inventory, external deps, bridging hooks. QA fixes applied 2026-11-09.
- `research/survey/tauceti.md` | P1 | landed 2026-11-09 (R1; DONE pending confirmation) | Survey of tauceti: AI-authored mathlib-downstream library of record scale (universal covers, reductive groups, Floer homology, …); git `d92acc5c0`. Not yet QA'd.
- `research/survey/openai-math.md` | P1 | landed 2026-11-09 (R2; DONE pending confirmation) | Survey of openai-math: largest corpus (721 manuscripts, ~29.7M Lean lines); family-granularity map + deep dives on bridging targets. Not yet QA'd.
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
- `research/feasibility/VERIFICATION-LEDGER.md` | P4 input | DONE 2026-11-09 19:38 (R9 round 7) | Canonical Lean-artifact ledger: per-pilot files/LoC/theorems, proved-milestone vs FAIL vs [runs-unrecorded] statuses, probe conventions, compliance statement. FEASIBILITY-SUMMARY no longer pending.
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
- `research/pilots/*/logs/` | evidence | R9 log-rescue LANDED | Per-pilot Modal run logs incl. `axcheck-run1` (axiom/sorryAx audit: 42-M1 OK 15/0, 50-M1 OK 4/0, 11-T2 OK 19/0; 52-M1 FAIL mid-iteration); `pilots/_unattributed/` holds one unplaced run (pilot52_run2).

## QA (research/qa/)

- `research/qa/anthropics-spotcheck.md` | QA | DONE 2026-11-09 | Spot-check of 12 citations from survey/anthropics.md against the anthropics_formal-math repo: 11 OK, 1 minor error (fixed in survey same day).
- `research/qa/mathlib-frontier-spotcheck.md` | QA | DONE 2026-11-09 | Spot-check of 12 mathlib-frontier.md claims (9 OK, 3 minor) + 4 re-checks of R9's mathlib-verification.md (3 OK, 1 minor) vs mathlib checkout `ff2494ea`. Fixes applied same day with errata.
- `research/qa/bridges-spotcheck.md` | QA | DONE 2026-11-09 (two passes) | Pass 1: complexity.md 9/10 OK, linear-algebra.md 10/10 OK. Pass 2: analytic-nt.md 8/10, tensor-algebra.md 8/10, tauceti-contributions.md 5/10 (all minors locator-level; ξ-pair factor-2 arithmetic CONFIRMED; Clifford-present/octonions-absent both halves hold).
- `research/qa/dossiers-spotcheck.md` | QA | DONE 2026-11-09 (four passes — all 19 dossiers covered) | P1: 01/02/03/10/11/12 — 41/48. P2: 20/21/22/40/41/42/50/60 — 55/64. P3: 30/31/32 — 22/24. P4: 51/52 — 12/16. Totals: 130/152 OK, 22 minor, 0 WRONG; deferred-fix register in STATUS.md.
- `research/qa/make-decl-index.sh` | tooling | DONE 2026-11-09 (H) | Re-runnable rg-based builder of the cross-corpus declaration index; usage header documents novelty-check recipes and caveats (ASCII names, prefixed/noncomputable headers excluded — use direct rg fallback).
- `research/qa/decl-index.tsv` (gitignored, 273 MB; tracked only as `decl-index.tsv.zip` — unzip or re-run the builder) | tooling output | built 2026-11-09, 8.7s wall | 2,888,273 decl rows: openai-math 2,439,960, tauceti 242,275, mathlib 184,207, eth 10,148, 3sum-apsp 6,795, zeta23 4,888. **Caveat for novelty checks:** the OAI tree includes mathlib-like vendored content (2.4M decls), so a TSV miss is NOT evidence of absence in openai-math — always also run targeted `rg` in `openai-math/lean/OAI/`, `openai-math/lean/ComparatorChallenges/`, and `openai-math/preprints/` (manuscripts are not indexed at all).

Nothing remains [expected]: every file owned by a lane is on disk (project closed 2026-11-09).

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
- `research/feasibility/axiommath-bump/` | feasibility | run1 2026-11-13 | AxiomMath clones bumped to v4.36.0-rc2/ff2494ea: Challenge statements 3/3 OK; ZetaZeros build 2 failing modules; ZetaZerosV2 blocked at lake update (cache fetch).
