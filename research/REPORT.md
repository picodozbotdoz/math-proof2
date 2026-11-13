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
  (de Laat–Rolen–Tripp–Wagner 2019 — GRH-conditional, fixed quadratic K
  [erratum 2026-11-13, A5 P2-3 audit, applied by H]) into the 5/6 class.
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

## Cycle 2 addendum (opened 2026-11-13; pre-staged 2026-11-14 for close-out fill-in — H)

Cycle 2 (charter addendum `RESEARCH.md` § Cycle 2, commit `313c506`) re-runs the Phase 1–4
pipeline over the AxiomMath corpus — six sorry-free repos (`axiommath/`: DedekindZetaZeroFree,
ZetaZerosV2, ZetaZeros, PrimeNumberTheoremAnd, Weil, AreaLaw2D) that as of 2026-11-13 build on
our exact pin (mathlib `ff2494ea`, v4.36.0-rc2 — `feasibility/axiommath-bump/`) and are
therefore **consumable Lean donors**, not just references — while closing the main run's open
pilot items (10-L1/L2, 52 fix-or-close, 20 close-out) and executing the new donor-swap pilots.
Inputs staged from `REPORT-INPUTS-C2.md` (A9, 231 ln). **Fill-in convention:** bracketed
placeholders `[PILOT-VERDICT:*] / [G7b] / [SWEEP] / [TRIAGE-DECISION]` are the only cells H
still fills at close-out, per the chain in `RESUME-BRIEF-C2.md` § Gate state. Main-run §2
method and §9 compliance standard (kernel-only, no sorry/native_decide/external CAS) carry
over verbatim.

### C2.1 Cycle-2 discoveries (70-series)

One block per dossier; headline + category + novelty tier landed (A5 round-4 / VERDICTS C2
rows), pilot outcome slot per pilot pipeline.

- **(70) Unconditional ζ_K zero confinement (Part A; Part B split to 75).** DZDF's
  Cureton–Thorner theorem on our pin discharges the *weakened* 31/32 binders, upgrading pilot
  50's conditional confinement core to unconditional parametric strips [1−θ, θ] (31/32 =
  DZDF instantiation) for ζ (K = ℚ, three glue lemmas), Dirichlet L (only `hFEχ` left), and
  ζ_K/Hecke for totally complex K (DZDF's own Hecke FE + Λ↔f transfer). Category:
  ECOSYSTEM/GLUE posture upgrade; per-class split — no first-claim for ζ/Dirichlet at
  7/8-or-better (Liu-1 external repo + openai tree own that class), **ζ_K/Hecke first-claim
  holds** on the Liu-2 clock. A5: "artifact-grade (no discovery N)", HOT-cluster /
  WARM-artifact. Pilot: 50-M2 spec landed (`pilots/50-M2-31-32-spec.md`); route R1 (openai
  in-corpus 7/8) gated on **[G7b]**, route R2 (DZDF 31/32) statement-level only per G1b FAIL,
  route R3 (Liu-1 full-strength binder) statement-level until G7. Clock-sweep must-cites
  folded by A9 (Chang–Wang 2611.00924 conditional frontier; Ji 2611.16665 ζ_{Q(i)}; 13-repo
  QR-D Lean landscape, no ζ_K formal artifact anywhere).
- **(71) Function-field s-plane dictionary.** The first formal s-plane zeta of a curve —
  ζ_C(s) := Z_C(q^{−s}) meromorphic (poles exactly {0,…,d}), every nontrivial zero exactly on
  Re s = 1/2 (function-field quasi-RH, DZDF statement shape), uniform Hasse–Weil point-count
  transport, and the anti-CT window-comparison corollary (step-function density at 1/2 vs the
  number side's 31/32) — the dictionary every other FF zone consumes. Primary GLUE/
  formalization-first (Weil 1948 math-known); FF-EZ2-family secondary DISCOVERY-grade
  [HYPOTHESIS], flagged not-pilot. A5: primary "formalization-first (dictionary value)",
  WARM (Suzuki 2610.41115 month-clock). Pilot (slot 1, A2): P0 OK + P1 GREEN (7/7
  kernel-clean, triad; 243 LoC total) → outcome **[PILOT-VERDICT:71-P2]** (P2 landing
  theorems: W1 s≠1 pole exclusion → W2 → HW; first P2 run at relaunch: FAIL rc=1 errors=6
  sorry=0, iterating).
- **(72) Area-law inertial defect.** Post-Kuwahara restructure: the gap-to-inertia dictionary
  (HasGlobalGap ⇔ `posIndexAbove θ (E₀−H) ≤ 1`, provable now; isometric-B erratum applied),
  a purity (α = 2) certificate route [HYPOTHESIS] via pilot-01's PROVED master identity, a
  formalizable Kuwahara no-go gate (Rényi monotonicity ⟹ rank ≥ e^{S_α}), and the AL-EZ3
  interface theorem discharging openai-math's unproved PEPS `UniformAreaLaw` from
  AreaLaw2D's `AreaLaw.areaLaw` as M1. P1 + C-neg formal-new glue; P2 the zone's only
  surviving discovery claim. A5: P1 "formal-new (moderate)", C-neg "precedent-backed (50/30
  lineage)", WARM; hard NO-GO honored on literal rank statements. Pilots: C-neg gate —
  honest FAIL-in-flight at the outage (run5: rc=1 errors=7 sorry=0) → outcome
  **[PILOT-VERDICT:72-C-neg]**; then M1 Tier-C (slot 3, A8, after 11-M2; zero import
  gates — G5a only upgrades provenance, staging in flight run20).
- **(73) Function-field Hecke–Tate (CONDITIONAL-CORE, Stacks-blocked).** The FF Hecke-L
  statement class in the DZDF `heckeCorollary` shape with every Weil-side input a binder
  (`hTate`/`hRat`/`hPur`): (i) rationality/continuation, (ii) RH-form with window exactly
  1/2 (anti-CT at the Hecke level), (C1) the 𝔽_q(T) probe — `hRat` dischargeable
  (elementary periodicity), `hPur` STAYS A BINDER (RH for Kummer covers — deep), so (C1)
  lands (i) unconditional + (ii) conditional; (C2) three-corpus window comparison
  (1/2 vs 31/32 vs B_new); (C3) proportion extensions fenced off (trap-reasoned). Highest
  ceiling of the 70-series, least claimable today; Tier A blocked (StacksFrontier ~63k
  modules un-cloned; priced ceiling, not a slot). A5 row: zone WARM, dossier-level query
  re-run owed (Rosen chapter pin). Pilot (slot 1b, A2): 73-C skeleton Q0→Q3, STOP before Q4
  → outcome **[PILOT-VERDICT:73-C]**.
- **(74) Surprisal moment-hierarchy ceilings (A4).** Owns AL-EZ2 outright: T1 two-sided
  window theorem, T2 class-inclusion ladder, T3 LP core contingent on dossier-02's unclaimed
  layer, T4 method-barrier corollary; consumer = AreaLaw2D's 3D bottleneck C.3. Boundary note
  vs 72: no statement overlap, no inheritance of the 72 §P1 erratum. No Cycle-2 pilot
  (u≠1 dossier edit queued to A4). Block data: `candidates/74-*.md`.
- **(75) Abelian-assembly ζ_L proportions (70-Part-B split-out).** DZDF's
  `dedekindAbelianQuotient`/`abelianFactorization` (ζ_L = (∏ nonprincipal Hecke L)·ζ_K, every
  abelian L/K) turns pilot 42's proved two-factor assembly into n+1-factor landing theorems
  for ζ_L — the first zero-proportion (and real-abelian strip) statements for any ζ_L —
  with the component-proportion binder schema as the named open core and the
  partially-unconditional K = ℚ accounting (ζ-side discharged by V2 per 42-M4; Dirichlet side
  zeta23-conditional). A5 (P2-3 flip resolved): DLRT 1908.04876 is SCOPED (fixed quadratic K,
  GRH-conditional) ⇒ primary NOT math-known ⇒ N stays 4; WARM. Pilot: DEFERRED wave-4 (spec
  complete, `pilots/75-prework.md`); entry (P-a)+(C1)@2/3 when slotted.

### C2.2 Donor-discharge outcomes

- **G1a/G1b (DZDF)** — statements elaborate verbatim on our pin; full build FAILS (62
  errors / 11 vendor-CFT modules, v4.35 blocker) ⇒ 50-M2-R2 stays statement-level
  (`hDZ` binder), 20's Hecke object layer switch openai→DZDF = note only.
- **G2 (ZetaZerosV2)** — build OK on our pin (8,262 jobs, 13 triad axiom-lines, 0 sorryAx)
  ⇒ 42-M4b-upgrade gate CLEARED (direct V2 import); evidence `qa/donor-probes-spotcheck.md`
  (Q7: 12 OK / 0 WRONG).
- **G3 (Weil binder-route)** OK — statements as hypothesis binders, zero import gates.
- **G5 (Physlib premise)** — import real via `QuantumInfo.ForMathlib.Matrix`
  (PartialTrace.lean:4); staging cost stands; G5a re-run in flight (run20).
- **G6 (tauceti locator / Stacks pricing)** OK / G6a re-run in flight (run21).
- **G7 (Liu-1)** — pins exact (`7d10420`); **[G7b]** = donor-pin axiom audit (run16
  outage-killed; re-run run19 in flight) — the kernel-facing hygiene gate for 50-M2-R1
  and Liu-1's promotion from statement-level.
- Sources: `feasibility/axiommath-donor-probes.md`, `novelty/axiommath-as-donor.md`,
  `novelty/liu1-hygiene-sweep.md`.

### C2.3 Cycle-2 pilot outcomes

| Pilot | Item | Outcome |
|---|---|---|
| 52 | unified CCR Fock close-out | **CLOSED-GREEN** (A8, 2026-11-13): verified-green reproduction, axcheck 15 axiom-lines 0 sorryAx; ledger §8 |
| 20 | hecke-zetaK close-out | **CLOSED-GREEN** (A8, 2026-11-13): runs recorded, axcheck 36 axiom-lines 0 sorryAx; hCZ seam unchanged |
| 10-L1 | counter combinators | **GREEN + axcheck-clean** (A6, 2026-11-13; 529 LoC / 25 thms, logs l1-run1..4-final) |
| 10-L2 | `PolyTVal` | **[PILOT-VERDICT:10-L2]** (2,595 LoC / 126 thms on disk; Part-D defect fixes + first run pending at relaunch) |
| 11-M2 | reduction-theory tier 2 (A8-3) | **[PILOT-VERDICT:11-M2]** (P11T3 1,100 LoC / 88 thms + RedTm2 on disk; four pinpoint fixes mid-application at outage; no run yet) |
| 42-M4 | V2 donor-swap (A3) | M4a **GREEN + axcheck-clean** (1,194 LoC / 52 thms; logs m4-run2, m4-axcheck-run1); M4b fallback layer **[PILOT-VERDICT:42-M4b]** (1,560 LoC / 66 thms; run1 FAIL err=3 sorry=0 → 12-line Fix-C → **run2 GREEN 2026-11-14** + `m4b-axcheck-run1` triad-only 0 sorryAx); next: M4-note + the CLEARED direct-V2-import upgrade (≤20-line delta) |
| 71-P2 / 73-C | FF slot 1 (A2) | P0+P1 GREEN; **[PILOT-VERDICT:71-P2]** + **[PILOT-VERDICT:73-C]** |
| 72-C-neg | Kuwahara no-go gate (A4) | **[PILOT-VERDICT:72-C-neg]** (run5 FAIL-in-flight: rc=1 errors=7 sorry=0, descent 20→7; N1–N3 fix path per Appendix A) |
| 50-M2 | 31/32 strip (A3, gated) | R1 gated on **[G7b]**; R2 statement-level (G1b); R3 Liu-1 binder statement-level until G7/G7b |

### C2.4 External race report (QR-D cluster + FF/AL clocks)

- **QR-D cluster, six papers in six weeks + two external Lean artifacts** (round-4 §3 + §5.1–
  5.3): Ope26a 7/8 (ζ included, Lean = sorry challenge) → Ope26b 11/12 + Landau–Siegel
  corollary → Liu-1 B_new = 0.8749570 incl. ζ + every Dirichlet L (**formalized**, public
  repo, registered sibling) → Xu–Sang 0.8748867 conditional → CT 31/32 every number field
  (**formalized** = our DZDF donor) → Liu-2 B♭ = 0.8748866 uniform over all K incl. ζ_K
  (informal, Lean in progress). Informal frontier below 7/8 uniformly ⇒ pilot 50's `hQRH`
  TRUE informally (Liu-1 Cor 14.1). Ecosystem sweep: 13 QR-D Lean repos incl.
  Kontorovich/quasi-rh (11/12 ζ+Dirichlet, NO ζ_K) — the ζ_K-strip per-class split SURVIVES.
- **Clocks:** Suzuki 2610.41115 (FF ζ_C method-neighbor, month-scale); Knausgård clock
  (main-run §6) still dominant on the number side; upstream PNT+ `AlexKontorovich/
  PrimeNumberTheoremAnd` @ 938912bb now PROVES StrongPNT triad-clean ⇒ **22's Tier-2 T2b
  CLOSED-BY-UPSTREAM** (T2a quasi-RH-conditional survives as 22's only open content;
  DEFER-WATCHLIST with triggers T1–T3, not cloned). Kuwahara 2610.15199 no-go alarm —
  issued as a standing alarm BEFORE dossier drafting; 72 restructured pre-write.
- **Archive caveat:** hexagonmath.org sweeps are ORCID-gated ⇒ PASS-conditional evidence
  only; recorded on every affected absence claim. GTimG/QuasiRiemannTracker audit pending
  (A5, browser session).

### C2.5 Verification and compliance (Cycle 2)

Kernel-only standard unchanged; Cycle-2 final sweep per `feasibility/probe/
FINAL-SWEEP-PLAN-C2.md` (trigger = A1 standby signal; Steps A–C; 36 sorry-tokens in tree at
plan time, all justified) → **[SWEEP]** (outcome + ledger `VERIFICATION-LEDGER.md` §9 fill:
per-pilot files/LoC/theorems, axiom/sorryAx tallies). Probe conventions and the
hypothesis-binder pattern carry over; outage note: log tails written post-outage are suspect
until re-verified (G7b run16 = the cautionary case).

### C2.6 Triage decision (orchestrator)

**[TRIAGE-DECISION]** — typeset by the orchestrator at close-out from
`TRIAGE-C2-ROWS.md` (decision-ready staging, A9) + `qa/triage-decision-staging.md` (H input
brief), mirroring the main-run §Top-3 format. Draft inputs: lane proposals in the rows file;
A5 VERDICTS N-adjusts landed; A7 effort grades [incoming] — empirical costs where missing
(M4a ~180 LoC delta green; 71-P0+P1 243 LoC green; substrate map S-cost).

### C2.7 Corpus-integration notes

decl-index v2 LANDED (`qa/make-decl-index-v2.sh` → `decl-index-v2.tsv` gitignored / `.zip`
tracked): 13 corpus labels incl. the six axiommath trees + vendor-CFT, **2,940,110 rows**;
v1 caveats carry over (ASCII names, vendored trees ⇒ direct-rg fallback; preprints never
indexed). New QA surfaces: `qa/{tauceti,openai-math}-spotcheck.md` (legacy-survey fixes in
place), `qa/donor-probes-spotcheck.md` (Q7), cycle2-qa-plan Parts 1–5 cumulative 0 WRONG.
