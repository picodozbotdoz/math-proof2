# FEASIBILITY-SUMMARY — Phase-4 triage input (all 19 dossiers)

Lane R9, 2026-11-09 (round 6). Consolidates every F4 grade appended to
`research/candidates/*.md` with the empirical evidence base:
`research/feasibility/mathlib-verification.md` (round 1, rg),
`research/feasibility/port-probe.md` (rounds 2–5; Modal runs 1–10 against
mathlib `ff2494ea`, toolchain v4.36.0-rc2). Effort score per triage rubric
S=1, M=3, L=5, ±1 for split grades. "Statement-port" = measured cost of
elaborating donor STATEMENTS on v4.36 (probes B1/B2/B3/C1/C2/D/E/F);
"family precedent" = same statement family probed clean, the specific file not.

| # | Dossier (short) | F4 grade | Score | Key blocker / glue (one line) | Stmt-port | Pilot evidence | Toolchain friction | Notes (evidence) |
|---|---|---|---|---|---|---|---|---|
| 01 | inertial-defect master identity | M | 3 | A4(iv) vN equality case (Birkhoff support); rest is named-remainder algebra | ≈0 (B1 run 1) | not-started | none (zeta23 stmts clean) | all 3 statements + 5 defs verbatim 0 err; F1 9/9 OK (A3 run 4) |
| 02 | bandwidth-k ceiling laws | M core / L full | 3–4 | Theorem E discretization-quotient (LP form); Q2 open by design | ≈0 (ProbeD run 6) | pre-condition discharged (round 4) | none (PairCeiling stmts clean, donor imports intact) | interval-integral zone probed clean after my `encl` typing fix |
| 03 | compression rank-trace | S | 1–2 | two-step composition + Matrix↔LinearMap transport (~150 LoC) | ≈0 (B1) | not-started | none | F1 fixed: root `sigPos`/`sigNeg`, `Matrix.isSymmetric_toLin_iff` (A4/A3) |
| 10 | uniform poly-space ETH refutation | M | 3 | pad-compression normal form (or clocked simulation) | ≈0 (B2 eth shape) | not-started | OAI closure-heavy if monitor imported (2569 files/484k LoC) — pattern-only per F2 | all Turing anchors probe-verified (A) |
| 11 | composable reduction theory | M (ms-1 S) | 3 | `Ends` substitution-congruence + TM2 call-charging realization | ≈0 (B2+B3) | not-started | none statement-level | both statement layers verbatim clean; ToTuring stays in-tree (S-iface/M-full) |
| 12 | parametric savings fn in ω | S–M (core) | 2–3 | symbolic re-instantiation of route lemmas; F3b = model-gap transfer | ≈0 (C2: Model.lean verbatim, depth-0) | not-started | OAI closure-heavy only if bound imported (AuxSep 129 files/20.7k LoC; Witness 78/13.7k) | bound-import priced M add-on |
| 20 | Hecke ζ_K zero-density | M–L | 4 | χ-analogue of the ξ′/ξ device (driver) + Hecke-family assembly | zeta23 ≈0 (E); OAI binder | not-started | OAI Hecke subtree closure-heavy (DirichletL sibling = 2924/486k) | F1 corrected 3×: `HurwitzZeta.hurwitzEvenFEPair`, add-family names, `Complex.Gammaℝ/ℂ` (F runs 9–10) |
| 21 | quartic window thmD | M / M–L | 3–4 | (A1) optimality inequality — pure analysis driver | ≈0 (ProbeD covers PairCeiling side) | not-started | none | (A2) `EnclOK`-conditional as in donor |
| 22 | quasi-RH → effective PNT | S (Tier-1 remainder) | 1–2 | effective-error assembly over green M1 | ≈0 (C1 + A2 sigs) | **GREEN-milestone** (pilot 22 M1 kernel-proved, `run4.log` OK) | OAI binder-validated (C1/E) | Tier-2 donors = Ostmann closure if imported — binder route |
| 30 | Hall–Parseval–Boson identification | M | 3 | ω construction + sign rule + involution (new module) | ≈0 mathlib (F run 10); eth family; tauceti same-toolchain | not-started | none (tauceti v4.36.0-rc2 zero-friction; hallInner rg-verified, path corrected) | Theorem B = L-if-attempted; tauceti #check deferred to pilot |
| 31 | budgeted-split meta-theorem | M | 3 | `LevelSystem`/`AntitoneSavings` + sInf-sup packaging | ≈0 (B2/B3 family) | not-started | none statement-level | shares step-3 glue with 32 — bundle amortizes |
| 32 | Rc savings frontier | S–M | 2 | γmax monotonicity derivative inequality + interval assembly | ≈0 family (B3); PaperStatements defs re-check = 1 warm run | not-started | none (no OAI dependency — an advantage) | zero-drift record: 7 clean statement files, 0 drift hits |
| 40 | ζ_K′ zeros | M–L | 4 | step-3 χ-analysis (M–L driver) + XiPrime EF proof port (M) | zeta23 ≈0 (E); tauceti zero-friction | not-started | zeta23 proofs only | split halved: tauceti imports as-is (toolchain identical) |
| 41 | q-deformed eight-square TL | S–M | 2 | (N) decide driver + (H) finite TL search (separate milestone) | ≈0 (eth core-Lean family, B3 precedent) | not-started | none (tauceti zero-friction) | novelty risk dominant (R8), not effort |
| 42 | ζ_K 2/3 product assembly | S | 1 | step-1 continued-product glue + hypothesis restatements | ≈0 (ProbeE = its exact posture, runs 5–6) | **validated-posture** (ProbeE) + blueprint M1 staged | none (tauceti zero-friction; zeta23 via binders) | cheapest NT-cluster candidate; M1 de-risked |
| 50 | quasi-RH truncated-window constants | S (S1+S2) | 1–2 | trivial-zero id lemma + χ-reflection; S3 optional M | ≈0 (C1 statement standalone; E binder) | validated-posture (binder) | OAI closure-heavy only if library stmt imported (2924/486k) — interface-hypothesis route mandated | F5 biggest risk discharged by C1 |
| 51 | ω → word-RAM bit bridge | M | 3 | gate-to-RAM compiler + entry-growth invariant | ≈0 (C2 = the Gate ontology verbatim; B3 word-RAM) | not-started | OAI bound import closure-heavy — abstract `DivisionFreeProgram` interface decouples | `omega_lt_source_constant` path corrected (MatrixFields/Conclusions) |
| 52 | unified CCR/Fock layer | M | 3 | sign-universal insert/erase calculus + dual-family theorem | ≈0 mathlib (F); OAI defs Model.lean-category; eth B-pattern | not-started | none via binders; tauceti zero-friction (CAR/Occupation verified) | OAI paths corrected: `Analysis/Naimark/CAR.lean`, `Analysis/Laughlin/Fock/*` |
| 60 | border-rank first connector | S | 1 | MvPolynomial→Tensor trilinearization transport (~100 LoC) | ≈0 (ComplexDotPairing closure 1 file/778 LoC/depth 0) | not-started | none (OAI side self-contained) | `Holor.cprank` EXISTS (:333) — mirror cheaper than assumed; RankExponent path fixed |

Cross-cutting facts for triage (all probe-cited):
- **Statement-port cost is ≈0 corpus-wide**: 8 verbatim/probe files clean (B1 zeta23 LinAlg,
  B2 eth, B3 3sum, C1 OAI quasi-RH, C2 OAI Model, D PairCeiling, E zeta23 A–D binders,
  F mathlib batch) with zero v4.33/v4.34→v4.36 statement drift; every observed failure was
  a name/namespace/path error on the citing side (all corrected and re-verified: runs 2, 4, 9, 10).
- **Effort lives in proofs and new mathematics**, exactly as the S/M/L rubric expects;
  the only L-graded items are dossier-02-full (external τ₂ enclosures), 20/40 (analytic
  drivers), and optional extensions (30-B, 32-C, 50-S3).
- **Toolchain friction is solved by pattern**: zeta23 statements → binder types (ProbeE);
  OAI library statements → closure-heavy, re-anchor as interface hypotheses (closure stats
  §7.2); tauceti → direct dependency (same toolchain, verified).
- Cheapest verified paths into pilots: 42 (S, posture-validated), 22 (S, milestone green),
  60/03/50 (S, statement-ports clean or standalone).
