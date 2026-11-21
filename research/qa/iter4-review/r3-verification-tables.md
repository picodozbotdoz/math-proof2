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
| `merged_mult_of_common` | `pilots/20/M1.lean:513` | PROVED-UNCONDITIONAL (hz, hw = "ρ is a simple zero of both" — configurational, no donor binder) | `axcheck-cycle2.log:63` — triad | the seam's key fact. **2026-11-21 cross-note (post-revision sweep):** article-20 v-rev (external-referee set, `2bfe771`) re-bills this decl **PROVED-CONDITIONAL — hz : `z.mult ρ = 1`, hw : `w.mult ρ = 1`** (article §2 status table, Thm 4 (i)); the row above stands as artifact-audit history — same evidence line, billing class per the binder-naming rule the same revision set applied to 41H Thm B (78 A2′ precedent) |
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

**AMENDMENT (find #4), dated 2026-11-17 — SUPERSEDES the find-#3 state above:**
the find-#3 amended binder pair was **UNPROVABLE as scoped**: its `∃C` sat inside
`∀Λ' hU` (per-domain constant) and `∀G ≤ planarLattice` was prefixed OUTSIDE the
binder; the honest form is the **uniform `∃C`** (one C serves every subgraph G,
every domain — `P0.lean:443/:480`) **with G moved inside the binder**, and
`SlabAreaLawColumnCuts3D`'s hypothesis returns to the prework §2.3 outer shape
(statement-level correction, A4's find #4; recorded in the `P0.lean`/`A2.lean`
headers — `A2.lean:37`). **Re-GREEN as probe, run 8:**
`pilots/al3d/logs/alp2-run8-substrate.log` (agent-05, H committing) — verdict `:12`
"P0 OK (probe, sorry ×3 expected), A1 OK, A2 OK. wall=75 s, cpu=0.72, mem=3899 MB",
the three expected sorries at `P0.lean:104/:142/:147` (log `:39–:41`), the
why-forced note at `:14–:16`. **State changes:** P0 sha `52c5b9f77344e0ed`
(supersedes db5e1cc8; disk-verified); the stub enumeration drifts again —
**`pilots/al3d/P0.lean:104,142,147`** (count 3 unchanged; the certificate's al3d/P0
line cites superseded — drift note appended to `stepA-incremental-iter4.log`). The
find-#3 groupStrength mechanism is untouched by #4 (the correction is to the binder
SCOPING, not the instantiation).

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

### 10.11 32-crossing — LANDED GREEN 2026-11-17 (run 12; lane A6, week1-agenda row 1, R2 §12.2; folded + re-verified by lane A1)

*(Merged 2026-11-17 by lane A1 from A6's block authored into REPORT-INPUTS-ITER4.md in
worktree agent-07 (wrong file per the H-shepherded ruling); content verbatim below
except heading format + this note. Every log citation re-verified against
`pilots/32/logs/run12-crossing-existence.log` on agent-07 disk before inclusion:
verdict :14/:58, M1 triad :16–:24, M2 triad :60–:66, provenance header :1. M2.lean +
the log + the discharge note are in agent-07 pending H's commit.)*

**M2 (proof artifact — 675 LoC, 7 public theorems + 2 helper lemmas, coverage C2
(in-file audit tail prints all 7 theorems); disk sha256
`9c10fcf5d209407be79178061a60740f9181f9bc18910fc77e1480742c1c52b3e`; SELF-CONTAINED
frozen-M1 carry — imports only Mathlib, Pb.lean precedent, byte-diff-verified vs the
frozen `M1.lean` sha `5aad3ffa…`; needs NO sibling-import rewrite at Step-B):**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `gammaOf_tendsto_ten_right` | `pilots/32/M2.lean:452` | PROVED-UNCONDITIONAL — R2 §12.2 form 1 (∀ e > 0, ∃ c > 10, gammaOf c (9/10) < e) | `pilots/32/logs/run12-crossing-existence.log:60` — triad | near-10 quantitative bound `gammaOf_le_add` (:408, log(1+u) ≤ u) |
| `gmax_pos_near_ten` | `pilots/32/M2.lean:471` | PROVED-UNCONDITIONAL — form 2, + explicit `0 < ε` binder (recorded adaptation: bare `ε < ε*` admits ε ≤ 0 where no crossing exists; faithful to the article's ε ∈ (0, ε*)) | `…run12-crossing-existence.log:61` — triad | via `lnΛ_upper`; explicit witness 10 + B/(2·Lconst) |
| `gmax_neg_far` | `pilots/32/M2.lean:504` | PROVED-UNCONDITIONAL — form 3 | `…:62` — triad | new MVT lower bound `lnΛ_growth` (:431): lnΛ c 0 ≥ 5·ln10 + (c−10)·κ/2, κ = 2·Lconst − ln(10/9) > 0 |
| `crossDiff_continuous` | `pilots/32/M2.lean:538` | PROVED-UNCONDITIONAL — form 4, stated exactly as specced (no ε-sign hypothesis) | `…:63` — triad | gammaOf side via `Real.continuousOn_log` + `ContinuousOn.comp'`; gmax side via M1's `hasDerivAt_Ffun`/`lnΛ_decompose` |
| `crossing_exists` | `pilots/32/M2.lean:582` | PROVED-UNCONDITIONAL — form 5: ∃ c > 10, IsCrossing ε c — THE §5 DISCHARGE | `…:64` — triad | IVT `intermediate_value_Icc`; near endpoint c₁ = 10 + B/(2·(2·Lconst + 1/5)) (strictness t·(Lconst+1/10) = B/4 < B/2); far endpoint = form-3 witness + t via `gmax_strictAnti` |
| `frontier_unconditional` | `pilots/32/M2.lean:646` | PROVED-UNCONDITIONAL — form 6 (spec's `Ach` = `FrontierSet`): FrontierSet ε = Ioo 0 (gammaOf cₓ (9/10)) with NO crossing hypothesis | `…:65` — triad | both inclusions via M1's `membership_of_lt`/`frontier_upper` |
| `frontier_formula_unconditional` | `pilots/32/M2.lean:662` | PROVED-UNCONDITIONAL — Theorem 5's sSup formula composed with M1's `frontier_of_crossing` | `…:66` — triad | makes Theorem 5 unconditional parametric (with M1's `crossing_unique` for uniqueness) |

**0 sorry-warnings; telemetry OVER=0 (warm wall=45s, 2 cpu/4 GB spec, LEAN_NUM_THREADS=2).**
**Descent:** run1 FAIL 9 errors → run2 FAIL 2 (norm_num on metavar-typed `ContinuousOn.div`
h₀ goals — fixed by `show`-typed bodies) → run3 GREEN; all three URLs in the log header
(the raw attempt-1/2 transcripts are preserved in the log body below the GREEN section,
by design). **Route:** doz CLI `/home/doz/dozenv/bin/modal`, app `crossmath-pilot-32`
(semraker workspace; PRIMARY per the 2026-11-17 orchestrator ruling + H's warm-layers
relay). **M1 regression:** re-verified OK in the same run (:14, triad :16–:24) — the M2
carry's source of record. **Article gate:** article-32 §5's "not formalized"
crossing-existence sentences DISCHARGED (retired-sentence map + R1 v2 status draft at
`pilots/32/run12-discharge-note.md`); remaining paper-level as scoped: the ε-dependence
of c* and the donor Corollary-31 data-structure statement. Step-B registration row
applied by A1 in `make_axcheck.py` TARGETS (`("AxPilot32_M2", PILOTS / "32/M2.lean")`,
plain append — inert until H commits A6's batch). **Stale-wrappers row (§2)
half-resolved:** `pilots/32/run_pilot.sh` — the xyz-default caveat was already fixed at
this rev (doz-default + doz-CLI branch); this session made the stage dir lane-unique
(`:14`, `/tmp/crossmath-pilot-32-a6`, H commits). `feasibility/probe/run_probe.sh`
remains for the feasibility lane.

**Verification-lane addendum (A1, 2026-11-17):** census `axcheck_iter4.py decls` over
M2.lean = **43 decls (43 public + 0 private)** = the frozen-M1 carry + the new content;
direct prints in-run = the 7 new theorems (M2 section) + the 9 M1 theorems (M1
regression section, same run). **Print-coverage caveat (§10.9 class, minor):** the 2
new helper lemmas `log4_pos` (:66) / `log10_pos` (:67) have no direct print — ⊆-triad
by elimination (rc=0, 0 sorry-warnings; `log4_pos` consumed at :92/:97/:108/:295 inside
carry lemmas feeding printed-triad theorems); note `make_axcheck`'s regex captures
theorems only, so the Step-B stage will not print them either — they are covered by
the wave-2 full-coverage pass (`axcheck_iter4.py gen` captures lemmas;
FINAL-SWEEP-PLAN-ITER4 §7b(ii)) if 32-M2 is included there, else by this elimination
note of record.

### 10.12 75-N2 P0 — LANDED GREEN 2026-11-17 (run 4; lane A5; folded + re-verified by lane A1)

*(Merged 2026-11-17 by lane A1 from A5's block at `pilots/75/N2-P0-record.md`
(worktree agent-06, pending H's commit; the block self-describes as "§10.10-format" —
authored against stale numbering, folded here as §10.12). Every cite re-verified
against `pilots/75/logs/n2-p0-run4.log` on agent-06 disk: verdict block :175–183 +
A5's in-log close-out :185–196, 15/15 Pilot75N2 triad prints :83–97 (repeats :159+),
Pa heritage block :32–48, telemetry :178.)*

**Run summary:** 4 runs (at the ~4-run fix-loop budget), descent 8→1(hidden)→1→0 —
run1 FAIL 8 errors (H7 missing `[NeZero q]` root — `DirichletCharacter.LFunction`
demands it, `DirichletContinuation.lean:50`; H8 `noncomputable` marks); run2 FAIL with
1 HIDDEN error (runner filter missed the `: error(code):` message form); run3
diagnostic FAIL 1 error (`Complex.analyticOnNhd` dot-chain misresolution → explicit
`DifferentiableOn.analyticAt`, `CauchyIntegral.lean:723`); **run4 GREEN — rc=0,
errors=0, sorry=0** (`n2-p0-run4.log:185–187`). Telemetry: wall 67 s, max_cpu 0.72
(spec 2.0), max_mem 2720 MB (spec 4096), OVER=0 — within AGENTS §Modal defaults
(:178). Route: doz CLI, app `crossmath-pilot-75` (shared bake), stage
`/tmp/crossmath-n2p0-stage/`, runner `run_n2p0.py` (pilot-11 dependency-order olen
pattern: `Pa.lean → Pa.olean` on LEAN_PATH, then `N2-P0.lean` with `import Pa`).

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `CrossMath.Pilot75N2.zetaL_rat_two_thirds_landed` | `pilots/75/N2-P0.lean:219` | PROVED-CONDITIONAL (statement rung; engine application) | `n2-p0-run4.log:97` (repeat :173-region) — triad `[propext, Classical.choice, Quot.sound]`, 0 sorryAx | the N2-d landing at P0 honesty level; binders: hne, hN, hLχ, hK/hL, hntopK/hntopL/hntopψ, hAbFacQ, hfinK/hfinL/hfinψ, hAK (ζ-column slot, P3), hEχcum (Dirichlet column, P2) |
| `ThmEDyadic` | `N2-P0.lean:102` | statement-port (zeta23 `thmE_A₀` conclusion, EnclOK implication form) | `:88` — triad | donor chain audited GREEN at the zeta23 pin (`pilots/zeta23e/logs/zeta23e-p0-run1.log`, §10.5) |
| `IsNontrivialZeroL`/`zeroMultL`/`zerosInL`/`NcountL`/`N0starL` | `N2-P0.lean:83–95` | transcription defs (zeta23 `Challenge.lean:92–108` verbatim shapes) | `:83–87` — triad | `[NeZero q]` section parity with the donor; `noncomputable` for `analyticOrderAt` |
| `IsDZDFRayClassCharacterQ`/`IsDZDFPrincipalQ`/`DZDFAbelianFactorizationQ` | `N2-P0.lean:115–147` | DZDF statement-binders (quoted, NEVER imported; G1b fence) | `:89–91` — triad | verbatim-field quotes at K = ℚ (`DedekindZetaChallenge.lean:14–20/:26–28`; `AbelianRayCharacterFactorization.lean:62–73`) |
| `HasQDirichletDictionary` | `N2-P0.lean:152` | P1 discharge target (N2-a) | `:92` — triad | dictionary + Hecke-tsum = `LFunction` identification + principality transfer |
| `DirichletFactorizationTransferQ` | `N2-P0.lean:166` | P1 discharge target (factorization transfer) | `:93` — triad | DZDF-Hecke form ⇒ Dirichlet-`LFunction` form + `1 < q i ∧ ψ i ≠ 1` |
| `HasEulerStripImmunity` | `N2-P0.lean:181` | P2 discharge target (N2-b, pair form) | `:94` — triad | imprimitive vs primitive-associate strip multiplicities |
| `CountsUnbounded` | `N2-P0.lean:189` | classical structural binder (hUnb; Titchmarsh §5.8/Davenport ch. 9) | `:95` — triad | needed only for dyadic→cumulative absorption |
| `ThmEDyadicToCumulative` | `N2-P0.lean:201` | P2 discharge target (N2-c port schema, primitive level) | `:96` — triad | composes with immunity for imprimitive components |
| (engine) `zetaL_assembly_landed` + 16 heritage | `Pa.lean` (frozen, GREEN run6) | PROVED (heritage carry) | `n2-p0-run4.log` Pa block :32–48 — triad | recompiled clean in-run via the sibling-import route |

**Hygiene class (file header): STATEMENT RUNG, ZERO-SORRY BY CONSTRUCTION** — no
probe-header sorry class used; the only proof is one engine application plus mathlib
one-liners. 277 LoC; `import Mathlib` + `import Pa` only. **Design deltas vs the
dossier's P0 spec** (recorded for P1, verbatim in `N2-P0-record.md`): (1) abstract
component family `Lχ` + `hLχ`/`hN` binders (per-index `[NeZero (q i)]` not synthable
for a dependent family — Lean 4 elaboration constraint, priced ~0 at P1); (2) port
schema stated at the primitive level + pair-form immunity (same content, cleaner
elaboration); (3) the transfer additionally delivers `hN`. **P1 recommendation: GO**
(risks removed at ~zero cost; remaining P1 = the dossier's priced glue ≈0.3–0.5k LoC;
friction watch = `𝓞 ℚ ↔ ℤ` ideal transport + the `LSeries` wrapper, the dossier's
F5(i)/(ii)).

**Verification-lane addendum (A1, 2026-11-17):** coverage class **C1 confirmed** —
every declaration of the file (15 = 1 theorem + 14 defs/props; `axcheck_iter4 decls`
counts the theorem only, defs carry no status rows by convention but print axioms)
has a direct triad print in-log, zero sorryAx; the log's own custody is complete
(A5's broadened-filter runner — the run2 hidden-error lesson is recorded in the
close-out). **Step-B note:** no make_axcheck TARGETS row yet, deliberately — this is
a STATEMENT RUNG of a ladder with P1 GO recorded (the file/family grows); the row
lands at N2-final per FINAL-SWEEP-PLAN-ITER4 §7a's 75-N2 entry, which now resolves to
the **[WARM] branch** (Mathlib-only + sibling `import Pa` ⇒ Pa rewrite, AxPilot75_Pa
already in TARGETS), NOT the donor-tree D-PIN branch.

### 10.13 78 Truffet Stage-A P0 — LANDED GREEN 2026-11-17 (run 4; lane A7, dossier-78 Stage-A; folded + re-verified by lane A1)

*(Merged 2026-11-17 by lane A1 from A7's `pilots/78/P0-record.md` (worktree agent-08,
pending H's commit). Cites re-verified on agent-08 disk: verdict `p0-run4.log:20` +
SUMMARY :57–58, the 3 triad prints :22–24 (repeats :53–55), telemetry :59.)*

**P0.lean (proof artifact — 444 LoC, sha256(16) `d94d115e3d8d08d7`; `import Mathlib`
only, the OAI tree neither imported nor built — statement-level re-implementation of
the paper's procedure; fix loop 4 runs 11→3→1→0 errors, walls 64/34/40/53 s ≈ 3.2 min
total; run-1 telemetry OVER=1 = the documented mmapped-Mathlib-olen artifact
(8363 MB mem, max_cpu 0.89 under spec; AGENTS §Modal measured facts), runs 2–4
sub-interval (samples=0); app `crossmath-pilot-78`, image textually-identical to
crossmath-probe/pilot-32 — no layer rebuild):**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `CrossMath.Truffet78.paperSelect_forced_singleton` (A1) | `pilots/78/P0.lean` | PROVED-UNCONDITIONAL | `p0-run4.log:22` (repeat :53) — `[propext, Classical.choice, Quot.sound]` | fidelity, singleton case: the paper's Theorem-4.3 selection returns the (53b)-singleton via branch (47); θ-intervals/T-T′ filters/tie-stages never engage (`dif_pos` + singleton uniqueness) |
| `CrossMath.Truffet78.paper_run_not_optimal` (A2 — the DISCOVERY carrier) | idem | PROVED-UNCONDITIONAL | `:23` (repeat :54) — triad | the paper's procedure (verbatim transcription, §10.1 dictionary) run on the Def-4.2-bounded two-row instance: terminates in the success branch asserting `min z = 1` at `(1,0,0)` while `(0,−1,0)` is feasible at cost 0 — failure is OPTIMALITY, not bookkeeping (cost evals check: `eval initial.cost output = 1`) |
| `CrossMath.Truffet78.instance_unbounded_below` (A2′ sharpening) | idem | PROVED-UNCONDITIONAL | `:24` (repeat :55) — triad | ∀ r : ℝ a feasible point of cost < r exists (witness `(r−1, r−2, r−1)`) — the procedure asserts a finite minimum on an unbounded-below instance. **Spec-signature correction recorded:** the dossier spec's A2′ inequality was reversed (unbounded-above); the proved form is `eval initial.cost w < (r : Coeff)` — dossier corrected by this record. **2026-11-21 cross-note:** the decl stays PROVED but is RETRACTED as an article claim (external-referee revision — homogeneity artifact, witness = any feasible point translated; article v2 §7.1, dossier-78 note (b)) — the row above stands as artifact-audit history |

**Class: NEGATIVE-kind discovery candidate** (procedure-level refutation of Truffet
arXiv:2603.26423 v4's §2.3 optimality claim, promoting the OAI model-level
counterexample `finite_execution_not_optimal` to procedure level; nearest-miss table
of 6 source-checked rows in the dossier incl. Truffet v4 classical sibling
arXiv:2604.06726 = the Stage-B target). **Verification-lane addendum (A1):** census
`axcheck_iter4 decls` = **26 decls = 3 public theorems + 23 private lemmas** — the
in-file audit surface prints the FULL public triad surface (3/3, as the coordinator's
class note says); the 23 private lemmas are unprinted (⊆-triad by elimination: rc=0,
0 sorry, 0 sorryAx in-log; each folds into the printed theorems per the record's
hygiene note). If Stage B charters, the §7b(ii) full-coverage pass covers 78's files
then; TARGETS row deferred with it (family grows). 0 sorry tokens at the 2026-11-17
Step-A pass (proof artifact, no probe header).

### 10.14 FF-EZ4 P0 — LANDED GREEN 2026-11-17 (run 1 GREEN of a 4-run loop; lane A6, r5 rank 9 / §14 row 9 FF-half; folded + re-verified by lane A1) — PROBE-CONVENTION, Step-A only, NEVER a Step-B stage, NO TARGETS row

*(Merged 2026-11-17 by lane A1 from A6's `pilots/ff-ez4/P0-record.md` (worktree
agent-07, pending H's commit). Cites re-verified on agent-07 disk: verdict
`p0-run1.log:15` + SUMMARY :32–33, telemetry :34, provenance header :1, the 11
API-anchor signatures in the GREEN output tail :16–30.)*

**P0.lean (PROBE-CONVENTION statement rung — 216 LoC, sha256(16) `b34f0f709484d949`;
Prop-def convention, `MasterIdentity.lean` idiom, ZERO `sorry` tokens; "not a proof
artifact" declared in-header; the elaboration IS the evidence — no status rows below.
Fix loop 4 runs, 3 fix iterations, 15→8→3→0 errors (universe-rigid `Type`/`Type*`
binders → G3-verbatim `Type _`; PowerSeries C/X idiom; docstring-before-set_option
parse; explicit `(F := F)` at body-only-F applications) — lessons in the log header
for the P1 charter. Substrate: mathlib `ff2494ea` / v4.36.0-rc2, warm family (new
ephemeral app `crossmath-pilot-ffez4`, BYTE-IDENTICAL image block to pilots/71 —
shared layers), doz CLI; wall 76 s, telemetry OVER=1 = the inherent mmapped-olen
class (mem 6146 MB, cpu 0.71 under spec).)**

**Content (statement architecture; tauceti/projModel/toEllipticCurveGeom NEVER
imported — every tauceti object is a binder pinned by its defining equation, the
EnclOK/ProbeE discipline; G6b route as specced):** 13 defs + 1 proved wrapper
(`conditional_shape`, binder-consumption, ProbeG3 precedent) — Weil side =
`HypWeilConjectures`/`WeilBody1`/`stmt_leanEval_d1_iff` (verbatim G3 carry,
specialized d := 1); genus-1 family `genus1A`/`HypWeilGenus1`/`stmt_leanEval_to_genus1`;
tauceti count bookkeeping `tracePowSum`/`HypTaucetiCounts` (N m = q^m + 1 − s_m(a),
binder restatement of `Frobenius/PowTrace` + `Zeta.lean:153`); rational normal form
`zetaNum`/`zetaDen`/`HypTaucetiZetaRat` (ζ·(1−T)(1−qT) = 1−aT+qT², from
`zetaFunction_eq_mul_inv` `Zeta.lean:203`); `HypTaucetiZetaDef` (ζ = exp.subst (mk
fun n => N n / n), `Zeta.lean:161`); **`HypTransport` — the G6b projModel count
transport as opaque binder, THE P0 headline slot**; headline
`stmt_ff_ez4_identification`/`stmt_ff_ez4` (both defining systems ⟹ zeta data agree:
α+β = a, αβ = q, N m = q^m+1−(α^m+β^m), ζ = rational form); restatements
`stmt_ff_ez4_rh_g1` (`Zeta.lean:244`), `stmt_ff_ez4_hasse_g1` (`HasseBound.lean:44`,
`frobeniusTrace_sq_le_four_mul_card`); bridges `stmt_ff_ez4_norm_from_hasse` (FF-EZ1(iii)
at g = 1) + `stmt_ff_ez4_rh_transfer` (tauceti↔Weil RH). 11 mathlib-API `#check`
anchors elaborated (WeierstrassCurve.IsElliptic, Scheme IsProper/
GeometricallyIrreducible/SmoothOfRelativeDimension/Over/Spec, PowerSeries
exp/subst/mk/C/X — signatures in the log tail :16–30). **No gate fired** (rank-9
standing task-slot; the pair's other half 22-T2a/G9 separately GREEN; G6b's Stacks
alternative DEAD, tauceti route designed).

**Sweep treatment (per the record's own ruling, adopted):** Step-A classifier row
(zero tokens today); NO Step-B stage ever; P1 (if chartered) classifies per its lane
report.

### 10.15 74 T1T2T4-P0 — LANDED GREEN 2026-11-17 (run 2; lane A8; folded + re-verified by lane A1) — PROBE-CONVENTION statement rung, never a Step-B stage

*(Merged 2026-11-17 by lane A1 from A8's `pilots/74/74-P0-record.md` (worktree
agent-09, pending H's commit). Cites re-verified on agent-09 disk: verdict
`t1t2t4-p0-run2-fix.log:8` ("GREEN — OK rc=0 errors=0 sorry-warnings=0"), stage OK
`:36–37`, telemetry `:12` (final segment wall 43 s, OVER=0) with BOTH preemption
telemetry segments preserved per the header — the container-preemption restart
record is in-log, input unchanged.)*

**T1T2T4-P0.lean (PROBE-CONVENTION — 172 LoC, sha256(16) `09670d11395b5f70`;
14 defs + 5 statement Prop-defs (`stmt_T1a/T1b/T1c/T2/T4`) + 3 pins on mathlib
ff2494ea; the declared probe sorry class is EMPTY — the file's one `sorry` string is
header prose; warm `crossmath-gprobe` probe route, doz CLI. Run 1 staging FAIL on two
annotation/coercion classes (10× `dependsOnNoncomputable` on the data defs; `j + 1`
elaborating in `Fin k`) → fixed by `noncomputable` ×10 + exponent `((j : ℕ) + 1)`,
the one authorized fix-retry; the anticipated `sInf`/`sSup`-totality and `=o[atTop]`
risks did NOT bite; dated in-file fix note, no content change.)**

**Binder-table confirmation at GREEN (the statement layer's content):** `hMGF`
(verbatim MarginalTails first clause, `Statements.lean:482–485`) elaborated inside
`InMGFClass` + `stmt_T1c` ✓; `hVarLB` (extremal-family variance floor κ·B ≤ Var(P B))
= the inventoried open core, elaborated in `stmt_T4` — **P1-e's discharge target**;
`hB`/scale absorbed into `InMGFClass`'s `1 ≤ B`; the `u ≠ 1` degeneracy void by
construction (filtered `mU`) — no side condition needed anywhere. **P1 GO input with
two charter prerequisites:** (1) Q1 resolved first (core-prep §5: T4's
class-restricted-B₁ vs per-spectrum-floor reading decides P1-e's target shape; owner
A4 + chartering lane; P0 shape is (ii)); (2) run-1's lesson travels (annotate
`noncomputable` at authoring time on data-carrying defs over
`Real.log`/`negMulLog`/`sInf`/`sSup`; coerce `Fin k` exponents explicitly). Effort
S-class (≈0.6–1k LoC); T3 stays unchartered (+M). Sweep treatment: Step-A row (0
tokens), never Step-B, no TARGETS — the record's own class.

### 10.16 ZZV2-λ P1 — LANDED GREEN 2026-11-17 (lane A3; the ladder's FINAL rung — HARD STOP executed per r5 §12a; folded + re-verified by lane A1)

*(Merged 2026-11-17 by lane A1 from A3's block authored into a STALE baseline copy of
this file in agent-04 (labeled §10.8 there) — renumbered to the live lineage as
§10.16; content verbatim below except this note + the addendum. Cites re-verified on
agent-04 disk: verdict `p1-run3.log:143`, the 10 triad prints `:145–:155` (repeats
`:157–:166`, the two `_private.P1.0.*` records included), telemetry `:171`, header
route note `:2`, RESULT block `:177–:180`.)*

**P1.lean (`ZZLam`, proof artifact — 290 LoC ≤ 300 guard; 10 theorems + 5 defs; sha256
a9a6555cadcd604c ✓; elaborated INSIDE the built ZetaZerosV2 tree, mathlib pin ff2494ea,
toolchain v4.36.0-rc2, M4b2 recipe; verdict `p1-run3.log:143`: `P1.lean: OK` under the
runner's SORRY-STRICT branch — rc=0, 0 errors, 0 sorry. FULL PRINT SURFACE 10/10
triad-only incl. both private helpers; token-level log sweep: only
propext/Classical.choice/Quot.sound appear — zero sorryAx, zero native_decide.
Descent: run1 wiring friction (lake v4.36.0-rc2 has NO -j flag → `taskset -c 0,1`
build cap; no elaboration), run2 3 mechanical errors (2× noncomputable markers on the
dividing constant defs — the m4b2-run1 class; 1 rcases flattening) with 8/10 already
triad, run3 GREEN, wall 582 s. Route: doz/semraker.)**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `ZZLam.thm_simple_lam` | `pilots/zzv2-lam/P1.lean:124` | PROVED-CONDITIONAL — binders: `P : LamParams` (data: lam + hpos : 0 < lam, the P0(a)-pinned minimal range), `c : ℝ`, and the ONE kernel-sum binder `hKS : KSAsymptotic P.lam c` (= `∃ eta, IsAdmissible lam eta ∧ Tendsto (Re (KS η T)/zeroScale T) (nhds c)` — `kernelConstruction`'s tuple minus the frozen λ=1/2 constant), + `ε > 0`; NO donor-binder discharge claimed | `p1-run3.log:149` (repeat :161) — `[propext, Classical.choice, Quot.sound]` | family thm 1: eventually `C0Lam c − ε = 2 − c − ε < simpleOnLineCount/N(T)`; consumes `simpleOnLineCount_lower` + `eventually_simple_proportion` + RvM bookkeeping (donor, public) |
| `ZZLam.thm_distinct_lam` | `P1.lean:149` | PROVED-CONDITIONAL (same binder shape) | `:150` (repeat :162) — triad | family thm 2: `C1Lam c − ε = 3/2 − c/2 − ε < distinctZeroCount/N(T)`; consumes `distinctZeroCount_lower` + `eventually_distinct_proportion` |
| `ZZLam.thm_average_lam` | `P1.lean:175` | PROVED-CONDITIONAL (same binder shape) | `:151` (repeat :163) — triad | family thm 3: `C1Lam c − ε < (simpleZeroCount + onLineCount)/(2N(T))`; consumes `simpleZeroCount_add_onLineCount_lower` + the LOCAL copy of the donor's private `eventually_average_proportion` (cited) |
| `ZZLam.thm_simple_or_critical_lam` | `P1.lean:204` | PROVED-CONDITIONAL — same binder shape + the A-window hypotheses `1 ≤ c + ε/2 < 2` (which the donor derives from its frozen constant bounds; kept explicit here) | `:152` (repeat :164) — triad | family thm 4: `C2Lam c (ε/2) − ε < simpleOrOnLineCount/N(T)`; consumes `simpleOrOnLineCount_lower` + the local copy of the private `eventually_le_mul_of_tendsto_ratio` |
| `ZZLam.KSAsymptotic_mono` | `P1.lean:75` | PROVED-UNCONDITIONAL (Prop-level; λ-free) | `:145` (repeat :157) — triad | domain pin: admissibility windows widen — the same witness serves every `lam' ≥ lam` |
| `ZZLam.exists_KSAsymptotic_of_half_le` | `P1.lean:85` | PROVED-UNCONDITIONAL (donor `kernelConstruction` as the witness) | `:146` (repeat :158) — triad | domain pin: family nonempty on `[1/2, ∞)` with constants ε-close to `montgomeryTaylorConst` — via the FROZEN kernels re-windowed, not new λ-kernels |
| `ZZLam.thm_simple_lam_half_regression` | `P1.lean:239` | PROVED-UNCONDITIONAL (donor `kernelConstruction` discharges the binder) | `:153` (repeat :165) — triad | L4-at-binder: family at `lam = 1/2` re-derives the donor's headline constant `3/2 − (1/√2)cot(1/√2)` bit-for-bit |
| `ZZLam.thm_distinct_lam_half_regression` | `P1.lean:258` | PROVED-UNCONDITIONAL (same discharge) | `:154` (repeat :166) — triad | L4-at-binder: re-derives `5/4 − (1/(2√2))cot(1/√2)` bit-for-bit |
| privates `eventually_average_proportion_lam` (:95), `eventually_le_mul_of_tendsto_ratio_lam` (:109) | `P1.lean:95,:109` | PROVED-UNCONDITIONAL — cited verbatim copies of the donor's PRIVATE lemmas (`ZetaZeros/Proportions.lean:32/:47`, inaccessible cross-module) | `:147–:148` (repeats :159–:160) — triad | λ-free bookkeeping only; the copying is recorded as donor-debt-free (no statement drift — the copies are literal modulo renaming) |
| defs (no status rows per §10 conventions): `LamParams` (:40), `KSAsymptotic` (:54), `C0Lam` (:62), `C1Lam` (:66, noncomputable), `C2Lam` (:70, noncomputable) | `P1.lean:40–70` | definitions — the binder + functional vocabulary; NO closed form in `lam` guessed | — (elaborated by the OK compile) | the P0(b) seam is EXACTLY `KSAsymptotic`: everything an iteration-5 Landau η-port must produce is this one Prop at scaled kernels |

**HARD STOP (r5 §12a, executed 2026-11-17):** P0(b) MT-frozen + P1 GREEN ⇒ the ladder
ends here for iteration 4; P2 (glue/continuity/margin; any λ ≠ frozen binder
discharge) = a Landau η-port = iteration-5 charter decision (diagnose-note in
`P1-record.md` specifies the iteration-5 ask as exactly `∃ c, KSAsymptotic lam c` at
λ-scaled kernels). P3 full-coverage axcheck: the in-file 10/10 enumeration is
exhaustive (no dotted/`@[simp]` theorems in the artifact); the axcheck_full sweep
remains available to close-out on demand.

**Verification-lane addendum (A1, 2026-11-17):** **Telemetry class note (incl. the
run-1 infra finding, per relay):** `wall=582s max_cpu=12.73 OVER=8, max_mem=2949MB <
4096` (`:171`) — the OVER window is the t=180 `lake update`/cache git+zstd burst in
the PRE-taskset phase (`:180`); the build itself was CPU-capped via
**`taskset -c 0,1` because lake v4.36.0-rc2 has NO `-j` flag** (`:2` — the run-1
finding; this is the working CPU cap for donor-tree build phases pending a lake
`-j`, and it supersedes the §10.5 "-j 2" note for donor-tree runs). Step-B class:
proof artifact in the BUILT donor tree ⇒ [LAYERS]-donor-tree stage at sweep
(`run_m4b_donor_axcheck.sh` recipe, AxPilot42_M4b precedent); P1's own 10/10 in-file
surface is the landed evidence; census check deferred to the sweep staging (10
theorems + 5 defs claimed, no dotted/`@[simp]` per A3 — verified by enumeration in
`P1-record.md`). §7a's zzv2-P1 "owed" row resolves LANDED (below).

### 10.17 10-D1 — LANDED GREEN 2026-11-17 (run 1 GREEN of a 4-run loop; lane A6, orchestrator D1-ONLY charter ruling; folded + re-verified by lane A1) — engineering/plumbing landing, NEVER novelty

*(Merged 2026-11-17 by lane A1 from A6's `pilots/10/D1-record.md` (worktree agent-07,
pending H's commit). Cites re-verified on agent-07 disk: verdict `d1-run1.log:14`
(L3.lean OK, rc=0/0/0), the 6 Part E axiom prints `:25–:30`, the L2-substrate
regression prints `:16–:24`, GREEN telemetry `:50` (wall 51 s, OVER=0), full
provenance `:1` incl. all four run URLs and the SPEC CORRECTION.)*

**L3.lean (proof artifact — 2,805 LoC, sha256(16) `34534c1ca14f009e`; = 48-line D1
header + L2.lean VERBATIM (2,625 lines, sha 845ce129…; itself M1 A–D verbatim) + Part
E 132 new lines, namespace `Groundwork.PadC`. Billing line CHARTER-FIXED: plumbing /
completion-value — no discovery claim; the machine-layer headline
(`exists_tm_padded_space`, D4) stays unchartered. Substrate mathlib `ff2494ea` /
v4.36.0-rc2, new ephemeral app `crossmath-pilot-10` (pilots/32 generic-runner clone,
byte-identical image block — shared layers), doz CLI PRIMARY, lane-unique stage; fix
loop 4 runs / 3 fix iterations (1→3→1→0; every error class in the log header; the
≤3 budget exactly met). L2-substrate regression re-verified triad IN THE SAME RUN
(`exists_tm_space` family + the `Counted` block, `:16–:24`).) Coverage class **C2**
— the six in-file prints cover ALL Part E theorems:

| decl | file:line (L3.lean Part E) | status | axioms print source | notes |
|---|---|---|---|---|
| `size_bools` | `pilots/10/L3.lean` (Part E) | PROVED-UNCONDITIONAL (data-only) | `d1-run1.log:25` — `[propext, Quot.sound]` | eth `Pad.lean:53` verbatim (`size x = 2·|x|+1` for `List Bool`) |
| `size_two_pow` | idem | PROVED-UNCONDITIONAL (data-only) | `:26` — `[propext, Quot.sound]` | `size (2^k) = k + 2` via `Nat.size_pow` (eth's `Nat.log2_two_pow` name absent at this pin) |
| `padM'_reaches` | idem | PROVED-UNCONDITIONAL | `:27` — triad | the doubling induction — eth `padM_reaches` (`Pad.lean:68–88`) verbatim shape; `Nat.log_pow` for the pin |
| `padM'_runs` | idem | PROVED-UNCONDITIONAL | `:28` — triad | ends after `e x + 1` steps at `A' (x, 2^(e x))`, states ≤ `2|x| + e x + 4` — **strictly smaller than eth's `2|x| + 2·2^(e x) + 3` at every node** (the exponential enters only through the NUMBER of doublings, never the state) |
| `padM'_state_poly_pair` | idem | PROVED-UNCONDITIONAL | `:29` — triad | states polynomial in `|x| + e x` (degree 2) — the honest D1-native form |
| `padM'_state_poly` | idem | PROVED-CONDITIONAL — explicit value-polynomiality binder `hv : ∃ k, ∀ x, e x ≤ (|x|+2)^k` | `:30` — triad | the D4-consumable S-hypothesis form (`exists_tm_space` consumes `S ≤ (|x|+2)^d` per run) — see the SPEC CORRECTION |
| (rfl lemmas) `size_bool'`/`size_list'`/`size_nat'` | idem | data-only (no status row by convention) | — (rfl; elaborated by the OK compile) | the anonymous `HasSize` instances as simp/rfl lemmas (eth Groundwork carried these; the M1 embedding does not) |

**SPEC CORRECTION adjudicated by this landing (for the charter owner + D2/D4; also
in the log header `:1` and the record):** `next-tranche-spec.md` §2 D2's
`padM'_state_poly (he : PolyT e) : ∃ d, ∀ x, 2|x| + e x + 4 ≤ (|x|+2)^d` is **FALSE
as written** under the substrate's binary `Enc ℕ` (`L2 :1017`): `PolyT` bounds the
WORD of `e x`, never its value — `e x = 2^(|x|^2)` is word-polynomial,
value-exponential, and refutes the displayed inequality. Part E lands the two TRUE
forms (unconditional pair-form + the `hv`-conditional); **D4's assembly must supply
`hv`** (or derive it Solver-side where `e` is value-polynomial by construction).
Suggested spec edit owner: H / A6-with-charter. **D2 inputs untouched** (no
`IsPolyT (padM' …)`, no `fun_prop` changes, no `Carried` transcription — the eth
`EncLemmas.lean:106–127` gap stands; Route A/B remains where the spec left it).
Fix-loop lessons (log header + record): close header doc-comments; monotone chains
not `nlinarith` for `(l+2)^3`; the `Nat.pow_add` + explicit `k+4=(k+3)+1` rewrite
idiom (pin's `Nat.pow_succ` is succ-typed).

**Step-B note (per the record's close-out duties):** `AxPilot10_L3` TARGETS append
**at sweep** per the spec's §6 protocol (NOT appended at landing — L3 grows with the
D-tranches); full-coverage `axcheck_full.py`/`axcheck_iter4 gen` standard when
staged; the landed C2 evidence above is the interim record. §7a's 10-tranche row
updates D1→LANDED.

### 10.18 73-Q4 — LANDED GREEN 2026-11-17 (the hRat discharge; lane A2 executing per the GO memo `pilots/73/Q4-gate-memo.md`; runner warm `crossmath-pilot-73`, doz CLI, SPEC 2cpu/4GB + telemetry + LEAN_NUM_THREADS=2, mathlib `ff2494ea`; folded + re-verified by lane A1)

*(Merged 2026-11-17 by lane A1 from A2's block authored into a STALE baseline copy of
this file in agent-03 (labeled §10.7 there) — renumbered to the live lineage as
§10.18. Cites re-verified on agent-03 disk: verdict `q4-run15-green.log:7` + `:43`
(Q4.lean OK rc=0/0 errors/0 sorry-warnings) with C.lean regression OK `:24`/`:101`
in all 15 runs; **all 23 triad prints at `:45–:67`** (incl. the mangled
`_private.Q4.0.Pilot73.*` forms); telemetry `:103` (wall 26 s, OVER=0); sha
491af05ab4b95e76 ✓, 586 lines ✓. **DATED CORRECTION (A1, extractor-generated):** the
block's header said "22 theorem decls — 8 public + 14 private"; the census says
**23 decls = 14 public + 9 private** (`axcheck_iter4.py decls`), matching the 23
in-file prints exactly — total and public/private split corrected here; the
per-decl table below is unaffected.)*

**Q4.lean (proof artifact — 586 lines incl. the in-file audit tail; 23 theorem decls
— 14 public + 9 private — every one with a direct in-file `#print axioms`; coverage
C1; disk sha256 491af05ab4b95e76…; GREEN run `pilots/73/logs/q4-run15-green.log`):**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| **M0** `heckeSeriesT_rational_of_periodicity` (C1, the hRat discharge) | `pilots/73/Q4.lean:511–543` | PROVED-UNCONDITIONAL — `hRat` DISCHARGED for the 𝔽_q(T) probe class (modulus `span M`, `M.Monic`, `1 ≤ M.natDegree`); NO donor binders (mathlib-only) | `q4-run15-green.log:66` — `[propext, Classical.choice, Quot.sound]` | the r5 §13 M0 skeleton, upgraded with the explicit modulus fence (degenerate `span M = ⊤` modulus recorded in the header, not silently assumed); witness `P₀ = 1 − qT`, `P₁` the degree-≤-deg-M truncation, `P₀.eval 0 = 1 ≠ 0` |
| **Q4-c** `hecke_continuation_unconditional` ((P)(i) unconditional) | `pilots/73/Q4.lean:548–559` | PROVED-UNCONDITIONAL — consumes M0's witness into C.lean's GREEN `hecke_continuation` (`hRat` binder discharged BY CONSTRUCTION); `hPur` untouched | `q4-run15-green.log:67` — triad | (P)(i) unconditional for the 𝔽_q(T) probe class — "(i) unconditional BY CONSTRUCTION at the probe, (ii) conditional everywhere" (gate memo §2.4); `hPur` stays a binder at C.lean's `hecke_window` per the §3 fence (never discharged — Weil-RH-for-Kummer-covers, prework §2.4) |
| **Q4-a core** `sum_apply_span_eq_of_degree_le` (residue-class uniformity) | `pilots/73/Q4.lean:389–451` | PROVED-UNCONDITIONAL — level-n coefficient = `q^{n−deg M} · S` for `n ≥ deg M` | `q4-run15-green.log:62` — triad | the `q^{n−d}` uniformity via `Finset.sum_nbij'` over build ↔ canonical decomposition (`div_modByMonic_unique` supplies uniqueness) |
| `canonical_divByMonic` / `monic_mul_add_natDegree` | `pilots/73/Q4.lean:337–375` / `:313–334` | PROVED-UNCONDITIONAL | `q4-run15-green.log:61` / `:60` — triad | the monic-quotient decomposition (Q4-a) |
| K1 cone layer: `apply_span_singleton_congr_of_dvd_sub` (congruence-invariance), `apply_span_singleton_eq_zero_of_not_isCoprime` (vanishing), `span_sup_span_eq_top_iff` (cone bridge), `isCoprime_congr_of_dvd_sub`, `not_isUnit_of_one_le_natDegree` | `pilots/73/Q4.lean:266–305` / `:252–261` / `:233–247` / `:213–220` / `:224–230` | PROVED-UNCONDITIONAL | `q4-run15-green.log:59` / `:58` / `:57` / `:55` / `:56` — triad | K1 = the common-multiple-inverse trick; cone bridge `span f ⊔ span M = ⊤ ↔ IsCoprime f M` via `Submodule.mem_sup`/`sup_eq_top_iff` (element-level Bézout, no gcd machinery) |
| parametrization layer: `mem_monicDegreeN_iff`, `card_monicDegreeN` (= `q^n`), `mem_resFinset_iff`, `natDegree_psiVec_lt`, `eq_psiVec_of_lt` | `pilots/73/Q4.lean:105–160` / `:146` / `:197–207` / `:169–181` / `:185–191` | PROVED-UNCONDITIONAL | `q4-run15-green.log:50–54` — triad | the faithfulness check + the count (prework R2 mitigation) |
| series-coefficient layer: `coeff_heckeSeriesT` (= the monic sum, by `coeff_mk`), `coeff_mul_one_sub_X` (= `L_n − q·L_{n−1}`, homomorphic via the `Polynomial.coe_*` family + `coeff_C_mul`/`coeff_succ_mul_X`/`coeff_zero_mul_X`), `coeff_trunc` | `pilots/73/Q4.lean:462–467` / `:471–484` / `:488–507` | PROVED-UNCONDITIONAL | `q4-run15-green.log:63` / `:64` / `:65` — triad | Q4-b geometric assembly with `P₀ = 1 − qT` |
| private helpers `poly_coeff_finset_sum` (ring-generalized), `finset_sum_const_eq`, `coeff_sum_monomial_eq`, `coeff_sum_monomial_eq_zero`, `coeff_monic_param` | `pilots/73/Q4.lean:51–102` | PROVED-UNCONDITIONAL | `q4-run15-green.log:45–49` — triad | the coefficient/Finset-sum commute is LOCAL (ring-generic, own `{R}` binder — the section-variable `k` cannot leak to `Fintype ℂ`) |

**Substrate/pins:** mathlib `ff2494ea` / v4.36.0-rc2, `import C` sibling-olen staging
(runner unchanged from Cycle 2). **Rosen citation status:** GTM 210 ch. 8 carried as
PROVISIONAL pin per the gate memo §4 (C2 :127–:130 lineage; one-lookup verification
due at the dossier-upgrade write-up — this table rows the Lean record only).

**Machinery notes (the 15-run descent 44→19→11→6→5→1→1→1→1→1→1→2→2→0 errors):** the
ported-from-nothing file needed (i) `Mathlib.Algebra.Polynomial.{Div,Monic}` imports
(the `/ₘ` notation and the `Polynomial.Monic.*` lemmas are outside C.lean's import
closure); (ii) pin-name deltas — `Polynomial.coeff_coe` and the ENTIRE
`Polynomial.coe_*` coercion-hom family are `Polynomial`-namespaced (not `PowerSeries`)
at this pin, `natDegree_eq_of_degree_eq_some` (not `natDegree_of_degree_eq`),
`Finset.sum_eq_single` lost its membership argument, `Submodule.sup_eq_top_iff`
explicit-pair form; (iii) a section-variable leak (`Fintype ℂ` demands) fixed by
ring-generalizing the shared helper; (iv) the antidiagonal two-point extraction
abandoned for a homomorphic coefficient computation. Warnings-only residue:
deprecated `if_pos/if_neg/dif_pos/dif_neg` rewrites + unused-simp-arg linter notes
(`q4-run15-green.log` tail). Full lineage in the log headers
(`q4-run1..15-green.log`); telemetry 0 OVER in every run.

**Verification-lane addendum (A1):** Step-B `AxPilot73_Q4` TARGETS append owed at
sweep (Q4.lean is FINAL — the hRat discharge landed; `import C` sibling rewrite
auto-handled by the generalized dict, AxPilot73_C present); coverage C1 stands
(23/23 direct prints — stronger than the sweep stage's public-only surface). §7a's
73-Q4 row resolves LANDED.

### 10.19 FF-EZ2 P0 — LANDED GREEN 2026-11-17 (run 3 of ≤3; lane A3, r5 §2 S4 / §14 row 13, battery CHARTER-GO; folded + re-verified by lane A1) — PROBE-CONVENTION statement rung, never a Step-B stage

*(Merged 2026-11-17 by lane A1 from A3's `pilots/ff-ez2/P0-record.md` (worktree
agent-04, pending H's commit). Cites re-verified on agent-04 disk: verdict
`p0-run3.log:14` ("P0.lean: OK (probe, sorry allowed)" with NO sorry suffix = 0 Lean
sorry-warnings), SUMMARY :24–25, telemetry :26 (wall 36 s, OVER=0), RESULT block :33
(GREEN FINAL; the 2 prose "sorry" hits in-log are the verdict label + header line),
descent :34 (3→2→0 over runs 1–3); sha 396f7183e73b3d23 ✓, 162 LoC ✓.)*

**P0.lean (PROBE-CONVENTION — 162 LoC, sha256(16) `396f7183e73b3d23`; mathlib
`ff2494ea` / v4.36.0-rc2, mathlib-only, ZERO sorry by construction (Prop-def
statement convention, the FF-EZ4 sibling pattern); new ephemeral app
`crossmath-pilot-ffez2`, image block byte-identical to the ffez4/71/probe family,
doz CLI, stage discarded. Billing: statement rung of the FF-EZ2 survivor —
formalization-first, exclusion-guarded, NOT a discovery claim ("warm-up grade"
mathematics). No status rows — the elaboration IS the evidence.)**

**Statement surface (all elaborated; 7 `#check` anchors resolved per the RESULT
block):** Weil-side binders (G3/G6b statement-level class, never build deps) —
`HypFrobeniusSpectrum` (the purity/RH clause of `LeanEval/WeilConjectures.lean:185–194`
as binder data) and `HypBaseChangePower` (the conclusion of
`Weil.rationalFrobeniusCharpolyReverse_eq_comp_of_comp_specAlgebraMap_eq`,
`FieldOfConstantsFrobenius.lean:163` — the base-change eigenvalue power law) +
`baseChange` as data; combinatorial simplicity layer — `ZerosSimpleAt`, `lPolyM`
(carried from `pilots/71/P2.lean:57`), `simpleProportion`,
`stmt_lpoly_squarefree_iff`; the battery's binding guards IN-FILE —
`NoRootOfUnityCollisions` (the exclusion hypothesis) and
`stmt_maximal_violates_exclusion` (the falsity trap as NEGATION — Fuhrmann
arXiv:alg-geom/9610023 + Tafazolian–Torres 2012 pins dated; no uniform-in-family
statement); the survivors — `stmt_ff_ez2_base_change_density` (under purity +
exclusion, the extension degrees with all-simple base-changed zeta have natural
density 1) + transport form `stmt_ff_ez2_family_form` (via the Weil :163 binder) +
the trivial wrapper `conditional_shape` (FF-EZ4/ProbeG3 precedent). Informal
neighbors dated in-header (Bui–Florea 1605.07092 family-average; Suzuki 2610.41115
method-neighbor, month-clock clean 2026-11-17).

**STATEMENT-RUNG CORRECTION (recorded, carried per relay):** the bridge §4 sketch
claims the unconditional per-level proportion satisfies "distinct powers ≥ distinct
values"; **the true direction is ≤** (powering can only merge values; e.g. {1, −1}
at m = 2). Carried corrected as `stmt_power_merge_le`; what the exclusion hypothesis
buys is (at least) all-m simplicity, hence density exactly 1.

**Guard compliance (the battery's binding list, 5/5):** exclusion/family-quantified
shapes only; maximal-member exclusions per the dated pins; Weil side
statement-binder only (zero donor imports, file:line cites); claims dated; falsity-trap
design rule. Sweep treatment: Step-A row (zero tokens), never Step-B, no TARGETS.

### 10.20 10-D2 — PARTIAL GREEN 2026-11-17 (canary milestone fully GREEN; ONE diagnosed statement error at fix-budget exhaustion; lane A6, orchestrator D2-GO ruling; folded + re-verified by lane A1) — plumbing billing, never novelty

*(Merged 2026-11-17 by lane A1 from A6's `pilots/10/D2-record.md` (worktree agent-07,
pending H's commit). Cites re-verified on agent-07 disk: both log provenance headers
(`d2-run1.log:1` attempts 1–3 ending in the GREEN canary; `d2-run2.log:1` attempts
4–6, final sha ad366b23… + the diagnosed fix), the final-state `carried_σ` clean
prints `d2-run2.log:38/:42` — `[propext, Quot.sound]`, attempt-6 telemetry (wall
99 s, mem 5661 MB = mmapped-olen class, OVER=1 soft). L4.lean on disk: sha
ad366b23e9d22bb7 ✓; 3,343 lines by wc vs the record's 3,341 (2-line drift,
header-class); **0 real sorry tokens** — the file's 4 `sorry` strings are the
compliance-header prose lines :45/:85/:101/:143.)*

**L4.lean (3,341 LoC per the record = 46-line D2 header + L3.lean verbatim 2,805 +
Part F ~490; fix-loop ≤4 EXHAUSTED — 4 fix iterations across 6 runs, stopped per
budget with one error remaining and its 2-line fix diagnosed. NOT final: the file on
disk is the maximal VERIFIED state, carrying one elaboration error.)**

**LANDED GREEN (the verified triad surface, attempts 3–6):**

| item | status | evidence |
|---|---|---|
| **D2 FIRST BILL — the `Carried` instances** (eth `EncLemmas.lean:106–127` verbatim; Unit/Bool/ℕ/×/⊕/Option/List — ℤ skipped, unneeded for σ) + `carried_σ : Carried ((List Bool × ℕ) ⊕ Bool)` | GREEN — `[propext, Quot.sound]` (data-only) | `d2-run2.log:38` (repeat :42) — final state |
| EncLemmas excerpt (wd_inl/inr, len_* family, two_le_len_list) + size_* rfl lemmas; structural fragments (eth TM/Ops: pop1/swapF/consF/unconsF + toA/toB within-lemmas); `PolyT.of`/`congr`/`of_wd` (eth PolyT.lean:62–100 verbatim); `attribute [fun_prop] Groundwork.PolyT` ACCEPTED at v4.36; eth `Closure/Basic` verbatim; `Closure/Cases` excerpt (within_branch, tagHead(+eq), sumCore, cond', sumElim — `TM.code`-qualified, root `code` ambiguous at this pin) | GREEN | canary run + attempt 4–6 verdicts (log headers) |
| `padM'_out_polyT` (the out field, Sum-elim), `canary_init` (the init field's body, projection-free), `canary_pair` | GREEN — `by fun_prop`, triad-only | `d2-run2.log:1` header (attempt-5/6 GREEN content) |
| L3/L2/M1 substrate regression (exists_tm_space family, Counted block, Part E) | GREEN, triad | in-run re-verification |

**THE ONE REMAINING ERROR (diagnosed; 2-line fix QUEUED, not applied — budget):**
`padM'_init_polyT`'s **statement** fails elaboration — `Enc (padM' e A').σ` synthesis:
the `.init`/`.σ` structure projection blocks instance search even under the type
ascription (PolyT's β binds the projection before the ascription wins; attempt 6's
have/exact wrapper proved it statement-level, not a proof problem). Queued fix:
state it projection-free (the already-proved `canary_init` shape) + the rfl bridge
`padM'_init_eq : (padM' e A').init = fun x => .inl (x, 1) := rfl`; the future
`padM'_isPolyT` consumes the pair.

**ROUTE A/B OUTCOME — Route A VALIDATED, recommended:** `fun_prop` closes goals over
the user class at v4.36 (canary_init/canary_pair/padM'_out_polyT all `by fun_prop`,
triad); transcription churn ≈ 0 on ~490 lines (two mechanicals: eth's file-level
`variable {α β} [Enc α] [Enc β]` is LOAD-BEARING for the Carried instance heads;
`TM.code` qualification). **Step field = the charter call, source-measured:** the
honest transitive closure of `step`'s numeric atoms (decide_le/log2'/mul via eth
Nat1/Nat2/Fold) re-measured at ≈ 450–550 verbatim LoC — guard (iii) (>0.6k) formally
exceeded on Route A, and Route B (≈ 250 LoC) is under-priced the same way (≈ 300–400
new-LoC with real correctness burden) — **recommendation: COMPLETE ROUTE A at the
next slot** (B has no price advantage). **D3-readiness:** `pad_bound` +
`padded_time_absorb` are independent of the step field and can land while it pends;
D4 needs `padM'_isPolyT`'s three fields complete.

**Verification-lane addendum (A1):** (i) **intermediate-state note:** `d2-run1.log:64`
prints `carried_σ` with `sorryAx` — that is ATTEMPT 2's in-flight proof state within
the log, superseded; the attempt-3 GREEN canary and the final state print it clean
`[propext, Quot.sound]` (`d2-run2.log:38/:42`). Not a violation (fix-budget
mechanics); recorded so nobody reads :64 as the final evidence. (ii) Step-A: 0 real
tokens (prose-only occurrences). (iii) Step-B: `AxPilot10_L4` rides the same
AT-SWEEP protocol as L3 (the D-tranche family grows; the row lands when the family
finalizes — the PARTIAL state here is the interim record, with the queued 2-line fix
explicitly NOT applied). §7a's 10-tranche row updates D2→PARTIAL (canary GREEN;
step-field charter call pending).

### 10.21 74-P1 — NOT-GREEN, honest stop at the 6-run budget (lane A8, 2026-11-17; folded + re-verified by lane A1) — the FINDS stand as record; residue mechanical

*(Merged 2026-11-17 by lane A1 from A8's `pilots/74/74-P1-record.md` (worktree
agent-09, pending H's commit). Cites re-verified on agent-09 disk: the combined
log's descent ledger `p1-runs1-6-combined.log:8` (62→60→57→50→46→46), per-run
verdicts :47/:59/:61/:64/:69 (FAIL rc=1 throughout), the run-6 process disclosure
:14–16, telemetry :17–18; P1.lean sha256(16) `170520aa2fd5509d` ✓.)*

**P1.lean (NOT-GREEN at budget — six runs = initial + 5 fix-retries, the charter
ceiling; error descent 62→60→57→50→46→46, rc=1 throughout. Zero forced gaps: the
artifact never left proof-artifact discipline — "all 7 theorems remain honestly
unproved-in-Lean" (`:16`). The stop is per the abort rule; the residue is
mechanical, not mathematical.)**

**The four FINDS (real mathematics; stand regardless of elaboration state):**
- **FIND #1 (REFUTATION — itself a dossier-74 deliverable):** the dossier's T1(a)
  per-spectrum floor √((1−ε)/ε·Var) ≤ W_ε is **FALSE** — counterexample verified
  numerically (p₀ = 1−δ, n atoms at δ/n: Var ≈ 3.36, W_{0.01} ≈ 0.184, claimed
  floor ≈ 18.2). The honest per-spectrum statement is the marking bound T1a′:
  Var ≤ (1−ε)W² + ε·Mdev². The class-level √-floor survives only at shape (i) = P2
  (the [HYPOTHESIS] tag earned its keep).
- **FIND #2:** the transcribed hMGF ("log m_u ≤ uS + σ²u², ∀|u| ≤ δ") is degenerate
  at u < 0 (needs 2|u|S ≤ σ²u² near 0 — fails whenever S > 0); the faithful
  MarginalTails reading is the CENTERED form ∑ p·e^{u(K−S)} ≤ e^{v·u²}.
- **FIND #3:** the dossier's exact constants (2σ², 1024 = 2·512) need the limit
  argument (log g(u)/u² → Var/2); the elementary window-edge constants are
  Var ≤ 8(e^{v·u₀²}−1)/u₀² and W ≤ (log(2/ε)+v·u₀²)/u₀ — Θ-shapes confirmed.
- **FIND #4:** T4's per-spectrum o(√B) negation is refuted at shape (ii) by the
  FIND #1 family (Var ≥ κB realizable with W = o(√B) along subfamilies) — the
  tightness statement is inherently class-level = shape (i) = P2, consistent with
  the Q1 ruling (recorded in the artifact header).

**Residue taxonomy (the resume map; 8 classes, ALL API-signature drift vs
v4.36.0-rc2, each with its leading fix hypothesis in the record):** Finset
le_max'/le_min'/min'_mem arities (triangulated to the `(s, a, m ∈ s)` shape); the
Real.sInf family shapes (restored in the final batch); `Finset.sum_add_sum_compl`
arg order; `Finset.sum_subset` subset-must-be-APPLIED; ring-grouping syntactic
discipline for `rw` (the assert that aborted the final batch); sum_filter arg order
+ summands (fixed via `linarith [h]`); `by_cases` negative branch needs
`not_le.mp`/push_neg (`lt_of_not_le` unknown at the pin); heartbeat blowups (2M) in
the two heaviest proofs once cascades stack — precompute the final algebra chains.
**Root cause, honestly stated (A8):** authoring ~600 LoC of real-analysis Lean
against a pin with no local elaboration — the probe route is batch-only, so each
signature guess costs a full run.

**Run-6 process disclosure (carried per relay, in A8's own words):** the final fix
batch aborted on a script assert BEFORE writing, and run 6 was fired without
verifying the patch had applied — run 6 elaborated a file byte-identical to run 5.
Owned in the record; not a Lean finding. (Also the origin of the taskset finding's
lineage via A3's P1 — see `runner-fixes-wave2.patch`.)

**Completion re-charter (A8's recommendation to the orchestrator):** re-charter P1
with a fresh ≤5 budget AND (a) a LOCAL `lake env lean` loop (the encore checkout +
stage dir — the substrate exists on this machine) or (b) two-batch remote discipline
(fix-batch → verify-script-applied → fire). Expected distance to GREEN: the 8
classes, all one-line-to-ten-line fixes; 2–3 interactive-loop iterations.
Decomposition state: P1-a designed-not-elaborated; P1-b pair-bounds designed; P1-c
instantiation designed (window match exact); P1-d/P1-e written-not-elaborated.
T3 unchartered (unchanged).

**Verification-lane addendum (A1):** (i) **sorry-state honesty note:** the on-disk
P1.lean carries **0 real sorry tokens** (its 2 strings are the :3 compliance line
and the :675 audit-tail comment — verified); the combined log's runs 1–3 print
`sorry-warnings=2` vs runs 4–6's 0 — classified as FAIL-cascade diagnostic counters
on partially-elaborated decls (runs 4–6 = 0, the file = 0 tokens); the record's
"zero sorry" claim is file-level TRUE, the run-1–3 counters are superseded state —
the resume lane mechanically confirms at the re-charter if it matters. (ii) Step-A:
0 tokens (this file). (iii) No Step-B row (NOT-GREEN — nothing to stage); the FINDS
route to the dossier/triage records, not the verification tables' status rows. §7a's
74 row: P0 GREEN (§10.15) + P1 NOT-GREEN-at-budget with re-charter pending.

### 10.22 75-N2 P1 — M1 CHECKPOINT: core GREEN-triad, packaging PENDING-closure (lane A5, orchestrator P1 GO 2026-11-17; folded + re-verified by lane A1) — honest checkpoint row, NOT final

*(Merged 2026-11-17 by lane A1 from A5's `pilots/75/N2-P1-record.md` (worktree
agent-06, pending H's commit). Cites re-verified on agent-06 disk: the +1-deviation
justification header `n2-p1-run7.log:2–:10`, run-7 verdict `:172` (FAIL rc=1
errors=8 sorry=3), the four core triad prints `:175–:178` (repeats `:328–:331`),
the three packaging sorryAx-cascade prints `:174/:179/:180`, the Pa/P0 heritage
blocks `:27+`; v8-on-disk sha `3102b2eb63c46b37`, 368 LoC, **0 real sorry tokens**
(3 prose strings: hygiene header ×2 + audit-tail comment — the record's "zero sorry
written" claim verified at file level; the run's `sorry=3` = the cascade artifact
class on the failing packaging decls).)*

**N2-P1.lean (CHECKPOINT, not final — run loop stopped at 7 = the ≤6 budget + ONE
documented closure deviation, justified in-log: every run-6 error class concretely
diagnosed with fixes in hand, the mathematical core already GREEN-triad at run 6;
run 7 = the single identified-fixes closure attempt, 74 s. Descent 37→26→12→8
errors; walls ~74 s, max_cpu ≈ 0.9/2.0, OVER only on the known mapped-olen class.
Three mechanical fixes applied on disk in v8 — UNVERIFIED; one closure run PENDING
authorization. M2 (P1-b L-series identification) and M3 (P1-c/d) deferred, sequenced
after M1 GREEN.)**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `chi_span_eq_one` | `pilots/75/N2-P1.lean:139` | PROVED-UNCONDITIONAL | `n2-p1-run7.log:175` (repeat :328) — `[propext, Classical.choice, Quot.sound]` | the DZDF `map_span'` field over ℚ (total positivity automatic for positive naturals) |
| `chi_span_mul` | `N2-P1.lean:166` | PROVED-UNCONDITIONAL | `:176` (repeat :329) — triad | DZDF `map_mul'` on principal spans (`Ideal.span_mul_span` route) |
| `chi_span_ne_zero` | `N2-P1.lean:249` | PROVED-UNCONDITIONAL | `:177` (repeat :330) — triad | DZDF `eq_zero_iff'` forward direction via the sup bridge; `1 < q` scope |
| `chi_span_residue` | `N2-P1.lean:286` | PROVED-UNCONDITIONAL | `:178` (repeat :331) — triad | **the c-trick** (residue independence): χ(a)χ(c) = χ(ac) = 1 = χ(bc) = χ(b)χ(c) with χ(c) ≠ 0 — the dictionary's mathematical core, the well-definedness of DZDF characters on ray classes of ℚ |
| `exists_nat_span` | `N2-P1.lean:77` | IN-PROGRESS — checkpoint; v8 fix on disk UNVERIFIED | run 7: sorryAx (1 residual cast-site, cascade class) `:174` | ℚ ideal classification: `Rat.ringOfIntegersEquiv` + ℤ-PID `Ideal.span_singleton_generator`; sign via `conv_lhs` natAbs rewrites |
| `ratCharOf` / `ratCharOf_apply` | `N2-P1.lean:294`/`:337` | IN-PROGRESS — checkpoint; v8 fix on disk UNVERIFIED | run 7: sorryAx (scope-cascade) `:179/:180` | dictionary character via `MulChar.ofUnitHom`; value dictionary incl. k = 0 at 1 < q |
| (engine, frozen) `Pa.lean` + (P0 quotes) `N2-P0.lean` | — | PROVED-HERITAGE | run 7 blocks — triad (Pa `:29+`; P0 15/15 per §10.12) | recompiled clean each run via the dep-order route |

**Engineering record (the error-class ledger for the closure run + M2/M3 sizing,
per-run in the logs):** `RingHom.ext_int` explicit args; `symm_intCast` application
form; binop-ascription distribution (double-ascribe inner products); Dvd-witness
orientation; **`ZMod.natCast_zmod_val`** is the val-recast identity at this pin
(`Data/ZMod/Basic.lean:205`); `Units.mk` takes 4 explicit fields (use `Units.mk0`);
`isUnit_of_mul_eq_one`/`Int.abs_of_nonneg` absent (root forms); `ZMod.val_one`/
`ZMod.nontrivial` are `Fact (1 < q)`-governed; `rw [ratCharOf]` lacks equation
lemmas for the noncomputable def (use `show`).

**Verification-lane addendum (A1):** honest-checkpoint classifications — the three
IN-PROGRESS rows' sorryAx prints are elaboration-cascade artifacts on failing decls
(the known class; the v8 file carries no sorry); the +1 deviation is documented
in-log with the stop-rule respected (no NEW error class appeared without a stop).
No Step-B row yet (not final); the row updates to FINAL when the authorized closure
run lands (v8 → GREEN expected on the diagnosed classes). §7a's 75-N2 entry:
P0 LANDED (§10.12) + P1 M1-checkpoint (this row).

### 10.23 FF-EZ2 P1 — LANDED GREEN 2026-11-17 (run 4 of ≤4; lane A3, charter GO, S-class; folded + re-verified by lane A1) — proof rung of the FF-EZ2 survivor

*(Merged 2026-11-17 by lane A1 from A3's `pilots/ff-ez2/P1-record.md`; drafted against
the agent-04 worktree copy, re-verified 2026-11-18 against the MAIN tree where the
record + logs + artifact LANDED at `570f3e9`: verdict `p1-run4.log:15` (P1.lean OK,
sorry-strict, rc=0/0/0), the 7 triad prints `:17–:23` (repeats `:43–:49`), telemetry
`:14` (mem 8003 MB = mapped-olen class, cpu 0.58); main-disk sha `9d8a7b1981faabce` ✓,
186 LoC ✓; the log's two `sorry` strings (`:59/:61`) are the RESULT/NOTE summary prose,
zero sorryAx in the axiom prints.)*

**P1.lean (proof artifact — 186 LoC ≤ 0.3k guard; sha256(16) `9d8a7b1981faabce`;
mathlib `ff2494ea` / v4.36.0-rc2, `import Mathlib` ONLY (zero donor imports); warm
app `crossmath-pilot-ffez2`, doz CLI/semraker, walls 44/43/53/66 s over 4 runs,
13 mechanical name fixes runs 1–3, ZERO mathematical content changes after
authoring. Full print surface **7/7 triad-only** incl. both private/helper forms.
**AXIOM-SPELLING NOTE (verified by A3 this session, carried per relay):** the log
prints `[propext, choice, Quot.sound]` — the bare `choice` is `Classical.choice`
relativized by the file's `open Classical` (reproduced with the v4.36.0-rc2 core
toolchain: `open Classical; #print axioms Classical.em` prints exactly this shape;
without the open, `Classical.choice`). Same axiom, display spelling — NOT a
non-triad set. Token-level log sweep: only propext/choice/Quot.sound, zero sorryAx,
zero native_decide.)**

| decl | file:line | status | axioms print source | notes |
|---|---|---|---|---|
| `ratio_rootOfUnity_of_pow_eq` | `pilots/ff-ez2/P1.lean` | PROVED-UNCONDITIONAL | `p1-run4.log:17` (repeat :43) — triad | the collision bridge: `x ^ m = y ^ m`, `y ≠ 0` ⇒ `(x / y) ^ m = 1` |
| **`zeros_simple_all` (the honest ALL-m headline)** | idem | PROVED-UNCONDITIONAL — purity + the exclusion hypothesis ⇒ `ZerosSimpleAt A m` for EVERY `m ≥ 1` | `:18` (repeat :44) — triad | `nodup_iff_count_le_one` + `Multiset.count_map`; each value's fiber nodup and singleton-dominated, the bridge supplies the contradiction |
| `stmt_maximal_violates_exclusion_holds` | idem | PROVED-UNCONDITIONAL | `:19` — triad | the trap negation: an all-equal spectrum of size ≥ 2 (maximal-curve shape; Fuhrmann alg-geom/9610023 + Tafazolian–Torres 2012 pins, dated) violates the exclusion |
| `stmt_power_merge_le_holds` | idem | PROVED-UNCONDITIONAL | `:20` — triad | the statement-rung correction's carrier (§10.19's ≤ direction): powered dedup ≤ mapped source dedup |
| `density_of_all` (private) | idem | PROVED-UNCONDITIONAL | `:21` — triad | the density mechanism (`filter_eq_self`, `Nat.card_Ioc`, `div_self`) — discharges BOTH headline forms |
| `stmt_ff_ez2_base_change_density_holds` | idem | PROVED-UNCONDITIONAL — M = 1 (the filtered set is everything) | `:22` — triad | the bridge §4 candidate headline, proved |
| `stmt_ff_ez2_family_form_holds` | idem | PROVED-UNCONDITIONAL — via `HypBaseChangePower` (the Weil :163 binder) | `:23` — triad | the transport form, proved |

**Recorded descope (ONE item, to P2):** `stmt_lpoly_squarefree_iff` (the zeta-side
`Squarefree` packaging) NOT proved at P1 — deferred to P2 as its own
translation-layer item, with the census findings in P1.lean's header:
`separable_prod_X_sub_C_iff'` (`FieldTheory/Separable.lean:316`) does not transfer
to multiset products without a cons-step needing a `separable_mul`-class API absent
on this pin; the roots route needs `nodup_roots_iff_of_splits` + the IsAlgClosed
splits invocation. The def also carries the amendment note: the P0 form is FALSE
for repeated-zero spectra (`A = {0, 0}`: numerator the unit `1`); the guarded form
(`0 ∉ baseChange A m` — implied by purity) governs when P2 picks it up.
**Guard compliance 5/5** (unchanged through P1). **Step-B note:** proof-artifact
class; the family grows (P2 descope pending) — `AxPilotFFEZ2_P1` TARGETS row rides
the at-sweep protocol with the family's finalization; the 7/7 in-file surface is
the landed evidence.

### 10.24 G9 + G13 — StrongPNT preflight + physlib occupation-pair bridge probes — LANDED GREEN 2026-11-17 (runs 36/37 + 38/39, one fix-retry each; lane A8 per R9 §6f, verdict review + row lane A1) — probe-convention, Step-A only, never Step-B stages

*(Folded 2026-11-18 by lane A1 from the MAIN tree (`68be1a2`): records live in
`qa/iter4-review/a8-22t2a-g9-recommendation.md` §1/§2 + the four persisted logs. Cites
re-verified on main disk: run36 FAIL `run36-g9.log:8` (rc=1,
`error(lean.unknownIdentifier)` `atTop` at :51:35 — the spelling class the §14 row-10
card anticipated), run37 GREEN `run37-g9-fix.log` verdict header `:6` + stage OK
`:30` (repeat `:37`) ("OK; errors=0, sorry-warnings=2"); run38 FAIL
`run38-g13.log:5` (rc=1 errors=1, Type mismatch at :107:69), run39 GREEN
`run39-g13-fix.log` verdict header `:4` + stage OK `:31` (repeat `:38`)
("OK; errors=0, sorry-warnings=0", `Module.End` anchor printed).
Main-file shas re-hashed this pass: `ProbeG9_StrongPNT.lean` = `c1f93388d2308073`
(72 LoC, carries the `open Filter` fix :39–:42 landed `68be1a2` — H's dated correction
note at `T2a-P0-record.md:77–83` discharges the record's stale "main still lacks the
fix" fold-note), `ProbeG13_PhyslibOccupation.lean` = `66b9416f0cd6a50a` (142 LoC).)*

| probe | verdict | tokens (Step-A) | notes |
|---|---|---|---|
| **G9** StrongPNT donor-statement port (`HypStrongPNT` binder + explicit-`M` asymptotic wrapper + trivial `conditional_shape` consumer) | **GREEN** run 37 (1 fix-retry: `open Filter`); statement-port ≈ 0 CONFIRMED on ff2494ea ⇒ 22-T2a GO (§10.25) | **2** declared probe-class sorries — MAIN file `:51/:67` (= the re-baselined certificate, `iter4-closeout-gates.md` §Mid-wave; the run-37 staged copy printed them at `:48/:63`, +3 header-line drift, A8-F2 class); warm `crossmath-gprobe` doz CLI, wall 29 s, OVER=0 | ψ-object validated by rg in the encore checkout (`Chebyshev.lean:70/:74`, `VonMangoldt.lean:66`, `Pow ℝ ℝ` `Real.lean:37` — the a8 file's PASS table) |
| **G13** physlib occupation-pair bridge (seed-13 statement + article-52 axiom-layer quotation `M1.lean:37–46` shapes + `CrAnTag`/`normalOrderMirror`/`CrAnFieldOpMirror` mirrors) | **GREEN** run 39 (1 fix-retry: Type-0-uniform σ mirror); elaborates STANDALONE on ff2494ea | **0** — fully sorry-free by design (Prop-defs + trivial binder-consumer) | wall 77 s, OVER=1 mem = the inherent mmapped-olen class (anon flat; AGENTS §5), recorded not escalated; physlib direct route stays DROPPED/fire-gated (R8 verdict) — this is the statement-tier evidence only |

**Standing notes:** both probes are `logs-g/` G-series rows (G-numbers 36–39 continue
the run counter); donor maps unaffected (no new donor class — StrongPNT stays
UNREGISTERED external prior art pending T1/T2/T3, RESEARCH.md §Iteration 4);
Step-B: NO stages ever (probe-convention); the G9 tokens are already inside the
52-token certificate via the mid-wave re-baseline (`d8f8356`), G13 adds none.

### 10.25 22-T2a P0 — LANDED GREEN 2026-11-17 (run 1, no retry spent; lane A8, orchestrator statement-first GO; folded + re-verified by lane A1) — statement rung, sorry-free by construction, never a Step-B stage

*(Folded 2026-11-18 by lane A1 from the MAIN tree (`3750c48`): record
`pilots/22/T2a-P0-record.md` + `logs/t2a-p0-run1.log`. Cites re-verified on main disk:
verdict header `:18` (GREEN — OK rc=0 errors=0 sorry-warnings=0), stage OK `:45`,
SUMMARY `:53–:55` (wall 31 s at the tele-summary :55, OVER=0, sub-interval wall —
Modal-rule compliant), decl pins printed live `:47–:49` (`Chebyshev.psi`,
`ArithmeticFunction.vonMangoldt`, `riemannZeta`); artifact sha `1b3d117662eb6cc8`,
99 LoC; the file's 3 `sorry` strings
(`:4/:6/:12`) are header prose — ZERO tokens, classifier-confirmed. Staging note: the
gprobe auto-glob matches `ProbeG*.lean` only, so the artifact staged as
`ProbeGT2aP0.lean`, byte-identical — mapping recorded in the log header :9–:12; the
pre-charter invocation `ap-ly9Pm…` was a zero-compute local SystemExit, not a run.)*

**T2a-P0.lean (statement layer — four Prop-defs + three live decl pins, pilot-22
house style per `ProbeP1_PNT.lean`):** `HypQRHzeta` (the Liu-1-verbatim quotation of
`OAI.riemannZeta_ne_zero_of_seven_eighths_lt_re` — on mathlib's own `riemannZeta`,
verbatim-on-pin), `HypStrongPNT` (G9's binder, verbatim), `stmt_T2a` (blueprint :285
shape: ∀ ε > 0, ∃ C : ℝ, ∀ x ≥ 2, |ψ x − x| ≤ C · x^(7/8+ε)), and
`stmt_T2a_of_QRH : HypQRHzeta → stmt_T2a` (the conditional P1 target). All elaborate
on ff2494ea; no donor imports (binders only — the Liu-1 convention).

**Billing + rule state:** technical-record tier (minutes-class; never discovery
billing — r3 §7 relabel, r5 backlog :349); **the pre-registered FB-2/PNT+ T2 rule is
NOT fired** (antecedent = an FB-2 PNT-AP pilot, not this ψ-error statement tranche) —
PNT+ stays UNREGISTERED, T1/T3 unfired. P1 (the explicit-formula proof) = L-grade,
iteration-5-or-explicit-charter question; machinery candidates recorded side-by-side in
the record (upstream ψ-engine as binder / mathlib `WienerIkehara` + pilot-22 M2 layer /
pilot-50 G7b binder discipline). Step-B: NO stage (zero-sorry statement rung;
probe-convention class); Step-A: 0 tokens.

### 10.26 10-D2 FINAL + 10-D3 — LANDED GREEN 2026-11-17 (D-tranche D1/D2/D3 COMPLETE, D4 → iteration-5; lane A6, charter rulings D2-completion GO + D3 GO; folded + re-verified by lane A1) — plumbing billing, never novelty; SUPERSEDES §10.20's PARTIAL verdict

*(Folded 2026-11-18 by lane A1 from the MAIN tree (`0677eae` + `9dc6684`): records
`pilots/10/D2-record.md` (FINAL header + COMPLETION BLOCK) + `D3-record.md`; logs
`logs/d2-run3.log` (completion attempts 1–5), `logs/d2-run4.log` (the two closure
runs), `logs/d3-run1.log`. Cites re-verified on main disk: d2-run4 header `:1`
(VERDICT: D2 FULLY GREEN; the diagnosed one-token fix took TWO tokens on the same
line — `(n := f x)` + dropping `.symm` — disclosed as one run beyond the ruling's
"single run"), closure-run-1 intermediate `:14` (FAIL rc=1 errors=1) with
`padM'_isPolyT [propext, sorryAx, …]` at `:42/:56` = the run-12 `.symm`-residual
INTERMEDIATE state, superseded — never read as final evidence (§10.20's d2-run1:64
precedent), closure-run-2 GREEN `:82/:144` with the headline
`padM'_isPolyT [propext, Classical.choice, Quot.sound]` at `:110/:141`; d3-run1
verdict `:15` (L5.lean OK FIRST RUN — rc=0, 0 errors, 0 sorry-warnings), triad prints
`:44/:45` (repeats `:75/:76`), telemetry `:80` (wall 65 s, OVER=1 mem = mmapped-olen
class). Final shas re-hashed this pass: `L4.lean` = `4ae0d6435e351128` (4,195 LoC),
`L5.lean` = `da398f2170288acb` (4,248 LoC = 16-line D3 header + L4 verbatim + Part H
37 lines).)*

**D2 FINAL (L4.lean, run 13 of the descent):** the FULL Closure subset for the counter
machine GREEN — headline `Groundwork.PadC.padM'_isPolyT` triad (all three fields: init
via `padM'_init_polyT` [triad] + `padM'_init_eq` rfl-bridge `[propext, Quot.sound]`;
step via the fun_prop database fed by `decide_le`/`log2log'`/`mul`; out via
`padM'_out_polyT` [triad]); new surface printed triad incl. `canary_init`,
`canary_pair`, `carried_σ [propext, Quot.sound]`, `PolyT.decide_le/log2'/mul`,
`foldl_add`, `foldr`; + Part E/D substrate re-verified. **Root-cause finding (recorded,
the completion's mathematical content):** `Nat.log2` is only LEMMA-equal to `Nat.log 2`
at this pin (`Nat.log2_eq_log_two`, `Log.lean:308`), NOT defeq — the cause of the
step-field defeq failures; D2 statements must branch on `Nat.log 2` with the
lemma-level `log2log'` bridge in the fun_prop database. Route A (fun_prop over the
user class) fully validated — 0 churn on ~500 verbatim lines (eth Closure/Fold +
Nat1/Nat1b/Nat2 numeric layer all landed GREEN in d2-run3, one-token-out state
`425db76c…` disclosed in-log).

**D3 (L5.lean, run 1 of ≤4):** `Groundwork.PadC.pad_bound` (eth `Pad.lean:98–109`
VERBATIM — the host bound is polynomial in `l + 2^e + 1`) and
`Groundwork.PadC.padded_time_absorb` (the spec's §2 D3: our middle factor `(l+1)^c` is
smaller, so the bound absorbs with eth's own final constant `q := c·4^(c+1) + (c+1)`)
— both `[propext, Classical.choice, Quot.sound]`; one pin-adjustment
(`Nat.pow_le_pow_right` → `pow_le_pow_right'`, the Part-E-precedent Unbundled name).

**Tranche state:** D1 (§10.17) + D2 FINAL + D3 = **D-tranche complete for iteration 4**;
**Print-surface censuses (2026-11-18, counted from the persisted logs): tranche-final
L5 surface = 45/45 decls triad** (`d3-run1.log` — 39 full-triad + 6 ⊆-triad subset
forms, 0 sorryAx); D2-final L4 surface = 43 decls all triad (`d2-run4.log` GREEN block
:82–:144 — 37 full + 6 subset, 0 sorryAx; phrased without the N/N slash to keep the
machine census single-pick on the tranche-final anchor).
D4 (`exists_tm_padded_space` — all inputs now exist) UNCHARTERED → iteration-5 M-arc
decision (orchestrator ruling at wrap; value-polynomiality binder `hv` supply is the
charter owner's question). §10.20's PARTIAL verdict and its "queued 2-line fix NOT
applied" state are SUPERSEDED by this row (the queued fix landed, transformed into the
two-token closure disclosed above). Step-B: **single tranche-final TARGETS anchor
`AxPilot10_L5` (`pilots/10/L5.lean`) — orchestrator ruling 2026-11-18** (L5 embeds
L4/L3 verbatim ⇒ one full-coverage custody stage covers the tranche's final theorem
state; H applying the row in `make_axcheck.py`; supersedes §10.17's and §10.20(iii)'s
at-sweep phrasings — L3/L4 remain this table's historical citations; reconciliation
note at FINAL-SWEEP-PLAN-ITER4 §0/§7d); Step-A: 0 real tokens on L4/L5 (header prose
only — classifier-confirmed this pass).

### 10.27 77-T1 — NOT-GREEN, honest stop at the 5-run budget (lane A7, 2026-11-17; folded + re-verified by lane A1) — the two derived T1-statement corrections stand as record; residue site-local; T1-completion + T2 re-chartered as ONE unit

*(Folded 2026-11-18 by lane A1 from the MAIN tree (`c536994`): record
`pilots/77/T1-record.md` + `T1.lean` + five logs. Cites re-verified on main disk: the
runs table (record :100–:107 — errors 50→39→37→38→**31**, walls 73–102 s, run-1 wall
incl. the tauceti lineage build), the two corrections (record :21–:39),
`annihilator_square`/`annihilator_anticommute` GREEN runs 2–5 (record :46), the clock
block (record :79–:85 — physlib `pushed_at` = 2026-11-17T09:42:38Z at BOTH ticks,
charter condition (iii) held), the substrate line (record :16–:19 — tauceti own-lineage
image builds: clone `d92acc5c` → manifest mathlib `1b1ccf4b` cache-hit → `lake build`
of the two GeneralLinear modules); `T1.lean` sha `f365c4c52b970d27`, 781 LoC — **0
real sorry tokens** (the single `sorry` string at `:11` is header prose "zero `sorry`";
the run logs' sorryAx lines are error-sorry artifacts of failed proofs, superseded
class — §10.20/:64 and §10.21 precedents).)*

**What the NOT-GREEN establishes (all standing independent of GREEN):**

1. **Correction 1 — drafted T1(ii) dimensionally unsound:** no unital
   `CliffordAlgebra (TauCeti.traceQuadraticForm ℂ N) →ₐ FockMatrix Q` hom past
   `N * N > 2 * (Q + 1)` (trace form nondegenerate ⇒ Cl is simple of dim `2^(N·N)` vs
   `FockMatrix Q`'s `2^(2(Q+1))`); the even-subalgebra injectivity claim conflated Fock
   space with its endomorphism algebra. The executed dictionary lives on the hyperbolic
   submodel `V` of rank `2 * (Q + 1)`.
2. **Correction 2 — drafted T1(i) ill-typed:** tauceti's `carOccupationElement i j`
   are idempotent + mutually commuting (`CAR/Occupation.lean:121/:138`); the drafted
   images `annihilator† * annihilator` are neither — the corrected dictionary
   intertwines hyperbolic occupation elements with the NUMBER OPERATORS
   `creator * annihilator` (diagonal, idempotent, commuting — `creator_mul_annihilator`).
3. **Substrate line fully proven** (tauceti donor-tree class — elaboration INSIDE the
   tauceti own-lineage image at manifest mathlib `1b1ccf4b`, not ff2494ea; the
   `zeta23e` D-PIN row pattern, §10.5); math closed (`annihilator_anticommute` GREEN
   runs 2–5); 31 residuals all proof-mechanics (one name fix `Matrix.mul_conjTranspose`
   → `conjTranspose_mul`; pairBilin/toFock field finishes; eAB sum gymnastics; polar
   trio ite-sum orientations; `fockDictionary` lift arity) — the work list for the
   re-chartered unit.
4. **Clock stable both ticks** — the T1 novelty condition held throughout.

**Re-charter (recorded at wrap):** T1-completion (~1–2 runs, relaxed budget) + T2 as
ONE unit, the residue census as its work list; the two corrections fold into dossier
77's T1 statement (honest narrowing: hyperbolic submodel, number-operator images).
**In flight (wave-3, agent-08) — this row is the LANDED baseline, not the unit's
final state.** Step-B: no stage until the unit lands GREEN (verified-red artifact);
Step-A: 0 real tokens.

### 10.28 FF-EZ2 P2 — LANDED GREEN 2026-11-18 (run 2 of ≤3; lane A3 descope-closure charter; folded + re-verified by lane A1) — the P0→P1→P2 charter FULLY CLOSED; formalization-first, never discovery billing

*(Folded 2026-11-18 by lane A1 from the MAIN tree (record `pilots/ff-ez2/P2-record.md`
+ logs `p2-run1/p2-run2.log`, byte-identical in worktree agent-04): verdict
`p2-run2.log:19` (P2.lean OK, sorry-strict, rc=0, 0 errors, 0 Lean sorry-warnings), the
9/9 triad prints `:42–:50` (repeats `:52–:60`) — 4 public + 5 private, each
`[propext, Classical.choice, Quot.sound]` in the FULL spelling; telemetry `:39/:64`
(wall 70 s, cpu 0.56, mem 7641 MB OVER=1 = the inherent mmapped-olen class with the
in-log §3 investigation note :12–:16 — recorded, not escalated); run 1 FAIL rc=1
errors=2 both in the `hroots` step (`p2-run1.log:12`, rewrite/application-type at
`:26/:37`), one fix-retry. Artifact sha `24926ac4cbbcdd50` ✓, 207 LoC ✓ (≤0.3k
guard); the file's single `sorry` string (`:3`) is header prose — 0 real tokens,
classifier-verified. Mathlib-only imports, self-contained P0-def carry, ZERO donor
imports — the §7a Mathlib-only-imports check DISCHARGED.)*

**P2.lean (the P1 descope, closed):** headline
`stmt_lpoly_squarefree_iff_holds` — the GUARDED squarefree-iff
`0 ∉ baseChange A m → (Squarefree (lPolyM A m) ↔ ZerosSimpleAt A m)` for all A, m
(the unguarded P0 form is false per the P1 amendment; the guard governs exactly as
§10.23 prescribed; route = the roots bypass of the
`separable_prod_X_sub_C_iff'` blocker: `roots_multiset_prod` + `bind_map`);
`zeros_simple_iff_squarefree_of_purity` (the purity-guarded equivalence);
`guard_of_purity`; the optional proportion rung `stmt_simple_proportion_le_holds`
(unconditional ≤ 1, landed in-budget); privates `factor_ne_zero`, `roots_one_sub`,
`inv_injective`, `nodup_map_inv`, `nodup_of_map_inv`. **Axiom-spelling closure
(charter item 5):** the P1 open-Classical display finding did NOT recur — P2 needs no
classical decidability, prints the full `Classical.choice` spelling; §10.23's
characterization stands.

**Family state: FF-EZ2 P0 (§10.19) → P1 (§10.23) → P2 (this row) — charter FULLY
CLOSED; no open descopes.** Step-B: family final ⇒ the at-sweep protocol FIRES —
full-coverage custody stages for `P1.lean` + `P2.lean` (`AxPilotFFEZ2_P1/_P2`,
§7d-updated); Step-A: 0 tokens both files. Billing: technical-record tier (battery
"warm-up grade" verdict stands — nothing discovery-grade); debt g already CLOSED at
the battery (REPORT-INPUTS §2).

### 10.29 75-N2 P1 FINAL (M1 closure + M2 + M3) — LANDED GREEN 2026-11-18 (runs 15 + 19; lane A5, the 19-run ledger; folded + re-verified by lane A1) — SUPERSEDES §10.22's checkpoint verdict (4/7 → final); the interim M3-DEFERRED note superseded by the same-day run-19 AMENDMENT block below

**Census: file-wide 14/14 decls triad** (the M1 seven + the M2 theorem + the six M3
theorems; print lines below). *(Folded 2026-11-18 by lane A1 from A5's
`pilots/75/N2-P1-record.md` + logs
`n2-p1-run8..15.log` (worktree agent-06, pending H's commit — cites re-verified on
agent-06 disk this pass). Run-15 verdict `n2-p1-run15.log:7` (N2-P1.lean OK — rc=0,
0 errors, 0 sorry tokens) + SUMMARY `:236`/telemetry `:237` (wall 69 s, cpu 0.94,
mem 1567 MB, OVER=0 — the run-11/12 mem-OVER lines were the mapped-olen class,
investigated in-log, no upgrade). The **8/8 file-wide triad census verified line-by-line**:
`:183–:190` (repeats `:224–:231`) — `exists_nat_span`, `chi_span_eq_one`,
`chi_span_mul`, `chi_span_ne_zero`, `chi_span_residue` (the c-trick), `ratCharOf`,
`ratCharOf_apply`, `heckeTsum_eq_ratCharOf_LFunction`, each exactly
`[propext, Classical.choice, Quot.sound]`; the §10.22 residuals at `:183/:188/:189`
(now clean) and the M2 theorem at `:190`. Heritage re-verified in the same run:
Pa block `:37–:53` + the fifteen N2-P0 decls `:87–:101` (all triad, incl. the two
primed-name records). Final file sha `2e5217010e46ad0d` ✓, 506 LoC ✓, **0 real sorry
tokens** — the 4 `sorry` strings (`:11/:13/:44/:496`) are header/audit prose.)*

**M1 CLOSED (the checkpoint's 3 packaging decls cleared) + M2 GREEN — the
15-run ledger (record §Run ledger, verified):** runs 1–6 error descent 37→26→12→8;
run 7 the +1-documented closure deviation (M1-core GREEN-triad, §10.22); run 8 the
authorized closure run FIRED at 2026-11-17 21:09 just before the network termination
(5 errors / 2 sorryAx; `exists_nat_span` GREEN-triad — the wrap-up's "never verified
post-edit" was a visibility gap, corrected at restart); run 9 the one post-closure
diagnostic+fix+rerun (1 error / 1 sorryAx; `ratCharOf` GREEN-triad, 6/7; root causes:
an OfNat-instance diamond at reducible transparency + a dependent-rewrite motive
failure); run 10 M1 COMPLETE 7/7 (`ratCharOf_apply` via the v10 `conv_lhs` fix) + M2
append; runs 11–14 the M2 fix-loop (four mechanical classes, each diagnosed from
certificate-grade error messages); run 15 GREEN. Zero sorry tokens written at any
point in the loop.

**M2 theorem `heckeTsum_eq_ratCharOf_LFunction` (`N2-P1.lean:448`):** Hecke tsum =
mathlib L-function on ℜs > 1 — reindex `k ↦ span {k}` via `Equiv.ofBijective` +
`Equiv.tsum_eq`, `absNorm (span {k}) = k` via `Ideal.absNorm_span_natCast` +
`NumberField.RingOfIntegers.rank`, `LSeries.term_def₀`, `ZMod.LFunction_eq_LSeries`.

**Fold notes owed (per A5's relay, verified in-file/record):**
(a) **`set_option maxHeartbeats 600000 in`** on the M2 statement (`:442`, comment
`:439`) — elaboration budget ONLY, no axiom/proof-strength content; the import
closure is `DirichletCharacter.LFunction` → hurwitzZeta/LSeries analysis (A5 find #3
— per-command heartbeat exhaustion under heavy import closures).
(b) **Engineering finds of record:** (i) the **have-opacity trap** — tactic-`have`
structure-valued locals are opaque to defeq (no zeta-unfold; the retroactive root
cause of the persistent show-defeq failures; fix: `let`) — certificate-grade root
cause, applies to every future ℚ-transport pilot; (ii) the **no-convergence-cost
LSeries bridge** — `Equiv`-reindex unconditional + the `term_def₀ f 0 = 0` corner ⇒
the Hecke-tsum↔L-function identification needs ZERO convergence analysis (a
discovery-relevant simplification for the M3/iter-5 continuation and any consumer).
(c) Telemetry: runs 11–12 mem 6.4–8.2 GB OVER = the mapped-olen measurement class,
investigated in-log, no upgrade (AGENTS §5).

**M3 DEFERRED (honest budget accounting; record §M3 deferral note):** P1-c/d —
principality transfer via ℤ-prime-ideal factorization, q = 1 degeneracy, half-plane →
ℂ∖{1} identity-theorem extension, composed transfer; spec in dossier
§Proof-strategy 1(iii)/3, ≈0.15–0.25k LoC; **GO recommendation recorded — the
iteration-5 lead-1 continuation** (unchartered at close, like D4; NOT a residual).
**[SUPERSEDED same-day by the AMENDMENT below — M3 LANDED at run 19.]**

**AMENDMENT (2026-11-18, run-19 state — M3 EXECUTED on the fresh ≤6 budget; A5's
re-task completed in the same file):** final artifact `N2-P1.lean` sha
`ca1089e2a0c122c4` (supersedes 2e5217010e46ad0d), **713 LoC on disk** (the relay's
"707" = header-count drift, F5 class), **0 real sorry tokens** (4 prose strings
:11/:13/:44/:697). Verdict `n2-p1-run19.log:5–:6`: OK, rc=0, 0 errors, 0 sorry
tokens, **14/14 file declarations triad-clean** — the six M3 theorems verified
line-by-line this pass at `:193–:198` (repeats `:256+`), each exactly
`[propext, Classical.choice, Quot.sound]`: `ratCharOf_eq_one_iff` (:537,
principality transfer — `MulChar.ext` + `one_apply_coe`, sup-bridge +
`Units.ne_zero`), `isPrincipal_of_modulus_one` (:576, q = 1 degeneracy via
`Unique (ZMod 1)`), `identity_theorem_extension` (:590 — the donor's
EntireAbelianQuotient pattern landed ON-PIN: `AnalyticOnNhd.
eqOn_of_preconnected_of_eventuallyEq` + `isConnected_compl_singleton_of_one_lt_rank`,
seed z₀ = 2), `hasQDirichletDictionary` (:610 — **N2-a DISCHARGED**),
`factorization_identity_extension` (:621, the hAbFacQ ∀s ≠ 1 engine bridge —
products of entire LFunctions), `dirichletFactorizationTransfer` (:651, the composed
transfer with `hnp` explicit — the corrected shape, see the FIND). Heritage
re-verified in-run (Pa block + the fifteen N2-P0 decls, all triad).

**Ledger 16–19 (M3, fresh ≤6 budget; all M2-descent classes held, zero
recurrences):** run 16 first elaboration — 6 errors (missing `Fact (1 < q)`
instance; the donor's `(z₀ := 2)` named argument dropped;
`Differentiable.differentiableAt`'s implicit point; omega's ∀-instantiation limit);
run 17 — 1 error (unit-vs-element metavariable `rw` in `hvne`); run 18 — 1 error
(`.symm` direction); **run 19 GREEN** (wall per log; mem-OVER flags on runs 11–19 =
the AGENTS §Modal-5 mapped-olen artifact, cpu ≤ 1.02/2.0 throughout).

**THE FIND (find-#4 precedent class; recorded in-decl at `N2-P1.lean:641` + dossier
+ record §STATEMENT FIND; folds as this dated note):** **`N2-P0.lean:166`'s
`DirichletFactorizationTransferQ` as literally stated is NOT provable** — its
hypothesis list omits the nonprincipality input (`∀ i, ¬ IsDZDFPrincipalQ (m i)
(χ i)`) while its conclusion asserts `ψ i ≠ 1`; a principal family (trivial
character at modulus 2, fK the ζ-side continuation, fL := Hecke·fK) satisfies every
stated hypothesis and would force `LFunction (ψ ≠ 1) =` principal-Hecke on ℜs > 1,
refuted by coefficient comparison; the degenerate fK = 0 case shows the shape is not
uniformly refutable — wrong as a target. The DZDF factorization's own
`∀ i, ¬IsDZDFPrincipalQ` is the intended input; M3-e carries it as the explicit
`hnp` and discharges the corrected shape GREEN-triad. **Owed:** the N2-P0 one-line
amendment (add `hnp` to the Prop + record note) at the P0 owner's next
P0-touching commit; **P0's fifteen-decl elaboration ledger unaffected** (statement
elaboration does not certify provability — the §10.12 row stands as an elaboration
record with this dated provability caveat). **[DISCHARGED same-day (`02a5d71`): the
hnp erratum APPLIED at `N2-P0.lean:161` (dated); the ledger stands.]**

**PAUSED-AT-CLOSE ADDENDUM (2026-11-18, `02a5d71` — A5's hard-stop state):** N2 **P2
PAUSED at 2/6 runs**: run 20 (10 errors, all name-resolution in the new P2-a block —
AnalyticAt namespace, IsBounded renames, the pair-map route, closed-preimage) → run
21 (8 errors; three further classes diagnosed — the
DifferentiableAt→AnalyticAt bridge, the AnalyticOnNhd prefix,
`IsClosed.preimage` at `Topology/Continuous.lean:188`); **the verified 14/14-triad
core (run 19) and the amended N2P0 module elaborate error-free in BOTH runs; zero
sorry tokens anywhere**; three fixes applied post-run-21 UNFIRED (disk sha
`ecd44c6a…`; resume note with line numbers in the record = the iter-5 lead-1
payload). **Census basis: §10.29's FINAL number remains run-19's 14/14 — the P2-a
block is IN-FLIGHT-UNVERIFIED content** (H commits it as the PAUSED record); the
sweep/classifier treat that block by tokens, never as part of the verified surface.

**Step-B (H's mechanics finding folded, `h-wave3-log.md:604–:608`):** family final at
M1+M2 ⇒ the §7a "row lands at N2-final" rule FIRES — but `N2-P1.lean`'s
`import N2P0` (`:94`) is the runner's documented hyphen workaround (a byte-identical
`N2-P0.lean` copy staged as module `N2P0`, `run_n2p1.py:5–9`): the make_axcheck
rewrite map cannot catch the hyphenless name, and `N2-P0` carries no TARGETS row
under the single-row instruction — so the sweep must stage the **Pa → N2P0 → N2-P1
closure** (the runner's ORDER pattern, `run_n2p1.py:49`; `import Pa` auto-rewrites
once staged, `AxPilot75_Pa` already in TARGETS) or extend the rewrite map.
`AxPilot75_N2` = the N2-P1.lean row; §7d updated with the closure instruction
(**staging sha = the run-19 bytes `ca1089e2a0c122c4`** — the sweep stages current
disk, not the run-15 interim). Step-A: 0 tokens (run-19 file, ENTRY 6). Billing:
M2+M3 = the dictionary's identification + transfer layers, technical-record; the
discovery-grade content is the dictionary itself (dossier 75-N2, S1–S4).

### 10.30 AL-P2 c/d/e — HONEST STOP: P2-c CLOSED 100% (run 13), P2-d PARTIAL GREEN parked at FIND #5, P2-e → rebuild re-charter (lane A4, 2026-11-18; folded + re-verified by lane A1; the correction relay's state — supersedes the "one run owed" interim) — resolves §10.6's pending-P2 line

*(Folded 2026-11-18 by lane A1 from A4's `pilots/al3d/` state + `A2-gaps.md` §4–§5 +
the run logs (worktree agent-05, pending H's commit; cites re-verified on agent-05
disk this pass). **Run 13 — the closure-verification unit (verify-fire discipline,
fresh ≤2 budget): `alp2-run13-p2c-closureverify.log`** — pre-fire sha guard
`509f2368…` recorded before launch and matching the tested bytes; verdict A2.lean OK
rc=0, 0 errors (open or hidden), 0 sorry (`:189`/`:522`), **0 sorryAx anywhere in
the log; every axiom print exact triad** — **63 distinct A2 decls** (my count = the
file's 63-line audit tail), A1 re-verified in the same run (88 prints); OVER=0, wall
97 s, telemetry Modal-rule compliant.)*

**(a) P2-c CLOSED — the equiv-composition closure:** `colEquivVar` lands via
EQUIV-COMPOSITION — `heightCasts ∘ (regEquivOfEq projF_fibre).symm ∘ (regReindexEquiv
(fibre Λ X')).symm` — with **both transport lemmas deleted outright** (the §10.6-era
"parked at colEquivVar_left" residual dissolves: no transport lemma to prove). The
last error chain: run-9/10's `projInteraction_norm_le` + `isAdmissible_projInteraction`
sorryAx root-caused to `l2_opNorm_extendId_le`'s `[∀ i, Fintype (loc i)]` instance
restoration; run 12's one-line fix (`mul_nonneg (pow_nonneg …) (le_trans zero_le_one
(le_max_right J 1))` after the positivity-form and cast-form mismatches), **run 13
the applied-fix verification GREEN**. Disk state: `A2.lean` 993 LoC, 3 `sorry`
strings all header prose (:8/:34/:38); sha at H-commit = A4's PENDING-note stamp
atop the run-13 bytes (one-writer; the stamp is prose-only — decl surface unchanged).

**(b) P2-d PARTIAL GREEN — 8 new theorems triad (runs 10–12):**
`vecMulVec_submatrix`, `hasGlobalGap_submatrix` (+ the INLINE
`PosSemidef.submatrix` re-derivation — mathlib's lemma fails `PartialOrder 𝕜`
synthesis in RCLike sections on-pin), `mulVec_eq_smul_submatrix`,
`star_dotProduct_comp`, `regReindexEquiv_apply`, `regReindexEquiv_comp_colEquivVar`,
`fibre_subset`, `sdiff_fibre_eq`. **PARKED at FIND #5** (A2-gaps §5): the
equivFin-instance mismatch between `col Λ u` and `col (fibre Λ X') u` encodings —
propositionally equal, distinct terms; every rewrite route dies on dependent
motives; mathlib has no `Fintype.equivFin`-congruence lemma. **Re-charter = the
canonical z-rank enumeration rebuild** of the P2-b bodies riding
`col_inj_on_z`/`col_heights`, statements unchanged.

**(c) P2-e NOT attempted** — identical per-column structure, rides the rebuild.
**(d) Ledger + the RECOVERY finding:** runs 9–12 (walls 45/76/75/48 s) + run 13;
the dead instance's on-disk colEquivVar draft had TWO fatal elaboration errors —
**the run-23-era "114 decls triad" header claim was intent, not state** (corrected
in the file header :34; runs 10+ are the verified state; the honest verified census
is the 63-decl surface above). **(e) Process find (carried to the sweep plan,
§7d-note):** the runner error filter missed `error(lean.synthInstanceFailed)` /
`unknownIdentifier` formats — runs 10/12 read errors=0 with real errors; the
tail-200 diagnostic added compensates; flagged INDEX-side by H.

**Step-B:** `AxPilotAL3D_A2` (already in TARGETS) stages at sweep — sha-at-sweep
governs (the file grows with the rebuild re-charter; the §10.30 verified surface is
the run-13 bytes). Step-A: 0 real tokens (header prose only). Billing:
formalization-grade B.2-staged; never a headline (§10 conventions).

### 10.31 74-P1 COMPLETION — LANDED GREEN 2026-11-18 (run 5 of 5; lane A8, the verify-fire re-charter; folded + re-verified by lane A1) — SUPERSEDES §10.21's honest-stop verdict (the stop stays as history); the AMENDED statements are the verified ones

**Census: 7/7 public theorems triad** (+ 24 private lemmas by the documented
elimination class — prints at the sweep's full-coverage stage; lines below).
*(Folded 2026-11-18 by lane A1 from A8's `pilots/74/74-P1-record.md` + the combined
log `logs/p1-completion-runs1-5.log` (worktree agent-09, pending H's commit; cites
re-verified on agent-09 disk this pass). Run-5 verdict header `:19` (GREEN: OK
rc=0, errors=0, sorry-warnings=0; wall 30 s, OVER=0; fired sha `6ddbda11d5da4f35` =
the disk file, 770 LoC ✓) + the run-5 raw block (`:1585+`): **all seven public
theorems verified line-by-line — `t1a_floor`, `t1b`, `t1b_window`, `t1c`,
`cert_pad`, `Bk_le_Bk_succ`, `t4_floor_ceiling`, each exactly
`[propext, Classical.choice, Quot.sound]`** (printed in both the axioms section and
the file's audit tail; 0 sorryAx in the run-5 block; the combined log's earlier
sorryAx prints at :53–:59/:838+ are runs 1–4 INTERMEDIATE states, superseded —
never read as final evidence. The 24 `private lemma`s have no direct print:
⊆-triad by the documented elimination class (rc=0, zero sorry-warnings); the
§7b(ii) full-coverage stage prints them at sweep.)*

**The completion (fresh ≤5 budget, ALL verify-fire disciplines held):** descent
29→10→10→4→0 errors over runs 1–5 (sha-guard trail `2a11b1ed`/`4b3b22e9`/
`a5a6d0cd`/`8f05abd9`/`6ddbda11`, recorded BEFORE each fire, no edit between record
and fire; walls 267/144/466/52/30 s; zero sorry at every run; ephemeral
`crossmath-pilot-74p1`, doz route, pilot-73-clone warm-layer-shared recipe, FULL
error output — the previous session's runs 1–6 were partially blind at the gprobe
12k cap; OVER flags = mem-class mmapped-olen, anon=0; one code-side
`maxHeartbeats` 2M→8M fix recorded). NO local lean anywhere.

**(a) The AMENDED statements per FINDS #1/#2 are the verified ones** — the marking
bound T1a′, centered `mgfBound`, window-edge constants, T4′ floor+ceiling; the
refuted original forms stay cited at §10.21. **(b) The signature-class record:** all
8 taxonomy classes confirmed + a 9th family (dotted-projection gaps at ff2494ea:
`LT.lt.le` absent → `le_of_lt`; `.symm` unresolvable on Pi-typed lemmas → `rw`
forms; `Finset.sum_mul` direction; `le_add_of_nonneg_left/right` swapped;
`Real.exp_log` positivity-proof arg; `min'_le` triple; a 9-line identifier
corruption from the aborted batch — every fix verified against the encore-mathlib
source). **(c) Dossier-74 amendment section landed** (all 4 FINDS with
counterexample numbers: p₀ = 1−δ, n atoms δ/n ⇒ Var ≈ 3.36, W₀.₀₁ ≈ 0.184 vs the
claimed ≈ 18.2 floor; Cantelli's true direction = per-spectrum UPPER bound).

**Step-B:** proof artifact final ⇒ `AxPilot74_P1`-class custody stage at sweep
(full-coverage prints the 24 privates); Step-A: 0 real tokens (2 prose strings).
Billing: the honest marking-bound replacement class — engineering/technical record,
the FINDS are the discovery-grade content (§10.21 + dossier 74).

### 10.32 77 T1-completion + T2 — NOT-GREEN at budget, the FINAL wave-3 unit: T1 31→7 site-local residuals with ZERO mathematical failures; T2 delivered 7-of-8 top-level theorems triad-clean (one tainted by the runner's filter blind spot) (lane A7, 2026-11-18; folded + re-verified by lane A1) — supersedes §10.27's interim census; dossier-77 fold complete; physlib NOVELTY EVENT recorded

*(Folded 2026-11-18 by lane A1 from A7's `pilots/77/T1-record.md` §COMPLETION UNIT +
`logs/t1t2-run{6..9}.log` (worktree agent-08, pending H's commit; cites re-verified
on agent-08 disk this pass: run-8 verdict `:19/:221` — T1 FAIL rc=1 errors=7, T2
FAIL rc=1 errors=1, the omega residual; run-9 `:17/:462` — T1 regressed to 16,
REVERTED; T2 rc=1 **errors=0** = the filter-missed error; T2's print block
`:464–:471`: the seven named theorems each exactly
`[propext, Classical.choice, Quot.sound]`, the tainted `isDegreeBlock_iff_sum_
blockProj` wrapping at `:464`; disk T1.lean 817 LoC sha `3e6b50641990af9b` (the
run-8-carrying tree), T2.lean 272 LoC sha `55107d0c6768fe34`; both files carry one
prose `sorry` string each — 0 real tokens.)*

**T1-completion: NOT GREEN at budget — descent 31→23→13→7 over runs 6–8 (run 8 =
the best state and what the tree carries; the run-9 attempt at the last 7 regressed
to 16 and was REVERTED).** Walls 57–107 s, warm `crossmath-pilot-77` lineage,
tauceti@d92acc5c own-lineage image (manifest mathlib `1b1ccf4b`), doz route; run-6's
one OVER = the mapped-olen class. **Zero mathematical failures across all four
runs:** the corrected statements (hyperbolic submodel rank 2(Q+1), number-operator
intertwining) elaborated exactly as designed; `occupationElem_mul_self` +
`commute_occupationElem` (via `CliffordAlgebra.mul_ι_mul_ι_mul_comm`),
`traceQuadraticForm_isoV`, `fockDictionary_apply_hypE/hypE'`, and
`dictionary_numberOp/idempotent/commute` all verify, and
`map_iso_occupationElem` — the element-level dictionary to tauceti's own
declaration — CLOSED in run 8 (the `Matrix.single` instance bridge goes through
tauceti's `_def` theorems, not `unfold`). The run-8 log's sorryAx prints on this
chain are the CASCADE class (transitive through the 7 residuals — the
superseded-print convention, §10.20/:64 precedent); the per-decl state of record is
the §COMPLETION census. **The 7 remaining residuals, all site-local and
root-caused:** `pairBilin`'s two outer field proofs (→ the `∘ₗ inl/single`
canonical form) + the five undecided-ite side goals in `isoV_hypE`/`isoV_hypE'`.

**T2: 7 of 8 top-level theorems TRIAD-CLEAN, 0 sorryAx on those prints**
(line-by-line, run-9 block): `isParityBlock_iff_sum_parityProj` (the mod-2
regrading decomposition), `isParityBlock_of_isDegreeBlock` (the coarsening), both
sum-closure lemmas, `pairHamiltonian_isDegreeBlock`,
`pairHamiltonian_entry_eq_zero` (**the donor `Model.lean:138` re-derived at the
abstract coefficient shape**), `pairHamiltonian_isParityBlock`. **ONE tainted:
`isDegreeBlock_iff_sum_blockProj`** (the `⨁_n` decomposition iff) carries sorryAx
via an elaboration error the runner's error filter missed (rc=1, errors=0 — the
error text sits in the unprinted output region; most likely in the
`rw [Matrix.sum_apply, Finset.sum_eq_single (deg a)]` block) — **the SAME
blind-spot class A4's al3d tail-200 fix closes; the 77 runner still carries the old
filter = an iter-5 item.** T2's tauceti-SetLike instantiation through Φ stays the
recorded extension condition (scope honesty note in the header).

**NOVELTY EVENT (physlib clock, condition (iii) — FIRED PARTIALLY):** master ticked
`2026-11-17T09:42:38Z → 2026-11-18T08:24:23Z → 13:00:37Z` (end-tick) and landed
`Physlib/QFT/PerturbationTheory/` (54 files, Tooby-Smith): `CrAnFieldOp` +
`FieldOpFreeAlgebra` + **`WickAlgebra`** — the equal-statistics super-commutation
HALF of CAR now exists on physlib; still ABSENT there: the {a, a†} mixed relation
(Wick keeps it central), any Clifford/quadratic-form content, any finite
Fock-matrix model, any tauceti connection — **the dictionary core stays CLEAN in
both corpora; billing C+ unchanged; seed-13's "no CrAnFieldOp" gap CLOSED.** T1's
CAR-transport sub-content drops to formalization-parity vs that layer (full note in
dossier 77 §T1/T2 EXECUTION UPDATE).

**Dossier fold COMPLETE** (A7): the two derived corrections + the residual-map
reconciliation 31→7 + the T2 delivery state + the retired dimension-count route
superseded. **RULING (relay (e)): NO 77 TARGETS row** — 74-precedent, the
honest-stop files stay classifier-covered (Step-A only). Step-A: 0 real tokens both
files.

—

## Sources and fold changelog (§10 tail; promoted to level-2 2026-11-18 so the §10
census span ends at the last landing section — no content change)

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
triad, dated note in the tool header. Fifth batch: §10.11 32-crossing (A6's block
merged from agent-07's REPORT-INPUTS copy per the wrong-file ruling, cites
re-verified on agent-07 disk — verdict :14/:58, triad :16–:24/:60–:66; census 43
public decls; 2-helper-lemma print caveat noted; TARGETS row AxPilot32_M2 applied,
inert until H commits A6's batch). Sixth batch: §10.12 75-N2 P0 (A5's block from
agent-06's N2-P0-record.md, cites re-verified on disk — 15/15 triad :83–97, close-out
:185–196; C1 confirmed; [WARM]-branch resolution noted; TARGETS row deliberately
deferred to N2-final, P1 GO). Seventh batch: §10.13 78 Truffet Stage-A P0 (A7's
record from agent-08, cites re-verified — 3/3 public triad `p0-run4.log:22–24`;
census 3 public + 23 private lemmas, elimination-noted; NEGATIVE-kind discovery
candidate; Stage-B/TARGETS deferred with the family). Eighth batch: §10.14 FF-EZ4 P0
(A6's record from agent-07, cites re-verified — verdict :15, telemetry :34; PROBE-
CONVENTION class, Step-A only, never a Step-B stage, no TARGETS — the record's own
ruling, adopted). Ninth batch: §10.15 74 T1T2T4-P0 (A8's record from agent-09 —
verdict :8, stage OK :36–37; probe-convention statement rung, 0 tokens, never
Step-B) + §10.16 ZZV2-λ P1 (A3's block from agent-04's STALE baseline, renumbered
§10.8→§10.16 — 10/10 triad :145–:155; HARD STOP executed; taskset-not-j infra
finding recorded in the telemetry class note). Tenth batch: §10.17 10-D1 (A6's
record from agent-07 — verdict :14, Part E 6 prints :25–:30 incl. 2 data-only, L2
regression :16–:24; engineering/plumbing billing, C2 coverage; SPEC CORRECTION
adjudicated — D2's bare-PolyT form FALSE under binary Enc ℕ; AxPilot10_L3 TARGETS at
sweep per the record's own protocol). Eleventh batch: §10.18 73-Q4 (A2's block from
agent-03's STALE baseline §10.7→§10.18 — all 23 triad prints :45–:67 re-verified,
headline M0 + Q4-c at :66/:67; DATED CORRECTION: the block's "22 decls, 8 public +
14 private" corrected to the census's 23 = 14 public + 9 private; C1; Rosen ch. 8
provisional pin carried; AxPilot73_Q4 TARGETS at sweep). Twelfth batch: §10.19 FF-EZ2 P0 (A3's record from
agent-04 — verdict :14, RESULT :33; probe-convention statement rung, zero-sorry by
construction; the rung-correction ≤ vs ≥ carried) + §10.20 10-D2 PARTIAL GREEN (A6's
record from agent-07 — canary milestone triad incl. carried_σ [propext, Quot.sound]
at d2-run2:38/:42; ONE diagnosed statement error, 2-line fix queued; Route A
validated + recommended; the d2-run1:64 sorryAx = attempt-2 intermediate state,
superseded — noted so it is never read as final evidence). Thirteenth batch:
§10.21 74-P1 NOT-GREEN honest stop (A8's record from agent-09 — descent
62→60→57→50→46→46 rc=1, zero forced gaps; the four FINDS as record incl. the T1(a)
refutation; the 8-class mechanical residue map; the run-6 process disclosure; the
re-charter recommendation; 0 real tokens on disk, runs-1–3 counters classified
superseded). Fourteenth batch: §10.6 find-#4 AMENDMENT note (A4's statement-level
binder-scoping correction — uniform ∃C + G-inside-binder, unprovable-as-scoped
find-#3 pair superseded; re-GREEN as probe run 8 `alp2-run8-substrate.log:12`;
P0 sha 52c5b9f77344e0ed; stub lines drift :85/:123/:128→:104/:142/:147,
stepA entry 3) + §10.22 75-N2 P1 M1 CHECKPOINT (A5's record from agent-06 — core
4/4 triad `n2-p1-run7.log:175–:178` incl. the c-trick; packaging 3 IN-PROGRESS
with v8 fixes on disk UNVERIFIED; the +1 closure deviation documented; honest
checkpoint, not final). Fifteenth batch: §10.23 FF-EZ2 P1 GREEN (A3's record from
agent-04 — 7/7 triad `p1-run4.log:17–:23` incl. `zeros_simple_all` + both density
statements; the open-Classical axiom-SPELLING note carried — `choice` =
`Classical.choice` relativized, same axiom, display spelling; the
squarefree-packaging descope to P2 recorded). Sixteenth batch (2026-11-18, wave-3
restart): §10.23's provenance re-based to the MAIN tree (record landed `570f3e9`;
repeats range-corrected `:43–:49`; the log's 2 sorry strings = RESULT/NOTE prose) +
the five rows the terminated session's wrap left unfolded, all folded from MAIN
records per the file-funnel ruling (A3's stale agent-04 copy is NOT a source):
§10.24 G9+G13 (runs 36–39; G9's 2 declared sorries = the certificate's re-baselined
`:51/:67`, main-file sha c1f93388d2308073 with the `open Filter` fix landed 68be1a2 —
H's dated correction at T2a-P0-record.md:77–:83 discharges the stale fold-note);
§10.25 22-T2a P0 (run 1 GREEN, 0 tokens, T2-NOT-FIRED declaration carried, sha
1b3d117662eb6cc8); §10.26 10-D2 FINAL + 10-D3 (d2-run4 two-token closure disclosed;
run-12 intermediate sorryAx marked superseded; L4 sha 4ae0d6435e351128 / L5 sha
da398f2170288acb; SUPERSEDES §10.20's PARTIAL verdict; D4 → iter-5); §10.27 77-T1
NOT-GREEN honest stop (the two derived T1 corrections as record; tauceti
donor-tree substrate line at manifest mathlib 1b1ccf4b; 0 real tokens; T1-completion
+ T2 re-chartered, in flight agent-08). Fold-audit scope f4511af..2f90dcc swept —
every landed pilot/probe in the range now has a §10 row; the five wave-3 in-flight
units (A3 FF-EZ2-P2, A4 AL-P2-c/d/e, A5 N2-P1 closure+M2/M3, A7 77-T1/T2, A8 74-P1
completion) deliberately NOT folded (not landed). Seventeenth batch (2026-11-18, fold
relay #4): §10.28 FF-EZ2 P2 GREEN (A3's record, main-tree verified — run 2 of ≤3,
9/9 triad full-spelling incl. the guarded squarefree-iff headline + the optional
proportion rung; P0→P1→P2 charter FULLY CLOSED; the at-sweep custody stages
AxPilotFFEZ2_P1/_P2 now fire — §7d updated in the same pass). §10.26's Step-B note
RECONCILED to the orchestrator's single-anchor ruling (AxPilot10_L5) with the FINAL-
SWEEP §0/§7d reconciliation notes. Remaining in-flight folds owed: AL-P2 c/d/e (A4),
N2-P1 closure + M2/M3 (A5), 77-T1/T2 (A7), 74-P1 completion (A8). Eighteenth batch
(2026-11-18, census re-task): §10.CENSUS companion appended (manual per-decl triad
census for all 21 NO-MACHINE-CENSUS flags + the 205/205 machine attribution + the
274/277 whole-tree roll-up + 18/18 donor rows + 4 delta slots); two grammar/geometry
fixes to make the close-time tally deterministic — §10.26's heading re-titled to the
D7 "LANDED GREEN" vocabulary (the tool's abort was correct; census phrases moved to
the section body, 45/45 single-pick, the L4 surface phrased slash-free) and this
changelog promoted to a level-2 heading (§10.28's span had absorbed the changelog's
quoted censuses); §10.22's 4/4 core VALIDATED against n2-p1-run7.log:175–:178
(A2's manual pick confirmed; the 3 sorryAx decls at :174/:179/:180 are the section's
IN-PROGRESS residuals). Nineteenth batch (2026-11-18, fold relay + supplementary):
§10.29 75-N2 P1 FINAL (M1 closure + M2 GREEN — run 15, 8/8 file-wide triad verified
line-by-line `n2-p1-run15.log:183–:190`; the 15-run ledger incl. the run-8
fired-at-termination visibility-gap correction; the maxHeartbeats-elaboration-budget
note, the have-opacity trap, and the no-convergence-cost LSeries bridge recorded;
M3 DEFERRED honest → iter-5 lead-1; H's N2P0 hyphen-workaround closure-staging
finding folded into the Step-B note); SUPERSEDES §10.22 (its 4/7 checkpoint row now
historical); §10.CENSUS restated — machine 213/213 over 8 sections (§10.29 = 8/8),
manual 65/65, whole-tree 278/278 ZERO residuals, donor 18/18, delta slots now
A4/A7/A8. Twentieth batch (2026-11-18, §10.29 AMENDMENT at d77bb20+): run-19 state —
M3 EXECUTED on the fresh ≤6 budget (ledger 16–19, all M2-descent classes held, zero
recurrences), six M3 theorems triad-verified line-by-line (n2-p1-run19.log:193–:198;
14/14 file-wide; sha ca1089e2a0c122c4, 713 LoC disk); the interim M3-DEFERRED note
superseded in place; **the FIND folded** (N2-P0.lean:166 DirichletFactorizationTransferQ
NOT provable as stated — omits ¬IsDZDFPrincipalQ; principal-family coefficient
refutation; M3-e carries hnp explicit; P0 one-line amendment owed at next
P0-touching commit; the §10.12 elaboration ledger unaffected with the dated
provability caveat); census → machine 219/219 (§10.29 = 14/14), whole-tree 284/284
ZERO residuals; §7d staging sha updated to the run-19 bytes.

### 10.CENSUS — manual per-decl triad census companion (lane A1, 2026-11-18; closes the NO-MACHINE-CENSUS gap for the close block)

*(Placed AFTER the `## Sources` level-2 heading so no §10 section span changes — the
close-time `tally_section10.py` re-run sees the identical section geometry. Machine
baseline re-computed this pass against THIS file after two grammar/geometry fixes:
(1) §10.26's heading re-titled to the D7 "LANDED GREEN" vocabulary (the tool's
fail-loud abort on the old title was correct — fixed in the row, not the tool); (2)
this changelog's tail promoted to a level-2 heading so the §10.28 span no longer
absorbs the changelog's quoted censuses. Post-fix tool run, 2026-11-18: **N-TABLES
28, verdicts 24 green-triad / 2 honest-partial / 2 not-green-honest (sum 28 ✓),
machine census 205/205 over 7 sections, 0 MULTI-CENSUS, 21 NO-MACHINE-CENSUS** —
this appendix manually resolves all 21. SAME-DAY UPDATE at the §10.29 landing
(N2-P1 FINAL): N-TABLES 29, verdicts 25/2/2 (sum 29 ✓), machine census **213/213
over 8 sections** (+ the §10.29 row below), 0 MULTI-CENSUS, 21 NO-MACHINE-CENSUS —
§10.22's flag now resolves as SUPERSEDED-BY-§10.29; the roll-up (e) is restated
below it. SECOND same-day update at the run-19 M3 amendment: §10.29's census is now
**14/14** (machine **219/219 over 8 sections**), roll-up (e) restated again below.
THIRD same-day update at the §10.30 + §10.31 landings: N=31, verdicts 26/3/2, machine
**226/226 over 9 sections** (§10.31 = 7/7 publics; §10.30 manual 63/63), roll-up (e)
restated below. FINAL close-time basis at §10.32 (the last wave-3 fold): N=32,
verdicts 26/3/3 (tool-verified), machine 226/226 unchanged, manual 159/160 — whole-tree **385/386**,
the one residual named.)*

**(a) Machine baseline — 205/205, attribution by FILE (a phrase's section ≠ the
artifact's section in two cases):**

| machine row (§) | artifact FILE | decls | evidence |
|---|---|---|---|
| §10.6-span | `pilots/al3d/A1.lean` (§10.3's artifact — the phrase is the m1-run remediation note) | 22/22 direct | 20 × `alp1-final.log:41–:60` + the 2 remediated helpers `alp2-run7-m1green.log:50–:51` (the §10.3 F2 gap CLOSED by A4's +2 audit lines) |
| §10.8 | `pilots/75/Pb.lean` (§10.4's artifact) | 89/89 direct | `axcheck-full-run1.log` (124 records incl. primed-name hand-joins; sha da05c60ceb78755b) |
| §10.16 | `pilots/zzv2-lam/P1.lean` | 10/10 direct | `p1-run3.log:145–:155` (incl. 2 privates) |
| §10.18 | `pilots/73/Q4.lean` | 23/23 direct | `q4-run15-green.log:45–:67` (14 public + 9 private) |
| §10.23 | `pilots/ff-ez2/P1.lean` | 7/7 direct | `p1-run4.log:17–:23` (incl. 1 private; full-spelling note) |
| §10.26 | `pilots/10/L5.lean` (tranche-final; embeds L4+L3+Part E verbatim) | 45/45 direct | `d3-run1.log` (39 full + 6 ⊆-triad subset, 0 sorryAx) |
| §10.28 | `pilots/ff-ez2/P2.lean` | 9/9 direct | `p2-run2.log:42–:50` (4 public + 5 private; full spelling) |
| §10.29 | `pilots/75/N2-P1.lean` FINAL (M1 closure + M2 + M3; runs 15+19, landed 2026-11-18) | 14/14 direct | `n2-p1-run19.log:183–:198` (repeats :256+; sha ca1089e2a0c122c4, 713 LoC — the run-15 interim 8/8 superseded by the same-day M3 amendment; heritage Pa + N2-P0 blocks re-verified in-run) |
| §10.31 | `pilots/74/P1.lean` COMPLETION (run 5/5, landed 2026-11-18) | 7/7 direct (publics) | `p1-completion-runs1-5.log` run-5 block `:1585+` (sha 6ddbda11d5da4f35 = disk, 770 LoC; the combined log's earlier sorryAx = runs 1–4 intermediates, superseded; the 24 privates counted in table (b)) |

**(b) Manual addend — OUR proof artifacts with evidenced censuses, NOT inside any
machine number (each counted exactly once):**

| § | artifact | census (triad/total) | evidence (persisted) | notes |
|---|---|---|---|---|
| 10.1 | `pilots/lp/L1.lean` | **2/2 direct** | `lp-l1-run2.log:21–:22` (repeats :24–:25) | both public; P0 = probe class (N/A below) |
| 10.2 | `pilots/lp/L2.lean` | **2/2 direct** | `lp-l2-run6.log:38–:39` (repeats :62–:63) | 1 public + 1 private (`_private` name shape) |
| 10.6 (own content) | `pilots/al3d/A2.lean` m1 | **2/2 direct** | `alp2-run7-m1green.log:117–:118` | the 22/22 machine phrase belongs to A1.lean (row (a)); A2's 5 defs = convention-excluded (no status rows); find-#4 re-GREEN run 8 re-verified P0+A1+A2 OK (no per-decl reprints — the m1 prints stand as A2's per-decl evidence of record; file grows with P2-c/d/e = delta slot) |
| 10.9 | `pilots/72-M1/P72M1T3.lean` | **9/9 direct** | 4 × `l3a-run6-GREEN.log:59–:62` + 5 gap decls `axcheck-l3a-run1.log:213–:217` | the T1/T2 custody reprints (52+28 records, same log) are C2-era files, NOT added here |
| 10.11 | `pilots/32/M2.lean` (new proof surface) | **9/9** = 7 direct + 2 documented-elimination | 7 theorems `run12-crossing-existence.log:60–:66`; helpers `log4_pos`/`log10_pos` by the section's elimination note (rc=0, 0 sorry-warnings; consumed inside printed-triad carry) | file census 43 public decls = frozen-M1 carry (C2-swept, not re-added) + the 9 new proof decls; the 2 helpers get direct prints at the §7b(ii) 32-M2 full-coverage stage |
| 10.12 | `pilots/75/N2-P0.lean` | **15/15 direct** | `n2-p0-run4.log:83–:97` (repeats :159+) | 1 theorem + 14 defs/props, ALL printed (defs printed here — better than convention) |
| 10.13 | `pilots/78/P0.lean` | **26/26** = 3 direct + 23 documented-elimination | 3 public `p0-run4.log:22–:24` (repeats :53–:55); 23 privates by the section's elimination note (rc=0, 0 sorry, 0 sorryAx; folds into printed theorems) | full-coverage prints when the Stage-B family charters (§7a) |
| 10.22 | `pilots/75/N2-P1.lean` (CHECKPOINT) | **SUPERSEDED-BY-§10.29** (was 4/7 = 4 direct core + 3 sorryAx IN-PROGRESS at run 7; the 3 residuals cleared at run 15 — final 14/14 in machine row §10.29) | historical: core `n2-p1-run7.log:175–:178` (validated this pass — A2's manual pick CONFIRMED); the 3 were `:174/:179/:180` sorryAx on failing packaging decls | excluded from the roll-up (the file's decls are counted ONCE, at §10.29's final state) |
| 10.30 | `pilots/al3d/A2.lean` (AL-P2 c/d/e honest stop; P2-c CLOSED at run 13) | **63/63 direct** (the honest verified surface — the run-23-era "114 decls" header claim was intent, not state; RECOVERY finding folded) | `alp2-run13-p2c-closureverify.log` — pre-fire sha `509f2368…`, A2.lean OK rc=0, 0 sorryAx, 63 distinct decls = the file's 63-line audit tail, all exact triad; A1 re-verified in-run (88 prints) | file GROWS with the P2-e rebuild re-charter (find #5) — sha-at-sweep governs (`AxPilotAL3D_A2` in TARGETS); counted at the run-13 verified bytes |
| 10.31-privates | `pilots/74/P1.lean` — the 24 `private lemma`s | **24/24 documented-elimination** | rc=0 + 0 sorry-warnings at run 5 (`p1-completion-runs1-5.log:19/:1585+`); the file's audit tail prints the 7 publics (machine row §10.31); privates direct-print at the sweep full-coverage stage | §10.13-class elimination, flagged not silent |
| 10.32-T2 | `pilots/77/T2.lean` (the FINAL wave-3 unit, honest stop) | **7/8 direct** — 7 triad-clean + 1 TAINTED (`isDegreeBlock_iff_sum_blockProj`, sorryAx via the filter-missed elaboration error) | `t1t2-run9.log:464–:471` (seven exact-triad prints verified line-by-line; the tainted one wraps at :464) | the tree carries run-8 for T1 (NOT-GREEN class, no census of its own — §10.27 convention); T2's tainted decl = **the one whole-tree residual**, an iter-5 item (filter fix + the one decl) |

Manual addend subtotal: **159/160** (110 direct + 49 documented-elimination; the
§10.22 former 4/7 row superseded by §10.29's machine row; §10.30 = 63 direct;
§10.31-privates = 24 elim; §10.32-T2 = 7 direct of 8).

**(c) Donor-pin audit rows — DONOR decls (separate composition line; never our
pilots' census):** §10.5 zeta23 Theorem-E chain **5/5** (`zeta23e-p0-run1.log:190–194`,
repeats :203–207) + §10.7 OAI G11/G12 audit set **9/9** (`run35-g11-fix.log:198–206`
+:240–245) + §10.10 ZZV2 donor-hygiene pins **4/4** (`p0-run1.log:151–154`, repeats
:182–185) = **18/18 donor rows triad at their donor pins**.

**(d) N/A classes (flagged, listed, excluded from every roll-up number):**
probe/statement rungs — §10.14 FF-EZ4 P0, §10.15 74-P0, §10.19 FF-EZ2 P0, §10.24
G9+G13, §10.25 22-T2a (elaboration verdicts only, no proof surface; §10.10's own
surface likewise probe-class — its 4 donor rows are in (c)); honest stops — §10.21
74-P1 (**superseded-BY-§10.31**: the file's decls count once, at §10.31's
completion state), §10.27 77-T1 (verified-red; run-log sorryAx = error artifacts,
superseded class; zero final triad-clean decls — §10.30's resolve pending A7);
embedded/machine-covered — §10.3 (= the 22/22 machine row), §10.4 (= the 89/89
machine row), §10.17 (Part E's 6 direct prints `d1-run1.log:25–:30` are INSIDE
§10.26's 45/45 — L5 embeds L3 verbatim), §10.20 (superseded interim state, same
embedding), §10.22 (superseded by §10.29, table (b) note).

**(e) Whole-tree roll-up formula — the FINAL close-time basis (RESTATED at §10.32,
the last wave-3 fold; supersedes the same-day 378/378 interim):**

```
OUR pilots:  machine 226/226 (9 sections, tally_section10.py @ this file,
                              §10.29 = 14/14, §10.31 = 7/7 publics)
           + manual    159/160 (§10.32-T2's 7-of-8 incl. the ONE tainted decl;
                                 §10.30's 63/63 direct; §10.31's 24 privates elim;
                                 prior 65/65)
           =          385/386 triad-clean decls across §10.1–§10.32
              (336 direct-print + 49 documented-elimination; the ONE residual =
               77-T2's isDegreeBlock_iff_sum_blockProj, sorryAx via the runner's
               filter blind spot — iter-5 item, §10.32)
DONOR rows:  + 18/18 donor-pin audit rows (table (c)) — quote separately
Delta slots: NONE — wave 3 COMPLETE (all five in-flight units folded: §10.28
FF-EZ2-P2, §10.29 N2-P1 FINAL+M3, §10.30 AL-P2, §10.31 74-P1, §10.32 77).
Iter-5 carriers recorded (NOT residuals): N2-P2 PAUSED-at-close (2/6, name-resolution
only, the 14/14 core untouched — §10.29 addendum); AL-P2 P2-e rebuild re-charter;
the 77 filter fix + tainted decl; M3-adjacent P0 hnp erratum DISCHARGED (applied
`02a5d71`); A2.lean's prose stamp.
Out-of-scope note: C2-era frozen carries inside Iteration-4 files (M1-in-M2, L2/M1-in-
L5) are counted in their C2 sweep, not here; 32-M1's 28-lemma print-surface closure
rides the §7b(ii) full-coverage stage as planned.
```

**Provenance chain:** `qa/iter4-review/tally_section10.py` (A2's READ-ONLY scaffold)
run 2026-11-18 against THIS file post-geometry-fix → machine numbers; every manual
cell above cites a persisted log line re-read this pass (no count from memory, no
guess — the two documented-elimination classes carry their sections' recorded
elimination cases and are flagged, not silent).

— census companion lane A1, 2026-11-18, worktree agent-02 (main @ c67d64e + the
wave-3 tail landings). Updates at the four delta-slot landings; supersedes nothing in
§10.1–§10.28.

*Changelog tail (batch 21, 2026-11-18, same-day triple): the run-19 §10.29 AMENDMENT
(20th batch above) followed by §10.30 AL-P2 c/d/e honest stop (P2-c CLOSED at run 13
— the correction relay's state, pre-fire sha 509f2368, 63/63 direct; P2-d PARTIAL
GREEN parked at find #5; P2-e → rebuild re-charter; the RECOVERY finding — the
"114 decls" header claim was intent not state; the runner error-filter process find
carried to §7d) + §10.31 74-P1 COMPLETION GREEN (run 5/5, sha-guard trail, 7/7
publics line-verified + 24 privates elim; supersedes §10.21; amended statements per
FINDS #1/#2 verified; the 9-family signature-class record; dossier-74 amendment
landed). Census: machine 226/226 over 9 sections, manual 152/152, whole-tree
378/378 ZERO residuals; delta slot remaining: 77-T1/T2 (A7) only.*

*Changelog tail (batch 22, 2026-11-18 — the FINAL wave-3 fold): §10.32 77
T1-completion + T2 honest stop (T1 31→7 site-local, zero mathematical failures,
run-8 tree, run-9 reverted; T2 seven-of-eight triad verified line-by-line at
`t1t2-run9.log:464–:471` with the one tainted decl = the filter-blind-spot class;
the physlib WickAlgebra NOVELTY EVENT + the no-TARGETS ruling carried; supersedes
§10.27's interim census) + the §10.29 PAUSED-AT-CLOSE addendum (N2-P2 at 2/6,
name-resolution only, the 14/14 core untouched, P2-a block = in-flight-unverified;
the hnp erratum DISCHARGED as applied at 02a5d71). Census close-time basis: N=32,
verdicts 26/3/3, machine 226/226 over 9 sections, manual 159/160, whole-tree
385/386 — the one residual = 77-T2's tainted decl (iter-5). Delta slots: NONE.*

### 10.33 — close residue: Step-B(i) re-fire + Step-B(ii) custody batch + D.4 stamps (lane R1, verification-intensity [verification-integrity], 2026-11-19; executes RESUME-BRIEF-ITER4 §(b)3 = runbook Steps 9–12 verification lane)

**Input state:** the Step-8 sweep (`axcheck-iter4-close-run1.log`, 58 stages, 53 OK /
5 FAIL — all five dispositioned STAGING defects per the in-log W1 taxonomy). Worktree
agent-02 re-synced to the forward main @ `e3d984b` (pre-verified byte-identical carry,
zero loss; H relay-answered).

**Root causes found, BOTH deeper than the taxonomy's phrasing (same staging class):**
(a) *taxonomy defect (1)* was a **stem collision**, not just a missing dep:
`al3d/{A1,A2}.lean` do `import P0`, but the global stem rewrite map keyed `P0` →
`AxPilot78_P0` (78/P0.lean and al3d/P0.lean share the stem; dict-last-wins) — run1
elaborated the WRONG module clean, then `proj`/`IsSlabDomain3D` (P0.lean:384/:348) went
unknown. Fix: `AMBIGUOUS_STEMS` drops `P0` from the global map + stage-scoped
`EXTRA_REWRITES` route A1/A2 → the new **compile-only dep stage `AxPilotAL3D_P0`**
(verbatim probe bytes, no prints, never a verdict row).
(b) *taxonomy defect (2)*'s premise was **false**: "sorted-name chain Pa < N2P0" —
`'N'(0x4E) < 'P'(0x50)`, sorted order compiled N2P0 BEFORE Pa (run1's exact failure).
Fix: `make_axcheck.py` emits **order.txt** (TARGETS list order = dependency order) and
`axcheck_probe.py` reads it (absent → sorted glob, back-compat). Dated correction note
in the N2P0 row comment; the 2026-11-18 belief is recorded as corrected, not inherited.

**Defect (3):** `AxPilot75_N2P1` staged from **RUN-19 COMMITTED BYTES**
(`git show 3ad896b:research/pilots/75/N2-P1.lean`, `GIT_BYTES_OVERRIDES`, sha-guarded
`ca1089e2a0c122c4` — HEAD's paused P2-a block `ecd44c6a…` never staged; A1's
pre-registered flag). **Dep compatibility verified:** the 02a5d71 hnp erratum changed
only `DirichletFactorizationTransferQ`'s def in N2-P0; run-19 N2-P1 references it in
docstring prose alone (:112/:644) and states the corrected shape inline with its own
`hnp` binder (:651/:654) — so run-19 bytes elaborate identically against post-erratum
N2-P0 (`1cf5cbe217c68564`), which is itself GREEN-loaded (run20/21 chains).

**Defect (4):** `AxPilot42_M4b` — **bytes-unchanged donor citation** (C2-close precedent
`stepB-c2.log:1`): verdict of record = `stepB-c2-m4b-donor.log` (donor-tree build rc=0 +
stage OK, 70 axiom-lines triad-only). Verified 2026-11-19: M4b.lean sha `4499e790e54398c9`
identical at `4323178` (M4b TERMINAL, 2026-11-14) and close HEAD `e3d984b`, no intervening
commit, 70-theorem extraction parity. Row comment amended in `make_axcheck.py`.

**Outcome (b) — subset re-fire** `feasibility/probe/logs/axcheck-iter4-close-run2-subset.log`
(app ap-j76M5pBFvem1VTu7QBohXM, doz CLI, wall 130 s, max_cpu 1.13, max_mem 6060 MB
mmapped-olean class, OVER=1 mem): **5/5 run1-FAIL verdict stages OK** — AL3D_A1 44 /
AL3D_A2 126 / 75_N2P0 16 / 75_N2P1 27 records + M4b cited; Pa drift-check 82; scan 295
records, **0 sorryAx, 0 errors, all ⊆ triad** (292 triad + 2 [propext, Quot.sound] +
1 [propext]); per-stage record-parity with verdict counters (the engine's new
elided-axiom full persistence fired under every excerpt marker).

**Outcome (c) — Step-B(ii) custody batch** `feasibility/probe/logs/axb-close-iter4-run1.log`
(runner `feasibility/probe/axb_close_iter4.py` + `run_axb_close_iter4.sh`, app
ap-nGICUfHCJ396YbVP2acPRn, wall 185 s, max_cpu 1.50, max_mem 8355 MB same class):
**9/9 full-coverage stages OK — 807 records, 0 sorryAx, 0 TALLY-ONLY, all ⊆ triad**
(641 triad + 79 [propext, Quot.sound] + 53 no-axioms + 34 [propext]):
`AxFC_75_N2P1run19` 39 (12 privates direct-printed FIRST TIME — run-19's 14/14 print
surface was publics + the ratCharOf def); `AxFC_73_Q4` 46; `AxFC_AL3D_A2` 126;
`AxFC_10_L5` **350** (280+41 census incl. every D-tranche private); `AxFC_32_M1` 50 /
`AxFC_32_M2` 50 (§10.11's print caveat CLOSED — the 28 named M1 lemmas + M2's
`log4_pos`/`log10_pos` direct-printed); `AxFC_FFEZ2_P2` 18; `AxFC_74_P1` 38 (24
privates); `AxFC_78_P0` 29 (23 privates). Dep stages 5/5 compile-OK — AxDep_AL3DP0's
"FAIL sorry-warnings=3" = the 3 CERTIFIED Step-A probe tokens (staged :108/:146/:151 =
source :106/:144/:149 + 2-line header offset, exact 1:1; rc=0, 0 errors, olean fed
A1/A2 both OK) — verdict-rule artifact, dispositioned in-log, NOT an artifact defect.

**Citations of record (bytes-unchanged branch, each verified this pass):** 75_Pb
`axcheck-full-run1.log` 89/89 @ `da05c60ceb78755b`; 72-M1 T3 `axcheck-l3a-run1.log`
9/9 @ `fe57d30b19d9a836`; zzv2-lam P1 `p1-run3.log` donor-tree 10/10 incl. 2 privates @
`a9a6555cadcd604c` (not re-staged — runbook Step 9's "if re-staged" condition unmet);
42-M4b `stepB-c2-m4b-donor.log` @ `4499e790e54398c9`; **ff-ez2 P1** `p1-run4.log`
sorry-strict OK, full print surface 7/7 incl. `_private…density_of_all` @
`9d8a7b1981faabce` — DATED CORRECTION: the 2026-11-18 TARGETS comment "P1 STAY
probe-convention" was WRONG (P1.lean is proof-class, own header + §7d's "fires at
sweep"); discharged via the citation branch (Pb/D.4 precedent) with the correction
recorded in `make_axcheck.py`.

**D.4 sha stamps — bytes-unchanged branch RE-VERIFIED at `e3d984b` (2026-11-19,
verify-don't-assume): Pa `d61eb0485a6ff672`/1557 ✓, Pb `da05c60ceb78755b`/2303 ✓,
zeta23e P0 `986f1ce879786f33`/59 ✓, 78-P0 `d94d115e3d8d08d7`/444 ✓ — all four exactly
the a9-splice-readme-checklist §D.4 table values; sweep actions executed (Pa
drift-check re-stage run2-subset; 78-P0 TARGETS row run1 + custody stage; Pb/zeta23e
standing-log stamps cited). The article-side stamp edits stay H-owned (A9 items 6–7).

**Census impact:** none to the 385/386 close-time basis — the custody prints bring the
print-gapped decls (N2-P1 12, 74-P1 24, 78-P0 23, Q4 9, L5 41, FFEZ2-P2 5, 32's lemma
classes) under DIRECT machine records for the first time, all GREEN 0 sorryAx —
strengthening (not changing) §10.CENSUS(e); the one whole-tree residual remains 77-T2's
tainted decl (iter-5 carry). VERIFICATION-LEDGER §10 + Step D appended this pass
(`feasibility/VERIFICATION-LEDGER.md`, 55,305 LoC tree total, extractor-generated).

— close-residue fold lane R1, 2026-11-19, worktree agent-02 (main @ e3d984b). Supersedes
nothing in §10.1–§10.32; the two runbook-stale namings encountered (the false sorted-chain
premise in make_axcheck's N2P0 comment; FFEZ2-P1's mislabel) are recorded as dated
corrections in situ, per the no-silent-deviation rule.

*Changelog tail (batch 23, 2026-11-19, R1 close residue): §10.33 — Step-B(i) re-fire
5/5 (run2-subset log; P0-stem-collision + order.txt fixes; run-19-bytes N2P1 staged
git-show-3ad896b sha-guarded) + Step-B(ii) custody 9/9 (axb-close-iter4-run1.log,
807 records 0 sorryAx 0 TALLY-ONLY; AxDep_AL3DP0 = certified-token verdict-rule
disposition) + M4b/ff-ez2-P1 citation corrections + D.4 stamps re-verified 4/4 +
VERIFICATION-LEDGER §10 + Step D. Whole-tree basis unchanged: 385/386 (the residual =
77-T2 tainted decl, iter-5).*

## §11 — Iteration-5 verification tables (lane R1, opened 2026-11-19 post-K; rows land/extend on formal reports)

Section conventions carry from §10 (extractor-generated counts only; sha256(16) at-sweep/run;
verdicts from persisted logs with provenance headers, never memory; Step-A per
`feasibility/probe/logs/stepA-incremental-iter5.log`; sweep plan =
`feasibility/probe/FINAL-SWEEP-PLAN-ITER5.md`). Baseline: ENTRY 1 = 52 carry-forward exact,
0 unexplained, 0 new tokens on the post-opening tree (e309edd); re-confirmed 52-exact over
111 files post-ff8b99e (N2-P1 run-26 bytes + P3 skeleton add 0 tokens).

*(Process note, R1 2026-11-19: this §11 block was first written at e309edd and extended at
unit 3, then inadvertently wiped from the working tree by `git checkout -f ff8b99e` (the -f
flag discards local tracked-file modifications; prior syncs were safe only because their
edits were already committed in K). Reconstructed verbatim from the lane's session records
this same day — content identical to the reported shas 2103e774/6ebb1ee4 lineage, with the
unit-4 N2 live fold applied directly. Correction recorded, not silent; the sync procedure
from here on is checkout-only-when-clean.)*

### 11.1 Day-1 GREENs (opening commit e309edd, 2026-11-19)

| slot | file (sha256(16), LoC, census) | run of record (log, wall, telemetry) | verdict | Step-B treatment (plan §0) |
|---|---|---|---|---|
| 10 M-arc (R3) | `pilots/10/M-arc.lean` `7addcf0029ea06e7`, 4,327 LoC, 322 decls (281+41 priv; = header + **L5 verbatim** `da398f21` + Part M 51) | `logs/marc-run1.log` GREEN **r2** (65 s, max_cpu 0.96, OVER=1 soft = mmapped class) | GREEN — rc=0, 0 errors, 0 sorry-warnings; billing: plumbing/completion-value, never novelty (orchestrator DAY-1-CLASS + hv SUPPLIED-AS-BINDER rulings) | **AxPilot10_MArc single-anchor row RECOMMENDED** (L5 single-anchor precedent; embed condition verified — L5 verbatim inside, 321→322 decls = +1 Part M theorem); L5/earlier rungs → §-historical citations |
| 41-P0 statement rung (R4) | `pilots/41/P0.lean` `b177acdbf0346bf1`, 202 LoC, 1 public decl (`phi_parts`, defl rfl) | `logs/p0-run2.log` GREEN r2 (65 s, ap-aVPWsYZdxVvzKx5GqaYOlb; run 1 NOT-GREEN codegen-class on the pre-open bytes `3ba649fa`) | GREEN — elaboration verdict ONLY (probe conventions; (M)/(N)/(H) stay dossier hypotheses until the core lands) | row on R4's confirmation class (never a headline); Core S–M rows land with R4's reports |
| AL M0-rebuild (R8) | `pilots/al3d/A2.lean` `b84270b639166680`, 1,145 LoC, 73 decls (63 carry + 10 new publics; 0 priv) | `logs/alp2-m0-run3-fixround1.log` GREEN **r3** (86 s, OVER=0; regression leg run 1 + rebuild run 2 in `alp2-m0-run{1,2}*.log`) | GREEN — sorry-strict, rc=0, 0 errors; the find-#5 canonical z-rank core (`colZImage`/`colZRank` family, NO Eq.rec) | **supersedes the iter-4 close-time A2 bytes** (`6a5ed555…` + AxFC 126-record custody = historical for this file); AxPilotAL3D_A2 re-stages at THESE bytes at sweep (sha-at-sweep governs) |
| η-pin-probe (R5) | `pilots/zzv2-lam/eta-pin-probe.lean` `cadc838d220455a7`, 322 LoC, 1 public decl | `logs/eta-pin-probe-run2.log` GREEN r2 COMPLETE (ap-rMawIAp2A8xPdQhUrs9443; OVER-cpu investigation delivered) | GREEN PROBE COMPLETE — sorry-strict OK on the built ZZV2 donor tree; **donor hygiene 7/7 triad-only on-pin**; record-billed quota-free (DECISION-2 Option A) | probe-convention — Step-A scope ONLY, never a Step-B stage |
| Liu-B_new P0 (R7) | `pilots/liu-bnew/P0.lean` `20ac66718a932e6c`, 168 LoC, 2 public decls (the bridges; rest Prop defs) | `logs/p0-run2.log` GREEN **r2** (42 s, OVER=0; run 1 FAIL = 2 × dependsOnNoncomputable, fixed `noncomputable def` — the substrate rule's first application) | GREEN — engineering statement-port, never discovery-billed; bridges **triad-clean in-run** (`[propext, Classical.choice, Quot.sound]` ×2); Liu-1 stays DO-NOT-CONSUME (statement-level citation only) | probe-convention — NEVER a Step-B stage (§7a zzv2-P0 ruling class; class re-verified vs file header+census, ff-ez2-P1 lesson applied) |

### 11.2 Landings + open rows (folded live by R1 on formal reports)

**75-N2 P2-a — CLOSED GREEN run 26 (R6 unit 3, landed `ff8b99e` 2026-11-19; folded
same-day by R1 unit 4; the §11.3-draft GREEN branch EXECUTED, honest-stop branch
VACATED):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 75-N2 P2-a (R6) | `pilots/75/N2-P1.lean` @ `ff8b99e` `ce6719c8af450eaa`, 820 LoC, 27 decls (14 pub + 13 priv; the 15/15 = the file's own audit print surface) | `logs/n2-p1-run26.log` (wall 68 s, cpu 0.77/2.0, mem 3706 MB, **OVER=0** — fully in spec; fired-once per the final-grant ruling, pre-run sha guard ce6719c8) | **GREEN-triad — `windowFinite_LFunction` (`N2-P1.lean:738`) PROVED-UNCONDITIONAL; 15/15 file decls triad ([propext, Classical.choice, Quot.sound] only), 0 sorry, 0 sorryAx**; Pa + N2P0 chain recompiled OK in-run | **Fix-loop taxonomy r20→r26 = 10→8→3→4\*→11\*→1→0 (`*` = failed-have unmasking events)**; zero math defects across the entire grant, P2-a argument unchanged since run 22; r24/25 walls 63/81 s, r25 OVER-mem = the §Modal-5 mapped-olean artifact (cpu 0.67/2.0). Staging: GIT_BYTES_OVERRIDES MOVED to the run-26 state (`ff8b99e`/`ce6719c8`, mechanism verified by staging test; run-19 pin superseded — dated note in make_axcheck.py); AxFC custody at sweep direct-prints the 13 privates |
| 75-N2 P3 skeleton (R6) | `pilots/75/N2-P3.lean` `5d2b7dd7e72497cc`, 207 LoC, 1 public decl (`windowFinite_family` :105) | NONE — never-run staging class | **SKELETON — statements-only, zero-sorry rung; NO verdict until fired** (the 41-P0 candidate-unfired class); Step-A entry landed (0 tokens) | charter = final-grant ruling 2026-11-19 (P2-a CLOSED authorizing the skeleton); the V2 ζ-column discharge + composed `zetaL_rat_two_thirds_landed`; row + AxDep chain wiring enter at the GREEN fire |

Open (stubbed in FINAL-SWEEP-PLAN-ITER5 §2b, same-hour folds): 41 Core S–M (R4 —
the §11.3-draft 41-core package armed); **AL-M1 (R8's ladder — the L1
restriction-compat workhorse via the congruence class, consumes M0's
`colZRank_fibre`; DISTINCT from 72-M1, both stubs live)**; 74-P2 (R3); 72-M1
L3(b–d + interface) (R2); round-6 (R9); watchlist (`a9-iter5-article-watchlist.md`)
— rows per landing, extractor counts, sha-at-run.

### 11.3-draft — 41-core landing rows + same-hour-fold stubs (lane R1 event-prep, 2026-11-19; DRAFT ONLY until the owning lanes' formal reports — names/counts report-governed)

**(a) 41-CORE row — decide-certified refutation + corrected-theorem landing (the 78
precedent class, §10.13):** expected decl surface = r decide-certified REFUTATIONS of
the P0-elaborated universals (kernel `Decidable.decide` over the finite quadruple
space; NEVER `native_decide` — gate-enforced) + c CORRECTED-PROVED theorems
(`GqGen`, `MainIdentityCor`, `MainIdentityStratum`, `qRigid` — report-governed) +
private bookkeeping (census at landing). Row shape:

| slot | file (sha256(16), LoC, census) | run of record | verdict cell (the N+M vocabulary) |
|---|---|---|---|
| 41-Core (R4) | `pilots/41/Core.lean` `<sha>`, `<LoC>` LoC, `<r+c+priv>` decls | `<core-N run>.log` (wall, telemetry, app) | **GREEN-triad — `<r>` REFUTED-AS-UNIVERSAL (decide-certified, kernel, 0 sorryAx) + `<c>` CORRECTED-PROVED (`<names>`)**, records ⊆ triad (deciders may print no-axioms = ⊆ class); refutations are first-class PROVED-UNCONDITIONAL decls per the 78 precedent — NEGATIVE-kind discovery surface iff the dossier so rules (A9 roll-up owns PROVED-* vocabulary; D7 RULING pilot vocabulary here) |

Step-B: ONE row `AxPilot41_Core` (refutation decides + corrected theorems together —
the AxPilot78_P0 one-row precedent), + AxFC custody stage if privates exist;
sorry-token class = ZERO by construction (a decide line is a kernel term — any sorry
would surface as sorry-warning/sorryAx and fail sorry-strict; Step-A entry expected
0). GIT_BYTES: **NO override** — fresh file, landing commit = verified state (overrides
exist only for HEAD≠verified-bytes cases); sha-at-sweep stamp only. Sibling dep: if
Core does `import P0`, an AxDep_41_P0 compile-only dep stage + stage-scoped rewrite
(the AL3D-P0 pattern) — order.txt handles placement.

**(b) 41-P0 row addendum — the supersession note, DRAFTED WORDING (P0 verdict STANDS;
statements' status moves):** *Core addendum (post-core-1): P0's verdict of record is
UNCHANGED — an elaboration verdict about statability/type-correctness, never truth
("statement elaboration never certified provability", the N2-P0 erratum convention).
The universal forms P0 elaborated are now REFUTED-AS-UNIVERSAL by Core's
decide-certified theorems (kernel); the corrected forms (`GqGen`/`MainIdentityCor`/
`MainIdentityStratum`/`qRigid`) are the carriers going forward. Nothing in P0 is
retracted; P0's (M)/(N)/(H) hypothesis labels read, post-core, as "(M)-as-universal:
refuted; corrected (M): see Core" pointers; P0's statement-rung Step-B treatment
(never a headline) is unaffected.*

**(c) N2 run-26 — EXECUTED 2026-11-19 (R1 unit 4):** the GREEN branch is LIVE in
§11.2 above (run 26, 15/15 triad, override moved to `ff8b99e`/`ce6719c8af450eaa`);
the honest-stop branch is VACATED (P2-a CLOSED). Future N2 folds (P2-b, the P3 fire)
reuse this stub's chain-wiring notes.

**(d) 74-P2 (R3) stub:** Step-B(i) `AxPilot74_P2` + AxFC custody (P1 class); verdict
cell per report (GREEN-triad / honest-partial); billing per charter ruling at landing
(the `6216e2a` precharter: FIND-#1 family recycled constructively).

**(e) 72-M1 L3(b–d + interface) (R2) stub:** `P72M1T3.lean` GROWS — L3a citation
(`fe57d30b…`) stands historical; re-stage + custody re-run at the sweep-time sha;
headline decl = `interface_areaLaw_uniformAreaLaw`; verdict cell per report. (Prep
note: the re-task's "M1" read as 72-M1's T3 growth; re-title with a correction note
if another M1 was meant. **Unit-4 amendment: AL-M1 (R8) confirmed as a DISTINCT
stubble — see §11.2 open list + FINAL-SWEEP-PLAN-ITER5 §2b; both M1 stubs live.**)

— §11 opened lane R1, 2026-11-19, worktree agent-02 (reconstructed + folded at
ff8b99e per the process note above). §10 and everything below it are CLOSED HISTORY
at K = b2f2c18 (never edit; corrections append with dated notes).

**77 follow-up completion — T1 + T2 BOTH GREEN (R7 iter-5 rung, worktree agent-10,
folded by R1 unit 5 2026-11-19; the iter-4 §10.32 honest-stop state is SUPERSEDED —
its rows are closed history):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 77 T1-completion (R7) | `pilots/77/T1.lean` `70d7e9f75e705303`, 840 LoC, 52 decls (12 pub + 40 priv) | `logs/t1t2-run11.log` (run 11; donor-pin runner: tauceti @ `d92acc5c`, its manifest mathlib `1b1ccf4b` — the zeta23E own-lineage pattern; sorry-strict, full #print echo) | **GREEN-triad — 8/8 top-level theorems [propext, Classical.choice, Quot.sound] only, 0 sorry/0 sorryAx** — incl. `toFock_mul_self`, `occupationElem_mul_self`, `commute_occupationElem`, the `dictionary_numberOp/idempotent/commute` triple, `traceQuadraticForm_isoV`, and **`map_iso_occupationElem` FIRST-CLEAN** (the element-level dictionary to tauceti's own `carOccupationElement`) | **Residual burn-down 31 → 7 → 0 COMPLETE** (the iter-4 honest-stop at 7 closed with zero math defects carried). **[Fintype κ]-class statement-strengthening finding recorded on the T2 side (below)**. Step-B: DONOR-PIN class — AxPilot77_T1 in TARGETS (plain-batch FAIL BY DESIGN, M4b precedent; verdict of record = this log, or a sweep re-fire in the 77 runner); AxFC custody prints all 52 decls; sweep guard: main bytes == 70d7e9f75e705303 |
| 77 T2 completion (R7) | `pilots/77/T2.lean` `e70baf22d9ae220e`, 281 LoC, 12 decls (8 pub + 4 priv) | `logs/t2-run12.log` (run 12; sorry-strict) | **GREEN-triad — 8/8 top-level theorems triad-only, 0 sorry/0 sorryAx, incl. the FORMERLY-TAINTED `isDegreeBlock_iff_sum_blockProj` (`:82`)** | **THE WHOLE-TREE CENSUS'S 1-OF-386 RESIDUAL DISCHARGED: the iter-4 close basis 385/386 is superseded, on this landing, by a 386/386-equivalent state** (close-block residual pointer: CHARTER-SPLICE:71, RESEARCH.md:209, STATUS:830 — the "one residual = 77-T2 tainted decl → iter-5" line resolves HERE). Root cause of the iter-4 taint: `error(lean.synthInstanceFailed): failed to synthesize Fintype κ` — the drafted iff was **ill-typed without `[Fintype κ]`** (THE STATEMENT-STRENGTHENING FINDING: only the iff gains the binder; the parity twin needed none — its `Finset.range 2` spectrum masked the class; four other section theorems + three instances theorems signature-unchanged); the old runner's `": error:"`-only filter missed it (rc=1, errors=0 — the blind-spot). **Runner fix = the SECOND instance of the 43d55bb filter-blind-spot class** (`: error(` forms now matched + full raw dump on non-clean verdicts, run_pilot.py @ `1434e832e889a1cb`; FIRST instance family = the A4-run11/§7d standing note + the close-residue widened counters in make_axcheck/axcheck machinery). Step-B: [WARM] plain row AxPilot77_T2 (Mathlib-only; tauceti-SetLike stays a recorded extension condition); sweep guard: main bytes == e70baf22d9ae220e |

*Fold note (R1, 2026-11-19): both rows' shas verified against R7's worktree-of-record
(agent-10) this pass; entries become main-side when H commits the follow-up batch —
Step-A classifier ENTRY 4 fires on my tree at that commit (the GREEN bytes are not yet
in the classifier scope here). The §10.32 close-time rows and the K close block stand
as history; this fold is the recorded supersession they pointed to.*

**41-CORE — GREEN run 9, the headline fold (R4 iter-5 unit 2, worktree agent-08; folded
by R1 unit 6, 2026-11-19; the §11.3-draft (a) row-shape and (b) supersession wording
EXECUTED as pre-staged):**

| slot | file (sha256(16), LoC, census) | run of record | verdict cell (the N+M vocabulary, as pre-staged) | note cell |
|---|---|---|---|---|
| 41-Core (R4) | `pilots/41/Core.lean` on-disk `733b4a2d93a84689`, 627 LoC, 31 decls ALL public (30 top-level theorems + 1 def; 0 privates → Step-B appended tail IS full coverage) | `logs/core-run9.log` (run 9, 53 s; warm app crossmath-probe, doz CLI; GREEN bytes = the FIRED sha `921bc43cbd06d252`; on-disk = fired + dated FIRED header block, elaboration-inert comment-only — the P0-record/A2.lean precedent; both shas of record in Core-record.md) | **GREEN-triad — 4 REFUTED-AS-UNIVERSAL (decide-certified, kernel `Decidable.decide` over the 8⁴=4096-quad space, 0 sorryAx: P1, P2, MainIdentity-as-Para, N′) + 26 CORRECTED-PROVED** (`mainCor`/`mainStratum`/`qRigid`/`signs_anchor`/`alternation_fails_at_q_minus_one` et al.; 30 top-level theorems; FOUR at zero axioms = the deciders, ⊆-triad class; rest triad-or-leaner; 0 sorry, 0 sorryAx) | **The corrected discovery identity kernel-proved: A+B = (1−q)·aeval(GqGen) at EVERY parallelogram quad (`mainCor`); the dossier's G_q recovered exactly on the antipodal stratum (`mainStratum`); (N) true + q-rigidity off-stratum (`qRigid`); degenerate branch N′ CLOSED (value 2 ≠ 0 at q = −1).** Refutations are first-class PROVED-UNCONDITIONAL decls per the 78 precedent. **BUDGET DISCLOSURE: 9 runs — runs 5–8 = the universe-churn class** (ONE theorem's auto-bound `Type*` plumbing, `SigmaQ_Signs_all_q`; mathematical content certified from run 4), ≈9×60 s warm single-container, **2cpu/4GB HELD throughout** (resources held, no upgrade). Step-B: `AxPilot41_Core` ACTIVE in make_axcheck ([WARM], `import Mathlib` ONLY — P0 surface verbatim in-file, NO dep stage; NO override — inert-delta class; sweep guard: main bytes == 733b4a2d93a84689). Classifier ENTRY 5: 0 real tokens (2 prose mentions); forbidden-token gate OK |

*P0 supersession EXECUTED per the drafted (b) wording: P0's elaboration verdict STANDS
(never truth); its universal forms are REFUTED-AS-UNIVERSAL by Core's deciders; the
corrected forms are the carriers; P0's (M)/(N)/(H) labels read as pointers; P0's
statement-rung Step-B treatment (never a headline) unchanged. Cross-refs: the
dossier-41 amendment draft (R4, same directory) + §11.1's 41-P0 row.*

**74-P2 — G2 GREEN run 11 + G3 statement-probe PASS (R3 recharter, worktree agent-07;
folded by R1 unit 7, 2026-11-19; the §11.3-draft (d) stub EXECUTED):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 74-P2 G2 (R3) | `pilots/74/P2.lean` `49b808f33ba897cc`, 1,063 LoC, 37 decls (9 pub + 28 priv — AxFC custody at sweep prints all) | `logs/p2-runs1-11.log` (run 11 GREEN; sha-guarded every run; rc=0, 0 errors, 0 sorry-warnings; `maxHeartbeats 8M` carried in the verbatim P1 body) | **GREEN-triad — P2-a `mgfBound_var_sharp`** (varK ≤ 2v from the CENTERED bound on ANY positive window — the sharp window-free variance constant = the dossier T1(b)'s original Var ≤ 2σ²; **4.5× improvement over P1's window-edge 32(e^{1/4}−1)σ² ≈ 9.06σ²**) **+ P2-b `t1c_sharp`** (varK ≤ 1024·e·θ·B under `InSubGClass` — the exact MarginalTails class constant, 1024 = 2·512, pure instantiation of P2-a) — both exactly `[propext, Classical.choice, Quot.sound]` | **Budget disclosure — chartered ≤5, used 11** (descent 14→12→14→9→9→9→7→6→7→5→0, zero sorry every run): runs 1–5 chartered; **run 6 = process-error misfire OWNED** (the fix-batch's python assert aborted pre-write; fired without verifying — the P1 run-6 precedent class; the sha guard saw a distinct sha only via the landed header must-cite block masking the missing body fixes); runs 7–10 = mechanical-residue fix-loop (4 classes + audit-tail qualification, **every class named in the log header; ZERO math defects**); run 11 GREEN. **Route-1.5 finding: elementary squaring caps at 1/2 — the sharp constant needed the monotone-derivative route** (route 1's deriv blocked at its on-pin dependency). **Must-cites + wording guard CARRIED (binding, R9 pre-gate `novelty/round6-74p2-pregate.md`; P2.lean header verbatim)**: on-pin `Mathlib/Probability/Moments/SubGaussian.lean` EXISTS (the 2026-11-13 corpus-grep miss; no variance-equivalence theorem there — the tilted-variance identity lives only inside Hoeffding's proof) + `Mathlib/Probability/MGFAnalytic.lean:279`; NEVER phrase "corpus has no SubGaussian". Novelty (R9): P2-a formal-new-as-stated / mathematically-folklore. Step-B: AxPilot74_P2 ACTIVE ([WARM] Mathlib-only) + AxFC custody class; sweep guard: main bytes == 49b808f33ba897cc |
| 74-P2 G3 probe (R3) | same file (the `famN` + 3 Prop defs) | run 11 (same log; elaboration-only) | **G3 statement-probe PASS** — `famClassMemProbe` (spectrum ∧ class membership at B = (log n)²), `famVarLBProbe` (uniform-κ varLB discharge), `famTailProbe` (W-side bound) all elaborate on-pin | **Elaboration verdicts ONLY — never proof claims. P2-c chartered-unexecuted: NO live row until its GREEN; its separate ≤5 budget is UNSPENT/INTACT** (the natural iter-5 continuation; probe Props already on main-tracked disk; marginal-θ membership risk = the known open core; `IsLittleO` pinned). P2-c's class-level tightness set = NEW-statement (R9) |

*Fold note (R1, 2026-11-19): bytes verified at R3's worktree-of-record (agent-07); classifier
one-file scope: 0 real tokens (2 prose mentions); forbidden-token gate OK. Step-B + AxFC
rows live at H's batch-6 commit; tree-wide ENTRY fires then.*

**AL M1/M2-a state (R8, worktree agent-05; landed via H's batch-7; folded by R1 unit 8,
2026-11-19; A2 bytes `7db88f34c8aab795`, 1,329 LoC, 81 decls = 80 pub + 1 priv):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| AL-M1 (R8) | `pilots/al3d/A2.lean` @ `7db88f34c8aab795` | `logs/alp2-m1-run4-completion.log` (M1 completion fire; 4 runs of the 2–3 chartered — **completion-grant class**) | **CLOSED GREEN — the workhorse `colEquivVar_restr` final assembly triad; run-13's 85-line regression identity HELD** (the frozen-core gate: byte-identical through every M0/M1/M2 run); **growth = 10 M0 + 4 M1 lines, all triad** | The find-#5 canonical z-rank route pays off: no `Eq.rec` remains, the un-park key per the precharter. Guard discipline: AxPilotAL3D_A2 sweep guard MOVES to last-verified committed bytes = `7db88f34` @ batch-7 (from `b84270b6` @ M0) |
| AL-M2-a (R8) | same file (the 4 M2-a lines) | `logs/alp2-m2-run2-fixround1.log` (descent 6→2→(2 trivial)) | **honest-partial — 2/4 GREEN structural halves: `powerset_eq_biUnion_projFib` + `sum_projFib_extendId` triad; 2 fixes-on-disk UNFIRED — no live claim until their GREEN** | **The 2 parked decls are NOT sorry stubs on disk — the pre-written one-liners are APPLIED** (`colEquivVar_restr_apply`: the `.symm` have-line; `projFib_pairwise_disjoint`: `unfold Function.onFun`) with **no fire since m2-run2, which fired the PRE-FIX sorryAx bytes** — the N2-P2 paused class (fixes-on-disk-unfired). Classifier over the moved bytes: **0 REAL-TOKEN** (2 prose mentions; disk sorry-free) — the re-task's verification question answered: sorry-free-but-unverified, labeled honestly. The A2 sweep stage's verdict stays HONEST-PARTIAL until the M2 completion fire certifies the 2. M2-b (swap proper) + M3 (P2-e assembly) follow |

*Fold note (R1, 2026-11-19): bytes verified at R8's worktree-of-record (agent-05);
certificate impact NONE (0 new tokens — the parked pair carries no literal sorry on
disk). Tree-wide re-run fires at H's batch-7 commit.*

**AL M2-a CLOSURE + M2-b state (R8 unit-6, landed H batch-B; folded R1 unit 9, 2026-11-19;
A2 bytes `9706196c5f5ff593`, 1,431 LoC, 83 decls = 82 pub + 1 priv — the unit-8
honest-partial row CONVERTS):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| AL-M2-a (R8) | `pilots/al3d/A2.lean` @ `9706196c` | the batch-B landing fire (M2 completion; the unit-8 fixes-on-disk pair certified) | **CLOSED GREEN 4/4 — `colEquivVar_restr_apply` + `powerset_eq_biUnion_projFib` + `projFib_pairwise_disjoint` + `sum_projFib_extendId` ALL triad** (the two structural halves + the two former one-liner residuals, their pre-written fixes certified) | The unit-8 unfired-class resolution: fixes fired, both clean. Guard RE-BIND: `7db88f34` → **`9706196c`** (last-verified committed @ batch-B) |
| AL-M2-b (R8) | same file (`regReindexEquiv_compl_iff` :1267, `colEquivVar_swap` :1337) | last fire = the M2-a completion run (both printed sorryAx there) | **honest-partial per D7 — 2 sorryAx-parked-at-last-fire decls, fixes-on-disk-UNFIRED; no live claim until the M2-b fire** | `colEquivVar_swap` CONSUMES the parked iff (:1351) — the swap's sorryAx is transitive through it; both fixes pre-written on disk. **Disk is SORRY-FREE** (classifier 0 real tokens — the sorryAx state is the last-fire record, not disk tokens; certificate unchanged 52+0). The A2 sweep verdict stays honest-partial until M2-b's fire |

**N2-P3 — three-theorem GREEN state (R6 units 4–5, landed H batches 9+B; folded R1 unit 9;
`N2-P3.lean` `f9bd28c5f8f7c3d2`, 242 LoC, 3 public decls — the §11.2 SKELETON row
CONVERTS to the fired state):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 75-N2 P3 (R6) | `pilots/75/N2-P3.lean` `f9bd28c5f8f7c3d2` (grew from banked P3-a `fda6652636cddd8f`) | `logs/n2-p3-run3.log` (P3-b/c **BOTH GREEN FIRST SHOT**; P3-a banked at n2-p3-run{1,2}) | **GREEN-triad, three theorems: P3-a `windowFinite_family` + P3-b `abFacQ_of_factorization` (AbFacQOfFactorization discharged) + P3-c `analyticOrderAt_lFunction_ne_top` (the engine's hntopψ slot)** — all `[propext, Classical.choice, Quot.sound]` | **NOT yet P3-complete: the composed headline `zetaL_rat_two_thirds_landed` has not landed** — the skeleton rule holds, TARGETS row enters at its GREEN with chain wiring (`import N2P0`+`import N2P1` hyphenless → stage-scoped rewrites to AxPilot75_N2P0/AxPilot75_N2P1, the N2P1 row staging the override-pinned run-26 bytes; order Pa→N2P0→N2P1→P3). Classifier: 0 real tokens (ENTRY 9) |

*Fold note (R1, 2026-11-19): both files' bytes verified on main @ efcabc4; certificate
UNCHANGED 52+0 (A2's M2-b parks are disk-sorry-free — the honest label is the last-fire
sorryAx state + unfired fixes, per D7 recorded on the row, not a token). H's board 74-P2
line was ALREADY corrected at batch-D (`efcabc4` board rows 14/16 show unit-8 landed incl.
the 74-P2 fold) — nothing to correct on my side.*

**72-M1 L3 — WAVE-CLOSE honest-partial-FINAL (R2 W2-4, landed H batch-G @ 53b7278;
folded R1 unit 10, 2026-11-19; `P72M1T3.lean` v13 `dcda3133b1ffbd16`, 1,048 LoC,
44 decls all public):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 72-M1 L3(b–d+interface) (R2) | `pilots/72-M1/P72M1T3.lean` `dcda3133b1ffbd16` | runs 1–13 over 3 grants (the ≤2 FINAL-ROUND grant = runs 12–13; `logs/l3bd-stop-note.md` + `L3-record.md`; the l3-run logs + run 12's flips recorded there) | **honest-partial-FINAL per D7 — TRIAD-CLEAN: `toGrid_star_dotProduct_self` (L3b), `submatrix_mulVec_ec`, `eig_toGrid`, `hasGlobalGap_of_fullSystemGap` (L3c), `edgeBoundary_le_boundaryCard` + T2's `boundaryCard_le_edgeBoundary` (BOTH directions); contaminated tail: `isAdmissible_ΦL` / `hamiltonian_gridDom_eq` / `interface_areaLaw_uniformAreaLaw`; ZERO math defects; ZERO sorry tokens on disk** (classifier 0 real — the contamination is sorryAx-at-last-fire, not disk tokens) | Run 12 flipped L3c + the boundary lemma (the Loewner gap transfer, the quadratic-form/reality assembly, both boundary-comparability directions kernel-clean); run 13 rotated the remaining orientation (submatrix_mulVec_ec, eig_toGrid, L3c, edgeBoundary + all T1/T2/L3a regressions OK). **§FINAL-ROUND next-wave charter pointer: the hQ-tail is a one-word `Finset.mul_sum` fix; + hmul rw-order, hN e1-pullout, hamiltonian-step1 set-avoidance — est. 1–2 rounds.** Sweep: AxPilot72_M1_T3 guard = `dcda3133` (the closing bytes); **the sweep verdict class STAYS honest-partial until the next wave's GREEN flips it** (re-stage + custody re-run then) |

*Fold note (R1, 2026-11-19): bytes verified on main @ 53b7278; certificate UNCHANGED
52+0 (0 real tokens — consistent with H's "zero sorry tokens" board line).*

**η-port rung 1 — GREEN EXIT (R5, landed H batch-H @ b611a25; folded R1 unit 11,
2026-11-19; `eta-r1.lean` `5b04304a53a5b849`, 217 LoC, 7 decls = 6 pub + 1 priv):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| zzv2-λ η-port R1 (R5) | `pilots/zzv2-lam/eta-r1.lean` `5b04304a53a5b849` (sha-guarded at the confirmation fire) | `logs/eta-r1-run3.log` (log sha `9b2db9ae…`; the confirmation run) — transition from `eta-r1-run{1,2}.log` (the ≤2 fix budget) | **GREEN — strict-OK 6/6 triad on the confirmation fire (3 runs total: 2 fix + 1 confirm)**: `fourierC_dilateTo` (i), `cutoffNormaliserLam_covariance` (ii-a), `cutoffTestLam_eq_dilate` (ii-b), + the λ=1/2 checkpoint `dilateTo_half` / `extremalLam_half` / `cutoffTestLam_half` | **The GATED-RED 5/6 → 6/6 transition, both log sets cited:** at run 2 (GATED-RED, budget spent) i, ii-a, dilateTo_half, extremalLam_half were triad-clean with ONE mechanical residual (unfold order in ii-b) — fix parked on-disk UNFIRED at `5b04304a` per budget discipline (the N2-P2 precedent); the confirmation run fired it: eq_dilate + cutoffTestLam_half clean, **strict-OK 6/6**. **The λ=1/2 regression discipline DELIVERED at rung 1** (the checkpoint ordered first-able — the Lamzouri-informal anchor pinned at the base layer). Class: PROOF artifact on the **DONOR TREE** ([LAYERS] — elaborated INSIDE the built ZetaZerosV2 tree on-pin; verdict of record = the run log, the zzv2-P1 precedent — NOT a plain TARGETS stage); billing: technical record, DECISION-2 Option A, never discovery-phrased. Port ledger: 6 of 6–10 spent; R2 GATED-RED with its confirmation parked (`36c593f7` — separate state, not this fold) |

*Fold note (R1, 2026-11-19): bytes verified on main @ b611a25; classifier one-file scope:
0 REAL-TOKEN (1 prose mention — "zero sorry by construction" confirmed at token level);
certificate UNCHANGED 52+0.*

**74-P2-c — run-17 PARKED, final-for-this-wave (R3 unit-5, landed H batch-H @ b611a25;
folded R1 unit 12, 2026-11-19; the G3 PASS row CONVERTS — `P2.lean` guard bytes
`4425be898768fdb0`, 1,490 LoC, 55 decls = 16 pub + 39 priv):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 74-P2-c (R3) | `pilots/74/P2.lean` `4425be898768fdb0` | `logs/p2c-run17.log` (FIRE-ONCE grant; descent 18→15 = 2 real sites + 13 print-cascade; **ZERO sorry on disk** — classifier 0 real, certificate unchanged) | **NOT-GREEN at fire-once → PARKED wave-close; honest-partial per D7. `t4_not_littleO` CLOSED = the tightness set 3-OF-4: floor-achieved (`t4_floor_achieved`) + not-littleO (`Asymptotics.IsLittleO` negation via `Filter.eventually_atTop`) + the θ₀-membership statement (`famN_inClass` at the EXPLICIT threshold θ₀ = 1/(1024·e))** — the 4th (the bounded class-indexed ceiling GREEN) rides the wave-close | **famN_inClass's 2-line residue, BOTH fixes stated** (in `p2c-run17.log`'s provenance header): (1) `hy2`'s nlinarith atom-shape (`y^2` vs `y*y` — restate `hyy` in `y ^ 2 ≤ (1/64)^2` form or feed the `show`); (2) `hmul`'s type ascription (drop it — the lemma's own output shape needs no flip). CLEARED at run 17: t4_not_littleO (fully), both `one_div_le_one_div_of_le` arg-shape sites, the `neg_neg` class. **The ADJUDICATED `BkClass`-NONNEG definition of record** (`CertValidClass`/`BkClass` carry `(∀ j, 0 ≤ a j) ∧ …`, the 78-class correction pattern) — **FINDING #5** = the BkClass degeneracy (degenerate both ways: point-mass triviality + negative-coefficient unboundedness) + the adjudicated correction; **FINDING #6** = the explicit membership threshold θ₀ = 1/(1024·e) (the precharter's marginal-θ caveat made precise; the window geometry y = |u|·L/2 ≤ 1/64 vs the MGF budget is the binding constraint). Dossier-74 amendment drafted for H (`dossier-74-amendment-p2c.md`). Sweep: guard → 4425be89, verdict class honest-partial until the wave-close GREEN |

*Fold note (R1, 2026-11-19): bytes verified on main @ b611a25; the G2 GREEN row (run 11,
P2-a/P2-b) and the G3 PASS content stand — this row extends the pilot's state to the
P2-c park. Certificate UNCHANGED 52+0.*

**41-H — TRANCHE 1+2 COMPLETE; the (H) program BANKS AS THE SECOND DISCOVERY (R4,
landed batches D+P; folded R1 unit 13, 2026-11-19):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 41-H tranche 1 (R4) | `pilots/41/H1.lean` `283503ada8f5571e`, 455 LoC, 22 decls all public | the tranche-1 run set (`H-record.md` §runs; GREEN per batch-D) | **GREEN — transports + the TRACIALITY OBSTRUCTION banked**: `sigmaQ_asym_witness` [propext] (σ_q(100,110) = 1 ≠ −1 = σ_q(110,100) at q = −1, kernel decide) + `tracial_realizability_refuted` [propext, Quot.sound] (NO tracial evaluation can realize σ_q on w-word products — traciality forces symmetry, the witness breaks it) | **Consequence banked for tranche 2:** Markov/Hecke-TRACE-per-word realizations IMPOSSIBLE; the (H) dictionary must be NON-tracial (tangle/Kauffman-bracket — the dossier's skein phrasing; kills the naive closure-trace reading). Own-file bookkeeping honored (H1/H-record/logs/article stub separate from 41-core's files); on-tauceti-pin #print axioms DEFERRED per the no-consumption rule |
| 41-H tranche 2 (R4) | `pilots/41/H2.lean` on-disk `3bc8170121492d18` = FIRED `9534383949a6ac0c` + comment-only status note (inert-delta class) , 373 LoC, 18 decls all public | `logs/h2-run11.log` (the granted confirm; 11 runs total; 0 errors, 0 sorry) | **GREEN — the complete obstruction theorem (Walsh certificates → expansion → no-go) kernel-proved: the certificates `sigmaOrth` + `sigmaExpand_basis` [propext]×2 (σ-table orthogonal rows ⟨r_p,r_p'⟩ = 8δ; basis-expansion 8e_{b₀} = Σ⟨r_p,e_{b₀}⟩r_p, both kernel-decide over ℤ) + `sigmaExpand` + `rank_obstruction_nogo` triad** (realization factors as C·Φ·Cᵀ with rank ≤ 5 → contradiction) | **TRANCHE-3 RULING: BANK-AS-NEGATIVE — the (H) program banks as the SECOND DISCOVERY, negative-kind, quota-free; the dossier's 3-strand [HYPOTHESIS] is CLOSED FALSE** (the dictionary needs ≥ 4 strands, TL₄ dim 14; the n≥4 deferred seed recorded). Elaboration finding: `Rat.add`/`Rat.div` are extern-opaque to the kernel on v4.36.0-rc2 (decide must avoid ALL ℚ arithmetic). LoC at cap 805/1455 ✓, runs at cap 10/10 → STOP invoked, confirm granted as run 11 |

*Fold note (R1 unit 14, 2026-11-20 — the queued 41H-T2 fold, byte-verified on main):
H1 `283503ada8f5571e` (455 LoC, **22 theorems all public**; audit surface = the
tranche-1 pair at `h1-run2.log:58–:59`, wall 41 s, OVER=0) and H2 on-disk
`3bc8170121492d18` (373 LoC, **18 theorems all public** — `:19`'s "theorem forces v = 0.
Contradiction" is prose inside the design comment, NOT a decl; audit surface = the 4
prints at `h2-run11.log:45–:48`, wall 63 s, **OVER-mem 1 sample = the documented
mmapped-olean class** [anon=0, max_cpu 0.56/2.0]) both verified at batch-P `c25bf25`
2026-11-19; H-record `f21b07f375d40d23`. **SHIP EVENT post-dating the unit-13 draft:
the article SHIPPED at SPLICE-2 `cc71841` 2026-11-19** (kind NEGATIVE discovery-grade
quota-free per the bank-as-negative ruling; README counts 7→8; R2's S1–S4 4/4 pass
`ace8bd28` rode batch-R; R9's §NEGATIVE = the battery FINAL v2 `17970d4b`). Sweep:
AxPilot41_H1/H2 rows ACTIVE (the unit-13 TARGETS adds); guards = main bytes
(283503ada / 3bc81701, the inert-delta fired+comment-only class for H2).*

**41-H3 — the n≥4 TL hunt S-RUNG, GREEN FIRST-SHOT (R4, the iter-6 Tier-1 seed fired
early; worktree-of-record agent-08 2026-11-20, main-side at H's landing — bytes
verified this pass; the n≥4 deferred seed from the 41H bank ruling EXECUTING):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 41-H3 S-rung (R4) | `pilots/41/H3.lean` `833dcff84309c986` (fired = on-disk; 465 LoC, 27 theorems, 0 privates) | `logs/h3-s-run1.log` `6dc794e7a27d8565` (run 1 of the 3–5 budget; wall 62 s; doz CLI, warm crossmath-probe, SPEC 2cpu/4GB, threads=2; **OVER-mem 1 sample = the documented mmapped-olean class** [8,296 MB, anon=0, cpu 0.67/2.0] — dispositioned in-log, no investigation owed) | **GREEN first-shot — H3.lean OK, errors=0, sorry=0: the dim-7 obstruction kernel-proved. Audit 11 prints: `sigmaOrth`/`sigmaExpand_basis`/`sigmaOneOrth`/`sigmaOneExpand_basis`/`sigmaOne_asym_witness` [propext]×5 (the σ-table certificates + the σ₁-witness, kernel-decide over ℤ) + `tableExpand`/`sigmaExpand`/`sigmaOneExpand`/`table_rank_nogo`/`no_realization_dim7`/`no_realization_dim7_one` full-triad ×6** (3 deprecation warnings only — if_neg/if_pos, in-log) | **Class = the n≥4 TL hunt S-rung** (the 41H bank ruling's deferred seed; novelty pre-cleared by R9 round-7 `87659f58` — TARGET-C/D NEW-narrow; precharter `60278bd4b6e824bf`). 16 unprinted theorems → AxFC custody at sweep (the §10.9 print-gap class). Step-B: AxPilot41_H3 row ACTIVE in make_axcheck (guard 833dcff8); classifier ENTRY fires at H's landing commit (the ENTRY-4 precedent — worktree-side until then) |

**75-N2 SLOT-1 SALVO — P2-b + P2-c CONFIRMED GREEN · P3-COMPLETE (the composed N2-d
card) · the N3 full-coverage audit GREEN (R6 units 9–10, worktree-of-record agent-06,
2026-11-19/20, landing via H — every sha + verdict byte-verified this pass by R1 unit
16; the iter-6 census SEED #1 CLOSED):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 75-N2 P2-b (R6) | `pilots/75/N2-P1.lean` `396d8710d9084388` (disk = input sha at fire AND after — the parked state unmoved; lands as HEAD via H) | `logs/n2-p1-run31.log` (FIRE-ONCE confirmation; **the dead salvo fire's verdict recovered from the preserved logs** per the relay — log provenance header carries the guard; wall 52 s, 0 samples, no over-flags) | **CLOSED GREEN 17/17 triad-clean, 0 sorry — `eulerStripImmunity_changeLevel` CLOSES; `lFunction_not_eventually_zero` re-confirmed triad; P2-b COMPLETE (16/17 → 17/17); loop 11→6→4→2→0 over runs 27–31, the two post-r30 fixes the last mechanical tail, ZERO math defects; `HasEulerStripImmunity` is now a THEOREM** | R1's independent parse: 47 distinct names printed in-run, ⊆-triad throughout, 0 sorryAx. The two post-r30 fixes (header): the hoisted positivity `hp0'` (:883 by-linarith) + the root `analyticOrderAt_eq_top.mp` (:918 Exists-whnf dot trap). Downstream unblocked: P2-c's imprimitive composition + the P3-e hEχ slot. GIT_BYTES_OVERRIDES: the run-26 pin DROPS at H's landing (HEAD becomes the verified 396d8710 bytes — the row's own drop-at-sweep-iff-HEAD rule) |
| 75-N2 P2-c (R6) | `pilots/75/N2-P2c.lean` `2cca447d7c2a29c8` (R1's drift-table sha WAS the GREEN-in-progress state; full sha guard in-log :8) | `logs/n2-p2c-run{4..8}.log` (the confirm took 3 more fix rounds; run 8 = the closing fire, wall 96 s, cpu 0.89/2.0, one OVER-mem sample 5,798 MB = the §Modal-5 mapped-olean artifact) | **GREEN 11/11 triad-clean, 0 sorry — `thmE_dyadic_to_cumulative` CLOSES (the dyadic→cumulative bridge: window splits + doubling chains + the minimal-K archimedean choice + the hUnb tail absorption, ALL kernel-verified); fix-loop runs 4–8 = 7→1→6\*(unmasking)→1(misattribution corrected)→0, ZERO math defects** | **The hUnb binder STAYS (Titchmarsh §5.8 / Davenport ch.9, NAMED — the dossier's honest set)**; R1's parse: 56 distinct names, ⊆-triad, 0 sorryAx. Downstream: the P3-e hEχ premise's PRIMITIVE members dischargeable; imprimitive members compose with run-31's eulerStripImmunity_changeLevel. The parked-unfired tally row CONVERTS (NOT-GREEN → GREEN) |
| 75-N2 P3-d V2-side (R6) | `pilots/75/N2-P3V2.lean` `2613cfd241ec207f`, 314 LoC (imports ZetaZeros — the V2 donor tree) | `logs/n2-p3v2-run3.log` (GREEN; the ZetaZerosV2 donor tree BUILD rc=0 in-run, 175 progress marks) | **GREEN — P3-d DISCHARGED: `zetaColumn_of_V2` + `epsLowerCum_zeta_of_V2d4` + `epsLowerCum_transfer` + `two_thirds_le_d4` + `V2d4_endpoint` ALL triad; 0 sorry; the donor endpoint `ZetaZeros.simple_proportion_d4` RE-PRINTED triad in-run (:169)** | **DONOR-TREE class** (verdict of record = the run log + `axcheck-n3v2-run1.log`, the M4b/zzv2-P1 cited precedent — NEVER a plain Step-B stage); R1's n3v2 parse: 18 distinct names ALL exactly triad, incl. **the ℚ endpoint `zetaL_two_thirds_landed_ℚ`** (the FOREVER binders `hfinζ`/`hntopψ` named in-file) |
| 75-N2 P3-e composed card (R6) | `pilots/75/N2-P3e.lean` `6f6beb2065c2c511`, 86 LoC, 2 public theorems (imports N2P3 ONLY — the pure plain-side chain, NO V2 import per the substrate split: hζ/hEχ enter as PREMISES) | `logs/n2-p3e-run1.log` (GREEN FIRST-SHOT; inputs all run-verified: Pa `d61eb048` + N2P0 `1cf5cbe2` + N2P1 `396d8710` (= run-31 GREEN) + N2P3 `f9bd28c5` (= n2-p3-run3 GREEN)) | **GREEN FIRST-SHOT — `zetaL_two_thirds_landed_of_DZDF` triad: the card `ZetaLRatTwoThirdsOfDZDF` (N2-P3.lean:206) DISCHARGED as a pure application chain (P3-b + P3-c + P2-a + the P0 engine landing `zetaL_rat_two_thirds_landed` + the inline plain-side ζ-column transfer) + `epsLowerCum_transfer_plain` triad — P3-COMPLETE** | The composed N2-d card: the DZDF-donor route to ζ(2/3)-rationality, kernel-verified with the V2-side discharges as named premises (the substrate split = the honesty device: what is plain-side is PROVED, what is V2-side is PREMISE-honest). **The iter-6 census seed #1 (N2/P3-d, pre-certified strongest) CLOSED by this landing** |
| 75-N2 N3 full-coverage audit (R6) | the 6-file chain as Ax-stages (Pa + N2P0 + N2P1 + N2P3 + N2P2c + N2P3e; dependency-order olean elaboration; COMPLETE-output custody, F1/F3b — no excerpts) | `logs/axcheck-n3-run1.log` (sources of record at stage time: Pa `d61eb048`, N2-P0 `1cf5cbe2`, N2-P1 `396d8710`, N2-P3 `f9bd28c5`, N2-P2c `2cca447d`, N2-P3e run-1 GREEN; app crossmath-pilot-75, doz CLI, SPEC 2cpu/4GB, threads=2) | **GREEN — scan 358 records, 0 sorryAx** (per-stage: Pa 170 / N2P0 32 / N2P1 92 / N2P3 12 / N2P2c 44 / N2P3e 8 — the relay's breakdown, arithmetic-exact); forbidden-token gate 0 hits over 7 files; sorry-classifier clean | R1's independent parse of the log: **125 distinct names, ⊆-triad throughout** (2 genuine ⊆ cases: `exists_mul_inv` + `pos_of_isUnit` at [propext, Quot.sound]; zero sorryAx; the wrap-glue artifacts of naive single-line greps noted — the L3 lesson holds). **The chain's full-coverage audit EXISTS AHEAD OF THE SWEEP — the close sweep CITES this log** (the pb-run11/M4b cited-class precedent), the TARGETS rows below stage the plain files only |

*Fold note (R1 unit 16, 2026-11-20): all six shas byte-verified at R6's worktree-of-record
(agent-06) pre-landing; rows become main-side at H's commit, where the classifier ENTRY
fires (ENTRY-4 precedent). Tally: the parked row 18 CONVERTS (NOT-GREEN→GREEN) + the
P3-complete family extends (rows 6/14 stay GREEN; new P3-d/e row GREEN) — see
`tally-section11-manual.md`'s refreshed count. Ledger §11's 75-N2 cell fills from this
block (one citing line; the ledger never re-derives). Templates: SLOT-1/2/3 EXECUTED
(`r1-verdict-fold-templates.md`); the P3-COMPLETE skeleton slot
`[P3-COMPLETE-STATE]` fills from the P3-e row.*

**AL M3 — NOT-GREEN at cap, honest-partial PARK (R8's final rung, worktree-of-record
agent-05 2026-11-20, landing via H — every sha byte-verified this pass, R1 unit 17;
park shas P0 `33c759420ad65598` / A1 `a8feb25bcd60722f` / A2 `221eb30b6debba75`;
record `M0-record.md` `6718ec201bb51cbc`):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| AL-M3 (R8) | `pilots/al3d/A2.lean` @ `221eb30b6debba75` (2,011 LoC; the M3 content = the rung-stone `slab_column_cuts_of_planar_var` + `regionEntropy_pureState_column_closed` + support layer V, AUTHORED in the parked bytes) + `P0.lean` @ `33c759420ad65598` (the orchestrator-approved find-#6 P0 amendment + the run-6 post-fixes pre-applied; **fired bytes were `2d84a3caf8d0d26f`** — the parked P0 is post-fix) + `A1.lean` frozen `a8feb25bcd60722f` | `logs/alp2-m3-run{1..6}*.log` (run 6 = the CAP fire, `alp2-m3-run6-final.log`: wall 31 s, telemetry OVER=0; sha-guarded, guard file cited in-header) | **NOT-GREEN at cap → PARK, honest-partial per D7: P0 FAIL rc=1 errors=2 — the amended body's last pair, (a) `:184` PURE ORIENTATION (a one-token `.symm`; sum_congr orients ptrace-side = product-side) + (b) `:205` the pinned `rw [hq …]` kabstract mismatch (invisible implicit divergence; displays identical up to bound names); A1/A2 FAIL rc=1 errors=1 each = PURE CASCADE (P0's olean never built — unknown-module-prefix imports) — A2's own content NOT re-audited in run 6, the M3 decls' triad status UNVERIFIED (zero prints). Descent 27→13→11→2→2 over 6 fires (3 unit-budget + completion grants), ALL-mechanical error classes (named-args, implicit signatures, simp shapes, orientation, rewriter-matching), ZERO math defects** | **The M0→M2 verified surface STANDS untouched: 89/89 exactly triad @ `61af175a` (batch-Q, log-cited) — the ladder's closed rungs are history, not reopened.** Both residual fixes PRE-WRITTEN (the `.symm` token; the `refine (hq … x) ▸ ?_` transport replacing the rewrite) and are IN the parked P0 bytes — **iter-6 inheritance = ONE fire at the three parked shas (R8's stated first action)**. The cap ruling HELD (no third grant). **The `set_option linter.all false` diagnostic NOT lifted** (1 hit in the parked A2 — carried into the park; lifts at iter-6's fire per record note i). Guard: AxPilotAL3D_A2 → `221eb30b` with verdict class HONEST-PARTIAL (the 74-P2 parked-guard precedent: the guard tracks the committed closing bytes; the M2-GREEN state stays log-cited); the P0 compile-only dep stage re-cites the amended sha |

*Fold note (R1 unit 17, 2026-11-20): byte-verified at agent-05 pre-landing (A2/P0/A1/
record shas + the run-6 verdict block re-read; the fired-vs-parked P0 distinction
recorded above — the relay's "P0 33c75942" is the POST-fix park, the fire was
2d84a3ca). Tally row 12 SPLITS per the template's NOT-GREEN variant (the
L3-corrected-block precedent): the family class → honest-partial with the M0→M2
GREEN surface named in the note. The close waits on R5 alone (slots 4/5).*

**η-PORT RUNGS 2+3 EXITS GREEN · RUNG 4 PARKED — the FOLD QUEUE DRAINS (R5's final
salvo, worktree-of-record agent-04 2026-11-20, landing via H — every sha + verdict
byte-verified this pass, R1 unit 18; the amended port ledger's CEILING RUN 13 of
12–13, stop-loss honored):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| zzv2-λ rung 2 (R5) | `pilots/zzv2-lam/eta-r2.lean` `a9c6b59f8a769335` (661 LoC) | `logs/eta-r2-run9-eta-r3-run6-eta-r4-run4.log` (the ceiling fire; DONOR-TREE class — elaborated INSIDE the built ZetaZerosV2 tree, 8,262-job build rc=0 in-run; walls 421–725 s across the session, max_mem ≤ 3.3 GB, OVER-cpu = the standing pre-taskset burst + donor-build class, dispositioned in-record investigate-not-upgrade) | **RUNG 2 EXITS GREEN — strict-OK 4/4, ALL exactly triad** (prints verified incl. one multiline-wrap): `cutoffSelfConvLam_eq_scaled_dilate` (**lemma A = the amendment-2 (ii-c′) FINDING's theorem, the six-fire blocker, kernel-proved**) + `cutoffTestLam_isAdmissible` + `cutoffSelfConvLam_isPairTestFunction` + `iteratedDeriv_two_cutoffSelfConvLam_isPairTestFunction` | **FALSIFIED-THEN-EARNED fire history (folded honestly): the dead salvo fire's expected 4/4 was FALSIFIED — the parked `38bb8463` fix-batch came back RED on the first re-fire (port-run 9: 7+7 errors, the record's own falsification note); five fix-batches to GREEN** — log descent 10→7→4→2→2→OK (log-runs 4–9 = port-ledger 8–13). The whnf bomb (below) was the six-fire blocker |
| zzv2-λ rung 3 (R5) | `pilots/zzv2-lam/eta-r3.lean` `21fb0c4e45f88b92` (307 LoC) | same log (the ceiling fire) | **RUNG 3 EXITS GREEN — strict-OK 2/2, ALL exactly triad**: `pairMainTerm_cutoffSelfConvLam` (**the corrected (iii′) covariance — the amendment-2 falsity's corrected form, kernel-proved**) + `scaledConstLam_half` (**the λ=1/2 bit-for-bit regression anchor** — the rung-1 checkpoint discipline extended) | Same falsified-then-earned history (7 errors at the first re-fire → GREEN at the ceiling). The amended precharter's corrected (ii-c′)/(iii′) forms are now BOTH theorems — the amendment's FINDING fully discharged at rungs 2–3 |
| zzv2-λ rung 4 PARK (R5) | `pilots/zzv2-lam/eta-r4.lean` `06ad527f00d3a30c` (808 LoC; the pure public-layer transport) | same log — eta-r4 FAIL rc=1 errors=10 sorry=0 | **PARKED-unfired → honest-partial per D7: GATED at T2/T3 by a batch-9 SYNTAX SLIP alone (`set_option … in` placed BETWEEN a docstring and its declaration is invalid — parser recovery dropped BOTH heartbeat boosts; the div-lemma + T3 re-hit their whnf budgets; 8 of the 10 errors pure cascade; ZERO math defects). Fix-batch-10 PARKED UNFIRED per the 13-run stop-loss (the set_options repositioned BEFORE their docstrings, placement verified :206/:448/:525)** | **iter-6 first-action candidate: ONE fire at `06ad527f00d3a30c`** + three decoded residual routes in `eta-r4-record.md` `8926d6886460128f` ((a) fire it; (b) the hsplit :615 `div_const` metavar — spell the divisor explicitly, `_` elaborates to a metavar before goal-matching; (c) the :595 show-block — mirror the donor's `Zeta/Kernel.lean:383–397` text character-for-character). The port ledger CLOSED at its amended ceiling (13 of 12–13) |

*Fold note (R1 unit 18, 2026-11-20): all shas byte-verified at agent-04 (r2 a9c6b59f /
r3 21fb0c4e / r4 06ad527f / record 8926d688; the six triad prints re-read in the
ceiling log — one wrapped multiline, parsed accordingly). **STANDING LESSON-CLASS
(reference, the record's own rules — `eta-r4-record.md` §1–2, the port-ledger note):
the REAL-MUL WHNF BOMB** — `integral_mul_const _ _`'s metavars unified against a
constant-on-the-LEFT integrand explore the wrong (?f := const) decomposition through
Quotient-Cauchy real mul (the diagnostics table: HMul.hMul 3,374,473 / Mul.mul
3,333,908 / Quotient.map₂ 2,369,789 / Real.rec 1,463,868 unfoldings); the KILL =
SYNTACTIC ORDER-AGREEMENT (state hint + calc steps with the constant on the RIGHT);
rule: never hand `integral_mul_const _ _` a constant-on-the-left goal. Companion: a
"no goals to be solved" tactic firing POISONS with sorryAx (error-recovery class —
the L3/A2 sorryAx-from-errors mechanism, independently re-confirmed). Both live in
R5's record rules; flagged here for the close-block's lessons line. Tally: row 19
CONVERTS (r2+r3 GREEN) + the r4 PARK row adds as parked-unfired. **THE FOLD QUEUE IS
DRAINED — every §11 row is at its closing state; the close act's gates may execute.***

**AL M2-b CLOSURE + the M2-c KEYSTONE — the M0→M2 ladder kernel-verified (R8 unit-9,
landed H batch-Q @ `a175b1d` 2026-11-19; folded R1 unit 14, 2026-11-20, byte-verified
against main — this REPLACES the pre-termination unit-13 narrative draft, correcting
its run-7 wall (57 s, not "71–82") and the M2-b row's fold-unit attribution (the
unit-9 fold, not 12); the unit-9 M2-b honest-partial row CONVERTS; A2 guard
`9706196c` → `61af175aae141aa9`, 1,606 LoC, audit surface 89 decls = 86 pub + 3 priv):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| AL-M2-b (R8) | `pilots/al3d/A2.lean` @ `61af175aae141aa9` (`regReindexEquiv_compl_iff` :1372, bisected into fwd :1271 / bwd :1310; `colEquivVar_swap` :1390) | `logs/alp2-m2c-run7-unit9-bisect.log` (the DIAGNOSTIC bisect fire, wall 57 s, OVER=0) + `logs/alp2-m2c-run8-unit9b.log` (the closure fire, wall 71 s, max_cpu 0.61, OVER=0; app ap-Ps16VMJRnkCahWRFyFhbdZ, doz CLI, spec 2cpu/4GB held) | **CLOSED GREEN — the parked pair `regReindexEquiv_compl_iff` + `colEquivVar_swap` BOTH triad** (run-8 log :200/:201/:272/:273 = fwd/bwd/iff/swap, all `[propext, Classical.choice, Quot.sound]`; re-printed in run 9's full audit) — the unit-9 parks resolved; no live-claim rider remains | **The bisect answer = the SUPPRESSED-ERROR-IN-FUSED-IFF mechanism — standing lesson (h-wave4-log batch-Q)**: the invisible-sorryAx root was compl_fwd's `haf` `.trans`-on-membership error, SUPPRESSED while fused in the iff (invisible to four full-output runs AND the widened `: error(` filter); exposed only by the fwd/bwd split (run 7); MECHANICAL fix (the pre-written rw-form). Run-8 precision: A2 rc=1 errors=1 = the UNRELATED sum_submatrix residual alone — the pair's triad prints stand as their closing evidence. The fwd/bwd split decls STAY (direction-level audit hygiene, record note ii); run-7 reindent collateral (4 neighboring decls) honestly recorded, repaired in run 8's byteset |
| AL-M2-c keystone (R8) | same file (`sum_powerset_eq_sum_projFib` :1438; private helpers `sum_attach_eq_dite` :1415 / `sum_submatrix` :1428; `hamiltonianVar_eq_submatrix` :1447) | `logs/alp2-m2c-run9-unit9c.log` (wall 82 s, max_cpu 0.87, OVER=0; A2.lean OK **sorry-strict rc=0**; app ap-Qa8zOUjX9aZjdrG9VFeyvm, mathlib ff2494ea) | **GREEN — the keystone `hamiltonianVar_eq_submatrix` triad, with `sum_powerset_eq_sum_projFib` + both private helpers triad — BOTH P2-d parked targets PROVED (the extend-relabel swap AND the Hamiltonian identification, over the canonical z-rank enumeration); the M0→M1→M2 ladder kernel-verified END-TO-END** | **Whole-file census at the landed bytes (R1's independent decomposition of run 9's A2 audit section): 89/89 audit-surface decls — 86 pub + 3 priv — EVERY name exactly `[propext, Classical.choice, Quot.sound]`, 0 sorryAx** (vs the batch-B surface 83 = +6: the fwd/bwd split pair, the 2 private helpers, the sum lemma, the keystone). Regression gate held: run-13's 85-line core byte-identical; growth 26 lines all triad-only; sole subset-payload `walk_induce_length` ([propext, Quot.sound]) unchanged since run 13. Diagnostic `set_option linter.all false` LIFTS at M3's close (record note i). **M3 = the ladder's final rung** (entropy identification + the `SlabAreaLawColumnCuts3D` discharge from the `PlanarAreaLawVar` binder) |

**72-M1 L3 — v16 CLOSING STATE, BYTE-VERIFIED — with a LANDED-RECORD CORRECTION (R2
W2-4 final round, landed H batch-M; folded R1 unit 14, 2026-11-20 — this REPLACES the
pre-termination unit-13 "v16 DEEPENING" paragraph AND corrects the unit-10 v13 row's
L3c line below; T3 guard `dcda3133` → `aed631015beb38d6`, 1,046 LoC):** the unit-13
paragraph's flip claims are CONTRADICTED by the landed logs. Run 16 = the last fire of
the landed v16 bytes (source-sha-guarded in its header); R1's exhaustive
multiline-aware parse of ALL 16 `l3bd-run*` audit prints gives the certified state —
SHALLOWER than every narrative of record claims:

| decl | print history (runs 1–16) | certified state at the v16 park |
|---|---|---|
| `toGrid_star_dotProduct_self` (L3b) | triad every run 6–16 | TRIAD ✓ |
| `eig_toGrid` | triad every run 5–16 | TRIAD ✓ |
| `edgeBoundary_le_boundaryCard` | triad every run 9–16 | TRIAD ✓ (since run 9 — not the run-12 flip the records narrate) |
| `hasGlobalGap_of_fullSystemGap` (L3c) | printed runs 4–16, **TRIAD NEVER** (0 triad prints repo-wide) | CONTAMINATED — "run 12 flipped L3c / triad at close" (stop-note :111/:122, L3-record, H batch-G, the unit-10 row) is CONTRADICTED; the v16 "REGRESSION, reopened by conj→star" framing had a false premise (it never closed) |
| `isAdmissible_ΦL` | printed all 16 runs, **TRIAD NEVER** | CONTAMINATED — "run 14 flipped triad-clean" (L3-record :13, stop-note :151, H batch-M, the unit-13 draft) is CONTRADICTED |
| `hamiltonian_gridDom_eq` | printed all 16 runs, **TRIAD NEVER** | CONTAMINATED — same |
| `interface_areaLaw_uniformAreaLaw` | printed all 16 runs, TRIAD NEVER | CONTAMINATED (as recorded) |
| `submatrix_mulVec_ec` | NEVER print-audited in any log | record-only triad claim (the §10.9 print-gap class) — UNVERIFIED at print level |

Run-16 overall: P72M1T3.lean **FAIL rc=1, errors=35, sorry-warnings=0** (wall 83 s;
OVER-mem 1 sample = the mmapped-olean class, anon=0; max_cpu 1.02/2.0). The persistent
sorryAx with disk-sorry-free = the error-recovery class (decls whose proofs still fail
to elaborate), so the flip narratives were most plausibly TACTIC-LEVEL site-closures
read as certifications. **W2-4 = honest-partial at close — MORE partial than the
records state: the certified clean set is L3b + eig_toGrid + edgeBoundary (+ T1/T2/L3a
throughout); the §CHARTER-ITEM-3 next-wave input must ALSO re-derive
isAdmissible/hamiltonian/hasGlobalGap (their "solved" status was narrative, not
prints).** CORRECTION ROUTED (R1 → coordinator, 2026-11-20): R2's `L3-record.md`
`bc26418c` + `l3bd-stop-note.md` `d562b2b4` and H's h-wave4 batch-G/batch-M entries
carry the contradicted claims — re-basis owed before Iteration-6 planning consumes the
stop-note. Classifier: disk-sorry-free stands (0 real tokens; certificate 52+0 stands);
guard `aed63101` stands (the landed bytes ARE the park); sweep verdict class honest-partial, with THIS clean-set inventory as the row of record.

**74-P2-c — FINAL PARK (R3 item-2b, landed H batch-O @ `cc1c566` 2026-11-19; folded
R1 unit 14, 2026-11-20, byte-verified on main — this REPLACES the pre-termination
unit-13 narrative draft with the row-convention form; the ENTRY-12 run-17 PARKED row
CONVERTS to the final park; P2 guard `4425be89` → `531a9eb70f9871ba`, 1,489 LoC,
55 decls = 16 pub + 39 priv, +10 defs — the one-line delta vs run-18's re-park
`7393c98d` is the h4 first-chain's bare `field_simp` branch deleted):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 74-P2-c final park (R3) | `pilots/74/P2.lean` `531a9eb70f9871ba` (staged-sha-guarded; diff vs the run-18 base = exactly ONE deleted line, verified pre-fire in the log header) | `logs/p2c-run19.log` (FIRE-ONCE, salvo item 2b; wall 54 s, samples=0, within SPEC; run ledger 19 = `p2-runs1-11` [G2] + `p2c-runs12-16` + run 17 + run 18 + run 19) | **elaboration-COMPLETE, 0 sorry — NOT-GREEN at rc=1 = the audit-tail namespace placement ALONE: 13 errors, ALL at lines 1477–1489, ALL `#print axioms` resolutions failing against the ROOT namespace (the prints sit AFTER `end CrossMath.Pilot74P1` — the unit-4 assembly regression of the run 10→11-fixed class, re-introduced by the p2c body's own `end`+tail block). ZERO body errors — every Part P2 decl (mgfBound_var_sharp, t1c_sharp, famN_spectrum/varK/W/Mdev/inClass, t4_floor_achieved, t4_not_littleO, CertValidClass/BkClass) elaborates kernel-clean** | **AUDIT STATUS — HONEST: the Part P2 theorems' TRIAD status is UNVERIFIED (the axiom prints never resolved — a claim of record is elaboration-clean, NOT proof-certified; the N2-P0 erratum convention). The completion, NOT fired per the FIRE-ONCE terms: move `end` after the 13 print lines (or fully qualify) — rc=0 + the full-coverage audit then expected.** Charter item 2 CLOSED (two-fire history + **audit-pending at close = CLOSE-CHECKLIST ITEM 13**, `iter5-close-block-skeleton.md`; the audit-tail move + ONE audit fire at wave-close, R3 on the close signal; charter `40eee946` + record `aaf521b8`). G2 state of record `49b808f3` preserved log-cited (`p2-runs1-11.log`). The sweep verdict class stays honest-partial until that audit fire; guard → `531a9eb7` |

**74-P2-c ITEM-13 UPGRADE — TRIAD-VERIFIED AT RUN 20 (R3's close-signal audit fire,
worktree agent-07 2026-11-20, riding H's close commit — byte-verified R1 unit 19;
`p2c-run20.log` `6f19672eed6f8e86`): rc=0, ZERO errors, sorry=0, wall 36 s, OVER=0
(app crossmath-pilot-74p1 warm, oleans 8710 @ ff2494ea). The full-coverage audit
EXECUTED and RELEASES the PENDING status: P1's 7 + ALL NINE Part-P2 theorems —
`mgfBound_var_sharp`, `t1c_sharp`, `famN_spectrum`/`varK`/`W`/`Mdev`/`inClass`,
`t4_floor_achieved`, `t4_not_littleO` — EACH exactly
[propext, Classical.choice, Quot.sound] (R1's independent parse: 16/16 distinct
prints, ZERO sorryAx); the four #check surfaces echo clean; cosmetic warnings only
(:1360 if_neg rename + :1388/9 h4-tail notes — the run-19 residue class). ROW OF
RECORD UPGRADES: 74-P2 = G2 GREEN (triad-verified run 11) + G3 PASS + **P2-c
TRIAD-VERIFIED AT RUN 20** (the full tightness set: family-on-parabola + the
θ₀ = 1/(1024·e) membership + floor-achieved + not-littleO + the adjudicated
nonneg-BkClass). Park of record `531a9eb7`; artifact-at-fire `6c6a251f` (the park +
the pre-staged namespace move — both shas of record; P2-record `07132d938f3a7922`);
G2 state `49b808f3` preserved log-cited; 20 runs, zero math defects. Tally row 16
FLIPS parked → GREEN.**

*Fold note (R1, 2026-11-19, consolidated @ a175b1d): all five byte states classifier-
scoped — **0 REAL-TOKEN each** (certificate UNCHANGED 52+0); H2 = the inert-delta
class (fired 95343839 + comment-only → on-disk 3bc81701). *

*Footnote (R1 unit 14, 2026-11-20 — the make_axcheck TARGETS row-count METHOD, per
R2's gates dry-run relay `4e5b4854`, recorded not reconciled): the gates file's basis
line reads "63 rows at `1d0927df`" vs "53 active tuple rows at `00236246`" — a
COUNTING-METHOD DELTA, not a drift (static-tuple counting excludes the `01/port` glob
comprehension and any disabled-row filtering; R1's ENTRY-13 method counts 55 static
tuples + 10 globbed files = 65 total at the unit-13 bytes). All three numbers stand
as recorded by their methods; **count at close governs** — the close-time `order.txt`
emission is the canonical counter. No unilateral reconciliation.*

*Close-readiness pre-audit (R1 unit 14, 2026-11-20 — the wave-close checklist's
verification-row dependencies, gaps flagged early per the drain task):*
1. **Skeleton items 2–3 (tallies + census)** — DEPENDS on §11's final state. Two gaps:
   (a) `tally_section10.py` hard-splits at `## 10.` + enumerates `### 10.N`
   subsections; §11's rows are heterogeneous (three `### 11.N` headers + bolded
   paragraph-block tables) — the "adapt the section arg" note understates the work;
   either R1 normalizes §11 into `### 11.N` subsections pre-close or the tally is
   semi-manual. (b) the **§11.CENSUS companion is UNOPENED** (Instrument B cites it
   conditionally) — R1 owes the manual-part roll-up at close; basis = iter-4's
   385/386 + the 77-discharge + iter-5 landed growth (machine part via the sweep).
   **BOTH DISCHARGED 2026-11-20 (R1 pre-stage pass): (a) the tally route ruled MANUAL
   — `qa/iter4-review/tally-section11-manual.md` (the documented procedure + working
   tally; the §10 parser stays untouched — route call + reasons recorded there);
   (b) §11.CENSUS OPENED below (print-verified rows + [AT-CLOSE] slots).**
2. **Skeleton item 4 (Step-A certificate)** — READY: ENTRY ledger live (13 entries,
   52+0 basis); the sweep-time entry fires at close.
3. **Skeleton item 13 (P2-c audit fire)** — the audit-pending note rides the §11
   final-park row (landed this pass); R3 executes on the close signal.
4. **`VERIFICATION-LEDGER.md` §11** — DOES NOT EXIST yet (ledger ends at §10);
   Instrument B cites it; R1 owes it at close (the §10 precedent).
   **DISCHARGED 2026-11-20: §11 PRE-STAGE OPENED (skeleton grammar + per-pilot
   [AT-CLOSE] cells + the guards-of-record list + the TARGETS-count footnote + the
   L3-correction reference) — fills at the close signal, the §10 pattern.**
5. **Gates G2 basis refresh** (R2's file, H-shepherded — flagged, not mine): the
   ACTIVE list predates the M2/41H closures (AxPilot41_H1/H2 + the A2 GREEN verdict
   class) and the basis-line count carries the method delta footnoted above.
6. **L3 correction** (this pass): the corrected L3 block above changes the
   close-block's carried-L3 sentence basis — R2's re-basis of the stop-note should
   land BEFORE the close commit's carried-list is filled.
7. Pending verdict rows for §11 at close: P3-complete + the N2 salvo folds (R6
   re-fire), eta-r2/r3 (R5 re-fire) — the standby folds, released per landing.

### 11.CENSUS — manual per-decl triad census companion (lane R1, 2026-11-20; PRE-STAGE
closing the pre-audit's owed gap; composition conventions carry from §10.CENSUS;
refreshes at each pending fold + the close sweep — [AT-CLOSE] slots are the sweep's to
fill, never guessed here)

Basis: the Iteration-4 close basis **385/386** (§10.CENSUS (e)) **+ the 77-T2
discharge** (the 386th decl repaired and printed triad at `t2-run12.log`) → the
**386/386-equivalent starting point**; this companion counts ONLY Iteration-5 growth
beyond it, each decl exactly once at its current guard sha. Every census cell below
cites the persisted log line re-read this pass (no count from memory; print-gap and
elimination classes are flagged, never silent — the §10.CENSUS discipline).

**(a) Discharge of the Iteration-4 residual (composes onto the §10 basis, not new
growth):**

| artifact | census | evidence |
|---|---|---|
| `pilots/77/T2.lean` `e70baf22d9ae220e` | **8/8 top-level triad** incl. the formerly-tainted `isDegreeBlock_iff_sum_blockProj` | `t2-run12.log` (sorry-strict; the §11 77-T2 row) — the iter-4 1/386 residual CLOSED |

**(b) Iteration-5 landed growth — print-verified rows (by FILE, at the guard sha of
record):**

| artifact (guard sha) | census (triad/printed-surface) | evidence | gap class → who fills |
|---|---|---|---|
| `pilots/77/T1.lean` `70d7e9f75e705303` | **8/8 top-level triad** | `t1t2-run11.log` (donor-pin runner, tauceti @ d92acc5c) | 40 privates → AxFC custody at sweep (DONOR-PIN class, plain-batch FAIL by design) |
| `pilots/41/Core.lean` `733b4a2d93a84689` | **30/30 top-level printed** — 4 deciders at zero axioms (⊆-triad) + 26 triad-or-leaner, 0 sorryAx | `core-run9.log` (fired `921bc43cbd06d252`) | NONE — 31 decls all public, Step-B tail = full coverage |
| `pilots/41/H1.lean` `283503ada8f5571e` | **2/2 printed** (the tranche-1 pair: `sigmaQ_asym_witness` [propext], `tracial_realizability_refuted` [propext, Quot.sound]) | `h1-run2.log:58–:59` (wall 41 s, OVER=0) | **20 unprinted theorems** → AxFC custody at sweep (print-gap class, §10.9 precedent) |
| `pilots/41/H2.lean` `3bc8170121492d18` (= fired `9534383949a6ac0c` + comment-only) | **4/4 printed** (`sigmaOrth` [propext], `sigmaExpand_basis` [propext], `sigmaExpand` triad, `rank_obstruction_nogo` triad) | `h2-run11.log:45–:48` (wall 63 s; OVER-mem 1 = mmapped class, anon=0) | **14 unprinted theorems** → AxFC custody at sweep |
| `pilots/al3d/A2.lean` `61af175aae141aa9` | **89/89 audit-surface ALL exactly triad** (86 pub + 3 priv — R1's independent decomposition) | `alp2-m2c-run9-unit9c.log` A2 section (sorry-strict rc=0) | M0→M2 full coverage in-run; **M3-parked `221eb30b` (2,011 LoC) = authored-not-closed — the M3 surface UNAUDITED (run-6 cascade; triad UNVERIFIED, zero prints) — iter-6's one fire at the parked shas re-opens the audit** |
| `pilots/75/N2-P1.lean` `396d8710d9084388` (run-31 closing bytes, lands as HEAD; the run-26 `ce6719c8` pin DROPS at landing — HEAD = verified) | **17/17 P2-b surface triad** (15/15 run-26 core re-verified in-run; 47 distinct names printed, ⊆-triad, 0 sorryAx) | `n2-p1-run{26,31}.log` | 13 privates → AxFC custody direct-prints at sweep; the N3 audit already carries N2P1 at these bytes (92 records) |
| `pilots/75/N2-P3.lean` `f9bd28c5f8f7c3d2` | **3/3 publics triad** (P3-a/b/c) | `n2-p3-run3.log` | the composed headline + P3-d = **DISCHARGED 2026-11-20** (P3-d V2-side + P3-e plain-side rows below; the composed card triad; P3-COMPLETE) |
| `pilots/zzv2-lam/eta-r1.lean` `5b04304a53a5b849` | **6/6 strict-OK triad** (7 decls = 6 pub + 1 priv) | `eta-r1-run3.log` (DONOR-TREE class — verdict of record = the run log, zzv2-P1 precedent) | none beyond the donor-tree convention |
| `pilots/10/M-arc.lean` `7addcf0029ea06e7` | **+1 Part M theorem over the embedded L5 basis** (`exists_tm_padded_space`, hv SUPPLIED-AS-BINDER; rc=0, 0 sorry) | `marc-run1.log` GREEN r2 | SINGLE-ANCHOR class: L5 verbatim inside (= §10.26's 45/45 + C2-swept carries, NOT recounted); 41 privates + 281 carry → custody at sweep |
| `pilots/72-M1/P72M1T3.lean` `aed631015beb38d6` (v16) | **printed 7: 3 triad + 4 sorryAx** (the corrected L3 block's table = the census of record: L3b since run 6, eig_toGrid run 5, edgeBoundary run 9; hasGlobalGap/isAdmissible/hamiltonian/interface NEVER triad in any print) | `l3bd-run16.log` full audit (FAIL rc=1 errors=35 — sorryAx = error-recovery) | `submatrix_mulVec_ec` NEVER print-audited (print-gap); the unprinted remainder → custody at sweep; **L3-INTEGRITY CORRECTION governs (r3-tables §11 corrected block; R2 re-basis owed)** |
| `pilots/74/P2.lean` `531a9eb70f9871ba` (final park) | **triad prints UNRESOLVED at the park** (rc=1 = the 13-line audit-tail placement alone; 0 body errors, 0 sorry) — G2 state of record `49b808f3`: P2-a/P2-b publics triad + P1 heritage (7 pub + 24 priv elim, §10.31) | `p2c-run19.log` + `p2-runs1-11.log` | **whole-file triad VERIFIED at run 20 (item 13, 2026-11-20): 16/16 distinct prints exactly triad, 0 sorryAx — `p2c-run20.log` `6f19672e`** (park `531a9eb7` + the staged tail-move artifact `6c6a251f`) |
| `pilots/liu-bnew/P0.lean` `20ac66718a932e6c` | **2/2 bridges triad in-run** | `p0-run2.log` GREEN r2 | statement-layer — NEVER a Step-B stage (probe class, (d)) |
| `pilots/41/H3.lean` `833dcff84309c986` (S-rung; worktree-of-record, main-side at H's landing) | **11/11 printed** (5 × [propext] certificates + 6 × full-triad) | `h3-s-run1.log:53–:63` (GREEN first-shot, errors=0 sorry=0, wall 62 s) | **16 unprinted theorems** → AxFC custody at sweep (print-gap class) |
| `pilots/75/N2-P2c.lean` `2cca447d7c2a29c8` (worktree-of-record, main-side at H's landing) | **11/11 triad-clean, 0 sorry** (56 distinct names printed in-run, ⊆-triad, 0 sorryAx) | `n2-p2c-run8.log` (runs 4–8 fix-loop; wall 96 s, one OVER-mem mmapped sample) | N2P3V2's privates nonexistent (11 publics); the N3 audit carries N2P2c at these bytes (44 records) |
| `pilots/75/N2-P3V2.lean` `2613cfd241ec207f` (314 LoC; V2 donor tree) | **18 distinct names ALL exactly triad** (the 5 P3-d theorems + the ℚ endpoint `zetaL_two_thirds_landed_ℚ` + donor re-print) | `n2-p3v2-run3.log` + `axcheck-n3v2-run1.log` (48 lines) | DONOR-TREE class — verdict of record = the run log (cited at sweep, the M4b precedent; NEVER a plain stage) |
| `pilots/75/N2-P3e.lean` `6f6beb2065c2c511` (86 LoC, 2 publics) | **2/2 publics triad** (`zetaL_two_thirds_landed_of_DZDF` + `epsLowerCum_transfer_plain`) | `n2-p3e-run1.log` (GREEN first-shot) | plain-side only (NO V2 import — premises honest); the N3 audit carries N2P3e at these bytes (8 records) |
| `pilots/zzv2-lam/eta-r2.lean` `a9c6b59f8a769335` (661 LoC) | **4/4 publics exactly triad** (lemma A + the three admissibility/test-function decls) | the ceiling log `eta-r2-run9-eta-r3-run6-eta-r4-run4.log` | DONOR-TREE class (verdict of record = the run log, zzv2-P1 precedent) |
| `pilots/zzv2-lam/eta-r3.lean` `21fb0c4e45f88b92` (307 LoC) | **2/2 publics exactly triad** (the corrected (iii′) + the λ=1/2 anchor) | same log | DONOR-TREE class, same |
| `pilots/zzv2-lam/eta-r4.lean` `06ad527f00d3a30c` (808 LoC) | **UNAUDITED — parked-unfired** (run-13 gated at T2/T3 by the set_option-placement slip; 8 of 10 errors cascade; disk sorry-free) | same log (the FAIL of record) | ONE fire at the parked sha = iter-6's candidate first action; re-audit then. **2026-11-21 cross-note (post-revision sweep):** the parked bytes moved at `0df2546` (R5's resume payload, post-pause, NOT a referee edit) to **`285a411e48c3ad1e`** — routes (b) explicit `div_const` divisor (:616), cast cleanups (:456/:584), heartbeat insurance (:488), all PRE-APPLIED **UNFIRED**; class unchanged (parked-unfired); fire-as-is = grant-fire 2 of the ≤3 order (RESUME-BRIEF-ITER6 §SESSION END(b)1); re-audit at that fire |

**(c) Donor-pin / donor-build rows (separate composition line):** eta-pin-probe donor
hygiene **7/7 triad on-pin** (`eta-pin-probe-run2.log`, probe class below); the V2
substrate build GREEN `simple_proportion_d4` **on-pin triad** (`n2-p3v2-build1.log` —
a DONOR-BUILD row, quoted separately; the OVER-cpu samples dispositioned as the
authorized lake-build subprocess class). Adds to the §10 (c) convention, never to the
pilot census.

**(d) N/A classes (flagged, excluded from every roll-up):** probe/statement rungs —
41-P0 (`b177acdb`, 1 defl-rfl def), eta-pin-probe (`cadc838d`), liu-bnew (statement
bridges in (b) are citation-class rows, not Step-B), 41-P0's supersession pointers;
skeletons/parked-unfired — N2-P2c @ `da4c8d3f` (pillar triad PARKED, no verdict until
the salvo), the eta-r2/r3 parked pair (fold-once at their confirmation fires);
honest-park classes carry their rows in §11 proper (verdict cells there, not censuses).

**(e) Roll-up formula — PRE-STAGE (the [AT-CLOSE] slots are the close sweep's):**

```
ITER-4 BASIS:            385/386 (§10.CENSUS (e))
+ 77-T2 discharge:       +1 (the 386th, table (a))            → 386/386-equivalent
+ ITER-5 GROWTH, print-verified now (table (b)):
    77-T1 8/8 · 41-Core 30/30 · 41-H1 2/2(+20 gap) · 41-H2 4/4(+14 gap)
    · A2 89/89 · N2-P1 15/15 · N2-P3 3/3 · eta-r1 6/6 · M-arc +1
    · 72-M1-T3 3-new-clean/4-contaminated (corrected block) · 74-P2 [AT-CLOSE item 13]
  = [GROWTH-SUM — R1 re-derives at close from the rows of record]
+ SWEEP machine stages + AxFC custody print-gaps ([AT-CLOSE]: the 20+14 helpers,
  privates, submatrix_mulVec_ec, M-arc carry surfaces)
+ PENDING FOLDS ([AT-CLOSE]: P3-complete family, N2-P2c salvo, eta-r2/r3)
= [WHOLE-TREE-CENSUS] for Instrument B item 3; residual note = the L3 contaminated
  four (named) + any pending-unresolved at close (named, never blurred).
```

— census companion lane R1, 2026-11-20, worktree agent-02 (main @ `37cb520`; every
cell byte-verified this pass). Supersedes nothing; the §10 companion stays closed
history.


## §12 — Iteration-6 verification rows (lane R1, opened 2026-11-20 post-close; ship events + day-1 folds land here; conventions carry from §11)

**SHIP EVENT 1 — article-41H3 SHIPS, kind NEGATIVE discovery-grade QUOTA-FREE (the
coordinator's ruling per BANK-AS-NEGATIVE + the 78/41H precedents; the ship-gate
splice lands README row-41H3 + counts discovery 8→9, articles 16→17 via H):**

| slot | artifact (sha256(16), class) | gate evidence | verdict | note cell |
|---|---|---|---|---|
| article-41H3 SHIP | `articles/41H3-two-fiber-rank-closure.md` @ draft-final `200fa5bf` + the row-6 cosmetic delta **landed `16307eca12b46217`** (byte-verified on main @ `4dbf33c`) | **R2's S1–S4 4/4 PASS `r2-41h3-s1s4-pass.md` `14c86d28`** (gated-at `200fa5bf`, delta-noted; on main) + **R9's round-7 H3 battery `5f0b57cc` §3 — the novelty CONCUR 6/6** (relay-cited; the n≥4 TL-hunt NEW-narrow verdicts of record) | **SHIPS NEGATIVE-kind discovery-grade quota-free — the THIRD discovery shipment of the 41 program's arc (41 DISCOVERY, 41H NEGATIVE, 41H3 NEGATIVE)** | S2's audit spine = **the 11 h3-s-run1 prints** (the pilot row: H3.lean `833dcff8`, §11's 41-H3 block); the **custody-gap DISCLOSED** (16 unprinted helpers) with the **BINDING RIDER: the audit tail extends to all 16 at the NEXT H3.lean edit's fire** (a ship-gate condition, in-draft §6) — the §10.9 print-gap precedent, honestly carried. The pilot's kernel evidence: run 1 GREEN first-shot (§11 row). KPI cell: **discovery 8→9, articles 16→17 → 9/17 ≈ 52.9% — ABOVE the ≥half bar now** (the equality-only pass of iter-5 superseded) |

**SHIP EVENT 2 — article-75 v3 REVISE-IN-PLACE, then E9'd (revision-class; NO ship
added; counts/KPI untouched by the v3 itself):**

| slot | artifact (sha256(16), class) | gate evidence | verdict | note cell |
|---|---|---|---|---|
| article-75 v3 REVISION | `articles/75-abelian-assembly-zetaL-proportions.md` @ **`cb3da4ae8220d376`** (byte-verified on main @ `8680edc`; the E1–E8 apply per the editorial plan `ca753e25`; E9's README tail HELD on the pass, then released) | **R2's SPLICE-TIME S1–S4 PASS `r2-75v3-splicetime-pass.md` `74ef9e67`** (against the LANDED v3 bytes; F1 = the batch-MM N2-P1 gap, fixed at `7caddb3` pre-pass; abstract re-counted 201→200 exactly) | **REVISION-CLASS LANDED — the v3 ladder complete (v2→v3 revise-in-place; the NOT-A-SHIP standing box in-§0; E9's README row-75 tail updates the row WITHOUT touching counts/KPI)** | The v3's verification content (per the E-blocks): the §3.3 N2 discharge ledger + the honest remainder; the §6 formal-record rows incl. the N3 audit paragraph (358+48 all-⊆-triad — R1's own parses cited); the V2-import-substrate qualifier on Thms B′/B″; the §9 self-audit re-run. The pilot rows stand in §11 (74-P2 G2 GREEN + G3 PASS + P2-c TRIAD-VERIFIED run 20; the N2 SLOT-1 salvo rows) |

*Fold note (R1 unit 21, 2026-11-20): both events byte-verified against main
(`4dbf33c`: 41H3 @ 16307eca, 75v3 @ cb3da4ae, both pass files on main). The SPLICE
commits (README row-41H3 + counts; the 75 E9 tail) land via H — these rows are
splice-pending by convention (main-side at those commits; the KPI move 8/16→9/17
rides the 41H3 splice). Ledger: the KPI line added to §11's standing references (the
iter-5 close basis 8/16 = 50%-at-equality stands as HISTORY; tthe live cell = 9/17).

**DAY-1 + MILESTONE FOLDS (R3's 12-core + R8's M3 final park; R1 unit 22,
2026-11-20 — byte-verified against main @ `e4ac8dd`/`4dbf33c` before folding):**

| slot | file (sha256(16), LoC, census) | run of record | verdict | note cell |
|---|---|---|---|---|
| 12-core day-1 (R3) | `pilots/12/CORE.lean` @ the run-3 baseline `9c213eb7` (superseded by the milestone below — the descent baseline of record) | `logs/core-run{1,2,3}.log` (`66e0c2ad`/`848d394d`/`a141ca4b`; walls 63/70/76 s, cpu ≤0.69, OVER-mem anon=0 = the mmapped class) | **DAY-1 GREEN — PROBE-OK rc=0, errors=0, sorry=8; descent 3→1→0; the three verbatim donor ports kernel-clean incl. the UNMODIFIED donor proof elaborating on v4.36; `parametric_main` a real reduction + `epsParam_frozen_fiber_claim` a real projection; sorry 10→8, both remaining real** | **THE STRASSEN-FROZEN FINDING (charter-feeding): `Theorem19.exists_total_le` hardcodes `termPrime strassen n D` → the MM-generalization = a cost-analysis REBUILD; the ω_b-balance inequality is where ε(ω_b) is born — pricing-correcting feeds the charter's next refresh** |
| 12-core S-tranche MILESTONE (R3) | `pilots/12/CORE.lean` `7e40dff4dc12b6a6` (the run-9 state = current disk; the sha chain run4→9 guard-verified every fire: d3f7b5c9→acb9fe47→49dc682a→0b040ee7→5608bb30→7e40dff4) | `logs/core-runs4-9.log` (the D4-GO budget 9 fires ALL SPENT, descent 11→10→3→2→1→0; walls 38–71 s, cpu ≤0.69 within SPEC, OVER-mem = the mmapped class; app crossmath-pilot-12core) | **RUN 9 GREEN — `MMgeneral_total_sum` PROVED KERNEL-CLEAN: the donor's `exists_total_le` REBUILT with `termPrime W.MM` (the strassen slot FREED — the frozen-finding response), the ω_b-BALANCE `W.omegab + 1/12 ≤ 3 − η/18` as the EXPLICIT binder, the MM-term bound proved IN-LINE from `W.grows` × `Choice.le_root` (the rpow chain D^{3/2} ≤ n^{1/12}; n^{ω_b}·n^{1/12} = n^{ω_b+1/12} ≤ n^{3−η/18}), `ChoiceSumInputs` the explicit seam interface (MM-independent donor-derived inputs); sorry STAYS 8 — the milestone adds PROOF, discharges none (by design: the interface = the next batch's target)** | **The honest math-fix note (run 9 = THE REAL MATH FIX): the v1 claimed a FALSE direct equality — the fix = the donor's two-sided strengthening (both a- and b-sides to the COMMON (8c^η + Cb + 3)·R bound) + the Cb-nonomial nonneg facts `hcetaR`/`hCbR` the generalized constant requires.** The v4.33→v4.36 API ledger recorded in-log (natCast_le_rpow_inv_iff GONE; rpow_le_rpow 3-arg; rpow_add strict-0; mul_le_mul arg order; mul_le_mul_left′ ABSENT; zero_rpow NNReal-only). **A fresh ≤5-fire GO issued for the closing batch: the `ChoiceSumInputs` discharge + `route16_MMgeneral`** |
| AL-M3 iter-6 final park (R8) | `pilots/al3d/P0.lean` `c6752422b49555af` (the amendment + all 8 runs' fixes + the UNFIRED fixed-universe variant, sorry-free, decl-list-byte-identical) · `A2.lean` `221eb30b` · `A1.lean` `a8feb25b` frozen · record `M0-record.md` `a9d85e9e` | `logs/alp2-m3-run8-finalgreen.log` `bbafa0f4` (wall 27 s, OVER=0; **the FILENAME says "finalgreen" = the EXPECTED-outcome name — the log's own VERDICT :148 governs**) | **NOT-GREEN at the ABSOLUTE CAP ⇒ DEEP RE-SCOPING PARK: P0 FAIL rc=1 errors=5, A1/A2 pure cascade; 8 fires 27→13→11→2→2→2→1→1-root, ALL mechanical, zero math defects; the FINAL root = the universe-polymorphic-have escape (the kernel's `commitConst` level-params rejection — a KERNEL-MECHANICS class, not a tactic form)** | **The orchestrator's RE-SCOPING RULING folded in-record: M3 re-scoping QUEUED as a future iter-6 unit (NOT a completion grant) — VARIANT-1 preferred (pin the have's universe at the enclosing parameters; queued), VARIANT-2 grant-gated (needs the find-#6 grant widened beyond "3 sorry bodies"). The ladder M0/M1/M2 GREEN-triad STANDS (§11's rows); R8 → frozen standby. The §11 iter-5 M3-park row is superseded by this iter-6 final state** |

*Fold note (R1 unit 22): every sha + verdict re-read from the landed logs (the
run-8 filename-vs-verdict discrepancy recorded above — verdicts from VERDICT blocks,
never filenames). The 12-core closing batch (≤5-fire GO) and the queued M3 variant-1
fold on their reports; eta-r4 still standby.*

**WAVE-2 FOLD — AL-M3 run-9 variant-1 fire: SPLIT verdict ⇒ PERMANENT PARK (R1 unit
24, 2026-11-21; byte-verified against main `fbf91d1` via `git show` before folding —
log `f3d6a0d2a4d0a83d` and record-§run-9 `b9dad4806f9c2dd3` recomputed from the
commit's bytes; worktree branch at `ef1e7bd`, no ff performed):**

| slot | file (sha256(16)) | run of record | verdict | note cell |
|---|---|---|---|---|
| AL-M3 run-9 (R8, wave-2 item 1) | `pilots/al3d/P0.lean` `c6752422b49555af` (variant-1 pre-applied = the run-8 parked post-state, GUARD-VERIFIED pre-fire) · `A1.lean` `a8feb25b` · `A2.lean` `221eb30b` (all three unchanged post-fire; no post-fire edits) · record `M0-record.md` §run-9 (`b9dad480`) | `logs/alp2-m3-run9-variant1fire.log` `f3d6a0d2` (wall 57 s, telemetry OVER=0, app crossmath-pilot-al3d semraker, doz CLI warm, SPEC 2cpu/4GB) | **SPLIT — the variant-1 pin WORKED but the ladder does NOT close: P0.lean GREEN sorry-free (rc=0, errors=0; the run-8 `commitConst` universe root DEAD; the 9-fire universe saga runs 5–8 CLOSED at `c6752422`) + A1.lean FULL GREEN (the FIRST full A1 GREEN of the M3 era — runs 7/8 were cascade-FAIL; all printed decls triad) + A2.lean NOT-GREEN (rc=1, errors=10) ⇒ PERMANENT PARK per D5/D7 — no further M3 fires this iteration; the article-eligibility handoff does NOT fire (conditioned on GREEN)** | **A2's residual is FIRST-SIGHT** (runs 2–8 died at the P0 import; this content never elaborated): 2 mechanical statement-layer classes — `compE_entry` instance-synthesis/binder-context divergence at `A2.lean:1692` (the structurally identical P0 mirror :172–174 is GREEN in this very run) + the `colEquivVar ∘ regEquivOfEq` coercion/orientation mismatch at `:1819` — plus cascades; ZERO math defects alleged or found. **The three pureState-typed M3 theorems print WITH sorryAx** (`regionEntropy_pureState_eq`, `regionEntropy_pureState_column_closed`, `slab_column_cuts_of_planar_var` = [propext, sorryAx, Classical.choice, Quot.sound]) **while `fibre_eq_of_column_closed` IS triad-clean**; the runner's `sorry=0` summary is a FALSE NEGATIVE (backtick-form counter miss at run_pilot.py:143 — the D4 fix, template `run_p0.py` `a3976f96`, binds any future al3d runner; + the :162 display-path `": error:` trap). Ladder at park: M0/M1/M2 GREEN-triad (batch Q) + P0 statement layer GREEN + A1 full-GREEN, all kernel-verified THIS run; M3 residue entirely A2-local. Fire history FINAL 9 fires: 27→13→11→2→2→2→1→1→0 on P0. **Priced continuation (FUTURE grant only, 2–4 fires, zero statement-layer math risk — P0/A1 GREEN and untouched by any A2-local fix): the two A2 site-fixes + the two runner one-liners + re-fire the triple** |

*Fold note (R1 unit 24, 2026-11-21): folded with the post-revision integrity sweep
(`r1-postrevision-integrity-iter6.md`, same delivery). The §12 row above SUPERSEDES
the run-8 "DEEP RE-SCOPING PARK" row's queued-variant-1 cell (the variant-1 fire HAS
NOW HAPPENED — its parked-permanent outcome governs); the §11 iter-5 M3-park row
remains history. Post-revision sweep annotations landed same session: the §4
`merged_mult_of_common` 2026-11-21 cross-note (article-20 v-rev re-billing) and the
§11 eta-r4 sha-cell cross-note (parked bytes → `285a411e` pre-applied-unfired at
`0df2546`). NOTE on §12 ship-event cells: the SHIP EVENT 1/2 article shas
(`16307eca`/`cb3da4ae`) are SHIP-TIME snapshots — both articles were revised in place
by the 2026-11-21 external-referee set (`2bfe771` + `2ea25a9`); the rows stand as
landing records, the live article bytes are the v-rev.*
## §13 — Iteration-6 close verification summary (post-mortem fold; lane R1, iter-7 day-1, 2026-11-21)

The close act (commit `f0af143`, gates G1–G8 all PASS per `qa/iter6-closeout-gates.md`
EXECUTED) on the closing tree `c5eafc0`. Evidence of record, this lane's own runs:

- **G1 (Step-A certificate): 77 real-tokens over 133 files, 0 UNEXPLAINED** (49 carry
  + 7 12/P0 stubs + 7 12/CORE interface stubs + 8 H4-probe + 6 Xi-stmt-probe + 0
  H4.lean + 0 N2-P4V2; the 66 = 52−3+17 basis reproduced EXACTLY at `6306dbe`;
  Branch A — the 12-core arc closed GREEN, no further discharges). The dry-run =
  `r1-g2pool-iter6-prestage.md` §G1-DRY (fill-not-compute; the gates §G1 record
  cites it).
- **G2 Part (i) — the Step-B batch** (`feasibility/probe/logs/axcheck-iter6-close-run1.log`
  `4b9f411a`, wall 979 s, telemetry OVER-mem anon=0 = the authorized mmapped class):
  **73 stages = 68 OK + 5 FAIL, the FAILs EXACTLY the pre-declared classes** (42_M4b +
  ZZV2_etaR4 donor-tree; 77_T1 donor-pin; AL3D_A2 the run-9 park [7 sorryAx as
  predicted]; P72M1_T3 the L3 v16 park [18 sorryAx]) — ZERO other FAILs. OK stages
  all sorryAx-lines=0 except **AxPilot12_CORE: OK, 28 axiom-lines, 8 sorryAx = the
  DECLARED interface class** (7 stubs + 1 transitive consumer; run-14's rc=0
  whole-file stands; the 13-name Choice custody rider RIDES to iter-7 — full
  coverage owed at the NEXT 12-core fire, the route-15 family). Axiom census
  2314 records / 1037 distinct decls: 1856 exact-triad + 419 subset-triad + 30
  with-sorryAx (all inside the 3 declared park stages) + 9 wrap/truncation
  artifacts (clean-twin-verified or FAIL-park-confined) — **zero genuine non-triad
  on any OK stage**.
- **G2 Part (ii) — the eta donor-tree full-coverage custody**
  (`pilots/zzv2-lam/logs/axcheck-eta-fullcoverage-run1.log` `bd0eaeeb`; runner
  `run_zzv2_axcheck.py` `e008dc96`; mathlib at pin in-log; wall 687 s, the
  authorized build-phase class): eta-r2/r3/r4 ALL OK 0-sorry; **21/21 distinct
  decls EXACTLY triad, 0 missing, 0 sorryAx** — the port family's AxFC custody
  DISCHARGED.
- **Census reconciliation: 605 → 666 print-verified triad-clean (+18 donor rows)**
  — the close-out record's cell (RESEARCH.md §Iteration 6 close-out). Row-level
  basis = the §12 inventory: every iter-6 GREEN row printed triad at the batch
  (A1 44 lines first-full-GREEN; 12_CORE 20 clean of 28; H3 27 publics; H4 11;
  the N2P1 chain 33) or at Part ii (eta 21); the park/donor rows ride their
  declared classes exactly (AL3D_A2, L3-v16, 77_T1, 42_M4b, ZZV2_etaR4 →
  donor-tree verdicts of record). Arithmetic attribution of the +61 = H's
  close computation (distinct-decl instrument); no §12 row contradicts it.
- **Row-state updates the close implies (folded here, one line each):**
  1. §11 eta-r4 parked row — CLOSED by run-14 GREEN + Part-ii custody (the
     06ad527f→285a411e cross-note's fire has happened and passed).
  2. §12 SHIP EVENT shas — ship-time snapshots (annotated in-fold previously).
  3. The 41H3 16-helper print rider — **DISCHARGED at the batch** (H3 stage 35
     lines 0 sorryAx); re-arms only if H3.lean edits again.
  4. AL3D_A2 — plain-batch FAIL class CONFIRMED as declared; the iter-7 D2′(b)
     continuation grant (2–4 fires at the frozen triple) is the row's live
     next-action.
  5. The 12-core 13-name Choice custody rider — carried to iter-7 (the next
     12-core fire owes the axcheck_full sweep).
- **Iter-7 funnel continuity:** iter-7 fire rows land in a §14 opened at the first
  landed log (Ξ_K′ Stage-1 / η R7 / η R8 / route-15 dispatched day-1; the G-pool
  prestage begins on those landings — same recipe: enumerate → stage map → guards →
  payload-moved flags → batch command lines; the runner one-liners per D5′ bind all
  new runners).

— folded by lane R1 (verification-integrity), worktree agent-02 @ `d429d19`,
2026-11-21. Iter-6 verification duty CLOSED; iter-7 standby active.
