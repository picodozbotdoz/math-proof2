# r9-novelty-verification-iter6-round2 — the 2026-11-21 post-referee novelty-posture pass + the Tier-1 seed absence re-verification

Lane R9 (worktree agent-09), 2026-11-21, Iteration 6 (resumed session). Mandate: (1) verify
the 17 referee-revised articles (commits `2bfe771` + `2ea25a9`) still carry a defensible
novelty posture — table present, ≥2 nearest-miss rows, rows valid against the CURRENT corpus
state; (2) re-verify the iter6-seed-census Tier-1 seeds' absence claims on decl-index-v3;
(3) record enrich clues. No Modal fires (index queries local); no commits (H lands).

**Index state (status run FIRST, per the mandate):** `decl_index_v3.py status` → all 13
corpora **SAME** vs the manifest (built 2026-11-20T15:33:48Z, 4,636,995 rows; mathlib
`ff2494ea5e`, tauceti `d92acc5c03`, openai-math `4eaee87548`, the six axiommath repos at
their bump revs; dirty `.lean`: 0 everywhere). **No rebuild trigger — none run.** The
gitignored `decl-index-v3.sqlite` lives in the main checkout
(`/home/doz/zcode-workdir/cross-math-fronttier/research/qa/`, db_sha256 `59090a46…`, matches
manifest); worktree queries ran against it read-only via `DECL_INDEX_DIR` (the worktree copy
of the script + manifest are byte-identical to main's). Semantic stage: et-v2 vectors,
731,232 (scope excludes openai-math; openai checked via BM25 `find --corpus openai-math`).
The caveat block binds throughout: every hit below got the direct-source check (`rg` in the
tree + locator read) before any "corpus X has/lacks Y" claim; AxiomMath hits are never
provability evidence; challenge/`sorry` decls are not results.

## 1. Per-article verdicts (17/17 table-present; 16 SURVIVED, 1 NEEDS-REFRESH)

All 17 articles carry a §4 "Novelty and nearest misses" table with ≥3 rows (bar: ≥2).
Corpus-facing rows were re-verified at source (locators exact unless noted). The referee
revisions were prose-layer; no revision invalidated a nearest-miss ROW; one corroboration
LINE (article 72) needs a refresh.

| art. | verdict | checks run (locators re-verified at source) |
|---|---|---|
| 01 | **SURVIVED** | 6-row table. Scope-rg re-run confirmed verbatim: `rg -il "defect\|master"` over zeta23 hits only Chebyshev/XiPrime-Coeff (prime-power-error "defect" lemmas) + `PrimeSideA/EndsNu.lean` (the "master form" bound); certificate layers `Zeta23/LinAlg/` + `Zeta23/ZeroSide/` EMPTY — exactly the re-scoped row's text. |
| 10 | **SURVIVED** | 3-row table. eth `MainTheorem` def :177–180 and `Wrap/Main.lean:115` (`countingBoundImpliesFailureOfETH`) exact; openai `visitedSpace` `SubexponentialSAT.lean:188`, `sat_polynomial_space` `Final.lean:149`, `MainTheorem`/`Feasible` `StatementCanonical.lean:37/:31` exact. |
| 11 | **SURVIVED** | 3-row table. mathlib `TM2ComputableInTime`/`TM2ComputableInPolyTime` island confirmed (`Computability/TuringMachine/Computable.lean:164/:177`). The BLOCKER fix (donor call combinators, `Lang/Calls.lean:86–125`) is claim-scope; no novelty row touched. |
| 20 | **SURVIVED** | 3-row table. zeta23 `thmA₀_N0` `Final.lean:356`, `trivial_chain` `Statement.lean:157`, `PaperInputs` `Hypotheses.lean:146–147` exact. The revised no-seam row VERIFIED: `rg "import.*(pilots/20\|Pilot20)"` over ALL of `research/pilots/42/` + `research/pilots/75/` = empty (neither imports the seam interface). |
| 22 | **SURVIVED** | 6-row table incl. the NEW M1=Mathlib row — verified: `tendsto_riemannZeta_sub_one_div` at `Mathlib/NumberTheory/Harmonic/ZetaAsymp.lean:343` (theorem line; docstring :342) exact at pin; WienerIkehara has ZERO consumers in mathlib at pin (`rg -l WienerIkehara` over Mathlib/ = the file itself only) — the first-consumer claim holds; no PNT in mathlib at pin (mention-level hits only in `WienerIkehara.lean` header credits + `Chebyshev.lean`; `NumberTheory/LSeries/` carries no PNT/Mertens file). |
| 30 | **SURVIVED** | 3-row table. `LemmaDual` `AppHalfPiecesStatement.lean:175` exact (∇ :89–90 same file). Refute1 does not touch novelty rows. |
| 32 | **SURVIVED** | 6-row table. All four donor locators exact: `Sec4_Rc_strictAntiOn` :2319, `Sec4_Rc_zero_tendsto` :2325, `Sec4_Rc_lt_epsStar` :2334, `Corollary_31` :4014 (`PaperStatements.lean`). |
| 41 | **SURVIVED** | 8-row table + EMPTY class row re-checked: semantic query (sign-rule/defect/parallelogram deformation) surfaces only the eth q=1 fiber itself (`Eight.Signs` :53, `Eight.signs` :261) + noise; no deformed-sign/defect-identity content anywhere. `FactorSet.ofBimultiplicative` `:571–576` exact. openai TL developments exist (`HarmonicArtin` in docs/OAI.lean/formalization.yaml + `TemperleyLieb` matches in `OAI/Topology/ArtinGroups/Diagrams/`; `HoneycombChords` declared). Benign kin noted: mathlib `EuclideanGeometry.dist_sq_add_dist_sq_…` (`BritishFlag.lean:70`) = the geometric parallelogram identity, no sign content (§4 below). |
| 41H | **SURVIVED** | 6 rows + 5 negative-class rows. The q=−1 scope restriction and Thm-B re-billing are claim-scope; corpus rows (tauceti TL/Jones stack, Benkart–Pérez, eth `Eight.signs`, Kauffman, openai TL, FactorSet) untouched and re-confirmed. |
| 41H3 | **SURVIVED** | 6-row table. All four 41H3-cited MarkovTrace locators EXACT (`TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean`: `spinRep` :300, `markovTrace` :460, `markovTrace_mul_comm` :476, `IsMarkovTrace.eq_markovTrace` :518); `Spin/Positive.lean:110/:117` exact (positivity + tracial-on-image). Realizability-class semantic query: EMPTY (noise only). Custody re-run (2ea25a9) strengthens the negative; no novelty impact. |
| 42 | **SURVIVED** | 5-row table. The two retractions (χ-column = port/substrate gap not open core; title withdrawn) are claim-scope. Corpus rows re-verified: ZetaZerosV2 `Main.lean:130` (`simple_proportion_d4`) / `:149` (`distinct_proportion_d5`) exact, both ζ-only by statement; `rg -il "zetaK\|zetaL\|Dedekind"` over the ZetaZerosV2 tree = EMPTY. tauceti `NumberTheory/NumberField/DedekindZeta.lean` = ideal-counting/Tauberian only (`isBigO_card_idealsLE_sub`, `exists_differentiableOn_eq_dedekindZeta_sub`) — no zero-location/proportion content (benign kin, §4). |
| 50 | **SURVIVED** | 4-row table. Refute1's pin-qualified locator exact: `completedLFunction_one_sub` at `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean:291` (ff2494ea). DZDF `Main.lean:9` = `DedekindZetaZeroFree.dedekindZeta_ne_zero` (31/32, every number field) exact. |
| 52 | **SURVIVED** (precision note) | 3-row table. `rg -l "OccupationPair\|occupation pair"` over all siblings: substantive hits still ONLY openai `OAI/Analysis/CoulombIonization/Fermionic/OccupationPairDensity.lean` (the fermion density object) — plus ONE import-only match (`FormDomain/FiniteFermionEnsemble.lean:2` imports the density module). Row substance holds (no CCR/occupation-pair axiomatization anywhere); the row's literal "found only … Density.lean" list now has an import-only second file — cosmetic, H may append "(+ one import-only match)" or leave. physlib clock: tick-moved/content-silent at the 2026-11-20 tick (census §3) — `ExchangeSign` posture unchanged. |
| 71 | **SURVIVED** | 5-row table. Weil `WeilRiemannHypothesisForm.lean:206` (`exists_zetaSeries_mul_prod_even_eq_prod_odd`) exact (path `Weil/AlgebraicGeometry/EtaleCohomology/Trace/`); tauceti `HasseBound.lean:44` (`frobeniusTrace_sq_le_four_mul_card`) + `Isogeny/Frobenius/Zeta.lean` (T-variable rational zeta of an elliptic curve) confirmed. mathlib at pin: `zetaC`/function-field-zeta 0 hits — the absence row holds. |
| 72 | **NEEDS-REFRESH** (one corroboration line; discovery posture unaffected) | Table rows hold (Kuwahara/Rényi/Beck–Schlögl/Anshu-cluster/AreaLaw2D/PEPS/30-50 — the 2D-fence narrowing touches none). BUT the formal-prior-art corroboration line "no entropy definitions in mathlib (on the pin), in the AFP, or in circuit-level Coq libraries … the entropy definition is the verification file's own" is (a) overbroad as written — mathlib at pin HAS `Real.binEntropy`/`Real.qaryEntropy` (`Analysis/SpecialFunctions/BinaryEntropy.lean`, Shannon-binary) and the topological-entropy family (`Dynamics/TopologicalEntropy/`); and (b) it scopes to mathlib/AFP/Coq and misses an IN-CORPUS formal Rényi entropy: **tauceti `TauCeti.renyiEntropy`** (`TauCeti/MeasureTheory/OptimalTransport/Wasserstein/RenyiEntropy.lean:120`, def `(N : ℝ) (m μ : Measure X) : EReal`, `S_N(μ\|m) = −∫ ρ^{1−1/N} dm`, the Sturm/CD(K,N) convention, ~300 lines of API incl. N-monotonicity at :402ff). Different object class (measures, N-parameter, no α-entropy of distributions, no quantum states) — N1's distribution/quantum monotonicity layer remains unclaimed — but the article should scope the line to "no distribution/state Rényi-α entropy" and add the tauceti file as nearest formal kin. One-line amendment + optional table row; the fence/nogo billing is untouched. |
| 75 | **SURVIVED** | 5-row table. The corpus-side re-scope ("multiplicity-counted on-line proportions beyond quadratic; 5/6-class distinct; relative towers K ≠ ℚ") verified against current corpus state: semantic sweeps (§2, seed 1) surface NO ζ_L/ζ_K/abelian-L proportion statements anywhere; the DLRT row's corrected scope (any abelian K under GRH; distinct-only 0.4585/0.2794/0.1127 for n=2/3/4) is now recorded in-row, and the surviving deltas (multiplicity-counted on-line; 5/6-class; K ≠ ℚ towers; binder-shape comparison) are exactly what the corpus absence supports. Bansal–Maji / Lamzouri-V2 / Knausgård / article-42 rows unaffected. |
| 78 | **SURVIVED** | 6-row table. mathlib `MinTropical`/`MaxTropical` `Algebra/Tropical/Basic.lean:55/:54` exact. The A2′ withdrawal is internal-billing; the nearest-miss rows (OAI proved copy `TruffetCounterexample.lean:126`, the two Truffet papers, ABGJ, Butkovič line, formal-methods landscape) are untouched by the revision. |

**Net: the referee set did not break any nearest-miss table.** The only revision-adjacent
gap found is article 72's corroboration line (pre-existing, missed by the referee too —
surfaced by the et-v2 semantic index, i.e. exactly the lane's tooling working as designed).

## 2. Tier-1 seed absence re-confirmations (iter6-seed-census)

**Seed 1 — N2 completion → P3-d + N2-d (`zetaL_rat_two_thirds_landed` / `zetaL_two_thirds_landed_ℚ`): ABSENCE RE-CONFIRMED.**
Queries (worktree, 2026-11-21): `find --semantic "proportion of zeros of Dedekind zeta function of abelian extension on the critical line simple distinct multiplicity"` → top hits = zeta23 `thmA` (the engine donor, cited), ZetaZerosV2 `onLineCount`/`simpleOnLineCount`/`distinctProportion_eq` (ζ-only endpoints, cited as the imported ζ column), DZZF `dedekindZeta_ne_zero` (zero-FREE side, not proportions), mathlib/tauceti `DedekindZeta` residue/nonvanishing lemmas (not zero-location); `find --semantic "zeros of Hecke L-function number field … positive proportion"` → DZZF Hecke nonvanishing/strip-bound lemmas + `heckeL_ne_zero` (zero-free class), zeta23 `xiPrime_simple_zeros_on_critical_line` (checked at source: `Challenge/XiPrime.lean:79` is a `sorry` CHALLENGE — the proved copy is `Solution/XiPrime.lean:25`; caveat-block class, not a competitor); `find zetaL/zetaK/DedekindZeta` exact — no ζ_L/proportion decls; `rg -il "zetaK|zetaL|Dedekind"` over the ZetaZerosV2 tree = EMPTY; openai-math BM25 ("abelian extension zeta zero proportion") = noise only. No multiplicity-counted or on-line proportion statement for ζ_L/ζ_K/any abelian L exists in the indexed corpora. The NOVEL-AS-STATED posture (round6-n2-p3-priorart) holds at the current index state.

**Seed 2 — H3, the n≥4 TL hunt: ABSENCE RE-CONFIRMED.** The precharter's corpus-NONE dim-14
fact re-verified at source: `TauCeti/Algebra/TemperleyLieb/Basic.lean:48–53` still declares
the diagram-basis/Catalan-rank structure theorem "not proved here … a separate construction"
— so dim-14 stays binder-or-cite. Realizability-class semantic query ("prescribed sign table
realizability matrix representation host algebra generator words") = EMPTY (noise only:
coding-theory information sets, SignCover reindexing). Defect-class query (§1 row 41) =
EMPTY beyond the q=1 fiber. Battery rows (TARGET-C/D class EMPTY) were swept 2026-11-20 on
the SAME tauceti rev (`d92acc5c03`, status-verified) — no corpus move since, so they stand
without re-running the external sweeps.

**Seed 3 — AL ladder M3: ABSENCE RE-CONFIRMED, with a NEW in-corpus nearest-kin lead.**
Semantic query ("three dimensional area law slab column cuts boundary entropy
identification") surfaced the arealaw2D 3D target layer at source:
`OpenAI/Statements3D.lean` carries `AreaLaw3D` :153, `SlabAreaLaw3D` :175 (Target 2,
challenge `Prop` form), `CylinderAreaLaw3D` :187 (Target 1) — all `def … : Prop` target
forms, consistent with the seed's binder posture. NEW LEAD (never evidence):
**`OpenAI/Cylinder3D.lean:574` `theorem cylinderAreaLaw3D` proves CylinderAreaLaw3D
(Target 1) in-donor** from `cylinderAreaLawOfPlanar3D` + `AreaLaw.areaLaw` at local
dimension q^h, 0 `sorry` in the file — i.e. the donor tree ALREADY contains the cylinder-3D
transport; the pilot's slab/column-cuts rung (Target-2-class, `SlabAreaLawColumnCuts3D`)
is the open side. Build state: AreaLaw2D is statement-level on our pin (G5a: Physlib
`a50684a1` not `ff2494ea`-compatible) — the transport is donor-substrate-only; the base
`area_law` exists both as `sorry` challenge (`Challenge/Basic.lean:257`) and as the
`AreaLaw.areaLaw`-wrapped form (`Cylinder3DSupport.lean:319`). openai-math proper: no 3D
area-law content (BM25 hits = DirectionalWalk probability slabs, unrelated). Seed posture
(engineering binder-discharge; discovery billing at article time) unchanged; the M3 article
should cite `Cylinder3D.lean:574` as nearest formal kin when it ships.

## 3. Enrich rows added (tracked worktree `research/qa/decl-enrich-v3.tsv`; 5 → 13 rows)

All via `decl_index_v3.py enrich add` (validated against the index; `enrich check` = all OK,
no STALE/DANGLING). `--by "r9 2026-11-21: iter6-round2 novelty verification"`:

1. `axiommath-dzzf DedekindZetaZeroFree.dedekindZeta_ne_zero` — keyword ("zero-free
   half-plane 31/32; Cureton–Thorner; every number field; the DZZF headline") — repairs the
   known et-v2 limit ("the DZZF query still fails": two-component name keeps no namespace).
2. `tauceti TauCeti.renyiEntropy` — description (measure-theoretic CD(K,N)/Sturm Rényi
   entropy of a measure; NOT the distribution/quantum H_α) + keyword ("Rényi alpha entropy;
   H_alpha power sums; entropy monotonicity…") — the article-72 disambiguation pair.
3. `axiommath-arealaw2d OpenAI.SlabAreaLaw3D` — keyword (Target-2 unproved; cylinder
   Target-1 proved by `OpenAI.cylinderAreaLaw3D`) + see-also ↔ `OpenAI.CylinderAreaLaw3D`
   (--both).
4. `axiommath-arealaw2d OpenAI.cylinderAreaLaw3D` — description (donor-tree transport
   theorem; 0 sorry; G5a donor-substrate-only caveat).

## 4. New nearest-miss candidates surfaced this pass (LEADS ONLY — never evidence)

- **tauceti `RenyiEntropy.lean`** (for article 72 / any entropy-side claim) — see §1 row 72.
- **arealaw2D `Cylinder3D.lean:574`** (for the AL-M3 article / dossier-72 follow-ups) — see §2 seed 3.
- **tauceti `NumberTheory/NumberField/DedekindZeta.lean`** (benign kin for 42/75 scope
  statements): the in-corpus Dedekind-zeta analytic layer is ideal-counting/Tauberian
  (`isBigO_card_idealsLE_sub` :109, `exists_differentiableOn_eq_dedekindZeta_sub` :154,
  `ne_zero_of_eqOn_dedekindZeta` :194) — zero zero-location/proportion content; citing it
  as the surveyed-corpus nearest formal kin would strengthen both articles' scope lines.
- **mathlib `Geometry/Euclidean/BritishFlag.lean:70`** (benign kin for article 41's class
  row): the geometric parallelogram identity itself — no sign/defect content; optionally
  citable as the classical underlay the EMPTY class row excludes.
- **zeta23 XiPrime Challenge/Solution pair** (hygiene for any future dossier-40-family
  claim): `Challenge/XiPrime.lean:79` is `sorry`; the proved copies are
  `Solution/XiPrime.lean:25/:32/:40/:48` — any "zeta23 has no proved ξ′ proportion" phrasing
  must target the Solution tree.

## 5. What H must land (worktree agent-09, branch carry-20261121-agent-09)

1. `research/novelty/r9-novelty-verification-iter6-round2.md` (this note).
2. `research/qa/decl-enrich-v3.tsv` (8 new rows; `enrich check` clean).
3. Optional surgical amendments (H's funnel, one writer each — NOT applied here):
   article 72's formal-prior-art corroboration line → scope to "no distribution/state
   Rényi-α entropy definitions" + cite tauceti `RenyiEntropy.lean:120` as nearest formal
   kin (the table itself may stay as-is or gain the row); article 52's rg row may append
   "(+ one import-only match, `FiniteFermionEnsemble.lean:2`)". No other article edit is
   indicated by this pass.

— lane R9 (worktree agent-09), 2026-11-21. REPORT ONLY; no commits; no Modal fires.
