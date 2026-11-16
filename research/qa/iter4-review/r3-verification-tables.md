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

*Sources: all log lines above were read directly in the R3 audit
(`qa/iter4-review/r3-verification-integrity.md` §§1–2, 4) except the in-stage rows
marked by stage verdicts; LoC/theorem-count drifts are tabulated there (§4 F4/F5).
Lane R3, 2026-11-16. Updated same day: §9 appended (G11/G12 pattern), tool
implementation `feasibility/probe/axcheck_iter4.py` (audit §7) landed with acceptance
results in its header.*
