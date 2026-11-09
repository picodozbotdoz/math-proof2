# cross-math-fronttier — Final Report (2026-11-09)

Status: **FINAL.** Compiled by lane H from project artifacts; §1 integrates the orchestrator's
conclusion with disk counts re-pulled after the final verification sweep
(`feasibility/VERIFICATION-LEDGER.md` §1, §6–§7). All quantitative claims carry their
source file. One research article per discovery: `research/articles/` (index
`articles/README.md`).

## 1. Executive summary

This project set out to discover new mathematics by bridging four Lean corpora — mathlib,
tauceti, openai-math and anthropics formal-math — with Lean as the verification vehicle, not
the research object. In one working day (≈ 9 h on 10 concurrent lanes, plus a close-out
session), the program surveyed **201,134 Lean files / 2,888,273 declarations**, built 5 bridge
maps, wrote and graded **19 candidate dossiers** (novelty: 5 rounds; feasibility: 19/19; QA:
230 citation items, 0 wrong), and kernel-verified first milestones in **9 Lean pilots** —
**6,539 LoC of new pilot Lean plus an 11,068-LoC ported spine** (32 files, 357 theorems,
554 lemmas). The final sweep found all 30 staged files OK (29 direct; one green on re-run
after an extractor-side fix) with 0 `sorryAx`; every axiom set is
⊆ {propext, Classical.choice, Quot.sound}; there is no `native_decide` and no external CAS
(`VERIFICATION-LEDGER.md` §7 sign-off).

**Results (one article each, `research/articles/`):**
- **(01) Inertial defect master identity** — an exact five-defect decomposition of ‖P+Q‖²_F
  refining zeta23's rank–trace inequality, with simultaneous tightness of all five defects on
  the extremal configuration; **proved unconditionally**, the donor theorem re-derived from it
  as a faithfulness anchor.
- **(30) Theorem B refuted; closed form found** — the conjectured Parseval/idempotence
  structure of eth's operators Q_s **fails** at h = 1 (eigenvalues (1, −2, 3, −2, 1) on V₁); in
  its place we **prove** Q_s(t₁,t₁) = [s=0] + |1−s|N_{|1−s|} − 2|s|N_{|s|} + |s+1|N_{|s+1|}
  (number operators N_k): a commuting second-difference family, whence Σ s²Q_s = 4·Euler.
- **(52) Statistics-universal occupation calculus** — the dual-family theorem proved once for
  every statistics sign ε (axioms: propext + Quot.sound only), with the exact char ≠ 2 /
  no-2-torsion boundary of the Pauli principle and a verified fermionic instance on mathlib's
  exterior algebra.
- **(32) Exact savings frontier** of the Corollary-31 certificate class: unique crossing,
  frontier formula Γ(ε) = gammaOf(c*(ε), 0.9), phase transition exactly at ε* = ln 4/(5 ln 10);
  **proved**, with the crossing point as a parameter (constants superseded by Majdoddin
  arXiv:2610.17420; the frontier *function* is new).
- **(42) ζ_K zero proportions for quadratic K** — the first formal zero-density statements for
  any number-field zeta: ≥ 2/3 of zeros on the line with multiplicity, and 5/6-distinct
  modulo an explicit common-zero defect; **proved conditional on explicit binders** (donor
  theorems from zeta23 and Knausgård's clean layer with his externally checked certificate,
  tauceti ported statements). With the defect, this moves the literature's 45%-distinct
  (de Laat–Rolen–Tripp–Wagner 2019) into the 5/6 class.
- **(20) The common-zero seam** — with-multiplicity proportions merge through any
  factorization for free, while every distinct/simple statement degrades exactly by common
  zeros (a simple common zero is a double zero of the product); conditional core proved.
- **(11)** a call-charged reduction calculus with the 3SUM/APSP Theorem 19 as one composition
  (M1 proved); **(50)** a source-verified negative result (zero-free regions cannot move
  window-certificate constants) plus formal 1/8 ≤ Re ρ ≤ 7/8 confinement from quasi-RH;
  **(21)** a certified negative result (the ξ′ quartic window loses to cosine by
  ≥ 3.87·10⁻⁴); **(22)** ψ(x) ~ x assembled from mathlib's own unconsumed Wiener–Ikehara —
  a formalization, not new mathematics.

The Phase-4 triage recommends Lean pilots on **42** (rank ≈ 12.0; now landed), **10** (the
uniform-in-k ∧ min-rate ∧ polynomial-space ETH refutation, a conjunction claimed by no prior
work; G1 audit returned CASE A, so GO is unconditional; nothing proved yet) and **01** (rank
7.0; complete). Alternates are 41, 11 and 30 (30's Theorem A, the ω-twisted Hall
identification, remains open; its Theorem B is now settled).

The strategic lesson is written into the portfolio. The ζ-constant race had already been
lost at a monthly cadence (Knausgård; two independent Lean build-outs besides ours), so the
surviving novelty lives in structure, cross-L-function and cross-model statements. The
sharpest open seam this project formalized is **hCZ**: control of common on-line zeros of ζ
and L(χ_D). It requires at least S₁ = o(N) (simple–simple coincidences), plus density-zero
multiplicity of both factors for sufficiency (erratum to `pilots/20-hCZ-NOTE.md`). It is
invisible to every per-function statistic and conjecture-grade today.

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
- **Modal usage** (per VERIFICATION-LEDGER): apps `crossmath-probe` / `crossmath-pilot-32`,
  image elan + v4.36.0-rc2 + mathlib `ff2494ea` with 8,710 cached olans; 10 probe runs (cold
  ≈ 3 m 45 s; warm 68 s–2.5 m) + all pilot runs, 76 persisted logs + the final 29-file axcheck
  batch (`pilots/*/logs/axcheck-final.log`) — transcripts cited per artifact in the ledger.

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

Full status — novelty verdicts, re-scopes, effort grades, pilot states, final ranks — lives in
the **canonical TRIAGE matrix** (`TRIAGE.md` §Candidate scores, FINAL). Capsule: 6 dossiers
hold N ≥ 4 after adjustment (10, 11, 12, 30, 31, 41); the Knausgård race demoted 01/02/21 to
HOT re-scopes and made 22 strategically dead (stop-at-M4); 42/50's donors accelerated their
assembly pilots; dossiers 51/60 are ecosystem feeders by design. Every dossier carries an
outcome or re-scope append where a pilot ran (01, 02, 11, 20, 21, 22, 30, 32, 42, 50, 52).
Links: `candidates/NN-*.md` (R8-verdict-aware text, R9 F4 section, H's QA'd citations —
all deferred locator fixes applied per `qa/dossiers-spotcheck.md` Part 5).

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

## 7. Proved Lean artifacts ledger (ours; kernel-only)

**Canonical source: `feasibility/VERIFICATION-LEDGER.md` §1 (FINAL) + `pilots/*/logs/axcheck-final.log`.**
Final sweep: 30/30 files OK (29 direct + one re-run after an extractor fix), 0 sorryAx;
tool-tallied 413 theorem-axiom lines, all ⊆ {propext, Classical.choice, Quot.sound}
(323 captured verbatim: 307 triad, 16 `[propext, Quot.sound]`).

| pilot | headline declarations | posture |
|---|---|---|
| 01 | `master_identity`, `rank_trace_mult_k_of_master`, `tightness_of_master` (+ 8-file ported spine) | unconditional |
| 30 | `TheoremB2_refuted_h1` (+ faithfulness checks); `Qh1_closed_form`, `Qh1_monomial`, `Qh1_comm_monomial` | unconditional |
| 52 | `dual_family`, `sign_transposition`, `fermionic_create_sq`, `fermionicPair` | unconditional |
| 32 | `frontier_of_crossing`, `frontier_nonempty_iff`, `ceiling`, `crossing_unique`, `lnΛ_10_0` | crossing point as parameter |
| 42 | `zetaK_two_thirds_landed`, `zetaK_distinct_five_sixths_landed`, `…_of_negligible` | donor/cert/tauceti binders (+ `hCZ` for the last) |
| 20 | `instantiate_family_*`, `family_to_*`, `family_merge`, `merged_mult_of_common` | engine-card binders |
| 11 | `Red.comp`, `theorem19_of_red` (donor type exactly) | abstract cost model |
| 50 | `strip_confinement*`, `strip_confinement_dirichlet` | `hQRH` (+ `hQRHχ`, `hFEχ`) |
| 22 | `tendsto_psi_div_atTop` (ψ(x)/x → 1), M1–M3 | unconditional |

Pilot 21 (milestone C) is a numeric certification outside Lean
(`cStar(1) − cFun_quartic ≥ 3.870·10⁻⁴`, exact rationals + interval Taylor bounds) — reported
as certified, not as kernel-verified. Probes (R9): 13 files / 673 LoC, elaboration-probe
convention (9 stub sorries in header-justified non-proof files, never cited as results).
Donor material enters only as verbatim elaboration targets, explicit hypothesis binders
(42: cert/ThmE/tauceti; 50: hQRH), or ported-and-re-proved code with provenance headers; the
one sanctioned deviation is clean-layer consumption with certificate binders (EnclOK pattern).

## 8. Top-3 recommendations for Lean pilot (DECIDED — orchestrator, charter Phase 4)

1. **42 — ζ_K zero-density proportions** — **landed**: M1 → M2a → M3 → M2b all green
   (2,552 LoC, 115 theorems), landing theorems axioms-clean; value = the assembly
   architecture + the first formal ζ_K statements + the certificate-binder consumption
   template (constant race lost to Knausgård; no constant claimed). Article 42.
2. **10 (Z3) — uniform-in-k ∧ min-rate ∧ polynomial-space ETH refutation** — G1 audit
   **CASE A** (`pilots/10-prework.md:262`): the W3 wall dissolves (piece count polynomial;
   the pad is exponential only on the time side), so GO is unconditional, effort M,
   L3-first (space-annotated `exists_tm` as first milestone). **M1 (= L3) landed 2026-11-10**:
   `Groundwork.exists_tm_space` (`pilots/10/M1.lean`, 2,043 LoC) proves eth's host machine runs in
   eth's time AND within polynomial-in-|x| stack space for every t, unconditionally (no binders),
   axioms ⊆ {propext, Classical.choice, Quot.sound} on all 135 theorems; remaining = L1 counter
   combinators and L2 `PolyTVal` for the padded-machine assembly (`pilots/10-blueprint.md`).
3. **01 — inertial defect-form master identity + tightness** — **complete**: identity,
   faithfulness anchor and simultaneous tightness proved; remaining = corollaries A2/A3/A5 and
   upstreaming. Article 01.

Alternates: 41, 11 (M1 complete — article 11), 30 (Theorem B refuted + closed form proved —
article 30; Theorem A open). Excluded: 22 (strategically dead pilot category; M4 proved anyway
— article 22), 21 (absorbed; certified negative — article 21), 51 (killed). Dossier 02's final
re-scope (novelty 5 → 3.5; Knausgård's `Ceilings/` anticipates the program shape; LP weak
duality is the rate-limiter) is recorded in its dossier. Full decision log: `TRIAGE.md` §Top-3.

## 9. Ground-rules compliance statement

Per `feasibility/VERIFICATION-LEDGER.md` §7 (final-sweep sign-off): all kept pilot artifacts
elaborate on mathlib `ff2494ea` (v4.36.0-rc2) with standard axioms only; no `sorry`, no
`native_decide`, no external CAS in any artifact of this project. The only `sorry` tokens in
the tree are the 9 probe-convention stubs (sorry-token classifier, 45 files). Donor caveats:
Knausgård's headline theorems carry `native_decide`; we bind only to his clean `*_of_local`
layer, with the certificate as an explicit hypothesis (the posture of zeta23's own `EnclOK`).
openai/anthropics donors enter as statement-level citations or Prop-binders, never as imported
proofs. Sibling repos were read-only throughout (only `research/**` written in this repo).
Known-attribution hold: dossier 60's ⟨3,3,3⟩ border-rank-≤21 attribution is unverified (R8
flag — do not assert). Numeric certification (pilot 21) is outside the kernel standard and is
labelled as such everywhere.

## 10. File index

- Charter/coordination: `RESEARCH.md`, `STATUS.md` (lane board, deferred-fix register),
  `INDEX.md`, `TRIAGE.md` (19-row matrix, final scores, Top-3 decision log).
- Surveys: `survey/{anthropics,mathlib-frontier,tauceti,openai-math}.md`.
- Bridges: `bridges/{complexity,linear-algebra,analytic-nt,tensor-algebra,tauceti-contributions}.md`.
- Candidates: `candidates/TEMPLATE.md` + 19 dossiers `NN-slug.md` (F4 sections inside).
- Novelty: `novelty/{round-1,round-2,round-3,VERDICTS,knausgaard-as-donor}.md`.
- Feasibility: `feasibility/{mathlib-verification,port-probe,mathlib-assembly-maps,
  FEASIBILITY-SUMMARY,VERIFICATION-LEDGER}.md` + `probe/` (SUMMARY = canonical 19-row effort
  table; LEDGER = canonical artifact/compliance table).
- Pilots: `pilots/{01,10,11,20,21,22,30,32,42,50,52}*` (blueprints, notes, work dirs, run logs,
  `logs/axcheck-final.log`).
- **Articles (one per discovery): `articles/README.md` + 10 articles `articles/NN-*.md`.**
- QA: `qa/{anthropics,mathlib-frontier,bridges,dossiers}-spotcheck.md`,
  `qa/{make-decl-index.sh,decl-index.tsv}`.
