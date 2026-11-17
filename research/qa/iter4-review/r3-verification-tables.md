# R3 — Canonical verification tables (Iteration-4 review, 2026-11-16)

THE [R3-FILL] payload set for the article rewrites. One TEMPLATE-iter4-conformant
verification table per article of the post-restructuring corpus (per
`r2-discovery-strength.md` §8), in rewrite-priority order. Status strings are the
CLOSED vocabulary of `articles/TEMPLATE-iter4.md` §1 (PROVED-UNCONDITIONAL /
PROVED-CONDITIONAL / CERTIFIED-NUMERIC / PAPER-ONLY); every row names its binders
exactly as they appear in the source, and its axiom print as `log path:line` — the
line was read during the R3 audit (`r3-verification-integrity.md`) unless marked
"stage verdict" (count-only evidence; see audit F1/F3).

**Coverage classes** (audit finding F2 — private/lemma print coverage):
- **C1** = every declaration (public + private + lemma) has a direct print somewhere in
  the cited evidence (sweep appendum + in-file audit tail or pilot-local full audit).
- **C2** = file has only public `theorem` declarations; the sweep printed all of them.
- **C3** = private theorems / lemmas exist WITHOUT direct prints; covered only
  transitively (consumers' `#print axioms`) + Step-A token scan + the R3 repo-wide
  forbidden-construct scan (0 `axiom`/`native_decide`/`unsafe`/`implemented_by` tokens
  outside header prose). Iteration-4 sweep upgrade (audit §7) removes this class.
- **D-PIN** = evidence substrate is the donor pin (v4.34.1 / mathlib `d13f23b7`), not
  the project pin — must be flagged in the article status line per audit §5 rule 6.

**Consumer map** (which proposal file eats which table):

| table | consumed by |
|---|---|
| 42-v2 | `qa/iter4-review/r1-rewrite-42v2.md` — status rows :39–43 and formal-record rows :202–209 (all 13 [R3-FILL] cells) |
| 50-v2 | `r2-discovery-strength.md` §8 MERGE row (:487) + A2 (:383–389); the merge draft itself is unwritten (H or a future `r1-rewrite-50v2.md`) |
| 72 | `r2-discovery-strength.md` A3 (:391–399) + §8 REWRITE-FULL row (:495) |
| 20-split | `r2-discovery-strength.md` §8 REWRITE-FULL row (:491) + A6 (:414) |
| 11 | `r1-articles-editorial.md` §7 rec 3 (:416–419) + `r2-discovery-strength.md` A7 (:419) |
| 01 / 30 / 32 / 75 | `r1-articles-editorial.md` §7 keep list (:425–428); 75 also `r2` R2 (:302) + A11 (:442) |
| 22 / 52 / 71 / 73 / 10 | `r2-discovery-strength.md` §8 RELABEL rows (10 at :489; 22/52/71/73 at :492–496) + A1/A9 anchors; 71 also R1's :241 LoC fix |
| 21 | `r2-discovery-strength.md` §8 DEMOTE row (:488) + R11 (:356) + R3 relabel one-liner (audit §8) |

---

## 1. 42-v2 — merged 42 + 42-M4 (CONSUMED BY r1-rewrite-42v2.md)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `ZetaZeros.simple_proportion_d4` (donor) | axiommath/ZetaZerosV2 `ZetaZeros/Main.lean:130` | PROVED-UNCONDITIONAL (donor theorem, imported) | `pilots/42/logs/m4b2-axcheck-run1.log:144` — `[propext, Classical.choice, Quot.sound]` from the consumer side | donor tree rebuilt on-pin (G2); sweep-of-record context `feasibility/probe/logs/stepB-c2-m4b-donor.log:1–3` |
| `ZetaZeros.distinct_proportion_d5` (donor) | `ZetaZeros/Main.lean:149` | PROVED-UNCONDITIONAL (donor, imported) | `m4b2-axcheck-run1.log:145` — triad | idem |
| `V2d4_endpoint` / `V2d5_endpoint` | `pilots/42/M4b.lean:1390` / `:1396` | PROVED-UNCONDITIONAL (definitional wrappers of the donor endpoints) | `m4b2-axcheck-run1.log:142–143` — triad | the ζ-column inputs |
| `epsLowerCum_zeta_of_V2d4` | `pilots/42/M4b.lean:1404` | PROVED-CONDITIONAL — hntopζ, hfinζ, hV2d4 (discharged at the landings by the imported endpoint) | `m4b2-axcheck-run1.log:211` — triad | the ζ-column discharge, 2/3 |
| `epsLowerDistinctStripCum_zeta_of_V2d5` | `pilots/42/M4b.lean:1439` | PROVED-CONDITIONAL — hntopζ, hfinζ, hV2d5 (same discharge) | `m4b2-axcheck-run1.log:212` — triad | 5/6 distinct discharge |
| Thm 1 `zetaK_two_thirds_landed_of_V2` | `pilots/42/M4b.lean:1479` | PROVED-CONDITIONAL — H (hfinK, hfinζ, hfinχ, hEχ, hχ, hK, hK1, hP1, hntopζ, hntopχ, hfac) + hEχ : `EpsLowerCum (multOf fχ) (2/3)` | `m4b2-axcheck-run1.log:139` — triad | ζ side discharged inline; χ side = zeta23 ThmE binder (open core) |
| Thm 2 `zetaK_distinct_five_sixths_strip_landed_of_V2` | `pilots/42/M4b.lean:1497` | PROVED-CONDITIONAL — H + hEχdStrip : `EpsLowerDistinctStripCum (multOf fχ) (5/6)` | `m4b2-axcheck-run1.log:140` — triad (wrapped) | defect form |
| Thm 3 `zetaK_distinct_five_sixths_strip_landed_of_V2_of_negligible` | `pilots/42/M4b.lean:1535` | PROVED-CONDITIONAL — H + hEχdStrip + hCZStrip (common-strip-zeros negligible; conjecture-grade) | `m4b2-axcheck-run1.log:141` — triad (wrapped) | hCZStrip never discharged |
| M4a vocabulary: `distinctCountCum`, `EpsLowerDistinctStripCum`, `commonStripCum`, `assemble_eps_defect_strip_cum` (`M4a.lean:1023`, binders hz, hw = component distinct-proportion inputs) | `pilots/42/M4a.lean:821+` (defs at :821/:833) | PROVED-CONDITIONAL (assembly lemma takes the two component bounds; defs unconditional) | `pilots/42/logs/m4-axcheck-run1.log:58–68` (e.g. `assemble_eps_defect_strip_cum` :68, triad); sweep `pilots/42/logs/axcheck-c2-final.log:7` (AxPilot42_M4a OK, 57 axiom-lines, 0 sorryAx) | C2 coverage (54/54 public) |
| v1 route `zetaK_two_thirds_landed` | `pilots/42/M2b.lean:1062` | PROVED-CONDITIONAL — hCert, hK673 (Knausgård certificate slot), hEχ + structural set | `pilots/42/logs/axcheck-final.log:731` — triad; GREEN run `m2b_run6.log` | superseded as consumption route, kept as record |
| v1 `zetaK_distinct_five_sixths_landed` | `pilots/42/M2b.lean:1081` | PROVED-CONDITIONAL — hCert, hK839, hEχd + structural | `axcheck-final.log:732` — triad | |
| v1 `zetaK_distinct_five_sixths_landed_of_negligible` | `pilots/42/M2b.lean:1121` | PROVED-CONDITIONAL — idem + hCZ | `axcheck-final.log:733` — triad (wrapped) | |
| binder-only fallback of Thms 1–3 (`hV2d4`/`hV2d5` as hypotheses) | `pilots/42/logs/M4b-fallback-GREEN.lean` | PROVED-CONDITIONAL — H + hV2d4 + hV2d5 (donor endpoints as binders) | `pilots/42/logs/m4b-axcheck-run1.log:2` (header verdict: 68 distinct theorems = 66 + 2 @simp, all triad, 0 sorryAx) + prints :20–21 | C2 coverage; off-pin-runnable form |

Substrate: all of the above on mathlib `ff2494ea` / v4.36.0-rc2 except the donor
endpoints' *build* (ZetaZerosV2 tree, on-pin rebuild per G2; consumer elaboration
inside the built tree per `stepB-c2-m4b-donor.log`).

## 2. 50-v2 — merged 50 + 50-M2 (CONSUMED BY r2 §8 MERGE row + A2; merge draft unwritten)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| Part I Proposition 1 ("no zero-free-region term enters the certificate functional") | no decl — article 50 §Part I | PAPER-ONLY (source-verified reading of the donor engine) | none (zeta23 sources cited in-article) | per template §1, PAPER-ONLY may not be the headline; in the merged article it is a section |
| `strip_confinement` (Part II core) | `pilots/50/M1.lean:44` | PROVED-CONDITIONAL — hQRH : `∀ s, 7/8 < Re s → riemannZeta s ≠ 0` | `pilots/50/logs/axcheck-final.log:815` — triad; C2 sweep `pilots/50/logs/axcheck-c2-final.log` (AxPilot50_M1 OK, 4 axiom-lines) | C2 coverage (3/3) |
| `strip_confinement_mem` / `strip_confinement_set` | `pilots/50/M1.lean:75` / `:85` | PROVED-CONDITIONAL — hQRH | `axcheck-final.log:817–818` — triad | vocabulary forms |
| `Dirichlet.strip_confinement_dirichlet` | `pilots/50/Dirichlet.lean:40` | PROVED-CONDITIONAL — hQRHχ + hFEχ (product-form Dirichlet FE reflection; mathlib gap) | `axcheck-final.log:810–811` — triad | C2 (1/1) |
| `hQRH_seven_eighths` (ζ-side discharge) | `pilots/50/R1.lean:87` | PROVED-UNCONDITIONAL (applies the imported donor theorem) | no direct print; covered transitively via `strip_confinement_seven_eighths`'s print | **D-PIN** substrate |
| `Dirichlet.hQRHχ_seven_eighths` | `pilots/50/R1.lean:154` | PROVED-UNCONDITIONAL (donor application) | transitive via the Dirichlet landing's print | D-PIN |
| `strip_confinement_seven_eighths` (Part II discharge, ζ) | `pilots/50/R1.lean:93` | PROVED-UNCONDITIONAL — only `hρ : IsNontrivialZeroP50 ρ` (definition of subject) | `feasibility/probe/logs-g/run32-g7-elab.log:138` — triad | **D-PIN** (v4.34.1 / mathlib d13f23b7); statement = donor preprint's Cor. 1.2 (per r2 R5) |
| `strip_confinement_mem_seven_eighths` / `strip_confinement_set_seven_eighths` | `pilots/50/R1.lean:99` / `:105` | PROVED-UNCONDITIONAL | `run32-g7-elab.log:139–140` — triad | D-PIN |
| `Dirichlet.strip_confinement_dirichlet_seven_eighths_of_FE` | `pilots/50/R1.lean:161` | PROVED-CONDITIONAL — hFEχ (single remaining binder) | `run32-g7-elab.log:141` — triad (wrapped) | D-PIN |
| `OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` (donor) | openai-math `OAI/NumberTheory/DirichletL/Nonvanishing.lean:29` | PROVED-UNCONDITIONAL (donor) | `run32-g7-elab.log:144` — triad; G7b audit `:51` + delegation roots `:52–55` | audited at the donor pin before consumption |
| `OAI.DirichletCharacter.LFunction_ne_zero_of_seven_eighths_lt_re` (donor) | `Nonvanishing.lean:19` | PROVED-UNCONDITIONAL (donor) | `run32-g7-elab.log:145` — triad; G7b `:48` | |

## 3. 72 — fence + interface (CONSUMED BY r2 A3 + §8 REWRITE-FULL row)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| N1 `renyi_antiMono` | `pilots/72/C-neg.lean:188` | PROVED-UNCONDITIONAL (well-formedness: p probability vector, 0 < α ≤ β < 1) | `pilots/72/logs/axcheck-run1.log:24` — triad | textbook (Hölder); the rewrite must say so |
| N2a `renyi_le_log_card` | `pilots/72/C-neg.lean:231` | PROVED-UNCONDITIONAL (idem) | `axcheck-run1.log:25` — triad | |
| N2b `renyi_le_log_rank` | `pilots/72/C-neg.lean:282` | PROVED-UNCONDITIONAL (Hermitian PSD, unit trace — definition of subject) | `axcheck-run1.log:26` — triad | |
| N3a `renyi_area_law_nogo` | `pilots/72/C-neg.lean:344` | PROVED-CONDITIONAL — hKL (Kuwahara volume law, arXiv:2610.15199 — the external refutation) + hBnd + hArea (the negated candidate law); conclusion `False` | `axcheck-run1.log:27` — triad | the fence; `_hα`/`_hα1` binders unused (holds for all α) |
| N3b `rank_area_law_nogo` | `pilots/72/C-neg.lean:354` | PROVED-CONDITIONAL — hKL + hMono + hBnd + hArea; conclusion `False` | `axcheck-run1.log:28` — triad | headline of Part I |
| private helpers (`nogo_core`, `sum_rpow_mul_le`, `amgm2`, `div_rpow_eq`, `exists_pos_of_sum_eq_one`, `sum_rpow_pos`) | `pilots/72/C-neg.lean` (private) | (supporting; no independent claim) | `axcheck-run1.log:34` etc. — all triad under `_private.«axcheck-72-C-neg».0.…` | **C1** coverage (public via sweep + private via pilot-local audit; the C2 sweep stage itself prints only the 5 public theorems) |
| M1 link 1 `ptrace_pureState_eq_reducedDensity` | `pilots/72-M1/P72M1T2.lean:303` | PROVED-UNCONDITIONAL (hΩ = normalization, definition of subject) | `pilots/72-M1/logs/m1-axcheck-final.log:83` — triad; sweep `72-M1/logs/axcheck-c2-final.log` (T2: 28 axiom-lines, 0 sorryAx) | T2 has 1 private decl — **C3** |
| M1 link 2 `regionEntropy_eq_vonNeumannEntropy` | `pilots/72-M1/P72M1T2.lean:330` | PROVED-UNCONDITIONAL | `m1-axcheck-final.log` (RedTm2-style in-log audit; name visible in the 62-line run) | via `hermEigen_eq_of_matrix_eq` |
| M1 link 3 `boundaryCard_le_edgeBoundary` | `pilots/72-M1/P72M1T2.lean:164` | PROVED-UNCONDITIONAL | `m1-axcheck-final.log:82` — triad | constant 1 (≤ 4 of the design) |
| interface theorem `interface_areaLaw_uniformAreaLaw` + link 4 (gap transfer) | spec only: `pilots/72-M1/L3-spec.md` | NOT AN ARTICLE CLAIM (carried to Iteration 4; no status row per template §0 — progress tranches go to the dossier record) | — | the rewrite must not imply it exists |

## 4. 20-split — interface theorem vs seam analysis (CONSUMED BY r2 §8 REWRITE-FULL + A6)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `instantiate_family_A` (+ B/C) | `pilots/20/M1.lean:437` (+ siblings) | PROVED-CONDITIONAL — Card20 (zeta23 PaperInputs card), TracesFamily, EngineStep binders | `pilots/20/logs/axcheck-cycle2.log:56` — triad; main-run `axcheck-final.log:436` | the interface half of the split |
| `assemble_eps` | `pilots/20/M1.lean:188` | PROVED-CONDITIONAL — hz, hw (component `EpsLower` inputs) | main-run `axcheck-final.log` (in-stage; 36 axiom-lines) / C2 38 lines, 0 sorryAx | counting algebra |
| `merged_mult_of_common` | `pilots/20/M1.lean:513` | PROVED-UNCONDITIONAL (hz, hw = "ρ is a simple zero of both" — configurational, no donor binder) | `axcheck-cycle2.log:63` — triad | the seam's key fact |
| `family_merge` | `pilots/20/M1.lean:525` | PROVED-CONDITIONAL — hfamz, hfamw (component λ-family proportions; NO common-zero hypothesis) | `axcheck-cycle2.log:51` — triad | multiplicity route |
| `two_thirds_of_components` | `pilots/20/M1.lean:534` | PROVED-CONDITIONAL — component family inputs | in-stage (C2 sweep, 38 axiom-lines, 0 sorryAx) | |
| Theorem 5 (hCZ at η > 1/6 follows from the factors' 5/6-distinct theorems) | no decl | PAPER-ONLY (§4.3 seam analysis) | none | MUST be a per-theorem status row in the rewrite — the abstract currently asserts it as a result |
| engine seam (`EngineStep`, `TracesFamily`) | `pilots/20/M1.lean` (between SWAP markers) | definitions (no status) | — | |

Coverage: **C2** (28/28 public theorems; the "29th" raw `^theorem` match is docstring
prose). Article's "27 theorems / 576 LoC" stale → 28 / 582 (relabel list, audit §8).

## 5. 11 — post-M2-integration (CONSUMED BY r1 §7 rec 3 + r2 A7)

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `RedB.Red.comp` (Theorem 1, record design) | `pilots/11/RedCompB.lean:36` | PROVED-UNCONDITIONAL (calculus law; no donor binders) | `pilots/11/logs/axcheck-final.log:386` — triad | RedA comparison design also swept (5 axiom-lines) |
| `RedB.red_of_theorem_17` (Theorem 2) | `pilots/11/RedCompB.lean:86` | PROVED-CONDITIONAL — `Claim.Theorem_17` (donor statement as binder) | `axcheck-final.log:389` — triad | |
| `RedB.theorem19_of_red` (Theorem 3, acceptance) | `pilots/11/RedCompB.lean:111` | PROVED-CONDITIONAL — `Claim.Theorem_17` + `Claim.Corollary_16` binders | `axcheck-final.log:387` — triad | produces the donor's exact `Theorem_19_explicit` type |
| donor reference (compiled verbatim as faithfulness check) `ThreeSumApsp.Theorem19.explicit_of_theorem_17_corollary_16` | `pilots/11/P11T2.lean` (verbatim) | PROVED-UNCONDITIONAL (donor theorem) | `feasibility/probe/logs/stepB-c2.log:60` — triad; main-run in-stage | |
| B(ii) `tm2_realized_composed` | `pilots/11/RedTm2.lean:392` | PROVED-CONDITIONAL — EthExistsTm, EthPoly, EthIsPoly (eth interface statements, donor file:line in article §Addendum) + machine/size binders (qs, Md, hrun, hT, g, c₀, hsz, calls) | `pilots/11/logs/m2-axcheck-final.log:22` — triad | the M2 headline; integrates into the body per R1 BLOCKER |
| `Tm2Sol.mono` | `pilots/11/RedTm2.lean` | PROVED-UNCONDITIONAL | `m2-axcheck-final.log:18` — triad | no interface hypotheses |
| `tm2_choice`, `tm2_charging` | idem | PROVED-CONDITIONAL (eth interface binders) | `m2-axcheck-final.log:19–20` — triad | |
| `composed_sum_le` | idem | PROVED-UNCONDITIONAL (arithmetic) | `m2-axcheck-final.log:21` — `[propext, Quot.sound]` | |
| `orbit_sf`, `map_headD_sf`, `sum_sf` | idem | PROVED-UNCONDITIONAL | `m2-axcheck-final.log:23–25` — `[propext]` / none / `[propext]` | |
| P11T3 ported eth machine tranche (110 public theorems) | `pilots/11/P11T3.lean` | PROVED-UNCONDITIONAL (ported proofs) | `stepB-c2.log:533` stage verdict (OK, 71 axiom-lines, 0 sorryAx) + excerpted prints :534–586 | **C2**; note the "64 axiom-lines" in `m2-axcheck-final.log:13` is tally-only (custody gap F1 — evidence of record is the sweep) |

Coverage: RedCompA/B, RedTm2, P11T2 **C2**; word-RAM half + M3 instantiation open
(no rows — carried work, template §0).

## 6. Keeps — 01 / 30 / 32 / 75 (CONSUMED BY r1 §7 keep list; 75 also r2 R2+A11)

### 01

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `master_identity` | `pilots/01/port/09_MasterIdentity.lean:1983` | PROVED-UNCONDITIONAL (well-formedness only: Hermitian hypotheses, 0 < c) | `pilots/01/logs/axcheck-final.log:306` — triad | the five defects are named summands of the identity |
| `rank_trace_mult_k_of_master` | `pilots/01/port/09_MasterIdentity.lean:2019` | PROVED-UNCONDITIONAL | `axcheck-final.log:358` — triad | donor statement re-derived (faithfulness anchor) |
| `tightness_of_master` | `pilots/01/port/10_TightMult.lean:2182` | PROVED-UNCONDITIONAL | `axcheck-final.log:362` — triad | |
| ported spine (rank_trace_ineq, rank_trace_mult, von Neumann, …) | `pilots/01/port/01–08` | PROVED-UNCONDITIONAL (ported zeta23 proofs) | per-stage (port09: 42, port10: 41 axiom-lines, 0 sorryAx) | C2 per file |

### 30

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `TheoremB2_refuted_h1` (+ `B2_idempotence_fails`, `B2_annihilation_fails`, `B2_parseval_fails`) | `pilots/30-falsify-TheoremB-h1.lean:364` | PROVED-UNCONDITIONAL (finite explicit instance) | `pilots/30/logs/axcheck-final.log:612` — triad | refutation of the project-formulated conjecture |
| faithfulness checks (`LemmaQc_V0/V1/V2_t2`, `LemmaQa_V1`, `pairing_h1`, `pairing_h2_check`) | `pilots/30-falsify-TheoremB-h1.lean` | PROVED-UNCONDITIONAL | in-stage (AxPilot30_falsify OK, 25 axiom-lines, 0 sorryAx) | |
| moment instances (`moment1_V1`, `moment2_V1`, `moment2_V2_t2`) | idem | PROVED-UNCONDITIONAL | in-stage | the "kernel-checked instances" split |
| `Qh1_closed_form` | `pilots/30/ClosedForm.lean:112` | PROVED-UNCONDITIONAL | `axcheck-final.log:537` — triad | the closed form |
| `scalar_second_diff` | `pilots/30/ClosedForm.lean` | PROVED-UNCONDITIONAL | in-stage — `[propext, Quot.sound]` | |
| `Qh1_monomial`, `Qh1_comm_monomial`, `Qh1_zero_t1sq` | `pilots/30/ClosedForm.lean:128/:139/+` | PROVED-UNCONDITIONAL | in-stage (AxPilot30_ClosedForm OK, 16 axiom-lines, 0 sorryAx) | spectral form |
| Corollary 5 (general moment identities) | no decl | PAPER-ONLY (§4.3; instances are the rows above) | none | split already stated in the article |

Coverage: falsify **C3** (53 lemmas unprinted), ClosedForm **C3** (3 lemmas).

### 32

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `frontier_of_crossing` | `pilots/32/M1.lean:433` | PROVED-CONDITIONAL — `e : IsCrossing ε cₓ` (crossing existence; paper-level IVT) | `pilots/32/logs/axcheck-final.log:670` — triad | the abstract must carry this caveat (R1 MAJOR) |
| `frontier_nonempty_iff` | `pilots/32/M1.lean:452` | PROVED-UNCONDITIONAL (0 < ε only) | `axcheck-final.log:671` — triad | the phase transition, binder-free |
| `lnΛ_10_0` | `pilots/32/M1.lean:111` | PROVED-UNCONDITIONAL | `axcheck-final.log:655` — triad | |
| `crossing_unique`, `ceiling`, `Rc_antitone_gamma`, `Rc_lt_epsStar` … | `pilots/32/M1.lean:377/:360/+` | PROVED-UNCONDITIONAL | in-stage (AxPilot32_M1 OK, 22 axiom-lines C2 / 25 main, 0 sorryAx) | |

Coverage: **C3** (28 lemmas unprinted).

### 75

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `zetaL_assembly_landed` (Theorem A) | `pilots/75/Pa.lean:1473` | PROVED-CONDITIONAL — hK, hF (analyticity), hntopK, hntopF (non-degeneracy), hAbFac (factorization), hfinK/hfinL/hfinF (window finiteness), hcK/hcF (constants), hAK + hAF (component proportions — the open core) | `pilots/75/logs/run6-final.log:31` + `stepB-c2.log:1433` — triad | title/abstract must carry the conditionality (r2 S4(b)) |
| `zetaL_two_thirds_conditional` (Theorem B) | `pilots/75/Pa.lean:1525` | PROVED-CONDITIONAL — idem + hCert, hK673 (Knausgård certificate slot) + hAF at 2/3 | `run6-final.log:32` + `stepB-c2.log:1434` — triad | exactly as strong as its inputs |
| supporting layer (`multOf_finprod`, `analyticOrderAt_finprod_ne_top`, `multOf_of_abelFac`, `assemble_eps_cum_fin`, `countCumOf/countOnCum_of_abFac`, `sum_inter_distrib_fin_mem`, 3 private) | `pilots/75/Pa.lean:1202–1541` | PROVED-UNCONDITIONAL (arithmetic/germ lemmas) | in-file audit tail — `run6-final.log:6` ("ALL 17 declarations … exactly triad") with prints; sweep 82 axiom-lines covers the 65 public | **C1** coverage |

## 7. Relabels — 22 / 52 / 71 / 73 / 10 (CONSUMED BY r2 §8 RELABEL rows + A1/A9)

### 22

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `exists_tendsto_riemannZeta_sub_inv` (M1, restated in Tier1) | `pilots/22/Tier1.lean:40` (orig `pilots/22/M1.lean:28`) | PROVED-UNCONDITIONAL | `pilots/22/logs/axcheck-final.log:450/:496` — triad | |
| `exists_logDerivExtension` (M2) | `pilots/22/Tier1.lean:77` | PROVED-UNCONDITIONAL | `axcheck-final.log:497` — triad | |
| `exists_range_sum_vonMangoldt_le` (M3) | `pilots/22/Tier1.lean:192` | PROVED-UNCONDITIONAL | in-stage (AxPilot22_Tier1 OK, 8 axiom-lines, 0 sorryAx) | |
| `tendsto_psi_div_atTop` (M4, PNT ψ-form) | `pilots/22/Tier1.lean:221` | PROVED-UNCONDITIONAL (no binders of any kind) | `axcheck-final.log:499` (and :503) — triad | the headline |
| Tier-2 statement (effective PNT under quasi-RH) | statement elaboration only | NOT an asserted theorem (no status row) | — | closure note (T2b) = knowledge-level record, moves out of the article per r2 §6 |

Coverage: **C2** (M1 1/1, Tier1 4/4).

### 52

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `OccupationPair.dual_family` | `pilots/52/M1.lean:105` | PROVED-UNCONDITIONAL (t : List ι, Nodup; x killed by t's annihilators — definition of subject) | `pilots/52/logs/axcheck-cycle2.log:90` (main-run `axcheck-final.log:843`) — `[propext, Quot.sound]` | not even choice |
| `sign_transposition` | `pilots/52/M1.lean:124` | PROVED-UNCONDITIONAL | `axcheck-cycle2.log:91` — `[propext, Quot.sound]` | |
| `fermionic_create_sq` (Pauli) | `pilots/52/M1.lean:159` | PROVED-CONDITIONAL — h2 : `(1:K) + 1 ≠ 0` (characteristic condition; structural, NOT a donor statement) | in-stage (AxPilot52_M1 OK, 19 C2 / 15 main axiom-lines, 0 sorryAx) | |
| concrete instance (`fermionicPair`, ExteriorAlgebra = CliffordAlgebra 0) | `pilots/52/M1.lean` | PROVED-UNCONDITIONAL | in-stage — triad | uses choice |

Coverage: **C2** (16/16).

### 71

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `curve_zeta_ne_zero` (W1) | `pilots/71/P2.lean:186` | PROVED-CONDITIONAL — `W : WeilData F X 1` (Weil-conjectures transcription = donor statement), hq (1 < #F), Re s > 1/2, pole-factor exclusion `1 − q·q⁻ˢ ≠ 0` (the formalization-forced correction) | `pilots/71/logs/p2-run6.log:17` + `stepB-c2.log:1247` — triad | |
| `curve_zero_re_eq_half` (W2) | `pilots/71/P2.lean:213` | PROVED-CONDITIONAL — W + h (numerator vanishes) | `p2-run6.log:18` — triad | |
| `hasse_weil_point_count` (HW) | `pilots/71/P2.lean:229` | PROVED-CONDITIONAL — W (+ extension degree) | `p2-run6.log:19` + `stepB-c2.log:1249` — triad | |
| dictionary layer (P1: `norm_wOf`, `norm_wOf_lt_one`, `lPoly_eval`, `multiset_norm_sum_le`, `a2_eq`, `multiset_sum_map_const`, + Core 1/2) | `pilots/71/P1.lean` (carried in P2) | PROVED-UNCONDITIONAL | `p2-run6.log:14–16,20–24` — triad | C2 (7 + 11) |

LoC correction: article says 279 lines; disk 282 (audit §8 relabel list).

### 73

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `no_real_homs`, `apply_span_singleton_eq_zero_iff` | `pilots/73/C.lean:~` | PROVED-UNCONDITIONAL | `pilots/73/logs/run6-c-green.log:17–18` — triad | structural lemmas |
| `hecke_continuation` (Thm 1) | `pilots/73/C.lean:165` | PROVED-CONDITIONAL — hRat : `heckeSeriesT χ * P₀ = P₁` (rationality as binder; series agreement NOT formalized) | `run6-c-green.log:19` — triad; sweep `pilots/73/logs/axcheck-c2-final.log` (OK, 14 axiom-lines, 0 sorryAx) | Q4 (hRat discharge) open — the relabel condition |
| `hecke_window` (Thm 2) | `pilots/73/C.lean:205` | PROVED-CONDITIONAL — hPur : `HeckePurity χ q P₀ P₁ hRat` (Weil RH for the Kummer covers, as binder) | `run6-c-green.log:20` — triad | the 1/2-vs-31/32 comparison must carry hypothesis provenance (r2 MAJOR) |

Coverage: **C2** (7/7). P0 = probe-convention stubs, never cited as results.

### 10

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `exists_tm_space` (+ `_at_time`, `_monitor`) (M1) | `pilots/10/M1.lean:1798` | PROVED-UNCONDITIONAL | `pilots/10/logs/m1-run3-confirm-axcheck.log:14–17` — triad | |
| L1 agreement family (`rngC_agree`, `sumFC/prodFC/capC/findC_agree`, `descendC_agree_pad`, `descendC_uncut` at `L1.lean:505`) | `pilots/10/L1.lean:293+` | PROVED-UNCONDITIONAL | `pilots/10/logs/l1-run4-final.log:15–17` — `[propext, Quot.sound]` / `[propext]` variants; sweep 36 axiom-lines 0 sorryAx; sha 0871b429… matches disk | **C3** (6 private unprinted) |
| L2 countdown layer (`cdLoop_runsB` `L2.lean:2412`, `PolyTVal` def `:2487`, `polyTVal_id` `:2555`, `countdown_cut` `:2609`) | `pilots/10/L2.lean` | PROVED-UNCONDITIONAL | `pilots/10/logs/l2-run5-final-green.log:20–23` — triad; sha 845ce129… matches disk; sweep 126 axiom-lines 0 sorryAx (31 truncations all in the M1 region) | **C3** (26 private unprinted) |
| §3 target theorem (one machine for all k, poly space) | no decl | OPEN — not an article claim (tranche record; `pilots/10/next-tranche-spec.md` D1–D6) | — | status line must lead with OPEN (r2 A1) |

## 8. Certificate — 21 (CONSUMED BY r2 §8 DEMOTE row + R11; not an article post-restructure)

| item | location | status | evidence | notes |
|---|---|---|---|---|
| c⋆(1) − c(1, v_quartic) ≥ 3.870·10⁻⁴ (quartic transplant loses) | `research/pilots/21-milestoneC.md` §6 (stdlib-only Python certificate; exact rationals + Taylor-remainder enclosures) | CERTIFIED-NUMERIC — computationally certified by an external script; NOT a proof under the kernel-only standard; excluded from proved-artifact counts | certificate script in the milestone note (reproducible); no kernel log exists | relabel one-liner in audit §8; Lean proof path specified (§5 of the article) but not executed |

—

## 9. Donor-audit pattern for the two new OAI donors (G11/G12) — shared vocabulary for R6's probes and R8's hygiene gate

The two Iteration-4 OAI donor registrations — **G11** (OAI-SiegelZeros: the uniform
Landau–Siegel zero exclusion, every real zero β ∈ (0,1) of every primitive nonprincipal
real Dirichlet L-function of conductor q ≥ 3 satisfies (1−β)·log q ≥ c;
`ProbeG11_OAI_SiegelZeros.lean`) and **G12** (OAI-PiExponent: the
irrationality-exponent-of-π headline quartet + the generic hypothesis-binder
interpolation interface; `ProbeG12_OAI_PiExponent.lean`) — follow the **G7b pattern**
verbatim, and this file's vocabulary fixes how their evidence is expressed so R6's
probes and R8's donor-hygiene gate cite one thing: (i) *statement-level elaboration
plus donor-pin `#print axioms`* — the probe elaborates the donor statements and prints
their axioms INSIDE the donor's own tree at the donor pin (v4.34.1 / mathlib `d13f23b7`),
which is legitimate because axiom verdicts are pin-independent (they report the proof
tree, not the mathlib revision), with a full-tree sweep ONLY if a consumer lands (G7b
scope convention); (ii) *table semantics* — in R3 verification tables the audited donor
theorems appear as `PROVED-UNCONDITIONAL (donor)` rows whose axioms print source is the
donor-pin probe log, and any of OUR consumers elaborated in that donor tree carry the
**D-PIN** coverage class with the pin named in the status line (the 50-v2 rows for
`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` at `run32-g7-elab.log:144–145` are the
worked template), while a consumer on our own pin carries the donor statement as a
PROVED-CONDITIONAL binder until a donor-pin build discharges it (the article-50 → 50-M2
R1 progression); (iii) *hygiene gate* — the consumable passes R8's gate iff the donor
headline + its delegation roots print ⊆ {propext, Classical.choice, Quot.sound} at the
donor pin from the consumer side (AGENTS.md Cycle-2 donor-hygiene gate; G7b's
`ProbeFinalAssemblyUnconditional` root-audit is the precedent), sorry-free by `rg` over
the donor subtree; and (iv) *registration ≠ endorsement* — the pattern audits the
donor's internal hygiene, not the mathematical claim (G12's μ(π) = 2 exceeds every
classical record and is expressly NOT endorsed by the probe; a statement-binder
consumer inherits exactly what the audit shows — a triad-clean proof tree — and nothing
about the preprint's truth). G11/G12 consumers, if any land, enter the §1–8 tables
above under these rules with the G-series probe log as the axioms print source.

—

## 10. Iteration-4 landings (LIVE — rows appended as pilots land; Phase B, L2=808c809)

Standing service block. Row conventions per lane, fixed in advance so tables land
with the pilot, not after:

- **75-Pb** (`pilots/75/Pb.lean`, + shared-ℚ staging d1/d2): Pa-row conventions —
  PROVED-CONDITIONAL with the full defect-form binder list; the negligibility-form
  rows inherit hCZ's conjecture-grade note verbatim; N2 `zetaL_two_thirds_landed_ℚ`
  discharges the ζ-column via the BUILT ZetaZerosV2 library → donor rows per §1's
  42-v2 convention (`ZetaZeros.simple_proportion_d4`-class rows, on-pin, not D-PIN);
  Pa rides along as drift-check (its sha at sweep time is the Pa record of standing).
- **LP** (`pilots/lp/{P0,L1,L2}.lean`): P0 = probe-convention (Step A only, no status
  rows, stubs enumerated); L1 `lp_weak_duality`-class rows PROVED-UNCONDITIONAL unless
  binder-carrying (LP consumes no donor — full-coverage audit anyway, per plan §2.1);
  L2 consumer rows cite L1's declarations by stage (sibling-import staging:
  `axcheck_iter4.py gen --rewrite L1=AxL1` / make_axcheck TARGETS append).
- **AL-3D** (`pilots/al3d/*`): statement-layer rows are DEFINITIONS (no status rows);
  the 3 new statements (`IsColumnClosed3D`/`SlabAreaLawColumnCuts3D`/`PlanarAreaLawVar`)
  get rows only when a proved rung consumes them; every artifact carries the
  "B.2-staged" label; [HEAVY-IMPORT] substrate noted per stage.
- **ZZV2-λ** (`pilots/zzv2-lam/*`): P1/P2 elaborated inside the built ZetaZerosV2 tree
  → the 42-v2 M4b convention (donor rows PROVED-UNCONDITIONAL (donor) with the
  donor-tree print source; consumer rows D-PIN-class with pin named; P0(b)-unfavorable
  = stop-and-report, no rows).
- **zeta23e** (hEχ donor-pin discharge): §9 conventions verbatim — `Zeta23.ThmE.Final`
  chain rows PROVED-UNCONDITIONAL (donor) with donor-pin (v4.33.0-rc2 / mathlib
  51e6992e) print source + transitive audit; OUR consumer rows D-PIN; on-pin consumers
  (42-v2/75) keep hEχ as a binder until this discharge lands, at which point their
  tables gain supersession rows, not edits.
- **72-M1 T3 / 73-Q4 / 22-T2a / 10-D / 11-M3 / 74**: rows on landing, same rules;
  22-T2a's upstream StrongPNT binder = donor-row convention with the upstream inline
  axiom check as print source (`survey/axiommath-pntplus.md:90` record).

Table requests processed in landing order; every table cites log:line evidence read by
this lane, extractor-generated counts only (`axcheck_iter4.py decls`), and the
coverage class (C1/C2/C3/D-PIN) per audit F2.

### 10.1 LP — LANDED 2026-11-16 (first Phase-B table; lane A2 executing, R5 card 1a/4)

**L1 (LP-P1, proof artifact — 90 LoC, 2 decls, both public; coverage C2; disk sha256
0d200325f3f105cb…; TARGETS row `AxPilotLP_L1` appended and staging-verified 2/2):**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `lp_weak_duality` | `pilots/lp/L1.lean:41–48` | PROVED-UNCONDITIONAL — binders are type-classes (`Fintype m/n`, `CommSemiring R`, `LinearOrder R`, `IsOrderedRing R`) + data (A, b, c, x, y) + the feasibility hypotheses hAx/hy/hATy (definition of subject: "primal-feasible x, dual-feasible y ⟹ c⬝x ≤ b⬝y"); NO donor binders | `pilots/lp/logs/lp-l1-run2.log:21` (repeat :24) — `[propext, Classical.choice, Quot.sound]`; also compiled clean+triad in run1 (`lp-l1-run1.log:1` header note) | in-file audit tail (L1.lean:89–90) prints it — dual evidence; run1→run2 descent = 2 mechanical proof fixes (:62 dead `exact` after rw-auto-rfl; :84 calc `=` vs `h : ≤`), no statement change |
| `lp_weak_duality_symm` | `pilots/lp/L1.lean:73–85` | PROVED-UNCONDITIONAL — adds hx : `0 ≤ x j` (symmetric-form feasibility; still definition of subject) | `lp-l1-run2.log:22` (repeat :25) — triad | reserve interface (bridge §4 row 3) — no 02-core/74-T3 consumer as specced |

**P0 (probe-convention — Step-A only, NEVER a Step-B stage, no status rows):** 4
theorem decls (:37, :48, :88, :119) carrying **3 probe-convention sorry stubs** —
`:44`, `:55`, `:97` (decls :37/:48/:88; p0-run4 confirms exactly 3 `declaration uses
sorry` warnings, at the declaring lines :37/:48/:88). The 4th decl
`grid_ceiling_of_dual` (:119–125) is a one-line application of the stubbed core and
carries no stub of its own; as a probe-convention decl it is never cited as a result.
**Step-A incremental baseline: +3 tokens (`pilots/lp/P0.lean:44,55,97`)** — the lane
report's "4 stubs" is corrected here to 3 stubs / 4 decls. Descent: p0-run1 FAIL =
the port-delta discovery run; run2 pinned `Finset.sum_disjSum`/`sum_sumElim` (the
prework's guessed `sum_sum_elim` does not exist at the pin); run3/4 anchor preflight →
GREEN run4 (3 sorry-warnings only). Disk sha256 d14aabda5d3a69f0….

**Statement-port delta (recorded per instruction; both files):** the bridge/prework
vocabulary `[LinearOrderedRing R]` does not exist at mathlib `ff2494ea` (2026
ring-order mixin refactor — no bundled LinearOrderedRing/Semiring/CommRing classes
remain; discovered `lp-p0-run1.log:1`). The frozen statements use
`[CommSemiring R] [LinearOrder R] [IsOrderedRing R]` — the pin-canonical umbrella
(`Mathlib/Algebra/Order/Ring/Defs.lean:64`; exports `PosMulMono`/`MulPosMono` :68–70;
`IsOrderedAddMonoid.toAddLeftMono` at priority 900 discharges `Finset.sum_le_sum`'s
`[AddLeftMono]`). Mathematical content unchanged (both mul-mono directions =
LinearOrderedRing's order-multiplication content). Sources: `L1.lean:9–16`,
`P0.lean:14–20`, `lp-p0-run1.log:1`, `lp-l1-run1.log:1`.

**Machinery notes:** (i) the lp run logs carry no sha256 stamps (Iteration-4 default
#4 not yet in this lane's log header) — record-only gap for A2/R5; Step-B sweep-time
staging stamps the bytes of record regardless (plan §2.4). (ii) Substrate per log
headers: Modal app `crossmath-pilot-lp`, doz CLI, SPEC 2cpu/4GB + telemetry +
LEAN_NUM_THREADS=2, mathlib `ff2494ea`, warm layers — Modal-rule compliant.
**Gap (i) CLOSED at LP-P2**: `lp-l2-run6.log:7` stamps sha256(16) for all three files
(P0 d14aabda…, L1 0d200325…, L2 282c9c05…).

### 10.2 LP-P2 — LANDED 2026-11-16 (slot 1 COMPLETE: P0 → P1 → P2; lane A2, card 11)

**L2 (LP-P2, proof artifact — 127 LoC, 2 decls (1 public + 1 private), coverage C1
(the in-file audit tail L2.lean:126–127 prints BOTH decls; extractor census confirms
the private decl); disk sha256 282c9c05711dc54c… (stamped in-log at
`lp-l2-run6.log:7`); TARGETS row `AxPilotLP_L2` appended, sibling import
`import L1` auto-rewrites to `AxPilotLP_L1` — verified in both generators):**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `bw2_ceiling_of_dual` | `pilots/lp/L2.lean:79–122` | PROVED-UNCONDITIONAL — binders: type-classes (`Fintype G/D`), data (dat, μ, y, cert), dual-feasibility hypotheses (hy : y ≥ 0, hsum : Σy = 1, hbary₁/hbary₂ : barycenter equalities) and hvalid (certificate validity at every datum) — all definition-of-subject for "every dual-feasible combination of data rows bounds every valid certificate's value"; NO donor binders (the EnclOK-style enclosure binder enters only at the consumer's consumer, explicitly not here — L2.lean:36–38) | `pilots/lp/logs/lp-l2-run6.log:38` (repeat :62) — `[propext, Classical.choice, Quot.sound]` | the 02-core consumer clause, POINTWISE in the certificate (no `sSup`; B_k–sSup packaging = stop-gated optional extension, 02 Thms A/B/C NOT slot-1); proof = `lp_weak_duality` at the dictionary program m := D, n := Unit ⊕ G ⊕ G; L1 regression re-verified GREEN in the same run (:27–33) |
| `sum_uGG` (private) | `pilots/lp/L2.lean:59–71` | PROVED-UNCONDITIONAL (Sum-index plumbing lemma) | `lp-l2-run6.log:39` (repeat :63), printed from the in-file tail under the `_private.L2.0.sum_uGG` name shape — triad | the appended-tail-in-same-file private-name pattern working live; consumed only by `bw2_ceiling_of_dual` (transitive cover even without the in-file print) |

**0 sorryAx; telemetry OVER=0 (mem 3982 MB ≤ 4 GB spec)** (`lp-l2-run6.log:14` —
Modal-rule compliant). **Descent (card 11):** run1 (P0/L1 regression rode along),
run2 runner gained dependency-order olean emission + sum_uGG restructure, run3
ring_nf finding (assoc + 1·c₀ residues), runs 3–5 grouping-diagnosis
(`DIAGNOSE-lp-p2-run5.md`: sum_uGG RHS right-associated vs `valid`'s left-associated
body — not defeq, linarith cannot normalize), run5 STOP at card limit (5 of 3–5),
**run6 GREEN via orchestrator-authorized +1** (DETERMINISTIC-CONTINUATION class; the
+1 policy's four requirements — monotone descent, written hypotheses, staged
deterministic fix, diagnostic pointer — all logged at `lp-l2-run6.log:8–10`; the fix
itself is the one-line re-association bridge at L2.lean:94–99).

**Slot-1 completion record (P0 → P1 → P2):** P0 = probe-convention statement freeze +
anchor preflight (3 stubs, §10.1); P1 = the `lp_weak_duality` layer (2 theorems,
§10.1); P2 = the 02-core consumer clause (this table). LP slot 1 is COMPLETE at
statement-freeze fidelity (P0/P1/P2 share the frozen bundle idioms verbatim;
statement-port delta recorded at §10.1). Phrasing rule (A5 seed-9) travels with every
artifact: AFP trio + Coq 1706.10269 + Yamashita 2026 = mandatory nearest-miss
citations; Knausgård §7.6 owns the all-windows ceiling framing; never "first formal
LP duality"/"unformalized"/unqualified "first" (L2.lean:23–27).

**Citation correction (record-only):** the lane relay cited the triad prints at
`lp-l2-run6.log:24–25`; the actual `depends on axioms` lines are **:38–39** (repeats
at :62–63) — :24–25 fall inside the header/authorization block. Table cites the real
lines.

**Pending-tables record (R5's pinned hEχ audit set — table follows the zeta23e run's
verdict, §9 conventions):** `thmE_A₀/B₀/C₀` + `paperInputsChi_L` + `thmE_A` + the
`hex_two_thirds_binder_port` EnclOK port. Donor rows will be PROVED-UNCONDITIONAL
(donor) with donor-pin print source (v4.33.0-rc2 / mathlib 51e6992e); OUR consumer
rows D-PIN; on-pin 42-v2/75 consumers keep hEχ binders until discharge, then gain
supersession rows, not edits.

### 10.3 AL-P1 — LANDED 2026-11-16 (lane A4, card 7; [HEAVY-IMPORT] class per plan §0)

**A1.lean (proof artifact — 424 LoC, 22 public decls, 0 private; disk sha256
37063886ff9caaa8…; self-contained, Mathlib-only imports, no donor/Physlib per the G5a
boundary; TARGETS row `AxPilotAL3D_A1` appended). Verdict: rc=0, errors=0, sorry=0
(`pilots/al3d/logs/alp1-final.log:3`); telemetry OVER=0, wall 24 s (:95). ALL binders
below are definitional (slab hypothesis / column-closed cut / subset — no donor
binders anywhere in the file):**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| P1-c: `mem_projF` / `col_subset` / `mem_col_of_proj` | `pilots/al3d/A1.lean:63/:121/:124` | PROVED-UNCONDITIONAL | `alp1-final.log:42/:41/:43` — triad | column vocabulary |
| P1-c: `col_heights` / `col_inj_on_z` / `col_card_le` | `:129/:134/:144` | PROVED-UNCONDITIONAL (hΛ : `IsSlabDomain3D h Λ` = slab hypothesis, definition of subject) | `:44/:45/:46` — triad | `col_card_le`: column ≤ h via InjOn on z-coordinate + Ico 0 h (Int.card_Ico) |
| P1-c: `fibre_eq_bUnion_cols` / `fibre_card_le` | `:166/:178` | PROVED-UNCONDITIONAL (slab hypothesis) | `:47/:48` — triad | the Targets.md §B.2 "every row count acquires a factor h" step: `|fibre| ≤ h·|S|` via `Finset.card_biUnion_le_card_mul` (pin-fact 2 below) |
| P1-a: `projLattice_adj_of_cubic_adj` / `proj_walk_full` | `:188/:202` | PROVED-UNCONDITIONAL | `:49/:50` — triad | walk-lift |
| P1-a: `walk_induce_length` | `:234` | PROVED-UNCONDITIONAL | `:51` — **`[propext, Quot.sound]`** (no choice) | mathlib carries only the rfl-lemmas (descent r6) |
| P1-a: `proj_edist_le` / `proj_diam_le` | `:247/:282` | PROVED-UNCONDITIONAL (hXΛ : X ⊆ Λ definitional) | `:52/:53` — triad | edist + diameter contraction; `proj_diam_le` is the transfer feeding P2's `IsAdmissibleVar` check at G := projLattice Λ |
| P1-a helpers: `domainEDistG_of_mem` / `domainEDist3D_of_mem` | `:268/:274` | PROVED-UNCONDITIONAL (dite-unfold plumbing) | **NO direct print — see coverage note** | consumed inside `proj_diam_le`'s proof (:291–293) |
| P1-b: `col_subset_A_of_mem_proj` | `:300` | PROVED-UNCONDITIONAL (hA : `IsColumnClosed3D Λ A` = column-closed cut, definition of subject) | `:54` — triad | column closure |
| P1-b: `edgeBoundaryG_card_le` | `:309` | PROVED-UNCONDITIONAL (hA + hAΛ : A ⊆ Λ, definitional) | `:55` — triad | **the subset-image bound** — see note below |
| P1-d: `int_covBy_add_one` | `:349` | PROVED-UNCONDITIONAL | `:56` — triad | pin-fact 1 below |
| P1-d: `cubic_adj_iff` / `planar_adj_iff` / `planar_adj_of_cubic_adj` / `projLattice_le_planar` | `:363/:372/:380/:394` | PROVED-UNCONDITIONAL | `:57/:58/:59/:60` — triad | adjacency characterizations (descent r7–r11: replaced nesting-fragile rcases); `projLattice_le_planar` feeds the binder application |

**Coverage note (the audit's F2 class, live):** the lane's inline audit tail prints
**20 of 22** declarations (`A1.lean:403–422`) — `domainEDistG_of_mem`/`domainEDist3D_of_mem`
(:268/:274) have no direct axiom print anywhere. Their ⊆-triad status holds by
elimination: the file compiles rc=0 with **zero sorry-warnings** (`alp1-final.log:3`),
the forbidden-token gate is clean (`axcheck_iter4.py gate`: 0 hits), and both are
consumed by `proj_diam_le` (printed triad at :53 — sorryAx would propagate
transitively). The Iteration-4 Step-B full-coverage stage (generator census: 22 decls)
prints all 22 — this gap class disappears at sweep time. Remediation if the lane
re-runs: add the 2 missing lines to the audit tail.

**P1-b note (substrate intel for consumers):** the ≤ bound is proved by the
**no-injectivity / no-choice subset-image route** (descent r5,
`alp1-final.log:13–15`): every projected crossing edge e ∈ S has a T-witness under
the pair projection, so S ⊆ (projpair '' T) and `card S ≤ card image ≤ card T`
(`Finset.card_le_card` + `Finset.card_image_le`, A1.lean:335–346) — the dependent-choice
`InjOn` injective lift is NOT needed for the ≤ direction and was dropped entirely.
Statement-level record: P1-b is stated at the **projected graph** `projLattice Λ`
(prework §9 correction — the induced-square reading is refuted by the two-site slab
Λ = {(0,0,0), (1,0,5)}, A = {(0,0,0)}; `A1.lean:2–6`, `alp1-final.log:16–18`); the
GO/NO-GO criterion was met (pure column-closure + interedges membership + subset-image
bound, all elementary mathlib — no fibre-generic donor restatement needed).

**Pin-facts recorded (per instruction; for every AL consumer):** (1) **`SuccAddOrder ℤ`
is ABSENT at this pin** — `Order.covBy_iff_add_one_eq` cannot instantiate at ℤ (descent
r12–14), so `int_covBy_add_one` (:349) is proved from the root-namespace
`covBy_iff_lt_and_eq_or_eq` (`Mathlib.Order.Cover`) + `omega`. (2) **`card_biUnion_le`
naming family**: the descent-round-1 guess `card_bUnion_le` does not exist at the pin;
the ℤ-interval-bounded form used is `Finset.card_biUnion_le_card_mul`
(`fibre_card_le`, A1.lean:183–185). Both facts travel to A2/P2 and any AL consumer.

**P0 (probe-convention — Step-A only, no status rows):** 5 decls; **3 probe stubs**
(:75 `posSemidef_vecMulVec_self_star`, :113 `Arealaw.posSemidef_ptrace`, :118
`Arealaw.trace_ptrace`); the 2 shape checks (:460 `slab_column_cuts_shape`, :466
`planar_var_shape`) are sorry-free trivial re-exports validating the
binder-consumption forms (EnclOK/ProbeE precedent; "never cited as content",
P0.lean:26). **Step-A incremental baseline: +3 tokens (`pilots/al3d/P0.lean:73,111,116`
— `alp0-run2.log:25–27`; corrected 2026-11-17, A8 validation F2: the previously
printed `:75,113,118` matched no persisted log).**
Descent: alp0-run1 (2 error classes — SimpleGraph field idioms) → run2 OK. Arealaw
entropy core carried VERBATIM from green probe `ProbeG4_AreaLaw.lean` (G5a boundary:
zero donor imports, zero Physlib). Disk sha256 4f1195463a31335f….

**Machinery notes:** (i) descent 16 runs, error classes 20→10→9→7→6→4→2→1→0
(`alp1-final.log:1`), all rounds 2cpu/4GB + telemetry — Modal-rule compliant;
(ii) the al3d logs carry no sha256 stamps (same record-only class as LP pre-run-6;
disk shas recorded above); (iii) guard note: the ≤0.4k content guard exceeded ~6% by
docstring fences + the 24-line audit block — math content within, no stop fired
(`alp1-final.log:5–6`).

### 10.4 75-Pb — LANDED 2026-11-16 (the cycle's headline verification record; lane A3, card 2)

**Pb.lean (proof artifact — 2,296 LoC on disk (log header says 2,289 — LoC drift
noted, same F5 class), 89 decls = 79 public + 10 private, extractor census; disk
sha256 b9ad881689927936…; `import Mathlib` ONLY — the zero-donor-imports acceptance
criterion is met; self-contained carry of the full Pa stack (pilot-01 duplication
convention), so no sibling-import staging needed; TARGETS row `AxPilot75_Pb`
appended, staging verified 79 public theorems; forbidden-token gate clean). Verdict:
rc=0, errors=0, sorry=0 (`pilots/75/logs/pb-run11-final.log:4`), wall 51 s,
telemetry OVER=0.**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| Pb-1 `zetaL_assembly_distinct_defect_landed` | `pilots/75/Pb.lean:2144` | PROVED-CONDITIONAL — H (hK, hF, hntopK, hntopF, hAbFac, hfinK/hfinL/hfinF) + hcK/hcF (constants) + **hAKd : `EpsLowerDistinctStripCum (multOf fK) c₀` and hAFd : per-component distinct-strip proportions — the open core** | `pb-run11-final.log:50` — `[propext, Classical.choice, Quot.sound]` | the n-fold defect-form landing: defect = ζ_K-vs-family common-strip count PLUS the ORDERED-pair family defect (Pb-design §0) |
| Pb-2 `zetaL_assembly_distinct_landed_of_negligible` | `:2191` | PROVED-CONDITIONAL — H + hcK/hcF + hAKd/hAFd + **hCZStripFam** (summed common-strip-defect negligibility; by design, discharge-equivalent to the per-pair form per the file header) | `:51` — triad (wrapped) | the full strip-distinct proportion, seamed |
| Pb-3 `zetaL_distinct_five_sixths_strip_conditional` | `:2229` | PROVED-CONDITIONAL — H + **hCert : cert + hK839 : `K839OfLocalStrip cert ⟨multOf fK, hfinK⟩`** (the Knausgård 839 ≥ 5/6 certificate slot for the ζ_K column — the 5/6 arm's slot) + hAFd at 5/6 (open core) | `:52` — triad (wrapped) | M4a's `zetaK_distinct_five_sixths_strip_landed` one degree up the tower |
| Pb-3-D `zetaL_distinct_five_sixths_strip_conditional_of_negligible` | `:2255` | PROVED-CONDITIONAL — idem + **hCZStripFam** | `:53` — triad (wrapped) | |
| E1 `ZeroMult.addFinOver` + `addFinOver_cons` | `:1651+` | PROVED-UNCONDITIONAL (data-only binders) | `pb-run11-final.log` in-log records — triad | sub-family aggregation |
| E2b `commonStripCum_mono` / E2 `commonStripCum_add_le` / E3 `commonStripCum_addFinOver_le` | `:1628+` | PROVED-UNCONDITIONAL (data-only) | in-log records — triad | pair-defect monotonicity, binary sub-additivity, union-intersection bound |
| E4 `bonferroni_addFinOver` | `:1910` | PROVED-UNCONDITIONAL (finite family of Finsets — definitional) | `pb-run11-final.log:45` — triad | **the corrected E4 invariant**: superadditivity-up-to-overlap via the abstract Finset Bonferroni (`bonferroni_union_le`) + both-column offDiag growth — monotonicity alone does not close the cons-step (M1 design-erratum, `pb-run11-final.log:6–7`) |
| E5 `supp_addFin_inter` + `distinctCountCum_of_abelFac` / E6-core `assemble_eps_defect_strip_cum_fin` | `:2064+` | E5 UNCONDITIONAL (data-only); E6-core PROVED-CONDITIONAL — hK : `EpsLowerDistinctStripCum zK c` + hF : per-component (the assembly takes the component defect bounds) | `:49` (E6-core) — triad | n-ary distinct factorization + defect assembly |
| heritage carry (Pa stack verbatim: M4a 54 + P-a 14 incl. `zetaL_assembly_landed`, `zetaL_two_thirds_conditional`, 3 private) | `Pb.lean:1–1557` (= Pa.lean) | per §1's 75 rows — unchanged (drift-check: Pa rides along in-target) | heritage audit tail `Pb.lean:1558+` (the Pa 17-decl audit, verbatim); in-log records triad | the Pa precedent's carry convention |

**Coverage finding (F2 class, third instance this cycle — flagged for the lane):**
the file's two hand-written audit tails print **32 of 89** declarations (17 heritage +
15 P-b, `Pb.lean:1558+`/`:2281–2296`); the persisted log body is additionally
head/tail-excerpted (records ≈ 40 of the file's prints). The three private lemmas
named in the lane relay — `bonferroni_union_le` (:1873), `offDiag_cons_ge` (:1797),
`le_sum_mem` (:1678) — have **no direct print anywhere** (the relay's
"appended-tail pattern" does not cover them; the tails are hand-written lists).
Their ⊆-triad status holds by elimination: rc=0 with zero sorry-warnings
(`pb-run11-final.log:4`), forbidden-token gate clean, and each is consumed inside a
printed-triad theorem (`le_sum_mem` at :1701/:1723, `offDiag_cons_ge` at :1879,
`bonferroni_union_le` at :1915 — feeding E-milestone theorems printed triad).
Step-B full coverage prints all 89 (generator-verified). The log header's "EVERY
declaration … prints exactly [triad]" is therefore TALLY-ONLY-broad: true for
everything printed (all persisted records are full triad; 8 wrapped joins complete),
but 57 of 89 declarations have no direct print in the persisted evidence.

**Descent + policy record:** 55→21→27→21→12→11→8→3→1→1→0 errors over runs 1–11
(`pb-run11-final.log:4`); runs 5–11 under the orchestrator's continuation policy,
each with written error-class hypotheses (the policy line is in the run-11 header;
run-1's FIRE authorization at `pb-run1.log:4`). Fallback §8e never invoked — primary
offDiag route throughout. Warnings only (2 unused-simp-arg, 1 unused-section-var).

### 10.5 zeta23e (hEχ donor-pin discharge) — LANDED GREEN 2026-11-16/17 (the §9 donor-pattern showcase; lane A2 executing, runner R5, card 9 / r5 §14 run 8)

**The pre-recorded audit set of §10.2, completed. Substrate (D-PIN): the 144-file
pruned `Zeta23.ThmE.Final` closure built INSIDE the donor's tree at the DONOR pin —
Lean v4.33.0-rc2 + mathlib `51e6992e` (zeta23's own manifest, resolved by the donor's
`lake exe cache get`, rc=0 first attempt); base-image layers shared with the
g7/m4b2 family (diff-checked at staging). Axiom verdicts are pin-independent (§9(i)).
Wall 862 s — minutes-class, as R2's mini-spec predicted. Log
`pilots/zeta23e/logs/zeta23e-p0-run1.log`, sha256(16) P0 `986f1ce879786f33` stamped
in-log (:7).**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `Zeta23.ThmE.thmE_A₀` (donor) | zeta23 `Zeta23/ThmE/Final.lean:93` (seeded upstream; shape pinned by `#check`, `P0.lean:33`) | PROVED-UNCONDITIONAL (donor) | `zeta23e-p0-run1.log:190` (repeat :203) — `[propext, Classical.choice, Quot.sound]` | the χ-column 2/3 WITH-MULTIPLICITY endpoint — the hEχ discharge target |
| `Zeta23.ThmE.thmE_B₀` (donor) | idem `:99` | PROVED-UNCONDITIONAL (donor) | `:191` (repeat :204) — triad | |
| `Zeta23.ThmE.thmE_C₀` (donor) | idem `:105` | PROVED-UNCONDITIONAL (donor) | `:192` (repeat :205) — triad | companion-billing (r5 §14.1(c)): thmE_C₀'s 3/4 is the DISTINCT form — WEAKER than 75-Pb's 839-carried 5/6 slot; recorded, NOT consumed |
| `Zeta23.ThmE.paperInputsChi_L` (donor) | seeded chain (shape pinned `P0.lean:37`) | PROVED-UNCONDITIONAL (donor) | `:193` (repeat :206) — triad | the L-function inputs card |
| `Zeta23.ThmE.thmE_A` (donor) | seeded chain (shape pinned `P0.lean:36`) | PROVED-UNCONDITIONAL (donor) | `:194` (repeat :207) — triad | the with-multiplicity assembly |
| `hex_two_thirds_binder_port` | `pilots/zeta23e/P0.lean:54` | PROVED-CONDITIONAL — single binder hEχ : thmE_A₀'s conclusion quoted VERBATIM (`∀ ε > 0, ∃ T₀, ∀ T ≥ T₀, (2/3 − ε)·NcountL χ T (2T) ≤ N0starL χ T (2T)`); conclusion is the `True` carrier | elaborated in-tree (P0.lean OK, zero-sorry probe — the only decl; the elaboration IS the evidence) | the EnclOK/ProbeE pattern: the consumer-side binder until discharge; discharge = the donor name, post-audit (CLEARED below); port cost ≈ 0 by construction; NEVER cited as a result |

**Donor hygiene gate: PASS** (`zeta23e-p0-run1.log:15–18`) — the transitive Theorem-E
audit: all five donor rows triad-only, **0 sorryAx anywhere in the built closure**
(the sorry'd `Challenge.lean` comparator statements are never the build target).
**"The hEχ binder swap for 75-N2/42-M2 is CLEARED."** Consequence for earlier tables
per §9(iii): the χ-column 2/3 with-multiplicity binder of 42-v2's Thm 1 and 75's
Theorem B is dischargeable at the donor pin by name; on-pin consumers keep the hEχ
binder until an on-pin port, then gain supersession rows, not edits. The 5/6
distinct-strip tier (hEχdStrip / hK839 slots) is untouched by this clearance.

**Substrate/telemetry note (per instruction; the nproc trap, live):** OVER=13 during
the run — `max_cpu=8.98` at the **LAKE BUILD phase**: lake sizes job parallelism
from `nproc=18` while the CAP secret caps `LEAN_NUM_THREADS` for elaboration only,
not `lake -j` (`zeta23e-p0-run1.log:19–26`, telemetry rows :36–50). Classified as the
soft-limit burst class (AGENTS §1: a small request does not break a run); memory fine
(peak 1774 MB, anon=0). Guideline-3 investigation recorded in-log; future build-phase
runs pass `-j 2` (or accept the burst with this note). **No escalation needed or
requested.**

**Citation correction (record-only):** the log header self-cites the donor prints at
"lines 165-169" (:17); the actual `depends on axioms` lines are **:190–194** (repeats
:203–207). Table cites the real lines.

**Step-A baseline: +0 tokens** (zero-sorry probe file; the 3 `sorry` strings in
P0.lean are prose). P0.lean is probe-convention — NOT a Step-B stage, no TARGETS row.
The 75-N2 consumer (when it lands) elaborates in this donor tree under the D-PIN
class; its on-pin statements keep the binder per §9(ii).

### 10.6 AL-P2 milestone 1 — LANDED GREEN 2026-11-17 (lane A4; P2-a amendment + P2-b)

**A2.lean (proof artifact — 109 LoC on disk (log header says "~150" — drift noted);
2 public theorem decls + 5 defs; sha256 91b4fba741d05771… *(corrected 2026-11-17,
A8 validation F1: the sha pair below was transposed vs disk; disk-verified
A1 = 3e88be59d8625fdc, A2 = 91b4fba741d05771)*; `import A1` sibling
staging via the TARGETS auto-rewrite — verified; TARGETS row `AxPilotAL3D_A2`
appended. Verdict: A2.lean OK, sorry-strict; A1.lean OK in the same run
(`pilots/al3d/logs/alp2-run7-m1green.log:6`). Content-error descent 3→1→1→0 over
runs 5–7; runs 1–4 were the import-mechanism build (below).**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `colCard_eq_card` | `pilots/al3d/A2.lean:50` | PROVED-UNCONDITIONAL (data-only) | `alp2-run7-m1green.log:117` (repeats :119/:128/:136) — `[propext, Classical.choice, Quot.sound]` | `colCard` (def, :47) is exactly `Finset.card` of the column — the `Fintype.card`-spelling + `card_coe` bridge |
| `colCard_le_h` | `pilots/al3d/A2.lean:100` | PROVED-UNCONDITIONAL — hΛ : `IsSlabDomain3D h Λ` (slab hypothesis, definition of subject) | `:118` (repeats :120/:129/:137) — triad | slab heights feed the `PlanarAreaLawVar` application's `hU ≤ h` side (∀ u ∈ projF Λ, colCard Λ u ≤ h); consumes A1's `col_card_le` |
| defs (no status rows per §10 conventions): `Qudits3D` (:43 abbrev), `colCard` (:47), `colSigmaEquiv` (:57, domain ≃ sigma of columns; Subtype.ext/column-membership), `colRegEquiv` (:75 noncomputable, per-column `finFunctionFinEquiv` at `BigOperators/Fin.lean:577` — the donor's map at variable heights), `regReindexEquiv` (:93, the full regrouping `piCongrLeft' ∘ piCurry ∘ piCongrRight`) | `A2.lean:43–95` | definitions — the statement-layer value only, never a headline (plan §0) | — (defs are elaborated by the OK compile; no axiom prints by convention) | run-4 finding folded into the header: `piCurry`'s direction is (sigma-pi) ≃ (pi-pi); `a.trans b.trans c` parses LEFT-associated — explicit grouping required |

**A1 remediation (the §10.3 coverage finding, CLOSED by the lane):** A1.lean gained
the +2 audit lines (`A1.lean:415–416`, `domainEDistG_of_mem`/`domainEDist3D_of_mem`)
— A1 is now **C1** (22/22 printed; both records triad in-log at
`alp2-run7-m1green.log:50–51`). A1's sha changed accordingly (3e88be59d8625fdc6…
— A8 F1 correction 2026-11-17, transposed above);
content change = the 2 print lines only.

**P0 amendment (find #3) + re-GREEN:** `alp0-run3.log:1–5` — new def
`groupStrength h R J := 2 ^ (h * (2R+1)^2) * max J 1`; `SlabAreaLawColumnCuts3D` now
instantiates the planar binder `PlanarAreaLawVar` at `groupStrength h R J` (the raw-J
instantiation cannot consume the grouped interaction — prework §2.3 sketch gap,
recorded as header find #3; the frozen layer is otherwise untouched); the range R is
preserved by P1-a's projection contraction. Re-GREEN as probe. P0 sha
db5e1cc8307a1a7e…; the 3 stubs shifted lines (:85/:123/:128 — count unchanged);
**Step-A baseline enumeration update: `pilots/al3d/P0.lean:85,123,128`** (was
:73,111,116 per the persisted logs `alp0-run2.log:25–27` / `alp0-run3.log:16–18`;
the previously printed ":75,113,118" matched no log — A8 validation F2, corrected
2026-11-17; the current :85/:123/:128 form is disk-read, unstamped by any run —
it rides the db5e1cc8 P0 sha printed above, disk-verified unchanged 2026-11-17).

**Runner pin-findings (substrate notes, per instruction):** (i) putting the repo ROOT
on `LEAN_PATH` lets the Mathlib source tree hijack olean resolution — restaged under
`repo/AL3D` per the pilot-11 precedent; (ii) `lake env printenv LEAN_PATH` returned
empty on this image → fallback to the build dir. `run_pilot.py` gained the multi-file
sibling-import mechanism (staging dir + `LEAN_PATH` prepend + per-file `.olean` in
dependency order; single-file behavior unchanged; IMAGE BLOCK UNTOUCHED — layer
sharing preserved, `alp2-run7-m1green.log:2–5`).

**Pending:** P2-c/d/e rows follow their verdicts; **P2-d flagged as the risk
concentration** (per the lane/coordinator — the tables will carry the flag when it
lands).

### 10.7 G11/G12 — OAI SiegelZeros + PiExponent donor-pin audits — LANDED GREEN 2026-11-17 (probes lane R6, runs 33–35; verdict review + rows lane A1 = this lane's successor)

**Run: run35 (the fix run) — log `feasibility/probe/logs-g/run35-g11-fix.log`, Modal app
`crossmath-gprobe` fn g11, volume-resume from the run33 snapshot; verdict SUMMARY :271–276
(build OK; `ProbeG11_OAI_SiegelZeros.lean: OK sorry-warnings=0`; `ProbeG12_OAI_PiExponent.lean:
OK sorry-warnings=0`). NOT elaboration-only — per-theorem `#print axioms` triad output is
in the log for all nine audited decls. Substrate D-PIN: donor's own tree at v4.34.1 /
mathlib `d13f23b7` (closure 1,070 files, cache rc=0, build `OK; 201/9993 jobs; failed: []`
:161; "patches 0/12" = already applied by run33's 12/12, :97–108). Attempt history: run33
FAIL rc=1 (wiring typo `Conclusions.Theory` → nonexistent file, `run33-g11.log:131–133`/
`:190–192`); run34 early death (log ends t=120 s, no verdict); root cause + fix in
`run35-g11-fix.log:1–2`. Telemetry within guidelines: SPEC 2.0 cpu/4096 MB (:18); wall
1713 s, max_cpu 2.54, max_mem 1600 MB, OVER=12 (:276) — the §10.5 soft-limit build-phase
burst class (well under zeta23e's 8.98 precedent); no escalation. Full verdict block +
release ruling: `novelty/oai-siegelzeros-piexponent-as-donor.md` §"G11/G12 verdict".**

| decl (all donor) | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `OAI.SiegelZeros.WeightedTorusJets.exists_absolute_real_zero_gap` | donor `OAI/NumberTheory/SiegelZeros/Conclusions/Theorem.lean:11–21` | PROVED-UNCONDITIONAL (donor) | `run35-g11-fix.log:198–200` — `[propext, Classical.choice, Quot.sound]` | the G11 headline; `#check` shape :189–197 matches the map's §(a) quote verbatim — the `hLS` binder surface |
| `OAI.SiegelZeros.SiegelZerosAwei.W50.uniform_exclusion_of_local_isolated_bezout` | donor `Intersection/BezoutBoundary.lean:13` | PROVED-UNCONDITIONAL (donor) | `:201–203` — triad | delegation root 1 (G7b convention) |
| `OAI.SiegelZeros.WeightedTorusJets.W22.localIsolatedBezout_of_actual_regular_selection` | donor `Intersection/IsolatedBezoutFromRegularSelection.lean:346` | PROVED-UNCONDITIONAL (donor) | `:204–206` — triad | delegation root 2 |
| `OAI.PiExponent.pi_eventual_lower_bound` | donor `OAI/NumberTheory/PiExponent/Main.lean:9` | PROVED-UNCONDITIONAL (donor) | `:240` — triad | G12 headline; `hμπ` binder surface |
| `OAI.PiExponent.pi_irrationalityExponent_eq_two` | donor `Main.lean:17` | PROVED-UNCONDITIONAL (donor) | `:241` — triad | μ(π) = 2 — **registration ≠ endorsement** (§9(iv)): audit shows a triad-clean proof tree, nothing about the preprint's truth |
| `OAI.PiExponent.flint_hills_summable` | donor `Main.lean:29` | PROVED-UNCONDITIONAL (donor) | `:242` — triad | Flint–Hills corollary |
| `OAI.PiExponent.main` | donor `Main.lean:19` | PROVED-UNCONDITIONAL (donor) | `:243` — triad | the pair assembly |
| `OAI.PiExponent.piEventualLowerBound_of_globalInterpolation` | donor `Approximation/InterpolationConsequence.lean:11` | PROVED-UNCONDITIONAL (donor) | `:244` — triad | the generic interface — whole conclusion layer dischargeable from the one `GlobalInterpolationStatement` binder (`hGeo` surface) |
| `OAI.PiExponent.LiteralAnalytic.analyticAggregate` | donor `Analysis/AnalyticAggregate.lean:96` | PROVED-UNCONDITIONAL (donor) | `:245` — triad | the π-specific analytic leaf consumed inside the interface |

**Donor hygiene gate: PASS** — headline + delegation roots + interface all triad-only,
0 sorryAx, 0 sorry-warnings, at the donor pin from the consumer side (§9(iii)).
**Statement-binder class RELEASED 2026-11-17** (orchestrator pre-authorization, condition
met). Stands: build-dependency ban (v4.34.1 ≠ ff2494ea; Liu-1 convention); full-tree sweep
only if a consumer lands; **un-audited surface**: `pi_integer_eventual_lower_bound`
(`Main.lean:13`) + the two sibling interface lemmas (`InterpolationConsequence.lean:18/:25`)
— print before any direct consumption of those names.

### 10.8 75-Pb pb-run12 auditfix — §10.4 print-gap closure — LANDED 2026-11-17 (fix lane A3; verification this lane)

**Run: pb-run12-auditfix — log `pilots/75/logs/pb-run12-auditfix.log`, app
`crossmath-pilot-75`-pattern runner, rc=0 (:94), `Pb.lean: OK` (:19, SUMMARY :89), wall
25 s, OVER=0 (:90). Fix per §10.4's fold-at-next-touch: the three relay-named private
helpers EXPOSED (private dropped) and printed by public name; dated correction note in
the file audit block (`Pb.lean:2281–2288`). Run-11's verdict stands unchanged (the §10.4
rows already record the elimination argument); this run supersedes it as the direct-print
evidence source for the three helpers.**

**Verdict: the §10.4 print-gap as defined (the three private helpers with "no direct
print anywhere") is CLOSED. Remainder recorded honestly (same F-class as §10.4's own
finding, narrower):**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `CrossMath.Pilot75.le_sum_mem` | `pilots/75/Pb.lean:1678` (now public) | PROVED-UNCONDITIONAL | `pb-run12-auditfix.log:38` (repeat :63) — `[propext, Classical.choice, Quot.sound]` | was §10.4's gap decl 1 — direct print now in-log |
| `CrossMath.Pilot75.offDiag_cons_ge` | `:1797` (now public) | PROVED-UNCONDITIONAL | `:39` (repeat :64) — triad | gap decl 2 — closed |
| `CrossMath.Pilot75.bonferroni_union_le` | `:1873` (now public) | PROVED-UNCONDITIONAL | `:40` (repeat :65) — triad | gap decl 3 — closed; the E4 corrected-invariant root |
| REMAINDER (4 P-b-layer private decls, unprinted by name): `ZeroMult.eq_of_mult` (:1596), `not_mem_supp_zeroMult` (:1613), `supp_zeroMult_inter_empty` (:1616), `inter_supp_zeroMult_empty` (:1622) | `Pb.lean:1596–1626` | ⊆-triad by elimination: rc=0 + 0 sorry-warnings (:19) + each consumed inside a printed-triad theorem (:1672 `addFinOver_cons`, :1770/:1773 `commonStripCum_addFinOver_le`, :2107–:2114 `assemble_eps_defect_strip_cum_fin`) | none direct — the gap class §10.4 names, at 4 decls | the audit-block note's "prints every P-b-layer declaration directly (public + private)" (`Pb.lean:2282–2285`) and the log header's "complete direct-print audit over the whole P-b layer" (:5) are therefore tally-only-broad — flag for the lane's next touch: either +4 prints or reword to "every P-b-layer theorem named in §10.4" |

**File-wide direct-print standing after run12: 35 of 89 census decls (was 32; +3). The
54-decl remainder (50 heritage Pa-layer + the 4 above) keeps its §10.4 assignment:
Step-B full-coverage axcheck prints all 89 (generator-verified) — unchanged, still
pending at close-out. LoC note: log header says 2,302 (F5 drift class, header-carried).**

**Step-B full-coverage closure — LANDED PASS 2026-11-17 (this lane; supersedes the
pending line above).** Run `axcheck-full-run1` — log `pilots/75/logs/axcheck-full-run1.log`,
app `crossmath-pilot-75-axb` (doz CLI; SPEC 2 cpu/4 GB + LEAN_NUM_THREADS=2; wall 45 s,
OVER=0, 0 telemetry samples — wall < the 60 s interval, elaboration minutes-class).
Stage = `axcheck_iter4.py gen` output: verbatim Pb.lean + appended `#print axioms` tail
on ALL census decls; source of record Pb.lean post-run-12 **sha256(16)
`da05c60ceb78755b`** (A8 F3 stamp; full `da05c60ceb78755b64be…`), stage sha256(16)
`dadc6ff131e93eb4` stamped in-log (:11); census re-run at staging: **89 decls = 82
public + 7 private** (reconciles §10.4's run-11 79+10 with the three run-12 exposures);
forbidden-token gate OK (0 hits). **Verdict: PASS — every census declaration prints
exactly `[propext, Classical.choice, Quot.sound]`, 0 sorryAx, 0 errors.** Official
`axcheck_iter4.py scan`: 120 records, 120 × triad, 0 sorryAx, custody OK (verdict
`:218` claims 120, log persists 120). **Tool blind spot, quantified and hand-covered:**
4 more records — the primed-name prints `analyticAt_finset_prod'` /
`analyticOrderAt_finset_prod'` (in-file :47/:50 + appended :165/:168) — escape the
scan's and runner's `'([^']*)'` opener regex (a name ending in a prime breaks the
quote pairing); phrase-joined by hand from the persisted log: all **124** records
triad-only. Distinct printed names 90 = the 89 census decls + `ZeroMult.addFinOver`
(def, in-file print; no status row by convention). **Remainders CLOSED:** the 4 E0
privates direct-print triad (mangled-name records `ZeroMult.eq_of_mult` :182,
`not_mem_supp_zeroMult` :186, `supp_zeroMult_inter_empty` :189,
`inter_supp_zeroMult_empty` :192); §10.4's "57 of 89 no direct print" and §10.8's
4-decl file-wide shortfall are discharged — **direct-print coverage 89/89 census decls**;
run-11/12's elimination arguments are superseded by direct prints for every decl.
Machinery (pilot-75-local, pilot-10 precedent untouched): `pilots/75/axcheck_run75.py`
(F1/F3b custody runner — complete-output dump, scan-compatible verdict line, sha
stamping) + `pilots/75/run_axcheck75.sh`. Tool follow-up queued: fix the primed-name
opener in axcheck_iter4's RECORD_RE at next tool touch.

### 10.9 72-M1 L3a — LANDED GREEN 2026-11-16 (row owed since landing; added 2026-11-17 on A8 week-1 validation; lane R4-as-A8 executing, verification this lane)

**Run: `l3a-run6-GREEN.log`** — T1+T2 re-OK + **T3 OK, 0 errors, 0 sorry-warnings**
(header :1; `[p11]` verdict rows :15/:48 and T3's); P72M1T3.lean v4, sha256(16)
`fe57d30b19d9a836` (header :1 stamps fe57d30b19d9; disk-verified unchanged
2026-11-17); descent 12→7→6→1→0 errors over runs 1–6 (header); app `crossmath-probe`
warm-image reuse, doz CLI, SPEC 2 cpu/4 GB + LEAN_NUM_THREADS=2. The hermPart block
is L3a of the L3-spec (`pilots/72-M1/L3-spec.md` §2); L3b–d + the interface theorem
remain OPEN (REPORT-INPUTS-ITER4 §1 72-M1 row).

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `CrossMath.Pilot72.M1.hermPart_isHermitian` | `pilots/72-M1/P72M1T3.lean:70` | PROVED-UNCONDITIONAL (data-only) | `l3a-run6-GREEN.log:59` (repeat :120) — `[propext, Classical.choice, Quot.sound]` | the hermiticity fixed point |
| `CrossMath.Pilot72.M1.opNorm_hermPart_le` | `:78` | PROVED-UNCONDITIONAL | `:60` (repeat :121) — triad | contraction bound feeding the interface theorem's norm side |
| `CrossMath.Pilot72.M1.supportedOn_hermPart` | `:91` | PROVED-UNCONDITIONAL | `:61` (repeat :122) — triad | support preservation |
| `CrossMath.Pilot72.M1.hamiltonian_hermPart` | `:128` | PROVED-UNCONDITIONAL — hH : `∀ v, (hv v).IsHermitian` (hypothesis of subject) | `:62` (repeat :123) — triad | the L3a headline assembly |
| PRINT-GAP (5 of 9 T3 theorems, no direct print) — **CLOSED 2026-11-17** (see the closure block below): `hermPart_smul` (:40), `hermPart_eq_self` (:43), `hermPart_add` (:51), `hermPart_zero` (:57), `hermPart_sum` (:60) | `P72M1T3.lean:40–66` | PROVED-UNCONDITIONAL — direct prints now in-log (was ⊆-triad by elimination: rc=0 + 0 sorry-warnings + every one consumed inside a printed-triad theorem — `hermPart_smul` at :46/:53/:73; `hermPart_zero` :65, `hermPart_add` :66; `hermPart_sum` :132–:133, `hermPart_add` :135, `hermPart_eq_self` :136 — inside `hamiltonian_hermPart` :128) | `axcheck-l3a-run1.log:213–217` — all five `[propext, Classical.choice, Quot.sound]` | the l3a header's "ALL FOUR L3a theorems" was accurate for the four it printed but not file-complete (census: 9 public theorems); tally-narrow — now moot, 9/9 direct |

**Queued (print-gap) — EXECUTED SAME DAY (2026-11-17, this lane): CLOSED.** Run
`axcheck-l3a-run1` — log `pilots/72-M1/logs/axcheck-l3a-run1.log`, warm route app
`crossmath-probe` via `pilot72m1_probe.py` (dependency-order per-file olen +
LEAN_PATH sibling staging), doz CLI, SPEC 2 cpu/4 GB + LEAN_NUM_THREADS=2; wall
105 s. `make_axcheck72m1.py` TARGETS extended with T3 (the owed extension;
AxT3 imports AxT2 imports AxT1 via the rewrites map); T3 source sha fe57d30b19d9a836
(== l3a-run6's stamp, disk-verified), AxT3 stage sha stamped in-log (:7). **Verdict:
PASS — AxT3 stage 13 records (9 appended + 4 in-file ride-along), ALL
`[propext, Classical.choice, Quot.sound]`, 0 sorryAx, 0 errors** (scan: T3 13 OK;
the 5 gap decls direct-print triad at `:213–217`); 9/9 T3 census decls now
direct-printed. **Bonus custody discharge:** the T1/T2 stages reprinted in the same
run (52 + 28 records, all ⊆ triad — 2 × [propext, Quot.sound], data-only, no
Classical.choice) — the C2 sweep's persisted-record shortfall for
`AxPilot72_M1_T1` (52 claimed → 34 persisted) and `_T2` (28 → 27) is closed by this
log (scan: 93 records total, 0 sorryAx). Telemetry note: wall 105 s, max_cpu 0.51,
**OVER=1 on the single memory sample (6576 MB) — the documented mmapped-Mathlib-olen
measurement class** (AGENTS § Modal measured facts: mem = MemTotal−MemAvailable
incl. ~5–6 GB of mmapped olen pages; max_anon=0 confirms no anon spike); no CPU
burst, no escalation. Machinery: `pilots/72-M1/run_axcheck72m1_l3a.sh` (wrapper,
stages from `/tmp/crossmath-ax72m1-l3a-gen`).

### 10.10 ZZV2-λ P0 — LANDED GREEN 2026-11-17 (lane A3; r5 §12a rung 1, probe-convention rows only — P0(b) UNFAVORABLE ⇒ stop-after-P1 rule ARMED)

*(Merged 2026-11-17 by lane A1 from A3's block authored against a stale baseline of
this file — renumbered §10.7 → §10.10 to fit the live numbering; internal
cross-references checked (the "42-v2 M4b convention above" = §10's standing ZZV2-λ
bullet, unchanged); every log citation re-verified against
`pilots/zzv2-lam/logs/p0-run1.log` in A3's worktree agent-04 before inclusion.)*

**P0.lean (statement-facts probe — NOT a proof artifact; #check/@ + donor `#print axioms`
only, no sorry, no proof attempts; 39 LoC; elaborated INSIDE the built ZetaZerosV2 tree
per the M4b2 recipe — tarball V2+PNT+ (siblings read-only), PNT+ lakefile path-redirect,
`lake update` → mathlib `ff2494ea…`, `lake exe cache get`, `lake build ZetaZeros`,
consumer `lake env lean`. Verdict `p0-run1.log:149`: `P0.lean: OK (probe, sorry allowed)`
with NO sorry suffix (= 0 sorry-warnings), 0 errors — all 16 `#check`s of the λ-generic
surface elaborate verbatim on-pin. Build OK (`:144`, 8,262 jobs — the V2 PNT+ path);
wall 681 s (C3 class planned 1–2 h; warm family layers + soft-limit burst). Route: doz
CLI / semraker (primary per 2026-11-17 ruling + H relay); telemetry `[tele] SUMMARY`
`:190` wall=681s max_cpu=11.14 OVER=8 cpu-only, mem max 2960 MB — investigation note
in the log closing block (`:196–197`; `-j 2` substrate note for future build runs —
the §10.5 lake-`nproc` burst class, max_cpu 11.14 at the BUILD phase, memory within
spec at 2960/4096 MB). Run 1 of ≤2 — no fix-and-rerun needed.)**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `ZetaZeros.simpleOnLineCount_lower` | donor `Zeta/Zeta/Transfer.lean:126` | PROVED-UNCONDITIONAL (donor) | `pilots/zzv2-lam/logs/p0-run1.log:151` (repeat :182) — `[propext, Classical.choice, Quot.sound]` | P0(a) pin: binders `{lam T : ℝ} {eta : ℝ → ℝ}` + `hT : 1 < T`, `hzeros`, `hη : IsAdmissible lam eta` — NO numeric λ-range; λ enters only via `IsAdmissible`'s support clause (`Definitions.lean:92`) |
| `ZetaZeros.distinctZeroCount_lower` | donor `Zeta/Zeta/Transfer.lean:151` | PROVED-UNCONDITIONAL (donor) | `:152` (repeat :183) — triad | P0(a) pin: same binder shape; `3/2·N − Re(KS)/2 ≤ distinctZeroCount` |
| `ZetaZeros.unweightedKernelSum_cutoffTest_tendsto` | donor `Zeta/Kernel.lean:600` | PROVED-UNCONDITIONAL (donor) | `:153` (repeat :184) — triad | P0(b) pin — **THE FREEZE**: proved only at `η = cutoffTest ψ` (`Zeta/Defs.lean:111` = `ψ·√f₀/√A_ψ`), `ψ : IsCutoff delta`, `0 < delta < 1/4`; base `f₀ = extremalTest` (`:76`) hard-coded; NO scaling-covariance lemma in-tree ⇒ kernel-sum asymptotic unreachable at λ-scaled kernels |
| `ZetaZeros.pairCorrelationFormula` | donor `PairCorrelation/FromLandau.lean:52` | PROVED-UNCONDITIONAL (donor) | `:154` (repeat :185) — triad | P0(b) pin: the pair-correlation INPUT layer is η-generic + unconditional (`∀ f, IsPairTestFunction f`, `Zeta/Inputs.lean:55`) — the freeze is the BRIDGE, not the input |

**Probe-convention notes (no consumer status rows — P0 has no theorems; the 12 further
`#check`s elaborate rc=0, signatures pinned in `P0-record.md`):** P0(c) pin — the
functional's definition sites for L1: `unweightedKernelSum` (`Zeta/Kernel.lean:191`),
transfer functionals inline (`Zeta/Transfer.lean:126/:151`, A-form
`Zeta/TransferBounds.lean:63`), asymptotic value `pairMainTerm` (`Zeta/Defs.lean:48`) at
`cutoffSelfConv` (`:120`); terminal constants frozen at λ=1
(`Numeric/MontgomeryTaylor.lean:39/:45/:50`). **P1 GO / hard STOP after P1 GREEN**
(r5 §12a STOP rule + prework §5, applied on this evidence): P1 binder-shaped
(`hKS_lam` one explicit binder) is unaffected by the freeze — GO; P2 binder discharge
for λ near 1 needs a Landau η-port (`correctedTest`/`r_{ψ,T}` machinery,
`Zeta/Defs.lean:126`+, at scaled kernels) = charter decision. Diagnose-note =
`pilots/zzv2-lam/P0-record.md`. P1/P2 proof rows will follow the 42-v2 M4b convention
in §10's standing block IF/WHEN P1 lands.

—

*Sources: all log lines above were read directly in the R3 audit
(`qa/iter4-review/r3-verification-integrity.md` §§1–2, 4) except the in-stage rows
marked by stage verdicts; LoC/theorem-count drifts are tabulated there (§4 F4/F5).
Lane R3, 2026-11-16. Updated same day: §9 appended (G11/G12 pattern), tool
implementation `feasibility/probe/axcheck_iter4.py` (audit §7) landed with acceptance
results in its header; §10 appended at Phase B activation (L2=808c809) with lane
conventions pre-fixed for 75-Pb / LP / AL-3D / ZZV2-λ / zeta23e.
Updated 2026-11-17 by lane A1 (R3-role successor): §10.7 (G11/G12 donor-pin audit
verdicts, run35) + §10.8 (pb-run12 §10.4 print-gap closure, with the 4-decl remainder);
donor-map verdict block at `novelty/oai-siegelzeros-piexponent-as-donor.md`
§"G11/G12 verdict". Same day, second batch: §10.8 Step-B full-coverage closure
(`axcheck-full-run1` — 89/89 census decls direct-print triad; F3 sha stamped) +
§10.9 (72-M1 L3a row owed since landing, with the 5-of-9 print-gap caveat + queue
note) + A8 week-1 validation folds F1 (§10.6 A1/A2 sha transpose, disk-verified) and
F2 (§10.3/§10.6 stub-line citations corrected to the persisted logs' :73/:111/:116).
Third batch: §10.10 ZZV2-λ P0 (A3's block merged from the agent-04 stale-baseline
copy, renumbered §10.7→§10.10, log citations re-verified there — 4/4 donor rows
triad at `p0-run1.log:151–154`). Fourth batch: §10.9's L3a print-gap CLOSED
(`axcheck-l3a-run1` — 5 gap decls direct-print triad :213–217; T1/T2 C2 custody
shortfall discharged in the same log, 93 records); axcheck_iter4 T9 primed-name
regex fix (RECORD_RE + join openers `([^']*)`→`(.*)`) — axcheck-full-run1.log now
scans 124 records all-triad (was 120 + 4 hand-joined), C2 sweep log 719→724 all
triad, dated note in the tool header.*
